/*	FILE:		STRCHR.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	strchr - as defined by Unix System V
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
 *    strchr
 * ARGUMENTS
 *    s - address of NUL-terminated character string
 *    c - character to search for
 * DESCRIPTION
 *    Search for the first occurrence of the character c in the string s.
 *    This is the same as the 4.2BSD function index().
 * RETURN VALUE
 *    address of the first occurrence of c in s, or NULL if c does not
 *    occur in s
 */
char *strchr( s, c )
register char *s;
register int c;
{
register int k;

if (s == NULL)
	return( NULL );
do  {
	k = *s++;
	if (k == c)
	return( --s );
	} while (k != NUL );
return( NULL );		/* signal that c was not found */
}
