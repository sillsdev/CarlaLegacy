/* FULLDISK.C - check if an error has occurred writing the output file
 *****************************************************************************
 *
 * void checkFileError(FILE *fp, const char *proc, const char *fname)
 *
 *****************************************************************************
 * Copyright 1985, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#include "rpterror.h"

extern int exitSafely P((int status));

#ifndef EXIT_FAILURE
#define	EXIT_FAILURE	1	/* Failing exit status.  */
#define	EXIT_SUCCESS	0	/* Successful exit status.  */
#endif

#if _MSC_VER >= 700
#ifndef _WINDOWS
#include <vmemory.h>
#endif
#endif

#ifdef __STDC__
void checkFileError(FILE *fp, const char *proc, const char *fname);
#endif

/************************************************************************
 * NAME
 *    checkFileError
 * ARGUMENTS
 *    fp    - output file FILE pointer
 *    proc  - procedure name
 *    fname - output file name
 * DESCRIPTION
 *    Check for an error in the output file.  If one occurred, delete the
 *    output file and exit the program with an error status.
 * RETURN VALUE
 */
void checkFileError(fp, proc, fname)
FILE *fp;
const char *proc;
const char *fname;
{
if (ferror(fp))
	{
	if (fname != NULL)
	{
	reportError(ERROR_MSG,
		"?%s-F-Output file error (disk may be full) -- %s deleted\n",
		proc, fname);
	fclose(fp);
	remove(fname);
	}
	else
	{
	reportError(ERROR_MSG,
		"?%s-F-Output file error (disk may be full)\n",
		proc);
	fclose(fp);
	}
#if _MSC_VER >= 700
#ifndef _WINDOWS
	_vheapterm();
#endif
#endif
	exitSafely(EXIT_FAILURE);
	}
}

/*****************************************************************************
 * EDIT HISTORY
 * 13-Nov-85	Steve McConnel
 * 14-Feb-86	SRMc - reformat & edit comments
 * 27-Mar-87	SRMc - minor rewrite
 * 11-Jul-90	SRMc - call wait_exit() only #ifdef rt11, call exit() otherwise
 *  8-Feb-93	SRMc - call _vheapterm() just to be safe for MSC 7.00
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 31-Jan-97	SRMc - fix for STDC_HEADERS
 * 17-Apr-97	SRMc - fix for inclusion in Windows DLL
 * 23-May-97	SRMc - renamed safe_exit() to exitSafely()
 * 28-May-97	SRMc - rename full_disk() to checkFileError()
 *		     - use reportError() instead of fputs() or MessageBox()
 * 11-Sep-97	SRMc - allow the filename argument to be NULL
 *  2-Oct-97	SRMc - fix for revised reportError()
 */
