/* TONE.H - Tone Parser/Synthesizer, global defines and struct definitions
 *
 *	Andy Black
 *	08-Oct-93
 *
 ***************************************************************************
 *
 *	struct tbu
 *	struct tbu_list
 *	struct tone
 *	struct tone_list
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	08-Oct-93	hab - initial coding for Kinande
 *	10-Jan-94	hab - modifications for Pe¤oles Mixtec
 *      03-Jan-95 0.1.28 hab- Allow H Spread to be either optional, obligatory,
 *                            or never applying.
 *      04-Jan-95 0.1.29 hab- Redo tracing to show non-linked tones
 ***************************************************************************
 * Copyright 1993, 1994, 1995 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */

					/* tbu location encoding/decoding */
					/* parameter: maximum number of */
					/* tbu's allowed per morpheme */
#define MAX_LOC 4

/****************************************************************************
 * NAME
 *    struct tbu
 * DESCRIPTION
 *    doubly linked list of tone bearing units
 */
struct tbu
	{
	  struct tone_list    *tbu_tonel;	/* list of tones */
	  struct tbu          *tbu_left;	/* tbu to the left */
	  struct tbu          *tbu_right;	/* tbu to the right */
	  union
	{
	  struct syllable  *tbu_syl;
	  struct mora      *tbu_mora;
	  struct root_node *tbu_vwl;
	} tbu_ptr;			/* pointer to the tone bearing unit */
	  int                  tbu_type;	/* type of tone bearing unit */
					/*   (mora, syllable, vowel) */
					/* [Is vowel really needed?] */
	};

/****************************************************************************
 * NAME
 *    struct tbu_list
 * DESCRIPTION
 *    structure for storing a linked list of tbu structures
 */
struct tbu_list
	{
	  struct tbu      *tbul_tbu;	/* pointer to tbu structure */
	  struct tbu_list *tbul_next;	/* next element of list */
	};

/****************************************************************************
 * NAME
 *    struct tone
 * DESCRIPTION
 *    tone structure
 */
struct tone
	{
	  struct tbu_list  *tone_tbul;	/* list of tbu's this tone is */
					/* associated to */
	  struct tone_list
			   *tone_tonel[TIERS];	/* tone list element this tone */
					/* belongs to (not actually used) */
	  int       tone_value[TIERS];	/* tone values (primary and register).
							  (H, L, M, etc.)
					   Some systems only use primary. */
	  char      tone_ul_loc[MAX_LOC];   /* underlying location of tone (tbu */
					/*    number from left); using a */
					/*    bitmap of MAX_LOC*8 locations */
	  int       tone_domain;            /* domain of tone (morpheme, Infl, */
					/* Stem, MacroStem, Word) */
	  int       tone_ul_type[TIERS];	/* underlying type of tone */
					/* (boundary, floating, linked) */
	  int       tone_status[TIERS];	/* current status of tone (floating, */
					/* linked) */
				/* NOTE: is there really a need to */
				/* distinguish underlying versus */
				/* "current" status or type?  Is */
				/* there any need to distinguish */
				/* between "floating" and */
				/* "delinked"? */
	  struct tone *tone_left;		/* tone struct to left */
	  struct tone *tone_right;		/* tone struct to right */
   };

/****************************************************************************
 * NAME
 *    struct tone_list
 * DESCRIPTION
 *    structure for storing linked list of tone structures
 *     (The tone tier is such a list;  each tone bearing unit points to a
 *      list of tones as well since a tbu may have more than one tone
 *      associated/linked to it.  If we modeled the tone tier in the tone
 *      structure itself, would not be able to distinguish which multiple
 *      tones were linked to a particular tbu.  A tone_list structure
 *      solves this problem (while making it a bit more complicated to
 *      find out what a tone's neighboring tones are).
 */
