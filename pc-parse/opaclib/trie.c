/* TRIE.C - functions for storing information in a trie
 ***************************************************************************
 *
 * Trie * addDataToTrie(Trie *       pTrieHead_in,
 *			const char * pszKey_in,
 *			VOIDP        pInfo_in,
 *			VOIDP (*     pfLinkInfo_in)(VOIDP pNew, VOIDP pList),
 *			int          iMaxLevel_in)
 *
 * VOIDP findDataInTrie(const Trie * pTrieHead_in,
 *			const char * pszKey_in)
 *
 * int removeDataFromTrie(Trie *   pTrieHead_in,
 *                        char *   pszKey_in,
 *			  VOIDP    pDefunct_in,
 *			  VOIDP (* pfRemoveInfo_in)(VOIDP pDefunct,
 *						    VOIDP pList))
 *
 * void writeTrieData(Trie *  pTrieHead_in,
 *		      void (* showinfo)(VOIDP  pList,
 *					int    iIndent,
 *					FILE * pOutputFP),
 *		      FILE *  pOutputFP_in)
 *
 * void walkTrie(Trie *  pTrieHead_in,
 *               void (* pfWalkInfo_in)(VOIDP pList))
 *
 * void eraseTrie(Trie *  pTrieHead_in,
 *		  void (* pfEraseInfo_in)(VOIDP pList))
 *
 ***************************************************************************
 * edit history is at the end of TRIE.H
 ***************************************************************************
 * Copyright 1989, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <ctype.h>
#include "allocmem.h"
#include "trie.h"
#include "rpterror.h"

#ifdef __STDC__
void check_block_trie(void);
#endif

#define NUL '\0'
#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif
/*
 *  local functions
 */
static Trie *enter_entry P(( Trie *pTrieHead_in,
				 const char *pszKey_in,
				 int levels ));
static void show_entries P(( Trie *pTrieHead_in,
				 int indent ));
static void trie_indent P(( int num ));
/*
 *  these are recursion invariant parameters
 */
static VOIDP	pNewInfo_m;
static VOIDP (*	pfLinkInfo_m)  P((VOIDP pNew, VOIDP pList));
static void (*	pfWalkInfo_m) P((VOIDP pList));
static void (*	pfWriteInfo_m) P((VOIDP pList, int iIndent, FILE *pOutputFP));
static FILE *	pWriteInfoFP_m;
/*
 *  variables for allocating multiple Trie nodes at a time
 */
struct block_trie
	{
	Trie *		array;
	struct block_trie *	link;
	};
static struct block_trie *	pHeadTrieBlocks_m = NULL;
static struct block_trie *	pTailTrieBlocks_m = NULL;
static size_t			uiAvailableTrieNodes_m = 0;
size_t				uiTrieArrayBlockSize_g = 2000;

#ifdef applec
#pragma segment S_opaclib
#endif

/************************************************************************
 * NAME
 *    new_trie_node
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    allocate a new Trie struct from the heap
 *    we allocate trie nodes uiTrieArrayBlockSize_g at a time for efficiency
 * RETURN VALUE
 *    pointer to the newly-allocated Trie struct
 */
static Trie *new_trie_node()
{
struct block_trie *tap;

if (uiTrieArrayBlockSize_g > 1)
	{
	if (uiAvailableTrieNodes_m == 0)
	{
	tap =(struct block_trie *)allocMemory(sizeof(struct block_trie));
	tap->link = NULL;
	tap->array = (Trie *)allocMemory(sizeof(Trie)*uiTrieArrayBlockSize_g);
	uiAvailableTrieNodes_m = uiTrieArrayBlockSize_g;
	if (pHeadTrieBlocks_m == (struct block_trie *)NULL)
		pHeadTrieBlocks_m = tap;
	else
		pTailTrieBlocks_m->link = tap;
	pTailTrieBlocks_m = tap;
	}
	--uiAvailableTrieNodes_m;
	return( &(pTailTrieBlocks_m->array[uiAvailableTrieNodes_m]) );
	}
else
	return( (Trie *)allocMemory(sizeof(Trie)) );
}

/************************************************************************
 * NAME
 *    erase_block_trie
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    free the block_trie buffers allocated previously
 * RETURN VALUE
 *    none
 */
