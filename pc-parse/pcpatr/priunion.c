/* PRIUNION.C - functions for handling priority union operations in PC-PATR
 ***************************************************************************
 *
 * void writePATRPriorityUnion(pUnion_in, pOutputFP_in)
 * PATRPriorityUnion * pUnion_in;
 * FILE *              pOutputFP_in;
 *
 * void applyPATRPriorityUnion(pFeature_io, pUnion_in, pPATR_in)
 * PATRFeature *       pFeature_io;
 * PATRPriorityUnion * pUnion_in;
 * PATRData *          pPATR_in;
 *
 ***************************************************************************
 * Copyright 1998, 2001 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"

static PATRFeature * priorityUnion P((PATRFeature * pDest_in,
					  PATRFeature * pSrc_in));
static PATRFeature * follow_path P((PATRFeature * pFeature_in,
					StringList *  pPath_in));

/*****************************************************************************
 * NAME
 *    writePATRPriorityUnion
 * DESCRIPTION
 *    display the contents of the PATRPriorityUnion data structure
 * RETURN VALUE
 *    none
 */
void writePATRPriorityUnion(pUnion_in, pOutputFP_in)
PATRPriorityUnion * pUnion_in;
FILE *              pOutputFP_in;
{
/*
 *  check for valid inputs
 */
if (pUnion_in == NULL)
	return;
if (pUnion_in->pOutputPath == NULL)
	{
	fprintf(pOutputFP_in,
		"Invalid PATRPriorityUnion: NULL output feature path\n");
	return;
	}
if ((pUnion_in->pInputPath == NULL) && (pUnion_in->pInputAtom == NULL))
	{
	fprintf(pOutputFP_in, "Invalid PATRPriorityUnion: NULL input feature\n");
	return;
	}
/*
 *  display the output (left) path
 */
fprintf(pOutputFP_in, "<");
writeStringList(pUnion_in->pOutputPath, " ", pOutputFP_in);
fprintf(pOutputFP_in, "> <= ");
/*
 *  display the input (right) feature / path
 */
if (pUnion_in->pInputAtom)
	{
	if (pUnion_in->pInputAtom->eType == PATR_ATOM)
	{
	fprintf(pOutputFP_in, "%s", pUnion_in->pInputAtom->u.pszAtom);
	}
	else
	{
	fprintf(pOutputFP_in,
		"Invalid PATRPriorityUnion: bad input feature type (%d)\n",
		pUnion_in->pInputAtom->eType);
	}
	}
else
	{
	fprintf(pOutputFP_in, "<");
	writeStringList(pUnion_in->pInputPath, " ", pOutputFP_in);
	fprintf(pOutputFP_in, ">");
	}
}

/*****************************************************************************
 * NAME
 *    priorityUnion
 * DESCRIPTION
 *    merge the source feature into the destination feature, overwriting any
 *    conflicting values
 * RETURN VALUE
 *    pointer to the possibly modified destination feature
 */
static PATRFeature * priorityUnion(pDest_in, pSrc_in)
PATRFeature * pDest_in;
PATRFeature * pSrc_in;
{
PATRFeature *	     pFirstFeat;
PATRFeature *	     pSecondFeat;
PATRComplexFeature * pFirstComplex;
PATRComplexFeature * pSecondComplex;
PATRComplexFeature * pTailComplex;
PATRComplexFeature * pNextComplex;
int		     bLabelFound;
/*
 *  if either is NULL, return the other
 */
if (pDest_in == NULL)
	return pSrc_in;
if (pSrc_in == NULL)
	return pDest_in;
/*
 *  Follow pointers to real stuff
 */
pFirstFeat  = followPATRForwardPointers( pDest_in );
pSecondFeat = followPATRForwardPointers( pSrc_in );
/*
 *  If both are same entity, return the first
 */
if (pFirstFeat == pSecondFeat)
	return pFirstFeat;
/*
 *  If either is failure, return the other
 *  If either is NULLFS (no information), return the other
 */
if (pFirstFeat->eType == PATR_FAILFS)
	return pSecondFeat;
if (pSecondFeat->eType == PATR_FAILFS)
	return pFirstFeat;
if (pFirstFeat->eType == PATR_NULLFS)
	return pSecondFeat;
if (pSecondFeat->eType == PATR_NULLFS)
	return pFirstFeat;
/*
 *  If either pFirstFeat or pSecondFeat is DEFATOM or ATOM,
 *  return pSecondFeat
 */
if ((pFirstFeat->eType == PATR_DEFATOM) || (pFirstFeat->eType == PATR_ATOM))
	return pSecondFeat;
if ((pSecondFeat->eType == PATR_DEFATOM) || (pSecondFeat->eType == PATR_ATOM))
	return pSecondFeat;
/*
 *  if either pFirstFeat or pSecondFeat is DISJUNCT, return pSecondFeat (?)
 */
if (pFirstFeat->eType == PATR_DISJUNCT)
	return pSecondFeat;
if (pSecondFeat->eType == PATR_DISJUNCT)
	return pSecondFeat;
/*
 *  if either pFirstFeat or pSecondFeat is *not* COMPLEX, return pSecondFeat
 *  (this should never happen)
 */
if (	(pFirstFeat->eType  != PATR_COMPLEX) ||
	(pSecondFeat->eType != PATR_COMPLEX) )
	return pSecondFeat;
/*
 *  if both are COMPLEX, combine information from both
 *
 *  first, "priorityUnion" the features from the first list with the
 *  corresponding features from the second list
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
	pFirstComplex->pValue = priorityUnion(pFirstComplex->pValue,
						  pSecondComplex->pValue);
	}
/*
 *  if pFirstFeat proved to be empty, return pSecondFeat
 */
if (pTailComplex == NULL)
	return pSecondFeat;
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
	pTailComplex->pNext   = pSecondComplex;
	pSecondComplex->pNext = NULL;
	pTailComplex          = pSecondComplex;
	}
	}
