/*  PUTSD.C - write out the (source dialect) dictionary for analysis
 ***************************************************************************
 *
 *  int writeAmpleDictionary(pszFilename_in, pAmpleData_in)
 *  const char * pszFilename_in;
 *  AmpleData *	 pAmpleData_in;
 *
 ***************************************************************************
 * Copyright 1997, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <time.h>
#include "ample.h"
#include "ampledef.h"

/* local functions */
static void write_allomorph P((FILE *		pDictFP_in,
				   AmpleAllomorph *	pAllo_in,
				   int		bIsCap_in,
				   TextControl *	pTextCtl_in));

/*****************************************************************************
 * NAME
 *    write_allomorph
 * DESCRIPTION
 *    write the allomorph string to the output dictionary file, restoring any
 *    capitalization removed earlier on input
 * RETURN VALUE
 *    none
 */
static void write_allomorph(pDictFP_in, pAllo_in, bIsCap_in, pTextCtl_in)
FILE *			pDictFP_in;
AmpleAllomorph *	pAllo_in;
int			bIsCap_in;
TextControl *		pTextCtl_in;
{
char *	p;
int	c = NUL;
int	iLength;

if (bIsCap_in)
	{
	for ( p = pAllo_in->pszAllomorph ; *p ; )
	{
	iLength = matchLowercaseChar((unsigned char *)p, pTextCtl_in);
	if (iLength != 0)
		{
		fprintf(pDictFP_in, "%s",
			convLowerToUpper((unsigned char *)p, pTextCtl_in));
		fprintf(pDictFP_in, "%s", p + iLength);
		break;
		}
	iLength = matchAlphaChar((unsigned char *)p, pTextCtl_in);
	if (iLength == 0)
		iLength = 1;
	while (iLength)
		{
		c = *p++ & 0377;
		fputc(c, pDictFP_in);
		--iLength;
		}
	}
	}
else
	fprintf(pDictFP_in, "%s", pAllo_in->pszAllomorph);
}

/*****************************************************************************
 * NAME
 *    writeAmpleDictionary
 * DESCRIPTION
 *    write the dictionary stored in memory to the given file
 * RETURN VALUE
 *    none
 */
