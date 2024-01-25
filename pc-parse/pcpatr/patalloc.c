/* PATALLOC.C - memory allocation functions used by SIL-PATR
 *****************************************************************************
 *
 * void	markPATRGarbage(int eGarbageType_in, PATRData * pPATR_io)
 * void	collectPATRGarbage(int eGarbageType_in, PATRData * pPATR_io)
 * void	unmarkPATRGarbage(int eGarbageType_in, PATRData * pPATR_io)
 * void	freeCollectedPATRGarbage(PATRData * pThis)
 * void	cleanupPATRGarbage(PATRGarbage * pGarbage_in, PATRData * pThis)
 *
 * PATRDisplayedFeature *   allocPATRDisplayedFeature(PATRData * pPATR_io)
 * PATRNonterminal *        allocPATRNonterminal(PATRData * pPATR_io)
 * PATRComplexFeature *     allocPATRComplexFeature(PATRData * pPATR_io)
 * PATRFeatureDisjunction * allocPATRFeatureDisjunction(PATRData * pPATR_io)
 * PATRRule *               allocPATRRule(PATRData * pPATR_io)
 * PATRRuleList *           allocPATRRuleList(PATRData * pPATR_io)
 * StringList *             allocPATRNontermList(PATRData * pPATR_io)
 * StringList *             allocPATRFeaturePath(PATRData * pPATR_io)
 * void deallocatePATRFeaturePath(StringList * pDefunct_io,
 *                                PATRData * pPATR_io)
 * PATRHashList *           allocPATRHashList(PATRData * pPATR_io)
 * PATREdge *               allocPATREdge(PATRData * pPATR_io)
 * PATREdgeList *           allocPATREdgeList(PATRData * pPATR_io)
 * char *                   allocPATRStringBuffer(int iLength_in,
 *                                                PATRData * pPATR_io)
 * PATRWord *               allocPATRWord(PATRData * pPATR_io)
 * PATRWordCategory *       allocPATRWordCategory(PATRData * pPATR_io)
 * PATRFeature *            allocPATRFeature(PATRData * pPATR_io)
 * char *                   allocPATRStringCopy(char * pszString_in,
 *                                              PATRData * pPATR_io)
 *
 *****************************************************************************
 * Copyright 1989, 1999 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
#include "allocmem.h"

#ifdef applec
#pragma segment S_patalloc
#endif

static PATRFeature *	    store_patr_feature P((PATRFeature * fp,
						  PATRData * pThis));
static PATRComplexFeature * store_featlist P((PATRComplexFeature * fp,
						  PATRData * pThis));
static void		    free_patr_feature P((PATRFeature * fp,
						 PATRData * pThis));
static void		    free_featlist P((PATRComplexFeature * fp,
						 PATRData * pThis));
static PATRGarbage *	    new_garbage P((int which, PATRMemory * pMem));

/*****************************************************************************
 * NAME
 *    PATRAllocFeature
 *    PATRAllocComplexFeature
 *    PATRAllocFeatureDisjunction
 *    PATRAllocRule
 *    PATRAllocRuleList
 *    PATRAllocNonterminal
 *    PATRAllocStringList
 *    PATRAllocPath
 *    PATRAllocHashList
 *    PATRAllocEdge
 *    PATRAllocEdgeList
 *    PATRAllocWord
 *    PATRAllocWordCategory
 *    PATRAllocDisplayedFeature
 *    PATRAllocString
 *    PATRGarbage
 * DESCRIPTION
 *    pseudo garbage collection data structures
 */
struct patr_alloc_feature
	{				/* A list of copied nodes */
	struct patr_alloc_feature *link;	/* List link */
	PATRFeature	node;	/* Node */
	};
struct patr_alloc_complex
	{				/* A list of copied nodes */
	struct patr_alloc_complex *link;	/* List link */
	PATRComplexFeature	node;	/* Node */
	};
struct patr_alloc_disjunct
	{					/* A list of copied nodes */
	struct patr_alloc_disjunct *	link;	/* List link */
	PATRFeatureDisjunction	node;	/* Node */
	};
struct patr_alloc_rule
	{
	struct patr_alloc_rule *link;
	PATRRule node;
	};
struct patr_alloc_rule_list
	{
	struct patr_alloc_rule_list *link;
	PATRRuleList node;
	};
struct patr_alloc_nonterm
	{
	struct patr_alloc_nonterm *link;
	PATRNonterminal node;
	};
struct patr_alloc_nonterm_list
	{
	struct patr_alloc_nonterm_list *link;
	StringList node;
	};
struct patr_alloc_path
	{
	struct patr_alloc_path *link;
	StringList node;
	};
struct patr_alloc_hash_list
	{
	struct patr_alloc_hash_list *link;
	PATRHashList node;
	};
struct patr_alloc_edge
	{
	struct patr_alloc_edge *link;
	PATREdge node;
	};
struct patr_alloc_edge_list
	{
	struct patr_alloc_edge_list *link;
	PATREdgeList node;
	};
struct patr_allow_word
	{
	struct patr_allow_word *link;
	PATRWord node;
	};
struct patr_allow_categ
	{
	struct patr_allow_categ *link;
	PATRWordCategory node;
	};
struct patr_alloc_disp_feat
	{
	struct patr_alloc_disp_feat *link;
	PATRDisplayedFeature node;
	};
struct patr_alloc_string
	{
	struct patr_alloc_string *link;
	char *node;
	} ;

/****************************************************************************
 * NAME
 *    PATRGarbage
 * DESCRIPTION
 *    data structure for storing low-level PC-PATR operational data relating
 *    to "garbage collection".  an instance of this data structure may be
 *    shared by multiple instances of PATRData.
 */
struct patr_garbage
	{
	struct patr_garbage *         pNext;
	PATRAllocFeature *            pFeatureHead;
	PATRAllocFeature *            pFeatureTail;
	PATRAllocComplexFeature *     pComplexHead;
	PATRAllocComplexFeature *     pComplexTail;
	PATRAllocFeatureDisjunction * pDisjunctHead;
	PATRAllocFeatureDisjunction * pDisjunctTail;
	PATRAllocRule *               pRuleHead;
	PATRAllocRule *               pRuleTail;
	PATRAllocRuleList *           pRuleListHead;
	PATRAllocRuleList *           pRuleListTail;
	PATRAllocNonterminal *        pNontermHead;
	PATRAllocNonterminal *        pNontermTail;
	PATRAllocStringList *         pNontermListHead;
	PATRAllocStringList *         pNontermListTail;
	PATRAllocPath *               pPathHead;
	PATRAllocPath *               pPathTail;
	PATRAllocHashList *           pHashListHead;
	PATRAllocHashList *           pHashListTail;
	PATRAllocEdge *               pEdgeHead;
	PATRAllocEdge *               pEdgeTail;
	PATRAllocEdgeList *           pEdgeListHead;
	PATRAllocEdgeList *           pEdgeListTail;
	PATRAllocWord *		  pWordHead;
	PATRAllocWord *		  pWordTail;
	PATRAllocWordCategory *	  pCategHead;
	PATRAllocWordCategory *	  pCategTail;
	PATRAllocDisplayedFeature *	  pDispFeatHead;
	PATRAllocDisplayedFeature *	  pDispFeatTail;
	PATRAllocString *             pStringHead;
	PATRAllocString *             pStringTail;
	int                           which;	/* which type of garbage? */
	};

/*****************************************************************************
 * NAME
 *    new_garbage
 * DESCRIPTION
 *    allocate and initialize a new PATRGarbage data structure
 * RETURN VALUE
 *    pointer to the newly allocated data structure
 */
static PATRGarbage * new_garbage(which, pMem)
int which;
PATRMemory * pMem;
{
PATRGarbage * p;
if (pMem->pGarbageFree != NULL)
	{
	p = pMem->pGarbageFree;
	pMem->pGarbageFree = p->pNext;
	}
else
	{
	p = allocMemory(sizeof(PATRGarbage));
	}
memset(p, 0, sizeof(PATRGarbage));
p->which = which;
return p;
}

