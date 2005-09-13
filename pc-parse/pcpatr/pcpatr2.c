/* PCPATR2.C - interactive user interface for PC-PATR
 ******************************************************************************
 *
 *	void user_cmd()
 *
 ******************************************************************************
 * Copyright 1989, 2002 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "pcpatr.h"

#ifdef applec
#pragma segment S_pcpatr2
#endif
#ifdef DOS_FILESYSTEM
extern char * getcwd P((char * buffer, int max));
extern int chdir P((const char * new_directory));
#endif

#ifdef __STDC__
static FILE *find_ini_file(void);
#endif
static PATRLexItem * tryMorphParse P((char * pszWord_in));

extern char *	pszArgv0_g;

static char szInitFile_m[MAXLINELEN+1];
/*
 *  error messages
 */
static const NumberedMessage sNeedRulesFirst_m		= { ERROR_MSG,   118,
	"Must load PC-Kimmo rules before loading PC-Kimmo lexicon" };
static const NumberedMessage sNeedKimmoLexiconFirst_m	= { ERROR_MSG,   120,
	"Must load PC-Kimmo lexicon before loading PC-Kimmo grammar" };
const NumberedMessage sNeedLexiconFirst_m		= { ERROR_MSG,   199,
	"The lexicon must be loaded before the %s command" };
static const NumberedMessage sNeedGrammarFirst_m	= { ERROR_MSG,   198,
	"The grammar must be loaded before the %s command" };
static const NumberedMessage sCommentsDisabled_m	= { WARNING_MSG, 197,
	"No comment character visible: comment handling is disabled" };

static const NumberedMessage sMissingAmpleControlFiles_m= { ERROR_MSG,   700,
	"Missing analysis data and dictionary code files in %s command" };
static const NumberedMessage sBadAmpleControlFile_m	= { ERROR_MSG,   701,
	"Invalid analysis data file in %s command: %s" };
static const NumberedMessage sMissingAmpleDictCodeFile_m= { ERROR_MSG,   702,
	"Missing dictionary code file in %s command" };
static const NumberedMessage sBadAmpleDictCodes_m	= { ERROR_MSG,   703,
	"Invalid dictionary code file in %s command: %s" };
static const NumberedMessage sBadAmpleDictOrthoFile_m	= { ERROR_MSG,   704,
	"Invalid dictionary orthography change file in %s command: %s" };
static const NumberedMessage sMissingAmpleDictionaryFile_m= { ERROR_MSG,   710,
	"Missing %sdictionary file in %s command" };
static const NumberedMessage sBadAmpleDictionaryFile_m	= { ERROR_MSG,   711,
	"Invalid %s dictionary file in %s command: %s" };
static const NumberedMessage sNeedControlFirst_m	= { ERROR_MSG,   712,
	"Must load AMPLE control files before loading AMPLE dictionaries" };
static const NumberedMessage sMissingAmpleTextCtlFile_m	= { ERROR_MSG,   720,
	"Missing text input control file in %s command" };
static const NumberedMessage sBadAmpleTextCtlFile_m	= { ERROR_MSG,   721,
	"Invalid text input control file in %s command: %s" };

/*************************************************************************
 *  Values for successful keyword searches (must be >= 0)
 */
#define KW_ALL		 1
#define KW_AMBIGUITIES	 2
#define KW_CD		 3
#define KW_CLOSE	 4
#ifdef HAS_SUBPROCESS
#define KW_DIRECTORY	 5
#define KW_EDIT		 6
#endif
#define KW_TRIM_FEATURES 7
#define KW_FAILURES	 8
#define KW_FEATURES	 9
#define KW_FLAT		10
#define KW_FULL		11
#define KW_GRAMMAR	12
#define KW_HELP		13
#define KW_LOAD		14
#define KW_LOG		15
#define KW_CLEAR	16
#define KW_OFF		17
#define KW_ON		18
#define KW_PARSE	19
#define KW_QUIT		20

#define KW_SET		22
#define KW_SHOW		23
#define KW_STATUS	24
#ifdef HAS_SUBPROCESS
#define KW_SYSTEM	25
#endif
#define KW_TAKE		26
#define KW_TIMING	27
#define KW_TOP		28
#define KW_TREE		29
#define KW_UNIFICATION	30
#define KW_VERBOSE	31
#define KW_WARNING	32
#define KW_DISAMBIGUATE	33
#define KW_ANALYSIS     34
#define KW_IT           35
#define KW_LEXICON      36
#define KW_SHOEBOX      37
#define KW_MARKER	38	/* these five added for "SET MARKER" */
#define KW_RECORD	39
#define KW_WORD		40
#define KW_CATEGORY	41
#define KW_GLOSS	42
#define KW_SAVE		43	/* added for "SAVE <takefile>" */
#define KW_FILE		44	/* added for "FILE PARSE <infile> [<out>]" */
#define KW_INDENTED	45
#define KW_KIMMO	46
#define KW_RULES	47
#define KW_AMPLE		48
#define KW_CONTROL		49	/* LOAD AMPLE CONTROL ... */
#define KW_DICTIONARY		50	/* LOAD AMPLE DICTIONARY ... */
#define KW_TEXT_CONTROL		51	/* LOAD AMPLE TEXT-CONTROL <file> */
#define KW_AMPLE_DICTIONARY	52	/* SET AMPLE-DICTIONARY {SPLIT|U...} */
#define KW_COMMENT		53
#define KW_CHECK_CYCLES		54	/* SET CHECK-CYCLES {ON|OFF} */
#define KW_TOPDOWN_FILTER	55	/* SET TOP-DOWN-FILTER {ON|OFF} */
#define KW_WRITE_AMPLE_PARSES	56	/* SET WRITE-AMPLE-PARSES {ON|OFF} */
#define KW_UNIFIED		57	/* SET AMPLE-DICTIONARY ... */
#define KW_SPLIT		58	/* SET AMPLE-DICTIONARY ... */
#define KW_XML		59	/* added for SET TREE XML */
#define KW_LIMIT	60	/* added for SET LIMIT n */
#define KW_PROMOTE	61	/* added for SET PROMOTE-DEFAULTS {ON|OFF} */
#define KW_FINAL_PUNC	62	/* added for SET FINAL-PUNCTUATION */
#define KW_PROPERTY_FEATURE 63	/* added for SET PROPERTY-IS-FEATURE {ON|OFF} */
#ifndef hab130
#define KW_ROOTGLOSS         64	/* added for SET MARKER ROOTGLOSS */
#define KW_ROOTGLOSS_FEATURE 65	/* added for SET ROOTGLOSS (OFF|ON|LEFTHEADED|RIGHTHEADED|ALL) */
#define KW_LEFT              66 /* added for SET ROOTGLOSS LEFTHEADED */
#define KW_RIGHT             67 /* added for SET ROOTGLOSS RIGHTHEADED */
#endif /* hab130 */

/*************************************************************************
 *  Variables and symbols local to this module
 */
static const char szPCPATRprompt_m[9] = "PC-PATR>";

/*************************************************************************
 *  keyword tables for interactive commands
 */
static const CmdKeyword cmd_tab[] = {	/* Top-Level Keyword Table */
	{ "cd",		KW_CD,        0 },
	{ "clear",		KW_CLEAR,     0 },
	{ "close",		KW_CLOSE,     0 },
#ifdef HAS_SUBPROCESS
	{ "directory",	KW_DIRECTORY, 0 },
	{ "edit",		KW_EDIT,      0 },
#endif
	{ "exit",		KW_QUIT,      0 },
	{ "file",		KW_FILE,      0 },
	{ "help",		KW_HELP,      0 },
	{ "l",		KW_LOAD,      CMD_INVISIBLE },
#ifdef HAS_SUBPROCESS
	{ "ls",		KW_DIRECTORY, CMD_INVISIBLE },
#endif
	{ "load",		KW_LOAD,      0 },
	{ "log",		KW_LOG,       0 },
	{ "parse",		KW_PARSE,     0 },
	{ "quit",		KW_QUIT,      0 },
	{ "save",		KW_SAVE,      0 },
	{ "set",		KW_SET,       0 },
	{ "show",		KW_SHOW,      0 },
	{ "status",		KW_STATUS,    0 },
#ifdef HAS_SUBPROCESS
	{ "system",		KW_SYSTEM,    0 },
#endif
	{ "take",		KW_TAKE,      0 },
	};
static const int n_cmd = (sizeof(cmd_tab) / sizeof(CmdKeyword));

static const CmdKeyword file_tab[] = {	/* FILE command keyword table */
	{ "disambiguate",	KW_DISAMBIGUATE,   0 },
	{ "parse",		KW_PARSE,	   0 },
	};
static const int n_file = (sizeof(file_tab) / sizeof(CmdKeyword));

static const CmdKeyword load_tab[] = {	/* LOAD command keyword table */
	{ "a",		KW_ANALYSIS, CMD_INVISIBLE },
	{ "ample",		KW_AMPLE,    0 },
	{ "analysis",	KW_ANALYSIS, 0 },
	{ "grammar",	KW_GRAMMAR,  0 },
	{ "lexicon",	KW_LEXICON,  0 },
	{ "kimmo",		KW_KIMMO,    0 },
	{ "pckimmo",	KW_KIMMO,    CMD_INVISIBLE },
	};
static int n_load = (sizeof(load_tab) / sizeof(CmdKeyword));

					/* LOAD KIMMO command keyword table */
static const CmdKeyword loadkimmo_tab[] = {
	{ "grammar",	KW_GRAMMAR, 0 },
	{ "lexicon",	KW_LEXICON, 0 },
	{ "rules",		KW_RULES,   0 },
	};
static const int n_loadkimmo = (sizeof(loadkimmo_tab) / sizeof(CmdKeyword));

					/* LOAD AMPLE command keyword table */
static const CmdKeyword loadample_tab[] = {
	{ "control",	KW_CONTROL,		0 },
	{ "dictionary",	KW_DICTIONARY,		0 },
	{ "text-control",	KW_TEXT_CONTROL,	0 },
	};
static const int n_loadample = (sizeof(loadample_tab) / sizeof(CmdKeyword));

static const CmdKeyword set_tab[] = {	/* SET command keyword table */
	{ "ambiguities",		KW_AMBIGUITIES,		0 },
	{ "ample-dictionary",	KW_AMPLE_DICTIONARY,	0 },
	{ "check-cycles",		KW_CHECK_CYCLES,	0 },
	{ "comment",		KW_COMMENT,		0 },
	{ "failures",		KW_FAILURES,		0 },
	{ "features",		KW_FEATURES,		0 },
	{ "final-punctuation",	KW_FINAL_PUNC,		0 },
	{ "gloss",			KW_GLOSS,		0 },
	{ "kimmo",			KW_KIMMO,		0 },
	{ "limit",			KW_LIMIT,		0 },
	{ "marker",			KW_MARKER,		0 },
	{ "promote-defaults",	KW_PROMOTE,		0 },
	{ "property-is-feature",	KW_PROPERTY_FEATURE,	0 },
#ifndef hab130
	{ "rootgloss",              KW_ROOTGLOSS_FEATURE,   0 },
#endif /* hab130 */
	{ "timing",			KW_TIMING,		0 },
	{ "top-down-filter",	KW_TOPDOWN_FILTER,	0 },
	{ "tree",			KW_TREE,		0 },
	{ "trim-empty-features",	KW_TRIM_FEATURES,	0 },
	{ "unification",		KW_UNIFICATION,		0 },
	{ "verbose",		KW_VERBOSE,		0 },
	{ "warnings",		KW_WARNING,		0 },
	{ "write-ample-parses",	KW_WRITE_AMPLE_PARSES,	0 },
	};
static const int n_set = (sizeof(set_tab) / sizeof(CmdKeyword));

					/* SET KIMMO command keyword table */
static const CmdKeyword setkimmo_tab[] = {
	{ "check-cycles",		KW_CHECK_CYCLES,	0 },
	{ "promote-defaults",	KW_PROMOTE,		0 },
	{ "top-down-filter",	KW_TOPDOWN_FILTER,	0 },
	};
static const int n_setkimmo = (sizeof(setkimmo_tab) / sizeof(CmdKeyword));

static const CmdKeyword show_tab[] = {	/* SHOW command keyword table */
	{ "lexicon",	KW_LEXICON,   0 },
	{ "status",		KW_STATUS,    0 },
	};
static const int n_show = (sizeof(show_tab) / sizeof(CmdKeyword));

static const CmdKeyword save_tab[] = {	/* SAVE command keyword table */
	{ "lexicon",	KW_LEXICON,   0 },
	{ "status",		KW_STATUS,    0 },
	};
static const int n_save = (sizeof(save_tab) / sizeof(CmdKeyword));

const CmdKeyword feature_tab[] = { /* SET FEATURES command keyword table */
	{ "all",		KW_ALL,  0 },
	{ "flat",		KW_FLAT, 0 },
	{ "full",		KW_FULL, 0 },
	{ "off",		KW_OFF,  0 },
	{ "on",		KW_ON,   CMD_INVISIBLE },
	{ "top",		KW_TOP,	 0 },
	};
const int n_feature = (sizeof(feature_tab) / sizeof(CmdKeyword));

const CmdKeyword marker_tab[] = { /* SET MARKER command keyword table */
	{ "category",	KW_CATEGORY, 0 },
	{ "features",	KW_FEATURES, 0 },
	{ "gloss",		KW_GLOSS,    0 },
	{ "record",		KW_RECORD,   0 },
#ifndef hab130
	{ "rootgloss",      KW_ROOTGLOSS,0 },
#endif /* hab130 */
	{ "word",		KW_WORD,     0 },
	};
const int n_marker = (sizeof(marker_tab) / sizeof(CmdKeyword));

#ifndef hab130
const CmdKeyword rootgloss_tab[] = { /* SET ROOTGLOSS command keyword table */
	{ "all",		KW_ALL,   0 },
	{ "leftheaded",	KW_LEFT,  0 },
	{ "off",		KW_OFF,   0 },
	{ "on",		KW_ON,    0 },
	{ "rightheaded",	KW_RIGHT, 0 },
	};
const int n_rootgloss = (sizeof(rootgloss_tab) / sizeof(CmdKeyword));
#endif /* hab130 */

const CmdKeyword tree_tab[] = {	/* SET TREE command keyword table */
	{ "flat",		KW_FLAT,     0 },
	{ "full",		KW_FULL,     0 },
	{ "indented",	KW_INDENTED, 0 },
	{ "off",		KW_OFF,      0 },
	{ "on",		KW_ON,       CMD_INVISIBLE },
	{ "xml",		KW_XML,      0 },
	};
const int n_tree = (sizeof(tree_tab) / sizeof(CmdKeyword));

static const CmdKeyword onoff_tab[] = {	/* ON and OFF keywords table */
	{ "off",		KW_OFF, 0 },
	{ "on",		KW_ON, 0 },
	};
static const int n_onoff = (sizeof(onoff_tab) / sizeof(CmdKeyword));
/*
 * SET AMPLE-DICTIONARY keywords table
 */
static const CmdKeyword aAmpleDictKeywords_m[] = {
	{ "split",		KW_SPLIT,	0 },
	{ "unified",	KW_UNIFIED,	0 },
	};
static const int iAmpleDictKeywordNumber_m = (sizeof(aAmpleDictKeywords_m) /
							sizeof(CmdKeyword));

/*****************************************************************************
 * NAME
 *    do_load_ample
 * DESCRIPTION
 *    Finish parsing and execute a LOAD AMPLE command.
 * RETURN VALUE
 *    none
 */
