/* AMPLEDLL.C - LinguaLinks / MS Windows (Win32) AMPLE DLL functions
 ******************************************************************************
 *
 * BOOL WINAPI DllMain(HANDLE	hInst,
 *		       ULONG	ul_reason_for_call,
 *		       LPVOID	lpReserved)
 *
 * DllExport AmpleSetup * AmpleCreateSetup(void)
 * DllExport const char * AmpleDeleteSetup(AmpleSetup * pSetup_in)
 * DllExport const char * AmpleLoadControlFiles(
 *				       AmpleSetup * pSetup_in,
 *				       const char * pszAnalysisDataFile_in,
 *				       const char * pszDictCodeTable_in,
 *				       const char * pszDictOrthoChangeTable_in,
 *				       const char * pszTextInputControlFile_in)
 * DllExport const char * AmpleLoadDictionary(AmpleSetup * pSetup_in,
 *					      const char * pszFilePath_in,
 *					      const char * pszType_in)
 * DllExport const char * AmpleParseText(AmpleSetup * pSetup_in,
 *					 const char * pszInputText_in)
 * DllExport const char * AmpleParseFile(AmpleSetup * pSetup_in,
 *					 const char * pszInFilePath_in,
 *				   	 const char * pszOutFilePath_in)
 * DllExport const char * AmpleUpdateEntry(AmpleSetup * pSetup_in,
 *					   const char * pszNewEntry_in)
 * DllExport const char * AmpleWriteDictionary(AmpleSetup * pSetup_in,
 *					       const char * pszFilePath_in)
 * DllExport const char * AmpleReset(AmpleSetup * pSetup_in)
 * DllExport const char * AmpleSetParameter(AmpleSetup * pSetup_in,
 *					    const char * pszName_in,
 *				      	    const char * pszValue_in)
 * DllExport const char * AmpleGetParameter(AmpleSetup * pSetup_in,
 *					    const char * pszName_in)
 * DllExport const char * AmpleAddSelectiveAnalysisMorphs(
 *						     AmpleSetup * pSetup_in,
 *						     const char * pszMorphs_in)
 * DllExport const char * AmpleRemoveSelectiveAnalysisMorphs(
 *							AmpleSetup * pSetup_in)
 * DllExport const char * AmpleInitializeTraceString(AmpleSetup * pSetup_in)
 * DllExport const char * AmpleGetTraceString(AmpleSetup * pSetup_in)
 * hab 1999.03.05
 * DllExport const char * AmpleReportVersion(AmpleSetup * pSetup_in)
 * hab 1999.03.11
 * DllExport const char * AmpleInitializeMorphChecking(AmpleSetup * pSetup_in)
 * DllExport const char * AmpleCheckMorphReferences(AmpleSetup * pSetup_in)
 * DllExport const char * AmpleVerifyLoading(AmpleSetup * pSetup_in)
 * hab33126
 * DllExport const char * AmpleGetAllAllomorphs(AmpleSetup * pSetup_io,
 *                                              const char * pszRestOfWord_in,
 *                                              int          iState_in)
 * hab33148
 * DllExport const char * AmpleApplyInputChangesToWord(AmpleSetup * pSetup_io,
 *                                              const char * pszWord_in)
 * hab33169
 * DllExport const char * AmpleLoadGrammarFile(AmpleSetup * pSetup_in,
 *					   const char * pszGrammarFile_in)
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
#ifndef hab34112
#ifdef EXPERIMENTAL
#include <assert.h> // jdh 2001.7.16
#endif /* EXPERIMENTAL */
#endif /* hab34112 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdarg.h>
#include "ample.h"
#include "ampledef.h"
#include "version.h"
#include <setjmp.h>
#define DllExport __declspec( dllexport )
#include "ampledll.h"
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
static const char	szAmpleSuccess_m[] = "\
<error code=none>Success</error>";
static const char	szAmpleDLLCrash_m[] = "\
<error code=fatalCrash>AMPLE DLL has crashed badly!</error>";
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
static const char	szBadAnalysisDataFile_m[] = "\
<error code=badAnalysisDataFile>Error reading the analysis data file</error>";
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
static const char	szAmpleInvalidSetup_m[] = "\
<error code=invalidSetupArgument>Invalid AmpleSetup parameter</error>";
#ifndef hab33169
#ifdef EXPERIMENTAL
static const char	szBadGrammarFile_m[] = "\
<error code=badGrammarFile>Error reading the grammar file\
</error>";
/*
 *  PATR shared processing data
 */
static PATRMemory sAmplePATRMemory_m =
{
	NULL, NULL, NULL, NULL, NULL, NULL, TRUE,
	NULL, NULL, 0,
	0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, { NULL, 0, 0, 0 },
	NULL, 0, 0, 0
};
#ifndef hab36516
/*
 * FieldWorks strings
 */
static char szExceptionBufSizeBegin_m[] = "  <Exception code='ReachedMaxBufferSize' totalAnalyses='";
static char szExceptionAnalysesSizeBegin_m[] = "  <Exception code='ReachedMaxAnalyses' totalAnalyses='";
static char szExceptionEnd_m[]   = "'/>\r\n";
static char szWordFormClose_m[]  = " </Wordform>\r\n";
#endif /* hab36516 */
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
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
#define STORE_ERROR_STRING	11
#define ERROR_MESSAGES		12
				/* next six added by hab 1999.03.11 */
#define SHOW_PERCENTAGES        13
#define CHECK_MORPHNAME_REFS    14
#define VERIFY_LOADING          15
#define OUTPUT_PROPERTIES       16
#define OUTPUT_ORIGINAL_WORD    17
#define OUTPUT_DECOMPOSITION    18
/* jdh 2002.1.15 */
#define ALLOMORPH_IDS           19
/* hab 2002.10.17 */
#define MAX_ANALYSES_TO_RETURN  20

#define NUMBER_OF_PARAMETERS	21

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
	"AllomorphIds",		/* jdh 2002.01.15 */
	"MaxAnalysesToReturn",	/* hab 2002.10.17 */
	};

#define MAXAMBIG 16		/* high level of ambiguity for stats */

#ifndef hab34112
#ifdef EXPERIMENTAL
enum output_style { Ana, AResult, Ptext, FWParse };
#else /* EXPERIMENTAL */
enum output_style { Ana, AResult, Ptext };
#endif /* EXPERIMENTAL */
#endif /* hab34112 */
struct ample_setup
{
	AmpleData		sData;
	char *		pszResult;
	size_t		uiResultSize;
	unsigned long	uiWordCount;
	long		aiAmbigCounts[MAXAMBIG+1];
	char *		pszLogFilename;
	short		bAppendLogFile;
	short		bShowPercentages;
	short		bCheckMorphReferences;  /* hab 1999.03.11 */
	short		bVerifyLoading;       /* hab 1999.03.11 */
	short		bOutputProperties;    /* hab 1999.03.11 */
	short		bOutputOriginalWord;  /* hab 1999.03.11 */
	short		bOutputDecomposition; /* hab 1999.03.11 */
	enum output_style	eOutputStyle;
	short		bStoreErrorString;
	/*
	 *  AMPLE requires a sliding window of words, using the previous word and
	 *  the next word to parse the current word
	 */
	AmpleWord		sAmpleThisWord;
	AmpleWord		sAmplePreviousWord;
	AmpleWord		sAmpleNextWord;
	AmpleWord *		pAmpleWord;
	AmpleSetup *	pNext;
};

static AmpleSetup *	pAmpleSetups_g = NULL;

FILE *			pLogFP_m       = NULL;
int			iDebugLevel_m  = 0;
char *			pszErrorMessages_m = NULL;
size_t			uiErrorBufferSize  = 0;

/*****************************************************************************
 * NAME
 *    resetAmpleGlobals
 * DESCRIPTION
 *    set the global variables to their initial values
 * RETURN VALUE
 *    none
 */
