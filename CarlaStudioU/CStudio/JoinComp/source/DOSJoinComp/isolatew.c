/* GETWORD.C - get next sequence of non-whitespace characters
 ***************************************************************************
 *
 * char * isolateWord(char * pszLine_io)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <ctype.h>
#define NUL '\0'		/* the ASCII NUL character */

#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif

#ifdef __STDC__
char * isolateWord(char * pszLine_io);
#endif

/****************************************************************************
 * NAME
 *    isolateWord
 * DESCRIPTION
 *    isolate the ``word'' pointed to by pszLine_io by replacing the first
 *    whitespace character following the word with a NUL character.
 *    then step the pointer to the beginning of the next ``word'' in the input
 * RETURN VALUE
 *    pointer to the first character of the next following word, which may be
 *    the NUL character at the end of input string
 */
char *isolateWord(pszLine_io)
char *	pszLine_io;	/* pointer to NUL-terminated character string */
{
char *	p;

if ((pszLine_io == NULL) || (*pszLine_io == NUL))
	return(pszLine_io);

for ( p = pszLine_io ; (*p != NUL) && isascii(*p) && isspace(*p) ; ++p )
	;				/* skip leading white space */
for ( ; (*p != NUL) && !(isascii(*p) && isspace(*p)) ; ++p )
	;				/* skip over nonwhitespace */
if (*p != NUL)
	{
	/*
	 *  terminate this lexical item and skip forward to the next item
	 */
	for ( *p++ = NUL ; (*p != NUL) && isascii(*p) && isspace(*p) ; ++p )
	;
	}
return(p);
}

/*****************************************************************************
 * EDIT HISTORY
 * 26-Feb-87	H.A. Black
 * 27-Feb-87	H.A. Black
 * 14-Jun-88	SRMc - use <ctype.h> macros
 *  1-Aug-88	SRMc - rewrite to get it to work with MSDOS Aztec C
 * 21-Oct-88	SRMc - reorganize the file header comments
 * 27-Jul-89	hab  - add Copyright 1989
 * 01-Aug-89	ab/hab - Define myisspace() to handle 8-bit characters
 * 16-Sep-91	SRMc - put skipwhite() in a file of its own
 * 		     - remove dependence on skipwhite()
 * 26-May-93	SRMc - handle stupid renaming of functions by MSC 7.00
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 30-Jan-97	SRMc - rename from getwd() to getWord()
 * 27-Feb-97	SRMc - rename from getWord() to isolateWord()
 */
