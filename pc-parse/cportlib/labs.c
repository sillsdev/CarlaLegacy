/*	FILE:		LABS.C
 *	DATE WRITTEN:	13-Mar-87	BY: Steve McConnel
 *	DATE MODIFIED:
 *
 *	FUNCTIONS:	labs - as defined by Harbison & Steele
 */
/************************************************************************
 * NAME
 *    labs
 * ARGUMENTS
 *    i - long integer
 * DESCRIPTION
 *    compute the absolute value of a long integer
 * RETURN VALUE
 *    absolute value of i
 */
long labs(i)
long i;
{
return( (i < 0) ? -i : i );
}
