/* PROPER.C - process allomorph and morpheme properties for AMPLE and STAMP
 ******************************************************************************
 *
 * void freeAmpleProperties(AmpleProperties * pProperties_io,
 *			    StringList *      pPropertySets_io)
 * unsigned short findAmplePropertyNumber(
 *                                      const char *            pszName_in,
 *					const AmpleProperties * pProperties_in)
 * char * findAmplePropertyName(unsigned                uiPropNumber_in,
 *				const AmpleProperties * pProperties_in)
 * unsigned short addAmpleProperty(char *            pszLine_in,
 *				   int               eType_in,
 *				   AmpleProperties * pProperties_io)
 * int isAmpleAllomorphProperty(unsigned          uiPropNumber_in,
 *				AmpleProperties * pProperties_io)
 * void writeAmplePropertySet(const PropertySet_t     pPropertySet_in,
 *			      const AmpleProperties * pProperties_in,
 *			      FILE *                  pOutputFP_in)
 * int hasAmpleProperty(const PropertySet_t     pProperties_in,
 *			unsigned                uiProp_in,
 *			const AmpleProperties * pProperties_in)
 * char * parseAmplePropertySet(char *                  pszLine_in,
 *				PropertySet_t *         ppPropertySet_io,
 *				int                     eType_in,
 *				int                     uiDictEntry_in,
 *				const char *            pszRecordKey_in,
 *				const char *            pszErrorHeader_in,
 *				const AmpleProperties * pProperties_in,
 *				StringList **           ppPropertySetList_io)
 * void mergeAmplePropertySets(PropertySet_t *         ppPropertySet_io,
 *			       const PropertySet_t     p2ndPropertySet_in,
 *			       int                     uiDictEntry_in,
 *			       const char *            pszRecordKey_in,
 *			       const AmpleProperties * pProperties_in,
 *			       StringList **           ppPropertySetList_io)
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
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern char * strchr  P((const char *s, int c));
extern int    strcmp  P((const char *s, const char *t));
extern size_t strspn  P((const char *s, const char *accept));
extern void * memset  P((void *s, int c, size_t n));
#endif /* STDC_HEADERS */
#include "stample.h"
#include "opaclib.h"
/* dynstr.c */
extern char * appendDynamicString P((char *       pszString_io,
					 size_t *     puiStringSize_io,
					 const char * pszAdded_in));

static const char	szWhitespace_m[7] = " \t\r\n\f\v";

static unsigned short * widestrchr P((const unsigned short * pString_in,
					  unsigned               uiVal_in));
static size_t widestrlen P((const unsigned short * pWideString_in));
static unsigned short * widestrcpy P((unsigned short *       pWideOut_in,
					  const unsigned short * pWideIn_in));
static int widestrcmp P((const unsigned short * pWide1st_in,
			 const unsigned short * pWide2nd_in));
/*
 * 18-Sep-1998	hab - based on updateStringList (opaclib/update_sl.c) and
 *                     duplicateString (opaclib/allocmem.c)
 */
static unsigned short * duplicateWideString P((
					 const unsigned short * pszString_in));
static unsigned short * updateStringListWide P((
					 StringList **          ppList_io,
					 const unsigned short * pszString_in));

/*
 *  Property definitions are stored as a dynamic array of property
 *  names.  Each property has a unique number associated with it (its array
 *  index + 1).
 */

/*************************************************************************
 * NAME
 *    freeAmpleProperties
 * DESCRIPTION
 *    Initialize the properties, by freeing up any space that may have
 *    been allocated, and resetting all pointers and counters.
 * RETURN VALUE
 *    none
 */
void freeAmpleProperties(pProperties_io, pPropertySets_io)
AmpleProperties *	pProperties_io;
StringList *		pPropertySets_io;
{
unsigned short	i;

for ( i = 0 ; i < pProperties_io->uiPropertyCount ; ++i )
	freeMemory( pProperties_io->paProperties[i].pszName );
freeMemory(pProperties_io->paProperties);
pProperties_io->paProperties      = NULL;
pProperties_io->uiPropertyCount   = 0;
pProperties_io->uiAllocProperties = 0;

freeStringList(pPropertySets_io);
}

