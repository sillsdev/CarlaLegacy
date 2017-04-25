/*#define OK_TO_CHANGE_TYPES 1*/
/*      TSDICT.C - dictionary functions for transfer and synthesis
 ***************************************************************************
 *
 * int loadStampDictionary(const char * pszFilename_in,
 *			   int          eDicType_in,
 *			   StampData *  pStamp_io)
 *
 * StampMorpheme * searchStampDictionary(unsigned    type,
 *					 char *	     name,
 *					 unsigned    category,
 *					 unsigned    catmatch,
 *					 StampData * pStamp_in)
 *
 * void writeStampDictionary(FILE *      pOutputFP_in,
 *                           StampData * pStamp_in)
 *
 * void freeStampDictionary(StampData * pStamp_io)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1989, 2002 by SIL International.  All rights reserved.
 */
#include <stdio.h>
#include "stamp.h"
#if _MSC_VER >= 800
#define strlwr _strlwr
#endif
extern char *	strlwr P((char * pszString_io));

#ifdef TONEPARS
								/* domain.c */
extern int parseDomainType P((char *			pszLine_in,
				  unsigned		uiDictEntry_in,
				  const char *		pszRecordKey_in,
				  const char *		pszErrorHeader_in,
				  FILE *			pLogFP_in));
extern char *tone_domain_name P((int td));

								/* tone.c */
extern void  parseTone         P((char *             pszLine_in,
				  struct tone_list **tone_listp,
				  unsigned	     uiDictEntry_in,
				  const char *	     pszRecordKey_in,
				  const char *	     pszErrorHeader_in,
				  FILE *	     pLogFP_in));
extern void  showTones       P((FILE *           pOutputFP_in,
				struct tone_list *tlp));
#endif  /* TONEPARS */

static void show_brief_mlist P((void * list,
				int    spaces,
				FILE * pOutputFP_in));
static AmpleEnvConstraint * infix_locate P((char  *         recp,
						unsigned char * ifx_ok,
						StampData *     pStamp_in));
static void  setaffixcats P((char  *         line,
				 unsigned char * fromcatp,
				 unsigned char * tocatp,
				 StampData *     pStamp_in));
static void  setrootcats P((char *           line,
				unsigned char ** cats,
				StampData *      pStamp_in));
static int  process_allomorph P((char *               rp,
								 StampAllomorphList * ap,
								 StampData *          pStamp_in));
static void  add_affix P((char  *     recp,
			  int         dtype,
			  StampData * pStamp_in));
static void  add_root P((char  *     recp,
			 StampData * pStamp_in));
static void  addStampDictEntry P((char *      pRecord_in,
				  StampData * pStamp_io));
static void * link_morpheme_list P((void * new,
					void * old));
static void free_allolist P((StampAllomorphList * pList_io));
static void  insert_dict P((StampMorpheme * new,
				StampData *     pStamp_in));
static int  check_dict P((unsigned         type,
			  char  *          name,
			  unsigned char  * rcats,
			  StampData *      pStamp_in));
static void free_entry P((VOIDP pList_in));

static const char szWhitespace_m[7] = " \t\r\n\f\v";
static const char szNoDictionary_m[] =
				"Cannot open %s dictionary file %s\n";
static const char szEmptyCodeTable_m[] =
				"%sEmpty code table, cannot load dictionary\n";
/*
 *  dictionary error message header
 */
static char *	pszDictErrorHead_m;
static const char	szBadRedupClass_m[] =
		"%sInvalid string class in allomorph string, in entry: %s\n\
\t%s is not defined\n";
static const char	szNoRedupClassIndex_m[] =
		"%sInvalid string class in allomorph string, in entry: %s\n\
\t%s lacks the trailing index indicator (^1, ^2, ...)\n";
/*
 *  used for debug output from inside trie
 */
StampData *	pStamp_m = NULL;

/*****************************************************************************
 * NAME
 *    is_number
 * DESCRIPTION
 *    Check whether the character string is a number.
 * RETURN VALUE
 *    TRUE if the string consists only of digit characters ('0'-'9')
 */
static int is_number(pszString_in)
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

#define FULLREDUP "<...>"
#define FULLREDUPLEN 5
/*****************************************************************************
 * NAME
 *    StampFullReduplication (struct stamp_full_redup)
 * DESCRIPTION
 *    structure for full reduplication allomorphs
 *
 *    All of the full reduplication allomorphs are stored in a single linked list.
 *    Each node of this list has a pointer to any "hyphen" character and a
 *    pointer to the allomorph struct.
 */
typedef struct stamp_full_redup {
	char *			pszPrefix;  /* any preceding string (e.g. -) */
	char *			pszPostfix; /* any trailing string (e.g. -) */
	int                     iDicType ;  /* dictionary type (prefix or suffix) */
	struct StampAllomorph   *	pAllo;	    /* allomorph */
	struct stamp_full_redup *	pNext;	    /* pointer to next item in list */
	} StampFullReduplication;

/*************************************************************************
 * NAME
 *    show_brief_mlist
 * ARGUMENTS
 *    mp     - pointer to the head of the list
 *    spaces - number of spaces to indent before each line
 * DESCRIPTION
 *    Write the contents of the morpheme list to the output file.
 *    This version is used for trie storage of the dictionary.
 * RETURN VALUE
 *    none
 */
static void show_brief_mlist(list, spaces, pOutputFP_in)
void * list;
int spaces;
FILE * pOutputFP_in;
{
int k;
StampAllomorphList *ap;
StampMorphemeList *mp = (StampMorphemeList *)list;

for ( ; mp ; mp = mp->mlink )
	{
	putc('\n', pOutputFP_in);
	for ( k = spaces / 8 ; k ; --k )
		fputs("       ",pOutputFP_in);
	for ( k = spaces % 8 ; k ; --k )
		putc(' ', pOutputFP_in);
	if (mp->m.iMorphType & ROOT)
		{
		if (mp->m.iMorphType & RSC_MASK)
			{
			for ( k = 0 ; k < MAX_RSC ; ++k )
				{
				if ( mp->m.iMorphType & (RSC << k) )
					{
					putc( pStamp_m->szRSCMarkers[k], pOutputFP_in );
					break;
					}
				}
			}
		fprintf(pOutputFP_in,"%s - %s",
		mp->m.pszMorphname,
		findAmpleCategoryName(mp->m.iToCategory,
					  pStamp_m->pCategories));
		}
	else
		{
		fprintf(pOutputFP_in,"%s - %s/%s", mp->m.pszMorphname,
				findAmpleCategoryName(mp->m.iFromCategory,
					  pStamp_m->pCategories),
		findAmpleCategoryName(mp->m.iToCategory,
					  pStamp_m->pCategories));
		fprintf(pOutputFP_in," (%d)", mp->m.iOrderClass );
		}
	if (mp->m.iMorphType & IFX)
		{
		fprintf(pOutputFP_in," {");
		if (mp->m.iMorphType & PFX_OK)   fprintf(pOutputFP_in," prefix");
		if (mp->m.iMorphType & ROOT_OK)  fprintf(pOutputFP_in," root");
		if (mp->m.iMorphType & SFX_OK)   fprintf(pOutputFP_in," suffix");
		if (mp->m.u.pInfixEnv != NULL)
			writeAmpleEnvConstraint(pOutputFP_in, mp->m.u.pInfixEnv, FALSE);
		fprintf(pOutputFP_in," }");
		}
#ifdef TONEPARS
	showTones(pOutputFP_in, mp->m.pTones);
	fprintf(pOutputFP_in,"\n        %s", tone_domain_name(mp->m.iDomain));
#endif /* TONEPARS */
	for ( ap = mp->m.pAllomorphs ; ap ; ap = ap->pNext )
		{
		fprintf(pOutputFP_in,"\n        ");
		for ( k = spaces / 8 ; k ; --k )
			fputs("       ",pOutputFP_in);
		for ( k = spaces % 8 ; k ; --k )
			putc(' ', pOutputFP_in);
		if (ap->a.pszAllomorph && *(ap->a.pszAllomorph))
			fprintf(pOutputFP_in,"%s", ap->a.pszAllomorph );
		else
			putc( '0', pOutputFP_in );
		if (ap->a.uAlloPropertySet.pProperties)
			{
			fprintf(pOutputFP_in,"    ");
			writeAmplePropertySet(ap->a.uAlloPropertySet,
				  &pStamp_m->sProperties,
				  pOutputFP_in);
			}
		if (ap->a.pAlloEnvironment != NULL)
			{
			writeAmpleEnvConstraint( pOutputFP_in,
					 ap->a.pAlloEnvironment->pStringCond,
					 FALSE);
#ifndef hab220
			writeAmpleEnvConstraint( pOutputFP_in,
					 ap->a.pAlloEnvironment->pNegStringCond,
					 FALSE);
#endif /* hab220 */
			writeAmpleEnvConstraint( pOutputFP_in,
					 ap->a.pAlloEnvironment->pMorphCond,
					 FALSE);
				/* 2.1b1 hab */
			writeAmpleEnvConstraint( pOutputFP_in,
					 ap->a.pAlloEnvironment->pPunctCond,
					 FALSE);
			}
		}
	}
}

