/* MCCPAR.C - parse morpheme co-occurrence constraint expressions for AMPLE
 *****************************************************************************
 *
 * AmpleMorphConstraint * parseAmpleMorphConstraint(char *      pszLine_in,
 *						    AmpleData * pAmple_in);
 * void writeAmpleMorphConstraint(AmpleMorphConstraint * pMorphConstraint_in,
 *				  FILE *                 pOutputFP_in,
 *				  int                    bSGML_in);
 * void writeAmpleMorphConstraints(FILE *      pOutputFP_in,
 *				   AmpleData * pAmple_in);
 *
 *****************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"

/********************* LOCAL VARIABLES *********************/

static const char	szWhitespace_m[7] = " \t\n\r\f\v";

/*************************************************************************
 * NAME
 *    parseAmpleMorphConstraint
 * ARGUMENTS
 *    line - pointer to NUL-terminated string containing a list of
 *              morphemes followed by environment constraints
 * DESCRIPTION
 *    Parse a morpheme co-occurrence constraint, which consists of a list of
 *    morphemes followed by morpheme environment constraints.
 * RETURN VALUE
 *    pointer to AmpleMorphConstraint structure containing the constraints,
 *    or NULL if an error occurs
 */
AmpleMorphConstraint * parseAmpleMorphConstraint(line, pAmple_in)
char *		line;
AmpleData *	pAmple_in;
{
AmpleMorphConstraint *	pMorphConstraint = NULL;
char *			p;
char *			pszName;
char *			pszToken;
char *			pszNextToken;
char *			pszLabel   = NULL;
AmpleMorphlist *	pMorphList = NULL;
AmpleMorphlist *	pLastMorph = NULL;
AmpleMorphlist *	pMorph;
AmpleMorphClass *	pClass;
int			cSave = NUL;
char *			pszEnvErrHead = "MORPHEME CO-OCCURRENCE: ";
/*
 *  first, check for an empty environment
 */
line += strspn(line, szWhitespace_m);
if ((line == (char *)NULL) || (*line == NUL))
	{
	if (pAmple_in->pLogFP != NULL)
	{
#ifndef hab375
	if (szRecordKey_g[0])
		fprintf(pAmple_in->pLogFP,
		  "%sEmpty morpheme co-occurrence constraint (in entry %s).\n",
		  pszEnvErrHead, szRecordKey_g);
	else
		fprintf(pAmple_in->pLogFP,
			"%sEmpty morpheme co-occurrence constraint.\n", pszEnvErrHead);
#else
	fprintf(pAmple_in->pLogFP,
		"%sEmpty morpheme co-occurrence constraint.\n", pszEnvErrHead);
#endif /* hab375 */
	}
	return( (AmpleMorphConstraint *)NULL);         /* no environment */
	}
pszToken     = line;
pszNextToken = NULL;
if (*pszToken == '{')
	{
	/*
	 *  get the morpheme co-occurrence constraint label
	 */
	pszName = pszToken + 1;
	pszName += strspn(pszName, szWhitespace_m);
	if (*pszName == '}')
	{
	if (szRecordKey_g[0])
		reportError(ERROR_MSG,
	"%sMissing morpheme co-occurrence constraint label (in entry %s)\n",
			pszEnvErrHead, szRecordKey_g);
	else
		reportError(ERROR_MSG,
			"%sMissing morpheme co-occurrence constraint label\n",
			pszEnvErrHead);
	goto cleanup;
	}
	pszToken = strchr(pszName, '}');
	if (pszToken == NULL)
	{
	if (szRecordKey_g[0])
		reportError(ERROR_MSG,
			"%sMissing } to terminate MCC label (in entry %s)\n",
			pszEnvErrHead, szRecordKey_g);
	else
		reportError(ERROR_MSG,
			"%sMissing } to terminate MCC label\n", pszEnvErrHead);
	goto cleanup;
	}
	*pszToken++ = NUL;
	pszToken += strspn(pszToken, szWhitespace_m);
	p = strpbrk(pszName, szWhitespace_m);
	if (p != NULL)
	*p = NUL;
	pszLabel = duplicateString(pszName);
	}
while ((*pszToken != '/') && (strncmp(pszToken, "+/", 2) != 0))
	{
	if (*pszToken == '[')
	{
	/*
	 *  get the morpheme class name
	 */
	pszName = pszToken + 1;
	pszName += strspn(pszName, szWhitespace_m);
	if (*pszName == ']')
		{
		if (szRecordKey_g[0])
		reportError(ERROR_MSG, "%sMissing class name (in entry %s)\n",
				pszEnvErrHead, szRecordKey_g);
		else
		reportError(ERROR_MSG, "%sMissing class name\n",
				pszEnvErrHead);
		goto cleanup;
		}
	pszToken = strchr(pszName, ']');
	if (pszToken == NULL)
		{
		if (szRecordKey_g[0])
		reportError(ERROR_MSG, "%sMissing ] (in entry %s)\n",
				pszEnvErrHead, szRecordKey_g);
		else
		reportError(ERROR_MSG, "%sMissing ]\n", pszEnvErrHead);
		goto cleanup;
		}
	*pszToken++ = NUL;
	pszToken += strspn(pszToken, szWhitespace_m);
	p = strpbrk(pszName, szWhitespace_m);
	if (p != NULL)
		*p = NUL;
	pClass = findAmpleMorphClass(pszName, pAmple_in->pMorphClasses);
	if (pClass == (AmpleMorphClass *)NULL)
		{
		if (szRecordKey_g[0])
		reportError(ERROR_MSG,
				"%sUndefined morpheme class %s (in entry %s)\n",
				pszEnvErrHead, pszName, szRecordKey_g);
		else
		reportError(ERROR_MSG, "%sUndefined morpheme class %s\n",
				pszEnvErrHead, pszName);
		goto cleanup;
		}
	/*
	 *  allocate a new node to hold a morpheme class
	 */
	pMorph = (AmpleMorphlist *)allocMemory(sizeof(AmpleMorphlist));
	pMorph->bClass = TRUE;
	pMorph->u.pMorphClass = pClass;
	}
	else
	{
	p = strpbrk(pszToken, " \t\r\n\f\v[]+/");
	while ((p != NULL) && (*p == '+') && (*(p+1) != '/'))
		p = strpbrk(p+1, " \t\r\n\f\v[]+/");
	if (p != NULL)
		{
		cSave = *p;
		*p = NUL;
		}
	/*
	 *  allocate a new node to hold a morphname
	 */
	pMorph = (AmpleMorphlist *)allocMemory(sizeof(AmpleMorphlist));
	pMorph->bClass = FALSE;
	pMorph->u.pszMorphName = duplicateString(pszToken);
	if (p != NULL)
		{
		*p = cSave;
		p += strspn(p, szWhitespace_m);
		pszToken = p;
		}
	else
		pszToken += strlen(pszToken);
	}
	/*
	 *  finish filling out the node and link it in at the end
	 */
	pMorph->pNext = (AmpleMorphlist *)NULL;
	if (pMorphList == (AmpleMorphlist *)NULL)
	pMorphList = pMorph;		/* first node */
	else
	pLastMorph->pNext = pMorph;	/* later nodes */
	pLastMorph = pMorph;		/* save where to store */

	if (*pszToken == NUL)
	break;
	}
if (pMorphList == NULL)
	{
	if (szRecordKey_g[0])
	reportError(ERROR_MSG, "%sEmpty list of morphnames (in entry %s)\n",
			pszEnvErrHead, szRecordKey_g);
	else
	reportError(ERROR_MSG, "%sEmpty list of morphnames\n", pszEnvErrHead);
	return( (AmpleMorphConstraint *)NULL);
	}
pMorphConstraint = (AmpleMorphConstraint *)allocMemory(
						sizeof(AmpleMorphConstraint));
pMorphConstraint->pszLabel     = pszLabel;
pMorphConstraint->pMorphs      = pMorphList;
pMorphConstraint->pEnvironment = parseAmpleMorphEnvConstraint(
					   pszToken,
					   "morpheme co-occurrence constraint",
					   pAmple_in->pCategories,
					   &pAmple_in->sProperties,
					   pAmple_in->pCategoryClasses,
					   pAmple_in->pMorphClasses,
					   pAmple_in->pLogFP,
#ifndef hab3318
					   &pAmple_in->pEnvStrings);
#else
					   NULL);
