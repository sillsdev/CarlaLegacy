/* STRRPBRK.C - find the last occurrence in 1st string of any char from 2nd
 *****************************************************************************
 *
 * char *strrpbrk(char *s1, char *s2)
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
char *strrpbrk(char *s1, char *s2);
#endif

/************************************************************************
 * NAME
 *    strrpbrk
 * ARGUMENTS
 *    s1 - address of NUL-terminated character string
 *    s2 - address of NUL-terminated set of characters to search for
 * DESCRIPTION
 *    strrpbrk() searches the NUL-terminated string s1 for occurrences of
 *    characters from the NUL-terminated string s2.  The second argument
 *    is regarded as a set of characters; the order of the characters, or
 *    whether there are duplications, does not matter.  If such a character
 *    is found within s1, then a pointer to the last such character is
 *    returned.  If no character within s1 occurs in s2, then a null
 *    character pointer (NULL) is returned.  See also strpbrk(), which
 *    searches for the first character in s1 that is also in s2.
 * RETURN VALUE
 *    address of the last occurrence in s1 of any character from s2,
 *    or NULL if no character from s2 occurs in s1
 */
char *strrpbrk(s1,s2)
char *s1, *s2;
{
char *ps, *ps2, *q, c;

if (((ps = s1) == NULL) || (s2 == NULL))
	return( NULL );
for ( q = NULL ; *ps ; ++ps)
	{
	for ( ps2 = s2, c = *ps ; (*ps2 != NUL) ; ++ps2 )
	{
		if (*ps2 == c)
		{
		q = ps;
		break;
		}
	}
	}
return( q );
}

/*****************************************************************************
 * EDIT HISTORY
 * 24-Feb-87	Steve McConnel
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
