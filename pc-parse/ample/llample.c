/* LLAMPLE.C - LinguaLinks / MS Windows (Win32) AMPLE DLL functions
 ***************************************************************************
 *
 * BOOL WINAPI DllMain(HANDLE	hInst,
 *		       ULONG	ul_reason_for_call,
 *		       LPVOID	lpReserved)
 *
 * DllExport char * AmpleLoadControlFiles(
 *				       const char * pszAnalysisDataFile_in,
 *				       const char * pszDictCodeTable_in,
 *				       const char * pszDictOrthoChangeTable_in,
 *				       const char * pszTextInputControlFile_in)
 * DllExport char * AmpleLoadDictionary(const char * pszFilePath_in)
 * DllExport char * AmpleParseText(const char * pszInputText_in)
 * DllExport char * AmpleParseFile(const char * pszInFilePath_in,
 *				   const char * pszOutFilePath_in)
 * DllExport char * AmpleUpdateEntry(const char * pszNewEntry_in)
 * DllExport char * AmpleWriteDictionary(const char * pszFilePath_in)
 * DllExport char * AmpleReset(void)
 * DllExport char * AmpleSetParameter(const char * pszName_in,
 *				      const char * pszValue_in)
 * DllExport char * AmpleGetParameter(const char * pszName_in)
 * DllExport char * AmpleAddSelectiveAnalysisMorphs(const char * pszMorphs_in)
 * DllExport char * AmpleRemoveSelectiveAnalysisMorphs()
 *
 ***************************************************************************
 *
 * void reportError(int eMessageType_in, const char *pszFormat_in, ...)
 *
 * void reportMessage(int bNotSilent_in, const char *pszFormat_in, ...)
 *
 * int exitSafely(int iCode_in)
 *
 ***************************************************************************
 * Copyright 1997, 2000 by SIL International.  All rights reserved.
 */
#include <windows.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdarg.h>
#include "ample.h"
#include "ampledef.h"
#include "version.h"
#include <setjmp.h>
#define DllExport __declspec( dllexport )
/*
 *  environment for long jump to jump to
 */
jmp_buf sAbortPoint;
/*
 *  buffer for screen messages
 */
static char	szMessageBuffer_m[1024];
static char	szOutputBuffer_m[65000];
/*
 *  error return message strings
 */
static char	szAmpleSuccess_m[] = "<error code=none>Success</error>";
static char	szAmpleDLLCrash_m[] = "\
<error code=fatalCrash>\
AMPLE DLL has crashed badly!\
</error>";
static char	szInvalidParameterName_m[] = "\
<error code=invalidParameterName>\
Parameter name not recognized\
</error>";
static char	szInvalidParameterValue_m[] = "\
<error code=invalidParameterValue>\
Bad parameter value string\
</error>";
static char	szNoSuchFile_m[] = "\
<error code=invalidInputFilename>\
Cannot open file for input\
</error>";
static char	szBadOutputFile_m[] = "\
<error code=invalidOutputFilename>\
Cannot open file for output\
</error>";
static char	szMissingArgument_m[] = "\
<error code=missingArgument>\
Required argument is empty\
</error>";
static char	szBadAnalysisDataFile_m[] = "\
<error code=badAnalysisDataFile>\
Error reading the analysis data file\
</error>";
static char	szBadDictCodeTable_m[] = "\
<error code=badDictCodeTableFile>\
Error reading the dictionary code table file\
</error>";
static char	szBadDictOrthoChanges_m[] = "\
<error code=badDictOrthoChangesFile>\
Error reading the dictionary orthography changes table file\
</error>";
static char	szBadTextInputControl_m[] = "\
<error code=badTextInputControlFile>\
Error reading the text input control file\
</error>";
static char	szBadDictionary_m[] = "\
<error code=badDictionaryFile>\
Error reading the dictionary file\
</error>";
static char	szBadDictEntry_m[] = "\
<error code=badDictEntry>\
Error updating the dictionary\
</error>";
/*
 *  definitions and variables for setting / getting parameter values
 */
#define DEBUG_ALLOMORPH_CONDS	 0
#define BEGIN_COMMENT		 1
#define MAX_TRIE_DEPTH		 2
#define ROOT_GLOSSES		 3
#define MAX_MORPHNAME_LENGTH	 4
#define SELECTIVE_ANALYSIS_FILE	 5
#define TRACE_ANALYSIS		 6
#define DEBUG_LEVEL		 7
#define LOG_FILE		 8
#define APPEND_LOG_FILE		 9
#define OUTPUT_STYLE		10

#define NUMBER_OF_PARAMETERS	11

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
	"OutputStyle"
	};

/********************* AMPLE.C LOCAL VARIABLES *********************/

/*
 *  set of isspace() characters
 */
static const char	szWhitespace_m[7] = " \t\r\n\f\v";
/*
 *  count of words analyzed
 */
static unsigned long	uiWordCount_m = 0L;
/*
 *  cumulative ambiguity counts
 */
#define MAXAMBIG 16			/* high level of ambiguity for stats */
static long	aiAmbigCounts_m[MAXAMBIG+1];
/*
 *  information loaded from the control files and AMPLE command line
 */
static AmpleData	sAmpleData_m = {
	FALSE,		/* -a	bDebugAllomorphConds */
	TRUE,		/* -b	bEnableAllomorphIDs */
	'|',		/* -c:	cBeginComment */
	FALSE,		/* -g	bRootGlosses */
	TRUE,		/* -q	bQuiet */
	2,			/* -d:	iMaxTrieDepth */
	15,			/* -n:	iMaxMorphnameLength */
	AMPLE_TRACE_OFF,	/* -t	eTraceAnalysis */
	NULL, 0,		/*      optional string for trace output */
	WANT_PROPERTIES,	/* output field flags */
	0,			/* -/	iDebugLevel */
#ifndef hab365
	MAX_ANALYSES_TO_RETURN_NO_LIMIT,
#endif
	NULL,		/* log FILE pointer */
	NULL,		/* selective analysis filename */
	NULL,		/* selective analysis data */
	{
	NULL,	/* text input control filename */
	NULL,	/* ordered array of lowercase letters */
	NULL,	/* ordered array of uppercase letters */
	NULL,	/* array of caseless letters */
	NULL,	/* list of input orthography changes */
	NULL,	/* list of output (orthography) changes */
	NULL,	/* list of format markers (fields) to include */
	NULL,	/* list of format markers (fields) to exclude */
	'\\',	/* initial character of format markers */
	'%',	/* character for marking ambiguities and failures (database) */
	'%',	/* character for marking ambiguities and failures (text) */
	'-',	/* character for marking decomposition */
	'|',	/* initial character of secondary format markers */
	NULL,	/* "bar code" characters */
	TRUE,	/* flag whether or not to capitalize individual letters */
	TRUE,	/* flag whether or not to decapitalize/recapitalize */
	100	/* maximum number of decapitalization alternatives to use */
	},
	NULL,		/* "analysis data" filename */
	NULL,		/* \\pt */
	NULL,		/* \\rt */
	NULL,		/* \\st */
	NULL,		/* \\it */
	NULL,		/* \\ft */
	AMPLE_NO_CATEGORY,	/* \\cat */
	FALSE,
	NULL,		/* \\ca */
	NULL,		/* \\ccl */
	'<', '>',		/* \\rd */
	NULL,		/* \\scl (also string classes from other files) */
	NULL,		/* \\pcl */
	NULL,		/* \\iah */
	NULL,		/* \\pah */
	NULL,		/* \\rah */
	NULL,		/* \\sah */
	NULL,		/* \\cr */
	NULL,		/* \\mcl */
	{ NULL,0,0,255 },
	NULL,		/* \\ap, \\mp */
	0,			/* \\maxp */
	0,			/* \\maxi */
	1,			/* \\maxr */
	100,		/* \\maxs */
	NULL,		/* \\mcc */
	10,			/* \\maxnull */
	NULL,		/* \\strcheck */
	FALSE,		/* \\dicdecap */

	NULL,		/* dictionary codes filename */
	NULL,		/* prefix code table */
	NULL,		/* infix code table */
	NULL,		/* suffix code table */
	NULL,		/* root code table */
	NULL,		/* unified code table */

	NULL,		/* dictionary filenames */
	NULL,		/* dictionary storage */
	NULL,		/* list of morphemes for allomorphs in dictionary */
	NULL,		/* list of allomorph environment constraints in
			   dictionary */
	0,			/* infix locations */
	NULL,		/* list of strings used in environment constraints */
	NULL,		/* list of category sets used in dictionary entries */

	NULL,		/* dictionary orthography change filename */
	NULL,		/* dictionary orthography changes */

	FALSE, FALSE, FALSE	/* parsing variables */
	};

char *	pszLogFilename_m = NULL;	/* >:	pLogFP */
short	bAppendLogFile_m = FALSE;	/* > vs >> */
/*
 *  determine the style of output for AmpleParseFile()
 */
enum output_style { Ana, AResult, Ptext } eOutputStyle_m = Ana;
/*
 *  report ambiguous words percentages
 */
static int	bShowPercentages_m = FALSE;	/* -p */
/*
 *  AMPLE requires a sliding window of words, using the previous word and the
 *  next word to parse the current word
 */
static AmpleWord	sAmpleThisWord_m;
static AmpleWord	sAmplePreviousWord_m;
static AmpleWord	sAmpleNextWord_m;

static AmpleWord *	pAmpleWord_m;

/*****************************************************************************
 * NAME
 *    resetAmpleGlobals
 * DESCRIPTION
 *    set the global variables to their initial values
 * RETURN VALUE
 *    none
 */
