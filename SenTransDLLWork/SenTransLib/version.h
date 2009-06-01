/* VERSION.H - version number and date information for SenTrans
 ***************************************************************************
 * Copyright 2000-2004 by SIL International.  All rights reserved.
 */
#define VERSION 2		/* major rewrite or expansion */
#define REVISION 2		/* enhancement requiring adding to book */
#define PATCHLEVEL 2		/* bug fix or other minor change */
#define DATE "September 26, 2008"	/* date of release version */
#define YEAR "2008"		/* used for copyright notice in banner */

/*****************************************************************************
 * EDIT HISTORY
 * 26-Sep-2008  hab  - Fix bug: if a rule has an optional suffix class in
 * [2.2.2]               both the match and replace, it would crash.
 * 03-Mar-2006  hab  - Fix bug: if a word is moved, then the following word
 * [2.2.1]               got the capitalization of the moved word.
 * 24-Nov-2004  md   - Feature addition; %-sign before category now makes
 * [2.2.0]             SenTrans refer to root category
 * 01-Jul-2002  hab  - Rework punctuation to use strings (in order to handle
 * [2.1.0]               UTF-8 Unicode).  Means change to documentation.
 * 22-Apr-2002  hab  - Fix bug: a begin punctuation would not match in some
 * [2.0.7]               disambiguation rules.
 * 18-Jul-2001  hab  - Fix bug: if \a field of ANA has any extra spaces, then
 * [2.0.6]               the extra space can be treated as a morphname.
 * 14-Jul-2001  hab  - Fix bug: Converting a root to a suffix on a previous
 * [2.0.5]               word fails if the previous word has any trailing
 *                       whitespace
 * 25-Oct-2000  hab  - Fix bug: SenTrans32 version crashes if there is no
 * [2.0.4]               log file.
 * 28-Sep-2000  jdh  - increase memory limit from 64000 to 640000
 * [2.0.3]              (note that this is just a partial solution)
 * 26-Jul-2000  hab  - compile under DJGPP using SenTransLib
 * [2.0.2]
 * 16-Jun-2000  hab  - remember morpheme cats in the \cat field (note that
 * [2.0.1]              for insertions, we have no way to know what the
 *                      content of this should be).
 * 13-Jun-2000  hab  - create a DLL: make re-entrant, remove all memory leaks,
 * [2.0.0]		convert non-main code into library.
 *                     add -x (ignore \cat field) option to non-Mac version
* 1.2zh  24-Feb-2000 hab Fix bug: a failure might be missing a \cat field and
*                         the code was dereferencing a null pointer.

* 1.2zg  02-Nov-1999 hab Fix bug : did not count input ambiguities correctly if
*                          there was a "fake" punctuation word.
* 1.2zf  18-Jun-1999 hab Fix bug: treated all &'s as if they are dividing chars
*                         when only ones followed by '/' really are.
* 1.2ze  16-Apr-1999 hab Fix bug: a reject rule with a repeated affix would
*                         incorrectly disambiguate a single occurrence of that
*                         affix.
* 1.2zd  20-Nov-1998 hab Fix bug: an ending punctuation symbol in a replacement
*                         without following environment would crash Win32
*                         version.
* 1.2zc  20-Nov-1998 hab Fix bug: when a begin punctuation symbol is also used
*                         as an end punctuation symbol, it erroneously treated
*                         the begin occurrence as if it were an end occurrence.
* 1.2zb  19-Oct-1998 hab Insist that all optional replacement elements have
*                        identical match elements as originally intended.
* 1.2za  02-Oct-1998 hab Fix bug which caused Win32 version to crash on non-ANA
*                        input
* 1.2z 30-Sep-1998 hab Send errlogfile error messages to logfile, too, if the
*                        logfile is redirected to a file.
*                      Refine 1.2y so that capitalization of a deleted root
*                        within a "Cat=A > -B" kind of rule does not put A's
*                        capitalization on a following word.
* 1.2y 11-Sep-1998 hab Refine 1.2x so that it applies only to replacements and
*                        not to deletions or initial insertions
* 1.2x 09-Sep-1998 hab Fix bug which failed to maintain capitalization of the
*                        initial matching word in a replacement when it was
*                        not sentence initial
* 1.2w 31-Aug-1998 hab Add Compile date option
*                      Fix bug which caused streq() (i.e. !strcmp()) to crash
*                        on null values for failures
* 1.2v 24-Apr-97 AB Don't treat [ as close unless open was present
* 1.2u 16-Apr-97 AB Fix bug of losing affix that appears in both match and replace
* 1.2t 10-Apr-97 AB Fix bug from 1.2a of seeing \f \\v as an element to match ~Conj in / # ~Conj _
* 1.2s 10-Apr-97 AB Make split and join work
* 1.2r 9-Apr-97 AB Make affix substitution work
* 1.2q 9-Apr-97 AB Don't keep affixes if root completely deleted
* 1.2p 9-Apr-97 AB Allow / and _ in morphnames if not followed by space
*					Allow parends in morphnames if not preceded by space
* 1.2n 9-Apr-97 AB Fix bug of zero at eof with no nl not recognized
* 1.2m 8-Apr-97 AB Fix bug of not correctly distinguishing multiples of same affix class
* 1.2k 8-Apr-97 AB Fix GPF from rule with all elements optional, rule now works
* 1.2h 12-Dec-95 RNE & AB Applying property rules in environments.
* 1.2g 09-Dec-95 RNE Added processing of properties and tag character (default '^')
* 1.2f 29-Nov-95 BJY report number of occurences of \ruleson and \rulesoff
* 1.2e 28-Nov-95 BJY Made so -[mcl] works
* 1.2d 21-Nov-95 BJY Fixed bug of SENTRANS bombing when out of temp memory.
*                   It now exits gracefully and outputs memory allocation error.
* 1.2c 20-Nov-95 BJY Fix bug from 1.2a of words getting inserted before initial punctuation,
*                   markers, etc at beginning of sentence. Also fix bug of trace
*                   showing \f field content - initial punc, etc as first word of sentence.
* 1.2b 29-Jun-95 BJY Fix capitalization code broken by 1.2a
* 1.2a 27-Jun-95 BJY Give punctuation and whitespace their own nodes in the sentence
*                   structure instead of being attached to the word they came in with.
*                   Enforce 100 max word per sentence limit.
*                   Fixed problem of # ... x and ... x not working
*                   Output \u field for inserted words
* 1.2  03-May-95 BJY Require matching parens without whitespace between for
*                   optional items in rules and removed parens from default punct list
* 1.1y 7 Oct 94 ALB Fix bug of delete losing punc of preceding word
* 1.1w 7 Oct 94 ALB Fix bug of delete losing format of following word
* 1.1v 6 Oct 94 ALB Fix bug of delete losing capitalization of following word
* 1.1u 4-Oct-94 AB Change line to malloc instead of static, enlarge MAXLINE to 20,000
*                   This fixed a bug Andy hit from having 253 ambiguities of one word
* 1.1t  1-Aug-94 AB Add code (with ifdef Func) to compile as Windows function
* 1.1s  1-Jul-94 AB Pass \u field
*                   Fix bug in "Illegal use of >" message put in by Bill
* 1.1m 31-Mar-94 AB Fix hang bug of not ignoring erroneous rules
*                   Fix bug of preceding context of # showing garbage
* 1.1k  7-Mar-94 WM fix hang bugs on empty input file, _ in non-env
*                   and > in non-\ru;
*                   pass over class bracket ] when needed.  Fix \n fields
*                   being truncated to single lines.
* 1.1j 23 Feb 94 AB/JK If no cat on insert use cat of unreferenced match
*                   Patterns (\pat)
*                   Rule sets (\ruleset, \endruleset) -- don't "feed" within sets
*                   Bug fixes for repeated item (at end of match)
*                   Add switch for \am and \rej rules being unanimous by default
*                     (\unanimous, \nonunanimous) -- init setting is non-unanimous
*                   Modified statistics to be more compact
* 1.1h 22-Feb-94 JK/AB Implement &/ for ANDed environments
*                   Fix / _ ... -SFX and similar environs
*                   Allow negated suffixes after non-negated
*                   Allow negated affixes in match
*      AB 21 Feb 94 Fixed bug with negated environment with suffix
* 1.1f JK 19-Feb-94 Port to MacCADA environment
*                   Add repeat (+) and tagging (^) and auto-association
*                     of identical elements in match & replace
*                   (Incidentally, blocked attempt to duplicate a root)
* 1.1e WM 29-Dec-93 Make [] work in rules; add -v for class dump;
*                   eliminate some whitespace bugs
* 1.1d 24 Sep 93 AB Allow square brackets around classes, but don't require
*                       Require anything in square brackets to be a class
*                   Add preceding context separate line to trace display
*                   Align trace parts better and clean up rule display
* 1.1c 21 Sep 93 AB Allow 0 as replacement to mean delete (besides nothing)
*                   Fix bug of mem overflow if no space before slash
*                   Add statistics on ambigs and ambig words in and out
* 1.1b 11 Aug 93 AB Compile under C8.
*                   Fix warning about void func loadrules returning value
*                   (It returned NULL on empty rule file, but that's OK now.)
*                   Add ## as optional sentence boundary marker (besides #)
*                   Add -> as optional rule replacement marker (besides >)
* 1.1a 10-Jun-93 WM Add unanimous rule forms: \rejun,\amun.
*                   Fix hangs by error_msg.
*                   Filter \ from sentpunc.
*                   Add rule numbers, sentence id in trace.
*                   Restore previous word in trace.
*                   Allow classes to include classes.
*                   Allow [included] brackets on class names.
*                   Fix env. /_ not working.
*                   Self announce to screen.
*                   Add \ruleson and \rulesoff forms.
*                   Remove separation of disambig and change rules.
* 1.0t  6-May-93 AB Port to Mac for release
* 1.0s  7-Apr-93 AB Add numbers to ambig monitor dots
* 1.0r  6-Apr-93 AB Split ambig from ru in prep for repeat ambig
*                   Add warning for \ru rule disambiguating
*                   Change trace to show rule first
*                   Change trace to show changed word at front
*                   Fix bug of all rules acting like reject
*                   Fix bug of -m monitor not showing ambig rules
* 1.0q  8-Mar-93 AB Fix bug of punc not working in envir
* 1.0p  3-Mar-93 AB Do some things suggested by Bill's code, plus my wishes
*                   Open up storage of rules to be much bigger
*                   Count rules and rule applications and report
*                   Limit sentence loading to 100 for word lists
*                   Add numbers after monitor lines
* 1.0n 18-Jan-93 AB Fix bug in 1.0m of not recognizing default comment char
* 1.0m 12-Nov-92 AB Add -c option for comment character
* 1.0k 10-Nov-92 AB Fix bug in 1.0j of hanging after error messages
* 1.0j  9-Nov-92 AB Send messages to log file, don't produce empty output
* 1.0h 13-Oct-92 AB Reconcile MAC and DOS versions
* 1.0g 22-Jul-92 BK Port 1.0e to Mac THINK_C
* 1.0f 14-Jul-92 AB Allow \mcl and \ccl as classes along with \cl
* 1.0e  1-Apr-92 AB Add \rej rule to reject an ambiguity
* 1.0d 27-Mar-92 AB Fix bug of sentence initial not working
* 1.0c 22-Jan-92 AB Fix bug of memory full message from extra wedge in line
* 1.0b 10-Jan-92 AB Fix error messages for inserted word and root
*                       Fix trace display - to -- for compound roots
* 1.0a 22-Nov-91 AB Fix bug of left env failing on root suff combos
*                       Version change for release
* 0.4z 20-Nov-91 AB Enlarge MAXLINE to 2000 for huge ambigs
* 0.4y 20-Nov-91 AB Enlarge available space for sent to 64000
* 0.4w 20-Nov-91 AB Fix bug of memory overflow from % in morphname
* 0.4v 19-Nov-91 AB Fix bug of failing to match right after replace
* 0.4u 18-Nov-91 AB Change compound root ref to -- double hyphen
* 0.4t 12-Nov-91 AB Allow multiple environments (OR)
* 0.4s 25-Oct-91 AB Keep unreferenced compound roots like suffixes
*                       \ru black > Adj=white | black-bird > white-bird
* 0.4r 25-Oct-91 AB Allow affix class reference in replacment
*                       \ru N Number (-Nsuff) > Number N (-Nsuff)
* 0.4p 24-Oct-91 AB Carry unreferenced affixes across where possible
* 0.4n 18-Oct-91 AB Remove vestigial + code, allow + in morphnames
*                   Compound root reference \am black-bird
*                   Remove root
*                       \ru black-bird > black N=bird | black gets affixes
*                   Build compound root
*                       \ru black bird > black-N=bird | gets affs of black
*                       \ru black bird (-PL) > black-N=bird (-PL) | keep PL
* 0.4m 17-Oct-91 AB Limit ellipses to 5, add \... 6 to change limit
* 0.4k 16-Oct-91 AB Fix bug of prefix inserted on wrong root
*                   Fix bug of missing underline message showing prev line
*                   Allow delete of word
* 0.4j 10-Oct-91 AB Give error if second environ found
* 0.4i 10-Oct-91 AB Add negation to environ bar \am x / y ~_ z
* 0.4h  9-Oct-91 AB Disallow affix class in replace of rule
*                   Disallow unreferenced class in replace of rule
*                   Disallow neg except in environ
*                   Place error message above bad line instead of below
*                   Disallow affix alone in match if replace
* 0.4g  8-Oct-91 AB Make NOT work with affix
*                   Make affix work as first in environment
* 0.4f  7-Oct-91 AB Fix 0.4c bug of ellipses in replace causing junk out
*                   Change symbol SCL to MCL, it is morpheme class
*                   Change trace output to show prev word again
* 0.4e  7-Oct-91 AB Fix 0.4c bug of not breaking between sentences
* 0.4d  4-Oct-91 AB Fix 0.4c bug of trace not right after rearrange
* 0.4c  3-Oct-91 AB Finish environ coding, not fully tested yet
*                   Change sent bound to store literal pound sign
* 0.4b  3-Oct-91 AB Rework environ partially, still unfinished
* 0.4a  2-Oct-91 AB Add environment \am x / _ y (Mark Bean)
* 0.3v 26-Sep-91 AB Consider hyphen with no spaces part of morph name
* 0.3u 25-Sep-91 AB Allow only morphnames or cats in classes
*                   Make classes of affixes work
* 0.3t 20-Sep-91 AB Fixed bug of failing to match sent initial \am # but
* 0.3s 13-Sep-91 AB Added new design plan comments to top of file
* 0.3r  6-Aug-91 AB Fix bug of losing nl when word with it is deleted
* 0.3p 29-Jul-91 AB Fix bug of not removing prefix
* 0.3n 26-Jul-91 AB Put empty element on front of sentence
*                   Fix bug of double insert at front of sentence
* 0.3m 25-Jul-91 AB Clean up pattern and class code some
* 0.3k 24-Jul-91 AB Remove endmp, change begmp to matmp
* 0.3j 19-Jul-91 AB Fix bug of add prefix not working
*                   Fix bug of not adding affixes to all ambigs
* 0.3i 12-Jul-91 AB Fix bug of not recognizing same root if affix
* 0.3h 26-Mar-91 AB Make close parend work as punc if preceded by space
*                   Fix bug of trace showing multiples of word for affixes
* 0.3g 25-Mar-91 AB Add \bpunc for begin punctuation
* 0.3f 22-Mar-91 AB Add MORE and BPUNC bits to match type
* 0.3e 21-Mar-91 AB Don't show * from -a on %0%% at end of analysis
* 0.3d 26-Feb-91 AB Fix bug of cat,suffix matching where it shouldn't
* 0.3c 25-Feb-91 AB Disallow NOT on affixes for now, they don't work
*                   Add -a option to monitor output ambiguities
* 0.3b 21-Feb-91 AB Fix bug from 0.3a of not matching pairs of roots
* 0.3a 21-Feb-91 AB Fix bug of suffix matching even if root fails
*                   Fix bug of optional affixes not working right
*                    (Now they are allowed, but do not match anything)
* 0.3  19-Feb-91 AB Fix monitor of \am to show like trace
*                   Version change for local release
* 0.2m 19-Feb-91 AB Fix bug of not always recognizing end of sentence
* 0.2k 19-Feb-91 AB Fix trace of \am to show only if disambiguated
* 0.2j 19-Feb-91 AB Fix bug of not ignoring comments on \sentpunc
*                   Fix bug of not recognizing cat with morph cats after
* 0.2h 18-Feb-91 AB Make punc/fmt not move w/wrd [1/2 da] \ru N V # > V N
*                   Fix monitor bug of only 9 before first space
* 0.2g 15-Feb-91 AB Fix bug of punc match not seeing punc at sent end
* 0.2f 14-Feb-91 AB Add punctuation match [1 da] (1/2 aft) \am , Conj
*                   Add \sentpunc and \punc field markers
*                   Fix bug in trace display of ambiguous match
* 0.2e 13-Feb-91 AB Fix bug of extra wedges coming out on compound roots
*                   Fix bug of cat output even if not input
*                   Fix bug of compound roots shown tight together in trace
*                   Change slash to precent for ambig in trace
* 0.2d  7-Feb-91 AB Fix bug of not doing \ru X ... # > ... X
* 0.2c  6-Feb-91 AB Make trace show only context close to change
* 0.2b  6-Feb-91 AB Make trace show morphemes, not input words
* 0.2a  6-Feb-91 AB Allow NOT on right side to reference \ru N ~V > ~V N
*                   Make optional succeed on first word of sent
*                   Make optional succeed on last word of sent
*                   Fix up trace to be much nicer
* 0.2  31-Jan-91 AB Make classes work again
* 0.1w 31-Jan-91 AB Make all NOT be environment
* 0.1v 31-Jan-91 AB Add ellipses (1/2 da) (1/2 aft)
* 0.1u 31-Jan-91 AB Separate trymatch and invertmatch into routines
*       (Make ellipsis work                  1 da \am N ... V)
* 0.1t 31-Jan-91 AB Fix bugs in affixes
* 0.1s 31-Jan-91 AB Add morpheme match, move, split, and join (1 da) (aft)
* 0.1r 30-Jan-91 AB Make sent bound and NOT work at front (1 da) (morn)
*                   Put ENV code into match, disambig, and replace
*       (Make morpheme match work        1 da \am N -PLUR V)
*       (Make morpheme move work         1 da \ru N -PLUR V > N V -PLUR)
*       (Make split work                 1 da \ru N -PLUR > N Part=PLUR)
*       (Make join work                  1 da \ru N PLUR > N -PLUR)
* 0.1q 29-Jan-91 AB Make NOT and sent bound work (2 da) (morn, aft & eve)
* 0.1p 28-Jan-91 AB Add disambiguate on both \ru and \am (1 da)
*       (Make NOT work                     1/2 da \am V ~N)
*       (Make sent boundary work           1/2 da \am # Conj)
* 0.1n 26-Jan-91 AB Assume word before = is category
*                   Fix up various error message problems
*                   Allow ) in morphname if ( earlier in name
*                   Decided to always require cat with new root
*                   Decided replace references only if identical match
*       (Do disambiguate                     1 da \am V N)
* 0.1m 22-Jan-91 AB Fix false return on loadambig
* 0.1k  8-Nov-90 AB Finish replace, add classes and options
* 0.1j  7-Nov-90 AB Add code to match, begin replace
* 0.1h  5-Nov-90 AB Add code to load rules
* 0.1g 31-Oct-90 AB All code for loadsent and putsent done
* 0.1f 29-Oct-90 AB Code loadsent and putsent tested
* 0.1e 29-Oct-90 AB Move decomp into Ambigs
* 0.1d 26-Oct-90 AB Start loadsent and loadword code
* 0.1c 26-Oct-90 AB Move all file opens to parse_command routine
* 0.1b 26-Oct-90 AB Fix prototypes, etc, to not produce warnings
* 0.1a 26-Oct-90 AB Rename to sentrans
*                   Add include myallo.h
* 0.1  25-Oct-90 AB Original coding

 */
