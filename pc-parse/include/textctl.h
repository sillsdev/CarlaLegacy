/* TEXTCTL.H - definition of text input/output control data structure
 ***************************************************************************
 *
 *	TextControl (struct text_control)
 *
 ***************************************************************************
 * edit history at the end of the file
 ***************************************************************************
 * Copyright 1991, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _TEXTCTL_H_INCLUDED
#define _TEXTCTL_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#include <stdio.h>
#include <ctype.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include "change.h"	/* includes strclass.h strlist.h */

/****************************************************************************
 *  structure containing the control data for textin(), textout(), dtbin(),
 *  and dtbout()
 */
typedef struct lower_letter {
	unsigned char *       pszLower;
	StringList *          pUpperList;
	struct lower_letter * pNext;
	} LowerLetter;
typedef struct upper_letter {
	unsigned char *       pszUpper;
	StringList *          pLowerList;
	struct upper_letter * pNext;
	} UpperLetter;
typedef struct caseless_letter {
	unsigned char *	     pszLetter;
	struct caseless_letter * pNext;
	} CaselessLetter;
typedef struct text_control {
				/* name of file the data is loaded from */
	char *		pszTextControlFile;
	LowerLetter *	pLowercaseLetters;	/* \luwfc, \luwfcs (input) */
	UpperLetter *	pUppercaseLetters;	/*    "       "       "    */
	CaselessLetter *	pCaselessLetters;	/* \wfc, \wfcs (input) */
	Change *		pOrthoChanges;		/* \ch (input) */
	Change *		pOutputChanges;		/* \ch (output) */
	StringList *	pIncludeFields;		/* \incl (input) */
	StringList *	pExcludeFields;		/* \excl (input) */
	unsigned char	cFormatMark;		/* \format (input) */
	unsigned char	cAnaAmbig;		/* \ambig (database file) */
	unsigned char	cTextAmbig;		/* \ambig (text file) */
	unsigned char	cDecomp;		/* \dsc (input) */
	unsigned char	cBarMark;		/* \barchar (input) */
	unsigned char *	pszBarCodes;		/* \barcodes (input) */
	char		bIndividualCapitalize;	/* \noincap (input) */
	char		bCapitalize;		/* \nocap (input) */
	unsigned		uiMaxAmbigDecap;	/* \maxdecap (input) */
	} TextControl;

/***************************************************************************
 *  function prototypes
 */
/* loadintx.c */
extern int loadIntxCtlFile P((const char *   pszFilename_in,
				  int            cComment_in,
				  TextControl *  pTextCtl_out,
				  StringClass ** ppStringClasses_io));
/* loadoutx.c */
extern int loadOutxCtlFile P((const char *   pszFilename_in,
				  int            cComment_in,
				  TextControl *  pTextCtl_out,
				  StringClass ** ppStringClasses_io));
/* resetxtc.c */
extern void resetTextControl P((TextControl * pTextCtl_io));

/* myctype.c */
extern int    matchAlphaChar          P((const unsigned char * pszString_in,
					 const TextControl *   pTextCtl_in));
extern int    matchLowercaseChar      P((const unsigned char * pszString_in,
					 const TextControl *   pTextCtl_in));
extern int    matchUppercaseChar      P((const unsigned char * pszString_in,
					 const TextControl *   pTextCtl_in));
extern int    matchCaselessChar       P((const unsigned char * pszString_in,
					 const TextControl *   pTextCtl_in));
extern const unsigned char * convLowerToUpper P((
					   const unsigned char * pszString_in,
					   const TextControl *   pTextCtl_in));
extern const unsigned char * convUpperToLower P((
					   const unsigned char * pszString_in,
					   const TextControl *   pTextCtl_in));
extern const StringList * convLowerToUpperSet P((
					   const unsigned char * pszString_in,
					   const TextControl *   pTextCtl_in));
