/*  MYCTYPE.C - extend <ctype.h> functions to 8-bit alphabetic characters
 ***************************************************************************
 *
 * int matchAlphaChar(const unsigned char * pszString_in,
 *                    const TextControl *   pTextCtl_in)
 * int matchLowercaseChar(const unsigned char * pszString_in,
 *                        const TextControl *   pTextCtl_in)
 * int matchUppercaseChar(const unsigned char * pszString_in,
 *                        const TextControl *   pTextCtl_in)
 * int matchCaselessChar(const unsigned char * pszString_in,
 *                       const TextControl *   pTextCtl_in)
 * const unsigned char * convLowerToUpper(const unsigned char * pszString_in,
 *					  const TextControl *   pTextCtl_in)
 * const unsigned char * convUpperToLower(const unsigned char * pszString_in,
 *					  const TextControl *   pTextCtl_in)
 * const StringList * convLowerToUpperSet(const unsigned char * pszString_in,
 *					  const TextControl *   pTextCtl_in)
 * const StringList * convUpperToLowerSet(const unsigned char * pszString_in,
 *					  const TextControl *   pTextCtl_in)
 * void addLowerUpperWFChars(       char * rp, TextControl * pTextCtl)
 * void addLowerUpperWFCharStrings( char * rp, TextControl * pTextCtl)
 * void addWordFormationChars(      char * rp, TextControl * pTextCtl)
 * void addWordFormationCharStrings(char * rp, TextControl * pTextCtl)
 * void writeWordFormationChars(FILE * fp,  const TextControl * pTextCtl)
 * void resetWordFormationChars(TextControl * pTextCtl)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1990, 1998 by the Summer Institute of Linguistics, Inc.
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
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strcpy  P((char * dest, const char * src));
extern char * strchr  P((const char * s, int c));
extern size_t strlen  P((const char * s));
#endif /* STDC_HEADERS */

#include "cportlib.h"
#include "textctl.h"
#include "allocmem.h"
#include "rpterror.h"
extern unsigned char * tokenizeString P((unsigned char *       pszString_in,
					const unsigned char * pszSeparate_in));
extern int matchBeginning P((const char * pszString_in,
				 const char * pszBegin_in));

/* local functions */
static void write_8bit_char P((int ch , FILE *fp));
static void write_8bit_string P((char * pszString_in, FILE * outfp));
static size_t width_8bit_char P((int ch));
static size_t width_8bit_string P((char * pszString_in));
static void write_upper P((LowerLetter * pLowStart_in,
			   LowerLetter * pLowEnd_in,
			   StringList *  pUpStart_in,
			   StringList *  pUpEnd_in,
			   FILE *        outfp));

/****************************************************************************
 *  data used for lower-upper case lists
 */
static unsigned char szWhitespace_m[] = " \t\n\r\f\v";

/***************************************************************************
 * NAME
 *    matchAlphaChar
 * DESCRIPTION
 *    Check whether the string begins with an alphabetic character.
 * RETURN VALUE
 *    the number of bytes occupied by the first alphabetic character in the
 *    string (zero if the first character in the string is not alphabetic)
 */
int matchAlphaChar(pszString_in, pTextCtl_in )
const unsigned char *	pszString_in;
const TextControl *	pTextCtl_in;
{
char		c;
int		iLetterLength;

if ((pszString_in == NULL) || (*pszString_in == NUL))
	return 0;

c = *pszString_in;
if (pTextCtl_in == NULL)
	return (isascii(c) && isalpha(c)) ? 1 : 0;

#ifndef CheckCaselessLast
iLetterLength = matchCaselessChar(pszString_in, pTextCtl_in);
if (iLetterLength != 0)
	return iLetterLength;
#endif /* CheckCaselessLast */

iLetterLength = matchLowercaseChar(pszString_in, pTextCtl_in);
if (iLetterLength != 0)
	return iLetterLength;

iLetterLength = matchUppercaseChar(pszString_in, pTextCtl_in);
if (iLetterLength != 0)
	return iLetterLength;

#ifdef CheckCaselessLast
iLetterLength = matchCaselessChar(pszString_in, pTextCtl_in);
if (iLetterLength != 0)
	return iLetterLength;
#endif /* CheckCaselessLast */

return 0;
}

/*****************************************************************************
 * NAME
 *    matchLowercaseChar
 * DESCRIPTION
 *    Check whether the string begins with a lowercase alphabetic character.
 * RETURN VALUE
 *    the number of bytes occupied by the first lowercase alphabetic character
 *    in the string (zero if the first character in the string is not
 *    lowercase alphabetic)
 */
int matchLowercaseChar(pszString_in, pTextCtl_in)
const unsigned char *	pszString_in;
const TextControl *	pTextCtl_in;
{
char		c;
LowerLetter *	pLower;
/*
 *  check for valid input
 */
if ((pszString_in == NULL) || (*pszString_in == NUL))
	return 0;
if (pTextCtl_in != NULL)
	{
	/*
	 *  search the list of user defined multibyte lowercase characters
	 */
	for (   pLower = pTextCtl_in->pLowercaseLetters ;
		pLower ;
		pLower = pLower->pNext )
	{
	if (matchBeginning((char *)pszString_in, (char *)pLower->pszLower))
		return strlen((char *)pLower->pszLower);
	}
	}
/*
 *  check for a standard ASCII lowercase character
 */
c = *pszString_in;
return (isascii(c) && islower(c)) ? 1 : 0;
}

