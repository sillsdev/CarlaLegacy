/* CMDSYS.C - functions to support a "system" command
 ***************************************************************************
 *
 * void doCmdSystem(const char * pszCommand_in)
 *
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
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
extern char * strcat  P((char * dest, const char * src));
extern char * strcpy  P((char * dest, const char * src));
extern size_t strspn P((const char *src, const char *accept));
extern char * getenv  P((const char *name));
#endif /* STDC_HEADERS */

#include "opaclib.h"
#include "cmd.h"

#ifdef _WINDOWS
#undef HAS_SUBPROCESS
#endif

#ifndef NUL
#define NUL '\0'
#endif

#ifdef vms
#include <rms.h>
#include <ssdef.h>
#include <descrip.h>
#include <dvidef.h>
#include <dcdef.h>
#include <iodef.h>
#include <jpidef.h>
#include <syidef.h>
#include <uaidef.h>
#endif

#ifdef applec
#pragma segment S_cmdlib
#endif

/*****************************************************************************
 * NAME
 *    doCmdSystem
 * DESCRIPTION
 *    Execute a SYSTEM <command> command.
 * RETURN VALUE
 *    none
 */
void doCmdSystem(pszCommand_in)
const char *	pszCommand_in;	/* pointer to system command to execute */
{
#ifdef HAS_SUBPROCESS
int res;
#ifdef __GO32__
char command[200];
#endif
/*
 *  the input string may begin with whitespace -- skip past it if so
 */
if (pszCommand_in != NULL)
	{
	pszCommand_in += strspn(pszCommand_in, " \t\r\n\f\v");
	if (wantCmdHelp(pszCommand_in,
			"SYSTEM <program ...>  (default is subshell)\n"))
	return;
	}
/*
 *  if empty command, find the appropriate shell (command processor)
 */
if ((pszCommand_in == NULL) || (*pszCommand_in == NUL))
	{
#ifdef _MSC_VER
	pszCommand_in = getenv("SHELL");
	if (pszCommand_in == NULL)
	pszCommand_in = getenv("COMSPEC");
	if (pszCommand_in == NULL)
	pszCommand_in = "COMMAND";
	fprintf(stderr,"Type EXIT to return to %s\n",
		pszCmdProgramName_g ? pszCmdProgramName_g : "the program");
#endif
#ifdef __GO32__
	pszCommand_in = getenv("SHELL");
	if (pszCommand_in == NULL)
	pszCommand_in = getenv("COMSPEC");
	if (pszCommand_in == NULL)
	pszCommand_in = "COMMAND";
	fprintf(stderr,"Type EXIT to return to %s\n",
		pszCmdProgramName_g ? pszCmdProgramName_g : "the program");
#endif
#ifdef UNIX
	pszCommand_in = getenv("SHELL");
	if (pszCommand_in == NULL)
	pszCommand_in = "/bin/sh";
	fprintf(stderr,"Type exit to return to %s\n",
		pszCmdProgramName_g ? pszCmdProgramName_g : "the program");
#endif
#ifdef vms
#endif /*vms*/
	}
#ifdef __GO32__
else
	{
	strcpy(command, "command /c ");
	strcat(command, pszCommand_in);
	pszCommand_in = command;
	}
#endif
/*
 *  try to execute the command
 */
#ifdef vms
dcl_cmd(pszCommand_in);
#else /*vms*/
res = system(pszCommand_in);
if ( res < 0 )
	perror(pszCmdProgramName_g ? pszCmdProgramName_g : "doCmdSystem()");
#endif /*vms*/
#else
fprintf(stderr, "This system does not support the SYSTEM command.\n");
#endif  /*HAS_SUBPROCESS*/
}

#ifdef vms
/*****************************************************************************
 * NAME
 *    dcl_cmd
 * ARGUMENTS
 *    cmd - command string
 * DESCRIPTION
 *    execute a VMS DCL command
 * RETURN VALUE
 *    none
 */
#ifndef	SS$_EXPRCLM		/* VMS doesn't return this yet, but let's */
#define SS$_EXPRCLM 10804	/* be forward-thinking and anticpate VMS */
#endif /* SS$_EXPRCLM */	/* V6.0, which will return it. */
void dcl_cmd(cmd)
char *cmd;
{
unsigned long sts;
int (*cct)();
struct dsc$descriptor_s cmd_line = {0, DSC$K_DTYPE_T, DSC$K_CLASS_S, 0};
struct itmlstdef {
	short int buflen;
	short int itmcod;
	char *bufaddr;
	long int *retlen;
	};
struct itmlstdef itmlst[] = {4,JPI$_UAF_FLAGS,0,0,0,0,0,0};
unsigned long uaf_flags, uaf_flags_size;

itmlst[0].bufaddr = (char *)&uaf_flags;
itmlst[0].retlen = &uaf_flags_size;

if ((vms_status = sys$getjpiw(0, 0, 0, &itmlst, 0, 0, 0)) != SS$_NORMAL)
	return;				/* Assume the worst... */
else if (uaf_flags & UAI$M_CAPTIVE)
	{
	printf("\nThis command cannot be executed. Your account is CAPTIVE.\n\n");
	return;
	}
#ifdef	UAI$M_RESTRICTED			/* for pre-V5.2 systems */
else if (uaf_flags & UAI$M_RESTRICTED)
	{
	printf("\nThis command cannot be executed. Your account is CAPTIVE.\n\n");
	return;
	}
#endif	/* uai$v_restricted */

cct = signal(SIGINT,SIG_DFL);	/* Let inferior process catch ^C */

cmd_line.dsc$w_length = strlen(s);
cmd_line.dsc$a_pointer = s;

if ((cmd == NULL) || (*cmd == NUL))
	fprintf(stderr,"Type LOGOUT to return to %s\n",
		pszCmdProgramName_g ? pszCmdProgramName_g : "the program");
sts = lib$spawn(&cmd_line, 0, 0, 0, 0, 0);
signal(SIGINT,cct);
/*
 * Note: We can't check for this beforehand as doing a getjpi for prclm will
 *	 only return the UAF value, not the available value. So we try it and
 *	 print this message if it didn't work.
 */
if ((sts == SS$_EXQUOTA) || (sts == SS$_EXPRCLM))
	{
 printf("Your account does not have sufficient quotas to use this command.\n");
  printf("Please ask your system manager to increase your UAF PRCLM quota.\n");
	}
}
#endif /*vms*/
