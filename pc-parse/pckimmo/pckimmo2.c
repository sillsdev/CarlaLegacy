/* PCKIMMO2.C - interactive user interface for PC-KIMMO
 ***************************************************************************
 *
 * void user_cmd()
 *
 ***************************************************************************
 * Copyright 1989, 2000 by SIL International.  All rights reserved.
 */
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
#ifndef HAVE_STRRCHR
#define strrchr rindex
#endif
extern char * strcpy  P((char * dest, const char * src));
extern char * strncpy P((char * dest, const char * src, size_t n));
extern char * strncat P((char * dest, const char * src, size_t n));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strrchr P((const char * s, int c));
extern size_t strspn  P((const char * s, const char * accept));
extern size_t strlen  P((const char * s));
extern char * getenv  P((const char * name));
#endif /* STDC_HEADERS */

#include "kimmo.h"
#include "pckimmo.h"

extern char * strlwr P((char * pszString_io));

#ifdef __DJGPP__
extern char *getcwd P((char *buffer, int max));
extern int chdir P((const char *new_directory));
#endif

extern char *	pszArgv0_g;

/* same chars as isspace() */
static unsigned char	szWhitespace_m[7] = " \t\n\v\f\r";

static char		szPCKimmoPrompt_m[10] = "PC-KIMMO>";

static char		szInitFile_m[MAXLINELEN+1];
/*
 *  error messages
 */
static NumberedMessage sNeedRulesFirst_m	= { ERROR_MSG,   118,
	"Must load rules before loading lexicon" };
static NumberedMessage sNoGrammarLoaded_m	= { ERROR_MSG,   119,
	"No grammar loaded" };
/*static NumberedMessage sNeedLexiconFirst_m	= { ERROR_MSG,   120,*/
/*    "Must load lexicon before loading grammar" };*/

/*************************************************************************
 *  Values for successful keyword searches (must be >= 0)
 */
#define KW_ALL		 1
#define KW_CLOSE	 2
#define KW_COMMENT	 3
#define KW_COMPARE	 4
#ifdef HAS_SUBPROCESS
#define KW_EDIT		 5
#endif
#define KW_FILE		 6
#define KW_GENERATE	 7
#define KW_HELP		 8
#define KW_LEXICON	 9
#define KW_LIMIT	10
#define KW_LIST		11
#define KW_LOAD		12
#define KW_LOG		13
#define KW_CLEAR	14
#define KW_OFF		15
#define KW_ON		16
#define KW_PAIRS	17
#define KW_QUIT		18
#define KW_RECOGNIZE	19
#define KW_RULES	20
#define KW_SET		21
#define KW_SHOW		22
#define KW_STATUS	23
#ifdef HAS_SUBPROCESS
#define KW_SYSTEM	24
#endif
#define KW_TAKE		25
#define KW_TIMING	26
#define KW_TRACING	27
#define KW_VERBOSE	28
#define KW_ALIGNMENT	29
#define KW_WARNING	30
#define KW_GRAMMAR	31
#define KW_AMBIGUITIES	32
#define KW_FEATURES	33
#define KW_TREE		34
#define KW_UNIFICATION	35
#define KW_FAILURE	36
#define KW_TOP		37
#define KW_FLAT		38
#define KW_FULL		39
#define KW_GLOSS	40
#define KW_TRIM_EMPTY	41
#define KW_CD		42
#ifdef HAS_SUBPROCESS
#define KW_DIRECTORY	43
#endif
#define KW_SAVE		44
#define KW_INDENTED	45
#define KW_SYNTHESIZE	46
#define KW_SYNTHESIS	47
#define KW_XML		48

/*************************************************************************
 *  keyword tables for interactive commands
 */
static CmdKeyword asCommandTable_m[] = {	/* Top-Level Keyword Table */
	{ "cd",		KW_CD,		0 },
	{ "clear",		KW_CLEAR,	0 },
	{ "close",		KW_CLOSE,	0 },
	{ "compare",	KW_COMPARE,	0 },
#ifdef HAS_SUBPROCESS
	{ "directory",	KW_DIRECTORY,	0 },
	{ "edit",		KW_EDIT,	0 },
#endif
	{ "exit",		KW_QUIT,	0 },
	{ "file",		KW_FILE,	0 },
	{ "generate",	KW_GENERATE,	0 },
	{ "help",		KW_HELP,	0 },
	{ "l",		KW_LOAD,	CMD_INVISIBLE },
#ifdef HAS_SUBPROCESS
	{ "ls",		KW_DIRECTORY,	CMD_INVISIBLE },
#endif
	{ "list",		KW_LIST,	0 },
	{ "load",		KW_LOAD,	0 },
	{ "log",		KW_LOG,		0 },
	{ "quit",		KW_QUIT,	0 },
	{ "recognize",	KW_RECOGNIZE,	0 },
	{ "s",		KW_SYNTHESIZE,	CMD_INVISIBLE },
	{ "save",		KW_SAVE,	0 },
	{ "set",		KW_SET,		0 },
	{ "show",		KW_SHOW,	0 },
	{ "status",		KW_STATUS,	0 },
	{ "synthesize",	KW_SYNTHESIZE,	0 },
#ifdef HAS_SUBPROCESS
	{ "system",		KW_SYSTEM,	0 },
#endif
	{ "take",		KW_TAKE,	0 },
	};
static int iCommandTableSize_m =
			(sizeof(asCommandTable_m) / sizeof(CmdKeyword));

static CmdKeyword asLoadTable_m[] = {	/* LOAD command keyword table */
	{ "grammar",		KW_GRAMMAR,   0 },
	{ "lexicon",		KW_LEXICON,   0 },
	{ "rules",			KW_RULES,     0 },
	{ "synthesis-lexicon",	KW_SYNTHESIS, 0 },
	};
static int iLoadTableSize_m = (sizeof(asLoadTable_m) / sizeof(CmdKeyword));

static CmdKeyword asFileTable_m[] = {	/* FILE command keyword table */
	{ "compare",	KW_COMPARE,    0 },
	{ "generate",	KW_GENERATE,   0 },
	{ "recognize",	KW_RECOGNIZE,  0 },
	{ "synthesize",	KW_SYNTHESIZE, 0 },
	};
static int iFileTableSize_m = (sizeof(asFileTable_m) / sizeof(CmdKeyword));

static CmdKeyword asSetTable_m[] = {	/* SET command keyword table */
	{ "alignment",		KW_ALIGNMENT,   0 },
	{ "ambiguities",		KW_AMBIGUITIES, 0 },
	{ "failures",		KW_FAILURE,     0 },
	{ "features",		KW_FEATURES,    0 },
	{ "glosses",		KW_GLOSS,       0 },
	{ "grammar",		KW_GRAMMAR,     0 },
	{ "limit",			KW_LIMIT,       0 },
	{ "rules",			KW_RULES,       0 },
	{ "timing",			KW_TIMING,      0 },
	{ "tracing",		KW_TRACING,     0 },
	{ "tree",			KW_TREE,        0 },
	{ "trim-empty-features",	KW_TRIM_EMPTY,  0 },
	{ "unification",		KW_UNIFICATION, 0 },
	{ "verbose",		KW_VERBOSE,     0 },
	{ "warnings",		KW_WARNING,     0 },
	};
static int iSetTableSize_m = (sizeof(asSetTable_m) / sizeof(CmdKeyword));

static CmdKeyword asListTable_m[] = {	/* LIST command keyword table */
	{ "lexicon",	KW_LEXICON, 0 },
	{ "pairs",		KW_PAIRS,   0 },
	{ "rules",		KW_RULES,   0 },
	};
static int iListTableSize_m = (sizeof(asListTable_m) / sizeof(CmdKeyword));

static CmdKeyword asShowTable_m[] = {	/* SHOW command keyword table */
	{ "lexicon",	KW_LEXICON, 0 },
	{ "rule",		KW_RULES,   0 },
	{ "status",		KW_STATUS,  0 },
	};
static int iShowTableSize_m = (sizeof(asShowTable_m) / sizeof(CmdKeyword));

static CmdKeyword asCompareTable_m[] = { /* COMPARE command keyword table */
	{ "generate",	KW_GENERATE,   0 },
	{ "pairs",		KW_PAIRS,      0 },
	{ "recognize",	KW_RECOGNIZE,  0 },
	{ "synthesize",	KW_SYNTHESIZE, 0 },
	};
static int iCompareTableSize_m =
			(sizeof(asCompareTable_m) / sizeof(CmdKeyword));

static CmdKeyword asFeaturesTable_m[] = { /* SET FEATURES keywords table */
	{ "all",		KW_ALL,  0 },
	{ "flat",		KW_FLAT, 0 },
	{ "full",		KW_FULL, 0 },
	{ "off",		KW_OFF,  0 },
	{ "on",		KW_ON,   CMD_INVISIBLE },
	{ "top",		KW_TOP,	 0 },
	{ "xml",		KW_XML,	 0 },
	};
static int iFeaturesTableSize_m = 6;

static CmdKeyword asTreeTable_m[] = {	/* SET TREE keywords table */
	{ "flat",		KW_FLAT,     0 },
	{ "full",		KW_FULL,     0 },
	{ "indented",	KW_INDENTED, 0 },
	{ "off",		KW_OFF,      0 },
	{ "on",		KW_ON,       CMD_INVISIBLE },
	{ "xml",		KW_XML,	     0 },
	};
static int iTreeTableSize_m = 4;

static CmdKeyword asOnOffTable_m[] = {	/* ON and OFF keywords table */
	{ "off",		KW_OFF, 0 },
	{ "on",		KW_ON,  0 },
	};
static int iOnOffTableSize_m = 2;

#ifdef applec
#pragma segment S_pckimmo2
#endif

#ifdef __STDC__
static FILE * find_ini_file(void);
#endif

/*****************************************************************************
 * NAME
 *    do_compare
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Finish parsing and execute a FILE COMPARE (or COMPARE) command.
 * RETURN VALUE
 *    none
 */