/*************************************************************************
 * NAME
 *    findAmplePropertyNumber
 * ARGUMENTS
 *    name - pointer to property's name
 * DESCRIPTION
 *    Search for a specific property by name.
 * RETURN VALUE
 *    integer value of the property, or zero if not found
 */
unsigned short findAmplePropertyNumber(pszName_in, pProperties_in)
const char *		pszName_in;
const AmpleProperties *	pProperties_in;
{
unsigned short	i;
/*
 *  check for an empty name
 */
if ((pszName_in == (char *)NULL) || (*pszName_in == '\0'))
	return( 0 );
/*
 *  search down the list of property names
 */
for ( i = 0 ; i < pProperties_in->uiPropertyCount ; ++i )
	{
	if (strcmp(pszName_in, pProperties_in->paProperties[i].pszName) == 0)
		return i+1;
	}
return( 0 );
}

/*************************************************************************
 * NAME
 *    findAmplePropertyName
 * ARGUMENTS
 *    prop - property value
 * DESCRIPTION
 *    Find the name string associated with the number of the prop.
 * RETURN VALUE
 *    pointer to the property's name, or NULL if not found
 */
char * findAmplePropertyName(uiPropNumber_in, pProperties_in)
unsigned		uiPropNumber_in;
const AmpleProperties *	pProperties_in;
{
if (	(uiPropNumber_in != 0) &&
	(uiPropNumber_in <= pProperties_in->uiPropertyCount))
	return pProperties_in->paProperties[uiPropNumber_in - 1].pszName;
else
	return (char *)NULL;
}

/*****************************************************************
 * NAME
 *    addAmpleProperty
 * ARGUMENTS
 *    pszLine_in - user-supplied property name(s)
 *    eType_in  - type of property (allomorph or morpheme)
 * DESCRIPTION
 *    setup of allomorph or morpheme properties
 * RETURN VALUE
 *    the new property number, or 0 if an error occurs
 */
unsigned short addAmpleProperty(pszLine_in, eType_in, pProperties_io,
				pLogFP_in)
char *			pszLine_in;
int			eType_in;
AmpleProperties *	pProperties_io;
FILE *			pLogFP_in;
{
char *		rp;
char *		end;
int		x;
char *		errhead;
unsigned short	i;

errhead = (eType_in == AMPLE_ALLO_PROP) ?
		"ALLOMORPH PROPERTY: " : "MORPHEME PROPERTY: ";
/*
 *  skip leading whitespace, then process each word we've been given
 */
if (	(pszLine_in == NULL) ||
	(*(rp = pszLine_in + strspn(pszLine_in, szWhitespace_m)) == NUL) )
	{
	if (pLogFP_in != NULL)
	fprintf(pLogFP_in,"%sEmpty definition\n", errhead);
	return 0;
	}
for ( end = isolateWord(rp) ; *rp ; end = isolateWord(rp) )
	{
	/*
	 *  make sure we can handle another property
	 */
	if (pProperties_io->uiPropertyCount >= pProperties_io->uiMaxProperty)
		{
	if (pLogFP_in != NULL)
		fprintf(pLogFP_in, "%sToo many properties - cannot define %s\n",
			errhead, rp );
		return 0;
		}
	/*
	 *  make sure this name hasn't already been used
	 */
	if ((x = findAmplePropertyNumber(rp, pProperties_io)) != 0)
		{
	if (pLogFP_in != NULL)
		fprintf(pLogFP_in, "%s%s already defined as a property\n",
			errhead, rp);
		goto nextprop;
		}
	/*
	 *  add a new property to the dynamic array
	 */
	if (pProperties_io->uiPropertyCount >= pProperties_io->uiAllocProperties)
	{
	pProperties_io->uiAllocProperties =
					 pProperties_io->uiPropertyCount + 100;
	if (pProperties_io->uiAllocProperties > pProperties_io->uiMaxProperty)
		pProperties_io->uiAllocProperties = pProperties_io->uiMaxProperty;
	if (pProperties_io->paProperties == NULL)
		pProperties_io->paProperties = (AmpleProperty *)allocMemory(
			pProperties_io->uiAllocProperties * sizeof(AmpleProperty));
	else
		pProperties_io->paProperties = (AmpleProperty *)reallocMemory(
			pProperties_io->paProperties,
			pProperties_io->uiAllocProperties * sizeof(AmpleProperty));
	}
	i = pProperties_io->uiPropertyCount++;
	pProperties_io->paProperties[i].pszName       = duplicateString( rp );
#ifndef rbr3321
	pProperties_io->paProperties[i].ePropertyType =
						 (eType_in == AMPLE_MORPH_PROP);
#else /* rbr3321 */
	pProperties_io->paProperties[i].ePropertyType =
						 (eType_in == AMPLE_ALLO_PROP);
#endif /* rbr3321 */

nextprop:                       /* loop to try for another property name */
	rp = end;
	}
return pProperties_io->uiPropertyCount;
} /* end addAmpleProperties */

