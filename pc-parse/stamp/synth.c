/*      SYNTH.C - functions for synthesizing words
 ***************************************************************************
 *
 * void performStampSynthesis(StampUnit * pUnit_in,
 *			      StampData * pStamp_in)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include "stamp.h"

/****************************************************************************
 *  the next few items cannot be auto because they need to be referenced by
 *      a recursive routine (and I don't like having lots of invariant
 *      parameters)
 */
static StampAnalysis *	pHead_m;		/* input to synthesis */
static StringList *	pSynList_m;		/* output from synthesis */
static char		szSynWord_m[BUFSIZE+1];	/* scratch buffer */
/*
 * linked list of analysis structures to be used by infix selection process
 */
struct inf_tmp
	{
	StampAnalysis *ptr;
	struct inf_tmp *link;
	};
/*
 *  local function prototypes
 */
static StringList *	synthesis P((StampAnalysis * analp,
					 StampAnalysisList * amb_list,
					 StampUnit * pWord_in,
					 StampData * pStamp_in));
static void  t_indent P((int    level,
			 FILE * pOutputFP_in));
static int  generate P((StampAnalysis *mp,int  level,
			StampUnit * pUnit_in,
			StampData * pStamp_in));
static int  test_word P((int  level,
			 StampUnit * pUnit_in,
			 StampData * pStamp_in));
static int  apply_all_tests P((StampAnalysis * head,
				   char  *         synword,
				   int             level,
				   StampUnit *     pUnit_in,
				   StampData *     pStamp_in));
static int  adjust_infixes P((StampAnalysis *  head,
				  StampAnalysis *  tail,
				  struct inf_tmp * inf,
				  char  *          synword,
				  int              level,
				  StampUnit *      pUnit_in,
				  StampData *      pStamp_in));

/*************************************************************************
 * NAME
 *    performStampSynthesis
 * DESCRIPTION
 *    Synthesize the transferred word structure
 * RETURN VALUE
 *    none
 */
void performStampSynthesis(pUnit_in, pStamp_in)
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
StampAnalysisList *cur_ambp, *next_ambp;

if (	(pUnit_in               == NULL) ||
	(pUnit_in->pCurrentWord == NULL) ||
	(pStamp_in              == NULL) )
	return;

if (pStamp_in->iDebugLevel && (pStamp_in->pLogFP != NULL))
	{
	fprintf(pStamp_in->pLogFP, "\nBeginning of performStampSynthesis():\n");
	dumpStampWord(pUnit_in->pCurrentWord, pStamp_in->pLogFP);
	}
/*
 * In case current word is already synthesized due to string lookahead
 * from previous word...
 */
if ( pUnit_in->bStringLookahead )
	pUnit_in->bStringLookahead = FALSE;
