/* CAT_SL.C - catenate two lists of strings together
 ***************************************************************************
 *
 *	StringList *mergeTwoStringLists(list,new)
 *	StringList *list;
 *	StringList *new;
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "strlist.h"
#include "allocmem.h"

/***************************************************************************
 * NAME
 *    mergeTwoStringLists
 * ARGUMENTS:
 *    list - pointer to head of strlist
 *    new  - pointer to strlist to add to list
 * DESCRIPTION
 *    Append a strlist to another strlist.
 *    Redundant strings in new are deallocated along the way.
 * RETURN VALUE
 *    pointer to new list
 */
StringList *mergeTwoStringLists(list,new)
StringList *list;
StringList *new;
{
StringList *next;

while ( new )
	{
	next = new->pNext;
	if (isMemberOfStringList(list,new->pszString))
	{
	freeMemory( new->pszString );	/* string already there, so free */
	freeMemory( (char *)new );	/*   the space used by this node */
	}
	else
	{
	new->pNext = list;		/* move this node over to list */
	list = new;
	}
	new = next;
	}
return( list );
}

/*****************************************************************************
 *      EDIT HISTORY
 *      12-May-89       SRMc - write from scratch, pulling code in from
 *                              throughout AMPLE for part of it
 *      13-Jul-89       hab  - de-"lint" the source
 * 1.1b 29-Jun-90 BK/ALB Fix for portability to MAC, add string.h
 *	 5-Jun-92	SRMc - remove free_strlist(), it's in another file
 *	20-Jul-92	SRMc - use mystrdup() where applicable
 *			     - rename append_strlist() to catenate_strlist()
 *			     - split into individual files
 *	26-Apr-93	SRMc - adjust the #include files
 *	29-Jan-97	SRMc - remove the #include <string.h>
 */
