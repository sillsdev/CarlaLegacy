/* TONEPARS.H - Tone parser, global defines and struct definitions
 *
 *	Andy Black
 *	12-Oct-93
 *
 ***************************************************************************
 *
 *      struct dep_list
 *      struct feature
 *      struct foot
 *      struct mora
 *      struct morpheme
 *      struct morpheme_list
 *      struct node
 *      struct root_node
 *      struct root_node_list
 *      struct segment
 *      struct segment_list
 *      struct syllable
 *      struct word
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	12-Oct-93	hab - initial coding
 *      04-Jan-95 0.1.29 hab- Redo tracing to show non-linked tones
 ***************************************************************************
 * Copyright 1992, 1993 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */

#ifndef _TONEPARS_H
#define _TONEPARS_H

#ifdef ORIG			/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */

#ifdef THINK_C
#define isascii(x) (!(x & 0200))
#define USE_STDARG	/* include <stdarg.h> instead of <varargs.h> */
#define USE_SIGNAL
#define NOGETOPT
#endif

#ifdef __GNUC__
#define USE_STDARG	/* include <stdarg.h> instead of <varargs.h> */
#endif

#ifdef DJGPP
#define NEED_8BIT_STRCHR
#endif

#ifdef _MSC_VER
#include <stdlib.h>		/* include <stdlib.h> for Microsoft C */
#endif

#ifdef USG		/* AT&T Unix (System III, System V) */
#define USE_SIGNAL
#define VOIDP char *
#endif

#ifdef BSD		/* Berkeley Unix (4.2BSD, 4.3BSD, SunOS) */
#define USE_SIGNAL
#ifndef ULTRIX
#define NOGETOPT
#define strchr  index
#define strrchr rindex
#define NOMEMSET
#endif
#ifndef __GNUC__
#define VOIDP char *
#endif
#endif

#ifdef USE_STDARG
#include <stdarg.h>
#else
#include <varargs.h> lakfj ldsk
#endif

#ifndef VOIDP		/* the generic pointer is indeed "void *" */
#define VOIDP void *
#endif

#ifdef BSD
#include <strings.h>
#define strchr index
#define strrchr rindex
#endif	/* it was an #else; but on Ling seems to need both */
#include <string.h>
/* #endif */

#define NO_STRUCTALLOC
/******************************
#ifdef THINK_C
#include ":opaclib:envir.h"
#include ":opaclib:strlist.h"
#include ":opaclib:class.h"
#else
#include "opaclib/envir.h"
#include "opaclib/strlist.h"
#include "opaclib/class.h"
#endif
******************************/

#endif /* ORIG */    /* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */
/*
 *  allocate memory for a specified struct
 */
#define structalloc(x) (struct x *) allocMemory( sizeof(struct x) )


#define MAX_FILE_NAME_SIZE 100
				/* maximum number of moras per syllable */
#define MAX_MORAS 3

					/* tone tiers */
#define TIERS    2				/* two types of tiers */
#define PRIMARY  0				/* 1st is primary */
#define REGISTER 1				/* 2nd is register */
#define BOTH_TIERS 3		/* both tiers are used */
#define BOTH_AUGMENT 1000

/****************************************************************************
 * NAME
 *    struct segment
 * DESCRIPTION
 *    structure for storing a segment
 */
struct segment
	{
	char *seg_str;		/* pointer to segment string */
	char *seg_undr;		/* underlying segment shape */
	struct tone_seg_list *seg_tone; /* how to represent this segment with
					   various tones */
	int   seg_len;		/* length of the segment */
	int   seg_mora;		/* number of moras born by this segment */
	int   seg_son;		/* sonorancy   feature (+ or -) */
	int   seg_cons;		/* consonantal feature (+ or -) */
	int   seg_cont;		/* continuancy feature (+ or -) */
	int   seg_appx;		/* syllable appendix flag (TRUE or FALSE) */
				/* other features could go here */
	};

/****************************************************************************
 * NAME
 *    struct segment_list
 * DESCRIPTION
 *    structure for storing linked list of segment structures
 */
struct segment_list
	{
	struct segment      *segl_seg;	/* pointer to segment structure */
	struct segment_list *segl_next;	/* next element of list */
	};

/****************************************************************************
 * NAME
 *    struct root_node
 * DESCRIPTION
 *    structure for storing a root node (doubly linked list)
 */
struct root_node
	{
	struct segment   *rn_seg;	/* pointer to segment corresponding to
				   this root node  */
	struct mora      *rn_mora[MAX_MORAS];/* pointer to mora(s) born by this
						segment */
				 /* there could be MAX_MORAS assigned to a */
				 /* given root node */
	struct syllable  *rn_syl;	/* pointer to syllable to which this
				   segment belongs */
	struct tbu       *rn_tbu;	/* pointer to tbu (if any) associated with
				   this segment */
	struct root_node *rn_left;	/* root_node to the left */
	struct root_node *rn_right;	/* root_node to the right */
	};

