/* READLINE.C - read an arbitrarily long line of text from a file
 ***************************************************************************
 *
 * char *readLineFromFile(FILE *fp, unsigned * puiLineNumber, int comment)
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
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern char * strcat  P((char * dest, const char * src));
extern char * strchr  P((const char * s, int c));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "allocmem.h"

#ifndef NUL
#define NUL '\0'
#endif
#ifndef MAXLINELEN
#define MAXLINELEN 256
#endif

#ifdef __STDC__
char *readLineFromFile(FILE *fp, unsigned * puiLineNumber, int comment);
#endif

static char getline_buffer[MAXLINELEN];

/****************************************************************************
 * NAME
 *    readLineFromFile
 * ARGUMENTS
 *    fp      - input file pointer
 *    comment - character initiating a comment
 * DESCRIPTION
 *    read an arbitrarily long line of input text, erasing trailing newline
 *    character
 * RETURN VALUE
 *    pointer to dynamically allocated line of input text
 */
char *readLineFromFile(pInputFP_in, puiLineNumber_io, cCommentChar_in)
FILE *		pInputFP_in;
unsigned *	puiLineNumber_io;
int		cCommentChar_in;
{
static char *s = getline_buffer;
int size;
register char *p;
int c;

if (s != getline_buffer)
	{
	freeMemory(s);		/* release dynamically allocated space */
	s = getline_buffer;
	}
if (puiLineNumber_io != NULL)
	(*puiLineNumber_io)++;		/* bump the line number */
p = getline_buffer;
size = MAXLINELEN;
while ( ((c = getc(pInputFP_in)) != EOF) && (c != '\n') )
	{
	*p++ = c;			/* store the character */
	if ((p - s) >= size)
	{
	/*
	 *  increase the buffer size
	 */
	size += MAXLINELEN;
	if (s == getline_buffer)
		{
		s = (char *)allocMemory(size);
		memcpy(s, (char *)getline_buffer, MAXLINELEN);
		}
	else
		s = (char *)reallocMemory( s, size );
	p = s + size - MAXLINELEN;
	}
	}
*p = NUL;
if ((c == EOF) && (p == getline_buffer))
	return( NULL );
/*
 *  get rid of any comments or trailing whitespace
 */
if ((p = strchr(s, cCommentChar_in)) != NULL)
	{
	*p = NUL;
	}
return(s);
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
 * 11-Feb-97	SRMc - split read_line() into a separate file, and rename it
 *			to readLineFromFile()
 */
