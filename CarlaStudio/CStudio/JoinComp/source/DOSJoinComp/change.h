/* CHANGE.H - define "consistent change" structures
 ***************************************************************************
 *
 *	Change (struct change_list)
 *
 ***************************************************************************
 * edit history is at the end of this file
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _CHANGE_H_INCLUDED
#define _CHANGE_H_INCLUDED
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include "strclass.h"

/*****************************************************************************
 * NAME
 *    ChgEnvItem (struct chg_env_item)
 * DESCRIPTION
 *    This is used for constraints to either the right or the left.  Each side
 *    of a constraint consists of a linked list of these items.
 */
typedef struct chg_env_item {
	char			iFlags;
				/* bitwise constants for use in iFlags */
#define E_NOT             01    /* do NOT want to match this item */
#define E_CLASS           02    /* member of class, not literal string */
#define E_ELLIPSIS        04    /* does not have to be contiguous */
#define E_OPTIONAL       010    /* optional item */
	union {
	char *		pszString;	/* pointer to literal string */
	StringClass *	pClass;		/* pointer to class structure */
	}			u;
	struct chg_env_item *	pNext;	/* pointer to next item */
	} ChgEnvItem;

/*****************************************************************************
 * NAME
 *    ChangeEnvironment (struct chg_envir)
 * DESCRIPTION
 *    This is used for Change environment constraints.   All such constraint
 *    conditions are stored in a single linked list.  Each node of this list
 *    has a pointer to the left hand environment and a pointer to the right
 *    hand environment, both working outward.  Either environment may be NULL.
 *    Each node also has a pointer to the next node in the list.
 */
typedef struct chg_envir {
/*    char iFlags;*/			/* NOT this environment (E_NOT) */
	short		bNot;		/* NOT this environment */
/*    char eType;*/				/* type of environment */
	ChgEnvItem *	pLeftEnv;	/* environment to the left */
	ChgEnvItem *	pRightEnv;	/* environment to the right */
	struct chg_envir *	pNext;	/* link to alternative constraint */
	} ChangeEnvironment;

/*****************************************************************************
 *	structure definition
 */
typedef struct change_list {
	char *		pszMatch;	/* original string */
	char *		pszReplace;	/* what to change it to */
	ChangeEnvironment *	pEnvironment;	/* environment for this change */
	char *		pszDescription;	/* comment describing change */
	struct change_list *pNext;		/* pointer to next change in list */
	} Change;

/*****************************************************************************
 *	function prototypes
 */
extern Change *	parseChangeString P((const char *        pszString_in,
					 const StringClass * pClassList_in));
extern char *	applyChanges P((const char *   pszString_in,
				const Change * pChangeList_in));
extern void	freeChangeList P((Change * pList_io));
extern int	getChangeQuote P((const char * pszMatch_in,
				  const char * pszReplace_in));
extern char *	buildChangeString P((const Change * pChange_in));
extern void	writeChange P((const Change * pChange_in,
				   FILE *         pOutputFP_in));

/***************************************************************************
 * EDIT HISTORY (splitl.c)
 * 20-May-89	Steve McConnel
 * 29-Jun-90    ALB - Fix bug of 8-bit fail in envir (STAMP 1.1c)
 *		    - add myisspace
 * 27-Dec-90	SRMc - replace stcmp() with match_begin() [new name]
 *		     - add #define index #ifndef BSD
 * 11-Mar-91	SRMc - add #include <string(s).h>
 *		     - replace index() with strchr() throughout
 * 17-Sep-91	SRMc - delint with GNU C "-Wall -ansi -pedantic" and
 *			Microsoft C -W3
 * 23-Jan-92	SRMc - move edit history to end of the file
 *		     - replace skipwhite() with inline code
 * 14-Oct-96	SRMc - change #include "opaclib.h" to #include "myctype.h"
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 30-Jan-97	SRMc - fix for STDC_HEADERS
 * 11-Feb-97	SRMc - merge into change.c
 */