/*****************************************************************************
 * NAME
 *    matchUppercaseChar
 * DESCRIPTION
 *    Check whether the string begins with an uppercase alphabetic character.
 * RETURN VALUE
 *    the number of bytes occupied by the first uppercase alphabetic character
 *    in the string (zero if the first character in the string is not
 *    uppercase alphabetic)
 */
int matchUppercaseChar(pszString_in, pTextCtl_in)
const unsigned char *	pszString_in;
const TextControl *	pTextCtl_in;
{
char		c;
UpperLetter *	pUpper;
/*
 *  check for valid input
 */
if ((pszString_in == NULL) || (*pszString_in == NUL))
	return 0;
if (pTextCtl_in != NULL)
	{
	/*
	 *  search the list of user defined multibyte uppercase characters
	 */
	for (   pUpper = pTextCtl_in->pUppercaseLetters ;
		pUpper ;
		pUpper = pUpper->pNext )
	{
	if (matchBeginning((char *)pszString_in, (char *)pUpper->pszUpper))
		return strlen((char *)pUpper->pszUpper);
	}
	}
/*
 *  check for a standard ASCII uppercase character
 */
c = *pszString_in;
return (isascii(c) && isupper(c)) ? 1 : 0;
}

/*****************************************************************************
 * NAME
 *    matchCaselessChar
 * DESCRIPTION
 *    Check whether the string begins with a caseless alphabetic character.
 * RETURN VALUE
 *    the number of bytes occupied by the first caseless alphabetic character
 *    in the string (zero if the first character in the string is not
 *    caseless alphabetic)
 */
int matchCaselessChar(pszString_in, pTextCtl_in)
const unsigned char *	pszString_in;
const TextControl *	pTextCtl_in;
{
CaselessLetter * pLet;
/*
 *  check for valid input
 */
if ((pszString_in == NULL) || (*pszString_in == NUL))
	return 0;
if (pTextCtl_in == NULL)
	return 0;
/*
 *  search the list of user defined multibyte caseless characters
 */
for (	pLet = pTextCtl_in->pCaselessLetters ;
	pLet ;
	pLet = pLet->pNext )
	{
	if (matchBeginning((char *)pszString_in, (char *)pLet->pszLetter))
	return strlen((char *)pLet->pszLetter);
	}
return 0;
}

/*****************************************************************************
 * NAME
 *    convLowerToUpper
 * DESCRIPTION
 *    if the string starts with a lowercase multibyte character, get the
 *    (first) uppercase multibyte equivalent
 * RETURN VALUE
 *    pointer to an uppercase multibyte character string, or NULL if the input
 *    string did not begin with a lowercase multibyte character
 */
const unsigned char * convLowerToUpper(pszString_in, pTextCtl_in)
const unsigned char * pszString_in;
const TextControl *   pTextCtl_in;
{
char			c;
LowerLetter *		pLower;
static unsigned char	szUpper_s[2];
/*
 *  check for valid input
 */
if ((pszString_in == NULL) || (*pszString_in == NUL))
	return NULL;
if (pTextCtl_in != NULL)
	{
	/*
	 *  search the list of user defined multibyte lowercase characters
	 */
	for (   pLower = pTextCtl_in->pLowercaseLetters ;
		pLower ;
		pLower = pLower->pNext )
	{
	if (matchBeginning((char *)pszString_in, (char *)pLower->pszLower))
		return (unsigned char *)pLower->pUpperList->pszString;
	}
	}
/*
 *  check for a standard ASCII lowercase character
 */
c = *pszString_in;
if (isascii(c) && islower(c))
	{
	szUpper_s[0] = toupper(c);
	szUpper_s[1] = NUL;
	return szUpper_s;
	}
return NULL;
}

/*****************************************************************************
 * NAME
 *    convUpperToLower
 * DESCRIPTION
 *    if the string starts with an uppercase multibyte character, get the
 *    (first) lowercase multibyte equivalent
 * RETURN VALUE
 *    pointer to a lowercase multibyte character string, or NULL if the input
 *    string did not begin with an uppercase multibyte character
 */
const unsigned char * convUpperToLower(pszString_in, pTextCtl_in)
const unsigned char * pszString_in;
const TextControl *   pTextCtl_in;
{
char			c;
UpperLetter *		pUpper;
static unsigned char	szLower_s[2];
/*
 *  check for valid input
 */
if ((pszString_in == NULL) || (*pszString_in == NUL))
	return NULL;
if (pTextCtl_in != NULL)
	{
	/*
	 *  search the list of user defined multibyte uppercase characters
	 */
	for (   pUpper = pTextCtl_in->pUppercaseLetters ;
		pUpper ;
		pUpper = pUpper->pNext )
	{
	if (matchBeginning((char *)pszString_in, (char *)pUpper->pszUpper))
		return (unsigned char *)pUpper->pLowerList->pszString;
	}
	}
/*
 *  check for a standard ASCII uppercase character
 */
c = *pszString_in;
if (isascii(c) && isupper(c))
	{
	szLower_s[0] = tolower(c);
	szLower_s[1] = NUL;
	return szLower_s;
	}
return NULL;
}

