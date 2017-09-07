/* AMPLE.C - A Morphological Parser for Linguistic Exploration
 *****************************************************************************
 *
 * INPUT is taken from a text file
 * OUTPUT is written to a file in which each word is a record with fields:
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
 *#ifdef EXPERIMENTAL
 *    \WordParse
 *    \endWordParse
 *#endif EXPERIMENTAL
 *
 *****************************************************************************
 * edit history is in version.h
 *****************************************************************************
 * Copyright 1988, 2002 by SIL International.  All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"
#include "version.h"
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

extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;

#ifndef FILENAME_MAX
#define FILENAME_MAX 128
#endif

/*****************************************************************************
 *  local function prototypes
 */
static void		parse_command	P((int argc,
					   char **argv,
					   char * pszTime_in));
static void		usage		P((void));
static void		print_header	P((FILE * pOutFP_in,
					   char * pszTime_in));
static void		anset		P((void));
static void		report_results	P((void));
static void		anproc		P((void));
static void		outstats	P((void));
static void		show_test	P((char *header,
					   AmpleTestList *list));
#ifdef ADHOC_DEBUG
static void		disp_ahlist	P((AmplePairList *adh_list));
#endif
static int		readAmpleWord	P((FILE *infp));
static int		fill_template	P((FILE *infp));
static WordTemplate *	init_template	P((void));

/*****************************************************************************
 *  local global data
 */
static TextControl sDefaultTextControl_m = {
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
	NULL,	/* (Manuscripter) bar codes */
	TRUE,	/* flag whether or not to capitalize individual letters */
	TRUE,	/* flag whether or not to decapitalize/recapitalize */
	100		/* maximum number of decapitalization alternatives to use */
	};
/*
 *  count of words analyzed
 */
static unsigned long	uiWordCount_m = 0L;
/*
 *  report ambiguous words percentages (1.9u BJY)
 */
static int	bShowPercentages_m = FALSE;
/*
 *  program exit / error status
 */
static int	iExitStatus_m = 0;
/*
 *  cumulative ambiguity counts
 */
#define MAXAMBIG 16			/* high level of ambiguity for stats */
static long	aiAmbigCounts_m[MAXAMBIG+1];
/*
 *  flag to monitor progress of parsing
 */
static int	bMonitorProgress_m = FALSE;
/*
 *  flag to verify test parsing
 */
static int	bVerifyLoading_m = FALSE;
/*
 *  flag that morpheme dictionaries are combined
 */
static int	bUnifiedDictionary_m = FALSE;
/*
 *  flag to check morphname referencing
 */
static int	bCheckMorphnameRefs_m = FALSE;
/*
 *  Name of declaration file name file
 */
static char *	pszCommandFile_m = NULL;
/*
 *  Input file name
 */
static char *	pszInputFile_m = NULL;
#ifdef EXPERIMENTAL
/*
 *  PATR grammar file name
 */
static char *	pszGrammarFile_m = NULL;
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
#endif /* EXPERIMENTAL */
/*
 *  Output file name
 */
static char *	pszOutputFile_m = NULL;
/*
 *  Flag that optional output was set on the command line
 */
static int	bOptionalOutputSet_m = FALSE;
/*
 *  Flag that we are checking memory allocation.
 */
static int	bCheckAlloc_m = FALSE;
/*
 *  information loaded from the text input control file and "analysis data"
 *  (control) file
 */
static AmpleData	sAmpleData_m = {
	FALSE,		/* -a	bDebugAllomorphConds */
	FALSE,		/* -b	bEnableAllomorphConds */
	'|',		/* -c:	cBeginComment */
	FALSE,		/* -g	bRootGlosses */
	FALSE,		/* -q	bQuiet */
	DEFAULTTRIEDEPTH,		/* -d:	iMaxTrieDepth */
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
	NULL,		/* \\pcl  3.3.0 hab */
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
#ifdef EXPERIMENTAL
#ifndef hab350
	NULL,		/* \\ancc */
#endif /* hab350 */
#endif /* EXPERIMENTAL */
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

	FALSE, FALSE, FALSE,	/* parsing variables */
	NULL, 0,            /* dynamic array of morphnames (hab 3.2.5) */
	NULL, 0,            /* dynamic array of allomorphs (hab 3.2.5) */
	NULL,               /* list of full reduplication allomorphs */
	NULL,               /* list of partial reduplication allomorphs */
	NULL,               /* root morphname exceptions   (hab 3.2.5) */
	0,                  /* # records processed for a dictionary (hab 3.2.5) */
	NULL,               /* ptr to tail of list of morphemes  (hab 3.2.5) */
	NULL,               /* dictionary error message header  (hab 3.2.5) */
	NULL,               /* dictionary type  (hab 3.2.5) */
	0,                  /* size of morphname variable  (hab 3.2.5) */
#ifdef EXPERIMENTAL
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
	'|',					/* sPATR.cComment */
	FALSE,					/* sPATR.bSilent */
	TRUE,					/* sPATR.bShowWarnings */
	TRUE,					/* sPATR.bPromoteDefAtoms */
	TRUE,					/* sPATR.bPropIsFeature */
#ifndef hab350
	PATR_ROOT_GLOSS_NO_FEATURE,             /* sPATR.eRootGlossFeature */
#endif /* hab350 */
	FALSE,					/* sPATR.bRecognizeOnly */
	0,					/* sPATR.iMaxProcTime */
	NULL,					/* sPATR.pLogFP */
	NULL,					/* sPATR.pFinalPunc */
	NULL,					/* sPATR.pszGrammarFile */
	NULL,					/* sPATR.pGrammar */
	0,
	NULL, NULL, NULL, NULL, NULL, NULL,	/* (lexicon markers) */
#ifndef hab350
	NULL,                                   /* (root gloss marker) */
#endif /* hab350 */
	0, 0, 					/* (processing variables) */
	&sAmplePATRMemory_m,
	0, 0, NULL,
	},
	0L,						/* uiPATRCallCount */
	0L,						/* uiPATRFailCount */
	0L,						/* uiPATRSkipCount */
#endif /* EXPERIMENTAL */
	0,                  /* size of allolist  (hab 3.2.5) */
						/* asAlloList is initialized in initalist() */
	};
/*
 *  AMPLE requires a sliding window of words, using the previous word and the
 *  next word to parse the current word
 */
