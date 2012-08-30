/* KTAGGER.C - main routine and global variables for the KTAGGER program
 *****************************************************************************
 * Edit history is at the end of VERSION.H
 *****************************************************************************
 * Copyright 1995, 2002 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
extern VOIDP  memcpy  P((VOIDP dest, const VOIDP src, size_t n));
extern char * strcat  P((char * dest, const char * src));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strtok  P((char * s, const char * delim));
extern size_t strlen  P((const char * s));
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

#include "strlist.h"
#include "kimmo.h"
#include "rpterror.h"	/* for NumberedMessage and displayNumberedMessage() */
#include "version.h"

#ifdef applec
char *pszProgramPrompt_g = "Ktagger ";
extern int ccommand P((char ***argvp));
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

#ifdef _WINDOWS
#define USE_CCOMMAND
char *pszProgramPrompt_g = "Ktagger ";
extern int ccommand P((char ***argvp));
#endif

static void reportKtaggerOutOfMemory P((size_t size));

/*****************************************************************************
 * NAME
 *    RECORD
 * DESCRIPTION
 *    data structure for holding the information used to write records to the
 *    output file
 */
typedef struct
	{
	char *		start_tag;
	PATRFeatureTags *	fields;
	char *		end_tag;
	} RECORD;

/*****************************************************************************
 * NAME
 *    OUTPUT_STYLE
 * DESCRIPTION
 *    data structure for holding the output control information
 */
typedef struct
	{
	char *	header;
	RECORD	record;
	char *	footer;
	} OUTPUT_STYLE;

/*****************************************************************************
 *  global data declarations
 */
char *Control_file = NULL;
FILE *Control_fp = NULL;
char *Input_file = NULL;
FILE *Input_fp = NULL;
char *Log_file = NULL;
char *Output_file = NULL;
FILE *Output_fp = NULL;

char *emergency_memory = NULL;	/* memory to release if we run out of memory */
char whitespace[] = " \r\n\t\f";
char *program_name;
unsigned long ambigs[11];

OUTPUT_STYLE Output_style;
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
KimmoData sLang_g = {
	FALSE,		/* bLimit      - limit to a single good result */
	FALSE,		/* iTraceLevel - enable tracing of Kimmo processing */
	TRUE,		/* bUsePATR    - enable parsing with PATR functions */
	FALSE,		/* bSilent     - disable stderr messages */
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
	FALSE,	/* bSilent          - disable messages to stderr */
	TRUE,	/* bShowWarnings    - enable warning messages */
	TRUE,	/* bPromoteDefAtoms - promote default atoms before parsing */
	FALSE,	/* bPropIsFeature   - AMPLE property is feature template */
#ifndef hab108
	0,  	/* eRootGlossFeature  - use AMPLE root gloss as feature */
#endif /* hab108 */
	FALSE,	/* bRecognizeOnly   - settle for one successful parse */
	0,	/* iMaxProcTime     - maximum processing time for a parse */
	NULL,	/* pLogFP           - output log file */
	NULL,	/* pFinalPunc	    - not used by Kimmo functions */
	NULL,	/* pszGrammarFile   - name of the grammar file */
	NULL,	/* pGrammar         - data loaded from the grammar file */
	0,
	NULL, NULL, NULL, NULL, NULL, NULL, /* not used by Kimmo functions */
#ifndef hab108
	NULL,
#endif /* hab108 */
	0, 0,	/* internal processing values */
	&sLangPATRMemory_s,
	0, 0, NULL,
	}
	};
int Debug_flag = 0;		/* debug level: 0 = off */
int bCheckAlloc_g = FALSE;
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

const int	iKTaggerVersion_g    = VERSION;
const int	iKTaggerRevision_g   = REVISION;
#if PATCHLEVEL < 0
const int	iKTaggerPatchlevel_g = -(PATCHLEVEL);
#else
const int	iKTaggerPatchlevel_g = PATCHLEVEL;
#endif
const char	chKTaggerPatchsep_g  = PATCHLEVELSEPCHAR;
const char *	pszKTaggerDate_g     = DATE;
const char *	pszKTaggerYear_g     = YEAR;
#ifdef __DATE__
const char *	pszKTaggerCompileformat_g = COMPILEDFORMAT;
const char *	pszKTaggerCompiledate_g   = __DATE__;
const char *	pszKTaggerCompiletime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszKTaggerTestVersion_g = TESTFORMAT;
#else
const char *	pszKTaggerTestVersion_g = NULL;
#endif
#endif
/*
 *  error messages
 */
