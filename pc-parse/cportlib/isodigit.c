/*	FILE:		ISODIG.C
 *	DATE WRITTEN:	24-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:
 *
 *	FUNCTIONS:	isodigit - as defined by Harbison & Steele
 */
/************************************************************************
 * NAME
 *    isodigit
 * ARGUMENTS
 *    c - character to check
 * DESCRIPTION
 *    Check whether a character is an octal digit.
 * RETURN VALUE
 *    nonzero if c is in "01234567"; zero otherwise
 */
int isodigit(c)
char c;
{
return( (c >= '0') && (c <= '7') );
}