static AmpleWord	sAmpleThisWord_m;
static AmpleWord	sAmplePreviousWord_m;
static AmpleWord	sAmpleNextWord_m;

#ifdef _WINDOWS
#define main(a,b) dosmain(a,b)
#endif
/*****************************************************************************
 * NAME
 *    main
 * DESCRIPTION
 *    main procedure for morphological parsing program
 * RETURN VALUE
 *    none
 */
int main(argc, argv)
int	argc;	/* number of command line arguments */
char **	argv;	/* pointer to array of command line arguments */
{
time_t		clock;
char *		pszTime;

time( &clock );
pszTime = ctime(&clock);

parse_command(argc, argv, pszTime);
/*
 *  set the log file pointer
 */
if (!isatty(fileno(stdout)))
	sAmpleData_m.pLogFP = stdout;
else
	sAmpleData_m.pLogFP = NULL;
/*
 *  write the header to the log file
 */
if (sAmpleData_m.pLogFP != NULL)
	{
	print_header(sAmpleData_m.pLogFP, pszTime);
	if ( !bVerifyLoading_m )
	{
	fprintf( sAmpleData_m.pLogFP, "\n");
	/* If selective trace, print file name */
	if ( sAmpleData_m.pszSelectiveAnalFile )
		fprintf( sAmpleData_m.pLogFP, "Selective trace from file %s\n",
			 sAmpleData_m.pszSelectiveAnalFile );
	/* Print header for file list */
	fprintf( sAmpleData_m.pLogFP,
		 "Control files, dictionary files, and responses");
	/* If command file from -f option, print its name */
	if ( pszCommandFile_m )
		fprintf( sAmpleData_m.pLogFP, "\n	  from file %s",
			 pszCommandFile_m );
	fprintf( sAmpleData_m.pLogFP, ":\n");
	}
	}
/*
 *  allocate space for records
 */
pRecordBuffer_g	     = (char *)allocMemory( BIG_RECSIZE );
uiRecordBufferSize_g = BIG_RECSIZE;
/*
 *  load dictionaries and tables
 */
anset();
#ifdef _MSC_VER
#ifdef HEAPDUMP
if ((sAmpleData_m.iDebugLevel == 5) && (sAmpleData_m.pLogFP != NULL))
	{
	fprintf( sAmpleData_m.pLogFP, "\nHEAP AFTER INIT:\n");
	heapdump();
	fflush(sAmpleData_m.pLogFP);
#ifndef _WINDOWS
	system( "mapmem" );
#endif
	}
#endif
#endif
/*
 *  process the data
 */
anproc();
/*
 *  If checking memory allocations, free everything that was dynamically
 *  allocated.
 */
if (bCheckAlloc_m)
	resetAmpleData( &sAmpleData_m );

#ifdef MACINTOSH
fprintf(stderr, "\nUse the Quit command on the File menu (Command-Q)\n");
#endif
#ifdef QUICKWIN
fprintf(stderr, "\nUse the Exit command on the File menu (Control-C)\n");
#endif

/*exitSafely(iExitStatus_m);*/		/* Exit with errorlevel
					   0 is perfect, 2 is some failures
					   1 (above) is command line error */
/* xample on linux64 doesn't seem to like exit at times */
return iExitStatus_m;
}

/***************************************************************************
 * NAME
 *    parse_command
 * DESCRIPTION
 *    Parse the command line, and set all variables from options.
 * RETURN VALUE
 *    none (exits the program if there is an error)
 */
