/* PATRLEXI.C - functions to use lexicons for PC-PATR
 ***************************************************************************
 *
 * int loadPATRLexicon(const char * pszLexiconFile_in,
 *		       PATRData *   pPATR_io)
 * void addPATRLexItem(char *	     pszWord_in,
 *		       char *	     pszGloss_in,
 *		       char *	     pszRootGloss_in,
 *		       char *	     pszCategory_in,
 *		       char *	     pszFeatures_in,
 *		       PATRFeature * pFeature_in,
 *		       PATRData *    pPATR_io)
 * void freePATRLexicon(PATRData * pPATR_io)
 * void showPATRLexicon(PATRData * pPATR_in)
 * void parseWithPATRLexicon(char *        pszSentence_in,
 *			     FILE *        pOutputFP_in,
 *			     PATRLexItem * (*pfMorphParser_in)(char *),
 *			     int           bWarnUnusedFd_in,
 *			     PATRData *    pPATR_in)
 * void writePATRLexicon(FILE *     pOutputFP_in,
 *			 PATRData * pPATR_in)
 *
 ***************************************************************************
 * Copyright 1994, 2000 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
#include "rpterror.h"	/* for NumberedMessage and displayNumberedMessage() */
#include "cmd.h"	/* temp fix */

#ifdef applec
#pragma segment S_lexicon
#endif
/*
 *  local function prototypes
 */
static VOIDP		add_patr_lex_item P((VOIDP vitem, VOIDP vlist));
static void		erase_patr_lex_item P((VOIDP listp));
static int		feature_path_index P((char *featpath,
						  PATRData * pPATR_in));
static unsigned char *	next_feature P((unsigned char *string,
					unsigned char ** ppszSave));
static short *		build_feat_index P((char *feature_string,
						PATRData * pPATR_in));
static int		same_features P((short *oldfeat, short *newfeat));
static VOIDP		add_ample_item P((VOIDP vitem, VOIDP vlist));
static void		show_patr_lex_item P((VOIDP list, int indent,
						  FILE *outfp));
static PATRFeatureDisjunction *
			add_feature_path P((char *fpath,
						PATRFeatureDisjunction *featd,
						PATRData * pPATR_in));
static unsigned		category_index P((char *category,
					  PATRData * pPATR_in));
static int		feature_index P((char *feat, PATRData * pPATR_in));
static unsigned char *	new_patr_lex_item_string P((unsigned char *string,
							PATRData * pThis));
static void		reuse_patr_lex_item_string P((unsigned char *string,
							  PATRData * pThis));
static void		free_patr_lex_item_string P((unsigned char *string,
							 PATRData * pThis));
static short *		new_patr_lex_item_indexes P((int length,
							 PATRData * pThis));
static void		free_patr_lex_item_indexes P((short *feat_index,
							  PATRData * pThis));
static void		reuse_patr_lex_item_indexes P((short *feat_index,
							   PATRData * pThis));
static PATRLexItem *	new_patr_lex_item P((PATRData * pThis));
static void		reuse_patr_lex_item P((PATRLexItem *lip,
						   PATRData * pThis));
static void		free_patr_lex_items P((PATRData * pPATR_in));
static int		write_path P((FILE *outfp, PATRFeature *featp,
					  StringList *headsp, int indent,
					  PATRData * pPATR_in));
static void		write_feature_paths P((FILE *outfp,
						   PATRFeature *featp,
						   int indent,
						   PATRData * pPATR_in));
static void		write_patr_lex_item P((VOIDP list));
static int		same_patr_lex_entry P((PATRLexItem * p1st_in,
						   PATRLexItem * p2nd_in));
/*
 *  local type definitions
 */
struct patr_lex_item_array {
	PATRLexItem *		 array;
	struct patr_lex_item_array * link;
	};
struct patr_char_array
	{
	unsigned char *		buffer;
	struct patr_char_array *	link;
	};
struct patr_short_array
	{
	short *			buffer;
	struct patr_short_array *	link;
	};

/*
 *  variables used in loading the lexicon
 */
static const int    iPCPATRMaxTrieDepth_m     = 3;
static const size_t uiPATRLexItemArraySize_m  = 1000;	/* 0 or 1000 */
static const size_t uiPATRLexCharArraySize_m  = 8000;	/* 0 or 8000 */
static const size_t uiPATRLexShortArraySize_m = 2000;	/* 0 or 2000 */

/* same chars as isspace() */
static const unsigned char szWhitespace_m[7] = " \t\n\v\f\r";

static const NumberedMessage sBadLexiconFile_m		= { ERROR_MSG,   300,
	"Lexicon file could not be opened: %s" };
static const NumberedMessage sMissingLexicalItem_m	= { WARNING_MSG, 324,
	"Expected lexical item in entry %u" };
static const NumberedMessage sMissingCategory_m		= { WARNING_MSG, 324,
	"Expected category in entry %u (%s)" };
/*static const NumberedMessage sInvalidCategory_m	= { WARNING_MSG, 327,
	"Invalid category \"%s\" in entry %u (%s)" };*/
static const NumberedMessage sInvalidFeature_m		= { WARNING_MSG, 327,
	"Invalid feature \"%s\" in entry %u (%s)" };
static const NumberedMessage sFeatureNotFound_m		= { WARNING_MSG, 327,
	"Invalid feature %s" };
static const NumberedMessage sWordNotInLexicon_m	= { WARNING_MSG, 328,
	"\"%s\" is not in the lexicon" };
static const NumberedMessage sFeatureNotComplex_m	= { WARNING_MSG, 329,
	"\"%s\" is not a complex feature" };

/************************************************************************
 * NAME
 *    new_patr_lex_item_string
 * DESCRIPTION
 *    make a copy of the string
 *    we allocate space uiPATRLexCharArraySize_m bytes at a time for efficiency
 * RETURN VALUE
 *    pointer to the new copy
 */
static unsigned char * new_patr_lex_item_string(string, pThis)
unsigned char *	string;		/* character string to copy */
PATRData * pThis;
{
size_t length;
unsigned char * newstring;
struct patr_char_array * cbp;

if (string == (unsigned char *)NULL)
	return( (unsigned char *)NULL );
if (uiPATRLexCharArraySize_m > 1)
	{
	length = strlen((char *)string) + 1;
	if (pThis->pMem->iPATRLexCharsAvailable < length)
	{
	cbp = (struct patr_char_array *)allocMemory(
						  sizeof(struct patr_char_array));
	cbp->buffer = (unsigned char *)allocMemory(
				 uiPATRLexCharArraySize_m * sizeof(unsigned char));
	cbp->link = NULL;
	pThis->pMem->iPATRLexCharsAvailable = uiPATRLexCharArraySize_m;
	if (pThis->pMem->pHeadPATRLexCharArrays == NULL)
		pThis->pMem->pHeadPATRLexCharArrays = cbp;
	else
		pThis->pMem->pTailPATRLexCharArrays->link = cbp;
	pThis->pMem->pTailPATRLexCharArrays = cbp;
	}
	pThis->pMem->iPATRLexCharsAvailable -= length;
	newstring = &(pThis->pMem->pTailPATRLexCharArrays->buffer[pThis->pMem->iPATRLexCharsAvailable]);
	strcpy((char *)newstring, (char *)string);
	return( newstring );
	}
else
	return( (unsigned char *)duplicateString((char *)string) );
}

/************************************************************************
 * NAME
 *    free_patr_lex_item_string
 * DESCRIPTION
 *    free the string allocated for a patr_lex_item struct
 * RETURN VALUE
 *    none
 */
static void free_patr_lex_item_string(string, pThis)
unsigned char *	string;		/* character string to free */
PATRData * pThis;
{
struct patr_char_array *cbp;

if (uiPATRLexCharArraySize_m > 1)
	{
	while (pThis->pMem->pHeadPATRLexCharArrays != NULL)
	{
	cbp = pThis->pMem->pHeadPATRLexCharArrays->link;
	freeMemory( pThis->pMem->pHeadPATRLexCharArrays->buffer );
	freeMemory( pThis->pMem->pHeadPATRLexCharArrays );
	pThis->pMem->pHeadPATRLexCharArrays = cbp;
	}
	pThis->pMem->pTailPATRLexCharArrays = NULL;
	pThis->pMem->iPATRLexCharsAvailable = 0;
	}
else
	freeMemory(string);
}

/************************************************************************
 * NAME
 *    reuse_patr_lex_item_string
 * DESCRIPTION
 *    make the string allocated for a patr_lex_item struct available for reuse
 * RETURN VALUE
 *    none
 */
static void reuse_patr_lex_item_string(string, pThis)
unsigned char *	string;		/* character string to reuse */
PATRData * pThis;
{
if (string == NULL)
	return;
if (uiPATRLexCharArraySize_m > 1)
	{
	pThis->pMem->iPATRLexCharsAvailable += strlen((char *)string) + 1;
	if (pThis->pMem->iPATRLexCharsAvailable > uiPATRLexCharArraySize_m)
	pThis->pMem->iPATRLexCharsAvailable = uiPATRLexCharArraySize_m;
	}
else
	freeMemory(string);
}

/************************************************************************
 * NAME
 *    new_patr_lex_item_indexes
 * DESCRIPTION
 *    allocate an array of index values
 *    we allocate space uiPATRLexShortArraySize_m shorts at a time for
 *    efficiency
 * RETURN VALUE
 *    pointer to the new array
 */
static short * new_patr_lex_item_indexes(length, pThis)
int	length;		/* number of indexes desired for an array */
PATRData * pThis;
{
short * newfeat_index;
struct patr_short_array * ibp;

if (uiPATRLexShortArraySize_m > 1)
	{
	if (pThis->pMem->iPATRLexShortsAvailable < (unsigned)length)
	{
	ibp = (struct patr_short_array *)allocMemory(
						 sizeof(struct patr_short_array));
	ibp->buffer = (short *)allocMemory(
					uiPATRLexShortArraySize_m * sizeof(short));
	ibp->link = NULL;
	pThis->pMem->iPATRLexShortsAvailable = uiPATRLexShortArraySize_m;
	if (pThis->pMem->pHeadPATRLexShortArrays == NULL)
		pThis->pMem->pHeadPATRLexShortArrays = ibp;
	else
		pThis->pMem->pTailPATRLexShortArrays->link = ibp;
	pThis->pMem->pTailPATRLexShortArrays = ibp;
	}
	pThis->pMem->iPATRLexShortsAvailable -= length;
	newfeat_index =
		   &(pThis->pMem->pTailPATRLexShortArrays->buffer[pThis->pMem->iPATRLexShortsAvailable]);
	}
else
	newfeat_index = (short *)allocMemory(length * sizeof(unsigned short));
return( newfeat_index );
}

