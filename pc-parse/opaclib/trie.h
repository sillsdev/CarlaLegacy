/* TRIE.H - definition of generic trie structure
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _TRIE_H_INCLUDED
#define _TRIE_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif

/****************************************************************************
 * NAME
 *    typedef Trie
 * DESCRIPTION
 *    structure used in generic tries
 */
typedef struct s__trienode
	{
	unsigned char	 cLetter;	/* letter (code) at this node */
	struct s__trienode * pChildren;	/* pointer to children trie nodes */
	struct s__trienode * pSiblings;	/* pointer to sibling trie nodes */
	VOIDP		 pTrieInfo;	/* pointer to stored information */
	} Trie;
/*
 *  function declarations
 */
extern Trie * addDataToTrie P((Trie *       pTrieHead_io,
				   const char * pszKey_in,
				   VOIDP        pInfo_in,
				   VOIDP (*     pfLinkInfo_in)(VOIDP pNew_in,
							   VOIDP pList_io),
				   int          iMaxTrieDepth_in));
extern VOIDP findDataInTrie P((const Trie * pTrieHead_in,
				   const char * pszKey_in));
extern int removeDataFromTrie P((Trie * pTrieHead_in,
				 char * pszKey_in,
				 VOIDP  pInfo_in,
				 VOIDP (* pfRemoveInfo_in)(VOIDP pOld_in,
							   VOIDP pList_io)));
extern void walkTrie P((Trie *  pTrieHead_in,
			void (* pfWalk_in)(VOIDP pList_in)));
extern void writeTrieData P((Trie *  pTrieHead_in,
				 void (* pfShowInfo_in)(VOIDP  pList_in,
							int    iIndent_in,
							FILE * pOutputFP_in),
				 FILE *  pOutputFP_in));
extern void eraseTrie P((Trie *  pTrieHead_io,
			 void (* pfEraseInfo_in)(VOIDP pList_io)));
/*
 *  global variables
 */
/* number of Trie nodes to malloc at once */
extern size_t uiTrieArrayBlockSize_g;

/***************************************************************************
 * EDIT HISTORY
 * 20-May-89	Steve McConnel - loosely based on TRISET.C and TRIACC.C from
 *			AMPLE
 * 13-Jul-89	hab - de-"lint" the source
 * 29-Jun-90 BK/ALB - Fix for portability to MAC, add string.h (STAMP 1.1b)
 *  3-Jun-92	SRMc - add myalloc.h, remove redundant explicit extern function
 *			declarations
 *		     - add extern strpos() declaration
 *  3-Jun-92	SRMc - add function prototypes and once-only protection to the
 *			header file
 *  4-Jun-92	SRMc - fix for ANSI C declarations throughout
 * 28-Sep-92	SRMc - add free_trie()
 * 26-May-93	SRMc - allow myalloc() and friends to return NULL
 * 26-Sep-94	SRMc - change letters (string) to letter (character)
 * 11-Oct-94	SRMc - add FILE *outfp argument to show_trie()
 *  3-Nov-94	SRMc - allow TRIE nodes to be allocated in large blocks rather
 *			than one at a time
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 *  2-Nov-95	SRMc - fix bugs in deallocating the large blocks of TRIE nodes
 *  9-Dec-96	SRMc - rename functions and global variables
 *		     - add removeDataFromTRIE()
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 22-May-97	SRMc - fix a few misleading comments
 *		     - rename several variables for clarity
 *  2-Oct-97	SRMc - fix for revised reportError()
 *  8-Oct-97	SRMc - rename TRIE to Trie (including inside function and
 *			variable names) for consistency with other OPAC data
 *			structure names
 *		     - cosmetic changes and proofreading
 * 21-Jul-98	SRMc - fix a typo in a comment
 * 16-Oct-98	SRMc - make header files safe for #including in C++ sources
 */
#ifdef __cplusplus
}
#endif
#endif /* _TRIE_H_INCLUDED */
