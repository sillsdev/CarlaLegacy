/* join.c  Join compound words in text for AMPLE  Alan B  4 Feb 91 */
/*------------------------------------------------------------
* Notes:
* 21 Jun 93 Brian Bull reported that JOINCOMP seemed to hang and
*               damage his hard disk when run on text with upper
*               ASCII characters.
*-----------------------------------------------------------*/
/*------------------------------------------------------------
* Change history:
* 0.1   4-Feb-91 AB Start coding
* 0.1a  4-Feb-91 AB Read dictionary and load compound structure
* 0.1b  4-Feb-91 AB Rework algorithm for better join
* 0.1c  5-Feb-91 AB Join words in text
* 0.1d  5-Feb-91 AB Deal with upper case in section heads and entries
* 0.2   5-Feb-91 AB Look at INTX.CTL for \wfc for find wfc chars
*                   Also make use of the \nocap flag.
*                   Add -p for partial match allowed to join
* 0.2a 14-Feb-91 AB Make -m monitor option work
*                   Add statistical report at end
* 0.2b 18-Jun-91 AB Rename JOINCOMP and change usage to match
* 0.2c 26-Jul-91 AB Add search for \a allomorph as well as root
* 0.2d 23-Jun-92 AB Add -j and -a options for join markers
* 0.2e 10-Jul-92 AB Fix bug of -a option failing
* 0.2f 16-Jul-92 AB Fix bug of failure to join after begin punc
* 0.2g 22-Jul-92 AB Fix bug of extra underline in join after verse number
* 0.2h 31-Jul-92 AB Add -v option for variant form join marker
* 0.2i 22-Jul-92 BK Port 0.2c to Mac THINK_C
* 0.2j 13-Oct-92 AB Reconcile MAC and DOS versions
* 0.2k 21-Sep-95 AB Change to standard myalloc, increase maxline
* 0.2l 17-Jun-98 hab Add Compile date option for DJGPP v.2.1
* 0.2m 27-Aug-98 hab Allow the user to change bridge character
*                    Add every 100 words count to monitor display
* 0.2n 17-May-1999 hab Preserve any initial instances of bridge characters in
*                      the input.
*                    Allow the user to override default Hold character (used
*                      in preserving any pre-existing bridge characters).
*                    incorporate the following, too:
*  7-July-98  Hatton prepare for CarlaStudio Processor (CSTUDIODLL #ifdefs)
*			   It appears that someone had done some work towards
*				making this DLL-ready.  Since I don't know of an
*				existing application of this, I've taken the liberty
*				of making it conform to CARLASTUDIO DLL requirements.
* 14-July-98 jdh DLL version: insert a backslash in the marker params if missing
* 21-Sept-98 jdh added fcloses to files that were being left open (in dll)
*
* 0.2o 19-Nov-1999 hab remove #ifdef JUNK code
*                      add -k comment character command line option (and
*                        fix a few comments along the way)
*                      use input text control file parsing code from AMPLE
*                      Have CarlaStudio Log file append on opening file (so the
*                        log file will show all passes)
* 0.2p 22-Jun-2000 hab fix memory leaks
* 0.2q 27-Dec-2000 hab define myfree as freeMemory for non-DLL versions
* 0.2r 24-Jul-2001 hab allow final line to not have a newline
*-----------------------------------------------------------*/

#ifdef DJGPP
#define VERSION "Join Compounds 0.2r (386) July 2001 Copyright SIL International\n"
#else
#define VERSION "Join Compounds 0.2r July 2001 Copyright SIL International\n"
#endif

#include <stdio.h>              /* Include standard lib prototypes */
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#ifdef THINK_C
#include <console.h>
#endif

#ifndef _WINDLL
#ifdef CSTUDIODLL
#include "myallo.h"             /* Include myallo prototypes */
#else
#include "allocmem.h"
#ifndef hab02q
#define myfree freeMemory
#endif /* hab02q */
#endif /* JDH */
#endif
#ifndef hab02o
/* SIL library headers */
#include "cportlib.h"
#include "opaclib.h"
#else
				/* Define TRUE and FALSE */
	/*--------------------------------------------------------------------
	* The following are convenient aliases for TRUE, FALSE,
	* and string equal.
	*-------------------------------------------------------------------*/
#define TRUE 1
#define FALSE 0
#define streq !strcmp
#endif /* hab02o */

#ifdef _WINDLL
#define myalloc malloc
#ifndef hab02p
#define myfree free
#endif /* hab02p */
#define mystrdup strdup
#include <windows.h>
#endif

/* Allocate memory for a specified struct */
#define structalloc(x) (struct x *) myalloc( sizeof(struct x) )
#define Structalloc(x) (x *) myalloc( sizeof(x) )

#ifndef hab02o
#define MAXLINE 30000
#else /* hab02o */
#ifdef DJGPP
#define MAXLINE 30000
#else
#define MAXLINE 3000
#endif	/* jdh inserted */

#ifdef CSTUDIODLL
/*#include "stdafx.h" */ /*get an error if no precompiled header directive is found */
#undef MAXLINE
#define MAXLINE 30000
#endif
#endif /* hab02o */

char line[MAXLINE];             /* Input line */
static FILE *logfile;
FILE *errlogfile;