else
	{
	pUnit_in->bMultiDependency = FALSE;
	pUnit_in->bLookaheadDone = FALSE;
	/*
	 * Process the current word one ambiguity at a time
	 */
	for ( cur_ambp = pUnit_in->pCurrentWord->pTrAnalyses ;
		  cur_ambp && !pUnit_in->bStringLookahead ;
		  cur_ambp = cur_ambp->pNext )
		pUnit_in->pCurrentWord->pTemplate->pNewWords = mergeTwoStringLists(
				 pUnit_in->pCurrentWord->pTemplate->pNewWords,
					 synthesis( cur_ambp->pAnal, cur_ambp,
						pUnit_in, pStamp_in ) );
	/*
	 * If we have to look ahead to the string environment of the next word...
	 */
	if ( pUnit_in->bStringLookahead )
		{
		/*
		 * Clean up current word -- delete any synthesized words
		 */
		if ( pUnit_in->pCurrentWord->pTemplate->pNewWords )
			{
			freeStringList( pUnit_in->pCurrentWord->pTemplate->pNewWords );
			pUnit_in->pCurrentWord->pTemplate->pNewWords = NULL;
			}
		/*
		 * If more words to look ahead to, look ahead
		 */
		if ( pUnit_in->pNextWord )
			{
		StringList * pNewWords;
		StampUnit sTemp;
		sTemp.pCurrentWord     = pUnit_in->pNextWord;
		sTemp.pPreviousWord    = pUnit_in->pCurrentWord;
		sTemp.pNextWord        = NULL;
		sTemp.bStringLookahead = pUnit_in->bStringLookahead;
		sTemp.bLookaheadDone   = pUnit_in->bLookaheadDone;
		sTemp.bMultiDependency = pUnit_in->bMultiDependency;

		pNewWords = pUnit_in->pNextWord->pTemplate->pNewWords;
			/*
			 * Process the next word one ambiguity at a time
			 */
			for (   next_ambp = pUnit_in->pNextWord->pTrAnalyses ;
			next_ambp ;
			next_ambp = next_ambp->pNext )
				{
		pNewWords = mergeTwoStringLists(pNewWords,
						synthesis(next_ambp->pAnal,
							  next_ambp,
							  &sTemp,
							  pStamp_in));
		}
		pUnit_in->pNextWord->pTemplate->pNewWords = pNewWords;

		pUnit_in->bStringLookahead = sTemp.bStringLookahead;
		pUnit_in->bLookaheadDone   = sTemp.bLookaheadDone;
		pUnit_in->bMultiDependency = sTemp.bMultiDependency;
			}
		if ( pUnit_in->bMultiDependency )
			{
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			"\nWARNING:  Multiple dependency:  %s %s\n",
			pUnit_in->pCurrentWord->pTemplate->pszOrigWord,
			pUnit_in->pNextWord->pTemplate->pszOrigWord );
			}
		pUnit_in->bLookaheadDone = TRUE;
		/*
		 * Process the current word again, one ambiguity at a time
		 */
		for ( cur_ambp = pUnit_in->pCurrentWord->pTrAnalyses ;
			  cur_ambp ;
			  cur_ambp = cur_ambp->pNext )
			{
		pUnit_in->pCurrentWord->pTemplate->pNewWords =
			mergeTwoStringLists(
				 pUnit_in->pCurrentWord->pTemplate->pNewWords,
				 synthesis(cur_ambp->pAnal, cur_ambp,
					   pUnit_in, pStamp_in ) );
		}
		}
	}
}

/*************************************************************************
 * NAME
 *    synthesis
 * ARGUMENTS
 *    analp - pointer to analysis list from transfer
 *    word  - pointer to the word template structure
 *    amb_list - pointer to the list of analysis lists - added 2/95 1.4v BJY
 * DESCRIPTION
 *    Generate one or more synthetic words from a transferred analysis.
 *    The word template is needed for storing synthesis failures.
  * RETURN VALUE
 *    list of words synthesized from the analysis (normally only one word)
 */
