/*	FILE:		STRCSP.C
 *	DATE WRITTEN:	12-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	strcspn - as defined by Unix System V
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
 *    strcspn
 * ARGUMENTS
 *    s1 - address of NUL-terminated character string
 *    s2 - address of NUL-terminated set of characters
 * DESCRIPTION
 *    Skip over the initial segment of s1 which consists entirely of
 *    characters not from s2.
 * RETURN VALUE
 *    length of the initial segment of s1 which consists entirely of
 *    characters not from s2
 */
int strcspn(s1, s2)
char *s1, *s2;
{
register int c, len;
register char *p;

if (s1 == NULL)
	return( 0 );
if (s2 == NULL)
	s2 = "";		/* treat NULL and "" as equivalent... */

for ( len = 0 ; (c = *s1++) != NUL ; ++len )
	{
	for ( p = s2 ; *p != NUL ; ++p )
	{
	if (c == *p)
		return( len );		/* found one */
	}
	}
return( len );
}