/***************************************************************************
 *  local variables restricted to this file
 */
/*
 *  number of records processed for a dictionary
 */
static unsigned	uiRecordNumber_m;
/*
 *  dictionary type
 */
static char *	pszDictType_m;
/*
 *  error messages for dictionary loading
 */
static const char	szLoadMessage_m[] =
			"%sNo %s in entry: %s\n";
static const char	szMorphnameMessage_m[] =
			"%sMorphname too long, truncated to %s in entry: %s\n";
static const char	szBadOrderclass_m[] =
			   "%sInvalid orderclass %ld, stored as %d in entry: %s\n";

/***************************************************************************
 * NAME
 *    infix_locate
 * ARGUMENTS
 *    recp   - pointer to infix location field
 *    ifx_ok - address of byte to store PFX_OK, ROOT_OK, and SFX_OK bits
 * DESCRIPTION
 *    Read the infix location ('L') field from an infix dictionary record,
 *    setting the ifx_ok and ifx_env fields accordingly.
 * RETURN VALUE
 *    none
 */
static AmpleEnvConstraint * infix_locate(recp, ifx_ok, pStamp_in)
char *		recp;
unsigned char *	ifx_ok;
StampData *	pStamp_in;
{
register char *p;
unsigned char loc;
AmpleEnvConstraint *env;
/*
 *  set the bits for what kinds of morphemes this infix can appear in
 */
for (   loc = NUL, p = recp + strspn(recp, szWhitespace_m) ;
		(*p != NUL) && (*p != '/') && !matchBeginning(p,"+/") ;
		p = recp )
	{
	recp = isolateWord(p);            /* split off the next word */
	strlwr(p);                /* convert to lowercase */
	if ((strcmp(p,"root") == 0) || (strcmp(p,"roots") == 0))
		loc |= ROOT_OK;
	else if ((strcmp(p,"prefix") == 0) || (strcmp(p,"prefixes") == 0))
		loc |= PFX_OK;
	else if ((strcmp(p,"suffix") == 0) || (strcmp(p,"suffixes") == 0))
		loc |= SFX_OK;
	else if (pStamp_in->pLogFP != NULL)
		{
		fprintf(pStamp_in->pLogFP,
		"%sInvalid morpheme type %s in location field in entry: %s\n",
		pszDictErrorHead_m, p,
		getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m));
		}
	}
if ((loc == NUL) && (pStamp_in->pLogFP != NULL))
	fprintf(pStamp_in->pLogFP,
		"%sNo morpheme type in location field in entry: %s\n",
		pszDictErrorHead_m,
		getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m));
/*
 *  finally, parse the string environment for the infix
 */
env = parseAmpleInfixEnvConstraint(p,
				   uiRecordNumber_m, szRecordKey_g,
				   pStamp_in->pDictOrthoChanges,
				   pStamp_in->pCategories,
				   &pStamp_in->sProperties,
				   pStamp_in->pCategClasses,
				   pStamp_in->pMorphClasses,
				   pStamp_in->pStringClasses,
				   pStamp_in->pszValidCharacters,
				   pStamp_in->pLogFP,
				   &pStamp_in->pStringList);
/*
 *  if they don't give us an environment, don't let anything pass
 */
if (env == NULL)
	{
	loc = NUL;                  /* so there!! nyah, nyaah... */
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP,
		"%sNo environment in location field in entry: %s\n",
		pszDictErrorHead_m,
		getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m));
	}

*ifx_ok |= loc;         /* save it for this particular infix */

return( env );
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

/***************************************************************************
 * NAME
 *    setaffixcats
 * DESCRIPTION
 *    For affix dictionary entries, fill in the fromcategory and tocategory
 *    fields by parsing the first category pair from the dictionary line.
 * ARGUMENTS
 *    line     - pointer to line of categories from an affix dictionary entry
 *    fromcatp - pointer to fromcategory byte
 *    tocatp   - pointer to tocategory byte
 * RETURN VALUE
 *    none
 */
static void setaffixcats(line, fromcatp, tocatp, pStamp_in)
char *		line;
unsigned char *	fromcatp;
unsigned char *	tocatp;
StampData *	pStamp_in;
{
register char *fp, *tp;
unsigned char fcat, tcat;

if (fromcatp && *fromcatp)
	{
#ifdef hab216
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP,
		"%sRedundant category field in entry: %s\n",
		pszDictErrorHead_m,
		getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m) );
#endif /* hab216 */
	return;
	}
if (line)
	{
	fp = line + strspn(line, szWhitespace_m);
	tp = strchr(fp,'/');
	if (tp)
		*tp++ = ' ';    /* terminate the fromcategory name */
	tp = isolateWord(fp);     /* isolate the fromcategory, find the tocategory */
	isolateWord(tp);          /* isolate the tocategory name */
	if (tp && *tp && *fp)
		{
		/*
		 *  translate the category names to category codes
		 */
		fcat = findAmpleCategoryNumber(fp, pStamp_in->pCategories);
		tcat = findAmpleCategoryNumber(tp, pStamp_in->pCategories);
		if (fcat && fromcatp && tcat && tocatp)
			{
			*fromcatp = fcat;
			*tocatp   = tcat;
			return;             /* we've succeeded! */
			}
		}
	}
if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP, "%sInvalid category field in entry: %s\n",
		pszDictErrorHead_m,
		getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m) );
}

/***************************************************************************
 * NAME
 *    setrootcats
 * DESCRIPTION
 *    For ROOT dictionary entries, fill in the category array by parsing a
 *    line of category names.
 * ARGUMENTS
 *    line   - pointer to line of categories from ROOT dictionary entry
 *    cats   - address of pointer to category string
 * RETURN VALUE
 *    none
 */
static void setrootcats(line, cats, pStamp_in)
char *		line;
unsigned char **cats;
StampData *	pStamp_in;
{
register char *p;
size_t x;
unsigned char cat = 0;
unsigned char xcats[BUFSIZE+1];

if (*line == NUL)
	{
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP,
		"%sEmpty category field in entry: %s\n",
		pszDictErrorHead_m,
		getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m) );
	return;
	}
/*
 *  initialize the local category array
 */
if (*cats != NULL)
	{
	strcpy((char *)xcats, (char *)*cats);
	*cats = NULL;
	}
else
	xcats[0] = NUL;

for (   x = strlen((char *)xcats), p = line + strspn(line, szWhitespace_m);
		(*p != '\0') && (x < BUFSIZE) ;
		p = line, ++x )
	{
	line = isolateWord(p);
	if ((cat = findAmpleCategoryNumber(p, pStamp_in->pCategories)) == 0)
		break;
	xcats[x] = cat;
	}
xcats[x] = NUL;

if (pStamp_in->pLogFP != NULL)
	{
	if (cat == 0)
	fprintf(pStamp_in->pLogFP,
		"%sUndefined category %s in entry: %s\n",
		pszDictErrorHead_m, p,
		getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m) );
	if (x >= BUFSIZE)
	fprintf(pStamp_in->pLogFP,
		"%sToo many categories in entry: %s\n",
		pszDictErrorHead_m,
		getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m) );
	}
if (x > 0)
	{
	*cats = (unsigned char *)updateStringList( &pStamp_in->pCategorySetsList,
						   (char *)xcats );
	}
}

/*****************************************************************************
 * NAME
 *    build_redup_allos
 * DESCRIPTION
 *
 * RETURN VALUE
 *    pointer to list of allomorphs
 */
static StampAllomorphList * build_redup_allos(pszRecord_in, pHead_io,
						  pbBad_io,
						  pAlloPieces_in,
						  pPartialExpansion_in,
						  pStamp_in)