/*************************************************************************
 * NAME
 *    isAmpleAllomorphProperty
 * ARGUMENTS
 *    prop - property value
 * DESCRIPTION
 *    Show if property is allo or morpheme property.
 * RETURN VALUE
 *    True if allo property, false if morpheme prop.
 */
int isAmpleAllomorphProperty(uiProp_in, pProperties_in)
unsigned		uiProp_in;
const AmpleProperties *	pProperties_in;
{
if (	(uiProp_in != 0) &&
	(uiProp_in <= pProperties_in->uiPropertyCount))
	return (pProperties_in->paProperties[uiProp_in - 1].ePropertyType ==
								  AMPLE_ALLO_PROP);
else
	return 0;
}

/*************************************************************************
 * NAME
 *    isAmpleMorphemeProperty
 * ARGUMENTS
 *    prop - property value
 * DESCRIPTION
 *    Show if property is allo or morpheme property.
 * RETURN VALUE
 *    True if morpheme property, false if allomorph property
 */
int isAmpleMorphemeProperty(uiProp_in, pProperties_in)
unsigned		uiProp_in;
const AmpleProperties *	pProperties_in;
{
if (	(uiProp_in != 0) &&
	(uiProp_in <= pProperties_in->uiPropertyCount))
	return (pProperties_in->paProperties[uiProp_in - 1].ePropertyType ==
								 AMPLE_MORPH_PROP);
else
	return 0;
}

/*************************************************************************
 * NAME
 *    writeAmplePropertySet
 * ARGUMENTS
 *    propvals - char *properties value from dictionary
 * DESCRIPTION
 *    Show the names for all the properties in pPropertySet_in.
 * RETURN VALUE
 *    none
 */
void writeAmplePropertySet(pPropertySet_in, pProperties_in, pOutputFP_in)
const PropertySet_t	pPropertySet_in;
const AmpleProperties *	pProperties_in;
FILE *			pOutputFP_in;
{
unsigned short	i;

if (pOutputFP_in == NULL)
	return;
/*
 *  scan the list of properties, printing the name for each one in the set
 */
for ( i = 0 ; i < pProperties_in->uiPropertyCount ; ++i )
	{
	if ( hasAmpleProperty( pPropertySet_in, i+1, pProperties_in ) )
		fprintf(pOutputFP_in," %s",
		pProperties_in->paProperties[i].pszName);
	}
}

/*****************************************************************************
 * NAME
 *    widestrchr
 * DESCRIPTION
 *    like strchr() but with unsigned short values
 * RETURN VALUE
 *    pointer to place found, or NULL if not found
 */
static unsigned short * widestrchr(pWideString_in, uiVal_in)
const unsigned short * pWideString_in;
unsigned	 uiVal_in;
{
const unsigned short * p;

if (pWideString_in == NULL)
	return NULL;

for ( p = pWideString_in ; *p ; ++p )
	{
	if (*p == (unsigned short)uiVal_in)
	return (unsigned short *)p;
	}
return NULL;
}

