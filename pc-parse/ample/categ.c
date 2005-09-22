/* CATEG.C - handle categories and category classes for AMPLE and STAMP
 ******************************************************************************
 *
 * void			freeAmpleCategories(StringList * pCategories_io)
 * StringList *		addAmpleCategory(char *       pszLine_in,
 *					 StringList * pCategories_io,
 *                                       FILE *       pLogFP_in)
 * unsigned char	findAmpleCategoryNumber(const char *    pszName_in,
 *					     const StringList * pCategories_in)
 * char *		findAmpleCategoryName(int               iCatNum_in,
 *					     const StringList * pCategories_in)
 * void			writeAmpleCategories(FILE *             pOutputFP_in,
 *					     const StringList * pCategories_in)
 * void			freeAmpleCategClasses(
 *					 AmpleCategoryClass * pCategClasses_io)
 * AmpleCategoryClass *	addAmpleCategClass(
 *					 char *               pszLine_in,
 *					 const StringList *   pCategories_in,
 *					 AmpleCategoryClass * pCategClasses_io,
 *                                       FILE *               pLogFP_in)
 * AmpleCategoryClass *	findAmpleCategClass(const char * pszName_in)
 * int			isAmpleCategClassMember(int cat,
 *					const AmpleCategoryClass * pClass_in)
 * void			writeAmpleCategClasses(FILE * pOutputFP_in)
 *
 *****************************************************************************
 * edit history is in version.h
 *****************************************************************************
 * Copyright 1988, 2000 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern char * strchr  P((const char *s, int c));
extern int    strcmp  P((const char *s, const char *t));
extern size_t strspn  P((const char *s, const char *accept));
#endif /* STDC_HEADERS */
#include "stample.h"
#include "opaclib.h"

static void bad_cc P((FILE * pLogFP_in,
			  char * mcp,
			  const char * head,
			  char * body,
			  char * tail));

static const char szWhitespace_m[7] = " \t\r\n\f\v";

#if MAX_AMPLE_CATS > 255
CRASH AND BURN!!!!!!!!          /* produce a compiler error */
#endif

/*************************************************************************
 * NAME
 *    freeAmpleCategories
 * DESCRIPTION
 *    Initialize the categories by freeing up any space that may have
 *    been allocated.
 * RETURN VALUE
 *    none
 */
void freeAmpleCategories(pCategories_io)
StringList *	pCategories_io;
{
freeStringList( pCategories_io );
}

/*************************************************************************
 * NAME
 *    addAmpleCategory
 * ARGUMENTS
 *    line - pointer to "category" line from analysis data file
 * DESCRIPTION
 *    Add one or more categories defined by the user to the list of
 *    categories.
 * RETURN VALUE
 *    pointer to the updated list of categories
 */
StringList * addAmpleCategory(line, pCategories_io, pLogFP_in)
char *		line;
StringList *	pCategories_io;
FILE *		pLogFP_in;
{
char *		cat;
static const char	errhead[] = "CATEGORY: ";
/*
 *  check for a null line
 */
line += strspn(line, szWhitespace_m);
if ((line == (char *)NULL) || (*line == NUL))
	{
	if (pLogFP_in != NULL)
	fprintf(pLogFP_in, "%sEmpty definition\n", errhead);
	return pCategories_io;
	}
for ( cat = line ; *cat != '\0' ; cat = line )
	{
	line = isolateWord(cat);
	if (findAmpleCategoryNumber(cat, pCategories_io))
	{
	if (pLogFP_in != NULL)
		fprintf(pLogFP_in, "%s%s already defined\n", errhead, cat );
	}
	else if (getStringListSize(pCategories_io) >= MAX_AMPLE_CATS)
		{
	if (pLogFP_in != NULL)
		fprintf(pLogFP_in, "%sToo many categories - cannot define %s\n",
			errhead, cat);
		break;
		}
	else
		{
		/*
		 *  allocate space for this category and link it to the end of the
		 *  list of categories
		 */
	pCategories_io = mergeIntoStringListAtEnd(pCategories_io, cat);
		}
	}
return pCategories_io;
}