static void resetAmpleGlobals()
{
int	i;
/*
 *  count of words analyzed
 */
uiWordCount_m = 0L;
/*
 *  cumulative ambiguity counts
 */
for ( i = 0 ; i <= MAXAMBIG ; ++i )
	aiAmbigCounts_m[i] = 0L;
/*
 *  information loaded from the control files and AMPLE command line
 */
resetAmpleData( &sAmpleData_m );
sAmpleData_m.bDebugAllomorphConds           = FALSE;
sAmpleData_m.cBeginComment                  = '|';
sAmpleData_m.iMaxTrieDepth                  = 2;
sAmpleData_m.bRootGlosses                   = FALSE;
sAmpleData_m.iMaxMorphnameLength            = 15;
sAmpleData_m.eTraceAnalysis                 = FALSE;
sAmpleData_m.iDebugLevel                    = 0;
freeAmpleSelectiveAnalInfo( &sAmpleData_m );
/*
 *  information loaded from the text input control file
 */
sAmpleData_m.sTextCtl.pszTextControlFile    = NULL;
sAmpleData_m.sTextCtl.pLowercaseLetters     = NULL;
sAmpleData_m.sTextCtl.pUppercaseLetters     = NULL;
sAmpleData_m.sTextCtl.pCaselessLetters      = NULL;
sAmpleData_m.sTextCtl.pOrthoChanges         = NULL;
sAmpleData_m.sTextCtl.pOutputChanges        = NULL;
sAmpleData_m.sTextCtl.pIncludeFields        = NULL;
sAmpleData_m.sTextCtl.pExcludeFields        = NULL;
sAmpleData_m.sTextCtl.cFormatMark           = '\\';
sAmpleData_m.sTextCtl.cAnaAmbig             = '%';
sAmpleData_m.sTextCtl.cTextAmbig            = '%';
sAmpleData_m.sTextCtl.cDecomp               = '-';
sAmpleData_m.sTextCtl.cBarMark              = '|';
sAmpleData_m.sTextCtl.pszBarCodes           = NULL;
sAmpleData_m.sTextCtl.bIndividualCapitalize = TRUE;
sAmpleData_m.sTextCtl.bCapitalize           = TRUE;
sAmpleData_m.sTextCtl.uiMaxAmbigDecap       = 100;
/*
 *  information loaded from the "analysis data" (control) file
 */
sAmpleData_m.pszAnalysisDataFile            = NULL;
sAmpleData_m.pPrefixSuccTests               = NULL;
sAmpleData_m.pRootSuccTests                 = NULL;
sAmpleData_m.pSuffixSuccTests               = NULL;
sAmpleData_m.pInfixSuccTests                = NULL;
sAmpleData_m.pFinalTests                    = NULL;
sAmpleData_m.eWriteCategory                 = AMPLE_NO_CATEGORY;
sAmpleData_m.bWriteMorphCats                = FALSE;
sAmpleData_m.cBeginRoot                     = '<';
sAmpleData_m.cEndRoot                       = '>';
sAmpleData_m.pStringClasses                 = NULL;
sAmpleData_m.pInfixAdhocPairs               = NULL;
sAmpleData_m.pPrefixAdhocPairs              = NULL;
sAmpleData_m.pRootAdhocPairs                = NULL;
sAmpleData_m.pSuffixAdhocPairs              = NULL;
sAmpleData_m.pCompoundRootPairs             = NULL;
sAmpleData_m.sProperties.paProperties       = NULL;
sAmpleData_m.sProperties.uiPropertyCount    = 0;
sAmpleData_m.sProperties.uiAllocProperties  = 0;
sAmpleData_m.sProperties.uiMaxProperty      = 255;
sAmpleData_m.pPropertySets                  = NULL;
sAmpleData_m.iMaxPrefixCount                = 0;
sAmpleData_m.iMaxInfixCount                 = 0;
sAmpleData_m.iMaxRootCount                  = 1;
sAmpleData_m.iMaxSuffixCount                = 100;
sAmpleData_m.pMorphConstraints              = NULL;
sAmpleData_m.iMaxNullCount                  = 10;
sAmpleData_m.bDictionaryCapitals            = FALSE;
/*
 *  information loaded from the dictionary codes file
 */
sAmpleData_m.pszDictionaryCodesFile         = NULL;
sAmpleData_m.pPrefixTable                   = NULL;
sAmpleData_m.pInfixTable                    = NULL;
sAmpleData_m.pSuffixTable                   = NULL;
sAmpleData_m.pRootTable                     = NULL;
sAmpleData_m.pDictTable                     = NULL;
/*
 *  information loaded from the AMPLE dictionaries
 */
sAmpleData_m.pDictionaryFiles               = NULL;
sAmpleData_m.pDictionary                    = NULL;
sAmpleData_m.pAmpleMorphemes                = NULL;
sAmpleData_m.pAllomorphEnvs                 = NULL;
sAmpleData_m.iInfixLocations                = 0;
/*
 *  information loaded from the dictionary orthography change file
 */
sAmpleData_m.pszDictOrthoChangeFile         = NULL;
sAmpleData_m.pDictOrthoChanges              = NULL;
/*
 *  flags to select output fields (see WordTemplate in template.h)
 */
sAmpleData_m.iOutputFlags                   = WANT_PROPERTIES;
/*
 *  global log file pointer
 */
if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP                     = NULL;
	}
/*
 *  parsing variables
 */
sAmpleData_m.bMorphemeLookahead             = FALSE;
sAmpleData_m.bLookaheadDone                 = FALSE;
sAmpleData_m.bMultiDependency               = FALSE;

if (pszLogFilename_m != NULL)
	{
	freeMemory(pszLogFilename_m);
	pszLogFilename_m = NULL;
	}
}

/*****************************************************************************
 * NAME
 *    DllMain
 * DESCRIPTION
 *    Windows 32 (NT/95) DLL initialization function
 * RETURN VALUE
 *    1 if successful, 0 if an error occurs
 */
BOOL WINAPI DllMain(
	HANDLE	hInst,
	ULONG	ul_reason_for_call,
	LPVOID	lpReserved)
{
#if 0 /*DEBUG ONLY*/
static int	bFirstCall_s = TRUE;
if (bFirstCall_s)
	{
	bFirstCall_s = FALSE;
	setAllocMemoryTracing("dll.mem");
	}
#endif

switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
	resetAmpleGlobals();
	break;
	case DLL_THREAD_ATTACH:
	break;
	case DLL_PROCESS_DETACH:
	resetAmpleGlobals();
	break;
	case DLL_THREAD_DETACH:
	break;
	default:
	return 0;
	}
return 1;
}

/****************************************************************************
 * NAME
 *    reportError
 * DESCRIPTION
 *    report an error to the user, killing the program if the status is nonzero
 * RETURN VALUE
 *    none
 */
void reportError(
	int			eMessageType_in,	/* type of message */
	const char *	pszFormat_in,		/* printf style format string
						   for the message */
	...)
{
va_list marker;
char *	p;

va_start( marker, pszFormat_in );

if (sAmpleData_m.pLogFP != NULL)
	{
	fprintf(sAmpleData_m.pLogFP, "AMPLE Message:\n");
	vfprintf(sAmpleData_m.pLogFP, pszFormat_in, marker);
	fprintf(sAmpleData_m.pLogFP, "\n");
	}
if (sAmpleData_m.iDebugLevel != 0)
	{
	wvsprintf(szMessageBuffer_m, pszFormat_in, marker);
	while ((p = strchr(szMessageBuffer_m, '\n')) != NULL)
	{
	if (p[1] == NUL)
		*p = NUL;
	else
		*p = ' ';
	}
	if (eMessageType_in == DEBUG_MSG)
	MessageBox(0, szMessageBuffer_m, "LLAMPLE.DLL",
		   MB_OK | MB_ICONINFORMATION);
	else
	MessageBox(0, szMessageBuffer_m, "LLAMPLE.DLL",
		   MB_OK | MB_ICONEXCLAMATION);
	}

va_end( marker );
}

/****************************************************************************
 * NAME
 *    reportMessage
 * DESCRIPTION
 *    report a message to the user
 * RETURN VALUE
 *    none
 */
void reportMessage(
	int			bNotSilent_in,
	const char *	pszFormat_in,	/* printf style format string for
					   the message */
	...)
{
va_list marker;

va_start( marker, pszFormat_in );

if (sAmpleData_m.pLogFP != NULL)
	{
	fprintf(sAmpleData_m.pLogFP, "AMPLE Message:\n");
	vfprintf(sAmpleData_m.pLogFP, pszFormat_in, marker);
	fprintf(sAmpleData_m.pLogFP, "\n");
	}
if (bNotSilent_in && (sAmpleData_m.iDebugLevel != 0))
	{
	wvsprintf(szMessageBuffer_m, pszFormat_in, marker);
	MessageBox(0, szMessageBuffer_m, "LLAMPLE.DLL",
		   MB_OK | MB_ICONINFORMATION);
	}
va_end( marker );
}

#ifndef WIN32
/*****************************************************************************
 * NAME
 *    AmpleDLL_safe_exit
 * DESCRIPTION
 *    signal an error at the DLL entry point by returning to the caller of
 *    where these variables were set
 * RETURN VALUE
 *    Ample DLL fatal error message string
 */
static char * AmpleDLL_safe_exit()
{
if ((iExitBP_m != 0) && (iExitSP_m != 0))
	{
	_asm	{
		mov	bp, iExitBP_m
		mov	sp, iExitSP_m
		}
	}
else
	{
	FatalAppExit(0, szAmpleDLLCrash_m);
	}
return szAmpleDLLCrash_m;
}
#endif

/*************************************************************************
 * NAME
 *    exitSafely
 * DESCRIPTION
 *    This function is used instead of calling exit() because Windows doesn't
 *    like exit() very much!
 * RETURN VALUE
 *    input error code (actually it doesn't return...)
 */
