/* TONEANAL.C - Tone Parser: tone analysis routines
 *
 *	Andy Black
 *	12-Oct-93
 *
 ***************************************************************************
 *
 *      int main( argc, argv )
 *           int argc;
 *           char **argv;
 *
 *      static void initialize(progname)
 *           char *progname;
 *
 *      static int load_ctl_file(fname)
 *           char *fname;
 *
 *      static void parse_cmd_line( argc, argv )
 *           int argc;
 *           char **argv;
 *
 *      static void process()
 *
 *      static char *set_filename(filename, default_name, extension)
 *           char *filename;
 *           char *default_name;
 *           char *extension;
 *
 *      static void usage(progname)
 *           char *progname;
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	12-Oct-93	hab - initial coding based on phongen.c and stamp code
 *      27-Feb-95 0.1.46 hab- MIXTEC: fine-tune h association exceptions for
 *                                    3 syllable words
 ***************************************************************************
 * Copyright 1995 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "stamp.h"
#include "tonepars.h"
#include "domain.h"
#include "trule.h"

				/* maximum number of ambiguities we can */
				/* handle now (later: dynamically allocate */
				/* space when needed) */
#define MAX_ANALYSES  4096

#ifdef __STDC__

typedef int (*COMPARISON)(const void *, const void *);
#else
#ifdef _MSC_VER
typedef int (*COMPARISON)(const void *, const void *);
#else
typedef int (*COMPARISON)();
#endif
#endif

/********************* TONEANAL EXTERN FUNCTIONS *********************/

#ifdef ORIGTP
			/* cportlib */
extern int max P(( int i, int j));
#else  /* ORIGTP */
#ifdef __GNUC__
#define max(a, b)  (((a) > (b)) ? (a) : (b))
#endif /* __GNUC__ */
#endif /* ORIGTP */
			/* categ.c */
extern int   find_cat P((char *name));
extern char *cat_name P((int catnum));

			/* domain.c */
extern struct domain *build_domains P((StampAnalysis *ap, char *origword,
					   int               do_trace));
extern struct domain *find_domain  P((struct domain *dp, char *dname));
extern void           free_domains P((struct domain *dp));
extern int tone_is_in_domain       P((struct tone *tp, int tbu_type,
					  struct domain *dp_head, char *dname));

			/* dtbin.c */
extern WordTemplate *dtbin P(());

				/* mora.c */
extern void mora_assignment P((struct root_node *rn, int do_trace,
				   StampData *pStamp_in));
extern int  has_n_moras P((StampAnalysis  *ap,
			   int               count));

				/* segparse.c */
extern struct root_node *segment_parse P((char *word,
					  struct segment_list *Segments,
					  int trace,
					  StampData *pStamp_in));

			/* strlist.c */
struct strlist *remove_element_from_strlist P((struct strlist *list,
						   struct strlist *element));

			/* syllable.c */
extern void syllable_parse P((struct root_node *rn,
				  int do_trace,
				  StampData *pStamp_in));

			/* pword.c */
extern void free_pword P((struct pword *pwp));
extern void init_pword P((struct pword *pwp));

			/* syllable.c */
extern int has_coda P((struct syllable *sp));
extern int has_n_syllables P((StampAnalysis  *ap,
				  int               count));
extern int has_onset P((struct syllable *sp));

			/* tbu.c */
extern struct tbu *build_tbus P((struct syllable *sylp,
					 int do_trace, StampData *pStamp_in));
extern struct tbu_list *end_of_tbu_list P((struct tbu_list *tbhp));
extern struct tbu      *end_of_tbus   P((struct tbu *tbhp));
extern void free_tbus P((struct tbu *tbu_headp));
extern struct tbu *get_edge_tbu    P((struct root_node *rbeg,
					  struct root_node *rend,
					  int tbu_type, int edge));
extern void             show_tbu      P((struct tbu *tbup,
					 StampData *pStamp_in));
extern void             show_tbus     P((struct tbu *tbu_headp,
					 StampData *pStamp_in));
extern int              tbu_has_tone_id P((struct tbu     *tbp,
					   struct tone_id *tip));
extern int              tbu_has_under_tone_id P((struct tone_list *tlp,
						 int               tbu_num,
						 struct tone_id   *tip));
extern int              tbu_in_morpheme P((struct tbu      *tbp,
					   StampAnalysis *ap));

			/* tone.c */
extern struct tone *add_tone P(());
extern struct tone_list *add_tone_list    P((struct tone_list *tl_headp,
						 int head, struct tone *tp));
extern struct tone *add_tone_node P((struct tone *tn_headp,
					 int          head,
					 struct tone *tp));
#ifndef B4_0_4_4
extern void            adjust_morpheme_tone_pointers P((StampAnalysis *ap,
							struct tone     *tp,
							struct tbu      *tbu,
							int           action));
#endif /* B4_0_4_4 */
extern char *build_word_with_tone_marked P((struct root_node *rnp,
						int               tbu_type,
						int               build_flags,
						int               do_trace,
						FILE             *pOutputFP_in));
extern struct tone      *copy_tone        P((struct tone *otp));
extern struct tone_list *copy_tone_list   P((struct tone_list *tl_headp));
extern void   delete_tone P((struct tone  *tp,
				 struct pword *pwp));
extern void   delink_tone_from_tbu P((struct tone *tp, int tier,
					  struct tbu *tbu));
extern void                 draw_tone_diagram P((struct pword *pwp,
						 FILE *pOutputFP_in));
extern struct tone_list *end_of_tone_list P((struct tone_list *tlhp));
extern struct tone *end_of_tone_nodes P((struct tone *tn_headp));
extern struct tval_list *end_of_tval_list P((struct tval_list *tvhp));
extern int   every_tbu_has  P((StampAnalysis  *ap,
				   int         tier,
				   char       *status,
				   char       *value));
	   int   find_tone_domain P((char *cp));
extern int   find_tone_domain P((char *cp));
extern int   find_tone_type   P((char *cp));
extern int   find_tone_value  P((char *cp, int *tier));
extern void free_tone      P((struct tone      *tp));
extern void free_tone_list P((struct tone_list *tlp));
extern void free_tones_in_anal P((StampAnalysis *ap));
extern struct tone          *get_edge_tone P((StampAnalysis *ap,
						  int              tier,
						  int              edge));
extern int get_max_edge_conds    P((void));
#ifndef B4_0_4_4
extern struct tone          *get_morphs_nearest_tone P((StampAnalysis *ap,
							int             edge));
#endif
extern int get_next_loc    P((char *bitmap, int loc));
extern struct tone *get_previous_tone P((struct tbu *tbp,
					 int         edge));
extern int  has_linked_high_tones P((StampAnalysis  *ap));
extern struct tone *insert_tone P((struct tone *tn_headp,
				   struct tone *tp,
				   struct tone *tp_left));
extern struct tone_list *insert_tone_list P((struct tone_list *tl_headp,
						 int tier,
						 struct tone      *tp));
extern int    is_in_tone_list P((struct tone *tp, struct tone_list *tlhp));
extern int   last_two_tones_are P((struct tbu *tbp,
				   int         tier,
				   char       *status1,
				   char       *value1,
				   char       *status2,
				   char       *value2));
extern int   link_tone_to_tbu P((struct tone     *tp,
				 int              tier,
				 int              params,
				 struct tbu      *tbu,
				 int              tbu_head,
				 StampAnalysis *ap,
				 int              status));
#ifndef B4_0_4_4
	   int                   morph_has_tone_id P((StampAnalysis *ap,
						  struct tone_id  *tip));
#endif /* B4_0_4_4 */
extern struct tone *remove_tone_node P((struct tone *tn_headp,
					struct tone *tp));
extern void  show_edge_cond   P((long ec, FILE *pOutputFP_in));
extern void              show_tone P((FILE *pOutputFP_in, struct tone *tp));
extern struct tbu *spread_tone P((struct tone      *tp,
				  int               tier,
				  int               params,
				  struct domain_id *domain,
				  int               status,
				  StampAnalysis  *ap,
				  struct pword     *pwp));
extern char *tone_domain_name P((int td));
extern int   tone_id          P((struct tone *tp, int tier, char *type,
				 char *value));
extern int   tone_matches P((struct tone *tp,
				 struct tone_id *tip));
extern char             *tone_type_name   P((int td));
extern void trace_tone_tier P((StampData *pStamp_in,
				   struct tone_list *t_tier_headp, int tier));

			/* tsdict.c */
extern struct morpheme *search_dict P((unsigned char type, char *name,
					   unsigned char category));

			/* trule_yg.y */
extern struct cycle *get_default_cycle P((void));
extern struct tone_rule *get_edge_cond_rule_head P(( void ));
extern struct tone_rule *get_tone_rule_head P(( void ));
extern struct tone_rule *get_tone_rule_tail P(( void ));
extern void              show_rule_action P((struct action *ap));


			/* tsutil.c */
extern void freeStampAnalysis P((StampAnalysis *analp));

extern long decapitalizeWord P((WordTemplate *       pWord_io,
				const TextControl *  pTextCtl_in));

/********************* TONEANAL INTERNAL FUNCTIONS *********************/

#ifndef hab104
static void apply_rule P((struct tone_rule     *trp,
			  StampAnalysis      *ap_orig,
			  WordTemplate *word,
			  struct pword         *pwp,
			  struct domain        *dp,
			  int                   tbu_type,
			  long                 *edge_conds,
			  int                   do_trace,
			  WordAnalysis         *pWordAnal_in,
			  StampData            *pStamp_in));
static void apply_tone_rules P((StampAnalysis *ap_head,
				WordTemplate *word,
				struct pword    *pwp,
				struct domain   *dp,
				int              tbu_type,
				long            *edge_conds,
				int              which_rules,
				int              do_trace,
				WordAnalysis    *pWordAnal_in,
				StampData       *pStamp_in));
#else /* hab104 */
static void apply_rule P((struct tone_rule     *trp,
			  StampAnalysis      *ap_orig,
			  WordTemplate *word,
			  struct pword         *pwp,
			  struct domain        *dp,
			  int                   tbu_type,
			  long                 *edge_conds,
			  int                   do_trace,
			  StampData            *pStamp_in));
static void apply_tone_rules P((StampAnalysis *ap_head,
				WordTemplate *word,
				struct pword    *pwp,
				struct domain   *dp,
				int              tbu_type,
				long            *edge_conds,
				int              which_rules,
				int              do_trace,
				StampData       *pStamp_in));
#endif /* hab104 */
#ifndef hab106
static void             assign_lexical_tone_to_tbus P((StampAnalysis *ap,
						 struct tone     *tp,
						 int tbu_type,
						 int do_trace,
						 StampData *pStamp_in));
#else
static void             assign_lexical_tone_to_tbus P((StampAnalysis *ap,
						 struct tone     *tp,
						 int tbu_type,
						 StampData *pStamp_in));
#endif /* hab106 */
#ifdef TONEGEN
static char *build_decomp_string P((StampAnalysis *ap_head,
					StampData     *pStamp_in));
#endif /* TONEGEN */
static void build_tone_tier P((struct pword    *pwp,
				   StampAnalysis *ap_head,
				   int do_trace,
				   StampData *pStamp_in));
#ifndef hab104
static long calculate_edge_conds P((StampAnalysis      *ap,
				   struct pword         *pword,
				   struct domain        *dp,
				   WordTemplate *word,
				   long                  old_edge_conds,
				   int                   tbu_type,
				   int                   do_trace,
				   WordAnalysis         *pWordAnal_in,
				   StampData            *pStamp_in));
#else /* hab104 */
static long calculate_edge_conds P((StampAnalysis      *ap,
				   struct pword         *pword,
				   struct domain        *dp,
				   WordTemplate *word,
				   long                  old_edge_conds,
				   int                   tbu_type,
				   int                   do_trace,
				   StampData            *pStamp_in));
#endif /* hab104 */
static int compare P((long *a, long *b));
	   void              copy_morpheme_info P((StampAnalysis *ap,
						   StampMorpheme *mp));
static int do_existing_tone_action P((struct tone     *trb,
					  struct action   *acp,
					  StampAnalysis *ap,
					  struct pword    *pwp));
#ifndef hab104
static void do_rules P((struct tone_rule     *trb,
			struct tone_rule     *tre,
			StampAnalysis      *ap,
			WordTemplate *word,
			struct pword         *pwp,
			struct domain        *dp,
			int                   tbu_type,
			long                 *edge_conds,
			int                   rule_type,
			int                   which_rules,
			int                   do_trace,
			WordAnalysis         *pWordAnal_in,
			StampData            *pStamp_in));
#else /* hab104 */
static void do_rules P((struct tone_rule     *trb,
			struct tone_rule     *tre,
			StampAnalysis      *ap,
			WordTemplate *word,
			struct pword         *pwp,
			struct domain        *dp,
			int                   tbu_type,
			long                 *edge_conds,
			int                   rule_type,
			int                   which_rules,
			int                   do_trace,
			StampData            *pStamp_in));
#endif /* hab104 */
	   void do_tone_anal P((StampUnit *pUnit_in,
				int do_trace,
				StampData *pStamp_in));
static struct tone_list *extract_reg_tone_tier P((struct tone_list **t_tier_prim,
						  int           do_trace,
						  StampData *pStamp_in));
static struct root_node *get_end_of_allo P((char *ap, struct root_node *rp));
static void              get_next_allo   P((char *ap, char *dp,
						StampData *pStamp_in));
static StampAnalysis  *get_morph_pos          P((int pos,
						 StampData *pStamp_in));
static struct tone      *get_tone_pos           P((int pos));
	   void init_tone_rule_types P((void));
static int is_phrase_final   P((WordTemplate *word,
				StampData *pStamp_in));
static int is_phrase_initial P((WordTemplate *word,
				StampData *pStamp_in));
static void link_anal_to_rns P((StampAnalysis *ap_head,
				char *dp_head,
				struct root_node *rp_head,
				int do_trace, StampData *pStamp_in));
static struct tbu *link_anal_to_tbus P((StampAnalysis  *ap_head,
					int               tbu_type,
					struct tbu       *tbu_headp,
					int               do_trace,
					StampData        *pStamp_in));
#ifdef ORIGTP
static StampAnalysis *parse_analysis P((char *analstring,
					FILE *pOutputFP_in));
#else  /* ORIGTP */
extern StampAnalysis *parse_analysis P((char *analstring,
					StampData *pStamp_in));

#endif /* ORIGTP */
static WordTemplate *remove_bad_anal P((WordTemplate *word,
					WordAnalysis *anp));
static StampAnalysisList *remove_bad_tranal P((StampAnalysisList *list,
						   StampAnalysisList *tranp));
static char *reconstruct_word P((char *decomp, StampData *pStamp_in));
#ifndef hab104
static int rule_condition_met P((struct tone_rule *trp,
				 StampAnalysis  *ap,
				 struct pword     *pwp,
				 struct domain    *dp,
				 int               tbu_type,
				 long              edge_conds,
				 struct tone      *tp,
				 WordAnalysis     *pWordAnal_in,
				 StampData *pOutputFP_in));
#else /* hab104 */
static int rule_condition_met P((struct tone_rule *trp,
				 StampAnalysis  *ap,
				 struct pword     *pwp,
				 struct domain    *dp,
				 int               tbu_type,
				 long              edge_conds,
				 struct tone      *tp,
				 StampData *pOutputFP_in));
#endif /* hab104 */
static void show_edge_conds P((FILE *pOutputFP_in, long conds));
#ifndef hab104
static int tone_anal P((StampAnalysis *anal_head,
			WordTemplate *word,
			WordAnalysis         *WordAnal_in,
			long                  edge_conds,
			long                 *new_edge_conds,
			int                   which_rules,
			int                   do_trace,
			StampUnit            *pUnit_in,
			StampData            *pStamp_in));
#else /* hab104 */
static int tone_anal P((StampAnalysis *anal_head,
			WordTemplate *word,
			char                 *decompstring,
			long                  edge_conds,
			long                 *new_edge_conds,
			int                   which_rules,
			int                   do_trace,
			StampUnit            *pUnit_in,
			StampData            *pStamp_in));
#endif /* hab104 */
static void trace_msg P((FILE *pOutputFP_in, char *msg));
#ifndef hab104
static int  utest P((struct cond_node *cond,
			 WordAnalysis     *pWordAnal_in,
			 StampData *pOutputFP_in));
#else /* hab104 */
static int  utest P((struct cond_node *cond,
			 StampData *pOutputFP_in));
#endif /* hab104 */
#undef P

#ifndef hab104
#ifndef TONEGEN
static void addANAProperties(char *pszANAProps,
				 StampAnalysis *pMorphs,
				 StampData *pStamp_in);
#endif /* TONEGEN */
#endif /* hab104 */

/********************* TONEANAL EXTERN VARIABLES *********************/

extern char myalloc_errmsg[];           /* myalloc() error message  */
extern int  do_debug;           /* do we dump huge amounts of stuff? */
extern char root_begin;          /* delimiter for beginning roots */
extern char root_end;            /* delimiter for ending roots */

				/* tone type values */
extern int Linked;
extern int Floating;
extern int LeftFloating;
extern int RightFloating;
extern int Boundary;
extern int Delinked;
extern int Melody;

/********************* TONEANAL STATIC VARIABLES *********************/

static struct tone_rule *trh, *trt, *trcybeg, *trcyend;

#ifdef ORIGTP
static char errhead[] = "\nINPUT ANALYSIS FILE: ";
static StampAnalysis *lefthead;
static StampAnalysis *righthead;
#endif /* ORIGTP */

static struct tone_rule*t_rule; 	/* rule_condition_met(trp ...) */
static StampAnalysis *t_current;	/* rule_condition_met(... ap ...) */
static struct pword    *t_pwp;		/* rule_condition_met(... pwp ...) */
static struct domain   *t_dp;		/* rule_condition_met(... dp ...) */
static long             t_edgeconds;	/* rule_condition_met( edgeconds ) */
static int              t_tbutype;      /* rule_condition_met( tbu_type ) */
static struct tone     *t_tone;   	/* rule_condition_met(... tp...) */
#ifndef hab104
static WordAnalysis    *t_wordanal;	/* rule_condition_met(...pWordAnal_in) */
#endif /* hab104 */

static char *tsterrhead = "\nTONE_TEST: "; /* header for test error messages */

static long Max_Edge_Conds;
static long next_edge_conds;	/* edge conditions for following word */

static struct cycle *cycle;

static int try_optional_rules;    /* whether or not to try right edge rules */

#define NON_RIGHT 1
#define RIGHT_RULES 2
#define ALL_RULES 3

#ifndef hab105
StampAnalysis *		pForLeft_m;	/* used in FOR_*_LEFT */
StampAnalysis *		pForRight_m;	/* used in FOR_*_RIGHT */
#endif /*hab105 */

