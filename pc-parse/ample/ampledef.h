/* AMPLEDEF.H -  definitions/declarations for AMPLE program
 ***************************************************************************
 * Copyright 1988, 2000 by SIL International.  All rights reserved.
 */
#ifndef _AMPLEDEF_H_INCLUDED_
#define _AMPLEDEF_H_INCLUDED_
#ifdef HAVE_ALLOCA
#ifdef HAVE_ALLOCA_H
#include <alloca.h>
#else
void * alloca(size_t size);
#endif
#endif
#ifdef __cplusplus
extern "C" {
#endif

/*****************************************************************************
 * NAME
 *    AmpleAffixInfo
 * DESCRIPTION
 *    extra data for prefixes and suffixes
 */
typedef struct {
	unsigned char *	pFromCategories;
	unsigned char *	pToCategories;
	short		iOrderClass;
	} AmpleAffixInfo;

/*****************************************************************************
 * NAME
 *    AmpleInfixInfo
 * DESCRIPTION
 *    extra data for infixes
 */
typedef struct {
	unsigned char *		pFromCategories;
	unsigned char *		pToCategories;
	short			iOrderClass;
	unsigned char		iInfixLoc;	/* AMPLE_PFX | AMPLE_ROOT |
						   AMPLE_SFX */
	AmpleEnvConstraint *	pInfixEnv;
	} AmpleInfixInfo;

/*****************************************************************************
 * NAME
 *    AmpleRootInfo
 * DESCRIPTION
 *    extra data for root when AmpleData's bRootGlosses flag is TRUE
 *    This saves storage when it is FALSE.
 */
typedef struct {
	unsigned char *	pRootCategories;	/* root category(s) */
	char *		pszRootGloss;	/* gloss for root */
	} AmpleRootInfo;

/*****************************************************************************
 * NAME
 *    AmpleMorpheme (struct ample_morpheme)
 * DESCRIPTION
 *
 */
struct ample_morpheme {
	char *		    pszMorphName;
	unsigned char	    iMorphType;
	char *		    pszMorphFd;		/* feature descriptors */
#ifdef EXPERIMENTAL
	char *		    pszPATRCat;		/* PATR grammar category */
	PATRFeature *	    pPATRFeature;	/* PATR feature structure */
#endif /* EXPERIMENTAL */
	char *		    pszUnderForm;	/* underlying form */
	AmpleMorphConstraint *  pMorphConstraints;	/* co-occurrence constraints */
	union {
	unsigned char *	 pRootCategories;   /* categories for roots */
	AmpleRootInfo *	 pRoot;		    /* stuff for roots (only used when
						   AmpleData's bRootGlosses flag
						   is TRUE) */
	AmpleAffixInfo * pAffix;	    /* stuff for prefixes, suffixes */
	AmpleInfixInfo * pInfix;	    /* stuff for infixes */
	}		    u;
	AmpleAllomorph *	    pAllomorphs;	/* pointer to the list of
						   allomorphs for this
						   morpheme */
	/*
	 *  we link all AmpleMorpheme structs together in one linked list so that
	 *  they can be freed without worrying about multiple pointers to them
	 *  from allomorphs
	 */
	struct ample_morpheme * pLink;
	};
/*
 * iMorphType =  (low 4 bits) = AMPLE_PFX   for prefix entries
 *                            = AMPLE_IFX   for infix  entries
 *                            = AMPLE_SFX   for suffix entries
 *                            = AMPLE_ROOT  for root   entries
 *              (high 4 bits) = RSC   for root   entries
 */
#define ATYPE		0x0F
#define RSC		0x10	/* regular sound change applies to this root */
#define ISCAPS		0x20	/* used for CAPS test */

/*****************************************************************************
 * NAME
 *    AmpleAllomorph (struct ample_allomorph)
 * DESCRIPTION
 *    data stored for each allomorph in the dictionary
 */
struct ample_allomorph {
	/* flag bits for this allomorph */
	char		iAllomorphFlags;
	/* pointer to the morpheme structure to which this allomorph belongs */
	AmpleMorpheme *	pMorpheme;
	/* the allomorph string */
	char *		pszAllomorph;
	/* the allomorph ID string */
	char *		pszAllomorphID;
	/* allomorph environment conditions */
	AmpleAlloEnv *	pEnvironment;
	/* allomorph (and inherited morpheme) properties */
	PropertySet_t	sPropertySet;
	/* pointer to the next allomorph of this morpheme */
	struct ample_allomorph *	pNextAllomorph;

	/* pointer to the next allomorph at this node of the trie */
	struct ample_allomorph *	pNext;
	};
/*
 *  values for iAllomorphFlags
 */
#define ELSEWHERE	0x01	/* flag that this is the "elsewhere" (default)
				   allomorph for output */
#define ACTIVE		0x02	/* used for selective analysis */

#define pMORPHNAME	pMorpheme->pszMorphName
#define iMORPHTYPE	pMorpheme->iMorphType
#define pMORPHFD	pMorpheme->pszMorphFd
#define pUNDERFORM	pMorpheme->pszUnderForm
#define pAFFIX		pMorpheme->u.pAffix
#define pINFIX		pMorpheme->u.pInfix
#define pROOTCATS	pMorpheme->u.pRootCategories
#define pROOT		pMorpheme->u.pRoot
#define pROOT_CATS	pMorpheme->u.pRoot->pRootCategories
#define pROOT_GLOSS	pMorpheme->u.pRoot->pszRootGloss

/*****************************************************************************
 * NAME
 *    AmpleTestList (struct ample_fnlist)
 * DESCRIPTION
 *    ordered list of 'active' predicates
 */
struct ample_fnlist {
	char *		pszName;	/* the external name used to identify
					 * the predicate */
	int			eFunction;	/* type index of the predicate */
	AmpleTestNode *	pTestTree;	/* pointer to test tree structure if a
					 *    user defined predicate */
	unsigned long	uiTestCallCount;	/* number of times called */
	unsigned long	uiTestFailCount;	/* number of times failed */
	char		bUsesPrevWord;
	char		bUsesNextWord;
	struct ample_fnlist * pNext;	/* link to next list item */
	};
/*
 *  possible values for eFunction
 */
#define AMPLE_SEC_ST	1
#define AMPLE_ADHOC_ST	2
#define AMPLE_ROOTS_ST	3
#define AMPLE_MEC_FT	4
#define AMPLE_MCC_FT	5
#define AMPLE_SP_TEST	6
#define AMPLE_PEC_ST    7	/* 3.3.0 hab */
#ifdef EXPERIMENTAL
#ifndef hab350
#define AMPLE_ANCC_FT	8
#endif /* hab350 */
#endif /* EXPERIMENTAL */

/*****************************************************************************
 * NAME
 *    AmpleHeadList (struct ample_headlist)
 * DESCRIPTION
 *    morphemes are added to the head as an analysis is made.
 *    the head is a doubly linked list with links right <=> left.
 */
typedef struct ample_headlist {
	AmpleAllomorph *	pAllomorph;
	unsigned char	iFromCategory;
	unsigned char	iToCategory;
	PropertySet_t	sPropertySet;	/* properties of the morpheme */
	short		iOrderClass;	/* orderclass (negative for prefixes)*/
	unsigned char	eType;		/* type: AMPLE_PFX, AMPLE_IFX,
					   AMPLE_SFX, or AMPLE_ROOT */
	unsigned		uiAllomorphLength;	/* length of allomorph */
	unsigned		uiMorphnamesLength;	/* accumulated length of
						   morphnames in head */
	struct ample_headlist *	pLeft;	/* points to morpheme to the left */
	struct ample_headlist *	pRight;	/* points to morpheme to the right */
	} AmpleHeadList;
#define iROOTCATEG iFromCategory

/*****************************************************************************
 * NAME
 *    AmpleHeadlistList (struct ample_hlalist)
 * DESCRIPTION
 *    headlist ambiguity list -- list of all headlists representing
 *    valid parses of the given word
 */
struct ample_hlalist {
	AmpleHeadList *	   pHeadList;
	char		   bUsesPrevWord;
	char		   bUsesNextWord;
	char *		   pszSurface;
	struct ample_hlalist * pNext;
	};

#ifdef EXPERIMENTAL
/*****************************************************************************
 * NAME
 *    AmpleParseList
 * DESCRIPTION
 *    data structure for list of pointers to parse chart edges
 */
struct ample_parse_list {
	PATREdgeList *		pParse;
	struct ample_parse_list *	pNext;
	};
#endif /* EXPERIMENTAL */

/*****************************************************************************
 * NAME
 *    AmplePairList (struct ample_pairlist)
 * DESCRIPTION
 *    list of paired strings for adhoc pairs
 */
struct ample_pairlist {
	char *			pszLeft;
	char *			pszRight;
	struct ample_pairlist *	pNext;
	};

/*****************************************************************************
 * NAME
 *    AmpleMorphConstraint (struct ample_morph_constraint)
 * DESCRIPTION
 *    structure for morpheme co-occurrence constraints
 *
 *    All of the constraints are stored in a single linked list.
 *    Each node of this list has a pointer to a linked list of morphnames (or
 *    morpheme classes), a pointer to an environment list, and a pointer to
 *    the next node in the list.
 */
struct ample_morph_constraint {
	char *			pszLabel;	/* optional identifier label */
	AmpleMorphlist *		pMorphs;	/* morph names/classes */
	AmpleEnvConstraint *	pEnvironment;	/* environment constraints */
	struct ample_morph_constraint * pNext;	/* link to next node */
	};

#ifdef EXPERIMENTAL
#ifndef hab350
/*****************************************************************************
 * NAME
 *    AmpleNeverConstraint (struct ample_never_constraint)
 * DESCRIPTION
 *    structure for allomorphs never co-occur constraints
 *
 *    All of the constraints are stored in a single linked list.
 *    Each node of this list has a pointer to a linked list of allomoprh IDs,
 *    a pointer to an environment list, and a pointer to
 *    the next node in the list.
 */
struct ample_never_constraint {
	char *			pszLabel;	/* optional identifier label */
	StringList *		pAlloIDs;	/* allomorph IDs */
	AmpleEnvConstraint *	pEnvironment;	/* environment constraints */
	struct ample_never_constraint * pNext;	/* link to next node */
	};
#endif /* hab350 */
#endif /* EXPERIMENTAL */

/*****************************************************************************
 *
 *  miscellaneous constant definitions
 */
/*
 *  maximum length of morpheme
 */
#define MAXMORPH	64
/*
 *  maximum number of morphemes to check
 */
#ifdef _MSC_VER
#ifdef CODEVIEW
#define MAX_NUM_MORPHS 1
#define MAX_NUM_ALLOS 1
#else
#define MAX_NUM_MORPHS 16000	/* for morph check 3.3.2 hab upped from 7500 */
#define MAX_NUM_ALLOS 16000	/* for morph check 3.3.2 hab upped from 4000 */
#endif /*CODEVIEW*/
#else  /*_MSC_VER*/
#define MAX_NUM_MORPHS 16000	/* for morph check with 386 .exe (2.0c KB) */
#define MAX_NUM_ALLOS 16000	/* for morph check with 386 .exe (2.0c KB) */
#endif /*_MSC_VER*/
/*
 *  general size for internal buffers
 */
#define BUFSIZE 300
/*
 *  this should be defined appropriately in config.h
 */
#ifndef P
#define P(s) ()
#endif

/*****************************************************************************
 *
 *  function prototypes of internal AMPLE functions
 */
/* atest.y */
extern AmpleTestNode *	parseAmpleTest P((char *            pszTest_in,
					  char *            pszErrorHeader_in,
					  int *             pbUsesPrev_out,
					  int *             pbUsesNext_out,
					  const AmpleData * pAmple_in));

/* spreds.l */
extern int	ampyylex	     P((FILE * pLogFP_in));
extern void	setAmpleLexInput     P((char * pszText_in));
extern char *	getAmpleLexLocation  P((void));
#ifndef THINK_C
extern void	freeAmpleYYLexBuffer P(( void ));
#endif

/* setsd.c */
extern void 		freeAmpleMorpheme P((AmpleMorpheme * pMorph_in,
						 AmpleData * pAmple_in));

/* envpar.c */
extern AmpleMorphConstraint *		parseAmpleMorphConstraint P((
						   char *      line,
						   AmpleData * pAmple_in));
extern void		writeAmpleMorphConstraint P((
					AmpleMorphConstraint * pMorphConstraint_in,
					FILE *                 pOutputFP_in,
					int                    bSGML_in));
extern void		writeAmpleMorphConstraints P((
						   FILE *      pOutputFP_in,
						   AmpleData * pAmple_in));
extern char *		stringifyAmpleMorphConstraint P((
					char *                 pszString_io,
					size_t *               puiStringSize_io,
					AmpleMorphConstraint * pMorphConstraint_in,
					int                    bSGML_in));
#ifdef EXPERIMENTAL
#ifndef hab350
extern AmpleNeverConstraint *		parseAmpleNeverConstraint P((
						   char *      line,
						   AmpleData * pAmple_in));
extern void		writeAmpleNeverConstraint P((
					AmpleNeverConstraint * pNeverConstraint_in,
					FILE *                 pOutputFP_in,
					int                    bSGML_in));
extern void		writeAmpleNeverConstraints P((
						   FILE *      pOutputFP_in,
						   AmpleData * pAmple_in));
extern char *		stringifyAmpleNeverConstraint P((
					char *                 pszString_io,
					size_t *               puiStringSize_io,
					AmpleNeverConstraint * pNeverConstraint_in,
					int                    bSGML_in));
#endif /* hab350 */
#endif /* EXPERIMENTAL */

/* envchk.c */
extern int	checkAmpleStringEnviron P((char *leftstring, int leftsize,
					   char *rightstring,
					   AmpleEnvConstraint *ec,
					   AmpleWord * pPreviousWord_in,
					   AmpleWord * pNextWord_in,
					   AmpleData * pAmple_in));
extern int	checkAmpleMorphEnviron P((AmpleHeadList *left,
					  AmpleHeadList *right,
					  AmpleEnvConstraint *menv,
					  AmpleWord * pPreviousWord_in,
					  AmpleWord * pNextWord_in,
					  AmpleData * pAmple_in));
#ifdef EXPERIMENTAL
#ifndef hab350
extern int	checkAmpleNeverEnviron P((AmpleHeadList *left,
					  AmpleHeadList *right,
					  AmpleEnvConstraint *menv,
					  AmpleWord * pPreviousWord_in,
					  AmpleWord * pNextWord_in,
					  AmpleData * pAmple_in));
#endif /* hab350 */
#endif /* EXPERIMENTAL */
				/* 3.3.0 hab */
extern int	checkAmplePunctEnviron P((char *leftstring, int leftsize,
					  char *rightstring,
					  AmpleEnvConstraint *ec,
					  AmpleData * pAmple_in));

/* analda.c */
extern void	freeAmpleMorphConstraints P((
				AmpleMorphConstraint * pMorphConstraints_io));

/* anal.c */

/* select.c */
extern int	isAmpleAllomorphSelected P((const char * pszMorphName_in,
						const char * pszAllomorph_in,
						AmpleData *  pAmple_in));
extern void	writeAmpleSelectedMorphs P((const AmpleData * pAmple_in));
extern char *	stringifyAmpleSelectedMorphs P((char *      pszString_io,
						size_t *    puiStringSize,
						AmpleData * pAmple_in));

/* dynstr.c */
extern char * appendDynamicString P((char *       pszString_io,
					 size_t *     puiStringSize_io,
					 const char * pszAdded_in));

#ifdef __cplusplus
}
#endif
#endif /*_AMPLEDEF_H_INCLUDED_*/