char *			pszRecord_in;
StampAllomorphList *	pHead_io;
int *			pbBad_io;
RedupAlloPiece *	pAlloPieces_in;
ExpandedAllo *		pPartialExpansion_in;
StampData *		pStamp_in;
{
StringList *         sp;
StampAllomorphList * alp;
int                  bIsCaps = FALSE;
size_t               uiPrevEnd;
AmpleRedupClass      sRedupClass;
AmpleRedupClass *    pPrevRedupClasses;
AmpleRedupClass *    pRC;
char *		     pszAllo;
char *		     pszCopy;
char *		     pszEnd;
char *		     rp;
int		     bAlloc;
char *		     pszEnv;
char *		     p;
PropertySet_t	aprops;

if ((pPartialExpansion_in == NULL) || (pPartialExpansion_in->pszAllo == NULL))
	return NULL;
if (pAlloPieces_in == NULL)
	{
	/*
	 *  we've hit the end of allomorph pieces, put it all together
	 */
	if (    (strcmp(pPartialExpansion_in->pszAllo, "0") == 0) &&
		(pPartialExpansion_in->pRedupClasses == NULL) )
	{
	bAlloc  = FALSE;
	pszAllo = duplicateString("");
	}
	else
	{
	bAlloc  = TRUE;
	pszAllo = applyChanges(pPartialExpansion_in->pszAllo, 
				pStamp_in->pDictOrthoChanges);
	validateAmpleString(pszAllo,
				"allomorph",
				getAmpleRecordIDTag(szRecordKey_g,
						uiRecordNumber_m),
				pszAllo,
				pStamp_in->pszValidCharacters,
				pStamp_in->pLogFP);
	}
#ifdef HAVE_ALLOCA
	pszCopy = strcpy((char *)alloca(strlen(pszRecord_in)+1), pszRecord_in);
#else
	pszCopy = duplicateString(pszRecord_in);
#endif
	pszEnd  = pszCopy;
	/*
	 * make allo list & allomorph structures
	 */
	 if (pHead_io->a.pszAllomorph == NULL && pHead_io->pNext == NULL)
	   /* is first case where it has already been allocated */
	     alp = pHead_io;
	 else
	 {
	   pHead_io->pNext = alp = (StampAllomorphList *)allocMemory(
						 sizeof(StampAllomorphList) );
	pHead_io = pHead_io->pNext;
	 }
	/*
	 *  set allo string pointer
	 */
	alp->bMallocString = bAlloc;
	alp->a.pszAllomorph  = pszAllo;
	/*
	 *  set the allomorph ID
	 */
	alp->a.pszAllomorphID = NULL;
	if (*pszEnd == '{')
	{
	rp     = pszEnd;
	pszEnd = isolateWord(rp);
	if (pStamp_in->bEnableAllomorphIDs)
		alp->a.pszAllomorphID = get_allomorph_id(rp);
	}
	/*
	 *  next is the optional set of allomorph properties
	 */
	aprops.pProperties = NULL;
	rp = parseAmplePropertySet(pszEnd,
				   &aprops,
				   AMPLE_ALLO_PROP,
				   uiRecordNumber_m, szRecordKey_g,
				   pszDictErrorHead_m,
				   &pStamp_in->sProperties,
				   &pStamp_in->pPropertyList,
				   pStamp_in->pLogFP);
	alp->a.uAlloPropertySet = aprops;
	/*
	 *  create any allomorph condition structures needed for this
	 *  allomorph
	 */
	pszEnv = rp;
	if (pPartialExpansion_in->pRedupClasses != NULL)
	{
	/*
	 *  munge the environment to replace any occurrences of a reduplication
	 *  (string) class -- this is faster than parsing them inside
	 *  parseAmpleAlloEnvConstraint() -- by a factor of 9 or 10!
	 */
	AmpleRedupClass * pRC;
	size_t uiSpare = 0;
	size_t uiEnvSize = strlen(pszEnv) + 1;
	size_t uiNeed;
	size_t uiNewLen;
	size_t uiOldLen;
	size_t uiTailLen;
	for (   pRC = pPartialExpansion_in->pRedupClasses ;
		pRC ;
		pRC = pRC->pNext )
		{
		uiOldLen = strlen(pRC->pszIndexedName);
		uiNewLen = strlen(pRC->pszMember);
		while ((p = strstr(pszEnv, pRC->pszIndexedName)) != NULL)
		{
		/*
		 *  TODO: think about allowing spaces around brackets?
		 *  (that is, after [ or before ])
		 */
		if ((p > pszEnv) && (p[-1] == '[') && (p[uiOldLen] == ']'))
			{
			uiTailLen = strlen(p + uiOldLen);
			if (uiNewLen <= uiOldLen)
			{
			if (uiNewLen < uiOldLen)
				{
				memmove(p + uiNewLen - 1, p + uiOldLen + 1,
					uiTailLen);
				uiSpare += uiOldLen - uiNewLen;
				}
			}
			else
			{
			/*
			 *  need to allocate more memory to make room...
			 */
			uiNeed = uiNewLen - uiOldLen;
			if (uiNeed > uiSpare)
				{
				char * pszNewEnv;
				uiEnvSize += 10 * uiNeed;
				if (pszEnv == rp)
				{
				pszNewEnv = allocMemory(uiEnvSize);
				strcpy(pszNewEnv, pszEnv);
				}
				else
				pszNewEnv = reallocMemory(pszEnv, uiEnvSize);
				pszEnv = pszNewEnv;
				}
			memmove(p + uiNewLen - 1, p + uiOldLen + 1, uiTailLen);
			}
			memcpy(p - 1, pRC->pszMember, uiNewLen);
			}
		}
		}
	}
	alp->a.pAlloEnvironment = parseAmpleAlloEnvConstraint(
						  pszEnv,
						  pbBad_io,
						  uiRecordNumber_m,
						  szRecordKey_g,
						  pStamp_in->pDictOrthoChanges,
						  pStamp_in->pCategories,
						  &pStamp_in->sProperties,
						  pStamp_in->pCategClasses,
						  pStamp_in->pMorphClasses,
						  pStamp_in->pStringClasses,
											  /* 3.3.0 hab */
						  pStamp_in->pPunctClasses,
						  pStamp_in->pszValidCharacters,
						  pStamp_in->pLogFP,
						  &pStamp_in->pStringList,
						  &pStamp_in->pAlloEnvList);
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
if (pAlloPieces_in->pClass == NULL)
	{
	/*
	 *  handle literal characters in the allomorph string
	 */
	strcat(pPartialExpansion_in->pszAllo, pAlloPieces_in->pszLiteral);
	return build_redup_allos(pszRecord_in,
				 pHead_io,
				 pbBad_io,
				 pAlloPieces_in->pNext,
				 pPartialExpansion_in,
				 pStamp_in);
	}
/*
 *  handle repeated indexed classes in the allomorph string
 */
for ( pRC = pPartialExpansion_in->pRedupClasses ; pRC ; pRC = pRC->pNext )
	{
	if (strcmp(pRC->pszIndexedName, pAlloPieces_in->pszLiteral) == 0)
	{
	strcat(pPartialExpansion_in->pszAllo, pRC->pszMember);
	return build_redup_allos(pszRecord_in,
				 pHead_io,
				 pbBad_io,
				 pAlloPieces_in->pNext,
				 pPartialExpansion_in,
				 pStamp_in);
	}
	}
/*
 *  handle an indexed string class in the allomorph string
 */
pPrevRedupClasses = pPartialExpansion_in->pRedupClasses;
uiPrevEnd = strlen(pPartialExpansion_in->pszAllo);
for ( sp = pAlloPieces_in->pClass->pMembers ; sp ; sp = sp->pNext )
	{
	strcpy(pPartialExpansion_in->pszAllo + uiPrevEnd, sp->pszString);
	sRedupClass.pszIndexedName = pAlloPieces_in->pszLiteral;
	sRedupClass.pszMember      = sp->pszString;
	sRedupClass.pNext          = pPrevRedupClasses;
	pPartialExpansion_in->pRedupClasses = &sRedupClass;
	pHead_io = build_redup_allos(pszRecord_in,
				 pHead_io,
				 pbBad_io,
				 pAlloPieces_in->pNext,
				 pPartialExpansion_in,
				 pStamp_in);
	}
return pHead_io;
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
 *    in the allomorph string.  For the latter we parse the allomorph into
 *    pieces of literals and either indexed string classes or the full redup
 *    marker.
 * RETURN VALUE
 *    pointer to list of allomorphs
 */
static StampAllomorphList * build_allomorphs(pszAllo_in, pszRecord_in,
						 pHead_io, 
						 pbBad_io, pAlloPiece_in,
						 pStamp_in)
char *			pszAllo_in;
char *			pszRecord_in;
StampAllomorphList *	pHead_io;
int *			pbBad_io;
RedupAlloPiece *	pAlloPiece_in;
StampData *		pStamp_in;
{
StampAllomorphList *	pExpansions;
RedupAlloPiece		sAlloPiece;
RedupAlloPiece *	pPiece;
RedupAlloPiece *	pNextPiece;
RedupAlloPiece *	pPrevPiece;
RedupAlloPiece *	pAlloPieces;
char *			p;
char *			q;
char			cSave = NUL;
ExpandedAllo		sExpandedAllo;
size_t		k;
size_t		uiSegSize;
size_t		uiAlloSize;
StringList *		sp;
size_t		uiTotalAllos;

if (pszAllo_in == NULL)
	return pHead_io;
/*
 *  check for the end of the allomorph string proper
 */
if (*pszAllo_in == NUL)
	{
	if (pAlloPiece_in == NULL)
	return pHead_io;
	/*
	 *  reverse the links in the list of allomorph pieces to put them in proper
	 *  order
	 */
	pPrevPiece = NULL;
	for ( pPiece = pAlloPiece_in ; pPiece ; pPiece = pNextPiece )
	{
	pNextPiece = pPiece->pNext;
	pPiece->pNext = pPrevPiece;
	pPrevPiece = pPiece;
	}
	pAlloPieces = pPrevPiece;
	/*
	 *  put the pieces together all possible ways to form the list of
	 *  allomorph strings
	 *
	 *  first, get the maximum length of an allomorph string and allocate
	 *  space for the working copy
	 */
	uiAlloSize = 0;
	uiTotalAllos = 1;
	for ( pPiece = pAlloPieces ; pPiece ; pPiece = pPiece->pNext )
	{
	if (pPiece->pClass != NULL)
		{
		unsigned uiClassSize = getStringListSize(pPiece->pClass->pMembers);
		if (uiClassSize)
		uiTotalAllos *= uiClassSize;
		uiSegSize = 0;
		for ( sp = pPiece->pClass->pMembers ; sp ; sp = sp->pNext )
		{
		k = sp->pszString ? strlen(sp->pszString) : 0;
		if (k > uiSegSize)
			uiSegSize = k;
		}
		}
	else
		uiSegSize = strlen(pPiece->pszLiteral);
	uiAlloSize += uiSegSize;
	}
#ifdef HAVE_ALLOCA
	sExpandedAllo.pszAllo       = (char *)alloca(uiAlloSize+1);
#else
	sExpandedAllo.pszAllo       = (char *)allocMemory(uiAlloSize+1);
#endif
	sExpandedAllo.pRedupClasses = NULL;
	memset(sExpandedAllo.pszAllo, 0, uiAlloSize+1);

	if (uiTotalAllos > 1)
	{
	reportMessage(!pStamp_in->bQuiet,
		  "Generating %u redup allomorphs (max length = %u)",
			  uiTotalAllos, uiAlloSize);
	if (pStamp_in->pLogFP)
		fprintf(pStamp_in->pLogFP,
			"NOTE: \"%s\" produces %zu allomorph entries\n",
			pszRecord_in, uiTotalAllos);
	}
	pExpansions = build_redup_allos(pszRecord_in,
					pHead_io,
					pbBad_io,
					pAlloPieces,
					&sExpandedAllo,
					pStamp_in);
	if (uiTotalAllos > 1)
	reportMessage(!pStamp_in->bQuiet, "\n");
	/*
	 *  free any temporarily allocated heap memory
	 */
#ifndef HAVE_ALLOCA
	for ( pPiece = pAlloPieces ; pPiece ; pPiece = pPiece->pNext )
	{
	if (pPiece->pszLiteral != NULL)
		freeMemory(pPiece->pszLiteral);
	}
	freeMemory(sExpandedAllo.pszAllo);
#endif
	return pExpansions;
	}
/*
 *  check for a string class in the allomorph string
 */
if (	(*pszAllo_in == '[') &&
	((p = strchr(pszAllo_in, ']')) != NULL) &&
	(matchAlphaChar((unsigned char *)pszAllo_in,
			&pStamp_in->sTextCtl) == 0) &&
	(matchAlphaChar((unsigned char *)"]", &pStamp_in->sTextCtl) == 0))
	{
	cSave = *p;
	*p    = NUL;		/* remove ']' to limit class marker string */
#ifdef HAVE_ALLOCA
	sAlloPiece.pszLiteral = strcpy((char *)alloca(strlen(pszAllo_in)),
				   pszAllo_in+1);
#else
	sAlloPiece.pszLiteral = duplicateString(pszAllo_in+1);
#endif
	q = strrchr(pszAllo_in+1, '^');
	if ((q == NULL) || !is_number(q+1))
	{
	if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP, szNoRedupClassIndex_m,
			pszDictErrorHead_m, pszAllo_in+1,
			getAmpleRecordIDTag(szRecordKey_g,
					uiRecordNumber_m));
	return pHead_io;
	}
	*q = NUL;			/* strip off index to look up class */
	sAlloPiece.pClass     = findStringClass(pszAllo_in+1,
						pStamp_in->pStringClasses);
	sAlloPiece.pNext      = pAlloPiece_in;
	*q = '^';			/* restore index */
	*p = cSave;			/* restore ']' */
	if (sAlloPiece.pClass == NULL)
	{
	/* print error message */
	*p = NUL;
	if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP, szBadRedupClass_m,
			pszDictErrorHead_m, pszAllo_in+1,
			getAmpleRecordIDTag(szRecordKey_g,
					uiRecordNumber_m));
	*p = cSave;
	return pHead_io;
	}
	else
	return build_allomorphs(p+1,
				pszRecord_in,
				pHead_io,
				pbBad_io,
				&sAlloPiece,
				pStamp_in);
	}
/*
 *  handle a string of literal characters in the allomorph string
 */
p = strchr(pszAllo_in, '[');
if (p != NULL)
	{
	if (    (strchr(p, ']') != NULL) &&
		(matchAlphaChar((unsigned char *)p, &pStamp_in->sTextCtl) == 0) &&
		(matchAlphaChar((unsigned char *)"]", &pStamp_in->sTextCtl) == 0) )
	{
	cSave = *p;
	*p    = NUL;
	}
	else
	p = NULL;
	}
#ifdef HAVE_ALLOCA
sAlloPiece.pszLiteral = strcpy((char *)alloca(strlen(pszAllo_in)+1),
				   pszAllo_in);
#else
sAlloPiece.pszLiteral = duplicateString(pszAllo_in);
#endif
sAlloPiece.pClass     = NULL;
sAlloPiece.pNext      = pAlloPiece_in;
if (p != NULL)
  *p = cSave; /* if is literal followed by a class */
/*    *p++ = cSave; */
else
	p = pszAllo_in + strlen(pszAllo_in);
return build_allomorphs(p,
			pszRecord_in,
			pHead_io,
			pbBad_io,
			&sAlloPiece,
			pStamp_in);
}

