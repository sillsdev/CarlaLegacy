/* phonrule.c Phonological rule main program  Alan B  9 Sep 91 */
/*------------------------------------------------------------
Immediate plans:
18 Aug 94 Bill Penning noted that the banner of phonrule does not show in the log file.

Done:
+ \pr (cat)  from  ->  to  / _ env
					   or / env _
+ Adds allomorph with environment after the entry.
+ Cats can be one category to apply to.  If not given
	apply everywhere.
+ Environment Restrictions
	Environment can only be before or after.  If after, rule is
		applied to end of morpheme, if before rule is applied to beginning.
+ Which dictionary rules are applied to is determined by which one
	the program is run on.
+ If resulting allomorph exists, don't add it.
+ One layer of rules only, not applied to allomorphs.
x Add blocking rules                [1da] Austin Hale
	Below must not apply to words ending in aa
		\pr aa -> aa
		\pr at -> a / _ ^
  Turned out to be the wrong way, blocked things that should happen
	Below is better restricter:
		\pr [C]at -> [C]a / _ ^
+ From and to can be string classes, in one-to-one
	correspondence, defined above in the file.
  Examples of man-bili -> mamili:
	\pr V b -> 0 / m _      | root (or env could be / mam _)
	\pr V n -> m / _ [V]    | pref
  Or (better)
	\pr V b -> m / ma _
	\pr V n -> 0 / _ m[V]
  Or (generalizing 2)
	\scl vdstop b d g
	\scl nasal m n ng
	\pr V [vdstop] -> [nasal] / ma _
	\pr V man -> ma / _ [nasal][V]
+ Cats can be cat class, defined above in the file.

*-----------------------------------------------------------*/
/*------------------------------------------------------------
* Change history:
* 0.1   9-Sep-91 AB Original coding
* 0.1a 10-Sep-91 AB Load entry done, apply rules started
* 0.1b 11-Sep-91 AB Apply rules done
* 0.1c 11-Sep-91 AB Load rules done, started to work
* 0.1d 12-Sep-91 AB Test cat, Test allo already in, Fix error handling
					Add test for goes to zero
					Put allo after last allo
* 0.1e 12-Sep-91 AB Pick up markers from rule file
* 0.1f 12-Sep-91 AB Remove compiler errors
*                   Allow either -> or > for arrow
*                   Write DOC file
* 0.1g 13-Sep-91 AB Fix usage message, improve DOC
* 0.1h 13-Feb-92 AB Fix bug of \r not changing base
*                   Search through all of multiple categories in entry
*                   Ignore comments on end of category line
* 0.1j 19-Feb-92 AB Start to add code for // envir, removed in 0.1k
* 0.1k 20-Feb-92 AB Make longer rule override shorter
*                   Make NOP rule not add allo, only block shorter ones
* 0.1m 27-Feb-92 AB Fix bug of override not working on end
* 0.1n  2-Mar-92 AB Block only allos from dic, not newly added ones (Austin)
*                       (Allows production of duplicate allos w/ diff env)
* 0.1p  4-Mar-92 AB Allow string classes in match and replace
* 0.1q  5-Mar-92 AB Remove 0.1k fixes above (override and NOP rule)
* 0.1r  5-Mar-92 AB Add \br base rule to provide new base
*                   Add base_becomes_allomorph switch to default base
*                   Allow 0 in match to allow rules to always apply
* 0.1s  6-Mar-92 AB Allow cat classes in cat of rule
* 0.1t  3-Apr-92 AB Leave out Shoebox number fields
*                   Warn on class order if end is subset as well as begin
*                   Don't monitor base rule applications
*                   Add \cut ! field for cutoff character in base forms
* 0.1u  7-May-92 AB Add \pri and \prf for initial and final rules
* 0.1v  7-May-92 AB Add properties to base rules (make \mp in entry)
* 0.1w 10-Jul-92 AB Add # as word boundary
* 0.1x 22-Jul-92 BK Port 0.1v to Mac THINK_C
* 0.1y 13-Oct-92 AB Reconcile MAC and DOS VERSIONs
* 0.2a 21-Jan-92 AB Remove need to list longest member of class first
* 0.2b 26-Mar-93 AB Fix bug of giving trouble on undefined class
* 0.2c 26-Mar-93 AB Fix bug of making null output if all rules bad
* 0.2d 26-Mar-93 AB Don't insert base as allo if already in
*                   Leave Shoebox \_no line in, insert after it
* 0.2e 20-Apr-93 AB Fix bug in 0.2d of not putting allo after base if not rec
* 0.2f  3-May-93 AB Add \bri and \brf rules to match \pri and \prf
* 0.2g  1-Jul-94 AB Fix bug of duplicate \mp lines from base rules second time on same dictionary
* 0.2k 20-Mar-95 WM Fix whitespace bug in allo finding; fix monitor digits;
*                   count wds.
* 0.2k 20-Mar-95 WM Fix incomplete implementation of ccl in add_members
* 0.2l 11-May-95 BJY Require field markers to be at beginning of line
* 0.2m 11-May-95 BJY Fix bug of mishandling of deletion of classes
* 0.2n 12-May-95 BJY Add handling for \ca field and verify cats used in rules
* 0.2o 12-May-95 BJY Generate error message for unknown markers
* 0.2p 12-May-95 BJY Fix bug of base rule with a +/ environment inserting a
*                   morpheme property of + in an entry.
* 0.2q 15-May-95 BJY Don't process noload records
* 0.2r 17-May-95 BJY Added ability to generate new allomorph with the
*                   combined environments of a rule and an allomorph
*                   previously generated by another rule.
* 0.2s 15-Sep-95 BJY ifdef out noload stuff added in 0.2q and fix bug of
*					base rule firing but not remembering changed base
* 0.2t 19-Oct-95 BJY Fix bug of warning message being generated for
*					\id and \dis fields in the rule file
* 0.2u 01-Sep-1998 hab Add VERSION information for DJGPP VERSION
*                      Add Compile date option
*                      Add final nl when monitoring
*                      Conform monitoring to standard practice
*   16-Sept-1998 jdh renamed VERSION to PHONRULE_VERSION to avoid conflict in visual C++
*		22-Sep-98 JDH Converted all "printf" to  "fprintf(logfile,"
*					where logfile is set to stdout for the DOS version, a file for the dll version
*					"stderr" changed to "errlogfile"
* 0.2v 29-Sep-2000 hab increase temp memory size from 63000 to 640000
* 0.2w 05-Dec-2000 hab increase dictionary entry size from 5000 to 50000
*-----------------------------------------------------------*/


