/* AMPLPATR.C - prepare AMPLE output for PATR input
 ***************************************************************************
 *
 * PATRWord * buildPATRWord(char *        pszLex_in,
 *			    char *        pszGloss_in,
 *			    char *        pszCat_in,
 *			    char *        pszFeatures_in,
 *			    PATRFeature * pPATRFeature_in,
 *			    PATRData *    pPATR_in)
 *
 ***************************************************************************
 * Copyright 1998, 2000 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"

/*****************************************************************************
 * NAME
 *    buildPATRWord
 * DESCRIPTION
 *    convert the AMPLE information to the format needed for a PATR parse
 * RETURN VALUE
 *    pointer to a PATRWord data structure containing the morpheme information
 */
PATRWord * buildPATRWord(pszLex_in, pszGloss_in, pszCat_in, pszFeatures_in,
			 pPATRFeature_in, pPATR_in)
char *		pszLex_in;
char *		pszGloss_in;
char *		pszCat_in;
char *		pszFeatures_in;
PATRFeature *	pPATRFeature_in;
PATRData *	pPATR_in;
{
char *			lex;
char *			gloss;
char *			cat;
PATRWord *		pNewMorph;
PATRWordCategory *	pMorphCat;
PATRFeature *		tfeat;
PATRFeatureDisjunction *tfeatd;
int			wordnum = 1;
char *			pszCatFeatName;
char *			pszLexFeatName;
char *			pszGlossFeatName;
char *			pszName;
char *			p;
char			cSave;
PATRDefinition *	pDef;

lex   = pszLex_in;
gloss = pszGloss_in;
if (gloss == (char *)NULL)
	gloss = "";
cat   = pszCat_in;
if (pPATR_in->pGrammar != NULL)
	{
	pszCatFeatName   = pPATR_in->pGrammar->pszCatFeatName;
	pszLexFeatName   = pPATR_in->pGrammar->pszLexFeatName;
	pszGlossFeatName = pPATR_in->pGrammar->pszGlossFeatName;
	}
else
	{
	pszCatFeatName   = storedPATRString( "cat", pPATR_in);
	pszLexFeatName   = storedPATRString( "lex", pPATR_in);
	pszGlossFeatName = storedPATRString( "gloss", pPATR_in);
	}

pNewMorph = allocPATRWord(pPATR_in);
pNewMorph->iWordNumber  = wordnum++;		/* Put in next word number */
pNewMorph->pNext = NULL;			/* Link stays null on last */

pNewMorph->pszWordName = allocPATRStringCopy( lex, pPATR_in );
							/* Allocate word */
pNewMorph->pCategories = pMorphCat = allocPATRWordCategory(pPATR_in);
pMorphCat->pszCategory  = allocPATRStringCopy( cat, pPATR_in );
pMorphCat->pFeature     = createPATRNullFeature(pPATR_in); /* clear feature */
pMorphCat->bUsed        = FALSE;		/* Clear word used flag */
pMorphCat->iAmbigNumber = 1;			/* Clear ambiguity number */
pMorphCat->pNext        = NULL;			/* Clear word link */
tfeat = allocPATRFeature(pPATR_in);		/* make Category atom */
tfeat->eType     = PATR_DEFATOM;		/* Make it default */
tfeat->u.pszAtom = storedPATRString( cat, pPATR_in);
addPATRFeatureToComplex(pMorphCat->pFeature,
			createPATRComplexFeature(pszCatFeatName, tfeat,
						 pPATR_in));
addPATRFeatureToComplex(pMorphCat->pFeature,
			createPATRComplexFeature(pszLexFeatName,
						 createPATRAtomFeature(
							 storedPATRString(lex,
									 pPATR_in),
							 pPATR_in),
						 pPATR_in));
addPATRFeatureToComplex(pMorphCat->pFeature,
			createPATRComplexFeature(pszGlossFeatName,
						 createPATRAtomFeature(
							 storedPATRString(gloss,
									 pPATR_in),
							 pPATR_in),
						 pPATR_in));
/* Store cat as fd */
tfeatd = buildPATRFeatureDisjunction(cat, (PATRFeatureDisjunction *)NULL,
					 FALSE, NULL,
					 pPATR_in);
/* Store fd's */
if ((pszFeatures_in == NULL) || (*pszFeatures_in == NUL))
	tfeatd = buildPATRFeatureDisjunction("", tfeatd,
					 TRUE, stderr,
					 pPATR_in);
else
	tfeatd = buildPATRFeatureDisjunction(pszFeatures_in,
					 tfeatd,
					 TRUE,
					 stderr,
					 pPATR_in);
if (pPATRFeature_in != NULL)
	{
	}
/*
 *  check for lexical rules
 */
pszName = pszFeatures_in + strspn(pszFeatures_in, " \t\r\n\f\v=");
while (*pszName != NUL)
	{
	p = pszName + strcspn(pszName, " \t\r\n\f\v=");
	if (*p != NUL)
	{
	cSave = *p;
	*p = NUL;
	}
	pDef = findPATRDefinition(pszName, pPATR_in->pGrammar);
	if ((pDef != NULL) && (pDef->eType == PATR_LEXICAL_RULE))
	{
	/*
	 *  for each feature in the disjunction, make a copy, apply
	 *  the lexical rule, and add the result to the disjunction
	 */
	PATRFeature *            pNewFeat;
	PATRFeatureDisjunction * pDisj;
	PATRFeatureDisjunction * pNewDisj;
	PATRFeatureDisjunction * pList = tfeatd;
	for ( pDisj = tfeatd ; pDisj ; pDisj = pDisj->pNext )
		{
		if (pPATR_in->iDebugLevel >= 5)
		{
		fprintf(stdout, "Applying Lexical Rule \"%s\"\n", pszName);
		}
		pNewFeat = applyPATRLexicalRule(pDef->u.pLexRule,
						createPATRNullFeature(pPATR_in),
						copyPATRFeature(pDisj->pFeature,
								pPATR_in),
						pPATR_in);
		pNewDisj = createPATRFeatureDisjunction( pNewFeat, pPATR_in );
		pNewDisj->pNext = pList;
		pList = pNewDisj;
		}
	tfeatd = pList;
	}
	pszName = p + strspn(p, " \t\r\n\f\v=");
	}
/*
 *  Add fd's to word
 */
addPATRFeatureToWord(tfeatd, pMorphCat, pPATR_in);

return pNewMorph;
}
