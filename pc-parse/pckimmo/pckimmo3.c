/* PCKIMMO3.C - functions to support user interface for PC-KIMMO
 ******************************************************************************
 *
 * void compare_gener(FILE *cmpfp);
 * void compare_recog(FILE *cmpfp);
 * void compare_synth(FILE *synfp);
 * void compare_pairs(FILE *cmpfp, char *filename);
 * void show_status()
 * void do_generate(char *form);
 * void do_clear()
 * void do_recognize(unsigned char *form);
 * void do_synthesize(unsigned char *form);
 * void do_save(char *filename)
 * void show_lexicon(unsigned char *lexname);
 *
 ******************************************************************************
 * Copyright 1988, 1999 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strcat  P((char * dest, const char * src));
extern int    strcmp  P((const char * s1, const char * s2));
extern size_t strspn  P((const char * s, const char * accept));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "kimmo.h"
#include "pckimmo.h"

#ifdef vms
#include <rms.h>
#include <ssdef.h>
#include <descrip.h>
#include <dvidef.h>
#include <dcdef.h>
#include <iodef.h>
#include <jpidef.h>
#include <syidef.h>
#include <uaidef.h>
#endif

/* same chars as isspace() */
static unsigned char szWhitespace_m[7] = " \t\n\v\f\r";

char	generator_prompt[12]   = "generator>>";
char	recognizer_prompt[13]  = "recognizer>>";
char	synthesizer_prompt[14] = "synthesizer>>";
char	szNoResults_m[15]      = "*** NONE ***\n\n";
/*
 *  error messages
 */
static NumberedMessage sMissingComparisonSurface_m	= { WARNING_MSG, 400,
	"Surface form not found in pairs comparison file"};
static NumberedMessage sNeedGrammar_m		= { ERROR_MSG,   541,
	"Cannot parse forms without a grammar" };
static NumberedMessage sNeedLexiconToRecognize_m    	= { ERROR_MSG,   804,
	"Cannot recognize forms without a lexicon" };
static NumberedMessage sNeedRulesToGenerate_m        = { ERROR_MSG,   805,
	"Cannot generate forms without rules" };
static NumberedMessage sNeedRulesToRecognize_m	= { ERROR_MSG,   806,
	"Cannot recognize forms without rules" };
static NumberedMessage sNeedLexiconToSynthesize_m	= { ERROR_MSG,   807,
	"Cannot synthesize forms without a synthesis lexicon" };
static NumberedMessage sNeedRulesToSynthesize_m	= { ERROR_MSG,   808,
	"Cannot synthesize forms without rules" };

static char *	on_or_off P((int bFlag_in));

#ifdef applec
#pragma segment S_pckimmo3
#endif

/*****************************************************************************
 * NAME
 *    on_or_off
 * DESCRIPTION
 *    test whether a Boolean variable has been set on or off
 * RETURN VALUE
 *    "ON" if set, otherwise "OFF"
 */
static char * on_or_off(bFlag_in)
int	bFlag_in;
{
return (bFlag_in) ? "ON" : "OFF";
}

/*****************************************************************************
 * NAME
 *    isReadyToGenerate
 * DESCRIPTION
 *    check whether the appropriate data has been loaded for applying the
 *    generator function, displaying error messages as needed
 * RETURN VALUE
 *    TRUE if ready to generate, FALSE if more data is needed
 */