/*****************************************************************************
 * NAME
 *    process_allomorph
 * DESCRIPTION
 *    process an allomorph field from a dictionary entry
 * RETURN VALUE
 *    TRUE if an error occurs, otherwise FALSE
 */
static int process_allomorph(rp, ap, pStamp_in)
char *			rp;
StampAllomorphList *	ap;		/* current allomorph being built */
StampData *		pStamp_in;
{
int	allo_bad = FALSE;

ap = build_allomorphs(rp, isolateWord(rp), ap, &allo_bad,
		      NULL, pStamp_in);
return allo_bad;
}

/***************************************************************************
 * NAME
 *    add_affix
 * ARGUMENTS
 *    recp  - pointer to a record of the dictionary file
 *    dtype - type of dictionary: PFX, IFX, or SFX
 * DESCRIPTION
 *    Parse an entry from a target dialect affix dictionary file and enter
 *    it into the internal dictionary structure.
 * RETURN VALUE
 *    none
 */
static void add_affix(recp, dtype, pStamp_in)
char *		recp;
int		dtype;
StampData *	pStamp_in;
{
unsigned char	code;			/* field code */
char *		rp;
char *		nextp;
char *		endp;
StampMorpheme	morpheme;
StampAllomorphList * ap;		/* current allomorph being built */
StampAllomorphList * elsewhere_allo;	/* ptr to the elsewhere allomorph  */
StampAllomorphList * elsewhere_prec;	/* ptr to allomorph preceding the
					 *    elsewhere allomorph */
int		is_elsewhere_allo;	/* flag if current allomorph is
					 *   the elsewhere allomorph */
long		ord;			/* temp. for setting orderclass */
PropertySet_t	mprops;			/* temp. for morpheme properties */
int		bad_allo;		/* flag allomorph field errors */
int		allo_bad;
/*
 *  initialize the morpheme structure
 */
morpheme.pszMorphname = NULL;
morpheme.iMorphType = dtype;
morpheme.iFromCategory = NUL;
morpheme.iToCategory = NUL;
morpheme.u.pInfixEnv = NULL;
morpheme.iOrderClass = 0;
morpheme.pAllomorphs = NULL;
#ifdef TONEPARS
morpheme.pTones = (struct tone_list *)NULL;
morpheme.iDomain = 0;
#endif /* TONEPARS */
/*
 *  other things need to cleared for each affix entry as well
 */
ap                 = NULL;              /* Init current allomorph */
elsewhere_allo     = NULL;              /* Init elsewhere allo pointers */
elsewhere_prec     = NULL;
is_elsewhere_allo  = FALSE;
mprops.pProperties = NULL;
bad_allo           = 0;
allo_bad           = 0;
/*
 *  fill in the fields according to codes in record
 */
for ( rp = recp ; *rp != NUL ; rp = endp )
	{
	endp = rp + strlen(rp) + 1;         /* save address of next field */
	code = *rp++;               /* field code is first char on line */
	rp += strspn(rp, szWhitespace_m);	/* skip over white space */
	switch (code)
		{
		case 'M':                       /* morphname */
			isolateWord(rp);                  /* use first word only */
			if (strlen(rp) > MAXMORPH)
				{                       /* morphname is too long, so */
				*(rp+MAXMORPH) = '\0';  /* truncate it and print a message */
		if (pStamp_in->pLogFP != NULL)
			fprintf(pStamp_in->pLogFP,
				szMorphnameMessage_m, pszDictErrorHead_m,
				rp,
				getAmpleRecordIDTag(szRecordKey_g,
						uiRecordNumber_m));
				}
			if (morpheme.pszMorphname != NULL)
				{
		if (pStamp_in->pLogFP != NULL)
			fprintf(pStamp_in->pLogFP,
				"%sMorphname defined twice in entry: %s\n",
				pszDictErrorHead_m,
				getAmpleRecordIDTag(szRecordKey_g,
						uiRecordNumber_m) );
		}
			else
				morpheme.pszMorphname = duplicateString(rp);
			break;

		case 'E':               /* Elsewhere allomorph */

			is_elsewhere_allo = TRUE;
								/* NOTE: there is no 'break' statement here */
								/* on purpose: this entry needs to be */
								/* processed as an allomorph and so it */
								/* needs to fall through to the 'A' case */

		case 'A':               /* allomorph */
		  /*
		   *  allocate an allomorph_list node and link it into
		   *    the morpheme's list (keep dictionary order)
		   */
		  if (morpheme.pAllomorphs == NULL)
		    morpheme.pAllomorphs = ap = (StampAllomorphList *)allocMemory(
										  sizeof(StampAllomorphList) );
		  else
		    {
		      for (ap; ap->pNext != NULL; ap = ap->pNext)
			;
		      ap->pNext = (StampAllomorphList *)allocMemory(
								    sizeof(StampAllomorphList) );
		      /* if we are processing an elsewhere */
		      /* allomorph, remember preceding */
		      if (is_elsewhere_allo)  /* allomorph */
			elsewhere_prec = ap;
		      ap = ap->pNext;
		    }
		  nextp    = rp + strlen(rp);
		  allo_bad = process_allomorph(rp, ap, pStamp_in);
		  rp       = nextp;
		  bad_allo |= allo_bad;               /* one failure ruins all */
		  
		  if (is_elsewhere_allo)      /* if are processing elsewhere */
		    {                       /* allomorph, remember it */
		      elsewhere_allo = ap;
		      is_elsewhere_allo = FALSE;
		    }
		  break;

		case 'L':                       /* infix location */
			if (morpheme.iMorphType & IFX)
				{
				if (*rp == NUL)
					{
			if (pStamp_in->pLogFP != NULL)
			fprintf(pStamp_in->pLogFP,
				"%sEmpty location field in entry: %s\n",
				pszDictErrorHead_m,
				getAmpleRecordIDTag(szRecordKey_g,
							uiRecordNumber_m) );
			}
				else
					{                    /* parse the infix location field */
					morpheme.u.pInfixEnv =
								infix_locate(rp, &morpheme.iMorphType,
						 pStamp_in );
					}
				}
			break;

		case 'C':               /* categories (look at first pair only) */
			setaffixcats(rp, &morpheme.iFromCategory, &morpheme.iToCategory,
			 pStamp_in);
			break;

		case 'O':               /* orderclass */
			ord = atol(rp);
			if (ord < -32767)
				{
		if (pStamp_in->pLogFP != NULL)
			fprintf(pStamp_in->pLogFP,
				szBadOrderclass_m, pszDictErrorHead_m,
				ord, -32767, szRecordKey_g);
				ord = -32767L;
				}
			else if (ord > 32767)
				{
		if (pStamp_in->pLogFP != NULL)
			fprintf(pStamp_in->pLogFP,
				szBadOrderclass_m, pszDictErrorHead_m,
				ord, 32767, szRecordKey_g);
				ord = 32767L;
				}
			morpheme.iOrderClass = (short)ord;
			break;

		case 'P':                       /* morpheme properties */
			rp = parseAmplePropertySet(rp, &mprops, AMPLE_MORPH_PROP,
					   uiRecordNumber_m, szRecordKey_g,
					   pszDictErrorHead_m,
					   &pStamp_in->sProperties,
					   &pStamp_in->pPropertyList,
					   pStamp_in->pLogFP);
			break;

#ifdef TONEPARS
		case 'D':                       /* morphological/tone domain */
			isolateWord(rp);
			morpheme.iDomain = parseDomainType(rp, uiRecordNumber_m,
						   szRecordKey_g,
						   pszDictErrorHead_m,
						   pStamp_in->pLogFP);
			break;

		case 'N':                       /* lexical tone */
			parseTone(rp, &(morpheme.pTones), uiRecordNumber_m, szRecordKey_g,
			  pszDictErrorHead_m, pStamp_in->pLogFP);
			break;
#endif /* TONEPARS */
		} /* end switch */

	while (*rp++ != '\0')           /* pass over rest of line */
		;

	} /* end for */

								/* take care of elsewhere allomorph, if any */
if (elsewhere_allo != NULL)
	{                           /* there was a elsewhere allomorph */
	if (elsewhere_allo->pNext != NULL)
		{                       /* (if elsewhere is at end, we don't need to */
								/* do anything) */
		if (elsewhere_prec == NULL)
								/* elsewhere is first in the list, so the */
								/* next element becomes first */
			morpheme.pAllomorphs = elsewhere_allo->pNext;
		else
								/* relink previous to next */
			elsewhere_prec->pNext = elsewhere_allo->pNext;
								/* relink elsewhere as last */
		ap->pNext             = elsewhere_allo;
		elsewhere_allo->pNext = NULL;
		ap                    = elsewhere_allo;
		}
	}
/*
 *  add this morpheme to the dictionary if it's okay
 */
if (morpheme.pszMorphname  && morpheme.pAllomorphs && !bad_allo)
	{
	for ( ap = morpheme.pAllomorphs ; ap ; ap = ap->pNext )
		mergeAmplePropertySets( &ap->a.uAlloPropertySet, mprops,
				uiRecordNumber_m, szRecordKey_g,
				&pStamp_in->sProperties,
				&pStamp_in->pPropertyList);
	insert_dict( &morpheme, pStamp_in );
	}
else
	{
	if (pStamp_in->pLogFP != NULL)
	{
	if (morpheme.pszMorphname == NULL)
		fprintf(pStamp_in->pLogFP,
			szLoadMessage_m, pszDictErrorHead_m, "morphname",
			getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m));
	if (morpheme.pAllomorphs == NULL)
		fprintf(pStamp_in->pLogFP,
			szLoadMessage_m, pszDictErrorHead_m, "allomorph",
			getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m));
	}
	if (morpheme.pAllomorphs)
	free_allolist(morpheme.pAllomorphs);
	if (morpheme.pszMorphname)
	freeMemory(morpheme.pszMorphname);
	}
