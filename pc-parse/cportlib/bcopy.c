/* BCOPY.C - copy the bytes from one array to another
 *****************************************************************************
 *
 * char *bcopy(char *src, char *dst, int size)
 *
 *****************************************************************************
 * Copyright 1989, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif

#ifdef __STDC__
char *bcopy(char *src, char *dst, int size);
#endif

/************************************************************************
 * NAME
 *    bcopy
 * ARGUMENTS
 *    src  - address of source memory area
 *    dst  - address of destination memory area
 *    size - number of characters to move
 * DESCRIPTION
 *    Copy size characters from memory area src to memory area dst.  Note that
 *    overlapping moves are officially unpredictable.
 * RETURN VALUE
 *    none
 */
char *bcopy( src, dst, size )
char *src;
char *dst;
int size;
{
if ((src == NULL) || (dst == NULL))
	return dst;
while (size--)
	*dst++ = *src++;
return dst;
}

/*****************************************************************************
 * EDIT HISTORY
 * 26-Aug-89	Steve McConnel
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
