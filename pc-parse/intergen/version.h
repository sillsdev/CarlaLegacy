/* VERSION.H - version number and date information for INTERGEN
 ***************************************************************************
 * Copyright 1998, 2000 by SIL International.  All rights reserved.
 */
#define VERSION 2		/* major rewrite or expansion */
#define REVISION 1		/* enhancement requiring adding to book */
#define PATCHLEVEL -12		/* bug fix or other minor change */
#define DATE "July 23, 2001"	/* date of release version */
#define YEAR "2001"		/* used for copyright notice in banner */

/****************************************************************************
 * EDIT HISTORY
 * 23-Jul-2001  hab  - If the \w field is being used, there is no need to apply
 * [2.1.b12]            output changes or to try to recapitalize: the content
 *                      of the \w field already has these.
 * 26-Oct-2000  hab  - If the first word is a failure, then the underlying form
 * [2.1.b11]            field was not displayed, resulting in the next word's
 *                      \u content to appear under the first word.
 * 11-May-2000	SRMc - fix portability to antique C compilers
 * [2.1b10]
 * 17-Apr-2000	SRMc - use strncat properly - the third argument is the maximum
 * [2.1b9]		number of non-NUL characters that can be appended, NOT
 *			the total size of the destination buffer
 *  2-Sep-1999	SRMc - bumped patch level for new release (revised OPAC
 * [2.1b8]		library functions)
 * 19-May-1999  hab  - fix erroneous reporting of \c as missing instead of \cat
 * [2.1b7]
 * 09-Apr-1999  hab  - fix so multibyte characters are treated as counting
 * [2.1b6]              only one character (not 2 or however long it is)
 * 31-Jul-98	SRMc - fix for multibyte character handling by the TextControl
 * [2.1b5]		data structure and related functions
 * 18-May-98	SRMc - replace call to gets() with fgets(), as generally
 * [2.1b4]		recommended
 * 11-May-98    hab  - Changed default feature standard format field to \\fea.
 * [2.01b3]            Fixed erroneous usage() output and error message in
 *                     determineFieldCode().
 * 06-May-98    hab  - Fixed spurious output bug when a requested field
 * [2.01b2]            was not in the input file.
 *                     In usage(), add a pause message after about 20 lines.
 * 28-Apr-98    hab  - Added -f switch to output backslash codes at the
 * [2.01b1]            beginning of each output line.
 *                     Fixed monitoring to not display a failure for the final
 *                     "non-word word" (which exists when there are trailing
 *                     format markers.
 * 06-Apr-98    hab  - Fixed bug with monitoring that displayed a failure as
 *                     an analysis.
 * 31-Mar-98    hab  - Add ability to output any field in the ANA file and to
 *                     output them in any order.  Added command line option
 *                     -s for the user to indicate which fields and in what
 *                     order to output.  Default remains as before: decomp,
 *                     underlying form (if present) and analysis.  A field
 *                     may be output more than once if so desired.
 *                   - Add check for a maximum line length that is longer than
 *                     the internal buffer size.
 *                   - Remove check for existence of output file
 *                   - Added -m monitor progress option
 *                   - Added -q quiet mode option
 *                   - Added -e show every decomposition ambiguity option
 *                   - Fixed a bug which would output a set of blank lines
 *                     whenever there was nothing on the current line and
 *                     the next word to be added was larger than the max line
 *                     length.  This is a very old bug.
 * 20-Mar-98	SRMc - fix for new OPAC and CPORT libraries (this eliminates
 * [1.99b1]		all source files except INTERGEN.C itself)
 *		     - split the version information and history into a
 *			separate header file
 *		     - change strcpy() to strncpy() and strcat() to strncat()
 *			everywhere they appear
 *		     - rename global variables to pseudo-Hungarian forms
 * 1.2i 10-May-95 BJY Fix bug of underlying forms not aligning properly
 * 1.2h 09-May-95 BJY Fix bug of format markers causing alignment problems
 *			and remove dependence on LCPORT.LIB
 * 1.2g 12-Aug-94 hab Port to DJGPP compiler; add ability to include \u
 *			field (underlying form)
 * 1.2f	 3-Mar-94 WM  Add a command line option -d for decomposition char.
 * 1.2e	 6-Dec-93 CLR Make sure add_non_alpha recognizes string terminators
 * 1.2d 12-Apr-93 AB Add trailing space to get around Shoebox select bug
 * 1.2c 22-Jul-92 BK Port new version to Mac THINK_C
 * 1.2b	 1-Aug-91 AB Fix bug of not aligning if format mark w/o \n
 * 1.2a 31-Jul-91 AB Fix bug of not breaking lines at format markers
 * 1.2	13-Feb-91  AB Change to large model, compile under C6.00A
 *			Change heading to not mention INTER.PTP
 *			Change to show ambiguities when aligning
 *			Add -n option to not show ambigs as before
 *			Change index to strchr and rindex to strrchr
 * 1.1a 21-Nov-89  AB Add -w option for maximum width of output
 * 1.1	 2-Nov-89  AB Version change for release
 * 1.0f	 2-Nov-89  AB Add file name options to command line -i input,
 *			  -o output, -t Text output control file
 * 1.0e	 2-Nov-89  AB If aligning output %0 for fail gloss
 *		      If aligning output %2 etc before gloss for ambig
 * 1.0d	 1-Nov-89  AB Move heading up to just under history
 *		      Add -a option to align output and give blank line
 * 02-Aug-89	   hab	- replace struct strlist in defs.h with
 *			   STAMP's strlist.h
 *			  de-lint the source
 *			  version 1.0c
 * 26-Jul-89	   hab	- rename load_scl to add_scl
 *			  replace struct code_table in defs.h with
 *			   STAMP's codetab.h
 *  4-Jan-89	   SRMc - fix for Microsoft C
 * 12-Nov-88	   SRMc - intergen ? now prints helpful (?) message
 * 10-Nov-88	   SRMc - replace free() with myfree()
 * 20-Oct-88	   SRMc - revise consume() parameter list, rename the
 *			   function to init_record()
 *			- reorganize the file header comments
 * 18-Oct-88	   SRMc - prevent dereferencing NULL pointer in
 *			   interout()
 * 14-Oct-88	   SRMc - INTRGN becomes INTERGEN (therefore version 1.0)
 *			   (also, ANTXGN becomes AMPLE)
 * 13-Sep-88	   SRMc - edit prompt strings; preserve input filename
 *  8-Sep-88	   SRMc - remove \incl \excl \punc \barchar and \barcodes
 *			   from code table
 *			- change control file name to xxOUTX.CTL
 *			- improve check for leading punctuation in
 *			   nl_needed()
 *  7-Sep-88	   SRMc - fix for ANTXGN version 1.00; rename file to
 *			   INTRGN.C, merge in INTOUT.C and RECAP.C
 *			   (now a single source file not counting DTBIN.C
 *			   and sources shared with ANTXGN)
 *			= program is *SUBSTANTIALLY* changed
 * 14-Oct-87	   gbc - version unnumbered -> v1.1
 *		       - new ufopen() used;
 *		       - use register in ortset().
 *  8-May-87	   hab
 *  5-May-87	   H.A. Black
 */
