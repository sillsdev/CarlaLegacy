/*  LCPARSE.C - Left Corner Chart Parser for Context-free Grammars
 ******************************************************************************
 *
 * PATREdgeList * parseWithPATR(PATRWord * pSentence_in,
 *                              int *      piStage_out,
 *				PATRData * pPATR_in)
 *
 ******************************************************************************
 * This parsing algorithm has the following characteristics:
 *	bottom-up with top-down filtering
 *	left-to-right order = after each word is added to the chart, all
 *			      possible edges that can be derived up to that
 *			      point have been computed as a side-effect.
 ******************************************************************************
 * Copyright 1990, 2001 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
#include "allocmem.h"
#include "rpterror.h"	/* for NumberedMessage and displayNumberedMessage() */
#include "cmd.h"	/* temp fix */

static int		hash P((char *));
static VOIDP		searchHashTable P((char *,
					   PATRHashList **));
static void		updateHashTable P((char *,
					   VOIDP,
					   PATRHashList **,
					   PATRParseData * pData));
static char *		strsave P((char *, PATRParseData * pData));
static PATRRuleList *	get_lc_list P((char *, PATRParseData * pData));
static StringList *	listadd P((StringList *, char *,
				   PATRParseData * pData));
static void		unionlist P((StringList *,
					 StringList *, PATRParseData * pData));
static StringList *	allow_nonterms P((StringList * list,
					  char * nonterm,
					  PATRParseData * pData));
static int		nonterm_allowable P((char * nonterm,
						 int vertex,
						 PATRParseData * pData));
static int		complete_edge_p P((PATREdge * edgep));
static int		detect_cycle P((PATREdge * edgep,
					PATREdgeList * pList_in,
					int iDepth,
					PATRParseData * pData));
static int		edge_depth P((PATREdge * pEdge));
static char *		need_cat P((PATREdge *edgep));
static PATRNonterminal *need_nonterm P((PATREdge *edgep));
static PATREdge *	make_lexical_edge P((char * string,
						 PATRWordCategory * word,
						 int vertex,
						 PATRParseData * pData));
static PATREdge *	make_rule_edge P((PATRRule * rulep,
					  char * label,
					  int need_index,
					  int start,
					  int end,
					  PATRFeature * dag,
					  PATRParseData * pData));
static void		add_child P((PATREdge * old_parent,
					 PATREdge * new_parent,
					 PATREdge * child, PATRParseData * pData));
static PATREdge *	hypothesize_lc P((PATRRule * rulep,
					  int vertex,
					  PATRParseData * pData));
static PATREdge *	get_final_empty_node P((PATREdge *edgep));
static void		extend_lc_edge P((PATREdge *    act_edge,
					  PATREdge *    pass_edge,
					  int           end,
					  PATRGrammar * pGrammar_in,
					  PATRParseData * pData));
static void		lc_vertex_add_active_edge P((
						PATREdge *    edgep,
						PATRGrammar * pGrammar_in,
						PATRParseData * pData));
static int		lc_vertex_add_passive_edge P((
						PATREdge *    edgep,
						PATRGrammar * pGrammar_in,
						PATRParseData * pData));
static void		add_word_to_chart P((PATRWord *    sentpos,
						 PATRGrammar * pGrammar_in,
						 PATRParseData * pData));
static void		zero_use_count P((PATREdge * edgep,
					  int depth, PATRData * pThis));
static void		count_uses P((PATREdge * edgep,
					  int depth, PATRData * pThis));
static PATREdgeList *	build_parse_list P ((PATRGrammar * pGrammar_in,
						 PATRParseData * pData));
static PATREdge *	find_longest_edge P((int leftpos,
						 PATRParseData * pData));
static void		add_empty_edges P((int iVertex_in,
					   PATRGrammar * pGrammar_in,
					   char * pszDebugString_in,
					   PATRParseData * pData));
static void		show_vertex P((PATRVertex *  pVertex,
					   int           iStart_in,
					   PATRGrammar * pGrammar_in,
					   PATRParseData * pData));
static int		mark_parse_certainty  P((PATREdgeList * pEdgeList_io,
						 PATRData * pThis));
static int		count_parse_failures P((PATREdgeList * pList_in));
static int		doublecheck_constraints P((PATREdge * pEdge_in, PATRFeature * pDag_in,
						   PATRParseData * pData));
static PATREdgeList * parse_with_PATR P((PATRWord * pSentence_in,
					 PATRParseData * pData));
static void		parse_too_big P((size_t uiRequest_in));
static PATREdgeList *	buildPATRParseBush P((PATRParseData * pData));

/**************************************************************************
 *
 *	Global Variables
 *
 **************************************************************************/

static const NumberedMessage sFailed_need_nonterm_m	= { ERROR_MSG,   523,
	"need_nonterm() failed to find a nonterminal" };
/*
 *  cancellation and "out of memory" exception buffers
 */
static jmp_buf sCancelPoint_m;
static jmp_buf sOutOfMemory_m;
static jmp_buf sOutOfTime_m;

/**********************************************************************
 *
 *	Hash table lookup functions - Used for Left Corner, First, &
 *	First_Inverse relations.  Stores a character key field and an
 *	associated pointer.  Adapted from the Hash routines from
 *	Kernighan & Ritchie.
 *
 ***********************************************************************/

#ifdef applec
#pragma segment S_lcparse
#endif

/*****************************************************************************
 * NAME
 *    initPATRHashTables
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void initPATRHashTables(pData)
PATRParseData * pData;
{
int i;

for ( i = 0 ; i < PATR_HASH_SIZE ; ++i )
	{
	pData->aLeftCorners[i]   = NULL;
	pData->aFirsts[i]        = NULL;
	pData->aFirstInverses[i] = NULL;
	}
}

/*****************************************************************************
 * NAME
 *    hash
 * ARGUMENTS
 *    key
 * DESCRIPTION
 *    convert string to an int between 0 and PATR_HASH_SIZE
 * RETURN VALUE
 *
 */
static int hash(key)
char *key;
{
int hashval;

for (hashval = 0; *key != '\0'; )
	hashval += *key++;
return(hashval % PATR_HASH_SIZE);
}

/*****************************************************************************
 * NAME
 *    searchHashTable
 * DESCRIPTION
 *    lookup entry in given hash list
 * RETURN VALUE
 *    pointer to the stored data, or NULL if not found
 */
static VOIDP searchHashTable(key,table)
char *key;
PATRHashList **table;
{
PATRHashList *hp;

for ( hp = table[hash(key)] ; hp != NULL ; hp = hp->pNext )
	{
	if (strcmp(key, hp->pszKey) == 0)
	return(hp->pData);	/* found it */
	}
return(NULL);  /* not found */
}

/*****************************************************************************
 * NAME
 *    updateHashTable
 * DESCRIPTION
 *    update a hash entry.  New entries are added, existing
 *    entries are superseded.
 * RETURN VALUE
 *    none
 */
static void updateHashTable(key, ptr, table, pData)
char *		key;
VOIDP		ptr;
PATRHashList **	table;
PATRParseData * pData;
{
PATRHashList *hp;
int hashval;

/* look up entry */
for (	hp = table[hash(key)] ;
	(hp != NULL) && (strcmp(key, hp->pszKey) != 0) ;
	hp = hp->pNext )
	;

if (hp == NULL)
	{		/* not found */
	hp = allocPATRHashList(pData->pPATR);
	if ((hp == NULL) || ((hp->pszKey = strsave(key, pData)) == NULL))
	return;
	hashval = hash(hp->pszKey);
	hp->pNext = table[hashval];
	table[hashval] = hp;
	}
hp->pData = ptr;			/*  set to new pointer */
}

/*****************************************************************************
 * NAME
 *    strsave
 * ARGUMENTS
 *    s -
 * DESCRIPTION
 *    save a string somewhere
 * RETURN VALUE
 *
 */
static char * strsave(s, pData)
char *s;
PATRParseData * pData;
{
char *p;

if ((p = allocPATRStringBuffer((unsigned)(strlen(s) + 1), pData->pPATR)) != NULL)
	strcpy(p,s);
return(p);
}

/*****************************************************************************
 * NAME
 *    savePATRHashTables
 * DESCRIPTION
 *    copy the static PATRHashList arrays to the PATRGrammar data structure
 * RETURN VALUE
 *    none
 */
void savePATRHashTables(pData, pGrammar_io)
PATRParseData * pData;
PATRGrammar *pGrammar_io;	/* pointer to PATRGrammar data structure */
{
int i;

for ( i = 0 ; i < PATR_HASH_SIZE ; ++i )
	{
	pGrammar_io->aLeftCorners[i]   = pData->aLeftCorners[i];
	pGrammar_io->aFirsts[i]        = pData->aFirsts[i];
	pGrammar_io->aFirstInverses[i] = pData->aFirstInverses[i];
	}
}

/**********************************************************************
 *
 *		Grammar indexing functions - The following functions generate
 *		the left corner relation and the first relation.
 *      Each relation is stored as a linked list of pointers to
 *		other members of the relation.
 *
 ***********************************************************************/

/*****************************************************************************
 * NAME
 *    get_lc_list
 * ARGUMENTS
 *    nonterm -
 * DESCRIPTION
 *    Returns a pointer to a linked-list of rules with given
 *    left corner.  Uses the Hash function declared above.
 * RETURN VALUE
 *
 */
