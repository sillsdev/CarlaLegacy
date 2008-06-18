/* DTBIO.C - functions for reading or writing analysis database files
 ***************************************************************************
 *
 * StampWord * readStampWord(FILE *        pInputFP_in,
 *                           TextControl * pTextCtl_in)
 *
 * void writeStampWord(StampWord *   pWord_in,
 *                     FILE *        pOutputFP_in,
 *                     const char *  pszFilename_in,
 *                     StampData *   pStamp_in)
 *
 * void freeStampWord(StampWord * word)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include "stamp.h"
/*
 *  local function prototypes
 */
static char *	form_anal P((StampAnalysis *anal, StampData * pStamp_in));
static int	isUnique P((WordAnalysis * pList_in, char * pszAnal_in,
				char * pszDecomp_in));
static void	freeStampAnalysisList P((StampAnalysisList * list));

/***************************************************************************
 * NAME
 *    readStampWord
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Read one record from an analysis database file, storing the information
 *    in a dynamically allocated StampWord data structure.
 * RETURN VALUE
 *    pointer to the StampWord data structure, or NULL on EOF
 */
StampWord * readStampWord(pInputFP_in, pTextCtl_in)
FILE *		pInputFP_in;
TextControl *	pTextCtl_in;
{
StampWord *	pWord;
/*
 *  Allocate and clear a word structure
 */
pWord = (StampWord *)allocMemory( sizeof(StampWord));
pWord->pTemplate        = readTemplateFromAnalysis(pInputFP_in, pTextCtl_in);
pWord->pTrAnalyses      = NULL;
if (pWord->pTemplate == NULL)
	{
	freeMemory( pWord );
	pWord = NULL;
	}
return( pWord );
}

/*************************************************************************
 * NAME
 *    form_anal
 * ARGUMENTS
 *    anal - pointer to a list of analysis morphemes
 * DESCRIPTION
 *    Convert a list analysis struct's to a character string for output
 *    a la AMPLE.
 * RETURN VALUE
 *    pointer to a static buffer containing the analysis string
 */
static char * form_anal(anal, pStamp_in)
StampAnalysis *	anal;
StampData *	pStamp_in;
{
static char	szBuffer_s[BUFSIZE];
char *		p;
StampAnalysis *	ap;

if (!anal)
	return ("");
for ( p = szBuffer_s, ap = anal ; ap ; ap = ap->pRightLink )
	{
	if (ap->m.iMorphType & ROOT)
		{
	if (!ap->pLeftLink || !(ap->pLeftLink->m.iMorphType & ROOT))
		{
		*p++ = pStamp_in->cBeginRoot;
		*p++ = ' ';
		}
		p = cpystr(p, findAmpleCategoryName(ap->m.iToCategory,
						pStamp_in->pCategories));
		*p++ = ' ';
		p = cpystr(p, ap->m.pszMorphname);
		if (!ap->pRightLink || !(ap->pRightLink->m.iMorphType & ROOT))
			{
			*p++ = ' ';
			*p++ = pStamp_in->cEndRoot;
			}
		}
	else
		{
		p = cpystr(p, ap->m.pszMorphname);
		}
	if (ap->pRightLink)
		*p++ = ' ';
	*p = NUL;                   /* always terminate the string */
	}
return(szBuffer_s);
}

/*****************************************************************************
 * NAME
 *    isUnique
 * DESCRIPTION
 *    check whether this analysis and decomposition occurs in the list of
 *    analyses
 * RETURN VALUE
 *    TRUE if these do not occur in the list, FALSE if they do
 */
static int isUnique(pList_in, pszAnal_in, pszDecomp_in)
WordAnalysis * pList_in;
char * pszAnal_in;
char * pszDecomp_in;
{
WordAnalysis * pAnal;

for ( pAnal = pList_in ; pAnal ; pAnal = pAnal->pNext )
	{
	if (    (strcmp(pAnal->pszAnalysis, pszAnal_in) == 0) &&
		(strcmp(pAnal->pszDecomposition, pszDecomp_in) == 0) )
	return FALSE;
	}
return TRUE;
}

/*************************************************************************
 * NAME
 *    writeStampWord
 * ARGUMENTS
 *    wp - pointer to word_template structure
 * DESCRIPTION
 *    Format the results of analysis as a database.  Each word is written as
 *    a record with these fields:
 *        \a = analysis (ambiguities and failures marked)
 *        \d = morpheme decomposition (ambiguities and failures marked)
 *        \cat = category
 *        \fd = feature descriptor
 *        \w = original word
 *        \f = preceding format marks
 *        \c = capitalization
 *        \n = trailing nonalphabetics
 *    Ambiguities are marked as %n%ANAL1%ANAL2% ... %ANALn%
 *    Failures are marked as %0%original_word%
 * RETURN VALUE
 *    none
 */
