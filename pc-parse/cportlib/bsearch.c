/*	FILE:		BSEARCH.C
 *	DATE WRITTEN:	14-Jan-88	BY: Bob Hallissy
 *						(based on Unix System III
 *						 man page)
 *	DATE MODIFIED:	26-Aug-89	    SRMc - reformat & edit comments
 *	FUNCTIONS:		bsearch
 */
#define NULLCP (char *)0
/****************************************************************************
 * NAME
 *    bsearch
 * ARGUMENTS
 *    key     - address of item to search for
 *    base    - address of (sorted) table to search
 *    nel     - number of elements in the table
 *    width   - width in bytes of one element
 *    compare - address of function (returning int) to compare two elements
 * DESCRIPTION
 *    This is a generalized binary search function, analagous to qsort for
 *    sorting.
 *
 *    compare() will be given two arguments which are pointers to items being
 *    compared, and must return an integer <, =, or > zero according as the
 *    first argument is to be considered less than, equal to, or greater than
 *    the second.
 *
 *    The table must be sorted in ascending order (as defined by compare()).
 *
 *    If there are multiple "equal" items in the table, the return value
 *    will be one of them at random.
 * RETURN VALUE
 *    pointer into the table indicating where the item may be found, or NULL
 *    if it is not in the table
 */
char *bsearch (Key, Base, Nel, Width, Compare)
char *Key, *Base;
unsigned Nel, Width;
int (*Compare)();
{
unsigned Mid;		/* Index to mid point element */
char *MidP;		/* Pointer to midpoint element */
int C;			/* Return value from Compare */

while (Nel)
	{
	/*
	 *  Pick the approximate mid point
	 */
	Mid = Nel >> 1;
	MidP = Base + (Mid * Width);
	/*
	 *  Compare Key item with the midpoint item
	 */
	if ((C = Compare (Key, MidP)) == 0)
	return (MidP);		/* Found item! */
	else if (C < 0)
	Nel = Mid;		/* Keep searching in the lower half */
	else
	{
	Base = MidP + Width;	/* Keep searching in the upper half */
	Nel = Nel - Mid - 1;
	}
	}
return (NULLCP);		/* Search failed... */
}

#ifdef CHECKOUT
/* A main procedure and compare routines to verify bsearch works */
#include <stdio.h>

#define MAX 10
#define NULLIP ((int *) NULL)

int count;		/* Count of times compare called */
compare (A, B)
int *A, *B;
{
count++;
return (*A - *B);
}

main()
{
int array[MAX+1];
unsigned nel;
int key;
int *result;
/*
 *  Fill array with increasing integers:
 */
for (nel = 0; nel <= MAX; nel++)
	array[nel] = nel;
/*
 *  Make sure nel = zero gives null ptr
 */
count = key = 0;
result = (int *) bsearch ( (char *) &key, (char *) array,
						0, sizeof (int), compare);
if (result != NULLIP)
	printf ("Oops: Found 0 in array of 0\n");
if (count != 0)
	printf ("Oops: Did a compare when nel = 0\n");
/*
 *  Check various array sizes:
 */
for (nel = 1; nel < MAX; nel++)
	{
	/*
	 *  Search for each key
	 */
	for (key = 0; key < nel; key++)
	{
	count = 0;
	result = (int *) bsearch ( (char *) &key, (char *) array,
						nel, sizeof (int), compare);
	if (*result != key)
		{
		printf ("Oops: Couldn't find %d in array of %d", key, nel);
		if (result == NULLIP)
		printf (" Returned a null\n");
		else
		printf (" Returned %d\n", *result);
		}
/*
 *	else
 *	    printf ("nel = %d, key = %d, count = %d\n", nel, key, count);
 */
	}
	/*
	 *  Now try searching for a non-existant key
	 */
	for (key = -1; key <= (int) nel; key += (nel + 1))
	{
	count = 0;
	result = (int *) bsearch ( (char *) &key, (char *) array,
						nel, sizeof (int), compare);

	if (result != NULLIP)
		printf ("Oops: found %d in array of %d\n", key, nel);
/*
 *	printf ("nel = %d, key = %d, count = %d\n", nel, key, count);
 */
	}
	}
printf ("End of test...no other output means it works ok!\n");
}
#endif
