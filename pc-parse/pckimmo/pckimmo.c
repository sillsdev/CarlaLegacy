/*	PCKIMMO.C - global variables and main() for PC-KIMMO program
 ***************************************************************************
 *
 *	int main(argc, argv)
 *	int argc;
 *	char **argv;
 *
 ***************************************************************************
 * Copyright 1989, 2000 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

extern int	getopt P((int argc, char * const argv[], const char *opts));
extern char *	optarg;
extern int	optind;
extern int	opterr;
extern int	optopt;

#include "kimmo.h"
#include "pckimmo.h"
#include "version.h"

#ifdef __MWERKS__
#include <sioux.h>
static char szStderrBuffer[BUFSIZ];
#if __profile__
#include <profiler.h>
#define MWERKS__PROFILE 1
#endif
#endif

static void reportKimmoOutOfMemory P((size_t size));

/***************************************************************************
 * GLOBAL VARIABLES
 */
static PATRMemory sKimmoPATRMemory_s =
{
	NULL, NULL, NULL, NULL, NULL, NULL, TRUE,
	NULL, NULL, 0,
	0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, NULL, NULL,
	NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, { NULL, 0, 0, 0 },
	NULL, 0, 0, 0
};
KimmoData sKimmoData_g = {
	FALSE,		/* bLimit      - limit to a single good result */
	0,			/* iTraceLevel - enable tracing of Kimmo processing */
	FALSE,		/* bUsePATR    - enable parsing with PATR functions */
	FALSE,		/* bSilent     - disable stderr messages */
	TRUE,		/* bShowWarnings - allow warning messages */
	FALSE,		/* bAlignment  - align recognizer output vertically */
	'<',		/* cGlossBegin - optionally surround morphnames */
	'>',		/* cGlossEnd       in synthesizer input strings */
	KIMMO_DEFAULT_COMMENT,	/* begins comment in input lines */
	NULL,		/* pLogFP      - output log FILE */
	NULL,		/* alphabet */
	0,			/* size of the alphabet */
	'\0',		/* null character */
	'\0',		/* wild card character */
	'\0',		/* word boundary character */
	FALSE,		/* bTwoLCFile - rules loaded from a TwoLC type file */
	NULL,		/* alphabet subsets */
	0,			/* number of alphabet subsets */
	NULL,		/* array of automata (KimmoRule) structures */
	0,			/* number of rules in automata */
	NULL,		/* feasible pairs */
	0,			/* number of feasible pairs */
	NULL,
	NULL,		/* array of alternations */
	0,			/* number of alternations stored */
	NULL,		/* sections of the lexicon */
	NULL,		/* first ("INITIAL") section of lexicon */
	0,			/* number of sections of the lexicon */
	NULL,		/* array of possible feature strings */
	0,			/* number of feature strings */
	NULL,
	{
	FALSE,	/* bFailure         - display parser failures */
	TRUE,	/* bUnification     - enable unification */
	PATR_FULL_TREE,		/*  - tree display mode */
	TRUE,	/* bGloss           - display glosses (if they exist) */
	TRUE,	/* bGlossesExist    - whether glosses exist (always TRUE) */
		/* iFeatureDisplay  - feature display mode */
	PATR_FEATURE_ON | PATR_FEATURE_TRIM,
	TRUE,	/* bCheckCycles     - enable checking for parse cycles */
	TRUE,	/* bTopDownFilter   - enable top down filtering */
	10,	/* iMaxAmbiguities  - max number of ambiguities to show */
	0,	/* iDebugLevel      - degree of debugging output desired */
	PATR_DEFAULT_COMMENT,	/*  - begins a comment in an input line */
	FALSE,	/* bSilent          - disable stderr messages */
	TRUE,	/* bShowWarnings    - allow warning messages */
	TRUE,	/* bPromoteDefAtoms - promote default atoms before parsing */
	FALSE,	/* bPropIsFeature   - AMPLE property is feature template */
#ifndef hab219
	0,  	/* eRootGlossFeature  - use AMPLE root gloss as feature */
#endif /* hab219 */
	0,	/* iMaxProcTime     - maximum processing time for a parse */
	NULL,	/* pLogFP           - output log file */
	NULL,	/* pFinalPunc       - not used by Kimmo functions */
	NULL,	/* pszGrammarFile   - name of the grammar file */
	NULL,	/* pGrammar         - data loaded from the grammar file */
	0,
	NULL, NULL, NULL, NULL, NULL, NULL, /* not used by Kimmo functions */
#ifndef hab219
	NULL,
#endif /* hab219 */
	0, 0,	/* internal processing values */
	&sKimmoPATRMemory_s,
	0, 0, NULL,
	}
	};