/***************************************************************************
 * NAME
 *    allocPATRFeature
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new PATRFeature structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATRFeature structure.
 */
PATRFeature * allocPATRFeature(pThis)
PATRData * pThis;
{
PATRAllocFeature *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pFeatureFree != NULL)
	{
	f = pMem->pFeatureFree;
	pMem->pFeatureFree = f->link;
	}
else
	{
	f = (PATRAllocFeature *)allocMemory(sizeof(PATRAllocFeature));
	++pMem->cFeatureAlloc;
	}
f->node.eType     = 0;
f->node.u.pszAtom = NULL;
f->link                = pGarbage->pFeatureHead;
pGarbage->pFeatureHead = f;
if (pGarbage->pFeatureTail == NULL)
	pGarbage->pFeatureTail = f;
return( &(f->node) );
}

/***************************************************************************
 * NAME
 *    allocPATRComplexFeature
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new PATRComplexFeature structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATRComplexFeature structure.
 */
PATRComplexFeature * allocPATRComplexFeature(pThis)
PATRData * pThis;
{
PATRAllocComplexFeature *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pComplexFree != NULL)
	{
	f = pMem->pComplexFree;
	pMem->pComplexFree = f->link;
	}
else
	{
	f = (PATRAllocComplexFeature *)allocMemory(
						 sizeof(PATRAllocComplexFeature));
	++pMem->cComplexAlloc;
	}
f->node.pszLabel  = NULL;
f->node.pValue    = NULL;
f->node.pNext     = NULL;
f->link               = pGarbage->pComplexHead;
pGarbage->pComplexHead = f;
if (pGarbage->pComplexTail == NULL)
	pGarbage->pComplexTail = f;
return( &(f->node) );
}

/***************************************************************************
 * NAME
 *    allocPATRFeatureDisjunction
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new PATRFeatureDisjunction structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATRFeatureDisjunction structure.
 */
PATRFeatureDisjunction * allocPATRFeatureDisjunction(pThis)
PATRData * pThis;
{
PATRAllocFeatureDisjunction * f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pDisjunctFree != NULL)
	{
	f = pMem->pDisjunctFree;
	pMem->pDisjunctFree = f->link;
	}
else
	{
	f = (PATRAllocFeatureDisjunction *)allocMemory(
					  sizeof(PATRAllocFeatureDisjunction));
	++pMem->cDisjunctAlloc;
	}
f->node.pFeature = NULL;
f->node.pNext    = NULL;
f->link                = pGarbage->pDisjunctHead;
pGarbage->pDisjunctHead = f;
if (pGarbage->pDisjunctTail == NULL)
	pGarbage->pDisjunctTail = f;
return( &(f->node) );
}

/***************************************************************************
 * NAME
 *    allocPATRRule
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new PATRRule structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATRRule structure.
 */
PATRRule * allocPATRRule(pThis)
PATRData * pThis;
{
PATRAllocRule * f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pRuleFree != NULL)
	{
	f = pMem->pRuleFree;
	pMem->pRuleFree = f->link;
	}
else
	{
	f = (PATRAllocRule *)allocMemory(sizeof(PATRAllocRule));
	++pMem->cRuleAlloc;
	}
f->node.pszID         = NULL;
f->node.iNontermCount = 0;
f->node.apszNonterms = NULL;
f->node.iNontermsAlloc = 0;
f->node.pszLHS        = NULL;
f->node.pRHS          = NULL;
f->node.pUniFeature   = NULL;
f->node.iLineNumber   = 0;
f->link               = pGarbage->pRuleHead;
pGarbage->pRuleHead    = f;
if (pGarbage->pRuleTail == NULL)
	pGarbage->pRuleTail    = f;
return( &(f->node) );
}

/***************************************************************************
 * NAME
 *    allocPATRRuleList
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new PATRRuleList structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATRRuleList structure.
 */
PATRRuleList * allocPATRRuleList(pThis)
PATRData * pThis;
{
PATRAllocRuleList *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pRuleListFree != NULL)
	{
	f = pMem->pRuleListFree;
	pMem->pRuleListFree = f->link;
	}
else
	{
	f = (PATRAllocRuleList *)allocMemory(sizeof(PATRAllocRuleList));
	++pMem->cRuleAllocList;
	}
f->node.pNext = NULL;
f->node.pRule = NULL;
f->link                 = pGarbage->pRuleListHead;
pGarbage->pRuleListHead = f;
if (pGarbage->pRuleListTail == NULL)
	pGarbage->pRuleListTail = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    allocPATRNonterminal
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new PATRNonterminal structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATRNonterminal struct.
 */
PATRNonterminal * allocPATRNonterminal(pThis)
PATRData * pThis;
{
PATRAllocNonterminal *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pNontermFree != NULL)
	{
	f = pMem->pNontermFree;
	pMem->pNontermFree = f->link;
	}
else
	{
	f = (PATRAllocNonterminal *)allocMemory(sizeof(PATRAllocNonterminal));
	++pMem->cNontermAlloc;
	}
f->node.pszName    = NULL;
f->node.pszLhsName = NULL;
f->node.pNext      = NULL;
f->node.bOptional  = FALSE;
f->link = pGarbage->pNontermHead;
pGarbage->pNontermHead = f;
if (pGarbage->pNontermTail == NULL)
	pGarbage->pNontermTail = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    allocPATRNontermList
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new StringList structure for storing nonterminal symbols,
 *    saving a list of same.
 * RETURN VALUE
 *    pointer to new StringList struct.
 */
StringList *allocPATRNontermList(pThis)
PATRData * pThis;
{
PATRAllocStringList *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pNontermListFree != NULL)
	{
	f = pMem->pNontermListFree;
	pMem->pNontermListFree = f->link;
	}
else
	{
	f = (PATRAllocStringList *)allocMemory(sizeof(PATRAllocStringList));
	++pMem->cNontermAllocList;
	}
f->node.pszString = NULL;
f->node.pNext   = NULL;
f->link = pGarbage->pNontermListHead;
pGarbage->pNontermListHead = f;
if (pGarbage->pNontermListTail == NULL)
	pGarbage->pNontermListTail = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    allocPATRFeaturePath
 * DESCRIPTION
 *    Allocate a new StringList structure for storing a feature path,
 *    saving a list of same.
 * RETURN VALUE
 *    pointer to new StringList struct.
 */
StringList * allocPATRFeaturePath(pThis)
PATRData * pThis;
{
PATRAllocPath *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pPathFree != NULL)
	{
	f = pMem->pPathFree;
	pMem->pPathFree = f->link;
	}
else
	{
	f = (PATRAllocPath *)allocMemory(sizeof(PATRAllocPath));
	++pMem->cPathAlloc;
	}
f->node.pszString = NULL;
f->node.pNext     = NULL;
f->link = pGarbage->pPathHead;
pGarbage->pPathHead = f;
if (pGarbage->pPathTail == NULL)
	pGarbage->pPathTail = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    allocPATRHashList
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new PATRHashList structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATRHashList struct.
 */
PATRHashList * allocPATRHashList(pThis)
PATRData * pThis;
{
PATRAllocHashList *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pHashListFree != NULL)
	{
	f = pMem->pHashListFree;
	pMem->pHashListFree = f->link;
	}
else
	{
	f = (PATRAllocHashList *)allocMemory(sizeof(PATRAllocHashList));
	++pMem->cHashListAlloc;
	}
f->node.pszKey = NULL;
f->node.pData  = NULL;
f->node.pNext  = NULL;
f->link = pGarbage->pHashListHead;
pGarbage->pHashListHead = f;
if (pGarbage->pHashListTail == NULL)
	pGarbage->pHashListTail = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    allocPATREdge
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new PATREdge structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATREdge struct.
 */