static PATRRuleList * get_lc_list(nonterm, pData)
char * nonterm;
PATRParseData * pData;
{
return((PATRRuleList *)searchHashTable(nonterm, pData->aLeftCorners));
}

/*****************************************************************************
 * NAME
 *    addPATRLeftCorner
 * DESCRIPTION
 *    Add the given rule to the left corner relation list.
 * RETURN VALUE
 *    none
 */
void addPATRLeftCorner(pRule_in, pData)
PATRRule * pRule_in;
PATRParseData * pData;
{
PATRRuleList *listp1,*listp2;
char *nterm;
/*
 *  Set up new patr_rule_list pointer block
 */
listp1 = allocPATRRuleList(pData->pPATR);
listp1->pRule = pRule_in;		/* Point to new rule */
if (pRule_in->iNontermCount)		/* Check for empty rhs */
	nterm = pRule_in->apszNonterms[1];
else
	nterm = "";
/*
 *  search for other rules with this left corner
 */
listp2 = (PATRRuleList *)searchHashTable(nterm, pData->aLeftCorners);
/*
 *  link in new entry, and update relation
 */
listp1->pNext = listp2;
updateHashTable(nterm, listp1, pData->aLeftCorners, pData);
}

/************************************************************************
 *	Routines for maintaining the FIRST and FIRSTINVERSE relations
 *	for use in top down filtering during the parse
 ************************************************************************/

/*****************************************************************************
 * NAME
 *    listadd
 * ARGUMENTS
 *
 * DESCRIPTION
 *    add a nonterm to the end of a list of nonterms.  If the
 *    nonterm is already in the list, don't add.  If list is empty,
 *    the new element will now begin a new list.  Used in building
 *    FIRST and FIRSTINVERSE.
 * RETURN VALUE
 *
 */
static StringList * listadd(listp, nonterm, pData)
StringList * listp;
char * nonterm;
PATRParseData * pData;
{
StringList *ptr1,*ptr2 = NULL;

if (listp == NULL) {   /* create a new list */
	listp = allocPATRNontermList(pData->pPATR);
	listp->pNext = NULL;
	listp->pszString = strsave(nonterm, pData);
	}
else {
	ptr1 = listp;
	while ((ptr1 != NULL) && (strcmp(nonterm,ptr1->pszString)!=0)) {
	ptr2 = ptr1;		/* remember previous list entry */
	ptr1 = ptr1->pNext;
	}
	if ((ptr1 == NULL) && (ptr2 != NULL)) {
	/* no match was found in list, add to list */
	ptr2->pNext          = allocPATRNontermList(pData->pPATR);
	ptr2->pNext->pNext   = NULL;
	ptr2->pNext->pszString = strsave(nonterm, pData);
	}
	}
return(listp);
}

/*****************************************************************************
 * NAME
 *    unionlist
 * ARGUMENTS
 *
 * DESCRIPTION
 *    UNION a list of nonterminals to the end of a
 *    nonterminal list.  LISTADD is used, so no nonterminal
 *    will be in the list more then once.  Used in creating
 *    FIRST and FIRSTINVERSE relations. The first LIST MUST contain elements!
 * RETURN VALUE
 *    none
 */
static void unionlist(list1,list2, pData)
StringList *list1;
StringList *list2;
PATRParseData * pData;
{
while (list2 != NULL)
	{
	listadd(list1,list2->pszString, pData);
	list2 = list2->pNext;
	}
}

/*****************************************************************************
 * NAME
 *    buildPATRFirst
 * ARGUMENTS
 *
 * DESCRIPTION
 *    routine to incrementally build FIRST and FIRSTINVERSE
 *    relations.  Given a lefthand side (LHS) and a left corner
 *    (LC) of the new rule, FIRST(X) where X = LHS and
 *    FIRSTINVERSE(LHS) becomes the union of the nonterminals
 *    LC, FIRST(X), and FIRST(LC). Conversely FIRSTINVERSE(X),
 *    where X = LC and FIRST(LC) becomes the union of the nonterminals
 *    LHS, FIRSTINVERSE(X), and FIRSTINVERSE(LHS).
 * RETURN VALUE
 *    none
 */
void buildPATRFirst(lhs, lc, pData)
char * lhs;
char * lc;
PATRParseData * pData;
{
StringList *ptr,*ptr2,*saveptr,*lclist,*lhslist;

/* set FIRST(lhs) = union of FIRST(lhs), lc, FIRST(LC) */
lclist = (StringList *)searchHashTable(lc, pData->aFirsts);
ptr    = (StringList *)searchHashTable(lhs, pData->aFirsts);
saveptr = ptr;
ptr = listadd(ptr,lc, pData);			/* Add left corner */
unionlist(ptr,lclist, pData);			/* Add first(lc) */
if (saveptr==NULL)		/* only need to add to table if first time */
	updateHashTable(lhs, ptr, pData->aFirsts, pData);
/*
 * set FIRST(X) where X = FIRSTINVERSE(LHS) to union of FIRST(X), lc, FIRST(LC)
 */
ptr = (StringList *)searchHashTable(lhs, pData->aFirstInverses);
while(ptr != NULL)
	{
	ptr2 = (StringList *)searchHashTable(ptr->pszString, pData->aFirsts);
	saveptr = ptr2;
	ptr2 = listadd(ptr2,lc, pData);	/* Add left corner */
	unionlist(ptr2,lclist, pData);		/* Add first(lc) */
	if (saveptr==NULL)		/* only need to add to table if first time */
	updateHashTable(ptr2->pszString, ptr2, pData->aFirsts, pData);
	ptr = ptr->pNext;
	}
/*
 *  set FIRSTINVERSE(lc) = union of FIRSTINVERSE(lc), lhs, FIRSTINVERSE(lhs)
 */
lhslist = (StringList *)searchHashTable(lhs, pData->aFirstInverses);
ptr     = (StringList *)searchHashTable(lc, pData->aFirstInverses);
saveptr = ptr;
ptr=listadd(ptr,lhs, pData);		/* Add left hand side to list */
unionlist(ptr, lhslist, pData);	/* Add firstinverse(lhs) to list */
if (saveptr==NULL)		/* only need to add to table if first time */
	updateHashTable(lc, ptr, pData->aFirstInverses, pData);
/*
 *  set FIRSTINVERSE(X) where X = FIRST(LC) to union of FIRSTINVERSE(X), LHS,
 *  FIRSTINVERSE(LHS)
 */
ptr = (StringList *)searchHashTable(lc, pData->aFirsts);
while (ptr != NULL)
	{
	ptr2 = (StringList *)searchHashTable(ptr->pszString, pData->aFirstInverses);
	saveptr = ptr2;
	ptr2=listadd(ptr2,lhs, pData);	/* Add left hand side to list */
	unionlist(ptr2,lhslist, pData);	/* Add firstinverse(lhs) to list */
	if (saveptr==NULL)		/* only need to add to table if first time */
	updateHashTable(ptr2->pszString, ptr2, pData->aFirstInverses, pData);
	ptr = ptr->pNext;
	}
}

/*****************************************************************************
 * NAME
 *    allow_nonterms
 * ARGUMENTS
 *
 * DESCRIPTION
 *    given a (possibly null) list of allowed nonterminals
 *    for a vertex, and a nonterm,  add the nonterm and
 *    FIRST(nonterm) to the list.
 * RETURN VALUE
 *    updated list of allowable nonterminals
 */
static StringList * allow_nonterms(list, nonterm, pData)
StringList * list;
char * nonterm;
PATRParseData * pData;
{
if (list && (strcmp(list->pszString,"X") == 0))
	return(list);
if (nonterm == NULL)
	return(list);
list = listadd(list, nonterm, pData);
unionlist(list, (StringList *)searchHashTable(nonterm, pData->aFirsts), pData);
return(list);
}

/*****************************************************************************
 * NAME
 *    nonterm_allowable
 * ARGUMENTS
 *    nonterm - nonterminal symbol string
 *    vertex  - vertex index number
 * DESCRIPTION
 *    Determine if top-down filtering will allow the given nonterminal to
 *    start at the given vertex.
 * RETURN VALUE
 *    return TRUE if nonterm IS allowed
 */
static int nonterm_allowable(nonterm, vertex, pData)
char *		nonterm;
int		vertex;
PATRParseData *	pData;
{
StringList *pNT;
/*
 *  if filtering turned off or nonterm == "X", then anything goes
 */
if (!pData->pPATR->bTopDownFilter || (strcmp(nonterm, "X") == 0))
	return TRUE;
/*
 *  look for the given nonterminal in the list of allowable nonterminals
 */
for (pNT = pData->pVertices[vertex].pAllowedNonterms ; pNT ; pNT = pNT->pNext)
	{
	if (    (strcmp(nonterm, pNT->pszString) == 0) ||
		(strcmp("X",     pNT->pszString) == 0) )
	return TRUE;
	}
/*
 *  the given nonterminal is no good at this vertex
 */
if (pData->pPATR->iDebugLevel >= 2)
	fprintf(stdout, "\t%s filtered from vertex %d\n", nonterm, vertex);
return(FALSE);
}

/*********************************************************************
 * EDGE ACCESS FUNCTIONS
 *********************************************************************/

