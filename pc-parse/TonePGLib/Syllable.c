/* SYLLABLE.C - assign syllable structures to elements in a list of root nodes
 *
 *	Andy Black
 *	10-Apr-92
 *
 ***************************************************************************
 *
 *      struct root_node_list *make_root_node_list( rnlp )
 *           struct root_node_list *rnlp;
 *
 *      static struct syllable *make_syllable( sp_last )
 *           struct syllable *sp_last;
 *
 *      static void add_to_syl( rp, sp, rlp )
 *           struct root_node *rp;
 *           struct syllable  **sp;
 *           struct root_node_list **rlp;
 *
 *      static int compare_sonority( rp1, rp2 )
 *           struct root_node *rp1, *rp2;
 *
 *      int has_onset( sp )
 *           struct syllable *sp;
 *
 *      int is_extrametrical( sp )
 *           struct syllable *sp;
 *
 *      static void set_syl_weight( rnp )
 *           struct root_node *rnp;
 *
 *      void disp_syllable( sp, show_weight, syl )
 *           struct syllable *sp;
 *           int show_weight;
 *           struct syllable *syl;
 *
 *      static void disp_syllable_parse( rnp )
 *           struct root_node *rnp;
 *
 *      static void sonority( rnp, syl_flags )
 *           struct root_node *rnp;
 *           int    syl_flags;
 *
 *      void syllable_parse(rnp, syl_algorithm, syl_flags, do_trace )
 *           struct root_node *rnp;
 *           int syl_algorithm;
 *           int syl_flags;
 *           int do_trace;
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	10-Apr-92	hab - initial coding
 ***************************************************************************
 * Copyright 1992 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>

#include "stamp.h"
#include "tonepars.h"

/********************* OPACLIB FUNCTIONS *********************/

/* moras.c */
extern void disp_segment P(( struct root_node *rnp, int moras_only,
				 StampData *pStamp_in));
extern struct mora *add_mora P(( struct root_node *rp, struct syllable *sp ));

#undef P
/************************************************************
 * compare_sonority definitions
 */

#define LESS  -1
#define EQUAL  0
#define MORE   1

/****************************************************************************
 * NAME
 *    make_root_node_list
 * ARGUMENTS
 *    rnlp - pointer to previous root_node_list structure
 * DESCRIPTION
 *    allocate, initialize and link-in a root_node_list structure
 *         to a linked list of root_node_list structures
 * RETURN VALUE
 *    pointer to the newly allocated root_node_list structure
 */
struct root_node_list *make_root_node_list( rnlp )
	 struct root_node_list *rnlp;
{
  struct root_node_list *rlp;

		/* allocate new structure */
  rlp = (struct root_node_list *)allocMemory(sizeof(struct root_node_list));
#ifdef MEM_DEBUG
printf(" syllable: root_node_list");
#endif /* MEM_DEBUG */
		/* initialize */
  rlp->rnl_rn   = (struct root_node      *)NULL;
  rlp->rnl_next = (struct root_node_list *)NULL;

		/* link it to the root_node_list if possible */
  if (rnlp != (struct root_node_list*)NULL)
	rnlp->rnl_next = rlp;

  return ( rlp );

}	/* end make_root_node_list */

/****************************************************************************
 * NAME
 *    make_syllable
 * ARGUMENTS
 *    sp_last - pointer to previous syllable structure
 * DESCRIPTION
 *    allocate, initialize and link-in a syllable structure
 *         to a doubly linked list of syllable structures
 * RETURN VALUE
 *    pointer to the newly allocated syllable structure
 */
static struct syllable *make_syllable( sp_last )
	 struct syllable *sp_last;
{
  struct syllable *sp;
  int i;

