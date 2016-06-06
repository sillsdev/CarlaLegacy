/* STAMP.C - Synthesis from Transfer of AMPle output
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
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1988, 2000 by SIL International.  All rights reserved.
 */
#include "stamp.h"
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

/***************************************************************************
 *  local function prototypes
 */
static void print_header P((FILE * pOutFP_in, char * pszTime_in));
static void parse_command P((int argc, char ** argv, char * pszTime_in));
static void usage P((void));
static void tsinit P((void));
static void outstats P((void));
static void tsproc P((void));

/*****************************************************************************
 *  local global data
 */
/*
 *  control data
 */
static StampData	sStamp_m = {
	TRUE,		/* bMatchCategories               */
	FALSE,		/* bDoAllSyntheses                */
	FALSE,		/* bTrace                         */
	FALSE,		/* bReportNoEntries               */
	0,		/* iDebugLevel                    */
	'|',		/* cComment                       */
	0,		/* bEnableAllomorphIDs            */
	FALSE,		/* bQuiet                         */
	2,		/* iMaxTrieLevel                  */
	'<',		/* cBeginRoot                     */
	'>',		/* cEndRoot                       */
	0,			/* eRuleType                      */
	0,			/* iCopyRulesTotalCount           */
	NULL,		/* pabCopyRulesDone               */
	NULL,		/* pDictOrthoChanges              */
	NULL,		/* pStringList                    */
	0,			/* uiAmbiguityCount               */
	0L,			/* uiCalledMEC                    */
	0L,			/* uiMECFailed                    */
	0L,			/* uiCalledSEC                    */
	0L,			/* uiSECFailed                    */
	0L,			/* uiCalledPEC        2.1b1 hab   */
	0L,			/* uiPECFailed        2.1b1 hab   */
	NULL,		/* pStringClasses                 */
	NULL,		/* pPunctClasses      2.1b1 hab   */
	NULL,		/* pDictTable                     */
	NULL,		/* pPrefixTable                   */
	NULL,		/* pInfixTable                    */
	NULL,		/* pRootTable                     */
	NULL,		/* pSuffixTable                   */
	{
	NULL,		/* sTextCtl.pszTextControlFile    */
	NULL,		/* sTextCtl.pLowercaseLetters     */
	NULL,		/* sTextCtl.pUppercaseLetters     */
	NULL,		/* sTextCtl.pCaselessLetters      */
	NULL,		/* sTextCtl.pOrthoChanges         */
	NULL,		/* sTextCtl.pOutputChanges        */
	NULL,		/* sTextCtl.pIncludeFields        */
	NULL,		/* sTextCtl.pExcludeFields        */
	'\\',		/* sTextCtl.cFormatMark           */
	'%',		/* sTextCtl.cAnaAmbig             */
	'%',		/* sTextCtl.cTextAmbig            */
	'-',		/* sTextCtl.cDecomp               */
	'|',		/* sTextCtl.cBarMark              */
	NULL,		/* sTextCtl.pszBarCodes           */
	TRUE,		/* sTextCtl.bIndividualCapitalize */
	TRUE,		/* sTextCtl.bCapitalize           */
	100		/* sTextCtl.uiMaxAmbigDecap       */
	},
	NULL,		/* pDictionary                    */
	NULL,		/* pCategories                    */
	NULL,		/* pCategorySetsList              */
	NULL,		/* pCategClasses                  */
	NULL,		/* pMorphClasses                  */
	{ NULL,0,0,255 },	/* sProperties                    */
	NULL,		/* pPropertyList                  */
	{ '*', 0,0,0,0 },	/* szRSCMarkers                   */
	NULL,		/* pTransferLexChg                */
	NULL,		/* pTransferRules                 */
	FALSE,		/* bOnlyTransfer                  */
	NULL,		/* pSynthesisLexChg               */
	NULL,		/* pSynthesisTests                */
	NULL,		/* pszValidCharacters             */
	NULL,		/* pAlloEnvList                   */
	NULL,		/* pLogFP                         */
	0L,			/* uiMissingMorpheme              */
	};
/*
 *  current and surrounding words
 */
static StampUnit	sWords_m;
/*
 *  Name of declaration file name file
 */
static char *		pszCommandFile_m = NULL;
/*
 *  Input file name
 */
static char *		pszInputFile_m = NULL;
/*
 *  Output file name
 */
static char *		pszOutputFile_m = NULL;
/*
 *  cumulative ambiguity counts
 */
#define MAXAMBIG 15             /* maximum ambiguity range to keep track of */
static unsigned long	auiAmbiguityLevels_m[MAXAMBIG+1];
/*
 *  cumulative word count
 */
static unsigned long	uiWordCount_m;
/*
 *  do we monitor progress of parsing?
 */
