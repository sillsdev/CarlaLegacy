/* UPDAT_SL.C - add a string to the beginning of a list of strings
 ***************************************************************************
 *
 * char * updateStringList(StringList ** ppList_io, const char * pszString_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1996, 1997 by the Summer Institute of Linguistics, Inc.
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

/*************************************************************************
 * NAME
 *    updateStringList
 * DESCRIPTION
 *    If the string is not already in the list, add it; this function is
 *    equivalent to mergeIntoStringList, except that it returns a different
 *    parameter
 * RETURN VALUE
 *    pointer to str in string list
 */
char * updateStringList(ppList_io, pszString_in)
StringList **	ppList_io;	/* address of pointer to string list
				   to be updated */
const char *	pszString_in;	/* pointer to string to be added to
				   string list */
{
StringList *	pList;
/*
 *  search the string list for a duplicate
 */
for ( pList = *ppList_io ; pList ; pList = pList->pNext )
	{
	/*
	 *  if a duplicate is found, return it
	 */
	if (strcmp( pList->pszString, pszString_in ) == 0)
		return( pList->pszString );
	}
/*
 *  if no duplicate found, add this string to the list
 */
pList = allocMemory( sizeof(struct strlist) );
pList->pszString = duplicateString( pszString_in );
pList->pNext = *ppList_io;
*ppList_io = pList;

return( pList->pszString );
}

/*****************************************************************************
 * EDIT HISTORY
 * 10-Oct-96	SRMc - extract from AMPLE's strlist.c
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 27-Feb-97	SRMc - make input arguments const where possible
 */
