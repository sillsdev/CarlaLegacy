/* INTERGEN.C - generate interlinear text from an ANA file (AMPLE output)
 ***************************************************************************
 * Copyright 1987, 2002 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <ctype.h>
#include <time.h>
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#define strrchr rindex
#endif
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strncat P((char * dest, const char * src, size_t len));
extern char * strncpy P((char * dest, const char * src, size_t len));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strchr  P((const char * s, int c));
extern char * strrchr P((const char * s, int c));
extern size_t strlen  P((const char * s));
extern size_t strspn  P((const char * s, const char * accept));
extern char * strstr  P((const char * s1, const char * s2));
extern void   exit    P((int status));
#endif
#ifdef __MWERKS__
#include <console.h>
#endif

#include "opaclib.h"
#include "cportlib.h"
#include "version.h"

#ifdef MSDOS
#define FILESEP '\\'
#endif
#ifdef MACINTOSH
#define FILESEP ':'
#endif
#ifndef FILESEP
#define FILESEP '/'
#endif

#ifdef _MSC_VER
#ifndef isascii
#define isascii __isascii
#endif
#include <io.h>		/* for _isatty(fd) */
#endif
/*
 *  nonANSI standard library functions
 */
extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;
#ifndef isatty
extern int isatty P((int));
#endif
#ifndef fileno
extern int fileno P((FILE *));
#endif
#ifndef isascii
extern int isascii P((int));
#endif

#ifdef MACINTOSH
#define USE_CCOMMAND
#endif
#ifdef MACINTOSH_NEEDS
extern long next_user_event_ticks;
extern void allow_user_events();
#endif
#ifndef NUL
#define NUL '\0'
#endif
#ifndef max
#define max(a,b) ((a) > (b) ? a : b)
#endif
#ifndef hab21b8
#define LINESIZE 10000
#else  /* hab21b8 */
#define LINESIZE (10*BUFSIZE)
#endif /* hab21b8 */

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

const int	iIntergenVersion_g    = VERSION;
const int	iIntergenRevision_g   = REVISION;
#if PATCHLEVEL < 0
const int	iIntergenPatchlevel_g = -(PATCHLEVEL);
#else
const int	iIntergenPatchlevel_g = PATCHLEVEL;
#endif
const char	cIntergenPatchSep_g  = PATCHLEVELSEPCHAR;
const char *	pszIntergenDate_g     = DATE;
const char *	pszIntergenYear_g     = YEAR;
#ifdef __DATE__
const char *	pszIntergenCompileFormat_g = COMPILEDFORMAT;
const char *	pszIntergenCompileDate_g   = __DATE__;
const char *	pszIntergenCompileTime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszIntergenTestVersion_g = TESTFORMAT;
#else
const char *	pszIntergenTestVersion_g = NULL;
#endif
#endif
/*
 *  local function prototypes
 */
static void   align_lines     P((void));
static void   appendBufToLine P((char * pszBuf_in, char * pszLine_in,
				 char * pszCount_in, int iCount_in));
static void   checkForRequestedFields P((WordTemplate * pWord_in));
static void   determineFieldCodes P((char * pszArgs_in));
static void   initialize    P((void));
static void   initlines	    P((void));
static void   interout	    P((WordTemplate * pWord_in));
static void   intrgn	    P((void));
static int    iSetShowOrder P((char * pszFields_in));
static void   addMultiByteString  P((const unsigned char *pszLet_in));
static void   initMultiByteStrlen P((void));
static size_t mb_strlen           P((char * s));
static void   nl_needed P((char *	cp,
			   char *	dp,
			   char *	fdp,
			   char *	gp,
			   char *	pp,
			   char *	up,
			   char *	wp,
			   char *	pszFormat_in));
static void   outlines	P((void));
static void   padLine   P((char * pszLine_in, int iMax_in));
static void   process	P((void));
char *        getFieldCode P((char ** pszCode_io));
static void   setBufOfAmbiguousField P((char         * pszTempBuf_in,
					WordAnalysis * pAnalyses_in,
					int            iField_in));
static void   usage	    P((void));
static void   parse_command P((int argc, char ** argv, char * pszTime_in));
static void   print_header  P((FILE * pOutFP_in, char * pszTime_in));

/***************************************************************************
 *      GLOBAL DATA DECLARATIONS
 */
static int	bDoUnderlying_m = FALSE;	/* if \u fields in analysis */
static int	bLinesHaveContent_m = FALSE;	/* output lines have content */
static int	bMonitorProgress_m = FALSE;     /* monitor progress */
static int	bUsingDefaultFields_m = TRUE;	/* if no -s in command line */
static char	cCommentChar_m = '|';		/* comment marker */
static int	iMaxLineLength_m = 77;	/* max length of output lines */
static int	bAlign_m      = FALSE;	/* switch for align option */
static int	bEveryDec_m   = FALSE;	/* show every decomp ambiguity */
static int      bUseFieldCodeInOutput_m = FALSE;/* -f option */
static int	bShowAmbigs_m = TRUE;	/* switch to show no ambiguities */
static int	iWordCount_m  = 0;	/* number of words read */
static char	szTextCtlFile_m[BUFSIZE];	/* text input control file */
static char	szInputFile_m[BUFSIZE];		/* input file name */
static char	szOutputFile_m[BUFSIZE];	/* output file name  */
static int	bCmdLine_m = FALSE;	/* True if szInputFile_m from command
					 * line */
static FILE *	pInputFP_m;		/* FILE pointers */
static FILE *	pOutputFP_m;
static char     szShowOrder_m[BUFSIZE] = "dua"; /* show fields in what order */
static char *   pszRepeatedMessage =
			 "\nWARNING: The %s field will be shown more than once!\n";
static int      iTextualField_m = 'd';      /* field to undergo ortho changes
						 * and captialization, and to also
						 * get punctuation marks */
static char	szCatLine_m[LINESIZE+1];	/* category line buffer */
static char	szDecLine_m[LINESIZE+1];	/* decomposition line buffer */
static char	szFdsLine_m[LINESIZE+1];	/* feature desc. line buffer */
static char	szGlsLine_m[LINESIZE+1];	/* gloss line buffer */
static char	szProLine_m[LINESIZE+1];	/* property line buffer */
static char	szUnlLine_m[LINESIZE+1];	/* underlying line buffer */
static char	szWrdLine_m[LINESIZE+1];	/* original word line buffer */
static char *	pszCat_m;		/* current location in szCatLine_m */
static char *	pszDec_m;		/* current location in szDecLine_m */
static char *	pszFds_m;		/* current location in szFdsLine_m */
static char *	pszGls_m;		/* current location in szGlsLine_m */
static char *	pszPro_m;		/* current location in szProLine_m */
static char *	pszUnl_m;		/* current location in szUnlLine_m */
static char *	pszWrd_m;		/* current location in szWrdLine_m */
static char *	pszCatFieldCode_m = "\\cat ";/* field code, category   line */
static char *	pszDecFieldCode_m = "\\dec ";/* field code, decomp     line */
static char *	pszFdsFieldCode_m = "\\fea ";/* field code, feature    line */
static char *	pszGlsFieldCode_m = "\\ana ";/* field code, gloss      line */
static char *	pszProFieldCode_m = "\\prp ";/* field code, properties line */
static char *	pszUnlFieldCode_m = "\\und ";/* field code, underlying line */
static char *	pszWrdFieldCode_m = "\\wrd ";/* field code, word       line */
static int	bDoCat_m = FALSE;	/* show category field */
static int   	bDoDec_m = TRUE;	/* show decomposition field */
static int   	bDoFds_m = FALSE;	/* show feature descriptor field */
static int	bDoGls_m = TRUE;	/* show gloss field */
static int	bDoPro_m = FALSE;	/* show property field */
static int	bDoUnl_m = TRUE;	/* show underlying form field */
static int	bDoWrd_m = FALSE;	/* show original word field */
static char *	pszInitPunc_m;		/* points to leading punctuation in
					 *  pWord_in->pszFormat */
