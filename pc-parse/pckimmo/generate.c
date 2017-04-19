/* GENERATE.C - generator function for PC-KIMMO
 ***************************************************************************
 *
 * KimmoResult * applyKimmoGenerator(unsigned char * pszLexForm_in,
 *				     KimmoData *     pKimmo_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1989, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern VOIDP  memcpy  P((VOIDP dest, const VOIDP src, size_t n));
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strcpy  P((char * dest, const char * src));
extern char * strcat  P((char * dest, const char * src));
extern char * strchr  P((const char * s, int c));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "kimmo.h"
#include "kimmodef.h"

#ifndef MAXLINELEN
#define MAXLINELEN 255		/* nominal maximum line length */
#endif
/*
 *  local storage of invariant parameters for processing data
 */
/*
 *  local copy of data for the current language
 */
static KimmoData	sKimmoData_m;
/*
 *  local storage for the current result string (dynamically allocated)
 */
static KimmoResult *	pResultList_m;
static unsigned char *	pszResult_m = (unsigned char *)NULL;
static int		uiResultAllocated_m = 0;

static jmp_buf		sCancelPoint_m;
static unsigned long	uiProgressCount_m;

#define TRACE(tracelevel,genlev,dir,lc,sc,states,rule,type) \
{\
if (sKimmoData_m.iTraceLevel >= tracelevel)\
	{\
	if (sKimmoData_m.pLogFP != (FILE *)NULL)\
	traceG(sKimmoData_m.pLogFP, genlev, dir, lc, sc, states, rule, type);\
	if (!sKimmoData_m.bSilent)\
	traceG(stderr, genlev, dir, lc, sc, states, rule, type);\
	}\
}

#define NORMAL_T  0
#define BLOCK_T   1
#define FAIL_T    2

#ifdef applec
#pragma segment S_generate
#endif

/****************************************************************************
 * NAME
 *    traceG
 * ARGUMENTS
 *    outfp     - output FILE pointer
 *    level     - depth of recursion (actually number of chars in result)
 *    dir       - special flag character
 *    lch       - lexical character
 *    sch       - surface character
 *    states    - current vector of rule states
 *    ruleNum   - number of the rule that blocked
 *    tracetype - type of trace output desired
 * DESCRIPTION
 *    Produce one line of tracing output
 * RETURN VALUE
 *    none
 */
static void traceG(outfp,level,dir,lch,sch,states,ruleNum,tracetype)
FILE *outfp;
int level;
unsigned char dir;
int lch;
int sch;
int *states;
unsigned ruleNum;
int tracetype;
{
size_t i;
unsigned char lc, sc;
char char_fmt[40];

lc = lch;
sc = sch;
fprintf( outfp, "%2d%c ", level, dir );
i = strlen((char *)sKimmoData_m.ppszAlphabet[0]);
if (lch == -1)
	{
	for ( ++i ; i > 0 ; --i )
		fprintf(outfp, "  ");
	}
else
	{
	sprintf(char_fmt, "%%%zus:%%-%zus ", i, i);
	fprintf(outfp, char_fmt, convertKimmoIndexToCharacter(lc, &sKimmoData_m),
		convertKimmoIndexToCharacter(sc, &sKimmoData_m) );
	}

switch (tracetype)
	{
	case NORMAL_T:
	if (states != (int *)NULL)
		{
		for ( i = 0 ; i < sKimmoData_m.uiAutomataSize ; ++i )
		fprintf(outfp, "%2d ", states[i]);
		writeKimmoIndexString(outfp, pszResult_m, &sKimmoData_m);
		fprintf(outfp, "\n");
		}
	else
		putc( '\n', outfp);
	break;

	case BLOCK_T:
	if (sKimmoData_m.iTraceLevel >= 3)
		{
		if (states != (int *)NULL)
		{
		for ( i = 0 ; i < sKimmoData_m.uiAutomataSize ; ++i )
			{
			if (i < ruleNum)
			fprintf(outfp, "%2d ", states[i]);
			else
				fprintf(outfp, " ? ");
			}
		writeKimmoIndexString(outfp, pszResult_m, &sKimmoData_m);
		fprintf(outfp, "\n        ");
		}
		}
	fprintf( outfp, "BLOCKED BY RULE %d:  %s\n",
		 ruleNum, sKimmoData_m.pAutomata[ruleNum-1].pszName );
	break;

	case FAIL_T:
	fprintf( outfp, "END OF INPUT, FAILED RULE %d:  %s\n",
		 ruleNum, sKimmoData_m.pAutomata[ruleNum-1].pszName );
	break;

	default:
	putc( '\n', outfp);
	break;
	}
}

