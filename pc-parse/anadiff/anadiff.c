/* ANADIFF.C - compare two ANA files to see if they're logically the same
 ***************************************************************************
 * Copyright 1996, 2000 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern VOIDP memset   P((VOIDP s, int c, size_t n));
extern int   memcmp   P((const VOIDP s1, const VOIDP s2, size_t n));
extern char * strcat  P((char * dest, const char * src));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strchr  P((const char * s, int c));
extern char * strpbrk P((const char * s1, const char * s2));
extern char * strtok P((const char * s1, const char * s2));
extern size_t strlen  P((const char * s));
extern void   exit    P((int status));
#endif
#ifndef EXIT_FAILURE
#define	EXIT_FAILURE	1	/* Failing exit status.  */
#define	EXIT_SUCCESS	0	/* Successful exit status.  */
#endif
#ifdef _MSC_VER
#include <io.h>
#endif
#ifdef __MWERKS__
#include <console.h>
#endif

#include "opaclib.h"
#include "cportlib.h"
#include "version.h"
/*
 *  non-ANSI standard functions
 */
extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;
#ifndef isatty
extern int isatty P((int fd));
#endif
#ifndef fileno
extern int fileno P((FILE*));
#endif

#ifdef MACINTOSH
#define USE_CCOMMAND
#endif
#ifdef MACINTOSH_NEEDS
extern long next_user_event_ticks;
extern void allow_user_events();
#endif

#ifndef NUL
#define NUL '\0'
#endif

typedef struct {
	char *	pszAnalysis;
	char *	pszDecomposition;
	char *	pszCategory;
	char *	pszProperty;
	char *	pszFeature;
	char *	pszUf;
	char *	pszOrigWord;
	char *	pszFormat;
	char *	pszCapital;
	char *	pszNonAlpha;
	} Record;

#ifdef __STDC__
int load_record(FILE * pFileFP_in, Record * pRecord_out);
void erase_record(Record * pRecord_io);
int equal_records(Record * pFirst_in, Record * pSecond_in);
void fill_template(WordTemplate * pTemplate_out, Record * pRecord_in);
int parallel_equivalent(WordTemplate * pFirst_in, WordTemplate * pSecond_in);
int equivalent_templates(WordTemplate * pFirst_in, WordTemplate * pSecond_in);
void erase_template(WordTemplate * pTemplate_io);
void show_differences(WordTemplate * pFirstTemplate_in,
			  WordTemplate * pSecondTemplate_in);
static int cmp_strings(const void * v1, const void * v2);
char * makePropertyString(char * pszString_in);
int same_analysis(WordAnalysis * pFirst_in, WordAnalysis * pSecond_in);
void print_formatting(char * pszString_in);
void exit_anadiff(int iExitStatus_in);
#endif

char	cAmbigMarker_g  = '%';
char *	pszFirstFile_g  = NULL;
char *	pszSecondFile_g = NULL;
/*
 *  version information
 */
#if (VERSION < 1) && (REVISION < 99)
#define TESTFORMAT     "Alpha test version\n"
#define COMPILEDFORMAT "Alpha test version compiled %s %s\n"
#define PATCHLEVELSEPCHAR 'a'
#else
#if (PATCHLEVEL < 0) || ((VERSION < 1) && (REVISION == 99))
#define TESTFORMAT     "Beta test version\n"
#define COMPILEDFORMAT "Beta test version compiled %s %s\n"
#define PATCHLEVELSEPCHAR 'b'
#else
#undef  TESTFORMAT
#define COMPILEDFORMAT "Compiled %s %s\n"
#define PATCHLEVELSEPCHAR '.'
#endif
#endif

const int	iAnadiffVersion_g    = VERSION;
const int	iAnadiffRevision_g   = REVISION;
#if PATCHLEVEL < 0
const int	iAnadiffPatchlevel_g = -(PATCHLEVEL);
#else
const int	iAnadiffPatchlevel_g = PATCHLEVEL;
#endif
const char	chAnadiffPatchsep_g  = PATCHLEVELSEPCHAR;
const char *	pszAnadiffDate_g     = DATE;
const char *	pszAnadiffYear_g     = YEAR;
#ifdef __DATE__
const char *	pszAnadiffCompileformat_g = COMPILEDFORMAT;
const char *	pszAnadiffCompiledate_g   = __DATE__;
const char *	pszAnadiffCompiletime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszAnadiffTestVersion_g = TESTFORMAT;
#else
const char *	pszAnadiffTestVersion_g = NULL;
#endif
#endif

/***************************************************************************
 * NAME
 *    fill_strlist
 * ARGUMENTS
 *    rp   - pointer to contents of field
 * DESCRIPTION
 *    Input a strlist structure from an analysis database records
 * RETURN VALUE
 *    pointer to created strlist structure
 */
