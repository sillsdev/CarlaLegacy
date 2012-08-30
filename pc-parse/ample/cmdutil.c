/* CMDUTIL.C - read filenames and responses for AMPLE and STAMP
 ******************************************************************************
 *
 * NOTE THAT THESE FUNCTIONS ARE NOT REENTRANT BECAUSE LOCAL GLOBAL VARIABLES
 * PRESERVE STATE BETWEEN CALLS.
 *
 * void getAmpleCmd(const char * pszPrompt_in,
 *                  char *       pszBuffer_out,
 *                  unsigned     uiBufferSize_in)
 *
 * void logAmpleCmds(FILE * pLogFP_in)
 *
 * void openAmpleCmdFile(char * pszFilename_in,
 *                       int    bQuiet_in)
 *
 * void closeAmpleCmdFile(void)
 *
 *****************************************************************************
 * edit history is in version.h
 *****************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
extern size_t strlen  P((const char *s));
#endif /* STDC_HEADERS */
#include "stample.h"
#include "opaclib.h"
/*
 *  File of file names for getAmpleCmd()
 */
static FILE *	pCommandFileFP_m = NULL;
/*
 *  optional log file used by getAmpleCmd()
 */
static FILE *	pLogFP_m = NULL;
/*
 *  work quietly without output to stderr
 */
static int	bQuiet_m = 0;

/*************************************************************************
 * NAME
 *    getAmpleCmd
 * DESCRIPTION
 *    If a command file is open, get a string from it.
 *    If it is open, but at EOF, return a NULL string.	This behavior
 *    assures that null answers will be fed to questions even if
 *    there are not enough blank lines at the end of the file.
 *    This implements the desired effect, which is that a -f
 *    file feeds the answers to all declaration file questions,
 *    even if it does not contain enough lines to cover them all.
 *    After declaration file questions are done, closeAmpleCmdFile()
 *    is used to switch input back to stdin for input and output
 *    file names.
 *    Else get a string from the standard input and echo appropriately.
 *    (Ensures screen sees it even when standard output is redirected).
 * RETURN VALUE
 *    none
 */
void getAmpleCmd( pszPrompt_in, pszBuffer_out, uiBufferSize_in)
const char *	pszPrompt_in;
char *		pszBuffer_out;	/* pointer to input character buffer */
unsigned	uiBufferSize_in;
{
if (!bQuiet_m || (pCommandFileFP_m == NULL))
	fprintf(stderr, "%s", pszPrompt_in);

if (pCommandFileFP_m != NULL)		/* If a command file is open */
	{
	if (fgets( pszBuffer_out, uiBufferSize_in, pCommandFileFP_m ) != NULL)
	pszBuffer_out[strlen(pszBuffer_out)-1] = NUL;	/* Cut off the CR */
	else				/* (EOF of command file) */
	*pszBuffer_out = NUL;			/* Set pszBuffer_out to null string */
	}
else					/* Else (no command file) */
	{
#ifdef _WINDOWS
	exitSafely(27);    /* 1.9r BJY */
#else
	if (fgets( pszBuffer_out, uiBufferSize_in, stdin ) != NULL)
	pszBuffer_out[strlen(pszBuffer_out)-1] = NUL;	/* Cut off the CR */
	else				/* Else (EOF of stdin) */
	*pszBuffer_out = NUL;			/* Set pszBuffer_out to null string */
#endif
	}

if (	((pCommandFileFP_m != NULL) || !isatty(fileno(stdin))) &&
	!bQuiet_m )
	fprintf(stderr, "%s\n", pszBuffer_out);		/* Echo to screen */
/*
 *  If logging file names, output to log file as well
 */
if (pLogFP_m != NULL)
	fprintf(pLogFP_m, "%s\n", pszBuffer_out);
}

/*************************************************************************
 * NAME
 *    logAmpleCmds
 * DESCRIPTION
 *    Set the log file for getAmpleCmd().
 * RETURN VALUE
 *    none
 */
void logAmpleCmds( pLogFP_in )
FILE *	pLogFP_in;
{
pLogFP_m = pLogFP_in;   /* Turn logging on or off */
}

/*************************************************************************
 * NAME
 *    openAmpleCmdFile
 * DESCRIPTION
 *    Open a file for getAmpleCmd to read file names from.
 * RETURN VALUE
 *    none
 */
void openAmpleCmdFile(pszFilename_in, bQuiet_in)
char *	pszFilename_in;
int	bQuiet_in;
{
if (pszFilename_in != NULL)			/* If command file given */
	pCommandFileFP_m = fopenAlways(pszFilename_in, "r");	/* Open file */
else
	pCommandFileFP_m = NULL;
bQuiet_m = bQuiet_in;
}

/*************************************************************************
 * NAME
 *    closeAmpleCmdFile
 * DESCRIPTION
 *    Close a file getAmpleCmd has been reading file names from, and set
 *    pCommandFileFP_m to NULL to signal getAmpleCmd() not to use it anymore.
 * RETURN VALUE
 *    none
 */
void closeAmpleCmdFile()
{
if (pCommandFileFP_m != NULL)		    /* If there was a command file */
	{
	fclose( pCommandFileFP_m );		    /* Close file */
	pCommandFileFP_m = NULL;
	}
}