/****************************************************************************
 * Name
 *    add_gen_result
 * ARGUMENTS
 *    pres     - pointer to primary result string
 *    headp    - pointer to linked list of RESULT nodes
 *    nullc    - null character (not copied to output)
 *    trace    - flag to trace progress verbosely
 *    logfp    - FILE pointer for possible log file
 * DESCRIPTION
 *    Add this result to the end of the linked list of results.
 * RETURN VALUE
 *    pointer to the new beginning of the longer list of results
 */
static KimmoResult *add_gen_result(pres, headp, nullc, trace, logfp)
unsigned char *pres;
KimmoResult *headp;
unsigned nullc;
int trace;
FILE *logfp;
{
size_t i;
KimmoResult *newresp;
KimmoResult *tailp;
static char t_fmt[] = "\n    RESULT =  ";
unsigned char nullchar;

nullchar = nullc;	/* ensure 8-bit character */
if ( trace )
	{
	if (logfp != (FILE *)NULL)
	{
	fprintf(logfp, t_fmt, pres);
	writeKimmoIndexString(logfp, pres, &sKimmoData_m);
	fprintf(logfp, "\n\n");
	}
	if (!sKimmoData_m.bSilent)
	{
	fprintf(stderr, t_fmt, pres);
	writeKimmoIndexString(stderr, pres, &sKimmoData_m);
	fprintf(stderr, "\n\n");
	}
	}
/*
 *  set tailp to point to the last node in the list
 */
for (	tailp = headp ;
	(tailp != NULL) && (tailp->pNext != NULL) ;
	tailp = tailp->pNext )
	;

i = strlen((char *)pres);
newresp = (KimmoResult *)allocMemory(sizeof(KimmoResult));
newresp->pszSynthesis = (unsigned char *)allocMemory(i+1);
newresp->pAnalysis    = (KimmoMorpheme *)NULL;
newresp->pParseChart  = (PATREdgeList *)NULL;
newresp->pNext        = (KimmoResult *)NULL;

if ( tailp == (KimmoResult *)NULL )
	headp = newresp;
else
	tailp->pNext = newresp;
tailp = newresp;
strcpy((char *)newresp->pszSynthesis, (char *)pres);

return( headp );
}


/****************************************************************************
 * NAME
 *    gener
 * ARGUMENTS
 *    remainder - rest of the lexical form to generate from
 *    level     - depth of the process (== number of chars in result)
 *    config    - current states of the automata
 * DESCRIPTION
 *    Try to generate a word (surface form) from the provided lexical form.
 * RETURN VALUE
 *    nonzero if successful, 0 if unsuccessful
 */
