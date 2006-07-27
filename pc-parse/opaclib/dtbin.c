/* DTBIN.C - read the next record from an AMPLE output file
 ***************************************************************************
 *
 * #include "template.h"
 *
 * WordTemplate * readTemplateFromAnalysis(FILE * pInputFP_in,
 *					   const TextControl * pTextCtl_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1982, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#define strrchr rindex
#endif
extern VOIDP  memmove P((VOIDP dest, const VOIDP src, size_t n));
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strcpy  P((char * dest, const char * src));
extern char * strcat  P((char * dest, const char * src));
extern int    strncmp P((const char * s1, const char * s2, size_t n));
extern char * strchr  P((const char * s, int c));
extern char * strrchr P((const char * s, int c));
extern size_t strlen  P((const char * s));
extern long   strtol  P((const char * str, char ** ptr, int base));
#endif /* STDC_HEADERS */

#include "cportlib.h"
#include "template.h"
#include "record.h"
#include "allocmem.h"

extern char * readLineFromFile P((FILE *fp, unsigned * puiLineNumber,
				  int comment));

#define NUL '\0'
#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif

/* local functions */
static StringList * listin P((char *		  pszField_in,
				  const TextControl * pTextCtl_in));
static char * decode P((char *string));

/***************************************************************************
 * NAME
 *    decode
 * ARGUMENTS
 *    string - pointer to string contained encoded field
 * DESCRIPTION
 *    restores special graphic chars in format fields of template
 * RETURN VALUE
 *    pointer to modified (shorter) string
 */
static char * decode( string )
char *	string;
{
register char *newp, *oldp;
register int c;
/*
 *  pass over string from left to right
 *    oldp moves on ahead, pointing to the next character to convert
 *    newp lags behind, pointing to the characters that have been converted
 */
for ( newp = oldp = string ; (c = *oldp++) != NUL ; )
	{
	if (c == '\\')
	{
	c = *oldp++;		/* look at the next character */
	switch ( c )
		{
		case 'b':	*newp++ = '\b';	break;
		case 'f':	*newp++ = '\f';	break;
		case 'n':	*newp++ = '\n';	break;
		case 'r':	*newp++ = '\r';	break;
		case 't':	*newp++ = '\t';	break;
		case NUL:   *newp   = NUL;  return( string );
		default:    *newp++ = (char)c;	/* copy other chars */
		}
	}
	else if ((c == '\n') || (c == '\t'))
	continue;			/* ignore newlines and tabs */
	else
	*newp++ = (char)c;		/* copy anything else */
	}
*newp = NUL;
return( string );
} /* end decode */

/***************************************************************************
 * NAME
 *    listin
 * ARGUMENTS
 *    rp   - pointer to contents of field
 * DESCRIPTION
 *    Input a strlist structure from an analysis database record field
 * RETURN VALUE
 *    pointer to created strlist structure
 */
static StringList * listin(rp, pTextCtl_in)
char *			rp;
const TextControl *	pTextCtl_in;
{
StringList *list;
register StringList *slp;
register char *pos;
int n;

list = NULL;
if (((pos = strrchr(rp,'\n')) != (char *)NULL) && (*(pos+1) == NUL))
	*pos = NUL;				/* remove any trailing newline */
if (*rp == pTextCtl_in->cAnaAmbig)
	{
	if ((pos = strchr(++rp, pTextCtl_in->cAnaAmbig)) != (char *)NULL)
	*pos++ = NUL;			/* terminate ambiguity count */
	n = (int)strtol(rp,(char **)NULL,10);
	if (pos)				/* advance past ambiguity count */
	rp = pos;
	if (n <= 1)				/* either %0% or %1% for failures */
	{
	if ((pos = strchr( rp, pTextCtl_in->cAnaAmbig)) != (char *)NULL)
		*pos++ = NUL;
	}
	else
	{				/* ambiguity */
	while (n--)
		{
		if ((pos = strchr( rp, pTextCtl_in->cAnaAmbig)) != (char *)NULL)
		*pos++ = NUL;
		slp = (StringList *)allocMemory( sizeof(StringList));
		slp->pszString = duplicateString( rp );
		slp->pNext = list;
		list = slp;
		if (pos)
		rp = pos;
		}
	}
	}
else
	{				/* single analysis */
	list = (StringList *)allocMemory( sizeof(StringList));
	list->pszString = duplicateString( rp );
	list->pNext = NULL;
	}
return(list);
} /* end listin */

