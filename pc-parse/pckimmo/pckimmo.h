/* PCKIMMO.H - data structures/function prototypes for PC-KIMMO user interface
 ***************************************************************************
 * Copyright 1992, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef PCKIMMO_H_INCLUDED
#define PCKIMMO_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#ifdef __MWERKS__
#include <Files.h>
#include <Strings.h>
#endif

#ifdef _MSC_VER
#include <direct.h>		/* for _getcwd(), _getdrive(), _chdir(), ... */
#include <sys/types.h>		/* for MSDOS timing functions */
#include <sys/timeb.h>
#ifdef MSDOS
#define USE_DOS_INT_210A
#endif
#endif

#ifdef __GO32__
#include <sys/time.h>
extern int _get_default_drive();
#define _getcwd(a,b)	getcwd(a,b)
#define _chdir(a)	chdir(a)
extern int _getdrive();
extern int _chdrive(int drive);
#endif /*DJGPP*/

#ifdef HAVE_SIGNAL
#include <signal.h>
#endif

#include "cmd.h"
#ifndef MAXLINELEN
#define MAXLINELEN 255		/* nominal maximum line length */
#endif

/*****************************************************************************
 *  Function prototypes and extern declarations
 */
/* pckimmo.c */
extern void	exit_pckimmo	P((int iExitStatus_in));
extern KimmoData sKimmoData_g;		/* primary global data */
extern KimmoData sSynthesisData_g;	/* contains synthesis lexicon */
extern int bTiming_g;			/* flag for timing on/off */
extern int bVerbose_g;			/* flag for verbose compare on/off */
extern char *r_file, *l_file, *s_file, *g_file, *t_file;

/* pckimmo2.c */
extern void	user_cmd	P((void));

/* pckimmo3.c */
extern void	compare_gener		P((FILE *cmpfp));
extern void	compare_recog		P((FILE *recfp));
extern void	compare_synth		P((FILE *synfp));
extern void	compare_pairs		P((FILE *cmpfp, char *filename));
extern void	show_status		P((void));
extern void	do_generate		P((unsigned char *form));
extern void	do_file_generate	P((char * pszFilename_in));
extern void	do_clear		P((void));
extern void	do_recognize		P((unsigned char *form));
extern void	do_file_recognize	P((char * pszFilename_in));
extern void	do_synthesize		P((unsigned char *form));
extern void	do_file_synthesize	P((char * pszFilename_in));
extern void	do_save			P((char *filename));
extern void	show_lexicon		P((unsigned char *lexname));

#ifdef __cplusplus
}
#endif
#endif /*PCKIMMO_H_INCLUDED*/
