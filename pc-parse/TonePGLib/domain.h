/* DOMAIN.H - Tone Parser/Synthesizer, domain defines and struct definitions
 *
 *	Andy Black
 *	25-Oct-93
 *
 ***************************************************************************
 *
 *	struct domain
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	25-Oct-93	hab - initial coding
 ***************************************************************************
 * Copyright 1993 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */

#define NO_TOKEN (-1)

/****************************************************************************
 * NAME
 *    struct domain
 * DESCRIPTION
 *    binary tree node in domain tree
 */
struct domain
	{
	  struct domain   *d_l_son;		/* left  son node */
	  struct domain   *d_r_son;		/* right son node */
	  StampAnalysis *d_l_anal;	/* analysis at left  edge of domain */
	  StampAnalysis *d_r_anal;	/* analysis at right edge of domain */
	  int              d_type;		/* domain type */
	};
