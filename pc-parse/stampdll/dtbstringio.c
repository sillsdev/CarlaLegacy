 /* dtbstringio.c - functions for reading or writing analysis database files
 ***************************************************************************
 *
 * StampWord * readStampWordString(char *pszInputString_in,
 *                           TextControl * pTextCtl_in)
 *
 * void writeStampWordString(StampWord * pWord_in,
 *                     FILE *        pOutputFP_in,
 *                     const char *  pszFilename_in,
 *                     StampData *   pStamp_in)
 *
 * void freeStampWorddll(StampWord * word)
 *
 *	 static char * addFWParseToBuffer(
 *		StampSetup			*pSetup_in,
 *		const StampWord		*pWord_in,
 *		TextControl	*pTextCtl_in,
 *		char *		        pszBuffer_out,
 *		size_t		        uiBufferSize_in,  // this doesn't count space for NUL
 *      int					iAnalysesCount_in)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include "stamp.h"
#include "templatestringfunctions.h"
/*
 *  local function prototypes
 */
static char *	form_anal P((StampAnalysis *anal, StampData * pStamp_in));
static int	isUnique P((WordAnalysis * pList_in, char * pszAnal_in,
			    char * pszDecomp_in));
static void	freeStampAnalysisList P((StampAnalysisList * list));
StampWord * readStampWordString(const char *pszInputString_in,
					TextControl *pTextCtl_in, StampSetup *pSetup_io);

//Gotta declare it before you can use it.
static void fwConCat(char * pszString_in, int iAnalysesCount_in, 
		     int *iRoom_io, char *pszAResult_io);

// fwConCat is static so wrap it for external call.
void fwConCatWrap(char *pszString_in, int iAnalysesCount_in,
				  int *iRoom_io, char *pszAResult_io)
{
	fwConCat(pszString_in, iAnalysesCount_in, iRoom_io, pszAResult_io);
}

/***************************************************************************
 * NAME
 *    readStampWordSring
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Read one record from an analysis database file, storing the information
 *    in a dynamically allocated StampWord data structure.
 * RETURN VALUE
 *    pointer to the StampWord data structure, or NULL on EOF
 */
StampWord * readStampWordString(pszInputString_in, pTextCtl_in, pSetup_io)
const char *	pszInputString_in;
TextControl *	pTextCtl_in;
StampSetup *pSetup_io;
{
StampWord *	pWord;
/*
 *  Allocate and clear a word structure
 */
pWord = (StampWord *)allocMemory( sizeof(StampWord));
pWord->pTemplate = readTemplateFromAnalysisString(pszInputString_in,
												pTextCtl_in, pSetup_io);
pWord->pTrAnalyses = NULL;
if (pWord->pTemplate == NULL)
    {
    freeMemory( pWord );
    pWord = NULL;
    }
return( pWord );
}

/*************************************************************************
 * NAME
 *    form_analFW
 * ARGUMENTS
 *    anal - pointer to a list of analysis morphemes
 * DESCRIPTION
 *    Convert a list analysis struct's to a character string for output
 *    a la FW.
 * RETURN VALUE
 *    pointer to a static buffer containing the analysis string
 */
static char *form_analFW(anal, pStamp_in)
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
        p = cpystr(p, findAmpleCategoryName(ap->m.iToCategory,
					    pStamp_in->pCategories));
        }
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
//static int isUnique(pList_in, pszAnal_in, pszDecomp_in)
//WordAnalysis * pList_in;
//char * pszAnal_in;
//char * pszDecomp_in;
//{
//WordAnalysis * pAnal;

//for ( pAnal = pList_in ; pAnal ; pAnal = pAnal->pNext )
//    {
//    if (    (strcmp(pAnal->pszAnalysis, pszAnal_in) == 0) &&
//	    (strcmp(pAnal->pszDecomposition, pszDecomp_in) == 0) )
//	return FALSE;
//    }
//return TRUE;
//}

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

