/* UNLST_SL.C - free the list of nodes without freeing the strings
 ***************************************************************************
 *
 *	StringList * unlinkStringList(StringList ** ppList_io)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1996 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "strlist.h"
#include "allocmem.h"

/***************************************************************************
 * NAME
 *    unlinkStringList
 * DESCRIPTION
 *    Frees up strlist structures, while leaving intact the strings they
 *    point to
 * RETURN VALUE
 *    none
 */
void unlinkStringList(ppList_io)
StringList **	ppList_io;	/* address of pointer to head of
				 * strlist chain to be freed */
{
StringList *	pList;

while (*ppList_io)
	{
	pList = *ppList_io;
	*ppList_io = pList->pNext;
	freeMemory( pList );
	}
/* *ppList_io is now NULL, so no need to clear it */
}

/*****************************************************************************
 *      EDIT HISTORY
 *	10-Oct-96	SRMc - extract from AMPLE's strlist.c and rename from
 *				free_slist() to unlist_strlist()
 */
