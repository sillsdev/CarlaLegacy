/* RPTMESSG.C - report a message to the user
 ***************************************************************************
 *
 * void reportMessage(int bNotSilent_in, const char *fmt, ...);
 *
 ***************************************************************************
 * edit history is at the end of rpterror.h
 ***************************************************************************
 * Copyright 1992, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include "rpterror.h"

#ifdef applec
#pragma segment S_errormsg
#endif

/****************************************************************************
 * NAME
 *    reportMessage
 * ARGUMENTS
 *    msg_fmt  - format string for this message
 *    va_alist - zero or more arguments for message
 * DESCRIPTION
 *    Print a message with zero or more arguments.
 * RETURN VALUE
 *    none
 */
#ifdef HAVE_STDARG_H
void reportMessage(int bNotSilent_in, const char *msg_fmt, ...)
#else
/*VARARGS*/
void reportMessage(bNotSilent_in, msg_fmt, va_alist)
int		bNotSilent_in;
const char *	msg_fmt;
va_dcl
#endif
{
va_list ap;
#ifdef HAVE_STDARG_H
va_start(ap, msg_fmt);
#else
va_start(ap);
#endif
#ifdef HAVE_VPRINTF
if (bNotSilent_in)
	vfprintf(stderr, msg_fmt, ap );
#else
#ifdef HAVE_DOPRNT
if (bNotSilent_in)
	_doprnt(msg_fmt, ap, stderr);
#endif
#endif
va_end(ap);
}