#ifdef DJGPP
#define PHONRULE_VERSION "Phonological Rule 0.2w  Dec 2000 Copyright SIL International\n"\
				"  (compiled for 386 or higher CPU computers)\n"
#else
#define PHONRULE_VERSION "Phonological Rule 0.2w  Dec 2000 Copyright SIL International\n"
#endif


#include "phonrule.h"

#ifdef THINK_C
#include <console.h>
#endif

#ifdef __DATE__
#define COMPILEDFORMAT "Beta test version compiled %s %s\n"
const char *	pszPhonRuleCompileFormat_g = COMPILEDFORMAT;
const char *	pszPhonRuleCompileDate_g   = __DATE__;
const char *	pszPhonRuleCompileTime_g   = __TIME__;
#endif

/* Prototypes of statics */
static int parse_command( int argc, char **argv );
static void usage( void );

/***************************************************************************
 *  variables set by the command line options
 */
int do_monitor = FALSE;         /* Monitor progress */
int do_ambig_monitor = FALSE;   /* Monitor ambigs output */
int do_trace = FALSE;           /* Output trace info */
int do_debug = FALSE;           /* Output debug info */
char comment_char = '|';        /* Comment character */
char cut_char = '\0';           /* Cutoff char */

char *recmark = "\\r ";         /* Dictionary markers */
int recmarklen = 3;
char *basemark = "\\r ";
int basemarklen = 3;
char *allomark = "\\a ";
int allomarklen = 3;
char *catmark = "\\c ";
int catmarklen = 3;
char *noloadmark = "\\no";      /* 0.2q BJY */
int noloadmarklen = 3;          /* 0.2q BJY */

int num_apps = 0;               /* Number of rules applied to a sent */
int num_ents = 0;               /* Number of entries processed */
int error_seen = FALSE;         /* Error seen during rule loading */
int base_becomes_allo = FALSE;  /* Flag for base becomes default allomorph */

