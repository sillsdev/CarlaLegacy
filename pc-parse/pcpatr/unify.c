/* UNIFY.C - new unification functions for PC-PATR
 *****************************************************************************
 * PATRFeature * unifyPATRFeatures(PATRFeature * pFirstFeat_in,
 *				   PATRFeature * pSecondFeat_in,
 *				   int           bPreserve,
 *				   PATRData *    pThis)
 * PATRFeatureDisjunction * unifyPATRDisjuncts(
 *				   PATRFeatureDisjunction * pFirstDisjunct_in,
 *				   PATRFeatureDisjunction * pSecondDisjunct_in,
 *				   PATRData *               pThis)
 * void cleanupPATRUnifyDebris(PATRData * pThis)
 * int findPATRUnifyFailure(PATRFeature * pDag1_in, PATRFeature * pDag2_in,
 *			    StringList ** ppPath1_io,
 *			    PATRFeature ** ppFeat1_out,
 *			    StringList ** ppPath2_io,
 *			    PATRFeature ** ppFeat2_out,
 *			    PATRData * pThis)
 *****************************************************************************
 * Copyright 1989, 1999 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
#include "allocmem.h"
/*
 *  local function prototypes
 */
static PATRFeature * unify_features P((PATRFeature * pFirstFeat_in,
					   PATRFeature * pSecondFeat_in,
					   PATRData *    pThis));
static void saveFeature P((PATRFeature * pFeat_in, PATRData * pThis));
static void saveComplex P((PATRComplexFeature * pComplex_in,
			   PATRData *           pThis));
static void saveDisjunct P((PATRFeatureDisjunction * pDisjunct_in,
				PATRData *               pThis));
static PATRFeature * forwardToFeature P((PATRFeature * pFromFeat_in,
					 PATRFeature * pToFeat_in,
					 PATRData *    pThis));
static StringList * saveReversePath P((StringList *pPath_in,
					   PATRData * pThis));
static int is_feature_acyclic P((PATRFeature *		  pFeature_in,
				 PATRFeatureDisjunction * pList_in));

/*****************************************************************************
 * NAME
 *    PATRSavedFeature
 *    PATRSavedComplex
 *    PATRSavedDisjunct
 * DESCRIPTION
 *    data structures for saving original feature elements (used in unify.c)
 */
struct patr_saved_feat
	{
	PATRFeature *            pFeature;
	PATRFeature              sFeature;
	struct patr_saved_feat * pNext;
	};
struct patr_saved_comp
	{
	PATRComplexFeature *     pComplex;
	PATRComplexFeature       sComplex;
	struct patr_saved_comp * pNext;
	};
struct patr_saved_disj
	{
	PATRFeatureDisjunction * pDisjunct;
	PATRFeatureDisjunction   sDisjunct;
	struct patr_saved_disj * pNext;
	};

/*****************************************************************************
 * NAME
 *    unifyPATRFeatures
 * DESCRIPTION
 *    Unify two feature structures.
 *    Two feature structure pointer values have special significance:
 *      1. NULLFS denotes no information
 *      2. FAILFS denotes inconsistent information, or failure to unify
 *    If bPreserve is TRUE, then
 *	1. whenever a destructive change is about to be made in the value of
 *	   an attribute, the address and contents of that cell are saved.
 *	2. if unification fails, its effects are canceled from the saved data.
 *	3. if unification succeeds, the result is copied and then the effects
 *	   are canceled by restoring the original values.
 *    If bPreserve is FALSE, then simple destructive unification is carried
 *    out, and the result is a pointer to the first (modified) feature.
 * RETURN VALUE
 *    pointer to unified feature structure if successful, NULL if failure
 */
PATRFeature * unifyPATRFeatures( pFirstFeat_in, pSecondFeat_in, bPreserve,
				 pThis)
