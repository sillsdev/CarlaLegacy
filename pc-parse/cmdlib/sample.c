/* SAMPLE.C - sample program for the CMD function library
 *******************************************************************
 * Copyright 1997 by the Summer Institute of Linguistics, Inc.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include "cmd.h"
#include "opaclib.h"

#define KW_CHDIR	 1
#define KW_CLOSE	 2
#define KW_DIRECTORY	 3
#define KW_EDIT		 4
#define KW_HELP		 5
#define KW_LOAD		 6
#define KW_LOG		 7
#define KW_PROCESS	 8
#define KW_QUIT		 9
#define KW_SAVE		10
#define KW_SET		11
#define KW_SHOW		12
#define KW_SYSTEM	13
#define KW_TAKE		14

static CmdKeyword asCommandTable_m[] = {
	{ "cd",		KW_CHDIR,	CMD_INVISIBLE },
	{ "chdir",		KW_CHDIR,	0 },
	{ "close",		KW_CLOSE,	0 },
	{ "directory",	KW_DIRECTORY,	0 },
	{ "edit",		KW_EDIT,	0 },
	{ "exit",		KW_QUIT,	CMD_INVISIBLE },
	{ "help",		KW_HELP,	0 },
	{ "load",		KW_LOAD,	0 },
	{ "log",		KW_LOG,		0 },
	{ "ls",		KW_DIRECTORY,	CMD_INVISIBLE },
	{ "process",	KW_PROCESS,	0 },
	{ "quit",		KW_QUIT,	0 },
	{ "save",		KW_SAVE,	0 },
	{ "set",		KW_SET,		0 },
	{ "show",		KW_SHOW,	0 },
	{ "system",		KW_SYSTEM,	0 },
	{ "take",		KW_TAKE,	0 }
	};
static int iCommandTableSize_m =
		(sizeof(asCommandTable_m) / sizeof(CmdKeyword));

static char szProcessUsage_m[] =
	"PROCESS <infile> <outfile> (no default filenames or types)";

#define KW_CODE		11
#define KW_COMMENT	12
#define KW_SILENT	13
#define KW_TIMING	14
#define KW_WARNING	15

static CmdKeyword asSetTable_m[] = {
	{ "code",		KW_CODE,	0 },
	{ "comment",	KW_COMMENT,	0 },
	{ "silent",		KW_SILENT,	0 },
	{ "timing",		KW_TIMING,	0 },
	{ "warnings",	KW_WARNING,	0 }
	};
static int iSetTableSize_m =
		(sizeof(asSetTable_m) / sizeof(CmdKeyword));

#define KW_OFF	16
#define KW_ON	17

static CmdKeyword asOnOffTable_m[] = {
	{ "false",		KW_OFF, CMD_INVISIBLE },
	{ "off",		KW_OFF, 0 },
	{ "on",		KW_ON,	0 },
	{ "true",		KW_ON,	CMD_INVISIBLE }
	};
static int iOnOffTableSize_m =
		(sizeof(asOnOffTable_m) / sizeof(CmdKeyword));

static int		bTiming_m	 = FALSE;
static int		cCommentMarker_m = ';';
static unsigned char	uiCode_m	 = 0xFF;

static char szWhitespace_m[7] = " \t\r\n\f\v";
static char szPrompt_m[] = "Command>";

/*******************************************************************
 * NAME
 *    do_help_set
 * DESCRIPTION
 *    execute a HELP SET command
 * RETURN VALUE
 *    none
 */