  sp = (struct syllable *)allocMemory(sizeof(struct syllable));
#ifdef MEM_DEBUG
printf(" syllable: syllable");
#endif /* MEM_DEBUG */
  sp->syl_rnl   = (struct root_node_list *)NULL;
  for (i=0; i<MAX_MORAS; i++)
	sp->syl_mora[i] = (struct mora *)NULL;
  sp->syl_ft    = (struct foot *)NULL;
  sp->syl_tbu   = (struct tbu *)NULL;
  sp->syl_wt    = (int)NULL;
  sp->syl_pr    = UNSTRESSED;
  sp->syl_right = (struct syllable *)NULL;
  sp->syl_left  = sp_last;
  if (sp_last != (struct syllable *)NULL)
	sp_last->syl_right = sp;

  return(sp);

}	/* end make_syllable */

/****************************************************************************
 * NAME
 *    add_to_syl
 * ARGUMENTS
 *    rp  - pointer to a root node structure
 *    sp  - pointer to a syllable  structure
 *    rlp - pointer to a root_node_list element
 * DESCRIPTION
 *    add the root node to a syllable
 * RETURN VALUE
 *    NONE
 */
static void add_to_syl( rp, sp, rlp )
	 struct root_node *rp;
	 struct syllable  **sp;
	 struct root_node_list **rlp;
{
  int i, j;
					/* shouldn't happen, but ... */
  if (rp == (struct root_node *)NULL)
	return;

				/* using a slight trick: a syllable */
				/* struct is needed whenever the root */
				/* node list pointer is null; that is, */
				/* there are no root nodes in the */
				/* syllable yet. */
  if (*rlp == (struct root_node_list *)NULL)
	{					/* no syllable struct yet; */
					/* make new syllable and a new */
					/* root node list; link the */
					/* list to the syllable */
	  *sp = make_syllable( *sp );
	  *rlp = make_root_node_list( *rlp );
	  (*sp)->syl_rnl = *rlp;
	}
  else
					/* create new root node list element */
	  *rlp = make_root_node_list( *rlp );

					/* link root node to it */
  (*rlp)->rnl_rn = rp;
					/* link root node to syllable */
  rp->rn_syl  = *sp;
					/* link syllable to any moras */
  for (i = 0; i < MAX_MORAS; i++)
	{
	  if (rp->rn_mora[i] != (struct mora *)NULL)
	{
	  for (j = 0; j < MAX_MORAS; j++)
		{
		  if ((*sp)->syl_mora[j] == (struct mora *)NULL)
		{
		  (*sp)->syl_mora[j] = rp->rn_mora[0];
		  (*sp)->syl_mora[j]->mora_syl = *sp;
		  break;
		}
		}
	}
	}

}	/* end add_to_syl */

/****************************************************************************
 * NAME
 *    compare_sonority
 * ARGUMENTS
 *    rp1 - pointer to first  root node
 *    rp2 - pointer to second root node
 * DESCRIPTION
 *    Determine relative sonority of the first root node and the second
 * RETURN VALUE
 *    LESS  if the first root node is less     sonorous than the second
 *    EQUAL if the first root node is equal in sonority to   the second
 *    MORE  if the first root node is more     sonorous than the second
 */
static int compare_sonority( rp1, rp2 )
	 struct root_node *rp1, *rp2;
{
					/* if the first root node does not */
					/* exist, it is less sonorous */
  if (rp1 == (struct root_node *)NULL)
	return(LESS);
					/* if the second root node does not  */
					/* exist, the first is more sonorous */
  if (rp2 == (struct root_node *)NULL)
	return(MORE);
					/* if the second root node is moraic */
					/* but the first is not, first is    */
					/*  less sonorous */
  if (rp1->rn_mora[0] == (struct mora *)NULL &&
	  rp2->rn_mora[0] != (struct mora *)NULL)
	return(LESS);
					/* if both the first and second root */
					/* nodes are moraic, they are equal  */
  if (rp1->rn_mora[0] != (struct mora *)NULL &&
	  rp2->rn_mora[0] != (struct mora *)NULL)
	return(EQUAL);
					/* if the first root node is moraic */
					/* but the second is not, first is  */
					/*  more sonorous */
  if (rp1->rn_mora[0] != (struct mora *)NULL &&
	  rp1->rn_seg->seg_cons == MINUS         &&	/* ignore weight-by-position */
	  rp2->rn_mora[0] == (struct mora *)NULL)
	return(MORE);
					/* if they differ in [son], rp1 */
					/* is more sonorous if it is [+son] */
  if (rp1->rn_seg->seg_son != rp2->rn_seg->seg_son)
	return( (rp1->rn_seg->seg_son == PLUS)  ? MORE : LESS );