/*****************************************************************************
 * NAME
 *    complete_edge_p
 * ARGUMENTS
 *
 * DESCRIPTION
 *    determine whether an edge is complete (passive)
 * RETURN VALUE
 *
 */
static int complete_edge_p(edgep)
PATREdge *edgep;
{
return(edgep->u.r.iNext > edgep->u.r.pRule->iNontermCount);
}

/*----------------------------------------------------------------------------
 * NAME
 *    detect_cycle
 * DESCRIPTION
 *    search in the tree under edgep for a cycle
 *    original version by Markus Koetter, 08/95
 * RETURN VALUE
 *    0 iff no cycle was detected
 */
static int detect_cycle(pEdge_in, pList_in, iDepth, pData)
PATREdge *	pEdge_in;		/* pointer to a passive edge */
PATREdgeList *	pList_in;
int		iDepth;
PATRParseData *	pData;
{
int		i;
PATREdgeList *	elp;

if (pEdge_in->eType != PATR_RULE_EDGE)
	return( 0 );

for ( elp = pList_in ; elp ; elp = elp->pNext )
	{
	if (elp->pEdge->eType != PATR_RULE_EDGE)
	continue;
	if (    (elp->pEdge->iStart            == pEdge_in->iStart) &&
		(elp->pEdge->iEnd              == pEdge_in->iEnd) &&
		(elp->pEdge->u.r.pRule == pEdge_in->u.r.pRule) &&
		arePATRFeaturesIdentical(elp->pEdge->pFeature,
					 pEdge_in->pFeature) )
	{
	if (pData->pPATR->iDebugLevel >= 2)
		{
		fprintf(stdout, "Warning: cycle was ignored for edge: %d ",
		   pEdge_in->iStart);
		for (   i = 0 ;
			i <= pEdge_in->u.r.pRule->iNontermCount ;
			++i )
		{
		fprintf(stdout, "%s ", pEdge_in->u.r.pRule->apszNonterms[i]);
		if (i == 0)
			fprintf(stdout, "-> ");
		if (pEdge_in->u.r.iNext == i+1)
			fprintf(stdout, ". ");
		}
		fprintf(stdout, "%d\n",pEdge_in->iEnd);
		}
	return( -1 );
	}
	if (detect_cycle(pEdge_in, elp->pEdge->u.r.pChildren, iDepth+1, pData))
	return( -1 );
	}
return(0);
}

/*****************************************************************************
 * NAME
 *    edge_depth
 * DESCRIPTION
 *    recursively calculate the nesting depth of the given edge
 * RETURN VALUE
 *    the nesting depth of the given edge
 */
int edge_depth(pEdge)
PATREdge * pEdge;
{
int iDepth;
int iMaxDepth;
PATREdgeList * elp;

if (pEdge->eType != PATR_RULE_EDGE)
	 return 1;
for ( iMaxDepth = 0, elp = pEdge->u.r.pChildren ; elp ; elp = elp->pNext )
	 {
	 iDepth = edge_depth(elp->pEdge);
	 if (iMaxDepth < iDepth)
	 iMaxDepth = iDepth;
	 }
return iMaxDepth + 1;
}

/*****************************************************************************
 * NAME
 *    need_cat
 * ARGUMENTS
 *
 * DESCRIPTION
 *
 * RETURN VALUE
 *    return nonterminal category symbol needed by edge
 */
static char *need_cat(edgep)
PATREdge *edgep;
{
return(edgep->u.r.pRule->apszNonterms[edgep->u.r.iNext]);
}

/*****************************************************************************
 * NAME
 *    need_nonterm
 * ARGUMENTS
 *
 * DESCRIPTION
 *
 * RETURN VALUE
 *    return nonterminal structure needed by edge
 */
static PATRNonterminal *need_nonterm(edgep)
PATREdge *edgep;
{
int index;
PATRNonterminal *nterm;

for (	index = 1, nterm = edgep->u.r.pRule->pRHS ;
	(index < edgep->u.r.iNext) && (nterm != NULL) ;
	index++, nterm = nterm->pNext )
	;
return(nterm);
}

/*********************************************************************
 *
 *   Parser code - Bottom-up Parse using chart and left corner algorithm
 *   ===========
 *********************************************************************/

/*****************************************************************************
 * NAME
 *    make_lexical_edge
 * ARGUMENTS
 *
 * DESCRIPTION
 *    Create a lexical edge structure, and initialize
 * RETURN VALUE
 *
 */
static PATREdge * make_lexical_edge( string, word, vertex, pData)
char * string;  /* terminal string (surface form of word) */
PATRWordCategory * word;
int vertex;
PATRParseData * pData;
{
PATREdge *edgep;
/*
 *  allow the caller to kill us asynchronously, and to see our progress
 */
if (bCancelPATROperation_g)
	{
	longjmp( sCancelPoint_m, 1 );
	}
++pData->uiProgressCount;
if ((pData->uiProgressCount % 10) == 0)
	{
	reportProgress( pData->uiProgressCount );
	}
/*
 *  Allocate space for new edge
 */
edgep = allocPATREdge(pData->pPATR);
/*
 *  Set edge info
 */
edgep->iStart   = vertex - 1;
edgep->iEnd     = vertex;
edgep->pszLabel = word->pszCategory;
edgep->iIndex   = 0;
					/* copy the dag in the lexicon */
edgep->pFeature = copyPATRFeature(word->pFeature, pData->pPATR);
edgep->eType    = PATR_LEXICAL_EDGE;
edgep->iCount   = 0;
edgep->bFailed  = FALSE;
edgep->u.l.pszTerminal = string;
edgep->u.l.pWord       = word;

return(edgep);
}

/*****************************************************************************
 * NAME
 *    make_rule_edge
 * ARGUMENTS
 *
 * DESCRIPTION
 *    Create a rule edge structure, and initialize
 * RETURN VALUE
 *
 */
static PATREdge * make_rule_edge(rulep, label, need_index, start, end, dag,
				 pData)
PATRRule *rulep;
char *label;
int need_index;
int start;
int end;
PATRFeature *dag;
PATRParseData * pData;
{
PATREdge *edgep;
/*
 *  allow the caller to kill us asynchronously, and to see our progress
 */
if (bCancelPATROperation_g)
	{
	longjmp( sCancelPoint_m, 1 );
	}
++pData->uiProgressCount;
if ((pData->uiProgressCount % 10) == 0)
	{
	reportProgress( pData->uiProgressCount );
	}
/*
 *  Allocate space for new edge
 */
edgep = allocPATREdge(pData->pPATR);
/*
 *  Set of edge info
 */
edgep->iStart    = start;
edgep->iEnd      = end;
edgep->pszLabel  = label;
edgep->iIndex    = 0;
edgep->pFeature  = dag;	/* dag is copied by caller, so we don't need to */
edgep->eType     = PATR_RULE_EDGE;
edgep->iCount    = 0;
edgep->bFailed   = FALSE;
edgep->u.r.iNext     = need_index;
edgep->u.r.pRule     = rulep;
edgep->u.r.pChildren = NULL;

return(edgep);
}

/*****************************************************************************
 * NAME
 *    add_child
 * ARGUMENTS
 *    Add a child pointer from the edge being extented (new_parent)
 *    to the edge which is is extending it (child), also the new
 *    parent gets the old parents children as well.
 *    (Note that both old and new parent search commons parts of
 *    the linked list.)
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void add_child(old_parent, new_parent, child, pData)
PATREdge * old_parent;
PATREdge * new_parent;
PATREdge * child;
PATRParseData * pData;
{
PATREdgeList *elp;

/* Allocate space for the pointer to the edge */
elp = allocPATREdgeList(pData->pPATR);
elp->pEdge = child;

/* Link edge into this new_parent child edge list */
elp->pNext = old_parent->u.r.pChildren;
new_parent->u.r.pChildren = elp;
}

/*****************************************************************************
 * NAME
 *    hypothesize_lc
 * DESCRIPTION
 *    Forms a hypothesis edge (an active edge for which none of the
 *    constituents have yet been found) for the given rule starting
 *    and ending at the given vertex.  Dynamic memory is not used
 *    since these edges will immediately be proposed prior
 *    to the next hypothesis step.
 * RETURN VALUE
 *
 */
static PATREdge * hypothesize_lc(rulep, vertex, pData)
PATRRule * rulep;
int vertex;
PATRParseData * pData;
{
PATREdge * edgep = &pData->hyp_edge;

/* Make a rule edge for the new active edge */
/* This new edge will have the same start and end vertex */

/* Set of edge info */
edgep->iStart   = vertex;
edgep->iEnd     = vertex;
edgep->pszLabel = rulep->apszNonterms[0];
/* we don't need to copy unless features are used for top-down filtering. */
edgep->pFeature = rulep->pUniFeature;
edgep->eType    = PATR_RULE_EDGE;
edgep->u.r.iNext     = 1;
edgep->u.r.pRule     = rulep;
edgep->u.r.pChildren = NULL;
return(edgep);
}

/*****************************************************************************
 * NAME
 *    get_final_empty_node
 * ARGUMENTS
 *    edgep  - pointer to edge structure
 * DESCRIPTION
 *    Find final empty daughter node of an edge
 * RETURN VALUE
 *    pointer to final empty edge
 */