static void do_help_set(char * pszKeyword_in)
{
static char	szGenericSet_s[] =
	"Type HELP SET <parameter> for more help\n";

switch (lookupCmdKeyword(pszKeyword_in,
			 asSetTable_m, iSetTableSize_m, ""))
	{
	case CMD_NULL:
	fputs("\n\
set code      sets the byte code value for the PROCESS command\n\
set comment   sets the comment characters for TAKE files\n\
set silent    enables or disables error/warning messages\n\
set timing    enables or disables timing the PROCESS command\n\
set warnings  enables or disables warning messages\n\
\n", stderr);
	fputs(szGenericSet_s, stderr);
	break;
	case CMD_AMBIGUOUS:
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "HELP SET", pszKeyword_in);
	break;
	case CMD_INVALID:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "HELP SET", pszKeyword_in);
	break;
	case CMD_HELP:
	fputs(szGenericSet_s, stderr);
	break;
	case KW_CODE:
	fputs("\
SET CODE <number> sets the code byte for the PROCESS command to\n\
the indicated value.  The default code byte is 0xFF (255).\n",
		  stderr);
	break;
	case KW_COMMENT:
	fputs("\
SET COMMENT <char> sets the comment character to the indicated\n\
value.	If <char> is missing (or equal to the current comment\n\
character), then comment handling is disabled.	The default\n\
comment character is ';' (the semicolon).\n", stderr);
	break;
	case KW_SILENT:
	fputs("\
SET SILENT ON disables all error and warning messages.\n\
SET SILENT OFF enables all error and warning messages.\n\
The default is OFF.\n", stderr);
	break;
	case KW_TIMING:
	fputs("\
SET TIMING ON turns on timing mode, and SET TIMING OFF turns it\n\
off.  If timing mode is ON, then the elapsed time required to\n\
process a command is displayed when the command finishes.  If\n\
timing mode is OFF, then the elapsed time is not shown.	 The\n\
default is OFF.\n", stderr);
	break;
	case KW_WARNING:
	fputs("\
SET WARNING ON turns on warning mode.  SET WARNING OFF turns off\n\
warning mode. If warning mode is ON, then warning messages are\n\
displayed on the output. If warning mode is OFF, then no warning\n\
messages are displayed.	 The default is ON.\n", stderr);
	break;
	}
}

/*******************************************************************
 * NAME
 *    do_help_show
 * DESCRIPTION
 *    execute a HELP SHOW command
 * RETURN VALUE
 *    none
 */
static void do_help_show(char * pszKeyword_in)
{
static char	szGenericShow_s[] =
	"Type HELP SHOW <parameter> for more help\n";

switch (lookupCmdKeyword(pszKeyword_in,
			 asSetTable_m, iSetTableSize_m, ""))
	{
	case CMD_NULL:
	fputs("\n\
show code      shows the byte code value for the PROCESS command\n\
show comment   shows the comment characters for TAKE files\n\
show silent    shows whether error/warning messages are disabled\n\
show timing    shows whether timing of PROCESS command is enabled\n\
show warnings  shows whether warning messages are enabled\n\
\n\
show	       shows all of the above values\n\
\n", stderr);
	fputs(szGenericShow_s, stderr);
	break;
	case CMD_AMBIGUOUS:
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "HELP SHOW", pszKeyword_in);
	break;
	case CMD_INVALID:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "HELP SHOW", pszKeyword_in);
	break;
	case CMD_HELP:
	fputs(szGenericShow_s, stderr);
	break;
	case KW_CODE:
	fputs("\
SHOW CODE displays the code byte for the PROCESS command.\n\
", stderr);
	break;
	case KW_COMMENT:
	fputs("\
SHOW COMMENT displays the comment character.\n", stderr);
	break;
	case KW_SILENT:
	fputs("\
SHOW SILENT tells whether error and warning messages are disabled\n\
(not displayed on the screen).\n", stderr);
	break;
	case KW_TIMING:
	fputs("\
SHOW TIMING tells whether  the elapsed time required to process a\n\
command is displayed when the command finishes.\n", stderr);
	break;
	case KW_WARNING:
	fputs("\
SHOW WARNING tells whether warning messages are displayed on the\n\
screen.\n", stderr);
	break;
	}
}

/*******************************************************************
 * NAME
 *    do_help
 * DESCRIPTION
 *    execute the HELP command
 * RETURN VALUE
 *    none
 */
