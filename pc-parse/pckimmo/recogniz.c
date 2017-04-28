/* RECOGNIZ.C - recognizer function for PC-KIMMO
 ***************************************************************************
 *
 *	KimmoResult * applyKimmoRecognizer(unsigned char * pszSurfaceForm_in,
 *					  KimmoData *     pKimmo_in)
 *
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
extern char * strcat  P((char * dest, const char * src));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strchr  P((const char * s, int c));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "kimmo.h"
#include "kimmodef.h"

#ifndef MAXLINELEN
#define MAXLINELEN 255		/* nominal maximum line length */
#endif

static void traceR P((FILE *outfp, int lev, unsigned dirch,
			  unsigned char *lexN, int lch, int sch,
			  int *states, unsigned rNr, unsigned char *rem,
			  int tracetype ));
static int recog P((unsigned char *remainder, unsigned level, int *config,
			KimmoLexicon *lexiconp, int feat_size,
			KimmoMorpheme *already ));
static KimmoResult *	add_rec_result P((KimmoMorpheme *morphs,
					  KimmoResult *headp,
					  unsigned nullchar,
					  int trace,
					  FILE *logfp));

static jmp_buf		sCancelPoint_m;
static unsigned long	uiProgressCount_m;
/*
 *  local copy of the data for the current language
 */
static KimmoData	sLang_m;

static KimmoResult *	pResultList_m;		/* local RESULT pointer */
static unsigned char *	pszResult_m = (unsigned char *)NULL;
static unsigned		uiResultAllocated_m = 0;
static unsigned char *	pszFeature_m = (unsigned char *)NULL;
static unsigned		uiFeatureAllocated_m = 0;

static NumberedMessage	sBadLexicon_m = { ERROR_MSG, 802,
	"Invalid lexicon for recognizer" };
static NumberedMessage	sEmptyLexiconSection_m = { ERROR_MSG, 803,
	"Lexicon section %s is empty" };
/*
 * simplify tracing both to stderr and an optional log file
 */
#define TRACE(tracelevel,reclev,dir,lex,lc,sc,states,rul,rem,type) \
{\
if (sLang_m.iTraceLevel >= tracelevel)\
	{\
	if (sLang_m.pLogFP != (FILE *)NULL)\
	traceR(sLang_m.pLogFP,reclev,dir,lex,lc,sc,states,rul,rem,type);\
   if (!sLang_m.bSilent)\
	traceR(stderr,reclev,dir,lex,lc,sc,states,rul,rem,type);\
	}\
}

#define NORMAL_T     0
#define BLOCK_T      1
#define RULEFAIL_T   2
#define ENTERING_T   3
#define BACKING_T    4
#define MISMATCH_T   5
#define NOTMATCH_T   6
#define NULLENTRY_T  7

#ifdef applec
#pragma segment S_recogniz
#endif

/****************************************************************************
 * Name
 *    traceR
 * ARGUMENTS
 *    outfp   - tracing output FILE pointer
 *    lev     - level number (actually length of result string)
 *    dir     - < or space
 *    lexN    - lexicon name
 *    lch     - underlying character
 *    sch     - surface character
 *    states  - states of the rules
 *    rNr     - rule number (of blocking rule)
 *    rem     - current remainder (used only w/ "BLOCKED IN LEX" msg)
 *    tracetype - type of trace output desired
 * DESCRIPTION
 *    Publish the current state for trace output.
 * RETURN VALUE
 *    none
 */
static void traceR(outfp, lev, dirch, lexN, lch, sch, states, rNr, rem,
		   tracetype)