static void erase_block_trie()
{
struct block_trie *tap, *prevtap, *nexttap;
Trie *tp;
unsigned i;
int block_used;

for ( prevtap = NULL, tap = pHeadTrieBlocks_m ; tap ; tap = nexttap )
	{
	nexttap = tap->link;
	for ( block_used = 0, i = 0 ; i < uiTrieArrayBlockSize_g ; ++i )
	{
	tp = &(tap->array[i]);
	if (	(tp->pSiblings != NULL) ||
		(tp->pChildren != NULL) ||
		(tp->pTrieInfo != NULL) ||
		(tp->cLetter != NUL) )
		{
		block_used = 1;
		break;
		}
	}
	if (block_used == 0)
	{
	if (prevtap != NULL)
		{
		prevtap->link = tap->link;
		freeMemory( tap->array );
		freeMemory( tap );
		}
	else
		{
		pHeadTrieBlocks_m = tap->link;
		freeMemory( tap->array );
		freeMemory( tap );
		}
	}
	else
	prevtap = tap;
	}
if (pHeadTrieBlocks_m == (struct block_trie *)NULL)
	{
	pTailTrieBlocks_m = NULL;
	uiAvailableTrieNodes_m = 0;
	}
else
	{
	for ( pTailTrieBlocks_m = tap = pHeadTrieBlocks_m ; tap ; tap = tap->link )
	pTailTrieBlocks_m = tap;
	for ( uiAvailableTrieNodes_m = 0, i = 0 ; i < uiTrieArrayBlockSize_g ; ++i )
	{
	tp = &(pTailTrieBlocks_m->array[i]);
	if (	(tp->pSiblings == NULL) &&
		(tp->pChildren == NULL) &&
		(tp->pTrieInfo == NULL) &&
		(tp->cLetter == NUL) )
		++uiAvailableTrieNodes_m;
	else
		break;
	}
	}
}

/*************************************************************************
 * NAME
 *    addDataToTrie
 * ARGUMENTS
 *    pTrieHead_in      - pointer to head of trie
 *    pszKey_in      - pointer to insertion key (character string)
 *    info     - pointer to generic information
 *    linkinfo - pointer to function for adding infomation to existing list
 *    maxlevel - maximum depth to which the trie can go
 * DESCRIPTION
 *    Add info to the trie, using the insertion key.  The trie is cut off at
 *    a depth of maxlevel.
 * RETURN VALUE
 *    pointer to the head of the modified trie
 */
Trie *addDataToTrie( pTrieHead_in, pszKey_in, info, linkinfo, maxlevel )
Trie *pTrieHead_in;
const char *pszKey_in;
VOIDP info;
VOIDP (*linkinfo) P((VOIDP,VOIDP));
int maxlevel;
{
pNewInfo_m = info;			/* save the invariant parameters */
pfLinkInfo_m = linkinfo;
if (pTrieHead_in == (Trie *)NULL)
	{
	pTrieHead_in = new_trie_node();
	pTrieHead_in->cLetter   = NUL;
	pTrieHead_in->pChildren = (Trie *)NULL;
	pTrieHead_in->pSiblings = (Trie *)NULL;
	pTrieHead_in->pTrieInfo = NULL;
	}
return( enter_entry( pTrieHead_in, pszKey_in, maxlevel ) );
}

/*************************************************************************
 * NAME
 *    enter_entry
 * ARGUMENTS
 *    pTrieHead_in      - pointer to head of (sub)trie
 *    pszKey_in      - pointer to insertion key (character string)
 *    levels   - number of levels deep we can still go
 * DESCRIPTION
 *    Add info to the trie, using the insertion key.
 *    This is a recursive function.
 * RETURN VALUE
 *    pointer to the head of the modified trie
 */