static void parse_command(argc, argv, pszTime_in)
int	argc;		/* number of command line arguments */
char **	argv;		/* pointer to array of command line arguments */
char *	pszTime_in;
{
int	k;
int	bShowUsage = FALSE;
VOIDP	trap_address = NULL;
int	trap_count = 0;
char *	p;
char * pszSelectiveAnalFile = NULL;

#ifdef USE_CCOMMAND
print_header(stderr, pszTime_in);
argc = ccommand(&argv);
#endif
/*
 *  parse command line for any options
 */
#ifdef AZTEC
argv[0] = "ample";
#endif
while ((k = getopt(argc, argv, "abc:d:e:f:gi:l:jmn:o:pqrs:tuvw:x:/z:Z:")) != EOF)
	{
	switch (k)
	{
	case 'a':			/* debug allomorph conditions*/
		sAmpleData_m.bDebugAllomorphConds = TRUE;
		break;

	case 'b':			/* enable allomorph ID strings */
		sAmpleData_m.bEnableAllomorphIDs = TRUE;
		break;

	case 'c':			/* record comment character */
		sAmpleData_m.cBeginComment = *optarg;
		break;

	case 'd':			/* dictionary trie depth */
		sAmpleData_m.iMaxTrieDepth = atoi(optarg);
		if (sAmpleData_m.iMaxTrieDepth < 1)
		sAmpleData_m.iMaxTrieDepth = 1;		/* force a minimum */
		if (sAmpleData_m.iMaxTrieDepth >= MAXMORPH)
		sAmpleData_m.iMaxTrieDepth = MAXMORPH - 1; /* and a maximum */
		break;

#ifdef EXPERIMENTAL
	case 'e':			/* PC-PATR style grammar file name */
		pszGrammarFile_m = optarg;
		break;
#endif /* EXPERIMENTAL */

	case 'f':			/* file of declaration file names */
		pszCommandFile_m = optarg;	    /* pick up name */
		break;

	case 'g':			/* output root gloss option */
		sAmpleData_m.bRootGlosses = TRUE;
		break;

	case 'i':			/* input file name */
		pszInputFile_m = optarg;	    /* pick up name */
		break;

#ifdef EXPERIMENTAL
	case 'j':			/*don't store parse results */
		sAmpleData_m.sPATR.bRecognizeOnly = TRUE;
		break;

	case 'l':			/* max analyses to return */
		sAmpleData_m.iMaxAnalysesToReturn = atoi(optarg);
		if (sAmpleData_m.iMaxAnalysesToReturn < 1)
		sAmpleData_m.iMaxAnalysesToReturn = MAX_ANALYSES_TO_RETURN_NO_LIMIT;
		break;
#endif /* EXPERIMENTAL */

	case 'm':			/* monitor progress option */
		bMonitorProgress_m = TRUE;
		break;

	case 'n':			/* maximum morphname length trigger */
		sAmpleData_m.iMaxMorphnameLength = atoi(optarg);
		if (sAmpleData_m.iMaxMorphnameLength < 1)
		sAmpleData_m.iMaxMorphnameLength = 1;	/* force a minimum */
		break;

	case 'o':				/* output file name */
		pszOutputFile_m = optarg;		/* pick up name */
		break;

	case 'p':				/* 1.9u BJY output ambiguity */
		bShowPercentages_m = TRUE;		/*   percentage statistics */
		break;

	case 'q':
		sAmpleData_m.bQuiet = TRUE;
		break;

	case 'r':			/* morphname reference check option */
		bCheckMorphnameRefs_m = TRUE;
		break;

	case 's':			/* selective analysis option */
		pszSelectiveAnalFile = optarg;
		break;

	case 't':			/* trace option */
		sAmpleData_m.eTraceAnalysis++;
		if (sAmpleData_m.eTraceAnalysis > AMPLE_TRACE_XML)
		sAmpleData_m.eTraceAnalysis = AMPLE_TRACE_XML;
		break;

	case 'u':			/* combined dictionaries option */
		bUnifiedDictionary_m = TRUE;
		break;

	case 'v':			/* verify via pretty printing */
		bVerifyLoading_m = TRUE;
		break;

	case 'w':			/* write optional output option */
		bOptionalOutputSet_m = TRUE;
		if (strchr(optarg, 'd') != NULL)
		sAmpleData_m.iOutputFlags |= WANT_DECOMPOSITION;
		if (strchr(optarg, 'p') != NULL)
		sAmpleData_m.iOutputFlags |= WANT_PROPERTIES;
		if (strchr(optarg, 'w') != NULL)
		sAmpleData_m.iOutputFlags |= WANT_ORIGINAL;
		break;

	case 'x':			/* exclude optional output option */
		bOptionalOutputSet_m = TRUE;
		if (strchr(optarg, 'd') != NULL)
		sAmpleData_m.iOutputFlags &= ~WANT_DECOMPOSITION;
		if (strchr(optarg, 'p') != NULL)
		sAmpleData_m.iOutputFlags &= ~WANT_PROPERTIES;
		if (strchr(optarg, 'w') != NULL)
		sAmpleData_m.iOutputFlags &= ~WANT_ORIGINAL;
		break;

	case '/':			/* debug option */
		++sAmpleData_m.iDebugLevel;		/* count the slashes */
		break;

	case 'z':		/* memory allocation trace filename */
		setAllocMemoryTracing(optarg);
		bCheckAlloc_m = TRUE;
		break;

	case 'Z':		/* memory allocation trap address,count */
/*
size_t len = 0;
if (1 == sscanf(input, "%zu", &len))
printf("len is %zu\n", len);
*/
		trap_address = (VOIDP)strtoull(optarg, &p, 0);
		if (trap_address != (VOIDP)NULL)
		{
		if (*p == ',')
			trap_count = (int)strtoul(p+1, NULL, 10);
		if (trap_count == 0)
			trap_count = 1;
		setAllocMemoryTrap(trap_address, trap_count);
		}
		bCheckAlloc_m = TRUE;
		break;

	default:			/* unrecognized option */
		bShowUsage = TRUE;
		break;
	}
	} /* end switch */

if ((optind < argc) && (strcmp(argv[optind],"?") == 0))
	bShowUsage = TRUE;

#ifndef USE_CCOMMAND
if (!sAmpleData_m.bQuiet || bShowUsage)
	print_header(stderr, pszTime_in);
#endif
if (	bShowUsage ||
	((optind < argc) && (strcmp(argv[optind],"?") == 0)) )
	{
	usage();
	exitSafely(1);
	}

/* do this after memory allocation tracing has a chance to be set up */
if (pszSelectiveAnalFile)
	loadAmpleSelectiveAnalFile(pszSelectiveAnalFile, &sAmpleData_m);
}

/*****************************************************************************
 * NAME
 *    usage
 * DESCRIPTION
 *    Print a terse summary of the command options.
 * RETURN VALUE
 *    none
 */
static void usage()
{
fputs("\
Usage: ample [options]\n\
\n\
-a       enable Allomorph condition debugging\n\
-b       enaBle allomorph identifiers\n\
", stderr); fprintf(stderr, "\
-c char  select the record Comment character (default is '|')\n\
-d num   select the dictionary trie Depth (default is %d)\n\
", DEFAULTTRIEDEPTH);
#ifdef EXPERIMENTAL
fputs("-e file  File containing a PC-PATR style word grammar\n", stderr);
#endif /* EXPERIMENTAL */
fputs("\
-f file  File containing names of data files\n\
-g       output root Glosses in analysis file from dictionary code G\n\
", stderr); fputs("\
-i file  name of a single Input text file\n", stderr);
#ifdef EXPERIMENTAL
fputs("\
-j       enable \"Recognize Only\" mode (don't store or write PC-PATR parses)\n\
-l num   select the maximum number of analyses to return (default is all)\n",
	stderr);
#endif /* EXPERIMENTAL */
fputs("\
-m       Monitor progress of an analysis:  * = failure; . = 1 analysis;\n\
		 2-9 = 2-9 ambiguities; > = 10 or more ambiguities\n\
-n num   maximum recommended morphname length\n\
", stderr); fputs("\
-o file  name of the Output analysis file\n\
-p       report ambiguous words Percentages\n\
-q       work quietly without screen output\n\
-r       check References to morphnames in all tests\n\
", stderr); fputs("\
-s file  Selective analysis for trace (only morphemes in file)\n\
-t       Trace analyses (produces voluminous output)\n\
-u       dictionaries are Unified, not split into prefix, ..., root\n\
-v       Verify tests by pretty printing the parse trees\n\
", stderr); fputs("\
-w [d][p][w]  enables Writing the indicated fields (\\d, \\p, or \\w)\n\
-x [d][p][w]  eXcludes the indicated fields (\\d, \\p, or \\w) from output\n\
", stderr);
}

/*****************************************************************************
 * NAME
 *    print_header
 * DESCRIPTION
 *    print the program header to the indicated file (possibly the screen)
 * RETURN VALUE
 *    none
 */
