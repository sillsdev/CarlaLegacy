/* SIZE_SL.C - find the size of the list of strings
 ***************************************************************************
 *
 *	unsigned getStringListSize(list)
 *	const StringList *list;
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "strlist.h"

/***************************************************************************
 * NAME
 *    getStringListSize
 * DESCRIPTION
 *    Return the number of elements stored in the list.
 * RETURN VALUE
 *    number of nodes in the list
 */
unsigned getStringListSize(pList_in)
const StringList *	pList_in;	/* pointer to head of strlist */
{
const StringList *	sp;
unsigned		size;
/*
 *  step through the list incrementing a counter
 */
for ( size = 0, sp = pList_in ; sp ; ++size, sp = sp->pNext )
	;
return( size );
}

/*****************************************************************************
 * EDIT HISTORY
 * 12-May-89	SRMc - write from scratch, pulling code in from
 *			throughout AMPLE for part of it
 * 13-Jul-89	hab  - de-"lint" the source
 * 29-Jun-90	BK/ALB - Fix for portability to MAC, add string.h [1.1b]
 *  5-Jun-92	SRMc - remove free_strlist(), it's in another file
 * 20-Jul-92	SRMc - use mystrdup() where applicable
 *		     - split into individual files
 * 26-Apr-93	SRMc - adjust the #include files
 * 27-Feb-97	SRMc - make input arguments const where possible
 */
