// Ana2Xml32.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "ana2xmlLib.h"

/* clever hack to handle function prototypes flexibly */
#ifdef HAVE_PROTOTYPES
#define P(args) args
#else
#define P(args) ()
#endif

extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;

static void	     parseCommand	   P((int argc,
						  char **argv));
static void	     usage		   P((void));

				// Ana2Xml lib

extern void          performMapping        P((AnaData * pAnaData_in));
extern void          openFiles             P((AnaData * pAnaData_in));
extern void          closeFiles            P((AnaData * pAnaData_in));

#undef P

static AnaData sAnaData_m =
{
  0,				/* iDebugLevel                    */
  '<',				/* cBeginRoot                     */
  '>',				/* cEndRoot                       */
  1,				/* uiWordCount                    */
  {
	NULL,			/* sTextCtl.pszTextControlFile    */
	NULL,			/* sTextCtl.pLowercaseLetters     */
	NULL,			/* sTextCtl.pUppercaseLetters     */
	NULL,			/* sTextCtl.pCaselessLetters      */
	NULL,			/* sTextCtl.pOrthoChanges         */
	NULL,			/* sTextCtl.pOutputChanges        */
	NULL,			/* sTextCtl.pIncludeFields        */
	NULL,			/* sTextCtl.pExcludeFields        */
	'\\',			/* sTextCtl.cFormatMark           */
	'%',			/* sTextCtl.cAnaAmbig             */
	'%',			/* sTextCtl.cTextAmbig            */
	'-',			/* sTextCtl.cDecomp               */
	'|',			/* sTextCtl.cBarMark              */
	NULL,			/* sTextCtl.pszBarCodes           */
	TRUE,			/* sTextCtl.bIndividualCapitalize */
	TRUE,			/* sTextCtl.bCapitalize           */
	100			/* sTextCtl.uiMaxAmbigDecap       */
  },
  NULL,				/* pszInputFile                   */
  NULL,				/* pInputFP                       */
  NULL,				/* pszOutputFile                  */
  NULL,				/* pOutputFP                      */
  NULL,				/* pszLogFile                     */
  NULL				/* pLogFP                         */
};

#include "version.h"

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

const int	iAna2XmlVersion_g    = VERSION;
const int	iAna2XmlRevision_g   = REVISION;

#if PATCHLEVEL < 0
const int	iAna2XmlPatchlevel_g = -(PATCHLEVEL);
#else
const int	iAna2XmlPatchlevel_g = PATCHLEVEL;
#endif

const char	cAna2XmlPatchSep_g  = PATCHLEVELSEPCHAR;
const char *	pszAna2XmlDate_g     = DATE;
const char *	pszAna2XmlYear_g     = YEAR;
#ifdef __DATE__
const char *	pszAna2XmlCompileFormat_g = COMPILEDFORMAT;
const char *	pszAna2XmlCompileDate_g   = __DATE__;
const char *	pszAna2XmlCompileTime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszAna2XmlTestVersion_g = TESTFORMAT;
#else
const char *	pszAna2XmlTestVersion_g = NULL;
#endif
#endif

/*
#ifdef _WINDOWS
#define main(argc, argv) dosmain(argc, argv)
#endif
*/
/*************************************************************************
 * NAME
 *    main
 * DESCRIPTION
 *    main program for ANA to XML mapper
 * RETURN VALUE
 *    none
 */
int main(int argc, char* argv[])
{

  parseCommand(argc, argv);

  openFiles(&sAnaData_m);
  /*
   *  allocate space for records
   */
  pRecordBuffer_g	     = (char *)allocMemory( BIG_RECSIZE );
  uiRecordBufferSize_g = BIG_RECSIZE;

  performMapping(&sAnaData_m);

  closeFiles(&sAnaData_m);

  freeMemory(pRecordBuffer_g);

  exitSafely(0);		/* exit with error level 0 (no errors) */

  return 0;		/* (not reached) */
}

/***************************************************************************
 * NAME
 *    parseCommand
 * DESCRIPTION
 *    Parse the command line, and set all variables from options.
 * RETURN VALUE
 *    none (exits the program if there is an error)
 */
static void parseCommand(int argc, char **argv)
{
int	k;
int	bShowUsage = FALSE;
#if _DEBUG
VOIDP	trap_address = NULL;
int	trap_count = 0;
char *	p;
#endif

/*
 *  parse command line for any options
 */
while ((k = getopt(argc, argv, "a:b:d:e:i:l:o:/z:Z:")) != EOF)
	{
	switch (k)
	{
	case 'a':			/* ambiguity separation character */
		sAnaData_m.sTextCtl.cAnaAmbig = *optarg;
		break;

		case 'b':                       /* begin of root marker */
			sAnaData_m.cBeginRoot = *optarg;
			break;

		case 'd':                       /* decomp separation char */
			sAnaData_m.sTextCtl.cDecomp = *optarg;
			break;

		case 'e':                       /* end of root marker */
			sAnaData_m.cEndRoot = *optarg;
			break;

	case 'i':			/* input file name */
		sAnaData_m.pszInputFile = optarg;
		break;

	case 'l':			/* log file name */
		sAnaData_m.pszLogFile = optarg;
		break;

	case 'o':				/* output file name */
		sAnaData_m.pszOutputFile = optarg;
		break;

		case '/':                       /* debugging option */
			++sAnaData_m.iDebugLevel;                 /* debug level counter */
			break;

#if _DEBUG
	case 'z':		/* memory allocation trace filename */
		setAllocMemoryTracing(optarg);
		break;

	case 'Z':		/* memory allocation trap address,count */
		trap_address = (VOIDP)strtoul(optarg, &p, 10);
		if (*p == ',')
		trap_count = (int)strtoul(p+1, NULL, 10);
		if (trap_count == 0)
		trap_count = 1;
		break;
#endif

	default:			/* unrecognized option */
		bShowUsage = TRUE;
		break;
	}
	} /* end switch */

if ((optind < argc) && (strcmp(argv[optind],"?") == 0))
	bShowUsage = TRUE;

if (	bShowUsage ||
	((optind < argc) && (strcmp(argv[optind],"?") == 0)) )
	{
	usage();
	exitSafely(1);
	}
}

/*****************************************************************************
 * NAME
 *    usage
 * DESCRIPTION
 *    Print a terse summary of the command options.
 * RETURN VALUE
 *    none
 */
static void usage(void)
{
  fprintf(stderr,
	"Ana2Xml: Convert an AMPLE ANA file to XML format");
  fprintf(stderr, "Version %d.%d%c%d (%s), Copyright %s SIL Intrnational\n",
	iAna2XmlVersion_g, iAna2XmlRevision_g, cAna2XmlPatchSep_g,
	iAna2XmlPatchlevel_g, pszAna2XmlDate_g, pszAna2XmlYear_g);
  fputs("\
Usage: Ana2Xml [options]\n\
\n\
-a char  ambiguity separation character\n\
-b char  begin of root character\n\
-d char  morpheme decomposition separation character\n\
-e char  end of root character\n\
-i file  name of the Input  analysis file\n\
-l file  name of the Log file\n\
-o file  name of the Output analysis file\n\
", stderr);
}