static size_t widestrlen(pWideString_in)
const unsigned short * pWideString_in;
{
const unsigned short * p;
size_t		       k;

if (pWideString_in == NULL)
	return 0;
for ( k = 0, p = pWideString_in ; *p ; ++p )
	++k;
return k;
}

static unsigned short * widestrcpy(pWideOut_in, pWideIn_in)
unsigned short *       pWideOut_in;
const unsigned short * pWideIn_in;
{
unsigned short *       p;
const unsigned short * q;

if (pWideOut_in == NULL)
	return NULL;
if (pWideIn_in != NULL)
	{
	for ( p = pWideOut_in, q = pWideIn_in ; *q ; ++p, ++q )
	{
	*p = *q;
	}
	*p = NUL;
	}
return pWideOut_in;
}

static int widestrcmp(pWide1st_in, pWide2nd_in)
const unsigned short * pWide1st_in;
const unsigned short * pWide2nd_in;
{
const unsigned short * p;
const unsigned short * q;

if ((pWide1st_in == NULL) && (pWide2nd_in == NULL))
	return 0;
if (pWide1st_in == NULL)
	return -1;
if (pWide2nd_in == NULL)
	return 1;
for ( p = pWide1st_in, q = pWide2nd_in ; *p || *q ; ++p, ++q )
	{
	if (*p < *q)
	return -1;
	if (*p > *q)
	return 1;
	}
return 0;
}

/*************************************************************************
 * NAME
 *    hasAmpleProperty
 * ARGUMENTS
 *    pPropertySet_in - char *containing property values
 *    prop - property value
 * DESCRIPTION
 *    See if pPropertySet_in (properties of a dic entry) contains prop.
 * RETURN VALUE
 *    True if contains prop, false if not.
 */
int hasAmpleProperty(pPropertySet_in, uiProp_in, pProperties_in)
const PropertySet_t	pPropertySet_in;
unsigned		uiProp_in;
const AmpleProperties *	pProperties_in;
{
if ((pPropertySet_in.pProperties == NULL) || (pProperties_in == NULL))
	return FALSE;

if (pProperties_in->uiMaxProperty > 255)
	{
	if (widestrchr(pPropertySet_in.pBigProperties, uiProp_in))
	return TRUE;
	}
else
	{
	if (strchr((char *)pPropertySet_in.pProperties,
		(int)((char)uiProp_in)))
	return TRUE;
	}
return FALSE;
}

/*****************************************************************************
 * NAME
 *    parseAmplePropertySet
 * DESCRIPTION
 *    parseAmplePropertySet parses property list into property names
 *    and set the properties field of the dict entry.
 *    properties are represented by alphanumeric strings defined in
 *    AmpleProperty structures
 *    entire list must be on one line.
 * RETURN VALUE
 *    pointer to line to parse where it ceased to find a property
 */
char * parseAmplePropertySet(pszLine_in, ppPropertySet_io, eType_in,
				 uiDictEntry_in, pszRecordKey_in,
				 pszErrorHeader_in, pProperties_in,
				 ppPropertySetList_io, pLogFP_in)
