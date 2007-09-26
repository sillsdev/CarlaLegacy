/* SELECT.C - load information for AMPLE selective analysis / tracing
 ***************************************************************************
 *
 * void loadAmpleSelectiveAnalFile(const char * pszFilename_in,
 *				   AmpleData *  pAmple_io)
 *
 * void addAmpleSelectiveAnalItem(const char * pszMorphs_in,
 *				  AmpleData *  pAmple_io)
 *
 * void freeAmpleSelectiveAnalInfo(AmpleData *  pAmple_io)
 *
 ***************************************************************************
 *
 * int isAmpleAllomorphSelected(const char * pszMorphName_in,
 *				const char * pszAllomorph_in,
 *				AmpleData *  pAmple_in)
 *
 * void writeAmpleSelectedMorphs(const AmpleData * pAmple_in)
 *
 ***************************************************************************
 * Copyright 1997, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"
/*
 *  set of isspace() characters
 */
static const char	szWhitespace_m[7] = " \t\r\n\f\v";

static void	setAmpleSelectiveAnal P((AmpleData * pAmple_io));

/*****************************************************************************
 * NAME
 *    loadAmpleSelectiveAnalFile
 * DESCRIPTION
 *    load the selective trace information from a file (AMPLE -s option)
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurs
 */
int loadAmpleSelectiveAnalFile(pszFilename_in, pAmple_io)
const char *	pszFilename_in;
AmpleData *	pAmple_io;
{
FILE *	pInputFP;
char	szLine[100];
char *	pszWord;
char *	pszEnd;
char *	s;

pInputFP = fopen( pszFilename_in, "r" );
if (pInputFP == NULL)
	{
	reportError(ERROR_MSG,
		"Selective analysis file %s not found\n", pszFilename_in);
	setAmpleSelectiveAnal( pAmple_io );
	return -1;
	}
while ( fgets( szLine, 100, pInputFP ) )
	{
	/* If comment, cut it off */
	s = strchr( szLine, pAmple_io->cBeginComment );
	if (s != NULL)
	*s = NUL;
	for (   pszWord = szLine + strspn(szLine, szWhitespace_m) ;
		*pszWord ;
		pszWord = pszEnd )
	{
	pszEnd = isolateWord( pszWord );	/* Find end of word */
	if (strcmp(pszWord, "0") == 0)		/* If 0, put in NUL */
		*pszWord = NUL;
	pAmple_io->pSelectiveAnalMorphs =
		mergeIntoStringList(pAmple_io->pSelectiveAnalMorphs, pszWord);
	}
	}
fclose( pInputFP );
pAmple_io->pszSelectiveAnalFile = duplicateString( pszFilename_in );
setAmpleSelectiveAnal( pAmple_io );

return 0;
}

/*****************************************************************************
 * NAME
 *    addAmpleSelectiveAnalItem
 * DESCRIPTION
 *    add more selective analysis data from an encoded string
 * RETURN VALUE
 *    none
 */
void addAmpleSelectiveAnalItem(pszMorphs_in, pAmple_io)
const char *	pszMorphs_in;
AmpleData *	pAmple_io;
{
char		szMorph[256];
const char *	pszBegin;
const char *	pszEnd;
size_t		uiLength;

if ((pszMorphs_in == NULL) || (pAmple_io == NULL))
	return;
if (pAmple_io->pszSelectiveAnalFile != NULL)
	{
	freeMemory(pAmple_io->pszSelectiveAnalFile);
	pAmple_io->pszSelectiveAnalFile = NULL;
	}
for (	pszBegin = pszMorphs_in + strspn(pszMorphs_in, szWhitespace_m) ;
	*pszBegin ;
	pszBegin = pszEnd + strspn(pszEnd, szWhitespace_m) )
	{
	uiLength = strcspn(pszBegin, szWhitespace_m);
	pszEnd   = pszBegin + uiLength;
	if (uiLength != 0)
	{
	if (uiLength >= 256)
		uiLength = 255;
	strncpy(szMorph, pszBegin, uiLength);
	szMorph[uiLength] = NUL;
	pAmple_io->pSelectiveAnalMorphs =
		mergeIntoStringList(pAmple_io->pSelectiveAnalMorphs, szMorph);
	}
	}
setAmpleSelectiveAnal( pAmple_io );
}

