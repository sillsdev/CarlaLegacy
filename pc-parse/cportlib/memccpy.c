/* MEMCCPY.C - copy n characters from s2 unless byte value c happens first
 *****************************************************************************
 *
 * char *memccpy(char *s1, char *s2, int c, int n)
 *
 *****************************************************************************
 * Copyright 1987, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL ((VOIDP)0)
#endif

#ifdef __STDC__
char *memccpy(char *s1, char *s2, int c, int n);
#endif

/************************************************************************
 * NAME
 *    memccpy
 * ARGUMENTS
 *    s1 - address of destination memory area
 *    s2 - address of source memory area
 *    c  - terminating character
 *    n  - number of characters to move
 * DESCRIPTION
 *    Copy characters from memory area s2 to memory area s1, stopping after
 *    n characters have been transferred, or after the first occurrence of
 *    character c has been copied, whichever comes first.  Note that
 *    overlapping moves are officially unpredictable.
 * RETURN VALUE
 *    address of the character after the copy of c in s1, or NULL if c is
 *    not found in the first n characters following s2
 */
char *memccpy( s1, s2, c, n )
char *s1;
char *s2;
int c;
int n;
{
register int k;

if ((s1 != NULL) && (s2 != NULL))
	{
	while (n--)
	{
	k = *s2++;
	*s1++ = k;
	if ((unsigned char)k == (unsigned char)c)
		return( s1 );
	}
	}
return( NULL );		/* signal that c was not found */
}

/*****************************************************************************
 * EDIT HISTORY
 * 10-Feb-87	BY: Steve McConnel
 *  7-Apr-87	BY: SMc - handle NULL arguments
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 *		     - handle 8-bit data unsignedly
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
