/* AMPLE.H - definitions/declarations for AMPLE library
 ***************************************************************************
 * Copyright 1988, 2002 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _AMPLE_H_INCLUDED_
#define _AMPLE_H_INCLUDED_
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
extern char * strchr  P((const char * s, int c));
extern char * strrchr P((const char * s, int c));
extern char * strstr  P((const char * s, const char * t));
extern char * strpbrk P((const char * s, const char * t));
extern char * strcpy  P((char * s, const char * t));
extern char * strcat  P((char * s, const char * t));
extern char * strncpy P((char * s, const char * t, size_t len));
extern int    strcmp  P((const char * s, const char * t));
extern size_t strlen  P((const char * s));
extern size_t strspn  P((const char * s, const char * accept));
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern VOIDP  memcpy  P((VOIDP d, const VOIDP s, size_t n));
extern VOIDP  bsearch P((const VOIDP key, const VOIDP base,
			 size_t nmemb, size_t size,
			 int (* compar)(const VOIDP, const VOIDP)));
#endif /* STDC_HEADERS */
#if _MSC_VER >= 800
#include <io.h>			/* MSC Visual C/C++ needs this */
#endif
/* SIL library headers */
#include "cportlib.h"
#include "opaclib.h"
#include "stample.h"		/* declarations shared with STAMP */

typedef struct ample_allomorph AmpleAllomorph;

typedef struct ample_fnlist		AmpleTestList;
typedef struct ample_pairlist		AmplePairList;
typedef struct ample_morph_constraint	AmpleMorphConstraint;
#ifdef EXPERIMENTAL
#ifndef hab350
typedef struct ample_never_constraint	AmpleNeverConstraint;
#endif /* hab350 */
#endif /* EXPERIMENTAL */
typedef struct ample_hlalist		AmpleHeadlistList;
typedef struct ample_morpheme		AmpleMorpheme;
typedef struct ample_data		AmpleData;
#ifdef EXPERIMENTAL
typedef struct ample_parse_list		AmpleParseList;
#include "patr.h"		/* PC-PATR declarations */
#endif /* EXPERIMENTAL */

/*
 *  internal temporary storage used in creating dictionary entries
 */
#define MAXALPS 10      /* maximum number of allomorphs in temp storage */

/*****************************************************************************
 * NAME
 *    AmpleAllomorphList (struct ample_alist)
 * DESCRIPTION
 *    allomorph list to be allocated temporarily
 */
typedef struct ample_alist {
	AmpleAllomorph *		pAllomorph;
	char *			pszAllomorph;
	char			bMallocString;
	struct ample_alist *	pNext;
	} AmpleAllomorphList;

/*****************************************************************************
 * NAME
 *    AmpleData
 * DESCRIPTION
 *    information that controls the AMPLE parsing
 */
