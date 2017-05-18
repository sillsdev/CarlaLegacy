/* stampdll.c - LinguaLinks / MS Windows (Win32) STAMP DLL functions
 * Copyright 2009 by The Summer Institue of Linguistics all rights reserved.
 * Roy Eberhardt
 ******************************************************************************
 *
 * BOOL WINAPI DllMain(HANDLE	hInst,
 *		       ULONG	ul_reason_for_call,
 *		       LPVOID	lpReserved)
 *
 * DllExport StampSetup * StampCreateSetup(void)
 * DllExport const char * StampDeleteSetup(StampSetup * pSetup_in)
 * DllExport const char * StampLoadControlFiles(
 *				        StampSetup * pSetup_in,
 *				        const char * pszStampDeclarationsFile_in,
 *				        const char * pszDictCodeTable_in,
 *				        const char * pszDictOrthoChangeTable_in,
 *				        const char * pszTextInputControlFile_in)
 * DllExport const char * StampLoadDictionary(StampSetup * pSetup_in,
 *					    const char * pszFilePath_in,
 *					    const char * pszType_in)
 * DllExport const char * StampProcessFile(StampSetup * pSetup_in,
 *						const char * pszInFilePath_in,
 *					   	const char * pszOutFilePath_in)
 * DllExport const char * StampProcessString(StampSetup * pSetup_in,
 *						const char * pszInputText_in,
						const char * pszUseText_in)
 * DllExport const char * StampReset(StampSetup * pSetup_in)
 * DllExport const char * StampSetParameter(StampSetup * pSetup_in,
 *					    const char * pszName_in,
 *				      	    const char * pszValue_in)
 * DllExport const char * StampGetParameter(StampSetup * pSetup_in,
 *	Parameters to be Set or Gotten
 *		ALLOMORPH_IDS
 *		BEGIN_COMMENT
 *		MAX_TRIE_DEPTH
 *		TRACE_ANALYSIS
 *		DEBUG_LEVEL
 *		LOG_FILE
 *		APPEND_LOG_FILE
 *		OUTPUT_STYLE
 *		STORE_ERROR_STRING
 *		ERROR_MESSAGES
 *		SHOW_PERCENTAGES
 *		CHECK_MORPHNAME_REFS
 *		VERIFY_LOADING
 *		OUTPUT_PROPERTIES
 *		OUTPUT_ORIGINAL_WORD
 *		OUTPUT_DECOMPOSITION
 *		DO_ALL_SYNTHESES
 *		MONITOR_PROGRESS
 *		MATCH_CATEGORIES
 *		QUIET
 *		REPORT_NO_ENTRIES
 *		UNIFIED_DICTIONARY
 *		VERIFY_TESTS
 *		ONLY_TRANSFER
 *
 * DllExport const char * StampReportVersion(StampSetup * pSetup_in)
 *							const char * pszName_in)
 * DllExport const char * StampInitializeTraceString(StampSetup * pSetup_in)
 * DllExport const char * StampGetTraceString(StampSetup * pSetup_in)
 * DllExport const char * StampWriteDictionary(StampSetup * pSetup_in,
 *							const char * pszFilePath_in)
 * DllExport const char * StampUpdateEntry(StampSetup * pSetup_in,
 *							const char * pszNewEntry_in)
 *
 * I'm unsure whether this routine, lifted and adapted from ampledll
 *	is really necessary as the switch can be set above.
 * DllExport const char * StampVerifyLoading(StampSetup * pSetup_in)
 ***************************************************************************
 *
 * void reportError(int eMessageType_in, const char *pszFormat_in, ...)
 *
 * void reportMessage(int bNotSilent_in, const char *pszFormat_in, ...)
 *
 * int exitSafely(int iCode_in)
 *
 ***************************************************************************
 * Copyright 1997, 2000, 2010 by SIL International.  All rights reserved.
 */

/* STAMPDLL.C - Synthesis from Transfer of AMPle output
 ***************************************************************************
 *
 * INPUT is taken from a file in which each word is a record with fields:
 *    \a   = analysis		      (ambiguities/failures marked)
 *    \d   = morpheme decomposition   [optional] (ambiguities marked)
 *    \cat = final category of word   [optional] (ambiguities marked)
 *    \p   = properties		      [optional] (ambiguities marked)
 *    \fd  = feature descriptors      [optional] (ambiguities marked)
 *    \u   = underlying form	      [optional] (ambiguities marked)
 *    \w   = original word	      [optional]
 *    \f   = preceding format marks   [if needed]
 *    \c   = capitalization	      [if needed]
 *    \n   = trailing nonalphabetics  [if needed]
 * OUTPUT is written to a text file.
 *
 ***************************************************************************
 * edit history is in versiondll.h
 ***************************************************************************
 * Copyright 1988, 2009 by SIL International.  All rights reserved.
 */

#define WINVER 0x0502
//#define _AFXDLL
//#include <afxwin.h>
// #include "stdafx.h"		// These three for Stampdll.c
#include <stdio.h>
#include "stampdll.h"
#include <windows.h>

#ifdef THINK_C
#include <console.h>
#endif
#ifdef __MWERKS__
#include <console.h>
#endif
#ifdef MACINTOSH
#define USE_CCOMMAND
#endif
#ifdef MACINTOSH_NEEDS
extern long next_user_event_ticks;
extern void allow_user_events();
#endif

/*
 *  definitions and variables for setting / getting parameter values
 */
//#define DEBUG_ALLOMORPH_CONDS	0
#define BEGIN_COMMENT			1
#define MAX_TRIE_DEPTH			2
#define ROOT_GLOSSES			3
#define MAX_MORPHNAME_LENGTH	4
#define SELECTIVE_ANALYSIS_FILE	5
#define TRACE_ANALYSIS			6
#define DEBUG_LEVEL				7
#define LOG_FILE				8
#define APPEND_LOG_FILE			9
#define OUTPUT_STYLE			10
#define STORE_ERROR_STRING		11
#define ERROR_MESSAGES			12
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
				/* next 8 by rke 2009.06.23 */
#define DO_ALL_SYNTHESES		21	
#define MONITOR_PROGRESS		22
#define MATCH_CATEGORIES		23
#define QUIET					24
#define REPORT_NO_ENTRIES		25
#define UNIFIED_DICTIONARY		26
#define VERIFY_TESTS			27
#define ONLY_TRANSFER			28
/* Keep the "EXPERIMENTAL" definitions grouped together at the end */
//#ifdef EXPERIMENTAL
//#define RECOGNIZE_ONLY			29	/* SRMc 2005.12.05 */
//#define NUMBER_OF_PARAMETERS	30
//..#else /* EXPERIMENTAL */
//#define NUMBER_OF_PARAMETERS	29
//#endif /* EXPERIMENTAL */
#define XML_OUTPUT				31



static StampSetup *	pStampSetups_g = NULL;

FILE *			pLogFP_m       = NULL;
int				iDebugLevel_m  = 0;
char *			pszErrorMessages_m = NULL;
size_t			uiErrorBufferSize  = 0;

/*****************************************************************************
 * NAME
 *    resetStampGlobals
 * DESCRIPTION
 *    set the global variables to their initial values
 * RETURN VALUE
 *    none
 */
static void resetStampGlobals(StampSetup * pSetup_io)
{
	int	i;
	/*
	 *  information loaded from the control files and Stamp command line
	 *  information loaded from the text input control file
	 *  information loaded from the "analysis data" (control) file
	 *  information loaded from the dictionary codes file
	 *  information loaded from the AMPLE dictionaries
	 *  information loaded from the dictionary orthography change file
	 *  flags to select output fields (see WordTemplate in template.h)
	 */

	resetStampData( &pSetup_io->sData );
	memset( &pSetup_io->sData, 0, sizeof(pSetup_io->sData) );

	pSetup_io->sData.sTextCtl.cFormatMark           = '\\';
	pSetup_io->sData.sTextCtl.cAnaAmbig             = '%';
	pSetup_io->sData.sTextCtl.cTextAmbig            = '%';
	pSetup_io->sData.sTextCtl.cDecomp               = '-';
	pSetup_io->sData.sTextCtl.cBarMark              = '|';
	pSetup_io->sData.sTextCtl.bIndividualCapitalize = TRUE;
	pSetup_io->sData.sTextCtl.bCapitalize           = TRUE;
	pSetup_io->sData.sTextCtl.uiMaxAmbigDecap       = 100;

	pSetup_io->sData.cBeginRoot                     = '<';
	pSetup_io->sData.cEndRoot                       = '>';
	pSetup_io->sData.sProperties.uiMaxProperty      = 255;
	pSetup_io->sData.szRSCMarkers[0]				= '*';

	if (pSetup_io->pszResult != NULL)
		{
			freeMemory(pSetup_io->pszResult);
			pSetup_io->pszResult = NULL;
		}
	//pSetup_io->uiResultSize = 0;

	/*
	 *  count of words analyzed
	 */

	pSetup_io->uiWordCount_m = 0L;
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

	pSetup_io->bAppendLogFile				= FALSE;
	pSetup_io->eOutputStyle					= Ana;
	pSetup_io->bShowPercentages				= FALSE;		/* hab 1999.03.11 */
	pSetup_io->bCheckMorphReferences		= FALSE;		/* hab 1999.03.11 */
	pSetup_io->bVerifyLoading				= FALSE;		/* hab 1999.03.11 */
	pSetup_io->bStoreErrorString			= FALSE;
	pSetup_io->bNewTextBuffer				= TRUE;		/* rke 2014.29.01 */

	// Additions for Stamp.


	/*
	 *  do we verify test?
	 */
	pSetup_io->bVerify_m					= FALSE;
	/*
	 *  Flag that we are checking memory allocation.
	 */
	pSetup_io->bCheckAlloc_m				= FALSE;

	/*
     *  AllomorphIDs	[rke 2013.08.06]
     */
	pSetup_io->sData.bEnableAllomorphIDs	= FALSE;
    /*
     *  check root categories in synthesis?  [1.5a BJY]
     */
    pSetup_io->sData.bMatchCategories		= TRUE;
    /*
     *  do we generate all possible syntheses?
     */
    pSetup_io->sData.bDoAllSyntheses		= FALSE;
    /*
     *  do we trace parsing?
     */
    pSetup_io->sData.bTrace					= FALSE;
    /*
     *  report not finding dict entries? WM
     */
    pSetup_io->sData.bReportNoEntries		= FALSE;
    /*
     *  do we dump huge amounts of stuff?
     */
    pSetup_io->sData.iDebugLevel				= 0;
    /*
     *  comment marker for input records
     */
    pSetup_io->sData.cComment				= '|';
    /*
     *  work quietly without output to stderr
     */
    pSetup_io->sData.bQuiet					= FALSE;
    /*
     *  maximum depth of trie structure
     */
    pSetup_io->sData.iMaxTrieLevel			= 2;
/*
 *  GLOBAL VARIABLES USED BY STAMP, set by tsinit() and used by tsproc()
 */
    /*
     *  Which type being loaded
     */
    pSetup_io->sData.eRuleType				= 0;
    /*
     *  Total number of copy rules found
     */
    pSetup_io->sData.iCopyRulesTotalCount	= 0;
    /*
     *  ambiguity count
     */
    pSetup_io->sData.uiAmbiguityCount		= 0;
    /*
     *  counters for morpheme environment constraints
     */
    pSetup_io->sData.uiCalledMEC			= 0L;
    pSetup_io->sData.uiMECFailed			= 0L;
    /*
     *  counters for string environment constraints
     */
    pSetup_io->sData.uiCalledSEC			= 0L;
    pSetup_io->sData.uiSECFailed			= 0L;
    /*
     *  counters for punctuation environment constraints  2.1b1 hab
     */
    pSetup_io->sData.uiCalledPEC			= 0L;
    pSetup_io->sData.uiPECFailed			= 0L;
    /*
     *  Set by the text output control file
     */
    // TextControl			sTextCtl; Done above

     /*
     *  flag that synthesis is not being done
     */
    pSetup_io->sData.bOnlyTransfer			= FALSE;
	/*
	 *  flag that morpheme dictionaries are combined
	 */
	pSetup_io->bUnifiedDictionary_m			= FALSE;
	/*
	 *  do we monitor progress of parsing?
	 */
	pSetup_io->bMonitorProgress_m			= FALSE;
    /*
     *  count of missing dictionary elements in synthesis
     */
    pSetup_io->sData.uiMissingMorpheme		= 0L;
	/*
	 *Trace string
	 */
	pSetup_io->pszTrace = NULL;		//Trace String;
	pSetup_io->uiTraceSize = 0L;
	/*
	 * Selective ana file
	 */
	pSetup_io->pszSelectiveAnalFile = NULL;
}


