/* NUMBRMSG.C - report an error to the user with error number, line, filename
 ***************************************************************************
 *
 * void displayNumberedMessage(const NumberedMessage * pErrMessage_in,
 *			       int		       bSilentMessages_in,
 *			       int		       bShowWarnings_in,
 *			       FILE *		       pLogFP_in,
 *			       const char *            pszFilename_in,
 *			       unsigned                uiLineNumber_in,
 *			       ...));
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1996, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
extern char * strcat  P((char * dest, const char * src));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "rpterror.h"

#ifdef applec
#pragma segment S_cmdlib
#endif

/****************************************************************************
 * NAME
 *    displayNumberedMessage
 * DESCRIPTION
 *    Print an error message with zero or more arguments, also printing the
 *    associated error number, an optional file line number, and an optional
 *    filename.
 * RETURN VALUE
 *    none
 */
#ifdef HAVE_STDARG_H
void displayNumberedMessage(const NumberedMessage * pErrMessage_in,
				int                     bSilentMessages_in,
				int                     bShowWarnings_in,
				FILE *                  pLogFP_in,
				const char *            pszFilename_in,
				unsigned                uiLineNumber_in,
				...)
#else
/*VARARGS*/
void displayNumberedMessage(pErrMessage_in,
				bSilentMessages_in, bShowWarnings_in, pLogFP_in,
				pszFilename_in, uiLineNumber_in,
				va_alist)
const NumberedMessage *	pErrMessage_in;
int                     bSilentMessages_in;
int                     bShowWarnings_in;
FILE *                  pLogFP_in;
const char *		pszFilename_in;
unsigned		uiLineNumber_in;
va_dcl
#endif
{
va_list ap;
char errmsgbuffer[256];

#ifdef HAVE_STDARG_H
va_start(ap, uiLineNumber_in);
#else
va_start(ap);
#endif

if (	(bSilentMessages_in && (pLogFP_in == NULL)) ||
	(!bShowWarnings_in  && (pErrMessage_in->eType != ERROR_MSG)) )
	{
	va_end(ap);
	return;			/* not interested in this message */
	}
if (pErrMessage_in->eType == ERROR_MSG)
	sprintf(errmsgbuffer, "\nERROR %03u", pErrMessage_in->uiNumber );
else
	sprintf(errmsgbuffer, "\nWARNING %03u", pErrMessage_in->uiNumber );
if (uiLineNumber_in != 0)
	{
	sprintf(errmsgbuffer + strlen(errmsgbuffer), " on line %u",
		uiLineNumber_in);
	if (pszFilename_in != (char *)NULL)
	sprintf(errmsgbuffer + strlen(errmsgbuffer), " of %s",
		pszFilename_in);
	}
else if (pszFilename_in != NULL)
	sprintf(errmsgbuffer + strlen(errmsgbuffer), " in %s", pszFilename_in);
strcat(errmsgbuffer, ":\n");

if (!bSilentMessages_in)
	{
	fputs(errmsgbuffer, stderr);
	fputs("    ", stderr);
#ifdef HAVE_VPRINTF
	vfprintf(stderr, pErrMessage_in->pszMessage, ap );
#else
#ifdef HAVE_DOPRNT
	_doprnt(pErrMessage_in->pszMessage, ap, stderr);
#endif
#endif
	fputc('\n', stderr);
	if (pErrMessage_in->eType == ERROR_MSG)
	fputc('\n', stderr);
	}
if (pLogFP_in != NULL)
	{
	fputs(errmsgbuffer, pLogFP_in);
	fputs("    ", pLogFP_in);
#ifdef HAVE_VPRINTF
	vfprintf(pLogFP_in, pErrMessage_in->pszMessage, ap );
#else
#ifdef HAVE_DOPRNT
	_doprnt(pErrMessage_in->pszMessage, ap, pLogFP_in);
#endif
#endif
	fputc('\n', pLogFP_in);
	if (pErrMessage_in->eType == ERROR_MSG)
	fputc('\n', pLogFP_in);
	}

va_end(ap);
}

/*****************************************************************************
 * EDIT HISTORY
 *  X-Xxx-96	SRMc - extract from cmdlib/rpterror.c
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 31-Jan-97	SRMc - fix for HAVE_VPRINTF and HAVE_DOPRNT
 *  5-Jun-97	SRMc - rename function and global variables
 *		     - make function parameters const
 * 28-Jul-97	SRMc - move from CMD library to OPAC library, renaming the
 *			function to displayNumberedMessage()
 *		     - reorganize the function arguments
 */