static int		bMonitorProgress_m = FALSE;
/*
 *  do we verify test parsing?
 */
static int		bVerify_m = FALSE;
/*
 *  flag that morpheme dictionaries are combined
 */
static int		bUnifiedDictionary_m = FALSE;
/*
 *  Flag that we are checking memory allocation.
 */
static int	bCheckAlloc_m = FALSE;

#ifdef _WINDOWS
#define main(argc, argv) dosmain(argc, argv)
#endif
/*************************************************************************
 * NAME
 *    main
 * DESCRIPTION
 *    main program for morphological transfer and synthesis program
 * RETURN VALUE
 *    none
 */
int main(argc, argv)
int	argc;		/* number of command line arguments */
char **	argv;		/* pointer to array of command line arguments */
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
	sStamp_m.pLogFP = stdout;
else
	sStamp_m.pLogFP = NULL;
/*
 *  write the header to the log file
 */
if (sStamp_m.pLogFP != NULL)
	{
	print_header(sStamp_m.pLogFP, pszTime );
	if (!bVerify_m)
	{
	fprintf( sStamp_m.pLogFP, "\n");
	/* Print header for file list */
	fprintf( sStamp_m.pLogFP,
		 "Control files, dictionary files, and responses");
	/* If command file from -f option, print its name */
	if ( pszCommandFile_m )
		fprintf( sStamp_m.pLogFP, "\n	  from file %s",
			 pszCommandFile_m );
	fprintf( sStamp_m.pLogFP, ":\n");
	}
	}
/*
 *  allocate space for records
 */
pRecordBuffer_g = (char *)allocMemory( BIG_RECSIZE );
uiRecordBufferSize_g = BIG_RECSIZE;
/*
 *  load dictionaries and tables for transfer/synthesis
 */
tsinit();
/*
 *  process the data
 */
tsproc();

if (bCheckAlloc_m)
	{
	/*
	 *  free everything that was dynamically allocated
	 */
	resetStampData( &sStamp_m );
	}

#ifdef MACINTOSH
fprintf(stderr, "\nUse the Quit command on the File menu (Command-Q)\n");
#endif
#ifdef QUICKWIN
fprintf(stderr, "\nUse the Exit command on the File menu (Control-C)\n");
#endif

exitSafely(0);		/* exit with error level 0 (no errors) */

return 0;		/* (not reached) */
}

/***************************************************************************
 * NAME
 *    parse_command
 * DESCRIPTION
 *    Print a terse summary of the command options, then exit the program.
 * RETURN VALUE
 *    none
 */
