/* DOMAIN.C - Domain Structure Routines
 *
 *			Needs to be re-worked for general case;
 *			The domain grammar could be parsed in a more
 *			  general way
 *
 *	Andy Black
 *	26-Oct-93
 *
 ***************************************************************************
 *
 *      void print_banner()
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	26-Oct-93	hab - initial coding
 ***************************************************************************
 * Copyright 1993 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include "stamp.h"
#include "tonepars.h"
#include "domain.h"

/********************* STANDARD LIBRARY FUNCTIONS *********************/

			/* tone.c */
extern int   find_tone_domain P((char *cp));
extern char *tone_domain_name P((int td));


/******************************* LOCAL PROTOTYPES ********************/
static struct domain *allo_domain P((int type));
	   struct domain *build_domains P((StampAnalysis *ap_head,
					   char *origword,
					   int               do_trace));
static void disp_domain_tree P((struct domain *dp));
	   struct domain *find_domain P((struct domain *dp, char *dname));
	   void free_domains P((struct domain *dp));
static struct domain *get_DerivedNoun_domain P((char             *origword,
						int               do_trace));
static struct domain *get_DerNoun1_domain P((char             *origword,
						 int               do_trace));
static int get_domain_token P(());
static struct domain *get_InflStem_domain P((char             *origword,
						 int               do_trace));
static struct domain *get_InflWord_domain P((char             *origword,
						 int               do_trace));
static struct domain *get_NominalWord_domain P((char             *origword,
						int               do_trace));
static struct domain *get_NounWord_domain P((char             *origword,
						 int               do_trace));
static struct domain *get_Stem_domain P((char             *origword,
					 int               do_trace));
static struct domain *get_VerbalWord_domain P((char             *origword,
						   int               do_trace));
#ifdef LATER
static struct domain *get_Word_domain P((char             *origword,
					 int               do_trace));
#endif /* LATER */
static struct domain *make_terminal_domain P((StampAnalysis *ap,
						  int              tok));
	   int parseDomainType P((char *			pszLine_in,
				  unsigned		uiDictEntry_in,
				  const char *		pszRecordKey_in,
				  const char *		pszErrorHeader_in,
				  FILE *			pLogFP_in));
	   int tone_is_in_domain P((struct tone *tp, int tbu_type,
				struct domain *dp_head, char *dname));

#undef P

extern char *dicterrhead;       /* header for dictionary error messages */


static StampAnalysis *ap;

/****************************************************************************
 * NAME
 *    allo_domain
 * ARGUMENTS
 *    type - domain type
 * DESCRIPTION
 *    allocate and initialize a domain struct
 * RETURN VALUE
 *    pointer to the domain struct
 */
static struct domain *allo_domain( type )
	 int type;
{
  struct domain *dp;

  dp = structalloc( domain );
#ifdef MEM_DEBUG
  printf(" allo_domain");
#endif	/* MEM_DEBUG */
  dp->d_l_son = (struct domain *)NULL;
  dp->d_r_son = (struct domain *)NULL;
  dp->d_l_anal = (StampAnalysis *)NULL;
  dp->d_r_anal = (StampAnalysis *)NULL;
  dp->d_type    = type;

  return( dp );

}	/* end allo_domain */

/****************************************************************************
 * NAME
 *    build_domains
 * ARGUMENTS
 *    ap_head  - pointer to analysis struct
 *    origword - original word (used for error reporting)
 *    do_trace - tracing flag
 * DESCRIPTION
 *    build word domain struct (tree) based on list of morphemes in
 *       analysis struct
 * RETURN VALUE
 *    pointer to head of the tree
 */