/************************************************************************
 * NAME
 *    free_patr_lex_item_indexes
 * DESCRIPTION
 *    free the indexes allocated for a patr_lex_item struct
 * RETURN VALUE
 *    none
 */
static void free_patr_lex_item_indexes(feat_index, pThis)
short *	feat_index;	/* feature indexes to free */
PATRData * pThis;
{
struct patr_short_array *ibp;

if (uiPATRLexShortArraySize_m > 1)
	{
	while (pThis->pMem->pHeadPATRLexShortArrays != NULL)
	{
	ibp = pThis->pMem->pHeadPATRLexShortArrays->link;
	freeMemory( pThis->pMem->pHeadPATRLexShortArrays->buffer );
	freeMemory( pThis->pMem->pHeadPATRLexShortArrays );
	pThis->pMem->pHeadPATRLexShortArrays = ibp;
	}
	pThis->pMem->pTailPATRLexShortArrays = NULL;
	pThis->pMem->iPATRLexShortsAvailable = 0;
	}
else
	freeMemory(feat_index);
}

/************************************************************************
 * NAME
 *    reuse_patr_lex_item_indexes
 * DESCRIPTION
 *    free the indexes allocated for a patr_lex_item struct
 * RETURN VALUE
 *    none
 */
static void reuse_patr_lex_item_indexes(feat_index, pThis)
short *	feat_index;	/* feature indexes to reuse */
PATRData * pThis;
{
int i;

if (feat_index == NULL)
	return;
if (uiPATRLexShortArraySize_m > 1)
	{
	for ( i = 0 ; feat_index[i] ; ++i )
	;
	pThis->pMem->iPATRLexShortsAvailable += i+1;
	}
else
	freeMemory(feat_index);
}

/************************************************************************
 * NAME
 *    new_patr_lex_item
 * DESCRIPTION
 *    allocate a new patr_lex_item struct from the heap
 *    we allocate uiPATRLexItemArraySize_m nodes at a time for efficiency
 * RETURN VALUE
 *    pointer to the new patr_lex_item struct
 */
static PATRLexItem * new_patr_lex_item(pThis)
PATRData * pThis;
{
struct patr_lex_item_array *	liap;

if (uiPATRLexItemArraySize_m > 1)
	{
	if (pThis->pMem->iPATRLexItemsAvailable == 0)
	{
	liap = (struct patr_lex_item_array *)allocMemory(
					   sizeof(struct patr_lex_item_array));
	liap->array = (PATRLexItem *)allocMemory(
				   uiPATRLexItemArraySize_m * sizeof(PATRLexItem));
	liap->link = NULL;
	pThis->pMem->iPATRLexItemsAvailable = uiPATRLexItemArraySize_m;
	if (pThis->pMem->pHeadPATRLexItemArrays == NULL)
		pThis->pMem->pHeadPATRLexItemArrays = liap;
	else
		pThis->pMem->pTailPATRLexItemArrays->link = liap;
	pThis->pMem->pTailPATRLexItemArrays = liap;
	}
	--pThis->pMem->iPATRLexItemsAvailable;
	return( &(pThis->pMem->pTailPATRLexItemArrays->array[pThis->pMem->iPATRLexItemsAvailable]) );
	}
else
	return(
	  (PATRLexItem *)allocMemory(sizeof(PATRLexItem)));
}

/************************************************************************
 * NAME
 *    reuse_patr_lex_item
 * DESCRIPTION
 *    reuse an allocated patr_lex_item struct from the heap
 * RETURN VALUE
 *    none
 */
static void reuse_patr_lex_item(lip, pThis)
PATRLexItem *	lip;	/* pointer to a patr_lex_item struct */
PATRData * pThis;
{
if (lip == NULL)
	return;
if (uiPATRLexItemArraySize_m > 1)
	++pThis->pMem->iPATRLexItemsAvailable;
else
	freeMemory(lip);
}

/************************************************************************
 * NAME
 *    free_patr_lex_items
 * DESCRIPTION
 *    free the arrays of patr_lex_item structs previously allocated
 * RETURN VALUE
 *    none
 */
static void free_patr_lex_items(pPATR_in)
PATRData * pPATR_in;
{
struct patr_lex_item_array *	liap;
PATRLexItem *			lip;
unsigned			i;

while (pPATR_in->pMem->pHeadPATRLexItemArrays != NULL)
	{
	for ( i = 0 ; i < uiPATRLexItemArraySize_m ; ++i )
	{
	lip = &(pPATR_in->pMem->pHeadPATRLexItemArrays->array[i]);
	if (lip->pszLexString)
		free_patr_lex_item_string(lip->pszLexString, pPATR_in);
	if (lip->piFeatureIndexes)
		free_patr_lex_item_indexes(lip->piFeatureIndexes, pPATR_in);
	if (lip->pszGloss)
		free_patr_lex_item_string(lip->pszGloss, pPATR_in);
#ifndef hab130
	if (lip->pszRootGloss)
		free_patr_lex_item_string(lip->pszRootGloss, pPATR_in);
#endif /* hab130 */
	if (lip->pFeature)
		freePATRFeature(lip->pFeature, pPATR_in);
	}
	liap = pPATR_in->pMem->pHeadPATRLexItemArrays->link;
	freeMemory( pPATR_in->pMem->pHeadPATRLexItemArrays->array );
	freeMemory( pPATR_in->pMem->pHeadPATRLexItemArrays );
	pPATR_in->pMem->pHeadPATRLexItemArrays = liap;
	}
pPATR_in->pMem->pTailPATRLexItemArrays = NULL;
pPATR_in->pMem->iPATRLexItemsAvailable = 0;
}

/****************************************************************************
 * NAME
 *    add_patr_lex_item
 * DESCRIPTION
 *    Add a node to the end of a linked list of patr_lex_item nodes.
 * RETURN VALUE
 *    none
 */
static VOIDP add_patr_lex_item(vitem,vlist)
VOIDP vitem;	/* current patr_lex_item node to add to the list */
VOIDP vlist;	/* list of patr_lex_item nodes */
{
PATRLexItem *item;
PATRLexItem *list;
register PATRLexItem *lp;

item = (PATRLexItem *)vitem;
list = (PATRLexItem *)vlist;
item->pNext = NULL;
/*
 *  if empty list, just return the item
 */
if (list == NULL)
	return((VOIDP)item);
/*
 *  add the item to the end of the list, then return the head of the list
 */
for ( lp = list ; lp->pNext != NULL ; lp = lp->pNext )
	;
lp->pNext = item;
return((VOIDP)list);
}

/****************************************************************************
 * NAME
 *    erase_patr_lex_item
 * DESCRIPTION
 *    Free the memory used by a linked list of patr_lex_item nodes.
 * RETURN VALUE
 *    none
 */
static PATRData *	pPATR_m;
static void erase_patr_lex_item(listp)
VOIDP listp;	/* pointer to a linked list of patr_lex_item nodes */
{
PATRLexItem *lp, *nextlp;

if (uiPATRLexItemArraySize_m > 1)
	{
	free_patr_lex_items(pPATR_m);
	return;
	}
for ( lp = listp ; lp ; lp = nextlp )
	{
	nextlp = lp->pNext;
	if (lp->pszLexString)
	free_patr_lex_item_string(lp->pszLexString, pPATR_m);
	if (lp->piFeatureIndexes)
	free_patr_lex_item_indexes(lp->piFeatureIndexes, pPATR_m);
	if (lp->pszGloss)
	free_patr_lex_item_string(lp->pszGloss, pPATR_m);
#ifndef hab130
	if (lp->pszRootGloss)
	free_patr_lex_item_string(lp->pszRootGloss, pPATR_m);
#endif /* hab130 */
	if (lp->pFeature)
	freePATRFeature(lp->pFeature, pPATR_m);
	freeMemory(lp);
	}
}

/*****************************************************************************
 * NAME
 *    category_index
 * DESCRIPTION
 *    Look up "category" in the array of category names, adding it if
 *    it's not there.
 * RETURN VALUE
 *    1-based index of "category" in the array of category names
 */
static unsigned category_index(category, pPATR_in)
char *		category;	/* name of the category */
PATRData *	pPATR_in;
{
unsigned i;

for ( i = 0 ; i < pPATR_in->pLexicon->iCategoriesStored ; ++i )
	{
	if (strcmp(category, pPATR_in->pLexicon->ppszCategories[i]) == 0)
	return( i+1 );
	}
if (pPATR_in->pLexicon->iCategoriesStored >= pPATR_in->pLexicon->iCategoriesAllocated)
	{
	pPATR_in->pLexicon->iCategoriesAllocated += 20;
	if (pPATR_in->pLexicon->ppszCategories == (char **)NULL)
	pPATR_in->pLexicon->ppszCategories = (char **)allocMemory(pPATR_in->pLexicon->iCategoriesAllocated * sizeof(char**));
	else
	pPATR_in->pLexicon->ppszCategories = (char **)reallocMemory(pPATR_in->pLexicon->ppszCategories,
						pPATR_in->pLexicon->iCategoriesAllocated * sizeof(char**));
	}
pPATR_in->pLexicon->ppszCategories[pPATR_in->pLexicon->iCategoriesStored++] = duplicateString( category );
return( pPATR_in->pLexicon->iCategoriesStored );
}

/*****************************************************************************
 * NAME
 *    feature_path_index
 * DESCRIPTION
 *    Look up "featpath" in the array of feature path assignments, adding it
 *    if it's not there.
 * RETURN VALUE
 *    negated 1-based index of "featpath" in the array of feature path
 *    assignments
 */
static int feature_path_index(featpath, pPATR_in)
char *		featpath;	/* string containing the feature
				   "<path> = value" assignment */