#define ANALYSIS	  0	/* \a   */
#define DECOMPOSITION	  1	/* \d   */
#define CATEGORY	  2	/* \cat */
#define PROPERTIES	  3	/* \p   */
#define FEATURES	  4	/* \fd  */
#define UNDERLYING	  5	/* \u   */
#define SURFACE		  6	/* \s   */
#define WORD		  7	/* \w   */
#define FORMAT		  8	/* \f   */
#define CAPITAL		  9	/* \c   */
#define NONALPHABETIC	 10	/* \n   */
#define SENTENCEPARSEBEG 11     /* \parse */
#define SENTENCEPARSEEND 12     /* \endparse */
#define WORDPARSEBEG     13     /* \WordParse */
#define WORDPARSEEND     14     /* \EndWordParse */
#define NUMBER_FIELDS	 15

/*****************************************************************************
 * NAME
 *    readAnalysisRecord
 * DESCRIPTION
 *    read one analysis record from an AMPLE style analysis file
 *    each record may have these fields:
 *      \a   = analysis                (ambiguities and failures marked)
 *      \d   = morpheme decomposition  (ambiguities marked)
 *      \cat = final category of word  (ambiguities marked)
 *      \p   = properties              (ambiguities marked)
 *      \fd  = feature descriptors     (ambiguities marked)
 *      \u   = underlying form         (ambiguities marked)
 *      \s   = surface form            (ambiguities possibly marked)
 *      \w   = original word
 *      \f   = preceding format marks
 *      \c   = capitalization
 *      \n   = trailing nonalphabetics
 */
/*      \parse    = beginning of a sentence parse
 *      \endparse = end of a sentence parse
 *      \WordParse    = beginning of a word parse
 *      \endWordParse = end       of a word parse
 */
/* RETURN VALUE
 *    pointer to an array of strings containing the analysis record fields,
 *    or NULL if EOF or error
 */
