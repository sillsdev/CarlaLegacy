/*  PUNCLASS.H - define punctuation class structure  hab 3.3.0
 ***************************************************************************
 *
 *	PunctClass (struct punct_class)
 *
 ***************************************************************************
 * Copyright 1988, 1999 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _PUNCLASS_H_INCLUDED
#define _PUNCLASS_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include "strlist.h"

/*************************************************************************
 * structure for punctuation classes
 *
 *  All of the punctuation classes are stored in a single linked list.
 *  Each node of this list has a pointer to the class name, and a pointer
 *  to a linked list of punctuation strings which comprise the members of
 *  the class.
 */
typedef struct punct_class {
	char *		  pszName;	/* name of the punct class */
	StringList *	  pMembers;	/* members of the punct class */
	struct punct_class * pNext;	/* pointer to next punct class */
	} PunctClass;


extern void freePunctClasses P((PunctClass * pClasses_io));
extern PunctClass * addPunctClass P((char *        pszField_in,
					 PunctClass * pClasses_io));
extern PunctClass * findPunctClass P((const char *        pszName_in,
					  const PunctClass * pClasses_in));
extern int isPunctClassMember P((const char *        pszPunct_in,
				  const PunctClass * pClass_in));
extern size_t matchBeginWithPunctClass P((const char *        pszPunct_in,
					   const PunctClass * pClass_in));
extern size_t matchEndWithPunctClass P((const char *        pszPunct_in,
					 const PunctClass * pClass_in));
extern void writePunctClasses P((FILE *              pOutputFP_in,
				  const PunctClass * pClasses_in));

/***************************************************************************
 * EDIT HISTORY
 * 11-May-1999	hab  - Andy Black based on strclass.h
 */
#ifdef __cplusplus
}
#endif
#endif /* _PUNCLASS_H_INCLUDED */
