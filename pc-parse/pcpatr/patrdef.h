/* PATRDEF.H - PC-PATR internal parser data structures and function prototypes
 ******************************************************************************
 * Copyright 1997, 2000 by SIL International.  All rights reserved.
 */
#ifndef _PATRDEF_H_INCLUDED_
#define _PATRDEF_H_INCLUDED_
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
/*
 *  constants used for argument to visitPATREdges()
 */
#define PATR_PREORDER	1
#define PATR_POSTORDER	0
/*
 *  forward typedef declarations
 */
typedef struct patr_rule		PATRRule;
typedef struct patr_rule_list		PATRRuleList;
typedef struct patr_lexical_rule	PATRLexicalRule;
typedef struct patr_path_list		PATRPathList;
typedef struct patr_hash_list		PATRHashList;
typedef struct patr_definition		PATRDefinition;
typedef struct patr_complex_feature	PATRComplexFeature;
typedef struct patr_feature_disjunction	PATRFeatureDisjunction;
typedef struct patr_logical_expression  PATRLogicalExpression;

/*****************************************************************************
 * NAME
 *    PATRLexicalRule
 * DESCRIPTION
 *    data structure for "Define x as ..."
 *    Lexical rules consist of a set of associated in and out feature paths.
 */
struct patr_lexical_rule
	{
	int			bReplace;	/* overwrite instead of unify */
	PATRFeature *	pInFeat;
	PATRFeature *	pOutFeat;
	PATRLexicalRule *	pNext;
	};

/*****************************************************************************
 * NAME
 *    PATRDefinition
 * DESCRIPTION
 *    data structure for "Let x be ..." and "Define x as ..."
 */
struct patr_definition
	{
	int			eType;		/* type of definition */
#define PATR_TEMPLATE     0
#define PATR_LEXICAL_RULE 1
#define PATR_CONSTRAINT   2
	char *		pszName;	/* definition name (x) */
	union {
	PATRFeatureDisjunction * pFeatDisj;	/* feature template */
	PATRLexicalRule *        pLexRule;	/* lexical rule */
	PATRLogicalExpression *  pExpression;	/* constraint */
	}		u;
	PATRDefinition *	pNext;		/* link to next definition */
	};

/*****************************************************************************
 * NAME
 *    PATREdge
 * DESCRIPTION
 *    basic data structure for bottom-up left corner chart parser
 */
struct patr_edge
	{
	int			iStart;	/* Vertices to which this edge connects */
	int			iEnd;
	char *		pszLabel;	/* Label of left hand side */
	PATRFeature *	pFeature;	/* Pointer to feature DAG associated
					   with this edge */
	int			eType;		/* type of edge */
#define PATR_RULE_EDGE		0
#define PATR_LEXICAL_EDGE	1
	union {
	struct {
		PATRRule *		pRule;	/* PATR rule associated with edge */
		PATREdgeList *	pChildren;	/* list of children */
		int			iNext;	/* position of next nonterm in rule */
		}	r;			/* If edge is for a rule */
	struct {
		char *		pszTerminal;	/* Actual terminal text */
		PATRWordCategory *	pWord;		/* Associated word category */
		}	l;			/* If edge is for a terminal symbol */
	}		u;
	/*  The following fields are only used during printing */
	short	iCenterColumn;	/* column number of center of edge */
	short	iCurrentRow;	/* row in text area for current edge */
	int		iIndex;		/* unique index (1..n) of this edge */
	int		iCount;		/* number of times this edge used in parse */
	char	bFailed;	/* true if unification of this edge failed */
	char	bPrinted;	/* true if printed already */
	};

/*****************************************************************************
 * NAME
 *    PATRNonterminal
 * DESCRIPTION
 *    data structure for a rule nonterminal
 */
typedef struct patr_nonterminal
	{
	char *			pszName;	/* element name with index */
	char *			pszLhsName;	/* left hand side name with
						   index */
	struct patr_nonterminal *	pNext;		/* link to next element */
	} PATRNonterminal;