struct domain *build_domains(ap_head, origword, do_trace)
	 StampAnalysis *ap_head;
	 char            *origword;
	 int              do_trace;
{
  struct domain *dp;

#ifdef LATER
  ap = ap_head;

  if ((dp = get_Word_domain(origword, do_trace)) == (struct domain *)NULL)
	{
	  printf("\nBuild_Domain: could not build word domain for %s", origword);
	}

  if (ap != (StampAnalysis *)NULL)
	{
	  printf("\nBuild_Domain: did not parse to end of word for %s", origword);
	  printf("\n              last morpheme parsed was %s", ap->m.pszMorphname);
	}

  if ((do_trace & TRACE_DOMAINS) && pStamp_in->pLogFP)
	disp_domain_tree(dp);
#else
  dp = (struct domain *)NULL;
#endif

  return( dp );

}	/* end build_domains */

/***************************************************************************
 * NAME
 *    disp_domain_tree
 * ARGUMENTS
 *    dp - pointer to a domain node in the domain tree
 * DESCRIPTION
 *    Traverse the tree structure in postorder fashion,
 *    displaying node information
 *    This function is highly recursive.
 * RETURN VALUE
 *    NONE
 */
static void disp_domain_tree( dp )
	 struct domain *dp;
{

  if (dp == (struct domain *)NULL)
	return;

  disp_domain_tree( dp->d_l_son );	/* do all left  sons */
  disp_domain_tree( dp->d_r_son );	/* do all right sons */
				/* display this node */
  printf("\n\tDomain Node = %ld; type is %s:", (long) dp,
										 tone_domain_name(dp->d_type));
  printf("\n\t                 Left  son   = %ld", (long) dp->d_l_son);
  printf("\n\t                 Right son   = %ld", (long) dp->d_r_son);
  if (dp->d_l_anal != (StampAnalysis *)NULL)
	printf("\n\t                 Left  morph = %s",dp->d_l_anal->m.pszMorphname);
  if (dp->d_r_anal != (StampAnalysis *)NULL)
	printf("\n\t                 Right morph = %s",dp->d_r_anal->m.pszMorphname);

}	/* end disp_domain */

/***************************************************************************
 * NAME
 *    find_domain
 * ARGUMENTS
 *    dp - pointer to a domain node in the domain tree
 *    dname - name of domain to find
 * DESCRIPTION
 *    Traverse the tree structure in postorder fashion,
 *    looking for the particular domain name.
 *    This function is highly recursive.
 * RETURN VALUE
 *    pointer to the highest node in the domain tree with the name
 */
struct domain *find_domain( dp, dname )
	 struct domain *dp;
	 char          *dname;
{
  struct domain *dp1;

  if (dp == (struct domain *)NULL)
	return ((struct domain *)NULL);

				/* found the domain (assume is highest) */
  if (streq(dname, tone_domain_name(dp->d_type)))
	return(dp);
				/* look leftward */
  if ((dp1 = find_domain( dp->d_l_son, dname )) != (struct domain *)NULL)
	return(dp1);
				/* look rightward */
  if ((dp1 = find_domain( dp->d_r_son, dname )) != (struct domain *)NULL)
	return(dp1);
				/* not found below this node */
  return( (struct domain *)NULL);

}	/* end find_domain */

/***************************************************************************
 * NAME
 *    free_domains
 * ARGUMENTS
 *    dp - pointer to a domain node in the domain tree
 * DESCRIPTION
 *    Traverse the tree structure in postorder fashion,
 *    freeing domain structs.
 *    This function is highly recursive.
 * RETURN VALUE
 *    NONE
 */
void free_domains( dp )
	 struct domain *dp;
{

  if (dp == (struct domain *)NULL)
	return;

  free_domains( dp->d_l_son );
  free_domains( dp->d_r_son );
  freeMemory( (char *)dp );

}	/* end free_domains */

/****************************************************************************
 * NAME
 *    get_DerivedNoun_domain
 * ARGUMENTS
 *    origword - original word (used for error reporting)
 *    do_trace - tracing flag
 * DESCRIPTION
 *    get a DerivedNoun domain: build domain struct (tree) for a
 *            DerivedNoun
 * RETURN VALUE
 *    pointer to head of the tree
 */