struct tone_list
	{
	  struct tone      *tonl_tone;	/* pointer to tone structure */
	  struct tone_list *tonl_left;	/* tone to left  in the tone list */
	  struct tone_list *tonl_right;	/* tone to right in the tone list */
	};

/****************************************************************************
 * NAME
 *    struct tone_domain_list
 * DESCRIPTION
 *    structure for storing a linked list of tone domains
 */
struct tone_domain_list
	{
	  struct tone_domain_list *td_next; 	/* next element in the list */
	  char                    *td_str;  	/* domain string */
	  int                      td_domain;	/* domain value */
	};

/****************************************************************************
 * NAME
 *    struct tone_seg_list
 * DESCRIPTION
 *    structure for storing a linked list of tone character mappings
 *    These provide a list of the graphemic representation of a segment
 *    for specified tone values.
 *
 *    E.g.  the segment "a" plus a high tone might be represented as "a'",
 *          the segment "a" plus a low  tone might be represented as "a`",
 *          the segment "a" plus a high register, low primary tone might be
 *			 represented as "a`", etc.
 */
struct tone_seg_list
	{
	  struct tone_seg_list *ts_next;	/* next element in the list */
	  struct tval_list     *ts_tval;	/* tone values  */
	  char                 *ts_str; 	/* graphemic representation */
	};

/****************************************************************************
 * NAME
 *    struct tone_type_list
 * DESCRIPTION
 *    structure for storing a linked list of tone types (i.e. status)
 */
struct tone_type_list
	{
	  struct tone_type_list *tt_next;	/* next element in the list */
	  char                  *tt_str;	/* type/status string */
	  int                    tt_type; 	/* type/status value */
	  int                    tt_show;   /* type/status is shown in derivations
						   or othrographic form or neither */
	};

/****************************************************************************
 * NAME
 *    struct tone_value_list
 * DESCRIPTION
 *    structure for storing a linked list of tone values
 *    Used to define what the valid tone values are in the system.
 */
struct tone_value_list
	{
	  struct tone_value_list *tv_next;	/* next element in the list */
	  char                   *tv_str;	/* value string */
	  int                     tv_value;	/* value value */
	  int                     tv_tier;  /* value tier (primary/register) */
	};

/****************************************************************************
 * NAME
 *    struct tval_list
 * DESCRIPTION
 *    structure for storing a linked list of tone value pairs
 *    Used to associate a set of tones (with their values) to a particular
 *    representation of a segment.  For example, a high-toned "a" would
 *    have one element in this list; a h-register, low, high-toned "a"
 *    would have two: one for the h-register low tone and one for the high
 *    tone.
 */
struct tval_list
	{
	  struct tval_list *tvl_next; 		/* next element in the list */
	  int               tvl_value[TIERS];	/* tone value pair */
	  int               tvl_status[TIERS];	/* tone status pair */
	};

/****************************************************************************
 * Special Defines
 *
 */

					/* tbu types */
#define VOWEL_TBU    1
#define MORA_TBU     2
#define SYLLABLE_TBU 3
					/* tone_list linking flags */
#define HEAD  TRUE
#define TAIL  FALSE
					/* tone spreading modes */
/* #define FEATURE_FILLING  1 */
/* #define FEATURE_CHANGING 2 */
					/* tone spreading iteration types */
#define ITERATIVE     1
#define NON_ITERATIVE 2
					/* OCP flags */
/* #define OCP_IGNORED              1 */
/* #define OCP_RESPECTED            2 */
/* #define OCP_OPTIONALLY_RESPECTED 3 */
				/* word building flags */
						/* tone show types */
#define SHOW_DERIVATION  1
#define SHOW_ORTHOGRAPHY 2
				/* used for Kinande  */
#define GET_ULTIMA       4

#define MAX_FILE_NAME_SIZE 100

#ifdef MIXTEC
#define MAX_TO_FIND 2
				/* H Spread parameters */
#define OBLIGATORY 1
#define OPTIONAL   2
#define NEVER      3
#endif	/* MIXTEC */