//void writeStampWord(pWord_in, pOutputFP_in, pszFilename_in, pStamp_in)
//StampWord *	pWord_in;
//FILE *		pOutputFP_in;
//const char *	pszFilename_in;
//StampData *	pStamp_in;
//{
//StampAnalysisList *	pAmb;
//char *			pszNewAnal;
//WordAnalysis *		pAnal;
//WordAnalysis *		pNew;
//WordAnalysis *		pNewList = NULL;
//WordAnalysis *		pNewTail = NULL;
/*
 *  form new analysis records based on transfer results
 */
//for (	pAmb = pWord_in->pTrAnalyses, pAnal = pWord_in->pTemplate->pAnalyses ;
//	pAmb ;
//	pAmb = pAmb->pNext,  pAnal = pAnal->pNext )
//    {
//    if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
//        {
//        fprintf(pStamp_in->pLogFP, "\nDTBOUT -- before form_anal()\n");
//        fprintf(pStamp_in->pLogFP, "pAmb->anal = %p\n", pAmb->pAnal);
//        }
//    pszNewAnal = form_anal(pAmb->pAnal, pStamp_in);
//    if ((pStamp_in->iDebugLevel == 5) && (pStamp_in->pLogFP != NULL))
//        {
//        fprintf(pStamp_in->pLogFP, "\nDTBOUT -- after form_anal()\n");
//        fprintf(pStamp_in->pLogFP, "pszNewAnal = %p\n", pszNewAnal);
//        }
    /*
     *  if unique analysis or decomposition, copy other information
     */
//    if (isUnique(pNewList, pszNewAnal, pAnal->pszDecomposition))
//	{
//	pNew = allocMemory(sizeof(WordAnalysis));
//	pNew->pszAnalysis       = duplicateString(pszNewAnal);
//	pNew->pszDecomposition  = pAnal->pszDecomposition;
//	pNew->pszCategory       = pAnal->pszCategory;
//	pNew->pszProperties     = pAnal->pszProperties;
//	pNew->pszFeatures       = pAnal->pszFeatures;
//	pNew->pszUnderlyingForm = pAnal->pszUnderlyingForm;
//	pNew->pNext             = NULL;
//	if (pNewTail == NULL)
//	    pNewList = pNew;
//	else
//	    pNewTail->pNext = pNew;
//	pNewTail = pNew;
//	pAnal->pszDecomposition  = NULL;
//	pAnal->pszCategory       = NULL;
//	pAnal->pszProperties     = NULL;
//	pAnal->pszFeatures       = NULL;
//	pAnal->pszUnderlyingForm = NULL;
//	}
//    }
//if (pWord_in->pTemplate->pAnalyses != NULL)
//    freeWordAnalysisList(pWord_in->pTemplate->pAnalyses);
//pWord_in->pTemplate->pAnalyses = pNewList;

//writeTemplate(pOutputFP_in, pszFilename_in, pWord_in->pTemplate,
//	      &pStamp_in->sTextCtl);
//}

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
//static void freeStampAnalysisList( list )
//StampAnalysisList *list;
//{
//StampAnalysisList *ambp, *next_ambp;

//for ( ambp = list ; ambp ; ambp = next_ambp )
//    {
//    next_ambp = ambp->pNext;     /* save the address of the next node */
//    freeStampAnalysis( ambp->pAnal ); /* release the analysis list */
//#ifndef hab2111
//#ifndef TONEGEN
//    freeMemory( ambp->pszSynthResult );
//#endif /* TONEGEN */
//#endif /* hab2111 */
//    freeMemory( ambp );     /* release the node space */
//    }
//}

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
//void freeStampWord( word )
//StampWord *word;
//{
//if ( word )
//    {
//    if ( word->pTemplate )
//        freeWordTemplate( word->pTemplate );
//    if ( word->pTrAnalyses )
//        freeStampAnalysisList( word->pTrAnalyses );
//    freeMemory( word );
//    }
//}


/*****************************************************************************
 * NAME
 *    fwConCat
 * DESCRIPTION
 *    concatenate a string to a buffer and check for overflow;
 *    if there's potential overflow, concatenate a message to the buffer
 * RETURN VALUE
 *    none
 */