static int gener(remainder, level, config)
unsigned char *remainder;
int level;
int *config;
{
unsigned char lc, sc;	/* current lexical and surface character pair */
int *newConfig;
int have_good_result;
int blockR;	/* blocked rule number (from moveAutomata) */
int *old, *new;
unsigned i;
KimmoPair *	pPair;

if (bCancelKimmoOperation_g)
	longjmp( sCancelPoint_m, 1 );
++uiProgressCount_m;
if ((uiProgressCount_m & 0x1FL) == 0L)
	reportProgress( uiProgressCount_m );

have_good_result = 0;
newConfig = (int *)allocMemory(
				  sKimmoData_m.uiAutomataSize * sizeof(newConfig));

/*****************************************************************
 *  try to use the null character for the lexical character
 */
for (	lc = KIMMO_ALPHA_NULL, pPair = sKimmoData_m.pFeasiblePairs ;
	(pPair = findLexical(pPair, lc)) != NULL ;
	++pPair )
	{
	sc = pPair->cSurface;
	for (   new = newConfig, old = config, i = 0 ;
		i < sKimmoData_m.uiAutomataSize ;
		++i )
	*new++ = *old++;
	TRACE(2, level, ' ', lc, sc, config, 0, NORMAL_T)
	if ((blockR = moveKimmoAutomata(lc, sc, newConfig, &sKimmoData_m)) == 0)
	{
	if (level >= uiResultAllocated_m)
		{
		uiResultAllocated_m += MAXLINELEN;
		pszResult_m = (unsigned char *)reallocMemory(pszResult_m,
							uiResultAllocated_m+1);
		}
	/* add this surface char to result */
	pszResult_m[level] = sc;
	pszResult_m[level+1] = NUL;

	have_good_result = gener(remainder, level+1, newConfig);

	/* remove old surface char for next try */
	pszResult_m[level] = NUL;
	TRACE(2, level, '<', -1, -1, config, 0, NORMAL_T)
	}
	else
	TRACE(2, level, '-', -1,-1, newConfig, blockR, BLOCK_T)
	if (have_good_result && sKimmoData_m.bLimit)
	{
	freeMemory( newConfig );
	return( have_good_result );
	}
	}

/*****************************************************************
 *  check for the end of the lexical form
 */
lc = *remainder;
if (lc == NUL)
	{
	/*****************************************************************
	 *  check the boundary character if applicable
	 */
	if (    (sKimmoData_m.cBoundary != NUL) &&
		(findLexical(sKimmoData_m.pFeasiblePairs,
			 KIMMO_ALPHA_BOUNDARY) != NULL) )
	{
	lc = KIMMO_ALPHA_BOUNDARY;
	sc = KIMMO_ALPHA_BOUNDARY;
	TRACE(2, level, ' ', lc, sc, config, 0, NORMAL_T)
	if ((blockR = moveKimmoAutomata(lc, sc, config, &sKimmoData_m)) == 0)
		TRACE(2, level, ' ',-1,-1, config, 0, NORMAL_T)
	else
		{
		TRACE(2, level, '-',-1,-1, config, blockR, BLOCK_T)
		freeMemory(newConfig);
		return(0);
		}
	}
	else
	TRACE(2, level, ' ',-1,-1, config, 0, NORMAL_T)
	i = checkKimmoFinalConfiguration(config,&sKimmoData_m);
	if (i == 0)
	{
	pResultList_m = add_gen_result(pszResult_m,
					   pResultList_m,
					   KIMMO_ALPHA_NULL,
					   sKimmoData_m.iTraceLevel,
					   sKimmoData_m.pLogFP);
	freeMemory(newConfig);
	return(1);			/* we have a good result */
	}
	else
	{
	TRACE(2, level, '-',-1,-1, (unsigned *)NULL, i, FAIL_T)
	freeMemory(newConfig);
	return(0);			/* sorry, no result */
	}
	}

/*****************************************************************
 *  try to use the provided lexical character
 */
for (	pPair = sKimmoData_m.pFeasiblePairs ;
	(pPair = findLexical(pPair, lc)) != NULL ;
	++pPair )
	{
	sc = pPair->cSurface;
	for (   new = newConfig, old = config, i = 0 ;
		i < sKimmoData_m.uiAutomataSize ;
		++i )
	*new++ = *old++;
	TRACE(2, level, ' ', lc, sc, config, 0, NORMAL_T)
	if ((blockR = moveKimmoAutomata(lc, sc, newConfig, &sKimmoData_m)) == 0)
	{
	if (level >= uiResultAllocated_m)
		{
		uiResultAllocated_m += MAXLINELEN;
		pszResult_m = (unsigned char *)reallocMemory(pszResult_m,
							uiResultAllocated_m+1);
		}
	/* add this surface char to result */
	pszResult_m[level] = sc;
	pszResult_m[level+1] = NUL;

	have_good_result = gener(remainder+1, level+1, newConfig);

	/* remove old surface char for next try */
	pszResult_m[level] = NUL;
	TRACE(2, level, '<', -1, -1, config, 0, NORMAL_T)
	}
	else
	TRACE(2, level, '-', -1,-1, newConfig, blockR, BLOCK_T)
	if (have_good_result && sKimmoData_m.bLimit)
	{
	freeMemory( newConfig );
	return( have_good_result );
	}
	}

/*****************************************************************
 *  we're through at this level, so clean up and return what happened
 */
freeMemory(newConfig);
return( have_good_result );
}

/****************************************************************************
 * NAME
 *    convert_gen_to_alpha
 * ARGUMENTS
 *    headp - pointer to linked list of KimmoResult nodes
 *    lang  - pointer to current KimmoData structure
 * DESCRIPTION
 *    convert the index values stored in the result strings into the
 *    corresponding alphabetic characters
 * RETURN VALUE
 *    none
 */