/****************************************************************************
 * NAME
 *    apply_rule
 * ARGUMENTS
 *    trp          - pointer to tone rule to apply
 *    ap_orig      - pointer to analysis struct
 *    word         - pointer to word template struct
 *    pwp          - pointer to prosodic word struct
 *    dp           - pointer to head of domain tree
 *    tbu_type     - type of tone bearing unit
 *    edge_conds   - flag indicating whether various edge conditions are met
 *                   (i.e. if the structural descriptions of rules are met by
 *                    the preceding context)
 *    do_trace     - tracing flag
 *    pWordAnal_in - pointer to Word analysis struct
 * DESCRIPTION
 *    apply the indicated rules to the morpheme or morphemes
 * RETURN VALUE
 *    NONE
 */
#ifndef hab104
static void apply_rule(trp, ap_orig, word, pwp, dp, tbu_type, edge_conds,
			 do_trace, pWordAnal_in, pStamp_in)
#else /* hab104 */
static void apply_rule(trp, ap_orig, word, pwp, dp, tbu_type, edge_conds,
			 do_trace, pStamp_in)
#endif /* hab104 */
	 struct tone_rule     *trp;
	 StampAnalysis      *ap_orig;
	 WordTemplate *word;
	 struct pword         *pwp;
	 struct domain        *dp;
	 int                   tbu_type;
	 long                 *edge_conds;
	 int                   do_trace;
#ifndef hab104
	 WordAnalysis         *pWordAnal_in;
#endif /* hab104 */
	 StampData            *pStamp_in;
{
  struct action    *acp;
  StampAnalysis  *ap, *ap_action;
  struct domain_id *dip;
  struct tone      *tp, *last_tp, *beg_tp;
#ifndef ORIG
  struct tone      *tpNext;
#endif /* ORIG */
  struct tone_id   *tip;
  struct tbu       *tbp;
  struct tone_list *tlp;
  char             *errmsg = "\nTONE_RULE: ";
  int               tier;
  int               params;
  int               tbu_head;
  int               did_action;
#ifndef B4_0_4_4
  int               inserted_at;
#endif /* B4_0_4_4 */

  trp->tr_tried++;		/* keep statistics */

#ifndef hab104
  if (ap_orig != (StampAnalysis *)NULL &&
	  !rule_condition_met(trp, ap_orig, pwp, dp, tbu_type, *edge_conds,
				 (struct tone *)NULL, pWordAnal_in, pStamp_in))
#else /* hab104 */
  if (ap_orig != (StampAnalysis *)NULL &&
	  !rule_condition_met(trp, ap_orig, pwp, dp, tbu_type, *edge_conds,
				 (struct tone *)NULL, pStamp_in))
#endif /* hab104 */
	return;

  did_action = FALSE;	/* assume the action will not do anything */

				/* for each action in the rule... */
  for (acp = trp->tr_action;
	   acp != (struct action *)NULL;
	   acp = acp->ac_next)
	{
				/* a little paranoid check */
	  if (acp->ac_op != SET_EDGE_COND &&
	  (acp->ac_tone == (struct tone_id *)NULL ||
	   acp->ac_tone->ti_value == (struct tone_value_list *)NULL))
	{
	  fprintf(pStamp_in->pLogFP,
		  "%sRule %s has corrupted tone id! Program error!",
		  errmsg, trp->tr_name);
	  return;
	}
				/* reset analysis pointer in case */
	  ap = ap_orig;		/* it got changed */

	  switch(acp->ac_op)
	{
	case SET_EDGE_COND:
#ifdef B4_0_5_5
	  next_edge_conds += acp->ac_econds;	/* set the edge condition */
#else
	  next_edge_conds |= acp->ac_econds;	/* set the edge condition */
#endif /* B4_0_5_5 */
	  did_action = TRUE;
	  break;

	case ASSOCIATE:		/* associate means insert and link */
	case INSERT:		/* insert means insert and use tone's status */
				/* need to insert a new tone */
	  params = acp->ac_params;
#ifndef B4_0_4_4
	  inserted_at = -1;	/* initialize */
#endif /* B4_0_4_4 */
				/* find preceding tone and also the
				   tbu to line it up with */
	  if (ap == (StampAnalysis *)NULL)
		{			/* is non-cyclic */
		  if (DIRECTION(acp->ac_params) == LEFTWARD)
				/* insert at right end of list of tones */
		{
		  last_tp = end_of_tone_nodes(pwp->wd_tones);
				/* get final tbu */
		  for (tbp = pwp->wd_tbu;
			   tbp != (struct tbu *)NULL &&
			   tbp->tbu_right != (struct tbu *)NULL;
			   tbp=tbp->tbu_right)
			;
		  tbu_head = TAIL;
		}
		  else		/* insert at front of word */
		{
		  last_tp = (struct tone *)NULL;
		  tbp = pwp->wd_tbu;
		  tbu_head = HEAD;
		}
				/* check conditions */
#ifndef hab104
		  if (!rule_condition_met(trp, ap, pwp, dp, tbu_type, *edge_conds,
					  last_tp, pWordAnal_in, pStamp_in))
#else /* hab104 */
		  if (!rule_condition_met(trp, ap, pwp, dp, tbu_type, *edge_conds,
					  last_tp, pStamp_in))
#endif /* hab104 */
		return;
		}
	  else			/* is cyclic */
		{
				/* check for morpheme */
		  if ((dip = acp->ac_domain) != (struct domain_id *)NULL &&
		   dip->di_type == DI_MORPHEME)
		{		/* is morpheme oriented, not domain */
					/* determine morpheme to use */
		  if ((tip = acp->ac_tone) != (struct tone_id *)NULL)
			{
			  if (tip->ti_pos == ARGLEFT)
			ap = ap->pLeftLink;
			  else if (tip->ti_pos == ARGRIGHT)
			ap = ap->pRightLink;
			}
				/* paranoid check */
		  if (ap == (StampAnalysis *)NULL)
			return;
		  if ((dip->di_edge == RIGHT_EDGE)   ||
			  (dip->di_edge == 0          &&
			   DIRECTION(acp->ac_params) == LEFTWARD))
			{		/* get the last tbu in morpheme and get the
				   tone closest to right edge of morpheme */
			  tbp = ap->pTBUEnd;
#ifdef B4_0_4_12
			  last_tp = get_morphs_nearest_tone(ap, RIGHT);
			  inserted_at = RIGHT;
				/* new tone at tail of tbu's list of tones */
			  tbu_head = TAIL;
#else /* B4_0_4_12 */
			  if (tbp == (struct tbu *)NULL)
			{	/* morpheme does not have a tbu */
				/* NB: assumes morpheme to right or left */
				/* *does* have a tbu! */
				/* NB: assumes rules are cyclic
				   left-to-right (so want to try left 1st) */
			  if (ap->pLeftLink != (StampAnalysis *)NULL)
				{	/* use one to left */
				  tbp = ap->pLeftLink->pTBUEnd;
				  last_tp = get_morphs_nearest_tone(ap->pLeftLink,
								RIGHT);
				  inserted_at = RIGHT;
				/* new tone at tail of tbu's list of tones */
				  tbu_head = TAIL;
				}
			  else if (ap->pRightLink != (StampAnalysis *)NULL)
				{	/* use one to right */
				  tbp = ap->pRightLink->pTBUBeg;
				  last_tp = get_morphs_nearest_tone(ap->pRightLink,
								LEFT);
				  inserted_at = LEFT;
				/* new tone at head of tbu's list of tones */
				  tbu_head = HEAD;
				}
			  else
				{	/* use old way if above doesn't work */
				  last_tp = get_morphs_nearest_tone(ap, RIGHT);
				  inserted_at = RIGHT;
				/* new tone at tail of tbu's list of tones */
				  tbu_head = TAIL;
				}
			}
			  else
			{
			  last_tp = get_morphs_nearest_tone(ap, RIGHT);
			  inserted_at = RIGHT;
				/* new tone at tail of tbu's list of tones */
			  tbu_head = TAIL;
			}
#endif /* B4_0_4_12 */
			}
		  else		/* get the first tbu in morpheme and get */
			{		/* the tone closest to left edge of morpheme */
			  tbp = ap->pTBUBeg;
			  last_tp = get_morphs_nearest_tone(ap, LEFT);
			  inserted_at = LEFT;
				/* new tone at head of tbu's list of tones */
			  tbu_head = HEAD;
			}
		}
		  else if (dip != (struct domain_id *)NULL &&
			   dip->di_type == DI_WORD)
		{		/* is word oriented, not morpheme or domain */
				/* insert at appropriate edge of word */
		  if ((dip->di_edge == RIGHT_EDGE)   ||
			  (dip->di_edge == 0          &&
			   DIRECTION(acp->ac_params) == LEFTWARD))
			{		/* get the last tbu in word and get the
				   last tone in the word */
			  last_tp = end_of_tone_nodes(pwp->wd_tones);
			  tbp = end_of_tbus(pwp->wd_tbu);
			  tbu_head = TAIL;
			  inserted_at = RIGHT;
			}
		  else		/* get the first tbu in word and get */
			{		/* the first tone in the word */
			  tbp = pwp->wd_tbu;
			  last_tp = (struct tone*)NULL;
			  inserted_at = LEFT;
				/* new tone at head of tbu's list of tones */
			  tbu_head = HEAD;
			}
		}
		  else		/* is domain oriented */
		{		/* insert at front of word for now*/
				/* THIS NEEDS TO BE FIXED */
		  last_tp = (struct tone *)NULL;
		  tbp = pwp->wd_tbu;
		  tbu_head = HEAD;
		  inserted_at = LEFT;
		}
		}
				/* create tone */
	  tp = add_tone();
	  tier = acp->ac_tone->ti_value->tv_tier;
	  tp->tone_value[tier]   = acp->ac_tone->ti_value->tv_value;
	  tp->tone_ul_type[tier] = (int)NULL;
	  tp->tone_status[tier]  = acp->ac_tone->ti_status;
				/* insert it in list of tones */
	  pwp->wd_tones = insert_tone(pwp->wd_tones, tp, last_tp);
#ifndef B4_0_4_4
	  if (ap != (StampAnalysis *)NULL)
				/* update morpheme's tone pointers */
		{
		  if (inserted_at == LEFT)
		{
		  ap->pToneBeg = tp;
		  if (ap->pToneEnd == (struct tone *)NULL)
			ap->pToneEnd = tp;
		}
		  else if (inserted_at == RIGHT)
		{
		  ap->pToneEnd = tp;
		  if (ap->pToneBeg == (struct tone *)NULL)
			ap->pToneBeg = tp;
		}
		}
#endif /* B4_0_4_4 */
				/* insert it in tier */
	  pwp->wd_tier[tier] = insert_tone_list(pwp->wd_tier[tier],
							tier, tp);
	  if (acp->ac_op == ASSOCIATE)
				/* link tp to tbu */
		did_action += link_tone_to_tbu(tp, tier, params, tbp, tbu_head,
					   ap, Linked);
	  else
				/* line up tp to tbu */
		did_action += link_tone_to_tbu(tp, tier, params, tbp, tbu_head,
									  ap, tp->tone_status[tier]);
	  break;

	case DELETE:		/* these all do the same thing at this point */
	case DELINK:
	case LINK:
	case SPREAD:
	  if (ap == (StampAnalysis *)NULL)
		{			/* is non-cyclic */
				/* scan the tone tier for a tone that
				   matches the tone in the rule's action */
		  for (tp = pwp->wd_tones;
		   tp != (struct tone *)NULL;
		   )
		{
		  last_tp = tp->tone_right;
#ifndef hab104
		  if (rule_condition_met(trp, ap, pwp, dp, tbu_type,
					 *edge_conds, tp, pWordAnal_in,
					 pStamp_in))
#else /* hab104 */
		  if (rule_condition_met(trp, ap, pwp, dp, tbu_type,
					 *edge_conds, tp, pStamp_in))
#endif /* hab104 */
			did_action += do_existing_tone_action(tp, acp, ap, pwp);
		  tp = last_tp;
		}
		}
	  else			/* is cyclic */
		{			/* determine morphemes to use for finding a
				   tone and for performing the action */
		  if ((tip = acp->ac_tone) != (struct tone_id *)NULL)
		{
				/* assume action will be on original morph */
		  ap_action = ap_orig;
		  if (tip->ti_pos == ARGLEFT)
			{
			  ap = ap->pLeftLink; /* use left morph for tone */
			  if (DIRECTION(acp->ac_params) == RIGHTWARD)
			ap_action = ap_orig; /* use orig morph for action */
			  else
			ap_action = ap;	/* use left morph for action */
			}
		  else if (tip->ti_pos == ARGRIGHT)
			{
			  ap = ap->pRightLink; /* use right morph for tone */
			  if (DIRECTION(acp->ac_params) == RIGHTWARD)
			ap_action = ap;	/* use right morph for action */
			  else
			ap_action = ap_orig; /* use orig morph for action */
			}
		  if (ap != (StampAnalysis *)NULL)
			{
			  if (tip->ti_params == PLURAL)
			{	/* scan tones of the morpheme for a tone */
				/* that matches the tone in the rule's action*/
			  tier = tip->ti_value->tv_tier;
			  beg_tp  = get_edge_tone(ap, tier, LEFT);
			  last_tp = get_edge_tone(ap, tier, RIGHT);
			  if (DIRECTION(acp->ac_params) == RIGHTWARD)
				{
#ifdef ORIG
				  for (tp = beg_tp;
				   tp != (struct tone *)NULL &&
				   tp->tone_left != last_tp &&
				   !(tp != beg_tp && /* check for deletions */
					 tp->tone_left == (struct tone *)NULL);
				   tp = tp->tone_right)
				if (tone_matches(tp, acp->ac_tone))
				  did_action +=
					do_existing_tone_action(tp, acp, ap_action,
								pwp);
#else  /* ORIG */
				  for (tp = beg_tp;
				   tp != (struct tone *)NULL &&
				   tp->tone_left != last_tp &&
				   !(tp != beg_tp && /* check for deletions */
					 tp->tone_left == (struct tone *)NULL);
				   tp = tpNext)
				{
				  tpNext = tp->tone_right; /* remember in case it
								gets deleted */
				  if (tone_matches(tp, acp->ac_tone))
					did_action +=
					  do_existing_tone_action(tp, acp,
								  ap_action, pwp);
				}
#endif /* ORIG */
				}
			  else
				{
				  for (tp = last_tp;
				   tp != (struct tone *)NULL &&
				   tp->tone_right != beg_tp;
				   tp = tp->tone_left)
				if (tone_matches(tp, acp->ac_tone))
				  did_action +=
					do_existing_tone_action(tp, acp, ap_action,
								pwp);
				}
			  }
			  else	/* find the appropriate tone of the morpheme */
			{
			  tier = tip->ti_value->tv_tier;
			  if (tip->ti_pos == ARGLEFT)
				tp = get_edge_tone(ap, tier, RIGHT);
			  else if (tip->ti_pos == ARGRIGHT)
				tp = get_edge_tone(ap, tier, LEFT);
			  else
				{	/* scan the tones for a match */
				  beg_tp  = get_edge_tone(ap, tier, LEFT);
				  last_tp = get_edge_tone(ap, tier, RIGHT);
				  if (DIRECTION(acp->ac_params) == RIGHTWARD)
				{
				  for (tp = beg_tp;
					   tp != (struct tone *)NULL &&
					   tp->tone_left != last_tp;
					   tp = tp->tone_right)
					if (tone_matches(tp, acp->ac_tone))
					  break;
				}
				  else
				{
				  for (tp = last_tp;
					   tp != (struct tone *)NULL &&
					   tp->tone_right != beg_tp;
					   tp = tp->tone_left)
					if (tone_matches(tp, acp->ac_tone))
					  break;
				}
				}
				/* perform action on the tone */
			  did_action += do_existing_tone_action(tp, acp,
								   ap_action, pwp);
			}
			}
		}
		}
	  break;

	case FILL_IN:
				/* scan through the tbus left-to-right; */
				/* for all tbus which do not have a tone */
				/* on the tier, insert and link the */
				/* indicated tone */
	  params = FILL_IN_ACTION_PARAMS;
	  tier = acp->ac_tone->ti_value->tv_tier;
	  for (tbp = pwp->wd_tbu;
		   tbp != (struct tbu *)NULL;
		   tbp = tbp->tbu_right)
		{			/* check each tone on this tbu */
		  if ((tlp = tbp->tbu_tonel) == (struct tone_list *)NULL)
		{		/* no tone on the tier for this tbu */
				/* add the tone */
		  tp = add_tone();
		  tp->tone_value[tier]   = acp->ac_tone->ti_value->tv_value;
		  tp->tone_ul_type[tier] = (int)NULL;
		  tp->tone_status[tier]  = acp->ac_tone->ti_status;
				/* insert it in list of tones */
		  pwp->wd_tones = insert_tone(pwp->wd_tones, tp,
						  get_previous_tone(tbp, LEFT));
				/* insert it in tier */
		  pwp->wd_tier[tier] = insert_tone_list(pwp->wd_tier[tier],
							tier, tp);
				/* link tp to tbu */
		  did_action += link_tone_to_tbu(tp, tier, params, tbp,
						 HEAD, ap, Linked);
		}
		  else		/* there are tones; if the indicated tier */
				/* does not have a value yet, set it to the */
				/* indicated value; also, use the status of */
				/* the other tier */
		{
		  for (;
			   tlp != (struct tone_list *)NULL;
			   tlp = tlp->tonl_right)
			if ((tp = tlp->tonl_tone)->tone_value[tier] == (int)NULL)
			  {
			tp->tone_value[tier]   = acp->ac_tone->ti_value
													   ->tv_value;
			tp->tone_ul_type[tier] = (int)NULL;
			tp->tone_status[tier]  = tp->tone_status[(tier+1)%2];
				/* insert it in tier */
			pwp->wd_tier[tier]=insert_tone_list(pwp->wd_tier[tier],
							tier, tp);
			did_action = TRUE;
			  }
		}
		}
	  break;

	case COPY:
	  ;			/* not implemented yet */
	  break;
	}
	}

  if (did_action)
	{
	  trp->tr_applied++;		/* keep statistics */

	  if ((do_trace & TRACE_TONE_TIER) &&
	  (RULE_TYPE(trp->tr_params) != EDGE_CONDITION) &&
	  pStamp_in->pLogFP)
	{
	  fprintf(pStamp_in->pLogFP, "\n        After %s:", trp->tr_name);
	  draw_tone_diagram(pwp, pStamp_in->pLogFP);
	  if (do_trace & TRACE_TONE_OLD)
		{
		  for (tier = 0; tier < TIERS; tier++)
		trace_tone_tier(pStamp_in, pwp->wd_tier[tier], tier);
		}
	  fprintf(pStamp_in->pLogFP,
		  "\n\t\t%s", build_word_with_tone_marked(pwp->wd_rn, tbu_type,
							 SHOW_DERIVATION,
							 (int)NULL, pStamp_in->pLogFP));
	}
	}

}	/* end apply_rule */

