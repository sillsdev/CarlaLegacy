/* RPTERROR.C - report an error, possibly killing the program
 ***************************************************************************
 *
 * char * reportError(int eMessageType_in, const char *pszFormat_in, ...)
 *
 ***************************************************************************
 * edit history is at the end of rpterror.h
 ***************************************************************************
 * Copyright 1992, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#if _MSC_VER >= 700
#include <io.h>		/* for _isatty(fd) */
#endif
#include "rpterror.h"
/*
 *  nonANSI standard library functions
 */
#ifndef isatty
extern int isatty P((int));
#endif
#ifndef fileno
extern int fileno P((FILE *));
#endif

/****************************************************************************
 * NAME
 *    reportError
 * ARGUMENTS
 *    bOffScreen_in - don't write to stderr if TRUE
 *    pszFormat_in     - printf format string for error message
 * DESCRIPTION
 *    report an error to the user,
 * RETURN VALUE
 *    none
 */
#ifdef HAVE_STDARG_H
void reportError(int eMessageType_in, const char *pszFormat_in, ...)
{
va_list marker;

va_start( marker, pszFormat_in );
#else
void reportError( va_alist )
{
va_list marker;
int	eMessageType_in;
char *	pszFormat_in;

va_start( marker );
eMessageType_in = va_arg( marker, int );
pszFormat_in    = va_arg( marker, char * );
#endif

#ifdef HAVE_VPRINTF
vfprintf(stderr, pszFormat_in, marker);
#ifdef _MSC_VER
if (!_isatty(_fileno(stdout)))
#else
if (!isatty(fileno(stdout)))
#endif
    {
    /* the newer versions of the gcc library don't let you reuse the va_list
     * marker, so we have to reinitialize it.  [April 2017, gcc 5.4)
     */
	va_end( marker );
#if HAVE_STDARG_H
	va_start( marker, pszFormat_in );
#else
	va_start( marker );
	eMessageType_in = va_arg( marker, int );
	pszFormat_in    = va_arg( marker, char * );
#endif
	vfprintf(stdout, pszFormat_in, marker);
    }
#else
#ifdef HAVE_DOPRNT
_doprnt(pszFormat_in, marker, stderr);
if (!isatty(fileno(stdout)))
	_doprnt(pszFormat_in, marker, stdout);
#endif
#endif
#ifdef _MSC_VER
if (!_isatty(_fileno(stdout)))
#else
if (!isatty(fileno(stdout)))
#endif
	fflush(stdout);
va_end( marker );
}