/*	PARSENV.C - parse an environment constraint */
/***************************************************************************
 *	EDIT HISTORY for ENVLEX.C
 *	 7-May-88	Steve McConnel
 *	19-May-88	SRMc - add "~_" as a token
 *	 9-Sep-88	SRMc - add "(" and ")" as tokens
 *			     - use \ as a verbatim quote
 *	21-Oct-88	SRMc - reorganize the file header comments
 *	28-Oct-88	SRMc - shorten ELEX_ to EL_ in symbol names in order
 *                              to satisfy the UNIX PC System V compiler
 *       4-Jan-89       SRMc - fix for Microsoft C
 *      26-Jul-89       hab  - added #include "class.h"
 *                             replace struct strlist in defs.h with
 *                              STAMP's strlist.h
 * 1.6b 22-Jun-90 ALB Fix bug of not accepting 8-bit chars in env (isspace)
 * 1.6e    * 1.6ebl  02-Aug-90 hab Change index to strchr and rindex to strrchr
 *	20-Dec-90	SRMc - replace stcmp() with match_begin()
 *	11-Mar-91	SRMc - add #include <string(s).h>
 *	16-Sep-91	SRMc - delint with GNU C "-Wall -ansi -pedantic" and
 *				Microsoft C -W3
 * 1.6v 13-Nov-91 ALB Allow space between tilde and underline
 * 1.6y 21-Nov-91 ALB Add {} for property and root
 ***************************************************************************
 *	EDIT HISTORY for ENVPAR.C
 *	 9-May-88	Steve McConnel
 *	19-May-88	SRMc - add "~_" as a token
 *	20-May-88	SRMc - write ccenv_parse()
 *	 1-Jun-88	SRMc - add env_ortho
 *	28-Jul-88	SRMc - replace ssalloc() with malloc() and realloc()
 *      24-Aug-88       SRMc - regularize error messages
 *       7-Sep-88       SRMc - split ENVPAR.C into ENVPAR.C, AENVPA.C,
 *                              CENVPA.C, IENVPA.C, and MENVPA.C
 *       9-Sep-88       SRMc - parse ( <item> ) for E_OPTIONAL
 *      16-Sep-88       SRMc - tweak the error message to
 *                                              "Missing optional item"
 *      21-Oct-88       SRMc - reorganize the file header comments
 *      10-Nov-88       SRMc - replace free() with myfree()
 *      17-May-89       SRMc - revised definition of apply_cc() (for STAMP)
 *                           - use mystrdup()
 *      13-Jul-89       hab  - de-"lint" the source
 *      11-Jul-89       hab  - convert tabs to spaces in output
 *      26-Jul-89       hab  - merge with STAMP version
 *      27-Jul-89       hab  - add Copyright 1989
 * 1.0m 14-Mar-90 ALB Allow cat and cat class in morpheme environment
 * 1.1b 29-Jun-90 BK/ALB Fix for portability to MAC, add string.h
 *	17-Jan-91	SRMc - declare epar_error() as void
 *			     - declare show_badenv() as void
 *	17-Sep-91	SRMc - delint with GNU C "-Wall -ansi -pedantic" and
 *				Microsoft C -W3
 *			     - make env_parse() a generic function
 *	 4-Jun-92	SRMc - remove obsolete #if'ed sections
 *	 1-Aug-92	SRMc - fix bug in env_side() -- always use mystrdup()
 *				to save u.pszString field
 *	20-Oct-95	SRMc - fix for config.h (Autoconf)
 */
/*      SENVCK.C - check string environment constraints
 ***************************************************************************
 *	EDIT HISTORY
 *	10-May-88	Steve McConnel
 *	20-May-88	SRMc - add ec_flags field to env_cond structure, with
 *				E_NOT bit
 *	 9-Jun-88	SRMc - revise struct allomorph, revise struct sd_affix
 *				(rename SD_ to sd_), and define struct
 *				sd_infix.
 *			     - Allow unlimited number of categories for roots,
 *				or category pairs for affixes.
 *			     - Allow more information for infixes.
 *	28-Jul-88	SRMc - replace ssalloc() with malloc() and realloc()
 *       7-Sep-88       SRMc - split into ENVCHK.C and MENVCK.C
 *       9-Sep-88       SRMc - handle E_OPTIONAL
 *      21-Oct-88       SRMc - reorganize the file header comments
 *      10-Nov-88       SRMc - replace free() with myfree()
 *      17-May-89       SRMc - remove unneeded #include "dict.h" and "adefs.h"
 *                              to share this file with STAMP
 *                           - changed argument list for strenv_check() to
 *                              allow more flexibility in splitting the left
 *                              and right environments
 *      13-Jul-89       hab  - de-"lint" the source
 *      19-Jul-89       hab  - modify to check all members of a string
 *                              class that succeed (at first) and not
 *                              just assume that the first one that matches
 *                              is correct
 *      26-Jul-89       hab  - removed conditional compile for SYNTHESIS
 *      27-Jul-89       hab  - add extern char *cpystr()
 *                             add Copyright 1989
 * 1.6a 21-Jun-90 BK  Fix up for THINKC on MAC
 * 1.1b 29-Jun-90 BK/ALB Fix for portability to MAC, add string.h
 *	17-Jan-91	SRMc - replace cpystr() with strcpy()
 *			     - add #ifdef BSD for <strings.h>
 *			     - add ANSI-fied function prototypes
 *	29-Jan-91	SRMc - merged in AMPLE 1.6f sources
 *	17-Sep-91	SRMc - delint with GNU C "-Wall -ansi -pedantic" and
 *				Microsoft C -W3
 *	22-Jan-92	SRMc - rename from envchk.c to senvck.c
 *			     - fix bug with grabbing optional match when it
 *				shouldn't
 *			     - rename stcmp() to match_begin() and rstcmp()
 *				match_end()
 *	 1-Jun-92	SRMc - chk_senv_left() should never be called with
 *				the last argument set to NULL
 *	 1-Aug-92	SRMc - fix bug with handling E_ELLIPSIS together
 *				other flag values
 */