static int isReadyToGenerate()
{
if (sKimmoData_g.ppszAlphabet == (unsigned char **)NULL)
	{
	if (!sKimmoData_g.bSilent)
	displayNumberedMessage(&sNeedRulesToGenerate_m,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
return TRUE;
}

/*****************************************************************************
 * NAME
 *    isReadyToRecognize
 * DESCRIPTION
 *    check whether the appropriate data has been loaded for applying the
 *    recognizer function, displaying error messages as needed
 * RETURN VALUE
 *    TRUE if ready to recognize, FALSE if more data is needed
 */
static int isReadyToRecognize()
{
if (sKimmoData_g.ppszAlphabet == NULL)
	{
	if (!sKimmoData_g.bSilent)
	displayNumberedMessage(&sNeedRulesToRecognize_m,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
if (sKimmoData_g.pInitialLexicon == NULL)
	{
	if (!sKimmoData_g.bSilent)
	displayNumberedMessage(&sNeedLexiconToRecognize_m,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
if (sKimmoData_g.bUsePATR && (sKimmoData_g.sPATR.pGrammar == NULL))
	{
	if (!sKimmoData_g.bSilent)
	displayNumberedMessage(&sNeedGrammar_m,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
return TRUE;
}

/*****************************************************************************
 * NAME
 *    isReadyToSynthesize
 * DESCRIPTION
 *    check whether the appropriate data has been loaded for applying the
 *    synthesizer function, displaying error messages as needed
 * RETURN VALUE
 *    TRUE if ready to synthesize, FALSE if more data is needed
 */
static int isReadyToSynthesize()
{
if (sKimmoData_g.ppszAlphabet == NULL)
	{
	if (!sKimmoData_g.bSilent)
	displayNumberedMessage(&sNeedRulesToSynthesize_m,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
if (sKimmoData_g.pInitialLexicon == NULL)
	{
	if (!sKimmoData_g.bSilent)
	displayNumberedMessage(&sNeedLexiconToSynthesize_m,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   NULL, 0);
	return FALSE;
	}
return TRUE;
}

/****************************************************************************
 * NAME
 *    print_result
 * ARGUMENTS
 *    nodep   - pointer to result node
 *    str     - pointer to comment string
 *    linenr  - file line number
 *    outfp   - output FILE pointer
 * DESCRIPTION
 *    Print one line of the comparison result to the specified file.
 * RETURN VALUE
 *    none
 */
static void print_result( nodep, str, linenr, outfp)
KimmoResult *nodep;
char *str;
int linenr;
FILE *outfp;
{
size_t k;

if (nodep == NULL)
	{
	if (str == NULL)
	{			/* blank line with only the line number */
	fprintf(outfp, "\n%3d.", linenr );
	}
	else			/* just the comment string (form?) */
	fprintf(outfp, "\n%3d. %s", linenr, str );
	}
else
	{
	fprintf( outfp, "\n%3d.", linenr);
	k = 0;
	if (nodep->pszResult && *nodep->pszResult)
	{
	fprintf( outfp, "   %s", nodep->pszResult);
	k += strlen((char *)nodep->pszResult) + 3;
	}
	if (nodep->pszGloss && *nodep->pszGloss)
	{
	fprintf( outfp, "   %s", nodep->pszGloss);
	k += strlen((char *)nodep->pszGloss) + 3;
	}
	if (str && *str)
	{
	while (k++ < 40)
		putc( ' ', outfp );
	fprintf( outfp, " %s", str);
	}
	}
}

/****************************************************************************
 * NAME
 *    put_res
 * ARGUMENTS
 *    nodep   - pointer to result node
 *    str     - pointer to comment string
 *    linenr  - file line number
 * DESCRIPTION
 *    Print one line of the comparison result, to both the screen and the
 *    log file (if any).
 * RETURN VALUE
 *    none
 */
static void put_res( nodep, str, linenr)
KimmoResult *nodep;
char *str;
int linenr;
{
if (sKimmoData_g.pLogFP != NULL)
	print_result( nodep, str, linenr, sKimmoData_g.pLogFP );
print_result( nodep, str, linenr, stderr );
}

/****************************************************************************
 * NAME
 *    check_this
 * ARGUMENTS
 *    thisp - pointer to current result
 *    listp - pointer to list of computed results
 * DESCRIPTION
 *    Check the result pointed to by thisp against the list of results
 *    pointed to by listp.
 * RETURN VALUE
 *    none
 */
static void check_this( thisp, listp )
KimmoResult *thisp;
KimmoResult *listp;
{
KimmoResult *rnp;
unsigned char *this_str, *this_feat;
unsigned char *res_str, *res_feat;

if (thisp == NULL)
	return;
this_str  = (thisp->pszResult != (unsigned char *)NULL) ?
			thisp->pszResult  : (unsigned char *)"";
this_feat = (thisp->pszGloss != (unsigned char *)NULL) ?
			thisp->pszGloss : (unsigned char *)"";

for ( rnp = listp ; rnp != NULL ; rnp = rnp->pNext )
	{
	res_str  = (rnp->pszResult != (unsigned char *)NULL) ?
			rnp->pszResult  : (unsigned char *)"";
	res_feat = (rnp->pszGloss != (unsigned char *)NULL) ?
			rnp->pszGloss : (unsigned char *)"";
	/*
	 *  compare result strings
	 */
	if (strcmp((char *)this_str,(char *)res_str) != 0)
	continue;			/* strings don't match */
	/*
	 *  compare features
	 */
	if (strcmp((char *)this_feat,(char *)res_feat) != 0)
	continue;			/* features don't match */
	/*
	 *  at this point, we have a good match
	 */
	thisp->bOkay = TRUE;		/* we have a match, so mark these */
	rnp->bOkay = TRUE;			/*   results as valid */
	return;				/* no need to look further */
	}
}

/****************************************************************************
 * NAME
 *    read_results
 * ARGUMENTS
 *    cmpfp    - input FILE pointer for comparison file
 *    lnump    - pointer to input file line number counter
 * DESCRIPTION
 *    Read a list of results from a file.
 * RETURN VALUE
 *    pointer to a linked list of KimmoResults, or NULL if none
 */
static KimmoResult *read_results( cmpfp, lnump)
FILE *cmpfp;
unsigned *lnump;
{
unsigned char *buf;
unsigned char *p;
unsigned char *pe;
KimmoResult *rnp;
KimmoResult *filresp;	/* list of results read from the file */
KimmoResult *lastp;
/*
 *  read the result line from the comparison file, one line at a time
 */
filresp = NULL;
lastp   = NULL;
while ((buf = (unsigned char *)readLineFromFile(cmpfp, lnump,
						   sKimmoData_g.cComment)) != NULL)
	{
	/*
	 *  1. move past leading spaces
	 *  2. truncate trailing spaces
	 *  3. quit if blank line (marks end of this word's data)
	 */
	for ( p = buf ; *p && isascii(*p) && isspace(*p) ; ++p )
	;
	for (   pe = p + strlen((char *)p) - 1 ;
		(pe >= p) && isascii(*pe) && isspace(*pe) ;
		*pe-- = NUL )
	;
	if ( *p == NUL )
	break;
	/*
	 *  add this result to the list of results from the file
	 */
	rnp = (KimmoResult *)allocMemory(sizeof(KimmoResult));
	for ( pe = p ; *pe && !(isascii(*pe) && isspace(*pe)) ; ++pe )
	;
	if (*pe == NUL)
	{					 /* save the result string */
	rnp->pszResult = (unsigned char *)duplicateString((char *)p);
	rnp->pszGloss = (unsigned char *)NULL;	/* no feature string */
	}
	else
	{
	*pe++ = NUL;				/* save the result string */
	rnp->pszResult = (unsigned char *)duplicateString((char *)p);
	for (p=pe ; *p && isascii(*p) && isspace(*p) ; ++p)
		;				/* skip whitespace until feature */
					/* save the feature string */
	rnp->pszGloss = (unsigned char *)duplicateString((char *)p);
	}
	if (filresp == NULL)
	filresp = rnp;			/* first node in the list */
	else
	lastp->pNext = rnp;		/* add to the end of the list */
	lastp = rnp;
	lastp->bOkay = FALSE;
	lastp->pNext = NULL;
	}
return( filresp );
}

/****************************************************************************
 * NAME
 *    compare_gener
 * ARGUMENTS
 *    cmpfp - input comparison FILE pointer
 * DESCRIPTION
 *    Execute a FILE COMPARE GENERATE <filename> command.
 * RETURN VALUE
 *    none
 */
void compare_gener(cmpfp)
FILE *cmpfp;
{
unsigned linenum;
int formline, mismatch;
unsigned char *p, *form;
KimmoResult *resp;
KimmoResult *filresp, *rnp;
KimmoResult no_result;
unsigned uiDotsCount = 0;

if (!isReadyToGenerate())
	return;
linenum = 1;
if (bTiming_g)
	startCmdTiming();
while ((p = (unsigned char *)readLineFromFile(cmpfp, &linenum,
						  sKimmoData_g.cComment)) != NULL)
	{
	p += strspn((char *)p, (char *)szWhitespace_m);
	if (*p != NUL)
	trimTrailingWhitespace((char *)p);
	if (*p != NUL)
	{
	/*
	 *  compute the results for the form read from the file
	 *  all the computed results are set to "not okay" to begin with
	 */
	form = (unsigned char *)duplicateString( (char *)tokenizeString(p,
								  szWhitespace_m));
	formline = linenum - 1;
	resp = applyKimmoGenerator(form, &sKimmoData_g);
	/*
	 *  read the prepared results for comparison
	 *  for each result from the file, scan the computed result list for a
	 *    match
	 */
	filresp = read_results(cmpfp, &linenum);
	for ( rnp = filresp ; rnp != NULL ; rnp = rnp->pNext )
		check_this( rnp, resp );
	/*
	 *  check for errors in the analysis
	 */
	mismatch = 0;
	for ( rnp = filresp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == FALSE)
		++mismatch;
		}
	for ( rnp = resp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == FALSE)
		++mismatch;
		}
	/*
	 *  list the results, verbosely if needed
	 */
	if (bVerbose_g || mismatch || (resp == NULL))
		{
		/*
		 *  print the form read from the file
		 */
		put_res( NULL, (char *)form, formline++ );
		/*
		 *  print the results from the file
		 */
		for ( rnp = filresp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == TRUE)
			put_res( rnp, ":OK", formline++ );
		else
			put_res( rnp, ":Not in result list", formline++ );
		}
		/*
		 *  print any computed results which weren't in the file
		 */
		for ( rnp = resp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == FALSE)
			put_res( rnp, ":In result list but not in file", formline);
		}
		/*
		 *  if no results, say so.
		 */
		if (resp == NULL)
		{
		no_result.pszResult  = (unsigned char *)"*** NONE ***";
		no_result.pszGloss = (unsigned char *)"";
		put_res( &no_result, NULL, formline);
		}
		/*
		 *  print a blank line (only the line number showing)
		 */
		put_res( NULL, NULL, formline);
		}
	else
		{
		if (!sKimmoData_g.bSilent)
		uiDotsCount = showAmbiguousProgress(1, uiDotsCount);
		}
	/*
	 *  release memory used for this comparison
	 */
	freeKimmoResult( resp, &sKimmoData_g );
	freeKimmoResult( filresp, &sKimmoData_g );
	freeMemory((char *)form);
	}
	}
if (bTiming_g)
	stopCmdTiming();
putc('\n',stderr);
}

/****************************************************************************
 * NAME
 *    compare_recog
 * ARGUMENTS
 *    cmpfp - input comparison FILE pointer
 * DESCRIPTION
 *    Execute a FILE COMPARE RECOGNIZE <filename> command.
 * RETURN VALUE
 *    none
 */
void compare_recog(cmpfp)
FILE *cmpfp;
{
unsigned linenum;
int formline, mismatch;
unsigned char *p, *form;
KimmoResult *resp;
KimmoResult *filresp, *rnp;
KimmoResult no_result;
unsigned uiDotsCount = 0;

if (!isReadyToRecognize())
	return;
linenum = 1;
if (bTiming_g)
	startCmdTiming();
while ((p = (unsigned char *)readLineFromFile(cmpfp, &linenum,
						  sKimmoData_g.cComment)) != NULL)
	{
	p += strspn((char *)p, (char *)szWhitespace_m);
	if (*p != NUL)
	trimTrailingWhitespace((char *)p);
	if (*p != NUL)
	{
	/*
	 *  compute the results for the form read from the file
	 *  all the computed results are set to "not okay" to begin with
	 */
	formline = linenum - 1;
	form = (unsigned char *)duplicateString( (char *)tokenizeString(p,
								  szWhitespace_m));

	resp = applyKimmoRecognizer(form, &sKimmoData_g);
	/*
	 *  read the prepared results for comparison
	 *  for each result from the file, scan the computed result list for a
	 *    match
	 */
	filresp = read_results(cmpfp, &linenum);
	for ( rnp = filresp ; rnp != NULL ; rnp = rnp->pNext )
		{
		rnp->bOkay = FALSE;
		check_this( rnp, resp );
		}
	/*
	 *  check for errors in the analysis
	 */
	mismatch = 0;
	for ( rnp = filresp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == FALSE)
		++mismatch;
		}
	for ( rnp = resp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == FALSE)
		++mismatch;
		}
	/*
	 *  list the results, verbosely if needed
	 */
	if (bVerbose_g || mismatch || (resp == NULL))
		{
		/*
		 *  print the form read from the file
		 */
		put_res( NULL, (char *)form, formline++ );
		/*
		 *  print the results from the file
		 */
		for ( rnp = filresp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == TRUE)
			put_res( rnp, ":OK", formline++ );
		else
			put_res( rnp, ":Not in result list", formline++ );
		}
		/*
		 *  print any computed results which weren't in the file
		 */
		for ( rnp = resp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == FALSE)
			put_res( rnp, ":In result list but not in file", formline);
		}
		/*
		 *  if no results, say so.
		 */
		if (resp == NULL)
		{
		no_result.pszResult  = (unsigned char *)"*** NONE ***";
		no_result.pszGloss = (unsigned char *)"";
		put_res( &no_result, NULL, formline);
		}
		/*
		 *  print a blank line (only the line number showing)
		 */
		put_res( NULL, NULL, formline);
		}
	else
		{
		if (!sKimmoData_g.bSilent)
		uiDotsCount = showAmbiguousProgress(1, uiDotsCount);
		}
	/*
	 *  release memory used for this comparison
	 */
	freeKimmoResult( resp, &sKimmoData_g);
	freeKimmoResult( filresp, &sKimmoData_g );
	freeMemory((char *)form);
	}
	}
if (bTiming_g)
	stopCmdTiming();
putc('\n',stderr);
}

/****************************************************************************
 * NAME
 *    compare_synth
 * ARGUMENTS
 *    synfp - input comparison FILE pointer
 * DESCRIPTION
 *    Execute a FILE COMPARE SYNTHESIZE <filename> command.
 * RETURN VALUE
 *    none
 */
void compare_synth(synfp)
FILE *synfp;
{
unsigned linenum;
int formline, mismatch;
unsigned char *p, *form;
KimmoResult *resp;
KimmoResult *filresp, *rnp;
KimmoResult no_result;
unsigned uiDotsCount = 0;

if (!isReadyToSynthesize())
	return;
/*
 *  copy the operational control information
 */
sSynthesisData_g.bLimit        = sKimmoData_g.bLimit;
sSynthesisData_g.iTraceLevel   = sKimmoData_g.iTraceLevel;
sSynthesisData_g.bUsePATR      = sKimmoData_g.bUsePATR;
sSynthesisData_g.bSilent       = sKimmoData_g.bSilent;
sSynthesisData_g.bShowWarnings = sKimmoData_g.bShowWarnings;
sSynthesisData_g.cGlossBegin   = sKimmoData_g.cGlossBegin;
sSynthesisData_g.cGlossEnd     = sKimmoData_g.cGlossEnd;
sSynthesisData_g.cComment      = sKimmoData_g.cComment;
sSynthesisData_g.pLogFP        = sKimmoData_g.pLogFP;
sSynthesisData_g.sPATR.pMem    = sKimmoData_g.sPATR.pMem;

linenum = 1;
if (bTiming_g)
	startCmdTiming();
while ((p = (unsigned char *)readLineFromFile(synfp, &linenum,
						  sKimmoData_g.cComment)) != NULL)
	{
	p += strspn((char *)p, (char *)szWhitespace_m);
	if (*p != NUL)
	trimTrailingWhitespace((char *)p);
	if (*p != NUL)
	{
	/*
	 *  compute the results for the form read from the file
	 *  all the computed results are set to "not okay" to begin with
	 */
	form = (unsigned char *)duplicateString( (char *)p );
	formline = linenum - 1;
	resp = applyKimmoSynthesizer(form, &sSynthesisData_g);
	/*
	 *  read the prepared results for comparison
	 *  for each result from the file, scan the computed result list for a
	 *    match
	 */
	filresp = read_results(synfp, &linenum);
	for ( rnp = filresp ; rnp != NULL ; rnp = rnp->pNext )
		check_this( rnp, resp );
	/*
	 *  check for errors in the analysis
	 */
	mismatch = 0;
	for ( rnp = filresp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == FALSE)
		++mismatch;
		}
	for ( rnp = resp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == FALSE)
		++mismatch;
		}
	/*
	 *  list the results, verbosely if needed
	 */
	if (bVerbose_g || mismatch || (resp == NULL))
		{
		/*
		 *  print the form read from the file
		 */
		put_res( NULL, (char *)form, formline++ );
		/*
		 *  print the results from the file
		 */
		for ( rnp = filresp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == TRUE)
			put_res( rnp, ":OK", formline++ );
		else
			put_res( rnp, ":Not in result list", formline++ );
		}
		/*
		 *  print any computed results which weren't in the file
		 */
		for ( rnp = resp ; rnp != NULL ; rnp = rnp->pNext )
		{
		if (rnp->bOkay == FALSE)
			put_res( rnp, ":In result list but not in file", formline);
		}
		/*
		 *  if no results, say so.
		 */
		if (resp == NULL)
		{
		no_result.pszResult  = (unsigned char *)"*** NONE ***";
		no_result.pszGloss = (unsigned char *)"";
		put_res( &no_result, NULL, formline);
		}
		/*
		 *  print a blank line (only the line number showing)
		 */
		put_res( NULL, NULL, formline);
		}
	else
		{
		if (!sKimmoData_g.bSilent)
		uiDotsCount = showAmbiguousProgress(1, uiDotsCount);
		}
	/*
	 *  release memory used for this comparison
	 */
	freeKimmoResult( resp, &sSynthesisData_g );
	freeKimmoResult( filresp, &sSynthesisData_g );
	freeMemory((char *)form);
	}
	}
