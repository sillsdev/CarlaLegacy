/*	FILE:		STRSPN.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	20-Oct-95	SRMc - fix for config.h (Autoconf)
 *  1-Apr-98   hab  - fix for MSC VC++ 5.0: add #include <stddef.h>
 *
 *	FUNCTIONS:	strspn - as defined by Unix System V
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifndef NULL
#define NULL ((VOIDP)0)
#endif

#ifdef _MSC_VER
#include <stddef.h>
#endif

#define NUL '\0'

/************************************************************************
 * NAME
 *    strspn
 * ARGUMENTS
 *    s1 - address of NUL-terminated character string
 *    s2 - address of NUL-terminated set of characters
 * DESCRIPTION
 *    Skip over the initial segment of s1 which consists entirely of
 *    characters from s2.
 * RETURN VALUE
 *    length of the initial segment of s1 which consists entirely of
 *    characters from s2
 */
size_t strspn(s1, s2)
char *s1, *s2;
{
register int c;
register char *p;
register size_t len;

if ((s1 == NULL) || (s2 == NULL))
	return( 0 );

for ( len = 0 ; (c = *s1++) != NUL ; ++len )
	{
	for ( p = s2 ; *p != NUL ; ++p )
	{
	if (c == *p)
		break;
	}
	if (*p == NUL)
	break;			/* couldn't find it */
	}
return( len );
}
