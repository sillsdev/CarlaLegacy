/* ABS.C - return the absolute value of an integer
 *****************************************************************************
 *
 * int abs(int i)
 *
 *****************************************************************************
 * Copyright 1987, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef __STDC__
int abs(int i);
#endif

/*****************************************************************************
 * NAME
 *    abs
 * ARGUMENTS
 *    i - integer
 * DESCRIPTION
 *    compute the absolute value of an integer
 * RETURN VALUE
 *    absolute value of i
 */
int abs(i)
int i;
{
return( (i < 0) ? -i : i );
}

/*****************************************************************************
 * EDIT HISTORY
 * 13-Feb-87	Steve McConnel
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
