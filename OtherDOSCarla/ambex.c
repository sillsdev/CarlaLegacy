/* ambex.c  Ambiguity Extract  Alan B  10 Aug 89
 ***************************************************************************
 *
 *      main(argc,argv)
 *      int argc;
 *      char *argv[];
 *
 *      INPUT is either an analysis file or a synthesized output file
 *      OUTPUT is all ambiguities found in the input file
 *          If input is an analysis file, then the \a and \d are
 *              included in the output.  Otherwise, the ambiguities
 *              are output one per line, with no format markers.
 *
 * Compile and link:
 *      AMBEX is self-contained, so can be compiled and linked in
 *      Microsoft C with the command:
 *          cl ambex.c
 *
 ***************************************************************************
 *      EDIT HISTORY
 *      10-Aug-89       Alan Buseman - original creation
 * 0.1a 29-Jun-90 BK Make portable to MAC
 * 0.1a 29-Jun-90 AB Add stdlib.h, defs of TRUE and FALSE
 * 0.1b 08-Aug-90 hab Port to UNIX
 *		      De-lint the source
 *		      Allow for command line file name (not just stdin)
 *		      Only print the banner with 'ambex ?'
 * 0.1c 01-Sep-1998 hab Add Version information for DJGPP version
 *                      Add Compile date option
 ************************************************************************/
/* Copyright 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */

#include <stdio.h>
#include <string.h>
#ifndef USG
#include <stdlib.h>
#endif

#define TRUE 1
#define FALSE 0

#define MAX_LINE_SIZE 10000

#ifdef THINK_C
#include <console.h>
#endif

#ifdef DJGPP
#define VERSION "Ambiguity Extractor 0.1c Sep 1998, Copyright 1989-1998 SIL, Inc.\n"\
				"  (compiled for 386 or higher CPU computers)\n"
#else
#define VERSION "Ambiguity Extractor 0.1c Sep 1998, Copyright 1989-1998 SIL, Inc.\n"
#endif

#ifdef __DATE__
#define COMPILEDFORMAT "Beta test version compiled %s %s\n"
const char *	pszAmbExCompileFormat_g = COMPILEDFORMAT;
const char *	pszAmbExCompileDate_g   = __DATE__;
const char *	pszAmbExCompileTime_g   = __TIME__;
#endif

extern int getopt(), optind;    /* declarations for using getopt() */
extern char *optarg;

extern char *strchr();

#ifndef OPTSTRING
#define OPTSTRING "a:l:u:"          /* option list for getopt */
#endif

char ambig_char = '%';          /* ambiguity marker */
int lower_bound = 0;            /* lower bound number to output */
int upper_bound = 32000;        /* upper bound number to output */

static void usage();            /* functions defined static later on */
static int parse_command();     /*    in this file */

/*************************************************************************
 * NAME
 *    main
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - pointer to array of command line arguments
 * DESCRIPTION
 *    main program for ambiguity extract
 * RETURN VALUE
 *    none
 */
int main(argc, argv)
int argc;
char *argv[];
{
char *line;                     /* Input line */
char *ambig_buf,                /* Buffer to store ambig for output */
	 *ambig_start,              /* Point to start of ambig */
	 *ambig_end;                /* Point to end of ambig */
int  ambig_num,                 /* Number of ambigs */
	 ambig_len;                 /* Length of ambig */
int  i;                         /* Temp loop counter */
int  count;                     /* Temp counter */
FILE *infp;			/* input file pointer */


#ifdef THINK_C
argc = ccommand(&argv);
#endif

if (parse_command(argc,argv))   /* parse the command line */
	{                           /* error parsing?? */
	usage();                    /* tell the user what he can do */
	exit(1);                    /* exit with error status */
	}
else if ((optind < argc) && !strcmp(argv[optind],"?"))
	{                           	/* if he types "ambex ?", */
	fputs(VERSION,stderr);              /* Print version message */
#ifdef __DATE__
	fprintf(stderr, pszAmbExCompileFormat_g,
		pszAmbExCompileDate_g, pszAmbExCompileTime_g);
#endif
	usage();				/* tell the user what he can do */
	exit(0);
	}
else
	{
	line = (char *) malloc( MAX_LINE_SIZE );  /* Get big space for line */
	ambig_buf = (char *) malloc( 5000); /* Get big space for ambig */

	if (optind < argc)
	  {
	infp = fopen(argv[optind],"r");       /* Open the input file */
	if (!infp)
	  {
		fprintf( stderr, "Input file %s not found\n", argv[optind] );
		exit(1);
	  }
	  }
	else
	  {
	infp = stdin;				/* Use stdin */
	  }
	while ( fgets(line, MAX_LINE_SIZE, infp ) )       /* While a line */
	{
	if ( !strncmp( line, "\\a", 2 ) ||
		 !strncmp( line, "\\d", 2 ) )        /* If anal or decomp */
		{
		if ( (ambig_start = strchr( line, ambig_char )) != NULL )
		{                               /* If ambig */
		ambig_num = atoi( ambig_start + 1 );
		if ( ambig_num >= lower_bound &&        /* If in bounds */
				ambig_num <= upper_bound )
			puts( line );                   /* Output line */
		}
		}
	else                                    /* Else (other line) */
		{
		ambig_end = line;                   /* While ambig in line */
		while ( (ambig_start = strchr( ambig_end, ambig_char )) != NULL )
		{
		ambig_end = ambig_start + 1;    /* Find end of ambig */
		ambig_num = atoi( ambig_end );  /* Get how many */
					/* Get number of %'s to skip */
		count = ambig_num ? ambig_num  + 1 : 2;
		for ( i = 0; i < count; i++ )   /* Find last % */
			{
			ambig_end = strchr( ambig_end, ambig_char );
			if ( !ambig_end )           /* Protect from bad data */
			{
			ambig_end = line + strlen(line);
			break;
			}
			else
			ambig_end++;            /* Move to end */
			}

		if ( ambig_num >= lower_bound &&        /* If in bounds */
				ambig_num <= upper_bound )
			{
			ambig_len = ambig_end - ambig_start; /* Get len of ambig */
			strncpy ( ambig_buf, ambig_start, ambig_len ); /* Copy */
			*(ambig_buf + ambig_len) = '\0';    /* Null terminate */
			puts( ambig_buf );              /* Output ambig */
			}
		}
		}
	}
	exit(0);
	}
return 0;	/* should never get here */
} /* end main */

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

errflag = 0;
/*
 *  parse command line for any options
 */
#ifdef AZTEC
argv[0] = "ambex";
#endif

while ((k = getopt(argc,argv,OPTSTRING)) != EOF)
	{
	switch (k)
	{
	case 'a':                       /* ambiguity character */
		ambig_char = *optarg;
		break;
	case 'l':                       /* Lower bound */
		lower_bound = atoi(optarg);
		break;
	case 'u':                       /* Upper bound */
		upper_bound = atoi(optarg);
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
fprintf(stderr, "\n%s", "\
Usage: ambex [-a char] [-l number] [-u number] input >output\n\
	-a char     change ambiguity character (default is '%')\n\
	-l number   set lower bound (default is 0)\n\
	-u number   set upper bound (default is no limit)\n");
}
