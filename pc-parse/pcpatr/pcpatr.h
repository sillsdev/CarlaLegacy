/* PCPATR.H - data structures/function prototypes for PC-PATR user interface
 ***************************************************************************
 * Copyright 1994, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef PCPATR_H_INCLUDED
#define PCPATR_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif

#include "opaclib.h"
#include "kimmo.h"
#include "ample.h"

#ifdef HAVE_SIGNAL
#include <signal.h>
#endif

#include "cmd.h"

#ifdef THINK_C
#include <pascal.h>
#endif

#ifdef applec
#include <Files.h>
#include <Strings.h>
#include <Events.h>
#ifdef MPW_PERF
#include <Perf.h>
extern TP2PerfGlobals ThePGlobals;		/* performance globals */
#endif
#endif

#ifdef _MSC_VER
#include <direct.h>		/* for _getcwd(), _getdrive(), _chdir(), ... */
#include <sys/timeb.h>
#endif

#ifdef __DJGPP__
#include <sys/time.h>
#include <unistd.h>
extern int _get_default_drive(void);
#define _getcwd(a,b)	getcwd(a,b)
#define _chdir(a)	chdir(a)
extern int _getdrive(void);
extern int _chdrive(int drive);
#endif

#define MAXLINELEN 255 		/* nominal maximum line length */

/*****************************************************************************
 * extern declarations of global variables and functions
 */

/* PCPATR.C */
extern PATRData		sPCPATRData_g;
extern KimmoData	sPCPATRKimmoData_g;
extern AmpleData	sPCPATRAmpleData_g;
extern int		iPCPATRDebugLevel_g;
extern int		bPCPATRSilent_g;
extern int		bPCPATRTiming_g;
extern int		bPCPATRVerbose_g;
extern int		bPCPATRWarnUnusedFd_g;
extern int		bPCPATRUnifiedAmpleDictionary_g;
extern char *		pszPCPATRGrammarFile_g;
extern StringList *	pPCPATRLexiconFiles_g;
extern StringList *	pPCPATRAmpleFiles_g;
extern char *		pszPCPATRAnaFile_g;
extern char *		pszPCPATRGrmFile_g;
extern char *		pszPCPATRLexFile_g;
extern char *		pszPCPATRTakFile_g;
extern char		szPCPATRDefaultWordMarker_g[3];
extern char		szPCPATRDefaultCategoryMarker_g[3];
extern char		szPCPATRDefaultFeatureMarker_g[3];
extern char		szPCPATRDefaultGlossMarker_g[3];
extern unsigned char	szWhitespace_g[7];
extern int		bPCPATRWriteAmpleParses_g;
extern unsigned char	szPCPATRDefaultBarcodes_g[15];
extern TextControl	sPCPATRTextControl_g;

/* PCPATR2.C */
void user_cmd P((void ));

/* PCPATR3.C */
void show_status P((void ));
void do_clear P((void ));
void do_save_status P((char *filename));
void do_save_lexicon P((char *filename));

#ifdef __cplusplus
}
#endif
#endif /*PCPATR_H_INCLUDED*/