/*****************************************************************************
 * NAME
 *    convLowerToUpperSet
 * DESCRIPTION
 *    if the string starts with a lowercase multibyte character, get the
 *    complete set of equivalent uppercase multibyte characters
 * RETURN VALUE
 *    pointer to a list of uppercase multibyte character strings, or NULL if
 *    the input string did not begin with a lowercase multibyte character
 */
const StringList * convLowerToUpperSet(pszString_in, pTextCtl_in)
const unsigned char * pszString_in;
const TextControl *   pTextCtl_in;
{
char			c;
LowerLetter *		pLower;
static char		szUpper_s[2];
static StringList	sUpperList_s = { szUpper_s, NULL };
/*
 *  check for valid input
 */
if ((pszString_in == NULL) || (*pszString_in == NUL))
	return NULL;
if (pTextCtl_in != NULL)
	{
	/*
	 *  search the list of user defined multibyte lowercase characters
	 */
	for (   pLower = pTextCtl_in->pLowercaseLetters ;
		pLower ;
		pLower = pLower->pNext )
	{
	if (matchBeginning((char *)pszString_in, (char *)pLower->pszLower))
		{
		if (strlen((char *)pLower->pszLower) == 1)
		{
		/*
		 *  check for a standard ASCII lowercase character
		 */
		c = *pszString_in;
		if (isascii(c) && islower(c))
			{
			szUpper_s[0] = toupper(c);
			szUpper_s[1] = NUL;
			if (!isMemberOfStringList(pLower->pUpperList, szUpper_s))
			{
			sUpperList_s.pNext = pLower->pUpperList;
			return &sUpperList_s;
			}
			}
		}
		return pLower->pUpperList;
		}
	}
	}
/*
 *  check for a standard ASCII lowercase character
 */
c = *pszString_in;
if (isascii(c) && islower(c))
	{
	szUpper_s[0] = toupper(c);
	szUpper_s[1] = NUL;
	sUpperList_s.pNext = NULL;
	return &sUpperList_s;
	}
return NULL;
}

/*****************************************************************************
 * NAME
 *    convUpperToLowerSet
 * DESCRIPTION
 *    if the string starts with an uppercase multibyte character, get the
 *    complete set of equivalent lowercase multibyte characters
 * RETURN VALUE
 *    pointer to a list of lowercase multibyte character strings, or NULL if
 *    the input string did not begin with an uppercase multibyte character
 */
const StringList * convUpperToLowerSet(pszString_in, pTextCtl_in)
const unsigned char * pszString_in;
const TextControl *   pTextCtl_in;
{
char			c;
UpperLetter *		pUpper;
static char		szLower_s[2];
static StringList	sLowerList_s = { szLower_s, NULL };
/*
 *  check for valid input
 */
if ((pszString_in == NULL) || (*pszString_in == NUL))
	return NULL;
if (pTextCtl_in != NULL)
	{
	/*
	 *  search the list of user defined multibyte uppercase characters
	 */
	for (   pUpper = pTextCtl_in->pUppercaseLetters ;
		pUpper ;
		pUpper = pUpper->pNext )
	{
	if (matchBeginning((char *)pszString_in, (char *)pUpper->pszUpper))
		{
		if (strlen((char *)pUpper->pszUpper) == 1)
		{
		/*
		 *  check for a standard ASCII uppercase character
		 */
		c = *pszString_in;
		if (isascii(c) && isupper(c))
			{
			szLower_s[0] = tolower(c);
			szLower_s[1] = NUL;
			if (!isMemberOfStringList(pUpper->pLowerList, szLower_s))
			{
			sLowerList_s.pNext = pUpper->pLowerList;
			return &sLowerList_s;
			}
			}
		}
		return pUpper->pLowerList;
		}
	}
	}
/*
 *  check for a standard ASCII uppercase character
 */
c = *pszString_in;
if (isascii(c) && isupper(c))
	{
	szLower_s[0] = tolower(c);
	szLower_s[1] = NUL;
	sLowerList_s.pNext = NULL;
	return &sLowerList_s;
	}
return NULL;
}

/*************************************************************************
 * NAME
 *    addLowerUpperWFChars
 * ARGUMENTS
 *    rp  - pointer to string containing lowercase/UPPERCASE character pairs
 * DESCRIPTION
 *    Scan record contents for character pairs.  The first member
 *    is added to the lower case list, the second is added to the
 *    upper case list.
 * RETURN VALUE
 *    none
 */
void addLowerUpperWFChars(rp, pTextCtl_io)
char *		rp;
TextControl *	pTextCtl_io;
{
static const char szErrorHeading_s[] = "\nWarning: ";
char szPair[4];
/*
 *  minimal check for valid function input
 */
if ((rp == NULL) || (pTextCtl_io == NULL))
	return;
rp += strspn(rp, (char *)szWhitespace_m);
if (*rp == NUL)
	{
	reportError(WARNING_MSG,
		"%sEmpty lower-upper word formation character field\n",
		szErrorHeading_s );
	return;
	}
while (*rp != NUL)
	{
	szPair[0] = *rp++;
	rp += strspn(rp, (char *)szWhitespace_m);
	if (*rp == NUL)
	{
	int k = szPair[0] & 0xFF;
	reportError(WARNING_MSG,
			"%sMismatched lower-upper word formation character pair:\n\
\t\t\twill ignore character '%c' (%d).\n", szErrorHeading_s, k, k);
	break;
	}
	szPair[1] = ' ';
	szPair[2] = *rp++;
	szPair[3] = NUL;
	addLowerUpperWFCharStrings(szPair, pTextCtl_io);
	rp += strspn(rp, (char *)szWhitespace_m);
	}
}