static StringList * synthesis( analp, amb_list, pUnit_in, pStamp_in )
StampAnalysis *		analp;
StampAnalysisList *	amb_list;     /* added 2/95 1.4v BJY */
StampUnit *		pUnit_in;
StampData *		pStamp_in;
{
register StampAnalysis *mp;
int k;
int rsc_root;

#ifdef MOVED_TO_TRULES
/*
 *  look up each of the morphemes in the analysis list in the dictionary
 */
for ( mp = analp ; mp ; mp = mp->pRightLink )
	addStampAllosToMorph( mp, FALSE );
#endif

#ifdef MOVED_TO_DICT_LOOKUP
	if (mp->m.pAllomorphs)    /* affix already looked up (for orderclass)? */
		continue;

	/*
	 *  If a root morphname starts with a regular sound change
	 *      look it up in the dictionary without the marker.
	 *  This is done because morphnames that begin with RSC marks
	 *      are stored in the dictionary without those marks.
	 *      So this causes them to be found correctly.
	 */
	if (    (mp->m.iMorphType & ROOT) && pStamp_in->szRSCMarkers[0] &&
			((k = strpos(pStamp_in->szRSCMarkers,*(mp->m.pszMorphname))) >= 0))
		{
										/* look it up minus the marker */
		dp = searchStampDictionary(mp->m.iMorphType,
				   (mp->m.pszMorphname)+1,
				   mp->m.iToCategory, FALSE, pStamp_in);
		}
	else
		dp = searchStampDictionary(mp->m.iMorphType,
				   mp->m.pszMorphname,
				   mp->m.iToCategory, FALSE, pStamp_in);

	if (dp)
		{
		mp->m.iMorphType  = dp->iMorphType;  /* we haven't known affix types */
		mp->m.iOrderClass = dp->iOrderClass;
		mp->m.iFromCategory = dp->iFromCategory;
		mp->m.iToCategory = dp->iToCategory;
		mp->m.pAllomorphs      = dp->allos;
		if (dp->iMorphType & IFX)
			mp->m.u.pInfixEnv = dp->u.pInfixEnv;    /* infix environment */
		}
#endif

if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
	{
	fprintf(pStamp_in->pLogFP, "SYNTHESIS\n");
	fprintf(pStamp_in->pLogFP, "  Input:    ");
	writeStampBriefAnalysis(analp,NULL, pStamp_in->pLogFP, pStamp_in);
	fputc('\n', pStamp_in->pLogFP);
	}

/*
 *  If a non_dic root available, try to apply one lexical change to
 *      the word.  This does not try to do one change per root,
 *      but limits itself to one lexical change per word.
 */
for ( mp = analp ; mp ; mp = mp->pRightLink )
	{                                       /* if an non-dic root found */
	if (    (mp->m.iMorphType & ROOT) &&
			(mp->m.pAllomorphs == NULL))
		{
	/* apply a lexical change */
	/* 1.4v BJY  Reattach possibly changed analysis list */
	/*  to pStampCurrentWord_g structure. */
		analp = applyStampSynthesisLexChanges(analp, pUnit_in, pStamp_in);
		amb_list->pAnal = analp;
		break;
		}
	}
/*
 *  For any  non-dic root with an RSC mark, set its type bit.
 */
rsc_root = FALSE;
for ( mp = analp ; mp ; mp = mp->pRightLink )
	{
	if (    (mp->m.iMorphType & ROOT) &&
			(mp->m.pAllomorphs == NULL))
		{
		/*
		 *  check for regular sound change markers
		 */
		if (	pStamp_in->szRSCMarkers[0] &&   /* if RSC mark first in name */
				((k = strpos(pStamp_in->szRSCMarkers,
				 *(mp->m.pszMorphname))) >= 0) )
			{
			mp->m.iMorphType |= RSC << k; /* set the bit in the type byte */
			rsc_root = TRUE;                /* remember we found one */
			}
		}
	}
/*
 *  if available RSC sites, apply regular sound changes
 */
if ( rsc_root )
	analp = applyStampRegSoundChanges( analp, pStamp_in );

if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
	{
	fprintf(pStamp_in->pLogFP, "  After \\rsc: ");
	writeStampBriefAnalysis(analp,NULL, pStamp_in->pLogFP, pStamp_in);
	fprintf(pStamp_in->pLogFP, "\nMorpheme information from dictionaries:\n");
	writeStampAnalysis(analp, pStamp_in->pLogFP, pStamp_in);
	fputc('\n', pStamp_in->pLogFP);
	}
else if (pStamp_in->bReportNoEntries)	/* under the Unfound flag: */
	logMissingMorphemes(analp,		/* report morphs without entries */
			pUnit_in->pCurrentWord,
			pStamp_in);
pHead_m = analp;                           /* store for easy reference */
pSynList_m = NULL;       /* no synthesis yet */
/*
 *  generate a word (maybe more if pStamp_in->bDoAllSyntheses is set)
 */
/* this will set synlist */
generate(analp, 0, pUnit_in, pStamp_in);
if (pSynList_m == NULL)
	{
	/*
	 *  Synthesis failed: report to the user
	 */
	if (pStamp_in->pLogFP)
		{
	fprintf(pStamp_in->pLogFP, "        Synthesis failure: ");
	writeStampBriefAnalysis( pHead_m, NULL, pStamp_in->pLogFP, pStamp_in );
	putc('\n', pStamp_in->pLogFP);
	}
	if (szSynWord_m[0] != NUL)
		{
		/*
		 *  if synthesis fails, stuff the latest invalid value in synword
		 *    into the orig_word field, so that it will output as a failure.
		 */
		if (pUnit_in->pCurrentWord->pTemplate->pszOrigWord == NULL)
			pUnit_in->pCurrentWord->pTemplate->pszOrigWord =
						duplicateString( szSynWord_m );
		}
	}
else if (pStamp_in->bTrace && pStamp_in->pLogFP)
	{
	fprintf(pStamp_in->pLogFP, "OUTPUT: \n");
	writeStringList( pSynList_m, " ", pStamp_in->pLogFP );
	fputc('\n', pStamp_in->pLogFP);
	}
return( pSynList_m );
}