/* BUGS AND WEAK FEATURES: A partial list of 12 June 93.  WM

v1. Flag overuse of matched has not been fixed.  KILLLAST.ZIP    [1da]
2. The trace is very hard to read, is unhelpful for most
		left environment matching.      (Needs some thought.)   [6h]
3. Contentless environments are not rejected, e.g. simply / ~_  [1h]
4. Optional elmts: ( PAST ) is 3 reqd. elmts, (PAST) is one opt. [2h]
v5. Memory runs out on wordlists.  Limit sentences to 100 words. [2h]
6. Separated sentence punctuation is not seen .      (restruct) [6h]
7. Matching of compounds, e.g. n--n, matches simple n as well.
		A compound/noncompound distinction, probably along with
		ordered match in compounds, is needed.       (restruct) [6h]

Thoughts and plans Alan B Feb 94
Ideas:
_ Break sentence on format marker (\\ in \f field) [4h]
	  This has probably caused a lot of people some grief because
	it allows environments and rules to cross from section heads
	into text. There is not usually punctuation after a section
	head, so it flows right into the verse. I certainly saw this
	problem in the East Eurasia workshop in Feb 94. For example,
	verse 4 of Philemon has a section head before it, and one rule
	looks back for a subject and finds a noun in the section head.
	  One question is whether people ever really want there to not
	be a break at verse markers that are not sentence breaks. For
	example, verse 4 of Philemon flows right into verse 5, with
	only a comma between. And it really is one sentence because
	verse 5 begins with the word "because". However, long distance
	dependencies of the type that cross over a verse boundary seem
	awfully unlikely to be very useful at the level at which
	SENTRANS rules can work. There is certainly almost always a
	clause boundary at verse break, and it is usually a fairly
	significant structural break.
	  Not as easy as it seems because it requires holding the word
	with the format information and making it the first word of
	the next sentence instead of linking it on the current one.
	  Also probably should be kept upward compatible, which
	requires making it somehow optional. One idea would be to say
	that if the backslash is included in the list of sentence
	punctuation, then it is picked up and used to trigger the break
	at format markers. It of course wouldn't actually work internally
	as sentence punctuation, but it could be sensed and removed from
	that list and used to set a flag to break on format markers.

Done:
v_   Substitution rule predict category              [2h] me (for Warren)
		\ru wear > bind / belt _
v   Make pattern match                  2 da \pat Np (Det) (Adj)+ N
v   Make pattern move                   2 da \ru Np -POSS N > N Prep=of Np
v   Make plus work                    1/2 da \am V+
vx   Multiple ref bug        \ru Adv V > Adv Adv V   [2h] me

Dropped ideas:
x   Require wedge with \ru and don't allow with \am [1/2h] me
		(not right now, too tough and dangerous to rush)
x   Root category alone     \am V=                  [4h] Warren Glover
		\am V-
x   Root category with root                         [2h] Bean 12
		\am V2-*masa
x   Add case match and change           1 da \ru ~# ^the lord > the lord
x   Bug of losing capitalization of word            [1h] Randy Regnier
		\ru of Word > Word
		(Very unlikely to occur now that we have envir and delete.)

Current design 13 Sep 91:
\ru N Number > Number N                     | Moves suffixes with Number
\ru N Number (-Suffix) > Number N (-Suffix) | Holds suffixes
\ru belt wear > belt bind                   | Does root substitution
											| Keeps category & affixes
| To change category or delete suffixes do it explicitly:
\ru wear > N=bind
\ru wear (-Suffix) > bind

Principles:
	affix means only itself
	Cat=root means only root
	add environment
	-Cat=root is compound root ref (now root1-root2)
	category means whole word of category
	root means whole word containing root
	Cat= means root of category Cat
	roots like Adv=usually  black -N=bird  Adj=black- bird
		Adj=black- N   N -Adj=black -N=bird
		Adj- bird > Adj- flitter
		bird > flitter / Adj- _
		black-bird > black-flitter (Will want category).
		Adj-bird > Adj-flitter
	  Possibly require both of compound root to match for hit
	bird > flitter / N{ Adj- _ }
	Pron > Poss / NP{ N _ } (Rule is no good, but notation is good.)
	V NP{ x } > NP V  (only top level of match can be moved)

*-----------------------------------------------------------*/
