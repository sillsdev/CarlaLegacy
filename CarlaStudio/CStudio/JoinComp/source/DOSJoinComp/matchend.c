/* MATCHEND.C - check if the second string matches the end of the first
 *****************************************************************************
 *
 * int matchEnd(char *s, char *t)
 *
 *****************************************************************************
 * Copyright 1986, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
extern size_t strlen  P((const char * s));
#endif /* STDC_HEADERS */

#ifndef NULL
#define NULL (VOIDP)0
#endif
#ifndef TRUE
#define TRUE (1)
#endif
#ifndef FALSE
#define FALSE (0)
#endif
#define NUL '\0'

#ifdef __STDC__
int matchEnd(char *s, char *t);
#endif

/******************************************************************************
 * NAME
 *    matchEnd
 * ARGUMENTS
 *    s - pointer to the first string
 *    t - pointer to the second string
 * DESCRIPTION
 *    Compare the second string against the end of the first string
 * RETURN VALUE
 *    nonzero if the second string matches the end of the first string,
 *    zero otherwise
 */
int matchEnd(s,t)
char *s;
char *t;
{
register char *s1, *t1;

if ((t == NULL) || (*t == NUL))
	return(TRUE);		/* null string matches any string */
if ((s == NULL) || (*s == NUL))
	return(FALSE);		/* nothing else matches a null string */
s1 = s + strlen(s);
t1 = t + strlen(t);
while ((s1 > s) && (t1 > t))
	{
	if (*--s1 != *--t1)
	return(FALSE);
	}
return(t1 == t);
}

/*****************************************************************************
 * EDIT HISTORY
 *  4-Sep-86	Steve McConnel
 * 31-Mar-87	SRMc - reformat for consistency
 * 21-Dec-90	SRMc - renamed rstcmp() to match_end()
 *		     - reformat file header
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 12-Feb-97	SRMc - rename match_end() to matchEnd()
 *		     - move function from CPORT library to OPAC library
 */