PATREdge * allocPATREdge(pThis)
PATRData * pThis;
{
PATRAllocEdge *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pEdgeFree != NULL)
	{
	f = pMem->pEdgeFree;
	pMem->pEdgeFree = f->link;
	}
else
	{
	f = (PATRAllocEdge *)allocMemory(sizeof(PATRAllocEdge));
	++pMem->cEdgeAlloc;
	}
f->node.iStart = 0;
f->node.iEnd = 0;
f->node.pszLabel = NULL;
f->node.pFeature = NULL;
f->node.eType = 0;
f->node.u.r.pRule = NULL;
f->node.u.r.pChildren = NULL;
f->node.u.r.iNext = 0;
f->node.iCenterColumn = 0;
f->node.iCurrentRow   = 0;
f->node.iIndex  = 0;
f->node.iCount  = 0;
f->node.bFailed = 0;
f->link = pGarbage->pEdgeHead;
pGarbage->pEdgeHead = f;
if (pGarbage->pEdgeTail == NULL)
	pGarbage->pEdgeTail = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    allocPATREdgeList
 * DESCRIPTION
 *    Allocate a new PATREdgeList structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATREdgeList struct.
 */
PATREdgeList * allocPATREdgeList(pThis)
PATRData * pThis;
{
PATRAllocEdgeList *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pEdgeListFree != NULL)
	{
	f = pMem->pEdgeListFree;
	pMem->pEdgeListFree = f->link;
	}
else
	{
	f = (PATRAllocEdgeList *)allocMemory(sizeof(PATRAllocEdgeList));
	++pMem->cEdgeAllocList;
	}
f->node.pNext = NULL;
f->node.pEdge = NULL;
f->node.iSkips = 0;
f->link = pGarbage->pEdgeListHead;
pGarbage->pEdgeListHead = f;
if (pGarbage->pEdgeListTail == NULL)
	pGarbage->pEdgeListTail = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    allocPATRWord
 * DESCRIPTION
 *    Allocate a new PATRWord structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATRWord struct.
 */
PATRWord * allocPATRWord(pThis)
PATRData * pThis;
{
PATRAllocWord *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pWordFree != NULL)
	{
	f = pMem->pWordFree;
	pMem->pWordFree = f->link;
	}
else
	{
	f = (PATRAllocWord *)allocMemory(sizeof(PATRAllocWord));
	++pMem->cWordAlloc;
	}
f->node.iWordNumber  = 0;
f->node.pszWordName  = NULL;
f->node.pCategories  = NULL;
f->node.pNext        = NULL;
f->link = pGarbage->pWordHead;
pGarbage->pWordHead = f;
if (pGarbage->pWordTail == NULL)
	pGarbage->pWordTail = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    allocPATRWordCategory
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new PATRWordCategory structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATRWordCategory struct.
 */
PATRWordCategory * allocPATRWordCategory(pThis)
PATRData * pThis;
{
PATRAllocWordCategory *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pCategFree != NULL)
	{
	f = pMem->pCategFree;
	pMem->pCategFree = f->link;
	}
else
	{
	f = (PATRAllocWordCategory *)allocMemory(sizeof(PATRAllocWordCategory));
	++pMem->cCategAlloc;
	}
f->node.pszCategory  = NULL;
f->node.pFeature     = NULL;
f->node.bUsed        = 0;
f->node.iAmbigNumber = 0;
f->node.pNext        = NULL;
f->link = pGarbage->pCategHead;
pGarbage->pCategHead = f;
if (pGarbage->pCategTail == NULL)
	pGarbage->pCategTail = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    allocPATRDisplayedFeature
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new PATRDisplayedFeature structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new PATRDisplayedFeature struct.
 */
PATRDisplayedFeature * allocPATRDisplayedFeature(pThis)
PATRData * pThis;
{
PATRAllocDisplayedFeature *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pDispFeatFree != NULL)
	{
	f = pMem->pDispFeatFree;
	pMem->pDispFeatFree = f->link;
	}
else
	{
	f = (PATRAllocDisplayedFeature *)allocMemory(
						sizeof(PATRAllocDisplayedFeature));
	++pMem->cDispFeatAlloc;
	}
f->node.pFeature  = NULL;
f->node.bMultiple = FALSE;
f->node.bVisited  = FALSE;
f->node.pNext     = NULL;
f->link = pGarbage->pDispFeatHead;
pGarbage->pDispFeatHead = f;
if (pGarbage->pDispFeatTail == NULL)
	pGarbage->pDispFeatTail = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    allocPATRStringBuffer
 * ARGUMENTS
 *    length - desired length of the character string
 * DESCRIPTION
 *    Allocate a new character string, saving a list of same.
 * RETURN VALUE
 *    pointer to new character string.
 */
char * allocPATRStringBuffer(length, pThis)
size_t length;
PATRData * pThis;
{
PATRAllocString *f;
PATRMemory * pMem = pThis->pMem;
PATRGarbage * pGarbage = pMem->pGarbage;

if (pMem->pStringFree != NULL)
	{
	f = pMem->pStringFree;
	pMem->pStringFree = f->link;
	}
else
	{
	f = (PATRAllocString *)allocMemory(sizeof(PATRAllocString));
	++pMem->cStringAlloc;
	}
f->node = allocMemory(length);
f->link = pGarbage->pStringHead;
pGarbage->pStringHead = f;
if (pGarbage->pStringTail == NULL)
	pGarbage->pStringTail = f;
return( f->node );
}

/*****************************************************************************
 * NAME
 *    allocPATRStringCopy
 * ARGUMENTS
 *    str - character string to copy
 * DESCRIPTION
 *    Allocate a new character string, copying an old one, and saving a list
 *    of same.
 * RETURN VALUE
 *    pointer to new character string.
 */
char * allocPATRStringCopy(str, pThis)
char * str;
PATRData * pThis;
{
size_t length;
char *p;

length = strlen(str) + 1;
p = allocPATRStringBuffer(length, pThis);
strcpy(p, str);
return( p );
}

/*****************************************************************************
 * NAME
 *    deallocatePATRFeaturePath
 * ARGUMENTS
 *    defunct - pointer to old StringList struct
 * DESCRIPTION
 *    Remove an old StringList structure from the list of same.
 * RETURN VALUE
 *    none
 */
void deallocatePATRFeaturePath(defunct, pThis)
StringList * defunct;
PATRData * pThis;
{
PATRAllocPath *f, *prev;

PATRMemory * pMem = pThis->pMem;
if (pMem->pGarbage == NULL)
	return;
for ( prev = NULL, f = pMem->pGarbage->pPathHead ; f ; f = f->link )
	{
	if (defunct == &(f->node))
	{
	if (prev == NULL)
		pMem->pGarbage->pPathHead = f->link;
	else
		prev->link = f->link;
	if (f == pMem->pGarbage->pPathTail)
		pMem->pGarbage->pPathTail = prev;
	f->link = pMem->pPathFree;
	pMem->pPathFree = f;
	return;
	}
	prev = f;
	}
}

/*****************************************************************************
 * NAME
 *    markPATRParseGarbage
 * DESCRIPTION
 *    mark a garbage collection point for collecting memory debris left by
 *    parsing
 * RETURN VALUE
 *    none
 */
void markPATRParseGarbage(pThis)
PATRData * pThis;
{
markPATRGarbage(PATR_GARBAGE_PARSE, pThis);
}

/*****************************************************************************
 * NAME
 *    markPATRParseGarbage
 * DESCRIPTION
 *    collect the memory debris left by parsing
 * RETURN VALUE
 *    none
 */
void collectPATRParseGarbage(pThis)
PATRData * pThis;
{
collectPATRGarbage(PATR_GARBAGE_PARSE, pThis);
}

/***************************************************************************
 * NAME
 *    markPATRGarbage
 * ARGUMENTS
 *    which - identifier for debugging
 * DESCRIPTION
 *    set a garbage collection "bookmark" into the lists of allocated
 *    structures
 * RETURN VALUE
 *    none
 */
