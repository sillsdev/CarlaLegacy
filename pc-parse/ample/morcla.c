/* MORCLA.C - process morpheme classes for AMPLE and STAMP
 ******************************************************************************
 *
 * void freeAmpleMorphClasses(AmpleMorphClass * pMorphClasses_io)
 *
 * AmpleMorphClass * addAmpleMorphClass(char *            pszLine_in,
 *					AmpleMorphClass * pMorphClasses_io)
 *
 * AmpleMorphClass * findAmpleMorphClass(
 *				    const char *            pszName_in,
 *				    const AmpleMorphClass * pMorphClasses_in)
 *
 * int isAmpleMorphClassMember(const char *            pszMorpheme_in,
 *			       const AmpleMorphClass * pClass_in)
 *
 * void writeAmpleMorphClasses(FILE *                  pOutputFP_in,
 *			       const AmpleMorphClass * pMorphClasses_in)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1988, 2000 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <ctype.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#define
#endif
extern char * strchr  P((const char *s, int c));
extern int    strcmp  P((const char *s, const char *t));
extern size_t strspn  P((const char *s, const char *accept));
#endif /* STDC_HEADERS */
#include "stample.h"
#include "opaclib.h"

static void  bad_mc P((FILE * pLogFP_in,
			   AmpleMorphClass * mcp,
			   const char * head,
			   char * body,
			   char * tail));

static const char szWhitespace_m[7] = " \t\r\n\f\v";

/*************************************************************************
 * NAME
 *    freeAmpleMorphClasses
 * DESCRIPTION
 *    Initialize the morpheme classes.
 * RETURN VALUE
 *    none
 */
void freeAmpleMorphClasses(pMorphClasses_io)
AmpleMorphClass *	pMorphClasses_io;
{
AmpleMorphClass *	pClass;
AmpleMorphClass *	pNextClass;

for ( pClass = pMorphClasses_io ; pClass ; pClass = pNextClass )
	{
	pNextClass = pClass->pNext;
	freeMemory(pClass->pszName);
	freeStringList(pClass->pMembers);
	freeMemory(pClass);
	}
}

/*************************************************************************
 * NAME
 *    addAmpleMorphClass
 * ARGUMENTS
 *    line - pointer to "morpheme class" line from analysis data file
 * DESCRIPTION
 *    Add a morpheme class defined by the user to the list of morpheme
 *    classes.
 * RETURN VALUE
 *    pointer to the updated list of morpheme classes
 */
AmpleMorphClass * addAmpleMorphClass(pszLine_in, pMorphClasses_io, pLogFP_in)
char *			pszLine_in;
AmpleMorphClass *	pMorphClasses_io;
FILE *			pLogFP_in;
{
AmpleMorphClass *	cp;
AmpleMorphClass *	mp;
StringList *		tp;
StringList *		sp;
char *			p;
char *			q;
char *			name;
char *			line;
static const char	errhead[] = "MORPHEME CLASS: ";
/*
 *  split off the morpheme class name and check that no morpheme class by
 *  this name has been defined yet
 */
line = pszLine_in;
if ((line == NULL) || (*(name = line + strspn(line, szWhitespace_m)) == NUL))
	{
	if (pLogFP_in != NULL)
	fprintf(pLogFP_in, "%sEmpty definition\n", errhead);
	return pMorphClasses_io;
	}
line = isolateWord(name);
if (*line == NUL)
	{
	if (pLogFP_in != NULL)
	fprintf(pLogFP_in, "%sNo morphnames given in class %s\n",
		errhead, name);
	return pMorphClasses_io;
	}
for ( cp = pMorphClasses_io ; cp != (AmpleMorphClass *)NULL ; cp = cp->pNext )
	{
	if (strcmp(name, cp->pszName) == 0)
		{
	if (pLogFP_in != NULL)
		fprintf(pLogFP_in, "%s%s already defined\n", errhead, name);
		return pMorphClasses_io;
		}
	}
/*
 *  allocate space and store the morpheme class
 */
cp = (AmpleMorphClass *)allocMemory(sizeof(AmpleMorphClass));
cp->pszName = duplicateString(name);
cp->pMembers = (StringList *)NULL;
/*
 *  get the morphemes and store them
 */
for ( p = line ; *p != NUL ; p = line )
	{
	line = isolateWord(line);                 /* split off the leading token */
	if (*p == '[')
		{
		/*
		 *  we have a [, indicating a morpheme class reference
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
		bad_mc(pLogFP_in, cp, errhead,
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
			bad_mc(pLogFP_in, cp, errhead,
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
		bad_mc(pLogFP_in, cp, errhead,
			   "No whitespace following ']' in class definition of ",
			   name);
		fprintf(pLogFP_in, "\n");
		}
			break;
			}
		/*
		 *  we have a complete morpheme class reference, with the morpheme
		 *      class name pointed to by p and terminated by a NUL
		 *  check for a valid, already defined morpheme class
		 */
		 mp = findAmpleMorphClass(p, pMorphClasses_io);
		if (mp == (AmpleMorphClass *)NULL)
			{
		if (pLogFP_in != NULL)
		{
		bad_mc(pLogFP_in, cp, errhead, "Unknown class \"", p);
		fprintf(pLogFP_in, "\" referenced in definition of \"%s\"\n",
			name);
		}
			break;
			}
		/*
		 *  copy the elements from the old morpheme class to the new
		 */
		for ( tp = mp->pMembers ; tp ; tp = tp->pNext )
			{
			sp = (StringList *)allocMemory(sizeof(StringList));
			p = tp->pszString;
			sp->pszString = duplicateString(p);
			sp->pNext = cp->pMembers;
			cp->pMembers = sp;
			}
		}
	else if (*p == ']')
		{
	if (pLogFP_in != NULL)
		{
		bad_mc(pLogFP_in, cp, errhead,
		   "Unexpected ']' in class definition of ", name);
		fprintf(pLogFP_in, "\n");
		}
	break;
		}
	else
		{
		sp = (StringList *)allocMemory(sizeof(StringList));
		sp->pszString = duplicateString(p);
		sp->pNext = cp->pMembers;     /* link into the morpheme list */
		cp->pMembers = sp;
		}
	}
/*
 *  link this morpheme class into the list (only if it has members)
 */
if (cp->pMembers != NULL)
	{
	cp->pNext = pMorphClasses_io;
	pMorphClasses_io = cp;
	}
else
	{
	freeMemory(cp->pszName);
	freeMemory(cp);
	}
return pMorphClasses_io;
}