char *			pszLine_in;		/* line to parse */
PropertySet_t *		ppPropertySet_io;	/* address of pointer to set */
int			eType_in;		/* type of property */
unsigned		uiDictEntry_in;		/* dictionary entry number */
const char *		pszRecordKey_in;	/* key of entry */
const char *		pszErrorHeader_in;
const AmpleProperties *	pProperties_in;
StringList **		ppPropertySetList_io;
FILE *			pLogFP_in;
{
unsigned char *		pabPropPresent;
PropertySet_t		pPropSet;
unsigned short *	pBigProp;
unsigned char *		pProp;
unsigned short		uiProp;
int			bPropAdded = FALSE;
char *			pszWord;
char *			pszNext;
int			i;
int			j;
unsigned		uiSize;

if (pszLine_in == NULL)
	return NULL;
if (ppPropertySet_io == NULL)
	return pszLine_in;

uiSize = pProperties_in->uiPropertyCount;
#ifdef HAVE_ALLOCA
if (pProperties_in->uiMaxProperty > 255)
	pPropSet.pBigProperties = (unsigned short *)alloca(
					  (uiSize+1) * sizeof(unsigned short));
else
	pPropSet.pProperties = (unsigned char *)alloca(
					   (uiSize+1) * sizeof(unsigned char));
pabPropPresent = (unsigned char *)alloca((uiSize+1) * sizeof(unsigned char));
#else
if (pProperties_in->uiMaxProperty > 255)
	pPropSet.pBigProperties = (unsigned short *)allocMemory(
					  (uiSize+1) * sizeof(unsigned short));
else
	pPropSet.pProperties = (unsigned char *)allocMemory(
					   (uiSize+1) * sizeof(unsigned char));
pabPropPresent = (unsigned char *)allocMemory(
					   (uiSize+1) * sizeof(unsigned char));
#endif
if (pProperties_in->uiMaxProperty > 255)
	memset(pPropSet.pBigProperties, 0, (uiSize+1) * sizeof(unsigned short));
else
	memset(pPropSet.pProperties,    0, (uiSize+1) * sizeof(unsigned char));
memset(pabPropPresent, 0, (uiSize+1) * sizeof(unsigned char));

if ((*ppPropertySet_io).pProperties != NULL)
	{
	if (pProperties_in->uiMaxProperty > 255)
	{
	for (   pBigProp = (*ppPropertySet_io).pBigProperties ;
		*pBigProp ;
		++pBigProp )
		pabPropPresent[*pBigProp] = TRUE;
	}
	else
	{
	for ( pProp = (*ppPropertySet_io).pProperties ; *pProp ; ++pProp )
		pabPropPresent[*pProp] = TRUE;
	}
	}
/*
 *  skip leading whitespace
 */
pszWord = pszLine_in + strspn(pszLine_in, szWhitespace_m);
/*
 *  look for name until find:
 *     the end of the line (\0)
 *     beginning of a surface environment (/)
 *     beginning of a morpheme environment (+/)
 */
while ( (*pszWord != NUL) &&
		(*pszWord != '/') &&
		((pszWord[0] != '+') || (pszWord[1] != '/')) &&
		((pszWord[0] != '.') || (pszWord[1] != '/')) ) /* 3.3.0 hab */
	{
	pszNext = isolateWord(pszWord);            /* get name */
	uiProp = findAmplePropertyNumber(pszWord, pProperties_in);
	if (uiProp != 0)
		{
	/*
	 *  If found in list, mark it present in the set
	 */
	if (pabPropPresent[uiProp] == FALSE)
		{
		pabPropPresent[uiProp] = TRUE;
		bPropAdded = TRUE;			/* Remember we added one */
		}
		}
	else                        /* not found; give error msg */
		{
	if (pLogFP_in != NULL)
		fprintf(pLogFP_in, "%sUndefined %s property %s in entry: %s\n",
			pszErrorHeader_in,
			(eType_in == AMPLE_ALLO_PROP) ? "allomorph" : "morpheme",
			pszWord,
			getAmpleRecordIDTag(pszRecordKey_in, uiDictEntry_in));
	}
	pszWord = pszNext;
	}
if (bPropAdded)
	{					/* If a prop was added */
	for ( j = 0, i = 1 ; i <= pProperties_in->uiPropertyCount ; ++i )
	{
	if (pabPropPresent[i])
		{
		if (pProperties_in->uiMaxProperty > 255)
		pPropSet.pBigProperties[j++] = i;
		else
		pPropSet.pProperties[j++] = i;
		}
	}
	if (pProperties_in->uiMaxProperty > 255)
	(*ppPropertySet_io).pBigProperties = updateStringListWide(
							  ppPropertySetList_io,
							  pPropSet.pBigProperties);
	else
	(*ppPropertySet_io).pProperties = (unsigned char *)updateStringList(
						 ppPropertySetList_io,
						 (char *)pPropSet.pProperties);
	}
#ifndef HAVE_ALLOCA
freeMemory( pPropSet.pProperties );
freeMemory( pabPropPresent );
#endif
return(pszWord);                     /* return pointer to line */
}