PATRData *	pPATR_in;
{
unsigned i;

for ( i = 0 ; i < pPATR_in->pLexicon->iFeaturePathsStored ; ++i )
	{
	if (strcmp(featpath, pPATR_in->pLexicon->ppszFeaturePaths[i]) == 0)
	return( -((int)i+1) );
	}
if (pPATR_in->pLexicon->iFeaturePathsStored >= pPATR_in->pLexicon->iFeaturePathsAllocated)
	{
	pPATR_in->pLexicon->iFeaturePathsAllocated += 20;
	if (pPATR_in->pLexicon->ppszFeaturePaths == (char **)NULL)
	pPATR_in->pLexicon->ppszFeaturePaths = (char **)allocMemory(
					 pPATR_in->pLexicon->iFeaturePathsAllocated * sizeof(char **));
	else
	pPATR_in->pLexicon->ppszFeaturePaths = (char **)reallocMemory(pPATR_in->pLexicon->ppszFeaturePaths,
					 pPATR_in->pLexicon->iFeaturePathsAllocated * sizeof(char **));
	}
pPATR_in->pLexicon->ppszFeaturePaths[pPATR_in->pLexicon->iFeaturePathsStored++] = duplicateString( featpath );
return( -(int)pPATR_in->pLexicon->iFeaturePathsStored );
}

/*****************************************************************************
 * NAME
 *    feature_index
 * DESCRIPTION
 *    Look up "feat" in the array of feature names, adding it if it's not
 *    there.
 * RETURN VALUE
 *    1-based index of "feat" in the array of feature names
 *    negative values indicate a feature "<path> = value" string instead of
 *    a template name
 */
static int feature_index(feat, pPATR_in)
char *		feat;		/* name of the feature */
PATRData *	pPATR_in;
{
unsigned i;

if ((feat == NULL) || (*feat == NUL))
	return( 0 );
if (*feat == '<')
	return( feature_path_index(feat, pPATR_in) );

for ( i = 0 ; i < pPATR_in->pLexicon->iFeaturesStored ; ++i )
	{
	if (strcmp(feat, pPATR_in->pLexicon->ppszFeatures[i]) == 0)
	return( i+1 );
	}
if (pPATR_in->pLexicon->iFeaturesStored >= pPATR_in->pLexicon->iFeaturesAllocated)
	{
	pPATR_in->pLexicon->iFeaturesAllocated += 20;
	if (pPATR_in->pLexicon->ppszFeatures == (char **)NULL)
	pPATR_in->pLexicon->ppszFeatures = (char **)allocMemory(pPATR_in->pLexicon->iFeaturesAllocated * sizeof(char **));
	else
	pPATR_in->pLexicon->ppszFeatures = (char **)reallocMemory(pPATR_in->pLexicon->ppszFeatures,
					  pPATR_in->pLexicon->iFeaturesAllocated * sizeof(char **));
	}
pPATR_in->pLexicon->ppszFeatures[pPATR_in->pLexicon->iFeaturesStored++] = duplicateString( feat );
return( pPATR_in->pLexicon->iFeaturesStored );
}

/*****************************************************************************
 * NAME
 *    freePATRLexicon
 * DESCRIPTION
 *    free the memory allocated for the lexicon
 * RETURN VALUE
 *    none
 */
void freePATRLexicon(pPATR_io)
PATRData *	pPATR_io;
{
unsigned i;

if (pPATR_io->pLexicon != NULL)
	{
	pPATR_m = pPATR_io;
	if (pPATR_io->pLexicon->ppszCategories != (char **)NULL)
	{
	for ( i = 0 ; i < pPATR_io->pLexicon->iCategoriesStored ; ++i )
		freeMemory(pPATR_io->pLexicon->ppszCategories[i]);
	freeMemory(pPATR_io->pLexicon->ppszCategories);
	}
	if (pPATR_io->pLexicon->ppszFeatures != (char **)NULL)
	{
	for ( i = 0 ; i < pPATR_io->pLexicon->iFeaturesStored ; ++i )
		freeMemory(pPATR_io->pLexicon->ppszFeatures[i]);
	freeMemory(pPATR_io->pLexicon->ppszFeatures);
	}
	if (pPATR_io->pLexicon->ppszFeaturePaths != (char **)NULL)
	{
	for ( i = 0 ; i < pPATR_io->pLexicon->iFeaturePathsStored ; ++i )
		freeMemory(pPATR_io->pLexicon->ppszFeaturePaths[i]);
	freeMemory(pPATR_io->pLexicon->ppszFeaturePaths);
	}
	if (pPATR_io->pLexicon->pStorage != NULL)
	{
	eraseTrie(pPATR_io->pLexicon->pStorage, erase_patr_lex_item);
	}
	freeMemory(pPATR_io->pLexicon);
	pPATR_io->pLexicon = NULL;
	pPATR_m = NULL;
	}
pPATR_io->bGlossesExist  = FALSE;
}

/*****************************************************************************
 * NAME
 *    next_feature
 * DESCRIPTION
 *    Find the first feature in the string.  If string is NULL, then find the
 *    next feature in the stored string.
 * RETURN VALUE
 *    pointer to next feature name or path, or NULL if no more
 */
static unsigned char * next_feature(string, ppszSave)
unsigned char *	string;		/* string containing zero or more features */
unsigned char ** ppszSave;
{
unsigned char *p, *q;
int ch;

if (string == (unsigned char *)NULL)
	p = *ppszSave;
else
	p = string;
if (p == (unsigned char *)NULL)
	return( (unsigned char *)NULL );
while (((ch = *p) != NUL) && isascii(ch) && isspace(ch))
	++p;
if (ch == NUL)
	{
	*ppszSave = (unsigned char *)NULL;
	return( (unsigned char *)NULL );
	}
if (ch == '<')
	{
	q = (unsigned char *)strchr((char *)p, '>');
	if (q != (unsigned char *)NULL)
	q = (unsigned char *)strchr((char *)q, '=');
	if (q != (unsigned char *)NULL)
	{
	++q;
	while (((ch = *q) != NUL) && isascii(ch) && isspace(ch))
		++q;
	if (*q == '<')
		{
		q = (unsigned char *)strchr((char *)q, '>');
		if (q != (unsigned char *)NULL)
		{
		++q;
		*q++ = NUL;
		*ppszSave = q;
		}
		else
		*ppszSave = (unsigned char *)NULL;
		}
	else
		goto skip_over_token;
	}
	else
	*ppszSave = (unsigned char *)NULL;
	}
else
	{
	q = p;
skip_over_token:
	while (((ch = *q) != NUL) && (!isascii(ch) || !isspace(ch)))
	++q;
	if (ch == NUL)
	*ppszSave = (unsigned char *)NULL;
	else
	{
	*q++ = NUL;
	*ppszSave = q;
	}
	}
return( p );
}

/*****************************************************************************
 * NAME
 *    loadPATRLexicon
 * DESCRIPTION
 *    load a lexicon from the indicated file
 * RETURN VALUE
 *    0 if an error occurs, otherwise nonzero
 */