/*****************************************************************************
 * NAME
 *    DllMain
 * DESCRIPTION
 *    Windows 32 (NT/95) DLL initialization function
 * RETURN VALUE
 *    1 if successful, 0 if an error occurs

********  Figure out how this is supposed to work.

 */
BOOL WINAPI DllMain(
    HANDLE	hInst,
    ULONG	ul_reason_for_call,
    LPVOID	lpReserved)
{
StampSetup *	ps;
StampSetup *	pNextSetup;

switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
    case DLL_PROCESS_DETACH:
	for ( ps = pStampSetups_g ; ps ; ps = pNextSetup )
	    {
	    resetStampGlobals(ps);
	    pNextSetup = ps->pNext;
	    freeMemory(ps);
	    }
	pStampSetups_g = NULL;
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


#ifdef _MANAGED
#pragma managed(pop)
#endif

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
 *    check whether the given pointer to an StampSetup data structure is valid
 * RETURN VALUE
 *    TRUE if the pointer is valid, otherwise FALSE
 */
static int isValidSetup(
    StampSetup * pSetup_in)
{
StampSetup *	ps;

if ((pSetup_in == NULL) || (pStampSetups_g == NULL))
    return FALSE;
for ( ps = pStampSetups_g ; ps ; ps = ps->pNext )
    {
    if (pSetup_in == ps)
	return TRUE;
    }
return FALSE;
}


/*****************************************************************************
 * NAME
 *    StampCreateSetup
 * DESCRIPTION
 *    create a new StampSetup data structure for use in future calls to the
 *    Stamp DLL functions
 * RETURN VALUE
 *    pointer to an StampSetup data structure, or NULL if an error occurs
 */
DllExport StampSetup * StampCreateSetup(void)
{
StampSetup *	pSetup;

pSetup = (StampSetup *)allocMemory(sizeof(StampSetup));
memset(pSetup, 0, sizeof(StampSetup));

resetStampGlobals(pSetup);

pSetup->pNext = pStampSetups_g;
pStampSetups_g = pSetup;

return pSetup;
}

/*****************************************************************************
 * NAME
 *    StampDeleteSetup
 * DESCRIPTION
 *    delete the given Stamp setup from memory
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampDeleteSetup(StampSetup * pSetup_io)
{
StampSetup *	ps;
StampSetup *	pPrevSetup;

if ((pSetup_io == NULL) || (pStampSetups_g == NULL))
    return szStampInvalidSetup_m;

pPrevSetup = NULL;
for ( ps = pStampSetups_g ; ps ; ps = ps->pNext )
    {
    if (pSetup_io == ps)
	{
	if (ps == pStampSetups_g)
	    pStampSetups_g = ps->pNext;
	else
	    pPrevSetup->pNext = ps->pNext;
	ps->pNext = NULL;
	resetStampGlobals(ps);
	freeMemory(ps);
	return szStampSuccess_m;
	}
    pPrevSetup = ps;
    }
return szStampInvalidSetup_m;
}

/*****************************************************************************
 * NAME
 *    StampLoadControlFiles
 * DESCRIPTION
 *    load the indicated control files into memory
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampLoadControlFiles(
    StampSetup * pSetup_io,
    const char * pszStampDeclarationsFile_in,
	const char * pszTransferFile_in,			//Optional
	const char * pszSynthesisFile_in,			//Optional
    const char * pszDictCodeTable_in,
	const char * pszDictOrthoChangeTable_in,	//Optional
	const char * pszOutputTextChangeTable_in)	//Optional
{
const char *	pszResult = szStampSuccess_m;
int		bOkay;
/*
 *  verify a valid Stamp setup
 */
if (!isValidSetup(pSetup_io))
    return szStampInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
    {
    pLogFP_m      = NULL;
    iDebugLevel_m = 0;
    return szStampDLLCrash_m;
    }

if (pSetup_io->pszLogFilename != NULL)
    pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
pLogFP_m      = pSetup_io->sData.pLogFP;
iDebugLevel_m = pSetup_io->sData.iDebugLevel;
//if (pSetup_io->bStoreErrorString)
//    {
//    }
//else
//    {
//    }
/*
 *  check for valid input
 */
pszStampDeclarationsFile_in = checkEmptyString(pszStampDeclarationsFile_in);
if (pszStampDeclarationsFile_in == NULL)
    {
    reportError(ERROR_MSG,
		"StampLoadControlFiles() missing STAMP declarations file file");
    pszResult = szMissingArgument_m;
    goto close_and_return;
    }
pszDictCodeTable_in = checkEmptyString(pszDictCodeTable_in);
if (pszDictCodeTable_in == NULL)
    {
    reportError(ERROR_MSG,
		"StampLoadControlFiles() missing dictionary codes table file");
    pszResult = szMissingArgument_m;
    goto close_and_return;
    }

/*
 *  process the input
 */

// STAMP declarations file
if (loadStampControlFile(pszStampDeclarationsFile_in, &pSetup_io->sData) != 0)
    {
    reportError(ERROR_MSG,
		"Error reading STAMP declarations file %s",
		pszStampDeclarationsFile_in);
    pszResult = szBadStampDeclarationsFile_m;
    goto close_and_return;
    }

//Transfer file (xxzzTR.CHG) / Optional so don't through the error messages here and above.
/*
 *  load the transfer (dialect-pair-specific) control file
 */
	// Optional
	pszTransferFile_in = checkEmptyString(pszTransferFile_in);
	if (pszTransferFile_in != NULL)
	{
		if (loadStampTransferFile(pszTransferFile_in, &pSetup_io->sData) != 0)
		{
		reportError(ERROR_MSG,
			"Error reading transfer file %s",
			pszTransferFile_in);
		pszResult = szBadTransferFile_m;
		goto close_and_return;
		}
	}

//Synthesis file (zzSYNT.CHG) / Optional so don't through the error messages here and above.
/*
 *  load the synthesis control file
 */
//Optional
pszSynthesisFile_in = checkEmptyString(pszSynthesisFile_in);
if (pszSynthesisFile_in != NULL)
    {
		if (loadStampSynthesisFile(pszSynthesisFile_in, &pSetup_io->sData) != 0)
		{
			reportError(ERROR_MSG,
				"Error reading synthesis file %s", pszSynthesisFile_in);
			exitSafely(1);
		}
	}

//Dictionary code table (zzSYCD.TAB)
bOkay = (loadStampDictCodeTables(pszDictCodeTable_in, &pSetup_io->sData) == 0);

 // if (pSetup_io->sData.pDictTable == NULL)  // This Requires dictionary code table
 //  {										// To have all affix types and root.
 //    if (pSetup_io->sData.pRootTable == NULL)
 //		bOkay = FALSE;
 //   else if (pSetup_io->sData.pPrefixTable == NULL)
 //		bOkay = FALSE;
 //   else if (pSetup_io->sData.pInfixTable == NULL)
 //		bOkay = FALSE;
 //   else if (pSetup_io->sData.pSuffixTable == NULL)
 //		bOkay = FALSE;
 //   }
if (!bOkay)
    {
    reportError(ERROR_MSG,
		"Error reading dictionary codes table file %s",
		pszDictCodeTable_in);
    pszResult = szBadDictCodeTable_m;
    goto close_and_return;
    }

if (pSetup_io->bUnifiedDictionary_m && (pSetup_io->sData.pDictTable == NULL))
    {
    reportError(ERROR_MSG, szBadUSwitchCodeTable_s, "\\unified");
    pszResult = szBadUSwitchCodeTable_s;
    goto close_and_return;
    }

if (	!pSetup_io->bUnifiedDictionary_m &&
	(pSetup_io->sData.pDictTable   != NULL) &&
	(pSetup_io->sData.pPrefixTable == NULL) &&
	(pSetup_io->sData.pInfixTable  == NULL) &&
	(pSetup_io->sData.pSuffixTable == NULL) &&
	(pSetup_io->sData.pRootTable   == NULL) )
    {
    reportError(WARNING_MSG,
		"Assuming unified dictionary despite missing -u option.\n");
    pSetup_io->bUnifiedDictionary_m = TRUE;
    }


//Dictionary orthography change table
//Optional
pszDictOrthoChangeTable_in = checkEmptyString(pszDictOrthoChangeTable_in);
if (pszDictOrthoChangeTable_in != NULL)
    {
    if (loadStampDictOrthoChanges(pszDictOrthoChangeTable_in,
				  &pSetup_io->sData) != 0)
	{
	reportError(ERROR_MSG,
		   "Error reading dictionary orthography change table file %s",
		    pszDictOrthoChangeTable_in);
	pszResult = szBadDictOrthoChanges_m;
	goto close_and_return;
	}
    }

//Output Change file (zzOUTTX.CTL) / Optional so don't through the error messages here and above.
/*
 *  load the OUTTX control file
 */
pszOutputTextChangeTable_in = checkEmptyString(pszOutputTextChangeTable_in);
if (pszOutputTextChangeTable_in != NULL)
    {
			if (loadOutxCtlFile(pszOutputTextChangeTable_in,
				pSetup_io->sData.cComment,
				&pSetup_io->sData.sTextCtl,
				&pSetup_io->sData.pStringClasses) != 0)
				{	//Fail.
				//pSetup_io->sData.sTextCtl.pOutputChanges = (Change *)NULL;
				reportError(ERROR_MSG,
					"Error reading output text file %s", pszSynthesisFile_in);
					pszResult = szBadSynthesisFile_m;
				goto close_and_return;

				}
			else	// Succeed and load.
				{
					int iCount = 0;
					Change *pChg;
					for ( pChg = pSetup_io->sData.sTextCtl.pOutputChanges ; pChg ; pChg = pChg->pNext )
					++iCount;
					reportMessage(!pSetup_io->sData.bQuiet,
						"%d output orthography change%s loaded from %s\n",
						iCount, (iCount == 1) ? " was" : "s were", pszOutputTextChangeTable_in);

				}
	}
else
	pSetup_io->sData.sTextCtl.pOutputChanges = (Change *)NULL;


/* ================================================================
 *  dump verbose "verify" information
 */
if (pSetup_io->bVerify_m && (pSetup_io->sData.pLogFP != NULL))
    {
    /*
     *  show categories, category classes, string classes, morpheme classes,
     *  and any user defined tests
     */
    writeAmpleCategories(pSetup_io->sData.pLogFP, pSetup_io->sData.pCategories);
    writeAmpleCategClasses(pSetup_io->sData.pLogFP, pSetup_io->sData.pCategories,
			   pSetup_io->sData.pCategClasses);
    writeStringClasses(pSetup_io->sData.pLogFP, pSetup_io->sData.pStringClasses);
    writeAmpleMorphClasses(pSetup_io->sData.pLogFP, pSetup_io->sData.pMorphClasses);
				/* 2.1b1 hab */
    writePunctClasses(pSetup_io->sData.pLogFP, pSetup_io->sData.pPunctClasses);
    writeStampTests(pSetup_io->sData.pLogFP, &pSetup_io->sData);
    }
if (pSetup_io->sData.iDebugLevel && (pSetup_io->sData.pLogFP != NULL))
    {
    /*
     *  show the transfer lexical changes, transfer rules, synthesis lexical
     *  changes, and regular sound changes
     */
    writeStampTransferLexChanges(pSetup_io->sData.pLogFP, &pSetup_io->sData);
    writeStampTransferRules(pSetup_io->sData.pLogFP, &pSetup_io->sData);
    writeStampSynthesisLexChanges(pSetup_io->sData.pLogFP, &pSetup_io->sData);
    writeStampRegSoundChanges(pSetup_io->sData.pLogFP, &pSetup_io->sData);
    }

cleanupAfterStdFormatRecord();  // Uncertain about this routine and what it implies

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
 *    StampLoadDictionary
 * DESCRIPTION
 *    load the indicated dictionary file into memory
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampLoadDictionary(
    StampSetup * pSetup_io,
    const char * pszDictionary_in,
    const char * pszType_in)
{
int		iCount;
const char *	pszResult = szStampSuccess_m;
int		eType;
char *		pszType;
/*
 *  verify a valid Stamp setup
 */
if (!isValidSetup(pSetup_io))
    return szStampInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
    {
    pLogFP_m      = NULL;
    iDebugLevel_m = 0;
    return szStampDLLCrash_m;
    }
if (pSetup_io->pszLogFilename != NULL)
    pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
pLogFP_m      = pSetup_io->sData.pLogFP;
iDebugLevel_m = pSetup_io->sData.iDebugLevel;
pszDictionary_in = checkEmptyString(pszDictionary_in);
if (pszDictionary_in == NULL)
    {
    reportError(ERROR_MSG,
		"StampLoadDictionary() missing dictionary file");
    pszResult = szMissingArgument_m;
    goto close_and_return;
    }
eType = STAMP_UNIFIED;
if (pszType_in != NULL)
    {
    switch (*pszType_in)
	{
	case 'p': case 'P': eType = PFX;     pszType = "PREFIX";	break;
	case 'i': case 'I': eType = IFX;     pszType = "INFIX";		break;
	case 'r': case 'R': eType = ROOT;    pszType = "ROOT";		break;
	case 's': case 'S': eType = SFX;     pszType = "SUFFIX";	break;
	default:	    eType = STAMP_UNIFIED; pszType = "UNIFIED";	break;
	}
    }
reportMessage(TRUE,
	      "\t%s DICTIONARY: Loading %s\n",
	      pszType, pszDictionary_in );
iCount = loadStampDictionaryDLL(pszDictionary_in, eType, &pSetup_io->sData);
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
	/*
	*  for -/// or more dump dictionary
	*  This prints the dict contents after every dictload invocation.
	*/
	//if ((pSetup_io->sData.iDebugLevel > 2) && (pSetup_io->sData.pLogFP != NULL))
	//	writeStampDictionaryDLL(pSetup_io->sData.pLogFP, &pSetup_io->sData);
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
 *    StampReset
 * DESCRIPTION
 *    remove all control and dictionary information from memory
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampReset(
    StampSetup * pSetup_io)
{
/*
 *  verify a valid STAMP setup
 */
if (!isValidSetup(pSetup_io))
    return szStampInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
    return szStampDLLCrash_m;

if (pSetup_io->sData.pLogFP != NULL)
    {
    fclose(pSetup_io->sData.pLogFP);
    pSetup_io->sData.pLogFP = NULL;
    }
resetStampGlobals(pSetup_io);

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    StampSetParameter
 * DESCRIPTION
 *    update an STAMP parameter with the given value
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampSetParameter(
    StampSetup * pSetup_io,
    const char * pszName_in,
    const char * pszValue_in)
{
/*
 *  verify a valid STAMP setup
 */
if (!isValidSetup(pSetup_io))
    return szStampInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
    return szStampDLLCrash_m;
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
//  case DEBUG_ALLOMORPH_CONDS:
//	return setDebugAllomorphs(pszValue_in, pSetup_io);

    case BEGIN_COMMENT:
	return setCommentChar(pszValue_in, pSetup_io);

	case MAX_TRIE_DEPTH:
	return setMaxTrieDepth(pszValue_in, pSetup_io);

//  case ROOT_GLOSSES:
//	return setRootGlosses(pszValue_in, pSetup_io);

//  case MAX_MORPHNAME_LENGTH:
//	return setMaxMorphnameLength(pszValue_in, pSetup_io);

//  case SELECTIVE_ANALYSIS_FILE:
//	return setSelectiveAnalysisFile(pszValue_in, pSetup_io);

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

    case ALLOMORPH_IDS:		/* jdh 2002.1.15 */
    return setEnableAllomorphIDs(pszValue_in, pSetup_io);

	case DO_ALL_SYNTHESES:		/* rke 2009.6.23 */
	return setDoAllSyntheses(pszValue_in, pSetup_io);

	case MONITOR_PROGRESS:		/* rke 2009.6.23 */
	return setMonitorProgress(pszValue_in, pSetup_io);

	case MATCH_CATEGORIES:		/* rke 2009.6.23 */
	return setMatchCategories(pszValue_in, pSetup_io);

	case QUIET:					/* rke 2009.6.23 */
	return setQuiet(pszValue_in, pSetup_io);

	case REPORT_NO_ENTRIES:		/* rke 2009.6.23 */
	return setReportNoEntries(pszValue_in, pSetup_io);

	case UNIFIED_DICTIONARY:	/* rke 2009.6.23 */
	return setUnifiedDictionary(pszValue_in, pSetup_io);

	case VERIFY_TESTS:			/* rke 2009.6.23 */
	return setVerifyTests(pszValue_in, pSetup_io);

	case ONLY_TRANSFER:			/* rke 2009.6.23 */
	return setOnlyTransfer(pszValue_in, pSetup_io);

	default:

	return szInvalidParameterName_m;
    }
}

/*****************************************************************************
 * NAME
 *    StampProcessFile
 * DESCRIPTION
 *    Process the indicated ANA file
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampProcessFile(
    StampSetup * pSetup_io,
    const char * pszANAFile_m,
	const char * pszOutputFile_m)
{
const char *pszResult = szStampSuccess_m;

/*
 *  verify a valid Stamp setup
 */
if (!isValidSetup(pSetup_io))
    return szStampInvalidSetup_m;

/*
 *  set variables for emergency exits
 */

if (setjmp(sAbortPoint) != 0)
    {
    pLogFP_m      = NULL;
	iDebugLevel_m = 0;
    return szStampDLLCrash_m;
    }
if (pSetup_io->pszLogFilename != NULL)
    pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
pLogFP_m      = pSetup_io->sData.pLogFP;
iDebugLevel_m = pSetup_io->sData.iDebugLevel;
/*
 *  check for valid input
 */
pszANAFile_m = checkEmptyString(pszANAFile_m);
if (pszANAFile_m == NULL)
    {
    reportError(ERROR_MSG,
		"tsprocdll() missing input ANA file");
    pszResult = szMissingArgument_m;
    goto close_and_return;
    }

 	pszOutputFile_m = checkEmptyString(pszOutputFile_m);
	if (pszOutputFile_m == NULL)
		{
			reportError(ERROR_MSG,
			"tsprocdll() missing Output file");
			pszResult = szMissingArgument_m;
			goto close_and_return;
		}

    if (pSetup_io->sData.pLogFP != NULL)
        {
        fprintf(pSetup_io->sData.pLogFP, "Input  file: %s\n", pszANAFile_m);
        fprintf(pSetup_io->sData.pLogFP, "Output file: %s\n", pszOutputFile_m);
        }

	// all ANAs and output files.
	pszResult = tsprocdll(pSetup_io, pszANAFile_m, pszOutputFile_m);
	if (pszResult != NULL)
	{
		if (strcmp(pszResult, szBadANAInputFile_m) == 0)
			reportError(ERROR_MSG, "Error opening Input file %s", pszANAFile_m);
    	goto close_and_return;

		if (strcmp(pszResult, szBadOutputFile_m) == 0)
			reportError(ERROR_MSG, "Error opening Output file %s", pszOutputFile_m);
    	goto close_and_return;

		reportError(ERROR_MSG, "Should never be here ... Bug in StampProcess routine");
		goto close_and_return;

    }

return szStampSuccess_m;

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

/*************************************************************************
 * NAME
 *    tsprocdll
 * DESCRIPTION
 *    Top-level processing function for transfer and synthesis.
 *    For each file, it coordinates the transfer and synthesis of each word.
 *	Modified from tsproc for use with stampdll by RE (1-May-2009)
 * RETURN VALUE
 *    none
 */
static const char *tsprocdll(StampSetup *pSetup_io,
							const char *pszInputFile_m,
							const char *pszOutputFile_m)
{
FILE *infp, *outfp;
//StampUnit	*sWords_m;		//Stamp tsprocess structure
int k;
WordTemplate *	pWord;

	/*
     *  open input file
     */

   infp = fopen( pszInputFile_m, "r");
     
	if (infp == NULL)
		{
			return szBadANAInputFile_m;
	    }
	/*
     *  open output file
     */

    outfp = fopen( pszOutputFile_m, "w");

	if (outfp == NULL)
		{
			return szBadOutputFile_m;
		}

    /*
     *  initialize counters for this file
     */
    pSetup_io->uiWordCount_m = 0L;
    for ( k = 0 ; k <= MAXAMBIG ; ++k )
        pSetup_io->auiAmbiguityLevels_m[k] = 0L;
    pSetup_io->sData.uiCalledMEC = pSetup_io->sData.uiMECFailed = 0L;
    pSetup_io->sData.uiCalledSEC = pSetup_io->sData.uiSECFailed = 0L;
    pSetup_io->sData.uiCalledPEC = pSetup_io->sData.uiPECFailed = 0L; /* 2.1b1 hab */
    /*
     *  initialize the input and output routines' parameters
     */
    if (pSetup_io->sData.pLogFP != NULL)
	{
		putc( '\n', pSetup_io->sData.pLogFP );
		if (!pSetup_io->sData.bQuiet)
			putc( '\n', pSetup_io->sData.pLogFP );
		if (pSetup_io->bMonitorProgress_m)
			putc('\n',pSetup_io->sData.pLogFP);	      /* Put return before first one */
	}
    /*
     * Initialize for the word processing loop
     */
    pSetup_io->sWords_m.pPreviousWord = (StampWord *)NULL;
    pSetup_io->sWords_m.pNextWord     = (StampWord *)NULL;
    /*
     *  Get a word and transfer it (in isolation)
     */
    pSetup_io->sWords_m.pCurrentWord = readStampWord(infp, &pSetup_io->sData.sTextCtl);
    if (pSetup_io->sWords_m.pCurrentWord != NULL)
	{
	sprintf(szOutOfMemoryMarker_g, "input word number %ld", pSetup_io->uiWordCount_m);
	pSetup_io->sWords_m.pCurrentWord = performStampTransfer( &pSetup_io->sWords_m, &pSetup_io->sData );
	}
    pSetup_io->sWords_m.bStringLookahead = FALSE;
    /*
     * While there is a word to synthesize...
     */
    while (pSetup_io->sWords_m.pCurrentWord != NULL)
        {
	/*
	 *  Read in next word and transfer it
	 */
	pSetup_io->sWords_m.pNextWord = readStampWord(infp, &pSetup_io->sData.sTextCtl);
	if (pSetup_io->sWords_m.pNextWord != NULL)
	    {
	    StampUnit sTemp;
	    sprintf( szOutOfMemoryMarker_g, "input word number %ld",
		     pSetup_io->uiWordCount_m );
	    sTemp.pCurrentWord     = pSetup_io->sWords_m.pNextWord;
	    sTemp.pPreviousWord    = pSetup_io->sWords_m.pCurrentWord;
	    sTemp.pNextWord        = NULL;
	    sTemp.bStringLookahead = pSetup_io->sWords_m.bStringLookahead;
	    sTemp.bLookaheadDone   = pSetup_io->sWords_m.bLookaheadDone;
	    sTemp.bMultiDependency = pSetup_io->sWords_m.bMultiDependency;
	    pSetup_io->sWords_m.pNextWord        = performStampTransfer( &sTemp,
							      &pSetup_io->sData );
	    pSetup_io->sWords_m.bStringLookahead = sTemp.bStringLookahead;
	    pSetup_io->sWords_m.bLookaheadDone   = sTemp.bLookaheadDone;
	    pSetup_io->sWords_m.bMultiDependency = sTemp.bMultiDependency;
	    }
	if ( pSetup_io->sData.bOnlyTransfer )    /* If transfer only... */
            {
			writeStampWord(pSetup_io->sWords_m.pCurrentWord, outfp, pszOutputFile_m,
				&pSetup_io->sData);

			if (pSetup_io->bMonitorProgress_m)
				{
				/* fake one ambiguity for monitor */
					showAmbiguousProgress(1, pSetup_io->uiWordCount_m);
				}
			++pSetup_io->uiWordCount_m;
            }
        else
            {
	    /* otherwise, synthesize */
	    performStampSynthesis(&pSetup_io->sWords_m, &pSetup_io->sData);
	    
	    pWord = pSetup_io->sWords_m.pCurrentWord->pTemplate;

	    fixSynthesizedWord(pWord, &pSetup_io->sData.sTextCtl, NULL);
		writeTextFromTemplate(outfp, pWord, &pSetup_io->sData.sTextCtl);

	    /* (Note that readStampWord() frees info in word) */
	    /*
	     * keep statistical counts of ambiguities in the final output
	     */
	    if (    (pWord != NULL) &&
		    (	(pWord->pNewWords != NULL) ||
			(   (pWord->pszOrigWord    != NULL) &&
			    (pWord->pszOrigWord[0] != NUL) ) ) )
		{
		pSetup_io->sData.uiAmbiguityCount = getStringListSize(
				  pWord->pNewWords);
		if (pSetup_io->sData.uiAmbiguityCount < MAXAMBIG)
		    ++pSetup_io->auiAmbiguityLevels_m[pSetup_io->sData.uiAmbiguityCount];
		else
		    ++pSetup_io->auiAmbiguityLevels_m[MAXAMBIG];
		if (pSetup_io->bMonitorProgress_m)
		    showAmbiguousProgress(pSetup_io->sData.uiAmbiguityCount,
					  pSetup_io->uiWordCount_m);
		++pSetup_io->uiWordCount_m;
		}
	    }
        /*
         *  Advance to next word
         */
        freeStampWord( pSetup_io->sWords_m.pPreviousWord );
        pSetup_io->sWords_m.pPreviousWord = pSetup_io->sWords_m.pCurrentWord;
        pSetup_io->sWords_m.pCurrentWord = pSetup_io->sWords_m.pNextWord;
        }
    /* clean up after last word */
    if (pSetup_io->sWords_m.pPreviousWord)
	{
	freeStampWord( pSetup_io->sWords_m.pPreviousWord );
	pSetup_io->sWords_m.pPreviousWord = NULL;
	}
    if ((pSetup_io->bMonitorProgress_m) && (pSetup_io->sData.pLogFP != NULL))	/* If monitoring */
	{
	unsigned	uiFix;
	for ( uiFix = pSetup_io->uiWordCount_m % 50 ; uiFix < 50 ; ++uiFix )
	    {
		fputc(' ', pSetup_io->sData.pLogFP);
	    if ((uiFix % 10) == 0)
		fprintf(pSetup_io->sData.pLogFP, "  ");
	    }
	if ((pSetup_io->uiWordCount_m % 10) != 0)
	    fprintf(pSetup_io->sData.pLogFP, "  ");
	fprintf(pSetup_io->sData.pLogFP, "%lu\n", pSetup_io->uiWordCount_m);
	}
    /*
     *  output statistics
     */
    if (!pSetup_io->sData.bOnlyTransfer)
        outstats(pSetup_io);
 
    fclose(infp);
    fflush(outfp);
    checkFileError( outfp, "STAMP", pszOutputFile_m );
    fclose(outfp);
	return NULL;
//   if ( !pszInputFile_m )          /* If input file not from cmd line */
//       {                       /* Ask for another */
//       getAmpleCmd("Next Input file (or RETURN if no more): ",
//		    infilename, 100);
//        }
//    else
//        infilename[0] = NUL;      /* Else (from cmd line) clear name */

//	} while (infilename[0]);      /* until the user wants no more */


}

/*****************************************************************************
 * NAME
 *    StampProcessString
 * DESCRIPTION
 *    process the words in the input string
 * RETURN VALUE
 *    process result string
 */
DllExport const char * StampProcessString(
    StampSetup * pSetup_io,
    const char * pszInputText_in,
    const char * pszUseTextIn)
{
  char          cUseTextIn = (pszUseTextIn != NULL) ? tolower(*pszUseTextIn) : 'n';
  const char *pszResult; 
  /*
   *  verify a valid Stamp setup
   */
  if ((!isValidSetup(pSetup_io)) || !pszInputText_in)
    return szStampInvalidSetup_m;

  /*
   *  set variables for emergency exits
   */
  if (setjmp(sAbortPoint) != 0)
    {
      pLogFP_m      = NULL;
      iDebugLevel_m = 0;
      return szStampDLLCrash_m;
    }
  if (pSetup_io->pszLogFilename != NULL)
    pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
  pLogFP_m      = pSetup_io->sData.pLogFP;
  iDebugLevel_m = pSetup_io->sData.iDebugLevel;
  pszInputText_in = checkEmptyString(pszInputText_in);
  if (pszInputText_in == NULL)
    {
      reportError(ERROR_MSG,
		  "StampProcessString() missing input text string");
      pszResult = szMissingArgument_m;
      goto close_and_return;
    }

// Because we might get more than one text buffer.
pSetup_io->bNewTextBuffer = TRUE;

// all input and output strings.
tsprocdllstring(pSetup_io, pszInputText_in);

return szOutputBuffer_g;

close_and_return:
	if (pSetup_io->sData.pLogFP != NULL)
    {
    fclose(pSetup_io->sData.pLogFP);
    pSetup_io->sData.pLogFP = NULL;
    }
pLogFP_m      = NULL;
iDebugLevel_m = 0;
return szStampBadString_m; //return pszResult;
}

/*************************************************************************
 * NAME
 *    tsprocdllstring
 * DESCRIPTION
 *    Top-level processing function for transfer and synthesis.
 *    Uses input buffer, it coordinates the transfer and synthesis of each word.
 *	Modified from tsproc for use with stampdll by RE (5-April-2013)
 * RETURN VALUE
 *    none
 */
static const char *tsprocdllstring(StampSetup *pSetup_io, const char * pszInputText_in)
{
//StampUnit	*sWords_m;		//Stamp tsprocess structure
int k;
WordTemplate *	pWord;

    /*
     *  initialize counters for this file
     */
    pSetup_io->uiWordCount_m = 0L;
    for ( k = 0 ; k <= MAXAMBIG ; ++k )
        pSetup_io->auiAmbiguityLevels_m[k] = 0L;
    pSetup_io->sData.uiCalledMEC = pSetup_io->sData.uiMECFailed = 0L;
    pSetup_io->sData.uiCalledSEC = pSetup_io->sData.uiSECFailed = 0L;
    pSetup_io->sData.uiCalledPEC = pSetup_io->sData.uiPECFailed = 0L; /* 2.1b1 hab */
    /*
     *  initialize the input and output routines' parameters
     */
    if (pSetup_io->sData.pLogFP != NULL)
	{
		putc( '\n', pSetup_io->sData.pLogFP );
		if (!pSetup_io->sData.bQuiet)
			putc( '\n', pSetup_io->sData.pLogFP );
		if (pSetup_io->bMonitorProgress_m)
			putc('\n',pSetup_io->sData.pLogFP);	      /* Put return before first one */
	}
    /*
     * Initialize for the word processing loop
     */
    pSetup_io->sWords_m.pPreviousWord = (StampWord *)NULL;
    pSetup_io->sWords_m.pNextWord     = (StampWord *)NULL;
    /*
     *  Get a word and transfer it (in isolation)
     */
    pSetup_io->sWords_m.pCurrentWord = readStampWordString(pszInputText_in,
		&pSetup_io->sData.sTextCtl, pSetup_io);
    if (pSetup_io->sWords_m.pCurrentWord != NULL)
	{
	sprintf(szOutOfMemoryMarker_g, "input word number %ld", pSetup_io->uiWordCount_m);
	pSetup_io->sWords_m.pCurrentWord = performStampTransfer( &pSetup_io->sWords_m, &pSetup_io->sData );
	}
    pSetup_io->sWords_m.bStringLookahead = FALSE;
    /*
     * While there is a word to synthesize...
     */
    while (pSetup_io->sWords_m.pCurrentWord != NULL)
        {
	/*
	 *  Read in next word and transfer it
	 */
	pSetup_io->sWords_m.pNextWord = readStampWordString(pszInputText_in,
			&pSetup_io->sData.sTextCtl, pSetup_io);
	if (pSetup_io->sWords_m.pNextWord != NULL)
	    {
	    StampUnit sTemp;
	    sprintf( szOutOfMemoryMarker_g, "input word number %ld",
		     pSetup_io->uiWordCount_m );
	    sTemp.pCurrentWord     = pSetup_io->sWords_m.pNextWord;
	    sTemp.pPreviousWord    = pSetup_io->sWords_m.pCurrentWord;
	    sTemp.pNextWord        = NULL;
	    sTemp.bStringLookahead = pSetup_io->sWords_m.bStringLookahead;
	    sTemp.bLookaheadDone   = pSetup_io->sWords_m.bLookaheadDone;
	    sTemp.bMultiDependency = pSetup_io->sWords_m.bMultiDependency;
	    pSetup_io->sWords_m.pNextWord        = performStampTransfer( &sTemp,
							      &pSetup_io->sData );
	    pSetup_io->sWords_m.bStringLookahead = sTemp.bStringLookahead;
	    pSetup_io->sWords_m.bLookaheadDone   = sTemp.bLookaheadDone;
	    pSetup_io->sWords_m.bMultiDependency = sTemp.bMultiDependency;
	    }
	if ( pSetup_io->sData.bOnlyTransfer )    /* If transfer only... */
            {
			addFWParseToBuffer(pSetup_io, pSetup_io->sWords_m.pCurrentWord, &pSetup_io->sData.sTextCtl,
				szOutputBuffer_g, sizeof(szOutputBuffer_g)-1, 
				countAmbiguities(pSetup_io->sWords_m.pCurrentWord->pTemplate));

			if (pSetup_io->bMonitorProgress_m)
				{
				/* fake one ambiguity for monitor */
					showAmbiguousProgress(1, pSetup_io->uiWordCount_m);
				}
			++pSetup_io->uiWordCount_m;
            }
        else
            {
	    /* otherwise, synthesize */
	    performStampSynthesis(&pSetup_io->sWords_m, &pSetup_io->sData);
	    
	    pWord = pSetup_io->sWords_m.pCurrentWord->pTemplate;

	    fixSynthesizedWord(pWord, &pSetup_io->sData.sTextCtl, NULL);
// outputs to buffer
		writeTextFromTemplateToBuffer(pWord, &pSetup_io->sData.sTextCtl, szOutputBuffer_g, sizeof(szOutputBuffer_g)-1,
			countAmbiguities(pSetup_io->sWords_m.pCurrentWord->pTemplate));

	    /* (Note that readStampWordString() frees info in word) */
	    /*
	     * keep statistical counts of ambiguities in the final output
	     */
	    if (    (pWord != NULL) &&
		    (	(pWord->pNewWords != NULL) ||
			(   (pWord->pszOrigWord    != NULL) &&
			    (pWord->pszOrigWord[0] != NUL) ) ) )
		{
		pSetup_io->sData.uiAmbiguityCount = getStringListSize(
				  pWord->pNewWords);
		if (pSetup_io->sData.uiAmbiguityCount < MAXAMBIG)
		    ++pSetup_io->auiAmbiguityLevels_m[pSetup_io->sData.uiAmbiguityCount];
		else
		    ++pSetup_io->auiAmbiguityLevels_m[MAXAMBIG];
		if (pSetup_io->bMonitorProgress_m)
		    showAmbiguousProgress(pSetup_io->sData.uiAmbiguityCount,
					  pSetup_io->uiWordCount_m);
		++pSetup_io->uiWordCount_m;
		}
	    }
        /*
         *  Advance to next word
         */
        freeStampWord( pSetup_io->sWords_m.pPreviousWord );
        pSetup_io->sWords_m.pPreviousWord = pSetup_io->sWords_m.pCurrentWord;
        pSetup_io->sWords_m.pCurrentWord = pSetup_io->sWords_m.pNextWord;
        }
    /* clean up after last word */
    if (pSetup_io->sWords_m.pPreviousWord)
	{
	freeStampWord( pSetup_io->sWords_m.pPreviousWord );
	pSetup_io->sWords_m.pPreviousWord = NULL;
	}
    if ((pSetup_io->bMonitorProgress_m) && (pSetup_io->sData.pLogFP != NULL))	/* If monitoring */
	{
	unsigned	uiFix;
	for ( uiFix = pSetup_io->uiWordCount_m % 50 ; uiFix < 50 ; ++uiFix )
	    {
		fputc(' ', pSetup_io->sData.pLogFP);
	    if ((uiFix % 10) == 0)
		fprintf(pSetup_io->sData.pLogFP, "  ");
	    }
	if ((pSetup_io->uiWordCount_m % 10) != 0)
	    fprintf(pSetup_io->sData.pLogFP, "  ");
	fprintf(pSetup_io->sData.pLogFP, "%lu\n", pSetup_io->uiWordCount_m);
	}
    /*
     *  output statistics
     */
    if (!pSetup_io->sData.bOnlyTransfer)
        outstats(pSetup_io);
 
//    fclose(infp);
//    fflush(outfp);
//    checkFileError( outfp, "STAMP", pszOutputFile_m );
//    fclose(outfp);
	return NULL;
//   if ( !pszInputFile_m )          /* If input file not from cmd line */
//       {                       /* Ask for another */
//       getAmpleCmd("Next Input file (or RETURN if no more): ",
//		    infilename, 100);
//        }
//    else
//        infilename[0] = NUL;      /* Else (from cmd line) clear name */

//	} while (infilename[0]);      /* until the user wants no more */


}


/*************************************************************************
 * NAME
 *    outstats
 * DESCRIPTION
 *    Print the statistical counts for the input file which just finished.
 * RETURN VALUE
 *    none
 */
static void outstats(StampSetup *pSetup_io)
{
int	i;

if (pSetup_io->sData.pLogFP == NULL)
    return;
/*
 *  print the statistics header
 */ 
fprintf(pSetup_io->sData.pLogFP,
	"\nSYNTHESIS STATISTICS: %4ld WORDS processed.\n",
	pSetup_io->uiWordCount_m);
/*
 *  print the ambiguity levels
 */
fprintf(pSetup_io->sData.pLogFP, "   Ambiguity Levels:\n" );
for ( i = 0 ; i <= MAXAMBIG ; ++i )
    {
    if (pSetup_io->auiAmbiguityLevels_m[i] != 0L)
        fprintf(pSetup_io->sData.pLogFP, "%25ld word%c with %2d %ssynthes%cs.\n",
		pSetup_io->auiAmbiguityLevels_m[i],
		(pSetup_io->auiAmbiguityLevels_m[i] == 1) ? ' ' : 's',
		i, (i == MAXAMBIG) ? "or more " : "", (i == 1) ? 'i' : 'e' );
    }
#ifdef NODICTCOUNT
if (	(!pStamp_in->bTrace) &&
	pStamp_in->bReportNoEntries &&
	(pSetup_io->sData.uiMissingMorphemes != 0L) &&
	(pStamp_in->pLogFP != NULL) )
    fprintf(pSetup_io->sData.pLogFP,
	    "%26ld dictionary entries were not found.\n",
	    pSetup_io->sData.uiMissingMorphemes);
#endif
/*
 *  builtin tests use global counters
 */
if (pSetup_io->sData.uiCalledMEC || pSetup_io->sData.uiCalledSEC ||
    pSetup_io->sData.uiCalledPEC)	/* 2.1b1 hab */
    {
    fprintf(pSetup_io->sData.pLogFP, "   Counts for built-in tests:\n");
    if (pSetup_io->sData.uiCalledMEC)
        fprintf(pSetup_io->sData.pLogFP,
       "   Morpheme environment constraints failed %lu times, succeeded %lu.\n",
		pSetup_io->sData.uiMECFailed,
		pSetup_io->sData.uiCalledMEC - pSetup_io->sData.uiMECFailed);
    if (pSetup_io->sData.uiCalledSEC)
        fprintf(pSetup_io->sData.pLogFP,
       "     String environment constraints failed %lu times, succeeded %lu.\n",
		pSetup_io->sData.uiSECFailed,
		pSetup_io->sData.uiCalledSEC - pSetup_io->sData.uiSECFailed );
    if (pSetup_io->sData.uiCalledPEC)	/* 2.1b1 hab */
        fprintf(pSetup_io->sData.pLogFP,
       "     String punctuation constraints failed %lu times, succeeded %lu.\n",
		pSetup_io->sData.uiPECFailed,
		pSetup_io->sData.uiCalledPEC - pSetup_io->sData.uiPECFailed );
    }
/*
 *  user defined tests have their own display function
 */
writeStampTestStatistics(pSetup_io->sData.pLogFP, &pSetup_io->sData);
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
 *    setCommentChar
 * DESCRIPTION
 *    set the "comment character" parameter (STAMP's -c command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setCommentChar(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->sData.cComment = '|';	/* default value */
else
    pSetup_io->sData.cComment = *pszValue_in;
return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setMaxTrieDepth
 * DESCRIPTION
 *    set the "maximum trie depth" parameter (STAMP's -d command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setMaxTrieDepth(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->sData.iMaxTrieLevel = 2;	/* default value */
else
    pSetup_io->sData.iMaxTrieLevel = atoi(pszValue_in);
if (pSetup_io->sData.iMaxTrieLevel < 1)
    pSetup_io->sData.iMaxTrieLevel = 1;
if (pSetup_io->sData.iMaxTrieLevel >= MAXMORPH)
    pSetup_io->sData.iMaxTrieLevel = MAXMORPH - 1;
return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setTraceAnalysis
 * DESCRIPTION
 *    set the "trace analysis" parameter (STAMP's -t command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setTraceAnalysis(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->sData.bTrace = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) ||
	 (_stricmp(pszValue_in, "ON") == 0) )
    pSetup_io->sData.bTrace = AMPLE_TRACE_ON;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) ||
	 (_stricmp(pszValue_in, "OFF") == 0) )
    pSetup_io->sData.bTrace = AMPLE_TRACE_OFF;
else if (_stricmp(pszValue_in, "SGML") == 0)
    pSetup_io->sData.bTrace = AMPLE_TRACE_SGML;
else if (_stricmp(pszValue_in, "XML") == 0)
    pSetup_io->sData.bTrace = AMPLE_TRACE_XML;
else
    return szInvalidParameterValue_m;

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setDebugLevel
 * DESCRIPTION
 *    set the "debug level" parameter (STAMP's -/ command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setDebugLevel(
    const char *	pszValue_in,
   StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->sData.iDebugLevel = 0;	/* default value */
else
    pSetup_io->sData.iDebugLevel = atoi(pszValue_in);
if (pSetup_io->sData.iDebugLevel < 0)
    pSetup_io->sData.iDebugLevel = 0;
return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setLogFile
 * DESCRIPTION
 *    set the "log file" parameter (redirecting STAMP's standard output)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setLogFile(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
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
    return szStampSuccess_m;

pSetup_io->sData.pLogFP = fopen(pszValue_in,
				pSetup_io->bAppendLogFile ? "a" : "w");
if (pSetup_io->sData.pLogFP == NULL)
    {
//	pSetup_io->sData.pLogFP = stderr;
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
    return szStampSuccess_m;
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
    StampSetup *	pSetup_io)
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

return szStampSuccess_m;
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
    StampSetup *	pSetup_io)
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

return szStampSuccess_m;
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
    StampSetup *	pSetup_io)
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

return szStampSuccess_m;
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
    StampSetup *	pSetup_io)
{
return szStampSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setShowPercentages
 * DESCRIPTION
 *    set the "show percentages" parameter (STAMP's -p command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setShowPercentages(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
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

return szStampSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setVerifyLoading
 * DESCRIPTION
 *    set the "verify loading" parameter (STAMP's -v command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setVerifyLoading(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
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

return szStampSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setOutputProperties
 * DESCRIPTION
 *    set the "output properties" parameter (STAMP's -w p and -x p command line options)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setOutputProperties(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
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

return szStampSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setOutputOriginalWord
 * DESCRIPTION
 *    set the "output original word" parameter (STAMP's -w w and -x w command line options)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setOutputOriginalWord(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
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

return szStampSuccess_m;
}

/* Following added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    setOutputDecomposition
 * DESCRIPTION
 *    set the "output decomposition" parameter (STAMP's -w d and -x d command line options)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setOutputDecomposition(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
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

return szStampSuccess_m;
}


/* Following added by hab 1999.03.11 Do we want this for stampdll?  RE*/
/*****************************************************************************
 * NAME
 *    setCheckMorphReferences
 * DESCRIPTION
 *    set the "check morphname references" parameter (STAMP's -r command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setCheckMorphReferences(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
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

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setDoAllSyntheses
 * DESCRIPTION
 *    set the "do all systhesis" parameter (Stamps's -a command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setDoAllSyntheses(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->sData.bDoAllSyntheses = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
    pSetup_io->sData.bDoAllSyntheses = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
    pSetup_io->sData.bDoAllSyntheses = FALSE;
else
    return szInvalidParameterValue_m;

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setMonitorProgress
 * DESCRIPTION
 *    set the "monitor progress" parameter (STAMP's -m command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setMonitorProgress(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->bMonitorProgress_m = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
    pSetup_io->bMonitorProgress_m = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
    pSetup_io->bMonitorProgress_m = FALSE;
else
    return szInvalidParameterValue_m;

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setMatchCategories
 * DESCRIPTION
 *    set the "match categories" parameter (Stamp's -n command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setMatchCategories(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->sData.bMatchCategories = TRUE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
    pSetup_io->sData.bMatchCategories = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
    pSetup_io->sData.bMatchCategories= FALSE;
else
    return szInvalidParameterValue_m;

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setQuiet
 * DESCRIPTION
 *    set the "quiet" parameter (Stamp's -q command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setQuiet(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->sData.bQuiet = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
    pSetup_io->sData.bQuiet = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
    pSetup_io->sData.bQuiet = FALSE;
else
    return szInvalidParameterValue_m;

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setReportNoEntries
 * DESCRIPTION
 *    set the "report no entries" parameter (Stamps's -r command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setReportNoEntries(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->sData.bReportNoEntries = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
    pSetup_io->sData.bReportNoEntries = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
    pSetup_io->sData.bReportNoEntries = FALSE;
else
    return szInvalidParameterValue_m;

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setUnifiedDictionary
 * DESCRIPTION
 *    set the "check morphname references" parameter (Stamp's -u command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setUnifiedDictionary(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->bUnifiedDictionary_m = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
    pSetup_io->bUnifiedDictionary_m = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
    pSetup_io->bUnifiedDictionary_m = FALSE;
else
    return szInvalidParameterValue_m;

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setVerifyTests
 * DESCRIPTION
 *    set the "verify tests" parameter (STAMP's -v command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setVerifyTests(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->bVerify_m = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
    pSetup_io->bVerify_m = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
    pSetup_io->bVerify_m = FALSE;
else
    return szInvalidParameterValue_m;

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    setOnlyTransfer
 * DESCRIPTION
 *    set the "only transfer" parameter (Stamp's -x command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * setOnlyTransfer(
    const char *	pszValue_in,
    StampSetup *	pSetup_io)
{
if (pszValue_in == NULL)
    pSetup_io->sData.bOnlyTransfer = FALSE;	/* default value */
else if ((_stricmp(pszValue_in, "TRUE") == 0) ||
	 (_stricmp(pszValue_in, "T") == 0) )
    pSetup_io->sData.bOnlyTransfer = TRUE;
else if ((_stricmp(pszValue_in, "FALSE") == 0) ||
	 (_stricmp(pszValue_in, "F") == 0) )
    pSetup_io->sData.bOnlyTransfer = FALSE;
else
    return szInvalidParameterValue_m;

return szStampSuccess_m;
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
    StampSetup *	pSetup_io)
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

return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    getDebugAllomorphs
 * DESCRIPTION
 *    get the "debug allomorphs" parameter (STAMP's ?? command line option)
 * RETURN VALUE
 *    string indicating the value
 */
//static const char * getDebugAllomorphs(
//    StampSetup *	pSetup_io)
//{
//if (pSetup_io->sData.bDebugAllomorphConds)
//    return "TRUE";
//else
//    return "FALSE";
//}

/*****************************************************************************
 * NAME
 *    getCommentChar
 * DESCRIPTION
 *    get the "comment character" parameter (STAMP's -c command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getCommentChar(
    StampSetup *	pSetup_io)
{
	szMessageBuffer_g[0] = pSetup_io->sData.cComment;
	szMessageBuffer_g[1] = NUL;

return szMessageBuffer_g;
}

//#ifndef hab36516
/*****************************************************************************
 * NAME
 *    getEnableAllomorphIDs
 * DESCRIPTION
 *    get the maximum number of analyses to return
 *     (MAX_ANALYSES_TO_RETURN_NO_LIMIT = no limit)
 * RETURN VALUE
 *    string indicating the value
 */
//static const char * getEnableAllomorphIDs(
//    StampSetup *	pSetup_io)
//{
//if (pSetup_io->sData.bRootGlosses)
//    return "TRUE";
//else
//    return "FALSE";
//}
//#ifdef EXPERIMENTAL
/*****************************************************************************
 * NAME
 *    getMaxAnalysesToReturn
 * DESCRIPTION
 *    get the maximum number of analyses to return
 *     (MAX_ANALYSES_TO_RETURN_NO_LIMIT = no limit)
 * RETURN VALUE
 *    string indicating the value
 */
//static const char * getMaxAnalysesToReturn(
//    StampSetup *	pSetup_io)
//{
//sprintf(szMessageBuffer_g, "%d", pSetup_io->sData.iMaxAnalysesToReturn);

//return szMessageBuffer_g;
//}
//#endif /* EXPERIMENTAL */
//#endif /* hab36516 */

/*****************************************************************************
 * NAME
 *    getMaxTrieDepth
 * DESCRIPTION
 *    get the "maximum trie depth" parameter (STAMP's -d command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getMaxTrieDepth(
    StampSetup *	pSetup_io)
{
sprintf(szMessageBuffer_g, "%d", pSetup_io->sData.iMaxTrieLevel);

return szMessageBuffer_g;
}

/*****************************************************************************
 * NAME
 *    getRootGlosses
 * DESCRIPTION
 *    get the "root glosses" parameter (STAMP?? command line option)
 * RETURN VALUE
 *    string indicating the value
 */
//static const char * getRootGlosses(
//    StampSetup *	pSetup_io)
//{
//if (pSetup_io->sData.bRootGlosses)
//    return "TRUE";
//else
//    return "FALSE";
//}

/*****************************************************************************
 * NAME
 *    getMaxMorphnameLength
 * DESCRIPTION
 *    get the "maximum morphname length" parameter (STAMP's -n command line
 *    option)
 * RETURN VALUE
 *    string indicating the value
 */
//static const char * getMaxMorphnameLength(
//    StampSetup *	pSetup_io)
//{
//sprintf(szMessageBuffer_g, "%d", pSetup_io->sData.iMaxMorphnameLength);
//
//return szMessageBuffer_g;
//}

/*****************************************************************************
 * NAME
 *    getSelectiveAnalysisFile
 * DESCRIPTION
 *    get the "selective trace morphs" parameter (STAMP's -s command line
 *    option)
 * RETURN VALUE
 *    string indicating the value
 */
//static const char * getSelectiveAnalysisFile(
//    StampSetup *	pSetup_io)
//{
//strcpy(szMessageBuffer_g,
//       pSetup_io->sData.pszSelectiveAnalFile ?
//				pSetup_io->sData.pszSelectiveAnalFile : "");

//return szMessageBuffer_g;
//}

/*****************************************************************************
 * NAME
 *    getTraceAnalysis
 * DESCRIPTION
 *    get the "trace analysis" parameter (STAMP's -t command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getTraceAnalysis(
    StampSetup *	pSetup_io)
{
switch (pSetup_io->sData.bTrace)
    {
    case TRUE:
		return "TRUE:";
    case FALSE:
		return "FALSE";
    default:
	return "BOGUS!?";
    }
}

/*****************************************************************************
 * NAME
 *    getDebugLevel
 * DESCRIPTION
 *    get the "debug level" parameter (STAMP's -/ command line option)
 * RETURN VALUE
 *    string indicating the value
 */
static const char * getDebugLevel(
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
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
    StampSetup *	pSetup_io)
{
if (pSetup_io->bVerifyLoading)
    return "TRUE";
else
    return "FALSE";
}


/*****************************************************************************
 * NAME
 *    getDoAllSyntheses
 * DESCRIPTION
 *    get the "do all systhesis" parameter (Stamps's -a command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * getDoAllSyntheses(
    StampSetup *	pSetup_io)
{
if (pSetup_io->sData.bDoAllSyntheses)
	return "TRUE";

return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getMonitorProgress
 * DESCRIPTION
 *    get the "monitor progress" parameter (STAMP's -m command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * getMonitorProgress(
    StampSetup *	pSetup_io)
{
if (pSetup_io->bMonitorProgress_m)
	return "TRUE";

return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getMatchCategories
 * DESCRIPTION
 *    get the "match categories" parameter (Stamp's -n command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * getMatchCategories(
    StampSetup *	pSetup_io)
{
if (pSetup_io->sData.bMatchCategories)
	return "TRUE";

return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getQuiet
 * DESCRIPTION
 *    get the "quiet" parameter (Stamp's -q command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * getQuiet(
    StampSetup *	pSetup_io)
{
if (pSetup_io->sData.bQuiet)
	return "TRUE";

return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getReportNoEntries
 * DESCRIPTION
 *    get the "report no entries" parameter (Stamps's -r command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * getReportNoEntries(
    StampSetup *	pSetup_io)
{
if (pSetup_io->sData.bReportNoEntries)
	return "TRUE";

return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getUnifiedDictionary
 * DESCRIPTION
 *    get the "check morphname references" parameter (Stamp's -u command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * getUnifiedDictionary(
    StampSetup *	pSetup_io)
{
if (pSetup_io->sData.bDoAllSyntheses)
	return "TRUE";

return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getVerifyTests
 * DESCRIPTION
 *    get the "verify tests" parameter (STAMP's -v command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * getVerifyTests(
    StampSetup *	pSetup_io)
{
if (pSetup_io->bVerify_m)
	return "TRUE";

return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getOnlyTransfer
 * DESCRIPTION
 *    get the "only transfer" parameter (Stamp's -x command line option)
 * RETURN VALUE
 *    status string indicating success or failure
 */
static const char * getOnlyTransfer(
    StampSetup *	pSetup_io)
{
if (pSetup_io->sData.bOnlyTransfer)
	return "TRUE";

return "FALSE";
}

/*****************************************************************************
 * NAME
 *    getEnableAllomorphIDs
 * DESCRIPTION
 *    
 * RETURN VALUE
 *    status string indicating success or failure
 *	jdh 2002.1.15 added
 */
static const char * getEnableAllomorphIDs(
    StampSetup *	pSetup_io)
{
if (pSetup_io->sData.bEnableAllomorphIDs)
	return "TRUE";

return "FALSE";
}




#ifdef EXPERIMENTAL
/*****************************************************************************
 * NAME
 *    getRecognizeOnly
 * DESCRIPTION
 *    get flag whether or not to store parse results ("Recognize Only" == true
 *    means not to store parse results)
 * RETURN VALUE
 *    string indicating the value
 */
//static const char * getRecognizeOnly(
//    StampSetup *	pSetup_io)
//{
//if (pSetup_io->sData.sPATR.bRecognizeOnly)
//    return "TRUE";
//else
//    return "FALSE";
//}
#endif /* EXPERIMENTAL */

/*****************************************************************************
 * NAME
 *    StampGetParameter
 * DESCRIPTION
 *    retrieve a Stamp parameter value
 * RETURN VALUE
 *    parameter value string
 */
DllExport const char * StampGetParameter(
    StampSetup * pSetup_io,
    const char * pszName_in)
{
/*
 *  verify a valid STAMP setup
 */
if (!isValidSetup(pSetup_io))
    return szStampInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
    return szStampDLLCrash_m;
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
//    case DEBUG_ALLOMORPH_CONDS:
//	return getDebugAllomorphs(pSetup_io);

    case BEGIN_COMMENT:
	return getCommentChar(pSetup_io);

    case MAX_TRIE_DEPTH:
	return getMaxTrieDepth(pSetup_io);

//    case ROOT_GLOSSES:
//	return getRootGlosses(pSetup_io);

//    case MAX_MORPHNAME_LENGTH:
//	return getMaxMorphnameLength(pSetup_io);

//    case SELECTIVE_ANALYSIS_FILE:
//	return getSelectiveAnalysisFile(pSetup_io);

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

	case DO_ALL_SYNTHESES:		/* rke 2009.07.07 */
	return getDoAllSyntheses(pSetup_io);

	case MONITOR_PROGRESS:		/* rke 2009.07.07 */
	return getMonitorProgress(pSetup_io);

	case MATCH_CATEGORIES:		/* rke 2009.07.07 */
	return getMatchCategories(pSetup_io);

	case QUIET:					/* rke 2009.07.07 */
	return getQuiet(pSetup_io);

	case REPORT_NO_ENTRIES:		/* rke 2009.07.07 */
	return getReportNoEntries(pSetup_io);

	case UNIFIED_DICTIONARY:	/* rke 2009.07.07 */
	return getUnifiedDictionary(pSetup_io);

	case VERIFY_TESTS:			/* rke 2009.07.07 */
	return getVerifyTests(pSetup_io);

	case ONLY_TRANSFER:			/* rke 2009.07.07 */
	return getOnlyTransfer(pSetup_io);

//#ifndef hab36516
    case ALLOMORPH_IDS:
    return getEnableAllomorphIDs(pSetup_io);

//#ifdef EXPERIMENTAL
//    case MAX_ANALYSES_TO_RETURN:
//        return getMaxAnalysesToReturn(pSetup_io);
//#endif
//#endif

//#ifdef EXPERIMENTAL
//    case RECOGNIZE_ONLY:
//        return getRecognizeOnly(pSetup_io);
//#endif

    default:
	return szInvalidParameterName_m;
    }
}

/*****************************************************************************
 * NAME
 *    StampUpdateEntry
 * DESCRIPTION
 *    update a dictionary entry with the given value
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampUpdateEntry(StampSetup * pSetup_io,
										const char * pszNewEntry_in)
{
int	iStatus;
/*
 *  verify a valid STAMP setup
 */
if (!isValidSetup(pSetup_io))
    return szStampInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
//Not sure all this log file and iDebug stuff is necessary
if (setjmp(sAbortPoint) != 0)
    {
    pLogFP_m      = NULL;
    iDebugLevel_m = 0;
    return szStampDLLCrash_m;
    }
if (pSetup_io->pszLogFilename != NULL)
    pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
pLogFP_m      = pSetup_io->sData.pLogFP;
iDebugLevel_m = pSetup_io->sData.iDebugLevel;

iStatus = updateStampDictEntry(pszNewEntry_in, &pSetup_io->sData, pSetup_io);

if (pSetup_io->sData.pLogFP != NULL)
    {
    fclose(pSetup_io->sData.pLogFP);
    pSetup_io->sData.pLogFP = NULL;
    }
pLogFP_m      = NULL;
iDebugLevel_m = 0;
return iStatus ? szStampSuccess_m : szBadDictEntry_m;
}


/*****************************************************************************
 * NAME
 *    updateStampDictEntry
 * DESCRIPTION
 *    add this entry to the Stamp dictionary, if the entry does not exist.
 *    if the dictionary codes for a unified dictionary do not exist, the entry
 *    is assumed to use "AmpleLinks Canonical Format" standard format markers
 * RETURN VALUE  
 *    0 if an error occurs, 1 no error, if previous entry
 *    exists it is deleted before the new one is added.
 *    This is the current behavior of stamp. We might want to change
 *    this behavior later for the DLL useage.
 */
int updateStampDictEntry(pszEntry_in, pStamp_io, pSetup_io)
const char *	pszEntry_in;
StampData *	pStamp_io;
StampSetup * pSetup_io;
{
//int	iStatus;
char *	pszMorph = NULL;
char *	pRecord;
int	iType = 0;
char *	pszField;
char *	p;
char	ch = NUL;
int bDontLoad = FALSE;

pRecord = convertRecord(pszEntry_in, pStamp_io, pSetup_io);
if (pRecord == NULL)
    return 0;

for ( pszField = pRecord ; *pszField ; pszField += strlen(pszField) + 1 )
    {
    switch (*pszField)
	{
	case 'M':
	    pszMorph = pszField + strspn(pszField + 1, szWhitespace_g) + 1;
	    break;
	case 'T':
	    p = pszField + strspn(pszField + 1, szWhitespace_g) + 1;
	    switch (*p)
		{
		case 'I':  case 'i':	iType = IFX;	break;
		case 'P':  case 'p':	iType = PFX;	break;
		case 'R':  case 'r':	iType = ROOT;	break;
		case 'S':  case 's':	iType = SFX;	break;
		}
	    break;
	case '!':
	    bDontLoad = TRUE;
	    break;
	default:
	    break;
	}
    }
if (iType == 0)
    iType = ROOT;
if ((pszMorph == NULL) || (*pszMorph == NUL) || bDontLoad)
    {
    freeMemory(pRecord);
    return 0;
    }

/* Removal of possible duplicates is done in check_dic() */

    if (*pRecord == NUL)
	return 0;		/* empty record (probably NOLOAD) */

    switch (iType)
	{
	case PFX:
	case SFX:
	case IFX:
	    add_affixwrap(pRecord, iType, pStamp_io);
	    break;
	case ROOT:
	    add_rootwrap(pRecord, pStamp_io);
	    break;
	default:
	    addStampDictEntrywrap(pRecord, pStamp_io);
	    break;

	}
freeMemory(pRecord);
return 1;
}

/*****************************************************************************
 * NAME
 *    convertRecord
 * DESCRIPTION
 *    convert the standard format dictionary record into its internal form
 * RETURN VALUE
 *    pointer to a dynamically allocated record, or NULL if an error occurs
 */
static char * convertRecord(pszEntry_in, pStamp_io, pSetup_io)
const char *	pszEntry_in;
StampData *	pStamp_io;
StampSetup * pSetup_io;
{
char *		pRecord;
const CodeTable *	pCodeTable;
unsigned	i;
unsigned	j;
size_t		uiLength;
char *		pszField;
char *		pszCode;
char		ch;

if (pszEntry_in == NULL)
    return NULL;
while (*pszEntry_in == '\n')
    ++pszEntry_in;
if (*pszEntry_in != '\\')
    return NULL;

pCodeTable   = pStamp_io->pDictTable;
if (pCodeTable == NULL)
    pCodeTable = &sDefaultCodeTable_m;
pSetup_io->bUnifiedDictionary_m = TRUE;

/*
 *  copy the input string, but ensure 2 NULs at the end, not just one
 */
uiLength = strlen(pszEntry_in);
pRecord = allocMemory(uiLength + 2);
strcpy(pRecord, pszEntry_in);
pRecord[uiLength+1] = NUL;
/*
 *  convert the record to its normalized form
 */
for ( pszField = pRecord ; pszField ; pszField = strchr(pszField, '\n') )
    {
    if (*pszField == '\n')
	{
	while (pszField[1] != '\\')
	    {
	    ++pszField;
	    pszField = strchr(pszField, '\n');
	    if (pszField == NULL)
		{
		return pRecord;
		}
	    }
	*pszField++ = NUL;
	}
    for (   i = 0, pszCode = pCodeTable->pCodeTable ;
	    i < pCodeTable->uiCodeCount ;
	    ++i, pszCode += uiLength + 3 )
	{
	uiLength = strlen(pszCode);
	if (matchBeginning(pszField, pszCode))
	    {
	    ch = pszField[uiLength];
	    if (    (ch == NUL) ||
		    (isascii(ch) && isspace(ch)) )
		{
		pszCode += uiLength + 1;
		pszField[0] = *pszCode;
		for ( j = 1 ; j < uiLength ; ++j )
		    pszField[j] = ' ';
		break;
		}
	    }
	}
    }
return pRecord;
}

/*****************************************************************************
 * NAME
 *    StampWriteDictionary
 * DESCRIPTION
 *    write the STAMP dictionary to a file
 *    using NULL for file name sends the output to the log file
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampWriteDictionary(
    StampSetup * pSetup_in,
    const char * pszFilePath_in)
{
const char *pszResult = szStampSuccess_m;
FILE *outfp = NULL;
/*
 *  verify a valid STAMP setup
 */
if (!isValidSetup(pSetup_in))
    return szStampInvalidSetup_m;
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
    {
    pLogFP_m      = NULL;
    iDebugLevel_m = 0;
    return szStampDLLCrash_m;
    }
if (pSetup_in->pszLogFilename != NULL)
    pSetup_in->sData.pLogFP = fopen(pSetup_in->pszLogFilename, "a");
pLogFP_m      = pSetup_in->sData.pLogFP;
iDebugLevel_m = pSetup_in->sData.iDebugLevel; //prob not needed

if (pszFilePath_in)
	{
	/*
	*  write the dictionary contents to the indicated file
	*/
	// open file pszFilePath_in
	pszFilePath_in = checkEmptyString(pszFilePath_in);
	if (pszFilePath_in == NULL)
		{
			reportError(ERROR_MSG,
			"StampWriteDictionary() missing Output file");
			pszResult = szBadOutputFile_m;
			goto close_and_return;
		}
	/*
     *  open output file
     */
    outfp = fopen( pszFilePath_in, "w");

	if (outfp == NULL)
		{
			pszResult = szBadOutputFile_m;
			goto close_and_return;
		}
writeStampDictionaryDLL(outfp, &pSetup_in->sData);
	fclose(outfp);
	}
else
	writeStampDictionaryDLL(pLogFP_m, &pSetup_in->sData);
close_and_return:

if (pSetup_in->sData.pLogFP != NULL)
    {
    fclose(pSetup_in->sData.pLogFP);
    pSetup_in->sData.pLogFP = NULL;
    }
pLogFP_m      = NULL;
iDebugLevel_m = 0;		//prob not needed
return pszResult;
}

/*****************************************************************************
 * NAME
 *    STAMPInitializeTraceString
 * DESCRIPTION
 *    Set tracing to go to a string instead of a file.
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampInitializeTraceString(
    StampSetup * pSetup_io)
{
/*
 *  verify a valid STAMP setup
 */
if (!isValidSetup(pSetup_io))
    return szStampInvalidSetup_m;
if (pSetup_io->pszTrace == NULL)
    {
    pSetup_io->pszTrace    = allocMemory(20000);
    pSetup_io->uiTraceSize = 20000;
    memset(pSetup_io->pszTrace, 0, pSetup_io->uiTraceSize);
    }
return szStampSuccess_m;
}

/*****************************************************************************
 * NAME
 *    STAMPGetTraceString
 * DESCRIPTION
 *    Get the stored trace string.
 * RETURN VALUE
 *    trace string, or a status string indicating failure
 */
DllExport const char * StampGetTraceString(
    StampSetup * pSetup_io)
{
/*
 *  verify a valid STAMP setup
 */
if (!isValidSetup(pSetup_io))
    return szStampInvalidSetup_m;
if (pSetup_io->pszTrace != NULL)
    return pSetup_io->pszTrace;
else
    return szNoTraceString_m;
}

/* following function added by hab 1999.03.11 */
/*****************************************************************************
 * NAME
 *    StampVerifyLoading
 * DESCRIPTION
 *    perform some verifying output to the log file
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampVerifyLoading(
    StampSetup * pSetup_io)
{
/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
    return szStampDLLCrash_m;

pSetup_io->bVerifyLoading = TRUE;
if (pSetup_io->pszLogFilename != NULL)
    {
    pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
    fprintf( pSetup_io->sData.pLogFP, "\n");
    /* If selective trace, print file name */
    if ( pSetup_io->pszSelectiveAnalFile )
        fprintf( pSetup_io->sData.pLogFP, "Selective trace from file %s\n",
		 pSetup_io->pszSelectiveAnalFile );
    /* Print header for file list */
    fprintf( pSetup_io->sData.pLogFP,
	     "Control files and dictionary files:\n");
    /*
     *	write category classes, string classes, punctuation classes,
     *  morpheme classes, and morphemeco-occurrence constraints to the log file
     */
    writeAmpleCategClasses(pSetup_io->sData.pLogFP,
			   pSetup_io->sData.pCategories,
			   pSetup_io->sData.pCategClasses);
    writeStringClasses(pSetup_io->sData.pLogFP,
		       pSetup_io->sData.pStringClasses);
				/* 3.3.0 hab */
    writePunctClasses(pSetup_io->sData.pLogFP,
		      pSetup_io->sData.pPunctClasses);
    writeAmpleMorphClasses(pSetup_io->sData.pLogFP,
			   pSetup_io->sData.pMorphClasses);
//    writeAmpleMorphConstraints(pSetup_io->sData.pLogFP,
//			       &pSetup_io->sData);
#ifdef EXPERIMENTAL
#ifndef hab35013
//    writeStampNeverConstraints(pSetup_io->sData.pLogFP,
//			       &pSetup_io->sData);
#endif /* hab35013 */
#endif /* EXPERIMENTAL */
    /* tests */
    writeStampTests( pSetup_io->sData.pLogFP, &pSetup_io->sData );

    fclose(pSetup_io->sData.pLogFP);
    pSetup_io->sData.pLogFP = NULL;
    }

return szStampSuccess_m;
}


