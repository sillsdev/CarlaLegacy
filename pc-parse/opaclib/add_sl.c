/* ADD_SL.C - add a string to the beginning of a list of strings
 ***************************************************************************
 *
 *	StringList * addToStringList(list,str)
 *	StringList *list;
 *	char *str;
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include "strlist.h"
#include "allocmem.h"

/***************************************************************************
 * NAME
 *    addToStringList
 * DESCRIPTION
 *    Add a string to the beginning of a list of strings.
 * RETURN VALUE
 *    pointer to modified list
 */
StringList * addToStringList(pList_in, pszString_in)
StringList *	pList_in;	/* pointer to head of strlist */
const char *	pszString_in;	/* pointer to string to be added */
{
StringList *	sp;

if (pszString_in == NULL)
	return( pList_in );		/* just to be safe... */
/*
 *  allocate a new node, and link it in
 */
sp = (StringList *)allocMemory( sizeof(StringList) );
sp->pszString = duplicateString( pszString_in );
sp->pNext     = pList_in;
return( sp );
}

/*****************************************************************************
 * EDIT HISTORY
 * 27-Oct-97	SRMc - extract from the STAMP sources
 */