static int	iDebugLevel_m = 0;	/* debugging level: -/ -// */
static int	bQuiet_m      = FALSE;	/* work quietly: -q */
static int      bIsFailure_m  = FALSE;  /* used for monitoring */
StringClass *		pStringClasses_m = NULL;
static TextControl	sTextCtl_m = {
	NULL,	/* filename */
	NULL,	/* list of multibyte lowercase letters (ordered by size) */
	NULL,	/* list of multibyte uppercase letters (ordered by size) */
	NULL,	/* list of multibyte caseless letters (ordered by size) */
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
static const char	szWhitespace_m[7] = " \t\r\n\v\f";

typedef struct multibyte_letter {
	unsigned char *	     pszLetter;
	unsigned                 iLength;
	struct multibyte_letter * pNext;
	} MultibyteLetter;
static MultibyteLetter * pMultibyteLetters_m = NULL;
/*
 *  THESE SHOULD BE USER-SETTABLE VARIABLES, NOT COMPILE-TIME CONSTANTS!!
 */
#define BORT '<'
#define EORT '>'

/***************************************************************************
 * NAME
 *    main
 * DESCRIPTION
 *    main procedure for the INTERGEN program
 * RETURN VALUE
 *    none
 */
int main(argc,argv)
int	argc;		/* number of command line arguments */
char **	argv;		/* pointer to array of command line arguments */
{
time_t		clock;
char *		pszTime;

time( &clock );
pszTime = ctime(&clock);

parse_command(argc, argv, pszTime);

initialize();               /* initialize everything for INTERGEN */
process();                  /* process the data */
return 0;
}

/***************************************************************************
 * NAME
 *    parse_command
 * DESCRIPTION
 *    Parse the command line options to set the appropriate global variables.
 * RETURN VALUE
 *    nonzero if an error occurs, zero if everything is okay
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

#ifdef USE_CCOMMAND
print_header(stderr, pszTime_in);
argc = ccommand(&argv);
#endif
*szTextCtlFile_m = '\0';                /* Default file names to null string */
*szInputFile_m  = '\0';
*szOutputFile_m = '\0';
/*
 *  parse command line for any options
 */
#ifdef AZTEC
argv[0] = "intergen";
#endif
while ((k = getopt(argc,argv,"ac:d:efg:i:nmo:qs:t:w:/z:Z:")) != EOF)
	{
	switch (k)
		{
		case 'a':                       /* align output */
			bAlign_m = TRUE;
			break;
		case 'c':                       /* record comment character */
			cCommentChar_m = *optarg;
			break;
		case 'd':                       /* decomposition character */
			sTextCtl_m.cDecomp = *optarg;
			break;
		case 'e':                       /* show every (decomp) ambiguity */
			bEveryDec_m = TRUE;
			break;
		case 'f':                       /* prepend field code in output */
			bUseFieldCodeInOutput_m = TRUE;
		break;
	case 'g':
		determineFieldCodes(optarg);
			break;
		case 'i':                       /* Input file */
			strncpy( szInputFile_m, optarg, BUFSIZE-1);
			bCmdLine_m = TRUE;
			break;
	case 'm':			/* monitor progress option */
		bMonitorProgress_m = TRUE;
		break;
	case 'n':                       /* no ambiguities */
			bShowAmbigs_m = FALSE;
			break;
		case 'o':                       /* Output file */
			strncpy( szOutputFile_m, optarg, BUFSIZE-1);
			break;
	case 'q':
		bQuiet_m = TRUE;
		break;
	case 's':			/* Show order */
		bUsingDefaultFields_m = FALSE;
		bShowUsage = !iSetShowOrder(optarg);
		break;
		case 't':                       /* Text output control file */
			strncpy( szTextCtlFile_m, optarg, BUFSIZE-1);
			break;
		case 'w':
			iMaxLineLength_m = atoi( optarg );   /* Maximum line length */
			if ( iMaxLineLength_m < 10 )         /* Don't allow ridiculous */
				iMaxLineLength_m = 77;
		if ( iMaxLineLength_m > LINESIZE )
			iMaxLineLength_m = LINESIZE;
			break;

	case '/':			/* debug option */
		++iDebugLevel_m;		/* count the slashes */
		break;

	case 'z':		/* memory allocation trace filename */
		setAllocMemoryTracing(optarg);
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
		}
		break;

		default:                        /* unrecognized option */
			bShowUsage = TRUE;
			break;
			}
	} /* end switch */
if ((optind < argc) && (strcmp(argv[optind],"?") == 0))
	bShowUsage = TRUE;

if (!bQuiet_m || bShowUsage)
	print_header(stderr, pszTime_in);
if (	bShowUsage ||
	((optind < argc) && (strcmp(argv[optind],"?") == 0)) )
	{
	usage();
	exitSafely(1);
	}
}

/*****************************************************************************
 * NAME
 *    iSetShowOrder
 * DESCRIPTION
 *    Determine the order in which to show the fields based on the content
 *    of pszFields_in
 * RETURN VALUE
 *    TRUE if successfully set the show order
 *    FALSE, otherwise
 */