/*****************************************************************************
 * NAME
 *    PATRPriorityUnion
 * DESCRIPTION
 *    data for one priority union operation associated with a grammar rule
 *    a priority union operation requires an input path (right hand feature)
 *    and an output path (left hand feature)
 */
typedef struct patr_union
	{
	StringList *        pOutputPath;
	StringList *        pInputPath;	/* one of these two items is NULL, */
	PATRFeature *       pInputAtom;	/* and the other one has a value   */
	struct patr_union * pNext;
	} PATRPriorityUnion;

/*****************************************************************************
 * NAME
 *    PATRLogicalFactor
 * DESCRIPTION
 *    data structure that points to either a feature structure or an embedded
 *    logical expression involving feature structures
 */
typedef struct patr_logical_factor
	{
	union {
	PATRLogicalExpression * pExpression;
	PATRFeature *           pFeature;
	} u;
	enum { kExpression, kFeature } eType;
	} PATRLogicalFactor;

/*****************************************************************************
 * NAME
 *    PATRLogicalExpression
 * DESCRIPTION
 *    contains the information describing a logical relationship between two
 *    feature structures, or between a feature structure and an embedded
 *    logical expression, or between two embedded logical expressions
 */
struct patr_logical_expression
	{
	enum { kExist, kNegate, kAnd, kOr, kConditional, kBiconditional }
						eOperation;
	PATRLogicalFactor * pLeft;
	PATRLogicalFactor * pRight;
	};

/*****************************************************************************
 * NAME
 *    PATRConstraint
 * DESCRIPTION
 *    data for one constraint expression associated with a grammar rule
 */
typedef struct patr_constraint
	{
	StringList *             pPath;
	PATRLogicalExpression *  pExpression;
	struct patr_constraint * pNext;
	} PATRConstraint;

/*****************************************************************************
 * NAME
 *    PATRRule
 * DESCRIPTION
 *    context free grammar rule - First is left side, rest are right
 */
struct patr_rule
	{
	char *		pszLHS;		/* LHS nonterminal symbol */
	PATRNonterminal *	pRHS;		/* list of RHS nonterminals from
					   expanded formula */
	PATRFeature *	pUniFeature;	/* pointer to feature DAG associated
					   with this rule */
	char *		pszID;		/* unique identifying string */
	int			iLineNumber;	/* input file line number */
	int			iNontermCount;	/* number of nonterminals on right hand
					   side */
				/* this corresponds to pszLHS and pRHS */
	char **		apszNonterms;	/* array of nonterminals with any */
	int			iNontermsAlloc;	/* index suffixes stripped */
	PATRPriorityUnion * pPriorityUnions;/* pointer to the ordered list of
					   priority union operations associated
					   with this rule */
	PATRConstraint *	pConstraints;	/* pointer to the set of logical
					   constraints associated with this
					   rule */
	};

/*****************************************************************************
 * NAME
 *    PATRRuleList
 * DESCRIPTION
 *    data structure for list of rules
 */
struct patr_rule_list
	{
	PATRRule *			pRule;
	struct patr_rule_list *	pNext;
	};

/*****************************************************************************
 * NAME
 *    PATRDisplayedFeature
 * DESCRIPTION
 *    data structure for a list of displayed nodes
 */
struct patr_displayed_feature
	{
	PATRFeature *	pFeature;	/* Node displayed */
	int			bMultiple;	/* Remember it's used multiple times */
	int			bVisited;	/* Remember it was displayed */
	struct patr_displayed_feature *	pNext;	/* List link */
	};

/*****************************************************************************
 * NAME
 *    PATRPathList
 * DESCRIPTION
 *    data structure for a list of Paths
 *    (Path structure is a linked list of strings)
 */
struct patr_path_list
	{
	StringList *		pPath;
	struct patr_path_list *	pNext;
	};

/*****************************************************************************
 * NAME
 *    PATRHashList
 * DESCRIPTION
 *    data structure for a hash table list
 */
struct patr_hash_list
	{
	char *	   		pszKey;	/* Key for entry */
	VOIDP	   		pData;	/* pointer to associated data */
	struct patr_hash_list *	pNext;	/* Pointer to next entry in chaining */
	};