static void fwConCat(char * pszString_in, int iAnalysesCount_in, 
		     int *iRoom_io, char *pszAResult_io)
{
  int  iSize;
  char szCountBuffer[11];

#define  NOMOREROOM -65000

  if (*iRoom_io == NOMOREROOM)
    return;

  iSize = (int)strlen(pszString_in); 
  if (*iRoom_io < (iSize + 300)) /* use 300 to ensure plenty of room */
    { 
      strncat(pszAResult_io, szExceptionBufSizeBegin_m, *iRoom_io);
      *iRoom_io -= (int)strlen(szExceptionBufSizeBegin_m); 
#ifdef WIN32
      _itoa(iAnalysesCount_in, szCountBuffer, 10);
#else
      sprintf(szCountBuffer, "%d", iAnalysesCount_in);
#endif
      strncat(pszAResult_io, szCountBuffer, *iRoom_io); 
      *iRoom_io -= (int)strlen(szCountBuffer); 
      strncat(pszAResult_io, szExceptionEnd_m, *iRoom_io);
      *iRoom_io -= (int)strlen(szExceptionEnd_m);
      strncat(pszAResult_io, szWordFormClose_m, *iRoom_io);
      *iRoom_io = NOMOREROOM; 	/* force bad value so no more gets added to
                                   pszAResult_io*/
    }
  else 
    {
      strncat(pszAResult_io, pszString_in, *iRoom_io); 
      pszAResult_io += iSize; 
      *iRoom_io -= iSize; 
    }
}

/*****************************************************************************
 * NAME
 *
 *	  countAmbiguities
 *	DESCRIPTION
 *	  count ambiguites in an analysis
 *
 * RETURN VALUE
 *    integer count of the number of abiguities
 */

int countAmbiguities(const WordTemplate *pTemplate_in)
{
	unsigned uiAmbigCount = 0;
	WordAnalysis *pAnal;

	if (	(pTemplate_in->pAnalyses != NULL) &&
		(pTemplate_in->pAnalyses->pszAnalysis != NULL) )
		{
		for ( pAnal = pTemplate_in->pAnalyses ; pAnal ; pAnal = pAnal->pNext )
		++uiAmbigCount;
		}

	return uiAmbigCount;
}


/*****************************************************************************
 * NAME
 *    addFWParseToBuffer
 * DESCRIPTION
 *    add the parsed word in the WordTemplate structure to the buffer in
 *    <AResult> form
 * RETURN VALUE
 *    pointer to the buffer
 */
