/* ITOA8.C - convert an integer to an octal string
 *****************************************************************************
 *
 * char *itoa8(int value, char *string)
 *
 *****************************************************************************
 * Copyright 1987, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef __STDC__
char *itoa8(int value, char *string);
#endif

/************************************************************************
 * NAME
 *    itoa8
 * ARGUMENTS
 *    value  - binary integer
 *    string - address of buffer to store number string
 * DESCRIPTION
 *    Convert binary integer to octal character (digit) string.
 * RETURN VALUE
 *    address of NUL byte which terminates the string
 */
char *itoa8(value,string)
int value;
char *string;
{
register char *p;
register unsigned uval;
char buf[16];

uval = value;
for ( p = buf ; uval ; uval >>= 3 )
	*p++ = uval & 07;
if (p == buf)			/* allow for value == 0 */
	*p++ = 0;
while ( p > buf )
	*string++ = (*--p) + '0';
*string = '\0';
return(string);
}

/*****************************************************************************
 * EDIT HISTORY
 * 25-Feb-87	Stephen McConnel
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
