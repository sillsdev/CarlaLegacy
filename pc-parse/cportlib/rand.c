/*	FILE:		RAND.C
 *	DATE WRITTEN:	13-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:
 *
 *	FUNCTIONS:	rand  - as defined by Unix System V
 *			srand - as defined by Unix System V
 */
/*
 *  note that rand() and srand() already exist for BSD4
 */
static long int next = 1;

/************************************************************************
 * NAME
 *    rand
 * ARGUMENTS
 * DESCRIPTION
 *    compute a pseudo-random integer
 * RETURN VALUE
 *    positive pseudo-random integer
 */
int rand()
{
next = next * 1103515245L + 12345L;
return( (int)((next >> 16) & 077777) );
}

/************************************************************************
 * NAME
 *    srand
 * ARGUMENTS
 *    seed - initiating value for rand() sequences
 * DESCRIPTION
 *    Set the initial value for rand() sequences
 * RETURN VALUE
 */
srand(seed)
unsigned seed;
{
next = seed;
}
