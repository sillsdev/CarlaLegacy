/* CMDDATA.C - global data to support CMD.H user interface
 ***************************************************************************
 * Copyright 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
/*
 *  output FILE pointer used by handleCmdSigint()
 */
FILE *	pCmdOutputFP_g = NULL;
/*
 *  output FILE pointer for a log file
 */
FILE *	pCmdLogFP_g = NULL;
/*
 *  pointer to the log filename
 */
char *	pszCmdLogFile_g = NULL;
/*
 *  pointer to the basic name of the program
 */
char *	pszCmdProgramName_g = NULL;
/*
 *  don't write anything to stderr in displayNumberedMessages()
 */
int bCmdSilentMessages_g = 0;
/*
 *  allow "warning" messages to be shown by displayNumberedMessages()
 */
int bCmdShowWarnings_g   = 1;