int exitSafely(
	int	iCode_in)		/* error code to return from program */
{
if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	}
if (pszLogFilename_m != NULL)
	{
	freeMemory(pszLogFilename_m);
	pszLogFilename_m = NULL;
	}
longjmp(sAbortPoint, -1);
return iCode_in;
}

/*****************************************************************************
 * NAME
 *    checkEmptyString
 * DESCRIPTION
 *    check whether a string is empty
 * RETURN VALUE
 *    pointer to first non-space character in string, or NULL
 */
static const char * checkEmptyString(
	const char *	pszString_in)
{
if (pszString_in == NULL)
	return NULL;
pszString_in += strspn(pszString_in, szWhitespace_m);
if (pszString_in[0] == NUL)
	return NULL;
return pszString_in;
}

/*****************************************************************************
 * NAME
 *    AmpleLoadControlFiles
 * DESCRIPTION
 *    load the indicated control files into memory
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport char * AmpleLoadControlFiles(
	const char * pszAnalysisDataFile_in,
	const char * pszDictCodeTable_in,
	const char * pszDictOrthoChangeTable_in,
	const char * pszTextInputControlFile_in)
{
char *	pszResult = szAmpleSuccess_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if (pszLogFilename_m != NULL)
	sAmpleData_m.pLogFP = fopen(pszLogFilename_m, "a");
/*
 *  check for valid input
 */
pszAnalysisDataFile_in = checkEmptyString(pszAnalysisDataFile_in);
if (pszAnalysisDataFile_in == NULL)
	{
	reportError(ERROR_MSG,
		"AmpleLoadControlFiles() missing analysis data file");
	pszResult = szMissingArgument_m;
	goto close_and_return;
	}
pszDictCodeTable_in = checkEmptyString(pszDictCodeTable_in);
if (pszDictCodeTable_in == NULL)
	{
	reportError(ERROR_MSG,
		"AmpleLoadControlFiles() missing dictionary codes table file");
	pszResult = szMissingArgument_m;
	goto close_and_return;
	}
/*
 *  process the input
 */
if (loadAmpleControlFile(pszAnalysisDataFile_in, &sAmpleData_m) != 0)
	{
	reportError(ERROR_MSG,
		"Error reading analysis data file %s",
		pszAnalysisDataFile_in);
	pszResult = szBadAnalysisDataFile_m;
	goto close_and_return;
	}
if (	(loadAmpleDictCodeTables(pszDictCodeTable_in, &sAmpleData_m) != 0) ||
	(sAmpleData_m.pDictTable == NULL) )
	{
	reportError(ERROR_MSG,
		"Error reading dictionary codes table file %s",
		pszDictCodeTable_in);
	pszResult = szBadDictCodeTable_m;
	goto close_and_return;
	}

pszDictOrthoChangeTable_in = checkEmptyString(pszDictOrthoChangeTable_in);
if (pszDictOrthoChangeTable_in != NULL)
	{
	if (loadAmpleDictOrthoChanges(pszDictOrthoChangeTable_in,
				  &sAmpleData_m) != 0)
	{
	reportError(ERROR_MSG,
		   "Error reading dictionary orthography change table file %s",
			pszDictOrthoChangeTable_in);
	pszResult = szBadDictOrthoChanges_m;
	goto close_and_return;
	}
	}

pszTextInputControlFile_in = checkEmptyString(pszTextInputControlFile_in);
if (pszTextInputControlFile_in != NULL)
	{
	if (loadIntxCtlFile(pszTextInputControlFile_in,
			sAmpleData_m.cBeginComment,
			&sAmpleData_m.sTextCtl,
			&sAmpleData_m.pStringClasses) != 0)
	{
	reportError(ERROR_MSG, "Error reading text control file %s",
			pszTextInputControlFile_in);
	pszResult = szBadTextInputControl_m;
	goto close_and_return;
	}
	}
close_and_return:
if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	}
return pszResult;
}

/*****************************************************************************
 * NAME
 *    AmpleLoadDictionary
 * DESCRIPTION
 *    load the indicated dictionary file into memory
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport char * AmpleLoadDictionary(
	const char * pszDictionary_in)
{
int	iCount;
char *	pszResult = szAmpleSuccess_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if (pszLogFilename_m != NULL)
	sAmpleData_m.pLogFP = fopen(pszLogFilename_m, "a");
pszDictionary_in = checkEmptyString(pszDictionary_in);
if (pszDictionary_in == NULL)
	{
	reportError(ERROR_MSG,
		"AmpleLoadDictionary() missing dictionary file");
	pszResult = szMissingArgument_m;
	goto close_and_return;
	}
iCount = loadAmpleDictionary(pszDictionary_in, AMPLE_UNIFIED,
				 &sAmpleData_m);
if (iCount == -1)
	{
	reportError(ERROR_MSG,
		"Error reading dictionary file %s",
		pszDictionary_in);
	pszResult = szBadDictionary_m;
	}
else
	{
	reportMessage(TRUE,
		  "\t%s DICTIONARY: Loaded %d record%s\n",
		  "UNIFIED", iCount, (iCount == 1) ? "" : "s" );
	}

close_and_return:
if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	}
return pszResult;
}

/*****************************************************************************
 * NAME
 *    addAResultToBuffer
 * DESCRIPTION
 *    add the parsed word in the WordTemplate structure to the buffer in
 *    <AResult> form
 * RETURN VALUE
 *    pointer to the buffer
 */
static char * addAResultToBuffer(
	const AmpleWord *	pWord_in,
	const TextControl *	pTextCtl_in,
	char *		pszBuffer_out,
	size_t		uiBufferSize_in)
{
WordAnalysis *		pAnal;
AmpleHeadlistList *	pHeadlists;
AmpleHeadList *		pHead;
AmpleAllomorph *	pAllo;
char *			pszAResult;
size_t			uiSize;
size_t			uiRoom;
/*
 *  adjust pointers and counters for less redundant skipping
 */
uiSize     = strlen(pszBuffer_out);
pszAResult = pszBuffer_out + uiSize;
uiRoom     = uiBufferSize_in - uiSize;

#define CONCAT(psz) { \
	strncat(pszAResult, psz, uiRoom); \
	uiSize = strlen(pszAResult); \
	pszAResult += uiSize; \
	uiRoom -= uiSize; \
	}

if (pWord_in->pTemplate->pAnalyses == NULL)
	{
	if (pWord_in->bFoundRoot)
	CONCAT("<error code=analysisFailure>")
	else
	CONCAT("<error code=rootFailure>")
	CONCAT(pWord_in->pTemplate->pszOrigWord)
	CONCAT("</error>\r\n")
	}
else
	{
	CONCAT("<parse id=")
	CONCAT(pWord_in->pTemplate->pszOrigWord)
	CONCAT(">\r\n")
	for (   pAnal = pWord_in->pTemplate->pAnalyses,
			pHeadlists = pWord_in->pHeadlists ;
		pAnal && pHeadlists ;
		pAnal = pAnal->pNext, pHeadlists = pHeadlists->pNext )
	{
	CONCAT("<analysis cat=")
	if (pAnal->pszCategory != NULL)
		CONCAT(pAnal->pszCategory)
	else
		CONCAT("?")
	CONCAT(">\r\n")

	for ( pHead = pHeadlists->pHeadList ; pHead ; pHead = pHead->pRight )
		{
		pAllo = pHead->pAllomorph;
		if (pAllo == NULL)
		{
		reportError(ERROR_MSG, "pHead->pAllomorph is NULL?\n");
		CONCAT("<morph id=? allo=?>\r\n")
		continue;
		}
		CONCAT("<morph id=")
		CONCAT(pAllo->pMorpheme->pszMorphName)
		CONCAT(" allo=")
		if (pAllo->pszAllomorphID != NULL)
		CONCAT(pAllo->pszAllomorphID)
		else
		{
		CONCAT("#")
		CONCAT(pAllo->pszAllomorph)
		CONCAT("#")
		}
		CONCAT(">\r\n")
		}
	CONCAT("</analysis>\r\n")
	}
	CONCAT("</parse>\r\n")
	}

#undef CONCAT

return pszBuffer_out;
}

/*****************************************************************************
 * NAME
 *    AmpleParseText
 * DESCRIPTION
 *    parse the words in the input string
 * RETURN VALUE
 *    parse result string
 */
