/*  STRCLASS.H - define string class structure
 ***************************************************************************
 *
 *	StringClass (struct string_class)
 *
 ***************************************************************************
 * Copyright 1988, 2000 by SIL International.  All rights reserved.
 */
#ifndef _STRCLASS_H_INCLUDED
#define _STRCLASS_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#include "strlist.h"

/*************************************************************************
 * structure for string classes
 *
 *  All of the string classes are stored in a single linked list.
 *  Each node of this list has a pointer to the class name, and a pointer
 *  to a linked list of strings which comprise the members of the class.
 */
typedef struct string_class {
	char *		  pszName;	/* name of the string class */
	StringList *	  pMembers;	/* members of the string class */
	struct string_class * pNext;	/* pointer to next string class */
	} StringClass;


extern void freeStringClasses P((StringClass * pClasses_io));
extern StringClass * addStringClass P((char *        pszField_in,
					   StringClass * pClasses_io));
extern StringClass * findStringClass P((const char *        pszName_in,
					const StringClass * pClasses_in));
extern int isStringClassMember P((const char *        pszString_in,
				  const StringClass * pClass_in));
extern size_t matchBeginWithStringClass P((const char *        pszString_in,
					   const StringClass * pClass_in));
extern size_t matchEndWithStringClass P((const char *        pszString_in,
					 const StringClass * pClass_in));
extern void writeStringClasses P((FILE *              pOutputFP_in,
				  const StringClass * pClasses_in));

/***************************************************************************
 * EDIT HISTORY
 *  3-May-88	Steve McConnel
 * 21-Oct-88	SRMc - reorganize the file header comments
 * 17-May-89	SRMc - define struct morph_class for real
 * 17-Sep-91	SRMc - split into separate files for each class
 * 23-Jan-92	SRMc - add function prototypes
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 *  8-Aug-96	SRMc - add typedef, convert structure element names
 * 			to my variety of Hungarian notation
 *  1-Nov-96	SRMc - rename the functions with longer, more
 *			meaningful names
 * 24-Feb-97	SRMc - revise to use (StringClass *) argument to functions
 *			rather than hiding everything
 * 23-May-97	SRMc - showStringClasses() changed to writeStringClasses()
 *  8-Oct-97	SRMc - cosmetic changes and proofreading
 * 21-Jul-98	SRMc - fix a couple of typos in comments
 * 16-Oct-98	SRMc - make header files safe for #including in C++ sources
 */
#ifdef __cplusplus
}
#endif
#endif /* _STRCLASS_H_INCLUDED */
