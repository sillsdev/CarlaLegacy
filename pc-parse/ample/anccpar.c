#ifdef EXPERIMENTAL
#ifndef hab350
/* ANCCPAR.C - parse allomorph never co-occurrence constraint expressions for XAMPLE
 *****************************************************************************
 *
 * AmpleNeverConstraint * parseAmpleNeverConstraint(char * pszLine_in,
 *						    AmpleData * pAmple_in);
 * void writeAmpleNeverConstraint(AmpleNeverConstraint * pNeverConstraint_in,
 *				  FILE *                 pOutputFP_in,
 *				  int                    bSGML_in);
 * void writeAmpleNeverConstraints(FILE *      pOutputFP_in,
 *				   AmpleData * pAmple_in);
 *
 *****************************************************************************
 * Copyright 2002 by SIL International
 * All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"

/********************* LOCAL VARIABLES *********************/

static const char	szWhitespace_m[7] = " \t\n\r\f\v";

/*************************************************************************
 * NAME
 *    parseAmpleNeverConstraint
 * ARGUMENTS
 *    line - pointer to NUL-terminated string containing a list of
 *              allomorph IDs followed by environment constraints
 * DESCRIPTION
 *    Parse an allomorph never co-occurrence constraint, which consists of a
 *     list of allomorph IDs followed by allomorph ID environment constraints.
 * RETURN VALUE
 *    pointer to AmpleNeverConstraint structure containing the constraints,
 *    or NULL if an error occurs
 */
