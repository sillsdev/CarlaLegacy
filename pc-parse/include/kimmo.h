/* KIMMO.H - global defines and struct definitions for PC-KIMMO
 ***************************************************************************
 *
 *	typedef struct ... KimmoLexicon
 *	typedef struct ... KimmoAlternation
 *	typedef struct ... KimmoLexItem
 *	typedef struct ... KimmoFSAColumn
 *	typedef struct ... KimmoRule
 *	typedef struct ... KimmoData
 *	typedef struct ... KimmoResult
 *	typedef struct ... KimmoMorpheme
 *
 ***************************************************************************
 * Copyright 1989, 1999 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _KIMMO_H_INCLUDED_
#define _KIMMO_H_INCLUDED_
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include "allocmem.h"
#include "trie.h"
#include "rpterror.h"
extern char *	trimTrailingWhitespace P((char * pszString_io));
/*
 *  type definitions for KimmoData * and KimmoResult * needed for patr.h
 */
typedef struct kimmo_data	KimmoData;
typedef struct kimmo_result	KimmoResult;
#include "patr.h"
/*
 *  internal data structure type definitions
 */
typedef struct kimmo_lexicon		KimmoLexicon;
typedef struct kimmo_alternation	KimmoAlternation;
typedef struct kimmo_subset		KimmoSubset;
typedef struct kimmo_rule		KimmoRule;
typedef struct kimmo_morpheme		KimmoMorpheme;
typedef struct kimmo_pair		KimmoPair;

/****************************************************************************
 * NAME
 *    typedef KimmoData
 * DESCRIPTION
 *    data structure for storing all the information about a language, plus
 *    miscellaneous control information
 */
struct kimmo_data {
	/*
	 *  parameters for controlling the Kimmo processing
	 */
	char		bLimit;		/* limit to a single good result */
	char		iTraceLevel;	/* enable tracing of Kimmo processes */
	char		bUsePATR;	/* enable parsing with PATR */
	char		bSilent;	/* disable stderr messages */
	char		bShowWarnings;	/* allow display of warning messages */
	char		bAlignment;	/* align recognizer output vertically*/
	unsigned char	cGlossBegin;	/* optionally surround morphnames */
	unsigned char	cGlossEnd;	/*    in synthesizer input string */
	unsigned char	cComment;	/* begins comment in input lines */
#define KIMMO_DEFAULT_COMMENT	';'
	FILE *		pLogFP;		/* output log FILE */
	/*
	 *  loaded or derived from the rules file
	 */
	unsigned char **	ppszAlphabet;	/* alphabet */
	unsigned short	uiAlphabetSize;	/* size of the alphabet */
	unsigned char	cNull;		/* null character */
	unsigned char	cAny;		/* wild card character */
	unsigned char	cBoundary;	/* word boundary character */
#define KIMMO_ALPHA_MAX		252
#define KIMMO_ALPHA_NULL	253
#define KIMMO_ALPHA_BOUNDARY	254
#define KIMMO_ALPHA_ANY		255
	char		bTwoLCFile;	/* rules loaded from TwoLC type file */
	KimmoSubset *	pSubsets;	/* alphabet subsets */
	unsigned short	uiSubsetCount;	/* number of alphabet subsets */
	KimmoRule *		pAutomata;	/* array of automata (KimmoRule)
					   structures */
	unsigned short	uiAutomataSize;	/* number of rules in automata */
	KimmoPair *		pFeasiblePairs;	/* array of feasible pairs */
	unsigned short	uiFeasiblePairsCount;	/* number of feasible pairs */
	char *		pszRulesFile;
	/*
	 *  loaded from the lexicon file
	 */
	KimmoAlternation *	pAlternations;		/* array of alternations */
	unsigned short	uiAlternationCount;	/* number of alternations */
	KimmoLexicon *	pLexiconSections;	/* sections of the lexicon */
	KimmoLexicon *	pInitialLexicon;	/* first ("INITIAL") section of
						   lexicon */
	unsigned short	uiLexiconSectionCount;	/* number of sections in the
						   lexicon */
	unsigned char **	ppszFeatures;		/* array of possible feature
						   strings */
	unsigned short	uiFeatureCount;		/* number of feature strings */
	char *		pszLexiconFile;
	/*
	 *  loaded from the grammar file
	 */
	PATRData		sPATR;
	};

