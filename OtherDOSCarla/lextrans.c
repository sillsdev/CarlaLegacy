/* lextrans.c Lexical transfer main program  Alan B  29 Sep 92 */
/*------------------------------------------------------------
* Change history:
* 0.1  29-Sep-92 AB Original coding, much code from Sentrans 1.0f
* 0.2   1-Oct-92 AB Version change for field test to Bill
* 0.2a 12-Nov-92 AB Add -c option for comment character
* 0.2b  1-Mar-93 AB Cut off nl
*                   Add warning for empty from or to firld
*                   Change some chars to unsigned
* 0.2c  2-Mar-93 AB Incorporate Bill's work from his 0.2a
*                   Put version header into log file
*                   Add statistical summary to log file
*                   Do error exit if no dic entries found
*                   Do error exit if no change rules found
*                   Do error exit if source and target marks the same
*                   Require output file
* 0.2d  2-Mar-93 AB Allow more space for rules
*                   Allow for nl or tab after marker
* 0.2e 17-May-93 AB Fix bug of fail when 1st char of src wrd is upper ASCII
* 0.2f  8-Jun-93 AB Further fix of bug fixed in 0.2e
* 0.2g 10-Feb-94 AB Add -p option to replace categories only
*                   (Really needs "-p catmarker" to replace both root and cat, but that is too complicated for right now.)
* 0.2h  1-Mar-95 BJY Put in fix that allows rules to be made for multiple source and target words
* 0.2j 17-Mar-95 KB Recompiled using C7.00 -- now runs on an XT  ???
* 0.2k 15-Jun-95 BJY Add ability to read AMPLE command file and thence parse the
*                     code table to get the noload marker(s)
* 0.2m 28-Nov-95 BJY Port to 386 compiler
* 0.2n 13-Dec-95 RNE Add ability to read and write \p properties.
* 0.2o 26-Dec-95 RNE Add -q option to replace properties through dictionary.
* 0.2p 01-Sep-1998 hab Add Compile Date option
*                      Add final nl when monitoring
*                      Conform monitoring to standard practice
*                      Force version information to display on stderr
*		21-Sep-98	JDH added #ifdef'd code for CarlaStudio DLL
*					Converted references to stderr to errlogfile.
*					Converted printfs to fprintf(logfile,
* 18-May-99			JDH added CarlaStudio support for -q, -p, and -n options
* 0.2r 15-Jan-2000 hab Fix memory leaks due to rules being allocated outside
*                      of temp region, then "sentences" being allocated
*                      within temp region.  myfree then did not free rules.
*                      Also free all rules.
*                      Also have CarlaStudio use any processed source
*                       dictionaries.
*                      Also have CarlaStudio list dictionary files in log.
* 0.2s 27-Mar-2000 hab Limit of 2000 characters per line is too small for some
*                      large ambiguities.  Increased it to 10000.
* 0.2t 05-Jul-2000 hab pass on \u field
* 0.2u 29-Sep-2000 hab Increase temp memory size from 63000 to 640000
* 0.2v 20-Oct-2000 rde LexTrans wasn't allowing *just* category
*                      changing. When only '-p' replace categories
*                      is selected, the rule file was processing
*                      as having no rules (due to an invalid for
*                      loop test).
* 0.2v 25-Oct-2000 hab Fix bug which did not set fromhead->next and
*                      tohead->next pointers to null after their content was
*                      freed.
* 0.2w 28-Mar-2001 hab Fix bugs which did not manage memory properly for
*                      properties in rules.
*-----------------------------------------------------------*/
#ifdef DJGPP
#define VERSION "Lexical Transfer 0.2w Mar 2001 Copyright SIL International\n"\
				"  (compiled for 386 or higher CPU computers)\n"
#else
#define VERSION "Lexical Transfer 0.2w Mar 2001 Copyright SIL International\n"
#endif

#include "lextrans.h"

