/* PWORD.C - assign word stress
 *
 *	Andy Black
 *	15-Apr-92
 *
 ***************************************************************************
 *
 *      void free_pword( wp )
 *           struct pword *wp;
 *
 *      static void disp_pword( rnp, f1p, syl )
 *           struct root_node *rnp;
 *           struct foot      *f1p;
 *           struct syllable  *syl;
 *
 *      struct syllable *pword_stress(rnp, fp_first, do_trace )
 *           struct root_node *rnp;
 *           struct foot *fp_first;
 *           int do_trace;
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	15-Apr-92	hab - initial coding
 ***************************************************************************
 * Copyright 1992 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>

#include "stamp.h"

				/* syllable.c */
extern int is_extrametrical P(( struct syllable *sp ));

				/* tone.c */
extern void free_tone_list P((struct tone_list *tlp));
extern void free_tones P((struct tone *tp));

#ifdef FEET
/* foot.c */
extern void disp_feet P(( struct root_node *rnp, struct foot *f1p, struct syllable *syl));
#endif	/* FEET */


	   void free_pword P((struct pword *pwp));
	   void init_pword P((struct pword *pwp));
#undef P

/*****************************************************************************
 * NAME
 *    free_pword
 * ARGUMENTS
 *    pwp  - pointer to a pword structure
 * DESCRIPTION
 *    free the memory allocated for the prosodic structures built
 *    for the word.
 * RETURN VALUE
 *    NONE
 */
void free_pword( pwp )
	 struct pword *pwp;
{
#ifdef FEET
  struct foot           *fp,   *fp_next;
#endif /*FEET */
  struct syllable       *sp,   *sp_next;
  struct mora           *mp;
  struct root_node_list *rnlp, *rnlp_next;
  struct root_node      *rnp,  *rnp_next;
  register int i;

  mp = (struct mora *)NULL;	/* make DJGPP compiler happy */
#ifdef FEET
			/* free foot structures */
  if (pwp->wd_ft != (struct foot *)NULL)
	for (fp = pwp->wd_ft;
	 fp != (struct foot *)NULL;
	 fp = fp_next)
	  {
	fp_next = fp->ft_right;
	freeMemory( fp );
	  }
#endif /*FEET */
			/* free syllable structures */
  if (pwp->wd_rn != (struct root_node *)NULL &&
	  pwp->wd_rn->rn_syl != (struct syllable *)NULL)
	for (sp = pwp->wd_rn->rn_syl;
	 sp != (struct syllable *)NULL;
	 sp = sp_next)
	  {
			/* free its root node list */
	if (sp->syl_rnl != (struct root_node_list *)NULL)
	  for (rnlp = sp->syl_rnl;
		   rnlp != (struct root_node_list *)NULL;
		   rnlp = rnlp_next)
		{
		  rnlp_next = rnlp->rnl_next;
		  freeMemory( rnlp );
		}
	sp_next = sp->syl_right;
	freeMemory( sp );
	  }
			/* free mora and root node structures */
  if (pwp->wd_rn != (struct root_node *)NULL)
	{
	  for (rnp = pwp->wd_rn;
	   rnp != (struct root_node *)NULL;
	   rnp = rnp_next)
	{
			/* free any moras associated with this root node */
	  for (i = 0; i < MAX_MORAS; i++)
		if ((mp = rnp->rn_mora[i]) != (struct mora *)NULL)
		  {
			/* free its root node list */
		if (mp->mora_rnl != (struct root_node_list *)NULL)
		  for (rnlp = mp->mora_rnl;
			   rnlp != (struct root_node_list *)NULL;
			   rnlp = rnlp_next)
			{
			  rnlp_next = rnlp->rnl_next;
			  freeMemory( rnlp );
			}
		freeMemory( mp );
		  }
	  rnp_next = rnp->rn_right;
	  freeMemory( rnp );
	}
	}
				/* free tone structs */
  free_tones(pwp->wd_tones);
				/* free tone tiers */
  for (i = 0; i < TIERS; i++)
	free_tone_list(pwp->wd_tier[i]);

}	/* end free_pword */

/****************************************************************************
 * NAME
 *    init_pword
 * ARGUMENTS
 *    pwp - pointer to pword struct
 * DESCRIPTION
 *    Initialize a pword struct
 * RETURN VALUE
 *    NONE
 */
void init_pword( pwp )
	 struct pword *pwp;
{
  int i;

  pwp->wd_rn         = (struct root_node *)NULL;
  pwp->wd_syl        = (struct syllable  *)NULL;
  pwp->wd_ft         = (struct foot      *)NULL;
  pwp->wd_stress_ft  = (struct foot      *)NULL;
  pwp->wd_stress_syl = (struct syllable  *)NULL;
  pwp->wd_tbu        = (struct tbu       *)NULL;
  pwp->wd_tones      = (struct tone      *)NULL;
  for (i = 0; i < TIERS; i++)
	pwp->wd_tier[i]  = (struct tone_list *)NULL;

}	/* end init_pword */

#ifdef FEET
/****************************************************************************
 * NAME
 *    disp_pword
 * ARGUMENTS
 *    rnp - pointer to head of doubly linked list of root nodes
 *    f1p - pointer to first foot in pword
 *    syl - pointer to syllable to receive pword stress
 * DESCRIPTION
 *    Display the foot assignments in a list of root nodes and
 *	mark the syllable receiving the pword stress
 * RETURN VALUE
 *    NONE
 */