/*
 *  save key for possible future error message
 */
strcpy( szOutOfMemoryMarker_g, szRecordKey_g );
}

/*************************************************************************
 * NAME
 *    add_root
 * ARGUMENTS
 *    recp - pointer to a record of the dictionary file
 * DESCRIPTION
 *    Parse an entry from a target dialect root dictionary file and enter
 *    it into the internal dictionary structure.
 * RETURN VALUE
 *    none
 */
static void add_root(recp, pStamp_in)
char *		recp;
StampData *	pStamp_in;
{
unsigned char	code;             /* field code */
char *		rp;
char *		nextp;
char *		endp;
char *		mname;
StampMorpheme	morpheme;
StampAllomorphList * ap;
StampAllomorphList * elsewhere_allo;	/* ptr to the elsewhere allomorph  */
StampAllomorphList * elsewhere_prec;	/* ptr to allomorph preceding the
					 *   elsewhere allomorph */
int		is_elsewhere_allo;	/* flag if current allomorph is
					 *   the elsewhere allomorph */
int		bad_allo;		/* flag allomorph field errors */
int		allo_bad;
int		k;			/* scratchpad variable */
PropertySet_t	mprops;			/* temp for morpheme properties */
/*
 *  initialize the morpheme structure
 */
morpheme.pszMorphname = NULL;
morpheme.iMorphType = ROOT;
morpheme.iFromCategory = NUL;
morpheme.iToCategory = NUL;
morpheme.u.pRootCategories = NULL;    /* not loaded from dictionary */
morpheme.iOrderClass = 0;                /* (unused for roots, actually */
morpheme.pAllomorphs = NULL;
#ifdef TONEPARS
morpheme.pTones = (struct tone_list *)NULL;
morpheme.iDomain = 0;
#endif /* TONEPARS */
/*
 *  other things need to cleared for each root entry as well
 */
mname              = NULL;
mprops.pProperties = NULL;
ap                 = NULL;
elsewhere_allo     = NULL;              /* Init elsewhere allo pointers */
elsewhere_prec     = NULL;
is_elsewhere_allo  = FALSE;
bad_allo           = 0;
allo_bad           = 0;
/*
 *  fill in the fields according to codes in record
 */
for ( rp = recp ; *rp != NUL ; rp = endp )
	{
	endp = rp + strlen(rp) + 1; /* save address of next field */
	code = *rp++;               /* field code is first char on line */
	rp += strspn(rp, szWhitespace_m);         /* skip over white space */
	switch (code)
		{
		case 'M':               /* morphname == proto form (etymology) */
			isolateWord(rp);                  /* use only first word */
			/*
			 *  check for regular sound change marker
			 */
			if (*rp && ((k = strpos(pStamp_in->szRSCMarkers,*rp)) >= 0))
				{                       /* we have a regular sound change */
				morpheme.iMorphType |= (RSC << k);
				++rp;                   /* skip past the marker */
				}
			mname = rp;         /* save the address of the morphname */
			break;

		case 'E':               /* Elsewhere allomorph */

			is_elsewhere_allo = TRUE;
								/* NOTE: there is no 'break' statement here */
								/* on purpose: this entry needs to be */
								/* processed as an allomorph and so it */
								/* needs to fall through to the 'A' case */

		case 'A':                       /* allomorph */
			/*
			 *  allocate an allomorph_list node and link it into
			 *    the morpheme's list (keep dictionary order)
			 */
			if (morpheme.pAllomorphs == NULL)
				morpheme.pAllomorphs = ap = (StampAllomorphList *)allocMemory(
						   sizeof(StampAllomorphList) );
			else
				{
				ap->pNext = (StampAllomorphList *)allocMemory(
						   sizeof(StampAllomorphList) );
										/* if we are processing a elsewhere */
										/* allomorph, remember preceding */
				if (is_elsewhere_allo)  /* allomorph */
					elsewhere_prec = ap;
				ap = ap->pNext;
				}
		nextp    = rp + strlen(rp);
		allo_bad = process_allomorph(rp, ap, pStamp_in);
		rp       = nextp;
			bad_allo |= allo_bad;               /* one failure ruins all */

			if (is_elsewhere_allo)      /* if are processing elsewhere */
				{                       /* allomorph, remember it */
				elsewhere_allo = ap;
				is_elsewhere_allo = FALSE;
				}
			rp = nextp;
			break;

		case 'C':                       /* root categories */
			setrootcats(rp, &(morpheme.u.pRootCategories), pStamp_in);
			if (morpheme.u.pRootCategories != NULL)
				{
				morpheme.iFromCategory = *morpheme.u.pRootCategories;
				morpheme.iToCategory   = *morpheme.u.pRootCategories;
				}
			else
				{
				morpheme.iFromCategory = 0;
				morpheme.iToCategory   = 0;
				}
			break;

		case 'P':                       /* morpheme properties */
			parseAmplePropertySet(rp, &mprops, AMPLE_MORPH_PROP,
				  uiRecordNumber_m, szRecordKey_g,
				  pszDictErrorHead_m,
				  &pStamp_in->sProperties,
				  &pStamp_in->pPropertyList,
				  pStamp_in->pLogFP);
			break;

#ifdef TONEPARS
		case 'D':                       /* morphological/tone domain */
			isolateWord(rp);
			morpheme.iDomain = parseDomainType(rp, uiRecordNumber_m,
						   szRecordKey_g,
						   pszDictErrorHead_m,
						   pStamp_in->pLogFP);
			break;

		case 'N':                       /* lexical tone */
			parseTone(rp, &(morpheme.pTones), uiRecordNumber_m, szRecordKey_g,
			  pszDictErrorHead_m, pStamp_in->pLogFP);
			break;
#endif /* TONEPARS */
		} /* end switch */

						/* pass over rest of line */
	  while (*rp++ != '\0')
		  ;

	} /* end for */

								/* take care of elsewhere allomorph, if any */
if (elsewhere_allo != NULL)
	{                           /* there was a elsewhere allomorph */
	if (elsewhere_allo->pNext != NULL)
		{                       /* (if elsewhere is at end, we don't need to */
								/* do anything) */
		if (elsewhere_prec == NULL)
								/* elsewhere is first in the list, so the */
								/* next element becomes first */
			morpheme.pAllomorphs = elsewhere_allo->pNext;
		else
								/* relink previous to next */
			elsewhere_prec->pNext = elsewhere_allo->pNext;
								/* relink elsewhere as last */
		ap->pNext             = elsewhere_allo;
		elsewhere_allo->pNext = NULL;
		ap                    = elsewhere_allo;
		}
	}

#ifdef NOGOOD
	/* No good to ignore last environment, Sabah, Feb 90 */
if ( ap->a.pAlloEnvironment )           /* If last allomorph has environment */
	ap->a.pAlloEnvironment = NULL;      /* Clear it so it will be ignored */
#endif

/*
 *  add this morpheme to the dictionary if it's okay
 */
if (morpheme.u.pRootCategories && morpheme.pAllomorphs && !bad_allo)
	{
	/*
	 *  fill in the morphname from the final allomorph if:
	 *    (1) no etymology, or
	 *    (2) only a regular sound change marker was in etymology field
	 */
	if ((mname == NULL) || (*mname == NUL))
		mname = ap->a.pszAllomorph;
	if (strlen(mname) > MAXMORPH)
		{
		/*
		 *  morphname is too long, so print a message and copy it truncated
		 */
	if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP,
			szMorphnameMessage_m, pszDictErrorHead_m, mname,
			getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m));
		morpheme.pszMorphname =
						strncpy(allocMemory(MAXMORPH+1),mname,MAXMORPH);
		}
	else
		morpheme.pszMorphname = duplicateString(mname);
	/*
	 *  add the morpheme properties to the allomorph properties for all
	 *    of the allomorphs
	 */
	for ( ap = morpheme.pAllomorphs ; ap ; ap = ap->pNext )
		mergeAmplePropertySets( &ap->a.uAlloPropertySet, mprops,
				uiRecordNumber_m, szRecordKey_g,
				&pStamp_in->sProperties,
				&pStamp_in->pPropertyList);
	morpheme.iFromCategory = *morpheme.u.pRootCategories;
	morpheme.iToCategory = *morpheme.u.pRootCategories;
	insert_dict( &morpheme, pStamp_in );
	}
