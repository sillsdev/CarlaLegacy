/* GETOPT.C - parse command line options
 *****************************************************************************
 * Here's something you've all been waiting for:  the AT&T public domain
 * source for getopt(3).  It is the code which was given out at the 1985
 * UNIFORUM conference in Dallas.  I obtained it by electronic mail
 * directly from AT&T.  The people there assure me that it is indeed
 * in the public domain.
 *
 * There is no manual page.  That is because the one they gave out at
 * UNIFORUM was slightly different from the current System V Release 2
 * manual page.  The difference apparently involved a note about the
 * famous rules 5 and 6, recommending using white space between an option
 * and its first argument, and not grouping options that have arguments.
 * Getopt itself is currently lenient about both of these things.  White
 * space is allowed, but not mandatory, and the last option in a group can
 * have an argument.  That particular version of the man page evidently
 * has no official existence, and my source at AT&T did not send a copy.
 * The current SVR2 man page reflects the actual behavor of this getopt.
 * However, I am not about to post a copy of anything licensed by AT&T.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
/*
 *  handle gratuitous incompatibilities introduced by Microsoft C 7.00
 */
#ifdef _MSC_VER
#include <io.h>
#if _MSC_VER >= 700
#define write(a,b,c) _write(a,b,c)
#endif
#endif
#ifdef __MWERKS__
#include <stdio.h>
#define write(a,b,c) fprintf(stderr, "%s", b)
#endif

#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern int    strcmp  P((const char * s1, const char * s2));
extern size_t strlen  P((const char * s));
extern char * strchr  P((const char * s, int c));
#endif /* STDC_HEADERS */

#ifndef NULL
#define NULL	(VOIDP)0
#endif
#ifndef EOF
#define EOF	(-1)
#endif

#ifdef applec
#pragma segment S_cportlib
#endif

#ifdef __STDC__
static void ERR(char *argv0, char *s, int c);
int getopt(int argc, char * const argv[], const char *opts);
#endif

static void ERR(argv0, s, c)
char *argv0;
char *s;
int c;
{
static char errbuf[2];
#ifdef rt11
register char *p;
msg("?ERROR\200");		/* .PRINT without <CR><LF> */
for ( p = s ; *p++ != '\0' ; )
	;
*--p = '\200';
msg(s);				/* .PRINT without <CR><LF> */
*p = '\0';
errbuf[0] = c;
errbuf[1] = '\0';
msg(errbuf);			/* .PRINT with <CR><LF> */
#else
(void) write(2, argv0, (unsigned)strlen(argv0));
(void) write(2, s, (unsigned)strlen(s));
errbuf[0] = c;
errbuf[1] = '\n';
(void) write(2, errbuf, 2);
#endif
}

int	opterr = 1;
int	optind = 1;
int	optopt;
char	*optarg;

int getopt(argc, argv, opts)
int	argc;
char	* const argv[];
const char *opts;
{
static int sp = 1;
register int c;
register char *cp;

if (sp == 1)
	{
	if (optind >= argc || argv[optind][0] != '-' || argv[optind][1] == '\0')
	return(EOF);
	else if (strcmp(argv[optind], "--") == 0)
	{
	optind++;
	return(EOF);
	}
	}
optopt = c = argv[optind][sp];
if (c == ':' || (cp=strchr(opts, c)) == NULL)
	{
	if (opterr)
	ERR(argv[0], ": illegal option -- ", c);
	if (argv[optind][++sp] == '\0')
	{
	optind++;
	sp = 1;
	}
	return('?');
	}
if (*++cp == ':')
	{
	if (argv[optind][sp+1] != '\0')
	optarg = &argv[optind++][sp+1];
	else if (++optind >= argc)
	{
	if (opterr)
		ERR(argv[0], ": option requires an argument -- ", c);
	sp = 1;
	return('?');
	}
	else
	optarg = argv[optind++];
	sp = 1;
	}
else
	{
	if (argv[optind][++sp] == '\0')
	{
	sp = 1;
	optind++;
	}
	optarg = NULL;
	}
return(c);
}

/*****************************************************************************
 * EDIT HISTORY
 * 11-Mar-87	Stephen McConnel - modified for DECUS C on RT-11
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
