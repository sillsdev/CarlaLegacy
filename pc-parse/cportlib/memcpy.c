/*	FILE:		MEMCPY.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	 7-Apr-87	BY: SMc - handle NULL arguments
 *			20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	memcpy - as defined by Unix System V
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
 *    memcpy
 * ARGUMENTS
 *    s1 - address of destination memory area
 *    s2 - address of source memory area
 *    n  - number of characters to move
 * DESCRIPTION
 *    Copy n characters from memory area s2 to memory area s1.  Note that
 *    overlapping moves are officially unpredictable.
 * RETURN VALUE
 *    address of memory area s1 (ie, original value of s1)
 */
char *memcpy( s1, s2, n )
register char *s1, *s2;
register int n;
{
register char *rp;

if ((s1 == NULL) || (s2 == NULL))
	return( NULL );
for ( rp = s1 ; n-- ; *s1++ = *s2++ )
	;
return( rp );
}
