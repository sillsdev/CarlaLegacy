/* SenTrans32.cpp - originally was sentrans.c
 */
/* sentrans.c Sentence transfer main program  Alan B  25 Oct 90 */
/*------------------------------------------------------------
 *
 * Revision History, etc. is in version.h
 *
 *	26-sept-2000 jdh uppped temp mem from 64000 to 640000
 */


#ifdef _MSC_VER
#include "StdAfx.h"
//#endif /* _MSC_VER - comment off for VC(why?); don't for DJGPP (what you'd expect)*/
#include <time.h>               /* For time of run */
#include <ctype.h>
#include "SenTransLib.h"

#ifdef C_terp
#define MEMALLOC 10000
#else
#define MEMALLOC 640000 /* was 64000 */
#endif

#ifdef THINK_C
#include <console.h>
#endif

#ifdef __STDC__
extern int isatty(int);
extern int fileno(FILE *);
#endif

/* clever hack to handle function prototypes flexibly */
#ifdef DO_NOT_HAVE_PROTOTYPES
#define P(args) ()
#else
#define P(args) args
#endif

#ifdef __cplusplus
extern "C" {
#endif
/* getopt.c */
extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;
#ifdef __cplusplus
}
#endif


/*****************************************************************************
 *  local function prototypes
 */
static void		parse_command	P((int argc,
					   char **argv,
					   char * pszTime_in));
static void		usage		P((void));
#undef P

/*
 *  information from the command line and other "globals"
 */
static SenTransData	sSenTransData_m = {
  /*
   *  variables set by the command line options
   */
	FALSE,			/* -a Monitor ambigs output */
	'|',			/* -c Comment character */
	FALSE,			/* -m Monitor progress */
	FALSE,			/* -t Output trace info */
	FALSE,			/* -v Dump class info to log */
	FALSE,			/* -x Ignore \cat field in input */
	FALSE,			/* -z Output debug info */
	stdout,			/*  > Log file pointer */
	NULL,			/* -r Rule file name */
	/*
	 * other variables
	 */
	NULL,			/* pointer to rule file */
	stderr,			/* Error log pointer (for monitoring) */
	0,				/* Number of rules tried */
	0,				/* Number of disambiguations performed */
	0,				/* Number of actual changes made */
	0,				/* Total number of rules in rule file */
	0,				/* Number of rej rules */
	0,				/* Number of am rules */
	0,				/* Number of rejun rules */
	0,				/* Number of amun rules */
	0,				/* Number of ru rules */
	0,				/* Number of rulesoff rules */
	0,				/* Number of ruleson rules */
	0,				/* Number of sentences processed */
	0,				/* Number of words output, for monitor */
	0,				/* Counts of words and ambigs in and out */
	0,				/* Number of ambiguous words input */
	0,				/* Number of ambiguities in */
	0,				/* Number of words output */
	0,				/* Number of ambiguous words output */
	0,				/* Number of ambiguities output */
	NULL,			/* Input line */
	NULL,			/* First pattern */
	NULL,			/* First class */
	NULL,			/* First category */
	NULL,			/* First property */
	NULL,			/* General rule list */
	".?!:;",			/* Sentence terminators */
	"-,'/\"",			/* Other punctuation */
	"'\"",			/* Begin punctuation */
#ifndef hab221
	FALSE,		/* all morphs have cat info in \cat field */
#endif /* hab221 */
	};

#ifndef MacCADA
static FILE *infile = NULL;
static FILE *outfile = NULL;
static char *infname = NULL;
static char *outfname = NULL;
#endif



/************************************************************************/
#if defined( MacCADA )
extern void perm_alloc(int morphs_and_allos);   /* use AMPLE's perm heap for rules */
extern void perm_release(void);
void Sentrans(FILE *pRuleFP, FILE *infile, FILE *outfile,
				int m, int a, int t, char c, int i)
#else
int main( int argc, char** argv )  /* Main prog of parser */
  /* void main( int argc, char** argv ) */ /* Main prog of parser */
