/* RINDEX.C - find the last occurrence of a character in a string
 *****************************************************************************
 *
 * char *rindex(char *s, int c)
 *
 *****************************************************************************
 * Copyright 1989, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL ((VOIDP)0)
#endif
#define NUL '\0'

#ifdef rindex
#undef rindex
#endif
#ifdef __STDC__
char *rindex(char *s, int c);
#endif

/************************************************************************
 * NAME
 *    rindex
 * ARGUMENTS
 *    s - address of NUL-terminated character string
 *    c - character to search for
 * DESCRIPTION
 *    Search for the last occurrence of the character c in the string s.
 *    This is the same as the System V function strrchr().
 * RETURN VALUE
 *    address of the last occurrence of c in s, or NULL if c does not
 *    occur in s
 */
char *rindex( s, c )
char *s;
int c;
{
int k;
char *q;

if (s == NULL)
	return( NULL );
q = NULL;
do  {
	k = *s++;
	if (k == c)
	q = s-1;
	} while (k != NUL );
return( q );
}

/*****************************************************************************
 * EDIT HISTORY
 *  3-Jan-89	Stephen McConnel (code stolen from strrchr.c)
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