/*****************************************************************************
 * NAME
 *    t_indent
 * DESCRIPTION
 *    indentation for tracing
 * RETURN VALUE
 *    none
 */
static void t_indent(level, pOutputFP_in)
int	level;
FILE *	pOutputFP_in;
{
/*
 *  2 spaces for each level of indentation
 */
while (level-- > 0)
	fprintf(pOutputFP_in, "  ");
}

/*************************************************************************
 * NAME
 *    generate
 * ARGUMENTS
 *    mp    - pointer to a list of analysis morphemes
 *    level - recursion depth counter for indenting trace messages
 * DESCRIPTION
 *    For each allomorph of this morpheme, finish out the word with all
 *    of the allomorphs of all following morphemes.
 *    When we recursively run out of morphemes, we actually piece the word
 *    together and test it.
 * RETURN VALUE
 *    TRUE if a valid word has been found, FALSE otherwise
 */
static int generate(mp, level, pUnit_in, pStamp_in)
StampAnalysis *mp;
int level;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
StampAllomorphList *ap;
StampAllomorph etymology;     /* for roots which don't use an allomorph */
int success;
/*
 *  if we've run out of morphemes, then piece the word together out of
 *    the allomorphs, and test it
 */
if (mp == NULL)
	return( test_word(level, pUnit_in, pStamp_in) );
/*
 *  if no allomorphs exist, use the morphname value for the allomorph
 */
if (mp->m.pAllomorphs == NULL)
	{
	/*
	 *  fill in the phony allomorph structure with the morphname for the
	 *  allomorph string, and with no properties or environment.
	 */
	if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
		{
		t_indent(level, pStamp_in->pLogFP);
		fprintf(pStamp_in->pLogFP, "No allomorphs for \"%s\", using \"%s\"\n",
		mp->m.pszMorphname, mp->m.pszMorphname );
		}
	etymology.pszAllomorph                 = mp->m.pszMorphname;
	etymology.uAlloPropertySet.pProperties = NULL;
	etymology.pAlloEnvironment             = NULL;
	mp->pCurrentAllo = &etymology;
	return( generate(mp->pRightLink, level+1, pUnit_in, pStamp_in) );
	}
/*
 *  we have some allomorphs, so try each one in sequence
 */
for ( success = FALSE, ap = mp->m.pAllomorphs ; ap ; ap = ap->pNext )
	{
	mp->pCurrentAllo = &(ap->a);
	if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
		{
		t_indent(level, pStamp_in->pLogFP);
#ifndef hab217
		fprintf(pStamp_in->pLogFP, "%s:  %s %s\n",
		(mp->m.iMorphType & PFX) ? "pfx" :
		(mp->m.iMorphType & SFX) ? "sfx" :
		(mp->m.iMorphType & IFX) ? "ifx" : "root",
		   mp->pCurrentAllo->pszAllomorph, mp->m.pszMorphname );
#else
		fprintf(pStamp_in->pLogFP, "Trying \"%s\" for \"%s\"\n",
		   mp->pCurrentAllo->pszAllomorph, mp->m.pszMorphname );
#endif /* hab217 */
		}
	/*
	*  1.2b Moved MEC test from here to apply_all_tests below
	*/
	success |= generate(mp->pRightLink, level+1, pUnit_in, pStamp_in);
	if (success && !pStamp_in->bDoAllSyntheses)
		return( TRUE );                 /* we've succeeded */
	}
return( success );
}

/*************************************************************************
 * NAME
 *    test_word
 * ARGUMENTS
 *    level - recursion level of generate() for indenting messages
 * DESCRIPTION
 *    Test a synthetic word for validity.  Also, modify it according to
 *    any actions associated with user-written tests.
 * RETURN VALUE
 *    TRUE if the synthetic word is valid, FALSE if it isn't
 */