static PATREdge *get_final_empty_node(edgep)
PATREdge *edgep;
{
while (edgep->u.r.pChildren != NULL)
	edgep = edgep->u.r.pChildren->pEdge;	/* assume only 1 child */
return(edgep);
}

/*****************************************************************************
 * NAME
 *    extend_lc_edge
 * ARGUMENTS
 *    act_edge  -
 *    pass_edge -
 *    end       -
 *    pGrammar_in     - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Forms a new (active or passive) edge by extending a
 *    given active edge (ACT_EDGE) by a given passive edge (PASS_EDGE).
 *    placing the built edge in the appropriate final vertex (END).
 *    extension only occurs if unification succeeds.
 * RETURN VALUE
 *    none
 */
static void extend_lc_edge(act_edge, pass_edge, iEnd_in, pGrammar_in, pData)
PATREdge *	act_edge;
PATREdge *	pass_edge;
int		iEnd_in;
PATRGrammar *	pGrammar_in;
PATRParseData *	pData;
{
PATREdge *		edgep;
PATRFeature *		pDag;
PATRFeature *		pDag1;
PATRFeature *		pDag2;
PATRFeature *		pUniDag;
int			ok;
PATRNonterminal *	nterm;
char *			label;
char *			psz0;
PATRFeature *		pFeat1;
PATRFeature *		pFeat2;
StringList *		pPath1;
StringList *		pPath2;
StringList *		pPath;
StringList *		pNextPath;
char *			psz1;
char *			psz2;
/*
 * First check if these edges successfully unify,
 * continue only if they do
 */
nterm = need_nonterm( act_edge );
if (nterm == NULL)
	{
	displayNumberedMessage(&sFailed_need_nonterm_m,
			   pData->pPATR->bSilent, pData->pPATR->bShowWarnings,
			   pData->pPATR->pLogFP,
			   NULL, 0);
	return;
	}
/*
 *  If there have been no previous unification failures on this active
 *  edge, do the unifications for the edge.
 *  Otherwise, just pass on the previously generated (and failed)
 *  unification.
 */
psz0 = storedPATRString( "0", pData->pPATR);
if (!act_edge->bFailed)
	{
	if (!pData->pPATR->bUnification && !pData->pPATR->bFailure)
	{
	ok = TRUE;
	pDag = act_edge->pFeature;
	}
	else
	{
	markPATRGarbage(PATR_GARBAGE_UNIFY, pData->pPATR);
	pDag1 = findPATRAttribute( act_edge->pFeature, nterm->pszName);
	if (pass_edge->eType == PATR_RULE_EDGE)
		pDag2 = findOrAddPATRAttribute( pass_edge->pFeature, psz0,
						pData->pPATR);
	else
		pDag2 = pass_edge->pFeature;

	if (pDag2 == NULL)
		pUniDag = NULL;
	else if (pDag1 == NULL)
		pUniDag = copyPATRFeature( pDag2, pData->pPATR );
	else
		pUniDag = unifyPATRFeatures(pDag1, pDag2, TRUE, pData->pPATR);

	if (pUniDag == NULL)
		{
		ok = FALSE;
		if (    !pData->pPATR->bUnification &&
			pData->pPATR->bFailure &&
			(pDag1 != NULL) &&
			(pDag2 != NULL) )
		{
		int bFound;
		pPath1 = NULL;
		pPath2 = NULL;
		pFeat1 = NULL;
		pFeat2 = NULL;
		bFound = findPATRUnifyFailure(pDag1, pDag2,
						  &pPath1, &pFeat1,
						  &pPath2, &pFeat2,
						  pData->pPATR);
		if (bFound)
			{

			/*
			 *  must copy to avoid destroying act_edge
			 */
			pDag  = copyPATRFeature(act_edge->pFeature, pData->pPATR);
			unifyPATRFeatures(findOrAddPATRAttribute(pDag,
								 nterm->pszLhsName,
								 pData->pPATR),
					  findOrAddPATRAttribute(pDag, psz0,
								 pData->pPATR),
					  FALSE,
					  pData->pPATR);
			/*
			 *  find the bad feature in the copied structure
			 */
			pDag1 = findPATRAttribute( pDag, nterm->pszName);
			for ( pPath = pPath1 ; pPath ; pPath = pPath->pNext )
			pDag1 = findPATRAttribute( pDag1, pPath->pszString);
			if (pDag1 != NULL)
			{
			switch (pFeat1->eType)
				{
				case PATR_ATOM:
				psz1 = pFeat1->u.pszAtom;
				break;
				case PATR_COMPLEX:
				psz1 = "[...]";
				break;
				case PATR_FORWARD:
				psz1 = "*-->";
				break;
				case PATR_NULLFS:
				psz1 = "[]";
				break;
				case PATR_FAILFS:
				psz1 = "FAIL";
				break;
				case PATR_DEFATOM:
				psz1 = pFeat1->u.pszAtom;
				break;
				default:
				psz1 = "????";
				break;
				}
			switch (pFeat2->eType)
				{
				case PATR_ATOM:
				psz2 = pFeat2->u.pszAtom;
				break;
				case PATR_COMPLEX:
				psz2 = "[...]";
				break;
				case PATR_FORWARD:
				psz2 = "*-->";
				break;
				case PATR_NULLFS:
				psz2 = "[]";
				break;
				case PATR_FAILFS:
				psz2 = "FAIL";
				break;
				case PATR_DEFATOM:
				psz2 = pFeat2->u.pszAtom;
				break;
				default:
				psz2 = "????";
				break;
				}
			pDag1->u.pszAtom = allocPATRStringBuffer((int)
						 (strlen(psz1) + strlen(psz2) + 6),
						 pData->pPATR);
			sprintf(pDag1->u.pszAtom, "%s%s / %s%s",
				 (pFeat1->eType == PATR_DEFATOM) ? "!" : "", psz1,
				 (pFeat2->eType == PATR_DEFATOM) ? "!" : "", psz2);
			pDag1->eType = PATR_FAILFS;
			}
			/*
			 *  clean up the memory used for the failure paths
			 */
			for ( pPath = pPath2 ; pPath ; pPath = pNextPath )
			{
			pNextPath = pPath->pNext;
			deallocatePATRFeaturePath( pPath, pData->pPATR );
			}
			for ( pPath = pPath1 ; pPath ; pPath = pNextPath )
			{
			pNextPath = pPath->pNext;
			deallocatePATRFeaturePath( pPath, pData->pPATR );
			}
			}
		else
			{
			pDag = NULL;
			}
		}
		else
		{
		pDag = NULL;
		}
		}
	else
		{
		/*
		 *  must copy to avoid destroying act_edge
		 */
		pDag  = copyPATRFeature( act_edge->pFeature, pData->pPATR );
		/*
		 *  must unify, instead of assign, in order to handle shared
		 *  nodes in the graph  (we know this always succeeds, since it
		 *  already has unified!)
		 */
		unifyPATRFeatures(findOrAddPATRAttribute(pDag, nterm->pszName,
							 pData->pPATR),
				  pUniDag,
				  FALSE,
				  pData->pPATR);
		/*
		 *  unify lhs features corresponding to nterm with 0 path
		 */
		if (unifyPATRFeatures(findOrAddPATRAttribute(pDag,
				  nterm->pszLhsName,
				  pData->pPATR),
				  findOrAddPATRAttribute(pDag, psz0, pData->pPATR),
				  FALSE, pData->pPATR) == NULL)
		ok = FALSE;
		else
		ok = TRUE;
		if (  ok &&
		  (act_edge->eType == PATR_RULE_EDGE) &&
		  (act_edge->u.r.pRule->iNontermCount == act_edge->u.r.iNext) )
		{
		PATRPriorityUnion * pUnion;
		PATRConstraint *    pConstraint;
		/*
		 *  apply each priority union in turn
		 */
		for (	pUnion = act_edge->u.r.pRule->pPriorityUnions ;
			ok && pUnion ;
			pUnion = pUnion->pNext )
			{
			applyPATRPriorityUnion(pDag, pUnion, pData->pPATR);
			ok = verifyAcyclicPATRFeature(pDag);
			}
		/*
		 *  if any constraint fails, ok = FALSE
		 */
		for (   pConstraint = act_edge->u.r.pRule->pConstraints ;
			ok && pConstraint ;
			pConstraint = pConstraint->pNext )
			{
			ok = applyPATRConstraint(pDag, pConstraint, pData->pPATR);
			}
		}
		}
	/*
	 *  allow the caller to kill us asynchronously, and to see our progress
	 */
	if (bCancelPATROperation_g)
		{
		collectPATRGarbage(PATR_GARBAGE_UNIFY, pData->pPATR);
		longjmp( sCancelPoint_m, 1 );
		}
	++pData->uiProgressCount;
	if ((pData->uiProgressCount % 10) == 0)
		{
		reportProgress( pData->uiProgressCount );
		}
	if (!ok && pData->pPATR->bUnification)
		{
		collectPATRGarbage(PATR_GARBAGE_UNIFY, pData->pPATR);
		return;
		}
	unmarkPATRGarbage(PATR_GARBAGE_UNIFY, pData->pPATR);
	}
	/*
	 *  eliminate edges whereby a single empty category becomes the
	 *  daughter of two distinct non-terminals
	 */
	if (    (act_edge->iStart  == act_edge->iEnd)   &&
		(act_edge->iStart  == iEnd_in)          &&
		(pass_edge->iStart == pass_edge->iEnd)  &&
		(pass_edge->iStart == act_edge->iStart) &&
		(act_edge->eType   == PATR_RULE_EDGE)   &&
		(pass_edge->eType  == PATR_RULE_EDGE) )
	{
	/*
	 *  find final nodes for both:  if same, don't add this edge
	 */
	if (get_final_empty_node(act_edge) == get_final_empty_node(pass_edge))
		return;
	}
	}
else
	{
	/*
	 *  we have already had a previous unification failure
	 */
	ok = FALSE;
	pDag = act_edge->pFeature;
	}
/*
 *  Build a new edge, which is act_edge with one greater need-index
 *  (one less nonterminal needed), and ends on the END vertex.
 *  BK: compute label of lhs from CAT feature
 */
label = NULL;
if (pDag)
	label = findPATRCatFeature( findOrAddPATRAttribute( pDag, psz0,
							pData->pPATR),
				pData->pPATR->pGrammar );
if (label == NULL)
	label = act_edge->pszLabel;
edgep =  make_rule_edge(act_edge->u.r.pRule,
			label,
			act_edge->u.r.iNext+1,
			act_edge->iStart,
			iEnd_in,
			pDag, pData);
if (! ok)
	edgep->bFailed = TRUE;
/*
 *  Link the new edge into its parent
 */
add_child(act_edge,edgep,pass_edge, pData);
/*
 * Now add it either as an active or passive edge, depending on the need index
 */
if ( complete_edge_p(edgep) )
	lc_vertex_add_passive_edge(edgep, pData->pPATR->pGrammar, pData);
else
	lc_vertex_add_active_edge(edgep, pData->pPATR->pGrammar, pData);
}

