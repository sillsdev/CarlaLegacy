/*  SETSD.C - set up the (source dialect) dictionary for analysis
 *****************************************************************************
 *
 * int loadAmpleDictionary(const char *	pszFilename_in,
 *			   int          eDictType_in,
 *			   AmpleData *  pAmple_io);
 *
 * void initAmpleMorphChecking(int         bCheckMorphs_in,
 *                             AmpleData * pAmple_io);
 *
 * void checkAmpleMorphs(int         bCheckMorphs_in,
 *			 AmpleData * pAmple_in,
 * 		         int         bFreeSpaceWhenDone);
 *
 * void freeAmpleDictionary(AmpleData * pAmple_io);
 *
 * int updateAmpleDictEntry(const char * pszEntry_in,
 *			    AmpleData *  pAmple_io)
 *
 * int removeFromAmpleDictionary(char *      pszMorphName_in,
 *				 unsigned    iType_in,
 *				 AmpleData * pAmple_io)
 *
 ****************************************************************************
 *
 * void freeAmpleMorpheme(AmpleMorpheme * pMorph_in,
 *			  AmpleData *     pAmple_in)
 *
 ****************************************************************************
 * Copyright 1988, 2002 by SIL International.  All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"
extern char *	strlwr P((char * pszString_io));
#define FULLREDUP "<...>"
#define FULLREDUPLEN 5

/********************* SETSD.C FUNCTION PROTOTYPES *********************/

#ifdef AZTEC
#define abs(x) (x<0 ? -x : x)
#endif

static VOIDP	add_entry	P((VOIDP pEntry_in, VOIDP pList_in));
static void	free_entry	P((VOIDP pList_in));
static void	enter_entry	P((char *key, AmpleAllomorph *dentry,
				   AmpleData * pAmple_in));
static void	add_fd		P((char *rp, AmpleMorpheme *mde,
				   AmpleData * pAmple_in));
static void	add_menv	P((AmpleAllomorph *ap,
				   AmpleData * pAmple_in));
static void	add_morph	P((char *name, AmpleData * pAmple_in));
static void	freealist	P((AmpleAllomorphList * pAlloList_io,
				   AmpleData * pAmple_in));
static char *	fix_allomorph	P((char *      pszAllomorph_in,
				   AmpleData * pAmple_in,
				   int *       bIsCaps_out));
	   int	is_number	P((char * pszString_in));

static AmpleAllomorphList * build_allomorphs P((
						char *               pszAllo_in,
						char *               pszRecord_in,
						AmpleAllomorphList * pHead_io,
						int                  iDicType_in,
						AmpleMorpheme *      pMorph_io,
						int *                pbBad_io,
						AmpleData *          pAmple_in));

static void	afx_create	P((char *recp, int dtype,
				   AmpleData * pAmple_in));
static void	infix_locate	P((char *recp, AmpleInfixInfo *ip,
				   int rec_read, char *rec_key,
				   AmpleData * pAmple_in));
static void	ifx_create	P((char *recp, int dtype, AmpleData * pAmple_in));
static void	root_create	P((char *recp, AmpleData * pAmple_in));
static void	to_list		P((char *line, unsigned char **tocats,
				   int count, AmpleData * pAmple_in));
static void	cat_list	P((char *line, AmpleAffixInfo *de,
				   int count, AmpleData * pAmple_in));
static void	badmenv		P((char *mname, AmpleAllomorph *ap,
				   FILE * pLogFP_in));
static void	badmorph	P((char *mname, AmpleMorphConstraint *mcon,
				   FILE * pLogFP_in));
static void	chk_adhoc_pairs	P((AmpleData * pAmple_in));
static void	chk_AHpair	P((AmplePairList *adhoc_list, char *msg,
				   AmpleData * pAmple_in));
static void	chk_duplicates	P((AmpleData * pAmple_in));
static void	chk_mccs	P((AmpleData * pAmple_in));
static void	chk_mecs	P((AmpleData * pAmple_in));
static void	chk_morph_classes P((const AmpleData * pAmple_in));
static void	chk_user_test	P((AmpleData * pAmple_in));
static void	ctest		P((AmpleTestNode *tree, char *testname,
				   AmpleData * pAmple_in));
static void	initalist	P((AmpleData * pAmple_in));
static AmpleAllomorphList * mkalist	P((AmpleAllomorphList *ahead,
					   int dtype,
					   AmpleMorpheme *mptr,
					   AmpleData * pAmple_in));
static StringList * make_root_excep P((StringList *head, char *str, int rsc));
static void	freeAmpleMorphsForChecking P((AmpleData * pAmple_in));
static void	showAmpleAlloEnvConstraint P((AmpleAllomorphList *alp,
						  char *dictstr,
						  FILE * pLogFP_in));
static char *	get_allomorph_id P((char * pszID_in));
static char *	build_allomorph_id P((char * pszMorph_in, int iIndex_in));
static char *	convertRecord	P((const char * pszEntry_in,
				   AmpleData * pAmple_io));
static VOIDP	removeAllomorph P((VOIDP pOld_in, VOIDP pList_io));
static void	addAmpleDictEntry P((char * pRecord_in,
					 AmpleData * pAmple_io));
static void check_for_valid_mcc P((AmpleMorphConstraint * pMCC_in,
				   char *                 pszMorphName_in,
				   AmpleData *            pAmple_in));
static void freeAmpleAffixInfo P((AmpleAffixInfo * pAffix_in));

#ifndef hab360
static long parseAmpleOrderClass P((char * rp, AmpleData * pAmple_in));
#endif

#ifdef EXPERIMENTAL
static char *		setPATRCategory P((char * pszCategory_in,
					   AmpleData * pAmple_in));
static PATRFeature *	setPATRFeature P((PATRFeature * pPATRFeature_io,
					  char *        pszFeature_in,
					  AmpleData *   pAmple_in));
#endif /* EXPERIMENTAL */

/********************* SETSD.C LOCAL VARIABLES *********************/

/*
 *  error messages for dictionary loading
 */
static const char	szLoadError_m[] = "%sNo %s in entry: %s\n";
static const char	szMorphnameTooLong_m[] =
		"%sMorphname too long, truncated to %c%s in entry: %s\n";
static const char	szMorphnameWarning_m[] =
		"%sMorphname %c%s too long in entry: %s\n";
static const char	szBadOrderclass_m[] =
		"%sInvalid orderclass %ld, stored as %d in entry: %s\n";
#ifndef hab360
static const char	szBadOrderclassMax_m[] =
		"%sInvalid orderclassmax %ld, stored as %d in entry: %s\n\
\tThe orderclassMax is less than the orderclassmin.\n";
#endif
static const char	szEmptyAllomorph_m[] =
		"%sEmpty allomorph field in entry: %s\n";
static const char	szTwoMorphnames_m[] =
		"%sMultiple morphnames in entry: %s\n\
\t%s\n\
\t%s (ignored)\n";
#ifdef hab360
/*static const char	szTwoOrderclasses_m[] =*/
/*		"%sMultiple orderclasses in entry: %s\n\*/
/*\t%d\n\*/
/*\t%s (ignored)\n";*/
#else
static const char	szTwoOrderclasses_m[] =
		"%sMultiple orderclasses in entry: %s\n\
\t%d %d\n\
\t%s (ignored)\n";
#endif
static const char	szTwoUnderlyingForms_m[] =
		"%sMultiple underlying forms in entry: %s\n\
\t%s\n\
\t%s (ignored)\n";
static const char	szBadRedupClass_m[] =
		"%sInvalid string class in allomorph string, in entry: %s\n\
\t%s is not defined\n";
static const char	szNoRedupClassIndex_m[] =
		"%sInvalid string class in allomorph string, in entry: %s\n\
\t%s lacks the trailing index indicator (^1, ^2, ...)\n";
#ifdef EXPERIMENTAL
static const char	szTwoPATRCats_m[] =
		"%sMultiple PATR categories in entry: %s\n\
\t%s\n\
\t%s (ignored)\n";
#endif /* EXPERIMENTAL */
static const char	szTwoLocations_m[] =
		"%sMultiple infix locations in entry: %s\n\t";
static const char	szTwoGlosses_m[] =
		"%sMultiple glosses in entry: %s\n\
\t%s\n\
\t%s (ignored)\n";
static const char	szIgnoredMultiple_m[] = "\n\t %s (ignored)\n";
static const char	szMisplacedConstraint_m[] =
		"%sMCC does not belong in entry: %s\n";
/*
 *  error messages
 */
static const char	szMorphCheckError_m[] =
				"MORPH_CHECK: Unknown morphname \"%s\" in %s %s\n";
static const char	szNoDictionary_m[] =
				"Cannot open %s dictionary file %s\n";
static const char	szEmptyCodeTable_m[] =
				"%sEmpty code table, cannot load dictionary\n";
/*
 *  default code table for updateAmpleDictEntry()
 */
#ifdef EXPERIMENTAL
static const CodeTable	sDefaultCodeTable_m = { "\
\\a\0A\0\
\\c\0C\0\
\\e\0E\0\
\\fd\0F\0\
\\g\0G\0\
\\loc\0L\0\
\\mn\0M\0\
\\o\0O\0\
\\mp\0P\0\
\\entryType\0T\0\
\\uf\0U\0\
\\mcc\0Z\0\
\\cat\0c\0\
\\feat\0f\0\
\\lx\0#\0\
\\no\0!\0\
", 16, "\\lx" };
#else
static const CodeTable	sDefaultCodeTable_m = { "\
\\a\0A\0\
\\c\0C\0\
\\e\0E\0\
\\fd\0F\0\
\\g\0G\0\
\\loc\0L\0\
\\mn\0M\0\
\\o\0O\0\
\\mp\0P\0\
\\entryType\0T\0\
\\uf\0U\0\
\\mcc\0Z\0\
\\lx\0#\0\
\\no\0!\0\
", 14, "\\lx" };
#endif /* EXPERIMENTAL */

static const char	szWhitespace_m[7] = " \t\r\n\f\v";

#ifdef PROPDEBUG
/*****************************************************************************
 * NAME
 *    disp_allo
 * DESCRIPTION
 *    displays the information associated with an allomorph
 * RETURN VALUE
 *    none
 */
void disp_allo(head, dictstr, pAmple_in)
AmpleAllomorphList *	head;	/* pointer to the head alist structure used in
				   building the allomorph information */
char *			dictstr;	/* string for dictionary type */
AmpleData *		pAmple_in;
{
AmpleAllomorphList *alp;
struct cond_list *cl;
struct amprop *pp;
int cat, dictype, i;
unsigned char *pc;

if (pAmple_in->pLogFP == NULL)
	return;

dictype = head->allo->iMORPHTYPE & ATYPE;
/*
 *  display morpheme level info first
 */
fprintf(pAmple_in->pLogFP, "%s morpheme: %s\n",
	dictstr,
	((dictype==AMPLE_ROOT) && (head->allo->pMORPHNAME==NULL)) ?
					   head->allostr : head->allo->pMORPHNAME);
fprintf(pAmple_in->pLogFP, "\tcats:");		/* categories */
if (dictype != AMPLE_ROOT)
	{					/* affix info */
	for ( i = 0 ; ; ++i )
	{
	if ((cat = (head->allo->pAFFIX->fromcategory)[i]) == 0)
		break;
	fprintf(pAmple_in->pLogFP, " %s/%s",
		findAmpleCategoryName(cat),
		findAmpleCategoryName((head->allo->pAFFIX->tocategory)[i]) );
	}
	fprintf(pAmple_in->pLogFP, "\n");
	/* orderclass */
	fprintf(pAmple_in->pLogFP, "\torderclass = %d\n",
		head->allo->pAFFIX->orderclass );
	}
else
	{                                /* root info */
	for (   pc = (pAmple_in->bRootGlosses ? /* hab 3.2.8 */
		  head->allo->pROOT_CATS : head->allo->pROOTCATS) ;
		*pc != NUL ;
		++pc )
	{
	fprintf(pAmple_in->pLogFP, " %s",
		findAmpleCategoryName(*pc));   /* categories */
	}
	fprintf(pAmple_in->pLogFP, "\n");
	/* regular sound change */
	if (RSC & head->allo->iMORPHTYPE)
	fprintf(pAmple_in->pLogFP, "\tRegular Sound Change applies\n");
	}
/* morpheme properties */
if (head->allo->pProperties)
	{
	fprintf(pAmple_in->pLogFP, "\tprops = ");
	writeAmplePropertySet(head->allo->pProperties,
			  &pAmple_in->sProperties,
			  pAmple_in->pLogFP);
	fprintf(pAmple_in->pLogFP, "\n");
	}

/* display allomorph information */
for (alp = head; alp; alp = alp->next)
	{
	fprintf(pAmple_in->pLogFP, "\tallomorph: %s", alp->allostr);
	/* surface conditions */
	if (alp->allo->allo_cond)
	{
	for (cl = cnd_str; cl; cl = cl->cond_link)
		{
		if (alp->allo->allo_cond == cl->cond_condit)
		{
		fprintf(pAmple_in->pLogFP, " %s", cl->cond_str);
		break;
		}
		}
	}
	fprintf(pAmple_in->pLogFP, "\n");
	/* allomorph properties*/
	if (head->allo->pProperties)
	{
	fprintf(pAmple_in->pLogFP, "\tprops = ");
	writeAmplePropertySet(head->allo->pProperties,
				  &pAmple_in->sProperties,
				  pAmple_in->pLogFP);
	fprintf(pAmple_in->pLogFP, "\n");
	}
	}
}
#endif /* PROPDEBUG */

/*****************************************************************************
 * NAME
 *    add_entry
 * DESCRIPTION
 *    add a dictionary entry to a list of same
 * RETURN VALUE
 *    pointer to the beginning of the list
 */
static VOIDP add_entry(pEntry_in, pList_in)
VOIDP pEntry_in;
VOIDP pList_in;
{
AmpleAllomorph *	pEntry = pEntry_in;
AmpleAllomorph *	pList = pList_in;

if (pEntry == NULL)
	return pList_in;
pEntry->pNext = pList;
return pEntry_in;
}

/***************************************************************************
 * NAME
 *    enter_entry
 * DESCRIPTION
 *    Use key to add a dictionary entry.
 * RETURN VALUE
 *    none
 */
static void enter_entry( key, dentry, pAmple_in)
char *			key;		/* string to be entered */
AmpleAllomorph *	dentry;		/* dictionary entry */
AmpleData *		pAmple_in;
{
if ( pAmple_in->iDebugLevel >= 4 )
	{
	if (pAmple_in->pLogFP != NULL)
	fprintf(pAmple_in->pLogFP, "Entering entry %s.\n", key );
	fflush( pAmple_in->pLogFP );
	}
if (key != NULL)
	dentry->pszAllomorph = duplicateString(key);
else
	dentry->pszAllomorph = duplicateString("");
dentry->pNext = NULL;
pAmple_in->pDictionary = addDataToTrie(pAmple_in->pDictionary,
					   key,
					   dentry,
					   add_entry,
					   pAmple_in->iMaxTrieDepth);
}

/****************************************************************************
 * NAME
 *    add_fd
 * ARGUMENTS
 *    rp    - pointer to string of fd's
 *    mde   - pointer to morpheme to add fd's to
 * DESCRIPTION
 *    Append the string of feature descriptors in rp onto the end of
 *      any that are already in the morpheme mde.
 * RETURN VALUE
 *    none
 */
static void add_fd(rp, mde, pAmple_in)
char *		rp;
AmpleMorpheme *	mde;
AmpleData *	pAmple_in;
{
int len;
char *s;
				/* Change nl's to spaces in input string */
for ( s = rp; *s; s++ )
	if ( *s == '\n' )
	*s = ' ';
				/* Append input string to previous fd */
if ( !mde->pszMorphFd )                   /* If no previous fd */
	mde->pszMorphFd = duplicateString( rp );     /* Allocate new */
else                                    /* Else (previous) append */
	{
	/*
	 *  Find new len, Realloc larger, Append space, Append new
	 */
	len = strlen( mde->pszMorphFd ) + strlen( rp ) + 2;
	mde->pszMorphFd = reallocMemory( mde->pszMorphFd, len );
	strcat( mde->pszMorphFd, " " );
	strcat( mde->pszMorphFd, rp );
	}
/*
 *  Trim spaces off the end of the fd
 */
s = mde->pszMorphFd;
s = s + strlen(s) - 1;              /* Find end of fd */
while ( s >= mde->pszMorphFd )        /* While in fd */
	if ( *s == ' ' || *s == '\t' )  /* If space or tab */
	*s-- = NUL;                /* Cut off space or tab */
	else                            /* Else (not space) break */
	break;
/*
 *  Find new len, Realloc smaller
 */
len = strlen( mde->pszMorphFd ) + 1;
mde->pszMorphFd = reallocMemory( mde->pszMorphFd, len );
/*
 *  Note that fd's are stored
 */
pAmple_in->iOutputFlags |= WANT_FEATURES;
}

/*****************************************************************************
 * NAME
 *    add_menv
 * ARGUMENTS
 *    ap - pointer to an allomorph structure which has a morpheme
 *         environment constraint
 * DESCRIPTION
 *    add the allomorph to the array of allomorphs for later checking of
 *    of the morpheme environments
 * RETURN VALUE
 *    none
 */
static void add_menv(ap, pAmple_in)
AmpleAllomorph *	ap;
AmpleData *		pAmple_in;
{
if (pAmple_in->ppAllomorphs == NULL)
	return;
if (pAmple_in->iAllomorphCount >= MAX_NUM_ALLOS)
	{
	if (pAmple_in->pLogFP != NULL)
	fprintf(pAmple_in->pLogFP,
	   "Warning:  Dictionary too big to do a morph check; disabling check.\n");
	if (pAmple_in->iDebugLevel > 0)
	{
	reportError(WARNING_MSG,
	"TOO MANY ALLOMORPH ENVIRONMENTS TO DO A MORPH CHECK; DISABLING CHECK.\n");
	if ((pAmple_in->pLogFP != NULL) && (pAmple_in->pLogFP != stdout))
		fprintf(pAmple_in->pLogFP,
	"TOO MANY ALLOMORPH ENVIRONMENTS TO DO A MORPH CHECK; DISABLING CHECK.\n");
	}
	freeAmpleMorphsForChecking(pAmple_in);
	}
else
	pAmple_in->ppAllomorphs[pAmple_in->iAllomorphCount++] = ap;
}

/*****************************************************************************
 * NAME
 *    add_morph
 * ARGUMENTS
 *    name - pointer to a morphname string
 * DESCRIPTION
 *    add the morphname to the array of morphnames
 * RETURN VALUE
 *    none
 */
static void add_morph(name, pAmple_in)
char *		name;
AmpleData *	pAmple_in;
{
if (pAmple_in->ppszMorphNames == NULL)
	return;
if (pAmple_in->iMorphNameCount >= MAX_NUM_MORPHS)
	{
	if (pAmple_in->pLogFP != NULL)
	fprintf(pAmple_in->pLogFP,
	   "Warning:  Dictionary too big to do a morph check; disabling check.\n");
	if (pAmple_in->iDebugLevel > 0)
	{
	reportError(WARNING_MSG,
		 "TOO MANY MORPHEMES TO DO A MORPH CHECK; DISABLING CHECK.\n");
	if ((pAmple_in->pLogFP != NULL) && (pAmple_in->pLogFP != stdout))
		fprintf(pAmple_in->pLogFP,
		 "TOO MANY MORPHEMES TO DO A MORPH CHECK; DISABLING CHECK.\n");
	}
	freeAmpleMorphsForChecking(pAmple_in);
	}
else
	pAmple_in->ppszMorphNames[pAmple_in->iMorphNameCount++] = name;
}

/*****************************************************************************
 * NAME
 *    freealist
 * DESCRIPTION
 *    frees up space used in creating any alist structures
 * RETURN VALUE
 *    none
 */
