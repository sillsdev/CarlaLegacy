/*	FILE:		ISGRAP.C
 *	DATE WRITTEN:	10-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:
 *
 *	FUNCTIONS:	isgraphic - as defined by Unix System V
 */
/************************************************************************
 * NAME
 *    isgraph
 * ARGUMENTS
 *    c - character to test
 * DESCRIPTION
 *    Test whether c is a printing character which deposits ink.
 * RETURN VALUE
 *    1 if c is a printing character which deposits ink.
 */
int isgraph( c )
register int c;
{
return( (c > ' ') && (c <= '~') );
}
