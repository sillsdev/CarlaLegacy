/* SENTTEMP.C - function for reading sentences from analysis (.ANA) files
 ******************************************************************************
 *
 * WordTemplate ** readSentenceOfTemplates(FILE *              pInputFP_in,
 *					   const char *        pszAnaFile_in,
 *					   const StringList *  pFinalPunc_in,
 *					   const TextControl * pTextControl_in,
 *					   FILE *              pLogFP_in)
 *
 ******************************************************************************
 * Copyright 1997, 2000, 2001 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef STDC_HEADERS
#include <string.h>
#else
extern char * strpbrk P((const char * s, const char * accept));
#endif
#include "cportlib.h"

#include "template.h"
#include "allocmem.h"
#include "rpterror.h"

static WordTemplate **	ppWords_m = NULL;
static int		iWordCount_m = 0;
static int		iWordsAllocated_m = 0;
static unsigned		uiSentenceCount_m = 0;

const char szMissingWord_m[] = "\n\
WARNING: in %s\n\
AMPLE analysis file is missing the \\w field in s %u w %u\n";

/*****************************************************************************
 * NAME
 *    readSentenceOfTemplates
 * ARGUMENTS
 *    pInputFP_in    - input AMPLE analysis FILE pointer
 *    pszAnaFile_in - name of the input AMPLE analysis file
 * DESCRIPTION
 *    Read a sentence from an AMPLE analysis file into an array of
 *    word_template structures.
 * RETURN VALUE
 *    pointer to the array, or NULL if EOF
 */
WordTemplate ** readSentenceOfTemplates(pInputFP_in, pszAnaFile_in,
					pFinalPunc_in, pTextControl_in,
					pLogFP_in)
FILE *		    pInputFP_in;
const char *	    pszAnaFile_in;
const StringList *  pFinalPunc_in;
const TextControl * pTextControl_in;
FILE *		    pLogFP_in;
{
int i;
WordTemplate *wtp;
int bEnd;
const StringList * psl;

if (ppWords_m == (WordTemplate **)NULL)
	{
	uiSentenceCount_m = 0;
	iWordsAllocated_m = 10;
	ppWords_m = (WordTemplate **)allocMemory(
				   iWordsAllocated_m * sizeof(WordTemplate *));
	}
else
	{
	for ( i = 0 ; i < iWordCount_m ; ++i )
	{
	freeWordTemplate( ppWords_m[i] );
	ppWords_m[i] = (WordTemplate *)NULL;
	}
	iWordCount_m = 0;
	}
bEnd = FALSE;
while ((wtp = readTemplateFromAnalysis(pInputFP_in, pTextControl_in)) != NULL)
	{
#ifdef habMay212001
	if (    (	(wtp->pAnalyses == (WordAnalysis *)NULL) ||
		(wtp->pAnalyses->pszAnalysis == (char *)NULL) ) &&
		(wtp->paWord == NULL) )
	{
	freeWordTemplate(wtp);
	break;
	}
#endif /* habMay212001 */
	if (iWordCount_m >= iWordsAllocated_m)
	{
	iWordsAllocated_m += 10;
	ppWords_m = (WordTemplate **)reallocMemory(ppWords_m,
				   iWordsAllocated_m * sizeof(WordTemplate *));
	}
	ppWords_m[iWordCount_m++] = wtp;
	if ((wtp->pszOrigWord == (char *)NULL) && (wtp->paWord == NULL))
	{
	reportError(WARNING_MSG, szMissingWord_m,
			pszAnaFile_in, uiSentenceCount_m, iWordCount_m);
	if (	(pLogFP_in != NULL) &&
		(pLogFP_in != stdout) )
		fprintf(pLogFP_in, szMissingWord_m,
			pszAnaFile_in, uiSentenceCount_m, iWordCount_m);
	}
	if (wtp->pszNonAlpha == (char *)NULL)
	continue;
	for ( psl = pFinalPunc_in ; psl ; psl = psl->pNext )
	{
	if (strstr(wtp->pszNonAlpha, psl->pszString) != NULL)
		{
		bEnd = TRUE;
		break;
		}
	}
	if (bEnd)
	break;
	}
if (iWordCount_m == 0)
	{
	if (ppWords_m != NULL)
	freeMemory(ppWords_m);
	ppWords_m = (WordTemplate **)NULL;
	iWordsAllocated_m = 0;
	return( ppWords_m );
	}
else if (iWordCount_m >= iWordsAllocated_m)
	{
	iWordsAllocated_m = iWordCount_m + 1;
	ppWords_m = (WordTemplate **)reallocMemory(ppWords_m,
				   iWordsAllocated_m * sizeof(WordTemplate *));
	}
ppWords_m[iWordCount_m] = (WordTemplate *)NULL;
return( ppWords_m );
}
/************************************************************
 * Change History
 * 21-May-2001 hab Fixed bug which would cause it to quit reading the input
 *                 file if there was a failure.
 */