else
	{
	if (pStamp_in->pLogFP != NULL)
	{
	if (mname == NULL)
		fprintf(pStamp_in->pLogFP,
			szLoadMessage_m, pszDictErrorHead_m, "morphname",
			getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m));
	if (morpheme.u.pRootCategories == NULL)
		fprintf(pStamp_in->pLogFP,
			szLoadMessage_m, pszDictErrorHead_m, "category",
			getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m));
	if (morpheme.pAllomorphs == NULL)
		fprintf(pStamp_in->pLogFP,
			szLoadMessage_m, pszDictErrorHead_m, "allomorph",
			getAmpleRecordIDTag(szRecordKey_g, uiRecordNumber_m));
	}
	if (morpheme.pAllomorphs)
	free_allolist(morpheme.pAllomorphs);
	}
/*
 *  save key for possible future error message
 */
strcpy( szOutOfMemoryMarker_g, szRecordKey_g );
}

/*****************************************************************************
 * NAME
 *    addStampDictEntry
 * DESCRIPTION
 *    add an entry from a unified (combined root and affix) STAMP dictionary
 * RETURN VALUE
 *    none
 */
static void addStampDictEntry(pRecord_in, pStamp_io)
char *		pRecord_in;
StampData *	pStamp_io;
{
int	iDicType = ROOT;	/* default entry type */
char *	pszField;
int	iFieldCode;
int	bPrefixStored = FALSE;
int	bInfixStored  = FALSE;
int	bSuffixStored = FALSE;
int	bRootStored   = FALSE;
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
			break;	/* found end of field; hab 2.1b2 */
		case 'p':			/* prefix */
		case 'P':
			iDicType = PFX;
			if (bPrefixStored == FALSE)
			{
			add_affix(pRecord_in, iDicType, pStamp_io);
			bPrefixStored = TRUE;
			}
			break;
		case 'i':			/* infix */
		case 'I':
			iDicType = IFX;
			if (bInfixStored == FALSE)
			{
			add_affix(pRecord_in, iDicType, pStamp_io);
			bInfixStored = TRUE;
			}
			break;
		case 's':			/* suffix */
		case 'S':
			iDicType = SFX;
			if (bSuffixStored == FALSE)
			{
			add_affix(pRecord_in, iDicType, pStamp_io);
			bSuffixStored = TRUE;
			}
			break;
		case 'r':			/* root */
		case 'R':
			iDicType = ROOT;
			if (bRootStored == FALSE)
			{
			add_root(pRecord_in, pStamp_io);
			bRootStored = TRUE;
			}
			break;

		case 'n':			/* interfix */
		case 'N':
		  /* ignore for STAMP */
		  break;

		default:
			if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
				"%sInvalid type field in entry %s: \"%s\"\n",
				pszDictErrorHead_m,
				getAmpleRecordIDTag(szRecordKey_g,
							uiRecordNumber_m),
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
if ((iDicType == ROOT) && (bRootStored == FALSE))
	add_root(pRecord_in, pStamp_io);
}

