/* STAMPLE.H - definitions and prototypes shared by AMPLE and STAMP
 ***************************************************************************
 * Copyright 1989, 2000 by SIL International.  All rights reserved.
 */
#ifndef _STAMPLE_H_INCLUDED_
#define _STAMPLE_H_INCLUDED_
#ifdef __cplusplus
extern "C" {
#endif
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#ifdef STDC_HEADERS
#include <stdlib.h>
#endif
#ifdef HAVE_ALLOCA
#ifdef HAVE_ALLOCA_H
#include <alloca.h>
#else
void * alloca(size_t size);
#endif
#endif
#ifdef _MSC_VER
#include <io.h>		/* for _isatty(fd) */
#endif
#include "strlist.h"
#include "strclass.h"
#include "punclass.h"
#include "change.h"

/*****************************************************************************
 * NAME
 *    AmpleCategoryClass (struct ample_cat_class)
 * DESCRIPTION
 *    structure for category classes
 *
 *    All of the category classes are stored in a single linked list.
 *    Each node of this list has a pointer to the class name, and a pointer
 *    to a NUL-terminated array of bytes which comprise the members of the
 *    class.
 */
typedef struct ample_cat_class {
	char *			pszName;	/* name of the class */
	unsigned char *		pMembers;	/* NUL-terminated array */
	struct ample_cat_class *	pNext;		/* pointer to next class */
	} AmpleCategoryClass;
#define MAX_AMPLE_CATS 255		/* cannot use zero */

/*****************************************************************************
 * NAME
 *    AmpleMorphClass (struct ample_morph_class)
 * DESCRIPTION
 *    structure for morpheme classes
 *
 *    All of the morpheme classes are stored in a single linked list.
 *    (Morpheme classes are currently stored the same as string classes.)
 */
typedef struct ample_morph_class {
	char *		pszName;	/* name of the morpheme class */
	StringList *	pMembers;	/* members of the morpheme class */
	struct ample_morph_class *	pNext;	/* pointer to next class */
	} AmpleMorphClass;

/*****************************************************************************
 * NAME
 *    AmpleMorphlist (struct ample_morphlist)
 * DESCRIPTION
 *    structure for morpheme co-occurrence constraints
 *    Each node of this list points to either a morphname or a morph_class.
 */
typedef struct ample_morphlist {
	unsigned char		bClass;
	union {
	char *			pszMorphName;
	AmpleMorphClass *	pMorphClass;
	} u;
	struct ample_morphlist *	pNext;
	} AmpleMorphlist;

/*****************************************************************************
 * NAME
 *    AmpleProperty
 * DESCRIPTION
 *    allomorph and morpheme properties defined by the user.
 */
typedef struct {
	char *	pszName;	/* name of property  */
	char	ePropertyType;	/* 0 allomorph, 1 morpheme property */
	} AmpleProperty;

/*****************************************************************************
 * NAME
 *    AmpleProperties
 * DESCRIPTION
 *    allomorph and morpheme properties defined by the user.
 *    Property definitions are stored internally as a linked list of property
 *    names.  Each property has a unique number associated with it.
 */
typedef struct {
	AmpleProperty *	paProperties;
	unsigned short	uiPropertyCount;
	unsigned short	uiAllocProperties;
	unsigned short	uiMaxProperty;
} AmpleProperties;
/*
 *  distinguish between allomorph and morpheme properties
 */
#define AMPLE_ALLO_PROP  0
#define AMPLE_MORPH_PROP 1

typedef union {
	unsigned char *  pProperties;
	unsigned short * pBigProperties;
} PropertySet_t;

/*************************************************************************
 * NAME
 *    AmpleTestNode (struct ample_test_node)
 * DESCRIPTION
 *    user defined test node structure
 *    A binary tree is built by yyparse().
 */
typedef union {
	short	iPosition;	/* position code for morpheme on left leaf */
	struct ample_test_node * pChild;	/* pointer to left subtree */
	} AmpleLeftSide;
typedef union {
	int			iValue;		/* integer for right leaf */
	char *		pszString;	/* string for right leaf */
	StringClass *	pStringClass;	/* string class for right leaf */
								/* 3.3.0 hab */
	PunctClass *	pPunctClass;	/* punctuation class for right leaf */
	AmpleMorphClass *	pMorphClass;	/* morpheme class for right leaf */
	AmpleCategoryClass *pCategClass;	/* category class for right leaf */
	unsigned short	uiProperty;	/* property for right leaf */
	struct ample_test_node * pChild;	/* pointer to right subtree */
	} AmpleRightSide;
typedef struct ample_test_node {
	char		iOpCode;	/* bit 7 is NOT, 0-6 are the code */
	AmpleLeftSide	uLeft;		/* the left branch */
	AmpleRightSide	uRight;		/* the right branch */
	} AmpleTestNode;

/*****************************************************************************
 *  definitions for user defined tests
 */
#define OP_MASK 0177        /* only the bottom seven bits */
#define OP_NOT  0200        /* complement the results */

#define TOP_NODE     0
#define LOGAND       1  /* 'AND' (A && B) */
#define LOGOR        2  /* 'OR'  (A || B) */
#define LOGXOR       3  /* 'XOR' ((!A && B) || (A && !B)) */
#define LOGIFF       4  /* 'IFF' ((A && B) || (!A && !B)) */
#define LOGIF        5  /* 'IF' ... 'THEN' (!A || (A & B)) */
#define ALL_LEFT     6  /* 'FOR_ALL_LEFT' */
#define SOME_LEFT    7  /* 'FOR_SOME_LEFT' */
#define ALL_RIGHT    8  /* 'FOR_ALL_RIGHT' */
#define SOME_RIGHT   9  /* 'FOR_SOME_RIGHT' */

#define PROP_IS     10  /* 'property' 'is' IDENTIFIER */

#define MORPH_IS    11  /* 'morphname' 'is' STRING */
#define MOR_IS_MORPH    12  /* 'morphname' 'is' ... 'morphname' */
#define MORPH_MEMBER    13  /* 'morphname' 'is' 'member' IDENTIFIER */

#define ALLO_IS     14  /* 'allomorph' 'is'  STRING */
#define ALLO_IS_AL  15  /* 'allomorph' 'is' ... 'allomorph' */
#define ALLO_MEMBER 16  /* 'allomorph' 'is' 'member' IDENTIFIER */
#define ALLO_MATCH  17  /* 'allomorph' 'matches'  STRING */
#define AL_MAT_AL   18  /* 'allomorph' 'matches' ... 'allomorph' */
#define AL_MAT_MEM  19  /* 'allomorph' 'matches' 'member' IDENTIFIER*/

#define STRING_IS   20  /* 'string' 'is'  STRING */
#define ST_IS_AL    21  /* 'string' 'is' ... 'allomorph' */
#define STRING_MEMBER   22  /* 'string' 'is' 'member' IDENTIFIER */
#define ST_MATCH    23  /* 'string' 'matches'  STRING */
#define ST_MAT_AL   24  /* 'string' 'matches' ... 'allomorph' */
#define ST_MAT_MEM  25  /* 'string' 'matches' 'member' IDENTIFIER */

#define WORD_IS     26  /* neighbor 'word' 'is' STRING */
#define WORD_MEMBER 27  /* neighbor 'word' 'is' 'member' IDENTIFIER */
#define WORD_MATCH  28  /* neighbor 'word' 'matches' STRING */
#define WD_MAT_MEM  29  /* neighbor 'word' 'matches' 'member' IDENT */

#define TYPE_IS     34  /* 'type' 'is' <TYPE> */
/*
 *  <TYPE> := AMPLE_PFX | AMPLE_IFX | AMPLE_SFX | AMPLE_ROOT |
 *		WINITIAL | WFINAL
 */
#define WINITIAL 0x10
#define WFINAL   0x20

#define FROM_IS_FROM    35  /* 'fromcategory' 'is' ... 'fromcategory' */
#define FR_IS_TO    36  /* 'fromcategory' 'is' ... 'tocategory' */
#define TO_IS_FROM  37  /* 'tocategory' 'is' ... 'fromcategory' */
#define TO_IS_TO    38  /* 'tocategory' 'is' ... 'tocategory' */
#define FROM_MEMBER 39  /* 'fromcategory 'is' 'member' IDENTIFIER */
#define TO_MEMBER   40  /* 'tocategory 'is' 'member' IDENTIFIER */
#define FROM_IS     41  /* 'fromcategory 'is' IDENTIFIER */
#define TO_IS       42  /* 'tocategory 'is' IDENTIFIER */
/*
 *  the next twelve must be consecutively numbered and in this order
 */
#define ORDR_EQ     43  /* 'orderclass' '=' ... 'orderclass' */
#define ORDR_GT     44  /* 'orderclass' '>' ... 'orderclass' */
#define ORDR_GE     45  /* 'orderclass' '>=' ... 'orderclass' */
#define ORDR_LE     46  /* 'orderclass' '<=' ... 'orderclass' */
#define ORDR_LT     47  /* 'orderclass' '<' ... 'orderclass' */
#define ORDR_NE     48  /* 'orderclass' '~=' ... 'orderclass' */
#define ORDR_EQ_CON 49  /* 'orderclass' '=' CONSTANT */
#define ORDR_GT_CON 50  /* 'orderclass' '>' CONSTANT */
#define ORDR_GE_CON 51  /* 'orderclass' '>=' CONSTANT */
#define ORDR_LE_CON 52  /* 'orderclass' '<=' CONSTANT */
#define ORDR_LT_CON 53  /* 'orderclass' '<' CONSTANT */
#define ORDR_NE_CON 54  /* 'orderclass' '~=' CONSTANT */
/*
 *  CAPS tests  1.9zb BJY
 */
#define AL_IS_CAP   60  /* 'allomorph' 'is' 'capitalized' */
#define WD_IS_CAP   61  /* 'word' 'is' 'capitalized' */
/*
 *  Punctuation tests  3.3.0 hab
 */
#define PUNCT_IS     62  /* neighbor 'punctuation' 'is' STRING */
#define PUNCT_MEMBER 63  /* neighbor 'punctuation' 'is' 'member' IDENTIFIER */

/*
 *   morpheme position constants
 */
#define ARGCURRENT  0   /* 'current' */
#define ARGLEFT     1   /* 'left' */
#define ARGRIGHT    2   /* 'right */
#define FORLEFT     3   /* 'LEFT' */
#define FORRIGHT    4   /* 'RIGHT' */
#define INITIALM    5   /* 'INITIAL' */
#define FINALM      6   /* 'FINAL' */
/*
 *  neighboring word selection
 */
#define LAST        0   /* 'last' */
#define NEXT        1   /* 'next' */

/*****************************************************************************
 * NAME
 *    AmpleEnvItem (struct ample_env_item)
 * DESCRIPTION
 *    structure and definitions for a single item of an environment constraint
 *
 *    This is used for different types of environment constraints, and for
 *    constraints to either the right or the left.   Each side of a constraint
 *    consists of a linked list of these items.
 */
typedef struct ample_env_item {
	char			iFlags;
	union { char *	pszString;	/* pointer to literal string */
		void *	pClass;		/* pointer to class structure */
		int		iPlain;		/* integer value */
	  }			u;
	struct ample_env_item *	pNext;	/* pointer to next item */
	} AmpleEnvItem;
/*
 *  Below are constants for use in iFlags
 */
#define E_NOT             01    /* do NOT want to match this item */
#define E_CLASS           02    /* member of class, not literal string */
#define E_ELLIPSIS        04    /* does not have to be contiguous */
#define E_OPTIONAL       010    /* optional item */
#define E_GROUP		 020	/* member of open-ended group, not string */
#define E_MORPHEME	0200	/* morpheme environment, not string envir. */
#define E_PUNCT		0100	/* punctuation environment 3.3.0 hab */
#ifdef EXPERIMENTAL
#ifndef hab350
#define E_ALLOID	0040	/* allomorphs never co-occur constraint */
#endif /* hab350 */
#endif /* EXPERIMENTAL */

/*****************************************************************************
 * NAME
 *    AmpleEnvConstraint (struct ample_env_cond)
 * DESCRIPTION
 *    structure for environment constraint conditions
 *
 *    This is used for either string (allomorph surface) environment
 *    constraints or morpheme environment constraints or punctuation
 *    environment constraints.   All such constraint
 *    conditions of a given type are stored in a single linked list.
 *    Each node of this list has a pointer to the left hand environment and
 *    a pointer to the right hand environment, both working outward.  Either
 *    environment may be NULL.  Each node also has a pointer to the next node
 *    in the list.
 */
typedef struct ample_env_cond {
	char		bNot;		/* NOT this environment */
	char		eType;		/* type of environment */
	char		bUsesPrevWord;	/* previous word in environment */
	char		bUsesNextWord;	/* next word in environment */
	AmpleEnvItem *	pLeftEnv;	/* environment to the left */
	AmpleEnvItem *	pRightEnv;	/* environment to the right */

	struct ample_env_cond *	pNext;	/* link to alternative constraint */
	} AmpleEnvConstraint;
/*
 *  values for eType (also used for function parameter passing)
 */
#define AMPLE_STRING_ENVIR 0
#define AMPLE_MORPH_ENVIR  1
#define AMPLE_PUNCT_ENVIR  2	/* 3.3.0 hab */
#ifdef EXPERIMENTAL
#ifndef hab350
#define AMPLE_ALLOID_ENVIR 3
#endif /* hab350 */
#endif /* EXPERIMENTAL */

/*****************************************************************************
 * NAME
 *    AmpleAlloEnv (struct ample_allo_env)
 * DESCRIPTION
 *    structure for allomorph environment constraints
 *    This structure contains a pointer to the allomorph surface string
 *    environment constraints, a pointer to the morpheme environment
 *    constraints, and a pointer to the punctuation environment
 *    constraints.  Any may be NULL.
 */
typedef struct ample_allo_env {
	AmpleEnvConstraint *	pStringCond;	/* environment constraints */
	AmpleEnvConstraint *	pMorphCond;	/* environment constraints */
	AmpleEnvConstraint *	pPunctCond;	/* 3.3.0 hab */
	/*
	 *  we link all AmpleAlloEnv structs together in one linked list so that
	 *  they can be freed without worrying about multiple pointers to them
	 *  from allomorphs
	 */
	struct ample_allo_env *	pLink;
	} AmpleAlloEnv;

/*****************************************************************************
 *
 *  function prototypes of internal functions shared by AMPLE and STAMP
 */
/* categ.c */
extern void			freeAmpleCategories P((
						 StringList * pCategories_io));
extern StringList *		addAmpleCategory P((char *      pszLine_in,
						   StringList * pCategories_io,
							FILE *      pLogFP_in));
extern unsigned char		findAmpleCategoryNumber P((
					   const char *       pszName_in,
					   const StringList * pCategories_in));
extern char *			findAmpleCategoryName P((
					   int                iCatNum_in,
					   const StringList * pCategories_in));
extern void			writeAmpleCategories P((
					   FILE *             pOutputFP_in,
					   const StringList * pCategories_in));
extern void			freeAmpleCategClasses P((
					   AmpleCategoryClass * pCategClasses_io));
extern AmpleCategoryClass *	addAmpleCategClass P((
					 char *               pszLine_in,
					 const StringList *   pCategories_in,
					 AmpleCategoryClass * pCategClasses_io,
					 FILE *               pLogFP_in));
extern AmpleCategoryClass *	findAmpleCategClass P((
				 const char *               pszName_in,
				 const AmpleCategoryClass * pCategClasses_in));
extern int			isAmpleCategClassMember P((int cat,
					const AmpleCategoryClass * pClass_in));
extern void			writeAmpleCategClasses P((
				 FILE *                     pOutputFP_in,
				 const StringList *         pCategories_in,
				 const AmpleCategoryClass * pCategClasses_in));

/* morcla.c */
extern void			freeAmpleMorphClasses P((
					  AmpleMorphClass * pMorphClasses_io));
extern AmpleMorphClass *	addAmpleMorphClass P((
						char *            pszLine_in,
						AmpleMorphClass * pMorphClasses_io,
						FILE *            pLogFP_in));
extern AmpleMorphClass *	findAmpleMorphClass P((
					const char *            pszName_in,
					const AmpleMorphClass * pMorphClasses_in));
extern int			isAmpleMorphClassMember	P((
					   const char * pszMorpheme_in,
					   const AmpleMorphClass * pClass_in));
extern void			writeAmpleMorphClasses	P((
					FILE *                  pOutputFP_in,
					const AmpleMorphClass * pMorphClasses_in));

/* proper.c */
extern void		freeAmpleProperties P((
						AmpleProperties * pProperties_io,
						StringList *    pPropertySets_io));
extern unsigned short	findAmplePropertyNumber P((
					  const char *            pszName_in,
					  const AmpleProperties * pProperties_in));
extern char *		findAmplePropertyName P((
					  unsigned                uiPropNumber_in,
					  const AmpleProperties * pProperties_in));
extern unsigned short	addAmpleProperty P((char *	      pszLine_in,
						int               eType_in,
						AmpleProperties * pProperties_io,
						FILE *            pLogFP_in));
extern int		isAmpleAllomorphProperty P((
					  unsigned                uiPropNumber_in,
					  const AmpleProperties * pProperties_in));
extern int		isAmpleMorphemeProperty P((
					  unsigned                uiPropNumber_in,
					  const AmpleProperties * pProperties_in));
extern void		writeAmplePropertySet P((
					   const PropertySet_t     pPropertySet_in,
					   const AmpleProperties * pProperties_in,
					   FILE *                  pOutputFP_in));
extern char *		stringifyAmplePropertySet P((
					  char *                  pszString_io,
					  size_t *                puiStringSize_io,
					  const PropertySet_t     pPropertySet_in,
					  const AmpleProperties * pProperties_in));
extern int		hasAmpleProperty P((
					  const PropertySet_t     pPropertySet_in,
					  unsigned                uiProp_in,
					  const AmpleProperties * pProperties_in));
extern char *		parseAmplePropertySet P((
				  char *                  pszLine_in,
				  PropertySet_t *         ppPropertySet_io,
				  int                     eType_in,
				  unsigned                uiDictEntry_in,
				  const char *            pszRecordKey_in,
				  const char *            pszErrorHeader_in,
				  const AmpleProperties * pProperties_in,
				  StringList **           ppPropertySetList_io,
				  FILE *                  pLogFP_in));
extern void		mergeAmplePropertySets P((
				PropertySet_t *         ppPropertySet_io,
				const PropertySet_t     p2ndPropertySet_in,
				int                     uiDictEntry_in,
				const char *            pszRecordKey_in,
				const AmpleProperties * pProperties_in,
				StringList **           ppPropertySetList_io));

/* mktest.c */
extern AmpleTestNode *	makeAmpleTestCategClass P((
						  int                  iOpCode_in,
						  int                  iLeft_in,
						  AmpleCategoryClass * pRight_in));
extern AmpleTestNode *	makeAmpleTestInt P((int iOpCode_in,
						int iLeft_in,
						int iRight_in));
extern AmpleTestNode *	makeAmpleTestProperty P((int      iOpCode_in,
						 int      iLeft_in,
						 unsigned uiRight_in));
extern AmpleTestNode *	makeAmpleTestMorphClass P((
						 int               iOpCode_in,
						 int               iLeft_in,
						 AmpleMorphClass * pRight_in));
extern AmpleTestNode *	makeAmpleTestString P((int iOpCode_in,
						   int iLeft_in,
						   char * right));
extern AmpleTestNode *	makeAmpleTestStringClass P((int           iOpCode_in,
							int           iLeft_in,
							StringClass * pRight_in));
				/* 3.3.0 hab */
extern AmpleTestNode *	makeAmpleTestPunct P((int iOpCode_in,
						  int iLeft_in,
						  char * right));
				/* 3.3.0 hab */
extern AmpleTestNode *	makeAmpleTestPunctClass P((int           iOpCode_in,
						   int           iLeft_in,
						   PunctClass * pRight_in));
extern AmpleTestNode *	makeAmpleTestNode P((int             iOpCode_in,
						 AmpleTestNode * pLeft_in,
						 AmpleTestNode * pRight_in));
extern AmpleTestNode *	makeAmpleTest P((AmpleTestNode * pTest_in,
					 char *          pszName_in));

/* cmdutil.c */
extern void	getAmpleCmd		P((const char * pszPrompt_in,
					   char *       pszBuffer_out,
					   unsigned     uiBufferSize_in));
extern void	closeAmpleCmdFile	P(( void ));
extern void	logAmpleCmds		P((FILE * pLogFP_in));
extern void	openAmpleCmdFile	P((char * pszFilename_in,
					   int    bQuiet_in));

/* validch.c */
extern char *	setAmpleValidCharacters P((char *  pszChars_in));
extern void	validateAmpleString P((const char * str,
					   const char * where,
					   const char * entry,
					   const char * item,
					   const char * pszValidChars_in,
					   FILE *       pLogFP_in));
extern const char *	getAmpleRecordIDTag P((const char * pszRecKey_in,
						   unsigned     uiRecNum_in));

/* envpar.c */
extern void	writeAmpleEnvConstraint P((FILE * outfp,
					   AmpleEnvConstraint * ec,
					   int    bSGML_in));
extern char *	stringifyAmpleEnvConstraint P((char *   pszString_io,
						   size_t * puiStringSize_io,
						   AmpleEnvConstraint * ec,
						   int      bSGML_in));
extern void	writeAmplePCDATA P((FILE *       pOutputFP_in,
					const char * pszPCDATA_in,
					int          b7Bit_in));
extern size_t	lengthAmplePCDATA P((const char * pszPCDATA_in,
					 int          b7Bit_in));
extern void	storeAmplePCDATA P((char *       pszOutput_in,
					const char * pszPCDATA_in,
					int          b7Bit_in));
extern void	writeAmpleCDATA	P((FILE *       pOutputFP_in,
				   const char * pszCDATA_in,
				   int          b7Bit_in));
extern size_t	lengthAmpleCDATA P((const char * pszCDATA_in,
				   int          b7Bit_in));
extern void	storeAmpleCDATA P((char *       pszOutput_in,
				   const char * pszCDATA_in,
				   int          b7Bit_in));
extern void	freeAmpleEnvConstraint P((AmpleEnvConstraint * pEnv_io));
extern void	freeAmpleAlloEnvConstraint P((AmpleAlloEnv * pAlloEnv_io));
extern AmpleAlloEnv *		parseAmpleAlloEnvConstraint P((
				 char *                     pszLine_in,
				 int *                      piParsError_out,
				 unsigned                   uiRecordNumber_in,
				 const char *               pszRecordKey_in,
				 const Change *             pOrthoChanges_in,
				 const StringList *         pCategories_in,
				 const AmpleProperties *    pProperties_in,
				 const AmpleCategoryClass * pCategClasses_in,
				 const AmpleMorphClass *    pMorphClasses_in,
				 const StringClass *        pStringClasses_in,
											  /* 3.3.0 hab */
				 const PunctClass *         pPunctClasses_in,
				 const char *               pszValidChars_in,
				 FILE *                     pLogFP_in,
				 StringList **              ppStringList_io,
				 AmpleAlloEnv **            ppAlloEnvList_io));
extern AmpleEnvConstraint *	parseAmpleInfixEnvConstraint P((
				  char *                     pszLine_in,
				  unsigned                   uiRecordNumber_in,
				  const char *               pszRecordKey_in,
				  const Change *             pOrthoChanges_in,
				  const StringList *         pCategories_in,
				  const AmpleProperties *    pProperties_in,
				  const AmpleCategoryClass * pCategClasses_in,
				  const AmpleMorphClass *    pMorphClasses_in,
				  const StringClass *        pStringClasses_in,
				  const char *               pszValidChars_in,
				  FILE *                     pLogFP_in,
				  StringList **              ppStringList_io));
extern AmpleEnvConstraint *	parseAmpleMorphEnvConstraint P((
				char *                     line,
				const char *               pszRecordType_in,
				const StringList *         pCategories_in,
				const AmpleProperties *    pProperties_in,
				const AmpleCategoryClass * pCategClasses_in,
				const AmpleMorphClass *    pMorphClasses_in,
				FILE *                     pLogFP_in,
				StringList **              ppStringList_io));
#ifdef EXPERIMENTAL
#ifndef hab350
extern AmpleEnvConstraint *	parseAmpleNeverEnvConstraint P((
				char *                     line,
				const char *               pszRecordType_in,
				const StringList *         pCategories_in,
				const AmpleProperties *    pProperties_in,
				const AmpleCategoryClass * pCategClasses_in,
				const AmpleMorphClass *    pMorphClasses_in,
				FILE *                     pLogFP_in,
				StringList **              ppStringList_io));
#endif /* hab350 */
#endif /* EXPERIMENTAL */

/*****************************************************************************
 *  some generally useful macros
 */
#ifndef myisspace
#define myisspace(x) (isascii(x) ? isspace(x) : FALSE)
#endif
#ifndef isascii
#ifdef _MSC_VER
#define isascii __isascii
#else
extern int isascii P((int));
#endif
#endif
/*
 *  nonANSI standard library functions
 */
#ifndef isatty
extern int isatty P((int));
#endif
#ifndef fileno
extern int fileno P((FILE *));
#endif
/*
 *  not every system defines these elsewhere
 */
#ifndef TRUE
#define TRUE	1
#define FALSE   0
#endif
/*
 *  the ASCII NUL character
 */
#ifndef NUL
#define NUL     '\0'
#endif

/*****************************************************************************
 *
 *  miscellaneous constant definitions
 */
/*
 *  preallocated size of large records (such as analysis data file)
 */
#ifdef CODEVIEW
#define BIG_RECSIZE 10240
#else
#define BIG_RECSIZE (unsigned)65510 /* most we can get out of 64K */
#endif
/*
 *  preallocated size of small records (such as dictionary entries)
 */
#define SMALL_RECSIZE 10240

#ifdef __cplusplus
}
#endif
#endif /*_STAMPLE_H_INCLUDED_*/
