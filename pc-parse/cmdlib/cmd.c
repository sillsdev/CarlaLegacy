/* CMD.C - interactive user interface low-level functions
 ***************************************************************************
 *
 * int lookupCmdKeyword(char *		   pszCommand_in,
 *			const CmdKeyword * pKeywordTable_in,
 *			int		   iTableSize_in,
 *			char *		   pszHelp_in)
 *
 * char * getCmdString(const char *  pszCommand_in,
 *		       const char *  pszPrompt_in,
 *		       int	     cComment_in)
 *
 * void doCmdTake(char * pszFilename_in)
 *
 * int closeCmdTake(void)
 *
 * int getCmdTakeLevel(void)
 *
 * char * getCmdTakeFile(void)
 *
 ***************************************************************************
 * Copyright 1989, 2000 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>

#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern char * strchr  P((const char * s, int c));
#endif /* STDC_HEADERS */

#include "opaclib.h"
#include "cmd.h"

extern char *	strlwr		       P((char * pszString_io));

extern char *	promptUser	       P((const char * pszPrompt_in));
extern char *	readLineFromFile       P((FILE *     pInputFP_in,
					  unsigned * puiLineNumber_io,
					  int	     cCommentChar_in));
extern char *	trimTrailingWhitespace P((char * pszString_io));

#define NUL '\0'

static char szHelpBuffer_m[81];	/* Help string buffer */
static int iHelpColumn_m;	/* Current help column number */

/*****************************************************************************
 * NAME
 *    CmdTakeFile
 * DESCRIPTION
 *    data structure for storing the information about a TAKE file
 */
typedef struct {
	FILE *	pInputFP;	/* input FILE pointer */
	char *	pszFilename;	/* name of the TAKE file */
	unsigned	uiLineNumber;	/* current line number in the TAKE file */
	} CmdTakeFile;
#define CMD_TAKE_LEVELS 3	/* Maximum nesting of TAKE files */

static CmdTakeFile asTake_m[CMD_TAKE_LEVELS];
static int iTakeLevel_m = -1;
static char szTakeUsage_m[] =
	"TAKE [<file>] (default name is %s.tak, default type is .tak)";

#ifdef applec
#pragma segment S_cmdlib
#endif

/*****************************************************************************
 * NAME
 *    clrhlp
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Initialize/Clear the help line buffer
 * RETURN VALUE
 *    none
 */
static void clrhlp()
{
memset(szHelpBuffer_m, NUL, sizeof(szHelpBuffer_m));
iHelpColumn_m = 0;
}

/*****************************************************************************
 * NAME
 *    dmphlp
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Dump the help line buffer.
 * RETURN VALUE
 *    none
 */
static void dmphlp()
{
if (szHelpBuffer_m[0] != NUL)
	{
	fprintf(stderr, "%s\n",szHelpBuffer_m);
	clrhlp();
	}
}

/*****************************************************************************
 * NAME
 *    addhlp
 * ARGUMENTS
 *    s - pointer to a character string
 * DESCRIPTION
 *    Add a string to the help line buffer
 * RETURN VALUE
 *    none
 */
static void addhlp(s)
register char *s;
{
int hx;

if (iHelpColumn_m == 4)
	dmphlp();
strncat(szHelpBuffer_m, s,
	sizeof(szHelpBuffer_m) - strlen(szHelpBuffer_m) - 1);
szHelpBuffer_m[iHelpColumn_m * 20 + 20] = NUL;
hx = strlen(szHelpBuffer_m);
if (hx >= iHelpColumn_m * 20 + 20)
	{
	if (iHelpColumn_m < 3)
	{
	szHelpBuffer_m[iHelpColumn_m * 20 + 18] = '+';
	szHelpBuffer_m[iHelpColumn_m * 20 + 19] = ' ';
	}
	else
	{
	szHelpBuffer_m[iHelpColumn_m * 20 + 19] = '+';
	}
	szHelpBuffer_m[iHelpColumn_m * 20 + 20] = NUL;
	}
else if (iHelpColumn_m < 3)
	{
	while (hx < iHelpColumn_m * 20 + 20)
	szHelpBuffer_m[hx++] = ' ';
	}
++iHelpColumn_m;
}

/*****************************************************************************
 * NAME
 *    lookupCmdKeyword
 * DESCRIPTION
 *    Search the given table of keywords for the command.  The keyword table
 *    must be arranged in ascending alphabetical order, and all letters must
 *    be lowercase.
 *
 *    A match is successful if the target matches a keyword exactly, or if
 *    the target is a prefix of exactly one keyword.  It is ambiguous if the
 *    target matches two or more keywords from the table.
 *
 * RETURN VALUE
 *    the keyword's associated value (zero or greater) if found, or
 *      CMD_NULL       if nothing to look up (target was null)
 *      CMD_AMBIGUOUS  if ambiguous
 *      CMD_INVALID    if not found
 *      CMD_HELP       if '?' is found in word (after printing keyword list)
 */
