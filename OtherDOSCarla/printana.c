/* PRINTANA.C - main procedure and global variables for PRINTANA program
 ***************************************************************************
 *
 * PRINTANA formats the analysis output from AMPLE to make ambiguities
 *	         easier to see
 *
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <ctype.h>
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

#include "cportlib.h"		/* C Portability library */
#include "opaclib.h"		/* OPAC library */
#ifdef __DATE__
#define COMPILEDFORMAT "Beta test version compiled %s %s\n"
const char *	pszPrintAnaCompileFormat_g = COMPILEDFORMAT;
const char *	pszPrintAnaCompileDate_g   = __DATE__;
const char *	pszPrintAnaCompileTime_g   = __TIME__;
#endif
/*
 *  nonANSI standard library functions
 */
extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;

#ifdef MSDOS
#define FILESEP '\\'
#endif
#ifdef THINK_C			/* Macintosh */
#define FILESEP ':'
#endif
#ifndef FILESEP
#define FILESEP '/'
#endif
/*
 *  local function prototypes
 */
int parse_command P((int argc, char *argv[]));
void printana P((void));
static void encoded P((FILE * out_fp, char * str));
static void usage P((void));

/***************************************************************************
 *	GLOBAL DATA DECLARATIONS
 */
TextControl sTextCtl_g = {
	NULL,	/* pszTextControlFile */
	NULL,	/* pLowercaseLetters */
	NULL,	/* pUppercaseLetters */
	NULL,	/* pCaselessLetters */
	NULL,	/* pOrthoChanges */
	NULL,	/* pOutputChanges */
	NULL,	/* pIncludeFields */
	NULL,	/* pExcludeFields */
	'\\',	/* cFormatMark */
	'%',	/* cAnaAmbig */
	'%',	/* cTextAmbig */
	'-',	/* cDecomp */
	'|',	/* cBarMark */
	NULL,	/* pszBarCodes */
	TRUE,	/* bIndividualCapitalize */
	TRUE,	/* bCapitalize */
	100		/* uiMaxAmbigDecap */
};

FILE * pInputFP_g  = stdin;	/* input  FILE pointer */
FILE * pOutputFP_g = stdout;	/* output FILE pointer */
/*
 *  starting column at which to print analyses (minus one)
 */
static int iAnalColumn_g = 24;
/*
 *  fprintf control pattern
 */
static char szControlFormat_g[] = "\n%*s %s";

static int bDoDecomp_g = TRUE;

/***************************************************************************
 * NAME
 *    main
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - pointer to array of pointers to command line arguments
 * DESCRIPTION
 *    main procedure for the PRINTANA program
 * RETURN VALUE
 *    none
 */
int main(argc,argv)
int argc;
char *argv[];
{

if (parse_command(argc,argv))	/* parse the command line */
	{				/* error - tell the user what he can do */
	usage();
	exit(1);			/* exit with error status */
	}
else
	{
	printana();			/* process the data */
	exit(0);
	}
return 0;
}

/***************************************************************************
 * NAME
 *    parse_command
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - pointer to array of command line arguments
 * DESCRIPTION
 *    Parse the command line options to set the appropriate global variables.
 * RETURN VALUE
 *    nonzero if an error occurs, zero if everything is okay
 */
int parse_command(argc,argv)
int argc;
char *argv[];
{
register int k;
register int errflag;

errflag = 0;
/*
 *  parse command line for any options
 */
if ((argv[0] == NULL) || (*argv[0] == NUL))
	argv[0] = "printana";
while ((k = getopt(argc,argv,"ac:o:")) != EOF)
	{
	switch (k)
	{
	case 'a':			/* output analyses only: no decomp */
		bDoDecomp_g = FALSE;

	case 'c':			/* column at which to print analyses */
					/* It is one less due to possible '*'
					 * for failures */
		iAnalColumn_g = atoi(optarg) - 1;
		if (iAnalColumn_g < 1)
			iAnalColumn_g = 24;	/* force a minimum */
		break;

	case 'o':			/* output file name */
		pOutputFP_g = fopen(optarg, "w");
		if (pOutputFP_g == NULL)
		{
		reportError(ERROR_MSG, "Cannot open output file %s\n", optarg);
		exit(1);
		}
		break;
	default:			/* unrecognized option */
		++errflag;
		break;
		}
	} /* end switch */
if (optind < argc)
  {
	if (!strcmp(argv[optind],"?"))
	  errflag = 1;
	else
	{
	pInputFP_g = fopen(argv[optind], "r");
	if (pInputFP_g == NULL)
		{
		reportError(ERROR_MSG, "Cannot open input file %s\n",
			argv[optind]);
		exit(1);
		}
	}
  }
return(errflag);
}

/***************************************************************************
 * NAME
 *    printana
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Process an input file, printing AMPLE output into a form that
 *    makes ambiguities clearer
 * RETURN VALUE
 *    none
 */