void markPATRGarbage(which, pThis)
int which;
PATRData * pThis;
{
PATRGarbage *g;
PATRMemory * pMem = pThis->pMem;
/*
 *  create a new "bookmark" and push it onto the stack of "bookmarks"
 */
g = new_garbage(which, pMem);
g->pNext = pMem->pGarbage;
pMem->pGarbage = g;

writeAllocMemoryDebugMsg( "markPATRGarbage(%d)\n", which);
writeAllocMemoryDebugMsg("%6ld PATRFeature nodes\n",
			 pMem->cFeatureAlloc);
writeAllocMemoryDebugMsg("%6ld PATRComplexFeature nodes\n",
			 pMem->cComplexAlloc);
writeAllocMemoryDebugMsg("%6ld PATRFeatureDisjunction nodes\n",
			 pMem->cDisjunctAlloc);
writeAllocMemoryDebugMsg("%6ld PATRRule nodes\n",
			 pMem->cRuleAlloc);
writeAllocMemoryDebugMsg("%6ld PATRRuleList nodes\n",
			 pMem->cRuleAllocList);
writeAllocMemoryDebugMsg("%6ld PATRNonterminal nodes\n",
			 pMem->cNontermAlloc);
writeAllocMemoryDebugMsg("%6ld StringList (nonterminal list) nodes\n",
			 pMem->cNontermAllocList);
writeAllocMemoryDebugMsg("%6ld StringList (feature path) nodes\n",
			 pMem->cPathAlloc);
writeAllocMemoryDebugMsg("%6ld PATRHashList nodes\n",
			 pMem->cHashListAlloc);
writeAllocMemoryDebugMsg("%6ld PATREdge nodes\n",
			 pMem->cEdgeAlloc);
writeAllocMemoryDebugMsg("%6ld PATREdgeList nodes\n",
			 pMem->cEdgeAllocList);
writeAllocMemoryDebugMsg("%6ld PATRWord nodes\n",
			 pMem->cWordAlloc);
writeAllocMemoryDebugMsg("%6ld PATRWordCategory nodes\n",
			 pMem->cCategAlloc);
writeAllocMemoryDebugMsg("%6ld PATRDisplayedFeature nodes\n",
			 pMem->cDispFeatAlloc);
writeAllocMemoryDebugMsg("%6ld String nodes\n",
			 pMem->cStringAlloc);
}

/***************************************************************************
 * NAME
 *    unmarkPATRGarbage
 * ARGUMENTS
 *    which - identifier for debugging
 * DESCRIPTION
 *    throw away the most recent PATRGarbage "bookmark", merging it with
 *    the previous "bookmark" in the stack
 * RETURN VALUE
 *    none
 */
void unmarkPATRGarbage(which, pThis)
int which;
PATRData * pThis;
{
PATRGarbage * pTop;
PATRGarbage * pOld;

PATRMemory * pMem = pThis->pMem;
if (pMem->pGarbage == NULL)
	return;
if (pMem->pGarbage->which != which)
	{
	writeAllocMemoryDebugMsg(
	  "Program logic error: unmarkPATRGarbage(%d), but pGarbage->which = %d\n",
				 which, pMem->pGarbage->which);
	reportError(DEBUG_MSG,
	  "Program logic error: unmarkPATRGarbage(%d), but pGarbage->which = %d\n",
		which, pMem->pGarbage->which);
	abort();
	}
if (pMem->pGarbage->pNext == NULL)
	return;
writeAllocMemoryDebugMsg( "unmarkPATRGarbage(%d)\n", which);
/*
 *  unlink the top "bookmark"
 */
pOld = pMem->pGarbage;
pMem->pGarbage = pOld->pNext;
pTop = pMem->pGarbage;
/*
 *  append the lists in the old top "bookmark" to the new top pointers
 */
if (pTop->pFeatureHead == NULL)
	{
	pTop->pFeatureHead = pOld->pFeatureHead;
	pTop->pFeatureTail = pOld->pFeatureTail;
	}
else if (pOld->pFeatureHead != NULL)
	{
	pTop->pFeatureTail->link = pOld->pFeatureHead;
	pTop->pFeatureTail       = pOld->pFeatureTail;
	}
if (pTop->pComplexHead == NULL)
	{
	pTop->pComplexHead = pOld->pComplexHead;
	pTop->pComplexTail = pOld->pComplexTail;
	}
else if (pOld->pComplexHead != NULL)
	{
	pTop->pComplexTail->link = pOld->pComplexHead;
	pTop->pComplexTail       = pOld->pComplexTail;
	}
if (pTop->pDisjunctHead == NULL)
	{
	pTop->pDisjunctHead = pOld->pDisjunctHead;
	pTop->pDisjunctTail = pOld->pDisjunctTail;
	}
else if (pOld->pDisjunctHead != NULL)
	{
	pTop->pDisjunctTail->link = pOld->pDisjunctHead;
	pTop->pDisjunctTail       = pOld->pDisjunctTail;
	}
if (pTop->pRuleHead == NULL)
	{
	pTop->pRuleHead = pOld->pRuleHead;
	pTop->pRuleTail = pOld->pRuleTail;
	}
else if (pOld->pRuleHead != NULL)
	{
	pTop->pRuleTail->link = pOld->pRuleHead;
	pTop->pRuleTail       = pOld->pRuleTail;
	}
if (pTop->pRuleListHead == NULL)
	{
	pTop->pRuleListHead = pOld->pRuleListHead;
	pTop->pRuleListTail = pOld->pRuleListTail;
	}
else if (pOld->pRuleListHead != NULL)
	{
	pTop->pRuleListTail->link = pOld->pRuleListHead;
	pTop->pRuleListTail       = pOld->pRuleListTail;
	}
if (pTop->pNontermHead == NULL)
	{
	pTop->pNontermHead = pOld->pNontermHead;
	pTop->pNontermTail = pOld->pNontermTail;
	}
else if (pOld->pNontermHead != NULL)
	{
	pTop->pNontermTail->link = pOld->pNontermHead;
	pTop->pNontermTail       = pOld->pNontermTail;
	}
if (pTop->pNontermListHead == NULL)
	{
	pTop->pNontermListHead = pOld->pNontermListHead;
	pTop->pNontermListTail = pOld->pNontermListTail;
	}
else if (pOld->pNontermListHead != NULL)
	{
	pTop->pNontermListTail->link = pOld->pNontermListHead;
	pTop->pNontermListTail       = pOld->pNontermListTail;
	}
if (pTop->pPathHead == NULL)
	{
	pTop->pPathHead = pOld->pPathHead;
	pTop->pPathTail = pOld->pPathTail;
	}
else if (pOld->pPathHead != NULL)
	{
	pTop->pPathTail->link = pOld->pPathHead;
	pTop->pPathTail       = pOld->pPathTail;
	}
if (pTop->pHashListHead == NULL)
	{
	pTop->pHashListHead = pOld->pHashListHead;
	pTop->pHashListTail = pOld->pHashListTail;
	}
else if (pOld->pHashListHead != NULL)
	{
	pTop->pHashListTail->link = pOld->pHashListHead;
	pTop->pHashListTail       = pOld->pHashListTail;
	}
if (pTop->pEdgeHead == NULL)
	{
	pTop->pEdgeHead = pOld->pEdgeHead;
	pTop->pEdgeTail = pOld->pEdgeTail;
	}
else if (pOld->pEdgeHead != NULL)
	{
	pTop->pEdgeTail->link = pOld->pEdgeHead;
	pTop->pEdgeTail       = pOld->pEdgeTail;
	}
if (pTop->pEdgeListHead == NULL)
	{
	pTop->pEdgeListHead = pOld->pEdgeListHead;
	pTop->pEdgeListTail = pOld->pEdgeListTail;
	}
else if (pOld->pEdgeListHead != NULL)
	{
	pTop->pEdgeListTail->link = pOld->pEdgeListHead;
	pTop->pEdgeListTail       = pOld->pEdgeListTail;
	}
if (pTop->pWordHead == NULL)
	{
	pTop->pWordHead = pOld->pWordHead;
	pTop->pWordTail = pOld->pWordTail;
	}
else if (pOld->pWordHead != NULL)
	{
	pTop->pWordTail->link = pOld->pWordHead;
	pTop->pWordTail       = pOld->pWordTail;
	}
if (pTop->pCategHead == NULL)
	{
	pTop->pCategHead = pOld->pCategHead;
	pTop->pCategTail = pOld->pCategTail;
	}
else if (pOld->pCategHead != NULL)
	{
	pTop->pCategTail->link = pOld->pCategHead;
	pTop->pCategTail       = pOld->pCategTail;
	}
if (pTop->pDispFeatHead == NULL)
	{
	pTop->pDispFeatHead = pOld->pDispFeatHead;
	pTop->pDispFeatTail = pOld->pDispFeatTail;
	}
else if (pOld->pDispFeatHead != NULL)
	{
	pTop->pDispFeatTail->link = pOld->pDispFeatHead;
	pTop->pDispFeatTail       = pOld->pDispFeatTail;
	}
if (pTop->pStringHead == NULL)
	{
	pTop->pStringHead = pOld->pStringHead;
	pTop->pStringTail = pOld->pStringTail;
	}
else if (pOld->pStringHead != NULL)
	{
	pTop->pStringTail->link = pOld->pStringHead;
	pTop->pStringTail       = pOld->pStringTail;
	}
pOld->pNext = pMem->pGarbageFree;
pMem->pGarbageFree = pOld;
}