/*************************************************************************
 * NAME
 *    addLowerUpperWFCharStrings
 * ARGUMENTS
 *    rp  - pointer to string containing lowercase/UPPERCASE character string
 *          pairs
 * DESCRIPTION
 *    Scan record contents for character string pairs.  The first member
 *    is added as a lower case grapheme, the second is added as an
 *    upper case grapheme.
 * RETURN VALUE
 *    none
 */
void addLowerUpperWFCharStrings(rp, pTextCtl_io)
char *		rp;
TextControl *	pTextCtl_io;
{
static char szErrorHeading_s[] = "\nWarning: ";
unsigned char * pszLow;		/* 'lower-case' list pointer */
unsigned char * pszUp;		/* 'upper-case' list pointer */
/*
 *  minimal check for valid function input
 */
if ((rp == NULL) || (pTextCtl_io == NULL))
	return;
/*
 *  complain if the string is empty
 */
pszLow = tokenizeString((unsigned char *)rp, szWhitespace_m);
if (pszLow == NULL)
	{
	reportError(WARNING_MSG,
		  "%sEmpty lower-upper multibyte word formation character field\n",
		szErrorHeading_s );
	return;
	}
pszUp  = tokenizeString(NULL, szWhitespace_m);
while (pszUp != NULL)
	{
	unsigned char *	pszLowercase       = NULL;
	unsigned char *	pszMappedUppercase = NULL;
	LowerLetter *	pPrevLow           = NULL;
	LowerLetter *	pLower;
	/*
	 *  find the letter in the lowercase list
	 */
	for (   pLower = pTextCtl_io->pLowercaseLetters ;
		pLower ;
		pLower = pLower->pNext )
	{
	if (strlen((char *)pszLow) > strlen((char *)pLower->pszLower))
		break;

	if (strcmp((char *)pszLow, (char *)pLower->pszLower) == 0)
		{
		StringList * pUp;
		for ( pUp = pLower->pUpperList ; pUp ; pUp = pUp->pNext )
		{
		if (strcmp((char *)pszUp,  pUp->pszString) == 0)
			{
			/*
			 *  this mapping already exists (in both directions)
			 */
			pszMappedUppercase = (unsigned char *)pUp->pszString;
			break;
			}
		}
		pszLowercase = pLower->pszLower;
		break;
		}
	pPrevLow = pLower;
	}
	/*
	 *  if necessary, find the letter in the uppercase list
	 */
	if (pszMappedUppercase == NULL)
	{
	unsigned char *	pszUppercase       = NULL;
	unsigned char *	pszMappedLowercase = NULL;
	UpperLetter * pPrevUp              = NULL;
	UpperLetter * pUpper;
	for (   pUpper = pTextCtl_io->pUppercaseLetters ;
		pUpper ;
		pUpper = pUpper->pNext )
		{
		if (strlen((char *)pszUp) > strlen((char *)pUpper->pszUpper))
		break;

		if (strcmp((char *)pszUp, (char *)pUpper->pszUpper) == 0)
		{
		StringList * pLow;
		for ( pLow = pUpper->pLowerList ; pLow ; pLow = pLow->pNext )
			{
			if (strcmp((char *)pszLow,  pLow->pszString) == 0)
			{
			pszMappedLowercase = (unsigned char *)pLow->pszString;
			break;
			}
			}
		pszUppercase = pUpper->pszUpper;
		break;
		}
		pPrevUp = pUpper;
		}

	if (	(   (pszMappedLowercase != NULL) &&
			(pszLowercase       != pszMappedLowercase) ) ||
		(   (pszMappedUppercase != NULL) &&
			(pszUppercase       != pszMappedUppercase) ) )
		{
		/*
		 *  WE GOT TROUBLES!! (at least a memory leak)
		 */
		}
	else
		{
		if (pszLowercase == NULL)
		{
		LowerLetter * pNewLower;
		/*
		 *  add new lowercase letter to the list
		 */
		pszLowercase = (unsigned char *)
						   duplicateString((char *)pszLow);
		if (pszUppercase != NULL)
			pszMappedUppercase = pszUppercase;
		else
			pszMappedUppercase = (unsigned char *)
						duplicateString((char *)pszUp);

		pNewLower = allocMemory(sizeof(LowerLetter));
		if (pPrevLow == NULL)
			pTextCtl_io->pLowercaseLetters = pNewLower;
		else
			pPrevLow->pNext = pNewLower;
		pNewLower->pNext      = pLower;
		pNewLower->pszLower   = pszLowercase;
		pNewLower->pUpperList = allocMemory(sizeof(StringList));
		pNewLower->pUpperList->pszString = (char *)pszMappedUppercase;
		pNewLower->pUpperList->pNext     = NULL;
		}
		else if (pszMappedUppercase == NULL)
		{
		StringList * pUp;
		StringList * pPrevUp = pLower->pUpperList;
		/*
		 *  add new uppercase mapping to a lowercase letter
		 */
		if (pszUppercase != NULL)
			pszMappedUppercase = pszUppercase;
		else
			pszMappedUppercase = (unsigned char *)
						duplicateString((char *)pszUp);
		for ( pUp = pLower->pUpperList ; pUp ; pUp = pUp->pNext )
			pPrevUp = pUp;
		pPrevUp->pNext            = allocMemory(sizeof(StringList));
		pPrevUp->pNext->pszString = (char *)pszMappedUppercase;
		pPrevUp->pNext->pNext     = NULL;
		}
		if (pszUppercase == NULL)
		{
		UpperLetter * pNewUpper;
		/*
		 *  add new uppercase letter to the list
		 */
		pNewUpper = allocMemory(sizeof(UpperLetter));
		if (pPrevUp == NULL)
			pTextCtl_io->pUppercaseLetters = pNewUpper;
		else
			pPrevUp->pNext = pNewUpper;
		pNewUpper->pNext      = pUpper;
		pNewUpper->pszUpper   = pszMappedUppercase;
		pNewUpper->pLowerList = allocMemory(sizeof(StringList));
		pNewUpper->pLowerList->pszString = (char *)pszLowercase;
		pNewUpper->pLowerList->pNext     = NULL;
		}
		else if (pszMappedLowercase == NULL)
		{
		StringList * pLow;
		StringList * pPrevLow = pUpper->pLowerList;
		/*
		 *  add new lowercase mapping to a uppercase letter
		 */
		for ( pLow = pUpper->pLowerList ; pLow ; pLow = pLow->pNext )
			pPrevLow = pLow;
		pPrevLow->pNext            = allocMemory(sizeof(StringList));
		pPrevLow->pNext->pszString = (char *)pszLowercase;
		pPrevLow->pNext->pNext     = NULL;
		}
		}
	}
	/*
	 *  get the next pair of letters
	 */
	pszLow = tokenizeString(NULL, szWhitespace_m);
	pszUp  = tokenizeString(NULL, szWhitespace_m);
	}

if (pszLow != NULL)
	{
	reportError(WARNING_MSG,
		 "%sMismatched lower-upper word formation character string pair:\n\
						will ignore character '%s'.\n",
		szErrorHeading_s, pszLow);
	}
}

