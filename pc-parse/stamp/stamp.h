/* STAMP.H - data structure definitions and function prototypes for STAMP
 ***************************************************************************
 * Copyright 1989, 2002 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _STAMP_H_INCLUDED_
#define _STAMP_H_INCLUDED_
#ifdef __cplusplus
extern "C" {
#endif

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <ctype.h>
#include <time.h>
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#define strrchr rindex
#endif
extern char * strchr  P((const char *s, int c));
extern char * strrchr P((const char *s, int c));
extern char * strstr  P((const char *s, const char *t));
extern char * strpbrk P((const char *s, const char *t));
extern char * strcpy  P((char *s, const char *t));
extern char * strncpy P((char *s, const char *t, size_t len));
extern int    strcmp  P((const char *s, const char *t));
extern size_t strlen  P((const char *s));
extern char * bsearch P((const VOIDP key, const VOIDP base,
			 size_t nmemb, size_t size,
			 int (*compar)(const VOIDP, const VOIDP)));
#endif /* STDC_HEADERS */
#if _MSC_VER >= 800
#include <io.h>			/* for _isatty(fd) */
#endif
/* SIL library headers */
#include "cportlib.h"
#include "opaclib.h"
#include "stample.h"	/* for declarations shared with AMPLE */

#ifdef TONEPARS
#include "tonepars.h"
#include "tone.h"		/* tone stuctures */
#endif /* TONEPARS */

/* UNIX-style names to Microsoft's equivalents. */
#ifdef _MSC_VER
#ifndef isascii
#define isascii __isascii
#endif
#endif

#ifndef myisspace
#define myisspace(x) (isascii(x) ? isspace(x) : FALSE)
#endif
/*
 *  for those who don't like embedded numbers for anything...
 */
#ifndef TRUE
#define TRUE    1       /* what do you think? */
#define FALSE   0
#endif
/*
 *  helpful names for special character values
 */
#ifndef NUL
#define NUL     '\0'    /* ASCII mnemonic */
#endif
/*
 *  sizes for misc buffers
 */
#define BUFSIZE  300            /* general size for scratch buffers */
#define MAXMORPH 64             /* maximum length of a morphname */

typedef struct stamp_test_list	StampTestList;
typedef struct stamp_action	StampAction;
typedef struct stamp_tr_rule	StampTransferRule;

/*****************************************************************************
 * NAME
 *    StampData
 * DESCRIPTION
 *    data structure that collects the global variables in one place
 */