FILE *outfp;
int lev;
unsigned dirch;
unsigned char *lexN;
int lch;
int sch;
int *states;
unsigned rNr;
unsigned char *rem;
int tracetype;
{
size_t i;
unsigned char dir, lc, sc;
char char_fmt[40];

dir = dirch;		/* ensure 8-bit characters */
lc = lch;
sc = sch;

if (lexN == (unsigned char *)NULL)
	lexN = (unsigned char *)"";
if (rem == (unsigned char *)NULL)
	rem = (unsigned char *)"";

if (	(tracetype == BACKING_T) ||
	(tracetype == ENTERING_T) ||
	(tracetype == NULLENTRY_T) )
	fprintf(outfp, "    ");
else
	fprintf( outfp, "%2d%c ", lev, dir );
i = strlen((char *)sLang_m.ppszAlphabet[0]);
if (	(tracetype == BACKING_T) ||
	(tracetype == ENTERING_T) ||
	(tracetype == NULLENTRY_T) || (lch == -1) )
	{
	for ( ++i ; i > 0 ; --i )
		fprintf(outfp, "  ");
	}
else
	{
	sprintf(char_fmt, "%%%zus:%%-%zus ", i, i);
	fprintf(outfp, char_fmt,
		convertKimmoIndexToCharacter(lc, &sLang_m),
		convertKimmoIndexToCharacter(sc, &sLang_m) );
	}

switch(tracetype)
	{
	case NORMAL_T:
	for ( i = 0 ; i < sLang_m.uiAutomataSize ; ++i )
		fprintf(outfp, "%2d ", states[i] );
	if (pszResult_m != (unsigned char *)NULL)
		{
		writeKimmoIndexString(outfp, pszResult_m, &sLang_m);
		if ((pszFeature_m != NULL) && (*pszFeature_m != NUL))
		fprintf(outfp, "   %s", pszFeature_m);
		}
	putc( '\n', outfp);
	break;

	case BLOCK_T:
	if (sLang_m.iTraceLevel >= 3)
		{
		for ( i = 0 ; i < sLang_m.uiAutomataSize ; ++i )
		{
		if (i < rNr)
			fprintf(outfp, "%2d ", states[i] );
		else
			fprintf(outfp, " ? " );
		}
		if (pszResult_m != (unsigned char *)NULL)
		{
		writeKimmoIndexString(outfp, pszResult_m, &sLang_m);
		if ((pszFeature_m != NULL) && (*pszFeature_m != NUL))
			fprintf(outfp, "   %s", pszFeature_m);
		}
		fprintf(outfp, "\n        ");
		}
	fprintf(outfp, "BLOCKED BY RULE %d: %s\n",
					rNr, sLang_m.pAutomata[rNr-1].pszName);
	break;

	case RULEFAIL_T:
	for ( i = 0 ; i < sLang_m.uiAutomataSize ; ++i )
		fprintf(outfp, "%2d ", states[i] );
	if (pszResult_m != (unsigned char *)NULL)
		{
		writeKimmoIndexString(outfp, pszResult_m, &sLang_m);
		if ((pszFeature_m != NULL) && (*pszFeature_m != NUL))
		fprintf(outfp, "   %s", pszFeature_m);
		}
	putc( '\n', outfp);
	fprintf( outfp, "        END OF INPUT, FAILED RULE %d:  %s\n",
					rNr, sLang_m.pAutomata[rNr-1].pszName);
	break;

	case ENTERING_T:
	fprintf(outfp, "ENTERING LEXICON %s\n", lexN );
	break;

	case BACKING_T:
	fprintf(outfp, "BACKING UP FROM LEXICON %s TO LEXICON %s\n", rem,
		lexN );
	break;

	case MISMATCH_T:
	fprintf(outfp, "BLOCKED IN LEXICON %s: INPUT = ", lexN );
	writeKimmoIndexString(outfp, rem, &sLang_m);
	fprintf(outfp, "\n");
	break;

	case NOTMATCH_T:
	fprintf(outfp, "LEXICAL CHARACTER NOT MATCHED IN LEXICON %s\n", lexN );
	break;

	case NULLENTRY_T:
	fprintf(outfp, "ACCEPTING NULL ENTRY IN LEXICON %s\n", lexN);
	break;

	default:
	putc('\n', outfp);
	break;
	}
}

/****************************************************************************
 * NAME
 *    add_rec_result
 * ARGUMENTS
 *    morphs - morphemes to be added
 *    headp  - pointer to linked list of KimmoResult nodes
 *    nullch - null character (not copied to output)
 *    tracef - flag to trace progress verbosely
 *    logfpo - FILE pointer for possible log file
 * DESCRIPTION
 *    Add a new result.  Make a permanent copy of the linked list of
 *    KimmoMorpheme structures, traversing the list so that the KimmoResult
 *    structure headp points to the first element rather than the last.
 *    Also if requested parse result with PC-PATR and add pointer to result.
 * RETURN VALUE
 *    pointer to the new beginning of the longer list of rec_results.
 */
