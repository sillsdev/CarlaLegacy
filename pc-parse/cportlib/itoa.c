/* ITOA.C -convert an integer to a decimal string
 *****************************************************************************
 *
 * char *itoa(int value, char *string)
 *
 *****************************************************************************
 * Copyright 1987, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef _MSC_VER
#define itoa itoad
#endif
#ifdef __STDC__
char *itoa(int value, char *string);
#endif

/************************************************************************
 * NAME
 *    itoa
 * ARGUMENTS
 *    value  - binary integer
 *    string - address of buffer to store number string
 * DESCRIPTION
 *    Convert binary integer to signed decimal character (digit) string.
 * RETURN VALUE
 *    address of NUL byte which terminates the string
 */
char *itoa(value,string)
int value;
char *string;
{
register char *p;
register unsigned uval;
char buf[16];

if (value < 0)			/* allow for negative integers */
	{
	uval = -value;    *string++ = '-';
	}
else
	uval = value;
for ( p = buf ; uval ; uval /= 10 )
	*p++ = uval % 10;
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
 * 30-Dec-88	SMc - fix for Microsoft C, which has its own definition of an
 *			itoa() function
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