/*************************************************************************
 * NAME
 *    findAmpleCategoryNumber
 * ARGUMENTS
 *    name - pointer to category's name
 * DESCRIPTION
 *    Search for a specific category by name.
 * RETURN VALUE
 *    integer value of the category, or zero if not found
 */
unsigned char findAmpleCategoryNumber(name, pCategories_in)
const char *		name;
const StringList *	pCategories_in;
{
const StringList *	s;
int		k;
/*
 *  check for an empty name
 */
if ((name == (char *)NULL) || (*name == '\0'))
	return( 0 );
/*
 *  search down the list of category names
 */
for (	s = pCategories_in, k = 1 ;
	(s != NULL)     && (k <= MAX_AMPLE_CATS) ;
	s = s->pNext,     ++k )
	{
	if (strcmp(name,s->pszString) == 0)
		return((unsigned char) (k));
	}
return( 0 );
}

/*************************************************************************
 * NAME
 *    findAmpleCategoryName
 * ARGUMENTS
 *    catnum - category number
 * DESCRIPTION
 *    Search for the name of given category.
 * RETURN VALUE
 *    pointer to the category name, or NULL if nonexistent
 */
char * findAmpleCategoryName(catnum, pCategories_in)
int			catnum;
const StringList *	pCategories_in;
{
const StringList *	s;

catnum &= 0377;                 /* may have been sign-extended */
if (catnum == 0)
	return( NULL );		/* zero is invalid */
/*
 *  move to the catnum'th entry in the list, and return that category name
 */
for ( s = pCategories_in ; (--catnum != 0) && (s != NULL) ; s = s->pNext )
	;
if (s == NULL)
	return( NULL );		/* invalid category number */
else
	return( s->pszString );
}

/*************************************************************************
 * NAME
 *    writeAmpleCategories
 * DESCRIPTION
 *    Display the names of all the defined categories.
 * RETURN VALUE
 *    none
 */
void writeAmpleCategories(pOutputFP_in, pCategories_in)
FILE *			pOutputFP_in;
const StringList *	pCategories_in;
{
fprintf(pOutputFP_in, "Categories: ");
writeStringList(pCategories_in, " ", pOutputFP_in);
putc('\n', pOutputFP_in);
}

/*************************************************************************
 * NAME
 *    freeAmpleCategClasses
 * DESCRIPTION
 *    Initialize the category classes.
 * RETURN VALUE
 *    none
 */
void freeAmpleCategClasses(pCategClasses_io)
AmpleCategoryClass *	pCategClasses_io;
{
AmpleCategoryClass *	pClass;
AmpleCategoryClass *	pNextClass;

for ( pClass = pCategClasses_io ; pClass ; pClass = pNextClass )
	{
	pNextClass = pClass->pNext;
	if (pClass->pszName != NULL)
	freeMemory(pClass->pszName);
	if (pClass->pMembers != NULL)
	freeMemory(pClass->pMembers);
	freeMemory(pClass);
	}
}

/*************************************************************************
 * NAME
 *    addAmpleCategClass
 * ARGUMENTS
 *    line - pointer to "category class" line from analysis data file
 * DESCRIPTION
 *    Add a category class defined by the user to the list of category
 *    classes.
 * RETURN VALUE
 *    pointer to the updated list of category classes
 */
AmpleCategoryClass * addAmpleCategClass(line, pCategories_in, pCategClasses_io,
					pLogFP_in)
