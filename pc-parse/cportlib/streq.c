/*	FILE:		STREQ.C
 *	DATE WRITTEN:	 6-Sep-85	BY: SRMc
 *	DATE MODIFIED:	18-Feb-86	BY: SRMc - reformat & edit comments
 *			31-Mar-87	    SRMc - handle NULL arguments
 *			20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	streq - as defined by DECUS C
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif
#define NUL '\0'

/************************************************************************
 * NAME
 *    streq
 * ARGUMENTS
 *    s1 - pointer to the first string
 *    s2 - pointer to the second string
 * DESCRIPTION
 *    Compare two strings for equality.
 * RETURN VALUE
 *    nonzero if the two strings are identical, zero otherwise
 */
int streq(s1, s2)
const char *s1, *s2;
{
if (s1 == s2)
	return( 1 );
if (s1 == NULL)
	return( *s2 == NUL );
if (s2 == NULL)
	return( *s1 == NUL );
do  {
	if (*s1++ != *s2)
	return( 0 );
	} while ( *s2++ != NUL );
return( 1 );
}
