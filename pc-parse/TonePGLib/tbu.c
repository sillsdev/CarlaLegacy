/* TBU.C - Tone Bearing Unit Structure Routines
 *
 *	Andy Black
 *	18-Oct-93
 *
 ***************************************************************************
 *
 *      void print_banner()
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	18-Oct-93	hab - initial coding
 ***************************************************************************
 * Copyright 1993 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include "stamp.h"
#include "tonepars.h"
#include "trule.h"

/******************************* LOCAL PROTOTYPES ********************/
static struct tbu      *add_tbu       P((struct tbu *tbu_headp, int tb_type,
					 void *typep));
	   struct tbu_list *add_tbu_list  P((struct tbu_list *tbl_headp,int head));
	   struct tbu      *build_tbus    P((struct syllable *sylp,
					 int do_trace, StampData *pStamp_in));
	   struct tbu_list *copy_tbu_list P((struct tbu_list *tb_headp));
	   struct tbu_list *end_of_tbu_list P((struct tbu_list *tbhp));
	   struct tbu      *end_of_tbus   P((struct tbu *tbhp));
	   void             free_tbu_list P((struct tbu_list *tblp));
	   void             free_tbus     P((struct tbu *tbp));
	   struct tbu      *get_edge_tbu  P((struct root_node *rbeg,
					 struct root_node *rend,
					 int tbu_type, int edge));
#ifndef B4_0_4_4
	   StampAnalysis *get_morph_from_tbu P((StampAnalysis *ap,
						  struct tbu      *tbu));
#endif /* B4_0_4_4 */
	   void             show_tbu      P((struct tbu *tbup,
					 StampData *pStamp_in));
	   void             show_tbus     P((struct tbu *tbu_headp,
					 StampData *pStamp_in));
	   int              tbu_has_tone_id P((struct tbu     *tbp,
					   struct tone_id *tip));
	   int              tbu_has_under_tone_id P((struct tone_list *tlp,
						 int               tbu_num,
						 struct tone_id   *tip));
	   int              tbu_in_morpheme P((struct tbu      *tbp,
					   StampAnalysis *ap));
	   char            *tbu_type_name P((int tbu_type));


			/* mora.c  */
extern void disp_segment P((struct root_node *rnp, int moras_only,
				StampData *pStamp_in));

			/* syllable.c */
extern void disp_syllable P((struct syllable *sp, int show_weight,
				 struct syllable *syl,
				 StampData *pStamp_in));

			/* tone.c */
extern void free_tone_list P((struct tone_list *tlp));
extern int  get_next_loc   P((char *bitmap, int loc));
extern int  tone_matches   P((struct tone *tp,
				  struct tone_id *tip));
#undef P

/****************************************************************************
 * NAME
 *    add_tbu
 * ARGUMENTS
 *    tbu_headp - pointer to head of list of tbu's
 *    tb_type   - type of tbu
 *    typep     - pointer to struct of tbu type
 * DESCRIPTION
 *    add and initialize a new tbu struct
 * RETURN VALUE
 *    pointer to new tbu struct
 */
