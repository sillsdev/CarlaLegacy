/* BCMP.C - compare two byte arrays
 *****************************************************************************
 *
 * int bcmp(char *b1, char *b2, int length)
 *
 *****************************************************************************
 * Copyright 1987, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif

#ifdef __STDC__
int bcmp(char *b1, char *b2, int length);
#endif

/************************************************************************
 * NAME
 *    bcmp
 * ARGUMENTS
 *    b1     - address of first memory area
 *    b2     - address of second memory area
 *    length - number of bytes in each memory area
 * DESCRIPTION
 *    Compare memory area b1 against memory area b2 byte by byte.
 * RETURN VALUE
 *    zero if the memory areas are identical, nonzero otherwise
 */
int bcmp(b1, b2, length)
char *b1;
char *b2;
int length;
{
if ((b1 == NULL) || (b2 == NULL))
	return( 0 );
while ( length )
	{
	if (*b1++ != *b2++)
	break;
	--length;
	}
return( length );
}

/*****************************************************************************
 * EDIT HISTORY
 * 25-Feb-87	Stephen McConnel
 *  9-Apr-87	SRMc - handle NULL arguments
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
