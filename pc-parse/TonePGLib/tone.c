/* TONE.C - Tone Structure Routines
 *
 *	Andy Black
 *	15-Oct-93
 *
 ***************************************************************************
 *
 *      void print_banner()
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	15-Oct-93	hab - initial coding
 *      19-Sep-94 0.1.13 hab- MIXTEC: leftward_H_association also needs to
 *                            apply for H L pattern.  (modified
 *                            last_two_tones_are to explicitly give tone
 *                            patterns)
 *      21-Sep-94 0.1.15 hab- MIXTEC: fixed several bugs in
 *                            last_two_tones_are function
 *      04-Jan-95 0.1.29 hab- Redo tracing to show non-linked tones
 ***************************************************************************
 * Copyright 1993 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include "stamp.h"
#include "tonepars.h"
#include "trule.h"

/********************* STANDARD LIBRARY FUNCTIONS *********************/

				/* cpystr.c */
extern char *cpystr P((char *out, char *in));

			/* segparse.c */
extern struct segment *find_seg P((char *cp, struct segment_list *slp));

			/* tbu.c */
extern struct tbu_list *add_tbu_list  P((struct tbu_list *tbl_headp,int head));
extern struct tbu_list *copy_tbu_list P((struct tbu_list *tb_headp));
extern struct tbu_list *end_of_tbu_list P((struct tbu_list *tbhp));
extern struct tbu      *end_of_tbus   P((struct tbu *tbhp));
extern void             free_tbu_list P((struct tbu_list *tblp));
#ifndef B4_0_4_4
extern StampAnalysis *get_morph_from_tbu P((StampAnalysis *ap,
						  struct tbu      *tbu));
#endif /* B4_0_4_4 */
extern void             show_tbu      P((struct tbu *tbup,
					 StampData *pStamp_in));


/******************************* LOCAL PROTOTYPES ********************/
	   struct tone          *add_tone      P(());
	   struct tone_list     *add_tone_list P((struct tone_list *tl_headp,
						  int head, struct tone *tp));
	   struct tone          *add_tone_node P((struct tone *tn_headp,
						  int          head,
						  struct tone *tp));
	   struct tone_seg_list *add_tone_seg_rep P((char *lp,
						 struct tone_seg_list *stp,
						 char *errhead,
						 FILE *pOutputFP_in));
static struct tone_seg_list *add_tone_seg_list
										   P((struct tone_seg_list *ts_head));
	   struct tval_list     *add_tval_list P((struct tval_list *tv_head));
#ifndef B4_0_4_4
static void            adjust_morpheme_tone_pointers P((StampAnalysis *ap,
							struct tone     *tp,
							struct tbu      *tbu,
							FILE *pOutputFP_in));
#endif /* B4_0_4_4 */

	   void                  build_primary_register_tone_combos P((FILE *pOutputFP_in));
	   char                 *build_word_with_tone_marked
											  P((struct root_node *rnp,
						 int               tbu_type,
						 int               build_flags,
						 int               do_trace,
						 FILE *pOutputFP_in));
	   struct tone          *copy_tone     P((struct tone *otp));
	   struct tone_list     *copy_tone_list P((struct tone_list *tl_headp));
	   struct tval_list     *copy_tval_list P((struct tval_list *tv_headp));
	   void                  delete_tone P((struct tone  *tp,
						struct pword *pwp));
	   void                  delink_tone_from_tbu P((struct tone *tp,
							 int tier,
							 struct tbu *tbu));
	   void                 draw_tone_diagram P((struct pword *pwp,
						 FILE *pOutputFP_in));
	   struct tone_list     *end_of_tone_list P((struct tone_list *tlhp));
	   struct tone          *end_of_tone_nodes P((struct tone *tn_headp));
	   struct tval_list     *end_of_tval_list P((struct tval_list *tvhp));
	   int                   every_tbu_has  P((StampAnalysis  *ap,
						   int         tier,
						   char       *status,
						   char       *value));
	   char                 *edge_cond_name   P((long ec));
	   long                  find_edge_cond   P((char *cp));
	   int                   find_tone_domain P((char *cp));
static char                 *find_tone_seg_rep
										P((struct tone_seg_list *tslp,
					   struct tbu           *tbp,
					   int                   build_flags));
	   int                   find_tone_type   P((char *cp));
	   int                   find_tone_value  P((char *cp, int *tier));
	   struct tone_value_list *find_tone_value_list P((char *cp));
	   void                  free_tone     P((struct tone *tp));
	   void                  free_tone_list P((struct tone_list *tlp));
	   void                  free_tones     P((struct tone *tp));
	   void                  free_tones_in_anal P((StampAnalysis *ap));
	   void                  free_tval_list P((struct tval_list *tvlp));
	   struct tone          *get_edge_tone P((StampAnalysis *ap,
						  int              tier,
						  int              edge));
	   int                   get_max_edge_conds    P((void));
	   int                   get_next_loc    P((char *bitmap, int loc));
#ifndef B4_0_4_4
	   struct tone          *get_morphs_nearest_tone P((StampAnalysis *ap,
							int             edge));
#endif
	   struct tone          *get_previous_tone P((struct tbu *tbp,
						  int         edge));
static char                 *get_seg_tone     P((struct segment *sp,
						 struct tbu *tbp,
						 int  build_flags));
	   int                   has_linked_high_tones P((StampAnalysis  *ap));
	   struct tone          *insert_tone P((struct tone *tn_headp,
						struct tone *tp,
						struct tone *tp_left));
	   struct tone_list     *insert_tone_list P((struct tone_list *tl_headp,
						 int tier,
						 struct tone      *tp));
	   int                   is_in_tbu_list   P((struct tbu *tbp,
						 struct tbu_list *tbhp));
	   int                   is_in_tone_list  P((struct tone *tp,
						 struct tone_list *tlhp));
	   int                   last_two_tones_are P((struct tbu *tbp,
						   int         tier,
						   char       *status1,
						   char       *value1,
						   char       *status2,
						   char       *value2));
	   int                   link_tone_to_tbu P((struct tone     *tp,
						 int              tier,
						 int              params,
						 struct tbu      *tbu,
						 int              tbu_head,
						 StampAnalysis *ap,
						 int              status,
						 FILE *pOutputFP_in));
#ifndef B4_0_4_4
	   int                   morph_has_tone_id P((StampAnalysis *ap,
						  struct tone_id  *tip));
#endif /* B4_0_4_4 */
	   struct tone          *remove_tone_node P((struct tone *tn_headp,
						 struct tone *tp));
	   void                  set_edge_cond     P((char *lp,
						  FILE *pOutputFP_in));
static char                 *set_loc_num      P((char *bitmap, int loc));
	   void                  set_tone         P((char *lp,
						 struct tone_list **tone_listp,
						 int count));
	   void                  parseTone P((char *             pszLine_in,
						  struct tone_list **tone_listp,
					  unsigned	     uiDictEntry_in,
					  const char *	     pszRecordKey_in,
					  const char *	     pszErrorHeader_in,
					  FILE *	     pLogFP_in));
	   void                  set_tone_domain  P((char *lp,
						 FILE *pOutputFP_in));
	   void                  set_tone_type    P((char *lp,
						 FILE *pOutputFP_in));
	   void                  set_tone_value   P((char *lp,
						 int tier,
						 int value,
						 FILE *pOutputFP_in));
	   void                  show_edge_cond   P((long ec,
						 FILE *pOutputFP_in));
	   void                  show_all_edge_conds  P((FILE *pOutputFP_in));
	   void                  show_tone        P((FILE *           pOutputFP_in,
						 struct tone *tp));
	   void                  show_tone_seg_list P((FILE *      pOutputFP_in,
						   struct tone_seg_list *tsl));
	   void                  showTones       P((FILE *           pOutputFP_in,
						struct tone_list *tlp));
	   void                  show_tone_type_list P((FILE *pOutputFP_in));
	   void                  show_tone_value_list P((FILE *pOutputFP_in));
	   struct tbu           *spread_tone P((struct tone      *tp,
						int               tier,
						int               params,
						struct domain_id *domain,
						int               status,
						StampAnalysis  *ap,
						struct pword     *pwp,
						FILE *pOutputFP_in));
	   struct tone          *tbu_has_tone P((struct tbu *tbp,
						 int         tier,
						 char       *status,
						 char       *value));
	   char                 *tone_domain_name P((int td));
static int                   tone_has_no_rep    P((struct tone *tp,
						   int          build_flags));
	   int                   tone_id    P((struct tone *tp,
					   int tier,
					   char *type,
					   char *value));
	   int                   tone_matches P((struct tone *tp,
						 struct tone_id *tip));
	   char                 *tone_type_name P((int td));
	   char                 *tone_value_name P((int td));
	   void                  trace_tone_tier P((StampData *pStamp_in,
						struct tone_list *t_tier_headp,
						int tier));
#undef P

extern char *dicterrhead;       /* header for dictionary error messages */
				/* tone type values */
extern int Linked;
extern int Floating;
extern int LeftFloating;
extern int RightFloating;
extern int Boundary;
extern int Delinked;
extern int Melody;

static char errhead[] = "\nTONE: ";	/* header for tone error messages */

static struct edge_cond_list *Edge_Cond_List_Head =
						 (struct edge_cond_list
						  *)NULL;

static struct tone_domain_list *Tone_Domain_List_Head =
						 (struct tone_domain_list
						  *)NULL;

static struct tone_type_list *Tone_Type_List_Head =
						 (struct tone_type_list
						  *)NULL;

static struct tone_value_list *Tone_Value_List_Head =
						 (struct tone_value_list
						  *)NULL;
static int Max_Number_Of_Edge_Conds = 0;
static const char szWhitespace_m[7] = " \t\r\n\f\v";

#define MAX_EDGE_CONDS (sizeof(long) * 8)


/****************************************************************************
 * NAME
 *    add_tone
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    add and initialize a new tone struct
 * RETURN VALUE
 *    pointer to new tone struct
 */
struct tone *add_tone()
{
  struct tone *tp;
  int          i;

  tp               = structalloc( tone );
  tp->tone_tbul    = (struct tbu_list *)NULL;
  tp->tone_domain  = (int)NULL;
  for (i = 0; i < MAX_LOC; i++)
	tp->tone_ul_loc[i] = (char)NULL;
  tp->tone_left    = (struct tone *)NULL;
  tp->tone_right   = (struct tone *)NULL;
  for (i = 0; i < TIERS; i++)
	{
	  tp->tone_tonel[i]   = (struct tone_list *)NULL;
	  tp->tone_value[i]   = (int)NULL;
	  tp->tone_ul_type[i] = (int)NULL;
	  tp->tone_status[i]  = (int)NULL;
	}

  return( tp );

}	/* end add_tone */

/****************************************************************************
 * NAME
 *    add_tone_list
 * ARGUMENTS
 *    tl_headp - pointer to head of linked list of tone_list structs
 *    head     - flag as to whether to add the new tone_list to the head or
 *               to the tail of the list
 *    tp       - pointer to a tone struct
 * DESCRIPTION
 *    add a new tone_list and tone struct to the list
 * RETURN VALUE
 *    pointer to head of the list
 */
struct tone_list *add_tone_list(tl_headp, head, tp)
	 struct tone_list *tl_headp;
	 int               head;
	 struct tone      *tp;
{
  struct tone_list *tlp, *tlp2;

  tlp             = structalloc( tone_list );
  if (tp == (struct tone *)NULL)
	tp = add_tone();
  tlp->tonl_tone  = tp;
  tlp->tonl_right = (struct tone_list *)NULL;

  if (head)
	{				/* add it to head of the list */
	  if (tl_headp != (struct tone_list *)NULL)
	{
	  tlp->tonl_right      = tl_headp;
	  tl_headp->tonl_left = tlp;
	}
	  tl_headp = tlp;
	}
  else
	{				/* add it to the tail of the list */
	  tlp2 = end_of_tone_list(tl_headp);
	  if (tlp2 == (struct tone_list *)NULL)
	{
	  tl_headp = tlp;
	  tlp->tonl_left  = (struct tone_list *)NULL;
	}
	  else
	{
	  tlp->tonl_left = tlp2;
	  tlp2->tonl_right = tlp;
	}
	}

  return(tl_headp);

}	/* end add_tone_list */

/****************************************************************************
 * NAME
 *    add_tone_node
 * ARGUMENTS
 *    tn_headp - pointer to head of linked list of tone structs
 *    head     - flag as to whether to add the new tone to the head or
 *               to the tail of the list
 *    tp       - pointer to a tone struct
 * DESCRIPTION
 *    add a tone struct to the tone node list
 * RETURN VALUE
 *    pointer to head of the list
 */
struct tone *add_tone_node(tn_headp, head, tp)
	 struct tone *tn_headp;
	 int          head;
	 struct tone *tp;
{
  struct tone *tp2;

				/* just in case... */
  if (tp == (struct tone *)NULL)
	return(tn_headp);

  if (head)
	{				/* add it to head of the list */
	  if (tn_headp == (struct tone *)NULL)
	tp->tone_right = (struct tone *)NULL;
	  else
	{
	  tp->tone_right      = tn_headp;
	  tn_headp->tone_left = tp;
	}
	  tp->tone_left = (struct tone *)NULL;
	  tn_headp = tp;
	}
  else
	{				/* add it to the tail of the list */
	  tp2 = end_of_tone_nodes(tn_headp);
	  if (tp2 == (struct tone *)NULL)
	{
	  tn_headp = tp;
	  tp->tone_left  = (struct tone *)NULL;
	}
	  else
	{
	  tp->tone_left = tp2;
	  tp2->tone_right = tp;
	}
	  tp->tone_right = (struct tone *)NULL;
	}

  return(tn_headp);

}	/* end add_tone_node */

/****************************************************************************
 * NAME
 *    add_tone_seg_rep
 * ARGUMENTS
 *    lp      - line to parse
 *    stp     - pointer to segment tone pointer
 *    errhead - error message header
 * DESCRIPTION
 *    create tone_seg_list structs for representing segments with tones
 * RETURN VALUE
 *    NONE
 ************************************************************
 *
 *	Syntax of tone seg line:
 *          <tone_seg>       ::= <values> '=' <representation>
 *
 *          <values>         ::= <values> <value>
 *                               <value>
 *
 *          <value>          ::=  (user defined)
 *                               @(user defined)
 *                                (user defined)@
 *
 *          <representation> ::= string rep
 *
 */