KimmoData sSynthesisData_g;		/* contains synthesis lexicon */
int bTiming_g    = FALSE;	/* flag for timing on/off */
int bVerbose_g   = FALSE;	/* flag for verbose comparison on/off */

#ifdef MACINTOSH_NEEDS
long next_user_event_ticks = 0;
#endif
char *	emergency_memory = NULL;	/* memory to release if we run out */
/*
 *  VARIABLES SET BY COMMAND LINE OPTIONS
 */
char *	pszArgv0_g = NULL;		/* program pathname */
char *	r_file = NULL;			/* -r rule file */
char *	l_file = NULL;			/* -l lexicon file */
char *	s_file = NULL;			/* -s synthesis lexicon file */
char *	g_file = NULL;			/* -g grammar file */
char *	t_file = NULL;			/* -t "take" file */

/*****************************************************************************
 * NAME
 *    display_header
 * DESCRIPTION
 *    Write the program header information to the screen (stderr).
 * RETURN VALUE
 *    none
 */
void display_header()
{
fprintf(stderr,"PC-KIMMO TWO-LEVEL PROCESSOR\n");
fprintf(stderr,"Version %d.%d%c%d (%s), Copyright %s SIL\n",
	iKimmoVersion_g, iKimmoRevision_g, cKimmoPatchSep_g,
	iKimmoPatchlevel_g, pszKimmoDate_g, pszKimmoYear_g );
#ifdef __DATE__
fprintf(stderr, pszKimmoCompileFormat_g,
	pszKimmoCompileDate_g, pszKimmoCompileTime_g);
#else
if (pszKimmoTestVersion_g != NULL)
	fputs(pszKimmoTestVersion_g, stderr);
#endif
fprintf(stderr, "with PC-PATR functions version %d.%d%c%d (%s)\n",
	iPATRVersion_g, iPATRRevision_g, cPATRPatchSep_g,
	iPATRPatchlevel_g, pszPATRDate_g);
#ifdef __GO32__
fprintf(stderr,
#ifdef __DJGPP__
"For 386 CPU (or better) under MS-DOS [compiled with DJGPP %d.%d/GNU C %d.%d]\n",
	__DJGPP__, __DJGPP_MINOR__,
#else
	"For 386 CPU (or better) under MS-DOS [compiled with DJGPP/GNU C %d.%d]\n",
#endif
	__GNUC__, __GNUC_MINOR__ );
#endif
}

/*****************************************************************************
 * NAME
 *    exit_pckimmo
 * DESCRIPTION
 *    exit the program with the given status, after first displaying any
 *    needed message
 * RETURN VALUE
 *    none
 */
void exit_pckimmo(iExitStatus_in)
int	iExitStatus_in;
{
#ifdef MACINTOSH
fprintf(stderr, "\nUse the Quit command on the File menu (Command-Q)\n");
#endif
#ifdef QUICKWIN
fprintf(stderr, "\nUse the Exit command on the File menu (Control-C)\n");
#endif
exit(iExitStatus_in);
}

/****************************************************************************
 * NAME
 *    parse_cmd_line
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - pointer to array of command line arguments
 * DESCRIPTION
 *    Handle the command line arguments for PC-KIMMO.
 * RETURN VALUE
 *    none
 */