int loadPATRLexicon(pszLexiconFile_in, pPATR_io)
const char *	pszLexiconFile_in;	/* name of the lexicon file */
PATRData *	pPATR_io;
{
FILE *fp;
char *rp, *recp, *nextrp;
size_t k;
int num_feats;
unsigned char *word, *category, *features, *gloss;
#ifndef hab130
unsigned char *rootgloss;
#endif /* hab130 */
unsigned char *p, *q;
StringList *fsp, *sp, *nextsp, *avail_sp;
PATRLexItem *lp;
CodeTable lex_table;
unsigned phrase_length;
unsigned uiLexRecords;
/*
 *  open the lexicon file
 */
if ((pszLexiconFile_in == NULL) || (pszLexiconFile_in[0] == NUL))
	{
	return( 0 );
	}
fp = fopen(pszLexiconFile_in, "r");
if (fp == NULL)
	{
	displayNumberedMessage(&sBadLexiconFile_m,
			   pPATR_io->bSilent, pPATR_io->bShowWarnings,
			   pPATR_io->pLogFP,
			   NULL, 0,
			   pszLexiconFile_in);
	return( 0 );
	}
if (pPATR_io->pLexicon == NULL)
	{
	pPATR_io->pLexicon = (PATRLexicon *)allocMemory(sizeof(PATRLexicon));
	memset(pPATR_io->pLexicon, 0, sizeof(PATRLexicon));
	}
/*
 *  build the code table for the lexicon file
 */
k = strlen(pPATR_io->pszWordMarker)     +
	strlen(pPATR_io->pszCategoryMarker) +
	strlen(pPATR_io->pszFeatureMarker)  +
#ifdef hab130
	strlen(pPATR_io->pszGlossMarker)    + 12;
#else  /* hab130 */
	strlen(pPATR_io->pszGlossMarker)    +
	strlen(pPATR_io->pszRootGlossMarker)+ 15;
#endif /* hab130 */
lex_table.pCodeTable = allocMemory( k );
strcpy(lex_table.pCodeTable, pPATR_io->pszWordMarker);
k = strlen(pPATR_io->pszWordMarker) + 1;
lex_table.pCodeTable[k++] = 'W';
lex_table.pCodeTable[k++] = NUL;
strcpy(lex_table.pCodeTable + k, pPATR_io->pszCategoryMarker);
k += strlen(pPATR_io->pszCategoryMarker) + 1;
lex_table.pCodeTable[k++] = 'C';
lex_table.pCodeTable[k++] = NUL;
strcpy(lex_table.pCodeTable + k, pPATR_io->pszFeatureMarker);
k += strlen(pPATR_io->pszFeatureMarker) + 1;
lex_table.pCodeTable[k++] = 'F';
lex_table.pCodeTable[k++] = NUL;
strcpy(lex_table.pCodeTable + k, pPATR_io->pszGlossMarker);
k += strlen(pPATR_io->pszGlossMarker) + 1;
lex_table.pCodeTable[k++] = 'G';
lex_table.pCodeTable[k++] = NUL;
#ifdef hab130
lex_table.uiCodeCount = 4;
#else
strcpy(lex_table.pCodeTable + k, pPATR_io->pszRootGlossMarker);
k += strlen(pPATR_io->pszRootGlossMarker) + 1;
lex_table.pCodeTable[k++] = 'R';
lex_table.pCodeTable[k++] = NUL;
lex_table.uiCodeCount = 5;
#endif /* hab130 */
lex_table.pszFirstCode = (char *)pPATR_io->pszRecordMarker;
/*
 *  load all the records from the lexicon file
 */
uiLexRecords = 0;
avail_sp = NULL;
pPATR_io->pLexicon->uiMaxLexicalPhraseSize = 1;
while ((recp = readStdFormatRecord(fp,
				   &lex_table,
				   pPATR_io->cComment,
				   &uiLexRecords)) != NULL )
	{
#ifdef hab130
	word = category = features = gloss = (unsigned char *)NULL;
#else
	word = category = features = gloss = rootgloss = (unsigned char *)NULL;
#endif /* hab130 */
	rp = recp;
	while (*rp)
	{
	nextrp = rp + strlen(rp) + 1;
	switch (*rp)
		{
		case 'W':	/* lexical string */
		word = (unsigned char *)rp + 1;
		while (*word && isascii(*word) && isspace(*word))
			++word;
		for ( p = word+strlen((char *)word)-1 ; p >= word ; --p )
			{
			if (isascii(*p) && isspace(*p))
			*p = NUL;
			else
			break;
			}
		if (*word == NUL)
			word = (unsigned char *)NULL;
		break;
		case 'C':	/* category */
		category = tokenizeString((unsigned char *)rp + 1,
					  szWhitespace_m);
		break;
		case 'F':	/* features */
		features = (unsigned char *)rp + 1;
		break;
		case 'G':	/* gloss */
		gloss = (unsigned char *)rp + 1;
		while (*gloss && isascii(*gloss) && isspace(*gloss))
			++gloss;
		break;
#ifndef hab130
		case 'R':	/* rootgloss */
		rootgloss = (unsigned char *)rp + 1;
		while (*rootgloss && isascii(*rootgloss) && isspace(*rootgloss))
			++rootgloss;
		break;
#endif /* hab130 */
		default:
		break;
		}
	rp = nextrp;
	}
	if (word == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sMissingLexicalItem_m,
				   pPATR_io->bSilent, pPATR_io->bShowWarnings,
				   pPATR_io->pLogFP,
				   pszLexiconFile_in, 0,
				   uiLexRecords);
	continue;
	}
	else
	{
	/*
	 *  if a phrase, ensure only a single space between the words
	 */
	phrase_length = 1;
	p = word;
	while ((p = (unsigned char *)strpbrk((char *)p,(char *)szWhitespace_m))
							  != (unsigned char *)NULL)
		{
		*p++ = ' ';
		for ( q = p ; *q && isascii(*q) && isspace(*q) ; ++q )
		;
		if ((*q != NUL) && (q > p))
		memmove(p, q, q - p);
		++phrase_length;
		}
	if (phrase_length > pPATR_io->pLexicon->uiMaxLexicalPhraseSize)
		pPATR_io->pLexicon->uiMaxLexicalPhraseSize = phrase_length;
	}
	if (category == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sMissingCategory_m,
				   pPATR_io->bSilent, pPATR_io->bShowWarnings,
				   pPATR_io->pLogFP,
				   pszLexiconFile_in, 0,
				   uiLexRecords, word);
	continue;
	}
	/*
	 *  if the gloss field was empty, copy the lex field
	 */
	if ((gloss != (unsigned char *)NULL) && (*gloss == NUL))
	gloss = word;
	/*
	 *  add any features to the list of features
	 */
	fsp = NULL;
	num_feats = 0;
	if (features != (unsigned char *)NULL)
	{
	unsigned char * pszSave = NULL;
	for (	p = next_feature(features, &pszSave) ;
		p ;
		p = next_feature(NULL, &pszSave) )
		{
		if (    (*p != '<') &&
			(pPATR_io->pGrammar != NULL) &&
			(findPATRDefinition((char *)p, pPATR_io->pGrammar) ==
							  NULL) )
		{
		displayNumberedMessage(&sInvalidFeature_m,
					   pPATR_io->bSilent,
					   pPATR_io->bShowWarnings,
					   pPATR_io->pLogFP,
					   pszLexiconFile_in, 0,
					   p, uiLexRecords, word);
		}
		if (fsp == NULL)
		{
		/*
		 *  add the first feature to the list
		 */
		if (avail_sp != NULL)
			{
			fsp = avail_sp;
			avail_sp = avail_sp->pNext;
			}
		else
			fsp = allocMemory(sizeof(StringList));
		fsp->pNext = NULL;
		fsp->pszString = (char *)p;
		++num_feats;
		continue;
		}
		/*
		 *  avoid duplicate entries in the list
		 */
		for ( nextsp = sp = fsp ; sp ; sp = sp->pNext )
		{
		if (strcmp(sp->pszString, (char *)p) == 0)
			{
			nextsp = NULL;
			break;
			}
		nextsp = sp;
		}
		if (nextsp != NULL)
		{
		if (avail_sp != NULL)
			{
			nextsp->pNext = avail_sp;
			avail_sp = avail_sp->pNext;
			}
		else
			nextsp->pNext = allocMemory(sizeof(StringList));
		nextsp->pNext->pNext = NULL;
		nextsp->pNext->pszString = (char *)p;
		++num_feats;
		}
		}
	}
	/*
	 *  add this entry to the lexicon Trie storage
	 */
	lp = new_patr_lex_item(pPATR_io);
	lp->pNext          = NULL;
	lp->pszLexString   = new_patr_lex_item_string( word, pPATR_io );
	if (gloss != NULL)
	{
	/*
	 *  remove any trailing whitespace
	 */
	for ( p = gloss + strlen((char *)gloss) - 1 ; p >= gloss ; --p )
		{
		if (isascii(*p) && isspace(*p))
		*p = NUL;
		else
		break;
		}
	lp->pszGloss = new_patr_lex_item_string( gloss, pPATR_io );
	pPATR_io->bGlossesExist = TRUE;
	pPATR_io->bGloss        = TRUE;
	}
	else
	lp->pszGloss = NULL;
#ifndef hab130
	if ((pPATR_io->eRootGlossFeature != PATR_ROOT_GLOSS_NO_FEATURE) &&
	(rootgloss != NULL))
		{
	  /*
	   *  remove any trailing whitespace
	   */
	for ( p = rootgloss + strlen((char *)rootgloss) - 1 ;
		  p >= rootgloss ;
		  --p )
		{
		if (isascii(*p) && isspace(*p))
		  *p = NUL;
		else
		  break;
		}
	lp->pszRootGloss = new_patr_lex_item_string( rootgloss, pPATR_io );
	}
	else
		lp->pszRootGloss = NULL;
#endif /* hab130 */
	lp->uiCategory = category_index( (char *)category, pPATR_io );
	lp->piFeatureIndexes   = new_patr_lex_item_indexes( num_feats + 1,
							pPATR_io );
	for ( k = 0 ; fsp ; fsp = nextsp, ++k )
	{
	nextsp = fsp->pNext;
	lp->piFeatureIndexes[k] = feature_index( fsp->pszString, pPATR_io );
	fsp->pszString = NULL;
	fsp->pNext = avail_sp;
	avail_sp = fsp;
	}
	lp->piFeatureIndexes[k] = 0;
	pPATR_io->pLexicon->pStorage = addDataToTrie(pPATR_io->pLexicon->pStorage,
						 (char *)word, lp,
						 add_patr_lex_item,
						 iPCPATRMaxTrieDepth_m);
	}
if (!pPATR_io->bSilent)
	reportMessage(TRUE, "%5u lexicon entrie%s loaded from %s\n",
		  uiLexRecords, (uiLexRecords == 1) ? "" : "s",
		  pszLexiconFile_in);
/*
 *  close the lexicon file and erase the temporary data structures
 */
fclose(fp);
cleanupAfterStdFormatRecord();
freeMemory(lex_table.pCodeTable);
for ( sp = avail_sp ; sp ; sp = nextsp )
	{
	nextsp = sp->pNext;
	freeMemory( sp );
	}
return( 1 );
}

/*****************************************************************************
 * NAME
 *    build_feat_index
 * DESCRIPTION
 *    convert a string of feature names into an array of feature indexes
 * RETURN VALUE
 *    pointer to the dynamically allocated array
 */
static short * build_feat_index(feature_string, pPATR_in)
char *		feature_string;	/* string containing a set of feature names */
PATRData *	pPATR_in;
{
short *indexes = NULL;
int num_feats;
char *p, *q;
int i, j, k;
/*
 *  convert any '=' to a space
 */
for ( p = feature_string ; p && *p ; ++p )
	{
	if (*p == '=')
	*p = ' ';
	}
/*
 *  count the number of feature names
 */
for ( num_feats = 0, p = feature_string ; p && *p ; p = q )
	{
	q = strpbrk(p, (char *)szWhitespace_m);
	if (q != p)
	++num_feats;
	if (q != NULL)
	{
	while (*q && isascii(*q) && isspace(*q))
		++q;
	}
	}
indexes = new_patr_lex_item_indexes( num_feats + 1, pPATR_in );
i = 0;
if (feature_string != NULL)
	{
	p = (char *)tokenizeString((unsigned char *)feature_string,
				   szWhitespace_m);
	for ( ; p ; p = (char *)tokenizeString(NULL,szWhitespace_m) )
	{
	if (	(pPATR_in->pGrammar != NULL) &&
		(findPATRDefinition((char *)p,pPATR_in->pGrammar) == NULL))
		{
		displayNumberedMessage(&sFeatureNotFound_m,
				   pPATR_in->bSilent, pPATR_in->bShowWarnings,
				   pPATR_in->pLogFP,
				   NULL, 0, p);
		}
	k = feature_index( p, pPATR_in );
	/*
	 *  avoid duplicate entries in the list
	 */
	for ( j = 0 ; j < i ; ++j )
		{
		if (indexes[j] == k)
		break;
		}
	if (j == i)
		indexes[i++] = k;
	}
	}
indexes[i] = 0;
return( indexes );
}

/*****************************************************************************
 * NAME
 *    same_features
 * DESCRIPTION
 *    compare two arrays of feature name indexes
 * RETURN VALUE
 *    TRUE if the arrays are the same, FALSE otherwise
 */
static int same_features(oldfeat, newfeat)
short *	oldfeat;	/* pointer to an array of feature name indexes */
short *	newfeat;	/* pointer to another array of feature name indexes */
{
int i;

if (oldfeat == newfeat)
	return( TRUE );
for ( i = 0 ; oldfeat[i] ; ++i )
	{
	if (oldfeat[i] != newfeat[i])
	return( FALSE );
	}
if (newfeat[i])
	return( FALSE );
else
	return( TRUE );
}