DllExport char * AmpleParseText(
	const char * pszInputText_in)
{
char *		pszInputText;
char *		pszWord;
AmpleWord	sWord;
AmpleWord	sPrevWord;
AmpleWord	sNextWord;
int		iFailureCount = 0;
int		iSuccessCount = 0;
void *		pAResult = NULL;
char *		pszResult = szOutputBuffer_m;
int		iResult;
WordAnalysis *	pAnal;
WordAnalysis *	pNextAnal;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if (pszLogFilename_m != NULL)
	sAmpleData_m.pLogFP = fopen(pszLogFilename_m, "a");
pszInputText_in = checkEmptyString(pszInputText_in);
if (pszInputText_in == NULL)
	{
	reportError(ERROR_MSG,
		"AmpleParseText() missing input text string");
	pszResult = szMissingArgument_m;
	goto close_and_return;
	}
/*
 *  copy the input string, and parse each word in turn
 */
pszInputText = duplicateString(pszInputText_in);
sAmpleData_m.iOutputFlags |=
			  WANT_DECOMPOSITION | WANT_PROPERTIES | WANT_ORIGINAL;
sAmpleData_m.bMorphemeLookahead = FALSE;
sAmpleData_m.bLookaheadDone     = FALSE;
sAmpleData_m.bMultiDependency   = FALSE;
memset(szOutputBuffer_m, 0, sizeof(szOutputBuffer_m));
strncpy(szOutputBuffer_m, "<AResult>\r\n", sizeof(szOutputBuffer_m)-1);
/*
 *  if tracing with SGML output, initiate the trace
 */
initiateAmpleTrace( &sAmpleData_m );
/*
 *  the following is made unduly complicated by AMPLE's use of adjacent words
 */
memset(&sWord,     0, sizeof(AmpleWord));
memset(&sNextWord, 0, sizeof(AmpleWord));
memset(&sPrevWord, 0, sizeof(AmpleWord));
pszWord = strtok(pszInputText, szWhitespace_m);
if (pszWord != NULL)
	{
	sWord.pTemplate = allocMemory(sizeof(WordTemplate));
	sWord.pTemplate->pszOrigWord = duplicateString(pszWord);
	sWord.pTemplate->iCapital    = decapitalizeWord(sWord.pTemplate,
							&sAmpleData_m.sTextCtl);
	pszWord = strtok(NULL, szWhitespace_m);
	if (pszWord != NULL)
	{
	sNextWord.pTemplate = allocMemory(sizeof(WordTemplate));
	sNextWord.pTemplate->pszOrigWord = duplicateString(pszWord);
	sNextWord.pTemplate->iCapital    = decapitalizeWord(
							   sNextWord.pTemplate,
							   &sAmpleData_m.sTextCtl);
	}
	}
while (sWord.pTemplate != NULL)
	{
	if (sWord.pTemplate->paWord != NULL)
	{
	/*
	 *  in case current word is already parsed due to morpheme
	 *  lookahead from previous word...
	 */
	if (sAmpleData_m.bMorphemeLookahead)
		{
		sAmpleData_m.bMorphemeLookahead = FALSE;
		}
	else
		{
		sAmpleData_m.bMultiDependency = FALSE;
		sAmpleData_m.bLookaheadDone   = FALSE;
		/*
		 *  parse sWord into a string of morphemes
		 */
		iResult = performAmpleAnalysis(&sWord, &sPrevWord, &sNextWord,
					   &sAmpleData_m);
		/*
		 *  If we have to look ahead to the morpheme environment of
		 *  the next word...
		 */
		if (sAmpleData_m.bMorphemeLookahead)
		{
		/*
		 * Clean up current word -- delete any morphemes
		 */
		if (sWord.pTemplate->pAnalyses != NULL)
			{
			for (	pAnal = sWord.pTemplate->pAnalyses ;
				pAnal ;
				pAnal = pNextAnal )
			{
			pNextAnal = pAnal->pNext;
			if (pAnal->pszAnalysis != NULL)
				freeMemory( pAnal->pszAnalysis );
			if (pAnal->pszDecomposition != NULL)
				freeMemory( pAnal->pszDecomposition );
			if (pAnal->pszCategory != NULL)
				freeMemory( pAnal->pszCategory );
			if (pAnal->pszProperties != NULL)
				freeMemory( pAnal->pszProperties );
			if (pAnal->pszFeatures != NULL)
				freeMemory( pAnal->pszFeatures );
			if (pAnal->pszUnderlyingForm != NULL)
				freeMemory( pAnal->pszUnderlyingForm );
			freeMemory( pAnal );
			}
			sWord.pTemplate->pAnalyses = NULL;
			}
		/*
		 * If more words to look ahead to, look ahead
		 */
		if (sNextWord.pTemplate)
			{
			/*
			 * parse sNextWord into a string of morphemes
			 */
			pAmpleWord_m = &sNextWord;

			performAmpleAnalysis(&sNextWord,
					 &sWord,
					 NULL,
					 &sAmpleData_m);
			}
		if (    sAmpleData_m.bMultiDependency &&
			(sAmpleData_m.pLogFP != NULL))
			{
			fprintf(sAmpleData_m.pLogFP,
				"\nWARNING:  Multiple dependency:  %s %s\n",
				sWord.pTemplate->pszOrigWord,
				sNextWord.pTemplate->pszOrigWord);
			}
		sAmpleData_m.bLookaheadDone = TRUE;
		/*
		 * parse sWord again
		 */
		iResult = performAmpleAnalysis(&sWord, &sPrevWord, &sNextWord,
						   &sAmpleData_m);
		}
		if (iResult == 0)
		++iFailureCount;
		else
		++iSuccessCount;

		}
	/*
	 *  output the results of analysis
	 */
	addAResultToBuffer(&sWord, &sAmpleData_m.sTextCtl,
			   szOutputBuffer_m, sizeof(szOutputBuffer_m)-1);

	}
	/*
	 *  get the next word from the input string
	 */
	eraseAmpleWord( &sPrevWord, &sAmpleData_m );
	memcpy(&sPrevWord, &sWord,     sizeof(AmpleWord));
	memcpy(&sWord,     &sNextWord, sizeof(AmpleWord));
	memset(&sNextWord, 0, sizeof(AmpleWord));
	pszWord = strtok(NULL, szWhitespace_m);
	if (pszWord != NULL)
	{
	sNextWord.pTemplate = allocMemory(sizeof(WordTemplate));
	sNextWord.pTemplate->pszOrigWord = duplicateString(pszWord);
	sNextWord.pTemplate->iCapital    = decapitalizeWord(
							   sNextWord.pTemplate,
							   &sAmpleData_m.sTextCtl);
	}
	}
eraseAmpleWord( &sPrevWord, &sAmpleData_m );
strncat(szOutputBuffer_m, "</AResult>\r\n",
	sizeof(szOutputBuffer_m) - strlen(szOutputBuffer_m) - 1);
/*
 *  if tracing with SGML output, terminate the trace
 */
terminateAmpleTrace( &sAmpleData_m );
/*
 *  free the copy of the input string
 */
freeMemory(pszInputText);
#if 0 /*DEBUG_ONLY*/
if (sAmpleData_m.pLogFP != NULL)
	{
	fprintf(sAmpleData_m.pLogFP, "\nAmpleParseText()\nInput =\n");
	fputs(pszInputText_in,  sAmpleData_m.pLogFP);
	fprintf(sAmpleData_m.pLogFP, "\nOutput =\n");
	fputs(szOutputBuffer_m, sAmpleData_m.pLogFP);
	fprintf(sAmpleData_m.pLogFP, "\nEnd of AmpleParseText()\n");
	}
#endif

close_and_return:
if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	}

return pszResult;
}

/*****************************************************************************
 * NAME
 *    writePCDATA
 * DESCRIPTION
 *    write a string of #PCDATA to an SGML file
 * RETURN VALUE
 *    none
 */
static void writePCDATA(
	const char *	pcdata_in,
	FILE *		pOutputFP_in,
	int			b7Bit_in)
{
const char *	p;
int		iChar;

if ((pcdata_in == NULL) || (pOutputFP_in == NULL))
	return;
for ( p = pcdata_in ; *p ; ++p )
	{
	iChar = *p & 0xFF;
	switch (iChar)
	{
	case '&':
		fputs("&amp;", pOutputFP_in);
		break;
	case '<':
		fputs("&lt;", pOutputFP_in);
		break;
	case ']':
		fputs("&rsqb;", pOutputFP_in);
		break;
#ifdef FULL_ENTITIES
	case '"':
		fputs("&quot;", pOutputFP_in);
		break;
#endif
	default:
		if (b7Bit_in && (iChar & 0x80))
		fprintf(pOutputFP_in, "&#%3d;", iChar);
		else
		fputc( iChar, pOutputFP_in );
	}
	}
}

/*****************************************************************************
 * NAME
 *    writeCDATA
 * DESCRIPTION
 *    write a string of CDATA to an SGML file
 * RETURN VALUE
 *    none
 */
static void writeCDATA(
	const char *	cdata_in,
	FILE *		pOutputFP_in,
	int			b7Bit_in)
{
const char *	p;
int		iChar;

if ((cdata_in == NULL) || (pOutputFP_in == NULL))
	return;
for ( p = cdata_in ; *p ; ++p )
	{
	iChar = *p & 0xFF;
	switch (iChar)
	{
	case '&':
		fputs("&amp;", pOutputFP_in);
		break;
	case '"':
		fputs("&quot;", pOutputFP_in);
		break;
	default:
		if (b7Bit_in && (iChar & 0x80))
		fprintf(pOutputFP_in, "&#%3d;", iChar);
		else
		fputc( iChar, pOutputFP_in );
	}
	}
}

/*****************************************************************************
 * NAME
 *    writeAResultToFile
 * DESCRIPTION
 *    write the ASCII representation of a AResult structure to a file
 * RETURN VALUE
 *    none
 */