typedef struct {
/*
 *  variables set by the command line options
 */
	/*
	 *  check root categories in synthesis?  [1.5a BJY]
	 */
	int				bMatchCategories;
	/*
	 *  do we generate all possible syntheses?
	 */
	int				bDoAllSyntheses;
	/*
	 *  do we trace parsing?
	 */
	int				bTrace;
	/*
	 *  report not finding dict entries? WM
	 */
	int				bReportNoEntries;
	/*
	 *  do we dump huge amounts of stuff?
	 */
	int				iDebugLevel;
	/*
	 *  comment marker for input records
	 */
	char			cComment;
	/*
	 *  work quietly without output to stderr
	 */
	int				bQuiet;
	/*
	 *  maximum depth of trie structure
	 */
	int				iMaxTrieLevel;
/*
 *  GLOBAL VARIABLES USED BY STAMP, set by tsinit() and used by tsproc()
 */
	/*
	 *  delimiter for beginning roots
	 */
	char			cBeginRoot;
	/*
	 *  delimiter for ending roots
	 */
	char			cEndRoot;
	/*
	 *  Which type being loaded
	 */
	int				eRuleType;
	/*
	 *  Total number of copy rules found
	 */
	int				iCopyRulesTotalCount;
	/*
	 *  Array to track copy rule execute
	 */
	int *			pabCopyRulesDone;
/*
 *  used only by tsinit() and friends
 */
	/*
	 *  Dictionary input orthochanges
	 */
	Change *			pDictOrthoChanges;
	/*
	 *  list of strings
	 */
	StringList *		pStringList;
	/*
	 *  ambiguity count
	 */
	unsigned			uiAmbiguityCount;
	/*
	 *  counters for morpheme environment constraints
	 */
	unsigned long		uiCalledMEC;
	unsigned long		uiMECFailed;
	/*
	 *  counters for string environment constraints
	 */
	unsigned long		uiCalledSEC;
	unsigned long		uiSECFailed;
	/*
	 *  counters for punctuation environment constraints  2.1b1 hab
	 */
	unsigned long		uiCalledPEC;
	unsigned long		uiPECFailed;
	/*
	 *  list of string classes used for environments and tests
	 */
	StringClass *		pStringClasses;
	/*
	 *  list of punctuation classes used for environments and tests 2.1b1 hab
	 */
	PunctClass *		pPunctClasses;
/*
 *  the dynamically allocated dictionary code tables
 */
	/*
	 *  unified dictionary codes
	 */
	CodeTable *			pDictTable;
	/*
	 *  prefix dictionary codes
	 */
	CodeTable *			pPrefixTable;
	/*
	 *  infix dictionary codes
	 */
	CodeTable *			pInfixTable;
	/*
	 *  root dictionary codes
	 */
	CodeTable *			pRootTable;
	/*
	 *  suffix dictionary codes
	 */
	CodeTable *			pSuffixTable;
	/*
	 *  Set by the text output control file
	 */
	TextControl			sTextCtl;
	/*
	 *  dictionary storage
	 */
	Trie *			pDictionary;
	/*
	 *  data used for categories
	 *
	 *  Categories are stored as a linked list of category names.  This
	 *  list is stored in the order that categories are loaded.
	 *  Categories are represented by a small integer, which effectively
	 *  gives the position in this list.  The limit on the number of
	 *  categories allowed is imposed by the size of the (unsigned)
	 *  integer which stores this external representation.
	 */
	StringList *		pCategories;
#if MAX_AMPLE_CATS > 255
	CRASH AND BURN!!!!!!!!          /* produce a compiler error */
#endif
	/*
	 *  list of category sets
	 */
	StringList *		pCategorySetsList;
	/*
	 *  data used for category classes
	 *
	 *  Category classes are stored as a linked list, with each node in
	 *  the linked list containing the name of the category class, and a
	 *  NUL-terminated byte array of the category numbers of the members
	 *  of the class.  This imposes a limit of 255 categories.
	 */
	AmpleCategoryClass *	pCategClasses;
	/*
	 *  data used for morpheme classes
	 */
	AmpleMorphClass *		pMorphClasses;
	/*
	 *  list of defined properties
	 */
	AmpleProperties		sProperties;
	/*
	 *  list of sets of properties
	 */
	StringList *		pPropertyList;
	/*
	 * MAX_RSC regular sound change markers: default is a single marker: '*'
	 */
#define MAX_RSC		4	/* the number of bits available to use */
	char			szRSCMarkers[MAX_RSC+1];
	/*
	 *  transfer lexical changes
	 */
	Trie *			pTransferLexChg;
	/*
	 *  ordered list of transfer rules
	 */
	StampTransferRule *		pTransferRules;
	/*
	 *  flag that synthesis is not being done
	 */
	int				bOnlyTransfer;
	/*
	 *  synthesis lexical changes
	 */
	Trie *			pSynthesisLexChg;
	/*
	 *  ordered list of synthesis tests
	 */
	StampTestList *		pSynthesisTests;
	/*
	 *  points to contents of \strcheck field (1.9z BJY) loaded from ??AD01.CTL
	 */
	char *			pszValidCharacters;
	/*
	 *  set of unique allomorph environment constraints
	 */
	AmpleAlloEnv *		pAlloEnvList;
	/*
	 *  log file pointer
	 */
	FILE *			pLogFP;
	/*
	 *  count of missing dictionary elements in synthesis
	 */
	unsigned long		uiMissingMorpheme;
#ifdef TONEPARS
	/*
	 * TonePars orthography changes
	 */
	Change *                    pTPOrthoChanges;
	/*
	 * syllable symbol string
	 */
	char *                      pszSylStr;
	/*
	 * syllable separation character
	 */
	char *                      pszSylSepChar;
	/*
	 * mora symbol string
	 */
	char *                      pszMoraStr;
	/*
	 * syllable algorithm method
	 */
	int                         iSylAlgorithm;
	/*
	 * syllable flags
	 */
					/* (do weight-by-position;     */
					/*  do vc.cv rather than v.ccv */
					/*    parsing when sonority is */
					/*    ambiguous; and           */
					/*  do codas)                  */
	int                         iSylFlags;
	/*
	 * do morpheme crossing
	 */
	int                         bDoMorphemeCrossing;
	/*
	 * phrase final characters
	 */
	char *                      pszPhraseFinalChars;
	/*
	 * tone bearing type (default: mora)
	 */
	int                         iTbuType;
	/*
	 * Segment definitions file name
	 */
	char *                      pszSegFileName;
	/*
	 * Segment definitions
	 */
	struct segment_list *       pSegments;
	/*
	 * try right edge rules flag
	 */
	int                         iTryRightEdgeRules;
				/* Initial and Final morphemes in current
				   analysis */
	struct stamp_analysis *pInitialMorpheme;
	struct stamp_analysis *pFinalMorpheme;
#endif /* TONEPARS */
	} StampData;