/*************************************************************************
 * NAME
 *    mergeAmplePropertySets
 * ARGUMENTS
 *    ppPropertySet_io   - address of pointer to property set storage
 *    p2ndPropertySet_in - property values to add
 * DESCRIPTION
 *    add the property numbers stored in p2ndPropertySet_in to ppPropertySet_io
 * RETURN VALUE
 *    None.
 */
void mergeAmplePropertySets(ppPropertySet_io, p2ndPropertySet_in,
				uiDictEntry_in,   pszRecordKey_in,
				pProperties_in,   ppPropertySetList_io)
PropertySet_t *		ppPropertySet_io;
const PropertySet_t	p2ndPropertySet_in;
int			uiDictEntry_in;
const char *		pszRecordKey_in;
const AmpleProperties *	pProperties_in;
StringList **		ppPropertySetList_io;
{
unsigned char *		pabPropPresent;
PropertySet_t		pPropSet;
const unsigned short *	pBigProp;
const unsigned char *	pProp;
int			i;
int			j;
unsigned short		uiSize;

if ((ppPropertySet_io == NULL) || (p2ndPropertySet_in.pProperties  == NULL))
	return;
if (pProperties_in->uiMaxProperty > 255)
	{
	if (*p2ndPropertySet_in.pBigProperties == 0)
	return;
	}
else
	{
	if (*p2ndPropertySet_in.pProperties == 0)
	return;
	}
uiSize = pProperties_in->uiPropertyCount;
#ifdef HAVE_ALLOCA
if (pProperties_in->uiMaxProperty > 255)
	pPropSet.pBigProperties = (unsigned short *)alloca(
					  (uiSize+1) * sizeof(unsigned short));
else
	pPropSet.pProperties = (unsigned char *)alloca(
					   (uiSize+1) * sizeof(unsigned char));
pabPropPresent = (unsigned char *)alloca((uiSize+1) * sizeof(unsigned char));
#else
if (pProperties_in->uiMaxProperty > 255)
	pPropSet.pBigProperties = (unsigned short *)allocMemory(
					  (uiSize+1) * sizeof(unsigned short));
else
	pPropSet.pProperties = (unsigned char *)allocMemory(
					   (uiSize+1) * sizeof(unsigned char));
pabPropPresent = (unsigned char *)allocMemory(
					   (uiSize+1) * sizeof(unsigned char));
#endif
if (pProperties_in->uiMaxProperty > 255)
	memset(pPropSet.pBigProperties, 0, (uiSize+1) * sizeof(unsigned short));
else
	memset(pPropSet.pProperties,    0, (uiSize+1) * sizeof(unsigned char));
memset(pabPropPresent, 0, (uiSize+1) * sizeof(unsigned char));
/*
 *  1. if there were props to add to, copy them to temp
 *  2. add any new props
 *  3. build a composite set as a 0 terminated array (string)
 *  4. Add new set to *ppPropertySet_io, & point to it
 */
if (pProperties_in->uiMaxProperty > 255)
	{
	for (   pBigProp = (*ppPropertySet_io).pBigProperties ;
		pBigProp && *pBigProp ;
		++pBigProp )
	pabPropPresent[*pBigProp] = TRUE;
	for (   pBigProp = p2ndPropertySet_in.pBigProperties ;
		pBigProp && *pBigProp ;
		++pBigProp )
	pabPropPresent[*pBigProp] = TRUE;
	for ( j = 0, i = 1 ; i <= pProperties_in->uiPropertyCount ; ++i )
	{
	if (pabPropPresent[i])
		pPropSet.pBigProperties[j++] = i;
	}
	(*ppPropertySet_io).pBigProperties = updateStringListWide(
							  ppPropertySetList_io,
							  pPropSet.pBigProperties);
	}
else
	{
	for ( pProp = (*ppPropertySet_io).pProperties ; pProp && *pProp ; ++pProp )
	pabPropPresent[*pProp] = TRUE;
	for ( pProp = p2ndPropertySet_in.pProperties ; pProp && *pProp ; ++pProp )
	pabPropPresent[*pProp] = TRUE;
	for ( j = 0, i = 1 ; i <= pProperties_in->uiPropertyCount ; ++i )
	{
	if (pabPropPresent[i])
		pPropSet.pProperties[j++] = i;
	}
	(*ppPropertySet_io).pProperties = (unsigned char *)updateStringList(
						 ppPropertySetList_io,
						 (char *)pPropSet.pProperties);
	}
#ifndef HAVE_ALLOCA
freeMemory(pPropSet.pProperties);
freeMemory(pabPropPresent);
#endif
}

