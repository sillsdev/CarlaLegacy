/* ToneAnal.H -
 ***************************************************************************
 *
 *	ToneAnal prototype
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 2000 by the SIL International
 * All rights reserved.
 */
#ifndef _TONEANAL_H_INCLUDED
#define _TONEANAL_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

/***************************************************************************
 *  function prototypes
 */
#include "stamp.h"
extern void do_tone_anal P((StampUnit *pUnit_in,
				int do_trace,
				StampData *pStamp_in));

/***************************************************************************
 *	EDIT HISTORY
 *  8-May-89	SRMc - extract from AMPLE's defs.h file
 * 16-Sep-91	SRMc - protect against multiple #include's
 *		     - provide ANSIfied function prototypes
 * 20-Jul-92	SRMc - add append_to_strlist()
 *		     - rename append_strlist() to catenate_strlist()
 *		     - split into individual file per function
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 *  8-Aug-96	SRMc - add typedef, convert structure element names to my
 *			variety of Hungarian notation
 * 10-Oct-96	SRMc - add unlist_strlist() and update_strlist() functions
 * 11-Feb-97	SRMc - rename add_to_strlist()    to mergeIntoStringList()
 *		     - rename append_to_strlist() to mergeIntoStringListAtEnd()
 *		     - rename catenate_strlist()    to mergeTwoStringLists()
 *		     - rename copy_strlist()        to duplicateStringList()
 *		     - rename equal_strlist()       to identicalStringLists()
 *		     - rename equivalent_strlist()  to equivalentStringLists()
 *		     - rename free_strlist()        to freeStringList()
 *		     - rename member_strlist()      to isMemberOfStringList()
 *		     - rename remove_from_strlist() to removeFromStringList()
 *		     - rename size_of_strlist()     to getStringListSize()
 *		     - rename squeeze_strlist()     to squeezeStringList()
 *		     - rename unlist_strlist()      to unlinkStringList()
 *		     - rename update_strlist()      to updateStringList()
 *		     - rename write_strlist()       to writeStringList()
 *  8-Oct-97	SRMc - cosmetic changes and proofreading
 * 21-Jul-98	SRMc - fix a typo in a comment
 * 16-Oct-98	SRMc - make header files safe for #including in C++ sources
 */
#ifdef __cplusplus
}
#endif
#endif /* _TONEANAL_H_INCLUDED */