static void print_header(pOutFP_in, pszTime_in)
FILE *	pOutFP_in;
char *	pszTime_in;
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
	"    AMPLE with extensions: PC-PATR word grammar\n");
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
fprintf( pOutFP_in, "                Analysis Performed %s", pszTime_in );
}

/*****************************************************************************
 * NAME
 *    anset
 * DESCRIPTION
 *    load the control files and dictionaries
 * RETURN VALUE
 *    none
 */
static void anset()
{
FILE *		infp;
char		infname[FILENAME_MAX];
char		szPrompt[64];
int		iCount;
static const char	szRootDictPrompt_s[] = "\
Root dictionary file (xxRTnn.DIC)";
static const char	szDictPrompt_s[] = "\
Dictionary file (xxYYYYnn.DIC)";
static const char	szDictLoadMessage_s[] = "\
		%s DICTIONARY: Loaded %d record%s\n";
static const char	szDictErrorMessage_s[] = "\
Cannot open dictionary file %s\n";
static const char	szMissingDictCodeRecord_s[] = "\
DICTIONARY CODE TABLE: missing record in change table.\n\
			   Expected a %s record, but did not find it\n";
/*
 *  Open -f command_file if there is one
 *  If logging file names and not verifying tests, output to log file as well
 */
openAmpleCmdFile( pszCommandFile_m, sAmpleData_m.bQuiet );
logAmpleCmds( bVerifyLoading_m ? NULL : sAmpleData_m.pLogFP );
/*
 *  allocate space for morpheme checking
 */
initAmpleMorphChecking(bCheckMorphnameRefs_m, &sAmpleData_m);
/*
 *  load the AMPLE analysis control file
 */
getAmpleCmd("Analysis data file (xxAD01.CTL): ", infname, FILENAME_MAX);
/*infp = fopenAlways(infname, "r");*/
/*fclose(infp);*/
if (loadAmpleControlFile(infname, &sAmpleData_m) != 0)
	{
	reportError(ERROR_MSG, "Error reading analysis data file %s\n", infname);
	exitSafely(1);
	}

if (bVerifyLoading_m)
	{
	writeAmpleTests( "Prefix", &sAmpleData_m );
	writeAmpleTests( "Infix",  &sAmpleData_m );
	writeAmpleTests( "Root",   &sAmpleData_m );
	writeAmpleTests( "Suffix", &sAmpleData_m );
	writeAmpleTests( "Final",  &sAmpleData_m );
	}

#ifdef ADHOC_DEBUG
if (sAmpleData_m.pLogFP != NULL)
	{
	if (sAmpleData_m.iMaxPrefixCount > 0)
	{
	fprintf (sAmpleData_m.pLogFP,"PREFIX adhoc list is:\n");
	disp_ahlist(sAmpleData_m.pPrefixAdhocPairs);
	}
	if (sAmpleData_m.iMaxInfixCount > 0)
	{
	fprintf (sAmpleData_m.pLogFP,"INFIX adhoc list is:\n");
	disp_ahlist(sAmpleData_m.pInfixAdhocPairs);
	}
	if (    (sAmpleData_m.iMaxRootCount > 1) ||
		(sAmpleData_m.iMaxPrefixCount > 0) ||
		(sAmpleData_m.iMaxInfixCount  > 0) )
	{
	fprintf (sAmpleData_m.pLogFP,"ROOT adhoc list is:\n");
	disp_ahlist(sAmpleData_m.pRootAdhocPairs);
	}
	if (sAmpleData_m.iMaxSuffixCount > 0)
	{
	fprintf (sAmpleData_m.pLogFP,"SUFFIX adhoc list is:\n");
	disp_ahlist(sAmpleData_m.pSuffixAdhocPairs);
	}
	}
#endif /* ADHOC_DEBUG */
/*
 *  If verify, display
 */
if (bVerifyLoading_m && (sAmpleData_m.pLogFP != NULL))
	fprintf(sAmpleData_m.pLogFP, "\nMemory used for classes and tests: %5zu\n",
		getAndClearAllocMemorySum() );

/* ================================================================
 *  load code tables for dictionary databases
 */
getAmpleCmd("Dictionary code table (xxANCD.TAB or xxGyCD.TAB): ",
		infname, FILENAME_MAX);
if (loadAmpleDictCodeTables(infname, &sAmpleData_m) != 0)
	exitSafely(1);		/* Exit with error status */

if (bUnifiedDictionary_m && (sAmpleData_m.pDictTable == NULL))
	{
	reportError(ERROR_MSG, szMissingDictCodeRecord_s, "\\unified");
	exitSafely(1);		/* Exit with error status */
	}
if (	!bUnifiedDictionary_m &&
	(sAmpleData_m.pDictTable   != NULL) &&
	(sAmpleData_m.pPrefixTable == NULL) &&
	(sAmpleData_m.pInfixTable  == NULL) &&
	(sAmpleData_m.pSuffixTable == NULL) &&
	(sAmpleData_m.pRootTable   == NULL) )
	{
	reportError(WARNING_MSG,
		"Assuming unified dictionary despite missing -u option.\n");
	bUnifiedDictionary_m = TRUE;
	}
if (!bUnifiedDictionary_m)
	{
	if (    (sAmpleData_m.iMaxPrefixCount != 0) &&
		(sAmpleData_m.pPrefixTable == NULL))
	{
	reportError(ERROR_MSG, szMissingDictCodeRecord_s, "\\prefix");
	exitSafely(1);		/* Exit with error status */
	}
	if (    (sAmpleData_m.iMaxInfixCount != 0) &&
		(sAmpleData_m.pInfixTable == NULL))
	{
	reportError(ERROR_MSG, szMissingDictCodeRecord_s, "\\infix");
	exitSafely(1);		/* Exit with error status */
	}
	if (    (sAmpleData_m.iMaxSuffixCount != 0) &&
		(sAmpleData_m.pSuffixTable == NULL))
	{
	reportError(ERROR_MSG, szMissingDictCodeRecord_s, "\\suffix");
	exitSafely(1);		/* Exit with error status */
	}
	if (sAmpleData_m.pRootTable == NULL)
	{
	reportError(ERROR_MSG, szMissingDictCodeRecord_s, "\\root");
	exitSafely(1);		/* Exit with error status */
	}
	}
/* ================================================================
 *  load the optional dictionary input orthography change file
 */
getAmpleCmd("Dictionary orthography change table (xxORDC.TAB) [none]: ",
		infname, FILENAME_MAX);
if (infname[0] != NUL)
	{
	if (loadAmpleDictOrthoChanges(infname, &sAmpleData_m) != 0)
	{
	reportError(ERROR_MSG,
		   "Cannot load dictionary orthography change table from %s\n",
			infname);
	exitSafely(1);		/* Exit with error status */
	}
	}
else
	sAmpleData_m.pDictOrthoChanges = (Change *)NULL;

getAndClearAllocMemorySum();	    /* Clear memory used */

/*
 *  reduce amount of memory allocated for records
 */
freeMemory( pRecordBuffer_g );
pRecordBuffer_g = (char *)allocMemory( SMALL_RECSIZE );
uiRecordBufferSize_g = SMALL_RECSIZE;

/* ================================================================
 *  load all the dictionaries in order
 */
if (bUnifiedDictionary_m)
	{
	/*
	 *  load Source Dialect dictionary: may be multiple files
	 */
	if (!sAmpleData_m.bQuiet)
	reportAmpleDictCodeTable(AMPLE_UNIFIED, &sAmpleData_m);
	sprintf(szPrompt, "%s: ", szDictPrompt_s);
	getAmpleCmd(szPrompt, infname, FILENAME_MAX);
	sprintf(szPrompt, "Next %s [no more]: ", szDictPrompt_s);
	do
	{
	iCount = loadAmpleDictionary(infname, AMPLE_UNIFIED,
					 &sAmpleData_m);
	if (iCount == -1)
		{
		reportError(ERROR_MSG, szDictErrorMessage_s, infname);
		}
	else
		{
		reportMessage(!sAmpleData_m.bQuiet, szDictLoadMessage_s,
			  "UNIFIED", iCount, (iCount == 1) ? "" : "s" );
		}
	getAmpleCmd(szPrompt, infname, FILENAME_MAX);
	} while (infname[0]);
	freeCodeTable( sAmpleData_m.pDictTable );
	sAmpleData_m.pDictTable = NULL;
	freeMemory( sAmpleData_m.pszDictionaryCodesFile );
	sAmpleData_m.pszDictionaryCodesFile = NULL;
	/*
	 *  If verify, display
	 */
	if (bVerifyLoading_m && (sAmpleData_m.pLogFP != NULL))
	fprintf(sAmpleData_m.pLogFP,
		"\nMemory used for unified dictionaries: %5zu\n",
		getAndClearAllocMemorySum());
	}
else
	{
	if (sAmpleData_m.iMaxPrefixCount)
	{
	/*
	 *	load Source Dialect prefix dictionary
	 */
	if (!sAmpleData_m.bQuiet)
		reportAmpleDictCodeTable(AMPLE_PFX, &sAmpleData_m);
	getAmpleCmd("\nPrefix dictionary file (xxPF01.DIC): ",
			infname, FILENAME_MAX);
	iCount = loadAmpleDictionary(infname, AMPLE_PFX, &sAmpleData_m);
	if (iCount == -1)
		{
		reportError(ERROR_MSG, szDictErrorMessage_s, infname);
		exitSafely(1);
		}
	else
		{
		reportMessage(!sAmpleData_m.bQuiet, szDictLoadMessage_s,
			  "PREFIX", iCount, (iCount == 1) ? "" : "s" );
		}
	freeCodeTable( sAmpleData_m.pPrefixTable );
	sAmpleData_m.pPrefixTable = NULL;
	/*
	 *	If verify, display
	 */
	if (bVerifyLoading_m && (sAmpleData_m.pLogFP != NULL))
		fprintf(sAmpleData_m.pLogFP,
			"Memory used for prefix dictionary: %5zu\n",
			getAndClearAllocMemorySum());
	}

	if (sAmpleData_m.iMaxInfixCount)
	{
	/*
	 *	load Source Dialect infix dictionary
	 */
	if (!sAmpleData_m.bQuiet)
		reportAmpleDictCodeTable(AMPLE_IFX, &sAmpleData_m);
	getAmpleCmd("\nInfix dictionary file (xxIF01.DIC): ",
			infname, FILENAME_MAX);
	iCount = loadAmpleDictionary(infname, AMPLE_IFX, &sAmpleData_m);
	if (iCount == -1)
		{
		reportError(ERROR_MSG, szDictErrorMessage_s, infname);
		exitSafely(1);
		}
	else
		{
		reportMessage(!sAmpleData_m.bQuiet, szDictLoadMessage_s,
			  "INFIX", iCount, (iCount == 1) ? "" : "s" );
		}
	freeCodeTable( sAmpleData_m.pInfixTable );
	sAmpleData_m.pInfixTable = NULL;
	/*
	 *	If verify, display
	 */
	if (bVerifyLoading_m && (sAmpleData_m.pLogFP != NULL))
		fprintf(sAmpleData_m.pLogFP,
			"Memory used for infix dictionary: %5zu\n",
			getAndClearAllocMemorySum());
	}

	if (sAmpleData_m.iMaxSuffixCount)
	{
	/*
	 *  load Source Dialect suffix dictionary
	 */
	if (!sAmpleData_m.bQuiet)
		reportAmpleDictCodeTable(AMPLE_SFX, &sAmpleData_m);
	getAmpleCmd("\nSuffix dictionary file (xxSF01.DIC): ",
			infname, FILENAME_MAX);
	iCount = loadAmpleDictionary(infname, AMPLE_SFX, &sAmpleData_m);
	if (iCount == -1)
		{
		reportError(ERROR_MSG, szDictErrorMessage_s, infname);
		exitSafely(1);
		}
	else
		{
		reportMessage(!sAmpleData_m.bQuiet, szDictLoadMessage_s,
			  "SUFFIX", iCount, (iCount == 1) ? "" : "s" );
		}
	freeCodeTable( sAmpleData_m.pSuffixTable );
	sAmpleData_m.pSuffixTable = NULL;
	/*
	 *	If verify, display
	 */
	if (bVerifyLoading_m && (sAmpleData_m.pLogFP != NULL))
		fprintf(sAmpleData_m.pLogFP,
			"Memory used for suffix dictionary: %5zu\n",
			getAndClearAllocMemorySum());
	}
	/*
	 *  reduce amount of memory allocated for records
	 */
	freeMemory( pRecordBuffer_g );
	pRecordBuffer_g = (char *)allocMemory( SMALL_RECSIZE );
	uiRecordBufferSize_g = SMALL_RECSIZE;
	getAndClearAllocMemorySum();
	/*
	 *  load Source Dialect root dictionary: may be multiple files
	 */
	if (!sAmpleData_m.bQuiet)
	reportAmpleDictCodeTable(AMPLE_ROOT, &sAmpleData_m);
	sprintf(szPrompt, "\n%s: ", szRootDictPrompt_s);
	getAmpleCmd(szPrompt, infname, FILENAME_MAX);
	sprintf(szPrompt, "Next %s [no more]: ", szRootDictPrompt_s);
	do
	{
	iCount = loadAmpleDictionary(infname, AMPLE_ROOT, &sAmpleData_m);
	if (iCount == -1)
		{
		reportError(ERROR_MSG, szDictErrorMessage_s, infname);
		}
	else
		{
		reportMessage(!sAmpleData_m.bQuiet, szDictLoadMessage_s,
			  "ROOT", iCount, (iCount == 1) ? "" : "s" );
		}
	getAmpleCmd(szPrompt, infname, FILENAME_MAX);
	} while (infname[0]);
	freeCodeTable( sAmpleData_m.pRootTable );
	sAmpleData_m.pRootTable = NULL;
	freeMemory( sAmpleData_m.pszDictionaryCodesFile );
	sAmpleData_m.pszDictionaryCodesFile = NULL;
	/*
	 *  If verify, display
	 */
	if (bVerifyLoading_m && (sAmpleData_m.pLogFP != NULL))
	fprintf(sAmpleData_m.pLogFP,
		"\nMemory used for root dictionaries: %5zu\n",
		getAndClearAllocMemorySum());
	}
/*
 *  check the morphnames in all the allomorph environment constraints and
 *   co-occurrence constraints
 */
checkAmpleMorphs(bCheckMorphnameRefs_m, &sAmpleData_m, TRUE); /* 3.3.3 hab */
				/* added TRUE to free space used by check */

#if 0 /*DEBUG ONLY*/
/*
 *  write the dictionary contents to the indicated file (DEBUG ONLY)
 */
writeAmpleDictionary("test.dic", &sAmpleData_m);
#endif

/* ================================================================
 *  load text input control file, first setting default values
 */
memcpy(&sAmpleData_m.sTextCtl, &sDefaultTextControl_m, sizeof(TextControl));
getAmpleCmd("Text Control File (xxINTX.CTL) [none]: ", infname, FILENAME_MAX);
if (infname[0])
	{
	infp = fopenAlways(infname, "r");
	fclose(infp);
	if (loadIntxCtlFile(infname,
			sAmpleData_m.cBeginComment,
			&sAmpleData_m.sTextCtl,
			&sAmpleData_m.pStringClasses) != 0)
	{
	reportError(ERROR_MSG,
			"Error reading text control file %s\n", infname);
	exitSafely(1);
	}
	}
if (sAmpleData_m.pLogFP != NULL)
	writeWordFormationChars(sAmpleData_m.pLogFP, &sAmpleData_m.sTextCtl);
if ((sAmpleData_m.sTextCtl.cBarMark == NUL) &&
	(sAmpleData_m.sTextCtl.pszBarCodes != NULL))
	{
	/*
	 *  don't need to use up this memory needlessly...
	 */
	freeMemory(sAmpleData_m.sTextCtl.pszBarCodes);
	sAmpleData_m.sTextCtl.pszBarCodes = NULL;
	}
else if ((sAmpleData_m.sTextCtl.cBarMark != NUL) &&
	 (sAmpleData_m.sTextCtl.pszBarCodes == NULL))
	{
	/*
	 *  default to the S.I.L. Manuscripter bar codes
	 */
	sAmpleData_m.sTextCtl.pszBarCodes = (unsigned char *)duplicateString(
							"bdefhijmrsuvyz");
	}
/*
 *  dump verbose "verify" information
 */
if (bVerifyLoading_m)		       /* (set by -v command line option) */
	{
	/*
	 *	write category classes, string classes, morpheme classes, and morpheme
	 *	co-occurrence constraints to the log file
	 */
	writeAmpleCategClasses(sAmpleData_m.pLogFP,
			   sAmpleData_m.pCategories,
			   sAmpleData_m.pCategoryClasses);
	writeStringClasses(    sAmpleData_m.pLogFP, sAmpleData_m.pStringClasses);
				/* 3.3.0 hab */
	writePunctClasses(     sAmpleData_m.pLogFP, sAmpleData_m.pPunctClasses);
	writeAmpleMorphClasses(sAmpleData_m.pLogFP, sAmpleData_m.pMorphClasses);
	writeAmpleMorphConstraints(  sAmpleData_m.pLogFP, &sAmpleData_m);
	}
/*
 *  initialize processing parameters and counters
 */
if (bOptionalOutputSet_m == FALSE)
	{
	getAmpleCmd("Include the original word in the output (Y or N) [n]? ",
		infname, FILENAME_MAX);
	if ((infname[0] == 'Y') || (infname[0] == 'y'))
	sAmpleData_m.iOutputFlags |= WANT_ORIGINAL;
	getAmpleCmd("Include the morpheme decomposition in the output (Y or N) [n]? ",
		infname, FILENAME_MAX);
	if ((infname[0] == 'Y') || (infname[0] == 'y'))
	sAmpleData_m.iOutputFlags |= WANT_DECOMPOSITION;
	}

closeAmpleCmdFile();		/* Close -f name file if there was one */
logAmpleCmds( NULL );	    /* Turn off logging of file names */

/* release memory allocated for records */
freeMemory( pRecordBuffer_g );
pRecordBuffer_g	     = NULL;
uiRecordBufferSize_g = 0;
#ifdef EXPERIMENTAL
/*
 *  load the PATR grammar if there is one
 */
if (pszGrammarFile_m != NULL)
	{
	sAmpleData_m.sPATR.bSilent  = sAmpleData_m.bQuiet;
	sAmpleData_m.sPATR.cComment = sAmpleData_m.cBeginComment;
	sAmpleData_m.sPATR.pLogFP   = sAmpleData_m.pLogFP;
	if (loadPATRGrammar(pszGrammarFile_m, &sAmpleData_m.sPATR) == 0)
	{
	reportError(ERROR_MSG,
			"Error loading grammar file %s\n", pszGrammarFile_m);
	exitSafely(1);
	}

	}
#endif /* EXPERIMENTAL */
} /* end anset */

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