/*************************************************************************
 * NAME
 *    loadStampDictionary
 * ARGUMENTS
 *    eDicType_in - type of dictionary (PFX, IFX, ROOT, or SFX)
 * DESCRIPTION
 *    Load a target dialect dictionary file for transfer and synthesis.
 * RETURN VALUE
 *    none
 */
int loadStampDictionary(pszFilename_in, eDicType_in, pStamp_io)
const char *	pszFilename_in;
int		eDicType_in;
StampData *	pStamp_io;
{
char *		rp;			/* pointer to a record */
int		count;
char *		pszType;
CodeTable *	pCodeTable = NULL;
FILE *		infp = NULL;

if (pszFilename_in != NULL)
	infp = fopen(pszFilename_in, "r");
if (infp == NULL)
	{
	switch (eDicType_in)
	{
	case PFX:	pszType = "prefix";	break;
	case IFX:	pszType = "infix";	break;
	case SFX:	pszType = "suffix";	break;
	case ROOT:	pszType = "root";	break;
	default:	pszType = "unified";	break;
	}
	reportError(ERROR_MSG, szNoDictionary_m, pszType,
		pszFilename_in ? pszFilename_in : "{NULL}" );
	if ((pStamp_io->pLogFP != NULL) && (pStamp_io->pLogFP != stdout))
	fprintf(pStamp_io->pLogFP, szNoDictionary_m, pszType,
		pszFilename_in ? pszFilename_in : "{NULL}" );
	return -1;
	}

switch (eDicType_in)
	{
	case PFX:
	pCodeTable = pStamp_io->pPrefixTable;
	pszDictType_m = "PREFIX";
	pszDictErrorHead_m = "PREFIX DICTIONARY: ";
	break;
	case IFX:
	pCodeTable = pStamp_io->pInfixTable;
	pszDictType_m = "INFIX";
	pszDictErrorHead_m = "INFIX DICTIONARY: ";
	break;
	case SFX:
	pCodeTable = pStamp_io->pSuffixTable;
	pszDictType_m = "SUFFIX";
	pszDictErrorHead_m = "SUFFIX DICTIONARY: ";
	break;
	case ROOT:
	pCodeTable = pStamp_io->pRootTable;
	pszDictType_m = "ROOT";
	pszDictErrorHead_m = "ROOT DICTIONARY: ";
	break;
	default:
	pCodeTable = pStamp_io->pDictTable;
	pszDictType_m = "UNIFIED";
	pszDictErrorHead_m = "UNIFIED DICTIONARY: ";
	break;
	}
/*
 *  quit if the code table doesn't exist
 */
if (pCodeTable == NULL)
	{
	reportError(ERROR_MSG, szEmptyCodeTable_m, pszDictErrorHead_m);
	if ((pStamp_io->pLogFP != NULL) && (pStamp_io->pLogFP != stdout))
	fprintf(pStamp_io->pLogFP,
		szEmptyCodeTable_m, pszDictErrorHead_m);
	return -1;
	}
count = uiRecordNumber_m = 0;
/*
 *  read the entries from the dictionary one at a time
 */
while ((rp = readStdFormatRecord(infp,
				 pCodeTable,
				 pStamp_io->cComment,
				 &uiRecordNumber_m)) != NULL)
	{
	if (*rp == NUL)
	continue;		/* empty record (probably NOLOAD) */
	switch (eDicType_in)
	{
	case PFX:
	case SFX:
	case IFX:
		add_affix(rp, eDicType_in, pStamp_io);
		break;
	case ROOT:
		add_root(rp, pStamp_io);
		break;
	default:
		addStampDictEntry(rp, pStamp_io);
		break;
	}
	++count;
	}
fclose(infp);

return count;
}


/*************************************************************************
 * NAME
 *    link_morpheme_list
 * ARGUMENTS
 *    new - pointer to new morpheme_list structure
 *    old - pointer to list of old morpheme_list struct's
 * DESCRIPTION
 *    Add a node to a list of morpheme_list struct's.
 * RETURN VALUE
 *    new
 */
static void * link_morpheme_list(new, old)
VOIDP new;
VOIDP old;
{
StampMorphemeList * pNew = (StampMorphemeList *)new;
StampMorphemeList * pOld = (StampMorphemeList *)old;

pNew->mlink = pOld;               /* adding to the head of the list */
return (VOIDP)pNew;
}

/*****************************************************************************
 * NAME
 *    free_allolist
 * DESCRIPTION
 *    Free the memory allocated for a list of StampAllomorphList data
 *    structures.
 * RETURN VALUE
 *    none
 */
static void free_allolist(pList_io)
StampAllomorphList * pList_io;
{
StampAllomorphList * pAlloL;
StampAllomorphList * pAlloNext;

for ( pAlloL = pList_io ; pAlloL ; pAlloL = pAlloNext )
	{
	pAlloNext = pAlloL->pNext;
	freeMemory(pAlloL->a.pszAllomorph);
/*  freeMemory(pAlloL->a.uAlloPropertySet.pProperties);*/
/*  or freeMemory(pAlloL->a.uAlloPropertySet.pBigProperties); ?*/
/*  freeAmpleEnvConstraint(	pAlloL->a.pAlloEnvironment );*/
	freeMemory(pAlloL);
	}
}

/*************************************************************************
 * NAME
 *    insert_dict
 * ARGUMENTS
 *    new - pointer to morpheme structure to copy and add to dictionary
 * DESCRIPTION
 *    add an entry to the dictionary
 * RETURN VALUE
 *    none
 */
static void insert_dict(new, pStamp_io)
StampMorpheme *	new;
StampData *	pStamp_io;
{
StampMorphemeList *mp;

if (new == NULL)
	return;                     /* ignore insane input */
/*
 *  prevent duplicate entries
 */
if (check_dict( new->iMorphType, new->pszMorphname, new->u.pRootCategories,
		pStamp_io))
	{
	if (pStamp_io->pLogFP != NULL)
	fprintf(pStamp_io->pLogFP,
		"%smorphname already in dictionary: %s\n",
		pszDictErrorHead_m, new->pszMorphname);
	freeMemory(new->pszMorphname);
	free_allolist( new->pAllomorphs );
	return;
	}
/*
 *  allocate a new node and copy the values
 */
mp = (StampMorphemeList *)allocMemory( sizeof(StampMorphemeList) );
mp->m.pszMorphname = new->pszMorphname;
mp->m.iMorphType = new->iMorphType;
mp->m.iFromCategory = new->iFromCategory;
mp->m.iToCategory = new->iToCategory;
if (mp->m.iMorphType & ROOT)
	mp->m.u.pRootCategories = new->u.pRootCategories; /* root categories */
else
	mp->m.u.pInfixEnv = new->u.pInfixEnv;           /* infix environment */
mp->m.iOrderClass = new->iOrderClass;
mp->m.pAllomorphs = new->pAllomorphs;
#ifdef TONEPARS
mp->m.pTones = new->pTones;
mp->m.iDomain = new->iDomain;
#endif /* TONEPARS */
/*
 *  add this node to the dictionary
 */
pStamp_io->pDictionary = addDataToTrie(pStamp_io->pDictionary,
					   mp->m.pszMorphname,
					   mp,
					   link_morpheme_list,
					   pStamp_io->iMaxTrieLevel);
}

/*************************************************************************
 * NAME
 *    check_dict
 * ARGUMENTS
 *    type   - morphtype byte of entry to retrieve
 *    name   - morphname of entry to retrieve from the dictionary
 *    rcats  - pointer to root category codes (always nonzero for roots)
 * DESCRIPTION
 *    Search the dictionary for a particular morphname, matching roots
 *    against any of the category codes in rcats.
 * RETURN VALUE
 *    nonzero if matching entry found, zero otherwise
 */
static int check_dict(type, name, rcats, pStamp_in)
unsigned	type;
char  *		name;
unsigned char *	rcats;
StampData *	pStamp_in;
{
StampMorphemeList *mp;

for (	mp = (StampMorphemeList *)findDataInTrie(pStamp_in->pDictionary,name) ;
	mp ;
	mp = mp->mlink )
	{
	if (!strcmp(name,mp->m.pszMorphname))
		{
		if (type & mp->m.iMorphType & ROOT)
			{                           /* root category must match also */
			if (strpbrk( (char *)mp->m.u.pRootCategories, (char *)rcats) == NULL)
				continue;               /* different type of root */
			}
		return( 1 );            /* found it! */
		}
	}
return( 0 );                    /* sorry, not there */
}

/*************************************************************************
 * NAME
 *    searchStampDictionary
 * DESCRIPTION
 *    Search the dictionary for a particular morphname.
 * RETURN VALUE
 *    address of morpheme structure found, or NULL if not there
 */
StampMorpheme * searchStampDictionary(uiType_in, pszName_in, uiCategory_in,
					  bMatchCat_in, pStamp_in)