#ifdef C_terp
#define MEMALLOC 10000
#else
#define MEMALLOC 640000 /* hab 0.2u was 64000 */
#endif

#ifdef __DATE__
#define COMPILEDFORMAT "Beta test version compiled %s %s\n"
const char *	pszLexTransCompileFormat_g = COMPILEDFORMAT;
const char *	pszLexTransCompileDate_g   = __DATE__;
const char *	pszLexTransCompileTime_g   = __TIME__;
#endif

/* Prototypes of statics */
static int parse_command( int argc, char **argv );
static void usage( void );

/***************************************************************************
 *  variables set by the command line options
 */
int replace_cats = FALSE;       /* Replace categories only. JDH Says: This is always false. */
int do_monitor = FALSE;         /* Monitor progress.		JDH Says: This is always false.*/
int replace_props = FALSE;		/* RNE Replace properties */
int do_ambig_monitor = FALSE;   /* Monitor ambigs output */
char comment_char;              /* Comment char */
int do_trace = FALSE;           /* Output trace info */
int do_debug = FALSE;           /* Output debug info */
int errflag = FALSE;            /* Fatal error */

int num_sents = 0;              /* Number of sentences processed */
unsigned int num_words = 0;     /* Number of words output */
int num_apps = 0;               /* Number of rules applied to a sent */
int trycount = 0;               /* Number of attempted  rule applics WM*/
int changecount = 0;            /* Number of successful rule applics WM*/
int splitcount = 0;             /* Number of cases of replacing 1 by n WM*/
int reccount = 0;               /* Number of records seen in dict WM */
int rulecount = 0;              /* Number of rules made WM */

#define kMaxMarkerLength 10
char recmark[kMaxMarkerLength];               /* Mark of record in dic */
char sourcemark[kMaxMarkerLength];            /* Mark of source form in dic */
char targetmark[kMaxMarkerLength];            /* Mark of target form in dic */
char catmark[kMaxMarkerLength];               /* Mark of cat in dic */
char propmark[kMaxMarkerLength];				/* Mark of properties (morpheme) in dic */

/*FILE * logfile = stderr;*/
FILE* logfile;
FILE* errlogfile;


extern int error_seen;          /* Error seen during rule loading */
char* glpszErrorStr=NULL;

static FILE *dicfile = NULL;  /* UNUSED IN DLL*/ /* Files from command line */
static FILE *infile = NULL;
static FILE *outfile = NULL;
static FILE *cmdfile = NULL;    /* 0.2k BJY */

#ifdef CSTUDIODLL
static int gnNumDicts=0; /* jdh how many dictionaries are in dictFileArray? */
static FILE **dictFileArray=NULL;
#include <assert.h>
#define BAILOUT(x, MSG) {assert(FALSE); fclose(logfile); if(logfile != errlogfile) fclose(errlogfile); if(glpszErrorStr) strcpy(glpszErrorStr, MSG); return x;}
#else
#define BAILOUT(x, MSG) {exit(x);}
#endif


#ifdef CSTUDIODLL

/*-----------------------------------------------------
 *	copyMarker
 *  Description: will safely copy the SFM marker, and insert the
 *			backslash if its missing.  Will truncate if there
 *			isn't enough space.
 *  Parameters: iMaxLength is the total, including null terminator
 *  Created:	jdh July 7 1988
 */
void copyMarker(int iMaxLength, char* pszTarget, const char* pszSource)
{
	char* startTarget = pszTarget;
	if(pszSource[0] != '\\')
	{
		*startTarget = '\\';
		startTarget++;
		iMaxLength--;
	}
	/* to do: do something better than just truncating. */
	strncpy(startTarget, pszSource, iMaxLength-1);
	/* strncpy doesn't always put in a NULL */
	startTarget[iMaxLength-1] = '\0';
}

/*-----------------------------------------------------
 *	setupProcess
 *  Created: jdh July 7 1987
 *  Parameters: pszErrorStr should be big enough for
 *				the longest path plus a short message.
 *  Returns TRUE if successful, FALSE otherwise (with errorStr)
 *  Called by: DLL calls this before each execute
 */