static void parse_cmd_line( argc, argv )
int argc;
char **argv;
{
int k;
int errflag = 0;
#if (VERSION < 1) || (PATCHLEVEL < 0)
VOIDP	trap_address = NULL;
int	trap_count = 0;
char *	s;
#endif

while ((k = getopt(argc, argv, "G:g:L:l:QqR:r:S:s:T:t:/z:Z:")) != EOF)
	{
	switch (k)
	{
	case 'G':		/* initial grammar filename */
	case 'g':
		g_file = optarg;
		break;

	case 'L':		/* initial lexicon filename */
	case 'l':
		l_file = optarg;
		break;

	case 'Q':		/* work as quietly as possible */
	case 'q':
		sKimmoData_g.bSilent = TRUE;
		sKimmoData_g.sPATR.bSilent = TRUE;
		sSynthesisData_g.bSilent = TRUE;
		sSynthesisData_g.sPATR.bSilent = TRUE;
		break;

	case 'R':		/* initial rules filename */
	case 'r':
		r_file = optarg;
		break;

	case 'S':		/* initial synthesis lexicon filename */
	case 's':
		s_file = optarg;
		break;

	case 'T':		/* initial command filename */
	case 't':
		t_file = optarg;
		break;

#if (VERSION < 1) || (PATCHLEVEL < 0)
	case 'z':		/* memory allocation trace filename */
		setAllocMemoryTracing(optarg);
		break;

	case 'Z':		/* memory allocation trap address,count */
		trap_address = (VOIDP)strtoul(optarg, &s, 10);
		if (*s == ',')
		trap_count = (int)strtoul(s+1, NULL, 10);
		if (trap_count == 0)
		trap_count = 1;
		break;
#endif

	default:
		++errflag;
		break;
	}
	}
if (t_file == NULL)
	{
	/* silent operation makes no sense without a command line 'take' file! */
	sKimmoData_g.bSilent = FALSE;
	sKimmoData_g.sPATR.bSilent = FALSE;
	sSynthesisData_g.bSilent = FALSE;
	sSynthesisData_g.sPATR.bSilent = FALSE;
	}
if (errflag)
	{
	display_header();
	fputs("\
Usage:  pckimmo [-r file] [-l file] [-s file] [-g file] [-t file]\n\
	-r file.rul  read rules from file.rul\n\
	-l file.lex  read an analysis lexicon from file.lex (requires -r also)\n\
	-s file.lex  read a synthesis lexicon from file.lex (requires -r also)\n\
	-g file.grm	 read a grammar from file.grm (requires -r and -l also)\n\
	-t file.tak  take commands from file.tak\n\
", stderr );

	exit_pckimmo(2);
	}
#if (VERSION < 1) || (PATCHLEVEL < 0)
if (trap_address != (VOIDP)NULL)
	setAllocMemoryTrap(trap_address, trap_count);
#endif
if (!sKimmoData_g.bSilent)
	display_header();
}

/***************************************************************************
 * NAME
 *    reportKimmoOutOfMemory
 * ARGUMENTS
 *    size - amount of memory desired, but unable to allocate
 * DESCRIPTION
 *    Die with an appropriate error message for running out of memory.
 * RETURN VALUE
 *    doesn't return!
 */
static void reportKimmoOutOfMemory(size)
size_t size;
{
static char *nomem_msg = "\nERROR 900:\n    Out of memory\n";

if (emergency_memory != (char *)NULL)
	{
	free(emergency_memory);
	emergency_memory = (char *)NULL;
	}
if (!sKimmoData_g.bSilent)
	fprintf(stderr, nomem_msg);
if (sKimmoData_g.pLogFP != (FILE *)NULL)
	fprintf(sKimmoData_g.pLogFP, nomem_msg);
exit_pckimmo(2);
}

/****************************************************************************
 * NAME
 *    main
 * ARGUMENTS
 *    argc - number of command line arguments
 *    argv - pointer to array of command line arguments
 * DESCRIPTION
 *    main() for PC-KIMMO -- where the program starts executing
 * RETURN VALUE
 *    status for return: 0 if okay, nonzero if error
 */
int main( argc, argv )
int argc;
char **argv;
{
#ifdef __MWERKS__
SIOUXSettings.asktosaveonclose = FALSE;
setvbuf(stderr, szStderrBuffer, _IOLBF, (size_t)BUFSIZ);
#endif

if (argv != NULL)
	pszArgv0_g = argv[0];

emergency_memory = malloc((size_t)16384);	/* need >8K for MPW C */
				/* error handler for memory allocation */
pfOutOfMemory_g  = reportKimmoOutOfMemory;
pszCmdProgramName_g = "pckimmo"; /* program name for building filenames */

parse_cmd_line(argc,argv);  /* parse the command line */

#ifdef MWERKS__PROFILE
if (!ProfilerInit(collectSummary, bestTimeBase, 800, 200))
	{
#endif

#ifdef MACINTOSH_NEEDS
#ifdef __MWERKS__
next_user_event_ticks = LMGetTicks() + 10;
#endif
#endif

user_cmd();			/* interact with the user */

#ifdef MWERKS__PROFILE
	ProfilerDump("\pPCKimmo.prof");
	ProfilerTerm();
	}
#endif

exit_pckimmo(0);

return 0;			/* (not reached) */
}

#ifdef MACINTOSH_NEEDS
void allow_user_events()
{
/* tricky is code needed here -- have to get into the application's event loop! */
}
#endif
