/*	FILE:		MEMCHR.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	 7-Apr-87	BY: SMc - handle NULL argument
 *			20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	memchr - as defined by Unix System V
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL ((VOIDP)0)
#endif

/************************************************************************
 * NAME
 *    memchr
 * ARGUMENTS
 *    s - address of memory area
 *    c - character to search for
 *    n - size of memory area
 * DESCRIPTION
 *    search for the first occurrence of the character c in the first n
 *    characters of the memory area s
 * RETURN VALUE
 *    address of the first occurrence of c in memory area s, or NULL if c
 *    does not occur
 */
char *memchr( s, c, n )
char *s;
int c, n;
{
register int k;

if (s != NULL)
	{
	while (n--)
	{
	k = *s++;
	if (k == c)
		return( --s );
	}
	}
return( NULL );		/* signal that c was not found */
}
