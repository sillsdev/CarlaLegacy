/* VERSION.H - version number and date information for KTAGGER
 ***************************************************************************
 * Copyright 1995, 2002 by SIL International.  All rights reserved.
 */
#define VERSION 1		/* major rewrite or expansion */
#define REVISION 0		/* enhancement requiring adding to book */
#define PATCHLEVEL 9		/* bug fix or other minor change */
#define DATE "October 15, 2002"	/* date of release version */
#define YEAR "2002"		/* used for copyright notice in banner */

/*****************************************************************************
 * EDIT HISTORY
 * 15-Oct-2002	SRMc - facilitate memory leak testing
 * [1.0.9]	     - plug a couple of minor memory leaks
 * 20-Jun-2002  hab  - fix to make work with recent Pc-Patr data structure
 * [1.0.8]              changes
 * 11-May-2000	SRMc - new release with changes to underlying libraries
 * [1.0.7]
 * 24-Apr-2000	SRMc - more minor edits for more changes to the PC-PATR data
 * [1.0.6]		structures
 * 18-Apr-2000	SRMc - minor edits for changes to the PC-PATR data structures
 * [1.0.5]
 *  2-Dec-1999	SRMc - get -q option to work properly
 * [1.0.4]
 *  2-Sep-1999	SRMc - bumped patch level for new release (revised OPAC
 * [1.0.3]		library functions)
 * 31-Jul-98	SRMc - bumped patch level for new release (revised OPAC
 * [1.0.2]		library functions)
 * 23-Dec-97	SRMc - bumped patch level for new release (revised OPAC
 * [1.0.1]		library functions)
 * 21-Oct-97	SRMc - decide that this is a release, not a beta!
 * [1.0.0]
 * 10-Sep-97	SRMc - fix for changes to the Kimmo function library
 * [1.0b13]	     - fix memory allocation problem (double free)
 * 14-Aug-97	SRMc - fix for changes to the PATR and Kimmo libraries
 * [1.0b12]
 * 13-Jun-97	SRMc - fix for changes to the CMD library (mostly renaming of
 * [1.0b11]		of data structures and functions)
 *  8-May-97	SRMc - fix for changes to the OPAC library
 * [1.0b10]	     - fix portability to the Mac
 * 20-Feb-97	SRMc - fix for STDC_HEADERS
 * [1.0b9]	     - fix for changes to the OPAC function library
 *  5-Dec-96	SRMc - fix for changes to the PC-Kimmo function library
 * [1.0b8]
 *  4-Mar-96	SRMc - fix for DJGPP 2.0 / GNU C 2.7.2
 * [1.0b7]	     - change optimization flag to -O2 in the makefile
 * 30-Oct-95	SRMc - fix for config.h (based on GNU Autoconf processing)
 * [1.0b6]	     - get Mac/PowerPC compilation to work
 * 12-Oct-95	SRMc - change progress reporting to use showAmbiguousProgress()
 * [1.0b5]
 *  2-Oct-95	SRMc - fix for ccommand() in the OPAC function library
 * [1.0.-4]	     - fix for new adjustedFilename() function in the OPAC
 *			function library
 * 14-Sep-95	SRMc - adjust for changes to the PC-PATR function library
 * [1.0.-3]	     - add version.c to simplify banner
 *  8-Jun-95	SRMc - fix bug in displaying features with write_feature()
 * [1.0.-2]	     - add report_progress() and cancelOperation for DDE
 *			compatibility
 * 19-May-95	SRMc - Add "FEAT" as way to grab entire top node feature
 * [1.0.-1]		structure
 *		     - Add explicit error checks and messages for loading the
 *			rules, lexicon, and grammar files
 *  2-May-95	SRMc - change "pretag" to "starttag" and "posttag" to "endtag"
 * [0.9.2]	     - add \rem field code for comments ("remarks")
 *  3-Apr-95	SRMc - open log file if one is specified, and use it
 * [0.9.1]	     - fix bugs with whitespace in the input word list
 *		     - add progress report output, and -q option to prevent it
 *		     - use display_parse() instead of print_parses() for the
 *			<TREE> pseudo path
 * 29-Mar-95	SRMc - finished creating original version according to the
 * [0.9.0]		preliminary specifications, and running on MS-DOS,
 *			MS Windows, Unix, and Macintosh
 * 24-Mar-95	SRMc - start writing based on preliminary specifications
 *			by Evan Antworth
 */