static struct domain *get_DerivedNoun_domain(origword, do_trace)
	 char             *origword;
	 int               do_trace;
{
  struct domain *dp, *dp0;
  StampAnalysis *ap1;
  int tok;

				/* DerivedNoun ::= inf DerNoun1 */

  ap1 = ap;			/* (save analysis struct) */
  if ( (tok = get_domain_token()) == find_tone_domain("inf"))
	{
				/* allocate DerivedNoun node */
	  dp = allo_domain( find_tone_domain("DerivedNoun") );
				/* allocate word node */
	  dp0 = make_terminal_domain(ap1, tok);
				/* link word node to DerivedNoun node */
	  dp->d_l_son = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
				/* look for DerNoun1 domain */
	  dp->d_r_son = get_DerNoun1_domain(origword, do_trace);
				/* set right morpheme boundary */
	  if (dp->d_r_son != (struct domain *)NULL)
	dp->d_r_anal = dp->d_r_son->d_r_anal;
	  else
	dp->d_r_anal = dp0->d_r_anal;
	}
  else
	{
				/* restore pointer to analysis struct */
	  ap = ap1;
				/* no DerivedNoun node made */
	  dp = (struct domain *)NULL;
	}

  return(dp);

}	/* end get_DerivedNoun_domain */

/****************************************************************************
 * NAME
 *    get_DerNoun1_domain
 * ARGUMENTS
 *    origword - original word (used for error reporting)
 *    do_trace - tracing flag
 * DESCRIPTION
 *    get a DerNoun1 domain: build domain struct (tree) for a
 *            DerNoun1
 * RETURN VALUE
 *    pointer to head of the tree
 */
static struct domain *get_DerNoun1_domain(origword, do_trace)
	 char             *origword;
	 int               do_trace;
{
  struct domain *dp, *dp0;
  StampAnalysis *ap1;

				/* DerNoun1 ::= InflStem VerbalWord */

  ap1 = ap;			/* (save analysis struct) */
  if ((dp0 = get_InflStem_domain(origword, do_trace)) !=
													(struct domain *)NULL)
	{
				/* allocate DerNoun1 domain */
	  dp = allo_domain( find_tone_domain("DerNoun1") );
				/* set values */
	  dp->d_l_son  = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
	  dp->d_r_son  = get_VerbalWord_domain(origword, do_trace);
	  if (dp->d_r_son != (struct domain *)NULL)
	dp->d_r_anal = dp->d_r_son->d_r_anal;
	  else
	dp->d_r_anal = dp0->d_r_anal;
	}
  else
	{
				/* DerNoun1 ::= VerbalWord */
	  ap = ap1;
	  if ((dp0 = get_VerbalWord_domain(origword, do_trace)) !=
	  (struct domain *)NULL)
	{
				/* allocate DerNoun1 domain */
	  dp = allo_domain( find_tone_domain("DerNoun1") );
	  dp->d_l_son  = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
	  dp->d_r_son  = (struct domain *)NULL;
	  dp->d_r_anal = dp->d_l_son->d_r_anal;
	}
	  else
	{
				/* restore pointer to analysis struct */
	  ap = ap1;
				/* no DerNoun1 node made */
	  dp = (struct domain *)NULL;
	}
	}

  return(dp);

}	/* end get_DerNoun1_domain */

/****************************************************************************
 * NAME
 *    get_domain_token
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    get next domain token from the list of morphemes in
 *       analysis struct
 * RETURN VALUE
 *    Value of the domain token found;
 *    NO_TOKEN otherwise
 *    SIDE-EFFECT: the ap pointer is shifted to the next element in the
 *                 analysis struct list
 */
static int get_domain_token()
{
  int type;

  if (ap == (StampAnalysis *)NULL)
	return(NO_TOKEN);

  type = ap->m.iDomain;
  ap = ap->pRightLink;
  return( type );

}	/* end get_domain_token */

/****************************************************************************
 * NAME
 *    get_InflStem_domain
 * ARGUMENTS
 *    origword - original word (used for error reporting)
 *    do_trace - tracing flag
 * DESCRIPTION
 *    get a InflStem domain: build domain struct (tree) for a
 *            InflStem
 * RETURN VALUE
 *    pointer to head of the tree
 */
