/* LOADINTX.C - load the input text control file information for textin()
 ***************************************************************************
 *
 * int loadIntxCtlFile(pszFilename_in, cComment_in, pTextCtl_out,
 *							ppStringClasses_io)
 * const char *		pszFilename_in;
 * int			cComment_in;
 * TextControl *	pTextCtl_out;
 * StringClass **	ppStringClasses_io;
 *
 ***************************************************************************
 * Copyright 1982, 1998 by the Summer Institute of Linguistics, Inc.
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
#include <stdlib.h>
#else
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strcat  P((char * dest, const char * src));
extern size_t strlen  P((const char * s));
extern long   strtol  P((const char *nptr, char **endptr, int base));
#endif /* STDC_HEADERS */

#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif

#include "cportlib.h"
#include "allocmem.h"
#include "rpterror.h"
#include "strclass.h"
#include "record.h"
#include "textctl.h"
#include "opaclib.h"	/* for isolateWord() */

#ifndef NUL
#define NUL '\0'
#endif
#ifndef TRUE
#define TRUE 1
#define FALSE 0
#endif

#ifdef __STDC__
static void get_fields(char * cp, StringList ** strlp, int cFormat_in);
static void setup_textin(char * recp, TextControl * textin_ctl,
			 StringClass ** ppStringClasses_io);
#endif

/***************************************************************************
 * NAME
 *    get_fields
 * ARGUMENTS
 *    cp    - pointer to line containing fields
 *    strlp - pointer to head of string list
 * DESCRIPTION
 *    Add each format marker found to the given list.
 * RETURN VALUE
 *    none
 */
static void get_fields(cp, strlp, cFormat_in)
char *		cp;
StringList **	strlp;
int		cFormat_in;
{
char *end;
StringList *slp;

for ( end = isolateWord(cp) ; *cp != NUL ; end = isolateWord(cp) )
	{				/* while there are words on the line */
	if (*cp == cFormat_in)	/* if it is a sfm, allocate strlist struct */
	{
	slp = (StringList *)allocMemory( sizeof(StringList));
	if (slp != (StringList *)NULL)
		{
		slp->pszString = duplicateString( cp );
		slp->pNext = *strlp;
		*strlp = slp;
		}
	}
	cp = end;			/* move to next word on the line */
	}
} /* end get_fields */

/***************************************************************************
 * NAME
 *    setup_textin
 * ARGUMENTS
 *    recp - pointer to record loaded by set_record(), or NULL
 * DESCRIPTION
 *    Set the control variables for text input from the record pointed to by
 *    recp, or if recp is NULL, set the default values.
 * RETURN VALUE
 *    none
 */
