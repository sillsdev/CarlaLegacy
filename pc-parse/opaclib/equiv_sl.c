/* EQUIV_SL.C - check whether two string lists contain the same strings
 ***************************************************************************
 *
 * int equivalentStringLists(const StringList * pFirst_in,
 *			     const StringList * pSecond_in);
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1993, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "strlist.h"

/*****************************************************************************
 * NAME
 *    equivalentStringLists
 * ARGUMENTS
 *    pFirst_in  - pointer to a list of strings
 *    pSecond_in - pointer to another list of strings
 * DESCRIPTION
 *    check whether or not two string lists contain the same strings
 * RETURN VALUE
 *    0 if the list are not equal, non zero if they are equal
 */
int equivalentStringLists(pFirst_in, pSecond_in)
const StringList *	pFirst_in;
const StringList *	pSecond_in;
{
const StringList *	sp;

if (pFirst_in == pSecond_in)
	return( 1 );
if ((pFirst_in == NULL) || (pSecond_in == NULL))
	return( 0 );
for ( sp = pFirst_in ; sp ; sp = sp->pNext )
	{
	if (!isMemberOfStringList(pSecond_in, sp->pszString))
	return( 0 );
	}
for ( sp = pSecond_in ; sp ; sp = sp->pNext )
	{
	if (!isMemberOfStringList(pFirst_in, sp->pszString))
	return( 0 );
	}
return( 1 );
}

/*****************************************************************************
 *      EDIT HISTORY
 *      26-Apr-93       SRMc - write from scratch
 */