if (bTiming_g)
	stopCmdTiming();
putc('\n',stderr);
}

/*****************************************************************************
 * NAME
 *    chk_res
 * ARGUMENTS
 *    resp - pointer to a list of result strings
 *    form - pointer to a single result string
 * DESCRIPTION
 *    count how many times the form occurs in the result list
 * RETURN VALUE
 *    the computed count
 */
static int chk_res( resp, form )
KimmoResult *resp;
unsigned char *form;
{
int count;

for ( count = 0 ; resp != NULL ; resp = resp->pNext )
	{
	if (strcmp((char *)resp->pszResult, (char *)form) == 0)
	++count;
	}
return( count );
}

/****************************************************************************
 * NAME
 *    compare_pairs
 * ARGUMENTS
 *    cmpfp    - input comparison FILE pointer
 *    filename - input comparison file name (for error messages)
 * DESCRIPTION
 *    Execute a FILE COMPARE PAIRS <filename> command.
 * RETURN VALUE
 *    none
 */
void compare_pairs(cmpfp,filename)
FILE *cmpfp;
char *filename;
{
register unsigned char *p;
int surf_cnt, surf_errs, surf_ok;
int lex_cnt, lex_errs, lex_ok;
int num;
unsigned linenum;
int num_forms, formline;
int uiDotsCount = 0;
int had_error;
KimmoResult lex_form, surf_form, *rp;
KimmoResult *lex_resp;
KimmoResult *surf_resp;

char ambigbuf[MAXLINELEN];

if (!isReadyToGenerate())
	return;
if (!isReadyToRecognize())
	return;
surf_errs = 0;	surf_ok = 0;
lex_errs = 0;	lex_ok = 0;
num_forms = 0;
linenum = 1;
had_error = FALSE;

if (bTiming_g)
	startCmdTiming();
while ((p = (unsigned char *)readLineFromFile(cmpfp, &linenum,
						  sKimmoData_g.cComment)) != NULL)
	{
	p = tokenizeString(p, szWhitespace_m);
	if (p != (unsigned char *)NULL)
	{
	lex_form.pszResult = (unsigned char *)duplicateString((char *)p);
	lex_form.pszGloss = (unsigned char *)NULL;
	lex_form.pNext = NULL;
	formline = linenum - 1;
	p = (unsigned char *)readLineFromFile(cmpfp, &linenum,
						  sKimmoData_g.cComment);
	if (p == (unsigned char *)NULL)
		{
		--linenum;
		displayNumberedMessage(&sMissingComparisonSurface_m,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   filename, linenum);
		break;			/* exit loop since EOF */
		}
	p = tokenizeString(p, szWhitespace_m);
	if (p == (unsigned char *)NULL)
		{
		--linenum;
		displayNumberedMessage(&sMissingComparisonSurface_m,
				   sKimmoData_g.bSilent,
				   sKimmoData_g.bShowWarnings,
				   sKimmoData_g.pLogFP,
				   filename, linenum);
		continue;
		}
	surf_form.pszResult = (unsigned char *)duplicateString((char *)p);
	surf_form.pszGloss = (unsigned char *)NULL;
	surf_form.pNext = NULL;
	/*
	 *  at this point, we have a lex/surf pair
	 */
	surf_resp = applyKimmoGenerator( lex_form.pszResult,  &sKimmoData_g);
	lex_resp  = applyKimmoRecognizer(surf_form.pszResult, &sKimmoData_g);
	/*
	 *  keep track for summary
	 */
	++num_forms;
	surf_cnt = chk_res( surf_resp, surf_form.pszResult );
	lex_cnt = chk_res( lex_resp,  lex_form.pszResult );

	if (surf_cnt == 0)
		++surf_errs;
	else
		++surf_ok;
	if (lex_cnt == 0)
		++lex_errs;
	else
		++lex_ok;
	/*
	 *  report verbose results, if requested or required
	 */
	if ( bVerbose_g || (lex_cnt==0 ) || (surf_cnt==0) )
		{
		/*
		 *  display the lexical form read from the file
		 */
		if (lex_cnt == 0)
		put_res( &lex_form, ":Not recognized from surface form",
						formline++ );
		else if ((lex_cnt == 1) && (lex_resp->pNext == NULL))
		put_res( &lex_form, ":OK", formline++ );
		else
		{
		num = 0;
		for ( rp = lex_resp ; rp != NULL ; rp = rp->pNext )
			++num;
		sprintf(ambigbuf,
			":OK (matches %d of %d recognized)",
			lex_cnt, num);
		put_res( &lex_form, ambigbuf, formline++ );
		}
		/*
		 *  display the surface form read from the file
		 */
		if (surf_cnt == 0)
		put_res( &surf_form, ":Not generated from lexical form",
						formline++ );
		else if ((surf_cnt == 1) && (surf_resp->pNext == NULL))
		put_res( &surf_form, ":OK", formline++ );
		else
		{
		num = 0;
		for ( rp = surf_resp ; rp != NULL ; rp = rp->pNext )
			++num;
		sprintf(ambigbuf,
			":OK (matches %d of %d generated)",
			surf_cnt, num);
		put_res( &surf_form, ambigbuf, formline++ );
		}
		}
	else
		{
		if (!sKimmoData_g.bSilent)
		uiDotsCount = showAmbiguousProgress(1, uiDotsCount);
		}
	had_error = !(surf_cnt && lex_cnt);
	/*
	 *  release memory used for this comparison
	 */
	freeKimmoResult( surf_resp, &sKimmoData_g );
	freeKimmoResult( lex_resp, &sKimmoData_g );
	}
	else
	{
	if (bVerbose_g || had_error)
		put_res( NULL, NULL, linenum-1 );
	}
	}
if (bTiming_g)
	stopCmdTiming();

if (sKimmoData_g.pLogFP != NULL)
	{
	fprintf(sKimmoData_g.pLogFP, "\nSummary of results for %d forms:",
		num_forms);
	fprintf(sKimmoData_g.pLogFP, "\n   Recognizer: %3d errors  %3d ok",
		lex_errs, lex_ok);
	fprintf(sKimmoData_g.pLogFP, "\n   Generator:  %3d errors  %3d ok",
		surf_errs, surf_ok);
	}
fprintf(stderr, "\nSummary of results for %d forms:\n", num_forms);
fprintf(stderr, "   Recognizer: %3d errors  %3d ok\n", lex_errs, lex_ok);
fprintf(stderr, "   Generator:  %3d errors  %3d ok\n", surf_errs, surf_ok);
}

