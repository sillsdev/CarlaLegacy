/* SUBSUME.C - feature subsumption functions for PC-PATR
 *****************************************************************************
 *
 * int subsumesPATRFeature(PATRFeature *pFirstFeat_in,
 *			   PATRFeature *pSecondFeat_in)
 *
 *****************************************************************************
 * Copyright 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"

/*****************************************************************************
 * NAME
 *    subsumesPATRFeature
 * DESCRIPTION
 *    check whether the first feature structure subsumes the second
 * RETURN VALUE
 *    TRUE if the first feature structure subsumes the second, otherwise FALSE
 */
int subsumesPATRFeature(pFirstFeat_in, pSecondFeat_in)
PATRFeature *	pFirstFeat_in;
PATRFeature *	pSecondFeat_in;
{
PATRFeature *			pFirst;
PATRFeature *			pSecond;
PATRFeatureDisjunction *	pDisjunct;
PATRComplexFeature *		p1st;
PATRComplexFeature *		p2nd;
int				bFound;

pFirst = followPATRForwardPointers( pFirstFeat_in );
if (pFirst == NULL)
	return TRUE;
pSecond = followPATRForwardPointers( pSecondFeat_in );
if (pSecond == NULL)
	return FALSE;

switch (pFirst->eType)
	{
	case PATR_ATOM:
	if (	(pSecond->eType == PATR_ATOM) ||
		(pSecond->eType == PATR_DEFATOM) )
		return (pFirst->u.pszAtom == pSecond->u.pszAtom);
	else
		return FALSE;

	case PATR_COMPLEX:
	if (pSecond->eType == PATR_COMPLEX)
		{
		for ( p1st = pFirst->u.pComplex ; p1st ; p1st = p1st->pNext )
		{
		bFound = FALSE;
		for ( p2nd = pSecond->u.pComplex ; p2nd ; p2nd = p2nd->pNext )
			{
			if (p1st->pszLabel == p2nd->pszLabel)
			{
			if (!subsumesPATRFeature(p1st->pValue, p2nd->pValue))
				return FALSE;
			bFound = TRUE;
			break;
			}
			}
		if (!bFound)
			return FALSE;
		}
		return TRUE;
		}
	else if (pSecond->eType == PATR_DISJUNCT)
		{
		/*
		 *  if first subsumes any alternative of second, then TRUE
		 */
		for (	pDisjunct = pSecond->u.pDisjunction ;
			pDisjunct ;
			pDisjunct = pDisjunct->pNext )
		{
		if (subsumesPATRFeature(pFirst, pDisjunct->pFeature))
			return TRUE;
		}
		return FALSE;
		}
	else
		return FALSE;

	case PATR_FORWARD:
	return FALSE;		/* should never happen */

	case PATR_NULLFS:
	/*
	 *  null feature subsumes any other feature
	 */
	return TRUE;

	case PATR_FAILFS:
	return FALSE;

	case PATR_DEFATOM:
	if (	(pSecond->eType == PATR_ATOM) ||
		(pSecond->eType == PATR_DEFATOM) )
		return (pFirst->u.pszAtom == pSecond->u.pszAtom);
	else
		return FALSE;

	case PATR_DISJUNCT:
	/*
	 *  if all alternatives of first subsume the second, then TRUE
	 */
	for (	pDisjunct = pFirst->u.pDisjunction ;
		pDisjunct ;
		pDisjunct = pDisjunct->pNext )
		{
		if (!subsumesPATRFeature(pDisjunct->pFeature, pSecond))
		return FALSE;
		}
	return TRUE;

	default:
	return FALSE;		/* should never happen */
	}
}
