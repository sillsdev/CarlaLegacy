/* STRLIST.H - definition of StringList structure
 ***************************************************************************
 *
 *	StringList (struct strlist)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _STRLIST_H_INCLUDED
#define _STRLIST_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

/***************************************************************************
 *  structure for a linked list of NUL-terminated character strings
 */
typedef struct strlist
	{
	char *		pszString;	/* stored string */
	struct strlist *	pNext;		/* next node in linked list */
   } StringList;

/***************************************************************************
 *  function prototypes
 */
/* add_sl.c */
extern StringList * addToStringList P((StringList * pList_in,
					   const char * pszString_in));

/* merge_sl.c */
extern StringList * mergeIntoStringList P((StringList * pList_io,
					   const char * pszString_in));

/* appnd_sl.c */
extern StringList * mergeIntoStringListAtEnd P((StringList * pList_io,
						const char * pszString_in));

/* cat_sl.c */
extern StringList * mergeTwoStringLists P((StringList * pFirstList_io,
					   StringList * pSecondList_io));

/* copy_sl.c */
extern StringList * duplicateStringList P((const StringList * pList_in));

/* equal_sl.c */
extern int identicalStringLists P((const StringList * pFirstList_in,
				   const StringList * pSecondList_in));

/* equiv_sl.c */
extern int equivalentStringLists P((const StringList * pFirst_in,
					const StringList * pSecond_in));

/* free_sl.c */
extern void freeStringList P((StringList * pList_io));

/* membr_sl.c */
extern int isMemberOfStringList P((const StringList * pList_in,
				   const char * pszString_in));

/* rmstr_sl.c */
extern StringList * removeFromStringList P((StringList * pList_in,
						const char * pszString_in));

/* size_sl.c */
extern unsigned getStringListSize P((const StringList * pList_in));

/* sqz_sl.c */
extern StringList * squeezeStringList P((StringList * pList_io));

/* unlst_sl.c */
extern void unlinkStringList P((StringList **ppList_io));

/* updat_sl.c */
extern char * updateStringList P((StringList ** ppList_io,
				  const char * pszString_in));

/* write_sl.c */
#include <stdio.h>
extern void writeStringList P((const StringList * pList_in,
				   const char * pszSep_in,
				   FILE * pOutputFP_in));

/***************************************************************************
 *	EDIT HISTORY
 *  8-May-89	SRMc - extract from AMPLE's defs.h file
 * 16-Sep-91	SRMc - protect against multiple #include's
 *		     - provide ANSIfied function prototypes
 * 20-Jul-92	SRMc - add append_to_strlist()
 *		     - rename append_strlist() to catenate_strlist()
 *		     - split into individual file per function
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 *  8-Aug-96	SRMc - add typedef, convert structure element names to my
 *			variety of Hungarian notation
 * 10-Oct-96	SRMc - add unlist_strlist() and update_strlist() functions
 * 11-Feb-97	SRMc - rename add_to_strlist()    to mergeIntoStringList()
 *		     - rename append_to_strlist() to mergeIntoStringListAtEnd()
 *		     - rename catenate_strlist()    to mergeTwoStringLists()
 *		     - rename copy_strlist()        to duplicateStringList()
 *		     - rename equal_strlist()       to identicalStringLists()
 *		     - rename equivalent_strlist()  to equivalentStringLists()
 *		     - rename free_strlist()        to freeStringList()
 *		     - rename member_strlist()      to isMemberOfStringList()
 *		     - rename remove_from_strlist() to removeFromStringList()
 *		     - rename size_of_strlist()     to getStringListSize()
 *		     - rename squeeze_strlist()     to squeezeStringList()
 *		     - rename unlist_strlist()      to unlinkStringList()
 *		     - rename update_strlist()      to updateStringList()
 *		     - rename write_strlist()       to writeStringList()
 *  8-Oct-97	SRMc - cosmetic changes and proofreading
 * 21-Jul-98	SRMc - fix a typo in a comment
 * 16-Oct-98	SRMc - make header files safe for #including in C++ sources
 */
#ifdef __cplusplus
}
#endif
#endif /* _STRLIST_H_INCLUDED */