/*************************************************************************
 * NAME
 *    apply_tone_rules
 * ARGUMENTS
 *    ap_head      - pointer to head of analysis list
 *    word         - pointer to word template struct
 *    pwp          - pointer to prosodic word struct
 *    dp           - pointer to head of domain tree
 *    tbu_type     - type of tone bearing unit
 *    edge_conds   - flag indicating whether various edge conditions are met
 *                   (i.e. if the structural descriptions of rules are met by
 *                    the preceding context)
 *    which_rules  - which rules to apply flag (all or all but right_edge)
 *    do_trace     - tracing flag
 *    pWordAnal_in - pointer to word analysis struct
 * DESCRIPTION
 *    Apply tone rules
 * RETURN VALUE
 *    pointer to primary tone tier (pointer to register tone tier is also
 *		updated as a side effect)
 */
#ifndef hab104
static void apply_tone_rules(ap_head, word, pwp, dp, tbu_type, edge_conds,
				 which_rules, do_trace, pWordAnal_in, pStamp_in)
#else /* hab104 */
static void apply_tone_rules(ap_head, word, pwp, dp, tbu_type, edge_conds,
				 which_rules, do_trace, pStamp_in)
#endif /* hab104 */
	 StampAnalysis  *ap_head;
	 WordTemplate *word;
	 struct pword     *pwp;
	 struct domain    *dp;
	 int               tbu_type;
	 long             *edge_conds;
	 int               which_rules;
	 int               do_trace;
#ifndef hab104
	 WordAnalysis     *pWordAnal_in;
#endif /* hab104 */
	 StampData        *pStamp_in;
{
  StampAnalysis  *ap;
  int               i;

  cycle = get_default_cycle();

  if (cycle == (struct cycle *)NULL)
	{				/* there are no cyclic rules */
				/* go do them all once */
#ifndef hab104
	  do_rules(trh, trt, ap_head, word, pwp, dp, tbu_type, edge_conds,
		   ALL, which_rules, do_trace, pWordAnal_in, pStamp_in);
#else /* hab104 */
	  do_rules(trh, trt, ap_head, word, pwp, dp, tbu_type, edge_conds,
		   ALL, which_rules, do_trace, pStamp_in);
#endif /* hab104 */
	}
  else
	{				/* there are cyclic rules */
	  if (cycle->cy_domain == (struct domain_list *)NULL)
	  {			/* apply any initial non-cyclic rules */
		if (trcybeg != (struct tone_rule *)NULL &&
		trcybeg != trh)
#ifndef hab104
		  do_rules(trh, trcybeg->tr_left, ap_head, word, pwp, dp, tbu_type,
			   edge_conds, NONCYCLIC, which_rules, do_trace,
			   pWordAnal_in, pStamp_in);
#else /* hab104 */
		  do_rules(trh, trcybeg->tr_left, ap_head, word, pwp, dp, tbu_type,
			   edge_conds, NONCYCLIC, which_rules, do_trace,
			   pStamp_in);
#endif /* hab104 */

		if (cycle->cy_dir == RIGHTWARD)
				/* apply the cyclic rules left-to-right */
		  for (ap = ap_head;
		   ap != (StampAnalysis *)NULL;
		   ap = ap->pRightLink)
		{
		  if ((do_trace & TRACE_TONE_TIER)  && pStamp_in->pLogFP)
			fprintf(pStamp_in->pLogFP,
				"\n      Morpheme: %s", ap->m.pszMorphname);
#ifndef hab104
		  do_rules(trcybeg, trcyend, ap, word, pwp, dp, tbu_type,
			   edge_conds, CYCLIC, which_rules, do_trace,
			   pWordAnal_in, pStamp_in);
#else /* hab104 */
		  do_rules(trcybeg, trcyend, ap, word, pwp, dp, tbu_type,
			   edge_conds, CYCLIC, which_rules, do_trace,
			   pStamp_in);
#endif /* hab104 */
		}
		else if (cycle->cy_dir == LEFTWARD)
				/* apply the cyclic rules right-to-left */
		  {
				/* skip to end of list of morphemes */
		for (ap = ap_head;
			 ap != (StampAnalysis *)NULL &&
			 ap->pRightLink != (StampAnalysis *)NULL;
			 ap = ap->pRightLink)
		  ;
				/* apply rules left to right */
		for (;
			 ap != (StampAnalysis *)NULL;
			 ap = ap->pLeftLink)
		  {
			if ((do_trace & TRACE_TONE_TIER)  && pStamp_in->pLogFP)
			  fprintf(pStamp_in->pLogFP,
				  "\n      Morpheme: %s", ap->m.pszMorphname);
#ifndef hab104
			do_rules(trcybeg, trcyend, ap, word, pwp, dp, tbu_type,
				 edge_conds, CYCLIC, which_rules, do_trace,
				 pWordAnal_in, pStamp_in);
#else /* hab104 */
			do_rules(trcybeg, trcyend, ap, word, pwp, dp, tbu_type,
				 edge_conds, CYCLIC, which_rules, do_trace,
				 pStamp_in);
#endif /* hab104 */
		  }
		  }
		else
		  {			/* apply the cyclic rules root-out according
				   to the domain information*/
		;			/* to be written */
		  }
				/* apply any final non-cyclic rules */
		if (trcyend != (struct tone_rule *)NULL &&
		trcyend->tr_right != (struct tone_rule *)NULL)
#ifndef hab104
		  do_rules(trcyend->tr_right, trt, ap_head, word, pwp, dp,
			   tbu_type, edge_conds, NONCYCLIC, which_rules, do_trace,
			   pWordAnal_in, pStamp_in);
#else /* hab104 */
		  do_rules(trcyend->tr_right, trt, ap_head, word, pwp, dp,
			   tbu_type, edge_conds, NONCYCLIC, which_rules, do_trace,
			   pStamp_in);
#endif /* hab104 */
	  }
	  else
	{
				/* to be done in a particular domain */
	  ;			/* to be written */
	}
	}

  if ((do_trace & TRACE_TONE_TIER)  && pStamp_in->pLogFP)
	{
	  trace_msg(pStamp_in->pLogFP, "After Apply Rules:");
	  draw_tone_diagram(pwp, pStamp_in->pLogFP);
	  if (do_trace & TRACE_TONE_OLD)
	{
	  for (i = 0; i < TIERS; i++)
		trace_tone_tier(pStamp_in, pwp->wd_tier[i], i);
	}
	  fprintf(pStamp_in->pLogFP,
		  "\n\t\t%s", build_word_with_tone_marked(pwp->wd_rn, tbu_type,
							 SHOW_DERIVATION,
							 (int)NULL, pStamp_in->pLogFP));
	}

}	/* end apply_tone_rules */

/*************************************************************************
 * NAME
 *    assign_lexical_tone_to_tbus
 * ARGUMENTS
 *    ap - pointer to analysis struct
 *    tbu_type - type of tone bearing unit
 *    tp - pointer to tone struct
 * DESCRIPTION
 *    assign the (lexical) tone struct to the appropriate tbu(s)
 * RETURN VALUE
 *    NONE
 */
#ifndef hab106
static void assign_lexical_tone_to_tbus(ap, tp, tbu_type, do_trace, pStamp_in)
	 StampAnalysis *ap;
	 struct tone     *tp;
	 int              tbu_type;
	 int              do_trace;
	 StampData       *pStamp_in;
#else
static void assign_lexical_tone_to_tbus(ap, tp, tbu_type, pStamp_in)
	 StampAnalysis *ap;
	 struct tone     *tp;
	 int              tbu_type;
	 StampData       *pStamp_in;
#endif /* hab106 */
{
  char *errhead = "\nAssign_lexical_tone_to_tbus: ";
  struct tbu       *tbup, *tbup2;
  StampAnalysis  *ap_orig;
  int tier;
  int tloc;
  int tbu_count;
  int use_tbu;

  if (ap == (StampAnalysis *)NULL || tp == (struct tone *)NULL)
	  return;

				/* remember original morpheme for error
				   messages */
  ap_orig = ap;

  for (tier = 0; tier < TIERS; tier++)
	{
				/* boundary tones are not lexically */
				/* assigned to a tbu */
	  if (tp->tone_ul_type[tier] &&
	  tp->tone_ul_type[tier] != Boundary)
	{
	  use_tbu = 0;
	  if (tp->tone_ul_type[tier] == LeftFloating)
		{
		  use_tbu = LEFT_EDGE;
		  if (ap->pTBUBeg == (struct tbu *)NULL)
		{
				/* need to find a morpheme with tbu's; */
				/* starting from the current morpheme, */
				/* look first to the right */
		  for (ap = ap_orig->pRightLink;
			   ap != (StampAnalysis *)NULL &&
			   ap->pTBUBeg == (struct tbu *)NULL;
			   ap = ap->pRightLink)
			;
		  if (ap == (StampAnalysis *)NULL)
			{
					/* none found, so look to the left */
			  for (ap = ap_orig->pLeftLink;
			   ap != (StampAnalysis *)NULL &&
			   ap->pTBUBeg == (struct tbu *)NULL;
			   ap = ap->pLeftLink)
			;
				/* need to place the left-floating tone
				   at final tbu of morpheme */
			  use_tbu = RIGHT_EDGE;
				/* maybe we should make the tone be
				   right-floating ?? */
			}
		  if (ap == (StampAnalysis *)NULL)
			{			/* No morpheme with tbus! */
			  fprintf(pStamp_in->pLogFP,
				  "\n%s: no morpheme with tbus in this word!",
				  errhead);
			  return;
			}
		}
		}
	  else if (tp->tone_ul_type[tier] == RightFloating)
		{
		  use_tbu = RIGHT_EDGE;
		  if (ap->pTBUBeg == (struct tbu *)NULL)
		{
				/* need to find a morpheme with tbu's; */
				/* starting from the current morpheme, */
				/* look first to the left */
		  for (ap = ap_orig->pLeftLink;
			   ap != (StampAnalysis *)NULL &&
			   ap->pTBUBeg == (struct tbu *)NULL;
			   ap = ap->pLeftLink)
			;
		  if (ap == (StampAnalysis *)NULL)
			{
					/* none found, so look to the right */
			  for (ap = ap_orig->pRightLink;
			   ap != (StampAnalysis *)NULL &&
			   ap->pTBUBeg == (struct tbu *)NULL;
			   ap = ap->pRightLink)
			;
				/* need to place the right-floating tone
				   at initial tbu of morpheme */
			  use_tbu = LEFT_EDGE;
				/* maybe we should make the tone be
				   left-floating ?? */
			}
		  if (ap == (StampAnalysis *)NULL)
			{			/* No morpheme with tbus! */
			  fprintf(pStamp_in->pLogFP,
				  "\n%s: no morpheme with tbus in this word!",
				  errhead);
			  return;
			}
		}
		}
				/* left-floating tones always assign to */
				/* the initial tbu in the morpheme */
	  if (use_tbu == LEFT_EDGE)
		{
		  link_tone_to_tbu(tp, tier, RIGHTWARD, ap->pTBUBeg, HEAD,
				   (StampAnalysis *)NULL, 0);
		  break;
		}
				/* right-floating tones always assign to */
				/* the final tbu in the morpheme */
	  if (use_tbu == RIGHT_EDGE)
		{
		  link_tone_to_tbu(tp, tier, LEFTWARD, ap->pTBUEnd, TAIL,
				   (StampAnalysis *)NULL, 0);
		  break;
		}
				/* find leftmost tbu in morpheme */
	  tbup = get_edge_tbu(ap->pRNBeg, ap->pRNEnd, tbu_type, LEFT);
				/* get tbu location of tone: default is 1 */
	  for (tloc = max(1, get_next_loc(tp->tone_ul_loc, (int)NULL));
		   tloc > 0;
		   tloc = get_next_loc(tp->tone_ul_loc, tloc))
		{
				/* find corresponding tbu */
		  for ( tbu_count = 1, tbup2 = tbup;
		   (tbu_count != tloc)           &&
		   (tbup2 != (struct tbu *)NULL);
		   tbu_count++, tbup2 = tbup2->tbu_right)
		;
				/* link tone to the tbu */
		  if (tbup2 == (struct tbu *)NULL)
		{
#ifndef hab106
		  if (do_trace)
#endif /* hab106 */
			fprintf(pStamp_in->pLogFP,
				"\n%s: tbu %d not found for morpheme %s", errhead,
				tloc, ap_orig->m.pszMorphname);
		}
		  else
		{
		  link_tone_to_tbu(tp, tier, RIGHTWARD, tbup2, TAIL,
				   (StampAnalysis *)NULL, 0);
		}
		  if (!pStamp_in->bDoMorphemeCrossing &&
		  tbup2 == ap->pTBUEnd)
		break;		/* do not look at any more locations */
		}
	}	/* end of boundary tone type check */
	}	    /* end of tier for loop */

}	/* end assign_lexical_tone_to_tbus */

#ifdef TONEGEN
/*************************************************************************
 * NAME
 *    build_decomp_string
 * ARGUMENTS
 *    ap_head - pointer to head of analysis list
 * DESCRIPTION
 *    Create a copy of the synthesized word with decomposition chars.
 * RETURN VALUE
 *    pointer to decomposed synthesized word
 */
static char *build_decomp_string(ap_head, pStamp_in)
	 StampAnalysis *ap_head;
	 StampData     *pStamp_in;
{
  StampAnalysis *ap;
  char *cp, *cp2;
  static char syndecomp[BUFSIZE];
				/* run through the list of analysis structs */
				/* (for each morpheme...) */
  for (ap = ap_head, cp = &syndecomp[0];
	   ap != (StampAnalysis *)NULL;
	   ap = ap->pRightLink)
	{
				/* copy the synthesized allomorph */
	  if (ap->pszAlloStart == ap->pszAlloEnd)
	*cp++ = '0';
	  else
	for (cp2 = ap->pszAlloStart;
		 cp2 != ap->pszAlloEnd;
		 cp2++)
	  *cp++ = *cp2;
	  if (ap->pRightLink != (StampAnalysis *)NULL)
				/* insert the decomposition character */
	*cp++ = pStamp_in->sTextCtl.cDecomp;
	  else
	*cp++ = *(ap->pszAlloEnd);
	}
  *cp = NUL;

  return(duplicateString(syndecomp));

}	/* end build_decomp_string */
#endif /* TONEGEN */

/*************************************************************************
 * NAME
 *    build_tone_tier
 * ARGUMENTS
 *    ap_head - pointer to head of analysis list
 *    tbu_type - type of tone bearing unit
 *    do_trace - tracing flag
 * DESCRIPTION
 *    Create the tone node tier and
 *           the (primary) tone tier (a tone_list struct)
 *
 * RETURN VALUE
 *    NONE
 */