PATRFeature *	pFirstFeat_in;	/* first feature structure to unify */
PATRFeature *	pSecondFeat_in;	/* second feature structure to unify */
int		bPreserve;	/* flag to preserve input features */
PATRData *      pThis;
{
PATRFeature *		pUnifiedFeat;
PATRSavedFeature *	pSavedFeatures;
PATRSavedFeature *	pTailSavedFeatures;
PATRSavedFeature *	pOldSavedFeatures;
PATRSavedComplex *	pSavedComplex;
PATRSavedComplex *	pTailSavedComplex;
PATRSavedComplex *	pOldSavedComplex;
PATRSavedDisjunct * pSavedDisjunct;
PATRSavedDisjunct * pTailSavedDisjunct;
PATRSavedDisjunct * pOldSavedDisjunct;
int		bOldPreserve;
/*
 *  Protect against NULL pointers
 */
if ((pFirstFeat_in == NULL) || (pSecondFeat_in == NULL))
	{
	return( NULL );
	}
/*
 *  save input preservation flag
 */
bOldPreserve = pThis->pMem->bPreserve;
pThis->pMem->bPreserve  = bPreserve;
if (bPreserve)
	{
	/*
	 *  arrange for preserving input features
	 */
	pOldSavedFeatures = pThis->pMem->pSavedFeatures;
	pOldSavedComplex  = pThis->pMem->pSavedComplex;
	pOldSavedDisjunct = pThis->pMem->pSavedDisjunct;
	pThis->pMem->pSavedFeatures = NULL;
	pThis->pMem->pSavedComplex  = NULL;
	pThis->pMem->pSavedDisjunct = NULL;
	/*
	 *  unify the two input features
	 */
	pUnifiedFeat = unify_features(pFirstFeat_in, pSecondFeat_in, pThis);
	/*
	 *  copy the output feature and restore the input features
	 */
	if (pUnifiedFeat != NULL)
	{
	pUnifiedFeat = copyPATRFeature( pUnifiedFeat, pThis );
	}
	/*
	 *  restored all modified feature elements
	 */
	pTailSavedFeatures = NULL;
	for (   pSavedFeatures = pThis->pMem->pSavedFeatures ;
		pSavedFeatures ;
		pSavedFeatures = pSavedFeatures->pNext )
	{
	pSavedFeatures->pFeature->eType     = pSavedFeatures->sFeature.eType;
	pSavedFeatures->pFeature->u.pszAtom =
						pSavedFeatures->sFeature.u.pszAtom;
	pTailSavedFeatures = pSavedFeatures;
	}
	if (pTailSavedFeatures != NULL)
	{
	pTailSavedFeatures->pNext = pThis->pMem->pFreeSavedFeatures;
	pThis->pMem->pFreeSavedFeatures = pThis->pMem->pSavedFeatures;
	}
	pThis->pMem->pSavedFeatures = pOldSavedFeatures;

	pTailSavedComplex = NULL;
	for (   pSavedComplex = pThis->pMem->pSavedComplex ;
		pSavedComplex ;
		pSavedComplex = pSavedComplex->pNext )
	{
	pSavedComplex->pComplex->pszLabel = pSavedComplex->sComplex.pszLabel;
	pSavedComplex->pComplex->pValue   = pSavedComplex->sComplex.pValue;
	pSavedComplex->pComplex->pNext    = pSavedComplex->sComplex.pNext;
	pTailSavedComplex = pSavedComplex;
	}
	if (pTailSavedComplex != NULL)
	{
	pTailSavedComplex->pNext = pThis->pMem->pFreeSavedComplex;
	pThis->pMem->pFreeSavedComplex = pThis->pMem->pSavedComplex;
	}
	pThis->pMem->pSavedComplex  = pOldSavedComplex;

	pTailSavedDisjunct = NULL;
	for (   pSavedDisjunct = pThis->pMem->pSavedDisjunct ;
		pSavedDisjunct ;
		pSavedDisjunct = pSavedDisjunct->pNext )
	{
	pSavedDisjunct->pDisjunct->pFeature =
					   pSavedDisjunct->sDisjunct.pFeature;
	pSavedDisjunct->pDisjunct->pNext = pSavedDisjunct->sDisjunct.pNext;
	pTailSavedDisjunct = pSavedDisjunct;
	}
	if (pTailSavedDisjunct != NULL)
	{
	pTailSavedDisjunct->pNext = pThis->pMem->pFreeSavedDisjunct;
	pThis->pMem->pFreeSavedDisjunct = pThis->pMem->pSavedDisjunct;
	}
	pThis->pMem->pSavedDisjunct = pOldSavedDisjunct;
	/* Record the sources. */
	if (pUnifiedFeat) {
		pUnifiedFeat->pFirstFeat = pFirstFeat_in;
		pUnifiedFeat->pSecondFeat = pSecondFeat_in;
	}
	}
else
	{
	/*
	 *  unify the two input features
	 */
	pUnifiedFeat = unify_features(pFirstFeat_in, pSecondFeat_in, pThis);
	}
/*
 *  restore input preservation flag
 */
pThis->pMem->bPreserve = bOldPreserve;

return( pUnifiedFeat );
}

