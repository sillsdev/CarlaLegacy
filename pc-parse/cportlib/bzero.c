/* BZERO.C - set the bytes of an array all to zero
 *****************************************************************************
 *
 * void bzero(char *dst, unsigned size)
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
#define NUL '\0'

#ifdef __STDC__
void bzero(char *dst, unsigned size);
#endif

/************************************************************************
 * NAME
 *    bzero
 * ARGUMENTS
 *    dst  - address of buffer to clear
 *    size - number of bytes to clear
 * DESCRIPTION
 *    Zero out a block of memory.  This is a 4.2BSD Unix function.
 * RETURN VALUE
 *    none
 */
void bzero(dst, size)
char *dst;
unsigned size;
{
if (dst != NULL)
	{
	while ( size-- )
	*dst++ = NUL;
	}
}

/*****************************************************************************
 * EDIT HISTORY
 * 26-Aug-89	Steve McConnel
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