static void resetAmpleGlobals(
	AmpleSetup * pSetup_io)
{
int	i;
#ifndef hab33169
#ifdef EXPERIMENTAL
PATRMemory * pPATRMemory;
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
/*
 *  information loaded from the control files and AMPLE command line
 *  information loaded from the text input control file
 *  information loaded from the "analysis data" (control) file
 *  information loaded from the dictionary codes file
 *  information loaded from the AMPLE dictionaries
 *  information loaded from the dictionary orthography change file
 *  flags to select output fields (see WordTemplate in template.h)
 */
resetAmpleData( &pSetup_io->sData );
#ifndef hab33169
#ifdef EXPERIMENTAL
	/* sData.sPATR.pMem is a pointer to PATR memory so the
	 * memset of sData will zero out the pointer.  We need to
	 * remember the location of the PATR memory and then initialize it.
	 */
pPATRMemory = pSetup_io->sData.sPATR.pMem;
if (pPATRMemory)
  memset( pPATRMemory, 0, sizeof(PATRMemory));
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
memset( &pSetup_io->sData, 0, sizeof(pSetup_io->sData) );
#ifndef hab33169
#ifdef EXPERIMENTAL
if (pPATRMemory)
  {				/* restore location of PATR memory */
	pSetup_io->sData.sPATR.pMem = pPATRMemory;
				/* set the only non-zero default value */
	pSetup_io->sData.sPATR.pMem->bPreserve = TRUE;
  }
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
pSetup_io->sData.cBeginComment                  = '|';
pSetup_io->sData.iMaxTrieDepth                  = 2;
pSetup_io->sData.iMaxMorphnameLength            = 15;
#ifndef hab365
#ifdef EXPERIMENTAL
pSetup_io->sData.iMaxAnalysesToReturn = MAX_ANALYSES_TO_RETURN_NO_LIMIT;
#endif
#endif

pSetup_io->sData.sTextCtl.cFormatMark           = '\\';
pSetup_io->sData.sTextCtl.cAnaAmbig             = '%';
pSetup_io->sData.sTextCtl.cTextAmbig            = '%';
pSetup_io->sData.sTextCtl.cDecomp               = '-';
pSetup_io->sData.sTextCtl.cBarMark              = '|';
pSetup_io->sData.sTextCtl.bIndividualCapitalize = TRUE;
pSetup_io->sData.sTextCtl.bCapitalize           = TRUE;
pSetup_io->sData.sTextCtl.uiMaxAmbigDecap       = 100;

pSetup_io->sData.eWriteCategory                 = AMPLE_NO_CATEGORY;
pSetup_io->sData.cBeginRoot                     = '<';
pSetup_io->sData.cEndRoot                       = '>';
pSetup_io->sData.sProperties.uiMaxProperty      = 255;
pSetup_io->sData.iMaxRootCount                  = 1;
pSetup_io->sData.iMaxSuffixCount                = 100;
pSetup_io->sData.iMaxNullCount                  = 10;
pSetup_io->sData.iOutputFlags                   = WANT_PROPERTIES;
#ifndef hab33169
#ifdef EXPERIMENTAL
	{
pSetup_io->sData.sPATR.bFailure                 = FALSE;
pSetup_io->sData.sPATR.bUnification             = TRUE;
pSetup_io->sData.sPATR.eTreeDisplay             = PATR_FLAT_TREE;
pSetup_io->sData.sPATR.bGloss                   = TRUE;
pSetup_io->sData.sPATR.bGlossesExist            = TRUE;
pSetup_io->sData.sPATR.iFeatureDisplay          = PATR_FEATURE_ON | PATR_FEATURE_FLAT | PATR_FEATURE_ALL;
pSetup_io->sData.sPATR.bCheckCycles             = TRUE;
pSetup_io->sData.sPATR.bTopDownFilter           = TRUE;
pSetup_io->sData.sPATR.iMaxAmbiguities          = 10;
pSetup_io->sData.sPATR.cComment                 = '|';
pSetup_io->sData.sPATR.bSilent                  = FALSE;
pSetup_io->sData.sPATR.bShowWarnings            = TRUE;
pSetup_io->sData.sPATR.bPromoteDefAtoms         = TRUE;
pSetup_io->sData.sPATR.bPropIsFeature           = TRUE;
#ifndef hab35013
pSetup_io->sData.sPATR.eRootGlossFeature        = PATR_ROOT_GLOSS_NO_FEATURE;
#endif // hab35013
	}
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
if (pSetup_io->pszResult != NULL)
	{
	freeMemory(pSetup_io->pszResult);
	pSetup_io->pszResult = NULL;
	}
pSetup_io->uiResultSize = 0;
/*
 *  count of words analyzed
 */
pSetup_io->uiWordCount = 0L;
/*
 *  cumulative ambiguity counts
 */
for ( i = 0 ; i <= MAXAMBIG ; ++i )
	pSetup_io->aiAmbigCounts[i] = 0L;

if (pSetup_io->pszLogFilename != NULL)
	{
	freeMemory(pSetup_io->pszLogFilename);
	pSetup_io->pszLogFilename = NULL;
	}
pSetup_io->bAppendLogFile      = FALSE;
pSetup_io->eOutputStyle        = Ana;
pSetup_io->bShowPercentages    = FALSE;	/* hab 1999.03.11 */
pSetup_io->bCheckMorphReferences = FALSE;	/* hab 1999.03.11 */
pSetup_io->bVerifyLoading      = FALSE;	/* hab 1999.03.11 */
pSetup_io->bStoreErrorString   = FALSE;
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
AmpleSetup *	ps;
AmpleSetup *	pNextSetup;

switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
	case DLL_PROCESS_DETACH:
	for ( ps = pAmpleSetups_g ; ps ; ps = pNextSetup )
		{
		resetAmpleGlobals(ps);
		pNextSetup = ps->pNext;
		freeMemory(ps);
		}
	pAmpleSetups_g = NULL;
	break;
	case DLL_THREAD_ATTACH:
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

if (pLogFP_m != NULL)
	{
	fprintf(pLogFP_m, "AMPLE Error Message:\n");
	vfprintf(pLogFP_m, pszFormat_in, marker);
	fprintf(pLogFP_m, "\n");
	fflush(pLogFP_m);
	}
if (iDebugLevel_m != 0)
	{
	wvsprintf(szMessageBuffer_g, pszFormat_in, marker);
	while ((p = strchr(szMessageBuffer_g, '\n')) != NULL)
	{
	if (p[1] == NUL)
		*p = NUL;
	else
		*p = ' ';
	}
	if (eMessageType_in == DEBUG_MSG)
	MessageBox(0, szMessageBuffer_g, "AMPLE320.DLL",
		   MB_OK | MB_ICONINFORMATION);
	else
	MessageBox(0, szMessageBuffer_g, "AMPLE320.DLL",
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

if (pLogFP_m != NULL)
	{
	fprintf(pLogFP_m, "AMPLE Message:\n");
	vfprintf(pLogFP_m, pszFormat_in, marker);
	fprintf(pLogFP_m, "\n");
	fflush(pLogFP_m);
	}
if (bNotSilent_in && (iDebugLevel_m != 0))
	{
	wvsprintf(szMessageBuffer_g, pszFormat_in, marker);
	MessageBox(0, szMessageBuffer_g, "AMPLE320.DLL",
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
AmpleSetup *	ps;
AmpleSetup *	pNextSetup;

for ( ps = pAmpleSetups_g ; ps ; ps = pNextSetup )
	{
	if (ps->sData.pLogFP != NULL)
	{
	fclose(ps->sData.pLogFP);
	ps->sData.pLogFP = NULL;
	}
	resetAmpleGlobals(ps);
	pNextSetup = ps->pNext;
	freeMemory(ps);
	}
pAmpleSetups_g = NULL;

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
pszString_in += strspn(pszString_in, szWhitespace_g);
if (pszString_in[0] == NUL)
	return NULL;
return pszString_in;
}

/*****************************************************************************
 * NAME
 *    isValidSetup
 * DESCRIPTION
 *    check whether the given pointer to an AmpleSetup data structure is valid
 * RETURN VALUE
 *    TRUE if the pointer is valid, otherwise FALSE
 */
static int isValidSetup(
	AmpleSetup * pSetup_in)
{
AmpleSetup *	ps;

if ((pSetup_in == NULL) || (pAmpleSetups_g == NULL))
	return FALSE;
for ( ps = pAmpleSetups_g ; ps ; ps = ps->pNext )
	{
	if (pSetup_in == ps)
	return TRUE;
	}
return FALSE;
}

/*****************************************************************************
 * NAME
 *    AmpleCreateSetup
 * DESCRIPTION
 *    create a new AmpleSetup data structure for use in future calls to the
 *    AMPLE DLL functions
 * RETURN VALUE
 *    pointer to an AmpleSetup data structure, or NULL if an error occurs
 */
DllExport AmpleSetup * AmpleCreateSetup(void)
{
AmpleSetup *	pSetup;
#ifndef hab33169
#ifdef EXPERIMENTAL
PATRMemory * pPATRMemory;

pPATRMemory = allocMemory(sizeof(PATRMemory)); /* allocate */
memset(pPATRMemory, 0, sizeof(PATRMemory)); /* initialize */
pPATRMemory->bPreserve = TRUE;
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
pSetup = allocMemory(sizeof(AmpleSetup));
memset(pSetup, 0, sizeof(AmpleSetup));
#ifndef hab33169
#ifdef EXPERIMENTAL
				/* set pointer to the PATR Memory */
pSetup->sData.sPATR.pMem = pPATRMemory;
#endif /* EXPERIMENTAL */
#endif /* hab33169 */

resetAmpleGlobals(pSetup);

pSetup->pNext = pAmpleSetups_g;
pAmpleSetups_g = pSetup;

return pSetup;
}

/*****************************************************************************
 * NAME
 *    AmpleDeleteSetup
 * DESCRIPTION
 *    delete the given AMPLE setup from memory
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * AmpleDeleteSetup(
	AmpleSetup * pSetup_io)
{
AmpleSetup *	ps;
AmpleSetup *	pPrevSetup;

if ((pSetup_io == NULL) || (pAmpleSetups_g == NULL))
	return szAmpleInvalidSetup_m;

pPrevSetup = NULL;
for ( ps = pAmpleSetups_g ; ps ; ps = ps->pNext )
	{
	if (pSetup_io == ps)
	{
	if (ps == pAmpleSetups_g)
		pAmpleSetups_g = ps->pNext;
	else
		pPrevSetup->pNext = ps->pNext;
	ps->pNext = NULL;
	resetAmpleGlobals(ps);
#ifndef hab33169
#ifdef EXPERIMENTAL
	if (ps->sData.sPATR.pMem)
	  {
		freeMemory(ps->sData.sPATR.pMem);
		ps->sData.sPATR.pMem = NULL;
	  }
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
	freeMemory(ps);
	return szAmpleSuccess_m;
	}
	pPrevSetup = ps;
	}
return szAmpleInvalidSetup_m;
}

/*****************************************************************************
 * NAME
 *    AmpleLoadControlFiles
 * DESCRIPTION
 *    load the indicated control files into memory
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * AmpleLoadControlFiles(
	AmpleSetup * pSetup_io,
	const char * pszAnalysisDataFile_in,
	const char * pszDictCodeTable_in,
	const char * pszDictOrthoChangeTable_in,
	const char * pszTextInputControlFile_in)
{
const char *	pszResult = szAmpleSuccess_m;
int		bOkay;
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	{
	pLogFP_m      = NULL;
	iDebugLevel_m = 0;
	return szAmpleDLLCrash_m;
	}

if (pSetup_io->pszLogFilename != NULL)
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
pLogFP_m      = pSetup_io->sData.pLogFP;
iDebugLevel_m = pSetup_io->sData.iDebugLevel;
if (pSetup_io->bStoreErrorString)
	{
	}
else
	{
	}
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
if (loadAmpleControlFile(pszAnalysisDataFile_in, &pSetup_io->sData) != 0)
	{
	reportError(ERROR_MSG,
		"Error reading analysis data file %s",
		pszAnalysisDataFile_in);
	pszResult = szBadAnalysisDataFile_m;
	goto close_and_return;
	}
bOkay = (loadAmpleDictCodeTables(pszDictCodeTable_in, &pSetup_io->sData) == 0);
if (pSetup_io->sData.pDictTable == NULL)
	{
	if (pSetup_io->sData.pRootTable == NULL)
	bOkay = FALSE;
	else if ((pSetup_io->sData.iMaxPrefixCount > 0) &&
		 (pSetup_io->sData.pPrefixTable == NULL) )
	bOkay = FALSE;
	else if ((pSetup_io->sData.iMaxInfixCount > 0) &&
		 (pSetup_io->sData.pInfixTable == NULL) )
	bOkay = FALSE;
	else if ((pSetup_io->sData.iMaxSuffixCount > 0) &&
		 (pSetup_io->sData.pSuffixTable == NULL) )
	bOkay = FALSE;
	}
if (!bOkay)
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
				  &pSetup_io->sData) != 0)
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
			pSetup_io->sData.cBeginComment,
			&pSetup_io->sData.sTextCtl,
			&pSetup_io->sData.pStringClasses) != 0)
	{
	reportError(ERROR_MSG, "Error reading text control file %s",
			pszTextInputControlFile_in);
	pszResult = szBadTextInputControl_m;
	goto close_and_return;
	}
	}
close_and_return:
if (pSetup_io->sData.pLogFP != NULL)
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}
pLogFP_m      = NULL;
iDebugLevel_m = 0;
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
DllExport const char * AmpleLoadDictionary(
	AmpleSetup * pSetup_io,
	const char * pszDictionary_in,
	const char * pszType_in)
{
int		iCount;
const char *	pszResult = szAmpleSuccess_m;
int		eType;
char *		pszType;
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	{
	pLogFP_m      = NULL;
	iDebugLevel_m = 0;
	return szAmpleDLLCrash_m;
	}
if (pSetup_io->pszLogFilename != NULL)
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
pLogFP_m      = pSetup_io->sData.pLogFP;
iDebugLevel_m = pSetup_io->sData.iDebugLevel;
pszDictionary_in = checkEmptyString(pszDictionary_in);
if (pszDictionary_in == NULL)
	{
	reportError(ERROR_MSG,
		"AmpleLoadDictionary() missing dictionary file");
	pszResult = szMissingArgument_m;
	goto close_and_return;
	}
eType = AMPLE_UNIFIED;
if (pszType_in != NULL)
	{
	switch (*pszType_in)
	{
	case 'p': case 'P': eType = AMPLE_PFX;     pszType = "PREFIX";  break;
	case 'i': case 'I': eType = AMPLE_IFX;     pszType = "INFIX";   break;
	case 'r': case 'R': eType = AMPLE_ROOT;    pszType = "ROOT";	break;
	case 's': case 'S': eType = AMPLE_SFX;     pszType = "SUFFIX";	break;
	default:	    eType = AMPLE_UNIFIED; pszType = "UNIFIED";	break;
	}
	}
reportMessage(TRUE,
		  "\t%s DICTIONARY: Loading %s\n",
		  pszType, pszDictionary_in );
iCount = loadAmpleDictionary(pszDictionary_in, eType, &pSetup_io->sData);
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
		  pszType, iCount, (iCount == 1) ? "" : "s" );
	}

close_and_return:
if (pSetup_io->sData.pLogFP != NULL)
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}
pLogFP_m      = NULL;
iDebugLevel_m = 0;
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
#ifndef hab33169
static char * addAResultToBuffer(
		  AmpleSetup *  pSetup_in,
	const AmpleWord *	pWord_in,
	const TextControl *	pTextCtl_in,
	char *		pszBuffer_out,
	size_t		uiBufferSize_in)  /* this doesn't count space for NUL*/
#else
static char * addAResultToBuffer(
	const AmpleWord *	pWord_in,
	const TextControl *	pTextCtl_in,
	char *		pszBuffer_out,
	size_t		uiBufferSize_in)  /* this doesn't count space for NUL*/
#endif /* hab33169 */
{
  WordAnalysis *		pAnal;
  AmpleHeadlistList *	pHeadlists;
  AmpleHeadList *		pHead;
  AmpleAllomorph *	pAllo;
  char *			pszAResult;
  size_t			uiSize;
  size_t			uiRoom;
#ifndef hab33169
#ifdef EXPERIMENTAL
  AmpleParseList *        pPATRParses;
  char *                  pszXml;
  int                     iOrigTreeDisplay;
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
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
#ifndef hab33169
#ifdef EXPERIMENTAL
				/* remember the tree display type */
	iOrigTreeDisplay = pSetup_in->sData.sPATR.eTreeDisplay;
				/* change it to XML */
	  pSetup_in->sData.sPATR.eTreeDisplay = PATR_XML_TREE;
	  pszXml = NULL;
	  for (   pAnal = pWord_in->pTemplate->pAnalyses,
		pHeadlists = pWord_in->pHeadlists,
		pPATRParses = pWord_in->pParses;
		  pAnal && pHeadlists && pPATRParses;
		  pAnal = pAnal->pNext,
		pHeadlists = pHeadlists->pNext,
		pPATRParses = pPATRParses->pNext)
#else
	for (   pAnal = pWord_in->pTemplate->pAnalyses,
		  pHeadlists = pWord_in->pHeadlists ;
		pAnal && pHeadlists ;
		pAnal = pAnal->pNext, pHeadlists = pHeadlists->pNext )
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
	  {
		//jdh 26may2000 added quotes around categories
		CONCAT("<analysis cat=\"")
		  if (pAnal->pszCategory != NULL)
		CONCAT(pAnal->pszCategory)
		  else
#ifndef hab232
			CONCAT("?")
#else // hab232
			  CONCAT("?\"")
#endif // hab232
			  CONCAT("\">\r\n")

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
			  // JDH26May2000 add morpheme type to the output
			  CONCAT(" type=\"");
			  switch (pAllo->pMorpheme->iMorphType & ATYPE)
				{
				case AMPLE_PFX:
				  CONCAT("p")
				break;
				case AMPLE_IFX:
				  CONCAT("i")
				break;
				case AMPLE_ROOT:
				  CONCAT("r")
				break;
				case AMPLE_NFX:
				  CONCAT("n")
				break;
				case AMPLE_NFXPFX:
				  CONCAT("np")
				break;
				case AMPLE_NFXSFX:
				  CONCAT("ns")
				break;
				case AMPLE_NFXIFX:
				  CONCAT("ni")
				break;
				case AMPLE_SFX:
				  CONCAT("s")
				break;
				default:
				  CONCAT("UNKNOWN")
				}
			  CONCAT("\"");
			  CONCAT(">\r\n")
				}
#ifndef hab33169
#ifdef EXPERIMENTAL
		if (!stringifyPATRParses(pPATRParses->pParse, &pSetup_in->sData.sPATR,
					 pWord_in->pTemplate->pszOrigWord, &pszXml))
		  if (pszXml)
		CONCAT(pszXml);
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
		CONCAT("</analysis>\r\n")
		  }
	  CONCAT("</parse>\r\n")
	}
#ifndef hab33169
#ifdef EXPERIMENTAL
				/* restore tree display to whatever it was
				   originally */
  pSetup_in->sData.sPATR.eTreeDisplay = iOrigTreeDisplay;
#endif /* EXPERIMENTAL */
#endif /* hab33169 */

#undef CONCAT

  return pszBuffer_out;
}

#ifndef hab34112
#ifdef EXPERIMENTAL
#ifndef hab36516
/*****************************************************************************
 * NAME
 *    fwConCat
 * DESCRIPTION
 *    concatenate a string to a buffer and check for overflow;
 *    if there's potential overflow, concatenate a message to the buffer
 * RETURN VALUE
 *    none
 */
static void fwConCat(char * pszString_in, int iAnalysesCount_in,
			 int *iRoom_io, char *pszAResult_io)
{
  int  iSize;
  char szCountBuffer[11];

#define  NOMOREROOM -65000

  if (*iRoom_io == NOMOREROOM)
	return;

  iSize = strlen(pszString_in);
  if (*iRoom_io < (iSize + 300)) /* use 300 to ensure plenty of room */
	{
	  strncat(pszAResult_io, szExceptionBufSizeBegin_m, *iRoom_io);
	  *iRoom_io -= strlen(szExceptionBufSizeBegin_m);
	  _itoa(iAnalysesCount_in, szCountBuffer, 10);
	  strncat(pszAResult_io, szCountBuffer, *iRoom_io);
	  *iRoom_io -= strlen(szCountBuffer);
	  strncat(pszAResult_io, szExceptionEnd_m, *iRoom_io);
	  *iRoom_io -= strlen(szExceptionEnd_m);
	  strncat(pszAResult_io, szWordFormClose_m, *iRoom_io);
	  *iRoom_io = NOMOREROOM; 	/* force bad value so no more gets added to
								   pszAResult_io*/
	}
  else
	{
	  strncat(pszAResult_io, pszString_in, *iRoom_io);
	  pszAResult_io += iSize;
	  *iRoom_io -= iSize;
	}
}

/*****************************************************************************
 * NAME
 *    addFWParseToBuffer
 * DESCRIPTION
 *    add the parsed word in the WordTemplate structure to the buffer in
 *    <AResult> form
 * RETURN VALUE
 *    pointer to the buffer
 */
static char * addFWParseToBuffer(
	 AmpleSetup *           pSetup_in,
	 const AmpleWord *	pWord_in,
	 const TextControl *	pTextCtl_in,
	 char *		        pszBuffer_out,
	 size_t		        uiBufferSize_in,  /* this doesn't count space for NUL*/
		 int                    iAnalysesCount_in)
{
  WordAnalysis *		pAnal;
  AmpleHeadlistList *	        pHeadlists;
  AmpleHeadList *		pHead;
  AmpleAllomorph *	        pAllo;
  char *			pszAResult;
  int			        iSize;
  int 			        iRoom;
  int                           iAnalCount;
  int                           iMaxAnalyses;

  /*
   *  adjust pointers and counters for less redundant skipping
   */
  iSize     = strlen(pszBuffer_out);
  pszAResult = pszBuffer_out + iSize;
  iRoom     = uiBufferSize_in - iSize;

  if (pSetup_in)
	iMaxAnalyses = pSetup_in->sData.iMaxAnalysesToReturn;
  else
	iMaxAnalyses = MAX_ANALYSES_TO_RETURN_NO_LIMIT;

  fwConCat(" <Wordform DbRef=DB_REF_HERE Form=\"", iAnalysesCount_in, &iRoom, pszAResult);
  fwConCat(pWord_in->pTemplate->pszOrigWord, iAnalysesCount_in, &iRoom, pszAResult);
  fwConCat("\">\r\n", iAnalysesCount_in, &iRoom, pszAResult);;

  if (pWord_in->pTemplate->pAnalyses == NULL)
	{
	  fwConCat("  <WfiAnalysis/>\r\n", iAnalysesCount_in, &iRoom, pszAResult); /* empty means failed to parse */
	}
  else
	{
	  iAnalCount = 0;
	  for (   pAnal = pWord_in->pTemplate->pAnalyses,
		pHeadlists = pWord_in->pHeadlists ;
		  pAnal && pHeadlists ;
		  pAnal = pAnal->pNext, pHeadlists = pHeadlists->pNext )
	{
	  ++iAnalCount;
	  if ((iMaxAnalyses != MAX_ANALYSES_TO_RETURN_NO_LIMIT) &&
		  (iMaxAnalyses < iAnalCount))
		{
		  char   szCountBuffer[11];
		  fwConCat(szExceptionAnalysesSizeBegin_m, iAnalysesCount_in,
			   &iRoom, pszAResult);
		  _itoa(iAnalysesCount_in, szCountBuffer, 10);
		  fwConCat(szCountBuffer, iAnalysesCount_in,
			   &iRoom, pszAResult);
		  fwConCat(szExceptionEnd_m, iAnalysesCount_in,
			   &iRoom, pszAResult);
		  break;		/* don't do any more */
		}
	  else
		{
		  fwConCat("  <WfiAnalysis>\r\n", iAnalysesCount_in,
			   &iRoom, pszAResult);
		  fwConCat("   <Morphs>\r\n", iAnalysesCount_in,
			   &iRoom, pszAResult);

		  for (pHead = pHeadlists->pHeadList; pHead; pHead = pHead->pRight)
		{
		  fwConCat("    <Morph>\r\n", iAnalysesCount_in,
			   &iRoom, pszAResult);
		  pAllo = pHead->pAllomorph;
		  if (pAllo == NULL)
			{
			  reportError(ERROR_MSG, "pHead->pAllomorph is NULL?\n");
			  fwConCat("     <MoForm DbRef='0' Label=\"?\"/>\r\n",
				   iAnalysesCount_in, &iRoom, pszAResult);
			  continue;
			}
		  fwConCat("      <MoForm DbRef='", iAnalysesCount_in,
			   &iRoom, pszAResult);
		  if (pAllo->pszAllomorphID != NULL)
			fwConCat(pAllo->pszAllomorphID, iAnalysesCount_in,
				 &iRoom, pszAResult);
		  else
			{
			  fwConCat("0", iAnalysesCount_in, &iRoom, pszAResult);
			  /* todo: consider raising an error at this point, */
			  /* once the caller is normalling giving us an allo id */
			}
		  fwConCat("' Label=\"", iAnalysesCount_in, &iRoom, pszAResult);
		  fwConCat(pAllo->pszAllomorph, iAnalysesCount_in,
			   &iRoom, pszAResult);
		  fwConCat("\"/>\r\n", iAnalysesCount_in, &iRoom, pszAResult);
		  fwConCat("      <MSI DbRef='", iAnalysesCount_in,
			   &iRoom, pszAResult);
		  fwConCat(pAllo->pMorpheme->pszMorphName, iAnalysesCount_in,
			   &iRoom, pszAResult); // assumes pszMorphName is
					 // holding the database id (a long int) of this msi
		  fwConCat("'/>\r\n", iAnalysesCount_in, &iRoom, pszAResult);
		  fwConCat("    </Morph>\r\n", iAnalysesCount_in,
			   &iRoom, pszAResult);
		}
		  fwConCat("   </Morphs>\r\n", iAnalysesCount_in,
			   &iRoom, pszAResult);
		  fwConCat("  </WfiAnalysis>\r\n", iAnalysesCount_in,
			   &iRoom, pszAResult);
		}
	}
	}
  fwConCat(szWordFormClose_m, iAnalysesCount_in, &iRoom, pszAResult);

  return pszBuffer_out;
}
#else  /* hab36516 */
/*****************************************************************************
 * NAME
 *    addFWParseToBuffer
 * DESCRIPTION
 *    add the parsed word in the WordTemplate structure to the buffer in
 *    <AResult> form
 * RETURN VALUE
 *    pointer to the buffer
 */
static char * addFWParseToBuffer(
	 AmpleSetup *           pSetup_in,
	 const AmpleWord *	pWord_in,
	 const TextControl *	pTextCtl_in,
	 char *		        pszBuffer_out,
	 size_t		        uiBufferSize_in)  /* this doesn't count space for NUL*/
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

  CONCAT(" <Wordform DbRef=DB_REF_HERE Form=\"")
	CONCAT(pWord_in->pTemplate->pszOrigWord)
	CONCAT("\">\r\n");

  if (pWord_in->pTemplate->pAnalyses == NULL)
	{
	  CONCAT("  <WfiAnalysis/>\r\n")// empty means failed to parse

	}
  else
	{
	  for (   pAnal = pWord_in->pTemplate->pAnalyses,
		pHeadlists = pWord_in->pHeadlists ;
		  pAnal && pHeadlists ;
		  pAnal = pAnal->pNext, pHeadlists = pHeadlists->pNext )
	{
	  CONCAT("  <WfiAnalysis>\r\n")
		CONCAT("   <Morphs>\r\n")

		for ( pHead = pHeadlists->pHeadList ; pHead ; pHead = pHead->pRight )
		  {
		CONCAT("    <Morph>\r\n")
		  pAllo = pHead->pAllomorph;
		if (pAllo == NULL)
		  {
			reportError(ERROR_MSG, "pHead->pAllomorph is NULL?\n");
			CONCAT("     <MoForm DbRef='0' Label=\"?\"/>\r\n")
			  continue;
		  }
		CONCAT("      <MoForm DbRef='")
		  if (pAllo->pszAllomorphID != NULL)
			CONCAT(pAllo->pszAllomorphID)
			  else
			{
			  CONCAT("0") //todo: consider raising an error at this point, once the caller is normalling giving us an allo id
				}
		CONCAT("' Label=\"");
		CONCAT(pAllo->pszAllomorph);
		CONCAT("\"/>\r\n");
		CONCAT("      <MSI DbRef='");
		CONCAT(pAllo->pMorpheme->pszMorphName); // assumes pszMorphName is holding the database id (a long int) of this msi
		CONCAT("'/>\r\n");
		CONCAT("    </Morph>\r\n")
		  }

	  CONCAT("   </Morphs>\r\n")
		CONCAT("  </WfiAnalysis>\r\n")
		}
	}
  CONCAT(" </Wordform>\r\n")


#undef CONCAT

	return pszBuffer_out;
}
#endif /* hab36516 */
#endif /* EXPERIMENTAL */
#endif /* hab34112 */


/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    getOutputFlags
 * DESCRIPTION
 *    determine the output flag values based on the three "command line" parameters
 * RETURN VALUE
 *    integer containing the current flag values
 */
static const int getOutputFlags(
	AmpleSetup * pSetup_io,
	int          iOutputFlags_in)
{
  int iResult = iOutputFlags_in;

  if (pSetup_io->bOutputProperties)
	iResult |= WANT_PROPERTIES;
  else
	iResult &= ~WANT_PROPERTIES;

  if (pSetup_io->bOutputOriginalWord)
	iResult |= WANT_ORIGINAL;
  else
	iResult &= ~WANT_ORIGINAL;

  if (pSetup_io->bOutputDecomposition)
	iResult |= WANT_DECOMPOSITION;
  else
	iResult &= ~WANT_DECOMPOSITION;

  return iResult;
}

#ifdef EXPERIMENTAL
#ifndef hab35013
/*****************************************************************************
 * NAME
 *    applyAnyChanges
 * DESCRIPTION
 *    apply any orth changes to a word and store in the paWord array of a
 *    template
 * RETURN VALUE
 *    none
 */
static void applyAnyChanges(WordTemplate *pWordTemplate_io,
				char * pszWord_in,
				Change *pOrthoChanges_in)
{
  pWordTemplate_io->paWord = (char **)allocMemory(2 * sizeof(char *));
  pWordTemplate_io->paWord[0] = applyChanges(pszWord_in, pOrthoChanges_in);
  pWordTemplate_io->paWord[1] = NULL;
}
#endif /* hab35013 */
#endif /* EXPERIMENTAL */

/*****************************************************************************
 * NAME
 *    AmpleParseText
 * DESCRIPTION
 *    parse the words in the input string
 * RETURN VALUE
 *    parse result string
 */
#ifdef EXPERIMENTAL
#ifndef hab35013
DllExport const char * AmpleParseText(
	AmpleSetup * pSetup_io,
	const char * pszInputText_in,
	const char * pszUseTextIn)
{
  char          cUseTextIn = (pszUseTextIn != NULL) ? tolower(*pszUseTextIn) :
													  'n';
#endif /* hab35013 */
#else /* EXPERIMENTAL */
DllExport const char * AmpleParseText(
	AmpleSetup * pSetup_io,
	const char * pszInputText_in)
{
#endif /* EXPERIMENTAL */
  char *	pszInputText;
  char *	pszWord;
  AmpleWord	sWord;
  AmpleWord	sPrevWord;
  AmpleWord	sNextWord;
  int		iFailureCount = 0;
  int		iSuccessCount = 0;
  void *	pAResult = NULL;
  const char *	pszResult = szOutputBuffer_g;
  int		iResult;
  int		bParsedAlready = FALSE;
  /*
   *  verify a valid AMPLE setup
   */
  if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
  /*
   *  set variables for emergency exits
   */
  if (setjmp(sAbortPoint) != 0)
	{
	  pLogFP_m      = NULL;
	  iDebugLevel_m = 0;
	  return szAmpleDLLCrash_m;
	}
  if (pSetup_io->pszLogFilename != NULL)
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
  pLogFP_m      = pSetup_io->sData.pLogFP;
  iDebugLevel_m = pSetup_io->sData.iDebugLevel;
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
				/* hab 1999.03.11 */
  pSetup_io->sData.iOutputFlags = getOutputFlags(pSetup_io,
						 pSetup_io->sData.iOutputFlags);
  pSetup_io->sData.bMorphemeLookahead = FALSE;
  pSetup_io->sData.bLookaheadDone     = FALSE;
  pSetup_io->sData.bMultiDependency   = FALSE;
  memset(szOutputBuffer_g, 0, sizeof(szOutputBuffer_g));
#ifndef hab34112
#ifdef EXPERIMENTAL
  switch (pSetup_io->eOutputStyle)	// jdh 2001.7.16
	{
	case AResult:
	  strncpy(szOutputBuffer_g, "<AResult>\r\n", sizeof(szOutputBuffer_g)-1);
	  break;

	case FWParse:
	  //      strncpy(szOutputBuffer_g, "<WfiAnalysis>\r\n", sizeof(szOutputBuffer_g)-1);
	  break;

	default:
	  assert(FALSE);
	  break;
	}
#else /* EXPERIMENTAL */
  strncpy(szOutputBuffer_g, "<AResult>\r\n", sizeof(szOutputBuffer_g)-1);
#endif /* EXPERIMENTAL */
#endif /* hab34112 */
  /*
   *  if tracing with SGML output, initiate the trace
   */
  initiateAmpleTrace( &pSetup_io->sData );
  /*
   *  the following is made unduly complicated by AMPLE's use of adjacent words
   */
  memset(&sWord,     0, sizeof(AmpleWord));
  memset(&sNextWord, 0, sizeof(AmpleWord));
  memset(&sPrevWord, 0, sizeof(AmpleWord));
#ifndef hab33105		/* older change to fix use of TextIn */
#ifdef EXPERIMENTAL
#ifndef hab35013		/* newer change to allow following */
				/* XAmple: caller has choice to use TextIn
				   or not */
  if (cUseTextIn == 'y')
	{				/* use TextIn as normal */
	  pszWord = pszInputText;
	  sWord.pTemplate = readTemplateFromTextString(&pszWord,
						   &pSetup_io->sData.sTextCtl);
	  sNextWord.pTemplate = readTemplateFromTextString(&pszWord,
							   &pSetup_io->sData.sTextCtl);
	}
  else
	{				/* use whitespace to delimit words;
				   do no decapitalization
				   do apply any changes */
	  pszWord = strtok(pszInputText, szWhitespace_g);
	  if (pszWord != NULL)
	{
	  sWord.pTemplate = allocMemory(sizeof(WordTemplate));
	  sWord.pTemplate->pszOrigWord = duplicateString(pszWord);
	  sWord.pTemplate->iCapital    = NOCAP;
	  applyAnyChanges(sWord.pTemplate, pszWord,
			  pSetup_io->sData.sTextCtl.pOrthoChanges);
	  pszWord = strtok(NULL, szWhitespace_g);
	  if (pszWord != NULL)
		{
		  sNextWord.pTemplate = allocMemory(sizeof(WordTemplate));
		  sNextWord.pTemplate->pszOrigWord = duplicateString(pszWord);
		  sNextWord.pTemplate->iCapital    = NOCAP;
		  applyAnyChanges(sNextWord.pTemplate, pszWord,
			  pSetup_io->sData.sTextCtl.pOrthoChanges);
		}
	}
	}
#endif /* hab35013 */
#else  /* EXPERIMENTAL */
				/* For Ample - normal case: use TextIn */
  pszWord = pszInputText;
  sWord.pTemplate = readTemplateFromTextString(&pszWord,
						   &pSetup_io->sData.sTextCtl);
  sNextWord.pTemplate = readTemplateFromTextString(&pszWord,
						   &pSetup_io->sData.sTextCtl);
#endif /* EXPERIMENTAL */
#else /* hab33105 */
  /* Original did not use TextIn (but should have) */
  pszWord = strtok(pszInputText, szWhitespace_g);
  if (pszWord != NULL)
	{
	  sWord.pTemplate = allocMemory(sizeof(WordTemplate));
	  sWord.pTemplate->pszOrigWord = duplicateString(pszWord);
	  sWord.pTemplate->iCapital    = decapitalizeWord(sWord.pTemplate,
							  &pSetup_io->sData.sTextCtl);
	  pszWord = strtok(NULL, szWhitespace_g);
	  if (pszWord != NULL)
	{
	  sNextWord.pTemplate = allocMemory(sizeof(WordTemplate));
	  sNextWord.pTemplate->pszOrigWord = duplicateString(pszWord);
	  sNextWord.pTemplate->iCapital    = decapitalizeWord(
								  sNextWord.pTemplate,
								  &pSetup_io->sData.sTextCtl);
	}
	}
#endif /* hab33105 */
  while (sWord.pTemplate != NULL)
	{
	  if (sWord.pTemplate->paWord != NULL)
	{
	  if (!bParsedAlready)
		iResult = analyzeAmpleWord(&sWord, &pSetup_io->sData);
	  bParsedAlready = FALSE;
	  if (iResult)
		{
		  if (sWord.bUsesNextWord &&
		  (sNextWord.pTemplate != NULL) &&
		  (sNextWord.pTemplate->paWord != NULL) )
		{
		  iResult = analyzeAmpleWord(&sNextWord, &pSetup_io->sData);
		  if (sNextWord.bUsesNextWord)
			{
			  /* warning message */
			  if (pSetup_io->sData.pLogFP != NULL)
			{
			  fprintf(pSetup_io->sData.pLogFP,
				  "\nWARNING:  Multiple dependency:  %s %s\n",
				  sWord.pTemplate->pszOrigWord,
				  sNextWord.pTemplate->pszOrigWord);
			}
			}
		  bParsedAlready = TRUE;
		}
		  if (sWord.bUsesPrevWord ||
		  sWord.bUsesNextWord)
		{
		  pSetup_io->sData.bLookaheadDone = TRUE;
		  refineAmpleAnalysis(&sWord,
					  &sPrevWord,
					  &sNextWord,
					  &pSetup_io->sData);
		  pSetup_io->sData.bLookaheadDone = FALSE;
		}
		}
	  if (iResult == 0)
		++iFailureCount;
	  else
		++iSuccessCount;
				/*
				 *  output the results of analysis
				 */
#ifndef hab33169
#ifndef hab34112
#ifdef EXPERIMENTAL
	  switch (pSetup_io->eOutputStyle)	// jdh 2001.7.16
		{
		case AResult:
		  addAResultToBuffer(pSetup_io, &sWord, &pSetup_io->sData.sTextCtl,
				 szOutputBuffer_g, sizeof(szOutputBuffer_g)-1);
		case FWParse:
#ifndef hab36516
		  addFWParseToBuffer(pSetup_io, &sWord, &pSetup_io->sData.sTextCtl,
				 szOutputBuffer_g, sizeof(szOutputBuffer_g)-1,
				 iResult);
#else  /* hab26416 */
		  addFWParseToBuffer(pSetup_io, &sWord, &pSetup_io->sData.sTextCtl,
				 szOutputBuffer_g, sizeof(szOutputBuffer_g)-1);
#endif /* hab36516 */
		  break;

		default:
		  assert(FALSE);
		  break;
		}
#else /* EXPERIMENTAL */
	  addAResultToBuffer(pSetup_io, &sWord, &pSetup_io->sData.sTextCtl,
				 szOutputBuffer_g, sizeof(szOutputBuffer_g)-1);
#endif /* EXPERIMENTAL */
#endif /* hab34112 */
#else /* hab33169 */
	  addAResultToBuffer(&sWord, &pSetup_io->sData.sTextCtl,
				 szOutputBuffer_g, sizeof(szOutputBuffer_g)-1);
#endif /* hab33169 */

	}
	  /*
	   *  get the next word from the input string
	   */
	  eraseAmpleWord( &sPrevWord, &pSetup_io->sData );
	  memcpy(&sPrevWord, &sWord,     sizeof(AmpleWord));
	  memcpy(&sWord,     &sNextWord, sizeof(AmpleWord));
	  memset(&sNextWord, 0, sizeof(AmpleWord));
#ifndef hab33105		/* older change to fix use of TextIn */
#ifdef EXPERIMENTAL
#ifndef hab35013		/* newer change to allow following */
				/* XAmple: caller has choice to use TextIn
				   or not */
	  if (cUseTextIn == 'y')
	sNextWord.pTemplate = readTemplateFromTextString(&pszWord,
						 &pSetup_io->sData.sTextCtl);
	  else
	{				/* use whitespace to delimit words;
					   do no decapitalization
					   do apply any changes */
	  pszWord = strtok(NULL, szWhitespace_g);
	  if (pszWord != NULL)
		{
		  sNextWord.pTemplate = allocMemory(sizeof(WordTemplate));
		  sNextWord.pTemplate->pszOrigWord = duplicateString(pszWord);
		  sNextWord.pTemplate->iCapital    = NOCAP;
		  applyAnyChanges(sNextWord.pTemplate, pszWord,
				  pSetup_io->sData.sTextCtl.pOrthoChanges);
		}
	}
	}
#endif /* hab35013 */
#else  /* EXPERIMENTAL */
	}
				/* For Ample - normal case: use TextIn */
  sNextWord.pTemplate = readTemplateFromTextString(&pszWord,
						   &pSetup_io->sData.sTextCtl);
#endif /* EXPERIMENTAL */
#else /* hab33105 */
  /* Original did not use TextIn (but should have) */
  pszWord = strtok(NULL, szWhitespace_g);
  if (pszWord != NULL)
	{
	  sNextWord.pTemplate = allocMemory(sizeof(WordTemplate));
	  sNextWord.pTemplate->pszOrigWord = duplicateString(pszWord);
	  sNextWord.pTemplate->iCapital    = decapitalizeWord(
						  sNextWord.pTemplate,
						  &pSetup_io->sData.sTextCtl);
	}
#endif /* hab33105 */
  eraseAmpleWord( &sPrevWord, &pSetup_io->sData );
#ifndef hab34112
#ifdef EXPERIMENTAL
  switch (pSetup_io->eOutputStyle)	// jdh 2001.7.16
	{
	case AResult:
	  strncat(szOutputBuffer_g, "</AResult>\r\n",
		  sizeof(szOutputBuffer_g) - strlen(szOutputBuffer_g) - 1);
	case FWParse:
	  //strncat(szOutputBuffer_g, "</WfiAnalysis>\r\n",
	  //sizeof(szOutputBuffer_g) - strlen(szOutputBuffer_g) - 1);
	  break;

	default:
	  assert(FALSE);
	  break;
	}
#else /* EXPERIMENTAL */
  strncat(szOutputBuffer_g, "</AResult>\r\n",
	  sizeof(szOutputBuffer_g) - strlen(szOutputBuffer_g) - 1);
#endif /* EXPERIMENTAL */
#endif /* hab34112 */
  /*
   *  if tracing with SGML output, terminate the trace
   */
  terminateAmpleTrace( &pSetup_io->sData );
  /*
   *  free the copy of the input string
   */
  freeMemory(pszInputText);
#ifdef _DEBUG
  if (pSetup_io->sData.pLogFP != NULL)
	{
	  fprintf(pSetup_io->sData.pLogFP, "\nAmpleParseText()\nInput =\n");
	  fputs(pszInputText_in,  pSetup_io->sData.pLogFP);
	  fprintf(pSetup_io->sData.pLogFP, "\nOutput =\n");
	  fputs(szOutputBuffer_g, pSetup_io->sData.pLogFP);
	  fprintf(pSetup_io->sData.pLogFP, "\nEnd of AmpleParseText()\n");
	}
#endif

 close_and_return:
  if (pSetup_io->sData.pLogFP != NULL)
	{
	  fclose(pSetup_io->sData.pLogFP);
	  pSetup_io->sData.pLogFP = NULL;
	}

  pLogFP_m      = NULL;
  iDebugLevel_m = 0;
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

#ifndef jdh14June2000

char *pszCatPiece=NULL;
char cType;
char *pszCategoryProgression=NULL;	//used to hold a copy of pszCat which the tokenizer will mess with

if (pWord_in->pTemplate->pAnalyses == NULL)
	{
	 fprintf(pOutputFP_in, "<word id=\"");	// no parses
		writeCDATA(pWord_in->pTemplate->pszOrigWord, pOutputFP_in, FALSE);
	  fprintf(pOutputFP_in, "\" form=\"");	// form and id are currently identical
		writeCDATA(pWord_in->pTemplate->pszOrigWord, pOutputFP_in, FALSE);
	fprintf(pOutputFP_in, "\"> <parses> </parses> </word>\n");
	}
else
	{
	  fprintf(pOutputFP_in, "<word id=\"");	// no parses
		writeCDATA(pWord_in->pTemplate->pszOrigWord, pOutputFP_in, FALSE);
	  fprintf(pOutputFP_in, "\" form=\"");	// form and id are currently identical
		writeCDATA(pWord_in->pTemplate->pszOrigWord, pOutputFP_in, FALSE);

		fprintf(pOutputFP_in, "\">\n<parses>\n");

	// for each analysis, output a <parse> element

	for (   pAnal = pWord_in->pTemplate->pAnalyses,
				pHeadlists = pWord_in->pHeadlists ;
			pAnal && pHeadlists ;
			pAnal = pAnal->pNext, pHeadlists = pHeadlists->pNext )
	{
		pszCategoryProgression = allocMemory(1+strlen(pAnal->pszCategory));
		strcpy(pszCategoryProgression, pAnal->pszCategory);

			// output the final category attribute
		fprintf(pOutputFP_in, "  <parse finalcat=\"");
		if (pszCategoryProgression != NULL)
		{
			pszCatPiece = strtok(pszCategoryProgression, " =" );
		}
		else
			pszCatPiece="?";

		fprintf(pOutputFP_in, "%s", pszCatPiece);
			//writeCDATA(pAnal->pszCategory, pOutputFP_in, FALSE);

		// output a unique ID for this analysis,to make it easier for a program to compare this analysis
		// with the ones done previously.
		fprintf(pOutputFP_in, "\" parseID=\"");
		for ( pHead = pHeadlists->pHeadList ; pHead ; pHead = pHead->pRight )
		{
			pAllo = pHead->pAllomorph;
			if (pAllo == NULL)
			{
				reportError(ERROR_MSG, "pHead->pAllomorph is NULL?\n");
				fprintf(pOutputFP_in, "?");
				continue;
			}
			fprintf(pOutputFP_in, "%%");
			writeCDATA(pAllo->pMorpheme->pszMorphName, pOutputFP_in, FALSE);
			fprintf(pOutputFP_in, "_");
			writeCDATA(pAllo->pszAllomorph, pOutputFP_in, FALSE);
		}
		if(pAnal->pszCategory)
		{
			fprintf(pOutputFP_in, "%%");
			writeCDATA(pAnal->pszCategory, pOutputFP_in, FALSE);	//and the entire category progression to complete the uniqueness
		}
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
				writeCDATA(pAllo->pszAllomorph, pOutputFP_in, FALSE);
			}
			else
				writeCDATA(pAllo->pszAllomorphID, pOutputFP_in, FALSE);

			// output the morpheme type attribute
			switch (pAllo->pMorpheme->iMorphType & ATYPE)
			  {
			  case AMPLE_PFX:
				cType = 'p';
				  break;
			  case AMPLE_IFX:
				cType = 'i';
				  break;
			  case AMPLE_ROOT:
				cType = 'r';
				  break;
			  case AMPLE_NFXPFX: /* fall through */
			  case AMPLE_NFXIFX: /* fall through */
			  case AMPLE_NFXSFX: /* fall through */
			  case AMPLE_NFX:
				cType = 'n';
				  break;
			  case AMPLE_SFX:
				cType = 's';
				  break;
			  default:
				cType = 'u';
			  }

			fprintf(pOutputFP_in, "\" type=\"%c\"", cType);

			// output the category or category pair for this morpheme

			if (pszCategoryProgression && pszCatPiece)
				pszCatPiece = strtok(NULL, " =" ); // strtok remembers the input string
			else
				pszCatPiece = "?";

			fprintf(pOutputFP_in, " cat=\"%s\" />\n", pszCatPiece);	// make it <morph ..... /> not <morph.... </morph>
		}
		freeMemory(pszCategoryProgression);

		fprintf(pOutputFP_in, "  </parse>\n");
	}
	fprintf(pOutputFP_in, "</parses></word>\n");
 }