if (bMonitorProgress_m)			    /* If monitoring */
	{
	if (uiWordCount_m == 0)	      /* Put return before first one */
	putc('\n',stderr);
	showAmbiguousProgress(sAmpleThisWord_m.uiAmbigCount,
			  uiWordCount_m);
	}
}

/*****************************************************************************
 * NAME
 *    anproc
 * DESCRIPTION
 *    process the input file, analyzing each word
 * RETURN VALUE
 *    none
 */
static void anproc()
{
static char	szReportMessage_s[] = "\nINPUT: %ld word%s processed.\n";
FILE *infp, *outfp;
char infilename[FILENAME_MAX];
char outfilename[FILENAME_MAX];
int i;
AmpleTestList *flp;
int		    bParsedAlready = FALSE;
unsigned	    uiAmbigCount   = 0;
/*
 *  Get input file name from command line or user
 */
if (pszInputFile_m == NULL)			/* If not on cmd line, ask */
	getAmpleCmd("\nFirst Input file: ", infilename, FILENAME_MAX);
else
	{						/* Else copy from cmd line */
	strncpy(infilename, pszInputFile_m, FILENAME_MAX-1);
	infilename[FILENAME_MAX-1] = NUL;
	}
/*
 *  process each input file to a separate output file
 */
do  {
	/*
	 * open input file
	 */
	infp = fopenAlways( infilename, "r");
	/*
	 *	ask for the output file (if not in cmd line) and open it
	 */
	if (pszOutputFile_m == NULL)	/* If not in command line, ask */
	getAmpleCmd("Output file: ", outfilename, FILENAME_MAX);
	else					/* Else (in command line) */
	{					/* Pick up file name */
	strncpy(outfilename, pszOutputFile_m, FILENAME_MAX-1);
	outfilename[FILENAME_MAX-1] = NUL;
	pszOutputFile_m = NULL;			/* Clear so only used once */
	}

	outfp = fopen( outfilename, "w");	/* Open without existence check */
	/*
	 *  if fopen() failed, let fopenAlways() give message
	 */
	if (outfp == NULL)
	outfp = fopenAlways( outfilename, "w");
	/*
	 *	If log file, show file names
	 */
	if (sAmpleData_m.pLogFP != NULL)
	{
	fprintf( sAmpleData_m.pLogFP, "\nInput  file: %s\n", infilename);
	fprintf( sAmpleData_m.pLogFP, "Output file: %s\n", outfilename);
	}
	/*
	 *  if tracing with SGML output, initiate the trace
	 */
	initiateAmpleTrace( &sAmpleData_m );
	/*
	 *	initialize processing parameters and counters
	 */
	memset(&sAmplePreviousWord_m, 0, sizeof(AmpleWord));
	memset(&sAmpleThisWord_m,	  0, sizeof(AmpleWord));
	memset(&sAmpleNextWord_m,	  0, sizeof(AmpleWord));
	uiWordCount_m      = 0;
	for ( i = 0 ; i < MAXAMBIG ; ++i )
	aiAmbigCounts_m[i] = 0;
	for ( flp = sAmpleData_m.pPrefixSuccTests ; flp ; flp = flp->pNext )
	{
	flp->uiTestCallCount = 0L;
	flp->uiTestFailCount = 0L;
	}
				/* hab 3.2.4 added Infix */
	for ( flp = sAmpleData_m.pInfixSuccTests ; flp ; flp = flp->pNext )
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
	while (readAmpleWord(infp) && (sAmpleThisWord_m.pTemplate != NULL))
	{
	if (sAmpleThisWord_m.pTemplate->paWord != NULL)
		{
		if (!bParsedAlready)
		uiAmbigCount = analyzeAmpleWord(&sAmpleThisWord_m,
						&sAmpleData_m);
		bParsedAlready = FALSE;
		if (uiAmbigCount == 0)
		iExitStatus_m = 2;		/* the analysis failed */
		else
		{
		if (	sAmpleThisWord_m.bUsesNextWord &&
			(sAmpleNextWord_m.pTemplate != NULL) &&
			(sAmpleNextWord_m.pTemplate->paWord != NULL) )
			{
			uiAmbigCount = analyzeAmpleWord(&sAmpleNextWord_m,
							&sAmpleData_m);
			if (uiAmbigCount == 0)
			iExitStatus_m = 2;	/* the analysis failed */
			else if (sAmpleNextWord_m.bUsesNextWord)
			{
			/* warning message */
			if (sAmpleData_m.pLogFP != NULL)
				{
				fprintf(sAmpleData_m.pLogFP,
				   "\nWARNING:  Multiple dependency:  %s %s\n",
					sAmpleThisWord_m.pTemplate->pszOrigWord,
					sAmpleNextWord_m.pTemplate->pszOrigWord);
				}
			}
			bParsedAlready = TRUE;
			}
		if (	sAmpleThisWord_m.bUsesPrevWord ||
			sAmpleThisWord_m.bUsesNextWord)
			{
			sAmpleData_m.bLookaheadDone = TRUE;
			refineAmpleAnalysis(&sAmpleThisWord_m,
					&sAmplePreviousWord_m,
					&sAmpleNextWord_m,
					&sAmpleData_m);
			sAmpleData_m.bLookaheadDone = FALSE;
			}
		}
		report_results();
		uiWordCount_m++;
		}
	/*
	 *  output the results of analysis
	 */
	writeTemplate( outfp, outfilename, sAmpleThisWord_m.pTemplate,
			   &sAmpleData_m.sTextCtl);
#ifdef EXPERIMENTAL
	writeAmpleParses(outfp, sAmpleThisWord_m.pParses, &sAmpleData_m);
#endif /* EXPERIMENTAL */
	sprintf( szOutOfMemoryMarker_g, "%ld", uiWordCount_m );
	}
	eraseAmpleWord( &sAmplePreviousWord_m, &sAmpleData_m );
	/*
	 *  if tracing with SGML output, terminate the trace
	 */
	terminateAmpleTrace( &sAmpleData_m );
	/*
	 *	output statistical counts
	 */
	reportMessage(!sAmpleData_m.bQuiet, szReportMessage_s,
		  uiWordCount_m, (uiWordCount_m == 1) ? "" : "s" );
	outstats();
	/*
	 *	get next input file
	 */
	fclose(infp);
	fflush(outfp);
	checkFileError( outfp, "ANPROC", outfilename );
	fclose(outfp);
	/*
	 *  if input file not from cmd line, ask for another
	 */
	if (pszInputFile_m == NULL)
	getAmpleCmd("\nNext Input file [no more]: ", infilename, FILENAME_MAX);
	else
	infilename[0] = NUL;		/* Else (from cmd line) clear name */

	} while (infilename[0]);		/* until empty filename */
}

