/*	FILE:		ZAPNL.C
 *	DATE WRITTEN:	 2-Sep-86	BY: SRMc
 *	DATE MODIFIED:	26-Mar-87	BY: SRMc - reformat, minor rewrite
 *			20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	zapnl - as developed for CADA
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif
#define NUL '\0'

/************************************************************************
 * NAME
 *    zapnl
 * ARGUMENTS
 *    s - address of a NUL-terminated string
 * DESCRIPTION
 *    Remove any trailing newlines from the string.
 * RETURN VALUE
 *    s (unchanged address)
 */
char *zapnl(s)
register char *s;
{
register char *p;

if ((p = s) != NULL)
	{
	while (*p)				/* move to end of string */
	++p;
	while ((--p >= s) && (*p == '\n'))	/* replace trailing newlines */
	*p = NUL;
	}
return(s);
}
