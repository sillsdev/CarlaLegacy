/* EQUAL_SL.C - check whether two string lists are identical
 ***************************************************************************
 *
 * int identicalStringLists(StringList *first,	StringList *second);
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1993, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
extern int    strcmp  P((const char * s1, const char * s2));
#endif /*STDC_HEADERS*/

#include "strlist.h"

/*****************************************************************************
 * NAME
 *    identicalStringLists
 * DESCRIPTION
 *    check whether or not two string lists are identical
 * RETURN VALUE
 *    0 if the list are not equal, non zero if they are equal
 */
int identicalStringLists(pFirstList_in, pSecondList_in)
const StringList *	pFirstList_in;		/* a list of strings */
const StringList *	pSecondList_in;		/* another list of strings */
{
const StringList *	fp;
const StringList *	sp;

if (pFirstList_in == pSecondList_in)
	return( 1 );
if ((pFirstList_in == NULL) || (pSecondList_in == NULL))
	return( 0 );
for (	fp = pFirstList_in, sp = pSecondList_in ;
	fp && sp ;
	fp = fp->pNext, sp = sp->pNext )
	{
	if (fp->pszString == sp->pszString)
	continue;
	if ((fp->pszString == NULL) || (sp->pszString == NULL))
	return( 0 );
	if (strcmp(fp->pszString, sp->pszString) != 0)
	return( 0 );
	}
return (fp == NULL) && (sp == NULL);
}

/*****************************************************************************
 * EDIT HISTORY
 * 26-Apr-93	SRMc - write from scratch
 * 29-Jan-97	SRMc - fix for "config.h"
 * 27-Feb-97	SRMc - make input arguments const where possible
 */