/*****************************************************************************
 * NAME
 *    freeAmpleSelectiveAnalInfo
 * DESCRIPTION
 *    free the memory allocated for storing selective analysis information
 * RETURN VALUE
 *    none
 */
void freeAmpleSelectiveAnalInfo(pAmple_io)
AmpleData *  pAmple_io;
{
if (pAmple_io == NULL)
	return;
if (pAmple_io->pSelectiveAnalMorphs != NULL)
	{
	freeStringList(pAmple_io->pSelectiveAnalMorphs);
	pAmple_io->pSelectiveAnalMorphs = NULL;
	}
if (pAmple_io->pszSelectiveAnalFile != NULL)
	{
	freeMemory(pAmple_io->pszSelectiveAnalFile);
	pAmple_io->pszSelectiveAnalFile = NULL;
	}
setAmpleSelectiveAnal( pAmple_io );
}

/*****************************************************************************
 * NAME
 *    isAmpleAllomorphSelected
 * DESCRIPTION
 *    check whether the allomorph is listed for selective analysis (or whether
 *    all allomorphs are "selected" because the list is empty)
 * RETURN VALUE
 *    TRUE (nonzero) if the allomorph is selected as active, otherwise FALSE
 *    (zero)
 */
int isAmpleAllomorphSelected(pszMorphName_in, pszAllomorph_in, pAmple_in)
const char *	pszMorphName_in;
const char *	pszAllomorph_in;
AmpleData *	pAmple_in;
{
return	(pAmple_in->pSelectiveAnalMorphs == NULL)              ||
	isMemberOfStringList( pAmple_in->pSelectiveAnalMorphs,
				  pszMorphName_in ) ||
	isMemberOfStringList( pAmple_in->pSelectiveAnalMorphs,
				  pszAllomorph_in );
}

/*****************************************************************************
 * NAME
 *    writeAmpleSelectedMorphs
 * DESCRIPTION
 *    write the list of selected morphnames / allomorphs to the log file
 *    for SGML style tracing output
 * RETURN VALUE
 *    none
 */
void writeAmpleSelectedMorphs(pAmple_in)
const AmpleData *	pAmple_in;
{
AmpleMorpheme *		pMorph;
AmpleAllomorph *	pAllo;

if (	(pAmple_in == NULL)                             ||
	(pAmple_in->pLogFP == NULL)                     ||
	( (pAmple_in->eTraceAnalysis != AMPLE_TRACE_SGML) &&
	  (pAmple_in->eTraceAnalysis != AMPLE_TRACE_XML) ) ||
	(pAmple_in->pSelectiveAnalMorphs == NULL) )
	return;

fprintf(pAmple_in->pLogFP, "  <selectedMorphs>\n");
for ( pMorph = pAmple_in->pAmpleMorphemes ; pMorph ; pMorph = pMorph->pLink )
	{
	if (isMemberOfStringList(pAmple_in->pSelectiveAnalMorphs,
				 pMorph->pszMorphName))
	{
	fprintf(pAmple_in->pLogFP, "    <morphID>");
	writeAmplePCDATA(pAmple_in->pLogFP, pMorph->pszMorphName, FALSE);
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	  fprintf(pAmple_in->pLogFP, "</morphID>\n");
	else
	  fprintf(pAmple_in->pLogFP, "</>\n");
	}
	else
	{
	for (	pAllo = pMorph->pAllomorphs ;
		pAllo ;
		pAllo = pAllo->pNextAllomorph )
		{
		if (isMemberOfStringList(pAmple_in->pSelectiveAnalMorphs,
					 pAllo->pszAllomorph))
		{
		fprintf(pAmple_in->pLogFP, "    <morphID>");
		if (pAllo->pszAllomorphID != NULL)
			writeAmplePCDATA(pAmple_in->pLogFP, pAllo->pszAllomorphID,
					 FALSE);
		else
			writeAmplePCDATA(pAmple_in->pLogFP, pMorph->pszMorphName,
					 FALSE);
		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		  fprintf(pAmple_in->pLogFP, "</morphID>\n");
		else
		  fprintf(pAmple_in->pLogFP, "</>\n");
		if (pAllo->pszAllomorphID == NULL)
			break;
		}
		}
	}
	}
fprintf(pAmple_in->pLogFP, "  </selectedMorphs>\n");
}

