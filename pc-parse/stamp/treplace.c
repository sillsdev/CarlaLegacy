/*      TREPLACE.C - functions for dealing with replace strings in transfer
 ***************************************************************************
 *
 * StampChangeMorphList * parseStampTransferReplace(char * str,
 *                                                  int    isrule)
 *
 * StampAnalysis * replaceStampMorphemes(StampAnalysis **       p_head,
 *                                       StampAnalysis *        first,
 *                                       StampAnalysis *        last,
 *                                       StampChangeMorphList * replace,
 *                                       StampData *            pStamp_in)
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
/*
 *  Global for new_rep_node()
 */
static StampChangeMorphList *	pHead_m;
static StampChangeMorphList *	pLast_m;
static StampChangeMorphList *	pWordBound_m;

static StampChangeMorphList * new_rep_node P((unsigned type,
						  void *   name));

static const char szWhitespace_m[7] = " \t\r\n\f\v";

/*************************************************************************
 * NAME
 *    parseStampTransferReplace
 * ARGUMENTS
 *    str    - string containing a replacement
 *    isrule - nonzero for substitution rules, zero for lexical changes
 *    matchlist - corresponding match, for identifying variables
 * DESCRIPTION
 *    Parse a replace string for a lexical change or substitution rule,
 *    creating the data structure representing it internally.
 * RETURN VALUE
 *    pointer to the newly created list of chg_morph struct's, or NULL if
 *    an error occurred
 */
StampChangeMorphList * parseStampTransferReplace(str, isrule, matchlist,
						 errhead, pStamp_in)