static KimmoResult *add_rec_result(morphs, headp, nullch, tracef, logfpo)
KimmoMorpheme *morphs;
KimmoResult *headp;
unsigned nullch;
int tracef;
FILE *logfpo;
{
KimmoMorpheme *mp, *newmp, *nextmp;
KimmoResult *newresp;
KimmoResult *tailp;
unsigned char nullchar;
unsigned char buf[2];
PATREdgeList *patr_res;
unsigned char *p;

nullchar = nullch;	/* ensure 8-bit character */
if ( tracef )
	{
	if (logfpo != (FILE *)NULL)
	{
	if (pszResult_m != (unsigned char *)NULL)
		{
		fprintf(logfpo, "\n    RESULT = ");
		for ( p = pszResult_m ; *p ; ++p )
		fprintf(logfpo, "%s",
			convertKimmoIndexToCharacter(*p, &sLang_m));
		if ((pszFeature_m != NULL) && (*pszFeature_m != NUL))
		fprintf(logfpo, "   %s", (unsigned char *)pszFeature_m);
		}
	putc( '\n', logfpo);
	putc( '\n', logfpo);
	}
	if (!sLang_m.bSilent)
	{
	if (pszResult_m != (unsigned char *)NULL)
		{
		fprintf(stderr, "\n    RESULT = ");
		for ( p = pszResult_m ; *p ; ++p )
		fprintf(stderr, "%s",
			convertKimmoIndexToCharacter(*p, &sLang_m));
		if ((pszFeature_m != NULL) && (*pszFeature_m != NUL))
		fprintf(stderr, "   %s", (unsigned char *)pszFeature_m);
		}
	putc( '\n', stderr);
	putc( '\n', stderr);
	}
	}

/*
 * prepare the morpheme list to be added
 */
buf[0] = sLang_m.cNull;
buf[1] = NUL;

newmp = nextmp = NULL;
for ( mp = morphs ; mp ; mp = mp->pPrevious )
	{
	if (    (strcmp((char *) mp->pLexItem->pszLexString, (char *)buf) == 0) &&
		(strcmp((char *)mp->pLexItem->pszGloss, (char *)"") == 0 ) )
	;	/* don't add an empty morpheme */
	else
	{
	newmp = (KimmoMorpheme *)allocMemory(sizeof(KimmoMorpheme));
	newmp->pszLexiconSection = mp->pszLexiconSection;
	newmp->pLexItem          = mp->pLexItem;
	newmp->pPrevious         = NULL;
	newmp->pNext             = nextmp;
	if (nextmp != (KimmoMorpheme *)NULL)
		nextmp->pPrevious = newmp;
	nextmp = newmp;
	}
	}

/*
 *  Parse morpheme list using PC-PATR
 */
if (sLang_m.bUsePATR && (newmp != NULL))
	{
	if (sLang_m.sPATR.pGrammar == NULL)
	{
	patr_res = NULL;
	}
	else
	{
	patr_res = parseKimmoResultWithPATR(newmp, &sLang_m);
	}
	if (patr_res == NULL)
	{
	for ( ; newmp ; newmp = nextmp )
		{
		nextmp = newmp->pNext;
		freeMemory( newmp );
		}
	return( headp );	/* parse didn't succeed; return old result */
	}
	}
else
	patr_res = (PATREdgeList *)NULL;
/*
 *  set tailp to point to the last node in the rec_result list
 */
for (	tailp = headp ;
	(tailp != NULL) && (tailp->pNext != NULL) ;
	tailp = tailp->pNext )
	;
/*
 * add new node containing morpheme list and PATR result to rec_result list
 */
newresp = (KimmoResult *)allocMemory(sizeof(KimmoResult));
newresp->pszSynthesis = (unsigned char *)NULL;
newresp->pAnalysis    = newmp;
newresp->pParseChart  = patr_res;
newresp->pNext        = (KimmoResult *)NULL;
if ( tailp == (KimmoResult *)NULL )
	headp = newresp;
else
	tailp->pNext = newresp;
tailp = newresp;

return( headp );
}

