/*  LEXICON.C - functions to load or free lexicons for PC-KIMMO
 ***************************************************************************
 *
 * int loadKimmoLexicon(unsigned char *lexiconfile, int eLexiconType_in,
 *			KimmoData *lang)
 * void freeKimmoLexicon(KimmoData *lang)
 * KimmoLexicon *findKimmoLexiconSection(unsigned char *name, KimmoData *lang)
 * void writeKimmoLexiconSectionNames(FILE *      pOutputFP_in,
 *				      KimmoData * pKimmo_in)
 *
 ***************************************************************************
 * Copyright 1989, 1999 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern char * strcpy  P((char * dest, const char * src));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strchr  P((const char * s, int c));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "opaclib.h"
#include "kimmo.h"
#include "kimmodef.h"

#ifdef MACINTOSH_NEEDS
extern long next_user_event_ticks;
extern void allow_user_events();
#endif
#ifdef applec
#pragma segment S_lexicon
#endif

#define INITIAL_LEX	 "INITIAL"	/* name of the initial lexicon */
#define MAXLEV		 10000		/* maximum depth of trie (infinite) */
#define GOOD_CODE_VALUES "ULAGF"	/* valid fieldcode mapping values */
/*
 *  macro to test a string for being a valid keyword in a lexicon file
 */
#define is_keyword(token) \
( (strcmp(token,"ALTERNATION")==0) || (strcmp(token,"FIELDCODE")==0) ||\
  (strcmp(token,"INCLUDE")==0) || (strcmp(token,"END")==0) ||\
  (strcmp(token,"FEATURES")==0) )

/*****************************************************************************
 *  local global (module) variables
 */
static char *		pszFilename_m     = NULL;
static int		bSilentMessages_m = FALSE;
static int		bShowWarnings_m   = TRUE;
static FILE *		pLogFP_m          = NULL;
static unsigned		uiRecordCount_m   = 0;
/*
 *  same chars as isspace()
 */
static unsigned char	szWhitespace_m[7] = " \t\n\v\f\r";
/*
 * structure for storing fieldcode combinations
 */
typedef struct {
	char *		usercode;
	unsigned char	internal;
	} LexFieldCode;

static CodeTable *	pCodeTable_m;
static LexFieldCode *	paFieldCodes_m;
static unsigned		uiFieldCodeCount_m;
static unsigned		uiFieldCodesAllocated_m;
/*
 *  numbers of entries currently allocated for dynamically sized arrays
 */
static unsigned		uiFeaturesAllocated_m;	/* size for lang->features */
static unsigned		uiAlternationsAllocated_m; /* size for lang->alterns */
/*
 *  error messages
 */
static NumberedMessage sBadLexiconFile_m		= { ERROR_MSG,   300,
	"Lexicon file could not be opened: %s" };
static NumberedMessage sEmptyLexiconFile_m		= { ERROR_MSG,   301,
	"No data in lexicon file %s" };
static NumberedMessage sMissingAlternName_m		= { ERROR_MSG,   302,
	"Missing alternation name" };
static NumberedMessage sEmptyAltern_m		= { WARNING_MSG, 303,
	"Empty alternation definition: %s" };
static NumberedMessage sAlternExists_m		= { WARNING_MSG, 304,
	"Adding to existing alternation %s" };
static NumberedMessage sNoLexiconSections_m		= { ERROR_MSG,   305,
	"No lexicon sections in lexicon file %s" };
static NumberedMessage sMissingLexiconName_m		= { ERROR_MSG,   306,
	"Missing lexicon name" };
/*static NumberedMessage sUnusedLexiconSection_m	= { ERROR_MSG,   307,*/
/*   "Lexicon section %s is not listed as a member of any alternations"};*/
static NumberedMessage sNoContinuationClass_m	= { ERROR_MSG,   308,
	"Expected continuation class or BOUNDARY symbol for %s" };
static NumberedMessage sBadContinuationClass_m	= { WARNING_MSG, 309,
	"Invalid continuation class %s for %s" };
static NumberedMessage sMissingGlossElement_m	= { WARNING_MSG, 310,
	"Expected gloss element for %s" };
/*static NumberedMessage sBadGlossElement_m		= { ERROR_MSG,   311,*/
/*    "Invalid gloss element %s for %s" };*/
static NumberedMessage sBadCharInForm_m		= { WARNING_MSG, 312,
	"Form contains character not in alphabet: %s (%s)" };
static NumberedMessage sMissingINITIALlexicon_m	= { ERROR_MSG,   313,
	"INITIAL lexicon not found" };
static NumberedMessage sMissingINCLUDEfile_m		= { ERROR_MSG,   314,
	"Missing INCLUDE filename" };
static NumberedMessage sBadINCLUDEfile_m		= { ERROR_MSG,   315,
	"Lexicon INCLUDE file could not be opened: %s" };
static NumberedMessage sBadLexKeyword_m		= { ERROR_MSG,   316,
	"Invalid lexicon file keyword: %s" };
static NumberedMessage sUnexpectedEndOfLexicon_m	= { ERROR_MSG,   317,
	"Unexpected end of lexicon file" };
static NumberedMessage sInvalidFIELDCODEargument_m	= { ERROR_MSG,   318,
	"Second argument in FIELDCODE line is not valid" };
static NumberedMessage sDuplicate1stArg_m		= { ERROR_MSG,   319,
	"First argument name already used" };
static NumberedMessage sDuplicate2ndArg_m		= { ERROR_MSG,   320,
	"Cannot use second argument category twice" };
/*static NumberedMessage sNoFieldcodeValues_m	= { ERROR_MSG,   321,*/
/*    "No fieldcode values are found" };*/
/*static NumberedMessage sInvalidLexiconInput_m	= { ERROR_MSG,   322,*/
/*    "Invalid lexicon file input" };*/
static NumberedMessage sDoubleGloss_m		= { WARNING_MSG, 323,
	"Ignore FIELDCODE /%s %s : no double gloss definition" };
static NumberedMessage sMissingLexicalItem_m		= { WARNING_MSG, 324,
	"Expected lexical item" };
static NumberedMessage sNoFeatures_m			= { WARNING_MSG, 325,
	"No features" };
static NumberedMessage sFeatureAlready_m		= { WARNING_MSG, 326,
	"Feature name %s already defined" };
static NumberedMessage sFeatureNotFound_m		= { WARNING_MSG, 327,
	"Feature name %s not found" };
static NumberedMessage sLexAlreadyAltern_m		= { WARNING_MSG, 328,
	"Lexicon %s already used in alternation %s" };

struct lex_item_array
	{
	KimmoLexItem *array;
	struct lex_item_array *link;
	};
struct char_buffer
	{
	unsigned char *buffer;
	struct char_buffer *link;
	};
struct short_buffer
	{
	unsigned short *buffer;
	struct short_buffer *link;
	};

static struct lex_item_array *head_lex_item = NULL, *tail_lex_item = NULL;
size_t uiKimmoLexItemArraySize_g = 1000;	/* 0 or 1000 */
static size_t num_lex_item_available = 0;

static struct char_buffer *head_char_buffer = NULL, *tail_char_buffer = NULL;
size_t uiKimmoCharArraySize_g = 8000;		/* 0 or 8000 */
static size_t num_chars_available = 0;

static struct short_buffer *	head_short_buffer = NULL;
static struct short_buffer *	tail_short_buffer = NULL;
size_t uiKimmoShortArraySize_g = 2000;		/* 0 or 2000 */
static size_t num_shorts_available = 0;

/*****************************************************************************
 *  local function prototypes
 */
void free_code_table P((CodeTable *tab));
static VOIDP add_lex_item P((VOIDP vitem, VOIDP list));
static KimmoAlternation *find_alternation P((unsigned char *name,
						 KimmoData *lang));
static int find_feature P((unsigned char *name, KimmoData *lang));
static KimmoLexicon *new_lexicon P((unsigned char *name, KimmoData *lang,
				   unsigned *puiSizeLexSections));
static unsigned char *get_token P(( FILE *fp, unsigned *linep,
					int cComment_in));
static int add_alternation P((FILE *infp, unsigned *linep,
				  unsigned char **tokp,
				  KimmoData *pLang_in, KimmoData *pSynLang_in,
				  unsigned *puiSizeLexSections,
				  unsigned *puiSynSizeLexSections));
static int set_fieldcode P((FILE *infp, unsigned *linep,
				unsigned char **tokp,
				int cComment_in));
static int addFeatures P((FILE *infp, unsigned *linep, unsigned char **tokp,
			   KimmoData *pLang_in, KimmoData *pSynLang_in));
static void erase_lex_item P((VOIDP listp));

