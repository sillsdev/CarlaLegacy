/* DTBOUT.C - database format output function for AMPLE program
 ***************************************************************************
 *
 * void writeTemplate(FILE *			pOutFP_in;
 *		      const char *		pszOutFilename_in;
 *		      const WordTemplate *	pTemplate_in;
 *		      const TextControl *	pTextControl_in;
 *
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
extern int    strcmp  P((const char * s1, const char * s2));
#endif /*STDC_HEADERS*/

#include "template.h"
extern void checkFileError P((FILE *fp, const char *proc, const char *fname));

#ifndef TRUE
#define TRUE	1
#define FALSE	0
#endif

/* local functions */

static void dtbfmt P((FILE *			outfp,
					  char *			pszLabel_in,
			  const WordTemplate *	pTemplate_in,
			  int			cAmbig_in));
static void encoded P((FILE *outfp,
					   char *str));

/*****************************************************************************
 * NAME
 *    writeTemplate
 * DESCRIPTION
 *    formats results of analysis as a database.
 *    each word is a record with fields:
 *	\a   = analysis                (ambiguities and failures marked)
 *	\d   = morpheme decomposition  (ambiguities marked)
 *	\cat = final category of word  (ambiguities marked)
 *	\p   = properties              (ambiguities marked)
 *	\fd  = feature descriptors     (ambiguities marked)
 *	\u   = underlying form         (ambiguities marked)
 *	\w   = original word
 *	\f   = preceding format marks
 *	\c   = capitalization
 *	\n   = trailing nonalphabetics
 *    Ambiguities are marked as %n%ANAL1%ANAL2% ... %ANALn%
 *    Failures are marked as %0%original_word% or %0%%
 * RETURN VALUE
 *    none
 */
void writeTemplate(pOutFP_in, pszOutFilename_in, pTemplate_in, pTextControl_in)
FILE *			pOutFP_in;
const char *		pszOutFilename_in;
const WordTemplate *	pTemplate_in;
const TextControl *	pTextControl_in;
{
int		cAmbig;

if ((pOutFP_in == NULL) || (pTemplate_in == NULL))
	return;
if (pTextControl_in == NULL)
	cAmbig = '%';
else
	cAmbig = pTextControl_in->cAnaAmbig;

/* write the analyzed word */
dtbfmt(pOutFP_in, "\\a ", pTemplate_in, cAmbig);

/* write the morpheme decomposition */
if (pTemplate_in->iOutputFlags & WANT_DECOMPOSITION)
	dtbfmt(pOutFP_in, "\\d ", pTemplate_in, cAmbig);

/* write the category */
if (pTemplate_in->iOutputFlags & WANT_CATEGORY)
	dtbfmt(pOutFP_in, "\\cat ", pTemplate_in, cAmbig);

/* write the properties 1.9zc ALB */
if (pTemplate_in->iOutputFlags & WANT_PROPERTIES)
	dtbfmt(pOutFP_in, "\\p ", pTemplate_in, cAmbig);

/* write the feature descriptors */
if (pTemplate_in->iOutputFlags & WANT_FEATURES)
	dtbfmt(pOutFP_in, "\\fd ", pTemplate_in, cAmbig);

/* write the underlying forms */
if (pTemplate_in->iOutputFlags & WANT_UNDERLYING)
	dtbfmt(pOutFP_in, "\\u ", pTemplate_in, cAmbig);

/* write the original word */
if (pTemplate_in->iOutputFlags & WANT_ORIGINAL)
	fprintf(pOutFP_in, "\\w %s\n",
		(pTemplate_in->pszOrigWord != NULL) ? pTemplate_in->pszOrigWord :
						  "" );

/* write the preceding format marks */
if (pTemplate_in->pszFormat != NULL)
	{
	fprintf(pOutFP_in, "\\f ");
	encoded(pOutFP_in, pTemplate_in->pszFormat);
	fprintf(pOutFP_in, "\n");
	}

/* write the capitalization flag */
if (pTemplate_in->iCapital != NOCAP)
	fprintf(pOutFP_in, "\\c %ld\n", pTemplate_in->iCapital);

/* write the trailing non-alphabetics */
if (pTemplate_in->pszNonAlpha == NULL)
	{
	fprintf(pOutFP_in, "\\n\n");		/* must be EOF */
	}
else if (strcmp(pTemplate_in->pszNonAlpha, " ") != 0)
	{
	fprintf(pOutFP_in, "\\n ");
	encoded(pOutFP_in, pTemplate_in->pszNonAlpha);
	fprintf(pOutFP_in, "\n");
	}

/* write a blank line between records */
fputs( "\n", pOutFP_in);
checkFileError( pOutFP_in, "DTBOUT", pszOutFilename_in );

} /* end writeTemplate() */