struct ample_data {
	/*
	 *  information provided directly by the user
	 */
	unsigned char	   bDebugAllomorphConds;	/* -a */
	unsigned char	   bEnableAllomorphIDs;		/* -b */
	unsigned char	   cBeginComment;		/* -c */
	unsigned char	   bRootGlosses;		/* -g */
	unsigned char	   bQuiet;			/* -q */
#define DEFAULTTRIEDEPTH     (3) /* upped by one md 2005 - as Unicode likes that */
	int			   iMaxTrieDepth;		/* -d */
	int			   iMaxMorphnameLength;		/* -n */
	int			   eTraceAnalysis;		/* -t */
#define AMPLE_TRACE_OFF		0
#define AMPLE_TRACE_ON		1
#define AMPLE_TRACE_SGML	2
#define AMPLE_TRACE_XML 	3
	char *		   pszTrace;
	size_t		   uiTraceSize;
	int			   iOutputFlags;		/* -w, -x */
	int			   iDebugLevel;			/* -/ */
#ifndef hab365
	int			   iMaxAnalysesToReturn;	/* only used by XAmple.dll */
#define MAX_ANALYSES_TO_RETURN_NO_LIMIT -1
#endif
	FILE *		   pLogFP;
	/*
	 *  information loaded from the selective analysis file
	 */
	char *		   pszSelectiveAnalFile;
	StringList *	   pSelectiveAnalMorphs;
	/*
	 *  information loaded from the text input control file
	 */
	TextControl		   sTextCtl;
	/*
	 *  information loaded from the "analysis data" (control) file
	 */
	char *		   pszAnalysisDataFile;
	AmpleTestList *	   pPrefixSuccTests;	/* \\pt */
	AmpleTestList *	   pRootSuccTests;	/* \\rt */
	AmpleTestList *	   pSuffixSuccTests;	/* \\st */
	AmpleTestList *	   pInfixSuccTests;	/* \\it */
	AmpleTestList *	   pInterfixSuccTests;	/* \\nt */
	AmpleTestList *	   pFinalTests;		/* \\ft */
	/* defunct item */				/* \\tc */
	int			   eWriteCategory;	/* \\cat */
#define AMPLE_NO_CATEGORY	    0	/* no word category guessing */
#define AMPLE_SUFFIX_CATEGORY	1	/* last suffix has word category */
#define AMPLE_PREFIX_CATEGORY	2	/* first prefix has word category */
#define AMPLE_COMPUTED_CATEGORY 3   /* the word category must be computed */
#ifndef hab340
#define AMPLE_AFFIX             3   /* used to filter the affix out, e.g. when
			there are multiple \cat fields (analda.c) or to process (anal.c) */
#define AMPLE_COMPOUND_ROOT_LEFTHEAD  4	/* compound roots are left headed */
#define AMPLE_COMPOUND_ROOT_RIGHTHEAD 8	/* compound roots are righ headed */
#define AMPLE_COMPOUND_ROOT          12	/* used to reset compound setting
					   when there are multiple \catcr fields */
#endif /* hab340 */
	int			   bWriteMorphCats;
	StringList *	   pCategories;		/* \\ca */
	AmpleCategoryClass *   pCategoryClasses;	/* \\ccl */
	char		   cBeginRoot;		/* \\rd */
	char		   cEndRoot;
	StringClass *	   pStringClasses;	/* \\scl (other files also) */
	PunctClass *	   pPunctClasses;	/* \\pcl 3.3.0 hab */
	AmplePairList *	   pInfixAdhocPairs;	/* \\iah */
	AmplePairList *	   pPrefixAdhocPairs;	/* \\pah */
	AmplePairList *	   pRootAdhocPairs;	/* \\rah */
	AmplePairList *	   pSuffixAdhocPairs;	/* \\sah */
	AmplePairList *	   pInterfixAdhocPairs;	/* \\nah */
	unsigned char *	   pCompoundRootPairs;	/* \\cr */
	AmpleMorphClass *	   pMorphClasses;	/* \\mcl */
	AmpleProperties	   sProperties;		/* \\ap, \\mp */
	StringList *	   pPropertySets;	/*  (help conserve memory) */
	int			   iMaxPrefixCount;	/* \\maxp */
	int			   iMaxInfixCount;	/* \\maxi */
	int			   iMaxRootCount;	/* \\maxr */
	int			   iMaxSuffixCount;	/* \\maxs */
	int			   iMaxInterfixCount;	/* \\maxn */
	AmpleMorphConstraint * pMorphConstraints;	/* \\mcc */
#ifdef EXPERIMENTAL
#ifndef hab350
	AmpleNeverConstraint * pNeverConstraints;	/* \\ancc */
#endif /* hab350 */
#endif /* EXPERIMENTAL */
	int			   iMaxNullCount;	/* \\maxnull */
	char *		   pszValidChars;	/* \\strcheck */
	int			   bDictionaryCapitals;	/* \\dicdecap */
	/*
	 *  information loaded from the dictionary codes file
	 */
	char *		   pszDictionaryCodesFile;
	CodeTable *		   pPrefixTable;
	CodeTable *		   pInfixTable;
	CodeTable *		   pSuffixTable;
	CodeTable *		   pRootTable;
	CodeTable *		   pDictTable;
	/*
	 *  information loaded from the AMPLE dictionaries
	 */
	StringList *	   pDictionaryFiles;
	Trie *		   pDictionary;
	AmpleMorpheme *	   pAmpleMorphemes;
	AmpleAlloEnv *	   pAllomorphEnvs;
	unsigned char	   iInfixLocations;	/* AMPLE_PFX, AMPLE_ROOT,
						   and/or AMPLE_SFX */
	StringList *	   pEnvStrings;	/* used for space optimization */
	StringList *	   pCatSets;	/* used for space optimization */
	/*
	 *  information loaded from the dictionary orthography change file
	 */
	char *		   pszDictOrthoChangeFile;
	Change *		   pDictOrthoChanges;
	/*
	 *  parsing variables
	 */
	short		   bMorphemeLookahead;
	short		   bLookaheadDone;
	short		   bMultiDependency;
	/*
	 *  dynamic array of morphnames  (hab 3.2.5)
	 */
	char **     	   ppszMorphNames;
	int	                   iMorphNameCount;	/* # of morphnames in array */
	/*
	 *  dynamic array of allomorphs (hab 3.2.5)
	 */
	AmpleAllomorph **	   ppAllomorphs;
	/*
	 *  number of allomorphs in array (hab 3.2.5)
	 */
	int			   iAllomorphCount;
	/*
	 * list of partial reduplication allomorphs
	 */
	PartialReduplication * pPartialRedupAllos;
	/*
	 * list of full reduplication allomorphs
	 */
	FullReduplication * pFullRedupAllos;
	/*
	 *  pointer to head of strlist containing root morphname exceptions;
	 *  needed only for checking morphname references  (hab 3.2.5)
	 */
	StringList *	   pRootMorphnameExceptions;
	/*
	 *  number of records processed for a dictionary (hab 3.2.5)
	 */
	unsigned		   uiRecordCount;
	/*
	 *  pointer to the tail of the list of morphemes (hab 3.2.5)
	 */
	AmpleMorpheme *	   pLastMorpheme;
	/*
	 *  dictionary error message header (hab 3.2.5)
	 */
	char *	           pszAmpleDictErrorHeader;
	/*
	 *  dictionary type (hab 3.2.5)
	 */
	char *	           pszDicType;
	/*
	 *  size of morphname variable (hab 3.2.5)
	 */
	int	                   iMorphnameSize;
#ifdef EXPERIMENTAL
	/*
	 *  PC-PATR grammar information
	 */
	StringList *	   pPATRCategories;	/* loaded from dictionary */
	PATRData		   sPATR;		/* loaded from grammar file */
	unsigned long	   uiPATRCallCount;	/* number of times called */
	unsigned long	   uiPATRFailCount;	/* number of times failed */
	unsigned long	   uiPATRSkipCount;	/* number of times skipped */
#endif
	/*
	 *  internal temporary storage used in creating dict entries (hab 3.2.5)
	 */
	int                    iAlloListIndex;
	AmpleAllomorphList     asAlloList[MAXALPS];
	};

