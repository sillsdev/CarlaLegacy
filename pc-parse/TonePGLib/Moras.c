/* MORAS.C - assign mora structures to elements in a list of root nodes
 *
 *	Andy Black
 *	08-Apr-92
 *
 ***************************************************************************
 *
 *      struct mora *add_mora( rp, sp )
 *           struct root_node *rp;
 *           struct syllable  *sp;
 *
 *      void disp_segment( rnp, moras_only )
 *           struct root_node *rnp;
 *           int moras_only;
 *
 *      void disp_mora( mp )
 *           struct mora *mp;
 *
 *      static void disp_mora_assign( rnp )
 *           struct root_node *rnp;
 *
 *      void mora_assignment(rnp, do_trace )
 *           struct root_node *rnp;
 *           int do_trace;
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	08-Apr-92	hab - initial coding
 ***************************************************************************
 * Copyright 1992 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>

#include "stamp.h"
#include "tonepars.h"

/********************* OPACLIB FUNCTIONS *********************/

/* syllable.c */
extern struct root_node_list *make_root_node_list P(( struct root_node_list *rnlp));
#undef P

/****************************************************************************
 * NAME
 *    add_mora
 * ARGUMENTS
 *    rp          - pointer to a root node structure
 *    sp         - syllable to which the mora belongs
 * DESCRIPTION
 *    add a mora structure and link it to its root node and syllable
 * RETURN VALUE
 *    a pointer to the newly created mora structure
 */
struct mora *add_mora( rp, sp )
	 struct root_node *rp;
	 struct syllable  *sp;
{
  struct mora *mp;
					/* if there isn't a root node, */
					/* return nothing */
  if (rp == (struct root_node *)NULL)
	return((struct mora *)NULL);

  mp = (struct mora *)allocMemory(sizeof(struct mora));
  mp->mora_rnl         = make_root_node_list( (struct root_node_list *)NULL );
  mp->mora_rnl->rnl_rn = rp;
  mp->mora_syl         = sp;
  mp->mora_tbu         = (struct tbu *)NULL;

  return( mp );

}	/* end add_mora */

/****************************************************************************
 * NAME
 *    disp_segment
 * ARGUMENTS
 *    rnp - pointer to a root node structure
 * DESCRIPTION
 *    output a segment, including any moras, in form suitable for
 *    the 'tree' program
 * RETURN VALUE
 *    NONE
 */
void disp_segment( rnp, moras_only, pStamp_in )
	 struct root_node *rnp;
	 int moras_only;
	 StampData *pStamp_in;
{
					/* if there isn't anything there, */
					/* don't display anything */
  if (rnp == (struct root_node *)NULL)
	return;

  if (rnp->rn_mora[0] != (struct mora *)NULL)
	if (rnp->rn_mora[1] != (struct mora *)NULL)
	  if (moras_only)
	fprintf(pStamp_in->pLogFP, "(%s \\I (%s) (%s)) ",
		SEG_OR_UNDR(rnp->rn_seg),
		pStamp_in->pszMoraStr, pStamp_in->pszMoraStr);
	  else
	fprintf(pStamp_in->pLogFP, "(%s \\I (%s) (%s)) ()",
		SEG_OR_UNDR(rnp->rn_seg),
		pStamp_in->pszMoraStr, pStamp_in->pszMoraStr);
	else
	  fprintf(pStamp_in->pLogFP, "(%s (%s\\F)) ", pStamp_in->pszMoraStr,
		  SEG_OR_UNDR(rnp->rn_seg));
  else
	if (moras_only)
	  fprintf(pStamp_in->pLogFP, "(\\O %s\\F) ", SEG_OR_UNDR(rnp->rn_seg));
	else
	  fprintf(pStamp_in->pLogFP, "(%s\\F) ", SEG_OR_UNDR(rnp->rn_seg));

}	/* end disp_segment */

/****************************************************************************
 * NAME
 *    disp_mora
 * ARGUMENTS
 *    mp - pointer to mora to display
 * DESCRIPTION
 *    Display the mora's segments
 * RETURN VALUE
 *    NONE
 */
void disp_mora( mp, pStamp_in )
	 struct mora *mp;
	 StampData *pStamp_in;
{
  struct root_node_list *rnlp;
					/* shouldn't happen, but ... */
  if (mp == (struct mora *)NULL)
	return;
				/* run through the root node list */
				/* associated with this syllable */
  for (rnlp = mp->mora_rnl;
	   rnlp != (struct root_node_list *)NULL;
	   rnlp = rnlp->rnl_next)
	{
				/* output the appropriate info for each */
				/* root node */
	  disp_segment( rnlp->rnl_rn, FALSE, pStamp_in);
	}
  fprintf(pStamp_in->pLogFP, ")");

}	/* end disp_mora */

