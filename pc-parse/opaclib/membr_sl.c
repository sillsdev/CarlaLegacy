/* MEMBR_SL.C - check whether a string is a member of a list of strings
 ***************************************************************************
 *
 *	int isMemberOfStringList(list,str)
 *	const StringList *list;
 *	const char *str;
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

/***************************************************************************
 * NAME
 *    isMemberOfStringList
 * DESCRIPTION
 *    Check whether a string is stored in a strlist list.
 * RETURN VALUE
 *    nonzero if the string is found in the list, zero otherwise
 */
int isMemberOfStringList(pList_in, pszString_in)
const StringList *	pList_in;	/* pointer to head of strlist */
const char *		pszString_in;	/* pointer to string to be checked */
{
const StringList *	sp;

if (pszString_in == NULL)
	return( 0 );		/* just to be safe... */
/*
 *  search for the string in the list
 */
for ( sp = pList_in ; sp ; sp = sp->pNext )
	{
	if (strcmp( pszString_in, sp->pszString) == 0)
	return( 1 );		/* found it! */
	}
return( 0 );
}

/*****************************************************************************
 * EDIT HISTORY
 * 12-May-89	SRMc - write from scratch, pulling code in from throughout
 *			AMPLE for part of it
 * 13-Jul-89	hab - de-"lint" the source
 * 29-Jun-90	BK/ALB - Fix for portability to MAC, add string.h [1.1b]
 *  5-Jun-92	SRMc - remove free_strlist(), it's in another file
 * 20-Jul-92	SRMc - use mystrdup() where applicable
 *		     - split into individual files
 * 26-Apr-93	SRMc - adjust the #include files
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 27-Feb-97	SRMc - make input arguments const where possible
 */
