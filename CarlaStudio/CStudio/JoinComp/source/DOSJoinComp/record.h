/* RECORD.H - functions for reading standard format records
 ***************************************************************************
 *
 *	CodeTable (struct)
 *
 ***************************************************************************
 * edit history is at the end of this file
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _RECORD_H_INCLUDED
#define _RECORD_H_INCLUDED

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>

/****************************************************************************
 * NAME
 *    CodeTable
 * DESCRIPTION
 *    structure for code table for reading records
 */
typedef struct {
	char *	pCodeTable;	/* primitive change strings:
				   "match\0A\0match\0A\0" where match is
				   "\\code" and A is substitution character */
	unsigned	uiCodeCount;	/* number of entries (FIELDCODES) in
				   pCodeTable */
	char *	pszFirstCode;	/* first FIELDCODE (record marker) */
	} CodeTable;
/*
 *  function prototypes
 */
/* record.c */
extern char * readStdFormatRecord P((FILE * pInputFP_in,
					 const CodeTable * pCodeTable_in,
					 int cComment_in,
					 unsigned * puiRecordCount_io));
extern void cleanupAfterStdFormatRecord P((void));

/* free_ct.c */
extern void freeCodeTable P((CodeTable * pTable_io));
/* write_ct.c */
extern void writeCodeTable P((FILE * pLogFP_in,
				  const CodeTable * pTable_in));
/*
 *  globally accessible data
 */
#define MAX_RECKEY_SIZE	64
extern char *	pRecordBuffer_g;
extern unsigned	uiRecordBufferSize_g;
extern char	szRecordKey_g[MAX_RECKEY_SIZE];

/***************************************************************************
 * EDIT HISTORY
 * 15-MAR-83	D. Weber/Bob Kasper
 *  3-MAY-85	br/hab/djw
 * 26-Sep-85	SRMc
 * 30-Oct-86	hab - tab processing bug
 * 24-Mar-88	hab - remove CTRL-X as EOR
 * 19-Apr-88	hab - fix bug in ! processing
 *  2-May-88	SRMc - add end-of-line comment processing using global
 *			rec_comment_char
 * 23-May-88	SRMc - implement code_table structure
 * 30-May-88	SRMc - move declaration of rec_comment_char to anroot.c
 *  3-Jun-88	SRMc - reorder tests in delete_null() to always call
 *			find_code()
 * 14-Jun-88	SRMc - use <ctype.h> macros
 *		     - revise eor_chk() to use ftell()/fseek() rather than
 *			multiple ungetc()'s
 *		     - pass '\n's through in records
 * 28-Jul-88	SRMc - replace ssalloc() with malloc() and realloc()
 * 18-Oct-88	SRMc - prevent dereferencing NULL pointer in eor_chk()
 * 20-Oct-88	SRMc - remove register from function parameter declarations
 *		     - reorganize the file header comments
 *		     - use explicit lookahead buffer instead of using fseek()
 *			in eor_chk()
 *			[fix for braindead Aztec C function]
 *			this wreaks havoc everywhere, since now a standard
 *			format database file must be handled in its entirety
 *			by get_record() and consume() before processing another
 *			such file
 *		     - consume() always called with EOR, so remove that as a
 *			parameter
 *		     - rename recfree() to free_record, don't allow free(NULL)
 *			any more
 *		     - add init_record() as global function, make consume()
 *			private
 * 10-Nov-88	SRMc - replace free() with myfree()
 * 20-May-89	SRMc - change #include's for shared use by STAMP
 *		     - revised init_record() to include comment_char
 * 13-Jul-89	hab  - de-"lint" the source
 * 27-Jul-89	hab  - add Copyright 1989
 * 01-Aug-89	ab/hab - Define myisspace(), myisdigit(), myispunct()
 *			 to handle 8-bit characters
 * 21-Jun-90	BK   - Fix up for THINKC on MAC				[1.6a]
 * 29-Jun-90	BK/ALB - Fix for portability to MAC, add string.h	[1.1b]
 * 29-Jun-90	ALB  - Fix bug of 8-bit fail in envir, add myisspace	[1.1c]
 * 20-Jul-90	ALB  - Fixes to andata.h and record.c from Steve McC	[1.6c]
 * 17-Jan-91	SRMc - make free_record() explicitly void
 *		     - make static consume() explicitly void
 *		     - use bzero() or memset() for zero()
 *		     - use strcmp() instead of streq()
 *		     - add ANSI-fied extern function declarations
 * 29-Jan-91	SRMc - merged in AMPLE 1.6f sources
 * 16-Sep-91	SRMc - delint with GNU C "-Wall -ansi -pedantic" and
 *			Microsoft C -W3
 * 19-Aug-92	SMRc - move edit history to the end of the file
 *		     - fix bug with comment at the end of the file without a
 *			terminating newline
 *  1-Jun-93	FH - Added to PC-KIMMO core
 * 20-Sep-94	SRMc - rewrite get_record() to use fread( ,1,BUFSIZ, ) instead
 *			of fgetc()
 *		     - rewrite find_code() and embed it in get_record()
 *		     - replace free_record() with cleanup_record() (called once
 *			per file or set of files rather than once per record)
 * 22-Sep-94	SRMc - performance on Sun workstation is horrible -- rewrite
 *			again to use getc(), but more efficiently
 * 23-Sep-94	SRMc - merge the fread() and rewritten getc() versions into one
 *			file with #ifdef RISC to choose between them
 * 29-Sep-95	SRMc - fix init_record() to work properly when the whole file
 *			is one big record
 *		     - fix #ifdef RISC bug in skipping fields
 * 12-Oct-96	SRMc - check for NULL rec_mark in init_record()
 *		     - rename record to pRecordBuffer_g, make it global
 *		     - rename size_record to uiRecordBufferSize_g, make it
 *			global unsigned instead of static size_t
 *		     - add szRecordKey_g[MAX_RECKEY_SIZE]
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 11-Feb-97	SRMc - rename init_record()    to initializeStdFormatRecord()
 *		     - rename get_record()     to readStdFormatRecord()
 *		     - rename cleanup_record() to cleanupAfterStdFormatRecord()
 * 27-Feb-97	SRMc - eliminate initializeStdFormatRecord()
 *		     - make input arguments const where possible
 * 27-May-97	SRMc - increase MAX_RECKEY_SIZE to 64
 * 14-Oct-97	SRMc - move history to from record.c to record.h
 *		     - abstract freeCodeTable() from AMPLE, create free_ct.c
 *		     - abstract writeCodeTable() from AMPLE, create write_ct.c
 * 20-Oct-97	SRMc - ensure prototype for strlen() in write_ct.c
 */

#endif /* _RECORD_H_INCLUDED */