static struct tbu *add_tbu(tbu_headp, tb_type, typep)
	 struct tbu *tbu_headp;
	 int tb_type;
	 void *typep;
{
  struct tbu *tbp, *tbp2;

				/* allocate the struct */
  tbp            = structalloc( tbu );
#ifdef MEM_DEBUG
  printf(" add_tbu");
#endif	/* MEM_DEBUG */
				/* init values */
  tbp->tbu_tonel = (struct tone_list *)NULL;
  tbp->tbu_right = (struct tbu *)NULL;

  switch ((tbp->tbu_type = tb_type))
	{
	case MORA_TBU:
	  tbp->tbu_ptr.tbu_mora = (struct mora *)typep;
	  if (tbp->tbu_ptr.tbu_mora != (struct mora *)NULL)
	tbp->tbu_ptr.tbu_mora->mora_tbu = tbp;
	  break;

	case SYLLABLE_TBU:
	  tbp->tbu_ptr.tbu_syl = (struct syllable *)typep;
	  if (tbp->tbu_ptr.tbu_syl != (struct syllable *)NULL)
	tbp->tbu_ptr.tbu_syl->syl_tbu = tbp;
	  break;

	case VOWEL_TBU:
	  tbp->tbu_ptr.tbu_vwl = (struct root_node *)typep;
	  if (tbp->tbu_ptr.tbu_vwl != (struct root_node *)NULL)
	tbp->tbu_ptr.tbu_vwl->rn_tbu = tbp;
	  break;

	default:
	  fprintf(stderr,"\nProgram error: undefined TBU type (%d)!", tb_type);
	  fprintf(stderr,"\n\tUsing mora.");
	  tbp->tbu_type = MORA_TBU;
	  tbp->tbu_ptr.tbu_mora = (struct mora *)typep;
	  if (tbp->tbu_ptr.tbu_mora != (struct mora *)NULL)
	tbp->tbu_ptr.tbu_mora->mora_tbu = tbp;
	}

				/* link it into the list */
				/* find end of list */
  for (tbp2 = tbu_headp;
	   tbp2 != (struct tbu *)NULL && tbp2->tbu_right != (struct tbu *)NULL;
	   tbp2 = tbp2->tbu_right)
	;
				/* link it in */
  if (tbp2 == (struct tbu *)NULL)
	{
	  tbu_headp = tbp;
	  tbp->tbu_left = (struct tbu *)NULL;
	}
  else
	{
	  tbp->tbu_left = tbp2;
	  tbp2->tbu_right = tbp;
	}

  return( tbu_headp );

}	/* end add_tbu */

/****************************************************************************
 * NAME
 *    add_tbu_list
 * ARGUMENTS
 *    tbl_headp - pointer to head of linked list of tbu_list structs
 *    head     - flag as to whether to add the new tbu_list to the head or
 *               to the tail of the list
 * DESCRIPTION
 *    add a new tbu_list struct to the list
 * RETURN VALUE
 *    pointer to head of the list
 */
struct tbu_list *add_tbu_list(tbl_headp, head)
	 struct tbu_list *tbl_headp;
	 int              head;
{
  struct tbu_list *tblp, *tblp2;

  tblp            = structalloc( tbu_list );
#ifdef MEM_DEBUG
  printf(" add_tbu_list");
#endif	/* MEM_DEBUG */
  tblp->tbul_tbu  = (struct tbu *)NULL;
  tblp->tbul_next = (struct tbu_list *)NULL;
				/* link it into the list */
  if (head)
	{				/* add it to head of the list */
	  if (tbl_headp != (struct tbu_list *)NULL)
	tblp->tbul_next = tbl_headp;
	  tbl_headp = tblp;
	}
  else
	{				/* add it to the tail of the list */
	  tblp2 = end_of_tbu_list(tbl_headp);
	  if (tblp2 == (struct tbu_list *)NULL)
	tbl_headp = tblp;
	  else
	tblp2->tbul_next = tblp;
	}

  return( tbl_headp );

}	/* end add_tbu_list */

/****************************************************************************
 * NAME
 *    build_tbus
 * ARGUMENTS
 *    sylp     - pointer to first syllable in pword
 *    tbu_type - type of elment to use as tone bearing unit
 *    do_trace - tracing flag
 * DESCRIPTION
 *    build doubly linked list of tone bearing units
 * RETURN VALUE
 *    pointer to the head of the list of tbu structs
 */
struct tbu *build_tbus( sylp, do_trace, pStamp_in)
	 struct syllable *sylp;
	 int              do_trace;
	 StampData       *pStamp_in;
{
  struct tbu *tbu_headp;
  struct root_node_list *rnlp;
  int i;

  tbu_headp = (struct tbu *)NULL;

  for (; sylp != (struct syllable *)NULL; sylp = sylp->syl_right)
	{
	  switch (pStamp_in->iTbuType)
	{
	case MORA_TBU:
	  for (i = 0; i < MAX_MORAS; i++)
		if (sylp->syl_mora[i] != (struct mora *)NULL)
		  tbu_headp = add_tbu(tbu_headp, pStamp_in->iTbuType, sylp->syl_mora[i]);
	  break;

	case SYLLABLE_TBU:
	  tbu_headp = add_tbu(tbu_headp, pStamp_in->iTbuType, sylp);
	  break;

	case VOWEL_TBU:
	  for (rnlp = sylp->syl_rnl;
		   rnlp != (struct root_node_list *)NULL;
		   rnlp = rnlp->rnl_next)
		{
		  if (rnlp->rnl_rn->rn_seg->seg_cons == MINUS &&
		  rnlp->rnl_rn->rn_mora[0] != (struct mora *)NULL)
		tbu_headp = add_tbu(tbu_headp, pStamp_in->iTbuType, rnlp->rnl_rn);
		}
	  break;

	default:
	  fprintf(stderr,"\nProgram error: trying to build undefined tbu type (%d)", pStamp_in->iTbuType);
	  fprintf(stderr,"\n\tWill build nothing.");
	}
	}

  if ((do_trace & TRACE_TBU) && pStamp_in->pLogFP)
	show_tbus(tbu_headp, pStamp_in);

  return(tbu_headp);

}	/* end build_tbus */