static int iSetShowOrder(pszFields_in)
char * pszFields_in;
{
char *cp;
int   iGlsCount = 0;		/* counts to check for multiple appearances */
int   iCatCount = 0;		/* of a field */
int   iDecCount = 0;
int   iFdsCount = 0;
int   iProCount = 0;
int   iUnlCount = 0;
int   iWrdCount = 0;

				/* remember string for later processing */
strncpy( szShowOrder_m, pszFields_in, BUFSIZE-1);
				/* re-initialize all bDo... flags */
bDoCat_m = bDoDec_m = bDoFds_m = bDoGls_m = FALSE;
bDoPro_m = bDoUnl_m = bDoWrd_m = FALSE;

for ( cp = szShowOrder_m; *cp; cp++ )
	{
	switch (*cp)
	  {
	  case 'a':			/* analysis/gloss */
	  if ( iGlsCount++ )
		  fprintf(stderr, pszRepeatedMessage, "Analysis/Gloss");
	  bDoGls_m = TRUE;
		  break;
	  case 'c':			/* category */
	  if ( iCatCount++ )
		  fprintf(stderr, pszRepeatedMessage, "Category");
	  bDoCat_m = TRUE;
	  break;
	  case 'd':			/* decomposition */
	  if ( iDecCount++ )
		  fprintf(stderr, pszRepeatedMessage, "Decomposition");
	  else if ( (iUnlCount + iWrdCount) == 0 )
		  iTextualField_m = 'd'; /* use first possible field */
	  bDoDec_m = TRUE;
	  break;
	  case 'f':			/* feature descriptor */
	  if ( iFdsCount++ )
		  fprintf(stderr, pszRepeatedMessage, "Feature Descriptor");
	  bDoFds_m = TRUE;
	  break;
	  case 'p':			/* property */
	  if ( iProCount++ )
		  fprintf(stderr, pszRepeatedMessage, "Propery");
	  bDoPro_m = TRUE;
	  break;
	  case 'u':			/* underlying form */
	  if ( iUnlCount++ )
		  fprintf(stderr, pszRepeatedMessage, "Underlying form");
	  else if ( (iDecCount + iWrdCount) == 0 )
		  iTextualField_m = 'u'; /* use first possible field */
	  bDoUnl_m = TRUE;
	  break;
	  case 'w':			/* original word */
	  if ( iWrdCount++ )
		  fprintf(stderr, pszRepeatedMessage, "Original word");
	  else if ( (iUnlCount + iDecCount) == 0 )
		  iTextualField_m = 'w'; /* use first possible field */
	  bDoWrd_m = TRUE;
	  break;
	  default:
	  return (FALSE);
	  }
	}
				/* Check for at least one field */
if ( (iGlsCount+iCatCount+iDecCount+iFdsCount+iProCount+iUnlCount+iWrdCount)
	 == 0)
	{
	fprintf(stderr, "Must show at least one field when using -s switch!\n");
	return (FALSE);
	}
return (TRUE);
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
char szTempBuf[BUFSIZE];
fputs("\
Usage: intergen [options]\n\
\n\
  -a       aligns words in the output and flags ambiguities\n\
  -n       show no ambiguities, only a count of how many\n\
  -e       show every decomposition ambiguity (only works if -n is not set)\n\
  -f       prepend a field code to each line\n\
  -g code  change default field codes; use the -s code\n\
		   followed immediately by the field code; multiple instances can\n\
		   be separated by '/'.  E.g. -g wwrd/ddec/agls\n\
  -m       Monitor progress of conversion:  * = failure; . = 1 analysis;\n\
		   2-9 = 2-9 ambiguities; > = 10 or more ambiguities\n\
", stderr); fputs("\
  -c char  selects the record comment character (default is '|')\n\
  -d char  selects the decomposition  character (default is '-')\n\
  -i file  input file name\n\
  -o file  output file name\n\
", stderr); fputs("\n\
<Press <RETURN> to continue>", stderr);
fgets(szTempBuf, BUFSIZE, stdin); fputs("\
  -q       work quietly without screen output\n\
  -s codes show the fields indicated by codes, in the order given.\n\
			The possible codes are:\n\
			  w include original word\n\
			  d include the decomposition information\n\
			  a include the analysis information\n\
			  u include underlying form\n\
			  p include property information\n\
			  c include category information\n\
			  f include feature descriptor information\n\
			They may be repeated more than once.  The default is -sdua.\n\
  -t file  text output control file\n\
  -w num   width, maximum line length of output (default is 77)\n\
", stderr);

exit(1);                    /* exit with error status */
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
	"INTERGEN: Generate interlinear text from AMPLE output\n");
fprintf(pOutFP_in, "Version %d.%d%c%d (%s), Copyright %s SIL, Inc.\n",
	iIntergenVersion_g, iIntergenRevision_g, cIntergenPatchSep_g,
	iIntergenPatchlevel_g, pszIntergenDate_g, pszIntergenYear_g);
#ifdef __DATE__
fprintf(pOutFP_in, pszIntergenCompileFormat_g,
	pszIntergenCompileDate_g, pszIntergenCompileTime_g);
#else
if (pszIntergenTestVersion_g != NULL)
	fputs(pszIntergenTestVersion_g, pOutFP_in);
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
fprintf( pOutFP_in, "                Conversion Performed %s", pszTime_in );
}

/***************************************************************************
 * NAME
 *    initialize
 * DESCRIPTION
 *    Load the INTERGEN control file.
 * RETURN VALUE
 *    none
 */
static void initialize()
{
if (pStringClasses_m != NULL)
	{
	freeStringClasses(pStringClasses_m);
	pStringClasses_m = NULL;
	}
if ( !bCmdLine_m )
	{
	/*
	 *  If files not from command line
	 */
	fputs("Text Control File (xxOUTX.CTL) [none]: ", stderr);
	fgets(szTextCtlFile_m, BUFSIZE, stdin);
	if (!isatty(fileno(stdin)))
		fputs(szTextCtlFile_m, stderr);
	trimTrailingWhitespace(szTextCtlFile_m);
	}
if (szTextCtlFile_m[0])
	{
	if (-1 == loadOutxCtlFile(szTextCtlFile_m, cCommentChar_m,
			&sTextCtl_m, &pStringClasses_m))
	  printf("\nERROR: Could not find Output Text Control file %s\n",
		 szTextCtlFile_m);
	initMultiByteStrlen();
	}
}

/***************************************************************************
 * NAME
 *    process
 * DESCRIPTION
 *    Process the input files to produce the output files.
 * RETURN VALUE
 *    none
 */
static void process()
{
register char *cp, *q;
char resp[BUFSIZE];
/*
 *  get first input filename, then loop processing input files
 */
if ( !bCmdLine_m )                /* If files not from command line */
	{
	fputs("\nInput File in Database Format (xxxxxx.CED): ", stderr);
	fgets(szInputFile_m, BUFSIZE, stdin);
	trimTrailingWhitespace(szInputFile_m);
	if (!isatty(fileno(stdin)))
		fputs(szInputFile_m, stderr);    putc('\n', stderr);
	}
do  {
	/*
	 *  open the input file
	 */
	pInputFP_m = fopenAlways(szInputFile_m, "r");
	if ( !bCmdLine_m )   /* If no cmd line */
		{
		/*
		 *  build the default output filename
		 */
		if ((cp=strrchr(szInputFile_m,FILESEP)) == (char *)NULL)
			cp = szInputFile_m;
		else
			cp++;
	/*
	 *  copy the basename
	 *  add a different extension
	 */
		strncpy(szOutputFile_m, cp, sizeof(szOutputFile_m) - 1);
		if ((q=strchr(szOutputFile_m,'.')) != NULL)
			*q = NUL;
		strncat(szOutputFile_m, ".it",
		sizeof(szOutputFile_m) - strlen(szOutputFile_m) - 1);
		/*
		 *  get the output filename from the user and open the output file
		 */
		fprintf(stderr, "Output file: [%s] ", szOutputFile_m);
		fgets(resp, BUFSIZE, stdin);
	trimTrailingWhitespace(resp);
		if (resp[0])
			strncpy(szOutputFile_m, resp, BUFSIZE-1);	/* he didn't default */
		if (!isatty(fileno(stdin)))
			fputs(szOutputFile_m, stderr);    putc('\n', stderr);
		}
	/* Else (infile from cmd line) */
	else if ( *szOutputFile_m == NUL)		/* If no outfile on cmd line */
		strncpy(szOutputFile_m, "-", BUFSIZE-1);	/* Default to stdout */

	if (strcmp(szOutputFile_m, "-") == 0)
	pOutputFP_m = stdout;
	else
		{
		/*
	 * Open without existence check
	 */
		pOutputFP_m = fopen(szOutputFile_m, "w");
		/*
		 *  if fopen() failed, let fopenAlways() give message
		 */
		if (pOutputFP_m == NULL)
		pOutputFP_m = fopenAlways(szOutputFile_m, "w");
	}
	/*
	 *  process the input file to produce the output file
	 */
	intrgn();
	if ( !bCmdLine_m )                        /* If name not from cmd line */
		{
		/*
		 *  get the next input filename from the user
		 */
		fputs("\nNext Input File: [no more]: ", stderr);
		fgets(szInputFile_m, BUFSIZE, stdin);
	trimTrailingWhitespace(szInputFile_m);
		if (!isatty(fileno(stdin)))
			fputs(szInputFile_m, stderr);    putc('\n', stderr);
		}
	else
		*szInputFile_m = NUL;
	} while (*szInputFile_m != NUL);
resetTextControl(&sTextCtl_m);	/* free memory */
freeStringClasses(pStringClasses_m);
}

/***************************************************************************
 * NAME
 *    intrgn
 * DESCRIPTION
 *    Process an input file, converting AMPLE output into form suitable
 *    for input to INTER.PTP
 * RETURN VALUE
 *    none
 */