/****************************************************************************
 * NAME
 *    disp_mora_assign
 * ARGUMENTS
 *    rnp - pointer to head of doubly linked list of root nodes
 * DESCRIPTION
 *    Display the mora assignments in a list of root nodes
 * RETURN VALUE
 *    NONE
 */
static void disp_mora_assign( rnp, pStamp_in )
	 struct root_node *rnp;
	 StampData  *pStamp_in;
{
  struct root_node *rp;
					/* shouldn't happen, but ... */
  if (rnp == (struct root_node *)NULL)
	fprintf(pStamp_in->pLogFP, "\nMora Assignment: there are no root nodes.\n");
  else
	{
	  fprintf(pStamp_in->pLogFP, "\n   Mora Assignment: ");
	  fprintf(pStamp_in->pLogFP, "\n\\tree (");
		/*  run through the list, displaying the segments */

	  for (rp = rnp;
	   rp != (struct root_node *)NULL;
	   rp = rp->rn_right)
	{
	  disp_segment( rp, TRUE, pStamp_in );
	}
	  fprintf(pStamp_in->pLogFP, ")");
	}
}	/* end disp_mora_assign */

/****************************************************************************
 * NAME
 *    has_n_moras
 * ARGUMENTS
 *    ap - pointer to an analysis struct
 *    count - number of moras to check for
 * DESCRIPTION
 *    Determines if the morpheme has the indicated number of moras
 *
 * RETURN VALUE
 *    TRUE  if the morpheme spans the indicated number of moras
 *    FALSE otherwise
 */
int has_n_moras( ap, count )
	 StampAnalysis  *ap;
	 int               count;
{
  int i, mora_count;
  struct mora *curmp;
  struct root_node *rp, *rend;

				/* check for valid pointers */
  if (ap == (StampAnalysis *)NULL)
	return(FALSE);

  if (ap->pRNBeg == (struct root_node *)NULL ||
	  (rend = ap->pRNEnd) == (struct root_node *)NULL)
	return(FALSE);

				/* count the number of moras in the */
				/* morpheme */
  for (rp = ap->pRNBeg, mora_count = 0, curmp = (struct mora *)NULL;
	   rp != (struct root_node *)NULL &&
	   rp != rend->rn_right;
	   rp = rp->rn_right)
	{
	  if (rp->rn_mora[0] != (struct mora *)NULL &&
	  rp->rn_mora[0] != curmp)
	{
	  mora_count++;
	  curmp = rp->rn_mora[0];
	  for (i = 1; i < MAX_MORAS; i++)
		{
		  if (rp->rn_mora[i] != (struct mora *)NULL &&
		  rp->rn_mora[i] != curmp)
		{
		  mora_count++;
		  curmp = rp->rn_mora[i];
		}
		}
	}
	}

  return(mora_count == count);

}	/* end has_n_moras */

/****************************************************************************
 * NAME
 *    mora_assignment
 * ARGUMENTS
 *    rnp - pointer to head of list of root nodes
 *    do_trace - tracing flag
 * DESCRIPTION
 *    Assign mora structures to appropriate root nodes
 * RETURN VALUE
 *    NONE
 */
void mora_assignment(rnp, do_trace, pStamp_in )
	 struct root_node *rnp;
	 int do_trace;
	 StampData *pStamp_in;
{
  int mora_count;
  struct root_node *rp;
					/* shouldn't happen, but ... */
  if (rnp == (struct root_node *)NULL)
	return;
		/*  run through the list of root nodes, allocating mora */
		/*  structures for the appropriate root nodes */
  for (rp = rnp;
	   rp != (struct root_node *)NULL;
	   rp = rp->rn_right)
	{
	  if ((mora_count = rp->rn_seg->seg_mora))
	{
	  while (mora_count--)
		{
				/* found a root node requiring mora(s); build a */
			/* mora structure and associated structures for it */
		  rp->rn_mora[mora_count] = add_mora(rp, (struct syllable *)NULL);
		}
	}
	}

  if ((do_trace & TRACE_MORA) && pStamp_in->pLogFP)
	disp_mora_assign(rnp, pStamp_in);

} /* end mora_assignment */
