/* WRITE_SL.C - write a list of strings to a file
 ***************************************************************************
 *
 * void writeStringList(const StringList * pList_in,
 *			const char * pszSep_in,
 *			FILE * outfp)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "strlist.h"

/***************************************************************************
 * NAME
 *    writeStringList
 * DESCRIPTION
 *    Write the members of the list to an output file, separating them by the
 *    indicated string.
 * RETURN VALUE
 *    pointer to new list
 */
void writeStringList(pList_in, pszSep_in, outfp)
const StringList *	pList_in;	/* pointer to head of strlist */
const char *		pszSep_in;	/* pointer to string used to separate
					   the elements */
FILE *			outfp;		/* output FILE pointer */
{
const StringList *	sp;
/*
 *  move along the list, writing the strings to the output file
 */
for ( sp = pList_in ; sp ; sp = sp->pNext )
	{
	if (sp->pszString != NULL)		/* except for NULL strings, */
	fputs(sp->pszString, outfp);	/*     print the string */
	if (sp->pNext)			/* except for the last element, */
	fputs(pszSep_in, outfp);	/*     print separating string */
	}
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
 * 30-Jan-97	SRMc - remove #include <string.h>
 * 27-Feb-97	SRMc - make input arguments const where possible
 */
