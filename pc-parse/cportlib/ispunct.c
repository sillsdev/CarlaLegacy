/*	FILE:		ISPUNCT.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:
 *
 *	FUNCTIONS:	ispunct - as defined by Unix System V
 */
/************************************************************************
 * NAME
 *    ispunct
 * ARGUMENTS
 *    c - character to test
 * DESCRIPTION
 *    Test whether c is a punctuation character (neither control, nor
 *    alphanumeric, nor space).
 * RETURN VALUE
 *    1 if c is a printing character which deposits ink.
 */
int ispunct( c )
register int c;
{
return( ((c > ' ') && (c < '0')) ||
	((c > '9') && (c < 'A')) ||
	((c > 'Z') && (c < 'a')) ||
	((c > 'z') && (c <='~')) );
}