/*************************************************************************
 * NAME
 *    findAmpleMorphClass
 * ARGUMENTS
 *    name - pointer to morpheme class's name
 * DESCRIPTION
 *    Search for a specific morpheme class by name.
 * RETURN VALUE
 *    pointer to the morpheme class node, or NULL if not found
 */
AmpleMorphClass * findAmpleMorphClass(pszName_in, pMorphClasses_in)
const char *		pszName_in;
const AmpleMorphClass *	pMorphClasses_in;
{
const AmpleMorphClass *	cp;

for ( cp = pMorphClasses_in ; cp ; cp = cp->pNext )
	{
	if (strcmp(pszName_in, cp->pszName) == 0)
		return((AmpleMorphClass *)cp);
	}
return(NULL);
}

/*************************************************************************
 * NAME
 *    isAmpleMorphClassMember
 * ARGUMENTS
 *    morpheme - morpheme to look for
 *    class  - pointer to morpheme class node
 * DESCRIPTION
 *    Search a morpheme class for a specific morpheme.
 * RETURN VALUE
 *    1 if found, 0 if not found
 */
int isAmpleMorphClassMember(morpheme,class)
const char *morpheme;
const AmpleMorphClass *class;
{
register StringList *sp;

										 /* if the class is undefined, fail */
if (class == (AmpleMorphClass *)NULL) /* this is a safety check */
   return(0);
for ( sp = class->pMembers ; sp != (StringList *)NULL ; sp = sp->pNext )
	{
	if (strcmp(morpheme,sp->pszString) == 0)
		return( 1 );
	}
return( 0 );
}

/*************************************************************************
 * NAME
 *    writeAmpleMorphClasses
 * DESCRIPTION
 *    Display the contents of all the morpheme classes.
 * RETURN VALUE
 *    none
 */
void writeAmpleMorphClasses(pOutputFP_in, pMorphClasses_in)
FILE *			pOutputFP_in;
const AmpleMorphClass *	pMorphClasses_in;
{
const AmpleMorphClass *mcl;
const StringList *sp;

if (pOutputFP_in == NULL)
	return;
fprintf(pOutputFP_in, "\nMorpheme classes:");
for ( mcl = pMorphClasses_in ; mcl ; mcl = mcl->pNext )
	{
	fprintf(pOutputFP_in, "\n    %s {", mcl->pszName);
	for ( sp = mcl->pMembers ; sp ; sp = sp->pNext )
		fprintf(pOutputFP_in," %s", sp->pszString );
	fprintf(pOutputFP_in, " }" );
	}
fprintf(pOutputFP_in, "\n");
}

/***************************************************************************
 * NAME
 *    bad_mc
 * ARGUMENTS
 *    mcp  - pointer to morpheme class structure
 *    head - first part of the error message
 *    body - second part of the error message
 *    tail - third part of the error message
 * DESCRIPTION
 *    Print an error message, then erase all of the elements stored for a
 *    morpheme class.
 * RETURN VALUE
 *    none
 */
static void bad_mc(pLogFP_in, mcp, head, body, tail)
FILE *		  pLogFP_in;
AmpleMorphClass * mcp;
const char *	  head;
char *		  body;
char *		  tail;
{
/*
 *  print the error message
 */
fprintf(pLogFP_in, "%s%s%s", head, body, tail);
mcp->pMembers = (StringList *)NULL;
}