					/* if they differ in [cons], rp1 */
					/* is more sonorous if it is [-cons] */
  if (rp1->rn_seg->seg_cons != rp2->rn_seg->seg_cons)
	return( (rp1->rn_seg->seg_cons == MINUS) ? MORE : LESS );

					/* if they differ in [cont], rp1 */
					/* is more sonorous if it is [+cont] */
  if (rp1->rn_seg->seg_cont != rp2->rn_seg->seg_cont)
	return( (rp1->rn_seg->seg_cont == PLUS)  ? MORE : LESS );

					/* if they are identical in these */
					/* features, then they are equal  */
  return(EQUAL);

}	/* end compare_sonority */

/****************************************************************************
 * NAME
 *    has_coda
 * ARGUMENTS
 *    sp - pointer to a syllable
 * DESCRIPTION
 *    Determines if the syllable has a coda
 *
 * RETURN VALUE
 *    TRUE  if the syllable has a coda
 *    FALSE otherwise
 */
int has_coda( sp )
	 struct syllable *sp;
{
  struct root_node_list *rlp;

  if (sp == (struct syllable *)NULL)
	return(FALSE);

				/* syllable has a coda if its final root */
				/* node is consonantal */

				/* get final root node */
  for (rlp = sp->syl_rnl;
	   rlp != (struct root_node_list *)NULL &&
	   rlp->rnl_next != (struct root_node_list *)NULL;
	   rlp = rlp->rnl_next)
	;

  if (rlp != (struct root_node_list *)NULL &&
	  rlp->rnl_rn != (struct root_node *)NULL &&
	  rlp->rnl_rn->rn_seg != (struct segment *)NULL)
	if (rlp->rnl_rn->rn_seg->seg_cons == PLUS)
	  return(TRUE);

  return(FALSE);

}	/* end has_coda */

/****************************************************************************
 * NAME
 *    has_n_syllables
 * ARGUMENTS
 *    ap - pointer to an analysis struct
 *    count - number of syllables to check for
 * DESCRIPTION
 *    Determines if the morpheme has the indicated number of syllables
 *
 * RETURN VALUE
 *    TRUE  if the morpheme spans the indicated number of syllables
 *    FALSE otherwise
 */
int has_n_syllables( ap, count )
	 StampAnalysis  *ap;
	 int               count;
{
  int syl_count;
  struct syllable *cursp;
  struct root_node *rp, *rend;

				/* check for valid pointers */
  if (ap == (StampAnalysis *)NULL)
	return(FALSE);

  if (ap->pRNBeg == (struct root_node *)NULL ||
	  (rend = ap->pRNEnd) == (struct root_node *)NULL)
	return(FALSE);

				/* count the number of syllables in the */
				/* morpheme */
  for (rp = ap->pRNBeg, syl_count = 0, cursp = (struct syllable *)NULL;
	   rp != (struct root_node *)NULL &&
	   rp != rend->rn_right;
	   rp = rp->rn_right)
	{
	  if (rp->rn_syl != cursp)
	{
	  syl_count++;
	  cursp = rp->rn_syl;
	}
	}

  return(syl_count == count);

}	/* end has_n_syllables */

/****************************************************************************
 * NAME
 *    has_onset
 * ARGUMENTS
 *    sp - pointer to a syllable
 * DESCRIPTION
 *    Determines if the syllable has an onset
 *
 * RETURN VALUE
 *    TRUE  if the syllable has an onset
 *    FALSE otherwise
 */
