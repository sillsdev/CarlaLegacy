/* VERSION.H - version number and date information for ToneGen
 ***************************************************************************
 * Copyright 1996-2003 by SIL International.  All rights reserved.
 */
#define VERSION    1	  	/* major rewrite or expansion */
#define REVISION   0		/* enhancement requiring adding to book */
#define PATCHLEVEL -19		/* bug fix or other internal improvement */
#define DATE       "December 3, 2004"	/* date of release version */
#define YEAR       "2004"	/* used for release date and copyright */

/*****************************************************************************
 * EDIT HISTORY
 * 03-Dec-2004  hab  - Recompile for interfixes
 * [1.0.19]
 * 15-Mar-2004  hab  - Fix a bug where a valid analysis was removed during the
 * [1.0.18]             the process which removes an analysis in a word when its
 *                      edge-conditions failed to produce a successful analysis
 *                      in the following word
 * 07-Jan-2004  hab  - Incorporate changes made to STAMP to allow for negative
 * [1.0.17]             string environment constraints.
 * 04-Nov-2003  hab  - Fix a bug where associate and insert rule actions would
 * [1.0.16]             leave a phantom tone if applied in feature-filling mode
 *                      and a tone was already present.
 * 18-Jul-2003  hab  - Changes 1.0.6, 1.0.7, and 1.0.9 modified the lexical tone
 * [1.0.15]             info in the lexical entries.  Need to restore the
 *                      lexical tone info in build_tone_tier.
 * 20-May-2003  hab  - When matching category and morphname of a root from the
 * [1.0.14]             ANA file (tsdict.c), did not necessarily set the
 *                      category of the returned dictionary entry to the
 *                      category in the ANA file.  This gave some odd results
 *                      for tools like TonePars which are an ANA filter and
 *                      also use the dictionary entry (Note: STAMP does not
 *                      have this characteristic and therefore this problem
 *                      never showed for STAMP).
 * 15-May-2003  hab - fix bug which failed to remove an analysis in a word
 * [1.0.13]            when its edge-conditions failed to produce a successful
 *                     analysis in the following word.
 * 22-Apr-2003  hab - fix bug in delinking in feature-changing mode.
 * [1.0.12]
 * 25-Oct-2002	SRMc - fix portability to Linux and OpenBSD using gcc and make
 * [1.0b12]
 * 17-Oct-2002  hab - reflect Steve's recent fixes to opaclib
 * [1.0.11]
 * 15-Aug-2002  hab - Not showing synthesized forms in tone part of trace.
 * [1.0.10]           Would only output one correct form.
 * 10-Dec-2001  hab - 'tonestatus' 'tone' 'is' TONE clause in rules needs to
 * [1.0.9]              use first morpheme to left/right that has a tbu.
 *                    position in rule action needs to refer to first morpheme
 *                     to left/right that has a tbu.
 *                    Finish fix to linking left/right floating tones so that
 *                      the source morpheme no longer acts as if the tone
 *                      still belongs to it after it has been linked to the
 *                      morpheme to the left/right.
 * 04-Dec-2001  hab - Feature changing mode should only remove previously
 * [1.0.8]             linked tones; floating ones remain.
 *                    Add patch to patch 1.0.6 first change when have both
 *                     primary and register tier - now it doesn't go into
 *                     an infinite loop or crash.  Note that still need to
 *                     figure out what is causing the problem here...
 * 30-Nov-2001  hab - Fix bug: was using properties of first allomorph in the
 * [1.0.7]             dictionary record rather than the properties of the
 *                     selected allomorph.
 * 28-Nov-2001  hab - When linking a left-floating tone leftward or linking a
 * [1.0.6]             right-floating tone rightward, need to ensure that the
 *                     the morpheme owning the linked-to tbu is listed as
 *                     owning the tone (rather than always using the original
 *                      morpheme which had the floating tone).
 *                    Only show the "Assign_lexical_tone_to_tbus: : tbu N not
 *                      found for morpheme X" message in trace mode.
 * 26-Nov-2001  hab - Add FOR_SOME and FOR_ALL factors to user test grammar.
 * [1.0.5]
 * 20-Nov-2001  hab - Recompiled with new changes to STAMP
 * [1.0.4]
 * 27-Dec-2000  hab - Created DJGPP version
 * [1.0.3]
 * 19-Dec-2000  hab - fix bug in delete plural processing
 * [1.0.2]
 * 01-Nov-2000  hab - add more tracing options to command line; call it a beta
 * [1.0.1Beta]
 * 28-Sep-2000  hab - make work with current Stamp library
 * [0.1.0]
 * 01-May-97	hab - initial edit
 * [0.0.0]
 */
