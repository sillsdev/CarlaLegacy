/* FREE_SL.C - function to free a list of strlist structures
 ***************************************************************************
 *
 * void freeStringList(StringList * list);
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1989, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "strlist.h"
#include "allocmem.h"

/***************************************************************************
 * NAME
 *    freeStringList
 * ARGUMENTS:
 *    list - pointer to head of strlist
 * DESCRIPTION
 *    Delete a strlist, freeing all the space it used.
 * RETURN VALUE
 *    none
 */
void freeStringList( list )
StringList *list;
{
register StringList *sp, *nextp;

for ( sp = list ; sp ; sp = nextp )
	{
	nextp = sp->pNext;		/* save the address of the next node */
	if (sp->pszString != (char *)NULL)
	freeMemory( sp->pszString );	/* release the string space */
	freeMemory( (char *)sp );	/* release the node space */
	}
}

/***************************************************************************
 *	EDIT HISTORY
 *      12-May-89       SRMc - write from scratch, pulling code in from
 *                              throughout AMPLE for part of it
 *      13-Jul-89       hab  - de-"lint" the source
 * 1.1b 29-Jun-90 BK/ALB Fix for portability to MAC, add string.h
 *	16-Sep-91	SRMc - extract free_strlist() from strlist.c
 *	26-Apr-93	SRMc - adjust the #include files
 *	29-Jan-97	SRMc - remove #include <string.h>
 */