static void build_tone_tier(pwp, ap_head, do_trace, pStamp_in)
	 struct pword  *pwp;
	 StampAnalysis *ap_head;
	 int            do_trace;
	 StampData     *pStamp_in;
{
  StampAnalysis *ap;
  struct tone_list *t_tier_headp, *tlp, *ttp;
  struct tone *tp;

  t_tier_headp = (struct tone_list *)NULL;

				/* run through the list of analysis structs */
				/* (for each morpheme...) */
  for (ap = ap_head;
	   ap != (StampAnalysis *)NULL;
	   ap = ap->pRightLink)
	{				/* place a copy of each tone in the */
				/* lexical entry into the tone tier */
	  ap->pToneBeg = ap->pToneEnd = (struct tone *)NULL;
	  for (tlp = ap->m.pTones;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	{
				/* add an element to the tone tier */
	  t_tier_headp = add_tone_list(t_tier_headp, TAIL, tlp->tonl_tone);
				/* find the element just added (it's at */
				/* the end of list) */
	  ttp = end_of_tone_list(t_tier_headp);
				/* make a copy of the tone info */
	  ttp->tonl_tone = copy_tone(tlp->tonl_tone);
				/* assign the lexical tone to the */
				/* appropriate tbu's */
#ifndef hab106
	  assign_lexical_tone_to_tbus(ap, ttp->tonl_tone, pStamp_in->iTbuType,
					  do_trace, pStamp_in);
#else
	  assign_lexical_tone_to_tbus(ap, ttp->tonl_tone, pStamp_in->iTbuType,
					  pStamp_in);
#endif /* hab106 */
				/* link the tone into the tone node list */
	  pwp->wd_tones = add_tone_node(pwp->wd_tones, TAIL, ttp->tonl_tone);
				/* set morpheme's pointers to initial and */
				/* last tones */
	  if (ap->pToneBeg == (struct tone *)NULL)
		ap->pToneBeg = ttp->tonl_tone;
	  ap->pToneEnd = ttp->tonl_tone;
	}
	}

  if ((do_trace & TRACE_TONE_OLD) && pStamp_in->pLogFP)
	{
	  trace_msg(pStamp_in->pLogFP, "After Initial Build of Tone Tier:");
	  trace_tone_tier(pStamp_in, t_tier_headp, PRIMARY);
	}
  else if ((do_trace & TRACE_MORPHEME_TONES) && pStamp_in->pLogFP)
	{
	  trace_msg(pStamp_in->pLogFP, "After Initial Build of Tone Tier:");
	  for (ap = ap_head;
	   ap != (StampAnalysis *)NULL;
	   ap = ap->pRightLink)
	{
	  fprintf(pStamp_in->pLogFP,
		  "\n\t\tMorpheme %s has these tones:", ap->m.pszMorphname);
	  for (tp = ap->pToneBeg;
		   tp != (struct tone *)NULL &&
		   tp->tone_left != ap->pToneEnd;
		   tp = tp->tone_right)
		show_tone(pStamp_in->pLogFP, tp);
	}
	}
				/* set pointer to head of (primary) tone */
				/* tier */
  pwp->wd_tier[PRIMARY] = t_tier_headp;

}	/* end build_tone_tier */

/*************************************************************************
 * NAME
 *    calculate_edge_conds
 * ARGUMENTS
 *    ap    - pointer to head of analysis struct list
 *    pwp   - pointer to pword struct
 *    dp    - pointer to head of domain tree
 *    word  - pointer to word template
 *    old_edge_conds - previous edge conditions flag
 *    do_trace       - tracing flag
 * DESCRIPTION
 *    Calculate edge conditions: set flags if structural description of
 *    rules are met by the right edge of the word
 * RETURN VALUE
 *    edge conditions flag
 */
#ifndef hab104
static long calculate_edge_conds(ap, pwp, dp, word, old_edge_conds, tbu_type,
				 do_trace, pWordAnal_in, pStamp_in)
#else /* hab104 */
static long calculate_edge_conds(ap, pwp, dp, word, old_edge_conds, tbu_type,
				 do_trace, pStamp_in)
#endif /* hab104 */
	 StampAnalysis      *ap;
	 struct pword         *pwp;
	 struct domain        *dp;
	 WordTemplate *word;
	 long                  old_edge_conds;
	 int                   tbu_type;
	 int                   do_trace;
#ifndef hab104
	 WordAnalysis         *pWordAnal_in;
#endif /* hab104 */
	 StampData            *pStamp_in;
{
  struct tone_rule *trp;
  struct action    *acp;
  long              edge_conds;

				/* initialize: use any edge conditions
				   set by rules */
  edge_conds = next_edge_conds;
				/* turn off edge_conds if the word is in */
				/* phrase final position */
  if (is_phrase_final(word, pStamp_in))
	{
	  return(0L);
	}

  for (trp = get_edge_cond_rule_head();
	   trp != (struct tone_rule *)NULL;
	   trp = trp->tr_right)
	{
	  trp->tr_tried++;		/* keep statistics */
				/* for each action in the rule... */
	  for (acp = trp->tr_action;
	   acp != (struct action *)NULL;
	   acp = acp->ac_next)
	{			/* see if the conditions are met */
#ifndef hab104
	  if (rule_condition_met(trp, ap, pwp, dp, tbu_type,
				 old_edge_conds,
				 (struct tone *)NULL, pWordAnal_in, pStamp_in))
#else /* hab104 */
	  if (rule_condition_met(trp, ap, pwp, dp, tbu_type, old_edge_conds,
				 (struct tone *)NULL, pStamp_in))
#endif /* hab104 */
		{
		  edge_conds |= acp->ac_econds;	/* set the edge condition */
		  trp->tr_applied++;		/* keep statistics */
		}
	}
	}

  if ((do_trace & TRACE_TONE_TIER) && pStamp_in->pLogFP)
	show_edge_conds(pStamp_in->pLogFP, edge_conds);

  return(edge_conds);

}	/* end calculate_edge_conds */

/*****************************************************************************
 * NAME
 *    compare
 * ARGUMENTS
 *    a - pointer to an integer
 *    b - pointer to an integer
 * DESCRIPTION
 *    Compare the two integers and return an
 *	integer value according to whether the first one is less than,
 *      equal to, or greater than the second.
 *    This function is used in calls to qsort() and bsearch()
 * RETURN VALUE
 *    comparison value
 */
static int compare(a,b)
	 long *a,*b;
{

  if (*a < *b)
	return(-1);
  else if (*a > *b)
	return(1);
  else
	return(0);

}  /* end compare */

/****************************************************************************
 * NAME
 *    copy_morpheme_info
 * ARGUMENTS
 *    ap   - pointer to analysis struct
 *    mp   - pointer to dictionary morpheme struct
 * DESCRIPTION
 *    copy morpheme info from dictionary entry to analysis struct
 * RETURN VALUE
 *    NONE
 */
void copy_morpheme_info (ap, mp)
	 StampAnalysis *ap;
	 StampMorpheme *mp;
{
  ap->m.iMorphType = mp->iMorphType;
  ap->m.iFromCategory = mp->iFromCategory;
  ap->m.iToCategory = mp->iToCategory;
  ap->m.iOrderClass = mp->iOrderClass;
  if (mp->iMorphType == ROOT)
	ap->m.u.pRootCategories = mp->u.pRootCategories;
  else if (mp->iMorphType == IFX)
	ap->m.u.pInfixEnv = mp->u.pInfixEnv;
  ap->m.pAllomorphs = mp->pAllomorphs;
  ap->m.pTones = copy_tone_list(mp->pTones);
  ap->m.iDomain = mp->iDomain;

}	/* end copy_morpheme_info */

/****************************************************************************
 * NAME
 *    do_existing_tone_action
 * ARGUMENTS
 *    tp   - pointer to the tone struct
 *    acp  - pointer to the action struct
 *    ap   - pointer to the analysis struct
 *    pwp  - poitner to the prosodic word struct
 * DESCRIPTION
 *    see if a tone matches the tone in the rule's action and apply the action
 * RETURN VALUE
 *    TRUE  if action was applied
 *    FALSE otherwise
 */
static int do_existing_tone_action(tp, acp, ap, pwp)
	 struct tone     *tp;
	 struct action   *acp;
	 StampAnalysis *ap;
	 struct pword    *pwp;
{
  struct tbu_list *tblp;
  struct tbu      *tbp, *tbdlp;
  StampAnalysis *ap2;
  struct tone     *tp2;
  int              tier;
  int              did_action;

				/* see if the tone matches the tone in the
				   rule's action */
  if (tone_matches(tp, acp->ac_tone))
	{			/* the tone matches */
	  did_action = TRUE;
	  tier = acp->ac_tone->ti_value->tv_tier;
	  switch (acp->ac_op)
	{
	case DELETE:
#ifndef B4_0_4_4
				/* need to update morpheme's tone pointers */
				/* if the rule is cyclic (i.e. ap is not */
				/* null) */
	  if (ap != (StampAnalysis *)NULL &&
		  tp != (struct tone *)NULL)
		{
				/* (there must be a better way...) */
				/* get first morpheme in word */
		  for (ap2 = ap->pLeftLink;
		   ap2 != (StampAnalysis *)NULL &&
		   ap2->pLeftLink != (StampAnalysis *)NULL;
		   ap2 = ap2->pLeftLink)
		;
		  if (ap2 == (StampAnalysis *)NULL)
		ap2 = ap;
				/* for each morpheme */
		  for (;
		   ap2 != (StampAnalysis *)NULL;
		   ap2 = ap2->pRightLink)
		{		/* see if tone is in the morpheme */
		  for (tp2 = ap2->pToneBeg;
			   tp2 != (struct tone *)NULL &&
			   tp2->tone_left != ap2->pToneEnd;
			   tp2 = tp2->tone_right)
			if (tp == tp2)
			  {
			if (tp == ap2->pToneBeg)
			  {
				if (tp == ap2->pToneEnd)
				  ap2->pToneBeg = ap2->pToneEnd
							= (struct tone *)NULL;
				else
				  ap2->pToneBeg = tp->tone_right;
			  }
			if (tp == ap2->pToneEnd)
			  ap2->pToneEnd = ap2->pToneEnd->tone_left;
			  }
		}
		}
#endif /* B4_0_4_4 */
	  delete_tone(tp, pwp);
	  break;

	case DELINK:
	  if (ITERATION(acp->ac_params) == ITERATIVELY)
		{
		  for (tblp = tp->tone_tbul;
		   tblp != (struct tbu_list *)NULL;
		   tblp = tblp->tbul_next)
		delink_tone_from_tbu(tp, tier, tblp->tbul_tbu);
		}
	  else			/* only delink one */
		{
		  if (tp->tone_tbul != (struct tbu_list *)NULL)
		{
		  if (DIRECTION(acp->ac_params) == RIGHTWARD)
				/* delink the first */
			delink_tone_from_tbu(tp, tier, tp->tone_tbul->tbul_tbu);
		  else
				/* delink the last */
			delink_tone_from_tbu(tp, tier,
					 end_of_tbu_list(tp->tone_tbul)->tbul_tbu);
		}
		}
	  break;

	case LINK:
				/* link tone to its tbu */
	  if (tp->tone_tbul == (struct tbu_list *)NULL)
		break;
				/* assume that there is only one tbu */
	  tbp = tp->tone_tbul->tbul_tbu;
				/* assume that we will not need to delink */
	  tbdlp = (struct tbu *)NULL;
				/* floating tones link to tbu to left or
				   to right depending on the direction */
	  if (tp->tone_status[tier] == LeftFloating &&
		  DIRECTION(acp->ac_params) == LEFTWARD)
		{
		  tbdlp = tbp;	 /* need to delink it from this tbu */
		  tbp = tbp->tbu_left;	/* and link it here */
		}
	  if (tp->tone_status[tier] == RightFloating &&
		  DIRECTION(acp->ac_params) == RIGHTWARD)
		{
		  tbdlp = tbp;	 /* need to delink it from this tbu */
		  tbp = tbp->tbu_right;	/* and link it here */
		}
	  did_action = link_tone_to_tbu(tp, tier, acp->ac_params, tbp,
			   DIRECTION(acp->ac_params) == RIGHTWARD ? HEAD
													  : TAIL,
			   ap, Linked);
				/* see if need to delink the tone */
	  if (tbdlp != (struct tbu *)NULL && tbp != (struct tbu *)NULL)
		delink_tone_from_tbu(tp, tier, tbdlp);
	  break;

	case SPREAD:
	  spread_tone(tp, tier, acp->ac_params, acp->ac_domain,
			  acp->ac_tone->ti_status, ap, pwp);
	  break;

	case COPY:
				/* to be written */
	  break;
	}
	  return(did_action);
	}

  return(FALSE);

}	/* end do_existing_tone_action */

/****************************************************************************
 * NAME
 *    do_rules
 * ARGUMENTS
 *    trb          - pointer to beginning (first) rule to apply
 *    tre          - pointer to ending    (last)  rule to apply
 *    ap           - pointer to analysis struct
 *    word         - pointer to word template struct
 *    pwp          - pointer to prosodic word struct
 *    dp           - pointer to head of domain tree
 *    tbu_type     - type of tone bearing unit
 *    edge_conds   - flag indicating whether various edge conditions are met
 *                   (i.e. if the structural descriptions of rules are met by
 *                    the preceding context)
 *    rule_type    - CYCLIC, NONCYCLIC or ALL
 *    which_rules  - which rules to apply flag (all or all but right_edge)
 *    do_trace     - tracing flag
 *    pWordAnal_in - pointer to Word analysis struct
 * DESCRIPTION
 *    apply the indicated rules to the morpheme or morphemes
 * RETURN VALUE
 *    NONE
 */
#ifndef hab104
static void do_rules(trb, tre, ap, word, pwp, dp, tbu_type, edge_conds,
			 rule_type, which_rules, do_trace, pWordAnal_in, pStamp_in)
#else /* hab104 */
static void do_rules(trb, tre, ap, word, pwp, dp, tbu_type, edge_conds,
			 rule_type, which_rules, do_trace, pStamp_in)
#endif /* hab104 */
	 struct tone_rule     *trb;
	 struct tone_rule     *tre;
	 StampAnalysis      *ap;
	 WordTemplate *word;
	 struct pword         *pwp;
	 struct domain        *dp;
	 int                   tbu_type;
	 long                 *edge_conds;
	 int                   rule_type;
	 int                   which_rules;
	 int                   do_trace;
#ifndef hab104
	 WordAnalysis         *pWordAnal_in;
#endif /* hab104 */
	 StampData            *pStamp_in;
{
  struct tone_rule *trp;

  for (trp = trb;
	   trp != (struct tone_rule *)NULL &&
	   trp != tre->tr_right;
	   trp = trp->tr_right)
	{
				/* skip right edge rules if needed */
	  if (RULE_TYPE(trp->tr_params) == RIGHT_EDGE_RULE &&
	  which_rules == NON_RIGHT)
	continue;
				/* skip optional rules if needed */
	  if (OPTIONALITY(trp->tr_params) &&
	  which_rules != ALL_RULES)
	continue;
	  if (rule_type == CYCLIC)
	{			/* skip edge rules unless they are on
				   the correct edge */
	  if (RULE_TYPE(trp->tr_params) == EDGE_RULE &&
		  cycle != (struct cycle *)NULL &&
		  ((cycle->cy_dir == RIGHTWARD &&
		   ap->pLeftLink != (StampAnalysis *)NULL) ||
		  (cycle->cy_dir == LEFTWARD &&
		   ap->pRightLink != (StampAnalysis *)NULL)))
		continue;
#ifndef hab104
	  apply_rule(trp, ap, word, pwp, dp, tbu_type, edge_conds, do_trace,
			 pWordAnal_in, pStamp_in);
#else /* hab104 */
	  apply_rule(trp, ap, word, pwp, dp, tbu_type, edge_conds, do_trace,
			 pStamp_in);
#endif /* hab104 */
	}
	  else if (rule_type == NONCYCLIC)
	{
#ifndef hab104
	  apply_rule(trp, (StampAnalysis *)NULL, word, pwp,
			 (struct domain *)NULL, tbu_type, edge_conds, do_trace,
			 pWordAnal_in, pStamp_in);
#else /* hab104 */
	  apply_rule(trp, (StampAnalysis *)NULL, word, pwp,
			 (struct domain *)NULL, tbu_type, edge_conds, do_trace,
			 pStamp_in);
#endif /* hab104 */
	}
	  else			/* is same as noncyclic */
	{
#ifndef hab104
	  apply_rule(trp, (StampAnalysis *)NULL, word, pwp,
			 (struct domain *)NULL, tbu_type, edge_conds, do_trace,
			 pWordAnal_in, pStamp_in);
#else /* hab104 */
	  apply_rule(trp, (StampAnalysis *)NULL, word, pwp,
			 (struct domain *)NULL, tbu_type, edge_conds, do_trace,
			 pStamp_in);
#endif /* hab104 */
	}
	}
}	/* end do_rules */

/****************************************************************************
 * NAME
 *    do_tone_anal
 * ARGUMENTS
 *    num_words - number of words processed so far
 * DESCRIPTION
 *    Load a word record from the input file and do tonal analysis on it.
 * RETURN VALUE
 *    pointer to transferred word structure
 */
void do_tone_anal ( pUnit_in, do_trace, pStamp_in)
	 StampUnit *	pUnit_in;
	 int do_trace;
	 StampData *pStamp_in;
{
  WordTemplate *word = pUnit_in->pCurrentWord->pTemplate;
  WordAnalysis *anp, *anp2;
  StampAnalysisList *trp, *trp2;
  int i, j;
  static int max_conds = 1;
  static long      edge_conds[MAX_ANALYSES] = {0L, 0L}; /* init to all zeros */
  static long last_edge_conds[MAX_ANALYSES] = {0L, 0L}; /* init to all zeros */
		 long  new_edge_conds[MAX_ANALYSES];
  long is_good_cond[MAX_ANALYSES];
  long last_cond;
  int is_good_analysis[MAX_ANALYSES];
  int anal_count;
  int found_good_anal;

  if ( word &&
	   word->pszOrigWord &&
	   strlen(word->pszOrigWord) > 0)
	{
	  if (do_trace && pStamp_in->pLogFP)
	fprintf(pStamp_in->pLogFP, "\n\n%s is being traced.", word->pszOrigWord);
#ifdef DEBUG
	  fprintf(stderr,"\n%s is being traced.", word->pszOrigWord);
#endif
				/* initialize */
	  j = 0;			/* init new_edge_conds index */
	  found_good_anal = FALSE;
				/* init array to keep track of good analyses */
/* %%%%%% use trAnalyses  */
	  for (anp = word->pAnalyses, i = 0;
	   anp != (WordAnalysis *)NULL && i < MAX_ANALYSES;
	   anp = anp->pNext, i++)
	is_good_analysis[i] = FALSE;
	  if (i >= MAX_ANALYSES)
	{
	  fprintf(pStamp_in->pLogFP,
		  "\n%s: too many analyses; maximum is %d", word->pszOrigWord,
		  MAX_ANALYSES);
	  fprintf(pStamp_in->pLogFP,
		  "\n\tall analyses after the maximum will not be used");
	}
				/* remove all edge conditions if word */
				/* is in phrase initial position */
	  if (is_phrase_initial(word, pStamp_in))
	{
	  max_conds = 1;
	  edge_conds[0] = 0L;
	}
				/* run through all previous edge_conditions */
	  for (i = 0; i < max_conds; i++)
	{
	  is_good_cond[i] = FALSE;	/* assume it will fail */
				/* process the word one ambiguity at a time */
/* %%%%%% use trAnalyses  */
	  for (anp = word->pAnalyses,
		 trp = pUnit_in->pCurrentWord->pTrAnalyses,
		 anal_count = 0;
		   anp != (WordAnalysis *)NULL &&
		 trp != (StampAnalysisList *)NULL &&
		 anal_count < MAX_ANALYSES;
		   anp = anp->pNext,
		 trp = trp->pNext,
		 anal_count++)
		{
		  next_edge_conds = 0L; /* init edge conditions that apply to
					   the next word */
		  if (do_trace && pStamp_in->pLogFP)
		{
		  fprintf(pStamp_in->pLogFP, "\n  Working on: %s",
			  anp->pszAnalysis);
		  fprintf(pStamp_in->pLogFP, "\n              %s",
			  anp->pszDecomposition);
		  show_edge_conds(pStamp_in->pLogFP, edge_conds[i]);
		}
#ifdef TONEGEN
				/* apply all obligatory tone rules */
#ifndef hab104
		  if (tone_anal(trp->pAnal, word, anp,
				edge_conds[i],
				&new_edge_conds[j], RIGHT_RULES, do_trace,
				pUnit_in, pStamp_in))
#else /* hab104 */
		  if (tone_anal(trp->pAnal, word, anp->pszDecomposition,
				edge_conds[i],
				&new_edge_conds[j], RIGHT_RULES, do_trace,
				pUnit_in, pStamp_in))
#endif /* hab104 */
		{
				/* remember that it is a good analysis */
		  found_good_anal = is_good_analysis[anal_count] = TRUE;
				/* remember that it is a good edge condition */
		  is_good_cond[i] = TRUE;
				/* save edge conditions by incrementing */
		  j++;	/* new_edge_conds array index */

		}
#else  /* TONEGEN */
#ifndef hab104
		 /* add properties from ANA file to analysis list */
		  addANAProperties(anp->pszProperties, trp->pAnal, pStamp_in);
#endif /* hab104 */
				/* apply all obligatory tone rules except the
				   right_edge ones; if that does not work,
				   then try all obligatory tone rules; if
				   that does not work, try all rules */
#ifndef hab104
		  if (tone_anal(trp->pAnal, word, anp,
				edge_conds[i],
				&new_edge_conds[j], NON_RIGHT, do_trace,
				pUnit_in, pStamp_in)                      ||
		  (pStamp_in->iTryRightEdgeRules &&
		   !is_phrase_final(word, pStamp_in) &&
		   tone_anal(trp->pAnal, word,  anp,
				 edge_conds[i],
				 &new_edge_conds[j], RIGHT_RULES, do_trace,
				 pUnit_in, pStamp_in))                     ||
		  (try_optional_rules &&
		   tone_anal(trp->pAnal, word,  anp,
				 edge_conds[i],
				 &new_edge_conds[j], ALL_RULES, do_trace,
				 pUnit_in, pStamp_in)))
#else /* hab104 */
		  if (tone_anal(trp->pAnal, word, anp->pszDecomposition,
				edge_conds[i],
				&new_edge_conds[j], NON_RIGHT, do_trace,
				pUnit_in, pStamp_in)                      ||
		  (pStamp_in->iTryRightEdgeRules &&
		   !is_phrase_final(word, pStamp_in) &&
		   tone_anal(trp->pAnal, word,  anp->pszDecomposition,
				 edge_conds[i],
				 &new_edge_conds[j], RIGHT_RULES, do_trace,
				 pUnit_in, pStamp_in))                     ||
		  (try_optional_rules &&
		   tone_anal(trp->pAnal, word,  anp->pszDecomposition,
				 edge_conds[i],
				 &new_edge_conds[j], ALL_RULES, do_trace,
				 pUnit_in, pStamp_in)))
#endif /* hab104 */
		{
				/* remember that it is a good analysis */
		  found_good_anal = is_good_analysis[anal_count] = TRUE;
				/* remember that it is a good edge condition */
		  is_good_cond[i] = TRUE;
				/* save edge conditions by incrementing */
		  j++;	/* new_edge_conds array index */

		}
#endif /* TONEGEN */
		}	   /* end of anp for loop */
	}	   /* end of i for loop */

#ifdef DEBUG_SILENT_FAILURE
	  /* NB: this is not working correctly.  It will remove an analysis if
	 any one of its edge conditions fails.  A given analysis, however,
	 may have more than one edge condition.  That is, Word i may have
	 two edge conditions.  Each analysis of Word i+1 will be tried for
	 both edge conditions.  Just because one of these fails, it does
	 follow that the other one also fails.  */
	  if (last_word      != (WordTemplate *)NULL &&
	  found_good_anal)
	{			/* found a good analysis in this word; */
#ifndef SILENT_FAILURE
		  fprintf(pStamp_in->pLogFP, "\nLast edge conds are:");
	  for (i=0; i < max_conds; i++)
		fprintf(pStamp_in->pLogFP, "\n\t%ld", last_edge_conds[i]);
		  fprintf(pStamp_in->pLogFP, "\nEdge conds are:");
	  for (i=0; i < max_conds; i++)
		fprintf(pStamp_in->pLogFP, "\n\t%ld", edge_conds[i]);
		  fprintf(pStamp_in->pLogFP, "\nIs good conds are:");
	  for (i=0; i < max_conds; i++)
		fprintf(pStamp_in->pLogFP, "\n\t%ld", is_good_cond[i]);
#endif
				/* remove any analyses from previous word */
				/* whose edge conditions failed to produce */
				/* a good analysis */
	  for (anp = last_word->pAnalyses,
		   anal_count = 0;
		   anp != (WordAnalysis *)NULL &&
		   anal_count < MAX_ANALYSES;
		   anp = anp2, anal_count++)
		{
		  anp2 = anp->pNext;
		  for (i = 0; i < max_conds; i++)
		if (last_edge_conds[anal_count] == edge_conds[i])
		  if (!is_good_cond[i])
			{
#ifndef SILENT_FAILURE
			  fprintf(pStamp_in->pLogFP, "\nRemoving: %s",
				  anp->pszAnalysis);
#endif
			  last_word = remove_bad_anal(last_word, anp);
			}
		}			/* end of anlp loop */
#ifndef SILENT_FAILURE
	  if (last_word->pAnalyses == (WordAnalysis *)NULL)
		fprintf(pStamp_in->pLogFP, "\nTF: %s [%s]",
			last_word->pszOrigWord, last_word->pszRootNodeWord);
#endif
	}	/* end of check for finding a good analysis */
#endif /* DEBUG_SILENT_FAILURE */
			/* save edge_conditions for next word. */
	  for (i = 0; i < j; i++)
	last_edge_conds[i] = new_edge_conds[i];
				/* throw away duplicate edge conditions by */
				/* sorting the array and copying only */
				/* unique entries */
	  max_conds = max(1, j);
	  qsort((VOIDP)new_edge_conds, (size_t)max_conds, sizeof(long),
		(COMPARISON)compare);
	  for (i = j = 0, last_cond = -1; j < max_conds; j++)
	{
	  if (last_cond != new_edge_conds[j])
		last_cond = edge_conds[i++] = new_edge_conds[j];
	}
	  max_conds = max(1,i);
				/* modify the anal, decomp and feature lists */
				/* according to whether or not the */
				/* corresponding analysis was "good" */
	  for (anp = word->pAnalyses,
		 trp = pUnit_in->pCurrentWord->pTrAnalyses,
		 i = 0;
	   anp != NULL &&
		 trp != (StampAnalysisList *)NULL &&
		 i < MAX_ANALYSES;
	   anp = anp2,
		 trp = trp2,
		 i++)
	{
	  anp2 = anp->pNext;
	  trp2 = trp->pNext;
	  if (!is_good_analysis[i])
		{
				/* remove the analysis */
		  word = remove_bad_anal(word, anp);
		  pUnit_in->pCurrentWord->pTrAnalyses =
			   remove_bad_tranal(pUnit_in->pCurrentWord->pTrAnalyses, trp);
		}
	}
				/* report any failures */
	  if (!found_good_anal && pStamp_in->pLogFP)
	fprintf(pStamp_in->pLogFP, "\nTF: %s [%s]",
		word->pszOrigWord,
		word->pszRootNodeWord == NULL ? word->pszOrigWord : word->pszRootNodeWord);
	}	/* end of if (word) */

}	/* end do_tone_anal */

/*************************************************************************
 * NAME
 *    extract_reg_tone_tier
 * ARGUMENTS
 *    t_tier_prim - pointer to head of primary tone tier
 *    do_trace    - tracing flag
 * DESCRIPTION
 *    Extract any register tones from the primary tone tier
 * RETURN VALUE
 *    pointer to the head of the register tone tier
 *	the pointer to the primary tone tier is also updated as a side effect
 */
static struct tone_list *extract_reg_tone_tier(t_tier_prim, do_trace,
						   pStamp_in)
	 struct tone_list **t_tier_prim;
	 int                do_trace;
	 StampData         *pStamp_in;
{
  struct tone_list *t_tier_reg, *ttr, *ttp, *ttpr;
  struct tone      *tp;

  ttr = t_tier_reg = (struct tone_list *)NULL;

				/* run through the primary tone tier */
  for (ttp = *t_tier_prim;
	   ttp != (struct tone_list *)NULL;
	   ttp = ttpr)
	{				/* save location of next element in primary */
	  ttpr = ttp->tonl_right;
				/* see if the tone has a register element */
	  if ((tp = ttp->tonl_tone)    != (struct tone *)NULL &&
	  tp->tone_value[REGISTER] != (int)NULL)
	{
				/* if there is no primary tone, ... */
	  if (tp->tone_value[PRIMARY] == (int)NULL)
		{
				/* ... delink the tone list element from */
				/* the primary tier ... */
		  if (ttp->tonl_left != (struct tone_list *)NULL)
		ttp->tonl_left->tonl_right = ttp->tonl_right;
		  else
		*t_tier_prim = ttp->tonl_right;
		  if (ttp->tonl_right != (struct tone_list *)NULL)
		ttp->tonl_right->tonl_left = ttp->tonl_left;
				/* ... and add it to the register tier */
		  if (ttr == (struct tone_list *)NULL)
		{
		  ttr = t_tier_reg = ttp;
		  ttr->tonl_left = (struct tone_list *)NULL;
		}
		  else
		{
		  ttr->tonl_right = ttp;
		  ttp->tonl_left  = ttr;
		  ttr = ttp;
		}
		  ttr->tonl_right = (struct tone_list *)NULL;
		}
	  else			/* there is also a primary tone; add an */
		{			/* element to the register tier */
		  t_tier_reg = add_tone_list(t_tier_reg, TAIL, ttp->tonl_tone);
		}
	}
	}

  if ((do_trace & TRACE_TONE_OLD) && pStamp_in->pLogFP)
	{
	  trace_msg(pStamp_in->pLogFP, "After Extract of Register Tone Tier:");
	  trace_tone_tier(pStamp_in, *t_tier_prim, PRIMARY);
	  trace_tone_tier(pStamp_in, t_tier_reg, REGISTER);
	}
				/* return pointer to head of reg tone tier */
  return(t_tier_reg);

}	/* end extract_reg_tone_tier */

/*************************************************************************
 * NAME
 *    get_end_of_allo
 * ARGUMENTS
 *    ap - pointer to allomorph
 *    rp - pointer to root_node list
 * DESCRIPTION
 *    Find the final root_node which matches the final segment of the allomorph
 * RETURN VALUE
 *    pointer to final root_node which corresponds to the final segment
 *	 of allomorph
 */
static struct root_node *get_end_of_allo(ap, rp)
	 char             *ap;
	 struct root_node *rp;
{
  char *cp;
  struct root_node *rp_org;

  for (rp_org = rp; rp != (struct root_node *)NULL; rp = rp->rn_right)
	{
	  if (rp->rn_seg != (struct segment *)NULL)
	{
	  cp = rp->rn_seg->seg_str;
	  while ((*cp != NUL) && (*ap != NUL) && (*cp == *ap))
		{
		  cp++;
		  ap++;
		}
	  if (*ap == NUL)
		return(rp);
	}
	}

  return(rp_org);

}	/* end get_end_of_allo */

/*************************************************************************
 * NAME
 *    get_next_allo
 * ARGUMENTS
 *    ap - pointer to allomorph buffer
 *    dp - pointer to decomp string
 * DESCRIPTION
 *    Place the next element of the decomp string into the allomorph buffer
 * RETURN VALUE
 *    NONE
 */
static void get_next_allo(ap, dp, pStamp_in)
	 char *ap;
	 char *dp;
	 StampData *pStamp_in;
{

  while ((*dp != pStamp_in->sTextCtl.cDecomp) && (*dp != NUL))
	*ap++ = *dp++;
  *ap = NUL;

}	/* end get_next_allo */

/***************************************************************************
 * NAME
 *    get_morph_pos
 * ARGUMENTS
 *    pos - position code stored in a test tree leaf node
 * DESCRIPTION
 *    Get the pointer to the desired morpheme in the analysis list
 * RETURNS:
 *    pointer to analysis node, or NULL if invalid position code
 */
static StampAnalysis *get_morph_pos(pos, pStamp_in)
	 int pos;
	 StampData *pStamp_in;
{
  switch (pos)
	{
	case ARGCURRENT:
	  return( t_current );

	case ARGLEFT:
	  return((t_current != (StampAnalysis *)NULL) ? t_current->pLeftLink
										: (StampAnalysis *)NULL);

	case ARGLEFTTWO:
	  return((t_current != (StampAnalysis *)NULL) ?
		 ( (t_current->pLeftLink != (StampAnalysis *)NULL) ?
			t_current->pLeftLink->pLeftLink : (StampAnalysis *)NULL)
								  : (StampAnalysis *)NULL);

	case ARGRIGHT:
	  return((t_current != (StampAnalysis *)NULL) ? t_current->pRightLink
										: (StampAnalysis *)NULL);

	case ARGRIGHTTWO:
	  return((t_current != (StampAnalysis *)NULL) ?
		 ( (t_current->pRightLink != (StampAnalysis *)NULL) ?
			t_current->pRightLink->pRightLink : (StampAnalysis *)NULL)
									: (StampAnalysis *)NULL);

#ifndef hab105
	case FORLEFT:
	  return( pForLeft_m );

	case FORRIGHT:
	  return( pForRight_m );
#endif /* hab105 */

	case WINITIAL:
	case INITIALM:
#ifdef ORIGTP
	  return( lefthead);
#else
	  return( pStamp_in->pInitialMorpheme );
#endif

	case WFINAL:
	case FINALM:
#ifdef ORIGTP
	  return( righthead);
#else
	  return( pStamp_in->pFinalMorpheme );
#endif
	}
  return( (StampAnalysis *)NULL );

}	/* end get_morph_pos */

/***************************************************************************
 * NAME
 *    get_tone_pos
 * ARGUMENTS
 *    pos - position code stored in a test tree leaf node
 * DESCRIPTION
 *    Get the pointer to the desired tone in the tone list
 * RETURNS:
 *    pointer to tone node, or NULL if invalid position code
 */
static struct tone *get_tone_pos(pos)
	 int pos;
{
  switch (pos)
	{
	case ARGCURRENT:
	  return( t_tone );

	case ARGLEFT:
	  return( (t_tone != (struct tone *)NULL) ? t_tone->tone_left
								  : (struct tone *)NULL);

	case ARGRIGHT:
	  return( (t_tone != (struct tone *)NULL) ? t_tone->tone_right
								  : (struct tone *)NULL);

	case WINITIAL:
	case INITIALM:
	  return( t_pwp->wd_tones );

	case WFINAL:
	case FINALM:
	  return( end_of_tone_nodes(t_pwp->wd_tones) );
	}
  return( (struct tone *)NULL );

}	/* end get_tone_pos */

/****************************************************************************
 * NAME
 *    is_phrase_final
 * ARGUMENTS
 *    word   - pointer to a word_template struct
 * DESCRIPTION
 *    determine if a word is in phrase final position or not
 * RETURN VALUE
 *    TRUE if it is in phrase final position
 *    FALSE otherwise
 */
static int is_phrase_final (word, pStamp_in)
	 WordTemplate *word;
	 StampData    *pStamp_in;
{
				/* if the trailing alphabetics contain any */
				/* punctuation indicating phrase finality, */
				/* return TRUE */
  if (word->pszNonAlpha != (char *)NULL)
	if (strcspn(word->pszNonAlpha, pStamp_in->pszPhraseFinalChars) !=
											strlen(word->pszNonAlpha))
	  return(TRUE);

  return(FALSE);
}	/* end is_phrase_final */

/****************************************************************************
 * NAME
 *    init_tone_rule_types
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    determine pointers to initial and final tone rules and initial and
 *    final cyclic tone rules
 * RETURN VALUE
 *    NONE
 */
void init_tone_rule_types ()
{
  struct tone_rule *trp, *tr_lastp;

				/* initial tone rule */
  trh = get_tone_rule_head();
				/* get the 1st cyclic  = trcybeg
				   and last cyclic = trcyend tone rules */
  for (trp = tr_lastp = trh,
	   trcybeg = trcyend = (struct tone_rule *)NULL;
	   trp != (struct tone_rule *)NULL &&
	   trcyend == (struct tone_rule *)NULL;
	   tr_lastp = trp, trp = trp->tr_right)
	{
	  if (RULE_CYCLICITY(trp->tr_params))
	{
	  if (trcybeg == (struct tone_rule *)NULL)
		trcybeg = trp;
	}
	  else
	{
	  if (trcybeg != (struct tone_rule *)NULL)
		trcyend = tr_lastp;
	}
	  if (OPTIONALITY(trp->tr_params))
	try_optional_rules++;
	}
				/* make sure got trcyend */
  if (trcybeg != (struct tone_rule *)NULL &&
	  trcyend == (struct tone_rule *)NULL)
	trcyend = tr_lastp;
				/* final tone rule */
  trt = get_tone_rule_tail();

}	/* end init_tone_rule_types */

/****************************************************************************
 * NAME
 *    is_phrase_initial
 * ARGUMENTS
 *    word   - pointer to a word_template struct
 * DESCRIPTION
 *    determine if a word is in phrase initial position or not
 * RETURN VALUE
 *    TRUE if it is in phrase initial position
 *    FALSE otherwise
 */
static int is_phrase_initial (word, pStamp_in)
	 WordTemplate *word;
	 StampData    *pStamp_in;
{
				/* if the trailing alphabetics contain any */
				/* punctuation indicating phrase initiality, */
				/* return TRUE */
  if (word->pszFormat != (char *)NULL)
	if (strcspn(word->pszFormat, pStamp_in->pszPhraseFinalChars) !=
											strlen(word->pszFormat))
	  return(TRUE);

  return(FALSE);
}	/* end is_phrase_initial */

/*************************************************************************
 * NAME
 *    link_anal_to_rns
 * ARGUMENTS
 *    ap_head - pointer to head of analysis list
 *    dp_head - pointer to decomposition string
 *    rp_head - pointer to root_node list
 *    do_trace - tracing flag
 * DESCRIPTION
 *    Using the decomposition string, create pointers from morphemes in
 *    the analysis list to their respective initial and final root_nodes
 *    in the root_node list.
 * RETURN VALUE
 *    NONE
 */
static void link_anal_to_rns(ap_head, dp_head, rp_head, do_trace,
				 pStamp_in)
	 StampAnalysis  *ap_head;
	 char             *dp_head;
	 struct root_node *rp_head;
	 int               do_trace;
	 StampData        *pStamp_in;
{
  char allo_buf[BUFSIZE];
  StampAnalysis  *ap;
  struct root_node *rp;

				/* run through the list of analysis structs */
  for (ap = ap_head, rp = rp_head;
	   ap != (StampAnalysis *)NULL;
	   ap = ap->pRightLink)
	{
				/* get next allomorph from decomp string */
	  get_next_allo(allo_buf, dp_head, pStamp_in);
	  dp_head += strlen(allo_buf) + 1;
				/* set pointers to matching root_nodes */
	  if (streq(allo_buf, "0"))  	/* check for null */
	ap->pRNBeg = ap->pRNEnd = (struct root_node *)NULL;
	  else
	{			/* is non-null */
	  ap->pRNBeg = rp;
	  ap->pRNEnd = rp = get_end_of_allo(allo_buf, rp);
	  if (rp != (struct root_node *)NULL)
		  rp = rp->rn_right;
				/* previous is a patch to deal with the */
				/* case where a morpheme break occurs */
				/* within a segment (e.g. -n-d- when there */
				/* is a segment "nd"). The second */
				/* morpheme will be assumed to be null. */
	}
	}
  if ((do_trace & TRACE_LINK_ANAL) && pStamp_in->pLogFP)
	{
	  fprintf(pStamp_in->pLogFP, "\nMorpheme-root node linkage:");
	  for (ap = ap_head;
	   ap != (StampAnalysis *)NULL;
	   ap = ap->pRightLink)
	{
	  fprintf(pStamp_in->pLogFP, "\n\tMorpheme %s is ", ap->m.pszMorphname);
	  if (ap->pRNBeg == (struct root_node *)NULL)
		fprintf(pStamp_in->pLogFP, "null");
	  else
		if (ap->pRNBeg->rn_seg != (struct segment *)NULL &&
		ap->pRNEnd->rn_seg != (struct segment *)NULL)
		  fprintf(pStamp_in->pLogFP, "from %s to %s",
			  ap->pRNBeg->rn_seg->seg_str,
			  ap->pRNEnd->rn_seg->seg_str);
		else
		  fprintf(pStamp_in->pLogFP, "corrupted!");
	}
	}
}	/* end link_anal_to_rns */

/*************************************************************************
 * NAME
 *    link_anal_to_tbus
 * ARGUMENTS
 *    ap_head   - pointer to head of analysis list
 *    tbu_type  - type of tone bearing unit
 *    tbu_headp - pointer to head of tbu list
 *    do_trace  - tracing flag
 * DESCRIPTION
 *    Create pointers from morphemes in the analysis list to their respective
 *    initial and final tbus in the tbu list
 * RETURN VALUE
 *    pointer to head of tbu list
 */
static struct tbu *link_anal_to_tbus(ap_head, tbu_type, tbu_headp, do_trace,
					 pStamp_in)
	 StampAnalysis  *ap_head;
	 int             tbu_type;
	 struct tbu     *tbu_headp;
	 int             do_trace;
	 StampData      *pStamp_in;
{
  StampAnalysis  *ap;
  struct tbu       *tbl, *tbr;
  int iProp;
				/* run through the list of analysis structs */

  for (ap = ap_head;
	   ap != (StampAnalysis *)NULL;
	   ap = ap->pRightLink)
	{
				/* create the pointers */
	  ap->pTBUBeg = get_edge_tbu(ap->pRNBeg, ap->pRNEnd, tbu_type, LEFT );
	  ap->pTBUEnd = get_edge_tbu(ap->pRNBeg, ap->pRNEnd, tbu_type, RIGHT);
				/* process any exceptions */
	  if (ap->m.pAllomorphs != (StampAllomorphList *)NULL)
	{
	  if ((iProp = findAmplePropertyNumber("no_tbus",
						   &pStamp_in->sProperties)))
		{
		  if (hasAmpleProperty(ap->m.pAllomorphs->a.uAlloPropertySet,
				   iProp,
				   &pStamp_in->sProperties))
		{
				/* remove links around exceptional form */
		  tbl = ap->pTBUBeg;
		  tbr = ap->pTBUEnd;
		  if (tbl != (struct tbu *)NULL &&
			  tbr != (struct tbu *)NULL)
			{
			  if (tbl->tbu_left != (struct tbu *)NULL)
			tbl->tbu_left->tbu_right = tbr->tbu_right;
			  else
			tbu_headp = tbr->tbu_right;
			  if (tbr->tbu_right != (struct tbu *)NULL)
			tbr->tbu_right->tbu_left = tbl->tbu_left;
			  tbr->tbu_right = (struct tbu*)NULL;
			}
				/* free up the memory used by the tbus */
		  free_tbus(tbl);
				/* set analysis struct pointers to null */
		  ap->pTBUBeg= ap->pTBUEnd = (struct tbu *)NULL;
		}
		}
	}
	}

  if ((do_trace & TRACE_TBU) && pStamp_in->pLogFP)
	{
	  fprintf(pStamp_in->pLogFP, "\nMorpheme-tbu linkage:");
	  for (ap = ap_head;
	   ap != (StampAnalysis *)NULL;
	   ap = ap->pRightLink)
	{
	  fprintf(pStamp_in->pLogFP, "\n\tMorpheme %s", ap->m.pszMorphname);
	  if (ap->pTBUBeg == (struct tbu *)NULL)
		fprintf(pStamp_in->pLogFP, " does not have any tbu's");
	  else
		if (ap->pTBUBeg != (struct tbu *)NULL &&
		ap->pTBUEnd != (struct tbu *)NULL)
		  {
		fprintf(pStamp_in->pLogFP, ": left-most tbu is");
		show_tbu(ap->pTBUBeg, pStamp_in);
		fprintf(pStamp_in->pLogFP, "\n\t\t\t right-most tbu is");
		show_tbu(ap->pTBUEnd, pStamp_in);
		  }
		else
		  fprintf(pStamp_in->pLogFP, "corrupted!");
	}
	}

  return(tbu_headp);

}	/* end link_anal_to_tbus */

#ifdef KINANDE
/*************************************************************************
 * NAME
 *    macrostem_high_tone_spread
 * ARGUMENTS
 *    t_tier_headp - pointer to head of tone tier
 *    dp           - pointer to head of domain tree
 *    tbu_type     - type of tone bearing unit
 *    do_trace     - tracing flag
 * DESCRIPTION
 *    do HTA rule
 * RETURN VALUE
 *    NONE
 */
static void macrostem_high_tone_spread(t_tier_headp, dp, tbu_type, do_trace)
	 struct tone_list *t_tier_headp;
	 struct domain    *dp;
	 int               tbu_type;
	 int               do_trace;
{
  struct tone_list *tlp;
  struct tone      *tp;
  struct tbu       *tbu_orig;

  for (tlp = t_tier_headp;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	{
				/* if is a linked H tone and is in the */
				/* VerbalWord domain ...*/
	  if (tone_id((tp = tlp->tonl_tone), PRIMARY, "linked", "H") &&
	  tone_is_in_domain(tp, tbu_type, dp, "VerbalWord"))
	{
				/* link it to the tbu to the left */
	  tbu_orig = spread_tone(tp, PRIMARY, FEATURE_CHANGING, LEFT,
				 NON_ITERATIVE, (int)NULL, OCP_IGNORED,
				 (char *)NULL);
	}
	}

  if ((do_trace & TRACE_TONE_TIER) && pStamp_in->pLogFP)
	{
	  trace_msg(pOutputFP_in, "After MHTS:");
	  trace_tone_tier(t_tier_headp, PRIMARY);
	}

}	/* end macrostem_high_tone_spread */
#endif	/* KINANDE */

#ifdef ORIGTP
/*************************************************************************
 * NAME
 *    parse_analysis
 * ARGUMENTS
 *    analstring - analysis character string produced by AMPLE
 * DESCRIPTION
 *    Parse an analysis string (presumably produced by AMPLE), creating
 *    a linked list of analysis struct's for use in transfer and synthesis.
 * RETURN VALUE
 *    pointer to a list of analysis struct's
 */
static StampAnalysis *parse_analysis(analstring, pOutputFP_in)
	 char *analstring;
	 FILE *pOutputFP_in;
{
register char *p;
char *nextp;
char *catp;
register StampAnalysis *ap;
StampAnalysis *ap0;
StampAnalysis *head, *left;
StampMorpheme *mp;
char buffer[BUFSIZE];
short state;			/* finite state machine state */
#define WANT_PREFIX	0
#define WANT_ROOTCAT	1
#define WANT_ROOTNAME	2
#define WANT_SUFFIX	3

/*
 *  check that we have something to do
 */
if (analstring == (char *)NULL)
	return( (StampAnalysis *)NULL );
/*
 *  initialize the state and some pointers
 */
state = WANT_PREFIX;
left = (StampAnalysis *)NULL;
head = (StampAnalysis *)NULL;
ap   = (StampAnalysis *)NULL;
catp = (char *)NULL;
strcpy(buffer, analstring);	/* (save analstring for error messages) */
/*
 *  scan across the analysis string
 */
for ( p = skipwhite(buffer) ; *p != NUL ; p = skipwhite(nextp) )
	{
	/*
	 *  check for state switching markers
	 */
	if (*p == root_begin)	/* is it the marker beginning roots? */
	{
	if (state == WANT_SUFFIX)
		{
		/* run back through and change any preceding suffixes to prefix */
		for (ap0 = ap;
		 ap0 != (StampAnalysis *) NULL && ap0->m.iMorphType & SFX;
		 ap0 = ap0->pLeftLink)
		  ap0->m.iMorphType = PFX;
		}
	else if (state != WANT_PREFIX)
		{
		fprintf(pOutputFP_in,
		  "%sInvalid marker '%c' found in analysis string\n        %s",
		   errhead, root_begin, analstring);
		freeStampAnalysis( head );
		return( (StampAnalysis *)NULL );
		}
	state = WANT_ROOTCAT;	/* next thing we want is a root category */
	nextp = p + 1;
	continue;
	}
	if (*p == root_end)		/* is it the marker ending roots? */
	{
	if (state != WANT_ROOTCAT)
		{
		fprintf(pOutputFP_in,
		  "%sInvalid marker '%c' found in analysis string\n        %s",
			errhead, root_end, analstring);
		freeStampAnalysis( head );
		return( (StampAnalysis *)NULL );
		}
	state = WANT_SUFFIX;	/* now we go looking for suffixes */
	nextp = p + 1;
	continue;
	}
	/*
	 *  handle the token in the input string according to the state
	 */
	nextp = isolateWord(p);		/* split out the token */
	switch (state)
	{
	case WANT_PREFIX:
		ap = link_analysis(	left, new_analysis(PFX,p,(char *)NULL) );
#ifdef TONEPARS
		if ((mp = search_dict(PFX, p, (unsigned char)NULL)) != (StampMorpheme *)NULL)
		  copy_morpheme_info(ap, mp);
		else
		  fprintf(pOutputFP_in,
			  "%sMorpheme %s not in prefix dictionary", errhead, p);
#endif /* TONEPARS */
		if (head == (StampAnalysis *)NULL)
		head = ap;
		left = ap;		/* save trailing pointer for linking later */
		break;

	case WANT_ROOTCAT:
		catp = p;			/* save the address of the catname */
		state = WANT_ROOTNAME;
		break;

	case WANT_ROOTNAME:
		ap = link_analysis(	left, new_analysis(ROOT,p,catp) );
#ifdef TONEPARS
		if ((mp = search_dict(ROOT, p, (unsigned char)NULL)) != (StampMorpheme *)NULL)
		  copy_morpheme_info(ap, mp);
		else
		  fprintf(pOutputFP_in, "%sMorpheme %s not in root dictionary",
			  errhead, p);
#endif /* TONEPARS */
		if (head == (StampAnalysis *)NULL)
		head = ap;
		left = ap;		/* save trailing pointer for linking later */
		state = WANT_ROOTCAT;
		break;

	case WANT_SUFFIX:
		ap = link_analysis(	left, new_analysis(SFX,p,(char *)NULL) );
#ifdef TONEPARS
		if ((mp = search_dict(SFX, p, (unsigned char)NULL)) != (StampMorpheme *)NULL)
		  copy_morpheme_info(ap, mp);
		else
		  fprintf(pOutputFP_in, "%sMorpheme %s not in suffix dictionary",
			  errhead, p);
#endif /* TONEPARS */
		if (head == (StampAnalysis *)NULL)
		head = ap;
		left = ap;		/* save trailing pointer for linking later */
		break;

	} /* end switch */

	} /* end for */

/*
 *  check that we're in the right state at the end before accepting this
 *  analysis
 */
if (state != WANT_SUFFIX)       /* accept only valid input */
	{
	fprintf(pOutputFP_in, "%sInvalid analysis string\n        %s",
		errhead, analstring);
	freeStampAnalysis( head );
	return( (StampAnalysis *)NULL );
	}
if (do_debug)
	{				/* user wants it, so... */
	fprintf(pOutputFP_in, "\nINPUT ANALYSIS MORPHEME LIST:");
	show_analysis(head);
	}

lefthead = head;		/* save location of initial morpheme */
				/* get  location of final   morpheme*/
for (righthead = head;
	 righthead != (StampAnalysis *)NULL &&
	 righthead->pRightLink != (StampAnalysis *)NULL;
	 righthead = righthead->pRightLink)
  ;
return( head );			/* we've done it! */

}	/* end parse_analysis */
#endif /* ORIGTP */

#ifdef KINANDE
/*************************************************************************
 * NAME
 *    rebuild_tone_tier
 * ARGUMENTS
 *    rn_head  - pointer to head of root_nodes
 *    tbu_type - type of tone bearing unit
 * DESCRIPTION
 *    rebuild the tone tier (a tone_list struct)
 * RETURN VALUE
 *    pointer to the head of the tone tier
 */
static struct tone_list *rebuild_tone_tier(rn_head, tbu_type)
	 struct root_node *rn_head;
	 int              tbu_type;
{
  struct root_node *rnp;
  struct tbu *tbp;
  struct tone_list *t_tier_headp;
  struct tone_list *tlp = (struct tone_list *)NULL;

  t_tier_headp = (struct tone_list *)NULL;

				/* run through the list of root_nodes */
  for (rnp = rn_head;
	   rnp != (struct root_node *)NULL;
	   rnp = rnp->rn_right)
	{				/* place a copy of each tone in the */
				/* lexical entry into the tone tier */
	  switch (tbu_type)
	{
	default:
	case MORA_TBU:
	  if (rnp->rn_mora[0] != (struct mora *)NULL)
		{
		  if ((tbp = rnp->rn_mora[0]->mora_tbu) != (struct tbu *)NULL)
		for (tlp = tbp->tbu_tonel;
			 tlp != (struct tone_list *)NULL;
			 tlp = tlp->tonl_right)
		  {
		  if (!is_in_tone_list(tlp->tonl_tone, t_tier_headp))
			{
				/* add an element to the tone tier */
			  t_tier_headp = add_tone_list(t_tier_headp, TAIL,
						   tlp->tonl_tone);
			}
		}
		}
	  break;

	case SYLLABLE_TBU:
	  /* later */
	  break;

	case VOWEL_TBU:
	  /* later */
	  break;
	}

	}

				/* return pointer to head of tone tier */
  return(t_tier_headp);

}	/* end rebuild_tone_tier */
#endif	/* KINANDE */

/***************************************************************************
 * NAME
 *    reconstruct_word
 * ARGUMENTS
 *    decomp - pointer to decomposition string
 * DESCRIPTION
 *    Reconstruct the orthochanged word from a decomposition string.
 * RETURN VALUE
 *    the reconstructed word
 */
static char *reconstruct_word(decomp, pStamp_in)
	 char *decomp;
	 StampData *pStamp_in;
{
register char *w, *d;
char *pszResult;

d = decomp;
pszResult = w = allocMemory((unsigned)strlen(d)+1);
while (*d != NUL)
	{
	if ((*d != pStamp_in->sTextCtl.cDecomp) && (*d != '0'))	/* skip decomp and nulls */
	*w++ = *d++;
	else
	++d;
	}
*w = NUL;

return(pszResult);
}

/*************************************************************************
 * NAME
 *    remove_bad_anal
 * ARGUMENTS
 *    word    - pointer to word template struct
 *    anp     - pointer to pAnalyses element to remove
 * DESCRIPTION
 *    remove designated elements from corresponding strlists
 * RETURN VALUE
 *    pointer to the word struct
 */
static WordTemplate *remove_bad_anal(word, anp)
	 WordTemplate *word;
	 WordAnalysis *anp;
{
  WordAnalysis *pCurrent;
  WordAnalysis *pLast = NULL;
  WordAnalysis *pFollowing = NULL;

  for (pCurrent = word->pAnalyses;
	   pCurrent != (WordAnalysis *)NULL;
	   pCurrent = pFollowing)
	{
	  pFollowing = pCurrent->pNext;
	  if (pCurrent == anp)
	{			/* remove the pAnalyses element */
	  if (pLast)
		pLast->pNext = pCurrent->pNext;
	  else
		word->pAnalyses = pCurrent->pNext;
				/* free memory */
	  if (pCurrent->pszAnalysis != NULL)
		freeMemory( pCurrent->pszAnalysis );
	  if (pCurrent->pszDecomposition != NULL)
		freeMemory( pCurrent->pszDecomposition );
	  if (pCurrent->pszCategory != NULL)
		freeMemory( pCurrent->pszCategory );
	  if (pCurrent->pszProperties != NULL)
		freeMemory( pCurrent->pszProperties );
	  if (pCurrent->pszFeatures != NULL)
		freeMemory( pCurrent->pszFeatures );
	  if (pCurrent->pszUnderlyingForm != NULL)
		freeMemory( pCurrent->pszUnderlyingForm );
	  if (pCurrent->pszSurfaceForm != NULL)
		freeMemory( pCurrent->pszSurfaceForm );
	  freeMemory( pCurrent );
	}
	  else
	pLast = pCurrent;
	}
  return(word);
}	/* end remove_bad_anal */

/*************************************************************************
 * NAME
 *    remove_bad_tranal
 * ARGUMENTS
 *    list    - pointer to StampAnalysisList struct
 *    tranp   - pointer to StampAnalysisList element to remove
 * DESCRIPTION
 *    remove designated elements from corresponding lists
 * RETURN VALUE
 *    pointer to the StampAnalysisList struct
 */
static StampAnalysisList *remove_bad_tranal(list, tranp)
	 StampAnalysisList *list;
	 StampAnalysisList *tranp;
{
  StampAnalysisList *pCurrent;
  StampAnalysisList *pLast = NULL;
  StampAnalysisList *pFollowing = NULL;

  for (pCurrent = list;
	   pCurrent != (StampAnalysisList *)NULL;
	   pCurrent = pFollowing)
	{
	  pFollowing = pCurrent->pNext;
	  if (pCurrent == tranp)
	{			/* remove the pAnal element */
	  if (pLast)
		pLast->pNext = pCurrent->pNext;
	  else
		list = pCurrent->pNext;
				/* free memory */
	  freeMemory( pCurrent->pAnal );
	  freeMemory( pCurrent );
	}
	  else
	pLast = pCurrent;
	}
  return(list);
}	/* end remove_bad_tranal */

/*************************************************************************
 * NAME
 *    rule_condition_met
 * ARGUMENTS
 *    conds  - edge conditions
 * DESCRIPTION
 *    Show edge conditions:
 * RETURN VALUE
 *    NONE
 */
#ifndef hab104
static int rule_condition_met(trp, ap, pwp, dp, tbu_type, edge_conds,
				 tp, pWordAnal_in, pStamp_in)
#else /* hab104 */
static int rule_condition_met(trp, ap, pwp, dp, tbu_type, edge_conds,
				 tp, pStamp_in)
#endif /* hab104 */
	 struct tone_rule *trp;
	 StampAnalysis    *ap;
	 struct pword     *pwp;
	 struct domain    *dp;
	 int               tbu_type;
	 long              edge_conds;
	 struct tone      *tp;
#ifndef hab104
	 WordAnalysis     *pWordAnal_in;
#endif /* hab104 */
	 StampData        *pStamp_in;
{

  t_rule         = trp;	/* save test node for error messages */
  t_current      = ap;	/* store the invariant values for the tree walk */
  t_pwp          = pwp;
  t_dp           = dp;
  t_edgeconds    = edge_conds;
  t_tbutype      = tbu_type;
  t_tone         = tp;
#ifndef hab104
  t_wordanal     = pWordAnal_in;

  return( utest( trp->tr_cond, pWordAnal_in, pStamp_in ) );
#else /* hab104 */
  return( utest( trp->tr_cond, pStamp_in ) );
#endif /* hab104 */

}	/* end rule_condition_met */

/*************************************************************************
 * NAME
 *    show_edge_conds
 * ARGUMENTS
 *    conds  - edge conditions
 * DESCRIPTION
 *    Show edge conditions:
 * RETURN VALUE
 *    NONE
 */
static void show_edge_conds(pOutputFP_in, conds)
	 FILE *pOutputFP_in;
	 long conds;
{
  int  i, count;
  long cond, j;

  trace_msg(pOutputFP_in, "Edge conditions are:");
  if (!conds)
	fprintf(pOutputFP_in, " (none)");
  else
	{
	  count = 0;

	  for (i = 0, cond = 1L;
	   i < Max_Edge_Conds;
	   i++,   cond *= 2)
	{
	  if ((j = conds & cond))
		{
		  if (count++)
		putc(',', pOutputFP_in);
		  putc(' ', pOutputFP_in);
		  show_edge_cond(j, pOutputFP_in);
		}
	}
	  if (count > 1)
	fprintf(pOutputFP_in, " apply");
	  else if (count == 1)
	fprintf(pOutputFP_in, " applies");
	}

}	/* end show_edge_conds */

/*************************************************************************
 * NAME
 *    tone_anal
 * ARGUMENTS
 *    analstring     - NUL-terminated character string of morph names
 ifndef hab104
 *    pWordAnal_in   - pointer to Word analysis struct
 else * hab104 *
 *    decompstring   - NUL-terminated character string of decomposition
 endif * hab104 *
 *    word           - pointer to template of current word
 *    syl_algorithm  - algorithm to use in syllabification (s/b in next var.)
 *    syl_flags      - syllabification flags
 *    tbu_type       - type of tone bearing unit
 *    edge_conds     - flag to indicate if structural description of rules met
 *    new_edge_conds - edge conditions for analyzed word
 *    which_rules    - which rules to apply flag (all or all but right_edge)
 *    do_trace       - tracing flag
 * DESCRIPTION
 *    Convert a character string in format produced by AMPLE into a linked
 *    list of analysis struct's which have had the tone analysis rules
 *    applied.
 * RETURN VALUE
 *    TRUE if pointer to the created list of analysis morphemes;
 *    new_edge_conds is also set as a side effect
 */
#ifndef hab104
static int tone_anal(anal_head, word, pWordAnal_in,
			 edge_conds, new_edge_conds, which_rules, do_trace,
			 pUnit_in, pStamp_in)
#else /* hab104 */
static int tone_anal(anal_head, word, decompstring,
			 edge_conds, new_edge_conds, which_rules, do_trace,
			 pUnit_in, pStamp_in)
#endif /* hab104 */
	 StampAnalysis *anal_head;
	 WordTemplate *word;
#ifndef hab104
	 WordAnalysis *pWordAnal_in;
#else /* hab104 */
	 char *decompstring;
#endif /* hab104 */
	 int    which_rules, do_trace;
	 long   edge_conds, *new_edge_conds;
	 StampUnit *pUnit_in;
	 StampData *pStamp_in;
{
  char *cp;
  char *pszWordForRootNode;
#ifndef TONEGEN
  char *cp1;
#endif /* TONEGEN */
  struct pword PWord;
  struct domain *dp;
  int               form_is_good;
#ifndef hab104
  char *decompstring = pWordAnal_in->pszDecomposition;
#endif /* hab104 */

				/* save locations of initial and final
				   morphemes for rule processing */
  pStamp_in->pInitialMorpheme = anal_head;
  for (pStamp_in->pFinalMorpheme = anal_head;
	   pStamp_in->pFinalMorpheme != (StampAnalysis *)NULL &&
	 pStamp_in->pFinalMorpheme->pRightLink != (StampAnalysis *)NULL;
	   pStamp_in->pFinalMorpheme = pStamp_in->pFinalMorpheme->pRightLink)
	;

  if (do_trace && pStamp_in->pLogFP)
	if (which_rules == RIGHT_RULES)
	  {
	fprintf(pStamp_in->pLogFP, "\n        Non-right edge rules failed;");
	fprintf(pStamp_in->pLogFP, "  trying all obligatory rules.");
	  }
	else if (which_rules == ALL_RULES)
	  {
	fprintf(pStamp_in->pLogFP, "\n        All obligatory rules failed;");
	fprintf(pStamp_in->pLogFP, "  trying all rules.");
	  }

				/* assume it will fail */
  form_is_good = FALSE;

  init_pword(&PWord);

#ifdef TONEGEN
				/* create word string and decompstring */
  /* freeMemory(word->pszRootNodeWord); */
  /*  word->pszRootNodeWord = duplicateString(synlist->pszString); */
  /* %%%%%%% what should the above be??? */
  decompstring = build_decomp_string(anal_head, pStamp_in);
#endif /* TONEGEN */
  pszWordForRootNode = reconstruct_word(decompstring, pStamp_in);
  word->pszRootNodeWord = pszWordForRootNode;

#ifdef ORIG
  /* #else*/  /* TONEGEN */
  if (pUnit_in->pCurrentWord->pTemplate->iCapital)
	pszWordForRootNode = pUnit_in->pCurrentWord->pTemplate->paWord[0];
  else
	pszWordForRootNode = pUnit_in->pCurrentWord->pTemplate->pszOrigWord;

  /* #endif */ /* TONEGEN */
#endif /* ORIG */
				/* build segment structs */
#ifdef ORIGTP
  PWord.wd_rn = segment_parse(word->word, Segments, do_trace);
#else  /* ORIGTP */
  PWord.wd_rn = segment_parse(pszWordForRootNode, pStamp_in->pSegments,
				  do_trace, pStamp_in);
#endif /* ORIGTP */
  if (PWord.wd_rn == (struct root_node *)NULL)
	{				/* cannot go on if can't parse the segments; */
#ifdef ORIGTP
				/* free tone structs used in analysis structs*/
	  free_tones_in_anal(anal_head);
				/* free the analysis structs */
	  freeStampAnalysis(anal_head);
#endif /* ORIGTP */

	  return(FALSE);
	}

				/* assign moras */
  mora_assignment((struct root_node *)PWord.wd_rn, do_trace, pStamp_in);

				/* build syllables */
  syllable_parse ((struct root_node *)PWord.wd_rn, do_trace, pStamp_in);
  PWord.wd_syl = PWord.wd_rn->rn_syl;

				/* build tone bearing units */
  PWord.wd_tbu = build_tbus((struct syllable *)PWord.wd_syl,
				do_trace, pStamp_in);

				/* create correspondence between analysis */
				/* and root_nodes */
  link_anal_to_rns(anal_head, decompstring, PWord.wd_rn, do_trace, pStamp_in);

#ifdef TONEGEN
  freeMemory(decompstring);		/* no longer needed */
#endif  /* TONEGEN */
				/* create correspondence between analysis */
				/* and tbus */
  PWord.wd_tbu = link_anal_to_tbus(anal_head, pStamp_in->iTbuType,
				   PWord.wd_tbu,
				   do_trace, pStamp_in);

				/* build the (Primary) tone tier */
				/* (including register tones) */
  build_tone_tier(&PWord, anal_head, do_trace, pStamp_in);
				/* extract register tones to their own tier */
  PWord.wd_tier[REGISTER] = extract_reg_tone_tier(&PWord.wd_tier[PRIMARY],
						  do_trace, pStamp_in);

  if ((do_trace & TRACE_TONE_TIER) && pStamp_in->pLogFP)
	{
	  trace_msg(pStamp_in->pLogFP, "Underlying tones:");
	  draw_tone_diagram(&PWord, pStamp_in->pLogFP);
	  fprintf(pStamp_in->pLogFP, "\n\t\t%s",
		  build_word_with_tone_marked(PWord.wd_rn, pStamp_in->iTbuType,
					  SHOW_DERIVATION,
					  (int)NULL, pStamp_in->pLogFP));
	  Max_Edge_Conds = get_max_edge_conds();
	}

				/* build the domain structure */
  dp = build_domains(anal_head, pszWordForRootNode, do_trace);

				/* apply tone rules */
#ifndef hab104
  apply_tone_rules(anal_head, word, &PWord, dp, pStamp_in->iTbuType,
		   &edge_conds, which_rules, do_trace, pWordAnal_in,pStamp_in);
#else /* hab104 */
  apply_tone_rules(anal_head, word, &PWord, dp, pStamp_in->iTbuType,
		   &edge_conds, which_rules, do_trace, pStamp_in);
#endif /* hab104 */

				/* create word with tone marked */
  cp = build_word_with_tone_marked(PWord.wd_rn, pStamp_in->iTbuType,
				   SHOW_ORTHOGRAPHY,
				   do_trace, pStamp_in->pLogFP);

#ifdef TONEGEN
				/* assume that form is good */
  form_is_good = TRUE;
  if (word->pNewWords)
	{
	  freeStringList(word->pNewWords);
	  word->pNewWords = NULL;
	}
  word->pNewWords = addToStringList(word->pNewWords, cp);
				/* remember right edge state of tone tiers */
#ifndef hab104
  *new_edge_conds = calculate_edge_conds(anal_head, &PWord, dp, word,
					 edge_conds, pStamp_in->iTbuType,
					 do_trace, pWordAnal_in, pStamp_in);
#else /* hab104 */
  *new_edge_conds = calculate_edge_conds(anal_head, &PWord, dp, word,
					 edge_conds, pStamp_in->iTbuType,
					 do_trace, pStamp_in);
#endif /* hab104 */
  if (do_trace && pStamp_in->pLogFP)
	putc('\n', pStamp_in->pLogFP);
#else
				/* see if tone-marked form matches input */
  if (decapitalizeWord(pUnit_in->pCurrentWord->pTemplate, &pStamp_in->sTextCtl))
	cp1 = pUnit_in->pCurrentWord->pTemplate->paWord[0]; /* later: need to try 'em all... */
  else
	cp1 = pUnit_in->pCurrentWord->pTemplate->pszOrigWord;
  cp1 = applyChanges(cp1, pStamp_in->pTPOrthoChanges);

  if (streq(cp, cp1))
	{
				/* assume that form is good */
	  form_is_good = TRUE;
				/* remember right edge state of tone tiers */
#ifndef hab104
	  *new_edge_conds = calculate_edge_conds(anal_head, &PWord, dp, word,
						 edge_conds, pStamp_in->iTbuType,
						 do_trace, pWordAnal_in,pStamp_in);
#else /* hab104 */
	  *new_edge_conds = calculate_edge_conds(anal_head, &PWord, dp, word,
						 edge_conds, pStamp_in->iTbuType,
						 do_trace, pStamp_in);
#endif /* hab104 */
	}
  else
	{
	  if ((do_trace & TRACE_TONE_TIER) && pStamp_in->pLogFP)
	{
	  char tempbuf[BUFSIZE];
	  sprintf(tempbuf, "Failed to match input form. (%s)", cp1);
	  trace_msg(pStamp_in->pLogFP, &tempbuf[0]);
	}
	  *new_edge_conds = 0L;
	}
#endif /* TONEGEN */

  freeMemory(cp);			/* free memory used by tone-marked word */

				/* free memory used by domains */
  free_domains( dp );
				/* free the memory allocated for the */
				/* tbu structures built for this word */
  free_tbus(PWord.wd_tbu);
				/* free the memory allocated for the */
				/* prosodic structures built for this word */
				/* including tone structs */
  free_pword(&PWord);
#ifdef ORIGTP
				/* free tone structs used in analysis structs*/
  free_tones_in_anal(anal_head);
				/* free the analysis structs */
  freeStampAnalysis(anal_head);
#endif /* ORIGTP */

  return(form_is_good);

}	/* end tone_anal */

/*************************************************************************
 * NAME
 *    trace_msg
 * ARGUMENTS
 *    msg - message to be displayed
 * DESCRIPTION
 *    display a trace message
 * RETURN VALUE
 *    NONE
 */
static void trace_msg( pOutputFP_in, msg )
	 FILE *pOutputFP_in;
	 char *msg;
{

  fprintf(pOutputFP_in, "\n        %s", msg);

}	/* end trace_msg */

/***************************************************************************
 * NAME
 *    utest
 * ARGUMENTS
 *    cond - pointer to a node in the syntax tree of a test
 * DESCRIPTION
 *    Traverse the syntax tree structure in postorder fashion,
 *    calculating the truth value of the test in the process.
 *    This function is highly recursive.
 * RETURN VALUE
 *    TRUE if the test succeeds, FALSE if it fails
 */
#ifndef hab104
static int utest( cond, pWordAnal_in, pStamp_in )
	 struct cond_node *cond;
	 WordAnalysis *pWordAnal_in;
	 StampData *pStamp_in;
#else /* hab104 */
static int utest( cond, pStamp_in )
	 struct cond_node *cond;
	 StampData *pStamp_in;
#endif /* hab104 */
{
  register StampAnalysis *ap, *ap2;
  int val, rval, lval;
  int count;
  int tier;
  int dir;
  unsigned short fcode;
  union leftside left;
  union rightside right;
  struct root_node *rp;
  struct tbu       *tbp, *tbu_beg, *tbu_end;
  struct tone_list *tlp;
  struct tone      *tp, *tp_last;
  struct tone_pattern *tpp;
#ifndef hab104
#ifndef TONEGEN
  PropertySet_t uAlloPropertySet;
#endif /* TONEGEN */
#endif /* hab104 */

  if (cond == (struct cond_node *)NULL)
	return( TRUE );			/* no test => TRUE */

  left.l_son   = cond->cl.l_son;	/* put in variables for efficiency */
  right.r_prop = cond->cr.r_prop;	/* use largest element of the union */

  ap  = (StampAnalysis *)NULL;
  ap2 = (StampAnalysis *)NULL;
  val = FALSE;				/* let's be pessimistic */

  switch (cond->cn_opcode & OP_MASK)
	{
				/*
				 *  these nodes have subtrees
				 */
	case LOGAND:		/* 'AND' */
#ifndef hab104
	  val = (utest( left.l_son,  pWordAnal_in, pStamp_in ) &&
		 utest( right.r_son, pWordAnal_in, pStamp_in ));
#else /* hab104 */
	  val = (utest( left.l_son, pStamp_in ) &&
		 utest( right.r_son, pStamp_in ));
#endif /* hab104 */
	  break;

	case LOGOR:			/* 'OR' */
#ifndef hab104
	  val = (utest( left.l_son,  pWordAnal_in, pStamp_in ) ||
		 utest( right.r_son, pWordAnal_in, pStamp_in ));
#else /* hab104 */
	  val = (utest( left.l_son, pStamp_in ) ||
		 utest( right.r_son, pStamp_in ));
#endif /* hab104 */
	  break;

	case LOGXOR:		/* 'XOR' */
#ifndef hab104
	  lval = utest( left.l_son,  pWordAnal_in, pStamp_in );
	  rval = utest( right.r_son, pWordAnal_in, pStamp_in );
#else /* hab104 */
	  lval = utest( left.l_son, pStamp_in );
	  rval = utest( right.r_son, pStamp_in );
#endif /* hab104 */
	  val = ((!lval && rval) || (lval && !rval));
	  break;

	case LOGIFF:		/* 'IFF' */
#ifndef hab104
	  lval = utest( left.l_son,  pWordAnal_in, pStamp_in );
	  rval = utest( right.r_son, pWordAnal_in, pStamp_in );
#else /* hab104 */
	  lval = utest( left.l_son, pStamp_in );
	  rval = utest( right.r_son, pStamp_in );
#endif /* hab104 */
	  val = ((lval && rval) || (!lval && !rval));
	  break;

	case LOGIF:			/* 'IF' ... 'THEN' */
#ifndef hab104
	val = ( !utest(left.l_son,  pWordAnal_in, pStamp_in) ||
		 utest(right.r_son, pWordAnal_in, pStamp_in) );
#else /* hab104 */
	val = ( !utest(left.l_son, pStamp_in) ||
		utest(right.r_son, pStamp_in) );
#endif /* hab104 */
	break;

#ifndef hab105
	case ALL_LEFT:              /* 'FOR_ALL_LEFT' */
		for (   pForLeft_m = t_current->pLeftLink, val = TRUE ;
				(pForLeft_m != NULL) && (val == TRUE) ;
				pForLeft_m = pForLeft_m->pLeftLink )
			{
			val = utest( left.l_son, pWordAnal_in, pStamp_in);
			}
		break;

	case SOME_LEFT:             /* 'FOR_SOME_LEFT' */
		for (   pForLeft_m = t_current->pLeftLink, val = FALSE ;
				pForLeft_m != NULL ;
				pForLeft_m = pForLeft_m->pLeftLink )
			{
			val = utest( left.l_son, pWordAnal_in, pStamp_in);
			if (val)
				break;          /* need to preserve pointer value */
			}
		break;

	case ALL_RIGHT:             /* 'FOR_ALL_RIGHT' */
		for (   pForRight_m = t_current->pRightLink, val = TRUE ;
				(pForRight_m != NULL) && (val == TRUE) ;
				pForRight_m = pForRight_m->pRightLink )
			{
			val = utest( left.l_son, pWordAnal_in, pStamp_in);
			}
		break;

	case SOME_RIGHT:    /* 'FOR_SOME_RIGHT' */
		for (   pForRight_m = t_current->pRightLink, val = FALSE ;
				pForRight_m != NULL ;
				pForRight_m = pForRight_m->pRightLink )
			{
			val = utest(left.l_son, pWordAnal_in, pStamp_in);
			if (val)
				break;          /* need to preserve pointer value */
			}
		break;
#endif /* hab105 */
				/*
				 *  the rest of these are leaf nodes
				 */

	case CATEGORY_IS:	/* 'category 'is' IDENTIFIER */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  val = (ap->m.iToCategory == right.r_int);
	}
	  break;

	case CATEGORY_MEMBER:	/* 'category 'is' 'member' IDENTIFIER */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  val = isAmpleCategClassMember(ap->m.iToCategory, right.r_ccp);
	}
	  break;

	case EDGE_COND_IS:       /* 'edge' 'condition' 'is' IDENTIFIER */
	  val = (int)(t_edgeconds & right.r_long);
	  break;

	case PROP_IS:       /* 'property' 'is' IDENTIFIER */
	  if (    ((ap = get_morph_pos(left.l_pos, pStamp_in)) !=
												  (StampAnalysis *)NULL) &&
		  (right.r_prop != (unsigned short *)NULL) )
	{
	  fcode = *(right.r_prop);		 /* Check property */
#ifndef hab104
#ifndef TONEGEN
	  if ((t_wordanal->pszProperties == (char *)NULL) &&
		  ap->m.pAllomorphs != (StampAllomorphList *)NULL)
		{			/* use dictionary info */
		  uAlloPropertySet = ap->m.pAllomorphs->a.uAlloPropertySet;
		}
	  else
		{			/* use properties from ANA file */
		  uAlloPropertySet = ap->uAlloPropertySet;
		}
	  if ( hasAmpleProperty( uAlloPropertySet,
				 fcode, &pStamp_in->sProperties ) )
#else /* TONEGEN */
	  if ( ap->m.pAllomorphs != (StampAllomorphList *)NULL &&
		   hasAmpleProperty( ap->m.pAllomorphs->a.uAlloPropertySet,
				 fcode, &pStamp_in->sProperties ) )
#endif /* TONEGEN */
#else /* hab104 */
	  if ( ap->m.pAllomorphs != (StampAllomorphList *)NULL &&
		   hasAmpleProperty( ap->m.pAllomorphs->a.uAlloPropertySet,
				 fcode, &pStamp_in->sProperties ) )
#endif /* hab104 */
		val = TRUE;
	  else
		val = FALSE;
	}
	  break;

	case MORPH_IS:	/* 'morphname' 'is' STRING */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  val = streq(ap->m.pszMorphname, right.r_string);
	}
	  break;

	case MORPH_MEMBER:	/* 'morphname' 'is' 'member' IDENTIFIER */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  val = isAmpleMorphClassMember(ap->m.pszMorphname,
					(AmpleMorphClass *)right.r_mcp);
	}
	  break;

	case MORPH_PROSODY: /* 'morpheme' 'is' PROSODIC_SHAPE */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  switch(right.r_int)
		{
		case MONOSYLLABIC:
		  val = has_n_syllables(ap, 1);
		  break;
		case DISYLLABIC:
		  val = has_n_syllables(ap, 2);
		  break;
		case TRISYLLABIC:
		  val = has_n_syllables(ap, 3);
		  break;
		case QUADRISYLLABIC:
		  val = has_n_syllables(ap, 4);
		  break;
		case POLYSYLLABIC:
		  val = !has_n_syllables(ap, 0) & !has_n_syllables(ap, 1);
		  break;
		case MONOMORAIC:
		  val = has_n_moras(ap, 1);
		  break;
		case BIMORAIC:
		  val = has_n_moras(ap, 2);
		  break;
		}
	}
	  break;

	case SEGMENT_IS:	/* 'segment' 'is'  STRING */
				/* NOTE: this may not work */
	  if (((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL) &&
	  (right.r_string != (char *)NULL) )
	{
	  for (rp = ap->pRNBeg;
		   rp != (struct root_node *)NULL &&
		   rp->rn_left != ap->pRNEnd;
		   rp = rp->rn_right)
		if (streq(rp->rn_seg->seg_str, right.r_string))
		  {
		val = TRUE;
		break;
		  }
	}
	  break;

	case SEGMENT_MEMBER:	/* 'segment' 'is' 'member' IDENTIFIER */
				/* NOTE: this may not work */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  for (rp = ap->pRNBeg;
		   rp != (struct root_node *)NULL &&
		   rp->rn_left != ap->pRNEnd;
		   rp = rp->rn_right)
		if (isStringClassMember(rp->rn_seg->seg_str, right.r_scp))
		  {
		val = TRUE;
		break;
		  }
	}
	  break;

	case SYLLABLE_HAS: /* 'syllable' 'has' ONSET_CODA */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  if (right.r_int == ONSET)
		{
		  if (ap->pRNBeg != (struct root_node *)NULL &&
		  ap->pRNBeg->rn_syl != (struct syllable *)NULL)
		val = has_onset(ap->pRNBeg->rn_syl);
		}
	  else if (right.r_int == CODA)
		{
		  if (ap->pRNBeg != (struct root_node *)NULL &&
		  ap->pRNBeg->rn_syl != (struct syllable *)NULL)
		val = has_coda(ap->pRNBeg->rn_syl);
		}
	}
	  break;

	case TBU_DOMAIN:	/* 'tbu' 'is'  DOMAIN */
				/* to be written */
	  break;

	case TBU_EXTRAMET: /* 'tbu' 'is' 'extrametrical' */
				/* to be written */
	  break;

	case TBU_HAS: /* 'tbu' 'has' TONE */
	  switch(left.l_pos)
	{
	case WINITIAL:
	case INITIALM:		/* use 1st tbu of word */
	  val = tbu_has_tone_id(t_pwp->wd_tbu, right.r_tip);
	  break;

	case WFINAL:
	case FINALM:		/* use last tbu of word */
	  val = tbu_has_tone_id(end_of_tbus(t_pwp->wd_tbu), right.r_tip);
	  break;

	case ARGCURRENT:
	case ARGRIGHT:		/* use 1st tbu of morpheme */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL &&
		  (tbp = ap->pTBUBeg) != (struct tbu *)NULL)
		val = tbu_has_tone_id(tbp, right.r_tip);
	  break;

	case ARGLEFT:		/* use last tbu of morpheme */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL &&
		  (tbp = ap->pTBUEnd) != (struct tbu *)NULL)
		val = tbu_has_tone_id(tbp, right.r_tip);
	  break;

	}
	  break;

	case TBU_NUMBER: /* 'morpheme' 'tbu' NUMBER 'has' TONE */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL &&
	  (tbp = ap->pTBUBeg) != (struct tbu *)NULL)
	{
	  for (count = 0;
		   tbp != (struct tbu *)NULL &&
		   tbp->tbu_left != ap->pTBUEnd;
		   tbp = tbp->tbu_right)
		{
		  count++;
		  if (count == cond->cn_tbu_num)
		{
#ifdef B4_0_4_4
		  if (tbu_has_tone_id(tbp, right.r_tip))
#else
		  if (tbu_has_tone_id(tbp, right.r_tip) &&
			  morph_has_tone_id(ap, right.r_tip))
#endif /* B4_0_4_4 */
			{
			  val = TRUE;
			  break;
			}
		  break;
		}
		}
	}
	  break;

	case TBU_UNDER_NUMBER: /* 'morpheme' 'underlying' 'tbu' NUMBER 'has' TONE*/
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL &&
	  (tbp = ap->pTBUBeg) != (struct tbu *)NULL)
	{
	  for (count = 0;
		   tbp != (struct tbu *)NULL &&
		   tbp->tbu_left != ap->pTBUEnd;
		   tbp = tbp->tbu_right)
		{
		  count++;
		  if (count == cond->cn_tbu_num)
		{
		  if (tbu_has_under_tone_id(ap->m.pTones, count, right.r_tip))
			{
			  val = TRUE;
			  break;
			}
		  break;
		}
		}
	}
	  break;

	case MORPH_HAS_N_TBUS: /* 'morpheme' 'has' NUMBER 'tbus' */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  for (tbp = ap->pTBUBeg, count = 0;
		   tbp != (struct tbu *)NULL &&
		   tbp->tbu_left != ap->pTBUEnd;
		   tbp = tbp->tbu_right)
		count++;
	  val = (count == right.r_int);
	}
	  break;

	case TONE_IS:	/* 'tone' 'is' TONE */