char *			line;
const StringList *	pCategories_in;
AmpleCategoryClass *	pCategClasses_io;
FILE *			pLogFP_in;
{
char *name;
char members[256];
register int i;
register unsigned char j;
register char *p;
register AmpleCategoryClass *cp;
char *q;
AmpleCategoryClass *mp;
static const char errhead[] = "CATEGORY CLASS: ";
/*
 *  split off the category class name and check that no category class by
 *  this name has been defined yet
 */
if ((line == NULL) || (*(name = line + strspn(line, szWhitespace_m)) == NUL))
	{
	if (pLogFP_in != NULL)
	fprintf(pLogFP_in, "%sEmpty definition\n", errhead );
	return pCategClasses_io;
	}
line = isolateWord(name);
if (*line == '\0')
	{
#ifndef hab3315
	if (pLogFP_in != NULL)
	  fprintf(pLogFP_in, "%sNo categories given in class %s\n", errhead, name);
#else  /* hab3315 */
	fprintf(pLogFP_in, "%sNo categories given in class %s\n", errhead, name);
#endif /* hab3315 */
	return pCategClasses_io;
	}
for ( cp = pCategClasses_io ; cp ; cp = cp->pNext )
	{
	if (strcmp(name, cp->pszName) == 0)
		{
#ifndef hab3315
	if (pLogFP_in != NULL)
	  fprintf(pLogFP_in, "%s%s already defined\n", errhead, name );
#else  /* hab3315 */
		fprintf(pLogFP_in, "%s%s already defined\n", errhead, name );
#endif /* hab3315 */
		return pCategClasses_io;
		}
	}
/*
 *  allocate space and store the category class name
 */
cp = (AmpleCategoryClass *)allocMemory(sizeof(AmpleCategoryClass));
cp->pszName = duplicateString(name);
/*
 *  get the categories
 */
for ( i = 0, p = line ; *p != '\0' ; p = line )
	{
	line = isolateWord(line);                 /* split off the leading token */
	if (*p == '[')
		{
		/*
		 *  we have a [, indicating a category class reference
		 *  look for the matching ]
		 */
		++p;
		if (*p == NUL)
			{
			p = line;
			line = isolateWord(line);
			}
		if ((p == (char *)NULL) || (*p == NUL))
			{
		if (pLogFP_in != NULL)
		{
		bad_cc(pLogFP_in, members, errhead,
			   "Dangling '[' in class definition of ", name);
		fprintf(pLogFP_in, "\n");
		}
			break;
			}
		q = strchr(p,']');
		if (q == (char *)NULL)
			{
			q = line;
			if ((q == (char *)NULL) || (*q == NUL) || (*q != ']'))
				{
		if (pLogFP_in != NULL)
			{
			bad_cc(pLogFP_in, members, errhead,
			   "Missing ']' in class definition of ", name);
			fprintf(pLogFP_in, "\n");
			}
				break;
				}
			line = isolateWord(line);
			}
		*q++ = NUL;
		if (*q != NUL)
			{
		if (pLogFP_in != NULL)
		{
		bad_cc(pLogFP_in, members, errhead,
			   "No whitespace following ']' in class definition of ",
			   name);
		fprintf(pLogFP_in, "\n");
		}
			members[0] = NUL;
			break;
			}
		/*
		 *  we have a complete category class reference with the category
		 *      class name pointed to by p and terminated by a NUL
		 *  check for a valid, already defined category class
		 */
		mp = findAmpleCategClass(p, pCategClasses_io);
		if (mp == NULL)
			{
		if (pLogFP_in != NULL)
		{
		bad_cc(pLogFP_in, members, errhead, "Unknown class \"", p);
		fprintf(pLogFP_in, "\" referenced in definition of \"%s\"\n",
			name);
		}
			break;
			}
		/*
		 *  copy the elements from the old category class to the new
		 */
		for ( q = (char *)mp->pMembers ; (q != NULL) && (*q != NUL) ; ++q )
			{
			members[i] = NUL;
			if (strchr(members,*q) == (char *)NULL)
				members[i++] = *q;
			}
		}
	else if (*p == ']')
		{
	if (pLogFP_in != NULL)
		{
		bad_cc(pLogFP_in, members, errhead,
		   "Unexpected ']' in class definition of ", name);
		fprintf(pLogFP_in, "\n");
		}
		break;
		}
	else
		{
		j = findAmpleCategoryNumber(p, pCategories_in);
		if (j == 0)
		{
		if (pLogFP_in != NULL)
		fprintf(pLogFP_in,
			"%sUndefined category \"%s\" in class \"%s\"\n",
			errhead, p, name);
		}
		else
			members[i++] = j;
		}
	}
/*
 *  terminate the class membership list and store it
 */
if (members[0] != NUL)
	{
	members[i] = '\0';
	cp->pMembers = (unsigned char *)duplicateString(members);
	/*
	 *  link this category class into the list
	 */
	cp->pNext = pCategClasses_io;
	pCategClasses_io = cp;
	}
return pCategClasses_io;
}