/* following function added by hab 1999.03.05 */
/*****************************************************************************
 * NAME
 *    StampReportVersion
 * DESCRIPTION
 *    report version information to the log file, if any
 * RETURN VALUE
 *    status string indicating success or failure
 */
DllExport const char * StampReportVersion(
    StampSetup * pSetup_io)
{
time_t		clock;
char *		pszTime;

time( &clock );
pszTime = ctime(&clock);

/*
 *  set variables for emergency exits
 */
if (setjmp(sAbortPoint) != 0)
    return szStampDLLCrash_m;

if (pSetup_io->pszLogFilename != NULL)
    {
    pSetup_io->sData.pLogFP = fopen(pSetup_io->pszLogFilename, "a");
    print_header(pSetup_io->sData.pLogFP, pszTime);
    fclose(pSetup_io->sData.pLogFP);
    pSetup_io->sData.pLogFP = NULL;
    }

return szStampSuccess_m;
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
    fprintf(pLogFP_m, "STAMP Error Message:\n");
    vfprintf(pLogFP_m, pszFormat_in, marker);
    fprintf(pLogFP_m, "\n");
    fflush(pLogFP_m);
    }
if (iDebugLevel_m != 0)
    {
    vsprintf(szMessageBuffer_g, pszFormat_in, marker);
    while ((p = strchr(szMessageBuffer_g, '\n')) != NULL)
	{
	if (p[1] == NUL)
	    *p = NUL;
	else
	    *p = ' ';
	}
    if (eMessageType_in == DEBUG_MSG)
	MessageBoxA(0, szMessageBuffer_g, "STAMP.DLL",
		   MB_OK | MB_ICONINFORMATION);
    else
	MessageBoxA(0, szMessageBuffer_g, "STAMP.DLL",
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
    fprintf(pLogFP_m, "Stamp Message:\n");
    vfprintf(pLogFP_m, pszFormat_in, marker);
    fprintf(pLogFP_m, "\n");
    fflush(pLogFP_m);
    }
if (bNotSilent_in && (iDebugLevel_m != 0))
    {
	vsprintf(szMessageBuffer_g, pszFormat_in, marker);
    MessageBoxA(0, (szMessageBuffer_g), "Stamp.DLL",
       MB_OK | MB_ICONINFORMATION);
    }
va_end( marker );
}

/*****************************************************************************
 * NAME
 *    print_header
 * DESCRIPTION
 *    print the program header to the indicated file (possibly the screen)
 * RETURN VALUE
 *    none
 */
static void print_header(FILE *pOutFP_in, char *pszTime_in)
//FILE *	pOutFP_in;
//char *	pszTime_in;
{
fprintf(pOutFP_in,
	"STAMPDLL: Synthesis(Transfer(AMPle(text))) = adapted text\n");
fprintf(pOutFP_in, "Version %d.%d%c%d%c%d (%s), Copyright %s SIL, Inc.\n",
	iStampVersion_g, iStampRevision_g, cStampPatchSep_g,
	iStampPatchlevel_g,  cStampPatchSep_g, iStampDLLPatchLevel_g,
	pszStampDate_g,	pszStampYear_g);
#ifdef __DATE__
fprintf(pOutFP_in, pszStampCompileFormat_g,
	pszStampCompileDate_g, pszStampCompileTime_g);
#else
if (pszStampTestVersion_g != NULL)
    fputs(pszStampTestVersion_g, pOutFP_in);
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
fprintf( pOutFP_in, "       Transfer/Synthesis Performed %s", pszTime_in );
}


