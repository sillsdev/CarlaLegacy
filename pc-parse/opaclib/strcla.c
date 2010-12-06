/* STRCLA.C - process string classes
 ***************************************************************************
 *
 * void freeStringClasses(StringClass * pClasses_in)
 *
 * StringClass * addStringClass(char *        pszLine_in,
 *				StringClass * pClasses_io)
 *
 * StringClass * findStringClass(const char *        pszName_in,
 *				 const StringClass * pClasses_in)
 *
 * int isStringClassMember(const char *        pszString_in,
 *			   const StringClass * pClass_in)
 *
 * int matchBeginWithStringClass(const char *        pszString_in,
 *				 const StringClass * pClass_in)
 *
 * int matchEndWithStringClass(const char *        pszString_in,
 *			       const StringClass * pClass_in)
 *
 * void writeStringClasses(FILE *              pOutputFP_in,
 *                         const StringClass * pClasses_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern char * strcpy  P((char * dest, const char * src));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strchr  P((const char * s, int c));
extern size_t strlen  P((const char * s));
extern size_t strspn  P((const char * s, const char * accept));
#endif /*STDC_HEADERS*/

#include "cportlib.h"
#include "allocmem.h"
#include "textctl.h"
#include "rpterror.h"
#include "strclass.h"

/* OPAC library functions */
extern char *	isolateWord	P((char * pszLine_io));
extern int	matchBeginning	P((const char *s, const char *t));
extern int	matchEnd	P((const char *s, const char *t));

/* local functions */
#ifdef HAVE_STDARG_H
static void bad_sc P((StringClass *pClass_in, const char *pszFormat, ...));
#else
static void bad_sc();
#endif

static char szWhitespace_m[] = " \r\n\t\f\v";

/*************************************************************************
 * NAME
 *    freeStringClasses
 * DESCRIPTION
 *    Initialize the string classes.
 * RETURN VALUE
 *    none
 */
void freeStringClasses(pClasses_in)
StringClass *	pClasses_in;
{
StringClass *	pClass;
StringClass *	pNextClass;

for ( pClass = pClasses_in ; pClass != NULL ; pClass = pNextClass )
	{
	pNextClass = pClass->pNext;
	freeMemory( pClass->pszName );
	freeStringList( pClass->pMembers );
	freeMemory( pClass );
	}
}

/*************************************************************************
 * NAME
 *    addStringClass
 * DESCRIPTION
 *    Add a string class defined by the user to the list of string classes.
 * RETURN VALUE
 *    pointer to head of updated list of string classes
 */
