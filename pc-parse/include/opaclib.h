/*	OPACLIB.H - general definitions for OPAC library functions
 *****************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _OPACLIB_H_INCLUDED
#define _OPACLIB_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
/*
 *  header files for parts of the OPAC library
 */
#include "allocmem.h"
#include "trie.h"
#include "record.h"
#include "rpterror.h"
#include "template.h"	/* includes textctl.h change.h strclass.h strlist.h */
#include "dynstr.h"

#ifndef TRUE
#define TRUE (1)
#endif
#ifndef FALSE
#define FALSE (0)
#endif
#ifndef NUL
#define NUL '\0'		/* the ASCII NUL character */
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif

#define BUFSIZE 300		/* general size for internal buffers */
/*
 *  cover for BSD using index() and rindex()
 */
#ifndef HAVE_STRCHR
#define strchr index
#define strrchr rindex
#endif
/*
 *  FUNCTION PROTOTYPES
 */
/* ambprog.c */
extern unsigned long showAmbiguousProgress P((unsigned uiAmbiguityCount_in,
						  unsigned long uiItemCount_in));

/* adjfname.c */
extern char * buildAdjustedFilename P((const char * pszFilename_in,
					   const char * pszBaseFilename_in,
					   const char * pszExtension_in));

/* erasecha.c */
extern char * eraseCharsInString P((char * pszString_io,
					const char * pszEraseChars_in));

/* errcheck.c */
extern void fcloseWithErrorCheck P((FILE * pOutputFP_in,
					const char * pszFilename_in));

/* isolatew.c */
extern char * isolateWord P((char * pszLine_io));

/* promptus.c */
extern char * promptUser P((const char * pszPrompt_in));

/* readfiel.c */
extern char ** readStdFormatField P((FILE *        pInputFP_in,
					 const char ** ppszFieldCodes_in,
					 int           cComment_in));

/* readline.c */
extern char * readLineFromFile P((FILE *     pInputFP_in,
				  unsigned * puiLineNumber_io,
				  int        cComment_in));

/* safeexit.c */
extern int exitSafely P((int iCode_in));

/* matchbeg.c */
extern int matchBeginning P((const char * pszString_in,
				 const char * pszBegin_in));

/* matchend.c */
extern int matchEnd P((const char * pszString_in,
			   const char * pszTail_in));

/* trimspac.c */
extern char * trimTrailingWhitespace P((char * pszString_io));

/* ufopen.c */
extern FILE * fopenAlways P((char * pszFilename_io, const char * pszMode_in));

/* fulldisk.c */
extern void checkFileError P((FILE * pOutputFP_in,
				  const char * pszProcessName_in,
				  const char * pszFilename_in));

/* rptprgrs.c */
extern void reportProgress P((unsigned long uiCount_in));

/* tokenize.c */
extern unsigned char *	tokenizeString P((
					unsigned char *       pszString_in,
					const unsigned char * pszSeparate_in));

/*****************************************************************************
 * EDIT HISTORY
 * 26-APR-82	D. Weber/Bob Kasper
 *  7-MAR-85	H.A. Black
 *  7-APR-85	DW
 * 13-Nov-85	SRMc
 *  3-SEP-86	hab
 * 15-Jan-87	hab - gen'ld surface allos
 * 17-Feb-87	hab - gen'ld categories
 * 12-Mar-87	hab - maxnumpfx now user-defined
 * 10-Apr-87	hab - version 3.0
 * 16-Sep-87	hab - removed titles to titles.h
 * 18-Mar-88	hab - change FIELDTERM to \
 * 12-Apr-88	hab - removed ALDEFAULT & MAXMORPH
 * 15-Apr-88	hab - removed RECSIZE
 *  1-Jun-88	SRMc - add orig_word field to template structure
 *  2-Jun-88	SRMc - remove new_word[256] field from template
 *			structure
 * 28-Jul-88	SRMc - replace ssalloc() with malloc() and realloc()
 * 26-Aug-88	SRMc - remove definitions for CADA, ANALONLY,
 *			TXT_INPUT, NFILES, FORMINIT, BREAKC, ORTHOTAB,
 *			NAME_SIZE
 *  7-Sep-88	SRMc - remove extern declarations
 * 21-Oct-88	SRMc - reorganize the file header comments
 *		     - change #ifdef MSDOS to #ifdef AZTEC for agetc()
 *		     - add ct_first field to struct code_table
 * 26-Jul-89	hab  - removed strlist struct; replaced by STAMP's
 *				strlist.h
 *		       removed code_table struct; replaced by STAMP's
 *				codetab.h
 * 27-Jul-89	hab  - add Copyright 1989
 *		       remove #define FIELDTERM '\\'; it is in record.c
 * 31-Jul-89	rk   - mods for MacIntosh Lightspeed's Think_C
 * 01-Aug-89	ab/hab - Define myisspace(), myisdigit(), myispunct()
 *			 to handle 8-bit characters
 * 19-Jan-91	SRMc - remove struct definition, since TEMPLATE.H
 *			exists separately
 *  2-Mar-91	SRMc - rename from DEFS.H to OPACLIB.H, since this is
 *			now associated with a function library rather
 *			than a particular program
 *		     - remove AMPLE-specific constants
 * 11-Mar-91	SRMc - #define strchr and strrchr for #ifdef BSD
 * 17-Mar-91	SRMc - add conditional #define NULL
 * 21-Jan-92	SRMc - add full set of function prototypes
 * 20-Jul-92	SRMc - interact.c added to OPAC library
 * 15-Apr-93	SRMc - add erasecha.c to the OPAC library
 * 12-May-93	SRMc - add readfiel.c to the OPAC library
 * 17-May-93	SRMc - add errcheck.c to the OPAC library
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 10-Oct-96	SRMc - add safeexit.c to the OPAC library
 * 21-Feb-96	SRMc - rename ct_table to pCodeTable   for CodeTable struct
 *		     - rename ct_size  to uiCodeCount  for CodeTable struct
 *		     - rename ct_first to pszFirstCode for CodeTable struct
 * 15-Apr-97	SRMc - remove definitions of READ and WRITE
 * 22-May-97	SRMc - renamed errcheck_fclose() to fcloseWithErrorCheck()
 *		     - renamed ufopen() to fopenAlways()
 *		     - added trimTrailingWhitespace() to this header file
 * 23-May-97	SRMc - renamed safe_exit() to exitSafely()
 *		     - removed rebuildWord() and rebuildOriginalWord() since
 *			they are never used (and only partially implemented)
 * 28-May-97	SRMc - remove obsolete function prototypes
 *		     - add full_disk() from CPORT function library, and rename
 *			it to checkFileError()
 * 10-Jul-97	SRMc - added reportProgress() from PC-Kimmo and PC-PATR
 * 29-Jul-97	SRMc - added strtok8() from PC-Kimmo and PC-PATR, but renamed
 *			it to tokenizeString()
 *  8-Oct-97	SRMc - cosmetic changes and proofreading
 * 21-Jul-98	SRMc - fix a typo in a comment
 * 16-Oct-98	SRMc - make header files safe for #including in C++ sources
 * 24-Oct-1998	SRMc - added appendDynamicString() [dynstr.c]
 * 14-Apr-2000	SRMc - moved appendDynamicString() [dynstr.c] to ample
 *			subdirectory
 *		     - added dynstr.h/dynstr.c containing a data structure and
 *			related functions for flexibly dealing with growing
 *			strings (moved from pcpatr/patrstrg.c)
 */
#ifdef __cplusplus
}
#endif
#endif /* _OPACLIB_H_INCLUDED */
