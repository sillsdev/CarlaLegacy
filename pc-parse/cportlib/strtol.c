/*	FILE:		STRTOL.C
 *	DATE WRITTEN:	20-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	strtol - as defined by Unix System V
 *		static	is_dig
 *		static	to_num
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <ctype.h>
#ifndef isascii
#define isascii(x) (!(x & ~0177))
#endif

#ifndef NULL
#define NULL ((VOIDP)0)
#endif
#define NUL '\0'

/************************************************************************
 * NAME
 *    strtol
 * ARGUMENTS
 *    str  - character string representing a number
 *    ptr  - address of a pointer to the end of the number
 *    base - number base from 2 to 36 (0 is special case)
 * DESCRIPTION
 *    Convert the value represented by the character string pointed to
 *    by str to a long integer in the given base.  Leading whitespace is
 *    ignored, and an optional sign (+ or -) character is allowed.
 *    If base is between 2 and 36, it is used as the number base for the
 *    conversion.  If base is zero, the number string itself is used to
 *    determine the base according to the normal C conventions.  (Leading
 *    0x means hexadecimal, and leading 0 means octal.)
 *    If ptr is not NULL, the address of the character terminating the
 *    scan is stored in the location pointed to by ptr.
 *    Note that overflow conditions are ignored.  In this implementation,
 *    invalid values for base cause 0L to be returned, with no adjustment
 *    to *ptr.
 * RETURN VALUE
 *    binary equivalent of the ASCII number string
 */
long strtol(str, ptr, base)
char *str, **ptr;
int base;
{
register char *p;
long val;
register int sign;
/*
 *  check for valid base
 */
if ((base > 36) || (base < 0) || (base == 1))
	return( 0L );
/*
 *  skip leading whitespace
 */
for ( p = str ; (*p != NUL) && isascii(*p) && isspace(*p) ; ++p )
	;
/*
 *  check for optional sign character
 */
sign = 0;
if (*p == '+')
	++p;
else if (*p == '-')
	++p, sign = -1;
/*
 *  allow for null digit string
 */
if (*p == NUL)
	{
	if (ptr != (char **)NULL)
	*ptr = p;
	return( 0L );
	}
/*
 *  check for leading 0x for base 16
 */
if ((base == 16) && (*p == '0'))
	{
	++p;
	if ((*p == 'x') || (*p == 'X'))
	++p;
	}
/*
 *  are we letting the digit string choose the base?
 */
else if (base == 0)
	{
	if (*p == '0')
	{
	++p;
	if ((*p == 'x') || (*p == 'X'))
		++p, base = 16;		/* leading 0x => hexadecimal */
	else
		base = 8;			/* leading 0 => octal */
	}
	else
	base = 10;			/* default = decimal */
	}
/*
 *  now we're all set to convert the number
 */
for ( val = 0L ; is_dig(*p,base) ; ++p )
	{
	val *= base;
	val += to_num( *p );
	}
/*
 *  return what we have
 */
if (ptr != (char **)NULL)
	*ptr = p;
return( (sign < 0) ? -val : val );
}

/************************************************************************
 * NAME
 *    is_dig
 * ARGUMENTS
 *    c    - possible digit character
 *    base - number base
 * DESCRIPTION
 *    Check whether or not c represents a valid digit in the indicated
 *    number base.
 * RETURN VALUE
 *    nonzero if c is a valid character for a digit in the desired base
 */
static int is_dig(c,base)
register int c;
int base;
{
if ((c >= '0') && (c <= '9'))
	c -= '0';
else if ((c >= 'A') && (c <= 'Z'))
	c -= ('A' - 10);
else if ((c >= 'a') && (c <= 'z'))
	c -= ('a' - 10);
else
	c = 9999;
return( c < base );
}

/************************************************************************
 * NAME
 *    to_num
 * ARGUMENTS
 *    c - digit character
 * DESCRIPTION
 *    Convert the digit character to its actual numeric value, assuming
 *    base 36.
 * RETURN VALUE
 *    numeric value of input digit character
 */
static int to_num(c)
register int c;
{
if ((c >= '0') && (c <= '9'))
	return( (c - '0') );
else if ((c >= 'A') && (c <= 'Z'))
	return( (c - 'A' + 10) );
else if ((c >= 'a') && (c <= 'z'))
	return( (c - 'a' + 10) );
else
	return( 0 );		/* just in case */
}