static void setup_textin(recp, textin_ctl, ppStringClasses_io)
char *		recp;
TextControl *	textin_ctl;
StringClass **	ppStringClasses_io;
{
char *	rp;		/* internal record pointer */
char *	end;
char	wordform[256];	/* pretend to support 8-bit characters */
char *	ap;		/* alphabetics pointer */
int	k;
int	code;
Change *tail;
Change *cc;
char	bars[256];	/* store barcode characters */
static char errhead[] = "SETUP TEXT: ";
short	seen_ambig;
short	seen_barchar;
short	seen_dsc;
short	seen_format;
unsigned char	szTemp[8];
UpperLetter *	pUL;
CaselessLetter *pCL;
/*
 *  set the default alphabetic characters
 */
for ( ap = wordform, k = 1 ; k < 128 ; ++k )
	{
	if (isalpha(k))
	*ap++ = (char)k;
	}
*ap = '\0';                     /* terminate the list */
/*
 *  more initialization
 */
textin_ctl->pOrthoChanges   = tail = (Change *)NULL;
textin_ctl->pIncludeFields  = textin_ctl->pExcludeFields = (StringList *)NULL;
textin_ctl->uiMaxAmbigDecap = 500;
memset(bars,0,256);
seen_ambig = seen_barchar = seen_dsc = seen_format = 0;
/*
 *  get the information from the record
 */
for ( rp = recp ; (rp != (char *)NULL) && (*rp != NUL) ; )
	{
	code = *rp++;		/* grab the table code */
	while (isascii(*rp) && isspace(*rp))	/* skip following whitespace */
	++rp;
	switch (code)
	{
	case 'A':	/* \wfc - single byte word formation characters */
		end = rp + strlen(rp);
		addWordFormationChars(rp, textin_ctl);
		rp = end;
		break;

	case 'w':	/* \wfcs - multibyte word formation characters */
		end = rp + strlen(rp);
		addWordFormationCharStrings(rp, textin_ctl);
		rp = end;
		break;

	case 'K':	/* \noincap - no internal recapitalization */
		textin_ctl->bIndividualCapitalize = FALSE;
		break;

	case 'L':	/* \luwfc - single byte lower-upper word form chars */
		end = rp + strlen(rp);
		addLowerUpperWFChars(rp, textin_ctl);
		rp = end;
		break;

	case 'l':	/* \luwfcs - multibyte lower-upper word form chars */
		end = rp + strlen(rp);
		addLowerUpperWFCharStrings(rp, textin_ctl);
		rp = end;
		break;

	case 'N':	/* \incl - definition of include field */
		if (*rp == NUL)
		{
		reportError(WARNING_MSG, "%sEmpty include field\n", errhead );
		}
		else if (textin_ctl->pExcludeFields != (StringList *)NULL)
		{
		reportError(WARNING_MSG,
			   "%sIgnoring include field following an exclude field\n",
				 errhead );
		}
		else
		{
		end = rp + strlen(rp);
		get_fields(rp, &textin_ctl->pIncludeFields,
			   textin_ctl->cFormatMark);
		rp = end;
		}
		break;

	case 'X':	/* \excl - definition of exclude field */
		if (*rp == NUL)
		{
		reportError(WARNING_MSG, "%sEmpty exclude field\n", errhead );
		}
		else if (textin_ctl->pIncludeFields != (StringList *)NULL)
		{
		reportError(WARNING_MSG,
			   "%sIgnoring exclude field following an include field\n",
				 errhead );
		}
		else
		{
		end = rp + strlen(rp);
		get_fields(rp, &textin_ctl->pExcludeFields,
			   textin_ctl->cFormatMark);
		rp = end;
		}
		break;

	case 'C':	/* \ch - orthography change */
		end = rp + strlen(rp);
		if (ppStringClasses_io != NULL)
		cc = parseChangeString(rp, *ppStringClasses_io);
		else
		cc = parseChangeString(rp, NULL);
		if (cc != (Change *)NULL)
		{               /* link change to end of list */
		if (textin_ctl->pOrthoChanges == (Change *)NULL)
			textin_ctl->pOrthoChanges = cc;
		else
			tail->pNext = cc;
		tail = cc;
		}
		rp = end;
		break;

	case 'S':	/* \scl - string class definition */
		end = rp + strlen(rp);
		if (ppStringClasses_io != NULL)
		*ppStringClasses_io = addStringClass(rp, *ppStringClasses_io);
		rp = end;
		break;

	case 'a':	/* \format - format character */
		if (seen_format++)
		{
		reportError(WARNING_MSG,
			   "%sFormat field already seen - ignoring this one\n",
				 errhead );
		}
		else
		textin_ctl->cFormatMark = *rp;	/* NUL => no format markers */
		break;

	case 'b':	/* \barchar - bar character */
		if (seen_barchar++)
		{
		reportError(WARNING_MSG,
			"%sBar character field already seen - ignoring this one\n",
				 errhead );
		}
		else
		textin_ctl->cBarMark = *rp;  /* NUL => no bar code formatting */
		break;

	case 'c':	/* \barcodes - bar codes */
		if (*rp == NUL)
		{
		reportError(WARNING_MSG,
				"%sEmpty bar codes field\n", errhead );
		}
		else
		{
		while (*rp != NUL)
			{
			end = isolateWord(rp);
			strcat(bars,rp);	/* keep adding characters */
			rp = end;
			}
		}
		break;

	case 'd':	/* \ambig - ambiguity marker character */
		if (*rp == NUL)
		{
		reportError(WARNING_MSG,
				 "%sEmpty ambiguity marker field - using '%c'\n",
				 errhead, textin_ctl->cAnaAmbig );
		}
		if (seen_ambig++)
		{
		reportError(WARNING_MSG,
			   "%sAmbiguity marker already seen - ignoring this one\n",
				 errhead );
		}
		else if (*rp != NUL)
		textin_ctl->cAnaAmbig = *rp;	/* have to have one defined! */
		break;

	case 'e':	/* \dsc - morpheme decomposition separation char */
		if (*rp == NUL)
		{
		reportError(WARNING_MSG,
			"%sEmpty decomposition separator field - using '%c'\n",
				 errhead, textin_ctl->cDecomp );
		}
		if (seen_dsc++)
		{
		reportError(WARNING_MSG,
		"%sDecomposition separator already seen - ignoring this one\n",
				 errhead );
		}
		else if (*rp != NUL)
		textin_ctl->cDecomp = *rp;	/* have to have one defined! */
		break;

	case 'f':	/* \nocap - do no capitalization processing */
		textin_ctl->bCapitalize = FALSE;
		break;

	case 'm':	/* \maxdecap - maximum decapitalization ambiguities */
		textin_ctl->uiMaxAmbigDecap = (unsigned)strtol(rp, NULL, 10);
		break;

	} /* end switch */
	while (*rp++ != NUL)	/* skip rest of this entry in the record */
	;
	} /* end for */
/*
 *  set the bar codes if any were specified
 */
if (bars[0] != NUL)
	textin_ctl->pszBarCodes = (unsigned char *)duplicateString(bars);
/*
 *  perform some sanity checks
 */
memset(szTemp, NUL, sizeof(szTemp));
if (textin_ctl->cFormatMark != NUL)
	{
	szTemp[0] = textin_ctl->cFormatMark;
	if (matchAlphaChar(szTemp, textin_ctl) != 0)
	{
	reportError(ERROR_MSG,
			"%sThe format marker '%c' is an alphabetic character.\n",
			errhead, textin_ctl->cFormatMark );
	}
	}
if (textin_ctl->cBarMark != NUL)
	{
	szTemp[0] = textin_ctl->cBarMark;
	if (matchAlphaChar(szTemp, textin_ctl) != 0)
	{
	reportError(ERROR_MSG,
		  "%sThe \"bar character\" '%c' is an alphabetic character.\n",
			errhead, textin_ctl->cBarMark );
	}
	}
if (textin_ctl->cAnaAmbig != NUL)
	{
	szTemp[0] = textin_ctl->cAnaAmbig;
	if (matchAlphaChar(szTemp, textin_ctl) != 0)
	{
	reportError(ERROR_MSG,
		   "%sThe ambiguity marker '%c' is an alphabetic character.\n",
			errhead, textin_ctl->cAnaAmbig );
	}
	}
if (textin_ctl->cDecomp != NUL)
	{
	szTemp[0] = textin_ctl->cDecomp;
	if (matchAlphaChar(szTemp, textin_ctl) != 0)
	{
	reportError(ERROR_MSG,
		"%sThe decomposition separator '%c' is an alphabetic character.\n",
			errhead, textin_ctl->cDecomp );
	}
	}
#ifndef hab338
if (textin_ctl->bCapitalize)
  {
#endif /* hab338 */
for ( pCL = textin_ctl->pCaselessLetters ; pCL ; pCL = pCL->pNext )
	{
	if (matchLowercaseChar(pCL->pszLetter, textin_ctl) != 0)
	{
	reportError(ERROR_MSG,
			"%sCaseless character '%s' cannot also be lowercase!\n",
			errhead, pCL->pszLetter );
	}
	if (matchUppercaseChar(pCL->pszLetter, textin_ctl) != 0)
	{
	reportError(ERROR_MSG,
			"%sCaseless character '%s' cannot also be uppercase!\n",
			errhead, pCL->pszLetter );
	}
	}
for ( pUL = textin_ctl->pUppercaseLetters ; pUL ; pUL = pUL->pNext )
	{
	if (matchLowercaseChar(pUL->pszUpper, textin_ctl) != 0)
	{
	reportError(ERROR_MSG,
			"%sUppercase character '%s' cannot also be lowercase!\n",
			errhead, pUL->pszUpper );
	}
	}
#ifndef hab338
  }
#endif /* hab338 */
}