static char ** readAnalysisRecord(pInputFP_in)
FILE *	pInputFP_in;
{
static char *	apszRecord[NUMBER_FIELDS];
char *		pszLine;
int		i;
int		iIndex = -1;
char *		pszDefaultNonalpha;
size_t  	uiParserBufferSize   = 0;
#define SIZEOFPARSERBUFFER 1000000

memset(apszRecord, 0, sizeof(apszRecord));
pszDefaultNonalpha        = duplicateString( " " );
apszRecord[NONALPHABETIC] = pszDefaultNonalpha;
while ((pszLine = readLineFromFile(pInputFP_in, NULL, 0)) != NULL)
	{
	if (pszLine[0] == NUL)
	{
	/*
	 *  a blank line separates records
	 */
	if (apszRecord[ANALYSIS] != NULL)
		break;
	}
	else if (strncmp(pszLine, "\\a ", 3) == 0)
	{
	iIndex = ANALYSIS;
	apszRecord[iIndex] = duplicateString( pszLine+3 );
	}
	else if (strncmp(pszLine, "\\d ", 3) == 0)
	{
	iIndex = DECOMPOSITION;
	apszRecord[iIndex] = duplicateString( pszLine+3 );
	}
	else if (strncmp(pszLine, "\\cat ", 5) == 0)
	{
	iIndex = CATEGORY;
	apszRecord[iIndex] = duplicateString( pszLine+5 );
	}
	else if (strncmp(pszLine, "\\p ", 3) == 0)
	{
	iIndex = PROPERTIES;
	apszRecord[iIndex] = duplicateString( pszLine+3 );
	}
	else if (strncmp(pszLine, "\\fd ", 4) == 0)
	{
	iIndex = FEATURES;
	apszRecord[iIndex] = duplicateString( pszLine+4 );
	}
	else if (strncmp(pszLine, "\\u ", 3) == 0)
	{
	iIndex = UNDERLYING;
	apszRecord[iIndex] = duplicateString( pszLine+3 );
	}
	else if (strncmp(pszLine, "\\s ", 3) == 0)
	{
	iIndex = SURFACE;
	apszRecord[iIndex] = duplicateString( pszLine+3 );
	}
	else if (strncmp(pszLine, "\\w ", 3) == 0)
	{
	iIndex = WORD;
	apszRecord[iIndex] = duplicateString( pszLine+3 );
	}
	else if (strncmp(pszLine, "\\f ", 3) == 0)
	{
	iIndex = FORMAT;
	apszRecord[iIndex] = duplicateString( pszLine+3 );
	}
	else if (strncmp(pszLine, "\\c ", 3) == 0)
	{
	iIndex = CAPITAL;
	apszRecord[iIndex] = duplicateString( pszLine+3 );
	}
	else if (strncmp(pszLine, "\\n ", 3) == 0)
	{
	iIndex = NONALPHABETIC;
	apszRecord[iIndex] = duplicateString( pszLine+3 );
	}
	else if (strcmp(pszLine, "\\n") == 0)
	{
	/*
	 *  special EOF marker
	 */
	apszRecord[NONALPHABETIC] = NULL;
	}
	else if ((pszLine[0] == '\t') &&
		 ((iIndex == FORMAT) || (iIndex == NONALPHABETIC)))
	{
	/*
	 *  \f and \n can extend over multiple lines, with additional lines
	 *  marked by a leading tab
	 */
	/* this code breaks the /O2 option under Visual Studio .NET somehow
	apszRecord[iIndex] = strcat(reallocMemory(apszRecord[iIndex],
						  strlen(apszRecord[iIndex]) +
							 strlen(pszLine)),
					   pszLine+1);
	*/
	int cch = strlen(apszRecord[iIndex]) + strlen(pszLine);
	apszRecord[iIndex] = reallocMemory(apszRecord[iIndex], cch);
	strcat(apszRecord[iIndex], pszLine + 1);
	}
	else if (strncmp(pszLine, "\\parse", 6) == 0)
	{
	iIndex = SENTENCEPARSEBEG;
	apszRecord[iIndex] = allocMemory( SIZEOFPARSERBUFFER );
	uiParserBufferSize = SIZEOFPARSERBUFFER;
	strcat(apszRecord[iIndex], pszLine+6);
	}
	else if (strncmp(pszLine, "\\endparse", 9) == 0)
	{
	iIndex = SENTENCEPARSEEND;
	}
	else if (strncmp(pszLine, "\\WordParse ", 10) == 0)
	{
	iIndex = WORDPARSEBEG;
	apszRecord[iIndex] = duplicateString( pszLine+10 );
	}
	else if (strncmp(pszLine, "\\EndWordParse", 13) == 0)
	{
	iIndex = WORDPARSEEND;
	}
	else if ((iIndex == SENTENCEPARSEBEG) ||
		 (iIndex == WORDPARSEBEG))
	{
	/*
	 *  \parse and \WordParse can extend over multiple lines
	 */
#if 0
	int iii = apszRecord[iIndex] != NULL ? strlen(apszRecord[iIndex]) : 0;
	int jjj = strlen(pszLine);
	if (apszRecord[iIndex] == NULL)
	  apszRecord[iIndex] = duplicateString( pszLine );
	else
	  {
#endif
		/* may break in .Net
	  apszRecord[iIndex] = strcat(reallocMemory(apszRecord[iIndex],
						  strlen(apszRecord[iIndex]) +
								  strlen(pszLine)),
					pszLine);
		*/
		int cch = strlen(apszRecord[iIndex]) + strlen(pszLine);
		if (cch >= uiParserBufferSize)
		  {
		apszRecord[iIndex] = reallocMemory(apszRecord[iIndex], cch + SIZEOFPARSERBUFFER);
		uiParserBufferSize += SIZEOFPARSERBUFFER;
		  }
		strcat(apszRecord[iIndex], pszLine);
#if 0
	  }
#endif
	}
	else
	{
	/*
	 *  skip any other lines
	 */
	}
	}
if (apszRecord[NONALPHABETIC] != pszDefaultNonalpha)
	freeMemory( pszDefaultNonalpha );

if (apszRecord[ANALYSIS] != NULL)
	{
	if (    (strcmp(apszRecord[ANALYSIS], "%0%%") == 0) &&
		(apszRecord[NONALPHABETIC] == pszDefaultNonalpha) )
	{
	/*
	 *  actually EOF
	 */
	apszRecord[NONALPHABETIC] = NULL;
	freeMemory( pszDefaultNonalpha );
	}
	return apszRecord;
	}

for ( i = 0 ; i < NUMBER_FIELDS ; ++i )
	{
	if (apszRecord[i] != NULL)
	{
	freeMemory(apszRecord[i]);
	apszRecord[i] = NULL;
	}
	}
return NULL;
}

