/*	FILE:		SWAPME.C
 *	DATE WRITTEN:	 7-Mar-87	BY: Steve McConnel
 *	DATE MODIFIED:	 7-Apr-87	BY: SMc - handle NULL arguments
 *			20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	swapmem - as defined by Aztec C
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif

/************************************************************************
 * NAME
 *    swapmem
 * ARGUMENTS
 *    s1  - address of first memory area
 *    s2  - address of second memory area
 *    len - size of memory areas
 * DESCRIPTION
 *    Swap the blocks of memory addressed by s1 and s2.
 *    No provision is made for overlapping swaps.
 * RETURN VALUE
 */
void swapmem(src,dest,length)
register char *src;
register char *dest;
int length;
{
register int temp;

if ((dest != NULL) && (src != NULL))
	{
	while ( length-- )
	{
	temp = *dest;
	*dest++ = *src;
	*src++ = temp;
	}
	}
}