#ifdef B4_4_0_11
	  if ((tp = get_tone_pos(left.l_pos)) != (struct tone *)NULL)
	val = tone_matches(tp, right.r_tip);
	  else if (right.r_tip == (struct tone_id *)NULL)
	val = TRUE;
	  break;
#else
				/* try to determine left or right tone
				   for cyclic rules */
	  if (t_current != (StampAnalysis *) NULL)
	{
	  if (left.l_pos == ARGRIGHT)
		t_tone = get_morphs_nearest_tone(t_current, RIGHT);
	  else if (left.l_pos == ARGLEFT)
		t_tone = get_morphs_nearest_tone(t_current, LEFT);
	}
	  if ((tp = get_tone_pos(left.l_pos)) != (struct tone *)NULL)
	val = tone_matches(tp, right.r_tip);
	  else if (right.r_tip == (struct tone_id *)NULL)
	val = TRUE;
	  break;
#endif

	case TONESTATUS_TONE_IS:	/* 'tonestatus' 'tone' 'is' TONE */
				/* find first instance of tone with */
				/* indicated status */

				/* initialize */
	  tbu_beg = tbu_end = (struct tbu *)NULL;
	  dir = RIGHTWARD;
				/* determine search space and direction */
	  switch(left.l_pos)
	{
	case WINITIAL:
	case INITIALM:
	  tbu_beg = t_pwp->wd_tbu;
	  tbu_end = end_of_tbus(tbu_beg);
	  break;

	case ARGLEFT:
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
		{
		  tbu_beg = ap->pTBUEnd;
		  tbu_end = ap->pTBUBeg;
		  dir = LEFTWARD;
		}
	  break;

	case ARGCURRENT:
	case ARGRIGHT:
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
		{
		  tbu_beg = ap->pTBUBeg;
		  tbu_end = ap->pTBUEnd;
		}
	  break;

	case WFINAL:
	case FINALM:
	  tbu_end = t_pwp->wd_tbu;
	  tbu_beg = end_of_tbus(tbu_end);
	  dir = LEFTWARD;
	  break;
	}
				/* scan the space in appropriate direction */
	  if (dir == RIGHTWARD)
	{
	  for (tbp = tbu_beg;
		   tbp != (struct tbu *)NULL &&
		   tbp->tbu_left != tbu_end;
		   tbp = tbp->tbu_right)
		for (tlp = tbp->tbu_tonel;
		 tlp != (struct tone_list *)NULL;
		 tlp = tlp->tonl_right)
		  for (tier = 0; tier < TIERS; tier++)
		if ((tp = tlp->tonl_tone) != (struct tone *)NULL &&
			tp->tone_status[tier] == right.r_tip->ti_status)
		  {
				/* found a tone with indicated status */
				/* see if it matches */
			val = tone_matches(tp, right.r_tip);
			goto quit;
		  }
	}
	  else
	{
	  for (tbp = tbu_beg;
		   tbp != (struct tbu *)NULL &&
		   tbp->tbu_right != tbu_end;
		   tbp = tbp->tbu_left)
		for (tlp = end_of_tone_list(tbp->tbu_tonel);
		 tlp != (struct tone_list *)NULL;
		 tlp = tlp->tonl_left)
		  for (tier = 0; tier < TIERS; tier++)
		if ((tp = tlp->tonl_tone) != (struct tone *)NULL &&
			tp->tone_status[tier] == right.r_tip->ti_status)
		  {
				/* found a tone with indicated status */
				/* see if it matches */
			val = tone_matches(tp, right.r_tip);
			goto quit;
		  }
	}
	quit:
	  break;

	case TONE_PATTERN_IS:	/* 'tone' 'pattern' 'is' TONE_PATTERN */
				/* scan the tone pattern beginning at the
				   indicated tone position and compare it with
				   the tone pattern to see if they match
				   exactly */