static Trie *enter_entry( pTrieHead_in, pszKey_in, levels )
Trie *pTrieHead_in;
const char *pszKey_in;
int levels;
{
Trie *tp, *tailtp;
/*
 *  check for running out of key or running out of trie depth
 */
if ((*pszKey_in == NUL) || (levels <= 0))
	{
	if (pTrieHead_in)
	{			/* link new stuff to existing information */
	pTrieHead_in->pTrieInfo = (VOIDP)(*pfLinkInfo_m)(pNewInfo_m,
							  pTrieHead_in->pTrieInfo);
	return( pTrieHead_in );
	}
	else
	{			/* this level doesn't exist, so create it */
	tp = new_trie_node();
	tp->cLetter   = *pszKey_in;
	tp->pChildren = (Trie *)NULL;
	tp->pSiblings = (Trie *)NULL;
	tp->pTrieInfo = pNewInfo_m;
	return( tp );
	}
	}
/*
 *  more key and trie depth to go
 */
if (pTrieHead_in)
	{
	/*
	 *  trie exists, so check for children
	 */
	if (pTrieHead_in->pChildren)
	{
	/*
	 *  children exist, so look for the one we want
	 */
	for ( tailtp = tp = pTrieHead_in->pChildren ; tp ; tp = tp->pSiblings )
		{
		if (tp->cLetter == (unsigned char)*pszKey_in)
		break;
		tailtp = tp;
		}
	if (tp)			/* appropriate child exists, so recurse */
		{
		if (pszKey_in[1] == NUL)
		tp->pTrieInfo = (VOIDP)(*pfLinkInfo_m)(pNewInfo_m,tp->pTrieInfo);
		else
		enter_entry( tp, pszKey_in+1, levels-1 );
		}
	else		/* no appropriate child, so create one recursively */
		tailtp->pSiblings = enter_entry((Trie *)NULL, pszKey_in, levels-1);
	}
	else	/* no children, so create child recursively */
	pTrieHead_in->pChildren = enter_entry((Trie *)NULL, pszKey_in, levels-1);
	return( pTrieHead_in );
	}
else
	{
	/*
	 *  no trie exists at this level, so create this level's node, creating
	 *    the child node recursively
	 */
	tp = new_trie_node();
	tp->cLetter = *pszKey_in;
	if (pszKey_in[1] == NUL)
	{
	tp->pChildren = (Trie *)NULL;
	tp->pTrieInfo = pNewInfo_m;
	}
	else
	{
	tp->pChildren = enter_entry((Trie *)NULL, pszKey_in+1, levels-1 );
	tp->pTrieInfo = (VOIDP)NULL;
	}
	tp->pSiblings = (Trie *)NULL;
	return( tp );
	}
}

/*************************************************************************
 * NAME
 *    trie_indent
 * ARGUMENTS
 *    num - number of levels of indentation desired
 * DESCRIPTION
 *    Print a newline followed by num iterations of the indentation
 *    spacing.
 * RETURN VALUE
 *    none
 */
static void trie_indent(num)
int num;
{
putc('\n', pWriteInfoFP_m);
while (num--)
	fprintf(pWriteInfoFP_m, "   ");
}

/*************************************************************************
 * NAME
 *    walk_entries
 * ARGUMENTS
 *    pTrieHead_in    - pointer to the head of the trie
 * DESCRIPTION
 *    Recursively walk the information in the trie, using a function
 *    supplied by the original caller to process the information at each
 *    node.
 * RETURN VALUE
 *    none
 */
static void walk_entries(pTrieHead_in)
Trie *pTrieHead_in;
{
register Trie *tp;
/*
 *  process the information stored at this level in the trie
 */
if (pTrieHead_in->pTrieInfo)
	(*pfWalkInfo_m)(pTrieHead_in->pTrieInfo);
/*
 *  recursively process the children trie nodes
 */
for ( tp = pTrieHead_in->pChildren ; tp ; tp = tp->pSiblings )
	walk_entries(tp);
}

/*************************************************************************
 * NAME
 *    walkTrie
 * ARGUMENTS
 *    pTrieHead_in      - pointer to the head of the trie
 *    walkfunc - pointer to a function for processing information lists
 * DESCRIPTION
 *    Walk through a trie, processing the information stored at each node.
 * RETURN VALUE
 *    none
 */
void walkTrie(pTrieHead_in, walkfunc)
Trie *pTrieHead_in;
void (*walkfunc) P((VOIDP info));
{
/*
 *  check for nonexistent trie or function or FILE
 */
if (!pTrieHead_in || !walkfunc)
	return;			/* nothing to do */
pfWalkInfo_m = walkfunc;	/* store recursion invariant parameter */
walk_entries( pTrieHead_in );		/* recursive walking */
}