/*****************************************************************************
 * NAME
 *    show_status
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Execute a SHOW STATUS command.
 * RETURN VALUE
 *    none
 */
void show_status()
{
char *p;
int i, num, len;

fprintf(stderr, "Status of PC-KIMMO:\n");
fprintf(stderr, "    Rules file:             %s\n",
	sKimmoData_g.pszRulesFile ? sKimmoData_g.pszRulesFile : "(none)");
fprintf(stderr, "    Lexicon file:           %s\n",
	sKimmoData_g.pszLexiconFile ? sKimmoData_g.pszLexiconFile : "(none)");
fprintf(stderr, "    Synthesis lexicon file: %s\n",
	sSynthesisData_g.pszLexiconFile ?
				   sSynthesisData_g.pszLexiconFile : "(none)");
fprintf(stderr, "    Grammar file:           %s\n",
	sKimmoData_g.sPATR.pGrammar ?
			   sKimmoData_g.sPATR.pszGrammarFile : "(none)");
fprintf(stderr, "    Log file:               %s\n",
	pszCmdLogFile_g ? pszCmdLogFile_g : "(none)" );
fprintf(stderr, "    Comment character is %c\n", sKimmoData_g.cComment );
fprintf(stderr, "    Warning display is %s\n",
	on_or_off(sKimmoData_g.bShowWarnings) );
fprintf(stderr, "    Tracing level is %d\n",
	sKimmoData_g.iTraceLevel );
fprintf(stderr, "    Verbose comparison is %s\n",
	on_or_off(bVerbose_g) );
fprintf(stderr, "    Timing is %s\n",
	on_or_off(bTiming_g) );
fprintf(stderr, "    Result limit is %s\n",
	on_or_off(sKimmoData_g.bLimit) );
fprintf(stderr, "    Alignment display is %s\n",
	on_or_off(sKimmoData_g.bAlignment) );
fprintf(stderr, "    Gloss display is %s\n",
	on_or_off(sKimmoData_g.sPATR.bGloss) );
fprintf(stderr, "    Grammar is %s\n",
	on_or_off(sKimmoData_g.bUsePATR) );
switch (sKimmoData_g.sPATR.eTreeDisplay)
	{
	case PATR_NO_TREE:		p = "OFF";	break;
	case PATR_FLAT_TREE:	p = "FLAT";	break;
	case PATR_FULL_TREE:	p = "FULL";	break;
	case PATR_INDENTED_TREE:	p = "INDENTED";	break;
	case PATR_XML_TREE:		p = "XML";	break;
	default:			p = "????";	break;	/* shouldn't happen */
	}
fprintf(stderr, "    Tree display is %s\n", p);
fprintf(stderr, "    Feature display is ");
if (sKimmoData_g.sPATR.iFeatureDisplay & PATR_FEATURE_ON)
	{
	fprintf(stderr, "%s and %s\n",
		(sKimmoData_g.sPATR.iFeatureDisplay & PATR_FEATURE_ALL) ?
								  "ALL" : "TOP",
		(sKimmoData_g.sPATR.iFeatureDisplay & PATR_FEATURE_FLAT) ?
								  "FLAT" : "FULL");

	}
else
	fprintf(stderr, "OFF\n");

fprintf(stderr, "    Trim-empty-features display is %s\n",
	on_or_off(sKimmoData_g.sPATR.iFeatureDisplay & PATR_FEATURE_TRIM) );
fprintf(stderr, "    Ambiguity limit is %d\n",
	sKimmoData_g.sPATR.iMaxAmbiguities);
fprintf(stderr, "    Failure display is %s\n",
	on_or_off(sKimmoData_g.sPATR.bFailure) );
fprintf(stderr, "    Unification is %s\n",
	on_or_off(sKimmoData_g.sPATR.bUnification) );
if (sKimmoData_g.uiAutomataSize == 0)
	fprintf(stderr, "    Rules are ALL ON\n");
else
	{
	num = sKimmoData_g.uiAutomataSize;
	for ( len = 0, i = 1 ; i <= num ; ++i )
	{
	if (checkKimmoRuleStatus(i, &sKimmoData_g))
		++len;
	}
	if (len == num)
	fprintf(stderr, "    Rules are ALL ON\n");
	else if (len == 0)
	fprintf(stderr, "    Rules are ALL OFF\n");
	else
	{
	fprintf(stderr, "    Rules are");
	len = 13;
	for ( i = 1 ; i <= num ; ++i )
		{
		if (i < num)
		{
		fprintf(stderr,"%3d %s", i,
			checkKimmoRuleStatus(i,&sKimmoData_g) ? "ON, ":"OFF,");
		len += 8;
		}
		else
		{
		fprintf(stderr,"%3d %s", i,
			checkKimmoRuleStatus(i,&sKimmoData_g) ? "ON ":"OFF");
		len += 7;
		}
		if (len >= 72)
		{
		putc( '\n', stderr);
		if (i < num) { fputs("             ", stderr); len = 13; }
		else	       { len = 0; }
		}
		}
	if (len != 0)
		putc( '\n', stderr);
	}
	}
putc( '\n', stderr);		/* blank line before the prompt */
}

