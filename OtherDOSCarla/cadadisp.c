/*      CADADISP.C - CADA Multiple File Interlinear Display
***************************************************************************
*      EDIT HISTORY
* 0.1   2-May-90 ALB Original coding by Alan Buseman
* 0.2  04-Aug-90 hab Allow multiple files as input
* 0.3   7-Aug-90 ALB Fix to output \sh at top for Shoebox
*       8-Aug-90 ALB Fix to use ifdef MSDOS for UNIX portability
* 0.4  20-Feb-91 ALB Make align words and wrap long lines
*                      Add -m option for margin
*                      Add -w option for wrap length
*                      Delete percents before and after ambigs
* 0.4a 21-Feb-91 ALB Change MAXLINE to 5000 for unwrapped input
*                      Correct to allow %0% to come out
* 0.4b 25-Feb-91 ALB Fix to pull lines together for wrapping
* 0.4c  5-Apr-91 ALB Large model compile, goes 17 times faster
* 0.4d  5-Apr-91 ALB Change to malloc for smaller exe file
*                       Also change max line len to 5000
* 0.4e 17-Jul-91 ALB Fix bug of eating digit off front of ambiguity
* 0.4f 23-Jul-91 ALB Fix further bug of eating digit off ambiguity
*                    Fix bug of losing last line if no wrap
* 0.4g 22-Jul-92 BK  Port new version to Mac THINK_C
*                       Fixed uninitialized variable (morelines) in main
* 0.4h 28-Jan-94 ALB Add -o option for output file to fix menu problem
* 0.4i 14-Nov-95 hab Added check and error report for when exceeding MAXLINE;
*                       Ported to DJGPP compiler;
*                       Increased MAXLINE to 50,000 under DJGPP compiler
* 0.4j 16-Nov-95 KB  removed invalid extern for strlen and strcmp
* 0.4k 01-Sep-1998 hab Add Version information for DJGPP version
*                      Add Compile date option
************************************************************************/
/* Copyright 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */

#ifdef C_terp
#include "\ct\stdio.h"
#include "\ct\stdlib.h"
#else
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#endif

#define TRUE 1
#define FALSE 0

#ifdef THINK_C
#include <console.h>
#define MAXFILES (FOPEN_MAX-3)
#endif

#ifdef USG                      /* Andy Black's UNIX compiler */
#define MAXFILES (_NFILE-3)
#endif

#ifdef DJGPP
#define MAXFILES 12             /* Default (could be 12) */
#define MAXLINE 50000           /* Maximum input line length */
#elif _MSC_VER <= 800
#define MAXFILES 12
#define MAXLINE 5000
#elif _MSC_VER > 1000
#define MAXFILES 12             /* Default (could be 12) */
#define MAXLINE 50000           /* Maximum input line length */
#endif

#ifndef MAXFILES
#define MAXFILES 16
#endif

#ifndef MAXLINE
#define MAXLINE 50000
#endif

#ifdef DJGPP
#define VERSION "\
\nCADADISP: CADA Multiple File Interlinear Display\
\n       Version 0.4k Sep 1998, Copyright 1991-1998 SIL, Inc.\n"\
				"  (compiled for 386 or higher CPU computers)\n"
#else
#define VERSION "\
\nCADADISP: CADA Multiple File Interlinear Display\
\n       Version 0.4k Sep 1998, Copyright 1991-1998 SIL, Inc.\n"
#endif

#ifdef __DATE__
#define COMPILEDFORMAT "Beta test version compiled %s %s\n"
const char *	pszCadaDispCompileFormat_g = COMPILEDFORMAT;
const char *	pszCadaDispCompileDate_g   = __DATE__;
const char *	pszCadaDispCompileTime_g   = __TIME__;
#endif

extern int getopt(), optind;    /* Declarations for using getopt() */
extern char *optarg;

int do_shoebox = 0;             /* Command line option */
int wrap = MAXLINE;             /* Default to no wrap */
int margin = 0;                 /* Default to no margin */

static void usage();            /* Functions defined static later on */
static int parse_command();     /*    in this file */
static void spaceover(char *word, int dist);

FILE *infile[MAXFILES];
FILE *outfile;                  /* Output file */
char *line[MAXFILES];
char *next_line[MAXFILES];
char *line_start[MAXFILES];
char *nextwd[MAXFILES];
char *wd[MAXFILES];

/*************************************************************************
 * NAME
 *    main
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - pointer to array of command line arguments
 * DESCRIPTION
 *    main program for displaying lines of files
 * RETURN VALUE
 *    none
 */