static NumberedMessage sCannotOpen_m		= { ERROR_MSG,   100,
	"Cannot open %s file %s" };
static NumberedMessage sIgnoreRedundant_m	= { WARNING_MSG, 101,
	"Ignoring all but first \\%s line" };
static NumberedMessage sInvalidField_m	= { WARNING_MSG, 102,
	"Invalid field in control file %s\n\t%s" };
static NumberedMessage sMissingField_m	= { WARNING_MSG, 103,
	"Missing \\field before a \\%s" };
static NumberedMessage sNoField_m		= { ERROR_MSG,   104,
	"No \\%s field found in the control file" };
/*static NumberedMessage sControlError_m	= { ERROR_MSG,   105,*/
/*    "Cannot continue -- error loading the control file information" };*/
static NumberedMessage sRulesError_m		= { ERROR_MSG,   106,
	"Cannot continue -- error loading the rules file %s" };
static NumberedMessage sLexiconError_m	= { ERROR_MSG,   107,
	"Cannot continue -- error loading the lexicon file %s" };
static NumberedMessage sGrammarError_m	= { ERROR_MSG,   108,
	"Cannot continue -- error loading the grammar file %s" };
static NumberedMessage sNeedGrammar_m		= { ERROR_MSG,   541,
	"Cannot parse forms without a grammar" };
static NumberedMessage sNeedLexiconToRecognize_m    	= { ERROR_MSG,   804,
	"Cannot recognize forms without a lexicon" };
static NumberedMessage sNeedRulesToRecognize_m	= { ERROR_MSG,   806,
	"Cannot recognize forms without rules" };

void exit_ktagger P((int status));
void usage P((int status));
char *extract_string P((char **field));
StringList *extract_path P((char **field));
void read_control_file P((void));
void process_input_file P((void));

/*****************************************************************************
 * NAME
 *    display_ktagger_header
 * DESCRIPTION
 *    Write the program header information to the screen (stderr).
 * RETURN VALUE
 *    none
 */