unsigned char *new_lex_item_string P((unsigned char *string));
void free_lex_item_string P((unsigned char *string));
unsigned short * new_lex_item_indexes P((unsigned short * feat_index));
void free_lex_item_indexes P((unsigned short *feat_index));
KimmoLexItem *new_lex_item P((void));
void free_lex_items P((void));
static void show_lex_items P((VOIDP vlip,int indent, FILE *outfp));

/************************************************************************
 * NAME
 *    new_lex_item_string
 * ARGUMENTS
 *    string - character string to copy
 * DESCRIPTION
 *    make a copy of the string
 *    we allocate space uiKimmoCharArraySize_g bytes at a time for efficiency
 * RETURN VALUE
 *    pointer to the new copy
 */
unsigned char *new_lex_item_string(string)
unsigned char *string;
{
size_t length;
unsigned char *newstring;
struct char_buffer *cbp;

if (string == (unsigned char *)NULL)
	return( (unsigned char *)NULL );
if (uiKimmoCharArraySize_g > 1)
	{
	length = strlen((char *)string) + 1;
	if (num_chars_available < length)
	{
	cbp = (struct char_buffer *)allocMemory(sizeof(struct char_buffer));
	cbp->buffer = (unsigned char *)allocMemory(
				   uiKimmoCharArraySize_g * sizeof(unsigned char));
	cbp->link = NULL;
	num_chars_available = uiKimmoCharArraySize_g;
	if (head_char_buffer == NULL)
		head_char_buffer = cbp;
	else
		tail_char_buffer->link = cbp;
	tail_char_buffer = cbp;
	}
	num_chars_available -= length;
	newstring = &(tail_char_buffer->buffer[num_chars_available]);
	strcpy((char *)newstring, (char *)string);
	return( newstring );
	}
else
	return( (unsigned char *)duplicateString((char *)string) );
}

/************************************************************************
 * NAME
 *    free_lex_item_string
 * ARGUMENTS
 *    string - character string to free
 * DESCRIPTION
 *    free the string allocated for a lex_item struct
 * RETURN VALUE
 *    none
 */
void free_lex_item_string(string)
unsigned char *string;
{
struct char_buffer *cbp;

if (uiKimmoCharArraySize_g > 1)
	{
	while (head_char_buffer != NULL)
	{
	cbp = head_char_buffer->link;
	freeMemory( head_char_buffer->buffer );
	freeMemory( head_char_buffer );
	head_char_buffer = cbp;
	}
	tail_char_buffer = NULL;
	num_chars_available = 0;
	}
else
	freeMemory(string);
}

/************************************************************************
 * NAME
 *    new_lex_item_indexes
 * ARGUMENTS
 *    feat_index - feature indexes to copy
 * DESCRIPTION
 *    make a copy of the indexes
 *    we allocate space uiKimmoShortArraySize_g short ints at a time for
 *    efficiency
 * RETURN VALUE
 *    pointer to the new copy
 */
unsigned short * new_lex_item_indexes(feat_index)
unsigned short *	feat_index;
{
size_t			length;
unsigned short *	newfeat_index;
int			i;
struct short_buffer *	ibp;

for ( length = 0 ; feat_index && feat_index[length] != 0 ; ++length )
	;
++length;
if (uiKimmoShortArraySize_g > 1)
	{
	if (num_shorts_available < length)
	{
	ibp = (struct short_buffer *)allocMemory(sizeof(struct short_buffer));
	ibp->buffer = (unsigned short *)allocMemory(
				 uiKimmoShortArraySize_g * sizeof(unsigned short));
	ibp->link = NULL;
	num_shorts_available = uiKimmoShortArraySize_g;
	if (head_short_buffer == NULL)
		head_short_buffer = ibp;
	else
		tail_short_buffer->link = ibp;
	tail_short_buffer = ibp;
	}
	num_shorts_available -= length;
	newfeat_index = &(tail_short_buffer->buffer[num_shorts_available]);
	}
else
	newfeat_index = (unsigned short *)allocMemory(
						  length * sizeof(unsigned short));
for ( i = 0 ; feat_index && feat_index[i] ; ++i )
	newfeat_index[i] = feat_index[i];
newfeat_index[i] = 0;
return( newfeat_index );
}

/************************************************************************
 * NAME
 *    free_lex_item_indexes
 * ARGUMENTS
 *    indexes - feature indexes to free
 * DESCRIPTION
 *    free the indexes allocated for a lex_item struct
 * RETURN VALUE
 *    none
 */
void free_lex_item_indexes(feat_index)
unsigned short *	feat_index;
{
struct short_buffer *ibp;

if (uiKimmoShortArraySize_g > 1)
	{
	while (head_short_buffer != NULL)
	{
	ibp = head_short_buffer->link;
	freeMemory( head_short_buffer->buffer );
	freeMemory( head_short_buffer );
	head_short_buffer = ibp;
	}
	tail_short_buffer = NULL;
	num_shorts_available = 0;
	}
else
	freeMemory(feat_index);
}

/************************************************************************
 * NAME
 *    new_lex_item
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    allocate a new lex_item struct from the heap
 *    we allocate uiKimmoLexItemArraySize_g nodes at a time for efficiency
 * RETURN VALUE
 *    pointer to the new lex_item struct
 */
KimmoLexItem *new_lex_item()
{
struct lex_item_array *liap;

if (uiKimmoLexItemArraySize_g > 1)
	{
	if (num_lex_item_available == 0)
	{
	liap = (struct lex_item_array *)allocMemory(
						sizeof(struct lex_item_array));
	liap->array = (KimmoLexItem *)allocMemory(
				 uiKimmoLexItemArraySize_g * sizeof(KimmoLexItem));
	liap->link = NULL;
	num_lex_item_available = uiKimmoLexItemArraySize_g;
	if (head_lex_item == NULL)
		head_lex_item = liap;
	else
		tail_lex_item->link = liap;
	tail_lex_item = liap;
	}
	--num_lex_item_available;
	return( &(tail_lex_item->array[num_lex_item_available]) );
	}
else
	return( (KimmoLexItem *)allocMemory(sizeof(KimmoLexItem)) );
}

/************************************************************************
 * NAME
 *    free_lex_items
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    free the arrays of lex_item structs previously allocated
 * RETURN VALUE
 *    none
 */
void free_lex_items()
{
struct lex_item_array *liap;
KimmoLexItem *lip;
unsigned i;

while (head_lex_item != NULL)
	{
	for ( i = 0 ; i < uiKimmoLexItemArraySize_g ; ++i )
	{
	lip = &(head_lex_item->array[i]);
	if (lip->pszLexString)
		free_lex_item_string(lip->pszLexString);
	if (lip->pszGloss)
		free_lex_item_string(lip->pszGloss);
	if (lip->puiFeatureIndexes)
		free_lex_item_indexes(lip->puiFeatureIndexes);
	}
	liap = head_lex_item->link;
	freeMemory( head_lex_item->array );
	freeMemory( head_lex_item );
	head_lex_item = liap;
	}
tail_lex_item = NULL;
num_lex_item_available = 0;
}

/****************************************************************************
 * NAME
 *    findKimmoLexiconSection
 * ARGUMENTS
 *    name - pointer to name of a section of the lexicon
 *    lang - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Search the array of lexicon section names for a matching name.
 * RETURN VALUE
 *    pointer to appropriate sublexicon, or NULL if not found
 */
KimmoLexicon *findKimmoLexiconSection(name,lang)
unsigned char *name;
KimmoData *lang;
{
KimmoLexicon *lxp;
register unsigned i;

for (	lxp = lang->pLexiconSections, i = 0 ;
	i < lang->uiLexiconSectionCount ;
	++i, ++lxp )
	{
	if (strcmp((char *)lxp->pszName, (char *)name) == 0)
	return( lxp );		/* found it! */
	}
return( (KimmoLexicon *)NULL );	/* not found */
}

/****************************************************************************
 * NAME
 *    erase_lex_item
 * ARGUMENTS
 *    lexlistp - pointer to a linked list of lex_item nodes
 * DESCRIPTION
 *    Free the memory used by a linked list of lex_item nodes.
 * RETURN VALUE
 *    none
 */
static void erase_lex_item(listp)
VOIDP listp;
{
KimmoLexItem *lexlistp;
register KimmoLexItem *lp;

if (uiKimmoLexItemArraySize_g > 1)
	{
	free_lex_items();
	return;
	}
lexlistp = listp;
while ((lp = lexlistp) != (KimmoLexItem *)NULL)
	{
	lexlistp = lp->pNext;
	if (lp->pszLexString)
	free_lex_item_string(lp->pszLexString);
	if (lp->pszGloss)
	free_lex_item_string(lp->pszGloss);
	if (lp->puiFeatureIndexes)
	free_lex_item_indexes(lp->puiFeatureIndexes);
	freeMemory(lp);
	}
}

