/*	FILE:		TOLOWE.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:
 *
 *	FUNCTIONS:	tolower - as defined by Unix System V
 */
/************************************************************************
 * NAME
 *    tolower
 * ARGUMENTS
 *    c - character to convert
 * DESCRIPTION
 *    If the character c is uppercase, convert it to lowercase.
 * RETURN VALUE
 *    either converted or original value of c
 */
int tolower(c)
int c;
{
if ((c >= 'A') && (c <= 'Z'))
	return( c - 'A' + 'a' );
else
	return( c );
}