/*************************************************************************
 * NAME
 *    writeTrieData
 * ARGUMENTS
 *    pTrieHead_in      - pointer to the head of the trie
 *    showinfo - pointer to a function for displaying the information lists
 *    outfp    - output FILE pointer
 * DESCRIPTION
 *    Walk through a trie, displaying the information stored at each node.
 * RETURN VALUE
 *    none
 */
void writeTrieData(pTrieHead_in, showinfo, outfp)
Trie *pTrieHead_in;
void (*showinfo) P((VOIDP info, int indent, FILE *fp));
FILE *outfp;
{
/*
 *  check for nonexistent trie or function or FILE
 */
if (!pTrieHead_in || !showinfo || !outfp)
	return;			/* nothing to do */

pfWriteInfo_m = showinfo;	/* store recursion invariant parameter */
pWriteInfoFP_m = outfp;
show_entries( pTrieHead_in, 0 );		/* recursive showing */
fflush(outfp);
}

/*************************************************************************
 * NAME
 *    show_entries
 * ARGUMENTS
 *    pTrieHead_in    - pointer to the head of the trie
 * DESCRIPTION
 *    Recursively show the information in the trie, using a function
 *    supplied by the original caller to display the information at each
 *    node.
 * RETURN VALUE
 *    none
 */
static void show_entries(pTrieHead_in, level)
Trie *pTrieHead_in;
int level;
{
register Trie *tp;
/*
 *  show the information stored at this level in the trie
 */
trie_indent(level);
fprintf(pWriteInfoFP_m, "%2d: ", level);
if (isascii(pTrieHead_in->cLetter) && isprint(pTrieHead_in->cLetter))
	fprintf(pWriteInfoFP_m, "'%c'", pTrieHead_in->cLetter);
else
	fprintf(pWriteInfoFP_m, "'\\%o'", pTrieHead_in->cLetter);
/*
 *  show the information stored at this level in the trie
 */
if (pTrieHead_in->pTrieInfo)
	(*pfWriteInfo_m)(pTrieHead_in->pTrieInfo, 4 + 3*level, pWriteInfoFP_m);
/*
 *  recursively display the children trie nodes
 */
for ( tp = pTrieHead_in->pChildren ; tp ; tp = tp->pSiblings )
	show_entries(tp, level+1);
}

/*************************************************************************
 * NAME
 *    findDataInTrie
 * ARGUMENTS
 *    pTrieHead_in - pointer to the head of the trie
 *    pszKey_in - pointer to the key character string
 * DESCRIPTION
 *    Search the trie for information stored using the key for access.
 * RETURN VALUE
 *    pointer to the generic information found in the trie, or NULL if
 *    the search fails
 */
VOIDP findDataInTrie(pTrieHead_in, pszKey_in)
const Trie *	pTrieHead_in;
const char *	pszKey_in;
{
const Trie *tp;
/*
 *  check for nonexistent trie
 */
if (pTrieHead_in == NULL)
	return( NULL );		/* no trie to search in */
/*
 *  check for running out of key or trie:  ==> we've found it!
 */
if (	(pszKey_in == NULL) ||
	(*pszKey_in == NUL) ||
	(pTrieHead_in->pChildren == NULL) )
	return( pTrieHead_in->pTrieInfo );
/*
 *  check for first key letter in children's letters
 */
for ( tp = pTrieHead_in->pChildren ; tp ; tp = tp->pSiblings )
	{
	if (tp->cLetter == *(unsigned char *)pszKey_in)
	return( findDataInTrie(tp, pszKey_in+1) );
	}
return( NULL );		/* not in the trie */
}

/*************************************************************************
 * NAME
 *    erase_trie
 * ARGUMENTS
 *    pTrieHead_in       - pointer to the head of the trie
 *    eraseinfo - pointer to a function for erasing the information lists
 * DESCRIPTION
 *    Walk through a trie, freeing all the memory allocated for it.
 * RETURN VALUE
 *    none
 */