/****************************************************************************
 * NAME
 *    freeKimmoLexicon
 * ARGUMENTS
 *    lang - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Free the Lexicon related information for the language.
 * RETURN VALUE
 *    none
 */
void freeKimmoLexicon(lang)
KimmoData *lang;
{
unsigned i;
register KimmoAlternation *ap;
register KimmoLexicon *lxp;
/*
 *  free the array of KimmoAlternations
 */
if (lang->pAlternations)
	{
	for (   ap = lang->pAlternations, i = 0 ;
		i < lang->uiAlternationCount ;
		++i, ++ap )
	{
	if (ap->pszName)
		freeMemory(ap->pszName);
	if (ap->piLexicons)
		freeMemory(ap->piLexicons);
	}
	freeMemory(lang->pAlternations);
	}
lang->pAlternations      = (KimmoAlternation *)NULL;
lang->uiAlternationCount = 0;
/*
 *  free the array of KimmoLexicons
 */
if (lang->pLexiconSections)
	{
	for (   lxp = lang->pLexiconSections, i = 0 ;
		i < lang->uiLexiconSectionCount ;
		++i, ++lxp)
	{
	if (lxp->pszName)
		freeMemory(lxp->pszName);
	if (lxp->pStorage != (Trie *)NULL)
		eraseTrie(lxp->pStorage, erase_lex_item);
	}
	freeMemory(lang->pLexiconSections);
	}
lang->pLexiconSections      = (KimmoLexicon *)NULL;
lang->pInitialLexicon       = (KimmoLexicon *)NULL;
lang->uiLexiconSectionCount = 0;
/*
 *  erase any existing feature names
 */
if (lang->ppszFeatures)
	{
	for (i = 0; i < lang->uiFeatureCount; ++i )
		freeMemory(lang->ppszFeatures[i]);
	freeMemory((char *)lang->ppszFeatures);
	lang->ppszFeatures   = NULL;
	lang->uiFeatureCount = 0;
	uiFeaturesAllocated_m = 0;
	}
freeMemory(lang->pszLexiconFile);
lang->pszLexiconFile = (char *)NULL;
}

/****************************************************************************
 * NAME
 *    free_code_table
 * ARGUMENTS
 *    tab - pointer to a code_table structure
 * DESCRIPTION
 *    Free the memory allocated to store the code_table structure.
 * RETURN VALUE
 *    none
 */
void free_code_table (tab )
CodeTable *tab;
{
freeMemory(tab->pCodeTable);
freeMemory(tab->pszFirstCode);
freeMemory(tab);
}


/****************************************************************************
 * NAME
 *    add_lex_item
 * ARGUMENTS
 *    item - current lex_item node to add the list
 *    list - list of lex_item nodes
 * DESCRIPTION
 *    Add a node to the end of a linked list of lex_item nodes.
 * RETURN VALUE
 *    none
 */
static VOIDP add_lex_item(vitem,vlist)
VOIDP vitem;
VOIDP vlist;
{
KimmoLexItem *item;
KimmoLexItem *list;
register KimmoLexItem *lp;

item = (KimmoLexItem *)vitem;
list = (KimmoLexItem *)vlist;
item->pNext = (KimmoLexItem *)NULL;
/*
 *  if empty list, just return the item
 */
if (list == (KimmoLexItem *)NULL)
	return((VOIDP)item);
/*
 *  add the item to the end of the list, then return the head of the list
 */
for ( lp = list ; lp->pNext ; lp = lp->pNext )
	;
lp->pNext = item;
return((VOIDP)list);
}

/****************************************************************************
 * NAME
 *    find_alternation
 * ARGUMENTS
 *    name - pointer to name of an alternation class
 *    lang - pointer to KimmoData data structure
 * DESCRIPTION
 *    Search the array of KimmoAlternations for a matching name.
 * RETURN VALUE
 *    pointer to the matching KimmoAlternation, or NULL if not found
 */
static KimmoAlternation *find_alternation(name,lang)
unsigned char *name;
KimmoData *lang;
{
register KimmoAlternation *ap;
register unsigned i;

for (	ap = lang->pAlternations, i = 0 ;
	i < lang->uiAlternationCount ;
	++i, ++ap )
	{
	if (!strcmp((char *)ap->pszName,(char *)name))
	return(ap);
	}
return((KimmoAlternation *)NULL);
}

/****************************************************************************
 * NAME
 *    find_feature
 * ARGUMENTS
 *    name - pointer to feature name
 *    lang - pointer to KimmoData data structure
 * DESCRIPTION
 *    Check array for matching feature name.
 * RETURN VALUE
 *    index if found, -1 if not found
 */
static int find_feature(name,lang)
unsigned char *name;
KimmoData *lang;
{
register unsigned char **featp;
register unsigned i;

for ( featp = lang->ppszFeatures, i = 0 ; i < lang->uiFeatureCount ; i++ )
	{
	if (strcmp((char *)featp[i],(char *)name) == 0)
		return(i);
	}
return( -1 );
}


/****************************************************************************
 * NAME
 *    new_lexicon
 * ARGUMENTS
 *    name - pointer to name of a lexicon section
 *    lang - pointer to KimmoData data structure
 * DESCRIPTION
 *    Add this lexicon subsection to lang->pLexiconSections.
 * RETURN VALUE
 *    pointer to where the name is stored in lang->pLexiconSections
 */
static KimmoLexicon *new_lexicon(name, lang, puiSizeLexSections)
unsigned char *	name;
KimmoData *	lang;
unsigned *	puiSizeLexSections;
{
register KimmoLexicon *lxp;
unsigned size_lex_sections;
/*
 *  make sure that this name isn't already used
 */
lxp = findKimmoLexiconSection(name,lang);
if (lxp != (KimmoLexicon *)NULL)
	return( lxp );		/* name is already there */
size_lex_sections = *puiSizeLexSections;
/*
 *  if necessary, grow the array of KimmoLexicon structures
 */
if (lang->uiLexiconSectionCount >= size_lex_sections)
	{
	size_lex_sections += 50;
	lang->pLexiconSections = (KimmoLexicon *)reallocMemory(
					 lang->pLexiconSections,
					 size_lex_sections * sizeof(KimmoLexicon));
	}
/*
 *  store a copy of the name and initialize the storage
 */
lxp = &lang->pLexiconSections[lang->uiLexiconSectionCount];
lxp->pszName = (unsigned char *)duplicateString((char *)name);
lxp->pStorage = (Trie *)NULL;
++lang->uiLexiconSectionCount;
*puiSizeLexSections = size_lex_sections;
return( lxp );
}

/****************************************************************************
 * NAME
 *    get_token
 * ARGUMENTS
 *    fp    - input FILE pointer
 *    linep - pointer to file line number
 * DESCRIPTION
 *    Get the next token from a lexicon file.
 * RETURN VALUE
 *    pointer to token found, or NULL if EOF
 */
static unsigned char *get_token(fp, linep, cComment_in)
FILE *fp;
unsigned *linep;
int	cComment_in;
{
static unsigned char *token = (unsigned char *)NULL;
/*
 *  get the next token, reading from the file if necessary
 */
if (*linep == 0)
	token = (unsigned char *)NULL;	/* reset at beginning of file */
else if (token != (unsigned char *)NULL)
	token = tokenizeString(NULL,szWhitespace_m); /* get the next token */

while (token == (unsigned char *)NULL)
	{
	token = (unsigned char *)readLineFromFile(fp, linep, cComment_in);
	if (token == (unsigned char *)NULL)
	return( (unsigned char *)NULL );	/* signal EOF */
	token = tokenizeString(token,szWhitespace_m);
	}
return(token);
}

/****************************************************************************
 * NAME
 *    add_alternation
 * ARGUMENTS
 *    infp  - input FILE pointer
 *    linep - pointer to input file line number
 *    tokp  - address of pointer to the next token from the input file
 *    pLang_in    - pointer to a KimmoData data structure
 *    pSynLang_in - pointer to a KimmoData data structure for synthesis lexicon
 * DESCRIPTION
 *    Add an KimmoAlternation to the KimmoData data structure.
 * RETURN VALUE
 *    zero if okay, -1 if error
 */
static int add_alternation(infp, linep, tokp, pLang_in, pSynLang_in,
			   puiSizeLexSections, puiSynSizeLexSections)
