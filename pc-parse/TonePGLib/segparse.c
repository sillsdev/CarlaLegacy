/* SEGPARSE.C - parse a string into its segments according the segment
 * 			inventory
 *
 *	Andy Black
 *	08-Apr-92
 *
 ***************************************************************************
 *
 *      static int disp_root_nodes( rnp )
 *           struct root_node *rnp;
 *
 *      struct root_node *segment_parse(wp, slp, do_trace )
 *           char *wp;
 *           struct segment_list *slp;
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

	   struct segment *find_seg P((char *cp, struct segment_list *slp));
#undef P

/****************************************************************************
 * NAME
 *    disp_root_nodes
 * ARGUMENTS
 *    rnp - pointer to head of doubly linked list of root nodes
 * DESCRIPTION
 *    Display the segments in the list of root nodes
 * RETURN VALUE
 *    NONE
 */
static void disp_root_nodes( rnp, pOutputFP_in )
	 struct root_node *rnp;
	 FILE             *pOutputFP_in;
{
  struct root_node *rp;
					/* shouldn't happen, but ... */
  if (rnp == (struct root_node *)NULL)
	fprintf(pOutputFP_in, "\nROOT NODE LIST: there are no root nodes.\n");
  else
	{
	  fprintf(pOutputFP_in, "\n   Segment Parsing: ");
		/*  run through the list, displaying the segments */
	  for (rp = rnp;
	   rp != (struct root_node *)NULL;
	   rp = rp->rn_right)
	{
	  if (rp != rnp)
		putc('.', pOutputFP_in);
	  fprintf(pOutputFP_in, "%s", rp->rn_seg->seg_str);
	}
	}
}	/* end disp_root_nodes */

/****************************************************************************
 * NAME
 *    find_seg
 * ARGUMENTS
 *    cp  - string to find in segment inventory
 *    slp - pointer to head of linked list of segments (the inventory)
 * DESCRIPTION
 *    find a string in the segment inventory
 * RETURN VALUE
 *    pointer to segment struct
 */
struct segment *find_seg( cp, slp )
	 char                *cp;
	 struct segment_list *slp;
{
  struct segment *sp;
  struct segment_list *sl;
  int longest;

				/* get longest segment that matches the */
				/* input string */
  for (sl = slp, longest = 0, sp = (struct segment *)NULL;
	   sl != (struct segment_list *)NULL;
	   sl = sl->segl_next)
	{
	  if (!strncmp(cp, sl->segl_seg->seg_str, sl->segl_seg->seg_len))
					/* found a potential match */
	if (sl->segl_seg->seg_len > longest)
	  {				/* remember it */
		longest = sl->segl_seg->seg_len;
		sp = sl->segl_seg;
	  }
	}

  return(sp);

}	/* end find_seg */

/****************************************************************************
 * NAME
 *    make_root_node
 * ARGUMENTS
 *    segp - pointer to segment corresponding to root node
 * DESCRIPTION
 *    allocate a root node structure
 * RETURN VALUE
 *    pointer to allocated root node structure
 */
struct root_node *make_root_node( segp )
	 struct segment *segp;
{
  struct root_node *rp;

  rp = (struct root_node *)allocMemory(sizeof(struct root_node));
#ifdef MEM_DEBUG
  printf(" make_root_node: root_node");
#endif /* MEM_DEBUG */
  rp->rn_seg     = segp;
  rp->rn_mora[0] = (struct mora *)NULL;
  rp->rn_mora[1] = (struct mora *)NULL;
  rp->rn_syl     = (struct syllable *)NULL;
  rp->rn_tbu     = (struct tbu *)NULL;
  rp->rn_left    = (struct root_node *)NULL;
  rp->rn_right   = (struct root_node *)NULL;

  return(rp);

}	/* end make_root_node */

/****************************************************************************
 * NAME
 *    segment_parse
 * ARGUMENTS
 *    wp  - pointer to word to be parsed into segments
 *    slp - pointer to head of segment list
 *    do_trace - tracing flag
 * DESCRIPTION
 *    Add a segment structure to the segment_list
 * RETURN VALUE
 *    new head of segment list
 */
struct root_node *segment_parse(wp, slp, do_trace, pStamp_in)
	 char *wp;
	 struct segment_list *slp;
	 int do_trace;
	 StampData *pStamp_in;
{
  struct segment *sp;
  struct root_node *initial_rn;
  struct root_node *prev_rn;
  struct root_node *rnp;
  char *cp;
				/* initialize */
  initial_rn = prev_rn = (struct root_node *)NULL;

  if (wp == (char *)NULL)	/* shouldn't happen, but ... */
	return((struct root_node *)NULL);

  cp = wp;			/* initialize pointer to the word */

  while (*cp != NUL && cp != (char *)NULL)
	{
				/* get longest segment that matches the */
				/* input string */
	  if ((sp = find_seg(cp, slp)) == (struct segment *)NULL)
	{
	  if (pStamp_in->pLogFP)
		{
		  fprintf(pStamp_in->pLogFP,
			  "\nsegment parse: Word %s contains string (%s)", wp, cp);
		  fprintf(pStamp_in->pLogFP,
			  " not in the segment inventory.");
		}
	  return((struct root_node *)NULL);
	}
					/* found a segment; build a root_node
				   structure for it */
	  rnp = make_root_node(sp);
				/* link it in to the root node list */
	  rnp->rn_left = prev_rn;
	  rnp->rn_right = (struct root_node *)NULL;
	  if (prev_rn != (struct root_node *)NULL)
	prev_rn->rn_right = rnp;
	  else
	initial_rn = rnp;
	  prev_rn = rnp;
				/* move the pointer over in the word to */
				/* find the next segment */
	  cp += sp->seg_len;
	}

  if ((do_trace & TRACE_SEGMENTS) && pStamp_in->pLogFP)
	disp_root_nodes(initial_rn, pStamp_in->pLogFP);

  return(initial_rn);

} /* end segment_parse */