/*****************************************************************************
 * NAME
 *    StampAllomorph
 * DESCRIPTION
 *    This structure contains the information for an allomorph.
 */
typedef struct {
	char *		pszAllomorph;		/* the allomorph string */
	PropertySet_t	uAlloPropertySet;	/* allomorph properties */
	AmpleAlloEnv *	pAlloEnvironment;	/* the allomorph environment */
	} StampAllomorph;

/*****************************************************************************
 * NAME
 *    StampAllomorphList
 * DESCRIPTION
 *    This structure is a node in a linked list of allomorph structures.
 */
typedef struct stamp_allomorph_list {
	StampAllomorph		  a;	/* embedded allomorph structure */
	struct stamp_allomorph_list * pNext;	/* singly linked list */
	} StampAllomorphList;

/*****************************************************************************
 * NAME
 *    StampMorpheme
 * DESCRIPTION
 *    This structure contains the information for a morpheme.
 *    It is used by many other structures which refer to "morphemes".
 */
typedef struct {
	char *		 pszMorphname;	/* morpheme name string */
	unsigned char	 iMorphType;	/* bit fields for morpheme type */
	unsigned char	 iFromCategory;	/* incoming category */
	unsigned char	 iToCategory;	/* outgoing category */
	short		 iOrderClass;	/* affix orderclass (0 for roots) */
	StampAllomorphList * pAllomorphs;	/* list of allomorphs */
	union { unsigned char *	 pRootCategories; /* stored in dictionary */
			AmpleEnvConstraint * pInfixEnv;	/* infix environment */
		  }		 u;		/* (shared memory) */
#ifdef TONEPARS
	struct tone_list *pTones;		/* list of tones */
	int               iDomain;		/* domain type of this morpheme */
#endif /* TONEPARS */
	} StampMorpheme;
/*
 *  The lower four bits of the iMorphType byte tell the program what type of
 *  morpheme it's dealing with.  All of the code assumes the same treatment
 *  of these bits, which establish the basic distinction among prefixes,
 *  infixes, roots, and suffixes.
 */
#define MORPHTYPE_MASK 0x0F
#define PFX            0x01	/* prefix morpheme */
#define ROOT           0x02	/* root morpheme */
#define SFX            0x04	/* suffix morpheme */
#define IFX            0x08	/* infix morpheme */
#define STAMP_UNIFIED  0x0F
/*
 *  The upper four bits of the iMorphType byte are used in widely varying
 *  ways, partly dependent on what the code is doing, and then partly
 *  dependent on the setting of the lower four bits.
 */
#define RSC_MASK        0360    /* all four bits used to allow 4 types of
								 * proto-forms for roots */
#define RSC              020    /* lowest value for Regular Sound Change
				 * (others generated by shifting left) */
/*
 *  the infix location field indicates roughly where infixes are allowed, by
 *  mentioning the type of morpheme
 */
#define IFXLOC_MASK     0160
#define PFX_OK           020    /* infix can be located inside prefixes */
#define ROOT_OK          040    /* infix can be located inside roots */
#define SFX_OK          0100    /* infix can be located inside suffixes */

/*****************************************************************************
 * NAME
 *    StampAnalysis
 * DESCRIPTION
 *    This structure contains information for a morpheme in an analysis list.
 *    It's overkill for transfer, but for simplicity we use this in both
 *    transfer and synthesis.
 */