FILE *		infp;
unsigned *	linep;
unsigned char **tokp;
KimmoData *	pLang_in;
KimmoData *	pSynLang_in;
unsigned *	puiSizeLexSections;
unsigned *	puiSynSizeLexSections;
{
unsigned	i;
unsigned char *	tok;
KimmoLexicon *	lxp;
int		iLexIndex;
KimmoAlternation *	pAlt = NULL;
unsigned	uiSizeAltLex = 0;	/* size of array in *pAlt */
unsigned	uiNumAltLex = 0;	/* number of entries used *pAlt */
unsigned	uiSizeAlterns;
KimmoAlternation *	pSynAlt = NULL;
unsigned	uiSynSizeAltLex = 0;
unsigned	uiSynNumAltLex = 0;
unsigned	uiSynSizeAlterns;
KimmoData *		pKimmo;

if (pLang_in != NULL)
	pKimmo = pLang_in;
else if (pSynLang_in != NULL)
	pKimmo = pSynLang_in;
else
	return -1;

tok = get_token(infp, linep, pKimmo->cComment);
if ((tok == (unsigned char *)NULL) || is_keyword((char *)tok))
	{
	displayNumberedMessage(&sMissingAlternName_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   pszFilename_m, linep ? *linep : 0 );
	return( -1 );
	}
uiSizeAlterns    = uiAlternationsAllocated_m;
uiSynSizeAlterns = uiAlternationsAllocated_m;
if (pLang_in != NULL)
	{
	/*
	 *  check whether this alternation name was already used
	 */
	pAlt = find_alternation(tok, pLang_in);
	if (pAlt != (KimmoAlternation *)NULL)
	{
	displayNumberedMessage(&sAlternExists_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   pszFilename_m, 0,
				   tok);
	for ( i = 0 ; pAlt->piLexicons[i] != -1 ; ++i )
		;
	uiSizeAltLex = i + 1;	/* size allocated (last one -1) */
	uiNumAltLex  = i;	/* index of next one to add */
	}
	else
	{
	/*
	 *  if necessary, grow the array of KimmoAlternation structures
	 */
	if (pLang_in->uiAlternationCount >= uiSizeAlterns)
		{
		uiSizeAlterns += 50;
		pLang_in->pAlternations = (KimmoAlternation *)reallocMemory(
					 pLang_in->pAlternations,
					 uiSizeAlterns * sizeof(KimmoAlternation));
		}
	/*
	 *  add a new KimmoAlternation
	 */
	pAlt = &pLang_in->pAlternations[pLang_in->uiAlternationCount];
	++pLang_in->uiAlternationCount;
	pAlt->pszName = (unsigned char *)duplicateString((char *)tok);
	/*
	 *  initialize memory storage for the lexicon section indexes
	 */
	pAlt->piLexicons = (short *)NULL;
	uiSizeAltLex = 0;
	uiNumAltLex  = 0;
	}
	}
if (pSynLang_in != NULL)
	{
	/*
	 *  check whether this alternation name was already used
	 */
	pSynAlt = find_alternation(tok, pSynLang_in);
	if (pSynAlt != (KimmoAlternation *)NULL)
	{
	if (pLang_in == NULL)
		displayNumberedMessage(&sAlternExists_m,
				   bSilentMessages_m,
				   bShowWarnings_m, pLogFP_m,
				   pszFilename_m, 0,
				   tok);
	for ( i = 0 ; pSynAlt->piLexicons[i] != -1 ; ++i )
		;
	uiSynSizeAltLex = i + 1;	/* size allocated (last one -1) */
	uiSynNumAltLex  = i;	/* index of next one to add */
	}
	else
	{
	/*
	 *  if necessary, grow the array of KimmoAlternation structures
	 */
	if (pSynLang_in->uiAlternationCount >= uiSynSizeAlterns)
		{
		uiSynSizeAlterns += 50;
		pSynLang_in->pAlternations = (KimmoAlternation *)reallocMemory(
				  pSynLang_in->pAlternations,
				  uiSynSizeAlterns * sizeof(KimmoAlternation));
		}
	/*
	 *  add a new KimmoAlternation
	 */
	pSynAlt = &pSynLang_in->pAlternations[pSynLang_in->uiAlternationCount];
	++pSynLang_in->uiAlternationCount;
	pSynAlt->pszName = (unsigned char *)duplicateString((char *)tok);
	/*
	 *  initialize memory storage for the lexicon section indexes
	 */
	pSynAlt->piLexicons = (short *)NULL;
	uiSynSizeAltLex = 0;
	uiSynNumAltLex  = 0;
	}
	}
/*
 *  read lexicon section names until EOF or a keyword
 */
for (;;)
	{
	tok = get_token(infp, linep, pKimmo->cComment);
	if ((tok == (unsigned char *)NULL) || is_keyword((char *)tok))
	break;
	/*
	 *  convert the lexicon section name into a KimmoLexicon pointer
	 *  if necessary, add it to the array of section names
	 */
	if (pLang_in != NULL)
	{
	lxp = findKimmoLexiconSection(tok, pLang_in);
	if (lxp == (KimmoLexicon *)NULL)
		lxp = new_lexicon(tok,pLang_in, puiSizeLexSections);
	iLexIndex = lxp - pLang_in->pLexiconSections;
	for ( i = 0 ; i < uiNumAltLex ; ++i )
		{
		if (pAlt->piLexicons[i] == iLexIndex)
		break;
		}
	if (i < uiNumAltLex)
		{
		displayNumberedMessage(&sLexAlreadyAltern_m,
				   bSilentMessages_m,
				   bShowWarnings_m, pLogFP_m,
				   pszFilename_m, 0,
				  tok, pAlt->pszName);
		continue;
		}
	/*
	 *  store the KimmoLexicon pointer, after growing the array if
	 *  necessary
	 */
	if (uiNumAltLex >= uiSizeAltLex)
		{
		uiSizeAltLex += 50;
		pAlt->piLexicons = (short *)reallocMemory(pAlt->piLexicons,
						uiSizeAltLex * sizeof(short) );
		}
	pAlt->piLexicons[uiNumAltLex] = iLexIndex;
	++uiNumAltLex;
	}
	if (pSynLang_in != NULL)
	{
	lxp = findKimmoLexiconSection(tok, pSynLang_in);
	if (lxp == (KimmoLexicon *)NULL)
		lxp = new_lexicon(tok, pSynLang_in, puiSynSizeLexSections);
	iLexIndex = lxp - pSynLang_in->pLexiconSections;
	for ( i = 0 ; i < uiSynNumAltLex ; ++i )
		{
		if (pSynAlt->piLexicons[i] == iLexIndex)
		break;
		}
	if (i < uiSynNumAltLex)
		{
		if (pLang_in == NULL)
		displayNumberedMessage(&sLexAlreadyAltern_m,
					   bSilentMessages_m,
					   bShowWarnings_m, pLogFP_m,
					   pszFilename_m, 0,
					   tok, pSynAlt->pszName);
		continue;
		}
	/*
	 *  store the KimmoLexicon pointer, after growing the array if
	 *  necessary
	 */
	if (uiSynNumAltLex >= uiSynSizeAltLex)
		{
		uiSynSizeAltLex += 50;
		pSynAlt->piLexicons = (short *)reallocMemory(
						 pSynAlt->piLexicons,
						 uiSynSizeAltLex * sizeof(short) );
		}
	pSynAlt->piLexicons[uiSynNumAltLex] = iLexIndex;
	++uiSynNumAltLex;
	}
	}
/*
 *  finished defining this KimmoAlternation, so clean up and return
 */
if (pLang_in != NULL)
	{
	if (pAlt->piLexicons == (short *)NULL)
	displayNumberedMessage(&sEmptyAltern_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   pszFilename_m, linep ? *linep : 0,
				   pAlt->pszName);
	else
	{
	/*
	 *  terminate the array of indices into lang->pLexiconSections
	 */
	if (uiNumAltLex >= uiSizeAltLex)
		{
		uiSizeAltLex = uiNumAltLex + 1;
		pAlt->piLexicons = (short *)reallocMemory(pAlt->piLexicons,
						uiSizeAltLex * sizeof(short) );
		}
	pAlt->piLexicons[uiNumAltLex] = -1;
	++uiNumAltLex;
	/*
	 *  squeeze the array to a perfect fit
	 */
	if (uiNumAltLex < uiSizeAltLex)
		pAlt->piLexicons = (short *)reallocMemory(pAlt->piLexicons,
						 uiNumAltLex * sizeof(short) );
	}
	}
if (pSynLang_in != NULL)
	{
	if (pSynAlt->piLexicons == (short *)NULL)
	{
	if (pLang_in == NULL)
		displayNumberedMessage(&sEmptyAltern_m,
				   bSilentMessages_m,
				   bShowWarnings_m, pLogFP_m,
				   pszFilename_m, linep ? *linep : 0,
				   pSynAlt->pszName);
	}
	else
	{
	/*
	 *  terminate the array of indices into lang->pLexiconSections
	 */
	if (uiSynNumAltLex >= uiSynSizeAltLex)
		{
		uiSynSizeAltLex = uiSynNumAltLex + 1;
		pSynAlt->piLexicons = (short *)reallocMemory(
						 pSynAlt->piLexicons,
						 uiSynSizeAltLex * sizeof(short) );
		}
	pSynAlt->piLexicons[uiSynNumAltLex] = -1;
	++uiSynNumAltLex;
	/*
	 *  squeeze the array to a perfect fit
	 */
	if (uiSynNumAltLex < uiSynSizeAltLex)
		pSynAlt->piLexicons = (short *)reallocMemory(
						  pSynAlt->piLexicons,
						  uiSynNumAltLex * sizeof(short) );
	}
	}
if (uiSizeAlterns > uiAlternationsAllocated_m)
	uiAlternationsAllocated_m = uiSizeAlterns;
if (uiSynSizeAlterns > uiAlternationsAllocated_m)
	uiAlternationsAllocated_m = uiSynSizeAlterns;
*tokp = tok;
return( 0 );
}