static void convert_gen_to_alpha(headp, lang)
KimmoResult *headp;
KimmoData *lang;
{
KimmoResult *gp;
unsigned char *alph;
unsigned char *p;
unsigned k;
static char buf[2] = { 0, 0 };
size_t len;

for ( gp = headp ; gp != (KimmoResult *)NULL ; gp = gp->pNext )
	{
	len = strlen((char *)lang->ppszAlphabet[0]) *
					  strlen((char *)gp->pszSynthesis) + 1;
	alph = (unsigned char *)allocMemory( len );
	alph[0] = NUL;
	for ( p = gp->pszSynthesis ; *p ; ++p )
	{
	k = *p;
	if (k <= lang->uiAlphabetSize)
		strcat((char *)alph, (char *)lang->ppszAlphabet[k-1]);
	else if (k == KIMMO_ALPHA_NULL)
		{
		buf[0] = lang->cNull;
		strcat((char *)alph, buf);
		}
	else
		strcat((char *)alph, "?");
	}
	freeMemory(gp->pszSynthesis);
	if (len == strlen((char *)alph)+1)
	gp->pszSynthesis = alph;
	else
	gp->pszSynthesis = reallocMemory(alph, strlen((char *)alph)+1);

	gp->pszResult = (unsigned char *)duplicateString((char *)gp->pszSynthesis);
	eraseKimmoNullChars((char *)gp->pszResult, lang);
	gp->pszGloss  = NULL;
	gp->bOkay     = FALSE;
	}
}

/****************************************************************************
 * NAME
 *    applyKimmoGenerator
 * DESCRIPTION
 *    Try to generate a word (surface form) from the provided lexical form.
 * RETURN VALUE
 *    pointer to list of results, or NULL if unsuccessful
 */
KimmoResult * applyKimmoGenerator(pszLexForm_in, pKimmo_in)
unsigned char *	pszLexForm_in;	/* pointer to lexical form string */
KimmoData *	pKimmo_in;	/* data for the current language */
{
unsigned	i;
int *		config;
unsigned char *	lexical_string;
/*
 *  don't bother if no language data
 */
if ((pKimmo_in == NULL) || (pKimmo_in->ppszAlphabet == NULL))
	return((KimmoResult *)NULL);
/*
 *  copy language and other invariant data into local structure
 */
memcpy( &sKimmoData_m, pKimmo_in, (size_t)sizeof(KimmoData) );

lexical_string = (unsigned char *)duplicateString((char *)pszLexForm_in);
if (!validateKimmoWordForm(lexical_string, &sKimmoData_m))
	{
	freeMemory((char *)lexical_string);
	return( NULL );    /* don't bother if invalid lexical form */
	}

config = (int *)allocMemory(sKimmoData_m.uiAutomataSize * sizeof(int));
for ( i = 0 ; i < sKimmoData_m.uiAutomataSize ; ++i )
	config[i] = 1;		/* automata all start in state 1 */

/*****************************************************************
 *  check the boundary character if applicable
 */
if (	(sKimmoData_m.cBoundary != NUL) &&
	(findLexical(sKimmoData_m.pFeasiblePairs,
			 KIMMO_ALPHA_BOUNDARY) != NULL) )
	{
	TRACE(2, 0, ' ', KIMMO_ALPHA_BOUNDARY, KIMMO_ALPHA_BOUNDARY, config, 0,
	  NORMAL_T )
	if ((i = moveKimmoAutomata(KIMMO_ALPHA_BOUNDARY,KIMMO_ALPHA_BOUNDARY,
				   config, &sKimmoData_m)) != 0)
	{
	TRACE(2, 0, '-', -1,-1, config, i, BLOCK_T )
	freeMemory(config);
	return( (KimmoResult *)NULL );
	}
	}
else
	TRACE(2, 0, ' ', -1, -1, config, 0, NORMAL_T)

pszResult_m = (unsigned char *)allocMemory(MAXLINELEN+1);
memset((char *)pszResult_m,0,MAXLINELEN+1);
uiResultAllocated_m = MAXLINELEN;
pResultList_m = (KimmoResult *)NULL;
uiProgressCount_m = 0L;
reportProgress( uiProgressCount_m );

if (setjmp( sCancelPoint_m ))
	{
	if (pResultList_m != (KimmoResult *)NULL)
	freeKimmoResult( pResultList_m, &sKimmoData_m );
	pResultList_m = (KimmoResult *)NULL;
	}
else
	{
	gener(lexical_string, 0, config);
	}

freeMemory(pszResult_m);
pszResult_m = (unsigned char *)NULL;
uiResultAllocated_m = 0;
freeMemory(config);
freeMemory(lexical_string);

convert_gen_to_alpha( pResultList_m, pKimmo_in );
return( pResultList_m );
}
