/* PUNCLA.C - process punctuation classes
 ***************************************************************************
 *
 * void freePunctClasses(PunctClass * pClasses_in)
 *
 * PunctClass * addPunctClass(char *        pszLine_in,
 *				PunctClass * pClasses_io)
 *
 * PunctClass * findPunctClass(const char *        pszName_in,
 *				 const PunctClass * pClasses_in)
 *
 * int isPunctClassMember(const char *        pszPunct_in,
 *			   const PunctClass * pClass_in)
 *
 * int matchBeginWithPunctClass(const char *        pszPunct_in,
 *				 const PunctClass * pClass_in)
 *
 * int matchEndWithPunctClass(const char *        pszPunct_in,
 *			       const PunctClass * pClass_in)
 *
 * void writePunctClasses(FILE *              pOutputFP_in,
 *                         const PunctClass * pClasses_in)
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
#include "punclass.h"

/* OPAC library functions */
extern char *	isolateWord	P((char * pszLine_io));
extern int	matchBeginning	P((const char *s, const char *t));
extern int	matchEnd	P((const char *s, const char *t));

/* local functions */
#ifdef HAVE_STDARG_H
static void bad_sc P((PunctClass *pClass_in, const char *pszFormat, ...));
#else
static void bad_sc();
#endif

static char szWhitespace_m[] = " \r\n\t\f\v";

/*************************************************************************
 * NAME
 *    freePunctClasses
 * DESCRIPTION
 *    Initialize the punct classes.
 * RETURN VALUE
 *    none
 */
void freePunctClasses(pClasses_in)
PunctClass *	pClasses_in;
{
PunctClass *	pClass;
PunctClass *	pNextClass;

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
 *    addPunctClass
 * DESCRIPTION
 *    Add a punctuation class defined by the user to the list of punctuation classes.
 * RETURN VALUE
 *    pointer to head of updated list of punctuation classes
 */
PunctClass * addPunctClass(pszLine_in, pClasses_io)
char *		pszLine_in;	/* pointer to "punctuation class" definition */
PunctClass *	pClasses_io;
{
PunctClass *		pClass;
char *			p;
char *			q;
char *			pszName;
char *			pszMember;
const PunctClass *	pOldClass;
PunctClass *		pTail;
StringList *		pStr;
static char		szErrorMsgHead[] = "PUNCTUATION CLASS: ";

if (	(pszLine_in == NULL) ||
	(*(pszName = pszLine_in + strspn(pszLine_in, szWhitespace_m)) == NUL) )
	{
	reportError(ERROR_MSG, "%sEmpty definition\n", szErrorMsgHead );
	return pClasses_io;
	}
/*
 *  split off the punctuation class name and check that no punctuation class by
 *  this name has been defined yet
 */
pszMember = isolateWord(pszName);
if (findPunctClass(pszName, pClasses_io) != NULL)
	{
	reportError(WARNING_MSG,
		"%s%s already defined\n", szErrorMsgHead, pszName );
	return pClasses_io;
	}
if (*pszMember == NUL)
	{
	reportError(WARNING_MSG, "%sNo punctuation marks given in class %s\n",
		szErrorMsgHead, pszName);
	return pClasses_io;
	}
/*
 *  allocate space and store the punctuation class name
 */
pClass = (PunctClass *)allocMemory(sizeof(PunctClass));
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
	 *  we have a [, indicating a punctuation class reference
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
	 *  we have a complete punctuation class reference, with the punctuation class
	 *  name pointed to by p and terminated by a NUL.  check for a valid,
	 *  already defined punctuation class
	 */
	pOldClass = findPunctClass(p, pClasses_io);
	if (pOldClass == (PunctClass *)NULL)
		{
		bad_sc(pClass, "Unknown class %s referenced in definition of %s",
		   p, pszName);
		break;
		}
	/*
	 *  copy the elements from the old punctuation class to the new
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
 *  link this punctuation class into the list (only if it has members)
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
	}
return pClasses_io;
}

/*************************************************************************
 * NAME
 *    findPunctClass
 * DESCRIPTION
 *    Search for a specific punctuation class by name.
 * RETURN VALUE
 *    pointer to the punctuation class node, or NULL if not found
 */
PunctClass * findPunctClass(pszName_in, pClasses_in)
const char *		pszName_in;
const PunctClass *	pClasses_in;
{
const PunctClass *	pClass;

for ( pClass = pClasses_in ; pClass != NULL ; pClass = pClass->pNext )
	{
	if (strcmp(pszName_in, pClass->pszName) == 0)
	return (PunctClass *)pClass;
	}
return NULL;
}

/*************************************************************************
 * NAME
 *    isPunctClassMember
 * DESCRIPTION
 *    Search a punctuation class for a specific string.
 * RETURN VALUE
 *    1 if found, 0 if not found
 */
int isPunctClassMember(pszString_in, pClass_in)
const char *		pszString_in;	/* string to look for */
const PunctClass *	pClass_in;	/* pointer to a punctuation class */
{
if ((pszString_in == NULL) || (pClass_in == NULL))
	return 0;
return isMemberOfStringList(pClass_in->pMembers, pszString_in);
}

/*************************************************************************
 * NAME
 *    matchBeginWithPunctClass
 * DESCRIPTION
 *    Search a punctuation class for a specific string, matching at the left
 *    (beginning).
 * RETURN VALUE
 *    length of successful match if found, 0 if not found
 */
size_t matchBeginWithPunctClass(pszString_in, pClass_in)
const char *		pszString_in;	/* string to match against */
const PunctClass *	pClass_in;	/* pointer to a punctuation class */
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
 *    matchEndWithPunctClass
 * DESCRIPTION
 *    Search a punctuation class for a specific string, matching at the right
 *    (end).
 * RETURN VALUE
 *    length of successful match if found, 0 if not found
 */
size_t matchEndWithPunctClass(pszString_in, pClass_in)
const char *		pszString_in;	/* string to match against */
const PunctClass *	pClass_in;	/* pointer to a punctuation class */
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
 *    writePunctClasses
 * DESCRIPTION
 *    write the contents of all the punctuation classes to a file.
 * RETURN VALUE
 *    none
 */
void writePunctClasses(pOutputFP_in, pClasses_in)
FILE *			pOutputFP_in;
const PunctClass *	pClasses_in;
{
const PunctClass *	pClass;
const StringList *	pStr;

if (pOutputFP_in == NULL)
	return;
fprintf(pOutputFP_in, "Punctuation classes:");
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
 *    pClass_in  - pointer to punctuation class structure
 * DESCRIPTION
 *    Print an error message, then erase all of the elements stored for a
 *    punctuation class.
 * RETURN VALUE
 *    none
 */
#ifdef HAVE_STDARG_H
static void bad_sc(PunctClass *pClass_in, const char *pszFormat, ...)
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
PunctClass *	pClass_in;
char *		pszFormat;
StringList *	pStr;
StringList *	pNextStr;
char		szBuffer[256];

va_start( marker );
pClass_in = va_arg( marker, PunctClass * );
pszFormat = va_arg( marker, char * );
#endif
/*
 *  print the error message
 */
vsprintf(szBuffer, pszFormat, marker);
reportError(ERROR_MSG, "PUNCTUATION CLASS: %s\n", szBuffer);
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
 *      11-May-1999     hab Andy Black based on strcla.c
 */