const char *addFWParseToBuffer(
	 StampSetup			*pSetup_in,
	 const StampWord	*pWord_in,
	 TextControl		*pTextCtl_in,
	 char				*pszBuffer_out,
	 size_t		        uiBufferSize_in,  /* this doesn't count space for NUL*/
     int                iAnalysesCount_in)
{
  StampAnalysis			*pAnalysis;
  StampAnalysisList		*pAnalList;
  char					*pMorph;
  char					*pszAResult;
  int			        iSize;
  int 			        iRoom;
  int                   iAnalCount;
  int                   iMaxAnalyses = MAX_ANALYSES_TO_RETURN_NO_LIMIT;
	 
  /*
   *  adjust pointers and counters for less redundant skipping
   */
  iSize     = (int)strlen(pszBuffer_out);
  pszAResult = pszBuffer_out + iSize;
  iRoom     = (int)uiBufferSize_in - iSize;

//  if (pSetup_in)
//    iMaxAnalyses = pSetup_in->sData.iMaxAnalysesToReturn;
//  else
//    iMaxAnalyses = MAX_ANALYSES_TO_RETURN_NO_LIMIT;
	
  fwConCat(" <Wordform DbRef=\"DB_REF_HERE\" Form=\"", iAnalysesCount_in, &iRoom, pszAResult);
  fwConCat(pWord_in->pTemplate->pszOrigWord, iAnalysesCount_in, &iRoom, pszAResult);
  fwConCat("\">\r\n", iAnalysesCount_in, &iRoom, pszAResult);;
	 
  if (pWord_in->pTemplate->pAnalyses == NULL)
    {
      fwConCat("  <WfiAnalysis/>\r\n", iAnalysesCount_in, &iRoom, pszAResult); /* empty means failed to parse */
    }
  else
    {
      iAnalCount = 0;
	  for (pAnalList = pWord_in->pTrAnalyses; pAnalList; pAnalList = pAnalList->pNext)
	{
	  pAnalysis = pAnalList->pAnal;
	  ++iAnalCount;
	  //Too many?
	  if ((iMaxAnalyses != MAX_ANALYSES_TO_RETURN_NO_LIMIT) &&
	      (iMaxAnalyses < iAnalCount))
	    {
	      char   szCountBuffer[11];
	      fwConCat(szExceptionAnalysesSizeBegin_m, iAnalysesCount_in,
		       &iRoom, pszAResult);
#if WIN32
	      _itoa(iAnalysesCount_in, szCountBuffer, 10);
#else
	      sprintf(szCountBuffer, "%d", iAnalysesCount_in);
#endif
	      fwConCat(szCountBuffer, iAnalysesCount_in,
		       &iRoom, pszAResult);
	      fwConCat(szExceptionEnd_m, iAnalysesCount_in, 
		       &iRoom, pszAResult);
	      break;		/* don't do any more */
	    }
	  else
	    {
	      fwConCat("  <WfiAnalysis>\r\n", iAnalysesCount_in,
		       &iRoom, pszAResult);
	      fwConCat("   <Morphs>\r\n", iAnalysesCount_in,
		       &iRoom, pszAResult);
	      
		for ( ; pAnalysis; pAnalysis = pAnalysis->pRightLink)
		{
		  fwConCat("    <Morph>\r\n", iAnalysesCount_in,
			   &iRoom, pszAResult);
		  pMorph = pAnalysis->m.pszMorphname;
		  if (pMorph == NULL)
		    {
		      reportError(ERROR_MSG, "pAnalysis->m.pszMorphname is NULL?\n");
		      fwConCat("     <MoForm DbRef='0' Label=\"?\"/>\r\n",
			       iAnalysesCount_in, &iRoom, pszAResult);
		      continue;
		    }
		  fwConCat("      <MoForm DbRef='", iAnalysesCount_in,
			   &iRoom, pszAResult);


		  if (pAnalysis->m.pAllomorphs && pAnalysis->m.pAllomorphs->a.pszAllomorphID)
		    fwConCat(pAnalysis->m.pAllomorphs->a.pszAllomorphID, iAnalysesCount_in,
			     &iRoom, pszAResult);
		  else
		    {
		      fwConCat("0", iAnalysesCount_in, &iRoom, pszAResult);
		      /* todo: consider raising an error at this point, */
		      /* once the caller is normalling giving us an allo id */
		    }
		  fwConCat("' Label=\"", iAnalysesCount_in, &iRoom, pszAResult);
		  fwConCat(pMorph, iAnalysesCount_in,
			   &iRoom, pszAResult);
#ifdef EXPERIMENTAL
//		  if (pAnal->pPATRCAT != NULL)
		    {
		      fwConCat("\" wordType=\"", iAnalysesCount_in, &iRoom, 
			       pszAResult);
			  fwConCat(form_analFW(pAnalysis, &pSetup_in->sData), iAnalysesCount_in, &iRoom, 
			   pszAResult);
		    }
#endif
		  fwConCat("\"/>\r\n", iAnalysesCount_in, &iRoom, pszAResult);
		  fwConCat("      <MSI DbRef='", iAnalysesCount_in,
			   &iRoom, pszAResult);
		  fwConCat(pAnalysis->m.pszMorphname, iAnalysesCount_in,
			   &iRoom, pszAResult); // assumes pszMorphName is
		             // holding the database id (a long int) of this msi
		  fwConCat("'/>\r\n", iAnalysesCount_in, &iRoom, pszAResult);
		  fwConCat("    </Morph>\r\n", iAnalysesCount_in,
			   &iRoom, pszAResult);
		}
	      fwConCat("   </Morphs>\r\n", iAnalysesCount_in,
		       &iRoom, pszAResult);
	      fwConCat("  </WfiAnalysis>\r\n", iAnalysesCount_in,
		       &iRoom, pszAResult);
	    }
	}
    }
  fwConCat(szWordFormClose_m, iAnalysesCount_in, &iRoom, pszAResult);

  return pszBuffer_out;
}