/*****************************************************************************
 * NAME
 *    PATRGrammar
 * DESCRIPTION
 *    data structure for storing a loaded grammar in such a way as to make the
 *    PATR functions reentrant
 */
#define PATR_HASH_SIZE	 43 /*20*/	/* Size of hash stuctures */
struct patr_grammar
	{
	PATRDefinition *	pDefinitionTable;
	PATRRuleList *	pRuleTable;
	PATRHashList *	aLeftCorners[PATR_HASH_SIZE];
	PATRHashList *	aFirsts[PATR_HASH_SIZE];
	PATRHashList *	aFirstInverses[PATR_HASH_SIZE];
	char *		pszStartSymbol;
	char *		pszCatFeatName;
	char *		pszLexFeatName;
	char *		pszGlossFeatName;
#ifndef hab130
	char *		pszRootGlossFeatName;
#endif /* hab130 */
	PATRPathList *	pRestrictors;
	StringList *	pAttributeOrder;
	PATRPriorityUnion ** apPriorityUnions;
	PATRConstraint **    apConstraints;
	};

/****************************************************************************
 * NAME
 *    PATRLexItem (struct patr_lex_item)
 * DESCRIPTION
 *    structure for linked list of items stored in a lexicon
 */
struct patr_lex_item
	{
	PATRLexItem *	pNext;		/* link to next element */
	unsigned char *	pszLexString;	/* lexical string (word) */
	unsigned char *	pszGloss;	/* lexical gloss */
#ifndef hab130
	unsigned char *	pszRootGloss;	/* lexical rootgloss */
#endif /* hab130 */
	unsigned short	uiCategory;	/* lexical category (part of speech) */
	short *		piFeatureIndexes; /* array of feature indexes */
	PATRFeature *	pFeature;	/* pointer to feature structure */
	};

/****************************************************************************
 * NAME
 *    PATRLexicon
 * DESCRIPTION
 *    data structure for a word lexicon
 */
struct patr_lexicon
	{
	Trie *		pStorage;	/* top of lexicon storage */
	/*
	 *  maximum length of phrase stored as word
	 */
	unsigned		uiMaxLexicalPhraseSize;
	/*
	 *  number of entries stored
	 */
	unsigned long	iLexEntriesCount;
	/*
	 *  internal variables
	 */
	char **		ppszCategories;
	unsigned		iCategoriesStored;
	unsigned		iCategoriesAllocated;
	char **		ppszFeatures;
	unsigned		iFeaturesStored;
	unsigned		iFeaturesAllocated;
	char **		ppszFeaturePaths;
	unsigned		iFeaturePathsStored;
	unsigned		iFeaturePathsAllocated;
	};

/*****************************************************************************
 * NAME
 *    PATRFeature
 * DESCRIPTION
 *    data structure for a node of a feature structure
 *
 *    Picture of feature structure:
 *    PATRFeature                         PATRComplexFeature
 *    |-----|-----|                       |-----|-----|
 *    |  2  |  -------------------------->| num |  -----> PATRFeature
 *    |-----|-----|                       |  .  |  .  |
 *     type:                              |  .  |  .  |
 *    1 PATR_ATOM    char *               |  .  |  .  |
 *    2 PATR_COMPLEX PATRComplexFeature * |  .  |  .  |
 *    3 PATR_FORWARD PATRFeature *        |     |     |
 *    4 PATR_NULLFS                       label  value
 *    5 PATR_FAILFS
 *    6 PATR_DEFATOM char *
 */
struct patr_feature
	{
	int		eType;		/* feature type: PATR_ATOM, PATR_COMPLEX ... */
#define PATR_ATOM	1
#define PATR_COMPLEX	2
#define PATR_FORWARD	3
#define PATR_NULLFS	4
#define PATR_FAILFS	5
#define PATR_DEFATOM	6
#define PATR_DISJUNCT	7
#ifndef hab130v
#define PATR_VARIABLE	8
#endif /* hab130v */
	union {			/* feature value */
	char *			 pszAtom;	/* PATR_ATOM or PATR_DEFATOM */
#ifndef hab130v
	int                      iVariable;	/* PATR_VARIABLE */
												/* value is 0-8 */
#endif /* hab130v */
	PATRComplexFeature *	 pComplex;	/* PATR_COMPLEX */
	PATRFeatureDisjunction * pDisjunction;	/* PATR_DISJUNCT */
	PATRFeature *		 pForward;	/* PATR_FORWARD */
	}	u;
	};

