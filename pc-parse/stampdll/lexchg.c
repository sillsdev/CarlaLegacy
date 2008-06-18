/* LEXCHG.C - lexical change functions for transfer and synthesis
 ***************************************************************************
 *
 * Trie * storeStampLexChange(Trie *     pLexChgTrie_io,
 *			      char *      pszLexChg_in,
 *			      StampData * pStamp_in)
 *
 * void writeStampTransferLexChanges(FILE *      pOutputFP_in,
 *                                   StampData * pStamp_in)
 *
 * StampAnalysis * applyStampTransferLexChanges(StampAnalysis * pAnalysis_in,
 *						StampUnit *     pUnit_in,
 *                                              StampData *     pStamp_in)
 *
 * void writeStampSynthesisLexChanges(FILE *      pOutputFP_in,
 *                                    StampData * pStamp_in)
 *
 * StampAnalysis * applyStampSynthesisLexChanges(StampAnalysis * pAnalysis_in,
 *						 StampUnit *     pUnit_in,
 *                                               StampData *     pStamp_in)
 *
 * void freeStampLexChanges(Trie * pLexChgTrie_io)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include "stamp.h"

static const char	szWhitespace_m[7] = " \t\r\n\f\v";
static const char	szErrHead_m[18] = "\nLEXICAL CHANGE: ";
static StampData *	pStamp_m;	/* used by write_lch_list() */

static VOIDP		insert_lch P((VOIDP pNew_in,
					  VOIDP pList_io));
static void		write_lch_list P((VOIDP  pList_in,
					  int    spaces,
					  FILE * pOutputFP_in));
static void		write_lch P((StampLexChange * pLexChange_in,
					 FILE *           pOutputFP_in,
					 StampData *      pStamp_in));
static StampLexChange *	parse_lch P((char  *     pszString_in,
					 StampData * pStamp_in));
static StampAnalysis *	apply_lch P((StampAnalysis * pAnalysis_in,
					 Trie *          lexchp,
					 StampUnit *     pUnit_in,
					 StampData *     pStamp_in));
static void	free_lch	P((VOIDP pList_in));

/*************************************************************************
 * NAME
 *    insert_lch
 * ARGUMENTS
 *    pNew  - pointer to a new lexchange struct
 *    list - pointer to the beginning of an existing list of lexchange's
 * DESCRIPTION
 *    Insert the new lexchange into the list at the point indicated by
 *    the value in the restrictiveness field (largest value first)
 * RETURN VALUE
 *    pointer to the modified list of lexchange struct's
 */
static VOIDP insert_lch(pNew_in, pList_io)
VOIDP	pNew_in;
VOIDP	pList_io;
{
StampLexChange *	pNewLexChange;
StampLexChange *	pLexChangeList;
StampLexChange *	pChg;
StampLexChange *	pLast;
/*
 *  handle null arguments first
 */
if (pList_io == NULL)
	return( pNew_in );
if (pNew_in == NULL)
	return( pList_io );
pNewLexChange  = (StampLexChange *)pNew_in;
pLexChangeList = (StampLexChange *)pList_io;
/*
 *  insert this into the list, ordered by restrictiveness (bigger values
 *    first)
 */
pLast = NULL;
for ( pChg = pLexChangeList ; pChg ; pLast = pChg, pChg = pChg->pNext )
	{
	if (pChg->iRestrictiveness < pNewLexChange->iRestrictiveness)
		{
		pNewLexChange->pNext = pChg;
		if (pLast)
			{
			pLast->pNext = pNewLexChange;	/* in the middle of the list */
			return((VOIDP)pLexChangeList);
			}
		else
			return((VOIDP)pNewLexChange);	/* first element in list */
		}
	}
pLast->pNext         = pNewLexChange;
pNewLexChange->pNext = NULL;   /* last element in the list */
return (VOIDP)pLexChangeList;
}

/*************************************************************************
 * NAME
 *    storeStampLexChange
 * ARGUMENTS
 *    lexchg - pointer to lexical change storage
 *    new    - pointer to new lexchange struct
 * DESCRIPTION
 *    store this lexical change in the Trie
 * RETURN VALUE
 *    pointer to modified lexical change storage
 */