/***************************************************************************
 * NAME
 *    swap_top_garbage
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    swap the top two "bookmarks" in the garbage list
 * RETURN VALUE
 *    none
 */
static void swap_top_garbage(pMem)
PATRMemory * pMem;
{
PATRGarbage * pTop = pMem->pGarbage;

if ((pTop == NULL) || (pTop->pNext == NULL))
	return;
/*
pGarbage --> A --> B --> C
pTop     --> A --> B --> C
 */
pMem->pGarbage = pTop->pNext;
/*
pGarbage --> B --> C
pTop     --> A --> B --> C
 */
pTop->pNext = pTop->pNext->pNext;
/*
pGarbage --> B --> C
pTop     --> A --> C
 */
pMem->pGarbage->pNext = pTop;
/*
pGarbage --> B --> A --> C
pTop     --> A --> C
 */
}

/***************************************************************************
 * NAME
 *    collectPATRGarbage
 * ARGUMENTS
 *    which - identifier for debugging
 * DESCRIPTION
 *    free the lists of allocated structures up to the most recent PATRGarbage
 *    "bookmark"
 * RETURN VALUE
 *    none
 */
void collectPATRGarbage(which, pThis)
int which;
PATRData * pThis;
{
PATRMemory * pMem;
PATRGarbage * pTop;
PATRAllocString * pc;

pMem = pThis->pMem;
pTop = pMem->pGarbage;
/******************************************************************************
 *  pop the most recent PATRGarbage "bookmark"
 */
if (pTop == NULL)
	{
	writeAllocMemoryDebugMsg(
	"Program logic error: collectPATRGarbage(%d), but pGarbage == NULL\n");
	reportError(DEBUG_MSG,
	"Program logic error: collectPATRGarbage(%d), but pGarbage == NULL\n");
	abort();
	}
if (pTop->which != which)
	{
	if (    (which >= PATR_GARBAGE_GRAMMAR) &&
		(pTop->pNext != NULL) &&
		(pTop->pNext->which == which) )
	{
	swap_top_garbage(pMem);
	pTop = pMem->pGarbage;
	}
	else
	{
	writeAllocMemoryDebugMsg(
	 "Program logic error: collectPATRGarbage(%d), but pGarbage->which = %d\n",
			which, pTop->which);
	reportError(DEBUG_MSG,
	 "Program logic error: collectPATRGarbage(%d), but pGarbage->which = %d\n",
			which, pTop->which);
	abort();
	}
	}
/******************************************************************************
 * add the lists pointed to by the global top pointers to the "available" lists
 */
if (pMem->pFeatureFree == NULL)
	pMem->pFeatureFree = pTop->pFeatureHead;
else if (pTop->pFeatureHead != NULL)
	{
	pTop->pFeatureTail->link = pMem->pFeatureFree;
	pMem->pFeatureFree = pTop->pFeatureHead;
	}
if (pMem->pComplexFree == NULL)
	pMem->pComplexFree = pTop->pComplexHead;
else if (pTop->pComplexHead != NULL)
	{
	pTop->pComplexTail->link = pMem->pComplexFree;
	pMem->pComplexFree = pTop->pComplexHead;
	}
if (pMem->pDisjunctFree == NULL)
	pMem->pDisjunctFree = pTop->pDisjunctHead;
else if (pTop->pDisjunctHead != NULL)
	{
	pTop->pDisjunctTail->link = pMem->pDisjunctFree;
	pMem->pDisjunctFree = pTop->pDisjunctHead;
	}
if (pMem->pRuleFree == NULL)
	pMem->pRuleFree = pTop->pRuleHead;
else if (pTop->pRuleHead != NULL)
	{
	pTop->pRuleTail->link = pMem->pRuleFree;
	pMem->pRuleFree = pTop->pRuleHead;
	}
if (pMem->pRuleListFree == NULL)
	pMem->pRuleListFree = pTop->pRuleListHead;
else if (pTop->pRuleListHead != NULL)
	{
	pTop->pRuleListTail->link = pMem->pRuleListFree;
	pMem->pRuleListFree = pTop->pRuleListHead;
	}
if (pMem->pNontermFree == NULL)
	pMem->pNontermFree = pTop->pNontermHead;
else if (pTop->pNontermHead != NULL)
	{
	pTop->pNontermTail->link = pMem->pNontermFree;
	pMem->pNontermFree = pTop->pNontermHead;
	}
if (pMem->pNontermListFree == NULL)
	pMem->pNontermListFree = pTop->pNontermListHead;
else if (pTop->pNontermListHead != NULL)
	{
	pTop->pNontermListTail->link = pMem->pNontermListFree;
	pMem->pNontermListFree = pTop->pNontermListHead;
	}
if (pMem->pPathFree == NULL)
	pMem->pPathFree = pTop->pPathHead;
else if (pTop->pPathHead != NULL)
	{
	pTop->pPathTail->link = pMem->pPathFree;
	pMem->pPathFree = pTop->pPathHead;
	}
if (pMem->pHashListFree == NULL)
	pMem->pHashListFree = pTop->pHashListHead;
else if (pTop->pHashListHead != NULL)
	{
	pTop->pHashListTail->link = pMem->pHashListFree;
	pMem->pHashListFree = pTop->pHashListHead;
	}
if (pMem->pEdgeFree == NULL)
	pMem->pEdgeFree = pTop->pEdgeHead;
else if (pTop->pEdgeHead != NULL)
	{
	pTop->pEdgeTail->link = pMem->pEdgeFree;
	pMem->pEdgeFree = pTop->pEdgeHead;
	}
if (pMem->pEdgeListFree == NULL)
	pMem->pEdgeListFree = pTop->pEdgeListHead;
else if (pTop->pEdgeListHead != NULL)
	{
	pTop->pEdgeListTail->link = pMem->pEdgeListFree;
	pMem->pEdgeListFree = pTop->pEdgeListHead;
	}
if (pMem->pWordFree == NULL)
	pMem->pWordFree = pTop->pWordHead;
else if (pTop->pWordHead != NULL)
	{
	pTop->pWordTail->link = pMem->pWordFree;
	pMem->pWordFree = pTop->pWordHead;
	}
if (pMem->pCategFree == NULL)
	pMem->pCategFree = pTop->pCategHead;
else if (pTop->pCategHead != NULL)
	{
	pTop->pCategTail->link = pMem->pCategFree;
	pMem->pCategFree = pTop->pCategHead;
	}
if (pMem->pDispFeatFree == NULL)
	pMem->pDispFeatFree = pTop->pDispFeatHead;
else if (pTop->pDispFeatHead != NULL)
	{
	pTop->pDispFeatTail->link = pMem->pDispFeatFree;
	pMem->pDispFeatFree = pTop->pDispFeatHead;
	}
for ( pc = pTop->pStringHead ; pc ; pc = pc->link )
	{
	freeMemory( pc->node );
	pc->node = NULL;
	}
if (pMem->pStringFree == NULL)
	pMem->pStringFree = pTop->pStringHead;
else if (pTop->pStringHead != NULL)
	{
	pTop->pStringTail->link = pMem->pStringFree;
	pMem->pStringFree = pTop->pStringHead;
	}

/******************************************************************************
 *  pop the stack of "bookmarks"
 */
if (pTop->pNext != NULL)
	{
	pMem->pGarbage = pTop->pNext;
	pTop->pNext = pMem->pGarbageFree;
	pMem->pGarbageFree = pTop;
	}
else
	{
	pTop->pNext = pMem->pGarbageFree;
	pMem->pGarbageFree = pTop;
	pMem->pGarbage = NULL;
	/*
	 *  no more garbage, so free the memory in the "available" lists
	 */
	freeCollectedPATRGarbage(pThis);
	}
writeAllocMemoryDebugMsg("collectPATRGarbage(%d)\n", which);
writeAllocMemoryDebugMsg("%6ld PATRFeature nodes\n",
			 pMem->cFeatureAlloc);
writeAllocMemoryDebugMsg("%6ld PATRComplexFeature nodes\n",
			 pMem->cComplexAlloc);
writeAllocMemoryDebugMsg("%6ld PATRFeatureDisjunction nodes\n",
			 pMem->cDisjunctAlloc);
writeAllocMemoryDebugMsg("%6ld PATRRule nodes\n",
			 pMem->cRuleAlloc);
writeAllocMemoryDebugMsg("%6ld PATRRuleList nodes\n",
			 pMem->cRuleAllocList);
writeAllocMemoryDebugMsg("%6ld PATRNonterminal nodes\n",
			 pMem->cNontermAlloc);
writeAllocMemoryDebugMsg("%6ld StringList (nonterminal list) nodes\n",
			 pMem->cNontermAllocList);
writeAllocMemoryDebugMsg("%6ld StringList (feature path) nodes\n",
			 pMem->cPathAlloc);
writeAllocMemoryDebugMsg("%6ld PATRHashList nodes\n",
			 pMem->cHashListAlloc);
writeAllocMemoryDebugMsg("%6ld PATREdge nodes\n",
			 pMem->cEdgeAlloc);
writeAllocMemoryDebugMsg("%6ld PATREdgeList nodes\n",
			 pMem->cEdgeAllocList);
writeAllocMemoryDebugMsg("%6ld PATRWord nodes\n",
			 pMem->cWordAlloc);
writeAllocMemoryDebugMsg("%6ld PATRWordCategory nodes\n",
			 pMem->cCategAlloc);
writeAllocMemoryDebugMsg("%6ld PATRDisplayedFeature nodes\n",
			 pMem->cDispFeatAlloc);
writeAllocMemoryDebugMsg("%6ld String nodes\n",
			 pMem->cStringAlloc);
}

