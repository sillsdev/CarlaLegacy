/* INDEX.C - first the first occurrence of a character in a string
 *****************************************************************************
 *
 * char *index(char *s, int c)
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

#ifdef index
#undef index
#endif
#ifdef __STDC__
char *index(char *s, int c);
#endif

/************************************************************************
 * NAME
 *    index
 * ARGUMENTS
 *    s - address of NUL-terminated character string
 *    c - character to search for
 * DESCRIPTION
 *    Search for the first occurrence of the character c in the string s.
 *    This is the same as the System V function strchr().
 * RETURN VALUE
 *    address of the first occurrence of c in s, or NULL if c does not
 *    occur in s
 */
char *index( s, c )
char *s;
int c;
{
register int k;

if (s == NULL)
	return( NULL );
do  {
	k = *s++;
	if (k == c)
	return( --s );
	} while (k != NUL );
return( NULL );		/* signal that c was not found */
}

/*****************************************************************************
 * EDIT HISTORY
 *  3-Jan-89	Stephen McConnel (code stolen from strchr.c)
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