/*-------------------------------------------------------------------
* The data structures in this file all use defines of the form:
*
*   #define Grammar struct gramstruct
*
* These defines are supposed to make later code more readable
*   by simplifying constructs such as:
*
*   struct gramstruct *gram1;           ->    Grammar *gram1;
*   malloc(sizeof(struct gramstruct))   ->    malloc(sizeof(Grammar))
*
* An upper case first letter is used to distinguish these structure
*   names from variables.
*------------------------------------------------------------------*/

#define Comp struct compstruct

Comp {                  /* Lexical Compound structure */
	char *word;         /* Compound word */
	Comp *link;         /* Link to next */
	};

#ifdef __DATE__
#define COMPILEDFORMAT "Beta test version compiled %s %s\n"
const char *	pszJoinCompCompileFormat_g = COMPILEDFORMAT;
const char *	pszJoinCompCompileDate_g   = __DATE__;
const char *	pszJoinCompCompileTime_g   = __TIME__;
#endif

/* Prototypes of statics */
static char *match( Comp *comp, char *word );
static void makeul( char *line );
static char *getcline( char *line, int maxline, FILE *file );
static Comp *loadcomps( FILE *file );
static void loadcomp( char *word );
static void dumpcomps( Comp *comp );
static Comp *newcomp( void );
static int parse_command( int argc, char **argv );
static void usage( void );
static char *skipwhite( char *s );
static void markBridge (char *line );
static void unMarkBridge (char *line );
#ifndef hab02p
#ifdef CSTUDIODLL
static void freecomps(Comp *pComp);
#endif /* CSTUDIODLL */
#endif /* hab02p */

#ifndef hab02o
/*****************************************************************************
 *  local global data
 */