/****************************************************************************
 * NAME
 *    typedef KimmoResult
 * DESCRIPTION
 *    data structure for storing a linked list of PC-Kimmo results
 */
struct kimmo_result {
	KimmoResult *	pNext;
	unsigned char *	pszSynthesis;
	KimmoMorpheme *	pAnalysis;
	PATREdgeList *	pParseChart;
	unsigned char *	pszResult;
	unsigned char *	pszGloss;
	short		bOkay;
	};

/*****************************************************************************
 *  Function prototypes
 */
/*
 *  generate.c
 */
extern KimmoResult *	applyKimmoGenerator P((unsigned char * pszLexForm_in,
						   KimmoData *     pKimmo_in));
/*
 *  recogniz.c
 */
extern KimmoResult *	applyKimmoRecognizer P((
						 unsigned char * pszSurfaceForm_in,
						 KimmoData *     pKimmo_in));
/*
 *  synthesi.c
 */
extern KimmoResult *	applyKimmoSynthesizer P((
						   unsigned char * pszMorphemes_in,
						   KimmoData *     pKimmo_in));
/*
 *  lexicon.c
 */
extern int	loadKimmoLexicon P((unsigned char * pszLexiconFile_in,
					int             eLexiconType_in,
					KimmoData *     pKimmo_io));
#define KIMMO_ANALYSIS	0
#define KIMMO_SYNTHESIS	1
extern void	freeKimmoLexicon P((KimmoData * pKimmo_io));
extern void	writeKimmoLexiconSectionNames P((FILE * pOutputFP_in,
						 KimmoData * pKimmo_in));
extern int	writeKimmoLexiconSection P((unsigned char *   pszLexSection_in,
						FILE *            pOutputFP_in,
						KimmoData *       pKimmo_in));
extern size_t	uiKimmoCharArraySize_g;
extern size_t	uiKimmoShortArraySize_g;
extern size_t	uiKimmoLexItemArraySize_g;
/*
 *  rules.c
 */
extern int	loadKimmoRules P((unsigned char * pszRuleFile_in,
				  KimmoData *     pKimmo_io));
extern void	freeKimmoRules P((KimmoData * pKimmo_io));
extern void	writeKimmoFeasiblePairs P((FILE *      pOutputFP_in,
					   KimmoData * pKimmo_in));
extern void	writeKimmoRule P((unsigned    uiRuleNumber_in,
				  FILE *      pOutputFP_in,
				  KimmoData * pKimmo_in));
extern void	writeKimmoRulesStatus P((FILE *      pOutputFP_in,
					 KimmoData * pKimmo_in));
extern void	setKimmoRuleStatus P((int         iRule_in,
					  int         bValue_in,
					  KimmoData * pKimmo_io));
extern int	checkKimmoRuleStatus P((int         iRule_in,
					KimmoData * pKimmo_in));
/*
 *  pckfuncs.c
 */
extern void	freeKimmoResult P((KimmoResult *resp, KimmoData * pKimmo_in));
extern void	writeKimmoResults P((KimmoResult * pResults_in,
					 FILE *        pOutputFP_in,
					 KimmoData *   pKimmo_in));
extern unsigned char *	concatKimmoMorphLexemes P((
						  KimmoMorpheme * pMorphemes_in,
						  char *          pszSeparate_in,
						  KimmoData *     pKimmo_in));
extern unsigned char *	concatKimmoMorphGlosses P((
						  KimmoMorpheme * pMorphemes_in,
						  char *          pszSeparate_in,
						  KimmoData *     pKimmo_in));
extern unsigned char *	concatKimmoMorphFeatures P((
						  KimmoMorpheme * pMorphemes_in,
						  char *          pszSeparate_in,
						  KimmoData *     pKimmo_in));
/*
 *  kimmdata.c
 */
extern const int	iKimmoVersion_g;
extern const int	iKimmoRevision_g;
extern const int	iKimmoPatchlevel_g;
extern const char	cKimmoPatchSep_g;
extern const char *	pszKimmoDate_g;
extern const char *	pszKimmoYear_g;
#ifdef __DATE__
extern const char *	pszKimmoCompileFormat_g;
extern const char *	pszKimmoCompileDate_g;
extern const char *	pszKimmoCompileTime_g;
#else
extern const char *	pszKimmoTestVersion_g;
#endif
extern int		bCancelKimmoOperation_g;

#ifdef __cplusplus
}
#endif
#endif /*_KIMMO_H_INCLUDED_*/
