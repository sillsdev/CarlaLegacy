/* MEMMOVE.C - move a block of memory, carefully handling overlaps
 ***************************************************************************
 *
 *	VOIDP memmove( dst, src, size )
 *	VOIDP       dst;
 *	const VOIDP src;
 *	unsigned    size;
 *
 ***************************************************************************
 * Copyright 1989, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif

#ifdef applec
#pragma segment S_cportlib
#endif

#ifdef _MSC_VER
#include <stddef.h>
#endif

/*************************************************************************
 * NAME
 *    memmove
 * ARGUMENTS
 *    dst  - pointer to destination in memory
 *    src  - pointer to source in memory
 *    size - number of bytes (char's) to move
 * DESCRIPTION
 *    Move size bytes from src to dst, handling overlaps properly
 *    (bytes get copied before they get overwritten).
 * RETURN VALUE
 *    src
 */
VOIDP memmove(dst,src,size)
VOIDP		dst;
const VOIDP	src;
size_t		size;
{
register char *pd, *ps;

if (!(pd = (char *)dst) || !(ps = (char *)src))
	return( (VOIDP)src );		/* don't allow null pointers! */
if (ps < pd)
	{
	for ( ps += size, pd += size ; size-- ; *--pd = *--ps )
	;		/* copy from the end handles overlaps */
	}
else if (ps > pd)
	{
	for ( ; size-- ; *pd++ = *ps++ )
	;		/* copy from the beginning handles overlaps */
	}
return( (VOIDP)dst );
}

/***************************************************************************
 * EDIT HISTORY
 * 20-May-89	Steve McConnel - dust off SHIFT.C from CPORT library
 * 27-Jul-94	SRMc - #ifndef NULL added
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 20-Jan-97	SRMc - fix incorrect return value: dst, not src!
 *		     - fix for ANSI compliance with "const"
 *  1-Apr-98   hab  - fix for MSC VC++ 5.0: add #include <stddef.h>
 */
