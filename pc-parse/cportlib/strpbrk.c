/*	FILE:		STRPBR.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	strpbrk - as defined by Unix System V
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL ((VOIDP)0)
#endif
#define NUL '\0'

/************************************************************************
 * NAME
 *    strpbrk
 * ARGUMENTS
 *    s1 - address of NUL-terminated character string
 *    s2 - address of NUL-terminated set of characters to search for
 * DESCRIPTION
 *    Find the first occurrence in s1 of any character from s2.
 * RETURN VALUE
 *    address of the first occurrence in s1 of any character from s2,
 *    or NULL if no character from s2 occurs in s1
 */
char *strpbrk(s1, s2)
char *s1, *s2;
{
register char *p;
register int c;

if ((s1 == NULL) || (s2 == NULL))
	return( NULL );
while ( (c = *s1++) != NUL )
	{
	for ( p = s2 ; (*p != NUL) ; ++p )
	{
	if (*p == c)
		return( s1-1 );
	}
	}
return( NULL );
}
