/*	FILE:		STRTOK.C
 *	DATE WRITTEN:	13-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	strtok - as defined by Unix System V
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL ((VOIDP)0)
#endif
#define NUL '\0'

/************************************************************************
 * NAME
 *    strtok
 * ARGUMENTS
 *    s1 - address of NUL-terminated character string
 *    s2 - address of NUL-terminated set of separator characters
 * DESCRIPTION
 *    Split the string s1 into a sequence of zero or more text tokens
 *    separated by spans of one or more characters from s2.  Only the
 *    initial call provides a value for s1; successive calls must use
 *    a NULL pointer for the first argument.  The first separater
 *    character following the token in s1 is replaced by a NUL character.
 *    Subsequent calls to strtok work through s1 sequentially.  Note
 *    that s2 may change from one call to the next.
 * RETURN VALUE
 *    address of the next token, or NULL if no more tokens exist
 */
char *strtok(s1, s2)
char *s1, *s2;
{
static char *string = 0;
register char *rp, *p;
register int c;

if (s1 != NULL)
	string = s1;
if ((string == NULL) || (*string == NUL))
	return( NULL );
if (s2 == NULL)
	{
	rp = string;	/* return rest of string */
	string = NULL;	/* note that entire string has been scanned */
	return( rp );
	}
/*
 *  find first character in string which doesn't occur in s2
 *  save value for return (rp)
 *  if all characters in string occur in s2, return NULL
 */
for ( rp = string ; (c = *rp) != NUL ; ++rp )
	{
	for ( p = s2 ; *p != NUL ; ++p )
	{
	if (c == *p)
		break;
	}
	if (*p == NUL)
	break;			/* didn't find character in s2 */
	}
if (*rp == NUL)
	{
	string = rp;
	return( NULL );
	}
/*
 *  find first character which occurs in s2
 *  replace it with NUL, and save pointer in string
 */
for ( string = rp+1 ; (c = *string) != NUL ; ++string )
	{
	for ( p = s2 ; *p != NUL ; ++p )
	{
	if (c == *p)
		{
		*string++ = '\0';	/* mark end of token */
		return( rp );
		}
	}
	}
return( rp );
}