/***************************************************************************
 *	EDIT HISTORY
 *	 9-May-88	Steve McConnel - created ENVPAR.C
 *	20-May-88	Steve McConnel - create LOADCC.C and APPLCC.C
 *	 7-Sep-88	SRMc - split ENVPAR.C into ENVPAR.C, AENVPA.C,
 *				CENVPA.C, IENVPA.C, and MENVPA.C
 *			     - split LOADCC.C into LOADCC.C, NEWCHG.C, and
 *                              LOADTB.C
 *      21-Oct-88       SRMc - reorganize the file header comments
 *      10-Nov-88       SRMc - replace free() with myfree()
 *      15-May-89       SRMc - changed the function call apply_cc() to
 *                              make using it easier
 *      17-May-89       SRMc - fixed longstanding bug in environment check
 *                              using new interface to strenv_check()
 *                           - rewrite new_change() as parse_change()
 *      18-May-89       SRMc - pull NEWCHG.C, CENVPA.C, and APPLCC.C into
 *                              CHANGE.C
 *      13-Jul-89       hab  - de-"lint" the source
 *	27-Jul-89	hab  - add Copyright 1989
 * 1.1b 29-Jun-90 BK/ALB Fix for portability to MAC, add string.h
 * 1.1c 29-Jun-90 ALB Fix bug of 8-bit fail in envir, add myisspace
 *	17-Jan-91	SRMc - add ANSI-fied function prototypes
 *			     - add #ifdef BSD for <strings.h>
 *	28-Feb-91	SRMc - add code for handling insertion changes to
 *				apply_cc()
 *	16-Sep-91	SRMc - revise apply_cc() to use (and return)
 *				dynamically allocated buffers
 *			     - make ccenv_parse() a static (local) function
 *	23-Jan-92	SRMc - use newly written parse_env()
 *			     - add function prototypes and once-only protection
 *				to the header file
 *	 4-Sep-92	SRMc - use newly written report_error()
 *	 7-Sep-93	SRMc - reset ->ch_env to NULL in free_change()
 *	22-Nov-94 	SRMc - change len, lenmatch, and lensubst to unsigned
 *				in apply_cc()
 *	20-Oct-95	SRMc - fix for config.h (Autoconf)
 *	 7-Aug-96	SRMc - replace printf(...) with report_error(0,...)
 *	 8-Aug-96	SRMc - add typedef, convert structure element names
 *				to my variety of Hungarian notation
 *			     - merge struct change into struct change_list
 *			     - add pszDescription to the structure
 *			     - add freeChangeList(), remove free_change()
 *			     - add buildChangeString() and getChangeQuote()
 *			     - rename parse_change() to parseChangeString()
 *			     - rename apply_cc() to applyChanges()
 * 11-Feb-97	SRMc - merge splitl.c into change.c
 * 19-Feb-97	SRMc - allow for input strings of arbitrary length
 * 27-Feb-97	SRMc - make input arguments const where possible
 *		     - eliminate module global variables where possible
 *  1-Apr-97	SRMc - use duplicateString() where appropriate
 * 23-May-97	SRMc - use const where appropriate
 *  5-Nov-97	SRMc - create writeChange()
 */

#endif /* _CHANGE_H_INCLUDED */
