/* READFIEL.C - read a standard format field from a file
 ***************************************************************************
 *
 * char **readStdFormatField(FILE *fp, const char **fieldcodes, int comment)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1993, 1997 by the Summer Institute of Linguistics, Inc.
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
extern int    strncmp P((const char * s1, const char * s2, size_t n));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "allocmem.h"
extern char *readLineFromFile P((FILE *fp, unsigned * puiLineNumber,
				 int comment));

#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif
#ifndef NUL
#define NUL '\0'
#endif

#ifdef __STDC__
char **readStdFormatField(FILE *fp, const char **fieldcodes, int comment);
#endif

/****************************************************************************
 * NAME
 *    readStdFormatField
 * ARGUMENTS
 *    fp         - input file pointer
 *    fieldcodes - array of field code strings
 *    comment    - character initiating a comment
 * DESCRIPTION
 *    read an arbitrarily large text field that starts with a backslash
 *    marker at the beginning of a line
 * RETURN VALUE
 *    pointer to a dynamically allocated array of pointers to dynamically
 *    allocated lines of text
 */
char **readStdFormatField(fp, fieldcodes, comment)
FILE *		fp;
const char **	fieldcodes;
int		comment;
{
char  **field;
int sizefield;
int numlines;
char *line;
long fileloc;
int i, k;

while ( (line = readLineFromFile(fp, NULL, comment)) != (char *)NULL)
	{
	if (*line == '\\')
	break;
/*    freeMemory(line);*/
	}
if (line == (char *)NULL)
	return( (char **)NULL);
sizefield = 25;
field = (char **)allocMemory( sizefield * sizeof(char *));
field[0] = (char *)NULL;
for ( i = 0 ; fieldcodes[i] ; ++i )
	{
	k = strlen(fieldcodes[i]);
	if (    (strncmp(line, fieldcodes[i], k) == 0) &&
		((line[k] == NUL) || (isascii(line[k]) && isspace(line[k])) ) )
	{
	if (line[k] == NUL)
		--k;
	line[k] = (char)(i+1);
	field[0] = duplicateString(line+k);
/*	freeMemory(line);*/
	break;
	}
	}
if (field[0] == (char *)NULL)
	{
	line[0] = '\377';
	field[0] = duplicateString(line);
	}
numlines = 1;
fileloc = ftell(fp);
while ( (line = readLineFromFile(fp, NULL, comment)) != (char *)NULL)
	{
	/*
	 *  erase trailing whitespace
	 */
	k = strlen(line);			/* erase trailing whitespace */
	while ((k > 0) && isascii(line[k-1]) && isspace(line[k-1]))
	line[--k] = NUL;
	if (*line == '\\')
	{
	fseek(fp, fileloc, 0);
/*	freeMemory(line);*/
	break;
	}
	if (numlines >= sizefield)
	{
	sizefield += 25;
	field = (char **)reallocMemory((char *)field,
					   sizefield * sizeof(char *) );
	}
	field[numlines++] = duplicateString(line);
	fileloc = ftell(fp);
	}
while ((numlines > 0) && (field[numlines-1][0] == NUL))
	{
	--numlines;
	freeMemory(field[numlines]);
	field[numlines] = (char *)NULL;
	}
if (numlines >= sizefield)
	field = (char **)reallocMemory(field,
				   (numlines+1) * sizeof(char *) );
field[numlines] = (char *)NULL;
return(field);
}

/*****************************************************************************
 * EDIT HISTORY
 * 15-Apr-93	SRMc - extract from PM-INIT.C
 * 26-May-93	SRMc - handle stupid renaming of functions by MSC 7.00
 * 28-Mar-95	SRMc - #define isascii(c) for systems that don't
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 14-Oct-96	SRMc - change #include "opaclib.h" to #include "myalloc.h"
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 11-Feb-97	SRMc - split read_line() into a separate file, rename it to
 *			readLineFromFile()
 *		     - rename read_field() to readStdFormatField()
 * 28-May-97	SRMc - make function arguments const where possible
 */