/****************************************************************************
 * NAME
 *    set_fieldcode
 * ARGUMENTS
 *    infp  - input FILE pointer
 *    linep - pointer to input file line number
 *    tokp  - address of pointer to the next token from the input file
 * DESCRIPTION
 *    Store FIELDCODE arguments if valid
 * RETURN VALUE
 *    zero if okay, -1 if invalid
 */
static int set_fieldcode(infp,linep,tokp, cComment_in)
FILE *infp;
unsigned *linep;
unsigned char **tokp;
int		cComment_in;
{
unsigned char *from, *to;
unsigned i;

/*
 * Check for two tokens following FIELDCODE. If two, add.
 */
from = get_token(infp, linep, cComment_in);
if ((from == (unsigned char *)NULL) || is_keyword((char *)from))
	{
	displayNumberedMessage(&sMissingLexiconName_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   pszFilename_m, linep ? *linep : 0);
	return( -1 );
	}

to = get_token(infp, linep, cComment_in);
if ((to == (unsigned char *)NULL) || is_keyword((char *)to))
	{
	displayNumberedMessage(&sMissingLexiconName_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   pszFilename_m, linep ? *linep : 0);
	return( -1 );
	}
else
/*
 * Check also for validness second argument
 */
if (strchr((char *)GOOD_CODE_VALUES, *to) == (char *)NULL )
	{
	displayNumberedMessage(&sInvalidFIELDCODEargument_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   pszFilename_m, linep ? *linep : 0);
	return( -1 );
	}

/*
 * Make sure there is (enough) space
 */
if (uiFieldCodeCount_m >= uiFieldCodesAllocated_m)
	{
	uiFieldCodesAllocated_m += 10;
	if (paFieldCodes_m == (LexFieldCode *)NULL)
		paFieldCodes_m = (LexFieldCode *)allocMemory(
					uiFieldCodesAllocated_m * sizeof(LexFieldCode));
	else
		paFieldCodes_m = (LexFieldCode *)reallocMemory((LexFieldCode *)paFieldCodes_m,
					uiFieldCodesAllocated_m * sizeof(LexFieldCode));
	}

/*
 * Store values in paFieldCodes_m.
 */
for (i = 0; i < uiFieldCodeCount_m; i++)
	{
	if (paFieldCodes_m[i].internal == *to)
	{
	displayNumberedMessage(&sDoubleGloss_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   pszFilename_m,
				   linep ? *linep : 0,
				   paFieldCodes_m[i].usercode, to);
	goto skipstore;
	}
	}
paFieldCodes_m[uiFieldCodeCount_m].usercode = duplicateString((char *)from);
paFieldCodes_m[uiFieldCodeCount_m].internal = *to;
++uiFieldCodeCount_m;

skipstore:

*tokp = get_token(infp, linep, cComment_in);
return( 0 );
}

/****************************************************************************
 * NAME
 *    addFeatures
 * ARGUMENTS
 *    infp  - input FILE pointer
 *    linep - pointer to input file line number
 *    tokp  - address of pointer to the next token from the input file
 *    pLang_in    - pointer to a KimmoData data structure
 *    pSynLang_in -  pointer to a KimmoData data structure for synthesis
 * DESCRIPTION
 *    Add FEATURES values to the KimmoData data structure.
 * RETURN VALUE
 *    zero if okay, -1 if error
 */
static int addFeatures(infp,linep,tokp, pLang_in, pSynLang_in)
FILE *		infp;
unsigned *	linep;
unsigned char **tokp;
KimmoData *	pLang_in;
KimmoData *	pSynLang_in;
{
unsigned char *tok;
KimmoData *	pKimmo;

if (pLang_in != NULL)
	pKimmo = pLang_in;
else if (pSynLang_in != NULL)
	pKimmo = pSynLang_in;
else
	return -1;

tok = get_token(infp, linep, pKimmo->cComment);
if ((tok == (unsigned char *)NULL) || is_keyword((char *)tok))
	{
	displayNumberedMessage(&sNoFeatures_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   pszFilename_m, linep ? *linep : 0);
	return( 0 );
	}
for (;;)
	{
	/*
	 * check whether this feature name was already used
	 */
	if (    ((pLang_in != NULL)    && (find_feature(tok,pLang_in)    >= 0)) ||
		((pSynLang_in != NULL) && (find_feature(tok,pSynLang_in) >= 0)) )
	{	/* feature found */
	displayNumberedMessage(&sFeatureAlready_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   pszFilename_m, 0,
				   tok);
	}
	else
	{
	/*
	 * if necessary, grow the array of feature strings
	 */
	if (    (   (pLang_in != NULL) &&
			(pLang_in->uiFeatureCount >= uiFeaturesAllocated_m) ) ||
		(   (pSynLang_in != NULL) &&
			(pSynLang_in->uiFeatureCount >= uiFeaturesAllocated_m) ) )
		{
		uiFeaturesAllocated_m += 10;
		if (pLang_in != NULL)
		pLang_in->ppszFeatures = (unsigned char **)reallocMemory(
					 pLang_in->ppszFeatures,
					 uiFeaturesAllocated_m * sizeof(unsigned char **));
		if (pSynLang_in != NULL)
		pSynLang_in->ppszFeatures = (unsigned char **)reallocMemory(
					 pSynLang_in->ppszFeatures,
					 uiFeaturesAllocated_m * sizeof(unsigned char **));
		}
	/*
	 * add new feature
	 */
	if (pLang_in != NULL)
		pLang_in->ppszFeatures[pLang_in->uiFeatureCount++] =
				 (unsigned char *)duplicateString((char *)tok);
	if (pSynLang_in != NULL)
		pSynLang_in->ppszFeatures[pSynLang_in->uiFeatureCount++] =
				 (unsigned char *)duplicateString((char *)tok);
	}
	tok = get_token(infp, linep, pKimmo->cComment);
	if ((tok == (unsigned char *)NULL) || is_keyword((char *)tok))
	break;
	}

*tokp = tok;
return( 0 );
}

/****************************************************************************
 * NAME
 *    loadLexicons
 * ARGUMENTS
 *    pszLexiconFile_in - name of the lexicon file
 *    pLang_in          - pointer to a KimmoData data structure
 *    pSynLang_in       - pointer to a KimmoData for a lexicon based on glosses
 * DESCRIPTION
 *    Build the internal lexicon from the lexicon file.
 * RETURN VALUE
 *    0 if okay, -1 if error or cancelled
 */