static void parse_command(argc,argv, pszTime_in)
int	argc;		/* number of command line arguments */
char **	argv;		/* pointer to array of command line arguments */
char *	pszTime_in;
{
int	k;
int	bShowUsage = FALSE;
VOIDP	trap_address = NULL;
int	trap_count = 0;
char *	p;

#ifdef USE_CCOMMAND
print_header(stderr, pszTime_in);
argc = ccommand(&argv);
#endif
/*
 *  parse command line for any options
 */
#ifdef AZTEC
argv[0] = "stamp";
/*
-c	AMPLE, STAMP: record comment character
-d	AMPLE, STAMP: dictionary trie depth
-f	AMPLE, STAMP: file of declaration file names
-i	AMPLE, STAMP: input file name
-m	AMPLE, STAMP: monitor progress
-o	AMPLE, STAMP: output file name
-q	AMPLE, STAMP: keep quiet, no screen output
-t	AMPLE, STAMP: trace
-u	AMPLE, STAMP: unified (combined) dictionaries
-v	AMPLE, STAMP: verify tests
-a	STAMP: generate all possible syntheses
-n	STAMP: 1.5a BJY Don't check root categories
-r	STAMP: report unfound morphemes WM
-x	STAMP: transfer only
-a	STAMP: generate all possible syntheses
-/	AMPLE, STAMP: debug
-z	AMPLE, STAMP: memory allocation trace filename
-Z	AMPLE, STAMP: memory allocation trap address,count
*/
#endif
while ((k = getopt(argc, argv, "ac:d:f:i:mno:qrtuvx/z:Z:")) != EOF)
	{
	switch (k)
		{
		case 'a':                       /* generate all possible syntheses */
			sStamp_m.bDoAllSyntheses = TRUE;    /* (we want them all!!) */
			break;

		case 'b':			/* enable allomorph ID strings */
		  sStamp_m.bEnableAllomorphIDs = TRUE;
		  break;

		case 'c':                       /* record comment character */
			sStamp_m.cComment = *optarg; /* used by record.c */
			break;

		case 'd':                       /* maximum trie depth */
			sStamp_m.iMaxTrieLevel = atoi(optarg);
			if (sStamp_m.iMaxTrieLevel < 0)
				sStamp_m.iMaxTrieLevel = 0;    /* force a minimum */
			break;

		case 'f':                       /* file of declaration file names */
			pszCommandFile_m = optarg;      /* pick up name */
			break;

		case 'i':		/* input file name */
			pszInputFile_m = optarg;		/* pick up name */
			break;

		case 'm':		/* monitor progress option */
			bMonitorProgress_m = TRUE;
			break;

		case 'n':		/* 1.5a BJY Don't check root categories */
			sStamp_m.bMatchCategories = FALSE;
			break;

		case 'o':		/* output file name */
			pszOutputFile_m = optarg;		/* pick up name */
			break;

	case 'q':
		sStamp_m.bQuiet = TRUE;
		break;

		case 'r':                       /* Unfound morphemes option WM */
			sStamp_m.bReportNoEntries = TRUE;
			break;

		case 't':                       /* trace option */
			sStamp_m.bTrace = TRUE;
			break;

	case 'u':			/* combined dictionaries option */
		bUnifiedDictionary_m = TRUE;
		break;

		case 'v':                       /* verify tests option */
			bVerify_m = TRUE;
			break;

		case 'x':                       /* transfer only option */
			sStamp_m.bOnlyTransfer = TRUE;
			break;

		case '/':                       /* debugging option */
			++sStamp_m.iDebugLevel;                 /* debug level counter */
			break;

	case 'z':		/* memory allocation trace filename */
		setAllocMemoryTracing(optarg);
		bCheckAlloc_m = TRUE;
		break;

	case 'Z':		/* memory allocation trap address,count */
		trap_address = (VOIDP)strtoul(optarg, &p, 0);
		if (trap_address != (VOIDP)NULL)
		{
		if (*p == ',')
			trap_count = (int)strtoul(p+1, NULL, 10);
		if (trap_count == 0)
			trap_count = 1;
		setAllocMemoryTrap(trap_address, trap_count);
		bCheckAlloc_m = TRUE;
		}
		break;

		default:                        /* unrecognized option */
		bShowUsage = TRUE;
			break;
			}
	} /* end switch */

if ((optind < argc) && (strcmp(argv[optind],"?") == 0))
	bShowUsage = TRUE;

#ifndef USE_CCOMMAND
if (!sStamp_m.bQuiet || bShowUsage)
	print_header(stderr, pszTime_in);
#endif
if (	bShowUsage ||
	((optind < argc) && (strcmp(argv[optind],"?") == 0)) )
	{
	usage();		/* tell the user what he can do */
	exitSafely(1);	/* exit with error status */
	}
}

/***************************************************************************
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
Usage: stamp [options]\n\
\n\
-a       return All valid allomorph combinations, not just the first\n\
-c char  select the record Comment character (default is '|')\n\
", stderr); fputs("\
-d num   select the maximum trie Depth (default is 2)\n\
-f file  File containing names of data files\n\
-i file  name of a single Input analysis file\n\
-m       Monitor progress by displaying a dot for each word processed\n\
", stderr); fputs("\
-n       No checking of root categories during synthesis\n\
-o file  name of the Output synthesis file\n\
-q       work Quietly without any screen output\n\
-r       Report morphemes not found in dictionaries\n\
", stderr); fputs("\
-t       Trace transfer and synthesis (produces voluminous output)\n\
-u       dictionaries are Unified, not split into prefix, ..., root\n\
-v       Verify tests by pretty printing the parse trees\n\
-x       apply transfer without synthesis\n\
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
fprintf(pOutFP_in,
	"STAMP: Synthesis(Transfer(AMPle(text))) = adapted text\n");
fprintf(pOutFP_in, "Version %d.%d%c%d (%s), Copyright %s SIL, Inc.\n",
	iStampVersion_g, iStampRevision_g, cStampPatchSep_g,
	iStampPatchlevel_g, pszStampDate_g, pszStampYear_g);
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

/****************************************************************************
 * NAME
 *    tsinit
 * DESCRIPTION
 *    Initialization for transfer and synthesis:  load the control files and
 *    dictionaries.
 * RETURN VALUE
 *    none
 */
