/* KIMMODEF.H - internal global defines and struct definitions for PC-KIMMO
 ***************************************************************************
 *
 *	typedef struct ... KimmoLexicon
 *	typedef struct ... KimmoAlternation
 *	typedef struct ... KimmoLexItem
 *	typedef struct ... KimmoFSAColumn
 *	typedef struct ... KimmoRule
 *	typedef struct ... KimmoData
 *	typedef struct ... KimmoResult
 *	typedef struct ... KimmoMorpheme
 *
 ***************************************************************************
 * Copyright 1997, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef KIMMODEF_H_INCLUDED
#define KIMMODEF_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
#include "kimmo.h"
/*
 *  forward type definitions
 */
typedef struct kimmo_lex_item		KimmoLexItem;
typedef struct kimmo_fsa_column		KimmoFSAColumn;

/****************************************************************************
 * NAME
 *    typedef KimmoLexicon
 * DESCRIPTION
 *    data structure for storing a section of the lexicon
 */
struct kimmo_lexicon {
	unsigned char *	pszName;	/* name of the lexicon section */
	Trie *		pStorage;	/* information of lexical section */
	};

/****************************************************************************
 * NAME
 *    typedef KimmoAlternation
 * DESCRIPTION
 *    data structure for storing an alternation (continuation class) of
 *    lexicons
 */
struct kimmo_alternation {
	unsigned char *	pszName;	/* name of the alternation */
	short *		piLexicons;	/* -1 terminated array of indices */
	};

/****************************************************************************
 * NAME
 *    typedef KimmoLexItem
 * DESCRIPTION
 *    data structure for linked list of items stored in a lexicon
 */
struct kimmo_lex_item {
	KimmoLexItem *	pNext;			/* link to next element */
	unsigned char *	pszLexString;		/* lexical string */
	unsigned short	uiContinuation;		/* array index of continuation
						   (KimmoAlternation) */
	unsigned char *	pszGloss;		/* gloss string ("feature") */
	unsigned short *	puiFeatureIndexes;	/* array of feature indexes */
	};

/****************************************************************************
 * NAME
 *    typedef KimmoSubset
 * DESCRIPTION
 *    data structure for storing an alphabet subset
 */
struct kimmo_subset {
	unsigned char *	pszName;	/* the name of the alphabet subset */
	unsigned char *	pszMembers;	/* NUL-terminated list of characters */
	};

/****************************************************************************
 * NAME
 *    typedef KimmoFSAColumn
 * DESCRIPTION
 *    data structure for storing one column of a rule
 */
struct kimmo_fsa_column {
	unsigned char *	pszLexName;	/* literal from file input */
	unsigned char	eLexType;	/* KIMMO_ALPHABET_CHAR, ... */
	unsigned char *	pszSurfName;	/* literal from file input */
	unsigned char	eSurfType;	/* KIMMO_ALPHABET_CHAR, ... */
	unsigned char *	pLexChars;	/* lexical chars of feasible pairs */
	unsigned char *	pSurfChars;	/* surface chars of feasible pairs */
	unsigned short	uiPrecedence;	/* number of feasible pairs */
	unsigned short *	puiTransitions;	/* column from the state transition
					   table */
	};
/*
 *  the following are defined to allow testing of more than one at a time by
 *  bitwise logical OR, even though they are logically distinct (only one at
 *  a time can be set)
 */
#define KIMMO_ALPHABET_CHAR  01	/* single alphabetic character */
#define KIMMO_SUBSET_CHAR    02	/* subset of the entire alphabet */
#define KIMMO_NULL_CHAR      04	/* the "null" character */
#define KIMMO_ANY_CHAR      010	/* any character at all */
#define KIMMO_BOUNDARY_CHAR 020	/* word boundary */

/****************************************************************************
 * NAME
 *    typedef KimmoRule
 * DESCRIPTION
 *    data structure for storing rules
 */
struct kimmo_rule {
	unsigned char *	pszName;	/* name of this rule */
	unsigned short	iRowCount;	/* number of rows */
	unsigned short	iColumnCount;	/* number of columns */
	KimmoFSAColumn *	pColumns;	/* one for each column */
	unsigned char *	puiFinalStates;	/* one for each row */
	short		bActive;	/* off/on flag */
	};

/****************************************************************************
 * NAME
 *    typedef KimmoPair
 * DESCRIPTION
 *    data structure for storing a feasible pair
 */
struct kimmo_pair {
	unsigned char	cLexical;	/* lexicon character */
	unsigned char	cSurface;	/* surface character */
	};

/****************************************************************************
 * NAME
 *    typedef KimmoMorpheme
 * DESCRIPTION
 *    data structure for storing recognizer results
 */
struct kimmo_morpheme {
	KimmoMorpheme *	pPrevious;
	KimmoMorpheme *	pNext;
	KimmoLexItem *	pLexItem;
	unsigned char *	pszLexiconSection;
	};

/*****************************************************************************
 *  Function prototypes
 */
/*
 *  rules.c
 */
extern void	computeKimmoFeasiblePairs P((KimmoData * pKimmo_io));
/*
 *  lexicon.c
 */
extern KimmoLexicon *	findKimmoLexiconSection P((
						 unsigned char * pszLexiconName_in,
						 KimmoData *     pKimmo_in));
/*
 *  pckfuncs.c
 */
extern int		moveKimmoAutomata P((unsigned lexChar,
						 unsigned surfChar,
						 int *config,
						 KimmoData * pKimmo_in));
extern int		checkKimmoFinalConfiguration P((int *config,
							   KimmoData * pKimmo_in));
extern int		findKimmoAlphabetIndex P((unsigned char *token,
						  KimmoData * pKimmo_in));
extern int		validateKimmoWordForm P((unsigned char *form,
						 KimmoData * pKimmo_in));
extern int		convertCharacterToKimmoIndex P((unsigned char *token,
							   KimmoData * pKimmo_in));
extern unsigned char *	convertKimmoIndexToCharacter P((unsigned idx,
							   KimmoData * pKimmo_in));
extern void		writeKimmoIndexString P((FILE *outfp,
						 unsigned char *string,
						 KimmoData * pKimmo_in));
extern PATREdgeList *	parseKimmoResultWithPATR P((
						  KimmoMorpheme * pMorphList_in,
						  KimmoData *     pKimmo_in));
extern char *	eraseKimmoNullChars P((char *string,
					   KimmoData * pKimmo_in));
KimmoPair * findLexical P((KimmoPair * pPairs_in,
			   int         cLexical_in));

#ifdef __cplusplus
}
#endif
#endif /*KIMMODEF_H_INCLUDED*/