/****************************************************************************
 * NAME
 *    recog
 * ARGUMENTS
 *    remainder  - pointer to remainder of word to process
 *    level      - recursion level (actually current length of result)
 *    config     - pointer to rules activation array
 *    lexiconp   - pointer to current Lexicon
 *    alt_wanted - pointer to acceptable alternative lexicon sections
 *    feat_size  - length of features of result we've computed so far
 *    already	 - pointer to the already recognized list of KimmoMorpheme
 *			stuctures
 * DESCRIPTION
 *    Recursively recognize a word (if possible).
 * RETURN VALUE
 *    nonzero if succeeded at least once, zero if recognition failed
 */
static int recog(remainder, level, config, lexiconp, feat_size, already)
unsigned char *remainder;
unsigned level;
int *config;
KimmoLexicon *lexiconp;
int feat_size;
KimmoMorpheme *already;
{
unsigned char	sc;		/* surface character */
unsigned char	lc;		/* lexical character */
KimmoPair *	pPair;		/* pointer to a feasible pair */
Trie *		lexiconTP;
Trie *		newTP;
KimmoLexItem *	lip;
int		fprX;
int		fprSize;
unsigned	j;
size_t		new_feat_size;
int *		newConfig;
int *		old;
int *		new;
int		blockR;
int		newLexFlag;
int		have_good_result;
int		fin;
int		rec;
short *		ccp;
KimmoLexicon	subLexicon;
KimmoLexicon *	newlexiconp;
KimmoMorpheme	newmorph;
KimmoAlternation * altp;
/*
 *  check for valid lexicon, then initialize for the rest of the function
 */
if ( lexiconp == (KimmoLexicon *)NULL )
	{
	if (!sLang_m.bSilent)
	displayNumberedMessage(&sBadLexicon_m,
				   sLang_m.bSilent, sLang_m.bShowWarnings,
				   sLang_m.pLogFP,
				   NULL, 0);
	return(0);
	}
lexiconTP = lexiconp->pStorage;
if (lexiconTP == (Trie *)NULL)
	{
	if (!sLang_m.bSilent)
	displayNumberedMessage(&sEmptyLexiconSection_m,
				   sLang_m.bSilent, sLang_m.bShowWarnings,
				   sLang_m.pLogFP,
				   NULL, 0,
				   lexiconp->pszName);
	return(0);
	}

if (bCancelKimmoOperation_g)
	longjmp( sCancelPoint_m, 1 );
++uiProgressCount_m;
if ((uiProgressCount_m & 0x1FL) == 0L)
	reportProgress( uiProgressCount_m );

newConfig = (int *)allocMemory(sLang_m.uiAutomataSize * sizeof(int));
have_good_result = 0;
newLexFlag = FALSE;

/*******************************************************************
 *  If Lexicon starts with an entry, construct new tasks for each  *
 *  lexicon in its continuation class with current Remainder,      *
 *  Configuration, and Result where Lexicon = the new lexicon      *
 *  and Features = Features with the features of the entry         *
 *  appended to it.                                                *
 *******************************************************************/

for (	lip = (KimmoLexItem *)lexiconTP->pTrieInfo ;
	lip != (KimmoLexItem *)NULL ;
	lip = lip->pNext )
	{
	if (    (lip->uiContinuation != MAX_USHORT) &&
		(lip->uiContinuation < sLang_m.uiAlternationCount) )
	altp = &sLang_m.pAlternations[lip->uiContinuation];
	else
	altp = (KimmoAlternation *)NULL;
	if (altp != (KimmoAlternation *)NULL)
	{
		/*
	 *  step through each of the continuation lexicons
	 */
	for ( ccp = altp->piLexicons ; *ccp != -1 ; ++ccp )
		{
		newlexiconp = &(sLang_m.pLexiconSections[*ccp]);
		newLexFlag = TRUE;
		TRACE(1, 0, 0, newlexiconp->pszName, 0,0, NULL, 0,NULL,ENTERING_T)
		for (   new = newConfig, old = config, j = 0 ;
			j < sLang_m.uiAutomataSize ;
			++j )
		*new++ = *old++;
		/*
		 *  add the feature of the lexical item we've just recognized
		 */
		new_feat_size = feat_size + strlen( (char *)lip->pszGloss );
		while (new_feat_size >= uiFeatureAllocated_m)
		{
		uiFeatureAllocated_m += MAXLINELEN;
		pszFeature_m = (unsigned char *)reallocMemory(pszFeature_m,
							 uiFeatureAllocated_m+1);
		}
		strcat((char *)pszFeature_m, (char *)lip->pszGloss);

		/*
		 *  link in a new KimmoMorpheme
		 */
		newmorph.pPrevious         = already;
		newmorph.pNext             = (KimmoMorpheme *)NULL;
		newmorph.pLexItem          = lip;
		newmorph.pszLexiconSection = lexiconp->pszName;
		if (already)
			already->pNext = &newmorph;

		/*
		 *  process the rest of the surface form with the current
		 *    continuation lexicon
		 */
		rec = recog(remainder, level, newConfig, newlexiconp,
			(int)new_feat_size, &newmorph);

		pszFeature_m[feat_size] = NUL;		/* backtrack */
		if (already)
			already->pNext = (KimmoMorpheme *)NULL;
		have_good_result += rec;
		TRACE(1, 0, 0, lexiconp->pszName, 0, 0, NULL, 0,
		  newlexiconp->pszName, BACKING_T)
		if (sLang_m.bLimit && have_good_result)
		{
		freeMemory( newConfig );
		return( have_good_result );
		}
		}
	}
	else if (remainder[0] == NUL)
	{
	/************************/
	/* we may have a result */
	/************************/
	/*****************************************************************
	 *  check the boundary character if applicable
	 */
	if (	(sLang_m.cBoundary != NUL) &&
		(findLexical(sLang_m.pFeasiblePairs,
				 KIMMO_ALPHA_BOUNDARY) != NULL) )
		{
		lc = KIMMO_ALPHA_BOUNDARY;
		sc = KIMMO_ALPHA_BOUNDARY;
		TRACE(2, level, ' ', lexiconp->pszName, lc,sc, config, 0, NULL,
		  NORMAL_T)
		if ((blockR = moveKimmoAutomata(lc, sc, config, &sLang_m)) == 0)
		TRACE(2, level, ' ', lexiconp->pszName, -1,-1, config, 0,
			  NULL, NORMAL_T)
		else
		{
		TRACE(2, level, '-', lexiconp->pszName, -1,-1, config,
			  blockR, NULL, BLOCK_T)
		goto no_result_here;	/* ugh, but ... */
		}
		}
	fin = checkKimmoFinalConfiguration(config,&sLang_m);
	if (fin == 0)
		{
		++have_good_result;
		/*
		 *  add the feature of the lexical item we've just recognized
		 */
		new_feat_size = feat_size + strlen( (char *)lip->pszGloss );
		while (new_feat_size >= uiFeatureAllocated_m)
		{
		uiFeatureAllocated_m += MAXLINELEN;
		pszFeature_m = (unsigned char *)reallocMemory(pszFeature_m,
							 uiFeatureAllocated_m+1);
		}
		strcat((char *)pszFeature_m, (char *)lip->pszGloss);

		/*
		 *  link in a new KimmoMorpheme
		 */
		newmorph.pPrevious         = already;
		newmorph.pNext             = (KimmoMorpheme *)NULL;
		newmorph.pLexItem          = lip;
		newmorph.pszLexiconSection = lexiconp->pszName;
		if (already)
			already->pNext = &newmorph;

		pResultList_m = add_rec_result(&newmorph, pResultList_m, KIMMO_ALPHA_NULL,
					 sLang_m.iTraceLevel, sLang_m.pLogFP );

		pszFeature_m[feat_size] = NUL;		/* backtrack */
		if (already)
			already->pNext = (KimmoMorpheme *)NULL;
		}
	else
		TRACE(2, level, ' ', lexiconp->pszName, -1,-1, config, fin,
		  NULL, RULEFAIL_T )
	}
no_result_here:
	if (sLang_m.bLimit && have_good_result)
	{
	freeMemory( newConfig );
	return( have_good_result );
	}
	}

/*********************************************************************
 *  Consider all feasible pairs (LexCha.0) where LexCha is the head  *
 *  of a branch in Lexicon.  If MoveAutomata succeeds with that      *
 *  pair and Configuration, construct a new task with current        *
 *  Remainder and Features where Result = Result with LexCha         *
 *  appended, Lexicon = that branch, and Configuration = the new     *
 *  configuration returned by MoveAutomata.                          *
 *********************************************************************/

fprSize = sLang_m.uiFeasiblePairsCount;
for ( sc = KIMMO_ALPHA_NULL, fprX = 0 ; fprX < fprSize ; ++fprX )
	{
	if (sLang_m.pFeasiblePairs[fprX].cSurface != KIMMO_ALPHA_NULL)
	continue;
	lc = sLang_m.pFeasiblePairs[fprX].cLexical;
	for ( newTP = lexiconTP->pChildren ; newTP ; newTP = newTP->pSiblings )
	{
	if (newTP->cLetter == lc)
		break;
	}
	if (newTP != NULL)
	{
	for (	new = newConfig, old = config, j = 0 ;
		j < sLang_m.uiAutomataSize ;
		++j )
		*new++ = *old++;
	TRACE(2, level,' ', lexiconp->pszName, lc, sc, config, 0, NULL,
		  NORMAL_T)
	if ((blockR = moveKimmoAutomata(lc, sc, newConfig, &sLang_m)) == 0)
		{
		/*
		 *  add one character to the result
		 */
		if (level >= uiResultAllocated_m)
		{
		uiResultAllocated_m += MAXLINELEN;
		pszResult_m = (unsigned char *)reallocMemory(pszResult_m, uiResultAllocated_m+1);
		}
		pszResult_m[level]   = lc;
		pszResult_m[level+1] = NUL;
		/*
		 *  point to the proper subTrie
		 */
		subLexicon.pszName    = lexiconp->pszName;
		subLexicon.pStorage = newTP;

		rec = recog(remainder, level+1, newConfig, &subLexicon, feat_size,
			already);

		pszResult_m[level] = NUL;
		have_good_result += rec;
		if (!rec)
		TRACE(2, level+1,'-', lexiconp->pszName, -1,-1, newConfig,
			  0, remainder, MISMATCH_T)
		TRACE(2, level, '<', lexiconp->pszName, -1,-1, config, 0, NULL,
		  NORMAL_T)
		}
	else
		TRACE(2, level, '-', lexiconp->pszName,-1,-1,newConfig, blockR,
		  NULL, BLOCK_T)
	}
	else
	TRACE(3, level, '-', lexiconp->pszName, lc, sc, NULL, 0, NULL,
		  NOTMATCH_T)
	if (sLang_m.bLimit && have_good_result)
	{
	freeMemory( newConfig );
	return( have_good_result );
	}
	}

/*****************************************************************
 *  if we didn't get a good result, ignore "end of lexicon" flag
 *  [ fix bug of missing valid result under these circumstances:
 *    1. (infix) insertion constrained only by preceding characters
 *    2. one lexical item is the leading substring of another up to
 *       exactly the point where the insertion occurs ]
 */
if ( !have_good_result )
	newLexFlag = FALSE;

/********************************************************************
 *  Consider all feasible pairs (LexCha.SurfCha) where LexCha is    *
 *  the head of a branch in Lexicon and SurfCha is the first        *
 *  character of Remainder.  If MoveAutomata succeeds with that     *
 *  pair and Configuration, construct a new task with current       *
 *  Features where Result = Result with LexCha appended, Lexicon =  *
 *  that branch, Remainder = tail of Remainder, and Configuration = *
 *  the new configuration returned by MoveAutomata                  *
 ********************************************************************/

for ( pPair = sLang_m.pFeasiblePairs ; pPair->cLexical ; ++pPair )
	{
	lc = pPair->cLexical;
	sc = pPair->cSurface;
	if (sc != *remainder)
	continue;		/* need matching surface character */
	for ( newTP = lexiconTP->pChildren ; newTP ; newTP = newTP->pSiblings )
	{
	if (newTP->cLetter == lc)
		break;
	}
	if ((newTP != (Trie *)NULL) || ((lc == KIMMO_ALPHA_NULL) && !newLexFlag))
	{
	for (	new = newConfig, old = config, j = 0 ;
		j < sLang_m.uiAutomataSize ;
		++j )
		*new++ = *old++;
	TRACE(2, level,' ',lexiconp->pszName, lc,sc, config, 0, NULL,NORMAL_T)
	if ((blockR = moveKimmoAutomata(lc, sc, newConfig, &sLang_m)) == 0)
		{
		/*
		 *  add the lexical character to the result
		 */
		if (level >= uiResultAllocated_m)
		{
		uiResultAllocated_m += MAXLINELEN;
		pszResult_m = (unsigned char *)reallocMemory(pszResult_m, uiResultAllocated_m+1);
		}
		pszResult_m[level]   = lc;
		pszResult_m[level+1] = NUL;

		if (lc == KIMMO_ALPHA_NULL)
		{
		/*
		 *  null lexical character -- keep the same spot in the Trie
		 */
		newTP = lexiconTP;
		}
		subLexicon.pszName    = lexiconp->pszName;
		subLexicon.pStorage = newTP;

		rec = recog(remainder+1,level+1,newConfig, &subLexicon, feat_size,
			already);

		pszResult_m[level] = NUL;
		have_good_result += rec;
		if (!rec)
		TRACE(2, level+1,'-', lexiconp->pszName, -1,-1, newConfig,
			  0, remainder+1, MISMATCH_T)
		TRACE(2, level, '<', lexiconp->pszName, -1,-1, config, 0, NULL,
		  NORMAL_T)
		}
	else
		TRACE(2, level, '-', lexiconp->pszName,-1,-1,newConfig, blockR,
		  NULL, BLOCK_T)
	}
	else
	TRACE(3, level, '-', lexiconp->pszName, lc, sc, NULL, 0, NULL,
		  NOTMATCH_T)
	if (sLang_m.bLimit && have_good_result)
	{
	freeMemory( newConfig );
	return( have_good_result );
	}
	}

/*******************************************************************
 *  Consider the pair (0.0).  If 0 is the head of a branch of the  *
 *  lexicon, recurse with the same remainder, state configuration, *
 *  "level", result string, and feature string.  Only modify the   *
 *  lexicon trie to pursue the indicated branch of this lexicon.   *
 *******************************************************************/

for ( newTP = lexiconTP->pChildren ; newTP ; newTP = newTP->pSiblings )
	{
	if (newTP->cLetter == KIMMO_ALPHA_NULL)
	break;
	}
if (newTP != (Trie *)NULL)
	{
	lc = KIMMO_ALPHA_NULL;
	sc = KIMMO_ALPHA_NULL;
	TRACE(2, level, ' ', lexiconp->pszName, lc, sc, config, 0, NULL,
	  NULLENTRY_T)
	for (   new = newConfig, old = config, j = 0 ;
		j < sLang_m.uiAutomataSize ;
		++j )
	*new++ = *old++;
	/*
	 *  point to the proper subTrie
	 */
	subLexicon.pszName    = lexiconp->pszName;
	subLexicon.pStorage = newTP;

	rec = recog(remainder, level, newConfig, &subLexicon, feat_size, already);
	have_good_result += rec;
	TRACE(2, level, '<', lexiconp->pszName, -1,-1, config, 0, NULL,
	  NORMAL_T )
	if (sLang_m.bLimit && have_good_result)
	{
	freeMemory( newConfig );
	return( have_good_result );
	}
	}

freeMemory( newConfig );

return( have_good_result );
}