/*****************************************************************************
 * NAME
 *    outstats
 * DESCRIPTION
 *    write the cumulative statistics to the log file
 * RETURN VALUE
 *    none
 */
static void outstats()
{
int i;
long ambwds, ambtot;

if (sAmpleData_m.pLogFP == NULL)
	return;
/*
 *  print the statistics header
 */
fprintf( sAmpleData_m.pLogFP,
	 "\nANALYSIS STATISTICS: %4ld word%s processed.\n",
	 uiWordCount_m, (uiWordCount_m == 1) ? "" : "s" );
/*
 *  print the ambiguity levels
 */
ambwds = ambtot = 0;
fprintf( sAmpleData_m.pLogFP, "   Ambiguity Levels:\n");
for ( i = 0 ; i <= MAXAMBIG ; ++i )
	{
	if (aiAmbigCounts_m[i] > 0)
	{
	fprintf( sAmpleData_m.pLogFP, "%25ld word%c with %2d %sanalys%cs.\n",
		aiAmbigCounts_m[i], (aiAmbigCounts_m[i]==1) ? ' ' : 's',
		i, (i==MAXAMBIG) ? "or more " : "", (i==1) ? 'i' : 'e' );
	if (i > 1)			    /* If ambiguous */
		{
		ambwds += aiAmbigCounts_m[i];	 /* Count ambig words */
		ambtot += (i - 1) * aiAmbigCounts_m[i];    /* Count total ambigs */
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
show_test("   Root", sAmpleData_m.pRootSuccTests);	/* always have roots */
if (sAmpleData_m.iMaxInterfixCount)
	show_test("   Interfix", sAmpleData_m.pInterfixSuccTests);
if (sAmpleData_m.iMaxSuffixCount)
	show_test("   Suffix", sAmpleData_m.pSuffixSuccTests);
/* always have final tests */
show_test("   Final", sAmpleData_m.pFinalTests);
#ifdef EXPERIMENTAL
/*
 *  print the PATR grammar statistics
 */
if (sAmpleData_m.sPATR.pGrammar != NULL)
	{
	fprintf( sAmpleData_m.pLogFP,
		 "\n%24s called %5lu time%s rejected %ld (skipped %ld).\n",
		 "PC-PATR word parse",
		 sAmpleData_m.uiPATRCallCount,
		 (sAmpleData_m.uiPATRCallCount == 1) ? ", " : "s,",
		 sAmpleData_m.uiPATRFailCount,
		 sAmpleData_m.uiPATRSkipCount);
	}
#endif /* EXPERIMENTAL */
/*
 *  terminate this statistical summary
 */
fprintf( sAmpleData_m.pLogFP, "\n");
} /* end outstats */

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

#ifdef ADHOC_DEBUG
/*****************************************************************
 *
 *			   disp_ahlist
 *
 *****************************************************************
 *
 * disp_ahlist
 * displays an adhoc pair list
 * ARGUMENTS:
 *    adh_list = pointer to the adhoc pair list
 *
 * RETURNS:
 *    VOID.
 */

static disp_ahlist( adh_list )
AmplePairList *adh_list;
{
AmplePairList *plp;

if (sAmpleData_m.pLogFP == NULL)
	return;
for (plp = adh_list; adh_list && plp->plink; plp = plp->plink)
	fprintf (sAmpleData_m.pLogFP, "\t%s %s\n", plp->lstri, plp->rstri);

} /* end disp_ahlist */
#endif /* ADHOC_DEBUG */

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
sAmplePreviousWord_m.bUsesPrevWord = sAmpleThisWord_m.bUsesPrevWord;
sAmplePreviousWord_m.bUsesNextWord = sAmpleThisWord_m.bUsesNextWord;
#ifdef EXPERIMENTAL
sAmplePreviousWord_m.pParses      = sAmpleThisWord_m.pParses;
#endif /* EXPERIMENTAL */

sAmpleThisWord_m.pTemplate    = sAmpleNextWord_m.pTemplate;
sAmpleThisWord_m.pHeadlists   = sAmpleNextWord_m.pHeadlists;
sAmpleThisWord_m.pszRemaining = sAmpleNextWord_m.pszRemaining;
sAmpleThisWord_m.uiAmbigCount = sAmpleNextWord_m.uiAmbigCount;
sAmpleThisWord_m.bFoundRoot   = sAmpleNextWord_m.bFoundRoot;
sAmpleThisWord_m.bUsesPrevWord = sAmpleNextWord_m.bUsesPrevWord;
sAmpleThisWord_m.bUsesNextWord = sAmpleNextWord_m.bUsesNextWord;
#ifdef EXPERIMENTAL
sAmpleThisWord_m.pParses      = sAmpleNextWord_m.pParses;
#endif /* EXPERIMENTAL */

sAmpleNextWord_m.pTemplate    = readTemplateFromText(infp,
							 &sAmpleData_m.sTextCtl);
sAmpleNextWord_m.pHeadlists   = NULL;
sAmpleNextWord_m.pszRemaining = NULL;
sAmpleNextWord_m.uiAmbigCount = 0;
sAmpleNextWord_m.bFoundRoot   = FALSE;
sAmpleNextWord_m.bUsesPrevWord = FALSE;
sAmpleNextWord_m.bUsesNextWord = FALSE;
#ifdef EXPERIMENTAL
sAmpleNextWord_m.pParses      = NULL;
#endif /* EXPERIMENTAL */

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