static int test_word(level, pUnit_in, pStamp_in)
int level;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
register StampAnalysis *mp;
StampAnalysis *tail = NULL;
struct inf_tmp  *inf, *inf_head, *inf0;
char *loc;
int tmp;

if (pHead_m == NULL)
	return(FALSE);              /* should never happen, but... */

inf_head = NULL;
/*
 *  concatenate the allomorph strings to form a synthetic word
 */
szSynWord_m[0] = NUL;
for ( loc = szSynWord_m, mp = pHead_m ; mp ; mp = mp->pRightLink )
	{
	mp->pszAlloStart = loc;       /* save the beginning position */
	loc = cpystr(loc, mp->pCurrentAllo->pszAllomorph);
	mp->pszAlloEnd = loc;         /* save the end position */
								/* create list of all infixes */
	if (mp->m.iMorphType & IFX)
		{
		inf       = (struct inf_tmp *) allocMemory(sizeof(struct inf_tmp));
		inf->link = inf_head;
		inf_head  = inf;
		inf->ptr  = mp;
		}
								/* save location of tail */
	if (mp->pRightLink == NULL)
		tail = mp;
	}

if (inf_head == NULL)
	{
	/*
	 *  No infixes, so apply all tests
	 */

	if (!apply_all_tests(pHead_m, szSynWord_m, level, pUnit_in, pStamp_in))
		return( FALSE );
	}
else
	{
	/*
	 *  adjust infix strings to the right place in the synthetic word
	 *  and apply all the tests
	 */
	tmp = adjust_infixes(pHead_m, tail, inf_head, szSynWord_m, level, pUnit_in,
			 pStamp_in);
	/*
	 * Free memory
	 */
	for (inf = inf_head; inf; inf = inf0 )
	  {
		inf0 = inf->link;
		freeMemory((char *)inf);
	  }
	if (!tmp)
		return( FALSE );
	}
/*
 *  add the word to the output list, and return TRUE to signal success
 */
if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
#ifndef hab217
  {
	t_indent(level+1, pStamp_in->pLogFP);
	fprintf(pStamp_in->pLogFP, "Success: %s passed all tests\n",
		szSynWord_m);
  }
#else
	fprintf(pStamp_in->pLogFP, "\nSuccess: %s passed all tests\n",
		szSynWord_m);
#endif /* hab217 */
pSynList_m = mergeIntoStringList( pSynList_m, szSynWord_m );
return( TRUE );
}

/*************************************************************************
 * NAME
 *    apply_all_tests
 * ARGUMENTS
 *    head    - pointer to the beginning of a list of morphemes
 *    synword - synthesized word (string)
 *    level   - recursion level of generate() for indenting messages
 * DESCRIPTION
 *    apply all user-defined and built-in tests to a posited synthesized word
 * RETURN VALUE
 *    TRUE  if all tests pass
 *    FALSE otherwise
 */
static int apply_all_tests(head, synword, level, pUnit_in, pStamp_in)
StampAnalysis *	head;
char *		synword;
int		level;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
register StampAnalysis *mp;
StampAnalysis *ap;
StampAllomorph *am;
int            iLen;		/* 2.1b1 hab */

if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
#ifndef hab217
  {
	t_indent(level, pStamp_in->pLogFP);
	fprintf(pStamp_in->pLogFP, "Testing: %s\n", synword);
  }
#else
	fprintf(pStamp_in->pLogFP, "Testing: %s\n", synword);
#endif /* hab217 */
/*
 *  apply the tests at each morpheme in the list
 */