/*----------------------------------------------------------------------------
 * NAME
 *    unify_features
 * DESCRIPTION
 *    Unify two feature structures.
 *    Two feature structure pointer values have special significance:
 *      1. NULLFS denotes no information
 *      2. FAILFS denotes inconsistent information, or failure to unify
 * RETURN VALUE
 *    pointer to unified feature structure if successful, NULL if failure
 */
static PATRFeature * unify_features( pFirstFeat_in, pSecondFeat_in, pThis)
PATRFeature *	pFirstFeat_in;	/* first feature structure to unify */
PATRFeature *	pSecondFeat_in;	/* second feature structure to unify */
PATRData *      pThis;
{
PATRFeature *	 pFirstFeat;
PATRFeature *	 pSecondFeat;
PATRComplexFeature * pFirstComplex;
PATRComplexFeature * pSecondComplex;
PATRComplexFeature * pTailComplex;
PATRComplexFeature * pNextComplex;
int		 bLabelFound;
PATRFeature *	 pUnifiedFeat;
/*
 *  Follow pointers to real stuff
 */
pFirstFeat  = followPATRForwardPointers( pFirstFeat_in );
pSecondFeat = followPATRForwardPointers( pSecondFeat_in );
/*
 *  If either is failure, return failure
 */
if ((pFirstFeat->eType == PATR_FAILFS) || (pSecondFeat->eType == PATR_FAILFS))
	{
	return( NULL );
	}
/*
 *  If both are same entity, return success
 */
if (pFirstFeat == pSecondFeat)
	{
	return( pFirstFeat );
	}
/*
 *  If pFirstFeat is NULLFS (no information), return second
 */
if (pFirstFeat->eType == PATR_NULLFS)
	{
	return( forwardToFeature( pFirstFeat, pSecondFeat, pThis) );
	}
/*
 *  If pSecondFeat is NULLFS (no information), return first
 */
if (pSecondFeat->eType == PATR_NULLFS)
	{
	return( forwardToFeature( pSecondFeat, pFirstFeat, pThis) );
	}
/*
 *  If pFirstFeat is PATR_DEFATOM
 */
if (pFirstFeat->eType == PATR_DEFATOM)
	{
	if ( pSecondFeat->eType == PATR_DEFATOM )
	{
	/*
	 *  both are PATR_DEFATOM
	 */
	if (pFirstFeat->u.pszAtom == pSecondFeat->u.pszAtom)
		{
		return( pFirstFeat );
		}
	else
		{
		/*
		 *  incompatible defaults wipe each other out, but don't fail
		 */
		saveFeature( pFirstFeat, pThis);
		pFirstFeat->eType     = PATR_NULLFS;
		pFirstFeat->u.pszAtom = NULL;
		return( pFirstFeat );
		}
	}
	else
	{
	/*
	 *  pSecondFeat is atom or complex
	 */
	return( forwardToFeature( pFirstFeat, pSecondFeat, pThis) );
	}
	}
/*
 *  If pSecondFeat is PATR_DEFATOM, return first
 */
if (pSecondFeat->eType == PATR_DEFATOM)
	{
	return( forwardToFeature( pSecondFeat, pFirstFeat, pThis) );
	}
/*
 *  If pFirstFeat is PATR_ATOM
 */
if (pFirstFeat->eType == PATR_ATOM)
	{
	if (    (pSecondFeat->eType == PATR_ATOM) &&
		(pFirstFeat->u.pszAtom == pSecondFeat->u.pszAtom) )
	{
	return( pFirstFeat );
	}
	else
	{
	return( NULL );
	}
	}
/*
 *  if pSecondFeat is PATR_ATOM, fail
 */
if (pSecondFeat->eType == PATR_ATOM)
	{
	return( NULL );
	}
/*
 *  if pFirstFeat is DISJUNCT
 */
if (pFirstFeat->eType == PATR_DISJUNCT)
	{
	if (pSecondFeat->eType == PATR_DISJUNCT)
	{
	saveDisjunct( pFirstFeat->u.pDisjunction, pThis);
	saveDisjunct( pSecondFeat->u.pDisjunction, pThis);
	return( NULL );		/* NOTYET */
	}
	else
	{
	saveDisjunct( pFirstFeat->u.pDisjunction, pThis);
	return( NULL );		/* NOTYET */
	}
	}
/*
 *  if pSecondFeat is DISJUNCT
 */
if (pSecondFeat->eType == PATR_DISJUNCT)
	{
	saveDisjunct( pSecondFeat->u.pDisjunction, pThis);
	return( NULL );		/* NOTYET */
	}
if ((pFirstFeat->eType != PATR_COMPLEX) || (pSecondFeat->eType != PATR_COMPLEX))
	{
	return( NULL );		/* should never happen... */
	}
/*
 *  if both are COMPLEX, combine information from both
 *
 *  first, unify the features from the first list with the corresponding
 *  features from the second list
 */
pTailComplex = NULL;
for (	pFirstComplex = pFirstFeat->u.pComplex ;
	pFirstComplex ;
	pFirstComplex = pFirstComplex->pNext )
	{
	pTailComplex = pFirstComplex;
	bLabelFound = FALSE;
	for (   pSecondComplex = pSecondFeat->u.pComplex ;
		pSecondComplex ;
		pSecondComplex = pSecondComplex->pNext )
	{
	if (pFirstComplex->pszLabel == pSecondComplex->pszLabel)
		{
		bLabelFound = TRUE;
		break;
		}
	}
	if (bLabelFound)
	{
	pUnifiedFeat = unify_features(pFirstComplex->pValue,
					  pSecondComplex->pValue,
					  pThis);
	if (pUnifiedFeat == NULL)
		{
		return( NULL );
		}
	else if (pFirstComplex->pValue != pUnifiedFeat)
		{
		saveComplex(pFirstComplex, pThis);
		pFirstComplex->pValue = pUnifiedFeat;
		}
	}
	}
if (pTailComplex == NULL)
	return( forwardToFeature( pFirstFeat, pSecondFeat, pThis) );
saveComplex(pTailComplex, pThis);
/*
 *  add the features from the second list that were not in the first list
 */
for (	pSecondComplex = pSecondFeat->u.pComplex ;
	pSecondComplex ;
	pSecondComplex = pNextComplex )
	{
	pNextComplex = pSecondComplex->pNext;
	bLabelFound = FALSE;
	for (   pFirstComplex = pFirstFeat->u.pComplex ;
		pFirstComplex ;
		pFirstComplex = pFirstComplex->pNext )
	{
	if (pFirstComplex->pszLabel == pSecondComplex->pszLabel)
		{
		bLabelFound = TRUE;
		break;
		}
	}
	if (!bLabelFound)
	{
	saveComplex(pSecondComplex, pThis);
	pTailComplex->pNext   = pSecondComplex;
	pSecondComplex->pNext = NULL;
	pTailComplex          = pSecondComplex;
	}
	}
return( forwardToFeature( pSecondFeat, pFirstFeat, pThis) );
}

