/* VERSION.H - version number and date information for AMPLE
 ***************************************************************************
 * Copyright 1996 - 2003 by SIL International.  All rights reserved.
 */
#define VERSION 3		/* major rewrite or expansion */
#define REVISION 8		/* enhancement requiring adding to book */
#define PATCHLEVEL 0		/* bug fix or other minor change */
#define DATE "January 7, 2004"	/* date of release version */
#define YEAR "2004"		/* used for copyright notice in banner */

/*****************************************************************************
 * EDIT HISTORY
 * 07-Jan-2004  hab  - Enhancement: add negative SECs (~/)
 * [3.8.0]
 * 17-Nov-2003  hab  - Fix bug: empty morpheme co-occurrence constraint message
 * [3.7.5]               did not include any information about which entry it
 *                       was for.  (fixed in mccpar.c)
 * 02-Oct-2003  hab  - p_trace() in anal.c needs to skip Allomorphs Never
 * [3.7.4]               Co-occurence Constraints
 * 24-Jul-2003  hab  - Xml form of trace used wrong dtd file name
 * [3.7.3]
 * 23-Jul-2003  hab  - Fixed bug which could cause SGML/XML trace output to
 * [3.7.2]              be lost
 * 17-Jun-2003  hab  - add SGML/XML trace output for PC-PATR grammar call
 * [3.7.1]
 * 12-Jun-2003  hab  - added XML trace mode
 * [3.7.0]
 * 17-Oct-2002  hab  - added MaxAnalysesToReturn parameter to xample.dll
 * [3.6.5]
 * 16-Oct-2002	SRMc - fix for code generation problem in OPAC library
 * [3.6.4]
 * 15-Oct-2002	SRMc - facilitate checking memory leaks
 * [3.6.3]           - fix more memory allocation problems
 *  4-Oct-2002	SRMc - fix bugs found by evaluating Insure++
 * [3.6.2]
 *  2-Oct-2002	SRMc - fix a memory allocation bug in decapitalizeWord().
 * [3.6.1]
 * 13-Jun-2002  hab  - Allow both min and max orderclass numbers (i.e. allow
 * [3.6.0]               orderclasses to span a range)
 * 06-Mar-2002  hab  - Add Allomorphs Never Co-occur Constraints
 * [3.5.0]               (for XAmple only)
 * 24-Jul-2001  hab  - Fix bug: empty environment constraint messages did not
 * [3.4.1]               include any information about which entry they were
 *                       for.  (fixed in envpar.c)
 * 20-Jul-2001  hab  - Add \catcr field to xxAD.CTL file: for words which
 * [3.4.0]               consist solely of compound roots (i.e. no affixes),
 *                       it indicates whether the category of the word (i.e.
 *                       the content of the \cat field in the ANA file) should
 *                       come from the leftmost or the rightmost root in the
 *                       compound.  The field content should be either "left"
 *                       or "right".
 * 11-Jun-2001  rbr  - Fix bug in setting property type
 * [3.3.21]              (addAmpleProperty() in proper.c)
 * 31-May-2001  hab  - Fix bug which ignored RSC in processing selective
 * [3.3.20]              tracing (setAmpleSelectiveAnal() in select.c and
 *                       root_create() in setsd.c)
 * 21-May-2001  hab  - Fix bug in outputting final category whereby if using
 * [3.3.19]              suffix final and there is no suffix, an initial infix
 *                       was ignored (instead of being used).
 * 23-Apr-2001  hab  - Fix bug in parseAmpleMorphConstraint() in mccpar.c
 * [3.3.18]              which failed to free memory used by properties,
 *                       categories, category class and affix types in MCCs.
 *                     Fix bug in freeAmpleAlloEnvConstraint() in envpar.c
 *                       which failed to free memory used by punctuation
 *                       environment constraints.
 *                     Fix bug in free_entry() in setsd.c which failed to
 *                       free environment memory for root entries.
 * 17-Apr-2001  rbr  - Fix bug in resetAmpleData() in analda.c which failed
 * [3.3.17]             to free memory for any unified dictionary code table
 * 12-Dec-2000  hab  - Fix bug in mergeAmpleAmlists() in anal.c which would
 * [3.3.16]             incorrectly merge the two lists (used only by infix
 *                      processing).
 * 30-Oct-2000  hab  - Fix bug in categ.c which would crash if the Log file
 * [3.3.15]             pointer was null.
 * 24-Aug-2000  hab  - Fix bug in matchAlphaChar() which checked for
 * [3.3.14]             caseless characters after lower and upper characters;
 *                      if an a-z or A-Z character was in the list of multibyte
 *                      caseless characters, it was always treated as either
 *                      lower or upper so the special combination in the
 *                      caseless multibyte was not found.
 * 24-Jul-2000  hab  - Fix bug in XAmple which failed to copy word category
 * [3.3.13]             from dictionary when an allomorph was found
 * 26-May-2000  hab  - add concatAmpleAmlists(), mergeAmpleAmlists(),
 * [3.3.12]             getInfixEntries(), and getAllAllomorphs() in anal.c
 *                      (only used by AmpleDLL).
 * 11-May-2000	SRMc - fix portability to antique C compilers
 * [3.3.11]	     - fix in patrlib that permits XAMPLE to output all
 *			features, not just top feature or leaf node features
 * 24-Apr-2000	SRMc - more minor edits adjusting to more changes in patr.h /
 * [3.3.10]		xample
 * 19-Apr-2000	SRMc - minor adjustments to Andy's recent fixes (hardly worth
 * [3.3.9]		mentioning, but the code changed a few places)
 *		     - remove some leftover cruft from earlier versions that
 *			had been effectively commented out
 *		     - minor edits adjusting to changes in patr.h / xample
 * 10-Apr-2000  hab  - fixed bug which reported a caseless character defined
 * [3.3.8]               as a lowercase character when case was not set
 *                     fixed a minor display bug: the message of an empty
 *                      morpheme co-occurence constraint did not end in a
 *                      newline, so the following message would display at
 *                      the end of it.
 * 23-Mar-2000  hab  - fixed bug which dereferenced a null pointer when
 * [3.3.7]               protoforms are used in a root record and there are
 *                       no allomorphs
 * 14-Jan-2000  hab  - fixed bug which incorrectly calculated
 * [3.3.6]               the length of a morphname.  AMPLE would abort for
 *                       morphnames longer than 64 characters.
 * 07-Dec-1999  hab  - fixed bug which caused the check for valid MCC to not
 * [3.3.5]               take protoforms into account.
 * 03-Nov-1999  hab  - multiple root gloss error message had extra backslash.
 * [3.3.4]              Removed so message would display properly.
 * 01-Jul-1999  hab  - changed checkAmpleMorphs to have a flag to free space
 * [3.3.3]              used in morph checking or not.  The exe needs to free
 *                      the space.  The dll does not.
 * 25-May-1999  hab  - increased MAX_NUM_MORPHS and MAX_NUM_ALLOS for Ample32
 * [3.3.2]              version - were set with 512K limit in mind.
 * 18-May-1999	SRMc - fixed bug in refineAmpleAnalysis(): set pAmpleLeftHead_m
 * [3.3.1]		and pAmpleRightHead_m before calling form_anal()
 *		     - simplify the checking for null pAmpleRightHead_m and
 *			pAmpleLeftHead_m in form_anal() (probably not needed
 *			at all after the previous change)
 * 13-May-1999  hab  - add punctuation environment constraint capability
 * [3.3.0]
 * 06-May-1999  hab  - fix reference to no-longer-used bRootGlosses_g in
 * [3.2.8]              disp_allo in setsd.c (which is conditionally not
 *                      compiled usually).
 * 30-Apr-1999  hab  - changed upper range to go from codes 127 to 255
 * [3.2.7]              instead of from code 128 to 254 in spreds.l
 * 20-Apr-1999	SRMc - removed "typedef struct ample_allomorph AmpleAllomorph;"
 * [3.2.6]		from ampledef.h
 *		     - revised the replication allomorph loading to increase
 *			its speed (by about 90% or so)
 * 11-Mar-1999  hab  - remove resetLocalGlobals() and put all such globals
 * [3.2.5]              in AmpleData
 *                     fix bug which entered null root glosses when there
 *                      was no gloss in the root dictionary entry
 * 25-Feb-1999  hab  - fix another NULL pointer dereference in
 * [3.2.4]              isAmpleCategClassMember() (in categ.c)
 *                     fix bDidCatPair being set true even when field was
 *                      empty in afx_create() and ifx_create() (in setsd.c)
 *                     fix  bDidCategories being set true even when field was
 *                      empty in root_create() (in setsd.c)
 *                     fix fallacious error report of missing dictionary type
 *                      when field was final field in record; in
 *                      addAmpleDictEntry() (in setsd.c)
 *                     added initialization of infix test counters to anproc()
 *                      (in ample.c) and to AmpleParseFile() (in ampledll.c)
 *                     added final nl output to showAmpleAlloEnvConstraint()
 *                      (in setsd.c)
 *                     fix AmpleParseText() and AmpleParseFile()
 *                      (in ampledll.c) to use new surrounding words method
 *                     Added ample.rc and ampledll.rc (Win32 only) to include
 *                      version information in the exe and dll files
 * 23-Feb-1999	SRMc - fix some NULL pointer dereferences that had crept into
 * [3.2.3]		form_anal() (in anal.c)
 * 18-Nov-1998	SRMc - make the AMPLE functions fully reentrant
 * [3.2.2]	     - complain vociferously about questionable text input
 *			control file contents
 *		     - split AMPLE processing into two phases: the first looks
 *			at the word in isolation, and the second (if needed)
 *			looks as the surrounding two words
 * 24-Oct-1998	SRMc - remove direct uses of stdout
 * [3.2.1]	     - allow for '[' or ']' to be alphabetic characters
 *			(either essentially disables the reduplication code)
 *		     - add \maxprops to analysis data (control) file, and
 *			make use of >255 properties a run-time decision instead
 *			of a compile time decision
 *		     - make header files safe for #including in C++ sources
 *		     - make sure pointers are reset to NULL after AMPLE data
 *			is freed
 *		     - add capability to write tracing information to a string
 *			instead of a file
 *  1-Oct-1998	SRMc - add reduplication notation handling to allomorph fields
 * [3.2.0]		in dictionary entries
 * 24-Sep-1998	SRMc - enhance error reports in parseAmpleMorphConstraint()
 * [3.1.2]		(mccpar.c) to include szRecordKey_g if it is not empty
 * 18-Sep-1998  hab  - add conditional compile to allow up to 4000 properties
 * [3.1.1]              (this could go up to 65535, but is it really needed?)
 *			(changes modified by Steve McConnel)
 * 31-Jul-98	SRMc - fix for multibyte character handling by the TextControl
 * [3.1.0]		data structure and related functions
 *		     - fix bug in freeAmpleDictionary()
 * 18-Mar-98	SRMc - merge experimental version (XAMPLE) back into the
 * [3.0.7]		primary sources, using #ifdef EXPERIMENTAL
 *		     - make copyright years up to date in source files
 * 11-Mar-98	SRMc - fix check for valid MCCs in loading dictionary entries
 * [3.0.6]		to allow morpheme anywhere in morpheme list
 * 20-Feb-98	SRMc - split off experimental version (XAMPLE) with separate
 * [3.0.5]		sources
 * 17-Feb-98	SRMc - revise functions dealing with environments to share
 * [3.0.4]		with STAMP
 *		     - revise loading of dictionary code tables to not hang
 *			when encountering problems
 *		     - revise loading of dictionary code tables to detect
 *			unified dictionaries automatically
 *		     - restore the -v command line option to functioning
 *		     - split out a few new separate source files: validch.c,
 *			mccpar.c, cmdutil.c
 *		     - #include "stample.h" from ample.h, add to installation
 *			so that STAMP sources can find it
 *		     - give up on errors loading control files rather than
 *			trying to get another filename
 * 11-Feb-98	SRMc - fix bug in SGML tracing of final test failures
 * [3.0.3]	     - try to fix bug (?) in Windows DLL interface
 *		     - add stample.h header file for functions and structures
 *			shared with stamp
 *		     - revise functions dealing with categories, morpheme
 *			classes, and properties to share with STAMP
 *		     - change parsing to look for infixes only in the first
 *			root of compound roots
 * 23-Dec-97	SRMc - move function prototypes for files in mktest.c from
 * [3.0.2]		atest.y to ampledef.h
 * 22-Dec-97	SRMc - fix bug in setting WordAnalysis pszSurfaceForm field
 * [3.0.1]		(bug was exposed by changes to OPAC library functions)
 *		     - adjust functions for sharing with STAMP
 *		     - fix long-standing bug in test evaluation reported by
 *			Andy Black: adjacent word references not always
 *			checking for existence of adjacent word (NULL pointer
 *			dereferencing could occur)
 * 21-Oct-97	SRMc - decide that this is a release, not a beta!
 * [3.0.0]
 * 15-Oct-97	SRMc - fix bug in updateAmpleDictEntry() reported by Randy
 * [3.0b13]		Regnier: any whitespace following the morphname
 *			prevented the old morpheme from being removed
 *		     - fix bug in SGML style tracing
 *		     - add {ID} labels to MCC syntax
 *		     - fix bug in loading dictionary root glosses
 *		     - remove obsolete "#if <number>" cruft
 *		     - add -q (work quietly) command line option
 *		     - fix usage message to reflect revised progress reporting
 *		     - fix for revised reportError() and reportMessage()
 *		     - defined AMPLE_NO_CATEGORY, AMPLE_SUFFIX_CATEGORY, and
 *			AMPLE_PREFIX_CATEGORY
 *		     - rename AmpleMorphRule to AmpleMorphConstraint, and
 *			rename functions, variables, and struct members
 *			accordingly
 *		     - change loadAmpleDictionary() to return the number of
 *			entries loaded
 *		     - move a pair of CodeTable functions to the OPAC library
 * 14-Aug-97	SRMc - revise progress reporting to use '*' for analysis
 * [3.0b12]		failures and '>' for 10 or more ambiguous results
 *		     - modify tracing to allow SGML style output using the
 *			AmpleTrace.DTD specification developed by Andy Black
 * 13-Jun-97	SRMc - handle "noload" ('!') record fields properly in
 * [3.0b11]		updateAmpleDictEntry()
 *		     - write the allomorph ID to the parse trace output if it
 *			exists
 *		     - change hasAmpleProperty() to use unsigned argument
 *		     - change global property functions to use AmpleData
 *			argument rather than AmpleProperty argument
 *		     - changed showStringClasses() to writeStringClasses(),
 *			   showAmpleCategClasses() to writeAmpleCategClasses(),
 *			   showAmpleMorphClasses() to writeAmpleMorphClasses(),
 *			and  showAmpleMorphRules() to writeAmpleMorphRules()
 *		     - renamed ufopen() to fopenAlways()
 *		     - renamed safe_exit() to exitSafely()
 *		     - fix convertRecord() to ensure double NUL at the end of
 *			the converted dictionary record
 *		     - rename pSelectiveTraceMorphs to pSelectiveAnalMorphs
 *		     - revise the handling of selective analysis to support
 *			interactive applications better
 *  8-May-97	SRMc - revise writeAmpleDictionary() to use "AmpleLinks
 * [3.0b10]		Canonical Format" markers
 *		     - change updateAmpleDictEntry() to use "AmpleLinks
 *			Canonical Format" markers by default
 *		     - store morpheme co-occurrence constraints loaded from
 *			the dictionary with each morpheme rather than in a
 *			global list
 *		     - fix portability to the Mac
 * 30-Apr-97	SRMc - fixes for the Microsoft Windows (LinguaLinks) DLL
 * [3.0b9]	     - add pszAllomorphID field to AmpleAllomorph, and ID
 *			marker to allomorph fields in the dictionaries
 *		     - add the -b option to enable allomorph IDs
 *		     - add the writeAmpleDictionary() function
 *		     - make category and category class storage part of the
 *			AmpleData data structure
 *		     - make morpheme class storage part of the AmpleData
 *			data structure
 *		     - make "string check" characters part of the AmpleData
 *			data structure
 *  4-Apr-97	SRMc - minor bug fixes and memory leak plugs
 * [3.0b8]	     - detect invalid use of {group} construct in string
 *			environment constraints
 *		     - add the -x and -w command line options
 *		     - make output of original word (\w) properly optional
 *  4-Mar-97	SRMc - add pStringClasses field to AmpleData
 * [3.0b7]	     - add pProperties and pPropertySets fields to AmpleData
 *		     - replace multiple integer boolean fields in AmpleData
 *			with single iOutputFlags field
 * 20-Feb-97	SRMc - fix return value for performAmpleAnalysis(), and remove
 * [3.0b6]		some unnecessary (and confusing) cruft
 *		     - change analysis output for failures so that intergen
 *			and ambex will work without modification
 * 14-Feb-97	SRMc - fix memory bug in freeing dictionaries
 * [3.0b5]	     - fix for changes to the OPAC function library
 *		     - tighter checks for valid dictionary entries
 *		     - allow multiple category fields in affix dictionary
 *			records since root dictionaries allow this
 *		     - fix memory leaks in utest() (get_allo() and get_surf()
 *			to be specific)
 *		     - fix memory leak in loadAmpleDictCodeTables()
 *		     - fix memory leak in parseAmpleMorphRule()
 * 31-Jan-97	SRMc - fix for STDC_HEADERS
 * [3.0b4]
 *  9-Dec-96	SRMc - fix decapitaliztion to handle ambiguous situations
 * [3.0b3]	     - add removeFromAmpleDictionary()
 * 25-Nov-96	SRMc - rename some members of AmpleWord data structure
 * [3.0b2]	     - fix OPAC library function readTemplateFromText() to
 *			handle capitalization more correctly for short words
 *			with a single upper/lowercase letter
 *  7-Nov-96	SRMc - convert AMPLE sources to use the OPAC library
 * [3.0b1]	     - create version.h and version.c
 *		     - rename global variables to make them evident
 *		     - reorganize sources to minimize external labels
 *		     - add -u (unified dictionaries) option
 * 2.0c 31-Oct-95 KB Increase MAX_NUM_MORPHS when 386 compile (ifdef DJGPP)
 * 2.0b 4-Oct-95 ALB Fix GPF bug in property output code
 * 2.0a 12-Sep-95 ALB Change 1.9y fix to require nl only after \id
 * 2.0  12-Sep-95 ALB Debug property output
 * 1.9zc 7-Aug-95 ALB Output properties with \p like features
 * 1.9zb 9-Jun-95 BJY Added ability to recognize lexically capitalized
 *			dictionary entries and added user test syntax for
 *			testing for capitalization
 * 1.9za 6-Jun-95 BJY Put in HAB fixes for better yacc/bison error reporting
 * 1.9z 02-May-95 BJY Added \strcheck field to control file and code to do
 *			validation checks on allomorphs, SEC's and string
 *			classes
 * 1.9y 10-May-95 BJY Change ignore field handling so ignore fields are
 *			terminated only by a nl backslash rather than by any
 *			embedded backslash
 * 1.9x  8-May-95 BJY Give error message for an MCC without an environment
 * 1.9w 27-Apr-95 BJY Modified behaviour of curly braces and square brackets in
 *			all morpheme environments to the following:
 *			Curly braces: Look first for category or property but
 *					accept morpheme class.
 *			Brackets: Look first for morpheme class but also accept
 *					a category or property.
 * 1.9v 25-Apr-95 BJY Fix bug (introduced with 1.9m) that kept an MEC from
 *			looking at a neighboring word if an ellipses is
 *			encountered before the word break
 * 1.9u 24-Apr-95 BJY Add -p option for reporting ambiguous words percentages
 * 1.9t 24-Apr-95 BJY Output record number in error messages if record key is
 *			empty
 * 1.9s  7-Mar-95 BJY Resync STAMP and AMPLE and share some files in SourceSafe
 *			Incorporate some bug fixes from STAMP code as well.
 * 1.9r 10-Feb-95 BJY Port to Windows EXE and DLL. Use WINAMPLE.MAK to generate
 *			Windows version.
 * 1.9q 28-Jan-95 MRP Move P to defs.h; remove undef P from all .c files
 * 1.9n 28-Oct-94 ALB Fix a bit more for DJGPP compiler
 * 1.9p 1 Nov 94 ALB Fix bug of selective trace failing on morphemes with
 *			leading space on line
 * 1.9m 19-May-94 CLR Let AMPLE look at neighboring words in MECs
 * 1.9k 22-Mar-94 hab make DJGPP compiler happy: remove its warning msgs
 *                    Add underlying form in output
 * 1.9j 17-Feb-94 CLR In APREDS, utest(), cases ALL_RIGHT: and SOME_RIGHT:,
 *          change 'left.l_son' to 'right.r_son'
 * 1.9h 15-Feb-94 HAB Eliminate extra white space in the feature definition
 * 1.9i This is a release version containing bug fixes to 1.9a
 * 1.9g  9-Dec-93 CLR Collapse identical allomorph environments for roots
 * 1.9f  9-Dec-93 CLR Make a version which incorporates the above changes
 *   9-Dec-93 CLR Make AMPLE recognize SFMs which are not line-initial
 *   9-Dec-93 CLR Tweek pre-allocated buffer sizes to work with Codeview
 *   3-Dec-93 CLR Incorporate WM's code for wfc check on env strings
 *   3-Dec-93 CLR Collapse prop_list and cat_list types into strlist
 *   3-Dec-93 CLR Save dictionary space by consolidating category strings
 *   3-Dec-93 CLR Put double quotes in messages where appropriate
 *   3-Dec-93 CLR Move morph check and record size #defines from DEFS.H
 *          to MYALLO.H
 *       1-Dec-93 CLR #ifdef permanent heap code
 *      18-Oct-93 CLR Preserve last_word->word from demolition by senv_left
 *                    - (bug discovered by Ruedi Giezendanner) - ENVCHK.C
 *      22-Sep-93 CLR Add 'void' to prototypes where appropriate
 *  18-Aug-93 SRMc - Port to the DJGPP 32-bit compiler for MS-DOS
 *             - allow for virtual memory
 * 1.9  12-May-93 ALB Port to Mac, ifdef a couple of places
 * 1.8z 11-May-93 CLR Warn if crossing # in morph env in AMPLE
 * 1.8y  7-May-93 CLR Ignore {, } in SEC; warn if matching pair; make SEC
 *          check work in surrounding words
 * 1.8w 14-Apr-93 CLR Restore "No more prefixes/roots/suffixes found."
 *          messages to the trace; leave out message for infixes
 * 1.8v  8-Apr-93 CLR Redo permanent heap scheme to remove unnecessary
 *          boundaries
 * 1.8u  2-Apr-93 CLR Incorporate WM's code to make {prefix},{suffix},{infix}
 *          like {root} in MEC
 * 1.8t  1-Apr-93 CLR Incorporate WM's code to adjust the computation of
 *          version 1.7r to not reward failing words
 * 1.8s 31-Mar-93 CLR Fix bug so that ellipses work with string classes
 * 1.8r 25-Mar-93 CLR Clean up "out of memory" messages; default maxnull to 10
 * 1.8q 25-Mar-93 CLR Change MAX_NUM_MORPHS and MAX_NUM_ALLOS
 * 1.8p 24-Mar-93 CLR Abort morphcheck if it causes overflow of temporary heap
 * 1.8n 24-Mar-93 CLR Send permanent heap overflow message to console
 * 1.8m 24-Mar-93 CLR Make sure everything is released at morphcheck shutoff
 * 1.8k 23-Mar-93 CLR Eliminate reallocation of allomorph pointer array
 * 1.8j 23-Mar-93 CLR Remove current implementation of SEC error check
 * 1.8h 23-Mar-93 CLR Make enough memory available for loading control files
 * 1.8g 16-Mar-93 CLR Eliminate negative values from analysis statistics
 * 1.8f 15-Mar-93 CLR Remove "No more infixes/prefixes/roots/suffixes found."
 *          messages from trace of version 1.8e
 * 1.8e 12-Mar-93 CLR Remove hang bugs traced by the bounds checker
 * 1.8d 11-Feb-93 CLR Remove "No more infixes/prefixes/roots/suffixes found."
 *          messages from trace
 *           - This version is between 1.8 and 1.8a
 * 1.8c 11-Feb-93 CLR Create and use permanent heap
 * 1.8b 26-Jan-93 CLR Allow user to specify max number of nulls per word
 * 1.8a 25-Jan-93 CLR Improve dictionary storage efficiency
 *          - consolidate environments and strings
 * 1.8  19-Jan-93 CLR Include isascii in SEC error check; 1.8 is last version
 *          before improving dictionary storage efficiency
 * 1.7z 18-Jan-93 CLR Disallow multiple null morphemes per word
 * 1.7y 13-Jan-93 CLR Check for SEC errors during dictionary load
 * 1.7x  8-Jan-93 CLR Expand string environment to include surrounding words
 * 1.7w 12-Oct-92 ALB Reconcile Mac version back into master source
 * 1.7v 18-Jun-92 BK  Port 1.7t to Mac THINK_C
 * 1.7u  8-Jun-92 ALB Make monitor output number after every 100 words
 *                      Change num_words to long everywhere
 * 1.7t 20-May-92 ALB Check curly brace contents during dictionary load
 * 1.7s 20-May-92 ALB Show selective trace file in log
 * 1.7r 19-May-92 ALB Report percent ambiguous words and excess ambigs
 * 1.7p 13-May-92 ALB Make dictionary environment errors show record key
 * 1.7n 12-May-92 ALB Make dic load errors show record key for Shoebox
 * 1.7m  7-May-92 ALB Change "failed" to "rejected" in statistics in log
 * 1.7k 30-Mar-92 ALB Fix bug of comment bar ignored in selective trace file
 *                      Fix bug of rejecting optional ({V}) in envir
 * 1.7j 26-Mar-92 ALB Fix bug of trace not showing curly braces on envir
 * 1.7h  6-Mar-92 ALB Undo 1.7f, needs a different approach
 * 1.7g 19-Feb-92 ALB Fix up some little things for Cterp
 * 1.7f  6-Feb-92 ALB Check for FINAL, etc. in successor tests (AMPLE p167)
 *                      This fixes the Crickmore hang bug, but hangs, buggy yet
 * 1.7e  4-Feb-92 ALB Undo 1.7c, remove pad byte from old alloc system
 * 1.7d 31-Jan-92 ALB Fix optional envir bug as per Steve M suggestion
 * 1.7c 24-Jan-92 ALB Undo 1.7b, add pad byte to old alloc system
 * 1.7b 24-Jan-92 ALB Adjust for new storage allocation system
 * 1.7a 18-Dec-91 ALB Allow 255 properties max, up from 32 previously
 * 1.7  10-Dec-91 ALB Version change for release
 * 1.6y 21-Nov-91 ALB Add {root} in morpheme environment constraint
 *                      Add {prop} for property in MEC
 *                      Add {cat} category in MEC
 * 1.6w 14-Nov-91 ALB Fix for new FLEX and use it to allow 8 bit in tests
 * 1.6v 13-Nov-91 ALB Allow space between tilde and underline
 * 1.6u  6-Nov-91 ALB Allow \luwfc mult chars to map to one, req by Bill
 * 1.6t 23-Jul-91 ALB Change single char word to INITCAP instead of ALLCAP
 * 1.6s 23-Jul-91 ALB Fix bug of 'E' gate not working on roots or infixes
 * 1.6r  8-Jul-91 ALB Exit with errorlevel of 2 if any failures
 * 1.6p  4-Jul-91 ALB Remove overwrite message for output file
 * 1.6n  8-Jun-91 ALB Remove requirement of \begin in AD01.CTL, read all
 * 1.6m  7-Jun-91 ALB Add report of memory used if verifying
 * 1.6k  6-Jun-91 ALB Prevent logging of file names if verifying
 * 1.6j  5-Jun-91 ALB Fix bug of no CR between message and next file name
 * 1.6h  6-Feb-91 ALB Add morphs option to \cat suffix in AD01.CTL
 * 1.6g  2-Feb-91 ALB Fix bug of morph_check not recognizing # in MEC
 *                    Compile under Microsoft C 6.00A
 * 1.6f 13-Sep-90 ALB Compile under Microsoft C 6.00
 *                    Crickmore hang bug went away with compiler change
 *                    Test with default optimizations instead of /Zi
 *                      (Benchmark showed < 1% speed-up on Crickmore)
 *                    Define as void all funcs returning no value
 * 1.6e 02-Aug-90 hab Add lower-upper word formation character handling
 *                    Change index to strchr and rindex to strrchr
 *                    De-lint the source
 *                    Add 'E' code to setsd.c for compatibility with STAMP
 * 1.6d 27-Jul-90 hab Allow for infixes in compound roots.
 *                    Also add category mappings to \cat output
 * 1.6c 20-Jul-90 ALB Fixes to andata.h and record.c from Steve McC
 * 1.6b 22-Jun-90 ALB Fix bug of not accepting 8-bit chars in env (isspace)
 * 1.6a 21-Jun-90 BK  Fix up for THINKC on MAC
 * 1.6  13-Jun-90 ALB Change feature separator from hyphen to equal sign
 * 1.6  12-Jun-90 ALB Version change for summer release
 * 1.5y 12-Jun-90 ALB Fix bug of \dsc and \format not working
 * 1.5w  9-Apr-90 ALB Allow analysis with null root and no suffix
 * 1.5v  6-Apr-90 ALB Fix bug of all 8-bit looking like wfc chars
 *                      Remove nonalpha, use alpha for everything
 * 1.5u 27-Mar-90 ALB Add -s file selective trace option
 * 1.5t 24-Mar-90 ALB Add memory usage display on -z debug
 * 1.5s 16-Mar-90 ALB Add \noincap to prevent internal recapitalization
 * 1.5r 15-Mar-90 ALB Raise BUFSIZ fromm 100 to 300 to fix hang on Bru
 * 1.5q 14-Mar-90 ALB Add \rd root delimiter field to AD01.CTL file
 * 1.5p 28-Feb-90 ALB Fix bug of not accepting 8-bit char at front of wrd
 * 1.5n 14-Feb-90 ALB Allow infixes to be before next morpheme
 * 1.5m 10-Jan-90 ALB Add code to output bitmap for upper case letters
 * 1.5k 10-Jan-90 ALB Fix bugs in handling bar codes at ends of words
 * 1.5j 10-Jan-90 ALB Debug trimming spaces off end of \fd output
 * 1.5h  9-Jan-90 ALB Trim spaces off end of \fd output
 * 1.5g  9-Jan-90 ALB Make \fd output right for roots
 * 1.5f  8-Jan-90 ALB Finish \fd output initial code
 * 1.5e  8-Jan-90 ALB Fix add_fd routine to change nl's to spaces and
 *			delete trailing spaces and nl's
 * 1.5d  4-Jan-90 ALB Add F gate for \fd output to ana file
 * 1.5c  3-Jan-90 ALB Make \cat suffix pick prefix if no suffix
 * 1.5b  2-Jan-90 ALB Add \cat suffix or prefix option to ad01.ctl file
 *			Add -z command line option for do_debug
 * 1.5a  2-Jan-90 ALB Add code to output final category of word
 * 1.5  15-Dec-89 ALB Version change for release
 * 1.4x 13-Nov-89 ALB Fix morpheme env const message as Andy asked
 * 1.4w  9-Nov-89 ALB Change -f usage to data files as Dave asked
 * 1.4v  8-Nov-89 ALB Prevent INPUT: xx words message if log to screen
 *			Align statistics better
 * 1.4u  8-Nov-89 ALB Output test statistics to log, not to screen
 *                      (Needs verify with Dave)
 * 1.4t  8-Nov-89 ALB Prevent i/o file names from listing twice in log
 *                      Remove some blank lines from log
 *                      Push ambiguity listing in log right for visibility
 *                      Push log test headers right for visibility
 * 1.4s  7-Nov-89 ALB Change form of usage and log as requested by Dave
 * 1.4r  6-Nov-89 ALB Jump to 1.4r because Dave sent out release notes
 *                      with that version number in them
 * 1.4d 24-Oct-89 ALB Add mystrchr in settxt to fix 8-bit wfc bug
 * 1.4c 19-Oct-89 ALB Add trace message for no root found
 *                    Fix test for max suffixes to give trace message
 * 1.4b  4-Oct-89 ALB Fix bug of not displaying file names on -f option
 * 1.4a  2-Oct-89 ALB Cosmetic change to morcla.c to put it in STAMP
 * 1.4  28-Sep-89 ALB Version change only, for release
 * 1.3r 28-Sep-89 ALB Fix bug of showing \w (null) at eof with \f
 * 1.3p 21-Sep-89 ALB Add -f option (control file name file)
 * 1.3o 21-Sep-89 ALB Change name of ANROOT.C to AMPLE.C
 * 1.3n 14-Sep-89 ALB Change Analysis & Root Failure to AF & RF
 * 1.3m 14-Sep-89 ALB Move heading to anroot instead of aninit
 * 1.3k 14-Sep-89 ALB Fix bug of -m display not starting with RETURN
 * 1.3j 14-Sep-89 ALB Add -i and -o to usage, change to [options]
 *
 *      08-Aug-89       hab  - change default max morphname length to 15
 *      05-Aug-89       hab  - modify morphname reference checking to be
 *                               a command line option, to handle RSC roots
 *                               properly, and to check all occurrences of
 *                               morphnames
 *                             put upper bound on max_levels (paranoid check)
 *      31-Jul-89       rk   - mods for MacIntosh Lightspeed's Think_C
 *      28-Jul-89       hab  - add max morphname length trigger
 *                             allow for a \nocap option: do not do any
 *                              capitalization processing of input text
 *      27-Jul-89       hab  - update usage message
 *      26-Jul-89       hab  - replace struct strlist in defs.h with
 *                              STAMP's strlist.h
 *      24-Jul-89       hab  - de-"lint" the source
 *  20-Jul-89   hab  - rename dict.h to ample.h
 *       7-Mar-89       SRMc - add -m option and do_monitor variable
 *   4-Jan-89   SRMc - fix for Microsoft C
 *      12-Nov-88       SRMc - ample ? now prints the header and usage
 *      10-Nov-88       SRMc - change antxgn to ample in usage message
 *      20-Oct-88       SRMc - reorganize the file header comments
 *               - remove firstmark, replaced by code_table field
 *  12-Sep-88   SRMc - change "STRING_ENVIR_ST" to "SEC_ST",
 *              "MORPHEME_ENVIR_FT" to"MEC_FT", and
 *              "MORPHEME_CO-OC_FT" to "MCC_FT"
 *  29-Jul-88   SRMc - add #include "class.h", #include "envir.h",
 *              #include "atest.h", and #include "change.h"
 *  28-Jul-88   SRMc - replace ssalloc() with malloc() and realloc()
 *      15-Jun-88       SRMc - add -v option and do_verify
 *   9-Jun-88   SRMc - add ifx_in global flag
 *   2-Jun-88   SRMc - redo cr_pairs to allow unlimited number of
 *              pairs
 *   1-Jun-88   SRMc - rename norm_word to this_word; add last_word
 *              and next_word
 *  30-May-88   SRMc - merge in contents of ardefs.h, move
 *              declarations of rec_comment_char and
 *              max_levels to anroot.c
 *                           - rewrite main(), splitting out parse_command()
 *                              and usage()
 *  28-May-88   SRMc - added barchar, barcodes, and ambigchar
 *      27-May-88       SRMc - new version of txtin()
 *      26-May-88       SRMc - add optional dictionary orthography change file
 *      25-May-88       SRMc - make nonalph and word_init character pointers,
 *              not arrays; remove alpha[]
 *  14-May-88   SRMc - remove aru_calls, etc. as these are handled
 *              with the final tests
 *  10-May-88   SRMc - change definition of mrules
 *               - delete triggers and classes
 *   2-May-88   SRMc - use getopt() to parse command line options
 *               - add -d [trie depth] and -c [record comment
 *              character] (renamed old -c to -a)
 *               - create global do_orig flag
 *  15-Apr-88   hab - make sabufsize be a variable
 *  14-Apr-88   hab - add morph classes for rules
 *  28-Mar-88   hab - split fntabs out of adefs.h
 *  15-Mar-88   hab - allo conds w/ strs and morphs
 *  23-JUN-86       hab
 *  25-JUL-82   D. Weber/Bob Kasper
 */
