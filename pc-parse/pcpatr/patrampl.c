/* PATRAMPL.C - functions to interface between PC-PATR and AMPLE
 ***************************************************************************
 *
 * PATRLexItem * parseWithAmpleForPATRLexicon(char *      pszWord_in,
 *                                            AmpleData * pAmple_in,
 *                                            PATRData *  pPATR_in)
 *
 * int parseAmpleSentenceWithPATR(WordTemplate ** ppWords_in,
 *                                FILE *          pOutputFP_in,
 *                                char *          pszOutputFile_in,
 *                                int             bWarnUnusedFd_in,
 *                                int             bVerbose_in,
 *                                int             bWriteAmpleParses_in,
 *                                unsigned        uiSentenceCount_in;
 *                                TextControl *   pTextControl_in,
 *                                PATRData *      pPATR_in)
 *
 * int loadPATRLexiconFromAmple(const char *  filename,
 *                              TextControl * pTextControl_in,
 *                              PATRData *    pPATR_in)
 *
 ***************************************************************************
 * Copyright 1997, 2000 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
#include "ample.h"
#include "rpterror.h"	/* for NumberedMessage and displayNumberedMessage() */
#include "cmd.h"	/* temp fix */

static char * get_ample_morphnames P((char *pszAnal_in, PATRData * pPATR_in));
static void add_catlex_feat P((PATRWordCategory * wordt, char * cat,
				   char * lex, char * gloss, PATRData * pPATR_in));
static void add_ample_feat P((PATRWordCategory * pWordCat, char * pszDecomp,
				  char * pszUnderForm,
				  char * pszFeatures, char * pszProperties,
				  PATRData * pPATR_in));
static void mark_used P((PATREdge * edgep, int depth, PATRData * pThis));
static void print_ample_sentence P((PATRWord * sent, FILE * fp, int count));

/* same chars as isspace() */
static const unsigned char szWhitespace_m[7] = " \t\n\v\f\r";

static const NumberedMessage sBadInputFile_m	= { ERROR_MSG,   109,
	"Cannot open input file %s in %s command" };

/******************************************************************************
 * NAME
 *    get_ample_morphnames
 * ARGUMENTS
 *    pszAnal_in - input analysis string
 * DESCRIPTION
 *    Get morphnames from analysis string.  I.e., remove the root markers and
 *    root categories.
 * RETURN VALUE
 *    pointer to morphnames found
 */
static char * get_ample_morphnames( pszAnal_in, pPATR_in )
char * pszAnal_in;
PATRData * pPATR_in;
{
char * pszMorphnames;
char * pch;
char * pszRest;

pszMorphnames = allocPATRStringCopy(pszAnal_in, pPATR_in);
 while ((pch = strchr(pszMorphnames, '<')) != NULL)
   {
	 pszRest = strchr(pch + 2, ' ');
	 if (pszRest == NULL)
	   {
	 return pszMorphnames;
	   }
	 ++pszRest;
	 memmove(pch, pszRest, strlen(pszRest) + 1);
	 for (;;)
	   {
	 pch = strchr(pch, ' ');
	 if (pch == NULL)
	   {
		 return pszMorphnames;
	   }
	 if (strncmp(pch, " >", 2) == 0)
	   {
		 if (pch[2] == NUL)
		   {
		 *pch = NUL;
		 return pszMorphnames;
		   }
		 memmove(pch, pch + 2, strlen(pch + 1));
		 break;
	   }
	 ++pch;
	 pszRest = strchr(pch, ' ');
	 ++pszRest;
	 memmove(pch, pszRest, strlen(pszRest) + 1);
	   }
   }
 return pszMorphnames;
}

#ifndef hab130
/******************************************************************************
 * NAME
 *    get_ample_primary_root_morphname
 * ARGUMENTS
 *    pszAnal_in - input analysis string
 * DESCRIPTION
 *    Get primary root morphname from analysis string.  I.e., remove the root markers and
 *    root categories, any prefixes and suffixes, and only use one root.
 * RETURN VALUE
 *    pointer to morphname found
 */