static void do_help(char * pszKeyword_in)
{
static char	szGeneric_s[] =
	"Type HELP <command> for more help on a particular command\n";
char *	pszProg;
char *	pszFile;

if ((pszCmdProgramName_g == NULL) || (*pszCmdProgramName_g == NUL))
	{
	pszProg = "the program";
	pszFile = "cmd";
	}
else
	{
	pszProg = pszCmdProgramName_g;
	pszFile = pszCmdProgramName_g;
	}
switch (lookupCmdKeyword(pszKeyword_in,
			 asCommandTable_m, iCommandTableSize_m,
			 ""))
	{
	case CMD_NULL:
	fputs("\n\
chdir (or cd)	   changes the current directory\n\
close		   closes the log file\n\
directory (or ls)  lists the files in the current directory\n\
edit		   edits a file with your favorite editor\n\
help		   provides nice messages like this one\n\
load		   ...\n\
log		   opens a log file\n\
process		   processes one file to create another\n\
quit (or exit)	   exits the program\n\
save		   ...\n\
set		   sets a program parameter\n\
show		   shows the settings of one or more parameters\n\
system (or !)	   executes a command in a subshell\n\
take (or @)	   reads (\"takes\") commands from a file\n\
\n", stderr);
	fputs(szGeneric_s, stderr);
	break;
	case CMD_AMBIGUOUS:
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "HELP", pszKeyword_in);
	break;
	case CMD_INVALID:
	if (strcmp(pszKeyword_in, "!") == 0)
		goto help_system;
	if (strcmp(pszKeyword_in, "@") == 0)
		goto help_take;
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "HELP", pszKeyword_in);
	break;
	case CMD_HELP:		/* ? - list of commands displayed */
	fputs(szGeneric_s, stderr);
	break;
	case KW_CHDIR:
	fputs("\
CHDIR <pathname> changes the current directory.	 You can give a\n\
full path starting with a / (for example,\n\
\"/u/evan/pckimmo/englex/new\"); a path starting with ../ which\n\
indicates the directory above the current one; and so on.\n\
Directories are separated by the / character.\n", stderr);
	break;
	case KW_CLOSE:
	fputs("\
CLOSE closes the log file opened by a LOG command.\n", stderr);
	break;
	case KW_EDIT:
	fputs("\
EDIT <file> attempts to edit a file using the program indicated\n\
by the environment variable EDITOR.  If this environment variable\n\
is not defined, then emacs is used to edit the file.\n", stderr);
	break;
	case KW_DIRECTORY:
	fputs("\
DIRECTORY lists the contents of the current directory.\n", stderr);
	break;
	case KW_HELP:
	fprintf(stderr, "\
HELP [<command-name>] displays a description of a command.  If\n\
HELP is typed by itself, %s displays a list of commands with\n\
short descriptions of each command.\n", pszProg);
	break;
	case KW_LOAD:
	fputs("\
LOAD <filename> ... (has not been written)\n", stderr);
	break;
	case KW_LOG:
	fprintf(stderr, "\
LOG [<file>] opens a log file.	If a filename is given on the\n\
same line as the LOG command, then that file is used for the log\n\
file.  Any previously existing file with the same name will be\n\
overwritten.  If no filename is provided, then the file %s.log\n\
in the current directory is used for the log file.\n\
\n\
Use CLOSE to stop recording in a log file.  If a LOG command is\n\
given when a log file is already open, then the earlier log file\n\
is closed before the new log file is opened.\n", pszFile);
	break;
	case KW_PROCESS:
	fputs("\
PROCESS <infile> <outfile> processes the input file to create the\n\
output file.\n", stderr);
	break;
	case KW_QUIT:
	fputs("\
Either EXIT or QUIT terminates the program.\n", stderr);
	break;
	case KW_SAVE:
	fputs("\
SAVE <filename> ... (has not been written)\n", stderr);
	break;
	case KW_SET:
	do_help_set( strtok(NULL, szWhitespace_m) );
	break;
	case KW_SHOW:
	do_help_show( strtok(NULL, szWhitespace_m) );
	break;
	case KW_SYSTEM:
help_system:
	fprintf(stderr, "\
SYSTEM [<command>] allows the user to execute an operating system\n\
command (such as listing the files in the current directory) from\n\
within %s.  If no system-level command is given on the\n\
line with the SYSTEM command, then %s is pushed into the\n\
background and a new system command processor (shell) is started.\n\
Control is usually returned to %s in this case by typing\n\
EXIT as the operating system command.\n\
\n\
! (exclamation point) is a synonym for SYSTEM.\n",
		pszProg, pszProg, pszProg);
	break;
	case KW_TAKE:
help_take:
	fprintf(stderr, "\
TAKE [<file>] redirects command input to the specified file.\n\
\n\
The default filetype extension for TAKE is \".tak\", and the\n\
default filename is \"%s.tak\" (without the quotation marks,\n\
of course).\n\
\n\
TAKE files can be nested three deep.  That is, the user types\n\
TAKE file1, file1 contains the command TAKE file2, and file2 has\n\
the command TAKE file3.\n\
It would be an error for file3 to contain a TAKE command.  This\n\
should not prove to be a serious limitation.\n", pszFile);
	break;
	}
}

/*******************************************************************
 * NAME
 *    do_set
 * DESCRIPTION
 *    execute the SET command
 * RETURN VALUE
 *    none
 */
static void do_set(char * pszKeyword_in)
{
char *		pszArg;
char *		p;
unsigned	uiVal;

switch (lookupCmdKeyword(pszKeyword_in,
			 asSetTable_m, iSetTableSize_m, ""))
	{
	case CMD_NULL:
	displayNumberedMessage(&sCmdMissingKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "SET");
	break;
	case CMD_AMBIGUOUS:
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "SET", pszKeyword_in);
	break;
	case CMD_INVALID:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "SET", pszKeyword_in);
	break;
	case CMD_HELP:			/* ? */
	fprintf(stderr, "Type HELP SET for more help\n");
	break;
	case KW_CODE:
	pszArg = strtok(NULL, szWhitespace_m);
	if ((pszArg == NULL) || (*pszArg == NUL))
		displayNumberedMessage(&sCmdMissingArgument_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET CODE");
	else
		{
		uiVal = strtoul(pszArg, &p, 0);
		if ((*p != NUL) || (uiVal > 255))
		{
		displayNumberedMessage(&sCmdBadArgument_g,
					   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET CODE", pszArg);
		}
		else
		uiCode_m = uiVal;
		}
	break;
	case KW_COMMENT:
	pszArg = strtok(NULL, szWhitespace_m);
	if ((pszArg == NULL) || (*pszArg == NUL))
		displayNumberedMessage(&sCmdMissingArgument_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				   "SET COMMENT");
	else
		cCommentMarker_m = *pszArg;
	break;
	case KW_SILENT:
	pszArg = strtok(NULL, szWhitespace_m);
	switch (lookupCmdKeyword(pszArg,
				 asOnOffTable_m, iOnOffTableSize_m,
				 ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET SILENT");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET SILENT", pszArg);
		break;
		case CMD_INVALID:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET SILENT", pszArg);
		break;
		case CMD_HELP:
		break;
		case KW_ON:
		bCmdSilentMessages_g = TRUE;
		break;
		case KW_OFF:
		bCmdSilentMessages_g = FALSE;
		break;
		}
	break;
	case KW_TIMING:
	pszArg = strtok(NULL, szWhitespace_m);
	switch (lookupCmdKeyword(pszArg,
				 asOnOffTable_m, iOnOffTableSize_m,
				 ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TIMING");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TIMING", pszArg);
		break;
		case CMD_INVALID:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET TIMING", pszArg);
		break;
		case CMD_HELP:
		break;
		case KW_ON:
		bTiming_m = TRUE;
		break;
		case KW_OFF:
		bTiming_m = FALSE;
		break;
		}
	break;
	case KW_WARNING:
	pszArg = strtok(NULL, szWhitespace_m);
	switch (lookupCmdKeyword(pszArg,
				 asOnOffTable_m, iOnOffTableSize_m,
				 ""))
		{
		case CMD_NULL:
		displayNumberedMessage(&sCmdMissingKeyword_g,
					   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET SILENT");
		break;
		case CMD_AMBIGUOUS:
		displayNumberedMessage(&sCmdAmbiguousKeyword_g,
					   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET SILENT", pszArg);
		break;
		case CMD_INVALID:
		displayNumberedMessage(&sCmdBadKeyword_g,
					   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
					   NULL, 0,
					   "SET SILENT", pszArg);
		break;
		case CMD_HELP:
		break;
		case KW_ON:
		bCmdShowWarnings_g = TRUE;
		break;
		case KW_OFF:
		bCmdShowWarnings_g = FALSE;
		break;
		}
	break;
	}
}

/*******************************************************************
 * NAME
 *    do_show
 * DESCRIPTION
 *    execute the SHOW command
 * RETURN VALUE
 *    none
 */
static void do_show(char * pszKeyword_in)
{
switch (lookupCmdKeyword(pszKeyword_in,
			 asSetTable_m, iSetTableSize_m, ""))
	{
	case CMD_NULL:
	fprintf(stderr, "CODE	 is %x\n", uiCode_m);
	if (cCommentMarker_m)
		fprintf(stderr, "COMMENT is %c\n", cCommentMarker_m);
	else
		fprintf(stderr, "COMMENT is not set\n");
	fprintf(stderr, "SILENT	 is %s\n",
		bCmdSilentMessages_g ? "ON" : "OFF");
	fprintf(stderr, "TIMING	 is %s\n",
		bCmdSilentMessages_g ? "ON" : "OFF");
	fprintf(stderr, "WARNING is %s\n",
		bCmdShowWarnings_g ? "ON" : "OFF");
	break;
	case CMD_AMBIGUOUS:
	displayNumberedMessage(&sCmdAmbiguousKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "SHOW", pszKeyword_in);
	break;
	case CMD_INVALID:
	displayNumberedMessage(&sCmdBadKeyword_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  "SHOW", pszKeyword_in);
	break;
	case CMD_HELP:
	fprintf(stderr, "Type HELP SHOW for more help\n");
	break;
	case KW_CODE:
	fprintf(stderr, "CODE is %x\n", uiCode_m);
	break;
	case KW_COMMENT:
	if (cCommentMarker_m)
		fprintf(stderr, "COMMENT is %c\n", cCommentMarker_m);
	else
		fprintf(stderr, "COMMENT is not set\n");
	break;
	case KW_SILENT:
	fprintf(stderr, "SILENT is %s\n",
		bCmdSilentMessages_g ? "ON" : "OFF");
	break;
	case KW_TIMING:
	fprintf(stderr, "TIMING is %s\n",
		bCmdSilentMessages_g ? "ON" : "OFF");
	break;
	case KW_WARNING:
	fprintf(stderr, "WARNING is %s\n",
		bCmdShowWarnings_g ? "ON" : "OFF");
	break;
	}
}

/*******************************************************************
 * NAME
 *    do_process
 * DESCRIPTION
 *    process the input file to create the output file
 * RETURN VALUE
 *    none
 */
static void do_process(char * pszInput_in, char * pszOutput_in)
{
time_t	iTime = time(NULL);
int	c;
FILE *	pInputFP;
char *	pszInputFile;
char *	pszOutputFile;

if (pszInput_in == NULL)
	{
	displayNumberedMessage(&sCmdMissingInputFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0,
			  "PROCESS");
	return;
	}
if (pszOutput_in == NULL)
	{
	displayNumberedMessage(&sCmdMissingOutputFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0,
			  "PROCESS");
	return;
	}
if (	wantCmdHelp(pszInput_in,  szProcessUsage_m) ||
	wantCmdHelp(pszOutput_in, szProcessUsage_m) )
	return;
if (getCmdTakeLevel() != 0)
	{
	pszInputFile  = buildAdjustedFilename(pszInput_in,
					  getCmdTakeFile(), NULL);
	pszOutputFile = buildAdjustedFilename(pszOutput_in,
					  getCmdTakeFile(), NULL);
	}
else
	{
	pszInputFile  = duplicateString(pszInput_in);
	pszOutputFile = duplicateString(pszOutput_in);
	}
pInputFP = fopen( pszInputFile, "rb");
if (pInputFP == NULL)
	{
	displayNumberedMessage(&sCmdBadInputFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0,
			  pszInputFile, "PROCESS");
	}
else
	{
	pCmdOutputFP_g = fopen( pszOutputFile, "wb" );
	if (pCmdOutputFP_g == NULL)
	{
	displayNumberedMessage(&sCmdBadOutputFile_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
			  pszOutputFile, "PROCESS");
	}
	else
	{
	if (bTiming_m)
		startCmdTiming();
	if (pCmdLogFP_g != NULL)
		{
		fprintf(pCmdLogFP_g,
			"Processing %s to create %s (log = %s) at %s",
			pszInput_in, pszOutput_in,
			pszCmdLogFile_g ? pszCmdLogFile_g : "?",
			ctime(&iTime));
		}
	while ((c = fgetc(pInputFP)) != EOF)
		{
		c ^= uiCode_m;
		fputc(c, pCmdOutputFP_g);
		}
	fclose(pCmdOutputFP_g);
	pCmdOutputFP_g = NULL;
	if (bTiming_m)
		{
		stopCmdTiming();
		showCmdTiming();
		}
	}
	fclose(pInputFP);
	}
freeMemory( pszInputFile );
freeMemory( pszOutputFile );
}

/*******************************************************************
 * NAME
 *    do_load
 * DESCRIPTION
 *    execute a LOAD command
 * RETURN VALUE
 *    none
 */
static void do_load(char * pszFilename_in)
{
if ((pszFilename_in == NULL) || (*pszFilename_in == NUL))
	{
	displayNumberedMessage(&sCmdMissingInputFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0,
			  "LOAD");
	return;
	}
/* left as an exercise for the reader :-) */
fprintf(stderr, "load %s is not implemented\n", pszFilename_in);
}

/*******************************************************************
 * NAME
 *    do_save
 * DESCRIPTION
 *    execute a SAVE command
 * RETURN VALUE
 *    none
 */
static void do_save(char * pszFilename_in)
{
if ((pszFilename_in == NULL) || (*pszFilename_in == NUL))
	{
	displayNumberedMessage(&sCmdMissingOutputFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0,
			  "SAVE");
	return;
	}
/* left as an exercise for the reader :-) */
fprintf(stderr, "save %s is not implemented\n", pszFilename_in);
}

/*******************************************************************
 * NAME
 *    do_command
 * DESCRIPTION
 *    read and execute a command
 * RETURN VALUE
 *    TRUE (1) to continue, FALSE (0) to stop the program
 */
static int do_command()
{
char *	pszCommand;
char *	pszSaved;
char *	pszArg;
char *	p;

pszCommand = getCmdString(NULL, szPrompt_m, cCommentMarker_m);
if (pszCommand == NULL)
	return 0;			/* end of input == quit */
if (*pszCommand == NUL)
	return 1;			/* ignore empty commands */
/*
 *  save a copy of the command line
 */
pszSaved = duplicateString(pszCommand + strspn(pszCommand,
						   szWhitespace_m));
/*
 *  parse the first keyword of the command
 */
pszArg = strtok(pszCommand, szWhitespace_m);
switch (lookupCmdKeyword(pszArg,
			 asCommandTable_m, iCommandTableSize_m, ""))
	{
	case CMD_NULL:
	break;			/* ignore empty commands */

	case CMD_AMBIGUOUS:
	displayNumberedMessage(&sCmdAmbiguous_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0, pszCommand);
	break;

	case CMD_INVALID:
	if (*pszArg == '!')
		{
		pszArg  = pszSaved + 1;
		pszArg += strspn(pszArg, szWhitespace_m);
		doCmdSystem( pszArg );
		}
	else if (*pszArg == '@')
		{
		if (pszArg[1] == NUL)
		pszArg = strtok(NULL, szWhitespace_m);
		else
		++pszArg;
		doCmdTake( pszArg );
		}
	else if (getCmdTakeLevel() != 0)
		{
		displayNumberedMessage(&sCmdErrorInTake_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0,
				  pszArg);
		closeCmdTake();
		}
	else
		displayNumberedMessage(&sCmdInvalid_g,
				   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
				   NULL, 0, pszArg);
	break;

	case CMD_HELP:		/* ? - list of commands displayed */
	fprintf(stderr, "Type HELP for more help\n");
	break;

	case KW_CHDIR:
	pszArg = strtok(NULL, szWhitespace_m);
	doCmdChdir( pszArg );
	break;

	case KW_CLOSE:
	doCmdClose();
	break;

	case KW_EDIT:
	pszArg = strtok(NULL, szWhitespace_m);
	if (getCmdTakeLevel() != 0)
		pszArg = buildAdjustedFilename(pszArg, getCmdTakeFile(),
					   NULL);
	doCmdEdit( pszArg );
	freeMemory( pszArg );
	break;

	case KW_DIRECTORY:
	pszArg	= pszSaved;
	pszArg += strcspn(pszArg, szWhitespace_m);
	pszArg += strspn(pszArg, szWhitespace_m);
	doCmdDirectory( pszArg );
	break;

	case KW_HELP:
	do_help( strtok(NULL, szWhitespace_m) );
	break;

	case KW_LOAD:
	pszArg = strtok(NULL, szWhitespace_m);
	pszArg = setCmdFilename( pszArg, "settings.ini", ".ini");
	if (getCmdTakeLevel() != 0)
		{
		p = buildAdjustedFilename(pszArg, getCmdTakeFile(),
					  NULL);
		freeMemory( pszArg );
		pszArg = p;
		}
	do_load( pszArg );
	freeMemory( pszArg );
	break;

	case KW_LOG:
	doCmdLog( strtok(NULL, szWhitespace_m) );
	break;

	case KW_PROCESS:
	pszArg = strtok(NULL,szWhitespace_m);
	do_process(pszArg, strtok(NULL, szWhitespace_m));
	break;

	case KW_QUIT:			/* QUIT or EXIT */
	while (closeCmdTake())
		;
	freeMemory(pszSaved);
	return 0;

	case KW_SAVE:
	pszArg = strtok(NULL, szWhitespace_m);
	pszArg = setCmdFilename( pszArg, "settings.ini", ".ini");
	if (getCmdTakeLevel() != 0)
		{
		p = buildAdjustedFilename(pszArg, getCmdTakeFile(),
					  NULL);
		freeMemory( pszArg );
		pszArg = p;
		}
	do_save( pszArg );
	freeMemory( pszArg );
	break;

	case KW_SET:
	do_set( strtok(NULL, szWhitespace_m) );
	break;

	case KW_SHOW:
	do_show( strtok(NULL, szWhitespace_m) );
	break;

	case KW_SYSTEM:
	pszArg	= pszSaved;
	pszArg += strcspn(pszArg, szWhitespace_m);
	pszArg += strspn(pszArg, szWhitespace_m);
	doCmdSystem( pszArg );
	break;

	case KW_TAKE:
	pszArg = strtok(NULL, szWhitespace_m);
	if (getCmdTakeLevel() != 0)
		pszArg = buildAdjustedFilename(pszArg, getCmdTakeFile(),
					   NULL);
	doCmdTake( pszArg );
	freeMemory( pszArg );
	break;
	}
freeMemory(pszSaved);
return 1;
}

/*******************************************************************
 * NAME
 *    main
 * DESCRIPTION
 *    the main procedure for this program
 * RETURN VALUE
 *    1 to indicate successful execution of the program
 */
int main(int argc, char ** argv)
{
char *	p;
/*
 *  establish the program basename
 */
pszCmdProgramName_g = strrchr(argv[0], '/');
if (pszCmdProgramName_g == NULL)
	pszCmdProgramName_g = argv[0];
else
	++pszCmdProgramName_g;
if ((pszCmdProgramName_g == NULL) || (*pszCmdProgramName_g == NUL))
	pszCmdProgramName_g = "unknown";
pszCmdProgramName_g = duplicateString(pszCmdProgramName_g);
if ((p = strrchr(pszCmdProgramName_g, '.')) != NULL)
	*p = NUL;
/*
 *  set up for error or SIGINT trapping
 */
if (setjmp(sCmdJmpBuf_g) != 0)
	{
	fputs("\nRETURNING TO PC-KIMMO COMMAND PROCESSING\n\n", stderr);
	}
else
	{
#ifdef USE_SIGNAL
#ifdef SIGINT
	signal( SIGINT, handleCmdSigint );
#endif
#endif
	}
/*
 *  read and execute commands until QUIT or EXIT
 */
fprintf(stderr, "%s - test program for the CMD function library\n",
	argv[0]);
while (do_command())
	;
return 1;
}