#ifndef MORE_PROPERTIES
#define MAX_PROPERTIES 255
#define UPDATE_PROPERTYSET_LIST(list,set) \
((unsigned char *)updateStringList(list, (char *)set))

#else

#ifdef __DJGPP__
#include <wchar.h>
#endif
#include "strlist.h"
#include "allocmem.h"

#define MAX_PROPERTIES 4000
#define UPDATE_PROPERTYSET_LIST(list,set) (updateStringListWide(list,set))
#endif

/*****************************************************************************
 * NAME
 *    duplicateWideString
 * DESCRIPTION
 *    Create a duplicate of an existing zero-terminated wide character string.
 * RETURN VALUE
 *    pointer to the newly allocated and copied duplicate
 */
static unsigned short * duplicateWideString(pszString_in)
const unsigned short *	pszString_in;	/* wide character string to copy */
{
unsigned short *	p;
size_t	k;

if (pszString_in == (unsigned short *)NULL)
	return NULL;
k = widestrlen(pszString_in) + 1;
p = (unsigned short *)allocMemory( sizeof(unsigned short) * k );
widestrcpy(p, pszString_in);
return( p );
}

/*****************************************************************************
 * NAME
 *    updateStringListWide
 * DESCRIPTION
 *    If the string is not already in the list, add it; this function is
 *    equivalent to mergeIntoStringList, except that it returns a different
 *    parameter
 * RETURN VALUE
 *    pointer to str in string list
 */
static unsigned short * updateStringListWide(ppList_io, pszString_in)
StringList **	ppList_io;	/* address of pointer to string list
				   to be updated */
const unsigned short *	pszString_in;	/* pointer to wide string to be added to
				   string list */
{
StringList *	pList;
/*
 *  search the string list for a duplicate
 */
for ( pList = *ppList_io ; pList ; pList = pList->pNext )
	{
	/*
	 *  if a duplicate is found, return it
	 */
	if (widestrcmp( (unsigned short *)pList->pszString, pszString_in ) == 0)
		return( (unsigned short *)pList->pszString );
	}
/*
 *  if no duplicate found, add this string to the list
 */
pList = allocMemory( sizeof(struct strlist) );
pList->pszString = (char *)duplicateWideString( pszString_in );
pList->pNext = *ppList_io;
*ppList_io = pList;

return( (unsigned short *)pList->pszString );
}

/*****************************************************************************
 * NAME
 *    stringifyAmplePropertySet
 * DESCRIPTION
 *    add the expansion of the given set of Ample properties to the end of the
 *    dynamically allocated string
 * RETURN VALUE
 *    pointer to the (possibly reallocated) dynamic string
 */
char * stringifyAmplePropertySet(pszString_io, puiStringSize_io,
				 pPropertySet_in, pProperties_in)
char *                  pszString_io;
size_t *                puiStringSize_io;
const PropertySet_t     pPropertySet_in;
const AmpleProperties * pProperties_in;
{
unsigned short	i;


if ((pszString_io == NULL) || (puiStringSize_io == NULL))
	return pszString_io;
/*
 *  scan the list of properties, printing the name for each one in the set
 */
for ( i = 0 ; i < pProperties_in->uiPropertyCount ; ++i )
	{
	if ( hasAmpleProperty( pPropertySet_in, i+1, pProperties_in ) )
	{
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   " ");
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					  pProperties_in->paProperties[i].pszName);
	}
	}
return pszString_io;
}
