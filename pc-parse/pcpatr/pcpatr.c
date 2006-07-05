/* PCPATR.C - main routine and global variables for the PCPATR program
 *****************************************************************************
 * Edit history is at the end of VERSION.H
 *****************************************************************************
 * Copyright 1994, 2002 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "pcpatr.h"

#ifndef hab131
#include "disphead.h"
#endif

extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;

#ifdef THINK_C
#include <console.h>
#endif
#ifdef __MWERKS__
#include <sioux.h>
static char szStderrBuffer[BUFSIZ];
#endif

static void reportPATROutOfMemory P((size_t size));
/*
 *   Globals for command line interface program
 */
PATRMemory sPCPATRMemory_g =
{
	NULL, NULL, NULL, NULL, NULL, NULL, TRUE,
	NULL, NULL, 0,
	0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, { NULL, 0, 0, 0 },
	NULL, 0, 0, 0
};
char		szPCPATRDefaultWordMarker_g[3]     = "\\w";
char		szPCPATRDefaultCategoryMarker_g[3] = "\\c";
char		szPCPATRDefaultFeatureMarker_g[3]  = "\\f";
char		szPCPATRDefaultGlossMarker_g[3]    = "\\g";
#ifndef hab130
char		szPCPATRDefaultRootGlossMarker_g[3]= "\\r";
#endif /* hab130 */
PATRData	sPCPATRData_g = {
	FALSE,	/* bFailure           - display parser failures */
	TRUE,	/* bUnification       - enable unification */
	PATR_FULL_TREE,		/*    - tree display mode */
	TRUE,	/* bGloss             - display glosses (if they exist) */
	FALSE,	/* bGlossesExist      - whether glosses exist */
		/* iFeatureDisplay    - feature display mode */
	PATR_FEATURE_ON | PATR_FEATURE_TRIM,
	TRUE,	/* bCheckCycles       - enable checking for parse cycles */
	TRUE,	/* bTopDownFilter     - enable top down filtering */
	10,		/* iMaxAmbiguities    - max number of ambiguities to show */
	0,		/* iDebugLevel        - degree of debugging output desired */
	PATR_DEFAULT_COMMENT,	/*    - begins a comment in an input line */
	FALSE,	/* bSilent            - disable stderr messages */
	TRUE,	/* bShowWarnings      - allow warning messages */
	TRUE,	/* bPromoteDefAtoms   - promote default atoms before parsing */
	FALSE,	/* bPropIsFeature     - AMPLE property is feature template */
#ifndef hab130
	0,  	/* eRootGlossFeature  - use AMPLE root gloss as feature */
#endif /* hab130 */
	FALSE,	/* bRecognizeOnly     - settle for one successful parse */
	0,		/* iMaxProcTime       - maximum processing time for a parse */
	NULL,	/* pLogFP             - output log file */
	NULL,	/* pFinalPunc         - sentence final punctuation chars */
	NULL,	/* pszGrammarFile     - name of the grammar file */
	NULL,	/* pGrammar           - data loaded from the grammar file */
	0,
	szPCPATRDefaultWordMarker_g,	/* pszRecordMarker   */
	szPCPATRDefaultWordMarker_g,	/* pszWordMarker     */
	szPCPATRDefaultGlossMarker_g,	/* pszGlossMarker    */
	szPCPATRDefaultCategoryMarker_g,	/* pszCategoryMarker */
	szPCPATRDefaultFeatureMarker_g,	/* pszFeatureMarker  */
#ifndef hab130
	szPCPATRDefaultRootGlossMarker_g,	/* pszRootGlossMarker*/
#endif /* hab130 */
	NULL,	/* pLexicon           - data loaded from lexicon files */
	0, 0,
	&sPCPATRMemory_g,
	0, 0, NULL,
	};
