/* VERSION.H - version number and date information for ToneGen
 ***************************************************************************
 * Copyright 1996, 2000 by SIL International.  All rights reserved.
 */
#define VERSION    1	  	/* major rewrite or expansion */
#define REVISION   0		/* enhancement requiring adding to book */
#define PATCHLEVEL -6		/* bug fix or other internal improvement */
#define DATE       "November 28, 2001"	/* date of release version */
#define YEAR       "2001"	/* used for release date and copyright */

/*****************************************************************************
 * EDIT HISTORY
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