typedef struct stamp_analysis {
	StampMorpheme	m;		/* embedded morpheme structure */
	char *		pszAlloStart;	/* beginning of allo string in word */
	char *		pszAlloEnd;	/* end of allomorph string in word */
	StampAllomorph *	pCurrentAllo;	/* current allomorph being used */
	struct stamp_analysis *	pLeftLink;	/* doubly linked list */
	struct stamp_analysis *	pRightLink;
#ifdef TONEPARS
	struct root_node *pRNBeg;		/* first root node in morpheme */
	struct root_node *pRNEnd;		/* last  root node in morpheme */
	struct tbu       *pTBUBeg;		/* first tbu       in morpheme */
	struct tbu       *pTBUEnd;		/* last  tbu       in morpheme */
	struct tone      *pToneBeg;		/* first tone      in morpheme */
	struct tone      *pToneEnd;		/* last  tone      in morpheme */
#ifndef hab104
#ifndef TONEGEN
	PropertySet_t     uAlloPropertySet;	/* allomorph properties from ANA file*/
#endif /* TONEGEN */
#endif /* hab104 */
#endif /* TONEPARS */
#ifndef hab2111
#ifdef TONEGEN
	int                bDidSynthWordSave; /* note when saved synthesized form */
#endif /* TONEGEN */
#endif /* hab2111 */
	} StampAnalysis;

/*****************************************************************************
 * NAME
 *    StampAnalysisList
 * DESCRIPTION
 *    data structure for building of ambiguous analyses
 */
typedef struct stamp_anal_list {
	StampAnalysis *		pAnal;	/* pointer to analysis structure */
#ifndef hab2111
#ifndef TONEGEN
	char *                      pszSynthResult;
#endif /* TONEGEN */
#endif /* hab2111 */
	struct stamp_anal_list *	pNext;	/* pointer to next node in list */
	} StampAnalysisList;

/*****************************************************************************
 * NAME
 *    StampChangeMorphList
 * DESCRIPTION
 *    This structure contains the information for a morpheme in a lexical
 *    change or transfer rule.  It is a subset of the StampMorpheme, and
 *    only appears in linked lists for lexical changes and transfer rules.
 */
typedef struct stamp_change_morph_list {
	/*
	 *  for all lists, PFX, IFX, ROOT, SFX, LASTMORPH, FIRSTMORPH, CATCLASS,
	 *    and MORPHCLASS are used
	 *  for match lists, MORPHTYPE_MASK matches any type
	 *  for replace lists, MORPHTYPE_MASK requests output of the same type as
	 *    the matched input
	 */
	unsigned char	iMorphType;
	/*
	 *  for match lists, the number given by the user with a category or class
	 *  for replace lists, for categories or classes, the number of the element
	 *    from the match to use as a replacement
	 */
	unsigned char	iPos;
	/*
	 *  MORPHCLASS in the iMorphType field chooses between uMorph.pszName and
	 *    uMorph.pClass
	 *  for match lists, NULL means match based on category or category class
	 *  for replace lists, NULL means replace using the corresponding element
	 *    in the match.
	 */
	union { char *		pszName;	/* literal morpheme name */
			AmpleMorphClass *	pClass;		/* morpheme class */
		  }		uMorph;
	/*
	 *  for all lists, CATCLASS in the iMorphType field
	 *    chooses between uCat.iCode and uCat.pClass
	 */
	union { unsigned char	 iCode;
			AmpleCategoryClass * pClass;
		  }		uCat;
	struct stamp_change_morph_list *	pNext;	/* singly linked list */
	} StampChangeMorphList;
/*
 *  For the StampChangeMorphList data structure used in processing lexical
 *  changes and transfer rules, the upper four bits of the iMorphType byte
 *  indicate
 *	1) whether uMorph stores a morphname or a pointer to a morpheme class
 *	2) whether uCat stores a category code, or a pointer to a category
 *	   class
 *	3) FIRSTMORPH => ?
 *	4) LASTMORPH  => ?
 */
#define MORPHCLASS       020            /* use class, not name */
#define CATCLASS         040            /* use class, not code */
#define FIRSTMORPH      0100            /* first morph after boundary */
#define LASTMORPH       0200            /* last morph before boundary */

