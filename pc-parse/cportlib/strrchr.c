/*	FILE:		STRRCH.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	strrchr - as defined by Unix System V
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
 *    strrchr
 * ARGUMENTS
 *    s - address of NUL-terminated character string
 *    c - character to search for
 * DESCRIPTION
 *    Search for the last occurrence of the character c in the string s.
 *    This is the same as the 4.2BSD function rindex().
 * RETURN VALUE
 *    address of the last occurrence of c in s, or NULL if c does not
 *    occur in s
 */
char *strrchr( s, c )
register char *s;
register int c;
{
register int k;
register char *q;

if (s == NULL)
	return( NULL );
q = NULL;
do  {
	k = *s++;
	if (k == c)
	q = s-1;
	} while (k != NUL );
return( q );
}
