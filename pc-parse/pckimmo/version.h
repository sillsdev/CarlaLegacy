/* VERSION.H - version number and date information for PC-KIMMO
 ***************************************************************************
 * Copyright 1990, 2002 by SIL International.  All rights reserved.
 */
#define VERSION 2		/* major rewrite or expansion */
#define REVISION 1		/* enhancement requiring adding to book */
#define PATCHLEVEL 12		/* bug fix or other minor change */
#define DATE "October 16, 2002"	/* date of release version */
#define YEAR "2002"		/* used for copyright notice in banner */

/***************************************************************************
 * EDIT HISTORY
 * 16-Oct-2002	SRMc - fix for code generation problem in OPAC library
 * [2.1.12]
 * 15-Oct-2002	SRMc - facilitate checking memory allocations
 * [2.1.11]
 *  3-Oct-2002	SRMc - fix bugs found by Insure++ evaluation.
 * [2.1.10]
 * 20-Jun-2002  hab  - fix to make work with recent Pc-Patr data structure
 * [2.1.9]              changes
 * 11-May-2000	SRMc - fix portability to antique C compilers
 * [2.1.8]
 * 24-Apr-2000	SRMc - more minor edits for more changes to the PC-PATR data
 * [2.1.7]		structures
 * 18-Apr-2000	SRMc - use strncat properly - the third argument is the maximum
 * [2.1.6]		number of non-NUL characters that can be appended, NOT
 *			the total size of the destination buffer
 *		     - minor edits for changes to the PC-PATR data structures
 *  2-Dec-1999	SRMc - get "silent" operation to be more silent
 * [2.1.5]	     - add -q ("work quietly") command line option
 *  2-Sep-1999	SRMc - bumped patch level for new release (revised OPAC
 * [2.1.4]		library functions)
 * 16-Oct-98	SRMc - make header files safe for #including in C++ sources
 * [2.1.3]
 * 31-Jul-98	SRMc - bumped patch level for new release (revised OPAC
 * [2.1.2]		library functions)
 * 23-Dec-97	SRMc - bumped patch level for new release (revised OPAC
 * [2.1.1]		library functions)
 * 21-Oct-97	SRMc - revise the handling of SET FEATURES (due to merging
 * [2.1.0]		eFeatureDisplay, bFlatFeatures, and bTrimFeatures
 *			into iFeatureDisplay bit vector)
 *		     - decide that this is a release, not a beta!
 * 17-Oct-97	SRMc - bring the usage message up to date
 * [2.1b12]	     - fix several help messages to bring them up to date
 *		     - define KimmoPair data structure for holding a feasible
 *			pair
 *		     - remove obsolete "#if <number>" cruft
 *		     - create writeKimmoResults() as a library function
 *		     - add .bAlignment to KimmoData
 *		     - revise writeKimmoResults() to not write English string
 *			"*** NONE ***" for no results case
 *		     - remove obsolete #ifdef's for MPW C and THINK C
 *		     - replace the single reportError() in rules.c with
 *			displayNumberedMessage()
 *		     - fix kimmo.h and patr.h to #include each other
 * 14-Aug-97	SRMc - rename report_progress() to reportProgress() and move
 * [2.1b11]		it to the OPAC library
 *		     - rename strtok8() to tokenizeString() and move it to
 *			the OPAC library
 *		     - rename global functions to include Kimmo in the names
 *		     - rename global variables to include Kimmo in the names
 *		     - rename data structures to include Kimmo in the names
 *		     - rename data structure elements using my modified
 *			Hungarian naming convention
 *		     - merge LANGUAGE and KIMMO_FLAGS to form KimmoData
 *		     - rename cancelOperation to bCancelKimmoOperation_g
 *		     - fix for changes to the PATR library
 *		     - move MAXLINELEN definition from kimmo.h to pckimmo.h
 *			(and generate.c and recogniz.c)
 *		     - add cComment field to the KimmoData structure, and
 *			eliminate the cCommentMarker_g global variable
 *		     - add bTwoLCFile field to the KimmoData structure, and
 *			eliminate the twolc_rules global variable
 * 13-Jun-97	SRMc - fix for changes to the CMD library (mostly renaming of
 * [2.1b10]		of data structures and functions)
 *		     - replace cgetline() with promptUser()
 *  8-May-97	SRMc - fix for changes to the OPAC library
 * [2.1b9]	     - fix portability to the Mac
 * 20-Feb-97	SRMc - fix for STDC_HEADERS
 * [2.1b8]	     - fix for changes to the OPAC library
 *  6-Nov-96	SRMc - rename comment_char to cCommentMarker_g
 * [2.1b7]
 *  1-Nov-96	SRMc - fix for changes to the OPAC library
 * [2.1b6]	     - rename our report_error() to reportFileError()
 *  4-Mar-96	SRMc - fix for DJGPP 2.0 / GNU C 2.7.2
 * [2.1b5]	     - change optimization flag to -O2 in the makefile
 *  2-Nov-95	SRMc - add SYNTHESIZE to commands listed by HELP in do_help()
 * [2.1b4]	     - allow s as an abbreviation for SYNTHESIZE
 *		     - don't require lexicon before loading grammar
 *		     - fix bug in loadLexicons(), to store features for
 *			synthesis lexicon
 *		     - plug a few memory leaks
 * 30-Oct-95	SRMc - fix for config.h (based on GNU Autoconf processing)
 * [2.1b3]	     - get Mac/PowerPC compilation to work
 * 18-Oct-95	SRMc - fix synthesize() to call parse_morphemelist() as a
 * [2.1b2]		verification when a grammar is loaded and parsing is on
 *		     - add forgotten help messages for new synthesize commands
 *		     - add synthesis lexicon to SHOW STATUS output
 * 17-Oct-95	SRMc - change progress reporting for the FILE commands to use
 * [2.1b1]		showAmbiguousProgress()
 *		     - add the LOAD SYNTHESIS-LEXICON command and -s option
 *		     - add the SYNTHESIZE command
 *		     - add the FILE SYNTHESIZE command
 *		     - add the FILE COMPARE SYNTHESIZE command
 *  6-Oct-95	SRMc - fix parse_morphemelist() in RECOGNIZ.C to handle
 * [2.0.-34]		lexical rules, a newly added feature of the PC-PATR
 *			functions
 *  2-Oct-95	SRMc - use build_pathname() to make FILE GENERATE and FILE
 * [2.0.-33]		RECOGNIZE input filenames relative to the location of
 *			the take file
 *  1-Sep-95	SRMc - adjust for changes to the PC-PATR function library
 * [2.0.-32]	     - add version.c to keep compilation date accurate
 *		     - incorporate PC-PATR version information in banner
 *		     - fix portability to Unix and the Macintosh
 * 12-Jul-95	SRMc - change load_rules(), load_lexicons(), generator(), and
 * [2.0.-31]		recognizer() to not reset cancelOperation when
 *			cancelled
 * 15-Jun-95	SRMc - add report_progress() calls and use cancelOperation
 * [2.0.-30]		flag in generator()
 *		     - handle cancelOperation a little better
 *  1-Jun-95	SRMc - revise definition of report_progress()
 * [2.0.-29]	     - add report_progress() calls and use cancelOperation
 *			flag in load_rules(), recognizer()
 * 24-May-95	SRMc - add report_progress() calls to load_lexicon() for the
 * [2.0.-28]		benefit of the MS Windows DDE server
 *		     - also add cancelOperation flag for use of DDE server
 * 10-Mar-95	SRMc - fix LOAD and TAKE commands to use any subdirectory
 * [2.0.-27]		information from the current TAKE file (if any) in a
 *			fashion similar to the lexicon's INCLUDE directive
 *		     - move getline() to the OPAC function library
 *		     - extract get_command() from do_cmd() to put in the CMD
 *			function library
 *  6-Mar-95	SRMc - bring up to date with PC-PATR 0.96a12: changes made to
 * [2.0.-26]		parse tree display output
 * 20-Jan-95	SRMc - code cleanup: replace magic numbers with more meaningful
 * [2.0.-25]		symbols
 * SRMc 30-Nov-94	version 2.0.-24 (beta test)
 *			- bring up to date with PC-PATR 0.96a3
 * SRMc 21-Nov-94	version 2.0.-23 (beta test)
 *			- major shuffling of sources and revision of makefile
 *			  to eliminate duplicate copies of files on the disk
 * SRMc 17-Nov-94	version 2.0.-22 (beta test)
 *			- bring up to date with PC-PATR 0.95a23
 * SRMc 10-Nov-94 	version 2.0.-21 (beta test)
 * 			- fix for changes to the PATR functions
 * SRMc  4-Nov-94	version 2.0.-20 (beta test)
 *			- rename PCKIMMO.H to KIMMO.H and rename PCKUSER.H to
 *			  PCKIMMO.H
 *			- fix for changes to load_grammar() and free_grammar()
 *			  that support loading two independent grammars
 * SRMc	28-Oct-94	version 2.0.-19 (beta test)
 *			- fix memory leak in PATR functions
 *			- show glosses only when wanted for FLAT and INDENTED
 *			  parse tree displays
 *			- remove ULTRIX as a separate #ifdef
 * SRMc	27-Oct-94	version 2.0.-18 (beta test)
 *			- add memory allocation trace/trap options for beta
 *			  test versions
 *			- revise filename storage for rules, lexicon, and
 *			  grammar files to always use the copies stored in the
 *			  LANGUAGE structure
 * SRMc	26-Oct-94	version 2.0.-17 (beta test)
 *			- fix bug in new help display for keytab_lookup()
 *			- rename NEW to CLEAR
 *			- change default SET UNIFICATION to ON
 *			- edit various help messages
 *			- add emergency_memory for handling Out of memory error
 *			  in MPW C without crashing and burning
 *			- fix bug in feasible_pairs() - it was freeing memory
 *			  twice in some cases
 * SRMc	25-Oct-94	version 2.0.-16 (beta test)
 *			- add SET TREE INDENTED command
 *			- change default behavior of Flags.tree when a grammar
 *			  is loaded to not override FLAT or INDENTED
 * SRMc	24-Oct-94	version 2.0.-15 (beta test)
 *			- add SAVE command
 * SRMc	22-Oct-94	version 2.0.-14 (beta test)
 *			- fix spacing for parse output
 *			- hand -g (load grammar) option properly
 * SRMc	20-Oct-94	version 2.0.-13 (beta test)
 *			- incorporate fixes to PATR functions
 *			- move most settings flags into the FLAGS struct
 *			- change EMPTY-FEATURES to TRIM-EMPTY-FEATURES
 *			- add TRIM-EMPTY-FEATURES to the HELP SET command
 *			- minor changes to output formats
 * SRMc	14-Oct-94	version 2.0.-12 (beta test)
 *			- add glosses_exist flag for PC-PATR compatibility
 *			- add #include "pckuser.h" to userpatr.h
 * SRMc	11-Oct-94	version 2.0.-11 (beta test)
 *			- add SET FEATURES {FLAT|FULL}
 *			- allow empty FEATURES field in lexicon file
 *			- revise some help messages
 *			- provide separate tables for SET FEATURES and SET TREE
 * SRMc	30-Sep-94	version 2.0.-10 (beta test)
 *			- extract common stuff into separate files
 *			- rename some files to emphasize uniqueness
 * SRMc	28-Sep-94	version 2.0.-9 (beta test)
 *			- port to MS Visual C/C++ 1.5 QuickWin
 *			- delint on MSDOS with "gcc -Wall -ansi -pedantic",
 *			  "gcc -Wall -traditional", and MSVC /W3
 * SRMc	21-Sep-94	version 2.0.-8 (beta test)
 *			- add placeholders for Macintosh event loop handling
 *			  during compute intensive activity
 *			- split possible OPAC library functions into separate
 *			  files
 * SRMc	19-Sep-94	version 2.0.-7 (beta test)
 *			- faster lexicon loading (many internal changes)
 *			- MW/CW4 support, using the SIOUX library
 *			- garbage collection for PATR keeps freed nodes
 *			  available for future use (except for totally freeing
 *			  everything)
 * SRMc	14-Jul-94	version 2.0.-6 (beta test)
 *			- MPW perf support for performance measurements
 * SRMc	12-Jul-94	version 2.0.-5 (beta test)
 *			- add MPW C support, using the SIOW library
 * SRMc	11-Jul-94	version 2.0.-4 (beta test)
 *			- add VMS support for do_system() and do_cd()
 * SRMc	 8-Jul-94	version 2.0.-3 (beta test)
 *			- make CD a command for all systems
 *			- add DIRECTORY as a command (for all systems?)
 * SRMc	 7-Jul-94	version 2.0.-2 (beta test)
 *			- patr memory allocation fixed
 *			- #include's regularized, isolated in local .h files
 *			- initial ports to VMS and MS WINDOWS
 * SRMc	 3-Jan-94	version 2.0.-1 (beta test)
 *			- relatively stable, crashwise
 *			- patr memory allocation partially replaced
 * SRMc	 2-Dec-93	version 1.6.5
 *			 - removed unwanted calls to exit()
 *			 - changed error handling to use report_error()
 * SRMc	30-Nov-93	version 1.6.4
 *			 - extract struct message and report_error() to
 *			   separate files: ERRORMSG.H and ERRORMSG.C
 * SRMc	29-Nov-93	version 1.6.3
 *			 - grammar files uses same comment character as rules
 *			   and lexicon files
 * SRMc	24-Nov-93	version 1.6.2
 *			 - handle variable width letters better in TRACE()
 * SRMc	23-Nov-93	version 1.6.1
 *			 - fix bug in TRACE(), add some omitted typecasts
 * SRMc	23-Nov-93	version 1.6
 *			 - add multibyte character capability to rules and
 *				lexicon functions
 * SRMc	20-Nov-93	version 1.5.1
 *			 - add free_alignment()
 * BB	13-Nov-93	version 1.5
 *			 - add ability to read twolc rule files
 * FH	23-Jul-93	version 1.4.1
 *			 - edited help messages
 *			 - got rid of some gratuitous blank lines in results
 *				display
 * FH	 9-Jul-93	version 1.4
 *			 - integrate SIL-PATR
 * FH	 3-Jun-93	version 1.3
 *			 - add features field
 * FH	 1-Jun-93	version 1.2
 *			 - implement standard format lexicon file
 * FH 	19-May-93	version 1.1
 *			 - add COMMENT keyword
 * FH	12-May-93	 - change result structures: add separate result
 * 				structure for generation and recognition.
 *			 - preserve the lexical parts in which the lexical form
 *				gets divided by the recognizer
 * SRMc	11-Feb-93	 - call free_lexicons() inside load_lexicons()
 *			 - call free_rules() inside load_rules()
 * SRMc	9-Feb-93	version 1.0.9
 *			 - INCLUDEd lexicon files now use same path as main
 *				lexicon file
 * SRMc	18-Feb-92	 - add 8-bit strchr() for benefit of DJGPP
 *			 - add typecasts to satisfy THINK C in usercmd.c
 * SRMc	30-Jan-92	version 1.0.8
 *			 - fix bugs in 8-bit character handling in 1.0.7
 *			 - put function prototypes in pckimmo.h
 * SRMc	26-Dec-91	version 1.0.7
 *			 - fix for Think C 5.0 and DJ GPP 1.05
 * SRMc	19-Nov-91	version 1.0.6
 *			 - fix memory leak in erase_lex_item() [lexicon.c]
 *			 - add fflush(stderr) for THINK C progress dots
 * SRMc	26-Feb-91	version 1.0.5 (yesterday's fix wasn't good enough)
 *			 - change definitions of ALTERNATION and struct
 *			   lex_item to store array indices rather than
 *			   pointers into arrays (that may be shifted
 *			   around in memory during loading)
 * SRMc	25-Feb-91	version 1.0.4
 *			 - fix bug in loading a lexicon with a large number
 *			   of sections
 * SRMc	17-Sep-90	version 1.0.3
 *			 - fix botch in recognition introduced by 1.0B
 *			   (pruning was inappropriate for the general case)
 *			 - fixing bug remaining in generation involving
 *			   multiple insertions at the end of a word
 *			 - introduce version.h to log version information
 *			   and to define version number and data constants
 * SRMc	 6-Sep-90	version 1.0B
 *			 - fix bug in generation involving insertions at the
 *			   end of a word (bug reported by Greg Lee)
 *			 - fix bug in recognition involving insertions at the
 *			   the end of a morpheme/middle of another
 *			   (bug reported by Richard Sproat)
 *			 - prune recognition search to eliminate duplication
 * SRMc	14-Jul-90	version 1.0A
 *			 - fix portability problems for ULTRIX and UNIX PC
 * SRMc	 8-May-90	version 1.0 (Macintosh)
 *			 - ready for release to the world
 * SRMc	 6-Feb-90	version 1.0 (UNIX and MSDOS)
 *			 - ready for release to the world
 */