void printana()
{
 WordTemplate * pWord;
 WordAnalysis * pAnal;

 for (;;)
	 {
	 pWord = readTemplateFromAnalysis(pInputFP_g, &sTextCtl_g);
	 if (pWord == NULL)
	 break;
	 putc('\n', pOutputFP_g);
	 if (pWord->pszFormat != (char *) NULL)
	 {
	 encoded(pOutputFP_g, pWord->pszFormat);
	 }
	 fprintf(pOutputFP_g, "\n%-*s", iAnalColumn_g,
		 (pWord->pszOrigWord == NULL ? "" : pWord->pszOrigWord));
	 if (pWord->pAnalyses == NULL)
	 {				/* use orig word for failures */
	 fprintf(pOutputFP_g, "*%s", pWord->pszOrigWord);
	 }
	 else if (pWord->pAnalyses->pNext == NULL)
	 {				/* one analysis only */
	 pAnal = pWord->pAnalyses;
	 fprintf(pOutputFP_g," %s", pAnal->pszAnalysis);
	 if (bDoDecomp_g && (pAnal->pszDecomposition != NULL))
		 fprintf(pOutputFP_g, szControlFormat_g,
			 iAnalColumn_g, "", pAnal->pszDecomposition);
	 }
	 else
	 {				/* ambiguous analysis */
	 for ( pAnal = pWord->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		 {
		 if (pAnal == pWord->pAnalyses)
		 fprintf(pOutputFP_g," %s", pAnal->pszAnalysis);
		 else
		 fprintf(pOutputFP_g, szControlFormat_g,
			 iAnalColumn_g, "", pAnal->pszAnalysis);
		 if (bDoDecomp_g && (pAnal->pszDecomposition != NULL))
		 fprintf(pOutputFP_g, szControlFormat_g,
			 iAnalColumn_g, "", pAnal->pszDecomposition);
		 }
	 }
	 putc('\n', pOutputFP_g);
	 if (pWord->pszNonAlpha != (char *) NULL)
	 {
	 encoded(pOutputFP_g, pWord->pszNonAlpha);
	 }
	 freeWordTemplate(pWord);
	 }
 fclose(pOutputFP_g);
} /* end printana() */

/***************************************************************************
 * NAME
 *    encoded (swiped from DTBOUT)
 * ARGUMENTS
 *    out_fp - pointer to output FILE
 *    str    - pointer to string
 * DESCRIPTION
 *    Replace certain control characters in the old string with backslash
 *    escape sequences in the file output.
 * RETURN VALUE
 *    none
 */
static void encoded( out_fp, str)
FILE *out_fp;
char *str;
{
register char *p;
register int c;
register int nl_last;

for ( p = str, nl_last = 0 ; (c = *p++) != NUL ; )
	{
	if (nl_last && (c != '\n'))
	{			/* we've had a nl followed by more stuff */
	fputs("\n\t",out_fp);	/*  so give another line in output (safely) */
	nl_last = 0;		/*  (multiple nl's in a row allowed) */
	}
	switch ( c )
	{
	case '\b':   fputs( "\\b",  out_fp);			break;
	case '\f':   fputs( "\\f",  out_fp);			break;
	case '\n':   fputs( "\\n",  out_fp);	nl_last = 1;	break;
	case '\r':   fputs( "\\r",  out_fp);			break;
	case '\t':   fputs( "\\t",  out_fp);			break;
	case '\\':   fputs( "\\\\", out_fp);			break;
	default:      putc( c,      out_fp);			break;
	};
	}
}

/*****************************************************************************
 * NAME
 *    usage
 * DESCRIPTION
 *    print a usage message to the standard error output
 * RETURN VALUE
 *    none
 */
static void usage()
{
fprintf(stderr,"\
PRINTANA: Re-format AMPLE output\n\
				Version 1.0.2 (September 1998), Copyright 1998 SIL, Inc.\n");
#ifdef DJGPP
fprintf(stderr,"                (compiled for 386 or higher CPU computers)\n");
#endif
#ifdef __DATE__
fprintf(stderr, pszPrintAnaCompileFormat_g,
	pszPrintAnaCompileDate_g, pszPrintAnaCompileTime_g);
#endif
fprintf(stderr,"\n\
Usage: printana [-a] [-c col] [-o outfile] infile\n\
	-a          output analyses only: no decompositions\n\
	-c number   specifies at which column analyses are to be printed\n\
				  (default is 25)\n\
	-o outfile  output file name\n\
	infile      input file name (analysis file)\n" );
}

/****************************************************************************
 * EDIT HISTORY
 * 03-Aug-89	H.A. Black
 * 13-Jul-90	hab - Fixed bug that used decomposed field instead
 *			of orig_word field.
 * 07-Aug-90	hab - Change index to strchr and rindex to strrchr
 * 24-Jul-98   1.0.1  SRMc - fix for ANSI C and OPAC library functions
 * 01-Sep-1998 1.0.2  hab - Add Version information for DJGPP version
 *                          Add Compile date option
 */