static void intrgn()
{
WordTemplate *	pWord;

initlines();                    /* initialize the output lines */
iWordCount_m = 0;                  /* init word count */
								/* initialize for dtbin() [get_record()] */

while ((pWord = readTemplateFromAnalysis(pInputFP_m, &sTextCtl_m)) != NULL)
	{
	bIsFailure_m = FALSE;	/* Assume there was an analysis */
	if (pWord->pAnalyses == NULL)
	{
	bIsFailure_m = TRUE;	/* Was a failure after all */
	pWord->pAnalyses = allocMemory(sizeof(WordAnalysis));
	if (!bAlign_m)
		pWord->pAnalyses->pszAnalysis =
					 duplicateString( pWord->pszOrigWord );
	else
		pWord->pAnalyses->pszAnalysis   = duplicateString( "%0" );
	pWord->pAnalyses->pszDecomposition  =
					 duplicateString( pWord->pszOrigWord );
	pWord->pAnalyses->pszCategory       = duplicateString( "%0" );
	pWord->pAnalyses->pszProperties     = duplicateString( "%0" );
	pWord->pAnalyses->pszFeatures       = duplicateString( "%0" );
	pWord->pAnalyses->pszUnderlyingForm = duplicateString( "%0" );
#ifndef hab21b11
	bDoUnderlying_m = TRUE;	/* Flag for default showing of \u field */
#endif /* hab21b11 */
	}
	else if (pWord->pAnalyses->pszUnderlyingForm != NULL)
	bDoUnderlying_m = TRUE;	/* Flag for default showing of \u field */
	checkForRequestedFields(pWord);
	interout(pWord);		/* add word to interlinear lines */
	/*
	 *  free allocated storage
	 */
	freeWordTemplate(pWord);
	++iWordCount_m;
	}
fclose(pInputFP_m);                   /* close input, output files */
pInputFP_m = NULL;
outlines();                     /* force final lines to be output */
fflush(pOutputFP_m);
if (ferror(pOutputFP_m))              /* check for any output errors */
	{
	fflush(stdout);
	fprintf(stderr, "INTERGEN: Error writing to %s\n", szOutputFile_m);
	}
fclose(pOutputFP_m);
fflush(stdout);
if (!bQuiet_m)
  fprintf(stderr, "%s    %d words read from %s\n",
	  (bMonitorProgress_m ? "\n" : ""),
	  iWordCount_m, szInputFile_m);
} /* end intrgn() */

/***************************************************************************
 * NAME
 *    initlines
 * DESCRIPTION
 *    Initialize the seven output buffers.
 * RETURN VALUE
 *    none
 */
static void initlines()
{
memset(szCatLine_m, 0, sizeof(szCatLine_m));	/* init line buffers */
memset(szDecLine_m, 0, sizeof(szDecLine_m));
memset(szFdsLine_m, 0, sizeof(szFdsLine_m));
memset(szGlsLine_m, 0, sizeof(szGlsLine_m));
memset(szProLine_m, 0, sizeof(szProLine_m));
memset(szUnlLine_m, 0, sizeof(szUnlLine_m));
memset(szWrdLine_m, 0, sizeof(szWrdLine_m));
pszCat_m = szCatLine_m;                /* initialize line buffer pointers */
pszDec_m = szDecLine_m;
pszFds_m = szFdsLine_m;
pszGls_m = szGlsLine_m;
pszPro_m = szProLine_m;
pszUnl_m = szUnlLine_m;
pszWrd_m = szWrdLine_m;
bLinesHaveContent_m = FALSE;
if (bUseFieldCodeInOutput_m)
	{				/* begin each line with its field code */
	strncat(szCatLine_m, pszCatFieldCode_m,
		sizeof(szCatLine_m) - strlen(szCatLine_m) - 1);
	strncat(szDecLine_m, pszDecFieldCode_m,
		sizeof(szDecLine_m) - strlen(szDecLine_m) - 1);
	strncat(szFdsLine_m, pszFdsFieldCode_m,
		sizeof(szFdsLine_m) - strlen(szFdsLine_m) - 1);
	strncat(szGlsLine_m, pszGlsFieldCode_m,
		sizeof(szGlsLine_m) - strlen(szGlsLine_m) - 1);
	strncat(szProLine_m, pszProFieldCode_m,
		sizeof(szProLine_m) - strlen(szProLine_m) - 1);
	strncat(szUnlLine_m, pszUnlFieldCode_m,
		sizeof(szUnlLine_m) - strlen(szUnlLine_m) - 1);
	strncat(szWrdLine_m, pszWrdFieldCode_m,
		sizeof(szWrdLine_m) - strlen(szWrdLine_m) - 1);
	}
}

/***************************************************************************
 * NAME
 *    zap_spc
 * DESCRIPTION
 *    Delete any trailing spaces.
 * RETURN VALUE
 *    pointer to beginning of string (i.e., cp)
 */
static char * zap_spc(cp)
char *	cp;		/* pointer to string to check */
{
register char *p;
int cch;

if (cp == (char *)NULL)
	return((char *)NULL);
cch = strlen(cp);
if (cch)
	{
	for (p = cp + cch - 1 ; *p == ' ' ; --p)
	{
	*p = '\0';
	if (p == cp)
		break;
	}
	}
return(cp);
}

/***************************************************************************
 * NAME
 *    outlines
 * DESCRIPTION
 *    Write the decomposition and gloss lines.
 * RETURN VALUE
 *    none
 */
static void outlines()
{
char * cp;
for ( cp = szShowOrder_m; *cp; cp++ )
	{
	switch (*cp)
	  {
	  case 'a':			/* analysis/gloss */
	  if ( bDoGls_m )
		  fprintf(pOutputFP_m, "%s \n", zap_spc(szGlsLine_m) );
		  break;
	  case 'c':			/* category */
	  if ( bDoCat_m )
		  fprintf(pOutputFP_m, "%s \n", zap_spc(szCatLine_m) );
	  break;
	  case 'd':			/* decomposition */
	  if ( bDoDec_m )
		  fprintf(pOutputFP_m, "%s \n", zap_spc(szDecLine_m) );
	  break;
	  case 'f':			/* feature descriptor */
	  if ( bDoFds_m )
		  fprintf(pOutputFP_m, "%s \n", zap_spc(szFdsLine_m) );
	  break;
	  case 'p':			/* property */
	  if ( bDoPro_m )
		  fprintf(pOutputFP_m, "%s \n", zap_spc(szProLine_m) );
	  break;
	  case 'u':			/* underlying form */
	  if ( bDoUnl_m && bDoUnderlying_m)
		  fprintf(pOutputFP_m, "%s \n", zap_spc(szUnlLine_m) );
	  break;
	  case 'w':			/* original word */
	  if ( bDoWrd_m )
		  fprintf(pOutputFP_m, "%s \n", zap_spc(szWrdLine_m) );
	  break;
	  default:
	  fprintf(stderr,"Programmer Error in outlines(),szShowOrder_m = %s\n",
		  szShowOrder_m); /* should never happen, but... */
	  }
	}
if ( bAlign_m )                            /* If aligning, add blank line */
	fprintf(pOutputFP_m, "\n" );
initlines();                            /* reinitialize the lines */
}

/***************************************************************************
 * NAME
 *    addMultiByteString
 * DESCRIPTION
 *    Add a string to the multi-byte list of strings
 * RETURN VALUE
 *    none
 */