/*****************************************************************************
 * NAME
 *    setAmpleSelectiveAnal
 * DESCRIPTION
 *    mark all of the allomorphs either active or inactive based on the value
 *    of pAmple_io->pSelectiveAnalMorphs
 * RETURN VALUE
 *    none
 */
static void setAmpleSelectiveAnal(pAmple_io)
AmpleData *	pAmple_io;
{
AmpleMorpheme *		pMorph;
AmpleAllomorph *	pAllo;
#ifndef hab3320
char                    szTempMorphname[65];
#endif /* hab3320 */

if (pAmple_io == NULL)
	return;

if (pAmple_io->pSelectiveAnalMorphs == NULL)
	{
	/*
	 *  everything is selected
	 */
	for (   pMorph = pAmple_io->pAmpleMorphemes ;
		pMorph ;
		pMorph = pMorph->pLink )
	{
	for (	pAllo = pMorph->pAllomorphs ;
		pAllo ;
		pAllo = pAllo->pNextAllomorph )
		pAllo->iAllomorphFlags |= ACTIVE;
	}
	return;
	}
for (	pMorph = pAmple_io->pAmpleMorphemes ;
	pMorph ;
	pMorph = pMorph->pLink)
	{
#ifndef hab3320
	if (pMorph->pszMorphName != NULL)
		{
	if (pMorph->iMorphType & RSC)	/* adjust for regular sound change */
		{
		szTempMorphname[0] = '*';
		strncpy(szTempMorphname + 1, pMorph->pszMorphName,
			sizeof(szTempMorphname) - 1);
		}
	else
		{
		strncpy(szTempMorphname, pMorph->pszMorphName,
			sizeof(szTempMorphname));
		}
	szTempMorphname[sizeof(szTempMorphname) - 1] = NUL;
	}
	else
	{
	if (pMorph->pAllomorphs &&
		pMorph->pAllomorphs->pszAllomorph != NULL)
		{			/* use first allomorph string */
		szTempMorphname[0] = '*';
		strncpy(szTempMorphname + 1, pMorph->pAllomorphs->pszAllomorph,
			sizeof(szTempMorphname) - 1);
		}
	else
		szTempMorphname[0] = NUL;
	}
	if (isMemberOfStringList( pAmple_io->pSelectiveAnalMorphs,
				  szTempMorphname) )
#else /* hab3320 */
	if (isMemberOfStringList( pAmple_io->pSelectiveAnalMorphs,
				  pMorph->pszMorphName) )
#endif /* hab3320 */
	{
	/*
	 *  the morphname is selected
	 */
	for (	pAllo = pMorph->pAllomorphs ;
		pAllo ;
		pAllo = pAllo->pNextAllomorph )
		pAllo->iAllomorphFlags |= ACTIVE;
	}
	else
	{
	for (	pAllo = pMorph->pAllomorphs ;
		pAllo ;
		pAllo = pAllo->pNextAllomorph )
		{
		if (isMemberOfStringList( pAmple_io->pSelectiveAnalMorphs,
					  pAllo->pszAllomorph) )
		{
		/*
		 *  the allomorph is selected
		 */
		pAllo->iAllomorphFlags |= ACTIVE;
		}
		else
		{
		/*
		 *  neither the morphname nor the allomorph is selected
		 */
		pAllo->iAllomorphFlags &= ~ACTIVE;
		}
		}
	}
	}
}