static int loadLexicons(pszLexiconFile_in, pLang_in, pSynLang_in)
unsigned char *	pszLexiconFile_in;
KimmoData *	pLang_in;
KimmoData *	pSynLang_in;
{
FILE *			lex_fp;
FILE *			include_fp;
FILE *			infp;
unsigned char *		tok;
unsigned char *		tok2;
unsigned char *		tok3;
unsigned char *		tok4;
unsigned char *		lex_name;
unsigned char *		idxtok = NULL;
unsigned		line_num;
unsigned		save_line_num;
unsigned char *		p;
unsigned char *		q;
KimmoAlternation *	ap = NULL;
unsigned		counter;
unsigned		counter1;
unsigned		counter2;
char *			temp;
char *			rp;
char *			recp;
KimmoLexItem *		lp;
KimmoLexicon *		lxp;
unsigned		hic;	/* help_index counter */
unsigned short *	help_index;
int			ind;
unsigned		i;
unsigned		k;
unsigned long		cLexiconEntries = 0L;
int			retValue;
unsigned char		chNull;
unsigned char		chBoundary;
unsigned		uiSizeLexSections;
unsigned		uiSynSizeLexSections;
KimmoData *		pLanguage;

if (pLang_in != NULL)
	pLanguage  = pLang_in;
else if (pSynLang_in != NULL)
	pLanguage  = pSynLang_in;
else
	return -1;
/*
 *  erase any existing lexicons
 */
if (pLang_in != NULL)
	freeKimmoLexicon(pLang_in);
if (pSynLang_in != NULL)
	freeKimmoLexicon(pSynLang_in);
reportProgress( cLexiconEntries );
/*
 *  open the Lexicon file
 */
if ( (lex_fp = fopen((char *)pszLexiconFile_in, "r")) == (FILE *)NULL )
	{
	displayNumberedMessage(&sBadLexiconFile_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   NULL, 0,
			   pszLexiconFile_in);
	return(-1);
	}
pszFilename_m = (char *)pszLexiconFile_in;
/*
 *  initialize the arrays of KimmoAlternations and KimmoLexicons and FEATUREs
 */
if (pLang_in != NULL)
	{
	pLang_in->pAlternations         = (KimmoAlternation *)NULL;
	pLang_in->uiAlternationCount    = 0;
	pLang_in->pLexiconSections      = (KimmoLexicon *)NULL;
	pLang_in->uiLexiconSectionCount = 0;
	pLang_in->ppszFeatures          = (unsigned char **)NULL;
	pLang_in->uiFeatureCount        = 0;
	}
if (pSynLang_in != NULL)
	{
	pSynLang_in->pAlternations         = (KimmoAlternation *)NULL;
	pSynLang_in->uiAlternationCount    = 0;
	pSynLang_in->pLexiconSections      = (KimmoLexicon *)NULL;
	pSynLang_in->uiLexiconSectionCount = 0;
	pSynLang_in->ppszFeatures          = (unsigned char **)NULL;
	pSynLang_in->uiFeatureCount        = 0;
	}
uiAlternationsAllocated_m         = 0;
uiFeaturesAllocated_m        = 0;
uiSizeLexSections    = 0;
uiSynSizeLexSections = 0;

line_num = 0;
save_line_num = 0;
infp = lex_fp;
include_fp = (FILE *)NULL;
paFieldCodes_m = (LexFieldCode *)NULL;
uiFieldCodeCount_m = uiFieldCodesAllocated_m = 0;
if (pLang_in != NULL)
	{
	chNull     = pLang_in->cNull;
	chBoundary = pLang_in->cBoundary;
	}
else
	{
	chNull     = pSynLang_in->cNull;
	chBoundary = pSynLang_in->cBoundary;
	}
/*
 * First read in all KimmoAlternations and FIELDCODEs
 */
for ( tok = get_token(infp,&line_num, pLanguage->cComment) ; ; )
	{
	if (    (tok == (unsigned char *)NULL) ||		/* hard EOF */
		(strcmp((char *)tok, "END") == 0) )		/* soft EOF marker */
	break;			/* end of the lexicon file */
	else if (strcmp((char *)tok, "ALTERNATION") == 0)
	{				/* define an KimmoAlternation class */
	if (add_alternation(infp, &line_num, &tok, pLang_in, pSynLang_in,
				&uiSizeLexSections, &uiSynSizeLexSections) == -1)
		goto bad_lexiconfile;
	}
	else if (strcmp((char *)tok, "FIELDCODE") == 0)
	{
	if (set_fieldcode(infp, &line_num, &tok, pLanguage->cComment) == -1)
		goto bad_lexiconfile;
	}
	else if (strcmp((char *)tok, "FEATURES") == 0)
	{
	if (addFeatures(infp, &line_num, &tok, pLang_in, pSynLang_in) == -1)
		goto bad_lexiconfile;
	}
	else if (strcmp((char *)tok, "INCLUDE") == 0)
		break;
	else
	{
	displayNumberedMessage(&sBadLexKeyword_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   pszFilename_m, line_num,
				   tok);
	goto bad_lexiconfile;
	}
	}
/*
 * This must be followed by INCLUDE
 */
if (	(tok == (unsigned char *)NULL) ||		/* hard EOF */
	(strcmp((char *)tok, "END") == 0) )		/* soft EOF marker */
	displayNumberedMessage(&sUnexpectedEndOfLexicon_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   pszFilename_m, line_num);
/*
 * Build code table
 */
pCodeTable_m = (CodeTable *)allocMemory(sizeof(CodeTable));
/*
 *  Check consistency arguments
 */
for ( counter1 = 0 ; counter1 < (uiFieldCodeCount_m - 1) ; counter1++ )
	{
	for ( counter2 = counter1+1 ; counter2 < uiFieldCodeCount_m ; counter2++ )
	{
	if (strcmp(paFieldCodes_m[counter1].usercode,
		   paFieldCodes_m[counter2].usercode) == 0)
		displayNumberedMessage(&sDuplicate1stArg_m,
				   bSilentMessages_m,
				   bShowWarnings_m, pLogFP_m,
				   pszFilename_m, line_num);
	if (paFieldCodes_m[counter1].internal ==
						 paFieldCodes_m[counter2].internal)
		displayNumberedMessage(&sDuplicate2ndArg_m,
				   bSilentMessages_m,
				   bShowWarnings_m, pLogFP_m,
				   pszFilename_m, line_num );
	}
	}
counter1 = 0;
pCodeTable_m->uiCodeCount = 0;
for ( counter = 0 ; counter < uiFieldCodeCount_m ; counter++ )
	{
	pCodeTable_m->uiCodeCount++;
	counter1 += strlen(paFieldCodes_m[counter].usercode) + 6;
	}

pCodeTable_m->pCodeTable = allocMemory(counter1 +1);
counter1 = 0;

for ( counter = 0 ; counter < uiFieldCodeCount_m ; counter++ )
	{
	/* Store current paFieldCodes_m element */
	pCodeTable_m->pCodeTable[counter1++] = '\\';
	temp = paFieldCodes_m[counter].usercode;
	strcpy(pCodeTable_m->pCodeTable + counter1, temp);
	counter1 += strlen(temp);
	pCodeTable_m->pCodeTable[counter1++] = '\0';
	pCodeTable_m->pCodeTable[counter1++] = paFieldCodes_m[counter].internal;
	pCodeTable_m->pCodeTable[counter1++] = '\0';
	freeMemory(paFieldCodes_m[counter].usercode);
	}
pCodeTable_m->pCodeTable[counter1++] = '\0';
pCodeTable_m->pszFirstCode = duplicateString(pCodeTable_m->pCodeTable);
freeMemory(paFieldCodes_m);
paFieldCodes_m = (LexFieldCode *)NULL;
uiFieldCodeCount_m = uiFieldCodesAllocated_m = 0;
/*
 *  allocate a buffer for storing feature indexes for the lexicon entries
 */
help_index = (unsigned short *)allocMemory(
			 (pLanguage->uiFeatureCount + 1) * sizeof(unsigned short));
/*
 * Now read in all INCLUDES
 */
while (strcmp((char *)tok, "INCLUDE") == 0)
	{
	if (bCancelKimmoOperation_g)
	goto cancelled;
	tok = get_token(infp,&line_num, pLanguage->cComment);
	if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sMissingINCLUDEfile_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,

				   pszFilename_m, line_num );
	goto bad_lexiconfile;
	}
	pszFilename_m = buildAdjustedFilename((char *)tok,
					  (char *)pszLexiconFile_in, ".lex");
	include_fp = fopen(pszFilename_m, "r");
	if (include_fp == (FILE *)NULL)
	{
	displayNumberedMessage(&sBadINCLUDEfile_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   (char *)pszLexiconFile_in, line_num,
				   pszFilename_m );
	goto bad_lexiconfile;
	}
	if (!bSilentMessages_m)
	reportMessage(TRUE, "  %-32s", pszFilename_m);
	uiRecordCount_m = 0;
	save_line_num = line_num;
	line_num = 0;
	while ((recp = readStdFormatRecord(include_fp,
					   pCodeTable_m,
					   pLanguage->cComment,
					   &uiRecordCount_m)) != (char *)NULL)
	{
	char *nextrp;

	if (bCancelKimmoOperation_g)
		goto cancelled;
	tok = tok2 = tok3 = tok4 = lex_name = (unsigned char *)NULL;
	if (idxtok != (unsigned char *)NULL)
		{
		freeMemory(idxtok);
		idxtok = (unsigned char *)NULL;
		}
	rp = recp;
	hic = 0;
	help_index[0] = 0;
	while (*rp)
		{
		if (bCancelKimmoOperation_g)
		goto cancelled;
		nextrp = rp + strlen(rp) + 1;

		/* store data */

		switch(*rp)
		{
		case 'U':	/* lexical string */
			tok = tokenizeString((unsigned char *)rp + 1,
					 szWhitespace_m);
			if (tok == (unsigned char *)NULL)
			{
			displayNumberedMessage(&sMissingLexicalItem_m,
						   bSilentMessages_m,
						   bShowWarnings_m, pLogFP_m,
						   pszFilename_m, line_num);
			break;
			}
			/*
			 *  validate the lexical form and convert it to indexes
			 */
			idxtok = (unsigned char *)duplicateString((char *)tok);
			for ( p = q = idxtok ; *p != NUL ; )
			{
			if ((k = findKimmoAlphabetIndex(p, pLanguage)) != 0)
				{
				*q++ = k;
				p += strlen((char *)pLanguage->ppszAlphabet[k-1]);
				}
			else if (*p == chNull)
				{
				*q++ = KIMMO_ALPHA_NULL;
				++p;
				}
			else
				{
				displayNumberedMessage(&sBadCharInForm_m,
						   bSilentMessages_m,
						   bShowWarnings_m, pLogFP_m,
						   pszFilename_m, line_num,
						   p, tok);
				tok = (unsigned char *)NULL;
				freeMemory(idxtok);
				idxtok = (unsigned char *)NULL;
				break;
				}
			}
			*q = NUL;
			break;
		case 'L':	/* lexicon_name */
			lex_name = tokenizeString((unsigned char *)rp + 1,
						  szWhitespace_m);
			break;
		case 'A':	/* alternation name */
			tok2 = tokenizeString((unsigned char *)rp + 1,
					  szWhitespace_m);
			/* validate the continuation alternation */
			if (    (tok2 == (unsigned char *)NULL) ||
				is_keyword((char *)tok2) )
			{
			displayNumberedMessage(&sNoContinuationClass_m,
						   bSilentMessages_m,
						   bShowWarnings_m, pLogFP_m,
						   pszFilename_m, line_num,
						   tok);
			reportProgress( cLexiconEntries );
			return( -1 );
			}
			ap = find_alternation(tok2, pLanguage);
			if (    (ap == (KimmoAlternation *)NULL) &&
				!((tok2[0] == chBoundary) && (tok2[1]==NUL)) )
			{
			displayNumberedMessage(&sBadContinuationClass_m,
						   bSilentMessages_m,
						   bShowWarnings_m, pLogFP_m,
						   pszFilename_m, line_num,
						   tok2, tok);
			tok2 = (unsigned char *)NULL;
			}
			break;
		case 'G':	/* lexical gloss */
			tok3 = (unsigned char *)rp + 1;
			do  {
			p = (unsigned char *)strchr((char *)tok3, '\n');
			if (p != (unsigned char *)NULL)
				*p = ' ';
			} while (p != (unsigned char *)NULL);
			/* validate the gloss string */
			while ((*tok3 != NUL) && isascii(*tok3) && isspace(*tok3))
			++tok3;
			for ( p = tok3 + strlen((char *)tok3) - 1 ; p > tok ; --p )
			{
			if (isascii(*p) && isspace(*p))
				*p = NUL;
			else
				break;
			}
			break;
		case 'F':	/* feature string */
			tok4 = tokenizeString((unsigned char *)rp + 1,
					  szWhitespace_m);
			while (tok4 != (unsigned char *)NULL)
			{
			if ((pLang_in != NULL) || (pSynLang_in != NULL))
				{
				if (pLang_in != NULL)
				ind = find_feature(tok4, pLang_in);
				else
				ind = find_feature(tok4, pSynLang_in);
				if (ind < 0)
				/* feature not found */
				displayNumberedMessage(&sFeatureNotFound_m,
							   bSilentMessages_m,
							   bShowWarnings_m,
							   pLogFP_m,
							   pszFilename_m, line_num,
							   tok4);
				else
				{
				/*
				 *  check that this feature isn't already here
				 */
				for ( i = 0 ; i < hic ; ++i )
					{
					if (help_index[i] == (unsigned)(ind + 1))
					break;
					}
				if (i == hic)
					{
					/*
					 *  add this feature to the array
					 */
					help_index[hic++] = ind + 1;
					help_index[hic] = 0;
					}
				}
				}
			tok4 = tokenizeString(NULL, szWhitespace_m);
			}
			break;
		default:
			break;
		}
		rp = nextrp;
		}

	/*
	 *  add this entry to the lexicon Trie storage if valid
	 */
	if (lex_name == (unsigned char *)NULL)
		{
		sMissingLexiconName_m.eType = WARNING_MSG;
		displayNumberedMessage(&sMissingLexiconName_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   pszFilename_m, line_num);
		sMissingLexiconName_m.eType = ERROR_MSG;
		}
	if (	(tok3 == (unsigned char *)NULL) &&
		(tok  != (unsigned char *)NULL) &&
		(tok[0] == chNull) && (tok[1] == NUL) )
		tok3 = (unsigned char *)"";
	if (tok3 == (unsigned char *)NULL)
		{
		displayNumberedMessage(&sMissingGlossElement_m,
				   bSilentMessages_m,
				   bShowWarnings_m, pLogFP_m,
				   pszFilename_m, line_num,
				   (tok) ? (char *)tok : "");
		tok3 = (unsigned char *)"";
		}
	else if (tok3[0] == NUL)
		{
		if ( (tok != (unsigned char *)NULL) && (tok[0] != chNull) )
			tok3 = tok;
		}
	if (	(tok != (unsigned char *)NULL) &&
		(tok2 != (unsigned char *)NULL) &&
		(tok3 != (unsigned char *)NULL) &&
		(lex_name != (unsigned char *)NULL) )
		{
		if (pLang_in != NULL)
		{
		lp = new_lex_item();
		lp->pNext        = (KimmoLexItem *)NULL;
		lp->pszLexString = new_lex_item_string( tok );
		if (ap == (KimmoAlternation *)NULL)
			lp->uiContinuation = MAX_USHORT;	/* signal end (#) */
		else
			lp->uiContinuation = ap - pLanguage->pAlternations;
		lp->pszGloss  = new_lex_item_string( tok3 );
		lp->puiFeatureIndexes = new_lex_item_indexes( help_index );

		lxp = findKimmoLexiconSection(lex_name,pLang_in);
		if (lxp == (KimmoLexicon *)NULL)
			lxp = new_lexicon(lex_name, pLang_in, &uiSizeLexSections);
		lxp->pStorage = addDataToTrie(lxp->pStorage,
						   (char *)idxtok,
						   lp, add_lex_item, MAXLEV);
		}
		if (pSynLang_in != NULL)
		{
		lp = new_lex_item();
		lp->pNext        = (KimmoLexItem *)NULL;
		lp->pszLexString = new_lex_item_string( tok );
		if (ap == (KimmoAlternation *)NULL)
			lp->uiContinuation = MAX_USHORT;	/* signal end (#) */
		else
			lp->uiContinuation = ap - pLanguage->pAlternations;
		lp->pszGloss  = new_lex_item_string( tok3 );
		lp->puiFeatureIndexes = new_lex_item_indexes( help_index );

		lxp = findKimmoLexiconSection(lex_name, pSynLang_in);
		if (lxp == (KimmoLexicon *)NULL)
			lxp = new_lexicon(lex_name, pSynLang_in,
					  &uiSynSizeLexSections);
		lxp->pStorage = addDataToTrie(lxp->pStorage, (char *)tok3,
						   lp, add_lex_item, 8);
		}
		++cLexiconEntries;
		if ((cLexiconEntries & 0x1F) == 0)
		reportProgress( cLexiconEntries );
		}

	hic = 0;
	help_index[0] = 0;
#ifdef MACINTOSH_NEEDS
#ifdef __MWERKS__
	if (LMGetTicks() >= next_user_event_ticks)
		{
		allow_user_events();
		next_user_event_ticks = LMGetTicks() + 10;
		}
#endif
#endif
	}
	if (!bSilentMessages_m)
	reportMessage(TRUE, " %5u entries\n", uiRecordCount_m);
	fclose(include_fp);
	if (idxtok != (unsigned char *)NULL)
	{
	freeMemory(idxtok);
	idxtok = (unsigned char *)NULL;
	}
	freeMemory(pszFilename_m);
	pszFilename_m = (char *)pszLexiconFile_in;
	/*
	 *  read next token from the original file
	 */
	tok = get_token(infp,&line_num, pLanguage->cComment);
	if (tok == (unsigned char *)NULL)
		break;

	}	/* End while loop include files */
