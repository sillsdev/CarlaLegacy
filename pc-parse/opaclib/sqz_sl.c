/* SQZ_SL.C - squeeze a list of strings, removing redundant strings
 ***************************************************************************
 *
 * StringList *squeezeStringList(StringList *list)
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
 *    squeezeStringList
 * ARGUMENTS:
 *    list - pointer to head of strlist
 * DESCRIPTION
 *    Remove redundant strings from a string list.
 * RETURN VALUE
 *    pointer to possibly smaller list
 */
StringList *squeezeStringList(list)
StringList *list;
{
register StringList *slp, *nlp, *trailp;

for ( slp = list ; slp ; slp = slp->pNext )
	{
	trailp = slp;
	for ( nlp = slp->pNext ; nlp ; trailp = nlp, nlp = nlp->pNext )
	{
	if ( !strcmp( slp->pszString, nlp->pszString ) )	/* If equal */
		{
		trailp->pNext = nlp->pNext;		/* Delete the node */
		freeMemory( nlp->pszString );
		freeMemory( (char *)nlp );
		nlp = trailp;
		}
	}
	}
return( list );
}

/*****************************************************************************
 *      EDIT HISTORY
 * 12-May-89	SRMc - write from scratch, pulling code in from throughout
 *			AMPLE for part of it
 * 13-Jul-89	hab  - de-"lint" the source
 * 29-Jun-90	BK/ALB - Fix for portability to MAC, add string.h [1.1b]
 *  5-Jun-92	SRMc - remove free_strlist(), it's in another file
 * 20-Jul-92	SRMc - use mystrdup() where applicable
 *		     - split into individual files
 * 26-Apr-93	SRMc - adjust the #include files
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 */
