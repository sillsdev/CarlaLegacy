/* ERASECHA.C - erase a set of characters from a string
 ***************************************************************************
 *
 * char *eraseCharsInString(char *pszString_io, const char *pszEraseChars_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1993, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern char * strchr  P((const char * s, int c));
#endif /*STDC_HEADERS*/

#ifndef NULL
#define NULL (VOIDP)0
#endif
#ifndef NUL
#define NUL '\0'
#endif

#ifdef __STDC__
char *eraseCharsInString(char *pszString_io, const char *pszEraseChars_in);
#endif

/***************************************************************************
 * NAME
 *    eraseCharsInString
 * ARGUMENTS
 *    pszString_io - input string to modify
 *    pszEraseChars_in  - characters to erase from string
 * DESCRIPTION
 *    Erase any characters from 'pszEraseChars_in' that are found in
 *    'pszString_io', possibly shortening 'pszString_io' as a side-effect.
 * RETURN VALUE
 *    pointer to the modified string (pszString_io)
 */
char * eraseCharsInString(pszString_io, pszEraseChars_in)
char *		pszString_io;
const char *	pszEraseChars_in;
{
char *p, *q;

if (	(pszString_io == (char *)NULL) || (*pszString_io == NUL) ||
	(pszEraseChars_in  == (char *)NULL) || (*pszEraseChars_in  == NUL) )
	return(pszString_io);
for ( p = q = pszString_io ; *p ; ++p )
	{
	if (strchr(pszEraseChars_in, *p) == (char *)NULL)
	*q++ = *p;
	}
*q = NUL;
return(pszString_io);
}

/*****************************************************************************
 * EDIT HISTORY
 * 12-Dec-90	SRMc - write pops_erase_chars() as part of POPS.C
 * 21-Nov-91	SRMc - fix pops_erase_chars() to overwrite with spaces
 *			rather than remove character slot from string
 * 15-Apr-93	SRMc - extract from POP-PROC.C, rename to erase_chars()
 *  7-Sep-93	SRMc - characters are removed; ignore comment from
 *			21-Nov-91
 * 14-Oct-96	SRMc - change #include "opaclib.h" to #define NUL '\0'
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 29-Jan-97	SRMc - fix for "config.h"
 *  3-Feb-97	SRMc - add #ifndef'ed #define NULL
 * 11-Feb-97	SRMc - rename erase_chars() to eraseCharsInString()
 * 25-Feb-97	SRMc - make pszErase_in a const argument
 */