/*****************************************************************************
 * NAME
 *    fixRecognizerResult
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void fixRecognizerResult(pKimmo_in)
KimmoData *	pKimmo_in;
{
KimmoResult *	pResult;
size_t	rlength;
size_t	flength;
KimmoMorpheme *	pMorph;

for ( pResult = pResultList_m ; pResult ; pResult = pResult->pNext )
	{
	rlength = 1;
	flength = 1;
	/*
	 *	Calculate size of all pieces in one result node together
	 */
	for ( pMorph = pResult->pAnalysis ; pMorph ; pMorph = pMorph->pNext )
	{
	if (pMorph->pLexItem != NULL)
		{
		rlength += strlen((char *)pMorph->pLexItem->pszLexString);
		flength += strlen((char *)pMorph->pLexItem->pszGloss);
		}
	}
	/*
	 * Allocate memory to store temporary result and gloss strings
	 */
	pResult->pszResult = (unsigned char *)allocMemory(rlength);
	pResult->pszGloss  = (unsigned char *)allocMemory(flength);
	/*
	 * Concatenate pieces into strings
	 */
	for ( pMorph = pResult->pAnalysis ; pMorph ; pMorph = pMorph->pNext )
	{
	if (pMorph->pLexItem != NULL)
		{
		strcat((char *)pResult->pszResult,
		   (char *)pMorph->pLexItem->pszLexString);
		strcat((char *)pResult->pszGloss,
		   (char *)pMorph->pLexItem->pszGloss);
		}
	}
	/*
	 *  finish setting the result values
	 */
	eraseKimmoNullChars((char *)pResult->pszResult, pKimmo_in);
	pResult->bOkay = FALSE;
	}
}