/*****************************************************************************
 * NAME
 *    lc_vertex_add_active_edge
 * ARGUMENTS
 *    edgep -
 *    pGrammar_in   - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Adds the edge to the active edge list, updating the
 *    allowed nonterminal list to allow the need of this edge
 *    and anything that can start this need.
 * RETURN VALUE
 *    none
 */
static void lc_vertex_add_active_edge(edgep, pGrammar_in, pData)
PATREdge *	edgep;
PATRGrammar *	pGrammar_in;
PATRParseData *	pData;
{
PATREdgeList *elp;
int end = edgep->iEnd;
/*
 *  check for exceeding user-requested time limit
 */
++pData->pPATR->uiEdgesAdded;
if (	(pData->pPATR->iMaxProcTime != 0) &&
	((pData->pPATR->uiEdgesAdded & 0xFF) == 0) )
	{
	time_t iTime = time(NULL);
	if ((iTime - pData->pPATR->iStartTime) > pData->pPATR->iMaxProcTime)
	longjmp( sOutOfTime_m, 1 );
	}
if (pData->pPATR->iDebugLevel)
	showPATREdge(edgep, pData->pPATR);
/*
 *  Set up new link for linked lists of edges
 */
elp = allocPATREdgeList(pData->pPATR);
elp->pEdge = edgep;
/*
 *  Link edge into this vertex's active edge list
 */
elp->pNext = pData->pVertices[end].pIncomingActiveEdges;
pData->pVertices[end].pIncomingActiveEdges = elp;
/*
 *  allow all nonterminals engendered by the need of this edge to be
 *  started here
 */
pData->pVertices[end].pAllowedNonterms =
		allow_nonterms(pData->pVertices[end].pAllowedNonterms,
			   need_cat(edgep),
			   pData);
}

/*****************************************************************************
 * NAME
 *    lc_vertex_add_passive_edge
 * ARGUMENTS
 *    edgep -
 *    pGrammar_in - pointer to PATRGrammar structure
 * DESCRIPTION
 *    The workhorse of the parsing algorithm.  Adds in the passive edge if
 *    it's allowed (by top-down filtering).
 *    Then hypothesizes that all rules for which this edge could be the left
 *    corner could start at this vertex by computing hypothesis edges (active
 *    edges with nothing found yet).  Tries to extend these hypothesis edges,
 *    and also all extendable active edges incoming to this vertex by adding
 *    in the just added passive edge.  This process involves adding new edges
 *    to this and previous vertices, which in turn can cause new edges to be
 *    added, etc.  The hypothesis edges are not added in to the normal active
 *    edges because doing so would yield a proliferation them, leading to
 *    redundancy in the computation.  Anyway, there's no need to.
 * RETURN VALUE
 *    zero if edge not added, non-zero if it is
 */
static int lc_vertex_add_passive_edge(edgep, pGrammar_in, pData)
PATREdge *	edgep;
PATRGrammar *	pGrammar_in;
PATRParseData *	pData;
{
PATREdgeList * elp;
PATRRuleList * rlp;
int start = edgep->iStart;
PATREdge * pEdge;
int iMaxDepth;
/*
 *  check for exceeding user-requested time limit
 */
++pData->pPATR->uiEdgesAdded;
if (	(pData->pPATR->iMaxProcTime != 0) &&
	((pData->pPATR->uiEdgesAdded & 0xFF) == 0) )
	{
	time_t iTime = time(NULL);
	if ((iTime - pData->pPATR->iStartTime) > pData->pPATR->iMaxProcTime)
	longjmp( sOutOfTime_m, 1 );
	}
/*
 *  Perform top down filtering
 */
iMaxDepth = edge_depth(edgep);
if ((iMaxDepth >= 1000) && (pData->pPATR->iDebugLevel >= 2))
	{
	fprintf(stdout, "Warning: the edge nests %d levels deep!\n", iMaxDepth);
	}
if (	nonterm_allowable(edgep->pszLabel, start, pData) &&
	(iMaxDepth < 1000) &&
	(   !pData->pPATR->bCheckCycles ||
		!detect_cycle(edgep, edgep->u.r.pChildren, 0, pData) ) )
	{
	/*************************************************
	 * ADDITION STEP - add edge to passive edge list *
	 *************************************************/
	/*
	 *  Set up new link for linked lists of edges
	 *  Link edge into this vertex's passive edge list
	 */
	if (pData->pPATR->iDebugLevel)
	showPATREdge(edgep, pData->pPATR);
	elp = allocPATREdgeList(pData->pPATR);
	elp->pEdge = edgep;
	elp->pNext = pData->pVertices[edgep->iEnd].pIncomingPassiveEdges;
	pData->pVertices[edgep->iEnd].pIncomingPassiveEdges = elp;

	/**********************************************************************
	 * PREDICTION STEP                                                    *
	 *  - hypothesize all rules which have the news rule's RHS as its LHS *
	 *  - The hypothesized edges are immediately subject to the extension *
	 *    step as they are found.  This way we won't clutter up dynamic   *
	 *    memory with temporary edges                                     *
	 **********************************************************************/

	if (strcmp(edgep->pszLabel, "X") != 0)
	{
	for (	rlp = get_lc_list(edgep->pszLabel, pData) ;
		rlp ;
		rlp = rlp->pNext )
		{
		/*
		 *  apply top down filtering
		 */
		if (nonterm_allowable(rlp->pRule->apszNonterms[0], start, pData))
		{
		/*
		 *  add this rule as an edge to the chart
		 */
		pEdge = hypothesize_lc(rlp->pRule, start, pData);
		if (pData->pPATR->iDebugLevel >= 2)
			{
			fprintf(stdout, "Hypothesizing (for %s) ",
				edgep->pszLabel);
			showPATREdge(pEdge, pData->pPATR);
			}
		extend_lc_edge(pEdge, edgep, edgep->iEnd,
				   pData->pPATR->pGrammar, pData);
		}
		}
	}
	for ( rlp = get_lc_list("X", pData) ; rlp ; rlp = rlp->pNext )
	{
	/*
	 *  apply top down filtering
	 */
	if (nonterm_allowable(rlp->pRule->apszNonterms[0], start, pData))
		{
		pEdge = hypothesize_lc(rlp->pRule, start, pData);
		if (pData->pPATR->iDebugLevel >= 2)
		{
		fprintf(stdout, "Hypothesizing (for X) ");
		showPATREdge(pEdge, pData->pPATR);
		}
		extend_lc_edge(pEdge, edgep, edgep->iEnd,
			   pData->pPATR->pGrammar, pData);
		}
	}

	/*******************************************************************
	 * EXTENSION STEP                                                  *
	 *    Extend all active edges coming into START by the new passive *
	 *    edge, if possible.  (This does not include the recently      *
	 *    computed hypothesis edges, since they were extended above.)  *
	 *******************************************************************/

	for (   elp = pData->pVertices[start].pIncomingActiveEdges ;
		elp ;
		elp = elp->pNext )
	{
		char *need = need_cat(elp->pEdge);
	/*
	 *  Only try to extend rules with this need
	 */
	if (strcmp(need, "X") == 0 || strcmp(need, edgep->pszLabel) == 0)
		{
		if (pData->pPATR->iDebugLevel >= 2)
		{
		fprintf(stdout, "Extending edge (for %s) ", need);
		showPATREdge(elp->pEdge, pData->pPATR);
		}
		extend_lc_edge(elp->pEdge, edgep, edgep->iEnd,
			   pData->pPATR->pGrammar, pData);
		}
	}
	return( 1 );
	}
else if (pData->pPATR->iDebugLevel >= 2)
	{
	fprintf(stdout, "\tEdge filtered out from vertex %d: ",start);
	showPATREdge(edgep, pData->pPATR);
	}
return( 0 );
}