static void tsinit()
{
char		infname[BUFSIZE];
Change *	pChg;
int		iCount = 0;
char		szPrompt[64];
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
 *  initialize property list, category list, and string list
 */
sStamp_m.pPropertyList     = NULL;
sStamp_m.pCategorySetsList = NULL;
sStamp_m.pStringList       = NULL;
/*
 *  open -f namefile if there is one
 *  If logging file names and not verifying tests, output to log file as well
 */
openAmpleCmdFile(pszCommandFile_m, sStamp_m.bQuiet );
logAmpleCmds( bVerify_m ? NULL : sStamp_m.pLogFP );
/*
 *  load the overall STAMP control file
 */
getAmpleCmd("STAMP declarations file (zzSTAMP.DEC): ", infname, BUFSIZE);
if (loadStampControlFile(infname, &sStamp_m) != 0)
	{
	reportError(ERROR_MSG, "Error reading declarations file %s\n", infname);
	exitSafely(1);
	}
/*
 *  load the transfer (dialect-pair-specific) control file
 */
getAmpleCmd("Transfer file (xxzzTR.CHG) [none]: ", infname, BUFSIZE);
if (infname[0] != NUL)
	{
	if (loadStampTransferFile(infname, &sStamp_m) != 0)
	{
	reportError(ERROR_MSG, "Error reading transfer file %s\n", infname);
	exitSafely(1);
	}
	}
/*
 *  load the synthesis control file
 */
getAmpleCmd("Synthesis file (zzSYNT.CHG) [none]: ", infname, BUFSIZE);
if (infname[0] != NUL)
	{
	if (loadStampSynthesisFile(infname, &sStamp_m) != 0)
	{
	reportError(ERROR_MSG, "Error reading synthesis file %s\n", infname);
	exitSafely(1);
	}
	}
/*
 *  load the dictionary code table file
 */
getAmpleCmd("Dictionary code table (zzSYCD.TAB): ", infname, BUFSIZE);
if (loadStampDictCodeTables(infname, &sStamp_m) != 0)
	exitSafely(1);		/* Exit with error status */

if (bUnifiedDictionary_m && (sStamp_m.pDictTable == NULL))
	{
	reportError(ERROR_MSG, szMissingDictCodeRecord_s, "\\unified");
	exitSafely(1);		/* Exit with error status */
	}
if (	!bUnifiedDictionary_m &&
	(sStamp_m.pDictTable   != NULL) &&
	(sStamp_m.pPrefixTable == NULL) &&
	(sStamp_m.pInfixTable  == NULL) &&
	(sStamp_m.pSuffixTable == NULL) &&
	(sStamp_m.pRootTable   == NULL) )
	{
	reportError(WARNING_MSG,
		"Assuming unified dictionary despite missing -u option.\n");
	bUnifiedDictionary_m = TRUE;
	}
/*
 *  load the dictionary orthography change table
 */
getAmpleCmd("Dictionary orthography change table (zzORDC.TAB) [none]: ",
		infname, BUFSIZE);
if ( infname[0] )
	{
	if (loadStampDictOrthoChanges(infname, &sStamp_m) != 0)
	{
	reportError(ERROR_MSG,
			"Error reading dictionary orthography change table %s\n",
			infname);
	exitSafely(1);
	}
	}
else
	sStamp_m.pDictOrthoChanges = (Change *)NULL;
/*
 *  reduce amount of memory allocated for records
 */
freeMemory( pRecordBuffer_g );
pRecordBuffer_g = (char *)allocMemory( SMALL_RECSIZE );
uiRecordBufferSize_g = SMALL_RECSIZE;
getAndClearAllocMemorySum();

/* ================================================================
 *  load the morpheme dictionaries
 */
getAndClearAllocMemorySum();                 /* Clear memory used for report */
if (bUnifiedDictionary_m)
	{
	/*
	 *  load Target Dialect unified dictionary: may be multiple files
	 */
	if (!sStamp_m.bQuiet)
	reportStampDictCodeTable(STAMP_UNIFIED, &sStamp_m);
	sprintf(szPrompt, "%s: ", szDictPrompt_s);
	getAmpleCmd(szPrompt, infname, BUFSIZE);
	sprintf(szPrompt, "Next %s [no more]: ", szDictPrompt_s);
	do  {
	iCount = loadStampDictionary(infname, STAMP_UNIFIED, &sStamp_m);
	if (iCount == -1)
		{
		reportError(ERROR_MSG, szDictErrorMessage_s, infname);
		exitSafely(1);
		}
	else
		{
		reportMessage(!sStamp_m.bQuiet, szDictLoadMessage_s,
			  "UNIFIED", iCount, (iCount == 1) ? "" : "s" );
		}
	getAmpleCmd(szPrompt, infname, BUFSIZE);
	} while ( infname[0] );
	freeCodeTable( sStamp_m.pDictTable );	/* flush unified code table */
	sStamp_m.pDictTable = NULL;
	/*
	 *  If verify, display
	 */
	if (bVerify_m && (sStamp_m.pLogFP != NULL))
	fprintf(sStamp_m.pLogFP,
		"Memory used for unified dictionaries: %5ld\n",
		getAndClearAllocMemorySum() );
	}
else
	{
	if (sStamp_m.pPrefixTable != NULL)
	{                                   /* load TD prefix dictionary */
	if (!sStamp_m.bQuiet)
		reportStampDictCodeTable(PFX, &sStamp_m);
	getAmpleCmd("Prefix dictionary file (zzPF01.DIC): ",
			infname, BUFSIZE);
	iCount = loadStampDictionary( infname, PFX, &sStamp_m);
	if (iCount == -1)
		{
		reportError(ERROR_MSG, szDictErrorMessage_s, infname);
		exitSafely(1);
		}
	else
		{
		reportMessage(!sStamp_m.bQuiet, szDictLoadMessage_s,
			  "PREFIX", iCount, (iCount == 1) ? "" : "s" );
		}
	freeCodeTable( sStamp_m.pPrefixTable );	/* flush prefix code table */
	sStamp_m.pPrefixTable = NULL;
	/*
	 *  If verify, display
	 */
	if (bVerify_m && (sStamp_m.pLogFP != NULL))
		fprintf(sStamp_m.pLogFP,
			"Memory used for prefix dictionary: %5ld\n",
			getAndClearAllocMemorySum() );
	}
	if (sStamp_m.pInfixTable != NULL)
	{                                   /* load TD infix dictionary */
	if (!sStamp_m.bQuiet)
		reportStampDictCodeTable(IFX, &sStamp_m);
	getAmpleCmd("Infix dictionary file (zzIF01.DIC): ", infname, BUFSIZE);
	iCount = loadStampDictionary(infname, IFX, &sStamp_m);
	if (iCount == -1)
		{
		reportError(ERROR_MSG, szDictErrorMessage_s, infname);
		exitSafely(1);
		}
	else
		{
		reportMessage(!sStamp_m.bQuiet, szDictLoadMessage_s,
			  "INFIX", iCount, (iCount == 1) ? "" : "s" );
		}
	freeCodeTable( sStamp_m.pInfixTable );	/* flush infix code table */
	sStamp_m.pInfixTable = NULL;
	/*
	 *  If verify, display
	 */
	if (bVerify_m && (sStamp_m.pLogFP != NULL))
		fprintf(sStamp_m.pLogFP,
			"Memory used for infix dictionary: %5ld\n",
			getAndClearAllocMemorySum() );
	}
	if (sStamp_m.pSuffixTable != NULL)
	{                                   /* load TD suffix dictionary */
	if (!sStamp_m.bQuiet)
		reportStampDictCodeTable(SFX, &sStamp_m);
	getAmpleCmd("Suffix dictionary file (zzSF01.DIC): ", infname, BUFSIZE);
	iCount = loadStampDictionary(infname, SFX, &sStamp_m);
	if (iCount == -1)
		{
		reportError(ERROR_MSG, szDictErrorMessage_s, infname);
		exitSafely(1);
		}
	else
		{
		reportMessage(!sStamp_m.bQuiet, szDictLoadMessage_s,
			  "SUFFIX", iCount, (iCount == 1) ? "" : "s" );
		}
	freeCodeTable( sStamp_m.pSuffixTable );	/* flush suffix code table */
	sStamp_m.pSuffixTable = NULL;
	/*
	 *  If verify, display
	 */
	if (bVerify_m && (sStamp_m.pLogFP != NULL))
		fprintf(sStamp_m.pLogFP,
			"Memory used for suffix dictionary: %5ld\n",
			getAndClearAllocMemorySum() );
	}
	/*
	 *  the following is not needed if synthesis is not done.
	 *
	 *  load Target Dialect root dictionary: may be multiple files
	 */
	if (sStamp_m.pRootTable != NULL)
	{
	if (!sStamp_m.bQuiet)
		reportStampDictCodeTable(ROOT, &sStamp_m);
	sprintf(szPrompt, "%s: ", szRootDictPrompt_s);
	getAmpleCmd(szPrompt, infname, BUFSIZE);
	sprintf(szPrompt, "Next %s [no more]: ", szRootDictPrompt_s);
	do  {
		iCount = loadStampDictionary(infname, ROOT, &sStamp_m);
		if (iCount == -1)
		{
		reportError(ERROR_MSG, szDictErrorMessage_s, infname);
		exitSafely(1);
		}
		else
		{
		reportMessage(!sStamp_m.bQuiet, szDictLoadMessage_s,
				  "ROOT", iCount, (iCount == 1) ? "" : "s" );
		}
		getAmpleCmd(szPrompt, infname, BUFSIZE);
		} while ( infname[0] );
	freeCodeTable( sStamp_m.pRootTable );	/* flush root code table */
	sStamp_m.pRootTable = NULL;
	/*
	 *  If verify, display
	 */
	if (bVerify_m && (sStamp_m.pLogFP != NULL))
		fprintf(sStamp_m.pLogFP,
			"Memory used for root dictionaries: %5ld\n",
			getAndClearAllocMemorySum() );
	}
	}
/*
 *  load text output control file (orthography changes)
 */
getAmpleCmd("Output text control file (zzOUTTX.CTL) [none]: ",
		infname, BUFSIZE);
if ( infname[0] )
	{
	if (loadOutxCtlFile(infname,
			sStamp_m.cComment,
			&sStamp_m.sTextCtl,
			&sStamp_m.pStringClasses) != 0)
	{
	}
	iCount = 0;
	for ( pChg = sStamp_m.sTextCtl.pOutputChanges ; pChg ; pChg = pChg->pNext )
	++iCount;
	reportMessage(!sStamp_m.bQuiet,
		  "%d output orthography change%s loaded from %s\n",
		  iCount, (iCount == 1) ? " was" : "s were", infname);
	}
else
	sStamp_m.sTextCtl.pOutputChanges = (Change *)NULL;

cleanupAfterStdFormatRecord();
closeAmpleCmdFile();               /* Close -f name file if there was one */
logAmpleCmds( NULL );          /* Turn off logging for I/O file names */

/* ================================================================
 *  dump verbose "verify" information
 */
if (bVerify_m && (sStamp_m.pLogFP != NULL))
	{
	/*
	 *  show categories, category classes, string classes, morpheme classes,
	 *  and any user defined tests
	 */
	writeAmpleCategories(sStamp_m.pLogFP, sStamp_m.pCategories);
	writeAmpleCategClasses(sStamp_m.pLogFP, sStamp_m.pCategories,
			   sStamp_m.pCategClasses);
	writeStringClasses(sStamp_m.pLogFP, sStamp_m.pStringClasses);
	writeAmpleMorphClasses(sStamp_m.pLogFP, sStamp_m.pMorphClasses);
				/* 2.1b1 hab */
	writePunctClasses(sStamp_m.pLogFP, sStamp_m.pPunctClasses);
	writeStampTests(sStamp_m.pLogFP, &sStamp_m);
	}
if (sStamp_m.iDebugLevel && (sStamp_m.pLogFP != NULL))
	{
	/*
	 *  show the transfer lexical changes, transfer rules, synthesis lexical
	 *  changes, and regular sound changes
	 */
	writeStampTransferLexChanges(sStamp_m.pLogFP, &sStamp_m);
	writeStampTransferRules(sStamp_m.pLogFP, &sStamp_m);
	writeStampSynthesisLexChanges(sStamp_m.pLogFP, &sStamp_m);
	writeStampRegSoundChanges(sStamp_m.pLogFP, &sStamp_m);
	}
/*
 *  for -/// or more dump dictionary
 */
if ((sStamp_m.iDebugLevel > 2) && (sStamp_m.pLogFP != NULL))
	writeStampDictionary(sStamp_m.pLogFP, &sStamp_m);
}