static void erase_trie(pTrieHead_in, eraseinfo)
Trie *pTrieHead_in;
void (*eraseinfo) P((VOIDP));
{
if (pTrieHead_in == (Trie *)NULL)
	return;				/* nothing to do */
/*
 *  recurse across, erasing
 */
erase_trie( pTrieHead_in->pSiblings, eraseinfo);
pTrieHead_in->pSiblings = (Trie *)NULL;
/*
 *  recurse down, erasing
 */
erase_trie( pTrieHead_in->pChildren, eraseinfo);
pTrieHead_in->pChildren = (Trie *)NULL;

if (pTrieHead_in->pTrieInfo && eraseinfo)
	{
	/*
	 *  erase the stored information
	 */
	(*eraseinfo)(pTrieHead_in->pTrieInfo);
	}
pTrieHead_in->pTrieInfo = (VOIDP)NULL;
pTrieHead_in->cLetter = NUL;
if (pHeadTrieBlocks_m == (struct block_trie *)NULL)
	{
	/*
	 *  erase this node itself
	 */
	freeMemory( (char *)pTrieHead_in );
	}
}

/*************************************************************************
 * NAME
 *    eraseTrie
 * ARGUMENTS
 *    pTrieHead_in       - pointer to the head of the trie
 *    eraseinfo - pointer to a function for erasing the information lists
 * DESCRIPTION
 *    Walk through a trie, freeing all the memory allocated for it.
 * RETURN VALUE
 *    none
 */
void eraseTrie(pTrieHead_in, eraseinfo)
Trie *pTrieHead_in;
void (*eraseinfo) P((VOIDP));
{
if (pTrieHead_in == (Trie *)NULL)
	return;				/* nothing to do */
erase_trie(pTrieHead_in, eraseinfo);
if (pHeadTrieBlocks_m != (struct block_trie *)NULL)
	erase_block_trie();
}

/************************************************************************
 * NAME
 *    check_block_trie
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    check for block_trie buffers allocated previously
 * RETURN VALUE
 *    none
 */
void check_block_trie()
{
struct block_trie *tap;
Trie *tp;
unsigned i;
unsigned block_used;

reportError(DEBUG_MSG,
		"uiTrieArrayBlockSize_g = %lu\n", uiTrieArrayBlockSize_g);
if (pHeadTrieBlocks_m == (struct block_trie *)NULL)
	reportError(DEBUG_MSG, "no trie blocks allocated\n");
for ( tap = pHeadTrieBlocks_m ; tap ; tap = tap->link )
	{
	for ( block_used = 0, i = 0 ; i < uiTrieArrayBlockSize_g ; ++i )
	{
	tp = &(tap->array[i]);
	if (	(tp->pSiblings != NULL) ||
		(tp->pChildren != NULL) ||
		(tp->pTrieInfo != NULL) ||
		(tp->cLetter != NUL) )
		++block_used;
	}
	reportError(DEBUG_MSG, "block %p / %p has %u trie nodes in use\n",
		 (void *)tap, (void *)tap->array, block_used);
	}
}

/*****************************************************************************
 * NAME
 *    removeDataFromTrie
 * DESCRIPTION
 *    remove a stored piece of information from the trie
 * RETURN VALUE
 *    0 if successful, 1 if an error occurs
 */
int removeDataFromTrie(pTrieHead_in, pszKey_in, info, removeInfo)
Trie *pTrieHead_in;
char *	pszKey_in;
VOIDP	info;
VOIDP	(*removeInfo) P((VOIDP old,VOIDP list));
{
register Trie *tp;
/*
 *  check for nonexistent trie
 */
if (pTrieHead_in == (Trie *)NULL)
	return( 1 );		/* no trie to search in */
/*
 *  check for running out of key or trie:  ==> we've found it!
 */
if (	(pszKey_in               == (char *)NULL) ||
	(*pszKey_in              == NUL)          ||
	(pTrieHead_in->pChildren == (Trie *)NULL) )
	{
	pTrieHead_in->pTrieInfo = (*removeInfo)(info, pTrieHead_in->pTrieInfo);
	return( 1 );
	}
/*
 *  check for first key letter in children's letters
 */
for ( tp = pTrieHead_in->pChildren ; tp ; tp = tp->pSiblings )
	{
	if (tp->cLetter == *(unsigned char *)pszKey_in)
	return( removeDataFromTrie(tp, pszKey_in+1, info, removeInfo) );
	}
return( 1 );		/* not in the trie */
}