/***************************************************************************
 *	EDIT HISTORY
 *	 4-Mar-89	written by Dave Smith
 *	19-May-89	TRIE.H written by Steve McConnel
 *	19-Sep-89	SRMc - reorganize and reformat the file
 *			     - redefine subsets field of Language, add
 *				numsubsets field
 *			     - redefine name field of Rule
 *	21-Sep-89	SRMc - removed MAXLEV, MAXALPH, MAXFP, TRACE[0-3],
 *				LTRACE
 *			     - removed extern declarations
 *			     - convert char to unsigned char for 8-bit safety
 *	23-Sep-89	SRMc - add okay field to ResNode
 *			     - rename file from MORPH.H to KIMMO.H
 *	25-Sep-89	SRMc - move MAXLINELEN definition from getrules.c
 *	26-Sep-89	SRMc - include TRIE.H, remove TRIE definition
 *			     - replace struct endlst with struct lex_item
 *			     - add rule_active field to Rule struct
 *			     - remove rulState field from Language struct
 *			     - make letters field of TRIE unsigned
 *	27-Sep-89	SRMc - define typedef RULE to replace typedef Rule
 *	29-Sep-89	SRMc - define ALTERNATION, revise struct lex_item,
 *				and revise Language
 *	30-Sep-89	SRMc - finish changing lexicon storage
 *	 2-Oct-89	SRMc - consolidated lexicon storage was a mistake --
 *				back up to previous scheme
 *			     - rename Language to LANGUAGE
 *			     - rename ResNode to RESULT
 *			     - replace typedefs ContClass and Alt with
 *				typedef ALTERNATION
 *			     - replace typedef Lexicon with typedef LEXICON
 *	 6-Oct-89	SRMc - define USE_SIGNAL if we can signal(SIGINT,f)
 *	 9-Oct-89	SRMc - define NUL, FATAL, NONFATAL, and struct message
 *	11-Oct-89	SRMc - define typedef SUBSET, revise LANGUAGE
 *			     - add initial_lex field to LANGUAGE
 *	13-Oct-89	SRMc - renamed file from KIMMO.H to PCKIMMO.H
 *			     - added boundary field to LANGUAGE
 *	21-Oct-89	SRMc - imported TRIE.H
 *	24-Oct-89	SRMc - rename numRows to num_rows
 *			     - rename numCols to num_cols
 *			     - rename numRules to num_rules
 *			     - rename lexPair to lex_pair
 *			     - rename surfPair to surf_pair
 *			     - rename numPairs to num_pairs
 *			     - rename lexchars to lex_chars
 *			     - rename surfchars to surf_chars
 *	 2-Jan-90	SRMc - more delinting
 *	26-Jan-90	SRMc - port to 4.2BSD (SunOS)
 *	19-Apr-90	EA   - #ifdef for THINK_C
 *	12-Jul-90	SRMc - replace "void *" with "VOIDP", as suggested
 *				by Greg Lee (lee@uhccux.uhcc.hawaii.edu) for
 *				port to ULTRIX
 *	26-Feb-91	SRMc - change definitions of ALTERNATION and struct
 *				lex_item to store array indices rather than
 *				pointers into arrays (that may be shifted
 *				around in memory during loading)
 *	30-Jan-92	SRMc - add function prototypes
 *			     - add USE_STDARG definition from pckfuncs.c
 *	18-Feb-92	SRMc - add conditional definition of NEED_8BIT_STRCHR
 *	12-May-93	FH - replace RESULT with GEN_RESULT and REC_RESULT
 *				and add MORPHEME
 *	 2-Jun-93	FH - add field features to LANGUAGE
 *			   - add field feat_index to lex_item
 *	25-Apr-94	SRMc - add getline_buffer[] as global array
 */