void writeAmpleDictionary(pszFilename_in, pAmple_in)
const char *	pszFilename_in;
AmpleData *	pAmple_in;
{
time_t			uiTime;
AmpleMorpheme *		pMorph;
FILE *			pDictFP;
unsigned long		uiCount;
unsigned char *		pFromCats = NULL;
unsigned char *		pToCats   = NULL;
AmpleRootInfo *		pRoot;
AmpleAffixInfo *	pAffix;
AmpleInfixInfo *	pInfix;
AmpleAllomorph *	pAllo;
int			iOrder = 0;
#ifndef hab360
int			iOrderMax = 0;
#endif
int			iFromCat;
int			iToCat;
unsigned short *	pBigProp;
unsigned char *		pProp;
int			bMorphProp;
AmpleMorphConstraint *	pConstraint;
/*
 *  check for valid arguments
 */
if ((pszFilename_in == NULL) || (pAmple_in == NULL))
	return;
pDictFP = fopen(pszFilename_in, "w");
if (pDictFP == NULL)
	{
	reportError(ERROR_MSG,
		"Cannot open dictionary file %s for output\n", pszFilename_in);
	return;
	}
uiTime = time(NULL);
fprintf(pDictFP, "\\id %s - written by AMPLE %d.%d%c%d on %s",
	pszFilename_in, iAmpleVersion_g, iAmpleRevision_g, cAmplePatchSep_g,
	iAmplePatchlevel_g, ctime(&uiTime));

for (	pMorph = pAmple_in->pAmpleMorphemes, uiCount = 1 ;
	pMorph ;
	pMorph = pMorph->pLink, ++uiCount )
	{
	fprintf(pDictFP, "\n\\lx %lu\n", uiCount);
	/*
	 *  write the "morphname" field
	 */
	fprintf(pDictFP, "\\mn ");
	if (pMorph->iMorphType & RSC)
	fprintf(pDictFP, "*");
	if (	(pMorph->pszMorphName != NULL) &&
		(pMorph->pszMorphName[0] != NUL) )
	fprintf(pDictFP, "%s", pMorph->pszMorphName);
	else if ((pMorph->pszUnderForm != NULL) &&
		 (pMorph->pszUnderForm[0] != NUL))
	fprintf(pDictFP, "%s", pMorph->pszUnderForm);
	else if ((pMorph->pAllomorphs != NULL) &&
		 (pMorph->pAllomorphs->pszAllomorph != NULL))
	{
	write_allomorph(pDictFP, pMorph->pAllomorphs,
			pMorph->iMorphType & ISCAPS,
			&(pAmple_in->sTextCtl));
	}
	fprintf(pDictFP, "\n");
	/*
	 *  write the "type" field
	 */
	fprintf(pDictFP, "\\entryType");
	if (pMorph->iMorphType & AMPLE_PFX)
	fprintf(pDictFP, " prefix");
	if (pMorph->iMorphType & AMPLE_IFX)
	fprintf(pDictFP, " infix");
	if (pMorph->iMorphType & AMPLE_ROOT)
	fprintf(pDictFP, " root");
	if (pMorph->iMorphType & AMPLE_SFX)
	fprintf(pDictFP, " suffix");
	fprintf(pDictFP, "\n");
	/*
	 *  write the "underlying form" field
	 */
	if (pMorph->pszUnderForm != NULL)
	fprintf(pDictFP, "\\uf %s\n", pMorph->pszUnderForm);
	/*
	 *  write the "feature descriptors" field
	 */
	if (pMorph->pszMorphFd != NULL)
	fprintf(pDictFP, "\\fd %s\n", pMorph->pszMorphFd);

	if (pMorph->iMorphType & (AMPLE_PFX | AMPLE_SFX))
	{
	pAffix = pMorph->u.pAffix;
	if (pAffix != NULL)
		{
		pFromCats = pAffix->pFromCategories;
		pToCats   = pAffix->pToCategories;
		iOrder    = pAffix->iOrderClass;
#ifndef hab360
		iOrderMax = pAffix->iOrderClassMax;
#endif
		}
	else
		{
		pFromCats = NULL;
		pToCats   = NULL;
		iOrder    = 0;
#ifndef hab360
		iOrderMax    = 0;
#endif
		}
	}
	if (pMorph->iMorphType & AMPLE_IFX)
	{
	pInfix = pMorph->u.pInfix;
	if (pInfix != NULL)
		{
		pFromCats = pInfix->pFromCategories;
		pToCats   = pInfix->pToCategories;
		iOrder    = pInfix->iOrderClass;
#ifndef hab360
		iOrderMax = pInfix->iOrderClassMax;
#endif
		/*
		 *  write the infix "location" field
		 */
		fprintf(pDictFP, "\\loc");
		if (pInfix->iInfixLoc & AMPLE_PFX)
		fprintf(pDictFP, " prefix");
		if (pInfix->iInfixLoc & AMPLE_ROOT)
		fprintf(pDictFP, " root");
		if (pInfix->iInfixLoc & AMPLE_SFX)
		fprintf(pDictFP, " suffix");
		writeAmpleEnvConstraint(pDictFP, pInfix->pInfixEnv, FALSE);
		fprintf(pDictFP, "\n");
		}
	else
		{
		pFromCats = NULL;
		pToCats   = NULL;
		iOrder    = 0;
#ifndef hab360
		iOrderMax = 0;
#endif
		}
	}
	if (pMorph->iMorphType & (AMPLE_PFX | AMPLE_IFX | AMPLE_SFX))
	{
	/*
	 *  write the affix "category pairs" field
	 */
	if ((pFromCats != NULL) && (pToCats != NULL))
		{
		fprintf(pDictFP, "\\c ");
		for ( ; *pFromCats && *pToCats ; ++pFromCats, ++pToCats )
		{
		iFromCat = *pFromCats;
		iToCat   = *pToCats;
		fprintf(pDictFP, " %s/%s",
			findAmpleCategoryName(iFromCat,
						  pAmple_in->pCategories),
			findAmpleCategoryName(iToCat,
						  pAmple_in->pCategories));
		}
		fprintf(pDictFP, "\n");
		}
	/*
	 *  write the "order class" field
	 */
	if (iOrder != 0)
	if (iOrder != 0)
#ifdef hab360
		fprintf(pDictFP, "\\o  %d\n", iOrder);
#else
		fprintf(pDictFP, "\\o  %d %d\n", iOrder, iOrderMax);
#endif
	}
	if (pMorph->iMorphType & AMPLE_ROOT)
	{
	if (pAmple_in->bRootGlosses)
		{
		pRoot = pMorph->u.pRoot;
		if (pRoot != NULL)
		{
		pToCats = pRoot->pRootCategories;
		/*
		 *  write the "root gloss" field
		 */
		if (pRoot->pszRootGloss != NULL)
			fprintf(pDictFP, "\\g  %s\n", pRoot->pszRootGloss);
		}
		else
		pToCats = NULL;
		}
	else
		pToCats = pMorph->u.pRootCategories;
	/*
	 *  write the root "category" field
	 */
	if (pToCats != NULL)
		{
		fprintf(pDictFP, "\\c ");
		for ( ; *pToCats ; ++pToCats )
		{
		iToCat = *pToCats;
		fprintf(pDictFP, " %s",
			findAmpleCategoryName(iToCat,
						  pAmple_in->pCategories));
		}
		fprintf(pDictFP, "\n");
		}
	}
	/*
	 *  write the "morpheme properties" field
	 */
	if (pMorph->pAllomorphs && pMorph->pAllomorphs->sPropertySet.pProperties)
	{
	bMorphProp = FALSE;
	if (pAmple_in->sProperties.uiMaxProperty > 255)
		{
		for ( pBigProp = pMorph->pAllomorphs->sPropertySet.pBigProperties ;
		  *pBigProp ;
		  ++pBigProp )
		{
		if (isAmpleMorphemeProperty(*pBigProp,&pAmple_in->sProperties))
			{
			if (bMorphProp == FALSE)
			{
			bMorphProp = TRUE;
			fprintf(pDictFP, "\\mp");
			}
			fprintf(pDictFP, " %s",
				findAmplePropertyName(*pBigProp,
						  &pAmple_in->sProperties));
			}
		}
		}
	else
		{
		for ( pProp = pMorph->pAllomorphs->sPropertySet.pProperties ;
		  *pProp ;
		  ++pProp )
		{
		if (isAmpleMorphemeProperty(*pProp, &pAmple_in->sProperties))
			{
			if (bMorphProp == FALSE)
			{
			bMorphProp = TRUE;
			fprintf(pDictFP, "\\mp");
			}
			fprintf(pDictFP, " %s",
				findAmplePropertyName(*pProp,
						  &pAmple_in->sProperties));
			}
		}
		}
	if (bMorphProp)
		fprintf(pDictFP, "\n");
	}
	/*
	 *  write the "allomorph" fields
	 */
	for ( pAllo = pMorph->pAllomorphs ; pAllo ; pAllo = pAllo->pNextAllomorph )
	{
	if (pAllo->iAllomorphFlags & ELSEWHERE)
		fprintf(pDictFP, "\\e  ");
	else
		fprintf(pDictFP, "\\a  ");
	if ((pAllo->pszAllomorph != NULL) && (pAllo->pszAllomorph[0] != NUL))
		write_allomorph(pDictFP, pAllo, pMorph->iMorphType & ISCAPS,
				&(pAmple_in->sTextCtl));
	else
		fprintf(pDictFP, "0");
	if (pAllo->pszAllomorphID != NULL)
		fprintf(pDictFP, " {%s}", pAllo->pszAllomorphID);
	if (pAmple_in->sProperties.uiMaxProperty > 255)
		{
		for (   pBigProp = pAllo->sPropertySet.pBigProperties ;
			pBigProp && *pBigProp ;
			++pBigProp )
		{
		if (isAmpleAllomorphProperty(*pBigProp,
						 &pAmple_in->sProperties))
			fprintf(pDictFP, " %s",
				findAmplePropertyName(*pBigProp,
						  &pAmple_in->sProperties));
		}
		}
	else
		{
		for (   pProp = pAllo->sPropertySet.pProperties ;
			pProp && *pProp ;
			++pProp )
		{
		if (isAmpleAllomorphProperty(*pProp, &pAmple_in->sProperties))
			fprintf(pDictFP, " %s",
				findAmplePropertyName(*pProp,
						  &pAmple_in->sProperties));
		}
		}
	if (pAllo->pEnvironment != NULL)
		{
		writeAmpleEnvConstraint(pDictFP,
					pAllo->pEnvironment->pStringCond, FALSE);
#ifndef hab380
		writeAmpleEnvConstraint(pDictFP,
					pAllo->pEnvironment->pNegStringCond, FALSE);
#endif /* hab380 */
		writeAmpleEnvConstraint(pDictFP,
					pAllo->pEnvironment->pMorphCond, FALSE);
		}
	fprintf(pDictFP, "\n");
	}
	/*
	 *  write the "morpheme co-occurrence constraint" fields
	 */
	for (   pConstraint = pMorph->pMorphConstraints ;
		pConstraint ;
		pConstraint = pConstraint->pNext )
	{
	fprintf(pDictFP, "\\mcc ");
	writeAmpleMorphConstraint(pConstraint, pDictFP, FALSE);
	fprintf(pDictFP, "\n");
	}
	}
fclose(pDictFP);
}