KimmoData	sPCPATRKimmoData_g =
	{
	FALSE,	/* bLimit        - limit to a single good result */
	FALSE,	/* iTraceLevel   - enable tracing of Kimmo processing */
	TRUE,	/* bUsePATR      - enable parsing with PATR functions */
	FALSE,	/* bSilent       - disable stderr messages */
	TRUE,	/* bShowWarnings - allow warning messages */
	FALSE,	/* bAlignment    - align recognizer output vertically */
	'<', '>',	/* cGlossBegin, cGlossEnd - used only by Kimmo synthesis */
	KIMMO_DEFAULT_COMMENT,	/* begins a comment in an input line */
	NULL,	/* pLogFP        - output log FILE */
	NULL,		/* alphabet */
	0,			/* size of the alphabet */
	'\0',		/* null character */
	'\0',		/* wild card character */
	'\0',		/* word boundary character */
	FALSE,		/* bTwoLCFile - rules loaded from a TwoLC type file */
	NULL,		/* alphabet subsets */
	0,			/* number of alphabet subsets */
	NULL,		/* array of automata (KimmoRule) structures */
	0,			/* number of rules in automata */
	NULL,		/* array of feasible pairs */
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
	TRUE,	/* bGlossesExist    - whether glosses exist (always TRUE) */
		/* iFeatureDisplay  - feature display mode */
	PATR_FEATURE_ON | PATR_FEATURE_TRIM,
	TRUE,	/* bCheckCycles     - enable checking for parse cycles */
	TRUE,	/* bTopDownFilter   - enable top down filtering */
	10,	/* iMaxAmbiguities  - max number of ambiguities to show */
	0,	/* iDebugLevel      - degree of debugging output desired */
	PATR_DEFAULT_COMMENT,	/*  - begins a comment in an input line */
	FALSE,	/* bSilent          - disable stderr messages */
	TRUE,	/* bShowWarnings    - allow warning messages */
	TRUE,	/* bPromoteDefAtoms - promote default atoms before parsing */
	FALSE,	/* bPropIsFeature   - AMPLE property is feature template */
#ifndef hab130
	0,	/* eRootGlossFeature- use AMPLE root gloss as feature */
#endif /* hab130 */
	FALSE,	/* bRecognizeOnly   - settle for one successful parse */
	0,	/* iMaxProcTime     - maximum processing time for a parse */
	NULL,	/* pLogFP           - output log file */
	NULL,	/* pFinalPunc         - sentence final punctuation chars */
	NULL,	/* pszGrammarFile   - name of the grammar file */
	NULL,	/* pGrammar         - data loaded from the grammar file */
	1,
	NULL, NULL, NULL, NULL, NULL, NULL, /* not used by Kimmo functions */
#ifndef hab130
	NULL,	/* not used by Kimmo functions */
#endif /* hab130 */
	0, 0,	/* internal processing values */
	&sPCPATRMemory_g,
	0, 0, NULL,
	}
	};
