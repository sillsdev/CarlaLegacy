/* PATRKIMM.C - prepare Kimmo output for PATR input
 ***************************************************************************
 *
 * PATRWord * buildPATRWordForKimmo(char *           pszLex_in,
 *				    char *           pszGloss_in,
 *				    char *           pszCat_in,
 *				    unsigned short * puiFeatIndexes_in,
 *				    char **          ppszFeatures_in,
 *				    PATRData *       pPATR_in)
 *
 ***************************************************************************
 * Copyright 1997, 2000 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
#include "kimmo.h"

static char *	convert_features P((unsigned short * puiIndex_in,
					char **          ppszFeatures_in));

/****************************************************************************
 * NAME
 *    convert_features
 * DESCRIPTION
 *    Convert index[] to string of features separated by '='
 * RETURN VALUE
 *    Pointer to the feature string
 */
static char *convert_features( index, ppszFeatures_in )
unsigned short *	index;
char **			ppszFeatures_in;
{
int resultsize = 0, featsize, i;
char *featresult = NULL, *feat;

if (index[0] == 0)
	return( (char *)NULL );
for ( i = 0 ; index[i] != 0 ; i++ )
	{
	feat = ppszFeatures_in[index[i]-1];
	featsize = strlen(feat);
	resultsize += featsize + 1;
	if (featresult == (char *)NULL)
	featresult = duplicateString(feat);
	else
	{
	featresult = (char *)reallocMemory( featresult, resultsize );
	strcat(strcat(featresult, "="), feat);
	}
	}
return(featresult);
}

/*****************************************************************************
 * NAME
 *    buildPATRWordForKimmo
 * DESCRIPTION
 *    convert the Kimmo morpheme information to the format needed for a PATR
 *    parse
 * RETURN VALUE
 *    pointer to a PATRWord data structure containing the morpheme information
 */
PATRWord * buildPATRWordForKimmo(pszLex_in, pszGloss_in, pszCat_in,
				 puiFeatIndexes_in, ppszFeatures_in, pPATR_in)
char *			pszLex_in;
char *			pszGloss_in;
char *			pszCat_in;
unsigned short *	puiFeatIndexes_in;
char **			ppszFeatures_in;
PATRData *		pPATR_in;
{
char *	lex;
char *	gloss;
char *	cat;
PATRWord *pNewMorph;                /* Sentence Word to add it to */
PATRWordCategory *pMorphCat;                /* Temp word pointer */
PATRFeature *tfeat;
PATRFeatureDisjunction *tfeatd;
int wordnum = 1;
char *		fd;
char *		pszCatFeatName;
char *		pszLexFeatName;
char *		pszGlossFeatName;
PATRDefinition *	pDef;
int			i;

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
if (puiFeatIndexes_in[0] == 0)			/* Store fd's */
	tfeatd = buildPATRFeatureDisjunction("", tfeatd,
					 TRUE, stderr,
					 pPATR_in);
else
	{
	fd = convert_features(puiFeatIndexes_in, ppszFeatures_in);
	tfeatd = buildPATRFeatureDisjunction(fd, tfeatd,
					 TRUE, stderr,
					 pPATR_in);
	freeMemory(fd);
	}
/*
 *  check for lexical rules
 */
for ( i = 0 ; puiFeatIndexes_in && puiFeatIndexes_in[i] ; ++i )
	{
	pDef = findPATRDefinition(
			   ppszFeatures_in[puiFeatIndexes_in[i]-1],
			   pPATR_in->pGrammar);
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
		fprintf(stdout, "Applying Lexical Rule \"%s\"\n",
			ppszFeatures_in[puiFeatIndexes_in[i]-1]);
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
	}
/*
 *  Add fd's to word
 */
addPATRFeatureToWord(tfeatd, pMorphCat, pPATR_in);

return pNewMorph;
}