#ifndef B4_4_0_11
				/* try to determine left or right tone
				   for cyclic rules */
	  if (t_current != (StampAnalysis *) NULL)
	{
	  if (left.l_pos == ARGRIGHT)
		t_tone = get_morphs_nearest_tone(t_current, RIGHT);
	  else if (left.l_pos == ARGLEFT)
		t_tone = get_morphs_nearest_tone(t_current, LEFT);
	}
#endif /* B4_4_0_11 */
	  tp  = get_tone_pos(left.l_pos);
	  if ((tpp = right.r_tpip) == (struct tone_pattern *)NULL &&
	  tp == (struct tone *)NULL)
	{			/* pattern and tone are none */
	  val = TRUE;
	  break;
	}
	  if (left.l_pos == ARGLEFT ||
	  left.l_pos == WFINAL  ||
	  left.l_pos == FINALM)
	{			/* adjust initial tone position for a left
				   oriented pattern */
	  for (;
		   tp  != (struct tone *)NULL &&
		   tpp != (struct tone_pattern *)NULL &&
		   tpp->tp_next != (struct tone_pattern *)NULL;
		   tpp = tpp->tp_next)
		tp = tp->tone_left;
	}
	  for (tpp = right.r_tpip;
	   tp  != (struct tone *)NULL &&
	   tpp != (struct tone_pattern *)NULL;
	   tp  = tp->tone_right,
	   tpp = tpp->tp_next)
	{
	  if (!tone_matches(tp, tpp->tp_tone))
		break;
	}
	  if (tpp == (struct tone_pattern *)NULL)
	val = TRUE;
	  break;

	case WORD_TONE_IS:	/* 'word' 'tone' 'pattern' 'is' TONE_PATTERN */
				/* scan through the word's tones and
				   the tone pattern to see if all match
				   exactly */
	  for (tp  = t_pwp->wd_tones,
	   tpp = right.r_tpip;
	   tp  != (struct tone *)NULL &&
	   tpp != (struct tone_pattern *)NULL;
	   tp  = tp->tone_right,
	   tpp = tpp->tp_next)
	{
	  if (!tone_matches(tp, tpp->tp_tone))
		break;
	}
	  if (tp  == (struct tone *)NULL &&
	  tpp == (struct tone_pattern *)NULL)
	val = TRUE;
	  break;

	case MORPH_TONE_IS:	/* 'morpheme' 'tone' 'is' TONE */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
				/* check for a null tone to match */
	  if (right.r_tip == (struct tone_id *)NULL &&
		  ((tbp = ap->pTBUBeg) == (struct tbu *)NULL ||
		   tbp->tbu_tonel == (struct tone_list *)NULL))
		{
		  val = TRUE;
		  break;
		}
	  for (tbp = ap->pTBUBeg, count = 0;
		   tbp != (struct tbu *)NULL &&
		   tbp->tbu_left != ap->pTBUEnd;
		   tbp = tbp->tbu_right)
		{
#ifdef B4_0_4_14
		  if ((tlp = tbp->tbu_tonel) != (struct tone_list *)NULL &&
		  tlp->tonl_right == (struct tone_list *)NULL)
		{
		  count++;
		  if (tone_matches(tlp->tonl_tone, right.r_tip))
			{
			  val = TRUE;
			}
		}
#else
		  if ((tlp = tbp->tbu_tonel) != (struct tone_list *)NULL)
		{
		  count++;
		  if (tlp->tonl_right == (struct tone_list *)NULL)
			{
			  if (tone_matches(tlp->tonl_tone, right.r_tip))
			{
			  val = TRUE;
			}
			}
		}
#endif
		}
	  if (count != 1)
		val = FALSE;	/* should only be one tone in morpheme */
	}
	  break;

	case MORPH_TONE_PAT_IS:	/* 'morpheme' 'tone' 'pattern' 'is'
				   TONE_PATTERN */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
				/* get first and last tones in the morpheme */
	  tp = tp_last = (struct tone *)NULL;
	  for (tbp = ap->pTBUBeg;
		   tbp != (struct tbu *)NULL &&
		   tbp->tbu_left != ap->pTBUEnd;
		   tbp = tbp->tbu_right)
		if ((tlp = tbp->tbu_tonel) != (struct tone_list *)NULL)
		  {
		if (tp == (struct tone *)NULL)
		  tp = tlp->tonl_tone;
		tp_last = tlp->tonl_tone;
		  }
				/* scan the tone pattern beginning at the
				   indicated morpheme and compare it with
				   the tone pattern to see if they match
				   exactly */
	  for (tpp = right.r_tpip;
		   tp  != (struct tone *)NULL &&
		   tp_last  != (struct tone *)NULL &&
		   tpp != (struct tone_pattern *)NULL &&
		   tp->tone_left != tp_last;
		   tp  = tp->tone_right,
		   tpp = tpp->tp_next)
		{
		  if (!tone_matches(tp, tpp->tp_tone))
		break;
		}
	  if (tpp == (struct tone_pattern *)NULL &&
		  ( tp == (struct tone *)NULL ||
			tp->tone_left == tp_last))
		val = TRUE;
	}
	  break;

	case MORPH_UL_TONE_IS:	/* 'morpheme' 'underlying' 'tone' 'is' TONE */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  if ((tlp = ap->m.pTones) == (struct tone_list *)NULL &&
		  right.r_tip         == (struct tone_id   *)NULL)
		{
		  val = TRUE;
		  break;
		}
	  for (tlp = ap->m.pTones, count = 0;
		   tlp != (struct tone_list *)NULL;
		   tlp = tlp->tonl_right)
		{
		  count++;
		  if (tone_matches(tlp->tonl_tone, right.r_tip))
		{
		  val = TRUE;
		}
		}
	  if (count != 1)
		val = FALSE;	/* should only be one tone in morpheme */
	}
	  break;

	case MORPH_UL_TONE_PAT_IS:	/* 'morpheme' 'underlying' 'tone' 'is'
				   TONE_PATTERN */
				/* compare the indicated morpheme's underlying
				   tones with the tone pattern to see if they
				   match exactly */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  for (tlp = ap->m.pTones,
		   tpp = right.r_tpip;
		   tlp != (struct tone_list *)NULL &&
		   tpp != (struct tone_pattern *)NULL;
		   tlp = tlp->tonl_right,
		   tpp = tpp->tp_next)
		{
		  if (!tone_matches(tlp->tonl_tone, tpp->tp_tone))
		break;
		}
	  if (tpp == (struct tone_pattern *)NULL &&
		  tlp == (struct tone_list *)NULL)
		val = TRUE;
	}
	  break;

	case TYPE_IS:	/* 'type' 'is' <type> */
	  if ((ap = get_morph_pos(left.l_pos, pStamp_in)) != (StampAnalysis *)NULL)
	{
	  if (right.r_int == WINITIAL)
		val = (ap->pLeftLink == (StampAnalysis *)NULL);
	  else if (right.r_int == WFINAL)
		val = (ap->pRightLink == (StampAnalysis *)NULL);
	  else
		val = ((ap->m.iMorphType & MORPHTYPE_MASK) == right.r_int);
	}
	  break;

	default:
	  fprintf(pStamp_in->pLogFP,
		  "%s%s is corrupted - the result is unpredictable",
		  tsterrhead, t_rule->tr_name );
	  return( FALSE );
	}
				/* return (possibly negated) truth value */
  return((cond->cn_opcode & OP_NOT) ? !val : val);

} /* end utest() */