for ( mp = head ; mp ; mp = mp->pRightLink )
	{
	/*
	 *  apply any morpheme environment constraints
	 */
	am = mp->pCurrentAllo;
	if (am->pAlloEnvironment && am->pAlloEnvironment->pMorphCond)
		{
		++pStamp_in->uiCalledMEC;
#ifdef hab217
		if (pStamp_in->bTrace)
			{
			t_indent(level, pStamp_in->pLogFP);
			fprintf(pStamp_in->pLogFP,
			"applying morpheme environment constraint\n");
			}
#endif /* hab217 */
			/* display the constraint and the analysis list */
			/*   with an indication of where we are */
		if (!checkStampMorphEnviron( mp->pLeftLink, mp->pRightLink,
					 am->pAlloEnvironment->pMorphCond,
					 pUnit_in, pStamp_in) )
			{
			if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
#ifndef hab217
		  {
				t_indent(level+1, pStamp_in->pLogFP);
				fprintf(pStamp_in->pLogFP,
			"MEC failed for %s (%s):",
			mp->pCurrentAllo->pszAllomorph, mp->m.pszMorphname);
		writeAmpleEnvConstraint(pStamp_in->pLogFP,
				  am->pAlloEnvironment->pMorphCond,
				  FALSE);
		putc('\n', pStamp_in->pLogFP);
		  }
#else
				fprintf(pStamp_in->pLogFP,
			"morpheme environment check failed\n");
#endif /* hab217 */
			++pStamp_in->uiMECFailed;
			return( FALSE );
			}
		}
	/*
	 *  apply any tests defined by the user
	 *    (since these tests can insert phonemes, they should come before
	 *     the string environment constraint checking)
	 */
				/* add pUnit_in 2.1b1 hab */
#ifndef hab217
	if (!applyStampTests(head, synword, mp, level, pUnit_in, pStamp_in))
#else
	if (!applyStampTests(head, synword, mp, pUnit_in, pStamp_in))
#endif /* hab217 */
		return( FALSE );                /* the word failed the tests */
	/*
	 *  apply the string environment constraints, if any
	 */
	if (    mp->pCurrentAllo->pAlloEnvironment &&
		mp->pCurrentAllo->pAlloEnvironment->pStringCond)
		{
		++pStamp_in->uiCalledSEC;                   /* bump the called count */
#ifdef hab217
		if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
			{
			fprintf(pStamp_in->pLogFP, "  String environment constraint:\n");
			writeAmpleEnvConstraint(pStamp_in->pLogFP,
				   mp->pCurrentAllo->pAlloEnvironment->pStringCond,
					FALSE);
			/* display the constraint and the analysis list */
			/*   with an indication of where we are */
			fprintf(pStamp_in->pLogFP, "    applied to:\n");
			writeStampBriefAnalysis( head, mp, pStamp_in->pLogFP, pStamp_in );
			fprintf(pStamp_in->pLogFP, "               ");
			for ( ap = head ; ap ; ap = ap->pRightLink )
				{
				if (ap == mp)
					fprintf(pStamp_in->pLogFP, " [* %s *]",
				(ap->pCurrentAllo->pszAllomorph &&
				 *ap->pCurrentAllo->pszAllomorph) ?
				ap->pCurrentAllo->pszAllomorph : "0" );
				else
					fprintf(pStamp_in->pLogFP, " %s",
				(ap->pCurrentAllo->pszAllomorph &&
				 *ap->pCurrentAllo->pszAllomorph) ?
				ap->pCurrentAllo->pszAllomorph : "0" );
				}
		putc('\n', pStamp_in->pLogFP);
			}
#endif /* hab217 */
		if ( !checkStampStringEnvironment(synword,
					  (int)(mp->pszAlloStart - synword),
					  mp->pszAlloEnd,
				   mp->pCurrentAllo->pAlloEnvironment->pStringCond,
					  pUnit_in, pStamp_in ) )
			{
			if (pStamp_in->bTrace)
				{
#ifndef hab217
				t_indent(level+1, pStamp_in->pLogFP);
				fprintf(pStamp_in->pLogFP,
			"SEC failed for %s (%s):",
			mp->pCurrentAllo->pszAllomorph, mp->m.pszMorphname);
		writeAmpleEnvConstraint(pStamp_in->pLogFP,
				  mp->pCurrentAllo->pAlloEnvironment->pStringCond,
				  FALSE);
		putc('\n', pStamp_in->pLogFP);
#else
				t_indent(level, pStamp_in->pLogFP);
				fprintf(pStamp_in->pLogFP,
			"string environment check failed\n");
#endif /* hab217 */
				}
			++pStamp_in->uiSECFailed;		/* bump the failure count */
			return(FALSE);
			}
		}
	/*
	 *  apply the punctuation environment constraints, if any   2.1b1 hab
	 */
	if (    mp->pCurrentAllo->pAlloEnvironment &&
		mp->pCurrentAllo->pAlloEnvironment->pPunctCond)
		{
		++pStamp_in->uiCalledPEC;                   /* bump the called count */
		if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
			{
			fprintf(pStamp_in->pLogFP, "  Punctuation environment constraint:\n");
			writeAmpleEnvConstraint(pStamp_in->pLogFP,
				   mp->pCurrentAllo->pAlloEnvironment->pPunctCond,
					FALSE);
			/* display the constraint and the analysis list */
			/*   with an indication of where we are */
			fprintf(pStamp_in->pLogFP, "    applied to:\n");
			writeStampBriefAnalysis( head, mp, pStamp_in->pLogFP, pStamp_in );
			fprintf(pStamp_in->pLogFP, "               ");
			for ( ap = head ; ap ; ap = ap->pRightLink )
				{
				if (ap == mp)
					fprintf(pStamp_in->pLogFP, " [* %s *]",
				(ap->pCurrentAllo->pszAllomorph &&
				 *ap->pCurrentAllo->pszAllomorph) ?
				ap->pCurrentAllo->pszAllomorph : "0" );
				else
					fprintf(pStamp_in->pLogFP, " %s",
				(ap->pCurrentAllo->pszAllomorph &&
				 *ap->pCurrentAllo->pszAllomorph) ?
				ap->pCurrentAllo->pszAllomorph : "0" );
				}
		putc('\n', pStamp_in->pLogFP);
			}

	iLen = (pUnit_in->pCurrentWord->pTemplate->pszFormat == (char *)NULL)
				? 0 : strlen(pUnit_in->pCurrentWord->pTemplate->pszFormat);
		if ( !checkStampPunctEnvironment(
							  pUnit_in->pCurrentWord->pTemplate->pszFormat,
				  iLen,
				  pUnit_in->pCurrentWord->pTemplate->pszNonAlpha,
				  mp->pCurrentAllo->pAlloEnvironment->pPunctCond) )
			{
			if (pStamp_in->bTrace)
				{
				t_indent(level, pStamp_in->pLogFP);
				fprintf(pStamp_in->pLogFP,
			"punctuation environment check failed\n");
				}
			++pStamp_in->uiPECFailed;		/* bump the failure count */
			return(FALSE);
			}
		}
	}