int has_onset( sp )
	 struct syllable *sp;
{
					/* end of word reached */
  if (sp == (struct syllable *)NULL)
	return(FALSE);

				/* syllable has an onset if its first root */
				/* node is non-moraic */
  if (sp->syl_rnl != (struct root_node_list *)NULL &&
	  sp->syl_rnl->rnl_rn != (struct root_node *)NULL &&
	  sp->syl_rnl->rnl_rn->rn_mora[0] == (struct mora *)NULL)
	return(TRUE);

  return(FALSE);

}	/* end has_onset */

/****************************************************************************
 * NAME
 *    is_extrametrical
 * ARGUMENTS
 *    sp - pointer to a syllable
 * DESCRIPTION
 *    Determines if the syllable is extrametrical
 *
 * RETURN VALUE
 *    TRUE  if the syllable is extrametrical
 *    FALSE otherwise
 */
int is_extrametrical( sp )
	 struct syllable *sp;
{
					/* end of word reached */
  if (sp == (struct syllable *)NULL)
	return(FALSE);

				/* final light syllable is extrametrical */
  if (sp->syl_right == (struct syllable *)NULL &&
	  sp->syl_wt == LIGHT)
	return(TRUE);

  return(FALSE);

}	/* end is_extrametrical */

/****************************************************************************
 * NAME
 *    set_syl_weight
 * ARGUMENTS
 *    rnp - pointer to head of doubly linked list of root nodes
 * DESCRIPTION
 *    Calculate the weight of each syllable in a list
 * RETURN VALUE
 *    NONE
 */
static void set_syl_weight( rnp )
	 struct root_node *rnp;
{
  struct root_node_list *rnlp;
  struct root_node *rp;
  struct syllable *sp;
					/* shouldn't happen, but ... */
  if (rnp == (struct root_node *)NULL)
	return;
		/*  run through the linked list of syllables and calculate */
		/*  the syllable weight */
  for (sp = rnp->rn_syl;
	   sp != (struct syllable *)NULL;
	   sp = sp->syl_right)
	{
	  sp->syl_wt = 0;
				/* run through the root node list */
				/* associated with this syllable */
	  for (rnlp = sp->syl_rnl;
	   rnlp != (struct root_node_list *)NULL;
	   rnlp = rnlp->rnl_next)
	{
	  rp = rnlp->rnl_rn;
	  if (rp->rn_mora[0] != (struct mora *)NULL)
		sp->syl_wt++;
	  if (rp->rn_mora[1] != (struct mora *)NULL)
		sp->syl_wt++;
	}
	}
}	/* end set_syl_weight */

/****************************************************************************
 * NAME
 *    disp_syllable
 * ARGUMENTS
 *    sp - pointer to a syllable structure
 *    show_weight - flag to include weight of syllable or not
 *    syl - pointer to syllable to receive word stress
 * DESCRIPTION
 *    Output a syllable in a form suitable for the 'tree' program
 * RETURN VALUE
 *    NONE
 */
void disp_syllable( sp, show_weight, syl, pStamp_in )
	 struct syllable *sp;
	 int show_weight;
	 struct syllable *syl;
	 StampData *pStamp_in;
{
  struct root_node_list *rnlp;

					/* if there isn't anything there, */
					/* don't display anything */
  if (sp == (struct syllable *)NULL)
	return;

  if (show_weight)
				/* output syllable symbol and its weight */
	fprintf(pStamp_in->pLogFP, "(%s\\(%d\\) ", pStamp_in->pszSylStr,
		sp->syl_wt);
  else
				/* output only the symbol; */
	{				/* mark extrametrical syllables */
	  if (sp->syl_ft == (struct foot *)NULL)
	fprintf(pStamp_in->pLogFP, "(\\O(\\O %s ", pStamp_in->pszSylStr);
	  else
/*      if (is_extrametrical( sp ))
	  printf("(%s<%s> ", (syl == (struct syllable *)NULL) ? "\\O" : "",
					 pStamp_in->pszSylStr);
	  else */
	fprintf(pStamp_in->pLogFP, "(%s ", pStamp_in->pszSylStr);
	}

				/* run through the root node list */
				/* associated with this syllable */
  for (rnlp = sp->syl_rnl;
	   rnlp != (struct root_node_list *)NULL;
	   rnlp = rnlp->rnl_next)
	{
				/* output the appropriate info for each */
				/* root node */
	  disp_segment( rnlp->rnl_rn, FALSE, pStamp_in);
	}
  fprintf(pStamp_in->pLogFP, ")");
  if (sp->syl_ft == (struct foot *)NULL)
	fprintf(pStamp_in->pLogFP, ")");

}	/* end disp_syllable */

