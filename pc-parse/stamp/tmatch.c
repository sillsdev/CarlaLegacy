/* TMATCH.C - functions for dealing with match strings in transfer
 ***************************************************************************
 *
 * StampChangeMorphList * parseStampTransferMatch(char *      str,
 *						  int         isrule,
 *						  char *      errhead,
 *						  StampData * pStamp_in)
 *
 * StampAnalysis * checkStampTransferMatch(StampAnalysis *        analp,
 *					   StampChangeMorphList * matchp)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include "stamp.h"

static StampChangeMorphList *	new_chg_node P((unsigned type,
						VOIDP    name,
						int *    pbBoundary_io));
/*
 *  Globals for new_chg_node()
 */
static StampChangeMorphList *	pHead_m;
static StampChangeMorphList *	pLast_m;

static const char szWhitespace_m[7] = " \t\r\n\f\v";

/*************************************************************************
 * NAME
 *    parseStampTransferMatch
 * DESCRIPTION
 *    Parse a match string, creating a list of chg_morph struct's to
 *    represent it internally.
 * RETURN VALUE
 *    pointer to the newly created list of chg_morph struct's, or NULL if
 *    an error occurred
 */
StampChangeMorphList * parseStampTransferMatch(str, isrule, errhead, pStamp_in)
char *	     str;		/* string containing a match pattern for
				 * lexical changes or transfer rules */
int	     isrule;		/* nonzero for transfer substitution rule,
				 * zero for lexical change */
const char * errhead;
StampData *  pStamp_in;
{
register char *p;
char token[BUFSIZE];
char special[8];        /* 1.5 BJY */
StampChangeMorphList *cp;
AmpleCategoryClass *ccl;
AmpleMorphClass *mcl;
int cat;
int last_was_cat;
int	bBoundary;
/*
 *  check that we have something to do
 */
if ((str == NULL) || (*(str += strspn(str, szWhitespace_m)) == NUL))
	return( NULL );

/*
 *  initialize some other variables, including the special tokens string
 */
pHead_m = NULL;
pLast_m = NULL;
p   = str;
cat = 0;
mcl = NULL;
ccl = NULL;
cp  = NULL;
last_was_cat = FALSE;
bBoundary    = FALSE;
special[0] = '[';
special[1] = ']';
special[2] = '{';       /* 1.5 BJY Allow curly braces also */
special[3] = '}';
special[4] = pStamp_in->cBeginRoot;
special[5] = pStamp_in->cEndRoot;
special[6] = NUL;
/*
 *  scan across the lexical change match string
 */
do  {
	/*
	 *  get the next token from the input string
	 */
	p = getNextStampToken(p,token,special);
	if ( *token == pStamp_in->cBeginRoot || *token == pStamp_in->cEndRoot )
		{					/* If boundary */
		if ( pLast_m && pLast_m->iMorphType != 0 ) /* If something before */
			pLast_m->iMorphType |= LASTMORPH; /* Tag as last before boundary */
		bBoundary = TRUE;       /* Signal next first after bound */
		}
	else if ( *token == '[' )           /* Else if a morpheme class */
		{
		p = getNextStampToken(p,token,special); /* Get next token */
	/* check for morpheme class first  1.5 BJY */
	mcl = findAmpleMorphClass(token, pStamp_in->pMorphClasses);
		if (mcl != NULL)
			{
			if ( last_was_cat )     /* If node exists, just fill it in */
				{
				cp = pLast_m;
				last_was_cat = FALSE;   /* Clear last was cat */
				}
			else
				cp = new_chg_node(MORPHTYPE_MASK,
				  (VOIDP)duplicateString(token),
				  &bBoundary);
			cp->iMorphType |= MORPHCLASS;
			cp->uMorph.pClass = mcl;     /* Store class */
			}
		else if ((ccl = findAmpleCategClass(token,
						pStamp_in->pCategClasses)) != NULL)
			{
			cp = new_chg_node( MORPHTYPE_MASK, NULL, &bBoundary );
			cp->iMorphType |= CATCLASS;
			cp->uCat.pClass = ccl;       /* Store class */
			last_was_cat = TRUE;
			}
		else if ((cat = findAmpleCategoryNumber(token,
						pStamp_in->pCategories)) != 0)
			{					/* Else if a category */
			cp = new_chg_node( MORPHTYPE_MASK, NULL, &bBoundary );
			cp->uCat.iCode = cat;        /* Store category */
			}
		else
			{
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			"%sUnknown class [%s] in match string\n        %s\n",
			errhead, token, str);
			goto bad_parse;
			}
		p = getNextStampToken(p,token,special);    /* Get next token */
		if ( *token != ']' )
			{
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			"%sMissing ']' in match string\n        %s\n",
			errhead, str);
			goto bad_parse;
			}
		}
	else if ( *token == '{' )	/* Check for ccl, cat then mcl  1.5 BJY */
		{
		p = getNextStampToken(p,token,special); /* Get next token */
										/* If cat class */
		if ( (ccl = findAmpleCategClass(token,
					pStamp_in->pCategClasses) ) != NULL )
			{
			cp = new_chg_node( MORPHTYPE_MASK, NULL, &bBoundary );
			cp->iMorphType |= CATCLASS;
			cp->uCat.pClass = ccl;       /* Store class */
			last_was_cat = TRUE;
			}
		else if ((cat = findAmpleCategoryNumber(token,
						pStamp_in->pCategories)) != 0)
			{					/* Else if a category */
			cp = new_chg_node( MORPHTYPE_MASK, NULL, &bBoundary );
			cp->uCat.iCode = cat;        /* Store category */
			}
		else if ((mcl = findAmpleMorphClass(token,
						pStamp_in->pMorphClasses)) != NULL)
			{
			if ( last_was_cat )     /* If node exists, just fill it in */
				{
				cp = pLast_m;
				last_was_cat = FALSE;   /* Clear last was cat */
				}
			else
				cp = new_chg_node(MORPHTYPE_MASK,
				  (VOIDP)duplicateString(token),
				  &bBoundary);
			cp->iMorphType |= MORPHCLASS;
			cp->uMorph.pClass = mcl;     /* Store class */
			}
		else
			{
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			"%sUnknown class [%s] in match string\n        %s\n",
			errhead, token, str);
			goto bad_parse;
			}
		p = getNextStampToken(p,token,special);    /* Get next token */
		if ( *token != '}' )        /* Must close with '}' */
			{
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			"%sMissing '}' in match string\n        %s\n",
			errhead, str);
			goto bad_parse;
			}
		}
	else if ((cat = findAmpleCategoryNumber(token,
						pStamp_in->pCategories)) != 0)
		{					/* Else if a category */
		cp = new_chg_node( MORPHTYPE_MASK, NULL, &bBoundary );
		cp->uCat.iCode = cat;        /* Store category */
		last_was_cat = TRUE;
		}
	else                                /* Else (a morphname) */
		{
		if ( last_was_cat )             /* If node exists, just fill in */
			{
			cp = pLast_m;
			last_was_cat = FALSE;   /* Clear last was cat */
			cp->uMorph.pszName = duplicateString(token);
			}
		else
			cp = new_chg_node(MORPHTYPE_MASK,
				  (VOIDP)duplicateString(token),
				  &bBoundary);
		}

	} while (p && *p);          /* parse to the end of the input */