static void disp_pword( rnp, f1p, syl )
	 struct root_node *rnp;
	 struct foot      *f1p;
	 struct syllable  *syl;
{
					/* shouldn't happen, but ... */
  if (rnp == (struct root_node *)NULL)
	printf("\nPword Parse: there are no root nodes.\n");
  else
	{
	  printf("\n   Pword Parse:      ");
	  disp_feet(rnp, f1p, syl);
	}

}	/* end disp_pword */

/****************************************************************************
 * NAME
 *    pword_stress
 * ARGUMENTS
 *    rnp      - pointer to head of list of root nodes
 *    fp_first - pointer to head of list of foot structures
 *    do_trace - tracing flag
 * DESCRIPTION
 *    determine the syllable bearing the pword (main) stress
 * RETURN VALUE
 *    pointer to syllable bearing word stress
 */
struct syllable *pword_stress(rnp, fp_first, do_trace )
	 struct root_node *rnp;
	 struct foot *fp_first;
	 int do_trace;
{
  struct foot *fp_next_last, *fp_last;
  struct syllable *stressed_syl, *sp1, *sp2;

					/* shouldn't happen, but ... */
  if (fp_first == (struct foot *)NULL)
	return((struct syllable *)NULL);

	/******** Following is for Asheninca del Pichis ********/
			/* initialize */
  fp_next_last = fp_last = fp_first;

					/* find last two feet */
					/* (colon) */
  while (fp_last->ft_right != (struct foot *)NULL)
	{
	  fp_next_last = fp_last;
	  fp_last = fp_last->ft_right;
	}
					/* only one foot, so use it */
  if (fp_next_last == fp_last)
	{
	  if ((fp_last->ft_syl_left != (struct syllable *)NULL) &&
	  (fp_last->ft_syl_left->syl_pr != UNSTRESSED))
	stressed_syl = fp_last->ft_syl_left;
	  else
	stressed_syl = fp_last->ft_syl_right;
	}
  else
	{
				/* locate final syllables with prominence */
	  if ((fp_last->ft_syl_left != (struct syllable *)NULL) &&
	  (fp_last->ft_syl_left->syl_pr != UNSTRESSED))
	sp2 = fp_last->ft_syl_left;
	  else if ((fp_last->ft_syl_right != (struct syllable *)NULL) &&
	  (fp_last->ft_syl_right->syl_pr != UNSTRESSED))
	sp2 = fp_last->ft_syl_right;
	  else
	sp2 = (struct syllable *)NULL;

	  if ((fp_next_last->ft_syl_left != (struct syllable *)NULL) &&
	  (fp_next_last->ft_syl_left->syl_pr != UNSTRESSED))
	sp1 = fp_next_last->ft_syl_left;
	  else if ((fp_next_last->ft_syl_right != (struct syllable *)NULL) &&
	  (fp_next_last->ft_syl_right->syl_pr != UNSTRESSED))
	sp1 = fp_next_last->ft_syl_right;
	  else
	sp1 = (struct syllable *)NULL;

				/* project temp prominence and assign
				   main word stress to larger */
	  if (main_prom(sp1) > main_prom(sp2))
	{
	  stressed_syl = sp1;
	  if (Adjust_Final && sp2 != (struct syllable *)NULL)
		sp2->syl_pr = UNSTRESSED;
	}
	  else
	stressed_syl = sp2;
	}

  stressed_syl->syl_pr = WORD_STRESS;

  if ((do_trace & TRACE_PROM) && pStamp_in->pLogFP)
	{
	  printf("\nFinal Prominence:      ");
	  disp_prom_assign( rnp, WORD_STRESS);
	}

  if (Do_Post_Main)
	{
	  x_shift(rnp, do_trace);
	  clash_lh(rnp, do_trace);

	  if ((do_trace & TRACE_PROM) && pStamp_in->pLogFP)
	{
	  printf("\nFinal Prominence Adjust:");
	  disp_prom_assign( rnp, WORD_STRESS);
	}
	}


#ifdef APURUCAYALI
	/******** Following is for Asheninca del Apurucayali ********/
			/* initialize */
  fp_next_last = fp_last = fp_first;

					/* find last two feet */
					/* (colon) */
  while (fp_last->ft_right != (struct foot *)NULL)
	{
	  fp_next_last = fp_last;
	  fp_last = fp_last->ft_right;
	}
				/* main stress falls on rightmost, */
				/* heaviest syllable in last two feet */

					/* only one foot, so use it */
  if (fp_next_last == fp_last)
	stressed_syl = fp_last->ft_syl_right;

  else if (fp_next_last->ft_syl_right->syl_wt == LIGHT)
	{
	  if (fp_last->ft_syl_left  == (struct syllable *)NULL &&
	  fp_last->ft_syl_right->syl_wt == LIGHT)
						/* (L L) (L) case */
	stressed_syl = fp_next_last->ft_syl_right;
	  else					/* other (L L) (*) cases */
	stressed_syl = fp_last->ft_syl_right;
	}

  else if (fp_last->ft_syl_right->syl_wt == HEAVY)
						/* (*) (L H), (*) (H) cases */
	stressed_syl = fp_last->ft_syl_right;

  else
						/* (L H) (*), (H) (*) cases */
	stressed_syl = fp_next_last->ft_syl_right;

#endif /* APURUCAYALI*/

  if ((do_trace & TRACE_WORD) && pStamp_in->pLogFP)
	disp_pword(rnp, fp_first, stressed_syl);

  return(stressed_syl);

} /* end pword_stress */
#endif /*FEET */