/*****************************************************************************
 * NAME
 *    freeCollectedPATRGarbage
 * DESCRIPTION
 *    free the memory that has been collected as garbage
 * RETURN VALUE
 *    none
 */
void freeCollectedPATRGarbage(pThis)
PATRData * pThis;
{
PATRMemory * pMem;
PATRAllocString * pc;
PATRAllocString * nextpc;
PATRAllocFeature * pn;
PATRAllocFeature * nextpn;
PATRAllocComplexFeature * pl;
PATRAllocComplexFeature * nextpl;
PATRAllocFeatureDisjunction * pd;
PATRAllocFeatureDisjunction * nextpd;
PATRAllocRule  * pr;
PATRAllocRule  * nextpr;
PATRAllocRuleList * prl;
PATRAllocRuleList * nextprl;
PATRAllocNonterminal * pnt;
PATRAllocNonterminal * nextpnt;
PATRAllocStringList * pnl;
PATRAllocStringList * nextpnl;
PATRAllocPath * pa;
PATRAllocPath * nextpa;
PATRAllocHashList * ph;
PATRAllocHashList * nextph;
PATRAllocEdge * pe;
PATRAllocEdge * nextpe;
PATRAllocEdgeList * pel;
PATRAllocEdgeList * nextpel;
PATRAllocWord * ps;
PATRAllocWord * nextps;
PATRAllocWordCategory * pw;
PATRAllocWordCategory * nextpw;
PATRAllocDisplayedFeature * pm;
PATRAllocDisplayedFeature * nextpm;
PATRGarbage * pg;
PATRGarbage * nextpg;

pMem = pThis->pMem;

for ( pn = pMem->pFeatureFree ; pn ; pn = nextpn )
	{
	nextpn = pn->link;
	freeMemory(pn);
	--pMem->cFeatureAlloc;
	}
pMem->pFeatureFree = NULL;
for ( pl = pMem->pComplexFree ; pl ; pl = nextpl )
	{
	nextpl = pl->link;
	freeMemory(pl);
	--pMem->cComplexAlloc;
	}
pMem->pComplexFree = NULL;
for ( pd = pMem->pDisjunctFree ; pd ; pd = nextpd )
	{
	nextpd = pd->link;
	freeMemory(pd);
	--pMem->cDisjunctAlloc;
	}
pMem->pDisjunctFree = NULL;
for ( pr = pMem->pRuleFree ; pr ; pr = nextpr )
	{
	nextpr = pr->link;
	if (pr->node.apszNonterms)
	freeMemory(pr->node.apszNonterms);
	freeMemory(pr);
	--pMem->cRuleAlloc;
	}
pMem->pRuleFree = NULL;
for ( prl = pMem->pRuleListFree ; prl ; prl = nextprl )
	{
	nextprl = prl->link;
	freeMemory(prl);
	--pMem->cRuleAllocList;
	}
pMem->pRuleListFree = NULL;
for ( pnt = pMem->pNontermFree ; pnt ; pnt = nextpnt )
	{
	nextpnt = pnt->link;
	freeMemory(pnt);
	--pMem->cNontermAlloc;
	}
pMem->pNontermFree = NULL;
for ( pnl = pMem->pNontermListFree ; pnl ; pnl = nextpnl )
	{
	nextpnl = pnl->link;
	freeMemory(pnl);
	--pMem->cNontermAllocList;
	}
pMem->pNontermListFree = NULL;
for ( pa = pMem->pPathFree ; pa ; pa = nextpa )
	{
	nextpa = pa->link;
	freeMemory(pa);
	--pMem->cPathAlloc;
	}
pMem->pPathFree = NULL;
for ( ph = pMem->pHashListFree ; ph ; ph = nextph )
	{
	nextph = ph->link;
	freeMemory(ph);
	--pMem->cHashListAlloc;
	}
pMem->pHashListFree = NULL;
for ( pe = pMem->pEdgeFree ; pe ; pe = nextpe )
	{
	nextpe = pe->link;
	freeMemory(pe);
	--pMem->cEdgeAlloc;
	}
pMem->pEdgeFree = NULL;
for ( pel = pMem->pEdgeListFree ; pel ; pel = nextpel )
	{
	nextpel = pel->link;
	freeMemory(pel);
	--pMem->cEdgeAllocList;
	}
pMem->pEdgeListFree = NULL;
for ( ps = pMem->pWordFree ; ps ; ps = nextps )
	{
	nextps = ps->link;
	freeMemory(ps);
	--pMem->cWordAlloc;
	}
pMem->pWordFree = NULL;
for ( pw = pMem->pCategFree ; pw ; pw = nextpw )
	{
	nextpw = pw->link;
	freeMemory(pw);
	--pMem->cCategAlloc;
	}
pMem->pCategFree = NULL;
for ( pm = pMem->pDispFeatFree ; pm ; pm = nextpm )
	{
	nextpm = pm->link;
	freeMemory(pm);
	--pMem->cDispFeatAlloc;
	}
pMem->pDispFeatFree = NULL;
for ( pc = pMem->pStringFree ; pc ; pc = nextpc )
	{
	nextpc = pc->link;
	freeMemory(pc);
	--pMem->cStringAlloc;
	}
pMem->pStringFree = NULL;
for ( pg = pMem->pGarbageFree ; pg ; pg = nextpg )
	{
	nextpg = pg->pNext;
	freeMemory(pg);
	}
pMem->pGarbageFree = NULL;
}

