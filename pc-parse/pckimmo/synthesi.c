/* SYNTHESI.C - synthesizer function for PC-KIMMO
 ***************************************************************************
 *
 * KimmoResult * applyKimmoSynthesizer(unsigned char * pszMorphemes_in,
 *				       KimmoData *     pKimmo_in)
 *
 ***************************************************************************
 * Copyright 1995, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern char * strcat  P((char * dest, const char * src));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strchr  P((const char * s, int c));
extern size_t strspn  P((const char * s, const char * accept));
extern char * strpbrk P((const char * s, const char * accept));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "kimmo.h"
#include "kimmodef.h"
/*
 *  local storage of invariant parameters for processing data
 */
static KimmoData *	pSynLang_m;	/* data for the current language */
/*
 *  pSynLang_m->cNull character stored as a string
 */
static char szLangNull_m[2];

static StringList *	pForms_m;	/* list of recomposed forms */
static char whiteSpace[] = " \t\n\v\f\r";	/* same chars as isspace() */

#ifdef applec
#pragma segment S_synthesize
#endif

static StringList *splitAnalysisString P((unsigned char *pszAnalysis));
static void storeForm P((KimmoMorpheme *pLexItems_in));
static void searchForMorphName P((KimmoLexicon *pLexicon_in,
				  char *pszMorphName_in,
				  StringList *pMorphNames_in,
				  KimmoMorpheme *pLexItems_in));
static StringList *getFormsFromLexicon P((StringList *pMorphNames_in,
					  KimmoLexicon *pLexicon_in,
					  KimmoMorpheme *pPreviousItems_in));
static StringList *convertAnalysis P((unsigned char *pszAnalysis));

/*****************************************************************************
 * NAME
 *    splitAnalysisString
 * ARGUMENTS
 *    pszAnalysis - analysis string
 * DESCRIPTION
 *    split the analysis string into its constituent morphnames (glosses)
 * RETURN VALUE
 *    list of morphname strings, or NULL if none found
 */
static StringList *splitAnalysisString(pszAnalysis)
unsigned char *pszAnalysis;
{
unsigned char *		pszNext;
unsigned char *		pszMorph;
unsigned char		chNext;
StringList *	pMorphNames = NULL;
StringList *	pTailMorphNames = NULL;
StringList *	pNewMorphName;

if (pszAnalysis == NULL)
	return NULL;
for ( pszMorph = pszAnalysis ; *pszMorph ; pszMorph = pszNext )
	{
	/*
	 *  isolate the next morphname
	 */
	pszMorph += strspn((char *)pszMorph, (char *)whiteSpace);
	if (*pszMorph == NUL)
	break;
	if (*pszMorph == (unsigned char)pSynLang_m->cGlossBegin)
	{
	pszNext = (unsigned char *)strchr((char *)pszMorph, pSynLang_m->cGlossEnd);
	if (pszNext != NULL)
		++pszNext;
	}
	else
	{
	pszNext = (unsigned char *)strpbrk((char *)pszMorph,
					   (char *)whiteSpace);
	if (pszNext == NULL)
		pszNext = pszMorph + strlen((char *)pszMorph);
	}
	chNext = *pszNext;
	*pszNext = NUL;
	/*
	 *  add this morphname to the end of the list of morphnames
	 */
	pNewMorphName = (StringList *)allocMemory(sizeof(StringList));
	pNewMorphName->pszString  = duplicateString((char *)pszMorph);
	pNewMorphName->pNext = NULL;
	if (pMorphNames == NULL)
	pMorphNames = pNewMorphName;
	else
	pTailMorphNames->pNext = pNewMorphName;
	pTailMorphNames = pNewMorphName;
	*pszNext = chNext;
	pszNext = pszNext + strspn((char *)pszNext, (char *)whiteSpace);
	}
return pMorphNames;
}

/*****************************************************************************
 * NAME
 *    storeForm
 * ARGUMENTS
 *    pLexItems_in
 * DESCRIPTION
 *    convert the list of lexical items (linked in reverse order) into an
 *    underlying form, and add it to the global list pointed to by pForms_m
 * RETURN VALUE
 *    none
 */