#define IBool int

IBool setupProcess(char* lpszErrorStr,
			char cCommentChar,
			IBool bDoTrace,
			IBool bMonitorChanges,
				IBool bReplaceCats, 	/* jdh 5-18-99 added -q, -p, and -n options */
			IBool bReplaceProps,
			IBool bReplaceRoots,
			const char* lpszSourceMarker,
			const char* lpszTargetMarker,
			const char* lpszRecordMarker,
			const char* lpszTargetCategoryMarker,
			const char* lpszTargetPropertyMarker,

			const char** plpszDictPaths,
			int nDictCount,
			const char* lpszInputANAPath,
			const char* lpszOutANAPath,
			const char* lpszLogFilePath)
{
	int i=0;
	glpszErrorStr = lpszErrorStr;

	prepareLexSentGlobals();
	prepareLexRuleGlobals();
	prepareMyAllocGlobals();

	/*  reset globals */
	replace_props = FALSE;		/* RNE Replace properties */
	do_ambig_monitor = FALSE;   /* Monitor ambigs output */
	comment_char;              /* Comment char */
	do_trace = FALSE;           /* Output trace info */
	do_debug = FALSE;           /* Output debug info */
	errflag = FALSE;            /* Fatal error */

	num_sents = 0;              /* Number of sentences processed */
	num_words = 0;				/* Number of words output */
	num_apps = 0;               /* Number of rules applied to a sent */
	trycount = 0;               /* Number of attempted  rule applics WM*/
	changecount = 0;            /* Number of successful rule applics WM*/
	splitcount = 0;             /* Number of cases of replacing 1 by n WM*/
	reccount = 0;               /* Number of records seen in dict WM */
	rulecount = 0;              /* Number of rules made WM */

	/* set globals from incoming parameters */

	comment_char = cCommentChar;
	do_trace =  bDoTrace,
	do_monitor =  bMonitorChanges,
	copyMarker(kMaxMarkerLength, sourcemark, lpszSourceMarker);
	copyMarker(kMaxMarkerLength, recmark, lpszRecordMarker);

	/* jdh 5-18-99 added -q, -p, and -n options
	 * Before this fix, I think these options were all always on.
	 */ The dos code copied \xxx into all unsued markers, so presumably they would just never be found,
		 */  so I do the same.
		 */

	if(bReplaceRoots)
		copyMarker(kMaxMarkerLength, targetmark, lpszTargetMarker);
	else
		copyMarker(kMaxMarkerLength, targetmark, "\\xxx");

	if(bReplaceCats)
		copyMarker(kMaxMarkerLength, catmark, lpszTargetCategoryMarker);
	else
		copyMarker(kMaxMarkerLength, catmark, "\\xxx");

	if(bReplaceProps)
		copyMarker(kMaxMarkerLength, propmark, lpszTargetPropertyMarker);
	else
		copyMarker(kMaxMarkerLength, propmark, "\\xxx");
	replace_props = bReplaceProps;


#ifndef hab203 /* moved above */
	logfile = fopen( lpszLogFilePath, "w" );    /* Open log file */
	if ( !logfile )
	{
		sprintf(lpszErrorStr,
			"Error: Couldn't open the LOG file %s for writing\n",
			lpszLogFilePath );
		return FALSE;
	}
	errlogfile = logfile;
#endif /* hab203 */

#ifndef hab203
	fputs(VERSION,errlogfile);           /* Print version message */
#ifdef __DATE__
	fprintf(logfile, pszLexTransCompileFormat_g,
		pszLexTransCompileDate_g, pszLexTransCompileTime_g);
#endif
#endif /* hab203 */
	/* open files */
	gnNumDicts = nDictCount;
	if ( !nDictCount )
	{
		sprintf(lpszErrorStr,
			"Error: No enabled dictionaries specified\n" );
		return FALSE;
	}
	dictFileArray = malloc( sizeof(FILE*) * gnNumDicts);
	assert(dictFileArray);
	for(i=0; i< gnNumDicts; i++)
	{
		assert(plpszDictPaths[i]);
		dictFileArray[i] = fopen( plpszDictPaths[i], "r" );  /* Open input file */
		if ( !dictFileArray[i] )                    /* If not found */
		{
			sprintf(lpszErrorStr,
				"Error: Dictionary file %s not found\n",
				plpszDictPaths[i] );
			return FALSE;
		}
#ifndef hab203
		else
		  fprintf(logfile, "Using dictionary file %s\n",
			  plpszDictPaths[i]);
#endif /* hab203 */
	}

	infile = fopen( lpszInputANAPath, "r" );  /* Open input file */
	if ( !infile )                    /* If not found */
	{
		sprintf(lpszErrorStr,
			"Error: Input ANA file %s not found\n",
			lpszInputANAPath );
		return FALSE;
	}

	outfile = fopen( lpszOutANAPath, "w" );    /* Open output file */
	if ( !outfile )
	{
		sprintf(lpszErrorStr,
			"Error: Couldn't open the 0utput ANA file %s for writing\n",
			lpszOutANAPath );
		return FALSE;
	}

#ifdef hab203 /* moved above */
	logfile = fopen( lpszLogFilePath, "w" );    /* Open output file */
	if ( !outfile )
	{
		sprintf(lpszErrorStr,
			"Error: Couldn't open the LOG file %s for writing\n",
			lpszLogFilePath );
		return FALSE;
	}
	errlogfile = logfile;
#endif /* hab203 */

	cmdfile = NULL;
	return TRUE;
}
#endif