/*************************************************************************
 * NAME
 *    tsproc
 * DESCRIPTION
 *    Top-level processing function for transfer and synthesis.
 *    This prompts the user for input and output files, then for each
 *    file, it coordinates the transfer and synthesis of each word.
 * RETURN VALUE
 *    none
 */
static void tsproc()
{
FILE *infp, *outfp;
#ifndef hab2116
char outfilename[BUFSIZE];
char infilename[BUFSIZE];
#else  /* hab2116 */
char outfilename[100];
char infilename[100];
#endif /* hab2116 */
int k;
WordTemplate *	pWord;
/*
 *  Get input file name from command line or user
 */
if ( !pszInputFile_m )				/* If not on cmd line, ask */
	{
	getAmpleCmd("\nFirst Input file: ", infilename, 100);
	}
else
	strcpy( infilename, pszInputFile_m);	/* Else copy from cmd line */
/*
 *  process each input file to a separate output file
 */
do  {
	/*
	 * open input file
	 */
	infp = fopen( infilename, "r");
	/*
	 *  if open failed, then let fopenAlways give message
	 */
	if (infp == NULL)
		infp = fopenAlways( infilename, "r");
	/*
	 *  ask for the output file (if not in cmd line)
	 */
	if ( !pszOutputFile_m )			/* If not in command line */
		{
		getAmpleCmd("Output file: ", outfilename, 100);		/* Ask */
		}
	else					/* Else (in command line) */
		{
		strcpy( outfilename, pszOutputFile_m);	/* Pick up file name */
		pszOutputFile_m = NULL;			/* Clear so only used once */
		}
	/*
	 *  open output file
	 */
	outfp = fopen( outfilename, "w");
	/*
	 *  if open failed, then let fopenAlways give message
	 */
	if (outfp == NULL)
		outfp = fopenAlways( outfilename, "w");
	/*
	 *  If log file, show file names
	 */
	if (sStamp_m.pLogFP != NULL)
		{
		fprintf(sStamp_m.pLogFP, "Input  file: %s\n", infilename);
		fprintf(sStamp_m.pLogFP, "Output file: %s\n", outfilename);
		}
	/*
	 *  initialize counters for this file
	 */
	uiWordCount_m = 0L;
	for ( k = 0 ; k <= MAXAMBIG ; ++k )
		auiAmbiguityLevels_m[k] = 0L;
	sStamp_m.uiCalledMEC = sStamp_m.uiMECFailed = 0L;
	sStamp_m.uiCalledSEC = sStamp_m.uiSECFailed = 0L;
	sStamp_m.uiCalledPEC = sStamp_m.uiPECFailed = 0L; /* 2.1b1 hab */
	/*
	 *  initialize the input and output routines' parameters
	 */
	if (sStamp_m.pLogFP != NULL)
	putc( '\n', sStamp_m.pLogFP );
	if (!sStamp_m.bQuiet)
		putc( '\n', stderr );
	if (bMonitorProgress_m)
	putc('\n',stderr);	      /* Put return before first one */
	/*
	 * Initialize for the word processing loop
	 */
	sWords_m.pPreviousWord = (StampWord *)NULL;
	sWords_m.pNextWord     = (StampWord *)NULL;
	/*
	 *  Get a word and transfer it (in isolation)
	 */
	sWords_m.pCurrentWord = readStampWord(infp, &sStamp_m.sTextCtl);
	if (sWords_m.pCurrentWord != NULL)
	{
	sprintf(szOutOfMemoryMarker_g, "input word number %ld", uiWordCount_m);
	sWords_m.pCurrentWord = performStampTransfer( &sWords_m, &sStamp_m );
	}
	sWords_m.bStringLookahead = FALSE;
	/*
	 * While there is a word to synthesize...
	 */
	while (sWords_m.pCurrentWord != NULL)
		{
	/*
	 *  Read in next word and transfer it
	 */
	sWords_m.pNextWord = readStampWord(infp, &sStamp_m.sTextCtl);
	if (sWords_m.pNextWord != NULL)
		{
		StampUnit sTemp;
		sprintf( szOutOfMemoryMarker_g, "input word number %ld",
			 uiWordCount_m );
		sTemp.pCurrentWord     = sWords_m.pNextWord;
		sTemp.pPreviousWord    = sWords_m.pCurrentWord;
		sTemp.pNextWord        = NULL;
		sTemp.bStringLookahead = sWords_m.bStringLookahead;
		sTemp.bLookaheadDone   = sWords_m.bLookaheadDone;
		sTemp.bMultiDependency = sWords_m.bMultiDependency;
		sWords_m.pNextWord        = performStampTransfer( &sTemp,
								  &sStamp_m );
		sWords_m.bStringLookahead = sTemp.bStringLookahead;
		sWords_m.bLookaheadDone   = sTemp.bLookaheadDone;
		sWords_m.bMultiDependency = sTemp.bMultiDependency;
		}
	if ( sStamp_m.bOnlyTransfer )    /* If transfer only... */
			{
		writeStampWord(sWords_m.pCurrentWord, outfp, outfilename,
			   &sStamp_m);
		if (bMonitorProgress_m)
		{
		/* fake one ambiguity for monitor */
		showAmbiguousProgress(1, uiWordCount_m);
		}
		++uiWordCount_m;
			}
		else
			{
		/* otherwise, synthesize */
		performStampSynthesis(&sWords_m, &sStamp_m);

		pWord = sWords_m.pCurrentWord->pTemplate;

		fixSynthesizedWord(pWord, &sStamp_m.sTextCtl, NULL);

		writeTextFromTemplate(outfp, pWord, &sStamp_m.sTextCtl);

		/* (Note that readStampWord() frees info in word) */
		/*
		 * keep statistical counts of ambiguities in the final output
		 */
		if (    (pWord != NULL) &&
			(	(pWord->pNewWords != NULL) ||
			(   (pWord->pszOrigWord    != NULL) &&
				(pWord->pszOrigWord[0] != NUL) ) ) )
		{
		sStamp_m.uiAmbiguityCount = getStringListSize(
				  pWord->pNewWords);
		if (sStamp_m.uiAmbiguityCount < MAXAMBIG)
			++auiAmbiguityLevels_m[sStamp_m.uiAmbiguityCount];
		else
			++auiAmbiguityLevels_m[MAXAMBIG];
		if (bMonitorProgress_m)
			showAmbiguousProgress(sStamp_m.uiAmbiguityCount,
					  uiWordCount_m);
		++uiWordCount_m;
		}
		}
		/*
		 *  Advance to next word
		 */
		freeStampWord( sWords_m.pPreviousWord );
		sWords_m.pPreviousWord = sWords_m.pCurrentWord;
		sWords_m.pCurrentWord = sWords_m.pNextWord;
		}
	/* clean up after last word */
	if (sWords_m.pPreviousWord)
	{
	freeStampWord( sWords_m.pPreviousWord );
	sWords_m.pPreviousWord = NULL;
	}
	if (bMonitorProgress_m)			    /* If monitoring */
	{
	unsigned	uiFix;
	for ( uiFix = uiWordCount_m % 50 ; uiFix < 50 ; ++uiFix )
		{
		fputc(' ', stderr);
		if ((uiFix % 10) == 0)
		fprintf(stderr, "  ");
		}
	if ((uiWordCount_m % 10) != 0)
		fprintf(stderr, "  ");
	fprintf(stderr, "%lu\n", uiWordCount_m);
	}
	/*
	 *  output statistics
	 */
	if (!sStamp_m.bOnlyTransfer)
		outstats();
	/*
	 *  close the output file and ask for another input file
	 */
	fclose(infp);
	fflush(outfp);
	checkFileError( outfp, "STAMP", outfilename );
	fclose(outfp);
	if ( !pszInputFile_m )          /* If input file not from cmd line */
		{                       /* Ask for another */
		getAmpleCmd("Next Input file (or RETURN if no more): ",
			infilename, 100);
		}
	else
		infilename[0] = NUL;      /* Else (from cmd line) clear name */

	} while (infilename[0]);      /* until the user wants no more */
}