/****************************************************************************
 * NAME
 *    disp_syllable_parse
 * ARGUMENTS
 *    rnp - pointer to head of doubly linked list of root nodes
 * DESCRIPTION
 *    Display the syllable assignments in a list of root nodes
 * RETURN VALUE
 *    NONE
 */
static void disp_syllable_parse( rnp, pStamp_in )
	 struct root_node *rnp;
	 StampData *pStamp_in;
{
  struct root_node_list *rnlp;
  struct syllable *sp;
					/* shouldn't happen, but ... */
  if (rnp == (struct root_node *)NULL)
	fprintf(pStamp_in->pLogFP, "\nSyllable Parse: there are no root nodes.\n");
  else
	{
	  fprintf(pStamp_in->pLogFP, "\n   Syllable Parse:  ");
		/*  run through the linked list of syllables and display */
		/*  the segments of each syllable with the syllable      */
				/*  separation character to demark syllable boundaries */
	  for (sp = rnp->rn_syl;
	   sp != (struct syllable *)NULL;
	   sp = sp->syl_right)
	{
	  for (rnlp = sp->syl_rnl;
		   rnlp != (struct root_node_list *)NULL;
		   rnlp = rnlp->rnl_next)
		{
		  fprintf(pStamp_in->pLogFP, "%s", rnlp->rnl_rn->rn_seg->seg_str);
		}
	  if (sp->syl_right != (struct syllable *)NULL)
		  fprintf(pStamp_in->pLogFP, "%s", pStamp_in->pszSylSepChar);
	}

				/* now output for tree program */
	  fprintf(pStamp_in->pLogFP, "\n\\tree (");

		/*  run through the linked list of syllables and display */
		/*  the syllable and mora structures */
	  for (sp = rnp->rn_syl;
	   sp != (struct syllable *)NULL;
	   sp = sp->syl_right)
	{
	  disp_syllable( sp, TRUE, (struct syllable *)NULL, pStamp_in );
	}
	  fprintf(pStamp_in->pLogFP, ")");
	}
}	/* end disp_syllable_parse */

/****************************************************************************
 * NAME
 *    sonority
 * ARGUMENTS
 *    rnp          - pointer to head of list of root nodes
 *    do_wt_by_pos - flag for whether or not to do weight by position
 *    syl_flags    - syllabification flags
 * DESCRIPTION
 *    parse a list of root nodes into syllables using the
 *    sonority hierarchy to determine syllable boundaries
 * RETURN VALUE
 *    NONE
 */