/*****************************************************************************
 * NAME
 *    PATRComplexFeature
 * DESCRIPTION
 *    data structure for a list of labeled features
 */
struct patr_complex_feature
	{
	char *				pszLabel;	/* Feature label */
	PATRFeature *			pValue;		/* Feature value */
	struct patr_complex_feature *	pNext;		/* link to next
							   label-value pair */
	};

/*****************************************************************************
 * NAME
 *    PATRFeatureDisjunction
 * DESCRIPTION
 *    data structure for a list of features
 */
struct patr_feature_disjunction
	{
	PATRFeature *		pFeature;	/* Feature */
	PATRFeatureDisjunction *	pNext;		/* link to next feature
						   in disjunction */
	};

/*****************************************************************************
 * NAME
 *    PATRWordCategory
 * DESCRIPTION
 *    data structure to represent one category and feature set (in a list) for
 *    a word.  Multiple PATRWordCategory entries represent ambiguous words.
 *    bUsed is a flag to mark the word category as used in a successful parse.
 *
 *    Picture of input sentence to parse:
 *
 *            PATRWord                     PATRWordCategory
 *     |-----|-----|-----|      |------|-----|-----|-----|
 *     |  1  | the |  --------->| Det  |  .  |  .  |  -----> Feature
 *     |  .  |  .  |  .  |      |  .   |  .  |  .  |  .  |   Structure
 *     |  .  |  .  |  .  |      |  .   |  .  |  .  |  .  |
 *     |  .  |  .  |  .  |      |  .   |  .  |  .  |  .  |
 *     |     |     |     |      |      |     |     |     |
 *     |     |     |     |      |      |     |     |     |
 *     |     |     |     |    category |used |ambig| feat
 *      word |word | word                in    num    ptr
 *     number|name | ptr                parse
 */
struct patr_categ {
	char *		pszCategory;	/* A category of the word */
	PATRFeature *	pFeature;	/* Pointer to feature structure */
	int			bUsed;		/* Used in some parse (for disambig) */
	int			iAmbigNumber;	/* Ambiguity number this one is */
	struct patr_categ *	pNext;	/* Link to next category of word (ambiguity) */
	};

/*****************************************************************************
 * NAME
 *    PATRVertex
 * DESCRIPTION
 *    data for one vertex of the parse chart (~ 1 word)
 */
typedef struct {
	char *		pszTerminal;	/* terminal symbol just to the left */
			/* list of incoming active edges */
	PATREdgeList *	pIncomingActiveEdges;
			/* list of incoming passive edges */
	PATREdgeList *	pIncomingPassiveEdges;
			/* list of failed edges */
	PATREdgeList *	pIncomingFailedEdges;
			/* list of nonterminal allowed to start here */
	StringList *	pAllowedNonterms;	/* (for top down filtering) */
	} PATRVertex;

/*****************************************************************************
 * NAME
 *    PATRParseData
 * DESCRIPTION
 *    data used/created during a parse operation
 */
typedef struct patr_parse_data
{
	PATRData *		pPATR;
	unsigned		uiSentenceWordCount;
	unsigned long	uiProgressCount;
	/*
	 *  Table for storing LC relation info
	 */
	PATRHashList *	aLeftCorners[PATR_HASH_SIZE];
	/*
	 *  Table for storing FIRST relation info
	 */
	PATRHashList *	aFirsts[PATR_HASH_SIZE];
	/*
	 *  Table for storing FIRSTINVERSE relation info
	 */
	PATRHashList *	aFirstInverses[PATR_HASH_SIZE];
	/*
	 *  Counter of used vertices in chart
	 */
	int iVertexCount;
	/*
	 *  Array of vertices in chart
	 */
	PATRVertex * pVertices;
	int	iVerticesAlloc;
	/*
	 *  only one copy will ever exist in memory at once
	 */
	PATREdge hyp_edge;
	} PATRParseData;