/*****************************************************************************
 * NAME
 *    saveFeature
 * DESCRIPTION
 *    save a PATRFeature for future restoration
 * RETURN VALUE
 *    none
 */
static void saveFeature( pFeat_in, pThis )
PATRFeature *	pFeat_in;
PATRData *      pThis;
{
PATRSavedFeature *	pSave;

if ((pThis->pMem->bPreserve == FALSE) || (pFeat_in == NULL))
	return;
if (pThis->pMem->pFreeSavedFeatures != NULL)
	{
	pSave = pThis->pMem->pFreeSavedFeatures;
	pThis->pMem->pFreeSavedFeatures =
					 pThis->pMem->pFreeSavedFeatures->pNext;
	}
else
	pSave = (PATRSavedFeature *)allocMemory(sizeof(PATRSavedFeature));
pSave->pFeature           = pFeat_in;
pSave->sFeature.eType     = pFeat_in->eType;
pSave->sFeature.u.pszAtom = pFeat_in->u.pszAtom;
pSave->pNext              = pThis->pMem->pSavedFeatures;
pThis->pMem->pSavedFeatures = pSave;
}

/*****************************************************************************
 * NAME
 *    saveComplex
 * DESCRIPTION
 *    save a PATRComplexFeature for future restoration
 * RETURN VALUE
 *    none
 */