static void sonority( rnp, syl_flags )
	 struct root_node *rnp;
	 int    syl_flags;
{
  struct root_node      *rp;
  struct syllable       *sp;
  struct root_node_list *rlp;
  int                    moras_seen;
					/* shouldn't happen, but ... */
  if (rnp == (struct root_node *)NULL)
	return;

				/* initialize */
  rp         = rnp;
  sp         = (struct syllable *)NULL;
  rlp        = (struct root_node_list *)NULL;
  moras_seen = 0;
				/* run through root nodes, making syllables */

  while (rp != (struct root_node *)NULL)
	{
				/* build any onsets (sonority is increasing) */
	  while (rp != (struct root_node *)NULL              &&
		 compare_sonority( rp, rp->rn_right) < EQUAL &&
		 moras_seen <= MAX_MORAS)
	{
	  add_to_syl(rp, &sp, &rlp);
	  moras_seen += rp->rn_seg->seg_mora;
	  rp = rp->rn_right;
	}
				/* now at the syllable peak */

				/* add the root node to the syllable */
	  add_to_syl(rp, &sp, &rlp);

				/* if it needs to be made moraic, do so */
	  if (rp->rn_mora[0] == (struct mora *)NULL &&
	  rp->rn_seg->seg_son == PLUS)
	{
	  sp->syl_mora[0] = rp->rn_mora[0] = add_mora(rp, sp);
	}
	  rp = rp->rn_right;
				/* build any codas (sonority is */
				/*   non-increasing) */
	  if (syl_flags & DO_CODAS &&
	  sp->syl_mora[0] != (struct mora*)NULL)
	{
	  while (rp            != (struct root_node *)NULL &&
		 compare_sonority(rp, rp->rn_right) >= EQUAL)
		{
		  if (syl_flags & MONO_MORAIC               &&
		  rp->rn_mora[0] != (struct mora *)NULL)
		break;		   /* can't add this mora to this syllable */

		  add_to_syl(rp, &sp, &rlp);
				/* make coda moraic if appropriate */
		  if (syl_flags & DO_WT_BY_POS             &&
		  sp->syl_mora[1] == (struct mora *)NULL)
		{
		  sp->syl_mora[1] = rp->rn_mora[0] = add_mora(rp, sp);
		}
		  rp = rp->rn_right;
		}
				/* need to divide vccv as vc.cv */
	  if (syl_flags & DO_VC_CV                     &&
		  rp           != (struct root_node *)NULL &&
		  rp->rn_right != (struct root_node *)NULL &&
		  rp->rn_seg->seg_cons           == PLUS   &&
		  rp->rn_right->rn_seg->seg_cons == PLUS   &&
		  rp->rn_left  != (struct root_node *)NULL &&
		  compare_sonority(rp->rn_left, rp) != EQUAL)
		{
		  add_to_syl(rp, &sp, &rlp);
				/* make coda moraic if appropriate */
		  if (syl_flags & DO_WT_BY_POS             &&
		  sp->syl_mora[1] == (struct mora *)NULL)
		{
		  sp->syl_mora[1] = rp->rn_mora[0] = add_mora(rp, sp);
		}
		  rp = rp->rn_right;
		}
	}
				/* need a new syllable */
	  rlp        = (struct root_node_list *)NULL;
	  moras_seen = 0;
	}
}	/* end sonority */

/*****
#include noc.c

#include template.c
 *****/

/****************************************************************************
 * NAME
 *    syllable_parse
 * ARGUMENTS
 *    rnp           - pointer to head of list of root nodes
 *    syl_algorithm - which syllabification algorithm to use
 *    do_wt_by_pos  - do wieght-by-position flag
 *    do_vc_cv      - do vc.cv ambiguity selection
 *    do_trace      - tracing flag
 * DESCRIPTION
 *    parse a list of root nodes into syllables
 * RETURN VALUE
 *    NONE
 */
void syllable_parse(rnp, do_trace, pStamp_in )
	 struct root_node *rnp;
	 int do_trace;
	 StampData *pStamp_in;
{
					/* shouldn't happen, but ... */
  if (rnp == (struct root_node *)NULL)
	return;

  switch( pStamp_in->iSylAlgorithm )
	{
/****
	case TEMPLATE:
					template( rnp, do_wt_by_pos );
			break;

	case NUCLEUS_ONSET_CODA:
				nuc_ons_coda( rnp, do_wt_by_pos );
			break;
 ****/
	case SONORITY:
	default:
			sonority( rnp, pStamp_in->iSylFlags);
			break;

	}	/* end switch */
				/* calculate each syllable's weight */
  set_syl_weight(rnp);

  if ((do_trace & TRACE_SYLLABLE) && pStamp_in->pLogFP)
	disp_syllable_parse(rnp, pStamp_in);

} /* end syllable_parse */
