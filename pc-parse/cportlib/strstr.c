/* STRSTR.C - search the first string for the second string
 *****************************************************************************
 * Copyright 1996 by Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif

/************************************************************************
 * NAME
 *    strstr
 * ARGUMENTS
 *    s - string to search in
 *    t - string to search for
 * DESCRIPTION
 *    Search for the position of the second string in the first.
 * RETURN VALUE
 *    pointer to first location of second string within the first.
 *    NULL if the second string is not a substring of the first.
 */
char *strstr(s, t)
char *s, *t;
{
register char *s1, *t1;
register char c;
register char *s2;

s1 = s;
t1 = t;
if ((!t1) || (!*t1))
	return(s1);		/* NULL string is a member of any string */
if ((!s1) || (!*s1))
	return(NULL);	/* nothing else is a member of the NULL string */
for (;;)
	{
	c = *t1++;		/* look for the first character in search pattern */
	while (*s1 != c)
	{
	if (*s1++ == '\0')
		return(NULL);
	}
	s2 = ++s1;
	do	{		/* found it, check for the rest of the pattern */
	c = *t1++;
	if (!c)
		return(s2 - 1);
	} while (*s1++ == c);
	s1 = s2;
	t1 = t;
	}
}