static void saveComplex( pComplex_in, pThis)
PATRComplexFeature * pComplex_in;
PATRData *           pThis;
{
PATRSavedComplex *	pSave;

if ((pThis->pMem->bPreserve == FALSE) || (pComplex_in == NULL))
	return;
if (pThis->pMem->pFreeSavedComplex != NULL)
	{
	pSave               = pThis->pMem->pFreeSavedComplex;
	pThis->pMem->pFreeSavedComplex =
					  pThis->pMem->pFreeSavedComplex->pNext;
	}
else
	pSave = (PATRSavedComplex *)allocMemory(sizeof(PATRSavedComplex));
pSave->pComplex          = pComplex_in;
pSave->sComplex.pszLabel = pComplex_in->pszLabel;
pSave->sComplex.pValue   = pComplex_in->pValue;
pSave->sComplex.pNext    = pComplex_in->pNext;
pSave->pNext             = pThis->pMem->pSavedComplex;
pThis->pMem->pSavedComplex = pSave;
}

/*****************************************************************************
 * NAME
 *    saveDisjunct
 * DESCRIPTION
 *    save a PATRFeatureDisjunction for future restoration
 * RETURN VALUE
 *    none
 */
static void saveDisjunct( pDisjunct_in, pThis)
PATRFeatureDisjunction * pDisjunct_in;
PATRData *               pThis;
{
PATRSavedDisjunct *	pSave;

if ((pThis->pMem->bPreserve == FALSE) || (pDisjunct_in == NULL))
	return;
if (pThis->pMem->pFreeSavedDisjunct != NULL)
	{
	pSave                = pThis->pMem->pFreeSavedDisjunct;
	pThis->pMem->pFreeSavedDisjunct =
					 pThis->pMem->pFreeSavedDisjunct->pNext;
	}
else
	pSave = (PATRSavedDisjunct *)allocMemory(sizeof(PATRSavedDisjunct));
pSave->pDisjunct          = pDisjunct_in;
pSave->sDisjunct.pFeature = pDisjunct_in->pFeature;
pSave->sDisjunct.pNext    = pDisjunct_in->pNext;
pSave->pNext              = pThis->pMem->pSavedDisjunct;
pThis->pMem->pSavedDisjunct = pSave;
}

/*----------------------------------------------------------------------------
 * NAME
 *    forwardToFeature
 * DESCRIPTION
 *    make the "From" feature a forward reference to the "To" feature
 * RETURN VALUE
 *    pointer to the "To" feature (second argument)
 */
static PATRFeature * forwardToFeature(pFromFeat_in, pToFeat_in, pThis)
PATRFeature * pFromFeat_in;
PATRFeature * pToFeat_in;
PATRData *    pThis;
{
if (pFromFeat_in == NULL)
	return pToFeat_in;
saveFeature( pFromFeat_in, pThis);
pFromFeat_in->eType      = PATR_FORWARD;		/* Make it FORWARD */
pFromFeat_in->u.pForward = pToFeat_in;	/* Set value */
return pToFeat_in;
}

/*****************************************************************************
 * NAME
 *    unifyPATRDisjuncts
 * DESCRIPTION
 *    Unify alternates from two feature disjunctions
 * RETURN VALUE
 *    pointer to unified feature disjunction, or NULL if none unify
 */
PATRFeatureDisjunction * unifyPATRDisjuncts(pFirstDisjunct_in,
						pSecondDisjunct_in, pThis)
PATRFeatureDisjunction * pFirstDisjunct_in;	/* list of disjunctions */
PATRFeatureDisjunction * pSecondDisjunct_in;	/* list of disjunctions */
PATRData *               pThis;
{
PATRFeatureDisjunction * pFirst;
PATRFeatureDisjunction * pSecond;
PATRFeatureDisjunction * pResults;
PATRFeatureDisjunction * pDisjunct;
PATRFeature *	         pUnifiedFeat;

pResults = NULL;
for ( pFirst = pFirstDisjunct_in ; pFirst ; pFirst = pFirst->pNext )
	{
	for (pSecond = pSecondDisjunct_in ; pSecond ; pSecond = pSecond->pNext)
	{
	pUnifiedFeat = unifyPATRFeatures(pFirst->pFeature, pSecond->pFeature,
					 TRUE, pThis);
	if (!verifyAcyclicPATRFeature(pUnifiedFeat))
		pUnifiedFeat = NULL;
	if (pUnifiedFeat != NULL)
		{
		/*
		 *  add this alternative to result list
		 */
		pDisjunct = createPATRFeatureDisjunction( pUnifiedFeat, pThis );
		pDisjunct->pNext = pResults;
		pResults = pDisjunct;
		}
	}
	}
return ( pResults );
}

