/* KTEXT.C - KIMMO analysis/synthesis in an AMPLE framework
 ***************************************************************************
 * Edit history is at the end of VERSION.H
 *****************************************************************************
 * Copyright 1991, 2002 by SIL International.  All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include <setjmp.h>
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
extern VOIDP  memcpy  P((VOIDP dest, const VOIDP src, size_t n));
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strcpy  P((char * dest, const char * src));
extern char * strcat  P((char * dest, const char * src));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strchr  P((const char * s, int c));
extern char * strrchr P((const char * s, int c));
extern size_t strspn  P((const char * s, const char * accept));
extern char * strpbrk P((const char * s, const char * accept));
extern char * strtok  P((char * s, const char * delim));
extern size_t strlen  P((const char * s));
extern VOIDP  malloc  P((size_t size));
extern void   exit    P((int status));
#endif /*STDC_HEADERS*/
#ifndef EXIT_FAILURE
#define	EXIT_FAILURE	1	/* Failing exit status.  */
#define	EXIT_SUCCESS	0	/* Successful exit status.  */
#endif

extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;

#include "opaclib.h"
#include "record.h"
#include "template.h"
#include "strlist.h"
#include "change.h"
#include "kimmo.h"
#include "cmd.h"	/* for doCmdLog(), pCmdLogFP_g, pszCmdLogFile_g, ... */
#include "version.h"

static void reportKtextOutOfMemory P((size_t size));

#ifdef applec
#pragma segment S_lexicon
char *pszProgramPrompt_g = "KTEXT ";
#endif
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
#ifdef _WINDOWS
#define USE_CCOMMAND
char *pszProgramPrompt_g = "KTEXT ";
#define DIRSEPCHAR '\\'
#endif
#ifdef UNIX
#define DIRSEPCHAR '/'
#endif
#ifdef MSDOS
#define DIRSEPCHAR '\\'
#endif
/*
 *  maximum depth of reverse lexicon trie
 */
#define MAXLEV 6
/*
 *  macro to test a string for being a valid keyword in a lexicon file
 */
#define is_keyword(token) \
( (strcmp(token,"ALTERNATION")==0) || (strcmp(token,"FIELDCODE")==0) ||\
  (strcmp(token,"INCLUDE")==0) || (strcmp(token,"END")==0) ||\
  (strcmp(token,"FEATURES")==0) )
/*
 *  SIL library functions
 */
extern void free_code_table P((CodeTable *tab));
/*
 *  program version information
 */
#if (VERSION < 1) && (REVISION < 99)
#define TESTFORMAT     "Alpha test version\n"
#define COMPILEDFORMAT "Alpha test version compiled %s %s\n"
#define PATCHLEVELSEPCHAR 'a'
#else
#if (PATCHLEVEL < 0) || ((VERSION < 1) && (REVISION == 99))
#define TESTFORMAT     "Beta test version\n"
#define COMPILEDFORMAT "Beta test version compiled %s %s\n"
#define PATCHLEVELSEPCHAR 'b'
#else
#undef  TESTFORMAT
#define COMPILEDFORMAT "Compiled %s %s\n"
#define PATCHLEVELSEPCHAR '.'
#endif
#endif

const int	iKTextVersion_g    = VERSION;
const int	iKTextRevision_g   = REVISION;
#if PATCHLEVEL < 0
const int	iKTextPatchlevel_g = -(PATCHLEVEL);
#else
const int	iKTextPatchlevel_g = PATCHLEVEL;
#endif
const char	chKTextPatchsep_g  = PATCHLEVELSEPCHAR;
const char *	pszKTextDate_g     = DATE;
const char *	pszKTextYear_g     = YEAR;
#ifdef __DATE__
const char *	pszKTextCompileformat_g = COMPILEDFORMAT;
const char *	pszKTextCompiledate_g   = __DATE__;
const char *	pszKTextCompiletime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszKTextTestVersion_g = TESTFORMAT;
#else
const char *	pszKTextTestVersion_g = NULL;
#endif
#endif
/*
 *  error messages
 */
static NumberedMessage sNeedGrammar_m		= { ERROR_MSG,   541,
	"Cannot parse forms without a grammar" };
static NumberedMessage sNeedLexiconToRecognize_m    	= { ERROR_MSG,   804,
	"Cannot recognize forms without a lexicon" };
static NumberedMessage sNeedRulesToRecognize_m	= { ERROR_MSG,   806,
	"Cannot recognize forms without rules" };
static NumberedMessage sNeedLexiconToSynthesize_m	= { ERROR_MSG,   807,
	"Cannot synthesize forms without a synthesis lexicon" };
static NumberedMessage sNeedRulesToSynthesize_m	= { ERROR_MSG,   808,
	"Cannot synthesize forms without rules" };

/*****************************************************************************
 *  VARIABLES SET BY COMMAND LINE OPTIONS
 */
char * pszControlFile_g   = NULL;	/* -x <control file> */
char * pszControlFile1_g  = NULL;
char * pszInputFile_g     = NULL;	/* -i <input data file> */
char * pszOutputFile_g    = NULL;	/* -o <output file> */
int    bSynthesis_g       = 0;		/* -s   (do synthesis) */
int    bVerify_g          = 0;		/* -v   (verify synthesis) */
int    iDebugLevel_g      = 0;		/* -/   (debug output level) */
int    bCheckAllog_g      = FALSE;	/* -z or -Z */

/*****************************************************************************
 *  VARIABLES SET BY THE CONTROL FILE
 */
char *			pszTxtinCtlFile_g  = NULL;	/* \textin  */
char *			pszTxtoutCtlFile_g = NULL;	/* \textout */
char *			pszRuleFile_g      = NULL;	/* \rule    */
char *			pszLexiconFile_g   = NULL;	/* \lexicon */
char *			pszGrammarFile_g   = NULL;	/* \grammar */
Change *		pAnChanges_g       = NULL;	/* \ach */
Change *		pDcChanges_g       = NULL;	/* \dch */
StringList *		pCatPath_g         = NULL;	/* \cat */
PATRLabeledFeature *	pFdDefinitions_g   = NULL;	/* \fd  */
StringClass *		pStringClasses_g   = NULL;	/* \scl */

unsigned char szDefaultBarCodes_g[] = "abcdefghijklmnopqrstuvwxyz";
struct text_control TextControl_g = {
	NULL,	/* filename */
	NULL,	/* list of lowercase/uppercase pairs sorted by lowercase */
	NULL,	/* list of lowercase/uppercase pairs sorted by uppercase */
	NULL,	/* caseless letters */
	NULL,	/* list of input orthography changes */
	NULL,	/* list of output (orthography) changes */
	NULL,	/* list of format markers (fields) to include */
	NULL,	/* list of format markers (fields) to exclude */
	'\\',	/* initial character of format markers */
	'%',	/* character for marking ambiguities and failures (database) */
	'%',	/* character for marking ambiguities and failures (text) */
	'-',	/* character for marking decomposition */
	'|',	/* initial character of secondary format markers */
	szDefaultBarCodes_g,	/* characters for secondary format markers */
	1,		/* flag whether or not to capitalize individual characters */
	1,		/* flag whether or not to handle capitalization */
	100		/* maximum number of ambiguous decapitalizations to allow */
	};

