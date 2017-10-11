/* textoutdll.c - write the contents of a word_template to a buffer for Field Works [rke 2013.8.8]
 ***************************************************************************
 *
 * void writeTextFromTemplateToBuffer(const	WordTemplate *pTemplate_in,
 *	const TextControl *pTextCtl_in, char *pszBuffer_out, size_t uiBufferSize_in,
 *	int iAnalysesCount_in)
 *
 * char * recapitalizeWord(char *pszWord_io,
 *#if 0
 *			   int                 iRecap_in,
 *#else
 *			   long                iRecap_in,
 *#endif
 * const TextControl * pTextCtl_in,
 *             const StringList *  pSkipOver_in)
 *
 * void fixSynthesizedWord(WordTemplate *      pTemplate_io,
 *			   const TextControl * pTextCtl_in,
 *                         const StringList *  pSkipOver_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1988, 2000 by SIL International.  All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include "templatestringfunctions.h"
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
extern VOIDP  memmove P((VOIDP dest, VOIDP src, size_t n));
extern VOIDP  memcpy  P((VOIDP dest, VOIDP src, size_t n));
extern size_t strlen  P((const char * s));
#endif

#include "allocmem.h"
#include "textctl.h"
#include "template.h"
extern int matchBeginning P((const char * pszString_in,
			     const char * pszBegin_in));

/*****************************************************************************
 *  control data set by the text input control file (xxINTX.CTL)
 */
static unsigned char default_barcodes[] = "bdefhijmrsuvyz";
static TextControl default_textout_control = {
    NULL,	/* filename */
    NULL,	/* list of lowercase/uppercase pairs sorted by lowercase */
    NULL,	/* list of lowercase/uppercase pairs sorted by uppercase */
    NULL,	/* array of caseless letters */
    NULL,	/* list of input orthography changes */
    NULL,	/* list of output (orthography) changes */
    NULL,	/* list of format markers (fields) to include */
    NULL,	/* list of format markers (fields) to exclude */
    '\\',	/* initial character of format markers */
    '%',	/* character for marking ambiguities and failures (database) */
    '%',	/* character for marking ambiguities and failures (text) */
    '-',	/* character for marking decomposition */
    '|',	/* initial character of secondary format markers */
    default_barcodes,	/* string of characters for secondary format markers */
    1,		/* flag whether or not to capitalize individual letters */
    1,		/* flag whether or not to handle capitalization */
    100		/* maximum number of ambiguous decapitalizations to allow */
    };

static char * skip_over P((char *             pszString_in,
			   const StringList * pSkipOver_in));

/*****************************************************************************
 * NAME
 *    skip_over
 * DESCRIPTION
 *    advance the string pointer past any number of characters (strings) that
 *    are contained in the skip list
 * RETURN VALUE
 *    pointer to next character that is not in the skip list
 */
static char * skip_over(pszString_in, pSkipOver_in)
char *             pszString_in;
const StringList * pSkipOver_in;
{
char *		   p;
const StringList * sp;
size_t		   uiLength;

if ((pszString_in == NULL) || (pSkipOver_in == NULL))
    return pszString_in;

for ( p = pszString_in ; *p ; p += uiLength )
    {
    uiLength = 0;
    for ( sp = pSkipOver_in ; sp ; sp = sp->pNext )
	{
	if (matchBeginning(p, sp->pszString))
	    {
	    uiLength = strlen(sp->pszString);
	    break;
	    }
	}
    if (uiLength == 0)
	break;
    }
return p;
}

/*************************************************************************
 * NAME
 *    recapitalizeWord
 * DESCRIPTION
 *    Try to reimpose capitalization as it was in the original input text.
 * RETURN VALUE
 *    none
 */
//char * recapitalizeWord(pszWord_io, iRecap_in, pTextCtl_in, pSkipOver_in)
//char *			pszWord_io;
//long			iRecap_in;
//const TextControl *	pTextCtl_in;
//const StringList *	pSkipOver_in;
//{
//char *			p;
//int			iLength;
//int			iUpperLength;
//int			iOffset;
//const unsigned char *	pszUpper;
//long			bitmask;

//switch (iRecap_in)
//   {
//    case INITCAP:
	/*
	 *  capitalize the first character which makes sense to `capitalize'
	 */