/*****************************************************************************
 * NAME
 *    readTemplateFromAnalysis
 * DESCRIPTION
 *    fill in a WordTemplate data structure from an AMPLE style analysis file
 * RETURN VALUE
 *    pointer to dynamically allocated WordTemplate, or NULL if EOF or error
 */
WordTemplate * readTemplateFromAnalysis(pInputFP_in, pTextCtl_in)
FILE *		pInputFP_in;
const TextControl *	pTextCtl_in;
{
char **		ppszAnalysisRecord;
WordTemplate *	pWord;
StringList *	pStrList;
StringList *	pNextStr;
WordAnalysis *	pNewAnal;
WordAnalysis *	pTailAnal;
WordAnalysis *	pAnal;
char *		p;

ppszAnalysisRecord = readAnalysisRecord(pInputFP_in);
if (ppszAnalysisRecord == NULL)
	return NULL;

pWord = (WordTemplate *)allocMemory(sizeof(WordTemplate));
if (ppszAnalysisRecord[ANALYSIS] != NULL)
	{
	p = ppszAnalysisRecord[ANALYSIS];
	if (    (p[0] == pTextCtl_in->cAnaAmbig) &&
		((p[1] == '0') || (p[1] == '1')) &&
		(p[2] == pTextCtl_in->cAnaAmbig) )
	{
	/*
	 *  either %0% or %1% for failures
	 */
	p = strchr(p+3, pTextCtl_in->cAnaAmbig);
	if (p != NULL)
		*p = NUL;
	pWord->pszOrigWord = duplicateString(ppszAnalysisRecord[ANALYSIS] + 3);
	}
	else
	{
	pTailAnal = NULL;
	for (   pStrList = listin(ppszAnalysisRecord[ANALYSIS], pTextCtl_in) ;
		pStrList ;
		pStrList = pNextStr )
		{
		pNewAnal = (WordAnalysis *)allocMemory(sizeof(WordAnalysis));
		memset(pNewAnal, 0, sizeof(WordAnalysis));
		pNewAnal->pszAnalysis = pStrList->pszString;

		if (pWord->pAnalyses == NULL)
		pWord->pAnalyses = pNewAnal;
		else
		pTailAnal->pNext = pNewAnal;
		pTailAnal = pNewAnal;

		pNextStr = pStrList->pNext;
		freeMemory( pStrList );
		}
	}
	freeMemory(ppszAnalysisRecord[ANALYSIS]) ;
	}
if (ppszAnalysisRecord[DECOMPOSITION] != NULL)
	{
	for (   pStrList = listin(ppszAnalysisRecord[DECOMPOSITION], pTextCtl_in),
		pAnal = pWord->pAnalyses ;
		pStrList ;
		pStrList = pNextStr )
	{
	if (pAnal != NULL)
		{
		pAnal->pszDecomposition = pStrList->pszString;
		pAnal = pAnal->pNext;
		pWord->iOutputFlags |= WANT_DECOMPOSITION;
		}
	else
		{
		/* don't leak memory! */
		freeMemory( pStrList->pszString );
		}
	pNextStr = pStrList->pNext;
	freeMemory( pStrList );
	}
	freeMemory(ppszAnalysisRecord[DECOMPOSITION]);
	}
if (ppszAnalysisRecord[CATEGORY] != NULL)
	{
	for (   pStrList = listin(ppszAnalysisRecord[CATEGORY], pTextCtl_in),
		pAnal = pWord->pAnalyses ;
		pStrList ;
		pStrList = pNextStr )
	{
	if (pAnal != NULL)
		{
		pAnal->pszCategory = pStrList->pszString;
		pAnal = pAnal->pNext;
		pWord->iOutputFlags |= WANT_CATEGORY;
		}
	else
		{
		/* don't leak memory! */
		freeMemory( pStrList->pszString );
		}
	pNextStr = pStrList->pNext;
	freeMemory( pStrList );
	}
	freeMemory(ppszAnalysisRecord[CATEGORY]);
	}
if (ppszAnalysisRecord[PROPERTIES] != NULL)
	{
	for (   pStrList = listin(ppszAnalysisRecord[PROPERTIES], pTextCtl_in),
		pAnal = pWord->pAnalyses ;
		pStrList ;
		pStrList = pNextStr )
	{
	if (pAnal != NULL)
		{
		pAnal->pszProperties = pStrList->pszString;
		pAnal = pAnal->pNext;
		pWord->iOutputFlags |= WANT_PROPERTIES;
		}
	else
		{
		/* don't leak memory! */
		freeMemory( pStrList->pszString );
		}
	pNextStr = pStrList->pNext;
	freeMemory( pStrList );
	}
	freeMemory(ppszAnalysisRecord[PROPERTIES]);
	}
if (ppszAnalysisRecord[FEATURES] != NULL)
	{
	for (   pStrList = listin(ppszAnalysisRecord[FEATURES], pTextCtl_in),
		pAnal = pWord->pAnalyses ;
		pStrList ;
		pStrList = pNextStr )
	{
	if (pAnal != NULL)
		{
		pAnal->pszFeatures = pStrList->pszString;
		pAnal = pAnal->pNext;
		pWord->iOutputFlags |= WANT_FEATURES;
		}
	else
		{
		/* don't leak memory! */
		freeMemory( pStrList->pszString );
		}
	pNextStr = pStrList->pNext;
	freeMemory( pStrList );
	}
	freeMemory(ppszAnalysisRecord[FEATURES]);
	}
if (ppszAnalysisRecord[UNDERLYING] != NULL)
	{
	for (   pStrList = listin(ppszAnalysisRecord[UNDERLYING], pTextCtl_in),
		pAnal = pWord->pAnalyses ;
		pStrList ;
		pStrList = pNextStr )
	{
	if (pAnal != NULL)
		{
		pAnal->pszUnderlyingForm = pStrList->pszString;
		pAnal = pAnal->pNext;
		pWord->iOutputFlags |= WANT_UNDERLYING;
		}
	else
		{
		/* don't leak memory! */
		freeMemory( pStrList->pszString );
		}
	pNextStr = pStrList->pNext;
	freeMemory( pStrList );
	}
	freeMemory(ppszAnalysisRecord[UNDERLYING]);
	}
if (ppszAnalysisRecord[SURFACE] != NULL)
	{
	for (   pStrList = listin(ppszAnalysisRecord[SURFACE], pTextCtl_in),
		pAnal = pWord->pAnalyses ;
		pStrList ;
		pStrList = pNextStr )
	{
	if (pAnal != NULL)
		{
		pAnal->pszSurfaceForm = pStrList->pszString;
		pAnal = pAnal->pNext;
		}
	else
		{
		/* don't leak memory! */
		freeMemory( pStrList->pszString );
		}
	pNextStr = pStrList->pNext;
	freeMemory( pStrList );
	}
	freeMemory(ppszAnalysisRecord[SURFACE]);
	/*
	 *  this field is ambiguous only when it really is
	 */
	if (pWord->pAnalyses->pszSurfaceForm != NULL)
	{
	for ( ; pAnal ; pAnal = pAnal->pNext )
		{
		pAnal->pszSurfaceForm = duplicateString(
						 pWord->pAnalyses->pszSurfaceForm);
		}
	}
	}
if (ppszAnalysisRecord[WORD] != NULL)
	{
	if (pWord->pszOrigWord != NULL)
	freeMemory(pWord->pszOrigWord);
	pWord->pszOrigWord = duplicateString( ppszAnalysisRecord[WORD] );
	pWord->iOutputFlags |= WANT_ORIGINAL;
	freeMemory(ppszAnalysisRecord[WORD]);
	}
if (ppszAnalysisRecord[FORMAT] != NULL)
	{
	pWord->pszFormat = duplicateString( decode( ppszAnalysisRecord[FORMAT] ) );
	freeMemory(ppszAnalysisRecord[FORMAT]);
	}
if (ppszAnalysisRecord[CAPITAL] != NULL)
	{
	pWord->iCapital = strtol(ppszAnalysisRecord[CAPITAL], NULL, 10);
	freeMemory(ppszAnalysisRecord[CAPITAL]);
	}
if (ppszAnalysisRecord[NONALPHABETIC] != NULL)
	{
	pWord->pszNonAlpha = duplicateString( decode(
					  ppszAnalysisRecord[NONALPHABETIC]) );
	freeMemory(ppszAnalysisRecord[NONALPHABETIC]);
	}
if (ppszAnalysisRecord[SENTENCEPARSEBEG] != NULL)
	{
	pWord->pszSentenceParse = duplicateString( decode(
					   ppszAnalysisRecord[SENTENCEPARSEBEG]) );
	freeMemory(ppszAnalysisRecord[SENTENCEPARSEBEG]);
	}
if (ppszAnalysisRecord[WORDPARSEBEG] != NULL)
	{
	pWord->pszWordParse = duplicateString( decode(
					   ppszAnalysisRecord[WORDPARSEBEG]) );
	freeMemory(ppszAnalysisRecord[WORDPARSEBEG]);
	}
return pWord;
}