/****************************************************************************
 * NAME
 *    copy_tbu_list
 * ARGUMENTS
 *    tb_headp - pointer to head of linked list of tbu_list structs
 * DESCRIPTION
 *    create a copy of a tbu_list
 * RETURN VALUE
 *    pointer to the new tbu_list
 */
struct tbu_list *copy_tbu_list(tb_headp)
	 struct tbu_list *tb_headp;
{
  struct tbu_list *tbp, *new_tbp, *tnp;

  new_tbp = (struct tbu_list *)NULL;
				/* run through the list */
  for (tbp = tb_headp;
	   tbp != (struct tbu_list *)NULL;
	   tbp = tbp->tbul_next)
	{
				/* add a new element */
#ifdef MEM_DEBUG
fprintf(stdout,"\n\tin copy_tbu_list");
#endif
	  new_tbp = add_tbu_list(new_tbp, TAIL);
				/* find end of list */
	  for (tnp = new_tbp;
	   tnp != (struct tbu_list *)NULL &&
	   tnp->tbul_next != (struct tbu_list *)NULL;
	   tnp = tnp->tbul_next)
	;
	  tnp->tbul_tbu = tbp->tbul_tbu; /* is this what is needed? or should */
					 /* we also copy the tbu's? */
	}

  return(new_tbp);

}	/* end copy_tbu_list */

/****************************************************************************
 * NAME
 *    end_of_tbu_list
 * ARGUMENTS
 *    tbhp - pointer to head of tbu_list
 * DESCRIPTION
 *    find the last element in a linked list of tbu_list structs
 * RETURN VALUE
 *    pointer to the last element
 */
struct tbu_list *end_of_tbu_list(tbhp)
	 struct tbu_list *tbhp;
{
  struct tbu_list *tbp;

  for (tbp = tbhp;
	   tbp != (struct tbu_list *)NULL &&
	   tbp->tbul_next != (struct tbu_list *)NULL;
	   tbp = tbp->tbul_next)
	;

  return(tbp);

}	/* end end_of_tbu_list */

/****************************************************************************
 * NAME
 *    end_of_tbus
 * ARGUMENTS
 *    tbhp - pointer to head of linked list of tbus
 * DESCRIPTION
 *    find the last element in a linked list of tbu structs
 * RETURN VALUE
 *    pointer to the last element
 */
struct tbu *end_of_tbus(tbhp)
	 struct tbu *tbhp;
{
  struct tbu *tbp;

  for (tbp = tbhp;
	   tbp != (struct tbu *)NULL &&
	   tbp->tbu_right != (struct tbu *)NULL;
	   tbp = tbp->tbu_right)
	;

  return(tbp);

}	/* end end_of_tbus */

/****************************************************************************
 * NAME
 *    free_tbu_list
 * ARGUMENTS
 *    tbu_headp - pointer to head of tbu_list struct list
 * DESCRIPTION
 *    free memory used by tbu_list structs
 * RETURN VALUE
 *    NONE
 */
void free_tbu_list(tblp)
	 struct tbu_list *tblp;
{
  struct tbu_list *tblp2;

  for (;
	   tblp != (struct tbu_list *)NULL;
	   tblp = tblp2)
	{
	  tblp2 = tblp->tbul_next;
	  freeMemory((char *)tblp);
	}

}	/* end free_tbu_list */