char *str;
int isrule;
StampChangeMorphList *matchlist;
const char *errhead;
StampData *	pStamp_in;
{
register char *p;
char token[BUFSIZE];
char special[8];        /* 1.5 BJY */
StampChangeMorphList *cp;
AmpleCategoryClass *ccl;
AmpleMorphClass *mcl;
int cat;
int last_was_cat;
int morph_type;
StampChangeMorphList *chp;
int i;
/*
 *  check that we have something to do
 */
if ((str == NULL) || (*(str += strspn(str, szWhitespace_m)) == NUL))
	return( NULL );

/*
 *  initialize some other variables, including the special tokens string
 */
pHead_m      = NULL;
pLast_m      = NULL;
pWordBound_m = NULL;
p = str;
cat = 0;
mcl = NULL;
ccl = NULL;
special[0] = '[';
special[1] = ']';
special[2] = '{';       /* 1.5 BJY Allow curly braces also */
special[3] = '}';
special[4] = pStamp_in->cBeginRoot;
special[5] = pStamp_in->cEndRoot;
special[6] = NUL;

cp = NULL;
last_was_cat = FALSE;
morph_type = MORPHTYPE_MASK;

/*
 *  scan across the lexical change match string
 */
do  {
	/*
	 *  get the next token from the input string
	 */
	p = getNextStampToken(p,token,special);
	if ( *token == pStamp_in->cBeginRoot )    /* If root begin boundary */
		{                           /* Tag all before in word as prefix */
		for ( cp = pWordBound_m ; cp ; cp = cp->pNext )
			if ( cp->iMorphType & MORPHTYPE_MASK ) /* If not boundary */
				{
				cp->iMorphType &= ~MORPHTYPE_MASK;   /* Clear general */
				cp->iMorphType |= PFX;               /* Tag as prefix */
				}
		morph_type = ROOT;             /* Signal next are roots */
		}
	else if ( *token == pStamp_in->cEndRoot )      /* If root end boundary */
		{                               /* Tag all non-pfx before as root */
		for ( cp = pHead_m ; cp ; cp = cp->pNext )
													/* If not prefix */
			if ( ((cp->iMorphType & MORPHTYPE_MASK) != PFX) )
				{
				cp->iMorphType &= ~MORPHTYPE_MASK;   /* Clear general */
				cp->iMorphType |= ROOT;              /* Tag as root */
				}
		morph_type = SFX;              /* Signal next are suffixes */
		}
	else if ( *token == '[' )           /* Else if a class */
		{
		p = getNextStampToken(p,token,special); /* Get next token */

			/* [] check for morpheme class first  1.5 BJY */
		if ((mcl = findAmpleMorphClass(token, pStamp_in->pMorphClasses)) != NULL)
			{
			if ( last_was_cat )     /* If node exists, just fill it in */
				{
				cp = pLast_m;
				last_was_cat = FALSE;   /* Clear last was cat */
				}
			else
				cp = new_rep_node((unsigned char)morph_type,
								  (void *)duplicateString(token));
			cp->iMorphType |= MORPHCLASS;
			cp->uMorph.pClass = mcl;     /* Store class */
			}
		else if ( (ccl = findAmpleCategClass(token,
						 pStamp_in->pCategClasses) ) != NULL )
			{
			cp = new_rep_node( ROOT, NULL );
			cp->iMorphType |= CATCLASS;
			cp->uCat.pClass = ccl;       /* Store class */
			last_was_cat = TRUE;
			}
		else if ((cat = findAmpleCategoryNumber(token,
						pStamp_in->pCategories)) != 0)
			{					/* Else if a category */
			cp = new_rep_node( ROOT, NULL );
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
		if ( *token != ']' )      /* Must close with ']' */
			{
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			"%sMissing ']' in match string\n        %s\n",
			errhead,str);
			goto bad_parse;
			}
		}
	else if ( *token == '{' )           /* Check for ccl, cat then mcl  1.5 BJY */
		{
		p = getNextStampToken(p,token,special); /* Get next token */
										/* If cat class */
		if ( (ccl = findAmpleCategClass(token,
					pStamp_in->pCategClasses) ) != NULL )
			{
			cp = new_rep_node( ROOT, NULL );
			cp->iMorphType |= CATCLASS;
			cp->uCat.pClass = ccl;       /* Store class */
			last_was_cat = TRUE;
			}
		else if ((cat = findAmpleCategoryNumber(token,
						pStamp_in->pCategories)) != 0)
			{					/* Else if a category */
			cp = new_rep_node( ROOT, NULL );
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
				cp = new_rep_node((unsigned char)morph_type,
								  (void *)duplicateString(token));
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
		if ( *token != '}' )      /* Must close with '}' */
			{
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			"%sMissing '}' in match string\n        %s\n",
			errhead,str);
			goto bad_parse;
			}
		}
	else if ((cat = findAmpleCategoryNumber(token,
						pStamp_in->pCategories)) != 0)
		{					/* Else if a category */
		cp = new_rep_node( ROOT, NULL );
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
			cp = new_rep_node((unsigned char)morph_type, (void *)duplicateString(token));
		}

	} while (p && *p);          /* parse to the end of the input */
/*
 * For each element in the replace that is unspecified, a category,
 *  or category class without a morphname, or a morpheme class,
 *  find the corresponding element in the match.
 * Also make use of the number the user may have put with the
 *  category to disambiguate references.  It is in cp->iPos.
 */
for ( cp = pHead_m ; cp ; cp = cp->pNext )    /* For each element in replace */
	{                                   /* If unspecified */
	if (    (cp->iMorphType & MORPHCLASS) ||
		(cp->uMorph.pszName == NULL) )
		{                               /* For each element in search */
		for ( i = 1, chp = matchlist ; chp ; i++, chp = chp->pNext )
			{
		/*
		 *  If morph class, if match, and right number
		 */
			if (    (chp->iMorphType & MORPHCLASS) &&
			(cp->iMorphType  & MORPHCLASS) &&
			(chp->iPos == cp->iPos)        &&
			(chp->uMorph.pClass == cp->uMorph.pClass) )
				break;
		/*
		 *  If cat class, if match, and right number
		 */
			else if ((chp->uMorph.pszName == NULL) &&
			 (chp->iMorphType & CATCLASS)  &&
			 (cp->iMorphType  & CATCLASS)  &&
			 (chp->iPos == cp->iPos)       &&
			 (chp->uCat.pClass == cp->uCat.pClass) )
				break;
		/*
		 *  Else cat:  If match and right number
		 */
			else if ((chp->uMorph.pszName == NULL) &&
			 (chp->iPos == cp->iPos)       &&
			 (chp->uCat.iCode == cp->uCat.iCode) )
				break;
			}
		if (chp != NULL)		/* If we found it in the search */
			cp->iPos = i;		/* Make note of it */
		else
			{
		if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
	   "%sCategory or class in substitution not found in search\n        %s\n",
			errhead,str);
			goto bad_parse;
			}
		}
	}
/*
 * If lexical change, only one morpheme, and undesignated, force it
 *  to output a root.  This prevents problems when a prefix
 *  and root are changed to a single root.
 */