/*****************************************************************************
 * NAME
 *    cleanupPATRGarbage
 * DESCRIPTION
 *    if pGarbage_in is on the list of uncollected garbage, collect everything
 *    up to (but not including) pGarbage_in
 * RETURN VALUE
 *    none
 */
void cleanupPATRGarbage(pGarbage_in, pThis)
PATRGarbage * pGarbage_in;
PATRData * pThis;
{
PATRGarbage *pg;
int bFound = FALSE;

for ( pg = pThis->pMem->pGarbage ; pg ; pg = pg->pNext )
	{
	if (pg == pGarbage_in)
	{
	bFound = TRUE;
	break;
	}
	}
if (bFound)
	{
	for ( pg = pThis->pMem->pGarbage ; pg && pg != pGarbage_in ; pg = pg->pNext )
	{
	collectPATRGarbage(pg->which, pThis);
	}
	}
}

/****************************************************************************
 * NAME
 *    store_featlist
 * ARGUMENTS
 *    fp - pointer to PATRComplexFeature structure
 * DESCRIPTION
 *    Make a copy of PATRComplexFeature structure
 * RETURN VALUE
 *    Pointer to the new copy
 */
static PATRComplexFeature * store_featlist( fp, pThis )
PATRComplexFeature * fp;
PATRData * pThis;
{
PATRComplexFeature *new_fl;

if (fp == (PATRComplexFeature *)NULL)
	return((PATRComplexFeature *)NULL);

new_fl = (PATRComplexFeature *)allocMemory(sizeof(PATRComplexFeature));
new_fl->pszLabel = fp->pszLabel;
new_fl->pValue   = store_patr_feature(fp->pValue, pThis);
new_fl->pNext    = store_featlist(fp->pNext, pThis);

return (new_fl);
}

/****************************************************************************
 * NAME
 *    store_patr_feature
 * ARGUMENTS
 *    fp - pointer to PATRFeature structure
 * DESCRIPTION
 *    Make a copy of PATRFeature structure
 * RETURN VALUE
 *    Pointer to the new copy
 */
static PATRFeature * store_patr_feature( fp, pThis )
PATRFeature *fp;
PATRData * pThis;
{
PATRFeature *new_fn;

if (fp == (PATRFeature *)NULL)
	return( (PATRFeature *)NULL );

new_fn = checkPATRFeatureCopy( fp, pThis );
if (new_fn != NULL)
	return new_fn;

new_fn = (PATRFeature *)allocMemory(sizeof(PATRFeature));
new_fn->eType = fp->eType;
if ((fp->eType == PATR_ATOM) || (fp->eType == PATR_DEFATOM))
	new_fn->u.pszAtom = fp->u.pszAtom;
else if (fp->eType == PATR_COMPLEX)
	new_fn->u.pComplex = store_featlist(fp->u.pComplex, pThis);
else if (fp->eType == PATR_FORWARD)
	new_fn->u.pForward = store_patr_feature(fp->u.pForward, pThis);
else
	new_fn->u.pszAtom = NULL;
recordPATRFeatureCopy(fp, new_fn, pThis);
return (new_fn);
}

/****************************************************************************
 * NAME
 *    storePATRFeature
 * ARGUMENTS
 *    fp - pointer to PATRFeature structure
 * DESCRIPTION
 *    Make a copy of PATRFeature structure
 * RETURN VALUE
 *    Pointer to the new copy
 */
PATRFeature * storePATRFeature( fp, pThis )
PATRFeature * fp;
PATRData * pThis;
{
PATRFeature *new_fn;

if (fp == (PATRFeature *)NULL)
	return( (PATRFeature *)NULL );

resetPATRFeatureCopyCheck(pThis);
new_fn = store_patr_feature( fp, pThis );
resetPATRFeatureCopyCheck(pThis);

return (new_fn);
}

/****************************************************************************
 * NAME
 *    store_nonterm
 * ARGUMENTS
 *    np - pointer to PATRNonterminal structure
 * DESCRIPTION
 *    Make a copy of PATRNonterminal structure
 * RETURN VALUE
 *    Pointer to the new copy
 */
static PATRNonterminal *store_nonterm( np )
PATRNonterminal *np;
{
PATRNonterminal *new_np;

if (np == (PATRNonterminal *)NULL)
	return( (PATRNonterminal *)NULL );

new_np = (PATRNonterminal *)allocMemory(sizeof(PATRNonterminal));
new_np->pszName    = (char *)duplicateString((char *)np->pszName);
new_np->pszLhsName = (char *)duplicateString(np->pszLhsName);
new_np->pNext      = store_nonterm(np->pNext);

return(new_np);
}

/****************************************************************************
 * NAME
 *    store_rule
 * ARGUMENTS
 *    rp - pointer to rule structure
 * DESCRIPTION
 *    Make a copy of rule structure
 * RETURN VALUE
 *    Pointer to the new copy
 */
static PATRRule * store_rule( rp, pThis )
PATRRule * rp;
PATRData * pThis;
{
PATRRule *new_rp;
int i;

if (rp == (PATRRule *)NULL)
	return( (PATRRule *)NULL);

new_rp = (PATRRule *)allocMemory(sizeof(PATRRule));
if (rp->pszID == NULL)
	new_rp->pszID = NULL;
else
	new_rp->pszID = (char *)duplicateString(rp->pszID);
new_rp->iNontermCount = rp->iNontermCount;
new_rp->iNontermsAlloc = rp->iNontermCount + 1;
new_rp->apszNonterms = (char **)allocMemory(
					  new_rp->iNontermsAlloc * sizeof(char *));
for ( i = 0 ; i <= rp->iNontermCount ; ++i )
	new_rp->apszNonterms[i] = duplicateString(rp->apszNonterms[i]);
new_rp->pszLHS        = (char *)duplicateString(rp->pszLHS);
new_rp->pRHS          = store_nonterm(rp->pRHS);
new_rp->pUniFeature   = storePATRFeature(rp->pUniFeature, pThis);
new_rp->iLineNumber   = rp->iLineNumber;

return(new_rp);
}

/****************************************************************************
 * NAME
 *    store_word
 * ARGUMENTS
 *    wp - pointer to PATRWordCategory structure
 * DESCRIPTION
 *    Make a copy of PATRWordCategory structure
 * RETURN VALUE
 *    Pointer to the new copy
 */
static PATRWordCategory * store_word( wp, pThis )
PATRWordCategory * wp;
PATRData * pThis;
{
PATRWordCategory *new_wp;

if (wp == (PATRWordCategory *)NULL)
	return((PATRWordCategory *)NULL);

new_wp = (PATRWordCategory *)allocMemory(sizeof(PATRWordCategory));
new_wp->pszCategory  = (char *)duplicateString(wp->pszCategory);
new_wp->pFeature     = storePATRFeature(wp->pFeature, pThis);
new_wp->bUsed        = wp->bUsed;
new_wp->iAmbigNumber = wp->iAmbigNumber;
new_wp->pNext        = store_word(wp->pNext, pThis);

return(new_wp);
}