static void display_ktagger_header()
{
fprintf(stderr, "KTAGGER (tag words using PC-Kimmo parsing)\n");
fprintf(stderr, "Version %d.%d%c%d (%s), Copyright %s SIL\n",
	iKTaggerVersion_g, iKTaggerRevision_g, chKTaggerPatchsep_g,
	iKTaggerPatchlevel_g, pszKTaggerDate_g, pszKTaggerYear_g);
#ifdef __DATE__
fprintf(stderr, pszKTaggerCompileformat_g,
	pszKTaggerCompiledate_g, pszKTaggerCompiletime_g);
#else
if (pszKTaggerTestVersion_g != NULL)
	fputs(pszKTaggerTestVersion_g, stderr);
#endif
fprintf(stderr, "with PC-Kimmo functions version %d.%d%c%d (%s)\n",
	iKimmoVersion_g, iKimmoRevision_g, cKimmoPatchSep_g,
	iKimmoPatchlevel_g, pszKimmoDate_g);
fprintf(stderr, "  and PC-PATR functions version %d.%d%c%d (%s)\n",
	iPATRVersion_g, iPATRRevision_g, cPATRPatchSep_g,
	iPATRPatchlevel_g, pszPATRDate_g);
#ifdef __GO32
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
 *    exit_ktagger
 * ARGUMENTS
 *    status - exit error status
 * DESCRIPTION
 *    exit the program, first displaying a message if necessary
 * RETURN VALUE
 *    none
 */
void exit_ktagger(status)
int status;
{
#ifdef MACINTOSH
fprintf(stderr, "\nUse the Quit command on the File menu (Command-Q)\n");
#endif
#ifdef QUICKWIN
fprintf(stderr, "\nUse the Exit command on the File menu (Control-C)\n");
#endif

if (bCheckAlloc_g)
	{
	/* free memory to check for leaks during processing */
	freeMemory(Output_style.header);
	freeMemory(Output_style.footer);
	freeMemory(Output_style.record.start_tag);
	freeMemory(Output_style.record.end_tag);
	if (Output_style.record.fields)
	{
	PATRFeatureTags * pft;
	PATRFeatureTags * pftNext;
	for ( pft = Output_style.record.fields ; pft ; pft = pftNext )
		{
		pftNext = pft->pNext;
		freeStringList(pft->pFeaturePath);
		freeMemory(pft->pszStartTag);
		freeMemory(pft->pszEndTag);
		freeMemory(pft);
		}
	}
	freeKimmoRules(&sLang_g);
	freeKimmoLexicon(&sLang_g);
	freeKimmoLexicon(&sLang_g);
	freePATRGrammar(&sLang_g.sPATR);
	freePATRInternalMemory(&sLang_g.sPATR);
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
 *    usage
 * ARGUMENTS
 *    status - program exit status
 * DESCRIPTION
 *    print a message telling the user how to use this program, and then exit
 *    the program with the indicated status
 * RETURN VALUE
 *    none
 */
void usage(status)
int status;
{
display_ktagger_header();
fputs("\n\
Usage:  ktagger [options] [infile]\n\
	-i infile    read the input list of words from infile\n\
	-l logfile   write a record of the processing to logfile\n\
	-o outfile   write the output list of tagged words to outfile\n\
	-q           work quietly without progress reports\n\
	-x ctlfile   load the control information from ctlfile (required)\n\
", stderr); fputs("\n\
The -x option is required; the others are truly optional.  If the -i option\n\
is not given, then the input file may be given on the command line following\n\
all options.  If no input file is specified, then the standard input is\n\
read.  If no output file is specified, then the standard output is written.\n\
", stderr );
exit_ktagger(status);
}

/**********************************************************************
 * NAME
 *    parse_command
 * ARGUMENTS
 *    argc - number of arguments on the command line
 *    argv - array of pointers to the command line arguments
 * DESCRIPTION
 *    handle the command line arguments, filling global variables
 * RETURN VALUE
 *    none
 */
static void parse_command(argc, argv)
int argc;
char **argv;
{
int k;
int errflag = 0;
VOIDP	trap_address = NULL;
int	trap_count = 0;
char *	s;

if (argv != NULL)
	program_name = argv[0];
while ((k = getopt(argc, argv, "HhI:i:L:l:O:o:QqX:x:/Z:z:")) != EOF)
	{
	switch (k)
	{
	case 'H':		/* give the user some help */
	case 'h':
		usage(0);
		break;

	case 'I':		/* input file (list of words) */
	case 'i':
		Input_file = optarg;
		break;

	case 'L':		/* log file */
	case 'l':
		Log_file = optarg;
		break;

	case 'O':		/* output file */
	case 'o':
		Output_file = optarg;
		break;

	case 'Q':		/* flag whether to work quietly */
	case 'q':
		sLang_g.bSilent = TRUE;
		sLang_g.sPATR.bSilent = TRUE;
		break;

	case 'X':		/* KTAGGER control file */
	case 'x':
		Control_file = optarg;
		break;

	case '/':
		++Debug_flag;
		break;

	case 'z':		/* memory allocation trace filename */
		setAllocMemoryTracing(optarg);
		bCheckAlloc_g = TRUE;
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
		bCheckAlloc_g = TRUE;
		break;

	default:
		++errflag;
		break;
	}
	}
if ((Input_file == (char *)NULL) && (optind < argc))
	Input_file = argv[optind++];
if (Input_file == (char *)NULL)
	Input_file = "-";
if (Output_file == (char *)NULL)
	Output_file = "-";
if (Control_file == (char *)NULL)
	++errflag;

if (errflag)
	usage(2);

if (!sLang_g.bSilent)
	display_ktagger_header();

if (Log_file != (char *)NULL)
	{
	sLang_g.pLogFP = fopen(Log_file, "w");
	if (sLang_g.pLogFP == (FILE *)NULL)
	{
	displayNumberedMessage(&sCannotOpen_m,
				   sLang_g.bSilent, sLang_g.bShowWarnings,
				   sLang_g.pLogFP,
				   NULL, 0, "log", Log_file);
	exit_ktagger(EXIT_FAILURE);
	}
	}
}

/*****************************************************************************
 * NAME
 *    extract_string
 * ARGUMENTS
 *    field - array of lines making up a field in the input file
 * DESCRIPTION
 *    extract a string delimited by double quotes from the input field
 * RETURN VALUE
 *    pointer to a copy of the input string
 */
char *extract_string(field)
char **field;
{
char *p, *q, *string;
unsigned length;
int i;
int begun;

for ( length = 0, i = 0 ; field[i] ; ++i )
	length += strlen( field[i] );
length += i;

q = string = allocMemory( length );
for ( begun = 0, i = 0 ; field[i] ; ++i )
	{
	p = field[i];
	if (i == 0)
	++p;
	while (*p != '\0')
	{
	if (*p == '"')
		{
		if (begun)
		break;
		else
		begun = 1;
		}
	else if (begun)
		{
		if (*p == '\\')
		{
		switch (*++p)
			{
			case 'n':	*q++ = '\n';	break;
			case 't':	*q++ = '\t';	break;
			case 'f':	*q++ = '\f';	break;
			case '\0':	*q++ = '\n';	break;
			default:	*q++ = *p;	break;
			}
		}
		else
		*q++ = *p;
		}
	++p;
	}
	}
*q = '\0';
return( string );
}

/*****************************************************************************
 * NAME
 *    extract_path
 * ARGUMENTS
 *    field - array of lines making up a field in the input file
 * DESCRIPTION
 *    extract a feature path delimited by <> from the input field
 * RETURN VALUE
 *    pointer to a copy of the feature path stored as a list of strings
 */
StringList *extract_path(field)
char **field;
{
StringList *path, *lastp, *slp;
char *p, *q;
int i;
unsigned length;
int begun = 0, done = 0;

path = (StringList *)NULL;
lastp = (StringList *)NULL;
for ( i = 0 ; field[i] ; ++i )
	{
	p = field[i];
	if (i == 0)
	++p;
	while (*p != '\0')
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
	++p;
	}
	}
return( path );
}

/*****************************************************************************
 * NAME
 *    read_control_file
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    read the data from the control file in preparation for processing the
 *    data
 * RETURN VALUE
 *    none
 */
void read_control_file()
{
char **ctlfield, *rp;
int i;
StringList *slp;
static const char * codes[] = {
	"\\rules", "\\lexicon", "\\grammar", "\\header", "\\footer",
	"\\recordstarttag", "\\recordendtag",
	"\\field", "\\starttag", "\\endtag", "\\path", "\\rem", NULL
	};
char *rul_file, *lex_file, *grm_file;
PATRFeatureTags *field, *lastfield;

rul_file = (char *)NULL;
lex_file = (char *)NULL;
grm_file = (char *)NULL;
Output_style.header = (char *)NULL;
Output_style.record.start_tag  = (char *)NULL;
Output_style.record.fields   = (PATRFeatureTags *)NULL;
Output_style.record.end_tag = (char *)NULL;
Output_style.footer = (char *)NULL;
field = (PATRFeatureTags *)NULL;
lastfield = (PATRFeatureTags *)NULL;

Control_fp = fopen(Control_file, "r");
if (Control_fp == (FILE *)NULL)
	{
	displayNumberedMessage(&sCannotOpen_m,
			   sLang_g.bSilent, sLang_g.bShowWarnings,
			   sLang_g.pLogFP,
			   NULL, 0, "control", Control_file);
	exit_ktagger(EXIT_FAILURE);
	}
while ((ctlfield = readStdFormatField(Control_fp, codes, NUL)) != NULL)
	{
	switch (**ctlfield)
	{
	case 1:			/* "\\rules" */
		if (rul_file != (char *)NULL)
		displayNumberedMessage(&sIgnoreRedundant_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "rules");
		else
		{
		rp = strtok(ctlfield[0]+1, whitespace);
		rul_file = buildAdjustedFilename( rp, Control_file, ".rul" );
		}
		break;

	case 2:			/* "\\lexicon" */
		if (lex_file != (char *)NULL)
		displayNumberedMessage(&sIgnoreRedundant_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "lexicon");
		else
		{
		rp = strtok(ctlfield[0]+1, whitespace);
		lex_file = buildAdjustedFilename( rp, Control_file, ".lex" );
		}
		break;

	case 3:			/* "\\grammar" */
		if (grm_file != (char *)NULL)
		displayNumberedMessage(&sIgnoreRedundant_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "grammar");
		else
		{
		rp = strtok(ctlfield[0]+1, whitespace);
		grm_file = buildAdjustedFilename( rp, Control_file, ".grm" );
		}
		break;

	case 4:			/* "\\header" */
		if (Output_style.header != (char *)NULL)
		displayNumberedMessage(&sIgnoreRedundant_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "header");
		else
		Output_style.header = extract_string(ctlfield);
		break;

	case 5:			/* "\\footer" */
		if (Output_style.footer != (char *)NULL)
		displayNumberedMessage(&sIgnoreRedundant_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "footer");
		else
		Output_style.footer = extract_string(ctlfield);
		break;

	case 6:			/* "\\recordstarttag" */
		if (Output_style.record.start_tag != (char *)NULL)
		displayNumberedMessage(&sIgnoreRedundant_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "recordstarttag");
		else
		Output_style.record.start_tag = extract_string(ctlfield);
		break;

	case 7:			/* "\\recordendtag" */
		if (Output_style.record.end_tag != (char *)NULL)
		displayNumberedMessage(&sIgnoreRedundant_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "recordendtag");
		else
		Output_style.record.end_tag = extract_string(ctlfield);
		break;

	case 8:			/* "\\field" */
		if (field != (PATRFeatureTags *)NULL)
		{
		if (Output_style.record.fields == (PATRFeatureTags *)NULL)
			Output_style.record.fields = field;
		else
			lastfield->pNext = field;
		lastfield = field;
		}
		field = (PATRFeatureTags *)allocMemory(sizeof(PATRFeatureTags));

		break;

	case 9:			/* "\\starttag" */
		if (field == (PATRFeatureTags *)NULL)
		displayNumberedMessage(&sMissingField_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "starttag");
		else if (field->pszStartTag != (char *)NULL)
		displayNumberedMessage(&sIgnoreRedundant_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "starttag");
		else
		field->pszStartTag = extract_string( ctlfield );
		break;

	case 10:		/* "\\endtag" */
		if (field == (PATRFeatureTags *)NULL)
		displayNumberedMessage(&sMissingField_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "endtag");
		else if (field->pszEndTag != (char *)NULL)
		displayNumberedMessage(&sIgnoreRedundant_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "endtag");
		else
		field->pszEndTag = extract_string( ctlfield );
		break;

	case 11:		/* "\\path" */
		if (field == (PATRFeatureTags *)NULL)
		displayNumberedMessage(&sMissingField_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "path");
		else if (field->pFeaturePath != (StringList *)NULL)
		displayNumberedMessage(&sIgnoreRedundant_m,
					   sLang_g.bSilent, sLang_g.bShowWarnings,
					   sLang_g.pLogFP,
					   Control_file, 0,
					   "path");
		else
		field->pFeaturePath = extract_path( ctlfield );
		break;

	case 12:		/* "\\rem" */
		break;

	default:
		displayNumberedMessage(&sInvalidField_m,
				   sLang_g.bSilent, sLang_g.bShowWarnings,
				   sLang_g.pLogFP,
				   Control_file, 0,
				   ctlfield[0]);
		break;
	}
	for ( i = 0 ; ctlfield[i] ; ++i )
	freeMemory(ctlfield[i]);
	freeMemory((char *)ctlfield);
	}
if (field != (PATRFeatureTags *)NULL)
	{
	if (Output_style.record.fields == (PATRFeatureTags *)NULL)
	Output_style.record.fields = field;
	else
	lastfield->pNext = field;
	}
if (rul_file == (char *)NULL)
	{
	displayNumberedMessage(&sNoField_m,
			   sLang_g.bSilent, sLang_g.bShowWarnings,
			   sLang_g.pLogFP,
			   Control_file, 0, "field");
	freeMemory(lex_file);
	freeMemory(grm_file);
	exit_ktagger(EXIT_FAILURE);
	}
if (lex_file == (char *)NULL)
	{
	displayNumberedMessage(&sNoField_m,
			   sLang_g.bSilent, sLang_g.bShowWarnings,
			   sLang_g.pLogFP,
			   Control_file, 0, "lexicon");
	freeMemory(rul_file);
	freeMemory(grm_file);
	exit_ktagger(EXIT_FAILURE);
	}
if (grm_file == (char *)NULL)
	{
	displayNumberedMessage(&sNoField_m,
			   sLang_g.bSilent, sLang_g.bShowWarnings,
			   sLang_g.pLogFP,
			   Control_file, 0, "grammar");
	freeMemory(rul_file);
	freeMemory(lex_file);
	exit_ktagger(EXIT_FAILURE);
	}
if (Output_style.record.fields == (PATRFeatureTags *)NULL)
	{
	displayNumberedMessage(&sNoField_m,
			   sLang_g.bSilent, sLang_g.bShowWarnings,
			   sLang_g.pLogFP,
			   Control_file, 0, "field");
	freeMemory(rul_file);
	freeMemory(lex_file);
	freeMemory(grm_file);
	exit_ktagger(EXIT_FAILURE);
	}
if (Output_style.header == (char *)NULL)
	Output_style.header = "";
if (Output_style.record.start_tag == (char *)NULL)
	Output_style.record.start_tag = "";
if (Output_style.record.end_tag == (char *)NULL)
	Output_style.record.end_tag = "\n";
if (Output_style.footer == (char *)NULL)
	Output_style.footer = "";
if (loadKimmoRules((unsigned char *)rul_file, &sLang_g) != 0)
	{
	displayNumberedMessage(&sRulesError_m,
			   sLang_g.bSilent, sLang_g.bShowWarnings,
			   sLang_g.pLogFP,
			   Control_file, 0, rul_file);
	freeMemory(rul_file);
	freeMemory(lex_file);
	freeMemory(grm_file);
	exit_ktagger(EXIT_FAILURE);
	}
if (loadKimmoLexicon((unsigned char *)lex_file, KIMMO_ANALYSIS, &sLang_g) != 0)
	{
	displayNumberedMessage(&sLexiconError_m,
			   sLang_g.bSilent, sLang_g.bShowWarnings,
			   sLang_g.pLogFP,
			   Control_file, 0, lex_file);
	freeMemory(rul_file);
	freeMemory(lex_file);
	freeMemory(grm_file);
	exit_ktagger(EXIT_FAILURE);
	}
sLang_g.sPATR.cComment    = sLang_g.cComment;
sLang_g.sPATR.iDebugLevel = 0;
if (loadPATRGrammar((char *)grm_file, &sLang_g.sPATR) == 0)
	{
	displayNumberedMessage(&sGrammarError_m,
			   sLang_g.bSilent, sLang_g.bShowWarnings,
			   sLang_g.pLogFP,
			   Control_file, 0, grm_file);
	freeMemory(rul_file);
	freeMemory(lex_file);
	freeMemory(grm_file);
	exit_ktagger(EXIT_FAILURE);
	}
else
	sLang_g.bUsePATR = TRUE;

if (Debug_flag)
	{
	if (sLang_g.pLogFP != (FILE *)NULL)
	{
	fprintf(sLang_g.pLogFP, "DEBUG: header = \"%s\"\n",
		Output_style.header);
	fprintf(sLang_g.pLogFP,"DEBUG: record.start_tag = \"%s\"\n\n",
		   Output_style.record.start_tag);
	for (field = Output_style.record.fields ; field ; field = field->pNext)
		{
		fprintf(sLang_g.pLogFP, "DEBUG: field->start_tag = \"%s\"\n",
			field->pszStartTag);
		fprintf(sLang_g.pLogFP, "DEBUG: field->feature_path = <");
		for ( slp = field->pFeaturePath ; slp ; slp = slp->pNext )
		fprintf(sLang_g.pLogFP, " %s", slp->pszString);
		fprintf(sLang_g.pLogFP, " >\n");
		fprintf(sLang_g.pLogFP, "DEBUG: field->end_tag = \"%s\"\n\n",
			field->pszEndTag );
		}
	fprintf(sLang_g.pLogFP, "DEBUG: record.end_tag = \"%s\"\n",
		   Output_style.record.end_tag);
	fprintf(sLang_g.pLogFP, "DEBUG: footer = \"%s\"\n",
		Output_style.footer);
	}
	else
	{
	printf("DEBUG: header = \"%s\"\n", Output_style.header);
	printf("DEBUG: record.start_tag = \"%s\"\n\n",
		   Output_style.record.start_tag);
	for (field = Output_style.record.fields ; field ; field = field->pNext)
		{
		printf("DEBUG: field->start_tag = \"%s\"\n", field->pszStartTag);
		printf("DEBUG: field->feature_path = <");
		for ( slp = field->pFeaturePath ; slp ; slp = slp->pNext )
		printf(" %s", slp->pszString);
		printf(" >\n");
		printf("DEBUG: field->end_tag = \"%s\"\n\n", field->pszEndTag );
		}
	printf("DEBUG: record.end_tag = \"%s\"\n",
		   Output_style.record.end_tag);
	printf("DEBUG: footer = \"%s\"\n", Output_style.footer);
	}
	}
freeMemory(rul_file);
freeMemory(lex_file);
freeMemory(grm_file);

fclose(Control_fp);
}

/*****************************************************************************
 * NAME
 *    process_input_file
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    read the words from the input file, parse them, and write the tagged
 *    words to the output file
 * RETURN VALUE
 *    none
 */
void process_input_file()
{
char *line, *p, *q;
KimmoResult *rresp, *rp;
char *morph_glosses = NULL;
char *morph_lexes = NULL;
unsigned uiAmbiguityCount;
unsigned uiDotsCount = 0;
int i;

if (!isReadyToRecognize())
	exit_ktagger(EXIT_FAILURE);
if (strcmp(Input_file, "-") == 0)
	Input_fp = stdin;
else
	{
	Input_fp = fopen(Input_file, "r");
	if (Input_fp == (FILE *)NULL)
	displayNumberedMessage(&sCannotOpen_m,
				   sLang_g.bSilent, sLang_g.bShowWarnings,
				   sLang_g.pLogFP,
				   NULL, 0, "input", Input_file);
	}
if (strcmp(Output_file, "-") == 0)
	Output_fp = stdout;
else
	{
	Output_fp = fopen(Output_file, "w");
	if (Output_fp == (FILE *)NULL)
	displayNumberedMessage(&sCannotOpen_m,
				   sLang_g.bSilent, sLang_g.bShowWarnings,
				   sLang_g.pLogFP,
				   NULL, 0, "output", Output_file);
	}
if ((Input_fp == (FILE *)NULL) || (Output_fp == (FILE *)NULL))
	exit_ktagger(EXIT_FAILURE);

for ( i = 0 ; i <= 10 ; ++i )
	ambigs[i] = 0L;
fputs(Output_style.header, Output_fp);
while ((line = readLineFromFile(Input_fp, NULL, 0)) != (char *)NULL)
	{
	/*
	 *  take care of leading and trailing whitespace
	 */
	for ( p = line ; *p && isascii(*p) && isspace(*p) ; ++p )
	;
	if (*p == '\0')
	continue;
	q = p + strlen(p) - 1;
	while ((q > p) && isascii(*q) && isspace(*q))
	*q-- = '\0';
	/*
	 *  parse the word
	 */
	rresp = applyKimmoRecognizer((unsigned char *)p, &sLang_g);
	uiAmbiguityCount = 0;
	for ( rp = rresp ; rp != (KimmoResult *)NULL ; rp = rp->pNext )
	{
	morph_lexes   = (char *)concatKimmoMorphLexemes(rp->pAnalysis, "",
							&sLang_g);
	morph_glosses = (char *)concatKimmoMorphGlosses(rp->pAnalysis, "",
							&sLang_g);
	writePATRStyledOutput(rp->pParseChart,
				  p,
				  morph_lexes,
				  morph_glosses,
				  Output_fp,
				  Output_style.record.fields,
				  Output_style.record.start_tag,
				  Output_style.record.end_tag,
				  &sLang_g.sPATR,
				  &uiAmbiguityCount);
	freeMemory(morph_lexes);
	morph_lexes = NULL;
	freeMemory(morph_glosses);
	morph_glosses = NULL;
	}

	if (rresp == (KimmoResult *)NULL)
	{
	fprintf(Output_fp, "%s%s ***%s", Output_style.record.start_tag, p,
						 Output_style.record.end_tag);
	if (sLang_g.pLogFP != (FILE *)NULL)
		fprintf(sLang_g.pLogFP, "Parse failed for %s\n", p);
	}
	else
	freeKimmoResult( rresp, &sLang_g );
/*    freeMemory(line);*/

	if (!sLang_g.bSilent)
	uiDotsCount = showAmbiguousProgress(uiAmbiguityCount, uiDotsCount);
	if (uiAmbiguityCount < 10)
	++ambigs[uiAmbiguityCount];
	else
	++ambigs[10];
	}
fputs(Output_style.footer, Output_fp);
fclose(Input_fp);
fclose(Output_fp);
if (morph_glosses != (char *)NULL)
	freeMemory(morph_glosses);
if (morph_lexes != (char *)NULL)
	freeMemory(morph_lexes);
if (sLang_g.pLogFP != (FILE *)NULL)
	{
	fprintf(sLang_g.pLogFP, "%8lu words failed to parse\n",ambigs[0]);
	fprintf(sLang_g.pLogFP, "%8lu words parsed unambiguously\n",ambigs[1]);
	for ( i = 2 ; i < 10 ; ++i )
	fprintf(sLang_g.pLogFP, "%8lu words parsed %d-way ambiguous\n",
		ambigs[i], i);
	fprintf(sLang_g.pLogFP, "%8lu words parsed 10-way or more ambiguous\n",
		ambigs[10]);
	}
if (!sLang_g.bSilent && uiDotsCount)
	fputc('\n', stderr);
}

/***************************************************************************
 * NAME
 *    reportKtaggerOutOfMemory
 * ARGUMENTS
 *    size - amount of memory desired, but unable to allocate
 * DESCRIPTION
 *    Die with an appropriate error message for running out of memory.
 * RETURN VALUE
 *    doesn't return!
 */
static void reportKtaggerOutOfMemory(size)
size_t size;
{
static char *nomem_msg = "\nERROR 900:\n    Out of memory\n";

if (emergency_memory != (char *)NULL)
	{
	free(emergency_memory);
	emergency_memory = (char *)NULL;
	}
if (!sLang_g.bSilent)
	fprintf(stderr, "%s", nomem_msg);
if (sLang_g.pLogFP != (FILE *)NULL)
	fprintf(sLang_g.pLogFP, "%s", nomem_msg);
exit_ktagger(2);
}

/***************************************************************************
 * NAME
 *    main
 * ARGUMENTS
 *    argc	- number of command line arguments
 *    argv	- array of pointers to the command line arguments
 * DESCRIPTION
 *    Get the command line arguments which specify input and output files.
 *    Initialize appropriate global variables, and call routines that do the
 *    actual processing.
 * RETURN VALUES
 *    none
 */
int main(argc,argv)
int argc;
char **argv;
{
#ifdef THINK_C
SetWTitle( FrontWindow(), "\pKTAGGER");
#endif
#ifdef USE_CCOMMAND
argc = ccommand(&argv);
#endif

emergency_memory = malloc((size_t)16384);	/* need >8K for MPW C */
				/* error handler for memory allocation */
pfOutOfMemory_g = reportKtaggerOutOfMemory;
parse_command(argc, argv);	/* handle the command line args */

read_control_file();
process_input_file();

exit_ktagger(EXIT_SUCCESS);
return 0;		/* not reached */
}
