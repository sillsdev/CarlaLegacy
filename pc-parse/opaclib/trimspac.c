/* TRIMSPAC.C - remove all trailing whitespace characters from a string
 ***************************************************************************
 *
 * char * trimTrailingWhitespace(char * pszString_io)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1996, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
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

#ifdef __STDC__
char * trimTrailingWhitespace(char * pszString_io);
#endif

#define NUL '\0'		/* the ASCII NUL character */

#ifndef NULL
#define NULL (VOIDP)0
#endif
#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif

/*****************************************************************************
 * NAME
 *    trimTrailingWhitespace
 * DESCRIPTION
 *    remove trailing white spaces
 * RETURN VALUE
 *    pointer to input string
 */
char * trimTrailingWhitespace(pszString_io)
char *	pszString_io;
{
char *	pszEnd;

if (pszString_io == NULL)
	return NULL;
for (	pszEnd = pszString_io + strlen(pszString_io) - 1 ;
	(pszEnd >= pszString_io) && isascii(*pszEnd) && isspace(*pszEnd) ;
	--pszEnd )
	*pszEnd = NUL;

return(pszString_io);
}

/*****************************************************************************
 * EDIT HISTORY
 *  ?- ? -96	SRMc - write as part of the IT2PTEXT program
 * 11-Feb-97	SRMc - extract into a separate file, add to the OPAC library
 */