/*****************************************************************************
 * NAME
 *    add_word_to_chart
 * ARGUMENTS
 *    sentpos -
 *    pGrammar_in   - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Create a new vertex, and add lexical edges
 *    for each sense of the word at sentpos.
 * RETURN VALUE
 *    none
 */
static void add_word_to_chart(sentpos, pGrammar_in, pData)
PATRWord *	sentpos;
PATRGrammar *	pGrammar_in;
PATRParseData *	pData;
{
PATRWordCategory *	sense;
PATREdge *		edgep;
/*
 *  Initialize the new vertex
 */
++pData->iVertexCount;
if (pData->iVertexCount >= pData->iVerticesAlloc)
	{
	int iAlloc;
	PATRVertex * pVert;
	if (pData->pVertices)
	{
	iAlloc = 2 * pData->iVerticesAlloc;
	if (iAlloc <= pData->iVertexCount)
		iAlloc = pData->iVertexCount + 1;
	pVert = (PATRVertex *)reallocMemory(pData->pVertices,
						iAlloc * sizeof(PATRVertex));
	}
	else
	{
	iAlloc = 32;
	if (iAlloc <= pData->iVertexCount)
		iAlloc = pData->iVertexCount + 1;
	pVert = (PATRVertex *)allocMemory(iAlloc * sizeof(PATRVertex));
	}
	pData->pVertices = pVert;
	pData->iVerticesAlloc = iAlloc;
	}
pData->pVertices[pData->iVertexCount].pszTerminal = sentpos->pszWordName;
pData->pVertices[pData->iVertexCount].pIncomingPassiveEdges = NULL;
pData->pVertices[pData->iVertexCount].pIncomingActiveEdges = NULL;
pData->pVertices[pData->iVertexCount].pIncomingFailedEdges = NULL;
pData->pVertices[pData->iVertexCount].pAllowedNonterms = NULL;
/*
 *  Add lexical edge for each word sense
 */
for ( sense = sentpos->pCategories ; sense ; sense = sense->pNext )
	{
	edgep = make_lexical_edge(sentpos->pszWordName, sense, pData->iVertexCount,
				  pData);
	lc_vertex_add_passive_edge(edgep, pGrammar_in, pData);
	}
/*
 *  Add empty edges for each rule with empty rhs.
 *  This is done after adding the lexical edge, so that top-down filtering
 *  will find a complete list of allowed nonterminals.
 */
add_empty_edges(pData->iVertexCount, pGrammar_in, sentpos->pszWordName,
		pData);
}

/*****************************************************************************
 * NAME
 *    parse_too_big
 * DESCRIPTION
 *    complain about running out of memory while parsing a sentence
 * RETURN VALUE
 *    none
 */
static void parse_too_big(uiRequest_in)
size_t	uiRequest_in;
{
/* REVIEW: how much memory leakage might this allow? */
longjmp(sOutOfMemory_m, uiRequest_in ? uiRequest_in : 1);
}

/****************************************************************************
 * NAME
 *    count_parse_failures
 * ARGUMENTS
 *    pList_in - pointer to a list of PATREdgeList nodes
 * DESCRIPTION
 *    Check for failing node
 * RETURN VALUE
 *    Integer value, zero if no failures, nonzero otherwise
 */
static int count_parse_failures( pList_in )
PATREdgeList *pList_in;
{
PATREdgeList *p;
int fail;

fail = 0;
for ( p = pList_in ; p ; p = p->pNext )
	{
	fail += p->pEdge->bFailed;
	if ( p->pEdge->eType == PATR_RULE_EDGE )
	fail += count_parse_failures( p->pEdge->u.r.pChildren );
	}
return( fail );
}

/*****************************************************************************
 * NAME
 *    doublecheck_constraints
 * DESCRIPTION
 *    Recursively run down the parse tree, checking all logical constraints at
 *    each edge.
 * RETURN VALUE
 *    true if all constraints are always satisfied, otherwise false.
 */
static int doublecheck_constraints(pEdge_in, pDag_in, pData_in)
PATREdge * pEdge_in;
PATRFeature * pDag_in;
PATRParseData * pData_in;
{
if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	PATREdgeList * pel;
	PATRConstraint * pConstraint;

	if (pData_in->pPATR->iDebugLevel >= 2)
	{
	fprintf(stdout, "DEBUG: doublecheck_constraints(pEdge, pData)\n");
	fprintf(stdout, "pEdge->pszLabel = \"%s\"\n",
		pEdge_in->pszLabel ? pEdge_in->pszLabel : "{NULL}");
	fprintf(stdout, "pEdge_in->pFeature = ");
	writePATRFeature(pEdge_in->pFeature, stdout, 12, pData_in->pPATR);
	fprintf(stdout, "\npDag_in = ");
	writePATRFeature(pDag_in, stdout, 12, pData_in->pPATR);
	fprintf(stdout, "\n");
	}

	for (   pConstraint = pEdge_in->u.r.pRule->pConstraints ;
		pConstraint ;
		pConstraint = pConstraint->pNext )
	{
#ifndef hab138
	  /* only check constraints that are for the mother node;
	  *  these are the only ones where the feature may have changed
	  *  and therefore are the only ones that need to be
	  *  double checked */
	if (pEdge_in->pszLabel && pConstraint->pPath &&
		streq(pEdge_in->pszLabel, pConstraint->pPath->pszString))
		{
		if (!applyPATRConstraint(pDag_in, pConstraint, pData_in->pPATR))
		  return FALSE;
		}
#else  /* hab138 */
	if (!applyPATRConstraint(pDag_in, pConstraint, pData_in->pPATR))
		return FALSE;
#endif /* hab138 */
	}
	for ( pel = pEdge_in->u.r.pChildren ; pel ; pel = pel->pNext )
	{
	if (!doublecheck_constraints(pel->pEdge, pEdge_in->pFeature, pData_in))
		return FALSE;
	}
	}
return TRUE;
}

/*****************************************************************************
 * NAME
 *    parse_with_PATR
 * DESCRIPTION
 *    Main left-corner parsing routine.  Adds all senses of WORDS one at
 *    a time to the chart using LEX-INSERT.  Parsing is done as a side
 *    effect by virtue of messages being sent to the vertices.
 * RETURN VALUE
 *    pointer to the parse chart constructed, or NULL if parse fails
 */
static PATREdgeList * parse_with_PATR(pSentence_in, pData)
PATRWord *	pSentence_in;
PATRParseData * pData;
{
PATRWord *	pWord;
PATREdgeList *	pParseList;
int		i;

if (	(pData->pPATR == NULL) ||
	(pData->pPATR->pGrammar == NULL) ||
	(pData == NULL))
	return NULL;
/*
 *  allow the caller to kill us asynchronously, and to see our progress
 */
if (setjmp( sCancelPoint_m ))
	{
	pData->uiProgressCount = 0L;
	pData = NULL;
	cleanupPATRGarbage(pData->pPATR->pStartGarbage, pData->pPATR);
	return NULL;
	}
pData->uiProgressCount = 0L;
reportProgress( pData->uiProgressCount );
pData->uiSentenceWordCount = 0;
for ( pWord = pSentence_in ; pWord ; pWord = pWord->pNext )
	++pData->uiSentenceWordCount;

pData->iVertexCount = 0;	/* Reset vertex counter */
if (pData->iVerticesAlloc == 0)
	{
	pData->pVertices = (PATRVertex *)allocMemory(32 * sizeof(PATRVertex));
	pData->iVerticesAlloc = 32;
	}
for ( i = 0 ; i < PATR_HASH_SIZE ; ++i )
	{
	pData->aLeftCorners[i]   = pData->pPATR->pGrammar->aLeftCorners[i];
	pData->aFirsts[i]        = pData->pPATR->pGrammar->aFirsts[i];
	pData->aFirstInverses[i] = pData->pPATR->pGrammar->aFirstInverses[i];
	}
/* BK: initialize the leftmost vertex */
pData->pVertices[0].pszTerminal = NULL;
pData->pVertices[0].pIncomingPassiveEdges = NULL;
pData->pVertices[0].pIncomingActiveEdges = NULL;
pData->pVertices[0].pIncomingFailedEdges = NULL;
/*
 *  Allow any starter of a S at vertex 0
 */
pData->pVertices[0].pAllowedNonterms = allow_nonterms((StringList *)NULL,
					pData->pPATR->pGrammar->pszStartSymbol,
							  pData);
/*
 *  add any empty edges that are needed at the beginning
 */
add_empty_edges(0, pData->pPATR->pGrammar, "", pData);
/*
 *  For each word sense - add lexical edge
 */
for ( pWord = pSentence_in ; pWord ; pWord = pWord->pNext )
	{
	if (pData->pPATR->iDebugLevel)
	fprintf(stdout, "Adding %s to chart\n", pWord->pszWordName);
	add_word_to_chart(pWord, pData->pPATR->pGrammar, pData);
	}
if (pData->pPATR->iDebugLevel)
	fprintf(stdout, "\nDone building chart\n");
/*
 * Build a list of complete parses.
 */
pParseList = build_parse_list(pData->pPATR->pGrammar, pData);
if (pParseList != NULL)
	{
	PATREdgeList * pel;
	PATREdgeList * pelPrev = NULL;
	for ( pel = pParseList ; pel ; pel = pel->pNext )
	{
	int ok = doublecheck_constraints(pel->pEdge, pel->pEdge->pFeature, pData);
	if (!ok)
		{
		if (pelPrev)
		pelPrev->pNext = pel->pNext;
		else
		pParseList = pel->pNext;
		}
	pelPrev = pel;
	}
	if (    pData->pPATR->bUnification && !pData->pPATR->bFailure &&
		count_parse_failures(pParseList) )
	{
	pParseList = NULL;
	pData->pPATR->iParseCount = 0;
	}
	else
	{
	setPATRResultIndexes(pParseList, pData->pPATR);
	pData->pPATR->iParseCount = mark_parse_certainty(pParseList,
							 pData->pPATR);
	}
	}
else
	pData->pPATR->iParseCount = 0;

return pParseList;
}