/*************************************************************************
 * NAME
 *    findAmpleCategClass
 * ARGUMENTS
 *    name - pointer to category class's name
 * DESCRIPTION
 *    Search for a specific category class by name.
 * RETURN VALUE
 *    pointer to the category class node, or NULL if not found
 */
AmpleCategoryClass * findAmpleCategClass(name, pCategClasses_in)
const char *			name;
const AmpleCategoryClass *	pCategClasses_in;
{
const AmpleCategoryClass *	cp;
/*
 *  check for an empty name
 */
if ((name == (char *)NULL) || (*name == '\0'))
	return(NULL);
/*
 *  search down the list of category classes
 */
for ( cp = pCategClasses_in ; cp ; cp = cp->pNext )
	{
	if (strcmp(name,cp->pszName) == 0)
		return((AmpleCategoryClass *)cp);
	}
return(NULL);
}

/*************************************************************************
 * NAME
 *    isAmpleCategClassMember
 * ARGUMENTS
 *    cat   - category number
 *    class - pointer to category class node
 * DESCRIPTION
 *    Search a category class for a specific category.
 * RETURN VALUE
 *    1 if found, 0 if not found
 */
int isAmpleCategClassMember(cat, class)
int				cat;
const AmpleCategoryClass *	class;
{
if (class)			/* check for null; hab 3.2.4 */
	return( strchr((char *)class->pMembers,(int)((char)cat)) != NULL );
return(0);
}

/*************************************************************************
 * NAME
 *    writeAmpleCategClasses
 * DESCRIPTION
 *    Display the contents of all the category classes.
 * RETURN VALUE
 *    none
 */
void writeAmpleCategClasses(pOutputFP_in, pCategories_in, pCategClasses_in)
FILE *	pOutputFP_in;
const StringList *		pCategories_in;
const AmpleCategoryClass *	pCategClasses_in;
{
const AmpleCategoryClass *	ccl;
char *				p;

fprintf(pOutputFP_in, "Category classes:\n");
for ( ccl = pCategClasses_in ; ccl ; ccl = ccl->pNext )
	{
	fprintf(pOutputFP_in, "    %s {", ccl->pszName);
	for ( p = (char *)ccl->pMembers ; *p ; ++p )
		fprintf(pOutputFP_in, " %s",
		findAmpleCategoryName(*p & 0377, pCategories_in));
	fprintf(pOutputFP_in, " }\n" );
	}
}

/***************************************************************************
 * NAME
 *    bad_cc
 * ARGUMENTS
 *    mcp  - pointer to category string
 *    head - first part of the error message
 *    body - second part of the error message
 *    tail - third part of the error message
 * DESCRIPTION
 *    Print an error message, then erase all of the elements stored for a
 *    category class.
 * RETURN VALUE
 *    none
 */
static void bad_cc(pLogFP_in, mcp, head, body, tail)
FILE *	pLogFP_in;
char *	mcp;
const char *	head;
char *	body;
char *	tail;
{
/*
 *  print the error message
 */
if (pLogFP_in != NULL)
	fprintf(pLogFP_in, "%s%s%s", head, body, tail );
/*
 *  erase any class members which may have been stored
 */
*mcp = NUL;
}
