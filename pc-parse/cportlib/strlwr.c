/* STRLWR.C - convert all letters in a string to lowercase
 *****************************************************************************
 *
 * char *strlwr(char *string)
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
#define NUL '\0'

#ifdef __STDC__
char *strlwr(char *string);
#endif

/*****************************************************************************
 * NAME
 *    strlwr
 * ARGUMENTS
 *    string - address of string to convert to lower case
 * DESCRIPTION
 *    Convert all upper case letters in a string to lower case.
 * RETURN VALUE
 *    original value of input argument
 */
char *strlwr(string)
char *string;
{
char *p;
char c;

if (string == NULL)
	return(NULL);
for (p = string ; (c = *p) != NUL ; ++p)
	{
	if ((c >= 'A') && (c <= 'Z'))
	*p |= 040;
	}
return(string);
}

/*****************************************************************************
 * EDIT HISTORY
 * 31-Mar-87	Stephen McConnel
 * 12-Jan-91	SRMc - reformat slightly, rename file to STRLOWER.C
 * 14-Jan-91	SRMc - rename function to strlwr(), file to STRLWR.C,
 *			for compatibility with Microsoft C function
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