/*****************************************************************************
 * NAME
 *    same_patr_lex_entry
 * DESCRIPTION
 *    compare two PATRLexItem structures for being equivalent
 * RETURN VALUE
 *    TRUE if they are the same, otherwise FALSE
 */
static int same_patr_lex_entry(p1st_in, p2nd_in)
PATRLexItem *	p1st_in;
PATRLexItem *	p2nd_in;
{
if (p1st_in == p2nd_in)
	return TRUE;
else if ((p1st_in == NULL) || (p2nd_in == NULL))
	return FALSE;

if (p1st_in->pszLexString == p2nd_in->pszLexString)
	/* do nothing */;
else if ((p1st_in->pszLexString == NULL) || (p2nd_in->pszLexString == NULL))
	return FALSE;
else if (strcmp((char *)p1st_in->pszLexString, (char *)p2nd_in->pszLexString) != 0)
	return FALSE;

if (p1st_in->pszGloss == p2nd_in->pszGloss)
	/* do nothing */;
else if ((p1st_in->pszGloss == NULL) || (p2nd_in->pszGloss == NULL))
	return FALSE;
else if (strcmp((char *)p1st_in->pszGloss, (char *)p2nd_in->pszGloss) != 0)
	return FALSE;

#ifndef hab130
if (p1st_in->pszRootGloss == p2nd_in->pszRootGloss)
	/* do nothing */;
else if ((p1st_in->pszRootGloss == NULL) || (p2nd_in->pszRootGloss == NULL))
	return FALSE;
else if (strcmp((char *)p1st_in->pszRootGloss, (char *)p2nd_in->pszRootGloss) != 0)
	return FALSE;
#endif /* hab130 */

if (p1st_in->uiCategory != p2nd_in->uiCategory)
	return FALSE;

return same_features(p1st_in->piFeatureIndexes, p2nd_in->piFeatureIndexes);
}

/****************************************************************************
 * NAME
 *    add_ample_item
 * DESCRIPTION
 *    Add a node to the end of a linked list of patr_lex_item nodes,
 *    discarding any duplicate items.
 * RETURN VALUE
 *    none
 */
static VOIDP add_ample_item(vitem,vlist)
VOIDP vitem;	/* current patr_lex_item node to add the list */
VOIDP vlist;	/* list of patr_lex_item nodes */
{
PATRLexItem *item;
PATRLexItem *list;
register PATRLexItem *lp;
PATRLexItem *lastlp;

item = (PATRLexItem *)vitem;
list = (PATRLexItem *)vlist;
/*
 *  look for this item in the list of items
 */
for ( lastlp = lp = list ; lp ; lp = lp->pNext )
	{
	if (same_patr_lex_entry(lp, item))
	{
	reuse_patr_lex_item_string( item->pszGloss, pPATR_m );
#ifndef hab130
	reuse_patr_lex_item_string( item->pszRootGloss, pPATR_m );
#endif /* hab130 */
	reuse_patr_lex_item_string( item->pszLexString, pPATR_m );
	reuse_patr_lex_item_indexes( item->piFeatureIndexes, pPATR_m );
	reuse_patr_lex_item( item, pPATR_m );
	pPATR_m->pLexicon->iLexEntriesCount--;
	return((VOIDP)list);
	}
	lastlp = lp;
	}
/*
 *  not yet in the list, so add it
 */
item->pNext = NULL;
if (list == NULL)
	list = item;
else
	lastlp->pNext = item;
return((VOIDP)list);
}

/*****************************************************************************
 * NAME
 *    show_patr_lex_item
 * DESCRIPTION
 *    Print the list of patr_lex_item values, indented appropriately.
 * RETURN VALUE
 *    none
 */
static void show_patr_lex_item(list, indent, outfp)
VOIDP	list;		/* pointer to list of patr_lex_item structures */
int	indent;		/* number of spaces to indent */
FILE *	outfp;		/* output FILE pointer */
{
PATRLexItem *lip;
int i;
char *gloss, *cat;
PATRFeature *fnp;
char *	pszCatFeatName;
char *	pszGlossFeatName;
#ifndef hab130
char *  pszRootGlossFeatName;
char *  rootgloss;
#endif /* hab130 */
if (pPATR_m->pGrammar != NULL)
	{
	pszCatFeatName   = pPATR_m->pGrammar->pszCatFeatName;
	pszGlossFeatName = pPATR_m->pGrammar->pszGlossFeatName;
#ifndef hab130
	pszRootGlossFeatName = pPATR_m->pGrammar->pszRootGlossFeatName;
#endif /* hab130 */
	}
else
	{
	pszCatFeatName   = storedPATRString( "cat", pPATR_m);
	pszGlossFeatName = storedPATRString( "gloss", pPATR_m);
#ifndef hab130
	pszRootGlossFeatName = storedPATRString( "rootgloss", pPATR_m);
#endif /* hab130 */
	}
for ( lip = (PATRLexItem *)list ; lip ; lip = lip->pNext )
	{
	putc('\n', outfp);
	for ( i = 0 ; i < indent ; ++i )
	putc(' ', outfp);
	fprintf(outfp, "    %s",
		lip->pszLexString ? (char *)lip->pszLexString : "?");
	gloss = (char *)lip->pszGloss;
	if (gloss == NULL)
	{
	if (	lip->pFeature &&
		((fnp = findPATRAttribute(lip->pFeature,
					  pszGlossFeatName)) != NULL))
		{
		if ((fnp->eType == PATR_ATOM) || (fnp->eType == PATR_DEFATOM))
		gloss = fnp->u.pszAtom;
		}
	}
	if (gloss == NULL)
	gloss = "?";
	fprintf(outfp, "  '%s'", gloss);
#ifndef hab130
	rootgloss = (char *)lip->pszRootGloss;
	if (rootgloss == NULL)
	{
	if (	lip->pFeature &&
		((fnp = findPATRAttribute(lip->pFeature,
					  pszRootGlossFeatName)) != NULL))
		{
		if ((fnp->eType == PATR_ATOM) || (fnp->eType == PATR_DEFATOM))
		rootgloss = fnp->u.pszAtom;
		}
	}
	if (rootgloss == NULL)
	rootgloss = "?";
	fprintf(outfp, "  '%s'", rootgloss);
#endif /* hab130 */
	cat = NULL;
	if (lip->uiCategory > 0)
	cat = pPATR_m->pLexicon->ppszCategories[lip->uiCategory-1];
	else
	{
	if (	lip->pFeature &&
		((fnp = findPATRAttribute(lip->pFeature,
					  pszCatFeatName)) != NULL))
		{
		if ((fnp->eType == PATR_ATOM) || (fnp->eType == PATR_DEFATOM))
		cat = fnp->u.pszAtom;
		}
	}
	if (cat == NULL)
	cat = "?";
	fprintf(outfp, "  %s ;", cat);

	for ( i = 0 ; lip->piFeatureIndexes && lip->piFeatureIndexes[i] ; ++i )
	fprintf(outfp, "  %s",
		pPATR_m->pLexicon->ppszFeatures[lip->piFeatureIndexes[i]-1]);
	if (lip->pFeature != NULL)
	{
	fprintf(outfp, " ...");
	}
	}
}

/*****************************************************************************
 * NAME
 *    addPATRLexItem
 * DESCRIPTION
 *    add one item to the PATR lexicon
 * RETURN VALUE
 *    none
 */
#ifdef hab130
void addPATRLexItem(pszWord_in, pszGloss_in, pszCategory_in, pszFeatures_in,
			pFeature_in, pPATR_io)
char *		pszWord_in;
char *		pszGloss_in;
char *		pszCategory_in;
char *		pszFeatures_in;
PATRFeature *	pFeature_in;
PATRData *	pPATR_io;
#else  /* hab130 */
void addPATRLexItem(pszWord_in, pszGloss_in, pszRootGloss_in, pszCategory_in,
			pszFeatures_in, pFeature_in, pPATR_io)
char *		pszWord_in;
char *		pszGloss_in;
char *		pszRootGloss_in;
char *		pszCategory_in;
char *		pszFeatures_in;
PATRFeature *	pFeature_in;
PATRData *	pPATR_io;
#endif /* hab130 */
{
PATRLexItem *	pLexItem;

if (pPATR_io->pLexicon == NULL)
	{
	pPATR_io->pLexicon = (PATRLexicon *)allocMemory(sizeof(PATRLexicon));
	memset(pPATR_io->pLexicon, 0, sizeof(PATRLexicon));
	}
pLexItem = new_patr_lex_item(pPATR_io);
pLexItem->pNext          = NULL;
pLexItem->pszLexString   = new_patr_lex_item_string(
					(unsigned char *)pszWord_in, pPATR_io);
pLexItem->pFeature       = pFeature_in;

if (pszGloss_in != NULL)
	pLexItem->pszGloss = new_patr_lex_item_string(
					   (unsigned char *)pszGloss_in, pPATR_io);
else
	pLexItem->pszGloss = NULL;

#ifndef hab130
if (pszRootGloss_in != NULL)
	pLexItem->pszRootGloss = new_patr_lex_item_string(
				   (unsigned char *)pszRootGloss_in, pPATR_io);
else
	pLexItem->pszRootGloss = NULL;
#endif /* hab130 */

if (pszCategory_in != NULL)
	pLexItem->uiCategory = category_index( pszCategory_in, pPATR_io );
else
	pLexItem->uiCategory = 0;

if (pszFeatures_in != NULL)
	pLexItem->piFeatureIndexes = build_feat_index( pszFeatures_in, pPATR_io );
else
	pLexItem->piFeatureIndexes = NULL;

pPATR_m = pPATR_io;
if (	(pszGloss_in    == NULL) &&
#ifndef hab130
	(pszRootGloss_in == NULL) &&
#endif /* hab130 */
	(pszCategory_in == NULL) &&
	(pszFeatures_in == NULL) &&
	(pFeature_in    != NULL) )
	pPATR_io->pLexicon->pStorage = addDataToTrie(pPATR_io->pLexicon->pStorage,
						 pszWord_in, pLexItem,
						 add_patr_lex_item,
						 iPCPATRMaxTrieDepth_m);
else
	pPATR_io->pLexicon->pStorage = addDataToTrie(pPATR_io->pLexicon->pStorage,
						 pszWord_in, pLexItem,
						 add_ample_item,
						 iPCPATRMaxTrieDepth_m);
pPATR_m = NULL;
}