/****************************************************************************
 * NAME
 *    free_tbu
 * ARGUMENTS
 *    tbp - pointer to a tbu struct
 * DESCRIPTION
 *    free memory used by a tbu struct
 * RETURN VALUE
 *    NONE
 */
void free_tbu(tbp)
	 struct tbu *tbp;
{

  if (tbp == (struct tbu *)NULL)
	return;
				/* free its tone list */
  free_tone_list(tbp->tbu_tonel);
  freeMemory((char *)tbp);

}	/* end free_tbus */

/****************************************************************************
 * NAME
 *    free_tbus
 * ARGUMENTS
 *    tbp - pointer to head of tbu struct list
 * DESCRIPTION
 *    free memory used by tbu structs
 * RETURN VALUE
 *    NONE
 */
void free_tbus(tbp)
	 struct tbu *tbp;
{
  struct tbu *tbp2;

  for (;
	   tbp != (struct tbu *)NULL;
	   tbp = tbp2)
	{
	  tbp2 = tbp->tbu_right;
	  free_tbu(tbp);
	}

}	/* end free_tbus */

/****************************************************************************
 * NAME
 *    get_edge_tbu
 * ARGUMENTS
 *    rbeg - pointer to beginning root_node struct
 *    rend - pointer to ending    root_node struct
 *    tbu_type - type of tone bearing unit
 *    edge     - from which edge to scan
 * DESCRIPTION
 *    get edgemost tbu in range of root_nodes
 * RETURN VALUE
 *    pointer to the tbu
 */
struct tbu *get_edge_tbu(rbeg, rend, tbu_type, edge)
	 struct root_node *rbeg;
	 struct root_node *rend;
	 int               tbu_type;
	 int               edge;
{
  struct root_node *rnp;
  struct tbu       *tbp;

				/* initialize */
  tbp = (struct tbu *)NULL;

  if (edge == LEFT)
	{				/* look for leftmost tbu */
	  for (rnp = rbeg;
	   rnp != (struct root_node *)NULL &&
		 rnp->rn_left != rend          &&
		 tbp == (struct tbu *)NULL;
	   rnp = rnp->rn_right)
	{
	  switch (tbu_type)
		{
		default:
		case MORA_TBU:
		  if (rnp->rn_mora[0] != (struct mora *)NULL)
		tbp = rnp->rn_mora[0]->mora_tbu;
		  break;

		case SYLLABLE_TBU:
		  /* later */
		  break;
		case VOWEL_TBU:
		  /* later */
		  break;
		}
	}
	}
  else
	{				/* look for rightmost tbu */
	  for (rnp = rend;
	   rnp != (struct root_node *)NULL &&
		 rnp->rn_right != rbeg         &&
		 tbp == (struct tbu *)NULL;
	   rnp = rnp->rn_left)
	{
	  switch (tbu_type)
		{
		default:
		case MORA_TBU:
		  if (rnp->rn_mora[0] != (struct mora *)NULL)
		tbp = rnp->rn_mora[0]->mora_tbu;
		  break;

		case SYLLABLE_TBU:
		  /* later */
		  break;
		case VOWEL_TBU:
		  /* later */
		  break;
		}
	}
	}

  return( tbp );

}	/* end get_edge_tbu */

#ifndef B4_0_4_4
/****************************************************************************
 * NAME
 *    get_morph_from_tbu
 * ARGUMENTS
 *    ap  - pointer to current morpheme (analysis struct)
 *    tbu - pointer to tbu to find
 * DESCRIPTION
 *    determine to which morpheme (analysis struct) a given tbu belongs
 * RETURN VALUE
 *    pointer to the morpheme (analysis struct)
 */
StampAnalysis *get_morph_from_tbu(ap, tbu)
	 StampAnalysis *ap;
	 struct tbu      *tbu;
{
  StampAnalysis *apr, *apl;
  struct tbu      *tbp2;
				/* (check ap; if not, scan to front of word; if not, scan to end of word */

  if (ap  == (StampAnalysis *)NULL ||
	  tbu == (struct tbu *)NULL)
	return( (StampAnalysis *)NULL);
				/* see if the tbu is in the morpheme */
  for (tbp2 = ap->pTBUBeg;
	   tbp2 != (struct tbu *)NULL &&
	   tbp2->tbu_left != ap->pTBUEnd;
	   tbp2 = tbp2->tbu_right)
	if (tbu == tbp2)
	  return(ap);		/* it is; we're done */

