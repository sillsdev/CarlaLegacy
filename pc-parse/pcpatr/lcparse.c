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
#include "assert.h"
#include "patr.h"
#include "patrdef.h"
#include "allocmem.h"
#include "rpterror.h"	/* for NumberedMessage and displayNumberedMessage() */
#include "cmd.h"	/* temp fix */

extern int PumpMessages P((void));

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
					 PATREdge * child, char *child_name, PATRParseData * pData, int));
static PATREdge *	hypothesize_lc P((PATRRule * rulep,
					  int vertex,
					  PATRParseData * pData));
static PATREdge *	get_final_empty_node P((PATREdge *edgep));
static void		extend_lc_edge P((PATREdge *    act_edge,
					  PATREdge *    pass_edge,
					  int           end,
					  PATRGrammar * pGrammar_in,
					  PATRParseData * pData));
static PATRFeature* unify_edges P((
					PATREdge* act_edge,
					PATREdge* pass_edge,
					PATREdgeList* act_children,
					PATRFeature* act_dag,
					PATRNonterminal* nterm,
					char* pszLhsName,
					char* pszName,
					int* ok_out,
					int* abort_out,
					PATRParseData* pData));
static int complete_constraints P((
					PATRFeature *pDag,
					PATRRule *pRule,
					PATRData *pPATR));
static void skip_optional_non_terminals P((
					PATREdge* edgep,
					PATREdge* act_edge,
					PATREdge* pass_edge,
					char* pass_name,
					PATRFeature* pDag,
					char* label,
					int iEnd_in,
					int ok,
					int skips,
					PATRParseData* pData));
static PATRFeature* reunify_edges P((
					PATRFeature* pRuleDag,
					PATREdgeList* pChildren,
					char* lhs,
					char* skip_attr,
					int* ok_out,
					PATRParseData* pData));
static PATRFeature * remove_optional_attr P((
						PATRFeature * pDag,
						char * attr,
						PATRData * pData));
static PATRFeature * remove_optional_values P((
						PATRFeature *	pValue,
						PATRFeature * pDag));
static int		count_references P((
						PATRFeature * pValue,
						PATRFeature *	pDag));
static PATRFeature * remove_optional_value P((
						PATRFeature *	pValue,
						PATRFeature * pDag));
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
static int		triplecheck_constraints P((PATREdge * pEdge_in,
						   PATRFeature * pTreeFeats_in,
						   PATRData * pPATR_in));
static int		set_edge_indexes P((PATREdgeList * pel,
					   PATRData * pData));
static void		clear_edge_indexes P((PATREdgeList * pel,
						 PATRData * pData,
						 int iCurrentOld));
static void		set_index P((PATREdge *edgep, int depth,
					PATRData * pThis));
static void		clear_index P((PATREdge *edgep, int depth,
					PATRData * pThis));