Trie * storeStampLexChange(pLexChgTrie_in, pszChg_in, pStamp_in)
Trie *		pLexChgTrie_in;
char *		pszChg_in;
StampData *	pStamp_in;
{
StringList *	 pSL;
StampLexChange * pNewChg = NULL;
StampLexChange * pNew = NULL;

pNewChg = parse_lch(pszChg_in, pStamp_in);
if (pNewChg == NULL)
	return pLexChgTrie_in;

if (pNewChg->pMatch->iMorphType & MORPHCLASS)
	{
	/*
	 *  This is complicated, because later we're going to search by explicit
	 *  morphname from the data.  Thus, we need a separate entry for each
	 *  morphname in the morpheme class.  This code breaks the modularity of
	 *  hiding morpheme class operations.  Sorry, but that's the way it is.
	 */
	for (   pSL = pNewChg->pMatch->uMorph.pClass->pMembers ;
		pSL ;
		pSL = pSL->pNext )
		{
		if (pSL->pNext)
			{
			pNew = (StampLexChange *)allocMemory( sizeof(StampLexChange) );
			pNew->pMatch           = pNewChg->pMatch;
			pNew->pReplace         = pNewChg->pReplace;
			pNew->pEnv             = pNewChg->pEnv;
			pNew->iRestrictiveness = pNewChg->iRestrictiveness;
			}
		pLexChgTrie_in = addDataToTrie(pLexChgTrie_in,
					   pSL->pszString,
					   pNewChg,
					   insert_lch,
					   pStamp_in->iMaxTrieLevel);
		pNewChg = pNew;
		}
	return( pLexChgTrie_in );
	}
return addDataToTrie(pLexChgTrie_in,
			 pNewChg->pMatch->uMorph.pszName,
			 pNewChg,
			 insert_lch,
			 pStamp_in->iMaxTrieLevel);
}

/*************************************************************************
 * NAME
 *    write_lch_list
 * ARGUMENTS
 *    lcp    - pointer to the head of the list of lexchange struct's
 *    spaces - number of spaces to indent before each line
 * DESCRIPTION
 *    Write the contents of the lexchange list to the output file.
 *    This version is used for trie storage of the dictionary.
 * RETURN VALUE
 *    none
 */
static void write_lch_list(pList_in, spaces, pOutputFP_in)
VOIDP		pList_in;
int		spaces;
FILE *		pOutputFP_in;
{
int			k;
StampLexChange *	lcp;

for ( lcp = pList_in ; lcp ; lcp = lcp->pNext )
	{
	for ( k = spaces ; k ; --k )
		putc(' ', pOutputFP_in);
	write_lch( lcp, pOutputFP_in, pStamp_m );
	putc('\n', pOutputFP_in);
	}
}

/*************************************************************************
 * NAME
 *    writeStampTransferLexChanges
 * DESCRIPTION
 *    Print the transfer lexical changes.
 * RETURN VALUE
 *    none
 */
void writeStampTransferLexChanges(pOutputFP_in, pStamp_in)
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
if (	(pOutputFP_in == NULL) ||
	(pStamp_in    == NULL) ||
	(pStamp_in->pTransferLexChg == NULL) )
	return;
fprintf(pOutputFP_in,"\nTransfer lexical changes:\n");

pStamp_m = pStamp_in;
writeTrieData( pStamp_in->pTransferLexChg, write_lch_list, pOutputFP_in );
pStamp_m = NULL;
}

/*************************************************************************
 * NAME
 *    applyStampTransferLexChanges
 * ARGUMENTS
 *    pAnalysis_in - pointer to a list of analysis morphemes
 * DESCRIPTION
 *    Perform any applicable transfer lexical change to the analysis.
 * RETURN VALUE
 *    pointer to the (modified?) list of analysis morphemes
 */
StampAnalysis * applyStampTransferLexChanges(pAnalysis_in, pUnit_in, pStamp_in)
StampAnalysis *	pAnalysis_in;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
StampAnalysis *ap;

if (!pAnalysis_in)
	return NULL;

if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
	{
	fprintf(pStamp_in->pLogFP, "TRANSFER\n");
	fprintf(pStamp_in->pLogFP, "  Input:    ");
	writeStampBriefAnalysis(pAnalysis_in,NULL, pStamp_in->pLogFP, pStamp_in);
	fputc('\n', pStamp_in->pLogFP);
	}