				/* now look sucessively further from the */
				/* original morpheme, first to the left, */
				/* and then to the right (this is assuming */
				/* that the tbu is most likely relatively */
				/* close to the original morpheme */
  apl = ap->pLeftLink;
  apr = ap->pRightLink;
  while (apl != (StampAnalysis *)NULL ||
	 apr != (StampAnalysis *)NULL)
	{
				/* try the next one to the left */
	  if (apl != (StampAnalysis *)NULL)
	{
	  for (tbp2 = apl->pTBUBeg;
		   tbp2 != (struct tbu *)NULL &&
		   tbp2->tbu_left != apl->pTBUEnd;
		   tbp2 = tbp2->tbu_right)
		if (tbu == tbp2)
		  return(apl);	  /* found it; we're done */
	  apl = apl->pLeftLink;	/* next time, try further left */
	}
				/* no luck; try the next one to right */
	  if (apr != (StampAnalysis *)NULL)
	{
	  for (tbp2 = apr->pTBUBeg;
		   tbp2 != (struct tbu *)NULL &&
		   tbp2->tbu_left != apr->pTBUEnd;
		   tbp2 = tbp2->tbu_right)
		if (tbu == tbp2)
		  return(apr);	  /* found it; we're done */
	  apr = apr->pRightLink;	/* next time, try further right */
	}
	}

  return( (StampAnalysis *)NULL );

}	/* end get_morph_from_tbu */
#endif /* B4_0_4_4 */
/****************************************************************************
 * NAME
 *    show_tbu
 * ARGUMENTS
 *    tbup - pointer to a tbu struct
 * DESCRIPTION
 *    show info for a tbu struct
 * RETURN VALUE
 *    NONE
 */
void show_tbu(tbup, pStamp_in)
	 struct tbu *tbup;
	 StampData *pStamp_in;
{
  struct root_node *rnp;

  if (tbup == (struct tbu *)NULL)
	return;

  fprintf(pStamp_in->pLogFP, "\n\t\tTBU: type = %s, segment(s) = ",
	  tbu_type_name(tbup->tbu_type));
  switch (tbup->tbu_type)
	{
	case MORA_TBU:
	  rnp = tbup->tbu_ptr.tbu_mora->mora_rnl->rnl_rn;
	  if (rnp->rn_seg != (struct segment *)NULL)
	fprintf(pStamp_in->pLogFP, "%s / ", rnp->rn_seg->seg_str);
	  else
	fprintf(pStamp_in->pLogFP, "UNKNOWN SEGMENT!");
	  if (rnp->rn_left != (struct root_node *)NULL &&
	  rnp->rn_left->rn_seg != (struct segment *)NULL)
	fprintf(pStamp_in->pLogFP, "%s _ ",rnp->rn_left->rn_seg->seg_str);
	  else
	fprintf(pStamp_in->pLogFP, "# _ ");
	  if (rnp->rn_right != (struct root_node *)NULL &&
	  rnp->rn_right->rn_seg != (struct segment *)NULL)
	fprintf(pStamp_in->pLogFP, "%s",rnp->rn_right->rn_seg->seg_str);
	  else
	fprintf(pStamp_in->pLogFP, "#");
	  break;

	case SYLLABLE_TBU:
	  disp_syllable(tbup->tbu_ptr.tbu_syl, FALSE, (struct syllable *)NULL,
			pStamp_in);
	  break;

	case VOWEL_TBU:
	  disp_segment(tbup->tbu_ptr.tbu_vwl, FALSE, pStamp_in);
	  break;
	}


}	/* end show_tbu */

/****************************************************************************
 * NAME
 *    show_tbus
 * ARGUMENTS
 *    tbu_headp - pointer to head of a doubly linked list of tbu structs
 * DESCRIPTION
 *    show info for each tbu struct in the list
 * RETURN VALUE
 *    NONE
 */
void show_tbus(tbu_headp, pStamp_in)
	 struct tbu *tbu_headp;
	 StampData  *pStamp_in;
{
  struct tbu *tbup;

  for (tbup = tbu_headp;
	   tbup != (struct tbu *)NULL;
	   tbup = tbup->tbu_right)
	{
	  show_tbu(tbup, pStamp_in);
	}
}	/* end show_tbus */