static void storeForm(pLexItems_in)
KimmoMorpheme *	pLexItems_in;
{
KimmoMorpheme *	pItem;
KimmoMorpheme *	pMorpheme;
char *		pszUnderlyingForm;
size_t		uiFormLength;
char		szBuffer[64];
PATREdgeList *	pEdges;
/*
 *  add the forward links to the list of morphemes, and calculate the total
 *  length of all the lexical strings
 */
uiFormLength = 1;	/* room for the terminating NUL */
pMorpheme = NULL;
for ( pItem = pLexItems_in ; pItem ; pItem = pItem->pPrevious )
	{
	pItem->pNext = pMorpheme;
	pMorpheme = pItem;
	if (strcmp((char *)pItem->pLexItem->pszLexString, szLangNull_m) != 0)
	uiFormLength += strlen((char *)pItem->pLexItem->pszLexString);
	}
/*
 *  if we have a grammar, verify that this string of morphemes fit together
 */
if (pSynLang_m->bUsePATR && (pSynLang_m->sPATR.pGrammar != NULL))
	{
	pEdges = parseKimmoResultWithPATR(pMorpheme, pSynLang_m);
	if (pEdges == NULL)
	return;			/* synthesis failed grammar test */
	freePATREdgeList(pEdges, &pSynLang_m->sPATR);
	}
/*
 *  build the underlying form for this word from the lexical strings
 */
if (uiFormLength > 64)
	pszUnderlyingForm = (char *)allocMemory(uiFormLength * sizeof(char));
else
	pszUnderlyingForm = szBuffer;
pszUnderlyingForm[0] = NUL;
for ( pItem = pMorpheme ; pItem ; pItem = pItem->pNext )
	{
	if (strcmp((char *)pItem->pLexItem->pszLexString, szLangNull_m) != 0)
	strcat(pszUnderlyingForm, (char *)pItem->pLexItem->pszLexString);
	}
/*
 *  add the underlying form to the list of forms if it isn't already there
 */
pForms_m = mergeIntoStringList(pForms_m, pszUnderlyingForm);
if (pszUnderlyingForm != szBuffer)
	freeMemory(pszUnderlyingForm);
}

/*****************************************************************************
 * NAME
 *    searchForMorphName
 * ARGUMENTS
 *    pLexicon_in     - current KimmoLexicon section
 *    pszMorphName_in - current morphname string
 *    pMorphNames_in  - list of morphnames that follow the current one
 *    pLexItems_in    - reverse linked list of lexical items already found
 * DESCRIPTION
 *    search this lexicon for this morphname, and if successful, search each
 *    of the continuation lexicons for the next morphname.  If the final
 *    morphname coincides with the final lexicon section, store the underlying
 *    form.
 * RETURN VALUE
 *    none
 */
static void searchForMorphName(pLexicon_in, pszMorphName_in, pMorphNames_in,
				   pLexItems_in)
KimmoLexicon *	pLexicon_in;
char *		pszMorphName_in;
StringList *pMorphNames_in;
KimmoMorpheme *	pLexItems_in;
{
KimmoLexItem *	pLex;
short *		ccp;
KimmoMorpheme	lexItem;
KimmoMorpheme *	pLexItems;
/*
 *  search this lexicon for this morphname (gloss)
 */
pLex = (KimmoLexItem *)findDataInTrie(pLexicon_in->pStorage,
					  pszMorphName_in);
while (pLex != NULL)
	{
	if (strcmp(pszMorphName_in, (char *)pLex->pszGloss) == 0)
	{
	if (	(*pszMorphName_in != NUL) ||
		(strcmp((char *)pLex->pszLexString, szLangNull_m) != 0) ||
		(   (pLex->puiFeatureIndexes != NULL) &&
			(pLex->puiFeatureIndexes[0] != 0) ) )
		{
		lexItem.pLexItem          = pLex;
		lexItem.pszLexiconSection = pLexicon_in->pszName;
		lexItem.pPrevious         = pLexItems_in;
		pLexItems = &lexItem;
		}
	else
		{
		pLexItems = pLexItems_in;
		}
	if (pLexItems != NULL)
		pLexItems->pNext = NULL;
	if (pLex->uiContinuation == MAX_USHORT)
		{
		if (pMorphNames_in == NULL)
		storeForm(pLexItems);
		}
	else if (pLex->uiContinuation < pSynLang_m->uiAlternationCount)
		{
		/*
		 *  step through each of the continuation lexicons
		 */
		for ( ccp = pSynLang_m->pAlternations[pLex->uiContinuation].piLexicons ;
		  *ccp != -1 ; ++ccp )
		getFormsFromLexicon(pMorphNames_in,
					&pSynLang_m->pLexiconSections[*ccp],
					pLexItems);
		}
	}
	pLex = pLex->pNext;
	}
}