int lookupCmdKeyword(pszCommand_in, pKeywordTable_in, iTableSize_in,pszHelp_in)
char *			pszCommand_in;	/* the command string */
const CmdKeyword *	pKeywordTable_in; /* a table of CmdKeyword's */
int			iTableSize_in;	/* the number of keywords in the
					   table */
char *			pszHelp_in;	/* preface string for help message (if
					   empty, then '?' is valid; if NULL,
					   then no help at all) */
{
int	i;
size_t	uiLength;
int	j;
int	num;
int	num_lines;
int	line;
/*
 *  if pszCommand_in is null, return code CMD_NULL.  Otherwise, lowercase it.
 */
if ((pszCommand_in == NULL) || (*pszCommand_in == NUL) || (iTableSize_in < 1))
	return(CMD_NULL);
strlwr(pszCommand_in);
uiLength = strlen(pszCommand_in);
/*
 *  If '?' found in target, return code CMD_HELP
 */
if (strchr(pszCommand_in,'?') != NULL)
	{
	if (pszHelp_in == NULL)
	return(CMD_HELP);
	if (*pszHelp_in == NUL)
	fprintf(stderr, "One of the following:\n");
	else
	fprintf(stderr, "%s, one of the following:\n",pszHelp_in);
	for ( num = 0, i = 0 ; i < iTableSize_in ; i++ )
	{
	if (!(pKeywordTable_in[i].iFlags & (CMD_INVISIBLE | CMD_DISABLED)))
		++num;
	}
	num_lines = (num + 3) / 4;
	clrhlp();
	for ( line = 0 ; line < num_lines ; ++line )
	{
	for ( j = 0, i = 0 ; i < iTableSize_in ; i++ )
		{
		if (!(pKeywordTable_in[i].iFlags & (CMD_INVISIBLE | CMD_DISABLED)))
		{
		if (	((j / num_lines) == iHelpColumn_m) &&
			((j % num_lines) == line) )
			addhlp(pKeywordTable_in[i].pszKeyword);
		++j;
		}
		}
	dmphlp();
	}
	return(CMD_HELP);
	}
/*
 *  Not null, look it up
 */
for ( i = 0 ; i < iTableSize_in-1 ; ++i )
	{
	if (pKeywordTable_in[i].iFlags & CMD_DISABLED)
	continue;
	if (strcmp(pKeywordTable_in[i].pszKeyword, pszCommand_in) == 0)
	return( pKeywordTable_in[i].iValue );
	if (strncmp(pKeywordTable_in[i].pszKeyword, pszCommand_in, uiLength) == 0)
	{
	if (strncmp(pKeywordTable_in[i+1].pszKeyword,
						 pszCommand_in, uiLength) == 0)
		return(CMD_AMBIGUOUS);
	else
		return(pKeywordTable_in[i].iValue);
	}
	}
/*
 *  Last (or only) element
 */
if (pKeywordTable_in[iTableSize_in-1].iFlags & CMD_DISABLED)
	return(CMD_INVALID);
if (strncmp(pKeywordTable_in[iTableSize_in-1].pszKeyword,
						 pszCommand_in, uiLength) == 0)
	return(pKeywordTable_in[iTableSize_in-1].iValue);
else
	return(CMD_INVALID);
}

/*****************************************************************************
 * NAME
 *    getCmdString
 * DESCRIPTION
 *    get a command from the appropriate place, in this order of priority:
 *	1. the command argument
 *	2. the "take" file indicated by iTakeLevel_m
 *	3. the keyboard (stdin)
 *    "take" files are closed, and the current take level decremented, if EOF
 *    is detected
 * RETURN VALUE
 *    pointer to the next command string (which is overwritten by next call)
 */
char * getCmdString(pszCommand_in, pszPrompt_in, cComment_in)
const char *	pszCommand_in;	/* pointer to a literal command string, or
				   NULL */