/****************************************************************************
 * NAME
 *    tbu_has_tone_id
 * ARGUMENTS
 *    tbp - pointer to a tbu struct
 *    tip - pointer to a tone_id struct
 * DESCRIPTION
 *    see if the tbu has a tone as indicated by tip
 * RETURN VALUE
 *    TRUE  if it does
 *    FALSE otherwise
 */
int tbu_has_tone_id(tbp, tip)
	 struct tbu     *tbp;
	 struct tone_id *tip;
{
  struct tone_list *tlp;

  if (tbp != (struct tbu *)NULL)
	{
	  for (tlp = tbp->tbu_tonel;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	if (tone_matches(tlp->tonl_tone, tip))
	  return(TRUE);
	}

  return(FALSE);

}	/* end tbu_has_tone_id */

/****************************************************************************
 * NAME
 *    tbu_has_under_tone_id
 * ARGUMENTS
 *    tlp - pointer to a (underlying) tone_list struct
 *    tbu_num - which tbu to check
 *    tip - pointer to a tone_id struct
 * DESCRIPTION
 *    see any of the tones in the (underlying) tone list are at the indicated
 *    tbu and are as indicated by tip
 * RETURN VALUE
 *    TRUE  if so
 *    FALSE otherwise
 */
int tbu_has_under_tone_id(tlp, tbu_num, tip)
	 struct tone_list *tlp;
	 int               tbu_num;
	 struct tone_id   *tip;
{
  int tbu;

  if (tlp == (struct tone_list *)NULL)
	{				/* if the tone list is empty */
	  if (tip == (struct tone_id *)NULL)
	return(TRUE);		/* and the match is empty, is good */
	  else
	return(FALSE);		/* else is bad */
	}
				/* run through the tones */
  for (;
	   tlp != (struct tone_list *)NULL;
	   tlp = tlp->tonl_right)
	{				/* check for the indicated tbu */
	  if (tlp->tonl_tone != (struct tone *)NULL)
	for (tbu = 0;
		 (tbu = get_next_loc(tlp->tonl_tone->tone_ul_loc, tbu));
		 )
	  {
		if (tbu == tbu_num)
		  if (tone_matches(tlp->tonl_tone, tip))
		return(TRUE);
	  }
	}

  return(FALSE);

}	/* end tbu_has_under_tone_id */

/****************************************************************************
 * NAME
 *    tbu_in_morpheme
 * ARGUMENTS
 *    tbp - pointer to a tone bearing unit (tbu) struct
 *    ap  - pointer to analysis struct
 * DESCRIPTION
 *    determine if the tbu is in the set of tbu's belonging to the morpheme
 * RETURN VALUE
 *    TRUE if the tbu is in the morpheme
 *    FALSE otherwise
 */
int tbu_in_morpheme(tbp, ap)
	 struct tbu      *tbp;
	 StampAnalysis *ap;
{
  struct tbu *tbp2, *tb_last;

  if (ap == (StampAnalysis *)NULL)
	return(FALSE);

  for (tbp2 = ap->pTBUBeg, tb_last = (struct tbu *)NULL;
	   tb_last != ap->pTBUEnd &&
	   tbp2 != (struct tbu *)NULL;
	   tb_last = tbp2, tbp2 = tbp2->tbu_right)
	if (tbp == tbp2)
	  return(TRUE);

  return(FALSE);

}	/* end tbu_in_morpheme */

/****************************************************************************
 * NAME
 *    tbu_type_name
 * ARGUMENTS
 *    tbu_type - tone bearing unit type
 * DESCRIPTION
 *    get string corresponding to tone bearing unit type
 * RETURN VALUE
 *    pointer to tbu type name
 */
char *tbu_type_name(tbu_type)
	 int tbu_type;
{
  char *cp;

  switch (tbu_type)
	{
	case MORA_TBU:
	  cp = "mora";
	  break;

	case SYLLABLE_TBU:
	  cp = "syllable";
	  break;

	case VOWEL_TBU:
	  cp = "vowel";
	  break;

	default:
	  cp = "";
	}

  return( cp );

}	/* end tbu_type_name */
