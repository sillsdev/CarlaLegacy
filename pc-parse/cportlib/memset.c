/*	FILE:		MEMSET.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	 7-Apr-87	BY: SMc - handle NULL argument
 *			20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	memset - as defined by Unix System V
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif


#ifdef applec
#pragma segment S_cportlib
#endif

/************************************************************************
 * NAME
 *    memset
 * ARGUMENTS
 *    s - address of memory area
 *    c - character to fill s with
 *    n - number of characters to fill
 * DESCRIPTION
 *    Set the first n characters of memory area s to the value of
 *    character c.
 * RETURN VALUE
 *    address of memory area s (ie, original value of s)
 */
char *memset( s, c, n )
char *s;
register int c, n;
{
register char *p;

if (s != NULL)
	{
	for ( p = s ; n-- ; *p++ = c )
	;
	}
return( s );
}
