/* CMD.H - interactive user interface functions and data structures
 ***************************************************************************
 * Copyright 1989, 2000 by SIL International.  All rights reserved.
 */
#ifndef _CMD_H_INCLUDED
#define _CMD_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <setjmp.h>
#ifdef HAVE_STDARG_H
#include <stdarg.h>
#else
#include <varargs.h>
#endif
#ifdef HAVE_SIGNAL
#include <signal.h>
#endif
#include "rpterror.h"	/* for NumberedMessage and displayNumberedMessage() */

/*************************************************************************
 * NAME
 *    CmdKeyword
 * DESCRIPTION
 *    data structure for command keyword tables
 */
typedef struct {
	char *	pszKeyword;	/* Pointer to keyword string */
	int		iValue;		/* Associated value (should be positive) */
	int		iFlags;		/* Flags (as defined below) */
	} CmdKeyword;
/*
 *  values for the iFlags field of the CmdKeyword structure
 */
#define CMD_INVISIBLE 1		/* Invisible keyword */
#define CMD_DISABLED  2		/* Disabled keyword */
/*
 *  special values for invalid keyword searches
 */
#define CMD_NULL      -4	/* Null keyword */
#define CMD_AMBIGUOUS -3	/* Ambiguous keyword */
#define CMD_INVALID   -2	/* Not a keyword */
#define CMD_HELP      -1	/* '?' */

/* cmd.c */
extern int	lookupCmdKeyword P((char *             pszCommand_in,
					const CmdKeyword * pKeywordTable_in,
					int                iTableSize_in,
					char *             pszHelp_in));
extern char *	getCmdString P((const char *  pszCommand_in,
				const char *  pszPrompt_in,
				int	    cComment_in));
extern void	doCmdTake P((const char * pszFilename_in));
extern int	closeCmdTake P((void));
extern int	getCmdTakeLevel P((void));
extern char *	getCmdTakeFile P((void));

/* cmdtime.c */
extern void startCmdTiming P((void ));
extern void stopCmdTiming P((void ));
extern void showCmdTiming P((void ));

/* cmdsig.c */
#ifdef HAVE_SIGNAL
#ifdef SIGINT
extern RETSIGTYPE handleCmdSigint P((int sig ));
#endif
#endif

/* setcmdfi.c */
extern char * setCmdFilename P((const char * pszFilename_in,
				const char * pszDefaultName_in,
				const char * pszExtension_in));

/* wanthelp.c */
extern int wantCmdHelp P((const char * pszArgument_in,
			  const char * pszHelpMessage_in));

/* cmdlog.c */
extern void doCmdLog P((const char * pszFilename_in));
extern void doCmdClose P((void));

/* cmdcd.c */
extern void doCmdChdir P((const char * pszDirectory_in));

/* cmddir.c */
extern void doCmdDirectory P((const char * pszArgument_in));

/* cmdedit.c */
extern void doCmdEdit P((const char * pszFilename_in));

/* cmdsys.c */
extern void doCmdSystem P((const char * pszCommand_in));

/* cmdsig.c */
extern jmp_buf	sCmdJmpBuf_g;	/* environment to restore for error recovery */

/* messages.c */
/*extern NumberedMessage sCmdInputTooLong_g;*/	/* 100 */
extern NumberedMessage sCmdAmbiguous_g;		/* 101 */
extern NumberedMessage sCmdInvalid_g;		/* 102 */
extern NumberedMessage sCmdMissingKeyword_g;		/* 103 */
extern NumberedMessage sCmdMissingArgument_g;	/* 104 */
extern NumberedMessage sCmdAmbiguousKeyword_g;	/* 105 */
extern NumberedMessage sCmdBadKeyword_g;		/* 106 */
extern NumberedMessage sCmdBadArgument_g;		/* 107 */
extern NumberedMessage sCmdMissingInputFile_g;	/* 108 */
extern NumberedMessage sCmdBadInputFile_g;		/* 109 */
extern NumberedMessage sCmdBadOutputFile_g;		/* 110 */
extern NumberedMessage sCmdTooDeepTake_g;		/* 111 */
extern NumberedMessage sCmdErrorInTake_g;		/* 112 */
extern NumberedMessage sCmdNoLogFile_g;		/* 113 */
extern NumberedMessage sCmdClosingLog_g;		/* 114 */
extern NumberedMessage sCmdMissingEditFile_g;	/* 115 */
extern NumberedMessage sCmdMissingDirectory_g;	/* 116 */
extern NumberedMessage sCmdInvalidDirectory_g;	/* 117 */
extern NumberedMessage sCmdMissingOutputFile_g;	/* 118 */

/* cmddata.c */
extern FILE *	pCmdOutputFP_g;		/* used by handleCmdSigint() */
extern FILE *	pCmdLogFP_g;		/* log FILE pointer */
extern int	bCmdShowWarnings_g;
extern int	bCmdSilentMessages_g;
extern char *	pszCmdLogFile_g;	/* pointer to the log filename */
extern char *	pszCmdProgramName_g;	/* for building filenames */

/***************************************************************************
 * EDIT HISTORY
 *  1-Jun-85	SRMc - initial edit from Unix CKermit sources
 *			(by Frank da Cruz, CUCCA)
 *    ...			...
 * 11-Dec-87	SRMc - final revision of RT-11/TSX Kermit
 *    ...			...
 *  3-Oct-89	SRMc - copy code, revise it for use in PC-KIMMO
 *			program (total rewrite except for struct
 *			definition and bottom-level parsing funcs)
 *    ...			...
 * 10-Jul-94	jas - begin conversions to use in PC-PATR
 *    ...			...
 * 29-Sep-94	SRMc - extract low-level stuff for reusable library
 *  4-Oct-94	SRMc - add CM_DIS value for the flgs field
 * 29-May-97	SRMc - use typedef to rename data structures
 *		     - convert data structure element names to my variety of
 *			Hungarian notation
 *		     - convert function names to my variety of Hungarian
 *			notation
 *  5-Jun-97	SRMc - rename menu_env to sCmdJmpBuf_g, move to cmddata.c
 *		     - make common error messages global, creating messages.c
 *		     - add doCmdTake(), closeCmdTake(), and getCmdTakeLevel()
 *		     - set pCmdOutputFP_g to NULL after closing the file in
 *			handleCmdSigint()
 * 12-Jun-97	SRMc - fix cmd.h prototypes to reflect reality better
 * 12-Aug-97	SRMc - fix compiler warnings produced by DJGPP 2.01
 *  9-Oct-97	SRMc - cosmetic changes and proofreading
 * 16-Oct-98	SRMc - make header files safe for #including in C++ sources
 * 14-Apr-2000	SRMc - use strncat properly - the third argument is the maximum
 *			number of non-NUL characters that can be appended, NOT
 *			the total size of the destination buffer
 * 20-Apr-2000	SRMc - adjust the help output slightly to handle overlong
 *			command tokens more aesthetically
 */
#ifdef __cplusplus
}
#endif
#endif /*_CMD_H_INCLUDED*/
