/* MATCHBEG.C - check if the second string matches the beginning of the first
 ******************************************************************************
 *
 * int matchBeginning(char *s, char *t)
 *
 ******************************************************************************
 * Copyright 1985, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif
#ifndef TRUE
#define TRUE (1)
#define FALSE (0)
#endif
#define NUL '\0'

#ifdef __STDC__
int matchBeginning(const char *s, const char *t);
#endif

/******************************************************************************
 * NAME
 *    matchBeginning
 * ARGUMENTS
 *    s - pointer to the first string
 *    t - pointer to the second string
 * DESCRIPTION
 *    Compare two strings, using the end of the second string as the
 *    cutoff point for the comparison.
 * RETURN VALUE
 *    nonzero if the two strings are equal up to the end of the second
 *    string, zero otherwise
 */
int matchBeginning(s,t)
const char *s;
const char *t;
{
if (t == NULL)
	return(TRUE);	/* null string matches any string */
if (s == NULL)
	return(FALSE);	/* nothing else matches a null string */
while ( *t != NUL )
	{
	if (*s++ != *t++)
	return(FALSE);	/* signal failure */
	}
return(TRUE);		/* signal success */
}

/******************************************************************************
 * EDIT HISTORY
 * 24-Sep-85	Steve McConnel - write stcmp() to support CQAP programs
 * 31-Mar-87	SRMc - reformat & edit comments
 * 21-Dec-90	SRMc - rename stcmp() to match_begin(), reformat header
 *		     - reformat file header
 *		     - rewrite slightly for simplicity
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 12-Feb-97	SRMc - rename match_begin() to matchBeginning()
 *		     - move function from CPORT library to OPAC library
 */