void writeAResultToFile(
	const AmpleWord *	pWord_in,
	const TextControl *	pTextCtl_in,
	FILE *		pOutputFP_in)
{
WordAnalysis *		pAnal;
AmpleHeadlistList *	pHeadlists;
AmpleHeadList *		pHead;
AmpleAllomorph *	pAllo;

if (pWord_in->pTemplate->pAnalyses == NULL)
	{
	fprintf(pOutputFP_in, "<error code=analysisFailure>");
	writePCDATA(pWord_in->pTemplate->pszOrigWord, pOutputFP_in, FALSE);
	fprintf(pOutputFP_in, "</error>\n");
	}
else
	{
	fprintf(pOutputFP_in, "<parse id=\"");
	writeCDATA(pWord_in->pTemplate->pszOrigWord, pOutputFP_in, FALSE);
	fprintf(pOutputFP_in, "\">\n");
	for (   pAnal = pWord_in->pTemplate->pAnalyses,
			pHeadlists = pWord_in->pHeadlists ;
		pAnal && pHeadlists ;
		pAnal = pAnal->pNext, pHeadlists = pHeadlists->pNext )
	{
	fprintf(pOutputFP_in, "  <analysis cat=\"");
	if (pAnal->pszCategory != NULL)
		writeCDATA(pAnal->pszCategory, pOutputFP_in, FALSE);
	else
		fprintf(pOutputFP_in, "?");
	fprintf(pOutputFP_in, "\">\n");
	for ( pHead = pHeadlists->pHeadList ; pHead ; pHead = pHead->pRight )
		{
		pAllo = pHead->pAllomorph;
		if (pAllo == NULL)
		{
		reportError(ERROR_MSG, "pHead->pAllomorph is NULL?\n");
		fprintf(pOutputFP_in, "<morph id=\"?\" allo=\"?\">\n");
		continue;
		}
		fprintf(pOutputFP_in, "    <morph id=\"");
		writeCDATA(pAllo->pMorpheme->pszMorphName, pOutputFP_in, FALSE);
		fprintf(pOutputFP_in, "\" allo=\"");
		if (pAllo->pszAllomorphID == NULL)
		{
		fprintf(pOutputFP_in, "#");
		writeCDATA(pAllo->pszAllomorph, pOutputFP_in, FALSE);
		fprintf(pOutputFP_in, "#");
		}
		else
		writeCDATA(pAllo->pszAllomorphID, pOutputFP_in, FALSE);
		fprintf(pOutputFP_in, "\">\n");
		}
	fprintf(pOutputFP_in, "  </analysis>\n");
	}
	fprintf(pOutputFP_in, "</parse>\n");
	}
}

/***************************************************************************
 * NAME
 *    report_results
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Report results of analyzing sAmpleThisWord_m; this includes reporting
 *    failures, updating ambiguity count, and handling monitoring
 * RETURN VALUE
 *    none
 */
static void report_results()
{
char *	p;
size_t	i;
char *	pszWord;
/*
 *  report failures
 */
if ((sAmpleThisWord_m.uiAmbigCount == 0) && (sAmpleData_m.pLogFP != NULL))
	{
	fprintf( sAmpleData_m.pLogFP, "%s %s  [ ",
		 sAmpleThisWord_m.bFoundRoot ? "AF:" : "RF:",
		 sAmpleThisWord_m.pTemplate->pszOrigWord);
	p       = sAmpleThisWord_m.pszRemaining;
	pszWord = NULL;
	for ( i = 0 ; sAmpleThisWord_m.pTemplate->paWord[i] ; ++i )
	{
	pszWord = sAmpleThisWord_m.pTemplate->paWord[i];
	if ((pszWord <= p) && (p <= pszWord + strlen(pszWord)) )
		break;
	pszWord = NULL;
	}
	if (pszWord != NULL)
	{
	for ( p = pszWord ; p < sAmpleThisWord_m.pszRemaining ; ++p )
		putc( *p, sAmpleData_m.pLogFP);
	if (sAmpleThisWord_m.pszRemaining != pszWord)
		putc( ' ', sAmpleData_m.pLogFP);
	}
	if (p != NULL)
	{
	for ( fprintf( sAmpleData_m.pLogFP, "| ") ; *p != NUL ; ++p)
		putc( *p, sAmpleData_m.pLogFP);
	}
	if (sAmpleThisWord_m.pszRemaining != NULL)
	{
	if (*(sAmpleThisWord_m.pszRemaining) != NUL)
		putc( ' ', sAmpleData_m.pLogFP);
	}
	putc( ']', sAmpleData_m.pLogFP);
	fprintf(sAmpleData_m.pLogFP, "\n");
	}
/*
 *  update ambiguity count
 */
if (sAmpleThisWord_m.uiAmbigCount < MAXAMBIG)
	++aiAmbigCounts_m[sAmpleThisWord_m.uiAmbigCount];
else
	++aiAmbigCounts_m[MAXAMBIG];
}

/***************************************************************************
 * NAME
 *    show_test
 * ARGUMENTS
 *    header - type of test (character string)
 *    list   - pointer to list of tests
 * DESCRIPTION
 *    Print the accumulated statistics for a list of tests.
 * RETURN VALUE
 *    none
 */
static void show_test(header,list)
char *header;
AmpleTestList *list;
{
register AmpleTestList *flp;

if (sAmpleData_m.pLogFP == NULL)
	return;
fprintf( sAmpleData_m.pLogFP, "%s Tests:\n", header);
for ( flp = list ; flp != (AmpleTestList *)NULL ; flp = flp->pNext )
	{
	fprintf( sAmpleData_m.pLogFP, "%24s called %5lu time%s rejected %ld.\n",
		 flp->pszName, flp->uiTestCallCount,
		 (flp->uiTestCallCount == 1) ? ", " : "s,",
		 flp->uiTestFailCount );
	}
}

/***************************************************************************
 * NAME
 *    init_template
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    Allocate and initialize a new template struct
 * RETURN VALUE
 *    Pointer to the new template struct
 */
static WordTemplate *init_template()
{
WordTemplate *word;

word = (WordTemplate *)allocMemory( sizeof(WordTemplate) );
word->pszFormat	   = NULL;
word->pszNonAlpha  = NULL;
word->iCapital	   = NOCAP;
word->pszOrigWord  = NULL;
word->paWord       = NULL;
word->pAnalyses	   = NULL;
/*
 *  set the flags for which optional fields are wanted
 */
word->iOutputFlags = sAmpleData_m.iOutputFlags;

return(word);
}

/***************************************************************************
 * NAME
 *    fill_template
 * ARGUMENTS
 *    infp - pointer to input FILE
 * DESCRIPTION
 *    Parse input text, filling sAmpleThisWord_m for each word and its context.
 *    Actually, we read one word ahead of what we process, and keep one
 *    word lookbehind as well.
 * RETURN VALUE
 *    TRUE if successful, FALSE if EOF
 */
static int fill_template(infp)
FILE *infp;
{
/*
 *  shuffle the word templates
 *	1) free space allocated for old sAmplePreviousWord_m
 *	2) copy old sAmpleThisWord_m to sAmplePreviousWord_m
 *	3) copy old sAmpleNextWord_m to sAmpleThisWord_m
 *	4) read new sAmpleNextWord_m
 */
eraseAmpleWord( &sAmplePreviousWord_m, &sAmpleData_m );

sAmplePreviousWord_m.pTemplate	  = sAmpleThisWord_m.pTemplate;
sAmplePreviousWord_m.pHeadlists	  = sAmpleThisWord_m.pHeadlists;
sAmplePreviousWord_m.pszRemaining = sAmpleThisWord_m.pszRemaining;
sAmplePreviousWord_m.uiAmbigCount = sAmpleThisWord_m.uiAmbigCount;
sAmplePreviousWord_m.bFoundRoot	  = sAmpleThisWord_m.bFoundRoot;

sAmpleThisWord_m.pTemplate    = sAmpleNextWord_m.pTemplate;
sAmpleThisWord_m.pHeadlists   = sAmpleNextWord_m.pHeadlists;
sAmpleThisWord_m.pszRemaining = sAmpleNextWord_m.pszRemaining;
sAmpleThisWord_m.uiAmbigCount = sAmpleNextWord_m.uiAmbigCount;
sAmpleThisWord_m.bFoundRoot   = sAmpleNextWord_m.bFoundRoot;

sAmpleNextWord_m.pTemplate    = readTemplateFromText(infp,
							 &sAmpleData_m.sTextCtl);
sAmpleNextWord_m.pHeadlists   = NULL;
sAmpleNextWord_m.pszRemaining = NULL;
sAmpleNextWord_m.uiAmbigCount = 0;
sAmpleNextWord_m.bFoundRoot   = FALSE;

if (sAmpleNextWord_m.pTemplate == NULL)
	{
	return FALSE;
	}
else
	{
	/*
	 *  set the flags for which optional fields are wanted
	 */
	sAmpleNextWord_m.pTemplate->iOutputFlags = sAmpleData_m.iOutputFlags;

	return(TRUE);
	}
}

/***************************************************************************
 * NAME
 *    readAmpleWord
 * ARGUMENTS
 *    infp - pointer to input FILE
 * DESCRIPTION
 *    read a word of text into sAmpleThisWord_m
 * RETURN VALUE
 *    TRUE if word read, FALSE if EOF
 */
static int readAmpleWord(infp)
FILE *infp;
{
if (	(sAmplePreviousWord_m.pTemplate == NULL) &&
	(sAmpleThisWord_m.pTemplate == NULL) &&
	(sAmpleNextWord_m.pTemplate == NULL) )
	{
	/*
	 *	prime the pump by filling sAmpleThisWord_m with an empty value, and
	 *	sAmpleNextWord_m with the first word
	 */
	fill_template(infp);
	sAmpleThisWord_m.pTemplate = init_template();
	}
/*
 *  read the next input word (one ahead of actual processing)
 *  return appropriate value
 */
if (fill_template(infp) || (sAmpleThisWord_m.pTemplate != NULL))
	{
	if (    (sAmpleThisWord_m.pTemplate->paWord    != NULL) ||
		(sAmpleThisWord_m.pTemplate->pszFormat != NULL) )
	return(TRUE);
	}
return(FALSE);
}

/*****************************************************************************
 * NAME
 *    AmpleParseFile
 * DESCRIPTION
 *    parse an input text file, producing an output analysis file
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport char * AmpleParseFile(
	const char * pszInputFile_in,
	const char * pszOutputFile_in)
{
FILE *		infp;
FILE *		outfp;
int		i;
AmpleTestList *	flp;
WordAnalysis *	pAnal;
WordAnalysis *	pNextAnal;
long		ambwds;
long		ambtot;
long		iFailureCount = 0L;
void *		pAResult = NULL;
char *		pszResult = szAmpleSuccess_m;
static char	szReportMessage_s[] = "\nINPUT: %ld word%s processed.\n";
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if (pszLogFilename_m != NULL)
	sAmpleData_m.pLogFP = fopen(pszLogFilename_m, "a");
/*
 *  check for valid input arguments
 */