static struct domain *get_InflStem_domain(origword, do_trace)
	 char             *origword;
	 int               do_trace;
{
  struct domain *dp, *dp0 = (struct domain *)NULL;
  StampAnalysis *ap1;
  int tok;
				/* InflStem ::= infl InflStem */
				/*              infl          */

  ap1 = ap;			/* (save analysis struct) */
  if ( (tok = get_domain_token()) == find_tone_domain("infl"))
	{
				/* allocate InflStem node */
	  dp = allo_domain( find_tone_domain("InflStem") );
				/* allocate infl node */
	  dp0 = make_terminal_domain(ap1, tok);
				/* link word node to InflStem node */
	  dp->d_l_son = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
				/* recursively search for another */
				/* InflStem node */
	  dp->d_r_son = get_InflStem_domain(origword, do_trace);
				/* set right morpheme boundary */
	  if (dp->d_r_son != (struct domain *)NULL)
	dp->d_r_anal = dp->d_r_son->d_r_anal;
	  else
	dp->d_r_anal = dp0->d_r_anal;
	}
  else
	{
				/* restore pointer to analysis struct */
	  ap = ap1;
				/* no InflStem node made */
	  dp = (struct domain *)NULL;
	}

  return(dp);

}	/* end get_InflStem_domain */

/****************************************************************************
 * NAME
 *    get_InflWord_domain
 * ARGUMENTS
 *    origword - original word (used for error reporting)
 *    do_trace - tracing flag
 * DESCRIPTION
 *    get a InflWord domain: build domain struct (tree) for a InflWord
 * RETURN VALUE
 *    pointer to head of the tree
 */
static struct domain *get_InflWord_domain(origword, do_trace)
	 char             *origword;
	 int               do_trace;
{
  struct domain *dp, *dp0;
  StampAnalysis *ap1;
  int tok;
				/* InflWord ::= mo InflStem */
  ap1 = ap;			/* (save analysis struct) */
  if ( (tok = get_domain_token()) == find_tone_domain("mo"))
	{
				/* allocate InflWord domain */
	  dp = allo_domain( find_tone_domain("InflWord") );

				/* allocate mo node */
	  dp0 = make_terminal_domain(ap1, tok);
				/* link mo node to InflWord node */
	  dp->d_l_son = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
	  dp->d_r_son   = get_InflStem_domain(origword, do_trace);
	  if (dp->d_r_son != (struct domain *)NULL)
	dp->d_r_anal = dp->d_r_son->d_r_anal;
	  else
	dp->d_r_anal = dp0->d_r_anal;
	}
  else
				/* InflWord ::= InflStem */
	{
	  ap = ap1;
	  if ((dp0 = get_InflStem_domain(origword, do_trace)) !=
	  (struct domain *)NULL)
	{
				/* allocate InflWord domain */
	  dp = allo_domain( find_tone_domain("InflWord") );
	  dp->d_l_son  = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
	  dp->d_r_son  = (struct domain *)NULL;
	  dp->d_r_anal = dp->d_l_son->d_r_anal;
	}
	  else
	{
	  dp = (struct domain *)NULL;
	}
	}

  return(dp);

}	/* end get_InflWord_domain */

/****************************************************************************
 * NAME
 *    get_NominalWord_domain
 * ARGUMENTS
 *    origword - original word (used for error reporting)
 *    do_trace - tracing flag
 * DESCRIPTION
 *    get a NominalWord domain: build domain struct (tree) for a NominalWord
 * RETURN VALUE
 *    pointer to head of the tree
 */