/*****************************************************************************
 * NAME
 *    StampWord
 * DESCRIPTION
 *    structure for holding complete information about a word and its
 *    punctuation and formatting environment
 */
typedef struct {
	/*
	 *  data read from the analysis file
	 */
	WordTemplate *	pTemplate;
	/*
	 *  list of analysis structures produced by "transfer", one per analysis
	 */
	StampAnalysisList *	pTrAnalyses;

	} StampWord;

/*****************************************************************************
 * NAME
 *    StampUnit
 * DESCRIPTION
 *
 */
typedef struct {
	StampWord *	pCurrentWord;
	StampWord *	pPreviousWord;
	StampWord *	pNextWord;
	/*
	 *   bStringLookahead signals whether we must look ahead to the string
	 *   environment of pNextWord before completing synthesis of pCurrentWord.
	 *   It is turned on while synthesizing pCurrentWord if pCurrentWord looks
	 *   ahead to the string environment of pNextWord.  It is left on until
	 *   pNextWord has become pCurrentWord, so that there is no attempt to
	 *   resynthesize a word which has already been synthesized.
	 */
	int		bStringLookahead;
	/*
	 *   bLookaheadDone signals whether lookahead has been done, so the string
	 *   environment of pNextWord is available.  If pCurrentWord looks ahead
	 *   to the string environment of pNextWord, bLookaheadDone is turned on
	 *   after pNextWord is synthesized.  It is left on until the word
	 *   following pNextWord becomes pCurrentWord.  Usage of bLookaheadDone is
	 *   as follows: if, while synthesizing pCurrentWord, it is necessary to
	 *   look ahead to the string environment of pNextWord, bLookaheadDone
	 *   signals whether or not pNextWord is already synthesized.
	 *   bLookaheadDone is also referenced in conjunction with bStringLookahead
	 *   during the synthesis process, to determine whether it is pCurrentWord
	 *   or pNextWord that is being synthesized.
	 */
	int				bLookaheadDone;
	/*
	 *  synthesis depends on strings of multiple words
	 */
	int				bMultiDependency;
} StampUnit;

/*****************************************************************************
 * NAME
 *    StampLexChange
 * DESCRIPTION
 *    This structure is used to store lexical changes in a linked list.
 */
typedef struct stamp_lexchange {
	StampChangeMorphList *	pMatch;	/* list of morphs to match */
					/* list of morphs to substitute */
	StampChangeMorphList *	pReplace;
	AmpleEnvConstraint *	pEnv;	/* morpheme environment constraint */
					/* ordering for insertion */
	short			iRestrictiveness;
	struct stamp_lexchange *	pNext;
	} StampLexChange;

/*************************************************************************
 * NAME
 *    action
 * DESCRIPTION
 *    Synthesis tests have an optional action associated with them.
 *    So far, only three types of actions have been defined.
 */
struct stamp_action
	{
	unsigned char		eType;		/* type of action */
	char *			pszString;	/* string for insertion,
						   message for report */
	short			iPosition;	/* position for insertion */
	struct stamp_action *	pNext;		/* for linked list of these */
	};
#define INSERT_BEFORE	1   /* insert "string" before <position> */
#define INSERT_AFTER	2   /* insert "string" after <position> */
#define REPORT		3   /* report test operation to user */

/*************************************************************************
 * NAME
 *    StampTestList
 * DESCRIPTION
 *    After being parsed by yyparse(), tests are stored in an ordered
 *    list together with any associated action also parsed by yyparse().
 */
struct stamp_test_list
	{
	AmpleTestNode *	pTest;		/* parse tree of this test */
	StampAction *	pAction;	/* action associated with this test */
	unsigned long	uiTestTrials;	/* count of times it's attempted */
	unsigned long	uiTestFailures;	/* count of times it's failed */
	struct stamp_test_list *	pNext;		/* pointer to next test */
	};

/*****************************************************************************
 * NAME
 *    StampTrFlag
 * DESCRIPTION
 *    This structure is used to store flag info for a transfer substitution
 *    or insertion rule.
 */