/*
 *  cleanup after loading all the lexicon files
 */
reportProgress( cLexiconEntries );
cleanupAfterStdFormatRecord();
freeMemory(help_index);
help_index = (unsigned short *)NULL;

if (	(   (pLang_in                        != NULL) &&
		(pLang_in->uiAlternationCount    == 0)    &&
		(pLang_in->uiLexiconSectionCount == 0) )         ||
	(   (pSynLang_in                        != NULL) &&
		(pSynLang_in->uiAlternationCount    == 0)    &&
		(pSynLang_in->uiLexiconSectionCount == 0) ) )
	{
	displayNumberedMessage(&sEmptyLexiconFile_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   NULL, 0,
				   pszLexiconFile_in);
	goto bad_lexiconfile;
	}
if (	((pLang_in    != NULL) && (pLang_in->uiLexiconSectionCount    == 0)) ||
	((pSynLang_in != NULL) && (pSynLang_in->uiLexiconSectionCount == 0)) )
	{
	displayNumberedMessage(&sNoLexiconSections_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   NULL, 0,
			   pszLexiconFile_in);
	goto bad_lexiconfile;
	}
/*
 *  squeeze the arrays of KimmoAlternations and KimmoLexicons to a perfect fit
 */
if (pLang_in != NULL)
	{
	if (pLang_in->uiAlternationCount < uiAlternationsAllocated_m)
	pLang_in->pAlternations = (KimmoAlternation *)reallocMemory(
			  pLang_in->pAlternations,
			  pLang_in->uiAlternationCount * sizeof(KimmoAlternation));
	if (pLang_in->uiLexiconSectionCount < uiSizeLexSections)
	pLang_in->pLexiconSections = (KimmoLexicon *)reallocMemory(
			   pLang_in->pLexiconSections,
			   pLang_in->uiLexiconSectionCount * sizeof(KimmoLexicon));
	}