static void do_compare()
{
register char *arg;
char *infile;
char *p;
FILE *infp;

arg = (char *)tokenizeString(NULL,szWhitespace_m);
switch (lookupCmdKeyword( arg, asCompareTable_m, iCompareTableSize_m, ""))
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "[FILE] COMPARE");
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "[FILE] COMPARE", arg);
	break;

	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP [FILE] COMPARE for more help\n");
	break;

	case KW_GENERATE:		/* FILE COMPARE GENERATE <infile> */
	infile = (char *)tokenizeString(NULL,szWhitespace_m);
	if (wantCmdHelp(infile,
"COMPARE GENERATE [<file>] (default name is data.gen, default type is .gen)"))
		break;
	infile = setCmdFilename( infile, "data.gen", ".gen");
	if (getCmdTakeLevel() != 0)
		{
		p = buildAdjustedFilename(infile, getCmdTakeFile(), NULL);
		freeMemory( infile );
		infile = p;
		}
	infp = fopen( infile, "r");
	if (infp == (FILE *)NULL)
		{
		displayNumberedMessage(&sCmdBadInputFile_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   infile, "[FILE] COMPARE GENERATE" );
		freeMemory(infile);
		return;
		}
	compare_gener(infp);
	fclose(infp);
	freeMemory(infile);
	if (bTiming_g && !sKimmoData_g.bSilent)
		showCmdTiming();
	break;

	case KW_RECOGNIZE:		/* FILE COMPARE RECOGNIZE <infile> */
	infile = (char *)tokenizeString(NULL,szWhitespace_m);
	if (wantCmdHelp(infile,
"COMPARE RECOGNIZE [<file>] (default name is data.rec, default type is .rec)"))
		break;
	infile = setCmdFilename( infile, "data.rec", ".rec");
	if (getCmdTakeLevel() != 0)
		{
		p = buildAdjustedFilename(infile, getCmdTakeFile(), NULL);
		freeMemory( infile );
		infile = p;
		}
	infp = fopen( infile, "r");
	if (infp == (FILE *)NULL)
		{
		displayNumberedMessage(&sCmdBadInputFile_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   infile, "[FILE] COMPARE RECOGNIZE" );
		freeMemory(infile);
		return;
		}
	compare_recog(infp);
	fclose(infp);
	freeMemory(infile);
	if (bTiming_g && !sKimmoData_g.bSilent)
		showCmdTiming();
	break;

	case KW_SYNTHESIZE:		/* FILE COMPARE SYNTHESIZE <infile> */
	infile = (char *)tokenizeString(NULL,szWhitespace_m);
	if (wantCmdHelp(infile,
"COMPARE SYNTHESIZE [<file>] (default name is data.syn, default type is .syn)"
				))
		break;
	infile = setCmdFilename( infile, "data.syn", ".syn");
	if (getCmdTakeLevel() != 0)
		{
		p = buildAdjustedFilename(infile, getCmdTakeFile(), NULL);
		freeMemory( infile );
		infile = p;
		}
	infp = fopen( infile, "r");
	if (infp == (FILE *)NULL)
		{
		displayNumberedMessage(&sCmdBadInputFile_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   infile, "[FILE] COMPARE SYNTHESIZE" );
		freeMemory(infile);
		return;
		}
	compare_synth(infp);
	fclose(infp);
	freeMemory(infile);
	if (bTiming_g && !sKimmoData_g.bSilent)
		showCmdTiming();
	break;

	case KW_PAIRS:		/* FILE COMPARE PAIRS <infile> */
	infile = (char *)tokenizeString(NULL,szWhitespace_m);
	if (wantCmdHelp(infile,
"COMPARE PAIRS [<file>] (default name is data.pai, default type is .pai)"))
		break;
	infile = setCmdFilename( infile, "data.pai", ".pai");
	if (getCmdTakeLevel() != 0)
		{
		p = buildAdjustedFilename(infile, getCmdTakeFile(), NULL);
		freeMemory( infile );
		infile = p;
		}
	infp = fopen( infile, "r");
	if (infp == (FILE *)NULL)
		{
		displayNumberedMessage(&sCmdBadInputFile_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   infile, "[FILE] COMPARE PAIRS" );
		freeMemory(infile);
		return;
		}
				/* cross compare lexical and surface forms */
	compare_pairs(infp,infile);
	fclose(infp);
	freeMemory(infile);
	if (bTiming_g && !sKimmoData_g.bSilent)
		showCmdTiming();
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "[FILE] COMPARE", arg);
	break;
	}
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
char *arg;

arg = (char *)tokenizeString(NULL,szWhitespace_m);
switch (lookupCmdKeyword( arg, asFileTable_m, iFileTableSize_m, ""))
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "FILE" );
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "FILE", arg);
	break;

	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP FILE for more help\n");
	break;

	case KW_COMPARE:		/* FILE COMPARE ... */
	do_compare();			/* same as COMPARE ... */
	break;

	case KW_GENERATE:		/* FILE GENERATE <infile> [<outfile>] */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	if (arg == (char *)NULL)
		{
		displayNumberedMessage(&sCmdMissingInputFile_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "FILE GENERATE");
		return;
		}
	if (wantCmdHelp(arg,
"FILE GENERATE <infile> [<outfile>] (no default filename or type)"))
		return;
	do_file_generate(arg);
	break;

	case KW_RECOGNIZE:		/* FILE RECOGNIZE <infile> [<outfile>] */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	if (arg == (char *)NULL)
		{
		displayNumberedMessage(&sCmdMissingInputFile_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "FILE RECOGNIZE");
		return;
		}
	if (wantCmdHelp(arg,
"FILE RECOGNIZE <infile> [<outfile>] (no default filename or type)"))
		return;
	do_file_recognize(arg);
	break;

	case KW_SYNTHESIZE:		/* FILE SYNTHESIZE <infile> [<outfile>] */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	if (arg == (char *)NULL)
		{
		displayNumberedMessage(&sCmdMissingInputFile_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "FILE SYNTHESIZE");
		return;
		}
	if (wantCmdHelp(arg,
"FILE SYNTHESIZE <infile> [<outfile>] (no default filename or type)"))
		return;
	do_file_synthesize(arg);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "FILE", arg);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_list
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Finish parsing and execute a LIST command.
 * RETURN VALUE
 *    none
 */
static void do_list()
{
register char *arg;

arg = (char *)tokenizeString(NULL,szWhitespace_m);
switch (lookupCmdKeyword( arg, asListTable_m, iListTableSize_m, ""))
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "LIST" );
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "LIST", arg);
	break;

	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP LIST for more help\n");
	break;

	case KW_LEXICON:		/* LIST LEXICON */
	writeKimmoLexiconSectionNames(stderr, &sKimmoData_g);
	break;

	case KW_PAIRS:		/* LIST PAIRS */
	writeKimmoFeasiblePairs(stderr, &sKimmoData_g);
	putc( '\n', stderr);		/* blank line before the prompt */
	break;

	case KW_RULES:		/* LIST RULES */
	writeKimmoRulesStatus(stderr, &sKimmoData_g);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "LIST", arg);
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
char *p;

arg = (char *)tokenizeString(NULL,szWhitespace_m);
switch (lookupCmdKeyword( arg, asLoadTable_m, iLoadTableSize_m, ""))
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "LOAD" );
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "LOAD", arg);
	break;

	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP LOAD for more help\n");
	break;

	case KW_RULES:			/* LOAD RULES [<filename>] */
	arg = (char *)tokenizeString((unsigned char *)NULL,
					 szWhitespace_m);
	if (wantCmdHelp(arg,
"LOAD RULES [<file>] (default name is rules.rul, default type is .rul)"))
		return;
	arg = setCmdFilename( arg, "rules.rul", ".rul");
	if (getCmdTakeLevel() != 0)
		{
		p = buildAdjustedFilename(arg, getCmdTakeFile(), NULL);
		freeMemory( arg );
		arg = p;
		}
	if (bTiming_g)
		startCmdTiming();
	if (!sKimmoData_g.bSilent)
		fprintf(stderr, "Loading rules from %s\n", arg);
	if (	(loadKimmoRules((unsigned char *)arg, &sKimmoData_g) == 0) &&
		!sKimmoData_g.bSilent && sKimmoData_g.bTwoLCFile )
		fprintf(stderr, "%s is a twolc rules file.\n",
			sKimmoData_g.pszRulesFile);
	freeMemory(arg);
	if (bTiming_g)
		{
		stopCmdTiming();
		if (sKimmoData_g.pszRulesFile != NULL && !sKimmoData_g.bSilent)
		showCmdTiming();
		}
	sKimmoData_g.sPATR.cComment     = sKimmoData_g.cComment;
	sSynthesisData_g.cComment       = sKimmoData_g.cComment;
	sSynthesisData_g.sPATR.cComment = sKimmoData_g.cComment;
	/*
	 *  copy the Rules section of the language data for the synthesis data
	 */
	sSynthesisData_g.ppszAlphabet         = sKimmoData_g.ppszAlphabet;
	sSynthesisData_g.uiAlphabetSize       = sKimmoData_g.uiAlphabetSize;
	sSynthesisData_g.cNull                = sKimmoData_g.cNull;
	sSynthesisData_g.cAny                 = sKimmoData_g.cAny;
	sSynthesisData_g.cBoundary            = sKimmoData_g.cBoundary;
	sSynthesisData_g.bTwoLCFile           = sKimmoData_g.bTwoLCFile;
	sSynthesisData_g.pSubsets             = sKimmoData_g.pSubsets;
	sSynthesisData_g.uiSubsetCount        = sKimmoData_g.uiSubsetCount;
	sSynthesisData_g.pAutomata            = sKimmoData_g.pAutomata;
	sSynthesisData_g.uiAutomataSize       = sKimmoData_g.uiAutomataSize;
	sSynthesisData_g.pFeasiblePairs       = sKimmoData_g.pFeasiblePairs;
	sSynthesisData_g.uiFeasiblePairsCount =
						 sKimmoData_g.uiFeasiblePairsCount;
	sSynthesisData_g.pszRulesFile         = sKimmoData_g.pszRulesFile;
	break;

	case KW_LEXICON:			/* LOAD LEXICON [<filename>] */
	arg = (char *)tokenizeString(NULL, szWhitespace_m);
	if (wantCmdHelp(arg,
"LOAD LEXICON [<file>] (default name is lexicon.lex, default type is .lex)"))
		return;
	if (sKimmoData_g.pszLexiconFile != (char *)NULL)
		freeKimmoLexicon(&sKimmoData_g);
	if (sKimmoData_g.pszRulesFile == (char *)NULL)
		displayNumberedMessage(&sNeedRulesFirst_m,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0);
	else
		{
		arg = setCmdFilename( arg, "lexicon.lex", ".lex");
		if (getCmdTakeLevel() != 0)
		{
		p = buildAdjustedFilename(arg, getCmdTakeFile(), NULL);
		freeMemory( arg );
		arg = p;
		}
		if (bTiming_g)
		startCmdTiming();
		if (!sKimmoData_g.bSilent)
		fprintf(stderr, "Loading lexicon from %s\n", arg );
		loadKimmoLexicon((unsigned char *)arg, KIMMO_ANALYSIS,
				 &sKimmoData_g);
		freeMemory(arg);
		if (bTiming_g)
		{
		stopCmdTiming();
		if (sKimmoData_g.pszLexiconFile != NULL &&
							 !sKimmoData_g.bSilent)
			showCmdTiming();
		}
		}
	break;

	case KW_SYNTHESIS:			/* LOAD SYNTHESIS-LEXICON [<file>] */
	arg = (char *)tokenizeString(NULL, szWhitespace_m);
	if (wantCmdHelp(arg,
"LOAD SYNTHESIS-LEXICON [<file>] (default name is lexicon.lex, type is .lex)"))
		return;
	if (sSynthesisData_g.pszLexiconFile != (char *)NULL)
		freeKimmoLexicon(&sSynthesisData_g);
	if (sKimmoData_g.pszRulesFile == (char *)NULL)
		displayNumberedMessage(&sNeedRulesFirst_m,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0);
	else
		{
		/*
		 *  load the synthesis lexicon
		 */
		arg = setCmdFilename( arg, "lexicon.lex", ".lex");
		if (getCmdTakeLevel() != 0)
		{
		p = buildAdjustedFilename(arg, getCmdTakeFile(), NULL);
		freeMemory( arg );
		arg = p;
		}
		if (bTiming_g)
		startCmdTiming();
		if (!sKimmoData_g.bSilent)
		fprintf(stderr, "Loading synthesis lexicon from %s\n", arg );

		loadKimmoLexicon((unsigned char *)arg, KIMMO_SYNTHESIS,
				 &sSynthesisData_g);

		freeMemory(arg);
		if (bTiming_g)
		{
		stopCmdTiming();
		if (sSynthesisData_g.pszLexiconFile != NULL &&
							 !sKimmoData_g.bSilent)
			showCmdTiming();
		}
		}
	break;

	case KW_GRAMMAR:			/* LOAD GRAMMAR [<filename>] */
	arg = (char *)tokenizeString(NULL, szWhitespace_m);
	if (wantCmdHelp(arg,
"LOAD GRAMMAR [<file>] (default name is grammar.grm, default type is .grm)"))
		return;
	/*
	 *  Free the memory used by the existing grammar
	 */
	freePATRGrammar(&sKimmoData_g.sPATR);
	sSynthesisData_g.sPATR.pGrammar = sKimmoData_g.sPATR.pGrammar;
	memcpy(&sSynthesisData_g.sPATR, &sKimmoData_g.sPATR, sizeof(PATRData));
	arg = setCmdFilename( arg, "grammar.grm", ".grm");
	if (getCmdTakeLevel() != 0)
		{
		p = buildAdjustedFilename(arg, getCmdTakeFile(), NULL);
		freeMemory( arg );
		arg = p;
		}
	if (bTiming_g)
		startCmdTiming();
	if (!sKimmoData_g.bSilent)
		fprintf(stderr, "Loading grammar from %s\n", arg);
	sKimmoData_g.sPATR.cComment    = sKimmoData_g.cComment;
	sKimmoData_g.sPATR.iDebugLevel = 0;
	if (loadPATRGrammar((char *)arg, &sKimmoData_g.sPATR) != 0)
		{
		sKimmoData_g.bUsePATR     = TRUE;
		sSynthesisData_g.bUsePATR = TRUE;
		}
	freeMemory(arg);
	if (bTiming_g)
		{
		stopCmdTiming();
		if (sKimmoData_g.sPATR.pGrammar != NULL && !sKimmoData_g.bSilent)
		showCmdTiming();
		}
	/*
	 *  copy the Grammar section of the language data for the synthesis
	 *  data
	 */
	memcpy(&sSynthesisData_g.sPATR, &sKimmoData_g.sPATR, sizeof(PATRData));
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "LOAD", arg);
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
int set_val;