static TextControl sTextControl_m = {
	NULL,	/* filename */
	NULL,	/* list of lowercase/uppercase pairs sorted by lowercase */
	NULL,	/* list of lowercase/uppercase pairs sorted by uppercase */
	NULL,	/* array of caseless letters */
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
char	intxfname[FILENAME_MAX];
#endif /* hab02o */

/***************************************************************************
 *  variables set by the command line options
 */
int do_monitor = FALSE;         /* Monitor progress */
int do_trace = FALSE;           /* Output trace info */
int do_debug = FALSE;           /* Output debug info */
int partial = FALSE;            /* Partial match allowed */
int show_compounds = FALSE;     /* Show compounds from dictionary */

Comp *firstcomp;            /* First compound in list */

#define kMaxMarkerLength 10	/* jdh switch to using a constant */
char wordmark[kMaxMarkerLength];          /* Mark of root in dictionary */
char allomark[kMaxMarkerLength];          /* Mark of allomorph in dictionary */
char varmark[kMaxMarkerLength];           /* Mark of variant form in dictionary */
						/* Values from Input Text Control file */
char *wfc;                          /* Word formation characters */
int nocap = FALSE;                  /* No capitalization flag */
unsigned long num_words = 0L;       /* Number of words processed for monitor */
int num_join = 0;                   /* Number of words joined */
static char cBridge = '_';          /* -b (bridge character) */
static char cComment = '|';         /* -k (comment character) */
static char cHold = '\021';         /* -h (hold character) */

static FILE *dicfile = NULL;   /* Files from command line */
static FILE *intxfile = NULL;
static FILE *infile = NULL;
static FILE *outfile = NULL;

#ifdef CSTUDIODLL
/* -----------------------------------------------------
 *	copyMarker
 *  Description: will safely copy the SFM marker, and insert the
 *			backslash if its missing.  Will truncate if there
 *			isn't enough space.
 *  Parameters: iMaxLength is the total, including null terminator
 *  Created:	jdh July 7 1998
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
 *  Created: jdh July 7 1998
 *  Parameters: pszErrorStr should be big enough for
 *				the longest path plus a short message.
 *  Returns TRUE if successful, FALSE otherwise (with errorStr)
 *  Called by: DLL calls this before each execute
 */
BOOL setupProcess(char* lpszErrorStr,
		  BOOL bDoTrace,
		  BOOL bPartial,
		  BOOL bShowCompounds,
		  BOOL bDebug,
		  const char* lpszWordMarker,
		  const char* lpszAlloMarker,
		  const char* lpszVarMarker,
		  const char* lpszDictPath,
		  const char* lpszINTXPath,
		  const char* lpszInputFilePath,
		  const char* lpszOutFilePath,
		  const char* lpszLogFilePath)
{
  *lpszErrorStr = '\0';
  num_words = 0;
  num_join = 0;
  firstcomp = 0; /* I suspect this wasn't be initialize properly in the DOS version */
  do_monitor = TRUE; /* we'll need some other way of monitoring */
  do_trace = bDoTrace;
  do_debug = bDebug;
  partial = bPartial;
  show_compounds = bShowCompounds;

  copyMarker(kMaxMarkerLength, wordmark, lpszWordMarker);
  copyMarker(kMaxMarkerLength, allomark, lpszAlloMarker);
  copyMarker(kMaxMarkerLength, varmark, lpszVarMarker);

  intxfile = fopen( lpszINTXPath, "r" );  /* Open input file */
  if ( !intxfile )                    /* If not found */
	{
	  sprintf( lpszErrorStr,"Error: Input text control file %s not found\n",
		   lpszINTXPath );
	  return FALSE;
	}
#ifndef hab02o
  memcpy(intxfname, lpszINTXPath, FILENAME_MAX);
#endif /* hab02o */

  dicfile = fopen( lpszDictPath, "r" );  /* Open input file */
  if ( !dicfile )                    /* If not found */
	{
	  sprintf( lpszErrorStr, "Error: Dictionary file %s not found\n",
		   lpszDictPath );
	  return FALSE;
	}

  infile = fopen( lpszInputFilePath, "r" );  /* Open input file */
  if ( !infile )                    /* If not found */
	{
	  sprintf( lpszErrorStr, "Error: Input file %s not found\n",
		   lpszInputFilePath );
	  return FALSE;
	}

  outfile = fopen( lpszOutFilePath, "w" );    /* Open output file */
  if ( !outfile )
	{
	  sprintf( lpszErrorStr,
		   "Error: Couldn't open the 0utput file %s for writing\n",
		   lpszOutFilePath );
	  return FALSE;
	}

#ifndef hab02o
  logfile = fopen( lpszLogFilePath, "a" );    /* Open log file */
#else
  logfile = fopen( lpszLogFilePath, "w" );    /* Open output file */
#endif /* hab02o */
  if ( !outfile )
	{
	  sprintf( lpszErrorStr,
		   "Error: Couldn't open the LOG file %s for writing\n",
		   lpszLogFilePath );
	  return FALSE;
	}

  errlogfile = logfile;

  return TRUE;
}
#endif	/* end ifdef CSTUDIODLL */

/************************************************************************/
#ifdef SIMPLE_DLL
int WINAPI _export JoinComp(int argc, char **argv )
#else

#ifdef CSTUDIODLL
int runProcess()
#else
int main(int argc, char **argv )  /* Main prog of parser */
#endif
/************************************************************************/
{
#ifndef hab02o
StringClass *	   pStringClasses = NULL;	/* used by loadIntxCtlFile() */
#else
char *s;                    /* Temp string pointer */
#endif
				/* Variables for main search loop */
char *moresw;                 /* Switch for more input available */
int linelen;                /* Length of line */
char *flineend;             /* End of first line */
char *word;                 /* Start of next word */
char *matchend;             /* End of match or of next word */

#ifdef THINK_C
argc = ccommand(&argv);
#endif

#ifndef CSTUDIODLL
	logfile = stdout;
	errlogfile = stderr;
#endif

#ifndef XXJ
fputs(VERSION,errlogfile);              /* Print version message */
#ifdef __DATE__
fprintf(errlogfile, pszJoinCompCompileFormat_g,
	pszJoinCompCompileDate_g, pszJoinCompCompileTime_g);
#endif
#endif	/* jdh inserted */


#ifndef CSTUDIODLL
strcpy( wordmark, "\\r" );          /* Init wordmark */
strcpy( allomark, "\\a" );          /* Init allomark */
strcpy( varmark,  "\\a" );          /* Init allomark */

if ( parse_command(argc, argv) )    /* If command line process fails */
	{
	usage();                        /* Give usage message */
	return(1);                        /* Bad exit because no work done */
	}
#endif

#ifdef hab02o
firstcomp = loadcomps( dicfile );   /* Load in compounds */

fclose(dicfile);	/* / jdh added sept 21 1998 */

if ( do_debug )
	{
	dumpcomps( firstcomp );
	}
#endif /* hab02o */

#ifndef hab02o
#define WFC_SIZE 600
#else
#define WFC_SIZE 200
#endif /* hab02o */
#ifdef CSTUDIODLL
wfc = myalloc( WFC_SIZE );               /* Default wfc chars to alphabet */
#else
wfc = allocMemory( WFC_SIZE );           /* Default wfc chars to alphabet */
#endif /* CSTUDIODLL */

#ifndef hab02o
if (intxfile)
  {
	/* ================================================================
	 *  load text input control file
	 */
	if (loadIntxCtlFile(intxfname,
			cComment,
			&sTextControl_m,
			&pStringClasses) != 0)
	  {
	reportError(ERROR_MSG,
			"Error reading text control file %s\n", intxfname);
	exitSafely(1);
	  }
	if ((sTextControl_m.cBarMark == NUL) &&
	(sTextControl_m.pszBarCodes != NULL))
	  {
	/*
	 *  don't need to use up this memory needlessly...
	 */
	freeMemory(sTextControl_m.pszBarCodes);
	sTextControl_m.pszBarCodes = NULL;
	  }
	else if ((sTextControl_m.cBarMark != NUL) &&
		 (sTextControl_m.pszBarCodes == NULL))
	  {
	/*
	 *  default to the S.I.L. Manuscripter bar codes
	 */
	sTextControl_m.pszBarCodes = (unsigned char *)duplicateString(
							  "bdefhijmrsuvyz");
	  }
				/* set nocap flag used below */
	nocap = !sTextControl_m.bCapitalize;
				/* set wfc string used below */
	strcpy( wfc, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" );
	if (sTextControl_m.pCaselessLetters != NULL)
	  {
	CaselessLetter * pLet;
	for ( pLet = sTextControl_m.pCaselessLetters; pLet; pLet = pLet->pNext)
	  wfc = strcat(wfc, (char *)pLet->pszLetter);
	  }
	if (sTextControl_m.pLowercaseLetters != NULL)
	  {
	LowerLetter * pLow;
	for (pLow = sTextControl_m.pLowercaseLetters; pLow; pLow = pLow->pNext)
	  wfc = strcat(wfc, (char *)pLow->pszLower);
	  }
	if (sTextControl_m.pUppercaseLetters != NULL)
	  {
	UpperLetter * pUp;
	for ( pUp = sTextControl_m.pUppercaseLetters ; pUp ; pUp = pUp->pNext )
	  wfc = strcat(wfc, (char *)pUp->pszUpper);
	  }
	if (do_debug)
	  {
	if (logfile != NULL)
	  writeWordFormationChars(logfile, &sTextControl_m);
	if ( nocap )
	  fprintf(logfile, "Nocap set\n" );
	  }
  }
#else /* hab02o */
strcpy( wfc, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" );
nocap = FALSE;                      /* Default nocap to FALSE */

if ( intxfile )                     /* If an Input Text Control file */
	{
	while ( (moresw = getcline( line, MAXLINE, intxfile )) ) /* Get a line */
	{
	if ( !strncmp( "\\wfc ", line, 5 ) )    /* If \wfc line */
		{
		strcat( wfc, line + 5 );            /* Add new wfc's */
		while ( (moresw = getcline( line, MAXLINE, intxfile )) )
		{
		if ( *line == '\\' )            /* If start of next fld */
			break;                      /* Break */
		else
			strcat( wfc, line );        /* Else add to wfc */
		}
		while ( (s = strchr( wfc, ' ' )) )    /* Eat out spaces */
		strcpy( s, s + 1 );             /* From wfc */
		}
	if ( !moresw )                          /* If eof */
		break;                              /* Break */
	if ( !strncmp( "\\nocap", line, 6 ) )   /* If \nocap line */
		nocap = TRUE;
	}
	fclose(intxfile);	/* jdh added sept 21 1998 */
	}
if ( do_debug )
	{
	fprintf(logfile, "Wfc's: %s\n", wfc );
	if ( nocap )
	fprintf(logfile, "Nocap set\n" );
	}
#endif /* hab02o */

#ifndef hab02o  /* load dictionary *after* loading intx control file */
firstcomp = loadcomps( dicfile );   /* Load in compounds */

fclose(dicfile);	/* / jdh added sept 21 1998 */

if ( do_debug )
	{
	dumpcomps( firstcomp );
	}
#endif /* hab02o */

#ifndef hab02o  /* as of 22-Sep-1999, this is still the original way */
	/* The match algorithm is:
	 *   Read file field by field.
	 *   If the field is not to be included, output it.
	 *   If the field is to be included (i.e. is in the
	 *      list of include fields or is not in the list of exclude fields).
	 *     Create list of pointers to all nls in the field.
	 *     Convert all spaces and nls to cBridge character.
	 *     At each word until the end of the field is reached:
	 *        If there is no match, restore cBridge after word to space.
	 *        If there is a match, convert cBridge after word to space.
	 *        Move to the position after the word or the match.
	 *     Restore nls.
	 *     Write out the field
	 */

*line = '\0';                           /* Terminate line to cause load */
for ( moresw = line; moresw; )          /* Until end of file */
	{
	linelen = strlen( line );           /* Measure line */
	if ( !linelen )                     /* If no first line */
	{
	if ( !fgets( line, MAXLINE, infile ) )   /* Bring in first line */
		break;                      /* If none, break from loop */
	makeul( line );                 /* Change spaces to underlines */
	linelen = strlen( line );       /* Measure line */
	}

	flineend = line + (linelen - 1);     /* Remember first line end */
#ifndef hab02r
	if (*flineend == '\n')
	  *flineend = ' ';   /* Change its nl to space */
	else
	  {				/* eof found; try to add space at end */
	if (linelen < MAXLINE)
	  {
		linelen++;
		flineend++;
		*flineend = ' ';
	  }
	  }
#else
	*flineend = ' ';                     /* Change its nl to space */
#endif /* hab202r */				    /* Bring in line after end of first */

					/* Bring in line after end of first */
	moresw = fgets( flineend + 1, MAXLINE - linelen, infile );

	makeul( flineend );     /* Change spaces in new line to underlines */

		   /* For each word until nl position is reached or passed */
	matchend = NULL;
	for ( word = line; word && word < flineend; )
	{
	matchend = match( firstcomp, word ); /* See if match */

	num_words++;                        /* Count word */
	if ( matchend )                     /* If match */
		num_join++;                     /* Count it */

	if ( do_monitor )                   /* If monitoring */
		{
		if ( matchend )                 /* If match */
		putc ( '1', errlogfile );       /* Output 1 */
		else
		putc ( '.', errlogfile );       /* Else output dot */
		if ( num_words % 10 == 0 )
		putc( ' ', errlogfile );
		if ((num_words % 100) == 0)
		  fprintf(errlogfile, "  %lu\n", num_words);
		else if ((num_words % 50) == 0)
		  fputc('\n', errlogfile);
		else if ((num_words % 10) == 0)
		  fprintf(errlogfile, "  ");
		}
	if ( !matchend )                    /* If no match */
		matchend = strchr( word, cBridge ); /* Set to end of word */
	if ( matchend )                     /* If not single word */
		*matchend = ' ';                /* Change underline to space */
	word = matchend + 1;                /* Move after word or match */
	}

	if ( matchend > flineend )          /* If line end became underline */
	flineend = matchend;            /* Move line end forward */
	*flineend = '\0';                   /* Terminate first line. */
	unMarkBridge( line );	/* undo Bridge to HOLD conversion */
	fprintf( outfile, "%s\n", line );   /* Write out first line with nl */

	strcpy( line, flineend + 1 );       /* Move second line up to front */
	}
#else /* hab02o */
	/* The match algorithm is:
	* To start:
	*   Bring in a first line.
	*   Change all spaces in it to underlines.
	* Then the main cycle is:
	*   Remember where first line ends and change its nl to space.
	*   Bring in a second line after the end of the first.
	*   Change all spaces in new line to underlines.
	*   At each word until nl position is reached or passed:
	*       If no match, turn underline after word to space.
	*       If match, turn underline after match to space.
	*       Move to after word or match.
	*   Terminate first line.
	*   Write out first line.
	*   Write out nl.
	*   Move second line up to front of line space.
	* To end:
	*   If no new line comes in, set end switch.
	*   Do process through output of line.
	*   Terminate cycle.
	*/

*line = '\0';                           /* Terminate line to cause load */
for ( moresw = line; moresw; )          /* Until end of file */
	{
	linelen = strlen( line );           /* Measure line */
	if ( !linelen )                     /* If no first line */
	{
	if ( !fgets( line, MAXLINE, infile ) )   /* Bring in first line */
		break;                      /* If none, break from loop */
	makeul( line );                 /* Change spaces to underlines */
	linelen = strlen( line );       /* Measure line */
	}

	flineend = line + (linelen - 1);     /* Remember first line end */
	*flineend = ' ';                     /* Change its nl to space */

					/* Bring in line after end of first */
	moresw = fgets( flineend + 1, MAXLINE - linelen, infile );

	makeul( flineend );     /* Change spaces in new line to underlines */

		   /* For each word until nl position is reached or passed */
	matchend = NULL;
	for ( word = line; word && word < flineend; )
	{
	matchend = match( firstcomp, word ); /* See if match */

	num_words++;                        /* Count word */
	if ( matchend )                     /* If match */
		num_join++;                     /* Count it */

	if ( do_monitor )                   /* If monitoring */
		{
		if ( matchend )                 /* If match */
		putc ( '1', errlogfile );       /* Output 1 */
		else
		putc ( '.', errlogfile );       /* Else output dot */
		if ( num_words % 10 == 0 )
		putc( ' ', errlogfile );
		if ((num_words % 100) == 0)
		  fprintf(errlogfile, "  %lu\n", num_words);
		else if ((num_words % 50) == 0)
		  fputc('\n', errlogfile);
		else if ((num_words % 10) == 0)
		  fprintf(errlogfile, "  ");
		}
	if ( !matchend )                    /* If no match */
		matchend = strchr( word, cBridge ); /* Set to end of word */
	if ( matchend )                     /* If not single word */
		*matchend = ' ';                /* Change underline to space */
	word = matchend + 1;                /* Move after word or match */
	}

	if ( matchend > flineend )          /* If line end became underline */
	flineend = matchend;            /* Move line end forward */
	*flineend = '\0';                   /* Terminate first line. */
	unMarkBridge( line );	/* undo Bridge to HOLD conversion */
	fprintf( outfile, "%s\n", line );   /* Write out first line with nl */

	strcpy( line, flineend + 1 );       /* Move second line up to front */
	}
#endif /* hab02o */

if ( do_monitor )
	putc( '\n', errlogfile );

fprintf(logfile,  "    %lu words processed\n", num_words ); /* Give report */
fprintf(logfile,  "    %d compounds joined\n", num_join );

fclose (infile);		    /* jdh added sept 21 1998 */
fclose( outfile );                  /* Close output file */
#ifdef CSTUDIODLL
fclose( logfile );
#ifndef hab02p
myfree(wfc);
freecomps(firstcomp);
firstcomp = 0;
resetTextControl(&sTextControl_m);
#endif /* hab02p */
#endif /* CSTUDIODLL */
return 0;
}

/**********************************************************************
 * NAME
 *      match
 * ARGS
 *      comp - List of compounds to use for match.
 *      word - Word to try to match.
 * DESCR
 *      Try to match a word to a list of compound words.
 * RETRN
 *      If success, pointer to space after matched words.
 *      If failure, NULL.
 */
static char *match( Comp *comp, char *word )
{
Comp *tcomp;
char *s, *t;
int succ;
char tc;

				/* Move past any non-wfc at beginning */
while ( *word && *word != cBridge && !strchr( wfc, *word ) )
	word++;

succ = FALSE; /* Prevent compiler warnings */
s = t = NULL;

for ( tcomp = comp; tcomp; tcomp = tcomp->link ) /* For each comp */
	{
	succ = TRUE;
	for ( s = tcomp->word, t = word; *s; s++, t++ )
	{
#ifndef hab02o			/* NOTE: really need to compare proper */
				/* use of decapitalization */
	if (sTextControl_m.bCapitalize)
	  {
	  const unsigned char * cps, * cpt;
	  cpt = convUpperToLower( (unsigned char *)t, &sTextControl_m );
	  if (cpt == NULL)
		cpt = (unsigned char *)t;
	  if ( *(cps = (unsigned char *)s) != *cpt)	                /* If non-match */
		{
		succ = FALSE;                       /* Note fail and break */
		break;
		}
		  }
#else
	if ( tolower( *s ) != tolower( *t ) )   /* If non-match */
		{
		succ = FALSE;                       /* Note fail and break */
		break;
		}
#endif /* hab02o */
	if ( nocap                              /* If nocap */
		&& *s != *t )                   /* And not exact match */
		{
		succ = FALSE;                   /* Note fail and break */
		break;
		}
	}
	if ( succ )                                 /* If success */
	break;                                  /* Look no further */
	}

if ( succ )
	{                                           /* Find end of word */
	for ( ; *t != '\n' && *t != cBridge; t++ )
	if ( !partial && strchr( wfc, *t ) )    /* If wfc still in word */
		return( NULL );                     /* Fail match */

	if ( do_trace )                             /* If trace */
	{
	tc = *t;                                /* Save endwd char */
	*t = '\0';                              /* Terminate word */
	fprintf(logfile,  "%s\n", word );                 /* Print word */
	*t = tc;                                /* Restore char */
	}

	return( t );
	}
else
	return( NULL );
}

/**********************************************************************
 * NAME
 *      makeul
 * ARGS
 *      line - Line to work on.
 * DESCR
 *      Make every space in line into an underline.
 * RETRN
 *      None.
 */
static void makeul( char *line )
{
char *s;

markBridge( line );	/* change any existing Bridge chars to HOLD */
for ( s = strchr( line, ' ' ); s; s = strchr( s, ' ' ) )
	*s = cBridge;
}

/**********************************************************************
 * NAME
 *      markBridge
 * ARGS
 *      line - Line to work on.
 * DESCR
 *      Mark any pre-existing Bridge character with the Hold character.
 * RETRN
 *      None.
 */
static void markBridge( char *line )
{
char *cp;

cp = line;
while (*cp != '\0')
	{
	if (*cp == cBridge)
	  *cp = cHold;
	cp++;
	}
}

/**********************************************************************
 * NAME
 *      unMarkBridge
 * ARGS
 *      line - Line to work on.
 * DESCR
 *      Remove any Hold marks from pre-existing Bridge characters.
 * RETRN
 *      None.
 */
static void unMarkBridge( char *line )
{
char *cp;

cp = line;
while (*cp != '\0')
	{
	if (*cp == cHold)
	  *cp = cBridge;
	cp++;
	}
}

/**********************************************************************
 * NAME
 *      loadcomps
 * ARGS
 *      file - Dictionary file to read for compounds.
 * DESCR
 *      Load all lexical compounds from dictionary file.
 *          Compounds are recognized by underscore in them.
 * RETRN
 *      Comp structure with all compounds, NULL if none, or error.
 */
static Comp *loadcomps( FILE *file )
{
int marklen;            /* Length of word mark */
int amarklen;           /* Length of allo mark */
int vmarklen;           /* Length of variant mark */
char *s;                /* Temp string pointer */
char *wd;               /* Temp word start pointer */

strcat( wordmark, " " );                    /* Append a space to mark */
marklen = strlen( wordmark );               /* Find length of it */
strcat( allomark, " " );                    /* Append a space */
amarklen = strlen( allomark );              /* Find length of allo mark */
strcat( varmark, " " );                     /* Append a space */
vmarklen = strlen( varmark );               /* Find length of var mark */

if ( do_debug )
	fprintf(logfile,  "Marker is: \"%s\", length: %d\n", wordmark, marklen );

if ( do_debug )
	fprintf(logfile,  "\nLexical compounds from dictionary:\n" );

while ( getcline( line, MAXLINE, file ) ) /* While a line */
	{
	if ( !strncmp( wordmark, line, marklen )  /* If word line */
		|| !strncmp( allomark, line, amarklen )  /* Or allo line */
		|| !strncmp( varmark, line, vmarklen ) ) /* Or var line */
	{
	wd = strchr( line, ' ' );       /* Find space after marker */
	wd = skipwhite( wd );           /* Find start of word */
	if ( (s = strchr( wd, ' ' )) )    /* If space after word */
		*s = '\0';                  /* Cut it off */
	if ( strchr( wd, cBridge ) )        /* If wd has underln */
		loadcomp( wd );             /* Load it as a compound */
	}
	}

return( firstcomp );
}

/**********************************************************************
 * NAME
 *      getcline
 * ARGS
 *      Same as fgets.
 * DESCR
 *      Read a line and cut off comments and nl.
 * RETRN
 *      Line if success, NULL at EOF.
 *      Also, line is returned in first argument.
 */
static char *getcline( char *line, int maxline, FILE *file )
{
char *s;

if ( fgets( line, maxline, file ) )     /* If a line */
	{
#ifndef hab02o
	if ( (s = strchr( line, cComment )) )      /* If comment on end of line */
#else
	if ( (s = strchr( line, '|' )) )      /* If comment on end of line */
#endif /* hab02o */
	*s = '\0';                      /* Cut it off */
	else                                /* Else cut off nl */
	*( line + strlen( line ) - 1 ) = '\0';
	return( line );                     /* Return success */
	}
else                                    /* Else (EOF) */
	return( NULL );                     /* Return NULL */
}

/**********************************************************************
 * NAME
 *      loadcomp
 * ARGS
 *      word - Word to load as a compound.
 * DESCR
 *      Load word as a compound.
 * RETRN
 *      None.
 */
static void loadcomp( char *word )
{
Comp *ncomp;        /* New compound */
Comp *tcomp;        /* Temp compound */
unsigned wdlen;     /* Length of word */
int found;          /* Flag for place found on list */

#ifndef hab02o
if (sTextControl_m.bCapitalize)
  {				/* decapitalize dictionary form */
	char sBuf[MAXLINE];
	char sChar[2];
	unsigned char * s;
	memset(sBuf, 0, MAXLINE);
	for ( s = (unsigned char *)word; *s; s++)
	  {
	const unsigned char * cps;
	cps = convUpperToLower( (unsigned char *)s, &sTextControl_m );
	if (cps == NULL)
	  {
		sChar[0] = *s;
		sChar[1] = '\0';
		cps = (unsigned char *)sChar;
	  }
	strcat(sBuf, (char *)cps);
	  }
	word = sBuf;
  }
#endif /* hab02o */

if ( show_compounds )
	fprintf(logfile,  "%s%s\n", wordmark, word );

ncomp = newcomp();                      /* Make new compound */
#ifdef CSTUDIODLL
ncomp->word = mystrdup( word );         /* Copy word */
#else
ncomp->word = duplicateString( word );         /* Copy word */
#endif

wdlen = strlen( word );                 /* Get length of word */

	/* To sort longest first, just link new before the first of same
	*   length or shorter.
	*/
if ( !firstcomp )                       /* If first */
	{
	firstcomp = ncomp;                  /* Just point first to new */
	return;
	}

if ( strlen( firstcomp->word ) <= wdlen ) /* If longer than first */
	{
	ncomp->link = firstcomp;            /* Point new to old first */
	firstcomp = ncomp;                  /* Point first to new */
	return;
	}

found = FALSE;
for ( tcomp = firstcomp; tcomp->link;  /* For each comp */
	tcomp = tcomp->link )
	if ( strlen( tcomp->link->word ) <= wdlen )   /* If next len <= */
	{
	ncomp->link = tcomp->link;      /* Link new to next */
	tcomp->link = ncomp;            /* Link prev to new */
	found = TRUE;                   /* Note found */
	break;
	}
if ( !found )                               /* If none found */
	{
	tcomp->link = ncomp;                    /* Link at end of list */
	}
}

/**********************************************************************
 * NAME
 *      newcomp
 * ARGS
 *      None.
 * DESCR
 *      Make a new compound structure.
 * RETRN
 *      Empty Comp structure.
 */
static Comp *newcomp( void )
{
Comp *tcomp;

#ifdef CSTUDIODLL
tcomp = Structalloc( Comp );
#else
tcomp = allocMemory(sizeof(Comp));
#endif
tcomp->word = NULL;
tcomp->link = NULL;

return( tcomp );
}

/**********************************************************************
 * NAME
 *      dumpcomps
 * ARGS
 *      comp - First compound in list of compounds.
 * DESCR
 *      Dump all lexical compounds from a list.
 * RETRN
 *      None.
 */
static void dumpcomps( Comp *comp )
{
Comp *tcomp;    /* Temp comp */

fprintf(logfile,  "\nLexical compounds loaded:\n" );
for ( tcomp = firstcomp; tcomp; tcomp = tcomp->link )
	fprintf(logfile,  "%s\n", tcomp->word );
}

#ifdef hab02o
extern int getopt( int argc, char **argv, char *opts );
#endif
extern int optind;    /* declarations for using getopt */
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
*
*   -a Allo marker
*   -b Bridge character
*   -c Input text control file
*   -d Dictionary file
*   -h Hold character
*   -i Input file
*   -j Join marker
*   -m Monitor
*   -o Output file
*   -p Partial match of last word is all right
*   -s Show option
*   -t Trace
*   -u Do dictionary decapitalization of allomorphs
*   -v Variant allo marker
*   -z Debug
*/

#ifndef hab02o
while ((k = getopt(argc,argv,"a:b:c:d:h:i:j:kmo:pstv:z")) != EOF)
#else
while ((k = getopt(argc,argv,"a:b:c:d:h:i:j:mo:pstv:z")) != EOF)
#endif /* hab02o */
	{
	switch (k)
	{
	case 'a':                       /* allo marker */
		strcpy( allomark, "\\" );
		strcat( allomark, optarg );  /* copy marker */
		break;

		case 'b':	                /* bridge character */
		cBridge = optarg[0];
		break;

	case 'c':                       /* intx file name */
		intxfile = fopen( optarg, "r" );  /* Open input file */
		if ( !intxfile )                    /* If not found */
		{
		fprintf( errlogfile,
			"Error: Input text control file %s not found\n",
			optarg );
		errflag++;                        /* Bad exit */
		}
#ifndef hab02o
		memcpy(intxfname, optarg, FILENAME_MAX);
#endif /* hab02o */
		break;

	case 'd':                       /* dic file name */
		dicfile = fopen( optarg, "r" );  /* Open input file */
		if ( !dicfile )                    /* If not found */
		{
		fprintf( errlogfile,
			"Error: Dictionary file %s not found\n", optarg );
		errflag++;                        /* Bad exit */
		}
		break;

		case 'h':	                /* hold character */
		cHold = optarg[0];
		break;

	case 'i':                       /* input file name */
		infile = fopen( optarg, "r" );  /* Open input file */
		if ( !infile )                    /* If not found */
		{
		fprintf( errlogfile,
			"Error: Input file %s not found\n", optarg );
		errflag++;                        /* Bad exit */
		}
		break;

	case 'j':                       /* join marker */
		strcpy( wordmark, "\\" );
		strcat( wordmark, optarg );  /* copy marker */
		break;

#ifndef hab02o
		case 'k':	                /* comment character */
		cComment = optarg[0];
		break;
#endif /* hab02o */

	case 'm':                       /* monitor progress option */
		do_monitor = TRUE;
		break;

	case 'o':                       /* output file name */
		outfile = fopen( optarg, "w" );    /* Open output file */
		if ( !outfile )
		{
		fprintf( errlogfile,
			"Error: Can't open output file %s\n", optarg );
		errflag++;                /* Bad exit */
		}
		break;

	case 'p':                       /* Partial match is OK */
		partial = TRUE;
		break;

	case 's':                       /* show option */
		show_compounds = TRUE;
		break;

	case 't':                       /* trace option */
		do_trace = TRUE;
		break;

	case 'v':                       /* variant allo marker */
		strcpy( varmark, "\\" );
		strcat( varmark, optarg );  /* copy marker */
		break;

	case 'z':                       /* debugging option */
		++do_debug;                 /* debug level counter */
		break;

	default:                        /* unrecognized option */
		++errflag;
		break;
		}
	} /* end switch */

if ( !dicfile )        /* Require rule file */
	{
	fprintf( errlogfile, "Error: Dictionary file -d required\n" );
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
#ifndef hab02o
fprintf( errlogfile,
"\nUsage: joincomp -d dicfile -i infile -o outfile [-c ctrlfile][options]\n" );
fprintf(errlogfile,"\
-a mark     dictionary marker to look for for joined allos\n\
-b char     bridge character (default is underscore)\n\
-c file     optional input text control file for word formation chars\n\
-d file     dictionary file with compounds joined by underline\n\
-h char     hold character (default is CTRL-Q)\n\
-i file     infile is a text file\n\
-j mark     dictionary marker to look for for joined words\n\
-k char     select the record Comment character (default is '|')\n\
-m          monitor progress\n\
-o file     outfile is text file with compounds joined for AMPLE\n\
-p          partial match on last word is all right\n\
-s          show compounds found in dictionary\n\
-t          trace joined words\n\
-v mark     dictionary marker to look for for joined variant forms\n\
report output can be redirected by > outfile\n" );
#else /* hab02o */
fprintf( errlogfile,
"\nUsage: joincomp -d dicfile -i infile -o outfile [-c ctrlfile][options]\n" );
fprintf(errlogfile,"\
-b char     bridge character (default is underscore)\n\
-d file     dictionary file with compounds joined by underline\n\
-h char     hold character (default is CTRL-Q)\n\
-i file     infile is a text file\n\
-o file     outfile is text file with compounds joined for AMPLE\n\
-c file     optional input text control file for word formation chars\n\
-j mark     dictionary marker to look for for joined words\n\
-a mark     dictionary marker to look for for joined allos\n\
-v mark     dictionary marker to look for for joined variant forms\n\
-p          partial match on last word is all right\n\
-s          show compounds found in dictionary\n\
-m          monitor progress\n\
-t          trace joined words\n\
report output can be redirected by > outfile\n" );
#endif  /* hab02o */
}

/**************************************************************
 * NAME
 *      skipwhite
 * ARGS
 *      s - string to look at
 * DESC
 *      Skip all spaces and tabs at s.
 * RETN
 *      Pointer to next char after white space.
 */
static char *skipwhite( char *s )
{

while ( *s == ' ' || *s == '\t' || *s == '\n' )
	s++;
return( s );
#endif
}

#ifndef hab02p
#ifdef CSTUDIODLL
/**************************************************************
 * NAME
 *      freecomps
 * ARGS
 *      comp - pointer to first element in list to free
 * DESC
 *      Free list of compounds
 * RETN
 *      none
 */
static void freecomps(Comp *pComp )
{
Comp *pTemp;			/* Temp comp */
Comp *pNext;			/* next comp in list */

for ( pTemp = pNext = pComp; pNext; pTemp = pNext )
  {
	if (pTemp->word)
	  myfree(pTemp->word);
	pNext = pTemp->link;
	myfree(pTemp);
  }
}
#endif /* CSTUDIODLL */
#endif /* hab02p */