static struct domain *get_NominalWord_domain(origword, do_trace)
	 char             *origword;
	 int               do_trace;
{
  struct domain *dp, *dp0;
  StampAnalysis *ap1;
  int tok;
				/* NominalWord ::= iv NounWord */
				/*                 iv DerivedNoun */
  ap1 = ap;			/* (save analysis struct) */
  if ( (tok = get_domain_token()) == find_tone_domain("iv"))
	{
				/* allocate NominalWord domain */
	  dp = allo_domain( find_tone_domain("NominalWord") );

				/* allocate iv node */
	  dp0 = make_terminal_domain(ap1, tok);
				/* link iv node to NominalWord node */
	  dp->d_l_son  = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
	  dp->d_r_son  = get_NounWord_domain(origword, do_trace);
	  if (dp->d_r_son != (struct domain *)NULL)
	dp->d_r_anal = dp->d_r_son->d_r_anal;
	  else
	{
	  dp->d_r_son  = get_DerivedNoun_domain(origword, do_trace);
	  if (dp->d_r_son != (struct domain *)NULL)
		dp->d_r_anal = dp->d_r_son->d_r_anal;
	  else
		dp->d_r_anal = dp0->d_r_anal;
	}
	}
  else
	{
				/* restore pointer to analysis struct */
	  ap = ap1;
				/* no NounWord node made */
	  dp = (struct domain *)NULL;
	}

  return(dp);

}	/* end get_NominalWord_domain */

/****************************************************************************
 * NAME
 *    get_NounWord_domain
 * ARGUMENTS
 *    origword - original word (used for error reporting)
 *    do_trace - tracing flag
 * DESCRIPTION
 *    get a NounWord domain: build domain struct (tree) for a
 *            NounWord
 * RETURN VALUE
 *    pointer to head of the tree
 */
static struct domain *get_NounWord_domain(origword, do_trace)
	 char             *origword;
	 int               do_trace;
{
  struct domain *dp, *dp0;
  StampAnalysis *ap1;
  int tok;
				/* NounWord ::= nc Stem */

  ap1 = ap;			/* (save analysis struct) */
  if ( (tok = get_domain_token()) == find_tone_domain("nc"))
	{
				/* allocate NounWord node */
	  dp = allo_domain( find_tone_domain("NounWord") );
				/* allocate word node */
	  dp0 = make_terminal_domain(ap1, tok);
				/* link word node to NounWord node */
	  dp->d_l_son = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
				/* look for Stem domain */
	  dp->d_r_son = get_Stem_domain(origword, do_trace);
				/* set right morpheme boundary */
	  if (dp->d_r_son != (struct domain *)NULL)
	dp->d_r_anal = dp->d_r_son->d_r_anal;
	  else
	dp->d_r_anal = dp0->d_r_anal;
	}
  else
	{
				/* restore pointer to analysis struct */
	  ap = ap1;
				/* no NounWord node made */
	  dp = (struct domain *)NULL;
	}

  return(dp);

}	/* end get_NounWord_domain */

/****************************************************************************
 * NAME
 *    get_Stem_domain
 * ARGUMENTS
 *    origword - original word (used for error reporting)
 *    do_trace - tracing flag
 * DESCRIPTION
 *    get a Stem domain: build domain struct (tree) for a
 *            Stem
 * RETURN VALUE
 *    pointer to head of the tree
 */
static struct domain *get_Stem_domain(origword, do_trace)
	 char             *origword;
	 int               do_trace;
{
  struct domain *dp, *dp0;
  StampAnalysis *ap1;
  int tok;
				/* Stem ::= stem Stem */
				/*          stem      */

  ap1 = ap;			/* (save analysis struct) */
  if ( (tok = get_domain_token()) == find_tone_domain("stem"))
	{
				/* allocate Stem node */
	  dp = allo_domain( find_tone_domain("Stem") );
				/* allocate stem node */
	  dp0 = make_terminal_domain(ap1, tok);
				/* link word node to Stem node */
	  dp->d_l_son = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
				/* recursively search for another */
				/* Stem node */
	  dp->d_r_son = get_Stem_domain(origword, do_trace);
				/* set right morpheme boundary */
	  if (dp->d_r_son != (struct domain *)NULL)
	dp->d_r_anal = dp->d_r_son->d_r_anal;
	  else
	dp->d_r_anal = dp0->d_r_anal;
	}
  else
	{
				/* restore pointer to analysis struct */
	  ap = ap1;
				/* no Stem node made */
	  dp = (struct domain *)NULL;
	}

  return(dp);

}	/* end get_Stem_domain */