#ifndef hab02w
/**********************************************************************
 * NAME
 *      FreeRuleProps
 * DESCR
 *      Free memory used by a list of properties in a rule.
 */
void FreeRuleProps( ListCharPtr * pList )
{
  ListCharPtr * pNext;
  while (pList)
	{
	  pNext = pList->next;
	  myfree(pList->name);
	  myfree(pList);
	  pList = pNext;
	}
}
#endif /* hab02w */

#ifdef CSTUDIODLL
int runProcess(char* lpszErrorStr)
#else
/************************************************************************/
int main( argc, argv )  /* Main prog */
/************************************************************************/
int argc;           /* Count of cmd line args */
char **argv;        /* Array of pointers to command line args */

#endif
{
int i;
Rule **rules;               /* Rules */
Word *sent;                 /* Current sentence (analysis) to work on */
#ifdef JUNK
void *long_term_bot;        /* Long term allocation bottom */
#endif
void *short_term_bot;       /* Short term allocation bottom */


#ifndef CSTUDIODLL
	logfile = stdout;
	errlogfile = stderr;

fputs(VERSION,errlogfile);           /* Print version message */
#ifdef __DATE__
fprintf(logfile, pszLexTransCompileFormat_g,
	pszLexTransCompileDate_g, pszLexTransCompileTime_g);
#endif
#endif /*CSTUDIODLL (moved from just before fputs on 15-Jan-2000) */

#ifndef CSTUDIODLL
strcpy( recmark, "\\r" );           /* Init record mark */
strcpy( sourcemark, "\\xxx" );        /* Init source mark */
strcpy( targetmark, "\\xxx" );        /* Init target mark */
strcpy( catmark, "\\xxx" );           /* Init cat mark */
strcpy( propmark, "\\xxx" );		/* Iniy property mark */

if ( parse_command(argc, argv) )    /* If command line process fails */
	{
	usage();                        /* Give usage message */
	BAILOUT(1, "usage invoked")      /* Bad exit because no work done */
	}
#endif


#ifdef JUNK     /* Let permanent stuff go into normal allocation */
long_term_bot = mytalloc( (unsigned) MEMALLOC );   /* Set up allocator */
#endif

#ifdef CSTUDIODLL
rules = loadrules( dictFileArray, gnNumDicts );  /* jdh change to a list of dicts*/
 for(i=0; i< gnNumDicts; i++) /*jdh */
   fclose(dictFileArray[i]);	/*jdh */
 free(dictFileArray);			/*jdh */
 dictFileArray = NULL;			/*jdh */
#else
rules = loadrules( dicfile, cmdfile );
#endif /* CSTUDIODLL */
if ( !rules )                       /* 0.2k BJY  error in command file or code table */
	BAILOUT(1, "Problem with rules")

else if ( reccount == 0 )           /* Complain about no records. */
	{fprintf(logfile, "\nError: No dictionary entries were found.\n");
	errflag++;
	}
else if ( rulecount == 0 )          /* Complain to log file if no rules WM */
	{fprintf(logfile, "\nError: No change rules were found in dictionary.\n");
	errflag++;
	}

if ( streq( sourcemark, targetmark  ) )
			 /* Complain about no distinction of marks. */
	{fprintf(logfile, "\nError: The source and target field marks must differ.\n");
	errflag++;
	}
					   /* Report on rule building phase */
fprintf(logfile, "\n\
There were %d records in the dictionary.\n\
%d change rules were created.\n", reccount, rulecount);

if ( do_debug )
	{
	dumprules();
	}

if ( errflag )           /* A fatal error after the command line WM */
   BAILOUT(1, "?")              /* Bad exit */

short_term_bot = mytalloc( (unsigned) MEMALLOC );  /* Set up allocator */

while ( ( sent = loadsent( infile ) ) ) /* While another sentence */
	{
	sent = applyrules( rules, sent ); /* Apply rules to it */

	putsent( sent, outfile );       /* Output fixed-up sentence */

	mytfree( short_term_bot );      /* Free all temporary space */
	}

 fclose(infile);	/* added by jdh 21 sept 1998 */

fclose( outfile );                  /* Close output file */
if ( do_monitor )                   /* hab 0.2p If monitor, force nl */
	{
	fprintf(errlogfile, "\n");
	}

					   /* Report statistics. */
fprintf(logfile, "\n\
%d words were processed.\n\
%d rule applications were tried, and %d substitutions were made.\n\
%d new ambiguit%s created for words with multiple translations.\n",
		num_words, trycount, changecount, splitcount,
			(splitcount == 1 ? "y was" : "ies were"));

 myFreeAll(); /* jdh added to clean up memory leaks */

for ( i = 0; i < 256; i++ )                 /* hab 0.2r Clear hash table */
  {
	Rule *pRule, *pRuleLast;
	pRule = rules[i];
	while (pRule)
	  {
	myfree(pRule->match);
	myfree(pRule->repl);
	myfree(pRule->cat);
#ifndef hab02w
	FreeRuleProps(pRule->lstProps);
#else
	myfree(pRule->lstProps);
#endif /* hab02w */
	pRuleLast = pRule;
	pRule = pRule->next;
	myfree(pRuleLast);
	  }
  }

 myfree(rules);
 fclose(logfile);  /* hab 0.2w */
 return 0;
}


