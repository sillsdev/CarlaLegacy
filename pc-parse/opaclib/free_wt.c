/* FREE_WT.C - function to free a word_template structure
 ***************************************************************************
 *
 * #include "template.h"
 *
 * void freeWordTemplate(WordTemplate *word);
 *
 ***************************************************************************
 * Edit history is at the end of the file
 ***************************************************************************
 * Copyright 1991, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#include "template.h"
#include "allocmem.h"
#include "strlist.h"

#ifndef NULL
#define NULL (VOIDP)0
#endif

/***************************************************************************
 * NAME
 *    freeWordTemplate
 * ARGUMENTS
 *    word - word_template structure to free
 * DESCRIPTION
 *    Free everything in a word_template structure, and the structure.
 * RETURN VALUE
 *    None
 */
void freeWordTemplate( word )
WordTemplate *	word;
{
if (word == NULL)
	return;

if ( word->pszOrigWord )
	freeMemory( word->pszOrigWord );
if ( word->paWord )
	{
	size_t	i;

	for ( i = 0 ; word->paWord[i] ; ++i )
	freeMemory( word->paWord[i] );
	freeMemory( word->paWord );
	}
if ( word->pszFormat )
	freeMemory( word->pszFormat );
if ( word->pszNonAlpha )
	freeMemory( word->pszNonAlpha );
if ( word->pAnalyses )
	freeWordAnalysisList(word->pAnalyses);
if ( word->pNewWords )
	freeStringList( word->pNewWords );

freeMemory( word );
}

/***************************************************************************
 * EDIT HISTORY
 *  5-MAR-82	D. Weber/Bob Kasper
 * 19-MAR-85	hab/djw
 * 23-Sep-85	SRMc
 *  9-Mar-90	ALB - Set up for sentence transfer of multiple words
 *			Allocate this_word, make separate free_word() [1.0j]
 * 16-Sep-91	SRMc - extract free_word() from dtbin.c, rename to
 *			free_word_template()
 *  5-Oct-94	SRMc - changed #include "opaclib.h" to a list of the
 *			specific header files
 * 27-Oct-94	SRMc - handle the (relatively) new fdlist and catlist
 *			fields
 * 11-Oct-96	SRMc - catlist renamed to pcatlist for some reason
 * 14-Oct-96	SRMc - fix for renamed WordTemplate elements
 * 30-Jan-97	SRMc - fix for "config.h"
 */
