/*	FILE:		TOUPPE.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:
 *
 *	FUNCTIONS:	toupper - as defined by Unix System V
 */
/************************************************************************
 * NAME
 *    toupper
 * ARGUMENTS
 *    c - character to convert
 * DESCRIPTION
 *    If the character c is lowercase, convert it to uppercase.
 * RETURN VALUE
 *    either converted or original value of c
 */
int toupper(c)
int c;
{
if ((c >= 'a') && (c <= 'z'))
	return( c - 'a' + 'A' );
else
	return( c );
}