/*************************************************************************
 * NAME
 *    addWordFormationChars
 * ARGUMENTS
 *    rp  - pointer to string containing alphabetic characters
 * DESCRIPTION
 *    Scan string contents for non-whitespace characters.  Each such
 *    character is added to the list of alphabetic characters.
 * RETURN VALUE
 *    none
 */
void addWordFormationChars(rp, pTextCtl_io)
char *		rp;
TextControl *	pTextCtl_io;
{
static const char szErrorHeading_s[] = "\nWarning: ";
char		  szBuffer[2];
char		  c;
/*
 *  minimal check for valid function input
 */
if ((rp == NULL) || (pTextCtl_io == NULL))
	return;
rp += strspn(rp, (char *)szWhitespace_m);
if (*rp == NUL)
	{
	reportError(WARNING_MSG,
		"%sEmpty word formation character field\n", szErrorHeading_s );
	return;
	}
while (*rp != NUL)
	{
	c = *rp++;
	if (isascii(c) && isspace(c))
	continue;
	szBuffer[0] = c;
	szBuffer[1] = NUL;
	addWordFormationCharStrings(szBuffer, pTextCtl_io);
	}
}

/*************************************************************************
 * NAME
 *    addWordFormationCharStrings
 * ARGUMENTS
 *    rp  - pointer to string containing caseless multibyte character strings
 * DESCRIPTION
 *    Scan record contents for character strings.  Each multibyte character
 *    string is added to the list of multibyte caseless characters.
 * RETURN VALUE
 *    none
 */
void addWordFormationCharStrings(rp, pTextCtl_io)
char *		rp;
TextControl *	pTextCtl_io;
{
static char szErrorHeading_s[] = "\nWarning: ";
unsigned char * pszLet;		/* multibyte character pointer */
/*
 *  minimal check for valid function input
 */
if ((rp == NULL) || (pTextCtl_io == NULL))
	return;
/*
 *  complain if the string is empty
 */
pszLet = tokenizeString((unsigned char *)rp, szWhitespace_m);
if (pszLet == NULL)
	{
	reportError(WARNING_MSG,
		"%sEmpty multibyte word formation character field\n",
		szErrorHeading_s );
	return;
	}
for ( ; pszLet ; pszLet = tokenizeString(NULL, szWhitespace_m) )
	{
	CaselessLetter *	pPrevLet           = NULL;
	CaselessLetter *	pLet;
	CaselessLetter *	pNewLet;
	int			bAlready = FALSE;
	/*
	 *  try to find the letter in the list
	 */
	for (   pLet = pTextCtl_io->pCaselessLetters ;
		pLet ;
		pLet = pLet->pNext )
	{
	if (strlen((char *)pszLet) > strlen((char *)pLet->pszLetter))
		break;
	if (strcmp((char *)pszLet, (char *)pLet->pszLetter) == 0)
		{
		bAlready = TRUE;
		break;
		}
	pPrevLet = pLet;
	}
	if (bAlready)
	{
	reportError(WARNING_MSG,
			"%sWord formation character '%s' already specified:\n\
\t\t\twill ignore it.\n",
			szErrorHeading_s, pszLet );
	continue;
	}
	/*
	 *  add the letter to the list
	 */
	pNewLet = allocMemory(sizeof(CaselessLetter));
	if (pPrevLet == NULL)
	pTextCtl_io->pCaselessLetters = pNewLet;
	else
	pPrevLet->pNext = pNewLet;
	pNewLet->pNext      = pLet;
	pNewLet->pszLetter  = (unsigned char *)duplicateString((char *)pszLet);
	}
}