static void do_load_ample()
{
char *	pszArg;
char *	pszAnalysisFile;
char *	pszCodesFile;
char *	pszChangeFile;
char *	pszDictionaryFile;
int	eDictionary;
int	bDictionaries;
char *	pszDictType;
char *	pszTextControlFile;
int	bGoodTextControl;
int	iCount;
static char szDictLoadMessage_s[] = "\t%s DICTIONARY: Loaded %d record%s\n";
/*
 *  fix the AMPLE settings
 */
sPCPATRAmpleData_g.cBeginComment = sPCPATRData_g.cComment;
sPCPATRAmpleData_g.pLogFP        = sPCPATRData_g.pLogFP;

pszArg = (char *)tokenizeString(NULL,szWhitespace_g);
switch (lookupCmdKeyword( pszArg, loadample_tab, n_loadample, ""))
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD AMPLE" );
	break;
	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD AMPLE", pszArg);
	break;
	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP LOAD AMPLE for more help\n");
	break;

	case KW_CONTROL:		/* LOAD AMPLE CONTROL ... */
	pszArg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (wantCmdHelp(pszArg,
"LOAD AMPLE CONTROL xxAD01.ctl xxANCD.TAB [xxORDC.TAB] (no defaults)"))
		return;
	if (bPCPATRTiming_g)
		startCmdTiming();
	/*
	 *  erase any existing AMPLE information
	 */
	resetAmpleData( &sPCPATRAmpleData_g );
	/*
	 *  erase any existing PC-Kimmo information
	 */
	freePATRGrammar(&sPCPATRKimmoData_g.sPATR);
	if (sPCPATRKimmoData_g.pszLexiconFile != NULL)
		freeKimmoLexicon(&sPCPATRKimmoData_g);
	if (sPCPATRKimmoData_g.pszRulesFile != NULL)
		freeKimmoRules(&sPCPATRKimmoData_g);

	if (pszArg != NULL)
		{
		pszAnalysisFile = setCmdFilename( pszArg, NULL, ".ctl");
		if (getCmdTakeLevel() != 0)
		{
		char * pszFile = buildAdjustedFilename(pszAnalysisFile,
							getCmdTakeFile(),
							NULL );
		freeMemory(pszAnalysisFile);
		pszAnalysisFile = pszFile;
		}
		if (!bPCPATRSilent_g)
		fprintf(stderr,
			"Loading AMPLE control (\"analysis data\") file %s\n",
			pszAnalysisFile);
		sPCPATRAmpleData_g.cBeginComment = sPCPATRData_g.cComment;
		if (loadAmpleControlFile(pszAnalysisFile,&sPCPATRAmpleData_g) != 0)
		{
		displayNumberedMessage(&sBadAmpleControlFile_m,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "LOAD AMPLE CONTROL", pszArg);
		}
		freeMemory(pszAnalysisFile);
		}
	else
		{
		displayNumberedMessage(&sMissingAmpleControlFiles_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD AMPLE CONTROL");
		}
	pszArg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (pszArg != NULL)
		{
		pszCodesFile = setCmdFilename( pszArg, NULL, ".tab");
		if (getCmdTakeLevel() != 0)
		{
		char * psz =  buildAdjustedFilename(pszCodesFile,
							 getCmdTakeFile(), NULL);
		freeMemory(pszCodesFile);
		pszCodesFile = psz;
		}
		if (!bPCPATRSilent_g)
		fprintf(stderr,
			"Loading AMPLE dictionary codes file %s\n",
			pszCodesFile);
		if (loadAmpleDictCodeTables(pszCodesFile,
					&sPCPATRAmpleData_g) != 0)
		{
		displayNumberedMessage(&sBadAmpleDictCodes_m,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "LOAD AMPLE CONTROL", pszArg);
		}
		freeMemory(pszCodesFile);
		}
	else
		{
		displayNumberedMessage(&sMissingAmpleDictCodeFile_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD AMPLE CONTROL");
		}
	pszArg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (pszArg != NULL)
		{
		pszChangeFile = setCmdFilename( pszArg, NULL, ".tab");
		if (getCmdTakeLevel() != 0)
		{
		char * psz = buildAdjustedFilename(pszChangeFile,
							  getCmdTakeFile(), NULL);
		freeMemory(pszChangeFile);
		pszChangeFile = psz;
		}
		if (!bPCPATRSilent_g)
		fprintf(stderr,
			   "Loading AMPLE dictionary orthography change file %s\n",
			pszChangeFile);
		if (loadAmpleDictOrthoChanges(pszChangeFile,
					  &sPCPATRAmpleData_g) != 0)
		{
		displayNumberedMessage(&sBadAmpleDictOrthoFile_m,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "LOAD AMPLE CONTROL", pszArg);
		}
		freeMemory(pszChangeFile);
		}
	else
		sPCPATRAmpleData_g.pDictOrthoChanges = NULL;

	if (bPCPATRTiming_g)
		{
		stopCmdTiming();
		if (    (sPCPATRAmpleData_g.pszAnalysisDataFile != NULL) &&
			(sPCPATRAmpleData_g.pszDictionaryCodesFile != NULL) &&
			!sPCPATRData_g.bSilent)
		showCmdTiming();
		}
	break;

	case KW_DICTIONARY:			/* LOAD AMPLE DICTIONARY ... */
	pszArg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (wantCmdHelp(pszArg, bPCPATRUnifiedAmpleDictionary_g ?
   "LOAD AMPLE DICTIONARY file01.dic [file02.dic] [file03.dic] ..." :
   "LOAD AMPLE DICTIONARY [prefix.dic] [infix.dic] [suffix.dic] root01.dic ..."
		))
		return;
	if (pszArg == NULL)
		{
		displayNumberedMessage(&sMissingAmpleDictionaryFile_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "", "LOAD AMPLE DICTIONARY");
		break;
		}
	if (sPCPATRAmpleData_g.pszAnalysisDataFile == NULL)
		{
		displayNumberedMessage(&sNeedControlFirst_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0);
		break;
		}
	if (bPCPATRTiming_g)
		startCmdTiming();
	/*
	 *  erase any existing AMPLE dictionary
	 */
	if (sPCPATRAmpleData_g.pDictionary != NULL)
		{
		freeAmpleDictionary( &sPCPATRAmpleData_g );
		sPCPATRAmpleData_g.pDictionary = NULL;
		freeStringList( sPCPATRAmpleData_g.pDictionaryFiles );
		sPCPATRAmpleData_g.pDictionaryFiles = NULL;
		}
	if (bPCPATRUnifiedAmpleDictionary_g)
		eDictionary = AMPLE_UNIFIED;
	else
		eDictionary = AMPLE_PFX;
	bDictionaries = FALSE;
	do
		{
		pszDictionaryFile = setCmdFilename( pszArg, NULL, ".dic");
		if (getCmdTakeLevel() != 0)
		{
		char * psz = buildAdjustedFilename(pszDictionaryFile,
							  getCmdTakeFile(),
							  NULL );
		freeMemory(pszDictionaryFile);
		pszDictionaryFile = psz;
		}
		if (bPCPATRUnifiedAmpleDictionary_g)
		{
		iCount = loadAmpleDictionary(pszDictionaryFile,
						 eDictionary,
						 &sPCPATRAmpleData_g);
		if (iCount == -1)
			{
			displayNumberedMessage(&sBadAmpleDictionaryFile_m,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "unified", "LOAD AMPLE DICTIONARY",
					   pszArg);
			}
		else
			{
			bDictionaries = TRUE;
			reportMessage(!bCmdSilentMessages_g,
				  szDictLoadMessage_s, "UNIFIED", iCount,
				  (iCount == 1) ? "" : "s" );
			}
		}
		else
		{
		/*
		 *  determine the actual type of this dictionary file
		 */
		switch (eDictionary)
			{
			case AMPLE_PFX:
			if (sPCPATRAmpleData_g.iMaxPrefixCount != 0)
				break;
			eDictionary = AMPLE_IFX;
			/* fall through */
			case AMPLE_IFX:
			if (sPCPATRAmpleData_g.iMaxInfixCount != 0)
				break;
			eDictionary = AMPLE_SFX;
			/* fall through */
			break;
			case AMPLE_SFX:
			if (sPCPATRAmpleData_g.iMaxSuffixCount != 0)
				break;
			eDictionary = AMPLE_ROOT;
			break;
			}
		/*
		 *  load the dictionary file
		 */
		iCount = loadAmpleDictionary(pszDictionaryFile,
						 eDictionary,
						 &sPCPATRAmpleData_g);
		if (iCount == -1)
			{
			switch (eDictionary)
			{
			case AMPLE_PFX:		pszDictType = "prefix";	break;
			case AMPLE_IFX:		pszDictType = "infix";	break;
			case AMPLE_SFX:		pszDictType = "suffix";	break;
			case AMPLE_ROOT:	pszDictType = "root";	break;
			default:		pszDictType = "?BUG?";	break;
			}
			displayNumberedMessage(&sBadAmpleDictionaryFile_m,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   pszDictType,
					   "LOAD AMPLE DICTIONARY",
					   pszArg);
			}
		else
			{
			/*
			 *  signal that we've at least tried to read each type of
			 *  dictionary needed
			 */
			if (eDictionary == AMPLE_ROOT)
			bDictionaries = TRUE;
			switch (eDictionary)
			{
			case AMPLE_PFX:		pszDictType = "PREFIX";	break;
			case AMPLE_IFX:		pszDictType = "INFIX";	break;
			case AMPLE_SFX:		pszDictType = "SUFFIX";	break;
			case AMPLE_ROOT:	pszDictType = "ROOT";	break;
			default:		pszDictType = "?BUG?";	break;
			}
			reportMessage(!bCmdSilentMessages_g,
				  szDictLoadMessage_s, pszDictType, iCount,
				  (iCount == 1) ? "" : "s" );
			}
		/*
		 *  set the default type of the next dictionary file
		 */
		switch (eDictionary)
			{
			case AMPLE_PFX:	eDictionary = AMPLE_IFX;	break;
			case AMPLE_IFX:	eDictionary = AMPLE_SFX;	break;
			case AMPLE_SFX:	eDictionary = AMPLE_ROOT;	break;
			}
		}
		freeMemory(pszDictionaryFile);
		pszDictionaryFile = NULL;

		pszArg = (char *)tokenizeString(NULL, szWhitespace_g);
		} while (pszArg != NULL);
	if (bPCPATRTiming_g)
		{
		stopCmdTiming();
		if (    (sPCPATRAmpleData_g.pDictionary != NULL) &&
			bDictionaries &&
			!sPCPATRData_g.bSilent)
		showCmdTiming();
		}
	if (!bDictionaries)
		{
		switch (eDictionary)
		{
		case AMPLE_PFX:		pszDictType = "prefix ";	break;
		case AMPLE_IFX:		pszDictType = "infix ";		break;
		case AMPLE_SFX:		pszDictType = "suffix ";	break;
		case AMPLE_ROOT:	pszDictType = "root ";		break;
		default:		pszDictType = "";		break;
		}
		displayNumberedMessage(&sMissingAmpleDictionaryFile_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   pszDictType, "LOAD AMPLE DICTIONARY");
		if (sPCPATRAmpleData_g.pDictionary != NULL)
		{
		freeAmpleDictionary( &sPCPATRAmpleData_g );
		sPCPATRAmpleData_g.pDictionary = NULL;
		freeStringList( sPCPATRAmpleData_g.pDictionaryFiles );
		sPCPATRAmpleData_g.pDictionaryFiles = NULL;
		}
		}
	break;

	case KW_TEXT_CONTROL:		/* LOAD AMPLE TEXT-CONTROL ... */
	pszArg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (wantCmdHelp(pszArg,
"LOAD AMPLE TEXT-CONTROL xxINTX.CTL (no default)"))
		return;
	if (bPCPATRTiming_g)
		startCmdTiming();
	bGoodTextControl = FALSE;
	/*
	 *  erase any existing text input control information
	 */
	resetTextControl( &sPCPATRAmpleData_g.sTextCtl );
	/*
	 *  erase any existing PC-Kimmo information
	 */
	freePATRGrammar(&sPCPATRKimmoData_g.sPATR);
	if (sPCPATRKimmoData_g.pszLexiconFile != NULL)
		freeKimmoLexicon(&sPCPATRKimmoData_g);
	if (sPCPATRKimmoData_g.pszRulesFile != NULL)
		freeKimmoRules(&sPCPATRKimmoData_g);

	if (pszArg != NULL)
		{
		pszTextControlFile = setCmdFilename( pszArg, NULL, ".ctl");
		if (getCmdTakeLevel() != 0)
		{
		char * psz = buildAdjustedFilename(pszTextControlFile,
							   getCmdTakeFile(),
							   NULL );
		freeMemory(pszTextControlFile);
		pszTextControlFile = psz;
		}
		if (!bPCPATRSilent_g)
		fprintf(stderr,
			"Loading AMPLE text input control file %s\n",
			pszTextControlFile);
		if (loadIntxCtlFile(pszTextControlFile, sPCPATRData_g.cComment,
				&sPCPATRAmpleData_g.sTextCtl,
				&sPCPATRAmpleData_g.pStringClasses) != 0)
		{
		displayNumberedMessage(&sBadAmpleTextCtlFile_m,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "LOAD AMPLE CONTROL", pszArg);
		}
		else
		bGoodTextControl = TRUE;
		freeMemory(pszTextControlFile);
		}
	else
		{
		displayNumberedMessage(&sMissingAmpleTextCtlFile_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD AMPLE CONTROL");
		}
	if (bPCPATRTiming_g)
		{
		stopCmdTiming();
		if (bGoodTextControl && !sPCPATRData_g.bSilent)
		showCmdTiming();
		}
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD AMPLE", pszArg);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_load_kimmo
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Finish parsing and execute a LOAD KIMMO command.
 * RETURN VALUE
 *    none
 */
static void do_load_kimmo()
{
register char * arg;

arg = (char *)tokenizeString(NULL,szWhitespace_g);
switch (lookupCmdKeyword( arg, loadkimmo_tab, n_loadkimmo, ""))
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD KIMMO" );
	break;
	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD KIMMO", arg);
	break;
	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP LOAD KIMMO for more help\n");
	break;

	case KW_RULES:			/* LOAD KIMMO RULES ... */
	arg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (wantCmdHelp(arg,
"LOAD KIMMO RULES [<file>] (default name is rules.rul, default type is .rul)"))
		return;
	/*
	 *  erase any existing AMPLE information
	 */
	resetAmpleData( &sPCPATRAmpleData_g );

	arg = setCmdFilename( arg, "rules.rul", ".rul");
	if (getCmdTakeLevel() != 0)
		{
		char * pszFile = buildAdjustedFilename( arg, getCmdTakeFile(),
							NULL);
		freeMemory(arg);
		arg = pszFile;
		}
	if (bPCPATRTiming_g)
		startCmdTiming();
	if (!bPCPATRSilent_g)
		fprintf(stderr, "Loading PC-Kimmo rules from %s\n", arg);
	if (	(loadKimmoRules((unsigned char *)arg,
				&sPCPATRKimmoData_g) == 0) &&
		!bPCPATRSilent_g && sPCPATRKimmoData_g.bTwoLCFile )
		fprintf(stderr, "%s is a twolc rules file.\n",
			sPCPATRKimmoData_g.pszRulesFile);
	freeMemory(arg);
	if (bPCPATRTiming_g)
		{
		stopCmdTiming();
		if (    sPCPATRKimmoData_g.pszRulesFile != NULL &&
			!sPCPATRData_g.bSilent)
		showCmdTiming();
		}
	break;

	case KW_LEXICON:			/* LOAD KIMMO LEXICON ... */
	arg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (wantCmdHelp(arg,"\
LOAD KIMMO LEXICON [<file>] (default name is lexicon.lex, default type is .lex)\
"))
		return;
	/*
	 *  erase any existing AMPLE information
	 */
	resetAmpleData( &sPCPATRAmpleData_g );

	if (sPCPATRKimmoData_g.pszLexiconFile != NULL)
		freeKimmoLexicon(&sPCPATRKimmoData_g);
	if (sPCPATRKimmoData_g.pszRulesFile == NULL)
		displayNumberedMessage(&sNeedRulesFirst_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0);
	else
		{
		arg = setCmdFilename( arg, "lexicon.lex", ".lex");
		if (getCmdTakeLevel() != 0)
		{
		char * psz = buildAdjustedFilename( arg, getCmdTakeFile(),
							NULL);
		freeMemory(arg);
		arg = psz;
		}
		if (bPCPATRTiming_g)
		startCmdTiming();
		if (!bPCPATRSilent_g)
		fprintf(stderr, "Loading PC-Kimmo lexicon from %s\n", arg );
		loadKimmoLexicon((unsigned char *)arg, KIMMO_ANALYSIS,
				 &sPCPATRKimmoData_g);
		freeMemory(arg);
		if (bPCPATRTiming_g)
		{
		stopCmdTiming();
		if (	sPCPATRKimmoData_g.pszLexiconFile != NULL &&
			!sPCPATRData_g.bSilent)
			showCmdTiming();
		}
		}
	break;

	case KW_GRAMMAR:			/* LOAD KIMMO GRAMMAR ... */
	arg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (wantCmdHelp(arg,"\
LOAD KIMMO GRAMMAR [<file>] (default name is grammar.grm, default type is .grm)\
"))
		return;
	/*
	 *  erase any existing AMPLE information
	 */
	resetAmpleData( &sPCPATRAmpleData_g );
	/*
	 *  free the memory used by the existing grammar
	 */
	freePATRGrammar(&sPCPATRKimmoData_g.sPATR);
	if (sPCPATRKimmoData_g.pszLexiconFile == NULL)
		displayNumberedMessage(&sNeedKimmoLexiconFirst_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0);
	else
		{
		arg = setCmdFilename( arg, "grammar.grm", ".grm");
		if (getCmdTakeLevel() != 0)
		{
		char * psz = buildAdjustedFilename( arg, getCmdTakeFile(),
							NULL);
		freeMemory(arg);
		arg = psz;
		}
		if (bPCPATRTiming_g)
		startCmdTiming();
		if (!bPCPATRSilent_g)
		fprintf(stderr, "Loading PC-Kimmo word grammar from %s\n",arg);
		sPCPATRKimmoData_g.sPATR.cComment    = sPCPATRData_g.cComment;
		sPCPATRKimmoData_g.sPATR.iDebugLevel = iPCPATRDebugLevel_g;
		if (loadPATRGrammar((char *)arg, &sPCPATRKimmoData_g.sPATR) != 0)
		sPCPATRKimmoData_g.bUsePATR = TRUE;
		freeMemory(arg);
		if (bPCPATRTiming_g)
		{
		stopCmdTiming();
		if (	sPCPATRKimmoData_g.sPATR.pGrammar != NULL &&
			!sPCPATRData_g.bSilent)
			showCmdTiming();
		}
		}
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD KIMMO", arg);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_load
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Finish parsing and execute a LOAD command.
 * RETURN VALUE
 *    none
 */
static void do_load()
{
register char *arg;
StringList *filelist, *sp;
char *p;

arg = (char *)tokenizeString(NULL,szWhitespace_g);
switch (lookupCmdKeyword( arg, load_tab, n_load, ""))
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD" );
	break;
	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD", arg);
	break;
	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP LOAD for more help\n");
	break;

	case KW_GRAMMAR:			/* LOAD GRAMMAR [<filename>] */
	arg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (wantCmdHelp(arg,
"LOAD GRAMMAR [<file>] (default name is grammar.grm, default type is .grm)"))
		return;
	freePATRGrammar(&sPCPATRData_g);
	if (pszPCPATRGrammarFile_g != NULL)
			{		/* Free the memory used by the existing grammar */
		freeMemory(pszPCPATRGrammarFile_g);
		pszPCPATRGrammarFile_g = NULL;
		}
	arg = setCmdFilename( arg, "grammar.grm", ".grm");
	if (getCmdTakeLevel() != 0)
		{
		char * psz = buildAdjustedFilename( arg, getCmdTakeFile(), NULL);
		freeMemory(arg);
		arg = psz;
		}
	if (bPCPATRTiming_g)
		startCmdTiming();
	if (!bPCPATRSilent_g)
		fprintf(stderr, "Loading grammar from %s\n", arg);
	sPCPATRData_g.iDebugLevel = iPCPATRDebugLevel_g;
	if (loadPATRGrammar((char *)arg, &sPCPATRData_g) == 0)
		freeMemory(arg);		/* error loading the grammar file */
	else
		pszPCPATRGrammarFile_g = (char *)arg;
	if (bPCPATRTiming_g)
		{
		stopCmdTiming();
		if (pszPCPATRGrammarFile_g != NULL && !sPCPATRData_g.bSilent)
		showCmdTiming();
		}
	break;

	case KW_LEXICON:			/* LOAD LEXICON [<filename> ...] */
	arg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (wantCmdHelp(arg,
"LOAD LEXICON [<file> ...] (default name is lexicon.lex, default type is .lex)"
			 ))
		return;
	/*
	 *  free memory used by the existing lexicon
	 */
	freePATRLexicon(&sPCPATRData_g);
	if (pPCPATRLexiconFiles_g != NULL)
			{
		freeStringList(pPCPATRLexiconFiles_g);
		pPCPATRLexiconFiles_g = NULL;
		}
	if (pPCPATRAmpleFiles_g != NULL)
			{
		freeStringList(pPCPATRAmpleFiles_g);
		pPCPATRAmpleFiles_g = NULL;
		}
	filelist = NULL;
	if (arg != NULL)
		{
		while ((p = (char *)tokenizeString(NULL,
						   szWhitespace_g)) != NULL)
		filelist = mergeIntoStringListAtEnd(filelist, p);
		}
	arg = setCmdFilename( arg, "lexicon.lex", ".lex");
	if (getCmdTakeLevel() != 0)
		{
		char * psz = buildAdjustedFilename( arg, getCmdTakeFile(), NULL);
		freeMemory(arg);
		arg = psz;
		}
	if (bPCPATRTiming_g)
		startCmdTiming();
	if (!bPCPATRSilent_g)
		fprintf(stderr, "Loading lexicon from %s\n", arg);
	if (loadPATRLexicon(arg, &sPCPATRData_g) != 0)
		pPCPATRLexiconFiles_g = mergeIntoStringListAtEnd(
						   pPCPATRLexiconFiles_g, arg);
	freeMemory(arg);
	for ( sp = filelist ; sp ; sp = sp->pNext )
		{
		arg = setCmdFilename( sp->pszString, NULL, ".lex");
		if (getCmdTakeLevel() != 0)
		{
		char * psz = buildAdjustedFilename( arg, getCmdTakeFile(),
							NULL);
		freeMemory(arg);
		arg = psz;
		}
		if (!bPCPATRSilent_g)
		fprintf(stderr, "Loading lexicon from %s\n", arg);
		if (loadPATRLexicon(arg, &sPCPATRData_g))
		pPCPATRLexiconFiles_g = mergeIntoStringListAtEnd(
						   pPCPATRLexiconFiles_g, arg);
		freeMemory(arg);
		}
	freeStringList( filelist );
	if (bPCPATRTiming_g)
		{
		stopCmdTiming();
		if (pPCPATRLexiconFiles_g != NULL && !sPCPATRData_g.bSilent)
		showCmdTiming();
		}
	break;

	case KW_ANALYSIS:		/* LOAD ANALYSIS [<filename> ...] */
	arg = (char *)tokenizeString(NULL, szWhitespace_g);
	if (wantCmdHelp(arg,
"LOAD ANALYSIS [<file> ...] (default name is ample.ana, default type is .ana)"
			 ))
		return;
	/*
	 *  free memory used by the existing lexicon
	 */
	freePATRLexicon(&sPCPATRData_g);
	if (pPCPATRLexiconFiles_g != NULL)
			{
		freeStringList(pPCPATRLexiconFiles_g);
		pPCPATRLexiconFiles_g = NULL;
		}
	if (pPCPATRAmpleFiles_g != NULL)
			{
		freeStringList(pPCPATRAmpleFiles_g);
		pPCPATRAmpleFiles_g = NULL;
		}
	filelist = NULL;
	if (arg != NULL)
		{
		while ((p = (char *)tokenizeString(NULL,
						   szWhitespace_g)) != NULL)
		filelist = mergeIntoStringListAtEnd(filelist, p);
		}
	arg = setCmdFilename( arg, "ample.ana", ".ana");
	if (getCmdTakeLevel() != 0)
		{
		char * psz = buildAdjustedFilename( arg, getCmdTakeFile(), NULL);
		freeMemory(arg);
		arg = psz;
		}
	if (bPCPATRTiming_g)
		startCmdTiming();
	if (!bPCPATRSilent_g)
		fprintf(stderr,
			"Loading AMPLE analysis file %s into internal lexicon\n",
			arg);
	if (loadPATRLexiconFromAmple(arg,
					 &sPCPATRTextControl_g, &sPCPATRData_g))
		pPCPATRAmpleFiles_g = mergeIntoStringListAtEnd(pPCPATRAmpleFiles_g,
							   arg);
	freeMemory(arg);
	for ( sp = filelist ; sp ; sp = sp->pNext )
		{
		arg = setCmdFilename( sp->pszString, NULL, ".ana");
		if (getCmdTakeLevel() != 0)
		{
		char * psz = buildAdjustedFilename( arg, getCmdTakeFile(),
							NULL);
		freeMemory(arg);
		arg = psz;
		}
		if (!bPCPATRSilent_g)
		fprintf(stderr,
			  "Loading AMPLE analysis file %s into internal lexicon\n",
			arg);
		if (loadPATRLexiconFromAmple(arg,
					 &sPCPATRTextControl_g,
					 &sPCPATRData_g))
		pPCPATRAmpleFiles_g = mergeIntoStringListAtEnd(
							 pPCPATRAmpleFiles_g, arg);
		freeMemory(arg);
		}
	freeStringList( filelist );
	if (bPCPATRTiming_g)
		{
		stopCmdTiming();
		if (pPCPATRAmpleFiles_g != NULL && !sPCPATRData_g.bSilent)
		showCmdTiming();
		}
	break;

	case KW_KIMMO:		/* LOAD KIMMO ... */
	do_load_kimmo();
	break;

	case KW_AMPLE:		/* LOAD AMPLE ... */
	do_load_ample();
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "LOAD", arg);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_set_kimmo
 * DESCRIPTION
 *    Finish parsing and execute a SET KIMMO command.
 * RETURN VALUE
 *    none
 */
static void do_set_kimmo()
{
char * arg;

arg = (char *)tokenizeString(NULL,szWhitespace_g);
switch (lookupCmdKeyword( arg, setkimmo_tab, n_setkimmo, ""))
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET KIMMO" );
	break;
	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET KIMMO", arg);
	break;
	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP SET KIMMO for more help\n");
	break;

	case KW_CHECK_CYCLES:	/* SET KIMMO CHECK-CYCLES {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET KIMMO CHECK-CYCLES");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET KIMMO CHECK-CYCLES", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:
		sPCPATRKimmoData_g.sPATR.bCheckCycles = TRUE;
		break;
		case KW_OFF:
		sPCPATRKimmoData_g.sPATR.bCheckCycles = FALSE;
		break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET KIMMO CHECK-CYCLES", arg);
		break;
		}
	break;

	case KW_PROMOTE:		/* SET KIMMO PROMOTE-DEFAULTS {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET KIMMO PROMOTE-DEFAULTS");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET KIMMO PROMOTE-DEFAULTS", arg );
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:
		sPCPATRKimmoData_g.sPATR.bPromoteDefAtoms = TRUE;
		break;
		case KW_OFF:
		sPCPATRKimmoData_g.sPATR.bPromoteDefAtoms = FALSE;
		break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET KIMMO PROMOTE-DEFAULTS", arg);
		break;
		}
	break;

	case KW_TOPDOWN_FILTER:	/* SET KIMMO TOP-DOWN-FILTER {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET KIMMO TOP-DOWN-FILTER");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET KIMMO TOP-DOWN-FILTER", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:
		sPCPATRKimmoData_g.sPATR.bTopDownFilter = TRUE;
		break;
		case KW_OFF:
		sPCPATRKimmoData_g.sPATR.bTopDownFilter = FALSE;
		break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET KIMMO TOP-DOWN-FILTER", arg);
		break;
		}
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET", arg);
	break;
	}
}


/*****************************************************************************
 * NAME
 *    do_set
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Finish parsing and execute a SET command.
 * RETURN VALUE
 *    none
 */
static void do_set()
{
register char *arg;

arg = (char *)tokenizeString(NULL,szWhitespace_g);
switch (lookupCmdKeyword( arg, set_tab, n_set, ""))
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET" );
	break;
	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET", arg);
	break;
	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP SET for more help\n");
	break;

	case KW_AMBIGUITIES:		/* SET AMBIGUITIES <NUMBER> */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	if ((arg == NULL) || (*arg == NUL))
		displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET AMBIGUITIES");
	else if (strchr(arg,'?'))
		fprintf(stderr,
	  "The maximum number of parses to display when the parse is ambiguous\n");
	else
		{
		sPCPATRData_g.iMaxAmbiguities = atoi(arg);
		if (sPCPATRData_g.iMaxAmbiguities <= 0)
		{
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET AMBIGUITIES", arg);
		sPCPATRData_g.iMaxAmbiguities = 1;
		}
		}
	break;

	case KW_AMPLE_DICTIONARY:	/* SET AMPLE-DICTIONARY {SPLIT|UNIFIED} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, aAmpleDictKeywords_m,
				   iAmpleDictKeywordNumber_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET AMPLE-DICTIONARY");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET AMPLE-DICTIONARY", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_UNIFIED:	bPCPATRUnifiedAmpleDictionary_g = TRUE;	 break;
		case KW_SPLIT:	bPCPATRUnifiedAmpleDictionary_g = FALSE; break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET AMPLE-DICTIONARY", arg);
		break;
		}
	break;

	case KW_COMMENT:		/* SET COMMENT <character> */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	if (arg == NULL)
		{
		displayNumberedMessage(&sCommentsDisabled_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET COMMENT");
		sPCPATRData_g.cComment            = NUL;
		}
	else
		{
		sPCPATRData_g.cComment            = *arg;
		}
	break;

	case KW_TRIM_FEATURES:		/* SET TRIM-EMPTY-FEATURES {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TRIM-EMPTY-FEATURES");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TRIM-EMPTY-FEATURES", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:
		sPCPATRData_g.iFeatureDisplay |= PATR_FEATURE_TRIM;
		break;
		case KW_OFF:
		sPCPATRData_g.iFeatureDisplay &= ~PATR_FEATURE_TRIM;
		break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TRIM-EMPTY-FEATURES", arg);
		break;
		}
	break;

	case KW_FAILURES:		/* SET FAILURES {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET FAILURES");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET FAILURES", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:		sPCPATRData_g.bFailure = TRUE;	break;
		case KW_OFF:	sPCPATRData_g.bFailure = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET FAILURES", arg);
		break;
		}
	break;

	case KW_FEATURES:		/* SET FEATURES {OFF|ON|TOP|ALL} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, feature_tab, n_feature, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET FEATURES");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET FEATURES", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:
		sPCPATRData_g.iFeatureDisplay |= PATR_FEATURE_ON;
		break;
		case KW_OFF:
		sPCPATRData_g.iFeatureDisplay &= ~PATR_FEATURE_ON;
		break;

		case KW_ALL:
		sPCPATRData_g.iFeatureDisplay |= PATR_FEATURE_ALL;
		break;
		case KW_TOP:
		sPCPATRData_g.iFeatureDisplay &= ~PATR_FEATURE_ALL;
		break;

		case KW_FLAT:
		sPCPATRData_g.iFeatureDisplay |= PATR_FEATURE_FLAT |
								   PATR_FEATURE_ON;
		break;
		case KW_FULL:
		sPCPATRData_g.iFeatureDisplay &= ~PATR_FEATURE_FLAT;
		sPCPATRData_g.iFeatureDisplay |=  PATR_FEATURE_ON;
		break;

		default:
		displayNumberedMessage(&sCmdBadArgument_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET FEATURES", arg);
		break;
		}
	break;

	case KW_GLOSS:		/* SET GLOSS {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET GLOSS");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET GLOSS", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:		sPCPATRData_g.bGloss = TRUE;	break;
		case KW_OFF:	sPCPATRData_g.bGloss = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET GLOSS", arg);
		break;
		}
	break;

	case KW_MARKER:	 /* SET MARKER {RECORD|WORD|CATEGORY|FEATURES} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, marker_tab, n_marker, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET MARKER");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET MARKER", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */
		break;

		case KW_RECORD:
		arg = (char *)tokenizeString(NULL,szWhitespace_g);
		if (arg == NULL)
			displayNumberedMessage(&sCmdMissingArgument_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET MARKER RECORD");
		else if (*arg == '?')
			{
			fprintf(stderr,
	  "The string that marks the beginning of a record in the lexicon.\n");
			fprintf(stderr, "The default is \\w\n");
			}
		else
			{
			if (sPCPATRData_g.pszRecordMarker !=
						   szPCPATRDefaultWordMarker_g)
			freeMemory((char *)sPCPATRData_g.pszRecordMarker);
			if (strcmp(arg, szPCPATRDefaultWordMarker_g) == 0)
			sPCPATRData_g.pszRecordMarker =
						   szPCPATRDefaultWordMarker_g;
			else
			sPCPATRData_g.pszRecordMarker = duplicateString(arg);
			}
		break;
		case KW_WORD:
		arg = (char *)tokenizeString(NULL,szWhitespace_g);
		if (arg == NULL)
			displayNumberedMessage(&sCmdMissingArgument_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET MARKER WORD");
		else if (*arg == '?')
			{
			fprintf(stderr,
		  "The string that marks a word entry in a lexicon record.\n");
			fprintf(stderr, "The default is \\w\n");
			}
		else
			{
			if (sPCPATRData_g.pszWordMarker !=
						   szPCPATRDefaultWordMarker_g)
			freeMemory((char *)sPCPATRData_g.pszWordMarker);
			if (strcmp(arg, szPCPATRDefaultWordMarker_g) == 0)
			sPCPATRData_g.pszWordMarker =
						   szPCPATRDefaultWordMarker_g;
			else
			sPCPATRData_g.pszWordMarker = duplicateString(arg);
			}
		break;
		case KW_CATEGORY:
		arg = (char *)tokenizeString(NULL,szWhitespace_g);
		if (arg == NULL)
			displayNumberedMessage(&sCmdMissingArgument_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET MARKER CATEGORY");
		else if (*arg == '?')
			{
			fprintf(stderr,
		  "The string that marks a category entry in a lexicon record.\n");
			fprintf(stderr, "The default is \\c\n");
			}
		else
			{
			if (sPCPATRData_g.pszCategoryMarker !=
						   szPCPATRDefaultCategoryMarker_g)
			freeMemory((char *)sPCPATRData_g.pszCategoryMarker);
			if (strcmp(arg, szPCPATRDefaultCategoryMarker_g) == 0)
			sPCPATRData_g.pszCategoryMarker =
						   szPCPATRDefaultCategoryMarker_g;
			else
			sPCPATRData_g.pszCategoryMarker = duplicateString(arg);
			}
		break;
		case KW_FEATURES:
		arg = (char *)tokenizeString(NULL,szWhitespace_g);
		if (arg == NULL)
			displayNumberedMessage(&sCmdMissingArgument_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET MARKER FEATURES");
		else if (*arg == '?')
			{
			fprintf(stderr,
		  "The string that marks a features entry in a lexicon record.\n");
			fprintf(stderr, "The default is \\f\n");
			}
		else
			{
			if (sPCPATRData_g.pszFeatureMarker !=
						szPCPATRDefaultFeatureMarker_g)
			freeMemory((char *)sPCPATRData_g.pszFeatureMarker);
			if (strcmp(arg, szPCPATRDefaultFeatureMarker_g) == 0)
			sPCPATRData_g.pszFeatureMarker =
						szPCPATRDefaultFeatureMarker_g;
			else
			sPCPATRData_g.pszFeatureMarker = duplicateString(arg);
			}
		break;
		case KW_GLOSS:
		arg = (char *)tokenizeString(NULL,szWhitespace_g);
		if (arg == NULL)
			displayNumberedMessage(&sCmdMissingArgument_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET MARKER GLOSS");
		else if (*arg == '?')
			{
			fprintf(stderr,
		 "The string that marks a gloss entry in a lexicon record.\n");
			fprintf(stderr, "The default is \\g\n");
			}
		else
			{
			if (sPCPATRData_g.pszGlossMarker !=
						  szPCPATRDefaultGlossMarker_g)
			freeMemory((char *)sPCPATRData_g.pszGlossMarker);
			if (strcmp(arg, szPCPATRDefaultGlossMarker_g) == 0)
			sPCPATRData_g.pszGlossMarker =
						  szPCPATRDefaultGlossMarker_g;
			else
			sPCPATRData_g.pszGlossMarker = duplicateString(arg);
			}
		break;
#ifndef hab130
		case KW_ROOTGLOSS:
		arg = (char *)tokenizeString(NULL,szWhitespace_g);
		if (arg == NULL)
			displayNumberedMessage(&sCmdMissingArgument_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET MARKER ROOTGLOSS");
		else if (*arg == '?')
			{
			fprintf(stderr,
		 "The string that marks a rootgloss entry in a lexicon record.\n");
			fprintf(stderr, "The default is \\r\n");
			}
		else
			{
			if (sPCPATRData_g.pszRootGlossMarker !=
						  szPCPATRDefaultRootGlossMarker_g)
			freeMemory((char *)sPCPATRData_g.pszRootGlossMarker);
			if (strcmp(arg, szPCPATRDefaultRootGlossMarker_g) == 0)
			sPCPATRData_g.pszRootGlossMarker =
						  szPCPATRDefaultRootGlossMarker_g;
			else
			sPCPATRData_g.pszRootGlossMarker = duplicateString(arg);
			}
		break;
#endif /* hab130 */

		default:
		displayNumberedMessage(&sCmdBadArgument_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET MARKER", arg);
		break;
		}
	break;

#ifndef hab130
	case KW_ROOTGLOSS_FEATURE:		/* SET ROOTGLOSS {ON|OFF|ALL|LEFTHEADED|RIGHTHEADED} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, rootgloss_tab, n_rootgloss, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET ROOTGLOSS");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET ROOTGLOSS", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ALL:
		  sPCPATRData_g.eRootGlossFeature = PATR_ROOT_GLOSS_USE_ALL;
		  break;
		case KW_LEFT:
		  sPCPATRData_g.eRootGlossFeature = PATR_ROOT_GLOSS_LEFT_HEADED;
		  break;
		case KW_OFF:
		  sPCPATRData_g.eRootGlossFeature = PATR_ROOT_GLOSS_NO_FEATURE;
		  break;
		case KW_ON:
		  sPCPATRData_g.eRootGlossFeature = PATR_ROOT_GLOSS_ON;
		  break;
		case KW_RIGHT:
		  sPCPATRData_g.eRootGlossFeature = PATR_ROOT_GLOSS_RIGHT_HEADED;
		  break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET ROOTGLOSS", arg);
		break;
		}
	break;
#endif /* hab130 */

	case KW_TIMING:		/* SET TIMING {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TIMING");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TIMING", arg );
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:		bPCPATRTiming_g = TRUE;		break;
		case KW_OFF:	bPCPATRTiming_g = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TIMING", arg);
		break;
		}
	break;

	case KW_TREE:		/* SET TREE {OFF|FLAT|FULL|INDENTED} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, tree_tab, n_tree, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TREE");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TREE", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_OFF:
		sPCPATRData_g.eTreeDisplay = PATR_NO_TREE;
		break;
		case KW_FLAT:
		sPCPATRData_g.eTreeDisplay = PATR_FLAT_TREE;
		break;
		case KW_ON:
		case KW_FULL:
		sPCPATRData_g.eTreeDisplay = PATR_FULL_TREE;
		break;
		case KW_INDENTED:
		sPCPATRData_g.eTreeDisplay = PATR_INDENTED_TREE;
		break;
		case KW_XML:
		sPCPATRData_g.eTreeDisplay = PATR_XML_TREE;
		break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TREE", arg);
		break;
		}
	break;

	case KW_UNIFICATION:		/* SET UNIFICATION {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET UNIFICATION");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET UNIFICATION", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:		sPCPATRData_g.bUnification = TRUE;	break;
		case KW_OFF:	sPCPATRData_g.bUnification = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET UNIFICATION", arg);
		break;
		}
	break;

	case KW_VERBOSE:		/* SET VERBOSE {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET VERBOSE");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET VERBOSE", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:		bPCPATRVerbose_g = TRUE;	break;
		case KW_OFF:	bPCPATRVerbose_g = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET VERBOSE", arg);
		break;
		}
	break;

	case KW_WARNING:		/* SET WARNINGS {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET WARNINGS");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET WARNINGS", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:		bCmdShowWarnings_g = TRUE;	break;
		case KW_OFF:	bCmdShowWarnings_g = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET WARNINGS", arg);
		break;
		}
	sPCPATRData_g.bShowWarnings            = bCmdShowWarnings_g;
	sPCPATRKimmoData_g.bShowWarnings       = bCmdShowWarnings_g;
	sPCPATRKimmoData_g.sPATR.bShowWarnings = bCmdShowWarnings_g;
	break;

	case KW_CHECK_CYCLES:		/* SET CHECK-CYCLES {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET CHECK-CYCLES");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET CHECK-CYCLES", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:
		sPCPATRData_g.bCheckCycles = TRUE;
		break;
		case KW_OFF:
		sPCPATRData_g.bCheckCycles = FALSE;
		break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET CHECK-CYCLES", arg);
		break;
		}
	break;

	case KW_TOPDOWN_FILTER:		/* SET TOP-DOWN-FILTER {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TOP-DOWN-FILTER");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TOP-DOWN-FILTER", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:
		sPCPATRData_g.bTopDownFilter = TRUE;
		break;
		case KW_OFF:
		sPCPATRData_g.bTopDownFilter = FALSE;
		break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TOP-DOWN-FILTER", arg);
		break;
		}
	break;

	case KW_WRITE_AMPLE_PARSES:		/* SET WRITE-AMPLE-PARSES {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET WRITE-AMPLE-PARSES");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET WRITE-AMPLE-PARSES", arg);
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:		bPCPATRWriteAmpleParses_g = TRUE;	break;
		case KW_OFF:	bPCPATRWriteAmpleParses_g = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET WRITE-AMPLE-PARSES", arg);
		break;
		}
	break;

	case KW_KIMMO:			/* SET KIMMO ... */
	do_set_kimmo();
	break;

	case KW_LIMIT:			/* SET LIMIT <number> */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	if ((arg == NULL) || (*arg == NUL))
		{
		displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET LIMIT");
		}
	else if (strchr(arg,'?'))
		{
		fprintf(stderr,
			"The maximum number of seconds to allow for a parse\n");
		}
	else
		{
		char * p;
		sPCPATRData_g.iMaxProcTime = strtoul(arg, &p, 10);
		if (p == arg)
		{
		displayNumberedMessage(&sCmdBadKeyword_g, bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g, NULL,
					   0, "SET LIMIT", arg);
		sPCPATRData_g.iMaxProcTime = 0;
		}
		}
	break;

	case KW_PROMOTE:		/* SET PROMOTE-DEFAULTS {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET PROMOTE-DEFAULTS");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET PROMOTE-DEFAULTS", arg );
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:		sPCPATRData_g.bPromoteDefAtoms = TRUE;	break;
		case KW_OFF:	sPCPATRData_g.bPromoteDefAtoms = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET PROMOTE-DEFAULTS", arg);
		break;
		}
	break;

	case KW_FINAL_PUNC:			/* SET SENTENCE-FINAL-PUNCTUATION */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	if ((arg == NULL) || (*arg == NUL))
		{
		displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET SENTENCE-FINAL-PUNCTUATION");
		}
	else if (strchr(arg,'?'))
		{
		fprintf(stderr,
			"The set of characters that terminate a sentence\n");
		}
	else
		{
		clearPATRSentenceFinalPunctuation(&sPCPATRData_g);
		do
		{
		addPATRSentenceFinalPunctuation(&sPCPATRData_g, arg);
		arg = (char *)tokenizeString(NULL,szWhitespace_g);
		} while (arg != NULL);
		}
	break;

	case KW_PROPERTY_FEATURE:		/* SET PROPERTY-IS-FEATURE {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	switch (lookupCmdKeyword( arg, onoff_tab, n_onoff, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET PROPERTY-IS-FEATURE");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET PROPERTY-IS-FEATURE", arg );
		break;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:		sPCPATRData_g.bPropIsFeature = TRUE;	break;
		case KW_OFF:	sPCPATRData_g.bPropIsFeature = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET PROPERTY-IS-FEATURE", arg);
		break;
		}
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET", arg);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_save
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Finish parsing and execute a SAVE command.
 * RETURN VALUE
 *    none
 */
static void do_save()
{
register char *arg;

arg = (char *)tokenizeString(NULL,szWhitespace_g);
switch (lookupCmdKeyword( arg, save_tab, n_save, ""))
	{
	case CMD_NULL:			/* empty */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SAVE");
	break;
	case CMD_AMBIGUOUS:			/* ambiguous */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SAVE", arg);
	break;
	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP SAVE for more help\n");
	break;

	case KW_LEXICON:		/* SAVE LEXICON */
	do_save_lexicon( (char *)tokenizeString(NULL,szWhitespace_g) );
	break;

	case KW_STATUS:		/* SAVE STATUS */
	do_save_status( (char *)tokenizeString(NULL,szWhitespace_g) );
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SAVE", arg);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_show
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Finish parsing and execute a SHOW command.
 * RETURN VALUE
 *    none
 */
static void do_show()
{
register char *arg;

arg = (char *)tokenizeString(NULL,szWhitespace_g);
switch (lookupCmdKeyword( arg, show_tab, n_show, ""))
	{
	case CMD_NULL:			/* empty */
	show_status();			/* SHOW == SHOW STATUS == STATUS */
	break;

	case CMD_AMBIGUOUS:			/* ambiguous */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SHOW", arg);
	break;

	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP SHOW for more help\n");
	break;

	case KW_LEXICON:		/* SHOW LEXICON */
	showPATRLexicon(&sPCPATRData_g);
	break;

	case KW_STATUS:		/* SHOW STATUS */
	show_status();
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SHOW", arg);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_hlp_file
 * ARGUMENTS
 *    key - next keyword for HELP FILE command
 * DESCRIPTION
 *    Display information for the HELP FILE command
 * RETURN VALUE
 *    none
 */
static void do_hlp_file(key)
unsigned char *key;
{
switch (lookupCmdKeyword( (char*)key, file_tab, n_file, ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
FILE DISAMBIGUATE <anafile> [<outfile>]\n\
			read sentences from an AMPLE analysis file and try to parse them\n\
FILE PARSE <infile> [<outfile>]\n\
			read sentences from a file, one per line, and try to parse them\n\
\n\
Type HELP FILE DISAMBIGUATE or HELP FILE PARSE for more information.\n\
", stderr);
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP FILE", key);
	break;

	case CMD_HELP:			/* ? */
	fputs("\
HELP FILE without an argument displays a list of the FILE commands\n", stderr);
	break;

	case KW_DISAMBIGUATE:	/* FILE DISAMBIGUATE <anafile> [<outfile>] */
	fputs("\
FILE DISAMBIGUATE <anafile> [<outfile>] reads sentences from the specified\n\
AMPLE analysis file and writes the corresponding parse trees and feature\n\
structures to the optionally specified output file.  If the output file is\n\
written, ambiguous word parses are eliminated as much as possible as a\n\
result of the sentence parsing.  When finished, a statistical report of\n\
successful (sentence) parses is displayed on the screen.\n\
", stderr);
	break;

	case KW_PARSE:		/* FILE PARSE <infile> [<outfile>] */
	fputs("\
FILE PARSE <infile> [<outfile>] reads sentences from the specified input\n\
file and writes the corresponding parse trees and feature structures to the\n\
optionally specified output file.\n\
\n\
This command behaves the same as PARSE except that input comes from a file\n\
rather than the keyboard, and output goes to a file (optionally) rather than\n\
the screen.  When finished, a statistical report of successful parses is\n\
displayed on the screen.\n\
", stderr);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP FILE", key);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_hlp_status
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Display information for the HELP STATUS command.
 * RETURN VALUE
 *    none
 */
static void do_hlp_status()
{
fputs("\n\
STATUS displays the names of the current grammar, sentences, and log files,\n\
and the values of the switches established by the SET command.\n\
\n\
SHOW STATUS, or SHOW (by itself), are synonyms for STATUS.\n\
\n", stderr);
}

#ifdef HAS_SUBPROCESS
/*****************************************************************************
 * NAME
 *    do_hlp_system
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Display information for the HELP SYSTEM command.
 * RETURN VALUE
 *    none
 */
static void do_hlp_system()
{
fputs("\
SYSTEM [<command>] allows the user to execute an operating system command\n\
(such as listing the files in the current directory) from within PC-PATR.\n\
If no system-level command is given on the line with the SYSTEM command,\n\
then PC-PATR is pushed into the background and a new system command processor\n\
(shell) is started.  Control is usually returned to PC-PATR in this case by\n\
typing EXIT as the operating system command.\n\
\n\
! (exclamation point) is a synonym for SYSTEM.\n\
", stderr);
}
#endif /*HAS_SUBPROCESS*/

/*****************************************************************************
 * NAME
 *    do_hlp_load_ample
 * ARGUMENTS
 *    key - next keyword for HELP LOAD AMPLE command
 * DESCRIPTION
 *    Display information for the HELP LOAD AMPLE command.
 * RETURN VALUE
 *    none
 */
static void do_hlp_load_ample(key)
unsigned char *key;
{
switch (lookupCmdKeyword( (char*)key, loadample_tab, n_loadample, ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
LOAD AMPLE CONTROL ...          load the AMPLE control files\n\
LOAD AMPLE DICTIONARY ...       load the AMPLE dictionary files\n\
LOAD AMPLE TEXT-CONTROL <file>  load an AMPLE text input control file\n\
", stderr); fputs("\
\n\
L AM is a sufficient synonym for LOAD AMPLE.\n\
\n\
Type HELP LOAD AMPLE CONTROL, HELP LOAD AMPLE DICTIONARY, or\n\
HELP LOAD AMPLE TEXT-CONTROL for more information.\n\
", stderr);
	break;
	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP LOAD AMPLE", key);
	break;
	case CMD_HELP:			/* ? */
	fputs("\
HELP LOAD AMPLE without an argument displays a list of the LOAD AMPLE commands\
\n", stderr);
	break;

	case KW_CONTROL:			/* LOAD AMPLE CONTROL ... */
	fputs("\
LOAD AMPLE CONTROL xxAD01.CTL xxANCD.TAB [xxORDC.TAB] erases any existing\n\
AMPLE information (including dictionaries) and reads control information\n\
from the specified files.  This erases any stored PC-Kimmo information.\n\
\n", stderr);
	fputs("\
At least two and possibly three files are loaded by this command.  The\n\
first file is the AMPLE \"analysis data\" file.  It has a default filetype\n\
extension of \".ctl\" but no default filename.  The second file is the\n\
AMPLE dictionary code table file.  It has a default filetype extension of\n\
\".tab\" but no default filename.  The third file is an optional dictionary\n\
orthography change table.  It has a default filetype extension of \".tab\"\n\
and no default filename.\n\
\n", stderr);
	fputs("\
L AM C ... is a synonym for LOAD AMPLE CONTROL ...\n\
", stderr);
	break;

	case KW_DICTIONARY:			/* LOAD AMPLE DICTIONARY ... */
	fputs("\
LOAD AMPLE DICTIONARY [prefix.dic] [infix.dic] [suffix.dic] root01.dic ...\n\
LOAD AMPLE DICTIONARY file01.dic [file02.dic] [file03.dic] ...\n\
erases any existing AMPLE dictionary information and reads the specified\n\
files.  This command erases any stored PC-Kimmo information.\n\
", stderr); fputs("\n\
The first form of the command is for SET AMPLE-DICTIONARY SPLIT, with the\n\
dictionary files split according to morpheme type.  The different types of\n\
files must be loaded in the order shown, with unneeded affix dictionaries\n\
omitted.\n\
", stderr); fputs("\n\
The second form of the command is for SET AMPLE-DICTIONARY UNIFIED, with any\n\
dictionary file possibly containing any type of morpheme.\n\
", stderr); fputs("\n\
The AMPLE dictionary files have a default filetype extension of \".dic\" but\n\
no default filename.\n\
\n\
L AM D ... is a synonym for LOAD AMPLE DICTIONARY ...\n\
", stderr);
	break;

	case KW_TEXT_CONTROL:		/* LOAD AMPLE TEXT-CONTROL ... */
	fputs("\
LOAD AMPLE TEXT-CONTROL xxINTX.CTL erases any existing AMPLE text input\n\
control information and reads the specified file.  This also erases any\n\
stored PC-Kimmo information.\n\
\n", stderr);
	fputs("\
The text input control file has a default filetype extension of \".ctl\" but\n\
no default filename.\n\
\n\
L AM T <file> is a synonym for LOAD AMPLE TEXT-CONTROL <file>.\n\
", stderr);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP LOAD AMPLE", key);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_hlp_load_kimmo
 * ARGUMENTS
 *    key - next keyword for HELP LOAD KIMMO command
 * DESCRIPTION
 *    Display information for the HELP LOAD KIMMO command.
 * RETURN VALUE
 *    none
 */
static void do_hlp_load_kimmo(key)
unsigned char *key;
{
switch (lookupCmdKeyword( (char*)key, loadkimmo_tab, n_loadkimmo, ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
LOAD KIMMO RULES <file>    load a PC-Kimmo rules file\n\
LOAD KIMMO LEXICON <file>  load a PC-Kimmo lexicon file\n\
LOAD KIMMO GRAMMAR <file>  load a PC-Kimmo grammar file\n\
", stderr); fputs("\
\n\
L K is a sufficient synonym for LOAD KIMMO.\n\
\n\
Type HELP LOAD KIMMO RULES, HELP LOAD KIMMO LEXICON, or\n\
HELP LOAD KIMMO GRAMMAR for more information\n\
", stderr);
	break;
	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP LOAD KIMMO", key);
	break;
	case CMD_HELP:			/* ? */
	fputs("\
HELP LOAD KIMMO without an argument displays a list of the LOAD KIMMO commands\
\n", stderr);
	break;

	case KW_RULES:			/* LOAD KIMMO RULES ... */
	fputs("\
LOAD KIMMO RULES [<file>] erases any existing PC-Kimmo rules and reads a\n\
new set of rules from the specified file.  This also erases any stored\n\
AMPLE information.\n\
\n\
The default filetype extension for LOAD KIMMO RULES is \".rul\", and the\n\
default filename is \"rules.rul\" (without quotation marks, of course).\n\
\n\
L K R [<file>] is a synonym for LOAD KIMMO RULES [<file>].\n\
", stderr);
	break;

	case KW_LEXICON:			/* LOAD KIMMO LEXICON ... */
	fputs("\
LOAD KIMMO LEXICON [<file>] erases any existing PC-Kimmo lexicon information\n\
and reads a new morpheme lexicon from the specified file.  A PC-Kimmo rules\n\
file must be loaded before a PC-Kimmo lexicon file can be loaded.\n\
\n\
The default filetype extension for LOAD KIMMO LEXICON is \".lex\", and the\n\
default filename is \"lexicon.lex\" (without quotation marks, of course).\n\
\n\
L K L [<file>] is a synonym for LOAD KIMMO LEXICON [<file>].\n\
", stderr);
	break;

	case KW_GRAMMAR:			/* LOAD KIMMO GRAMMAR ... */
	fputs("\
LOAD KIMMO GRAMMAR [<file>] erases any existing PC-Kimmo word grammar and\n\
reads a new word grammar from the specified file.\n\
\n\
The default filetype extension for LOAD KIMMO GRAMMAR is \".grm\", and the\n\
default filename is \"grammar.grm\" (without quotation marks, of course).\n\
\n\
L K G [<file>] is a synonym for LOAD KIMMO GRAMMAR [<file>].\n\
", stderr);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP LOAD KIMMO", key);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_hlp_load
 * ARGUMENTS
 *    key - next keyword for HELP LOAD command
 * DESCRIPTION
 *    Display information for the HELP LOAD command.
 * RETURN VALUE
 *    none
 */
static void do_hlp_load(key)
unsigned char *key;
{
switch (lookupCmdKeyword( (char*)key, load_tab, n_load, ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
LOAD ANALYSIS <files> load AMPLE analysis file(s) into the internal lexicon\n\
LOAD GRAMMAR <file>   load a grammar file\n\
LOAD LEXICON <files>  load one or more lexicon files\n\
\n\
LOAD AMPLE ...        load information for the AMPLE morphological parser\n\
LOAD KIMMO ...        load information for the PC-Kimmo morphological parser\n\
", stderr); fputs("\
\n\
L is a sufficient synonym for LOAD.\n\
\n\
Type HELP LOAD ANALYSIS, HELP LOAD GRAMMAR, HELP LOAD LEXICON, HELP LOAD\n\
AMPLE, or HELP LOAD KIMMO for more information.\n\
", stderr);
	break;
	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP LOAD", key);
	break;
	case CMD_HELP:			/* ? */
	fputs("\
HELP LOAD without an argument displays a list of the LOAD commands\n", stderr);
	break;

	case KW_GRAMMAR:			/* LOAD GRAMMAR <grammarname> */
	fputs("\
LOAD GRAMMAR <file> erases any existing grammar and reads a new\n\
grammar from the specified file.\n\
\n\
The default filetype extension for LOAD GRAMMAR is \".grm\", and the\n\
default filename is \"grammar.grm\" (without the quotation marks).\n\
\n\
L G <file> is a synonym for LOAD GRAMMAR <file>.\n\
", stderr);
	break;

	case KW_LEXICON:			/* LOAD LEXICON <lexiconname> */
	fputs("\
LOAD LEXICON <file> erases any existing lexicon and reads a new\n\
lexicon from the specified file(s).  Note that more than one file\n\
may be loaded with the single LOAD LEXICON command.\n\
\n\
The default filetype extension for LOAD LEXICON is \".lex\", and the\n\
default filename is \"lexicon.lex\" (without the quotation marks).\n\
\n\
L L <file> is a synonym for LOAD LEXICON <file>.\n\
", stderr);
	break;

	case KW_ANALYSIS:			/* LOAD ANALYSIS <lexiconname> */
	fputs("\
LOAD ANALYSIS <file> erases any existing lexicon and reads a new lexicon\n\
from the specified AMPLE analysis file(s).  Note that more than one file\n\
may be loaded with the single LOAD ANALYSIS command: duplicate entries are\n\
not stored in the lexicon.\n\
\n\
The default filetype extension for LOAD ANALYSIS is \".ana\", and the\n\
default filename is \"ample.ana\" (without the quotation marks).\n\
\n\
L A <file> is a synonym for LOAD ANALYSIS <file>.\n\
", stderr);
	break;

	case KW_AMPLE:			/* LOAD AMPLE ... */
	do_hlp_load_ample(tokenizeString(NULL,szWhitespace_g));
	break;

	case KW_KIMMO:			/* LOAD KIMMO ... */
	do_hlp_load_kimmo(tokenizeString(NULL,szWhitespace_g));
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP LOAD", key);
	break;
	}
}

static void do_hlp_set_kimmo(key)
unsigned char * key;
{
switch (lookupCmdKeyword( (char*)key, setkimmo_tab, n_setkimmo, ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
SET KIMMO CHECK-CYCLES {ON|OFF}     - controls parse chart cycle checking\n\
SET KIMMO PROMOTE-DEFAULTS {ON|OFF} - controls promotion of default atoms\n\
SET KIMMO TOP-DOWN-FILTER {ON|OFF}  - controls top-down category filtering\n\
\n\
Type HELP SET KIMMO <keyword> for more information on a specific SET KIMMO\n\
command.\n\
", stderr);
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP SET", key);
	break;

	case CMD_HELP:			/* ? */
	fputs("\
HELP SET without an argument displays a list of the SET commands\n", stderr);
	break;

	case KW_CHECK_CYCLES:
	fputs("\
SET KIMMO CHECK-CYCLES ON enables a check against introducing cycles into\n\
the parse chart while parsing words with the embedded PC-Kimmo morphological\n\
parser.  SET KIMMO CHECK-CYCLES OFF disables this check, speeding up word\n\
parses when no cycles are introduced, but making the word parser more\n\
vulnerable to hanging on perverse grammars.  The default is ON.\n\
", stderr);
	break;

	case KW_PROMOTE:
	fputs("\
SET KIMMO PROMOTE-DEFAULTS ON causes all default atomic values found in\n\
feature structures loaded from the morpheme lexicon to be promoted to\n\
normal atomic values before words are parsed by the embedded PC-Kimmo\n\
morphological parser.  SET KIMMO PROMOTE-DEFAULTS OFF prevents this from\n\
happening, allowing the morphological parse to work with default atomic\n\
values.  The default value is ON.\n\
", stderr);
	break;

	case KW_TOPDOWN_FILTER:
	fputs("\
SET KIMMO TOP-DOWN-FILTER ON enables simple top-down filtering based on\n\
the morpheme categories while parsing words with the embedded PC-Kimmo\n\
morphological parser.  SET KIMMO TOP-DOWN-FILTER OFF disables this\n\
filtering, slowing down word parsing but possibly finding more solutions.\n\
The default is ON.\n\
\n\
This should not be required in the final version of PC-PATR.\n\
", stderr);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP SET", key);
	break;
	}
}


/*****************************************************************************
 * NAME
 *    do_hlp_set
 * ARGUMENTS
 *    key - next keyword for HELP SET command
 * DESCRIPTION
 *    Display information for the HELP SET command.
 * RETURN VALUE
 *    none
 */
static void do_hlp_set(key)
unsigned char *key;
{
switch (lookupCmdKeyword( (char*)key, set_tab, n_set, ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
SET AMBIGUITIES <number>       sets ambiguities limit to <number>\n\
SET AMPLE-DICTIONARY {SPLIT|UNIFIED} sets the AMPLE dictionary style\n\
SET CHECK-CYCLES {ON|OFF}      turns parse chart cycle checking ON or OFF\n\
SET COMMENT <character>        sets the comment character to <character>\n\
", stderr); fputs("\
SET FAILURES {ON|OFF}          turns grammar failure mode ON or OFF\n\
SET FEATURES {TOP|ALL|OFF}     sets the parse feature display mode\n\
SET FEATURES {FLAT|FULL}       sets the parse feature display style\n\
SET GLOSS {ON|OFF}             turns gloss display mode ON or OFF\n\
SET KIMMO ...                  set values for embedded PC-Kimmo word parser\n\
", stderr); fputs("\
SET LIMIT <number>             sets the maximum time in seconds for a parse\n\
SET MARKER {FEATURE|PART|RECORD|WORD} sets the field markers for the lexicon\n\
SET PROMOTE-DEFAULTS {ON|OFF}  promote default atoms to atoms before parsing\n\
SET TIMING {ON|OFF}            turns timing mode ON or OFF\n\
SET TOP-DOWN-FILTER {ON|OFF}   turns top-down category filtering ON or OFF\n\
", stderr); fputs("\
SET TREE {FLAT|FULL|INDENTED|XML|OFF} sets the parse tree display style\n\
SET TRIM-EMPTY-FEATURES {ON|OFF} turns trimming of empty features ON or OFF\n\
SET UNIFICATION {ON|OFF}       turns unification ON or OFF\n\
SET VERBOSE {ON|OFF}           turns verbose comparison mode ON or OFF\n\
", stderr); fputs("\
SET WARNINGS {ON|OFF}          turns warning mode ON or OFF\n\
SET WRITE-AMPLE-PARSES {ON|OFF} controls FILE DISAMBIGUATE ANA file output\n\
\n\
Type HELP SET <keyword> for more information on a specific SET command.\n\
", stderr);
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP SET", key);
	break;

	case CMD_HELP:			/* ? */
	fputs("\
HELP SET without an argument displays a list of the SET commands\n", stderr);
	break;

	case KW_AMBIGUITIES:		/* SET AMBIGUITIES <number> */
	fputs("\
SET AMBIGUITIES <number> limits the number of analyses displayed to\n\
<number>.  The default is 10.\n\
", stderr);
	break;

	case KW_AMPLE_DICTIONARY:	/* SET AMPLE-DICTIONARY {SPLIT|UNIFIED} */
	fputs("\
SET AMPLE-DICTIONARY SPLIT declares that the AMPLE dictionaries are split\n\
into a prefix dictionary file, an infix dictionary file, a suffix dictionary\n\
file, and one or more root dictionary files.  The existence of the three\n\
affix dictionaries depends on settings in the AMPLE analysis data file.  If\n\
they exist, the LOAD AMPLE DICTIONARY command requires that they be given in\n\
relative order shown above: prefix, infix, suffix, root(s).\n\
", stderr); fputs("\n\
SET AMPLE-DICTIONARY UNIFIED declares that any of the AMPLE dictionaries\n\
may contain any type of morpheme: prefix, infix, suffix, or root.  This\n\
implies that each dictionary entry may contain a field specifying the type\n\
of morpheme (the default is \"root\"), and that the dictionary codes table\n\
file contains a \"\\unified\" field.\n\
", stderr); fputs("\n\
The default setting for AMPLE-DICTIONARY is SPLIT.\n\
", stderr);
	break;

	case KW_COMMENT:		/* SET COMMENT <character> */
	fputs("\
SET COMMENT <character> sets the comment character to the indicated value.\n\
If <character> is missing (or equal to the current comment character),\n\
then comment handling is disabled.  The default comment character is ';'\n\
(the semicolon).\n\
", stderr);
	break;

	case KW_TRIM_FEATURES:		/* SET TRIM-EMPTY-FEATURES <number> */
	fputs("\
SET TRIM-EMPTY-FEATURES ON disables the display of empty feature values\n\
when displaying features (set HELP SET FEATURES).  This is the default.\n\
\n\
SET TRIM-EMPTY-FEATURES OFF enables the display of features with empty\n\
values.\n\
", stderr);
	break;

	case KW_FAILURES:		/* SET FAILURES {ON|OFF} */
	fputs("\
SET FAILURES ON turns on grammar failure mode, and SET FAILURES OFF\n\
turns it off.  When grammar failure mode is on, the partial results of\n\
forms that fail the grammar module are displayed.  A form may fail the\n\
grammar either by failing the feature constraints or by failing the\n\
phrase structure rules. In the latter case, a partial tree (bush) will\n\
be returned.  The default is OFF.\n\
", stderr);
	break;

	case KW_FEATURES:		/* SET FEATURES {ON|OFF|TOP|ALL} */
	fputs("\
SET FEATURES TOP causes the feature structure for the top node of the parse\n\
tree to be displayed.  This is the default setting.\n\
\n\
SET FEATURES ALL causes the feature structures for all nodes of the parse\n\
tree to be displayed.\n\
\n\
", stderr);  fputs("\
SET FEATURES FULL causes features to be displayed in an indented format\n\
that makes obvious the embedded structure of each feature.  This is the\n\
default style.\n\
\n\
SET FEATURES FLAT causes features to be displayed in a flat, linear\n\
string that uses less space on the screen.\n\
", stderr);  fputs("\
\n\
SET FEATURES OFF prevents the display of any feature structures.\n\
SET FEATURES ON enables the display of feature structures.  Neither\n\
of these two commands affects any of the other settings.\n\
\n\
", stderr);
	break;

	case KW_GLOSS:		/* SET GLOSS {ON|OFF} */
	fputs("\
SET GLOSS ON turns on the display of glosses in the parse tree output, and\n\
SET GLOSS OFF turns it off.  If any glosses exist in the lexicon file, then\n\
GLOSS is automatically turned ON when the lexicon is loaded.  If no glosses\n\
exist in the lexicon, then this flag is ignored.\n\
", stderr);
	break;

	case KW_KIMMO:
	do_hlp_set_kimmo(key);
	break;

	case KW_MARKER:	 /* SET MARKER {RECORD|WORD|CATEGORY|FEATURES} */
	fputs("\
SET MARKER RECORD <marker> establishes the field marker that begins a new\n\
record in the lexicon file.  This may or may not be the same as the WORD\n\
marker.  The default is \"\\w\" (without the quotation marks).\n\
", stderr); fputs("\n\
SET MARKER WORD <marker> establishes the marker for the word field.  The\n\
default is \"\\w\" (without the quotation marks).\n\
", stderr); fputs("\n\
SET MARKER CATEGORY <marker> establishes the marker for the field containing\n\
the category (part of speech) feature.  The default is \"\\c\" (without the\n\
quotation marks).\n\
", stderr); fputs("\n\
SET MARKER FEATURES <marker> establishes the marker for the field containing\n\
other features.  (This field is not needed for many words.)  The default is\n\
\"\\f\" (without the quotation marks).\n\
", stderr); fputs("\n\
SET MARKER GLOSS <marker> establishes the marker for the field containing\n\
the word gloss feature.  The default is \"\\g\" (without the quotation marks).\n\
", stderr);
	break;

	case KW_TIMING:		/* SET TIMING {ON|OFF} */
	fputs("\
SET TIMING ON turns on timing mode, and SET TIMING OFF turns it off.\n\
If timing mode is ON, then the elapsed time required to process a\n\
command is displayed when the command finishes.  If timing mode is\n\
OFF, then the elapsed time is not shown.  The default is OFF.\n\
", stderr);
	break;

	case KW_TREE:		/* SET TREE {FLAT|FULL|INDENTED|OFF} */
	fputs("\
SET TREE FULL turns on the parse tree display, displaying the result of the\n\
parse as a full tree.  (SET TREE ON is the same as SET TREE FULL.)\n\
\n\
SET TREE FLAT turns on the parse tree display, displaying the result of the\n\
parse as a flat tree structure in the form of a bracketed string.\n\
\n\
SET TREE INDENTED turns on the parse tree display, displaying the result of\n\
the parse in an indented format sometimes called a \"northwest tree\".\n\
", stderr); fputs("\
\n\
SET TREE XML turns on the parse tree display, displaying the result of the\n\
parse in an XML format, each node containing the feature structure\n\
associated with that node of the parse tree.  (This command causes SET\n\
FEATURE FLAT and SET FEATURE FULL to be ignored.)\n\
", stderr); fputs("\
\n\
SET TREE OFF turns off tree display mode, displaying nothing for the parse\n\
tree.\n\
", stderr);
	break;

	case KW_UNIFICATION:		/* SET UNIFICATION {ON|OFF} */
	fputs("\
SET UNIFICATION OFF turns off feature unification in the grammar.  Only\n\
the constituent structure rules are used; the feature contraints are\n\
ignored.  SET UNIFICATION ON turns on unification mode.  The default is ON.\n\
", stderr);
	break;

	case KW_VERBOSE:		/* SET VERBOSE {ON|OFF} */
	fputs("\
SET VERBOSE ON turns on verbose mode, and SET VERBOSE OFF turns it off.\n\
If verbose mode is ON, then parse trees and features are displayed on\n\
the screen during the FILE PARSE command.  The default is OFF.\n\
", stderr);
	break;

	case KW_WARNING:		/* SET WARNING {ON|OFF} */
	fputs("\
SET WARNINGS ON turns on warning mode.  SET WARNINGS OFF turns off\n\
warning mode. If warning mode is ON, then warning messages are\n\
displayed on the output. If warning mode is OFF, then no warning\n\
messages are displayed.  The default is ON.\n\
", stderr);
	break;

	case KW_CHECK_CYCLES:		/* SET CHECK-CYCLES {ON|OFF} */
	fputs("\
SET CHECK-CYCLES ON enables a check against introducing cycles into\n\
the parse chart.  SET CHECK-CYCLES OFF disables this check, speeding\n\
up the parse when no cycles are introduced, but making the parser\n\
more vulnerable to hanging on perverse grammars.  The default is ON.\n\
", stderr);
	break;

	case KW_TOPDOWN_FILTER:		/* SET TOP-DOWN-FILTER {ON|OFF} */
	fputs("\
SET TOP-DOWN-FILTER ON enables simple top-down filtering based on the\n\
categories.  SET TOP-DOWN-FILTER OFF disables this filtering, slowing\n\
down the parse but possibly finding more solutions.  The default is ON.\n\
\n\
This should not be required in the final version of PC-PATR.\n\
", stderr);
	break;

	case KW_WRITE_AMPLE_PARSES:		/* SET WRITE-AMPLE-PARSES {ON|OFF} */
	fputs("\
SET WRITE-AMPLE-PARSES ON enables writing a \\parse field containing the\n\
sentence parses and feature structures at the end of each sentence in the\n\
disambiguated analysis file.\n\
\n\
SET WRITE-AMPLE-PARSES OFF disables writing the \\parse fields to the\n\
disambiguated analysis file.  This is the default.\n\
", stderr);
	break;

	case KW_LIMIT:			/* SET LIMIT <number> */
	fputs("\
SET LIMIT <number> limits the time taken by a single parse command to no\n\
more than <number> seconds.\n\
SET LIMIT 0 disables limit checking.  This is the default.\n\
", stderr);
	break;

	case KW_PROMOTE:			/* SET PROMOTE-DEFAULTS {ON|OFF} */
	fputs("\
SET PROMOTE-DEFAULTS ON causes all default atomic values found in feature\n\
structures loaded from the lexicon to be promoted to normal atomic values\n\
before parsing is started.  SET PROMOTE-DEFAULTS OFF prevents this from\n\
happening, allowing the parse to work with default atomic values.  The\n\
default value is ON.\n\
", stderr);
	break;

	case KW_FINAL_PUNC:
	fputs("\
SET SENTENCE-FINAL-PUNCTUATION defines the set of punctuation characters\n\
that terminate a sentence in an AMPLE analysis file.  The individual\n\
punctuation characters must be separated by spaces.  This allows digraphs\n\
or trigraphs to be used with the constituent elements causing a false end\n\
of sentence.\n\
\n\
The default sentence final punctuation characters are . ? ! : ;\n\
\n\
Note that ? cannot be the first sentence final punctuation character in the\n\
set, but the digraph ?? can be.\n\
", stderr);
	break;

	case KW_PROPERTY_FEATURE:		/* SET PROPERTY-IS-FEATURE {ON|OFF} */
	fputs("\
SET PROPERTY-IS-FEATURE ON causes the values in the AMPLE analysis \\p\n\
(property) field to be interpreted as feature template names, the same\n\
as the values in the AMPLE analysis \\fd (feature descriptor) field.\n\
SET PROPERTY-IS-FEATURE OFF restricts the interpretation of feature\n\
template names to the AMPLE analysis \\fd field.  The default value is\n\
OFF.\n\
", stderr);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP SET", key);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_hlp_show
 * ARGUMENTS
 *    key - next keyword for HELP SHOW command
 * DESCRIPTION
 *    Display information for the HELP SHOW command.
 * RETURN VALUE
 *    none
 */
static void do_hlp_show(key)
unsigned char *key;
{
switch (lookupCmdKeyword( (char*)key, show_tab, n_show, ""))
	{
	case CMD_NULL:			/* empty */
	fputs("\
SHOW LEXICON    prints the contents of the lexicon stored in memory\n\
\n\
SHOW STATUS     is a synonym for STATUS\n\
\n\
SHOW            without any argument is also a synonym for STATUS\n\
\n\
Type HELP [SHOW] STATUS for more information.\n\
", stderr);
	break;

	case CMD_AMBIGUOUS:			/* ambiguous */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP SHOW", key);
	break;

	case CMD_HELP:			/* ? */
	fputs("\
HELP SHOW without an argument displays a list of the SHOW commands\n", stderr);
	break;

	case KW_STATUS:		/* SHOW STATUS */
	do_hlp_status();
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP SHOW", key);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_help
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Finish parsing and execute a HELP command.
 * RETURN VALUE
 *    none
 */
static void do_help()
{
char *arg;

arg = (char *)tokenizeString(NULL,szWhitespace_g);
switch (lookupCmdKeyword( arg, cmd_tab, n_cmd, ""))
	{
	case CMD_NULL:		/* barebones HELP command */
	fputs("\
CD         change the current directory\n\
CLEAR      erase existing grammar and lexicon\n\
CLOSE      close the current log file\n\
", stderr);
#ifdef HAS_SUBPROCESS
	fputs("\
DIRECTORY  list the files in the current directory\n\
EDIT       edit a file\n\
", stderr);
#endif
	fputs("\
EXIT       exit PC-PATR (same as QUIT)\n\
FILE       read input from a file and process it\n\
HELP       display this list of commands\n\
LOAD       load a grammar, lexicon, or other control information from a file\n\
LOG        open a log file\n\
", stderr);
	fputs("\
PARSE      parse one or more sentences\n\
QUIT       quit PC-PATR (same as EXIT)\n\
SAVE       save current program status or lexicon contents\n\
SET        set processing switches\n\
SHOW       show status\n\
STATUS     show current files and switch settings\n\
", stderr);
#ifdef HAS_SUBPROCESS
	fputs("\
SYSTEM     execute an operating system command or program\n\
", stderr);
#endif
	fputs("\
TAKE       take PC-PATR commands from a file\n\
\n\
For more information, type HELP with a specific command name.\
", stderr);
	break;

	case CMD_AMBIGUOUS:
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP", arg);
	break;

	case CMD_HELP:
	fputs("HELP without an argument displays a list of the commands\n",
			stderr );
	break;

	case KW_CD:				/* CD ... */
#ifdef MACINTOSH
	fputs("\
CD <pathname> changes the current directory.  You can give a full path\n\
starting with the name of your hard disk, a path starting with : which\n\
means the current folder, or one starting :: which means the folder\n\
containing the current one (and so on).  Spaces in names are not\n\
permitted.\n\
", stderr);
#endif
#ifdef MSDOS
	fputs("\
CD <pathname> changes the current directory.  You can give a full path\n\
starting with the disk letter and a colon (for example, \"a:\"); a path\n\
starting with \\ which indicates a directory at the top level of the\n\
current disk; a path starting with .. which indicates the directory\n\
above the current one; and so on.  Directories are separated by the \\\n\
character.\n\
", stderr);
#endif
#ifdef UNIX
	fputs("\
CD <pathname> changes the current directory.  You can give a full path\n\
starting with a / (for example, \"/u/evan/pckimmo/englex/new\"); a path\n\
starting with .. which indicates the directory above the current one;\n\
and so on.  Directories are separated by the / character.\n\
", stderr);
#endif
	break;

	case KW_CLOSE:			/* CLOSE */
	fputs("\
CLOSE closes the log file opened by a LOG command.\n\
", stderr);
	break;

#ifdef HAS_SUBPROCESS
	case KW_DIRECTORY:			/* DIRECTORY */
	fputs("\
DIRECTORY lists the contents of the current directory.\n\
", stderr);
	break;

	case KW_EDIT:			/* EDIT <file> */
#ifdef MSDOS
	fputs("\
EDIT <file> attempts to edit a file using the program indicated by the\n\
environment variable EDITOR.  If this environment variable is not defined,\n\
then EDIT is used to edit the file.\n\
", stderr);
#endif
#ifdef UNIX
	fputs("\
EDIT <file> attempts to edit a file using the program indicated by the\n\
environment variable EDITOR.  If this environment variable is not defined,\n\
then emacs is used to edit the file.\n\
", stderr);
#endif
	break;
#endif /*HAS_SUBPROCESS*/

	case KW_FILE:			/* FILE ... */
	do_hlp_file(tokenizeString(NULL,szWhitespace_g));
	break;

	case KW_HELP:			/* HELP ... */
	fputs("\
HELP [<command-name>] displays a description of a command.  If HELP is typed\n\
by itself, PC-PATR displays a list of commands with short descriptions of\n\
each command.\n\
", stderr);
	break;

	case KW_LOAD:			/* LOAD ... */
	do_hlp_load(tokenizeString(NULL,szWhitespace_g));
	break;

	case KW_LOG:			/* LOG [<filename>] */
	fputs("\
LOG [<file>] opens a log file.  Each item processed by a PARSE command\n\
is stored to the log file as well as being displayed on the screen.\n\
\n", stderr);
	fputs("\
If a filename is given on the same line as the LOG command, then that file\n\
is used for the log file.  Any previously existing file with the same name\n\
will be overwritten.  If no filename is provided, then the file pcpatr.log\n\
in the current directory is used for the log file.\n\
\n", stderr);
	fputs("\
Use CLOSE to stop recording in a log file.  If a LOG command is given when\n\
a log file is already open, then the earlier log file is closed before the\n\
new log file is opened.\n\
", stderr);
	break;

	case KW_CLEAR:			/* CLEAR */
	fputs("\
CLEAR erases all existing grammar and lexicon information, allowing the user\n\
to prepare to load information for a new language.  Strictly speaking, it is\n\
not needed since the LOAD GRAMMAR command erases the previously existing\n\
grammar, and the LOAD LEXICON and LOAD ANALYSIS commands erase any previously\n\
existing lexicon.\n\
", stderr);
	break;

	case KW_PARSE:			/* PARSE */
	fputs("\
PARSE attempts the parse the input sentence according to the loaded grammar.\n\
The sentences are typed interactively by the user.  Both the grammar and the\n\
lexicon must be loaded before using this command.\n\
", stderr);
	break;

	case KW_QUIT:			/* QUIT or EXIT */
	fputs("\
Either EXIT or QUIT stops PC-PATR.\n\
", stderr);
	break;

	case KW_SAVE:			/* SAVE ... */
	fputs("\
SAVE STATUS <filename> writes the current settings to the designated\n\
TAKE file.  If the file is not specified, the settings are written to\n\
PCPATR.TAK in the current directory.\n\
\n\
SAVE LEXICON <filename> writes the current lexicon contents to the\n\
designated file.  The lexicon file must be specified.\n\
", stderr);
	break;

	case KW_SET:			/* SET ... */
	do_hlp_set(tokenizeString(NULL,szWhitespace_g));
	break;

	case KW_SHOW:			/* SHOW ... */
	do_hlp_show(tokenizeString(NULL,szWhitespace_g));
	break;

	case KW_STATUS:			/* STATUS */
	do_hlp_status();
	break;

#ifdef HAS_SUBPROCESS
	case KW_SYSTEM:			/* SYSTEM [<command>] */
	do_hlp_system();
	break;
#endif

	case KW_TAKE:			/* TAKE <filename> */
	fputs("\
TAKE [<file>] redirects command input to the specified file.\n\
\n\
The default filetype extension for TAKE is \".tak\", and the default\n\
filename is \"pcpatr.tak\" (without the quotation marks, of course).\n\
\n\
TAKE files can be nested three deep.  That is, the user types TAKE file1,\n\
file1 contains the command TAKE file2, and file2 has the command TAKE file3.\n\
It would be an error for file3 to contain a TAKE command.  This should not\n\
prove to be a serious limitation.\n\
", stderr);
	fputs("\n\
A TAKE file can also be specified by using the -t command line option when\n\
starting PC-PATR.\n\
", stderr);
	break;

	default:
#ifdef HAS_SUBPROCESS
	if (*arg == '!')
		do_hlp_system();
	else
#endif
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "HELP", arg);
	break;
	}
putc('\n', stderr);
}

/*****************************************************************************
 * NAME
 *    tryMorphParse
 * DESCRIPTION
 *
 * RETURN VALUE
 *    pointer to a PATR lexicon item, or NULL if morph parse failed
 */
static PATRLexItem * tryMorphParse(pszWord_in)
char *	pszWord_in;
{
if (sPCPATRKimmoData_g.sPATR.pGrammar != NULL)
	{
	sPCPATRKimmoData_g.bSilent = bPCPATRSilent_g;
	sPCPATRKimmoData_g.pLogFP  = sPCPATRData_g.pLogFP;
	return parseWithKimmoForPATRLexicon( pszWord_in,
					 &sPCPATRKimmoData_g,
					 &sPCPATRData_g );
	}
else if (sPCPATRAmpleData_g.pDictionary != NULL)
	{
	/*
	 *  fix the AMPLE settings
	 */
	sPCPATRAmpleData_g.cBeginComment = sPCPATRData_g.cComment;
	sPCPATRAmpleData_g.pLogFP        = sPCPATRData_g.pLogFP;
	return parseWithAmpleForPATRLexicon( pszWord_in, &sPCPATRAmpleData_g,
					 &sPCPATRData_g );
	}
else
	return NULL;
}

/*****************************************************************************
 * NAME
 *    write_stats
 * DESCRIPTION
 *    Write the cumulative statistics about success/ambiguity to the given
 *    output.
 * RETURN VALUE
 *    none
 */
static void write_stats(pfileOut, cSentences, rgcAmbigs)
FILE * pfileOut;
unsigned cSentences;
int * rgcAmbigs;
{
unsigned cParsed;
unsigned percent_parsed, frac_percent;
int i;

fprintf(pfileOut,
	"\nFile parsing statistics: %u sentence%s read\n",
	cSentences,
	(cSentences == 1) ? "" : "s");
for ( i = 0 ; i < 10 ; ++i )
	{
	if (rgcAmbigs[i])
	fprintf(pfileOut, "    %8u sentence%s with %d parse%s\n",
		rgcAmbigs[i], (rgcAmbigs[i] == 1) ? " " : "s",
		i, (i == 1) ? "" : "s");
	}
if (rgcAmbigs[10])
	fprintf(pfileOut,
		"    %8u sentence%s with 10 or more parses\n",
		rgcAmbigs[10], (rgcAmbigs[10] == 1) ? " " : "s");
cParsed = cSentences - rgcAmbigs[0];
if (cSentences == 0)
	{
	percent_parsed = 0;
	frac_percent   = 0;
	}
else
	{
	percent_parsed = (100 * cParsed) / cSentences;
	frac_percent = (100 * cParsed) % cSentences;
	frac_percent = (frac_percent * 10) / cSentences;
	}
fprintf(pfileOut, "%u of %u (%u.%u %%) parsed at least once\n",
	cParsed, cSentences, percent_parsed, frac_percent);
}

/*****************************************************************************
 * NAME
 *    do_file
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Finish parsing and execute a FILE command.
 * RETURN VALUE
 *    none
 */
static void do_file()
{
register char *arg;
FILE *infp, *outfp;
char *	pszOutputFile = "?";
unsigned linenum;
unsigned num_sentences = 0;
int i;
int successes[11];
char *cmd, *function, *anafile;
int cmd_code;
WordTemplate ** wtp;
unsigned uiDotsCount = 0;
unsigned uiAmbiguityCount;

for ( i = 0 ; i < 11 ; ++i )
	successes[i] = 0;
arg = (char *)tokenizeString(NULL,szWhitespace_g);
cmd_code = lookupCmdKeyword( arg, file_tab, n_file, "");
cmd = "FILE PARSE";
function = "PARSE";
if (cmd_code == KW_DISAMBIGUATE)
	{
	cmd = "FILE DISAMBIGUATE";
	function = "DISAMBIGUATE";
	}
switch (cmd_code)
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "FILE" );
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "FILE", arg);
	break;

	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP FILE for more help\n");
	break;

	case KW_DISAMBIGUATE:	/* FILE DISAMBIGUATE <anafile> [<outfile>] */
	case KW_PARSE:		/* FILE PARSE <infile> [<outfile>] */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	if (arg == NULL)
		{
		displayNumberedMessage(&sCmdMissingInputFile_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   cmd);
		return;
		}
	if ((cmd_code == KW_PARSE) && wantCmdHelp(arg,
"FILE PARSE <infile> [<outfile>] (no default filename or type)"))
		return;
	else if (wantCmdHelp(arg,
"FILE DISAMBIGUATE <anafile> [<outfile>] (no default filename or type)"))
		return;
	if (	(cmd_code == KW_PARSE) &&
		(sPCPATRData_g.pLexicon            == NULL) &&
		(sPCPATRKimmoData_g.sPATR.pGrammar == NULL) &&
		(sPCPATRAmpleData_g.pDictionary    == NULL) )
		{
		displayNumberedMessage(&sNeedLexiconFirst_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   function);
		return;
		}
	if (sPCPATRData_g.pGrammar == NULL)
		{
		displayNumberedMessage(&sNeedGrammarFirst_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   function);
		return;
		}
	if (getCmdTakeLevel() != 0)
		anafile = buildAdjustedFilename( arg, getCmdTakeFile(), NULL);
	else
		anafile = duplicateString( arg );
	infp = fopen( anafile, "r");
	if (infp == NULL)
		{
		displayNumberedMessage(&sCmdBadInputFile_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   arg, cmd );
		freeMemory( anafile );
		return;
		}
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	if (arg == NULL)
		{
		if (sPCPATRData_g.bSilent)
		outfp = NULL;
		else
		outfp = stderr;
		pszOutputFile = "{NO OUTPUT FILE}";
		}
	else
		{
		outfp = fopen( arg, "w" );
		pszOutputFile = arg;
		pCmdOutputFP_g = outfp;
		if (outfp == NULL)
		{
		displayNumberedMessage(&sCmdBadOutputFile_g,
					   bCmdSilentMessages_g,
					   bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   arg, cmd);
		}
		}
	if (bPCPATRTiming_g)
		startCmdTiming();
	linenum = 1;
	for (;;)
		{
		if (cmd_code == KW_PARSE)
		{
		arg = readLineFromFile(infp, &linenum, sPCPATRData_g.cComment);
		if (arg == NULL)
			break;
		/*
		 *  skip any leading whitespace
		 */
		arg += strspn(arg, (char *)szWhitespace_g);
		if (*arg == NUL)
			continue;
		trimTrailingWhitespace(arg);
		if (bPCPATRVerbose_g)
			fprintf(stderr, "%s\n", arg);
		else if ((outfp != NULL) && (outfp != stderr))
			{
			if (sPCPATRData_g.eTreeDisplay != PATR_XML_TREE)
			fprintf(outfp, "%s\n", arg);
			}
		uiAmbiguityCount = parseWithPATRLexicon(arg, outfp,
							tryMorphParse,
							bPCPATRWarnUnusedFd_g,
							&sPCPATRData_g);
		}
		else /* KW_DISAMBIGUATE */
		{
		if (num_sentences == 0)
		  fprintf(outfp, "\\id Grammar file used: %s\n",
			  sPCPATRData_g.pszGrammarFile);

		wtp = readSentenceOfTemplates(infp, anafile,
						  sPCPATRData_g.pFinalPunc,
						  &sPCPATRTextControl_g,
						  sPCPATRData_g.pLogFP);
		if (wtp == NULL)
			break;
		uiAmbiguityCount = parseAmpleSentenceWithPATR(
							 wtp,
							 outfp,
							 pszOutputFile,
							 bPCPATRWarnUnusedFd_g,
							 bPCPATRVerbose_g,
							 bPCPATRWriteAmpleParses_g,
							 num_sentences + 1,
							 &sPCPATRTextControl_g,
							 &sPCPATRData_g);
		}
		++num_sentences;
		if (!bPCPATRVerbose_g && !sPCPATRData_g.bSilent)
		{
		/*
		 *  reassure the user that we're doing something
		 */
		uiDotsCount = showAmbiguousProgress(uiAmbiguityCount,
							uiDotsCount);
		}
		if (uiAmbiguityCount < 10)
		++successes[uiAmbiguityCount];
		else
		++successes[10];
		}
	if (!sPCPATRData_g.bSilent)
		write_stats(stderr, num_sentences, successes);
	if (sPCPATRData_g.pLogFP != NULL)
		{
		write_stats(sPCPATRData_g.pLogFP, num_sentences, successes);
		}
	else if ((outfp != stderr) && (outfp != NULL))
		{
		if (cmd_code == KW_PARSE)
		write_stats(outfp, num_sentences, successes);
		fclose(outfp);
		}
	if (bPCPATRTiming_g)
		stopCmdTiming();
	fclose(infp);
	freeMemory( anafile );
	if (uiDotsCount != 78 && !sPCPATRData_g.bSilent)
		putc('\n',stderr);	/* newline unless no dots printed */
	pCmdOutputFP_g = NULL;
	if (bPCPATRTiming_g && !sPCPATRData_g.bSilent)
		showCmdTiming();
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "FILE", arg);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_cmd
 * ARGUMENTS
 *    command - command to execute, or NULL to acquire command elsewhere
 * DESCRIPTION
 *    Parse and execute one command.
 * RETURN VALUE
 *    zero for QUIT or EXIT command, nonzero for everything else
 */
static int do_cmd(command)
char *command;
{
register char *cmd, *arg;
char *savcmd;
/*
 *  Read the next command from the appropriate place
 */
cmd = getCmdString(command, szPCPATRprompt_m, sPCPATRData_g.cComment);
if (cmd == NULL)
	return 0;			/* end of input == quit */
if (*cmd == '\0')
	return(1);			/* ignore empty commands */
/*
 *  parse the first keyword of the command
 */
savcmd = (char *)duplicateString(cmd);
arg = (char *)tokenizeString((unsigned char *)cmd,szWhitespace_g);
switch (lookupCmdKeyword( arg, cmd_tab, n_cmd, "Command"))
	{
	case CMD_NULL:			/* empty command */
	break;				/* (just ignore it) */

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguous_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   arg);
	break;

	case CMD_HELP:			/* ? - list of commands displayed */
	fprintf(stderr, "Type HELP for more help\n");
	break;

	case KW_CD:				/* CD, change directory */
	doCmdChdir( (char *)tokenizeString(NULL,
					   szWhitespace_g) );
	break;

	case KW_CLOSE:			/* CLOSE */
	doCmdClose();
	sPCPATRData_g.pLogFP            = NULL;
	sPCPATRKimmoData_g.pLogFP       = NULL;
	sPCPATRKimmoData_g.sPATR.pLogFP = NULL;
	sPCPATRAmpleData_g.pLogFP       = NULL;
	break;

#ifdef HAS_SUBPROCESS
	case KW_DIRECTORY:				/* DIRECTORY */
	/*
	 *  retrieve the saved copy of the original command string
	 *    and skip past the initial keyword
	 *  try to execute the rest of the command line as a system command
	 */
	if (wantCmdHelp((char *)tokenizeString(NULL,szWhitespace_g),"\
DIRECTORY [arguments]  (default is long listing of the current directory)"))
		return(1);
	arg = savcmd;
	while (isascii(*arg) && isspace(*arg))
		++arg;
	while ( !isascii(*arg) || !isspace(*arg) )
		{
		if (*arg == NUL)
		break;
		++arg;
		}
	doCmdDirectory( arg );
	break;

	case KW_EDIT:			/* EDIT <file> */
	doCmdEdit( (char *)tokenizeString(NULL,
					  szWhitespace_g) );
	break;
#endif /*HAS_SUBPROCESS*/

	case KW_FILE:			/* FILE ... */
	do_file();
	break;

	case KW_HELP:			/* HELP ... */
	do_help();
	break;

	case KW_LOAD:			/* LOAD ... */
	do_load();
	break;

	case KW_LOG:			/* LOG [<filename>] */
	doCmdLog( (char *)tokenizeString(NULL,
					 szWhitespace_g) );
	sPCPATRData_g.pLogFP            = pCmdLogFP_g;
	sPCPATRKimmoData_g.pLogFP       = pCmdLogFP_g;
	sPCPATRKimmoData_g.sPATR.pLogFP = pCmdLogFP_g;
	sPCPATRAmpleData_g.pLogFP       = pCmdLogFP_g;
	break;

   case KW_CLEAR:			/* CLEAR */
	do_clear();
	break;

	case KW_PARSE:			/* PARSE */
	if (	(sPCPATRData_g.pLexicon            == NULL) &&
		(sPCPATRKimmoData_g.sPATR.pGrammar == NULL) &&
		(sPCPATRAmpleData_g.pDictionary    == NULL) )
		{
		displayNumberedMessage(&sNeedLexiconFirst_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "PARSE");
		break;
		}
	if (sPCPATRData_g.pGrammar == NULL)
		{
		displayNumberedMessage(&sNeedGrammarFirst_m,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "PARSE");
		break;
		}
	cmd = (char *)tokenizeString(NULL, NULL);
	if (cmd != NULL)
		{
		while (*cmd && isascii(*cmd) && isspace(*cmd))
		++cmd;
		if (*cmd == NUL)
		cmd = NULL;
		}
	if (cmd != NULL)
		parseWithPATRLexicon(cmd, stderr, tryMorphParse,
				 bPCPATRWarnUnusedFd_g, &sPCPATRData_g);
	else
		{
		for (;;)
		{
		cmd = promptUser("Sentence: ");
		if (cmd == NULL || *cmd == NUL)
			break;
		parseWithPATRLexicon(cmd, stderr, tryMorphParse,
					 bPCPATRWarnUnusedFd_g, &sPCPATRData_g);
		}
		}
	break;

	case KW_QUIT:			/* QUIT or EXIT */
#ifdef MACINTOSH
#ifdef MPW_PERF
	/* Write the performance raw data into a file */
	if (PerfDump(ThePGlobals, (StringPtr)"\pPerform.out", true, 80) )
		fprintf(stderr, "Errors during dump.\n");
	TermPerf(ThePGlobals);	/* clean up */
#endif
#endif
	freeMemory(savcmd);
	while (closeCmdTake() != 0)
		;
	return( 0 );

	case KW_SAVE:			/* SAVE ... */
	do_save();
	break;

	case KW_SET:			/* SET ... */
	do_set();
	break;

	case KW_SHOW:			/* SHOW ... */
	do_show();
	break;

	case KW_STATUS:			/* STATUS */
	show_status();			/* STATUS == SHOW STATUS */
	break;

#ifdef HAS_SUBPROCESS
	case KW_SYSTEM:			/* SYSTEM [<command>] */
	/*
	 *  retrieve the saved copy of the original command string
	 *    and skip past the initial keyword
	 *  try to execute the rest of the command line as a system command
	 */
#ifdef UNIX
	if (wantCmdHelp((char *)tokenizeString(NULL,szWhitespace_g),"\
SYSTEM [<command>] (default is subshell, type EXIT to return to PC-PATR)"))
#endif
#ifdef MSDOS
	if (wantCmdHelp((char *)tokenizeString(NULL,szWhitespace_g),"\
SYSTEM [<command>] (default is DOS shell, type EXIT to return to PPATR)"))
#endif
		return(1);
	arg = savcmd;
	while (isascii(*arg) && isspace(*arg))
		++arg;
	while ( !isascii(*arg) || !isspace(*arg) )
		{
		if (*arg == NUL)
		break;
		++arg;
		}
	doCmdSystem( arg );
	break;
#endif /*HAS_SUBPROCESS*/

	case KW_TAKE:			/* TAKE <filename> */
	arg = (char *)tokenizeString(NULL,szWhitespace_g);
	doCmdTake(arg);
	break;

	default:				/* invalid command */
#ifdef HAS_SUBPROCESS
	if (*savcmd == '!')		/* treat ! same as SYSTEM, except */
		{				/* that no space is needed before */
		doCmdSystem(savcmd+1);	/* the system command */
		break;
		}
#endif
	if (getCmdTakeLevel() != 0)
		{				/* If in take file, abort it */
		displayNumberedMessage(&sCmdErrorInTake_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   arg);
		closeCmdTake();
		}
	else
		displayNumberedMessage(&sCmdInvalid_g,
				   bCmdSilentMessages_g,
				   bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   arg);
	break;
	}
freeMemory(savcmd);
return(1);			/* tell caller to keep going */
}

/*****************************************************************************
 * NAME
 *    find_ini_file
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Find an initialization file for PC-PATR if one exists.
 *	1) pcpatr.tak
 *	2) pc-patr.tak
 *	3) MSDOS: <program_path>\pcpatr.tak
 *	   UNIX:  $HOME/pcpatr.tak
 *	4) MSDOS: <program_path>\pc-patr.tak
 *	   UNIX:  $HOME/pc-patr.tak
 *	5) UNIX:  $HOME/.pcpatrrc
 * RETURN VALUE
 *    input FILE pointer, or NULL
 */
static FILE * find_ini_file()
{
FILE *fp;
#ifndef MACINTOSH
char *p;
#endif
static const char * names[2] = { "pcpatr.tak", "pc-patr.tak" };

strcpy(szInitFile_m, names[0]);
fp = fopen(szInitFile_m, "r");
if (fp != NULL)
	return(fp);
strcpy(szInitFile_m, names[1]);
fp = fopen(szInitFile_m, "r");
if (fp != NULL)
	return(fp);
#ifdef DOS_FILESYSTEM
if (pszArgv0_g != NULL)
	{
	strncpy(szInitFile_m, pszArgv0_g, MAXLINELEN);
	szInitFile_m[MAXLINELEN] = NUL;
	p = strrchr(szInitFile_m, '\\');
	if (p != NULL)
	{
	++p;
	*p = NUL;
	strncat(szInitFile_m, names[0],
		sizeof(szInitFile_m) - strlen(szInitFile_m) - 1);
	fp = fopen(szInitFile_m, "r");
	if (fp != NULL)
		return(fp);
	*p = NUL;
	strncat(szInitFile_m, names[1],
		sizeof(szInitFile_m) - strlen(szInitFile_m) - 1);
	fp = fopen(szInitFile_m, "r");
	if (fp != NULL)
		return(fp);
	}
	}
#endif
#ifdef UNIX
p = getenv("home");
if (p == NULL)
	p = getenv("HOME");
if (p != NULL)
	{
	strncpy(szInitFile_m, p, MAXLINELEN);
	szInitFile_m[MAXLINELEN] = NUL;
	p = szInitFile_m + strlen(szInitFile_m) - 1;
	if (*p != '/')
	{
	strncat(szInitFile_m, "/",
		sizeof(szInitFile_m) - strlen(szInitFile_m) - 1);
	p = szInitFile_m + strlen(szInitFile_m);
	strncat(szInitFile_m, names[0],
		sizeof(szInitFile_m) - strlen(szInitFile_m) - 1);
	fp = fopen(szInitFile_m, "r");
	if (fp != NULL)
		return(fp);
	*p = NUL;
	strncat(szInitFile_m, names[1],
		sizeof(szInitFile_m) - strlen(szInitFile_m) - 1);
	fp = fopen(szInitFile_m, "r");
	if (fp != NULL)
		return(fp);
	*p = NUL;
	strncat(szInitFile_m, ".pcpatrrc",
		sizeof(szInitFile_m) - strlen(szInitFile_m) - 1);
	fp = fopen(szInitFile_m, "r");
	if (fp != NULL)
		return(fp);
	}
	}
#endif
return(NULL);
}

/*****************************************************************************
 * NAME
 *    user_cmd
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Interactively parse commands from the user.
 * RETURN VALUE
 *    none
 */
void user_cmd()
{
FILE *fp;
char command[MAXLINELEN];
char *cmd;
unsigned linenum;
#ifdef DOS_FILESYSTEM
char *cwd = NULL;
int drive = 0;
#endif

if (!sPCPATRData_g.bSilent)
	fprintf(stderr, "Type ? for help\n");

bCmdSilentMessages_g = sPCPATRData_g.bSilent;

bCmdShowWarnings_g                     = TRUE;
sPCPATRData_g.bShowWarnings            = bCmdShowWarnings_g;
sPCPATRKimmoData_g.bShowWarnings       = bCmdShowWarnings_g;
sPCPATRKimmoData_g.sPATR.bShowWarnings = bCmdShowWarnings_g;

#ifdef DOS_FILESYSTEM
/*
 * save the current drive and directory
 */
drive = _getdrive();
cwd = _getcwd(NULL, 80);
#endif
/*
 *  handle an initialization "TAKE" file
 */
fp = find_ini_file();
if (fp != NULL)
	{
	fprintf(stderr, "%sTAKE %s\n", szPCPATRprompt_m, szInitFile_m);
	while ((cmd = readLineFromFile(fp, &linenum,
				   sPCPATRData_g.cComment)) != NULL)
	{
	cmd += strspn(cmd, (char *)szWhitespace_g);
	if (*cmd != NUL)
		{
		trimTrailingWhitespace(cmd);
		do_cmd(cmd);
		}
	}
	fclose(fp);
	fp = NULL;
	}
/*
 *  handle the command line arguments
 */
/* -g <grmfile> */
pszPCPATRGrmFile_g = setCmdFilename(pszPCPATRGrmFile_g, NULL, ".grm");
if (pszPCPATRGrmFile_g != NULL)
	{
	if (    (sPCPATRData_g.pGrammar       == NULL) ||
		(sPCPATRData_g.pszGrammarFile == NULL) ||
		(strcmp(pszPCPATRGrmFile_g,
			sPCPATRData_g.pszGrammarFile) != 0) )
	{
	strcpy(command, "LOAD GRAMMAR ");
	strncat(command, pszPCPATRGrmFile_g,
		sizeof(command) - strlen(command) - 1);
	do_cmd(command);
	}
	freeMemory(pszPCPATRGrmFile_g);
	pszPCPATRGrmFile_g = NULL;
	}
/* -l <lexfile> */
pszPCPATRLexFile_g = setCmdFilename(pszPCPATRLexFile_g, NULL, ".lex");
if (pszPCPATRLexFile_g != NULL)
	{
	if (    (sPCPATRData_g.pLexicon == NULL) ||
		(pPCPATRLexiconFiles_g  == NULL) ||
		(isMemberOfStringList(pPCPATRLexiconFiles_g,
				  pszPCPATRLexFile_g) == 0) )
	{
	strcpy(command, "LOAD LEXICON ");
	strncat(command, pszPCPATRLexFile_g,
		sizeof(command) - strlen(command) - 1);
	do_cmd(command);
	}
	freeMemory(pszPCPATRLexFile_g);
	pszPCPATRLexFile_g = NULL;
	}
/* -a <anafile> */
pszPCPATRAnaFile_g = setCmdFilename(pszPCPATRAnaFile_g, NULL, ".ana");
if (pszPCPATRAnaFile_g != NULL)
	{
	if (    (sPCPATRData_g.pLexicon == NULL) ||
		(pPCPATRAmpleFiles_g    == NULL) ||
		(isMemberOfStringList(pPCPATRAmpleFiles_g,pszPCPATRAnaFile_g)==0) )
	{
	strcpy(command, "LOAD ANALYSIS ");
	strncat(command, pszPCPATRAnaFile_g,
		sizeof(command) - strlen(command) - 1);
	do_cmd(command);
	}
	freeMemory(pszPCPATRAnaFile_g);
	pszPCPATRAnaFile_g = NULL;
	}
/* -t <takfile> */
pszPCPATRTakFile_g = setCmdFilename(pszPCPATRTakFile_g, NULL, ".tak");
if (pszPCPATRTakFile_g != NULL)
	{
	strcpy(command, "TAKE ");
	strncat(command, pszPCPATRTakFile_g,
		sizeof(command) - strlen(command) - 1);
	do_cmd(command);
	freeMemory(pszPCPATRTakFile_g);
	pszPCPATRTakFile_g = NULL;
	}
/*
 *  set up for error or SIGINT trapping
 */
if (setjmp(sCmdJmpBuf_g) != 0)
	{
	fputs("\nRETURNING TO PC-PATR COMMAND PROCESSING\n\n", stderr);
	}
else
	{
#ifdef HAVE_SIGNAL
#ifdef SIGINT
	signal( SIGINT, handleCmdSigint );
#endif
#endif
	}
/*
 *  acquire and process commands until the user wants to quit
 */
while ( do_cmd(NULL) )
	;
#ifdef DOS_FILESYSTEM
/*
 * restore the current drive and directory
 */
if (cwd != NULL)
	{
	_chdir(cwd);
	free(cwd);
	cwd = NULL;
	}
if (drive != 0)
	{
	_chdrive(drive);
	drive = 0;
	}
#endif
}
