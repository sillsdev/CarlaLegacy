/* LOADOUTX.C - load an output text control file
 ***************************************************************************
 *
 * int loadOutxCtlFile(pszFilename_in, cComment_in, pTextCtl_out,
 *							ppStringClasses_io)
 * const char *		pszFilename_in;
 * int			cComment_in;
 * TextControl *	pTextCtl_out;
 * StringClass **	ppStringClasses_io;
 *
 ***************************************************************************
 * edit history is at the end of the file and at the end of TEXTOUT.C
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
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
extern size_t strlen  P((const char * s));
#endif /* STDC_HEADERS */

#include "allocmem.h"
#include "record.h"
#include "rpterror.h"
#include "strclass.h"
#include "textctl.h"

#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif
#ifndef NUL
#define NUL '\0'
#endif

#ifdef __STDC__
static void set_outx(char * recp, TextControl * textout_ctl,
			 StringClass ** ppStringClasses_io);
#endif

/*****************************************************************************
 * NAME
 *    set_outx
 * ARGUMENTS
 *    recp - pointer to input record loaded by set_record(), or NULL
 * DESCRIPTION
 *    Set the control variables specific to the text output control file.
 * RETURN VALUE
 *    none
 */
static void set_outx( recp, textout_ctl, ppStringClasses_io)
char *		recp;
TextControl *	textout_ctl;
StringClass **	ppStringClasses_io;
{
register char *rp;
char *nextp;
char code;
Change *last, *chp;
int	seen_dsc = 0;
int	seen_format = 0;
static char errhead[] = "SETUP TEXT: ";
unsigned char	szTemp[8];
UpperLetter *	pUL;
CaselessLetter *pCL;

last = (Change *)NULL;
for ( rp = recp ; (rp != (char *)NULL) && (*rp != NUL) ; rp = nextp )
	{
	code = *rp++;
	while (*rp && isascii(*rp) && isspace(*rp))
	++rp;
	nextp = rp + strlen(rp) + 1;	/* point to next entry */
	switch (code)
	{
	case 'C':                       /* change (\ch) */
		if (ppStringClasses_io != NULL)
		chp = parseChangeString(rp, *ppStringClasses_io);
		else
		chp = parseChangeString(rp, NULL);
		if (chp)
		{
		if (last)
			last->pNext = chp;
		else
			textout_ctl->pOutputChanges = chp;
		last = chp;
		}
		break;

	case 'D':		/* morpheme decomposition separation char */
		if (*rp == NUL)
		{
		reportError(WARNING_MSG,
			"%sEmpty decomposition separator field - using '%c'\n",
				 errhead, textout_ctl->cDecomp );
#ifndef _WINDOWS
		fflush(stdout);
#endif
		}
		if (seen_dsc++)
		{
		reportError(WARNING_MSG,
		"%sDecomposition separator already seen - ignoring this one\n",
				 errhead );
#ifndef _WINDOWS
		fflush(stdout);
#endif
		}
		else if (*rp != NUL)
		textout_ctl->cDecomp = *rp;	/* have to have one defined! */
		break;

	case 'F':		/* format character (\format) */
		if (seen_format++)
		{
		reportError(WARNING_MSG,
			   "%sFormat field already seen - ignoring this one\n",
				 errhead );
#ifndef _WINDOWS
		fflush(stdout);
#endif
		}
		else
		textout_ctl->cFormatMark = *rp;	/* NUL => no format markers */
		break;

	case 'G':               /* ambiguity marker (\ambig) */
		if (*rp)
		textout_ctl->cTextAmbig = *rp;
		else
		reportError(ERROR_MSG,
		 "%sInvalid \ambig field - must define an ambiguity marker!\n",
				errhead );
		break;

	case 'A':		/* single byte word formation characters */
		addWordFormationChars(rp, textout_ctl);
		break;

	case 'w':		/* multibyte word formation characters */
		addWordFormationCharStrings(rp, textout_ctl);
		break;

		case 'L':	/* single byte lower-upper word formation characters */
		addLowerUpperWFChars(rp, textout_ctl);
			break;

	case 'l':	/* multibyte lower-upper word formation characters */
		addLowerUpperWFCharStrings(rp, textout_ctl);
		break;

	case 'S':                       /* string class definition (\scl) */
		if (ppStringClasses_io != NULL)
		*ppStringClasses_io = addStringClass(rp, *ppStringClasses_io);
		break;

	}
	}
/*
 *  perform some sanity checks
 */
memset(szTemp, NUL, sizeof(szTemp));
if (textout_ctl->cFormatMark != NUL)
	{
	szTemp[0] = textout_ctl->cFormatMark;
	if (matchAlphaChar(szTemp, textout_ctl) != 0)
	{
	reportError(ERROR_MSG,
			"%sThe format marker '%c' is an alphabetic character.\n",
			errhead, textout_ctl->cFormatMark );
	}
	}
if (textout_ctl->cTextAmbig != NUL)
	{
	szTemp[0] = textout_ctl->cTextAmbig;
	if (matchAlphaChar(szTemp, textout_ctl) != 0)
	{
	reportError(ERROR_MSG,
		   "%sThe ambiguity marker '%c' is an alphabetic character.\n",
			errhead, textout_ctl->cTextAmbig );
	}
	}
if (textout_ctl->cDecomp != NUL)
	{
	szTemp[0] = textout_ctl->cDecomp;
	if (matchAlphaChar(szTemp, textout_ctl) != 0)
	{
	reportError(ERROR_MSG,
		"%sThe decomposition separator '%c' is an alphabetic character.\n",
			errhead, textout_ctl->cDecomp );
	}
	}
for ( pCL = textout_ctl->pCaselessLetters ; pCL ; pCL = pCL->pNext )
	{
	if (matchLowercaseChar(pCL->pszLetter, textout_ctl) != 0)
	{
	reportError(ERROR_MSG,
			"%sCaseless character '%s' cannot also be lowercase!\n",
			errhead, pCL->pszLetter );
	}
	if (matchUppercaseChar(pCL->pszLetter, textout_ctl) != 0)
	{
	reportError(ERROR_MSG,
			"%sCaseless character '%s' cannot also be uppercase!\n",
			errhead, pCL->pszLetter );
	}
	}
for ( pUL = textout_ctl->pUppercaseLetters ; pUL ; pUL = pUL->pNext )
	{
	if (matchLowercaseChar(pUL->pszUpper, textout_ctl) != 0)
	{
	reportError(ERROR_MSG,
			"%sUppercase character '%s' cannot also be lowercase!\n",
			errhead, pUL->pszUpper );
	}
	}
}

