/* CCOMMAND.C - read command line and build argument vector
 ***************************************************************************
 *
 *	extern char *pszProgramPrompt_g;
 *	int ccommand(argvp)
 *	char ***argvp;
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1995, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <ctype.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
extern char * strcpy  P((char * dest, const char * src));
extern size_t strlen  P((const char * s));
extern VOIDP  malloc  P((size_t size));
#endif

#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif

extern char *pszProgramPrompt_g;
static char *pszDefaultPrompt_m = "Argv: ";

/*****************************************************************************
 * NAME
 *    ccommand
 * ARGUMENTS
 *    argvp - address of the pointer to the array of command line arguments
 * DESCRIPTION
 *    read a command line from the user and parse it into an array of arguments
 * RETURN VALUE
 *    number of command line arguments
 */
int ccommand(argvp)
char ***argvp;
{
int argc = 0;
char **argv;
char buffer[256];
char *tmp_argv[100];
char *p, *q;
int i;
int quoting = 0;
char *pszPrompt;

if (pszProgramPrompt_g != NULL)
	pszPrompt = pszProgramPrompt_g;
else
	pszPrompt = pszDefaultPrompt_m;
fputs( pszPrompt, stderr );
if (fgets(buffer, 255, stdin) == (char *)NULL)
	buffer[0] = '\0';
buffer[255] = '\0';
tmp_argv[argc++] = **argvp;
for ( p = buffer ; *p ; )
	{
	while (*p && isascii(*p) && isspace(*p))
	++p;
	if (*p == '\0')
	break;
	for ( q = p ; *q ; )
	{
	if (*q == '"')
		{
		quoting = !quoting;
		memmove(q, q+1, strlen(q));
		}
	else if (*q == '\\')
		{
		memmove(q, q+1, strlen(q));
		if (*q)
		++q;
		}
	else if (isascii(*q) && isspace(*q) && !quoting)
		break;
	else
		++q;
	}
	if (*q != '\0')
	*q++ = '\0';
	tmp_argv[argc++] = p;
	p = q;
	}
argv = malloc((unsigned)((argc+1) * sizeof(char *)));
if (argv == NULL)
	return( 0 );
for ( i = 0 ; i < argc ; ++i )
	{
	argv[i] = malloc( strlen(tmp_argv[i]) + 1 );
	if (argv[i] == NULL)
	return( i );
	strcpy( argv[i], tmp_argv[i] );
	}
argv[argc] = (char *)NULL;
*argvp = argv;
return( argc );
}

/***************************************************************************
 * EDIT HISTORY
 * 29-Sep-95	SRMc - create function from code in ktagger/ktagger.c
 * 31-Jan-97	SRMc - fix for STDC_HEADERS
 */
