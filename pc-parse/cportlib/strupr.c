/* STRUPR.C - convert an ASCII string to all uppercase
 *****************************************************************************
 *
 * char *strupr(char *string)
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
char *strupr(char *string);
#endif

/************************************************************************
 * NAME
 *    strupr
 * ARGUMENTS
 *    string - address of string to capitalize
 * DESCRIPTION
 *    Convert all letters in a string to upper case.
 * RETURN VALUE
 *    original value of input argument
 */
char *strupr(string)
char *string;
{
char *p;
char c;

if (string == NULL)
	return(NULL);
for (p = string ; (c = *p) != NUL ; ++p)
	{
	if ((c >= 'a') && (c <= 'z'))
	*p &= ~040;
	}
return(string);
}

/*****************************************************************************
 * EDIT HISTORY
 * 31-Mar-87	Stephen McConnel
 * 19-Oct-95	SRMc - copy, rename to strupr()
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