/*****************************************************************************
 * NAME
 *    stringifyAmpleSelectedMorphs
 * DESCRIPTION
 *    add the list of selected morphnames / allomorphs to the dynamic string
 *    for SGML style tracing output
 * RETURN VALUE
 *    pointer to the (possibly reallocated) dynamic string
 */
char * stringifyAmpleSelectedMorphs(pszString_io, puiStringSize_io, pAmple_in)
char *      pszString_io;
size_t *    puiStringSize_io;
AmpleData * pAmple_in;
{
AmpleMorpheme *		pMorph;
AmpleAllomorph *	pAllo;
char *			pszName;

if (	(pAmple_in        == NULL) ||
	(pszString_io     == NULL) ||
	(puiStringSize_io == NULL) ||
	( (pAmple_in->eTraceAnalysis != AMPLE_TRACE_SGML) &&
	  (pAmple_in->eTraceAnalysis != AMPLE_TRACE_XML) ) ||
	(pAmple_in->pSelectiveAnalMorphs == NULL) )
	return pszString_io;

pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
				   "  <selectedMorphs>\n");


for ( pMorph = pAmple_in->pAmpleMorphemes ; pMorph ; pMorph = pMorph->pLink )
	{
	if (isMemberOfStringList(pAmple_in->pSelectiveAnalMorphs,
				 pMorph->pszMorphName))
	{
	char *	pszTemp;
	size_t	uiLength;
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   "    <morphID>");
	uiLength = lengthAmplePCDATA(pMorph->pszMorphName, FALSE);
#ifdef HAVE_ALLOCA
	pszTemp = (char *)alloca(uiLength + 1);
#else
	pszTemp = (char *)allocMemory(uiLength + 1);
#endif
	storeAmplePCDATA(pszTemp, pMorph->pszMorphName, FALSE);
	pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   pszTemp);
#ifndef HAVE_ALLOCA
	freeMemory(pszTemp);
#endif
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	  pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   "</morphID>\n");
	else
	  pszString_io = appendDynamicString(pszString_io, puiStringSize_io,
					   "</>\n");
	}
	else
	{
	for (	pAllo = pMorph->pAllomorphs ;
		pAllo ;
		pAllo = pAllo->pNextAllomorph )
		{
		if (isMemberOfStringList(pAmple_in->pSelectiveAnalMorphs,
					 pAllo->pszAllomorph))
		{
		char *	pszTemp;
		size_t	uiLength;

		pszString_io = appendDynamicString(pszString_io,
						   puiStringSize_io,
						   "    <morphID>");
		if (pAllo->pszAllomorphID != NULL)
			pszName = pAllo->pszAllomorphID;
		else
			pszName = pMorph->pszMorphName;
		uiLength = lengthAmplePCDATA(pszName, FALSE);
#ifdef HAVE_ALLOCA
		pszTemp = (char *)alloca(uiLength + 1);
#else
		pszTemp = (char *)allocMemory(uiLength + 1);
#endif
		storeAmplePCDATA(pszTemp, pszName, FALSE);
		pszString_io = appendDynamicString(pszString_io,
						   puiStringSize_io,
						   pszTemp);
#ifndef HAVE_ALLOCA
		freeMemory(pszTemp);
#endif
		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		  pszString_io = appendDynamicString(pszString_io,
							 puiStringSize_io,
							 "</morphID>\n");
		else
		  pszString_io = appendDynamicString(pszString_io,
							 puiStringSize_io,
							 "</>\n");
		if (pAllo->pszAllomorphID == NULL)
			break;
		}
		}
	}
	}
return appendDynamicString(pszString_io, puiStringSize_io,
			   "  </selectedMorphs>\n");
}