StringClass * addStringClass(pszLine_in, pClasses_io)
char *		pszLine_in;	/* pointer to "string class" definition */
StringClass *	pClasses_io;
{
StringClass *		pClass;
char *			p;
char *			q;
char *			pszName;
char *			pszMember;
const StringClass *	pOldClass;
StringClass *		pTail;
StringList *		pStr;
static char		szErrorMsgHead[] = "STRING CLASS: ";

if (	(pszLine_in == NULL) ||
	(*(pszName = pszLine_in + strspn(pszLine_in, szWhitespace_m)) == NUL) )
	{
	reportError(ERROR_MSG, "%sEmpty definition\n", szErrorMsgHead );
	return pClasses_io;
	}
/*
 *  split off the string class name and check that no string class by
 *  this name has been defined yet
 */
pszMember = isolateWord(pszName);
if (findStringClass(pszName, pClasses_io) != NULL)
	{
	reportError(WARNING_MSG,
		"%s%s already defined\n", szErrorMsgHead, pszName );
	return pClasses_io;
	}
if (*pszMember == NUL)
	{
	reportError(WARNING_MSG, "%sNo strings given in class %s\n",
		szErrorMsgHead, pszName);
	return pClasses_io;
	}
/*
 *  allocate space and store the string class name
 */
pClass = (StringClass *)allocMemory(sizeof(StringClass));
pClass->pszName = duplicateString( pszName );
pClass->pMembers = NULL;
/*
 *  get the strings and store them
 */
for ( p = pszMember ; *p != NUL ; p = pszMember )
	{
	pszMember = isolateWord(pszMember);	/* split off the leading token */
	if (*p == '[')
	{
	/*
	 *  we have a [, indicating a string class reference
	 *  look for the matching ]
	 */
	++p;
	if (*p == NUL)
		{
		p = pszMember;
		pszMember = isolateWord(pszMember);
		}
	if ((p == (char *)NULL) || (*p == NUL))
		{
		bad_sc(pClass, "Dangling '[' in class definition of %s", pszName);
		break;
		}
	q = strchr(p,']');
	if (q == (char *)NULL)
		{
		q = pszMember;
		if ((q == (char *)NULL) || (*q == NUL) || (*q != ']'))
		{
		bad_sc(pClass, "Missing ']' in class definition of %s",
			   pszName);
		break;
		}
		pszMember = isolateWord(pszMember);
		}
	*q++ = NUL;
	if (*q != NUL)
		{
		bad_sc(pClass,
		   "No whitespace following ']' in class definition of %s",
		   pszName);
		break;
		}
	/*
	 *  we have a complete string class reference, with the string class
	 *  name pointed to by p and terminated by a NUL.  check for a valid,
	 *  already defined string class
	 */
	pOldClass = findStringClass(p, pClasses_io);
	if (pOldClass == (StringClass *)NULL)
		{
		bad_sc(pClass, "Unknown class %s referenced in definition of %s",
		   p, pszName);
		break;
		}
	/*
	 *  copy the elements from the old string class to the new
	 */
	for ( pStr = pOldClass->pMembers ; pStr ; pStr = pStr->pNext )
		pClass->pMembers = mergeIntoStringListAtEnd(pClass->pMembers,
							pStr->pszString);
	}
	else if (*p == ']')
	{
	bad_sc(pClass, "Unexpected ']' in class definition of %s", pszName);
	break;
	}
	else
	pClass->pMembers = mergeIntoStringListAtEnd(pClass->pMembers, p);
	}
/*
 *  link this string class into the list (only if it has members)
 */
if (pClass->pMembers == NULL)
	{
	freeMemory( (char *)pClass->pszName );
	freeMemory( (char *)pClass );
	}
else
	{
	if (pClasses_io != NULL)
	{
	for ( pTail = pClasses_io ; pTail->pNext ; pTail = pTail->pNext )
		;
	pTail->pNext = pClass;
	}
	else
	pClasses_io = pClass;
	pClass->pNext = NULL;
	/*
	 * Re-order members by length with the longest ones first in the list.
	 * We need this so partial reduplication (in AMPLE/STAMP)  will find
	 *  the longest matching member first.  Other uses do not care.
	 * While not the most efficient, we use a bubble sort (these lists
	 *  tend to be quite small).  See Knuth (1970:107).
	 */
	{
	  int bAnyExchanges = TRUE;
	  StringList * slpPrevious;
	  StringList * slpCurrent;
	  StringList * slpFollowing;
	  StringList * slpTemp;

	  while (bAnyExchanges == TRUE)
	{
	  bAnyExchanges = FALSE;
	  slpPrevious = slpCurrent = pClass->pMembers;
	  while (slpCurrent != NULL && slpCurrent->pNext != NULL)
		{
		  slpFollowing = slpCurrent->pNext;
		  if (strlen(slpCurrent->pszString) < strlen(slpFollowing->pszString))
		{
		  slpTemp = slpFollowing->pNext;
		  slpFollowing->pNext = slpCurrent;
		  slpCurrent->pNext = slpTemp;
		  bAnyExchanges = TRUE;
		  if (slpCurrent == pClass->pMembers)
			{
			  pClass->pMembers = slpFollowing;
			}
		  else
			{
			  slpPrevious->pNext = slpFollowing;
			}
		  slpPrevious = slpFollowing;
		}
		  else
		{
		  slpPrevious = slpCurrent;
		  slpCurrent = slpFollowing;
		}
		}
	}
	}
	}
 return pClasses_io;
}