/*****************************************************************************
 * NAME
 *    loadIntxCtlFile
 * DESCRIPTION
 *    Load a text input control file into memory.
 * RETURN VALUE
 *    0 if successful, -1 if an error occurs
 */
int loadIntxCtlFile(pszFilename_in, cComment_in, pTextCtl_out,
			ppStringClasses_io)
const char *	pszFilename_in;
int		cComment_in;
TextControl *	pTextCtl_out;
StringClass **	ppStringClasses_io;
{
FILE *		pInputFP;
char *		rp;
/*
 *  text input control code table
 */
static CodeTable text_codes =
	{
	"\
\\wfc\0A\0\
\\luwfc\0L\0\
\\wfcs\0w\0\
\\luwfcs\0l\0\
\\noincap\0K\0\
\\incl\0N\0\
\\excl\0X\0\
\\ch\0C\0\
\\scl\0S\0\
\\format\0a\0\
\\barchar\0b\0\
\\barcodes\0c\0\
\\ambig\0d\0\
\\dsc\0e\0\
\\nocap\0f\0\
\\maxdecap\0m\0\
",
	16,
	NULL
	};

if ((pszFilename_in == NULL) || (pTextCtl_out == NULL))
	return -1;
pInputFP = fopen(pszFilename_in, "r");
if (pInputFP == NULL)
	return -1;
if ((rp = readStdFormatRecord(pInputFP,
				  &text_codes,
				  cComment_in,
				  NULL)) != NULL)
	{			/* set values for wfc, scl, incl_stdfmt, etc. */
	setup_textin(rp, pTextCtl_out, ppStringClasses_io);
	}
cleanupAfterStdFormatRecord();
fclose(pInputFP);
pTextCtl_out->pszTextControlFile = duplicateString( pszFilename_in );
return 0;
}

/***************************************************************************
 * EDIT HISTORY
 * 26-May-93	SRMc - split from TEXTIN.C
 * 26-May-93	SRMc - handle stupid renaming of functions by MSC 7.00
 * 29-Sep-95	SRMc - remove call to prompt_user()
 *		     - change return value from void to int in order
 *			to indicate success or failure
 * 14-Oct-96	SRMc - change #include "opaclib.h" to individual #includes
 * 31-Jan-97	SRMc - fix for STDC_HEADERS
 * 24-Feb-97	SRMc - fix for changes to addStringClass()
 * 28-Feb-97	SRMc - use defined format character instead of '\\' in
 *			get_fields()
 * 21-Apr-97	SRMc - make safe for Microsoft Windows
 *		     - make filename parameter const
 * 14-Jul-98	SRMc - fix for multibyte character handling by the TextControl
 *			data structure and related functions: add the \luwfcs
 *			and \wfcs fields
 * 10-Nov-98	SRMc - add some sanity checks for character definitions
 */