#endif
/************************************************************************/
{
Word *sent;                 /* Current sentence to work on */
void *short_term_bot;       /* Short term allocation bottom */
int tot_apps;               /* Total number of rules applied to a sent */
int apps;                   /* Number of rules applied this round */

#ifdef THINK_C
argc = ccommand(&argv);
#endif

time_t		clock;
char *		pszTime;

time( &clock );
pszTime = ctime(&clock);

parse_command(argc, argv, pszTime);
/*
 *  set the log file pointer
 */
if (!isatty(fileno(stdout)))
	sSenTransData_m.pLogFP = stdout;
else
	sSenTransData_m.pLogFP = NULL;
/*
 *  write the header to the log file
 */
if (sSenTransData_m.pLogFP != NULL)
	{
	print_header(sSenTransData_m.pLogFP, pszTime);
	}

sSenTransData_m.line = (char *)myalloc( MAXLINE );

#if defined( MacCADA )
do_monitor = m;
do_ambig_monitor = a;
do_trace = t;
ignore_cat = i; /** IGNORE_CAT **/
if (c != '\0')
	comment_char = c;
else
	comment_char = '|';
num_sents = 0;
num_words = 0;
rulecount = rejcount = amcount = rucount =
		rejuncount = amuncount = rulesoncount = rulesoffcount = 0;
ruletrycount = ambigcount = ruchgcount = 0;
tot_words_in  = tot_ambig_words_in  = tot_ambigs_in = 0;
tot_words_out = tot_ambig_words_out = tot_ambigs_out = 0;
perm_alloc(0);          /* initialize permanent heap */
#endif

#ifndef MacCADA
#ifndef hab204
if (sSenTransData_m.pLogFP)
  {
	fprintf( sSenTransData_m.pLogFP, "Rule   file: %s\n",
		 sSenTransData_m.rulefname );    /* Show file names */
	fprintf( sSenTransData_m.pLogFP, "Input  file: %s\n", infname );
	fprintf( sSenTransData_m.pLogFP, "Output file: %s\n", outfname );
  }
#else  /* hab204 */
fprintf( sSenTransData_m.pLogFP, "Rule   file: %s\n",
  sSenTransData_m.rulefname );    /* Show file names */
fprintf( sSenTransData_m.pLogFP, "Input  file: %s\n", infname );
fprintf( sSenTransData_m.pLogFP, "Output file: %s\n", outfname );
#endif /* hab204 */
#endif

loadrules( sSenTransData_m.pRuleFP, &sSenTransData_m );	/* Load in rule file */


if ( sSenTransData_m.do_debug || sSenTransData_m.do_dumpclass )
  dumpclasses( sSenTransData_m.firstcl, &sSenTransData_m ); /* z or v flags */

if ( sSenTransData_m.do_debug )
  {                                         /* z flag */
	dumpcats( sSenTransData_m.firstcat, &sSenTransData_m );
	dumppats( sSenTransData_m.firstpat, &sSenTransData_m );
	dumprules( sSenTransData_m.rules, &sSenTransData_m );
  }

#ifndef hab204
if (sSenTransData_m.pLogFP)
  {
	fprintf( sSenTransData_m.pLogFP,"\
\nRule summary: %5d total (not counting on/off rules)\
\n              %5d ambiguity rejection  with unanimous env. (\\rejun)\
\n              %5d ambiguity acceptance with unanimous env. (\\amun)\
\n              %5d ambiguity rejection (\\rej)\
\n              %5d ambiguity acceptance (\\am)\
\n              %5d replacement (\\ru)\
\n              %5d rule turn off (\\rulesoff)\
\n              %5d rule turn on  (\\ruleson)\
\n",
		 sSenTransData_m.rulecount,
		 sSenTransData_m.rejuncount,
		 sSenTransData_m.amuncount,
		 sSenTransData_m.rejcount,
		 sSenTransData_m.amcount,
		 sSenTransData_m. rucount,
		 sSenTransData_m.rulesoffcount,
		 sSenTransData_m.rulesoncount);
  }
#else  /* hab204 */
fprintf( sSenTransData_m.pLogFP,"\
\nRule summary: %5d total (not counting on/off rules)\
\n              %5d ambiguity rejection  with unanimous env. (\\rejun)\
\n              %5d ambiguity acceptance with unanimous env. (\\amun)\
\n              %5d ambiguity rejection (\\rej)\
\n              %5d ambiguity acceptance (\\am)\
\n              %5d replacement (\\ru)\
\n              %5d rule turn off (\\rulesoff)\
\n              %5d rule turn on  (\\ruleson)\
\n",
	 sSenTransData_m.rulecount,
	 sSenTransData_m.rejuncount,
	 sSenTransData_m.amuncount,
	 sSenTransData_m.rejcount,
	 sSenTransData_m.amcount,
	 sSenTransData_m. rucount,
	 sSenTransData_m.rulesoffcount,
	 sSenTransData_m.rulesoncount);
#endif /* hab204 */
short_term_bot = mytalloc( (unsigned) MEMALLOC, &sSenTransData_m );  /* Set up allocator */

#ifndef MacCADA
while ( (sent = loadsent( infile, &sSenTransData_m )) != NULL ) /* While another sentence */
	{
#else
while (1)
	{ /* } extra for brace matching */
	ProcessPendingEvents();
	if (gInterrupt)
		{
	fprintf(sSenTransData_m.pErrorLogFP, "\n***SENTRANS interrupted");
		break;
		}
	if ( !(sent = loadsent(infile, &sSenTransData_m) ) )
		break;
#endif
	tot_apps = 0;
	apps = applyrules( sSenTransData_m.rules, sent,
			   &sSenTransData_m );      /* Apply  rules */
	tot_apps += apps;

	putsent( sent, outfile, &sSenTransData_m ); /* Output fixed-up sentence */

	mytfree( short_term_bot );	/* Free all temporary space */

	sSenTransData_m.num_sents++; /* Count sentence */
	if ( sSenTransData_m.do_monitor ) /* If monitor, give dot */
		{
		if ( tot_apps )
	  fprintf( sSenTransData_m.pErrorLogFP, "%d",
		   tot_apps <= 9 ? tot_apps : 9 );
		else
	  fprintf( sSenTransData_m.pErrorLogFP, "." );
		if ( sSenTransData_m.num_sents % 10 == 0 ) /* Output space every 10 */
	  fprintf( sSenTransData_m.pErrorLogFP, "  " );
		if ( sSenTransData_m.num_sents % 100 == 0 )
	  fprintf( sSenTransData_m.pErrorLogFP, "  %d",
		   sSenTransData_m.num_sents ); /* Output number every 100 */
		if ( sSenTransData_m.num_sents % 50 == 0 )
	  fprintf( sSenTransData_m.pErrorLogFP, "\n" );
		}
	}
fprintf( sSenTransData_m.pErrorLogFP, "\n" );
#ifndef hab204
if (sSenTransData_m.pLogFP)
  {
	fprintf( sSenTransData_m.pLogFP, "\nTotal sentences processed:      %d\n",
		 sSenTransData_m.num_sents );
	fprintf( sSenTransData_m.pLogFP, "Rule applications attempted:    %u\n",
		 sSenTransData_m.ruletrycount );
	fprintf( sSenTransData_m.pLogFP, "Disambiguations & changes done: %u & %u\n\n",
		 sSenTransData_m.ambigcount, sSenTransData_m.ruchgcount );

	fprintf( sSenTransData_m.pLogFP, "          Words | Ambiguous words | Ambiguities\n");
	fprintf( sSenTransData_m.pLogFP, "In:  %10ld | %15ld | %11ld\n",
		 sSenTransData_m.tot_words_in,
		 sSenTransData_m.tot_ambig_words_in,
		 sSenTransData_m.tot_ambigs_in);
	fprintf( sSenTransData_m.pLogFP, "Out: %10ld | %15ld | %11ld\n",
		 sSenTransData_m.tot_words_out,
		 sSenTransData_m.tot_ambig_words_out,
		 sSenTransData_m.tot_ambigs_out);
  }
#else  /* hab204 */
fprintf( sSenTransData_m.pLogFP, "\nTotal sentences processed:      %d\n",
	 sSenTransData_m.num_sents );
fprintf( sSenTransData_m.pLogFP, "Rule applications attempted:    %u\n",
	 sSenTransData_m.ruletrycount );
fprintf( sSenTransData_m.pLogFP, "Disambiguations & changes done: %u & %u\n\n",
	 sSenTransData_m.ambigcount, sSenTransData_m.ruchgcount );

fprintf( sSenTransData_m.pLogFP, "          Words | Ambiguous words | Ambiguities\n");
fprintf( sSenTransData_m.pLogFP, "In:  %10ld | %15ld | %11ld\n",
	 sSenTransData_m.tot_words_in,
	 sSenTransData_m.tot_ambig_words_in,
	 sSenTransData_m.tot_ambigs_in);
fprintf( sSenTransData_m.pLogFP, "Out: %10ld | %15ld | %11ld\n",
	 sSenTransData_m.tot_words_out,
	 sSenTransData_m.tot_ambig_words_out,
	 sSenTransData_m.tot_ambigs_out);
#endif /* hab204 */

#ifndef MacCADA /* MacCADA closes files from the calling routine */
fclose( outfile );                  /* Close output file */
#endif
#ifdef MacCADA          /* clean up memory, as we aren't necessarily finished! */
(void)mytalloc(0);      /* switch off temp alloc, so free really frees! */
myfree( short_term_bot );
perm_release();         /* dispose of permanent heap */
#endif
return 0;
}

#if !defined( MacCADA )  /* all following is not needed for MacCADA! */

/***************************************************************************
 * NAME
 *    parse_command
 * DESCRIPTION
 *    Parse the command line, and set all variables from options.
 * RETURN VALUE
 *    none (exits the program if there is an error)
 */
static void parse_command(int argc, char **argv, char *pszTime_in)
{
register int k;
register int errflag;

errflag = 0;
/*
 *  parse command line for any options
 */

while ((k = getopt(argc,argv,"ac:i:mo:r:tvxz")) != EOF)
	{
	switch (k)
		{
		case 'a':                       /* monitor ambigs option */
			sSenTransData_m.do_ambig_monitor = TRUE;
			break;

		case 'c':                       /* comment character */
			sSenTransData_m.comment_char = *optarg;
			break;

		case 'i':                       /* input file name */
			infile = fopen( optarg, "r" );  /* Open input file */
			if ( !infile )                    /* If not found */
				{
				fprintf( sSenTransData_m.pErrorLogFP,
			 "Error: Input file %s not found\n", optarg );
				if (!isatty(fileno(sSenTransData_m.pLogFP)))  /* If stdout is to a log file */
											   /* report error to log, too */
			fprintf( sSenTransData_m.pLogFP,
				 "Error: Input file %s not found\n", optarg );
				exit(1);                        /* Bad exit */
				}
			infname = mystrdup( optarg );   /* Remember name */
			break;

		case 'm':                       /* monitor progress option */
			sSenTransData_m.do_monitor = TRUE;
			break;

		case 'o':                       /* output file name */
			outfile = fopen( optarg, "w" );    /* Open output file */
			if ( !outfile )
				{
				fprintf( sSenTransData_m.pErrorLogFP,
			 "Error: Can't open output file %s\n", optarg );
				if (!isatty(fileno(sSenTransData_m.pLogFP)))  /* If stdout is to a log file */
											   /* report error to log, too */
			fprintf( sSenTransData_m.pLogFP,
				 "Error: Can't open output file %s\n", optarg );
				exit(1);                /* Bad exit */
				}
			outfname = mystrdup( optarg );   /* Remember name */
			break;

		case 'r':                       /* rule file name */
			sSenTransData_m.pRuleFP = fopen( optarg, "r" );/* Open input file*/
			if ( !sSenTransData_m.pRuleFP ) /* If not found */
				{
		fprintf( sSenTransData_m.pErrorLogFP,
			 "Error: Rule file %s not found\n", optarg );
				if (!isatty(fileno(sSenTransData_m.pLogFP)))  /* If stdout is to a log file */
											   /* report error to log, too */
			fprintf( sSenTransData_m.pLogFP,
				 "Error: Rule file %s not found\n", optarg );
				exit(1);                        /* Bad exit */
				}
			sSenTransData_m.rulefname = mystrdup( optarg ); /* Remember name */
			break;

		case 't':                       /* trace option */
			sSenTransData_m.do_trace = TRUE;
			break;

		case 'v':                       /* dumpclass option */
			sSenTransData_m.do_dumpclass = TRUE;
			break;

		case 'x':                       /* ignore \cat field option */
			sSenTransData_m.ignore_cat = TRUE;
			break;

		case 'z':                       /* debugging option */
			++sSenTransData_m.do_debug;	/* debug level counter */
			break;

		default:                        /* unrecognized option */
			++errflag;
			break;
			}
	} /* end switch */

print_header(stderr, pszTime_in);

if ( !sSenTransData_m.pRuleFP )        /* Require rule file */
	{
	fprintf( sSenTransData_m.pErrorLogFP, "Error: Rule file -r required\n" );
	if (!isatty(fileno(sSenTransData_m.pLogFP))) /* If stdout is to a log file */
		{                           /* report error to log, too */
	fprintf( sSenTransData_m.pLogFP, "Error: Rule file -r required\n" );
	}
	++errflag;
	}

if ( !infile )          /* Require input file */
	{
	fprintf( sSenTransData_m.pErrorLogFP, "Error: Input file -i required\n" );
	if (!isatty(fileno(sSenTransData_m.pLogFP))) /* If stdout is to a log file */
		{                           /* report error to log, too */
	fprintf( sSenTransData_m.pLogFP, "Error: Input file -i required\n" );
	}
	++errflag;
	}

if ( !outfile )         /* Allow no output file */
	outfile = fopen( "nul", "w" );

if (errflag)
	{
	usage();
	exit(1);
	}
}

/**********************************************************************
 * NAME
 *      usage
 * DESCR
 *      Give usage message.
 */
static void usage( void )
{

fprintf( sSenTransData_m.pErrorLogFP,
"\nUsage: sentrans -r rulefile -i infile -o outfile [options]\n" );
fprintf(sSenTransData_m.pErrorLogFP,"\
-r file     rule file contains transfer rules\n\
-i file     infile is an AMPLE analysis file\n\
-o file     outfile is a modified analysis file\n\
-a          monitor number of ambiguities left on each word\n\
-c char     comment character\n\
-m          monitor number of rules applied on each sentence\n\
-t          trace rule application\n\
-v          put class contents in log\n\
-x          ignore \\cat field\n\
report output can be redirected by > outfile\n" );
}

#endif  /* end of stuff not needed in MacCADA */