#else

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
#endif
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
static void report_results(
	AmpleSetup * pSetup_io)
{
char *	p;
size_t	i;
char *	pszWord;
/*
 *  report failures
 */
if (	(pSetup_io->sAmpleThisWord.uiAmbigCount == 0) &&
	(pSetup_io->sData.pLogFP != NULL))
	{
	fprintf( pSetup_io->sData.pLogFP, "%s %s  [ ",
		 pSetup_io->sAmpleThisWord.bFoundRoot ? "AF:" : "RF:",
		 pSetup_io->sAmpleThisWord.pTemplate->pszOrigWord);
	p       = pSetup_io->sAmpleThisWord.pszRemaining;
	pszWord = NULL;
	for ( i = 0 ; pSetup_io->sAmpleThisWord.pTemplate->paWord[i] ; ++i )
	{
	pszWord = pSetup_io->sAmpleThisWord.pTemplate->paWord[i];
	if ((pszWord <= p) && (p <= pszWord + strlen(pszWord)) )
		break;
	pszWord = NULL;
	}
	if (pszWord != NULL)
	{
	for ( p = pszWord ; p < pSetup_io->sAmpleThisWord.pszRemaining ; ++p )
		putc( *p, pSetup_io->sData.pLogFP);
	if (pSetup_io->sAmpleThisWord.pszRemaining != pszWord)
		putc( ' ', pSetup_io->sData.pLogFP);
	}
	if (p != NULL)
	{
	for ( fprintf( pSetup_io->sData.pLogFP, "| ") ; *p != NUL ; ++p)
		putc( *p, pSetup_io->sData.pLogFP);
	}
	if (pSetup_io->sAmpleThisWord.pszRemaining != NULL)
	{
	if (*(pSetup_io->sAmpleThisWord.pszRemaining) != NUL)
		putc( ' ', pSetup_io->sData.pLogFP);
	}
	putc( ']', pSetup_io->sData.pLogFP);
	fprintf(pSetup_io->sData.pLogFP, "\n");
	}
/*
 *  update ambiguity count
 */
if (pSetup_io->sAmpleThisWord.uiAmbigCount < MAXAMBIG)
	++pSetup_io->aiAmbigCounts[pSetup_io->sAmpleThisWord.uiAmbigCount];
else
	++pSetup_io->aiAmbigCounts[MAXAMBIG];
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
static void show_test(header,list, pSetup_io)
char *		header;
AmpleTestList *	list;
AmpleSetup *	pSetup_io;
{
register AmpleTestList *flp;

if (pSetup_io->sData.pLogFP == NULL)
	return;
fprintf( pSetup_io->sData.pLogFP, "%s Tests:\n", header);
for ( flp = list ; flp != (AmpleTestList *)NULL ; flp = flp->pNext )
	{
	fprintf(pSetup_io->sData.pLogFP, "%24s called %5lu time%s rejected %ld.\n",
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
static WordTemplate * init_template(
	AmpleSetup * pSetup_io)
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
word->iOutputFlags = pSetup_io->sData.iOutputFlags;

return(word);
}

/***************************************************************************
 * NAME
 *    fill_template
 * ARGUMENTS
 *    infp - pointer to input FILE
 * DESCRIPTION
 *    Parse input text, filling pSetup_io->sAmpleThisWord for each word and its
 *    context.  Actually, we read one word ahead of what we process, and keep
 *    one word lookbehind as well.
 * RETURN VALUE
 *    TRUE if successful, FALSE if EOF
 */
static int fill_template(infp, pSetup_io)
FILE *		infp;
AmpleSetup *	pSetup_io;
{
/*
 *  shuffle the word templates
 *	1) free space allocated for old sAmplePreviousWord_m
 *	2) copy old pSetup_io->sAmpleThisWord to sAmplePreviousWord_m
 *	3) copy old sAmpleNextWord_m to pSetup_io->sAmpleThisWord
 *	4) read new sAmpleNextWord_m
 */
eraseAmpleWord( &pSetup_io->sAmplePreviousWord, &pSetup_io->sData );

pSetup_io->sAmplePreviousWord.pTemplate	   =
					pSetup_io->sAmpleThisWord.pTemplate;
pSetup_io->sAmplePreviousWord.pHeadlists   =
					pSetup_io->sAmpleThisWord.pHeadlists;
pSetup_io->sAmplePreviousWord.pszRemaining =
					pSetup_io->sAmpleThisWord.pszRemaining;
pSetup_io->sAmplePreviousWord.uiAmbigCount =
					pSetup_io->sAmpleThisWord.uiAmbigCount;
pSetup_io->sAmplePreviousWord.bFoundRoot   =
					pSetup_io->sAmpleThisWord.bFoundRoot;
#ifndef hab33127
pSetup_io->sAmplePreviousWord.bUsesPrevWord   =
					   pSetup_io->sAmpleThisWord.bUsesPrevWord;
pSetup_io->sAmplePreviousWord.bUsesNextWord   =
					   pSetup_io->sAmpleThisWord.bUsesNextWord;
#endif // hab33127
#ifndef hab33169
#ifdef EXPERIMENTAL
pSetup_io->sAmplePreviousWord.pParses      = pSetup_io->sAmpleThisWord.pParses;
#endif /* EXPERIMENTAL */
#endif /* hab33169 */

pSetup_io->sAmpleThisWord.pTemplate    = pSetup_io->sAmpleNextWord.pTemplate;
pSetup_io->sAmpleThisWord.pHeadlists   = pSetup_io->sAmpleNextWord.pHeadlists;
pSetup_io->sAmpleThisWord.pszRemaining =
					pSetup_io->sAmpleNextWord.pszRemaining;
pSetup_io->sAmpleThisWord.uiAmbigCount =
					pSetup_io->sAmpleNextWord.uiAmbigCount;
pSetup_io->sAmpleThisWord.bFoundRoot   = pSetup_io->sAmpleNextWord.bFoundRoot;
#ifndef hab33127
pSetup_io->sAmpleThisWord.bUsesPrevWord   =
					   pSetup_io->sAmpleNextWord.bUsesPrevWord;
pSetup_io->sAmpleThisWord.bUsesNextWord   =
					   pSetup_io->sAmpleNextWord.bUsesNextWord;
#endif // hab33127
#ifndef hab33169
#ifdef EXPERIMENTAL
pSetup_io->sAmpleThisWord.pParses      = pSetup_io->sAmpleNextWord.pParses;
#endif /* EXPERIMENTAL */
#endif /* hab33169 */

pSetup_io->sAmpleNextWord.pTemplate    = readTemplateFromText(infp,
						   &pSetup_io->sData.sTextCtl);
pSetup_io->sAmpleNextWord.pHeadlists   = NULL;
pSetup_io->sAmpleNextWord.pszRemaining = NULL;
pSetup_io->sAmpleNextWord.uiAmbigCount = 0;
pSetup_io->sAmpleNextWord.bFoundRoot   = FALSE;
#ifndef hab33127
pSetup_io->sAmpleNextWord.bUsesPrevWord = FALSE;
pSetup_io->sAmpleNextWord.bUsesNextWord = FALSE;
#endif // hab33127
#ifndef hab33169
#ifdef EXPERIMENTAL
pSetup_io->sAmpleNextWord.pParses      = NULL;
#endif /* EXPERIMENTAL */
#endif /* hab33169 */

if (pSetup_io->sAmpleNextWord.pTemplate == NULL)
	{
	return FALSE;
	}
else
	{
	/*
	 *  set the flags for which optional fields are wanted
	 */
	pSetup_io->sAmpleNextWord.pTemplate->iOutputFlags =
							 pSetup_io->sData.iOutputFlags;
	return(TRUE);
	}
}

/***************************************************************************
 * NAME
 *    readAmpleWord
 * ARGUMENTS
 *    infp - pointer to input FILE
 * DESCRIPTION
 *    read a word of text into pSetup_io->sAmpleThisWord
 * RETURN VALUE
 *    TRUE if word read, FALSE if EOF
 */
static int readAmpleWord(infp, pSetup_io)
FILE *		infp;
AmpleSetup *	pSetup_io;
{
if (	(pSetup_io->sAmplePreviousWord.pTemplate == NULL) &&
	(pSetup_io->sAmpleThisWord.pTemplate == NULL) &&
	(pSetup_io->sAmpleNextWord.pTemplate == NULL) )
	{
	/*
	 *	prime the pump by filling pSetup_io->sAmpleThisWord with an empty
	 *	value, and pSetup_io->sAmpleNextWord with the first word
	 */
	fill_template(infp, pSetup_io);
	pSetup_io->sAmpleThisWord.pTemplate = init_template(pSetup_io);
	}
/*
 *  read the next input word (one ahead of actual processing)
 *  return appropriate value
 */
if (	fill_template(infp, pSetup_io) ||
	(pSetup_io->sAmpleThisWord.pTemplate != NULL))
	{
	if (    (pSetup_io->sAmpleThisWord.pTemplate->paWord    != NULL) ||
		(pSetup_io->sAmpleThisWord.pTemplate->pszFormat != NULL) )
	return(TRUE);
	}
return(FALSE);
}

/* following added by hab 1999.03.05 (this is the same as the one in ample.c
   except that there is no "Analysis Performed" line; hence no pszTime_in
   parameter) */

/*****************************************************************************
 * NAME
 *    print_header
 * DESCRIPTION
 *    print the program header to the indicated file (possibly the screen)
 * RETURN VALUE
 *    none
 */
static void print_header(pOutFP_in)
FILE *	pOutFP_in;
{
#ifdef EXPERIMENTAL
fprintf(pOutFP_in,
	"XAMPLE: A Morphological Parser for Linguistic Exploration\n");
#else
fprintf(pOutFP_in,
	"AMPLE: A Morphological Parser for Linguistic Exploration\n");
#endif /* EXPERIMENTAL */
fprintf(pOutFP_in, "Version %d.%d%c%d (%s), Copyright %s SIL, Inc.\n",
	iAmpleVersion_g, iAmpleRevision_g, cAmplePatchSep_g,
	iAmplePatchlevel_g, pszAmpleDate_g, pszAmpleYear_g);
#ifdef EXPERIMENTAL
fprintf(pOutFP_in,
	"    AMPLE with experimental enhancement: PC-PATR word grammar\n");
#endif /* EXPERIMENTAL */
#ifdef __DATE__
fprintf(pOutFP_in, pszAmpleCompileFormat_g,
	pszAmpleCompileDate_g, pszAmpleCompileTime_g);
#else
if (pszAmpleTestVersion_g != NULL)
	fputs(pszAmpleTestVersion_g, pOutFP_in);
#endif
#ifdef __GO32__
fprintf(pOutFP_in,
#ifdef __DJGPP__
"For 386 CPU (or better) under MS-DOS [compiled with DJGPP %d.%d/GNU C %d.%d]\n",
	__DJGPP__, __DJGPP_MINOR__,
#else
	"For 386 CPU (or better) under MS-DOS [compiled with DJGPP/GNU C %d.%d]\n",
#endif
	__GNUC__, __GNUC_MINOR__ );
#endif
}

/*****************************************************************************
 * NAME
 *    AmpleParseFile
 * DESCRIPTION
 *    parse an input text file, producing an output analysis file
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * AmpleParseFile(
	AmpleSetup * pSetup_io,
	const char * pszInputFile_in,
	const char * pszOutputFile_in)
{
FILE *		infp;
FILE *		outfp;
int		i;
AmpleTestList *	flp;
int		bParsedAlready = FALSE;
unsigned	uiAmbigCount   = 0;
long		ambwds;
long		ambtot;
long		iFailureCount = 0L;
void *		pAResult = NULL;
const char *	pszResult = szAmpleSuccess_m;
static char	szReportMessage_s[] = "\nINPUT: %ld word%s processed.\n";
time_t		clock;		/* hab 1999.03.05 */
char *		pszTime;	/* hab 1999.03.05 */
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	{
	pLogFP_m      = NULL;
	iDebugLevel_m = 0;
	return szAmpleDLLCrash_m;
	}
if (pSetup_io->pszLogFilename != NULL)
	{
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
	/*
	 *  print header and analysis performed info  (added by hab 1999.03.05)
	 */
	print_header( pSetup_io->sData.pLogFP );
	time( &clock );
	pszTime = ctime(&clock);
	fprintf( pSetup_io->sData.pLogFP, "\nAnalysis Performed %s", pszTime );
	}
pLogFP_m      = pSetup_io->sData.pLogFP;
iDebugLevel_m = pSetup_io->sData.iDebugLevel;
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
if (pSetup_io->sData.pLogFP != NULL)
	{
	fprintf( pSetup_io->sData.pLogFP, "\nInput  file: %s\n", pszInputFile_in);
	fprintf( pSetup_io->sData.pLogFP, "Output file: %s\n", pszOutputFile_in);
	}
/*
 *  if tracing with SGML output, initiate the trace
 */
initiateAmpleTrace( &pSetup_io->sData );
/*
 *	initialize processing parameters and counters
 */
				/* hab 1999.03.11 */
pSetup_io->sData.iOutputFlags = getOutputFlags(pSetup_io,
											   pSetup_io->sData.iOutputFlags);
pSetup_io->sData.bMorphemeLookahead = FALSE;
pSetup_io->sData.bLookaheadDone     = FALSE;
pSetup_io->sData.bMultiDependency   = FALSE;
memset(&pSetup_io->sAmplePreviousWord, 0, sizeof(AmpleWord));
memset(&pSetup_io->sAmpleThisWord,     0, sizeof(AmpleWord));
memset(&pSetup_io->sAmpleNextWord,     0, sizeof(AmpleWord));
pSetup_io->uiWordCount = 0;
for ( i = 0 ; i < MAXAMBIG ; ++i )
	pSetup_io->aiAmbigCounts[i] = 0;
for ( flp = pSetup_io->sData.pPrefixSuccTests ; flp ; flp = flp->pNext )
	{
	flp->uiTestCallCount = 0L;
	flp->uiTestFailCount = 0L;
	}
				/* hab 3.2.4 added Infix */
for ( flp = pSetup_io->sData.pInfixSuccTests ; flp ; flp = flp->pNext )
	{
	flp->uiTestCallCount = 0L;
	flp->uiTestFailCount = 0L;
	}
for ( flp = pSetup_io->sData.pRootSuccTests ; flp ; flp = flp->pNext )
	{
	flp->uiTestCallCount = 0L;
	flp->uiTestFailCount = 0L;
	}
for ( flp = pSetup_io->sData.pSuffixSuccTests ; flp ; flp = flp->pNext )
	{
	flp->uiTestCallCount = 0L;
	flp->uiTestFailCount = 0L;
	}
for ( flp = pSetup_io->sData.pFinalTests ; flp ; flp = flp->pNext )
	{
	flp->uiTestCallCount = 0L;
	flp->uiTestFailCount = 0L;
	}
/*
 *	process text one word at a time
 */
switch (pSetup_io->eOutputStyle)
	{
	case Ana:
	/* nothing to do */
	break;

	case AResult:
	//jdh june 14 2000 commented out: fprintf(outfp, "<!DOCTYPE AResult SYSTEM \"aresult.dtd\">\n");
	fprintf(outfp, "<AResult source=\"AmpleDLL\">\n");
	break;

#ifndef hab34112
#ifdef EXPERIMENTAL
	case FWParse:
	/* not yet implemented */
	break;
#endif /* EXPERIMENTAL */
#endif /* hab34112 */

	case Ptext:
	/* not yet implemented */
	break;
	}
while (readAmpleWord(infp, pSetup_io) &&
	   (pSetup_io->sAmpleThisWord.pTemplate != NULL))
	{
	if (pSetup_io->sAmpleThisWord.pTemplate->paWord != NULL)
	{
	if (!bParsedAlready)
		uiAmbigCount = analyzeAmpleWord(&pSetup_io->sAmpleThisWord,
						&pSetup_io->sData);
	bParsedAlready = FALSE;
	if (uiAmbigCount == 0)
	  ++iFailureCount;		/* the analysis failed */
	else
		{
		if (pSetup_io->sAmpleThisWord.bUsesNextWord &&
		(pSetup_io->sAmpleNextWord.pTemplate != NULL) &&
		(pSetup_io->sAmpleNextWord.pTemplate->paWord != NULL) )
			{
		uiAmbigCount = analyzeAmpleWord(&pSetup_io->sAmpleNextWord,
						&pSetup_io->sData);
		if (uiAmbigCount == 0)
		  ++iFailureCount;	/* the analysis failed */
		else if (pSetup_io->sAmpleNextWord.bUsesNextWord)
			{
			/* warning message */
			if (pSetup_io->sData.pLogFP != NULL)
				{
			fprintf(pSetup_io->sData.pLogFP,
				"\nWARNING:  Multiple dependency:  %s %s\n",
				 pSetup_io->sAmpleThisWord.pTemplate->pszOrigWord,
				 pSetup_io->sAmpleNextWord.pTemplate->pszOrigWord);
			}
			}
		bParsedAlready = TRUE;
		}
		if (pSetup_io->sAmpleThisWord.bUsesPrevWord ||
		pSetup_io->sAmpleThisWord.bUsesNextWord)
			{
		pSetup_io->sData.bLookaheadDone = TRUE;
		refineAmpleAnalysis(&pSetup_io->sAmpleThisWord,
					&pSetup_io->sAmplePreviousWord,
					&pSetup_io->sAmpleNextWord,
					&pSetup_io->sData);
		pSetup_io->sData.bLookaheadDone = FALSE;
		}
		}
	report_results(pSetup_io);
	pSetup_io->uiWordCount++;
	}
	/*
	 *  output the results of analysis
	 */
	switch (pSetup_io->eOutputStyle)
	{
	case Ana:
		writeTemplate(outfp, pszOutputFile_in,
			  pSetup_io->sAmpleThisWord.pTemplate,
			  &pSetup_io->sData.sTextCtl);
#ifndef hab33169
#ifdef EXPERIMENTAL
		writeAmpleParses(outfp, pSetup_io->sAmpleThisWord.pParses,
				 &pSetup_io->sData);
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
		break;

	case AResult:
		writeAResultToFile(&pSetup_io->sAmpleThisWord,
				   &pSetup_io->sData.sTextCtl,
				   outfp);
		break;

	case Ptext:
		/* not yet implemented */
		break;
	}
	}
switch (pSetup_io->eOutputStyle)
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
eraseAmpleWord( &pSetup_io->sAmplePreviousWord, &pSetup_io->sData );
fclose(infp);
fflush(outfp);
checkFileError( outfp, "AMPLE320.DLL / AmpleParseFile()", pszOutputFile_in );
fclose(outfp);
/*
 *  if tracing with SGML output, terminate the trace
 */
terminateAmpleTrace( & pSetup_io->sData );
/*
 *	output statistical counts
 */
reportMessage(TRUE, szReportMessage_s,
		  pSetup_io->uiWordCount,
		  (pSetup_io->uiWordCount == 1) ? "" : "s" );
if (pSetup_io->sData.pLogFP != NULL)
	{
	/*
	 *  print the statistics header
	 */
	fprintf( pSetup_io->sData.pLogFP, "\nANALYSIS STATISTICS: %4ld word%s",
		 pSetup_io->uiWordCount,
		 (pSetup_io->uiWordCount == 1) ? "" : "s" );

	fprintf( pSetup_io->sData.pLogFP, " processed.\n");
	/*
	 *  print the ambiguity levels
	 */
	ambwds = ambtot = 0;
	fprintf( pSetup_io->sData.pLogFP, "   Ambiguity Levels:\n");
	for ( i = 0 ; i <= MAXAMBIG ; ++i )
	{
	if (pSetup_io->aiAmbigCounts[i] > 0)
		{
		fprintf( pSetup_io->sData.pLogFP,
			 "%25ld word%c with %2d %sanalys%cs.\n",
			 pSetup_io->aiAmbigCounts[i],
			 (pSetup_io->aiAmbigCounts[i]==1) ? ' ' : 's',
			 i, (i==MAXAMBIG) ? "or more " : "", (i==1) ? 'i' : 'e' );
		/*
		 *  Count ambig words and total ambigs
		 */
		if (i > 1)			    /* If ambiguous */
		{
		ambwds += pSetup_io->aiAmbigCounts[i];
		ambtot += (i - 1) * pSetup_io->aiAmbigCounts[i];
		}
		}
	}
	/* 1.9u BJY check -p option */
	if (    pSetup_io->bShowPercentages &&
		( pSetup_io->uiWordCount - pSetup_io->aiAmbigCounts[0] ) > 0)
	{
	fprintf( pSetup_io->sData.pLogFP,
		 "   Percentage of analyzed words ambiguous: %ld%%\n",
		 ambwds * 100 /
			 ( pSetup_io->uiWordCount - pSetup_io->aiAmbigCounts[0]) );
	fprintf( pSetup_io->sData.pLogFP,
		 "   Excess ambiguities over analyzed words: %ld%%\n",
		 ambtot * 100 /
			 ( pSetup_io->uiWordCount - pSetup_io->aiAmbigCounts[0]) );
	}
	/*
	 *  print the test statistics
	 */
	if (pSetup_io->sData.iMaxPrefixCount)
	show_test("   Prefix", pSetup_io->sData.pPrefixSuccTests, pSetup_io);
	if (pSetup_io->sData.iMaxInfixCount)
	show_test("   Infix", pSetup_io->sData.pInfixSuccTests, pSetup_io);
	if (pSetup_io->sData.iMaxInterfixCount)
	show_test("   Interfix", pSetup_io->sData.pInterfixSuccTests, pSetup_io);
	show_test("   Root", pSetup_io->sData.pRootSuccTests, pSetup_io);
	if (pSetup_io->sData.iMaxSuffixCount)
	show_test("   Suffix", pSetup_io->sData.pSuffixSuccTests, pSetup_io);
	show_test("   Final", pSetup_io->sData.pFinalTests, pSetup_io);
#ifndef hab33169
#ifdef EXPERIMENTAL
	/*
	 *  print the PATR grammar statistics
	 */
	if (pSetup_io->sData.sPATR.pGrammar != NULL)
	  {
	fprintf( pSetup_io->sData.pLogFP,
		 "\n%24s called %5lu time%s rejected %ld (skipped %ld).\n",
		 "PC-PATR word parse",
		 pSetup_io->sData.uiPATRCallCount,
		 (pSetup_io->sData.uiPATRCallCount == 1) ? ", " : "s,",
		 pSetup_io->sData.uiPATRFailCount,
		 pSetup_io->sData.uiPATRSkipCount);
	  }
#endif /* EXPERIMENTAL */
#endif /* hab33169 */
	/*
	 *  terminate this statistical summary
	 */
	fprintf( pSetup_io->sData.pLogFP, "\n");
	}

close_and_return:
if (pSetup_io->sData.pLogFP != NULL)
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}
pLogFP_m      = NULL;
iDebugLevel_m = 0;
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
DllExport const char * AmpleUpdateEntry(
	AmpleSetup * pSetup_io,
	const char * pszNewEntry_in)
{
int	iStatus;
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	{
	pLogFP_m      = NULL;
	iDebugLevel_m = 0;
	return szAmpleDLLCrash_m;
	}
if (pSetup_io->pszLogFilename != NULL)
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
pLogFP_m      = pSetup_io->sData.pLogFP;
iDebugLevel_m = pSetup_io->sData.iDebugLevel;

iStatus = updateAmpleDictEntry(pszNewEntry_in, &pSetup_io->sData);

if (pSetup_io->sData.pLogFP != NULL)
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}
pLogFP_m      = NULL;
iDebugLevel_m = 0;
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
DllExport const char * AmpleWriteDictionary(
	AmpleSetup * pSetup_in,
	const char * pszFilePath_in)
{
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_in))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	{
	pLogFP_m      = NULL;
	iDebugLevel_m = 0;
	return szAmpleDLLCrash_m;
	}
if (pSetup_in->pszLogFilename != NULL)
	pSetup_in->sData.pLogFP = fopen(pSetup_in->pszLogFilename, "a");
pLogFP_m      = pSetup_in->sData.pLogFP;
iDebugLevel_m = pSetup_in->sData.iDebugLevel;
/*
 *  write the dictionary contents to the indicated file
 */
writeAmpleDictionary(pszFilePath_in, &pSetup_in->sData);

if (pSetup_in->sData.pLogFP != NULL)
	{
	fclose(pSetup_in->sData.pLogFP);
	pSetup_in->sData.pLogFP = NULL;
	}
pLogFP_m      = NULL;
iDebugLevel_m = 0;
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
DllExport const char * AmpleReset(
	AmpleSetup * pSetup_io)
{
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if (pSetup_io->sData.pLogFP != NULL)
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}
resetAmpleGlobals(pSetup_io);

return szAmpleSuccess_m;
}