/*****************************************************************************
 * NAME
 *    AmpleWord
 * DESCRIPTION
 *    the representation of a word analyzed by AMPLE
 */
typedef struct {
	WordTemplate *	pTemplate;
	/*
	 *  the following are used internally by AMPLE
	 */
	AmpleHeadlistList *	pHeadlists;
	char *		pszRemaining;
	unsigned		uiAmbigCount;
	int			bFoundRoot;
	int			bUsesPrevWord;
	int			bUsesNextWord;
#ifdef EXPERIMENTAL
	AmpleParseList *	pParses;
#endif /* EXPERIMENTAL */

	} AmpleWord;

/*
 *  AMPLE morpheme types
 */
#define AMPLE_PFX	0x02
#define AMPLE_ROOT	0x01
#define AMPLE_SFX	0x04
#define AMPLE_IFX	0x06
  /* NFX = interfix; these must also be one of the other affix types */
#define AMPLE_NFX	0x08
#define AMPLE_NFXPFX	0x0A
#define AMPLE_NFXSFX	0x0C
#define AMPLE_NFXIFX	0x0E
#define AMPLE_UNIFIED	0x0F

#ifndef hab3312
  /* (moved from anal.c) */
/*****************************************************************************
 * NAME
 *    AmpleAmlist (struct ample_amlist)
 * DESCRIPTION
 *    amlist produced by get_entries
 */
typedef struct ample_amlist {
	AmpleAllomorph *	amp;
	int			alen;		/* length of allomorph string */
	struct ample_amlist *amlink;
	} AmpleAmlist;
/*
 *  getAllAllomorphs states
 */