pszInputFile_in = checkEmptyString(pszInputFile_in);
if (pszInputFile_in == NULL)
	{
	reportError(ERROR_MSG, "AmpleParseFile() missing input text file");
	pszResult = szMissingArgument_m;
	goto close_and_return;
	}
pszOutputFile_in = checkEmptyString(pszOutputFile_in);
if (pszOutputFile_in == NULL)
	{
	reportError(ERROR_MSG, "AmpleParseFile() missing output file");
	pszResult = szMissingArgument_m;
	goto close_and_return;
	}
/*
 * open input and output files
 */
infp = fopen( pszInputFile_in, "r");
if (infp == NULL)
	{
	reportError(ERROR_MSG, "Cannot open input file %s", pszInputFile_in);
	pszResult = szNoSuchFile_m;
	goto close_and_return;
	}
outfp = fopen( pszOutputFile_in, "w");
if (outfp == NULL)
	{
	fclose(infp);
	reportError(ERROR_MSG, "Cannot open output file %s", pszOutputFile_in);
	pszResult = szBadOutputFile_m;
	goto close_and_return;
	}
/*
 *	If log file, show file names
 */
if (sAmpleData_m.pLogFP != NULL)
	{
	fprintf( sAmpleData_m.pLogFP, "\nInput  file: %s\n", pszInputFile_in);
	fprintf( sAmpleData_m.pLogFP, "Output file: %s\n", pszOutputFile_in);
	}
/*
 *  if tracing with SGML output, initiate the trace
 */
initiateAmpleTrace( &sAmpleData_m );
/*
 *	initialize processing parameters and counters
 */
sAmpleData_m.iOutputFlags |=
			  WANT_DECOMPOSITION | WANT_PROPERTIES | WANT_ORIGINAL;
sAmpleData_m.bMorphemeLookahead = FALSE;
sAmpleData_m.bLookaheadDone     = FALSE;
sAmpleData_m.bMultiDependency   = FALSE;
memset(&sAmplePreviousWord_m, 0, sizeof(AmpleWord));
memset(&sAmpleThisWord_m,     0, sizeof(AmpleWord));
memset(&sAmpleNextWord_m,     0, sizeof(AmpleWord));
uiWordCount_m = 0;
for ( i = 0 ; i < MAXAMBIG ; ++i )
	aiAmbigCounts_m[i] = 0;
for ( flp = sAmpleData_m.pPrefixSuccTests ; flp ; flp = flp->pNext )
	{
	flp->uiTestCallCount = 0L;
	flp->uiTestFailCount = 0L;
	}
for ( flp = sAmpleData_m.pRootSuccTests ; flp ; flp = flp->pNext )
	{
	flp->uiTestCallCount = 0L;
	flp->uiTestFailCount = 0L;
	}
for ( flp = sAmpleData_m.pSuffixSuccTests ; flp ; flp = flp->pNext )
	{
	flp->uiTestCallCount = 0L;
	flp->uiTestFailCount = 0L;
	}
for ( flp = sAmpleData_m.pFinalTests ; flp ; flp = flp->pNext )
	{
	flp->uiTestCallCount = 0L;
	flp->uiTestFailCount = 0L;
	}
/*
 *	process text one word at a time
 */
switch (eOutputStyle_m)
	{
	case Ana:
	/* nothing to do */
	break;

	case AResult:
	fprintf(outfp, "<!DOCTYPE AResult SYSTEM \"aresult.dtd\">\n");
	fprintf(outfp, "<AResult>\n");
	break;

	case Ptext:
	/* not yet implemented */
	break;
	}
while (readAmpleWord(infp) && (sAmpleThisWord_m.pTemplate != NULL))
	{
	if (sAmpleThisWord_m.pTemplate->paWord != NULL)
	{
	/* In case current word is already parsed due to morpheme
	 * lookahead from previous word...
	 */
	if (sAmpleData_m.bMorphemeLookahead)
		{
		sAmpleData_m.bMorphemeLookahead = FALSE;
		}
	else
		{
		sAmpleData_m.bMultiDependency = FALSE;
		sAmpleData_m.bLookaheadDone   = FALSE;
		/*
		 *  parse sAmpleThisWord_m into a string of morphemes
		 */
		pAmpleWord_m = &sAmpleThisWord_m;
		if (performAmpleAnalysis(&sAmpleThisWord_m,
					 &sAmplePreviousWord_m,
					 &sAmpleNextWord_m,
					 &sAmpleData_m) == 0)
		++iFailureCount;	/* the analysis failed */
		/*
		 *  If we have to look ahead to the morpheme environment of
		 *  the next word...
		 */
		if (sAmpleData_m.bMorphemeLookahead)
		{
		/*
		 * Clean up current word -- delete any morphemes
		 */
		if (pAmpleWord_m->pTemplate->pAnalyses != NULL)
			{
			for (	pAnal = pAmpleWord_m->pTemplate->pAnalyses ;
				pAnal ;
				pAnal = pNextAnal )
			{
			pNextAnal = pAnal->pNext;
			if (pAnal->pszAnalysis != NULL)
				freeMemory( pAnal->pszAnalysis );
			if (pAnal->pszDecomposition != NULL)
				freeMemory( pAnal->pszDecomposition );
			if (pAnal->pszCategory != NULL)
				freeMemory( pAnal->pszCategory );
			if (pAnal->pszProperties != NULL)
				freeMemory( pAnal->pszProperties );
			if (pAnal->pszFeatures != NULL)
				freeMemory( pAnal->pszFeatures );
			if (pAnal->pszUnderlyingForm != NULL)
				freeMemory( pAnal->pszUnderlyingForm );
			freeMemory( pAnal );
			}
			pAmpleWord_m->pTemplate->pAnalyses = NULL;
			}
		/*
		 * If more words to look ahead to, look ahead
		 */
		if (sAmpleNextWord_m.pTemplate)
			{
			/*
			 * parse sAmpleNextWord_m into a string of morphemes
			 */
			pAmpleWord_m = &sAmpleNextWord_m;

			performAmpleAnalysis(&sAmpleNextWord_m,
					 &sAmpleThisWord_m,
					 NULL,
					 &sAmpleData_m);
			}
		if (    sAmpleData_m.bMultiDependency &&
			(sAmpleData_m.pLogFP != NULL))
			{
			fprintf(sAmpleData_m.pLogFP,
				"\nWARNING:  Multiple dependency:  %s %s\n",
				sAmpleThisWord_m.pTemplate->pszOrigWord,
				sAmpleNextWord_m.pTemplate->pszOrigWord);
			}
		sAmpleData_m.bLookaheadDone = TRUE;
		/*
		 * parse sAmpleThisWord_m again
		 */
		pAmpleWord_m = &sAmpleThisWord_m;
		performAmpleAnalysis(&sAmpleThisWord_m,
					 &sAmplePreviousWord_m,
					 &sAmpleNextWord_m,
					 &sAmpleData_m);
		}
		}
	report_results();
	uiWordCount_m++;
	}
	/*
	 *  output the results of analysis
	 */
	switch (eOutputStyle_m)
	{
	case Ana:
		writeTemplate(outfp, pszOutputFile_in,
			  sAmpleThisWord_m.pTemplate,
			  &sAmpleData_m.sTextCtl);
		break;

	case AResult:
		writeAResultToFile(&sAmpleThisWord_m,
				   &sAmpleData_m.sTextCtl,
				   outfp);
		break;

	case Ptext:
		/* not yet implemented */
		break;
	}
	}
switch (eOutputStyle_m)
	{
	case Ana:
	/* nothing to do */
	break;

	case AResult:
	fprintf(outfp, "</AResult>\n");
	break;

	case Ptext:
	/* not yet implemented */
	break;
	}
eraseAmpleWord( &sAmplePreviousWord_m, &sAmpleData_m );
fclose(infp);
fflush(outfp);
checkFileError( outfp, "LLAMPLE.DLL / AmpleParseFile()", pszOutputFile_in );
fclose(outfp);
/*
 *  if tracing with SGML output, terminate the trace
 */
terminateAmpleTrace( & sAmpleData_m );
/*
 *	output statistical counts
 */
reportMessage(TRUE, szReportMessage_s,
		  uiWordCount_m, (uiWordCount_m == 1) ? "" : "s" );
