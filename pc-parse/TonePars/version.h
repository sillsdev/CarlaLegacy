/* VERSION.H - version number and date information for TonePars
 ***************************************************************************
 * Copyright 1996, 2000 by SIL International.  All rights reserved.
 */
#define VERSION    1	  	/* major rewrite or expansion */
#define REVISION   0		/* enhancement requiring adding to book */
#define PATCHLEVEL 7		/* bug fix or other internal improvement */
#define DATE       "December 4, 2001"	/* date of release version */
#define YEAR       "2001"	/* used for release date and copyright */

/*****************************************************************************
 * EDIT HISTORY
 * 04-Dec-2001  hab - Feature changing mode should only remove previously
 * [1.0.7]             linked tones; floating ones remain.
 *                    Add patch to patch 1.0.6 first change when have both
 *                     primary and register tier - now it doesn't go into
 *                     an infinite loop or crash.  Note that still need to
 *                     figure out what is causing the problem here...
 * 28-Nov-2001  hab - When linking a left-floating tone leftward or linking a
 * [1.0.6]             right-floating tone rightward, need to ensure that the
 *                     the morpheme owning the linked-to tbu is listed as
 *                     owning the tone (rather than always using the original
 *                      morpheme which had the floating tone).
 *                    Only show the "Assign_lexical_tone_to_tbus: : tbu N not
 *                      found for morpheme X" message in trace mode.
 * 26-Nov-2001  hab - Add FOR_SOME and FOR_ALL factors to user test grammar.
 * [1.0.5]
 * 21-Nov-2001  hab - use properties from ANA file, not from dictionary in
 * [1.0.4]             tone rule conditions
 * 27-Dec-2000  hab - fixed so will read \dsc field
 * [1.0.3]            Created DJGPP version
 * 19-Dec-2000  hab - fix bug in delete plural processing
 * [1.0.2]
 * 01-Nov-2000  hab - add more tracing options to command line
 * [1.0.1]
 * 28-Sep-2000  hab - make work with current Stamp library
 * [1.0.0]
 *      15-Sep-2000 0.6.1  hab - fix a typo in unified dictionary warning msg
 *                               Under 0.4.4 change on line 3205 of toneanal.c
 *      07-Apr-2000 0.6.0  hab - allow unified dictionaries
 *      17-Feb-2000 0.5.5  hab - Fix bug of adding edge conditions when
 *                               should have logially ORd them.
 *      09-Feb-2000 0.5.4  hab - Correct usage() to show all possibilities.
 *                               make -? show usage.
 *      22-Jun-1999 0.5.3  hab - Fix bug where DELETE did not reset an
 *                                allomorph's tone_end properly.
 *      19-May-1999 0.5.2  hab - Pass categories on from input ANA to output
 *                                and fix bug of not removing properties of
 *                                failed analyses.
 *      18-May-1999 0.5.1  hab - Pass properties on from input ANA to output
 *      08-Jan-1999 0.4.15 hab - Allow \w field to be capitalized
 *                  0.5.0  hab - Allow right/left edge of word in association
 *                               and insertion operations
 *      31-Aug-1998 0.4.14 hab - Increased MAX_ANALYSES to 4096
 *      15-Jun-98 0.4.13hab - "pos morpheme tone is Tone" did not count tones
 *                              correctly
 *                            fixed bug in non-cyclic delete processing in
 *                              apply_rule
 *      28-May-98 0.4.12hab - Partially fixed bug in Insert and Associate in
 *                            apply_rule() for the case of a morpheme without
 *                            a tbu.  It does not account for a sequence of
 *                            tbu-less morphemes and it also assumes a cyclic
 *                            left-to-right sweep.
 *      03-Apr-98 0.4.11hab - Added ability for a cyclic rule to access
 *                            a tone to the right or a tone to the left via
 *                            either a tone_is or a tone_pattern_is condition;
 *                            current still does not work (coz do not know
 *                            which tone it would be if current has more than
 *                            one tone)
 *      02-Apr-98 0.4.10hab - Fixed two bugs in delete_tone and
 *                            do_existing_tone_action;
 *                            also compiled for MSC v. 5.0
 *      01-Apr-98 0.4.9 hab - Increased MAX_ANALYSES to 2048
 *      08-Jan-97 0.4.8 hab - removed code to remove analyses in Word i when
 *                             their edge conditions fail in Word i+1
 *      11-Dec-97 0.4.7 hab - also show original word when tracing tone rules
 *      30-Apr-97 0.4.6 hab - compile under DJGPP v. 2.0.1; change name from
 *                             patchlvl.h
 *      13-Oct-95 0.4.5 hab - undo changes done for 0.4.2 as are not really
 *                             needed; should add reg exp capability to
 *                             patterns
 *      10-Oct-95 0.4.4 hab - keep track of precisely which tones belong to
 *                             each morpheme
 *      10-Oct-95 0.4.3 hab - allow user to refer to two morpheme to left (or
 *                             two morphemes to right) of current morpheme
 *                             via the tokens "lefttwo" (or "righttwo")
 *      10-Oct-95 0.4.2 hab - allow user to intersperse edge conditions with
 *                             other tone rules (so can let John Daly make
 *      		       access to L tones while still maintaining
 *			       some underspecification)
 *	02-Mar-95	hab - initial edit [0.0.0] (based on that of KTEXT)
 */