#define AMPLE_STATE_BOW     	0x01
#define AMPLE_STATE_PREFIX  	0x02
#define AMPLE_STATE_ROOT    	0x04
#define AMPLE_STATE_INTERFIX    0x08
#define AMPLE_STATE_SUFFIX  	0x10
#define AMPLE_STATE_EOW     	0x20
#endif /* hab3312 */
/*
 *  global functions available for AMPLE parsing
 */
/* analda.c */
extern int loadAmpleControlFile P((const char * pszInputFile_in,
				   AmpleData *  pAmple_io));
extern void resetAmpleData P((AmpleData * pAmple_io));

/* loadcc.c */
extern int loadAmpleDictOrthoChanges P((const char * pszDictOrthoFile_in,
					AmpleData *  pAmple_io));

/* loadtb.c */
extern int loadAmpleDictCodeTables P((const char * pszCodesFile_in,
					  AmpleData *  pAmple_io));
extern void reportAmpleDictCodeTable P((int	    eType_in,
					AmpleData * pAmple_in));

/* setsd.c */
extern int	loadAmpleDictionary	P((const char * pszDictFile_in,
					   int		eDictType_in,
					   AmpleData *	pAmple_io));
extern void	initAmpleMorphChecking	P((int          bCheckMorphs_in,
					   AmpleData *	pAmple_io));
extern void	checkAmpleMorphs	P((int bCheckMorphs_in,
					   AmpleData * pAmple_in,
					   int bFreeSpaceWhenDone)); /* 3.3.3 hab */
extern void	freeAmpleDictionary	P((AmpleData * pAmple_io));
extern int	updateAmpleDictEntry	P((const char * pszEntry_in,
					   AmpleData * pAmple_io));
extern int	removeFromAmpleDictionary P((char * pszMorphName_in,
						 unsigned eType_in,
						 AmpleData * pAmple_io));

/* anal.c */
extern unsigned	performAmpleAnalysis P((AmpleWord * pThisWord_io,
					AmpleWord * pPreviousWord_in,
					AmpleWord * pNextWord_in,
					AmpleData * pAmple_in));
extern unsigned	analyzeAmpleWord P((AmpleWord * pThisWord_io,
					AmpleData * pAmple_in));
extern unsigned	refineAmpleAnalysis P((AmpleWord * pThisWord_io,
					   AmpleWord * pPreviousWord_in,
					   AmpleWord * pNextWord_in,
					   AmpleData * pAmple_in));
extern void	initiateAmpleTrace P((AmpleData * pAmple_in));
extern void	terminateAmpleTrace P((AmpleData * pAmple_in));
#ifdef EXPERIMENTAL
extern void	writeAmpleParses P((FILE *           pOutputFP_in,
					AmpleParseList * pParses_in,
					AmpleData *      pAmple_in));
#endif /* EXPERIMENTAL */
extern void	eraseAmpleWord P((AmpleWord * pWord_in,
				  AmpleData * pAmple_in));
#ifndef hab3312
extern AmpleAmlist * getAllAllomorphs P((char * pszRestOfWord_in,
					 int         iState_in,
					 AmpleData * pAmple_in));
#endif /* hab3312 */

/* putsd.c */
extern void writeAmpleDictionary P((const char * pszFilename_in,
					AmpleData *  pAmple_in));

/* writests.c */
extern void	writeAmpleTests	P((const char * pszType_in,
				   AmpleData *  pAmple_in));

/* select.c */
extern int	loadAmpleSelectiveAnalFile P((const char * pszFilename_in,
						  AmpleData *  pAmple_io));
extern void	addAmpleSelectiveAnalItem P((const char * pszMorphs_in,
						 AmpleData *  pAmple_io));
extern void	freeAmpleSelectiveAnalInfo P((AmpleData * pAmple_io));
/*
 *  global variables
 */
extern const int	iAmpleVersion_g;
extern const int	iAmpleRevision_g;
extern const int	iAmplePatchlevel_g;
extern const char	cAmplePatchSep_g;
extern const char *	pszAmpleDate_g;
extern const char *	pszAmpleYear_g;
#ifdef __DATE__
extern const char *	pszAmpleCompileFormat_g;
extern const char *	pszAmpleCompileDate_g;
extern const char *	pszAmpleCompileTime_g;
#else
extern const char *	pszAmpleTestVersion_g;
#endif

#ifdef __cplusplus
}
#endif
#endif /*_AMPLE_H_INCLUDED_*/
