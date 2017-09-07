/* STRPOS.C - find offset of the first occurrence of a character in a string
 *****************************************************************************
 *
 * int strpos(char *s, int ch)
 *
 *****************************************************************************
 * Copyright 1987, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL ((VOIDP)0)
#endif
#define NUL '\0'

#ifdef __STDC__
int strpos(const char *s, int ch);
#endif

/************************************************************************
 * NAME
 *    strpos
 * ARGUMENTS
 *    s - address of NUL-terminated character string
 *    c - character to search for
 * DESCRIPTION
 *    Search for the first occurrence of the character c in the string s.
 *    If the character c is found in the string, the position
 *    of the first occurrence is returned (where the first character of s
 *    is considered to be at position 0).  If the character is not found,
 *    the value -1 is returned.  The terminating NUL character is considered
 *    to be part of s for the purposes of the search, so searching for NUL
 *    returns the position of the terminated NUL (which is equal to the
 *    length of the string), not the value -1.  strpos(s,'\0') is therefore
 *    equivalent to strlen(s).
 * RETURN VALUE
 *    position of the first occurrence of c in s, or -1 if c does not
 *    occur in s
 */
int strpos(s,ch)
const char *s;
int ch;
{
char c;
const char *p;

c = ch;
if ((p = s) == NULL)
	return( -1 );
do  {
	if (*p == c)
	return( (int)(p - s) );
	} while (*p++ != NUL);
return( -1 );
}

/*****************************************************************************
 * EDIT HISTORY
 * 31-Mar-87	Steve McConnel - written from scratch
 *  3-Jun-92	SRMc - make second argument an int rather than a
 *			char for safety with THINK C compiler
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