/*************************************************************************
 * NAME
 *    write_8bit_char
 * DESCRIPTION
 *    Show an 8-bit character safely.  #ifdef GENERIC_TERMINAL means a 7-bit
 *    display is presumed.
 * RETURN VALUE
 *    none
 */
static void write_8bit_char(ch, fp)
int	ch;		/* character to display */
FILE *	fp;		/* output FILE pointer */
{
ch &= 0xFF;

if (ch < ' ')
	fprintf(fp, "<CTRL/%c>", ch | 0100 );
else if (ch == ' ')
	fprintf(fp, "<space>");	/* Spanish: "espacio" */
else if (ch < 0177)
	fprintf(fp, "%c", ch );
else if (ch == 0177)
	fprintf(fp, "<delete>" );
#ifdef GENERIC_TERMINAL
else if (ch < 0240)
	fprintf(fp, "<0x80+CTRL/%c>", (ch & 0177) | 0100 );
else if (ch == 0240)
	fprintf(fp, "<0x80+space>");	/* Spanish: "espacio" */
else if (ch < 0377)
	fprintf(fp, "<0x80+%c>", ch & 0177 );
else if (ch == 0377)
	fprintf(fp, "<0x80+delete>");
#else
else
	fprintf(fp, "%c", ch );
#endif /* GENERIC_TERMINAL */
}

/*************************************************************************
 * NAME
 *    write_8bit_char
 * DESCRIPTION
 *    Show a string of 8-bit characters safely.
 * RETURN VALUE
 *    none
 */
static void write_8bit_string(pszString_in, outfp)
char *	pszString_in;
FILE *	outfp;
{
char *	p;

for ( p = pszString_in ; *p ; ++p )
	write_8bit_char(*p, outfp);
}

/*****************************************************************************
 * NAME
 *    width_8bit_char
 * DESCRIPTION
 *    calculate the number of (7-bit?) characters needed to represent the
 *    8-bit character value
 * RETURN VALUE
 *    number of characters used to represent the 8-bit character value
 */
static size_t width_8bit_char(ch)
int	ch;
{
ch &= 0xFF;

if (ch < ' ')
	return 8;		/* <CTRL/A> */
else if (ch == ' ')
	return 7;		/* <space> */
else if (ch < 0177)
	return 1;		/* A */
else if (ch == 0177)
	return 8;		/* <delete> */
#ifdef GENERIC_TERMINAL
else if (ch < 0240)
	return 13;		/* <0x80+CTRL/A> */
else if (ch == 0240)
	return 12;		/* <0x80+space> */
else if (ch < 0377)
	return 8;		/* <0x80+A> */
else if (ch == 0377)
	return 13;		/* <0x80+delete> */
#else
else
	return 1;		/* Å */
#endif /* GENERIC_TERMINAL */
}

/*****************************************************************************
 * NAME
 *    width_8bit_string
 * DESCRIPTION
 *    calculated the number of (7-bit?) characters needed to represent the
 *    8-bit character string
 * RETURN VALUE
 *    number of characters needed to represent the 8-bit character string
 */
static size_t width_8bit_string(pszString_in)
char *	pszString_in;
{
size_t	iWidth = 0;
char *	p;

for ( p = pszString_in ; *p ; ++p )
	iWidth += width_8bit_char(*p);
return iWidth;
}

/*****************************************************************************
 * NAME
 *    write_upper
 * DESCRIPTION
 *    write the list of uppercase multibyte characters corresponding the the
 *    list of lowercase multibyte characters that have already been written
 * RETURN VALUE
 *    none
 */
static void write_upper(pLowStart_in, pLowEnd_in, pUpStart_in, pUpEnd_in, fp)
LowerLetter *	pLowStart_in;
LowerLetter *	pLowEnd_in;
StringList *	pUpStart_in;
StringList *	pUpEnd_in;
FILE *		fp;
{
LowerLetter *	pLow;
StringList *	pUp;
unsigned	uiPadWidth;
size_t		uiLowerSize;
size_t		uiUpperSize;

fprintf(fp, "\n       ");
for ( pLow = pLowStart_in ; pLow ; pLow = pLow->pNext )
	{
	uiLowerSize = width_8bit_string((char *)pLow->pszLower);
	for ( pUp = pLow->pUpperList ; pUp ; pUp = pUp->pNext )
	{
	if (pUp == pUpEnd_in)
		break;
	uiUpperSize = width_8bit_string(pUp->pszString);
	uiPadWidth = 0;
	if (uiLowerSize > uiUpperSize)
		uiPadWidth = uiLowerSize - uiUpperSize;
	fprintf(fp, " ");
	write_8bit_string(pUp->pszString, fp);
	if (uiPadWidth != 0)
		fprintf(fp, "%*s", uiPadWidth, " ");
	}
	if (pLow == pLowEnd_in)
	break;
	}
}