void main(argc, argv)
int argc;
char *argv[];
{
int first;                      /* Signal for first line */
int file_not_found;             /* Signal for file not found */
int numfiles;                   /* Number of input files */
int i, j;                       /* Temp loop counters */
char *s;                        /* Temp string pointer */
char nc;                        /* Temp hold of next char */
int morelines = TRUE;           /* Flag for more lines in file */
int morewords;                  /* Flag for more words in line */
int wordlen;                    /* Word length, for align */
int longestlen;                 /* Longest word length, for align */
int linelen;                    /* Current line length, for wrap */
int wrapped_line;               /* Signal this is a wrapped line */

#ifdef THINK_C
argc = ccommand(&argv);
#endif

if (parse_command(argc,argv))   /* Parse the command line */
	{                           /* If error */
	usage();                    /* Give usage */
	exit(1);                    /* Exit with error status */
	}
else if ((optind < argc) && !strcmp(argv[optind],"?"))
	{                           /* If "?" */
	fputs(VERSION,stderr);              /* Print version message */
#ifdef __DATE__
	fprintf(stderr, pszCadaDispCompileFormat_g,
		pszCadaDispCompileDate_g, pszCadaDispCompileTime_g);
#endif
	usage();
	exit(0);
	}

if ( !outfile )
	outfile = stdout;

numfiles = argc - optind;       /* Calculate the number of files to open */
if (numfiles > MAXFILES)        /* Check for upper limit */
	{
	fprintf(stderr, "\nToo many files (%d) requested; max is %d.\n",
		numfiles, MAXFILES);
	exit(2);
	}
if (numfiles < 1)       /* Check for lower limit */
	{
	usage();
	exit(0);
	}

file_not_found = 0;             /* Init signal */
for (i = 0; i < numfiles; i++)
  if ( !(infile[i] = fopen(argv[i+optind],"r")) )       /* Open each file */
	{
	  fprintf( stderr, "Input file %s not found\n", argv[i+optind] );
	  file_not_found = 1;
	}
if (file_not_found)
	  exit(1);

for (i = 0; i < numfiles; i++)      /* Allocate the lines */
	{
	line[i] = malloc( MAXLINE );
	next_line[i] = malloc( MAXLINE );
	}

if ( do_shoebox )               /* If shoebox option on */
	fprintf( outfile, "\\sh\n" );         /* Output a marker at top of file */

first = TRUE;

for (i = 0; i < numfiles; i++)  /* For each file */
	*line[i] = '\0';            /* Terminate line */

while ( TRUE )
	{
	if ( !morelines )                   /* If no line from any file */
	break;                          /* Terminate loop */

	if ( !first )               /* If not first line, output blank before */
	{
	fprintf( outfile, "\n" );
	}
	else
	first = FALSE;

	morelines = FALSE;                  /* Assume no more */

	for (i = 0; i < numfiles; i++)      /* For each file */
	{
					/* Start load at end of line */
	while ( TRUE )                  /* While format break not reached */
		{
		*next_line[i] = '\0';       /* Clear next line */
					/* Get line from next file */
		if ( fgets( next_line[i], MAXLINE, infile[i] ) )
		{
		morelines = TRUE;       /* Remember a line found */
					/* Cut off nl */
		*(next_line[i] + strlen( next_line[i] ) - 1) = '\0';

					/* If backslash, or blank line */
					/* or not wrapping */
					/* break format */
		if ( !*next_line || *next_line[i] == '\\'
			|| wrap == MAXLINE )
			{                   /* If not first line */
			if ( *line[i] )
			break;          /* Break from adding lines */
			}
	if ( strlen(line[i]) >= MAXLINE )
	  {
		fprintf(stderr,
		  "\n%s: %sReached maximum line processing length in file %s",
		  "CADADISP", "WARNING!  ", argv[i+optind]);
		fprintf(stderr,"\n\ton input line: %s", next_line[i]);
		fprintf(stderr,
				  "\n\tWill truncate this line.  Results are unpredictable!");
		break;
	  }
	if ( *line[i] )         /* If prev line */
			strcat( line[i], " " ); /* Add space to prev line */
	if ( (strlen(line[i]) + strlen(next_line[i])) >= MAXLINE )
	  {
		fprintf(stderr,
				   "\n%s: %sReached maximum line processing length in file %s",
		   "CADADISP", "WARNING!  ", argv[i+optind]);
		fprintf(stderr,"\n\ton input line: %s", next_line[i]);
		fprintf(stderr,
				   "\n\tWill truncate this line.  Results are unpredictable!");
		break;
	  }
		strcat( line[i], next_line[i] ); /* Add next line */
		*next_line[i] = '\0';   /* Clear next line */
		}
		else                        /* Else (no line) */
		break;                  /* Break line load loop */

		}                           /* End while not format break */
	}                               /* End for each file */

	for (i = 0; i < numfiles; i++)      /* For each line */
	{
	for ( s = line[i]; *s; s++ )    /* Delete extra percents */
		{                           /* Before and after ambig */
		nc = *(s + 1);
		if ( *s == '%'
			&& ( nc >= '1' && nc <= '9' )
			&& ( s == line[i] || *(s - 1) == ' ' ) )
		while ( *s == '%' || ( *s >= '0' && *s <= '9' ) )
			{
			strcpy( s, s + 1 );
			if ( *s == '%' )    /* Don't go past percent */
			break;
			}

		else if ( *s == '%' && ( nc == ' ' || nc == '\n' ) )
		strcpy( s, s + 1 );
		}
					/* Initialize for align */
	line_start[i] = line[i];         /* Set line_start to start */
	wd[i] = line[i];                /* Set word to start */
	}

	morewords = TRUE;
	linelen = 0;
	while ( morewords )
	{
	morewords = FALSE;
	longestlen = 0;
	for (i = 0; i < numfiles; i++)          /* For each line */
		{
		nextwd[i] = wd[i];
		if ( *nextwd[i] )
		morewords = TRUE;
		while ( *nextwd[i] && *nextwd[i] != ' ' )
		nextwd[i]++;                    /* Find end of word */
		while ( *nextwd[i] && *nextwd[i] == ' ' )
		nextwd[i]++;                    /* Find next word */
		wordlen = nextwd[i] - wd[i];
		if ( wordlen > longestlen )     /* Remember longest */
		longestlen = wordlen;
		}

	linelen += longestlen;              /* Calculate new line len */
	if ( linelen > wrap                     /* If longer than wrap */
		&& wd[0] > line_start[0] )       /* And not long first word */
		{
		wrapped_line = TRUE;                /* Remember wrapped */
						/* Output start of lines */
		for (i = 0; i < numfiles; i++)      /* For each line */
		{
		*(wd[i] - 1) = '\0';            /* Terminate line */
		for ( j = 0; j < margin; j++ )  /* Output margin */
			fputc( ' ', outfile );
		fputs( line_start[i], outfile );           /* Output line */
		fputc( '\n', outfile );
		line_start[i] = wd[i];           /* Move line start */
		}
		linelen = 0;                        /* Clear line len */
		fprintf( outfile, "\n" );                     /* Put blank line between
*/
		}
	else                                    /* Else (wrap ok) */
		{
						/* Align words */
		for (i = 0; i < numfiles; i++)      /* For each line */
		{
		if ( morewords )                /* If more words */
			{                           /* Space as necessary */
			spaceover( nextwd[i],
			longestlen - ( nextwd[i] - wd[i] ) );
			wd[i] += longestlen;        /* Move to next word */
			}
		else                            /* Else (no more words) */
			{
			for ( j = 0; j < margin; j++ )  /* Output margin */
			fputc( ' ', outfile );
			fputs( line_start[i], outfile );       /* Output line */
			fputc( '\n', outfile );
			}
		}                       /* End of for each line */

		}                           /* End of else (wrap ok) */

	}                               /* End of while more words */

	for (i = 0; i < numfiles; i++)      /* For each line */
	{
	strcpy( line[i], next_line[i] ); /* Copy over next line */
	if ( strlen( line[i] ) == 1 )   /* If it was blank line */
		*line[i] = '\0';            /* Remove space */
	}
	}                                   /* End of while more lines */
} /* End main */