if (pSynLang_in != NULL)
	{
	if (pSynLang_in->uiAlternationCount < uiAlternationsAllocated_m)
	pSynLang_in->pAlternations = (KimmoAlternation *)reallocMemory(
		   pSynLang_in->pAlternations,
		   pSynLang_in->uiAlternationCount * sizeof(KimmoAlternation));
	if (pSynLang_in->uiLexiconSectionCount < uiSynSizeLexSections)
	pSynLang_in->pLexiconSections = (KimmoLexicon *)reallocMemory(
			pSynLang_in->pLexiconSections,
			pSynLang_in->uiLexiconSectionCount * sizeof(KimmoLexicon));
	}
/*
 *  make sure we have an "initial" lexicon
 */
if (pLang_in != NULL)
	{
	pLang_in->pInitialLexicon = findKimmoLexiconSection(
						  (unsigned char *)INITIAL_LEX,
						  pLang_in);
	if (pLang_in->pInitialLexicon == (KimmoLexicon *)NULL)
	{
	displayNumberedMessage(&sMissingINITIALlexicon_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   NULL, 0);
	goto bad_lexiconfile;
	}
	}
if (pSynLang_in != NULL)
	{
	pSynLang_in->pInitialLexicon = findKimmoLexiconSection(
						  (unsigned char *)INITIAL_LEX,
						  pSynLang_in);
	if (pSynLang_in->pInitialLexicon == (KimmoLexicon *)NULL)
	{
	if (pLang_in == NULL)
		displayNumberedMessage(&sMissingINITIALlexicon_m,
				   bSilentMessages_m,
				   bShowWarnings_m, pLogFP_m,
				   NULL, 0);
	goto bad_lexiconfile;
	}
	}
free_code_table(pCodeTable_m);
pCodeTable_m = NULL;
fclose(lex_fp);

if (pLang_in != NULL)
	pLang_in->pszLexiconFile = duplicateString((char *)pszLexiconFile_in);
if (pSynLang_in != NULL)
	pSynLang_in->pszLexiconFile = duplicateString((char *)pszLexiconFile_in);

return(0);

/*------------------------------ CANCELLATION ------------------------------*/
cancelled:
/* handled the same as an error */

/*------------------------------ ERROR RETURN ------------------------------*/
bad_lexiconfile:

retValue = -1;
reportProgress( cLexiconEntries );
if (include_fp != (FILE *)NULL)
	{
	fclose(include_fp);
	if (pszFilename_m != (char *)pszLexiconFile_in)
	freeMemory(pszFilename_m);
	}
fclose(lex_fp);
if (pLang_in != NULL)
	freeKimmoLexicon(pLang_in);
if (pSynLang_in != NULL)
	freeKimmoLexicon(pSynLang_in);
return( retValue );
}

/****************************************************************************
 * NAME
 *    loadKimmoLexicon
 * ARGUMENTS
 *    lexiconfile - name of the lexicon file
 *    lang        - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Build the internal lexicon from the lexicon file.
 * RETURN VALUE
 *    0 if okay, -1 if error or cancelled
 */
int loadKimmoLexicon(lexiconfile, eLexiconType_in, lang)
unsigned char *	lexiconfile;
int		eLexiconType_in;
KimmoData *	lang;
{
if ((lexiconfile == NULL) || (lang == NULL))
	return -1;
bSilentMessages_m = lang->bSilent;
bShowWarnings_m   = lang->bShowWarnings;
pLogFP_m          = lang->pLogFP;
if (eLexiconType_in == KIMMO_ANALYSIS)
	return loadLexicons(lexiconfile, lang, NULL);
else
	return loadLexicons(lexiconfile, NULL, lang);
}

/****************************************************************************
 * NAME
 *    writeKimmoLexiconSectionNames
 * DESCRIPTION
 *    write a list of the Kimmo lexicon section names to the output file
 * RETURN VALUE
 *    none
 */
void writeKimmoLexiconSectionNames(pOutputFP_in, pKimmo_in)
FILE *		pOutputFP_in;
KimmoData *	pKimmo_in;
{
unsigned i;

if ((pOutputFP_in == NULL) || (pKimmo_in == NULL))
	return;
if (pKimmo_in->uiLexiconSectionCount)
	putc('\n', pOutputFP_in);
for ( i = 0 ; i < pKimmo_in->uiLexiconSectionCount ; ++i )
	fprintf(pOutputFP_in, "    %s\n", pKimmo_in->pLexiconSections[i].pszName);
if (pKimmo_in->uiLexiconSectionCount)
	putc('\n', pOutputFP_in);
}

/*****************************************************************************
 * NAME
 *    show_lex_items
 * ARGUMENTS
 *    lip    - pointer to linked list of KimmoLexItem
 *    indent - number of spaces to indent
 *    outfp  - output FILE pointer
 * DESCRIPTION
 *    Display the contents of a linked list KimmoLexItem's which are
 *    stored in a Trie.
 * RETURN VALUE
 *    none
 */
static KimmoData *	pKimmo_m;
static void show_lex_items(vlip, indent, outfp)
VOIDP vlip;
int indent;
FILE *outfp;
{
KimmoLexItem *lip;
short *xp;
unsigned char *np;
KimmoAlternation *altp;
int i;

for ( lip = (KimmoLexItem *)vlip ; lip ; lip = lip->pNext )
	{
	putc('\n', outfp);
	for ( i = 0 ; i < indent ; ++i )
	putc(' ', outfp);
	fprintf(outfp, "%-13s \"%s\"   { ",
	(lip->pszLexString != (unsigned char *)NULL) ?
			lip->pszLexString : (unsigned char *)"0",
	(lip->pszGloss  != (unsigned char *)NULL) ?
			lip->pszGloss  : (unsigned char *)"" );
	if (    (lip->uiContinuation != MAX_USHORT) &&
		(lip->uiContinuation < pKimmo_m->uiAlternationCount) )
	altp = &pKimmo_m->pAlternations[lip->uiContinuation];
	else
	altp = (KimmoAlternation *)NULL;
	if (altp != (KimmoAlternation *)NULL)
	{
	for ( xp = altp->piLexicons ; *xp != -1 ; ++xp )
		{
		np = pKimmo_m->pLexiconSections[*xp].pszName;
		fprintf(outfp, "%s ",
			(np != (unsigned char *)NULL) ? np : (unsigned char *)"" );
		}
	}
	else
	fprintf(outfp, "%c ", pKimmo_m->cBoundary );
	putc('}', outfp);
	}
}

/*****************************************************************************
 * NAME
 *    writeKimmoLexiconSection
 * DESCRIPTION
 *    write the designated section of the Kimmo lexicon to the output file
 * RETURN VALUE
 *    TRUE if successful, FALSE if the lexicon section does not exist
 */
int writeKimmoLexiconSection(pszLexSection_in, pOutputFP_in, pKimmo_in)
unsigned char *		pszLexSection_in;
FILE *			pOutputFP_in;
KimmoData *		pKimmo_in;
{
KimmoLexicon *	pSection;

pSection = findKimmoLexiconSection(pszLexSection_in, pKimmo_in);
if (pSection == (KimmoLexicon *)NULL)
	return FALSE;
putc('\n', pOutputFP_in);
pKimmo_m = pKimmo_in;
writeTrieData( pSection->pStorage, show_lex_items, pOutputFP_in);
pKimmo_m = NULL;
putc('\n', pOutputFP_in);
return TRUE;
}