/*****************************************************************************
 * NAME
 *    dtbfmt
 * DESCRIPTION
 *    formats a field of the analysis database,
 *    marking failures and ambiguities
 * RETURN VALUE
 *    none
 */
static void dtbfmt(pOutFP_in, pszLabel_in, pTemplate_in, cAmbig_in)
FILE *		pOutFP_in;
char *		pszLabel_in;
const WordTemplate *	pTemplate_in;
int		cAmbig_in;
{
WordAnalysis *	pAnal;
unsigned	uiAmbigCount = 0;

if (	(pTemplate_in->pAnalyses != NULL) &&
	(pTemplate_in->pAnalyses->pszAnalysis != NULL) )
	{
	for ( pAnal = pTemplate_in->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
	++uiAmbigCount;
	}

if (uiAmbigCount == 0)
	{
	if (    (strcmp(pszLabel_in, "\\a ") == 0) ||
		(strcmp(pszLabel_in, "\\d ") == 0) )
	fprintf(pOutFP_in, "%s%c0%c%s%c\n",
		pszLabel_in,
		cAmbig_in,
		cAmbig_in,
		(pTemplate_in->pszOrigWord) ? pTemplate_in->pszOrigWord : "",
		cAmbig_in);
	else
	fprintf(pOutFP_in, "%s%c0%c%c\n",
		pszLabel_in, cAmbig_in, cAmbig_in, cAmbig_in);
	return;
	}
else if (uiAmbigCount > 1)
	{
	fprintf(pOutFP_in, "%s%c%u%c",
		pszLabel_in, cAmbig_in, uiAmbigCount, cAmbig_in);
	}
else
	fputs(pszLabel_in, pOutFP_in);

for ( pAnal = pTemplate_in->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
	{
	if (strcmp(pszLabel_in, "\\a ") == 0)
	{
	if (pAnal->pszAnalysis != NULL)
		fputs(pAnal->pszAnalysis, pOutFP_in);
	}
	else if (strcmp(pszLabel_in, "\\d ") == 0)
	{
	if (pAnal->pszDecomposition != NULL)
		fputs(pAnal->pszDecomposition, pOutFP_in);
	}
	else if (strcmp(pszLabel_in, "\\cat ") == 0)
	{
	if (pAnal->pszCategory != NULL)
		fputs(pAnal->pszCategory, pOutFP_in);
	}
	else if (strcmp(pszLabel_in, "\\p ") == 0)
	{
	if (pAnal->pszProperties != NULL)
		fputs(pAnal->pszProperties, pOutFP_in);
	}
	else if (strcmp(pszLabel_in, "\\fd ") == 0)
	{
	if (pAnal->pszFeatures != NULL)
		fputs(pAnal->pszFeatures, pOutFP_in);
	}
	else if (strcmp(pszLabel_in, "\\u ") == 0)
	{
	if (pAnal->pszUnderlyingForm != NULL)
		fputs(pAnal->pszUnderlyingForm, pOutFP_in);
	}
	if (uiAmbigCount > 1)
	fputc(cAmbig_in, pOutFP_in);
	}

/* terminate line */
putc('\n',pOutFP_in);

} /* end dtbfmt() */

/***************************************************************************
 * NAME
 *    encoded
 * ARGUMENTS
 *    pOutFP_in - pointer to output FILE
 *    str   - pointer to string
 * DESCRIPTION
 *    Replace certain control characters in the old string with backslash
 *    escape sequences in the file output.
 * RETURN VALUE
 *    none
 */
static void encoded( pOutFP_in, str)
FILE *pOutFP_in;
char *str;
{
register char *p;
register int c;
register int nl_last;

for ( p = str, nl_last = 0 ; (c = *p++) ; )
	{
	if (nl_last && (c != '\n'))
		{
	/*
	 *  we've had a nl followed by more stuff, so give another line in
	 *  output (safely) (multiple nl's in a row allowed)
	 */
		fputs("\n\t",pOutFP_in);
		nl_last = 0;
		}
	switch ( c )
		{
		case '\b':   fputs( "\\b",  pOutFP_in);                     break;
		case '\f':   fputs( "\\f",  pOutFP_in);                     break;
		case '\n':   fputs( "\\n",  pOutFP_in);     nl_last = 1;    break;
		case '\r':   fputs( "\\r",  pOutFP_in);                     break;
		case '\t':   fputs( "\\t",  pOutFP_in);                     break;
		case '\\':   fputs( "\\\\", pOutFP_in);                     break;
		default:      putc( c,      pOutFP_in);                     break;
		};
	}
}

/***************************************************************************
 *      EDIT HISTORY
 *      30-OCT-82       D. Weber/Bob Kasper
 *      27-MAR-85       hab/djw
 *      12-Nov-85       SRMc - port CQAP to Unix and MSDOS
 *      24-Mar-88       hab - remove CTRL-X as EOR
 *      15-Apr-88       hab - allow multiple ' ' in output
 *      26-May-88       SRMc - change order of output:
 *                                      \a - analysis
 *                                      \d - decomposition
 *                                      \w - original word
 *                                      \f - preceding stuff
 *                                      \c - capitalization
 *                                      \n - trailing stuff
 *                              note that every field except the first one
 *                              (\a) is optional
 *      28-May-88       SRMc - use ambigchar instead of hardwired '%'
 *                           - handle empty anlist with empty orig_word
 *      28-Jul-88       SRMc - replace ssalloc() with malloc() and realloc()
 *      21-Oct-88       SRMc - reorganize the file header comments
 *      26-Oct-88       SRMc - mark failures with, e.g., %0% instead of %1%
 *                           - merge in ENCODE.C, rewrite encode() as
 *                              encoded() to allow arbitrarily sized format
 *                              and trailing nonalphabetic (\f and \n) fields
 *      10-Nov-88       SRMc - replace free() with myfree()
 *       4-Jan-89       SRMc - fix for Microsoft C
 *      26-Jul-89       hab  - replace struct strlist in defs.h with
 *                              STAMP's strlist.h
 *      27-Jul-89       hab  - add extern void myfree()
 *      28-Sep-89       ALB  - fix bug of showing \w (null) at eof with \f
 * 1.5a  2-Jan-90 ALB Add code to output final category of word
 * 1.5d  8-Jan-90 ALB Change free list to use free_strlist()
 * 1.5f  8-Jan-90 ALB Finish \fd output code
 *      02-Aug-90 hab De-lint the source
 * 1.7x  8-Jan-93 CLR Expand string environment to include surrounding words
 *                      Change global word structures to pointers
 *      22-Sep-93 CLR Add 'void' to prototypes where appropriate
 * 1.9f  9-Dec-93 CLR Make a version which incorporates the above changes
 * 1.9k 22-Mar-94 hab make DJGPP compiler happy: remove its warning msgs
 *                    Add underlying form in output
 * 11-Oct-96	SRMc - install in OPAC library
 *		     - add fix for EOF immediately after a word
 * 14-Oct-96	SRMc - fix for renamed WordTemplate elements
 * 21-Oct-96	SRMc - rename function to writeTemplate()
 * 20-Feb-97	SRMc - revise output of analysis failures (responding to
 *			bug report by Bill Mann)
 *  3-Feb-97	SRMc - make output of original word (\w) optional
 *		     - remove output of surface forms (\s) since it's the
 *			same information as morpheme decomposition (\d)
 *			without the separation characters
 * 28-May-97	SRMc - renamed full_disk() to checkFileError()
 */