/***************************************************************************
 * NAME
 *      spaceover
 * ARGS
 *      word - Word to push over to the right.
 *      dist - Distance to push it.
 * DESC
 *      Push rest of line (from word on) over to the right the number
 *          of spaces shown in dist.
 * RETN
 *      None
 */
static void spaceover(char *word, int dist)
{
char *s;

if ( dist == 0 )                            /* If no distance, do nothing */
	return;

s = word + strlen( word );                  /* Find end of line */

for ( ; s >= word; s-- )                    /* For all of line */
	*(s + dist) = *s;                       /* Move forward */

for ( s = word; s < word + dist; s++ )      /* Fill in spaces */
	*s = ' ';
}



/***************************************************************************
 * NAME
 *    parse_command
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - pointer to array of command line arguments
 * DESCRIPTION
 *    Print a terse summary of the command options, then exit the program.
 * RETURN VALUE
 *    nonzero if an error occurs, zero if everything is okay
 */
static int parse_command(argc,argv)
int argc;
char *argv[];
{
register int k;
register int errflag;

outfile = NULL;
errflag = 0;
/*
 *  parse command line for any options
 */

while ((k = getopt(argc,argv,"o:sm:w:")) != EOF)
	{
	switch (k)
	{
	case 'o':
		outfile = fopen( optarg, "w" );
		break;
	case 's':                       /* set shoebox option */
		do_shoebox = 1;
		break;
	case 'm':                       /* set margin */
		margin = atoi( optarg );
		break;
	case 'w':                       /* set wrap */
		wrap = atoi( optarg );
		break;
	default:                        /* unrecognized option */
		++errflag;
		break;
	}
	} /* end switch */

return(errflag);
}

/***************************************************************************
 * NAME
 *    usage
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Print a terse summary of the command options.
 * RETURN VALUE
 *    none
 */
static void usage()
{
fprintf(stderr,"\
Usage: cadadisp [options] file1 [file2 ... file%d]\n\
	   -m num   set left margin\n\
	   -s       handle \\id lines properly for Shoebox\n\
	   -w num   set wrap length for long lines\n\
	   >file    sends output to a file\n", MAXFILES);
}