//	for ( p = pszWord_io ; *p ; p += iLength )
//	    {
//	    p = skip_over(p, pSkipOver_in);
//	    if (*p == NUL)
//		break;
//	    iLength = matchLowercaseChar((unsigned char *)p, pTextCtl_in);
//	    if (iLength != 0)
//		{
//		pszUpper = convLowerToUpper((unsigned char *)p, pTextCtl_in);
//		iUpperLength = strlen((char *)pszUpper);
//		if (iUpperLength > iLength)
//		    {
//		    iOffset = p - pszWord_io;
//		    pszWord_io = reallocMemory(pszWord_io,
//					       strlen(pszWord_io) + 1 +
//						       iUpperLength - iLength);
//		    p = pszWord_io + iOffset;
//		    }
//		if (iUpperLength != iLength)
//		    memmove(p + iUpperLength,
//			    p + iLength,
//			    strlen(p + iLength) + 1);
//		memcpy(p, pszUpper, iUpperLength);
//		break;
//		}
//	    if (matchUppercaseChar((unsigned char *)p, pTextCtl_in) != 0)
//		break;
//	    iLength = matchAlphaChar((unsigned char *)p, pTextCtl_in);
//	    if (iLength == 0)
//		iLength = 1;
//	    }
//	break;
//
//    case ALLCAP:
	/*
	 *  capitalize every character which makes sense to `capitalize'
	 */
//	for ( p = pszWord_io ; *p ; p += iLength )
//	    {
//	    p = skip_over(p, pSkipOver_in);
//	    if (*p == NUL)
//		break;
//	    iLength = matchLowercaseChar((unsigned char *)p, pTextCtl_in);
//	    if (iLength != 0)
//		{
//		pszUpper = convLowerToUpper((unsigned char *)p, pTextCtl_in);
//		iUpperLength = strlen((char *)pszUpper);
//		if (iUpperLength > iLength)
//		    {
//		    iOffset = p - pszWord_io;
//		    pszWord_io = reallocMemory(pszWord_io,
//					       strlen(pszWord_io) + 1 +
//						       iUpperLength - iLength);
//		    p = pszWord_io + iOffset;
//		    }
//		if (iUpperLength != iLength)
//		    memmove(p + iUpperLength,
//			    p + iLength,
//			    strlen(p + iLength) + 1);
//		memcpy(p, pszUpper, iUpperLength);
//		}
//	    else
//		{
//		iLength = matchAlphaChar((unsigned char *)p, pTextCtl_in);
//		if (iLength == 0)
//		    iLength = 1;
//		}
//	    }
//	break;
//
//  case NOCAP:
	/*
	 *  no capitalization wanted, so nothing to do
	 */
//	break;

//    default:
	/*
	 *  Bitfield, recap as indicated
	 *  For each char, if lowercase and its bitfield says cap, recap it
	 */
//	bitmask = 4;
//	for ( p = pszWord_io ; *p ; p += iLength )
//	    {
//	    p = skip_over(p, pSkipOver_in);
//	    if (*p == NUL)
//		break;
//	    iLength = matchLowercaseChar((unsigned char *)p, pTextCtl_in);
//	    if (iLength != 0)
//		{
//		if (iRecap_in & bitmask)
//		    {
//		    pszUpper = convLowerToUpper((unsigned char *)p,
//						pTextCtl_in);
//		    iUpperLength = strlen((char *)pszUpper);
//		    if (iUpperLength > iLength)
//			{
//			iOffset = p - pszWord_io;
//			pszWord_io = reallocMemory(pszWord_io,
//						   strlen(pszWord_io) + 1 +
//						       iUpperLength - iLength);
//			p = pszWord_io + iOffset;
//			}
//		    if (iUpperLength != iLength)
//			memmove(p + iUpperLength,
//				p + iLength,
//				strlen(p + iLength) + 1);
//		    memcpy(p, pszUpper, iUpperLength);
//		    }
//		}
//	    else
//		{
//		iLength = matchAlphaChar((unsigned char *)p, pTextCtl_in);
//		if (iLength == 0)
//		    iLength = 1;
//		}
//	    bitmask <<= 1;			/* Shift bitmask up */
//	    }
//	break;
//    }
//return pszWord_io;
//}

/*****************************************************************************
 * NAME
 *    fixSynthesizedWord
 * DESCRIPTION
 *    Apply the output orthography changes and recapitalization to the list
 *    of synthesized wordforms.  Modify the list to reflect these changes.
 * RETURN VALUE
 *    none
 */
//void fixSynthesizedWord(pTemplate_in, pTextCtl_in, pSkipOver_in)
//WordTemplate *		pTemplate_in;
//const TextControl *	pTextCtl_in;
//const StringList *	pSkipOver_in;
//{
//StringList *	pWord;
//char *		p;

//if ((pTemplate_in == NULL) || (pTemplate_in->pNewWords == NULL))
//    return;

//if (pTextCtl_in == NULL)
//    pTextCtl_in = &default_textout_control;
/*
 *  apply orthography changes to the word and recapitalize it
 */