/*****************************************************************************
 * NAME
 *    do_generate
 * ARGUMENTS
 *    pszForm - pointer to lexical form
 * DESCRIPTION
 *    Execute a GENERATE [<form>] command.
 *    If a form is given, generate the corresponding surface form.  Otherwise,
 *    prompt for lexical forms, generating the surface forms, until the user
 *    types a blank line.
 * RETURN VALUE
 *    none
 */
void do_generate(pszForm)
unsigned char * pszForm;
{
unsigned char * pszLine;
unsigned char * psz;
KimmoResult * resp;

if (!isReadyToGenerate())
	return;
if (pszForm != (unsigned char *)NULL)
	{
	/*
	 *  form given with command -- process only that form
	 */
	psz = pszForm;
	while (isascii(*psz) && isspace(*psz))
	psz++;
	if (sKimmoData_g.pLogFP != NULL)
	fprintf(sKimmoData_g.pLogFP, "%s\n", psz);

	if (bTiming_g)
	startCmdTiming();

	resp = applyKimmoGenerator(psz, &sKimmoData_g);

	if (bTiming_g)
	stopCmdTiming();

	if (resp == NULL)
	{
	fputs(szNoResults_m, stderr);
	if (sKimmoData_g.pLogFP != NULL)
		fputs(szNoResults_m, sKimmoData_g.pLogFP);
	}
	else
	{
	writeKimmoResults(resp, stderr, &sKimmoData_g);
	if (sKimmoData_g.pLogFP != NULL)
		writeKimmoResults( resp, sKimmoData_g.pLogFP, &sKimmoData_g);
	}
	freeKimmoResult(resp, &sKimmoData_g);

	if (bTiming_g && !sKimmoData_g.bSilent)
	showCmdTiming();

	return;
	}
for (;;)
	{
	/*
	 *  no form given with command -- read and process forms until blank line
	 */
	pszLine = (unsigned char *)promptUser(generator_prompt);
	if (!pszLine)
	break;
	psz = tokenizeString(pszLine, szWhitespace_m);
	if (psz == (unsigned char *)NULL)
	break;			/* quit at first blank line */
	if (sKimmoData_g.pLogFP != NULL)
	fprintf(sKimmoData_g.pLogFP, "%s\n", psz);

	if (bTiming_g)
	startCmdTiming();

	resp = applyKimmoGenerator(psz, &sKimmoData_g);

	if (bTiming_g)
	stopCmdTiming();

	if (resp == NULL)
	{
	fputs(szNoResults_m, stderr);
	if (sKimmoData_g.pLogFP != NULL)
		fputs(szNoResults_m, sKimmoData_g.pLogFP);
	}
	else
	{
	writeKimmoResults( resp, stderr, &sKimmoData_g );
	if (sKimmoData_g.pLogFP != NULL)
		writeKimmoResults( resp, sKimmoData_g.pLogFP, &sKimmoData_g );
	}
	freeKimmoResult( resp, &sKimmoData_g );

	if (bTiming_g && !sKimmoData_g.bSilent)
	showCmdTiming();
	}
}

/*****************************************************************************
 * NAME
 *    do_file_generate
 * DESCRIPTION
 *    process a FILE GENERATE command
 * RETURN VALUE
 *    none
 */
void do_file_generate(pszFilename_in)
char *	pszFilename_in;
{
char *		pszInputFile;
FILE *		infp;
char *		arg;
FILE *		outfp;
unsigned	linenum;
unsigned	uiDotsCount = 0;
unsigned	uiAmbiguityCount;
KimmoResult *	rp;
KimmoResult *	gresp;

if (!isReadyToGenerate())
	return;
if (getCmdTakeLevel() != 0)
	pszInputFile = buildAdjustedFilename(pszFilename_in, getCmdTakeFile(),
					 NULL);
else
	pszInputFile = duplicateString( pszFilename_in );
infp = fopen( pszInputFile, "r");
if (infp == NULL)
	{
	displayNumberedMessage(&sCmdBadInputFile_g,
			   sKimmoData_g.bSilent,
			   sKimmoData_g.bShowWarnings,
			   sKimmoData_g.pLogFP,
			   NULL, 0,
			   pszInputFile, "FILE GENERATE");
	freeMemory( pszInputFile );
	return;
	}
arg = (char *)tokenizeString(NULL,szWhitespace_m);
if (arg == NULL)
	outfp = stderr;
else
	{
	outfp = fopen( arg, "w" );
	pCmdOutputFP_g = outfp;
	}
if (outfp == NULL)
	{
	displayNumberedMessage(&sCmdBadOutputFile_g,
			   sKimmoData_g.bSilent,
			   sKimmoData_g.bShowWarnings,
			   sKimmoData_g.pLogFP,
			   NULL, 0,
			   arg, "FILE GENERATE");
	outfp = stderr;
	}
if (bTiming_g)
	startCmdTiming();
linenum = 1;
while ((arg = readLineFromFile(infp, &linenum,
				   sKimmoData_g.cComment)) != NULL)
	{
	arg = (char *)tokenizeString((unsigned char *)arg, szWhitespace_m);
	if (arg != NULL)
	{
	fprintf(outfp, "%s\n", arg);
	if (sKimmoData_g.pLogFP != NULL)
		fprintf(sKimmoData_g.pLogFP, "%s\n", arg);

	gresp = applyKimmoGenerator((unsigned char *)arg,
					&sKimmoData_g);

	if (gresp == NULL)
		{
		fputs(szNoResults_m, outfp);
		if (sKimmoData_g.pLogFP != NULL)
		fputs(szNoResults_m, sKimmoData_g.pLogFP);
		}
	else
		{
		writeKimmoResults( gresp, outfp, &sKimmoData_g);
		if (sKimmoData_g.pLogFP != NULL)
		writeKimmoResults( gresp, sKimmoData_g.pLogFP, &sKimmoData_g );
		}
	if (outfp != stderr)
		{
		uiAmbiguityCount = 0;
		for ( rp = gresp ; rp ; rp = rp->pNext )
		++uiAmbiguityCount;
		if (!sKimmoData_g.bSilent)
		uiDotsCount = showAmbiguousProgress(uiAmbiguityCount,
							uiDotsCount);
		}
	freeKimmoResult( gresp, &sKimmoData_g );
	}
	}
if (bTiming_g)
	stopCmdTiming();
fclose(infp);
freeMemory( pszInputFile );
if (outfp != stderr)
	{
	if (uiDotsCount != 0)
	putc('\n',stderr);	/* newline unless no dots printed */
	pCmdOutputFP_g = NULL;
	fclose(outfp);
	}
else
	fflush(outfp);
if (bTiming_g && !sKimmoData_g.bSilent)
	showCmdTiming();
}