AmpleNeverConstraint * parseAmpleNeverConstraint(line, pAmple_in)
char *		line;
AmpleData *	pAmple_in;
{
AmpleNeverConstraint *pNeverConstraint = NULL;
char *			 p;
char *			 pszName;
char *			 pszToken;
char *			 pszNextToken;
char *			 pszLabel   = NULL;
StringList *	         pAlloList = NULL;
StringList *	         pLastAllo = NULL;
StringList *	         pAllo;
int			 cSave = NUL;
char *			 pszEnvErrHead = "NEVER ENVIRONMENT: ";
/*
 *  first, check for an empty environment
 */
line += strspn(line, szWhitespace_m);
if ((line == (char *)NULL) || (*line == NUL))
	{
	if (pAmple_in->pLogFP != NULL)
	fprintf(pAmple_in->pLogFP,
		"%sEmpty allomorph never co-occurrence constraint.\n", pszEnvErrHead);
	return( (AmpleNeverConstraint *)NULL);         /* no environment */
	}
pszToken     = line;
pszNextToken = NULL;
if (*pszToken == '{')
	{
	/*
	 *  get the allomorph never co-occurrence constraint label
	 */
	pszName = pszToken + 1;
	pszName += strspn(pszName, szWhitespace_m);
	if (*pszName == '}')
	{
	if (szRecordKey_g[0])
		reportError(ERROR_MSG,
	"%sMissing allomorph never co-occurrence constraint label (in entry %s)\n",
			pszEnvErrHead, szRecordKey_g);
	else
		reportError(ERROR_MSG,
			"%sMissing allomorph never co-occurrence constraint label\n",
			pszEnvErrHead);
	goto cleanup;
	}
	pszToken = strchr(pszName, '}');
	if (pszToken == NULL)
	{
	if (szRecordKey_g[0])
		reportError(ERROR_MSG,
			"%sMissing } to terminate ANCC label (in entry %s)\n",
			pszEnvErrHead, szRecordKey_g);
	else
		reportError(ERROR_MSG,
			"%sMissing } to terminate ANCC label\n", pszEnvErrHead);
	goto cleanup;
	}
	*pszToken++ = NUL;
	pszToken += strspn(pszToken, szWhitespace_m);
	p = strpbrk(pszName, szWhitespace_m);
	if (p != NULL)
	*p = NUL;
	pszLabel = duplicateString(pszName);
	}
while ((*pszToken != '/') && (strncmp(pszToken, "~/", 2) != 0))
	{
	p = strpbrk(pszToken, " \t\r\n\f\v~/");
	while ((p != NULL) && (*p == '~') && (*(p+1) != '/'))
		p = strpbrk(p+1, " \t\r\n\f\v~/");
	if (p != NULL)
		{
	cSave = *p;
	*p = NUL;
	}
	/*
	 *  allocate a new node to hold an allomorph ID
	 */
	pAllo = (StringList *)allocMemory(sizeof(StringList));
	pAllo->pszString = duplicateString(pszToken);
	if (p != NULL)
		{
		*p = cSave;
		p += strspn(p, szWhitespace_m);
		pszToken = p;
		}
	else
		pszToken += strlen(pszToken);
	/*
	 *  finish filling out the node and link it in at the end
	 */
	pAllo->pNext = (StringList *)NULL;
	if (pAlloList == (StringList *)NULL)
	pAlloList = pAllo;		/* first node */
	else
	pLastAllo->pNext = pAllo;	/* later nodes */
	pLastAllo = pAllo;		/* save where to store */

	if (*pszToken == NUL)
	break;
	}
if (pAlloList == NULL)
	{
	if (szRecordKey_g[0])
	reportError(ERROR_MSG, "%sEmpty list of allomorphs (in entry %s)\n",
			pszEnvErrHead, szRecordKey_g);
	else
	reportError(ERROR_MSG, "%sEmpty list of allomorphs\n", pszEnvErrHead);
	return( (AmpleNeverConstraint *)NULL);
	}
pNeverConstraint = (AmpleNeverConstraint *)allocMemory(
					sizeof(AmpleNeverConstraint));
pNeverConstraint->pszLabel     = pszLabel;
pNeverConstraint->pAlloIDs     = pAlloList;
pNeverConstraint->pEnvironment = parseAmpleNeverEnvConstraint(
					   pszToken,
					   "allomorph never co-occurrence constraint",
					   NULL,
					   NULL,
					   NULL,
					   NULL,
					   pAmple_in->pLogFP,
					   &pAmple_in->pEnvStrings);
/*
 *  if no environment constraint, then free the
 *  space and return NULL
 */
if (pNeverConstraint->pEnvironment == (AmpleEnvConstraint *)NULL)
	{
cleanup:
	freeStringList(pAlloList);
	if (pszLabel != NULL)
	{
	freeMemory(pszLabel);
	pszLabel = NULL;
	}
	if (pNeverConstraint != NULL)
	{
	freeMemory( pNeverConstraint );
	pNeverConstraint = NULL;
	}
	}
return( pNeverConstraint );
}

/*****************************************************************************
 * NAME
 *    writeAmpleNeverConstraint
 * DESCRIPTION
 *    write an allomorph never co-occurrence constraint to a file
 * RETURN VALUE
 *    none
 */
void writeAmpleNeverConstraint(pNeverConstraint_in, pOutputFP_in, bSGML_in)
AmpleNeverConstraint *   pNeverConstraint_in;
FILE *			 pOutputFP_in;
int			 bSGML_in;
{
StringList *pAllo;

if (pNeverConstraint_in->pszLabel != NULL)
	{
	if (bSGML_in)
	{
	writeAmpleCDATA(pOutputFP_in, "{", FALSE);
	writeAmpleCDATA(pOutputFP_in, pNeverConstraint_in->pszLabel, FALSE);
	writeAmpleCDATA(pOutputFP_in, "} ", FALSE);
	}
	else
	{
	fprintf(pOutputFP_in, "{%s} ", pNeverConstraint_in->pszLabel);
	}
	}
for ( pAllo = pNeverConstraint_in->pAlloIDs ; pAllo ; pAllo = pAllo->pNext )
	{
	if (bSGML_in)
	{
	writeAmpleCDATA(pOutputFP_in, pAllo->pszString, FALSE);
	}
	else
	{
	fprintf(pOutputFP_in, "%s", pAllo->pszString );
	}
	fprintf(pOutputFP_in, " ");
	}
/* morpheme environment constraint */
writeAmpleEnvConstraint(pOutputFP_in, pNeverConstraint_in->pEnvironment,
			bSGML_in);
}