static StringList *fill_strlist(rp)
char *	rp;
{
StringList *list;
register StringList *slp;
register char *pos;
int n;

list = NULL;
if ((pos = strchr(rp,'\n')) != (char *)NULL)
	*pos = NUL;				/* remove any trailing newline */
if (*rp == cAmbigMarker_g)
	{
	if ((pos = strchr(++rp, cAmbigMarker_g)) != (char *)NULL)
	*pos++ = NUL;			/* terminate ambiguity count */
	n = (int)strtol(rp,(char **)NULL,10);
	if (pos)				/* advance past ambiguity count */
	rp = pos;
	if (n <= 1)				/* either %0% or %1% for failures */
	{
	if ((pos = strchr( rp, cAmbigMarker_g)) != (char *)NULL)
		*pos++ = NUL;
	}
	else
	{				/* ambiguity */
	while (n--)
		{
		if ((pos = strchr( rp, cAmbigMarker_g)) != (char *)NULL)
		*pos++ = NUL;
		slp = (StringList *)allocMemory( sizeof(StringList));
		slp->pszString = duplicateString(rp);
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
	list->pszString = duplicateString(rp);
	list->pNext = NULL;
	}
return(list);
}

static int cmp_strings(v1, v2)
const void *v1;
const void *v2;
{
const char * const *p1;
const char * const *p2;

p1 = v1;
p2 = v2;
return strcmp(*p1, *p2);
}

/*****************************************************************************
 * NAME
 *    makePropertyString
 * DESCRIPTION
 *    convert the list of property names to canonical form: within each
 *    morpheme, eliminate duplicates and sort alphabetically
 * RETURN VALUE
 *    pointer to dynamically allocated string
 */
char * makePropertyString(pszString_in)
char * pszString_in;
{
char *	p;
char *	pszProp;
char *	pszRest;
char *	apszProps[256];
char *	pszProperties;
char	cBreak;
int	i;
int	j;
int	bUnique;

pszProperties = duplicateString(pszString_in);
pszProp = pszString_in + 2;
pszProp += strspn(pszProp, " \t\r\n\f\v");
if (strchr(pszProp, ' ') == NULL)
	return pszProperties;
if (*pszProp == '%')
	{
	++pszProp;
	pszProp += strspn(pszProp, "0123456789");
	++pszProp;
	}
pszProperties[pszProp - pszString_in] = NUL;
do  {
	pszRest = strpbrk(pszProp, "=%");
	if (pszRest == NULL)
	{
	cBreak  = NUL;
	pszRest = pszProp + strlen(pszProp);
	}
	else
	{
	cBreak = *pszRest;
	*pszRest++ = NUL;
	}
	if (strchr(pszProp, ' ') == NULL)
	strcat(pszProperties, pszProp);
	else
	{
	p = strtok(pszProp, " ");
	i = 0;
	while (p != NULL)
		{
		bUnique = TRUE;
		for ( j = 0 ; j < i ; ++j )
		{
		if (strcmp(apszProps[j], p) == 0)
			{
			bUnique = FALSE;
			break;
			}
		}
		if (bUnique)
		apszProps[i++] = p;
		p = strtok(NULL, " ");
		}
	apszProps[i] = NULL;
	qsort(apszProps, i, sizeof(char *), cmp_strings);
	for ( i = 0 ; apszProps[i] ; ++i )
		{
		strcat(pszProperties, apszProps[i]);
		if (apszProps[i+1] != NULL)
		strcat(pszProperties, " ");
		}
	}
	switch (cBreak)
	{
	case '=':	strcat(pszProperties, "=");	break;
	case '%':	strcat(pszProperties, "%");	break;
	default:					break;
	}
	pszProp = pszRest;
	} while (cBreak != NUL);

return pszProperties;
}

/*****************************************************************************
 * NAME
 *    load_record
 * DESCRIPTION
 *    load a record from the file
 * RETURN VALUE
 *    1 if record loaded, 0 if EOF or error
 */
int load_record(pFileFP_in, pRecord_out)
FILE *		pFileFP_in;
Record *	pRecord_out;
{
char *		pszLine;
size_t		len;

if ((pFileFP_in == NULL) || (pRecord_out == NULL))
	return 0;
memset(pRecord_out, NUL, sizeof(Record));
pszLine = readLineFromFile(pFileFP_in, NULL, NUL);
if (pszLine == NULL)
	return 0;
if (matchBeginning(pszLine, "\\a ") == 0)
	{
	fprintf(stderr, "BAD INITIAL LINE = \"%s\"\n", pszLine);
/*    freeMemory(pszLine);*/
	return 0;
	}

do
	{
	if (strcmp(pszLine, "") == 0)
	break;
	if (matchBeginning(pszLine, "\\a "))
	pRecord_out->pszAnalysis = duplicateString(pszLine);
	else if (matchBeginning(pszLine, "\\d "))
	pRecord_out->pszDecomposition = duplicateString(pszLine);
	else if (matchBeginning(pszLine, "\\cat "))
	pRecord_out->pszCategory = duplicateString(pszLine);
	else if (matchBeginning(pszLine, "\\p "))
	pRecord_out->pszProperty = makePropertyString(pszLine);
	else if (matchBeginning(pszLine, "\\fd "))
	pRecord_out->pszFeature = duplicateString(pszLine);
	else if (matchBeginning(pszLine, "\\u "))
	pRecord_out->pszUf = duplicateString(pszLine);
	else if (matchBeginning(pszLine, "\\w "))
	pRecord_out->pszOrigWord = duplicateString(pszLine);
	else if (matchBeginning(pszLine, "\\f "))
	{
	pRecord_out->pszFormat = duplicateString(pszLine);
	while ((pszLine = readLineFromFile(pFileFP_in, NULL, NUL)) != NULL)
		{
		if ((pszLine[0] == '\\') || (pszLine[0] == NUL))
		break;
		len = strlen(pRecord_out->pszFormat) + strlen(pszLine) + 2;
		pRecord_out->pszFormat = reallocMemory(pRecord_out->pszFormat,
						   len);
		strcat(strcat(pRecord_out->pszFormat, "\n"), pszLine);
/*	    freeMemory(pszLine);*/
		}
	if (pszLine == NULL)
		break;
	continue;
	}
	else if (matchBeginning(pszLine, "\\c "))
	pRecord_out->pszCapital = duplicateString(pszLine);
	else if (matchBeginning(pszLine, "\\n "))
	{
	pRecord_out->pszNonAlpha = duplicateString(pszLine);
	while ((pszLine = readLineFromFile(pFileFP_in, NULL, NUL)) != NULL)
		{
		if ((pszLine[0] == '\\') || (pszLine[0] == NUL))
		break;
		len = strlen(pRecord_out->pszNonAlpha) + strlen(pszLine) + 2;
		pRecord_out->pszNonAlpha = reallocMemory(pRecord_out->pszNonAlpha,
							 len);
		strcat(strcat(pRecord_out->pszNonAlpha, "\n"), pszLine);
/*	    freeMemory(pszLine);*/
		}
	if (pszLine == NULL)
		break;
	continue;
	}
	pszLine = readLineFromFile(pFileFP_in, NULL, NUL);
	} while (pszLine != NULL);
return 1;
}

/*****************************************************************************
 * NAME
 *    erase_record
 * DESCRIPTION
 *    free the strings stored in a Record structure
 * RETURN VALUE
 *    none
 */
void erase_record(pRecord_io)
Record *	pRecord_io;
{
if (pRecord_io->pszAnalysis != NULL)
	{
	freeMemory(pRecord_io->pszAnalysis);
	pRecord_io->pszAnalysis = NULL;
	}
if (pRecord_io->pszDecomposition != NULL)
	{
	freeMemory(pRecord_io->pszDecomposition);
	pRecord_io->pszDecomposition = NULL;
	}
if (pRecord_io->pszCategory != NULL)
	{
	freeMemory(pRecord_io->pszCategory);
	pRecord_io->pszCategory = NULL;
	}
if (pRecord_io->pszProperty != NULL)
	{
	freeMemory(pRecord_io->pszProperty);
	pRecord_io->pszProperty = NULL;
	}
if (pRecord_io->pszFeature != NULL)
	{
	freeMemory(pRecord_io->pszFeature);
	pRecord_io->pszFeature = NULL;
	}
if (pRecord_io->pszUf != NULL)
	{
	freeMemory(pRecord_io->pszUf);
	pRecord_io->pszUf = NULL;
	}
if (pRecord_io->pszOrigWord != NULL)
	{
	freeMemory(pRecord_io->pszOrigWord);
	pRecord_io->pszOrigWord = NULL;
	}
if (pRecord_io->pszFormat != NULL)
	{
	freeMemory(pRecord_io->pszFormat);
	pRecord_io->pszFormat = NULL;
	}
if (pRecord_io->pszCapital != NULL)
	{
	freeMemory(pRecord_io->pszCapital);
	pRecord_io->pszCapital = NULL;
	}
if (pRecord_io->pszNonAlpha != NULL)
	{
	freeMemory(pRecord_io->pszNonAlpha);
	pRecord_io->pszNonAlpha = NULL;
	}
}

/*****************************************************************************
 * NAME
 *    equal_records
 * DESCRIPTION
 *    compare two Record structures
 * RETURN VALUE
 *    1 if the Record structures are identical, 0 otherwise
 */
int equal_records(pFirst_in, pSecond_in)
Record *	pFirst_in;
Record *	pSecond_in;
{
if ((pFirst_in == NULL) && (pSecond_in == NULL))
	return 1;
if ((pFirst_in == NULL) || (pSecond_in == NULL))
	return 0;

if ((pFirst_in->pszAnalysis != NULL) && (pSecond_in->pszAnalysis != NULL))
	{
	if (strcmp(pFirst_in->pszAnalysis, pSecond_in->pszAnalysis) != 0)
	return 0;
	}
else if ((pFirst_in->pszAnalysis != NULL) || (pSecond_in->pszAnalysis != NULL))
	return 0;
if (	(pFirst_in->pszDecomposition != NULL) &&
	(pSecond_in->pszDecomposition != NULL) )
	{
	if (strcmp(pFirst_in->pszDecomposition, pSecond_in->pszDecomposition) != 0)
	return 0;
	}
else if ((pFirst_in->pszDecomposition != NULL) ||
	 (pSecond_in->pszDecomposition != NULL) )
	return 0;
if ((pFirst_in->pszCategory != NULL) && (pSecond_in->pszCategory != NULL))
	{
	if (strcmp(pFirst_in->pszCategory, pSecond_in->pszCategory) != 0)
	return 0;
	}
else if ((pFirst_in->pszCategory != NULL) || (pSecond_in->pszCategory != NULL))
	return 0;
if ((pFirst_in->pszProperty != NULL) && (pSecond_in->pszProperty != NULL))
	{
	if (strcmp(pFirst_in->pszProperty, pSecond_in->pszProperty) != 0)
	return 0;
	}
else if ((pFirst_in->pszProperty != NULL) || (pSecond_in->pszProperty != NULL))
	return 0;
if ((pFirst_in->pszFeature != NULL) && (pSecond_in->pszFeature != NULL))
	{
	if (strcmp(pFirst_in->pszFeature, pSecond_in->pszFeature) != 0)
	return 0;
	}
else if ((pFirst_in->pszFeature != NULL) || (pSecond_in->pszFeature != NULL))
	return 0;
if ((pFirst_in->pszUf != NULL) && (pSecond_in->pszUf != NULL))
	{
	if (strcmp(pFirst_in->pszUf, pSecond_in->pszUf) != 0)
	return 0;
	}
else if ((pFirst_in->pszUf != NULL) || (pSecond_in->pszUf != NULL))
	return 0;
if ((pFirst_in->pszOrigWord != NULL) && (pSecond_in->pszOrigWord != NULL))
	{
	if (strcmp(pFirst_in->pszOrigWord, pSecond_in->pszOrigWord) != 0)
	return 0;
	}
else if ((pFirst_in->pszOrigWord != NULL) || (pSecond_in->pszOrigWord != NULL))
	return 0;
if ((pFirst_in->pszFormat != NULL) && (pSecond_in->pszFormat != NULL))
	{
	if (strcmp(pFirst_in->pszFormat, pSecond_in->pszFormat) != 0)
	return 0;
	}
else if ((pFirst_in->pszFormat != NULL) || (pSecond_in->pszFormat != NULL))
	return 0;
if ((pFirst_in->pszCapital != NULL) && (pSecond_in->pszCapital != NULL))
	{
	if (strcmp(pFirst_in->pszCapital, pSecond_in->pszCapital) != 0)
	return 0;
	}
else if ((pFirst_in->pszCapital != NULL) || (pSecond_in->pszCapital != NULL))
	return 0;
if ((pFirst_in->pszNonAlpha != NULL) && (pSecond_in->pszNonAlpha != NULL))
	{
	if (strcmp(pFirst_in->pszNonAlpha, pSecond_in->pszNonAlpha) != 0)
	return 0;
	}
else if ((pFirst_in->pszNonAlpha != NULL) || (pSecond_in->pszNonAlpha != NULL))
	return 0;

return 1;
}

/*****************************************************************************
 * NAME
 *    fill_template
 * DESCRIPTION
 *    fill a template from a Record
 * RETURN VALUE
 *    none
 */
void fill_template(pTemplate_out, pRecord_in)
WordTemplate *	pTemplate_out;
Record *	pRecord_in;
{
StringList *	pStrList;
StringList *	pNextStrList;
WordAnalysis *	pAnal;
WordAnalysis *	pTailAnal;
int		bAllEmpty;

if ((pTemplate_out == NULL) || (pRecord_in == NULL))
	return;

memset(pTemplate_out, NUL, sizeof(WordTemplate));
if (pRecord_in->pszAnalysis != NULL)		/* "\\a" */
	{
	pTailAnal = NULL;
	bAllEmpty = TRUE;
	for (   pStrList = fill_strlist(pRecord_in->pszAnalysis + 3) ;
		pStrList ;
		pStrList = pNextStrList )
	{
	pAnal = (WordAnalysis *)allocMemory(sizeof(WordAnalysis));
	pAnal->pszAnalysis = pStrList->pszString;
	if (	(pStrList->pszString != NULL) &&
		(strcmp(pStrList->pszString, "") != 0) )
		bAllEmpty = FALSE;
	if (pTemplate_out->pAnalyses == NULL)
		pTemplate_out->pAnalyses = pAnal;
	else
		pTailAnal->pNext = pAnal;
	pTailAnal = pAnal;
	pNextStrList = pStrList->pNext;
	freeMemory(pStrList);
	}
	if (bAllEmpty)
	{
	for ( pAnal = pTemplate_out->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		{
		if (pAnal->pszAnalysis != NULL)
		{
		freeMemory(pAnal->pszAnalysis);
		pAnal->pszAnalysis = NULL;
		}
		}
	}
	}
if (pRecord_in->pszDecomposition != NULL)	/* "\\d" */
	{
	bAllEmpty = TRUE;
	for (   pStrList = fill_strlist(pRecord_in->pszDecomposition + 3),
		pAnal = pTemplate_out->pAnalyses ;
		pStrList ;
		pStrList = pNextStrList )
	{
	if (pAnal != NULL)
		{
		pAnal->pszDecomposition = pStrList->pszString;
		pAnal = pAnal->pNext;
		}
	if (	(pStrList->pszString != NULL) &&
		(strcmp(pStrList->pszString, "") != 0) )
		bAllEmpty = FALSE;
	pNextStrList = pStrList->pNext;
	freeMemory(pStrList);
	}
	if (bAllEmpty)
	{
	for ( pAnal = pTemplate_out->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		{
		if (pAnal->pszDecomposition != NULL)
		{
		freeMemory(pAnal->pszDecomposition);
		pAnal->pszDecomposition = NULL;
		}
		}
	}
	}
if (pRecord_in->pszCategory != NULL)		/* "\\cat" */
	{
	bAllEmpty = TRUE;
	for (   pStrList = fill_strlist(pRecord_in->pszCategory + 5),
		pAnal = pTemplate_out->pAnalyses ;
		pStrList ;
		pStrList = pNextStrList )
	{
	if (pAnal != NULL)
		{
		pAnal->pszCategory = pStrList->pszString;
		pAnal = pAnal->pNext;
		}
	if (	(pStrList->pszString != NULL) &&
		(strcmp(pStrList->pszString, "") != 0) )
		bAllEmpty = FALSE;
	pNextStrList = pStrList->pNext;
	freeMemory(pStrList);
	}
	if (bAllEmpty)
	{
	for ( pAnal = pTemplate_out->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		{
		if (pAnal->pszCategory != NULL)
		{
		freeMemory(pAnal->pszCategory);
		pAnal->pszCategory = NULL;
		}
		}
	}
	}
if (pRecord_in->pszProperty != NULL)		/* "\\p" */
	{
	bAllEmpty = TRUE;
	for (   pStrList = fill_strlist(pRecord_in->pszProperty + 3),
		pAnal = pTemplate_out->pAnalyses ;
		pStrList ;
		pStrList = pNextStrList )
	{
	if (pAnal != NULL)
		{
		pAnal->pszProperties = pStrList->pszString;
		pAnal = pAnal->pNext;
		}
	if (	(pStrList->pszString != NULL) &&
		(strcmp(pStrList->pszString, "") != 0) )
		bAllEmpty = FALSE;
	pNextStrList = pStrList->pNext;
	freeMemory(pStrList);
	}
	if (bAllEmpty)
	{
	for ( pAnal = pTemplate_out->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		{
		if (pAnal->pszProperties != NULL)
		{
		freeMemory(pAnal->pszProperties);
		pAnal->pszProperties = NULL;
		}
		}
	}
	}
if (pRecord_in->pszFeature != NULL)		/* "\\fd" */
	{
	bAllEmpty = TRUE;
	for (   pStrList = fill_strlist(pRecord_in->pszFeature + 4),
		pAnal = pTemplate_out->pAnalyses ;
		pStrList ;
		pStrList = pNextStrList )
	{
	if (pAnal != NULL)
		{
		pAnal->pszFeatures = pStrList->pszString;
		pAnal = pAnal->pNext;
		}
	if (	(pStrList->pszString != NULL) &&
		(strcmp(pStrList->pszString, "") != 0) )
		bAllEmpty = FALSE;
	pNextStrList = pStrList->pNext;
	freeMemory(pStrList);
	}
	if (bAllEmpty)
	{
	for ( pAnal = pTemplate_out->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		{
		if (pAnal->pszFeatures != NULL)
		{
		freeMemory(pAnal->pszFeatures);
		pAnal->pszFeatures = NULL;
		}
		}
	}
	}
if (pRecord_in->pszUf != NULL)			/* "\\u" */
	{
	bAllEmpty = TRUE;
	for (   pStrList = fill_strlist(pRecord_in->pszUf + 3),
		pAnal = pTemplate_out->pAnalyses ;
		pStrList ;
		pStrList = pNextStrList )
	{
	if (pAnal != NULL)
		{
		pAnal->pszUnderlyingForm = pStrList->pszString;
		pAnal = pAnal->pNext;
		}
	if (	(pStrList->pszString != NULL) &&
		(strcmp(pStrList->pszString, "") != 0) )
		bAllEmpty = FALSE;
	pNextStrList = pStrList->pNext;
	freeMemory(pStrList);
	}
	if (bAllEmpty)
	{
	for ( pAnal = pTemplate_out->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		{
		if (pAnal->pszUnderlyingForm != NULL)
		{
		freeMemory(pAnal->pszUnderlyingForm);
		pAnal->pszUnderlyingForm = NULL;
		}
		}
	}
	}
if (pRecord_in->pszOrigWord != NULL)		/* "\\w" */
	pTemplate_out->pszOrigWord = duplicateString(pRecord_in->pszOrigWord + 3);
if (pRecord_in->pszFormat != NULL)		/* "\\f" */
	pTemplate_out->pszFormat = duplicateString(pRecord_in->pszFormat + 3);
if (pRecord_in->pszCapital != NULL)		/* "\\c" */
	pTemplate_out->iCapital = atoi(pRecord_in->pszCapital + 3);
if (pRecord_in->pszNonAlpha != NULL)		/* "\\n" */
	pTemplate_out->pszNonAlpha = duplicateString(pRecord_in->pszNonAlpha + 3);
}

/*****************************************************************************
 * NAME
 *    same_string
 * DESCRIPTION
 *    compare the two strings for being the same
 * RETURN VALUE
 *    TRUE if the strings are equal, FALSE if they differ
 */
static int same_string( pszFirst_in, pszSecond_in )
char *	pszFirst_in;
char *	pszSecond_in;
{
if ((pszFirst_in == NULL) && (pszSecond_in == NULL))
	return TRUE;
if ((pszFirst_in == NULL) || (pszSecond_in == NULL))
	return FALSE;
if (strcmp(pszFirst_in, pszSecond_in) == 0)
	return TRUE;
else
	return FALSE;
}

/*****************************************************************************
 * NAME
 *    same_analysis
 * DESCRIPTION
 *    compare two WordAnalysis data structures
 * RETURN VALUE
 *    1 if they're the same, 0 if they're different
 */
int same_analysis(pFirst_in, pSecond_in)
WordAnalysis *	pFirst_in;
WordAnalysis *	pSecond_in;
{
if ((pFirst_in == NULL) && (pSecond_in == NULL))
	return 1;
if ((pFirst_in == NULL) || (pSecond_in == NULL))
	return 0;

if (	same_string(pFirst_in->pszAnalysis, pSecond_in->pszAnalysis) &&
	same_string(pFirst_in->pszDecomposition,
			pSecond_in->pszDecomposition) &&
	same_string(pFirst_in->pszCategory, pSecond_in->pszCategory) &&
	same_string(pFirst_in->pszProperties,
			pSecond_in->pszProperties) &&
	same_string(pFirst_in->pszFeatures, pSecond_in->pszFeatures) &&
	same_string(pFirst_in->pszUnderlyingForm,
			pSecond_in->pszUnderlyingForm) )
	return 1;
else
	return 0;
}

/*****************************************************************************
 * NAME
 *    parallel_equivalent
 * DESCRIPTION
 *    compare the WordAnalysis lists in two template structures
 * RETURN VALUE
 *    1 if the two templates are equivalent, 0 if they differ
 */
int parallel_equivalent(pFirst_in, pSecond_in)
WordTemplate *	pFirst_in;
WordTemplate *	pSecond_in;
{
WordAnalysis *	p1stAnal;
WordAnalysis *	p2ndAnal;
int		bMatch;

if ((pFirst_in->pAnalyses == NULL) && (pSecond_in->pAnalyses == NULL))
	return 1;
if ((pFirst_in->pAnalyses == NULL) || (pSecond_in->pAnalyses == NULL))
	return 0;

for (   p1stAnal = pFirst_in->pAnalyses, p2ndAnal = pSecond_in->pAnalyses ;
	p1stAnal && p2ndAnal ;
	p1stAnal = p1stAnal->pNext, p2ndAnal = p2ndAnal->pNext )
	;
if ((p1stAnal != NULL) || (p2ndAnal != NULL))
	return 0;		/* different numbers of ambiguities */

for ( p1stAnal = pFirst_in->pAnalyses ; p1stAnal ; p1stAnal = p1stAnal->pNext )
	{
	bMatch = 0;
	for (   p2ndAnal = pSecond_in->pAnalyses ;
		p2ndAnal ;
		p2ndAnal = p2ndAnal->pNext )
	{
	if (same_analysis(p1stAnal, p2ndAnal))
		{
		bMatch = 1;
		break;
		}
	}
	if (!bMatch)
	return 0;
	}
for (p2ndAnal = pSecond_in->pAnalyses ; p2ndAnal ; p2ndAnal = p2ndAnal->pNext)
	{
	bMatch = 0;
	for (   p1stAnal = pFirst_in->pAnalyses ;
		p1stAnal ;
		p1stAnal = p1stAnal->pNext )
	{
	if (same_analysis(p2ndAnal, p1stAnal))
		{
		bMatch = 1;
		break;
		}
	}
	if (!bMatch)
	return 0;
	}

return 1;
}

/*****************************************************************************
 * NAME
 *    equivalent_templates
 * DESCRIPTION
 *    compare two template structures
 * RETURN VALUE
 *    1 if the two templates are equivalent, 0 if they differ
 */
int equivalent_templates(pFirst_in, pSecond_in)
WordTemplate *	pFirst_in;
WordTemplate *	pSecond_in;
{
if ((pFirst_in == NULL) && (pSecond_in == NULL))
	return 1;
if ((pFirst_in == NULL) || (pSecond_in == NULL))
	return 0;

if (pFirst_in->iCapital != pSecond_in->iCapital)
	return 0;

if ((pFirst_in->pszOrigWord != NULL) && (pSecond_in->pszOrigWord != NULL))
	{
	if (strcmp(pFirst_in->pszOrigWord, pSecond_in->pszOrigWord) != 0)
	return 0;
	}
else if ((pFirst_in->pszOrigWord != NULL) || (pSecond_in->pszOrigWord != NULL))
	return 0;

if ((pFirst_in->pszFormat != NULL) && (pSecond_in->pszFormat != NULL))
	{
	if (strcmp(pFirst_in->pszFormat, pSecond_in->pszFormat) != 0)
	return 0;
	}
else if ((pFirst_in->pszFormat != NULL) || (pSecond_in->pszFormat != NULL))
	return 0;

if ((pFirst_in->pszNonAlpha != NULL) && (pSecond_in->pszNonAlpha != NULL))
	{
	if (strcmp(pFirst_in->pszNonAlpha, pSecond_in->pszNonAlpha) != 0)
	return 0;
	}
else if ((pFirst_in->pszNonAlpha != NULL) || (pSecond_in->pszNonAlpha != NULL))
	return 0;

return parallel_equivalent(pFirst_in, pSecond_in);
}

/*****************************************************************************
 * NAME
 *    erase_template
 * DESCRIPTION
 *    free the contents of a template, but not the template itself
 * RETURN VALUE
 *    none
 */
void erase_template(pTemplate_io)
WordTemplate *	pTemplate_io;
{
WordAnalysis *	pAnal;
WordAnalysis *	pNextAnal;

if (pTemplate_io == NULL)
	return;
for ( pAnal = pTemplate_io->pAnalyses ; pAnal ; pAnal = pNextAnal )
	{
	if (pAnal->pszAnalysis != NULL)
	freeMemory( pAnal->pszAnalysis );
	if (pAnal->pszDecomposition != NULL)
	freeMemory( pAnal->pszDecomposition );
	if (pAnal->pszCategory != NULL)
	freeMemory( pAnal->pszCategory );
	if (pAnal->pszProperties != NULL)
	freeMemory( pAnal->pszProperties );
	if (pAnal->pszFeatures != NULL)
	freeMemory( pAnal->pszFeatures );
	if (pAnal->pszUnderlyingForm != NULL)
	freeMemory( pAnal->pszUnderlyingForm );
	pNextAnal = pAnal->pNext;
	freeMemory( pAnal );
	}
pTemplate_io->pAnalyses = NULL;

if (pTemplate_io->pszOrigWord != NULL)
	{
	freeMemory(pTemplate_io->pszOrigWord);
	pTemplate_io->pszOrigWord = NULL;
	}
if (pTemplate_io->pszFormat != NULL)
	{
	freeMemory(pTemplate_io->pszFormat);
	pTemplate_io->pszFormat = NULL;
	}
pTemplate_io->iCapital = 0;
if (pTemplate_io->pszNonAlpha != NULL)
	{
	freeMemory(pTemplate_io->pszNonAlpha);
	pTemplate_io->pszNonAlpha = NULL;
	}
}

WordAnalysis **	paFirstAnal_m  = NULL;
unsigned	uiFirstSize_m  = 0;
WordAnalysis **	paSecondAnal_m = NULL;
unsigned 	uiSecondSize_m = 0;
#define safe_string(x) ((x) ? (x) : "(null)")

/*****************************************************************************
 * NAME
 *    print_formatting
 * DESCRIPTION
 *    print a "format information" string, doubling tab characters that occur
 *    immediately following a newline
 * RETURN VALUE
 *    none
 */
void print_formatting(pszString_in)
char *	pszString_in;
{
char *	p;
char	cPrevious = 0;

if (pszString_in != NULL)
	{
	for ( p = pszString_in ; *p ; ++p )
	{
	if ((cPrevious == '\n') && (*p == '\t'))
		putchar('\t');
	putchar(*p);
	cPrevious = *p;
	}
	}
putchar('\n');
}

/*****************************************************************************
 * NAME
 *    show_differences
 * DESCRIPTION
 *    write the two templates to the standard output, trying to highlight the
 *    differences in a reasonable fashion
 * RETURN VALUE
 *    none
 */
void show_differences(pFirstTemplate_in, pSecondTemplate_in)
WordTemplate *	pFirstTemplate_in;
WordTemplate *	pSecondTemplate_in;
{
WordAnalysis *	p1stAnal;
WordAnalysis *	p2ndAnal;
unsigned	ui1stAmbigCount = 0;
unsigned	ui2ndAmbigCount = 0;
char		cCompare = '=';
unsigned	i;
unsigned	j;

if ((pFirstTemplate_in == NULL) && (pSecondTemplate_in == NULL))
	return;
for (	p1stAnal = pFirstTemplate_in->pAnalyses ;
	p1stAnal ;
	p1stAnal = p1stAnal->pNext )
	++ui1stAmbigCount;
for (	p2ndAnal = pSecondTemplate_in->pAnalyses ;
	p2ndAnal ;
	p2ndAnal = p2ndAnal->pNext )
	++ui2ndAmbigCount;
if (ui1stAmbigCount < ui2ndAmbigCount)
	cCompare = '<';
if (ui1stAmbigCount > ui2ndAmbigCount)
	cCompare = '>';

if (ui1stAmbigCount > 0)
	{
	if (ui1stAmbigCount > uiFirstSize_m)
	{
	uiFirstSize_m = ui1stAmbigCount + 10;
	if (paFirstAnal_m == NULL)
		paFirstAnal_m = allocMemory(uiFirstSize_m *
						sizeof(WordAnalysis *));
	else
		paFirstAnal_m = reallocMemory(paFirstAnal_m, uiFirstSize_m *
							   sizeof(WordAnalysis *));
	}
	for (   i = 0, p1stAnal = pFirstTemplate_in->pAnalyses ;
		p1stAnal ;
		p1stAnal = p1stAnal->pNext, ++i )
	paFirstAnal_m[i] = p1stAnal;
	}
if (ui2ndAmbigCount > 0)
	{
	if (ui2ndAmbigCount > uiSecondSize_m)
	{
	uiSecondSize_m = ui2ndAmbigCount + 10;
	if (paSecondAnal_m == NULL)
		paSecondAnal_m = allocMemory(uiSecondSize_m *
						 sizeof(WordAnalysis *));
	else
		paSecondAnal_m = reallocMemory(paSecondAnal_m, uiSecondSize_m *
							   sizeof(WordAnalysis *));
	}
	for (   j = 0, p2ndAnal = pSecondTemplate_in->pAnalyses ;
		p2ndAnal ;
		p2ndAnal = p2ndAnal->pNext, ++j )
	paSecondAnal_m[j] = p2ndAnal;
	}
for ( i = 0 ; i < ui1stAmbigCount ; ++i )
	{
	if (paFirstAnal_m[i] == NULL)
	continue;
	for ( j = 0 ; j < ui2ndAmbigCount ; ++j )
	{
	if (paSecondAnal_m[j] == NULL)
		continue;
	if (same_analysis(paFirstAnal_m[i], paSecondAnal_m[j]))
		{
		printf("\t\\a   %s\n",
		   safe_string(paFirstAnal_m[i]->pszAnalysis));
		if (paFirstAnal_m[i]->pszDecomposition != NULL)
		printf("\t\\d   %s\n",
			   safe_string(paFirstAnal_m[i]->pszDecomposition));
		if (paFirstAnal_m[i]->pszCategory != NULL)
		printf("\t\\cat %s\n",
			   safe_string(paFirstAnal_m[i]->pszCategory));
		if (paFirstAnal_m[i]->pszProperties != NULL)
		printf("\t\\p   %s\n",
			   safe_string(paFirstAnal_m[i]->pszProperties));
		if (paFirstAnal_m[i]->pszFeatures != NULL)
		printf("\t\\fd  %s\n",
			   safe_string(paFirstAnal_m[i]->pszFeatures));
		if (paFirstAnal_m[i]->pszUnderlyingForm != NULL)
		printf("\t\\u   %s\n",
			   safe_string(paFirstAnal_m[i]->pszUnderlyingForm));
		paFirstAnal_m[i] = NULL;
		paSecondAnal_m[j] = NULL;
		}
	}
	}
for ( i = 0 ; i < ui1stAmbigCount ; ++i )
	{
	if (paFirstAnal_m[i] == NULL)
	continue;
	for ( j = 0 ; j < ui2ndAmbigCount ; ++j )
	{
	if (paSecondAnal_m[j] == NULL)
		continue;
	if (same_string(paFirstAnal_m[i]->pszAnalysis,
			paSecondAnal_m[j]->pszAnalysis))
		printf("\t\\a   %s\n",
		   safe_string(paFirstAnal_m[i]->pszAnalysis));
	else
		printf("diff:\t\\a   %s\n\t     %s\n",
		   safe_string(paFirstAnal_m[i]->pszAnalysis),
		   safe_string(paSecondAnal_m[j]->pszAnalysis));
	if (	(paFirstAnal_m[i]->pszDecomposition != NULL) ||
		(paSecondAnal_m[j]->pszDecomposition != NULL) )
		{
		if (same_string(paFirstAnal_m[i]->pszDecomposition,
				paSecondAnal_m[j]->pszDecomposition))
		printf("\t\\d   %s\n",
			   safe_string(paFirstAnal_m[i]->pszDecomposition));
		else
		printf("diff:\t\\d   %s\n\t     %s\n",
			   safe_string(paFirstAnal_m[i]->pszDecomposition),
			   safe_string(paSecondAnal_m[j]->pszDecomposition));
		}
	if (	(paFirstAnal_m[i]->pszCategory != NULL) ||
		(paSecondAnal_m[j]->pszCategory != NULL) )
		{
		if (same_string(paFirstAnal_m[i]->pszCategory,
				paSecondAnal_m[j]->pszCategory))
		printf("\t\\cat %s\n",
			   safe_string(paFirstAnal_m[i]->pszCategory));
		else
		printf("diff:\t\\cat %s\n\t     %s\n",
			   safe_string(paFirstAnal_m[i]->pszCategory),
			   safe_string(paSecondAnal_m[j]->pszCategory));
		}
	if (	(paFirstAnal_m[i]->pszProperties != NULL) ||
		(paSecondAnal_m[j]->pszProperties != NULL) )
		{
		if (same_string(paFirstAnal_m[i]->pszProperties,
				paSecondAnal_m[j]->pszProperties))
		printf("\t\\p   %s\n",
			   safe_string(paFirstAnal_m[i]->pszProperties));
		else
		printf("diff:\t\\p   %s\n\t     %s\n",
			   safe_string(paFirstAnal_m[i]->pszProperties),
			   safe_string(paSecondAnal_m[j]->pszProperties));
		}
	if (	(paFirstAnal_m[i]->pszFeatures != NULL) ||
		(paSecondAnal_m[j]->pszFeatures != NULL) )
		{
		if (same_string(paFirstAnal_m[i]->pszFeatures,
				paSecondAnal_m[j]->pszFeatures))
		printf("\t\\fd  %s\n",
			   safe_string(paFirstAnal_m[i]->pszFeatures));
		else
		printf("diff:\t\\fd  %s\n\t     %s\n",
			   safe_string(paFirstAnal_m[i]->pszFeatures),
			   safe_string(paSecondAnal_m[j]->pszFeatures));
		}
	if (	(paFirstAnal_m[i]->pszUnderlyingForm != NULL) ||
		(paSecondAnal_m[j]->pszUnderlyingForm != NULL) )
		{
		if (same_string(paFirstAnal_m[i]->pszUnderlyingForm,
				paSecondAnal_m[j]->pszUnderlyingForm))
		printf("\t\\u   %s\n",
			   safe_string(paFirstAnal_m[i]->pszUnderlyingForm));
		else
		printf("diff:\t\\u   %s\n\t     %s\n",
			   safe_string(paFirstAnal_m[i]->pszUnderlyingForm),
			   safe_string(paSecondAnal_m[j]->pszUnderlyingForm));
		}
	paFirstAnal_m[i] = NULL;
	paSecondAnal_m[j] = NULL;
	break;
	}
	if (paFirstAnal_m[i] == NULL)
	continue;
	printf("diff:\t\\a   %s\n\t     [missing in %s]\n",
	   safe_string(paFirstAnal_m[i]->pszAnalysis),
	   pszSecondFile_g);
	if (paFirstAnal_m[i]->pszDecomposition != NULL)
	printf("diff:\t\\d   %s\n\t     [missing in %s]\n",
		   safe_string(paFirstAnal_m[i]->pszDecomposition),
		   pszSecondFile_g);
	if (paFirstAnal_m[i]->pszCategory != NULL)
	printf("diff:\t\\cat %s\n\t     [missing in %s]\n",
		   safe_string(paFirstAnal_m[i]->pszCategory),
		   pszSecondFile_g);
	if (paFirstAnal_m[i]->pszProperties != NULL)
	printf("diff:\t\\p   %s\n\t     [missing in %s]\n",
		   safe_string(paFirstAnal_m[i]->pszProperties),
		   pszSecondFile_g);
	if (paFirstAnal_m[i]->pszFeatures != NULL)
	printf("diff:\t\\fd  %s\n\t     [missing in %s]\n",
		   safe_string(paFirstAnal_m[i]->pszFeatures),
		   pszSecondFile_g);
	if (paFirstAnal_m[i]->pszUnderlyingForm != NULL)
	printf("diff:\t\\u   %s\n\t     [missing in %s]\n",
		   safe_string(paFirstAnal_m[i]->pszUnderlyingForm),
		   pszSecondFile_g);
	paFirstAnal_m[i] = NULL;
	}
for ( j = 0 ; j < ui2ndAmbigCount ; ++j )
	{
	if (paSecondAnal_m[j] == NULL)
	continue;
	printf("diff:\t\\a   [missing in %s]\n\t     %s\n",
	   pszFirstFile_g,
	   safe_string(paSecondAnal_m[j]->pszAnalysis));
	if (paSecondAnal_m[j]->pszDecomposition != NULL)
	printf("diff:\t\\d   [missing in %s]\n\t     %s\n",
		   pszFirstFile_g,
		   safe_string(paSecondAnal_m[j]->pszDecomposition));
	if (paSecondAnal_m[j]->pszCategory != NULL)
	printf("diff:\t\\cat [missing in %s]\n\t     %s\n",
		   pszFirstFile_g,
		   safe_string(paSecondAnal_m[j]->pszCategory));
	if (paSecondAnal_m[j]->pszProperties != NULL)
	printf("diff:\t\\p   [missing in %s]\n\t     %s\n",
		   pszFirstFile_g,
		   safe_string(paSecondAnal_m[j]->pszProperties));
	if (paSecondAnal_m[j]->pszFeatures != NULL)
	printf("diff:\t\\fd  [missing in %s]\n\t     %s\n",
		   pszFirstFile_g,
		   safe_string(paSecondAnal_m[j]->pszFeatures));
	if (paSecondAnal_m[j]->pszUnderlyingForm != NULL)
	printf("diff:\t\\u   [missing in %s]\n\t     %s\n",
		   pszFirstFile_g,
		   safe_string(paSecondAnal_m[j]->pszUnderlyingForm));
	paSecondAnal_m[j] = NULL;
	}

if (	(pFirstTemplate_in->pszOrigWord != NULL) &&
	(pSecondTemplate_in->pszOrigWord != NULL) )
	{
	if (strcmp(pFirstTemplate_in->pszOrigWord,
		   pSecondTemplate_in->pszOrigWord) == 0)
	printf("\t\\w   %s\n", pFirstTemplate_in->pszOrigWord);
	else
	printf("diff:\t\\w   %s\n\t     %s\n",
		   pFirstTemplate_in->pszOrigWord,
		   pSecondTemplate_in->pszOrigWord);
	}
else if (pFirstTemplate_in->pszOrigWord != NULL)
	printf("diff:\t\\w   %s\n\t     [missing in %s]\n",
	   pFirstTemplate_in->pszOrigWord,
	   pszSecondFile_g);
else if (pSecondTemplate_in->pszOrigWord != NULL)
	printf("diff:\t\\w   [missing in %s]\n\t     %s\n",
	   pszFirstFile_g,
	   pSecondTemplate_in->pszOrigWord);

if (	(pFirstTemplate_in->pszFormat != NULL) &&
	(pSecondTemplate_in->pszFormat != NULL) )
	{
	if (strcmp(pFirstTemplate_in->pszFormat,
		   pSecondTemplate_in->pszFormat) == 0)
	{
	printf("\t\\f   ");
	print_formatting(pFirstTemplate_in->pszFormat);
	}
	else
	{
	printf("diff:\t\\f   ");
	print_formatting(pFirstTemplate_in->pszFormat);
	printf("\t     ");
	print_formatting(pSecondTemplate_in->pszFormat);
	}
	}
else if (pFirstTemplate_in->pszFormat != NULL)
	{
	printf("diff:\t\\f   ");
	print_formatting(pFirstTemplate_in->pszFormat);
	printf("\t     [missing in %s]\n", pszSecondFile_g);
	}
else if (pSecondTemplate_in->pszFormat != NULL)
	{
	printf("diff:\t\\f   [missing in %s]\n\t     ", pszFirstFile_g);
	print_formatting(pSecondTemplate_in->pszFormat);
	}

if (pFirstTemplate_in->iCapital != pSecondTemplate_in->iCapital)
	printf("diff:\t\\c   %ld\n\t     %ld\n",
	   pFirstTemplate_in->iCapital, pSecondTemplate_in->iCapital);
else if (pFirstTemplate_in->iCapital != 0)
	printf("\t\\c   %ld\n", pFirstTemplate_in->iCapital);

if (	(pFirstTemplate_in->pszNonAlpha != NULL) &&
	(pSecondTemplate_in->pszNonAlpha != NULL) )
	{
	if (strcmp(pFirstTemplate_in->pszNonAlpha,
		   pSecondTemplate_in->pszNonAlpha) == 0)
	{
	printf("\t\\n   ");
	print_formatting(pFirstTemplate_in->pszNonAlpha);
	}
	else
	{
	printf("diff:\t\\n   ");
	print_formatting(pFirstTemplate_in->pszNonAlpha);
	printf("\t     ");
	print_formatting(pSecondTemplate_in->pszNonAlpha);
	}
	}
else if (pFirstTemplate_in->pszNonAlpha != NULL)
	{
	printf("diff:\t\\n   ");
	print_formatting(pFirstTemplate_in->pszNonAlpha);
	printf("\t     [missing in %s]\n", pszSecondFile_g);
	}
else if (pSecondTemplate_in->pszNonAlpha != NULL)
	{
	printf("diff:\t\\n   [missing in %s]\n\t     ", pszFirstFile_g);
	print_formatting(pSecondTemplate_in->pszNonAlpha);
	}

printf("\n");
}

/*****************************************************************************
 * NAME
 *    exit_anadiff
 * DESCRIPTION
 *    exit the program with the given status, after first displaying any
 *    needed message
 * RETURN VALUE
 *    none
 */
void exit_anadiff(iExitStatus_in)
int	iExitStatus_in;
{
#ifdef MACINTOSH
fprintf(stderr, "\nUse the Quit command on the File menu (Command-Q)\n");
#endif
#ifdef QUICKWIN
fprintf(stderr, "\nUse the Exit command on the File menu (Control-C)\n");
#endif
exit(iExitStatus_in);
}

/*****************************************************************************
 * NAME
 *    summarize
 * DESCRIPTION
 *    write a summary of the differences between the two files
 * RETURN VALUE
 *    none
 */
static void summarize(pOutputFP_in, iDifferenceCount_in, iIdenticalCount_in,
			  iCount_in)
FILE *	pOutputFP_in;
long	iDifferenceCount_in;
long	iIdenticalCount_in;
long	iCount_in;
{
if (iDifferenceCount_in)
	fprintf(pOutputFP_in, "%s and %s differ %ld times",
		pszFirstFile_g, pszSecondFile_g, iDifferenceCount_in);
else
	fprintf(pOutputFP_in, "%s and %s are the same",
		pszFirstFile_g, pszSecondFile_g);
fprintf(pOutputFP_in, " (%ld of %ld are identical)\n",
	iIdenticalCount_in, iCount_in);
}

/*****************************************************************************
 * NAME
 *    main
 * DESCRIPTION
 *    compare two ANA files
 * RETURN VALUE
 *    0 if files are the same, 1 if they differ, 2 if an error
 */
int main(argc, argv)
int	argc;
char **	argv;
{
int		bError   = FALSE;
int		bQuiet   = FALSE;
int		bSilent  = FALSE;
int		bVerbose = FALSE;
int		iFirst;
FILE *		pFirstFP;
FILE *		pSecondFP;
WordTemplate	sFirstTemplate;
WordTemplate	sSecondTemplate;
Record		sFirstRecord;
Record		sSecondRecord;
long		iDifferenceCount = 0;
long		iCount = 0;
long		iIdenticalCount = 0;
int		k;

#ifdef USE_CCOMMAND
	fprintf(stderr, "\
ANADIFF %d.%d%c%d (%s)\n\
		Copyright %s by Summer Institute of Linguistics\n\
",	    iAnadiffVersion_g, iAnadiffRevision_g, chAnadiffPatchsep_g,
		iAnadiffPatchlevel_g, pszAnadiffDate_g, pszAnadiffYear_g);
argc = ccommand(&argv);
#endif

while ((k = getopt(argc,argv,"a:qv")) != EOF)
	{
	switch (k)
	{
	case 'a':
		cAmbigMarker_g = *optarg;
		break;

	case 'q':
		if (bQuiet)
		bSilent = TRUE;
		bQuiet = TRUE;
		break;

	case 'v':
		bVerbose = TRUE;
		break;

	default:
		bError = TRUE;
		break;
	}
	}
iFirst = optind;
if ((argc - iFirst) != 2)
	bError = TRUE;

#ifndef USE_CCOMMAND
if (bError || bVerbose)
	fprintf(stderr, "\
ANADIFF %d.%d%c%d (%s)\n\
		Copyright %s by Summer Institute of Linguistics\n\
",	    iAnadiffVersion_g, iAnadiffRevision_g, chAnadiffPatchsep_g,
		iAnadiffPatchlevel_g, pszAnadiffDate_g, pszAnadiffYear_g);
#endif
if (bError)
	{
	fprintf(stderr, "\
usage: anadiff [-a C] [-q | -v] file1.ana file2.ana\n\
  -a char  specify the ambiguity marker character (default is %%)\n\
  -q       operate quietly with minimal (screen) output\n\
  -qq      operate silently without any (screen) output\n\
  -v       operate verbosely with extra (screen) output\n\
");
	exit_anadiff(EXIT_FAILURE);
	}
pszFirstFile_g  = argv[iFirst];
pszSecondFile_g = argv[iFirst+1];

pFirstFP  = fopen(pszFirstFile_g, "r");
pSecondFP = fopen(pszSecondFile_g, "r");
if (pFirstFP == NULL)
	fprintf(stderr, "Cannot open %s\n", pszFirstFile_g);
if (pSecondFP == NULL)
	fprintf(stderr, "Cannot open %s\n", pszSecondFile_g);
if ((pFirstFP == NULL) || (pSecondFP == NULL))
	{
	exit_anadiff(EXIT_FAILURE);
	}
memset(&sFirstTemplate,  NUL, sizeof(WordTemplate));
memset(&sSecondTemplate, NUL, sizeof(WordTemplate));

memset(&sFirstRecord,  NUL, sizeof(Record));
memset(&sSecondRecord, NUL, sizeof(Record));
while (	load_record(pFirstFP,  &sFirstRecord)  &&
	load_record(pSecondFP, &sSecondRecord) )
	{
	++iCount;
	if (equal_records(&sFirstRecord, &sSecondRecord))
	{
	++iIdenticalCount;
	erase_record(&sFirstRecord);
	erase_record(&sSecondRecord);
	continue;
	}
	fill_template(&sFirstTemplate,  &sFirstRecord);
	fill_template(&sSecondTemplate, &sSecondRecord);
	if (!equivalent_templates(&sFirstTemplate, &sSecondTemplate))
	{
	++iDifferenceCount;
	if (!bQuiet || !isatty(fileno(stdout)))
		show_differences( &sFirstTemplate, &sSecondTemplate );
	}
	erase_record(&sFirstRecord);
	erase_record(&sSecondRecord);
	erase_template(&sFirstTemplate);
	erase_template(&sSecondTemplate);
	}
if (	(iDifferenceCount == 0) &&
	(memcmp(&sFirstTemplate,
		&sSecondTemplate, sizeof(WordTemplate)) != 0) )
	{
	iDifferenceCount = 1;
	if (!bQuiet || !isatty(fileno(stdout)))
	show_differences( &sFirstTemplate, &sSecondTemplate );
	}
fclose(pFirstFP);
fclose(pSecondFP);

if (!bSilent)
	summarize(stderr, iDifferenceCount, iIdenticalCount, iCount);
if (!isatty(fileno(stdout)))
	summarize(stdout, iDifferenceCount, iIdenticalCount, iCount);

exit_anadiff(iDifferenceCount);

return iDifferenceCount;		/* (not reached) */
}