/*****************************************************************************
 * NAME
 *    do_clear
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Execute a CLEAR command.
 * RETURN VALUE
 *    none
 */
void do_clear()
{
freeKimmoRules(&sKimmoData_g);			/* remove existing rules */
freeKimmoLexicon(&sKimmoData_g);		/* remove existing lexicon */
freeKimmoLexicon(&sSynthesisData_g);		/* remove synthesis lexicon */
memset(&sSynthesisData_g, 0, sizeof(sSynthesisData_g));
freePATRGrammar(&sKimmoData_g.sPATR);		/* remove existing grammar */
sKimmoData_g.bUsePATR     = FALSE;
sSynthesisData_g.bUsePATR = FALSE;
freePATRInternalMemory(&sKimmoData_g.sPATR);
}

/*****************************************************************************
 * NAME
 *    do_recognize
 * ARGUMENTS
 *    pszForm - pointer to a surface form
 * DESCRIPTION
 *    Execute a RECOGNIZE [<form>] command.
 *    If a form is given, generate the corresponding lexical form.  Otherwise,
 *    prompt for surface forms, generating the lexical forms, until the user
 *    types a blank line.
 * RETURN VALUE
 *    none
 */
void do_recognize(pszForm)
unsigned char * pszForm;
{
unsigned char * pszLine;
unsigned char * psz;
KimmoResult * resp;

if (!isReadyToRecognize())
	return;
if (pszForm != (unsigned char *)NULL)
	{
	/*
	 *  form given with command -- process only that form
	 */
	psz = tokenizeString(pszForm, szWhitespace_m);
	if (sKimmoData_g.pLogFP != NULL)
	fprintf(sKimmoData_g.pLogFP, "%s\n\n", psz);

	if (bTiming_g)
	startCmdTiming();

	resp = applyKimmoRecognizer(psz, &sKimmoData_g);

	if (bTiming_g)
	stopCmdTiming();

	if (resp == NULL)
	{
	fputs(szNoResults_m, stderr);
	if (sKimmoData_g.pLogFP != NULL)
		fputs(szNoResults_m, sKimmoData_g.pLogFP);
	}
	else
	{
	writeKimmoResults( resp, stderr, &sKimmoData_g );
	if (sKimmoData_g.pLogFP != NULL)
		writeKimmoResults( resp, sKimmoData_g.pLogFP, &sKimmoData_g );
	}
	freeKimmoResult( resp, &sKimmoData_g );

	if (bTiming_g && !sKimmoData_g.bSilent)
	showCmdTiming();

	return;
	}
for (;;)
	{
	/*
	 *  no form given with command -- read and process forms until blank line
	 */
	pszLine = (unsigned char *)promptUser(recognizer_prompt);
	if (!pszLine)
	break;
	psz = tokenizeString(pszLine, szWhitespace_m);
	if (psz == (unsigned char *)NULL)
	break;			/* quit at first blank line */
	if (sKimmoData_g.pLogFP != NULL)
	fprintf(sKimmoData_g.pLogFP, "%s\n\n", psz);

	if (bTiming_g)
	startCmdTiming();

	resp = applyKimmoRecognizer(psz, &sKimmoData_g);

	if (bTiming_g)
	stopCmdTiming();

	if (resp == NULL)
	{
	fputs(szNoResults_m, stderr);
	if (sKimmoData_g.pLogFP != NULL)
		fputs(szNoResults_m, sKimmoData_g.pLogFP);
	}
	else
	{
	writeKimmoResults( resp, stderr, &sKimmoData_g );
	if (sKimmoData_g.pLogFP != NULL)
		writeKimmoResults( resp, sKimmoData_g.pLogFP, &sKimmoData_g );
	}
	freeKimmoResult( resp, &sKimmoData_g );

	if (bTiming_g && !sKimmoData_g.bSilent)
	showCmdTiming();
	}
}

/*****************************************************************************
 * NAME
 *    do_file_recognize
 * DESCRIPTION
 *    process a FILE RECOGNIZE command
 * RETURN VALUE
 *    none
 */
void do_file_recognize(pszFilename_in)
char *	pszFilename_in;
{
char *		pszInputFile;
FILE *		infp;
char *		arg;
FILE *		outfp;
unsigned	linenum;
unsigned	uiDotsCount = 0;
unsigned	uiAmbiguityCount;
KimmoResult *	rp;
KimmoResult *	rresp;

if (!isReadyToRecognize())
	return;
if (getCmdTakeLevel() != 0)
	pszInputFile = buildAdjustedFilename(pszFilename_in, getCmdTakeFile(),
					 NULL);
else
	pszInputFile = duplicateString( pszFilename_in );
infp = fopen( pszInputFile, "r");
if (infp == NULL)
	{
	displayNumberedMessage(&sCmdBadInputFile_g,
			   sKimmoData_g.bSilent,
			   sKimmoData_g.bShowWarnings,
			   sKimmoData_g.pLogFP,
			   NULL, 0,
			   pszInputFile, "FILE RECOGNIZE" );
	freeMemory( pszInputFile );
	return;
	}
arg = (char *)tokenizeString(NULL,szWhitespace_m);
if (arg == NULL)
	outfp = stderr;
else
	{
	outfp = fopen( arg, "w" );
	}
if (outfp == NULL)
	{
	displayNumberedMessage(&sCmdBadOutputFile_g,
			   sKimmoData_g.bSilent,
			   sKimmoData_g.bShowWarnings,
			   sKimmoData_g.pLogFP,
			   NULL, 0,
			   arg, "FILE RECOGNIZE");
	outfp = stderr;
	}
if (bTiming_g)
	startCmdTiming();
/*
 *  for each non-blank line, process first item on the line
 */
linenum = 1;
while ((arg=readLineFromFile(infp,&linenum,sKimmoData_g.cComment)) != NULL)
	{
	arg = (char *)tokenizeString((unsigned char *)arg, szWhitespace_m);
	if (arg != NULL)
	{
	fprintf(outfp, "%s\n", arg);
	if (sKimmoData_g.pLogFP != NULL)
		fprintf(sKimmoData_g.pLogFP, "%s\n", arg);

	rresp = applyKimmoRecognizer((unsigned char *)arg,
					 &sKimmoData_g);

	if (rresp == NULL)
		{
		fputs(szNoResults_m, outfp);
		if (sKimmoData_g.pLogFP != NULL)
		fputs(szNoResults_m, sKimmoData_g.pLogFP);
		}
	else
		{
		writeKimmoResults( rresp, outfp, &sKimmoData_g);
		if (sKimmoData_g.pLogFP != NULL)
		writeKimmoResults( rresp, sKimmoData_g.pLogFP, &sKimmoData_g );
		}
	if (outfp != stderr)
		{
		uiAmbiguityCount = 0;
		for ( rp = rresp ; rp ; rp = rp->pNext )
		++uiAmbiguityCount;
		if (!sKimmoData_g.bSilent)
		uiDotsCount = showAmbiguousProgress(uiAmbiguityCount,
							uiDotsCount);
		}
	freeKimmoResult( rresp, &sKimmoData_g );
	}
	}
if (bTiming_g)
	stopCmdTiming();
fclose(infp);
freeMemory( pszInputFile );
if (outfp != stderr)
	{
	if (uiDotsCount != 0)
	putc('\n',stderr);	/* newline unless no dots printed */
	fclose(outfp);
	pCmdOutputFP_g = NULL;
	}
else
	fflush(outfp);
if (bTiming_g && !sKimmoData_g.bSilent)
	showCmdTiming();
}