/*************************************************************************
 * NAME
 *    findStringClass
 * DESCRIPTION
 *    Search for a specific string class by name.
 * RETURN VALUE
 *    pointer to the string class node, or NULL if not found
 */
StringClass * findStringClass(pszName_in, pClasses_in)
const char *		pszName_in;
const StringClass *	pClasses_in;
{
const StringClass *	pClass;

for ( pClass = pClasses_in ; pClass != NULL ; pClass = pClass->pNext )
	{
	if (strcmp(pszName_in, pClass->pszName) == 0)
	return (StringClass *)pClass;
	}
return NULL;
}

/*************************************************************************
 * NAME
 *    isStringClassMember
 * DESCRIPTION
 *    Search a string class for a specific string.
 * RETURN VALUE
 *    1 if found, 0 if not found
 */
int isStringClassMember(pszString_in, pClass_in)
const char *		pszString_in;	/* string to look for */
const StringClass *	pClass_in;	/* pointer to a string class */
{
if ((pszString_in == NULL) || (pClass_in == NULL))
	return 0;
return isMemberOfStringList(pClass_in->pMembers, pszString_in);
}

/*************************************************************************
 * NAME
 *    matchBeginWithStringClass
 * DESCRIPTION
 *    Search a string class for a specific string, matching at the left
 *    (beginning).
 * RETURN VALUE
 *    length of successful match if found, 0 if not found
 */
size_t matchBeginWithStringClass(pszString_in, pClass_in)
const char *		pszString_in;	/* string to match against */
const StringClass *	pClass_in;	/* pointer to a string class */
{
const StringList *	pStr;

if ((pszString_in == NULL) || (pClass_in == NULL))
	return 0;
for ( pStr = pClass_in->pMembers ; pStr != NULL ; pStr = pStr->pNext )
	{
	if (matchBeginning(pszString_in, pStr->pszString))
	return strlen(pStr->pszString);
	}
return 0;
}

/*************************************************************************
 * NAME
 *    matchEndWithStringClass
 * DESCRIPTION
 *    Search a string class for a specific string, matching at the right
 *    (end).
 * RETURN VALUE
 *    length of successful match if found, 0 if not found
 */
size_t matchEndWithStringClass(pszString_in, pClass_in)
const char *		pszString_in;	/* string to match against */
const StringClass *	pClass_in;	/* pointer to a string class */
{
StringList *	sp;

if ((pszString_in == NULL) || (pClass_in == NULL))
	return 0;
for ( sp = pClass_in->pMembers ; sp != (StringList *)NULL ; sp = sp->pNext )
	{
	if (matchEnd(pszString_in, sp->pszString))
	return strlen(sp->pszString);
	}
return 0;
}

/*************************************************************************
 * NAME
 *    writeStringClasses
 * DESCRIPTION
 *    write the contents of all the string classes to a file.
 * RETURN VALUE
 *    none
 */
void writeStringClasses(pOutputFP_in, pClasses_in)
FILE *			pOutputFP_in;
const StringClass *	pClasses_in;
{
const StringClass *	pClass;
const StringList *	pStr;

if (pOutputFP_in == NULL)
	return;
fprintf(pOutputFP_in, "String classes:");
for ( pClass = pClasses_in ; pClass ; pClass = pClass->pNext )
	{
	fprintf(pOutputFP_in,  "\n    %s {", pClass->pszName);
	for ( pStr = pClass->pMembers ; pStr ; pStr = pStr->pNext )
	fprintf(pOutputFP_in, " %s", pStr->pszString );
	fprintf(pOutputFP_in,  " }" );
	}
fprintf(pOutputFP_in, "\n");
}

/***************************************************************************
 * NAME
 *    bad_sc
 * ARGUMENTS
 *    pClass_in  - pointer to string class structure
 * DESCRIPTION
 *    Print an error message, then erase all of the elements stored for a
 *    string class.
 * RETURN VALUE
 *    none
 */
