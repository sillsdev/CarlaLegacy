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
#ifndef hab130v
int subsumesPATRFeature(pFirstFeat_in, pSecondFeat_in,
			apszIndexedVariableValues)
PATRFeature *	pFirstFeat_in;
PATRFeature *	pSecondFeat_in;
char ** apszIndexedVariableValues;
#else  /* hab130v */
int subsumesPATRFeature(pFirstFeat_in, pSecondFeat_in)
PATRFeature *	pFirstFeat_in;
PATRFeature *	pSecondFeat_in;
#endif /* hab130v */
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
#ifndef hab130v
			if (!subsumesPATRFeature(p1st->pValue,
						 p2nd->pValue,
						 apszIndexedVariableValues))
#else  /* hab130v */
			if (!subsumesPATRFeature(p1st->pValue, p2nd->pValue))
#endif /* hab130v */
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
#ifndef hab130v
		if (subsumesPATRFeature(pFirst,
					pDisjunct->pFeature,
					apszIndexedVariableValues))
#else				/* hab130v */
		if (subsumesPATRFeature(pFirst, pDisjunct->pFeature))
#endif /* hab130v */
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
#ifndef hab130v
		if (!subsumesPATRFeature(pDisjunct->pFeature,
					 pSecond,
					 apszIndexedVariableValues))
#else  /* hab130v */
		if (!subsumesPATRFeature(pDisjunct->pFeature, pSecond))
#endif /* hab130v */
		return FALSE;
		}
	return TRUE;

	case PATR_VARIABLE:
		if (apszIndexedVariableValues != NULL)
		{
		if (	(pSecond->eType == PATR_ATOM) ||
			(pSecond->eType == PATR_DEFATOM) )
			{
		if (apszIndexedVariableValues[pFirst->u.iVariable] == NULL)
				/* need to set value */
		  {
			apszIndexedVariableValues[pFirst->u.iVariable] =
												  pSecond->u.pszAtom;
			return TRUE;
		  }
		else		/* already set value; compare */
			return (apszIndexedVariableValues[pFirst->u.iVariable] ==
				pSecond->u.pszAtom);
		}
		else			/* second must be atomic; otherwise no
				   reason to use logical constraint
				   (a unification constraint will do) */
			return FALSE;
		}
	else
	  return TRUE;		/* should not happen, but if so, treat
				   as identity */

	default:
	return FALSE;		/* should never happen */
	}
}