/*****************************************************************************
 * NAME
 *    do_synthesize
 * ARGUMENTS
 *    pszForm - pointer to a morphological form
 * DESCRIPTION
 *    Execute a SYNTHESIZE [<form>] command.
 *    If a form is given, generate the corresponding surface form.  Otherwise,
 *    prompt for morphological forms, generating the surface forms, until the
 *    user types a blank line.
 * RETURN VALUE
 *    none
 */
void do_synthesize(pszForm)
unsigned char *pszForm;
{
unsigned char * pszLine;
unsigned char *	psz;
KimmoResult *	pSynthResult;

if (!isReadyToSynthesize())
	return;
if (pszForm != (unsigned char *)NULL)
	{
	/*
	 *  form given with command -- process only that form
	 */
	psz = pszForm + strspn((char *)pszForm, (char *)szWhitespace_m);
	if (*psz == NUL)
	{
	return;
	}
	if (sKimmoData_g.pLogFP != NULL)
	fprintf(sKimmoData_g.pLogFP, "%s\n\n", psz);
	/*
	 *  copy the operational control information
	 */
	sSynthesisData_g.bLimit        = sKimmoData_g.bLimit;
	sSynthesisData_g.iTraceLevel   = sKimmoData_g.iTraceLevel;
	sSynthesisData_g.bUsePATR      = sKimmoData_g.bUsePATR;
	sSynthesisData_g.bSilent       = sKimmoData_g.bSilent;
	sSynthesisData_g.bShowWarnings = sKimmoData_g.bShowWarnings;
	sSynthesisData_g.cGlossBegin   = sKimmoData_g.cGlossBegin;
	sSynthesisData_g.cGlossEnd     = sKimmoData_g.cGlossEnd;
	sSynthesisData_g.cComment      = sKimmoData_g.cComment;
	sSynthesisData_g.pLogFP        = sKimmoData_g.pLogFP;

	if (bTiming_g)
	startCmdTiming();

	pSynthResult = applyKimmoSynthesizer(psz, &sSynthesisData_g);

	if (bTiming_g)
	stopCmdTiming();

	if (pSynthResult == NULL)
	{
	fputs(szNoResults_m, stderr);
	if (sKimmoData_g.pLogFP != NULL)
		fputs(szNoResults_m, sKimmoData_g.pLogFP);
	}
	else
	{
	writeKimmoResults(pSynthResult, stderr, &sKimmoData_g);
	if (sKimmoData_g.pLogFP != NULL)
		writeKimmoResults(pSynthResult, sKimmoData_g.pLogFP,
				  &sKimmoData_g);
	}
	freeKimmoResult(pSynthResult, &sSynthesisData_g);

	if (bTiming_g && !sKimmoData_g.bSilent)
	showCmdTiming();

	return;
	}
for (;;)
	{
	/*
	 *  no form given with command -- read and process forms until blank line
	 */
	pszLine = (unsigned char *)promptUser(synthesizer_prompt);
	if (!pszLine)
	break;
	psz = pszLine + strspn((char *)pszLine, (char *)szWhitespace_m);
	if (*psz == NUL)
	break;			/* quit at first blank line */
	if (sKimmoData_g.pLogFP != NULL)
	fprintf(sKimmoData_g.pLogFP, "%s\n\n", psz);
	/*
	 *  copy the operational control information
	 */
	sSynthesisData_g.bLimit        = sKimmoData_g.bLimit;
	sSynthesisData_g.iTraceLevel   = sKimmoData_g.iTraceLevel;
	sSynthesisData_g.bUsePATR      = sKimmoData_g.bUsePATR;
	sSynthesisData_g.bSilent       = sKimmoData_g.bSilent;
	sSynthesisData_g.bShowWarnings = sKimmoData_g.bShowWarnings;
	sSynthesisData_g.cGlossBegin   = sKimmoData_g.cGlossBegin;
	sSynthesisData_g.cGlossEnd     = sKimmoData_g.cGlossEnd;
	sSynthesisData_g.cComment      = sKimmoData_g.cComment;
	sSynthesisData_g.pLogFP        = sKimmoData_g.pLogFP;

	if (bTiming_g)
	startCmdTiming();

	pSynthResult = applyKimmoSynthesizer(psz, &sSynthesisData_g);

	if (bTiming_g)
	stopCmdTiming();

	if (pSynthResult == NULL)
	{
	fputs(szNoResults_m, stderr);
	if (sKimmoData_g.pLogFP != NULL)
		fputs(szNoResults_m, sKimmoData_g.pLogFP);
	}
	else
	{
	writeKimmoResults(pSynthResult, stderr, &sKimmoData_g);
	if (sKimmoData_g.pLogFP != NULL)
		writeKimmoResults(pSynthResult, sKimmoData_g.pLogFP,
				  &sKimmoData_g);
	}
	freeKimmoResult(pSynthResult, &sSynthesisData_g);

	if (bTiming_g && !sKimmoData_g.bSilent)
	showCmdTiming();
	}
}

/*****************************************************************************
 * NAME
 *    do_file_synthesize
 * DESCRIPTION
 *    process a FILE SYNTHESIZE command
 * RETURN VALUE
 *    none
 */
void do_file_synthesize(pszFilename_in)
char *	pszFilename_in;
{
char *		arg;
char *		pszInputFile;
FILE *		infp;
FILE *		outfp;
unsigned	linenum;
unsigned	uiDotsCount = 0;
unsigned	uiAmbiguityCount;
KimmoResult *	rp;
KimmoResult *	gresp;

if (!isReadyToSynthesize())
	return;
if (getCmdTakeLevel() != 0)
	pszInputFile = buildAdjustedFilename(pszFilename_in, getCmdTakeFile(),
					 NULL);
else
	pszInputFile = duplicateString( pszFilename_in );
infp = fopen( pszInputFile, "r");
if (infp == NULL)
	{
	displayNumberedMessage(&sCmdBadInputFile_g,
			   sKimmoData_g.bSilent,
			   sKimmoData_g.bShowWarnings,
			   sKimmoData_g.pLogFP,
			   NULL, 0,
			   pszInputFile, "FILE SYNTHESIZE" );
	freeMemory( pszInputFile );
	return;
	}
arg = (char *)tokenizeString(NULL,szWhitespace_m);
if (arg == NULL)
	outfp = stderr;
else
	{
	outfp = fopen( arg, "w" );
	}
if (outfp == NULL)
	{
	displayNumberedMessage(&sCmdBadOutputFile_g,
			   sKimmoData_g.bSilent,
			   sKimmoData_g.bShowWarnings,
			   sKimmoData_g.pLogFP,
			   NULL, 0,
			   arg, "FILE SYNTHESIZE");
	outfp = stderr;
	}
/*
 *  copy the operational control information
 */
sSynthesisData_g.bLimit        = sKimmoData_g.bLimit;
sSynthesisData_g.iTraceLevel   = sKimmoData_g.iTraceLevel;
sSynthesisData_g.bUsePATR      = sKimmoData_g.bUsePATR;
sSynthesisData_g.bSilent       = sKimmoData_g.bSilent;
sSynthesisData_g.bShowWarnings = sKimmoData_g.bShowWarnings;
sSynthesisData_g.cGlossBegin   = sKimmoData_g.cGlossBegin;
sSynthesisData_g.cGlossEnd     = sKimmoData_g.cGlossEnd;
sSynthesisData_g.cComment      = sKimmoData_g.cComment;
sSynthesisData_g.pLogFP        = sKimmoData_g.pLogFP;

if (bTiming_g)
	startCmdTiming();
/*
 *  for each non-blank line, process the line
 */
linenum = 1;
while ((arg=readLineFromFile(infp,&linenum,sKimmoData_g.cComment)) != NULL)
	{
	arg += strspn(arg, (char *)szWhitespace_m);
	if (*arg == NUL)
	continue;			/* skip blank lines */
	trimTrailingWhitespace(arg);

	fprintf(outfp, "%s\n", arg);
	if (sKimmoData_g.pLogFP != NULL)
	fprintf(sKimmoData_g.pLogFP, "%s\n", arg);

	gresp = applyKimmoSynthesizer((unsigned char *)arg, &sSynthesisData_g);

	if (gresp == NULL)
	{
	fputs(szNoResults_m, outfp);
	if (sKimmoData_g.pLogFP != NULL)
		fputs(szNoResults_m, sKimmoData_g.pLogFP);
	}
	else
	{
	writeKimmoResults( gresp, outfp, &sKimmoData_g);
	if (sKimmoData_g.pLogFP != NULL)
		writeKimmoResults( gresp, sKimmoData_g.pLogFP, &sKimmoData_g );
	}
	if (outfp != stderr)
	{
	uiAmbiguityCount = 0;
	for ( rp = gresp ; rp ; rp = rp->pNext )
		++uiAmbiguityCount;
	if (!sKimmoData_g.bSilent)
		uiDotsCount = showAmbiguousProgress(uiAmbiguityCount,
						uiDotsCount);
	}
	freeKimmoResult( gresp, &sKimmoData_g );
	}
if (bTiming_g)
	stopCmdTiming();
fclose(infp);

freeMemory( pszInputFile );
if (outfp != stderr)
	{
	if (uiDotsCount != 0)
	putc('\n',stderr);	/* newline unless no dots printed */
	fclose(outfp);
	pCmdOutputFP_g = NULL;
	}
else
	fflush(outfp);
if (bTiming_g && !sKimmoData_g.bSilent)
	showCmdTiming();
}