static void addMultiByteString(pszLet_in)
const unsigned char * pszLet_in;
{
MultibyteLetter *pNewLet;
MultibyteLetter *pMultibyte;
MultibyteLetter *pPrevious;

pNewLet = allocMemory(sizeof(MultibyteLetter));
pNewLet->pszLetter = (unsigned char *)duplicateString((char *)pszLet_in);
pNewLet->iLength = strlen((const char *)pszLet_in);
				/* add it to the list and keep the list
				   sorted by longest length first */
for (pMultibyte = pMultibyteLetters_m,
	   pPrevious = NULL;
	 pMultibyte != NULL;
	 pMultibyte = pMultibyte->pNext)
	{
	  if (pMultibyte->iLength <= pNewLet->iLength)
	  {			/* new one goes just before pMultibyte */
	  if (pPrevious == NULL)
		  pMultibyteLetters_m = pNewLet; /* insert as new head */
	  else
		  pPrevious->pNext = pNewLet;
	  pNewLet->pNext = pMultibyte;
	  break;
	  }
	  pPrevious = pMultibyte;
	}
if (pMultibyte == NULL)
	{				/* new one goes at end of list */
	if (pPrevious == NULL)
	pMultibyteLetters_m = pNewLet; /* insert as new head */
	else
	pPrevious->pNext = pNewLet;
	pNewLet->pNext = NULL;
	}
}

/***************************************************************************
 * NAME
 *    initMultiByteStrlen
 * DESCRIPTION
 *    Initialize the multi-byte strlen function search space by creating
 *    a list of multi-byte structs
 * RETURN VALUE
 *    none
 */
static void initMultiByteStrlen()
{
int i;
LowerLetter    *pLower;
UpperLetter    *pUpper;
CaselessLetter *pCaseless;

for (pLower = sTextCtl_m.pLowercaseLetters;
	 pLower != NULL;
	 pLower = pLower->pNext)
	{
	if ((i = strlen((const char *)pLower->pszLower)) > 1)
		{			/* found a multibyte character */
	  addMultiByteString(pLower->pszLower);
	}
	}
for (pUpper = sTextCtl_m.pUppercaseLetters;
	 pUpper != NULL;
	 pUpper = pUpper->pNext)
	{
	if ((i = strlen((const char *)pUpper->pszUpper)) > 1)
		{			/* found a multibyte character */
	  addMultiByteString(pUpper->pszUpper);
	}
	}
for (pCaseless = sTextCtl_m.pCaselessLetters;
	 pCaseless != NULL;
	 pCaseless = pCaseless->pNext)
	{
	if ((i = strlen((const char *)pCaseless->pszLetter)) > 1)
		{			/* found a multibyte character */
	  addMultiByteString(pCaseless->pszLetter);
	}
	}
}

/***************************************************************************
 * NAME
 *    mb_strlen
 * DESCRIPTION
 *    Determine the string length of the input string, adjusting for any
 *    occurences of multibyte characters.
 * RETURN VALUE
 *    adjusted size of the string
 */
static size_t mb_strlen(pszString_in)
char * pszString_in;
{
int               iAdjust;
int               iLength;
MultibyteLetter * pMultibyte;
char            * pszCurrent;
char            * pszLeftMost;
char            * pszRightMost;
char            * pszFound;

iLength      = pszString_in ? strlen(pszString_in) : 0;
pszCurrent   = pszString_in;
pszRightMost = iLength ? pszString_in + iLength - 1 : pszString_in;

while (pszCurrent != NULL &&
	   pszCurrent < pszRightMost) /* no need to check final char since it
					 will never match any multibyte letters */
	{
	pszLeftMost = pszRightMost;
	iAdjust     = 1;		/* assume adjust of 1 so it will be 0 later */
				/* find the first, leftmost match (the first
				   one will be the longest) */
	for (pMultibyte = pMultibyteLetters_m;
	 pMultibyte != NULL;
	 pMultibyte = pMultibyte->pNext)
		{
	if ((pszFound = strstr(pszCurrent,
				   (const char *)pMultibyte->pszLetter)) != NULL)
		{
		if (pszFound < pszLeftMost)
			{		/* found is to left of leftmost */
			pszLeftMost = pszFound;
		iAdjust = pMultibyte->iLength;
		}
		}
	}
	iLength -= (iAdjust - 1);
	pszCurrent = pszLeftMost + 1;
	}
return (iLength);
}

/***************************************************************************
 * NAME
 *    align_lines
 * DESCRIPTION
 *    Add spaces to align the decomposition, gloss, and underlying lines.
 * RETURN VALUE
 *    none
 */
static void align_lines()
{
int max_line;
/*
 * Find longest line
 */
max_line = max ( mb_strlen( szCatLine_m ),
				 max ( mb_strlen( szDecLine_m ),
			   max ( mb_strlen( szFdsLine_m ),
				 max ( mb_strlen( szGlsLine_m ),
				   max ( mb_strlen ( szProLine_m ),
					max ( mb_strlen( szUnlLine_m ),
						  mb_strlen( szWrdLine_m )))))));
/*
 *  Add spaces until all lines are equal
 */
if ( bDoCat_m )
	padLine(szCatLine_m, max_line);
if ( bDoDec_m )
	padLine(szDecLine_m, max_line);
if ( bDoFds_m )
	padLine(szFdsLine_m, max_line);
if ( bDoGls_m )
	padLine(szGlsLine_m, max_line);
if ( bDoPro_m )
	padLine(szProLine_m, max_line);
if ( bDoUnl_m && bDoUnderlying_m)
	padLine(szUnlLine_m, max_line);
if ( bDoWrd_m )
	padLine(szWrdLine_m, max_line);
}

/***************************************************************************
 * NAME
 *    add_dash
 * DESCRIPTION
 *    Replace spaces in the gloss line with the morpheme decomposition
 *    separation character.
 * RETURN VALUE
 *    address of work buffer
 */
static char * add_dash(cp)
char *	cp;		/* pointer to string to check */
{
char *		bp;
static char	szWrdBuf_s[LINESIZE];	/* gloss word work buffer */

memset(szWrdBuf_s, 0, LINESIZE);          /* initialize buffer */
bp = szWrdBuf_s;
/*
 *  scan string, replacing all spaces with the decomposition character
 */
while (*cp)
	{
	if (*cp == ' ')
		{
		*bp++ = sTextCtl_m.cDecomp;
		cp++;
		}
	else
		*bp++ = *cp++;
	}
return(szWrdBuf_s);
}

/***************************************************************************
 * NAME
 *    add_non_alpha
 * DESCRIPTION
 *    Append any trailing non_alphabetics to decomp line.
 * RETURN VALUE
 *    address of work buffer
 */
static char * add_non_alpha(cp)
char *	cp;		/* pointer to string to check */
{
char *		bp;
static char	szNonABuf_s[LINESIZE];	/* non-alphabetics work buffer */

memset(szNonABuf_s, 0, LINESIZE);         /* initialize buffer */
bp = szNonABuf_s;
while (*cp)                     /* scan the string */
	{
	if (*cp == '\n' || *cp == '\t')
		{                       /* convert newlines & tabs to spaces */
		*bp++ = ' ';
		cp++;
		}
	else if (*cp == sTextCtl_m.cFormatMark)
		{                       /* pass on format markers followed by space */
		while (*cp && (*cp != ' '))
			*bp++ = *cp++;
		if (*cp)
			{
			*bp++ = ' ';
			cp++;
			}
		}
	else                        /* pass anything else verbatim */
		*bp++ = *cp++;
	}
return(szNonABuf_s);
}

/***************************************************************************
 * NAME
 *    strip_cat
 * DESCRIPTION
 *    Strip categories from root portion of analysis string
 * RETURN VALUE
 *    address of work buffer
 */
