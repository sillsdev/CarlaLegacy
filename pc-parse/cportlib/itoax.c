/* ITOAX.C - convert an integer to a hexadecimal string
 *****************************************************************************
 *
 * char *itoax(int value, char *string)
 *
 *****************************************************************************
 * Copyright 1987, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef __STDC__
char *itoax(int value, char *string);
#endif

/************************************************************************
 * NAME
 *    itoax
 * ARGUMENTS
 *    value  - binary integer
 *    string - address of buffer to store number string
 * DESCRIPTION
 *    Convert binary integer to hexadecimal character (digit) string.
 * RETURN VALUE
 *    address of NUL byte which terminates the string
 */
char *itoax(value,string)
int value;
char *string;
{
register char *p;
register unsigned uval;
char buf[16];

uval = value;
for ( p = buf ; uval ; uval >>= 4 )
	*p++ = uval & 0xF;
if (p == buf)			/* allow for value == 0 */
	*p++ = 0;
while ( p > buf )
	{
	if ((*--p) > 9)
	*string++ = (*p) + 'A' - 10;
	else
	*string++ = (*p) + '0';
	}
*string = '\0';
return(string);
}

/*****************************************************************************
 * EDIT HISTORY
 * 25-Feb-87	Stephen McConnel
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