/****************************************************************************
 * NAME
 *    applyKimmoRecognizer
 * DESCRIPTION
 *    Set up for the call to recog() for recursive recognition of the surface
 *    form.
 * RETURN VALUE
 *    pointer to the list of results, or NULL if no results found
 */
KimmoResult * applyKimmoRecognizer(surf_form, pLang_in)
unsigned char *	surf_form;	/* pointer to surface form to analyze */
KimmoData *	pLang_in;	/* data for the current language */
{
unsigned	i;
int *		config;
KimmoLexicon *	lexiconp;
unsigned char *	surface_string;
/*
 *  don't bother if no language data
 */
if (	(pLang_in == NULL) ||
	(pLang_in->ppszAlphabet == NULL) ||
	(pLang_in->pInitialLexicon == NULL) )
	return( (KimmoResult *)NULL );
/*
 *  copy language and other invariant data into local structure
 */
memcpy( &sLang_m, pLang_in, (size_t)sizeof(KimmoData) );
/*
 *  start with the initial section of the lexicon
 */
lexiconp = sLang_m.pInitialLexicon;
/*
 *  check for valid form, print a trace message, and then initialize
 *    for the call to recog()
 */
surface_string = (unsigned char *)duplicateString((char *)surf_form);

if (!validateKimmoWordForm(surface_string, &sLang_m))
	{
	freeMemory((char *)surface_string);
	return((KimmoResult *)NULL);
	}

config = (int *)allocMemory(sLang_m.uiAutomataSize * sizeof(int));
for ( i = 0 ; i < sLang_m.uiAutomataSize ; ++i )
	config[i] = 1;

/*****************************************************************
 *  check the boundary character if applicable
 */
if (	(sLang_m.cBoundary != NUL) &&
	(findLexical(sLang_m.pFeasiblePairs, KIMMO_ALPHA_BOUNDARY) != NULL) )
	{
	TRACE(2, 0, ' ', lexiconp->pszName,
	  KIMMO_ALPHA_BOUNDARY, KIMMO_ALPHA_BOUNDARY,
	  config, 0, surf_form, NORMAL_T )
	if ((i = moveKimmoAutomata(KIMMO_ALPHA_BOUNDARY,KIMMO_ALPHA_BOUNDARY,
				   config, &sLang_m)) != 0)
	{
	TRACE(2, 0, '-', lexiconp->pszName,-1,-1,config, i, surf_form,
		  BLOCK_T)
	freeMemory(config);
	return( (KimmoResult *)NULL );
	}
	}
TRACE(1, 0, 0, lexiconp->pszName, 0, 0, NULL, 0, NULL, ENTERING_T)

pszResult_m = (unsigned char *)allocMemory(MAXLINELEN+1);
uiResultAllocated_m = MAXLINELEN;
pszFeature_m = (unsigned char *)allocMemory(MAXLINELEN+1);
uiFeatureAllocated_m = MAXLINELEN;
pResultList_m = (KimmoResult *)NULL;

uiProgressCount_m = 0L;
reportProgress( uiProgressCount_m );

if (setjmp( sCancelPoint_m ))
	{
	if (pResultList_m != (KimmoResult *)NULL)
	freeKimmoResult( pResultList_m, pLang_in );
	pResultList_m = (KimmoResult *)NULL;
	}
else
	{
	recog( surface_string, 0, config, lexiconp, 0, (KimmoMorpheme *)NULL);
	}

freeMemory(pszResult_m);    pszResult_m  = NULL;   uiResultAllocated_m  = 0;
freeMemory(pszFeature_m);   pszFeature_m = NULL;   uiFeatureAllocated_m = 0;
freeMemory(config);
freeMemory(surface_string);
/*
 *  update PATR internal variables
 */
pLang_in->sPATR.iCurrentIndex = sLang_m.sPATR.iCurrentIndex;
pLang_in->sPATR.iParseCount   = sLang_m.sPATR.iParseCount;
/*
 *  fill in the morphname and feature strings for each result
 */
fixRecognizerResult( pLang_in );

return( pResultList_m );
}