ap = apply_lch( pAnalysis_in, pStamp_in->pTransferLexChg, pUnit_in, pStamp_in);

if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
	{
	fprintf(pStamp_in->pLogFP,"  After \\lc:");
	writeStampBriefAnalysis(ap,NULL, pStamp_in->pLogFP, pStamp_in);
	fputc('\n', pStamp_in->pLogFP);
	}
return( ap );
}

/*************************************************************************
 * NAME
 *    writeStampSynthesisLexChanges
 * DESCRIPTION
 *    Print the synthesis lexical changes.
 * RETURN VALUE
 *    none
 */
void writeStampSynthesisLexChanges(pOutputFP_in, pStamp_in)
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
if (	(pOutputFP_in == NULL) ||
	(pStamp_in    == NULL) ||
	(pStamp_in->pSynthesisLexChg == NULL) )
	return;
fprintf(pOutputFP_in,"\nSynthesis lexical changes:\n");

pStamp_m = pStamp_in;
writeTrieData( pStamp_in->pSynthesisLexChg, write_lch_list, pOutputFP_in );
pStamp_m = NULL;
}

/*************************************************************************
 * NAME
 *    applyStampSynthesisLexChanges
 * ARGUMENTS
 *    pAnalysis_in - pointer to a list of analysis morphemes
 * DESCRIPTION
 *    Perform any applicable synthesis lexical change to the analysis.
 * RETURN VALUE
 *    pointer to the (modified?) list of analysis morphemes
 */
StampAnalysis * applyStampSynthesisLexChanges(pAnalysis_in, pUnit_in,
						  pStamp_in)
StampAnalysis *	pAnalysis_in;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
StampAnalysis *	ap;

if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
	{
	fprintf(pStamp_in->pLogFP,"SYNTHESIS\n");
	fprintf(pStamp_in->pLogFP,"  Input:    ");
	writeStampBriefAnalysis(pAnalysis_in,NULL, pStamp_in->pLogFP, pStamp_in);
	fputc('\n', pStamp_in->pLogFP);
	}

ap = apply_lch( pAnalysis_in, pStamp_in->pSynthesisLexChg, pUnit_in, pStamp_in);

if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
	{
	fprintf(pStamp_in->pLogFP,"  After \\lc:");
	writeStampBriefAnalysis(ap,NULL, pStamp_in->pLogFP, pStamp_in);
	fputc('\n', pStamp_in->pLogFP);
	}
return( ap );
}

/*************************************************************************
 * NAME
 *    write_lch
 * ARGUMENTS
 *    pLexChange_in - pointer to a lexical change node
 * DESCRIPTION
 *    Print the contents of a lexical change.
 * RETURN VALUE
 *    none
 */
static void write_lch(pLexChange_in, pOutputFP_in, pStamp_in)
StampLexChange *	pLexChange_in;
FILE *			pOutputFP_in;
StampData *		pStamp_in;
{
fprintf(pOutputFP_in,"\"");
writeStampChangeMorphList(pLexChange_in->pMatch, pOutputFP_in, pStamp_in);
fprintf(pOutputFP_in,"\" --> \"");
writeStampChangeMorphList(pLexChange_in->pReplace, pOutputFP_in, pStamp_in);
fprintf(pOutputFP_in,"\"");
if (pLexChange_in->pEnv)
	writeAmpleEnvConstraint(pOutputFP_in, pLexChange_in->pEnv, FALSE);
if (pStamp_in->iDebugLevel)
	fprintf(pOutputFP_in," | {weight = %d}", pLexChange_in->iRestrictiveness );
}

/*************************************************************************
 * NAME
 *    parse_lch
 * ARGUMENTS
 *    pszString_in - pointer to a string containing a lexical change
 * DESCRIPTION
 *    Parse the lexical change, creating a StampLexChange node.
 * RETURN VALUE
 *    pointer to the created lexchange struct, or NULL if an error occurred
 */