typedef struct tr_flag
	{
	unsigned char	bFlagComp;	/* nonzero if flag reference is
					 *    complemented */
	char *		pszFlagname;	/* name of the flag to check for */
	struct tr_flag *	pNext;		/* linked list of these */
	} StampTrFlag;

/*****************************************************************************
 * NAME
 *    StampTrSubstituteRule
 * DESCRIPTION
 *    This structure is used to store a transfer substitution rule.
 */
typedef struct {
	StampChangeMorphList *	pMatch;		/* morphs to match */
	StampChangeMorphList *	pReplace;	/* morphs to substitute */
	AmpleEnvConstraint *	pEnvironment;	/* morpheme environment
						   constraint */
	StampTrFlag  *		pFlags;		/* list of flags */
	} StampTrSubstituteRule;

/*****************************************************************************
 * NAME
 *    StampTrInsertRule
 * DESCRIPTION
 *    This structure is used to store a transfer insertion rule.
 */
typedef struct {
	StampChangeMorphList *	pInsert;	/* morphs to insert */
	AmpleEnvConstraint *	pEnvironment;	/* morpheme environment
						   constraint */
	StampTrFlag  *		pFlags;		/* list of flags */
	} StampTrInsertRule;

/*****************************************************************************
 * NAME
 *    StampTrFlagRule
 * DESCRIPTION
 *    This structure is used to store a transfer flag rule.
 */
typedef struct
	{
	char *		pszFlagname;	/* name of this flag */
	AmpleMorphlist *	pFlagMorphs;	/* morphnames which set this flag */
	} StampTrFlagRule;			/* (see stamp.h for morphlist def. */

/*****************************************************************************
 * NAME
 *    StampTransferRule
 * DESCRIPTION
 *    This structure is used to store the ordered list of transfer
 *    substitution, insertion, and flag rules.
 */
struct stamp_tr_rule
	{
	unsigned char	eType;
	union { StampTrSubstituteRule sSubRule;	/* substitution rule */
			StampTrInsertRule     sInsRule;	/* insertion rule */
			StampTrFlagRule       sFlagRule;	/* flag rule */
		  }		u;		/* (shared memory) */
	struct stamp_tr_rule *	pNext;		/* ordered, linked list */
	};
#define SUBRULE	 1              /* it's a substitution rule */
#define INSRULE  2              /* it's an insertion rule */
#define FLAGRULE 3              /* it's a flag rule */
#define COPYRULE 4              /* it's a copy rule */

/****************************************************************************
 * NAME
 *    StampMorphemeList
 * DESCRIPTION
 *    This structure is a node for a linked list of morpheme structures.
 *    NOTE:  (StampMorphemeList *)p->m.pszMorphname
 *        refers the morphname field of the embedded morpheme structure
 */
typedef struct stamp_morpheme_list
	{
	StampMorpheme			m;	/* embedded morpheme struct */
	struct stamp_morpheme_list *	mlink;	/* singly linked list */
	} StampMorphemeList;

/*****************************************************************************
 *  FUNCTION PROTOTYPES
 */
/*
 *  nonANSI standard library functions
 */
#ifndef isatty
extern int isatty P((int));
#endif
#ifndef fileno
extern int fileno P((FILE *));
#endif
#ifndef isascii
extern int isascii P((int));
#endif

/* transfer.c */
extern StampWord *	performStampTransfer P((StampUnit * pUnit_in,
						StampData * pStamp_in));

/* synth.c */
extern void		performStampSynthesis P((StampUnit * pUnit_in,
						 StampData * pStamp_in));

/* syntst.c */
extern void		addStampTest P((char *      src,
					StampData * pStamp_in));
extern void		writeStampTests P((FILE *      pOutputFP_in,
					   StampData * pStamp_in));
#ifndef hab217
extern int		applyStampTests P((StampAnalysis * headp,
					   char *          wordp,
					   StampAnalysis * curmp,
					   int             level,
					   StampUnit *     pUnit_in, /* 2.1b1 */
					   StampData *     pStamp_in));
#else
extern int		applyStampTests P((StampAnalysis * headp,
					   char *          wordp,
					   StampAnalysis * curmp,
					   StampUnit *     pUnit_in, /* 2.1b1 */
					   StampData *     pStamp_in));