struct tone_seg_list *add_tone_seg_rep(lp, stp, errhead, pOutputFP_in)
	 char *lp;
	 struct tone_seg_list *stp;
	 char *errhead;
	 FILE *pOutputFP_in;
{
  struct tval_list *tvlp;
  int t_value;
  int found_value;
  int is_register;
  int last_was_linked_primary;
  char *end;
  int status;
  char *cp;

  lp += strspn(lp, szWhitespace_m);	/* skip over white space */

  end = isolateWord(lp);		/* get next token */
				/* initialize */
  is_register = found_value = last_was_linked_primary = FALSE;
  tvlp = (struct tval_list *)NULL;
				/* look for <values> */
  while (lp != (char *)NULL && *lp != NUL && !streq(lp,"="))
	{
				/* determine status of tone */
	  if (*lp == '@')
	{
	  lp++;			/* skip over initial @ */
	  status = LeftFloating;
	}
	  else if (*(cp = lp + strlen(lp)-1) == '@')
	{
	  *cp = NUL;		/* remove trailing @ */
	  status = RightFloating;
	}
	  else
	status = Linked;
				/* get the value */
	  t_value = find_tone_value(lp, &is_register);
				/* if this is the first value found, */
				/* allocate a tone_seg_list element */
	  if (!found_value)
	stp = add_tone_seg_list( stp );
				/* allocate a tval_list struct unless the */
				/* last one was a linked primary and */
				/*  this one is a linked register */
	  if (!(last_was_linked_primary &&
		is_register &&
		status == Linked))
	{
	  stp->ts_tval = add_tval_list(stp->ts_tval);
	  tvlp = end_of_tval_list(stp->ts_tval);
	}
				/* set the value */
	  if (tvlp != (struct tval_list *)NULL)
	{
	  tvlp->tvl_value[is_register] = t_value;
	  tvlp->tvl_status[is_register] = status;
	  found_value = TRUE;
	}
	  last_was_linked_primary = (!is_register && (status == Linked)) ? TRUE
																	 : FALSE;
	  end = isolateWord( lp = end );	/* skip to next token */
	}
  if (!found_value)
	{
	  fprintf(pOutputFP_in,
		  "%sUndefined tone value %s in \\toneseg field", errhead, lp);
	  return(stp);
	}
			/* look for '=' token */
  if (!streq(lp,"="))
	{
	  fprintf(pOutputFP_in,
		  "%sExpected = sign in \\toneseg field; found %s", errhead, lp);
	  return(stp);
	}
  end = isolateWord( lp = end );	/* skip to next token */
				/* get <representation> */
  stp->ts_str = duplicateString(lp);

  return(stp);

}	/* end add_tone_seg_rep */

/****************************************************************************
 * NAME
 *    add_tone_seg_list
 * ARGUMENTS
 *    ts_head - head of the linked list
 * DESCRIPTION
 *    add a new tone_seg_list element to a tone_seg_list
 * RETURN VALUE
 *    pointer to the head of the tone_seg_list
 */
static struct tone_seg_list *add_tone_seg_list(ts_head)
	 struct tone_seg_list *ts_head;
{
  struct tone_seg_list *tsl;

  tsl          = structalloc( tone_seg_list );
  tsl->ts_next = (struct tone_seg_list *)NULL;
  tsl->ts_tval = (struct tval_list *)NULL;
  tsl->ts_str  = (char *)NULL;

  if (ts_head != (struct tone_seg_list *)NULL)
	tsl->ts_next = ts_head;

  return( ts_head = tsl );

}	/* end add_tone_seg_list */

/****************************************************************************
 * NAME
 *    add_tval_list
 * ARGUMENTS
 *    tv_head - head of the linked list
 * DESCRIPTION
 *    add a new tone value pair element to the tval_list struct
 * RETURN VALUE
 *    pointer to the head of the tval_list
 */
struct tval_list *add_tval_list(tv_head)
	 struct tval_list *tv_head;
{
  struct tval_list *tvl, *tvl2;
  int tier;

  tvl                      = structalloc( tval_list );
  tvl->tvl_next            = (struct tval_list *)NULL;
  for (tier = 0; tier < TIERS; tier++)
	{
	  tvl->tvl_value[tier]  = (int)NULL;
	  tvl->tvl_status[tier] = (int)NULL;
	}

  tvl2 = end_of_tval_list(tv_head);

  if (tvl2 == (struct tval_list *)NULL)
	tv_head = tvl;
  else
	tvl2->tvl_next = tvl;

  return( tv_head );

}	/* end add_tval_list */

#ifndef B4_0_4_4
/****************************************************************************
 * NAME
 *    adjust_morpheme_tone_pointers
 * ARGUMENTS
 *    ap  - pointer to current morpheme (analysis struct)
 *    tp  - pointer to tone that just got linked
 *    tbu - pointer to tbu that the tone just linked to
 * DESCRIPTION
 *    make any necessary adjustments to the morpheme tone pointers
 *    after a tone has been linked
 * RETURN VALUE
 *    NONE
 */
void adjust_morpheme_tone_pointers(ap, tp, tbu, pOutputFP_in)
	 StampAnalysis *ap;
	 struct tone     *tp;
	 struct tbu      *tbu;
	 FILE            *pOutputFP_in;
{
  struct tone *tp2;

				/* just in case ... */
  if (ap == (StampAnalysis *)NULL)
	return;

				/* find the morpheme to which the tbu belongs*/
  if ((ap = get_morph_from_tbu(ap, tbu)) == (StampAnalysis *)NULL)
	return;

			/* see if tone is in the morpheme */
  for (tp2 = ap->pToneBeg;
	   tp2 != (struct tone *)NULL &&
	   tp2->tone_left != ap->pToneEnd;
	   tp2 = tp2->tone_right)
	if (tp == tp2)
	  return;
					/* did not find it */
				/* need to add it */
  if (ap->pToneBeg == (struct tone *)NULL)
	{				/* is morph's first and only tone */
	  ap->pToneBeg = ap->pToneEnd = tp;
	  return;
	}
					/* scan for tone to left */
  for (tp2 = ap->pToneBeg->tone_left;
	   tp2 != (struct tone *)NULL;
	   tp2 = tp2->tone_left)
	if (tp == tp2)
	  {		/* found it; adjust beg pointer */
	ap->pToneBeg = tp;
	return;
	  }
			/* did not find it to the left; look right */
  if (ap->pToneEnd != (struct tone *)NULL)
	for (tp2 = ap->pToneEnd->tone_right;
	 tp2 != (struct tone *)NULL;
	 tp2 = tp2->tone_right)
	  if (tp == tp2)
	{		/* found it; adjust end pointer */
	  ap->pToneEnd = tp;
	  return;
	}
				/* should not get here */
  fprintf(pOutputFP_in,
	  "\nTONEPARS: Program error: internal tone corruption\n\t%s",
	  "discovered in adjust_morpheme_tone_pointers.");

}	/* end adjust_morpheme_tone_pointers */
#endif /* B4_0_4_4 */

/****************************************************************************
 * NAME
 *    build_primary_register_tone_combos
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    build any needed primary/register combinations for the tone value list
 * RETURN VALUE
 *    NONE
 */
void build_primary_register_tone_combos(pOutputFP_in)
	 FILE *pOutputFP_in;
{
  struct tone_value_list *tvlpp, *tvlpr;
  char buffer[100];
  char *cp;
				/* run through list, looking for primaries */
  for (tvlpp = Tone_Value_List_Head;
	   tvlpp != (struct tone_value_list *)NULL;
	   tvlpp = tvlpp->tv_next)
	{
	  if (tvlpp->tv_tier == PRIMARY)
	{			/* found one; now look for registers */
	  for (tvlpr = Tone_Value_List_Head;
		   tvlpr != (struct tone_value_list *)NULL;
		   tvlpr = tvlpr->tv_next)
		if (tvlpr->tv_tier == REGISTER)
		  {			/* found one; create the string combo */
				/* and save it in a temp list */
		cp = strcpy(&buffer[0], tvlpp->tv_str);
		cp = strcat(cp, tvlpr->tv_str);
		set_tone_value(duplicateString(cp), BOTH_TIERS,
			   (tvlpr->tv_value * BOTH_AUGMENT) + tvlpp->tv_value,
			   pOutputFP_in);
		  }
	}
	}

}	/* end build_primary_register_tone_combos */

/****************************************************************************
 * NAME
 *    build_word_with_tone_marked
 * ARGUMENTS
 *    rnp      - pointer to head of linked list of root_nodes
 *    tbu_type - type of tone bearing unit used
 *    build_flags - special flags for building word
 *    do_trace - tracing flag
 * DESCRIPTION
 *    create word string with tones marked
 *     THIS NEEDS MORE WORK!
 * RETURN VALUE
 *    pointer to the string
 */
char *build_word_with_tone_marked(rnp, tbu_type, build_flags, do_trace,
				  pOutputFP_in)
	 struct root_node *rnp;
	 int               tbu_type;
	 int               build_flags;
	 int               do_trace;
	 FILE             *pOutputFP_in;
{
  char word_buf[BUFSIZE];
  char *cp, *cp2;
  struct syllable *sp;
  struct root_node *rn_ultima;

  cp = &word_buf[0];
  *cp = NUL;

  if (rnp == (struct root_node *)NULL)
	return(cp);

  rn_ultima = (struct root_node *)NULL;

  if (build_flags & GET_ULTIMA)	/* is actually Kinande specific at present */
	{
				/* get first root_node in final syllable */
				/* find final syllable */
	  for (sp = rnp->rn_syl;
	   sp != (struct syllable *)NULL &&
	   sp->syl_right != (struct syllable *)NULL;
	   sp = sp->syl_right)
	;
				/* save location of initial root node in */
				/* ultimate syllable */
	  if (sp->syl_rnl != (struct root_node_list *)NULL)
	rn_ultima = sp->syl_rnl->rnl_rn;
	}

  for (; rnp != (struct root_node *)NULL; rnp = rnp->rn_right)
	{
	  if (rnp->rn_seg != (struct segment *)NULL)
	{
				/* assume representation is unmodified */
	  cp2 = rnp->rn_seg->seg_str;
	  switch (tbu_type)
		{
		default:
		case MORA_TBU:
		  if (rnp->rn_mora[0] != (struct mora *)NULL)
				/* there's a mora; get any modified rep */
		cp2 = get_seg_tone(rnp->rn_seg, rnp->rn_mora[0]->mora_tbu,
				   build_flags);
		  break;

		case SYLLABLE_TBU:
		  /* later */
		  break;

		case VOWEL_TBU:
		  /* later */
		  break;
		}
	  cp = strcat(cp, cp2);
	}
	}

  if ((do_trace & TRACE_TONE_TIER) && pOutputFP_in)
	fprintf(pOutputFP_in, "\n    Tone-marked word is %s", cp);

  return(duplicateString(cp));

}	/* end build_word_with_tone_marked */

/****************************************************************************
 * NAME
 *    copy_tone
 * ARGUMENTS
 *    otp      - pointer to original tone struct
 * DESCRIPTION
 *    create a copy of a tone struct
 * RETURN VALUE
 *    pointer to the new tone struct
 */
struct tone *copy_tone(otp)
	 struct tone *otp;
{
  struct tone *ntp;
  int i;
				/* create a new tone struct */
  ntp = structalloc(tone);
				/* set new tone to original tone */
  if (otp->tone_tbul != (struct tbu_list *)NULL)
	ntp->tone_tbul = copy_tbu_list(otp->tone_tbul);
  for (i = 0; i < TIERS; i++)
	{
	  if (otp->tone_tonel[i] != (struct tone_list *)NULL)
				/* warning: are we using tone_list in two */
				/* distinct ways? do we always want to */
				/* make a copy of the tone structs?  or */
				/* do we sometimes want to just point? */
				/* (like here) */
	ntp->tone_tonel[i] = copy_tone_list(otp->tone_tonel[i]);
	  ntp->tone_value[i]   = otp->tone_value[i];
	  ntp->tone_ul_type[i] = otp->tone_ul_type[i];
	  ntp->tone_status[i]  = otp->tone_status[i];
	}
  ntp->tone_domain  = otp->tone_domain;
  for (i = 0; i < MAX_LOC; i++)
	ntp->tone_ul_loc[i] = otp->tone_ul_loc[i];

  return(ntp);

}	/* end copy_tone */

/****************************************************************************
 * NAME
 *    copy_tone_list
 * ARGUMENTS
 *    tlp      - pointer to head of linked list of tone_list structs
 * DESCRIPTION
 *    create a copy of a tone_list and its associated tone structs
 * RETURN VALUE
 *    pointer to the new tone_list
 */
struct tone_list *copy_tone_list(tl_headp)
	 struct tone_list *tl_headp;
{
  struct tone_list *tlp, *new_tlp, *tnp;

  new_tlp = (struct tone_list *)NULL;
				/* run through the list */
  for (tlp = tl_headp;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	{
				/* add a new element (we'll fake the tone */
				/* for now and fix it below) */
	  new_tlp = add_tone_list(new_tlp, TAIL, tlp->tonl_tone);
				/* find end of list */
	  tnp = end_of_tone_list(new_tlp);
				/* make a copy of the tone */
	  tnp->tonl_tone = copy_tone(tlp->tonl_tone);
	}

  return(new_tlp);

}	/* end copy_tone_list */

/****************************************************************************
 * NAME
 *    copy_tval_list
 * ARGUMENTS
 *    tv_headp - pointer to head of linked list of tval_list structs
 * DESCRIPTION
 *    create a copy of a tval_list
 * RETURN VALUE
 *    pointer to the new tval_list
 */
struct tval_list *copy_tval_list(tv_headp)
	 struct tval_list *tv_headp;
{
  struct tval_list *tvp, *new_tvp;
  int tier;

  new_tvp = (struct tval_list *)NULL;
				/* run through the list */
  for (tvp = tv_headp;
	   tvp != (struct tval_list *)NULL;
	   tvp = tvp->tvl_next)
	{
				/* add a new element */
	  new_tvp = add_tval_list(new_tvp);
	  for (tier = 0; tier < TIERS; tier++)
	new_tvp->tvl_value[tier] = tvp->tvl_value[tier];
	}

  return(new_tvp);

}	/* end copy_tval_list */

/*************************************************************************
 * NAME
 *    delete_tone
 * ARGUMENTS
 *    tp         - pointer to tone struct
 *    pwp        - pointer to prosodic word struct
 * DESCRIPTION
 *    Delete a tone from its tier and the main tone list.
 * RETURN VALUE
 *    NONE
 */
void  delete_tone(tp, pwp)
	 struct tone  *tp;
	 struct pword *pwp;
{
  int tier;
  struct tone      *tp2;
  struct tone_list *tlp;
  struct tbu_list  *tblp;