static void freealist(pAlloList_io, pAmple_in)
AmpleAllomorphList *	pAlloList_io;
AmpleData *		pAmple_in;
{
AmpleAllomorphList *	alp;

pAmple_in->iAlloListIndex = 0;
while (pAlloList_io)
	{
	alp = pAlloList_io;
	pAlloList_io = alp->pNext;
	alp->pNext = NULL;
	if (alp->bMallocString)
	{
	freeMemory( alp->pszAllomorph );
	alp->pszAllomorph = NULL;
	alp->bMallocString = FALSE;
	}
	if (    (alp >= pAmple_in->asAlloList) &&
		(alp < &pAmple_in->asAlloList[MAXALPS]))
	continue;
	freeMemory( (char *)alp );
	}

} /* end freealist */

/*****************************************************************************
 * NAME
 *    check_for_valid_mcc
 * DESCRIPTION
 *    write log error message if the MCC does not apply to this morpheme
 * RETURN VALUE
 *    none
 */
static void check_for_valid_mcc(pMCC_in, pszMorphName_in, pAmple_in)
AmpleMorphConstraint *	pMCC_in;
char *			pszMorphName_in;
AmpleData *		pAmple_in;
{
int			bValid;
AmpleMorphConstraint *	mr;

if ((pMCC_in == NULL) || (pszMorphName_in == NULL))
	return;
if ((pAmple_in == NULL) || (pAmple_in->pLogFP == NULL))
	return;
for ( bValid = FALSE, mr = pMCC_in ; mr ; mr = mr->pNext )
	{
	if (mr->pMorphs->bClass)
	continue;
	if (strcmp(mr->pMorphs->u.pszMorphName, pszMorphName_in) == 0)
	{
	bValid = TRUE;
	break;
	}
	}
if (!bValid)
	{
	fprintf(pAmple_in->pLogFP, szMisplacedConstraint_m,
		pAmple_in->pszAmpleDictErrorHeader,
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	fprintf(pAmple_in->pLogFP, "\t");
	writeAmpleMorphConstraint(pMCC_in, pAmple_in->pLogFP, FALSE);
	fprintf(pAmple_in->pLogFP, "\n");
	}
}

/*****************************************************************************
 * NAME
 *    fix_allomorph
 * DESCRIPTION
 *    apply any case conversions or orthography changes to the given allomorph
 *    string
 * RETURN VALUE
 *    pointer to dynamically allocated allomorph string
 */
static char * fix_allomorph(pszAllomorph_in, pAmple_in, bIsCaps_out)
char *		pszAllomorph_in;
AmpleData *	pAmple_in;
int *		bIsCaps_out;
{
char *  		pszLowered = NULL;
char *			pszFixed;
char *			p;
int			iLength;
int			iLowerLength;
size_t			uiSize;
size_t			uiOffset;
const unsigned char *	pszLow;

*bIsCaps_out = FALSE;
if (pAmple_in->bDictionaryCapitals)
	{
	  if (strstr(pszAllomorph_in, "[") == NULL &&
	  strstr(pszAllomorph_in, "^") == NULL &&
	  strstr(pszAllomorph_in, "]") == NULL)
	{
	  /*
	   *  if first real letter capitalized, then set flag, and lower it
	   */
	  for ( p = pszAllomorph_in ; *p != NUL ; p += iLength )
		{
		  iLength = matchUppercaseChar((unsigned char *)p,
					   &(pAmple_in->sTextCtl));
		  if (iLength != 0)
		{
		  *bIsCaps_out = TRUE;
		  pszLow = convUpperToLower((unsigned char *)p,
						&(pAmple_in->sTextCtl));
		  iLowerLength = strlen((char *)pszLow);
		  uiSize = strlen(pszAllomorph_in) + 1 + iLowerLength - iLength;
		  pszLowered = allocMemory( uiSize );
		  uiOffset = p - pszAllomorph_in;
		  if (uiOffset != 0)
			memcpy(pszLowered, pszAllomorph_in, uiOffset);
		  memcpy(pszLowered + uiOffset, pszLow, iLowerLength);
		  strcpy(pszLowered + uiOffset + iLowerLength, p + iLength);
		  pszFixed = applyChanges(pszLowered, pAmple_in->pDictOrthoChanges);
		  freeMemory(pszLowered);
		  return pszFixed;
		}
		  if (matchLowercaseChar((unsigned char *)p, &(pAmple_in->sTextCtl)))
		break;

		  iLength = matchCaselessChar((unsigned char *)p,
					  &(pAmple_in->sTextCtl));
		  if (iLength == 0)
		iLength = 1;
		}
	}
	}
return applyChanges(pszAllomorph_in, pAmple_in->pDictOrthoChanges);
}

/*****************************************************************************
 * NAME
 *    is_number
 * DESCRIPTION
 *    Check whether the character string is a number.
 * RETURN VALUE
 *    TRUE if the string consists only of digit characters ('0'-'9')
 */
int is_number(pszString_in)
char *	pszString_in;
{
char *	p;

if ((pszString_in == NULL) || (*pszString_in == NUL))
	return FALSE;
for ( p = pszString_in ; *p ; ++p )
	{
	if (!isdigit(*p))
	return FALSE;
	}
return TRUE;
}


/*****************************************************************************
 * NAME
 *    add_partial_redup_class_to_list
 * DESCRIPTION
 *
 * RETURN VALUE
 *    pointer to list of redup classes
 */
static PartialRedupIndexedClass * add_partial_redup_class_to_list(
		   PartialRedupIndexedClass * pIndexedStringClass,
	   PartialRedupIndexedClass * pIndexedStringClasses_io)
{
  /* maintain the list in the actual order they occur */
  pIndexedStringClass->pNext = NULL;
  if (pIndexedStringClasses_io == NULL)
	pIndexedStringClasses_io = pIndexedStringClass;
  else
	{
	  PartialRedupIndexedClass * pIndexedClass;
	  for (pIndexedClass = pIndexedStringClasses_io;
	   pIndexedClass != NULL;
	   pIndexedClass = pIndexedClass->pNext)
	{
	  if (pIndexedClass->pNext == NULL)
		{
		  pIndexedClass->pNext = pIndexedStringClass;
		  break;
		}
	}
	}
  return pIndexedStringClasses_io;
  }

/*****************************************************************************
 * NAME
 *    build_redup_classes
 * DESCRIPTION
 *
 * RETURN VALUE
 *    pointer to list of redup classes
 */
static PartialRedupIndexedClass *
	 build_redup_classes(char * pszAllo_in,
			 int * pbBad_io,
			 PartialRedupIndexedClass * pIndexedStringClasses_io,
			 AmpleData * pAmple_in)
{
char *			p;
char *			q;
char			cSave = NUL;
PartialRedupIndexedClass * pIndexedStringClass;

/*
 *  check for a string class in the allomorph string
 */
if (	(*pszAllo_in == '[') &&
	((p = strchr(pszAllo_in, ']')) != NULL) &&
	(matchAlphaChar((unsigned char *)pszAllo_in,
			&pAmple_in->sTextCtl) == 0) &&
	(matchAlphaChar((unsigned char *)"]", &pAmple_in->sTextCtl) == 0))
	{
	pIndexedStringClass = (PartialRedupIndexedClass *)allocMemory(
				sizeof(PartialRedupIndexedClass));
	cSave = *p;
	*p    = NUL;		/* remove ']' to limit class marker string */
	q = strrchr(pszAllo_in+1, '^');
	if ((q == NULL) || !is_number(q+1))
	{
	if (pAmple_in->pLogFP != NULL)
		fprintf(pAmple_in->pLogFP, szNoRedupClassIndex_m,
			pAmple_in->pszAmpleDictErrorHeader, pszAllo_in+1,
			getAmpleRecordIDTag(szRecordKey_g,
					pAmple_in->uiRecordCount));
	return pIndexedStringClasses_io;
	}
	*q = NUL;			/* strip off index to look up class */
	pIndexedStringClass->pStringClass = findStringClass(pszAllo_in+1,
						pAmple_in->pStringClasses);
	pIndexedStringClass->iIndex = atoi(q+1);
	pIndexedStringClasses_io = add_partial_redup_class_to_list(
			  pIndexedStringClass, pIndexedStringClasses_io);
	*q = '^';			/* restore index */
	*p = cSave;			/* restore ']' */
	if (pIndexedStringClass->pStringClass == NULL)
	{
	/* print error message */
	*p = NUL;
	if (pAmple_in->pLogFP != NULL)
		fprintf(pAmple_in->pLogFP, szBadRedupClass_m,
			pAmple_in->pszAmpleDictErrorHeader, pszAllo_in+1,
			getAmpleRecordIDTag(szRecordKey_g,
					pAmple_in->uiRecordCount));
	*p = cSave;
	return pIndexedStringClasses_io;
	}
	else
	return build_redup_classes(p+1,
				   pbBad_io,
				   pIndexedStringClasses_io,
				   pAmple_in);
	}
else
  {
	p = strchr(pszAllo_in, '[');
	if (p != NULL)
	  {
	pIndexedStringClass = (PartialRedupIndexedClass *)allocMemory(
					sizeof(PartialRedupIndexedClass));
	*p = NUL;  /* temporarily put null here so can copy */
	pIndexedStringClass->pszCharacters = duplicateString(pszAllo_in);
	*p = '[';  /* restore the bracket */
	pIndexedStringClasses_io = add_partial_redup_class_to_list(
							   pIndexedStringClass, pIndexedStringClasses_io);
	return build_redup_classes(p,
				   pbBad_io,
				   pIndexedStringClasses_io,
				   pAmple_in);
	  }
  }
return pIndexedStringClasses_io;
}
/*****************************************************************************
 * NAME
 *    freeIndexedStringClasses
 * DESCRIPTION
 *    free the memory allocated for a PartialRedupIndexedClass
 * RETURN VALUE
 *    none
 */
void freeIndexedStringClasses(PartialRedupIndexedClass * pPartialRedupClasses_in)
{
PartialRedupIndexedClass * pRedup;
PartialRedupIndexedClass * pRedupNext;
if (pPartialRedupClasses_in == NULL)
	return;
 for (pRedup = pPartialRedupClasses_in;
	  pRedup != NULL;
	  pRedup = pRedupNext)
   {
	 freeMemory( pRedup->pszMember );
	 pRedupNext = pRedup->pNext;
	 freeMemory(pRedup);
   }
}


/*****************************************************************************
 * NAME
 *    freePartialRedupAllos
 * DESCRIPTION
 *    free the memory allocated for a partial reduplication allomorph
 * RETURN VALUE
 *    none
 */
void freePartialRedupAllos(PartialReduplication * pPartialRedupAllos_in)
{
PartialReduplication * pRedup;
PartialReduplication * pRedupNext;
if (pPartialRedupAllos_in == NULL)
	return;
 for (pRedup = pPartialRedupAllos_in;
	  pRedup != NULL;
	  pRedup = pRedupNext)
   {
	freeMemory( pRedup->pszPrefix );
	freeMemory( pRedup->pszPostfix );
	freeIndexedStringClasses(pRedup->pIndexedStringClasses);
	pRedupNext = pRedup->pNext;
	freeMemory(pRedup);
   }
}

/*****************************************************************************
 * NAME
 *    build_allomorphs
 * DESCRIPTION
 *    parse an allomorph record to add one or more allomorphs to the list of
 *    allomorphs for this morpheme
 *
 *    This handles simple allomorph strings, null allomorphs marked by a
 *    literal '0', and reduplication allomorphs using indexed string classes
 *    in the allomorph string
 * RETURN VALUE
 *    pointer to list of allomorphs
 */
static AmpleAllomorphList * build_allomorphs(pszAllo_in, pszRecord_in,
						 pHead_io, iDicType_in, pMorph_io,
						 pbBad_io, pAmple_in)
char *			pszAllo_in;
char *			pszRecord_in;
AmpleAllomorphList *	pHead_io;
int			iDicType_in;
AmpleMorpheme *		pMorph_io;
int *			pbBad_io;
AmpleData *		pAmple_in;
{
AmpleAllomorphList * alp;
char * pszFullRedup;
char * pszPartialRedup;
char * pszPartialRedup2;
char                 szTokenBuffer[BUFSIZE];
int iTokenLen;
int                  bIsCaps = FALSE;
int		     bAlloc;
char *		     pszAllo;
char *		     pszCopy;
char *		     pszEnd;
char *		     rp;
char *		     pszEnv;
PartialReduplication *pPartialRedupAllo = NULL;
if (pszAllo_in == NULL)
  return pHead_io;
if (strcmp(pszAllo_in, "0") == 0)
  {
	bAlloc  = FALSE;
	pszAllo = "";
  }
 else
   {
	 bAlloc  = TRUE;
	 pszAllo = fix_allomorph(pszAllo_in,
				 pAmple_in,
				 &bIsCaps);
	 validateAmpleString(pszAllo,
			 "allomorph",
			 getAmpleRecordIDTag(szRecordKey_g,
						 pAmple_in->uiRecordCount),
			 pszAllo,
			 pAmple_in->pszValidChars,
			 pAmple_in->pLogFP);
   }
#ifdef HAVE_ALLOCA
pszCopy = strcpy((char *)alloca(strlen(pszRecord_in)+1), pszRecord_in);
#else
pszCopy = duplicateString(pszRecord_in);
#endif
pszEnd  = pszCopy;

	/*
	 * make alist & allomorph structures
	 */
alp = pHead_io = mkalist(pHead_io, iDicType_in, pMorph_io, pAmple_in);
pszFullRedup = strstr(pszAllo_in, FULLREDUP);
if (pszFullRedup != NULL)
{
  FullReduplication *pFullRedupAllo = (FullReduplication *)allocMemory(sizeof(FullReduplication));
  pFullRedupAllo->pAllo = alp->pAllomorph;
  pFullRedupAllo->iDicType = iDicType_in;
  iTokenLen = pszFullRedup - pszAllo_in;
  if (iTokenLen > 0)
	{
	  memset(szTokenBuffer, 0, BUFSIZE);
	  strncpy(szTokenBuffer, pszAllo_in, iTokenLen);
	  pFullRedupAllo->pszPrefix = duplicateString(szTokenBuffer);
	}
  else
	pFullRedupAllo->pszPrefix = NULL;
  iTokenLen = strlen(pszFullRedup) - FULLREDUPLEN;
  if (iTokenLen > 0)
	{
	  memset(szTokenBuffer, 0, BUFSIZE);
	  strcpy(szTokenBuffer, pszFullRedup + FULLREDUPLEN);
	  pFullRedupAllo->pszPostfix = duplicateString(szTokenBuffer);
	}
  else
	pFullRedupAllo->pszPostfix = NULL;
  pFullRedupAllo->pNext = pAmple_in->pFullRedupAllos;
  pAmple_in->pFullRedupAllos = pFullRedupAllo;
}
pszPartialRedup = strstr(pszAllo_in, "[");
 pszPartialRedup2 = strstr(pszAllo_in, "^"); // look for index, too
if (pszPartialRedup != NULL && pszPartialRedup2 != NULL)
  {
	char * pszPartialPostfix;
	pPartialRedupAllo = (PartialReduplication *)allocMemory(sizeof(PartialReduplication));
	pPartialRedupAllo->pIndexedStringClasses = build_redup_classes(pszPartialRedup,
								   pbBad_io, NULL, pAmple_in);
	pPartialRedupAllo->pAllo = alp->pAllomorph;
	pPartialRedupAllo->iDicType = iDicType_in;
	iTokenLen = pszPartialRedup - pszAllo_in;
	if (iTokenLen > 0)
	  {
	memset(szTokenBuffer, 0, BUFSIZE);
	strncpy(szTokenBuffer, pszAllo_in, iTokenLen);
	pPartialRedupAllo->pszPrefix = duplicateString(szTokenBuffer);
	  }
	else
	  pPartialRedupAllo->pszPrefix = NULL;
	pszPartialPostfix = strrchr(pszAllo_in, ']');
	if (pszPartialPostfix != NULL)
	  {
	pszPartialPostfix++;
	iTokenLen = pszAllo_in + strlen(pszAllo_in) - pszPartialPostfix;
	if (iTokenLen > 0)
	  {
		memset(szTokenBuffer, 0, BUFSIZE);
		strcpy(szTokenBuffer, pszPartialPostfix);
		pPartialRedupAllo->pszPostfix = duplicateString(szTokenBuffer);
	  }
	else
	  pPartialRedupAllo->pszPostfix = NULL;
	  }
	pPartialRedupAllo->pNext = pAmple_in->pPartialRedupAllos;
	pAmple_in->pPartialRedupAllos = pPartialRedupAllo;
  }

if (bAlloc && bIsCaps)
  alp->pAllomorph->iMORPHTYPE |= ISCAPS;
	 /*
	  *  set allo string pointer
	  */
alp->bMallocString = bAlloc;
alp->pszAllomorph  = pszAllo;
	 /*
	  *  set the allomorph ID
	  */
	 alp->pAllomorph->pszAllomorphID = NULL;
if (*pszEnd == '{')
  {
	rp     = pszEnd;
	pszEnd = isolateWord(rp);
	if (pAmple_in->bEnableAllomorphIDs)
	  alp->pAllomorph->pszAllomorphID = get_allomorph_id(rp);
  }
/*
 *  set any allomorph properties
 */
alp->pAllomorph->sPropertySet.pProperties = NULL;
rp = parseAmplePropertySet(pszEnd,
			   &(alp->pAllomorph->sPropertySet),
			   AMPLE_ALLO_PROP,
			   pAmple_in->uiRecordCount,
			   szRecordKey_g,
			   pAmple_in->pszAmpleDictErrorHeader,
			   &pAmple_in->sProperties,
			   &pAmple_in->pPropertySets,
			   pAmple_in->pLogFP);
/*
 *  create any allomorph condition structures needed for this
 *  allomorph
 */
pszEnv = rp;
alp->pAllomorph->pEnvironment = parseAmpleAlloEnvConstraint(
						pszEnv,
						pbBad_io,
						pAmple_in->uiRecordCount,
						szRecordKey_g,
						pAmple_in->pDictOrthoChanges,
						pAmple_in->pCategories,
						&pAmple_in->sProperties,
						pAmple_in->pCategoryClasses,
						pAmple_in->pMorphClasses,
						pAmple_in->pStringClasses,
						/* 3.3.0 hab */
						pAmple_in->pPunctClasses,
						pAmple_in->pszValidChars,
						pAmple_in->pLogFP,
						&pAmple_in->pEnvStrings,
						NULL);
 if (*pbBad_io)
   {
	 if (pszPartialRedup != NULL && pPartialRedupAllo != NULL)
	   {
	 /* delink it from list - it is not valid */
	 pAmple_in->pPartialRedupAllos = pPartialRedupAllo->pNext;
	 freePartialRedupAllos(pPartialRedupAllo);
	   }
	 /* need to do same for full redup */
   }
/*
 *  free temporarily allocated memory
 */
#ifndef HAVE_ALLOCA
freeMemory(pszCopy);
#endif
if (pszEnv != rp)
  freeMemory(pszEnv);
 return pHead_io;
}

/*****************************************************************************
 * NAME
 *    afx_create
 * DESCRIPTION
 *    fills in data structure for a source dialect AmpleAffixInfo (prefix or
 *    suffix) dictionary entry.
 * RETURN VALUE
 *    none
 */
static void afx_create(recp, dtype, pAmple_in)
char *		recp;		/* pointer to a dictionary record */
int		dtype;		/* AMPLE_PFX for prefix dictionary,
				   AMPLE_SFX for suffix */
AmpleData *	pAmple_in;
{
AmpleAffixInfo *	de;
AmpleMorpheme *		mde;
AmpleMorphConstraint *	mr          = NULL;
PropertySet_t		mproperties;
AmpleAllomorphList *	head        = NULL;
AmpleAllomorphList *	alp;
char *			rp;
char *			end;
#ifndef hab360
char *			pszNext;
#endif
int			code;
long			ord;
/*
 *  flags for checking for valid affix dictionary entry
 */
int			bDidMorphName  = FALSE;		/* need exactly one */
int			bDidAllomorph  = FALSE;		/* need at least one */
int			bDidCatPair    = FALSE;		/* need at least one */
int			bDidOrderClass = FALSE;		/* need at most one */
int			bHadEmptyAllomorph    = FALSE;
int			bHadInvalidAllomorph  = FALSE;
int			bBadAllomorph         = FALSE;
int			bIsElsewhereAllomorph = FALSE;
char *			pszMorphName = NULL;
char *			pszMorph     = NULL;
int			i;
int			iAlloCount;
AmpleAllomorphList *	pPrevAllos  = NULL;
char *                  pszAlloID = NULL;

initalist(pAmple_in);
mproperties.pProperties = NULL;
/*
 *  allocate space for dict entry
 */
de  = (AmpleAffixInfo *)allocMemory(sizeof(AmpleAffixInfo));
mde = (AmpleMorpheme *) allocMemory(sizeof(AmpleMorpheme));
mde->pszMorphFd        = NULL;		/* clear feature descriptor pointer */
mde->pszUnderForm      = NULL;		/* clear underlying form    pointer */
mde->pMorphConstraints = NULL;
#ifdef EXPERIMENTAL
mde->pszPATRCat        = NULL;
mde->pPATRFeature      = NULL;
#endif /* EXPERIMENTAL */
/*
 *  link the morpheme into the global list for possible later deletion
 */
if (pAmple_in->pLastMorpheme == NULL)
	{
	mde->pLink = pAmple_in->pAmpleMorphemes;
	pAmple_in->pAmpleMorphemes = mde;
	}
else
	{
	mde->pLink = NULL;
	pAmple_in->pLastMorpheme->pLink = mde;
	}
pAmple_in->pLastMorpheme = mde;
/*
 *  fill in fields according to codes in record
 */
rp = recp;
while (*rp != NUL)
	{
	/* field code is first char on line */
	code = *rp++;
	/* rp on data, skip over white space */
	rp += strspn(rp, szWhitespace_m);
	/* fill in affix_info according to code */
	switch (code)
	{
	case 'M':     /* morphname */
		/* only use first word */
		end = isolateWord(rp);

		/* check for too large a morphname (warning only) */
		pAmple_in->iMorphnameSize = strlen(rp);
		if (    (pAmple_in->iMorphnameSize >
			 pAmple_in->iMaxMorphnameLength) &&
			(pAmple_in->iMorphnameSize <= MAXMORPH) )
		{
		/* print error message */
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szMorphnameWarning_m,
				pAmple_in->pszAmpleDictErrorHeader, ' ', rp,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount));
		}

		/* check for too large a morphname */
		if ( pAmple_in->iMorphnameSize > MAXMORPH )
		{
		*(rp+MAXMORPH) = NUL;      /* truncate morphname */
		/* print error message */
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szMorphnameTooLong_m,
				pAmple_in->pszAmpleDictErrorHeader, ' ', rp,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount));
		}
		if (bDidMorphName)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoMorphnames_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
				pszMorphName, rp);
		}
		else
		{
		pszMorphName = duplicateString(rp);
		bDidMorphName = TRUE;
		}
		rp = end + strlen(end);
		break;

	case 'E':        /* Elsewhere allomorph */
		bIsElsewhereAllomorph = TRUE;
		/*
		 *  NOTE: there is no 'break' statement here on purpose: this
		 *  entry needs to be processed as an allomorph and so it needs
		 *  to fall through to the 'A' case
		 */
	case 'A':     /* surface form (allomorph) */
		if (strcmp(rp,"") == 0)		/* check for empty field */
		{
		bHadEmptyAllomorph = TRUE;	/* set error message flag */
		break;				/* ignore an empty field */
		}
		end = rp + strlen(rp);
		pPrevAllos = head;
		head = build_allomorphs(rp,
					isolateWord(rp),
					head,
					dtype,
					mde,
					&bBadAllomorph,
					pAmple_in);
		/* If there is an allomorph ID, replace the NUL with a space
		 * so that if this record gets processed again due to there
		 * being more than one morph type, the allomorph ID will be
		 * found. */
		pszAlloID = rp + strlen(rp);
		if (pszAlloID < end)
		  *pszAlloID = ' ';
		for ( alp = head ; alp && (alp != pPrevAllos) ; alp = alp->pNext )
		{
		alp->pAllomorph->pAFFIX = de;	/* set affix_info pointer */
		if (bIsElsewhereAllomorph)
			alp->pAllomorph->iAllomorphFlags |= ELSEWHERE;
		}
		bIsElsewhereAllomorph = FALSE;
		/*
		 *  set underlying form pointer if this is an elsewhere case,
		 *  and an underlying form has not been found (yet)
		 */
		if (    bIsElsewhereAllomorph &&
			(pAmple_in->iOutputFlags & WANT_UNDERLYING) &&
			(mde->pszUnderForm == NULL) &&
			(head != NULL) )
		mde->pszUnderForm = duplicateString(head->pszAllomorph);
		/*
		 *  one failure ruins all
		 */
		bHadInvalidAllomorph |= bBadAllomorph;
		bDidAllomorph = TRUE;
		rp = end;
		break;

	case 'O':     /* orderclass (is negative for prefixes) */