/*****************************************************************************
 * NAME
 *    do_save
 * ARGUMENTS
 *    filename - pointer to an optional log file name.
 * DESCRIPTION
 *    Execute a SAVE [<filename>] command.
 * RETURN VALUE
 *    none
 */
void do_save(filename)
char *filename;
{
char buffer[80];
FILE *fp;
char *p;
unsigned i;
short val;

sprintf(buffer, "SAVE [<file>] (default is %s.tak)", pszCmdProgramName_g);
if (wantCmdHelp(filename, buffer))
	return;
sprintf(buffer, "%s.tak", pszCmdProgramName_g);
filename = setCmdFilename(filename, buffer, ".tak");
fp = fopen(filename,"w");
if (fp == NULL)
	{
	displayNumberedMessage(&sCmdBadOutputFile_g,
			   sKimmoData_g.bSilent,
			   sKimmoData_g.bShowWarnings,
			   sKimmoData_g.pLogFP,
			   NULL, 0,
			   filename, "SAVE" );
	freeMemory(filename);
	return;
	}
freeMemory(filename);
/*
 *  first, save the relevant files
 */
if (sKimmoData_g.pszRulesFile != NULL)
	fprintf(fp, "load rules %s\n",
	sKimmoData_g.pszRulesFile);
if (sKimmoData_g.pszLexiconFile != NULL)
	fprintf(fp, "load lexicon %s\n",
	sKimmoData_g.pszLexiconFile);
if (sKimmoData_g.sPATR.pGrammar != NULL)
	fprintf(fp, "load grammar %s\n",
	sKimmoData_g.sPATR.pszGrammarFile);
/*
 *  now, save the various settings in alphabetical order
 */
fprintf(fp, "set alignment %s\n",
	on_or_off(sKimmoData_g.bAlignment) );
fprintf(fp, "set ambiguities %d\n",
	sKimmoData_g.sPATR.iMaxAmbiguities);
fprintf(fp, "set failures %s\n",
	on_or_off(sKimmoData_g.sPATR.bFailure) );

fprintf(fp, "set features %s\n",
	(sKimmoData_g.sPATR.iFeatureDisplay & PATR_FEATURE_ALL) ?
								  "ALL" : "TOP");
fprintf(fp, "set features %s\n",
	(sKimmoData_g.sPATR.iFeatureDisplay & PATR_FEATURE_FLAT) ?
								  "FLAT" : "FULL");
fprintf(fp, "set features %s\n",
	on_or_off(sKimmoData_g.sPATR.iFeatureDisplay & PATR_FEATURE_ON));

fprintf(fp, "set glosses %s\n",
	on_or_off(sKimmoData_g.sPATR.bGloss) );
fprintf(fp, "set grammar %s\n",
	on_or_off(sKimmoData_g.bUsePATR) );
fprintf(fp, "set limit %s\n",
	on_or_off(sKimmoData_g.bLimit) );
p = NULL;
for (	val = checkKimmoRuleStatus(1, &sKimmoData_g), i = 2 ;
	i <= sKimmoData_g.uiAutomataSize ;
	++i )
	{
	if (checkKimmoRuleStatus(i, &sKimmoData_g) != val)
	break;
	}
if (i == sKimmoData_g.uiAutomataSize)
	{
	if (val)
	p = "ON ALL";
	else
	p = "OFF ALL";
	fprintf(fp, "set rules %s\n", p);
	}
else
	{
	fprintf(fp, "set rules ON ALL\n");
	for ( i = 1 ; i <= sKimmoData_g.uiAutomataSize ; ++i )
	{
	if (!checkKimmoRuleStatus(i, &sKimmoData_g))
		fprintf(fp, "set rules OFF %d\n", i);
	}
	}
fprintf(fp, "set timing %s\n", on_or_off(bTiming_g) );
switch (sKimmoData_g.iTraceLevel)
	{
	case 0:	p = "OFF";
	case 1:	p = "1";
	case 2:	p = "ON";
	case 3:	p = "3";
	default:	p = "ON";	/* ? */
	}
fprintf(fp, "set tracing %s\n", p);
switch (sKimmoData_g.sPATR.eTreeDisplay)
	{
	case PATR_NO_TREE:		p = "OFF";	break;
	case PATR_FLAT_TREE:	p = "FLAT";	break;
	case PATR_FULL_TREE:	p = "FULL";	break;
	case PATR_INDENTED_TREE:	p = "INDENTED";	break;
	case PATR_XML_TREE:		p = "XML";	break;
	default:			p = "ON";	break;	/* shouldn't happen */
	}
fprintf(fp, "set tree %s\n", p);
fprintf(fp, "set trim-empty-features %s\n",
	on_or_off(sKimmoData_g.sPATR.iFeatureDisplay & PATR_FEATURE_TRIM) );
fprintf(fp, "set unification %s\n",
	on_or_off(sKimmoData_g.sPATR.bUnification) );
fprintf(fp, "set verbose %s\n",
	on_or_off(bVerbose_g) );
fprintf(fp, "set warnings %s\n",
	on_or_off(sKimmoData_g.bShowWarnings) );
fclose(fp);
}

/*****************************************************************************
 * NAME
 *    show_lexicon
 * ARGUMENTS
 *    lexname - name of the (sub)lexicon to show
 * DESCRIPTION
 *    Display the contents of a specified sublexicon.
 * RETURN VALUE
 *    none
 */
void show_lexicon(lexname)
unsigned char *lexname;
{
if (lexname == NULL)
	{
	displayNumberedMessage(&sCmdMissingArgument_g,
			   sKimmoData_g.bSilent,
			   sKimmoData_g.bShowWarnings,
			   sKimmoData_g.pLogFP,
			   NULL, 0,
			   "SHOW LEXICON" );
	}
else if (writeKimmoLexiconSection(lexname, stderr, &sKimmoData_g) == FALSE)
	{
	displayNumberedMessage(&sCmdBadArgument_g,
			   sKimmoData_g.bSilent,
			   sKimmoData_g.bShowWarnings,
			   sKimmoData_g.pLogFP,
			   NULL, 0,
			   "SHOW LEXICON", lexname);
	}
}