/*****************************************************************************
 * NAME
 *    showPATRLexicon
 * DESCRIPTION
 *    Print the lexicon to the screen as a debugging aid.
 * RETURN VALUE
 *    none
 */
void showPATRLexicon(pPATR_in)
PATRData *	pPATR_in;
{
if (	(pPATR_in != NULL) &&
	(pPATR_in->pLexicon != NULL) &&
	(pPATR_in->pLexicon->pStorage != NULL) )
	{
	pPATR_m = pPATR_in;
	writeTrieData(pPATR_in->pLexicon->pStorage, show_patr_lex_item, stdout);
	pPATR_m = NULL;
	fputc('\n', stdout);
	}
}

/*****************************************************************************
 * NAME
 *    add_feature_path
 * DESCRIPTION
 *    Build a feat descrip structure
 * RETURN VALUE
 *    pointer to new feat descrip
 */
static PATRFeatureDisjunction * add_feature_path(fpath, featd, pPATR_in)
char *			 fpath;	/* feature path to add */
PATRFeatureDisjunction * featd;	/* PATRFeatureDisjunction to add them to */
PATRData *		 pPATR_in;	/* pointer to PATRData structure */
{
PATRFeature *fnp;
PATRFeatureDisjunction *fdp, *unifdp;

fnp = parsePATRFeaturePath(fpath, pPATR_in->pGrammar, pPATR_in);
if (fnp == NULL)
	return(featd);
fdp = createPATRFeatureDisjunction( fnp, pPATR_in );
unifdp = unifyPATRDisjuncts(featd, fdp, pPATR_in);	/* Unify it in */
if (unifdp == NULL)
	{
	displayNumberedMessage(&sPATRIncompatibleFeaturesMsg_g,
			   pPATR_in->bSilent, pPATR_in->bShowWarnings,
			   pPATR_in->pLogFP,
			   NULL, 0,
			   fpath);
	return(featd);			/* Return, no use doing more */
	}
return(unifdp);
}

/*****************************************************************************
 * NAME
 *    convertSentenceToPATRWords
 * DESCRIPTION
 *
 * RETURN VALUE
 *    pointer to a linked list of PATRWord data structures
 */
PATRWord * convertSentenceToPATRWords(pszSentence_in, pOutputFP_in,
					  pfMorphParser_in, bWarnUnusedFd_in,
					  pPATR_in, piErrors)
char *		pszSentence_in;		/* string containing the sentence */
FILE *		pOutputFP_in;		/* output FILE pointer */
PATRLexItem *	(*pfMorphParser_in) P((char * pszWord_in));
int		bWarnUnusedFd_in;
PATRData *	pPATR_in;
int *		piErrors;
{
unsigned char *p;
char *cat;
PATRWord *sentm,		/* Main sentence, top of list */
	*sentp, *sentt;
PATRWordCategory *wordt;		/* Temp word for building */
PATRFeature *tfeat, *fnp;
PATRFeatureDisjunction *tfeatd;		/* Temp feat disjunct */
int wordnum, morphnum;		/* Word and Morph numbers for building */
PATRLexItem *lip;
unsigned i, j;
int k;
int errors;
StringList *headsp, *tailsp, *wordsp, *sp;
char *wordbuffer, *word;
size_t			length;
char *			pszCatFeatName;
char *			pszLexFeatName;
char *			pszGlossFeatName;
char *			pszCat;
char *			pszLex;
char *			pszGloss;
#ifndef hab130
char *			pszRootGlossFeatName;
char *			pszRootGloss;
#endif /* hab130 */
PATRDefinition *	pDef;

wordnum = 0;
morphnum = 0;
errors = 0;
headsp = tailsp = NULL;
length = strlen(pszSentence_in);
word = wordbuffer = allocMemory(length + 2);
for (	p = tokenizeString((unsigned char *)pszSentence_in, szWhitespace_m) ;
	p ;
	p = tokenizeString(NULL, szWhitespace_m) )
	{
	sp = (StringList *)allocMemory(sizeof(StringList));
	sp->pszString = (char *)p;
	sp->pNext = NULL;
	if (headsp == NULL)
	headsp = sp;
	else
	tailsp->pNext = sp;
	tailsp = sp;
	}
sentm = sentp = NULL;
word = wordbuffer;
if (pPATR_in->pGrammar != NULL)
	{
	pszCatFeatName   = pPATR_in->pGrammar->pszCatFeatName;
	pszLexFeatName   = pPATR_in->pGrammar->pszLexFeatName;
	pszGlossFeatName = pPATR_in->pGrammar->pszGlossFeatName;
#ifndef hab130
	pszRootGlossFeatName = pPATR_in->pGrammar->pszRootGlossFeatName;
#endif /* hab130 */
	}
else
	{
	pszCatFeatName   = storedPATRString( "cat", pPATR_in);
	pszLexFeatName   = storedPATRString( "lex", pPATR_in);
	pszGlossFeatName = storedPATRString( "gloss", pPATR_in);
#ifndef hab130
	pszRootGlossFeatName = storedPATRString( "rootgloss", pPATR_in);
#endif /* hab130 */
	}
for ( wordsp = headsp ; wordsp ; wordsp = wordsp->pNext )
	{
	lip = NULL;
	p = (unsigned char *)word;
	/*
	 *  look for words/phrases, longest phrase first
	 */
	for (   i = 0, sp = wordsp ;
		sp && i < pPATR_in->pLexicon->uiMaxLexicalPhraseSize ;
		sp = sp->pNext, ++i )
	;
	if (i <= 0)
	i = 1;
	for ( ; i > 0 ; --i )
	{
	word[0] = NUL;
	for (tailsp = sp = wordsp, j = i ; sp && (j > 0) ; --j, sp = sp->pNext)
		{
		/*
		 *  fill the buffer with a possible word/phrase
		 */
		strcat(word, sp->pszString);
		if (j > 1)
		strcat(word, " ");
		tailsp = sp;
		}
	for (	lip = (PATRLexItem *)findDataInTrie(
					  pPATR_in->pLexicon->pStorage, word) ;
		lip ;
		lip = lip->pNext )
		{
		if (strcmp(word, (char *)lip->pszLexString) == 0)
		break;
		}
	if (lip != NULL)
		{
		wordsp = tailsp;	/* point to last word in phrase */
		word += strlen(word) + 1;
		break;		/* we've found the word/phrase */
		}
	}
	if (lip == NULL)
	{
	/*
	 *  word is not in the lexicon
	 *  if we have a morphological parser enabled, try to parse the word
	 */
	if (pfMorphParser_in != NULL)
		lip = (*pfMorphParser_in)(word);
	}
	if (lip == NULL)
	{
	/*
	 *  we can't handle this word!
	 */
	if ((pOutputFP_in == stderr) || (pOutputFP_in == NULL))
		displayNumberedMessage(&sWordNotInLexicon_m,
				   pPATR_in->bSilent, pPATR_in->bShowWarnings,
				   pPATR_in->pLogFP,
				   NULL, 0,
				   word);
	if ((pOutputFP_in != stderr) && (pOutputFP_in != NULL))
		{
		fprintf(pOutputFP_in, "    ");
		fprintf(pOutputFP_in, sWordNotInLexicon_m.pszMessage, word);
		fprintf(pOutputFP_in, "\n");
		}
	++errors;
	}
	/*
	 *  make PATRWord node
	 */
	/* Allocate struct */
	sentt = (PATRWord *)allocMemory(sizeof(PATRWord));
	if ( !sentp )				/* If first (no prev) */
	sentm = sentt;				/* Set head to this */
	else
	sentp->pNext = sentt;			/* Else link from prev */
	sentp = sentt;				/* Set prev to this */
	sentt->pNext        = NULL;			/* Link stays null on last */
	sentt->iWordNumber  = wordnum++;		/* Put in next word number */
	sentt->pszWordName  = (lip) ? (char *)lip->pszLexString : (char *)p;
	sentt->pCategories = NULL;			/* No cats yet */
	while (lip != NULL)
	{
	/*
	 *  add this set of features for this word
	 */
	if (lip->pFeature == NULL)
		{
		/*
		 *  The "cat" feature is added later if needed.
		 *  The "lex" and "gloss" features are added here if they exist.
#ifndef hab130
			 *  Also add the "rootgloss" feature if it exists.
#endif
		 */
		cat    = pPATR_in->pLexicon->ppszCategories[lip->uiCategory - 1];
		wordt  = addPATRWordCategory(cat, sentt, pPATR_in);
		pszLex = storedPATRString( (char *)lip->pszLexString, pPATR_in);
		addPATRFeatureToComplex(wordt->pFeature,
					createPATRComplexFeature(pszLexFeatName,
						  createPATRAtomFeature(pszLex,
									 pPATR_in),
								 pPATR_in));
		if (lip->pszGloss != (unsigned char *)NULL)
		{
		pszGloss = storedPATRString( (char *)lip->pszGloss, pPATR_in);
		addPATRFeatureToComplex(wordt->pFeature,
					 createPATRComplexFeature(pszGlossFeatName,
						createPATRAtomFeature(pszGloss,
									 pPATR_in),
								  pPATR_in));
		}
#ifndef hab130
		if (lip->pszRootGloss != (unsigned char *)NULL)
		{
		pszRootGloss = storedPATRString( (char *)lip->pszRootGloss,
						 pPATR_in);
		addPATRFeatureToComplex(wordt->pFeature,
				 createPATRComplexFeature(pszRootGlossFeatName,
						createPATRAtomFeature(pszRootGloss,
								  pPATR_in),
							  pPATR_in));
		}
#endif /* hab130 */
		tfeatd = buildPATRFeatureDisjunction(cat,
						 NULL,
						 FALSE,
						 NULL,
						 pPATR_in);
		for (   i = 0 ;
			lip->piFeatureIndexes && lip->piFeatureIndexes[i] ;
			++i )
		{
		k = lip->piFeatureIndexes[i];
		if (k > 0)
			{
			tfeatd = buildPATRFeatureDisjunction(
			pPATR_in->pLexicon->ppszFeatures[k-1],
			tfeatd,
			bWarnUnusedFd_in,
			(pOutputFP_in == stderr) ? NULL : pOutputFP_in,
			pPATR_in );
			}
		else
			{
			k = -k;
			tfeatd = add_feature_path(
			pPATR_in->pLexicon->ppszFeaturePaths[k-1],
			tfeatd, pPATR_in);
			}
		}
		}
	else
		{
		fnp = findPATRAttribute(lip->pFeature, pszCatFeatName);
		cat = fnp->u.pszAtom;
		wordt = addPATRWordCategory(cat, sentt, pPATR_in);
		wordt->pFeature = copyPATRFeature(lip->pFeature, pPATR_in);
		tfeatd = buildPATRFeatureDisjunction(cat,
						 NULL,
						 FALSE, NULL,
						 pPATR_in);
		}
	/*
	 *  check for lexical rules
	 */
	for ( i = 0 ; lip->piFeatureIndexes && lip->piFeatureIndexes[i] ; ++i )
		{
		if (lip->piFeatureIndexes[i] < 0)
		continue;
		pDef = findPATRDefinition(pPATR_in->pLexicon->ppszFeatures[
		lip->piFeatureIndexes[i]-1],
					  pPATR_in->pGrammar);
		if ((pDef != NULL) && (pDef->eType == PATR_LEXICAL_RULE))
		{
		/*
		 *  for each feature in the disjunction, make a copy, apply
		 *  the lexical rule, and add the result to the disjunction
		 */
		PATRFeature *            pNewFeat;
		PATRFeatureDisjunction * pDisj;
		PATRFeatureDisjunction * pNewDisj;
		PATRFeatureDisjunction * pList = tfeatd;
		for ( pDisj = tfeatd ; pDisj ; pDisj = pDisj->pNext )
			{
			if (pPATR_in->iDebugLevel >= 5)
			{
			fprintf(stdout, "Applying Lexical Rule \"%s\"\n",
				pPATR_in->pLexicon->ppszFeatures[
					lip->piFeatureIndexes[i]-1]);
			}
			pNewFeat = applyPATRLexicalRule(pDef->u.pLexRule,
						   createPATRNullFeature(pPATR_in),
						   copyPATRFeature(pDisj->pFeature,
								   pPATR_in),
							pPATR_in);
			pNewDisj = createPATRFeatureDisjunction(pNewFeat,
								pPATR_in);
			pNewDisj->pNext = pList;
			pList = pNewDisj;
			}
		tfeatd = pList;
		}
		}
	/*
	 *  Add fd's to word
	 */
	addPATRFeatureToWord(tfeatd, wordt, pPATR_in);
	/*
	 *  find another identical word (if any)
	 */
	for ( lip = lip->pNext ; lip ; lip = lip->pNext )
		{
		if (strcmp((char *)p, (char *)lip->pszLexString) == 0)
		break;
		}
	}
	}
/*
 *  ensure that we have a category feature for every category
 */
for ( sentp = sentm ; sentp ; sentp = sentp->pNext )
	{
	for ( wordt = sentp->pCategories ; wordt ; wordt = wordt->pNext )
	{
	fnp = findPATRAttribute(wordt->pFeature, pszCatFeatName);
	if (fnp == NULL)
		{
		pszCat = storedPATRString(wordt->pszCategory, pPATR_in);
		tfeat  = allocPATRFeature(pPATR_in);
		if (pPATR_in->bPromoteDefAtoms)
		tfeat->eType = PATR_ATOM;	/* Make it atom */
		else
		tfeat->eType = PATR_DEFATOM;	/* Make it default atom */
		tfeat->u.pszAtom = pszCat;
		addPATRFeatureToComplex(wordt->pFeature,
					createPATRComplexFeature(pszCatFeatName,
								 tfeat,
								 pPATR_in));
		}
	}
	}

for ( sp = headsp ; sp ; sp = headsp )
	{
	headsp = sp->pNext;
	freeMemory(sp);
	}
if (wordbuffer != NULL)
	freeMemory(wordbuffer);

if (piErrors != NULL)
	*piErrors = errors;
return sentm;
}