if (sAmpleData_m.pLogFP != NULL)
	{
	/*
	 *  print the statistics header
	 */
	fprintf( sAmpleData_m.pLogFP, "\nANALYSIS STATISTICS: %4ld word%s",
		 uiWordCount_m, (uiWordCount_m == 1) ? "" : "s" );

	fprintf( sAmpleData_m.pLogFP, " processed.\n");
	/*
	 *  print the ambiguity levels
	 */
	ambwds = ambtot = 0;
	fprintf( sAmpleData_m.pLogFP, "   Ambiguity Levels:\n");
	for ( i = 0 ; i <= MAXAMBIG ; ++i )
	{
	if (aiAmbigCounts_m[i] > 0)
		{
		fprintf( sAmpleData_m.pLogFP,
			 "%25ld word%c with %2d %sanalys%cs.\n",
			 aiAmbigCounts_m[i], (aiAmbigCounts_m[i]==1) ? ' ' : 's',
			 i, (i==MAXAMBIG) ? "or more " : "", (i==1) ? 'i' : 'e' );
		/*
		 *  Count ambig words and total ambigs
		 */
		if (i > 1)			    /* If ambiguous */
		{
		ambwds += aiAmbigCounts_m[i];
		ambtot += (i - 1) * aiAmbigCounts_m[i];
		}
		}
	}
	/* 1.9u BJY check -p option */
	if ( bShowPercentages_m && ( uiWordCount_m - aiAmbigCounts_m[0] ) > 0)
	{
	fprintf( sAmpleData_m.pLogFP,
		 "   Percentage of analyzed words ambiguous: %ld%%\n",
		 ambwds * 100 / ( uiWordCount_m - aiAmbigCounts_m[0]) );
	fprintf( sAmpleData_m.pLogFP,
		 "   Excess ambiguities over analyzed words: %ld%%\n",
		 ambtot * 100 / ( uiWordCount_m - aiAmbigCounts_m[0]) );
	}
	/*
	 *  print the test statistics
	 */
	if (sAmpleData_m.iMaxPrefixCount)
	show_test("   Prefix", sAmpleData_m.pPrefixSuccTests);
	if (sAmpleData_m.iMaxInfixCount)
	show_test("   Infix", sAmpleData_m.pInfixSuccTests);
	show_test("   Root", sAmpleData_m.pRootSuccTests);
	if (sAmpleData_m.iMaxSuffixCount)
	show_test("   Suffix", sAmpleData_m.pSuffixSuccTests);
	show_test("   Final", sAmpleData_m.pFinalTests);
	/*
	 *  terminate this statistical summary
	 */
	fprintf( sAmpleData_m.pLogFP, "\n");
	}

close_and_return:
if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	}
return pszResult;
}

/*****************************************************************************
 * NAME
 *    AmpleUpdateEntry
 * DESCRIPTION
 *    update a dictionary entry with the given value
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport char * AmpleUpdateEntry(
	const char * pszNewEntry_in)
{
int	iStatus;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if (pszLogFilename_m != NULL)
	sAmpleData_m.pLogFP = fopen(pszLogFilename_m, "a");

iStatus = updateAmpleDictEntry(pszNewEntry_in, &sAmpleData_m);

if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	}
return iStatus ? szAmpleSuccess_m : szBadDictEntry_m;
}

/*****************************************************************************
 * NAME
 *    AmpleWriteDictionary
 * DESCRIPTION
 *    write the AMPLE dictionary to a file
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport char * AmpleWriteDictionary(
	const char * pszFilePath_in)
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if (pszLogFilename_m != NULL)
	sAmpleData_m.pLogFP = fopen(pszLogFilename_m, "a");
/*
 *  write the dictionary contents to the indicated file
 */
writeAmpleDictionary(pszFilePath_in, &sAmpleData_m);

if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	}
return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    AmpleReset
 * DESCRIPTION
 *    remove all control and dictionary information from memory
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport char * AmpleReset()
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

resetAmpleData(&sAmpleData_m);
resetAmpleGlobals();

if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	}
if (pszLogFilename_m != NULL)
	{
	freeMemory(pszLogFilename_m);
	pszLogFilename_m = NULL;
	}
return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    findParameterIndex
 * DESCRIPTION
 *    find the index for the given parameter name
 * RETURN VALUE
 *    parameter index, or -1 if not found
 */
static int findParameterIndex(
	const char *	pszName_in)
{
int	i;
/*
 *  search for the given parameter name
 */
for ( i = 0 ; i < NUMBER_OF_PARAMETERS ; ++i )
	{
	if (_stricmp(pszName_in, aszParameterNames_m[i]) == 0)
	{
	return i;
	}
	}
return -1;
}

/*****************************************************************************
 * NAME
 *    setDebugAllomorphs
 * DESCRIPTION
 *    set the "debug allomorphs" parameter (AMPLE's -a command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setDebugAllomorphs(
	const char *	pszValue_in)
{
if (pszValue_in == NULL)
	sAmpleData_m.bDebugAllomorphConds = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	sAmpleData_m.bDebugAllomorphConds = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	sAmpleData_m.bDebugAllomorphConds = FALSE;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setCommentChar
 * DESCRIPTION
 *    set the "comment character" parameter (AMPLE's -c command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setCommentChar(
	const char *	pszValue_in)
{
if (pszValue_in == NULL)
	sAmpleData_m.cBeginComment = '|';	/* default value */
else
	sAmpleData_m.cBeginComment = *pszValue_in;