/*****************************************************************************
 *  Function prototypes and data extern declarations
 */
/*
 *  grammar.c
 */
extern PATRFeature * parsePATRFeaturePath P((char *        pszFeaturePath_in,
						 PATRGrammar * pGrammar_in,
						 PATRData *    pPATR_in));
/*
 *  lcparse.c
 */
extern void	initPATRHashTables P((PATRParseData * pData));
extern void	savePATRHashTables P((PATRParseData * pData,
					  PATRGrammar * pGrammar_io));
extern void	addPATRLeftCorner  P((PATRRule * pRule_in,
					  PATRParseData * pData));
extern void	buildPATRFirst	   P((char * pLHS_in,
					  char * pLeftCorner_in,
					  PATRParseData * pData));
extern void	showPATREdge	   P((PATREdge *    edgep,
					  PATRData *    pPATR_in));
/*
 *  patalloc.c
 */
extern void	markPATRGarbage P((int eGarbageType_in, PATRData * pPATR_io));
extern void	collectPATRGarbage P((int eGarbageType_in,
					  PATRData * pPATR_io));
extern void	unmarkPATRGarbage P((int eGarbageType_in,
					 PATRData * pPATR_io));
extern void	freeCollectedPATRGarbage P((PATRData * pThis));
extern void	cleanupPATRGarbage P((PATRGarbage * pGarbage_in,
					  PATRData * pThis));
/*
 *  types of "garbage" that we want to mark for collection
 */
#define PATR_GARBAGE_PARSE		1
#define PATR_GARBAGE_UNIFY		2
#define PATR_GARBAGE_DISPLAY		3
#define PATR_GARBAGE_GRAMMAR		4
extern PATRDisplayedFeature *	allocPATRDisplayedFeature P((PATRData * pPATR_io));
extern PATRNonterminal *	allocPATRNonterminal P((PATRData * pPATR_io));
extern PATRComplexFeature *	allocPATRComplexFeature P((PATRData * pPATR_io));
extern PATRFeatureDisjunction *	allocPATRFeatureDisjunction P((PATRData * pPATR_io));
extern PATRRule *		allocPATRRule P((PATRData * pPATR_io));
extern PATRRuleList *		allocPATRRuleList P((PATRData * pPATR_io));
extern StringList *		allocPATRNontermList P((PATRData * pPATR_io));
extern StringList *		allocPATRFeaturePath P((PATRData * pPATR_io));
extern void			deallocatePATRFeaturePath P((
							StringList * pDefunct_io,
							PATRData * pPATR_io));
extern PATRHashList *		allocPATRHashList P((PATRData * pPATR_io));
extern PATREdge *		allocPATREdge P((PATRData * pPATR_io));
extern PATREdgeList *		allocPATREdgeList P((PATRData * pPATR_io));
extern char *			allocPATRStringBuffer P((int iLength_in,
							 PATRData * pPATR_io));
extern PATRWord *		allocPATRWord P((PATRData * pPATR_io));
extern PATRWordCategory *	allocPATRWordCategory P((PATRData * pPATR_io));
extern PATRFeature *		allocPATRFeature P((PATRData * pPATR_io));
extern char *			allocPATRStringCopy P((char * pszString_in,
							   PATRData * pPATR_io));
/*
 *  patrfunc.c
 */
extern char *			storedPATRString P((char *pszString,
							PATRData * pPATR_io));
extern PATRFeature *		findPATRAttribute P((PATRFeature * pFeature_in,
							 char * pszLabel_in));
extern PATRFeature *		followPATRFeaturePath P((
							 PATRFeature * pFeature_in,
							 StringList *  pPath_in));
extern PATRFeature *		findOrAddPATRAttribute P((
							 PATRFeature * pFeature_io,
							 char * pszLabel_in,
							 PATRData * pPATR_in));