/*****************************************************************************
 * NAME
 *    zero_use_count
 * ARGUMENTS
 *
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
static void zero_use_count(edgep, depth, pThis)
PATREdge *edgep;
int depth;
PATRData * pThis;
{
edgep->iCount = 0;
}

/*****************************************************************************
 * NAME
 *    count_uses
 * ARGUMENTS
 *
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
static void count_uses(edgep, depth, pThis)
PATREdge *edgep;
int depth;
PATRData * pThis;
{
++edgep->iCount;
}

/*****************************************************************************
 * NAME
 *    mark_parse_certainty
 * DESCRIPTION
 *
 * RETURN VALUE
 *    number of parses present
 */
static int mark_parse_certainty(edge_listp, pThis)
PATREdgeList * edge_listp;
PATRData * pThis;
{
int		iParseCount;
PATREdgeList *	pEdge;

if (edge_listp)
	{
	/*  If there was at least one parse, mark all the edges
	 *  found in all parses.
	 */
	visitPATREdges(edge_listp, 1, PATR_POSTORDER, zero_use_count, pThis);
	visitPATREdges(edge_listp, 1, PATR_POSTORDER, count_uses, pThis);
	}
/*
 *  count number of parses present
 */
for ( iParseCount = 0, pEdge = edge_listp ; pEdge ; pEdge = pEdge->pNext )
	{
	++iParseCount;
	}
return iParseCount;
}

/*****************************************************************************
 * NAME
 *    build_parse_list
 * ARGUMENTS
 *    pGrammar_in - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Build list of all full parses of sentence
 * RETURN VALUE
 *
 */
static PATREdgeList * build_parse_list(pGrammar_in, pData)
PATRGrammar * pGrammar_in;
PATRParseData * pData;
{
PATREdgeList *elp;
PATREdgeList *parses = NULL;
PATREdgeList *this;
int parse_count = 0;

/* For all incoming passives on last vertex */
elp = pData->pVertices[pData->iVertexCount].pIncomingPassiveEdges;

while (elp != NULL)
	{
	/* If the edge spans the entire sentence and produces the goal symbol */
	if (    (elp->pEdge->iStart == 0) &&
		(strcmp(elp->pEdge->pszLabel, pGrammar_in->pszStartSymbol) == 0) )
	{
	++parse_count;
	this = allocPATREdgeList(pData->pPATR);
	this->pNext = parses;
	this->pEdge = elp->pEdge;
	parses = this;
	}
	elp = elp->pNext;
	}
return parses;
}

/*****************************************************************************
 * NAME
 *    buildPATRParseBush
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    This routine is called when no parse tree is available for a sentence.
 *    A bush is built by finding the longest component beginning at
 *    the left side of the sentence and making it the leftmost branch
 *    of a bush.  We then go to the place where that component ends
 *    and pick a new longest component adding it as the next branch
 *    of the bush.
 *    Finally a dummy compent with category '?' is added as the root
 *    of the bush.
 *
 * RETURN VALUE
 *
 */
static PATREdgeList * buildPATRParseBush(pData)
PATRParseData * pData;
{
PATREdgeList *	this;
PATREdgeList *	pBush;
PATREdge *	pRoot;
PATREdgeList *	branches = NULL;
PATREdge *	branch;
int		leftpos = 0;

pData->pPATR->iParseCount = 0;
/*
 *  Gather the branches of the bush working from left to right
 */
for ( leftpos = 0 ; leftpos < pData->iVertexCount ; leftpos = branch->iEnd )
	{
	/*
	 *  find next branch
	 */
	branch = find_longest_edge(leftpos, pData);
	if (branch == NULL)
	{
	pData = NULL;
	return NULL;
	}
	/*
	 *  add branch to list of branches
	 */
	this        = allocPATREdgeList(pData->pPATR);
	this->pNext = branches;
	this->pEdge = branch;
	branches    = this;
	}
/*
 *  Make parse list point to the single bush built.
 *  Fill in the attributes of the root of the bush
 */
pBush        = allocPATREdgeList(pData->pPATR);
pRoot        = allocPATREdge(pData->pPATR);
memset(pRoot, 0, sizeof(PATREdge));
pBush->pNext         = NULL;
pBush->pEdge         = pRoot;
pRoot->pszLabel      = PATR_BUSH_ROOT;
pRoot->eType         = PATR_RULE_EDGE;
pRoot->u.r.pChildren = branches;

if (pBush != NULL)
	{
	if (    pData->pPATR->bUnification && !pData->pPATR->bFailure &&
		count_parse_failures(pBush) )
	{
	pBush = NULL;
	pData->pPATR->iParseCount = 0;
	}
	else
	{
	pBush = setPATRResultIndexes(pBush, pData->pPATR);
	pData->pPATR->iParseCount = mark_parse_certainty(pBush, pData->pPATR);
	}
	}
pData = NULL;
return pBush;
}

/*****************************************************************************
 * NAME
 *    find_longest_edge
 * ARGUMENTS
 *
 * DESCRIPTION
 *    Return a pointer to the longest passive edge present which
 *    begins at the passed position.
 *    In the case of ties, the first edge seen is
 *    is returned.  If no such edge is found, returns NULL.
 * RETURN VALUE
 *
 */
static PATREdge * find_longest_edge(leftpos, pData)
int leftpos;    /* left vertex edge must begin with */
PATRParseData * pData;
{
int vert;
PATREdgeList *elp;

/*  Search vertices from right to left so that longest
 *  edge is seen first.
 */
for ( vert = pData->iVertexCount ; vert > leftpos ; --vert )
	{
	elp = pData->pVertices[vert].pIncomingPassiveEdges;
	while (elp != NULL)
	{
	if (elp->pEdge->iStart == leftpos)
		return elp->pEdge;
	elp = elp->pNext;
	}
	}

return NULL;
}

/*****************************************************************************
 * NAME
 *    add_empty_edges
 * DESCRIPTION
 *    add all of the empty edges appropriate for this vertex
 * RETURN VALUE
 *    none
 */
static void add_empty_edges(iVertex_in, pGrammar_in, pszDebugString_in,
				pData)
int		iVertex_in;
PATRGrammar *	pGrammar_in;
char *		pszDebugString_in;
PATRParseData *	pData;
{
PATRRuleList *	pEmptyLC;
PATRRuleList *	pRL;
PATREdge *	pEdge;
int		bEdgeAdded;		/* flag whether any rules added */
int		iRuleAdded[10];		/* reduce need for malloc() */
int *		pRuleAdded;		/* array to mark if rule is added */
int		iNumberOfEmptyRules;	/* total number of empty rules */
int		i;

pEmptyLC = get_lc_list("", pData);
if (pEmptyLC == NULL)
	return;
if (pData->pPATR->iDebugLevel >= 2)
	{
	fprintf(stdout, "ADDING EMPTY EDGES AFTER %s\n", pszDebugString_in);
	show_vertex(&pData->pVertices[iVertex_in], iVertex_in, pGrammar_in,
		pData);
	}
/*
 *  allocate and initialize a set of counters, one for each empty rule
 */
for ( iNumberOfEmptyRules = 0, pRL = pEmptyLC ; pRL ; pRL = pRL->pNext )
	++iNumberOfEmptyRules;
if (iNumberOfEmptyRules <= 10)
	pRuleAdded = iRuleAdded;
else
	pRuleAdded = (int *)allocMemory(iNumberOfEmptyRules * sizeof(int));
for ( i = 0 ; i < iNumberOfEmptyRules ; ++i )
	pRuleAdded[i] = 0;
/*
 *  add empty rules to the chart until no more can be added
 */
do
	{
	bEdgeAdded = FALSE;
	for ( i = 0, pRL = pEmptyLC ; pRL ; pRL = pRL->pNext, ++i )
	{
	if (pRuleAdded[i])
		continue;		/* this rule has been added already */
	pEdge = make_rule_edge(pRL->pRule,
				   pRL->pRule->apszNonterms[0],
				   1,
				   iVertex_in,
				   iVertex_in,
				   pRL->pRule->pUniFeature, pData);
	if (lc_vertex_add_passive_edge(pEdge, pGrammar_in, pData))
		{
		++pRuleAdded[i];
		bEdgeAdded = TRUE;
		}
	}
	} while (bEdgeAdded);

if (pRuleAdded != iRuleAdded)
	freeMemory( pRuleAdded );
if (pData->pPATR->iDebugLevel >= 2)
	{
	fprintf(stdout, "EMPTY EDGES ADDED AFTER %s\n", pszDebugString_in);
	show_vertex(&pData->pVertices[iVertex_in], iVertex_in, pGrammar_in,
		pData);
	}
}

