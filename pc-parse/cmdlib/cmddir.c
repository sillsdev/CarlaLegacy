/* CMDDIR.C - function to support a "directory" command
 ***************************************************************************
 *
 * void doCmdDirectory(const char * pszArgument_in)
 *
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include "cmd.h"

#ifdef _WINDOWS
#undef HAS_SUBPROCESS
#endif

#ifdef applec
#pragma segment S_cmdlib
#endif

/*****************************************************************************
 * NAME
 *    doCmdDirectory
 * DESCRIPTION
 *    list the contents of the current directory
 * RETURN VALUE
 *    none
 */
void doCmdDirectory(pszArgument_in)
const char *	pszArgument_in;		/* optional arguments for the
					   directory command */
{
#ifdef HAS_SUBPROCESS
char command[256];

if (pszArgument_in == NULL)
	pszArgument_in = "";
if (wantCmdHelp(pszArgument_in,
		"DIRECTORY [arguments]  (default is the current directory)\n"))
	return;
#ifdef MSDOS
sprintf(command, "dir %s", pszArgument_in);
#endif /*MSDOS*/
#ifdef UNIX
sprintf(command, "ls %s", pszArgument_in);
#endif /*UNIX*/
#ifdef vms
sprintf(command, "directory %s", pszArgument_in);
#endif /*vms*/

doCmdSystem(command);
#else
fprintf(stderr, "This system does not support the DIRECTORY command.\n");
#endif /*HAS_SUBPROCESS*/
}
