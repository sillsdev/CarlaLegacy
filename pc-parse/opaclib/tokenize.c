/* TOKENIZE.C - function for splitting strings into tokens
 ***************************************************************************
 *
 * unsigned char * tokenizeString(unsigned char *	pszString_in,
 *				  const unsigned char * pszSeparate_in)
 *
 ***************************************************************************
 * Copyright 1997, 2000 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL 0
#endif
#ifndef NUL
#define NUL '\0'
#endif
#ifdef __STDC__
unsigned char *tokenizeString(unsigned char * pszString_in,
				  const unsigned char * pszSeparate_in);
#endif

/************************************************************************
 * NAME
 *    tokenizeString
 * DESCRIPTION
 *    Split the string pszString_in into a sequence of zero or more text tokens
 *    separated by spans of one or more characters from pszSeparate_in.  Only
 *    the initial call provides a value for pszString_in; successive calls must
 *    use a NULL pointer for the first argument.  The first separater
 *    character following the token in pszString_in is replaced by a NUL
 *    character.  Subsequent calls to tokenizeString work through pszString_in
 *    sequentially.  Note that pszSeparate_in may change from one call to the
 *    next.
 *
 *    This is identical to strtok() except for the function name and for using
 *    unsigned char strings rather than char strings.
 * RETURN VALUE
 *    address of the next token, or NULL if no more tokens exist
 */
unsigned char *tokenizeString(pszString_in, pszSeparate_in)
unsigned char *		pszString_in;		/* address of NUL-terminated
						 * character string, or NULL */
const unsigned char *	pszSeparate_in;		/* address of NUL-terminated
						 * set of separator characters,
						 * or NULL */
{
static unsigned char *	pszString_s = NULL;
unsigned char *		rp;
const unsigned char *	p;
unsigned		c;

if (pszString_in != NULL)
	pszString_s = pszString_in;
if ((pszString_s == NULL) || (*pszString_s == NUL))
	{
	pszString_s = NULL;
	return( NULL );
	}
if (pszSeparate_in == NULL)
	{
	rp = pszString_s;	/* return rest of string */
			/* note that entire string has been scanned */
	pszString_s = NULL;
	return( rp );
	}
/*
 *  find first character in string which doesn't occur in pszSeparate_in
 *  save value for return (rp)
 *  if all characters in string occur in pszSeparate_in, return NULL
 */
for ( rp = pszString_s ; (c = *rp) != NUL ; ++rp )
	{
	for ( p = pszSeparate_in ; *p != NUL ; ++p )
	{
	if (c == *p)
		break;
	}
	if (*p == NUL)
	break;			/* didn't find character in pszSeparate_in */
	}
if (*rp == NUL)
	{
	pszString_s = NULL;
	return( NULL );
	}
/*
 *  find first character which occurs in pszSeparate_in
 *  replace it with NUL, and save pointer in string
 */
for ( pszString_s = rp+1 ; (c = *pszString_s) != NUL ; ++pszString_s )
	{
	for ( p = pszSeparate_in ; *p != NUL ; ++p )
	{
	if (c == *p)
		{
		*pszString_s++ = '\0';	/* mark end of token */
		return( rp );
		}
	}
	}
/* nothing more after this one */
pszString_s = NULL;
return( rp );
}