/*************************************************************************
 * NAME
 *    outstats
 * DESCRIPTION
 *    Print the statistical counts for the input file which just finished.
 * RETURN VALUE
 *    none
 */
static void outstats()
{
int	i;

if (sStamp_m.pLogFP == NULL)
	return;
/*
 *  print the statistics header
 */
fprintf(sStamp_m.pLogFP,
	"\nSYNTHESIS STATISTICS: %4ld WORDS processed.\n",
	uiWordCount_m);
/*
 *  print the ambiguity levels
 */
fprintf(sStamp_m.pLogFP, "   Ambiguity Levels:\n" );
for ( i = 0 ; i <= MAXAMBIG ; ++i )
	{
	if (auiAmbiguityLevels_m[i] != 0L)
		fprintf(sStamp_m.pLogFP, "%25ld word%c with %2d %ssynthes%cs.\n",
		auiAmbiguityLevels_m[i],
		(auiAmbiguityLevels_m[i] == 1) ? ' ' : 's',
		i, (i == MAXAMBIG) ? "or more " : "", (i == 1) ? 'i' : 'e' );
	}
#ifdef NODICTCOUNT
if (	(!pStamp_in->bTrace) &&
	pStamp_in->bReportNoEntries &&
	(sStamp_m.uiMissingMorphemes != 0L) &&
	(pStamp_in->pLogFP != NULL) )
	fprintf(sStamp_m.pLogFP,
		"%26ld dictionary entries were not found.\n",
		sStamp_m.uiMissingMorphemes);
#endif
/*
 *  builtin tests use global counters
 */
if (sStamp_m.uiCalledMEC || sStamp_m.uiCalledSEC ||
	sStamp_m.uiCalledPEC)	/* 2.1b1 hab */
	{
	fprintf(sStamp_m.pLogFP, "   Counts for built-in tests:\n");
	if (sStamp_m.uiCalledMEC)
		fprintf(sStamp_m.pLogFP,
	   "   Morpheme environment constraints failed %lu times, succeeded %lu.\n",
		sStamp_m.uiMECFailed,
		sStamp_m.uiCalledMEC - sStamp_m.uiMECFailed);
	if (sStamp_m.uiCalledSEC)
		fprintf(sStamp_m.pLogFP,
	   "     String environment constraints failed %lu times, succeeded %lu.\n",
		sStamp_m.uiSECFailed,
		sStamp_m.uiCalledSEC - sStamp_m.uiSECFailed );
	if (sStamp_m.uiCalledPEC)	/* 2.1b1 hab */
		fprintf(sStamp_m.pLogFP,
	   "     String punctuation constraints failed %lu times, succeeded %lu.\n",
		sStamp_m.uiPECFailed,
		sStamp_m.uiCalledPEC - sStamp_m.uiPECFailed );
	}
/*
 *  user defined tests have their own display function
 */
writeStampTestStatistics(sStamp_m.pLogFP, &sStamp_m);
}
