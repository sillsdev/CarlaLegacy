/* STRICMP.C - compare two ASCII strings ignoring case distinctions
 *****************************************************************************
 *
 * int stricmp(char * pszString1_in, char * pszString2_in)
 *
 *****************************************************************************
 * Copyright 1995, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <ctype.h>
#ifndef NULL
#define NULL (VOIDP)0
#endif
#ifndef isascii
#define isascii(x) (!(x & ~0177))
#endif

#ifdef __STDC__
int stricmp(const char * pszString1_in, const char * pszString2_in);
#endif

/************************************************************************
 * NAME
 *    stricmp
 * ARGUMENTS
 *    pszString1_in - pointer to the first string
 *    pszString2_in - pointer to the second string
 * DESCRIPTION
 *    Compare two strings like strcmp(), but case independent ('A' == 'a')
 * RETURN VALUE
 *
 */
int stricmp(pszString1_in,pszString2_in)
const char *	pszString1_in;
const char *	pszString2_in;
{
const char *psz1, *psz2;
char c1, c2;
int diff;

if ((pszString1_in == NULL) && (pszString2_in == NULL))
	return 0;
if (pszString1_in == NULL)
	return -1;
if (pszString2_in == NULL)
	return 1;

for (	psz1 = pszString1_in, psz2 = pszString2_in ;
	(c1 = *psz1) && (c2 = *psz2) ;
	++psz1, ++psz2 )
	{
	if (isascii(c1) && islower(c1))
	c1 = toupper(c1);
	if (isascii(c2) && islower(c2))
	c2 = toupper(c2);
	diff = c1 - c2;
	if (diff != 0)
	return diff;
	}
c2   = *psz2;		/* may not be set by the loop */
diff = c1 - c2;
return diff;
}

/*****************************************************************************
 * EDIT HISTORY
 * 25-Aug-95	Steve McConnel
 *  1-Sep-95	SRMc - minor bug fix for case when first string is not longer
 *			 than second string
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