#endif /* hab217 */
extern void		writeStampTestStatistics P((FILE *      pOutputFP_in,
							StampData * pStamp_in));

/* trules.c */
extern void		addStampFlagRule P((char *      str,
						StampData * pStamp_in));
extern void		addStampInsertionRule P((char *      str,
						 StampData * pStamp_in));
extern void		addStampSubstitutionRule P((char *      str,
							StampData * pStamp_in));
extern void		writeStampTransferRules P((FILE *      pOutputFP_in,
						   StampData * pStamp_in));
extern void		writeStampSubstitutionRule P((
					  StampTrSubstituteRule * subp,
					  FILE *                  pOutputFP_in,
					  StampData *             pStamp_in));
extern void		writeStampInsertionRule P((
						  StampTrInsertRule * insp,
						  FILE *              pOutputFP_in,
						  StampData *         pStamp_in));
extern void		writeStampFlagRule P((StampTrFlagRule * flgp,
						  FILE *            pOutputFP_in));

/* sytest.l */
extern int		stampyylex P((void));
extern void		stampyyrestart P((FILE * input_file));
extern void		setStampLexInput P((char * pszTest_in));
extern char *		getStampLexLocation P((void));
extern void		deleteStampCurrentYYBuffer P((void));

/* sytest.y */
extern AmpleTestNode *	parseStampTest P((char *         pszTest_in,
					  char *         pszTestErrorHeader_in,
					  StampAction ** ppTestActions_out,
					  StampData *    pStamp_in));
extern int		stampyyparse P((void));
extern void		stampyyerror P((char * s));

/* synrsc.c */
extern StampAnalysis *	applyStampRegSoundChanges P((
						   StampAnalysis * analp,
						   StampData *     pStamp_in));
extern void		addStampRegSoundChange P((char *      rscstring,
						  StampData * pStamp_in));
extern void		setStampRegSoundChangeMarkers P((
							   char *      str,
							   StampData * pStamp_in));
extern void		writeStampRegSoundChanges P((FILE *      pOutputFP_in,
							 StampData * pStamp_in));

/* lexchg.c */
extern StampAnalysis *	applyStampSynthesisLexChanges P((
						StampAnalysis * analp,
						StampUnit *     pUnit_in,
						StampData *     pStamp_in));
extern StampAnalysis *	applyStampTransferLexChanges P((
						StampAnalysis * analp,
						StampUnit *     pUnit_in,
						StampData *     pStamp_in));
extern void		writeStampSynthesisLexChanges P((
							  FILE *      pOutputFP_in,
							  StampData * pStamp_in));
extern void		writeStampTransferLexChanges P((
							  FILE *      pOutputFP_in,
							  StampData * pStamp_in));
extern Trie *		storeStampLexChange P((Trie *      pLexChgTrie_in,
						   char *      pszChg_in,
						   StampData * pStamp_in));

/* tmatch.c */
extern StampAnalysis *		checkStampTransferMatch P((
						   StampAnalysis *        analp,
						   StampChangeMorphList * matchp));
extern StampChangeMorphList *	parseStampTransferMatch P((
						char *       str,
						int          isrule,
						const char * pszErrorHeader_in,
						StampData *  pStamp_in));

/* treplace.c */
extern StampAnalysis *		replaceStampMorphemes P((
						StampAnalysis **       p_head,
						StampAnalysis *        first,
						StampAnalysis *        last,
						StampChangeMorphList * replace,
						StampData *            pStamp_in));
extern StampChangeMorphList *	parseStampTransferReplace P((
					  char *                 str,
					  int                    isrule,
					  StampChangeMorphList * matchlist,
					  const char *           pszErrorHeader_in,
					  StampData *            pStamp_in));

/* tsutil.c */
extern char *		getNextStampToken P((char * string,
						 char * buffer,
						 char * special));
extern StampAnalysis *	newStampAnalysis P((unsigned    morphtype,
						char *      morphname,
						char *      rootcatname,
						StampData * pStamp_in));
extern StampChangeMorphList *	newStampChangeMorph P((unsigned type,
							   void *   name));
extern void		freeStampAllomorphList P((StampAllomorphList * ap));
extern void		freeStampAnalysis P((StampAnalysis * analp));
extern void		freeStampChangeMorphList P((
						 StampChangeMorphList * pList_io));