const char *	pszPrompt_in;
int		cComment_in;
{
char *	pszCommand;

while ((iTakeLevel_m >= 0) && feof(asTake_m[iTakeLevel_m].pInputFP))
	{
	/*
	 *  if end of take file, close it, free allocated strings, and forget it
	 */
	fclose(asTake_m[iTakeLevel_m].pInputFP);
	asTake_m[iTakeLevel_m].pInputFP = NULL;
	freeMemory(asTake_m[iTakeLevel_m].pszFilename);
	asTake_m[iTakeLevel_m].pszFilename = NULL;
	--iTakeLevel_m;
	}
fflush(stdout);		/* force possible screen output before the prompt */
if (pszCommand_in != NULL)
	{
	/*
	 *  use the provided command
	 */
	pszCommand = (char *)pszCommand_in;
	if (!bCmdSilentMessages_g)
	fprintf(stderr, "%s%s\n", pszPrompt_in, pszCommand);
	}
else if (iTakeLevel_m > -1)
	{
	/*
	 *  read the command from a "take" file
	 */
	pszCommand = readLineFromFile( asTake_m[iTakeLevel_m].pInputFP,
				   &asTake_m[iTakeLevel_m].uiLineNumber,
				   cComment_in);
	if (pszCommand == NULL)
	return("");		/* catch the EOF next time around */
	pszCommand += strspn(pszCommand, " \t\r\n\f\v");
	if (!bCmdSilentMessages_g)
	fprintf(stderr, "%s%s\n", pszPrompt_in, pszCommand);
	}
else
	{
	/*
	 *  read the command from the keyboard
	 */
	pszCommand = promptUser(pszPrompt_in);
	if (pszCommand)
	pszCommand += strspn(pszCommand, " \t\r\n\f\v");
	}
if (pszCommand)
	trimTrailingWhitespace(pszCommand);
return( pszCommand );
}

/*****************************************************************************
 * NAME
 *    doCmdTake
 * DESCRIPTION
 *    open a "take" file for future use
 * RETURN VALUE
 *    none
 */
void doCmdTake(pszFilename_in)
const char * pszFilename_in;
{
char *	pszFile;
char *	p;
char	szBuffer[128];

if (iTakeLevel_m >= CMD_TAKE_LEVELS-1)
	{
	displayNumberedMessage(&sCmdTooDeepTake_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0);
	return;
	}
if ((pszCmdProgramName_g != NULL) && (*pszCmdProgramName_g != NUL))
	sprintf(szBuffer, szTakeUsage_m, pszCmdProgramName_g);
else
	sprintf(szBuffer, szTakeUsage_m, "cmd");
if (wantCmdHelp(pszFilename_in, szBuffer))
	return;
if ((pszCmdProgramName_g != NULL) && (*pszCmdProgramName_g != NUL))
	sprintf(szBuffer, "%s.tak", pszCmdProgramName_g);
else
	strcpy(szBuffer, "cmd.tak");
pszFile = setCmdFilename(pszFilename_in, szBuffer, ".tak");
if (iTakeLevel_m > -1)
	{
	p = buildAdjustedFilename(pszFile,
				  asTake_m[iTakeLevel_m].pszFilename,
				  NULL);
	freeMemory( pszFile );
	pszFile = p;
	}
++iTakeLevel_m;
asTake_m[iTakeLevel_m].pInputFP = fopen(pszFile, "r");
if (asTake_m[iTakeLevel_m].pInputFP == NULL)
	{
	displayNumberedMessage(&sCmdBadInputFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0,
			  pszFile, "TAKE");
	--iTakeLevel_m;
	freeMemory(pszFile);
	}
else
	{
	asTake_m[iTakeLevel_m].uiLineNumber = 1;
	asTake_m[iTakeLevel_m].pszFilename	= pszFile;
	}
}

/*****************************************************************************
 * NAME
 *    closeCmdTake
 * DESCRIPTION
 *    if a "take" file open, close it and adjust the take level
 * RETURN VALUE
 *    the take level after closing the "take" file: 0 means keyboard input
 */
int closeCmdTake()
{
if (iTakeLevel_m >= 0)
	{
	fclose(asTake_m[iTakeLevel_m].pInputFP);
	freeMemory(asTake_m[iTakeLevel_m].pszFilename);
	asTake_m[iTakeLevel_m].pInputFP     = NULL;
	asTake_m[iTakeLevel_m].pszFilename  = NULL;
	asTake_m[iTakeLevel_m].uiLineNumber = 0;
	--iTakeLevel_m;
	}
return iTakeLevel_m + 1;
}

/*****************************************************************************
 * NAME
 *    getCmdTakeLevel
 * DESCRIPTION
 *    get the current take level
 * RETURN VALUE
 *    the current take level: 0 means keyboard input
 */
int getCmdTakeLevel()
{
return iTakeLevel_m + 1;
}

/*****************************************************************************
 * NAME
 *    getCmdTakeFile
 * DESCRIPTION
 *    get the current take file
 * RETURN VALUE
 *    the name of current take level: NULL means keyboard input
 */
char * getCmdTakeFile()
{
if (iTakeLevel_m >= 0)
	return asTake_m[iTakeLevel_m].pszFilename;
else
	return NULL;
}