extern int getopt(), optind;    /* declarations for using getopt */
extern char *optarg;

/**********************************************************************
 * NAME
 *      parse_command
 * ARGS
 *      argc - number of command line arguments
 *      argv - pointer to array of command line arguments
 * DESCR
 *      Parse the command line options and load variables from them.
 * RETRN
 *      Nonzero if an error occurs, zero if everything is okay.
 */
static int parse_command( int argc, char **argv )
{
register int k;

errflag = 0;
/*
 *  parse command line for any options
 */

while ((k = getopt(argc,argv,"c:d:f:i:mn:o:p:q:r:s:tz")) != EOF)
	{
	switch (k)
	{
	case 'c':                       /* comment character */
		comment_char = *optarg;
		break;

	case 'd':                       /* dictionary file name */
		if ( cmdfile )              /* 0.2k BJY   don't use command line */
			break;                  /*  for dict file if using a command file */

		dicfile = fopen( optarg, "r" );  /* Open input file */
		if ( !dicfile )                    /* If not found */
			{
			fprintf(logfile,
				"Error: Dictionary file %s not found\n", optarg );
			BAILOUT(1, "Dict not found")                        /* Bad exit */
			}
		break;

	case 'i':                       /* input file name */
		infile = fopen( optarg, "r" );  /* Open input file */
		if ( !infile )                    /* If not found */
			{
			fprintf(logfile,
				"Error: Input file %s not found\n", optarg );
			BAILOUT(1, "Input Not found")                        /* Bad exit */
			}
		break;

	case 'm':                       /* monitor progress option */
		do_monitor = TRUE;
		break;

	case 'o':                       /* output file name */
		outfile = fopen( optarg, "w" );    /* Open output file */
		if ( !outfile )
			{
			fprintf(logfile,
				"Error: Can't open output file %s\n", optarg );
			BAILOUT(1, "Can't open output file")                /* Bad exit */
			}
		break;

	case 'n':                       /* target marker */
		strcpy( targetmark, "\\" );
		strcat( targetmark, optarg ); /* copy marker */
		break;

	case 'p':                       /* category marker */
		strcpy( catmark, "\\" );
		strcat( catmark, optarg ); /* copy marker */
		break;

	case 'q':                       /* property marker */
		strcpy( propmark, "\\" );
		strcat( propmark, optarg ); /* copy marker */
		replace_props = TRUE;
		break;

	case 'r':                       /* record marker */
		strcpy( recmark, "\\" );
		strcat( recmark, optarg );  /* copy marker */
		break;

	case 's':                       /* source marker */
		strcpy( sourcemark, "\\" );
		strcat( sourcemark, optarg ); /* copy marker */
		break;

	case 't':                       /* trace option */
		do_trace = TRUE;
		break;

	case 'z':                       /* debugging option */
		++do_debug;                 /* debug level counter */
		break;

	case 'f':                       /* command file  0.2k BJY */
		cmdfile = fopen( optarg, "r" );  /* Open command file */
		if ( !cmdfile )             /* If not found */
			{
			fprintf(logfile,
				"Error: Command file %s not found\n", optarg );
			BAILOUT(1, "Command file not found")                        /* Bad exit */
			}
		if ( dicfile )              /* don't use command line for */
			{                       /*  dictionary if command file used */
			fclose( dicfile );
			dicfile = NULL;
			}
		break;

	default:                        /* unrecognized option */
		++errflag;
		break;
		}
	} /* end switch */

if ( !dicfile && !cmdfile )     /* Require dictionary file  OR command file 0.2k BJY */
	{
	fprintf(logfile,  "Error: Dictionary file -d required\n" );
	++errflag;
	}

if ( !infile )          /* Require input file */
	{
	fprintf(logfile,  "Error: Input file -i required\n" );
	++errflag;
	}

if ( !outfile )         /* Allow no output file */
	{
	fprintf(logfile,  "Error: Output file -o required\n" );
	++errflag;
	}

return(errflag);
}




/**********************************************************************
 * NAME
 *      usage
 * DESCR
 *      Give usage message.
 */
static void usage( void )
{

fprintf(errlogfile,"\n\
Usage: lextrans -d dicfile -r rec -s source -n target -i infile -o outfile\n\
-d file     dictionary file to use for lexical transfer\n\
-f file     AMPLE .CMD file containing names of files \n\
-r mark     dictionary record marker (without backslash)\n\
-s mark     dictionary marker for source lexical items\n\
-n mark     dictionary marker for target lexical items\n\
-p mark     dictionary marker for category\n\
-q mark     dictionary marker for property\n\
-i file     infile is an AMPLE analysis file\n\
-o file     outfile is a modified analysis file\n\
-c char     comment character\n\
-m  monitor changes applied\n\
-t  trace changes applied\n\
report output can be redirected by > outfile\n" );
}
