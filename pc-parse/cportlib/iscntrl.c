/*	FILE:		ISCNTR.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:
 *
 *	FUNCTIONS:	iscntrl - as defined by Unix System V
 */
/************************************************************************
 * NAME
 *    iscntrl
 * ARGUMENTS
 *    c - character to test
 * DESCRIPTION
 *    Test whether c is a control character (value < 040 or > 0176).
 * RETURN VALUE
 *    1 if c is a control character
 */
int iscntrl( c )
register int c;
{
return( (c < ' ') || (c > '~') );
}
