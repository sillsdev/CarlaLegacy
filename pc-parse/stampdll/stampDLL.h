/* STAMPDLL.H - definitions/declarations for the STAMP Windows DLL
 ***************************************************************************
 * Copyright 2008 by the Summer Institute of Linguistics, Inc.
 * All rights reserved. Roy Eberhardt 2009
 */

#define _CRT_SECURE_NO_WARNINGS
#ifndef STAMP_DLL_INCLUDED
#define STAMP_DLL_INCLUDED
#ifdef __cplusplus

extern "C" {
#endif


#pragma once

#define DllExport	__declspec( dllexport )
#define DllImport   __declspec( dllimport )
#define isatty	_isatty   // For Studio V
#define fileno  _fileno   // For Studio V
#define itoa _itoa	      //itoa depreciated
#define HAVE_ITOA 1
#define MAXAMBIG 15       /* maximum ambiguity range to keep track of */


// #define fopen   fopen_s

// Where is this defined in the other code?
// #define STDC_HEADERS

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "stamp.h"
#include <assert.h>
#include "ample.h"
// #include "string.h"
#include <setjmp.h>



typedef struct stamp_setup StampSetup;

typedef const char * (/*CALLBACK*/ * STAMPFUNC7)(StampSetup *,
						 const char *,
						 const char *,
						 const char *,
						 const char *,
						 const char *,
						 const char *);

typedef const char * (/*CALLBACK*/ * STAMPFUNC6)(StampSetup *,
						 const char *,
						 const char *,
						 const char *,
						 const char *,
						 const char *);

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

#ifndef hab34112
#ifdef EXPERIMENTAL
enum output_style { Ana, AResult, Ptext, FWParse };
#else /* EXPERIMENTAL */
enum output_style { Ana, AResult, Ptext };
#endif /* EXPERIMENTAL */
#endif /* hab34112 */


struct stamp_setup
{
	StampData     sData;		//Stamp Data Structure
	StampUnit	  sWords_m;		//Stamp tsprocess structure
	char *        pszResult;
	char *		  pszTrace;		//Trace String;
	unsigned int  uiTraceSize;
	char *		  pszSelectiveAnalFile;
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
	 *  flag that morpheme dictionaries are combined *** necessary? Stamp.c has it.
	 */
	short			bUnifiedDictionary_m;
	unsigned long	auiAmbiguityLevels_m[MAXAMBIG+1];
	/*
	 *  cumulative word count
	 */
	unsigned long	uiWordCount_m;
	/*
	 *  do we monitor progress of parsing?
	 */
	short			bMonitorProgress_m;
	/*
	 *  do we verify test?
	 */
	short			bVerify_m;

	/*
	 *  Stamp requires a sliding window of words, using the previous word and
	 *  the next word to parse the current word
	 */

	/*
	 *  Flag that we are checking memory allocation.
	 */
	short			bCheckAlloc_m;


	StampSetup		*pNext;

};


/***************************************************************************
 *  local function prototypes
 */
static void print_header P((FILE * pOutFP_in, char * pszTime_in));
//static void parse_command P((int argc, char ** argv, char * pszTime_in));
static void usage P((void));
static void tsinit P((void));
//static void outstats P((void));
//static void tsproc P((void));

// Function declarations - for set parameter switch()
static int findParameterIndex(const char *	pszName_in);
//static const char *setDebugAllomorphs(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setCommentChar(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setMaxTrieDepth(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setTraceAnalysis(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setDebugLevel(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setLogFile(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setAppendLogFile(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setStoreErrorString(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setErrorMessages(const char *pszValue_in,StampSetup *pSetup_io);
static const char *setShowPercentages(const char *pszValue_in,StampSetup *pSetup_io); //?? maybe not
static const char *setVerifyLoading(const char *pszValue_in, StampSetup *pSetup_io);
// static const char *setEnableAllomorphIDs(const char *pszValue_in,StampSetup *pSetup_io);
static const char *setCheckMorphReferences(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setOutputProperties(const char *pszValue_in,StampSetup *	pSetup_io);
static const char *setOutputOriginalWord(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setOutputDecomposition(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setOutputStyle(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setDoAllSyntheses(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setMonitorProgress(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setMatchCategories(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setQuiet(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setReportNoEntries(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setUnifiedDictionary(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setVerifyTests(const char *pszValue_in, StampSetup *pSetup_io);
static const char *setOnlyTransfer(const char *pszValue_in, StampSetup *pSetup_io);

static const char *getCommentChar(StampSetup *pSetup_io);
static const char *getMaxTrieDepth(StampSetup *pSetup_io);
static const char *getTraceAnalysis(StampSetup *pSetup_io);
static const char *getDebugLevel(StampSetup *pSetup_io);
static const char *getLogFile(StampSetup *pSetup_io);
static const char *getAppendLogFile(StampSetup *pSetup_io);
static const char *getOutputStyle(StampSetup *pSetup_io);
static const char *getStoreErrorString(StampSetup *pSetup_io);
static const char *getErrorMessages(StampSetup *pSetup_io);
static const char *getShowPercentages(StampSetup *pSetup_io);
static const char *getCheckMorphReferences(StampSetup *pSetup_io);
static const char *getOutputProperties(StampSetup *pSetup_io);
static const char *getOutputOriginalWord(StampSetup *pSetup_io);
static const char *getOutputDecomposition(StampSetup *	pSetup_io);
static const char *getVerifyLoading(StampSetup *pSetup_io);
static const char *getDoAllSyntheses(StampSetup *pSetup_io);
static const char *getMonitorProgress(StampSetup *pSetup_io);
static const char *getMatchCategories(StampSetup *pSetup_io);
static const char *getQuiet(StampSetup *pSetup_io);
static const char *getReportNoEntries(StampSetup *pSetup_io);
static const char *getUnifiedDictionary(StampSetup *pSetup_io);
static const char *getVerifyTests(StampSetup *pSetup_io);
static const char *getOnlyTransfer(StampSetup *pSetup_io);

void reportError(int eMessageType_in, const char *pszFormat_in, ...);

static const char *tsprocdll(StampSetup *pSetup_io, const char *pszInputFile_m, const char *pszOutputFile_m);
static void outstats(StampSetup *pSetup_io);

extern const int iStampDLLPatchLevel_g;
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
//static StampUnit	sWords_m;
/*
 *  Name of declaration file name file
 */
//static char *		pszCommandFile_m = NULL;
/*
 *  Input file name
 */
//static char *		pszInputFile_m = NULL;
/*
 *  Output file name
 */
//static char *		pszOutputFile_m = NULL;
/*
 *  cumulative ambiguity counts
 */
//#define MAXAMBIG 15             /* maximum ambiguity range to keep track of */
//static unsigned long	auiAmbiguityLevels_m[MAXAMBIG+1];
/*
 *  cumulative word count
 */
//static unsigned long	uiWordCount_m;
/*
 *  do we monitor progress of parsing?
 */
//static int		bMonitorProgress_m = FALSE;
/*
 *  do we verify test?
 */
//static int		bVerify_m = FALSE;
/*
 *  flag that morpheme dictionaries are combined
 */
//static int		bUnifiedDictionary_m = FALSE;
/*
 *  Flag that we are checking memory allocation.
 */
//static int	bCheckAlloc_m = FALSE;

#ifdef __cplusplus
}
#endif

/*
 *  environment for long jump to jump to
 */
jmp_buf sAbortPoint;
/*
 *  set of isspace() characters
 */
static const char	szWhitespace_g[7] = " \t\r\n\f\v";
/*
 *  buffer for screen messages
 */
static char	szMessageBuffer_g[1024];
#ifndef hab36015
static char	szOutputBuffer_g[1000000];
#else  /* hab36015 */
static char	szOutputBuffer_g[65000];
#endif /* hab36015 */
/*
 *  error return message strings
 */
static const char	szStampSuccess_m[] = "\
<error code=none>Success</error>";
static const char	szStampDLLCrash_m[] = "\
<error code=fatalCrash>STAMP DLL has crashed badly!</error>";
static const char	szInvalidParameterName_m[] = "\
<error code=invalidParameterName>Parameter name not recognized</error>";
static const char	szInvalidParameterValue_m[] = "\
<error code=invalidParameterValue>Bad parameter value string</error>";
static const char	szNoSuchFile_m[] = "\
<error code=invalidInputFilename>Cannot open file for input</error>";
static const char	szBadOutputFile_m[] = "\
<error code=invalidOutputFilename>Cannot open file for output</error>";
static const char	szMissingArgument_m[] = "\
<error code=missingArgument>Required argument is empty</error>";
static const char	szBadStampDeclarationsFile_m[] = "\
<error code=badAnalysisDataFile>Error reading the Stamp Declarations file</error>";
static const char	szBadTransferFile_m[] = "\
<error code=badTransferFile>Error reading the transfer file</error>";
static const char	szBadSynthesisFile_m[] = "\
<error code=badSynthesisFile>Error reading the synthesis file</error>";
static const char	szBadDictCodeTable_m[] = "\
<error code=badDictCodeTableFile>Error reading the dictionary code table file\
</error>";
static const char	szBadDictOrthoChanges_m[] = "\
<error code=badDictOrthoChangesFile>\
Error reading the dictionary orthography changes table file</error>";
static const char	szBadTextInputControl_m[] = "\
<error code=badTextInputControlFile>Error reading the text input control file\
</error>";
static const char	szBadDictionary_m[] = "\
<error code=badDictionaryFile>Error reading the dictionary file</error>";
static const char	szBadDictEntry_m[] = "\
<error code=badDictEntry>Error updating the dictionary</error>";
static const char	szNoTraceString_m[] = "\
<error code=noTraceString>No trace string exists</error>";
static const char	szStampInvalidSetup_m[] = "\
<error code=invalidSetupArgument>Invalid StampSetup parameter</error>";
static const char	szBadANAInputFile_m[] = "\
<error code=invalidSetupArgument>Bad ANA File</error>";
static const char	szBadUSwitchCodeTable_s[] = "\
<error code=invalidSetupArgument>Unified dict switch but no \\unified\
in dict code table</error>";
//static const char	szNoTraceString_m[] = "\
//<error code=noTraceString>No trace string exists</error>";



#define NUMBER_OF_PARAMETERS	29

static const char *	aszParameterNames_m[NUMBER_OF_PARAMETERS] = {
	"DebugAllomorphConds",
	"BeginComment",
	"MaxTrieDepth",
	"RootGlosses",
	"MaxMorphnameLength",
	"SelectiveAnalysisFile",
	"TraceAnalysis",
	"DebugLevel",
	"LogFile",
	"AppendLogFile",
	"OutputStyle",
	"StoreErrorString",
	"ErrorMessages",
	"ShowPercentages",		/* hab 1999.03.11 */
	"CheckMorphReferences",	/* hab 1999.03.11 */
	"VerifyLoading",		/* hab 1999.03.11 */
	"OutputProperties",		/* hab 1999.03.11 */
	"OutputOriginalWord",	/* hab 1999.03.11 */
	"OutputDecomposition",	/* hab 1999.03.11 */
	"AllomorphIds",			/* jdh 2002.01.15 */
	"MaxAnalysesToReturn",	/* hab 2002.10.17 */
	"DoAllSyntheses",		/* rke 2009.06.23 */
	"MonitorProgress",		/* rke 2009.06.23 */
	"MatchCategories",		/* rke 2009.06.23 */
	"Quiet",				/* rke 2009.06.23 */
	"ReportNoEntries",		/* rke 2009.06.23 */
	"UnifiedDictionary",	/* rke 2009.06.23 */
	"VerifyTests",			/* rke 2009.06.23 */
	"OnlyTransfer"			/* rke 2009.06.23 */
	};


#endif /*STAMP_DLL_INCLUDED*/
