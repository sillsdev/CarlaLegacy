/* WANTHELP.C - functions to display help message for commands
 ***************************************************************************
 *
 * int wantCmdHelp(const char * pszArgument_in,
 *		   const char * pszHelpMessage_in)
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

#ifndef NUL
#define NUL '\0'
#endif

#ifdef applec
#pragma segment S_cmdlib
#endif

/*****************************************************************************
 * NAME
 *    wantCmdHelp
 * DESCRIPTION
 *    If the argument string is "?", then print the helpful message.
 * RETURN VALUE
 *    1 if help wanted (and message printed), 0 otherwise
 */
int wantCmdHelp(pszArgument_in, pszHelpMessage_in)
const char *	pszArgument_in;		/* pointer to argument string */
const char *	pszHelpMessage_in;	/* pointer to message string */
{
if (pszArgument_in == NULL)
	return(0);
if ((*pszArgument_in++ == '?') && (*pszArgument_in == NUL))
	{
	fprintf(stderr, "%s\n", pszHelpMessage_in);
	return(1);
	}
return(0);
}