#ifndef hab104
#ifndef TONEGEN
/***************************************************************************
 * NAME
 *    addANAProperties
 * DESCRIPTION
 *    Add any properties found in ANA file to Stamp Analysis
 * RETURN VALUE
 *    none
 */
static void addANAProperties(char *pszANAProps,
				 StampAnalysis *pMorphs,
				 StampData *pStamp_in)
{
  StampAnalysis *pCurrentMorph;
  char *pszBeg;
  char *pszEnd;
  char *cp;
  char *pszOrig;

		 /* initialize */
		 /* make a copy of the original props string because
			we'll probably change it */
  pszOrig = pszBeg = duplicateString(pszANAProps);
  pCurrentMorph = pMorphs;

  while ((pCurrentMorph != NULL) &&
	 (pszBeg != NULL))
	{		 /* find next occurrence of '=' */
	  if ((pszEnd = strchr(pszBeg, '=')) != NULL)
	*pszEnd = '\0';
		 /* set the property information */
	  pCurrentMorph->uAlloPropertySet.pProperties = NULL;
	  cp = parseAmplePropertySet(pszBeg,
			   &pCurrentMorph->uAlloPropertySet,
			   AMPLE_ALLO_PROP,
			   0, "ANA File",
			   "ANA File property parsing",
			   &pStamp_in->sProperties,
			   &pStamp_in->pPropertyList,
			   pStamp_in->pLogFP);
		 /* set up for next one */
	  pCurrentMorph = pCurrentMorph->pRightLink;
	  if (pszEnd == NULL)
	pszBeg = NULL;
	  else	 /* skip past last '=' */
	pszBeg = pszEnd + 1;
	}
		 /* free the copy */
  freeMemory(pszOrig);
}
#endif /* TONEGEN */
#endif /* hab104 */