/****************************************************************************
 * NAME
 *    storePATREdgeList
 * ARGUMENTS
 *    patr_resp - pointer to a parser result
 * DESCRIPTION
 *    Allocate memory for parser result and store it
 * RETURN VALUE
 *    Pointer to stored parser result
 */
PATREdgeList * storePATREdgeList(patr_resp, pThis)
PATREdgeList * patr_resp;
PATRData * pThis;
{
PATREdgeList *temp;

if (patr_resp == (PATREdgeList *)NULL)
	return((PATREdgeList *)NULL);

temp = (PATREdgeList *)allocMemory(sizeof(PATREdgeList));
temp->pNext = storePATREdgeList( patr_resp->pNext, pThis);

if (patr_resp->pEdge == (PATREdge *)NULL)
	return(temp);
else
	{
	temp->pEdge = (PATREdge *)allocMemory(sizeof(PATREdge));
	temp->pEdge->iStart = patr_resp->pEdge->iStart;
	temp->pEdge->iEnd = patr_resp->pEdge->iEnd;
	temp->pEdge->pszLabel = duplicateString(patr_resp->pEdge->pszLabel);

	temp->pEdge->pFeature = storePATRFeature(patr_resp->pEdge->pFeature,
						 pThis);

	temp->pEdge->eType = patr_resp->pEdge->eType;
	if (temp->pEdge->eType == PATR_RULE_EDGE)
	{
	temp->pEdge->u.r.pRule = store_rule(patr_resp->pEdge->u.r.pRule,
						pThis);
	temp->pEdge->u.r.pChildren = storePATREdgeList(
					patr_resp->pEdge->u.r.pChildren,
					pThis);
	temp->pEdge->u.r.iNext = patr_resp->pEdge->u.r.iNext;
	}
	else	/* temp->pEdge->type == PATR_LEXICAL_EDGE */
	{
	temp->pEdge->u.l.pszTerminal =
			(char *)duplicateString(patr_resp->pEdge->u.l.pszTerminal);
	temp->pEdge->u.l.pWord = store_word(patr_resp->pEdge->u.l.pWord,
						pThis);
	}

	temp->pEdge->iCenterColumn = patr_resp->pEdge->iCenterColumn;
	temp->pEdge->iCurrentRow = patr_resp->pEdge->iCurrentRow;
	temp->pEdge->iIndex = patr_resp->pEdge->iIndex;
	temp->pEdge->iCount = patr_resp->pEdge->iCount;
	temp->pEdge->bFailed = patr_resp->pEdge->bFailed;
	}

return( temp );
}

/****************************************************************************
 * NAME
 *    free_featlist
 * ARGUMENTS
 *    pf - pointer to PATRComplexFeature structure
 * DESCRIPTION
 *    Free memory used to store PATRComplexFeature structure
 * RETURN VALUE
 *    None
 */
static void free_featlist( pf, pThis )
PATRComplexFeature * pf;
PATRData * pThis;
{
if (pf != (PATRComplexFeature *)NULL)
	{
	free_patr_feature(pf->pValue, pThis);
	free_featlist(pf->pNext, pThis);
	freeMemory( pf );
	}
}

/****************************************************************************
 * NAME
 *    free_patr_feature
 * ARGUMENTS
 *    pf - pointer to PATRFeature structure
 * DESCRIPTION
 *    Free memory used to store PATRFeature structure
 * RETURN VALUE
 *    None
 */
static void free_patr_feature( pf, pThis )
PATRFeature * pf;
PATRData * pThis;
{
if (pf == (PATRFeature *)NULL)
	return;
if (checkPATRFeatureCopy(pf, pThis))
	return;

switch( pf->eType )
	{
	case PATR_ATOM:
	case PATR_DEFATOM:
	break;
	case PATR_COMPLEX:
	free_featlist(pf->u.pComplex, pThis);
	break;
	case PATR_FORWARD:
	free_patr_feature(pf->u.pForward, pThis);
	break;
	case PATR_NULLFS:
	case PATR_FAILFS:
	break;
	}
freeMemory( pf );
recordPATRFeatureCopy(pf, pf, pThis);
}

/****************************************************************************
 * NAME
 *    freePATRFeature
 * ARGUMENTS
 *    pf - pointer to PATRFeature structure
 * DESCRIPTION
 *    Free memory used to store PATRFeature structure
 * RETURN VALUE
 *    None
 */
void freePATRFeature( pf, pThis )
PATRFeature * pf;
PATRData * pThis;
{
if (pf == (PATRFeature *)NULL)
	return;

resetPATRFeatureCopyCheck(pThis);
free_patr_feature(pf, pThis);
resetPATRFeatureCopyCheck(pThis);
}

/****************************************************************************
 * NAME
 *    free_nonterm
 * ARGUMENTS
 *    pn - pointer to PATRNonterminal structure
 * DESCRIPTION
 *    Free memory used to store PATRNonterminal structure
 * RETURN VALUE
 *    None
 */
static void free_nonterm( pn )
PATRNonterminal *pn;
{
if (pn != (PATRNonterminal *)NULL)
	{
	freeMemory(pn->pszName);
	freeMemory(pn->pszLhsName);
	free_nonterm(pn->pNext);
	freeMemory( pn );
	}
}

/****************************************************************************
 * NAME
 *    free_rule
 * ARGUMENTS
 *    pr - pointer to a rule structure
 * DESCRIPTION
 *    Free memory used to store rule structure
 * RETURN VALUE
 *    None
 */
static void free_rule( pr, pThis )
PATRRule * pr;
PATRData * pThis;
{
int i;

if (pr != (PATRRule *)NULL)
	{
	if (pr->pszID != NULL)
	freeMemory(pr->pszID);
	freeMemory(pr->pszLHS);
	for ( i = 0 ; i <= pr->iNontermCount ; ++i )
	freeMemory(pr->apszNonterms[i]);
	freeMemory(pr->apszNonterms);
	free_nonterm(pr->pRHS);
	freePATRFeature(pr->pUniFeature, pThis);
	freeMemory( pr );
	}
}

/****************************************************************************
 * NAME
 *    free_word
 * ARGUMENTS
 *    pw - pointer to a word structure
 * DESCRIPTION
 *    Free memory used to store word structure
 * RETURN VALUE
 *    None
 */
static void free_word( pw, pThis )
PATRWordCategory * pw;
PATRData * pThis;
{
if (pw != (PATRWordCategory *)NULL)
	{
	freeMemory(pw->pszCategory);
	freePATRFeature(pw->pFeature, pThis);
	free_word(pw->pNext, pThis);
	freeMemory( pw );
	}
}

/****************************************************************************
 * NAME
 *    freePATREdgeList
 * ARGUMENTS
 *    patr_resp - pointer to a parser result
 * DESCRIPTION
 *    Free memory used to store parser result
 * RETURN VALUE
 *    None
 */
void freePATREdgeList(patr_resp, pThis)
PATREdgeList * patr_resp;
PATRData * pThis;
{
PATREdgeList *pr,*pr_next;

for (pr = patr_resp; pr != (PATREdgeList *)NULL; pr = pr_next)
	{
	if (pr->pEdge != (PATREdge *)NULL)
	{
	freeMemory(pr->pEdge->pszLabel);
	freePATRFeature(pr->pEdge->pFeature, pThis);
	if (pr->pEdge->eType == PATR_RULE_EDGE)
		{
		free_rule(pr->pEdge->u.r.pRule, pThis);
		freePATREdgeList(pr->pEdge->u.r.pChildren, pThis);
		}
	else /* pr->pEdge->type == PATR_LEXICAL_EDGE */
		{
		freeMemory(pr->pEdge->u.l.pszTerminal);
		free_word(pr->pEdge->u.l.pWord, pThis);
		}
	freeMemory(pr->pEdge);
	}
	pr_next = pr->pNext;
	freeMemory(pr);
	}
}
