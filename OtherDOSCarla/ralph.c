/* RALPH.C - main procedure and global variables for RALPH program
 ***************************************************************************
 *
 *	RALPH reverses the lines in a file, sorts the reversed lines
 *	alphabetically, unreverses them, and pads them with leading spaces
 *	to all be the same length
 *
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#define strrchr rindex
#endif
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strchr  P((const char * s, int c));
extern size_t strlen  P((const char * s));
extern void   exit    P((int status));
extern void   qsort P((void *base, size_t nmemb, size_t size,
			   int (*compar)(const void *, const void *)));
#endif

#include "allocmem.h"		/* OPAC library */
#include "rpterror.h"
/*
 *  nonANSI standard library functions
 */
extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
/*
 *  local function prototypes
 */
void help P((void));
void usage P((void));
void read_lines P((char * infile));
void reverse_lines P((void));
void write_lines P((void));
void die P((char * msg));

#ifndef NUL
#define NUL '\0'
#endif

char usemsg[] = "\
Usage:  ralph [-a] [-l linesize] [-p padding] [infile]\n\
ralph ? for help.";

char * documentation[] =
{
"ralph - reverse lines, alphabetize, and pad.",
"Syntax:  ralph [-a] [-p padding] [infile]",
"  -a          Extract analysis failures from an AMPLE log file.",
"  -l linesize Set the maximum line length (default is no limit).",
"  -p padding  Specify the minimum padding for each line (default is 0).",
"If no input file is specified, ralph reads from the standard input.  ralph",
"writes to the standard output.",
NULL
};

short a_flag = 0;		/* set nonzero by "-a" */
unsigned linesize = 0;		/* set by "-l linesize" */
unsigned padding = 0;		/* set by "-p padding" */
unsigned errflag = 0;		/* count of command line parse errors */

char **lines = NULL;		/* pointer to array of lines */
unsigned numlines = 0;		/* number of lines in the array */
unsigned maxlength = 0;		/* length of longest line in the array */

/*************************************************************************
 * NAME
 *    compare
 * ARGUMENTS
 *    a - address of first string pointer
 *    b - address of second string pointer
 * DESCRIPTION
 *    Function passed to qsort() to sort the array of reversed lines.
 * RETURN VALUE
 *    -1 if a is less than b, 0 if a equals b, 1 if a is greater than b
 */
int compare(a,b)
char **a, **b;
{
return( strcmp(*a,*b) );
}

/*************************************************************************
 * NAME
 *    main
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - pointer to array of pointers to command line arguments
 * DESCRIPTION
 *    main procedure of RALPH program
 * RETURN VALUE
 *    none
 */
int main(argc,argv)
int argc;
char *argv[];
{
register int k;
/*
 *  parse the command line
 */
if ((argc > 1) && (strcmp(argv[1],"?")==0))
	help();

if ((argv[0] == NULL) || (*argv[0] == NUL))
	argv[0] = "ralph";

while ((k = getopt(argc,argv,"al:p:")) != EOF)
	{
	switch (k)
	{
	case 'a':	++a_flag;		break;
	case 'l':	linesize = strtol(optarg, NULL, 10);  break;
	case 'p':	padding  = strtol(optarg, NULL, 10);  break;
	default:	++errflag;		break;
	}
	}
if (errflag)
	usage();
if (padding && linesize)
	{
	if (padding >= linesize)
	{
	fprintf(stderr,
		"ralph: padding cannot exceed size of the output lines\n");
	usage();
	}
	linesize -= padding;	/* make room for the padding */
	}
/*
 *  process the input file
 */
read_lines( (optind>=argc) ? (char *)NULL : argv[optind] );
reverse_lines();
qsort( (char *)lines, (int)numlines, sizeof(char *), compare );
reverse_lines();
write_lines();
return 0;
}

/*************************************************************************
 * NAME
 *    read_lines
 * ARGUMENTS
 *    infile - pointer to input file name
 * DESCRIPTION
 *    Read a file, building an array of string pointers from the lines
 *    of input.
 * RETURN VALUE
 *    none
 */
void read_lines(infile)
char *infile;
{
char *inbuf;
unsigned insize;
unsigned maxlines;
FILE *infp;
char *p;
unsigned k;
/*
 *  open the input file
 */
if (infile == (char *)NULL)
	infp = stdin;
else
	infp = fopen( infile, "r" );
if (infp == NULL)
	{
	reportError(ERROR_MSG, "Cannot open input file %s\n", infile);
	exit(1);
	}
/*
 *  allocate the initial memory requirements
 */
lines = (char **)allocMemory( (maxlines=1000)*sizeof(char *) );
numlines = 0;
inbuf = allocMemory( insize=1000 );
/*
 *  read the input file, a line at a time
 */
while (fgets(inbuf,(int)insize,infp) != (char *)NULL)
	{
	/*
	 *  make sure we have the entire line, no matter how long
	 */
	while ((p = strchr(inbuf,'\n')) == (char *)NULL)
	{
	inbuf = reallocMemory(inbuf, insize+=1000 );	/* grow the buffer */
	k = strlen(inbuf);
	if (fgets(inbuf+k, (int)(insize-k), infp) == (char *)NULL)
		break;				/* we've hit EOF */
	}
	if (ferror(stdin))
	die("Error reading from the input file");
	if (p != (char *)NULL)
	*p = NUL;				/* erase the trailing \n */
	if (    a_flag &&
		strncmp(inbuf,"Analysis Failure: ",18) &&
		strncmp(inbuf,"    Root Failure: ",18) )
	continue;				/* skip this line */
	/*
	 *  add this line to the array
	 */
	if (numlines >= maxlines)
	lines = (char **)
			reallocMemory((char *)lines,(maxlines+=1000)*sizeof(char *));
	k = strlen(inbuf);
	/*
	 *  save only the linesize final bytes in the line
	 */
	if (linesize && (k > linesize))
	{
	p = &inbuf[k-linesize];
	k = linesize;
	}
	else
	p = inbuf;
	if (k > maxlength)
	maxlength = k;			/* save the maximum line length */
	lines[numlines++] = strcpy(allocMemory(k+1),p);
	}
/*
 *  free up space we no longer need
 */
free(inbuf);
lines = (char **)reallocMemory((char *)lines, numlines*sizeof(char *) );
}

