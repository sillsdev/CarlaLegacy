/* CMDSIG.C - simple handler for SIGINT signals
 ***************************************************************************
 *
 * RETSIGTYPE handleCmdSigint(int sig)		#ifdef HAVE_SIGNAL
 *
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "cmd.h"
/*
 *  environment to restore for error recovery
 */
jmp_buf	sCmdJmpBuf_g;

#ifdef HAVE_SIGNAL
#ifdef SIGINT
/****************************************************************************
 * NAME
 *    handleCmdSigint
 * ARGUMENTS
 *    sig - should always be SIGINT
 * DESCRIPTION
 *    Our handler for SIGINT signals (control-C's from keyboard).
 * RETURN VALUE
 *    none
 */
/*ARGSUSED*/
RETSIGTYPE handleCmdSigint(sig)
int sig;
{
if (pCmdOutputFP_g != NULL)
	{
	fflush(pCmdOutputFP_g);
	fclose(pCmdOutputFP_g);
	pCmdOutputFP_g = NULL;
	}
signal(SIGINT, handleCmdSigint);	/* restore SIGINT handling */
longjmp(sCmdJmpBuf_g, 1);		/* go back to the main menu */
}
#endif
#endif