/*----------------------------------------------------------------------------
 * NAME
 *    show_vertex
 * DESCRIPTION
 *    write the given PATRVertex contents to the standard output
 * RETURN VALUE
 *    none
 */
static void show_vertex(pVertex, iVertex_in, pGrammar_in, pData)
PATRVertex *	pVertex;
int		iVertex_in;
PATRGrammar *	pGrammar_in;
PATRParseData *	pData;
{
StringList *	pNT;
PATREdgeList *	pEL;

fprintf(stdout, "Vertex[%d].terminal = \"%s\"\n",
	iVertex_in, pVertex->pszTerminal);
fprintf(stdout, "Vertex[%d].pAllowedNonterms =", iVertex_in);
for ( pNT = pVertex->pAllowedNonterms ; pNT ; pNT = pNT->pNext )
	fprintf(stdout, " %s", pNT->pszString);
fprintf(stdout, "\n");
fprintf(stdout, "Vertex[%d].pIncomingPassiveEdges =\n", iVertex_in);
for ( pEL = pVertex->pIncomingPassiveEdges ; pEL ; pEL = pEL->pNext )
	{
	showPATREdge(pEL->pEdge, pData->pPATR);
	}
fprintf(stdout, "Vertex[%d].pIncomingActiveEdges =\n", iVertex_in);
for ( pEL = pVertex->pIncomingActiveEdges ; pEL ; pEL = pEL->pNext )
	{
	showPATREdge(pEL->pEdge, pData->pPATR);
	}
fprintf(stdout, "--------------------------------------------\n");
}

/*****************************************************************************
 * NAME
 *    showPATREdge
 * DESCRIPTION
 *    Print an edge
 * RETURN VALUE
 *    none
 */
void showPATREdge(edgep, pPATR_in)
PATREdge *	edgep;
PATRData *	pPATR_in;
{
int i;

fprintf(stdout, "%d %d ", edgep->iStart, edgep->iEnd);
if (edgep->eType == PATR_RULE_EDGE)
	{
	for ( i = 0 ; i <= edgep->u.r.pRule->iNontermCount ; i++ )
	{
	fprintf(stdout, "%s ", edgep->u.r.pRule->apszNonterms[i]);
	if (i == 0)
		fprintf(stdout, "-> ");
	if (edgep->u.r.iNext == i+1)
		fprintf(stdout, ". ");
	}
	}
else
	fprintf(stdout, "%s (%s) ", edgep->pszLabel, edgep->u.l.pszTerminal);

fprintf(stdout, "\n");
if (pPATR_in->iDebugLevel >= 2)
	{
	FILE * fp = pPATR_in->pLogFP;
	pPATR_in->pLogFP = NULL;
	fprintf(stdout, "        ");
	writePATRFeatureToLog(edgep->pFeature, 8, FALSE, pPATR_in);
	pPATR_in->pLogFP = fp;
	}
}

/*****************************************************************************
 * NAME
 *    parseWithPATR
 * DESCRIPTION
 *    Parse the sentence as best you can with the given grammar.  If
 *    piStage_out is not NULL, and pPATR_io->bFailure is TRUE, then try
 *    a sequence of alternative approaches to produce some sort of partial
 *    result.
 * RETURN VALUE
 *    pointer to the parse chart constructed, or NULL if parse fails
 *    *piStage_out is set to one of these values:
 *	0 - successful
 *	1 - turned off unification
 *	2 - turned off top-down filtering
 *	3 - can only produce "bushes", not an entire parse tree
 *	4 - failed to produce anything
 *	5 - out of memory
 *	6 - out of time
 */
PATREdgeList * parseWithPATR(pSentence_in, piStage_out, pPATR_io)
PATRWord * pSentence_in;
int *      piStage_out;
PATRData * pPATR_io;
{
PATREdgeList *	parse;
PATRParseData	sData;
void (*		pFunc) P((size_t size));
PATRWord *	pWord;
PATRWordCategory * pWC;


if ((pSentence_in == NULL) || (pPATR_io == NULL))
	{
	if (piStage_out != NULL)
	*piStage_out = 4;
	return NULL;
	}
/*
 *  Put marker in memory allocation trace (if one is being produced).
 */
writeAllocMemoryDebugMsg("BEGIN PARSING SENTENCE:");
for (pWord = pSentence_in; pWord; pWord = pWord->pNext)
	{
	writeAllocMemoryDebugMsg("  %s(", pWord->pszWordName);
	for (pWC = pWord->pCategories; pWC; pWC = pWC->pNext)
	{
	if (pWC != pWord->pCategories)
		writeAllocMemoryDebugMsg(", ");
	writeAllocMemoryDebugMsg("%s", pWC->pszCategory);
	}
	writeAllocMemoryDebugMsg(")");
	}
writeAllocMemoryDebugMsg("\n");

memset(&sData, 0, sizeof(sData));
sData.pPATR = pPATR_io;
if (piStage_out != NULL)
	*piStage_out = 0;
pPATR_io->pStartGarbage = pPATR_io->pMem->pGarbage;
/*
 *  set error handler for memory allocation
 */
pFunc = pfOutOfMemory_g;
pfOutOfMemory_g = parse_too_big;
if (setjmp(sOutOfMemory_m))
	{
	if (pPATR_io->pLogFP)
	{
	fprintf(pPATR_io->pLogFP, "Out of memory after %lu edges\n",
		pPATR_io->uiEdgesAdded);
	}
	writeAllocMemoryDebugMsg("Out of memory after %lu edges\n",
	pPATR_io->uiEdgesAdded);
	pfOutOfMemory_g = pFunc;
	if (piStage_out != NULL)
	*piStage_out = 5;
	cleanupPATRGarbage(pPATR_io->pStartGarbage, pPATR_io);
	freeCollectedPATRGarbage(pPATR_io);
	return NULL;
	}
/*
 *  set up for limiting parse time if desired
 */
pPATR_io->uiEdgesAdded = 0;
if (pPATR_io->iMaxProcTime != 0)
	{
	pPATR_io->iStartTime = time(NULL);
	if (setjmp(sOutOfTime_m))
	{
	if (pPATR_io->pLogFP)
		{
		fprintf(pPATR_io->pLogFP,
			"Out of time after %lu seconds and %lu edges\n",
			pPATR_io->iMaxProcTime + 1, pPATR_io->uiEdgesAdded);
		}
	writeAllocMemoryDebugMsg("Out of time after %lu seconds and %lu edges\n",
		pPATR_io->iMaxProcTime + 1, pPATR_io->uiEdgesAdded);
	pPATR_io->iStartTime = 0;
	if (piStage_out != NULL)
		*piStage_out = 6;
	cleanupPATRGarbage(pPATR_io->pStartGarbage, pPATR_io);
	return NULL;
	}
	}

parse = parse_with_PATR(pSentence_in, &sData);

if ((parse == NULL) && (piStage_out != NULL))
	{
	if (pPATR_io->bFailure)
	{
	if (pPATR_io->bUnification)
		{
		*piStage_out = 1;
		pPATR_io->bUnification = FALSE;
		parse = parse_with_PATR(pSentence_in, &sData);
		pPATR_io->bUnification = TRUE;
		}
	if ((parse == NULL) && pPATR_io->bTopDownFilter)
		{
		*piStage_out = 2;
		pPATR_io->bTopDownFilter = FALSE;
		parse = parse_with_PATR(pSentence_in, &sData);
		pPATR_io->bTopDownFilter = TRUE;
		}
	if (parse == NULL)
		{
		*piStage_out = 3;
		pPATR_io->bFailure = FALSE;
		parse = buildPATRParseBush(&sData);
		pPATR_io->bFailure = TRUE;
		}
	if (parse == NULL)
		*piStage_out = 4;
	}
	else
	*piStage_out = 4;
	}
pPATR_io->pStartGarbage = NULL;
if (sData.pVertices)
	freeMemory(sData.pVertices);
/*
 *  restore original error handler for memory allocation
 */
pfOutOfMemory_g = pFunc;
/*
 *  Put marker in memory allocation trace (if one is being produced).
 */
writeAllocMemoryDebugMsg("DONE PARSING SENTENCE:");
for (pWord = pSentence_in; pWord; pWord = pWord->pNext)
	{
	writeAllocMemoryDebugMsg(" %s(", pWord->pszWordName);
	for (pWC = pWord->pCategories; pWC; pWC = pWC->pNext)
	{
	if (pWC != pWord->pCategories)
		writeAllocMemoryDebugMsg(",");
	writeAllocMemoryDebugMsg("%s", pWC->pszCategory);
	}
	writeAllocMemoryDebugMsg(")");
	}
writeAllocMemoryDebugMsg("  --  parse = 0x%08lx, iStage = %d\n",
	(unsigned long)parse, *piStage_out);

return parse;
}
