/* MERGE_SL.C - add a string to the beginning of a list of strings
 ***************************************************************************
 *
 *	StringList *mergeIntoStringList(list,str)
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
#ifdef STDC_HEADERS
#include <string.h>
#else
extern int    strcmp  P((const char * s1, const char * s2));
#endif /*STDC_HEADERS*/

#include "strlist.h"
#include "allocmem.h"

/***************************************************************************
 * NAME
 *    mergeIntoStringList
 * DESCRIPTION
 *    Add a string to a list of strings if it is not already in the list.
 * RETURN VALUE
 *    pointer to possibly modified list
 */
StringList * mergeIntoStringList(pList_in, pszString_in)
StringList *	pList_in;	/* pointer to head of strlist */
const char *	pszString_in;	/* pointer to string to be added */
{
StringList *	sp;

if (pszString_in == NULL)
	return( pList_in );		/* just to be safe... */
/*
 *  search for the string in the list
 */
for ( sp = pList_in ; sp ; sp = sp->pNext )
	{
	if ( !strcmp( pszString_in, sp->pszString) )
	return( pList_in );	/* found it, so we don't need a new node */
	}
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
 * 12-May-89	SRMc - write from scratch, pulling code in from
 *			throughout AMPLE for part of it
 * 13-Jul-89	hab  - de-"lint" the source
 * 29-Jun-90	BK/ALB - Fix for portability to MAC, add string.h [1.1b]
 *  5-Jun-92	SRMc - remove free_strlist(), it's in another file
 * 20-Jul-92	SRMc - use mystrdup() where applicable
 *		     - split into individual files
 * 26-Apr-93	SRMc - adjust the #include files
 * 27-Feb-97	SRMc - make input arguments const where possible
 * 27-Oct-97	SRMc - rename file to merge_sl.c
 */