/****************************************************************************
 * NAME
 *    get_VerbalWord_domain
 * ARGUMENTS
 *    origword - original word (used for error reporting)
 *    do_trace - tracing flag
 * DESCRIPTION
 *    get a VerbalWord domain: build domain struct (tree) for a VerbalWord
 * RETURN VALUE
 *    pointer to head of the tree
 */
static struct domain *get_VerbalWord_domain(origword, do_trace)
	 char             *origword;
	 int               do_trace;
{
  struct domain *dp, *dp0;
  StampAnalysis *ap1;
  int tok;
				/* VerbalWord ::= om Stem */
  ap1 = ap;			/* (save analysis struct) */
  if ( (tok = get_domain_token()) == find_tone_domain("om"))
	{
				/* allocate VerbalWord domain */
	  dp = allo_domain( find_tone_domain("VerbalWord") );

				/* allocate mo node */
	  dp0 = make_terminal_domain(ap1, tok);
				/* link mo node to VerbalWord node */
	  dp->d_l_son = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
	  dp->d_r_son   = get_Stem_domain(origword, do_trace);
	  if (dp->d_r_son != (struct domain *)NULL)
	dp->d_r_anal = dp->d_r_son->d_r_anal;
	  else
	dp->d_r_anal = dp0->d_r_anal;
	}
  else
				/* VerbalWord ::= Stem */
	{
	  ap = ap1;
	  if ((dp0 = get_Stem_domain(origword, do_trace)) !=
											   (struct domain *)NULL)
	{
				/* allocate VerbalWord domain */
	  dp = allo_domain( find_tone_domain("VerbalWord") );
	  dp->d_l_son  = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
	  dp->d_r_son  = (struct domain *)NULL;
	  dp->d_r_anal = dp->d_l_son->d_r_anal;
	}
	  else
	{
	  dp = (struct domain *)NULL;
	}
	}

  return(dp);

}	/* end get_VerbalWord_domain */

#ifdef LATER
/****************************************************************************
 * NAME
 *    get_Word_domain
 * ARGUMENTS
 *    origword - original word (used for error reporting)
 *    do_trace - tracing flag
 * DESCRIPTION
 *    get a word domain: build domain struct (tree) for a word
 * RETURN VALUE
 *    pointer to head of the tree
 */
static struct domain *get_Word_domain(origword, do_trace)
	 char             *origword;
	 int               do_trace;
{
  struct domain *dp, *dp0;
				/* Word ::= InflWord VerbalWord */

  if ((dp0 = get_InflWord_domain(origword, do_trace)) !=
													(struct domain *)NULL)
	{
				/* allocate Word domain */
	  dp = allo_domain( find_tone_domain("Word") );
				/* set values */
	  dp->d_l_son  = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
	  dp->d_r_son  = get_VerbalWord_domain(origword, do_trace);
	  if (dp->d_r_son != (struct domain *)NULL)
	dp->d_r_anal = dp->d_r_son->d_r_anal;
	  else
	dp->d_r_anal = dp0->d_r_anal;
	}
  else
				/* Word ::= NominalWord */
	{
	  if ((dp0 = get_NominalWord_domain(origword, do_trace)) !=
	  (struct domain *)NULL)
	{
				/* allocate Word domain */
	  dp = allo_domain( find_tone_domain("Word") );
	  dp->d_l_son  = dp0;
	  dp->d_l_anal = dp0->d_l_anal;
	  dp->d_r_son  = (struct domain *)NULL;
	  dp->d_r_anal = dp->d_l_son->d_r_anal;
	}
				/* Word ::= Stem */
	  else
	{
	  if ((dp0 = get_Stem_domain(origword, do_trace)) !=
		  (struct domain *)NULL)
		{
				/* allocate Word domain */
		  dp = allo_domain( find_tone_domain("Word") );
		  dp->d_l_son  = dp0;
		  dp->d_l_anal = dp0->d_l_anal;
		  dp->d_r_son  = (struct domain *)NULL;
		  dp->d_r_anal = dp->d_l_son->d_r_anal;
		}
	  else
		{
		  dp = (struct domain *)NULL;
		}
	}
	}

  return(dp);

}	/* end get_Word_domain */
#endif /* LATER */