static char * strip_cat(cp)
char *	cp;		/* pointer to string to check */
{
char *		bp;
char *		root_beg;
char *		root_end;
static char	szStripBuf_s[LINESIZE];	/* category strip work buffer */

memset(szStripBuf_s, 0, LINESIZE);                 /* initialize buffer */
bp = szStripBuf_s;
/*
 *  look for root begin and end markers - failures will not have these markers
 */
root_beg = strchr( cp, BORT);
while (root_beg != (char *)NULL)
	{
	if ((*(root_beg+1)==' ') && ((root_beg==cp) || (*(root_beg-1)==' ')))
		break;
	root_beg = strchr(root_beg+1,BORT);
	}
root_end = (root_beg!=(char *)NULL) ? strchr(root_beg,EORT) : (char *)NULL;
while (root_end != (char *)NULL)
	{
	if ( (*(root_end-1)==' ') &&
		 ((*(root_end+1)==' ')||(*(root_end+1)=='\n')||(*(root_end+1)==NUL)) )
		break;
	root_end = strchr(root_end+1,EORT);
	}
if ((root_beg != (char *)NULL) && (root_end != (char *)NULL))
	{
	while (cp < root_beg)               /* copy over any prefix forms */
		*bp++ = *cp++;
	cp = root_beg + 2;                  /* point to category of 1st root */
	while (cp < root_end)
		{                               /* copy over each root */
		cp = strchr(cp, ' ') + 1;        /* skip to begin of root */
		while (*cp != ' ')              /* copy over root */
			*bp++ = *cp++;
		*bp++ = *cp++;                  /* copy over space */
		cp++;                           /* point to what comes after root */
		}
	/*
	 *  if there are suffixes, then there is a space after the end of the
	 *  root; pass over it
	 */
	if (*(cp = root_end + 1))
		cp++;
	else
		*(bp-1) = NUL;                  /* no suffix; delete trailing space */
	}
while (*cp)                     /* pass the rest of the analysis on */
	*bp++ = *cp++;
return(szStripBuf_s);
}

/***************************************************************************
 * NAME
 *    nl_needed
 * DESCRIPTION
 *    Parse pWord_in->pszFormat for format markers and leading punctuation.
 *    Write any needed newlines for the line buffers.
 * RETURN VALUE
 *    none
 */
static void nl_needed(cp, dp, fdp, gp, pp, up, wp, pszFormat_in)
char *	cp;		/* pointer to category           string */
char *	dp;		/* pointer to decomposed         string */
char *	fdp;		/* pointer to feature descriptor string */
char *	gp;		/* pointer to gloss              string */
char *	pp;		/* pointer to property           string */
char *	up;		/* pointer to underlying form    string */
char *	wp;		/* pointer to original word      string */
char *	pszFormat_in;
{
char *	fp;
char *	np;
char *	xp;
int	k;
int     iDecSize;
int     iUnlSize;
int     iWrdSize;

np = pszFormat_in;
if ((np != (char *)NULL) && (*np != NUL))
	{                           /* check for format markers */
	if ((fp = strchr(pszFormat_in, sTextCtl_m.cFormatMark)) != (char *)NULL)
		{
	if (bLinesHaveContent_m)
		switch (iTextualField_m) /* find textual field */
			{
			case 'd':			/* decomposition */
				if (*pszDec_m != NUL)   /* output any previous lines */
			  outlines();
			break;
			case 'u':			/* underlying form */
				if (*pszUnl_m != NUL)   /* output any previous lines */
			  outlines();
			break;
			case 'w':			/* original word */
				if (*pszWrd_m != NUL)   /* output any previous lines */
			  outlines();
			break;
			}
	/*
	 *  If format field ends with \n, cut it off.
	 */
		if ( *( np = fp + (strlen(fp) - 1) ) == '\n' )
			*np = NUL;

	/*
	 *   Else if only leading punc after last space,
	 *   cut it off, and leave np pointing to it.
	 */
		else if ((np = strrchr(fp,' ')) != (char *)NULL)
			{
			for ( xp = np+1 ; *xp != NUL ; ++xp )
				{
				if (!isascii(*xp) || !ispunct(*xp))
					break;
				}
			if (*xp == NUL)
				*np++ = NUL;            /* only punc found, cut it off */
			else
				np = (char *)NULL;      /* not leading punctuation */
			}
		fprintf(pOutputFP_m, "%s\n", pszFormat_in);
		}
	}
pszInitPunc_m = np;                 /* point to any leading punctuation */
								/* check for line length */
k = (pszInitPunc_m != (char *)NULL) ? strlen(pszInitPunc_m) : 0;
iDecSize = (int) (mb_strlen(szDecLine_m)+mb_strlen(dp));
iUnlSize = (int) (mb_strlen(szUnlLine_m)+mb_strlen(up));
iWrdSize = (int) (mb_strlen(szWrdLine_m)+mb_strlen(wp));
switch (iTextualField_m) /* find textual field and add k to it */
	{
		case 'd':			/* decomposition */
		iDecSize += k;
		break;
		case 'u':			/* underlying form */
		iUnlSize += k;
		break;
	case 'w':			/* original word */
		iWrdSize += k;
		break;
	}
if (    ((int)  (mb_strlen(szCatLine_m)+mb_strlen(cp))  > iMaxLineLength_m) ||
		(        iDecSize                               > iMaxLineLength_m) ||
		((int)  (mb_strlen(szFdsLine_m)+mb_strlen(fdp)) > iMaxLineLength_m) ||
		((int)  (mb_strlen(szGlsLine_m)+mb_strlen(gp))  > iMaxLineLength_m) ||
		((int)  (mb_strlen(szProLine_m)+mb_strlen(pp))  > iMaxLineLength_m) ||
		(        iUnlSize                               > iMaxLineLength_m) ||
		(        iWrdSize                               > iMaxLineLength_m) )
	{
	/*
	 * either the new material plus the old is too long or
	 * there is no old and just the new is too long.
	 * Output the old only if it already has something in it.
	 */
	if (bLinesHaveContent_m)
		outlines();
	}
}

/***************************************************************************
 * NAME
 *    interout
 * DESCRIPTION
 *    Create the parallel output lines:
 *              the first  are the decomposed words
 *              the second are the underlying forms
 *              the third  are the glosses
 * RETURN VALUE
 *    none
 */