  for (tier = 0; tier < TIERS; tier++)
	{
				/* delink the tone first */
#ifdef B4_0_4_10
	  for (tblp = tp->tone_tbul;
	   tblp != (struct tbu_list *)NULL;
	   tblp = tblp->tbul_next)
	delink_tone_from_tbu(tp, tier, tblp->tbul_tbu);
#else
	  for (tblp = tp->tone_tbul;
	   tblp != (struct tbu_list *)NULL;
	   tblp = tblp->tbul_next)
	{
	  delink_tone_from_tbu(tp, tier, tblp->tbul_tbu);
	  if (tp->tone_tbul == (struct tbu_list *)NULL)
		break;		/* if it was delinked and was the last one,
				 quit*/
	}
#endif
				/* remove it from the tier */
	  for (tlp = pwp->wd_tier[tier];
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	if (tlp->tonl_tone == tp)
	  {
				/* remove it from the doubly linked list */
		if (tlp->tonl_left == (struct tone_list *)NULL)
		  pwp->wd_tier[tier] = tlp->tonl_right;

		else
		  tlp->tonl_left->tonl_right = tlp->tonl_right;
		if (tlp->tonl_right != (struct tone_list *)NULL)
		  tlp->tonl_right->tonl_left = tlp->tonl_left;
		break;		/* no need to look further */
	  }
	}
				/* remove it from the list of tone nodes */
  for (tp2 = pwp->wd_tones;
	   tp2 != (struct tone *)NULL;
	   tp2 = tp2->tone_right)
	if (tp2 == tp)
	  {			/* remove it from the doubly linked list */
	if (tp->tone_left == (struct tone *)NULL)
	  pwp->wd_tones = tp->tone_right;
	else
	  tp->tone_left->tone_right = tp->tone_right;
	if (tp->tone_right != (struct tone *)NULL)
	  tp->tone_right->tone_left = tp->tone_left;
	  }
				/* free the memory used by tone struct */
  free_tone(tp);

}	/* end delete_tone */

/*************************************************************************
 * NAME
 *    delink_tone_from_tbu
 * ARGUMENTS
 *    tp         - pointer to tone struct
 *    tier       - primary/register tier
 *    tbu        - pointer to tbu struct
 * DESCRIPTION
 *    Delink a tone from a tbu if there is only the one tier.
 *    If there are both tiers, remove the indicated one.
 * RETURN VALUE
 *    NONE
 */
void  delink_tone_from_tbu(tp, tier, tbu)
	 struct tone     *tp;
	 int              tier;
	 struct tbu      *tbu;
{
  struct tbu_list  *tbp, *tb_lastp;
  struct tone_list *tlp;

  if ((tp == (struct tone *)NULL) || tbu == (struct tbu *)NULL)
	return;
				/* if the other tier contains a value, only */
				/* remove the value for this tier */
  if (tp->tone_value[(tier + 1) % 2] != (int)NULL)
	{
	  tp->tone_value[tier] = (int)NULL;
	  return;
	}
				/* look for the tbu in the tone's tbu list */
  for (tbp = tp->tone_tbul, tb_lastp = (struct tbu_list *)NULL;
	   tbp != (struct tbu_list *)NULL;
	   tb_lastp = tbp, tbp = tbp->tbul_next)
	{
	  if (tbu == tbp->tbul_tbu)
	{			/* found it */
				/* de-link it from the tbu_list */
	  if (tb_lastp != (struct tbu_list *)NULL)
		tb_lastp->tbul_next = tbp->tbul_next;
	  else
		tp->tone_tbul = tbp->tbul_next;
				/* free memory of the tbu_list struct */
	  freeMemory((char *)tbp);
	  break;
	}
	}
				/* look for the tone in the tbu's tone list */
  for (tlp = tbu->tbu_tonel;
	   tlp != (struct tone_list *)NULL;
	   tlp =tlp->tonl_right)
	{
	  if (tp == tlp->tonl_tone)
	{			/* found it */
				/* de-link it from the tone_list */
	  if (tlp->tonl_left != (struct tone_list *)NULL)
		tlp->tonl_left->tonl_right = tlp->tonl_right;
	  else
		  tbu->tbu_tonel = tlp->tonl_right;
	  if (tlp->tonl_right != (struct tone_list *)NULL)
		tlp->tonl_right->tonl_left = tlp->tonl_left;

				/* free memory of the tone_list struct */
	  freeMemory((char *)tlp);
	  break;
	}
	}
				/* status is delinked if tone not */
				/* associated with any tbus */
  if (tp->tone_tbul == (struct tbu_list *)NULL)
	tp->tone_status[tier] = Delinked;

}	/* end delink_tone_from_tbu */

/****************************************************************************
 * NAME
 *    draw_tone_diagram
 * ARGUMENTS
 *    pwp - pointer to prosodic word struct
 * DESCRIPTION
 *    draw an autosegmental-like diagram of the tones
 *      register tier   r
 *      primary  tier   P   TT  T T  TTT   TTTT
 *      linkage         |   \|  |\|  \|/   \|//
 *      tbu             o    o  o o   o     o
 *
 * RETURN VALUE
 *    NONE
 */
void draw_tone_diagram(pwp, pOutputFP_in)
	 struct pword *pwp;
	 FILE         *pOutputFP_in;
{
  char diagram[4][BUFSIZE];	/* diagram buffer area */
  char *rp;			/* pointer to register tier area */
  char *pp;			/* pointer to primary  tier area */
  char *lp;			/* pointer to linkages      area */
  char *bp;			/* pointer to tbu           area */
  char linkage[3] = "| ";
  char *mp;
  char *mask = "\n\t\t%s";
  struct tbu       *tbp;
  struct tone_list *tlp;
  struct tone      *tp, *last_tp;
  int               did_register;
  int               i;

				/* initialize */
  rp = &diagram[0][0];
  memset(rp, 0, BUFSIZE);
  *rp++ = ' ';
  pp = &diagram[1][0];
  memset(pp, 0, BUFSIZE);
  *pp++ = ' ';
  lp = &diagram[2][0];
  memset(lp, 0, BUFSIZE);
  *lp++ = ' ';
  bp = &diagram[3][0];
  memset(bp, 0, BUFSIZE);
  *bp++ = ' ';
  mp = &linkage[0];

  did_register = FALSE;

				/* run through the tbus */
  for (tbp = pwp->wd_tbu,
	   last_tp = (struct tone *)NULL;
	   tbp != (struct tbu *)NULL;
	   tbp = tbp->tbu_right)
	{
				/* add a tbu symbol */
	  bp = cpystr(bp, "o ");
				/* check for tones */
	  if ((tlp = tbp->tbu_tonel) == (struct tone_list *)NULL)
	{			/* no tones; add space */
	  rp = cpystr(rp, "  ");
	  pp = cpystr(pp, "  ");
	  lp = cpystr(lp, "  ");
	}
	  else
	{			/* are tones; count them while drawing them */
	  for (i = 0, tp = (struct tone *)NULL;
		   tlp != (struct tone_list *)NULL;
		   i++, tlp = tlp->tonl_right)
		{
		  tp = tlp->tonl_tone;
		  if (i == 0)
		{		/* is first tone */
		  if (tp == last_tp)
			{		/* first tone is same as last one; */
				/* extend any lines */
			  if (tlp->tonl_right != (struct tone_list *)NULL)
			{	/* there is another tone on this tbu */
			  if (tp->tone_status[REGISTER] == Linked ||
				  tp->tone_status[PRIMARY ] == Linked)
				lp = cpystr(--lp, "\\");
			}
			  else	/* no other tone on this tbu */
			{
			  rp = cpystr(rp, "  ");
			  pp = cpystr(pp, "  ");
			  if (tp->tone_status[REGISTER] == Linked ||
				  tp->tone_status[PRIMARY ] == Linked)
				lp = cpystr(--lp, "\\  ");
			  else
				lp = cpystr(lp, "  ");
			}
			}
		  else		/* first tone is not same as last */
			{
			  if (tlp->tonl_right != (struct tone_list *)NULL)
			{	/* there is another tone on this tbu */
			  rp--;	/* put the first tone just before the tbu */
			  pp--;
			  lp--;
			  *mp = '\\'; /* and use a backslash for linkage */
			}
				/* place the tone info */
			  if (tp->tone_value[REGISTER])
			{
			  rp = cpystr(rp,
				  tone_value_name(tp->tone_value[REGISTER]));
			  did_register = TRUE;
			}
			  else
			rp = cpystr(rp, " ");
			  if (tp->tone_value[PRIMARY])
			{
			  pp = cpystr(pp,
				  tone_value_name(tp->tone_value[PRIMARY]));
			}
			  else
			pp = cpystr(pp, " ");
			  if (tp->tone_status[REGISTER] == Linked ||
			  tp->tone_status[PRIMARY ] == Linked)
			*lp++ = *mp;
			  else
			*lp++ = ' ';
				/* see if need to add space after the tone */
			  if (tlp->tonl_right != (struct tone_list *)NULL)
			*mp = '|'; /* there is another tone to come;
					  change linkage symbol in mask */
			  else
			{	/* no other tones, just skip a space */
			  rp = cpystr(rp, " ");
			  pp = cpystr(pp, " ");
			  lp = cpystr(lp, " ");
			}
			}
		}
		  else		/* is beyond first tone */
		{
		  if (i > 1)	/* set the linkage symbol in the mask */
			*mp = '/';		/* is third tone or beyond */
				/* place the tone info */
		  if (tp->tone_value[REGISTER])
			{
			  rp = cpystr(rp,
				  tone_value_name(tp->tone_value[REGISTER]));
			  did_register = TRUE;
			}
		  else
			rp = cpystr(rp, " ");
		  if (tp->tone_value[PRIMARY])
			{
			  pp = cpystr(pp,
				  tone_value_name(tp->tone_value[PRIMARY]));
			}
		  else
			pp = cpystr(pp, " ");
		  if (tp->tone_status[REGISTER] == Linked ||
			  tp->tone_status[PRIMARY ] == Linked)
			*lp++ = *mp;
		  else
			*lp++ = ' ';
				/* see if need to add space after the tone */
		  if (tlp->tonl_right == (struct tone_list *)NULL)
			{	/* no other tones, just skip a space */
			  rp = cpystr(rp, " ");
			  pp = cpystr(pp, " ");
			  lp = cpystr(lp, " ");
			  if (i == 2) /* adjust tbu spacing, too */
			bp = cpystr(bp, " ");
			}
		  if (i > 2)
			{		/* for fourth or more, need to add space so
				   the tbus will align properly */
			  if (tlp->tonl_right == (struct tone_list *)NULL)
			bp = cpystr(bp, "  ");
			  else
			bp = cpystr(bp, " ");
			}
		}
		}
	  last_tp = tp;		/* remember last tone */
	}
	}
				/* output the diagram */
  if (did_register)
	fprintf(pOutputFP_in, mask, &diagram[0][0]);
  fprintf(pOutputFP_in, mask, &diagram[1][0]);
  fprintf(pOutputFP_in, mask, &diagram[2][0]);
  fprintf(pOutputFP_in, mask, &diagram[3][0]);

}	/* end of draw_tone_diagram */

/****************************************************************************
 * NAME
 *    end_of_tone_list
 * ARGUMENTS
 *    tlhp - pointer to head of tone_list
 * DESCRIPTION
 *    find the last element in a linked list of tone_list structs
 * RETURN VALUE
 *    pointer to the last element
 */
struct tone_list *end_of_tone_list(tlhp)
	 struct tone_list *tlhp;
{
  struct tone_list *tlp;

  for (tlp = tlhp;
	   tlp != (struct tone_list *)NULL &&
	   tlp->tonl_right != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	;

  return(tlp);

}	/* end end_of_tone_list */

/****************************************************************************
 * NAME
 *    end_of_tone_nodes
 * ARGUMENTS
 *    tnhp - pointer to head of tone node list
 * DESCRIPTION
 *    find the last element in a linked list of tone structs
 * RETURN VALUE
 *    pointer to the last element
 */
struct tone *end_of_tone_nodes(tn_headp)
	 struct tone *tn_headp;
{
  struct tone *tp;

  for (tp = tn_headp;
	   tp != (struct tone *)NULL &&
	   tp->tone_right != (struct tone *)NULL;
	   tp = tp->tone_right)
	;

  return(tp);

}	/* end end_of_tone_nodes */

/****************************************************************************
 * NAME
 *    end_of_tval_list
 * ARGUMENTS
 *    tvhp - pointer to head of tval_list
 * DESCRIPTION
 *    find the last element in a linked list of tval_list structs
 * RETURN VALUE
 *    pointer to the last element
 */
struct tval_list *end_of_tval_list(tvhp)
	 struct tval_list *tvhp;
{
  struct tval_list *tvp;

  for (tvp = tvhp;
	   tvp != (struct tval_list *)NULL &&
	   tvp->tvl_next != (struct tval_list *)NULL;
	   tvp = tvp->tvl_next)
	;