/****************************************************************************
 * NAME
 *    make_terminal_domain
 * ARGUMENTS
 *    ap  - pointer to an analysis struct
 *    tok - domain type (token)
 * DESCRIPTION
 *    create a terminal (leaf) domain node in the tree
 * RETURN VALUE
 *    pointer to the terminal node
 */
static struct domain *make_terminal_domain(ap, tok)
	 StampAnalysis *ap;
	 int              tok;
{
  struct domain *dp;

				/* allocate and initialize a domain struct */
  dp = allo_domain(tok);
				/* set morpheme pointers if possible */
  if (ap != (StampAnalysis *)NULL)
	dp->d_l_anal = dp->d_r_anal = ap;

  return(dp);

}	/* end make_terminal_domain */

/****************************************************************************
 * NAME
 *    parseDomainType
 * DESCRIPTION
 *    determine domain type
 * RETURN VALUE
 *    domain type value
 */
int parseDomainType(pszLine_in, uiDictEntry_in, pszRecordKey_in,
			pszErrorHeader_in, pLogFP_in)
char *			pszLine_in;		/* line to parse */
unsigned		uiDictEntry_in;		/* dictionary entry number */
const char *		pszRecordKey_in;	/* key of entry */
const char *		pszErrorHeader_in;
FILE *			pLogFP_in;
{
  int iDomainType;
				/* look for <type> */
  if (!(iDomainType = find_tone_domain(pszLine_in)))
	  {
	fprintf(pLogFP_in,"%sUndefined domain type %s in entry %s\n",
		pszErrorHeader_in, pszLine_in,
		getAmpleRecordIDTag(pszRecordKey_in, uiDictEntry_in));
	  }

  return(iDomainType);

}	/* set_domain */

/****************************************************************************
 * NAME
 *    tone_is_in_domain
 * ARGUMENTS
 *    tp      - pointer to tone
 *    tbu_type - type of tone bearing unit used
 *    dp_head - pointer to head of domain struct
 *    dname   - name of the domain
 * DESCRIPTION
 *    determine if the tone is in the indicated domain
 * RETURN VALUE
 *    TRUE  if tone is in the domain
 *    FALSE otherwise
 */
int tone_is_in_domain(tp, tbu_type, dp_head, dname)
	 struct tone   *tp;
	 int            tbu_type;
	 struct domain *dp_head;
	 char *dname;
{
  struct domain *dp;
  struct root_node *rnp;
  struct tone_list *tlp;
				/* find domain */
  dp = find_domain(dp_head, dname);

  if (dp != (struct domain *)NULL)
					/* see if tone is in the domain */
	{				/* for each analysis struct in domain */
	  for (ap = dp->d_l_anal;
	   ap != (StampAnalysis *)NULL && ap->pLeftLink != dp->d_r_anal;
	   ap = ap->pRightLink)
	{			/* check each root_node in the analysis */
	  for (rnp = ap->pRNBeg;
		   rnp != (struct root_node *)NULL && rnp->rn_left != ap->pRNEnd;
		   rnp = rnp->rn_right)
		{
				/* look for tbu which has the tone (if any) */
		  switch (tbu_type)
		{
		default:
		case MORA_TBU:
		  if (rnp->rn_mora[0] != (struct mora *)NULL  &&
			  rnp->rn_mora[0]->mora_tbu != (struct tbu *)NULL)
			for (tlp = rnp->rn_mora[0]->mora_tbu->tbu_tonel;
			 tlp != (struct tone_list *)NULL;
			 tlp = tlp->tonl_right)
			  if (tlp->tonl_tone == tp)
			return(TRUE);
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
	}
				/* tone not found in the domain */
  return(FALSE);

}	/* tone_is_in_domain */