#endif /* hab3318 */
/*
 *  if no morpheme environment constraint, then free the
 *  space and return NULL
 */
if (pMorphConstraint->pEnvironment == (AmpleEnvConstraint *)NULL)
	{
cleanup:
	while ((pMorph = pMorphList) != NULL)
	{
	pMorphList = pMorph->pNext;
	if (!pMorph->bClass)
		freeMemory( pMorph->u.pszMorphName );
	freeMemory( pMorph );
	}
	if (pszLabel != NULL)
	{
	freeMemory(pszLabel);
	pszLabel = NULL;
	}
	if (pMorphConstraint != NULL)
	{
	freeMemory( pMorphConstraint );
	pMorphConstraint = NULL;
	}
	}
return( pMorphConstraint );
}

/*****************************************************************************
 * NAME
 *    writeAmpleMorphConstraint
 * DESCRIPTION
 *    write a morpheme co-occurrence constraint to a file
 * RETURN VALUE
 *    none
 */
void writeAmpleMorphConstraint(pMorphConstraint_in, pOutputFP_in, bSGML_in)
AmpleMorphConstraint *	pMorphConstraint_in;
FILE *			pOutputFP_in;
int			bSGML_in;
{
AmpleMorphlist *	pMorph;

if (pMorphConstraint_in->pszLabel != NULL)
	{
	if (bSGML_in)
	{
	writeAmpleCDATA(pOutputFP_in, "{", FALSE);
	writeAmpleCDATA(pOutputFP_in, pMorphConstraint_in->pszLabel, FALSE);
	writeAmpleCDATA(pOutputFP_in, "} ", FALSE);
	}
	else
	{
	fprintf(pOutputFP_in, "{%s} ", pMorphConstraint_in->pszLabel);
	}
	}
for ( pMorph = pMorphConstraint_in->pMorphs ; pMorph ; pMorph = pMorph->pNext )
	{
	if (bSGML_in)
	{
	if (pMorph->bClass)
		{
		writeAmpleCDATA(pOutputFP_in, "[", FALSE);
		writeAmpleCDATA(pOutputFP_in, pMorph->u.pMorphClass->pszName,
				FALSE);
		writeAmpleCDATA(pOutputFP_in, "]", FALSE);
		}
	else
		writeAmpleCDATA(pOutputFP_in, pMorph->u.pszMorphName, FALSE);
	}
	else
	{
	if (pMorph->bClass)
		fprintf(pOutputFP_in, "[%s]", pMorph->u.pMorphClass->pszName );
	else
		fprintf(pOutputFP_in, "%s", pMorph->u.pszMorphName );
	}
	fprintf(pOutputFP_in, " ");
	}
/* morpheme environment constraint */
writeAmpleEnvConstraint(pOutputFP_in, pMorphConstraint_in->pEnvironment,
			bSGML_in);
}