//for ( pWord = pTemplate_in->pNewWords ; pWord ; pWord = pWord->pNext )
//    {
    /*
     *  apply output orthography changes and recapitalize
     */
//   p = applyChanges(pWord->pszString, pTextCtl_in->pOutputChanges );
//    p = recapitalizeWord( p, pTemplate_in->iCapital, pTextCtl_in,
//			  pSkipOver_in);
    /*
     *  store the modified wordform
     */
//    freeMemory(pWord->pszString);
//    pWord->pszString = p;
//    }
/*
 *  eliminate identical results
 */
//pTemplate_in->pNewWords = squeezeStringList( pTemplate_in->pNewWords );
//}

/*************************************************************************
 * NAME
 *    writeTextFromTemplateToBuffer
 * DESCRIPTION
 *    Write the contents of a word_template structure to an output buffer
 *    restoring all the formatting information associated with the word.
 *    Either multiple output possibilities exist as a strlist in the
 *    new_words field, or a single "failed" possibility exists as a
 *    string in the word field.
 * RETURN VALUE
 *    none
 */
void writeTextFromTemplateToBuffer(pTemplate_in, pTextCtl_in, pszBuffer_out, uiBufferSize_in, iAnalysesCount_in)
const	WordTemplate *pTemplate_in;
const	TextControl  *pTextCtl_in;
char	*pszBuffer_out;
size_t   uiBufferSize_in;  /* this doesn't count space for NUL*/
int      iAnalysesCount_in;

{
static char	szAmbig_s[2] = { '\0', '\0' };
char	tempbuff[4096];
char	*pszFailure;
char	*pszAResult;
int		iSize;
int 	iRoom;

/*
 *  adjust pointers and counters for less redundant skipping
 */
iSize      = (int)strlen(pszBuffer_out);
pszAResult = pszBuffer_out + iSize;
iRoom      = (int)uiBufferSize_in - iSize;
 
if (pTextCtl_in == NULL)
    pTextCtl_in = &default_textout_control;
/*
 *  write the leading format information
 */
if (pTemplate_in->pszFormat)
    fwConCatWrap(pTemplate_in->pszFormat, iAnalysesCount_in, &iRoom, pszAResult);
/*
 *  check for normal, possibly ambiguous output (stored as strlist)
 */
if (pTemplate_in->pNewWords)
    {
    /*
     *  write the word to the file
     */
    if (pTemplate_in->pNewWords->pNext)		/* if ambiguous synthesis */
	{
	sprintf(tempbuff, "%c%u%c",
		pTextCtl_in->cTextAmbig,
		getStringListSize(pTemplate_in->pNewWords),
		pTextCtl_in->cTextAmbig );
	szAmbig_s[0] = pTextCtl_in->cTextAmbig;
	fwConCatWrap(tempbuff, iAnalysesCount_in, &iRoom, pszAResult);
	writeStringListToABuffer(pTemplate_in->pNewWords, szAmbig_s,
		iAnalysesCount_in, &iRoom, pszAResult);
	sprintf(tempbuff, "%c", pTextCtl_in->cTextAmbig);
	fwConCatWrap(tempbuff, iAnalysesCount_in, &iRoom, pszAResult);
	}
    else
//	fputs(pTemplate_in->pNewWords->pszString, pOutputFP_in);
	fwConCatWrap(pTemplate_in->pNewWords->pszString, iAnalysesCount_in, &iRoom, pszAResult);
    }
/*
 *  no "valid" output, so try some "invalid" output
 */
else if (pTemplate_in->pszOrigWord && *(pTemplate_in->pszOrigWord))
    {
    /* try the original word */
    if (pTextCtl_in->cTextAmbig != NUL)
	sprintf(tempbuff, "%c0%c",
		pTextCtl_in->cTextAmbig, pTextCtl_in->cTextAmbig);
	fwConCatWrap(tempbuff, iAnalysesCount_in, &iRoom, pszAResult);
    /*
     *  older ANA files didn't have original capitalized forms
     *  recapping shouldn't have any effect if already capitalized
     */
    pszFailure = duplicateString(pTemplate_in->pszOrigWord);
    pszFailure = recapitalizeWord( pszFailure, pTemplate_in->iCapital,
				   pTextCtl_in, NULL);
//  fputs(pszFailure, pOutputFP_in);
	fwConCatWrap(pszFailure, iAnalysesCount_in, &iRoom, pszAResult);

    freeMemory(pszFailure);
    if (pTextCtl_in->cTextAmbig != NUL)
	{
//	fputc(pTextCtl_in->cTextAmbig, pOutputFP_in);
	// Need to put a nul at the end of the string
		tempbuff[0] = pTextCtl_in->cTextAmbig;
		tempbuff[1] = NUL;
		fwConCatWrap(tempbuff, iAnalysesCount_in, &iRoom, pszAResult);
	}
    }
/*
 *  now write the trailing nonalphabetics to the output file
 */
if (pTemplate_in->pszNonAlpha)
    //fputs(pTemplate_in->pszNonAlpha,pOutputFP_in);
	fwConCatWrap(pTemplate_in->pszNonAlpha, iAnalysesCount_in, &iRoom, pszAResult);
else if ((pTemplate_in->pNewWords != NULL) ||
		 (pTemplate_in->pszOrigWord && pTemplate_in->pszOrigWord[0]))
		//putc(' ', pOutputFP_in);	/* if word exists, default to a single space */
		fwConCatWrap(" ", iAnalysesCount_in, &iRoom, pszAResult);
}