FILE *logfile;
FILE *errlogfile;


static FILE *rulefile = NULL;   /* Files from command line */
static FILE *infile = NULL;
FILE *outfile = NULL;

#ifdef CSTUDIODLL
extern void prepareMyAllocGlobals();
extern void prepareLoadEntGlobals();
extern void preparePhnlGlobals();
extern void preparePhnaGlobals();
extern void myFreeAll();

	//-----------------------------------------------------
	//	setupProcess
	//  Created: jdh Sep 1998
	//  Parameters: pszErrorStr should be big enough for
	//				the longest path plus a short message.
	//  Returns TRUE if successful, FALSE otherwise (with errorStr)
	//  Called by: DLL calls this before each execute

int setupProcess(char* lpszErrorStr,	// what's this for?
					int bDoTrace,
					int bDoMonitor,
					char cCommentChar,

					const char* lpszRulesPath,
					const char* lpszDictInPath,
					const char* lpszDictOutPath,
					const char* lpszLogFilePath,
					int bAppendLog)
{
	// reset all globals

	prepareMyAllocGlobals();
	prepareLoadEntGlobals();
	preparePhnlGlobals();
	preparePhnaGlobals();

	cut_char = '\0';           /* Cutoff char */
	recmark = "\\r ";         /* Dictionary markers */
	recmarklen = 3;
	basemark = "\\r ";
	basemarklen = 3;
	allomark = "\\a ";
	allomarklen = 3;
	catmark = "\\c ";
	catmarklen = 3;
	noloadmark = "\\no";      /* 0.2q BJY */
	noloadmarklen = 3;          /* 0.2q BJY */

	num_apps = 0;               /* Number of rules applied to a sent */
	num_ents = 0;               /* Number of entries processed */
	error_seen = FALSE;         /* Error seen during rule loading */
	base_becomes_allo = FALSE;  /* Flag for base becomes default allomorph */

	// read the parameters we were given

	*lpszErrorStr = '\0';

	do_monitor = bDoMonitor; // we'll need some other way of monitoring
	do_trace = bDoTrace;
	do_debug = FALSE;
	comment_char = cCommentChar;

	infile = fopen( lpszDictInPath, "r" );  /* Open input file */
	if ( !infile )                    /* If not found */
	{
		sprintf( lpszErrorStr,
			"Error: Input Dictionary file %s not found\n",
			lpszDictInPath );
		return FALSE;
	}

	outfile = fopen( lpszDictOutPath, "w" );  /* Open input file */
	if ( !outfile )                    /* If not found */
	{
		sprintf( lpszErrorStr,
			"Error: Couldn't open the output dict file: %s\n",
			lpszDictOutPath );
		return FALSE;
	}

	rulefile = fopen( lpszRulesPath, "r" );    /* Open output file */
	if ( !rulefile )
	{
		sprintf( lpszErrorStr,
			"Error: Couldn't open the rules file: %s\n",
			lpszRulesPath );
		return FALSE;
	}

	logfile = fopen( lpszLogFilePath, bAppendLog?"a":"w" );    /* Open output file */

	if ( !outfile )
	{
		sprintf( lpszErrorStr,
			"Error: Couldn't open the LOG file %s for writing\n",
			lpszLogFilePath );
		return FALSE;
	}

	// dinstinguish between the multiple runs that may be put in one log file
	fprintf(logfile, "-----------------------------\n");
	fprintf(logfile, "Rules: %s\n", lpszRulesPath);
	fprintf(logfile, "Input dictionary:  %s\n", lpszDictInPath);
	fprintf(logfile, "Output dictionary:  %s\n", lpszDictOutPath);

	errlogfile = logfile;

	return TRUE;
}
#endif	// end ifdef CSTUDIODLL


	/************************************************************************/