static StampLexChange * parse_lch(pszString_in, pStamp_in)
char *		pszString_in;
StampData *	pStamp_in;
{
char *			pszMatch;
char *			pszReplace;
char *			pszEnvir;
AmpleEnvConstraint *	pEnv;
StampChangeMorphList *	pMatchList;
StampChangeMorphList *	pReplaceList;
char			szBuffer[2*BUFSIZE];
int			iRestriction;
StampChangeMorphList *	cp;
StampLexChange *	pNew;
/*
 *  isolate the pieces of the line
 */
/* work on copy, save original for messages */
pszString_in += strspn(pszString_in, szWhitespace_m);
strncpy(szBuffer, pszString_in, sizeof(szBuffer));
szBuffer[sizeof(szBuffer)-1] = NUL;
pszMatch = splitStampChangeString(szBuffer,
				  &pszReplace,
				  (char **)NULL,
				  &pszEnvir);
/*
 *  check over the individual items in preparation for storage
 */
if (pszMatch == NULL)
	{
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP, "%sInvalid lexical change: %s",
		szErrHead_m, pszString_in);
	return(NULL);
	}
/*
 *  parse the match string
 */
pMatchList = parseStampTransferMatch(pszMatch, 0, szErrHead_m, pStamp_in);
if (!pMatchList)
	{
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP,
		"%sInvalid match string in synthesis lexical change: %s",
		szErrHead_m, pszString_in);
	return(NULL);
	}
/*
 *  parse the replace string
 */
pReplaceList = parseStampTransferReplace(pszReplace,
					 0,
					 pMatchList,
					 szErrHead_m,
					 pStamp_in);
if (!pReplaceList && (*pszReplace != NUL))
	{                           /* can have empty replacement for deletion */
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP,
		"%sInvalid substitution string in lexical change: %s",
				szErrHead_m, pszString_in);
	freeStampChangeMorphList(pMatchList);
	return(NULL);
	}
/*
 *  parse the environment if one is present
 */
if (pszEnvir != NULL)
	{
	pEnv = parseAmpleMorphEnvConstraint(pszEnvir,
					"transfer lexical change",
					pStamp_in->pCategories,
					&pStamp_in->sProperties,
					pStamp_in->pCategClasses,
					pStamp_in->pMorphClasses,
					pStamp_in->pLogFP,
					&pStamp_in->pStringList);
	if (pEnv == NULL)
		{
	if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			"%sInvalid environment in lexical change: %s",
			szErrHead_m, pszString_in);
		freeStampChangeMorphList(pMatchList);
		freeStampChangeMorphList(pReplaceList);
		return(NULL);
		}
	}
else
	pEnv = NULL;
/*
 *  calculate the restrictiveness of the match (used to order the insertion)
 */
for ( iRestriction = 0, cp = pMatchList ; cp ; cp = cp->pNext )
	{
	if (cp->iMorphType & MORPHCLASS)
		iRestriction += 50;              /* morpheme class == category */
	else
		iRestriction += 100;             /* weight for a morpheme */
	if (cp->iMorphType & ROOT)
		{
		if (cp->iMorphType & CATCLASS)
			iRestriction += 25;          /* weight for a category class */
		else if (cp->uCat.iCode)
			iRestriction += 50;          /* weight for a category */
		if (cp->iMorphType & FIRSTMORPH)
			iRestriction += 20;
		if (cp->iMorphType & LASTMORPH)
			iRestriction += 20;
		}
	}
if (pEnv)
	iRestriction += 150;                 /* weight for an environment */
/*
 *  allocate and fill in a new node, and return its address
 */
pNew = (StampLexChange *)allocMemory( sizeof(StampLexChange) );
pNew->pMatch           = pMatchList;
pNew->pReplace         = pReplaceList;
pNew->pEnv             = pEnv;
pNew->iRestrictiveness = iRestriction;
return( pNew );
}

/*************************************************************************
 * NAME
 *    apply_lch
 * ARGUMENTS
 *    pAnalysis_in  - pointer to a list of analysis morphemes
 *    lexchp - pointer to a set of lexical changes
 * DESCRIPTION
 *    Perform any applicable lexical change to the analysis, but only one
 *    per root, and then only to roots which don't have allomorphs.
 * RETURN VALUE
 *    pointer to the (modified?) list of analysis morphemes
 */
static StampAnalysis * apply_lch(pAnalysis_in, lexchp, pUnit_in, pStamp_in)
StampAnalysis *	pAnalysis_in;
Trie *		lexchp;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
StampAnalysis *ap;
StampAnalysis *xp;
StampLexChange *lp;
/*
 *  handle null arguments
 */
if (!pAnalysis_in || !lexchp)
	return( pAnalysis_in );	/* no changes possible, so return input */