/* following function added by hab 1999.03.05 */
/*****************************************************************************
 * NAME
 *    AmpleReportVersion
 * DESCRIPTION
 *    report version information to the log file, if any
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * AmpleReportVersion(
	AmpleSetup * pSetup_io)
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if (pSetup_io->pszLogFilename != NULL)
	{
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
	print_header(pSetup_io->sData.pLogFP, NULL);
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}

return szAmpleSuccess_m;
}

/* following function added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    AmpleInitializeMorphChecking
 * DESCRIPTION
 *    initialize the arrays for morphname and allomorph checking
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * AmpleInitializeMorphChecking(
	AmpleSetup * pSetup_io)
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if (pSetup_io->pszLogFilename != NULL)
	{
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
/*
 *  allocate space for morpheme checking
 */
	initAmpleMorphChecking(TRUE, &pSetup_io->sData);
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}

return szAmpleSuccess_m;
}

/* following function added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    AmpleCheckMorphReferences
 * DESCRIPTION
 *    check that all referenced morphnames are defined in the dictionaries.
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * AmpleCheckMorphReferences(
	AmpleSetup * pSetup_io)
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if (pSetup_io->pszLogFilename != NULL)
	{
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
/*
 *  check the morphnames in all the allomorph environment constraints and
 *   co-occurrence constraints
 */
	checkAmpleMorphs(TRUE,
			 &pSetup_io->sData,
			 FALSE);	/* 3.3.3.1 hab; added FALSE to preserve data */
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}