/*****************************************************************************
 * NAME
 *    getFormsFromLexicon
 * ARGUMENTS
 *    pMorphNames_in    - list of morphname strings
 *    pLexicon_in       - current KimmoLexicon section
 *    pPreviousItems_in - reverse linked list of lexical items already found
 * DESCRIPTION
 *    convert the list of morphnames into one or more underlying forms
 * RETURN VALUE
 *    the global pointer to the list of recomposed underlying forms
 */
static StringList *getFormsFromLexicon(pMorphNames_in, pLexicon_in,
					   pPreviousItems_in)
StringList *pMorphNames_in;
KimmoLexicon *	pLexicon_in;
KimmoMorpheme *	pPreviousItems_in;
{
if (pLexicon_in == NULL)
	return pForms_m;
/*
 *  search this lexicon for this morphname (gloss)
 */
if (pMorphNames_in != NULL)
	searchForMorphName(pLexicon_in, pMorphNames_in->pszString,
			   pMorphNames_in->pNext, pPreviousItems_in);
/*
 *  search this lexicon for empty glosses
 */
searchForMorphName(pLexicon_in, "", pMorphNames_in, pPreviousItems_in);

return pForms_m;
}

/*****************************************************************************
 * NAME
 *    convertAnalysis
 * ARGUMENTS
 *    pszAnalysis - AMPLE/KTEXT analysis string
 * DESCRIPTION
 *    convert the analysis string of morphnames into one or more strings of
 *    underlying forms suitable for synthesis with generator()
 * RETURN VALUE
 *    pointer to a list of underlying forms
 */
static StringList *convertAnalysis(pszAnalysis)
unsigned char *	pszAnalysis;
{
StringList *	pMorphNames;
StringList *	pForms;

pMorphNames = splitAnalysisString(pszAnalysis);
pForms_m = NULL;
pForms = getFormsFromLexicon(pMorphNames, pSynLang_m->pInitialLexicon,
				 (KimmoMorpheme *)NULL);
freeStringList( pMorphNames );
return pForms;
}

/*****************************************************************************
 * NAME
 *    applyKimmoSynthesizer
 * DESCRIPTION
 *    Synthesize a word from the ordered list of morphnames separated by
 *    spaces.
 * RETURN VALUE
 *    pointer to list of synthesized words, or NULL if none can be synthesized
 */
KimmoResult * applyKimmoSynthesizer(pszMorphemes_in, pKimmo_in)
unsigned char *	pszMorphemes_in;
KimmoData *	pKimmo_in;
{
StringList *	pWords;
StringList *	pw;
KimmoResult *	pGen;
KimmoResult *	pNextGen;
KimmoResult *	pResults;
KimmoResult *	pTailResults;
KimmoResult *	pRes;
int		bFoundMatch;
/*
 *  don't bother if no language data
 */
if (	(pKimmo_in == NULL) ||
	(pKimmo_in->ppszAlphabet == NULL) ||
	(pKimmo_in->pInitialLexicon == NULL) )
	return( (KimmoResult *)NULL );
pSynLang_m      = pKimmo_in;
szLangNull_m[0] = pSynLang_m->cNull;
szLangNull_m[1] = NUL;
pResults        = NULL;
pTailResults    = NULL;

pWords = convertAnalysis(pszMorphemes_in);
for ( pw = pWords ; pw ; pw = pw->pNext )
	{
	/*
	 *  synthesize the word
	 */
	pGen = applyKimmoGenerator((unsigned char *)pw->pszString, pKimmo_in);
	/*
	 *  merge the current KimmoResult list into the total result list
	 */
	for ( ; pGen != (KimmoResult *)NULL ; pGen = pNextGen )
	{
	pNextGen = pGen->pNext;
	pGen->pNext = NULL;
	bFoundMatch = 0;
	for ( pRes = pResults ; pRes ; pRes = pRes->pNext )
		{
		if (strcmp((char *)pGen->pszResult,
			   (char *)pRes->pszResult) == 0)
		{
		bFoundMatch = 1;
		break;
		}
		}
	if (bFoundMatch)
		{
		freeKimmoResult( pGen, pKimmo_in );
		continue;			/* avoid duplication */
		}
	/*
	 *  add this result to the final list
	 */
	if (pResults == NULL)
		pResults  = pGen;
	else
		pTailResults->pNext = pGen;
	pTailResults = pGen;
	}
	}
if (pWords != NULL)
	freeStringList( pWords );

return( pResults );
}