/*****************************************************************************
 * NAME
 *    parseWithPATRLexicon
 * DESCRIPTION
 *    Parse a sentence, splitting it into words/phrases and looking them up in
 *    the lexicon.
 * RETURN VALUE
 *    number of valid parses
 */
int parseWithPATRLexicon(pszSentence_in, pOutputFP_in, pfMorphParser_in,
			 bWarnUnusedFd_in, pPATR_in)
char *		pszSentence_in;		/* string containing the sentence */
FILE *		pOutputFP_in;		/* output FILE pointer */
PATRLexItem *	(*pfMorphParser_in) P((char * pszWord_in));
int		bWarnUnusedFd_in;
PATRData *	pPATR_in;
{
PATRWord *	sentm;		/* Main sentence, top of list */
PATRWord *	sentp;
PATREdgeList *	parse;
int		errors;
int		num_parses;
PATREdgeList *	elp;
int		iStage = 0;
char *		pszMessage = NULL;

if (pPATR_in->pLogFP != NULL)
	fprintf(pPATR_in->pLogFP, "%s\n", pszSentence_in);
if (pPATR_in->pLexicon == NULL)
	{
	pPATR_in->pLexicon = (PATRLexicon *)allocMemory(sizeof(PATRLexicon));
	memset(pPATR_in->pLexicon, 0, sizeof(PATRLexicon));
	}
/*
 *  convert the flat sentence string into a linked list of words stored
 *  in PATRWord structures
 */
markPATRParseGarbage(pPATR_in);
sentm = convertSentenceToPATRWords(pszSentence_in, pOutputFP_in,
				   pfMorphParser_in, bWarnUnusedFd_in,
				   pPATR_in, &errors);
/*
 *  if no errors looking up words, try to parse the sentence
 */
num_parses = 0;
if (!errors && (sentm != NULL))
	{
	if (pPATR_in->iDebugLevel >= 2)
	{
	PATRWord * pWord;
	PATRWordCategory * pCat;
	fprintf(stdout, "SENTENCE READY TO PARSE:\n");
	for ( pWord = sentm ; pWord ; pWord = pWord->pNext )
		{
		fprintf(stdout, "Word = \"%s\"\n", pWord->pszWordName);
		for ( pCat = pWord->pCategories ; pCat ; pCat = pCat->pNext )
		{
		fprintf(stdout, "    cat = \"%s\", feature = ",
			pCat->pszCategory);
		writePATRFeature(pCat->pFeature, stdout,
					(int)strlen(pCat->pszCategory) + 26, pPATR_in);
		fprintf(stdout, "\n");
		}
		fprintf(stdout, "\n");
		}
	}
	parse = parseWithPATR(sentm, &iStage, pPATR_in);
	if (iStage != 0)
	{
	if (pOutputFP_in != NULL)
#ifndef hab1211
		fprintf(pOutputFP_in, "**** Not able to parse this sentence ****\n");
#else
		fprintf(pOutputFP_in, "**** Cannot parse this sentence ****\n");
#endif /* hab1211 */
	if (pPATR_in->pLogFP != NULL)
#ifndef hab1211
		fprintf(pPATR_in->pLogFP,"**** Not able to parse this sentence ****\n");
#else
		fprintf(pPATR_in->pLogFP,"**** Cannot parse this sentence ****\n");
#endif /* hab1211 */
	}
	switch (iStage)
	{
	case 0:
		for ( elp = parse ; elp ; elp = elp->pNext )
		++num_parses;
		break;
	case 1:
		pszMessage = "**** Turning off unification ****\n";
		break;
	case 2:
		pszMessage = "**** Turning off top-down filtering ****\n";
		break;
	case 3:
		pszMessage = "**** Building the largest parse \"bush\" ****\n";
		break;
	case 4:
		pszMessage = "**** No output available ****\n";
		break;
	case 5:
		pszMessage = "**** Out of Memory (after %lu edges) ****\n";
		break;
	case 6:
		pszMessage = "**** Out of Time (after %lu edges) ****\n";
		break;
	}
	if (pszMessage != NULL)
	{
	if (pOutputFP_in != NULL)
		fprintf(pOutputFP_in, pszMessage, pPATR_in->uiEdgesAdded);
	if (pPATR_in->pLogFP != NULL)
		fprintf(pPATR_in->pLogFP, pszMessage, pPATR_in->uiEdgesAdded);
	}

	if (parse != NULL)
	{
	if (pOutputFP_in != NULL)
		{
		writePATRParses(parse, pOutputFP_in, NULL, NULL, 0, pPATR_in);
		putc('\n', pOutputFP_in);
		}
	if (pPATR_in->pLogFP != NULL)
		{
		writePATRParses(parse, pPATR_in->pLogFP, NULL, NULL, 0,  pPATR_in);
		putc('\n', pPATR_in->pLogFP);
		}
	}
	}
/*
 *  erase the temporarily allocated linked list of PATRWords
 */
collectPATRParseGarbage(pPATR_in);
while ((sentp = sentm) != NULL)
	{
	sentm = sentp->pNext;
	freeMemory( sentp );
	}
return(num_parses);
}

/*****************************************************************************
 * NAME
 *    write_path
 * DESCRIPTION
 *    Write the COMPLEX feature structure to the file as a set of "paths",
 *    ignoring the "cat", "gloss", and "lex" features.
#ifndef hab130
 *    Also ignore the "rootgloss" feature.
#endif
 * RETURN VALUE
 *    the number of features actually written to the file
 */