/*****************************************************************************
 * NAME
 *    cleanupPATRUnifyDebris
 * DESCRIPTION
 *    free any memory allocated for internal bookkeeping by unifyPATRFeatures()
 * RETURN VALUE
 *    none
 */
void cleanupPATRUnifyDebris(pThis)
PATRData *      pThis;
{
PATRSavedFeature *  pFeature;
PATRSavedFeature *  pNextFeature;
PATRSavedComplex *  pComplex;
PATRSavedComplex *  pNextComplex;
PATRSavedDisjunct * pDisjunct;
PATRSavedDisjunct * pNextDisjunct;

for (	pFeature = pThis->pMem->pFreeSavedFeatures ;
	pFeature ;
	pFeature = pNextFeature )
	{
	pNextFeature = pFeature->pNext;
	freeMemory( pFeature );
	}
pThis->pMem->pFreeSavedFeatures = NULL;
for (	pComplex = pThis->pMem->pFreeSavedComplex ;
	pComplex ;
	pComplex = pNextComplex )
	{
	pNextComplex = pComplex->pNext;
	freeMemory( pComplex );
	}
pThis->pMem->pFreeSavedComplex = NULL;
for (	pDisjunct = pThis->pMem->pFreeSavedDisjunct ;
	pDisjunct ;
	pDisjunct = pNextDisjunct)
	{
	pNextDisjunct = pDisjunct->pNext;
	freeMemory( pDisjunct );
	}
pThis->pMem->pFreeSavedDisjunct = NULL;
}

/*----------------------------------------------------------------------------
 * NAME
 *    saveReversePath
 * DESCRIPTION
 *
 * RETURN VALUE
 *    pointer to the newly allocated (and reversed) path
 */
static StringList * saveReversePath(pPath_in, pThis)
StringList *	pPath_in;
PATRData * pThis;
{
StringList *	pNewPath;
StringList *	pHead;
StringList *	pTail;

if (pPath_in == NULL)
	return((StringList *)NULL);
pHead = saveReversePath(pPath_in->pNext, pThis);

pNewPath = allocPATRFeaturePath(pThis);
pNewPath->pszString = pPath_in->pszString;
pNewPath->pNext     = NULL;

if (pHead == NULL)
	return( pNewPath );

for ( pTail = pHead ; pTail->pNext ; pTail = pTail->pNext )
	;
pTail->pNext = pNewPath;
return( pHead );
}

/*****************************************************************************
 * NAME
 *    findPATRUnifyFailure
 * DESCRIPTION
 *    find the (first) nodes in two feature structures that prevent them from
 *    unifying
 * RETURN VALUE
 *    TRUE if failure found, FALSE otherwise; *ppPath1_io, *ppFeat1_out,
 *    *ppPath2_io, and *ppFeat2_out are modified appropriately
 */
int findPATRUnifyFailure(pDag1_in, pDag2_in,
			 ppPath1_io, ppFeat1_out, ppPath2_io, ppFeat2_out,
			 pThis)