extern void			visitPATRTree P((PATREdge * edgep,
						 int depth,
						 int preorder,
						 void (* routp)(PATREdge *,
								int,
								PATRData *),
						 PATRData * pPATR_in));
extern int			arePATRFeaturesIdentical P((PATRFeature *fnp1,
							   PATRFeature *fnp2));
extern PATRFeature *		followPATRForwardPointers P((
						   PATRFeature * pFeature_in));
extern PATRFeatureDisjunction *	createPATRFeatureDisjunction P((
						   PATRFeature * pFeature_in,
						   PATRData * pPATR_in));
extern PATRFeature *		copyPATRFeature P((PATRFeature * pFeature_in,
						   PATRData * pPATR_in));
extern PATRFeatureDisjunction *	findPATRTemplate P((char * pszName_in,
						   PATRGrammar * pGrammar_in,
							PATRData * pPATR_in));
extern char *			findPATRCatFeature P((
						   PATRFeature * pFeature_in,
						   PATRGrammar * pGrammar_in));
extern PATREdgeList *		setPATRResultIndexes P((
							 PATREdgeList * patr_resp,
							 PATRData *     pPATR_in));
extern PATRFeature *		createPATRAtomFeature P((char * pszAtom_in,
							 PATRData * pPATR_in));
extern PATRFeature *		createPATRNullFeature P((PATRData * pPATR_in));
extern PATRComplexFeature *	createPATRComplexFeature P((char * pszLabel_in,
							 PATRFeature * pFeature_in,
							 PATRData * pPATR_in));
extern PATRDefinition *		findPATRDefinition P((char * pszName_in,
						   PATRGrammar * pGrammar_in));
extern void			addPATRFeatureToComplex P((
						PATRFeature * pFeature_in,
						PATRComplexFeature * pComplex_in));
extern void			visitPATREdges P((PATREdgeList * edge_listp,
						  int depth,
						  int preorder,
						  void (* routp)(PATREdge *,
								int,
								PATRData *),
						  PATRData * pPATR_in));
extern PATRWordCategory *	addPATRWordCategory P((char * pszCategory_in,
							   PATRWord * pSent_io,
							   PATRData * pPATR_in));
extern PATRFeature *		applyPATRLexicalRule P((
					PATRLexicalRule * pLexicalRule_in,
					PATRFeature *     pNewFeat_io,
					PATRFeature *     pOldFeat_in,
					PATRData *        pPATR_in));
extern PATRFeatureDisjunction *	buildPATRFeatureDisjunction P((
						char *     fdst,
						PATRFeatureDisjunction * featd,
						int        warn,
						FILE *     errfp,
						PATRData * pPATR_in));
extern void			addPATRFeatureToWord P((
					PATRFeatureDisjunction * featd,
					PATRWordCategory *       word,
					PATRData *               pPATR_in));
extern void			showPATRStrings P((PATRData * pPATR_in));
extern void		checkPATRFeatureCoreferences P((PATRFeature * x,
							PATRData * pPATR_in));
extern int		getPATRFeatureCoreference P((PATRFeature * x,
							 PATRData * pThis));
extern int		repeatedPATRFeatureCoreference P((PATRFeature * x,
							  PATRData * pThis));
extern void		resetPATRFeatureCoreferenceCheck P((PATRData * pThis));
extern void		sortPATRComplexFeature P((
						  PATRComplexFeature * pComplex_in,
						  PATRGrammar * pGrammar_in,
						  PATRData * pPATR_in));
extern void		markPATRParseUnprinted P((PATREdge * pEdge_in));
extern int		failedPATRParse P((PATREdge * pEdge_in));
extern void		markPATRParseCoref P((PATREdge * pEdge_in,
						  PATRData * pPATR_in));

extern const NumberedMessage sPATRIncompatibleFeaturesMsg_g;
/*
 *  patrlexi.c
 */
extern PATRWord * convertSentenceToPATRWords P((
			char * pszSentence_in,
			FILE * pOutputFP_in,
			PATRLexItem * (* pfMorphParser_in)(char * pszWord_in),
			int bWarnUnusedFd_in,
			PATRData * pPATR_in,
			int * piErrors));