/***************************************************************************
 *  OTHER GLOBAL VARIABLES
 */
static PATRMemory sLangPATRMemory_s =
{
	NULL, NULL, NULL, NULL, NULL, NULL, TRUE,
	NULL, NULL, 0,
	0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, { NULL, 0, 0, 0 },
	NULL, 0, 0, 0
};
KimmoData sLang_g = {	/* data for the current language */
	FALSE,		/* bLimit      - limit to a single good result */
	FALSE,		/* iTraceLevel - enable tracing of Kimmo processing */
	TRUE,		/* bUsePATR    - enable parsing with PATR functions */
	TRUE,		/* bSilent     - disable stderr messages */
	TRUE,		/* bShowWarnings - allow warning messages */
	FALSE,		/* bAlignment  - align recognizer output vertically */
	'<',		/* cGlossBegin - optionally surround morphnames */
	'>',		/* cGlossEnd       in synthesizer input strings */
	';',		/* cComment    - begins comment in input line */
	NULL,		/* pLogFP      - output log FILE */
	NULL,		/* alphabet */
	0,			/* size of the alphabet */
	'\0',		/* null character */
	'\0',		/* wild card character */
	'\0',		/* word boundary character */
	FALSE,		/* bTwoLCFile - rules loaded from a TwoLC type file */
	NULL,		/* alphabet subsets */
	0,			/* number of alphabet subsets */
	NULL,		/* array of automata (RULE) structures */
	0,			/* number of rules in automata */
	NULL,		/* feasible pairs */
	0,			/* number of feasible pairs */
	NULL,
	NULL,		/* array of alternations */
	0,			/* number of alternations stored */
	NULL,		/* sections of the lexicon */
	NULL,		/* first ("INITIAL") section of lexicon */
	0,			/* number of sections of the lexicon */
	NULL,		/* array of possible feature strings */
	0,			/* number of feature strings */
	NULL,
	{
	FALSE,	/* bFailure         - display parser failures */
	TRUE,	/* bUnification     - enable unification */
	PATR_FULL_TREE,		/*  - tree display mode */
	TRUE,	/* bGloss           - display glosses (if they exist) */
	FALSE,	/* bGlossesExist    - whether glosses exist */
		/* iFeatureDisplay  - feature display mode */
	PATR_FEATURE_ON | PATR_FEATURE_TRIM,
	TRUE,	/* bCheckCycles     - enable checking for parse cycles */
	TRUE,	/* bTopDownFilter   - enable top down filtering */
	10,	/* iMaxAmbiguities  - max number of ambiguities to show */
	0,	/* iDebugLevel      - degree of debugging output desired */
	PATR_DEFAULT_COMMENT,	/*  - begins a comment in an input line */
	TRUE,	/* bSilent          - disable messages to stderr */
	TRUE,	/* bShowWarnings    - enable warning messages */
	TRUE,	/* bPromoteDefAtoms - promote default atoms before parsing */
	FALSE,	/* bPropIsFeature   - AMPLE property is feature template */
#ifndef hab216
	0,  	/* eRootGlossFeature - use AMPLE root gloss as feature */
#endif /* hab216 */
	FALSE,	/* bRecognizeOnly   - settle for one successful parse */
	0,	/* iMaxProcTime     - maximum processing time for a parse */
	NULL,	/* pLogFP           - output log file */
	NULL,	/* pFinalPunc       - not used by Kimmo functions */
	NULL,	/* pszGrammarFile   - name of the grammar file */
	NULL,	/* pGrammar         - data loaded from the grammar file */
	0,
	NULL, NULL, NULL, NULL, NULL, NULL, /* not used by Kimmo functions */
#ifndef hab216
	NULL,
#endif /* hab216 */
	0, 0,	/* internal processing values */
	&sLangPATRMemory_s,
	0, 0, NULL,
	}
	};
KimmoData sSynLang_g = {		/* contains the synthesis lexicon */
	FALSE,		/* bLimit      - limit to a single good result */
	FALSE,		/* iTraceLevel - enable tracing of Kimmo processing */
	TRUE,		/* bUsePATR    - enable parsing with PATR functions */
	TRUE,		/* bSilent     - disable stderr messages */
	TRUE,		/* bShowWarnings - allow warning messages */
	FALSE,		/* bAlignment  - align recognizer output vertically */
	'<',		/* cGlossBegin - optionally surround morphnames */
	'>',		/* cGlossEnd       in synthesizer input strings */
	';',		/* cComment    - begins comment in input line */
	NULL,		/* pLogFP      - output log FILE */
	NULL,		/* alphabet */
	0,			/* size of the alphabet */
	'\0',		/* null character */
	'\0',		/* wild card character */
	'\0',		/* word boundary character */
	FALSE,		/* bTwoLCFile - rules loaded from a TwoLC type file */
	NULL,		/* alphabet subsets */
	0,			/* number of alphabet subsets */
	NULL,		/* array of automata (RULE) structures */
	0,			/* number of rules in automata */
	NULL,		/* feasible pairs */
	0,			/* number of feasible pairs */
	NULL,
	NULL,		/* array of alternations */
	0,			/* number of alternations stored */
	NULL,		/* sections of the lexicon */
	NULL,		/* first ("INITIAL") section of lexicon */
	0,			/* number of sections of the lexicon */
	NULL,		/* array of possible feature strings */
	0,			/* number of feature strings */
	NULL,
	{
	FALSE,	/* bFailure         - display parser failures */
	TRUE,	/* bUnification     - enable unification */
	PATR_FULL_TREE,		/*  - tree display mode */
	TRUE,	/* bGloss           - display glosses (if they exist) */
	FALSE,	/* bGlossesExist    - whether glosses exist */
		/* iFeatureDisplay  - feature display mode */
	PATR_FEATURE_ON | PATR_FEATURE_TRIM,
	TRUE,	/* bCheckCycles     - enable checking for parse cycles */
	TRUE,	/* bTopDownFilter   - enable top down filtering */
	10,	/* iMaxAmbiguities  - max number of ambiguities to show */
	0,	/* iDebugLevel      - degree of debugging output desired */
	PATR_DEFAULT_COMMENT,	/*  - begins a comment in an input line */
	TRUE,	/* bSilent          - disable messages to stderr */
	TRUE,	/* bShowWarnings    - enable warning messages */
	TRUE,	/* bPromoteDefAtoms - promote default atoms before parsing */
	FALSE,	/* bPropIsFeature   - AMPLE property is feature template */
#ifndef hab216
	0,  	/* eRootGlossFeature - use AMPLE root gloss as feature */
#endif /* hab216 */
	FALSE,	/* bRecognizeOnly   - settle for one successful parse */
	0,	/* iMaxProcTime     - maximum processing time for a parse */
	NULL,	/* pLogFP           - output log file */
	NULL,	/* pFinalPunc       - not used by Kimmo functions */
	NULL,	/* pszGrammarFile   - name of the grammar file */
	NULL,	/* pGrammar         - data loaded from the grammar file */
	1,
	NULL, NULL, NULL, NULL, NULL, NULL, /* not used by Kimmo functions */
#ifndef hab216
	NULL,
#endif /* hab216 */
	0, 0,	/* internal processing values */
	&sLangPATRMemory_s,
	0, 0, NULL,
	}
	};