#ifndef hab360
		end = rp + strlen(rp); /* save end of line position */
#endif
		if (bDidOrderClass)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoOrderclasses_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
#ifdef hab360
/*			    de->iOrderClass, rp);*/
#else
				de->iOrderClass, de->iOrderClassMax, rp);
#endif
		}
		else
		{
#ifdef hab360
/*		ord = atol(rp);*/
/*		if (ord < -32767)*/
/*		    {*/
/*		    if (pAmple_in->pLogFP != NULL)*/
/*			fprintf(pAmple_in->pLogFP, szBadOrderclass_m,*/
/*			     pAmple_in->pszAmpleDictErrorHeader, ord, -32767,*/
/*				getAmpleRecordIDTag(szRecordKey_g,*/
/*						  pAmple_in->uiRecordCount));*/
/*		    ord = -32767L;*/
/*		    }*/
/*		else if (ord > 32767)*/
/*		    {*/
/*		    if (pAmple_in->pLogFP != NULL)*/
/*			fprintf(pAmple_in->pLogFP, szBadOrderclass_m,*/
/*			      pAmple_in->pszAmpleDictErrorHeader, ord, 32767,*/
/*				getAmpleRecordIDTag(szRecordKey_g,*/
/*						  pAmple_in->uiRecordCount));*/
/*		    ord = 32767L;*/
/*		    }*/
/*		de->iOrderClass = (short)ord;*/
#else  /* hab360 */
		for (i = 0; i < 2; i++)
		  {
			pszNext = isolateWord(rp);
			ord = parseAmpleOrderClass(rp, pAmple_in);
			if (i == 0)
			  de->iOrderClass = (short)ord;
			else
			  {
			if ((de->iOrderClass != 0) &&
				 ord == 0)
				/* there was no second orderclass */
			  de->iOrderClassMax = de->iOrderClass;
			else	/* there was a second orderclass */
			  {
				if (ord >= de->iOrderClass)
				  de->iOrderClassMax = (short)ord;
				else
				  if (pAmple_in->pLogFP != NULL)
				{
				  fprintf(pAmple_in->pLogFP, szBadOrderclassMax_m,
					  pAmple_in->pszAmpleDictErrorHeader, ord, de->iOrderClass,
					  getAmpleRecordIDTag(szRecordKey_g,
								  pAmple_in->uiRecordCount));
				  de->iOrderClassMax = de->iOrderClass;
				}
			  }
			  }
			rp = pszNext;
		  }
#endif /* hab360 */
		bDidOrderClass = TRUE;
		}
#ifdef hab360
/*	    rp = rp + strlen(rp);*/
#else
		rp = end;
#endif
		break;

	case 'P':         /* morpheme properties */
		end = rp + strlen(rp); /* save end of line position */
		rp = parseAmplePropertySet(rp,
					   &mproperties,
					   AMPLE_MORPH_PROP,
					   pAmple_in->uiRecordCount,
					   szRecordKey_g,
					   pAmple_in->pszAmpleDictErrorHeader,
					   &pAmple_in->sProperties,
					   &pAmple_in->pPropertySets,
					   pAmple_in->pLogFP);
		rp = end;
		break;

	case 'C':     /* category */
		end = rp + strlen(rp); /* save end of line position */
		/*
		 *  parse category list into pairs
		 */
		cat_list(rp, de, pAmple_in->uiRecordCount, pAmple_in);
		bDidCatPair = (de->pFromCategories != NULL) &&
		  (de->pToCategories != NULL); /* hab 3.2.4 */
		rp = end;
		break;

	case 'Z':     /* morpheme co-occurrence constraint */
		end = rp + strlen(rp);
		mr = parseAmpleMorphConstraint( rp, pAmple_in);
		if (mr != (AmpleMorphConstraint *)NULL)
		{
		mr->pNext = mde->pMorphConstraints;
		mde->pMorphConstraints = mr;
		}
		rp = end;
		break;

	case 'F':         /* feature descriptors */
		end = rp + strlen(rp);
		add_fd( rp, mde, pAmple_in);
		rp = end;
		break;

	case 'U':         /* underlying form */
		end = isolateWord(rp);
		if (mde->pszUnderForm != NULL)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoUnderlyingForms_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
				mde->pszUnderForm, rp);
		}
		else
		mde->pszUnderForm = duplicateString(rp);
		rp = end;
		break;

#ifdef EXPERIMENTAL
	case 'c':	/* PATR category */
		end = isolateWord(rp);
		if (mde->pszPATRCat != NULL)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoPATRCats_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
				mde->pszPATRCat, rp);
		}
		else
		mde->pszPATRCat = setPATRCategory(rp, pAmple_in);
		rp = end;
		break;

	case 'f':	/* PATR feature structures */
		end = rp += strlen(rp);
		mde->pPATRFeature = setPATRFeature(mde->pPATRFeature, rp,
						   pAmple_in);
		rp = end;
		break;

#endif /* EXPERIMENTAL */
	} /* end switch */

	/* pass over rest of line */
	while (*rp++ != NUL);

	} /* end of record */
/*
 *  set the allomorph ID strings if not already set
 */
if (pAmple_in->bEnableAllomorphIDs)
	{
	pszMorph = pszMorphName;
	if (pszMorph == NULL)
	pszMorph = "";
	for ( iAlloCount = 0, alp = head ; alp ; alp = alp->pNext, ++iAlloCount )
	;
	for ( i = iAlloCount, alp = head ; alp ; alp = alp->pNext, --i )
	{
	if (alp->pAllomorph->pszAllomorphID == NULL)
		alp->pAllomorph->pszAllomorphID = build_allomorph_id(pszMorph, i);
	}
	}
/*
 *  verify that mcc's apply to only this morpheme
 */
if (bDidMorphName)
	check_for_valid_mcc(mde->pMorphConstraints, pszMorphName, pAmple_in);
/*
 *  propagate morpheme global values to each allomorph
 */
for ( alp = head ; alp ; alp = alp->pNext )
	{
	/* set any morpheme props */
	mergeAmplePropertySets( &alp->pAllomorph->sPropertySet,
				mproperties,
				pAmple_in->uiRecordCount,
				szRecordKey_g,
				&pAmple_in->sProperties,
				&pAmple_in->pPropertySets);
	alp->pAllomorph->pMORPHNAME = pszMorphName;   /* save morpheme name */
	/* print debugging info */
	if (pAmple_in->bDebugAllomorphConds)
	showAmpleAlloEnvConstraint(alp, pAmple_in->pszDicType, pAmple_in->pLogFP);
	if (    bDidMorphName && bDidAllomorph && bDidCatPair &&
		!bHadInvalidAllomorph)
	{
	/*
	 *  enter allomorph into trie
	 */
	if (isAmpleAllomorphSelected(pszMorphName,
					 alp->pszAllomorph, pAmple_in))
		{
		/*
		 *  if no select list, or if morphname or allo in select list
		 */
		alp->pAllomorph->iAllomorphFlags |= ACTIVE;
		}
	alp->pAllomorph->pNextAllomorph =
					   alp->pAllomorph->pMorpheme->pAllomorphs;
	alp->pAllomorph->pMorpheme->pAllomorphs = alp->pAllomorph;
	enter_entry( alp->pszAllomorph, alp->pAllomorph, pAmple_in);
	if (	(alp->pAllomorph->pEnvironment != NULL) &&
		(alp->pAllomorph->pEnvironment->pMorphCond != NULL) )
		add_menv( alp->pAllomorph, pAmple_in);
	}
	}

if (	bDidMorphName && bDidAllomorph && bDidCatPair &&
	!bHadInvalidAllomorph &&
	(pAmple_in->ppszMorphNames != NULL) )
	add_morph( pszMorphName, pAmple_in);
mproperties.pProperties = NULL;                    /* clear for next time */

/* checks for a valid record */
if (pAmple_in->pLogFP != NULL)
	{
	if (!bDidMorphName)
	fprintf(pAmple_in->pLogFP, szLoadError_m,
		pAmple_in->pszAmpleDictErrorHeader, "morphname",
		getAmpleRecordIDTag(szRecordKey_g,
					pAmple_in->uiRecordCount));
	if (!bDidAllomorph)
	fprintf(pAmple_in->pLogFP, szLoadError_m,
		pAmple_in->pszAmpleDictErrorHeader, "allomorph",
		getAmpleRecordIDTag(szRecordKey_g,
					pAmple_in->uiRecordCount));
	if (!bDidCatPair)
	fprintf(pAmple_in->pLogFP, szLoadError_m,
		pAmple_in->pszAmpleDictErrorHeader, "category pair",
		getAmpleRecordIDTag(szRecordKey_g,
					pAmple_in->uiRecordCount));
	if(bHadEmptyAllomorph)
	fprintf(pAmple_in->pLogFP, szEmptyAllomorph_m,
		pAmple_in->pszAmpleDictErrorHeader,
		getAmpleRecordIDTag(szRecordKey_g,
					pAmple_in->uiRecordCount));
#ifdef PROPDEBUG
	disp_allo(head, dictype);
#endif /* PROPDEBUG */
	}
/* cleanup uselessly allocated memory */
if (!bDidAllomorph)
	{
	freeAmpleAffixInfo(de);
	if (bDidMorphName)
	freeMemory(pszMorphName);
	}
freealist(head, pAmple_in);
} /* end afx_create */

/***************************************************************************
 * NAME
 *    infix_locate
 * DESCRIPTION
 *    Read the infix location ('L') field from an infix dictionary record,
 *    setting the ifx_ok and ifx_env fields accordingly.
 * RETURN VALUE
 *    none
 */
static void infix_locate(recp, ip, rec_read, rec_key, pAmple_in)
char *		recp;		/* pointer to infix location field */
AmpleInfixInfo *ip;		/* pointer to infix dictionary entry struct */
int		rec_read;	/* number of records read from dictionary */
char *		rec_key;	/* pointer to key of record */
AmpleData *	pAmple_in;
{
register char *p;
/*
 *  set the bits for what kinds of morphemes this infix can appear in
 */
for (   ip->iInfixLoc = NUL, p = recp + strspn(recp, szWhitespace_m) ;
	(*p != NUL) && (*p != '/') && !matchBeginning(p,"+/") ;
	p = recp )
	{
	recp = isolateWord(p);	/* split off the next word */
	strlwr(p);			/* convert to lowercase */
	if (    (strcmp(p,"root")  == 0) ||
		(strcmp(p,"roots") == 0) )
	ip->iInfixLoc |= AMPLE_ROOT;
	else if ((strcmp(p,"prefix")   == 0) ||
		 (strcmp(p,"prefixes") == 0) )
	ip->iInfixLoc |= AMPLE_PFX;
	else if ((strcmp(p,"suffix")   == 0) ||
		 (strcmp(p,"suffixes") == 0) )
	ip->iInfixLoc |= AMPLE_SFX;
	else
	{
	if (pAmple_in->pLogFP != NULL)
		fprintf(pAmple_in->pLogFP,
		 "%sInvalid morpheme type %s in location field in entry: %s\n",
			pAmple_in->pszAmpleDictErrorHeader, p,
			getAmpleRecordIDTag(rec_key,
					pAmple_in->uiRecordCount));
	}
	}
if (ip->iInfixLoc == NUL)
	{
	if (pAmple_in->pLogFP != NULL)
	fprintf(pAmple_in->pLogFP,
		"%sNo morpheme type in location field in entry: %s\n",
		pAmple_in->pszAmpleDictErrorHeader,
		getAmpleRecordIDTag(rec_key, pAmple_in->uiRecordCount));
	}
/*
 *  fix the overall possible location flag
 */
pAmple_in->iInfixLocations |= ip->iInfixLoc;
/*
 *  finally, parse the string environment for the infix
 */
ip->pInfixEnv = parseAmpleInfixEnvConstraint(p,
						 pAmple_in->uiRecordCount,
						 szRecordKey_g,
						 pAmple_in->pDictOrthoChanges,
						 pAmple_in->pCategories,
						 &pAmple_in->sProperties,
						 pAmple_in->pCategoryClasses,
						 pAmple_in->pMorphClasses,
						 pAmple_in->pStringClasses,
						 pAmple_in->pszValidChars,
						 pAmple_in->pLogFP,
						 &pAmple_in->pEnvStrings/*NULL*/);
/*
 *  if they don't give us an environment, don't let anything pass
 */
if (ip->pInfixEnv == (AmpleEnvConstraint *)NULL)
	ip->iInfixLoc = 0;
}

/***************************************************************************
 * NAME
 *    ifx_create
 * DESCRIPTION
 *    Fill in the infix_info data structure for an infix dictionary entry
 * RETURN VALUE
 *    none
 */