  return(tvp);

}	/* end end_of_tval_list */

/****************************************************************************
 * NAME
 *    every_tbu_has
 * ARGUMENTS
 *    ap     - pointer to analysis struct
 *    tier   - tier on which tones reside
 *    status - tone status (linked, floating, etc.)
 *    value  - tone value (H, L, etc.)
 * DESCRIPTION
 *    see if every tbu in the morpheme has a tone of the indicated status
 *            and value on the indicated tier
 * RETURN VALUE
 *    TRUE  if it is
 *    FALSE otherwise
 */
int every_tbu_has( ap, tier, status, value )
	 StampAnalysis  *ap;
	 int               tier;
	 char             *status;
	 char             *value;
{

  struct tbu *tbp, *tb_last;
  struct tone_list *tlp;
  int tone_found;

  if (ap == (StampAnalysis *)NULL)
	return(FALSE);

				/* check each tbu */
  for (tbp = ap->pTBUBeg, tb_last = (struct tbu *)NULL;
	   tbp != (struct tbu *)NULL &&
	   tb_last != ap->pTBUEnd;
	   tb_last = tbp, tbp = tbp->tbu_right)
	{				/* check all tones on the tbu */
	  for (tlp = tbp->tbu_tonel, tone_found = FALSE;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	if (tone_id(tlp->tonl_tone, tier, status, value))
	  tone_found = TRUE;
	  if (!tone_found)
	return(FALSE);		/* none found on this tbu; quit */
	}
				/* every one had the tone */
  return(TRUE);

}	/* end every_tbu_has */

/****************************************************************************
 * NAME
 *    edge_cond_name
 * ARGUMENTS
 *    ec - edge condition value
 * DESCRIPTION
 *    get string corresponding to edge condition value
 * RETURN VALUE
 *    pointer to an edge condition name
 */
char *edge_cond_name(ec)
	 long ec;
{
  struct edge_cond_list *ecp;

  for (ecp = Edge_Cond_List_Head;
	   ecp != (struct edge_cond_list *)NULL;
	   ecp = ecp->ec_next)
	{
	  if (ec == ecp->ec_value)
	return(ecp->ec_str);
	}

  return( (char *)NULL);

}	/* end edge_cond_name */

/****************************************************************************
 * NAME
 *    find_edge_cond
 * ARGUMENTS
 *    cp - string to check for edge condition
 * DESCRIPTION
 *    check string to see if it is a valid edge condition
 * RETURN VALUE
 *    edge condition value if valid
 *    NULL otherwise
 */
long find_edge_cond(cp)
	 char *cp;
{
  struct edge_cond_list *ecp;

  for (ecp = Edge_Cond_List_Head;
	   ecp != (struct edge_cond_list *)NULL;
	   ecp = ecp->ec_next)
	{
	  if (streq(cp, ecp->ec_str))
	{
	  return(ecp->ec_value);
	}
	}

  return((long)NULL);

}	/* end find_edge_cond */

/****************************************************************************
 * NAME
 *    find_tone_domain
 * ARGUMENTS
 *    cp - string to check for tone domain
 * DESCRIPTION
 *    check string to see if it is a valid tone domain
 * RETURN VALUE
 *    tone domain if valid
 *    NULL otherwise
 */
int find_tone_domain(cp)
	 char *cp;
{
  struct tone_domain_list *tdp;

  for (tdp = Tone_Domain_List_Head;
	   tdp != (struct tone_domain_list *)NULL;
	   tdp = tdp->td_next)
	{
	  if (streq(cp, tdp->td_str))
	return(tdp->td_domain);
	}

  return((int)NULL);

}	/* end find_tone_domain */

/****************************************************************************
 * NAME
 *    find_tone_seg_rep
 * ARGUMENTS
 *    tslp - pointer to head of a tone_seg_list list
 *    tbp  - pointer to a tbu structure
 *    build_flags - various word building flags
 * DESCRIPTION
 *    search the tone_seg_list for the values of the linked tones in the
 *      sequence of tones pointed to by the tbu
 * RETURN VALUE
 *    pointer to the representation in the tone_seg_list if found
 *    NULL otherwise
 */
static char *find_tone_seg_rep(tslp, tbp, build_flags)
	 struct tone_seg_list *tslp;
	 struct tbu           *tbp;
	 int             build_flags;
{
  struct tval_list *tvlp;
  struct tone_list *tlp;
  struct tone      *tp;
  int are_same;
  int tier;
				/* search through the tone_seg_list */
  for (; tslp != (struct tone_seg_list *)NULL; tslp = tslp->ts_next)
	{
				/* assume there will be a match */
	  are_same = TRUE;
				/* make a parallel run through the tval_list */
				/* associated with the current tone_seg_list */
				/* and the tones in the tbu's list of tones */
	  for (tvlp = tslp->ts_tval, tlp = tbp->tbu_tonel;
	   tvlp != (struct tval_list *)NULL &&
		tlp != (struct tone_list *)NULL;
	   tvlp = tvlp->tvl_next, tlp = tlp->tonl_right)
	{
				/* find next tone that is linked to the tbu */
	  while ( tlp != (struct tone_list *)NULL &&
		 (tp = tlp->tonl_tone) != (struct tone *)NULL &&
		 tone_has_no_rep(tp, build_flags))
		tlp = tlp->tonl_right;
				/* check for validity of tone structs */
	  if (tlp == (struct tone_list *)NULL || tp == (struct tone*)NULL)
		{
		  are_same = FALSE;		/* ran out of linked tones; cannot */
		  break;			/* be a match */
		}
				/* compare the tone value and status with the*/
				/*  value/status pairs in the tone_seg_list */
	  for (tier = 0; tier < TIERS; tier++)
		if (tvlp->tvl_value[tier]  != tp->tone_value[tier] ||
		tvlp->tvl_status[tier] != tp->tone_status[tier])
		  are_same = FALSE;		/* not a match */
	  if (!are_same)
		break;
	}
				/* if all values matched and reached the end */
				/* of the tval_list ... */
	  if (are_same  &&
	  tvlp == (struct tval_list *)NULL)
	{
				/* find next tone that is linked to the tbu */
	  while ( tlp != (struct tone_list *)NULL &&
		 (tp = tlp->tonl_tone) != (struct tone *)NULL &&
		 tone_has_no_rep(tp, build_flags))
		tlp = tlp->tonl_right;
				/* if there are no more linked tones, then */
				/* have found a match */
	  if (tlp == (struct tone_list *)NULL)
		return(tslp->ts_str);	/* return the representation */
	}
	}

  return((char *)NULL);		/* nothing found */

}	/* end find_tone_seg_rep */

/****************************************************************************
 * NAME
 *    find_tone_type
 * ARGUMENTS
 *    cp - string to check for tone type
 * DESCRIPTION
 *    check string to see if it is a valid tone type
 * RETURN VALUE
 *    tone type if valid
 *    NULL otherwise
 */
int find_tone_type(cp)
	 char *cp;
{
  struct tone_type_list *ttp;

  for (ttp = Tone_Type_List_Head;
	   ttp != (struct tone_type_list *)NULL;
	   ttp = ttp->tt_next)
	{
	  if (streq(cp, ttp->tt_str))
	return(ttp->tt_type);
	}

  return((int)NULL);

}	/* end find_tone_type */

/****************************************************************************
 * NAME
 *    find_tone_value
 * ARGUMENTS
 *    cp - string to check for tone value
 *    tier - tier to which value belongs
 * DESCRIPTION
 *    check string to see if it is a valid tone value
 * RETURN VALUE
 *    tone value if valid
 *    NULL otherwise
 *	(in addition, tier is set)
 */
int find_tone_value(cp, tier)
	 char *cp;
	 int  *tier;
{
  struct tone_value_list *tvp;

  for (tvp = Tone_Value_List_Head;
	   tvp != (struct tone_value_list *)NULL;
	   tvp = tvp->tv_next)
	{
	  if (streq(cp, tvp->tv_str))
	{
	  *tier = tvp->tv_tier;
	  return(tvp->tv_value);
	}
	}

  return((int)NULL);

}	/* end find_tone_value */

/****************************************************************************
 * NAME
 *    find_tone_value_list
 * ARGUMENTS
 *    cp - string to check for tone value
 * DESCRIPTION
 *    check string to see if it is a valid tone value
 * RETURN VALUE
 *    pointer to tone_value_list if valid
 *    NULL otherwise
 */
struct tone_value_list *find_tone_value_list(cp)
	 char *cp;
{
  struct tone_value_list *tvp;

  for (tvp = Tone_Value_List_Head;
	   tvp != (struct tone_value_list *)NULL;
	   tvp = tvp->tv_next)
	{
	  if (streq(cp, tvp->tv_str))
	{
	  return(tvp);
	}
	}

  return((struct tone_value_list *)NULL);

}	/* end find_tone_value_list */

/****************************************************************************
 * NAME
 *    free_tone
 * ARGUMENTS
 *    tp - pointer to tone structure
 * DESCRIPTION
 *    free the tone structure from memory
 * RETURN VALUE
 *    NONE
 */
void free_tone(tp)
	 struct tone *tp;
{
  struct tbu_list *tblp, *tblp2;
  int tier;

  if (tp == (struct tone *)NULL)
	return;
				/* free the tbu list */
  for (tblp = tp->tone_tbul;
	   tblp != (struct tbu_list *)NULL;
	   tblp = tblp2)
	{
	  tblp2 = tblp->tbul_next;
	  freeMemory((char *)tblp);
	}
				/* free the tone_list */
  for (tier = 0; tier < TIERS; tier++)
	free_tone_list(tp->tone_tonel[tier]);

				/* free the tone */
  freeMemory((char *)tp);

}	/* end free_tone */

/****************************************************************************
 * NAME
 *    free_tone_list
 * ARGUMENTS
 *    tlp - pointer to tone-list structure
 * DESCRIPTION
 *    free the tone_list structure from memory
 * RETURN VALUE
 *    NONE
 */
void free_tone_list(tlp)
	 struct tone_list *tlp;
{
  struct tone_list *tlp2;

  for (;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp2)
	{
	  tlp2 = tlp->tonl_right;
	  freeMemory((char *)tlp);
	}

}	/* end free_tone_list */

/****************************************************************************
 * NAME
 *    free_tones
 * ARGUMENTS
 *    tp - pointer to a tone
 * DESCRIPTION
 *    free the memory used by tone structs in their linked list
 * RETURN VALUE
 *    NONE
 */
void free_tones(tp)
	 struct tone *tp;
{

  struct tone *tp2;
				/* free all tones in linked list */
  for (;
	   tp != (struct tone *)NULL;
	   tp = tp2)
	{
	  tp2 = tp->tone_right;
	  free_tone(tp);
	}

}	/* end free_tones */

/****************************************************************************
 * NAME
 *    free_tones_in_anal
 * ARGUMENTS
 *    ap - pointer to head of linked list of analysis structs
 * DESCRIPTION
 *    free the memory used by tone structs in the analysis list
 * RETURN VALUE
 *    NONE
 */
void free_tones_in_anal(ap)
	 StampAnalysis *ap;
{
  struct tone_list *tlp;
				/* free all tones in linked list */
  for (;
	   ap != (StampAnalysis *)NULL;
	   ap = ap->pRightLink)
	{
	  for (tlp = ap->m.pTones;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	free_tone(tlp->tonl_tone);
	  free_tone_list(ap->m.pTones);
	}

}	/* end free_tones_in_anal */

/****************************************************************************
 * NAME
 *    free_tval_list
 * ARGUMENTS
 *    tvlp - pointer to tval-list structure
 * DESCRIPTION
 *    free the tval_list structure from memory
 * RETURN VALUE
 *    NONE
 */
void free_tval_list(tvlp)
	 struct tval_list *tvlp;
{
  struct tval_list *tvlp2;

  for (;
	   tvlp != (struct tval_list *)NULL;
	   tvlp = tvlp2)
	{
	  tvlp2 = tvlp->tvl_next;
	  freeMemory((char *)tvlp);
	}

}	/* end free_tval_list */

#ifdef B4_0_4_4
/****************************************************************************
 * NAME
 *    get_edge_tone
 * ARGUMENTS
 *    ap   - pointer to analysis struct (a morpheme)
 *    tier - tone tier
 *    edge - either LEFT or RIGHT edge
 * DESCRIPTION
 *    find the first tone on the indicated tier at the indicated edge of
 *    the morpheme
 * RETURN VALUE
 *    pointer to the tone (or NULL if none found)
 */
struct tone *get_edge_tone(ap, tier, edge)
	 StampAnalysis *ap;
	 int              tier;
	 int              edge;
{
  struct tbu       *tbp;
  struct tone_list *tlp;
  int               is_tbu_less;
				/* shouldn't happen, but... */

  if (ap == (StampAnalysis *)NULL)
	return( (struct tone *)NULL );
				/* initialize */
  is_tbu_less = FALSE;

				/* check for tbu-less current morpheme that
				   also has some tone */
  if (ap->pTBUBeg == (struct tbu *)NULL &&
	  ap->m.pTones != (struct tone_list *)NULL)
	{
	  if (edge == LEFT)
	{			/* leftmost is now the rightmost of the */
	  ap = ap->pLeftLink;	/* morpheme to the left */
	  edge = RIGHT;
	}
	  else
	{
	  ap = ap->pRightLink;	/* rightmost is now the leftmost of the */
	  edge = LEFT;		/* morpheme to the right */
	}
	  if (ap == (StampAnalysis *)NULL)
	return( (struct tone *)NULL );
	  is_tbu_less = TRUE;
	}

  if (edge == LEFT)
	{				/* check tbus from left edge */
	  for (tbp = ap->pTBUBeg;
	   tbp != (struct tbu *)NULL &&
	   tbp->tbu_left != ap->pTBUEnd;
	   tbp = tbp->tbu_right)
				/* check tbu's tone list from beginning */
	  for (tlp = tbp->tbu_tonel;
		   tlp != (struct tone_list *)NULL;
		   tlp = tlp->tonl_right)
				/* see if there is a tone on the tier */
		if (tlp->tonl_tone->tone_value[tier])
		  {
		if (!is_tbu_less)
		  return(tlp->tonl_tone);
				/* original morpheme had no tbu's so check */
				/* morpheme to right for left-floating tone */
		if (tlp->tonl_tone->tone_status[tier] == LeftFloating)
				/* it is; return it */
		  return(tlp->tonl_tone);
		else
				/* it is not; no tone for original morpheme */
		  return( (struct tone *)NULL );
		  }
	}
  else
	{				/* check tbus from right edge */
	  for (tbp = ap->pTBUEnd;
	   tbp != (struct tbu *)NULL &&
	   tbp->tbu_right != ap->pTBUBeg;
	   tbp = tbp->tbu_left)
				/* check tbu's tone list from end: */
	  for (tlp = end_of_tone_list(tbp->tbu_tonel);
		   tlp != (struct tone_list *)NULL;
		   tlp = tlp->tonl_left)
				/* see if there is a tone on the tier */
		if (tlp->tonl_tone->tone_value[tier])
		  {
		if (!is_tbu_less)
		  return(tlp->tonl_tone);
				/* original morpheme had no tbu's so check */
				/* morpheme to left for right-floating tone */
		if (tlp->tonl_tone->tone_status[tier] == RightFloating)
				/* it is; return it */
		  return(tlp->tonl_tone);
		else
				/* it is not; no tone for original morpheme */
		  return( (struct tone *)NULL );
		  }
	}

  return( (struct tone *)NULL );

}	/* end get_edge_tone */
#else
/****************************************************************************
 * NAME
 *    get_edge_tone
 * ARGUMENTS
 *    ap   - pointer to analysis struct (a morpheme)
 *    tier - tone tier
 *    edge - either LEFT or RIGHT edge
 * DESCRIPTION
 *    find the first tone on the indicated tier at the indicated edge of
 *    the morpheme
 * RETURN VALUE
 *    pointer to the tone (or NULL if none found)
 */
struct tone *get_edge_tone(ap, tier, edge)
	 StampAnalysis *ap;
	 int              tier;
	 int              edge;
{
  struct tone *tp;
				/* shouldn't happen, but... */

  if (ap == (StampAnalysis *)NULL)
	return( (struct tone *)NULL );


  if (edge == LEFT)
	{				/* check tones from left edge */
	  for (tp = ap->pToneBeg;
	   tp != (struct tone *)NULL &&
	   tp->tone_left != ap->pToneEnd;
	   tp = tp->tone_right)
				/* see if there is a tone on the tier */
	if (tp->tone_value[tier])
	  return(tp);
	}
  else
	{				/* check tones from right edge */
	  for (tp = ap->pToneEnd;
	   tp != (struct tone *)NULL &&
	   tp->tone_right != ap->pToneBeg;
	   tp = tp->tone_left)
				/* see if there is a tone on the tier */
	if (tp->tone_value[tier])
	  return(tp);
	}

  return( (struct tone *)NULL );

}	/* end get_edge_tone */

/****************************************************************************
 * NAME
 *    get_morphs_nearest_tone
 * ARGUMENTS
 *    ap   - pointer to analysis struct (morpheme)
 *    edge - edge of morpheme to use for begin of search
 * DESCRIPTION
 *    return the tone struct which is aligned nearest to the indicated morpheme
 * RETURN VALUE
 *    pointer to tone struct
 */
struct tone *get_morphs_nearest_tone(ap, edge)
	 StampAnalysis *ap;
	 int              edge;
{

  if (ap == (StampAnalysis *)NULL)
	return( (struct tone *)NULL );

  if (edge == LEFT)
	return( (ap->pToneBeg == (struct tone *)NULL) ?
			 get_previous_tone(ap->pTBUBeg, LEFT) :
			 ap->pToneBeg->tone_left );

  return( (ap->pToneEnd == (struct tone *)NULL) ?
			 get_previous_tone(ap->pTBUEnd, RIGHT) :
			 ap->pToneEnd );

}	/* end get_morphs_nearest_tone */

#endif /* B4_0_4_4 */

/****************************************************************************
 * NAME
 *    get_next_loc
 * ARGUMENTS
 *    bitmap - bitmap in which location numbers are stored
 *    loc    - last location number retrieved
 * DESCRIPTION
 *    find the next (i.e. larger) location number encoded in the bitmap
 *     (there's probably a better way to do this...)
 * RETURN VALUE
 *    the next location number
 *    NULL if there is no next number
 */
int get_next_loc(bitmap, loc)
	 char *bitmap;
	 int   loc;
{
  int      byte;
  int      bit;
  unsigned bitmask;
  int      i;
				/* increment the location */
  loc++;
				/* determine initial byte and bit to check */
  if (loc == 1)
	{
	  byte = 0;
	  bitmask = 0200;
	}
  else
	{
				/* get byte it is in */
	  byte = loc / 8;
				/* get bit to turn on */
	  bit  = loc % 8;
	  if (bit == 0)
	{
	  byte--;
	  bit = 8;
	}
	  bitmask = 0200;
	  bitmask >>= (bit-1);
	}
				/* scan rest of bitmap for next location */
  for (i = byte; i < MAX_LOC; i++)
	{
	  while (bitmask)
	{
	  if (bitmap[i] & bitmask)
		return(loc);	/* return location number */
	  bitmask >>= 1;
	  loc++;
	}
	  bitmask = 0200;
	}
				/* none found; return NULL */
  return( (int)NULL );

}	/* end get_next_loc */

/****************************************************************************
 * NAME
 *    get_previous_tone
 * ARGUMENTS
 *    tbp  - pointer to tbu
 *    edge - edge of tbu to use for begin of search
 * DESCRIPTION
 *    return the tone struct which is aligned nearest to the indicated tbu
 * RETURN VALUE
 *    pointer to tone struct
 */
struct tone *get_previous_tone(tbp, edge)
	 struct tbu *tbp;
	 int         edge;
{
  struct tone_list *tlp;

  if (tbp == (struct tbu *)NULL)
	return( (struct tone *)NULL );

  for (tbp = (edge == RIGHT ? tbp : tbp->tbu_left);
	   tbp != (struct tbu *)NULL;
	   tbp = tbp->tbu_left)
	if (tbp->tbu_tonel != (struct tone_list *)NULL)
	  {
	tlp = end_of_tone_list(tbp->tbu_tonel);
	return(tlp->tonl_tone);
	  }

  return( (struct tone *)NULL );

}	/* end get_previous_tone */

/****************************************************************************
 * NAME
 *    get_max_edge_conds
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    return the maximum number of defined edge conditions
 * RETURN VALUE
 *    max number of edge conditions
 */
int get_max_edge_conds()
{
  return( Max_Number_Of_Edge_Conds );

}	/* end get_max_edge_conds */

/****************************************************************************
 * NAME
 *    get_seg_tone
 * ARGUMENTS
 *    sp  - pointer to segment structure
 *    tbp - pointer to tbu structure
 *    build_flags - various word building flags
 * DESCRIPTION
 *    if the tbu is linked to a sequence of tones, return the appropriately
 *       marked segment string representation
 * RETURN VALUE
 *    pointer to the representation
 */
static char *get_seg_tone(sp, tbp, build_flags)
	 struct segment *sp;
	 struct tbu     *tbp;
	 int             build_flags;
{
  char *cp;

  if (sp == (struct segment *)NULL)
	return((char *)NULL);

  if (tbp != (struct tbu *)NULL &&
	  (cp = find_tone_seg_rep(sp->seg_tone, tbp, build_flags)) != (char *)NULL)
	return(cp);
  else
	return(sp->seg_str);

}	/* end get_seg_tone */

/****************************************************************************
 * NAME
 *    has_linked_high_tones
 * ARGUMENTS
 *    ap  - pointer to analysis struct
 * DESCRIPTION
 *    see if the morpheme has any linked high tones
 *            (either primary or register)
 * RETURN VALUE
 *    TRUE  if it is
 *    FALSE otherwise
 */
int has_linked_high_tones( ap )
	 StampAnalysis  *ap;
{

  struct tbu *tbp, *tb_last;
  struct tone_list *tlp;

  if (ap == (StampAnalysis *)NULL)
	return(FALSE);

  for (tbp = ap->pTBUBeg, tb_last = (struct tbu *)NULL;
	   tbp != (struct tbu *)NULL &&
	   tb_last != ap->pTBUEnd;
	   tb_last = tbp, tbp = tbp->tbu_right)
	for (tlp = tbp->tbu_tonel;
	 tlp != (struct tone_list *)NULL;
	 tlp = tlp->tonl_right)
	  if (tone_id(tlp->tonl_tone, PRIMARY,  "linked", "H") ||
	  tone_id(tlp->tonl_tone, REGISTER, "linked", "h"))
	return(TRUE);

  return(FALSE);

}	/* end has_linked_high_tones */

/****************************************************************************
 * NAME
 *    insert_tone
 * ARGUMENTS
 *    tn_headp - pointer to head of linked list of tone structs
 *    tp       - pointer to tone struct to be inserted
 *    tp_left  - pointer to tone struct after which insertion is to be made
 * DESCRIPTION
 *    insert a tone struct into the middle of a list just after tp_left
 * RETURN VALUE
 *    pointer to head of the list
 */
struct tone *insert_tone(tn_headp, tp, tp_left)
	 struct tone *tn_headp;
	 struct tone *tp;
	 struct tone *tp_left;
{
  struct tone *tp2;

				/* just in case... */
  if (tp == (struct tone *)NULL)
	return(tn_headp);

				/* find tp_left in the list */
  for (tp2 = tn_headp;
	   tp2 != (struct tone *)NULL &&
	   tp2 != tp_left;
	   tp2 = tp2->tone_right)
	;

  if (tp2 == (struct tone *)NULL)
	{
	  tn_headp = add_tone_node(tn_headp, HEAD, tp);
	}
  else
	{
	  tp->tone_right = tp2->tone_right;
	  if (tp2->tone_right != (struct tone *)NULL)
	tp2->tone_right->tone_left = tp;
	  tp2->tone_right = tp;
	  tp->tone_left = tp2;
	}

  return(tn_headp);

}	/* end insert_tone */

/****************************************************************************
 * NAME
 *    insert_tone_list
 * ARGUMENTS
 *    tl_headp - pointer to head of linked list of tone_list structs
 *    tier     - primary/register tier
 *    tp       - pointer to tone struct to which the new tone_list points
 * DESCRIPTION
 *    insert a new tone_list struct into the middle of a list and point it
 *	to the given tone struct
 * RETURN VALUE
 *    pointer to head of the list
 */
struct tone_list *insert_tone_list(tl_headp, tier, tp)
	 struct tone_list *tl_headp;
	 int               tier;
	 struct tone      *tp;
{
  struct tone *tp2;
  struct tone_list *tlp_new, *tlp;

				/* find 1st "tier" tone to left; tlp */
				/* points to the corresponding element of */
				/* the "tier" tone tier */
  for (tp2 = tp, tlp = (struct tone_list *)NULL;
	   tp2 != (struct tone *)NULL;
	   tp2 = tp2->tone_left)
	{
	  if (tp2->tone_value[tier] != (int)NULL)
	{
	  for (tlp = tl_headp;
		   tlp != (struct tone_list *)NULL &&
		   tlp->tonl_tone != tp2;
		   tlp = tlp->tonl_right)
		;
	  if (tlp != (struct tone_list *)NULL &&
		  tlp->tonl_tone == tp2)
		break;
	}
	}
				/* now add a tone_list element just after tlp*/
  tlp_new             = structalloc( tone_list );
  tlp_new->tonl_tone  = tp;
  tlp_new->tonl_left  = tlp;

  if (tlp == (struct tone_list *)NULL)
	{
	  tlp_new->tonl_right = tl_headp;
	  if (tl_headp != (struct tone_list *)NULL)
	tl_headp->tonl_left = tlp_new;
	  tl_headp = tlp_new;
	}
  else
	{
	  tlp_new->tonl_right = tlp->tonl_right;
	  if (tlp->tonl_right != (struct tone_list *)NULL)
	tlp->tonl_right->tonl_left = tlp_new;
	  tlp->tonl_right = tlp_new;
	}

  return(tl_headp);

}	/* end insert_tone_list */

/****************************************************************************
 * NAME
 *    is_in_tbu_list
 * ARGUMENTS
 *    tbp  - pointer to tbu
 *    tbhp - pointer to head of tbu_list
 * DESCRIPTION
 *    see if the tbu is in the tbu list
 * RETURN VALUE
 *    TRUE  if it is
 *    FALSE otherwise
 */
int is_in_tbu_list(tbp, tbhp)
	 struct tbu      *tbp;
	 struct tbu_list *tbhp;
{
  struct tbu_list *tblp;

  for (tblp = tbhp;
	   tblp != (struct tbu_list *)NULL;
	   tblp = tblp->tbul_next)
	if (tblp->tbul_tbu == tbp)
	  return(TRUE);

  return(FALSE);

}	/* end is_in_tbu_list */

/****************************************************************************
 * NAME
 *    is_in_tone_list
 * ARGUMENTS
 *    tp   - pointer to tone
 *    tlhp - pointer to head of tone_list
 * DESCRIPTION
 *    see if the tone is in the tone list
 * RETURN VALUE
 *    TRUE  if it is
 *    FALSE otherwise
 */
int is_in_tone_list(tp, tlhp)
	 struct tone      *tp;
	 struct tone_list *tlhp;
{
  struct tone_list *tlp;

  for (tlp = tlhp;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	if (tlp->tonl_tone == tp)
	  return(TRUE);

  return(FALSE);

}	/* end is_in_tone_list */

/*************************************************************************
 * NAME
 *    last_two_tones_are
 * ARGUMENTS
 *    tbp     - pointer to rightmost tbu to check (corresponds to status2
 *                              and value2)
 *    tier    - primary and/or register tier
 *    status1 - status of 1st tone (linked, left-floating, etc.)
 *    value1  - value  of 1st tone (H, L, h, etc.)
 *    status2 - status of 2nd tone (linked, left-floating, etc.)
 *    value2  - value  of 2nd tone (H, L, h, etc.)
 * DESCRIPTION
 *    checks to see if the two tbus ended by tbp have tones which match
 *    the given status and value.  If the status is null, it only checks
 *    the value.  If the value is null, it only checks the status.  If
 *    both are null, then no tones should be in the tier.
 * RETURN VALUE
 *    TRUE if the two tbus consist of the indicated tones on the given tier
 *    FALSE otherwise
 */
int last_two_tones_are(tbp, tier, status1, value1, status2, value2)
	 struct tbu *tbp;
	 int         tier;
	 char       *status1;
	 char       *value1;
	 char       *status2;
	 char       *value2;
{
  struct tone_list *tlp;
  int               found_1st_tone, found_2nd_tone;

				/* check for invalid structs */
  if (tbp == (struct tbu *)NULL)
	return(FALSE);
				/* check to see if there are two tbus */
  if (tbp == (struct tbu *)NULL ||
	  tbp->tbu_left == (struct tbu *)NULL)
	return(FALSE);
					/* there are two tbus */
				/* assume won't find the indicated tones */
  found_1st_tone = found_2nd_tone = FALSE;
				/* check for no tones condition at 1st tbu */
  if (status1 == (char *)NULL && value1 == (char *)NULL)
	{				/* check 1st tbu for any tones in the tier */
	  for (tlp = tbp->tbu_left->tbu_tonel;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	if (tlp->tonl_tone->tone_value[tier] != 0)
	  return(FALSE);	/* tone found; condition not met */
				/* no tones found, condition met */
	  found_1st_tone = TRUE;
	}
				/* check for no tones condition at 2nd tbu */
  if (status2 == (char *)NULL && value2 == (char *)NULL)
	{				/* check 2nd tbu for any tones in the tier */
	  for (tlp = tbp->tbu_tonel;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	if (tlp->tonl_tone->tone_value[tier] != 0)
	  return(FALSE);	/* tone found; condition not met */
				/* no tones found, condition met */
	  found_2nd_tone = TRUE;
	}

					/* check 1st tbu for overt status or value */
  for (tlp = tbp->tbu_left->tbu_tonel;
	   tlp != (struct tone_list *)NULL && !found_1st_tone;
	   tlp = tlp->tonl_right)
	{				/* check all tones for the tbu */
	  if (status1 == (char *)NULL && value1 != (char *)NULL)
	{			/* only value given */
	  if (streq(value1,
			tone_value_name(tlp->tonl_tone->tone_value[tier])))
		found_1st_tone = TRUE;
	}
	  else if (value1 == (char *)NULL && status1 != (char *)NULL)
	{			/* only status given */
	  if (streq(status1,
			tone_type_name(tlp->tonl_tone->tone_status[tier])))
		found_1st_tone = TRUE;
	}
	  else			/* both status and value given */
	if (streq(status1,
		  tone_type_name(tlp->tonl_tone->tone_status[tier])) &&
		streq(value1,
		  tone_value_name(tlp->tonl_tone->tone_value[tier])))
	  found_1st_tone = TRUE;
	}

  if (found_1st_tone)
	{				/* first tbu had tone that matched the */
				/* status and value; check 2nd for overt */
				/* status or value */
	  for (tlp = tbp->tbu_tonel;
	   tlp != (struct tone_list *)NULL && !found_2nd_tone;
	   tlp = tlp->tonl_right)
	{			/* check all tones for the tbu */
	  if (status2 == (char *)NULL && value2 != (char *)NULL)
		{			/* only value given */
		  if (streq(value2,
			tone_value_name(tlp->tonl_tone->tone_value[tier])))
		found_2nd_tone = TRUE;
		}
	  else if (value2 == (char *)NULL && status2 != (char *)NULL)
		{			/* only status given */
		  if (streq(status2,
			tone_type_name(tlp->tonl_tone->tone_status[tier])))
		found_2nd_tone = TRUE;
		}
	  else			/* both status and value given */
		if (streq(status2,
			  tone_type_name(tlp->tonl_tone->tone_status[tier])) &&
		streq(value2,
			  tone_value_name(tlp->tonl_tone->tone_value[tier])))
		  found_2nd_tone = TRUE;
	}
	}

  return(found_1st_tone & found_2nd_tone);

}	/* end last_two_tones_are */

/*************************************************************************
 * NAME
 *    link_tone_to_tbu
 * ARGUMENTS
 *    tp         - pointer to tone struct
 *    tier       - primary and/or register tier
 *    act_params - params of linkage: direction, iteration, mode, ocp
 *    tbu        - pointer to tbu struct
 *    tbu_head   - add to head (if TRUE) or tail (if FALSE) of tbu's tone list
 *    ap         - pointer to analysis struct
 *    status     - set tone status to this type value
 * DESCRIPTION
 *    The tone and tbu structs need to point to each other via their
 *    respective tbu and tone lists.  Create the list elements and set
 *    the appropriate pointers.
 *		[NOTE: may need to allow for both tiers, not just one.]
 * RETURN VALUE
 *    (Used by spread_tone) is according to this chart:
 *                             mode is  f-adding  f-changing  f-filling
 *     tbu has linked tone?
 *            yes                       false     true        false
 *
 *            no                        true      true        true
 */
int link_tone_to_tbu(tp, tier, act_params, tbu, tbu_head, ap, status,
			 pOutputFP_in)
	 struct tone     *tp;
	 int              tier;
	 int              act_params;
	 struct tbu      *tbu;
	 int              tbu_head;
	 StampAnalysis *ap;
	 int              status;
	 FILE            *pOutputFP_in;
{
  struct tone      *tp2;
  struct tbu_list  *tblp, *tblp2;
  struct tone_list *tlp;
  struct tbu       *tbp2;
  int               head;
  int               exit_value;

				/* check for invalid structs */
  if (tp == (struct tone *)NULL || tbu == (struct tbu *)NULL)
	return(FALSE);

				/* initialize */
  exit_value = TRUE;
				/* check for crossing association lines */
  if (DIRECTION(act_params) == RIGHTWARD)
	{				/* find first linked tone to the right */
	  for (tp2 = tp->tone_right;
	   tp2 != (struct tone *)NULL;
	   tp2 = tp2->tone_right)
	if (tp2->tone_status[PRIMARY]  == Linked ||
		tp2->tone_status[REGISTER] == Linked)
	  break;
				/* get its leftmost tbu */
	  if (tp2 != (struct tone *)NULL)
	{
	  if ((tblp2 = tp2->tone_tbul) != (struct tbu_list *)NULL)
		{			/* if the target tbu is to the right of this
				   tbu, will cross association lines */
		  if ((tbp2 = tblp2->tbul_tbu) != (struct tbu *)NULL)
		for (tbp2 = tbp2->tbu_right;
			 tbp2 != (struct tbu *)NULL;
			 tbp2 = tbp2->tbu_right)
		  if (tbp2 == tbu) /* it is; linking the current tone */
			return(FALSE); /* will create a crossed association line */
		}
	}
	}
  else
	{				/* find first linked tone to the left */
	  for (tp2 = tp->tone_left;
	   tp2 != (struct tone *)NULL;
	   tp2 = tp2->tone_left)
	if (tp2->tone_status[PRIMARY]  == Linked ||
		tp2->tone_status[REGISTER] == Linked)
	  break;
				/* get its rightmost tbu */
	  if (tp2 != (struct tone *)NULL)
	{
	  if ((tblp2 = end_of_tbu_list(tp2->tone_tbul)) !=
		  (struct tbu_list *)NULL)
		{			/* if the target tbu is to the left of this
				   tbu, will cross association lines */
		  if ((tbp2 = tblp2->tbul_tbu) != (struct tbu *)NULL)
		for (tbp2 = tbp2->tbu_left;
			 tbp2 != (struct tbu *)NULL;
			 tbp2 = tbp2->tbu_left)
		  if (tbp2 == tbu) /* it is; linking the current tone */
			return(FALSE); /* will create a crossed association line */
		}
	}
	}
				/* for feature-filling and feature-adding */
				/* modes, see if the tbu already has a */
				/* linked tone and if the new status is */
				/* also linked */
  if (MODE(act_params) == FEATURE_FILLING ||
	  MODE(act_params) == FEATURE_ADDING)
	{

	  for (tlp = tbu->tbu_tonel;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	{
	  if (tlp->tonl_tone->tone_status[tier] == Linked &&
		  status == Linked)
				/* it is */
		{			/* do nothing for feature-filling */
		  if (MODE(act_params) == FEATURE_FILLING)
		return(FALSE);
		  else	/* set exit value to FALSE for feature-adding */
		   exit_value = FALSE;
		}
	}
	}
			  /* create tbu_list element for tone struct */
			  /* if needed */
  if (!is_in_tbu_list(tbu, tp->tone_tbul))
	{
	  head = (DIRECTION(act_params) == RIGHTWARD) ? TAIL : HEAD;
				/* add an element to tbu list */
	  tp->tone_tbul = add_tbu_list(tp->tone_tbul, head);
				/* get the element just added */
	  if (head)
	tblp = tp->tone_tbul;
	  else
	tblp = end_of_tbu_list(tp->tone_tbul);
				/* set its tbu pointer */
	  tblp->tbul_tbu = tbu;
	}
			  /* create tone_list element for tbu struct */
  if (MODE(act_params) == FEATURE_CHANGING)
	{				/* if it is feature_changing, delink all */
				/* previous tones */
	  for (tlp = tbu->tbu_tonel;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	{
	  delink_tone_from_tbu(tlp->tonl_tone, tier, tbu);
	}
	}
			 /* create new tone list element for tbu */
			 /* if needed */
  if (!is_in_tone_list(tp, tbu->tbu_tonel))
	{
				/* add an element to tone list */
	  tbu->tbu_tonel = add_tone_list(tbu->tbu_tonel, tbu_head, tp);
	}

  if (status)
	tp->tone_status[tier] = status;

#ifndef B4_0_4_4
  if (ap != (StampAnalysis *)NULL)
	{  				/* adjust morpheme tone pointers, if needed */
	  adjust_morpheme_tone_pointers(ap, tp, tbu, pOutputFP_in);
	}
#endif /* B4_0_4_4 */

  return(exit_value);

}	/* end link_tone_to_tbu */

#ifndef B4_0_4_4
/****************************************************************************
 * NAME
 *    morph_has_tone_id
 * ARGUMENTS
 *    ap  - pointer to an analysis struct
 *    tip - pointer to a tone_id struct
 * DESCRIPTION
 *    see if the morpheme has a tone as indicated by tip
 * RETURN VALUE
 *    TRUE  if it does
 *    FALSE otherwise
 */
int morph_has_tone_id(ap, tip)
	 StampAnalysis *ap;
	 struct tone_id  *tip;
{
  struct tone *tp;

  if (ap != (StampAnalysis *)NULL)
	{
	  for (tp = ap->pToneBeg;
	   tp != (struct tone *)NULL &&
	   tp->tone_left != ap->pToneEnd;
	   tp = tp->tone_right)
	if (tone_matches(tp, tip))
	  return(TRUE);
	}

  return(FALSE);

}	/* end morph_has_tone_id */
#endif /* B4_0_4_4 */

/****************************************************************************
 * NAME
 *    remove_tone_node
 * ARGUMENTS
 *    tn_headp - pointer to head of linked list of tone structs
 *    tp       - pointer to a tone struct
 * DESCRIPTION
 *    remove a tone struct from the tone node list
 * RETURN VALUE
 *    pointer to head of the list
 */
struct tone *remove_tone_node(tn_headp, tp)
	 struct tone *tn_headp;
	 struct tone *tp;
{
				/* just in case... */
  if (tp == (struct tone *)NULL)
	return(tn_headp);
				/* remove it from the list */
  if (tp->tone_right != (struct tone *)NULL)
	tp->tone_right->tone_left = tp->tone_left;
  if (tp->tone_left != (struct tone *)NULL)
	tp->tone_left->tone_right = tp->tone_right;
  else
	tn_headp = tp->tone_right;

  return(tn_headp);

}	/* end remove_tone_node */

/****************************************************************************
 * NAME
 *    set_edge_cond
 * ARGUMENTS
 *    lp - string containing edge condition
 * DESCRIPTION
 *    add string to list of edge conditions
 * RETURN VALUE
 *    NONE
 */
void set_edge_cond(lp, pOutputFP_in)
	 char *lp;
	 FILE *pOutputFP_in;
{
  struct edge_cond_list *ecp;

				/* check to see if new one is already in */
				/* the list */
  for (ecp = Edge_Cond_List_Head;
	   ecp != (struct edge_cond_list *)NULL;
	   ecp = ecp->ec_next)
	{
	  if (streq(lp, ecp->ec_str))
	{
	  fprintf(pOutputFP_in,
		  "%sDuplicate edge condition %s; will be ignored.",
		 errhead, lp);
	  return;
	}
	}
				/* check to see if have too many edge conds */
  if ((long)Max_Number_Of_Edge_Conds >= MAX_EDGE_CONDS)
	{
	  fprintf(pOutputFP_in,
		  "%sMaximum number of edge conditions exceeded!  Max is %ld",
		  errhead, MAX_EDGE_CONDS);
	  fprintf(pOutputFP_in,
		  "\n\t\t%s will be ignored.",lp);
	  return;
	}
				/* allocate, initialize, and link-in new one */
  ecp = structalloc(edge_cond_list);
  ecp->ec_str = duplicateString( lp );
  if (Edge_Cond_List_Head == (struct edge_cond_list *)NULL)
	{
	  ecp->ec_next = (struct edge_cond_list *)NULL;
	  ecp->ec_value = Max_Number_Of_Edge_Conds = 1;
	}
  else
	{
	  ecp->ec_next = Edge_Cond_List_Head;
	  ecp->ec_value = Edge_Cond_List_Head->ec_value * 2L;
	  Max_Number_Of_Edge_Conds++;
	}

  Edge_Cond_List_Head = ecp;

}	/* end set_edge_cond */

/****************************************************************************
 * NAME
 *    set_loc_num
 * ARGUMENTS
 *    bitmap - bitmap in which to store location number
 *    loc    - location number
 * DESCRIPTION
 *    set appropriate bitmap for given location
 *     (there's probably a better way to do this...)
 * RETURN VALUE
 *    updated bitmap
 */
static char *set_loc_num(bitmap, loc)
	 char *bitmap;
	 int   loc;
{
  int      byte;
  int      bit;
  unsigned bitmask;
				/* get byte it is in */
  byte = loc / 8;
				/* get bit to turn on */
  bit  = loc % 8;
  if (bit == 0)
	{
	  byte--;
	  bit = 8;
	}
  bitmask = 0200;
  bitmask >>= (bit-1);

				/* set the bit */
  bitmap[byte] |= bitmask;
				/* return updated bitmap */
  return(bitmap);

}	/* end set_loc_num */

/****************************************************************************
 * NAME
 *    parseTone
 * ARGUMENTS
 *    pszLine_in - line to parse
 *    tl_headp   - head of list of tone structures
 * DESCRIPTION
 *    create tone and tone_list structs for a dictionary entry
 * RETURN VALUE
 *    NONE
 ************************************************************
 *
 *	Syntax of tone line in dictionary:
 *          <tone_entry>    ::= <type> <values> <marker> <domain_location>
 *                              <type> <values>
 *
 *          <values>        ::= <values> <value>
 *                              <value>
 *
 *          <type>          ::= floating
 *                              linked
 *                              boundary
 *
 *          <value>         ::= H
 *                              L
 *
 *          <marker>        ::= @
 *
 *          <domain_location> ::= <domain>
 *                                <location>
 *
 *          <domain>        ::= morpheme
 *                              infl
 *                              stem
 *                              macro_stem
 *                              word
 *
 *          <location>        ::= tbu <numbers>
 *				  (i.e. tbu(s) to which tone is associated)
 *
 *          <numbers>         ::= <numbers> <number>
 *                                <number>
 *
 *          <number>          ::= [1-99]
 *		(<value> and <domain> are under user control)
 *
 */
void parseTone(char *             pszLine_in,
		   struct tone_list **tl_headp,
		   unsigned	          uiDictEntry_in,
		   const char *	  pszRecordKey_in,
		   const char *	  pszErrorHeader_in,
		   FILE *	          pLogFP_in)
{
  int t_type;
  int t_value;
  int t_domain;
  int found_value;
  int is_register;
  int loc;
  char *cp, *end;
  struct tone_list *new_listp = (struct tone_list *)NULL;

  pszLine_in += strspn(pszLine_in, szWhitespace_m); /* skip over white space */

  end = isolateWord(pszLine_in);		/* get next token */
				/* look for <type> */
  if (!(t_type = find_tone_type(pszLine_in)))
	  {
	fprintf(pLogFP_in,"%sUndefined tone type %s in entry %s\n",
		pszErrorHeader_in, pszLine_in,
		getAmpleRecordIDTag(pszRecordKey_in, uiDictEntry_in));
	  }
  else
	{
	  end += strspn(end, szWhitespace_m); /* skip over white space */
	  end = isolateWord( pszLine_in = end ); /* skip to next token */
				/* look for <values> */
	  is_register = found_value = FALSE;
	  while ((t_value = find_tone_value(pszLine_in, &is_register)))
	{
				/* allocate tone struct and link it into */
				/* the tone list */
	  if (!found_value)
		{
		  *tl_headp = add_tone_list( *tl_headp, TAIL, (struct tone*)NULL);
		  new_listp = end_of_tone_list( *tl_headp );
		}
/* if primary and found_value, then allocate new tone struct; link it to existing tone struct via the tone pointers.  Can treat boundary and complex tones this way */
				/* set type and value */
	  new_listp->tonl_tone->tone_ul_type[is_register] =
			 new_listp->tonl_tone->tone_status[is_register] = t_type;
	  new_listp->tonl_tone->tone_value[is_register] = t_value;
	  found_value = TRUE;
	  end += strspn(end, szWhitespace_m);/* skip over white space */

	  end = isolateWord( pszLine_in = end ); /* skip to next token */
	}
	  if (!found_value)
	{
	  fprintf(pLogFP_in,"%sUndefined tone value %s in entry %s\n",
		  pszErrorHeader_in, pszLine_in,
		  getAmpleRecordIDTag(pszRecordKey_in, uiDictEntry_in));
	}
	  else
	{			/* Is there more? */
	  if (*pszLine_in != NUL)
		{			/* look for optional <marker> */
		  if (!streq(pszLine_in,"@"))
		fprintf(pLogFP_in,
			"%sExpected tone domain/location marker; found %s in entry %s\n",
			pszErrorHeader_in, pszLine_in,
			getAmpleRecordIDTag(pszRecordKey_in, uiDictEntry_in));
		  else
		{	/* <marker> found */
		  end += strspn(end, szWhitespace_m);/* skip over white space */

		  end = isolateWord( pszLine_in = end ); /* skip to next token */
				/* see if it is "tbu" for location */
		  if (streq(pszLine_in, "tbu"))
			{		/* is location; skip to next token */
			  end += strspn(end, szWhitespace_m);	/* skip over white space */

			  end = isolateWord( pszLine_in = end );
			  while ((loc = atoi(pszLine_in)))
			{	/* check for valid location */
			  if (loc < 0 || loc > MAX_LOC * 8)
				{
				  fprintf(pLogFP_in,
					  "%sTbu location (%d) is too large (maximum is %d)",
					  pszErrorHeader_in, loc, MAX_LOC*8);

				  fprintf(pLogFP_in,"\n\t\t in entry %s\n",
					  getAmpleRecordIDTag(pszRecordKey_in,
							  uiDictEntry_in));

				}
			  else
				{   /* encode location number */
				  cp = &(new_listp->tonl_tone->tone_ul_loc[0]);
				  cp = set_loc_num(cp, loc);
				}
					/* skip to next token */
			  end += strspn(end, szWhitespace_m);	/* skip over white space */
			  end = isolateWord( pszLine_in = end );
			}
			}
		  else
				/* look for <domain> */
			if (!(t_domain = find_tone_domain(pszLine_in)))
			  {
			fprintf(pLogFP_in,
				"%sUndefined tone domain %s in entry %s\n",
				pszErrorHeader_in, pszLine_in,
				getAmpleRecordIDTag(pszRecordKey_in,
							uiDictEntry_in));
			  }
			else
			  {
			new_listp->tonl_tone->tone_domain = t_domain;
			  }
		}
		}			/* end of "is there more?" */
	}
	}

}	/* end parseTone */

/****************************************************************************
 * NAME
 *    set_tone_domain
 * ARGUMENTS
 *    lp - string containing tone domain
 * DESCRIPTION
 *    add string to list of tone domains
 * RETURN VALUE
 *    NONE
 */
void set_tone_domain(lp, pOutputFP_in)
	 char *lp;
	 FILE *pOutputFP_in;
{
  struct tone_domain_list *tdp;

				/* check to see if new one is already in */
				/* the list */
  for (tdp = Tone_Domain_List_Head;
	   tdp != (struct tone_domain_list *)NULL;
	   tdp = tdp->td_next)
	{
	  if (streq(lp, tdp->td_str))
	{
	  fprintf(pOutputFP_in, "%sDuplicate tone domain %s; will be ignored.",
		 errhead, lp);
	  return;
	}
	}
				/* allocate, initialize, and link-in new one */
  tdp = structalloc(tone_domain_list);
  tdp->td_str = duplicateString(lp);
  if (Tone_Domain_List_Head == (struct tone_domain_list *)NULL)
	{
	  tdp->td_next = (struct tone_domain_list *)NULL;
	  tdp->td_domain = 1;
	}
  else
	{
	  tdp->td_next = Tone_Domain_List_Head;
	  tdp->td_domain = Tone_Domain_List_Head->td_domain + 1;
	}

  Tone_Domain_List_Head = tdp;

}	/* end set_tone_domain */

/****************************************************************************
 * NAME
 *    set_tone_type
 * ARGUMENTS
 *    line - string containing tone type/status and show codes (D and/or O)
 * DESCRIPTION
 *    add string to list of tone types and set show parameter
 * RETURN VALUE
 *    NONE
 */
void set_tone_type(line, pOutputFP_in)
	 char *line;
	 FILE *pOutputFP_in;
{
  struct tone_type_list *ttp;
  char *name;

  line += strspn(line, szWhitespace_m);	/* skip over white space */
  name = line;
  if ((line == (char *)NULL) || (*name == NUL))
	{
	  fprintf(pOutputFP_in, "%sEmpty \\tonetype definition", errhead );
	  return;
	}
  line = isolateWord(name);
				/* check to see if new one is already in */
				/* the list */
  for (ttp = Tone_Type_List_Head;
	   ttp != (struct tone_type_list *)NULL;
	   ttp = ttp->tt_next)
	{
	  if (streq(name, ttp->tt_str))
	{
	  fprintf(pOutputFP_in, "%sDuplicate tone type %s; will be ignored.",
		 errhead, name);
	  return;
	}
	}
				/* allocate, initialize, and link-in new one */
  ttp = structalloc(tone_type_list);
  ttp->tt_str = duplicateString(name);
  if (Tone_Type_List_Head == (struct tone_type_list *)NULL)
	{
	  ttp->tt_next = (struct tone_type_list *)NULL;
	  ttp->tt_type = 1;
	}
  else
	{
	  ttp->tt_next = Tone_Type_List_Head;
	  ttp->tt_type = Tone_Type_List_Head->tt_type + 1;
	}

  Tone_Type_List_Head = ttp;

				/* get any derivation and orthography info */
  for (ttp->tt_show = 0, name = isolateWord(line);
	   line != (char *)NULL && *line != NUL;
	   name = isolateWord(line = name))
	{
	  if (streq(line, "D"))
	ttp->tt_show += SHOW_DERIVATION;
	  else if (streq(line, "O"))
	ttp->tt_show += SHOW_ORTHOGRAPHY;
	  else
	{
	  fprintf(pOutputFP_in,
		  "%s \\tonetype line: unrecognized show type: %s",
		  errhead, line);
	  fprintf(pOutputFP_in, "\n                  expected either D or O");
	}
	}

				/* set global variables */
  if (streq(ttp->tt_str, "linked"))
	Linked = ttp->tt_type;
  else if (streq(ttp->tt_str, "floating"))
	Floating = ttp->tt_type;
  else if (streq(ttp->tt_str, "left-floating"))
	LeftFloating = ttp->tt_type;
  else if (streq(ttp->tt_str, "right-floating"))
	RightFloating = ttp->tt_type;
  else if (streq(ttp->tt_str, "boundary"))
	Boundary = ttp->tt_type;
  else if (streq(ttp->tt_str, "delinked"))
	Delinked = ttp->tt_type;
  else if (streq(ttp->tt_str, "melody"))
	Melody = ttp->tt_type;

}	/* end set_tone_type */

/****************************************************************************
 * NAME
 *    set_tone_value
 * ARGUMENTS
 *    lp - string containing tone value
 *    tier - tier to which tone belongs (primary/register)
 *    value - value of tone to use, else FALSE
 * DESCRIPTION
 *    add string to list of tone values
 * RETURN VALUE
 *    NONE
 */
void set_tone_value(lp, tier, value, pOutputFP_in)
	 char *lp;
	 int   tier;
	 int   value;
	 FILE *pOutputFP_in;
{
  struct tone_value_list *tvp;

				/* check to see if new one is already in */
				/* the list */
  for (tvp = Tone_Value_List_Head;
	   tvp != (struct tone_value_list *)NULL;
	   tvp = tvp->tv_next)
	{
	  if (streq(lp, tvp->tv_str))
	{
	  fprintf(pOutputFP_in, "%sDuplicate tone value %s; will be ignored.",
		 errhead, lp);
	  return;
	}
	}
				/* allocate, initialize, and link-in new one */
  tvp = structalloc(tone_value_list);
  tvp->tv_str = duplicateString( lp );
  if (Tone_Value_List_Head == (struct tone_value_list *)NULL)
	{
	  tvp->tv_next = (struct tone_value_list *)NULL;
	  tvp->tv_value = 1;
	}
  else
	{
	  tvp->tv_next = Tone_Value_List_Head;
	  tvp->tv_value = (value) ? value
						  : Tone_Value_List_Head->tv_value + 1;
	}
  tvp->tv_tier = tier;

  Tone_Value_List_Head = tvp;

}	/* end set_tone_value */

/****************************************************************************
 * NAME
 *    show_all_edge_conds
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    show all user-defined edge conditions
 * RETURN VALUE
 *    NONE
 */
void show_all_edge_conds(pOutputFP_in)
	 FILE *pOutputFP_in;
{
  struct edge_cond_list *ecp;

  fprintf(pOutputFP_in, "\nEdge Conditions:");

  for (ecp = Edge_Cond_List_Head;
	   ecp != (struct edge_cond_list *)NULL;
	   ecp = ecp->ec_next)
	{
	  fprintf(pOutputFP_in, "\n    %s = %ld", ecp->ec_str, ecp->ec_value);
	}

}	/* end show_all_edge_conds */

/****************************************************************************
 * NAME
 *    show_edge_cond
 * ARGUMENTS
 *    ec - edge condition value
 * DESCRIPTION
 *    print string corresponding to edge condition value
 * RETURN VALUE
 *    NONE
 */
void show_edge_cond(ec, pOutputFP_in)
	 long ec;
	 FILE *pOutputFP_in;
{
  struct edge_cond_list *ecp;

  for (ecp = Edge_Cond_List_Head;
	   ecp != (struct edge_cond_list *)NULL;
	   ecp = ecp->ec_next)
	{
	  if (ec == ecp->ec_value)
	{
	  fprintf(pOutputFP_in, "%s", ecp->ec_str);
	  return;
	}
	}

  fprintf(pOutputFP_in, "Unknown edge condition (%ld)", ec);

}	/* end show_edge_cond */

/****************************************************************************
 * NAME
 *    show_tone
 * ARGUMENTS
 *    tp - pointer to a tone struct
 * DESCRIPTION
 *    show info in a tone struct
 * RETURN VALUE
 *    NONE
 */
void show_tone(FILE *pOutputFP_in, struct tone *tp)
{
  int tier;
  int tloc;

  if (tp == (struct tone *)NULL)
	return;

				/* (may want to add tbu's ? ) */
  for (tier = 0; tier < TIERS; tier++)
	{
	  if (tp->tone_status[tier])
	{
	  fprintf(pOutputFP_in, "\n\t%s %s (UL: %s) %s",
		  (tier == PRIMARY) ? "Primary " : "Register",
		  tone_type_name(tp->tone_status[tier]),
		  tone_type_name(tp->tone_ul_type[tier]),
		  tone_value_name(tp->tone_value[tier]));
	  if ((tloc = get_next_loc(tp->tone_ul_loc, (int)NULL)))
		{
		  fprintf(pOutputFP_in, " @ tbu");	/* show all locations */
		  for (;
		   tloc > 0;
		   tloc = get_next_loc(tp->tone_ul_loc, tloc))
		fprintf(pOutputFP_in, " %d", tloc);
		}
	  if (tp->tone_domain)
		fprintf(pOutputFP_in, " @ %s", tone_domain_name(tp->tone_domain));
	}
	}
}	/* end show_tone */

/****************************************************************************
 * NAME
 *    show_tone_seg_list
 * ARGUMENTS
 *    tsl - pointer to the head of a tone_seg_list
 * DESCRIPTION
 *    show info in a tone_seg_list struct
 * RETURN VALUE
 *    NONE
 */
void show_tone_seg_list(FILE *pOutputFP_in, struct tone_seg_list *tsl)
{
  struct tval_list *tvp;
  int tier;
  int count;
  int cl, cr;
  int might_need_hyphen;

  for (count = 0;
	   tsl != (struct tone_seg_list *)NULL;
	   tsl = tsl->ts_next, count++)
	{
	  might_need_hyphen = FALSE;
	  if (count)
	fprintf(pOutputFP_in, "\n\t\t\t\t\t\t");
	  for (tvp = tsl->ts_tval;
	   tvp != (struct tval_list *)NULL;
	   tvp = tvp->tvl_next)
	for (tier = 0; tier < TIERS; tier++)
	  if (tvp->tvl_value[tier] != (int)NULL)
		{
				/* determine if need floating symbol */
		  if (streq("right-floating",
			 tone_type_name(tvp->tvl_status[tier])))
		{
		  cl = NUL;
		  cr = '@';
		}
		  else if (streq("left-floating",
				 tone_type_name(tvp->tvl_status[tier])))
		{
		  cl = '@';
		  cr = NUL;
		}
		  else
		cl = cr = NUL;
				/* output hyphen for tone pairs if needed */
				/* (hyphen needed when last was a linked
				   register tone and this is a linked primary
				   tone) */
		  if (might_need_hyphen && cr == NUL && cl == NUL && tier == 0)
		{
		  putc('-', pOutputFP_in);
		  might_need_hyphen = FALSE;
		}
		  else
		putc(' ', pOutputFP_in);
		  if (cl != NUL)
		putc(cl, pOutputFP_in);
		  fprintf(pOutputFP_in, "%s",
			  tone_value_name(tvp->tvl_value[tier]));
		  if (cr != NUL)
		putc(cr, pOutputFP_in);
		  if (cr == NUL && cl == NUL && tier == 1)
		might_need_hyphen = TRUE;
		}
	  fprintf(pOutputFP_in, " = %s", tsl->ts_str);
	}
}	/* end show_tone_seg_list */

/****************************************************************************
 * NAME
 *    showTones
 * ARGUMENTS
 *    tlp - pointer to head of tone_list struct
 * DESCRIPTION
 *    show info in tones in a list of tones
 * RETURN VALUE
 *    NONE
 */
void showTones(FILE *pOutputFP_in, struct tone_list *tlp)
{
	 for ( ; tlp != (struct tone_list *)NULL; tlp = tlp->tonl_right)
	   {
	 show_tone(pOutputFP_in, tlp->tonl_tone);
	   }

}	/* end showTones */

/****************************************************************************
 * NAME
 *    show_tone_type_list
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    show all user-defined tone types
 * RETURN VALUE
 *    NONE
 */
void show_tone_type_list(FILE *pOutputFP_in)
{
  struct tone_type_list *ttp;

  fprintf(pOutputFP_in, "\nTone Types:");

  for (ttp = Tone_Type_List_Head;
	   ttp != (struct tone_type_list *)NULL;
	   ttp = ttp->tt_next)
	{
	  fprintf(pOutputFP_in, "\n    %s", ttp->tt_str);
	}

}	/* end show_tone_type_list */

/****************************************************************************
 * NAME
 *    show_tone_value_list
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    show all user-defined tone values
 * RETURN VALUE
 *    NONE
 */
void show_tone_value_list(FILE *pOutputFP_in)
{
  struct tone_value_list *tvp;

  fprintf(pOutputFP_in, "\nTone Values:");

  for (tvp = Tone_Value_List_Head;
	   tvp != (struct tone_value_list *)NULL;
	   tvp = tvp->tv_next)
	{
	  fprintf(pOutputFP_in, "\n    %s\t(%s tier)", tvp->tv_str,
		 (tvp->tv_tier == PRIMARY)  ? "primary" :
			 (tvp->tv_tier == REGISTER) ? "register" : "primary/register" );
	  fprintf(pOutputFP_in, "  value = %d", tvp->tv_value);
	}

}	/* end show_tone_value_list */

/****************************************************************************
 * NAME
 *    spread_tone
 * ARGUMENTS
 *    tp     - pointer to the tone
 *    tier   - tier tone is on
 *    params - mode, direction, iteration, OCP
 *    domain - domain within which the spreading applies
 *    status - status to which to set the tone
 *    ap     - pointer to analysis struct
 *    pwp    - pointer to prosodic word
 * DESCRIPTION
 *    spread a tone to the left or right:
 *      link the tone to the tbu that immediately precedes the tone's
 *      leftmost tbu or
 *      link the tone to the tbu that immediately follows the tone's
 *      rightmost tbu
 * RETURN VALUE
 *    pointer to "edgemost" tbu of the tone (the one the tone spread from)
 */
struct tbu *spread_tone(tp, tier, params, domain, status, ap, pwp,
			pOutputFP_in)
	 struct tone      *tp;
	 int               tier;
	 int               params;
	 struct domain_id *domain;
	 int               status;
	 StampAnalysis  *ap;
	 struct pword     *pwp;
	 FILE *pOutputFP_in;
{
  struct tbu *tbp, *tbpf, *tbpl;
  struct tbu_list *tblp;
  int         mode;
  int         direction;
  int         iter;
  int         ocp;

				/* check for invalid data */
  if (tp                     == (struct tone     *)NULL ||
	  (tblp = tp->tone_tbul) == (struct tbu_list *)NULL ||
	  (tbp = tblp->tbul_tbu) == (struct tbu      *)NULL)
	return((struct tbu *)NULL);

				/* ignoring domain and ocp for now */
  domain = domain;		/* *** needs more work *** */
  iter   = ITERATION(params);
  ocp    = OCP(params);
  mode   = MODE(params);
  direction = DIRECTION(params);

				/* determine first (tbpf) and last (tbpl) tbus
				   that the tone should spread to */
  if (iter == ITERATIVELY)
	if (ap == (StampAnalysis *)NULL)
	  {				/* non-cyclic rule */
	if (direction == LEFTWARD)
	  {
		tbpf = tbp->tbu_left;	/* first tbu is to the left */
		tbpl = pwp->wd_tbu;		/* last tbu is first tbu of word */
	  }
	else
	  {				/* first tbu is to the right of the
					   rightmost one */
		tbpf = end_of_tbu_list(tblp)->tbul_tbu->tbu_right;
		tbpl = end_of_tbus(tbp);    /* last tbu is last tbu of word */
	  }
	  }
	else			/* cyclic rule */
	  {
	if (direction == LEFTWARD)
	  {
		tbpf = tbp->tbu_left;	/* first tbu is to the left */
		tbpl = ap->pTBUBeg;		/* last tbu is first tbu of morpheme */
	  }
	else
	  {				/* first tbu is the the right of the
					   rightmost one */
		tbpf = end_of_tbu_list(tblp)->tbul_tbu->tbu_right;
		tbpl = ap->pTBUEnd;         /* last tbu is last tbu of morpheme */
	  }
	  }
  else				/* is not iterative */
				/* (ignoring edge_in and one_to_one for now) */
	{				/* so cyclic and non-cyclic are the same */
	  if (direction == LEFTWARD)
	{
	  tbpf = tbpl = tbp->tbu_left;	/* both tbus are to the left */
	}
	  else
	{			/* both tbus are to the right of the
				   rightmost one */
	  tbpf = tbpl = end_of_tbu_list(tblp)->tbul_tbu->tbu_right;
	}
	}
				/* link tone to the appropriate tbu(s) */
  if (direction == LEFTWARD)
	{
	  for (tbp = tbpf;
	   tbp != (struct tbu *)NULL &&
	   tbp->tbu_right != tbpl;
	   tbp = tbp->tbu_left)
	{
	  if (!link_tone_to_tbu(tp, tier, params, tbp, TAIL, ap, status,
				pOutputFP_in))
		break;
	}
	}
  else
	{
	  for (tbp = tbpf;
	   tbp != (struct tbu *)NULL &&
	   tbp->tbu_left != tbpl;
	   tbp = tbp->tbu_right)
	{
	  if (!link_tone_to_tbu(tp, tier, params, tbp, HEAD, ap, status,
				pOutputFP_in))
		break;
	}
	}

  return(tbp);			/* return tbu from which tone spread */

}	/* end spread_tone */

/*************************************************************************
 * NAME
 *    tbu_has_tone
 * ARGUMENTS
 *    tbp    - pointer to tbu struct
 *    tier   - primary and/or register tier
 *    status - status of tones
 *    value  - values of tones
 * DESCRIPTION
 *    checks to see if the tbu has a tone with the given status and value.
 * RETURN VALUE
 *    pointer to the (first) tone struct if such a tone is found
 *    NULL otherwise
 */
struct tone *tbu_has_tone(tbp, tier, status, value)
	 struct tbu *tbp;
	 int         tier;
	 char       *status;
	 char       *value;
{
  struct tone_list *tlp;

  for (tlp = tbp->tbu_tonel;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	{
	  if (streq(status,
			 tone_type_name(tlp->tonl_tone->tone_status[tier])) &&
	  streq(value,
			 tone_value_name(tlp->tonl_tone->tone_value[tier])))
	return(tlp->tonl_tone);
	}

  return((struct tone *)NULL);

}	/* end tbu_has_tone */

/****************************************************************************
 * NAME
 *    tone_domain_name
 * ARGUMENTS
 *    td - domain value
 * DESCRIPTION
 *    get string corresponding to tone domain value
 * RETURN VALUE
 *    pointer to tone domain name
 */
char *tone_domain_name(td)
	 int td;
{
  struct tone_domain_list *tdp;

  for (tdp = Tone_Domain_List_Head;
	   tdp != (struct tone_domain_list *)NULL;
	   tdp = tdp->td_next)
	{
	  if (td == tdp->td_domain)
	return(tdp->td_str);
	}

  return( (char *)NULL);

}	/* end tone_domain_name */

/****************************************************************************
 * NAME
 *    tone_has_no_rep
 * ARGUMENTS
 *    tp    - pointer to tone struct
 *    build_flags - various word building flags
 * DESCRIPTION
 *    check to see if the tone has any representation given the value
 *    of build_flags (SHOW_DERIVATION or SHOW_ORTHOGRAPHY)
 * RETURN VALUE
 *    TRUE if there is no representation
 *    FALSE otherwise
 */
static int tone_has_no_rep(tp, build_flags)
	 struct tone *tp;
	 int          build_flags;
{
  struct tone_type_list *ttp;

  for (ttp = Tone_Type_List_Head;
	   ttp != (struct tone_type_list *)NULL;
	   ttp = ttp->tt_next)
	{
	  if ((tp->tone_status[PRIMARY]  == ttp->tt_type ||
	   tp->tone_status[REGISTER] == ttp->tt_type   )   &&
	  ttp->tt_show & build_flags)
	return(FALSE);
	}

  return(TRUE);

}	/* end tone_has_no_rep */

/****************************************************************************
 * NAME
 *    tone_id
 * ARGUMENTS
 *    tp    - pointer to tone struct
 *    tier  - primary/register tier
 *    type  - type  of tone to be checked
 *    value - value of tone to be checked
 * DESCRIPTION
 *    check to see if the tone has the type and value given
 *    (If value is NULL, it means "I don't care about the value;
 *	 just match the type."
 *     If type is NULL, it means, "I don't care about the type;
 *       just match the value."
 *     If both type and value are NULL, return FALSE; there is nothing
 *       to check.)
 * RETURN VALUE
 *    TRUE if it does
 *    FALSE otherwise
 */
int tone_id(tp, tier, type, value)
	 struct tone *tp;
	 int          tier;
	 char        *type;
	 char        *value;
{
  int is_type, is_value;
				/* check for invalid structs */
  if (tp == (struct tone *)NULL)
	return(FALSE);
				/* see if value is correct */
  is_value = tp->tone_value[tier] != (int)NULL &&
			 value != (char *)NULL             &&
			 streq(value, tone_value_name(tp->tone_value[tier]));

				/* see if type is correct */
  is_type  = tp->tone_status[tier] != (int)NULL &&
			 type != (char *)NULL               &&
			 streq(type, tone_type_name(tp->tone_status[tier]));

				/* return appropriate combination */
  if (type == (char *)NULL)
	return( is_value );
  else if (value == (char *)NULL)
	return( is_type );
  else
	return( is_value && is_type );

}	/* end tone_id */

/****************************************************************************
 * NAME
 *    tone_matches
 * ARGUMENTS
 *    tp  - pointer to tone struct
 *    tip - pointer to tone id struct
 * DESCRIPTION
 *    determine if the tone struct is equivalent to the tone_id struct
 * RETURN VALUE
 *    TRUE  if they match
 *    FALES otherwise
 */
int tone_matches(tp, tip)
	 struct tone *tp;
	 struct tone_id *tip;
{
  int tier, stier;

  if (tip == (struct tone_id *)NULL ||
	  tip->ti_value == (struct tone_value_list *)NULL ||
	  tp  == (struct tone *)NULL)
	return(FALSE);

				/* get tier */
  tier = tip->ti_value->tv_tier;

  if (tip->ti_status != 0)
	{				/* check status if appropriate */
	  stier = (tier == PRIMARY) ? PRIMARY : REGISTER;
	  if (tip->ti_status == Floating)
	{
	  if (tp->tone_status[stier] != LeftFloating &&
		  tp->tone_status[stier] != RightFloating &&
		  tp->tone_status[stier] != Floating)
		return(FALSE);
	}
	  else if (tp->tone_status[stier] != tip->ti_status)
	return(FALSE);
	}

  if (tier == BOTH_TIERS)
	{
	  if ((tp->tone_value[REGISTER] * BOTH_AUGMENT) + tp->tone_value[PRIMARY]
											  != tip->ti_value->tv_value)
	return(FALSE);
	}
  else if (tp->tone_value[tier] != tip->ti_value->tv_value)
	return(FALSE);

  return(TRUE);

}	/* end tone_matches */

/****************************************************************************
 * NAME
 *    tone_type_name
 * ARGUMENTS
 *    tt - type value
 * DESCRIPTION
 *    get string corresponding to tone type value
 * RETURN VALUE
 *    pointer to tone type name
 */
char *tone_type_name(tt)
	 int tt;
{
  struct tone_type_list *ttp;

  for (ttp = Tone_Type_List_Head;
	   ttp != (struct tone_type_list *)NULL;
	   ttp = ttp->tt_next)
	{
	  if (tt == ttp->tt_type)
	return(ttp->tt_str);
	}

  return( "none");

}	/* end tone_type_name */

/****************************************************************************
 * NAME
 *    tone_value_name
 * ARGUMENTS
 *    tv - value value
 * DESCRIPTION
 *    get string corresponding to tone value value
 * RETURN VALUE
 *    pointer to tone value name
 */
char *tone_value_name(tv)
	 int tv;
{
  struct tone_value_list *tvp;

  for (tvp = Tone_Value_List_Head;
	   tvp != (struct tone_value_list *)NULL;
	   tvp = tvp->tv_next)
	{
	  if (tv == tvp->tv_value)
	return(tvp->tv_str);
	}

  return( "none");

}	/* end tone_value_name */

/****************************************************************************
 * NAME
 *    trace_tone_tier
 * ARGUMENTS
 *    t_tier_headp - pointer to head of tone tier
 *    tier         - primary/register tier
 * DESCRIPTION
 *    print tracing info on tone tier
 * RETURN VALUE
 *    NONE
 */
void trace_tone_tier(pStamp_in, t_tier_headp, tier)
	 StampData *pStamp_in;
	 struct tone_list *t_tier_headp;
	 int tier;
{
  struct tone_list *tlp;
  struct tbu_list  *tbul;

  if (t_tier_headp == (struct tone_list *)NULL)
	return;

  fprintf(pStamp_in->pLogFP,
	  "\n      %s Tone tier tones are:", (tier) ? "Register" : "Primary ");
  for (tlp = t_tier_headp;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	{
	  show_tone(pStamp_in->pLogFP, tlp->tonl_tone);
	  fprintf(pStamp_in->pLogFP, " and is linked to these tbus:");
	  for (tbul = tlp->tonl_tone->tone_tbul;
	   tbul != (struct tbu_list *)NULL;
	   tbul = tbul->tbul_next)
	show_tbu(tbul->tbul_tbu, pStamp_in);

	}

}	/* end trace_tone_tier */