#ifdef HAVE_STDARG_H
static void bad_sc(StringClass *pClass_in, const char *pszFormat, ...)
{
va_list		marker;
StringList *	pStr;
StringList *	pNextStr;
char		szBuffer[256];

va_start( marker, pszFormat );
#else
static void bad_sc( va_alist )
{
va_list		marker;
StringClass *	pClass_in;
char *		pszFormat;
StringList *	pStr;
StringList *	pNextStr;
char		szBuffer[256];

va_start( marker );
pClass_in = va_arg( marker, StringClass * );
pszFormat = va_arg( marker, char * );
#endif
/*
 *  print the error message
 */
vsprintf(szBuffer, pszFormat, marker);
reportError(ERROR_MSG, "STRING CLASS: %s\n", szBuffer);
/*
 *  erase any class members which may have been stored
 */
for ( pStr = pClass_in->pMembers ; pStr ; pStr = pNextStr )
	{
	pNextStr = pStr->pNext;
	freeMemory( (char *)pStr->pszString );
	freeMemory( (char *)pStr );
	}
pClass_in->pMembers = NULL;
}

/***************************************************************************
 *      EDIT HISTORY
 *       4-May-88       Steve McConnel
 *       9-May-88       SRMc - added show_scl()
 *                           - fixed scl_match() to return length of
 *                              successful match (still zero if unsuccessful)
 *      28-Jul-88       SRMc - replace ssalloc() with malloc() and realloc()
 *      24-Aug-88       SRMc - regularize error messages
 *      30-Aug-88       SRMc - remove quotes from output of show_scl()
 *      21-Oct-88       SRMc - reorganize the file header comments
 *      24-Oct-88       SRMc - trace down Aztec C code generation bug (UGH!!)
 *      10-Nov-88       SRMc - replace free() with myfree()
 *       3-Apr-89       SRMc - allow previously defined string classes to be
 *                              used in defining string classes
 *      16-May-89       SRMc - revise #include's to share code with STAMP
 *                           - renamed load_scl() to add_scl()
 *      13-Jul-89       hab  - de-"lint" the source
 * 1.1b 29-Jun-90 BK/ALB Fix for portability to MAC, add string.h
 * 1.6e 02-Aug-90 hab Change index to strchr and rindex to strrchr
 * 17-Jan-91	SRMc - add ANSI-fied function prototypes
 *		     - use strcmp() instead of streq()
 *		     - declare bad_sc() as static void
 *		     - declare show_scl() as void
 * 29-Jan-91	SRMc - merged in AMPLE 1.6f sources
 *		     - fixed return(strlen())'s for THINK C
 * 11-Mar-91	SRMc - remove #define strchr -- it's in OPACLIB.H
 * 16-Sep-91	SRMc - delint with GNU C "-Wall -ansi -pedantic" and
 *			Microsoft C -W3
 * 23-Jan-92	SRMc - move edit history to end of the file
 *		     - replace skipwhite() with inline code
 *  1-Jun-92	SRMc - replace stcmp() with match_begin()
 *		     - replace rstcmp() with match_end()
 *  9-Sep-92	SRMc - add mysecret_set_scl() and mysecret_get_scl()
 * 15-Sep-92	SRMc - use append_to_strlist() to keep class elements
 *			in input order, and keep classes in input order
 *			as well
 * 26-May-93	SRMc - commit to using append_to_strlist() by removing
 *			#if's
 *  7-Aug-96	SRMc - replace printf(...) with report_error(0,...)
 *		     - revise bad_sc() to use variable argument list,
 *			vsprintf(), and report_error()
 * 14-Oct-96	SRMc - change #include "opaclib.h" to individual #includes
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 24-Feb-97	SRMc - revise to use (StringClass *) argument to functions
 *			rather than hiding everything
 *		     - eliminate mysecret_set_scl() and mysecret_get_scl()
 * 28-Feb-97	SRMc - make input arguments const wherever possible
 *		     - check input arguments more carefully
 * 23-May-97	SRMc - showStringClasses() changed to writeStringClasses()
 *  2-Oct-97	SRMc - fix for revised reportError()
 */