/****************************************************************************
 * NAME
 *    struct root_node_list
 * DESCRIPTION
 *    structure for storing a linked list of root_nodes
 *	(used for moras and syllables to assign more than one
 *	 root node to them)
 */
struct root_node_list
	{
	struct root_node      *rnl_rn;	/* pointer to root_node in list */
	struct root_node_list *rnl_next;	/* pointer to next root_node_list */
					/* in list */
	};

/****************************************************************************
 * NAME
 *    struct mora
 * DESCRIPTION
 *    structure for storing a mora
 */
struct mora
	{
	struct root_node_list *mora_rnl;	/* pointer to initial root node
					   in mora */
	struct syllable       *mora_syl;	/* pointer to syllable containing
					   the mora */
	struct tbu            *mora_tbu;	/* pointer to tbu (if any) associated
					   with this segment */
	};

/****************************************************************************
 * NAME
 *    struct syllable
 * DESCRIPTION
 *    structure for storing a syllable (doubly linked list)
 */
 struct syllable
	{
	struct root_node_list *syl_rnl;	/* pointer to initial root node
					   in the syllable */
	struct mora           *syl_mora[MAX_MORAS];	/* pointer to moras
					   in the syllable */
	struct foot           *syl_ft;	/* pointer to foot to which the */
					/* syllable is associated */
	struct tbu            *syl_tbu;	/* pointer to tbu (if any) associated
					   with this syllable */
	struct syllable       *syl_left;	/* syllable to left */
	struct syllable       *syl_right;	/* syllable to right */
	int                    syl_wt;	/* weight of syllable */
	int			   syl_pr;	/* prominence projection */
	};

/****************************************************************************
 * NAME
 *    struct foot
 * DESCRIPTION
 *    structure for storing a foot, doubly linked list
 *	(assumes max of two syllables per foot)
 */
struct foot
	{
	struct syllable *ft_syl_left;	/* pointer to left  syllable of foot */
	struct syllable *ft_syl_right;	/* pointer to right syllable of foot */
	struct foot     *ft_left;		/* foot to left */
	struct foot     *ft_right;		/* foot to right */
	};

/****************************************************************************
 * NAME
 *    struct site_list
 * DESCRIPTION
 *    structure for storing a linked list of (syllable) repair sites
 */
struct site_list
	{
	struct syllable  *si_syl;	/* pointer to syllable in list */
	struct site_list *si_next;	/* pointer to next site_list */
					/* in list */
	};

/****************************************************************************
 * NAME
 *    struct pword
 * DESCRIPTION
 *    structure for storing a word structure
 */
struct pword
	{
	struct root_node *wd_rn;		/* initial root node in word */
	struct syllable  *wd_syl;		/* initial syllable in word */
	struct foot      *wd_ft;		/* initial foot in word */
	struct foot      *wd_stress_ft;	/* foot     bearing word stress */
	struct syllable  *wd_stress_syl;	/* syllable bearing word stress */
	struct tbu       *wd_tbu;		/* tone bearing units */
	struct tone      *wd_tones;		/* tone nodes */
	struct tone_list *wd_tier[TIERS];	/* tone tiers */
	};

/****************************************************************************
 * Special Defines
 *
 */
		/* select segment or underlying segment */
		/* The argument's type is (struct segment *) */
#define SEG_OR_UNDR(x) (x->seg_undr != (char *)NULL ? x->seg_undr : x->seg_str)

					/* foot headedness */
#define LEFT  0
#define RIGHT 1
					/* light syllable has a weight of 1 */
#define LIGHT 1
					/* heavy syllable has a weight of 2 */
#define HEAVY 2

				/* main prominence */
#define MAIN_LIGHT  1
#define MAIN_NORMAL 2
#define MAIN_HEAVY  3
				/* feature values */
#define PLUS  0
#define MINUS 1

				/* maximum number of syllables per word */
#define MAX_SYL   50
				/* syllabification algorithms */

#define SA_DEFAULT     1
#define SONORITY       1
#define TEMPLATE       4
				/* syllabification flags */
#define SF_DEFAULT         1
#define DO_CODAS           1
#define DO_WT_BY_POS       2
#define DO_VC_CV           4
#define DO_SYL_ADJUNCTION  8
#define MONO_MORAIC       16
				/* prominence markings */
#define UNSTRESSED        0
#define STRESSED          1
#define WORD_STRESS       2
#define PROM_SYMBOL       "+"
#define NON_PROM_SYMBOL   "."

				/* tracing options */
#define TRACE_ALL             8191
#define TRACE_SEGMENTS           1
#define TRACE_MORA               2
#define TRACE_SYLLABLE           4
#define TRACE_FOOT               8
#define TRACE_PROM              16
#define TRACE_WORD              32
#define TRACE_OUTPUT            64
#define TRACE_TBU              128
#define TRACE_LINK_ANAL        256
#define TRACE_TONE_TIER        512
#define TRACE_DOMAINS         1024
#define TRACE_TONE_OLD        2048
#define TRACE_MORPHEME_TONES  4096

#endif /* _TONEPARS */
