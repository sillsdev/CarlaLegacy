/* ADJFNAME.C - create a file pathname from a filename, pathname, and extension
 ***************************************************************************
 *
 * char * buildAdjustedFilename(const char * pszFilename_in,
 *				const char * pszBasePathname_in,
 *				const char * pszExtension_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1995, 1997 by the Summer Institute of Linguistics, Inc.
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
#define strrchr rindex
#endif
extern char * strcpy  P((char * dest, const char * src));
extern char * strcat  P((char * dest, const char * src));
extern char * strchr  P((const char * s, int c));
extern char * strrchr P((const char * s, int c));
extern char * strpbrk P((const char * s, const char * accept));
extern size_t strlen  P((const char * s));
#endif /* STDC_HEADERS */

#include "allocmem.h"

#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif

#ifdef __STDC__
char * buildAdjustedFilename(const char * pszFilename_in,
				 const char * pszBasePathname_in,
				 const char * pszExtension_in);
#endif

/*****************************************************************************
 * NAME
 *    buildAdjustedFilename
 * ARGUMENTS
 *    pszFilename_in     - pointer to a filename
 *    pszBasePathname_in - optional pointer to a base file pathname
 *    pszExtension_in    - optional pointer to a filename extension
 * DESCRIPTION
 *    build a filename from the pieces given.  if the base pathname exists,
 *    and contains directory information, add that to the output filename
 *    unless the input filename is an absolute pathname.  if the extension is
 *    given, and the input filename does not have an extension, add the
 *    extension if needed
 * RETURN VALUE
 *    pointer to the new filename
 */
char *buildAdjustedFilename(pszFilename_in, pszBasePathname_in,pszExtension_in)
const char *	pszFilename_in;
const char *	pszBasePathname_in;
const char *	pszExtension_in;
{
char *	pszFile = NULL;
char *	p;
FILE *	fp;

#ifdef DIRSEPCHAR
char *	pDirEnd;
char	chSave;

if (	(pszBasePathname_in != NULL) &&
#ifdef DOS_FILESYSTEM
	((pDirEnd = strpbrk(pszBasePathname_in, "\\/:")) != NULL) )
#else
	((pDirEnd = strrchr(pszBasePathname_in, DIRSEPCHAR)) != NULL) )
#endif
	{
	/*
	 *  verify that the file is a relative pathname
	 */
#ifdef MACINTOSH
	if (    (*pszFilename_in == DIRSEPCHAR) ||
		(strchr(pszFilename_in,DIRSEPCHAR) == NULL) )
#else /*MACINTOSH*/
#ifdef DOS_FILESYSTEM
	while ((p = strpbrk(pDirEnd+1, "\\/:")) != NULL)
	pDirEnd = p;
	if (!(	(pszFilename_in[0] == DIRSEPCHAR) ||
		(pszFilename_in[0] == '/') ||
		(   isascii(pszFilename_in[0]) &&
			isalpha(pszFilename_in[0]) &&
			(pszFilename_in[1] == ':') ) ) )
#else /*DOS_FILESYSTEM*/
	if (*pszFilename_in != DIRSEPCHAR)
#endif /*DOS_FILESYSTEM*/
#endif /*MACINTOSH*/
	{
	++pDirEnd;
	chSave = *pDirEnd;
	*pDirEnd = '\0';
	pszFile = allocMemory(strlen(pszBasePathname_in) +
						 strlen(pszFilename_in) + 1 );
#ifdef MACINTOSH
	if (*pszFilename_in == DIRSEPCHAR)
		strcat(strcpy(pszFile, pszBasePathname_in), pszFilename_in+1);
	else
#endif /*MACINTOSH*/
	strcat(strcpy(pszFile, pszBasePathname_in), pszFilename_in);
	*pDirEnd = chSave;
	}
	}
#endif /*DIRSEPCHAR*/

if (pszFile == NULL)
	pszFile = duplicateString(pszFilename_in);

fp = fopen(pszFile, "r");
if (fp == NULL)
	{
#ifdef DIRSEPCHAR
	p = strrchr(pszFile, DIRSEPCHAR);
	if (p != NULL)
		++p;
	else
#ifdef DOS_FILESYSTEM
	p = strrchr(pszFile, '/');
	if (p != NULL)
		++p;
	else
#endif /*DOS_FILESYSTEM*/
#endif /*DIRSEPCHAR*/
		p = pszFile;
	if ((pszExtension_in != NULL) && (strchr(p,'.') == NULL))
	{
	pszFile = reallocMemory(pszFile,
				strlen(pszFile) + strlen(pszExtension_in) + 1);
	strcat(pszFile, pszExtension_in);
	}
	}
else
	fclose(fp);

return( pszFile );
}

/***************************************************************************
 * EDIT HISTORY
 * 29-Sep-95	SRMc - create function from code in pckimmo/lexicon.c
 * 10-Oct-95	SRMc - get to work with Macintosh pathnames
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 23-Sep-96	SRMc - allow either '\\' or '/' for DOS_FILESYSTEM
 * 14-Oct-96	SRMc - change #include "opaclib.h" to #include "myalloc.h"
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 18-Feb-97	SRMc - rename adjustedFilename() to buildAdjustedFilename()
 * 25-Feb-97	SRMc - make the input arguments all const
 */