static void ifx_create(recp, dtype, pAmple_in)
char *		recp;	/* pointer to a record of the dictionary file */
int		dtype;		/* AMPLE_IFX ot AMPLE_NFXIFX */
AmpleData *	pAmple_in;
{
AmpleInfixInfo *	de;
AmpleMorpheme *		mde;
AmpleMorphConstraint *	mr          = NULL;
PropertySet_t		mproperties;
AmpleAllomorphList *	head        = NULL;
AmpleAllomorphList *	alp;
char *			rp;
char *			end;
#ifndef hab360
char *			pszNext;
#endif
int			code;
long			ord;
/*
 *  flags for checking for valid infix dictionary entry
 */
int			bDidMorphName         = FALSE;	/* need exactly one */
int			bDidAllomorph         = FALSE;	/* need at least one */
int			bDidCatPair           = FALSE;	/* need at least one */
int			bDidInfixLocation     = FALSE;	/* need exactly one */
int			bDidOrderClass        = FALSE;	/* need at most one */
int			bHadEmptyAllomorph    = FALSE;
int			bHadInvalidAllomorph  = FALSE;
int			bBadAllomorph         = FALSE;
int			bIsElsewhereAllomorph = FALSE;
char *			pszMorphName = NULL;
char *			pszMorph     = NULL;
int			i;
int			iAlloCount;
AmpleAllomorphList *	pPrevAllos  = NULL;

initalist(pAmple_in);
mproperties.pProperties = NULL;
/*
 *  allocate space for dict entry
 */
de  = (AmpleInfixInfo *)allocMemory(sizeof(AmpleInfixInfo));
mde = (AmpleMorpheme *) allocMemory(sizeof(AmpleMorpheme));
mde->pszMorphFd        = NULL;		/* clear feature descriptor pointer */
mde->pszUnderForm      = NULL;		/* clear underlying form    pointer */
mde->pMorphConstraints = NULL;
#ifdef EXPERIMENTAL
mde->pszPATRCat        = NULL;
mde->pPATRFeature      = NULL;
#endif /* EXPERIMENTAL */
/*
 *  link the morpheme into the global list for possible later deletion
 */
if (pAmple_in->pLastMorpheme == NULL)
	{
	mde->pLink = pAmple_in->pAmpleMorphemes;
	pAmple_in->pAmpleMorphemes = mde;
	}
else
	{
	mde->pLink = NULL;
	pAmple_in->pLastMorpheme->pLink = mde;
	}
pAmple_in->pLastMorpheme = mde;

rp = recp;      /* fill in fields according to codes in record */
while (*rp != NUL)
	{
	code = *rp++;       /* field code is first char on line */
	rp += strspn(rp, szWhitespace_m);	/* rp on data, skip over white space */
	switch (code)       /* fill in infix_info according to code */
	{
	case 'C':                       /* category */
		end = rp + strlen(rp);  /* save end of line position */
		/*
		 *  parse category list into pairs
		 */
		cat_list(rp, (AmpleAffixInfo *)de, pAmple_in->uiRecordCount,
			 pAmple_in);
		bDidCatPair = (de->pFromCategories != NULL) &&
		  (de->pToCategories != NULL); /* hab 3.2.4 */
		rp = end;
		break;

	case 'L':           /* infix location */
		if (*rp == NUL)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP,
				"%sEmpty location field in entry: %s\n",
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount) );
		}
		else if (bDidInfixLocation)
		{
		if (pAmple_in->pLogFP != NULL)
			{
			fprintf(pAmple_in->pLogFP, szTwoLocations_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount));
			if (de->iInfixLoc & AMPLE_ROOT)
			fprintf(pAmple_in->pLogFP, "root ");
			if (de->iInfixLoc & AMPLE_PFX)
			fprintf(pAmple_in->pLogFP, "prefix ");
			if (de->iInfixLoc & AMPLE_SFX)
			fprintf(pAmple_in->pLogFP, "suffix ");
			writeAmpleEnvConstraint(pAmple_in->pLogFP,
						de->pInfixEnv, FALSE);
			fprintf(pAmple_in->pLogFP, szIgnoredMultiple_m, rp);
			}
		rp += strlen(rp);
		}
		else
		{
		end = rp + strlen(rp);  /* save end of line position */
		/* parse infix location field */
		infix_locate(rp, de, pAmple_in->uiRecordCount, szRecordKey_g,
				 pAmple_in);
		bDidInfixLocation = TRUE;
		rp = end;
		}
		break;

	case 'M':           /* morpheme name */
		end = isolateWord(rp);	/* use first word only */

		/* check for too large a morphname (warning only) */
		pAmple_in->iMorphnameSize = strlen(rp);
		if (    (pAmple_in->iMorphnameSize >
			 pAmple_in->iMaxMorphnameLength) &&
			(pAmple_in->iMorphnameSize <= MAXMORPH) )
		{
		/* print error message */
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szMorphnameWarning_m,
				pAmple_in->pszAmpleDictErrorHeader, ' ', rp,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount));
		}
		/* check for too large a morphname */
		if (pAmple_in->iMorphnameSize > MAXMORPH)
		{
		*(rp+MAXMORPH) = NUL;  /* truncate morphname */
		/* print error message */
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szMorphnameTooLong_m,
				pAmple_in->pszAmpleDictErrorHeader, ' ', rp,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount));
		}
		if (bDidMorphName)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoMorphnames_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
				pszMorphName, rp);
		}
		else
		{
		pszMorphName = duplicateString(rp);
		bDidMorphName = TRUE;
		}
		rp = end + strlen(end);
		break;

	case 'O':                       /* orderclass */
#ifndef hab360
		end = rp + strlen(rp); /* save end of line position */
#endif
		if (bDidOrderClass)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoOrderclasses_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
#ifdef hab360
/*			    de->iOrderClass, rp);*/
#else
				de->iOrderClass, de->iOrderClassMax, rp);
#endif
		}
		else
		{
#ifdef hab360
/*		ord = atol(rp);*/
/*		if (ord < -32767)*/
/*		    {*/
/*		    if (pAmple_in->pLogFP != NULL)*/
/*			fprintf(pAmple_in->pLogFP, szBadOrderclass_m,*/
/*				pAmple_in->pszAmpleDictErrorHeader, ord,*/
/*				-32767, getAmpleRecordIDTag(szRecordKey_g,*/
/*						  pAmple_in->uiRecordCount));*/
/*		    ord = -32767L;*/
/*		    }*/
/*		else if (ord > 32767)*/
/*		    {*/
/*		    if (pAmple_in->pLogFP != NULL)*/
/*			fprintf(pAmple_in->pLogFP, szBadOrderclass_m,*/
/*			      pAmple_in->pszAmpleDictErrorHeader, ord, 32767,*/
/*				getAmpleRecordIDTag(szRecordKey_g,*/
/*						  pAmple_in->uiRecordCount));*/
/*		    ord = 32767L;*/
/*		    }*/
/*		de->iOrderClass = (short)ord;*/
#else  /* hab360 */
		for (i = 0; i < 2; i++)
			{
			pszNext = isolateWord(rp);
			ord = parseAmpleOrderClass(rp, pAmple_in);
			if (i == 0)
			{
			de->iOrderClass = (short)ord;
			}
			else
			{
			if ((de->iOrderClass != 0) && ord == 0)
				{
				/* there was no second orderclass */
				de->iOrderClassMax = de->iOrderClass;
				}
			else	/* there was a second orderclass */
				{
				if (ord >= de->iOrderClass)
				{
				de->iOrderClassMax = (short)ord;
				}
				else if (pAmple_in->pLogFP != NULL)
				{
				fprintf(pAmple_in->pLogFP,
					szBadOrderclassMax_m,
					pAmple_in->pszAmpleDictErrorHeader,
					ord, de->iOrderClass,
					getAmpleRecordIDTag(szRecordKey_g,
							pAmple_in->uiRecordCount));
				de->iOrderClassMax = de->iOrderClass;
				}
				}
			}
			rp = pszNext;
			}
#endif /* hab360 */
		bDidOrderClass = TRUE;
		}
#ifdef hab360
/*	    rp = rp + strlen(rp);*/
#else
		rp = end;
#endif
		break;

	case 'P':                       /* morpheme properties */
		end = rp + strlen(rp);  /* save end of line position */
		rp = parseAmplePropertySet(rp,
					   &mproperties,
					   AMPLE_MORPH_PROP,
					   pAmple_in->uiRecordCount,
					   szRecordKey_g,
					   pAmple_in->pszAmpleDictErrorHeader,
					   &pAmple_in->sProperties,
					   &pAmple_in->pPropertySets,
					   pAmple_in->pLogFP);
		rp = end;
		break;

	case 'E':         /* Elsewhere allomorph */
		bIsElsewhereAllomorph = TRUE;
		/*
		 *  NOTE: there is no 'break' statement here on purpose: this
		 *  entry needs to be processed as an allomorph and so it needs
		 *  to fall through to the 'A' case
		 */
	case 'A':                       /* surface form (allomorph) */
		if (strcmp(rp,"") == 0)       /* check for empty allo field */
		{
		bHadEmptyAllomorph = TRUE;  /* set error message flag */
		break;          /* ignore an empty field */
		}
		end = rp + strlen(rp);
		pPrevAllos = head;
		head = build_allomorphs(rp,
					isolateWord(rp),
					head,
					dtype,
					mde,
					&bBadAllomorph,
					pAmple_in);
		for ( alp = head ; alp && (alp != pPrevAllos) ; alp = alp->pNext )
		{
		alp->pAllomorph->pINFIX = de;	/* set infix_info pointer */
		if (bIsElsewhereAllomorph)
			alp->pAllomorph->iAllomorphFlags |= ELSEWHERE;
		}
		bIsElsewhereAllomorph = FALSE;
		/*
		 *  set underlying form pointer if this is an elsewhere case,
		 *  and an underlying form has not been found (yet)
		 */
		if (    bIsElsewhereAllomorph &&
			(pAmple_in->iOutputFlags & WANT_UNDERLYING) &&
			(mde->pszUnderForm == NULL) &&
			(head != NULL) )
		mde->pszUnderForm = duplicateString(head->pszAllomorph);
		/*
		 *  one failure ruins all
		 */
		bHadInvalidAllomorph |= bBadAllomorph;
		bDidAllomorph = TRUE;
		rp = end;
		break;

	case 'Z':		/* morpheme co-occurrence constraint */
		end = rp + strlen(rp);
		mr = parseAmpleMorphConstraint( rp, pAmple_in);
		if (mr != (AmpleMorphConstraint *)NULL)
		{
		mr->pNext = mde->pMorphConstraints;
		mde->pMorphConstraints = mr;
		}
		rp = end;
		break;

	case 'F':           /* feature descriptors */
		end = rp + strlen(rp);
		add_fd( rp, mde, pAmple_in);
		rp = end;
		break;

	case 'U':         /* underlying form */
		end = isolateWord(rp);
		if (mde->pszUnderForm != NULL)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoUnderlyingForms_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
				mde->pszUnderForm, rp);
		}
		else
		mde->pszUnderForm = duplicateString(rp);
		rp = end;
		break;

#ifdef EXPERIMENTAL
	case 'c':	/* PATR category */
		end = isolateWord(rp);
		if (mde->pszPATRCat != NULL)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoPATRCats_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
				mde->pszPATRCat, rp);
		}
		else
		mde->pszPATRCat = setPATRCategory(rp, pAmple_in);
		rp = end;
		break;

	case 'f':	/* PATR feature structures */
		end = rp += strlen(rp);
		mde->pPATRFeature = setPATRFeature(mde->pPATRFeature, rp,
						   pAmple_in);
		rp = end;
		break;

#endif /* EXPERIMENTAL */
	} /* end switch */

	while (*rp++ != NUL)   /* pass over rest of line */
	;
	} /* end of record */
/*
 *  set the allomorph ID strings if not already set
 */
if (pAmple_in->bEnableAllomorphIDs)
	{
	pszMorph = pszMorphName;
	if (pszMorph == NULL)
	pszMorph = "";
	for ( iAlloCount = 0, alp = head ; alp ; alp = alp->pNext, ++iAlloCount )
	;
	for ( i = iAlloCount, alp = head ; alp ; alp = alp->pNext, --i )
	{
	if (alp->pAllomorph->pszAllomorphID == NULL)
		alp->pAllomorph->pszAllomorphID = build_allomorph_id(pszMorph, i);
	}
	}
/*
 *  verify that mcc's apply to only this morpheme
 */
if (bDidMorphName)
	check_for_valid_mcc(mde->pMorphConstraints, pszMorphName, pAmple_in);
/*
 *  propagate morpheme global values to each allomorph
 */
for ( alp = head ; alp ; alp = alp->pNext )
	{
	/* set any morpheme props */
	mergeAmplePropertySets( &alp->pAllomorph->sPropertySet,
				mproperties,
				pAmple_in->uiRecordCount,
				szRecordKey_g,
				&pAmple_in->sProperties,
				&pAmple_in->pPropertySets);
	alp->pAllomorph->pMORPHNAME = pszMorphName;       /* save morpheme name */
	/* print debugging info */
	if (pAmple_in->bDebugAllomorphConds)
	showAmpleAlloEnvConstraint(alp, pAmple_in->pszDicType,
				   pAmple_in->pLogFP);
	if (    bDidMorphName && bDidAllomorph && bDidCatPair &&
		bDidInfixLocation && !bHadInvalidAllomorph)
	{
	/*
	 *  enter allomorph into trie
	 */
	if (isAmpleAllomorphSelected(pszMorphName,
					 alp->pszAllomorph, pAmple_in))
		{
		/*
		 *  if no select list, or if morphname or allo in select list
		 */
		alp->pAllomorph->iAllomorphFlags |= ACTIVE;
		}
	alp->pAllomorph->pNextAllomorph =
					   alp->pAllomorph->pMorpheme->pAllomorphs;
	alp->pAllomorph->pMorpheme->pAllomorphs = alp->pAllomorph;
	enter_entry( alp->pszAllomorph, alp->pAllomorph, pAmple_in);
	if (    (alp->pAllomorph->pEnvironment != NULL) &&
		(alp->pAllomorph->pEnvironment->pMorphCond != NULL) )
		add_menv( alp->pAllomorph, pAmple_in);
	} /* if */
	} /* for */
if (	bDidMorphName && bDidAllomorph && bDidCatPair && bDidInfixLocation &&
	!bHadInvalidAllomorph &&
	(pAmple_in->ppszMorphNames != NULL))
	add_morph( pszMorphName, pAmple_in);
mproperties.pProperties = NULL;               /* clear for next time */
/*
 *  check for a valid record
 */
if (pAmple_in->pLogFP != NULL)
	{
	if (!bDidMorphName)
	fprintf(pAmple_in->pLogFP, szLoadError_m,
		pAmple_in->pszAmpleDictErrorHeader, "morphname",
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	if (!bDidAllomorph)
	fprintf(pAmple_in->pLogFP, szLoadError_m,
		pAmple_in->pszAmpleDictErrorHeader, "allomorph",
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	if (!bDidCatPair)
	fprintf(pAmple_in->pLogFP, szLoadError_m,
		pAmple_in->pszAmpleDictErrorHeader, "category pair",
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	if (!bDidInfixLocation)
	fprintf(pAmple_in->pLogFP, szLoadError_m,
		pAmple_in->pszAmpleDictErrorHeader, "location field",
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	if (bHadEmptyAllomorph)
	fprintf(pAmple_in->pLogFP, szEmptyAllomorph_m,
		pAmple_in->pszAmpleDictErrorHeader,
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
#ifdef PROPDEBUG
	disp_allo(head, dictype);
#endif /* PROPDEBUG */
	}

freealist(head, pAmple_in);
} /* end ifx_create */

/*****************************************************************************
 * NAME
 *    root_create
 * DESCRIPTION
 *    fills in data structure for a source dialect root dictionary entry
 * RETURN VALUE
 *    none
 */
static void root_create(recp, pAmple_in)
char *		recp;	/* pointer to a record of the dictionary file */
AmpleData *	pAmple_in;
{
PropertySet_t		mproperties;
AmpleMorphConstraint *	mr           = NULL;
char *			pszMorphName = NULL;
char *			pszMorph     = NULL;
unsigned char *		rootcat      = NULL;	/* root categories */
AmpleAllomorphList *	head         = NULL;
AmpleAllomorphList *	alp;
AmpleMorpheme *		mde;
int			code;
int			bDidTruncation;
int			bRegularSoundChange   = FALSE;
int			bDidAllomorph         = FALSE;	/* need at least one */
int			bDidCategories        = FALSE;	/* need at least one */
int			bDidGloss             = FALSE;	/* need exactly one */
int			bHadInvalidAllomorph  = FALSE;
int			bIsElsewhereAllomorph = FALSE;
int			bHadEmptyAllomorph    = FALSE;
int			bBadAllomorph;
int			bStoredAllos = FALSE;
char *			rp;
char *			end;
int			i;
int			iAlloCount;
AmpleAllomorphList *	pPrevAllos  = NULL;
char                    szTempMorphname[65];

initalist(pAmple_in);
mproperties.pProperties = NULL;
/*
 *  allocate space for dict entry
 */
mde = (AmpleMorpheme *)allocMemory(sizeof(AmpleMorpheme));
mde->pszMorphFd        = NULL;		/* clear feature descriptor pointer */
mde->pszUnderForm      = NULL;		/* clear underlying form    pointer */
mde->pMorphConstraints = NULL;
#ifdef EXPERIMENTAL
mde->pszPATRCat        = NULL;
mde->pPATRFeature      = NULL;
#endif /* EXPERIMENTAL */
if (pAmple_in->bRootGlosses)
	mde->u.pRoot = (AmpleRootInfo *)allocMemory(sizeof(AmpleRootInfo));
/*
 *  link the morpheme into the global list for possible later deletion
 */
if (pAmple_in->pLastMorpheme == NULL)
	{
	mde->pLink = pAmple_in->pAmpleMorphemes;
	pAmple_in->pAmpleMorphemes = mde;
	}
else
	{
	mde->pLink = NULL;
	pAmple_in->pLastMorpheme->pLink = mde;
	}
pAmple_in->pLastMorpheme = mde;
/*
 *  fill in fields according to codes in record
 */
rp = recp;
while (*rp != NUL)
	{
	code = *rp++;     /* field code is first char on line */
	rp += strspn(rp, szWhitespace_m);   /* skip over white space */

	switch (code)
	{       /* action according to field code */

	case 'M':         /* morphname == proto form (etymology) */
		end = isolateWord(rp);
		if (pszMorphName != NULL)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoMorphnames_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
				pszMorphName, rp);
		}
		else
		{
		if (*rp == '*')
			{  /* reg sound change applies */
			bRegularSoundChange = TRUE;
			rp++;
			}
		pszMorphName = rp;
		}
		rp = end + strlen(end);
		break;

	case 'C':         /* category */
		end = rp + strlen(rp); /* save end of line position */
		to_list(rp, &rootcat, pAmple_in->uiRecordCount, pAmple_in);
		bDidCategories = (rootcat != NULL); /* hab 3.2.4 */
		rp = end;
		break;

	case 'E':         /* Elsewhere allomorph */
		bIsElsewhereAllomorph = TRUE;
		/*
		 *  NOTE: there is no 'break' statement here on purpose: this
		 *  entry needs to be processed as an allomorph and so it needs
		 *  to fall through to the 'A' case
		 */
	case 'A':                 /* allomorph */
		if (strcmp(rp,"") == 0)      /* check for empty allo field */
		{
		bHadEmptyAllomorph = TRUE;  /* set error message flag */
		break;          /* ignore an empty field */
		}
		end = rp + strlen(rp);
		pPrevAllos = head;
		head = build_allomorphs(rp,
					isolateWord(rp),
					head,
					AMPLE_ROOT,
					mde,
					&bBadAllomorph,
					pAmple_in);
		for ( alp = head ; alp && (alp != pPrevAllos) ; alp = alp->pNext )
		{
		if (bIsElsewhereAllomorph)
			alp->pAllomorph->iAllomorphFlags |= ELSEWHERE;
		}
		bIsElsewhereAllomorph = FALSE;
		/*
		 *  set underlying form pointer if this is an elsewhere case,
		 *  and an underlying form has not been found (yet)
		 */
		if (    bIsElsewhereAllomorph &&
			(pAmple_in->iOutputFlags & WANT_UNDERLYING) &&
			(mde->pszUnderForm == NULL) &&
			(head != NULL) )
		mde->pszUnderForm = duplicateString(head->pszAllomorph);
		/*
		 *  one failure ruins all
		 */
		bHadInvalidAllomorph |= bBadAllomorph;
		bDidAllomorph = TRUE;
		rp = end;
		break;

	case 'G':     /* root gloss */
		end = isolateWord(rp);
		if (pAmple_in->bRootGlosses)
		{
		if (bDidGloss)
			{
			if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoGlosses_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
							pAmple_in->uiRecordCount),
				mde->u.pRoot->pszRootGloss, rp);
			}
		else
			{
			mde->u.pRoot->pszRootGloss = duplicateString( rp );
			bDidGloss = TRUE;
			}
		}
		rp = end;
		break;

	case 'P':         /* morpheme properties */
		end = rp + strlen(rp); /* save end of line position */
		rp = parseAmplePropertySet(rp,
					   &mproperties,
					   AMPLE_MORPH_PROP,
					   pAmple_in->uiRecordCount,
					   szRecordKey_g,
					   pAmple_in->pszAmpleDictErrorHeader,
					   &pAmple_in->sProperties,
					   &pAmple_in->pPropertySets,
					   pAmple_in->pLogFP);
		rp = end;
		break;

	case 'Z':		/* morpheme co-occurrence constraint */
		end = rp + strlen(rp);
		mr = parseAmpleMorphConstraint( rp, pAmple_in);
		if (mr != (AmpleMorphConstraint *)NULL)
		{
		mr->pNext = mde->pMorphConstraints;
		mde->pMorphConstraints = mr;
		}
		rp = end;
		break;

	case 'F':         /* feature descriptors */
		end = rp + strlen(rp);
		add_fd( rp, mde, pAmple_in);
		rp = end;
		break;

	case 'U':         /* underlying form */
		end = isolateWord(rp);
		if (mde->pszUnderForm != NULL)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoUnderlyingForms_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
				mde->pszUnderForm, rp);
		}
		else
		mde->pszUnderForm = duplicateString(rp);
		rp = end;
		break;

#ifdef EXPERIMENTAL
	case 'c':	/* PATR category */
		end = isolateWord(rp);
		if (mde->pszPATRCat != NULL)
		{
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szTwoPATRCats_m,
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount),
				mde->pszPATRCat, rp);
		}
		else
		mde->pszPATRCat = setPATRCategory(rp, pAmple_in);
		rp = end;
		break;

	case 'f':	/* PATR feature structures */
		end = rp += strlen(rp);
		mde->pPATRFeature = setPATRFeature(mde->pPATRFeature, rp,
						   pAmple_in);
		rp = end;
		break;