static char * get_ample_primary_root_morphname( pszAnal_in, pPATR_in )
char * pszAnal_in;
PATRData * pPATR_in;
{
char * pszMorphname;
char * pch;
char * pszRest;

pszMorphname = allocPATRStringCopy(pszAnal_in, pPATR_in);
pch = strchr(pszMorphname, '<');
if (pch == NULL)
	{
	return pszMorphname;
	}
pszRest = strchr(pch + 2, ' ');
if (pszRest == NULL)
	{
	return pszMorphname;
	}
++pszRest;
memmove(pszMorphname, pszRest, strlen(pszRest) + 1);
for (pch = pszMorphname;;)
	{
	pch = strchr(pch, ' ');
	if (pch == NULL)
	{
	return pszMorphname;
	}
	if ((pPATR_in->eRootGlossFeature == PATR_ROOT_GLOSS_LEFT_HEADED) ||
	(pPATR_in->eRootGlossFeature == PATR_ROOT_GLOSS_ON))
		{			/* use leftmost root */
	*pch = NUL;
	return pszMorphname;
	}
	if (strncmp(pch, " >", 2) == 0)
	{
	  *pch = NUL;
	  return pszMorphname;
	}
	++pch;
	pszRest = strchr(pch, ' ');
	++pszRest;
	if (pPATR_in->eRootGlossFeature == PATR_ROOT_GLOSS_RIGHT_HEADED)
		{
	pch = pszMorphname;
	}
	memmove(pch, pszRest, strlen(pszRest) + 1);
	}
}
#endif /* hab130 */

/*****************************************************************************
 * NAME
 *    parseWithAmpleForPATRLexicon
 * DESCRIPTION
 *    Parse the word using the AMPLE information already loaded into memory.
 * RETURN VALUE
 *    pointer to node in lexicon containing the newly parsed word, or NULL if
 *    it doesn't parse
 */
PATRLexItem * parseWithAmpleForPATRLexicon(pszWord_in, pAmple_in, pPATR_in)
char *		pszWord_in;	/* pointer to word we want to parse */
AmpleData *	pAmple_in;
PATRData *	pPATR_in;
{
AmpleWord	sAmpleWord;
WordAnalysis *	pAnalysis;
PATRLexItem *	pLexItem;
char *		p;
#ifndef hab130
char * pszRootGloss;
#endif /* hab130 */
/*
 *  check that we have the necessary information
 */
if (	(pAmple_in->pszAnalysisDataFile == NULL) ||
	(pAmple_in->pDictionary == NULL) )
	return NULL;

if (pPATR_in->pLexicon == NULL)
	{
	pPATR_in->pLexicon = (PATRLexicon *)allocMemory(sizeof(PATRLexicon));
	memset(pPATR_in->pLexicon, 0, sizeof(PATRLexicon));
	}
/*
 *  set the AMPLE flags for desired output
 */
pAmple_in->iOutputFlags    = WANT_FEATURES;
pAmple_in->bWriteMorphCats = FALSE;
/*
 *  initialize the AMPLE word structures
 */
memset(&sAmpleWord, 0, sizeof(AmpleWord));
sAmpleWord.pTemplate = (WordTemplate *)allocMemory(sizeof(WordTemplate));
sAmpleWord.pTemplate->pszOrigWord = duplicateString( pszWord_in );
sAmpleWord.pTemplate->iCapital = decapitalizeWord( sAmpleWord.pTemplate,
						 &pAmple_in->sTextCtl);
/*
 *  try to parse the word
 */
if (performAmpleAnalysis(&sAmpleWord, NULL, NULL, pAmple_in) == 0)
	{
	eraseAmpleWord( &sAmpleWord, pAmple_in );
	return( NULL );
	}
/*
 *  store the AMPLE results in the PC-PATR lexicon
 */
for (	pAnalysis = sAmpleWord.pTemplate->pAnalyses ;
	pAnalysis ;
	pAnalysis = pAnalysis->pNext )
	{
	if (pAnalysis->pszFeatures != NULL)
	{
	while ((p = strchr(pAnalysis->pszFeatures, '=')) != NULL)
		*p = ' ';
	}
#ifdef hab130
	addPATRLexItem(pszWord_in,
		   pAnalysis->pszAnalysis,
		   pAnalysis->pszCategory,
		   pAnalysis->pszFeatures,
		   NULL, pPATR_in);
#else  /* hab130 */
	if (pPATR_in->eRootGlossFeature != PATR_ROOT_GLOSS_NO_FEATURE)
	pszRootGloss = get_ample_primary_root_morphname(pAnalysis->pszAnalysis,
							pPATR_in);
	else
		pszRootGloss = NULL;
	addPATRLexItem(pszWord_in,
		   pAnalysis->pszAnalysis,
		   pszRootGloss,
		   pAnalysis->pszCategory,
		   pAnalysis->pszFeatures,
		   NULL, pPATR_in);
#endif /* hab130 */
	}
eraseAmpleWord( &sAmpleWord, pAmple_in );

for (	pLexItem = (PATRLexItem *)findDataInTrie(
				pPATR_in->pLexicon->pStorage, pszWord_in) ;
	pLexItem ;
	pLexItem = pLexItem->pNext )
	{
	if (strcmp(pszWord_in, (char *)pLexItem->pszLexString) == 0)
	break;
	}
return pLexItem;
}

