/* SETCMDFI.C - set a filename using defaults
 *****************************************************************************
 *
 * char * setCmdFilename(const char * pszFilename_io,
 *			 const char * pszDefaultName_in,
 *			 const char * pszExtension_in)
 *
 *****************************************************************************
 * Copyright 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#define strrchr rindex
#endif
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strcat  P((char * dest, const char * src));
extern char * strchr  P((const char * s, int c));
extern char * strrchr P((const char * s, int c));
extern char * getenv  P((const char *name));
#endif /* STDC_HEADERS */

#include "allocmem.h"
#include "cmd.h"

/*****************************************************************************
 * NAME
 *    setCmdFilename
 * DESCRIPTION
 *    Check a filename provided by the user, appending a default extension
 *    if the file lacks one, or even providing a default filename.
 * RETURN VALUE
 *    pointer to a dynamically allocated filename string
 */
char * setCmdFilename(pszFilename_in, pszDefaultName_in, pszExtension_in)
const char *	pszFilename_in;		/* filename given by user (may be
					   NULL) */
const char *	pszDefaultName_in;	/* default full filename (may be
					   NULL) */
const char *	pszExtension_in;	/* default extension, including
					   leading separation char (.) */
{
const char *	p;

if (pszFilename_in == NULL)
	{
	if (pszDefaultName_in == NULL)
	return( NULL );
	else
	return( duplicateString(pszDefaultName_in) );
	}
#ifdef DIRSEPCHAR
/*
 *  find the beginning of the filename proper, following an optional
 *    string of directory names separated by DIRSEPCHAR
 */
p = strrchr(pszFilename_in, DIRSEPCHAR);
if (p != NULL)
	++p;
else
#endif
	p = pszFilename_in;

if (strchr(p, *pszExtension_in) == NULL)
	{
	return(strcat(strcpy((char *)allocMemory(
			(strlen(pszFilename_in)+strlen(pszExtension_in)+1)),
			 pszFilename_in),
		  pszExtension_in) );
	}
return( duplicateString(pszFilename_in) );
}