#endif /* EXPERIMENTAL */
	} /* end switch */

	/* pass over rest of line */
	while (*rp++ != NUL);

	} /* end of record */
/*
 * fill in morphname:
 * morphname is identical to surface string if:
 *    (1) no etymology
 *    (2) only "*" appears in etymology field
 *    (3) there is only one allomorph AND etymology == string.
 */
if (head)
	{
	if (    (pszMorphName == NULL) ||
		(*pszMorphName == NUL) ||
		(	(head->pNext == NULL) &&
		(strcmp(pszMorphName, head->pszAllomorph) == 0) ) )
	{
	/*
	 *  check all allomorphs for length since options (1) and (2) will use
	 *  the matched string for the morphname
	 */
	bDidTruncation = FALSE;
	for ( alp = head ; alp ; alp = alp->pNext )
		{
		/*
		 *  check for too large a morphname (warning only)
		 */
		pAmple_in->iMorphnameSize = strlen(alp->pszAllomorph) +
						   bRegularSoundChange ? 1 : 0;
		if (    (pAmple_in->iMorphnameSize >
			 pAmple_in->iMaxMorphnameLength) &&
			(pAmple_in->iMorphnameSize <= MAXMORPH) )
		{
		/* print error message */
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szMorphnameWarning_m,
				pAmple_in->pszAmpleDictErrorHeader,
				(bRegularSoundChange ? '*' : ' '),
				alp->pszAllomorph,
				getAmpleRecordIDTag(szRecordKey_g,
						pAmple_in->uiRecordCount));
		}
		/*
		 *  check for too large a morphname
		 */
		if (pAmple_in->iMorphnameSize > MAXMORPH)
		{
		/* allocate and copy truncated portion */
		pszMorphName = strncpy( allocMemory(MAXMORPH+1),
					alp->pszAllomorph,
					MAXMORPH);
		*(pszMorphName+MAXMORPH) = NUL;
		/* print error message */
		if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP, szMorphnameTooLong_m,
				pAmple_in->pszAmpleDictErrorHeader,
				(bRegularSoundChange ? '*' : ' '),
				pszMorphName, getAmpleRecordIDTag(szRecordKey_g,
							pAmple_in->uiRecordCount));
		/* use truncated form */
		head->pAllomorph->pMORPHNAME = pszMorphName;
		bDidTruncation = TRUE;
		}
		}
	/*
	 *  set morphname pointers per what what was found above
	 */
	if (bDidTruncation)
		{
		if (    bDidAllomorph && bDidCategories && !bHadInvalidAllomorph &&
			(pAmple_in->ppszMorphNames != NULL) )
		{
		if (bRegularSoundChange)
			{
			/* add exceptional morphname */
			pAmple_in->pRootMorphnameExceptions = make_root_excep(
					 pAmple_in->pRootMorphnameExceptions,
					 pszMorphName,
					 bRegularSoundChange);
			/* add the morphname to the master list */
			add_morph( pAmple_in->pRootMorphnameExceptions->pszString,
				   pAmple_in);
			}
		else          /* use morphname as is */
			add_morph( pszMorphName, pAmple_in);
		}
		}
	else
		{
		/* no morphname needed in dictionary */
		head->pAllomorph->pMORPHNAME = NULL;
		/* save pszMorphName for szOutOfMemoryMarker_g below */
		pszMorphName = head->pszAllomorph;
		if (    bDidAllomorph && bDidCategories && !bHadInvalidAllomorph &&
			(pAmple_in->ppszMorphNames != NULL) )
		{
		/* create all possible morphnames and add them
		   to the list for reference checking;
		   since the dictionary does not contain the
		   morphname, we must keep a separate list of
		   these morphname exceptions */
		for ( alp = head ; alp ; alp = alp->pNext )
			{
			pAmple_in->pRootMorphnameExceptions = make_root_excep(
					   pAmple_in->pRootMorphnameExceptions,
					   alp->pszAllomorph,
					   bRegularSoundChange);
			/* add the morphname to the master list */
			add_morph( pAmple_in->pRootMorphnameExceptions->pszString,
				   pAmple_in);
			}
		}
		}
	}
	else
	{
	/*
	 *  an explicit morphname was given, so we need to store it in the
	 *  dictionary
	 *
	 *  check for too large a morphname (warning only)
	 */
	pAmple_in->iMorphnameSize = strlen(pszMorphName) +
		(bRegularSoundChange ? 1 : 0);
	if (	(pAmple_in->iMorphnameSize > pAmple_in->iMaxMorphnameLength) &&
		(pAmple_in->iMorphnameSize <= MAXMORPH) )
		{
		/* print error message */
		if (pAmple_in->pLogFP != NULL)
		fprintf(pAmple_in->pLogFP, szMorphnameWarning_m,
			pAmple_in->pszAmpleDictErrorHeader,
			(bRegularSoundChange ? '*' : ' '),
			pszMorphName, getAmpleRecordIDTag(szRecordKey_g,
							pAmple_in->uiRecordCount));
		}
	/* check for too large a morphname */
	if ( pAmple_in->iMorphnameSize > MAXMORPH )
		{
		*(pszMorphName+MAXMORPH) = NUL;  /* truncate morphname */
		/* print error message */
		if (pAmple_in->pLogFP != NULL)
		fprintf(pAmple_in->pLogFP, szMorphnameTooLong_m,
			pAmple_in->pszAmpleDictErrorHeader,
			(bRegularSoundChange ? '*' : ' '),
			pszMorphName, getAmpleRecordIDTag(szRecordKey_g,
						   pAmple_in->uiRecordCount));
		}
	pszMorphName = duplicateString( pszMorphName );
	for ( alp = head ; alp ; alp = alp->pNext )
		alp->pAllomorph->pMORPHNAME = pszMorphName;
	if (	bDidAllomorph && bDidCategories && !bHadInvalidAllomorph &&
		(pAmple_in->ppszMorphNames != NULL) )
		{
		if (bRegularSoundChange)
		{      /* add exceptional morphname */
		pAmple_in->pRootMorphnameExceptions = make_root_excep(
					   pAmple_in->pRootMorphnameExceptions,
					   pszMorphName,
					   bRegularSoundChange);
		/* add the morphname to the master list */
		add_morph( pAmple_in->pRootMorphnameExceptions->pszString,
			   pAmple_in);
		}
		else          /* use morphname as is */
		add_morph( pszMorphName, pAmple_in);
		}
	}
	}
/*
 *  set the allomorph ID strings if not already set
 */
if (pAmple_in->bEnableAllomorphIDs)
	{
	pszMorph = pszMorphName;
	if (pszMorph == NULL)
	pszMorph = "";
	for ( iAlloCount = 0, alp = head ; alp ; alp = alp->pNext, ++iAlloCount )
	;
	for ( i = iAlloCount, alp = head ; alp ; alp = alp->pNext, --i )
	{
	if (alp->pAllomorph->pszAllomorphID == NULL)
		alp->pAllomorph->pszAllomorphID = build_allomorph_id(pszMorph, i);
	}
	}
/*
 *  verify that mcc's apply to only this morpheme
 */
rp = szTempMorphname;
if (bRegularSoundChange)	/* adjust for regular sound change */
	{
	szTempMorphname[0] = '*';
	strncpy(szTempMorphname + 1, pszMorphName, sizeof(szTempMorphname) - 1);
	}
else if (pszMorphName != NULL)
	{
	strncpy(szTempMorphname, pszMorphName, sizeof(szTempMorphname));
	}
else
	{
	szTempMorphname[0] = NUL;
	}
szTempMorphname[sizeof(szTempMorphname) - 1] = NUL;
if (szTempMorphname[0])
	check_for_valid_mcc(mde->pMorphConstraints, szTempMorphname, pAmple_in);
/*
 *  fill in categories, morpheme properties, & RSC bit for all allomorphs
 */
for ( alp = head ; alp ; alp = alp->pNext )
	{
	if (rootcat != NULL)
	{
	if (pAmple_in->bRootGlosses)
		alp->pAllomorph->pROOT_CATS = rootcat;
	else
		alp->pAllomorph->pROOTCATS  = rootcat;
	}
	else
	{
	if (pAmple_in->bRootGlosses)
		alp->pAllomorph->pROOT_CATS = (unsigned char *)"";
	else
		alp->pAllomorph->pROOTCATS  = (unsigned char *)"";
	}
	/* set any morpheme props */
	mergeAmplePropertySets( &alp->pAllomorph->sPropertySet,
				mproperties,
				pAmple_in->uiRecordCount,
				szRecordKey_g,
				&pAmple_in->sProperties,
				&pAmple_in->pPropertySets);
	if (bRegularSoundChange)
	alp->pAllomorph->iMORPHTYPE |= RSC;
	if (pAmple_in->bDebugAllomorphConds)
	showAmpleAlloEnvConstraint(alp, pAmple_in->pszDicType,
				   pAmple_in->pLogFP);
	if ((bDidAllomorph && bDidCategories && !bHadInvalidAllomorph) &&
				/* if are doing root glosses, need a gloss */
	(!pAmple_in->bRootGlosses || (pAmple_in->bRootGlosses && bDidGloss)))
	{
	/*
	 *  enter allomorph into trie
	 */
#ifndef hab3320
	if (isAmpleAllomorphSelected(szTempMorphname,
					 alp->pszAllomorph, pAmple_in))
#else /* hab3320 */
/*	if (isAmpleAllomorphSelected(pszMorphName,*/
/*				     alp->pszAllomorph, pAmple_in))*/
#endif /* hab3320 */
		{
		/*
		 *  if no select list, or if morphname or allo in select list
		 */
		alp->pAllomorph->iAllomorphFlags |= ACTIVE;
		}
	alp->pAllomorph->pNextAllomorph =
					   alp->pAllomorph->pMorpheme->pAllomorphs;
	alp->pAllomorph->pMorpheme->pAllomorphs = alp->pAllomorph;
	enter_entry( alp->pszAllomorph, alp->pAllomorph, pAmple_in);
	bStoredAllos = TRUE;
	if (   (alp->pAllomorph->pEnvironment != NULL) &&
		   (alp->pAllomorph->pEnvironment->pMorphCond != NULL) &&
		   (pAmple_in->ppszMorphNames != NULL))
		add_menv( alp->pAllomorph, pAmple_in);
	}
	}
mproperties.pProperties = NULL;                    /* reset for next time */