return szAmpleSuccess_m;
}

/* following function added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    AmpleVerifyLoading
 * DESCRIPTION
 *    perform some verifying output to the log file
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * AmpleVerifyLoading(
	AmpleSetup * pSetup_io)
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

pSetup_io->bVerifyLoading = TRUE;
if (pSetup_io->pszLogFilename != NULL)
	{
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
	fprintf( pSetup_io->sData.pLogFP, "\n");
	/* If selective trace, print file name */
	if ( pSetup_io->sData.pszSelectiveAnalFile )
		fprintf( pSetup_io->sData.pLogFP, "Selective trace from file %s\n",
		 pSetup_io->sData.pszSelectiveAnalFile );
	/* Print header for file list */
	fprintf( pSetup_io->sData.pLogFP,
		 "Control files and dictionary files:\n");
	/*
	 *	write category classes, string classes, punctuation classes,
	 *  morpheme classes, and morphemeco-occurrence constraints to the log file
	 */
	writeAmpleCategClasses(pSetup_io->sData.pLogFP,
			   pSetup_io->sData.pCategories,
			   pSetup_io->sData.pCategoryClasses);
	writeStringClasses(pSetup_io->sData.pLogFP,
			   pSetup_io->sData.pStringClasses);
				/* 3.3.0 hab */
	writePunctClasses(pSetup_io->sData.pLogFP,
			  pSetup_io->sData.pPunctClasses);
	writeAmpleMorphClasses(pSetup_io->sData.pLogFP,
			   pSetup_io->sData.pMorphClasses);
	writeAmpleMorphConstraints(pSetup_io->sData.pLogFP,
				   &pSetup_io->sData);
