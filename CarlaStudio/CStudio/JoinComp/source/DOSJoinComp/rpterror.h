/* RPTERROR.H - report (error) messages to the user
 ***************************************************************************
 *
 *	NumberedMessage (struct)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1992, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _RPTERROR_H_INCLUDED
#define _RPTERROR_H_INCLUDED
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_STDARG_H
#include <stdarg.h>
#else
#include <varargs.h>
#endif

/****************************************************************************
 * NAME
 *    NumberedMessage
 * DESCRIPTION
 *    structure for both a number and a printf() style format string for an
 *    error message
 */
typedef struct {
	int		eType;
	unsigned	uiNumber;
	char *	pszMessage;
	} NumberedMessage;
/*
 *  values for the types of messages (eType)
 */
#define ERROR_MSG   1		/* severe error that aborts command */
#define WARNING_MSG 0		/* minor error that user should be told */
#define DEBUG_MSG   -1		/* debugging message that user doesn't need */

/* numbrmsg.c */
extern void displayNumberedMessage P((const NumberedMessage * pMessage_in,
					  int		      bSilent_in,
					  int		      bShowWarnings_in,
					  FILE *		      pLogFP_in,
					  const char *            pszFilename_in,
					  unsigned                uiLineNumber_in,
					  ...));

/* rpterror.c */
extern void reportError P((int eMessageType_in,
			   const char * pszFormat_in,
			   ...));

/* rptmessg.c */
extern void reportMessage P((int bNotSilent_in,
				 const char * pszFormat_in,
				 ...));

/***************************************************************************
 * EDIT HISTORY
 *  4-Sep-92	SRMc - original creation of report_error()
 *  8-Sep-92	SRMc - original creation of report_message()
 * 26-May-93	SRMc - handle stupid renaming of functions by MSC 7.00
 * 15-Dec-93	SRMc - print newline after the message
 *  2-Nov-94	SRMc - added DEBUGMSG definition
 * 21-Nov-94	SRMc - fix rptmessg.c to use rpterror.h and USE_STDARG
 * 12-Jul-95	SRMc - add const to declaration of format arguments
 * 23-Oct-95	SRMc - fix for config.h (Autoconf)
 *  7-Aug-96	SRMc - don't write \n after message
 * 10-Oct-96	SRMc - change exit() to safe_exit()
 * 14-Oct-96	SRMc - change #include "opaclib.h" to extern int safe_exit()
 * 30-Oct-96	SRMc - add reportFileError()
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 31-Jan-97	SRMc - remove #include <stdlib.h>
 *		     - replace <stdarg.h> or <varargs.h> with "rpterror.h"
 *			(which has the prototype)
 *		     - fix for HAVE_VPRINTF and HAVE_DOPRNT
 * 12-Feb-97	SRMc - rename report_error() to reportError()
 *		     - rename report_message() to reportMessage()
 * 23-May-97	SRMc - renamed safe_exit() to exitSafely()
 * 29-May-97	SRMc - move reportFileError() to CMD library
 * 25-Jul-97	SRMc - move displayNumberedMessage() (formerly
 *			reportFileError() aka displayCmdMessage()) from CMD
 *			library
 *		     - remove global variables from displayNumberedMessage()
 *			by making them function arguments
 *  2-Oct-97	SRMc - change first argument of reportError() from a possible
 *			exit status value to a message type, as defined for
 *			NumberedMessage
 *		     - add bNotSilent_in argument to reportMessage()
 *  8-Oct-97	SRMc - cosmetic changes and proofreading
 * 21-Jul-98	SRMc - fix a typo in a comment
 */
#endif /* _RPTERROR_H_INCLUDED */