/***************************************************************************
 * NAME
 *    writeStringListToABuffer
 * DESCRIPTION
 *    Write the members of the list to an output buffer, separating them by the
 *    indicated string.
 * RETURN VALUE
 *    None
 */
void writeStringListToABuffer(StringList *pList_in, char *pszSep_in,
				int iAnalysesCount_in, int *iRoom, char *pszAResult)
// const StringList *	pList_in;	/* pointer to head of strlist */
// const char *		pszSep_in;	/* pointer to string used to separate
//					   the elements */
{
const StringList *	sp;
/*
 *  move along the list, writing the strings to the output file
 */
for ( sp = pList_in ; sp ; sp = sp->pNext )
    {
    if (sp->pszString != NULL)		/* except for NULL strings, */
//	fputs(sp->pszString, outfp);	/*     print the string */
	fwConCatWrap(sp->pszString, iAnalysesCount_in, iRoom, pszAResult);
    if (sp->pNext)			/* except for the last element, */
//	fputs(pszSep_in, outfp);	/*     print separating string */
	fwConCatWrap(pszSep_in, iAnalysesCount_in, iRoom, pszAResult);
    }
}

/***************************************************************************
 *	EDIT HISTORY
 *	30-OCT-82	D. Weber/Bob Kasper
 *	13-MAR-85	hab/djw
 *	 7-APR-85	djw
 *	12-Nov-85	SRMc
 *	 3-JUN-86	hab
 *	 4-Apr-88	hab - cleanup after lint
 *	15-Apr-88	hab - do not do orthochange for words not
 *                              originally analyzed
 *      15-May-89       SRMc - rewrite for STAMP to eliminate global extern's
 *                           - write init_txtout()
 *      13-Jul-89       hab  - de-"lint" the source
 * 1.0f 10-Jan-90 ALB Add capability to recap from bitfield
 * 1.1b 29-Jun-90 BK/ALB Fix for portability to MAC, add string.h
 * 1.1f 02-Aug-90 hab Add lower-upper word formation character handling
 *                    De-lint the source
 * 28-Dec-90	SRMc - BUG!! don't output anything for trailing
 *			nonalphabetics unless there was something
 *			in the orig_word field
 *  5-Jun-92	SRMc - fix for putting in the OPAC function library
 *		     - use text_control struct
 *		     - replace init_txtout() with load_outx_ctl_file()
 *  8-Jun-92	SRMc - fix recapitalize() to go with revised
 *			decapitalize() in textin.c
 *  7-Aug-92	SRMc - allow direct output from ->word or ->orig_word
 *			field without failure (ambiguity) marking if
 *			->ambig_char is NUL
 * 14-Aug-92	SRMc - fix bug in recapitalize() for arbitrary
 *			capitalization patterns
 *  4-Sep-92	SRMc - use newly written report_error()
 *  4-Feb-93	SRMc - apply changes even when writing wp->word
 *		     - fix buggy check for existence of word
 * 22-Feb-93	SRMc - rename recapitalize() to textout_recapitalize(),
 *			and make it globally visible
 * 26-May-93	SRMc - split load_outx_ctl_file() into another file
 * 27-May-93	SRMc - allow apply_cc() to return a NULL 
 * 14-Oct-96	SRMc - change #include "opaclib.h" to individual #includes
 *		     - fix for renamed WordTemplate elements
 * 30-Jan-97	SRMc - remove #include <string.h>
 * 26-Feb-97	SRMc - add fixSynthesizedWord()
 * 27-May-97	SRMc - fix some comments
 * 13-Nov-97	SRMc - recapitalize original word for failure output
 *		     - write trailing space by default if pNewWords is not
 *			NULL (in addition to testing for pszOrigWord)
 * 14-Jul-98	SRMc - fix for multibyte character handling by the TextControl
 *			data structure and related functions
 *		     - change recapitalizeWord to return a pointer to the
 *			recapitalized word string
 */