/***************************************************************************
 * NAME
 *    writeAmpleMorphConstraints
 * DESCRIPTION
 *    Display the contents of a list of AmpleMorphConstraint's.
 * RETURN VALUE
 *    none
 */
void writeAmpleMorphConstraints(pOutputFP_in, pAmple_in)
FILE *		pOutputFP_in;
AmpleData *	pAmple_in;
{
AmpleMorphConstraint *	pConstraint;
AmpleMorpheme *		pMorph;

if (pOutputFP_in == NULL)
	return;

fprintf(pOutputFP_in, "Morpheme Co-occurrence Constraints:\n");
for (	pConstraint = pAmple_in->pMorphConstraints ;
	pConstraint ;
	pConstraint = pConstraint->pNext )
	{
	fprintf(pOutputFP_in,"   ");
	writeAmpleMorphConstraint(pConstraint, pOutputFP_in, FALSE);
	fprintf(pOutputFP_in, "\n");
	}
for (	pMorph = pAmple_in->pAmpleMorphemes ;
	pMorph ;
	pMorph = pMorph->pLink )
	{
	for (   pConstraint = pMorph->pMorphConstraints ;
		pConstraint ;
		pConstraint = pConstraint->pNext )
	{
	fprintf(pOutputFP_in,"   (dict) ");
	writeAmpleMorphConstraint(pConstraint, pOutputFP_in, FALSE);
	fprintf(pOutputFP_in, "\n");
	}
	}
}