PATRFeature *	pDag1_in;
PATRFeature *	pDag2_in;
StringList **		ppPath1_io;
PATRFeature **	ppFeat1_out;
StringList **		ppPath2_io;
PATRFeature **	ppFeat2_out;
PATRData * pThis;
{
PATRFeature *	 pFirstFeat;
PATRFeature *	 pSecondFeat;
PATRComplexFeature * pFirstComplex;
PATRComplexFeature * pSecondComplex;
PATRComplexFeature * pTailComplex;
int		 bLabelFound;
int		 bFailedFound;
PATRFeature *	 pFeat1;
PATRFeature *	 pFeat2;
StringList *		 pPath1;
StringList *		 pPath2;
StringList		 pathNode1;
StringList		 pathNode2;
/*
 *  Follow pointers to real stuff
 */
pFirstFeat  = followPATRForwardPointers( pDag1_in );
pSecondFeat = followPATRForwardPointers( pDag2_in );
/*
 *  If either is failure, return
 */
if ((pFirstFeat->eType == PATR_FAILFS) || (pSecondFeat->eType == PATR_FAILFS))
	{
	*ppFeat1_out = pFirstFeat;
	*ppFeat2_out = pSecondFeat;
	*ppPath1_io = saveReversePath(*ppPath1_io, pThis);
	*ppPath2_io = saveReversePath(*ppPath2_io, pThis);
	return TRUE;
	}
/*
 *  If both are same entity, return success
 */
if (pFirstFeat == pSecondFeat)
	{
	*ppPath1_io = NULL;
	*ppPath2_io = NULL;
	*ppFeat1_out = NULL;
	*ppFeat2_out = NULL;
	return FALSE;
	}
/*
 *  If pFirstFeat is NULLFS (no information), return second
 */
if (pFirstFeat->eType == PATR_NULLFS)
	{
	*ppPath1_io = NULL;
	*ppPath2_io = NULL;
	*ppFeat1_out = NULL;
	*ppFeat2_out = NULL;
	return FALSE;
	}
/*
 *  If pSecondFeat is NULLFS (no information), return first
 */
if (pSecondFeat->eType == PATR_NULLFS)
	{
	*ppPath1_io = NULL;
	*ppPath2_io = NULL;
	*ppFeat1_out = NULL;
	*ppFeat2_out = NULL;
	return FALSE;
	}
/*
 *  If pFirstFeat is PATR_DEFATOM
 */
if (pFirstFeat->eType == PATR_DEFATOM)
	{
	/*
	 *  both are PATR_DEFATOM, or
	 *  pSecondFeat is atom or complex
	 */
	*ppPath1_io = NULL;
	*ppPath2_io = NULL;
	*ppFeat1_out = NULL;
	*ppFeat2_out = NULL;
	return FALSE;
	}
/*
 *  If pSecondFeat is PATR_DEFATOM, return first
 */
if (pSecondFeat->eType == PATR_DEFATOM)
	{
	*ppPath1_io = NULL;
	*ppPath2_io = NULL;
	*ppFeat1_out = NULL;
	*ppFeat2_out = NULL;
	return FALSE;
	}
/*
 *  If pFirstFeat is PATR_ATOM
 */
if (pFirstFeat->eType == PATR_ATOM)
	{
	if (    (pSecondFeat->eType == PATR_ATOM) &&
		(pFirstFeat->u.pszAtom == pSecondFeat->u.pszAtom) )
	{
	*ppPath1_io = NULL;
	*ppPath2_io = NULL;
	*ppFeat1_out = NULL;
	*ppFeat2_out = NULL;
	return FALSE;
	}
	else
	{
	*ppFeat1_out = pFirstFeat;
	*ppFeat2_out = pSecondFeat;
	*ppPath1_io = saveReversePath(*ppPath1_io, pThis);
	*ppPath2_io = saveReversePath(*ppPath2_io, pThis);
	return TRUE;
	}
	}
/*
 *  if pSecondFeat is PATR_ATOM, fail
 */
if (pSecondFeat->eType == PATR_ATOM)
	{
	*ppFeat1_out = pFirstFeat;
	*ppFeat2_out = pSecondFeat;
	*ppPath1_io = saveReversePath(*ppPath1_io, pThis);
	*ppPath2_io = saveReversePath(*ppPath2_io, pThis);
	return TRUE;
	}
/*
 *  if pFirstFeat is DISJUNCT
 */
if (pFirstFeat->eType == PATR_DISJUNCT)
	{
	*ppPath1_io = NULL;
	*ppPath2_io = NULL;
	*ppFeat1_out = NULL;
	*ppFeat2_out = NULL;
	return FALSE;
	}
/*
 *  if pSecondFeat is DISJUNCT
 */
if (pSecondFeat->eType == PATR_DISJUNCT)
	{
	*ppPath1_io = NULL;
	*ppPath2_io = NULL;
	*ppFeat1_out = NULL;
	*ppFeat2_out = NULL;
	return FALSE;
	}
if ((pFirstFeat->eType != PATR_COMPLEX) || (pSecondFeat->eType != PATR_COMPLEX))
	{
	*ppFeat1_out = pFirstFeat;
	*ppFeat2_out = pSecondFeat;
	*ppPath1_io = saveReversePath(*ppPath1_io, pThis);
	*ppPath2_io = saveReversePath(*ppPath2_io, pThis);
	return TRUE;
	}
/*
 *  check if the features from the first list unify with the corresponding
 *  features from the second list
 */
pTailComplex = NULL;
for (	pFirstComplex = pFirstFeat->u.pComplex ;
	pFirstComplex ;
	pFirstComplex = pFirstComplex->pNext )
	{
	pTailComplex = pFirstComplex;
	bLabelFound = FALSE;
	for (   pSecondComplex = pSecondFeat->u.pComplex ;
		pSecondComplex ;
		pSecondComplex = pSecondComplex->pNext )
	{
	if (pFirstComplex->pszLabel == pSecondComplex->pszLabel)
		{
		bLabelFound = TRUE;
		break;
		}
	}
	if (bLabelFound)
	{
	pPath1              = &pathNode1;
	pathNode1.pszString = pFirstComplex->pszLabel;
	pathNode1.pNext     = *ppPath1_io;
	pPath2              = &pathNode2;
	pathNode2.pszString = pSecondComplex->pszLabel;
	pathNode2.pNext     = *ppPath2_io;
	bFailedFound = findPATRUnifyFailure(pFirstComplex->pValue,
						pSecondComplex->pValue,
						&pPath1, &pFeat1,
						&pPath2, &pFeat2,
						pThis);
	if (bFailedFound)
		{
		*ppPath1_io  = pPath1;
		*ppPath2_io  = pPath2;
		*ppFeat1_out = pFeat1;
		*ppFeat2_out = pFeat2;
		return TRUE;
		}
	}
	}
*ppPath1_io = NULL;
*ppPath2_io = NULL;
*ppFeat1_out = NULL;
*ppFeat2_out = NULL;
return FALSE;
}