/*
 *  copyfeat.c
 */
extern void		resetPATRFeatureCopyCheck P((PATRData * pPATR_in));
extern PATRFeature *	checkPATRFeatureCopy P((PATRFeature *,
						PATRData * pPATR_in));
extern void		recordPATRFeatureCopy P((PATRFeature *x,
						 PATRFeature *xcopy,
						 PATRData * pPATR_in));
/*
 *  subsume.c
 */
#ifndef hab130v
extern int	subsumesPATRFeature P((PATRFeature * pFirst_in,
					   PATRFeature * pSecond_in,
					   char ** apszIndexedVariableValues));
#else  /* hab130v */
extern int	subsumesPATRFeature P((PATRFeature * pFirst_in,
					   PATRFeature * pSecond_in));
#endif /* hab130v */
/*
 *  unify.c
 */
extern PATRFeature *		unifyPATRFeatures P((PATRFeature * pFirst_in,
							 PATRFeature * pSecond_in,
							 int          bPreserve_in,
							 PATRData *    pPATR_in));
extern PATRFeatureDisjunction *	unifyPATRDisjuncts P((
					 PATRFeatureDisjunction * pFirst_in,
					 PATRFeatureDisjunction * pSecond_in,
					 PATRData *               pPATR_in));
extern int			findPATRUnifyFailure P((
						PATRFeature * pDag1_in,
						PATRFeature * pDag2_in,
						StringList ** ppPath1_io,
						PATRFeature ** ppFeat1_out,
						StringList ** ppPath2_io,
						PATRFeature ** ppFeat2_out,
						PATRData * pPATR_in));
extern void			cleanupPATRUnifyDebris P((
							 PATRData * pPATR_in));
extern int			verifyAcyclicPATRFeature P((
						   PATRFeature * pFeature_in));
/*
 *  userpatr.h
 */
extern void	showPATRFeature		P((PATRFeature * x,
					   int           indent,
					   PATRData *    pPATR_in));
extern void	writePATRFeature	P((PATRFeature * pFeature_in,
					   FILE *        outfp,
					   int           indent,
					   PATRData *    pPATR_in));
extern void	writePATRFeatureToLog	P((PATRFeature * x,
					   int           indent,
					   int		 bSilent_in,
					   PATRData *    pPATR_in));
extern void	writePATRFlatParseTree	P((PATREdgeList * pParse_in,
					   FILE *         outfp,
					   PATRData *     pPATR_in));
extern void	writePATRParseFeatures	P((PATREdgeList * pParses_in,
					   FILE *         outfp,
					   PATRData *     pPATR_in));
extern PATRFeature * unifyPATRParseTreeFeatures P((PATREdge * pParse_in,
						   PATRFeature * pTreeFeats_in,
						   PATRData * pPATR_in));
extern void calcPATRFullTreePos P((PATREdge * edgep,
				   int depth,
				   PATRData * pPATR_in));
extern char * getPATRNodeGloss P((PATREdge * edgep, PATRData * pPATR_in));
/*
 *  priunion.c
 */
extern void	applyPATRPriorityUnion	P((PATRFeature *       pFeature_io,
					   PATRPriorityUnion * pUnion_in,
					   PATRData *	       pPATR_in));
extern void	writePATRPriorityUnion	P((PATRPriorityUnion * pUnion_in,
					   FILE *              pOutputFP_in));
/*
 *  constrai.c
 */
extern int	applyPATRConstraint	P((PATRFeature *    pFeature_in,
					   PATRConstraint * pConstraint_in,
					   PATRData *	    pPATR_in));
extern void	writePATRConstraint	P((PATRConstraint * pConstraint_in,
					   PATRData *       pPATR_in,
					   FILE *           pOutputFP_in));
extern void	writePATRLogicalExpression P((
					PATRLogicalExpression * pExpression_in,
					PATRData *              pPATR_in,
					FILE *                  pOutputFP_in));

#ifdef __cplusplus
}
#endif
#endif /*_PATRDEF_H_INCLUDED_*/