/*************************************************************************
 * NAME
 *    writeWordFormationChars
 * DESCRIPTION
 *    Print the list of word formation characters.
 * RETURN VALUE
 *    none
 */
void writeWordFormationChars(fp, pTextCtl_in)
FILE *			fp;
const TextControl *	pTextCtl_in;
{
CaselessLetter *	pLet;
int			cLow;
int			cUp;
unsigned		uiLineWidth;
size_t			uiLowerSize;
size_t			uiUpperSize;
unsigned		uiPadWidth;
LowerLetter *		pLower;
StringList *		pUpper;
LowerLetter *		pLowStart;
StringList *		pUpStart;
/*
 *  minimal check for valid function input
 */
if ((fp == NULL) || (pTextCtl_in == NULL))
	return;
		/* Spanish: "Usando los siguientes como alfabeticos:" */
fprintf(fp, "    Using the following as word-formation characters:" );
if (pTextCtl_in->pCaselessLetters != NULL)
	{
	size_t	uiWidth;
	fprintf(fp,"\n     Caseless alphabetic characters =\n       ");
	uiLineWidth = 7;
	for ( pLet = pTextCtl_in->pCaselessLetters ; pLet ; pLet = pLet->pNext )
	{
	uiWidth = width_8bit_string((char *)pLet->pszLetter) + 1;
	if (uiLineWidth + uiWidth >= 80)
		{
		fprintf(fp, "\n       ");
		uiLineWidth = 7;
		}
	fputc(' ', fp);
	write_8bit_string((char *)pLet->pszLetter, fp);
	uiLineWidth += uiWidth;
	}
	}
fprintf(fp, "\n");
fprintf(fp, "\
	 Lower/uppercase alphabetic characters (lowercase above, uppercase below) =\n");
fprintf(fp, "       ");
if (pTextCtl_in->pLowercaseLetters == NULL)
	{
	for ( cLow = 'a' ; cLow <= 'z' ; ++cLow )
	fprintf(fp, " %c", cLow );
	fprintf(fp, "\n       ");
	for ( cUp = 'A' ; cUp <= 'Z' ; ++cUp )
	fprintf(fp, " %c", cUp );
	}
else
	{
	pLowStart = pTextCtl_in->pLowercaseLetters;
	pUpStart  = pTextCtl_in->pLowercaseLetters->pUpperList;
	uiLineWidth = 7;
	for (   pLower = pTextCtl_in->pLowercaseLetters ;
		pLower ;
		pLower = pLower->pNext )
	{
	uiLowerSize = width_8bit_string((char *)pLower->pszLower);
	for ( pUpper = pLower->pUpperList ; pUpper ; pUpper = pUpper->pNext )
		{
		uiUpperSize = width_8bit_string(pUpper->pszString);
		uiPadWidth = 0;
		if (uiUpperSize > uiLowerSize)
		uiPadWidth = uiUpperSize - uiLowerSize;
		if (uiLineWidth + uiPadWidth + uiLowerSize >= 79)
		{
		write_upper(pLowStart, pLower, pUpStart, pUpper, fp);
		fprintf(fp, "\n       ");
		uiLineWidth = 7;
		pLowStart = pLower;
		pUpStart  = pUpper;
		}
		fprintf(fp, " ");
		write_8bit_string((char *)pLower->pszLower, fp);
		if (uiPadWidth != 0)
		fprintf(fp, "%*s", uiPadWidth, " ");
		uiLineWidth += uiPadWidth + uiLowerSize + 1;
		}
	}
	for ( cLow = 'a' ; cLow <= 'z' ; ++cLow )
	{
	if (uiLineWidth >= 78)
		break;
	fprintf(fp, " %c", cLow);
	uiLineWidth += 2;
	}
	write_upper(pLowStart, NULL, pUpStart, NULL, fp);
	if (cLow <= 'z')
	{
	for ( cUp = 'A' ; cUp < toupper(cLow) ; ++cUp )
		fprintf(fp, " %c", cUp );
	fprintf(fp, "\n       ");
	for ( ; cLow <= 'z' ; ++cLow )
		fprintf(fp, " %c", cLow );
	fprintf(fp, "\n       ");
	for ( ; cUp <= 'Z' ; ++cUp )
		fprintf(fp, " %c", cUp );
	}
	else
	{
	for ( cUp = 'A' ; cUp <= 'Z' ; ++cUp )
		fprintf(fp, " %c", cUp );
	}
	}
fprintf(fp, "\n");
}

/*************************************************************************
 * NAME
 *    resetWordFormationChars
 * DESCRIPTION
 *    Erase the stored information.
 * RETURN VALUE
 *    none
 */
