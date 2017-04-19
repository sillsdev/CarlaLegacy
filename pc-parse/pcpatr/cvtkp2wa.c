/* CVTKP2WA.C - convert PC-Kimmo/PC-PATR output to WordAnalysis list
 ***************************************************************************
 *
 * WordAnalysis * convertKimmoPATRToWordAnalyses(
 *					KimmoResult *  pKimmoResult_in,
 *					StringList *   pCategoryPath_in,
 *					WordAnalysis * pAnalyses_io,
 *					unsigned *     puiAmbiguityCount_io,
 *					PATRData *     pPATR_in)
 *
 ***************************************************************************
 * Copyright 1997, 2000 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
#include "kimmo.h"

static char *	buildFeatureString P((PATRFeature *      pFeature,
					  KimmoData *        pLang_in,
					  PATRLabeledFeature * pFdDefinitions_in,
					  PATRData *         pPATR_in));
static char *	buildCategoryString P((PATRFeature * pFeature_in,
					   StringList *  pCategoryPath_in,
					   PATRData * pPATR_in));
static int	duplicate_analysis P((WordAnalysis * pAnalyses_in,
					  char *         pszAnal_in,
					  char *         pszDecomp_in,
					  char *         pszFeat_in,
					  char *         pszCat_in));

/*****************************************************************************
 * NAME
 *    buildFeatureString
 * DESCRIPTION
 *    build a feature string from the features associated with this result
 * RETURN VALUE
 *    pointer to the new string (which may be empty)
 */
static char * buildFeatureString(pFeature_in, pKimmo_in, pFdDefinitions_in,
				 pPATR_in)
PATRFeature *		pFeature_in;
KimmoData *		pKimmo_in;
PATRLabeledFeature *	pFdDefinitions_in;
PATRData *              pPATR_in;
{
PATRFeature *		pFeature;
char *			pszFeatures;
size_t		uiFeaturesLength;
size_t		uiTotalLength;
size_t		uiLength;
PATRLabeledFeature *	pFdDef;
char *			psz0;

if (pFeature_in == NULL)
	return NULL;
uiTotalLength = 100;
pszFeatures = (char *)allocMemory(100);
memset(pszFeatures, '\0', 100);
uiFeaturesLength = 0;
psz0 = storedPATRString("0", pPATR_in);
pFeature = findPATRAttribute(pFeature_in, psz0);
if (pFeature == (PATRFeature *)NULL)
	return( pszFeatures );

for ( pFdDef = pFdDefinitions_in ; pFdDef ; pFdDef = pFdDef->pNext )
	{
#ifndef hab130v
	if (subsumesPATRFeature(pFdDef->pFeature, pFeature, (char **)NULL))
#else  /* hab130v */
	if (subsumesPATRFeature(pFdDef->pFeature, pFeature))
#endif /* hab130v */
	{
	uiLength = strlen(pFdDef->pszLabel);
	if (uiFeaturesLength + uiLength + 2 > uiTotalLength)
		{
		uiTotalLength = uiFeaturesLength + uiLength + 2;
		pszFeatures = (char *)reallocMemory(pszFeatures,
						uiTotalLength);
		}
	if (uiFeaturesLength != 0)
		{
		strcat(pszFeatures, " ");
		++uiFeaturesLength;
		}
	strcat(pszFeatures, pFdDef->pszLabel);
	uiFeaturesLength += uiLength;
	}
	}
return( pszFeatures );
}

/*****************************************************************************
 * NAME
 *    buildCategoryString
 * DESCRIPTION
 *    build a category string from the features associated with this result
 * RETURN VALUE
 *    pointer to the new string
 */
static char * buildCategoryString(pFeature_in, pCategoryPath_in, pPATR_in)
PATRFeature *	pFeature_in;
StringList *	pCategoryPath_in;
PATRData *      pPATR_in;
{
PATRFeature *	fnp;
char *		pszCat;
char *		psz0;

if (pCategoryPath_in == NULL)
	{
	pszCat = "";
	}
else
	{
	psz0 = storedPATRString("0", pPATR_in);
	fnp = findPATRAttribute(pFeature_in, psz0);
	fnp = followPATRFeaturePath( fnp, pCategoryPath_in );
	if (fnp == (PATRFeature *)NULL)
	pszCat = "";
	else
	{
	if ((fnp->eType == PATR_ATOM) || (fnp->eType == PATR_DEFATOM))
		pszCat = fnp->u.pszAtom;
	else
		pszCat = "***";
	}
	}
return( duplicateString(pszCat) );
}

/****************************************************************************
 * NAME
 *    duplicate_analysis
 * ARGUMENTS
 *    pAnal_in - pointer to AMPLE/STAMP word analysis structure
 * DESCRIPTION
 *    Check whether or not this PC-KIMMO result has been stored yet.
 * RETURN VALUE
 *    zero if result isn't yet on the list, nonzero if it is
 */
static int duplicate_analysis(pAnal_in, pszAnal, pszDecomp, pszFeat, pszCat)
WordAnalysis *		pAnal_in;
char *			pszAnal;
char *			pszDecomp;
char *			pszFeat;
char *			pszCat;
{
WordAnalysis *	pAnal;

for ( pAnal = pAnal_in ; pAnal ; pAnal = pAnal->pNext )
	{
	if (    (pAnal->pszAnalysis != NULL) &&
		(strcmp(pAnal->pszAnalysis, pszAnal) == 0) &&
		(pAnal->pszDecomposition != NULL) &&
		(strcmp(pAnal->pszDecomposition, pszDecomp) == 0) &&
		(pAnal->pszFeatures != NULL) &&
		(strcmp(pAnal->pszFeatures, pszFeat) == 0) &&
		(pAnal->pszCategory != NULL) &&
		(strcmp(pAnal->pszCategory, pszCat) == 0) )
	return 1;
	if (pAnal->pszCategory == NULL)
	return 1;
	}
return( 0 );			/* this analysis is uniquely original */
}

