/* ERRCHECK.C - check for write errors when closing a file
 ***************************************************************************
 *
 * void fcloseWithErrorCheck(FILE *outfp, const char *filename)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1993, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <errno.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "rpterror.h"

#ifdef HAVE_STRERROR
extern char * strerror P((int error));
#else
#ifdef HAVE_SYS_ERRLIST
extern int sys_nerr;
extern char * sys_errlist[];
#endif
#endif

#ifdef _MSC_VER
#include <stdlib.h>
#define sys_errlist _sys_errlist
#endif

#ifdef __STDC__
void fcloseWithErrorCheck(FILE *outfp, const char *filename);
#endif

/***************************************************************************
 * NAME
 *    fcloseWithErrorCheck
 * ARGUMENTS:
 *    outfp    - output FILE pointer
 *    filename - name of the output file
 * DESCRIPTION
 *    check for write errors and close an output file
 * RETURN VALUE
 *    none
 */
void fcloseWithErrorCheck(outfp, filename)
FILE *outfp;
const char *filename;
{
if (outfp == (FILE *)NULL)
	return;
if ((filename == NULL) || (*filename == '\0'))
	filename = "the output file";
fflush(outfp);
#ifdef HAVE_STRERROR
if (ferror(outfp))
	reportError(ERROR_MSG,
		"Error writing %s: %s\n", filename, strerror(errno));
if (fclose(outfp))
	reportError(ERROR_MSG,
		"Error closing %s: %s\n", filename, strerror(errno));
#else
#ifdef HAVE_SYS_ERRLIST
if (ferror(outfp))
	reportError(ERROR_MSG,
		"Error writing %s: %s\n", filename, sys_errlist[errno]);
if (fclose(outfp))
	reportError(ERROR_MSG,
		"Error closing %s: %s\n", filename, sys_errlist[errno]);
#else
if (ferror(outfp))
	reportError(ERROR_MSG, "Error writing %s\n", filename);
if (fclose(outfp))
	reportError(ERROR_MSG, "Error closing %s\n", filename);
#endif
#endif
}

/*****************************************************************************
 * EDIT HISTORY
 * 17-May-93	SRMc - write from scratch
 * 14-Oct-96	SRMc - change #include "opaclib.h" to #include "rpterror.h"
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 31-Jan-97	SRMc - remove #include <stdlib.h>
 * 25-Feb-97	SRMc - use either strerror() or sys_errlist[], but not perror()
 * 22-May-97	SRMc - renamed errcheck_fclose() to fcloseWithErrorCheck()
 *  2-Oct-97	SRMc - fix for revised reportError()
 *  2-Apr-98	SRMc - fix for conflict with POSIX header file
 */