unsigned	uiType_in;	/* morphtype byte of entry to retrieve */
char *		pszName_in;	/* morphname of entry to retrieve */
unsigned	uiCategory_in;	/* root category code (zero for affixes) */
unsigned	bMatchCat_in;	/* flag whether categories must match */
StampData *	pStamp_in;
{
StampMorphemeList *	mp;
StampMorpheme *		pMorph;
StampMorpheme *		pDiffMorph;

pMorph     = NULL;
pDiffMorph = NULL;
for (	mp = (StampMorphemeList *)findDataInTrie(pStamp_in->pDictionary,
						 pszName_in) ;
	mp ;
	mp = mp->mlink )
	{
	if (strcmp(pszName_in, mp->m.pszMorphname) == 0)
		{
	/*
	 *  if type is unknown, return first match to morph name
	 */
	if (uiType_in == 0)
		return &(mp->m);

	if (uiType_in & mp->m.iMorphType & MORPHTYPE_MASK)
		{
		/*
		 *  we have found an entry with the right morph name and type
		 */
		if (uiType_in & ROOT)
		{			/* root category must match also */
		if (strchr((char *)mp->m.u.pRootCategories,
			   (int)((char)uiCategory_in)) == NULL)
			{
			/*
			 *  if categories do not need to match, and we have a
			 *  different root category:  remember it in case
			 *  there is no better choice
			 */
			if (!bMatchCat_in)
			pMorph = &(mp->m);
			}
		else
			{
			/*
			 *  matched root type and category
			 */
#ifndef hab2117
			/* make sure we pass out the right category!
			 * Note: This is not important for STAMP, but is for tools
			 * like TonePars which are an ANA filter and also use the
			 * dictionary entry.
			 */
			mp->m.iFromCategory = mp->m.iToCategory = uiCategory_in;
#endif /* hab2117 */
			return &(mp->m);
			}
		}
		else
		{
		/*
		 *  matched affix type
		 */
		return &(mp->m);
		}
		}
	else
		{
		/*
		 *  we have an entry with the right name, but the wrong type
		 */
		if (uiType_in & (PFX | SFX | IFX))
		{
		/*
		 *  want an affix
		 */
		if (mp->m.iMorphType & IFX)
			{
			/*
			 *  remember Infix in case no Prefix or Suffix is found
			 */
			pMorph = &(mp->m);
			}
		else if (mp->m.iMorphType & (PFX | SFX))
			{
			/*
			 *  implicit transfer from Prefix to Suffix (or vice versa)
			 */
			if (pMorph == NULL)
			pMorph = &(mp->m);
			}
#ifdef OK_TO_CHANGE_TYPES
		else if (pDiffMorph == NULL)
			{
			/*
			 *  want an affix, but have a root (?)
			 */
			pDiffMorph = &(mp->m);
			}
		}
		else
		{
		/*
		 *  want a root, but have an affix (?)
		 */
		if (mp->m.iToCategory == uiCategory_in)
			pDiffMorph = &(mp->m);
		else if (!bMatchCat_in && (pDiffMorph == NULL))
			pDiffMorph = &(mp->m);
#endif
		}
		}
		}
	}
if (pMorph != NULL)
	return pMorph;		/* return best match */
else
	return pDiffMorph;		/* return poor match (may be NULL) */
}

/*************************************************************************
 * NAME
 *    addStampAllosToMorph
 * ARGUMENTS
 *    mp       - morpheme to look up
 *    catmatch - flag specifying whether categories must match
 * DESCRIPTION
 *    Look up and give allos to a morpheme.
 * RETURN VALUE
 *    None
 */
void addStampAllosToMorph(mp, catmatch, pStamp_in)
StampAnalysis *	mp;
unsigned	catmatch;
StampData *	pStamp_in;
{
register StampMorpheme *dp;

if (mp->m.pAllomorphs)    /* If already looked up, return */
	return;
/*
 *  If a root morphname starts with a regular sound change
 *      look it up in the dictionary without the marker.
 *  This is done because morphnames that begin with RSC marks
 *      are stored in the dictionary without those marks.
 */
if (    (mp->m.iMorphType & ROOT) &&
	pStamp_in->szRSCMarkers[0] &&
	(strpos(pStamp_in->szRSCMarkers, *(mp->m.pszMorphname)) >= 0) )
	{
	/* look it up minus the marker */
	dp = searchStampDictionary(mp->m.iMorphType,
				   (mp->m.pszMorphname)+1,
				   mp->m.iToCategory,
				   catmatch,
				   pStamp_in);
	}
else
	dp = searchStampDictionary(mp->m.iMorphType,
				   mp->m.pszMorphname,
				   mp->m.iToCategory,
				   catmatch,
				   pStamp_in);

if (dp)
	{
	if (/*pStamp_in->bTrace &&*/ (pStamp_in->pLogFP != NULL))
	{
	if (    (mp->m.iMorphType != 0) &&
		((mp->m.iMorphType & MORPHTYPE_MASK) !=
					 (dp->iMorphType & MORPHTYPE_MASK)) )
		{
		char * pszOldType;
		char * pszNewType;
		switch (mp->m.iMorphType & MORPHTYPE_MASK)
		{
		case 0:		pszOldType = "none";	break;
		case PFX:	pszOldType = "Prefix";	break;
		case ROOT:	pszOldType = "Root";	break;
		case SFX:	pszOldType = "Suffix";	break;
		case IFX:	pszOldType = "Infix";	break;
		default:	pszOldType = "BOGUS!";	break;
		}
		switch (dp->iMorphType & MORPHTYPE_MASK)
		{
		case 0:		pszNewType = "none";	break;
		case PFX:	pszNewType = "Prefix";	break;
		case ROOT:	pszNewType = "Root";	break;
		case SFX:	pszNewType = "Suffix";	break;
		case IFX:	pszNewType = "Infix";	break;
		default:	pszNewType = "BOGUS!";	break;
		}
		fprintf(pStamp_in->pLogFP,
			"  Changing morpheme type for \"%s\" from %s to %s\n",
			mp->m.pszMorphname, pszOldType, pszNewType);
		}
	}
	mp->m.iMorphType  = dp->iMorphType;  /* we haven't known affix types */
	mp->m.iOrderClass = dp->iOrderClass;
	/* ALB 1.4w Don't mess with root category */
	/* BJY 1.4z unless we don't have a category yet */
	if ( !(dp->iMorphType & ROOT)
	 || (!mp->m.iToCategory && !mp->m.iFromCategory))
	{
	mp->m.iFromCategory = dp->iFromCategory;
	mp->m.iToCategory   = dp->iToCategory;
	}
	mp->m.pAllomorphs = dp->pAllomorphs;
	if (dp->iMorphType & IFX)
	mp->m.u.pInfixEnv = dp->u.pInfixEnv;    /* infix environment */
	}
}

/*************************************************************************
 * NAME
 *    writeStampDictionary
 * DESCRIPTION
 *    Display the contents of the entire dictionary (gulp).
 * RETURN VALUE
 *    none
 */
void writeStampDictionary(pOutputFP_in, pStamp_in)
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
if ((pOutputFP_in == NULL) || (pStamp_in == NULL))
	return;

fprintf(pOutputFP_in, "\n\nDUMP OF THE ENTIRE DICTIONARY FOLLOWS\n");
fprintf(pOutputFP_in,
	"=====================================================================");
pStamp_m = pStamp_in;
writeTrieData( pStamp_in->pDictionary, show_brief_mlist, pOutputFP_in );
pStamp_m = NULL;
fprintf(pOutputFP_in,
	"\n=====================================================================");
fprintf(pOutputFP_in, "\nEND OF DICTIONARY LISTING\n");
}

/*****************************************************************************
 * NAME
 *    free entry
 * DESCRIPTION
 *    Free the memory allocated at the given node of the dictionary trie.
 * RETURN VALUE
 *    none
 */
static void free_entry(pList_in)
VOIDP pList_in;
{
StampMorphemeList * pMorphL;
StampMorphemeList * pNext;

for ( pMorphL = (StampMorphemeList *)pList_in ; pMorphL ; pMorphL = pNext )
	{
	pNext = pMorphL->mlink;
	freeMemory(pMorphL->m.pszMorphname);
	free_allolist(pMorphL->m.pAllomorphs);
	if (pMorphL->m.iMorphType & IFX)
	freeAmpleEnvConstraint( pMorphL->m.u.pInfixEnv );
	freeMemory(pMorphL);
	}
}

/*****************************************************************************
 * NAME
 *    freeStampDictionary
 * DESCRIPTION
 *    Free all the memory consumed by loading the STAMP dictionary files.
 * RETURN VALUE
 *    none
 */
void freeStampDictionary(pStamp_io)
StampData * pStamp_io;
{
if (pStamp_io->pDictionary)
	{
	eraseTrie(pStamp_io->pDictionary, free_entry);
	pStamp_io->pDictionary = NULL;
	}
}