if ( !isrule && !pHead_m->pNext
		&& ( (pHead_m->iMorphType & MORPHTYPE_MASK) == MORPHTYPE_MASK ) )
	{
	pHead_m->iMorphType &= ~MORPHTYPE_MASK; /* Clear general type */
	pHead_m->iMorphType |= ROOT;            /* Set type to ROOT */
	}

return( pHead_m );                 /* we've done it! */

bad_parse:                      /* common error exit point */
freeStampChangeMorphList( pHead_m );
return( NULL );
}

/*************************************************************************
 * NAME
 *    new_rep_node
 * ARGUMENTS
 *    type - morph type byte
 *    name - pointer to morphname string, or morph_class list
 *
 * GLOBALS (because this is a utility to save duplicating code)
 *    last - Previous node, set to the new one in here
 *    head - First node, set to the new one here if this is first
 * DESCRIPTION
 *    Make a new change node, and link it in.
 * RETURN VALUE
 *    pointer to new node
 */
static StampChangeMorphList * new_rep_node(type,name)
unsigned type;
void *name;
{
StampChangeMorphList *cp;
								/* Set up a node */
cp = newStampChangeMorph( type, name );

/*
 *  link the new node into the list
 */
if (pHead_m == NULL) /* If first one seen */
	{
	pHead_m = cp;                      /* Point head to this */
	pWordBound_m = pHead_m;              /* Point word boundary here */
	}
else
	pLast_m->pNext = cp;            /* Else point last to this */
pLast_m = cp;                      /* Remember this as last */

return(cp);
}

/*************************************************************************
 * NAME
 *    replaceStampMorphemes
 * DESCRIPTION
 *    Replace the morphemes matched in the analysis list with morphemes
 *    constructed from the replace list.  Since this can involve deleting
 *    the very first morpheme in the analysis, we need to be able to
 *    change the pointer to the head of the entire list.  This capability
 *    is provided by p_head, which is the address of a pointer to the
 *    head of the analysis list.
 * RETURN VALUE
 *    pointer to morpheme in list following the replacement
 */
StampAnalysis * replaceStampMorphemes(ppHead_io, pFirst_in, pLast_in,
					  pReplace_in, pStamp_in)
StampAnalysis **	ppHead_io;	/* address of a pointer to a list of
					   analysis morphemes */
StampAnalysis *		pFirst_in;	/* pointer to first morpheme to
					   replace */
StampAnalysis *		pLast_in;	/* pointer past last morpheme to
					   replace */
StampChangeMorphList *	pReplace_in;	/* pointer to morphs to put in the
					   the list */