#ifdef EXPERIMENTAL
#ifndef hab35013
	writeAmpleNeverConstraints(pSetup_io->sData.pLogFP,
				   &pSetup_io->sData);
#endif /* hab35013 */
#endif /* EXPERIMENTAL */
	/* tests */
	writeAmpleTests( "Prefix", &pSetup_io->sData );
	writeAmpleTests( "Infix",  &pSetup_io->sData );
	writeAmpleTests( "Root",   &pSetup_io->sData );
	writeAmpleTests( "Suffix", &pSetup_io->sData );
	writeAmpleTests( "Final",  &pSetup_io->sData );
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
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
	return i;
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
static const char * setDebugAllomorphs(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->sData.bDebugAllomorphConds = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->sData.bDebugAllomorphConds = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->sData.bDebugAllomorphConds = FALSE;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}


/*****************************************************************************
 * NAME
 *    setEnableAllomorphIDs
 * DESCRIPTION
 *
 * RETURN VALUE
 *    status string indicating success or failure
 *	jdh 2002.1.15 added
 */
static const char * setEnableAllomorphIDs(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->sData.bEnableAllomorphIDs = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->sData.bEnableAllomorphIDs = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->sData.bEnableAllomorphIDs = FALSE;
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
static const char * setCommentChar(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->sData.cBeginComment = '|';	/* default value */
else
	pSetup_io->sData.cBeginComment = *pszValue_in;
return szAmpleSuccess_m;
}

#ifndef hab36516
#ifdef EXPERIMENTAL
/*****************************************************************************
 * NAME
 *    setMaxAnalysesToReturn
 * DESCRIPTION
 *    set the maximum number of analyses to return
 *      (MAX_ANALYSES_TO_RETURN_NO_LIMIT = no limit)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setMaxAnalysesToReturn(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->sData.iMaxAnalysesToReturn = MAX_ANALYSES_TO_RETURN_NO_LIMIT;
else
	pSetup_io->sData.iMaxAnalysesToReturn = atoi(pszValue_in);
return szAmpleSuccess_m;
}
#endif /* EXPERIMENTAL */
#endif /* hab36516 */

/*****************************************************************************
 * NAME
 *    setMaxTrieDepth
 * DESCRIPTION
 *    set the "maximum trie depth" parameter (AMPLE's -d command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setMaxTrieDepth(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->sData.iMaxTrieDepth = 2;	/* default value */
else
	pSetup_io->sData.iMaxTrieDepth = atoi(pszValue_in);
if (pSetup_io->sData.iMaxTrieDepth < 1)
	pSetup_io->sData.iMaxTrieDepth = 1;
if (pSetup_io->sData.iMaxTrieDepth >= MAXMORPH)
	pSetup_io->sData.iMaxTrieDepth = MAXMORPH - 1;
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
static const char * setRootGlosses(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->sData.bRootGlosses = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->sData.bRootGlosses = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->sData.bRootGlosses = FALSE;
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
static const char * setMaxMorphnameLength(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->sData.iMaxMorphnameLength = 15;	/* default value */
else
	pSetup_io->sData.iMaxMorphnameLength = atoi(pszValue_in);
if (pSetup_io->sData.iMaxMorphnameLength < 1)
	pSetup_io->sData.iMaxMorphnameLength = 1;
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
static const char * setSelectiveAnalysisFile(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
int	iLoad;

freeAmpleSelectiveAnalInfo( &pSetup_io->sData );
if (pszValue_in == NULL)
	{
	return szAmpleSuccess_m;
	}

if (pSetup_io->pszLogFilename != NULL)
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");

iLoad = loadAmpleSelectiveAnalFile(pszValue_in, &pSetup_io->sData);

if (pSetup_io->sData.pLogFP != NULL)
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
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
static const char * setTraceAnalysis(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->sData.eTraceAnalysis = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) ||
	 (_stricmp(pszValue_in, "ON") == 0) )
	pSetup_io->sData.eTraceAnalysis = AMPLE_TRACE_ON;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) ||
	 (_stricmp(pszValue_in, "OFF") == 0) )
	pSetup_io->sData.eTraceAnalysis = AMPLE_TRACE_OFF;
else if (_stricmp(pszValue_in, "SGML") == 0)
	pSetup_io->sData.eTraceAnalysis = AMPLE_TRACE_SGML;
else if (_stricmp(pszValue_in, "XML") == 0)
	pSetup_io->sData.eTraceAnalysis = AMPLE_TRACE_XML;
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
static const char * setDebugLevel(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->sData.iDebugLevel = 0;	/* default value */
else
	pSetup_io->sData.iDebugLevel = atoi(pszValue_in);
if (pSetup_io->sData.iDebugLevel < 0)
	pSetup_io->sData.iDebugLevel = 0;
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
static const char * setLogFile(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
pszValue_in = checkEmptyString(pszValue_in);
if (pSetup_io->pszLogFilename != NULL)
	{
	reportMessage(TRUE, "Closing open log file %s", pSetup_io->pszLogFilename);
	freeMemory(pSetup_io->pszLogFilename);
	pSetup_io->pszLogFilename = NULL;	/* default value */
	}
if (pSetup_io->sData.pLogFP != NULL)
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}
if (pszValue_in == NULL)
	return szAmpleSuccess_m;

pSetup_io->sData.pLogFP = fopen(pszValue_in,
				pSetup_io->bAppendLogFile ? "a" : "w");
if (pSetup_io->sData.pLogFP == NULL)
	{
	reportError(ERROR_MSG, "Cannot open log file %s", pszValue_in);
	return szBadOutputFile_m;
	}
else
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	pSetup_io->pszLogFilename = duplicateString( pszValue_in );
	reportMessage(TRUE, "Opening log file %s (%s mode)",
		  pSetup_io->pszLogFilename, pSetup_io->bAppendLogFile ? "append" : "create");
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
static const char * setAppendLogFile(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->bAppendLogFile = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->bAppendLogFile = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->bAppendLogFile = FALSE;
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
static const char * setOutputStyle(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->eOutputStyle = Ana;	/* default value */
else if (_stricmp(pszValue_in, "Ana") == 0)
	pSetup_io->eOutputStyle = Ana;
else if (_stricmp(pszValue_in, "AResult") == 0)
	pSetup_io->eOutputStyle = AResult;
else if (_stricmp(pszValue_in, "Ptext") == 0)
	pSetup_io->eOutputStyle = Ptext;
#ifndef hab34112
#ifdef EXPERIMENTAL
else if (_stricmp(pszValue_in, "FWParse") == 0)
	pSetup_io->eOutputStyle = FWParse;
#endif /* EXPERIMENTAL */
#endif /* hab34112 */
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setStoreErrorString
 * DESCRIPTION
 *    set the "store error messages in a string" parameter
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setStoreErrorString(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->bStoreErrorString = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->bStoreErrorString = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->bStoreErrorString = FALSE;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setErrorMessages
 * DESCRIPTION
 *    set the "store error messages in a string" parameter
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setErrorMessages(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
return szAmpleSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setShowPercentages
 * DESCRIPTION
 *    set the "show percentages" parameter (AMPLE's -p command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setShowPercentages(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->bShowPercentages = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->bShowPercentages = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->bShowPercentages = FALSE;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setCheckMorphReferences
 * DESCRIPTION
 *    set the "check morphname references" parameter (AMPLE's -r command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setCheckMorphReferences(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->bCheckMorphReferences = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->bCheckMorphReferences = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->bCheckMorphReferences = FALSE;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setVerifyLoading
 * DESCRIPTION
 *    set the "verify loading" parameter (AMPLE's -v command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setVerifyLoading(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->bVerifyLoading = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->bVerifyLoading = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->bVerifyLoading = FALSE;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setOutputProperties
 * DESCRIPTION
 *    set the "output properties" parameter (AMPLE's -w p and -x p command line options)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setOutputProperties(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->bOutputProperties = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->bOutputProperties = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->bOutputProperties = FALSE;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setOutputOriginalWord
 * DESCRIPTION
 *    set the "output original word" parameter (AMPLE's -w w and -x w command line options)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setOutputOriginalWord(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->bOutputOriginalWord = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->bOutputOriginalWord = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->bOutputOriginalWord = FALSE;
else
	return szInvalidParameterValue_m;

return szAmpleSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setOutputDecomposition
 * DESCRIPTION
 *    set the "output decomposition" parameter (AMPLE's -w d and -x d command line options)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setOutputDecomposition(
	const char *	pszValue_in,
	AmpleSetup *	pSetup_io)
{
if (pszValue_in == NULL)
	pSetup_io->bOutputDecomposition = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
	pSetup_io->bOutputDecomposition = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
	pSetup_io->bOutputDecomposition = FALSE;
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
DllExport const char * AmpleSetParameter(
	AmpleSetup * pSetup_io,
	const char * pszName_in,
	const char * pszValue_in)
{
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
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
	pszValue_in += strspn(pszValue_in, szWhitespace_g);
/*
 *  set the parameter value
 */
switch (findParameterIndex(pszName_in))
	{
	case DEBUG_ALLOMORPH_CONDS:
	return setDebugAllomorphs(pszValue_in, pSetup_io);

	case BEGIN_COMMENT:
	return setCommentChar(pszValue_in, pSetup_io);

	case MAX_TRIE_DEPTH:
	return setMaxTrieDepth(pszValue_in, pSetup_io);

	case ROOT_GLOSSES:
	return setRootGlosses(pszValue_in, pSetup_io);

	case MAX_MORPHNAME_LENGTH:
	return setMaxMorphnameLength(pszValue_in, pSetup_io);

	case SELECTIVE_ANALYSIS_FILE:
	return setSelectiveAnalysisFile(pszValue_in, pSetup_io);

	case TRACE_ANALYSIS:
	return setTraceAnalysis(pszValue_in, pSetup_io);

	case DEBUG_LEVEL:
	return setDebugLevel(pszValue_in, pSetup_io);

	case LOG_FILE:
	return setLogFile(pszValue_in, pSetup_io);

	case APPEND_LOG_FILE:
	return setAppendLogFile(pszValue_in, pSetup_io);

	case OUTPUT_STYLE:
	return setOutputStyle(pszValue_in, pSetup_io);

	case STORE_ERROR_STRING:
	return setStoreErrorString(pszValue_in, pSetup_io);

	case ERROR_MESSAGES:
	return setErrorMessages(pszValue_in, pSetup_io);

	case SHOW_PERCENTAGES:	/* hab 1999.03.11 */
	return setShowPercentages(pszValue_in, pSetup_io);

	case CHECK_MORPHNAME_REFS:	/* hab 1999.03.11 */
	return setCheckMorphReferences(pszValue_in, pSetup_io);

	case VERIFY_LOADING:	/* hab 1999.03.11 */
	return setVerifyLoading(pszValue_in, pSetup_io);

	case OUTPUT_PROPERTIES:	/* hab 1999.03.11 */
	return setOutputProperties(pszValue_in, pSetup_io);

	case OUTPUT_ORIGINAL_WORD:	/* hab 1999.03.11 */
	return setOutputOriginalWord(pszValue_in, pSetup_io);

	case OUTPUT_DECOMPOSITION:	/* hab 1999.03.11 */
	return setOutputDecomposition(pszValue_in, pSetup_io);

	case ALLOMORPH_IDS:	/* jdh 2002.1.15 */
		return setEnableAllomorphIDs(pszValue_in, pSetup_io);

#ifndef hab36516
#ifdef EXPERIMENTAL
	case MAX_ANALYSES_TO_RETURN:
		return setMaxAnalysesToReturn(pszValue_in, pSetup_io);
#endif
#endif
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
static const char * getDebugAllomorphs(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->sData.bDebugAllomorphConds)
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
static const char * getCommentChar(
	AmpleSetup *	pSetup_io)
{
szMessageBuffer_g[0] = pSetup_io->sData.cBeginComment;
szMessageBuffer_g[1] = NUL;

return szMessageBuffer_g;
}

#ifndef hab36516
/*****************************************************************************
 * NAME
 *    getEnableAllomorphIDs
 * DESCRIPTION
 *    get the maximum number of analyses to return
 *     (MAX_ANALYSES_TO_RETURN_NO_LIMIT = no limit)
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getEnableAllomorphIDs(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->sData.bRootGlosses)
	return "TRUE";
else
	return "FALSE";
}
#ifdef EXPERIMENTAL
/*****************************************************************************
 * NAME
 *    getMaxAnalysesToReturn
 * DESCRIPTION
 *    get the maximum number of analyses to return
 *     (MAX_ANALYSES_TO_RETURN_NO_LIMIT = no limit)
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getMaxAnalysesToReturn(
	AmpleSetup *	pSetup_io)
{
sprintf(szMessageBuffer_g, "%d", pSetup_io->sData.iMaxAnalysesToReturn);

return szMessageBuffer_g;
}
#endif /* EXPERIMENTAL */
#endif /* hab36516 */

/*****************************************************************************
 * NAME
 *    getMaxTrieDepth
 * DESCRIPTION
 *    get the "maximum trie depth" parameter (AMPLE's -d command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getMaxTrieDepth(
	AmpleSetup *	pSetup_io)
{
sprintf(szMessageBuffer_g, "%d", pSetup_io->sData.iMaxTrieDepth);

return szMessageBuffer_g;
}

/*****************************************************************************
 * NAME
 *    getRootGlosses
 * DESCRIPTION
 *    get the "root glosses" parameter (AMPLE's -g command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getRootGlosses(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->sData.bRootGlosses)
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
static const char * getMaxMorphnameLength(
	AmpleSetup *	pSetup_io)
{
sprintf(szMessageBuffer_g, "%d", pSetup_io->sData.iMaxMorphnameLength);

return szMessageBuffer_g;
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
static const char * getSelectiveAnalysisFile(
	AmpleSetup *	pSetup_io)
{
strcpy(szMessageBuffer_g,
	   pSetup_io->sData.pszSelectiveAnalFile ?
				pSetup_io->sData.pszSelectiveAnalFile : "");

return szMessageBuffer_g;
}

/*****************************************************************************
 * NAME
 *    getTraceAnalysis
 * DESCRIPTION
 *    get the "trace analysis" parameter (AMPLE's -t command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getTraceAnalysis(
	AmpleSetup *	pSetup_io)
{
switch (pSetup_io->sData.eTraceAnalysis)
	{
	case AMPLE_TRACE_OFF:
	return "OFF";
	case AMPLE_TRACE_ON:
	return "ON";
	case AMPLE_TRACE_SGML:
	return "SGML";
	case AMPLE_TRACE_XML:
	return "XML";
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
static const char * getDebugLevel(
	AmpleSetup *	pSetup_io)
{
sprintf(szMessageBuffer_g, "%d", pSetup_io->sData.iDebugLevel);

return szMessageBuffer_g;
}

/*****************************************************************************
 * NAME
 *    getLogFile
 * DESCRIPTION
 *    get the "log file" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getLogFile(
	AmpleSetup *	pSetup_io)
{
strcpy(szMessageBuffer_g,
	   pSetup_io->pszLogFilename ? pSetup_io->pszLogFilename : "");

return szMessageBuffer_g;
}

/*****************************************************************************
 * NAME
 *    getAppendLogFile
 * DESCRIPTION
 *    get the "append to log file" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getAppendLogFile(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->bAppendLogFile)
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
static const char * getOutputStyle(
	AmpleSetup *	pSetup_io)
{
switch (pSetup_io->eOutputStyle)
	{
	case Ana:		return "Ana";
	case AResult:	return "AResult";
	case Ptext:		return "Ptext";
#ifndef hab34112
#ifdef EXPERIMENTAL
	case FWParse:	return "FWParse";
#endif /* EXPERIMENTAL */
#endif /* hab34112 */
	default:		return "?";
	}
}

/*****************************************************************************
 * NAME
 *    getStoreErrorString
 * DESCRIPTION
 *    get the "store error messages in a string" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getStoreErrorString(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->bStoreErrorString)
	return "TRUE";
else
	return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getErrorMessages
 * DESCRIPTION
 *    get the "store error messages in a string" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getErrorMessages(
	AmpleSetup *	pSetup_io)
{
return "";
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    getShowPercentages
 * DESCRIPTION
 *    get the "show percentages" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getShowPercentages(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->bShowPercentages)
	return "TRUE";
else
	return "FALSE";
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    getCheckMorphReferences
 * DESCRIPTION
 *    get the "check morphname references" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getCheckMorphReferences(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->bCheckMorphReferences)
	return "TRUE";
else
	return "FALSE";
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    getOutputProperties
 * DESCRIPTION
 *    get the "output properties" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getOutputProperties(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->bOutputProperties)
	return "TRUE";
else
	return "FALSE";
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    getOutputOriginalWord
 * DESCRIPTION
 *    get the "output original word" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getOutputOriginalWord(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->bOutputOriginalWord)
	return "TRUE";
else
	return "FALSE";
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    getOutputDecomposition
 * DESCRIPTION
 *    get the "output Decomposition" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getOutputDecomposition(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->bOutputDecomposition)
	return "TRUE";
else
	return "FALSE";
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    getVerifyLoading
 * DESCRIPTION
 *    get the "verify loading" parameter
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getVerifyLoading(
	AmpleSetup *	pSetup_io)
{
if (pSetup_io->bVerifyLoading)
	return "TRUE";
else
	return "FALSE";
}

/*****************************************************************************
 * NAME
 *    AmpleGetParameter
 * DESCRIPTION
 *    retrieve an AMPLE parameter value
 * RETURN VALUE
 *    parameter value string
 */
DllExport const char * AmpleGetParameter(
	AmpleSetup * pSetup_io,
	const char * pszName_in)
{
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
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
pszName_in += strspn(pszName_in, szWhitespace_g);
/*
 *  get the parameter value
 */
switch (findParameterIndex(pszName_in))
	{
	case DEBUG_ALLOMORPH_CONDS:
	return getDebugAllomorphs(pSetup_io);

	case BEGIN_COMMENT:
	return getCommentChar(pSetup_io);

	case MAX_TRIE_DEPTH:
	return getMaxTrieDepth(pSetup_io);

	case ROOT_GLOSSES:
	return getRootGlosses(pSetup_io);

	case MAX_MORPHNAME_LENGTH:
	return getMaxMorphnameLength(pSetup_io);

	case SELECTIVE_ANALYSIS_FILE:
	return getSelectiveAnalysisFile(pSetup_io);

	case TRACE_ANALYSIS:
	return getTraceAnalysis(pSetup_io);

	case DEBUG_LEVEL:
	return getDebugLevel(pSetup_io);

	case LOG_FILE:
	return getLogFile(pSetup_io);

	case APPEND_LOG_FILE:
	return getAppendLogFile(pSetup_io);

	case OUTPUT_STYLE:
	return getOutputStyle(pSetup_io);

	case STORE_ERROR_STRING:
	return getStoreErrorString(pSetup_io);

	case ERROR_MESSAGES:
	return getErrorMessages(pSetup_io);

	case SHOW_PERCENTAGES:	/* hab 1999.03.11 */
	return getShowPercentages(pSetup_io);

	case CHECK_MORPHNAME_REFS:	/* hab 1999.03.11 */
	return getCheckMorphReferences(pSetup_io);

	case VERIFY_LOADING:	/* hab 1999.03.11 */
	return getVerifyLoading(pSetup_io);

	case OUTPUT_PROPERTIES:	/* hab 1999.03.11 */
	return getOutputProperties(pSetup_io);

	case OUTPUT_ORIGINAL_WORD:	/* hab 1999.03.11 */
	return getOutputOriginalWord(pSetup_io);

	case OUTPUT_DECOMPOSITION:	/* hab 1999.03.11 */
	return getOutputDecomposition(pSetup_io);

#ifndef hab36516
	case ALLOMORPH_IDS:
		return getEnableAllomorphIDs(pSetup_io);

#ifdef EXPERIMENTAL
	case MAX_ANALYSES_TO_RETURN:
		return getMaxAnalysesToReturn(pSetup_io);
#endif
#endif
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
DllExport const char * AmpleAddSelectiveAnalysisMorphs(
	AmpleSetup * pSetup_io,
	const char * pszMorphs_in)
{
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

if ((pszMorphs_in == NULL) || (*pszMorphs_in == NUL))
	return szMissingArgument_m;
addAmpleSelectiveAnalItem(pszMorphs_in, &pSetup_io->sData);
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
DllExport const char * AmpleRemoveSelectiveAnalysisMorphs(
	AmpleSetup * pSetup_io)
{
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	return szAmpleDLLCrash_m;

freeAmpleSelectiveAnalInfo( &pSetup_io->sData );
return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    AmpleInitializeTraceString
 * DESCRIPTION
 *    Set tracing to go to a string instead of a file.
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * AmpleInitializeTraceString(
	AmpleSetup * pSetup_io)
{
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
if (pSetup_io->sData.pszTrace == NULL)
	{
	pSetup_io->sData.pszTrace    = allocMemory(20000);
	pSetup_io->sData.uiTraceSize = 20000;
	memset(pSetup_io->sData.pszTrace, 0, pSetup_io->sData.uiTraceSize);
	}
return szAmpleSuccess_m;
}

/*****************************************************************************
 * NAME
 *    AmpleGetTraceString
 * DESCRIPTION
 *    Get the stored trace string.
 * RETURN VALUE
 *    trace string, or a status string indicating failure
 */
DllExport const char * AmpleGetTraceString(
	AmpleSetup * pSetup_io)
{
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
if (pSetup_io->sData.pszTrace != NULL)
	return pSetup_io->sData.pszTrace;
else
	return szNoTraceString_m;
}

#ifndef hab33126

/*****************************************************************************
 * NAME
 *    addAlloResultToBuffer
 * DESCRIPTION
 *    add the allomorph info in the list of allos to the buffer in
 *    <AlloResult> form
 * RETURN VALUE
 *    pointer to the buffer
 */
static char * addAlloResultToBuffer(
	AmpleAmlist *	pAlloList_in,
	const TextControl *	pTextCtl_in,
	char *		pszBuffer_out,
	size_t		uiBufferSize_in)  /* this doesn't count space for NUL*/
{
AmpleAmlist    *	pAL;
AmpleAllomorph *	pAllo;
AmpleMorpheme  *	pMorph;
char *			pszAlloResult;
size_t			uiSize;
size_t			uiRoom;
/*
 *  adjust pointers and counters for less redundant skipping
 */
uiSize        = strlen(pszBuffer_out);
pszAlloResult = pszBuffer_out + uiSize;
uiRoom        = uiBufferSize_in - uiSize;

#define CONCAT(psz) { \
	strncat(pszAlloResult, psz, uiRoom); \
	uiSize = strlen(pszAlloResult); \
	pszAlloResult += uiSize; \
	uiRoom -= uiSize; \
	}

 for (pAL = pAlloList_in; pAL; pAL = pAL->amlink)
   {
	 pAllo = pAL->amp;
	 if (pAllo != NULL)
	   {
	 CONCAT("<allo")
	 if (pAllo->pszAllomorphID != NULL)
	   {
		 CONCAT(" id=")
		 CONCAT(pAllo->pszAllomorphID)
	   }
	 CONCAT(" shape=#")
	 CONCAT(pAllo->pszAllomorph)
	 CONCAT("#")
	 pMorph = pAllo->pMorpheme;
	 if (pMorph != NULL)
	   {
		 CONCAT(" mname=")
		 CONCAT(pMorph->pszMorphName)
		 CONCAT(" type=")
#ifndef hab332010
		 switch (pMorph->iMorphType & ATYPE)
#else /* hab332010 */
		 switch (pMorph->iMorphType)
#endif /* hab332010 */
		   {
		   case AMPLE_PFX:
		 CONCAT("PFX")
		 break;
		   case AMPLE_IFX:
		 CONCAT("IFX")
		 break;
		   case AMPLE_ROOT:
		 CONCAT("ROOT")
		 break;
		   case AMPLE_NFXPFX: /* fall through */
		   case AMPLE_NFXSFX: /* fall through */
		   case AMPLE_NFX:
		 CONCAT("NFX")
		 break;
		   case AMPLE_NFXIFX:
		 CONCAT("NFXIFX")
		 break;
		   case AMPLE_SFX:
		 CONCAT("SFX")
		 break;
		   default:
		 CONCAT("UNKNOWN")
		   }
	   }
	 CONCAT(">\r\n")
	   }
   }
#undef CONCAT

return pszBuffer_out;
}

/*****************************************************************************
 * NAME
 *    AmpleGetAllAllomorphs
 * DESCRIPTION
 *    get all allomorphs which match the string for a given affix state
 *    the caller is responsible to keep track of the state
 * RETURN VALUE
 *    parse result string
 */
DllExport const char * AmpleGetAllAllomorphs(
	AmpleSetup * pSetup_io,
	const char * pszRestOfWord_in,
	const char * pszState_in)
{
AmpleAmlist *	pAlloList;
AmpleAmlist *	pAL;
AmpleAmlist *	pTempList;
const char *	pszResult = szOutputBuffer_g;
char * pszRest;
int iState;
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	{
	pLogFP_m      = NULL;
	iDebugLevel_m = 0;
	return szAmpleDLLCrash_m;
	}
if (pSetup_io->pszLogFilename != NULL)
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
pLogFP_m      = pSetup_io->sData.pLogFP;

memset(szOutputBuffer_g, 0, sizeof(szOutputBuffer_g));
strncpy(szOutputBuffer_g, "<AlloResult>\r\n", sizeof(szOutputBuffer_g)-1);
				/* get list of matching allomorphs */
pszRest = (char *)pszRestOfWord_in;
if (strcmp(pszState_in, "BOW") == 0)
  iState = AMPLE_STATE_BOW;
else if (strcmp(pszState_in, "PFX") == 0)
  iState = AMPLE_STATE_PREFIX;
else if (strcmp(pszState_in, "ROOT") == 0)
  iState = AMPLE_STATE_ROOT;
else if (strcmp(pszState_in, "SFX") == 0)
  iState = AMPLE_STATE_SUFFIX;
else if (strcmp(pszState_in, "NFX") == 0)
  iState = AMPLE_STATE_INTERFIX;
else if (strcmp(pszState_in, "EOW") == 0)
  iState = AMPLE_STATE_EOW;
else
  iState = 0;
pAlloList = getAllAllomorphs(pszRest, iState, &pSetup_io->sData);
				/* format results */
addAlloResultToBuffer(pAlloList, &pSetup_io->sData.sTextCtl,
			  szOutputBuffer_g, sizeof(szOutputBuffer_g)-1);
strncat(szOutputBuffer_g, "</AlloResult>\r\n",
	sizeof(szOutputBuffer_g) - strlen(szOutputBuffer_g) - 1);
				/* free memory used by allo list */
for ( pAL = pAlloList ; pAL ; pAL = pTempList )
  {
	pTempList = pAL->amlink;
	freeMemory( (char *)pAL );
  }
#ifdef _DEBUG
if (pSetup_io->sData.pLogFP != NULL)
	{
	fprintf(pSetup_io->sData.pLogFP, "\nAmpleGetAllAllomorphs()\nInput =\n");
	fputs(pszRestOfWord_in,  pSetup_io->sData.pLogFP);
	fprintf(pSetup_io->sData.pLogFP, "\tetype =");
	fputs(pszState_in,  pSetup_io->sData.pLogFP);
	fprintf(pSetup_io->sData.pLogFP, "\nOutput =\n");
	fputs(szOutputBuffer_g, pSetup_io->sData.pLogFP);
	fprintf(pSetup_io->sData.pLogFP, "\nEnd of AmpleGetAllAllomorphs()\n");
	}
#endif

if (pSetup_io->sData.pLogFP != NULL)
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}

pLogFP_m      = NULL;
iDebugLevel_m = 0;
return pszResult;
}
#endif /* hab33126 */

#ifndef hab33148
/*****************************************************************************
 * NAME
 *    AmpleApplyInputChangesToWord
 * DESCRIPTION
 *    Apply any input text changes to the given word
 * RETURN VALUE
 *    The word after input text changes have applied
 */
DllExport const char * AmpleApplyInputChangesToWord(
	AmpleSetup * pSetup_io,
	const char * pszWord_in)
{
const char *	pszResult = szOutputBuffer_g;
char * pszWord;
const char * pszChangedWord;
WordTemplate *pTemplate;
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	{
	pLogFP_m      = NULL;
	iDebugLevel_m = 0;
	return szAmpleDLLCrash_m;
	}
if (pSetup_io->pszLogFilename != NULL)
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
pLogFP_m      = pSetup_io->sData.pLogFP;

memset(szOutputBuffer_g, 0, sizeof(szOutputBuffer_g));
				/* run input word through input changes */
pszWord = (char *)pszWord_in;
pTemplate = readTemplateFromTextString(&pszWord,
					   &pSetup_io->sData.sTextCtl);
pszChangedWord = pszWord_in;	/* in case text changes fail... */
if (pTemplate && pTemplate->paWord)
  pszChangedWord = pTemplate->paWord[0]; /* always use the first */
strcpy(szOutputBuffer_g, pszChangedWord);

if (pTemplate)
  freeWordTemplate(pTemplate);

#ifdef _DEBUG
if (pSetup_io->sData.pLogFP != NULL)
	{
	fprintf(pSetup_io->sData.pLogFP, "\nAmpleApplyInputChangesToWord()\nInput =\n");
	fputs(pszWord_in,  pSetup_io->sData.pLogFP);
	fprintf(pSetup_io->sData.pLogFP, "\nOutput =\n");
	fputs(szOutputBuffer_g, pSetup_io->sData.pLogFP);
	fprintf(pSetup_io->sData.pLogFP, "\nEnd of AmpleApplyInputchangesToWord()\n");
	}
#endif

if (pSetup_io->sData.pLogFP != NULL)
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}

pLogFP_m      = NULL;
iDebugLevel_m = 0;
return pszResult;
}
#endif /* hab33148 */

#ifndef hab33169
#ifdef EXPERIMENTAL
/*****************************************************************************
 * NAME
 *    AmpleLoadGrammarFile
 * DESCRIPTION
 *    load a PC-PATR grammar file
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * AmpleLoadGrammarFile(
	AmpleSetup * pSetup_io,
	const char * pszGrammarFile_in)
{
const char *	pszResult = szAmpleSuccess_m;
/*
 *  verify a valid AMPLE setup
 */
if (!isValidSetup(pSetup_io))
	return szAmpleInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
	{
	pLogFP_m      = NULL;
	iDebugLevel_m = 0;
	return szAmpleDLLCrash_m;
	}

if (pSetup_io->pszLogFilename != NULL)
	pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
pLogFP_m      = pSetup_io->sData.pLogFP;
iDebugLevel_m = pSetup_io->sData.iDebugLevel;
/*
 *  check for valid input
 */
pszGrammarFile_in = checkEmptyString(pszGrammarFile_in);
if (pszGrammarFile_in != NULL)
	{
	pSetup_io->sData.sPATR.bSilent  = pSetup_io->sData.bQuiet;
	pSetup_io->sData.sPATR.cComment = pSetup_io->sData.cBeginComment;
	pSetup_io->sData.sPATR.pLogFP   = pSetup_io->sData.pLogFP;
	if (loadPATRGrammar(pszGrammarFile_in, &pSetup_io->sData.sPATR) == 0)
	{
	reportError(ERROR_MSG, "Error loading grammar file %s",
			pszGrammarFile_in);
	pszResult = szBadGrammarFile_m;
	}
	}
if (pSetup_io->sData.pLogFP != NULL)
	{
	fclose(pSetup_io->sData.pLogFP);
	pSetup_io->sData.pLogFP = NULL;
	}
pLogFP_m      = NULL;
iDebugLevel_m = 0;
return pszResult;
}

#endif /* EXPERIMENTAL */
#endif /* hab33169 */

/******************************************************************************
 * EDIT HISTORY
 * 03-Dec-2004  hab  - Add Interfixes
 * [3.9.0.18]
 * 12-Jul-2003  hab  - Add AMPLE_TRACE_XML option
 * [3.7.0.17]
 * 17-Oct-2002  hab  - Added MaxAnalysesToReturn parameter and AmpleParseText()
 * [3.6.5.16]            now returns the first analyses up to this parameter
 *                       for the FWParse option, only (default is all analyses)
 *                     Added an FWParse message if the buffer is overrun.
 * 04-Sep-2002  hab  - Increased size of szOutputBuffer_g for AmpleParseText()
 * [3.6.0.15]
 * 23-Aug-2002  hab  - fix FWParse results
 * [3.6.0.14]
 * 06-Mar-2002  hab  - Add hooks to ANCCs.
 * [3.5.0.13]          Add pszUseTextIn param to AmpleParseText() to allow
 *                       one to skip word formation check and decapitalization
 *                       (for XAmple.dll only; needed by WordWorks)
 * 10-Aug-2001  hab  - Fix 3.3.20.11 so it doesn't break CarlaStudio's
 * [3.4.1.12]           QuickParse: make it only be for EXPERIMENTAL (i.e.
 *                      XAmple)
 * 16-Jul-2001  jdh  - Add support for Fieldworks XFWParse format
 * [3.3.20.11]
 * 31-May-2001  hab  - Needed to ignore RSC bit when checking affix type in
 * [3.3.20.10]           addAlloResultToBuffer().
 * 29-Mar-2001  hab  - Add conditionally compiled XAmple version, including
 * [3.3.16.9]          AmpleLoadGrammarFile()
 * 19-Sep-2000  hab  - added AmpleApplyInputChangesToWord to enable one to
 * [3.3.14.8]            apply text input changes before getting all allomorphs
 *                     removed extra " in category results when there is no
 *                       category output (in addAResultToBuffer())
 * 2000.06.14  jdh	Modify WriteAResultToFile() to write xml file used by ParseBench
 * 08-Jun-2000  hab  - brought DLL in sync with EXE in fill_template():
 * [3.3.12.7]           bUsesPrevWord and bUsesNextWord were not being copied
 *                      or initialized properly.
 * 26-May-2000  hab  - add AmpleGetAllAllomorphs()
 * [3.3.12.6]   jdh  - add quotes around cat in AResult output;
 *                     add dictionary entry type to AResult output
 * 10-May-2000  hab  - rework AmpleParseText() to use
 * [3.3.10.5]           readTemplateFromTextString()
 * 13-Apr-2000	SRMc - use strncat properly - the third argument is the maximum
 * [3.3.5.4]		number of non-NUL characters that can be appended, NOT
 *			the total size of the destination buffer
 * 07-Dec-1999  hab  - output message when loading a dictionary to make it
 * [3.3.5.3]           easier to tell where an dict load error is
 * 01-Jul-1999  hab  - some minor code cleanup in resetAmpleGlobals(),
 * [3.3.3.2]            AmpleInitializeMorphChecking(), and
 *                      AmpleCheckMorphReferences() (hence the final .2)
 *                     changed checkAmpleMorphs to have a flag to free space
 *                      used in morph checking or not.  The exe needs to free
 *                      the space.  The dll does not.
 * 13-May-1999  hab  - add punctuation class output to AmpleVerifyLoading()
 * [3.3.0.1]
 * 11-Mar-1999  hab  - added missing command line parameter handling:
 *                     setShowPercentages(), getShowPercentages(),
 *                     setCheckMorphReferences(), getCheckMorphReferences(),
 *                     AmpleInitializeMorphChecking(),
 *                     AmpleCheckMorphReferences(),
 *                     setVerifyLoading(), getVerifyLoading(),
 *                     AmpleVerifyLoading(),
 *                     setOutputProperties(), getOutputProperties(),
 *                     setOutputOriginalWord(), getOutputOriginalWord(),
 *                     setOutputDecomposition(), getOutputDecomposition(),
 *                     getOutputFlags()
 *                     Updated to coincide with amplelib 3.2.5
 * 05-Mar-1999  hab  - added AmpleReportVersion(), and print_header()
 * 19-Jan-1999	SRMc - add method to retrieve error messages in a string,
 *			and a parameter to control allowing this
 * 14-Oct-1998	SRMc - copy from llample.c to create a different DLL
 * 24-Oct-1998	SRMc - add the AmpleInitializeTraceString() and
 *			AmpleGetTraceString() DllExport functions
 * 26-Oct-1998	SRMc - define the AmpleSetup data structure to allow multiple
 *			AMPLE setups to be loaded simultaneously
 */
/*
  File settings for GNU Emacs (Please leave for Steve McConnel's sake!)
  Local Variables:
  mode:C
  compile-command:"nmake -f testdll.mak \"CFG=testdll - Win32 Debug\""
  End:
 */