char whiteSpace[] = " \t\n\v\f\r";	/* same chars as isspace() */
int num_words = 0;	/*  number of words read from the input file(s) */
char * emergency_memory = NULL;	/* memory to release if we run out of memory */
/*
 *  local function prototypes
 */
static void			synthesizeFile P((void));
static void			exit_ktext P((int status));
static StringList *		extract_path P((char *field));
static PATRLabeledFeature *	extractPATRLabeledFeature P((
							  char * pszField_in));
static int			loadControlFile P((char *fname));
static void			checkIfEmptyFeatureCat P((
						WordAnalysis * pAnalyses_in));

/*****************************************************************************
 * NAME
 *    display_ktext_header
 * DESCRIPTION
 *    Write the program header information to the screen (stderr).
 * RETURN VALUE
 *    none
 */
static void display_ktext_header()
{
fprintf(stderr, "KTEXT (analyze/synthesize words using PC-Kimmo functions)\n");
fprintf(stderr, "Version %d.%d%c%d (%s), Copyright %s SIL\n",
	iKTextVersion_g, iKTextRevision_g, chKTextPatchsep_g,
	iKTextPatchlevel_g, pszKTextDate_g, pszKTextYear_g);
#ifdef __DATE__
fprintf(stderr, pszKTextCompileformat_g,
	pszKTextCompiledate_g, pszKTextCompiletime_g);
#else
if (pszKTextTestVersion_g != NULL)
	fputs(pszKTextTestVersion_g, stderr);
#endif
fprintf(stderr, "with PC-Kimmo functions version %d.%d%c%d (%s)\n",
	iKimmoVersion_g, iKimmoRevision_g, cKimmoPatchSep_g,
	iKimmoPatchlevel_g, pszKimmoDate_g);
fprintf(stderr, "  and PC-PATR functions version %d.%d%c%d (%s)\n",
	iPATRVersion_g, iPATRRevision_g, cPATRPatchSep_g,
	iPATRPatchlevel_g, pszPATRDate_g);
#ifdef __GO32__
fprintf(stderr,
#ifdef __DJGPP__
"For 386 CPU (or better) under MS-DOS [compiled with DJGPP %d.%d/GNU C %d.%d]\n",
	__DJGPP__, __DJGPP_MINOR__,
#else
	"For 386 CPU (or better) under MS-DOS [compiled with DJGPP/GNU C %d.%d]\n",
#endif
	__GNUC__, __GNUC_MINOR__ );
#endif
}

/****************************************************************************
 * NAME
 *    exit_ktext
 * ARGUMENTS
 *    status - exit error status
 * DESCRIPTION
 *    exit the program, first displaying a message if necessary
 * RETURN VALUE
 *    none
 */
static void exit_ktext(status)
int status;
{
#ifdef MACINTOSH
fprintf(stderr, "\nUse the Quit command on the File menu (Command-Q)\n");
#endif
#ifdef QUICKWIN
fprintf(stderr, "\nUse the Exit command on the File menu (Control-C)\n");
#endif
if (bCheckAllog_g)
	{
	/* free memory to check for leaks during processing */
	freeMemory(pszOutputFile_g);
	if (pszCmdLogFile_g)
	doCmdClose();
	freeMemory(pszLexiconFile_g);
	freeMemory(pszRuleFile_g);
	freeMemory(pszTxtinCtlFile_g);
	freeMemory(pszGrammarFile_g);
	freeMemory(pszTxtoutCtlFile_g);
	freeMemory(pszControlFile_g);
	if (pAnChanges_g)
	freeChangeList(pAnChanges_g);
	if (pDcChanges_g)
	freeChangeList(pDcChanges_g);
	if (pCatPath_g)
	freeStringList(pCatPath_g);
	if (pFdDefinitions_g)
	{
	PATRLabeledFeature * plf;
	PATRLabeledFeature * plfNext;
	for ( plf = pFdDefinitions_g ; plf ; plf = plfNext )
		{
		plfNext = plf->pNext;
		freeMemory(plf->pszLabel);
		freePATRFeature(plf->pFeature, &sLang_g.sPATR);
		freeMemory(plf);
		}
	}
	if (pStringClasses_g != NULL)
	freeStringClasses(pStringClasses_g);
	if (TextControl_g.pszBarCodes == szDefaultBarCodes_g)
	TextControl_g.pszBarCodes = NULL;
	resetTextControl( &TextControl_g );
	freeKimmoRules(&sLang_g);
	freeKimmoLexicon(&sLang_g);
	freePATRGrammar(&sLang_g.sPATR);
	freePATRInternalMemory(&sLang_g.sPATR);
	freeKimmoLexicon(&sSynLang_g);
	if (emergency_memory != (char *)NULL)
	{
	free(emergency_memory);
	emergency_memory = (char *)NULL;
	}
	}
exit(status);
}

/*****************************************************************************
 * NAME
 *    isReadyToRecognize
 * DESCRIPTION
 *    check whether the appropriate data has been loaded for applying the
 *    recognizer function, displaying error messages as needed
 * RETURN VALUE
 *    TRUE if ready to recognize, FALSE if more data is needed
 */