/* all tests passed */
return( TRUE );
}

/*************************************************************************
 * NAME
 *    adjust_infixes
 * ARGUMENTS
 *    head    - pointer to the beginning of a list of morphemes
 *    tail    - pointer to the end       of a list of morphemes
 *    inf     - pointer to temporary infix struct (inf_tmp)
 *    synword - (possibly adjusted )synthesized word (string)
 *    level   - recursion level of generate() for indenting messages
 * DESCRIPTION
 *    For each infix in the analysis, try each environment of its location
 *    field for a successful match with following morpheme string.  Adjust
 *    the synthesized word (insert the infix where it belongs).
 *    When we recursively run out of infixes, we apply all tests.
 * RETURN VALUE
 *    TRUE  if a sucessful adjustment for all infixes has been found
 *    FALSE otherwise.
 */
static int adjust_infixes(head, tail, inf, synword, level, pUnit_in,
			  pStamp_in)
StampAnalysis *	head;
StampAnalysis *	tail;
struct inf_tmp *inf;
char *		synword;
int		level;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
register StampAnalysis *next;
AmpleEnvConstraint *cnd;
AmpleEnvConstraint cond_tmp;
char *pos;
int inf_len, front_len;
#ifndef hab219
int bConditionMatched = FALSE;
#endif /* hab219 */

/*
 * if we've run out of infixes, apply all of the tests
 */
if (inf == NULL)
	return (apply_all_tests(head, synword, level, pUnit_in, pStamp_in));

/*
 * Working from right to left, find the next (non-null) non-infix
 * morpheme to the right
 */
next = inf->ptr->pRightLink;
while ( next && ( (next->m.iMorphType & IFX) || /* If infix or null, try next */
				 !(next->pCurrentAllo->pszAllomorph && *next->pCurrentAllo->pszAllomorph) )
	  )
  next = next->pRightLink;