return pFirstFeat;
}

/*****************************************************************************
 * NAME
 *    follow_path
 * DESCRIPTION
 *    Find the feature indicated by the path.
 * RETURN VALUE
 *    pointer to feature value specified by path, or NULL if not found
 */
static PATRFeature * follow_path(pFeature_in, pPath_in)
PATRFeature *	pFeature_in;	/* pointer to a feature structure */
StringList *	pPath_in;	/* list of feature path labels */
{
PATRComplexFeature *	flp;
PATRFeature *		pFeature;

if (pFeature_in == (PATRFeature *)NULL)
	return NULL;
pFeature = followPATRForwardPointers( pFeature_in );
if (pPath_in == (StringList *)NULL)
	return( pFeature );

if (pFeature->eType == PATR_COMPLEX)
	{
	for ( flp = pFeature->u.pComplex ; flp ; flp = flp->pNext )
	{
	if (flp->pszLabel == pPath_in->pszString)
		return follow_path(flp->pValue, pPath_in->pNext);
	}
	}
return NULL;
}

/*****************************************************************************
 * NAME
 *    applyPATRPriorityUnion
 * DESCRIPTION
 *    apply the given priority union operation to the PATR feature
 * RETURN VALUE
 *    none
 */
void applyPATRPriorityUnion(pFeature_io, pUnion_in, pPATR_in)
PATRFeature *	    pFeature_io;
PATRPriorityUnion * pUnion_in;
PATRData *          pPATR_in;
{
PATRFeature *	     pInput;
PATRFeature *        pFeat = NULL;
PATRComplexFeature * flp   = NULL;
PATRComplexFeature * flpPrev;
StringList *         ps;

if ((pFeature_io == NULL) || (pUnion_in == NULL))
	return;
if (pUnion_in->pOutputPath == NULL)
	return;
if ((pUnion_in->pInputPath == NULL) && (pUnion_in->pInputAtom == NULL))
	return;

if (pPATR_in->iDebugLevel >= 2)
	{
	fprintf(stdout, "DEBUG: applyPATRPriorityUnion()\n");
	fprintf(stdout, "pUnion = ");
	writePATRPriorityUnion(pUnion_in, stdout);
	fprintf(stdout, "\n");
	fprintf(stdout, "pFeature (in) = ");
	writePATRFeature(pFeature_io, stdout, 17, pPATR_in);
	fprintf(stdout, "\n");
	}

if (pUnion_in->pInputPath)
	pInput = follow_path(pFeature_io, pUnion_in->pInputPath);
else
	pInput = pUnion_in->pInputAtom;

if ((pInput != NULL) && (pInput->eType != PATR_NULLFS))
	{
	pFeat = pFeature_io;
	for ( ps = pUnion_in->pOutputPath ; ps ; ps = ps->pNext )
	{
	pFeat = followPATRForwardPointers( pFeat );
	if (pFeat->eType == PATR_COMPLEX)
		{
		flpPrev = NULL;
		for ( flp = pFeat->u.pComplex ; flp ; flp = flp->pNext )
		{
		if (flp->pszLabel == ps->pszString)
			break;
		flpPrev = flp;
		}
		if (flp == NULL)
		{
		/* Since we don't have the required feature path, add it */
		flp = createPATRComplexFeature(ps->pszString,
						   createPATRNullFeature(pPATR_in),
						   pPATR_in);
		if (flpPrev == NULL)
			pFeat->u.pComplex = flp;
		else
			flpPrev->pNext = flp;
		/* Extend the feature path further if necessary. */
		if (ps->pNext)
			{
			flp->pValue->eType = PATR_COMPLEX;
			flp->pValue->u.pComplex = NULL;
			}
		}
		pFeat = flp->pValue;
		}
	else
		{
		break;
		}
	}
	if (flp != NULL)
	{
	if (    (pInput->eType == PATR_ATOM)         ||
		(flp->pValue->eType == PATR_ATOM)    ||
		(flp->pValue->eType == PATR_DEFATOM) ||
		(flp->pValue->eType == PATR_NULLFS)  ||
		(flp->pValue->eType == PATR_FAILFS) )
		flp->pValue = pInput;
	else
		flp->pValue = priorityUnion(copyPATRFeature(flp->pValue, pPATR_in),
					copyPATRFeature(pInput, pPATR_in) );
	}
	}
if (pPATR_in->iDebugLevel >= 2)
	{
	fprintf(stdout, "pFeature (out) = ");
	writePATRFeature(pFeature_io, stdout, 17, pPATR_in);
	fprintf(stdout, "\n");
	}
}