/***************************************************************************
 * NAME
 *    writeAmpleNeverConstraints
 * DESCRIPTION
 *    Display the contents of a list of AmpleNeverConstraint's.
 * RETURN VALUE
 *    none
 */
void writeAmpleNeverConstraints(pOutputFP_in, pAmple_in)
FILE *		pOutputFP_in;
AmpleData *	pAmple_in;
{
AmpleNeverConstraint *	pConstraint;

if (pOutputFP_in == NULL)
	return;

fprintf(pOutputFP_in, "Never Environment Constraints:\n");
for (	pConstraint = pAmple_in->pNeverConstraints ;
	pConstraint ;
	pConstraint = pConstraint->pNext )
	{
	fprintf(pOutputFP_in,"   ");
	writeAmpleNeverConstraint(pConstraint, pOutputFP_in, FALSE);
	fprintf(pOutputFP_in, "\n");
	}
}

/*****************************************************************************
 * NAME
 *    stringifyAmpleNeverConstraint
 * DESCRIPTION
 *    add the expansion of the given allomorph never co-occurrence constraint
 *    to the end of the dynamically allocated string
 * RETURN VALUE
 *    pointer to the (possibly reallocated) dynamic string
 */
char * stringifyAmpleNeverConstraint(pszString_io, puiStringSize_io,
					 pNeverConstraint_in, bSGML_in)
char *                   pszString_io;
size_t *                 puiStringSize_io;
AmpleNeverConstraint *   pNeverConstraint_in;
int                      bSGML_in;
{
StringList *             pAlloID;
char			 szBuffer[16];

if (	(pszString_io        == NULL) ||
	(puiStringSize_io    == NULL) ||
	(pNeverConstraint_in == NULL))
	return pszString_io;

if (pNeverConstraint_in->pszLabel != NULL)
	{
	if (bSGML_in)
	{
	char *	pszTemp;
	size_t	uiLength;

	storeAmpleCDATA(szBuffer, "{", FALSE);
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   szBuffer);
	uiLength = lengthAmpleCDATA(pNeverConstraint_in->pszLabel, FALSE);
#ifdef HAVE_ALLOCA
	pszTemp = (char *)alloca(uiLength + 1);
#else
	pszTemp = (char *)allocMemory(uiLength + 1);
#endif
	storeAmpleCDATA(pszTemp, pNeverConstraint_in->pszLabel, FALSE);
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
					   pNeverConstraint_in->pszLabel);
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   "} ");
	}
	}
for ( pAlloID = pNeverConstraint_in->pAlloIDs;
	  pAlloID;
	  pAlloID = pAlloID->pNext )
	{
	if (bSGML_in)
	{
	char *	pszTemp;
	size_t	uiLength;
	uiLength = lengthAmpleCDATA(pAlloID->pszString, FALSE);
#ifdef HAVE_ALLOCA
	pszTemp = (char *)alloca(uiLength + 1);
#else
	pszTemp = (char *)allocMemory(uiLength + 1);
#endif
	storeAmpleCDATA(pszTemp, pAlloID->pszString, FALSE);
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   pszTemp);
#ifndef HAVE_ALLOCA
	freeMemory(pszTemp);
#endif
	}
	else
		pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   pAlloID->pszString);
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   " ");
	}
/* morpheme environment constraint */
return stringifyAmpleEnvConstraint(pszString_io, puiStringSize_io,
				   pNeverConstraint_in->pEnvironment,
				   bSGML_in);
}
#endif /* hab350 */
#endif /* EXPERIMENTAL */