/*
 *  for each morpheme in the analysis
 */
for ( ap = pAnalysis_in ; ap ; )
	{
	if ((ap->m.iMorphType & ROOT) && ap->m.pAllomorphs)
		{
		ap = ap->pRightLink;             /* don't apply to roots we know */
		continue;                       /* (but allow compound roots) */
		}
	if (pStamp_in->iDebugLevel && (pStamp_in->pLogFP != NULL))
		{
		fprintf(pStamp_in->pLogFP,"\nTrying lexical changes on: ");
		writeStampBriefAnalysis( ap, NULL, pStamp_in->pLogFP, pStamp_in );
		}
	for (   lp = (StampLexChange *)findDataInTrie(lexchp,
							ap->m.pszMorphname) ;
		lp ;
		lp = lp->pNext )
		{
		/*
		 *  find out whether the lexical change actually matches, and if it
		 *  does match, check whether any morpheme environment constraint is
		 *  also satisfied
		 */
		if (pStamp_in->iDebugLevel && (pStamp_in->pLogFP != NULL))
			{
			fprintf(pStamp_in->pLogFP, "\n    matching against:");
			writeStampChangeMorphList(lp->pMatch, pStamp_in->pLogFP,
					  pStamp_in);
			}
		xp = checkStampTransferMatch( ap, lp->pMatch );
		if (xp && checkStampMorphEnviron(ap->pLeftLink, xp->pRightLink,
					 lp->pEnv, pUnit_in, pStamp_in) )
			{
			/*
			 *  we have a match, so make the replacement and quit
			 */
			if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
				{
				fprintf(pStamp_in->pLogFP,"  \\lc applies:    ");
				write_lch( lp, pStamp_in->pLogFP, pStamp_in );
				fprintf(pStamp_in->pLogFP,"\n     Before:");
				writeStampBriefAnalysis( pAnalysis_in, NULL, pStamp_in->pLogFP,
					 pStamp_in );
		fputc('\n', pStamp_in->pLogFP);
				}
			ap = replaceStampMorphemes(&pAnalysis_in,
					   ap,
					   xp->pRightLink,
					   lp->pReplace,
					   pStamp_in);
			if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
				{
				fprintf(pStamp_in->pLogFP,"     After: ");
				writeStampBriefAnalysis( pAnalysis_in, NULL, pStamp_in->pLogFP,
					 pStamp_in );
		fputc('\n', pStamp_in->pLogFP);
				}
			goto next_analysis_morph;           /* break to outer loop */
			}

		} /* end for each change in the list */

	ap = ap->pRightLink; /* no changes applied, look at next morpheme */

next_analysis_morph:
		;
	} /* end for each morpheme in the analysis */

return( pAnalysis_in );
}

/*****************************************************************************
 * NAME
 *    free_lch
 * DESCRIPTION
 *    Free the list of StampLexChange data structures stored at one node in the
 *    trie.
 * RETURN VALUE
 *    none
 */
static void free_lch(pList_in)
VOIDP	pList_in;
{
StampLexChange * pChg;
StampLexChange * pNext;
StampChangeMorphList * pCML;
StampChangeMorphList * pNextCML;

for ( pChg = (StampLexChange *)pList_in ; pChg ; pChg = pNext )
	{
	pNext = pChg->pNext;
	for ( pCML = pChg->pMatch ; pCML ; pCML = pNextCML )
	{
	pNextCML = pCML->pNext;
	if (!(pCML->iMorphType & MORPHCLASS))
		freeMemory(pCML->uMorph.pszName);
	freeMemory(pCML);
	}
	for ( pCML = pChg->pReplace ; pCML ; pCML = pNextCML )
	{
	pNextCML = pCML->pNext;
	freeMemory(pCML->uMorph.pszName);
	freeMemory(pCML);
	}
	freeAmpleEnvConstraint(pChg->pEnv);
	freeMemory(pChg);
	}
}

/*****************************************************************************
 * NAME
 *    freeStampLexChanges
 * DESCRIPTION
 *    Free the memory allocated for a Lexical Change trie.
 * RETURN VALUE
 *    none
 */
void freeStampLexChanges(pLexChgTrie_io)
Trie * pLexChgTrie_io;
{
if (pLexChgTrie_io)
	eraseTrie(pLexChgTrie_io, free_lch);
}