arg = (char *)tokenizeString(NULL,szWhitespace_m);
switch (lookupCmdKeyword( arg, asSetTable_m, iSetTableSize_m, ""))
	{
	case CMD_NULL:			/* empty command */
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SET" );
	break;
	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SET", arg);
	break;
	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP SET for more help\n");
	break;

	case KW_LIMIT:		/* SET LIMIT {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET LIMIT");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET LIMIT", arg);
		break;
		case CMD_HELP:
		break;

		case KW_ON:    sKimmoData_g.bLimit = TRUE;	break;
		case KW_OFF:   sKimmoData_g.bLimit = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET LIMIT", arg);
		break;
		}
	sSynthesisData_g.bLimit = sKimmoData_g.bLimit;
	break;

	case KW_RULES:		/* SET RULES {ON|OFF} {ALL|<numbers>} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET RULES");
		return;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET RULES", arg );
		return;
		case CMD_HELP:
		return;			/* already gave help */

		case KW_ON:		set_val = TRUE;		break;
		case KW_OFF:	set_val = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET RULES", arg);
		return;
		}
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	if (arg == (char *)NULL)
		{
		displayNumberedMessage(&sCmdMissingArgument_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SET RULES");
		break;
		}
	if (wantCmdHelp(arg, "Either keyword ALL or one or more rule numbers"))
		break;
	strlwr(arg);
	if (	(strcmp(arg,"all") == 0) ||
		(strcmp(arg,"al") == 0) ||
		(strcmp(arg,"a") == 0) )
		{
		/* set all of the rules */
		setKimmoRuleStatus(0, set_val, &sKimmoData_g);
		}
	else if (isascii(*arg) && isdigit(*arg))
		{
		unsigned i;
		/* set the specified rule(s) */
		do
		{
		i = atoi(arg);
		if ((i > 0) && (i <= sKimmoData_g.uiAutomataSize))
			setKimmoRuleStatus(i, set_val, &sKimmoData_g);
		else
			break;
		arg = (char *)tokenizeString(NULL, szWhitespace_m);
		} while ((arg != NULL) && isascii(*arg) && isdigit(*arg));
		if (arg != NULL)
		displayNumberedMessage(&sCmdBadArgument_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET RULE", arg);
		}
	else
		displayNumberedMessage(&sCmdBadArgument_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SET RULES", arg);
	break;

	case KW_TIMING:		/* SET TIMING {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TIMING");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TIMING", arg );
		break;
		case CMD_HELP:
		break;			/* already gave help */

		case KW_ON:		bTiming_g = TRUE;	break;
		case KW_OFF:	bTiming_g = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TIMING", arg);
		break;
		}
	break;

	case KW_TRACING:		/* SET TRACING {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword(arg, asOnOffTable_m, iOnOffTableSize_m, NULL))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TRACING");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TRACING", arg);
		break;
		case CMD_HELP:
		fprintf(stderr,
			"Either ON or OFF or a number between 0 and 3\n" );
		break;
		/*
		 *  ON => trace level 2, OFF => trace level 0
		 */
		case KW_ON:   sKimmoData_g.iTraceLevel = 2;  break;
		case KW_OFF:  sKimmoData_g.iTraceLevel = 0;  break;

		default:
		if (strcmp(arg,"0")==0)		sKimmoData_g.iTraceLevel = 0;
		else if (strcmp(arg,"1")==0)	sKimmoData_g.iTraceLevel = 1;
		else if (strcmp(arg,"2")==0)	sKimmoData_g.iTraceLevel = 2;
		else if (strcmp(arg,"3")==0)	sKimmoData_g.iTraceLevel = 3;
		else
			displayNumberedMessage(&sCmdBadArgument_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TRACING", arg);
		break;
		}
	sSynthesisData_g.iTraceLevel = sKimmoData_g.iTraceLevel;
	break;

	case KW_VERBOSE:		/* SET VERBOSE {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET VERBOSE");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET VERBOSE", arg);
		break;
		case CMD_HELP:
		break;			/* already gave help */

		case KW_ON:		bVerbose_g = TRUE;	break;
		case KW_OFF:	bVerbose_g = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET VERBOSE",arg);
		break;
		}
	break;

	case KW_ALIGNMENT:		/* SET ALIGNMENT {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET ALIGNMENT");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET ALIGNMENT", arg);
		break;
		case CMD_HELP:
		break;			/* already gave help */

		case KW_ON:		sKimmoData_g.bAlignment = TRUE;		break;
		case KW_OFF:	sKimmoData_g.bAlignment = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET ALIGNMENT", arg);
		break;
		}
	sSynthesisData_g.bAlignment = sKimmoData_g.bAlignment;
	break;

	case KW_GLOSS:		/* SET GLOSS {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET GLOSS");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET GLOSS", arg);
		break;
		case CMD_HELP:
		break;			/* already gave help */

		case KW_ON:		sKimmoData_g.sPATR.bGloss = TRUE;	break;
		case KW_OFF:	sKimmoData_g.sPATR.bGloss = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET GLOSS", arg);
		break;
		}
	break;

	case KW_WARNING:		/* SET WARNINGS {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET WARNINGS");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET WARNINGS", arg);
		break;
		case CMD_HELP:
		break;			/* already gave help */

		case KW_ON:		sKimmoData_g.bShowWarnings = TRUE;	break;
		case KW_OFF:	sKimmoData_g.bShowWarnings = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET WARNINGS", arg);
		break;
		}
	sSynthesisData_g.bShowWarnings = sKimmoData_g.bShowWarnings;
	break;


	case KW_GRAMMAR:		/* SET GRAMMAR {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET GRAMMAR");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET GRAMMAR", arg);
		break;
		case CMD_HELP:
		break;			/* already gave help */
		case KW_ON:
		if (sKimmoData_g.sPATR.pGrammar == (PATRGrammar *)NULL)
			displayNumberedMessage(&sNoGrammarLoaded_m,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0);
		else
			sKimmoData_g.bUsePATR = TRUE;
		break;
		case KW_OFF:
		sKimmoData_g.bUsePATR = FALSE;
		break;
		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET GRAMMAR", arg);
		break;
		}
	sSynthesisData_g.bUsePATR = sKimmoData_g.bUsePATR;
	break;

	case KW_AMBIGUITIES:		/* SET AMBIGUITIES <NUMBER> */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	if (arg == (char *)NULL)
		displayNumberedMessage(&sCmdMissingKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SET AMBIGUITIES");
	else if (*arg == '?')
		break;			/* already gave help */
	else if (isascii(*arg) && isdigit(*arg))
		sKimmoData_g.sPATR.iMaxAmbiguities = atoi(arg);
	else
		displayNumberedMessage(&sCmdBadArgument_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SET AMBIGUITIES", arg);
	break;

	case KW_FEATURES:		/* SET FEATURES {OFF|ON|TOP|ALL|FLAT|FULL} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asFeaturesTable_m, iFeaturesTableSize_m,
				  ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET FEATURES");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET FEATURES", arg);
		break;
		case CMD_HELP:
		break;			/* already gave help */

		case KW_ON:
		sKimmoData_g.sPATR.iFeatureDisplay |= PATR_FEATURE_ON;
		break;
		case KW_OFF:
		sKimmoData_g.sPATR.iFeatureDisplay &= ~PATR_FEATURE_ON;
		break;

		case KW_FLAT:
		sKimmoData_g.sPATR.iFeatureDisplay |= PATR_FEATURE_ON |
								 PATR_FEATURE_FLAT;
		break;
		case KW_FULL:
		sKimmoData_g.sPATR.iFeatureDisplay |=  PATR_FEATURE_ON;
		sKimmoData_g.sPATR.iFeatureDisplay &= ~PATR_FEATURE_FLAT;
		break;

		case KW_ALL:
		sKimmoData_g.sPATR.iFeatureDisplay |= PATR_FEATURE_ALL;
		break;
		case KW_TOP:
		sKimmoData_g.sPATR.iFeatureDisplay &= ~PATR_FEATURE_ALL;
		break;

		default:
		displayNumberedMessage(&sCmdBadArgument_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET FEATURES", arg);
		break;
		}
	break;


	case KW_TRIM_EMPTY:		/* SET TRIM-EMPTY-FEATURES {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TRIM-EMPTY-FEATURES");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TRIM-EMPTY-FEATURES", arg);
		break;
		case CMD_HELP:
		break;			/* already gave help */

		case KW_ON:
		sKimmoData_g.sPATR.iFeatureDisplay |= PATR_FEATURE_TRIM;
		break;
		case KW_OFF:
		sKimmoData_g.sPATR.iFeatureDisplay &= ~PATR_FEATURE_TRIM;
		break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TRIM-EMPTY-FEATURES", arg);
		break;
		}
	break;

	case KW_TREE:		/* SET TREE {FLAT|FULL|INDENTED|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asTreeTable_m, iTreeTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TREE");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TREE", arg);
		break;
		case CMD_HELP:			/* already gave help */
		break;

		case KW_OFF:
		sKimmoData_g.sPATR.eTreeDisplay = PATR_NO_TREE;
		break;
		case KW_FLAT:
		sKimmoData_g.sPATR.eTreeDisplay = PATR_FLAT_TREE;
		break;
		case KW_ON:
		case KW_FULL:
		sKimmoData_g.sPATR.eTreeDisplay = PATR_FULL_TREE;
		break;
		case KW_INDENTED:
		sKimmoData_g.sPATR.eTreeDisplay = PATR_INDENTED_TREE;
		break;
		case KW_XML:
		sKimmoData_g.sPATR.eTreeDisplay = PATR_XML_TREE;
		break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET TREE", arg);
		break;
		}
	break;


	case KW_UNIFICATION:		/* SET UNIFICATION {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET UNIFICATION");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET UNIFICATION", arg);
		break;
		case CMD_HELP:
		break;			/* already gave help */

		case KW_ON:
		sKimmoData_g.sPATR.bUnification = TRUE;
		break;
		case KW_OFF:
		sKimmoData_g.sPATR.bUnification = FALSE;
		break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET UNIFICATION", arg);
		break;
		}
	break;


	case KW_FAILURE:		/* SET FAILURES {ON|OFF} */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	switch (lookupCmdKeyword( arg, asOnOffTable_m, iOnOffTableSize_m, ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET FAILURE");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET FAILURE", arg);
		break;
		case CMD_HELP:
		break;			/* already gave help */

		case KW_ON:		sKimmoData_g.sPATR.bFailure = TRUE;	break;
		case KW_OFF:	sKimmoData_g.sPATR.bFailure = FALSE;	break;

		default:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   sKimmoData_g.bSilent,
					   sKimmoData_g.bShowWarnings,
					   sKimmoData_g.pLogFP,
					   NULL, 0,
					   "SET FAILURES",arg);
		break;
		}
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SET", arg);
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
unsigned k;