/* checks for a valid record */
if (pAmple_in->pLogFP != NULL)
	{
	if (!bDidAllomorph)
	fprintf(pAmple_in->pLogFP, szLoadError_m,
		pAmple_in->pszAmpleDictErrorHeader, "allomorph",
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	if (!bDidCategories)
	fprintf(pAmple_in->pLogFP, szLoadError_m,
		pAmple_in->pszAmpleDictErrorHeader, "category",
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	if (pAmple_in->bRootGlosses && !bDidGloss)
	fprintf(pAmple_in->pLogFP, szLoadError_m,
		pAmple_in->pszAmpleDictErrorHeader, "gloss",
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	if (bHadEmptyAllomorph)
	fprintf(pAmple_in->pLogFP, szEmptyAllomorph_m,
		pAmple_in->pszAmpleDictErrorHeader,
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
#ifdef PROPDEBUG
	disp_allo(head, dictype);
#endif /* PROPDEBUG */
	}

/* record key is error msg for storage overflow */
strncpy( szOutOfMemoryMarker_g, szRecordKey_g, MAXMORPH);

/* free up temporary allocations */
if (!bStoredAllos)
	{
	/* an error occured, making the allomorph storage superflous */
	for ( alp = head ; alp ; alp = alp->pNext )
	{
	if (alp->pAllomorph->pszAllomorph)
		freeMemory(alp->pAllomorph->pszAllomorph);
	if (alp->pAllomorph->pszAllomorphID)
		freeMemory(alp->pAllomorph->pszAllomorphID);
	if (alp->pAllomorph->pEnvironment)
		freeAmpleAlloEnvConstraint(alp->pAllomorph->pEnvironment);
	freeMemory(alp->pAllomorph);
	}
	}
freealist(head, pAmple_in);
} /* end root_create */

/*****************************************************************************
 * NAME
 *    copyAmpleDictEntry
 * DESCRIPTION
 *    makes a copy of an AMPLE dictionary entry
 * RETURN VALUE
 *    pointer to beginning of copy
 */
static char *copyAmpleDictEntry(char *pRecord_in)
{
  char *cp;
  char *pszCopy = NULL;
  size_t uiLength;

  cp = pRecord_in;
  while(1)
  {				/* look until see two NULs in a row */
	if (*cp == NUL && *(cp+1) == NUL)
	  break;
	cp++;
  }
  if (cp != pRecord_in)
	{
	  uiLength = (cp - pRecord_in) + 2; /* include the final double nul */
	  pszCopy = allocMemory(uiLength);
	  memcpy(pszCopy, pRecord_in, uiLength);
	}
  return pszCopy;
}

/*****************************************************************************
 * NAME
 *    addAmpleDictEntry
 * DESCRIPTION
 *    fills in data structure for a source dialect morpheme (prefix, infix,
 *    root, or suffix) dictionary entry.
 * RETURN VALUE
 *    none
 */
static void addAmpleDictEntry(pRecord_in, pAmple_in)
char *		pRecord_in;	/* pointer to a dictionary record */
AmpleData *	pAmple_in;
{
int	iDicType = AMPLE_ROOT;	/* default entry type */
char *	pszField;
int	iFieldCode;
int	bPrefixStored = FALSE;
int	bInfixStored  = FALSE;
int	bSuffixStored = FALSE;
int	bInterfixStored  = FALSE;
int	bRootStored   = FALSE;
char *  pszCopyOfRecord = NULL;
/*
 *  scan the record looking for a 'T'ype field
 */
pszField = pRecord_in;
while (*pszField != NUL)
	{
	/*
	 *  get the field code and skip over white space
	 */
	iFieldCode = *pszField++;
	if (iFieldCode == 'T')
	{
	/*
	 *  allow multiple morpheme types (why not?)
	 */
	while (*pszField != NUL)
		{
		pszField += strspn(pszField, szWhitespace_m);
		switch (*pszField)
		{
		case  0 :
			break;	/* found end of field; hab 3.2.4 */
		case 'p':			/* prefix */
		case 'P':
			iDicType = AMPLE_PFX;
			if (bPrefixStored == FALSE)
			{
			if (pAmple_in->iMaxInterfixCount > 0)
			  pszCopyOfRecord = copyAmpleDictEntry(pRecord_in);
			afx_create(pRecord_in, iDicType, pAmple_in);
			bPrefixStored = TRUE;
			}
			break;
		case 'i':			/* infix */
		case 'I':
			iDicType = AMPLE_IFX;
			if (bInfixStored == FALSE)
			{
			if (pAmple_in->iMaxInterfixCount > 0)
			  pszCopyOfRecord = copyAmpleDictEntry(pRecord_in);
			ifx_create(pRecord_in, iDicType, pAmple_in);
			bInfixStored = TRUE;
			}
			break;
		case 's':			/* suffix */
		case 'S':
			iDicType = AMPLE_SFX;
			if (bSuffixStored == FALSE)
			{
			if (pAmple_in->iMaxInterfixCount > 0)
			  pszCopyOfRecord = copyAmpleDictEntry(pRecord_in);
			afx_create(pRecord_in, iDicType, pAmple_in);
			bSuffixStored = TRUE;
			}
			break;
		case 'n':			/* interfix */
		case 'N':
		  if (pAmple_in->iMaxInterfixCount == 0)
			break; 	/* if intefix count is zero, this won't work */
			iDicType = AMPLE_NFX;
			if (bInterfixStored == FALSE)
			  {
			if (bPrefixStored)
			  {
				iDicType = AMPLE_NFXPFX;
				afx_create(pszCopyOfRecord, iDicType, pAmple_in);
				bInterfixStored = TRUE;
			  }
			else if (bSuffixStored)
			  {
				iDicType = AMPLE_NFXSFX;
				afx_create(pszCopyOfRecord, iDicType, pAmple_in);
				bInterfixStored = TRUE;
			  }
			else if (bInfixStored)
			  {
				iDicType = AMPLE_NFXIFX;
				ifx_create(pszCopyOfRecord, iDicType, pAmple_in);
				bInterfixStored = TRUE;
			  }
			else
			  {
				if (pAmple_in->pLogFP != NULL)
				  fprintf(pAmple_in->pLogFP,
				"%sInterfix type field must follow other affix type (prefix, suffix, or infix): in entry %s: \"%s\"\n",
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
							pAmple_in->uiRecordCount),
				pszField );
				iDicType = -1;
			  }
			  }
			break;
		case 'r':			/* root */
		case 'R':
			iDicType = AMPLE_ROOT;
			if (bRootStored == FALSE)
			{
			root_create(pRecord_in, pAmple_in);
			bRootStored = TRUE;
			}
			break;

		default:
			if (pAmple_in->pLogFP != NULL)
			fprintf(pAmple_in->pLogFP,
				"%sInvalid type field in entry %s: \"%s\"\n",
				pAmple_in->pszAmpleDictErrorHeader,
				getAmpleRecordIDTag(szRecordKey_g,
							pAmple_in->uiRecordCount),
				pszField );
			iDicType = -1;
			break;
		}
		/*
		 *  advance pointer past this keyword
		 */
		pszField += strcspn(pszField, szWhitespace_m);
		}
	break;
	}
	/*
	 *  advance pointer past this field
	 */
	pszField += strlen(pszField) + 1;
	} /* end of record */
/*
 *  handle missing type field
 */
if ((iDicType == AMPLE_ROOT) && (bRootStored == FALSE))
	root_create(pRecord_in, pAmple_in);
if (pszCopyOfRecord != NULL)
	freeMemory(pszCopyOfRecord);
}

/*****************************************************************************
 * NAME
 *    loadAmpleDictionary
 * DESCRIPTION
 *    load a dictionary into memory
 * RETURN VALUE
 *    the number of entries loaded if successful, -1 if an error occurs
 */
static int bRecordHasInterfixType(char *pRecord_in)
{
char *pszField;
int   iFieldCode;
int   bResult;

bResult = FALSE;		/* be pessimistic */
/*
 *  scan the record looking for a 'T'ype field
 */
pszField = pRecord_in;
while (*pszField != NUL)
  {
	/*
	 *  get the field code and skip over white space
	 */
	iFieldCode = *pszField++;
	if (iFieldCode == 'T')
	  {
	/*
	 *  allow multiple morpheme types (why not?)
	 */
	while (*pszField != NUL)
	  {
		pszField += strspn(pszField, szWhitespace_m);
		if ((*pszField == 'n') ||(*pszField == 'N'))
		  {
		bResult = TRUE;
		break;
		  }
		/*
		 *  advance pointer past this keyword
		 */
		pszField += strcspn(pszField, szWhitespace_m);
	  }
	break;
	  }
	/*
	 *  advance pointer past this field
	 */
	pszField += strlen(pszField) + 1;
	} /* end of record */
return bResult;
}

/*****************************************************************************
 * NAME
 *    loadAmpleDictionary
 * DESCRIPTION
 *    load a dictionary into memory
 * RETURN VALUE
 *    the number of entries loaded if successful, -1 if an error occurs
 */
int loadAmpleDictionary(pszFilename_in, eDictType_in, pAmple_io)
const char *	pszFilename_in;
int		eDictType_in;		/* AMPLE_PFX, AMPLE_IFX,
					   AMPLE_SFX, or AMPLE_ROOT */
AmpleData *	pAmple_io;
{
CodeTable *	pCodeTable;
FILE *		infp;
char *		rp;       /* pointer to a record */
int		count;
char *		pszType;
StringList *	pList;
char *          pszCopyOfRecord;
int		iInterfixType;


infp = fopen(pszFilename_in, "r");
if (infp == NULL)
	{
	switch (eDictType_in)
	{
	case AMPLE_PFX:		pszType = "prefix";	break;
	case AMPLE_IFX:		pszType = "infix";	break;
	case AMPLE_SFX:		pszType = "suffix";	break;
	case AMPLE_ROOT:	pszType = "root";	break;
	default:		pszType = "unified";	break;
	}
	reportError(ERROR_MSG, szNoDictionary_m, pszType, pszFilename_in);
	if ((pAmple_io->pLogFP != NULL) && (pAmple_io->pLogFP != stdout))
	fprintf(pAmple_io->pLogFP,
		szNoDictionary_m, pszType, pszFilename_in);
	return -1;
	}

switch (eDictType_in)
	{
	case AMPLE_PFX:
	pCodeTable   = pAmple_io->pPrefixTable;
	pAmple_io->pszDicType = "PREFIX";
	pAmple_io->pszAmpleDictErrorHeader = "PREFIX DICTIONARY: ";
	break;
	case AMPLE_IFX:
	pCodeTable   = pAmple_io->pInfixTable;
	pAmple_io->pszDicType = "INFIX";
	pAmple_io->pszAmpleDictErrorHeader = "INFIX DICTIONARY: ";
	break;
	case AMPLE_SFX:
	pCodeTable   = pAmple_io->pSuffixTable;
	pAmple_io->pszDicType = "SUFFIX";
	pAmple_io->pszAmpleDictErrorHeader = "SUFFIX DICTIONARY: ";
	break;
	case AMPLE_ROOT:
	pCodeTable   = pAmple_io->pRootTable;
	pAmple_io->pszDicType = "ROOT";
	pAmple_io->pszAmpleDictErrorHeader = "ROOT DICTIONARY: ";
	break;
	default:
	pCodeTable   = pAmple_io->pDictTable;
	pAmple_io->pszDicType = "UNIFIED";
	pAmple_io->pszAmpleDictErrorHeader = "UNIFIED DICTIONARY: ";
	break;
	}
if (pCodeTable == (CodeTable *)NULL)
	{
	reportError(ERROR_MSG, szEmptyCodeTable_m,
		pAmple_io->pszAmpleDictErrorHeader);
	if ((pAmple_io->pLogFP != NULL) && (pAmple_io->pLogFP != stdout))
	fprintf(pAmple_io->pLogFP,
		szEmptyCodeTable_m, pAmple_io->pszAmpleDictErrorHeader);
	return -1;
	}
/**/
pAmple_io->uiRecordCount    = 0;
pAmple_io->pLastMorpheme    = NULL;
count = 0;
if (pAmple_io->pAmpleMorphemes != NULL)
	{
	for (   pAmple_io->pLastMorpheme = pAmple_io->pAmpleMorphemes ;
		pAmple_io->pLastMorpheme->pLink ;
		pAmple_io->pLastMorpheme = pAmple_io->pLastMorpheme->pLink )
	;
	}
if (pCodeTable->pszFirstCode == NULL)
	pCodeTable->pszFirstCode = duplicateString( pCodeTable->pCodeTable );
while ((rp = readStdFormatRecord(infp,
				 pCodeTable,
				 pAmple_io->cBeginComment,
				 &pAmple_io->uiRecordCount)) != NULL)
	{
	if (*rp == NUL)
	continue;	/* ignore empty records */
	switch (eDictType_in)
	{
	case AMPLE_PFX:       /* fall through */
	case AMPLE_SFX:
		if ( (pAmple_io->iMaxInterfixCount > 0) &&
		 (bRecordHasInterfixType(rp)))
		  {
		pszCopyOfRecord = copyAmpleDictEntry(rp);
		iInterfixType = (eDictType_in == AMPLE_PFX) ? AMPLE_NFXPFX
													: AMPLE_NFXSFX;
		afx_create(pszCopyOfRecord, iInterfixType, pAmple_io);
		freeMemory(pszCopyOfRecord);
		  }
		afx_create(rp, eDictType_in, pAmple_io);
		break;
	case AMPLE_IFX:
		if ( (pAmple_io->iMaxInterfixCount > 0) &&
		 (bRecordHasInterfixType(rp)))
		  {
		pszCopyOfRecord = copyAmpleDictEntry(rp);
		ifx_create(pszCopyOfRecord, AMPLE_NFXIFX, pAmple_io);
		freeMemory(pszCopyOfRecord);
		  }
		ifx_create(rp, eDictType_in, pAmple_io);
		break;
	case AMPLE_ROOT:
		root_create(rp, pAmple_io);
		break;
	default:
		addAmpleDictEntry(rp, pAmple_io);
		break;
	}
	count++;
	}
fclose(infp);
/*
 *  add this filename to the end of the list of dictionary files
 */
if (pAmple_io->pDictionaryFiles == NULL)
	{
	pList = (StringList *)allocMemory(sizeof(StringList));
	pAmple_io->pDictionaryFiles = pList;
	}
else
	{
	for (   pList = pAmple_io->pDictionaryFiles ;
		pList->pNext ;
		pList = pList->pNext )
	;
	pList->pNext = (StringList *)allocMemory(sizeof(StringList));
	pList = pList->pNext;
	}
pList->pszString = duplicateString( pszFilename_in );
pList->pNext = NULL;

return count;
} /* end loadAmpleDictionary() */

/*****************************************************************************
 * THE NEXT TWO FUNCTIONS ARE ALMOST VERBATIM FROM CATACC.C by Andy Black
 *
 *  DATE WRITTEN:   04-MAR-83   BY: D. Weber/Bob Kasper
 *  DATE MODIFIED:  20-MAR-85   BY: hab/djw
 *          06-Mar-87       H.A. Black
 *          23-Sep-87       hab - skip comments in cat fields
 *          20-Jan-88       hab - consistency in error msgs
 *          24-Mar-88       hab - 'count' is the number now;
 *                         not one less than the no.
 *---------------------------------------------------------------------------
 *    8-Jun-88 - revised to allow BUFSIZE categories for roots, and BUFSIZE
 *          category pairs for affixes
 */
/***************************************************************************
 * NAME
 *    to_list
 * DESCRIPTION
 *    For ROOT dictionary entries, fill in the tocats array by parsing a
 *    line of category names.
 * ARGUMENTS
 *    line   - pointer to line of categories from ROOT dictionary entry
 *    tocats - address of pointer to category string
 *    count  - number of the dictionary entry
 * RETURN VALUE
 *    none
 */
static void to_list(line, tocats, count, pAmple_in)
char *		line;
unsigned char **tocats;
int		count;
AmpleData *	pAmple_in;
{
register char *p;
int cat = 0;
int x;
unsigned char xcats[BUFSIZE+1];

if (*line == NUL)
	{
	if (pAmple_in->pLogFP != NULL)
	fprintf(pAmple_in->pLogFP, "%sEmpty category field in entry: %s\n",
		pAmple_in->pszAmpleDictErrorHeader,
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	return;
	}
/*
 *  initialize the local category array
 */
if (*tocats != NULL)
	{
	/*
	 *  preserve any categories declared previously
	 */
	strcpy((char *)xcats, (char *)*tocats);
	*tocats = NULL;
	}
else
	xcats[0] = NUL;

for (   x = strlen((char *)xcats), p = line + strspn(line, szWhitespace_m);
	(*p != NUL) && (x < BUFSIZE) ;
	p = line, ++x )
	{
	line = isolateWord(p);
	if ((cat = findAmpleCategoryNumber(p,
					   pAmple_in->pCategories)) == 0)
	break;
	xcats[x] = cat;
	}
xcats[x] = NUL;

if (pAmple_in->pLogFP != NULL)
	{
	if (cat == 0)
	fprintf(pAmple_in->pLogFP,
		"%sUndefined category %s in entry: %s\n",
		pAmple_in->pszAmpleDictErrorHeader,
		p, getAmpleRecordIDTag(szRecordKey_g,
					   pAmple_in->uiRecordCount));
	if (x >= BUFSIZE)
	fprintf(pAmple_in->pLogFP,
		"%sToo many categories in entry: %s\n",
		pAmple_in->pszAmpleDictErrorHeader,
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	}

if (x > 0)
	{
	*tocats = (unsigned char *)updateStringList( &pAmple_in->pCatSets,
						 (char *)xcats );
	}
} /* end to_list */

/***************************************************************************
 * NAME
 *    cat_list
 * DESCRIPTION
 *    cat_list parses a line of category from/to pairs and fills in the
 *    category array of an affix dictionary entry.
 *    Category names may be separated by whitespace or a slash (/), and the
 *    entire list may be spread across multiple fields of the same record.
 */
static void cat_list( line, de, count, pAmple_in)
char *		line;		/* beginning of category string */
AmpleAffixInfo *de;
int		count;
AmpleData *	pAmple_in;
{
register char *p, *q;
int x;
int wantfrom;
int cat = 0;
unsigned char fromcat[BUFSIZE+1];
unsigned char tocat[BUFSIZE+1];

if (*line == NUL)
	{
	if (pAmple_in->pLogFP != NULL)
	fprintf(pAmple_in->pLogFP, "%sEmpty category field in entry: %s\n",
		pAmple_in->pszAmpleDictErrorHeader,
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	return;
	}
/*
 *  preserve any category pairs previously defined
 */
if ((de->pFromCategories != NULL) && (de->pToCategories != NULL))
	{
	strncpy((char *)fromcat, (char *)de->pFromCategories, BUFSIZE);
	freeMemory(de->pFromCategories);
	fromcat[BUFSIZE]    = NUL;
	de->pFromCategories = NULL;
	strncpy((char *)tocat,   (char *)de->pToCategories,   BUFSIZE);
	freeMemory(de->pToCategories);
	tocat[BUFSIZE]    = NUL;
	de->pToCategories = NULL;
	}
else
	{
	fromcat[0] = NUL;
	tocat[0]   = NUL;
	}
x = strlen((char *)fromcat);
/*
 *  look for category pairs until the end of the line
 */
for ( p = line, wantfrom = TRUE ; (*p != NUL) && (x < BUFSIZE) ; p = q )
	{
	/*
	 *  move to beginning of category name (skip whitespace and slashes)
	 */
	while ((isascii(*p) && isspace(*p)) || (*p == '/'))
	++p;
	if (*p == NUL)
	break;      /* end of record - quit */
	/*
	 *  move to end of category name and mark it
	 */
	for ( q=p ; (*q!=NUL) && (*q!='/') && !(isascii(*q) && isspace(*q)) ; ++q )
	;
	if (*q != NUL)
	*q++ = NUL;
	/*
	 *  find the category code number and store it
	 */
	if ((cat = findAmpleCategoryNumber(p,
					   pAmple_in->pCategories)) == 0)
	break;      /* invalid category - die */
	if (wantfrom)
	{
	fromcat[x] = cat;   /* we have a from category */
	wantfrom = FALSE;
	}
	else
	{
	tocat[x++] = cat;   /* we have a to category */
	wantfrom = TRUE;
	}
	}
if (pAmple_in->pLogFP != NULL)
	{
	if (cat == 0)
	fprintf(pAmple_in->pLogFP,
		"%sUndefined category %s in entry: %s\n",
		pAmple_in->pszAmpleDictErrorHeader,
		p, getAmpleRecordIDTag(szRecordKey_g,
					   pAmple_in->uiRecordCount) );
	if (wantfrom == FALSE)
	fprintf(pAmple_in->pLogFP,
		"%sInvalid category pair in entry: %s\n",
		pAmple_in->pszAmpleDictErrorHeader,
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	if ((x == BUFSIZE) && (*p != NUL))
	fprintf(pAmple_in->pLogFP,
		"%sToo many category pairs in entry: %s\n",
		pAmple_in->pszAmpleDictErrorHeader,
		getAmpleRecordIDTag(szRecordKey_g, pAmple_in->uiRecordCount));
	}

fromcat[x] = NUL;
de->pFromCategories = (unsigned char *)duplicateString( (char *)fromcat );

tocat[x] = NUL;
de->pToCategories = (unsigned char *)duplicateString( (char *)tocat );

} /* end cat_list */

/*****************************************************************************
 * NAME
 *    initalist
 * DESCRIPTION
 *    initializes counter and pointer used in allocating
 *    the temporary alist structures for a dictionary entry.
 * RETURN VALUE
 *    none
 */
static void initalist(pAmple_io)
AmpleData * pAmple_io;
{
pAmple_io->iAlloListIndex = 0;		/* initially, nothing used */
memset(pAmple_io->asAlloList, 0, sizeof(pAmple_io->asAlloList));
}

/*****************************************************************************
 * NAME
 *    mkalist
 * DESCRIPTION
 *    creates an alist structure and its associated allomorph
 *    structure for a dictionary entry
 * RETURN VALUE
 *    pointer to an alist structure
 */
static AmpleAllomorphList * mkalist(ahead, eDictType_in, mptr, pAmple_io)
AmpleAllomorphList *	ahead;	/* pointer to head of alist linked list */
int			eDictType_in;	/* AMPLE_PFX, AMPLE_IFX,
					   AMPLE_ROOT, or AMPLE_SFX */
AmpleMorpheme *		mptr;	/* pointer to the morpheme structure
				 * associated with this allomorph */
AmpleData * pAmple_io;
{
AmpleAllomorphList * alp;

if (pAmple_io->iAlloListIndex < MAXALPS)
	alp = &pAmple_io->asAlloList[pAmple_io->iAlloListIndex++];
else
	alp = (AmpleAllomorphList *)allocMemory(sizeof(AmpleAllomorphList));
alp->pNext = ahead;
ahead = alp;
alp->pAllomorph = (AmpleAllomorph *)allocMemory(sizeof(AmpleAllomorph));
/*
 *  set morpheme pointer
 */
alp->pAllomorph->pMorpheme = mptr;
/*
 *  set dictionary type code
 */
alp->pAllomorph->iMORPHTYPE = eDictType_in & ATYPE;

return( alp );
}

/*****************************************************************************
 * NAME
 *    make_root_excep
 * ARGUMENTS
 *    head - pointer to the head of a strlist linked list
 *    str  - pointer to string to be added to list
 *    rsc  - regular sound change flag
 * DESCRIPTION
 *    add a strlist struct to the linked list of root morphname exceptions
 * RETURN VALUE
 *    pointer to new head of the strlist linked list
 */
static StringList * make_root_excep( head, str, rsc)
StringList * head;
char * str;
int rsc;
{
register StringList *strlp;
register char *cp;
				/* allocate strlist struct */
strlp = (StringList *) allocMemory(sizeof(StringList));
		   /* link it in */
if (!head) {
	head = strlp;
	head->pNext = (StringList *)NULL;
	}
else {
	strlp->pNext = head;
	head = strlp;
	}
		   /* allocate space for the morphname string */
head->pszString = cp = allocMemory(strlen(str) + rsc + 1);
		   /* insert * for proto form */
if (rsc)
	*cp++ = '*';
		   /* copy in string */
strcpy( cp, str);

return(head);
}

#ifdef HAVE_PROTOTYPES
/* 1.9q MRP: ANSI Standard prototypes for qsort and bsearch require
 * the following prototype for their comparator function. The actual
 * data to be compared is a (pointer to a) string terminated by zero.
 */
static int compare(const void *pvA, const void *pvB)
{
const char *pszA, *pszB;
pszA = *(const char **) pvA;
pszB = *(const char **) pvB;
return( strcmp(pszA,pszB) );
}
#else
static int compare(a,b)  char **a,**b;  {  return( strcmp(*a,*b) );  }
#endif

/*****************************************************************************
 * NAME
 *    checkAmpleMorphs
 * DESCRIPTION
 *    Check that all referenced morphnames are defined in the dictionaries.
 *    Morphname references are checked in:
 *              allomorph environment constraints,
 *              morpheme co-occurrence constraints,
 *              user-defined tests,
 *              morpheme classes, and
 *              adhoc-pairs.
 *    An error message is displayed for each unrecognized morphname.
 *    Duplicate morphnames are also checked for.
 * RETURN VALUE
 *    none
 */
void checkAmpleMorphs(bCheckMorphs_in, pAmple_in, bFreeSpaceWhenDone)
int		bCheckMorphs_in;
AmpleData *	pAmple_in;
int             bFreeSpaceWhenDone; /* 3.3.3 hab; added flag */
{
#ifdef MORPH_CHECK_DEBUG
register int i;
#endif
if (bCheckMorphs_in && (pAmple_in->ppszMorphNames != NULL))
	{
	/*
	 *  sort the array so we can use binary search on it later
	 */
	qsort( (char *)pAmple_in->ppszMorphNames,
	   (size_t)pAmple_in->iMorphNameCount, sizeof(char *),
	   compare );

#ifdef MORPH_CHECK_DEBUG
	if (pAmple_in->pLogFP != NULL)
	{
	for ( i = 0 ; i < pAmple_in->iMorphNameCount ; ++i )
		fprintf(pAmple_in->pLogFP, "morphs[%d] = %s\n",
			i, pAmple_in->ppszMorphNames[i] );
	}
#endif
	chk_mecs(pAmple_in); 	        /* check MECs */
	chk_mccs(pAmple_in);		/* check MCCs */
	chk_user_test(pAmple_in);		/* check user tests */
	chk_morph_classes(pAmple_in);	/* check morpheme classes */
	chk_adhoc_pairs(pAmple_in);		/* check adhoc pairs */
	chk_duplicates(pAmple_in);  	/* check duplicate morphnames*/
	}
/*
 *  free memory used just for checking purposes
 */
if (bFreeSpaceWhenDone)		/* 3.3.3 hab; added check for flag */
  freeAmpleMorphsForChecking(pAmple_in);
}

/*****************************************************************************
 * NAME
 *    initAmpleMorphChecking
 * DESCRIPTION
 *    initialize the arrays for morphname and allomorph checking
 * RETURN VALUE
 *    none
 */
void initAmpleMorphChecking(bCheckMorphs_in, pAmple_io)
int	    bCheckMorphs_in;
AmpleData * pAmple_io;
{
if (bCheckMorphs_in)
	{
	/*
	 *  allocate space for morphname pointer array and allomorph pointer array
	 */
	if (pAmple_io->ppszMorphNames == NULL)
	pAmple_io->ppszMorphNames = (char **)allocMemory( MAX_NUM_MORPHS *
								   sizeof(char *));
	if (pAmple_io->ppAllomorphs == NULL)
	pAmple_io->ppAllomorphs = (AmpleAllomorph **)allocMemory( MAX_NUM_ALLOS *
							 sizeof(AmpleAllomorph *));
	}
else
	{
	if (pAmple_io->ppszMorphNames != NULL)
	{
	freeMemory(pAmple_io->ppszMorphNames);
	pAmple_io->ppszMorphNames = NULL;
	}
	if (pAmple_io->ppAllomorphs != NULL)
	{
	freeMemory(pAmple_io->ppAllomorphs);
	pAmple_io->ppAllomorphs = NULL;
	}
	}
pAmple_io->iMorphNameCount = 0;
pAmple_io->iAllomorphCount = 0;
}

/*****************************************************************************
 * NAME
 *    freeAmpleMorphsForChecking
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Free all morpheme space allocated for checking purposes
 * RETURN VALUE
 *    none
 */
static void freeAmpleMorphsForChecking(pAmple_in)
AmpleData *	pAmple_in;
{
/*
 *  release the array space itself -- we no longer need it
 */
if (pAmple_in->ppszMorphNames != NULL)
	{
	freeMemory( (char *)pAmple_in->ppszMorphNames );
	pAmple_in->ppszMorphNames = (char **)NULL;
	if (pAmple_in->iDebugLevel && (pAmple_in->pLogFP != NULL))
	fprintf(pAmple_in->pLogFP, "%d morphemes.\n",
		pAmple_in->iMorphNameCount );
	}
pAmple_in->iMorphNameCount = 0;

if (pAmple_in->ppAllomorphs != NULL)
	{
	freeMemory( pAmple_in->ppAllomorphs );
	pAmple_in->ppAllomorphs = (AmpleAllomorph **)NULL;
	}
pAmple_in->iAllomorphCount = 0;

/* release any space used by root exceptions */
freeStringList( pAmple_in->pRootMorphnameExceptions );
pAmple_in->pRootMorphnameExceptions = (StringList *)NULL;
}

/****************************************************************************
 * NAME
 *    chk_mecs
 * DESCRIPTION
 *    print a message whenever an unknown morphname is found
 *        in a morpheme environment constraint
 * RETURN VALUE
 *    none
 */
static void chk_mecs(pAmple_in)
AmpleData *	pAmple_in;
{
register int i;
register AmpleEnvConstraint *ep;
register AmpleEnvItem *ip;

if ((pAmple_in->ppszMorphNames == NULL) || (pAmple_in->ppAllomorphs == NULL))
	return;
/*
 *  check the allomorph environment constraints
 */
for ( i = 0 ; i < pAmple_in->iAllomorphCount ; ++i )
	{
	for (   ep = pAmple_in->ppAllomorphs[i]->pEnvironment->pMorphCond ;
		ep ;
		ep = ep->pNext )
	{
	for ( ip = ep->pLeftEnv ; ip ; ip = ip->pNext )
		{
		if (   !(ip->iFlags & E_CLASS) &&
		   !(ip->iFlags & E_GROUP) &&
		   (ip->iFlags & E_MORPHEME) &&
		   (ip->u.pszString != (char *)NULL) &&
		   (bsearch((char *)&(ip->u.pszString),
				(char *)pAmple_in->ppszMorphNames,
				(unsigned)pAmple_in->iMorphNameCount,
				sizeof(char *), compare) == (char *)NULL) )
		badmenv( ip->u.pszString, pAmple_in->ppAllomorphs[i],
			 pAmple_in->pLogFP);
		}
	for ( ip = ep->pRightEnv ; ip ; ip = ip->pNext )
		{
		if (   !(ip->iFlags & E_CLASS) &&
		   !(ip->iFlags & E_GROUP) &&
			(ip->iFlags & E_MORPHEME) &&
		   (ip->u.pszString != (char *)NULL) &&
		   (bsearch( (char *)&(ip->u.pszString),
				 (char *)pAmple_in->ppszMorphNames,
				 (unsigned)pAmple_in->iMorphNameCount,
				 sizeof(char *), compare) == (char *)NULL) )
		badmenv( ip->u.pszString, pAmple_in->ppAllomorphs[i],
			 pAmple_in->pLogFP);
		}
	}
	}
}

/****************************************************************************
 * NAME
 *    badmenv
 * ARGUMENTS
 *    mname - pointer to unknown morphname
 *    ap    - pointer to allomorph with bad environment constraint
 * DESCRIPTION
 *    print a message whenever an unknown morphname is found in a constraint
 * RETURN VALUE
 *    none
 */
static void badmenv(mname, ap, pLogFP_in)
char *		mname;
AmpleAllomorph *ap;
FILE *		pLogFP_in;
{
if (pLogFP_in == NULL)
	return;
fprintf(pLogFP_in,
	szMorphCheckError_m, mname, "morpheme environment constraint", "");
fprintf(pLogFP_in, "%8s","");
fprintf(pLogFP_in, "( %s ) ", ap->pMORPHNAME );
writeAmpleEnvConstraint(pLogFP_in, ap->pEnvironment->pMorphCond, FALSE);
fprintf(pLogFP_in, "\n");
}

/*****************************************************************************
 * NAME
 *    check_mcc
 * DESCRIPTION
 *    check this morpheme co-occurrence constraint for errors
 * RETURN VALUE
 *    none
 */
static void check_mcc(pMorphConstraint_in, pAmple_in)
AmpleMorphConstraint *	pMorphConstraint_in;
AmpleData *		pAmple_in;
{
AmpleMorphlist *	tp;
AmpleEnvConstraint *	ep;
AmpleEnvItem *		ip;
/*
 *  check the morphlist
 */
for ( tp = pMorphConstraint_in->pMorphs ; tp ; tp = tp->pNext )
	{
	if (    !tp->bClass &&
		(bsearch( (char *)&(tp->u.pszMorphName),
			  (char *)pAmple_in->ppszMorphNames,
			  (unsigned)pAmple_in->iMorphNameCount, sizeof(char *),
			  compare ) == (char *)NULL) )
	badmorph( tp->u.pszMorphName, pMorphConstraint_in,
		  pAmple_in->pLogFP);
	}
/*
 *  check the left environment
 */
for ( ep = pMorphConstraint_in->pEnvironment ; ep ; ep = ep->pNext )
	{
	for ( ip = ep->pLeftEnv ; ip ; ip = ip->pNext )
	{
	if (   !(ip->iFlags & E_CLASS) &&
		   !(ip->iFlags & E_GROUP) &&
		   (ip->iFlags & E_MORPHEME) &&
		   (ip->u.pszString != (char *)NULL) &&
		   (bsearch( (char *)&(ip->u.pszString),
			 (char *)pAmple_in->ppszMorphNames,
			 (unsigned)pAmple_in->iMorphNameCount,
			 sizeof(char *), compare) == (char *)NULL) )
		badmorph( ip->u.pszString, pMorphConstraint_in,
			  pAmple_in->pLogFP);
	}
	/*
	 *  check the right environment
	 */
	for ( ip = ep->pRightEnv ; ip ; ip = ip->pNext )
	{
	if (   !(ip->iFlags & E_CLASS) &&
		   !(ip->iFlags & E_GROUP) &&
		   (ip->iFlags & E_MORPHEME) &&
		   (ip->u.pszString != (char *)NULL) &&
		   (bsearch( (char *)&(ip->u.pszString),
			 (char *)pAmple_in->ppszMorphNames,
			 (unsigned)pAmple_in->iMorphNameCount,
			 sizeof(char *), compare) == (char *)NULL) )
		badmorph( ip->u.pszString, pMorphConstraint_in,
			  pAmple_in->pLogFP);
	}
	}
}

/****************************************************************************
 * NAME
 *    chk_mccs
 * DESCRIPTION
 *    print a message whenever an unknown morphname is found
 *        in a morpheme co-occurrence constraint
 * RETURN VALUE
 *    none
 */
static void chk_mccs(pAmple_in)
AmpleData *	pAmple_in;
{
AmpleMorphConstraint *	pConstraint;
AmpleMorpheme *		pMorph;

if (pAmple_in->ppszMorphNames == NULL)
	return;
/*
 *  check the morpheme co-occurrence constraints
 */
for (	pConstraint = pAmple_in->pMorphConstraints ;
	pConstraint ;
	pConstraint = pConstraint->pNext )
	check_mcc(pConstraint, pAmple_in);
for (	pMorph = pAmple_in->pAmpleMorphemes ;
	pMorph ;
	pMorph = pMorph->pLink )
	{
	for (   pConstraint = pMorph->pMorphConstraints ;
		pConstraint ;
		pConstraint = pConstraint->pNext )
	check_mcc(pConstraint, pAmple_in);
	}
}

/****************************************************************************
 * NAME
 *    badmorph
 * ARGUMENTS
 *    mname - pointer to unknown morphname
 *    mcon  - pointer to morpheme co-occurrence constraint
 * DESCRIPTION
 *    print a message whenever an unknown morphname is found in a constraint
 * RETURN VALUE
 *    none
 */
static void badmorph(mname, mcon, pLogFP_in)
char *		mname;
AmpleMorphConstraint *mcon;
FILE *		pLogFP_in;
{
register AmpleMorphlist *mp;

if (pLogFP_in == NULL)
	return;

fprintf(pLogFP_in, szMorphCheckError_m, mname, "co-occurrence constraint", "");
fprintf(pLogFP_in, "%8s","");
for ( mp = mcon->pMorphs ; mp ; mp = mp->pNext )
	{
	if (mp->bClass)
	fprintf(pLogFP_in, "[%s] ", mp->u.pMorphClass->pszName );
	else
	fprintf(pLogFP_in, "%s ", mp->u.pszMorphName );
	}
writeAmpleEnvConstraint(pLogFP_in, mcon->pEnvironment, FALSE);
fprintf(pLogFP_in, "\n");
}


/****************************************************************************
 * NAME
 *    chk_user_test
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    print a message whenever an unknown morphname is found
 *        in a user defined test
 * RETURN VALUE
 *    none
 */
static void chk_user_test(pAmple_in)
AmpleData *	pAmple_in;
{
register AmpleTestList *flp;
/*
 *  prefixes
 */
for ( flp = pAmple_in->pPrefixSuccTests ; flp ; flp = flp->pNext )
	{
	if ( flp->pTestTree )
	ctest(flp->pTestTree, flp->pszName, pAmple_in);
	}
/*
 *  infixes
 */
for ( flp = pAmple_in->pInfixSuccTests ; flp ; flp = flp->pNext )
	{
	if ( flp->pTestTree )
	ctest(flp->pTestTree, flp->pszName, pAmple_in);
	}
/*
 *  roots
 */
for ( flp = pAmple_in->pRootSuccTests ; flp ; flp = flp->pNext )
	{
	if ( flp->pTestTree )
	ctest(flp->pTestTree, flp->pszName, pAmple_in);
	}
/*
 *  suffixes
 */
for ( flp = pAmple_in->pSuffixSuccTests ; flp ; flp = flp->pNext )
	{
	if ( flp->pTestTree )
	ctest(flp->pTestTree, flp->pszName, pAmple_in);
	}
/*
 *  final tests
 */
for ( flp = pAmple_in->pFinalTests ; flp ; flp = flp->pNext )
	{
	if ( flp->pTestTree )
	ctest(flp->pTestTree, flp->pszName, pAmple_in);
	}
}

/***************************************************************************
 * NAME
 *    ctest
 * ARGUMENTS
 *    tree     - pointer to a node in the syntax tree of a test
 *    testname - pointer to the testname
 * DESCRIPTION
 *    Traverse the syntax tree structure in postorder fashion,
 *    checking for valid morphname references in the process.
 *    This function is highly recursive.
 * RETURN VALUE
 *    none.
 */
static void ctest( tree, testname, pAmple_in)
AmpleTestNode *	tree;
char *		testname;
AmpleData *	pAmple_in;
{
AmpleLeftSide left;
AmpleRightSide right;
char *right_string;

if (pAmple_in->ppszMorphNames == NULL)
	return;
if (tree == (AmpleTestNode *)NULL)
	return;                             /* no test */
/*
 *  put in variables for efficiency -- use largest elements of the unions
 */
left.pChild     = tree->uLeft.pChild;
right.pszString = tree->uRight.pszString;

switch (tree->iOpCode & OP_MASK)
	{
				/*
				 *  these nodes have subtrees
				 */
	case TOP_NODE:
	ctest( left.pChild, testname, pAmple_in);
	break;
	case LOGAND:                /* 'AND' */
	case LOGOR:                 /* 'OR' */
	case LOGXOR:                /* 'XOR' */
	case LOGIFF:                /* 'IFF' */
	case LOGIF:                 /* 'IF' ... 'THEN' */
	case ALL_LEFT:              /* 'FOR_ALL_LEFT' */
	case SOME_LEFT:             /* 'FOR_SOME_LEFT' */
	case ALL_RIGHT:             /* 'FOR_ALL_RIGHT' */
	case SOME_RIGHT:            /* 'FOR_SOME_RIGHT' */
	ctest(left.pChild,  testname, pAmple_in);	/* check left son */
	ctest(right.pChild, testname, pAmple_in);	/* check right son */
	break;

	case MORPH_IS:              /* 'morphname' 'is' STRING */
	/* check for existence of morphname */
	right_string = (char *)right.pszString;
	if (bsearch( (char *)&(right_string),
			 (char *)pAmple_in->ppszMorphNames,
			 (unsigned)pAmple_in->iMorphNameCount, sizeof(char *),
			 compare ) == (char *)NULL)
		{
		if (pAmple_in->pLogFP != NULL)
		fprintf(pAmple_in->pLogFP, szMorphCheckError_m,
			right.pszString, "user test:", testname);
		}
	break;

	default:
	return;
	  }
}

/****************************************************************************
 * NAME
 *    chk_morph_classes
 * DESCRIPTION
 *    print a message whenever an unknown morphname is found in a morpheme
 *    class
 * RETURN VALUE
 *    none
 */
static void chk_morph_classes(pAmple_in)
const AmpleData *	pAmple_in;
{
AmpleMorphClass *	mcl;
StringList *		sp;

if (pAmple_in->ppszMorphNames == NULL)
	return;
/*
 *  check all morpheme classes
 */
for ( mcl = pAmple_in->pMorphClasses ; mcl ; mcl = mcl->pNext )
	{
	for ( sp = mcl->pMembers ; sp ; sp = sp->pNext )
	{
	if (bsearch( (char *)&(sp->pszString),
			 (char *)pAmple_in->ppszMorphNames,
			 (unsigned)pAmple_in->iMorphNameCount, sizeof(char *),
			 compare ) == (char *)NULL)
		{
		if (pAmple_in->pLogFP != NULL)
		fprintf(pAmple_in->pLogFP, szMorphCheckError_m,
			sp->pszString, "morpheme class:", mcl->pszName);
		}
	}
	}
}

/****************************************************************************
 * NAME
 *    chk_adhoc_pairs
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    check all adhoc pair lists for unknown morphnames
 * RETURN VALUE
 *    none
 */
static void chk_adhoc_pairs(pAmple_in)
AmpleData *	pAmple_in;
{
				/* prefixes */
chk_AHpair( pAmple_in->pPrefixAdhocPairs, "prefix adhoc pair",
		pAmple_in);

				/* infixes */
chk_AHpair( pAmple_in->pInfixAdhocPairs, "infix adhoc pair",
		pAmple_in);

				/* roots */
chk_AHpair( pAmple_in->pRootAdhocPairs, "root adhoc pair",
		pAmple_in);

				/* suffixes */
chk_AHpair( pAmple_in->pSuffixAdhocPairs, "suffix adhoc pair",
		pAmple_in);
}

/****************************************************************************
 * NAME
 *    chk_AHpair
 * ARGUMENTS
 *    adhoc_list - pointer to head of the adhoc pair list
 *    msg        - error message text
 * DESCRIPTION
 *    print a message whenever an unknown morphname is found
 *        in a given adhoc pair list
 * RETURN VALUE
 *    none
 */
static void chk_AHpair(adhoc_list, msg, pAmple_in)
AmplePairList *	adhoc_list;
char *		msg;
AmpleData *	pAmple_in;
{
register AmplePairList *plp;

if (pAmple_in->ppszMorphNames == NULL)
	return;
if (pAmple_in->pLogFP == NULL)
	return;

				/* check each member of the list */
for ( plp = adhoc_list ; plp != (AmplePairList *)NULL ; plp = plp->pNext )
	{
				/* check left element of the pair */
	if (bsearch( (char *)&(plp->pszLeft), (char *)pAmple_in->ppszMorphNames,
			 (unsigned)pAmple_in->iMorphNameCount, sizeof(char *),
			 compare ) == (char *)NULL)
	fprintf(pAmple_in->pLogFP, szMorphCheckError_m, plp->pszLeft, msg, "");

				/* check right element of the pair */
	if (bsearch( (char *)&(plp->pszRight), (char *)pAmple_in->ppszMorphNames,
			 (unsigned)pAmple_in->iMorphNameCount, sizeof(char *),
			 compare ) == (char *)NULL)
	fprintf(pAmple_in->pLogFP, szMorphCheckError_m, plp->pszRight, msg, "");
	}
}


/****************************************************************************
 * NAME
 *    chk_duplicates
 * DESCRIPTION
 *    print a message whenever a duplicate morphname is found in the array
 *    of morphnames
 * RETURN VALUE
 *    none
 */
static void chk_duplicates(pAmple_in)
AmpleData *	pAmple_in;
{
register int i;

if (pAmple_in->ppszMorphNames == NULL)
	return;
if (pAmple_in->pLogFP == NULL)
	return;

for ( i = 1 ; i < pAmple_in->iMorphNameCount ; ++i )
	{
	if (strcmp(pAmple_in->ppszMorphNames[i-1],
		   pAmple_in->ppszMorphNames[i]) == 0)
	fprintf(pAmple_in->pLogFP,
		"MORPH_CHECK: Duplicate morphname found: %s\n",
		pAmple_in->ppszMorphNames[i]);
	}
}

/***************************************************************************
 * NAME
 *    showAmpleAlloEnvConstraint
 * ARGUMENTS:
 *    alp     - pointer to an alist structure
 *    dictstr - string for dictionary type
 * DESCRIPTION
 *    Display the structures built for an allomorph environment condition.
 * RETURN VALUE
 *    none
 */
static void showAmpleAlloEnvConstraint(alp, dictstr, pLogFP_in)
AmpleAllomorphList *	alp;
char *			dictstr;
FILE *			pLogFP_in;
{
if (pLogFP_in == NULL)
	return;

fprintf(pLogFP_in, "Conditions for %s (%s), allomorph: %s",
	dictstr,
	alp->pAllomorph->pMORPHNAME ? alp->pAllomorph->pMORPHNAME : "",
	alp->pszAllomorph );
if (alp->pAllomorph->pEnvironment != (AmpleAlloEnv *)NULL)
	{
	writeAmpleEnvConstraint(pLogFP_in,
				alp->pAllomorph->pEnvironment->pStringCond, FALSE);
#ifndef hab380
	writeAmpleEnvConstraint(pLogFP_in,
				alp->pAllomorph->pEnvironment->pNegStringCond, FALSE);
#endif /* hab380 */
	writeAmpleEnvConstraint(pLogFP_in,
				alp->pAllomorph->pEnvironment->pMorphCond, FALSE);
				/* 3.3.0 hab */
	writeAmpleEnvConstraint(pLogFP_in,
				alp->pAllomorph->pEnvironment->pPunctCond, FALSE);
	}
if (	matchBeginning(dictstr,"INFIX") &&
	(alp->pAllomorph->pINFIX->pInfixEnv != (AmpleEnvConstraint *)NULL) )
	{
	fprintf(pLogFP_in, "\n    location field:");
	if (alp->pAllomorph->pINFIX->iInfixLoc & AMPLE_PFX)
	fprintf(pLogFP_in," %s", "prefix");
	if (alp->pAllomorph->pINFIX->iInfixLoc & AMPLE_ROOT)
	fprintf(pLogFP_in," %s", "root");
	if (alp->pAllomorph->pINFIX->iInfixLoc & AMPLE_SFX)
	fprintf(pLogFP_in," %s", "suffix");
	/* string environments */
	writeAmpleEnvConstraint(pLogFP_in, alp->pAllomorph->pINFIX->pInfixEnv,
				FALSE);
	}
fputc('\n', pLogFP_in);		/* hab 3.2.4 */
}

/****************************************************************************
 * NAME
 *    free_entry
 * DESCRIPTION
 *    Free the memory used by the list of AmpleAllomorph structs.
 * RETURN VALUE
 *    none
 */
static void free_entry(pList_in)
VOIDP	pList_in;	/* a linked list of AmpleAllomorph structs */
{
AmpleAllomorph *	pList = pList_in;
AmpleAllomorph *	pEntry;

for ( pList = pList_in ; pList ;  )
	{
	pEntry = pList;
	pList  = pList->pNext;
	if (pEntry->pszAllomorph != NULL)
	freeMemory( pEntry->pszAllomorph );
	if (pEntry->pszAllomorphID != NULL)
	freeMemory( pEntry->pszAllomorphID );
#ifndef hab3318
	if (pEntry->pEnvironment != NULL)
	freeAmpleAlloEnvConstraint( pEntry->pEnvironment );
#else
/*    if (    ((pEntry->iMORPHTYPE & AMPLE_ROOT) == 0) &&*/
/*	    (pEntry->pEnvironment != NULL) )*/
/*	freeAmpleAlloEnvConstraint( pEntry->pEnvironment );*/
#endif /* hab3318 */
	freeMemory( pEntry );
	}
}

/*****************************************************************************
 * NAME
 *    freeAmpleAffixInfo
 * DESCRIPTION
 *    free the memory allocated for the AmpleAffixInfo struct
 * RETURN VALUE
 *    none
 */
static void freeAmpleAffixInfo(pAffix_in)
AmpleAffixInfo *	pAffix_in;
{
if (pAffix_in == NULL)
	return;
if (pAffix_in->pFromCategories != NULL)
	freeMemory(pAffix_in->pFromCategories);
if (pAffix_in->pToCategories != NULL)
	freeMemory(pAffix_in->pToCategories);
freeMemory(pAffix_in);
}

/*****************************************************************************
 * NAME
 *    freeAmpleInfixInfo
 * DESCRIPTION
 *    free the memory allocated for the AmpleInfixInfo struct
 * RETURN VALUE
 *    none
 */
static void freeAmpleInfixInfo(pInfix_in)
AmpleInfixInfo *	pInfix_in;
{
if (pInfix_in == NULL)
	return;
if (pInfix_in->pFromCategories != NULL)
	freeMemory(pInfix_in->pFromCategories);
if (pInfix_in->pToCategories != NULL)
	freeMemory(pInfix_in->pToCategories);
if (pInfix_in->pInfixEnv != NULL)
	freeAmpleEnvConstraint( pInfix_in->pInfixEnv );
freeMemory(pInfix_in);
}

/*****************************************************************************
 * NAME
 *    freeAmpleRootInfo
 * DESCRIPTION
 *    free the memory allocated for the AmpleRootInfo struct
 * RETURN VALUE
 *    none
 */
static void freeAmpleRootInfo(pRoot_in)
AmpleRootInfo *		pRoot_in;
{
if (pRoot_in == NULL)
	return;
if (pRoot_in->pszRootGloss != NULL)
	freeMemory(pRoot_in->pszRootGloss);
freeMemory(pRoot_in);
}

/*****************************************************************************
 * NAME
 *    freeAmpleMorpheme
 * DESCRIPTION
 *    free the memory allocated for an AMPLE morpheme
 * RETURN VALUE
 *    none
 */
void freeAmpleMorpheme(pMorph_in, pAmple_in)
AmpleMorpheme *	pMorph_in;
AmpleData *	pAmple_in;
{
if (pMorph_in == NULL)
	return;
if (pMorph_in->pszMorphName != NULL)
	freeMemory(pMorph_in->pszMorphName);
if (pMorph_in->pszMorphFd != NULL)
	freeMemory(pMorph_in->pszMorphFd);
if (pMorph_in->pszUnderForm != NULL)
	freeMemory(pMorph_in->pszUnderForm);
#ifdef EXPERIMENTAL
if (pMorph_in->pPATRFeature != NULL)
	freePATRFeature(pMorph_in->pPATRFeature, &pAmple_in->sPATR);
#endif /* EXPERIMENTAL */
if (pMorph_in->pMorphConstraints != NULL)
	freeAmpleMorphConstraints(pMorph_in->pMorphConstraints);
if (pMorph_in->u.pRootCategories != NULL)
	{
	if (pMorph_in->iMorphType & (AMPLE_PFX | AMPLE_SFX))
	{
	freeAmpleAffixInfo(pMorph_in->u.pAffix);
	}
	else if (pMorph_in->iMorphType & AMPLE_IFX)
	{
	freeAmpleInfixInfo(pMorph_in->u.pInfix);
	}
	else if (pAmple_in->bRootGlosses)
	{
	freeAmpleRootInfo(pMorph_in->u.pRoot);
	}
	else
	{
	/* do nothing -- root category storage is allocated separately */
	}
	}
freeMemory(pMorph_in);
}

/*****************************************************************************
 * NAME
 *    freeFullRedupAllos
 * DESCRIPTION
 *    free the memory allocated for a full reduplication allomorph
 * RETURN VALUE
 *    none
 */
void freeFullRedupAllos(FullReduplication * pFullRedupAllos_in)
{
FullReduplication * pRedup;
FullReduplication * pRedupNext;
if (pFullRedupAllos_in == NULL)
	return;
 for (pRedup = pFullRedupAllos_in;
	  pRedup != NULL;
	  pRedup = pRedupNext)
   {
	freeMemory( pRedup->pszPrefix );
	freeMemory( pRedup->pszPostfix );
	pRedupNext = pRedup->pNext;
	freeMemory(pRedup);
   }
}

/*****************************************************************************
 * NAME
 *    freeAmpleDictionary
 * DESCRIPTION
 *    free everything used to store the AMPLE dictionary
 * RETURN VALUE
 *    none
 */
void freeAmpleDictionary(pAmple_io)
AmpleData *	pAmple_io;
{
AmpleAlloEnv *	pAlloEnv;
AmpleAlloEnv *	pNextEnv;
AmpleMorpheme *	pMorph;
AmpleMorpheme *	pNextMorph;

if (pAmple_io->pDictionary != NULL)
	{
	eraseTrie(pAmple_io->pDictionary, free_entry);
	pAmple_io->pDictionary = NULL;
	}
if (pAmple_io->pDictionaryFiles != NULL)
	{
	freeStringList( pAmple_io->pDictionaryFiles );
	pAmple_io->pDictionaryFiles = NULL;
	}
for ( pAlloEnv = pAmple_io->pAllomorphEnvs ; pAlloEnv ; pAlloEnv = pNextEnv )
	{
	pNextEnv = pAlloEnv->pLink;
	freeAmpleAlloEnvConstraint( pAlloEnv );
	}
pAmple_io->pAllomorphEnvs = NULL;
for ( pMorph = pAmple_io->pAmpleMorphemes ; pMorph ; pMorph = pNextMorph )
	{
	pNextMorph = pMorph->pLink;
	freeAmpleMorpheme( pMorph, pAmple_io );
	}
pAmple_io->pAmpleMorphemes = NULL;
#ifdef EXPERIMENTAL
if (pAmple_io->pPATRCategories != NULL)
	{
	freeStringList(pAmple_io->pPATRCategories);
	pAmple_io->pPATRCategories = NULL;
	}
#endif /* EXPERIMENTAL */
if (pAmple_io->pCatSets != NULL)
	{
	freeStringList( pAmple_io->pCatSets );
	pAmple_io->pCatSets = NULL;
	}
if (pAmple_io->pEnvStrings != NULL)
	{
	freeStringList(pAmple_io->pEnvStrings);
	pAmple_io->pEnvStrings = NULL;
	}
if (pAmple_io->pFullRedupAllos != NULL)
   {
	 freeFullRedupAllos(pAmple_io->pFullRedupAllos);
	 pAmple_io->pFullRedupAllos = NULL;
   }
if (pAmple_io->pPartialRedupAllos != NULL)
   {
	 freePartialRedupAllos(pAmple_io->pPartialRedupAllos);
	 pAmple_io->pPartialRedupAllos = NULL;
   }
}

/*****************************************************************************
 * NAME
 *    get_allomorph_id
 * DESCRIPTION
 *    isolate the allomorph ID string and make a copy of it
 * RETURN VALUE
 *    pointer to dynamically allocated allomorph ID string
 */
static char * get_allomorph_id(pszID_in)
char *	pszID_in;
{
char *	p;

if (pszID_in == NULL)
	return NULL;
if (*pszID_in == '{')
	++pszID_in;
p = strchr(pszID_in, '}');
if (p != NULL)
	*p = NUL;
return duplicateString( pszID_in );
}

/*****************************************************************************
 * NAME
 *    build_allomorph_id
 * DESCRIPTION
 *    create an allomorph ID string from the morpheme ID and the index of this
 *    allomorph in the dictionary entry
 * RETURN VALUE
 *    pointer to dynamically allocated allomorph ID string
 */
static char * build_allomorph_id(pszMorph_in, iIndex_in)
char *	pszMorph_in;
int	iIndex_in;
{
char	szIndex[16];

sprintf(szIndex, "_%d", iIndex_in);
return strcat(strcpy(allocMemory(strlen(pszMorph_in) + strlen(szIndex) + 1),
			 pszMorph_in), szIndex);
}

/*****************************************************************************
 * NAME
 *    convertRecord
 * DESCRIPTION
 *    convert the standard format dictionary record into its internal form
 * RETURN VALUE
 *    pointer to a dynamically allocated record, or NULL if an error occurs
 */
static char * convertRecord(pszEntry_in, pAmple_io)
const char *	pszEntry_in;
AmpleData *	pAmple_io;
{
char *		pRecord;
const CodeTable *	pCodeTable;
unsigned	i;
unsigned	j;
size_t		uiLength;
char *		pszField;
char *		pszCode;
char		ch;

if (pszEntry_in == NULL)
	return NULL;
while (*pszEntry_in == '\n')
	++pszEntry_in;
if (*pszEntry_in != '\\')
	return NULL;

pCodeTable   = pAmple_io->pDictTable;
if (pCodeTable == NULL)
	pCodeTable = &sDefaultCodeTable_m;
pAmple_io->pszDicType = "UNIFIED";
pAmple_io->pszAmpleDictErrorHeader = "UNIFIED DICTIONARY: ";
/*
 *  copy the input string, but ensure 2 NULs at the end, not just one
 */
uiLength = strlen(pszEntry_in);
pRecord = allocMemory(uiLength + 2);
strcpy(pRecord, pszEntry_in);
pRecord[uiLength+1] = NUL;
/*
 *  convert the record to its normalized form
 */
for ( pszField = pRecord ; pszField ; pszField = strchr(pszField, '\n') )
	{
	if (*pszField == '\n')
	{
	while (pszField[1] != '\\')
		{
		++pszField;
		pszField = strchr(pszField, '\n');
		if (pszField == NULL)
		{
		return pRecord;
		}
		}
	*pszField++ = NUL;
	}
	for (   i = 0, pszCode = pCodeTable->pCodeTable ;
		i < pCodeTable->uiCodeCount ;
		++i, pszCode += uiLength + 3 )
	{
	uiLength = strlen(pszCode);
	if (matchBeginning(pszField, pszCode))
		{
		ch = pszField[uiLength];
		if (    (ch == NUL) ||
			(isascii(ch) && isspace(ch)) )
		{
		pszCode += uiLength + 1;
		pszField[0] = *pszCode;
		for ( j = 1 ; j < uiLength ; ++j )
			pszField[j] = ' ';
		break;
		}
		}
	}
	}
return pRecord;
}

/*****************************************************************************
 * NAME
 *    updateAmpleDictEntry
 * DESCRIPTION
 *    add this entry to the AMPLE dictionary, deleting any old entry with the
 *    same morphname and type
 *    if the dictionary codes for a unified dictionary do not exist, the entry
 *    is assumed to use "AmpleLinks Canonical Format" standard format markers
 * RETURN VALUE
 *    0 if an error occurs, 1 if an existing morpheme is replaced, or 2 if this
 *    is a new entry
 */
int updateAmpleDictEntry(pszEntry_in, pAmple_io)
const char *	pszEntry_in;
AmpleData *	pAmple_io;
{
int	iStatus;
char *	pszMorph = NULL;
char *	pRecord;
int	iType = 0;
char *	pszField;
char *	p;
char	ch = NUL;
int	bDontLoad = FALSE;

pRecord = convertRecord(pszEntry_in, pAmple_io);
if (pRecord == NULL)
	return 0;

for ( pszField = pRecord ; *pszField ; pszField += strlen(pszField) + 1 )
	{
	switch (*pszField)
	{
	case 'M':
		pszMorph = pszField + strspn(pszField + 1, szWhitespace_m) + 1;
		break;
	case 'T':
		p = pszField + strspn(pszField + 1, szWhitespace_m) + 1;
		switch (*p)
		{
		case 'I':  case 'i':	iType = AMPLE_IFX;	break;
		case 'P':  case 'p':	iType = AMPLE_PFX;	break;
		case 'R':  case 'r':	iType = AMPLE_ROOT;	break;
		case 'S':  case 's':	iType = AMPLE_SFX;	break;
		}
		break;
	case '!':
		bDontLoad = TRUE;
		break;
	default:
		break;
	}
	}
if (iType == 0)
	iType = AMPLE_ROOT;
if ((pszMorph == NULL) || (*pszMorph == NUL))
	{
	freeMemory(pRecord);
	return 0;
	}
/*
 *  temporarily remove any trailing whitespace from the morphname
 */
p = strpbrk(pszMorph, szWhitespace_m);
if (p != NULL)
	{
	ch = *p;
	*p = NUL;
	}
iStatus = 2 - removeFromAmpleDictionary(pszMorph, iType, pAmple_io);
/*
 *  restore any trailing whitespace to the morphname
 */
if (p != NULL)
	*p = ch;

if (pAmple_io->pAmpleMorphemes == NULL)
	pAmple_io->pLastMorpheme = NULL;
else
	{
	for (   pAmple_io->pLastMorpheme = pAmple_io->pAmpleMorphemes ;
		pAmple_io->pLastMorpheme->pLink ;
		pAmple_io->pLastMorpheme = pAmple_io->pLastMorpheme->pLink )
	;
	}
if (bDontLoad == FALSE)
	addAmpleDictEntry(pRecord, pAmple_io);
freeMemory(pRecord);
return iStatus;
}

/*****************************************************************************
 * NAME
 *    removeAllomorph
 * DESCRIPTION
 *    function to remove an allomorph from a list of allomorphs
 * RETURN VALUE
 *    pointer to the modified list
 */
static VOIDP removeAllomorph(pOld_in, pList_io)
VOIDP	pOld_in;
VOIDP	pList_io;
{
AmpleAllomorph *	pAllo;
AmpleAllomorph *	pPreviousAllo;

pPreviousAllo = NULL;
for ( pAllo = (AmpleAllomorph *)pList_io ; pAllo ; pAllo = pAllo->pNext )
	{
	if (pAllo == (AmpleAllomorph *)pOld_in)
	{
	if (pOld_in == pList_io)
		pList_io = (VOIDP)(pAllo->pNext);
	else
		pPreviousAllo->pNext = pAllo->pNext;
	/*
	 *  free the memory used for this allomorph
	 */
	if (pAllo->pszAllomorph != NULL)
		freeMemory( pAllo->pszAllomorph );
	if (pAllo->pszAllomorphID != NULL)
		freeMemory( pAllo->pszAllomorphID );
	if (	((pAllo->iMORPHTYPE & AMPLE_ROOT) == 0) &&
		(pAllo->pEnvironment != NULL))
		freeAmpleAlloEnvConstraint( pAllo->pEnvironment );
	freeMemory( pAllo );
	break;
	}
	pPreviousAllo = pAllo;
	}
return pList_io;
}

/*****************************************************************************
 * NAME
 *    removeFromAmpleDictionary
 * DESCRIPTION
 *    remove all allomorphs of the given morpheme from the dictionary
 * RETURN VALUE
 *    0 if successful, 1 if an error occurs
 */
int removeFromAmpleDictionary(pszMorphName_in, eType_in, pAmple_io)
char *		pszMorphName_in;
unsigned	eType_in;
AmpleData *	pAmple_io;
{
AmpleMorpheme *		pMorph;
AmpleMorpheme *		pPreviousMorph;
AmpleAllomorph *	pAllo;
char *			p;

if (	(pszMorphName_in == NULL) ||
	(eType_in        == 0)    ||
	(pAmple_io   == NULL) ||
	(pAmple_io->pDictionary == NULL) )
	return 1;
pPreviousMorph = NULL;
for (	pMorph = pAmple_io->pAmpleMorphemes ;
	pMorph ;
	pMorph = pMorph->pLink )
	{
	p = pMorph->pszMorphName;
	if ((p == NULL) || (*p == NUL))
	p = pMorph->pszUnderForm;
	if (((p == NULL) || (*p == NUL)) && (pMorph->pAllomorphs != NULL))
	p = pMorph->pAllomorphs->pszAllomorph;
	if (    (eType_in == pMorph->iMorphType) &&
		(p != NULL) &&
		(strcmp(pszMorphName_in, p) == 0) )
	break;
	pPreviousMorph = pMorph;
	}
if (pMorph == NULL)
	return 1;
/*
 *  unlink the morpheme from the global list
 */
if (pMorph == pAmple_io->pAmpleMorphemes)
	pAmple_io->pAmpleMorphemes = pMorph->pLink;
else
	pPreviousMorph->pLink = pMorph->pLink;
/*
 *  remove each of the morpheme's allomorphs from the dictionary
 */
for ( pAllo = pMorph->pAllomorphs ; pAllo ; pAllo = pAllo->pNextAllomorph )
	{
	if (removeDataFromTrie(pAmple_io->pDictionary, pAllo->pszAllomorph,
			   pAllo, removeAllomorph) != 0)
	return 1;
	}
/*
 *  free the memory allocated for the morpheme
 */
freeAmpleMorpheme( pMorph, pAmple_io );

return 0;
}


#ifndef hab360
static long parseAmpleOrderClass(char * rp, AmpleData * pAmple_in)
{
  long ord;

  ord = atol(rp);
  if (ord < -32767)
	{
	  if (pAmple_in->pLogFP != NULL)
	fprintf(pAmple_in->pLogFP, szBadOrderclass_m,
		pAmple_in->pszAmpleDictErrorHeader, ord, -32767,
		getAmpleRecordIDTag(szRecordKey_g,
					pAmple_in->uiRecordCount));
	  ord = -32767L;
	}
  else if (ord > 32767)
	{
	  if (pAmple_in->pLogFP != NULL)
	fprintf(pAmple_in->pLogFP, szBadOrderclass_m,
		pAmple_in->pszAmpleDictErrorHeader, ord, 32767,
		getAmpleRecordIDTag(szRecordKey_g,
					pAmple_in->uiRecordCount));
	  ord = 32767L;
	}
  return ord;
}
#endif

#ifdef EXPERIMENTAL
/*****************************************************************************
 * NAME
 *    setPATRCategory
 * DESCRIPTION
 *    add this category to the global list if necessary
 * RETURN VALUE
 *    pointer to the PATR category name string
 */
static char *	setPATRCategory(pszCategory_in, pAmple_in)
char *		pszCategory_in;
AmpleData *	pAmple_in;
{
StringList *	pSL;
/*
 *  look for this category in the global list
 */
for ( pSL = pAmple_in->pPATRCategories ; pSL ; pSL = pSL->pNext )
	{
	if (strcmp(pSL->pszString, pszCategory_in) == 0)
	return pSL->pszString;		/* return existing string */
	}
/*
 *  add this category to the global list
 */
pSL = (StringList *)allocMemory(sizeof(StringList));
pSL->pszString = duplicateString(pszCategory_in);
pSL->pNext     = pAmple_in->pPATRCategories;
pAmple_in->pPATRCategories = pSL;
return pSL->pszString;
}

/*****************************************************************************
 * NAME
 *    setPATRFeature
 * DESCRIPTION
 *    parse this feature and unify it with the existing feature structure (if
 *    any)
 * RETURN VALUE
 *    pointer to a PATRFeature
 */
static PATRFeature * setPATRFeature(pPATRFeature_io, pszFeature_in, pAmple_in)
PATRFeature *	pPATRFeature_io;
char *		pszFeature_in;
AmpleData *	pAmple_in;
{
/*
 *  not yet written -- steal code from PC-PATR's lexicon functions
 *
 *  nontrivial -- need to parse a string rather than data coming directly from
 *  a file
 */
/*
 *  pFeat = parsePATRFeatureString(pszFeature_in, &pAmple_in->sPATR);
 *
 */
return pPATRFeature_io;
}
#endif /* EXPERIMENTAL */
