/*	FILE:		TOINT.C
 *	DATE WRITTEN:	24-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:
 *
 *	FUNCTIONS:	toint - as defined by Harbison & Steele
 */
/************************************************************************
 * NAME
 *    toint
 * ARGUMENTS
 *    c - character to convert
 * DESCRIPTION
 *    toint() returns the "weight" of a hexadecimal digit: 0 for '0',
 *    1 for '1', ..., 9 for '9', 10 for either 'A' or 'a', ..., and 15
 *    for either 'F' or 'f'.  toint() returns -1 if the argument is not
 *    a hexadecimal digit character.
 * RETURN VALUE
 *    integer value of hexadecimal character, or -1 if error
 */
int toint(c)
int c;
{
if ((c >= '0') && (c <= '9'))
	return( c - '0' );
else if ((c >= 'A') && (c <= 'F'))
	return( c - 'A' + 10 );
else if ((c >= 'a') && (c <= 'f'))
	return( c - 'a' + 10 );
else
	return( -1 );
}
