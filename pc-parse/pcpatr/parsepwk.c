/* PARSEPWK.C - parse a word with PC-Kimmo for PC-PATR to add to the lexicon
 ***************************************************************************
 *
 * PATRLexItem * parseWithKimmoForPATRLexicon(char *      pszWord_in,
 *					      KimmoData * pLang_in,
 *					      PATRData *  pPATR_in)
 *
 ***************************************************************************
 * Copyright 1997, 2000 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
#include "kimmo.h"
#include "rpterror.h"	/* for NumberedMessage and displayNumberedMessage() */
#include "cmd.h"	/* temp fix */

static const NumberedMessage sMapKimmoFeaturesUndefined_m = { ERROR_MSG, 330,
	"The MapKimmoFeatures lexical rule is not defined" };

/*****************************************************************************
 * NAME
 *    parseWithKimmoForPATRLexicon
 * DESCRIPTION
 *    Parse the word using the PC-Kimmo rules, lexicon, and grammar previously
 *    loaded into memory.
 * RETURN VALUE
 *    pointer to node in lexicon containing the newly parsed word, or NULL if
 *    it doesn't parse
 */
PATRLexItem * parseWithKimmoForPATRLexicon(pszWord_in, pLang_in, pPATR_in)
char *		pszWord_in;	/* pointer to word we want to parse */
KimmoData *	pLang_in;
PATRData *	pPATR_in;
{
KimmoResult *rresp, *rp;
PATRLexItem *plip;
PATREdgeList *elp;
PATRFeature *fnp, *features, *kimmo_features;
PATRComplexFeature *flp;
char *	pszCatFeatName;
char *	pszLexFeatName;
char *	psz0;
PATRDefinition *	pDef;
char *	pszMorphGlosses = NULL;	/* composite gloss returned by PC-KIMMO */
char *	pszMorphLexes = NULL;	/* composite lex returned by PC-KIMMO */

pLang_in->sPATR.bFailure        = FALSE;
pLang_in->sPATR.bUnification    = TRUE;
pLang_in->sPATR.eTreeDisplay    = pPATR_in->eTreeDisplay;	/*don't care*/
pLang_in->sPATR.bGloss          = pPATR_in->bGloss;		/*don't care*/
/*pLang_in->sPATR.bGlossesExist   = pPATR_in->bGlossesExist;*/	/*don't care*/
pLang_in->sPATR.iFeatureDisplay = pPATR_in->iFeatureDisplay;	/*don't care*/
pLang_in->sPATR.iMaxAmbiguities = pPATR_in->iMaxAmbiguities;	/*don't care*/
pLang_in->sPATR.pLogFP          = pPATR_in->pLogFP;

if (pPATR_in->pLexicon == NULL)
	{
	pPATR_in->pLexicon = (PATRLexicon *)allocMemory(sizeof(PATRLexicon));
	memset(pPATR_in->pLexicon, 0, sizeof(PATRLexicon));
	}

rresp = applyKimmoRecognizer((unsigned char *)pszWord_in, pLang_in);
if (rresp == (KimmoResult *)NULL)
	return( (PATRLexItem *)NULL );

if (pPATR_in->pGrammar != NULL)
	{
	pszCatFeatName   = pPATR_in->pGrammar->pszCatFeatName;
	pszLexFeatName   = pPATR_in->pGrammar->pszLexFeatName;
	}
else
	{
	pszCatFeatName   = storedPATRString( "cat", pPATR_in);
	pszLexFeatName   = storedPATRString( "lex", pPATR_in);
	}
psz0 = storedPATRString( "0", pPATR_in);
for ( rp = rresp ; rp != (KimmoResult *)NULL ; rp = rp->pNext )
	{
	if ((rp->pAnalysis != NULL) && (rp->pParseChart != NULL))
	{
	pszMorphGlosses = (char *)concatKimmoMorphGlosses(rp->pAnalysis,
								"", pLang_in);
	pszMorphLexes   = (char *)concatKimmoMorphLexemes(rp->pAnalysis,
								"", pLang_in);
	for ( elp = rp->pParseChart ; elp ; elp = elp->pNext )
		{
		kimmo_features = findPATRAttribute(elp->pEdge->pFeature, psz0);
		if (kimmo_features != (PATRFeature *)NULL)
		{
		/*
		 *  convert the features produced by the PC-Kimmo word parse
		 *  into the features we want for the sentence parse
		 */
		features = NULL;
		if (kimmo_features->eType != PATR_COMPLEX)
			reportError(DEBUG_MSG,
				"kimmo_features->type = %d != COMPLEX\n",
				kimmo_features->eType );
		else
			{
			pDef = findPATRDefinition("MapKimmoFeatures",
						  pPATR_in->pGrammar);
			if ((pDef != NULL) && (pDef->eType == PATR_LEXICAL_RULE))
			{
			if (pPATR_in->iDebugLevel >= 5)
				{
				fprintf(stdout,
				   "Applying Lexical Rule \"MapKimmoFeatures\"\n");
				}
			features = applyPATRLexicalRule(pDef->u.pLexRule,
							createPATRNullFeature(
									 pPATR_in),
							kimmo_features,
							pPATR_in);
			features = storePATRFeature( features, pPATR_in );
			}
			else
			{
			displayNumberedMessage(&sMapKimmoFeaturesUndefined_m,
						   pPATR_in->bSilent,
						   pPATR_in->bShowWarnings,
						   pPATR_in->pLogFP,
						   NULL, 0);
			features = storePATRFeature(kimmo_features, pPATR_in);
			}
			}
		/*
		 *  make sure we have a "cat" feature
		 */
		fnp = findPATRAttribute(features, pszCatFeatName);
		if (fnp == (PATRFeature *)NULL)
			{
			freePATRFeature(features, pPATR_in);
			continue;
			}
		/*
		 *  set the "lex" feature if it is not already set
		 */
		fnp = findPATRAttribute(features, pszLexFeatName);
		if (fnp == (PATRFeature *)NULL)
			{
			flp = (PATRComplexFeature *)allocMemory(
						  sizeof(PATRComplexFeature));
			flp->pszLabel = pszLexFeatName;
			flp->pValue = (PATRFeature *)allocMemory(
							 sizeof(PATRFeature));
			flp->pValue->eType = PATR_ATOM;
			flp->pValue->u.pszAtom = storedPATRString(pszWord_in,
								  pPATR_in);
			flp->pNext = features->u.pComplex;
			features->u.pComplex = flp;
			}
#ifdef hab130
		addPATRLexItem(pszWord_in, NULL, NULL, NULL, features,
				   pPATR_in);
#else  /* hab130 */
		addPATRLexItem(pszWord_in, NULL, NULL, NULL, NULL, features,
				   pPATR_in);
#endif /* hab130 */
		}
		}
	freeMemory(pszMorphGlosses);
	freeMemory(pszMorphLexes);
	pszMorphGlosses = NULL;
	pszMorphLexes   = NULL;
	}
	}
freeKimmoResult( rresp, pLang_in );

for (	plip = (PATRLexItem *)findDataInTrie(pPATR_in->pLexicon->pStorage,
						 pszWord_in) ;
	plip ;
	plip = plip->pNext )
	{
	if (strcmp(pszWord_in, (char *)plip->pszLexString) == 0)
	break;
	}
return( plip );
}
