/* VERSION.H - version number and date information for PC-PATR
*******************************************************************************
 * Copyright 1994, 2000 by SIL International.  All rights reserved.
 */
#define VERSION 1		/* major rewrite or expansion */
#define REVISION 2		/* enhancement requiring adding to book */
#define PATCHLEVEL 10		/* bug fix or other minor change */
#define DATE "August 8, 2001"	/* date of release version */
#define YEAR "2001"		/* used for copyright notice in banner */

/******************************************************************************
 * EDIT HISTORY
 * 08-Aug-2001  hab  - fix bug which would not report number of edges in Ample
 * [1.2.10]             ANA file output in \failure line.
 * 15-Jun-2001  hab  - fix bug which would not always show gloss lines in
 * [1.2.9]              trees in ana files when failures were on.
 *              hab  - Put sentence statistics in log file not in ANA file
 *                       when doing PatrParser::DisambiguateAnaFile()
 * 22-May-2001	SRMc - fix bug in applyPATRPriorityUnion() which kept the union
 * [1.2.8]		from working if the input feature did not have the
 *			feature path it was supposed to union with.
 *                    - add check for NULL category feature name before storing
 *        		the grammar in memory.
 *		     - add check for edge nesting depth < 1000 at the point
 *			where we (conditionally) check for cycles
 * 21-May-2001  hab  - fix a bug that would stop reading an ANA file as soon
 * [1.2.7]              as it encountered an ANA failure.  (The problem was
 *                      in senttemp.c in opaclib)
 * 30-Apr-2001  hab  - fix a bug that did not increment sentence count in
 * [1.2.6]              PatrParser::DisambiguateAnaFile()
 * 17-Apr-2001  hab  - fix a bug that had "</f>" instead of "</F>".
 * [1.2.5]             change colons in ids to periods.  Some XML validators
 *                      do not accept colon in ids.
 * 11-Apr-2001  hab  - change XML output to not include header, to use
 * [1.2.4]              initial upper case element names (e.g. "Parse"
 *                      instead of "parse" and "Analysis" instead of
 *                      "analysis").
 * 11-May-2000	SRMc - the "bug" in handling default categories needs to be
 * [1.2.3]		fixed for FILE DISAMBIGUATE as well as for FILE PARSE
 *		     - fix bug in feature display that caused only leaf nodes
 *			in the parse tree to have their features displayed in
 *			XAMPLE output
 *		     - allow empty feature as the target of operations in
 *			lexical rules
 *		     - handle "unify" and "replace" operations differently in
 *			lexical rules
 *		     - remove a couple of unused static functions from
 *			patrlexi.c
 *		     - fixed some memory allocation errors
 * 24-Apr-2000	SRMc - change SENTENCE-FINAL-PUNCTUATION to FINAL-PUNCTUATION
 * [1.2.2]	     - fix the PatrParser::PatrParser constructor to handle
 *			the changes to PATRData properly
 *		     - fix a bizarre bug in dlltest/WinPatrTest.frm that was
 *			crashing when trying to initialize some Boolean
 *			properties
 *		     - add the ANA \d, \u, \fd, and \p (decomposition,
 *			underlying form, feature descriptor, and property)
 *			verbatim field contents to the feature structure of
 *			words acquired from AMPLE analysis.  \fd and \p fields
 *			that are essentially empty are not added to the feature
 *			structure.
 *		     - optionally use the property names in the ANA \p field
 *			as feature template references
 *		     - add the SET PROPERTY-IS-FEATURE command
 *		     - add the AmplePropertyIsFeature property to the
 *			IPatrParser COM interface
 * 18-Apr-2000	SRMc - fix some minor glitches in debug output
 * [1.2.1]	     - use strncat properly - the third argument is the maximum
 *			number of non-NUL characters that can be appended, NOT
 *			the total size of the destination buffer
 *		     - use DynString instead of a fixed buffer for building an
 *			output display
 *		     - dynamically allocate the array of nonterminal names in
 *			PATRRule, and the array of PATRVertex structures in
 *			PATRParseData
 *		     - rename get_ample_roots() to get_ample_morphnames() in
 *			patrampl.c, and fix "bug" that was omitting prefixes
 *			(according to the previous name, the real bug was
 *			including suffixes)
 *		     - fix bug in lcparse.c/extend_lc_edge (fix in 1.1.3
 *			deferred the NULL pointer dereference to later in the
 *			function)
 *		     - allow basic keywords in the grammar file to begin with a
 *			backslash (for example, either rule or \rule is
 *			permitted).  This allows easier interoperation with
 *			Shoebox.
 *		     - added COMMENT keyword to the grammar file parsing, along
 *			with \comment and \co as aliases
 *		     - add the SET SENTENCE-FINAL-PUNCTUATION command
 *		     - add the SentenceFinalPunctuation property to the
 *			IPatrParser COM interface and the
 *		     - fix a "bug" in handling default categories: an explicit
 *			default category imposed by a template ("Let A be !B")
 *			now overrides the implicit default category provided by
 *			the category field of an entry in the lexicon ("\c A")
 * 27-Jan-2000	SRMc - add the SET PROMOTE-DEFAULTS command
 * [1.2.0]	     - add the SET KIMMO PROMOTE-DEFAULTS command
 *		     - add the SET KIMMO CHECK-CYCLES command
 *		     - add the SET KIMMO TOP-DOWN-FILTER command
 *		     - get -q ("Work quietly") to work even more quietly
 * 22-Jan-2000	SRMc - add the rule id string (if available) to the XML output
 * [1.1.4]		of parse nodes
 *		     - change the DLL/COM interface to allow splitting the
 *			lexicon into multiple files
 *		     - add a property to the DLL/COM interface to retrieve the
 *			number of files currently loaded into the in-memory
 *			lexicon
 *		     - add a method to the DLL/COM interface to load AMPLE
 *			Analysis (.ana) files into the in-memory lexicon
 *		     - add a method to the DLL/COM interface to reload the
 *			current set of lexicon files
 *		     - plug a few memory leaks (mostly in the DLL)
 *  6-Dec-1999	SRMc - fix two bugs reported by Benjamin Redelings I
 * [1.1.3]		(bredelin@ucla.edu):
 *			1. buffer overrun in userpatr.c/print_treenode()
 *			2. NULL ptr dereference in lcparse.c/extend_lc_edge()
 *  2-Dec-1999	SRMc - minor fixes to debug output
 * [1.1.2]	     - write summary statistics to log file as well as stderr
 *		     - fix bug in numbering sentences in FILE DISAMBIGUATE
 *			output
 *		     - don't count parses twice in handling the FILE
 *			DISAMBIGUATE command
 *		     - add a method to the DLL/COM interface to implement the
 *			"disambiguate AMPLE Analysis (.ana) file" functionality
 *		     - add a property to the DLL/COM interface to flag whether
 *			or not to write syntactic parses to disambiguated
 *			AMPLE Analysis (.ana) files
 * 22-Sep-1999	SRMc - change XML output to use leading _ (underscore) instead
 * [1.1.1]		of a leading : (colon) in ID attributes.  The XML
 *			parser used by Visual Basic does not handle colons in
 *			ID strings even though the XML standard explicitly
 *			allows them.
 *  2-Sep-1999	SRMc - added SET TREE XML command, and XML file output
 * [1.1.0]	     - added XML string output, and fixed string output for
 *			the other formats (for use by DLLs)
 *		     - bFailure and bUnification no longer propagate from the
 *			syntax (PC-PATR) to the morphological (Kimmo) level
 *		     - extensive internal changes to reduce the number of
 *			static (global) variables to a minimum, in order to
 *			allow multiple PATR grammars to exist simultaneously,
 *			beyond the syntax level / embedded morphological level
 *			already allowed
 *		     - major revision to output functions to handle coindexing
 *			properly for each individual parse.  (This has been
 *			asked for many times, and I finally figured out how to
 *			do it: it requires more memory and processing time,
 *			but not too awful much so.)
 *		     - show both original (lexicon) feature and the output
 *			(unified) feature for leaf nodes of the tree.  (This
 *			was requested by Andy and Cheri Black, and might be
 *			user-controllable in the future.)
 *		     - added SET LIMIT <number> command
 *		     - change FILE DISAMBIGUATE output to match "normal"
 *			output as much as possible
 *		     - change failed parse feature output to use the values
 *			attached to the chart edges rather than the (new)
 *			unified parse features
 *		     - create a DLL/COM interface to the PC-PATR parser
 * 18-May-1999	SRMc - fix for changes to AmpleData structure in version 3.3.0
 * [1.0.1]		of AMPLE
 * 24-Oct-98	SRMc - make header files safe for #including in C++ sources
 * [1.0.0]	     - fix bug in parseAmpleSentenceWithPATR() that was
 *			preventing proper ANA file output
 *		     - fix a few other minor bugs
 *		     - finally decide to call this a release version!!
 *  1-Oct-1998	SRMc - revise error messages as suggested by Cheri Black
 * [0.99b15]
 * 29-Sep-1998	SRMc - remove the #ifdef EXPERIMENTAL from the recent changes
 * [0.99b14]	     - pull cycle checking outside unifyPATRFeatures()
 *		     - add separate error messages for detected cycles within
 *			feature structures
 * 28-Sep-1998	SRMc - check for cycles in the output of unifyPATRFeatures()
 * [0.99b13]
 * 24-Sep-1998	SRMc - added the "Constraint xx is ..." statement to the
 * [0.99b12]		grammar file definition, and fixed rule constraint
 *			expressions to use defined constraints instead of
 *			(in addition to) verbatim constraints
 *		     - fix bugs in tokenizing for constraint expressions
 *		     - fix handling of lexical rules to produce multiple
 *			output features when adding lexical items to the
 *			parse chart
 * 18-Sep-1998	SRMc - defined the PATRPriorityUnion data structure, together
 * [0.99b11]		with related functions
 *		     - defined the PATRConstraint data structure, together with
 *			related data structures and functions
 *		     - marked these changes with #ifdef EXPERIMENTAL
 *		     - fixed various compiler warnings
 * 31-Jul-98	SRMc - bumped patch level for new release (revised OPAC
 * [0.99b10]		library functions)
 * 23-Mar-98	SRMc - move showPATREdge() to lcparse.c
 * [0.99b9]	     - other minor edits
 * 20-Feb-98	SRMc - write buildPATRWord() function for use in AMPLE
 * [0.99b8]	     - make storePATRFeature() and freePATRFeature() globally
 *			accessible for use in AMPLE
 * 23-Dec-97	SRMc - bumped patch level for new beta release (revised
 * [0.99b7]		OPAC and AMPLE library functions)
 * 21-Oct-97	SRMc - revise the handling of SET FEATURES (due to merging
 * [0.99b6]		eFeatureDisplay, bFlatFeatures, and bTrimFeatures
 *			into iFeatureDisplay bit vector)
 *		     - bump the patch level for a formal release (not quite
 *			non-beta yet, need to fix lexical rules)
 * 17-Oct-97	SRMc - rename a couple of functions and move some function
 * [0.99b5]		prototypes from patr.h to patrdef.h
 *		     - fix potential open (input) file leak in handling the
 *			FILE PARSE and FILE DISAMBIGUATE commands
 *		     - remove obsolete "#if <number>" cruft
 *		     - fix kimmo.h and patr.h to #include each other
 * 14-Aug-97	SRMc - rename global functions to include PATR in the names
 * [0.99b4]	     - rename global variables to include PATR in the names
 *		     - rename data structures to include PATR in the names
 *		     - rename data structure elements using my modified
 *			Hungarian naming convention
 *		     - rename PATR_GRAMMAR to PATRGrammar
 *		     - rename PATR_FLAGS to PATRData
 *		     - rename report_progress() to reportProgress(), and move
 *			it to the OPAC library
 *		     - add cComment to PATRData, and eliminate the global
 *			variable cCommentMarker_g
 *		     - fix for changes to the Kimmo library
 *		     - fix bug in storePATRFeature(): it wasn't preserving
 *			coreference structure (converted DAG to tree)
 * 13-Jun-97	SRMc - fix for changes to the CMD library (mostly renaming of
 * [0.99b3]		data structures and functions)
 *		     - move struct message definition to CMD library header
 *			(cmd.h), and rename it to CmdMessage
 *		     - replace cgetline() with promptUser()
 *  8-May-97	SRMc - fix for changes to the OPAC library
 * [0.99b2]	     - fix portability to the Mac
 * 20-Feb-97	SRMc - fix for STDC_HEADERS
 * [0.99b1]	     - fix for changes to the OPAC library
 *  7-Nov-96	SRMc - add the SET AMPLE-DICTIONARY {SPLIT|UNIFIED} command,
 * [0.99b0]		and the bUnifiedAmpleDictionary_g global variable
 *		     - add the LOAD AMPLE CONTROL ... command
 *		     - add the LOAD AMPLE TEXT-CONTROL ... command
 *		     - remove vestiges of the LOAD KIMMO MAPPING <file> command
 *  4-Nov-96	SRMc - fix bug in parse_ample_sentence() that was eliminating
 * [0.97.13]		too many ambiguities when a \fd element expanded to a
 *			disjunctive feature
 *		     - add the SET WRITE-AMPLE-PARSES {ON|OFF} command, and the
 *			bWriteAmpleParses field to the PATR_FLAGS struct
 *  1-Nov-96	SRMc - fix for changes to the OPAC library
 * [0.97.12]	     - rename our report_error() to reportFileError()
 *  4-Mar-96	SRMc - fix for DJGPP 2.0 / GNU C 2.7.2
 * [0.97.11]	     - change optimization flag to -O2 in the makefile
 *  8-Jan-96	SRMc - add error 555 (No_unified_disjunct) for NULL return from
 * [0.97.10]		unifyDisjuncts() in read_disjunction();
 *		     - add check for template names masquerading as atoms in
 *			read_disjunction()
 * 30-Oct-95	SRMc - fix for config.h (based on GNU Autoconf processing)
 * [0.97.9]	     - get Mac/PowerPC compilation to work
 * 19-Oct-95	SRMc - fix bug in error message in read_ample_sentence()
 * [0.97.8]	     - ensure that the grammar is loaded before a FILE
 *			DISAMBIGUATE command
 *		     - fix several NULL pointer dereferences in the functions
 *			implementing the FILE DISAMBIGUATE command
 *		     - fix index increment bug in build_feat_index()
 * 12-Oct-95	SRMc - change progress reporting for the FILE PARSE command to
 * [0.97.7]		use showAmbiguousProgress()
 *		     - add END keyword to the grammar file
 *  6-Oct-95	SRMc - rename Template to Definition
 * [0.97.6]	     - implement Lexical Rules
 *		     - replace the KIMMO MAPPING file with the special lexical
 *			rule MapKimmoFeatures (in the grammar file)
 *		     - remove the LOAD KIMMO MAPPING command and associated
 *			functions (except for small error messages left as
 *			temporary placeholders)
 *  4-Oct-95	SRMc - allow disjunctions in the unification constraints
 * [0.97.5]		associated with phrase structure rules
 *  2-Oct-95	SRMc - add SET CHECK-CYCLES {ON|OFF}
 * [0.97.4]	     - add SET TOP-DOWN-FILTER {ON|OFF}
 *		     - try to handle e-productions (empty RHS) better
 *		     - use build_pathname() to make FILE command input
 *			filenames relative to the location of the take file
 * 12-Sep-95	SRMc - move misplaced help message for CLEAR command
 * [0.97.3]	     - fix help message for SET VERBOSE {ON|OFF} command
 *		     - finish writing freeStoredString()
 *		     - call cleanupUnifyDebris() and freeStoredString() in
 *			do_clear()
 *		     - add missing pieces to free_lexicon()
 *		     - remove bogus myfree() from load_ample()
 *		     - set glosses_exist and PATR_Flags.gloss in load_ample()
 *  1-Sep-95	SRMc - incorporate bugfix sent by Andy Black last April for
 * [0.97.2]		preventing an empty edge from being added to itself
 *		     - fix loadRule() to be more tolerant of repeated
 *			nonterminals in phrase structure rules
 *		     - fix code to try to handle ->bShowFailures in spite of
 *			using new, improved unification function
 *		     - fix loadRule() to properly handle unifications for
 *			phrase structure rules with empty RHS
 *		     - revise addition of empty edges to occur both before and
 *			after each word is added as a lexical edge -- this fix
 *			allows at least some adjacent empty edges to occur
 * 25-Aug-95	SRMc - replace unify()---requires copying before trying to
 * [0.97.1]		unify---with unifyFeatures()---copy only after a
 *			successful unification
 *		     - replace unify_alternatives() with unifyDisjuncts()
 *		     - fix portability to Unix and the Macintosh
 * 22-Aug-95	SRMc - revise gettok() and nexttok() in GRAMMAR.C, rename them
 * [0.97.0]		to getToken() and getNextToken()
 *		     - move definitions of Formula and PSR from PATR.H to
 *			GRAMMAR.C, and rename them to ComplexPSR and
 *			SimplePSR respectively, to better reflect their use
 *		     - rename Featn to FeatureValue, Featd to FeatureDisjunct,
 *			and Featl to ComplexFeature
 *		     - add a FeatureDisjunct pointer to the union in the
 *			FeatureValue struct
 *		     - move alloc_formula() and alloc_psr() from PATALLOC.C to
 *			GRAMMAR.C, and renamed them to alloc_ComplexPSR() and
 *			alloc_SimplePSR()
 *		     - filter unification formulas for PSR rules so that only
 *			those unifications that involve the actual rule found
 *			are applied
 *		     - rename copy_fs() to copyFeatureValue()
 *		     - rename Let to Template, rename find_let() to
 *			findTemplate(), and rename new_let() to newTemplate()
 *		     - move show_lets() from USERFUNC.C to GRAMMAR.C, and
 *			rename it to showTemplates()
 *		     - write storedString(), to use for storing single copies
 *			of strings used for feature labels and atoms
 *		     - write VERSION.C to simplify version messages, and to
 *			ensure compilation date always valid
 *		     - replace parse_goal(PATR_GRAMMAR *patrp) in LCPARSE.C
 *			with patrp->pszStartSymbol
 *		     - handle "Parameter: Category feature is XXX." in grammar
 *			files, and add pszCatFeatName to PATR_GRAMMAR struct
 *		     - handle "Parameter: Lexical feature is XXX." in grammar
 *			files, and add pszLexFeatName to PATR_GRAMMAR struct
 *		     - handle "Parameter: Gloss feature is XXX." in grammar
 *			files, and add pszGlossFeatName to PATR_GRAMMAR struct
 *  2-Aug-95	SRMc - add loading of Parameter settings to the load_grammar()
 * [0.96.17]		function
 *		     - support Parameter:  Attribute order is ...
 *		     - support Parameter:  Start symbol is ...
 *		     - store information for Parameter:  Restrictor is ...
 *		     - increase compatibility of grammar files to those in
 *			Shieber's book (original PATR-II)
 * 12-Jul-95	SRMc - change load_grammar() and lc_parse() to not reset
 * [0.96.16]		cancelOperation when cancelled
 *  8-Jun-95	SRMc - fix bugs in write_feature()
 * [0.96.15]	     - fix report_progress() to its new, simpler definition
 * 24-May-95	SRMc - add report_progress() for the benefit of MS Windows
 * [0.96.14]		DDE servers
 *		     - also add cancelOperation flag for use of DDE servers
 * 14-Mar-95	SRMc - fix STATUS command to report "Kimmo" files instead of
 * [0.96.13]		"Kermit" files
 *		     - fix LOAD and TAKE commands to use any subdirectory
 *			information from the current TAKE file (if any) in a
 *			fashion similar to PC-KIMMO's lexicon's INCLUDE
 *			directive
 *		     - add comment_char argument to getline()
 *		     - extract get_command() from do_cmd() to put in the CMD
 *			function library
 * 28-Feb-95	SRMc - call free_lexicon() unconditionally for LOAD LEXICON
 * [0.96.12]		and LOAD ANALYSIS
 * 24-Feb-95	SRMc - fix a portability problem with yesterday's changes, and
 * [0.96.11]		add a function comment header that I forgot
 * 23-Feb-95	SRMc - fiddle with how PC-PATR builds gloss features both from
 * [0.96.10]		loading a lexicon and from using a PC-KIMMO parser
 *		     - add more error checking to loading and using feature
 *			mappings
 * 20-Feb-95	SRMc - repair the bug fix, and remove the debugging print
 * [0.96.9]		statements from LEXIFUNC.C
 * 17-Feb-95	SRMc - fix a bug in writing features to a lexicon file for the
 * [0.96.8]		SAVE LEXICON command
 * 14-Feb-95	SRMc - fix a bug in the feature mapping between pc-kimmo
 * [0.96.7]		morphology and pc-patr syntax
 *  2-Feb-95	SRMc - fix some minor output message errors in the user
 * [0.96.6]		interface
 * 20-Jan-95	SRMc - code cleanup: replace magic numbers with more meaningful
 * [0.96.5]		symbols
 * 18-Jan-95	SRMc - fix the feature mapping between the PC-Kimmo word
 * [0.96.4]		parsing and the PC-PATR sentence parsing to use feature
 *			paths instead of top level feature names
 *		     - fix bugs in the SHOW LEXICON and SAVE LEXICON commands
 * 30-Nov-94 	SRMc - fix bug in previous change (capitalization of keywords)
 * [0.96.3]	     - fix typo in do_save_status(): "kimmo", not "kermit"!
 * 28-Nov-94 	SRMc - allow Let and Rule keywords in the grammar file to be
 * [0.96.2]		capitalized any which way
 * 25-Nov-94	SRMc - fix AMPLE analysis file input to ignore any morpheme
 * [0.96.1]		categories following the (probable) word category
 * 21-Nov-94	SRMc - major shuffling of sources and revision of makefile
 * [0.96.0]		to eliminate duplicate copies of files on the disk
 * 17-Nov-94	SRMc - fix some typographical errors in the help messages
 * [0.95.23]	     - revise banner process for "alpha" vs. "beta"
 *		     - display count of parses when more than one found
 * 15-Nov-94	SRMc - incorporate the changes made to SILPATR last summer by
 * [0.95.22]		Bob Kasper
 *		     - change program banner to say "Alpha" instead of "Beta"
 * 10-Nov-94 	SRMc - use the Rule keyword in the grammar file, and allow
 * [0.95.21]		the Let and Rule declarations to be intermixed
 *  9-Nov-94	SRMc - add the SET COMMENT command
 * [0.95.20]	     - bring SHOW STATUS and SAVE STATUS up to date
 *  8-Nov-94	SRMc - allow parsing with just the PC-Kimmo files loaded, but
 * [0.95.19]		no PC-PATR lexicon loaded
 *		     - in addfd(), don't add a copy of a Word already in the
 *			list of Word structs
 *  3-Nov-94	SRMc - fix PATR garbage collection to allow 2 separate grammars
 * [0.95.18]		to be loaded and unloaded independently
 *		     - fix load_lexicon() to read files containing simple
 *			"feature path assignments" in the feature field: LOAD
 *			LEXICON can now handle what SAVE LEXICON produces
 *  2-Nov-94	SRMc - add SAVE LEXICON <file> command
 * [0.95.17]	     - fix new memory leaks
 *  1-Nov-94	SRMc - call kimmo_parse() when words not found in lexicon
 * [0.95.16]	     - add LOAD KIMMO MAPPING command
 *		     - change SAVE <file> command to SAVE STATUS <file>
 * 31-Oct-94	SRMc - establish the framework for the LOAD KIMMO and LOAD
 * [0.95.15]		AMPLE commands
 * 28-Oct-94	SRMc - fix remaining memory leaks
 * [0.95.14]	     - add the FILE DISAMBIGUATE command
 *		     - rename LOAD AMPLE to LOAD ANALYSIS
 *		     - allow multiple LEXICON or ANALYSIS files in a LOAD
 *			command
 * 27-Oct-94	SRMc - remove the SET MODE, SET SENTENCES, and LOAD SENTENCES
 * [0.95.13]		commands
 *		     - fix some memory leaks
 * 26-Oct-94	SRMc - handle Out of memory better for MPW C
 * [0.95.12]	     - rename NEW to CLEAR
 * 25-Oct-94	SRMc - add SET TREE INDENTED command
 * [0.95.11]	     - add LOAD AMPLE command
 * 24-Oct-94	SRMc - fix bugs in tree output horizontal spacing
 * [0.95.10]	     - fix bug in handling SET TRIM-EMPTY-FEATURE ON/OFF
 *		     - trim trailing whitespace in gloss entries of lexicon
 * 22-Oct-94	SRMc - fix spacing for parse output
 * [0.95.9]
 * 21-Oct-94	SRMc - define PATR_GRAMMAR structure
 * [0.95.8]	     - replace global variables to make the PATR functions
 *			reentrant
 * 20-Oct-94	SRMc - fix -l option to work properly
 * [0.95.7]	     - allow indexes (_1) on the left side of phrase structure
 *			rules in the grammar
 * 19-Oct-94	SRMc - fix bug in FILE PARSE command
 * [0.95.6]	     - fix output of various warning/error messages
 * 14-Oct-94	SRMc - add FILE PARSE command
 * [0.95.5]	     - allow fixed phrases in the lexicon
 * 13-Oct-94	SRMc - add gloss field to the lexicon
 * [0.95.4]	     - rename "part-of-speech" to "category"
 *		     - change default from \p to \c for that lexicon field code
 *  6-Oct-94	SRMc - add SET MODE command
 * [0.95.3]	     - add LEXICON mode as well as AMPLE mode; leave room for
 *			IT mode and SHOEBOX mode as well
 * [0.95.2]	     - rewrite loadampsent() to use dtbin() instead of getrec()
 *		     - eliminate unused functions and global variables
 *		     - use getopt() to parse the command line arguments
 *  3-Oct-94	SRMc - use loadampsent() explicitly instead of loadsent()
 * 30-Sep-94	SRMc - reorganize sources to maximize sharing with PC-KIMMO
 * [0.95.1]	     - fix bug in feature display
 *		     - fix problems with SET and HELP SET
 *		     - fix STATUS to better reflect SET
 * 28-Sep-94	SRMc - incorporate report_message() from PCKIMMO.C
 * [0.95.0]	     - fix the opening banner to display version information
 *
 * 10-Jul-94	jas - Get rid of sentence_begin - not needed with new memory
 *			management routines.
 * 10-Jul-94	jas - Rename gramfile to gram_file and make it global.
 * 26-Jun-94	jas - Get rid of Sent *sent as a global.
 * 26-Jun-94	jas - Make sentence_begin a SentList ptr instead of char ptr
 * 25-Jun-94	jas - Don't set sentence_begin to temporary region -- done
 *		       in loadsent().
 * 09-Jun-94	jas - Rename infile to sent_file and make it global.
 *		jas - Allow, in get_args(), for all command line arguments
 *			to be optional and do not assume any defaults.
 *		jas - Changed usage message in usage().
 *		jas - Check for cmdfile (take) file name in get_args().
 *		jas - Get rid of call to load_grammar from main().
 *   Mar-94	jas - Code drawn heavily from main.c of sil_patr rel. 1.4
 */
