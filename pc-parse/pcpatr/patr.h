/* PATR.H - PC-PATR global parser data structures and function prototypes
 ******************************************************************************
 * Copyright 1987, 2000 by SIL International.  All rights reserved.
 */
#ifndef _PATR_H_INCLUDED_
#define _PATR_H_INCLUDED_
#ifdef __cplusplus
extern "C" {
#endif
#include <stdio.h>
#include <ctype.h>
#include <setjmp.h>
#include <errno.h>
#include <time.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#define strrchr rindex
#endif
extern VOIDP  memmove P((VOIDP dest, const VOIDP src, size_t n));
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strcpy  P((char * dest, const char * src));
extern char * strncpy P((char * dest, const char * src, size_t n));
extern char * strcat  P((char * dest, const char * src));
extern char * strncat P((char * dest, const char * src, size_t n));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strchr  P((const char * s, int c));
extern char * strrchr P((const char * s, int c));
extern char * strpbrk P((const char * s, const char * accept));
extern size_t strlen  P((const char * s));

extern int           atoi    P((const char * nptr));
extern unsigned long strtoul P((const char * nptr, char ** endptr, int base));
extern VOIDP         malloc  P((size_t size));
extern void          free    P((VOIDP ptr));
extern void          abort   P((void));
extern void          exit    P((int status));
extern char *        getenv  P((const char * name));
#endif
#ifndef EXIT_FAILURE
#define	EXIT_FAILURE	1	/* Failing exit status.  */
#define	EXIT_SUCCESS	0	/* Successful exit status.  */
#endif

#include "cportlib.h"
#include "opaclib.h"
/*
 *  macros for safely detecting ASCII whitespace characters
 */
#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif
/*
 * The following are convenient aliases for TRUE, FALSE, and NUL
 */
#ifndef TRUE
#define TRUE       1		/* must be nonzero */
#endif
#ifndef FALSE
#define FALSE      0		/* must be zero */
#endif
#ifndef NUL
#define NUL '\0'		/* the ASCII NUL character */
#endif
/*
 *  dummy category for root of bush
 */
#define PATR_BUSH_ROOT "?"
/*
 * The data structures in this file use type definitions of the form:
 *
 *    typedef struct {...} PATRData;
 * or
 *    typedef patr_word struct {...} PATRWord;
 *
 * These definitions make code more readable by simplifying constructs such as:
 *
 *   struct patr_word * pWord;          ->    PATRWord * pWord;
 *   malloc(sizeof(struct patr_word))   ->    malloc(sizeof(PATRWord))
 */
/*
 *  forward declarations of internal PATR data types
 */
typedef struct patr_grammar		PATRGrammar;
typedef struct patr_lexicon		PATRLexicon;
typedef struct patr_saved_feat		PATRSavedFeature;
typedef struct patr_saved_comp		PATRSavedComplex;
typedef struct patr_saved_disj		PATRSavedDisjunct;
typedef struct patr_alloc_feature	PATRAllocFeature;
typedef struct patr_alloc_complex	PATRAllocComplexFeature;
typedef struct patr_alloc_disjunct	PATRAllocFeatureDisjunction;
typedef struct patr_alloc_rule		PATRAllocRule;
typedef struct patr_alloc_rule_list	PATRAllocRuleList;
typedef struct patr_alloc_nonterm	PATRAllocNonterminal;
typedef struct patr_alloc_nonterm_list	PATRAllocStringList;
typedef struct patr_alloc_path		PATRAllocPath;
typedef struct patr_alloc_hash_list	PATRAllocHashList;
typedef struct patr_alloc_edge		PATRAllocEdge;
typedef struct patr_alloc_edge_list	PATRAllocEdgeList;
typedef struct patr_allow_word		PATRAllocWord;
typedef struct patr_allow_categ		PATRAllocWordCategory;
typedef struct patr_alloc_disp_feat	PATRAllocDisplayedFeature;
typedef struct patr_alloc_string	PATRAllocString;
typedef struct patr_copy_node		PATRFeatureCopy;
typedef struct patr_garbage		PATRGarbage;
typedef struct patr_displayed_feature	PATRDisplayedFeature;

/****************************************************************************
 * NAME
 *    PATRMemory
 * DESCRIPTION
 *    data structure for storing low-level PC-PATR operational data.  an
 *    instance of this data structure may be shared by multiple instances of
 *    PATRData.
 */
typedef struct patr_memory
	{
	/* used in unify.c */
	PATRSavedFeature *  pSavedFeatures;
	PATRSavedFeature *  pFreeSavedFeatures;
	PATRSavedComplex *  pSavedComplex;
	PATRSavedComplex *  pFreeSavedComplex;
	PATRSavedDisjunct * pSavedDisjunct;
	PATRSavedDisjunct * pFreeSavedDisjunct;
	int                 bPreserve;
	/* used in patrfunc.c */
	Trie *                 pStoredStringTable;
	PATRDisplayedFeature * pMultTop;
	int			   iCurrent;
	/* used in patalloc.c */
	unsigned long                 cFeatureAlloc;
	unsigned long                 cComplexAlloc;
	unsigned long                 cDisjunctAlloc;
	unsigned long                 cRuleAlloc;
	unsigned long                 cRuleAllocList;
	unsigned long                 cNontermAlloc;
	unsigned long                 cNontermAllocList;
	unsigned long                 cPathAlloc;
	unsigned long                 cHashListAlloc;
	unsigned long                 cEdgeAlloc;
	unsigned long                 cEdgeAllocList;
	unsigned long                 cWordAlloc;
	unsigned long                 cCategAlloc;
	unsigned long                 cDispFeatAlloc;
	unsigned long                 cStringAlloc;
	PATRAllocFeature *            pFeatureFree;
	PATRAllocComplexFeature *     pComplexFree;
	PATRAllocFeatureDisjunction * pDisjunctFree;
	PATRAllocRule *               pRuleFree;
	PATRAllocRuleList *           pRuleListFree;
	PATRAllocNonterminal *        pNontermFree;
	PATRAllocStringList *         pNontermListFree;
	PATRAllocPath *               pPathFree;
	PATRAllocHashList *           pHashListFree;
	PATRAllocEdge *               pEdgeFree;
	PATRAllocEdgeList *           pEdgeListFree;
	PATRAllocWord *               pWordFree;
	PATRAllocWordCategory *       pCategFree;
	PATRAllocDisplayedFeature *   pDispFeatFree;
	PATRAllocString *             pStringFree;
	PATRGarbage *                 pGarbage;
	PATRGarbage *                 pGarbageFree;
	/* used in copyfeat.c */
	PATRFeatureCopy * pFeatureCopyList;
	/* used in patrlexi.c */
	struct patr_lex_item_array * pHeadPATRLexItemArrays;
	struct patr_lex_item_array * pTailPATRLexItemArrays;
	size_t			 iPATRLexItemsAvailable;
	struct patr_char_array *	 pHeadPATRLexCharArrays;
	struct patr_char_array *	 pTailPATRLexCharArrays;
	size_t			 iPATRLexCharsAvailable;
	struct patr_short_array *	 pHeadPATRLexShortArrays;
	struct patr_short_array *	 pTailPATRLexShortArrays;
	size_t			 iPATRLexShortsAvailable;
	/* used in patrstrg.c and userpatr.c */
	DynString dstrOutput;
	/* used in userpatr.c */
	FILE * pPrintsFP;
	int	   iNextPosition;
	int	   bMoreTree;
	int	   iPrintDepth;
} PATRMemory;

/****************************************************************************
 * NAME
 *    PATRData
 * DESCRIPTION
 *    data structure for storing PC-PATR control data
 */
typedef struct
{
	char	bFailure;	/* display parser failures */
	char	bUnification;	/* enable unification */
	char	eTreeDisplay;	/* tree display mode */
#define PATR_NO_TREE		0
#define PATR_FLAT_TREE		1
#define PATR_FULL_TREE		2
#define PATR_INDENTED_TREE	3
#define PATR_XML_TREE		4
	char	bGloss;		/* display glosses (if they exist) */
	char	bGlossesExist;	/* signal whether glosses exist */
	char	iFeatureDisplay; /* feature display mode bits */
#define PATR_FEATURE_ON		0x01
#define PATR_FEATURE_FLAT	0x02	/* "flat" or "full" format */
#define PATR_FEATURE_ALL	0x10	/* all features, or only top one */
#define PATR_FEATURE_TRIM	0x20	/* show null features explicitly */
#define PATR_FEATURE_ONCE	0x40	/* expand coindexed once (first time),
					   or every time */
	char	bCheckCycles;	/* enable checking for parse cycles */
	char	bTopDownFilter;	/* enable top down filtering */
	unsigned short iMaxAmbiguities; /* max number of ambiguities to show */
	unsigned short iDebugLevel;	/* degree of debugging output desired */
	char	cComment;	/* begins a comment in an input line */
#define PATR_DEFAULT_COMMENT ';'
	char	bSilent;	/* disable messages to stderr */
	char	bShowWarnings;	/* enable warnings as well as error messages */
	char	bPromoteDefAtoms; /* promote default atoms before parsing */
	char	bPropIsFeature;	/* AMPLE property is feature template name */
#ifndef hab130
	char	eRootGlossFeature; /* rootgloss feature mode*/
#define PATR_ROOT_GLOSS_NO_FEATURE	0 /* no rootgloss feature */
#define PATR_ROOT_GLOSS_ON      	1 /* use rootgloss feature */
				/* following use rootgloss feature & are
				   special cases for when the input is an
				   ANA file */
#define PATR_ROOT_GLOSS_LEFT_HEADED	2 /* use leftmost ANA root */
#define PATR_ROOT_GLOSS_RIGHT_HEADED	3 /* use rightmost ANA root */
#define PATR_ROOT_GLOSS_USE_ALL 	4 /* use all ANA roots */
#endif /* hab130 */
	time_t	iMaxProcTime;	/* max number of seconds to process */
	FILE *	pLogFP;
	StringList *	pFinalPunc;	/* sentence final punctuation chars */

	const char *	pszGrammarFile;
	PATRGrammar *	pGrammar;
	int			iGrammarSelection;	/* used in garbage collection*/
	/*
	 *  field markers for the lexicon file
	 */
	const char *	pszRecordMarker;
	const char *	pszWordMarker;
	const char *	pszGlossMarker;
	const char *	pszCategoryMarker;
	const char *	pszFeatureMarker;
#ifndef hab130
	const char *        pszRootGlossMarker;
#endif /* hab130 */
	PATRLexicon *	pLexicon;
	/*
	 *  values used for internal processing
	 */
	int			iCurrentIndex;	/* index number of current edge */
	int			iParseCount;	/* number of parses found */
	PATRMemory *        pMem;		/* can be shared by multple PATRData */
	unsigned long	uiEdgesAdded;
	time_t		iStartTime;
	PATRGarbage *	pStartGarbage;
} PATRData;
/*
 *  forward declaration of an internal PATR data type
 */
typedef struct patr_edge	PATREdge;

/*****************************************************************************
 * NAME
 *    PATREdgeList
 * DESCRIPTION
 *    data structure for list of pointers to parse chart edges
 */
typedef struct patr_edge_list {
	PATREdge *			pEdge;
	struct patr_edge_list *	pNext;
	} PATREdgeList;

/*
 *  forward declaration of an internal PATR data type
 */
typedef struct patr_categ	PATRWordCategory;

/*****************************************************************************
 * NAME
 *    PATRWord
 * DESCRIPTION
 *    data structure for representing one word (of the input sentence) in a
 *    list.
 *
 *    Picture of input sentence to parse:
 *
 *            PATRWord                        PATRWord
 *      word |word |word | word       word |word |word | word
 *     number|name |cats | ptr       number|name |cats | ptr
 *     |-----|-----|-----|-----|     |-----|-----|-----|-----|
 *     |  1  | the |  |  |  -------->|  2  | cat |  |  |  --------> ...
 *     |-----|-----|--|--|-----|     |-----|-----|--|--|-----|
 *                    |				    |
 *                    V  			    V
 *                   ...                           ...
 */
typedef struct patr_word {
	int			iWordNumber;	/* Number of word in sentence */
	char *		pszWordName;	/* the spelling of the word */
	PATRWordCategory *	pCategories;	/* Pointer to category list */
	struct patr_word *	pNext;		/* Link to next word in sentence */
	} PATRWord;

/*
 *  forward declaration of an internal PATR data type
 */
typedef struct patr_feature	PATRFeature;

/*****************************************************************************
 * NAME
 *    PATRLabeledFeature
 * DESCRIPTION
 *    this data structure is used for mapping from the top level
 *    feature structure returned by the applyKimmoRecognizer() parse to a set
 *    of atomic feature names to write in the \fd fields of the .ANA file
 */
typedef struct patr_labeled_feat
{
	char *			pszLabel;
	PATRFeature *		pFeature;
	struct patr_labeled_feat *	pNext;
} PATRLabeledFeature;

/*****************************************************************************
 * NAME
 *    PATRFeatureTags
 * DESCRIPTION
 *    data structure for holding the information relative to writing a PATR
 *    feature to an output file
 */
typedef struct patr_feat_tags
{
	StringList *		pFeaturePath;
	char *			pszStartTag;
	char *			pszEndTag;
	struct patr_feat_tags *	pNext;
} PATRFeatureTags;

/*
 *  forward declaration of an internal PATR data type
 */
typedef struct patr_lex_item	PATRLexItem;

/*****************************************************************************
 *  function prototypes
 */
/*
 *  grammar.c
 */
extern int	loadPATRGrammar P((const char * pszGrammarFile_in,
				   PATRData *   pPATR_io));
extern void	freePATRGrammar P((PATRData * pPATR_io));
/*
 *  lcparse.c
 */
extern PATREdgeList *	parseWithPATR	   P((PATRWord * pSentence_in,
						  int *      piStage_out,
						  PATRData * pPATR_io));
/*
 *  patrlexi.c
 */
extern int	loadPATRLexicon P((const char * pszLexiconFile_in,
				   PATRData * pPATR_io));
#ifdef hab130
extern void	addPATRLexItem P((char *	pszWord_in,
				  char *	pszGloss_in,
				  char *	pszCategory_in,
				  char *	pszFeatures_in,
				  PATRFeature * pFeature_in,
				  PATRData *    pPATR_io));
#else  /* hab130 */
extern void	addPATRLexItem P((char *	pszWord_in,
				  char *	pszGloss_in,
				  char *	pszRootGloss_in,
				  char *	pszCategory_in,
				  char *	pszFeatures_in,
				  PATRFeature * pFeature_in,
				  PATRData *    pPATR_io));
#endif /* hab130 */
extern void	freePATRLexicon P((PATRData * pPATR_io));
extern void	showPATRLexicon P((PATRData * pPATR_in));
extern void	writePATRLexicon P((FILE *     pOutputFP_in,
					PATRData * pPATR_in));
extern int	parseWithPATRLexicon P((
			char *           pszSentence_in,
			FILE *           pOutputFP_in,
			PATRLexItem * (* pfMorphParser_in)(char * pszWord_in),
			int              bWarnUnusedFd_in,
			PATRData *       pPATR_in));
/*
 *  patalloc.c
 */
extern void		markPATRParseGarbage P((PATRData * pPATR_io));
extern void		collectPATRParseGarbage P((PATRData * pPATR_io));
extern PATREdgeList *	storePATREdgeList P((PATREdgeList * pPATRResult_in,
						 PATRData * pPATR_in));
extern void		freePATREdgeList P((PATREdgeList * pPATRResult_io,
						PATRData * pPATR_in));
extern PATRFeature *	storePATRFeature P((PATRFeature * pFeature_in,
						PATRData * pPATR_in));
extern void		freePATRFeature P((PATRFeature * pFeature_io,
					   PATRData * pPATR_in));
/*
 *  patrfunc.c
 */
extern void		freePATRInternalMemory P((PATRData * pPATR_in));
extern PATRFeature *	parsePATRFeatureString P((char *     pszField_in,
						  PATRData * pPATR_in));
extern void	initPATRSentenceFinalPunctuation P((PATRData * pPATR_io));
extern void	clearPATRSentenceFinalPunctuation P((PATRData * pPATR_io));
extern void	addPATRSentenceFinalPunctuation P((PATRData * pPATR_io,
						   const char * pszChar_in));
/*
 *  amplpatr.c
 */
extern PATRWord *	buildPATRWord P((char *        pszLex_in,
					 char *        pszGloss_in,
					 char *        pszCat_in,
					 char *        pszFeatures_in,
					 PATRFeature * pPATRFeature_in,
					 PATRData *    pPATR_in));
/*
 *  cvtkp2wa.c
 */
#ifndef _KIMMO_H_INCLUDED_
#include "kimmo.h"
#endif
extern  WordAnalysis * convertKimmoPATRToWordAnalyses P((
					   KimmoResult *        pKimmoResult_in,
					   KimmoData *          pKimmo_in,
					   StringList *         pCategoryPath_in,
					   int                  cDecomp_in,
					   PATRLabeledFeature * pFdDefinitions_in,
					   WordAnalysis *       pAnalyses_io,
					   unsigned *           puiAmbigCount_io,
					   PATRData *           pPATR_in));
/*
 *  patrkimm.c
 */
extern PATRWord *	buildPATRWordForKimmo P((
						char *           pszLex_in,
						char *           pszGloss_in,
						char *           pszCat_in,
						unsigned short * puiFeatIndexes_in,
						char **          ppszFeatures_in,
						PATRData *       pPATR_in));
/*
 *  parsepwk.c
 */
extern PATRLexItem *	parseWithKimmoForPATRLexicon P((char *      pszWord_in,
							KimmoData * pKimmo_in,
							PATRData *  pPATR_in));
/*
 *  patrampl.c
 */
#ifndef _AMPLE_H_INCLUDED_
#include "ample.h"
#endif
extern PATRLexItem *	parseWithAmpleForPATRLexicon P((char *      pszWord_in,
							AmpleData * pAmple_in,
							PATRData *  pPATR_in));
extern int		parseAmpleSentenceWithPATR P((
					  WordTemplate ** pWords_in,
					  FILE *          pOutputFP_in,
					  char *          pszOutputFile_in,
					  int             bWarnUnusedFd_in,
					  int             bVerbose_in,
					  int             bWriteAmpleParses_in,
					  unsigned        uiSentenceCount_in,
					  TextControl *   pTextControl_in,
					  PATRData *      pPATR_in));
extern int		loadPATRLexiconFromAmple P((
						  const char *  pszAnalysisFile_in,
						  TextControl * pTextControl_in,
						  PATRData *    pPATR_in));
/*
 *  userpatr.c
 */
extern void	writePATRParses		P((PATREdgeList * pParses_in,
					   FILE *         pOutputFP_in,
					   WordTemplate ** ppWords_in,
					   TextControl *  pTextControl_in,
					   PATRData *     pPATR_in));
/*
 *  wrtstyle.c
 */
extern void	writePATRStyledOutput P((PATREdgeList *    pParses_in,
					 char *            pszWord_in,
					 char *            pszLex_in,
					 char *            pszGloss_in,
					 FILE *            pOutputFP_in,
					 PATRFeatureTags * pFeatTags_in,
					 char *            pszParseStartTag_in,
					 char *            pszParseEndTag_in,
					 PATRData *        pPATR_in,
					 unsigned *        puiAmbigCount_io));
/*
 *  patrstrg.c
 */
extern int stringifyPATRParses P((PATREdgeList * pParses_in,
				  PATRData *     pPATR_in,
				  const char *   pszSentence_in,
				  char **        ppszBuffer_out));
/*
 *  patrdata.c
 */
extern int		bCancelPATROperation_g;
extern const int	iPATRVersion_g;
extern const int	iPATRRevision_g;
extern const int	iPATRPatchlevel_g;
extern const char	cPATRPatchSep_g;
extern const char *	pszPATRDate_g;
extern const char *	pszPATRYear_g;
#ifdef __DATE__
extern const char *	pszPATRCompileFormat_g;
extern const char *	pszPATRCompileDate_g;
extern const char *	pszPATRCompileTime_g;
#else
extern const char *	pszPATRTestVersion_g;
#endif

#ifdef __cplusplus
}
#endif
#endif /* _PATR_H_INCLUDED_ */