static int		doublecheck_constraints P((PATREdge * pEdge_in,
						   PATRFeature * pDag_in,
						   PATRData * pPATR_in));
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
		fprintf(stdout, "Warning: cycle was ignored for edge: %d %d ",
		   pEdge_in->iStart, pEdge_in->iEnd);
		showPATRRule(pEdge_in->u.r.pRule);
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
if (bCancelPATROperation_g || PumpMessages())
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
if (bCancelPATROperation_g || PumpMessages())
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
static void add_child(old_parent, new_parent, child, child_name, pData, skips)
PATREdge * old_parent;
PATREdge * new_parent;
PATREdge * child;
char* child_name;
PATRParseData * pData;
int skips;
{
PATREdgeList *elp;

if (partial_cat_p(child_name))
{
	assert(!new_parent->u.r.pChildren);
	new_parent->u.r.pChildren = child->u.r.pChildren;
	return;
}

/* Allocate space for the pointer to the edge */
elp = allocPATREdgeList(pData->pPATR);
elp->pEdge = child;
elp->pszName = child_name;
elp->iSkips = skips;

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

int edge_count = 0;

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
int			ok;
int			abort;
PATRNonterminal *	nterm;
char *			label;
char *			psz0;
nterm = need_nonterm(act_edge);
psz0 = storedPATRString("0", pData->pPATR);
if (partial_cat_p(pass_edge->pszLabel))
{	/*
	 * Unify the partial edge's dag directly with the active edge's dag.
	 */
	ok = TRUE;
	pDag = unifyPATRFeatures(act_edge->pFeature, pass_edge->pFeature, TRUE, pData->pPATR);
	if (!partial_cat_p(act_edge->pszLabel))
	{
		if (unifyPATRFeatures(findOrAddPATRAttribute(pDag, act_edge->pszLabel, pData->pPATR),
			findOrAddPATRAttribute(pDag, psz0, pData->pPATR),
			FALSE, pData->pPATR) == NULL)
		{
			ok = FALSE;
		}
	}
	label = act_edge->pszLabel;
	edgep = make_rule_edge(act_edge->u.r.pRule,
		label,
		act_edge->u.r.iNext + 1,
		act_edge->iStart,
		iEnd_in,
		pDag, pData);
	/*
	 *  Link the new edge into its parent.
	 */
	add_child(act_edge, edgep, pass_edge, nterm->pszName, pData, 0);
	/*
	 * Now add it either as an active or passive edge, depending on the need index.
	 */
	if (complete_edge_p(edgep))
	{
		ok = complete_constraints(edgep->pFeature, edgep->u.r.pRule, pData->pPATR);
		if (!ok)
		{
			if (pData->pPATR->bUnification)
			{
				return;
			}
			edgep->bFailed = TRUE;
		}
		lc_vertex_add_passive_edge(edgep, pData->pPATR->pGrammar, pData);
	}
	else
	{
		skip_optional_non_terminals(edgep, act_edge, pass_edge, nterm->pszName, pDag, label, iEnd_in, ok, 0, pData);
		lc_vertex_add_active_edge(edgep, pData->pPATR->pGrammar, pData);
	}
	return;
}
/*
 * First check if these edges successfully unify,
 * continue only if they do
 */
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
if (!act_edge->bFailed)
	{
	pDag = unify_edges(act_edge, pass_edge, act_edge->u.r.pChildren, act_edge->pFeature, nterm,
		nterm->pszLhsName, nterm->pszName, &ok, &abort, pData);
	if (abort)
	{
		return;
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
add_child(act_edge,edgep,pass_edge, nterm->pszName, pData, 0);
/*
 * Now add it either as an active or passive edge, depending on the need index
 */
if ( complete_edge_p(edgep) )
{
	lc_vertex_add_passive_edge(edgep, pData->pPATR->pGrammar, pData);
} 
else
{
	skip_optional_non_terminals(edgep, act_edge, pass_edge, nterm->pszName, pDag, label, iEnd_in, ok, 0, pData);
	lc_vertex_add_active_edge(edgep, pData->pPATR->pGrammar, pData);
}
}

/*****************************************************************************
 * NAME
 *    unify_edges
 * ARGUMENTS
 *    act_edge - active edge (if NULL, uses act_dag)
 *    pass_edge - passive edge
 *    act_children - same as act_edge->u.r.pChildren
 *    act_dag - same as act_edge->pFeatures
 *    nterm - non-terminal
 *    pszLhsName - lhs name of non-terminal
 *    pszName - name of non-terminal
 *    ok_out - return value for ok
 *	  abort_out - return value for abort
 *    pData - parse data
 *
 * DESCRIPTION
 *    Unify the features associated with act_edge and pass_edge.
 * RETURN VALUE
 *    PATRFeature*
 */
PATRFeature* unify_edges(act_edge, pass_edge, act_children, act_dag,
	nterm, pszLhsName, pszName, ok_out, abort_out, pData)
PATREdge* act_edge;
PATREdge* pass_edge;
PATREdgeList* act_children;
PATRFeature* act_dag;
PATRNonterminal* nterm;
char* pszLhsName;
char* pszName;
int* ok_out;
int* abort_out;
PATRParseData* pData;
{
	PATRFeature* pDag;
	PATRFeature* pDag1;
	PATRFeature* pDag2;
	PATRFeature* pUniDag;
	int			ok = TRUE;
	char* psz0;
	PATRFeature* pFeat1;
	PATRFeature* pFeat2;
	StringList* pPath1;
	StringList* pPath2;
	StringList* pPath;
	StringList* pNextPath = NULL;
	char* psz1;
	char* psz2;
	if (!pData->pPATR->bUnification && !pData->pPATR->bFailure)
	{
		*ok_out = ok;
		*abort_out = FALSE;
		return act_dag;
	}
	markPATRGarbage(PATR_GARBAGE_UNIFY, pData->pPATR);
	if (nterm && nterm->pFeature)
	{
		/* Add optional constraints. */
		act_dag = unifyPATRFeatures(act_dag, nterm->pFeature, TRUE, pData->pPATR);
	}
	psz0 = storedPATRString("0", pData->pPATR);
	pDag1 = findPATRAttribute(act_dag, pszName);
	if (pass_edge->eType == PATR_RULE_EDGE)
		pDag2 = findOrAddPATRAttribute(pass_edge->pFeature, psz0, pData->pPATR);
	else
		pDag2 = pass_edge->pFeature;

	if (pDag2 == NULL)
		pUniDag = NULL;
	else if (pDag1 == NULL)
		pUniDag = copyPATRFeature(pDag2, pData->pPATR);
	else
		pUniDag = unifyPATRFeatures(pDag1, pDag2, TRUE, pData->pPATR);

	if (pUniDag == NULL)
	{
		ok = FALSE;
		if (!pData->pPATR->bUnification &&
			pData->pPATR->bFailure &&
			(pDag1 != NULL) &&
			(pDag2 != NULL))
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
				pDag = copyPATRFeature(act_dag, pData->pPATR);
				unifyPATRFeatures(findOrAddPATRAttribute(pDag,
					pszLhsName,
					pData->pPATR),
					findOrAddPATRAttribute(pDag, psz0,
						pData->pPATR),
					FALSE,
					pData->pPATR);
				/*
				 *  find the bad feature in the copied structure
				 */
				pDag1 = findPATRAttribute(pDag, pszName);
				for (pPath = pPath1; pPath; pPath = pPath->pNext)
					pDag1 = findPATRAttribute(pDag1, pPath->pszString);
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
				for (pPath = pPath2; pPath; pPath = pNextPath)
				{
					pNextPath = pPath->pNext;
					deallocatePATRFeaturePath(pPath, pData->pPATR);
				}
				for (pPath = pPath1; pPath; pPath = pNextPath)
				{
					pNextPath = pPath->pNext;
					deallocatePATRFeaturePath(pPath, pData->pPATR);
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
		pDag = copyPATRFeature(act_dag, pData->pPATR);
		/*
		 *  must unify, instead of assign, in order to handle shared
		 *  nodes in the graph  (we know this always succeeds, since it
		 *  already has unified!)
		 */
		pDag1 = findOrAddPATRAttribute(pDag, pszName, pData->pPATR);
		unifyPATRFeatures(pDag1, pUniDag, FALSE, pData->pPATR);
		/*
		 *  unify lhs features with 0 path
		 */
		ok = TRUE;
		if (!partial_cat_p(pszLhsName))
		{
			if (unifyPATRFeatures(findOrAddPATRAttribute(pDag, pszLhsName, pData->pPATR),
				findOrAddPATRAttribute(pDag, psz0, pData->pPATR),
				FALSE, pData->pPATR) == NULL)
			{
				ok = FALSE;
			}
		}
		if (ok && act_edge &&
			(act_edge->eType == PATR_RULE_EDGE) &&
			(act_edge->u.r.pRule->iNontermCount == act_edge->u.r.iNext))
		{
			ok = complete_constraints(pDag, act_edge->u.r.pRule, pData->pPATR);
		}
	}
	/*
	 *  allow the caller to kill us asynchronously, and to see our progress
	 */
	if (bCancelPATROperation_g || PumpMessages())
	{
		collectPATRGarbage(PATR_GARBAGE_UNIFY, pData->pPATR);
		longjmp(sCancelPoint_m, 1);
	}
	++pData->uiProgressCount;
	if ((pData->uiProgressCount % 10) == 0)
	{
		reportProgress(pData->uiProgressCount);
	}
	if (!ok && pData->pPATR->bUnification)
	{
		collectPATRGarbage(PATR_GARBAGE_UNIFY, pData->pPATR);
		*ok_out = ok;
		*abort_out = TRUE;
		return NULL;
	}
	unmarkPATRGarbage(PATR_GARBAGE_UNIFY, pData->pPATR);
	/*
	 * Preserve rule dag for reunification.
	 */
	if (pDag)
	{
		if (act_children)
		{
			pDag->pFirstFeat = act_dag->pFirstFeat;
		}
		else
		{
			pDag->pFirstFeat = act_dag;
		}
		
	}
	*ok_out = ok;
	*abort_out = FALSE;
	return pDag;
}

static int equal_dags(PATRFeature* pDag1, PATRFeature* pDag2)
{
	if (pDag1 == pDag2)
	{
		return TRUE;
	}
	if (!pDag1 || !pDag2)
	{
		return FALSE;
	}
	pDag1 = followPATRForwardPointers(pDag1);
	pDag2 = followPATRForwardPointers(pDag2);
	if (pDag1->eType != pDag2->eType)
	{
		return FALSE;
	}
	if (pDag1->eType == PATR_ATOM || pDag1->eType == PATR_DEFATOM)
	{
		if (pDag1->u.pszAtom != pDag2->u.pszAtom)
		{
			return FALSE;
		}
		return TRUE;
	}
	if (pDag1->eType == PATR_COMPLEX)
	{
		PATRComplexFeature* flist1;
		PATRComplexFeature* flist2;
		int count1 = 0;
		int count2 = 0;
		for (flist1 = pDag1->u.pComplex; flist1; flist1 = flist1->pNext) count1++;
		for (flist2 = pDag2->u.pComplex; flist2; flist2 = flist2->pNext) count2++;
		if (count1 != count2)
		{
			return FALSE;
		}
		for (flist1 = pDag1->u.pComplex; flist1; flist1 = flist1->pNext)
		{
			int found = FALSE;
			for (flist2 = pDag2->u.pComplex; flist2; flist2 = flist2->pNext)
			{
				if (flist1->pszLabel == flist2->pszLabel)
				{
					if (!equal_dags(flist1->pValue, flist2->pValue))
					{
						return FALSE;
					}
					found = TRUE;
					break;
				}
			}
			if (!found)
			{
				return FALSE;
			}
		}
		return TRUE;
	}
	if (pDag1->eType == PATR_NULLFS || pDag1->eType == PATR_FAILFS)
	{
		return TRUE;
	}
	return FALSE;
}

/*****************************************************************************
 * NAME
 *    optional_link_complexity
 * ARGUMENTS
 *    pRuleDag - the DAG from the rule
 *    optional_attr
 * DESCRIPTION
 *    Determine the complexity of the optional links in pRuleDag.
 * RETURN VALUE
 *    int
 */
int optional_link_complexity(PATRFeature* pRuleDag, char *optional_attr)
{
	if (!pRuleDag) return 0;
	if (!pRuleDag->pFirstFeat && !pRuleDag->pSecondFeat)
	{
		assert(pRuleDag->eType == PATR_COMPLEX);
		PATRComplexFeature* flist;
		for (flist = pRuleDag->u.pComplex->pNext; flist; flist = flist->pNext)
		{
			if (flist->pszLabel == optional_attr)
			{
				if (pRuleDag->u.pComplex->pNext)
				{
					// <optional_attr ...> = <...>
					return 1;
				}
				// <optional_attr ...> = constant
				return 0;
			}
		}
		return 0;
	}
	return optional_link_complexity(pRuleDag->pFirstFeat, optional_attr) +
		optional_link_complexity(pRuleDag->pSecondFeat, optional_attr);

}

/*****************************************************************************
 * NAME
 *    skip_optional_non_terminals
 * ARGUMENTS
 *    edgep - the source of optional edges
 *    act_edge - the active edge
 *    pass_edge - the passive edge
 *    pDag - the feature structure
 *    label -
 *    iEnd_in - the end point
 *    ok - whether unification succeeded
 *    skips - how many skips so far
 *    pData - parse data
 * DESCRIPTION
 *    Skips optional non-terminals in edgep.
 * RETURN VALUE
 *    none
 */
static void skip_optional_non_terminals(edgep, act_edge, pass_edge, pass_name, pDag, label, iEnd_in, ok, skips, pData)
PATREdge* edgep;
PATREdge* act_edge;
PATREdge* pass_edge;
char * pass_name;
PATRFeature* pDag;
char* label;
int iEnd_in;
int ok;
int skips;
PATRParseData* pData;
{
	PATRNonterminal* nonterm;
	/*
	 * Skip the next non-terminals if they are optional.
	 */
	nonterm = need_nonterm(edgep);
	if (nonterm && nonterm->bOptional)
	{
		char* attr = need_nonterm(edgep)->pszName;
		if (FALSE)
		{
		PATRFeature* pRuleDag = pDag->pFirstFeat;
		if (optional_link_complexity(pRuleDag, attr) < 2)
		{
			/* This is quicker, but only works for simple constraints. */
			pDag = remove_optional_attr(pDag, attr, pData->pPATR);
		}
		else
		{
			/* Redo the unification to get the right results. */
			int ok2;
			pDag = reunify_edges(pRuleDag, edgep->u.r.pChildren, edgep->pszLabel, attr, &ok2, pData);
			assert(ok2 == ok);
		}
		}
		edgep = make_rule_edge(edgep->u.r.pRule,
			label,
			edgep->u.r.iNext + 1,
			edgep->iStart,
			iEnd_in,
			pDag, pData);
		if (!ok)
			edgep->bFailed = TRUE;
		add_child(act_edge, edgep, pass_edge, pass_name, pData, skips);
		skips++;
		/* Recurse first so that shortest rules are processed first. */
		skip_optional_non_terminals(edgep, act_edge, pass_edge, pass_name, pDag, label, iEnd_in, ok, skips, pData);
		/* The following code is copied from extend_lc_edge. */
		if (complete_edge_p(edgep))
		{
			ok = complete_constraints(pDag, edgep->u.r.pRule, pData->pPATR);
			if (!ok)
			{
				if (pData->pPATR->bUnification)
				{
					// collectPATRGarbage(PATR_GARBAGE_UNIFY, pData->pPATR);
					return;
				}
				edgep->bFailed = TRUE;
			}
			lc_vertex_add_passive_edge(edgep, pData->pPATR->pGrammar, pData);
		}
		else
		{
			lc_vertex_add_active_edge(edgep, pData->pPATR->pGrammar, pData);
		}
	}
}

/*****************************************************************************
 * NAME
 *    reunify_edges
 * ARGUMENTS
 *    pRuleDag - rule features to reunify
 *    pChildren - children to reunify
 *    lhs - left-hand side of rule
 *    skip_attr - attr to skip
 *    ok_out - whether the unification was OK
 *    pData - parse data
 *    
 * DESCRIPTION
 *    Reunify active_edges starting with edgep and skipping skip_attr.
 * RETURN VALUE
 *    PATRFeature*
 */
static PATRFeature* reunify_edges(pRuleDag, pChildren, lhs, skip_attr, ok_out, pData)
PATRFeature* pRuleDag;
PATREdgeList* pChildren;
char* lhs;
char* skip_attr;
int* ok_out;
PATRParseData* pData;
{
PATRFeature* pActiveDag;
PATRFeature* pDag;
int abort;
if (!pChildren)
{
	*ok_out = TRUE;
	return skip_optional_attr(pRuleDag, skip_attr, TRUE, pData->pPATR);
}
pActiveDag = reunify_edges(pRuleDag, pChildren->pNext, lhs, skip_attr, ok_out, pData);
if (*ok_out == FALSE)
{
	return pActiveDag;
}
pDag = unify_edges(NULL, pChildren->pEdge, pChildren->pNext, pActiveDag,
	NULL, lhs, pChildren->pszName, ok_out, &abort, pData);
assert(!abort);
return pDag;
}

/*****************************************************************************
 * NAME
 *    complete_constraints
 * ARGUMENTS
 *    edgep -
 * DESCRIPTION
 *    Apply priority unions and constraints from rule to complete constraints.
 * RETURN VALUE
 *    boolean
 */
static int complete_constraints(pDag, pRule, pPATR)
PATRFeature *pDag;
PATRRule *pRule;
PATRData *pPATR;
{
PATRPriorityUnion * pUnion;
PATRConstraint *    pConstraint;
int ok = TRUE;
/*
 *  apply each priority union in turn
 */
for (	pUnion = pRule->pPriorityUnions ;
	ok && pUnion ;
	pUnion = pUnion->pNext )
	{
	applyPATRPriorityUnion(pDag, pUnion, pPATR);
	ok = verifyAcyclicPATRFeature(pDag);
	}
/*
 *  if any constraint fails, ok = FALSE
 */
for (   pConstraint = pRule->pConstraints ;
	ok && pConstraint ;
	pConstraint = pConstraint->pNext )
	{
	ok = applyPATRConstraint(pDag, pConstraint, pPATR);
	}
return ok;
}

/*****************************************************************************
 * NAME
 *    remove_optional_attr
 * ARGUMENTS
 *    pDag - feature structure
 *    attr - attribute
 *    pThis - PATR data
 * DESCRIPTION
 *    Remove an optional attribute from the feature structure.
 * RETURN VALUE
 *    PATRFeature *
 */
PATRFeature *remove_optional_attr(pDag, attr, pData)
PATRFeature *	pDag;
char * attr;
PATRData * pData;
{
PATRComplexFeature *flist;
PATRComplexFeature *prior = NULL;
int references;

pDag  = copyPATRFeature(pDag, pData); /* Avoid cross-talk. */
/* Remove attr from pDag. */
for (flist = pDag->u.pComplex ; flist ; flist = flist->pNext)
{
	if (strcmp(flist->pszLabel, attr) == 0)
		{
		if (prior == NULL)
			pDag->u.pComplex = flist->pNext;
		else
			prior->pNext = flist->pNext;
		break;
		}
	prior = flist;
}
if (!flist) {
	/* Attribute does not exists. */
	/* (There were no constraints for the non-terminal in the rule.) */
	return pDag;
}
/* Remove attr's values from pDag if they doesn't occur anywhere else. */
references = count_references(flist->pValue, pDag);
if (references == 1) {
	remove_optional_value(flist->pValue, pDag);
}
return pDag;
}

/*****************************************************************************
 * NAME
 *    remove_optional_values
 * ARGUMENTS
 *    pValue - value to remove from
 *    pDag - feature structure
 * DESCRIPTION
 *    Remove optional values within value from the feature structure.
 * RETURN VALUE
 *    PATRFeature - the container of pValue if it was removed
 */
static PATRFeature * remove_optional_values(pValue, pDag)
PATRFeature *	pDag;
PATRFeature * pValue;
{
PATRComplexFeature *flist;
pValue = followPATRForwardPointers( pValue );
if (pValue->eType == PATR_COMPLEX) {
	for (flist = pValue->u.pComplex ; flist ; flist = flist->pNext)
	{
	remove_optional_values(flist->pValue, pDag);
	}
	if (!pValue->u.pComplex) {
		pValue->eType = PATR_NULLFS;
	}
}
if (pValue->eType == PATR_NULLFS)
{
	int references = count_references(pValue, pDag);
	if (references == 1)
	{
		return remove_optional_value(pValue, pDag);
	}
}
return NULL;
}

/*****************************************************************************
 * NAME
 *    count_references
 * ARGUMENTS
 *    value - value
 *    pDag - feature structure
 * DESCRIPTION
 *    Count references to value in pDag.
 * RETURN VALUE
 *    int
 */
static int count_references(pValue, pDag)
PATRFeature * pValue;
PATRFeature *	pDag;
{
pValue = followPATRForwardPointers( pDag );
if (pDag == pValue) {
	return 1;
}

if (pDag->eType == PATR_COMPLEX) {
	PATRComplexFeature *flist;
	int references = 0;
	/* Recursively count references to pValue. */
	for (flist = pDag->u.pComplex ; flist ; flist = flist->pNext)
	{
	references += count_references(pValue, flist->pValue);
	}
	return references;
}

return 0;
}

/*****************************************************************************
 * NAME
 *    remove_optional_value
 * ARGUMENTS
 *    pValue - value to remove
 *    pDag - feature structure
 * DESCRIPTION
 *    Remove an optional value from the feature structure.
 * RETURN VALUE
 *    PATRFeature - the container of the value removed.
 */
static PATRFeature *remove_optional_value(pValue, pDag)
PATRFeature *	pDag;
PATRFeature * pValue;
{
PATRComplexFeature *flist;
PATRComplexFeature *prior = NULL;
PATRFeature * pValue2;
PATRFeature * pContainer;

pValue = followPATRForwardPointers( pValue );
if (pDag->eType != PATR_COMPLEX) {
	return NULL;
}

/* Remove value from pDag. */
for (flist = pDag->u.pComplex ; flist ; flist = flist->pNext)
{
	/* Check for pValue. */
	pValue2 = followPATRForwardPointers( flist->pValue );
	if (pValue2 == pValue)
		{
		if (prior == NULL)
			pDag->u.pComplex = flist->pNext;
		else
			prior->pNext = flist->pNext;
		return pDag;
		}
	/* Check for pValue recursively. */
	pContainer = remove_optional_value(pValue, pValue2);
	if (pContainer)
		return pContainer;
	prior = flist;
}
return NULL;
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
longjmp(sOutOfMemory_m, uiRequest_in ? (int)uiRequest_in : 1);
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
 *    triplecheck_constraints
 * DESCRIPTION
 *    Recursively run down the parse tree, checking all logical constraints at
 *    each edge.  First we have to find the right feature from the collection
 *    of features.
 * RETURN VALUE
 *    true if all constraints are always satisfied, otherwise false.
 */
static int triplecheck_constraints(pEdge_in, pTreeFeats_in, pPATR_in)
PATREdge * pEdge_in;
PATRFeature * pTreeFeats_in;
PATRData * pPATR_in;
{
int ok = TRUE;
if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	int bFailed = failedPATRParse(pEdge_in);
	if (!bFailed && pTreeFeats_in != NULL)
	{
	PATREdgeList * pel;
	PATRConstraint * pConstraint;
	PATRComplexFeature * pcf;
	PATRFeature * pf = NULL;
	PATRDisplayedFeature * pSaveMultTop = pPATR_in->pMem->pMultTop;
	int bCorefChecked = FALSE;

	for (pcf = pTreeFeats_in->u.pComplex ; pcf ; pcf = pcf->pNext)
		{
		if (pcf->pszLabel == (char *)pEdge_in->iIndex)
		{
		pf = pcf->pValue;
		break;
		}
		}
	if (pf == NULL)
		{
		pf = findPATRAttribute(pEdge_in->pFeature,
				   storedPATRString("0", pPATR_in));
		if (pf != NULL)
		{
		markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		checkPATRFeatureCoreferences(pf, pPATR_in);
		bCorefChecked = TRUE;
		}
		}
	for (   pConstraint = pEdge_in->u.r.pRule->pConstraints ;
		ok && pConstraint ;
		pConstraint = pConstraint->pNext )
		{
		/* only check constraints that are for the mother node;
		 * these are the only ones where the feature may have changed
		 * and therefore are the only ones that need to be
		 * double checked */
		if (    pEdge_in->pszLabel &&
			pConstraint->pPath &&
			streq(pEdge_in->pszLabel, pConstraint->pPath->pszString))
		{
		/*
		  the feature (*pf) is already one link on the path in, so wrap the feature
		  appropriately. (I hate kludges like this!)
		*/
		PATRComplexFeature sComplex;
		PATRFeature sFeat;
		sComplex.pszLabel = pEdge_in->pszLabel;
		sComplex.pValue = pf;
		sComplex.pNext = NULL;
		sFeat.eType = PATR_COMPLEX;
		sFeat.u.pComplex = &sComplex;
		if (pPATR_in->iDebugLevel >= 2)
			{
			fprintf(stdout, "DEBUG: triplecheck_constraints(...): edge index = %zu\n", pEdge_in->iIndex);
			fprintf(stdout, "pEdge->pszLabel = \"%s\" (rule = \"%s\")\n",
				pEdge_in->pszLabel ? pEdge_in->pszLabel : "{NULL}",
				pEdge_in->u.r.pRule->pszID ? pEdge_in->u.r.pRule->pszID : "{NULL}");
			fprintf(stdout, "pTreeFeat = ");
			writePATRFeature(&sFeat, stdout, 12, pPATR_in);
			fprintf(stdout, "\n");
			}
		ok = applyPATRConstraint(&sFeat, pConstraint, pPATR_in);
		}
		}
	for (pel = pEdge_in->u.r.pChildren ; ok && pel ; pel = pel->pNext)
		ok = triplecheck_constraints(pel->pEdge, pTreeFeats_in, pPATR_in);

	if (bCorefChecked)
		{
		collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		pPATR_in->pMem->pMultTop = pSaveMultTop;
		}
	}
	}
return ok;
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
static int doublecheck_constraints(pEdge_in, pDag_in, pPATR_in)
PATREdge * pEdge_in;
PATRFeature * pDag_in;
PATRData * pPATR_in;
{
if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	PATREdgeList * pel;
	PATRConstraint * pConstraint;

	if (pPATR_in->iDebugLevel >= 2)
	{
	fprintf(stdout, "DEBUG: doublecheck_constraints(pEdge, pData)\n");
	fprintf(stdout, "pEdge->pszLabel = \"%s\" (rule = \"%s\")\n",
		pEdge_in->pszLabel ? pEdge_in->pszLabel : "{NULL}",
		pEdge_in->u.r.pRule->pszID ? pEdge_in->u.r.pRule->pszID : "{NULL}");
	fprintf(stdout, "pEdge_in->pFeature = ");
	writePATRFeature(pEdge_in->pFeature, stdout, 12, pPATR_in);
	fprintf(stdout, "\npDag_in = ");
	writePATRFeature(pDag_in, stdout, 12, pPATR_in);
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
		if (!applyPATRConstraint(pDag_in, pConstraint, pPATR_in))
		  return FALSE;
		}
#else  /* hab138 */
	if (!applyPATRConstraint(pDag_in, pConstraint, pPATR_in))
		return FALSE;
#endif /* hab138 */
	}
	for ( pel = pEdge_in->u.r.pChildren ; pel ; pel = pel->pNext )
	{
	if (!doublecheck_constraints(pel->pEdge, pEdge_in->pFeature, pPATR_in))
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
	cleanupPATRGarbage(pData->pPATR->pStartGarbage, pData->pPATR);
	pData->uiProgressCount = 0L;
	pData = NULL;
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
 *    clear_index
 * ARGUMENTS
 *    edgep -
 *    depth -
 *    pThis -
 * DESCRIPTION
 *    This routine (when called by the standard tree visiting iterator over all
 *    the edges in a parse) clears the indices of all edges used in the parse.
 * RETURN VALUE
 *    none
 */
static void set_index(edgep, depth, pThis)
PATREdge *edgep;
int depth;
PATRData * pThis;
{
if (edgep->iIndex == 0 && !partial_cat_p(edgep->pszLabel))    /* if index not yet assigned */
	edgep->iIndex = ++pThis->pMem->iCurrent;   /* assign next value */
}

/*****************************************************************************
 * NAME
 *    set_edge_indexes
 * ARGUMENTS
 *    pel -
 *    pData -
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
static int set_edge_indexes(pel, pData)
PATREdgeList * pel;
PATRData * pData;
{
	int iCurrentOld = pData->pMem->iCurrent;
	pData->pMem->iCurrent = 0;
	visitPATREdges(pel, 1, PATR_PREORDER, set_index, pData);
	pData->iCurrentIndex = pData->pMem->iCurrent;
	return iCurrentOld;
}

/*****************************************************************************
 * NAME
 *    set_index
 * ARGUMENTS
 *    edgep -
 *    depth -
 *    pThis -
 * DESCRIPTION
 *    This routine (when called by the standard tree visiting iterator
 *    over all the edges in a parse) assigns unique consecutive indices
 *    to all edges used in the parse.  POSTORDER visiting is used to
 *    guarantee that the index of a parent is always greater than the
 *    index of its children.
 * RETURN VALUE
 *    none
 */
static void clear_index(edgep, depth, pThis)
PATREdge *edgep;
int depth;
PATRData * pThis;
{
edgep->iIndex = 0;
}

/*****************************************************************************
 * NAME
 *    clear_edge_indexes
 * ARGUMENTS
 *    pel -
 *    pData -
 *    iCurrentOld -
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
static void clear_edge_indexes(PATREdgeList * pel, PATRData * pData, int iCurrentOld)
{
	visitPATREdges(pel, 1, PATR_PREORDER, clear_index, pData);
	pData->pMem->iCurrent = iCurrentOld;
	pData->iCurrentIndex = iCurrentOld;
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
PATREdgeList * elp;
PATREdgeList * pParses = NULL;
PATREdgeList * pNewParse;
int parse_count = 0;

/* For all incoming passives on last vertex */
elp = pData->pVertices[pData->iVertexCount].pIncomingPassiveEdges;

while (elp != NULL)
	{
	/* If the edge spans the entire sentence and produces the goal symbol */
	if (    (elp->pEdge->iStart == 0) &&
		(strcmp(elp->pEdge->pszLabel, pGrammar_in->pszStartSymbol) == 0) )
	{
	int ok = doublecheck_constraints(elp->pEdge, elp->pEdge->pFeature,
					 pData->pPATR);
	if (ok)
		{
		PATRFeature * pParseFeatures;
		if (!failedPATRParse(elp->pEdge) && (elp->pEdge->pFeature != NULL))
		{
		int iCurrentOrig = set_edge_indexes(elp, pData->pPATR);
		markPATRGarbage(PATR_GARBAGE_DISPLAY, pData->pPATR);
		pParseFeatures = unifyPATRParseTreeFeatures(elp->pEdge,
								NULL, pData->pPATR);
		resetPATRFeatureCoreferenceCheck(pData->pPATR);
		checkPATRFeatureCoreferences(pParseFeatures, pData->pPATR);
		ok = triplecheck_constraints(elp->pEdge, pParseFeatures,
						 pData->pPATR);
		resetPATRFeatureCoreferenceCheck(pData->pPATR);
		collectPATRGarbage(PATR_GARBAGE_DISPLAY, pData->pPATR);
		clear_edge_indexes(elp, pData->pPATR, iCurrentOrig);
		}
		}
	if (ok)
		{
		++parse_count;
		pNewParse = allocPATREdgeList(pData->pPATR);
		pNewParse->pNext = pParses;
		pNewParse->pEdge = elp->pEdge;
		pParses = pNewParse;
		if (pData->pPATR->bRecognizeOnly && !pData->pPATR->bFailure &&
		(!pData->pPATR->bUnification ||
			(pData->pPATR->bUnification &&
			 !count_parse_failures(pParses))))
			{
		/* one successful parse is enough */
		break;
		}
		}
	}
	elp = elp->pNext;
	}
return pParses;
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
fprintf(stdout, "%d %d ", edgep->iStart, edgep->iEnd);
if (edgep->eType == PATR_RULE_EDGE)
	{
	showPATRRule(edgep->u.r.pRule);
	}
else
	fprintf(stdout, "%s (%s) \n", edgep->pszLabel, edgep->u.l.pszTerminal);

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
			(unsigned long)pPATR_io->iMaxProcTime + 1, pPATR_io->uiEdgesAdded);
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
writeAllocMemoryDebugMsg("  --  parse = %p, iStage = %d\n",
	parse, *piStage_out);

return parse;
}