AmpleData	sPCPATRAmpleData_g = {
	FALSE,		/* -a	bDebugAllomorphConds */
	FALSE,		/* -b	bEnableAllomorphConds */
	'|',		/* -c:	cBeginComment */
	FALSE,		/* -g	bRootGlosses */
	TRUE,		/* -q	bQuiet */
	2,			/* -d:	iMaxTrieDepth */
	15,			/* -n:	iMaxMorphnameLength */
	AMPLE_TRACE_OFF,	/* -t	eTraceAnalysis */
	NULL, 0,		/*      optional string for trace output */
	WANT_PROPERTIES,	/* output field flags */
	0,			/* -/	iDebugLevel */
#ifndef hab136
	MAX_ANALYSES_TO_RETURN_NO_LIMIT,
#endif
	NULL,		/* log FILE pointer */
	NULL,		/* selective analysis filename */
	NULL,		/* selective analysis data */
	{
	NULL,	/* text input control filename */
	NULL,	/* list of lowercase/uppercase pairs sorted by lowercase */
	NULL,	/* list of lowercase/uppercase pairs sorted by uppercase */
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
	NULL,		/* \\nt */
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
	NULL,		/* \\nah */
	NULL,		/* \\cr */
	NULL,		/* \\mcl */
	{ NULL, 0, 0, 255 },	/* \\ap, \\mp, \\maxprops */
	NULL,
	0,			/* \\maxp */
	0,			/* \\maxi */
	1,			/* \\maxr */
	100,		/* \\maxs */
	0,			/* \\maxn */
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

	NULL,		/* dictionary orthography change filename */
	NULL,		/* dictionary orthography changes */

	FALSE, FALSE, FALSE,	/* parsing variables */
#ifdef EXPERIMENTAL_AMPLE
	NULL,					/* pPATRCategories */
	{
	FALSE,					/* sPATR.bFailure */
	TRUE,					/* sPATR.bUnification */
	PATR_FLAT_TREE,				/* sPATR.eTreeDisplay */
	TRUE,					/* sPATR.bGloss */
	TRUE,					/* sPATR.bGlossesExist */
						/* sPATR.iFeatureDisplay */
	PATR_FEATURE_ON | PATR_FEATURE_FLAT | PATR_FEATURE_ALL,
	TRUE,					/* sPATR.bCheckCycles */
	TRUE,					/* sPATR.bTopDownFilter */
	10,					/* sPATR.iMaxAmbiguities */
	0,					/* sPATR.iDebugLevel */
	PATR_DEFAULT_COMMENT,			/* sPATR.cComment */
	FALSE,					/* sPATR.bSilent */
	TRUE,					/* sPATR.bShowWarnings */
	TRUE,					/* sPATR.bPromoteDefAtoms */
	TRUE,					/* sPATR.bPropIsFeature */
	FALSE,					/* sPATR.bRecognizeOnly */
	0,					/* sPATR.iMaxProcTime */
#ifndef hab130
	0,					/* sPATR.eRootGlossFeature */
#endif /* hab130 */
	NULL,					/* sPATR.pLogFP */
	NULL,					/* sPATR.pFinalPunc */
	NULL,					/* sPATR.pszGrammarFile */
	NULL,					/* sPATR.pGrammar */
	2,
	NULL, NULL, NULL, NULL, NULL, NULL,	/* (lexicon markers) */
	0, 0,					/* (processing variables) */
	&sPCPATRMemory_g,
	0, 0, NULL,
	},
	0L,						/* uiPATRCallCount */
	0L,						/* uiPATRFailCount */
	0L,						/* uiPATRSkipCount */
#endif /* EXPERIMENTAL_AMPLE */
	FALSE,					/* bPumpMessages (SRMc 3.12.3) */
	0,                  /* size of allolist  (hab 3.2.5) */
						/* asAlloList is initialized in initalist() */
};
int		iPCPATRDebugLevel_g = 0;	/* debug level: 0 = off */
int		bPCPATRSilent_g = FALSE;	/* Keep quiet about errors? */
int		bPCPATRTiming_g = FALSE;	/* timing flag: on/off */
int		bPCPATRVerbose_g = FALSE;	/* verbose flag: on/off */
int		bPCPATRWarnUnusedFd_g = TRUE;	/* Warn about unused fd's? */
char *		pszPCPATRGrammarFile_g = NULL;	/* grammar filename */
StringList *	pPCPATRLexiconFiles_g = NULL;	/* list of lexicon filenames */
StringList *	pPCPATRAmpleFiles_g = NULL;	/* AMPLE files in lexicon */
/*
 *  -a anafile (command line argument)
 */
char *		pszPCPATRAnaFile_g = NULL;
/*
 *  -g grmfile (command line argument)
 */
char *		pszPCPATRGrmFile_g = NULL;
/*
 *  -l lexfile (command line argument)
 */
char *		pszPCPATRLexFile_g = NULL;
/*
 *  -t takfile (command line argument)
 */
char *		pszPCPATRTakFile_g = NULL;
/*
 *  -z filename or -Z address[,count]
 */
int		bCheckAlloc_g = FALSE;

char *	pszArgv0_g = NULL;	/* copy of argv[0] from main() */
char *emergency_memory = NULL;	/* memory to release if we run out of memory */

unsigned char szWhitespace_g[7] = " \t\n\v\f\r"; /* same chars as isspace() */
/*
 *  flag for type of AMPLE dictionaries
 */
int	bPCPATRUnifiedAmpleDictionary_g = FALSE;
/*
 *  flag whether or not to write the parse trees to the output .ANA file
 */
int	bPCPATRWriteAmpleParses_g = 0;
/*
 *  AMPLE specific settings (ambiguity and decomposition markers)
 */
unsigned char szPCPATRDefaultBarcodes_g[15] = "bdefhijmrsuvyz";
TextControl sPCPATRTextControl_g = {
	NULL,	/* filename */
	NULL,	/* list of lowercase/uppercase pairs sorted by lowercase */
	NULL,	/* list of lowercase/uppercase pairs sorted by uppercase */
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
	szPCPATRDefaultBarcodes_g,	/* S.I.L. Manuscripter bar codes */
	1,		/* flag whether or not to capitalize individual letters */
	1,		/* flag whether or not to decapitalize/recapitalize */
	500		/* maximum number of ambiguous decapitalizations allowed */
	};
/*
 *  function prototypes
 */
static void parse_command P((int, char **));
void exit_pcpatr P((int iExitStatus_in));

#ifdef MACINTOSH
#ifdef __STDC__
void increaseStackSize P((void));
#endif
#include <memory.h>
/***************************************************************************
 * NAME
 *    increaseStackSize
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    increase the stack space allocation by 100K
 * RETURN VALUES
 *    none
 */
void increaseStackSize()
{
unsigned long heapLimit;

heapLimit = (unsigned long)GetApplLimit() - 102400L;
SetApplLimit( (void *)heapLimit );
MaxApplZone();
}
#endif

#ifdef hab130l
				/* moved to disphead.c */
/*****************************************************************************
 * NAME
 *    display_header
 * DESCRIPTION
 *    Write the program header information to the screen (stderr).
 * RETURN VALUE
 *    none
 */
void display_header()
{
fprintf(stderr, "PC-PATR (PATR II style unification parser)\n");
fprintf(stderr, "Version %d.%d%c%d (%s), Copyright %s SIL\n",
	iPATRVersion_g, iPATRRevision_g, cPATRPatchSep_g,
	iPATRPatchlevel_g, pszPATRDate_g, pszPATRYear_g);
#ifdef __DATE__
fprintf(stderr, pszPATRCompileFormat_g,
	pszPATRCompileDate_g, pszPATRCompileTime_g);
#else
if (pszPATRTestVersion_g != NULL)
	fputs(pszPATRTestVersion_g, stderr);
#endif
fprintf(stderr, "with PC-Kimmo functions version %d.%d%c%d (%s)\n",
	iKimmoVersion_g, iKimmoRevision_g, cKimmoPatchSep_g,
	iKimmoPatchlevel_g, pszKimmoDate_g);
fprintf(stderr, "    and AMPLE functions version %d.%d%c%d (%s)\n",
	iAmpleVersion_g, iAmpleRevision_g, cAmplePatchSep_g,
	iAmplePatchlevel_g, pszAmpleDate_g);
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
#endif /* hab130l */

/*****************************************************************************
 * NAME
 *    exit_pcpatr
 * DESCRIPTION
 *    exit the program with the given status, after first displaying any
 *    needed message
 * RETURN VALUE
 *    none
 */
void exit_pcpatr(iExitStatus_in)
int	iExitStatus_in;
{
#ifdef MACINTOSH
fprintf(stderr, "\nUse the Quit command on the File menu (Command-Q)\n");
#endif
#ifdef QUICKWIN
fprintf(stderr, "\nUse the Exit command on the File menu (Control-C)\n");
#endif
exit(iExitStatus_in);
}

/***************************************************************************
 * NAME
 *    reportPATROutOfMemory
 * ARGUMENTS
 *    size - amount of memory desired, but unable to allocate
 * DESCRIPTION
 *    Die with an appropriate error message for running out of memory.
 * RETURN VALUE
 *    doesn't return!
 */
static void reportPATROutOfMemory(size)
size_t size;
{
static const char * nomem_msg = "\nERROR 900:\n    Out of memory\n";

if (emergency_memory != (char *)NULL)
	{
	free(emergency_memory);
	emergency_memory = (char *)NULL;
	}
if (!bPCPATRSilent_g)
	fprintf(stderr, nomem_msg);
if (sPCPATRData_g.pLogFP != (FILE *)NULL)
	fprintf(sPCPATRData_g.pLogFP, nomem_msg);

exit_pcpatr(2);
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
 *    actual parsing.
 * RETURN VALUES
 *    none
 */
int main(argc,argv)
int argc;
char **argv;
{
#ifdef MACINTOSH
increaseStackSize();
#endif
#ifdef __MWERKS__
SIOUXSettings.asktosaveonclose = FALSE;
setvbuf(stderr, szStderrBuffer, _IOLBF, (size_t)BUFSIZ);
#endif

#ifdef THINK_C
SetWTitle( FrontWindow(), "\pPC-PATR");
argc = ccommand(&argv);
#endif

emergency_memory = malloc((size_t)16384);	/* need >8K for MPW C */
				/* error handler for memory allocation */
pfOutOfMemory_g  = reportPATROutOfMemory;
pszCmdProgramName_g = "pcpatr";	/* program name for building filenames */

parse_command(argc, argv);	/* handle the command line args */

initPATRSentenceFinalPunctuation(&sPCPATRData_g);
user_cmd();
clearPATRSentenceFinalPunctuation(&sPCPATRData_g);
if (bCheckAlloc_g)
	do_clear();

exit_pcpatr(EXIT_SUCCESS);

return 0;	/* not actually reached */
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
	pszArgv0_g = argv[0];
while ((k = getopt(argc, argv, "A:a:G:g:L:l:QqT:t:/Z:z:")) != EOF)
	{
	switch (k)
	{
	case 'A':		/* AMPLE analysis filename */
	case 'a':
		pszPCPATRAnaFile_g = optarg;
		break;

	case 'G':		/* initial grammar filename */
	case 'g':
		pszPCPATRGrmFile_g = optarg;
		break;

	case 'L':		/* initial lexicon filename */
	case 'l':
		pszPCPATRLexFile_g = optarg;
		break;

	case 'Q':		/* work as quietly as possible */
	case 'q':
		bPCPATRSilent_g = TRUE;
		sPCPATRData_g.bSilent = TRUE;
		sPCPATRKimmoData_g.bSilent = TRUE;
		sPCPATRKimmoData_g.sPATR.bSilent = TRUE;
		sPCPATRAmpleData_g.bQuiet = TRUE;
#ifdef EXPERIMENTAL_AMPLE
		sPCPATRAmpleData_g.sPATR.bSilent = TRUE;
#endif
		break;

	case 'T':		/* initial command filename */
	case 't':
		pszPCPATRTakFile_g = optarg;
		break;

	case '/':
		++iPCPATRDebugLevel_g;
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
if (pszPCPATRTakFile_g == NULL)
	{
	sPCPATRData_g.bSilent = FALSE;
	sPCPATRKimmoData_g.bSilent = FALSE;
	sPCPATRKimmoData_g.sPATR.bSilent = FALSE;
	sPCPATRAmpleData_g.bQuiet = FALSE;
#ifdef EXPERIMENTAL_AMPLE
	sPCPATRAmpleData_g.sPATR.bSilent = FALSE;
#endif
	}
if (errflag)
	{
#ifndef hab130l
	display_header(stderr);
#else  /* hab130l */
	display_header();
#endif /* hab130l */
	fputs("\
Usage:  pcpatr [-q] [-g grmfile] [-l lexfile] [-a anafile] [-t takfile]\n\
	-q           work as quietly as possible (requires -t as well)\n\
	-g grmfile	 load the grammar from grmfile\n\
	-l lexfile   load the lexicon from lexfile\n\
	-a anafile   load the lexicon from anafile (an AMPLE analysis file)\n\
	-t takfile   take commands from takfile\n\
\n\
Only one of -a or -l may be used to load the lexicon.\n\
", stderr );
	exit_pcpatr(EXIT_FAILURE);
	}
if (!sPCPATRData_g.bSilent)
#ifndef hab130l
	display_header(stderr);
#else  /* hab130l */
	display_header();
#endif /* hab130l */
}
