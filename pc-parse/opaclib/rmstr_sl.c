/* RMSTR_SL.C - remove a string from a list of strings
 ***************************************************************************
 *
 * StringList *removeFromStringList(StringList *list, char *str)
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
 *    removeFromStringList
 * DESCRIPTION
 *    Remove a string from a list of strings (only the first occurrence).
 * RETURN VALUE
 *    pointer to the (possibly shorter) list.
 *    NULL if the only item in the list was removed
 */
StringList * removeFromStringList(pList_io, pszString_in)
StringList *	pList_io;	/* pointer to head of strlist */
const char *	pszString_in;	/* pointer to string to be removed */
{
StringList *	pStr;
StringList *	pPrev;

if (pszString_in == NULL)
	return(pList_io);		/* just to be safe... */
/*
 *  search for the string in the list
 */
for ( pPrev = NULL, pStr = pList_io ; pStr ; pStr = pStr->pNext )
	{
	if ( !strcmp( pszString_in, pStr->pszString) )
	{
	/*
	 *  unlink the node from the list
	 */
	if (pPrev == NULL)
		pList_io = pStr->pNext;	/* matched first string in list */
	else
		pPrev->pNext = pStr->pNext;
	/*
	 *  release the space used by the node
	 */
	if (pStr->pszString != NULL)
		freeMemory( pStr->pszString );
	freeMemory( pStr );
	break;			/* leave the for loop */
	}
	pPrev = pStr;
	}
return(pList_io);
}

/*****************************************************************************
 * EDIT HISTORY
 * 12-May-89	SRMc - write from scratch, pulling code in from throughout
 *			AMPLE for part of it
 * 13-Jul-89	hab  - de-"lint" the source
 * 29-Jun-90	BK/ALB - Fix for portability to MAC, add string.h [1.1b]
 *  5-Jun-92	SRMc - remove free_strlist(), it's in another file
 * 20-Jul-92	SRMc - use mystrdup() where applicable
 *		     - split into individual files
 * 26-Apr-93	SRMc - adjust the #include files
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 27-Feb-97	SRMc - make input arguments const where possible
 */
