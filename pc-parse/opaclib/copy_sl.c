/* COPY_SL.C - copy a list of strings
 ***************************************************************************
 *
 * StringList * duplicateStringList(const StringList * pList);
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1995, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "strlist.h"
#include "allocmem.h"

/***************************************************************************
 * NAME
 *    duplicateStringList
 * ARGUMENTS:
 *    pList_in - pointer to head of strlist
 * DESCRIPTION
 *    copy a strlist to create another strlist.
 * RETURN VALUE
 *    pointer to new list
 */
StringList *duplicateStringList(pList_in)
const StringList *	pList_in;
{
StringList *		pNewNode;
StringList *		pNewList;
StringList *		pTailNewList;
const StringList *	pNode;

pNewList     = (StringList *)NULL;
pTailNewList = (StringList *)NULL;

for ( pNode = pList_in ; pNode ; pNode = pNode->pNext )
	{
	pNewNode = (StringList *)allocMemory(sizeof(StringList));
	if (pNode->pszString == NULL)
	pNewNode->pszString = NULL;
	else
	pNewNode->pszString = duplicateString(pNode->pszString);
	pNewNode->pNext = NULL;
	if (pNewList == NULL)
	pNewList = pNewNode;
	else
	pTailNewList->pNext = pNewNode;
	pTailNewList = pNewNode;
	}
return( pNewList );
}

/*****************************************************************************
 *      EDIT HISTORY
 *      27-Sep-95       SRMc - write from scratch
 *	29-Jan-97	SRMc - remove the #include <string.h>
 */