if ( !next )
	{
	if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
		fprintf(pStamp_in->pLogFP,
	 "        Failed to find a non-infix affix in which to insert an infix\n");
	return(FALSE);
	}
/*
 * For each condition in the location field in the infix record,
 * check for a match in the next morpheme string.
 * If found, adjust the infix string (insert the infix in the next morpheme)
 * and go check next infix.
 *
 * We hold the location field environments constant while varying the segmental
 * position to allow the user the ability to control selection.
 */
for ( cnd = inf->ptr->m.u.pInfixEnv ; cnd ; cnd = cnd->pNext)
  {
								/* make a copy of just this environment */
	cond_tmp.bNot = cnd->bNot;
	cond_tmp.eType = cnd->eType;
	cond_tmp.pRightEnv = cnd->pRightEnv;
	cond_tmp.pLeftEnv  = cnd->pLeftEnv;
	cond_tmp.pNext  = NULL;  /* force a null link */

		   /*
			* Look for environment everywhere in next allomorph
			*/
#ifdef hab219
				/* analysis uses remaining word string;
				   do so for synthesis, too */
	for ( pos = next->pszAlloStart ; *pos ; pos++ )
#else  /* but I think the original behavior is actually right... */
	for ( pos = next->pszAlloStart ; pos <= next->pszAlloEnd ; pos++ )
#endif /* hab219 */
	  {
		front_len = pos - next->pszAlloStart;
			/*
			 * check for validity of this location environment here
			 */
		if ( checkStampStringEnvironment( next->pszAlloStart, front_len, pos,
					  &cond_tmp, pUnit_in, pStamp_in ) )
			{           /* is a valid environment */
#ifndef hab219
		  bConditionMatched = TRUE;
#else /* hab219 */
				/* Not showing so much detail now... */
			if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
				{
				fprintf(pStamp_in->pLogFP,
			"Trying infix location environment for %s:\n",
						  inf->ptr->m.pszMorphname);
				writeAmpleEnvConstraint(pStamp_in->pLogFP, &cond_tmp, FALSE);
				}
#endif /* hab219 */
				   /*
					* Insert the infix.
					*/
			inf_len = inf->ptr->pszAlloEnd - inf->ptr->pszAlloStart;
					/*
					* Move front of next allomorph up
					*/
			memmove( inf->ptr->pszAlloStart, next->pszAlloStart, front_len );
				   /*
					* Move infix into position in next allomorph
					*/
			memmove( (void *)(pos - inf_len),
					 (void *)inf->ptr->pCurrentAllo->pszAllomorph,
					 (unsigned)inf_len );
				   /*
					* Adjust begin and end allo pointers
					*/
			next->pszAlloStart     -= inf_len;
			inf->ptr->pszAlloStart += front_len;
			inf->ptr->pszAlloEnd   += front_len;

			if (adjust_infixes(head, tail, inf->link, synword, level,
				   pUnit_in, pStamp_in))
				return( TRUE );
			else
				   /*
					* Attempt failed, so restore synword to original form
					*/
				{
				   /*
					* Adjust begin and end allo pointers
					*/
				next->pszAlloStart     += inf_len;
				inf->ptr->pszAlloStart -= front_len;
				inf->ptr->pszAlloEnd   -= front_len;
				   /*
					* Move front of next allomorph back
					*/
				memmove(next->pszAlloStart, inf->ptr->pszAlloStart, front_len);
				   /*
					* Move infix into position in next allomorph
					*/
				memmove(inf->ptr->pszAlloStart,
			inf->ptr->pCurrentAllo->pszAllomorph,
			inf_len);
				}
			}  /* is a valid environment */
		}  /* for each segment position loop */
	}      /* for each condition loop */

#ifndef hab219
 if (!bConditionMatched && pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
   {
	 t_indent(level+1, pStamp_in->pLogFP);
	 fprintf(pStamp_in->pLogFP,
		 "Could not find an infix location for %s within allomorph %s of %s\n",
		 inf->ptr->m.pszMorphname,
		 next->pCurrentAllo->pszAllomorph,
		 next->m.pszMorphname
		 );
   }
#endif /* hab219 */
/*
 * nothing worked
 */
return (FALSE);
}