/*****************************************************************************
 * NAME
 *    convertKimmoPATRToWordAnalyses
 * DESCRIPTION
 *    convert the KimmoResult list for output via writeTemplate()
 * RETURN VALUE
 *    list of WordAnalysis structures
 */
WordAnalysis * convertKimmoPATRToWordAnalyses(pKimmoResult_in, pKimmo_in,
						  pCategoryPath_in, cDecomp_in,
						  pFdDefinitions_in,
						  pAnalyses_io, puiAmbiguity_io,
						  pPATR_in)
KimmoResult *	pKimmoResult_in;
KimmoData *	pKimmo_in;
StringList *	pCategoryPath_in;
int		cDecomp_in;
PATRLabeledFeature *	pFdDefinitions_in;
WordAnalysis *	pAnalyses_io;
unsigned *	puiAmbiguity_io;
PATRData *      pPATR_in;
{
KimmoResult *	rp;
WordAnalysis *	pAnal;
unsigned	uiAmbiguityCount;
PATREdgeList *	elp;
char *		pszAnalysis = NULL;
char *		pszDecomposition = NULL;
char *		pszFeatures;
char *		pszCategory;
char		szDecompChar[2];

szDecompChar[0] = cDecomp_in;
szDecompChar[1] = '\0';
if (puiAmbiguity_io != NULL)
	uiAmbiguityCount = *puiAmbiguity_io;
else
	uiAmbiguityCount = 0;
/*
 *  convert the KimmoResult list for output via writeTemplate()
 */
for ( rp = pKimmoResult_in ; rp ; rp = rp->pNext )
	{
	/*
	 *  create the analysis and decomposition strings
	 */
	pszAnalysis      = (char *)concatKimmoMorphGlosses(rp->pAnalysis, " ",
							   pKimmo_in);
	pszDecomposition = (char *)concatKimmoMorphLexemes(rp->pAnalysis,
							   szDecompChar,
							   pKimmo_in);
	for ( elp = rp->pParseChart ; elp ; elp = elp->pNext )
	{
	++uiAmbiguityCount;
	/*
	 *  create the feature set string and category string
	 *  for this analysis
	 */
	if (elp->pEdge->pFeature == NULL)
		/*
		 *  concatenate the feature names from all of the morphemes in
		 *  the word
		 */
		pszFeatures = (char *)concatKimmoMorphFeatures(rp->pAnalysis,
							   "   ", pKimmo_in);
	else
		pszFeatures = buildFeatureString(elp->pEdge->pFeature,
						 pKimmo_in, pFdDefinitions_in,
						 pPATR_in);
	pszCategory = buildCategoryString(elp->pEdge->pFeature,
					  pCategoryPath_in, pPATR_in);
	/*
	 *  check for duplicate analyses
	 */
	if (duplicate_analysis(pAnalyses_io, pszAnalysis, pszDecomposition,
				   pszFeatures, pszCategory))
		{
		--uiAmbiguityCount;
		freeMemory(pszFeatures);
		freeMemory(pszCategory);
		continue;
		}
	pAnal = (WordAnalysis *)allocMemory(sizeof(WordAnalysis));
	pAnal->pszAnalysis       = duplicateString(pszAnalysis);
	pAnal->pszDecomposition  = duplicateString(pszDecomposition);
	pAnal->pszCategory       = pszCategory;
	pAnal->pszProperties     = NULL;
	pAnal->pszFeatures       = pszFeatures;
	pAnal->pszUnderlyingForm = NULL;
	pAnal->pszSurfaceForm    = NULL;
	pAnal->pNext             = pAnalyses_io;
	pAnalyses_io             = pAnal;
	}
	if (rp->pParseChart == (PATREdgeList *)NULL)
	{
	/*
	 *  handle the case when a grammar isn't used
	 */
	++uiAmbiguityCount;
	/*
	 *  create the feature set string for this analysis
	 */
	pszFeatures = (char *)concatKimmoMorphFeatures(rp->pAnalysis,
							   "   ", pKimmo_in);
	if (duplicate_analysis(pAnalyses_io, pszAnalysis, pszDecomposition,
				   pszFeatures, (char *)NULL))
		{
		--uiAmbiguityCount;
		freeMemory(pszFeatures);
		freeMemory(pszAnalysis);
		freeMemory(pszDecomposition);
		}
	else
		{
		pAnal = (WordAnalysis *)allocMemory(sizeof(WordAnalysis));
		pAnal->pszAnalysis       = pszAnalysis;
		pAnal->pszDecomposition  = pszDecomposition;
		pAnal->pszFeatures       = pszFeatures;
		pAnal->pszCategory       = NULL;
		pAnal->pszProperties     = NULL;
		pAnal->pszUnderlyingForm = NULL;
		pAnal->pszSurfaceForm    = NULL;
		pAnal->pNext             = pAnalyses_io;
		pAnalyses_io             = pAnal;
		}
	}
	else
	{
	/* don't leak memory! */
	freeMemory(pszAnalysis);
	freeMemory(pszDecomposition);
	}
	}
if (puiAmbiguity_io != NULL)
	*puiAmbiguity_io = uiAmbiguityCount;
return pAnalyses_io;
}