#ifdef CSTUDIODLL
int runProcess()	// should return 0 if ok, but actually always returns 0
#else
void main(int argc, char **argv )  /* Main prog */
#endif
{
Rule *rules;                /* List of rules to apply */
char *dicent;                /* Current entry to work on */
void *long_term_bot;        /* Long term allocation bottom */
void *short_term_bot;       /* Short term allocation bottom */

#ifndef CSTUDIODLL
	logfile = stdout;
	errlogfile = stderr;
#endif

#ifdef THINK_C
argc = ccommand(&argv);
#endif

fputs(PHONRULE_VERSION,errlogfile);              /* Print VERSION message */
#ifdef __DATE__
fprintf(logfile, pszPhonRuleCompileFormat_g,
	pszPhonRuleCompileDate_g, pszPhonRuleCompileTime_g);
#endif

#ifndef CSTUDIODLL
if ( parse_command(argc, argv) )    /* If command line process fails */
	{
	usage();                        /* Give usage message */
	exit(1);                        /* Bad exit because no work done */
	}
#endif

long_term_bot = mytalloc( TRUE );   /* Set up allocator */

rules = loadrules( rulefile );      /* Load in rule file */

if ( do_debug )
	{
	dump_classes();
	dumprules( rules );
	}

initent( infile );                  /* Initialize entry */

short_term_bot = mytalloc( TRUE );  /* Set up allocator */

while ( (dicent = loadent( infile, outfile )) != NULL ) /* While another dictionary entry */ /* 0.2q BJY */
	{
	dicent = applyrules( rules, dicent ); /* Apply rules to it */

	putent( dicent+1, outfile );    /* Output fixed-up entry */ /* 0.2l BJY skip fudged nl */

	mytfree( short_term_bot );      /* Free all temporary space */
	}

fclose( rulefile); //jdh
fclose( infile); //jdh
fclose( outfile );                  /* Close output file */
if ( do_monitor )                   /* hab 0.2u If monitor, force nl */
	{
	fprintf( errlogfile, "\n");
	}
fclose( logfile );                  /* Close output file */
if(logfile != errlogfile)
	fclose(errlogfile);


myFreeAll();	// added by jdh oct 98 to cover up memory leak

return 0;	// always returns this, so it doesn't mean anything
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
register int errflag;

errflag = 0;
/*
 *  parse command line for any options
 */

while ((k = getopt(argc,argv,"c:i:mo:r:tz")) != EOF)
	{
	switch (k)
		{
		case 'c':                       /* comment character */
			comment_char = *optarg;
			break;
		case 'i':                       /* input file name */
			infile = fopen( optarg, "r" );  /* Open input file */
			if ( !infile )                    /* If not found */
				{
				fprintf( errlogfile,
					"Error: Input file %s not found\n", optarg );
				exit(1);                        /* Bad exit */
				}
			break;

		case 'm':                       /* monitor progress option */
			do_monitor = TRUE;
			break;

		case 'o':                       /* output file name */
			outfile = fopen( optarg, "w" );    /* Open output file */
			if ( !outfile )
				{
				fprintf( errlogfile,
					"Error: Can't open output file %s\n", optarg );
				exit(1);                /* Bad exit */
				}
			break;

		case 'r':                       /* rule file name */
			rulefile = fopen( optarg, "r" );  /* Open input file */
			if ( !rulefile )                    /* If not found */
				{
				fprintf( errlogfile,
					"Error: Rule file %s not found\n", optarg );
				exit(1);                        /* Bad exit */
				}
			break;

		case 't':                       /* trace option */
			do_trace = TRUE;
			break;

		case 'z':                       /* debugging option */
			++do_debug;                 /* debug level counter */
			break;

		default:                        /* unrecognized option */
			++errflag;
			break;
			}
	} /* end switch */

if ( !rulefile )        /* Require rule file */
	{
	fprintf( errlogfile, "Error: Rule file -r required\n" );
	++errflag;
	}

if ( !infile )          /* Require input file */
	{
	fprintf( errlogfile, "Error: Input file -i required\n" );
	++errflag;
	}

if ( !outfile )         /* Allow no output file */
	outfile = fopen( "nul", "w" );

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

fprintf( errlogfile,
"\nUsage: phonrule -r rulefile -i infile -o outfile [options]\n" );
fprintf(errlogfile,"\
-r file     rule file contains phonological rules\n\
-i file     infile is a dictionary file\n\
-o file     outfile is a modified dictionary file\n\
-m          monitor number of rules applied on each entry\n\
-t          trace rule application\n\
-c char     comment character\n\
report output can be redirected by > outfile\n" );
}