/*****************************************************************************
 * NAME
 *    stringifyAmpleMorphConstraint
 * DESCRIPTION
 *    add the expansion of the given morpheme co-occurance constraint to the
 *    end of the dynamically allocated string
 * RETURN VALUE
 *    pointer to the (possibly reallocated) dynamic string
 */
char * stringifyAmpleMorphConstraint(pszString_io, puiStringSize_io,
					 pMorphConstraint_in, bSGML_in)
char *                 pszString_io;
size_t *               puiStringSize_io;
AmpleMorphConstraint * pMorphConstraint_in;
int                    bSGML_in;
{
AmpleMorphlist *	pMorph;
char			szBuffer[16];

if (	(pszString_io        == NULL) ||
	(puiStringSize_io    == NULL) ||
	(pMorphConstraint_in == NULL))
	return pszString_io;

if (pMorphConstraint_in->pszLabel != NULL)
	{
	if (bSGML_in)
	{
	char *	pszTemp;
	size_t	uiLength;

	storeAmpleCDATA(szBuffer, "{", FALSE);
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   szBuffer);
	uiLength = lengthAmpleCDATA(pMorphConstraint_in->pszLabel, FALSE);
#ifdef HAVE_ALLOCA
	pszTemp = (char *)alloca(uiLength + 1);
#else
	pszTemp = (char *)allocMemory(uiLength + 1);
#endif
	storeAmpleCDATA(pszTemp, pMorphConstraint_in->pszLabel, FALSE);
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   pszTemp);
#ifndef HAVE_ALLOCA
	freeMemory(pszTemp);
#endif
	storeAmpleCDATA(szBuffer, "} ", FALSE);
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   szBuffer);
	}
	else
	{
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   "{");
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   pMorphConstraint_in->pszLabel);
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   "} ");
	}
	}
for ( pMorph = pMorphConstraint_in->pMorphs ; pMorph ; pMorph = pMorph->pNext )
	{
	if (bSGML_in)
	{
	char *	pszTemp;
	size_t	uiLength;
	if (pMorph->bClass)
		{
		storeAmpleCDATA(szBuffer, "[", FALSE);
		pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
						   szBuffer);
		uiLength = lengthAmpleCDATA(pMorph->u.pMorphClass->pszName, FALSE);
#ifdef HAVE_ALLOCA
		pszTemp = (char *)alloca(uiLength + 1);
#else
		pszTemp = (char *)allocMemory(uiLength + 1);
#endif
		storeAmpleCDATA(pszTemp, pMorph->u.pMorphClass->pszName, FALSE);
		pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
						   pszTemp);
#ifndef HAVE_ALLOCA
		freeMemory(pszTemp);
#endif
		storeAmpleCDATA(szBuffer, "]", FALSE);
		pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
						   szBuffer);
		}
	else
		{
		uiLength = lengthAmpleCDATA(pMorph->u.pszMorphName, FALSE);
#ifdef HAVE_ALLOCA
		pszTemp = (char *)alloca(uiLength + 1);
#else
		pszTemp = (char *)allocMemory(uiLength + 1);
#endif
		storeAmpleCDATA(pszTemp, pMorph->u.pszMorphName, FALSE);
		pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
						   pszTemp);
#ifndef HAVE_ALLOCA
		freeMemory(pszTemp);
#endif
		}
	}
	else
	{
	if (pMorph->bClass)
		{
		pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
						   "[");
		pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
						   pMorph->u.pMorphClass->pszName);
		pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
						   "]");
		}
	else
		pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
						   pMorph->u.pszMorphName);
	}
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   " ");
	}
/* morpheme environment constraint */
return stringifyAmpleEnvConstraint(pszString_io, puiStringSize_io,
				   pMorphConstraint_in->pEnvironment,
				   bSGML_in);
}