extern void		freeStampMorpheme P((StampMorpheme * mp));
extern void		writeStampAnalysis P((StampAnalysis * analp,
						  FILE *          pOutputFP_in,
						  StampData *     pStamp_in));
extern void		writeStampBriefAnalysis P((StampAnalysis * analp,
						   StampAnalysis * currentp,
						   FILE *          pOutputFP_in,
						   StampData *     pStamp_in));
extern void		writeStampChangeMorphList P((
					   StampChangeMorphList * list,
					   FILE *                 pOutputFP_in,
					   StampData *            pStamp_in));
extern void		logMissingMorphemes P((StampAnalysis * analp,
						   StampWord *     wp,
						   StampData *     pStamp_in));
extern void		dumpStampWord P((StampWord * wp,
					 FILE *      pOutputFP_in));
extern char *		splitStampChangeString P((char * line,
						  char ** p_rep,
						  char ** p_marks,
						  char ** p_env));

/* tsdict.c */
extern StampMorpheme *	searchStampDictionary P((unsigned    type,
						 char *      name,
						 unsigned    category,
						 unsigned    catmatch,
						 StampData * pStamp_in));
extern void	addStampAllosToMorph P((StampAnalysis * mp,
				   unsigned        catmatch,
				   StampData *     pStamp_in));
extern int	loadStampDictionary P((const char * pszFilename_in,
					   int          eDicType_in,
					   StampData *  pStamp_in));
extern void	writeStampDictionary P((FILE *      pOutputFP_in,
					StampData *  pStamp_in));

#ifndef hab2111
#ifdef TONEGEN
extern void     writeStampDecomposition P((StampAnalysis * analp,
						 StampData *     pStamp_in));
#endif /* TONEGEN */
#endif /* hab2111 */

/* dtbio.c */
extern StampWord *	readStampWord P((FILE *        pInputFP_in,
					 TextControl * pTextCtl_in));
extern void		writeStampWord P((StampWord *   pWord_in,
					  FILE *        pOutputFP_in,
					  const char *  pszFilename_in,
					  StampData *   pStamp_in));
extern void		freeStampWord P((StampWord * word));

/* tsinit.c */
extern int	loadStampControlFile P((const char * pszFilename_in,
					StampData *  pStamp_io));
extern int	loadStampDictCodeTables P((const char * pszFilename_in,
					   StampData *  pStamp_io));
extern void	reportStampDictCodeTable P((int         eDicType_in,
						StampData * pStamp_in));
extern int	loadStampDictOrthoChanges P((const char * pszFilename_in,
						 StampData * pStamp_io));
extern int	loadStampSynthesisFile P((const char * pszFilename_in,
					  StampData *  pStamp_io));
extern int	loadStampTransferFile P((const char * pszFilename_in,
					 StampData *  pStamp_io));

/* envchk.c */
extern int	checkStampStringEnvironment P((char * leftstring,
						   int leftsize,
						   char * rightstring,
						   AmpleEnvConstraint * ec,
						   StampUnit *    pUnit_in,
						   StampData * pStamp_in));
				/* 2.1b1 hab */
extern int	checkStampPunctEnvironment P((char * leftstring,
						  int leftsize,
						  char * rightstring,
						  AmpleEnvConstraint * ec));

/* menvck.c */
extern int	checkStampMorphEnviron P((StampAnalysis *      left,
					  StampAnalysis *      right,
					  AmpleEnvConstraint * menv,
					  StampUnit *	       pUnit_in,
					  StampData *          pStamp_in));

/*****************************************************************************
 *  GLOBAL VARIABLES
 */
extern const int	iStampVersion_g;
extern const int	iStampRevision_g;
extern const int	iStampPatchlevel_g;
extern const char	cStampPatchSep_g;
extern const char *	pszStampDate_g;
extern const char *	pszStampYear_g;
#ifdef __DATE__
extern const char *	pszStampCompileFormat_g;
extern const char *	pszStampCompileDate_g;
extern const char *	pszStampCompileTime_g;
#else
extern const char *	pszStampTestVersion_g;
#endif

#ifdef __cplusplus
}
#endif
#endif /*_STAMP_H_INCLUDED_*/
