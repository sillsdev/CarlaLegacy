/* CPYSTR.C - copy a string, returning address of the end of the destination
 *****************************************************************************
 *
 * char *cpystr(char *out, char *in)
 *
 *****************************************************************************
 * Copyright 1987, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif
#ifdef __STDC__
char *cpystr(char *out, char *in);
#endif

/************************************************************************
 * NAME
 *    cpystr
 * ARGUMENTS
 *    out - address of the output buffer
 *    in  - address of the NUL-terminated input string
 * DESCRIPTION
 *    Copy the input string to the output string.
 * RETURN VALUE
 *    address of the NUL byte which terminates the output string
 */
char *cpystr(out,in)
char *out;
char *in;
{
if ((out == NULL) || (in == NULL))
	return(out);
while ( (*out++ = *in++) != '\0' )
	;
return( --out );
}

/*****************************************************************************
 * EDIT HISTORY
 * 31-Mar-87	Stephen McConnel
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
