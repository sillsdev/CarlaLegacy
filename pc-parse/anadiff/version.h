/* VERSION.H - version number and date information for ANADIFF
 ***************************************************************************
 * Copyright 1997, 2017 by SIL International.  All rights reserved.
 */
#define VERSION 1		/* major rewrite or expansion */
#define REVISION 0		/* enhancement requiring adding to book */
#define PATCHLEVEL 7		/* bug fix or other minor change */
#define DATE "April 25, 2017"	/* date of release version */
#define YEAR "2017"		/* used for copyright notice in banner */

/*****************************************************************************
 * EDIT HISTORY
 * 25-Apr-2017	SRMc - Fix for 64-bit Windows build; also remove as many
 * [1.0.7]             compiler warnings as possible
 * 16-Oct-2002	SRMc - fix for code generation problem in OPAC library
 * [1.0.6]
 * 11-May-2000	SRMc - fix portability to antique C compilers
 * [1.0.5]
 * 24-Apr-2000	SRMc - remove some leftover cruft from earlier versions that
 * [1.0.4]		had been effectively commented out
 *  2-Sep-1999	SRMc - bumped patch level for new release (revised OPAC
 * [1.0.3]		library functions)
 * 31-Jul-98	SRMc - bumped patch level for new release (revised OPAC
 * [1.0.2]		library functions)
 * 23-Dec-97	SRMc - bumped patch level for new release (revised OPAC
 * [1.0.1]		library functions)
 * 24-Oct-97	SRMc - decide that this is a release, not a beta!
 * [1.0.0]	     - fix a bug in show_differences() that was dumping core
 *  1-Oct-97	SRMc - fix bugs in parallel_equivalent() and show_differences()
 * [1.0b6]	     - merge version.c into anadiff.c (no need for 2 files)
 *		     - add bSilent flag and -qq command option behavior
 * 14-Aug-97	SRMc - fix for changes to various libraries
 * [1.0b5]	     - add exit message for the Macintosh and QuickWin versions
 * 13-Jun-97	SRMc - new interim release fixed for changes to the various
 * [1.0b4]		libraries
 *  8-May-97	SRMc - fix for changes to the OPAC library
 * [1.0b3]	     - fix portability to the Mac
 * 10-Apr-97	SRMc - revise output format slightly
 * [1.0b2]	     - add the -a (ambiguity marker) command line option
 *  7-Apr-97	SRMc - create separate VERSION.C and VERSION.H files
 * [1.0b1]	     - revise output format to emphasize actual differences
 */