/*****************************************************************************
 * NAME
 *    loadOutxCtlFile
 * DESCRIPTION
 *    Load a text output control file into memory.
 * RETURN VALUE
 *    0 if successful, -1 if an error occurs
 */
int loadOutxCtlFile(pszFilename_in, cComment_in, pTextCtl_out,
			ppStringClasses_io)
const char *	pszFilename_in;
int		cComment_in;
TextControl *	pTextCtl_out;
StringClass **	ppStringClasses_io;
{
FILE *pInputFP;
char *rp;
/*
 *  text output control file code table
 */
static CodeTable outx_codes =
	{
	"\
\\ch\0C\0\
\\ambig\0G\0\
\\wfc\0A\0\
\\wfcs\0w\0\
\\luwfc\0L\0\
\\luwfcs\0l\0\
\\scl\0S\0\
\\dsc\0D\0\
\\format\0F\0\
",
	9,
	NULL
	};

if ((pszFilename_in == NULL) || (pTextCtl_out == NULL))
	return -1;

pInputFP = fopen(pszFilename_in, "r");
if (pInputFP == NULL)
	return -1;
if ((rp = readStdFormatRecord(pInputFP,
				  &outx_codes,
				  cComment_in,
				  NULL)) != NULL)
	{
	set_outx(rp, pTextCtl_out, ppStringClasses_io);
	}
cleanupAfterStdFormatRecord();
fclose(pInputFP);
pTextCtl_out->pszTextControlFile = duplicateString( pszFilename_in );
return 0;
}

/***************************************************************************
 * EDIT HISTORY
 * 26-May-93	SRMc - split from TEXTOUT.C
 * 26-May-93	SRMc - handle stupid renaming of functions by MSC 7.00
 * 29-Sep-95	SRMc - remove call to prompt_user()
 *		     - change return value from void to int in order
 *			to indicate success or failure
 * 14-Oct-96	SRMc - change #include "opaclib.h" to individual #includes
 * 18-Oct-96	SRMc - rename function to loadOutxCtlFile
 *		     - add FILE pointer as the first argument
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 24-Feb-97	SRMc - fix for changes to addStringClass()
 * 21-Apr-97	SRMc - make filename parameter const
 *  2-Oct-97	SRMc - fix for revised reportError()
 * 17-Feb-98	SRMc - brought up to date with STAMP
 * 20-Mar-98	SRMc - added \format and \dsc for INTERGEN
 * 14-Jul-98	SRMc - fix for multibyte character handling by the TextControl
 *			data structure and related functions: add the \luwfcs,
 *			\wfc, and \wfcs fields
 * 10-Nov-98	SRMc - add some sanity checks for character definitions
 */
