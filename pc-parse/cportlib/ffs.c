/* FFS.C - find first set bit in an integer
 *****************************************************************************
 *
 * int ffs(int i)
 *
 *****************************************************************************
 * Copyright 1987, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef __STDC__
int ffs(int i);
#endif

/************************************************************************
 * NAME
 *    ffs
 * ARGUMENTS
 *    i - integer value
 * DESCRIPTION
 *    Find the first bit set in the argument value.
 * RETURN VALUE
 *    index of first bit which is set to 1, starting with least significant
 *    bit having index value 0; or -1 if the argument is zero
 */
int ffs(i)
int i;
{
register int k;

if (i == 0)
	return( -1 );
for (k = 0 ; (i & 01) == 0 ; i >>= 1, ++k )
	;
return( k );
}

/*****************************************************************************
 * EDIT HISTORY
 * 25-Feb-87	Stephen McConnel
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
