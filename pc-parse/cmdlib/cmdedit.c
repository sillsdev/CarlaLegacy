/* CMDEDIT.C - function to support an "edit" command
 ***************************************************************************
 *
 * void doCmdEdit(const char * pszFilename_in)
 *
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef STDC_HEADERS
#include <stdlib.h>
#else
extern char * getenv  P((const char *name));
#endif /* STDC_HEADERS */

#include "cmd.h"

#ifdef _WINDOWS
#undef HAS_SUBPROCESS
#endif

#ifndef NUL
#define NUL '\0'
#endif

#ifdef applec
#pragma segment S_cmdlib
#endif

/*****************************************************************************
 * NAME
 *    doCmdEdit
 * DESCRIPTION
 *    Try to edit the indicated file with the user's preferred editor.
 * RETURN VALUE
 *    none
 */
void doCmdEdit(pszFilename_in)
const char *	pszFilename_in;		/* name of a file to edit */
{
#ifdef HAS_SUBPROCESS
char cmd[200];
char *editor;

if ((pszFilename_in == NULL) || (*pszFilename_in == NUL))
	{
	displayNumberedMessage(&sCmdMissingEditFile_g,
			   bCmdSilentMessages_g, bCmdShowWarnings_g, pCmdLogFP_g,
			   NULL, 0);
	return;
	}
if (wantCmdHelp(pszFilename_in, "EDIT <file> (no default filename or type)"))
	return;

editor = getenv("EDITOR");
if (editor == (char *)NULL)
	{
#ifdef MSDOS
	editor = "edit";
#endif
#ifdef UNIX
	editor = "emacs";
#endif
#ifdef vms
	editor = "edt";
#endif /*vms*/
	}
sprintf(cmd, "%s %s", editor, pszFilename_in);
doCmdSystem(cmd);
#else
fprintf(stderr, "This system does not support the EDIT command.\n");
#endif  /*HAS_SUBPROCESS*/
}