static void interout(pWord_in)
WordTemplate *	pWord_in;
{
char *		cp;
char *          pszTextualBuf = NUL;	/* Buffer where "textual" info goes */
char *          pszTextualLine= NUL;	/* Line   where "textual" info goes */
int		ambig_count = 0;
char		szAmbigBuf[7];
WordAnalysis *	pAnal;
static char	szCatBuf_s[LINESIZE+1];	/* category           work buffer */
static char	szDecBuf_s[LINESIZE+1];	/* decomposition      work buffer */
static char	szFdsBuf_s[LINESIZE+1];	/* feature descriptor work buffer */
static char	szGlsBuf_s[LINESIZE+1];	/* analysis/gloss     work buffer */
static char	szProBuf_s[LINESIZE+1];	/* property           work buffer */
static char	szUnlBuf_s[LINESIZE+1];	/* underlying form    work buffer */
static char	szWrdBuf_s[LINESIZE+1];	/* original word      work buffer */

/*
 *  If aligning, count ambigs
 */
if (bAlign_m)
	{
	for ( pAnal = pWord_in->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		ambig_count++;
	if (ambig_count > 1)	/* remember count as string in szAmigBuf */
	sprintf(szAmbigBuf, "%d", ambig_count );
	else
	szAmbigBuf[0] = NUL;
	}
/*
 *  Create work buffers for all needed fields
 */
if ( bDoCat_m )
	setBufOfAmbiguousField(szCatBuf_s, pWord_in->pAnalyses, 'c');
if ( bDoDec_m )
	setBufOfAmbiguousField(szDecBuf_s, pWord_in->pAnalyses, 'd');
if ( bDoFds_m )
	setBufOfAmbiguousField(szFdsBuf_s, pWord_in->pAnalyses, 'f');
if ( bDoGls_m )
	setBufOfAmbiguousField(szGlsBuf_s, pWord_in->pAnalyses, 'a');
if ( bDoPro_m )
	setBufOfAmbiguousField(szProBuf_s, pWord_in->pAnalyses, 'p');
if ( bDoUnl_m && bDoUnderlying_m )
	setBufOfAmbiguousField(szUnlBuf_s, pWord_in->pAnalyses, 'u');
if ( bDoWrd_m )
	{
	memset(szWrdBuf_s, NUL, sizeof(szWrdBuf_s));
	strncat(szWrdBuf_s, pWord_in->pszOrigWord,
		sizeof(szWrdBuf_s) - strlen(szWrdBuf_s) - 1);
	}
/*
 *  Do changes and capitalization to textual field
 */
switch (iTextualField_m) /* set pointers to the textual field */
	{
	case 'd':			/* decomposition */
	pszTextualBuf  = szDecBuf_s;
	pszTextualLine = szDecLine_m;
	break;
	case 'u':			/* underlying form */
	pszTextualBuf  = szUnlBuf_s;
	pszTextualLine = szUnlLine_m;
	break;
	case 'w':			/* original word */
	pszTextualBuf  = szWrdBuf_s;
	pszTextualLine = szWrdLine_m;
	break;
	}
#ifndef hab2112
if (iTextualField_m == 'w')
  {
	cp = duplicateString(pszTextualBuf);
  }
 else
  {
	cp = applyChanges( pszTextualBuf, sTextCtl_m.pOutputChanges );
	if (cp == NULL)
	  {
	/* report error? */
	return;
	  }
	cp = recapitalizeWord(cp, pWord_in->iCapital, &sTextCtl_m, NULL);
	strncpy(pszTextualBuf, cp, LINESIZE); /* ensure buffer has new contents */
  }
#else
cp = applyChanges( pszTextualBuf, sTextCtl_m.pOutputChanges );
if (cp == NULL)
	{
	/* report error? */
	return;
	}
cp = recapitalizeWord(cp, pWord_in->iCapital, &sTextCtl_m, NULL);
strncpy(pszTextualBuf, cp, LINESIZE); /* ensure buffer has new contents */
#endif /* hab2112 */
/*
 *  Break lines if necessary
 */
nl_needed(szCatBuf_s, szDecBuf_s, szFdsBuf_s, szGlsBuf_s, szProBuf_s,
	  szUnlBuf_s, szWrdBuf_s, pWord_in->pszFormat);
/*
 *  If aligning and no ambigs and ambiguous, output spaces to allow for
 *  ambig mark below
 */
if ( bAlign_m && !bShowAmbigs_m && (ambig_count > 1) )
	strncat(pszTextualLine, "   ", LINESIZE - strlen(pszTextualLine));
/*
 *  Append any initial punctuation to textual line
 */
if ((pszInitPunc_m != (char *)NULL) && (*pszInitPunc_m != NUL))
	{
	strncat(pszTextualLine, add_non_alpha(pszInitPunc_m),
		LINESIZE - strlen(pszTextualLine));
	if ( bAlign_m )		/* be graceful about \f alignment */
		align_lines();
	if (!*cp)			/* Don't output zero analysis */
	{
	freeMemory(cp);
		return;			/* (may encounter at end of file) */
	}
	}
/*
 *  Append the content of the textual line
 */
strncat(pszTextualLine, cp, LINESIZE - strlen(pszTextualLine));
freeMemory(cp);
/*
 *  Append any appropriate trailing non-alphabetics
 */
if ((pWord_in->pszNonAlpha != (char *)NULL) && (*pWord_in->pszNonAlpha != NUL))
	strncat(pszTextualLine, add_non_alpha(pWord_in->pszNonAlpha),
		LINESIZE - strlen(pszTextualLine));
else
	strncat(pszTextualLine, " ", LINESIZE - strlen(pszTextualLine));
/*
 *  Append work buffers to appropriate lines (note that the textual line
 *  has already been done)
 */
if ( bDoCat_m )
	appendBufToLine(szCatBuf_s, szCatLine_m, szAmbigBuf, ambig_count);
if ( bDoDec_m && pszTextualLine != szDecLine_m )
	appendBufToLine(szDecBuf_s, szDecLine_m, szAmbigBuf, ambig_count);
if ( bDoFds_m )
	appendBufToLine(szFdsBuf_s, szFdsLine_m, szAmbigBuf, ambig_count);
if ( bDoGls_m )
	appendBufToLine(szGlsBuf_s, szGlsLine_m, szAmbigBuf, ambig_count);
if ( bDoPro_m )
	appendBufToLine(szProBuf_s, szProLine_m, szAmbigBuf, ambig_count);
if ( bDoUnl_m && bDoUnderlying_m && pszTextualLine != szUnlLine_m )
	appendBufToLine(szUnlBuf_s, szUnlLine_m, szAmbigBuf, ambig_count);
if ( bDoWrd_m  && pszTextualLine != szWrdLine_m )
	{
	strncat(szWrdLine_m, szWrdBuf_s,
		sizeof(szWrdLine_m) - strlen(szWrdLine_m) - 1);
	strncat(szWrdLine_m, " ",
		sizeof(szWrdLine_m) - strlen(szWrdLine_m) - 1);
	}
if ( bAlign_m )
	align_lines();
bLinesHaveContent_m = TRUE;
if (bMonitorProgress_m && !bQuiet_m)  /* If monitoring */
	{
	if (iWordCount_m == 0)	      /* Put return before first one */
	putc('\n',stderr);
				/* Show the monitor value only if the
				   analysis is not a failure or if either
				   the original word or decomposition
				   fields have content.  This is the only
				   way I can think of to avoid showing a
				   final "word" that only has format
				   marker information in it. */
	if (strcmp(pWord_in->pAnalyses->pszAnalysis, "%0") != 0 ||
		strlen(pWord_in->pszOrigWord)                  != 0 ||
		strlen(pWord_in->pAnalyses->pszDecomposition)  != 0)
	  showAmbiguousProgress(bIsFailure_m ? 0 : ambig_count,
				iWordCount_m);
	else
	  iWordCount_m--;		/* Instead, decrement the counter to
				   ignore this non-word */
	}
}

/***************************************************************************
 * NAME
 *    setBufOfAmbiguousField
 * DESCRIPTION
 *    place the content of the (potentially ambiguous) field indicated by
 *    iField_in into the temp buffer
 * RETURN VALUE
 *    none
 */
static void setBufOfAmbiguousField(pszTempBuf_in, pAnalyses_in, iField_in)
char         * pszTempBuf_in;
WordAnalysis * pAnalyses_in;
int            iField_in;
{
int            i;
char         * cp;
WordAnalysis * pAnal;
/*
 * initialize
 */
memset(pszTempBuf_in, NUL, LINESIZE+1);
/*
 * Process the appropriate field
 */
for ( i = 0, pAnal = pAnalyses_in ; pAnal ; i++, pAnal = pAnal->pNext )
	{
	if (i)
	{				 /* separate each ambig with % */
	strncat(pszTempBuf_in, "%", LINESIZE - strlen(pszTempBuf_in));
	}
	switch (iField_in)
		{
	case 'a':			/* analysis/gloss */
		cp = add_dash( strip_cat(pAnal->pszAnalysis) );
		strncat(pszTempBuf_in, cp, LINESIZE - strlen(pszTempBuf_in));
		break;
	case 'c':			/* category */
		strncat(pszTempBuf_in, pAnal->pszCategory,
			LINESIZE - strlen(pszTempBuf_in));
		break;
	case 'd':			/* decomposition */
		strncat(pszTempBuf_in, pAnal->pszDecomposition,
			LINESIZE - strlen(pszTempBuf_in));
		break;
	case 'f':			/* feature descriptor */
		strncat(pszTempBuf_in, pAnal->pszFeatures,
			LINESIZE - strlen(pszTempBuf_in));
		break;
	case 'p':			/* property */
		strncat(pszTempBuf_in, pAnal->pszProperties,
			LINESIZE - strlen(pszTempBuf_in));
		break;
	case 'u':			/* underlying form */
		if (pAnal->pszUnderlyingForm)
		{
		strncat(pszTempBuf_in, pAnal->pszUnderlyingForm,
			LINESIZE - strlen(pszTempBuf_in));
		}
		else if (pAnal->pszSurfaceForm)
		{
		strncat(pszTempBuf_in, pAnal->pszSurfaceForm,
			LINESIZE - strlen(pszTempBuf_in));
		}
		break;
	}
	if (!bShowAmbigs_m ||		/* If not showing ambigs, or */
	(iField_in == 'd' && !bEveryDec_m)) /* not showing every decomp, */
	break;			                     /* quit */
	}
}

/***************************************************************************
 * NAME
 *    appendBufToLine
 * DESCRIPTION
 *    append a work buffer to a line; include ambiguity counts if needed
 * RETURN VALUE
 *    none
 */
static void appendBufToLine(pszBuf_in, pszLine_in, pszCount_in, iCount_in)
char * pszBuf_in;
char * pszLine_in;
char * pszCount_in;
int    iCount_in;
{
/*
 *  if aligning and no ambigs and ambiguous, output count as %n% in front of
 *  material
 */
if ( bAlign_m && !bShowAmbigs_m && (iCount_in > 1) )
	{
	strncat(pszLine_in, "%", LINESIZE - strlen(pszLine_in));
	strncat(pszLine_in, pszCount_in, LINESIZE - strlen(pszLine_in));
	strncat(pszLine_in, " ", LINESIZE - strlen(pszLine_in));
	}
/* Add buffer to line */
strncat(pszLine_in, pszBuf_in, LINESIZE - strlen(pszLine_in));
strncat(pszLine_in, " ", LINESIZE - strlen(pszLine_in));
}

/***************************************************************************
 * NAME
 *    padLine
 * DESCRIPTION
 *    add spaces in pszLine_in until linesize is iMax_in
 * RETURN VALUE
 *    none
 */
static void padLine(pszLine_in, iMax_in)
char * pszLine_in;
int    iMax_in;
{
int diff;

diff = iMax_in - mb_strlen( pszLine_in );
while (diff--)
	strncat(pszLine_in, " ", LINESIZE - strlen(pszLine_in));
}

/***************************************************************************
 * NAME
 *    checkForRequestedFields
 * DESCRIPTION
 *    see if the fields requested are indeed present
 * RETURN VALUE
 *    none
 */
static void checkForRequestedFields(pWord_in)
WordTemplate * pWord_in;
{
static int iCat_s = 0;
static int iDec_s = 0;
static int iFds_s = 0;
static int iPro_s = 0;
static int iUnl_s = 0;
static int iWrd_s = 0;
static char * pszMissingMessage = "\
ERROR: The %s field is missing in the input file.\n\
	   It will not be shown.\n";

if ( bDoCat_m && !iCat_s && pWord_in->pAnalyses->pszCategory == NULL)
	{
	fprintf(stderr, pszMissingMessage, "category (\\cat)");
	iCat_s++;
	bDoCat_m = FALSE;
	}
if ( bDoDec_m && !iDec_s && pWord_in->pAnalyses->pszDecomposition == NULL)
	{
	if (!bUsingDefaultFields_m)
	fprintf(stderr, pszMissingMessage, "decomposition (\\d)");
	iDec_s++;
	bDoDec_m = FALSE;
	}
if ( bDoFds_m && !iFds_s && pWord_in->pAnalyses->pszFeatures == NULL)
	{
	fprintf(stderr, pszMissingMessage, "feature descriptor (\\fd)");
	iFds_s++;
	bDoFds_m = FALSE;
	}
if ( bDoPro_m && !iPro_s && pWord_in->pAnalyses->pszProperties == NULL)
	{
	fprintf(stderr, pszMissingMessage, "property (\\p)");
	iPro_s++;
	bDoPro_m = FALSE;
	}
if ( bDoUnl_m && !iUnl_s && pWord_in->pAnalyses->pszUnderlyingForm == NULL)
	{
	if (!bUsingDefaultFields_m)
	fprintf(stderr, pszMissingMessage, "underlying form (\\u)");
	iUnl_s++;
	bDoUnl_m = FALSE;
	}
if ( bDoWrd_m && !iWrd_s && pWord_in->pszOrigWord == NULL)
	{
	fprintf(stderr, pszMissingMessage, "original word (\\w)");
	iWrd_s++;
	bDoWrd_m = FALSE;
	}
}

/***************************************************************************
 * NAME
 *    determineFieldCodes
 * DESCRIPTION
 *    parse command line field code values
 * RETURN VALUE
 *    none
 */
static void determineFieldCodes(pszArgs_in)
char * pszArgs_in;
{
char *cp;

cp = pszArgs_in;
while (*cp)
	{
	switch (*cp)
	{
	case 'a':			/* analysis/gloss */
		pszGlsFieldCode_m = getFieldCode(&cp);
		break;
	case 'c':			/* category */
		pszCatFieldCode_m = getFieldCode(&cp);
		break;
	case 'd':			/* decomposition */
		pszDecFieldCode_m = getFieldCode(&cp);
		break;
	case 'f':			/* feature descriptor */
		pszFdsFieldCode_m = getFieldCode(&cp);
		break;
	case 'p':			/* property */
		pszProFieldCode_m = getFieldCode(&cp);
		break;
	case 'u':			/* underlying form */
		pszUnlFieldCode_m = getFieldCode(&cp);
		break;
	case 'w':			/* original word */
		pszWrdFieldCode_m = getFieldCode(&cp);
		break;
	default:
		fprintf(stderr, "\n\
ERROR: the g field has an unrecognized form (%c).  Use -g cField/cField",
			*cp);
		*cp = '\0';
	}
	}

}
/*****************************************************************************
 * NAME
 *    getFieldCode
 * DESCRIPTION
 *    extract the field code information up to a '/'
 * RETURN VALUE
 *    copy of the field code
 */
char * getFieldCode(pszCode_io)
char ** pszCode_io;
{
char cbuf[BUFSIZE];
char * pszCode;
char * pszCodeEnd;
size_t uiCopy;

strcpy(cbuf,"\\");		/* we need a backslash */
pszCode = *pszCode_io + 1;
pszCodeEnd = strchr(pszCode, '/');
if (pszCodeEnd != NULL)
	{				/* there's a '/'; copy up to it */
	uiCopy = pszCodeEnd - *pszCode_io - 1;
	if (uiCopy > sizeof(cbuf) - strlen(cbuf) - 1)
	uiCopy = sizeof(cbuf) - strlen(cbuf) - 1;
	strncat(cbuf, *pszCode_io+1, uiCopy);
	*pszCode_io = pszCodeEnd + 1;
	}
else
	{				/* no '/', so use all of the string */
	strncat(cbuf, pszCode, sizeof(cbuf) - strlen(cbuf) - 1);
	**pszCode_io = '\0';
	}
/* we need a space at the end */
strncat(cbuf," ", sizeof(cbuf) - strlen(cbuf) - 1);

return (duplicateString(cbuf));
}
