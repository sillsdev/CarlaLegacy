/* UFOPEN.C - "user friendly" wrapper for fopen()
 *****************************************************************************
 *
 * FILE * fopenAlways(char *fname, char *mode)
 *
 *****************************************************************************
 * Copyright 1982, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef HAVE_UNISTD_H
#include <unistd.h>
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
extern char * strcpy  P((char * dest, const char * src));
extern char * strchr  P((const char * s, int c));
#endif /*STDC_HEADERS*/
#ifdef _MSC_VER
#include <io.h>
#endif

#ifndef isatty
extern int isatty P((int fd));
#endif
#ifndef fileno
extern int fileno P((FILE*));
#endif

extern char * trimTrailingWhitespace P((char * pszString_io));

#ifdef UNIX
#define TTY "/dev/tty"
#endif
#ifdef MSDOS
#define TTY "CON"
#endif
#ifndef FILENAME_MAX
#define FILENAME_MAX 128
#endif
#define GOOD_MODES "rwa"

static char *okayout[] =
	{
#ifdef UNIX
	"/dev/null",
#endif
#ifdef MSDOS
	"NUL", "nul", "AUX", "aux", "COM1", "com1", "COM2", "com2", "PRN", "prn",
#endif
	NULL
	};

#ifdef __STDC__
FILE * fopenAlways(char * fname, char * mode);
#endif

/************************************************************************
 * NAME
 *    out_okay
 * ARGUMENTS
 *    name - filename to try
 * DESCRIPTION
 *    Check whether or not it's okay to open the file for output.
 * RETURN VALUE
 *    nonzero if it's okay to open the file for output, zero if it should
 *    not be opened for output
 */
static int out_okay(name)
register char *name;
{
register char **table;
char response[4];		/* space for keyboard response */
FILE *fp;

if ((fp = fopen(name,"r")) == NULL)
	return( 1 );		/* okay if file doesn't exist */

if (isatty(fileno(fp)))
	{
	fclose(fp);
	return( 1 );		/* okay if file is TTY device */
	}
fclose(fp);
for ( table = okayout ; *table ; ++table )
	{
	if (strcmp(name,*table)==0)
	return( 1 );		/* okay if file on approved list */
	}
/*
 *  file exists -- check with user for what to do
 */
fprintf(stderr, "\n\"%s\" already exists.  Overwrite it? [n] ", name );
#ifdef TTY
fp = fopen(TTY, "r");
fgets(response, 4, fp);
fclose(fp);
#else
fgets(response, 4, stdin);
#endif

return( (response[0] == 'Y') || (response[0] == 'y') );
}

/************************************************************************
 * NAME
 *    fopenAlways
 * ARGUMENTS
 *    fname - filename to try, or null if a prompt is desired
 *    mode  - file mode for fopen() ("r", "w", or "a")
 * DESCRIPTION
 *    Open a file, retrying until successful.  `fname' is updated to
 *    contain the name of the file actually opened (unless the NULL
 *    pointer is passed).
 * RETURN VALUE
 *    FILE pointer
 */
FILE * fopenAlways(fname, mode)
char *	fname;
char *	mode;
{
char	szFileName[FILENAME_MAX];	/* space for new file name */
FILE *	fp;				/* file pointer to return */
/*
 *  establish working mode for opening file
 */
if (strchr(GOOD_MODES,*mode) == (char *)NULL)
	{
	fprintf(stderr, "\nUFOPEN-W-BAD MODE--opening file for reading.\n");
	mode = "r";
	}
/*
 *  get filename if not provided by caller
 */
if ((fname == (char *)NULL) || (*fname == '\0'))
	{
	fprintf(stderr, "\n\t%s file: ", (*mode=='r') ? "Input" : "Output");
	fgets(szFileName, FILENAME_MAX, stdin);
	trimTrailingWhitespace(szFileName);
	if (!isatty(fileno(stdin)))
	fprintf(stderr, "%s\n", szFileName);
	}
else
	strcpy(szFileName, fname);
/*
 *  retry until successful
 */
for (;;)
	{
	if (    (szFileName[0] != '\0') &&		/* skip over null filenames */
		(szFileName[0] != '\n') &&
		((mode[0] != 'w') || out_okay(szFileName)) &&
		((fp = fopen(szFileName,mode)) != NULL))
	break;				/* file opened okay */
	/*
	 *  get a new filename from the user at the keyboard
	 */
	fprintf(stderr, "\nCan't open %s file, %s\n\t\tRetry: ",
		((mode[0] == 'r') ? "input" : "output"), szFileName);
#ifdef TTY
	fp = fopen(TTY, "r");
	fgets(szFileName, FILENAME_MAX, fp);
	fclose(fp);
#else
	fgets(szFileName, FILENAME_MAX, stdin);
#endif
	trimTrailingWhitespace(szFileName);
	}
/*
 *  return the actual filename opened as fname if possible
 */
if (fname != NULL)
	strcpy(fname, szFileName);
return(fp);
}

/******************************************************************************
 * EDIT HISTORY
 * 17-MAY-82	BY: D. Weber/Bob Kasper
 *  7-MAR-85	hab
 * 11-Oct-85	SRMc - port to Unix & MSDOS
 * 20-Feb-86	SRMc - reformat & edit comments
 * 15-Dec-86	SRMc - allow append ("a") mode
 * 16-Jan-87	SRMc - check whether output file already exists
 * 28-Mar-87	SRMc - remove RT-11 stuff (that now has MACRO-11 source)
 * 13-Apr-87	SRMc - fix bug in scanning table of valid output devices
 * 28-Oct-88	SRMc - change #ifdef BSD4 to #ifdef unix
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 *		     - fix for Macintosh (Metrowerks 10)
 * 23-May-97	SRMc - rename ufopen() to fopenAlways()
 *		     - use FILENAME_MAX if it is defined
 *		     - use fgets() and trimTrailingWhitespace() instead of
 *			fgetss()
 */