return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setMaxTrieDepth
 * DESCRIPTION
 *    set the "maximum trie depth" parameter (AMPLE's -d command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setMaxTrieDepth(
	const char *	pszValue_in)
{
if (pszValue_in == NULL)
	sAmpleData_m.iMaxTrieDepth = 2;	/* default value */
else
	sAmpleData_m.iMaxTrieDepth = atoi(pszValue_in);
if (sAmpleData_m.iMaxTrieDepth < 1)
	sAmpleData_m.iMaxTrieDepth = 1;
if (sAmpleData_m.iMaxTrieDepth >= MAXMORPH)
	sAmpleData_m.iMaxTrieDepth = MAXMORPH - 1;
return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setRootGlosses
 * DESCRIPTION
 *    set the "root glosses" parameter (AMPLE's -g command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setRootGlosses(
	const char *	pszValue_in)
{
if (pszValue_in == NULL)
	sAmpleData_m.bRootGlosses = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	sAmpleData_m.bRootGlosses = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	sAmpleData_m.bRootGlosses = FALSE;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setMaxMorphnameLength
 * DESCRIPTION
 *    set the "maximum morphname length" parameter (AMPLE's -n command line
 *    option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setMaxMorphnameLength(
	const char *	pszValue_in)
{
if (pszValue_in == NULL)
	sAmpleData_m.iMaxMorphnameLength = 15;	/* default value */
else
	sAmpleData_m.iMaxMorphnameLength = atoi(pszValue_in);
if (sAmpleData_m.iMaxMorphnameLength < 1)
	sAmpleData_m.iMaxMorphnameLength = 1;
return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setSelectiveAnalysisFile
 * DESCRIPTION
 *    set the "selective analysis file" parameter (AMPLE's -s command line
 *    option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setSelectiveAnalysisFile(
	const char *	pszValue_in)
{
int	iLoad;

freeAmpleSelectiveAnalInfo( &sAmpleData_m );
if (pszValue_in == NULL)
	{
	return szAmpleSuccess_m;
	}

if (pszLogFilename_m != NULL)
	sAmpleData_m.pLogFP = fopen(pszLogFilename_m, "a");

iLoad = loadAmpleSelectiveAnalFile(pszValue_in, &sAmpleData_m);

if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	}

return (iLoad == 0) ? szAmpleSuccess_m : szNoSuchFile_m;
}

/*****************************************************************************
 * NAME
 *    setTraceAnalysis
 * DESCRIPTION
 *    set the "trace analysis" parameter (AMPLE's -t command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setTraceAnalysis(
	const char *	pszValue_in)
{
if (pszValue_in == NULL)
	sAmpleData_m.eTraceAnalysis = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) ||
	 (_stricmp(pszValue_in, "ON") == 0) )
	sAmpleData_m.eTraceAnalysis = AMPLE_TRACE_ON;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) ||
	 (_stricmp(pszValue_in, "OFF") == 0) )
	sAmpleData_m.eTraceAnalysis = AMPLE_TRACE_OFF;
else if (_stricmp(pszValue_in, "SGML") == 0)
	sAmpleData_m.eTraceAnalysis = AMPLE_TRACE_SGML;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setDebugLevel
 * DESCRIPTION
 *    set the "debug level" parameter (AMPLE's -/ command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setDebugLevel(
	const char *	pszValue_in)
{
if (pszValue_in == NULL)
	sAmpleData_m.iDebugLevel = 0;	/* default value */
else
	sAmpleData_m.iDebugLevel = atoi(pszValue_in);
if (sAmpleData_m.iDebugLevel < 0)
	sAmpleData_m.iDebugLevel = 0;
return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setLogFile
 * DESCRIPTION
 *    set the "log file" parameter (redirecting AMPLE's standard output)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setLogFile(
	const char *	pszValue_in)
{
pszValue_in = checkEmptyString(pszValue_in);
if (pszLogFilename_m != NULL)
	{
	reportMessage(TRUE, "Closing open log file %s", pszLogFilename_m);
	freeMemory(pszLogFilename_m);
	pszLogFilename_m = NULL;	/* default value */
	}
if (sAmpleData_m.pLogFP != NULL)
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	}
if (pszValue_in == NULL)
	return szAmpleSuccess_m;

sAmpleData_m.pLogFP = fopen(pszValue_in,
				bAppendLogFile_m ? "a" : "w");
if (sAmpleData_m.pLogFP == NULL)
	{
	reportError(ERROR_MSG, "Cannot open log file %s", pszValue_in);
	return szBadOutputFile_m;
	}
else
	{
	fclose(sAmpleData_m.pLogFP);
	sAmpleData_m.pLogFP = NULL;
	reportMessage(TRUE, "Opening log file %s (%s mode)",
		  pszLogFilename_m, bAppendLogFile_m ? "append" : "create");
	pszLogFilename_m = duplicateString( pszValue_in );
	return szAmpleSuccess_m;
	}
}

/*****************************************************************************
 * NAME
 *    setAppendLogFile
 * DESCRIPTION
 *    set the "append to log file" parameter
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setAppendLogFile(
	const char *	pszValue_in)
{
if (pszValue_in == NULL)
	bAppendLogFile_m = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	bAppendLogFile_m = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	bAppendLogFile_m = FALSE;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setOutputStyle
 * DESCRIPTION
 *    set the "output style" parameter
 * RETURN VALUE
 *    status string indicating success or failure
 */
static char * setOutputStyle(
	const char *	pszValue_in)
{
if (pszValue_in == NULL)
	eOutputStyle_m = Ana;	/* default value */
else if (_stricmp(pszValue_in, "Ana") == 0)
	eOutputStyle_m = Ana;
else if (_stricmp(pszValue_in, "AResult") == 0)
	eOutputStyle_m = AResult;
else if (_stricmp(pszValue_in, "Ptext") == 0)
	eOutputStyle_m = Ptext;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    AmpleSetParameter
 * DESCRIPTION
 *    update an AMPLE parameter with the given value
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport char * AmpleSetParameter(
	const char * pszName_in,
	const char * pszValue_in)
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;
/*
 *  check for sane input
 */
pszName_in = checkEmptyString(pszName_in);
if (pszName_in == NULL)
	return szInvalidParameterName_m;
if (pszValue_in != NULL)
	pszValue_in += strspn(pszValue_in, szWhitespace_m);
/*
 *  set the parameter value
 */
switch (findParameterIndex(pszName_in))
	{
	case DEBUG_ALLOMORPH_CONDS:
	return setDebugAllomorphs(pszValue_in);

	case BEGIN_COMMENT:
	return setCommentChar(pszValue_in);

	case MAX_TRIE_DEPTH:
	return setMaxTrieDepth(pszValue_in);

	case ROOT_GLOSSES:
	return setRootGlosses(pszValue_in);

	case MAX_MORPHNAME_LENGTH:
	return setMaxMorphnameLength(pszValue_in);

	case SELECTIVE_ANALYSIS_FILE:
	return setSelectiveAnalysisFile(pszValue_in);

	case TRACE_ANALYSIS:
	return setTraceAnalysis(pszValue_in);

	case DEBUG_LEVEL:
	return setDebugLevel(pszValue_in);

	case LOG_FILE:
	return setLogFile(pszValue_in);

	case APPEND_LOG_FILE:
	return setAppendLogFile(pszValue_in);

	case OUTPUT_STYLE:
	return setOutputStyle(pszValue_in);

	default:
	return szInvalidParameterName_m;
	}
}

/*****************************************************************************
 * NAME
 *    getDebugAllomorphs
 * DESCRIPTION
 *    get the "debug allomorphs" parameter (AMPLE's -a command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static char * getDebugAllomorphs()
{
if (sAmpleData_m.bDebugAllomorphConds)
	return "TRUE";
else
	return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getCommentChar
 * DESCRIPTION
 *    get the "comment character" parameter (AMPLE's -c command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static char * getCommentChar()
{
szMessageBuffer_m[0] = sAmpleData_m.cBeginComment;
szMessageBuffer_m[1] = NUL;

return szMessageBuffer_m;
}

/*****************************************************************************
 * NAME
 *    getMaxTrieDepth
 * DESCRIPTION
 *    get the "maximum trie depth" parameter (AMPLE's -d command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static char * getMaxTrieDepth()
{
sprintf(szMessageBuffer_m, "%d", sAmpleData_m.iMaxTrieDepth);

return szMessageBuffer_m;
}

/*****************************************************************************
 * NAME
 *    getRootGlosses
 * DESCRIPTION
 *    get the "root glosses" parameter (AMPLE's -g command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static char * getRootGlosses()
{
if (sAmpleData_m.bRootGlosses)
	return "TRUE";
else
	return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getMaxMorphnameLength
 * DESCRIPTION
 *    get the "maximum morphname length" parameter (AMPLE's -n command line
 *    option)
 * RETURN VALUE
 *    string indicating the value
 */
static char * getMaxMorphnameLength()
{
sprintf(szMessageBuffer_m, "%d", sAmpleData_m.iMaxMorphnameLength);

return szMessageBuffer_m;
}

/*****************************************************************************
 * NAME
 *    getSelectiveAnalysisFile
 * DESCRIPTION
 *    get the "selective trace morphs" parameter (AMPLE's -s command line
 *    option)
 * RETURN VALUE
 *    string indicating the value
 */
static char * getSelectiveAnalysisFile()
{
strcpy(szMessageBuffer_m,
	   sAmpleData_m.pszSelectiveAnalFile ?
				sAmpleData_m.pszSelectiveAnalFile : "");

return szMessageBuffer_m;
}

/*****************************************************************************
 * NAME
 *    getTraceAnalysis
 * DESCRIPTION
 *    get the "trace analysis" parameter (AMPLE's -t command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static char * getTraceAnalysis()
{
switch (sAmpleData_m.eTraceAnalysis)
	{
	case AMPLE_TRACE_OFF:
	return "OFF";
	case AMPLE_TRACE_ON:
	return "ON";
	case AMPLE_TRACE_SGML:
	return "SGML";
	default:
	return "BOGUS!?";
	}
}

/*****************************************************************************
 * NAME
 *    getDebugLevel
 * DESCRIPTION
 *    get the "debug level" parameter (AMPLE's -/ command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static char * getDebugLevel()
{
sprintf(szMessageBuffer_m, "%d", sAmpleData_m.iDebugLevel);

return szMessageBuffer_m;
}

/*****************************************************************************
 * NAME
 *    getLogFile
 * DESCRIPTION
 *    get the "log file" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static char * getLogFile()
{
strcpy(szMessageBuffer_m, pszLogFilename_m ? pszLogFilename_m : "");

return szMessageBuffer_m;
}

/*****************************************************************************
 * NAME
 *    getAppendLogFile
 * DESCRIPTION
 *    get the "append to log file" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static char * getAppendLogFile()
{
if (bAppendLogFile_m)
	return "TRUE";
else
	return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getOutputStyle
 * DESCRIPTION
 *    get the "output style" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static char * getOutputStyle()
{
switch (eOutputStyle_m)
	{
	case Ana:		return "Ana";
	case AResult:	return "AResult";
	case Ptext:		return "Ptext";
	default:		return "?";
	}
}

/*****************************************************************************
 * NAME
 *    AmpleGetParameter
 * DESCRIPTION
 *    retrieve an AMPLE parameter value
 * RETURN VALUE
 *    parameter value string
 */
DllExport char * AmpleGetParameter(
	const char * pszName_in)
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;
/*
 *  check for sane input
 */
pszName_in = checkEmptyString(pszName_in);
if (pszName_in == NULL)
	return szInvalidParameterName_m;
pszName_in += strspn(pszName_in, szWhitespace_m);
/*
 *  get the parameter value
 */
switch (findParameterIndex(pszName_in))
	{
	case DEBUG_ALLOMORPH_CONDS:
	return getDebugAllomorphs();

	case BEGIN_COMMENT:
	return getCommentChar();

	case MAX_TRIE_DEPTH:
	return getMaxTrieDepth();

	case ROOT_GLOSSES:
	return getRootGlosses();

	case MAX_MORPHNAME_LENGTH:
	return getMaxMorphnameLength();

	case SELECTIVE_ANALYSIS_FILE:
	return getSelectiveAnalysisFile();

	case TRACE_ANALYSIS:
	return getTraceAnalysis();

	case DEBUG_LEVEL:
	return getDebugLevel();

	case LOG_FILE:
	return getLogFile();

	case APPEND_LOG_FILE:
	return getAppendLogFile();

	case OUTPUT_STYLE:
	return getOutputStyle();

	default:
	return szInvalidParameterName_m;
	}
}

/*****************************************************************************
 * NAME
 *    AmpleAddSelectiveAnalysisMorphs
 * DESCRIPTION
 *    add a morphname to the list of morphs for selective tracing
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport char * AmpleAddSelectiveAnalysisMorphs(
	const char * pszMorphs_in)
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if ((pszMorphs_in == NULL) || (*pszMorphs_in == NUL))
	return szMissingArgument_m;
addAmpleSelectiveAnalItem(pszMorphs_in, &sAmpleData_m);
return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    AmpleRemoveSelectiveAnalysisMorphs
 * DESCRIPTION
 *    erase the list of morphs for selective tracing
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport char * AmpleRemoveSelectiveAnalysisMorphs()
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

freeAmpleSelectiveAnalInfo( &sAmpleData_m );
return szAmpleSuccess_m;
}

/***************************************************************************
 * EDIT HISTORY
 * 15-Apr-97	SRMc - initial edit
 * 15-May-97	SRMc - it's working, but John Hatton wants some changes ...
 *		     - log file now accessible (closed) between DLL calls
 *		     - choose between ANA and SGML analysis file output
 * 19-May-97	SRMc - add AmpleAddTraceMorphs()
 * 23-May-97	SRMc - renamed safe_exit() to exitSafely()
 * 31-May-97	SRMc - finish conversion to Win32 DLL
 *  2-Jun-97	SRMc - modify handling of selective analysis
 *		     - rename AmpleAddTraceMorphs() & AmpleRemoveTraceMorphs()
 *			to AmpleAddSelectiveAnalysisMorphs() and
 *			AmpleRemoveSelectiveAnalysisMorphs()
 * 12-Aug-97	SRMc - change .bTraceAnalysis to .eTraceAnalysis for AmpleData
 *		     - allow SGML trace output
 *  2-Oct-97	SRMc - change first argument of reportError() from a possible
 *			exit status value to a message type flag
 * 14-Oct-97	SRMc - fix for initiateAmpleTrace() and terminateAmpleTrace()
 * 22-Dec-97	SRMc - fix for changes to OPAC library
 *  7-Feb-98	SRMc - clear static processing variables at beginning of parse
 *			functions
 * 14-Jul-98	SRMc - fix for multibyte character handling by the TextControl
 *			data structure and related functions
 * 13-Apr-2000	SRMc - use strncat properly - the third argument is the maximum
 *			number of non-NUL characters that can be appended, NOT
 *			the total size of the destination buffer
 */
/*
  File settings for GNU Emacs (Please leave for Steve McConnel's sake!)
  Local Variables:
  mode:C
  compile-command:"nmake -f llample.mak \"CFG=llample - Win32 Debug\""
  End:
 */