static int isReadyToRecognize()
{
if (sLang_g.ppszAlphabet == NULL)
	{
	if (!sLang_g.bSilent)
	displayNumberedMessage(&sNeedRulesToRecognize_m,
				   sLang_g.bSilent, sLang_g.bShowWarnings,
				   sLang_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
if (sLang_g.pInitialLexicon == NULL)
	{
	if (!sLang_g.bSilent)
	displayNumberedMessage(&sNeedLexiconToRecognize_m,
				   sLang_g.bSilent, sLang_g.bShowWarnings,
				   sLang_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
if (sLang_g.bUsePATR && (sLang_g.sPATR.pGrammar == NULL))
	{
	if (!sLang_g.bSilent)
	displayNumberedMessage(&sNeedGrammar_m,
				   sLang_g.bSilent, sLang_g.bShowWarnings,
				   sLang_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
return TRUE;
}

/*****************************************************************************
 * NAME
 *    isReadyToSynthesize
 * DESCRIPTION
 *    check whether the appropriate data has been loaded for applying the
 *    synthesizer function, displaying error messages as needed
 * RETURN VALUE
 *    TRUE if ready to synthesize, FALSE if more data is needed
 */
static int isReadyToSynthesize()
{
if (sSynLang_g.ppszAlphabet == NULL)
	{
	if (!sSynLang_g.bSilent)
	displayNumberedMessage(&sNeedRulesToSynthesize_m,
				   sLang_g.bSilent, sLang_g.bShowWarnings,
				   sLang_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
if (sSynLang_g.pInitialLexicon == NULL)
	{
	if (!sSynLang_g.bSilent)
	displayNumberedMessage(&sNeedLexiconToSynthesize_m,
				   sLang_g.bSilent, sLang_g.bShowWarnings,
				   sLang_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
return TRUE;
}

/****************************************************************************
 * NAME
 *    usage
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Print a short description of the command line usage of this program.
 * RETURN VALUE
 *    none
 */
static void usage()
{
display_ktext_header();
fputs("\n\
Usage:  ktext [options]\n\
	-c char      make char the comment character for the control files\n\
				 (default is ;)\n\
	-q           work quietly (no unnecessary screen output)\n\
	-s           synthesis mode (default is analysis)\n\
	-v           for synthesis, verify each result with a word parse\n\
", stderr );
fputs("\
	-x ctlfile   specify the KTEXT control file (default is ktext.ctl)\n\
	-i infile    specify the input file (required: no default)\n\
	-o outfile   specify the output file (default is based on infile)\n\
	-l logfile   specify the KTEXT log file (default is none)\n\
", stderr );
}

/****************************************************************************
 * NAME
 *    parse_cmd_line
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - pointer to array of command line arguments
 * DESCRIPTION
 *    Handle the command line arguments for PC-KIMMO.
 * RETURN VALUE
 *    none
 */
static void parse_cmd_line( argc, argv )
int argc;
char **argv;
{
int	k;
int	errflag = 0;
char *	p;
char *	q;
VOIDP	trap_address = NULL;
int	trap_count = 0;
char *	s;
char *	pszLogFile = NULL;
char *	pszOutputFile = NULL;

pszCmdProgramName_g = "ktext";
while ((k = getopt(argc, argv, "c:i:o:l:x:hqsv/z:Z:")) != EOF)
	{
	switch (k)
	{
	case 'c':		/* comment character */
		sLang_g.cComment    = *optarg;
		sSynLang_g.cComment = *optarg;
		break;

	case 'i':		/* input data filename */
		pszInputFile_g = optarg;
		break;

	case 'l':		/* log filename */
		pszLogFile = optarg;
		break;

	case 'o':		/* output filename */
		pszOutputFile = optarg;
		break;

	case 'x':		/* control filename */
		pszControlFile1_g = optarg;
		break;

	case 'h':		/* help flag */
		usage();
		exit_ktext(EXIT_SUCCESS);
		break;

	case 'q':		/* work quietly */
		sLang_g.bSilent = TRUE;
		sLang_g.sPATR.bSilent = TRUE;
		sSynLang_g.bSilent = TRUE;
		sSynLang_g.sPATR.bSilent = TRUE;
		break;

	case 's':		/* synthesis flag */
		bSynthesis_g = 1;
		break;

	case 'v':		/* verify synthesis with word parse */
		bVerify_g = 1;
		break;

	case '/':		/* standard secret debugging option */
		++iDebugLevel_g;
		break;

	case 'z':		/* memory allocation trace filename */
		setAllocMemoryTracing(optarg);
		bCheckAllog_g = TRUE;
		break;

	case 'Z':		/* memory allocation trap address,count */
		trap_address = (VOIDP)strtoul(optarg, &s, 0);
		if (trap_address != (VOIDP)NULL)
		{
		if (*s == ',')
			trap_count = (int)strtoul(s+1, NULL, 10);
		if (trap_count == 0)
			trap_count = 1;
		setAllocMemoryTrap(trap_address, trap_count);
		}
		bCheckAllog_g = TRUE;
		break;

	default:
		++errflag;
		break;
	}
	}
if (pszLogFile)
	{
	doCmdLog( pszLogFile );
	sLang_g.pLogFP          = pCmdLogFP_g;
	sLang_g.sPATR.pLogFP    = sLang_g.pLogFP;
	sSynLang_g.pLogFP       = sLang_g.pLogFP;
	sSynLang_g.sPATR.pLogFP = sLang_g.pLogFP;
	}
if (pszOutputFile)
	pszOutputFile_g = duplicateString(pszOutputFile);
if (pszControlFile1_g == NULL)
	pszControlFile1_g = "ktext.ctl";
if (pszInputFile_g == NULL)
	{
	fprintf(stderr, "KTEXT: missing input file (-i filename)\n");
	++errflag;
	}
else
	{
	if (pszOutputFile_g == NULL)
	{
	/*
	 *  copy the input filename
	 */
	pszOutputFile_g = allocMemory(strlen(pszInputFile_g)+5);
	strcpy(pszOutputFile_g, pszInputFile_g);
	/*
	 *  move past all directory/drive information
	 */
	for (q = pszOutputFile_g ; (p = strpbrk(q, ":/\\")) != NULL ; q = p+1)
		;
	/*
	 *  replace the type extension (if any) with an appropriate value
	 */
	p = strrchr(q, '.');
	if (p != NULL)
		*p = '\0';
	if (bSynthesis_g)
		strcat(pszOutputFile_g, ".syn");
	else
		strcat(pszOutputFile_g, ".ana");
	}
	if (strcmp(pszInputFile_g, pszOutputFile_g) == 0)
	{
	fprintf(stderr,
		"KTEXT: input and output filenames must be different!\n");
	++errflag;
	}
	}
if (errflag)
	{
	usage();
	exit_ktext(EXIT_FAILURE);
	}
if (!sLang_g.bSilent)
	display_ktext_header();
}

/*****************************************************************************
 * NAME
 *    extract_path
 * DESCRIPTION
 *    extract a feature path delimited by <> from the input field
 * RETURN VALUE
 *    pointer to a copy of the feature path stored as a list of strings
 */
static StringList *extract_path(field)
char *field;
{
StringList *path, *lastp, *slp;
char *p, *q;
unsigned length;
int begun = 0, done = 0;

path = (StringList *)NULL;
lastp = (StringList *)NULL;
for ( p = field ; *p ; ++p )
	{
	if (*p == '<')
	begun = 1;
	else if (*p == '>')
	{
	done = 1;
	break;
	}
	else if (begun)
	{
	while (*p && isascii(*p) && isspace(*p))
		++p;
	if (*p == '\0')
		continue;
	if (*p == '>')
		{
		done = 1;
		break;
		}
	q = p;
	while (*p && !(isascii(*p) && isspace(*p)) && (*p != '>'))
		++p;
	length = p - q;
	slp = allocMemory(sizeof(StringList));
	slp->pszString = allocMemory(length + 1);
	memcpy(slp->pszString, q, length);
	slp->pszString[length] = '\0';
	if (path == (StringList *)NULL)
		path = slp;
	else
		lastp->pNext = slp;
	lastp = slp;
	if (*p == '\0')
		continue;
	if (*p == '>')
		{
		done = 1;
		break;
		}
	}
	}
return( path );
}

/*****************************************************************************
 * NAME
 *    extractPATRLabeledFeature
 * ARGUMENTS
 *    pszField_in - pointer to the field in the control file stored as a string
 * DESCRIPTION
 *    parse the field to fill in a definition for mapping from features to
 *    atomic names
 * RETURN VALUE
 *    pointer to the newly created mapping data, or NULL if an error occurs
 */
static PATRLabeledFeature * extractPATRLabeledFeature(pszField_in)
char * pszField_in;
{
char *			p;
PATRFeature *		pFeature;
PATRLabeledFeature *	pNewFdDef;

p = strpbrk(pszField_in, whiteSpace);
if (p == NULL)
	return( NULL );

*p++ = NUL;
pFeature = parsePATRFeatureString(p, &sLang_g.sPATR);
if (pFeature == NULL)
	return( NULL );

pNewFdDef = (PATRLabeledFeature *)allocMemory(sizeof(PATRLabeledFeature));
pNewFdDef->pszLabel = duplicateString(pszField_in);
pNewFdDef->pFeature = pFeature;
pNewFdDef->pNext    = NULL;
return( pNewFdDef );
}

/****************************************************************************
 * NAME
 *    loadControlFile
 * ARGUMENTS
 *    fname - name of the control
 * DESCRIPTION
 *    Load the control file.
 * RETURN VALUE
 *    zero if successful, -1 if error occurs
 */
static int loadControlFile(fname)
char *fname;
{
FILE *			fp;
char *			recp;
char *			rp;
char *			end;
int			code;
Change *	an_tail;
Change *	dc_tail;
Change *	cc;
static char		errhead[] = "\nLOAD CONTROL: ";
PATRLabeledFeature *	fdp;
/*
 *  control code table
 */
static CodeTable ctl_codes =
	{
	"\
\\textin\0T\0\
\\rules\0R\0\
\\lexicon\0L\0\
\\grammar\0G\0\
\\scl\0S\0\
\\ach\0A\0\
\\dch\0D\0\
\\cat\0c\0\
\\fd\0f\0\
\\textout\0t\0\
\\rd\0r\0\
",
	11,
	NULL
	};

fp = fopen(fname, "r");
if (fp == (FILE *)NULL)
	return( -1 );
recp = readStdFormatRecord(fp,
			   &ctl_codes,
			   sLang_g.cComment,
			   NULL);
fclose(fp);
if (recp == (char *)NULL)
	{
	cleanupAfterStdFormatRecord();
	return( 0 );
	}
/*
 *  get the information from the record
 */
if (pStringClasses_g != NULL)
	{				/* initialize the string classes */
	freeStringClasses(pStringClasses_g);
	pStringClasses_g = NULL;
	}
dc_tail = an_tail = (Change *)NULL;
for ( rp = recp ; (rp != (char *)NULL) && (*rp != NUL) ; )
	{
	code = *rp++;		/* grab the table code */
	while (isascii(*rp) && isspace(*rp))
	++rp;
	switch (code)
	{
	case 'T':		/* \textin - text input control file */
		end = rp + strlen(rp);
		if (!bSynthesis_g)
		{
		if (pszTxtinCtlFile_g != NULL)
			{
			printf(
	   "%sText input control file already set - ignoring this \\textin field",
			   errhead );
			}
		else if (*rp == NUL)
			printf("%sEmpty text input control file (\\textin) field",
			   errhead );
		else
			{
			rp = strtok(rp, whiteSpace);
			if (rp != (char *)NULL)
			pszTxtinCtlFile_g = buildAdjustedFilename(rp, fname,
								  ".ctl");
			}
		}
		rp = end;
		break;

	case 'R':		/* \rules - PC-KIMMO rules file */
		end = rp + strlen(rp);
		if (pszRuleFile_g != NULL)
		{
		printf(
		   "%sRules file already set - ignoring this \\rules field",
			   errhead );
		}
		else if (*rp == NUL)
		printf("%sEmpty rules file (\\rules) field",
			   errhead );
		else
		{
		rp = strtok(rp, whiteSpace);
		if (rp != (char *)NULL)
			pszRuleFile_g = buildAdjustedFilename(rp, fname, ".rul");
		}
		rp = end;
		break;

	case 'L':		/* \lexicon - PC-KIMMO lexicon file */
		end = rp + strlen(rp);
		if (pszLexiconFile_g != NULL)
		{
		printf(
		  "%sLexicon file already set - ignoring this \\lexicon field",
			   errhead );
		}
		else if (*rp == NUL)
		printf("%sEmpty lexicon file (\\lexicon) field",
			   errhead );
		else
		{
		rp = strtok(rp, whiteSpace);
		if (rp != (char *)NULL)
			pszLexiconFile_g = buildAdjustedFilename(rp, fname,
								 ".lex");
		}
		rp = end;
		break;

	case 'G':		/* \grammar - PC-KIMMO grammar file */
		end = rp + strlen(rp);
		if (!bSynthesis_g || bVerify_g)
		{
		if (pszGrammarFile_g != NULL)
			{
			printf(
		 "%sGrammar file already set - ignoring this \\grammar field",
			   errhead );
			}
		else if (*rp == NUL)
			printf("%sEmpty grammar file (\\grammar) field",
			   errhead );
		else
			{
			rp = strtok(rp, whiteSpace);
			if (rp != (char *)NULL)
			pszGrammarFile_g = buildAdjustedFilename(rp, fname,
								 ".grm");
			}
		}
		rp = end;
		break;

	case 'S':               /* \scl - string class definition */
		end = rp + strlen(rp);
		pStringClasses_g = addStringClass(rp, pStringClasses_g);
		rp = end;
		break;

	case 'A':		/* \ach - analysis field change */
		end = rp + strlen(rp);
		if (!bSynthesis_g)
		{
		cc = parseChangeString(rp, pStringClasses_g);
		if (cc != (Change *)NULL)
			{               /* link change to end of list */
			if (pAnChanges_g == (Change *)NULL)
			pAnChanges_g = cc;
			else
			an_tail->pNext = cc;
			an_tail = cc;
			}
		}
		rp = end;
		break;

	case 'D':		/* \dch - decomposition field change */
		end = rp + strlen(rp);
		if (!bSynthesis_g)
		{
		cc = parseChangeString(rp, pStringClasses_g);
		if (cc != (Change *)NULL)
			{               /* link change to end of list */
			if (pDcChanges_g == (Change *)NULL)
			pDcChanges_g = cc;
			else
			dc_tail->pNext = cc;
			dc_tail = cc;
			}
		}
		rp = end;
		break;

	case 'c':               /* \cat - category feature path */
		end = rp + strlen(rp);
		if (!bSynthesis_g)
		{
		if (pCatPath_g != (StringList *)NULL)
			printf(
			"%sCategory path already set - ignoring this \\cat field",
			   errhead );
		else
			pCatPath_g = extract_path( rp );
		}
		rp = end;
		break;

	case 'f':               /* \fd - feature name and definition */
		end = rp + strlen(rp);
		if (!bSynthesis_g)
		{
		fdp = extractPATRLabeledFeature( rp );
		if (fdp != NULL)
			{
			fdp->pNext = pFdDefinitions_g;
			pFdDefinitions_g = fdp;
			}
		else
			printf(
			  "Warning: invalid \\fd field in the control file\n");
		}
		rp = end;
		break;

	case 't':		/* \textout - text output control file */
		end = rp + strlen(rp);
		if (bSynthesis_g)
		{
		if (pszTxtoutCtlFile_g != NULL)
			{
			printf(
	 "%sText output control file already set - ignoring this \\textout field",
			   errhead );
			}
		else if (*rp == NUL)
			printf(
			 "%sEmpty text output control file (\\textout) field",
			   errhead );
		else
			{
			rp = strtok(rp, whiteSpace);
			if (rp != (char *)NULL)
			pszTxtoutCtlFile_g = buildAdjustedFilename(rp, fname,
								   ".ctl");
			}
		}
		rp = end;
		break;

	case 'r':		/* \rd - root delimiters */
		end = rp + strlen(rp);
		if (bSynthesis_g)
		{
		if (*rp == NUL)
			{
			printf(
		  "Empty Root delimiter field: keeping old values (%c, %c)\n",
				   sSynLang_g.cGlossBegin, sSynLang_g.cGlossEnd);
			}
		else
			{
			sSynLang_g.cGlossBegin = *rp++;
			rp += strspn(rp, whiteSpace);
			if (*rp == NUL)
			{
			printf(
			"Setting Root end delimiter to %c (same as Root begin)\n",
				   sSynLang_g.cGlossBegin);
			sSynLang_g.cGlossEnd = sSynLang_g.cGlossBegin;
			}
			else
			sSynLang_g.cGlossEnd = *rp;
			}
		}
		rp = end;
		break;

	} /* end switch */
	while (*rp++ != NUL)	/* skip rest of this entry in the record */
	;
	} /* end for */

cleanupAfterStdFormatRecord();
return( 0 );
}

/****************************************************************************
 * NAME
 *    initialize
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Load the control files.
 * RETURN VALUE
 *    none
 */
static void initialize()
{
/*
 *  load the control file
 */
pszControlFile_g = setCmdFilename( pszControlFile1_g, "ktext.ctl", ".ctl");
if (loadControlFile(pszControlFile_g) < 0)
	{
	fprintf(stderr, "KTEXT: Cannot load control file %s\n", pszControlFile_g);
	exit_ktext(EXIT_FAILURE);
	}
/*
 *  load the (optional) text control file
 */
if (!bSynthesis_g && (pszTxtinCtlFile_g != (char *)NULL))
	{
	if (loadIntxCtlFile(pszTxtinCtlFile_g, sLang_g.cComment,
			&TextControl_g, &pStringClasses_g) != 0)
	{
	fprintf(stderr, "KTEXT: Cannot load text input control file %s\n",
		pszTxtinCtlFile_g);
	exit_ktext(EXIT_FAILURE);
	}
	fputc('\n', stderr);
	}
else if (bSynthesis_g && (pszTxtoutCtlFile_g != (char *)NULL))
	{
	if (loadOutxCtlFile(pszTxtoutCtlFile_g, sLang_g.cComment,
			&TextControl_g, &pStringClasses_g) != 0)
	{
	fprintf(stderr, "KTEXT: Cannot load text output control file %s\n",
		pszTxtoutCtlFile_g);
	exit_ktext(EXIT_FAILURE);
	}
	fputc('\n', stderr);
	}
/*
 *  load the rules
 */
if (pszRuleFile_g == (char *)NULL)
	{
	fprintf(stderr, "KTEXT: Rules file not specified in control file\n");
	exit_ktext(EXIT_FAILURE);
	}
else if (loadKimmoRules((unsigned char *)pszRuleFile_g, &sLang_g) < 0)
	{
	fprintf(stderr, "KTEXT: Cannot load rules file %s\n", pszRuleFile_g);
	exit_ktext(EXIT_FAILURE);
	}
/*
 *  load the lexicon
 */
if (pszLexiconFile_g == (char *)NULL)
	{
	fprintf(stderr, "KTEXT: Lexicon file not specified in control file\n");
	exit_ktext(EXIT_FAILURE);
	}
if (bSynthesis_g)
	{
	/*
	 *  copy the Rules section of the language data
	 */
	sSynLang_g.ppszAlphabet         = sLang_g.ppszAlphabet;
	sSynLang_g.uiAlphabetSize       = sLang_g.uiAlphabetSize;
	sSynLang_g.cNull                = sLang_g.cNull;
	sSynLang_g.cAny                 = sLang_g.cAny;
	sSynLang_g.cBoundary            = sLang_g.cBoundary;
	sSynLang_g.pSubsets             = sLang_g.pSubsets;
	sSynLang_g.uiSubsetCount        = sLang_g.uiSubsetCount;
	sSynLang_g.pAutomata            = sLang_g.pAutomata;
	sSynLang_g.uiAutomataSize       = sLang_g.uiAutomataSize;
	sSynLang_g.pFeasiblePairs       = sLang_g.pFeasiblePairs;
	sSynLang_g.uiFeasiblePairsCount = sLang_g.uiFeasiblePairsCount;
	sSynLang_g.pszRulesFile         = sLang_g.pszRulesFile;
	if (loadKimmoLexicon((unsigned char *)pszLexiconFile_g,
			 KIMMO_SYNTHESIS,
			 &sSynLang_g) < 0)
	{
	fprintf(stderr, "KTEXT: Cannot load lexicon file %s\n",
		pszLexiconFile_g);
	exit_ktext(EXIT_FAILURE);
	}
	}
if (!bSynthesis_g || bVerify_g)
	{
	if (loadKimmoLexicon((unsigned char *)pszLexiconFile_g,
			 KIMMO_ANALYSIS, &sLang_g) < 0)
	{
	fprintf(stderr, "KTEXT: Cannot load lexicon file %s\n",
		pszLexiconFile_g);
	exit_ktext(EXIT_FAILURE);
	}
	}
/*
 *  if requested, load the grammar
 */
if ((!bSynthesis_g || bVerify_g) && (pszGrammarFile_g != (char *)NULL))
	{
	sLang_g.sPATR.cComment    = sLang_g.cComment;
	sLang_g.sPATR.iDebugLevel = 0;
	if (loadPATRGrammar((char *)pszGrammarFile_g, &sLang_g.sPATR) == 0)
	{
	fprintf(stderr, "KTEXT: Cannot load grammar file %s\n",
		pszGrammarFile_g);
	exit_ktext(EXIT_FAILURE);
	}
	sLang_g.bUsePATR    = TRUE;
	sSynLang_g.bUsePATR = TRUE;
	}
else
	{
	sLang_g.bUsePATR    = FALSE;
	sSynLang_g.bUsePATR = FALSE;
	}
}

/*****************************************************************************
 * NAME
 *    checkIfEmptyFeatureCat
 * DESCRIPTION
 *    check if all of the feature and category strings in the list are empty.
 *    if so, erase any allocated strings.
 * RETURN VALUE
 *    none
 */
static void checkIfEmptyFeatureCat( pAnalyses_in )
WordAnalysis *	pAnalyses_in;
{
WordAnalysis *	pAnal;
int		bAllEmpty;
/*
 *  check for all the features being empty
 */
for ( bAllEmpty = TRUE, pAnal = pAnalyses_in ; pAnal ; pAnal = pAnal->pNext )
	{
	if ((pAnal->pszFeatures != NULL) && (strcmp(pAnal->pszFeatures, "") != 0))
	{
	bAllEmpty = FALSE;
	break;
	}
	}
if (bAllEmpty)
	{
	for ( pAnal = pAnalyses_in ; pAnal ; pAnal = pAnal->pNext )
	{
	if (pAnal->pszFeatures != NULL)
		{
		freeMemory(pAnal->pszFeatures);
		pAnal->pszFeatures = NULL;
		}
	}
	}
/*
 *  check for all the categories being empty
 */
for ( bAllEmpty = TRUE, pAnal = pAnalyses_in ; pAnal ; pAnal = pAnal->pNext )
	{
	if ((pAnal->pszCategory != NULL) && (strcmp(pAnal->pszCategory, "") != 0))
	{
	bAllEmpty = FALSE;
	break;
	}
	}
if (bAllEmpty)
	{
	for ( pAnal = pAnalyses_in ; pAnal ; pAnal = pAnal->pNext )
	{
	if (pAnal->pszCategory != NULL)
		{
		freeMemory(pAnal->pszCategory);
		pAnal->pszCategory = NULL;
		}
	}
	}
}

/****************************************************************************
 * NAME
 *    analyzeFile
 * DESCRIPTION
 *    Process the input text file to produce the output analysis file.
 * RETURN VALUE
 *    none
 */
static void analyzeFile()
{
FILE *			infp;
FILE *			outfp;
WordTemplate *		wtp;
WordAnalysis *		pAnal;
KimmoResult *		resp;
int			k;
char *			buffer;
unsigned long		uiDotsCount = 0;
unsigned		uiAmbiguityCount;
char *			pszWord;
size_t			i;

if (!isReadyToRecognize())
	exit_ktext(EXIT_FAILURE);
/*
 *  open the files
 */
infp  = fopen(pszInputFile_g, "r");
if (infp == NULL)
	{
	fprintf(stderr, "KTEXT: cannot open input file %s\n", pszInputFile_g);
	exit_ktext(EXIT_FAILURE);
	}
outfp = fopen(pszOutputFile_g, "w");
if (outfp == NULL)
	{
	fprintf(stderr, "KTEXT: cannot open output file %s\n", pszOutputFile_g);
	exit_ktext(EXIT_FAILURE);
	}
/*
 *  initialize for output
 */
while ((wtp = readTemplateFromText(infp, &TextControl_g)) != NULL)
	{
	/*
	 *  set the flags for which optional fields are wanted
	 */						/* this may change */
	wtp->iOutputFlags = WANT_DECOMPOSITION | WANT_ORIGINAL;

	if (wtp->paWord != NULL)
	{
	uiAmbiguityCount = 0;
	/*
	 *  parse each normalized variant of the word
	 */
	for ( i = 0 ; wtp->paWord[i] ; ++i )
		{
		pszWord = wtp->paWord[i];
		resp = applyKimmoRecognizer((unsigned char *)pszWord, &sLang_g);
		if (resp != (KimmoResult *)NULL)
		{
		wtp->pAnalyses = convertKimmoPATRToWordAnalyses(resp,
							 &sLang_g,
							 pCatPath_g,
							 TextControl_g.cDecomp,
							 pFdDefinitions_g,
							 wtp->pAnalyses,
							 &uiAmbiguityCount,
							&sLang_g.sPATR);
		/*
		 *  adjust output for available fields
		 */
		wtp->iOutputFlags &= ~WANT_FEATURES;
		wtp->iOutputFlags &= ~WANT_CATEGORY;
		for ( pAnal = wtp->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
			{
			if (    (pAnal->pszFeatures != NULL) &&
				(*pAnal->pszFeatures != NUL) )
			wtp->iOutputFlags |= WANT_FEATURES;
			if (    (pAnal->pszCategory != NULL) &&
				(*pAnal->pszCategory != NUL) )
			wtp->iOutputFlags |= WANT_CATEGORY;
			}
		freeKimmoResult( resp, &sLang_g );
		}
		/*
		 *  reassure the user that we're doing something
		 */
		if (!sLang_g.bSilent)
		uiDotsCount = showAmbiguousProgress(uiAmbiguityCount, uiDotsCount);

		if ((uiAmbiguityCount == 0) && (sLang_g.pLogFP != (FILE *)NULL))
		fprintf(sLang_g.pLogFP, "AF: %s [%s]\n",
			wtp->pszOrigWord ? wtp->pszOrigWord : "",
			pszWord ? pszWord : "" );
		}
	}
	/*
	 *  check for empty feature and category strings
	 */
	checkIfEmptyFeatureCat( wtp->pAnalyses );
	/*
	 *  apply any desired changes to the analysis and decomposition strings
	 */
	if (pAnChanges_g)
	{
	for ( pAnal = wtp->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		{
		k = 2 * strlen(pAnal->pszAnalysis) + 1;
		buffer = strcpy( allocMemory(k), pAnal->pszAnalysis);
		freeMemory(pAnal->pszAnalysis);
		pAnal->pszAnalysis = applyChanges(buffer, pAnChanges_g);
		if (pAnal->pszAnalysis != buffer)
		freeMemory(buffer);
		}
	}
	if (pDcChanges_g)
	{
	for ( pAnal = wtp->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		{
		k = 2 * strlen(pAnal->pszDecomposition) + 1;
		buffer = strcpy( allocMemory(k), pAnal->pszDecomposition);
		freeMemory(pAnal->pszDecomposition);
		pAnal->pszDecomposition = applyChanges(buffer, pDcChanges_g);
		if (pAnal->pszDecomposition != buffer)
		freeMemory(buffer);
		}
	}
	writeTemplate(outfp, pszOutputFile_g, wtp, &TextControl_g );
	/*
	 *  free the memory allocated for this word
	 */
	freeWordTemplate( wtp );
	}
if (!sLang_g.bSilent && uiDotsCount)
	fputc('\n', stderr);
}

/****************************************************************************
 * NAME
 *    synthesizeFile
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Process the input analysis file to produce the output text file.
 * RETURN VALUE
 *    none
 */
static void synthesizeFile()
{
FILE *			infp;
FILE *			outfp;
WordTemplate *		wtp;
WordAnalysis *		pAnal;
KimmoResult *		pGen;
KimmoResult *		rp;
KimmoResult *		resp;
StringList *		nwp;
unsigned long		uiDotsCount = 0;
unsigned		uiAmbiguityCount;

if (!isReadyToSynthesize())
	exit_ktext(EXIT_FAILURE);
if (bVerify_g && !isReadyToRecognize())
	exit_ktext(EXIT_FAILURE);
/*
 *  open the files
 */
infp  = fopen(pszInputFile_g, "r");
if (infp == NULL)
	{
	fprintf(stderr, "KTEXT: cannot open input file %s\n", pszInputFile_g);
	exit_ktext(EXIT_FAILURE);
	}
outfp = fopen(pszOutputFile_g, "w");
if (outfp == NULL)
	{
	fprintf(stderr, "KTEXT: cannot open output file %s\n", pszOutputFile_g);
	exit_ktext(EXIT_FAILURE);
	}
/*
 *  copy the operational control information
 */
sSynLang_g.bLimit      = sLang_g.bLimit;
sSynLang_g.iTraceLevel = sLang_g.iTraceLevel;
sSynLang_g.bUsePATR    = sLang_g.bUsePATR;
sSynLang_g.bSilent     = sLang_g.bSilent;
sSynLang_g.cGlossBegin = sLang_g.cGlossBegin;
sSynLang_g.cGlossEnd   = sLang_g.cGlossEnd;
sSynLang_g.pLogFP      = sLang_g.pLogFP;

while ((wtp = readTemplateFromAnalysis(infp, &TextControl_g)) != NULL)
	{
	uiAmbiguityCount = 0;
	for ( pAnal = wtp->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
	{
	pGen = applyKimmoSynthesizer((unsigned char *)pAnal->pszAnalysis,
					 &sSynLang_g);
	if (pGen != (KimmoResult *)NULL)
		{
		/*
		 *  convert the KimmoResult list for output
		 */
		for ( rp = pGen ; rp != (KimmoResult *)NULL ; rp = rp->pNext )
		{
		if (isMemberOfStringList(wtp->pNewWords,
					 (char *)rp->pszResult))
			continue;			/* avoid duplication */
		if (bVerify_g)
			{
			/*
			 *  try to parse the synthesized word
			 */
			resp = applyKimmoRecognizer(rp->pszResult, &sLang_g);
			if (resp == (KimmoResult *)NULL)
			continue;		/* reject bad synthesis */
			freeKimmoResult( resp, &sLang_g );
			}
		++uiAmbiguityCount;
		nwp = (StringList *)allocMemory(sizeof(StringList));
		nwp->pszString = duplicateString((char *)rp->pszResult);
		nwp->pNext     = wtp->pNewWords;
		wtp->pNewWords = nwp;
		}
		freeKimmoResult( pGen, &sLang_g );
		}
	}
	fixSynthesizedWord(wtp, &TextControl_g, NULL);
	writeTextFromTemplate( outfp, wtp, &TextControl_g);
	/*
	 *  reassure the user that we're doing something
	 */
	if (!sLang_g.bSilent)
	uiDotsCount = showAmbiguousProgress(uiAmbiguityCount, uiDotsCount);

	if ((uiAmbiguityCount == 0) && (sLang_g.pLogFP != (FILE *)NULL))
	fprintf(sLang_g.pLogFP, "SF: %s [%s]\n",
		(wtp->pAnalyses && wtp->pAnalyses->pszAnalysis) ?
				   wtp->pAnalyses->pszAnalysis : "",
		wtp->pszOrigWord ? wtp->pszOrigWord :
					((wtp->paWord && wtp->paWord[0]) ?
							wtp->paWord[0] : "") );
	/*
	 *  free the memory allocated for this word
	 */
	freeWordTemplate( wtp );
	}
if (!sLang_g.bSilent && uiDotsCount)
	fputc('\n', stderr);
}

/***************************************************************************
 * NAME
 *    reportKtextOutOfMemory
 * ARGUMENTS
 *    size - amount of memory desired, but unable to allocate
 * DESCRIPTION
 *    Die with an appropriate error message for running out of memory.
 * RETURN VALUE
 *    doesn't return!
 */
static void reportKtextOutOfMemory(size)
size_t size;
{
static char *nomem_msg = "\nERROR 900:\n    Out of memory\n";

if (emergency_memory != (char *)NULL)
	{
	free(emergency_memory);
	emergency_memory = (char *)NULL;
	}
if (!sLang_g.bSilent)
	fprintf(stderr, nomem_msg);
if (sLang_g.pLogFP != (FILE *)NULL)
	fprintf(sLang_g.pLogFP, nomem_msg);
exit_ktext(2);
}

/****************************************************************************
 * NAME
 *    main
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - pointer to array of command line arguments
 * DESCRIPTION
 *    main() for PC-KIMMO -- where the program starts executing
 * RETURN VALUE
 *    status for return: 0 if okay, nonzero if error
 */
int main( argc, argv )
int argc;
char **argv;
{
#ifdef THINK_C
SetWTitle( FrontWindow(), "\pKTEXT");
#endif
#ifdef USE_CCOMMAND
argc = ccommand(&argv);
#endif

emergency_memory = malloc((size_t)16384);	/* need >8K for MPW C */
				/* error handler for memory allocation */
pfOutOfMemory_g = reportKtextOutOfMemory;
parse_cmd_line(argc,argv);	/* parse the command line */
initialize();			/* load the control files */
if (bSynthesis_g)
	synthesizeFile();
else
	analyzeFile();

exit_ktext(EXIT_SUCCESS);
return(0);
}