arg = (char *)tokenizeString(NULL,szWhitespace_m);
switch (lookupCmdKeyword( arg, asShowTable_m, iShowTableSize_m, ""))
	{
	case CMD_NULL:			/* empty */
	show_status();			/* SHOW == SHOW STATUS == STATUS */
	break;

	case CMD_AMBIGUOUS:			/* ambiguous */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SHOW", arg);
	break;

	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP SHOW for more help\n");
	break;

	case KW_LEXICON:		/* SHOW LEXICON <name> */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	if (wantCmdHelp(arg,"SHOW LEXICON section_name (no default)"))
		return;
	show_lexicon( (unsigned char *)arg);
	break;

	case KW_RULES:		/* SHOW RULE <number> */
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	if (wantCmdHelp(arg,"SHOW RULE rule_number (no default)"))
		return;
	if (arg == (char *)NULL)
		displayNumberedMessage(&sCmdMissingKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SHOW RULE");
	else if (   !isascii(*arg) || !isdigit(*arg) ||
			((k = atoi(arg)) <= 0) ||
			(k > sKimmoData_g.uiAutomataSize) )
		displayNumberedMessage(&sCmdBadArgument_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SHOW RULE", arg);
	else
		writeKimmoRule( k, stderr, &sKimmoData_g );
	break;

	case KW_STATUS:		/* SHOW STATUS */
	show_status();
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "SHOW", arg);
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
STATUS displays the names of the current rules, lexicon, grammar, and log files,\n\
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
(such as listing the files in the current directory) from within PC-KIMMO.\n\
If no system-level command is given on the line with the SYSTEM command,\n\
then PC-KIMMO is pushed into the background and a new system command processor\n\
(shell) is started.  Control is usually returned to PC-KIMMO in this case by\n\
typing EXIT as the operating system command.\n\
\n\
! (exclamation point) is a synonym for SYSTEM.\n\
", stderr);
}
#endif /*HAS_SUBPROCESS*/

/*****************************************************************************
 * NAME
 *    do_hlp_compare
 * ARGUMENTS
 *    key - pointer to next keyword for command, or NULL if none
 * DESCRIPTION
 *    Display information for the HELP COMPARE command.
 * RETURN VALUE
 *    none
 */
static void do_hlp_compare(key)
unsigned char *key;
{
switch (lookupCmdKeyword( (char *)key, asCompareTable_m, iCompareTableSize_m,
			  ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
[FILE] COMPARE GENERATE <file>   reads lexical forms, then produces and\n\
								 compares surface forms from a file\n\
[FILE] COMPARE RECOGNIZE <file>  reads surface forms, then produces and\n\
								 compares lexical forms from a file\n\
[FILE] COMPARE SYNTHESIZE <file> reads morphological forms, then produces and\n\
								 compares surface forms from a file\n\
[FILE] COMPARE PAIRS <file>      reads, produces, and compares both surface\n\
								 and lexical forms from a file\n\
\n\
COMPARE is a synonym for FILE COMPARE.\n\
\n\
Type HELP [FILE] COMPARE GENERATE, HELP [FILE] COMPARE RECOGNIZE, HELP [FILE]\n\
COMPARE SYNTHESIZE, or HELP [FILE] COMPARE PAIRS for more information.\n\
", stderr);
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP [FILE] COMPARE", key);
	break;

	case CMD_HELP:			/* ? */
	fputs("\
HELP [FILE] COMPARE without an argument displays a list of the [FILE] COMPARE\n\
commands\n", stderr);
	break;

	case KW_GENERATE:		/* FILE COMPARE GENERATE <infile> */
	fputs("\
[FILE] COMPARE GENERATE <file> reads lexical and surface forms from the\n\
specified file.  After reading a lexical form, PC-KIMMO generates the\n\
corresponding surface form(s) and compares the result to the surface form(s)\n\
read from the file.  If VERBOSE is ON, then each form from the file is echoed\n\
on the screen with a message indicating whether or not the surface forms\n\
generated by PC-KIMMO and read from the file are in agreement.  If VERBOSE\n\
", stderr);
	fputs("\
is OFF, then only the disagreements in surface form are displayed fully.\n\
Each result which agrees is indicated by a single dot written to the screen.\n\
\n\
The default filetype extension for FILE COMPARE GENERATE is \".gen\", and the\n\
default filename is \"data.gen\" (without the quotation marks, of course).\n\
\n\
COMPARE GENERATE <file> is a synonym for FILE COMPARE GENERATE <file>.\n\
", stderr);
	break;

	case KW_RECOGNIZE:		/* FILE COMPARE RECOGNIZE <infile> */
	fputs("\
[FILE] COMPARE RECOGNIZE <file> reads surface and lexical forms from the\n\
specified file.  After reading a surface form, PC-KIMMO produces any\n\
corresponding lexical form(s) and compares the result(s) to the lexical\n\
form(s) read from the file.  If VERBOSE is ON, then each form from the file\n\
is echoed on the screen with a message indicating whether or not the lexical\n\
forms produced by PC-KIMMO and read from the file are in agreement.  If\n\
", stderr);
	fputs("\
VERBOSE is OFF, then each result which agrees is indicated by a single dot\n\
written to the screen, and only disagreements in lexical forms are displayed\n\
fully.\n\
\n\
The default filetype extension for FILE COMPARE RECOGNIZE is \".rec\", and\n\
the default filename is \"data.rec\" (without the quotation marks, of course).\n\
\n\
COMPARE RECOGNIZE <file> is a synonym for FILE COMPARE RECOGNIZE <file>.\n\
", stderr);
	break;

	case KW_SYNTHESIZE:		/* FILE COMPARE SYNTHESIZE <infile> */
	fputs("\
[FILE] COMPARE SYNTHESIZE <file> reads morphological and surface forms from\n\
the specified file.  After reading a morphological form, PC-KIMMO produces\n\
any corresponding surface form(s) and compares the result(s) to the surface\n\
form(s) read from the file.  If VERBOSE is ON, then each form from the file\n\
is echoed on the screen with a message indicating whether or not the surface\n\
forms produced by PC-KIMMO and read from the file are in agreement.  If\n\
", stderr);
	fputs("\
VERBOSE is OFF, then each result which agrees is indicated by a single dot\n\
written to the screen, and only disagreements in surface forms are displayed\n\
fully.\n\
\n\
The default filetype extension for FILE COMPARE SYNTHESIZE is \".syn\", and\n\
the default filename is \"data.syn\" (without the quotation marks, of course).\n\
\n\
COMPARE SYNTHESIZE <file> is a synonym for FILE COMPARE SYNTHESIZE <file>.\n\
", stderr);
	break;

	case KW_PAIRS:		/* FILE COMPARE PAIRS <infile> */
	fputs("\
[FILE] COMPARE PAIRS <file> reads pairs of surface and lexical forms from the\n\
specified file.  After reading a lexical form, PC-KIMMO produces any\n\
corresponding surface form(s) and compares the result(s) to the surface\n\
form read from the file.  For each surface form, PC-KIMMO also produces any\n\
corresponding lexical form(s) and compares the result to the lexical form\n\
read from the file.  If VERBOSE is ON, then each form from the file is echoed\n\
", stderr);
	fputs("\
on the screen with a message indicating whether or not the forms produced by\n\
PC-KIMMO and read from the file are in agreement.  If VERBOSE is OFF, then\n\
each result which agrees is indicated by a single dot written to the screen,\n\
and only disagreements in lexical forms are displayed fully.\n\
", stderr);
	fputs("\
\n\
The default filetype extension for FILE COMPARE PAIRS is \".pai\", and the\n\
default filename is \"data.pai\" (without the quotation marks, of course).\n\
\n\
COMPARE PAIRS <file> is a synonym for FILE COMPARE PAIRS <file>.\n\
", stderr);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP [FILE] COMPARE", key);
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
switch (lookupCmdKeyword( (char*)key, asFileTable_m, iFileTableSize_m, ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
[FILE] COMPARE {GENERATE|RECOGNIZE|SYNTHESIZE|PAIRS} <infile>\n\
				read test data from a file, comparing computed results\n\
FILE GENERATE <infile> [<outfile>]\n\
				read lexical forms from a file, computing surface forms\n\
FILE RECOGNIZE <infile> [<outfile>]\n\
				read surface forms from a file, computing lexical forms\n\
FILE SYNTHESIZE <infile> [<outfile>]\n\
				read morphological forms from a file, computing surface forms\n\
\n\
Type HELP FILE COMPARE, HELP FILE GENERATE, HELP FILE RECOGNIZE, or HELP FILE\n\
SYNTHESIZE for more information.\n\
", stderr);
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP FILE", key);
	break;

	case CMD_HELP:			/* ? */
	fputs("\
HELP FILE without an argument displays a list of the FILE commands\n", stderr);
	break;

	case KW_COMPARE:		/* FILE COMPARE ...  (same as COMPARE ...) */
	do_hlp_compare(tokenizeString(NULL,szWhitespace_m));
	break;

	case KW_GENERATE:		/* FILE GENERATE <infile> [<outfile>] */
	fputs("\
FILE GENERATE <infile> [<outfile>] reads lexical forms from the specified\n\
input file and writes the corresponding computed surface forms either to\n\
the screen or to an optionally specified output file.\n\
\n\
This command behaves the same as GENERATE except that input comes from a file\n\
rather than the keyboard, and output may go to a file rather than the screen.\n\
", stderr);
	break;

	case KW_RECOGNIZE:		/* FILE RECOGNIZE <infile> [<outfile>] */
	fputs("\
FILE RECOGNIZE <infile> [<outfile>] reads surface forms from the specified\n\
input file and writes the corresponding computed lexical forms either to\n\
the screen or to an optionally specified output file.\n\
\n\
This command behaves the same as RECOGNIZE except that input comes from a\n\
file rather than the keyboard, and output may go to a file rather than the\n\
screen.\n\
", stderr);
	break;

	case KW_SYNTHESIZE:		/* FILE SYNTHESIZE <infile> [<outfile>] */
	fputs("\
FILE SYNTHESIZE <infile> [<outfile>] reads morphological forms from the\n\
specified input file and writes the corresponding computed surface forms\n\
either to the screen or to an optionally specified output file.\n\
\n\
This command behaves the same as SYNTHESIZE except that input comes from a\n\
file rather than the keyboard, and output may go to a file rather than the\n\
screen.\n\
", stderr);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP FILE", key);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    do_hlp_list
 * ARGUMENTS
 *    key - next keyword for HELP LIST command
 * DESCRIPTION
 *    Display information for the HELP LIST command.
 * RETURN VALUE
 *    none
 */
static void do_hlp_list(key)
unsigned char *key;
{
switch (lookupCmdKeyword( (char*)key, asListTable_m, iListTableSize_m, ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
LIST LEXICON  displays the names of all the (sub)lexicons currently loaded\n\
LIST RULES    displays the name and status (ON or OFF) of each of the rules\n\
			  currently loaded\n\
LIST PAIRS    displays all the feasible pairs for the current set of active\n\
			  rules\n\
\n\
Type HELP LIST LEXICON, HELP LIST RULES, or HELP LIST PAIRS for more\n\
information.\n\
", stderr);
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP LIST", key);
	break;

	case CMD_HELP:			/* ? */
	fputs("\
HELP LIST without an argument displays a list of the LIST commands\n", stderr);
	break;

	case KW_LEXICON:		/* LIST LEXICON */
	fputs("\
LIST LEXICON displays the names of all the current (sub)lexicons.  The order\n\
of presentation is the order in which they are referenced in the ALTERNATIONS\n\
declarations.\n\
", stderr);
	break;

	case KW_PAIRS:		/* LIST PAIRS */
	fputs("\
LIST PAIRS displays all the feasible pairs associated with the current set\n\
of active rules.  The feasible pairs are displayed as pairs of lines, with\n\
the lexical characters shown above the corresponding surface characters.\n\
", stderr);
	break;

	case KW_RULES:		/* LIST RULES */
	fputs("\
LIST RULES displays the names of the current rules, preceded by the number\n\
of the rule (used by the SET RULES command) and an indication of whether the\n\
rule is ON or OFF.\n\
", stderr);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP LIST", key);
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
switch (lookupCmdKeyword( (char*)key, asLoadTable_m, iLoadTableSize_m, ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
LOAD RULES [<file>]             loads a rules file\n\
LOAD LEXICON [<file>]           loads a lexicon file (rules must be loaded\n\
								first)\n\
LOAD SYNTHESIS-LEXICON [<file>] loads a synthesis lexicon file (rules must\n\
								be loaded first)\n\
LOAD GRAMMAR [<file>]           loads a grammar file\n\
\n\
L is a sufficient synonym for LOAD.\n\
\n\
Type HELP LOAD RULES, HELP LOAD LEXICON, HELP LOAD SYNTHESIS-LEXICON, or\n\
HELP LOAD GRAMMAR for more information.\n\
", stderr);
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP LOAD", key);
	break;

	case CMD_HELP:			/* ? */
	fputs("\
HELP LOAD without an argument displays a list of the LOAD commands\n", stderr);
	break;

	case KW_RULES:			/* LOAD RULES [<filename>] */
	fputs("\
LOAD RULES [<file>] erases any existing rules and reads a new set of rules\n\
from the specified file.\n\
\n\
The default filetype extension for LOAD RULES is \".rul\", and the\n\
default filename is \"rules.rul\" (without quotation marks, of course).\n\
\n\
A rules file can also be loaded by using the -r command line option when\n\
starting PC-KIMMO.\n\
\n\
L R [<file>] is a synonym for LOAD RULES [<file>].\n\
", stderr);
	break;

	case KW_LEXICON:			/* LOAD LEXICON [<filename>] */
	fputs("\
LOAD LEXICON [<file>] erases any existing analysis lexicon information and\n\
reads a new analysis lexicon from the specified file.  A rules file must be\n\
loaded before a lexicon file can be loaded.\n\
\n\
The default filetype extension for LOAD LEXICON is \".lex\", and the\n\
default filename is \"lexicon.lex\" (without quotation marks, of course).\n\
", stderr); fputs("\n\
An analysis lexicon file can also be loaded by using the -l command line\n\
option when starting PC-KIMMO.  This requires that a -r command line option\n\
also be used to load a rules file.\n\
\n\
L L [<file>] is a synonym for LOAD LEXICON [<file>].\n\
", stderr);
	break;

	case KW_SYNTHESIS:			/* LOAD SYNTHESIS-LEXICON [<file>] */
	fputs("\
LOAD SYNTHESIS-LEXICON [<file>] erases any existing synthesis lexicon\n\
information and reads a new synthesis lexicon from the specified file.  A\n\
rules file must be loaded before a synthesis lexicon file can be loaded.\n\
\n\
The default filetype extension for LOAD SYNTHESIS-LEXICON is \".lex\", and\n\
the default filename is \"lexicon.lex\" (without quotation marks, of course).\n\
", stderr); fputs("\n\
A synthesis lexicon file can also be loaded by using the -s command line\n\
option when starting PC-KIMMO.  This requires that a -r command line option\n\
also be used to load a rules file.\n\
\n\
L S [<file>] is a synonym for LOAD SYNTHESIS-LEXICON [<file>].\n\
", stderr);
	break;

	case KW_GRAMMAR:			/* LOAD GRAMMAR [<grammarname>] */
	fputs("\
LOAD GRAMMAR [<file>] erases any existing word grammar and reads a new\n\
word grammar from the specified file.\n\
\n\
The default filetype extension for LOAD GRAMMAR is \".grm\", and the\n\
default filename is \"grammar.grm\" (without quotation marks, of course).\n\
\n\
A grammar file can also be loaded by using the -g command line option when\n\
starting PC-KIMMO.\n\
\n\
L G [<file>] is a synonym for LOAD GRAMMAR [<file>].\n\
", stderr);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP LOAD", key);
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
switch (lookupCmdKeyword( (char*)key, asSetTable_m, iSetTableSize_m, ""))
	{
	case CMD_NULL:			/* empty command */
	fputs("\
SET ALIGNMENT {ON|OFF}         turns alignment display mode ON or OFF\n\
SET AMBIGUITIES <number>       sets ambiguities limit to <number>\n\
SET FAILURES {ON|OFF}          turns grammar failure mode ON or OFF\n\
SET FEATURES {TOP|ALL|OFF}     sets the feature display mode\n\
SET FEATURES {FULL|FLAT}       sets the feature display style\n\
", stderr); fputs("\
SET GLOSS {ON|OFF}             turns gloss display mode ON or OFF\n\
SET LIMIT {ON|OFF}             turns result limit ON or OFF\n\
SET GRAMMAR {ON|OFF}           turns grammar ON or OFF\n\
SET RULES {ON|OFF|ALL|<number(s)>} turns selected rules ON or OFF\n\
SET TIMING {ON|OFF}            turns timing mode ON or OFF\n\
", stderr); fputs("\
SET TRACING {ON|OFF|<level>}   sets the tracing level (ON = 2, OFF = 0)\n\
SET TREE {FULL|FLAT|INDENTED|OFF} sets the tree display style\n\
SET TRIM-EMPTY-FEATURES {ON|OFF} turns trimming of empty features ON or OFF\n\
SET UNIFICATION {ON|OFF}       turns unification ON or OFF\n\
SET VERBOSE {ON|OFF}           turns verbose comparison mode ON or OFF\n\
", stderr); fputs("\
SET WARNINGS {ON|OFF}          turns warning mode ON or OFF\n\
\n\
Type HELP SET ALIGNMENT, HELP SET AMBIGUITIES, HELP SET FAILURES,\n\
HELP SET FEATURES, HELP SET GLOSS, HELP SET LIMIT, HELP SET GRAMMAR,\n\
HELP SET RULES, HELP SET TIMING, HELP SET TRACING, HELP SET TREE,\n\
HELP SET TRIM-EMPTY-FEATURES, HELP SET UNIFICATION, HELP SET VERBOSE,\n\
", stderr); fputs("\
or HELP SET WARNINGS for more information.\n\
", stderr);
	break;

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP SET", key);
	break;

	case CMD_HELP:			/* ? */
	fputs("\
HELP SET without an argument displays a list of the SET commands\n", stderr);
	break;

	case KW_LIMIT:			/* SET LIMIT {ON|OFF} */
	fputs("\
SET LIMIT ON limits both the RECOGNIZE and GENERATE commands to a single\n\
result.  SET LIMIT OFF allows both the RECOGNIZE and GENERATE commands to\n\
produce multiple results.  (Default is OFF.)\n\
\n\
The LIMIT value affects the FILE RECOGNIZE, FILE GENERATE, and FILE COMPARE\n\
commands as well as the GENERATE and RECOGNIZE commands.\n\
", stderr);
	break;

	case KW_RULES:		/* SET RULES {ON|OFF} {ALL|<numbers>} */
	fputs("\
SET RULES ON ALL turns on all the rules.\n\
SET RULES OFF ALL turns off all the rules.\n\
\n\
SET RULES ON <number>... turns on the rule(s) selected by the number(s).\n\
SET RULES OFF <number>... turns off the rule(s) selected by the number(s).\n\
\n\
The numbers to use for the second form of the SET RULES command are those\n\
shown by the LIST RULES command.\n\
", stderr);
	break;

	case KW_TIMING:		/* SET TIMING {ON|OFF} */
	fputs("\
SET TIMING ON turns on timing mode.  SET TIMING OFF turns off timing mode.\n\
If timing mode is ON, then the elapsed time required to process either a\n\
RECOGNIZE or a GENERATE command is displayed when the command finishes.\n\
If timing mode is OFF, then the elapsed time is not shown.  (The default is\n\
OFF.)\n\
\n\
Timing affects the FILE RECOGNIZE, FILE GENERATE, and FILE COMPARE commands\n\
as well, but the timing is for the entire file, not for individual items.\n\
", stderr);
	break;

	case KW_TRACING:		/* SET TRACING {ON|OFF} */
	fputs("\
SET TRACING {<level>|ON|OFF} establishes the tracing level, which can be any\n\
integer value between 0 and 3.  SET TRACING ON sets the tracing level to 2.\n\
SET TRACING OFF sets the tracing level to 0.  If the tracing level is above\n\
zero, then either a RECOGNIZE or a GENERATE command causes a step-by-step\n\
trace of the operation of the algorithm to be displayed on the screen (and\n\
written to the log file, if one has been opened).  If the tracing level is\n\
zero, then only the final results are displayed.\n\
", stderr); fputs("\n\
Tracing affects the FILE RECOGNIZE, FILE GENERATE, and FILE COMPARE commands\n\
as well.  Be aware that tracing can cause voluminous output, especially at\n\
level 3!  (The default is OFF.)\n\
\n\
Note that tracing displays the inner workings of the rules and lexical\n\
components only, not the word grammar component.\n\
", stderr);
	break;

	case KW_VERBOSE:		/* SET VERBOSE {ON|OFF} */
	fputs("\
SET VERBOSE ON turns on verbose mode.  SET VERBOSE OFF turns it off.  If\n\
verbose mode is ON, then FILE COMPARE commands display on the screen both\n\
the surface and lexical forms read from the input file while processing the\n\
file.  If verbose mode is OFF, then only errors display the forms read from\n\
the file.  Good data is indicated by a single dot written to the screen.\n\
(The default is OFF.)\n\
", stderr);
	break;

	case KW_ALIGNMENT:		/* SET ALIGNMENT {ON|OFF} */
	fputs("\
SET ALIGNMENT ON turns on alignment display mode.  SET ALIGNMENT OFF turns\n\
off alignment mode. If alignment is ON, then RECOGNIZE commands display on\n\
the screen the results in a vertically aligned format: the first (top line)\n\
displays the lexical form of each morpheme; the second line displays the\n\
sublexicon names; and the third line displays glosses. If alignment mode is\n\
OFF, the results are displayed the usual way.  (The default is OFF.)\n\
", stderr);
	break;

	case KW_GLOSS:		/* SET GLOSS {ON|OFF} */
	fputs("\
SET GLOSS ON turns on gloss display mode.  SET GLOSS OFF turns off gloss\n\
display mode. If gloss display mode is ON, then glosses are displayed when\n\
the results of the recognizer are printed to the screen or to a file.  If\n\
gloss display mode is OFF, then no glosses are displayed.  (The default is\n\
ON.)\n\
", stderr);
	break;

	case KW_WARNING:		/* SET WARNING {ON|OFF} */
	fputs("\
SET WARNINGS ON turns on warning mode.  SET WARNINGS OFF turns off warning\n\
mode. If warning mode is ON, then warning messages are displayed on the \n\
output. If warning mode is OFF, then no warning messages are displayed.\n\
(Default is ON.)\n\
", stderr);
	break;

	case KW_GRAMMAR:		/* SET GRAMMAR {ON|OFF} */
	fputs("\
SET GRAMMAR ON turns on parsing with the word grammar.  Results from the\n\
rules and lexicon are parsed with the word grammar, if one is loaded.\n\
\n\
SET GRAMMAR OFF turns off the word grammar.  Results from the rules and\n\
lexicon are displayed without parsing with the word grammar, even if one\n\
is loaded.\n\
", stderr); fputs("\
\n\
Loading a grammar automatically sets GRAMMAR to ON.  SET GRAMMAR has no\n\
effect unless a word grammar is loaded (see HELP LOAD GRAMMAR).\n\
", stderr);
	break;

	case KW_AMBIGUITIES:		/* SET AMBIGUITIES <number> */
	fputs("\
SET AMBIGUITIES <number> limits the number of analyses produced by the word\n\
grammar to <number>.  The default is 10.\n\
\n\
Note that SET AMBIGUITIES has no effect unless a word grammar is loaded (see\n\
HELP LOAD GRAMMAR) and GRAMMAR is ON (see HELP SET GRAMMAR).\n\
", stderr);
	break;

	case KW_FEATURES:		/* SET FEATURES {TOP|ALL|OFF} */
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
", stderr);  fputs("\
Note that SET FEATURES has no effect unless a word grammar is loaded (see\n\
HELP LOAD GRAMMAR) and GRAMMAR is ON (see HELP SET GRAMMAR).\n\
", stderr);
	break;

	case KW_TREE:		/* SET TREE {FULL|FLAT|INDENTED|OFF} */
	fputs("\
SET TREE FULL displays the result of a word parse as a full tree.  (SET TREE\n\
ON is the same as SET TREE FULL.)  This is the default setting.\n\
\n\
SET TREE FLAT displays the result of a word parse as a flat tree structure\n\
in the form of a parenthesized list.\n\
\n\
SET TREE INDENTED displays the result of a word parse in an indented format\n\
sometimes called a \"northwest tree\").\n\
", stderr); fputs("\
\n\
SET TREE OFF prevents the display of any word parse trees.\n\
\n\
Note that SET TREE has no effect unless a word grammar is loaded (see HELP\n\
LOAD GRAMMAR) and GRAMMAR is ON (see HELP SET GRAMMAR).\n\
", stderr);
	break;

	case KW_TRIM_EMPTY:			/* SET TRIM-EMPTY-FEATURES {ON|OFF} */
	fputs("\
SET TRIM-EMPTY-FEATURES ON disables the display of empty feature values\n\
when displaying features (set HELP SET FEATURES).  This is the default.\n\
\n\
SET TRIM-EMPTY-FEATURES OFF enables the display of features with empty\n\
values.\n\
\n\
Note that SET TRIM-EMPTY-FEATURES has no effect unless a word grammar is\n\
loaded (see HELP LOAD GRAMMAR), GRAMMAR is ON (see HELP SET GRAMMAR), and\n\
FEATURES is not OFF (see HELP SET FEATURES).\n\
", stderr);
	break;

	case KW_UNIFICATION:		/* SET UNIFICATION {ON|OFF} */
	fputs("\
SET UNIFICATION ON turns on feature unification in parsing with a word\n\
grammar.  (This is the default setting.)\n\
\n\
SET UNIFICATION OFF turns off feature unification in parsing with a word\n\
grammar.  Only the constitutent structure rules are used; the feature\n\
contraints are ignored.\n\
\n\
Note that SET UNIFICATION has no effect unless a word grammar is loaded\n\
(see HELP LOAD GRAMMAR) and GRAMMAR is ON (see HELP SET GRAMMAR).\n\
", stderr);
	break;

	case KW_FAILURE:		/* SET FAILURES {ON|OFF} */
	fputs("\
SET FAILURES ON turns on grammar failure mode, enabling the display of\n\
the partial results of forms that fail the word grammar parse.  A form\n\
may fail the word grammar either by failing the feature constraints or\n\
by failing the constituent structure rules. In the latter case, a partial\n\
tree (bush) will be returned.\n\
\n\
", stderr); fputs("\
SET FAILURES OFF turns off grammar failure mode. (The default is OFF.)\n\
\n\
Note that SET FAILURES has no effect unless a word grammar is loaded (see\n\
HELP LOAD GRAMMAR) and that GRAMMAR is ON (see HELP SET GRAMMAR).\n\
", stderr);
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
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
switch (lookupCmdKeyword( (char*)key, asShowTable_m, iShowTableSize_m, ""))
	{
	case CMD_NULL:			/* empty */
	fputs("\
SHOW LEXICON <name>\n\
				displays the contents of the specified (sub)lexicon\n\
SHOW RULE <number>\n\
				displays the state of the specified rule\n\
SHOW STATUS     is a synonym for STATUS\n\
\n\
SHOW            without any argument is also a synonym for STATUS\n\
\n\
Type HELP SHOW LEXICON, HELP SHOW RULE, or HELP [SHOW] STATUS for more\n\
information.\n\
", stderr);
	break;

	case CMD_AMBIGUOUS:			/* ambiguous */
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP SHOW", key);
	break;

	case CMD_HELP:			/* ? */
	fputs("\
HELP SHOW without an argument displays a list of the SHOW commands\n", stderr);
	break;

	case KW_LEXICON:		/* SHOW LEXICON <name> */
	fputs("\
SHOW LEXICON <name> displays the contents of the indicated (sub)lexicon.\n\
For each lexical item, the lexical item is shown first followed by the\n\
lexical gloss enclosed in quotation marks.  The set of valid continuation\n\
(sub)lexicons is shown last on the line, enclosed in curly braces.\n\
", stderr);
	break;

	case KW_RULES:		/* SHOW RULE <number> */
	fputs("\
SHOW RULE <number> displays the specified rule.  First, its number,\n\
status (ON or OFF), and name are shown as in the LIST RULES command.\n\
If the rules is ON, then and feasible pairs associated with each column\n\
of the state table are displayed.  Each feasible pair is shown in the\n\
form Lexical-character:Surface-character.\n\
", stderr);
	break;

	case KW_STATUS:		/* SHOW STATUS */
	do_hlp_status();
	break;

	default:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
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

arg = (char *)tokenizeString(NULL,szWhitespace_m);
switch (lookupCmdKeyword( arg, asCommandTable_m, iCommandTableSize_m, ""))
	{
	case CMD_NULL:		/* barebones HELP command */
	fputs("\
CD         change the current directory\n\
CLEAR      erase any existing rules, lexicon, or grammar\n\
CLOSE      close the current log file\n\
COMPARE    compare prepared data from a file to results of processing data\n\
", stderr);
#ifdef HAS_SUBPROCESS
	fputs("\
DIRECTORY  list the files in the current directory\n\
EDIT       edit a file\n\
", stderr);
#endif /*HAS_SUBPROCESS*/
	fputs("\
EXIT       exit PC-KIMMO (same as QUIT)\n\
FILE       process data from a file\n\
GENERATE   process lexical form to produce surface form(s)\n\
HELP       display this list of commands\n\
LIST       list rule names, feasible pairs, or sublexicon names\n\
", stderr); fputs("\
LOAD       load rules or a lexicon or a word grammar from a file\n\
LOG        open a log file\n\
QUIT       quit PC-KIMMO (same as EXIT)\n\
RECOGNIZE  process surface form to produce lexical form(s)\n\
SAVE       save the current settings in a TAKE file\n\
", stderr); fputs("\
SET        set processing switches\n\
SHOW       show status, rule, or sublexicon\n\
STATUS     show current files and switch settings\n\
SYNTHESIZE process morphological form to produce surface form\n\
", stderr);
#ifdef HAS_SUBPROCESS
	fputs("\
SYSTEM     execute an operating system command or program\n\
", stderr);
#endif /*HAS_SUBPROCESS*/
	fputs("\
TAKE       take PC-KIMMO commands from a file\n\
\n\
For more information, type HELP with a specific command name.\
", stderr);
	break;

	case CMD_AMBIGUOUS:
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP", arg);
	break;

	case CMD_HELP:
	fputs("HELP without an argument displays a list of the commands\n",
			stderr );
	break;

	case KW_CLOSE:			/* CLOSE */
	fputs("\
CLOSE closes the log file opened by a LOG command.\n\
", stderr);
	break;

	case KW_COMPARE:			/* COMPARE ... */
	do_hlp_compare(tokenizeString(NULL,szWhitespace_m));
	break;

#ifdef HAS_SUBPROCESS
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
#ifdef DOS_FILESYSTEM
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

#ifdef HAS_SUBPROCESS
	case KW_DIRECTORY:			/* DIRECTORY */
	fputs("\
DIRECTORY lists the contents of the current directory.\n\
", stderr);
	break;
#endif /*HAS_SUBPROCESS*/

	case KW_FILE:			/* FILE ... */
	do_hlp_file(tokenizeString(NULL,szWhitespace_m));
	break;

	case KW_GENERATE:			/* GENERATE [<form>] */
	fputs("\
GENERATE [<lexical-form>] attempts to produce a surface form from a lexical\n\
form provided by the user.  If the command is typed without a form, then\n\
PC-KIMMO prompts the user for lexical forms with a special generator prompt,\n\
processing each form and asking for another until the user responds to the\n\
generator prompt with an empty line.\n\
", stderr);
	break;

	case KW_HELP:			/* HELP ... */
	fputs("\
HELP [<command-name>] displays a description of a command.  If HELP is typed\n\
by itself, PC-KIMMO displays a list of commands with short descriptions of\n\
each command.\n\
", stderr);
	break;

	case KW_LIST:			/* LIST ... */
	do_hlp_list(tokenizeString(NULL,szWhitespace_m));
	break;

	case KW_LOAD:			/* LOAD ... */
	do_hlp_load(tokenizeString(NULL,szWhitespace_m));
	break;

	case KW_LOG:			/* LOG [<filename>] */
	fputs("\
LOG [<file>] opens a log file.  Each item processed by a GENERATE, RECOGNIZE,\n\
SYNTHESIZE, COMPARE, or FILE command is recorded in the log file as well as\n\
being displayed on the screen.\n\
\n", stderr);
	fputs("\
If a filename is given on the same line as the LOG command, then that file\n\
is used for the log file.  Any previously existing file with the same name\n\
will be overwritten.  If no filename is provided, then the file pckimmo.log\n\
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
CLEAR erases all rules, lexicon, and grammar information, allowing the user\n\
to prepare to load information for a new language.  Strictly speaking, it\n\
is not needed since the LOAD RULES command erases all existing rules, the\n\
LOAD LEXICON command erases any existing lexicon, the LOAD SYNTHESIS-LEXICON\n\
command erases any existing synthesis lexicon, and the LOAD GRAMMAR command\n\
erases any existing grammar.\n\
", stderr);
	break;

	case KW_QUIT:			/* QUIT or EXIT */
	fputs("\
Either EXIT or QUIT stops PC-KIMMO.\n\
", stderr);
	break;

	case KW_RECOGNIZE:			/* RECOGNIZE [<form>] */
	fputs("\
RECOGNIZE [<surface-form>] attempts to produce lexical forms from a surface\n\
form provided by the user.  If the command is typed without a form, then\n\
PC-KIMMO prompts the user for surface forms with a special recognizer prompt,\n\
processing each form and asking for another until the user responds to the\n\
recognizer prompt with an empty line.\n\
", stderr);
	break;

	case KW_SAVE:			/* SAVE [<filename>] */
	fputs("\
SAVE <filename> writes LOAD and SET commands to the designated TAKE file\n\
that will restore the current state of the program.  If the file is not\n\
specified, the settings are written to PCKIMMO.TAK in the current directory.\n\
", stderr);
	break;

	case KW_SET:			/* SET ... */
	do_hlp_set(tokenizeString(NULL,szWhitespace_m));
	break;

	case KW_SHOW:			/* SHOW ... */
	do_hlp_show(tokenizeString(NULL,szWhitespace_m));
	break;

	case KW_STATUS:			/* STATUS */
	do_hlp_status();
	break;

	case KW_SYNTHESIZE:			/* SYNTHESIZE [<form>] */
	fputs("\
SYNTHESIZE [<morphological-form>] attempts to produce surface forms from a\n\
morphological form provided by the user.  If the command is typed without a\n\
form, then PC-KIMMO prompts the user for morphological forms with a special\n\
synthesizer prompt, processing each form and asking for another until the\n\
user responds to the synthesizer prompt with an empty line.\n\
", stderr);
	fputs("\n\
Note that the morphemes in the morphological form must be separated by\n\
spaces, and must match gloss entries loaded from the lexicon.  Also, the\n\
morphemes must be given in the proper order.\n\
", stderr);
	break;

#ifdef HAS_SUBPROCESS
	case KW_SYSTEM:			/* SYSTEM [<command>] */
	do_hlp_system();
	break;
#endif /*HAS_SUBPROCESS*/

	case KW_TAKE:			/* TAKE <filename> */
	fputs("\
TAKE [<file>] redirects command input to the specified file.\n\
\n\
The default filetype extension for TAKE is \".tak\", and the default\n\
filename is \"pckimmo.tak\" (without the quotation marks, of course).\n\
\n\
", stderr); fputs("\
TAKE files can be nested three deep.  That is, the user types TAKE file1,\n\
file1 contains the command TAKE file2, and file2 has the command TAKE file3.\n\
It would be an error for file3 to contain a TAKE command.  This should not\n\
prove to be a serious limitation.\n\
", stderr); fputs("\
\n\
A TAKE file can also be specified by using the -t command line option when\n\
starting PC-KIMMO.  In addition, PC-KIMMO tries to initialize itself with a\n\
default TAKE file when it starts, even before any command line options are\n\
handled.  It searches for these files, in order:\n\
", stderr);
#ifdef DOS_FILESYSTEM
fputs("\
		PCKIMMO.TAK\n\
		PC-KIMMO.TAK\n\
		<program path>\\PCKIMMO.TAK\n\
		<program_path>\\PC-KIMMO.TAK\n\
where <program_path> is the directory where PCKIMMO.EXE is stored.\n\
", stderr);
#endif
#ifdef MACINTOSH
fputs("\
		PCKIMMO.TAK\n\
		PC-KIMMO.TAK\n\
", stderr);
#endif
#ifdef UNIX
fputs("\
		pckimmo.tak\n\
		pc-kimmo.tak\n\
		$HOME/pckimmo.tak  (~/pckimmo.tak for csh users)\n\
		$HOME/pc-kimmo.tak (~/pc-kimmo.tak)\n\
		$HOME/.pckimmorc   (~/.pckimmorc)\n\
", stderr);
#endif
fputs("\
\n\
The SAVE command writes a TAKE file containing LOAD and SET commands to\n\
restore the current state of the program (see HELP SAVE).\n\
", stderr); fputs("\
", stderr);
	break;

	default:
#ifdef HAS_SUBPROCESS
	if (*arg == '!')
		do_hlp_system();
	else
#endif /*HAS_SUBPROCESS*/
	displayNumberedMessage(&sCmdBadKeyword_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   "HELP", arg);
	break;
	}
putc('\n', stderr);
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
cmd = getCmdString(command, szPCKimmoPrompt_m, sKimmoData_g.cComment);
if (cmd == NULL)
	return 0;			/* end of input == quit */
if (*cmd == '\0')
	return 1;			/* ignore empty commands */
/*
 *  parse the first keyword of the command
 */
savcmd = (char *)duplicateString(cmd);
arg = (char *)tokenizeString((unsigned char *)cmd,szWhitespace_m);
switch (lookupCmdKeyword( arg, asCommandTable_m, iCommandTableSize_m,
			  "Command"))
	{
	case CMD_NULL:			/* empty command */
	break;				/* (just ignore it) */

	case CMD_AMBIGUOUS:			/* ambiguous command */
	displayNumberedMessage(&sCmdAmbiguous_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   arg);
	break;

	case CMD_HELP:			/* ? - list of commands displayed */
	fprintf(stderr, "Type HELP for more help\n");
	break;

	case KW_CD:				/* CD, change directory */
	doCmdChdir( (char *)tokenizeString((unsigned char *)NULL,
					   szWhitespace_m) );
	break;

	case KW_CLOSE:			/* CLOSE */
	doCmdClose();
	sKimmoData_g.pLogFP           = NULL;
	sKimmoData_g.sPATR.pLogFP     = NULL;
	sSynthesisData_g.pLogFP       = NULL;
	sSynthesisData_g.sPATR.pLogFP = NULL;
	break;

	case KW_COMPARE:			/* COMPARE ... */
	do_compare();
	break;

#ifdef HAS_SUBPROCESS
	case KW_DIRECTORY:				/* DIRECTORY */
	/*
	 *  retrieve the saved copy of the original command string
	 *    and skip past the initial keyword
	 *  try to execute the rest of the command line as a system command
	 */
	if (wantCmdHelp((char *)tokenizeString(NULL,szWhitespace_m),"\
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
	doCmdEdit( (char *)tokenizeString((unsigned char *)NULL,
					  szWhitespace_m) );
	break;
#endif /*HAS_SUBPROCESS*/

	case KW_FILE:			/* FILE ... */
	do_file();
	break;

	case KW_GENERATE:			/* GENERATE [<form>] */
	do_generate( tokenizeString((unsigned char *)NULL,
					szWhitespace_m) );
	break;

	case KW_HELP:			/* HELP ... */
	do_help();
	break;

	case KW_LIST:			/* LIST ... */
	do_list();
	break;

	case KW_LOAD:			/* LOAD ... */
	do_load();
	break;

	case KW_LOG:			/* LOG [<filename>] */
	doCmdLog( (char *)tokenizeString((unsigned char *)NULL,
					 szWhitespace_m) );
	sKimmoData_g.pLogFP           = pCmdLogFP_g;
	sKimmoData_g.sPATR.pLogFP     = pCmdLogFP_g;
	sSynthesisData_g.pLogFP       = pCmdLogFP_g;
	sSynthesisData_g.sPATR.pLogFP = pCmdLogFP_g;
	break;

   case KW_CLEAR:			/* CLEAR */
	do_clear();
	break;

	case KW_QUIT:			/* QUIT or EXIT */
	freeMemory(savcmd);
	while (closeCmdTake() != 0)
		;
	return( 0 );

	case KW_RECOGNIZE:			/* RECOGNIZE [<form>] */
	do_recognize( tokenizeString((unsigned char *)NULL,
					 szWhitespace_m) );
	break;

	case KW_SAVE:			/* SAVE [<filename>] */
	do_save( (char *)tokenizeString((unsigned char *)NULL,
					szWhitespace_m) );
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

	case KW_SYNTHESIZE:			/* SYNTHESIZE [<form>] */
	do_synthesize( tokenizeString((unsigned char *)NULL,
				   (unsigned char *)NULL) );
	break;

#ifdef HAS_SUBPROCESS
	case KW_SYSTEM:			/* SYSTEM [<command>] */
	/*
	 *  retrieve the saved copy of the original command string
	 *    and skip past the initial keyword
	 *  try to execute the rest of the command line as a system command
	 */
#ifdef UNIX
	if (wantCmdHelp((char *)tokenizeString(NULL,szWhitespace_m),"\
SYSTEM [<command>] (default is subshell, type EXIT to return to PC-KIMMO)"))
#endif
#ifdef MSDOS
	if (wantCmdHelp((char *)tokenizeString(NULL,szWhitespace_m),"\
SYSTEM [<command>] (default is DOS shell, type EXIT to return to PC-KIMMO)"))
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
	arg = (char *)tokenizeString(NULL,szWhitespace_m);
	doCmdTake(arg);
	break;

	default:				/* invalid command */
#ifdef HAS_SUBPROCESS
	if (*savcmd == '!')		/* treat ! same as SYSTEM, except */
		{				/* that no space is needed before */
		doCmdSystem(savcmd+1);	/* the system command */
		break;
		}
#endif /*HAS_SUBPROCESS*/
	if (getCmdTakeLevel() != 0)
		{
		displayNumberedMessage(&sCmdErrorInTake_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0,
				   arg);
		closeCmdTake();
		}
	else
		displayNumberedMessage(&sCmdInvalid_g,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
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
 *    Find an initialization file for PC-KIMMO if one exists.
 *	1) pckimmo.tak
 *	2) pc-kimmo.tak
 *	3) MSDOS: <program_path>\pckimmo.tak
 *	   UNIX:  $HOME/pckimmo.tak
 *	4) MSDOS: <program_path>\pc-kimmo.tak
 *	   UNIX:  $HOME/pc-kimmo.tak
 *	5) UNIX:  $HOME/.pckimmorc
 * RETURN VALUE
 *    input FILE pointer, or NULL
 */
static FILE * find_ini_file()
{
FILE *fp;
#ifndef MACINTOSH
char *p;
#endif
static char *names[2] = { "pckimmo.tak", "pc-kimmo.tak" };

strcpy(szInitFile_m, names[0]);
fp = fopen(szInitFile_m, "r");
if (fp != (FILE *)NULL)
	return(fp);
strcpy(szInitFile_m, names[1]);
fp = fopen(szInitFile_m, "r");
if (fp != (FILE *)NULL)
	return(fp);
#ifdef DOS_FILESYSTEM
if (pszArgv0_g != NULL)
	{
	strncpy(szInitFile_m, pszArgv0_g, MAXLINELEN);
	szInitFile_m[MAXLINELEN] = NUL;
	p = strrchr(szInitFile_m, '\\');
	if (p != (char *)NULL)
	{
	++p;
	*p = NUL;
	strncat(szInitFile_m, names[0],
		sizeof(szInitFile_m) - strlen(szInitFile_m) - 1);
	fp = fopen(szInitFile_m, "r");
	if (fp != (FILE *)NULL)
		return(fp);
	*p = NUL;
	strncat(szInitFile_m, names[1],
		sizeof(szInitFile_m) - strlen(szInitFile_m) - 1);
	fp = fopen(szInitFile_m, "r");
	if (fp != (FILE *)NULL)
		return(fp);
	}
	}
#endif
#ifdef UNIX
p = getenv("home");
if (p == (char *)NULL)
	p = getenv("HOME");
if (p != (char *)NULL)
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
	if (fp != (FILE *)NULL)
		return(fp);
	*p = NUL;
	strncat(szInitFile_m, names[1],
		sizeof(szInitFile_m) - strlen(szInitFile_m) - 1);
	fp = fopen(szInitFile_m, "r");
	if (fp != (FILE *)NULL)
		return(fp);
	*p = NUL;
	strncat(szInitFile_m, ".pckimmorc",
		sizeof(szInitFile_m) - strlen(szInitFile_m) - 1);
	fp = fopen(szInitFile_m, "r");
	if (fp != (FILE *)NULL)
		return(fp);
	}
	}
#endif
return((FILE *)NULL);
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
char command[MAXLINELEN+1];
char *cmd;
FILE *fp;
unsigned linenum = 0;
#ifdef DOS_FILESYSTEM
char *cwd = NULL;
int drive = 0;
#endif
if (!sKimmoData_g.bSilent)
	fprintf(stderr, "Type ? for help\n");

bCmdSilentMessages_g                 = sKimmoData_g.bSilent;
bCmdShowWarnings_g                   = TRUE;
sKimmoData_g.bShowWarnings           = bCmdShowWarnings_g;
sKimmoData_g.sPATR.bShowWarnings     = bCmdShowWarnings_g;
sSynthesisData_g.bShowWarnings       = bCmdShowWarnings_g;
sSynthesisData_g.sPATR.bShowWarnings = bCmdShowWarnings_g;

sKimmoData_g.ppszAlphabet          = NULL;	/* no alphabet yet */
sKimmoData_g.uiAlphabetSize        = 0;
sKimmoData_g.pSubsets              = NULL;	/* no subsets yet */
sKimmoData_g.uiSubsetCount         = 0;
sKimmoData_g.pAutomata             = NULL;	/* no rules yet */
sKimmoData_g.uiAutomataSize        = 0;
sKimmoData_g.pFeasiblePairs        = NULL;	/* no feasible pairs yet */
sKimmoData_g.uiFeasiblePairsCount  = 0;
sKimmoData_g.pAlternations         = NULL;	/* no alternations yet */
sKimmoData_g.uiAlternationCount    = 0;
sKimmoData_g.pLexiconSections      = NULL;	/* no lexicon sections yet */
sKimmoData_g.uiLexiconSectionCount = 0;
sKimmoData_g.ppszFeatures          = NULL;	/* no feature names yet */
sKimmoData_g.uiFeatureCount        = 0;
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
if (fp != (FILE *)NULL)
	{
	if (!sKimmoData_g.bSilent)
	fprintf(stderr, "%sTAKE %s\n", szPCKimmoPrompt_m, szInitFile_m);
	while ((cmd = readLineFromFile(fp, &linenum,
				   sKimmoData_g.cComment)) != NULL)
	{
	cmd += strspn(cmd, (char *)szWhitespace_m);
	if (*cmd == NUL)
		continue;
	trimTrailingWhitespace(cmd);
	do_cmd(cmd);
	}
	fclose(fp);
	fp = (FILE *)NULL;
	}
/*
 *  handle the command line arguments
 */
/*
 *  -r <rulefile>
 */
r_file = setCmdFilename( r_file, (char *)NULL, ".rul");
if (r_file != (char *)NULL)
	{
	if (    (sKimmoData_g.pszRulesFile == NULL) ||
		(strcmp(r_file,sKimmoData_g.pszRulesFile) != 0))
	{
	strcpy(command, "LOAD RULES ");
	strncat(command, r_file, sizeof(command) - strlen(command) - 1);
	do_cmd(command);
	}
	freeMemory(r_file);
	r_file = (char *)NULL;
	}
/*
 *  -l <lexfile>
 */
l_file = setCmdFilename( l_file, (char *)NULL, ".lex" );
if (l_file != (char *)NULL)
	{
	if (    (sKimmoData_g.pszLexiconFile == NULL) ||
		(strcmp(l_file,sKimmoData_g.pszLexiconFile) != 0) )
	{
	strcpy(command, "LOAD LEXICON ");
	strncat(command, l_file, sizeof(command) - strlen(command) - 1);
	do_cmd(command);
	}
	freeMemory(l_file);
	l_file = (char *)NULL;
	}
/*
 *  -s <synlexfile>
 */
s_file = setCmdFilename( s_file, (char *)NULL, ".lex" );
if (s_file != (char *)NULL)
	{
	if (    (sSynthesisData_g.pszLexiconFile == NULL) ||
		(strcmp(s_file,sSynthesisData_g.pszLexiconFile) != 0) )
	{
	strcpy(command, "LOAD SYNTHESIS ");
	strncat(command, s_file, sizeof(command) - strlen(command) - 1);
	do_cmd(command);
	}
	freeMemory(s_file);
	s_file = (char *)NULL;
	}
/*
 *  -g <gramfile>
 */
g_file = setCmdFilename( g_file, (char *)NULL, ".grm" );
if (g_file != (char *)NULL)
	{
	if (    (sKimmoData_g.sPATR.pGrammar == NULL) ||
		(sKimmoData_g.sPATR.pszGrammarFile == NULL) ||
		(strcmp(g_file, sKimmoData_g.sPATR.pszGrammarFile) != 0) )
	{
	strcpy(command, "LOAD GRAMMAR ");
	strncat(command, g_file, sizeof(command) - strlen(command) - 1);
	do_cmd(command);
	}
	freeMemory(g_file);
	g_file = (char *)NULL;
	}
/*
 *  -t <cmdfile>
 *  we can just call do_cmd() as long as this is the last option/command
 */
t_file = setCmdFilename( t_file, (char *)NULL, ".tak");
if (t_file != (char *)NULL)
	{
	strcpy(command, "TAKE ");
	strncat(command, t_file, sizeof(command) - strlen(command) - 1);
	do_cmd(command);
	freeMemory(t_file);
	t_file = (char *)NULL;
	}
/*
 *  set up for error or SIGINT trapping
 */
if (setjmp(sCmdJmpBuf_g) != 0)
	{
	fputs("\nRETURNING TO PC-KIMMO COMMAND PROCESSING\n\n", stderr);
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
while ( do_cmd((char *)NULL) )
	;
#ifdef DOS_FILESYSTEM
/*
 * restore the current drive and directory
 */
if (cwd != (char *)NULL)
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