void resetWordFormationChars(pTextCtl_io)
TextControl *	pTextCtl_io;
{
/*
 *  minimal check for valid function input
 */
if (pTextCtl_io == NULL)
	return;

if (pTextCtl_io->pCaselessLetters != NULL)
	{
	CaselessLetter * pLet;
	CaselessLetter * pNextLet;
	for ( pLet = pTextCtl_io->pCaselessLetters ; pLet ; pLet = pNextLet )
	{
	pNextLet = pLet->pNext;
	freeMemory(pLet->pszLetter);
	freeMemory(pLet);
	}
	pTextCtl_io->pCaselessLetters = NULL;
	}
if (pTextCtl_io->pLowercaseLetters != NULL)
	{
	LowerLetter * pLow;
	LowerLetter * pNextLetter;
	StringList *  pItem;
	StringList *  pNextItem;
	for ( pLow = pTextCtl_io->pLowercaseLetters ; pLow ; pLow = pNextLetter )
	{
	pNextLetter = pLow->pNext;
	freeMemory(pLow->pszLower);
	for ( pItem = pLow->pUpperList ; pItem ; pItem = pNextItem )
		{
		pNextItem = pItem->pNext;
		freeMemory(pItem);
		}
	freeMemory(pLow);
	}
	pTextCtl_io->pLowercaseLetters = NULL;
	}
if (pTextCtl_io->pUppercaseLetters != NULL)
	{
	UpperLetter * pUp;
	UpperLetter * pNextLetter;
	StringList *  pItem;
	StringList *  pNextItem;
	for ( pUp = pTextCtl_io->pUppercaseLetters ; pUp ; pUp = pNextLetter )
	{
	pNextLetter = pUp->pNext;
	freeMemory(pUp->pszUpper);
	for ( pItem = pUp->pLowerList ; pItem ; pItem = pNextItem )
		{
		pNextItem = pItem->pNext;
		freeMemory(pItem);
		}
	freeMemory(pUp);
	}
	pTextCtl_io->pUppercaseLetters = NULL;
	}
}

/***************************************************************************
 *      EDIT HISTORY
 * 02-Aug-90	hab - original creation (AMPLE 1.6e)
 * 18-Sep-91	SRMc - Merge luwfc.c and myctype.c
 *		     - eliminate init_luwfc() and set_luwfc()
 *		     - use new opaclib.h and textctl.h, eliminating external
 *			data references
 *		     - remove #ifndef's for SYNTHESIS
 *		     - handle 8-bit character output on 7-bit displays
 * 22-Jan-92	SRMc - allow many:1 mappings in add_luwfc(), as requested by
 *			Bill Mann (try to follow what Alan Buseman did)
 *		     - add add_wfc() and show_wfc(), revise show_wfc() to not
 *			use struct text_control
 *		     - create myctype.h to go with this set of functions
 *  3-Jun-92	SRMc - finish getting show_wfc() to work
 *		     - fix bug in myisalpha()
 *  4-Jun-92	SRMc - fiddle with message strings in show_wfc()
 * 18-Aug-92	SRMc - fix glaring bugs in mytolower(), add_luwfc(), add_wfc()
 *  3-Sep-92	SRMc - add the reset_wfc() function
 *  4-Sep-92	SRMc - replace printf() with report_error()
 * 26-May-93	SRMc - handle stupid renaming of functions by MSC 7.00
 * 22-Oct-93	SRMc - handle signed vs. unsigned char for strchr()
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 27-Nov-96	SRMc - add mytolowers() and mytouppers()
 * 23-Jan-97	SRMc - add prototypes for strict ANSI C
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 11-Feb-97	SRMc - rename myisalpha()  to isAlphaChar()
 *		     - rename myislower()  to isLowercaseChar()
 *		     - rename myisupper()  to isUppercaseChar()
 *		     - rename mytolower()  to convCharToLower()
 *		     - rename mytoupper()  to convCharToUpper()
 *		     - rename mytolowers() to convCharToLowerSet()
 *		     - rename mytouppers() to convCharToUpperSet()
 *		     - rename add_luwfc()  to addLowerUpperWFChars()
 *		     - rename add_wfc()    to addWordFormationChars()
 *		     - rename show_wfc()   to showWordFormationChars()
 *		     - rename reset_wfc()  to resetWordFormationChars()
 *		     - add TextControl pointer as argument to each of these
 *			functions; eliminate internal static buffers
 * 22-May-97	SRMc - rename showWordFormationChars() to
 *			writeWordFormationChars()
 *  2-Oct-97	SRMc - fix for revised reportError()
 * 14-Jul-98	SRMc - fix for multibyte character handling by the TextControl
 *			data structure and related functions by the following:
 *		     - change isAlphaChar()        to matchAlphaChar()
 *		     - change isLowercaseChar()    to matchLowercaseChar()
 *		     - change isUppercaseChar()    to matchUppercaseChar()
 *		     - change convCharToUpper()    to convLowerToUpper()
 *		     - change convCharToLower()    to convUpperToLower()
 *		     - change convCharToUpperSet() to convLowerToUpperSet()
 *		     - change convCharToLowerSet() to convUpperToLowerSet()
 *		     - add the matchCaselessChar() function
 *		     - add the addLowerUpperWFCharStrings() function
 *		     - add the addWordFormationCharStrings() function
 * 17-Jul-98	SRMc - change the handling of the default ASCII alphabetic
 *			characters so that they are not stored explicitly
 */
