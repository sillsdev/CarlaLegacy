/* VERSION.H - version number and date information for KTEXT
 ***************************************************************************
 * Copyright 1995, 2002 by SIL International.  All rights reserved.
 */
#define VERSION 2		/* major rewrite or expansion */
#define REVISION 1		/* enhancement requiring adding to book */
#define PATCHLEVEL 8		/* bug fix or other minor change */
#define DATE "October 16, 2002"	/* date of release version */
#define YEAR "2002"		/* used for copyright notice in banner */

/*****************************************************************************
 * EDIT HISTORY
 * 16-Oct-2002	SRMc - fix for code generation problem in OPAC library
 * [2.1.8]
 * 15-Oct-2002	SRMc - facilitate memory allocation checking
 * [2.1.7]	     - plug a couple of memory leaks
 * 20-Jun-2002  hab  - fix to make work with recent Pc-Patr data structure
 * [2.1.6]              changes
 * 11-May-2000	SRMc - new release with changes to underlying libraries
 * [2.1.5]
 * 24-Apr-2000	SRMc - more minor edits for more changes to the PC-PATR data
 * [2.1.4]		structures
 * 18-Apr-2000	SRMc - minor edits for changes to the PC-PATR data structures
 * [2.1.3]
 *  2-Dec-1999	SRMc - add a -q ("work quietly") option
 * [2.1.2]
 *  2-Sep-1999	SRMc - bumped patch level for new release (revised OPAC
 * [2.1.1]		library functions)
 * 31-Jul-98	SRMc - fix for multibyte character handling by the TextControl
 * [2.1.0]		data structure and related functions
 *		     - allow ambiguous decapitalizations in text input
 * 23-Dec-97	SRMc - bumped patch level for new release (revised OPAC
 * [2.0.1]		library functions)
 * 21-Oct-97	SRMc - decide that this is a release, not a beta!
 * [2.0.0]
 *  9-Sep-97	SRMc - fix for changes to the Kimmo function library
 * [2.0b17]	     - remove obsolete "#if <number>" cruft
 * 14-Aug-97	SRMc - fix for changes to the PATR and Kimmo libraries
 * [2.0b16]
 * 13-Jun-97	SRMc - fix for changes to the CMD library (mostly renaming of
 * [2.0b15]		of data structures and functions)
 *  8-May-97	SRMc - fix for changes to the OPAC library
 * [2.0b14]	     - fix portability to the Mac
 * 20-Feb-97	SRMc - fix for STDC_HEADERS
 * [2.0b13]	     - fix for more changes to the OPAC library
 *  5-Dec-96	SRMc - fix for changes to the OPAC library
 * [2.0b12]	     - write final newline even on MS-DOS
 *  4-Oct-96 	SRMc - allow loading the grammar file in synthesis mode if
 * [2.0b11]		verification (-v) is requested
 *		     - always load string class definitions (\scl) from the
 *			KTEXT control file
 *		     - finish implementing verification (-v) for synthesis
 * 30-Sep-96 	SRMc - fix the ambiguity count to reflect the KTEXT output
 * [2.0b10]		rather than the PC-KIMMO function results (ie, don't
 *			count duplicates)
 *		     - make "ktext.ctl" the default control file, like the
 *			documentation claims
 *		     - minor edits to the usage message
 * 27-Sep-96	SRMc - add -h option
 * [2.0b9]	     - build default output filename from input filename
 *		     - check that control and input filenames are specified
 *  4-Mar-96	SRMc - fix for DJGPP 2.0 / GNU C 2.7.2
 * [2.0b8]	     - change the optimization flag to -O2 in the makefile
 * 30-Oct-95	SRMc - fix for config.h (based on GNU Autoconf processing)
 * [2.0b7]	     - get Mac/PowerPC compilation to work
 * 18-Oct-95	SRMc - remove the -w option (always write the \w field)
 * [2.0b6]	     - add the -v option (verify synthesis with word parse)
 *		     - minor changes to the usage message
 * 12-Oct-95	SRMc - change progress reporting to use showAmbiguousProgress()
 * [2.0b5]
 *  2-Oct-95	SMRc - extract code from lexicon.c for adjustedFilename() to
 * [2.0b4]		put in OPAC function library
 *		     - get program working for MS Windows (QuickWin)
 *		     - extract synthesize() function into a separate file
 * 28-Sep-95	SRMc - add check for empty cat/fd fields before dtbout()
 * [2.0b3]	     - store and access the synthesis lexicon properly (this
 *			greatly reduced the synthetic ambiguities)
 * 26-Sep-95	SRMc - add synthesis (generate) capability to KTEXT
 * [2.0b2]	     - add \rd (root delimiters) to control file
 * 25-Sep-95	SRMc - fix version.h and version.c for KTEXT
 * [2.0b1]	     - get duplicate_analysis() to work for revised PC-Kimmo
 *			recognizer() output
 * 22-Sep-95	SRMc - update KTEXT.C to work with new PC-Kimmo/PC-PATR
 * [2.0b0]		functions
 *		     - add \grammar, \cat, and \fd fields to control file
 *****************************************************************************
 *	19-Nov-91	SRMc - add fflush(stderr) for THINK C
 *			     - free change buffer in process() if apply_cc()
 *				allocates a new output buffer
 *			     - add myfree(resp) for head of result list
 *	11-Mar-91	SRMc - edit for THINK C
 *	 7-Mar-91	SRMc - rename from PCKAMP to KTEXT
 *	 6-Mar-91	SRMc - add myshrink() for use by some of the functions
 *				from AMPLE/STAMP
 *			     - write Analysis Failures (AF:) to the log file,
 *				if a log file has been requested
 *	 2-Mar-91	SRMc - fix for using OPAC function library
 *	28-Feb-91	SRMc - eliminate needless duplication of analyses in
 *				the output file
 *			     - define and implement control file for this
 *				program, including "changes" for modifying
 *				the format of the analysis and decomposition
 *				output
 *			     - pass ambigchar as an argument to dtbout()
 *	27-Feb-91	SRMc - start editing PCKIMMO.C and WF.C (from the
 *				not-yet-released OPAC primer package) to
 *				produce this program
 */