/***************************************************************************
 * NAME
 *    loadPATRLexiconFromAmple
 * ARGUMENTS
 *    filename - name of AMPLE analysis file to read
 * DESCRIPTION
 *    load the analysis data into the lexicon, discarding duplicates
 * RETURN VALUE
 *    TRUE if any entries loaded into lexicon, FALSE otherwise
 */
int loadPATRLexiconFromAmple(filename, pTextControl_in, pPATR_in)
const char *	filename;	/* name of AMPLE analysis file */
TextControl *	pTextControl_in;
PATRData *	pPATR_in;
{
FILE *fp;
WordTemplate *wtp;
WordAnalysis *	pAnal;
char *p, *category;
#ifndef hab130
char * pszRootGloss;
#endif /* hab130 */

if ((fp = fopen(filename, "r")) == (FILE *)NULL)
	{
	displayNumberedMessage(&sBadInputFile_m,
			   pPATR_in->bSilent, pPATR_in->bShowWarnings,
			   pPATR_in->pLogFP,
			   NULL, 0, filename,
			   "LOAD AMPLE");
	return (0);
	}
if (pPATR_in->pLexicon == NULL)
	{
	pPATR_in->pLexicon = (PATRLexicon *)allocMemory(sizeof(PATRLexicon));
	memset(pPATR_in->pLexicon, 0, sizeof(PATRLexicon));
	}
pPATR_in->pLexicon->iLexEntriesCount = 0L;
pPATR_in->pLexicon->uiMaxLexicalPhraseSize = 1;
while ((wtp = readTemplateFromAnalysis(fp, pTextControl_in)) != NULL)
	{
	if (    (wtp->pAnalyses == (WordAnalysis *)NULL) ||
		(wtp->pAnalyses->pszAnalysis == (char *)NULL) ||
		(wtp->pAnalyses->pszCategory == (char *)NULL) ||
		(wtp->pszOrigWord == (char *)NULL) )
	{
	freeWordTemplate(wtp);
	continue;
	}
	for ( pAnal = wtp->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
	{
	category = pAnal->pszCategory;
	p = strpbrk(category, (char *)szWhitespace_m);
	if (p != (char *)NULL)	/* we want only the first "word" from */
		*p = NUL;		/* the category field */
	if (pAnal->pszFeatures != NULL)
		{
		while ((p = strchr(pAnal->pszFeatures, '=')) != NULL)
		*p = ' ';
		}
	++pPATR_in->pLexicon->iLexEntriesCount;
	pPATR_in->bGlossesExist = TRUE;
	pPATR_in->bGloss        = TRUE;
#ifdef hab130
	addPATRLexItem(wtp->pszOrigWord,
			   get_ample_morphnames(pAnal->pszAnalysis, pPATR_in),
			   category,
			   pAnal->pszFeatures,
			   NULL, pPATR_in);
#else  /* hab130 */
	if (pPATR_in->eRootGlossFeature != PATR_ROOT_GLOSS_NO_FEATURE)
		pszRootGloss = get_ample_primary_root_morphname(pAnal->pszAnalysis,
							  pPATR_in);
	else
		pszRootGloss = NULL;
	addPATRLexItem(wtp->pszOrigWord,
			   get_ample_morphnames(pAnal->pszAnalysis, pPATR_in),
			   pszRootGloss,
			   category,
			   pAnal->pszFeatures,
			   NULL, pPATR_in);
#endif /* hab130 */
	}
	freeWordTemplate(wtp);
	}
fclose(fp);
if (!pPATR_in->bSilent)
	fprintf(stderr, "Loaded %lu word%s into the lexicon.\n",
		pPATR_in->pLexicon->iLexEntriesCount,
		(pPATR_in->pLexicon->iLexEntriesCount == 1) ? "" : "s");
return(pPATR_in->pLexicon->iLexEntriesCount != 0L);
}

/*****************************************************************************
 * NAME
 *    add_catlex_feat
 * DESCRIPTION
 *    Add cat, lex, and gloss features to wordt
 * RETURN VALUE
 *    none
 */
static void add_catlex_feat( wordt, cat, lex, gloss, pPATR_in)
PATRWordCategory *	wordt;
char *			cat;
char *			lex;
char *			gloss;
PATRData *		pPATR_in;
{
PATRFeature *	tfeat;
#ifdef hab130
char *	anal_root;            /* Root of analysis */
#else /* hab130 */
char *	anal_root;            /* Root of analysis */
char *	anal_morphs;          /* morphnames in analysis */
#endif /* hab130 */
char *	pszCatFeatName;
char *	pszLexFeatName;
char *	pszGlossFeatName;
#ifndef hab130
char *  pszRootGlossFeatName;
#endif /* hab130 */

if (pPATR_in->pGrammar != NULL)
	{
	pszCatFeatName   = pPATR_in->pGrammar->pszCatFeatName;
	pszLexFeatName   = pPATR_in->pGrammar->pszLexFeatName;
	pszGlossFeatName = pPATR_in->pGrammar->pszGlossFeatName;
#ifndef hab130
	pszRootGlossFeatName = pPATR_in->pGrammar->pszRootGlossFeatName;
#endif /* hab130 */
	}
else
	{
	pszCatFeatName   = storedPATRString( "cat", pPATR_in);
	pszLexFeatName   = storedPATRString( "lex", pPATR_in);
	pszGlossFeatName = storedPATRString( "gloss", pPATR_in);
#ifndef hab130
	pszRootGlossFeatName = storedPATRString( "rootgloss", pPATR_in);
#endif /* hab130 */
	}
/*
 *  Add cat feature
 */
if (cat)
	{
	tfeat = allocPATRFeature(pPATR_in);			/* Allocate space */
	tfeat->eType     = PATR_DEFATOM;			/* Make it default */
	tfeat->u.pszAtom = storedPATRString( cat, pPATR_in);
	addPATRFeatureToComplex( wordt->pFeature,
				 createPATRComplexFeature( pszCatFeatName, tfeat,
							   pPATR_in ) );
	}
/*
 *  Add lex feature
 */
if (lex)
	{
	addPATRFeatureToComplex(wordt->pFeature,
				createPATRComplexFeature(pszLexFeatName,
							 createPATRAtomFeature(
						   storedPATRString(lex, pPATR_in),
						   pPATR_in),
							 pPATR_in));
	}
/*
 *  Add gloss feature
 */
if (gloss)
	{
#ifdef hab130
	anal_root = get_ample_morphnames( gloss, pPATR_in );
	addPATRFeatureToComplex(wordt->pFeature,
		createPATRComplexFeature(pszGlossFeatName,
			  createPATRAtomFeature(storedPATRString(anal_root,
								 pPATR_in),
						pPATR_in),
					 pPATR_in));
#else /* hab130 */
	anal_morphs = get_ample_morphnames( gloss, pPATR_in );
	addPATRFeatureToComplex(wordt->pFeature,
		createPATRComplexFeature(pszGlossFeatName,
			  createPATRAtomFeature(storedPATRString(anal_morphs,
								 pPATR_in),
						pPATR_in),
					 pPATR_in));
	if (pPATR_in->eRootGlossFeature != PATR_ROOT_GLOSS_NO_FEATURE)
		{			/* Add root gloss feature */
	anal_root = get_ample_primary_root_morphname( gloss, pPATR_in );
	addPATRFeatureToComplex(wordt->pFeature,
		createPATRComplexFeature(pszRootGlossFeatName,
			  createPATRAtomFeature(storedPATRString(anal_root,
								 pPATR_in),
						pPATR_in),
					 pPATR_in));
	}
#endif /* hab130 */
	}
}

/*****************************************************************************
 * NAME
 *    add_ample_feat
 * DESCRIPTION
 *    If available, add the decomposition, underlyingForm, precedingFormat,
 *    and trailingNonalpha features to pWordCat
 * RETURN VALUE
 *    none
 */
static void add_ample_feat(pWordCat, pszDecomp, pszUnderForm,
			   /*pszFormat, pszNonAlpha,*/
			   pszFeatures, pszProperties,
			   pPATR_in)
PATRWordCategory * pWordCat;
char * pszDecomp;
char * pszUnderForm;
char * pszFeatures;
char * pszProperties;
PATRData * pPATR_in;
{
if (pszDecomp && *pszDecomp)
	{
	addPATRFeatureToComplex(pWordCat->pFeature,
				createPATRComplexFeature("decomposition",
						 createPATRAtomFeature(
						 storedPATRString(pszDecomp,
								  pPATR_in),
						 pPATR_in), pPATR_in));
	}
if (pszUnderForm && *pszUnderForm)
	{
	addPATRFeatureToComplex(pWordCat->pFeature,
				createPATRComplexFeature("underlyingForm",
						 createPATRAtomFeature(
						 storedPATRString(pszUnderForm,
								  pPATR_in),
						 pPATR_in), pPATR_in));
	}
if (	pszFeatures && *pszFeatures &&
	(strspn(pszFeatures, " \t=") != strlen(pszFeatures)) )
	{
	addPATRFeatureToComplex(pWordCat->pFeature,
				createPATRComplexFeature("featureDescriptors",
						 createPATRAtomFeature(
						 storedPATRString(pszFeatures,
								  pPATR_in),
						 pPATR_in), pPATR_in));
	}
if (	pszProperties && *pszProperties &&
	(strspn(pszProperties, " \t=") != strlen(pszProperties)) )
	{
	addPATRFeatureToComplex(pWordCat->pFeature,
				createPATRComplexFeature("properties",
						 createPATRAtomFeature(
						storedPATRString(pszProperties,
								 pPATR_in),
						pPATR_in), pPATR_in));
	}
}

/*****************************************************************************
 * NAME
 *    mark_used
 * ARGUMENTS
 *    edgep - pointer to edge in the parse chart
 *    depth - depth in the tree (ignored)
 * DESCRIPTION
 *    mark word corresponding to lexical edge as used by some parse
 * RETURN VALUE
 *    none
 */
static void mark_used(edgep, depth, pThis)
PATREdge *	edgep;
int	depth;
PATRData * pThis;
{
if (edgep->eType == PATR_LEXICAL_EDGE)
	edgep->u.l.pWord->bUsed = TRUE;
}

/***************************************************************************
 * NAME
 *    print_ample_sentence
 * ARGUMENTS
 *    sent  - pointer to a sentence structure list
 *    fp    - output FILE pointer
 *    count - sentence number
 * DESCRIPTION
 *    Prints a sentence and its corresponding sentence number.
 * RETURN VALUE
 *    NONE -- prints sentence as a side effect
 */
static void print_ample_sentence(sent, fp, count)
PATRWord *sent;
FILE *fp;
int count;		/* Number of the sentence to print */
{
PATRWord *esent;

fprintf(fp, "%d ", count);
for ( esent = sent ; esent ; esent = esent->pNext )
	fprintf(fp, "%s ", esent->pszWordName);
fprintf(fp, "\n");
}

/*****************************************************************************
 * NAME
 *    parseAmpleSentenceWithPATR
 * ARGUMENTS
 *    ppWords_in - array of word_template structs containing one sentence
 * DESCRIPTION
 *    Parse a sentence loaded from an AMPLE analysis file.
 * RETURN VALUE
 *    number of successful parses of the sentence
 */
int parseAmpleSentenceWithPATR(ppWords_in, pOutputFP_in, pszOutputFile_in,
				   bWarnUnusedFd_in, bVerbose_in,
				   bWriteAmpleParses_in, uiSentenceCount_in,
				   pTextControl_in, pPATR_in)
WordTemplate **	ppWords_in;
FILE *		pOutputFP_in;
char *		pszOutputFile_in;
int		bWarnUnusedFd_in;
int		bVerbose_in;
int		bWriteAmpleParses_in;
unsigned	uiSentenceCount_in;
TextControl *	pTextControl_in;
PATRData *	pPATR_in;
{
PATRWord * sentm;			/* Main sentence, top of list */
PATRWord * sentp;
PATRWord * sentt;
PATRWordCategory * wordt;
PATRWordCategory * wordp;
PATRFeatureDisjunction * tfeatd;	/* Temp feat disjunct */
PATREdgeList * parse;
PATREdgeList * elp;
int wordnum;			/* Word number for building */
int morphnum;			/* Morph number for building */
WordTemplate * wtp;
WordAnalysis * pAnal;
WordAnalysis * pPrevAnal;
WordAnalysis * pNextAnal;
int i;
int num_parses = 0;
int old_glosses_exist;
char * category;
char * p;
char ch;
int		bAmbigUsed;
int		iAmbig;
int		iWordCount = 0;
int		iStage = 0;
const char * pszCannot = NULL;
const char * pszMessage = NULL;
char * pszCatFeatName = NULL;
PATRFeature * tfeat;

if (ppWords_in == (WordTemplate **)NULL)
	return( 0 );
/*
 *  convert the array of WordTemplate structs to a list of PATRWord structs
 */
wordnum = morphnum = 0;
markPATRParseGarbage(pPATR_in);
for ( sentm = NULL, sentp = NULL, i = 0 ; ppWords_in[i] ; ++i )
	{
	++iWordCount;
	/*
	 *  make PATRWord node
	 */
	/* Allocate struct */
	sentt = (PATRWord *)allocMemory(sizeof(PATRWord));
	if ( !sentp )				/* If first (no prev) */
	sentm = sentt;				/* Set head to this */
	else
	sentp->pNext = sentt;			/* Else link from prev */
	sentp = sentt;				/* Set prev to this */
	sentt->iWordNumber  = wordnum++;		/* Put in next word number */
	sentt->pszWordName  = NULL;			/* No wordname yet */
	sentt->pCategories  = NULL;			/* No cats yet */
	sentt->pNext        = NULL;			/* Link stays null on last */

	wtp = ppWords_in[i];
	if (wtp->pszOrigWord != (char *)NULL)
	sentt->pszWordName = wtp->pszOrigWord;
	else if ((wtp->paWord != NULL) && (wtp->paWord[0] != NULL))
	sentt->pszWordName = wtp->paWord[0];
	if (    (wtp->pAnalyses == NULL) ||
		(wtp->pAnalyses->pszCategory == NULL) )
	{
	/* Mark as failure */
	wordt = addPATRWordCategory("FAIL", sentt, pPATR_in);
	}
	else
	{
	for ( pAnal = wtp->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		{
		/*
		 *  store the category, and add cat and lex features to the Word
		 */
		category = pAnal->pszCategory;
		p = strpbrk(category, (char *)szWhitespace_m);
		if (p != (char *)NULL)
		{		/* we want only the first "word" from */
		ch = *p;	/* the category field */
		*p = NUL;
		}
		else
		ch = ' ';
		wordt = addPATRWordCategory(category, sentt, pPATR_in);
		add_catlex_feat(wordt, /*category*/NULL, sentt->pszWordName,
				pAnal->pszAnalysis, pPATR_in);
		add_ample_feat(wordt, pAnal->pszDecomposition,
			   pAnal->pszUnderlyingForm,
			   /*wtp->pszFormat, wtp->pszNonAlpha,*/
			   pAnal->pszFeatures, pAnal->pszProperties,
			   pPATR_in);
		tfeatd = buildPATRFeatureDisjunction(category, NULL, FALSE, NULL,
						 pPATR_in);
		if (pAnal->pszFeatures && *pAnal->pszFeatures)
		tfeatd = buildPATRFeatureDisjunction(pAnal->pszFeatures,
							 tfeatd, bWarnUnusedFd_in,
				  (pOutputFP_in == stderr) ? NULL : pOutputFP_in,
							 pPATR_in);
		if (    pPATR_in->bPropIsFeature &&
			pAnal->pszProperties && *pAnal->pszProperties)
		tfeatd = buildPATRFeatureDisjunction(pAnal->pszProperties,
							 tfeatd,
							 bWarnUnusedFd_in,
				  (pOutputFP_in == stderr) ? NULL : pOutputFP_in,
							 pPATR_in);
		/*
		 *  check for lexical rules
		 */
		/* TODO: IMPLEMENT LEXICAL RULE APPLICATION

PATRFeatureDisjunction * applyPATRLexicalRules P((char * pszNames_in,
	PATRFeatureDisjunction * pFeatDisj_io,
	PATRData * pPATR_in));

		tfeatd = applyPATRLexicalRules(pAnal->pszFeatures, tfeatd,
					   pPATR_in);
		if (    pPATR_in->bPropIsFeature &&
			pAnal->pszProperties && *pAnal->pszProperties)
		tfeatd = applyPATRLexicalRules(pAnal->pszProperties, tfeatd,
					   pPATR_in);
		 */
		/*
		 *  add this feature disjunction to the word
		 */
		addPATRFeatureToWord(tfeatd, wordt, pPATR_in);
		if (p != (char *)NULL)
		*p = ch;
		}
	}
	}
/*
 *  ensure that we have a category feature for every category
 */
if (pPATR_in->pGrammar != NULL)
	pszCatFeatName = pPATR_in->pGrammar->pszCatFeatName;
if (pszCatFeatName == NULL)
	pszCatFeatName = storedPATRString( "cat", pPATR_in);
for ( sentp = sentm ; sentp ; sentp = sentp->pNext )
	{
	for ( wordt = sentp->pCategories ; wordt ; wordt = wordt->pNext )
	{
	if (findPATRAttribute(wordt->pFeature, pszCatFeatName) == NULL)
		{
		tfeat  = allocPATRFeature(pPATR_in);
		if (pPATR_in->bPromoteDefAtoms)
		tfeat->eType = PATR_ATOM;	/* Make it atom */
		else
		tfeat->eType = PATR_DEFATOM;	/* Make it default atom */
		tfeat->u.pszAtom = storedPATRString(wordt->pszCategory, pPATR_in);
		addPATRFeatureToComplex(wordt->pFeature,
					createPATRComplexFeature(pszCatFeatName,
								 tfeat,
								 pPATR_in));
		}
	}
	}
if (bVerbose_in)
	print_ample_sentence(sentm, stderr, uiSentenceCount_in);
if (pPATR_in->pLogFP != (FILE *)NULL)
	print_ample_sentence(sentm, pPATR_in->pLogFP, uiSentenceCount_in);
/*
 *  parse the sentence (list of PATRWord structs)
 */
old_glosses_exist = pPATR_in->bGlossesExist;
parse = parseWithPATR(sentm, &iStage, pPATR_in);
if ((parse == NULL) || (iStage != 0))
	{
#ifndef hab1211
	pszCannot = "**** Not able to parse this sentence ****\n";
#else
	pszCannot = "**** Cannot parse this sentence ****\n";
#endif /* hab1211 */
	}
switch (iStage)
	{
	case 0:
	for ( elp = parse ; elp ; elp = elp->pNext )
		++num_parses;
	break;
	case 1:
	pszMessage = "**** Turning off unification ****\n";
	break;
	case 2:
	pszMessage = "**** Turning off top-down filtering ****\n";
	break;
	case 3:
	pszMessage = "**** Building the largest parse \"bush\" ****\n";
	break;
	case 4:
	pszMessage = "**** No output available ****\n";
	break;
	case 5:
	pszMessage = "**** Out of Memory (after %lu edges) ****\n";
	break;
	case 6:
	pszMessage = "**** Out of Time (after %lu edges) ****\n";
	break;
	}
#ifndef hab129
	pPATR_in->bGlossesExist = TRUE;
#endif /* hab129 */
if ((parse == NULL) || (iStage != 0))
	{
	if (bVerbose_in)
	fputs(pszCannot, stderr);
	if (pPATR_in->pLogFP != NULL)
	fputs(pszCannot, pPATR_in->pLogFP);
	if (pszMessage != NULL)
	{
	if (bVerbose_in)
		fprintf(stderr, pszMessage, pPATR_in->uiEdgesAdded);
	if (pPATR_in->pLogFP != NULL)
		fprintf(pPATR_in->pLogFP, pszMessage, pPATR_in->uiEdgesAdded);
	}
	}
else
	{
#ifdef hab129
	pPATR_in->bGlossesExist = TRUE;
#endif /* hab129 */
	if (bVerbose_in)
	{
	writePATRParses(parse, stderr, pPATR_in);
	putc('\n', stderr);
	}
	if (pPATR_in->pLogFP != (FILE *)NULL)
	{
	writePATRParses(parse, pPATR_in->pLogFP, pPATR_in);
	putc('\n', pPATR_in->pLogFP);
	}
	/*
	 *  use the parse output to eliminate redundancy from ppWords_in[]
	 */
	visitPATREdges(parse, 1, PATR_PREORDER, mark_used, pPATR_in);
	for ( sentp = sentm, i = 0 ; i < iWordCount ; ++i, sentp = sentp->pNext )
	{
	if (sentp == NULL)
		{
		/* error */
		break;
		}
	wtp = ppWords_in[i];
	pPrevAnal = NULL;
	for ( iAmbig = 1, pAnal = wtp->pAnalyses ; pAnal ; pAnal = pNextAnal )
		{
		pNextAnal = pAnal->pNext;
		/*
		 *  determine whether this ambiguity is used by a sentence parse
		 */
		bAmbigUsed = FALSE;
		for ( wordp = sentp->pCategories ; wordp ; wordp = wordp->pNext )
		{
		if (wordp->bUsed && (wordp->iAmbigNumber == iAmbig))
			{
			bAmbigUsed = TRUE;
			break;
			}
		}
		if (bAmbigUsed == TRUE)
		{
		/*
		 *  point to the most recent used ambiguity
		 */
		pPrevAnal = pAnal;
		}
		else
		{
		/*
		 *  erase this ambiguity
		 */
		if (pAnal->pszAnalysis != NULL)
			freeMemory(pAnal->pszAnalysis);
		if (pAnal->pszDecomposition != NULL)
			freeMemory(pAnal->pszDecomposition);
		if (pAnal->pszCategory != NULL)
			freeMemory(pAnal->pszCategory);
		if (pAnal->pszProperties != NULL)
			freeMemory(pAnal->pszProperties);
		if (pAnal->pszFeatures != NULL)
			freeMemory(pAnal->pszFeatures);
		if (pAnal->pszUnderlyingForm != NULL)
			freeMemory(pAnal->pszUnderlyingForm);
		freeMemory(pAnal);

		if (pPrevAnal == NULL)
			wtp->pAnalyses = pNextAnal;
		else
			pPrevAnal->pNext = pNextAnal;
		}
		++iAmbig;
		}
	}
	if (sentp != NULL)
	{
	/* error */
	}
	}
/*
 *  if output file exists, write the disambiguated output and the parse tree
 *  to the output analysis file
 */
if (pOutputFP_in != NULL)
	{
	for ( i = 0 ; i < iWordCount ; ++i )
	writeTemplate(pOutputFP_in, pszOutputFile_in, ppWords_in[i],
			  pTextControl_in );
	if (bWriteAmpleParses_in)
	{
	/*
	 *  add \failure (if needed) and \parse field to the last word in the
	 *  sentence
	 */
	if (iStage != 0)
		{
#ifndef hab1210
		if (pszMessage && (iStage == 5 || iStage == 6))
			{
		char szBuff[100];
		sprintf(szBuff, "\\failure %s", pszMessage);
		fprintf(pOutputFP_in, szBuff, pPATR_in->uiEdgesAdded);
		}
		else
			fprintf(pOutputFP_in, "\\failure %s",
			pszMessage ? pszMessage : "");
#else
		fprintf(pOutputFP_in, "\\failure %s",
			pszMessage ? pszMessage : "");
#endif /* hab1210 */
		}
	fprintf(pOutputFP_in, "\\parse\n");
	writePATRParses(parse, pOutputFP_in, pPATR_in);
	fprintf(pOutputFP_in, "\\endparse\n\n");
	}
	}
/*
 *  free the memory used by the list of PATRWord structs and the parse
 */
collectPATRParseGarbage(pPATR_in);
for ( sentp = sentm ; sentp ; sentp = sentm )
	{
	sentm = sentp->pNext;
	freeMemory( sentp );
	}
pPATR_in->bGlossesExist   = old_glosses_exist;

return( num_parses );
}
