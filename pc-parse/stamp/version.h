/* VERSION.H - version number and date information for STAMP
 ***************************************************************************
 * Copyright 1997-2017 by SIL International.  All rights reserved.
 */
#define VERSION 2		/* major rewrite or expansion */
#define REVISION 3		/* enhancement requiring adding to book */
#define PATCHLEVEL 1		/* bug fix or other minor change */
#define DATE "April 25, 2017"	/* date of release version */
#define YEAR "2017"		/* used for copyright notice in banner */

/******************************************************************************
 * EDIT HISTORY
 * 25-Apr-2017	SRMc - Fix for 64-bit Windows build; also remove as many
 * [2.3.1]             compiler warnings as possible
 * 02-Jun-2016  hab  - Allow for partial and full reduplication.
 * [2.3.0]
 * 03-Dec-2004  hab  - Ignore interfix entry type in unified dictionaries
 * [2.2.1]
 * 07-Jan-2004  hab  - Enhancement: add negative SECs (~/)
 * [2.2.0]
 * 04-Nov-2003  hab  - Fix bug: multiple allomorphs with differing PECs could
 * [2.1.18]             end up using only the first.
 * 20-May-2003  hab  - When matching category and morphname of a root from the
 * [2.1.17]             ANA file (tsdict.c), did not necessarily set the
 *                      category of the returned dictionary entry to the
 *                      category in the ANA file.  This gave some odd results
 *                      for tools like TonePars which are an ANA filter and
 *                      also use the dictionary entry (Note: STAMP does not
 *                      have this characteristic and therefore this problem
 *                      never showed for STAMP).
 * 13-Jan-2003	hab  - input and output filename buffer sizes were too small;
 * [2.1.16]	         increased to 300 (from 100)
 * 16-Oct-2002	SRMc - fix for code generation problem in OPAC library
 * [2.1.15]	     - fix compilation problem under Visual Studio
 * 15-Oct-2002	SRMc - facilitate memory allocation checking
 * [2.1.14]	     - fix some memory leaks
 *  4-Oct-2002	SRMc - fix bugs found by evaluating Insure++
 * [2.1.13]
 *  2-Oct-2002	SRMc - fix memory allocation botch in performStampSynthesis():
 * [2.1.12]		mergeTwoStringLists() can free nodes (and their
 *			strings) in the second string list.
 * 15-Aug-2002  hab  - Internal changes for ToneGen.
 * [2.1.11]
 * 12-Apr-2002  hab  - Add allomorph and morpheme properties to affix line
 * [2.1.10]              in synthesis trace.
 * 20-Sep-2001  hab  - Synthesis trace was silent when no infix location
 * [2.1.9]               condition could be found.  It also had some extra
 *                       output when trying infixes.
 * 24-Jul-2001  hab  - Fix bug: empty environment constraint messages did not
 * [2.1.b8]              include any information about which entry they were
 *                       for.  (fixed in envpar.c)
 * 17-Jul-2001  hab  - rework synthesis trace output to be more like AMPLE's
 * [2.1.b7]
 * 26-Oct-2000  hab  - fix bug which complained about multiple category fields
 * [2.1.b6]             in dictionary entries (when it should not)
 * 11-May-2000	SRMc - fix portability to antique C compilers
 * [2.1.b5]
 * 24-Apr-2000	SRMc - remove some leftover cruft from earlier versions that
 * [2.1b4]		had been effectively commented out
 *  2-Sep-1999	SRMc - bumped patch level for new release (revised OPAC
 * [2.1b3]		library functions)
 * 16-Jul-1999  hab  - fix fallacious error report of missing dictionary type
 * [2.1b2]              when field was final field in record; in
 *                      addAmpleDictEntry() (in setsd.c)
 * 13-May-1999  hab  - add punctuation environment constraint capability
 * [2.1b1]
 * 04-May-1999  hab  - changed upper range to go from codes 127 to 255
 * [2.0b5]              instead of from code 128 to 254 in sytest.l
 * 20-Apr-1999	SRMc - minor fix for changes to AMPLE code
 * [2.0b4]
 * 13-Nov-1998	SRMc - finish renaming static variables in pseudo Hungarian
 * [2.0b3]	     - ensure global functions are fully reentrant
 *		     - removed the \cat field from the STAMP control file, and
 *			the eCategoryOutput field from the StampData struct
 *		     - fix error messages to end with a newline rather than
 *			begin with a newline
 * 16-Oct-1998	SRMc - for each "unknown root category", add it to the set of
 * [2.0b2]		categories when doing transfer only.  this preserves
 *			the category information for synthesis later.
 *		     - remove direct uses of stdout
 *		     - fix for new (run-time optional) larger properties
 *		     - report synthesis failures more accurately in the log
 *			file and in the monitoring display
 *		     - make header files safe for #including in C++ sources
 * 31-Jul-98	SRMc - fix for multibyte character handling by the TextControl
 * [2.0b1]		data structure and related functions
 *		     - fix transfer to pass regression tests (using anadiff)
 *		     - fix transfer output to include all input fields
 * 19-Feb-98	SRMc - replaced ampcport.c and getopt.c with CPORT and OPAC
 * [1.99b2]		function libraries
 *		     - replaced myallo.c, strlist.c, trie.c, change.c, getwd.c,
 *			strcla.c, record.c, luwfc.c, myctype.c, txtout.c, and
 *			much of dtbin.c and dtbout.c with OPAC functions
 *			(replacing record.c with OPAC functions fixed a bug of
 *			not loading text output changes if the text output
 *			control file did not end with a newline)
 *		     - merged dtbin.c and dtbout.c (with greatly reduced
 *			functionality due to OPAC functions) to form dtbio.c
 *		     - replaced categ.c, proper.c, morcla.c, envlex.c,
 *			envsho.c, aenvpa.c, ienvpa.c, and mktest.c with
 *			AMPLE library functions
 *		     - eliminated #ifdef USING_TRIE and #ifdef SYNTHESIS
 *		     - merged all header files into stamp.h
 *		     - renamed data structures and members
 *		     - merged global variables into StampData data structure
 *		     - renamed the -u (unfound morpheme) option to the -r
 *			(report unfound morpheme) option
 *		     - implemented the -q (work quietly) option
 *		     - implemented the -u (unified dictionary) option
 *		     - removed explicit use of stdout and stderr
 * 24-Oct-97	SRMc - merged edit history comments together into version.h
 * [1.99b1]	     - created version.c, revise banner message to use global
 *			version variables
 *		     - renamed a number of global variables to my Hungarian
 *			notation
 *		     - moved tsinit() to stamp.c
 ******************************************************************************
 * 1.5e 15-Dec-95 BJY - Have STAMP pass \p information through
 * 1.5d 12-Jun-95 BJY - Get rid of half implemented code for 'word' tests
 * 1.5c 06-Jun-95 BJY - Put in HAB fixes for better yacc/bison error reporting
 * 1.5b 02-May-95 BJY - Added \strcheck field to control file and code to do
 *			validation checks on allomorphs, SEC's and string
 *			classes
 * 1.5a 28-Apr-95 BJY - Add command line option -n for optionally disabling
 *			root category checks.
 * 1.5  27-Apr-95 BJY - Output record number in error messages if record key
 *			is empty.
 *		      - Allow curly braces in substitution rules
 *		      - Modified behaviour of curly braces and square brackets
 *			in all morpheme environments to the following:
 *			    Curly braces: Look first for category or property
 *					  but accept morpheme class.
 *			    Brackets: Look first for morpheme class but also
 *				      accept a category or property.
 * 1.4z 21-Apr-95 BJY - Fix problem introduced in 1.4w
 * 1.4y  7-Mar-95 BJY - Resync STAMP and AMPLE and share some files in
 *			SourceSafe
 *		      - Incorporate some bug fixes from AMPLE code as well.
 * 1.4x  6-Mar-95 BJY - Fix bug of not recognizing category class specified
 *			in morpheme environment
 * 1.4v 10-Feb-95 BJY - Port to Windows EXE and _WINDLL. Also fixed null
 *			pointer bugs and memory corruption problem.
 * 1.4w  3-Mar-95 ALB - Fix bug of root category being changed falsely by
 *			dict lookup
 * 1.4u 26-Jan-95 ALB - Fix Bill Mann urgent bug from 1.4m of root categories
 *			always having to match.  Now cats only have to match
 *			during insertion rule lookups.  Still needs command
 *			line option for category match.
 * 1.4t  3-Nov-94 ALB - Put better label on synthesis trace output
 *			Remove a section of debug printout
 * 1.4s 18-Oct-94 ALB - Fix bug of uninit fail of property check in \sr envir
 * 1.4r  6-Oct-94 CLR - Convert STAMP to MSC version 8
 * 1.4q 16-Sep-94 CLR - Make STAMP acceptable to the DJG compiler
 * 1.4p  2-Sep-94 CLR - Have STAMP pass \fd information through
 * 1.4n 30-Aug-94 CLR - Correct misalignment among analyses, decomps, and cats
 * 1.4m 11-May-94 CLR - Require root categories to match when necessary (bug
 *			fix)
 * 1.4k  3-May-94 CLR - Remove copy rule hang bug introduced in 1.4g
 *	22-Mar-94 hab - make DJGPP compiler happy: remove its warning msgs
 *		      - changed BIGRECSIZE to make MSC_VER 8.00 happy
 *		      - made mystrdup check for null pointer
 * 1.4j  9-Mar-94 WM  Correct failure to use ... in SEC with [].
 * 1.4i 22-Feb-94 CLR - Compile changes made since 1.4h to remove warning
 *			messages
 * 1.4h  7-Feb-94 CLR - Have show_word_template print "capital =", rather than
 *                      "non_alpha =", when introducing capital.
 * 1.4g 26-Jan-94 CLR Have STAMP pass \cat information through
 * 1.4f 16-Dec-93 CLR - Revise warning message for missing dictionary entries;
 *                      remove the total
 * 1.4e 10-Dec-93 CLR - Collapse identical allomorph environments for roots
 * 1.4d  9-Dec-93 CLR - Make a version which incorporates the following changes
 *       9-Dec-93 CLR - Tweek pre-allocated buffer sizes to work with Codeview
 *       3-Dec-93 CLR - Collapse prop_list and cat_list types into strlist
 *       3-Dec-93 CLR - Move morph check and record size #defines from DEFS.H
 *			to MYALLO.H
 *       3-Dec-93 CLR - Move record size #defines from DEFS.H to MYALLO.H
 *       3-Dec-93 CLR - Put double quotes in messages where appropriate
 *       3-Dec-93 CLR - Save dictionary space by consolidating category strings
 *       1-Dec-93 CLR - #ifdef permanent heap code
 *       1-Dec-93 CLR - #include DEFS.H
 *       1-Dec-93 CLR - #include DEFS.H in MKTEST.C and TRIE.C
 *       1-Dec-93 CLR - Declare alloca() only for DJG compiler
 *       1-Dec-93 CLR - Declare alloca() only for DJG compiler - SYTEST.Y
 *       1-Dec-93 CLR - Exit if record is too big
 *      22-Sep-93 CLR - Add 'void' to prototypes where appropriate
 *	18-Aug-93 SRMc - port to the DJGPP 32-bit compiler for MS-DOS
 *		       - generalize the Mac THINK C port
 *                     - check for NUL character where appropriate
 *                     - replace zero() with memset()
 *                     - allow for virtual memory
 *		       - fix calls to strchr() to handle unsigned char values
 *                       when char is signed by default
 *                     - ensure that structs are defined before being used
 *                       in function prototypes
 *		       - add related function prototypes to header files
 *		       - fix logic for preventing count of %0%%
 *		       - regularize some #ifdefs
 *                     - use unsigned char for properties instead of char
 *                     - check for NULL morpheme.u.rootcats in add_root()
 *		       - check for NULL propval string in has_prop()!!!!
 *                     - initialize aprops with NULL instead of 0L
 *                     - check for NULL node pointer in finalize_node()
 *		       - use empty string instead of NULL in recursive calls
 *                       to chk_senv_left()
 *                     - double check for prev_word and next_word being NULL
 *		       - declare show_mcl() as void
 *		       - declared show_scl() and bad_sc() as void
 * 1.4  17-May-93 CLR - Port to Mac
 *			Ignore {, } in SEC; warn if matching pair; make SEC
 *                      check work in surrounding words
 *			Warn if crossing # in morph env in AMPLE
 * 1.3f 22-Apr-93 CLR - Port permanent heap code from AMPLE; also incorporate
 *                      WM's code to make {prefix}, {suffix}, and {infix}
 *                      like {root} in morpheme environment constraints
 * 1.3e  1-Apr-93 CLR - Don't require root categories to match
 * 1.3d  1-Apr-93 CLR - Incorporate WM's code to report incoming morphnames not
 *                      in dicts
 * 1.3c 15-Mar-93 CLR - Eliminate null pointers to uppercase and lowercase
 *                      word formation charaters.
 * 1.3b 11-Mar-93 CLR - Fix version 1.3 hang bug and num_words bug for monitor
 * 1.3a 26-Jan-93 CLR - Improve dictionary storage efficiency
 * 1.3  19-Jan-93 CLR - Include isascii in SEC error check; 1.3 is last version
 *                      before improving dictionary storage efficiency
 * 1.2p 13-Jan-93 CLR - Check for SEC errors during dictionary load.
 * 1.2n  1-Jan-93 CLR - Expand environment to include surrounding words
 * 1.2m 13 Oct-92 ALB - Reconcile MAC and DOS versions
 * 1.2l 18-Jul-92 BK  - Port new version to Mac THINK_C
 * 1.2k  8-Jun-92 ALB - Make monitor output number after every 100 words
 * 1.2j 20-May-92 ALB - Check curly brace contents during dictionary load
 * 1.2h 13-May-92 ALB - Make dictionary environment errors show record key
 * 1.2g 12-May-92 ALB - Make dic load errors show record key for Shoebox A1.7n
 * 1.2f 31-Mar-92 ALB - Do dict lookup before \sr so props work in envirs
 * 1.2e 30-Mar-92 ALB - Make property refs work in transfer envirs
 * 1.2d 27-Mar-92 ALB - Make -x load dictionaries and all other files
 *                    - This allows property references in transfer rules
 *                      (But it turns out they don't work yet)
 *                    - Also makes CMD file the same as full process
 * 1.2c 25-Mar-92 ALB - Fix bug of envir not recognizing property to right
 *                    - Eliminate bogus message from space around affix cats
 * 1.2b 23-Mar-92 ALB - Fix bug of not showing curly braces in trace
 * 1.2a  8-Jan-92 ALB - Allow 255 properties max, up from 32 previously
 * 1.2  10-Dec-91 ALB - Version change for release
 * 1.1t 22-Nov-91 ALB - Add {root} in morpheme environment constraint
 *                    - Add {prop} property in MEC
 *                    - Add {cat} category in MEC
 * 1.1s 15-Nov-91 ALB - Fix for new FLEX to make 8-bit work in tests
 * 1.1r 13-Nov-91 ALB - Allow space between tilde and underline
 * 1.1p  6-Nov-91 ALB - Allow \luwfc mult chars to map to one, req by Bill
 * 1.1n  4-Jul-91 ALB - Remove overwrite message for output file
 * 1.1m  8-Jun-91 ALB - Add memory usage message if verifying
 * 1.1k  6-Jun-91 ALB - Prevent logging of file names if verifying
 * 1.1j  6-Jun-91 ALB - Remove number capability from \sr [V 1] > [V 1]
 * 1.1h  5-Jun-91 ALB - Fix bug of error message tight against file name
 * 1.1g  9-Nov-90 ALB - Fix bug of -x not outputting tabs in \f field
 * 1.1f 02-Aug-90 hab - Add lower-upper word formation character handling
 *                    - Change index to strchr and rindex to strrchr
 *                    - De-lint the source
 * 1.1e 31-Jul-90 hab - Redo infixation algorithm (also fix incorrect display
 *                      of (RSC set) for infixes)
 *                    - Also add Elsewhere allomorph processing
 *                    - Also allow for infixes between compound roots
 * 1.1d  2-Jul-90 ALB - Fix bug of hanging if "U" given in sycd.tab
 * 1.1c 29-Jun-90 ALB - Fix bug of 8-bit fail in envir, add myisspace
 * 1.1b 29-Jun-90 BK/ALB - Fix for portability to MAC, add string.h
 * 1.1a 18-May-90 ALB - Fix bug of not accepting multiple input files
 * 1.1   1-May-90 ALB - Version change for release
 * 1.0u  1-May-90 ALB - Prevent statistical count of %0%% placeholder
 * 1.0t 20-Apr-90 ALB - Remove allow category class without brackets
 *                    - Make category class apply to following if it can
 * 1.0s 22-Mar-90 ALB - Fix bug in insertion of multiple infixes
 * 1.0r 20-Mar-90 ALB - Change to insert infixes from right to left
 * 1.0q 20-Mar-90 ALB - In \sr make [N] not become category of following
 *                      Ie. any bracketed element stands for a morpheme
 *                    - Also, allow category class without brackets
 * 1.0p 14-Mar-90 ALB - Change BUFSIZ to 300 from 200
 * 1.0n 14-Mar-90 ALB - Fix bug of wrong dot spacing and word count
 * 1.0m 14-Mar-90 ALB - Allow cat and cat class in morpheme environment
 * 1.0k 12-Mar-90 ALB - Allow category and cat class alone in match and repl
 *                    - Connect category replace element with corresponding
 *                      match element
 *                    - Add code to allow index on class, eg [N 2]
 * 1.0j  9-Mar-90 ALB - Start on word transfer, read in a whole sentence
 *                      This ended up not used for any real purpose, because
 *			we decided to pre-join phrases instead
 * 1.0i  1-Mar-90 ALB - Fix bug in getwd with 8-bit input
 * 1.0h 14-Feb-90 ALB - Allow infix to insert before morpheme
 * 1.0g 12-Feb-90 ALB - Remove ignore environment on last allo, not good
 * 1.0f 10-Jan-90 ALB - Add capability to recap from bitfield
 * 1.0e 19-Dec-89 ALB - Change replace to substitution in error messages
 *                    - Also change proto form marker message wording
 * 1.0d 15-Dec-89 ALB - Fix bug of no \n before "Counts for user-defined..."
 *                    - Change "user defined" to "user-defined" in stats
 *                    - Change "Builtin Function..." to "built-in tests"
 *                    - Remove val = 0x000... from property print of -v
 *                    - Prevent jibberish if -o used without -i or converse
 *                    - Let statistics come out even if no log file
 * 1.0c  7-Dec-89 ALB - Force single morpheme on right of \lc to root
 * 1.0b  7-Dec-89 ALB - Add \ambig and \rd to transfer and synthesis files
 * 1.0a  5-Dec-89 ALB - Fix bug of not matching \mcl in \sr and \lc correctly
 * 1.0   5-Dec-89 ALB - Version change for release
 * 0.9z  5-Dec-89 ALB - Fix bug of synthesis \lc blocking \rsc
 * 0.9y  4-Dec-89 ALB - Shorten various trace headers and labels
 * 0.9w 14-Nov-89 ALB - Finish \sr loosening, give all roots categories
 * 0.9v 13-Nov-89 ALB - Loosen match requirements on \sr rules
 *                    - Fix bug of sytest_y.c making compiler refuse _iobuf
 *		      - Change BUFSIZ to BUFSIZE in cmd_gets
 * 0.9u  9-Nov-89 ALB - Change -f usage to "data files" as Dave asked
 * 0.9t  8-Nov-89 ALB - Align ambiguity statistics better
 * 0.9s  8-Nov-89 ALB - Change usage and log as Dave requested
 *                      Don't show test statistics if log to screen
 * 0.9r  5-Oct-89 ALB - Change to use LCPORT.LIB instead of sources
 * 0.9q  5-Oct-89 ALB - Fix bug of free_analysis freeing things from dic
 * 0.9p  5-Oct-89 ALB - Fix bug of not freeing analysis structure
 * 0.9n  4-Oct-89 ALB - Fix bug of not displaying file names on -f option
 * 0.9m  4-Oct-89 ALB - Fix bug of insert after single root not right
 * 0.9k  4-Oct-89 ALB - Add \ambig in text out ctrl file for output char
 * 0.9j  4-Oct-89 ALB - Add warning if no category on an affix
 * 0.9h  3-Oct-89 ALB - Fix to ignore environment on last allomorph in list
 * 0.9g  2-Oct-89 ALB - Allow category, category class, string class, morpheme
 *                      class, morpheme property, and allomorph property
 *                      declarations in transfer file and synthesis file
 * 0.9f  2-Oct-89 ALB - Bring in morcla.c from AMPLE (cosmetic changes only)
 * 0.9e 21-Sep-89 ALB - Add -f command line option
 * 0.9d 14-Sep-89 ALB - Change zzSY.CHG zzSYNT.CHG in prompt
 * 0.9c 14-Sep-89 ALB - Make -m show number of ambigs like AMPLE
 * 0.9b 14-Sep-89 ALB - Add -i and -o to usage, change to [options]
 * 0.9a 14-Sep-89 ALB - Add -i and -o command line options
 * 0.8w  8-Sep-89 ALB - Add message heads to all messages
 * 0.8v  8-Aug-89 hab/ab - Change user tests to match new AMPLE form
 *                    - Eliminate quotes, allow [], allow 0
 * 0.8u  2-Aug-89 ALB - Add \cr rules (copy rules)
 * 0.8t 31-Jul-89 ALB - Incorporate Mac (THINK_C) files from Bob
 * 0.8s 31-Jul-89 ALB - Incorporate AMPLE files from Andy
 * 0.8r 21-Jul-89 ALB - Fix bug of not getting affix cats from dic
 * 0.8q 21-Jul-89 ALB - Allow affix dict entry with no category
 *		      - Also add "No dictionary entry" message to trace
 * 0.8p 20-Jul-89 ALB - Fix bug of trace not showing root category
 *		      - Also change allostring to allo_string and alloprops to
 *			allo_props in struct allomorph for compatibility with
 *                      Andy's work on AMPLE
 * 0.8o 19-Jul-89 hab - strenv_check now considers all members of a string
 *			class, not just the first that matches
 * 0.8n 13-Jul-89 hab - de-"lint" the source
 * 0.8m 30-Jun-89 ALB - Change monitor dots to group by 50's
 * 0.8k 23-Jun-89 ALB - Remove all tabs from stdout output
 *                      Also change report message analyses to syntheses
 * 0.8j 23-Jun-89 ALB - Fix bug of trace having garbage after SYNTHESIS
 * 0.8i 23-Jun-89 ALB - Fix bug of trace having garbage at Input analysis
 * 0.8h 23-Jun-89 ALB - Remove AMPLE tests of 0.8f from .DEC file
 *                      Release to students at UND
 * 0.8g 23-Jun-89 ALB - Fix bug in Input file name shown in log file
 * 0.8f 23-Jun-89 ALB - Add AMPLE tests and \test to .DEC file
 * 0.8e 22-Jun-89 ALB - Fix bugs in command file info shown in log file
 * 0.8d 22-Jun-89 ALB - Change name of out text ctl file to zzOUTTX.CTL
 *                    - Also shorten many trace messages
 *                    - Also change banner messages
 * 0.8c 15-Jun-89 ALB - Change questions and suggested file names
 *                    - Also put answers to questions into log file
 * 0.8b 13-Jun-89 ALB - Fix replacement string error message in lexchg
 * 0.8a 12-Jun-89 ALB - Fix banner help to remove wedge helps
 ******************************************************************************
 * 20-May-89	SRMc - ANNOUNCING STAMP 0.8
 *  8-May-89	Steve McConnel - started writing STAMP with Alan Buseman
 *  3-May-89	ALB - Compile under Microsoft C large model
 *  6-Feb-89	ALB - First version to run AE test successfully
 * 21-Dec-88	ALB - Received from S McConnel somewhat broken
 */