/***************************************************************************
 * EDIT HISTORY
 *  5-MAR-82	D. Weber/Bob Kasper
 * 19-MAR-85	hab/djw
 * 23-Sep-85	SRMc
 * 31-Jul-86	hab
 * 30-Mar-88	hab - no ctrl-x
 *  2-May-88	SRMc - fflush(stdout) before writing to stderr
 * 23-May-88	SRMc - implement code_table structure
 *  2-Jun-88	SRMc - remove new_word[256] field from template
 *			structure
 * 28-Jul-88	SRMc - replace ssalloc() with malloc() and realloc()
 *  6-Sep-88	SRMc - fix for \a being first field rather than \w
 *		     - replace '%' with ambigchar
 *		     - bunches of bug fixes
 * 28-Sep-88	SRMc - always allocate memory for this_word->orig_word
 *		     - use \w field contents if it exists
 * 21-Oct-88	SRMc - remove register from function parameter
 *			declarations
 *		     - reorganize the file header comments
 * 24-Oct-88	SRMc - allow ambiguity count of 0 (zero) for failures
 * 26-Oct-88	SRMc - modify decode() for new encoded() in DTBOUT.C
 * 10-Nov-88	SRMc - replace free() with myfree()
 * 20-May-89	SRMc - revised for STAMP to remove external global
 *			variables, and to include "template.h"
 *		     - added init_dtbin()
 *		     - debugged decode()
 * 13-Jul-89	hab  - de-"lint" the source
 *  9-Mar-90	ALB - Set up for sentence transfer of multiple words [1.0j]
 *		    Allocate this_word, make separate free_word()
 * 29-Jun-90	BK/ALB - Fix for portability to MAC, add string.h [1.1b]
 * 17-Jan-91	SRMc - add extern declarations for atoi() and
 *			free_record()
 *		     - add #ifdef BSD for <strings.h>
 *		     - change index() to strchr() throughout
 *		     - add ANSI-fied function prototypes
 * 19-Jan-91	SRMc - handle \cat and \fd fields output by AMPLE 1.6
 *  7-Feb-91	SRMc - fill in ->orig_word only if \w field exists
 *		     - fill in ->word only from failure in \a field
 *		     - eliminate reconstruct_word() - no longer used
 * 11-Mar-91	SRMc - remove #define strchr -- it's in OPACLIB.H
 * 16-Sep-91	SRMc - replace atoi() with ANSI C's strtol()
 *		     - use function pointers char *(*rebuild_word)()
 *			and char *(*rebuild_orig_word)() to handle
 *			optional reconstruction of the ->word and
 *			->orig_word fields
 *		     - delint with Microsoft C's -W3 option and
 *			 GNU C's "-Wall -ansi -pedantic" options
 *		     - put free_word() in a separate file, rename it
 *			to free_word_template()
 * 21-Jan-92	SRMc - rename rebuild_word to rebuild_wd and
 *			rebuild_orig_word to rebuild_orig_wd
 * 23-Jan-92	SRMc - move edit history to end of the file
 *		     - replace skipwhite() with inline code
 *  3-Oct-94	SRMc - fix for using the revised get_record()
 *		     - don't allocate a new word_template until after
 *			the call to get_record() in dtbin()
 * 10-Mar-95	SRMc - #include <stdlib.h> for strtol() prototype
 * 26-Sep-95	SRMc - fill in default space for ->non_alpha
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 14-Oct-96	SRMc - fix for renamed WordTemplate elements
 * 31-Jan-96	SRMc - fix for STDC_HEADERS
 * 12-Feb-97	SRMc - fix for revised (and renamed) readLineFromFile()
 * 25-Feb-97	SRMc - make function arguments const where appropriate
 *  1-Apr-97	SRMc - use duplicateString() where appropriate
 * 31-Mar-98	hab  - fix some memory leaks in readTemplateFromAnalysis()
 * 27-Jul-98	SRMc - set iOutputFlags according to existing input fields
 * 23-Oct-1998	SRMc - handle default and EOF values of the \n (trailing
 *			nonalphabetic) field
 * 20-Apr-2000  hab  - allow for PCPATR \parse,\endparse and
 *                      \WordParse,\EndWordParse fields
 */