void writeStampWord(pWord_in, pOutputFP_in, pszFilename_in, pStamp_in)
StampWord *	pWord_in;
FILE *		pOutputFP_in;
const char *	pszFilename_in;
StampData *	pStamp_in;
{
StampAnalysisList *	pAmb;
char *			pszNewAnal;
WordAnalysis *		pAnal;
WordAnalysis *		pNew;
WordAnalysis *		pNewList = NULL;
WordAnalysis *		pNewTail = NULL;
/*
 *  form new analysis records based on transfer results
 */
for (	pAmb = pWord_in->pTrAnalyses, pAnal = pWord_in->pTemplate->pAnalyses ;
	pAmb ;
	pAmb = pAmb->pNext,  pAnal = pAnal->pNext )
	{
	if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
		{
		fprintf(pStamp_in->pLogFP, "\nDTBOUT -- before form_anal()\n");
		fprintf(pStamp_in->pLogFP, "pAmb->anal = %p\n", pAmb->pAnal);
		}
	pszNewAnal = form_anal(pAmb->pAnal, pStamp_in);
	if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
		{
		fprintf(pStamp_in->pLogFP, "\nDTBOUT -- after form_anal()\n");
		fprintf(pStamp_in->pLogFP, "pszNewAnal = %p\n", pszNewAnal);
		}
	/*
	 *  if unique analysis or decomposition, copy other information
	 */
	if (isUnique(pNewList, pszNewAnal, pAnal->pszDecomposition))
	{
	pNew = allocMemory(sizeof(WordAnalysis));
	pNew->pszAnalysis       = duplicateString(pszNewAnal);
	pNew->pszDecomposition  = pAnal->pszDecomposition;
	pNew->pszCategory       = pAnal->pszCategory;
	pNew->pszProperties     = pAnal->pszProperties;
	pNew->pszFeatures       = pAnal->pszFeatures;
	pNew->pszUnderlyingForm = pAnal->pszUnderlyingForm;
	pNew->pNext             = NULL;
	if (pNewTail == NULL)
		pNewList = pNew;
	else
		pNewTail->pNext = pNew;
	pNewTail = pNew;
	pAnal->pszDecomposition  = NULL;
	pAnal->pszCategory       = NULL;
	pAnal->pszProperties     = NULL;
	pAnal->pszFeatures       = NULL;
	pAnal->pszUnderlyingForm = NULL;
	}
	}
if (pWord_in->pTemplate->pAnalyses != NULL)
	freeWordAnalysisList(pWord_in->pTemplate->pAnalyses);
pWord_in->pTemplate->pAnalyses = pNewList;

writeTemplate(pOutputFP_in, pszFilename_in, pWord_in->pTemplate,
		  &pStamp_in->sTextCtl);
}

/***************************************************************************
 * NAME
 *    freeStampAnalysisList
 * ARGUMENTS:
 *    list - pointer to head of anal_list
 * DESCRIPTION
 *    Delete an anal_list, freeing all the space it used.
 * RETURN VALUE
 *    none
 */
static void freeStampAnalysisList( list )
StampAnalysisList *list;
{
StampAnalysisList *ambp, *next_ambp;

for ( ambp = list ; ambp ; ambp = next_ambp )
	{
	next_ambp = ambp->pNext;     /* save the address of the next node */
	freeStampAnalysis( ambp->pAnal ); /* release the analysis list */
#ifndef hab2111
#ifndef TONEGEN
	freeMemory( ambp->pszSynthResult );
#endif /* TONEGEN */
#endif /* hab2111 */
	freeMemory( ambp );     /* release the node space */
	}
}

/***************************************************************************
 * NAME
 *    freeStampWord
 * ARGUMENTS
 *    word - word_template structure to free
 * DESCRIPTION
 *    Free everything in a word_template structure, and the structure.
 * RETURN VALUE
 *    None
 */
void freeStampWord( word )
StampWord *word;
{
if ( word )
	{
	if ( word->pTemplate )
		freeWordTemplate( word->pTemplate );
	if ( word->pTrAnalyses )
		freeStampAnalysisList( word->pTrAnalyses );
	freeMemory( word );
	}
}
