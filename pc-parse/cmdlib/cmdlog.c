/* CMDLOG.C - functions to support log file commands
 ***************************************************************************
 *
 * void doCmdLog(const char * pszFilename_in)
 * void doCmdClose(void)
 *
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>

#include "allocmem.h"
#include "cmd.h"

#ifndef NUL
#define NUL '\0'
#endif

#ifdef applec
#pragma segment S_cmdlib
#endif

/*****************************************************************************
 * NAME
 *    doCmdLog
 * DESCRIPTION
 *    Execute a LOG [<filename>] command.
 * RETURN VALUE
 *    none
 */
void doCmdLog(pszFilename_in)
const char *	pszFilename_in;	/* pointer to an optional log file name */
{
char buffer[80];
char *	pszFilename;

sprintf(buffer, "LOG [<file>] (default is %s.log)",
	pszCmdProgramName_g ? pszCmdProgramName_g : "log");
if (wantCmdHelp(pszFilename_in, buffer))
	return;
if (pCmdLogFP_g != NULL)
	fclose(pCmdLogFP_g);
if (pszCmdLogFile_g != NULL)
	{
	displayNumberedMessage(&sCmdClosingLog_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0, pszCmdLogFile_g);
	freeMemory(pszCmdLogFile_g);
	pszCmdLogFile_g = NULL;
	}
sprintf(buffer, "%s.log", pszCmdProgramName_g ? pszCmdProgramName_g : "log");

pszFilename = setCmdFilename(pszFilename_in, buffer, ".log");
pCmdLogFP_g = fopen(pszFilename,"w");
if (pCmdLogFP_g == NULL)
	{
	displayNumberedMessage(&sCmdBadOutputFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0, pszFilename, "LOG");
	freeMemory(pszFilename);
	}
else
	pszCmdLogFile_g = pszFilename;
}

/*****************************************************************************
 * NAME
 *    doCmdClose
 * DESCRIPTION
 *    Execute a CLOSE command.
 * RETURN VALUE
 *    none
 */
void doCmdClose()
{
if ((pCmdLogFP_g == NULL) && (pszCmdLogFile_g == NULL))
	{
	displayNumberedMessage(&sCmdNoLogFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0);
	return;
	}
if (pCmdLogFP_g != NULL)
	{
	fclose(pCmdLogFP_g);
	pCmdLogFP_g = NULL;
	}
if (pszCmdLogFile_g != NULL)
	{
	freeMemory(pszCmdLogFile_g);
	pszCmdLogFile_g = NULL;
	}
}