/*************************************************************************
 * NAME
 *    reverse_lines
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Reverse each line in the array.
 * RETURN VALUE
 *    none
 */
void reverse_lines()
{
register char *p, *q;
register int c;
register unsigned k;

for ( k = 0 ; k < numlines ; ++k )
	{
	p = lines[k];
	q = p + strlen(p) - 1;
	while (p < q)
	{
	c = *p;		/* swap the characters end to end */
	*p++ = *q;
	*q-- = c;
	}
	}
}

/*************************************************************************
 * NAME
 *    write_lines
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Write the sorted array of lines, padding to line up the ends of the
 *    lines.
 * RETURN VALUE
 *    none
 */
void write_lines()
{
unsigned i, j;

for ( i = 0 ; i < numlines ; ++i )
	{
	for ( j = 0 ; j < padding ; ++j )
	putc(' ', stdout);		/* write minimum padding */
	for ( j = strlen(lines[i]) ; j <maxlength ; ++j )
	putc(' ', stdout);		/* write needed padding */
	fputs( lines[i], stdout );		/* write the line itself */
	putc('\n', stdout);			/* write a newline */
	if (ferror(stdout))
	die("Error writing to the output file");
	}
}

/***************************************************************************
 * NAME
 *    die
 * ARGUMENTS
 *    msg - pointer to error message
 * DESCRIPTION
 *    Print a message to standard error and abort the program.
 */
void die(msg)
char *msg;
{
fprintf(stderr, "RALPH: " );
fprintf(stderr, "%s.\n", msg);
exit(8);
}

/*************************************************************************
 * NAME
 *    help
 * DESCRIPTION
 *    Print verbose help to standard output and exit the program.
 */
void help()
{
register char **dp;
#ifdef __DATE__
printf( "RALPH Version 1.1b (compiled %s)\n", __DATE__ );
#else
printf( "RALPH Version 1.1b\n" );
#endif
#ifdef DJGPP
fprintf(stderr,"      (compiled for 386 or higher CPU computers)\n");
#endif
for ( dp = documentation ; *dp ; printf("%s\n",*dp++) )
	;
exit(1);
}

/***************************************************************************
 * NAME
 *    usage
 * DESCRIPTION
 *    Print terse help to standard error and abort the program.
 */
void usage()
{
fprintf(stderr, "%s.\n", usemsg );
exit(8);
}

/*
#ifdef DOCUMENTATION
NAME
	ralph - reverse lines, alphabetize, and pad

SYNOPSIS
	ralph [-a] [-l linesize] [-p padding] [infile]

DESCRIPTION
	Ralph reads an input file, sorts the lines alphabetically from
	the ends of the lines, and writes out the lines padded to line
	up the ends of the lines.  If no input file is given, ralph
	reads from the standard input.  Ralph always writes to the
	standard output.  The following command line options are
	recognized:

		-a		extract the analysis failures from an AMPLE
			log file
		-l linesize	set the maximum output line length.  For example,
			"-l 75" limits output lines to only the last 75
			characters.  The default is no limit.
		-p padding	set the minimum amount of padding at the
			beginning of each line of output.  The default
			is zero spaces.  For example, "-p 8" causes
			ralph to write 8 spaces before every line of
			output.

DIAGNOSTICS
	RALPH: Out of memory
	RALPH: Error reading from the input file
	RALPH: Error writing to the output file

AUTHOR
	Steve McConnel
#endif
*/
/****************************************************************************
 *  EDIT HISTORY
 *	 3-Sep-88	Steve McConnel - write from scratch (Version 1.0)
 *				based on RAP.PTP by Dave Weber
 *	 8-Sep-88	SRMc - #define getc and putc for Aztec C
 *	20-Oct-88	SRMc - reorganize the file header comments
 *	12-Nov-88	SRMc - add -l switch for line length limit (1.1)
 *	14-Nov-88	SRMc - replace ANTXGN with AMPLE in message
 *			     - for -a flag, allow both Root and Analysis
 *				Failure
 *	24-Jan-89	SRMc - port to MSDOS Microsoft C
 * 1.1a  1-Apr-93 AB Handle 8-bit characters (all that was needed was
 *                      a recompile with Microsoft C6
 *	24-Jul-98	SRMc - port to Linux / gcc
 * 1.1b 31-Sep-1998     hab -  Add Version information for DJGPP version
 *                             (This is not worthy of an increment in version
 *                              number.  However, DJGPP, Win32, and 8086
 *                              versions were also created.  To keep things
 *                              consistent with the rest of the CARLA tools,
 *                              a new version number was added.)
 */
