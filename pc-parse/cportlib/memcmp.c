/*	FILE:		MEMCMP.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	 7-Apr-87	BY: SMc - handle NULL arguments
 *			20-Oct-95	SRMc - fix for config.h (Autoconf)
 *					     - handle 8-bit data unsignedly
 *
 *	FUNCTIONS:	memcmp - as defined by Unix System V
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif

/************************************************************************
 * NAME
 *    memcmp
 * ARGUMENTS
 *    s1 - address of first memory area
 *    s2 - address of second memory area
 *    n  - number of characters to compare
 * DESCRIPTION
 *    Compare the first n characters of memory area s1 with the first n
 *    characters of memory area s2.
 * RETURN VALUE
 *    integer less than, equal to, or greater than zero, indicating that
 *    s1 is lexicographically less than, equal to, or greater than s2
 */
int memcmp( s1, s2, n )
register char *s1, *s2;
register int n;
{
if ((s1 != NULL) && (s2 != NULL))
	{
	while (n--)
	{
	if ((unsigned char)*s1 < (unsigned char)*s2)
		return( -1 );
	else if ((unsigned char)*s1++ > (unsigned char)*s2++)
		return( 1 );
	}
	}
return( 0 );		/* strings lexically equal */
}