StampData *		pStamp_in;
{
StampAnalysis *		pOldLeft;
StampAnalysis *		pOldRight;
StampAnalysis *		pOldRoot;
StampAnalysis *		pOld;
StampAnalysis *		sp;
StampAnalysis *		pNewHead;
StampAnalysis *		pNew;
StampAnalysis *		pNewTail = NULL;
StampChangeMorphList *	rp;
char *			pszReplaceCat;
char *			pszReplaceMorph;
unsigned char		iReplaceType;
int			i;

pHead_m      = NULL;
pLast_m      = NULL;
pWordBound_m = NULL;
/*
 *  save the boundaries that we're dealing with, and unlink the old nodes
 */
pOldLeft  = pFirst_in->pLeftLink;
if (pOldLeft)
	{
	pFirst_in->pLeftLink = NULL;
	pOldLeft->pRightLink = NULL;
	}
pOldRight = pLast_in;
if (pLast_in)
	pLast_in->pLeftLink->pRightLink = NULL;
if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
	{
	fprintf(pStamp_in->pLogFP,"  Replacing: \"");
	writeStampBriefAnalysis(pFirst_in, NULL, pStamp_in->pLogFP, pStamp_in);
	fprintf(pStamp_in->pLogFP,"\"\n       With: \"");
	writeStampChangeMorphList(pReplace_in, pStamp_in->pLogFP, pStamp_in);
	fprintf(pStamp_in->pLogFP, "\"\n");
	}
/*
 *  handle having an empty replace list (i.e., deletion)
 */
if (!pReplace_in)
	{
	if (pOldLeft)
		pOldLeft->pRightLink = pOldRight;
	if (pOldRight)
		pOldRight->pLeftLink = pOldLeft;
	freeStampAnalysis(pFirst_in);	/* erase the old nodes */
	if (!pOldLeft)
		*ppHead_io = pOldRight;		/* we erased the head of the list */
	return( pOldRight );
	}

/*
 *  create and link together the new nodes
 */
for ( pNewHead = NULL, rp = pReplace_in, pOld = pFirst_in ;
			rp ; rp = rp->pNext )
	{
	pszReplaceMorph = rp->uMorph.pszName;	/* Default to replace values */
	iReplaceType = rp->iMorphType;
	pszReplaceCat = NULL;			/* Default to no cat */
	/* If unspecified */
	if ((rp->iMorphType & MORPHCLASS) || (rp->uMorph.pszName == NULL))
		{
		for ( i = 1, sp = pFirst_in ; i < rp->iPos ; i++, sp = sp->pRightLink )
			;                               /* Find i'th anal of old */
		pszReplaceMorph = sp->m.pszMorphname;       /* Use same morphname */
		}
	else                                    /* Else (specified) */
		sp = pOld;                          /* Use matching anal of old */

											/* If undesignated morphtype */
	if ( (rp->iMorphType & MORPHTYPE_MASK) == MORPHTYPE_MASK )
		iReplaceType = sp->m.iMorphType;       /* Make same as old */

	if ( rp->iMorphType & ROOT )             /* If root */
		{
		/*
		 *  get a category for the ROOT, even if you have to borrow it
		 *    from the old matching morpheme or some old root.
		 */
		if (rp->uCat.iCode)		/* If category in replace, use it */
			pszReplaceCat = findAmpleCategoryName(rp->uCat.iCode,
						 pStamp_in->pCategories);
		else                                /* Else (no category) */
			{
			if ( sp->m.iMorphType & ROOT ) /* If matching old is root */
											/* Use its category */
				pszReplaceCat = findAmpleCategoryName(sp->m.iToCategory,
						 pStamp_in->pCategories);

			else                            /* Else (match not root) */
				{                           /*  find first root in old */
				for (	pOldRoot = pFirst_in ;
			pOldRoot ;
			pOldRoot = pOldRoot->pRightLink )
					{
			if (pOldRoot->m.iMorphType & ROOT)
						break;
			}
				if ( pOldRoot )              /* If any root in old */
											/* Use its category */
					pszReplaceCat = findAmpleCategoryName(
							   pOldRoot->m.iToCategory,
							   pStamp_in->pCategories);
				else                        /* Else use first category */
					pszReplaceCat = findAmpleCategoryName(1,
							   pStamp_in->pCategories);
				}
			}
		}
	/*
	 *  allocate the new node, throwing away any allomorph information
	 *    from the dictionary.
	 */
	pNew = newStampAnalysis( iReplaceType, pszReplaceMorph, pszReplaceCat,
				 pStamp_in );
	addStampAllosToMorph( pNew, pStamp_in->bMatchCategories, pStamp_in );
	/*
	 *  link the new node into the list at the left
	 */
	if (pNewHead == NULL)
		{
		pNewHead = pNewTail = pNew;
		pNew->pLeftLink = pOldLeft;
		if (pOldLeft)
			pOldLeft->pRightLink = pNew;
		}
	else
		{
		pNewTail->pRightLink = pNew;
		pNew->pLeftLink = pNewTail;
		pNewTail = pNew;
		}
	if ( pOld->pRightLink )
		pOld = pOld->pRightLink;               /* move to next old */
	}
/*
 *  now we can link the new nodes at the right, clean up, and quit
 */
pNewTail->pRightLink = pOldRight;
if (pOldRight)
	pOldRight->pLeftLink = pNewTail;
if (pFirst_in == *ppHead_io)
	*ppHead_io = pNewHead;          /* fix the head pointer of the analysis */
freeStampAnalysis(pFirst_in);           /* finally, erase the old nodes */
/*
 *  finally, a paranoid check to see whether we still have roots
 */
for ( pNew = *ppHead_io ; pNew ; pNew = pNew->pRightLink )
	{
	if (pNew->m.iMorphType & ROOT)
		return( pNewTail->pRightLink );   /* return quietly -- all is well */
	}
if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP,
	   "\nWarning: substitution removed all roots from the analysis!!!\n");

return( pNewTail->pRightLink );   /* continue processing after the insertion */
}