/*****************************************************************************
 * NAME
 *    is_feature_acyclic
 * DESCRIPTION
 *    check whether or not the feature structure is a proper DAG, without any
 *    cycles in the graph
 * RETURN VALUE
 *    FALSE if the feature structure has a cycle, TRUE if it is a proper DAG
 */
static int is_feature_acyclic(pFeature_in, pList_in)
PATRFeature *		 pFeature_in;
PATRFeatureDisjunction * pList_in;
{
PATRFeatureDisjunction sRecord;
PATRComplexFeature *	 pComp;
PATRFeatureDisjunction * pDisj;


if (pFeature_in == NULL)
	return TRUE;
for ( pDisj = pList_in ; pDisj ; pDisj = pDisj->pNext )
	{
	if (pFeature_in == pDisj->pFeature)
	return FALSE;
	}
switch (pFeature_in->eType)
	{
	case PATR_ATOM:
	break;
	case PATR_COMPLEX:
	sRecord.pFeature = pFeature_in;
	sRecord.pNext    = pList_in;
	for ( pComp = pFeature_in->u.pComplex ; pComp ; pComp = pComp->pNext )
		{
		if (!is_feature_acyclic(pComp->pValue, &sRecord))
		return FALSE;
		}
	break;
	case PATR_FORWARD:
	sRecord.pFeature = pFeature_in;
	sRecord.pNext    = pList_in;
	if (!is_feature_acyclic(pFeature_in->u.pForward, &sRecord))
		return FALSE;
	break;
	case PATR_NULLFS:
	break;
	case PATR_FAILFS:
	break;
	case PATR_DEFATOM:
	break;
	case PATR_DISJUNCT:
	sRecord.pFeature = pFeature_in;
	sRecord.pNext    = pList_in;
	for (	pDisj = pFeature_in->u.pDisjunction ;
		pDisj ;
		pDisj = pDisj->pNext )
		{
		if (!is_feature_acyclic(pDisj->pFeature, &sRecord))
		return FALSE;
		}
	break;
	}
return TRUE;
}

/*****************************************************************************
 * NAME
 *    verifyAcyclicPATRFeature
 * DESCRIPTION
 *
 * RETURN VALUE
 *    TRUE if the feature structure is a proper DAG, FALSE if it has a cycle
 */
int verifyAcyclicPATRFeature(pFeature_in)
PATRFeature * pFeature_in;
{
return is_feature_acyclic(pFeature_in, NULL);
}