return( pHead_m );                 /* we've done it! */

bad_parse:                      /* common error exit point */
freeStampChangeMorphList( pHead_m );
return( NULL );
}


/*************************************************************************
 * NAME
 *    new_chg_node
 * ARGUMENTS
 *    type - morph type byte
 *    name - pointer to morphname string, or morph_class list
 *    pbBoundary_io - TRUE if boundary was seen
 *
 * GLOBALS (because this is a utility to save duplicating code)
 *    last - Previous node, set to the new one in here
 *    head - First node, set to the new one here if this is first
 * DESCRIPTION
 *    Make a new change node, and link it in.
 * RETURN VALUE
 *    pointer to new node
 */
static StampChangeMorphList *new_chg_node(type, name, pbBoundary_io)
unsigned	type;
VOIDP		name;
int *		pbBoundary_io;
{
StampChangeMorphList *	cp;
								/* Set up a node */
cp = newStampChangeMorph( type, name );
cp->iPos = 0;

if (pbBoundary_io && *pbBoundary_io)	/* If boundary just seen */
	{
	cp->iMorphType |= FIRSTMORPH;	/* Set boundary */
	*pbBoundary_io = FALSE;		/* Clear boundary */
	}
/*
 *  link the new node into the list
 */
if (pHead_m == NULL) /* If first one seen */
	pHead_m = cp;                      /* Point head to this */
else
	pLast_m->pNext = cp;            /* Else point last to this */
pLast_m = cp;                      /* Remember this as last */
return(cp);
}

/*************************************************************************
 * NAME
 *    checkStampTransferMatch
 * DESCRIPTION
 *    Check whether the match list matches up with the analysis list.
 * RETURN VALUE
 *    pointer to last morpheme matched if match succeeds, NULL otherwise
 */
StampAnalysis * checkStampTransferMatch( analp, matchp )
StampAnalysis *		analp;		/* analysis list to check */
StampChangeMorphList *	matchp;		/* match list of morphs */
{
StampAnalysis *ap, *lastp = NULL;
StampChangeMorphList *mp;
/*
 *  handle null arguments
 */
if (!analp || !matchp)
	return( NULL );         /* empty lists don't match */
pHead_m = NULL;
pLast_m = NULL;
/*
 *  for each morpheme in the analysis, and each morph in the match list
 */
for (ap = analp, mp = matchp ; mp && ap ; mp = mp->pNext, ap = ap->pRightLink)
	{
	lastp = ap;                         /* save for return */

	if (mp->uMorph.pszName == NULL)             /* if category only */
		{
		if (mp->iMorphType & CATCLASS)
			{
			if (!isAmpleCategClassMember((int)ap->m.iToCategory,
					 mp->uCat.pClass))
				return( NULL );     /* not in category class */
			}
		else if (mp->uCat.iCode && (mp->uCat.iCode != ap->m.iToCategory))
			return( NULL );         /* category doesn't match */
		}
	else if (mp->iMorphType & MORPHCLASS)
		{
		if (!isAmpleMorphClassMember(ap->m.pszMorphname, mp->uMorph.pClass))
			return( NULL );         /* not in morpheme class */
		}
	else if (strcmp(ap->m.pszMorphname,mp->uMorph.pszName))
		return( NULL );             /* morphnames aren't the same */

	if ( (mp->iMorphType & FIRSTMORPH) && ap->pLeftLink &&
				(ap->pLeftLink->m.iMorphType == ap->m.iMorphType) )
		return( NULL );   /* not different across left boundary */

	if ( (mp->iMorphType & LASTMORPH) && ap->pRightLink &&
				(ap->pRightLink->m.iMorphType == ap->m.iMorphType) )
		return( NULL );     /* not different across right boundary */

	if (mp->iMorphType & CATCLASS)
		{
		if (!isAmpleCategClassMember((int)ap->m.iToCategory, mp->uCat.pClass))
			return( NULL );     /* not in category class */
		}
	else if (mp->uCat.iCode && (mp->uCat.iCode != ap->m.iToCategory))
		return( NULL );         /* category doesn't match */

	} /* end for morph in the match list */

if (mp)
	return( NULL );
else
	return( lastp );
}