extern const StringList * convUpperToLowerSet P((
					   const unsigned char * pszString_in,
					   const TextControl *   pTextCtl_in));
extern void   addLowerUpperWFChars        P((char *        pszLUPairs_in,
						 TextControl * pTextCtl_io));
extern void   addLowerUpperWFCharStrings  P((char *        pszLUPairs_in,
						 TextControl * pTextCtl_io));
extern void   addWordFormationChars       P((char *        pszLetters_in,
						 TextControl * pTextCtl_io));
extern void   addWordFormationCharStrings P((char *        pszLetters_in,
						 TextControl * pTextCtl_io));
extern void   writeWordFormationChars     P((FILE *              pOutputFP_in,
						 const TextControl * pTextCtl_in));
extern void   resetWordFormationChars     P((TextControl * pTextCtl_io));

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
#define NULL (void *)0
#endif
#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif


/*****************************************************************************
 *	EDIT HISTORY (from myctype.h)
 *	22-Jan-92	SRMc - written to provide ANSIfied function prototypes
 *	26-May-93	SRMc - handle stupid renaming of functions by MSC 7.00
 *	20-Oct-95	SRMc - fix for config.h (Autoconf)
 *****************************************************************************
 * EDIT HISTORY
 * 18-Sep-91	Steve McConnel - initial edit, consolidating diverse
 *			global data elements into a data structure
 *  3-Jun-92	SRMc - remove alpha, upperalpha, and loweralpha from
 *			struct text_control
 *  5-Jun-92	SRMc - add output_chg to struct text_control
 *		     - add function prototypes from textin.c and
 *			textout.c
 * 22-Feb-93	SRMc - add prototype for textout_recapitalize()
 * 26-May-93	SRMc - split load_intx_ctl_file() into LOADINTX.C, and
 *			split load_outx_ctl_file() into LOADOUTX.C
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 *  2-Nov-96	SRMc - write resetTextControl()
 *  7-Nov-96	SRMc - revise loadIntxCtlFile() and loadOutxCtlFile()
 *			to take a filename argument
 *		     - add pszTextControlFile field to TextControl
 * 18-Feb-97	SRMc - merge myctype.h into textctl.h
 *		     - add pszLowercaseLetters, pszUppercaseLetters, and
 *			pszCaselessLetters fields to TextControl
 * 22-May-97	SRMc - rename showWordFormationChars() to
 *			writeWordFormationChars()
 *  6-Oct-97	SRMc - minimize explicit #include statements, add comments
 *  8-Oct-97	SRMc - cosmetic changes and proofreading
 * 13-Nov-97	SRMc - split cAmbig into cAnaAmbig and cTextAmbig
 * 14-Jul-98	SRMc - define the LowerLetter, UpperLetter, and CaselessLetter
 *			data structures
 *		     - replace the pszLowercaseLetters, pszUppercaseLetters,
 *			and pszCaselessLetters fields with the
 *			pLowercaseLetters, pUppercaseLetters, and
 *			pCaselessLetters fields
 *		     - change isAlphaChar()        to matchAlphaChar()
 *		     - change isLowercaseChar()    to matchLowercaseChar()
 *		     - change isUppercaseChar()    to matchUppercaseChar()
 *		     - change convCharToUpper()    to convLowerToUpper()
 *		     - change convCharToLower()    to convUpperToLower()
 *		     - change convCharToUpperSet() to convLowerToUpperSet()
 *		     - change convCharToLowerSet() to convUpperToLowerSet()
 *		     - add the matchCaselessChar() function
 *		     - add the addLowerUpperWFCharStrings() function
 *		     - add the addWordFormationCharStrings() function
 * 21-Jul-98	SRMc - fix a typo in a comment
 * 16-Oct-98	SRMc - make header files safe for #including in C++ sources
 */
#ifdef __cplusplus
}
#endif
#endif /* _TEXTCTL_H_INCLUDED */
