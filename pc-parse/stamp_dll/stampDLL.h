/* STAMPDLL.H - definitions/declarations for the STAMP Windows DLL
 ***************************************************************************
 * Copyright 2008 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */

#ifndef STAMP_DLL_INCLUDED
#define STAMP_DLL_INCLUDED
#ifdef __cplusplus

extern "C" {
#endif

#pragma once

#define DllExport	__declspec( dllexport )
#define DllImport   __declspec( dllimport )

#include "stamp.h"
#include "string.h"
#include <setjmp.h>

typedef struct stamp_setup StampSetup;

typedef const char * (/*CALLBACK*/ * STAMPFUNC5)(StampSetup *,
						 const char *,
						 const char *,
						 const char *,
						 const char *);
typedef const char * (/*CALLBACK*/ * STAMPFUNC4)(StampSetup *,
						 const char *,
						 const char *,
						 const char *);
typedef const char * (/*CALLBACK*/ * STAMPFUNC3)(StampSetup *,
						 const char *,
						 const char *);
typedef const char * (/*CALLBACK*/ * STAMPFUNC2)(StampSetup *,
						 const char *);
typedef const char * (/*CALLBACK*/ * STAMPFUNC1)(StampSetup *);
typedef StampSetup * (/*CALLBACK*/ * STAMPFUNC0)(void);

#define MAXAMBIG 15             /* maximum ambiguity range to keep track of */

/*****************************************************************************
 *  local global data
 */
/*
 *  control data
 */

static StampData	sStamp_m = {
	TRUE,		/* bMatchCategories               */
	FALSE,		/* bDoAllSyntheses                */
	FALSE,		/* bTrace                         */
	FALSE,		/* bReportNoEntries               */
	0,			/* iDebugLevel                    */
	'|',		/* cComment                       */
	FALSE,		/* bQuiet                         */
	2,			/* iMaxTrieLevel                  */
	'<',		/* cBeginRoot                     */
	'>',		/* cEndRoot                       */
	0,			/* eRuleType                      */
	0,			/* iCopyRulesTotalCount           */
	NULL,		/* pabCopyRulesDone               */
	NULL,		/* pDictOrthoChanges              */
	NULL,		/* pStringList                    */
	0,			/* uiAmbiguityCount               */
	0L,			/* uiCalledMEC                    */
	0L,			/* uiMECFailed                    */
	0L,			/* uiCalledSEC                    */
	0L,			/* uiSECFailed                    */
	0L,			/* uiCalledPEC        2.1b1 hab   */
	0L,			/* uiPECFailed        2.1b1 hab   */
	NULL,		/* pStringClasses                 */
	NULL,		/* pPunctClasses      2.1b1 hab   */
	NULL,		/* pDictTable                     */
	NULL,		/* pPrefixTable                   */
	NULL,		/* pInfixTable                    */
	NULL,		/* pRootTable                     */
	NULL,		/* pSuffixTable                   */
	{
	NULL,		/* sTextCtl.pszTextControlFile    */
	NULL,		/* sTextCtl.pLowercaseLetters     */
	NULL,		/* sTextCtl.pUppercaseLetters     */
	NULL,		/* sTextCtl.pCaselessLetters      */
	NULL,		/* sTextCtl.pOrthoChanges         */
	NULL,		/* sTextCtl.pOutputChanges        */
	NULL,		/* sTextCtl.pIncludeFields        */
	NULL,		/* sTextCtl.pExcludeFields        */
	'\\',		/* sTextCtl.cFormatMark           */
	'%',		/* sTextCtl.cAnaAmbig             */
	'%',		/* sTextCtl.cTextAmbig            */
	'-',		/* sTextCtl.cDecomp               */
	'|',		/* sTextCtl.cBarMark              */
	NULL,		/* sTextCtl.pszBarCodes           */
	TRUE,		/* sTextCtl.bIndividualCapitalize */
	TRUE,		/* sTextCtl.bCapitalize           */
	100		/* sTextCtl.uiMaxAmbigDecap       */
	},
	NULL,		/* pDictionary                    */
	NULL,		/* pCategories                    */
	NULL,		/* pCategorySetsList              */
	NULL,		/* pCategClasses                  */
	NULL,		/* pMorphClasses                  */
	{ NULL,0,0,255 },	/* sProperties                    */
	NULL,		/* pPropertyList                  */
	{ '*', 0,0,0,0 },	/* szRSCMarkers                   */
	NULL,		/* pTransferLexChg                */
	NULL,		/* pTransferRules                 */
	FALSE,		/* bOnlyTransfer                  */
	NULL,		/* pSynthesisLexChg               */
	NULL,		/* pSynthesisTests                */
	NULL,		/* pszValidCharacters             */
	NULL,		/* pAlloEnvList                   */
	NULL,		/* pLogFP                         */
	0L,			/* uiMissingMorpheme              */
	};

#ifndef hab34112
#ifdef EXPERIMENTAL
enum output_style { Ana, AResult, Ptext, FWParse };
#else /* EXPERIMENTAL */
enum output_style { Ana, AResult, Ptext };
#endif /* EXPERIMENTAL */
#endif /* hab34112 */


struct stamp_setup
{
	StampData     sData;
	char *        pszResult;
//	size_t        uiResultSize;    // As far as I can tell this is never used
	unsigned long    uiWordCount;
	long        aiAmbigCounts[MAXAMBIG+1];
	char *        pszLogFilename;
	short        bAppendLogFile;
	short        bShowPercentages;
	short		 bVerifyLoading;

	// This one should still be needed.
	// It is whether or not the tool checks to see if, say, an MEC makes reference to a morphname,
	// but that morphname is not in the dictionary.
	short        bCheckMorphReferences;  /* hab 1999.03.11 */

	// Yes, for the ANA output which transfer can do.
	short        bOutputProperties;    /* hab 1999.03.11 */           // I suppose we might use this//

	// No, this is whether or not to include the \w field in the ANA.  You should keep this since transfer can output ANA.
	short        bOutputOriginalWord;  /* hab 1999.03.11 */        // Original morpheme name?

	// We'd better keep this for transfer output to ANA
	short        bOutputDecomposition; /* hab 1999.03.11 */

	// We will definitely need this.
	enum output_style    eOutputStyle;

		// --Andy

	short        bStoreErrorString;
	/*
	 *  AMPLE requires a sliding window of words, using the previous word and
	 *  the next word to parse the current word
	 */
	StampWord        sStampThisWord;
	StampWord        sStampPreviousWord;
	StampWord        sStampNextWord;
	StampWord		*pStampWord;
	StampSetup		*pNext;
};


/***************************************************************************
 *  local function prototypes
 */
static void print_header P((FILE * pOutFP_in, char * pszTime_in));
static void parse_command P((int argc, char ** argv, char * pszTime_in));
static void usage P((void));
static void tsinit P((void));
static void outstats P((void));
static void tsproc P((void));

/***************************************************************************
 *  local function prototypes
 */
static void print_header P((FILE * pOutFP_in, char * pszTime_in));
static void parse_command P((int argc, char ** argv, char * pszTime_in));
static void usage P((void));
static void tsinit P((void));
static void outstats P((void));
static void tsproc P((void));

extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;

#ifndef FILENAME_MAX
#define FILENAME_MAX 128
#endif

/*
 *  current and surrounding words
 */
static StampUnit	sWords_m;
/*
 *  Name of declaration file name file
 */
static char *		pszCommandFile_m = NULL;
/*
 *  Input file name
 */
static char *		pszInputFile_m = NULL;
/*
 *  Output file name
 */
static char *		pszOutputFile_m = NULL;
/*
 *  cumulative ambiguity counts
 */
#define MAXAMBIG 15             /* maximum ambiguity range to keep track of */
static unsigned long	auiAmbiguityLevels_m[MAXAMBIG+1];
/*
 *  cumulative word count
 */
static unsigned long	uiWordCount_m;
/*
 *  do we monitor progress of parsing?
 */
static int		bMonitorProgress_m = FALSE;
/*
 *  do we verify test parsing?
 */
static int		bVerify_m = FALSE;
/*
 *  flag that morpheme dictionaries are combined
 */
static int		bUnifiedDictionary_m = FALSE;
/*
 *  Flag that we are checking memory allocation.
 */
static int	bCheckAlloc_m = FALSE;

#ifdef __cplusplus
}
#endif


#endif /*STAMP_DLL_INCLUDED*/