static int write_path(outfp, featp, headsp, indent, pPATR_in)
FILE *		outfp;		/* output FILE pointer */
PATRFeature *	featp;		/* pointer to PATRFeature node */
StringList *	headsp;		/* pointer to list of path labels */
int		indent;		/* number of chars already on line */
PATRData *      pPATR_in;
{
PATRComplexFeature *flp;
StringList path_node, *sp, *tailsp;
size_t len;
int count_written = 0;
char *	pszCatFeatName;
char *	pszLexFeatName;
char *	pszGlossFeatName;
#ifndef hab130
char *	pszRootGlossFeatName;
#endif /* hab130 */

if ((outfp == NULL) || (featp == NULL) || (headsp == NULL))
	return( 0 );
featp = followPATRForwardPointers(featp);
if (pPATR_m->pGrammar != NULL)
	{
	pszCatFeatName   = pPATR_m->pGrammar->pszCatFeatName;
	pszLexFeatName   = pPATR_m->pGrammar->pszLexFeatName;
	pszGlossFeatName = pPATR_m->pGrammar->pszGlossFeatName;
#ifndef hab130
	pszRootGlossFeatName = pPATR_m->pGrammar->pszRootGlossFeatName;
#endif /* hab130 */
	}
else
	{
	pszCatFeatName   = storedPATRString( "cat", pPATR_in);
	pszLexFeatName   = storedPATRString( "lex", pPATR_in);
	pszGlossFeatName = storedPATRString( "gloss", pPATR_in);
#ifndef hab130
	pszRootGlossFeatName = storedPATRString( "rootgloss", pPATR_in);
#endif /* hab130 */
	}
switch (featp->eType)
	{
	case PATR_ATOM:
	case PATR_FAILFS:
	case PATR_DEFATOM:
	if (headsp->pNext == NULL)
		{
		if (    (strcmp(headsp->pszString, pszLexFeatName)   == 0) ||
			(strcmp(headsp->pszString, pszCatFeatName)   == 0) ||
#ifndef hab130
			(strcmp(headsp->pszString, pszRootGlossFeatName) == 0) ||
#endif /* hab130 */
			(strcmp(headsp->pszString, pszGlossFeatName) == 0) )
		return( 0 );
		}
	len = strlen(pPATR_m->pszFeatureMarker) + 1;
	while ((unsigned int)indent++ < len)
		putc(' ', outfp);
	putc('<', outfp);
	for ( sp = headsp ; sp ; sp = sp->pNext)
		{
		if (sp != headsp)
		putc(' ', outfp);
		fputs(sp->pszString, outfp);
		}
	fprintf(outfp, "> = %s\n", featp->u.pszAtom);
	count_written = 1;
	break;

	case PATR_COMPLEX:
	for ( tailsp = headsp ; tailsp->pNext ; tailsp = tailsp->pNext )
		;
	for ( flp = featp->u.pComplex ; flp ; flp = flp->pNext )
		{
		path_node.pszString = flp->pszLabel;
		path_node.pNext     = NULL;
		tailsp->pNext  = &path_node;
		count_written += write_path(outfp, flp->pValue, headsp, indent,
					pPATR_in);
		}
	break;
	default:
	break;
	}
return( count_written );
}

/*****************************************************************************
 * NAME
 *    write_feature_paths
 * DESCRIPTION
 *    Write the COMPLEX feature structure to the file as a set of "paths",
 *    ignoring the "cat", "gloss", and "lex" features.
#ifndef hab130
 *    Also ignore the "rootgloss" feature.
#endif
 * RETURN VALUE
 *    none
 */
static void write_feature_paths(outfp, featp, indent, pPATR_in)
FILE *		outfp;		/* output FILE pointer */
PATRFeature *	featp;		/* pointer to PATRFeature node */
int		indent;		/* number of chars already on line */
PATRData *      pPATR_in;
{
PATRComplexFeature *flp;
StringList head;
int count_written = 0;

for ( flp = featp->u.pComplex ; flp ; flp = flp->pNext )
	{
	head.pszString = flp->pszLabel;
	head.pNext     = NULL;
	count_written += write_path(outfp, flp->pValue, &head, indent, pPATR_in);
	indent = 0;
	}
if (count_written == 0)
	putc('\n', outfp);
}

/*****************************************************************************
 * NAME
 *    write_patr_lex_item
 * DESCRIPTION
 *    Write the lexicon entries to the output file
 * RETURN VALUE
 *    none
 */
static FILE * pLexOutputFP_m = NULL;
static void write_patr_lex_item(list)
VOIDP	list;		/* pointer to list of patr_lex_item structures */
{
PATRLexItem *lip;
size_t len;
PATRFeature *fnp;
int i, j;
unsigned int k;
char *	pszCatFeatName;
char *	pszGlossFeatName;
#ifndef hab130
char *	pszRootGlossFeatName;
#endif /* hab130 */

if (pLexOutputFP_m == NULL)
	return;

if (pPATR_m->pGrammar != NULL)
	{
	pszCatFeatName   = pPATR_m->pGrammar->pszCatFeatName;
	pszGlossFeatName = pPATR_m->pGrammar->pszGlossFeatName;
#ifndef hab130
	pszRootGlossFeatName = pPATR_m->pGrammar->pszRootGlossFeatName;
#endif /* hab130 */
	}
else
	{
	pszCatFeatName   = storedPATRString( "cat", pPATR_m);
	pszGlossFeatName = storedPATRString( "gloss", pPATR_m);
#ifndef hab130
	pszRootGlossFeatName = storedPATRString( "rootgloss", pPATR_m);
#endif /* hab130 */
	}
for ( lip = (PATRLexItem *)list ; lip ; lip = lip->pNext )
	{
	fprintf(pLexOutputFP_m, "%s %s\n",
		pPATR_m->pszWordMarker,
		lip->pszLexString ? lip->pszLexString : (unsigned char *)"");
	fprintf(pLexOutputFP_m, "%s ", pPATR_m->pszCategoryMarker);
	if (lip->uiCategory)
	fputs(pPATR_m->pLexicon->ppszCategories[lip->uiCategory - 1],
		  pLexOutputFP_m);
	else if (lip->pFeature &&
		 ((fnp = findPATRAttribute(lip->pFeature,
					   pszCatFeatName)) != NULL))
	{
	if ((fnp->eType == PATR_ATOM) || (fnp->eType == PATR_DEFATOM))
		fputs(fnp->u.pszAtom, pLexOutputFP_m);
	}
	putc('\n', pLexOutputFP_m);
	if (lip->pszGloss)
	{
	if (strcmp((char *)lip->pszLexString, (char *)lip->pszGloss) == 0)
		fprintf(pLexOutputFP_m, "%s\n",
			pPATR_m->pszGlossMarker);
	else
		fprintf(pLexOutputFP_m, "%s %s\n",
			pPATR_m->pszGlossMarker, lip->pszGloss);
	}
	else if (lip->pFeature &&
		 ((fnp = findPATRAttribute(lip->pFeature,
					   pszGlossFeatName)) != NULL))
	{
	if ((fnp->eType == PATR_ATOM) || (fnp->eType == PATR_DEFATOM))
		{
		if (strcmp((char *)lip->pszLexString, fnp->u.pszAtom) == 0)
		fprintf(pLexOutputFP_m, "%s\n",
			pPATR_m->pszGlossMarker);
		else
		fprintf(pLexOutputFP_m, "%s %s\n",
			pPATR_m->pszGlossMarker,
			fnp->u.pszAtom);
		}
	}
#ifndef hab130
	if (lip->pszRootGloss)
	{
	fprintf(pLexOutputFP_m, "%s %s\n",
		pPATR_m->pszRootGlossMarker, lip->pszRootGloss);
	}
	else if (lip->pFeature &&
		 ((fnp = findPATRAttribute(lip->pFeature,
					   pszRootGlossFeatName)) != NULL))
	{
	if ((fnp->eType == PATR_ATOM) || (fnp->eType == PATR_DEFATOM))
		{
		fprintf(pLexOutputFP_m, "%s %s\n",
			pPATR_m->pszRootGlossMarker,
			fnp->u.pszAtom);
		}
	}
#endif /* hab130 */
	fprintf(pLexOutputFP_m, "%s", pPATR_m->pszFeatureMarker);
	len = strlen(pPATR_m->pszFeatureMarker);
	for ( i = 0 ; lip->piFeatureIndexes && lip->piFeatureIndexes[i] ; ++i )
	{
	j = lip->piFeatureIndexes[i];
	if (j > 0)
		{
		if ((i != 0) && (lip->piFeatureIndexes[i-1] < 0))
		{
		putc('\n', pLexOutputFP_m);
		for ( k = 0 ; (unsigned int)k < len ; ++k)
			putc(' ', pLexOutputFP_m);
		}
		fprintf(pLexOutputFP_m, " %s",
			pPATR_m->pLexicon->ppszFeatures[j - 1]);
		}
	else
		{
		j = -j;
		if (i != 0)
		{
		putc('\n', pLexOutputFP_m);
		for ( k = 0 ; k < len ; ++k)
			putc(' ', pLexOutputFP_m);
		}
		fprintf(pLexOutputFP_m, " %s",
			pPATR_m->pLexicon->ppszFeaturePaths[j - 1]);
		}
	}
	if (    (lip->piFeatureIndexes != NULL) &&
		(lip->piFeatureIndexes[0] != 0) )
	{
	putc('\n', pLexOutputFP_m);
	len = 0;
	}
	if (lip->pFeature != NULL)
	{
	fnp = followPATRForwardPointers(lip->pFeature);
	if (fnp->eType == PATR_COMPLEX)
		write_feature_paths(pLexOutputFP_m, fnp, (int)len, pPATR_m);
	else
		{
		PATRGrammar * pGram = pPATR_m->pGrammar;
		putc(' ', pLexOutputFP_m);
		++len;
		pPATR_m->pGrammar = NULL;
		writePATRFeature(fnp, pLexOutputFP_m, (int)len, pPATR_m);
		pPATR_m->pGrammar = pGram;
		putc('\n', pLexOutputFP_m);
		}
	}
	if (   (	(lip->piFeatureIndexes    == NULL) ||
		(lip->piFeatureIndexes[0] == 0)     ) &&
		(lip->pFeature == NULL) )
	putc('\n', pLexOutputFP_m);
	putc('\n', pLexOutputFP_m);
	}
}

/*****************************************************************************
 * NAME
 *    writePATRLexicon
 * DESCRIPTION
 *    write the stored PATR lexicon to an open output file
 * RETURN VALUE
 *    none
 */
void writePATRLexicon(pOutputFP_in, pPATR_in)
FILE *		pOutputFP_in;
PATRData *	pPATR_in;
{
if ((pPATR_in == NULL) || (pOutputFP_in == NULL))
	return;
if ((pPATR_in->pLexicon == NULL) || (pPATR_in->pLexicon->pStorage == NULL))
	return;
pPATR_m        = pPATR_in;
pLexOutputFP_m = pOutputFP_in;
walkTrie(pPATR_in->pLexicon->pStorage, write_patr_lex_item);
pLexOutputFP_m = NULL;
pPATR_m        = NULL;
}
