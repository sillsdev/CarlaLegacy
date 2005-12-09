/* ANAL.C - analyze a word using the morpheme dictionaries
 ***************************************************************************
 *
 * unsigned performAmpleAnalysis( AmpleWord * pThisWord_io,
 *				  AmpleWord * pPreviousWord_in,
 *				  AmpleWord * pNextWord_in,
 *				  AmpleData * pAmple_in )
 *
 * unsigned analyzeAmpleWord( AmpleWord * pThisWord_io,
 *                            AmpleData * pAmple_in)
 *
 * unsigned refineAmpleAnalysis( AmpleWord * pThisWord_io,
 *                               AmpleWord * pPreviousWord_in,
 *                               AmpleWord * pNextWord_in,
 *                               AmpleData * pAmple_in)
 *
 * void eraseAmpleWord( AmpleWord * pWord_in )
 *
 * void initiateAmpleTrace(const AmpleData * pAmple_in)
 *
 * void terminateAmpleTrace(const AmpleData * pAmple_in)
 *
 *#ifdef EXPERIMENTAL
 * void writeAmpleParses(FILE *           pOutputFP_in,
 *                       AmpleParseList * pParses_in,
 *                       AmpleData *      pAmple_in)
 *#endif
 *
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"
#include "ampcat.h"

#ifdef hab3312
/*****************************************************************************
 * NAME
 *    AmpleAmlist (struct ample_amlist)
 * DESCRIPTION
 *    amlist produced by get_entries
 */
typedef struct ample_amlist {
	AmpleAllomorph *	amp;
	int			alen;		/* length of allomorph string */
	struct ample_amlist *amlink;
	} AmpleAmlist;
#endif /* hab3312 - moved to ample.h */

/********************* ANAL.C FUNCTION PROTOTYPES *********************/

static AmpleHeadList *	make_root_head	P((AmpleHeadList *  rhead,
					   AmpleAllomorph * ap,
					   int              cnum,
					   AmpleData *      pAmple_in));
static char *		form_anal	P((AmpleHeadList * head,
					   AmpleData *     pAmple_in));
static AmpleAllomorph *	copy_am		P((int              etype,
					   AmpleAllomorph * ap,
					   AmpleData *      pAmple_in));
static AmpleAmlist *	get_entries	P((char *      key,
					   int         etype,
					   AmpleData * pAmple_in));
static int		get_prefix	P((AmpleHeadList * head,
					   char *          tail,
					   int             pfxs_found,
					   int             ifxs_found,
					   int             nulls_have,
					   AmpleData *     pAmple_in));
static int		ifx_loc		P((AmpleAmlist * ifxp,
					   char *        tail,
					   char *        ifxtail,
					   int           what,
					   AmpleData *   pAmple_in));
static int		get_infix	P((AmpleHeadList * head,
					   char *          tail,
					   int             roots_found,
					   int             ifxs_found,
					   int             nfxs_found,
					   int             what,
					   int             what_found,
					   int             nulls_have,
					   AmpleData *     pAmple_in));
static int		get_interfix	P((AmpleHeadList * head,
					   char *          tail,
					   int             roots_found,
					   int             ifxs_found,
					   int             nfxs_found,
					   int             nulls_have,
					   int		   bInterfixJustFound,
					   AmpleData *     pAmple_in));
static int		get_root	P((AmpleHeadList * head,
					   char *          tail,
					   int             roots_found,
					   int             ifxs_found,
					   int             nfxs_found,
					   int             nulls_have,
					   int		   bRootJustFound,
					   AmpleData *     pAmple_in));
static AmpleAllomorph *	dup_am		P((AmpleAllomorph * ap));
static int		same_string	P((char * pszFirst_in,
					   char * pszSecond_in,
					   int    bCheck_in));
static int		find_result	P((WordTemplate * pWord_in,
					   char *         pszAnal_in,
					   char *         pszDecomp_in,
					   char *         pszCat_in,
					   char *         pszProp_in,
					   char *         pszFeatD_in,
					   char *         pszUnderF_in,
					   AmpleData *    pAmple_in));
static int		get_suffix	P((AmpleHeadList * head,
					   char *          tail,
					   int             sfxs_found,
					   int             ifxs_found,
					   int             nulls_have,
					   AmpleData *     pAmple_in));
static void		a_trace		P((int            dtype,
					   char *         tail,
					   int            tlen,
					   char *         m_name,
					   unsigned       fcat,
					   unsigned       tcat,
					   PropertySet_t  props,
					   int            ordercl,
					   int            orderclMax,
					   char *         pszAllomorphID_in,
					   char *         pszPATRCat_in,
					   AmpleAlloEnv * ac_ptr,
					   AmpleData *    pAmple_in));
static void	reportInfixEnvironmentFailure	P((char * pszTail_in,
						   AmpleAllomorph *ap,
						   AmpleData *    pAmple_in));
static void	reportInfixTypeFailure	P((char *         pszType_in,
					   AmpleData *    pAmple_in));
static void formatFormForXMLEnvironment P((char *pszTest_in,
					   char *pszAllomorph_in,
					   int   iAlloLen,
					   AmpleData *Ample_in));
static void reportInfixMorphForLocationFailure P((int what,
						   char * ifxtail,
						   AmpleAmlist *ifxp,
						   AmpleAllomorph *ap,
						   AmpleInfixInfo *ip,
						  AmpleData *pAmple_in));
static int	testAmpleStringEnvirons	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
				/* 3.3.0 hab */
static int	testAmplePunctEnvirons	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
static int	testAmpleAdhocPairs	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len));
static int	testAmpleCompoundRoots	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
static int	testAmpleMorphEnvirons	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
static int	checkAmpleMorphConstraint P((
					AmpleMorphConstraint * pMorphConstraint_in,
					AmpleHeadList *	   pCurrent_in,
					AmpleHeadList *	   pLeft_in,
					AmpleData *            pAmple_in));
#ifdef EXPERIMENTAL
#ifndef hab350
static int	testAmpleNeverEnvirons	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
static int	checkAmpleNeverConstraint P((
					AmpleNeverConstraint * pNeverConstraint_in,
					AmpleHeadList *	   pCurrent_in,
					AmpleHeadList *	   pLeft_in,
					AmpleData *            pAmple_in));
#endif /* hab350 */
#endif /* EXPERIMENTAL */
static int	testAmpleMorphsCo_occur	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
static int	performAmplePrefixTests	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
static int	performAmpleInfixTests	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
static int	performAmpleInterfixTests	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
static int	performAmpleRootTests	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
static int	performAmpleSuffixTests	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleData *     pAmple_in));
static int	performAmpleFinalTests	P((AmpleHeadList * anal,
					   AmpleData *     pAmple_in));
static void	p_trace			P((char *          ptype,
					   AmpleTestList * flp,
					   AmpleData *     pAmple_in));
static int	testAmpleUserDefined	P((AmpleHeadList * left,
					   AmpleHeadList * current,
					   char *          strp,
					   int             len,
					   AmpleTestNode * tree,
					   AmpleData *     pAmple_in));
static char *		get_allo	P((AmpleHeadList * morph));
static AmpleHeadList *	getpos		P((int pos));
static char *		get_surf	P((int pos));
static char *		get_punct 	P((int pos)); /* 3.3.0 hab */
static int		get_from	P((AmpleHeadList * hp));
static int		get_to		P((AmpleHeadList * hp));
static int		utest		P((AmpleTestNode * tree,
					   AmpleData *     pAmple_in));
static char *		get_property_name P((int               iProp_in,
						 const AmpleData * pAmple_in));
static void		sgml_trace	P((AmpleData * pAmple_in,
					   char *      pszString_in,
					   int         bIndent_in));
static void             sgml_trace_success P((AmpleData * pAmple_in));
static void		store_AMPLE_trace P((AmpleData *  pAmple_in,
						 const char * pszFmt,
						 const char * pszArg));
static void		resetLocalGlobals P((void));
static void	free_headlist_list P((AmpleHeadlistList * pHeadlists_io));
static void xml_maximum_reached P((AmpleData * pAmple_in, char * pszType_in));

#ifdef EXPERIMENTAL
static char *	build_feature_string	P((char * pszFeat_in,
					   char * pszFrom_in,
					   char * pszTo_in,
					   char * pszProperties_in));
static char *	build_prop_string P((const PropertySet_t     pPropertySet_in,
					 const AmpleProperties * pProperties_in));
static int	perform_word_parse	P((AmpleHeadList * anal,
					   AmpleData *     pAmple_in,
					   PATREdgeList ** ppWordParse_out));
#endif /* EXPERIMENTAL */

/********************* ANAL.C LOCAL VARIABLES *********************/
/*
 *  pointer to left end of headlist
 */
static AmpleHeadList *	pAmpleLeftHead_m = NULL;
/*
 *  pointer to right end of headlist
 */
static AmpleHeadList *	pAmpleRightHead_m = NULL;
/*
 *  decomposition string
 */
static char *		pszDecomposition_m = NULL;
/*
 *  category output string
 */
static char *		pszCategory_m = NULL;
/*
 *  properties string
 */
static char *		pszProperties_m = NULL;
/*
 *  feature descriptor string
 */
static char *		pszFeatures_m = NULL;
/*
 *  underlying form string
 */
static char *		pszUnderlying_m = NULL;
/*
 *  surface form string
 */
static char *		pszSurfaceForm_m = NULL;
/*
 * computed category index
 */
static int			iComputedCat;
/*
 *  depth of indentation for tracing
 */
static int		iTracingDepth_m = 0;
/*
 *  number of ambiguities found
 */
static unsigned		uiAmbigCount_m = 0;
/*
 *  root was found in this analysis
 */
static int		bRootFound_m = FALSE;
/*
 *  furthest we got in this analysis
 */
static char *		pszDeeptail_m = NULL;
/*
 *  word templates: current word, previous word, and next word
 */
static AmpleWord *	pCurrentWord_m  = NULL;
static AmpleWord *	pPreviousWord_m = NULL;
static AmpleWord *	pNextWord_m     = NULL;
static int		bUsesPrevWord_m = FALSE;
static int		bUsesNextWord_m = FALSE;
static int		bUseSurroundingWords_m = FALSE;
/*
 *  header for error messages in tests
 */
static char *		pszAmpleTestErrorHeader_m = "";
static const char	szTraceTab_m[16] = "               ";

/********************* APREDS.C LOCAL VARIABLES *********************/

static AmplePairList *	pAdhocList_m;	/* working pairlist pointer */
static AmpleHeadList *	pForLeft_m = NULL;	/* used in FOR_*_LEFT */
static AmpleHeadList *	pForRight_m = NULL;	/* used in FOR_*_RIGHT */
/*
 * testAmpleUserDefined(...,current, strp, len, tree)
 */
static AmpleHeadList *	pTestCurrent_m;
static char *		pszTestString_m;
static int		iTestAlloLength_m;
static AmpleTestNode *	pTestTreeRoot_m;

static char *	pszTempSurface_m = NULL;

/***************************************************************************
 * NAME
 *    performAmpleAnalysis
 * DESCRIPTION
 *    Analyze this word.
 * RETURN VALUE
 *    the number of analyses found
 */
unsigned performAmpleAnalysis(pThisWord_io, pPreviousWord_in, pNextWord_in,
				  pAmple_in)
AmpleWord * pThisWord_io;
AmpleWord * pPreviousWord_in;
AmpleWord * pNextWord_in;
AmpleData * pAmple_in;
{
size_t		i;
int		bAllosTried;
/*
 *  initialize the analysis globals
 */
resetLocalGlobals();
pCurrentWord_m                       = pThisWord_io;
pCurrentWord_m->pTemplate->pAnalyses = NULL;

pPreviousWord_m = pPreviousWord_in;
pNextWord_m     = pNextWord_in;

if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
	{
	const char * pszFmt = "About to parse %s\n";
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
	pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	pszFmt = "<wordTrace>\n<!-- %s -->\n";
	store_AMPLE_trace(pAmple_in, pszFmt,
			  pCurrentWord_m->pTemplate->pszOrigWord);
	}
/*
 *  step through any possible normalized forms
 */
for ( i = 0 ; pCurrentWord_m->pTemplate->paWord[i] ; ++i )
	{
	pszSurfaceForm_m = pCurrentWord_m->pTemplate->paWord[i];
	pszDeeptail_m    = pszSurfaceForm_m;
	bRootFound_m     = FALSE;
	bUsesPrevWord_m  = FALSE;
	bUsesNextWord_m  = FALSE;
	/*
	 *  Process word recursively starting with prefix, followed by root, and
	 *  suffix, with infix appropriately mingled in.
	 */
	if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
	{
	const char * pszFmt = "Parsing %s\n";
	char *       pszStr = pszSurfaceForm_m;
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		{
		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		  pszFmt = "<form>%s</form>\n<trace>\n";
		else
		  pszFmt = "<form>%s</>\n<trace>\n";
#ifdef HAVE_ALLOCA
		pszStr = (char *)alloca(
				 lengthAmplePCDATA(pszSurfaceForm_m, FALSE)+1);
#else
		pszStr = (char *)allocMemory(
				 lengthAmplePCDATA(pszSurfaceForm_m, FALSE)+1);
#endif
		storeAmplePCDATA(pszStr, pszSurfaceForm_m, FALSE);
		}
	store_AMPLE_trace(pAmple_in, pszFmt, pszStr);
#ifndef HAVE_ALLOCA
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		freeMemory(pszStr);
#endif
	iTracingDepth_m = -1;
	}

	bAllosTried = get_prefix(NULL, pszSurfaceForm_m, 0, 0, 0, pAmple_in);

	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
	pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	{
	const char * pszFmt = "</trace>\n";
	char *	     pszStr = NULL;

	if (bAllosTried == FALSE)
		{
		if ((pszSurfaceForm_m != NULL) && (*pszSurfaceForm_m != NUL))
		{
		  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			pszFmt =
			  "<parseNode>\n  <leftover>%s</leftover>\n</parseNode>\n</trace>\n";
		  else
			pszFmt =
			  "<parseNode>\n  <leftover>%s</>\n</parseNode>\n</trace>\n";
#ifdef HAVE_ALLOCA
		pszStr = (char *)alloca(
				 lengthAmplePCDATA(pszSurfaceForm_m, FALSE)+1);
#else
		pszStr = (char *)allocMemory(
				 lengthAmplePCDATA(pszSurfaceForm_m, FALSE)+1);
#endif
		storeAmplePCDATA(pszStr, pszSurfaceForm_m, FALSE);
		}
		else
		{
		  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			pszFmt =
	 "<parseNode>\n  <endOfWord/><failure test='none'/>\n</parseNode>\n</trace>\n";
		  else
			pszFmt =
	 "<parseNode>\n  <endOfWord><failure test=none>\n</parseNode>\n</trace>\n";
		}
		}
	store_AMPLE_trace(pAmple_in, pszFmt, pszStr);
#ifndef HAVE_ALLOCA
	if (pszStr != NULL)
		freeMemory(pszStr);
#endif
	}
	}
if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
	pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	{
	const char * pszFmt = "</wordTrace>\n";
	store_AMPLE_trace(pAmple_in, pszFmt, NULL);
	}
/*
 *  record information necessary for reporting results
 */
pCurrentWord_m->pszRemaining = pszDeeptail_m;
pCurrentWord_m->uiAmbigCount = uiAmbigCount_m;
pCurrentWord_m->bFoundRoot   = bRootFound_m;

return uiAmbigCount_m;
}

/*****************************************************************************
 * NAME
 *    make_root_head
 * DESCRIPTION
 *    fill a head structure from a root allomorph.
 * RETURN VALUE
 *    pointer to the head structure, or NULL if no more categories exist
 */
static AmpleHeadList * make_root_head(rhead, ap, cnum, pAmple_in)
AmpleHeadList *		rhead;	/* root head to be made */
AmpleAllomorph *	ap;	/* pointer to the allomorph */
int			cnum;	/* number of category to be used (0, 1, ...) */
AmpleData *		pAmple_in;
{
rhead->iROOTCATEG = pAmple_in->bRootGlosses ? (ap->pROOT_CATS)[cnum] :
						(ap->pROOTCATS)[cnum];
if (rhead->iROOTCATEG == NUL)
	return(NULL);		/* no more root categories exist */
/*
 *  category exists
 */
rhead->pAllomorph  = ap;
rhead->sPropertySet.pProperties = ap->sPropertySet.pProperties;
rhead->iOrderClass = 0;
#ifndef hab360
rhead->iOrderClassMax = 0;
#endif
rhead->eType	   = AMPLE_ROOT;
rhead->uiAllomorphLength = 0;
rhead->uiMorphnamesLength = strlen(pAmple_in->bRootGlosses ?
					ap->pROOT_GLOSS :
					ap->pMORPHNAME) +
		   strlen(findAmpleCategoryName((int)(rhead->iROOTCATEG),
						  pAmple_in->pCategories)) + 1;
rhead->pLeft   = (AmpleHeadList *)NULL;
rhead->pRight	= (AmpleHeadList *)NULL;
return(rhead);
}

/************************************************************
 * NAME
 *    form_anal
 * DESCRIPTION
 *    Make a string of morphnames from a headlist.
 *    Also build the decomposition string if it was requested.
 * RETURN VALUE
 *    pointer to analysis string
 */
static char * form_anal(head, pAmple_in)
AmpleHeadList *	head;	/* points to leftmost morpheme of the headlist */
AmpleData *	pAmple_in;
{
char *		anal;		/* points to beginning of analysis string */
char *		cp;
int		len	 = 0;	/* total size of analysis string */
int		dcsize	 = 0;	/* total size of decomposition */
int		pcsize	 = 0;	/* total size of category output */
int		propsize = 0;	/* total size of properties */
int		fdsize	 = 0;	/* total size of feature descriptors */
int		ufsize	 = 0;	/* total size of underlying forms */
AmpleHeadList *	hp;
char *		dp  = NULL;
char *		nwp = NULL;
char *		pp  = NULL;
char *		up  = NULL;
char *		pszFinalCat;
PropertySet_t	prp;
char		decomp_char_str[2];

prp.pProperties = NULL;
decomp_char_str[0] = pAmple_in->sTextCtl.cDecomp;
decomp_char_str[1] = NUL;
/*
 *  find out how much space is needed for the analysis string, including
 *	extra space for root boundary markers
 *  also get the length of the decomposition string
 */
for ( hp = head ; hp ; hp = hp->pRight )
	{
	if (hp->eType == AMPLE_ROOT)	       /* include category name */
	{
	len += strlen(pAmple_in->bRootGlosses ?
			hp->pAllomorph->pROOT_GLOSS : hp->pAllomorph->pMORPHNAME) +
		   strlen(findAmpleCategoryName((int)(hp->iROOTCATEG),
						pAmple_in->pCategories)) + 2;
	if ((hp->pLeft == NULL) || (hp->pLeft->eType != AMPLE_ROOT))
		len += 4;		/* Allow for wedges when find the first root */
	}
	else
	len += strlen(hp->pAllomorph->pMORPHNAME)+ 1;
	dcsize += (hp->uiAllomorphLength ? hp->uiAllomorphLength : 1) + 1;
	/*
	 *	get category size if needed
	 */
	if (pAmple_in->eWriteCategory != AMPLE_NO_CATEGORY)
	{
	if (hp->eType == AMPLE_ROOT)
		pcsize += strlen(findAmpleCategoryName((int)(hp->iROOTCATEG),
						  pAmple_in->pCategories));
	else
		pcsize += strlen(findAmpleCategoryName((int)(hp->iFromCategory),
						 pAmple_in->pCategories)) +
			  strlen(findAmpleCategoryName((int)(hp->iToCategory),
						  pAmple_in->pCategories)) + 1;
	if (hp->pRight != (AmpleHeadList *) NULL)
		pcsize += 1;
	}
	/*
	 *	get property size if needed (1.9zc ALB)
	 */
	if (    (pAmple_in->iOutputFlags & WANT_PROPERTIES) &&
		hp->pAllomorph->sPropertySet.pProperties)
	{
	/*
	 * For each property, allow for its length and a space separator
	 */
	if (pAmple_in->sProperties.uiMaxProperty > 255)
		{
		for (   prp.pBigProperties =
				  hp->pAllomorph->sPropertySet.pBigProperties ;
			*prp.pBigProperties ;
			++prp.pBigProperties )
		propsize += strlen(get_property_name(*prp.pBigProperties,
							 pAmple_in)) + 1;
		propsize += 1; /* Allow for equal sign separator */
		}
	else
		{
		for (  prp.pProperties = hp->pAllomorph->sPropertySet.pProperties ;
			*prp.pProperties ;
			++prp.pProperties )
		propsize += strlen(get_property_name(*prp.pProperties,
							 pAmple_in)) + 1;
		propsize += 1; /* Allow for equal sign separator */
		}
	}
	else
	propsize += 2;
	/*
	 *	get feature descriptor size if needed
	 */
	if (    (pAmple_in->iOutputFlags & WANT_FEATURES) &&
		hp->pAllomorph->pMORPHFD )
	fdsize += strlen(hp->pAllomorph->pMORPHFD) + 1;
	else
	fdsize += 2;
	/*
	 *	get underlying form size if needed
	 */
	if (    (pAmple_in->iOutputFlags & WANT_UNDERLYING) &&
		(hp->pAllomorph->pUNDERFORM != NULL) &&
		(*hp->pAllomorph->pUNDERFORM != NUL) )
	ufsize += strlen(hp->pAllomorph->pUNDERFORM) + 1;
	else
	ufsize += 2;
	}
/*
 *  now that we know how much, allocate some space
 */
anal = allocMemory(len);
if (pAmple_in->iOutputFlags & WANT_DECOMPOSITION)
	{
	/* decompose the word */
	dp = pszDecomposition_m = allocMemory(dcsize);
	nwp = pszSurfaceForm_m;
	}
if (pAmple_in->iOutputFlags & WANT_PROPERTIES)
	{				/* if outputting properties 1.9zc ALB */
	pszProperties_m = allocMemory(propsize);	/* Space for properties */
	*pszProperties_m = NUL;			/* Init to null */
	}
if (pAmple_in->iOutputFlags & WANT_FEATURES)
	{				/* if outputting feature descriptors */
	pszFeatures_m = allocMemory(fdsize);	/* Space for fd's */
	*pszFeatures_m = NUL;			/* Init to null */
	}
if (pAmple_in->iOutputFlags & WANT_UNDERLYING)
	{				/* if outputting underlying forms */
	up = pszUnderlying_m = allocMemory(ufsize);	/* Space for uf's */
	*pszUnderlying_m = NUL;			/* Init to null */
	}
if (	(pAmple_in->eWriteCategory == AMPLE_NO_CATEGORY) ||
	(pAmpleLeftHead_m == NULL) ||
	(pAmpleRightHead_m == NULL) ) {
	iComputedCat = 0;
}
else {	/* If outputting category */
#ifndef hab340
	int eWhichCategory = (pAmple_in->eWriteCategory & AMPLE_AFFIX);
#else
	int eWhichCategory = pAmple_in->eWriteCategory;
#endif	/* hab340 */
		/*
		 *	If prefix last and prefix, output prefix cat
		 */
	if (eWhichCategory == AMPLE_COMPUTED_CATEGORY) {
		iComputedCat = computeCategory(pAmple_in, pAmpleLeftHead_m, pAmpleRightHead_m);
	}
	else if (    (eWhichCategory == AMPLE_PREFIX_CATEGORY) &&
		(   (pAmpleLeftHead_m->eType == AMPLE_PFX)  ||
			(pAmpleLeftHead_m->eType == AMPLE_IFX) ) )
	iComputedCat = (int)(pAmpleLeftHead_m->iToCategory);
	/*
	 *	Else (suffix last or no prefix) If suffix output its cat
	 */
	else if (pAmpleRightHead_m->eType == AMPLE_SFX)
	iComputedCat = (int)(pAmpleRightHead_m->iToCategory);
	/*
	 *	Else (no suffix) If prefix, output its cat
	 */
#ifndef hab3319
	else if ( (pAmpleLeftHead_m->eType == AMPLE_PFX) ||
		  (pAmpleLeftHead_m->eType == AMPLE_IFX) )  /* IFX, too */
#else
	else if (pAmpleLeftHead_m->eType == AMPLE_PFX)
#endif /* hab3319 */
	iComputedCat = (int)(pAmpleLeftHead_m->iToCategory);
	/*
	 *	Else output root cat
	 */
	else
#ifndef hab340
				/* could be compound roots;
				   use headedness */
	  if (pAmple_in->eWriteCategory & AMPLE_COMPOUND_ROOT_LEFTHEAD)
		iComputedCat = (int)(pAmpleLeftHead_m->iROOTCATEG);
	  else
		iComputedCat = (int)(pAmpleRightHead_m->iROOTCATEG);
#else
	iComputedCat = (int)(pAmpleRightHead_m->iROOTCATEG);
#endif /* hab340 */
	pszFinalCat = findAmpleCategoryName(iComputedCat, pAmple_in->pCategories);
	if (pszFinalCat == NULL)
		pszFinalCat = "?";
	/*
	 *	increment size by length of finalcat plus space plus final nul
	 */
	pcsize += strlen(pszFinalCat) + 2;
	/*
	 *	allocate space for category info
	 */
	pszCategory_m = strcpy(allocMemory(pcsize), pszFinalCat);
	pp = pszCategory_m + strlen(pszFinalCat);
	if (pAmple_in->bWriteMorphCats)	/* if morphs coming add space */
	*pp++ = ' ';
	}
/*
 *  now that we have space, build the analysis string
 */
for ( cp = anal, hp = head ; hp ; hp = hp->pRight )
	{
	if (    (hp->eType == AMPLE_ROOT) &&
		(	(hp->pLeft == (AmpleHeadList *)NULL) ||
		(hp->pLeft->eType != AMPLE_ROOT) ) )
	{
	*cp++ = pAmple_in->cBeginRoot;
	*cp++ = ' ';
	}
	if (hp->eType == AMPLE_ROOT)
	{
	cp = cpystr(cp, findAmpleCategoryName((int)(hp->iROOTCATEG),
						  pAmple_in->pCategories));
	*cp++ = ' ';
	cp = cpystr(cp, pAmple_in->bRootGlosses ?
			 hp->pAllomorph->pROOT_GLOSS : hp->pAllomorph->pMORPHNAME);
	if (hp->pRight == (AmpleHeadList *)NULL)
		{
		*cp++ = ' ';
		*cp++ = pAmple_in->cEndRoot;
		}
	}
	else
	{
	if (	(hp->pLeft != (AmpleHeadList *)NULL) &&
		(hp->pLeft->eType == AMPLE_ROOT) )
		{
		*cp++ = pAmple_in->cEndRoot;
		*cp++ = ' ';
		}
	cp = cpystr(cp, hp->pAllomorph->pMORPHNAME);
	}
	if (hp->pRight != (AmpleHeadList *)NULL)
	*cp++ = ' ';
	*cp = NUL;			/* always terminate the string */
	/*
	 *	build the decomposed string if it's wanted
	 */
	if ((nwp != NULL) && (pAmple_in->iOutputFlags & WANT_DECOMPOSITION))
	{
	if (hp->uiAllomorphLength == 0)
		*dp++ = '0';		/* null allomorph */
	else
		dp = strncpy(dp,nwp,hp->uiAllomorphLength) + hp->uiAllomorphLength;
	nwp += hp->uiAllomorphLength;
	if (hp->pRight != (AmpleHeadList *)NULL)
		*dp++ = pAmple_in->sTextCtl.cDecomp;
	*dp = NUL;
	}
	/*
	 *	build the category string if it's wanted
	 */
	if (pAmple_in->bWriteMorphCats)
	{
	if (hp->eType == AMPLE_ROOT)
		{
		pp = cpystr(pp, findAmpleCategoryName((int)(hp->iROOTCATEG),
						  pAmple_in->pCategories));
		}
	else
		{
		pp = cpystr(pp, findAmpleCategoryName((int)(hp->iFromCategory),
						  pAmple_in->pCategories));
		*pp++ = '/';
		pp = cpystr(pp, findAmpleCategoryName((int)(hp->iToCategory),
						  pAmple_in->pCategories));
		}
	if (hp->pRight != (AmpleHeadList *)NULL)
		*pp++ = '=';
	*pp = NUL;
	}
	/*
	 *	build the property string if it's wanted 1.9zc ALB
	 */
	if (pAmple_in->iOutputFlags & WANT_PROPERTIES)
	{
#ifdef PROP_DEBUG
	reportError(DEBUG_MSG,
			"Building property string, propsize: %d\n", propsize);
#endif
	/*
	 *  For each property
	 *	if not first, add space as separator
	 *	add property name
	 */
	if (pAmple_in->sProperties.uiMaxProperty > 255)
		{
		for (   prp.pBigProperties =
				  hp->pAllomorph->sPropertySet.pBigProperties ;
			prp.pBigProperties && *prp.pBigProperties ;
			++prp.pBigProperties )
		{
		if ( prp.pBigProperties !=
				  hp->pAllomorph->sPropertySet.pBigProperties )
			strcat( pszProperties_m, " " );
		strcat( pszProperties_m,
			get_property_name(*prp.pBigProperties, pAmple_in));
#ifdef PROP_DEBUG
		reportError(DEBUG_MSG, " %s\n", pszProperties_m );
#endif
		}
		}
	else
		{
		for (  prp.pProperties = hp->pAllomorph->sPropertySet.pProperties ;
			prp.pProperties && *prp.pProperties ;
			++prp.pProperties )
		{
		if ( prp.pProperties !=
					 hp->pAllomorph->sPropertySet.pProperties )
			strcat( pszProperties_m, " " );
		strcat( pszProperties_m,
			get_property_name(*prp.pProperties, pAmple_in));
#ifdef PROP_DEBUG
		reportError(DEBUG_MSG, " %s\n", pszProperties_m );
#endif
		}
		}
	/*
	 *  If more to come, add equal as separator
	 */
	if (hp->pRight != (AmpleHeadList *)NULL)
		strcat(pszProperties_m, "=");
	}
	/*
	 *	build the feature description string if it's wanted
	 */
	if (pAmple_in->iOutputFlags & WANT_FEATURES)
	{
	/*
	 *  If fd string, add to old
	 */
	if (hp->pAllomorph->pMORPHFD)
		strcat(pszFeatures_m, hp->pAllomorph->pMORPHFD);
	/*
	 *  If more to come, add equal as feature separator
	 */
	if (hp->pRight != (AmpleHeadList *)NULL)
		strcat(pszFeatures_m, "=");
	}
	/*
	 *	build the underlying form string if it's wanted
	 */
	if (pAmple_in->iOutputFlags & WANT_UNDERLYING)
	{
	/*
	 *  If uf string, add to old
	 */
	if (hp->pAllomorph->pUNDERFORM && (*hp->pAllomorph->pUNDERFORM != NUL))
		up = cpystr(up, hp->pAllomorph->pUNDERFORM);
	else
		*up++ = '0';		/* null underlying form */
	/*
	 *  If more to come, add decomposition as separator
	 */
	if (hp->pRight != (AmpleHeadList *)NULL)
		*up++ = pAmple_in->sTextCtl.cDecomp;
	*up = NUL;
	}
	}
return(anal);
} /* end form_anal */

/*****************************************************************************
 * NAME
 *    copy_am
 * DESCRIPTION
 *    make a copy of an allomorph
 * RETURN VALUE
 *    pointer to an allomorph structure
 */
static AmpleAllomorph * copy_am( etype, ap, pAmple_in)
int			etype;
AmpleAllomorph *	ap;
AmpleData *		pAmple_in;
{
AmpleAllomorph *	np;
char *			p;
char *			cp;
int			rscis;

np                 = (AmpleAllomorph *)allocMemory(sizeof(AmpleAllomorph));
np->pMorpheme      = (AmpleMorpheme  *)allocMemory(sizeof(AmpleMorpheme));
np->pEnvironment   = ap->pEnvironment;
np->pszAllomorph   = ap->pszAllomorph;
np->pszAllomorphID = ap->pszAllomorphID;
np->pNext          = NULL;
np->iMORPHTYPE     = ap->iMORPHTYPE;
np->pMORPHFD       = ap->pMORPHFD;
np->pUNDERFORM     = ap->pUNDERFORM;
#ifdef EXPERIMENTAL
np->pMorpheme->pszPATRCat = ap->pMorpheme->pszPATRCat;
#endif /* EXPERIMENTAL */
np->sPropertySet.pProperties     = ap->sPropertySet.pProperties;
np->pMorpheme->pMorphConstraints = ap->pMorpheme->pMorphConstraints;

if (etype == AMPLE_ROOT)
	{
	rscis = ((ap->iMORPHTYPE & RSC) == RSC) ? 1 : 0;
	/* set the category info as appropriate */
	if (pAmple_in->bRootGlosses)
	{
	np->pROOT	= ap->pROOT;		/* use the root_info struct */
	np->pROOT_CATS	= ap->pROOT_CATS;
	np->pROOT_GLOSS = ap->pROOT_GLOSS;
	}
	else
	{	       /* copy in root cat info */
	np->pROOTCATS = ap->pROOTCATS;
	}
	/* copy morphname or allomorph string */
	p =	 (ap->pMORPHNAME == NULL) ? ap->pszAllomorph : ap->pMORPHNAME;
	cp = np->pMORPHNAME = allocMemory( strlen(p) + rscis + 1);
	if (rscis)
	*cp++ = '*';
	strcpy(cp, p);
	}
return(np);
} /* end copy_am() */

/*****************************************************************************
 * NAME
 *    get_entries
 * DESCRIPTION
 *    retrieve all allomorphs that match the given key (or a leading
 *    substring of it) and etype
 * RETURN VALUE
 *    list of dictionary entries
 */
static AmpleAmlist * get_entries( key, etype, pAmple_in)
char *		key;
int		etype;
AmpleData *	pAmple_in;
{
AmpleAllomorph *	pAllomorphs = NULL;
AmpleAllomorph *	pAllo;
AmpleAmlist *		amset = NULL;	/* list of allomorphs collected */
AmpleAmlist *		pNew;
int			i;
int			len;
int			cSave;

if (key == NULL)
	return NULL;
len = strlen(key);
/*
 *  because allomorphs are added at the beginning of the list, this produces
 *  a list with the longest matches first
 */
for ( i = 0 ; i <= len ; ++i )
	{
	cSave = key[i];
	key[i] = NUL;
	/* don't repeat Trie search needlessly */
	if (i <= pAmple_in->iMaxTrieDepth)
	pAllomorphs = findDataInTrie(pAmple_in->pDictionary, key);
	for ( pAllo = pAllomorphs ; pAllo != NULL ; pAllo = pAllo->pNext )
	{
	if ((etype != (pAllo->iMORPHTYPE & ATYPE)) &&
		(etype != (pAllo->iMORPHTYPE & AMPLE_NFX)))	/* interfix is subtyped */
		continue;					/* wrong type */
	if ((pAllo->iAllomorphFlags & ACTIVE) == 0)
		continue;					/* not selected */
	if (strcmp(key, pAllo->pszAllomorph) == 0)
		{
		pNew = (AmpleAmlist *)allocMemory(sizeof(AmpleAmlist));
		pNew->amp = (etype == AMPLE_ROOT) ?
				  copy_am(etype, pAllo, pAmple_in) : pAllo;
		pNew->alen = strlen(key);
		pNew->amlink = amset;
		amset = pNew;
		}
	}
	key[i] = cSave;
	}
return(amset);
} /* end get_entries() */

/***************************************************************************
 * NAME
 *    get_prefix
 * DESCRIPTION
 *    Find all prefixes that match an initial part of the rest of the word.
 *    This function is called recursively to find all such prefixes.  When
 *    it cannot find any more prefixes, it calls get_infix() if appropriate,
 *    and then calls get_root().
 * RETURN VALUE
 *    TRUE if one or more prefix allomorphs tried, otherwise FALSE
 */
static int get_prefix( head, tail, pfxs_found, ifxs_found, nulls_have,
			pAmple_in)
AmpleHeadList *	head;		/* list of morphemes already analyzed
				 * (headlist) */
char *		tail;		/* remainder of word string to be parsed */
int		pfxs_found;	/* number of prefixes found in word so far */
int		ifxs_found;	/* number of infixes found in word so far */
int		nulls_have;	/* number of nulls we already have in this
				 * word */
AmpleData *	pAmple_in;
{
AmpleHeadList	newhead;
char *		newtail;
int		i;
AmpleAllomorph *ap;
AmpleAmlist *	pfxp;
AmpleAmlist *	pfxlist;
AmpleAmlist *	np;
int		nulls_next;	/* number of nulls we will have in the next
				 * recursive pass */
int		bAllomorphsTried = FALSE;
int		bContinuation;
int		bOldUsesPrev;
int		bOldUsesNext;
/*
 *  save furthest penetration during parse
 */
if (pszDeeptail_m < tail)
	pszDeeptail_m = tail;
/*
 *  if beginning analysis, then play it safe
 */
if (head == (AmpleHeadList *)NULL)
	pAmpleLeftHead_m = pAmpleRightHead_m = (AmpleHeadList *)NULL;
/*
 *  look for more prefixes if we have not yet found the maximum number
 */
if (pfxs_found >= pAmple_in->iMaxPrefixCount)
	{
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in,
			  "%sMaximum prefixes found.\n",
			  szTraceTab_m);
	}
	else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	  {
	xml_maximum_reached(pAmple_in, "prefixes");
	  }
	/*    return FALSE; */
	}
else
	{
	iTracingDepth_m++;
	/*
	 *	create list of all prefixes whose string matches
	 */
	pfxlist = get_entries( tail, AMPLE_PFX, pAmple_in);
	if (pfxlist != NULL)
	bAllomorphsTried = TRUE;
	/*
	 *	for each allomorph in pfxlist
	 */
	for (pfxp = pfxlist ; pfxp != (AmpleAmlist *)NULL ; pfxp = pfxp->amlink)
	{
	ap = pfxp->amp;
	/* pass along incoming information */
	nulls_next = nulls_have;
	/*
	 * if null morpheme...
	 */
	if (!pfxp->alen)
		{
		/* if we already have the maximum number of nulls allowed,
		   we don't want another one */
		if (nulls_have >= pAmple_in->iMaxNullCount)
		continue;
		/* make note of the fact that we are trying another null */
		nulls_next = nulls_have + 1;
		}
	/*
	 *  for each fromcategory/tocategory pair
	 */
	for ( i = 0 ; (ap->pAFFIX->pFromCategories)[i] ; ++i )
		{
		if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
#ifdef EXPERIMENTAL
		a_trace(AMPLE_PFX, tail, pfxp->alen, ap->pMORPHNAME,
			(ap->pAFFIX->pFromCategories)[i],
			(ap->pAFFIX->pToCategories)[i],
			ap->sPropertySet,
			ap->pAFFIX->iOrderClass,
			ap->pAFFIX->iOrderClassMax,
			ap->pszAllomorphID,
			ap->pPATRCAT,
			ap->pEnvironment, pAmple_in);
#else
		a_trace(AMPLE_PFX, tail, pfxp->alen, ap->pMORPHNAME,
			(ap->pAFFIX->pFromCategories)[i],
			(ap->pAFFIX->pToCategories)[i],
			ap->sPropertySet,
			ap->pAFFIX->iOrderClass,
			ap->pAFFIX->iOrderClassMax,
			ap->pszAllomorphID,
			NULL,
			ap->pEnvironment, pAmple_in);
#endif
		/*
		 *	build a tentative morpheme (headlist) structure
		 */
		newhead.iFromCategory = (ap->pAFFIX->pFromCategories)[i];
		newhead.iToCategory	  = (ap->pAFFIX->pToCategories)[i];
		newhead.sPropertySet.pProperties = ap->sPropertySet.pProperties;
		newhead.iOrderClass	  = ap->pAFFIX->iOrderClass;
#ifndef hab360
		newhead.iOrderClassMax  = ap->pAFFIX->iOrderClassMax;
#endif
		newhead.pAllomorph	  = ap;
		newhead.eType	  = AMPLE_PFX;
		newhead.uiAllomorphLength = pfxp->alen;
		newhead.pLeft    = head;
		newhead.pRight    = (AmpleHeadList *)NULL;
		if (head)
		head->pRight = (AmpleHeadList *)NULL;
		/*
		 *	check for validity of this prefix
		 */
		bOldUsesPrev = bUsesPrevWord_m;
		bOldUsesNext = bUsesNextWord_m;
		if (performAmplePrefixTests(head, &newhead, tail, pfxp->alen,
					pAmple_in))
		{
		/*
		 *  add newhead to head and form newtail
		 */
		if (!head)
			{
			pAmpleLeftHead_m = &newhead;
			newhead.uiMorphnamesLength = strlen(ap->pMORPHNAME) + 1;
			}
		else
			{
			head->pRight = &newhead;
			newhead.uiMorphnamesLength = strlen(ap->pMORPHNAME) +
						  head->uiMorphnamesLength + 1;
			}
		newtail = tail + pfxp->alen;

		sgml_trace(pAmple_in, "  <continuation>\n", TRUE);
		/*
		 *  go find next prefix
		 */
		bContinuation = get_prefix( &newhead, newtail, pfxs_found+1,
						ifxs_found, nulls_next,
						pAmple_in);

		if (	!bContinuation &&
			( (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML) ||
			  (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)) )
			{
			sgml_trace(pAmple_in, "    <parseNode>\n", TRUE);
			if ((newtail != NULL) && (*newtail != NUL))
			{
			char * pszStr;
#ifdef HAVE_ALLOCA
			pszStr = (char *)alloca(
					  lengthAmplePCDATA(newtail, FALSE)+1);
#else
			pszStr = (char *)allocMemory(
					  lengthAmplePCDATA(newtail, FALSE)+1);
#endif
			sgml_trace(pAmple_in, "      <leftover>", TRUE);
			storeAmplePCDATA(pszStr, newtail, FALSE);
			store_AMPLE_trace(pAmple_in, pszStr, NULL);
			if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			  sgml_trace(pAmple_in, "</leftover>\n", FALSE);
			else
			  sgml_trace(pAmple_in, "</>\n", FALSE);
#ifndef HAVE_ALLOCA
			freeMemory(pszStr);
#endif
			}
			else
			  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			sgml_trace(pAmple_in,
				   "      <endOfWord/><failure test='none'/>\n",
				   TRUE);
			  else
			sgml_trace(pAmple_in,
				   "      <endOfWord><failure test=none>\n",
				   TRUE);
			sgml_trace(pAmple_in, "    </parseNode>\n", TRUE);
			}
		sgml_trace(pAmple_in, "  </continuation>\n", TRUE);

		} /* end of performAmplePrefixTests test */
		bUsesPrevWord_m = bOldUsesPrev;
		bUsesNextWord_m = bOldUsesNext;
		/*
		 *  a_trace() writes the <parseNode> marker
		 */
		sgml_trace(pAmple_in, "</parseNode>\n", TRUE);

		} /* end of each category pair loop */
	} /* end of each allomorph loop */
	/*
	 *	prefix list exhausted, so release any allocated space
	 */
	for ( pfxp = pfxlist ; pfxp ; pfxp = np )
	{
	np = pfxp->amlink;
	freeMemory( (char *)pfxp );
	}
	iTracingDepth_m--;

	if (    (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON) &&
		(pfxlist == (AmpleAmlist *)NULL) )
	{
	store_AMPLE_trace(pAmple_in, "%sNo more prefixes found.\n",
			  szTraceTab_m);
	}
	/*
	 *	having processed all prefixes beginning with tail, now go look
	 *	for all infixes near tail which are hidden inside a prefix
	 */
	if (    (ifxs_found < pAmple_in->iMaxInfixCount) &&
		(pAmple_in->iInfixLocations & AMPLE_PFX) &&
		get_infix( head, tail, 0, ifxs_found, 0, AMPLE_PFX, pfxs_found,
			   nulls_have, pAmple_in) )
	bAllomorphsTried = TRUE;

	} /* end of more prefixes allowed test */
/*
 *  having processed all prefixes & infixes beginning with tail, now go look
 *  for all roots beginning with tail
 */
if (get_root( head, tail, 0, ifxs_found, 0, nulls_have, FALSE, pAmple_in))
	bAllomorphsTried = TRUE;

return bAllomorphsTried;

} /* end get_prefix */

/***************************************************************************
 * NAME
 *    ifx_loc
 * DESCRIPTION
 *    Check the location of this proposed infix against what is allowed.
 * RETURN VALUE
 *    nonzero if okay, zero if invalid
 */
static int ifx_loc(ifxp, tail, ifxtail, what, pAmple_in)
AmpleAmlist *	ifxp;		/* pointer to infix allomorph in a list */
char *		tail;		/* pointer to rest of word */
char *		ifxtail;	/* pointer to infix's location in tail */
int		what;		/* type of morpheme being considered:
				 * AMPLE_PFX, AMPLE_ROOT, or AMPLE_SFX */
AmpleData *	pAmple_in;
{
AmpleAllomorph *ap;
AmpleInfixInfo *ip;
int             bPassed;

if ((ifxp == NULL) || (tail == NULL) || (ifxtail == NULL))
	return( 0 );
ap = ifxp->amp;
ip = ap->pINFIX;

switch (what)
	{
	case AMPLE_PFX:
	if (!(ip->iInfixLoc & AMPLE_PFX))
	  {
		reportInfixMorphForLocationFailure(what, ifxtail, ifxp, ap, ip, pAmple_in);
		reportInfixTypeFailure("prefix", pAmple_in);;
		return( 0 );
	  }
	break;
	case AMPLE_ROOT:
	if (!(ip->iInfixLoc & AMPLE_ROOT))
	  {
		reportInfixMorphForLocationFailure(what, ifxtail, ifxp, ap, ip, pAmple_in);
		reportInfixTypeFailure("root", pAmple_in);;
		return( 0 );
	  }
	break;
	case AMPLE_SFX:
	if (!(ip->iInfixLoc & AMPLE_SFX))
	  {
		reportInfixMorphForLocationFailure(what, ifxtail, ifxp, ap, ip, pAmple_in);
		reportInfixTypeFailure("suffix", pAmple_in);;
		return( 0 );
	  }
	break;
	case AMPLE_NFX:
		/* any are conceivable */
	break;
	default:
	  {
	reportInfixMorphForLocationFailure(what, ifxtail, ifxp, ap, ip, pAmple_in);
	reportInfixTypeFailure("unknown", pAmple_in);;
	return( 0 );
	  }
	}
bPassed = checkAmpleStringEnviron(tail,
				  (int)(ifxtail-tail),
				  ifxtail+ifxp->alen,
				  ip->pInfixEnv,
				  pPreviousWord_m, pNextWord_m, pAmple_in);
if (!bPassed)
{
  reportInfixMorphForLocationFailure(what, ifxtail, ifxp, ap, ip, pAmple_in);
  reportInfixEnvironmentFailure(ifxtail, ap, pAmple_in);
}
return( bPassed );

}

/***************************************************************************
 * NAME
 *    get_infix
 * DESCRIPTION
 *    Find all infixes that match near the initial part of the rest of the
 *    word.  If any infixes appear to be okay, it calls the appropriate
 *    function to try to parse the remainder of the word.
 * RETURN VALUE
 *    none
 */
static int get_infix( head, tail, roots_found, ifxs_found, nfxs_found,
			  what, what_found, nulls_have, pAmple_in)
AmpleHeadList *	head;		/* list of morphemes already analyzed
				 * (headlist) */
char *		tail;		/* remainder of word string to be parsed */
int		roots_found;	/* number of roots found in word so far */
int		ifxs_found;	/* number of infixes found in word so far */
int		nfxs_found;	/* number of interfixes found in word so far */
int		what;		/* where called from (AMPLE_PFX, AMPLE_ROOT,
				   or AMPLE_SFX) */
int		what_found;	/* number of such items already found */
int		nulls_have;	/* number of nulls we already have in this
				 * word */
AmpleData *	pAmple_in;
{
AmpleHeadList	newhead;
char *		newtail;
int		i;
AmpleAllomorph *ap;
AmpleAmlist *	ifxp;
AmpleAmlist *	ifxlist;
AmpleAmlist *	np;
int		nulls_next;	/* number of nulls we will have in the next
				 * recursive pass */
int		j;
char		c;
char *		lp;
char *		rp;
char *		ip;
char *		ifxtail;
int		bAllomorphsTried = FALSE;
int		bContinuation;
int		bOldUsesPrev;
int		bOldUsesNext;
/*
 *  if the end of the word is found, then we have an incorrect analysis.
 *  also, if no more infixes are possible, then we can't proceed either.
 */
if (*tail == NUL)
	return FALSE;
if (ifxs_found >= pAmple_in->iMaxInfixCount)
	{
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in,
			  "%sMaximum infixes found.\n",
			  szTraceTab_m);
	}
	else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	  {
	xml_maximum_reached(pAmple_in, "infixes");
	  }
	return FALSE;
	}
/*
 *  if beginning analysis, then play it safe
 */
if (head == (AmpleHeadList *)NULL)
	pAmpleLeftHead_m = pAmpleRightHead_m = (AmpleHeadList *)NULL;
/*
 *  save furthest penetration during parse
 */
if (pszDeeptail_m < tail)
	pszDeeptail_m = tail;
iTracingDepth_m++;
/*
 * for each possible location of an infix
 */
for ( ifxtail = tail; *ifxtail != NUL ; ++ifxtail )
	{
	/*
	 *	create list of all infixes whose string matches
	 *	loop for each allomorph found
	 */
	ifxlist = get_entries( ifxtail, (what == AMPLE_NFX) ? AMPLE_NFXIFX : AMPLE_IFX,
			   pAmple_in);
	if (ifxlist != NULL)
	bAllomorphsTried = TRUE;
	for (ifxp = ifxlist ; ifxp != (AmpleAmlist *)NULL ; ifxp = ifxp->amlink)
	{
	/*
	 *  check the infix location within the outside allomorph
	 */
	if (!ifx_loc(ifxp,tail,ifxtail,what, pAmple_in))
		continue;			/* altogether invalid */
	ap = ifxp->amp;
	/* pass along incoming information */
	nulls_next = nulls_have;
	/*
	 * if null morpheme...
	 */
	if (!ifxp->alen)
		{
		/* if we already have the maximum number of nulls allowed,
		   we don't want another one */
		if (nulls_have >= pAmple_in->iMaxNullCount)
		continue;
		/* make note of the fact that we are trying another null */
		nulls_next = nulls_have + 1;
		}
	/*
	 *  for each fromcategory/tocategory pair
	 */
	for ( i = 0 ; (ap->pINFIX->pFromCategories)[i] ; ++i )
		{
		if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
#ifdef EXPERIMENTAL
		a_trace((what == AMPLE_NFX) ? AMPLE_NFX : AMPLE_IFX,
			ifxtail, ifxp->alen, ap->pMORPHNAME,
			(ap->pINFIX->pFromCategories)[i],
			(ap->pINFIX->pToCategories)[i],
			ap->sPropertySet,
			ap->pINFIX->iOrderClass,
			ap->pINFIX->iOrderClassMax,
			ap->pszAllomorphID,
			ap->pPATRCAT,
			ap->pEnvironment, pAmple_in);
#else
		a_trace((what == AMPLE_NFX) ? AMPLE_NFX : AMPLE_IFX,
			ifxtail, ifxp->alen, ap->pMORPHNAME,
			(ap->pINFIX->pFromCategories)[i],
			(ap->pINFIX->pToCategories)[i],
			ap->sPropertySet,
			ap->pINFIX->iOrderClass,
			ap->pINFIX->iOrderClassMax,
			ap->pszAllomorphID,
			NULL,
			ap->pEnvironment, pAmple_in);
#endif

		newhead.iFromCategory = (ap->pINFIX->pFromCategories)[i];
		newhead.iToCategory	  = (ap->pINFIX->pToCategories)[i];
		newhead.sPropertySet.pProperties = ap->sPropertySet.pProperties;
		newhead.iOrderClass	  = ap->pINFIX->iOrderClass;
		newhead.iOrderClassMax  = ap->pINFIX->iOrderClassMax;
		newhead.pAllomorph	  = ap;
		newhead.eType	  = AMPLE_IFX;
		newhead.uiAllomorphLength = ifxp->alen;
		newhead.pLeft   = head;
		newhead.pRight   = (AmpleHeadList *)NULL;
		if (head)
		head->pRight = (AmpleHeadList *)NULL;
		/*
		 *	check for validity of infix
		 */
		bOldUsesPrev = bUsesPrevWord_m;
		bOldUsesNext = bUsesNextWord_m;
		if (performAmpleInfixTests(head, &newhead, ifxtail, ifxp->alen,
					   pAmple_in))
		{
		/*
		 *  add newhead to head and form newtail
		 */
		if (!head)
			{
			pAmpleLeftHead_m = &newhead;
			newhead.uiMorphnamesLength = strlen(ap->pMORPHNAME) + 1;
			}
		else
			{
			head->pRight = &newhead;
			newhead.uiMorphnamesLength = strlen(ap->pMORPHNAME) +
						  head->uiMorphnamesLength + 1;
			}
		newtail = tail + ifxp->alen;
		/*
		 *  shift the infix string to the beginning of the tail
		 */
		for (j = ifxp->alen, lp = tail, rp = ifxtail; j; j--)
			{
			c = *rp;
			ip = rp++;
			while (ip != lp)
			{
			*ip = *(ip - 1);
			ip--;
			}
			*lp++ = c;
			}
		sgml_trace(pAmple_in, "  <continuation>\n", TRUE);
		/*
		 *  go parse the rest of the word if you can
		 */
		switch (what)
			{
			case AMPLE_PFX:
			bContinuation = get_prefix(&newhead, newtail,
						   what_found, ifxs_found+1,
						   nulls_next, pAmple_in);
			break;
			case AMPLE_SFX:
			bContinuation = get_suffix(&newhead, newtail,
						   what_found, ifxs_found+1,
						   nulls_next, pAmple_in);
			break;
			case AMPLE_NFX:
			bContinuation = get_interfix(&newhead, newtail,
							 roots_found, ifxs_found+1,
							 what_found+1, nulls_next,
							 TRUE, pAmple_in);
			break;
			default:
			bContinuation = get_root(&newhead, newtail,
						 what_found, ifxs_found+1,
						 nfxs_found, nulls_next,
						 FALSE, pAmple_in);
			break;
			}
		if (	!bContinuation &&
			( (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML) ||
			  (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)) )
			{
			sgml_trace(pAmple_in, "    <parseNode>\n", TRUE);
			if ((newtail != NULL) && (*newtail != NUL))
			{
			char * pszStr;
#ifdef HAVE_ALLOCA
			pszStr = (char *)alloca(
					  lengthAmplePCDATA(newtail, FALSE)+1);
#else
			pszStr = (char *)allocMemory(
					  lengthAmplePCDATA(newtail, FALSE)+1);
#endif
			sgml_trace(pAmple_in, "      <leftover>", TRUE);
			storeAmplePCDATA(pszStr, newtail, FALSE);
			store_AMPLE_trace(pAmple_in, pszStr, NULL);
			if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			  sgml_trace(pAmple_in, "</leftover>\n", FALSE);
			else
			  sgml_trace(pAmple_in, "</>\n", FALSE);
#ifndef HAVE_ALLOCA
			freeMemory(pszStr);
#endif
			}
			else
			  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			sgml_trace(pAmple_in,
				   "      <endOfWord/><failure test='none'/>\n",
				   TRUE);
			else
			sgml_trace(pAmple_in,
				   "      <endOfWord><failure test=none>\n",
				   TRUE);

			sgml_trace(pAmple_in, "    </parseNode>\n", TRUE);
			}
		sgml_trace(pAmple_in, "  </continuation>\n", TRUE);
		/*
		 *  shift the infix string back to its original location, so
		 *  that we can still find all possible analyses
		 */
		for (j = ifxp->alen, --lp, --rp; j; j--)
			{
			c = *lp;
			ip = lp--;
			while (ip != rp)
			{
			*ip = *(ip + 1);
			ip++;
			}
			*rp-- = c;
			}
		} /* end of performAmpleInfixTests test */
		bUsesPrevWord_m = bOldUsesPrev;
		bUsesNextWord_m = bOldUsesNext;
		/*
		 *  a_trace() writes the <parseNode> marker
		 */
		sgml_trace(pAmple_in, "</parseNode>\n", TRUE);

		} /* end of each category pair loop */

	} /* end of each allomorph loop */
	/*
	 *	infix list exhausted, so release allocated space
	 */
	for ( ifxp = ifxlist ; ifxp ; ifxp = np )
	{
	np = ifxp->amlink;
	freeMemory( (char *)ifxp );
	}

	} /* end of loop generating all possible conceivable infixes */

iTracingDepth_m--;

return bAllomorphsTried;

} /* end get_infix */

/***************************************************************************
 * NAME
 *    get_root
 * DESCRIPTION
 *    Find all roots that match an initial part of the rest of the word.
 *    This is called recursively to find all compound roots.  When it
 *    cannot find any more roots, it calls get_infix() if appropriate, and
 *    then calls get_suffix().
 * RETURN VALUE
 *    none
 */
static int get_root( head, tail, roots_found, ifxs_found, nfxs_found,
			 nulls_have, bRootJustFound, pAmple_in)
AmpleHeadList *	head;		/* list of morphemes already analyzed
				 * (headlist) */
char *		tail;		/* remainder of word string to be parsed */
int		roots_found;	/* number of roots found in word so far */
int		ifxs_found;	/* number of infixes found in word so far */
int		nfxs_found;	/* number of interfixes found in word so far */
int		nulls_have;	/* number of nulls we already have in this
				 * word */
int		bRootJustFound;	/* found a root in this cycle of looking for
				 * roots*/
AmpleData *	pAmple_in;
{
AmpleHeadList	newhead;
char *		newtail;
int		i;
AmpleAllomorph *ap;
AmpleAmlist *	rootp;
AmpleAmlist *	rootlist;
AmpleAmlist *	np;
int		nulls_next; /* number of nulls we will have in the next
				 * recursive pass */
int		bAllomorphsTried = FALSE;
int		bContinuation;
int		bOldUsesPrev;
int		bOldUsesNext;
/*
 *  save furthest penetration during parse
 */
if (pszDeeptail_m < tail)
	pszDeeptail_m = tail;
/*
 *  if beginning analysis, then play it safe
 */
if (head == (AmpleHeadList *)NULL)
	pAmpleLeftHead_m = pAmpleRightHead_m = (AmpleHeadList *)NULL;
/*
 *  look for more roots if we have not yet found the maximum number
 */
if (roots_found >= pAmple_in->iMaxRootCount)
	{
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in,
			  "%sMaximum roots found.\n",
			  szTraceTab_m);
	}
	else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	  {
	xml_maximum_reached(pAmple_in, "roots");
	  }
	}
else
	{
	/*
	 * create a list of all roots whose string matches
	 */
	rootlist = get_entries( tail, AMPLE_ROOT, pAmple_in);
	if (rootlist != NULL)
	bAllomorphsTried = TRUE;
	iTracingDepth_m++;
	/*
	 *	for each allomorph in rootlist
	 */
	for (rootp=rootlist ; rootp!=(AmpleAmlist *)NULL ; rootp=rootp->amlink)
	{
	ap = rootp->amp;
	/* pass along incoming information */
	nulls_next = nulls_have;
	/*
	 * if null morpheme...
	 */
	if (!rootp->alen)
		{
		/* if we already have the maximum number of nulls allowed,
		   we don't want another one */
		if (nulls_have >= pAmple_in->iMaxNullCount)
		continue;
		/* make note of the fact that we are trying another null */
		nulls_next = nulls_have + 1;
		}
	/*
	 *  for each root category
	 */
	for ( i = 0 ; make_root_head(&newhead, ap, i, pAmple_in) ; ++i )
		{
		if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
#ifdef EXPERIMENTAL
		a_trace(AMPLE_ROOT, tail, rootp->alen, ap->pMORPHNAME,
			newhead.iROOTCATEG, NUL, ap->sPropertySet, 0,
			0,
			ap->pszAllomorphID, ap->pPATRCAT,
			ap->pEnvironment, pAmple_in);
#else
		a_trace(AMPLE_ROOT, tail, rootp->alen, ap->pMORPHNAME,
			newhead.iROOTCATEG, NUL, ap->sPropertySet, 0,
			0,
			ap->pszAllomorphID, NULL,
			ap->pEnvironment, pAmple_in);
#endif
		/*
		 *	finish filling out the tentative morpheme (headlist) structure
		 */
		newhead.uiAllomorphLength = rootp->alen;
		newhead.pLeft = head;
		newhead.pRight = (AmpleHeadList *)NULL;
		if (head)
		head->pRight = (AmpleHeadList *)NULL;
		/*
		 *	check for validity of this root
		 */
		bOldUsesPrev = bUsesPrevWord_m;
		bOldUsesNext = bUsesNextWord_m;
		if (performAmpleRootTests(head, &newhead, tail, rootp->alen,
					  pAmple_in))
		{
		/*
		 *  add newhead to head and form newtail
		 */
		if (!head)
			{
			pAmpleLeftHead_m = &newhead;
			pAmpleRightHead_m = (AmpleHeadList *)NULL;
			}
		else
			{
			head->pRight = &newhead;
			newhead.uiMorphnamesLength += head->uiMorphnamesLength;
			}
		newtail = tail + rootp->alen;
		sgml_trace(pAmple_in, "  <continuation>\n", TRUE);
		/*
		 *  go look for a compound root
		 */
		bContinuation = get_root(&newhead, newtail, roots_found+1,
					 ifxs_found, nfxs_found, nulls_next,
					 TRUE, pAmple_in);
		if (	!bContinuation &&
			((pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML) ||
			(pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML) ))
			{
			sgml_trace(pAmple_in, "    <parseNode>\n", TRUE);
			if ((newtail != NULL) && (*newtail != NUL))
			{
			char * pszStr;
#ifdef HAVE_ALLOCA
			pszStr = (char *)alloca(
					  lengthAmplePCDATA(newtail, FALSE)+1);
#else
			pszStr = (char *)allocMemory(
					  lengthAmplePCDATA(newtail, FALSE)+1);
#endif
			sgml_trace(pAmple_in, "      <leftover>", TRUE);
			storeAmplePCDATA(pszStr, newtail, FALSE);
			store_AMPLE_trace(pAmple_in, pszStr, NULL);
			if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			  sgml_trace(pAmple_in, "</leftover>\n", FALSE);
			else
			  sgml_trace(pAmple_in, "</>\n", FALSE);
#ifndef HAVE_ALLOCA
			freeMemory(pszStr);
#endif
			}
			else
			  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			sgml_trace(pAmple_in,
				   "      <endOfWord/><failure test='none'/>\n",
				   TRUE);
			else
			sgml_trace(pAmple_in,
				   "      <endOfWord><failure test=none>\n",
				   TRUE);
			sgml_trace(pAmple_in, "    </parseNode>\n", TRUE);
			}
		sgml_trace(pAmple_in, "  </continuation>\n", TRUE);

		} /* end of performAmpleRootTests test */
		bUsesPrevWord_m = bOldUsesPrev;
		bUsesNextWord_m = bOldUsesNext;
		/*
		 *  a_trace() writes the <parseNode> marker
		 */
		sgml_trace(pAmple_in, "</parseNode>\n", TRUE);

		} /* end of root category loop */

	} /* end of each allomorph loop */
	/*
	 *	root list exhausted, so release any allocated space
	 */
	for ( rootp = rootlist ; rootp != (AmpleAmlist *)NULL ; rootp = np )
	{
	np = rootp->amlink;
	freeMemory( rootp->amp->pMORPHNAME );
	freeMemory( (char *)rootp->amp->pMorpheme );
	freeMemory( (char *)rootp->amp );
	freeMemory( (char *)rootp );
	}
	iTracingDepth_m--;
	if (rootlist != (AmpleAmlist *)NULL)
	bRootFound_m = TRUE;	  /* have found a root form, even if invalid */

	else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in, "%sNo more roots found.\n", szTraceTab_m);
	}
	/*
	 *	Having processed all roots beginning with tail, now go look for all
	 *  infixes near tail which are hidden inside a root.  But, don't try to
	 *  get infixes from non-initial members of compound roots.
	 */
	if (    (ifxs_found < pAmple_in->iMaxInfixCount) &&
		(pAmple_in->iInfixLocations & AMPLE_ROOT) &&
		(roots_found == 0) &&
		get_infix( head, tail, roots_found, ifxs_found, nfxs_found,
			   AMPLE_ROOT, roots_found, nulls_have, pAmple_in) )
	bAllomorphsTried = TRUE;

	/*
	 *  having processed all roots & infixes beginning with tail, now go look
	 *  for interfixes beginning with tail (but only if we have a root...)
	 */
	if (roots_found &&
	get_interfix( head, tail, roots_found, ifxs_found, nfxs_found,
			  nulls_have, FALSE, pAmple_in))
	  bAllomorphsTried = TRUE;
	} /* end of test for more roots possible */
/*
 *  having processed all roots & infixes beginning with tail, now go look
 *  for suffixes beginning with tail (but only if we have a root...)
 */
if (	bRootJustFound &&
	roots_found &&
	get_suffix( head, tail, 0, ifxs_found, nulls_have, pAmple_in))
	bAllomorphsTried = TRUE;

return bAllomorphsTried;
} /* end get_root */

/***************************************************************************
 * NAME
 *    get_interfix
 * DESCRIPTION
 *    Find all interfixes that match an initial part of the rest of the word.
 *    This function is called recursively to find all such interfixes.  When
 *    it cannot find any more interfixes, it calls get_root().
 * RETURN VALUE
 *    TRUE if one or more interfix allomorphs tried, otherwise FALSE
 */
static int get_interfix( head, tail, roots_found, ifxs_found, nfxs_found,
			 nulls_have, bInterfixJustFound, pAmple_in)
AmpleHeadList *	head;		/* list of morphemes already analyzed
				 * (headlist) */
char *		tail;		/* remainder of word string to be parsed */
int		roots_found;	/* number of roots found in word so far */
int		ifxs_found;	/* number of infixes found in word so far */
int		nfxs_found;	/* number of interfixes found in word so far */
int		nulls_have;	/* number of nulls we already have in this
				 * word */
int		bInterfixJustFound;	/* found an interfix in this cycle of
					 * looking for interfixes */
AmpleData *	pAmple_in;
{
AmpleHeadList	newhead;
char *		newtail;
int		i;
AmpleAllomorph *ap;
AmpleAmlist *	nfxp;
AmpleAmlist *	nfxlist;
AmpleAmlist *	np;
int		nulls_next;	/* number of nulls we will have in the next
				 * recursive pass */
int		bAllomorphsTried = FALSE;
int		bContinuation;
int		bOldUsesPrev;
int		bOldUsesNext;
/*
 *  save furthest penetration during parse
 */
if (pszDeeptail_m < tail)
	pszDeeptail_m = tail;
/*
 *  if beginning analysis, then play it safe (should never happen, though)
 */
if (head == (AmpleHeadList *)NULL)
	pAmpleLeftHead_m = pAmpleRightHead_m = (AmpleHeadList *)NULL;
/*
 *  look for more interfixes if we have not yet found the maximum number
 */
if (nfxs_found > pAmple_in->iMaxInterfixCount)
	{
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in,
			  "%sMaximum interfixes found.\n",
			  szTraceTab_m);
	}
	else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	  {
	xml_maximum_reached(pAmple_in, "interfixes");
	  }
	return FALSE;
	}
else
	{
	iTracingDepth_m++;
	/*
	 *	create list of all interfixes whose string matches
	 */
	nfxlist = get_entries( tail, AMPLE_NFX, pAmple_in);
	if (nfxlist != NULL)
	bAllomorphsTried = TRUE;
	/*
	 *	for each allomorph in nfxlist
	 */
	for (nfxp = nfxlist ; nfxp != (AmpleAmlist *)NULL ; nfxp = nfxp->amlink)
	{
	ap = nfxp->amp;
	/* pass along incoming information */
	nulls_next = nulls_have;
	/*
	 * if null morpheme...
	 */
	if (!nfxp->alen)
		{
		/* if we already have the maximum number of nulls allowed,
		   we don't want another one */
		if (nulls_have >= pAmple_in->iMaxNullCount)
		continue;
		/* make note of the fact that we are trying another null */
		nulls_next = nulls_have + 1;
		}
	/*
	 *  for each fromcategory/tocategory pair
	 */
	for ( i = 0 ; (ap->pAFFIX->pFromCategories)[i] ; ++i )
		{
		if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
#ifdef EXPERIMENTAL
		a_trace(AMPLE_NFX, tail, nfxp->alen, ap->pMORPHNAME,
			(ap->pAFFIX->pFromCategories)[i],
			(ap->pAFFIX->pToCategories)[i],
			ap->sPropertySet,
			ap->pAFFIX->iOrderClass,
			ap->pAFFIX->iOrderClassMax,
			ap->pszAllomorphID,
			ap->pPATRCAT,
			ap->pEnvironment, pAmple_in);
#else
		a_trace(AMPLE_NFX, tail, nfxp->alen, ap->pMORPHNAME,
			(ap->pAFFIX->pFromCategories)[i],
			(ap->pAFFIX->pToCategories)[i],
			ap->sPropertySet,
			ap->pAFFIX->iOrderClass,
			ap->pAFFIX->iOrderClassMax,
			ap->pszAllomorphID,
			NULL,
			ap->pEnvironment, pAmple_in);
#endif
		/*
		 *	build a tentative morpheme (headlist) structure
		 */
		newhead.iFromCategory = (ap->pAFFIX->pFromCategories)[i];
		newhead.iToCategory	  = (ap->pAFFIX->pToCategories)[i];
		newhead.sPropertySet.pProperties = ap->sPropertySet.pProperties;
		newhead.iOrderClass	  = ap->pAFFIX->iOrderClass;
		newhead.iOrderClassMax  = ap->pAFFIX->iOrderClassMax;
		newhead.pAllomorph	  = ap;
		newhead.eType	  = ap->iMORPHTYPE;
		newhead.uiAllomorphLength = nfxp->alen;
		newhead.pLeft    = head;
		newhead.pRight    = (AmpleHeadList *)NULL;
		if (head)
		head->pRight = (AmpleHeadList *)NULL;
		/*
		 *	check for validity of this interfix
		 */
		bOldUsesPrev = bUsesPrevWord_m;
		bOldUsesNext = bUsesNextWord_m;
		if (performAmpleInterfixTests(head, &newhead, tail, nfxp->alen,
					pAmple_in))
		{
		/*
		 *  add newhead to head and form newtail
		 */
		if (!head)
			{
			pAmpleLeftHead_m = &newhead;
			newhead.uiMorphnamesLength = strlen(ap->pMORPHNAME) + 1;
			}
		else
			{
			head->pRight = &newhead;
			newhead.uiMorphnamesLength = strlen(ap->pMORPHNAME) +
						  head->uiMorphnamesLength + 1;
			}
		newtail = tail + nfxp->alen;

		sgml_trace(pAmple_in, "  <continuation>\n", TRUE);
		/*
		 *  go find next interfix
		 */
		bContinuation = get_interfix( &newhead, newtail, roots_found,
						  ifxs_found, nfxs_found+1,
						  nulls_next, TRUE, pAmple_in);

		if (	!bContinuation &&
			( (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML) ||
			  (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)) )
			{
			sgml_trace(pAmple_in, "    <parseNode>\n", TRUE);
			if ((newtail != NULL) && (*newtail != NUL))
			{
			char * pszStr;
#ifdef HAVE_ALLOCA
			pszStr = (char *)alloca(
					  lengthAmplePCDATA(newtail, FALSE)+1);
#else
			pszStr = (char *)allocMemory(
					  lengthAmplePCDATA(newtail, FALSE)+1);
#endif
			sgml_trace(pAmple_in, "      <leftover>", TRUE);
			storeAmplePCDATA(pszStr, newtail, FALSE);
			store_AMPLE_trace(pAmple_in, pszStr, NULL);
			if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			  sgml_trace(pAmple_in, "</leftover>\n", FALSE);
			else
			  sgml_trace(pAmple_in, "</>\n", FALSE);
#ifndef HAVE_ALLOCA
			freeMemory(pszStr);
#endif
			}
			else
			  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			sgml_trace(pAmple_in,
				   "      <endOfWord/><failure test='none'/>\n",
				   TRUE);
			  else
			sgml_trace(pAmple_in,
				   "      <endOfWord><failure test=none>\n",
				   TRUE);
			sgml_trace(pAmple_in, "    </parseNode>\n", TRUE);
			}
		sgml_trace(pAmple_in, "  </continuation>\n", TRUE);

		} /* end of performAmpleInterfixTests test */
		bUsesPrevWord_m = bOldUsesPrev;
		bUsesNextWord_m = bOldUsesNext;
		/*
		 *  a_trace() writes the <parseNode> marker
		 */
		sgml_trace(pAmple_in, "</parseNode>\n", TRUE);

		} /* end of each category pair loop */
	} /* end of each allomorph loop */
	/*
	 *	interfix list exhausted, so release any allocated space
	 */
	for ( nfxp = nfxlist ; nfxp ; nfxp = np )
	{
	np = nfxp->amlink;
	freeMemory( (char *)nfxp );
	}
	iTracingDepth_m--;

	if (    (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON) &&
		(nfxlist == (AmpleAmlist *)NULL) )
	{
	store_AMPLE_trace(pAmple_in, "%sNo more interfixes found.\n",
			  szTraceTab_m);
	}
	/*
	 *	having processed all interfixes beginning with tail, now go look
	 *	for all infixes near tail which are hidden inside a following item
	 */
	if (    (ifxs_found < pAmple_in->iMaxInfixCount) &&
		/* any will do (pAmple_in->iInfixLocations & AMPLE_NFX) && */
		get_infix( head, tail, roots_found, ifxs_found, nfxs_found,
			   AMPLE_NFX, nfxs_found, nulls_have, pAmple_in) )
	bAllomorphsTried = TRUE;
	} /* end of more interfixes allowed test */
/*
 *  having processed all interfixes & infixes beginning with tail, now go look
 *  for all roots beginning with tail
 */
if (bInterfixJustFound &&
	nfxs_found &&
	get_root( head, tail, roots_found, ifxs_found, nfxs_found, nulls_have,
		  FALSE, pAmple_in))
	bAllomorphsTried = TRUE;

return bAllomorphsTried;

} /* end get_interfix */


/***************************************************************************
 * NAME
 *    dup_am
 * DESCRIPTION
 *    Duplicate an allomorph structure for get_suffix() below.
 *    PLEASE examine this routine carefully before using it elsewhere to be
 *    sure it does what you want!
 * RETURN VALUE
 *    pointer to newly allocated allomorph structure
 */
static AmpleAllomorph * dup_am(ap)
AmpleAllomorph *	ap;	/* pointer to allomorph structure */
{
AmpleAllomorph *	np;

np = (AmpleAllomorph *) allocMemory( sizeof(AmpleAllomorph));
*np = *ap;	/* struct copy */
np->pMorpheme  = (AmpleMorpheme *) allocMemory( sizeof(AmpleMorpheme));
*np->pMorpheme = *ap->pMorpheme;	/* struct copy */
if (ap->pMORPHNAME != NULL)
	np->pMORPHNAME = duplicateString( ap->pMORPHNAME );

return(np);
}

/*****************************************************************************
 * NAME
 *    same_string
 * DESCRIPTION
 *    compare the two strings if necessary
 * RETURN VALUE
 *    TRUE if the strings are equal, FALSE if they differ
 */
static int same_string( pszFirst_in, pszSecond_in, bCheck_in )
char *	pszFirst_in;
char *	pszSecond_in;
int	bCheck_in;
{
if (bCheck_in)
	{
	if ((pszFirst_in == NULL) && (pszSecond_in == NULL))
	return TRUE;
	if ((pszFirst_in == NULL) || (pszSecond_in == NULL))
	return FALSE;
	if (strcmp(pszFirst_in, pszSecond_in) == 0)
	return TRUE;
	else
	return FALSE;
	}
return TRUE;
}

/*****************************************************************************
 * NAME
 *    find_result
 * DESCRIPTION
 *    check whether this analysis has already been stored for this word
 * RETURN VALUE
 *    0 if the analysis has not been stored, the 1-based index into the lists
 *    otherwise
 */
static int find_result( pWord_in, pszAnal_in, pszDecomp_in, pszCat_in,
			pszProp_in, pszFeatD_in, pszUnderF_in, pAmple_in)
WordTemplate *	pWord_in;
char *		pszAnal_in;
char *		pszDecomp_in;
char *		pszCat_in;
char *		pszProp_in;
char *		pszFeatD_in;
char *		pszUnderF_in;
AmpleData *	pAmple_in;
{
WordAnalysis *	pAnal;
int		iIndex = 1;

if ((pWord_in == NULL) || (pWord_in->pAnalyses == NULL))
	return 0;
for ( pAnal = pWord_in->pAnalyses ; pAnal ; pAnal = pAnal->pNext, ++iIndex )
	{
	if (    same_string(pAnal->pszAnalysis,	  pszAnal_in, TRUE)         &&
		same_string(pAnal->pszDecomposition,  pszDecomp_in,
			pAmple_in->iOutputFlags & WANT_DECOMPOSITION)   &&
		same_string(pAnal->pszCategory,	  pszCat_in,
			pAmple_in->eWriteCategory != AMPLE_NO_CATEGORY) &&
		same_string(pAnal->pszProperties,	  pszProp_in,
			pAmple_in->iOutputFlags & WANT_PROPERTIES)      &&
		same_string(pAnal->pszFeatures,	  pszFeatD_in,
			pAmple_in->iOutputFlags & WANT_FEATURES)        &&
		same_string(pAnal->pszUnderlyingForm, pszUnderF_in,
			pAmple_in->iOutputFlags & WANT_UNDERLYING) )
	return iIndex;
	}
return 0;
}

/***************************************************************************
 * NAME
 *    get_suffix
 * DESCRIPTION
 *    Find all suffixes that match an initial part of the rest of the word.
 *    This function is called recursively to exhaust the word.	When no
 *    more suffixes can be found, it calls get_infix() if appropriate.
 * RETURN VALUE
 *    none
 */
static int get_suffix( head, tail, sfxs_found, ifxs_found, nulls_have,
			pAmple_in)
AmpleHeadList *	head;		/* list of morphemes already analyzed
				 * (headlist) */
char *		tail;		/* remainder of word string to be parsed */
int		sfxs_found;	/* number of suffixes found thus far */
int		ifxs_found;	/* number of infixes found thus far */
int		nulls_have;	/* number of nulls we already have in this
				 * word */
AmpleData *	pAmple_in;
{
AmpleHeadList		newhead;
AmpleHeadList *		tmp_hdlist;
AmpleHeadList *		thp;
AmpleHeadList *		hp;
AmpleHeadList *		last_thp;
AmpleHeadlistList *	tmp_hlalist;
char *			newtail;
char *			astr;
int			i;
AmpleAllomorph *	ap;
AmpleAmlist *		sfxp;
AmpleAmlist *		sfxlist = NULL;
AmpleAmlist *		np;
int			nulls_next;	/* number of nulls we will have in the
					 * next recursive pass */
WordAnalysis *		pNewAnal;
int			bAllomorphsTried = FALSE;
int			bContinuation;
#ifdef EXPERIMENTAL
PATREdgeList *		pWordParse;
AmpleParseList *	pNewParse;
#endif /* EXPERIMENTAL */
int		bOldUsesPrev;
int		bOldUsesNext;
int             bAllAllosAreNull = FALSE;

/*
 *  check for going too far
 */
if (sfxs_found > pAmple_in->iMaxSuffixCount)
	{
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in,
			  "%sMaximum suffixes found, word not used up.\n",
			  szTraceTab_m);
	}
	return FALSE;
	}
/*
 *  save furthest penetration during parse
 */
if (pszDeeptail_m < tail)
	pszDeeptail_m = tail;
/*
 *  look for more suffixes if we have not yet found the maximum number
 */
if (sfxs_found < pAmple_in->iMaxSuffixCount)
	{
	/*
	 *	create list of all suffixes whose string matches
	 */
	sfxlist = get_entries( tail, AMPLE_SFX, pAmple_in);
	if (sfxlist != NULL)
	bAllomorphsTried = TRUE;
	iTracingDepth_m++;
	/*
	 *	for each allomorph in sfxlist
	 */
	for (sfxp = sfxlist ; sfxp != (AmpleAmlist *)NULL ; sfxp = sfxp->amlink)
	{
	ap = sfxp->amp;
	/* pass along incoming information */
	nulls_next = nulls_have;
	/*
	 * if null morpheme...
	 */
	if (!sfxp->alen)
		{
		/* if we already have the maximum number of nulls allowed,
		   we don't want another one */
		if (nulls_have >= pAmple_in->iMaxNullCount)
		continue;
		/* make note of the fact that we are trying another null */
		nulls_next = nulls_have + 1;
		}
	/*
	 *  for each fromcategory/tocategory pair
	 */
	for ( i = 0 ; (ap->pAFFIX->pFromCategories)[i] ; ++i )
		{
		if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
#ifdef EXPERIMENTAL
		a_trace(AMPLE_SFX, tail, sfxp->alen, ap->pMORPHNAME,
			(ap->pAFFIX->pFromCategories)[i],
			(ap->pAFFIX->pToCategories)[i],
			ap->sPropertySet,
			ap->pAFFIX->iOrderClass,
			ap->pAFFIX->iOrderClassMax,
			ap->pszAllomorphID,
			ap->pPATRCAT,
			ap->pEnvironment, pAmple_in);
#else
		a_trace(AMPLE_SFX, tail, sfxp->alen, ap->pMORPHNAME,
			(ap->pAFFIX->pFromCategories)[i],
			(ap->pAFFIX->pToCategories)[i],
			ap->sPropertySet,
			ap->pAFFIX->iOrderClass,
			ap->pAFFIX->iOrderClassMax,
			ap->pszAllomorphID,
			NULL,
			ap->pEnvironment, pAmple_in);
#endif
		/*
		 *	build a tentative morpheme (headlist) structure
		 */
		newhead.iFromCategory = (ap->pAFFIX->pFromCategories)[i];
		newhead.iToCategory	  = (ap->pAFFIX->pToCategories)[i];
		newhead.sPropertySet.pProperties = ap->sPropertySet.pProperties;
		newhead.iOrderClass	  = ap->pAFFIX->iOrderClass;
#ifndef hab360
		newhead.iOrderClassMax = ap->pAFFIX->iOrderClassMax;
#endif
		newhead.pAllomorph	  = ap;
		newhead.eType	  = AMPLE_SFX;
		newhead.uiAllomorphLength = sfxp->alen;
		newhead.pLeft    = head;
		newhead.pRight    = (AmpleHeadList *)NULL;
		if (head)
		head->pRight = (AmpleHeadList *)NULL;
		/*
		 *	check for validity of this suffix
		 */
		bOldUsesPrev = bUsesPrevWord_m;
		bOldUsesNext = bUsesNextWord_m;
		if (performAmpleSuffixTests(head, &newhead, tail, sfxp->alen,
					pAmple_in))
		{
		/*
		 *  add newhead to head and form newtail
		 */
		if (head)		/* (this check shows paranoia) */
			head->pRight = &newhead;
		newtail = tail + sfxp->alen;
		sgml_trace(pAmple_in, "  <continuation>\n", TRUE);
		/*
		 *  go find next suffix
		 */
		bContinuation = get_suffix( &newhead, newtail, sfxs_found+1,
						ifxs_found, nulls_next,
						pAmple_in);

		if (    !bContinuation &&
			sfxs_found+1 < pAmple_in->iMaxSuffixCount &&
			( (pAmple_in->eTraceAnalysis==AMPLE_TRACE_SGML) ||
			  (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML) ))
			{
			sgml_trace(pAmple_in, "    <parseNode>\n", TRUE);
			if ((newtail != NULL) && (*newtail != NUL))
			{
			char * pszStr;
#ifdef HAVE_ALLOCA
			pszStr = (char *)alloca(
					  lengthAmplePCDATA(newtail, FALSE)+1);
#else
			pszStr = (char *)allocMemory(
					  lengthAmplePCDATA(newtail, FALSE)+1);
#endif
			sgml_trace(pAmple_in, "      <leftover>", TRUE);
			storeAmplePCDATA(pszStr, newtail, FALSE);
			store_AMPLE_trace(pAmple_in, pszStr, NULL);
			if (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML)
			  sgml_trace(pAmple_in, "</leftover>\n", FALSE);
			else
			  sgml_trace(pAmple_in, "</>\n", FALSE);
#ifndef HAVE_ALLOCA
			freeMemory(pszStr);
#endif
			}
			else
			  if (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML)
			sgml_trace(pAmple_in,
				   "      <endOfWord/><failure test='none'/>\n",
				   TRUE);
			  else
			sgml_trace(pAmple_in,
				   "      <endOfWord><failure test=none>\n",
				   TRUE);
			sgml_trace(pAmple_in, "    </parseNode>\n", TRUE);
			}
		sgml_trace(pAmple_in, "  </continuation>\n", TRUE);

		} /* end of performAmpleSuffixTests test */
		bUsesPrevWord_m = bOldUsesPrev;
		bUsesNextWord_m = bOldUsesNext;
		/*
		 *  a_trace() writes the <parseNode> marker
		 */
		sgml_trace(pAmple_in, "</parseNode>\n", TRUE);

		} /* end of each category pair loop */

	} /* end of each allomorph loop */
	/*
	 *	suffix list exhausted, so release any allocated space
	 * Also check for special case of all nulls
	 */
	bAllAllosAreNull = TRUE; /* be optimistic */
	for ( sfxp = sfxlist ; sfxp != (AmpleAmlist *)NULL ; sfxp = np )
	{
	if (strlen(sfxp->amp->pszAllomorph) != 0)
	  bAllAllosAreNull = FALSE;
	np = sfxp->amlink;
	freeMemory( (char *)sfxp );
	}
	iTracingDepth_m--;

	if (    (sfxlist == NULL) &&
		(pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON) )
	{
	store_AMPLE_trace(pAmple_in, "%sNo more suffixes found.\n",
			  szTraceTab_m);
	}
	/*
	 *	having processed all suffixes beginning with tail, now go look
	 *	for all infixes near tail which are hidden inside a suffix
	 */
	if (    (ifxs_found < pAmple_in->iMaxInfixCount) &&
		(pAmple_in->iInfixLocations & AMPLE_SFX) &&
		get_infix( head, tail, 0 /* don't care about root count now */,
			   ifxs_found, 0, AMPLE_SFX, sfxs_found,
			   nulls_have, pAmple_in) )
	bAllomorphsTried = TRUE;

	} /* end of test for more suffixes allowed */

/*==========================================================================
 *  if we reach here at the end of a word, we just might have a good parse!
 */
if (*tail == NUL)
	{
	++bAllomorphsTried;		/* not really, but true for our purposes */
	pAmpleRightHead_m = head;		/* now we know where the word ends */
	/*
	 *  guarantee that head is now the last element in the list (otherwise with
	 *  a null form, form_anal() will produce extra morphnames
	 */
	head->pRight = (AmpleHeadList *)NULL;
	/* build the fancy strings */
	astr = form_anal(pAmpleLeftHead_m, pAmple_in);
	if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
	{
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
		{
		store_AMPLE_trace(pAmple_in,
				  "%sEnd of word found; checking final tests\n",
				  szTraceTab_m);
		store_AMPLE_trace(pAmple_in, szTraceTab_m, NULL);
		store_AMPLE_trace(pAmple_in, "    Analysis:\t       %s\n", astr);
		if (pAmple_in->iOutputFlags & WANT_DECOMPOSITION)
		{
		store_AMPLE_trace(pAmple_in, szTraceTab_m, NULL);
		store_AMPLE_trace(pAmple_in, "    Decomposition:\t%s\n",
				  pszDecomposition_m);
		}
		if (pAmple_in->eWriteCategory != AMPLE_NO_CATEGORY)
		{
		store_AMPLE_trace(pAmple_in, szTraceTab_m, NULL);
		store_AMPLE_trace(pAmple_in, "    Category:\t%s\n",
				  pszCategory_m);
		}
		if (pAmple_in->iOutputFlags & WANT_PROPERTIES)
		{
		store_AMPLE_trace(pAmple_in, szTraceTab_m, NULL);
		store_AMPLE_trace(pAmple_in, "    Properties:\t%s\n",
				  pszProperties_m); /* 1.9zc ALB */
		}
		if (pAmple_in->iOutputFlags & WANT_FEATURES)
		{
		store_AMPLE_trace(pAmple_in, szTraceTab_m, NULL);
		store_AMPLE_trace(pAmple_in, "    Features:\t%s\n",
				  pszFeatures_m);
		}
		if (pAmple_in->iOutputFlags & WANT_UNDERLYING)
		{
		store_AMPLE_trace(pAmple_in, szTraceTab_m, NULL);
		store_AMPLE_trace(pAmple_in, "    Underlying Form:\t%s\n",
				  pszUnderlying_m);
		}
		}
	else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		 pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		{
		char * pszIndent;
#ifdef HAVE_ALLOCA
		pszIndent = (char *)alloca((2*iTracingDepth_m+1)*sizeof(char));
#else
		pszIndent = (char *)allocMemory(
					   (2*iTracingDepth_m+1)*sizeof(char));
#endif
		sprintf(pszIndent, "%*s", 2*iTracingDepth_m, "");
		store_AMPLE_trace(pAmple_in, "  %s<parseNode>\n", pszIndent);
		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		  store_AMPLE_trace(pAmple_in, "    %s<endOfWord/>", pszIndent);
		else
		  store_AMPLE_trace(pAmple_in, "    %s<endOfWord>", pszIndent);
#ifndef HAVE_ALLOCA
		freeMemory(pszIndent);
#endif
		}
	}
	bOldUsesPrev = bUsesPrevWord_m;
	bOldUsesNext = bUsesNextWord_m;
	if (performAmpleFinalTests(head, pAmple_in))
	{				/* analysis successfully completed */
#ifndef EXPERIMENTAL
	/* can now report success for regular AMPLE; XAMPLE has to wait */
	sgml_trace_success(pAmple_in);
#endif /* EXPERIMENTAL */

	if (!find_result(pCurrentWord_m->pTemplate,
			 astr, pszDecomposition_m, pszCategory_m,
			 pszProperties_m, pszFeatures_m, pszUnderlying_m,
			 pAmple_in))
		{
#ifdef EXPERIMENTAL
		/*
		 *  a unique analysis, so try PATR parse (if applicable)
		 */
		if (perform_word_parse(head, pAmple_in, &pWordParse))
		{
		/* can now report success for XAMPLE */
		sgml_trace_success(pAmple_in);

#endif /* EXPERIMENTAL */
		++uiAmbigCount_m;
		pNewAnal = (WordAnalysis *)allocMemory(sizeof(WordAnalysis));
		pNewAnal->pNext = pCurrentWord_m->pTemplate->pAnalyses;
		pCurrentWord_m->pTemplate->pAnalyses = pNewAnal;

		pNewAnal->pszAnalysis = astr ? astr : duplicateString("");
		if (pAmple_in->iOutputFlags & WANT_DECOMPOSITION)
			pNewAnal->pszDecomposition = pszDecomposition_m ?
							   pszDecomposition_m :
							   duplicateString("");
		if (pAmple_in->eWriteCategory != AMPLE_NO_CATEGORY)
			pNewAnal->pszCategory      = pszCategory_m ?
							   pszCategory_m :
							   duplicateString("");
		if (pAmple_in->iOutputFlags & WANT_PROPERTIES)  /* 1.9zc ALB */
			pNewAnal->pszProperties    = pszProperties_m ?
							   pszProperties_m :
							   duplicateString("");
		if (pAmple_in->iOutputFlags & WANT_FEATURES)
			pNewAnal->pszFeatures      = pszFeatures_m ?
							   pszFeatures_m :
							   duplicateString("");
		if (pAmple_in->iOutputFlags & WANT_UNDERLYING)
			pNewAnal->pszUnderlyingForm = pszUnderlying_m ?
							   pszUnderlying_m :
							   duplicateString("");
		pNewAnal->pszSurfaceForm = duplicateString(pszSurfaceForm_m);
		/*
		 *  add headlist to the list of ambiguities for this word
		 */
		tmp_hdlist = last_thp = (AmpleHeadList *)NULL;
		for ( hp = pAmpleLeftHead_m ; hp ; hp = hp->pRight )
			{
			thp = (AmpleHeadList *)allocMemory(sizeof(AmpleHeadList));
			if (last_thp)
			last_thp->pRight = thp;
			else
			tmp_hdlist = thp;
			thp->pLeft             = last_thp;
			thp->iFromCategory     = hp->iFromCategory;
			thp->iToCategory       = hp->iToCategory;
			thp->sPropertySet.pProperties =
						  hp->sPropertySet.pProperties;
			thp->iOrderClass       = hp->iOrderClass;
#ifndef hab360
			thp->iOrderClassMax    = hp->iOrderClassMax;
#endif
						/* 1.9r BJY make duplicate */
			thp->pAllomorph        = dup_am(hp->pAllomorph);
			thp->eType	           = hp->eType;
			thp->uiAllomorphLength = hp->uiAllomorphLength;
			last_thp = thp;
			}
		last_thp->pRight = (AmpleHeadList *)NULL;
		tmp_hlalist = (AmpleHeadlistList *)allocMemory(
							sizeof(AmpleHeadlistList));
		tmp_hlalist->pHeadList = tmp_hdlist;

		tmp_hlalist->bUsesPrevWord = bUsesPrevWord_m;
		tmp_hlalist->bUsesNextWord = bUsesNextWord_m;
		tmp_hlalist->pszSurface    = duplicateString(pszSurfaceForm_m);
		tmp_hlalist->pNext = pCurrentWord_m->pHeadlists;
		pCurrentWord_m->pHeadlists = tmp_hlalist;
#ifdef EXPERIMENTAL
		/*
		 *  store the PATR parse (if there is one)
		 */
		pNewParse = (AmpleParseList *)
					   allocMemory(sizeof(AmpleParseList));
		pNewParse->pParse       = pWordParse;
		pNewParse->pNext        = pCurrentWord_m->pParses;
		pCurrentWord_m->pParses = pNewParse;
		}
		else
		{
		goto free_unneeded;
		}
#endif /* EXPERIMENTAL */
		}
	else
		{
#ifdef EXPERIMENTAL
		if (pAmple_in->sPATR.pGrammar != NULL)
		pAmple_in->uiPATRSkipCount++;
		/* can now report success for XAMPLE */
		sgml_trace_success(pAmple_in);
#endif /* EXPERIMENTAL */
		goto free_unneeded;
		}
	}
	else
	{		/* free space created by form_anal if tests failed */
free_unneeded:
		freeMemory( astr );
	if (pAmple_in->iOutputFlags & WANT_DECOMPOSITION)
		freeMemory( pszDecomposition_m );
	if (pAmple_in->eWriteCategory != AMPLE_NO_CATEGORY)
		freeMemory( pszCategory_m );
	if (pAmple_in->iOutputFlags & WANT_PROPERTIES)
		freeMemory( pszProperties_m ); /* 1.9zc ALB */
	if (pAmple_in->iOutputFlags & WANT_FEATURES)
		freeMemory( pszFeatures_m );
	if (pAmple_in->iOutputFlags & WANT_UNDERLYING)
		freeMemory( pszUnderlying_m );
	} /* end if performAmpleFinalTests() */
	bUsesPrevWord_m = bOldUsesPrev;
	bUsesNextWord_m = bOldUsesNext;
	/*
	 *	we no longer know the final morpheme of the word, even hypothetically
	 */
	pAmpleRightHead_m = (AmpleHeadList *)NULL;
	} /* end of (*tail == NUL) test */
else			/* Else (not at end of word) */
	{
	if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
	{
	/*
	 *  If we exceeded max suffixes, give trace message
	 */
		if (sfxs_found == pAmple_in->iMaxSuffixCount)
		{

		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
		  {
		store_AMPLE_trace(pAmple_in,
				  "%sMaximum suffixes found, word not used up.\n",
				  szTraceTab_m);
		  }
		else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		  {
		xml_maximum_reached(pAmple_in, "suffixes");
		  }
		}
	/*
	 *  if nothing more matches, give trace message
	 */
	else if (	(!bAllomorphsTried || bAllAllosAreNull) &&
		((pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML) ||
		 (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML) ))
		{
		char * pszIndent;
#ifdef HAVE_ALLOCA
		pszIndent = (char *)alloca((2*iTracingDepth_m+1)*sizeof(char));
#else
		pszIndent = (char *)allocMemory(
					   (2*iTracingDepth_m+1)*sizeof(char));
#endif
		sprintf(pszIndent, "%*s", 2*iTracingDepth_m, "");
		store_AMPLE_trace(pAmple_in, "  %s<parseNode>\n", pszIndent);
		if ((tail != NULL) && (*tail != NUL))
		{
		char * pszStr;
#ifdef HAVE_ALLOCA
		pszStr = (char *)alloca(lengthAmplePCDATA(tail, FALSE)+1);
#else
		pszStr = (char *)allocMemory(lengthAmplePCDATA(tail, FALSE)+1);
#endif
		store_AMPLE_trace(pAmple_in, "    %s<leftover>", pszIndent);
		storeAmplePCDATA(pszStr, tail, FALSE);
		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		  store_AMPLE_trace(pAmple_in, "%s</leftover>\n", pszStr);
		else
		  store_AMPLE_trace(pAmple_in, "%s</>\n", pszStr);
#ifndef HAVE_ALLOCA
		freeMemory(pszStr);
#endif
		}
		else
		  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		store_AMPLE_trace(pAmple_in,
				  "  <endOfWord/><failure test='none'/>\n", NULL);
		  else
		store_AMPLE_trace(pAmple_in,
				  "  <endOfWord><failure test=none>\n", NULL);
		store_AMPLE_trace(pAmple_in, "  %s</parseNode>\n", pszIndent);
#ifndef HAVE_ALLOCA
		freeMemory(pszIndent);
#endif
		}
	}
	}

return bAllomorphsTried;
} /* end get_suffix */

/*****************************************************************************
 * NAME
 *    a_trace
 * DESCRIPTION
 *    Output to the log file information about the current morpheme
 *    being tried in the parsing process.
 * RETURN VALUE
 *    none
 */
static void a_trace( dtype, tail, tlen, m_name, fcat, tcat, props, ordercl,
			 orderclMax, pszAllomorphID_in, pszPATRCat_in,
			 ac_ptr, pAmple_in)
int		dtype;		/* type of dictionary entry (pfx, root, sfx) */
char *		tail;		/* remainder of word string to be parsed */
int		tlen;		/* length of tail */
char *		m_name;		/* morphname */
unsigned	fcat;		/* from category of affix, root category */
unsigned	tcat;		/* to category of affix */
PropertySet_t	props;		/* allomorph and morpheme properties */
int		ordercl;	/* orderclass */
int		orderclMax;	/* orderclassMax */
char *		pszAllomorphID_in;	/* allomorph indentifier */
char *          pszPATRCat_in;	/* PATR grammar category */
AmpleAlloEnv *	ac_ptr;		/* allomorph environment conditions pointer */
AmpleData *	pAmple_in;
{
char	szAllo[BUFSIZE];
char *	pszType;
char *	pszIndent;

if ((pAmple_in->pszTrace == NULL) && (pAmple_in->pLogFP == NULL))
	return;

#ifdef HAVE_ALLOCA
pszIndent = (char *)alloca((2*iTracingDepth_m+1)*sizeof(char));
#else
pszIndent = (char *)allocMemory((2*iTracingDepth_m+1)*sizeof(char));
#endif
sprintf(pszIndent, "%*s", 2*iTracingDepth_m, "");
/*
 *  extract the allomorph string
 */
if (tlen >= BUFSIZE)
	tlen = BUFSIZE - 1;
if (tlen)
	{
	strncpy(szAllo, tail, tlen);
	szAllo[tlen] = NUL;
	}
else
	strcpy(szAllo,"0");
/*
 *  get the type information
 */
switch (dtype)
	{
	case AMPLE_PFX:	pszType = "pfx";	break;
	case AMPLE_IFX:	pszType = "ifx";	break;
	case AMPLE_SFX:	pszType = "sfx";	break;
	case AMPLE_NFX:	pszType = "nfx";	break;
	case AMPLE_ROOT:	pszType = "root";	break;
	default:		pszType = "BAD";	break;
	}
if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	/*
	 *  shift print-out according to parsing depth
	 */
	store_AMPLE_trace(pAmple_in, pszIndent, NULL);
	/*
	 *  write the basic allomorph information
	 */
	store_AMPLE_trace(pAmple_in, pszType, NULL);
	store_AMPLE_trace(pAmple_in, ": %s", szAllo);
	store_AMPLE_trace(pAmple_in, " %s", m_name);
	store_AMPLE_trace(pAmple_in, " %s",
			  (fcat != 0) ? findAmpleCategoryName((int)fcat,
						  pAmple_in->pCategories) : "");
	if (dtype != AMPLE_ROOT)
	{
	char szNumber[16];
	/*
	 *  output additional information for affixes
	 */
	if (tcat != 0)
	  store_AMPLE_trace(pAmple_in, "/%s oc = ",
				findAmpleCategoryName((int)tcat,
						  pAmple_in->pCategories));
	else
	  store_AMPLE_trace(pAmple_in, "oc = ", NULL);
	sprintf(szNumber,  "%d", ordercl);
	store_AMPLE_trace(pAmple_in, szNumber, NULL);
	sprintf(szNumber,  ",%d", orderclMax);
	store_AMPLE_trace(pAmple_in, szNumber, NULL);
	}
	/*
	 *  allomorph indentifier
	 */
	if (pszAllomorphID_in != NULL)
	store_AMPLE_trace(pAmple_in, " {%s}", pszAllomorphID_in);
	/*
	 *  morpheme & allomorph properties
	 */
	if (pAmple_in->pszTrace != NULL)
	{
	pAmple_in->pszTrace = stringifyAmplePropertySet(
							  pAmple_in->pszTrace,
							  &pAmple_in->uiTraceSize,
							  props,
							  &pAmple_in->sProperties);
	if (ac_ptr)
		{
		pAmple_in->pszTrace = stringifyAmpleEnvConstraint(
							   pAmple_in->pszTrace,
							   &pAmple_in->uiTraceSize,
							   ac_ptr->pStringCond,
							   FALSE);
#ifndef hab380
		pAmple_in->pszTrace = stringifyAmpleEnvConstraint(
							   pAmple_in->pszTrace,
							   &pAmple_in->uiTraceSize,
							   ac_ptr->pNegStringCond,
							   FALSE);
#endif /* hab380 */
		pAmple_in->pszTrace = stringifyAmpleEnvConstraint(
							   pAmple_in->pszTrace,
							   &pAmple_in->uiTraceSize,
							   ac_ptr->pMorphCond,
							   FALSE);
				/* 3.3.0 hab */
		pAmple_in->pszTrace = stringifyAmpleEnvConstraint(
							   pAmple_in->pszTrace,
							   &pAmple_in->uiTraceSize,
							   ac_ptr->pPunctCond,
							   FALSE);
		}
	}
	else
	{
	writeAmplePropertySet(props,
				  &pAmple_in->sProperties, pAmple_in->pLogFP);
	if (ac_ptr)
		{
		writeAmpleEnvConstraint(pAmple_in->pLogFP, ac_ptr->pStringCond,
					FALSE);
#ifndef hab380
		writeAmpleEnvConstraint(pAmple_in->pLogFP, ac_ptr->pNegStringCond,
					FALSE);
#endif /* hab380 */
		writeAmpleEnvConstraint(pAmple_in->pLogFP, ac_ptr->pMorphCond,
					FALSE);
				/* 3.3.0 hab */
		writeAmpleEnvConstraint(pAmple_in->pLogFP, ac_ptr->pPunctCond,
					FALSE);
		}
	}
	store_AMPLE_trace(pAmple_in, "\n", NULL);
	}
else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		 pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	{
	size_t	uiSize;
	size_t	uiMaxSize;
	char *	pszCat;
	char *	pszToCat = NULL;
	char *	pszStr;

	if (pszAllomorphID_in != NULL)
	uiMaxSize = lengthAmpleCDATA(pszAllomorphID_in, FALSE);
	else
	uiMaxSize = lengthAmpleCDATA(szAllo, FALSE);
	pszCat = findAmpleCategoryName((int)fcat, pAmple_in->pCategories);
	uiSize = lengthAmpleCDATA(pszCat, FALSE);
	if (uiMaxSize < uiSize)
	uiMaxSize = uiSize;
	if (dtype != AMPLE_ROOT)
	{
	pszToCat = findAmpleCategoryName((int)tcat, pAmple_in->pCategories);
	uiSize = lengthAmpleCDATA(pszToCat, FALSE);
	if (uiMaxSize < uiSize)
		uiMaxSize = uiSize;
	}
#ifdef HAVE_ALLOCA
	pszStr = (char *)alloca(uiMaxSize+1);
#else
	pszStr = (char *)allocMemory(uiMaxSize+1);
#endif
	store_AMPLE_trace(pAmple_in, "%s<parseNode>\n", pszIndent);
	store_AMPLE_trace(pAmple_in, "  %s<morph",      pszIndent);
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	  {
	store_AMPLE_trace(pAmple_in, " type='%s'",        pszType);
#ifdef EXPERIMENTAL
	store_AMPLE_trace(pAmple_in, " wordType='%s'", pszPATRCat_in);
	store_AMPLE_trace(pAmple_in, " morphname='%s'", m_name);
#endif
	  }
	else
	  store_AMPLE_trace(pAmple_in, " type=%s",        pszType);
	storeAmpleCDATA(pszStr, pszAllomorphID_in ? pszAllomorphID_in : szAllo,
			FALSE);
	store_AMPLE_trace(pAmple_in, " alloid=\"%s\"", pszStr);
	storeAmpleCDATA(pszStr, pszCat, FALSE);
	store_AMPLE_trace(pAmple_in, " category=\"%s", pszStr);
	if (dtype != AMPLE_ROOT)
	{
	storeAmpleCDATA(pszStr, pszToCat, FALSE);
	store_AMPLE_trace(pAmple_in, "/%s", pszStr);
	}
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	  store_AMPLE_trace(pAmple_in, "\"/>\n", NULL);
	else
	  store_AMPLE_trace(pAmple_in, "\">\n", NULL);
#ifndef HAVE_ALLOCA
	freeMemory(pszStr);
#endif
	}
#ifndef HAVE_ALLOCA
freeMemory(pszIndent);
#endif
} /* end a_trace */

/*****************************************************************************
 * NAME
 *    free_headlist_list
 * DESCRIPTION
 *    free a list of AmpleHeadList lists
 * RETURN VALUE
 *    none
 */
static void free_headlist_list(pHeadlists_io)
AmpleHeadlistList * pHeadlists_io;
{
AmpleHeadlistList *	this_hlap;
AmpleHeadlistList *	next_hlap;
AmpleHeadList *		this_hp;
AmpleHeadList *		next_hp;

for ( this_hlap = pHeadlists_io ; this_hlap ; this_hlap = next_hlap )
	{
	next_hlap = this_hlap->pNext;
	for ( this_hp = this_hlap->pHeadList ; this_hp ; this_hp = next_hp )
	{
	next_hp = this_hp->pRight;
	freeMemory( this_hp->pAllomorph->pMorpheme->pszMorphName );
	freeMemory( this_hp->pAllomorph->pMorpheme );
	freeMemory( this_hp->pAllomorph );
	freeMemory(this_hp);
	}
	freeMemory(this_hlap->pszSurface);
	freeMemory(this_hlap);
	}
}

/*****************************************************************************
 * NAME
 *    eraseAmpleWord
 * DESCRIPTION
 *    free the memory allocated for a WordTemplate, including the fields
 *    specific to AMPLE
 * RETURN VALUE
 *    none
 */
void eraseAmpleWord(pWord_in, pAmple_in)
AmpleWord * pWord_in;
AmpleData *  pAmple_in;
{
#ifdef EXPERIMENTAL
AmpleParseList *	pParse;
AmpleParseList *	pNextParse;
#endif /* EXPERIMENTAL */

resetLocalGlobals();
if (pWord_in == NULL)
	return;

free_headlist_list(pWord_in->pHeadlists);
if (pWord_in->pTemplate != NULL)
	freeWordTemplate( pWord_in->pTemplate );

#ifdef EXPERIMENTAL
for ( pParse = pWord_in->pParses ; pParse ; pParse = pNextParse )
	{
	pNextParse = pParse->pNext;
	if (pParse->pParse != NULL)
	freePATREdgeList(pParse->pParse, &pAmple_in->sPATR);
	freeMemory(pParse);
	}
#endif /* EXPERIMENTAL */

pWord_in->pTemplate    = NULL;
pWord_in->pHeadlists   = NULL;
pWord_in->pszRemaining = NULL;
pWord_in->uiAmbigCount = 0;
pWord_in->bFoundRoot   = FALSE;
#ifdef EXPERIMENTAL
pWord_in->pParses      = NULL;
#endif /* EXPERIMENTAL */
}

/*==========================================================================*/
/*====									====*/
/*====		BUILTIN TESTS -- DO NOT PROLIFERATE THESE!!!		====*/
/*====									====*/
/*==========================================================================*/

/***************************************************************************
 * NAME
 *    testAmpleStringEnvirons
 * ARGUMENTS
 *    left    - pointer to the morpheme to the left in the headlist
 *    current - pointer to current morpheme in the headlist
 *    strp    - pointer to allomorph in the word
 *    len     - length of the allomorph string
 * DESCRIPTION
 *    Check whether current allomorph has an allowable string environment.
 * RETURN VALUE
 *    nonzero if okay, zero if test fails
 */
static int testAmpleStringEnvirons(left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
int	bPassed;
int	bUsesPrev;
int	bUsesNext;
AmpleEnvConstraint * pEC;

if (current->pAllomorph->pEnvironment != (AmpleAlloEnv *)NULL)
	{
	if (pAmple_in->bDebugAllomorphConds && (pAmple_in->pLogFP != NULL))
	{
	fprintf(pAmple_in->pLogFP,
		"SEC_ST: word = '%s', strp => '%s', len = %d",
		pszSurfaceForm_m, strp, len );
	writeAmpleEnvConstraint(pAmple_in->pLogFP,
				current->pAllomorph->pEnvironment->pStringCond,
				FALSE);
#ifndef hab380
	writeAmpleEnvConstraint(pAmple_in->pLogFP,
				current->pAllomorph->pEnvironment->pNegStringCond,
				FALSE);
#endif /* hab380 */
	writeAmpleEnvConstraint(pAmple_in->pLogFP,
				current->pAllomorph->pEnvironment->pMorphCond,
				FALSE);
	fprintf(pAmple_in->pLogFP, "\n");
	}
	bUsesPrev = FALSE;
	bUsesNext = FALSE;
	for (   pEC = current->pAllomorph->pEnvironment->pStringCond ;
		pEC ;
		pEC = pEC->pNext )
	{
	if (pEC->bUsesPrevWord)
		bUsesPrev = TRUE;
	if (pEC->bUsesNextWord)
		bUsesNext = TRUE;
	}
#ifndef hab380
	for (   pEC = current->pAllomorph->pEnvironment->pNegStringCond ;
		pEC ;
		pEC = pEC->pNext )
	{
	if (pEC->bUsesPrevWord)
		bUsesPrev = TRUE;
	if (pEC->bUsesNextWord)
		bUsesNext = TRUE;
	}
#endif /* hab380 */
	if (bUsesPrev)
	bUsesPrevWord_m = TRUE;
	if (bUsesNext)
	bUsesNextWord_m = TRUE;
	if (bUseSurroundingWords_m)
	{
	if (bUsesPrev || bUsesNext)
#ifndef hab380
	  {
		bPassed = checkAmpleStringEnviron(pszSurfaceForm_m,
				(int)(strp - pszSurfaceForm_m),
				strp + len,
				current->pAllomorph->pEnvironment->pStringCond,
				pPreviousWord_m, pNextWord_m, pAmple_in);
	/* if the regular SEC passed and if there are NegSECs to check,
	 * check them.  The result is their negation.
	 * (SECs are logically ORd. NegSECs are logically ANDed.  So if we
	 *  treat NegSECs as SECs but negate the result, we get what we want.)
	 */
	if (bPassed &&
		(current->pAllomorph->pEnvironment->pNegStringCond !=
		 (AmpleEnvConstraint *)NULL) )
	  bPassed = !checkAmpleStringEnviron(pszSurfaceForm_m,
						 (int)(strp - pszSurfaceForm_m),
						 strp + len,
				  current->pAllomorph->pEnvironment->pNegStringCond,
						 pPreviousWord_m, pNextWord_m,
						 pAmple_in);
	  }
#else  /* hab380 */
		bPassed = checkAmpleStringEnviron(pszSurfaceForm_m,
				(int)(strp - pszSurfaceForm_m),
				strp + len,
				current->pAllomorph->pEnvironment->pStringCond,
				pPreviousWord_m, pNextWord_m, pAmple_in);
#endif /* hab380 */
	else
		return TRUE;	/* already checked in previous pass */
	}
	else
	{
	if (bUsesPrev || bUsesNext)
		return TRUE;
	bPassed = checkAmpleStringEnviron(pszSurfaceForm_m,
					  (int)(strp - pszSurfaceForm_m),
					  strp + len,
				current->pAllomorph->pEnvironment->pStringCond,
					  pPreviousWord_m, pNextWord_m,
					  pAmple_in);
#ifndef hab380
	/* if the regular SEC passed and if there are NegSECs to check,
	 * check them.  The result is their negation.
	 * (SECs are logically ORd. NegSECs are logically ANDed.  So if we
	 *  treat NegSECs as SECs but negate the result, we get what we want.)
	 */
	if (bPassed &&
		(current->pAllomorph->pEnvironment->pNegStringCond !=
		 (AmpleEnvConstraint *)NULL) )
	  bPassed = !checkAmpleStringEnviron(pszSurfaceForm_m,
						 (int)(strp - pszSurfaceForm_m),
						 strp + len,
				  current->pAllomorph->pEnvironment->pNegStringCond,
						 pPreviousWord_m, pNextWord_m,
						 pAmple_in);
#endif /* hab380 */
	}
	if (    !bPassed &&
		((pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML) ||
		 (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML) ))
	{
	  formatFormForXMLEnvironment("SEC_ST", strp, len, pAmple_in);

	  if (pAmple_in->pszTrace != NULL)
		{
		pAmple_in->pszTrace = stringifyAmpleEnvConstraint(
				pAmple_in->pszTrace,
				&pAmple_in->uiTraceSize,
				current->pAllomorph->pEnvironment->pStringCond,
				TRUE);
#ifndef hab380
		pAmple_in->pszTrace = stringifyAmpleEnvConstraint(
				  pAmple_in->pszTrace,
				  &pAmple_in->uiTraceSize,
				  current->pAllomorph->pEnvironment->pNegStringCond,
				  TRUE);
#endif /* hab380 */
		}
	  else if (pAmple_in->pLogFP != NULL)
		{
		writeAmpleEnvConstraint(
				pAmple_in->pLogFP,
				current->pAllomorph->pEnvironment->pStringCond,
				TRUE);
#ifndef hab380
		writeAmpleEnvConstraint(
				  pAmple_in->pLogFP,
				  current->pAllomorph->pEnvironment->pNegStringCond,
				  TRUE);
#endif /* hab380 */
		}
	  if (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML)
		store_AMPLE_trace(pAmple_in, "\"/>\n", NULL);
	  else
		store_AMPLE_trace(pAmple_in, "\">\n", NULL);
	}
	return bPassed;
	}
else
	return( TRUE );

} /* end of testAmpleStringEnvirons() */

/***************************************************************************
 * NAME
 *    testAmplePunctEnvirons    3.3.0 hab based on testAmpleStringEnvirons()
 * ARGUMENTS
 *    left    - pointer to the morpheme to the left in the headlist
 *    current - pointer to current morpheme in the headlist
 *    strp    - pointer to allomorph in the word
 *    len     - length of the allomorph string
 * DESCRIPTION
 *    Check whether current allomorph has an allowable punctuation environment.
 * RETURN VALUE
 *    nonzero if okay, zero if test fails
 */
static int testAmplePunctEnvirons(left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
int	bPassed;
int	cSave;
int     iLen;

if (current->pAllomorph->pEnvironment != (AmpleAlloEnv *)NULL)
	{
	if (pAmple_in->bDebugAllomorphConds && (pAmple_in->pLogFP != NULL))
	{
	fprintf(pAmple_in->pLogFP,
		"PEC_ST: word = '%s', strp => '%s', len = %d",
		pszSurfaceForm_m, strp, len );
	writeAmpleEnvConstraint(pAmple_in->pLogFP,
				current->pAllomorph->pEnvironment->pStringCond,
				FALSE);
#ifndef hab380
	writeAmpleEnvConstraint(pAmple_in->pLogFP,
				current->pAllomorph->pEnvironment->pNegStringCond,
				FALSE);
#endif /* hab380 */
	writeAmpleEnvConstraint(pAmple_in->pLogFP,
				current->pAllomorph->pEnvironment->pMorphCond,
				FALSE);
	writeAmpleEnvConstraint(pAmple_in->pLogFP,
				current->pAllomorph->pEnvironment->pPunctCond,
				FALSE);
	fprintf(pAmple_in->pLogFP, "\n");
	}
	iLen = (pCurrentWord_m->pTemplate->pszFormat == (char *)NULL) ? 0 :
			strlen(pCurrentWord_m->pTemplate->pszFormat);
	bPassed = checkAmplePunctEnviron(pCurrentWord_m->pTemplate->pszFormat,
				iLen,
				pCurrentWord_m->pTemplate->pszNonAlpha,
				current->pAllomorph->pEnvironment->pPunctCond,
				pAmple_in);
	if (    !bPassed &&
		( (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML) ||
		  (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML) ) )
	{
	char *	pszStr;
	size_t	uiSize;
	size_t	uiMaxSize;

	uiMaxSize = 2 * iTracingDepth_m;
	uiSize    = lengthAmpleCDATA(pszSurfaceForm_m, FALSE);
	if (uiMaxSize < uiSize)
		uiMaxSize = uiSize;
#ifdef HAVE_ALLOCA
	pszStr    = (char *)alloca(uiMaxSize + 1);
#else
	pszStr    = (char *)allocMemory(uiMaxSize + 1);
#endif
	sprintf(pszStr, "%*s", 2*iTracingDepth_m, "");
	store_AMPLE_trace(pAmple_in,"  %s<failure test=\"PEC_ST: ", pszStr);

	cSave = *strp;
	*strp = NUL;
	storeAmpleCDATA(pszStr, pszSurfaceForm_m,  FALSE);
	*strp = cSave;
	store_AMPLE_trace(pAmple_in, pszStr, NULL);

	cSave = strp[len];
	strp[len] = NUL;
	storeAmpleCDATA(pszStr, strp, FALSE);
	strp[len] = cSave;
	store_AMPLE_trace(pAmple_in, " _%s_ ", pszStr);

	storeAmpleCDATA(pszStr, strp+len, FALSE);
	store_AMPLE_trace(pAmple_in, pszStr, NULL);

	if (pAmple_in->pszTrace != NULL)
		{
		pAmple_in->pszTrace = stringifyAmpleEnvConstraint(
				pAmple_in->pszTrace,
				&pAmple_in->uiTraceSize,
				current->pAllomorph->pEnvironment->pPunctCond,
				TRUE);
		}
	else if (pAmple_in->pLogFP != NULL)
		{
		writeAmpleEnvConstraint(
				pAmple_in->pLogFP,
				current->pAllomorph->pEnvironment->pPunctCond,
				TRUE);
		}
	if (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML)
	  store_AMPLE_trace(pAmple_in, "\"/>\n", NULL);
	else
	  store_AMPLE_trace(pAmple_in, "\">\n", NULL);
#ifndef HAVE_ALLOCA
	freeMemory(pszStr);
#endif
	}
	return bPassed;
	}
else
	return( TRUE );

} /* end of testAmplePunctEnvirons() */

/***************************************************************************
 * NAME
 *    testAmpleAdhocPairs
 * ARGUMENTS
 *    left    - pointer to the morpheme to the left in the headlist
 *    current - pointer to current morpheme in the headlist
 *    strp    - pointer to allomorph in the word
 *    len     - length of the allomorph string
 * DESCRIPTION
 *    Check whether <left,current> morphnames appear as a morphname pair in
 *    the adhoc list (adhoc_pair).  This should probably be last test tried.
 *    If adhoc_pair is NULL, then the test passes everything as okay.
 * RETURN VALUE
 *    nonzero if okay, zero if test fails (i.e., morphname pair is found)
 */
static int testAmpleAdhocPairs( left, current, strp, len)
AmpleHeadList *left, *current;
char *strp;					/* ARGSUSED */
int len;
{
register AmplePairList *plp;

if (bUseSurroundingWords_m)
	return TRUE;

if (left == (AmpleHeadList *)NULL)
	return(TRUE);

for ( plp = pAdhocList_m ; plp != (AmplePairList *)NULL ; plp = plp->pNext )
	{
	if (    (strcmp(plp->pszLeft, left->pAllomorph->pMORPHNAME) == 0) &&
		(strcmp(plp->pszRight, current->pAllomorph->pMORPHNAME) == 0) )
	return(FALSE);
	}
return(TRUE);

} /* end of testAmpleAdhocPairs() */

/***************************************************************************
 * NAME
 *    testAmpleCompoundRoots
 * ARGUMENTS
 *    left    - pointer to the morpheme to the left in the headlist
 *    current - pointer to current morpheme in the headlist
 *    strp    - pointer to allomorph in the word
 *    len     - length of the allomorph string
 * DESCRIPTION
 *    Check whether <left,current> categories appear as a category pair in
 *    the compound root list (pAmple_in->pCompoundRootPairs) if left is a
 *    root.  If left is not a root, then the test automatically passes okay.
 *    If pAmple_in->pCompoundRootPairs is NULL, then everything always
 *    fails the test.
 * RETURN VALUE
 *    nonzero if okay, zero if test fails (i.e., category pair is not found)
 */
static int testAmpleCompoundRoots( left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
register int i;

if (bUseSurroundingWords_m)
	return TRUE;

if ((left == (AmpleHeadList *)NULL) || (left->eType != AMPLE_ROOT))
	return(TRUE);	/* always true for first morpheme or nonroot */
if (pAmple_in->pCompoundRootPairs == (unsigned char *)NULL)
	return(FALSE);	/* always false if no compound root list */
/*
 *  look through table until match found
 */
for ( i = 0 ; pAmple_in->pCompoundRootPairs[i] != NUL ; i += 2 )
	{
	if (    (left->iROOTCATEG  == pAmple_in->pCompoundRootPairs[i]) &&
		(current->iROOTCATEG == pAmple_in->pCompoundRootPairs[i+1]) )
	return(TRUE);
	}
return(FALSE);			/* fail if no match found */

} /* end of testAmpleCompoundRoots() */

/***************************************************************************
 * NAME
 *    testAmpleMorphEnvirons
 * ARGUMENTS
 *    left    - unused
 *    current - pointer to current morpheme in the headlist
 *    strp    - unused
 *    len     - unused
 * DESCRIPTION
 *    check whether current has an allowable morpheme environment
 * RETURN VALUE
 *    nonzero if okay, zero if the test fails
 */
static int testAmpleMorphEnvirons( left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
AmpleHeadList *	pHead;
AmpleHeadList *	pBegin = NULL;
int		bUsesPrev;
int		bUsesNext;
AmpleEnvConstraint * pEC;
AmpleHeadlistList *  pHL;

if (	(current->pAllomorph->pEnvironment             == NULL) ||
	(current->pAllomorph->pEnvironment->pMorphCond == NULL) )
	return TRUE;

bUsesPrev = FALSE;
bUsesNext = FALSE;
for (	pEC = current->pAllomorph->pEnvironment->pMorphCond ;
	pEC ;
	pEC = pEC->pNext )
	{
	if (pEC->bUsesPrevWord)
	bUsesPrev = TRUE;
	if (pEC->bUsesNextWord)
	bUsesNext = TRUE;
	}
if (bUsesPrev)
	bUsesPrevWord_m = TRUE;
if (bUsesNext)
	bUsesNextWord_m = TRUE;
if (bUseSurroundingWords_m)
	{
	if (bUsesPrev || bUsesNext)
	{
	if (checkAmpleMorphEnviron(left, current->pRight,
				 current->pAllomorph->pEnvironment->pMorphCond,
				   pPreviousWord_m, pNextWord_m, pAmple_in) )
		return TRUE;
	}
	else
	return TRUE;		/* already checked */
	}
else
	{
	if (bUsesPrev || bUsesNext)
	return TRUE;
	if (checkAmpleMorphEnviron(left, current->pRight,
				   current->pAllomorph->pEnvironment->pMorphCond,
				   pPreviousWord_m, pNextWord_m, pAmple_in) )
	return TRUE;
	}

if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
	{
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in,
			"        Morpheme Environment Constraint failed for %s:\n",
			  current->pAllomorph->pMORPHNAME);
	store_AMPLE_trace(pAmple_in, "                ", NULL);
	if (pAmple_in->pszTrace != NULL)
		{
		pAmple_in->pszTrace = stringifyAmpleEnvConstraint(
				 pAmple_in->pszTrace,
				 &pAmple_in->uiTraceSize,
				 current->pAllomorph->pEnvironment->pMorphCond,
				 FALSE);
		}
	else if (pAmple_in->pLogFP != NULL)
		{
		writeAmpleEnvConstraint(pAmple_in->pLogFP,
				 current->pAllomorph->pEnvironment->pMorphCond,
					FALSE);
		}
	store_AMPLE_trace(pAmple_in, "\n", NULL);
	if (bUsesPrev)
		{
		store_AMPLE_trace(pAmple_in, "Previous word =\n", NULL);
		for ( pHL = pPreviousWord_m->pHeadlists ; pHL ; pHL = pHL->pNext )
		{
		store_AMPLE_trace(pAmple_in, "\t", NULL);
		for ( pHead = pHL->pHeadList ; pHead ; pHead = pHead->pRight )
			store_AMPLE_trace(pAmple_in, " %s",
					  pHead->pAllomorph->pMORPHNAME);
		store_AMPLE_trace(pAmple_in, "\n", NULL);
		}
		}
	store_AMPLE_trace(pAmple_in, "Current word =\n", NULL);
	store_AMPLE_trace(pAmple_in, "\t", NULL);
	for ( pHead = current ; pHead->pLeft ; pHead = pHead->pLeft )
		;
	for ( ; pHead ; pHead = pHead->pRight )
		{
		if (pHead == current)
		store_AMPLE_trace(pAmple_in, ">>", NULL);
		store_AMPLE_trace(pAmple_in, " %s",
				  pHead->pAllomorph->pMORPHNAME);
		if (pHead == current)
		store_AMPLE_trace(pAmple_in, " <<", NULL);
		}
	store_AMPLE_trace(pAmple_in, "\n", NULL);
	if (bUsesNext)
		{
		store_AMPLE_trace(pAmple_in, "Next word =\n", NULL);
		for ( pHL = pNextWord_m->pHeadlists ; pHL ; pHL = pHL->pNext )
		{
		store_AMPLE_trace(pAmple_in, "\t", NULL);
		for ( pHead = pHL->pHeadList ; pHead ; pHead = pHead->pRight )
			store_AMPLE_trace(pAmple_in, " %s",
					  pHead->pAllomorph->pMORPHNAME);
		store_AMPLE_trace(pAmple_in, "\n", NULL);
		}
		}
	}
	else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		 pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	{
	char *	pszStr;
	size_t	uiSize;
	size_t	uiMaxSize;

	uiMaxSize = 2 * iTracingDepth_m;
	for ( pHead = left ; pHead && (pHead->pLeft) ; pHead = pHead->pLeft )
		;
	pBegin = pHead;
	for ( ; pHead && (pHead != current) ; pHead = pHead->pRight )
		{
		uiSize = lengthAmpleCDATA(pHead->pAllomorph->pMORPHNAME, FALSE);
		if (uiMaxSize < uiSize)
		uiMaxSize = uiSize;
		}
	for ( pHead = current ; pHead ; pHead = pHead->pRight )
		{
		uiSize = lengthAmpleCDATA(pHead->pAllomorph->pMORPHNAME, FALSE);
		if (uiMaxSize < uiSize)
		uiMaxSize = uiSize;
		}
#ifdef HAVE_ALLOCA
	pszStr    = (char *)alloca(uiMaxSize + 1);
#else
	pszStr    = (char *)allocMemory(uiMaxSize + 1);
#endif
	sprintf(pszStr, "%*s", 2*iTracingDepth_m, "");
	store_AMPLE_trace(pAmple_in, "\n    %s<failure test=\"MEC_FT:",
			  pszStr);
	for (	pHead = pBegin ;
		pHead && (pHead != current) ;
		pHead = pHead->pRight )
		{
		storeAmpleCDATA(pszStr, pHead->pAllomorph->pMORPHNAME, FALSE);
		store_AMPLE_trace(pAmple_in, " %s", pszStr);
		}
	storeAmpleCDATA(pszStr, current->pAllomorph->pMORPHNAME, FALSE);
	store_AMPLE_trace(pAmple_in, " _%s_", pszStr);
	for ( pHead = current->pRight ; pHead ; pHead = pHead->pRight )
		{
		storeAmpleCDATA(pszStr, pHead->pAllomorph->pMORPHNAME, FALSE);
		store_AMPLE_trace(pAmple_in, " %s", pszStr);
		}
	if (pAmple_in->pszTrace != NULL)
		{
		pAmple_in->pszTrace = stringifyAmpleEnvConstraint(
				 pAmple_in->pszTrace,
				 &pAmple_in->uiTraceSize,
				 current->pAllomorph->pEnvironment->pMorphCond,
				 TRUE);
		}
	else if (pAmple_in->pLogFP != NULL)
		{
		writeAmpleEnvConstraint(
				 pAmple_in->pLogFP,
				 current->pAllomorph->pEnvironment->pMorphCond,
				 TRUE);
		}
	if (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML)
	  store_AMPLE_trace(pAmple_in, "\"/>", NULL);
	else
	  store_AMPLE_trace(pAmple_in, "\">", NULL);
#ifndef HAVE_ALLOCA
	freeMemory(pszStr);
#endif
	}
	}
return( FALSE );
} /* end of testAmpleMorphEnvirons() */

/*****************************************************************************
 * NAME
 *    checkAmpleMorphConstraint
 * DESCRIPTION
 *    check whether this co-occurrence constraint applies to this morpheme,
 *    and if so, check whether the morpheme satisfies the constraint
 * RETURN VALUE
 *    TRUE if the current morpheme passes an applicable co-occurrence
 *    constraint, FALSE if it fails one
 */
static int checkAmpleMorphConstraint(pMorphConstraint_in, pCurrent_in,
					 pLeft_in, pAmple_in)
AmpleMorphConstraint *	pMorphConstraint_in;
AmpleHeadList *		pCurrent_in;
AmpleHeadList *		pLeft_in;
AmpleData *		pAmple_in;
{
AmpleMorphlist *	tp;
AmpleHeadList *		hp;
AmpleHeadList *		pHead;
int			bUsesPrev;
int			bUsesNext;
AmpleEnvConstraint *	pEC;

for ( tp = pMorphConstraint_in->pMorphs, hp = pCurrent_in ; hp ; )
	{
	/*
	 *  check this morpheme
	 */
	if (	!tp->bClass &&
		(strcmp(hp->pAllomorph->pMORPHNAME, tp->u.pszMorphName) != 0) )
	break;		/* MCC doesn't apply */
	if (	tp->bClass &&
		!isAmpleMorphClassMember(hp->pAllomorph->pMORPHNAME,
					 tp->u.pMorphClass) )
	break;		/* MCC doesn't apply */
	/*
	 *  this one matched, step to next
	 */
	hp = hp->pRight;
	tp = tp->pNext;
	/*
	 *  if match completed, this constraint applies, so check it
	 */
	if (tp == (AmpleMorphlist *)NULL)
	{
	bUsesPrev = FALSE;
	bUsesNext = FALSE;
	for (	pEC = pMorphConstraint_in->pEnvironment ;
		pEC ;
		pEC = pEC->pNext )
		{
		if (pEC->bUsesPrevWord)
		bUsesPrev = TRUE;
		if (pEC->bUsesNextWord)
		bUsesNext = TRUE;
		}
	if (bUsesPrev)
		bUsesPrevWord_m = TRUE;
	if (bUsesNext)
		bUsesNextWord_m = TRUE;
	if (bUseSurroundingWords_m)
		{
		if (bUsesPrev || bUsesNext)
		{
		if (checkAmpleMorphEnviron( pLeft_in, hp,
						pMorphConstraint_in->pEnvironment,
						pPreviousWord_m, pNextWord_m,
						pAmple_in))
			return TRUE;		/* MCC satisfied okay */
		}
		else
		return TRUE;		/* already processed */
		}
	else
		{
		if (bUsesPrev || bUsesNext)
		return TRUE;
		if (checkAmpleMorphEnviron( pLeft_in, hp,
					pMorphConstraint_in->pEnvironment,
					pPreviousWord_m, pNextWord_m,
					pAmple_in))
		return TRUE;		/* MCC satisfied okay */
		}

	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
		{
		store_AMPLE_trace(pAmple_in,
		  "        Morpheme Co-occurrence Constraint Failed for %s:\n",
				  pCurrent_in->pAllomorph->pMORPHNAME);
		store_AMPLE_trace(pAmple_in, "                ", NULL);
		if (pAmple_in->pszTrace != NULL)
		{
		pAmple_in->pszTrace = stringifyAmpleMorphConstraint(
			pAmple_in->pszTrace,
			&pAmple_in->uiTraceSize,
			pMorphConstraint_in,
			FALSE);
		}
		else if (pAmple_in->pLogFP != NULL)
		{
		writeAmpleMorphConstraint(pMorphConstraint_in,
					  pAmple_in->pLogFP,
					  FALSE);
		}
		store_AMPLE_trace(pAmple_in, "\n", NULL);
		}
	else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		 pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		{
		char *		pszStr;
		size_t		uiSize;
		size_t		uiMaxSize;
		AmpleHeadList *	pBegin = NULL;

		uiMaxSize = 2 * iTracingDepth_m;
		if (pMorphConstraint_in->pszLabel != NULL)
		{
		uiSize = lengthAmpleCDATA(pMorphConstraint_in->pszLabel,
					  FALSE);
		if (uiMaxSize < uiSize)
			uiMaxSize = uiSize;
		}
		else
		{
		for ( pHead = pLeft_in ;
			  pHead && (pHead->pLeft) ;
			  pHead = pHead->pLeft )
			;
		pBegin = pHead;
		for (   ;
			pHead && (pHead != pCurrent_in) ;
			pHead = pHead->pRight )
			{
			uiSize = lengthAmpleCDATA(
			pHead->pAllomorph->pMORPHNAME,
			FALSE);
			if (uiMaxSize < uiSize)
			uiMaxSize = uiSize;
			}
		for ( pHead = pCurrent_in ; pHead ; pHead = pHead->pRight )
			{
			uiSize = lengthAmpleCDATA(
			pHead->pAllomorph->pMORPHNAME,
			FALSE);
			if (uiMaxSize < uiSize)
			uiMaxSize = uiSize;
			}
		}
#ifdef HAVE_ALLOCA
		pszStr    = (char *)alloca(uiMaxSize + 1);
#else
		pszStr    = (char *)allocMemory(uiMaxSize + 1);
#endif
		sprintf(pszStr, "%*s", 2*iTracingDepth_m, "");
		store_AMPLE_trace(pAmple_in, "\n    %s<failure test=\"MCC_FT:",
				  pszStr);
		if (pMorphConstraint_in->pszLabel != NULL)
		{
		storeAmpleCDATA(pszStr,
				pMorphConstraint_in->pszLabel, FALSE);
		store_AMPLE_trace(pAmple_in, " %s", pszStr);
		}
		else
		{
		for (   pHead = pBegin ;
			pHead && (pHead != pCurrent_in) ;
			pHead = pHead->pRight )
			{
			storeAmpleCDATA(pszStr,
					pHead->pAllomorph->pMORPHNAME, FALSE);
			store_AMPLE_trace(pAmple_in, " %s", pszStr);
			}
		storeAmpleCDATA(pszStr,
				pCurrent_in->pAllomorph->pMORPHNAME,
				FALSE);
		store_AMPLE_trace(pAmple_in, " _%s_", pszStr);

		for (   pHead = pCurrent_in->pRight ;
			pHead ;
			pHead = pHead->pRight )
			{
			storeAmpleCDATA(pszStr,
					pHead->pAllomorph->pMORPHNAME, FALSE);
			store_AMPLE_trace(pAmple_in, " %s", pszStr);
			}
		store_AMPLE_trace(pAmple_in, " :: ", NULL);
		if (pAmple_in->pszTrace != NULL)
			{
			pAmple_in->pszTrace = stringifyAmpleMorphConstraint(
			pAmple_in->pszTrace,
			&pAmple_in->uiTraceSize,
			pMorphConstraint_in,
			TRUE);
			}
		else if (pAmple_in->pLogFP != NULL)
			{
			writeAmpleMorphConstraint(pMorphConstraint_in,
						  pAmple_in->pLogFP, TRUE);
			}
		}
		if (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML)
		  store_AMPLE_trace(pAmple_in, "\"/>", NULL);
		else
		  store_AMPLE_trace(pAmple_in, "\">", NULL);
#ifndef HAVE_ALLOCA
		freeMemory(pszStr);
#endif
		}
	return( FALSE );	/* it only takes one failure! */
	}
	}
return( TRUE );		/* MCC succeeded (maybe it didn't apply) */
}

/***************************************************************************
 * NAME
 *    testAmpleMorphsCo_occur
 * ARGUMENTS
 *    left    - unused
 *    current - pointer to current morpheme in the headlist
 *    strp    - unused
 *    len     - unused
 * DESCRIPTION
 *    check whether the current morpheme satisfies any applicable
 *    morpheme co-occurrence constraints
 * RETURN VALUE
 *    nonzero if okay, zero if the test fails
 */
static int testAmpleMorphsCo_occur( left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
AmpleMorphConstraint *	mp;
/*
 *  check every constraint for each morpheme
 */
for ( mp = pAmple_in->pMorphConstraints ; mp != NULL ; mp = mp->pNext )
	{
	if (!checkAmpleMorphConstraint(mp, current, left, pAmple_in))
	return FALSE;
	}
/*
 *  check constraints specific to this morpheme
 */
for (	mp = current->pAllomorph->pMorpheme->pMorphConstraints ;
	mp ;
	mp = mp->pNext )
	{
	if (!checkAmpleMorphConstraint(mp, current, left, pAmple_in))
	return FALSE;
	}
return TRUE;
} /* end of testAmpleMorphsCo_occur() */

#ifdef EXPERIMENTAL
#ifndef hab350
/***************************************************************************
 * NAME
 *    testAmpleNeverEnvirons
 * ARGUMENTS
 *    left    - unused
 *    current - pointer to current morpheme in the headlist
 *    strp    - unused
 *    len     - unused
 * DESCRIPTION
 *    check whether the current morpheme fails any applicable
 *    allomorphs never co-occur constraints
 * RETURN VALUE
 *    nonzero if okay, zero if the test fails
 */
static int testAmpleNeverEnvirons( left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
AmpleNeverConstraint *	mp;
/*
 *  check every constraint for each morpheme
 */
for ( mp = pAmple_in->pNeverConstraints ; mp != NULL ; mp = mp->pNext )
	{
	if (!checkAmpleNeverConstraint(mp, current, left, pAmple_in))
	return FALSE;
	}
return TRUE;
} /* end of testAmpleNeverEnvirons() */

/*****************************************************************************
 * NAME
 *    checkAmpleNeverConstraint
 * DESCRIPTION
 *    check whether this allomorphs never co-occur constraint applies to the
 *    allomorph of this morpheme,
 *    and if so, check whether the allomorph fails the constraint
 * RETURN VALUE
 *    TRUE if the current morpheme's allomorph fails to meet an applicable
 *    allomorphs never co-occur constraint, FALSE if it meets one
 */
static int checkAmpleNeverConstraint(pNeverConstraint_in, pCurrent_in,
					 pLeft_in, pAmple_in)
AmpleNeverConstraint *	pNeverConstraint_in;
AmpleHeadList *		pCurrent_in;
AmpleHeadList *		pLeft_in;
AmpleData *		pAmple_in;
{
StringList *	tp;
AmpleHeadList *		hp;
AmpleHeadList *		pHead;
int			bUsesPrev;
int			bUsesNext;
AmpleEnvConstraint *	pEC;

for ( tp = pNeverConstraint_in->pAlloIDs, hp = pCurrent_in ; hp ; )
	{
	/*
	 *  check the allomorph of this morpheme
	 */
	if (strcmp(hp->pAllomorph->pszAllomorphID, tp->pszString) != 0)
	break;		/* ANCC doesn't apply */
	/*
	 *  this one matched, step to next
	 */
	hp = hp->pRight;
	tp = tp->pNext;
	/*
	 *  if match completed, this constraint applies, so check it
	 */
	if (tp == (StringList *)NULL)
	{
	bUsesPrev = FALSE;
	bUsesNext = FALSE;
	for (	pEC = pNeverConstraint_in->pEnvironment ;
		pEC ;
		pEC = pEC->pNext )
		{
		if (pEC->bUsesPrevWord)
		bUsesPrev = TRUE;
		if (pEC->bUsesNextWord)
		bUsesNext = TRUE;
		}
	if (bUsesPrev)
		bUsesPrevWord_m = TRUE;
	if (bUsesNext)
		bUsesNextWord_m = TRUE;
	if (bUseSurroundingWords_m)
		{
		if (bUsesPrev || bUsesNext)
		{
		if (checkAmpleNeverEnviron( pLeft_in, hp,
						pNeverConstraint_in->pEnvironment,
						pPreviousWord_m, pNextWord_m,
						pAmple_in))
			return TRUE;		/* ANCC satisfied okay */
		}
		else
		return TRUE;		/* already processed */
		}
	else
		{
		if (bUsesPrev || bUsesNext)
		return TRUE;
		if (checkAmpleNeverEnviron( pLeft_in, hp,
					pNeverConstraint_in->pEnvironment,
					pPreviousWord_m, pNextWord_m,
					pAmple_in))
		return TRUE;		/* ANCC satisfied okay */
		}

	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
		{
		store_AMPLE_trace(pAmple_in,
		   "        Allomorphs Never Co-occur Constraint Failed for %s:\n",
				  pCurrent_in->pAllomorph->pszAllomorphID);
		store_AMPLE_trace(pAmple_in, "                ", NULL);
		if (pAmple_in->pszTrace != NULL)
		{
		pAmple_in->pszTrace = stringifyAmpleNeverConstraint(
			pAmple_in->pszTrace,
			&pAmple_in->uiTraceSize,
			pNeverConstraint_in,
			FALSE);
		}
		else if (pAmple_in->pLogFP != NULL)
		{
		writeAmpleNeverConstraint(pNeverConstraint_in,
					  pAmple_in->pLogFP,
					  FALSE);
		}
		store_AMPLE_trace(pAmple_in, "\n", NULL);
		}
	else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		 pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		{
		char *		pszStr;
		size_t		uiSize;
		size_t		uiMaxSize;
		AmpleHeadList *	pBegin = NULL;

		uiMaxSize = 2 * iTracingDepth_m;
		if (pNeverConstraint_in->pszLabel != NULL)
		{
		uiSize = lengthAmpleCDATA(pNeverConstraint_in->pszLabel,
					  FALSE);
		if (uiMaxSize < uiSize)
			uiMaxSize = uiSize;
		}
		else
		{
		for ( pHead = pLeft_in ;
			  pHead && (pHead->pLeft) ;
			  pHead = pHead->pLeft )
			;
		pBegin = pHead;
		for (   ;
			pHead && (pHead != pCurrent_in) ;
			pHead = pHead->pRight )
			{
			uiSize = lengthAmpleCDATA(
			pHead->pAllomorph->pszAllomorphID,
			FALSE);
			if (uiMaxSize < uiSize)
			uiMaxSize = uiSize;
			}
		for ( pHead = pCurrent_in ; pHead ; pHead = pHead->pRight )
			{
			uiSize = lengthAmpleCDATA(
			pHead->pAllomorph->pszAllomorphID,
			FALSE);
			if (uiMaxSize < uiSize)
			uiMaxSize = uiSize;
			}
		}
#ifdef HAVE_ALLOCA
		pszStr    = (char *)alloca(uiMaxSize + 1);
#else
		pszStr    = (char *)allocMemory(uiMaxSize + 1);
#endif
		sprintf(pszStr, "%*s", 2*iTracingDepth_m, "");
		store_AMPLE_trace(pAmple_in, "\n    %s<failure test=\"ANCC_FT:",
				  pszStr);
		if (pNeverConstraint_in->pszLabel != NULL)
		{
		storeAmpleCDATA(pszStr,
				pNeverConstraint_in->pszLabel, FALSE);
		store_AMPLE_trace(pAmple_in, " %s", pszStr);
		}
		else
		{
		for (   pHead = pBegin ;
			pHead && (pHead != pCurrent_in) ;
			pHead = pHead->pRight )
			{
			storeAmpleCDATA(pszStr,
					pHead->pAllomorph->pszAllomorphID, FALSE);
			store_AMPLE_trace(pAmple_in, " %s", pszStr);
			}
		storeAmpleCDATA(pszStr,
				pCurrent_in->pAllomorph->pszAllomorphID,
				FALSE);
		store_AMPLE_trace(pAmple_in, " _%s_", pszStr);

		for (   pHead = pCurrent_in->pRight ;
			pHead ;
			pHead = pHead->pRight )
			{
			storeAmpleCDATA(pszStr,
					pHead->pAllomorph->pszAllomorphID, FALSE);
			store_AMPLE_trace(pAmple_in, " %s", pszStr);
			}
		store_AMPLE_trace(pAmple_in, " :: ", NULL);
		if (pAmple_in->pszTrace != NULL)
			{
			pAmple_in->pszTrace = stringifyAmpleNeverConstraint(
			pAmple_in->pszTrace,
			&pAmple_in->uiTraceSize,
			pNeverConstraint_in,
			TRUE);
			}
		else if (pAmple_in->pLogFP != NULL)
			{
			writeAmpleNeverConstraint(pNeverConstraint_in,
						  pAmple_in->pLogFP, TRUE);
			}
		}
		if (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML)
		  store_AMPLE_trace(pAmple_in, "\"/>", NULL);
		else
		  store_AMPLE_trace(pAmple_in, "\">", NULL);
#ifndef HAVE_ALLOCA
		freeMemory(pszStr);
#endif
		}
	return( FALSE );	/* it only takes one failure! */
	}
	}
return( TRUE );		/* ANCC succeeded (maybe it didn't apply) */
}

#endif /* hab350 */
#endif /* EXPERIMENTAL */
/*==========================================================================*/
/*====									====*/
/*====			END OF BUILTIN TESTS				====*/
/*====									====*/
/*==========================================================================*/

/***************************************************************************
 * NAME
 *    performAmplePrefixTests
 * ARGUMENTS
 *    left    - pointer to the morpheme to the left in the headlist
 *    current - pointer to current morpheme in the headlist
 *    strp    - pointer to allomorph in the word
 *    len     - length of the allomorph string
 * DESCRIPTION
 *    Work through the list of prefix tests.
 * RETURN VALUE
 *    nonzero if all Prefix Successor tests succeed, zero if any of them fail
 */
static int performAmplePrefixTests( left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
AmpleTestList *	flp;
int		bTestValue;

pszAmpleTestErrorHeader_m = "PREFIX TEST: ";
for (	flp = pAmple_in->pPrefixSuccTests,
				pAdhocList_m = pAmple_in->pPrefixAdhocPairs ;
	flp != NULL ;
	flp = flp->pNext )
	{
	/*
	 *	if at beginning of word, call only testAmpleStringEnvirons()
	 */
	if ((left != (AmpleHeadList *)NULL)  ||
	(flp->eFunction == AMPLE_SEC_ST) ||
	(flp->eFunction == AMPLE_PEC_ST)) /* 3.3.0 hab */
	{
	flp->uiTestCallCount++;
	switch (flp->eFunction)
		{
		case AMPLE_SEC_ST:
		bTestValue = testAmpleStringEnvirons(left, current, strp, len,
							 pAmple_in);
		break;
		case AMPLE_PEC_ST:	/* 3.3.0 hab */
		bTestValue = testAmplePunctEnvirons(left, current, strp, len,
							 pAmple_in);
		break;
		case AMPLE_ADHOC_ST:
		bTestValue = testAmpleAdhocPairs(left, current, strp, len);
		break;
		case AMPLE_ROOTS_ST:
		bTestValue = testAmpleCompoundRoots(left, current, strp, len,
							pAmple_in);
		break;
		case AMPLE_SP_TEST:
		if (flp->bUsesPrevWord)
			bUsesPrevWord_m = TRUE;
		if (flp->bUsesNextWord)
			bUsesNextWord_m = TRUE;
		if (bUseSurroundingWords_m)
			{
			if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = testAmpleUserDefined(left, current,
							  strp, len,
							  flp->pTestTree,
							  pAmple_in);
			else
			bTestValue = TRUE;
			}
		else
			{
			if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = TRUE;
			else
			bTestValue = testAmpleUserDefined(left, current,
							  strp, len,
							  flp->pTestTree,
							  pAmple_in);
			}
		break;
		default:
		bTestValue = FALSE;
		break;
		}
	if (bTestValue == FALSE)
		{
		if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
		p_trace("Prefix", flp, pAmple_in);
		flp->uiTestFailCount++;
		return(FALSE);
		}
	}
	}
return(TRUE);

} /* end performAmplePrefixTests() */

/***************************************************************************
 * NAME
 *    performAmpleInfixTests
 * ARGUMENTS
 *    left    - pointer to the morpheme to the left in the headlist
 *    current - pointer to current morpheme in the headlist
 *    strp    - pointer to allomorph in the word
 *    len     - length of the allomorph string
 * DESCRIPTION
 *    Work through the list of infix tests.
 * RETURN VALUE
 *    nonzero if all Infix Successor tests succeed, zero if any of them fail
 */
static int performAmpleInfixTests( left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
AmpleTestList *	flp;
int		bTestValue;

pszAmpleTestErrorHeader_m = "INFIX TEST: ";
for (	flp = pAmple_in->pInfixSuccTests,
				pAdhocList_m = pAmple_in->pInfixAdhocPairs ;
	flp != NULL ;
	flp = flp->pNext )
	{
	/*
	 *	if at beginning of word, call only testAmpleStringEnvirons()
	 */
	if ((left != (AmpleHeadList *)NULL)  ||
	(flp->eFunction == AMPLE_SEC_ST) ||
	(flp->eFunction == AMPLE_PEC_ST)) /* 3.3.0 hab */
	{
	flp->uiTestCallCount++;
	switch (flp->eFunction)
		{
		case AMPLE_SEC_ST:
		bTestValue = testAmpleStringEnvirons(left, current, strp, len,
							 pAmple_in);
		break;
		case AMPLE_PEC_ST:	/* 3.3.0 hab */
		bTestValue = testAmplePunctEnvirons(left, current, strp, len,
							 pAmple_in);
		break;
		case AMPLE_ADHOC_ST:
		bTestValue = testAmpleAdhocPairs(left, current, strp, len);
		break;
		case AMPLE_ROOTS_ST:
		bTestValue = testAmpleCompoundRoots(left, current, strp, len,
							pAmple_in);
		break;
		case AMPLE_SP_TEST:
		if (flp->bUsesPrevWord)
			bUsesPrevWord_m = TRUE;
		if (flp->bUsesNextWord)
			bUsesNextWord_m = TRUE;
		if (bUseSurroundingWords_m)
			{
			if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = testAmpleUserDefined(left, current,
							  strp, len,
							  flp->pTestTree,
							  pAmple_in);
			else
			bTestValue = TRUE;
			}
		else
			{
			if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = TRUE;
			else
			bTestValue = testAmpleUserDefined(left, current,
							  strp, len,
							  flp->pTestTree,
							  pAmple_in);
			}
		break;
		default:
		bTestValue = FALSE;
		break;
		}
	if (bTestValue == FALSE)
		{
		if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
		p_trace("Infix", flp, pAmple_in);
		flp->uiTestFailCount++;
		return(FALSE);
		}
	}
	}
return(TRUE);

} /* end performAmpleInfixTests() */

/***************************************************************************
 * NAME
 *    performAmpleInterfixTests
 * ARGUMENTS
 *    left    - pointer to the morpheme to the left in the headlist
 *    current - pointer to current morpheme in the headlist
 *    strp    - pointer to allomorph in the word
 *    len     - length of the allomorph string
 * DESCRIPTION
 *    Work through the list of interfix tests.
 * RETURN VALUE
 *    nonzero if all Interfix Successor tests succeed, zero if any of them fail
 */
static int performAmpleInterfixTests( left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
AmpleTestList *	flp;
int		bTestValue;

pszAmpleTestErrorHeader_m = "INTERFIX TEST: ";
for (	flp = pAmple_in->pInterfixSuccTests,
				pAdhocList_m = pAmple_in->pInterfixAdhocPairs ;
	flp != NULL ;
	flp = flp->pNext )
	{
	/*
	 *	if at beginning of word, call only testAmpleStringEnvirons()
	 */
	if ((left != (AmpleHeadList *)NULL)  ||
	(flp->eFunction == AMPLE_SEC_ST) ||
	(flp->eFunction == AMPLE_PEC_ST)) /* 3.3.0 hab */
	{
	flp->uiTestCallCount++;
	switch (flp->eFunction)
		{
		case AMPLE_SEC_ST:
		bTestValue = testAmpleStringEnvirons(left, current, strp, len,
							 pAmple_in);
		break;
		case AMPLE_PEC_ST:	/* 3.3.0 hab */
		bTestValue = testAmplePunctEnvirons(left, current, strp, len,
							 pAmple_in);
		break;
		case AMPLE_ADHOC_ST:
		bTestValue = testAmpleAdhocPairs(left, current, strp, len);
		break;
		case AMPLE_ROOTS_ST:
		bTestValue = testAmpleCompoundRoots(left, current, strp, len,
							pAmple_in);
		break;
		case AMPLE_SP_TEST:
		if (flp->bUsesPrevWord)
			bUsesPrevWord_m = TRUE;
		if (flp->bUsesNextWord)
			bUsesNextWord_m = TRUE;
		if (bUseSurroundingWords_m)
			{
			if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = testAmpleUserDefined(left, current,
							  strp, len,
							  flp->pTestTree,
							  pAmple_in);
			else
			bTestValue = TRUE;
			}
		else
			{
			if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = TRUE;
			else
			bTestValue = testAmpleUserDefined(left, current,
							  strp, len,
							  flp->pTestTree,
							  pAmple_in);
			}
		break;
		default:
		bTestValue = FALSE;
		break;
		}
	if (bTestValue == FALSE)
		{
		if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
		p_trace("Interfix", flp, pAmple_in);
		flp->uiTestFailCount++;
		return(FALSE);
		}
	}
	}
return(TRUE);

} /* end performAmpleInterfixTests() */

/***************************************************************************
 * NAME
 *    performAmpleRootTests
 * ARGUMENTS
 *    left    - pointer to the morpheme to the left in the headlist
 *    current - pointer to current morpheme in the headlist
 *    strp    - pointer to allomorph in the word
 *    len     - length of the allomorph string
 * DESCRIPTION
 *    Work through the list of root tests.
 * RETURN VALUE
 *    nonzero if all Root Successor tests succeed, zero if any of them fail
 */
static int performAmpleRootTests( left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
AmpleTestList *	flp;
int		bTestValue;

pszAmpleTestErrorHeader_m = "ROOT TEST: ";
for (	flp = pAmple_in->pRootSuccTests,
				pAdhocList_m = pAmple_in->pRootAdhocPairs ;
	flp != NULL ;
	flp = flp->pNext )
	{
	/*
	 *	if at beginning of word, call only testAmpleStringEnvirons()
	 */
	if ((left != (AmpleHeadList *)NULL)  ||
	(flp->eFunction == AMPLE_SEC_ST) ||
	(flp->eFunction == AMPLE_PEC_ST)) /* 3.3.0 hab */
	{
	flp->uiTestCallCount++;
	switch (flp->eFunction)
		{
		case AMPLE_SEC_ST:
		bTestValue = testAmpleStringEnvirons(left, current, strp, len,
							 pAmple_in);
		break;
		case AMPLE_PEC_ST:	/* 3.3.0 hab */
		bTestValue = testAmplePunctEnvirons(left, current, strp, len,
							 pAmple_in);
		break;
		case AMPLE_ADHOC_ST:
		bTestValue = testAmpleAdhocPairs(left, current, strp, len);
		break;
		case AMPLE_ROOTS_ST:
		bTestValue = testAmpleCompoundRoots(left, current, strp, len,
							pAmple_in);
		break;
		case AMPLE_SP_TEST:
		if (flp->bUsesPrevWord)
			bUsesPrevWord_m = TRUE;
		if (flp->bUsesNextWord)
			bUsesNextWord_m = TRUE;
		if (bUseSurroundingWords_m)
			{
			if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = testAmpleUserDefined(left, current,
							  strp, len,
							  flp->pTestTree,
							  pAmple_in);
			else
			bTestValue = TRUE;
			}
		else
			{
			if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = TRUE;
			else
			bTestValue = testAmpleUserDefined(left, current,
							  strp, len,
							  flp->pTestTree,
							  pAmple_in);
			}
		break;
		default:
		bTestValue = FALSE;
		break;
		}
	if (bTestValue == FALSE)
		{
		if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
		p_trace("Root", flp, pAmple_in);
		flp->uiTestFailCount++;
		return(FALSE);
		}
	}
	}
return(TRUE);

} /* end performAmpleRootTests() */

/***************************************************************************
 * NAME
 *    performAmpleSuffixTests
 * ARGUMENTS
 *    left    - pointer to the morpheme to the left in the headlist
 *    current - pointer to current morpheme in the headlist
 *    strp    - pointer to allomorph in the word
 *    len     - length of the allomorph string
 * DESCRIPTION
 *    Work through the list of suffix tests.
 * RETURN VALUE
 *    nonzero if all Suffix Successor tests succeed, zero if any of them fail
 */
static int performAmpleSuffixTests( left, current, strp, len, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleData *	pAmple_in;
{
AmpleTestList *	flp;
int		bTestValue;

pszAmpleTestErrorHeader_m = "SUFFIX TEST: ";
for (	flp = pAmple_in->pSuffixSuccTests,
				pAdhocList_m = pAmple_in->pSuffixAdhocPairs ;
	flp != NULL ;
	flp = flp->pNext )
	{
	flp->uiTestCallCount++;
	switch (flp->eFunction)
	{
	case AMPLE_SEC_ST:
		bTestValue = testAmpleStringEnvirons(left, current, strp, len,
						 pAmple_in);
		break;
	  case AMPLE_PEC_ST:	/* 3.3.0 hab */
		bTestValue = testAmplePunctEnvirons(left, current, strp, len,
						pAmple_in);
		break;
	case AMPLE_ADHOC_ST:
		bTestValue = testAmpleAdhocPairs(left, current, strp, len);
		break;
	case AMPLE_ROOTS_ST:
		bTestValue = testAmpleCompoundRoots(left, current, strp, len,
						pAmple_in);
		break;
	case AMPLE_SP_TEST:
		if (flp->bUsesPrevWord)
		bUsesPrevWord_m = TRUE;
		if (flp->bUsesNextWord)
		bUsesNextWord_m = TRUE;
		if (bUseSurroundingWords_m)
		{
		if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = testAmpleUserDefined(left, current,
							  strp, len,
							  flp->pTestTree,
							  pAmple_in);
		else
			bTestValue = TRUE;
		}
		else
		{
		if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = TRUE;
		else
			bTestValue = testAmpleUserDefined(left, current, strp, len,
							  flp->pTestTree,
							  pAmple_in);
			}
		break;
	default:
		bTestValue = FALSE;
		break;
	}
	if (bTestValue == FALSE)
	{
	if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
		p_trace("Suffix", flp, pAmple_in);
	flp->uiTestFailCount++;
	return(FALSE);
	}
	}
return(TRUE);

} /* end performAmpleSuffixTests() */

/***************************************************************************
 * NAME
 *    performAmpleFinalTests
 * ARGUMENTS
 *    anal - pointer to the final morpheme in the headlist
 * DESCRIPTION
 *    Work through the list of final tests.  These apply to a completed
 *    analysis which has reached the end of the word.
 * RETURN VALUE
 *    nonzero if all Final tests succeed, zero if any of them fail
 */
static int performAmpleFinalTests(anal, pAmple_in)
AmpleHeadList *	anal;
AmpleData *	pAmple_in;
{
AmpleHeadList *	ph;
AmpleTestList *	flp;
char *		surface;
int		bTestValue;

for (	flp = pAmple_in->pFinalTests,
				pszAmpleTestErrorHeader_m = "FINAL TEST: " ;
	flp != NULL ;
	flp = flp->pNext )
	 {
	 flp->uiTestCallCount++;
	 /*
	  * apply the test for each headlist element from right to left
	  */
	 surface = pszSurfaceForm_m + strlen(pszSurfaceForm_m);
	 for ( ph = anal ; ph != (AmpleHeadList *)NULL ; ph = ph->pLeft )
	{
	surface -= ph->uiAllomorphLength;
	switch (flp->eFunction)
		{
		case AMPLE_MEC_FT:
		bTestValue = testAmpleMorphEnvirons(ph->pLeft, ph, surface,
							ph->uiAllomorphLength,
							pAmple_in);
		break;
		case AMPLE_MCC_FT:
		bTestValue = testAmpleMorphsCo_occur(ph->pLeft, ph, surface,
							 ph->uiAllomorphLength,
							 pAmple_in);
		break;
#ifdef EXPERIMENTAL
#ifndef hab350
		case AMPLE_ANCC_FT:
		bTestValue = testAmpleNeverEnvirons(ph->pLeft, ph, surface,
							ph->uiAllomorphLength,
							pAmple_in);
		break;
#endif /* hab350 */
#endif /* EXPERIMENTAL */
		case AMPLE_SP_TEST:
		if (flp->bUsesPrevWord)
			bUsesPrevWord_m = TRUE;
		if (flp->bUsesNextWord)
			bUsesNextWord_m = TRUE;
		if (bUseSurroundingWords_m)
			{
			if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = testAmpleUserDefined(ph->pLeft, ph,
							  surface,
							 ph->uiAllomorphLength,
							  flp->pTestTree,
							  pAmple_in);
			else
			bTestValue = TRUE;
			}
		else
			{
			if (flp->bUsesPrevWord || flp->bUsesNextWord)
			bTestValue = TRUE;
			else
			bTestValue = testAmpleUserDefined(ph->pLeft, ph,
							  surface,
							 ph->uiAllomorphLength,
							  flp->pTestTree,
							  pAmple_in);
			}
		break;
		default:
		bTestValue = FALSE;
		break;
		}
	if (bTestValue == FALSE)
		{
		if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
		{
		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
			pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			store_AMPLE_trace(pAmple_in, "\n  ", NULL);
		p_trace("Final", flp, pAmple_in);
		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
			pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			{
			char *	pszIndent;
#ifdef HAVE_ALLOCA
			pszIndent = (char *)alloca(
					   (2*iTracingDepth_m+1)*sizeof(char));
#else
			pszIndent = (char *)allocMemory(
					   (2*iTracingDepth_m+1)*sizeof(char));
#endif
			sprintf(pszIndent, "%*s", 2*iTracingDepth_m, "");
			store_AMPLE_trace(pAmple_in, "%s</parseNode>\n",
					  pszIndent);
#ifndef HAVE_ALLOCA
			freeMemory(pszIndent);
#endif
			}
		}
		flp->uiTestFailCount++;
		return(FALSE);
		}
	}
   }
return(TRUE);
} /* end of performAmpleFinalTests() */

/***************************************************************************
 * NAME
 *    p_trace
 * ARGUMENTS
 *    ptype - type of test string ("prefix", "root", etc.)
 *    flp   - pointer to function list structure of the predicate
 * DESCRIPTION
 *    Print the name of a test which failed.
 * RETURN VALUE
 *    none
 */
static void p_trace(ptype, flp, pAmple_in)
char *		ptype;
AmpleTestList *	flp;
AmpleData *	pAmple_in;
{
char *	pszStr;
size_t	uiSize;
size_t	uiMaxSize;

if ((pAmple_in->pLogFP == NULL) && (pAmple_in->pszTrace == NULL))
	return;

if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in, szTraceTab_m, NULL);
	store_AMPLE_trace(pAmple_in, ptype, NULL);
	store_AMPLE_trace(pAmple_in, " test %s failed.\n", flp->pszName);
	}
else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
	 pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	{
	switch (flp->eFunction)
	{
	case AMPLE_SEC_ST:
	case AMPLE_PEC_ST:
	case AMPLE_MEC_FT:
	case AMPLE_MCC_FT:
#ifdef EXPERIMENTAL
#ifndef hab350
	case AMPLE_ANCC_FT:
#endif /* hab350 */
#endif /* EXPERIMENTAL */
		break;		/* these have been handled already */
	default:
		uiMaxSize = 2 * iTracingDepth_m;
		uiSize = lengthAmpleCDATA(flp->pszName, FALSE);
		if (uiMaxSize < uiSize)
		uiMaxSize = uiSize;
#ifdef HAVE_ALLOCA
		pszStr = (char *)alloca(uiMaxSize + 1);
#else
		pszStr = (char *)allocMemory(uiMaxSize + 1);
#endif
		sprintf(pszStr, "%*s", 2*iTracingDepth_m, "");
		store_AMPLE_trace(pAmple_in, pszStr, NULL);
		storeAmpleCDATA(pszStr, flp->pszName, FALSE);
		if (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML)
		  store_AMPLE_trace(pAmple_in, "  <failure test=\"%s\"/>\n", pszStr);
		else
		  store_AMPLE_trace(pAmple_in, "  <failure test=\"%s\">\n", pszStr);
#ifndef HAVE_ALLOCA
		freeMemory(pszStr);
#endif
		break;
	}
	}
}

/*==========================================================================*/
/*====									====*/
/*====		THE REMAINING FUNCTIONS ALL HAVE TO DO WITH		====*/
/*====		    INTERPRETING THE USER DEFINED TESTS.		====*/
/*====									====*/
/*==========================================================================*/

/***************************************************************************
 * NAME
 *    testAmpleUserDefined
 * ARGUMENTS
 *    left    = pointer to the morpheme to the left of the current one
 *    current = pointer the current morpheme in the headlist
 *    strp    = pointer to the surface string of the current morpheme
 *    len     = length of the surface string of the current morpheme
 *    tree    = pointer to the root factor of the syntax tree of an test_node
 * DESCRIPTION
 *    Evaluate a user defined test, stored as a binary parse tree.
 * RETURN VALUE
 *    TRUE if the test succeeds, FALSE if it fails
 */
static int testAmpleUserDefined( left, current, strp, len, tree, pAmple_in)
AmpleHeadList *	left;
AmpleHeadList *	current;
char *		strp;
int		len;
AmpleTestNode *	tree;
AmpleData *	pAmple_in;
{
/*
 *  store the invariant values for the tree walk
 */
pTestCurrent_m    = current;
pszTestString_m	  = strp;
iTestAlloLength_m = len;
pTestTreeRoot_m	  = tree;	/* save the root node for error messages */
/*
 *  initialize for each test
 */
pForLeft_m	= (AmpleHeadList *)NULL;
pForRight_m = (AmpleHeadList *)NULL;

return( utest( tree->uLeft.pChild, pAmple_in) );
}

/***************************************************************************
 * NAME
 *    get_allo
 * ARGUMENTS
 *    morph - pointer to a morpheme in the headlist
 * DESCRIPTION
 *    Copy the surface string for this morpheme from word->pszWord
 * RETURNS:
 *    pointer to a dynamically allocated copy of the allomorph string
 */
static char * get_allo(morph)
AmpleHeadList *morph;
{
char *pszAllo = NULL;
unsigned uiAlloSize = 0;
char *p;
AmpleHeadList *hp;

if (morph == pTestCurrent_m)
	{					/* handle the easy case first */
	uiAlloSize = iTestAlloLength_m + 1;
	pszAllo = strncpy( allocMemory(uiAlloSize), pszTestString_m, iTestAlloLength_m );
	return( pszAllo );			/* return its address */
	}

for (	hp = pAmpleLeftHead_m, p = pszSurfaceForm_m ;
	(hp != (AmpleHeadList *)NULL) && (hp != morph) ;
	hp = hp->pRight )
	p += hp->uiAllomorphLength;		/* move pointer to allomorph */

if ((hp == (AmpleHeadList *)NULL) || (hp->uiAllomorphLength == 0))
	return( duplicateString("") );	/* nothing found or size zero */

uiAlloSize = hp->uiAllomorphLength + 1;
pszAllo = strncpy( allocMemory(uiAlloSize), p, hp->uiAllomorphLength );
return( pszAllo );			/* return its address */
}

/***************************************************************************
 * NAME
 *    getpos
 * ARGUMENTS
 *    pos - position code stored in a test tree leaf node
 * DESCRIPTION
 *    Get the pointer to the desired morpheme in the headlist.
 * RETURNS:
 *    pointer to headlist node, or NULL if invalid position code
 */
static AmpleHeadList *getpos(pos)
int pos;
{
switch (pos)
	{
	case ARGCURRENT:	return( pTestCurrent_m );
	case ARGLEFT:	return( pTestCurrent_m->pLeft );
	case ARGRIGHT:	return( pTestCurrent_m->pRight );
	case FORLEFT:	return( pForLeft_m );
	case FORRIGHT:	return( pForRight_m );
	case INITIALM:	return( pAmpleLeftHead_m );
	case FINALM:	return( pAmpleRightHead_m );
	}
return( (AmpleHeadList *)NULL );
}

/***************************************************************************
 * NAME
 *    get_surf
 * ARGUMENTS
 *    pos   - position argument from test tree node
 * DESCRIPTION
 *    Obtain the surface string from word->pszWord for this morpheme
 * RETURNS:
 *    pointer to the allomorph string
 */
static char *get_surf(pos)
int pos;
{
AmpleHeadList *morph;
char *p;
int k;
AmpleHeadList *hp;
int uiSurfaceSize = 0;

pszTempSurface_m = (char *)NULL;
/*
 *  take short cuts for the ones we know for sure
 */
if (pos == ARGCURRENT)
	return( pszTestString_m );		/* we always know current string location */
else if (pos == ARGRIGHT)
	return( pszTestString_m + iTestAlloLength_m );	/* next to the right is easy as well */
/*
 *  figure out which morpheme we want
 */
morph = getpos(pos);
if (morph == (AmpleHeadList *)NULL)
	return( (char *)NULL );		/* don't know this morpheme */

for (	p = pszSurfaceForm_m, hp = pAmpleLeftHead_m ;
	hp != morph ;
	hp = hp->pRight )
	{
	if (hp == (AmpleHeadList *)NULL)
	return( (char *)NULL );		/* something's wrong! */
	k = hp->uiAllomorphLength;		/* adjust pointer to allomorph */
	p += k;
	}

if (p >= pszSurfaceForm_m + strlen(pszSurfaceForm_m))
	return( "" );		/* nothing found ??? */

if ((pos == ARGLEFT) || (pos == FORLEFT) || (pos == INITIALM))
	{
	/* to the left (from beginning) */
	/* add in the current allomorph */
	/* allocate some memory */
	/* copy the string */
	p += hp->uiAllomorphLength;
	uiSurfaceSize = p - pszSurfaceForm_m;
	pszTempSurface_m = allocMemory(uiSurfaceSize+1);
	strncpy(pszTempSurface_m, pszSurfaceForm_m, uiSurfaceSize);
	pszTempSurface_m[uiSurfaceSize] = NUL;
	return( pszTempSurface_m );
	}
else					/* to the right (from end) */
	return( p );			/* nothing could be simpler */
}

/***************************************************************************
 * NAME
 *    get_punct    3.3.0 hab
 * ARGUMENTS
 *    pos   - position argument from test tree node
 * DESCRIPTION
 *    Obtain the format marker field (for pos = LAST) or trailing
 *    non-alphabetic field string (for pos = NEXT) from pCurrentWord_m
 * RETURNS:
 *    pointer to the appropriate string
 */
static char *get_punct(pos)
int pos;
{
if (pos == LAST)
	return( pCurrentWord_m->pTemplate->pszFormat );
else if (pos == NEXT)
	return( pCurrentWord_m->pTemplate->pszNonAlpha );
return( (char *)NULL );		/* only valid for LAST and NEXT */
}

/***************************************************************************
 * NAME
 *    get_from
 * ARGUMENTS
 *    hp - pointer to headlist node
 * DESCRIPTION
 *    Get the fromcategory of the node
 * RETURN VALUE
 *    the fromcategory of the node
 */
static int get_from(hp)
AmpleHeadList *hp;
{
if (hp->eType == AMPLE_ROOT)
	return( hp->iROOTCATEG & 0377 );
return( hp->iFromCategory & 0377 );
}

/***************************************************************************
 * NAME
 *    get_to
 * ARGUMENTS
 *    hp - pointer to headlist node
 * DESCRIPTION
 *    Get the tocategory of the node
 * RETURN VALUE
 *    the tocategory of the node
 */
static int get_to(hp)
AmpleHeadList *hp;
{
if (hp->eType == AMPLE_ROOT)
	return( hp->iROOTCATEG & 0377 );
return( hp->iToCategory & 0377 );
}

/***************************************************************************
 * NAME
 *    utest
 * ARGUMENTS
 *    tree - pointer to a node in the syntax tree of a test
 * DESCRIPTION
 *    Traverse the syntax tree structure in postorder fashion,
 *    calculating the truth value of the test in the process.
 *    This function is highly recursive.
 * RETURN VALUE
 *    TRUE if the test succeeds, FALSE if it fails
 */
static int utest( tree, pAmple_in)
AmpleTestNode *	tree;
AmpleData *	pAmple_in;
{
AmpleHeadList *	hp;
AmpleHeadList *	hp2;
int		val;
int		rval;
int		lval;
char *		p;
char *		pszAllo;
char *		pszAllo2;
char **		paPrevSurfaceForms = NULL;
char **		paNextSurfaceForms = NULL;
char **		paSurfaceForms;
size_t		i;
AmpleLeftSide	left;
AmpleRightSide	right;

if (tree == (AmpleTestNode *)NULL)
	return( TRUE );			/* no test => TRUE */
/*
 *  put in variables for efficiency -- use largest elements of the unions
 */
left.pChild	= tree->uLeft.pChild;
right.pszString = tree->uRight.pszString;

if ((pPreviousWord_m != NULL) && (pPreviousWord_m->pTemplate != NULL))
	paPrevSurfaceForms = pPreviousWord_m->pTemplate->paWord;
if ((pNextWord_m != NULL) && (pNextWord_m->pTemplate != NULL))
	paNextSurfaceForms = pNextWord_m->pTemplate->paWord;

hp  = (AmpleHeadList *)NULL;
hp2 = (AmpleHeadList *)NULL;
val = FALSE;				/* let's be pessimistic */

switch (tree->iOpCode & OP_MASK)
	{
				/*
				 *  these nodes have subtrees
				 */
	case LOGAND:		/* 'AND' */
	val = (utest( left.pChild, pAmple_in) &&
		   utest( right.pChild, pAmple_in));
	break;

	case LOGOR:			/* 'OR' */
	val = (utest( left.pChild, pAmple_in) ||
		   utest( right.pChild, pAmple_in));
	break;

	case LOGXOR:		/* 'XOR' */
	lval = utest( left.pChild, pAmple_in);
	rval = utest( right.pChild, pAmple_in);
	val = ((!lval && rval) || (lval && !rval));
	break;

	case LOGIFF:		/* 'IFF' */
	lval = utest( left.pChild, pAmple_in);
	rval = utest( right.pChild, pAmple_in);
	val = ((lval && rval) || (!lval && !rval));
	break;

	case LOGIF:			/* 'IF' ... 'THEN' */
	val = ( !utest(left.pChild, pAmple_in) ||
		utest(right.pChild, pAmple_in) );
	break;

	case ALL_LEFT:		/* 'FOR_ALL_LEFT' */
	for (	pForLeft_m = pTestCurrent_m->pLeft, val = TRUE ;
		(pForLeft_m != (AmpleHeadList *)NULL) && (val == TRUE) ;
		pForLeft_m = pForLeft_m->pLeft )
		{
		val = utest( left.pChild, pAmple_in);
		}
	break;

	case SOME_LEFT:		/* 'FOR_SOME_LEFT' */
	for (	pForLeft_m = pTestCurrent_m->pLeft, val = FALSE ;
		pForLeft_m != (AmpleHeadList *)NULL ;
		pForLeft_m = pForLeft_m->pLeft )
		{
		val = utest( left.pChild, pAmple_in);
		if (val)
		break;		/* need to preserve pointer value */
		}
	break;

	case ALL_RIGHT:		/* 'FOR_ALL_RIGHT' */
	for (	pForRight_m = pTestCurrent_m->pRight, val = TRUE ;
		(pForRight_m != (AmpleHeadList *)NULL) && (val == TRUE) ;
		pForRight_m = pForRight_m->pRight )
		{
		val = utest( left.pChild, pAmple_in);
		}
	break;

	case SOME_RIGHT:	/* 'FOR_SOME_RIGHT' */
	for (	pForRight_m = pTestCurrent_m->pRight, val = FALSE ;
		pForRight_m != (AmpleHeadList *)NULL ;
		pForRight_m = pForRight_m->pRight )
		{
		val = utest(left.pChild, pAmple_in);
		if (val)
		break;		/* need to preserve pointer value */
		}
	break;
				/*
				 *  the rest of these are leaf nodes
				 */
	case PROP_IS:	/* 'property' 'is' IDENTIFIER */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		(right.uiProperty != 0) )
		{
		/* Check property */
		val = hasAmpleProperty( hp->pAllomorph->sPropertySet,
					right.uiProperty,
					&pAmple_in->sProperties);
		}
	break;

	case MORPH_IS:	/* 'morphname' 'is' STRING */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (strcmp(hp->pAllomorph->pMORPHNAME, right.pszString) == 0);
		}
	break;

	case MORPH_MEMBER:	/* 'morphname' 'is' 'member' IDENTIFIER */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = isAmpleMorphClassMember(hp->pAllomorph->pMORPHNAME,
					  right.pMorphClass);
		}
	break;

	case MOR_IS_MORPH: /* 'morphname' 'is' POSITION 'morphname' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (strcmp(hp->pAllomorph->pMORPHNAME,
			  hp2->pAllomorph->pMORPHNAME) == 0);
		}
	break;

	case ALLO_IS:	/* 'allomorph' 'is'  STRING */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		(right.pszString != (char *)NULL) )
		{
		pszAllo = get_allo(hp);
		val = (strcmp( pszAllo, right.pszString) == 0);
		freeMemory(pszAllo);
		}
	break;

	case ALLO_MEMBER:	/* 'allomorph' 'is' 'member' IDENTIFIER */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		pszAllo = get_allo(hp);
		val = isStringClassMember( pszAllo, right.pStringClass);
		freeMemory(pszAllo);
		}
	break;

	case ALLO_IS_AL:	/* 'allomorph' 'is' POSITION 'allomorph' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		pszAllo  = get_allo(hp);
		pszAllo2 = get_allo(hp2);
		val = (strcmp(pszAllo, pszAllo2) == 0);
		freeMemory(pszAllo);
		freeMemory(pszAllo2);
		}
	break;

	case ALLO_MATCH:	/* 'allomorph' 'matches'  STRING */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		pszAllo = get_allo(hp);
		if (    (left.iPosition == ARGLEFT) ||
			(left.iPosition == FORLEFT) ||
			(left.iPosition == INITIALM) )
		{					/* match end */
		val = matchEnd(pszAllo, right.pszString);
		}
		else
		{					/* match beginning */
		val = matchBeginning(pszAllo, right.pszString);
		}
		freeMemory(pszAllo);
		}
	break;

	case AL_MAT_MEM: /* 'allomorph' 'matches' 'member' IDENTIFIER */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		pszAllo = get_allo(hp);
		if (    (left.iPosition == ARGLEFT) ||
			(left.iPosition == FORLEFT) ||
			(left.iPosition == INITIALM) )
		{					/* match end */
		val = matchEndWithStringClass(pszAllo,
						  right.pStringClass);
		}
		else
		{					/* match beginning */
		val = matchBeginWithStringClass(pszAllo,
						right.pStringClass);
		}
		freeMemory(pszAllo);
		}
	break;

	case AL_MAT_AL:	/* 'allomorph' 'matches' POSITION 'allomorph' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		pszAllo  = get_allo(hp);
		pszAllo2 = get_allo(hp2);
		if (    (left.iPosition == ARGLEFT) ||
			(left.iPosition == FORLEFT) ||
			(left.iPosition == INITIALM) )
		val = matchEnd(pszAllo, pszAllo2);
		else
		val = matchBeginning(pszAllo, pszAllo2);
		freeMemory(pszAllo);
		freeMemory(pszAllo2);
		}
	break;

	case STRING_IS:	/* 'string' 'is'  STRING */
	if (	(right.pszString != (char *)NULL) &&
		((p = get_surf(left.iPosition)) != (char *)NULL) )
		{
		val = (strcmp( p, right.pszString ) == 0);
		if (p == pszTempSurface_m)
		{
		freeMemory( pszTempSurface_m );
		pszTempSurface_m = NULL;
		}
		}
	break;

	case STRING_MEMBER: /* 'string' 'is' 'member' IDENTIFIER */
	if ((p = get_surf(left.iPosition)) != (char *)NULL)
		{
		val = isStringClassMember( p, right.pStringClass );
		if (p == pszTempSurface_m)
		{
		freeMemory( pszTempSurface_m );
		pszTempSurface_m = NULL;
		}
		}
	break;

	case ST_IS_AL:	/* 'string' 'is' POSITION 'allomorph' */
	if (	((hp2 = getpos(right.iValue)) != (AmpleHeadList *)NULL) &&
		((p = get_surf(left.iPosition)) != (char *)NULL) )
		{
		pszAllo2 = get_allo(hp2);
		val = (strcmp( p, pszAllo2 ) == 0);
		freeMemory(pszAllo2);
		if (p == pszTempSurface_m)
		{
		freeMemory( pszTempSurface_m );
		pszTempSurface_m = NULL;
		}
		}
	break;

	case ST_MATCH:	/* 'string' 'matches'  STRING */
	if (	(right.pszString != (char *)NULL) &&
		((p = get_surf(left.iPosition)) != (char *)NULL) )
		{
		if (    (left.iPosition == ARGLEFT) ||
			(left.iPosition == FORLEFT) ||
			(left.iPosition == INITIALM) )
		{
		val = matchEnd( p, right.pszString );
		}
		else
		{
		val = matchBeginning( p, right.pszString );
		}
		if (p == pszTempSurface_m)
		{
		freeMemory( pszTempSurface_m );
		pszTempSurface_m = NULL;
		}
		}
	break;

	case ST_MAT_MEM: /* 'string' 'matches' 'member' IDENTIFIER */
	if ((p = get_surf(left.iPosition)) != (char *)NULL)
		{
		if (    (left.iPosition == ARGLEFT) ||
			(left.iPosition == FORLEFT) ||
			(left.iPosition == INITIALM) )
		{					/* match end */
		val = matchEndWithStringClass( p, right.pStringClass );
		}
		else
		{					/* match beginning */
		val = matchBeginWithStringClass( p, right.pStringClass );
		}
		if (p == pszTempSurface_m)
		{
		freeMemory( pszTempSurface_m );
		pszTempSurface_m = NULL;
		}
		}
	break;

	case ST_MAT_AL: /* 'string' 'matches' POSITION 'allomorph' */
	if (	((hp2 = getpos(right.iValue)) != (AmpleHeadList *)NULL) &&
		((p = get_surf(left.iPosition)) != (char *)NULL) )
		{
		pszAllo2 = get_allo(hp2);
		if (    (left.iPosition == ARGLEFT) ||
			(left.iPosition == FORLEFT) ||
			(left.iPosition == INITIALM) )
		{
		val = matchEnd( p, pszAllo2 );
		}
		else
		{
		val = matchBeginning( p, pszAllo2 );
		}
		freeMemory(pszAllo2);
		if (p == pszTempSurface_m)
		{
		freeMemory( pszTempSurface_m );
		pszTempSurface_m = NULL;
		}
		}
	break;

	case WORD_IS:	/* 'word' 'is' STRING */
	if (right.pszString != (char *)NULL)
		{
		val = FALSE;
		paSurfaceForms = (left.iPosition == LAST) ? paPrevSurfaceForms :
							paNextSurfaceForms ;
		if (paSurfaceForms != NULL)
		{
		for ( i = 0 ; paSurfaceForms[i] ; ++i )
			{
			if (strcmp(paSurfaceForms[i], right.pszString) == 0)
			{
			val = TRUE;
			break;
			}
			}
		}
		if ((pNextWord_m == NULL) && (left.iPosition != LAST))
		pAmple_in->bMultiDependency = TRUE;
		}
	break;

	case WORD_MEMBER:	/* 'word' 'is' 'member' IDENTIFIER */
	if (right.pStringClass != (StringClass *)NULL)
		{
		val = FALSE;
		paSurfaceForms = (left.iPosition == LAST) ? paPrevSurfaceForms :
							paNextSurfaceForms ;
		if (paSurfaceForms != NULL)
		{
		for ( i = 0 ; paSurfaceForms[i] ; ++i )
			{
			if (isStringClassMember(paSurfaceForms[i],
						right.pStringClass))
			{
			val = TRUE;
			break;
			}
			}
		}
		if ((pNextWord_m == NULL) && (left.iPosition != LAST))
		pAmple_in->bMultiDependency = TRUE;
		}
	break;

	case WORD_MATCH:	/* 'word' 'matches'  STRING */
	if (right.pszString != (char *)NULL)
		{
		val = FALSE;
		if (left.iPosition == LAST)
		{
		if (paPrevSurfaceForms != NULL)
			{
			for ( i = 0 ; paPrevSurfaceForms[i] ; ++i )
			{
			if (matchEnd(paPrevSurfaceForms[i], right.pszString))
				{
				val = TRUE;
				break;
				}
			}
			}
		}
		else
		{
		if (paNextSurfaceForms != NULL)
			{
			for ( i = 0 ; paNextSurfaceForms[i] ; ++i )
			{
			if (matchBeginning(paNextSurfaceForms[i],
					   right.pszString))
				{
				val = TRUE;
				break;
				}
			}
			}
		}
		if ((pNextWord_m == NULL) && (left.iPosition != LAST))
		pAmple_in->bMultiDependency = TRUE;
		}
	break;

	case WD_MAT_MEM: /* 'word' 'matches' 'member' IDENTIFIER */
	if (right.pStringClass != (StringClass *)NULL)
		{
		val = FALSE;
		if (left.iPosition == LAST)
		{
		if (paPrevSurfaceForms != NULL)
			{
			for ( i = 0 ; paPrevSurfaceForms[i] ; ++i )
			{
			if (matchEndWithStringClass(paPrevSurfaceForms[i],
							right.pStringClass))
				{
				val = TRUE;
				break;
				}
			}
			}
		}
		else
		{
		if (paNextSurfaceForms != NULL)
			{
			for ( i = 0 ; paNextSurfaceForms[i] ; ++i )
			{
			if (matchBeginWithStringClass(paNextSurfaceForms[i],
							  right.pStringClass))
				{
				val = TRUE;
				break;
				}
			}
			}
		}
		if ((pNextWord_m == NULL) && (left.iPosition != LAST))
		pAmple_in->bMultiDependency = TRUE;
		}
	break;

	case TYPE_IS:	/* 'type' 'is' <type> */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		if (right.iValue == WINITIAL)
		val = (hp->pLeft == (AmpleHeadList *)NULL);
		else if (right.iValue == WFINAL)
		val = (hp->pRight == (AmpleHeadList *)NULL);
		else if (right.iValue == AMPLE_NFX)
			val = (hp->eType & AMPLE_NFX);
		else
		val = (hp->eType == right.iValue);
		}
	break;

	case FROM_IS_FROM:	/* 'fromcategory' 'is' ... 'fromcategory' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (get_from(hp) == get_from(hp2));
		}
	break;

	case FR_IS_TO:	/* 'fromcategory' 'is' ... 'tocategory' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (get_from(hp) == get_to(hp2));
		}
	break;

	case TO_IS_FROM:	/* 'tocategory' 'is' ... 'fromcategory' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (get_to(hp) == get_from(hp2));
		}
	break;

	case TO_IS_TO:	/* 'tocategory' 'is' ... 'tocategory' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (get_to(hp) == get_to(hp2));
		}
	break;

	case FROM_MEMBER:	/* 'fromcategory 'is' 'member' IDENTIFIER */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = isAmpleCategClassMember(get_from(hp), right.pCategClass);
		}
	break;

	case TO_MEMBER:	/* 'tocategory 'is' 'member' IDENTIFIER */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = isAmpleCategClassMember(get_to(hp), right.pCategClass);
		}
	break;

	case FROM_IS:	/* 'fromcategory 'is' IDENTIFIER */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (get_from(hp) == right.iValue);
		}
	break;

	case TO_IS: /* 'tocategory 'is' IDENTIFIER */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (get_to(hp) == right.iValue);
		}
	break;

	case COMPUTED_IS: /* 'computedcategory 'is' IDENTIFIER */
		{
			if (iComputedCat == 0) {
				val = 0;
			}
			else {
				val = (iComputedCat == right.iValue);
			}
		}
	break;

	case COMPUTED_MEMBER: /* 'computedcategory 'is' 'member' IDENTIFIER */
		{
			if (iComputedCat == 0) {
				val = 0;
			}
			else {
				val = isAmpleCategClassMember(iComputedCat, right.pCategClass);
			}
		}
	break;

	case ORDR_EQ:	/* 'orderclass' '=' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass == hp2->iOrderClass);
		}
	break;

	case ORDR_GT:	/* 'orderclass' '>' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass > hp2->iOrderClass);
		}
	break;

	case ORDR_GE:	/* 'orderclass' '>=' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass >= hp2->iOrderClass);
		}
	break;

	case ORDR_LE:	/* 'orderclass' '<=' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass <= hp2->iOrderClass);
		}
	break;

	case ORDR_LT:	/* 'orderclass' '<' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass < hp2->iOrderClass);
		}
	break;

	case ORDR_NE:	/* 'orderclass' '~=' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass != hp2->iOrderClass);
		}
	break;

#ifndef hab360
	case ORDR_EQ_ORDRMAX:	/* 'orderclass' '=' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass == hp2->iOrderClassMax);
		}
	break;

	case ORDR_GT_ORDRMAX:	/* 'orderclass' '>' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass > hp2->iOrderClassMax);
		}
	break;

	case ORDR_GE_ORDRMAX:	/* 'orderclass' '>=' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass >= hp2->iOrderClassMax);
		}
	break;

	case ORDR_LE_ORDRMAX:	/* 'orderclass' '<=' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass <= hp2->iOrderClassMax);
		}
	break;

	case ORDR_LT_ORDRMAX:	/* 'orderclass' '<' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass < hp2->iOrderClassMax);
		}
	break;

	case ORDR_NE_ORDRMAX:	/* 'orderclass' '~=' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClass != hp2->iOrderClassMax);
		}
	break;

	case ORDRMAX_EQ_ORDR:	/* 'orderclassmax' '=' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax == hp2->iOrderClass);
		}
	break;

	case ORDRMAX_GT_ORDR:	/* 'orderclassmax' '>' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax > hp2->iOrderClass);
		}
	break;

	case ORDRMAX_GE_ORDR:	/* 'orderclassmax' '>=' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax >= hp2->iOrderClass);
		}
	break;

	case ORDRMAX_LE_ORDR:	/* 'orderclassmax' '<=' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax <= hp2->iOrderClass);
		}
	break;

	case ORDRMAX_LT_ORDR:	/* 'orderclassmax' '<' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax < hp2->iOrderClass);
		}
	break;

	case ORDRMAX_NE_ORDR:	/* 'orderclassmax' '~=' ... 'orderclass' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax != hp2->iOrderClass);
		}
	break;

	case ORDRMAX_EQ_ORDRMAX:	/* 'orderclassmax' '=' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax == hp2->iOrderClassMax);
		}
	break;

	case ORDRMAX_GT_ORDRMAX:	/* 'orderclassmax' '>' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax > hp2->iOrderClassMax);
		}
	break;

	case ORDRMAX_GE_ORDRMAX:	/* 'orderclassmax' '>=' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax >= hp2->iOrderClassMax);
		}
	break;

	case ORDRMAX_LE_ORDRMAX:	/* 'orderclassmax' '<=' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax <= hp2->iOrderClassMax);
		}
	break;

	case ORDRMAX_LT_ORDRMAX:	/* 'orderclassmax' '<' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax < hp2->iOrderClassMax);
		}
	break;

	case ORDRMAX_NE_ORDRMAX:	/* 'orderclassmax' '~=' ... 'orderclassmax' */
	if (	((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL) &&
		((hp2= getpos(right.iValue)) != (AmpleHeadList *)NULL))
		{
		val = (hp->iOrderClassMax != hp2->iOrderClassMax);
		}
	break;
#endif

	case ORDR_EQ_CON:	/* 'orderclass' '=' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClass == right.iValue);
		}
	break;

	case ORDR_GT_CON:	/* 'orderclass' '>' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClass > right.iValue);
		}
	break;

	case ORDR_GE_CON:	/* 'orderclass' '>=' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClass >= right.iValue);
		}
	break;

	case ORDR_LE_CON:	/* 'orderclass' '<=' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClass <= right.iValue);
		}
	break;

	case ORDR_LT_CON:	/* 'orderclass' '<' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClass < right.iValue);
		}
	break;

	case ORDR_NE_CON:	/* 'orderclass' '~=' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClass != right.iValue);
		}
	break;

#ifndef hab360
	case ORDRMAX_EQ_CON:	/* 'orderclassmax' '=' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClassMax == right.iValue);
		}
	break;

	case ORDRMAX_GT_CON:	/* 'orderclassmax' '>' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClassMax > right.iValue);
		}
	break;

	case ORDRMAX_GE_CON:	/* 'orderclassmax' '>=' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClassMax >= right.iValue);
		}
	break;

	case ORDRMAX_LE_CON:	/* 'orderclassmax' '<=' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClassMax <= right.iValue);
		}
	break;

	case ORDRMAX_LT_CON:	/* 'orderclassmax' '<' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClassMax < right.iValue);
		}
	break;

	case ORDRMAX_NE_CON:	/* 'orderclassmax' '~=' CONSTANT */
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = (hp->iOrderClassMax != right.iValue);
		}
	break;

#endif

	case AL_IS_CAP:	/* 'allomorph' 'is' 'capitalized'  1.9zb BJY*/
	if ((hp = getpos(left.iPosition)) != (AmpleHeadList *)NULL)
		{
		val = ( ( hp->pAllomorph->iMORPHTYPE & ISCAPS ) != 0 );
		}
	break;

	case WD_IS_CAP:	/* 'word' 'is' 'capitalized'  1.9zb BJY */
	val = ( pCurrentWord_m->pTemplate->iCapital != 0 );
	break;

				/* 3.3.0 hab */
	case PUNCT_IS:	/* 'punctuation' 'is'  STRING */
	if (	(right.pszString != (char *)NULL) &&
		((p = get_punct(left.iPosition)) != (char *)NULL) )
		{
		val = (strcmp( p, right.pszString ) == 0);
		}
	break;
				/* 3.3.0 hab */
	case PUNCT_MEMBER: /* 'punctuation' 'is' 'member' IDENTIFIER */
	if ((p = get_punct(left.iPosition)) != (char *)NULL)
		{
		val = isPunctClassMember( p, right.pPunctClass );
		}
	break;

	default:
	if (pAmple_in->pLogFP != NULL)
		fprintf(pAmple_in->pLogFP,
			"%s%s is corrupted - the result is unpredictable\n",
			pszAmpleTestErrorHeader_m,
			pTestTreeRoot_m->uRight.pszString );
	return( FALSE );
	}
				/* return (possibly negated) truth value */
return((tree->iOpCode & OP_NOT) ? !val : val);
} /* end utest() */

/*************************************************************************
 * NAME
 *    get_property_name
 * ARGUMENTS
 *    prop - property value
 * DESCRIPTION
 *    Find the name string associated with the number of the prop.
 * RETURN VALUE
 *    pointer to the property's name, or NULL if not found
 */
static char * get_property_name(iProp_in, pAmple_in)
int			iProp_in;
const AmpleData *	pAmple_in;
{
return findAmplePropertyName(iProp_in, &pAmple_in->sProperties);
}

/*****************************************************************************
 * NAME
 *    initiateAmpleTrace
 * DESCRIPTION
 *    write the trace header to the log file for SGML style tracing
 * RETURN VALUE
 *    none
 */
void initiateAmpleTrace(pAmple_in)
AmpleData *	pAmple_in;
{
resetLocalGlobals();
if (pAmple_in == NULL)
	return;

if (pAmple_in->pszTrace != NULL)
	memset(pAmple_in->pszTrace, 0, pAmple_in->uiTraceSize);

if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_SGML &&
	pAmple_in->eTraceAnalysis != AMPLE_TRACE_XML)
	return;

if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML)
  store_AMPLE_trace(pAmple_in,
		   "<!DOCTYPE AmpleTrace SYSTEM \"ampletrc.dtd\">\n<AmpleTrace>\n",
		  NULL);
else
  store_AMPLE_trace(pAmple_in,
		   "<!DOCTYPE AmpleTrace SYSTEM \"AmpleTrcXml.dtd\">\n<AmpleTrace>\n",
		  NULL);

/*
 *  write the selected morphs (if selective analysis)
 */
if (pAmple_in->pszTrace != NULL)
	pAmple_in->pszTrace = stringifyAmpleSelectedMorphs(pAmple_in->pszTrace,
							   &pAmple_in->uiTraceSize,
							   pAmple_in);
else if (pAmple_in->pLogFP != NULL)
	writeAmpleSelectedMorphs(pAmple_in);
}

/*****************************************************************************
 * NAME
 *    terminateAmpleTrace
 * DESCRIPTION
 *    write the trace end marker to the log file for SGML style tracing
 * RETURN VALUE
 *    none
 */
void terminateAmpleTrace(pAmple_in)
AmpleData *	pAmple_in;
{
resetLocalGlobals();
if (	(pAmple_in == NULL) ||
	( (pAmple_in->eTraceAnalysis != AMPLE_TRACE_SGML) &&
	  (pAmple_in->eTraceAnalysis != AMPLE_TRACE_XML)) )
	return;

store_AMPLE_trace(pAmple_in, "</AmpleTrace>\n", NULL);
}

/*****************************************************************************
 * NAME
 *    sgml_trace
 * DESCRIPTION
 *    if SGML style tracing is desired, and a log file is open, write a trace
 *    string, indented if so desired
 * RETURN VALUE
 *    none
 */
static void sgml_trace(pAmple_in, pszString_in, bIndent_in)
AmpleData *	pAmple_in;
char *		pszString_in;
int		bIndent_in;
{
if ((pAmple_in->eTraceAnalysis != AMPLE_TRACE_SGML) &&
	(pAmple_in->eTraceAnalysis != AMPLE_TRACE_XML))
	return;
if (pAmple_in->pszTrace != NULL)
	{
	if (bIndent_in)
	{
	char *	pszIndent;
	size_t	uiSize;
	uiSize = 2 * iTracingDepth_m;
#ifdef HAVE_ALLOCA
	pszIndent = (char *)alloca((uiSize+1) * sizeof(char));
#else
	pszIndent = (char *)allocMemory((uiSize+1) * sizeof(char));
#endif
	sprintf(pszIndent, "%*s", (int)uiSize, "");
	store_AMPLE_trace(pAmple_in, pszIndent, NULL);
#ifndef HAVE_ALLOCA
	freeMemory(pszIndent);
#endif
	}
	store_AMPLE_trace(pAmple_in, pszString_in, NULL);
	}
else if (pAmple_in->pLogFP != NULL)
	{
	if (bIndent_in)
	fprintf(pAmple_in->pLogFP, "%*s", (2*iTracingDepth_m), "");
	fputs(pszString_in, pAmple_in->pLogFP);
	}
}

/*****************************************************************************
 * NAME
 *    store_AMPLE_trace
 * DESCRIPTION
 *    store the trace information in a dynamically growing string
 * RETURN VALUE
 *    none
 */
static void store_AMPLE_trace(pAmple_in, pszFmt, pszArg)
AmpleData *	pAmple_in;
const char *	pszFmt;
const char *	pszArg;
{
if ((pAmple_in == NULL) || (pszFmt == NULL))
	return;

if (pAmple_in->pszTrace != NULL)
	{
	size_t	uiUsed;
	size_t	uiNeeded;

	uiUsed   = strlen(pAmple_in->pszTrace);
	uiNeeded = strlen(pszFmt) + 1;
	if (pszArg != NULL)
	uiNeeded += strlen(pszArg);
	if ((uiUsed + uiNeeded) > pAmple_in->uiTraceSize)
	{
	pAmple_in->uiTraceSize += uiNeeded;
	pAmple_in->pszTrace = reallocMemory(pAmple_in->pszTrace,
						pAmple_in->uiTraceSize);
	}
	if (pszArg != NULL)
	sprintf(pAmple_in->pszTrace + uiUsed, pszFmt, pszArg);
	else
	strcpy(pAmple_in->pszTrace + uiUsed, pszFmt);
	}
else if (pAmple_in->pLogFP != NULL)
	{
	if (pszArg != NULL)
	fprintf(pAmple_in->pLogFP, pszFmt, pszArg);
	else
	fputs(pszFmt, pAmple_in->pLogFP);
	}
}

/*****************************************************************************
 * NAME
 *    resetLocalGlobals
 * DESCRIPTION
 *    reset all of the local global variables to their original pristine state
 * RETURN VALUE
 *    none
 */
static void resetLocalGlobals()
{
pAmpleLeftHead_m          = NULL;
pAmpleRightHead_m         = NULL;
pszDecomposition_m        = NULL;
pszCategory_m             = NULL;
pszProperties_m           = NULL;
pszFeatures_m             = NULL;
pszUnderlying_m           = NULL;
pszSurfaceForm_m          = NULL;
iTracingDepth_m           = 0;
uiAmbigCount_m            = 0;
bRootFound_m              = FALSE;
pszDeeptail_m             = NULL;
pCurrentWord_m            = NULL;
pPreviousWord_m           = NULL;
pNextWord_m               = NULL;
pszAmpleTestErrorHeader_m = "";
pAdhocList_m              = NULL;
pForLeft_m                = NULL;
pForRight_m               = NULL;
pTestCurrent_m            = NULL;
pszTestString_m           = NULL;
iTestAlloLength_m         = 0;
pTestTreeRoot_m           = NULL;
pszTempSurface_m          = NULL;
bUseSurroundingWords_m    = FALSE;
}

/*****************************************************************************
 * NAME
 *    analyzeAmpleWord
 * DESCRIPTION
 *    Analyze this word in isolation.
 * RETURN VALUE
 *    the number of analyses found
 */
unsigned analyzeAmpleWord(pThisWord_io, pAmple_in)
AmpleWord * pThisWord_io;
AmpleData * pAmple_in;
{
size_t		i;
int		bAllosTried;
AmpleHeadlistList * pHL;
/*
 *  initialize the analysis globals
 */
resetLocalGlobals();
pCurrentWord_m                       = pThisWord_io;
pCurrentWord_m->pTemplate->pAnalyses = NULL;

if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
	{
	const char * pszFmt = "About to parse %s\n";
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
	pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	pszFmt = "<wordTrace>\n<!-- %s -->\n";
	store_AMPLE_trace(pAmple_in, pszFmt,
			  pCurrentWord_m->pTemplate->pszOrigWord);
	}
/*
 *  step through any possible normalized forms
 */
for ( i = 0 ; pCurrentWord_m->pTemplate->paWord[i] ; ++i )
	{
	pszSurfaceForm_m = pCurrentWord_m->pTemplate->paWord[i];
	pszDeeptail_m    = pszSurfaceForm_m;
	bRootFound_m     = FALSE;
	bUsesPrevWord_m  = FALSE;
	bUsesNextWord_m  = FALSE;
	/*
	 *  Process word recursively starting with prefix, followed by root, and
	 *  suffix, with infix appropriately mingled in.
	 */
	if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
	{
	const char * pszFmt = "Parsing %s\n";
	char *       pszStr = pszSurfaceForm_m;
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		{
		  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		pszFmt = "<form>%s</form>\n<trace>\n";
		  else
		pszFmt = "<form>%s</>\n<trace>\n";
#ifdef HAVE_ALLOCA
		pszStr = (char *)alloca(
				 lengthAmplePCDATA(pszSurfaceForm_m, FALSE)+1);
#else
		pszStr = (char *)allocMemory(
				 lengthAmplePCDATA(pszSurfaceForm_m, FALSE)+1);
#endif
		storeAmplePCDATA(pszStr, pszSurfaceForm_m, FALSE);
		}
	store_AMPLE_trace(pAmple_in, pszFmt, pszStr);
#ifndef HAVE_ALLOCA
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		freeMemory(pszStr);
#endif
	iTracingDepth_m = -1;
	}

	bAllosTried = get_prefix(NULL, pszSurfaceForm_m, 0, 0, 0, pAmple_in);

	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
	pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	{
	const char * pszFmt = "</trace>\n";
	char *	     pszStr = NULL;

	if (bAllosTried == FALSE)
		{
		if ((pszSurfaceForm_m != NULL) && (*pszSurfaceForm_m != NUL))
		{
		  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			pszFmt =
			  "<parseNode>\n  <leftover>%s</leftover>\n</parseNode>\n</trace>\n";
		  else
			pszFmt =
			  "<parseNode>\n  <leftover>%s</>\n</parseNode>\n</trace>\n";
#ifdef HAVE_ALLOCA
		pszStr = (char *)alloca(
				 lengthAmplePCDATA(pszSurfaceForm_m, FALSE)+1);
#else
		pszStr = (char *)allocMemory(
				 lengthAmplePCDATA(pszSurfaceForm_m, FALSE)+1);
#endif
		storeAmplePCDATA(pszStr, pszSurfaceForm_m, FALSE);
		}
		else
		{
		  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
			pszFmt =
			  "<parseNode>\n  <endOfWord/><failure test='none'/>\n</parseNode>\n</trace>\n";
		  else
			pszFmt =
			  "<parseNode>\n  <endOfWord><failure test=none>\n</parseNode>\n</trace>\n";
		}
		}
	store_AMPLE_trace(pAmple_in, pszFmt, pszStr);
#ifndef HAVE_ALLOCA
	if (pszStr != NULL)
		freeMemory(pszStr);
#endif
	}
	}
if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
	pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	{
	const char * pszFmt = "</wordTrace>\n";
	store_AMPLE_trace(pAmple_in, pszFmt, NULL);
	}
/*
 *  record information necessary for reporting results
 */
pCurrentWord_m->pszRemaining = pszDeeptail_m;
pCurrentWord_m->bFoundRoot   = bRootFound_m;
pCurrentWord_m->uiAmbigCount = uiAmbigCount_m;
for (   pHL = pCurrentWord_m->pHeadlists ;
	pHL ;
	pHL = pHL->pNext )
	{
	if (pHL->bUsesPrevWord)
	pCurrentWord_m->bUsesPrevWord = TRUE;
	if (pHL->bUsesNextWord)
	pCurrentWord_m->bUsesNextWord = TRUE;
	}

return uiAmbigCount_m;
}

/*****************************************************************************
 * NAME
 *    refineAmpleAnalysis
 * DESCRIPTION
 *    Use the surrounding words to remove analyses that are incorrect in this
 *    context.
 * RETURN VALUE
 *    the number of analyses remaining
 */
unsigned refineAmpleAnalysis(pThisWord_io, pPreviousWord_in, pNextWord_in,
				 pAmple_in)
AmpleWord * pThisWord_io;
AmpleWord * pPreviousWord_in;
AmpleWord * pNextWord_in;
AmpleData * pAmple_in;
{
WordAnalysis *		pAnal;
WordAnalysis *		pPrevAnal;
WordAnalysis *		pNextAnal;
AmpleHeadlistList *	pHL;
AmpleHeadlistList *	pPrevHL;
AmpleHeadlistList *	pNextHL;
AmpleHeadList *		pH;
AmpleHeadList *		pTail;
unsigned	uiAnalysisCount = 0;
unsigned	uiHeadlistCount = 0;
unsigned	uiTrimCount     = 0;
char *		pszCurrent;
int		bFailed;

resetLocalGlobals();
bUseSurroundingWords_m = TRUE;

if (	(pThisWord_io == NULL) ||
	(pThisWord_io->pTemplate == NULL) ||
	(pThisWord_io->pTemplate->pAnalyses == NULL) )
	return 0;
for (pAnal = pThisWord_io->pTemplate->pAnalyses ; pAnal ; pAnal = pAnal->pNext)
	++uiAnalysisCount;
for ( pHL = pThisWord_io->pHeadlists ; pHL ; pHL = pHL->pNext )
	++uiHeadlistCount;
if (uiAnalysisCount != uiHeadlistCount)
	{
	reportError(ERROR_MSG,
	"Cannot refine analysis: analysis count = %u != %u = headlist count\n",
		uiAnalysisCount, uiHeadlistCount);
	return uiAnalysisCount;
	}
if (pAmple_in == NULL)
	return uiAnalysisCount;

if ((pAmple_in->pLogFP != NULL) || (pAmple_in->pszTrace != NULL))
	{
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in,
			  "Checking against adjacent words.\n", NULL);
	}
	else if ((pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML) ||
	(pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML))
	{
	store_AMPLE_trace(pAmple_in,
			  "<!-- Checking against adjacent words. -->\n", NULL);
	}
	}

pCurrentWord_m  = pThisWord_io;
pPreviousWord_m = pPreviousWord_in;
pNextWord_m     = pNextWord_in;

pPrevAnal = NULL;
pPrevHL   = NULL;
for ( pHL = pThisWord_io->pHeadlists,
		pAnal = pThisWord_io->pTemplate->pAnalyses ; pHL && pAnal ; )
	{
	bFailed = FALSE;
	if (pHL->bUsesPrevWord || pHL->bUsesNextWord)
	{
	pAmpleLeftHead_m = pHL->pHeadList;
	for (	pAmpleRightHead_m = pAmpleLeftHead_m ;
		pAmpleRightHead_m->pRight ;
		pAmpleRightHead_m = pAmpleRightHead_m->pRight )
		;
	pszSurfaceForm_m = pHL->pszSurface;

	if ((pAmple_in->pLogFP != NULL) || (pAmple_in->pszTrace != NULL))
		{
		char * astr = form_anal(pHL->pHeadList, pAmple_in);
		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
		{
		store_AMPLE_trace(pAmple_in, szTraceTab_m, NULL);
		store_AMPLE_trace(pAmple_in, "    Analysis:\t       %s\n",
				  astr);
		}
		else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		{
		}
		freeMemory(astr);
		if (pAmple_in->iOutputFlags & WANT_DECOMPOSITION)
		freeMemory( pszDecomposition_m );
		if (pAmple_in->eWriteCategory != AMPLE_NO_CATEGORY)
		freeMemory( pszCategory_m );
		if (pAmple_in->iOutputFlags & WANT_PROPERTIES)
		freeMemory( pszProperties_m );
		if (pAmple_in->iOutputFlags & WANT_FEATURES)
		freeMemory( pszFeatures_m );
		if (pAmple_in->iOutputFlags & WANT_UNDERLYING)
		freeMemory( pszUnderlying_m );
		}
	pszCurrent       = pHL->pszSurface;
	pTail            = pHL->pHeadList;
	for ( pH = pHL->pHeadList ; pH ; pH = pH->pRight )
		{
		switch (pH->eType)
		{
		case AMPLE_PFX:
			if (performAmplePrefixTests(pH->pLeft, pH, pszCurrent,
						pH->uiAllomorphLength,
						pAmple_in) == 0)
			bFailed = TRUE;
			break;
		case AMPLE_IFX:
			if (performAmpleInfixTests(pH->pLeft, pH, pszCurrent,
						   pH->uiAllomorphLength,
						   pAmple_in) == 0)
			bFailed = TRUE;
			break;
		case AMPLE_NFXPFX: /* fall through */
		case AMPLE_NFXSFX: /* fall through */
		case AMPLE_NFXIFX: /* fall through */
		case AMPLE_NFX:
			if (performAmpleInterfixTests(pH->pLeft, pH, pszCurrent,
						   pH->uiAllomorphLength,
						   pAmple_in) == 0)
			bFailed = TRUE;
			break;
		case AMPLE_ROOT:
			if (performAmpleRootTests(pH->pLeft, pH, pszCurrent,
						  pH->uiAllomorphLength,
						  pAmple_in) == 0)
			bFailed = TRUE;
			break;
		case AMPLE_SFX:
			if (performAmpleSuffixTests(pH->pLeft, pH, pszCurrent,
						pH->uiAllomorphLength,
						pAmple_in) == 0)
			bFailed = TRUE;
			break;
		}
		if (bFailed)
		break;
		pTail = pH;
		pszCurrent += pH->uiAllomorphLength;
		}
	if (!bFailed && (performAmpleFinalTests(pTail, pAmple_in) == 0))
		bFailed = TRUE;
	}
	pNextHL   = pHL->pNext;
	pNextAnal = pAnal->pNext;
	if (bFailed)
	{
	if (pHL == pThisWord_io->pHeadlists)
		pThisWord_io->pHeadlists = pNextHL;
	else
		pPrevHL->pNext = pNextHL;
	pHL->pNext   = NULL;
	free_headlist_list(pHL);

	if (pAnal == pThisWord_io->pTemplate->pAnalyses)
		pThisWord_io->pTemplate->pAnalyses = pNextAnal;
	else
		pPrevAnal->pNext = pNextAnal;
	pAnal->pNext = NULL;
	freeWordAnalysisList(pAnal);

	if ((pAmple_in->pLogFP != NULL) || (pAmple_in->pszTrace != NULL))
		{
		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
		{
		store_AMPLE_trace(pAmple_in, szTraceTab_m, NULL);
		store_AMPLE_trace(pAmple_in,
				  "Removed due to adjacent words.\n", NULL);
		}
		else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
		{
		store_AMPLE_trace(pAmple_in,
				  "<!-- Removed due to adjacent words. -->\n",
				  NULL);
		}
		}
	++uiTrimCount;
	}
	else
	{
	pPrevHL   = pHL;
	pPrevAnal = pAnal;
	}
	pHL   = pNextHL;
	pAnal = pNextAnal;
	}
pCurrentWord_m->uiAmbigCount = uiAnalysisCount - uiTrimCount;
return uiAnalysisCount - uiTrimCount;
}

#ifdef EXPERIMENTAL
/*****************************************************************************
 * NAME
 *    build_feature_string
 * DESCRIPTION
 *    Build a string containing feature template names based on the AMPLE
 *    'F' and 'C' dictionary fields
 * RETURN VALUE
 *    pointer to a dynamically allocated string of feature template names,
 *    or NULL
 */
static char * build_feature_string(pszFeat_in, pszFrom_in, pszTo_in,
				   pszProperties_in)
char *		pszFeat_in;
char *		pszFrom_in;
char *		pszTo_in;
char *		pszProperties_in;
{
char *		pszSlash;
unsigned	uiLength;

if (pszFeat_in == NULL)
	pszFeat_in = "";
if (pszFrom_in == NULL)
	{
	pszFrom_in = "";
	pszSlash   = "";
	}
else
	{
	pszSlash   = "/";
	}
if (pszTo_in == NULL)
	pszTo_in = "";
if (pszProperties_in == NULL)
	pszProperties_in = "";

uiLength = strlen(pszFeat_in) + strlen(pszFrom_in) + strlen(pszSlash) +
				strlen(pszTo_in) + strlen(pszProperties_in);
if (uiLength == 0)
	return NULL;

return strcat(strcat(strcat(strcat(strcat(strcat(strcpy(
		allocMemory(uiLength + 3),
		pszFeat_in), " "),
		pszFrom_in), pszSlash), pszTo_in),
		" "), pszProperties_in);
}

/*************************************************************************
 * NAME
 *    build_prop_string
 * DESCRIPTION
 *    build a string containing the names for all the properties in
 *    pPropertySet_in.
 * RETURN VALUE
 *    pointer to a dynamically allocated string, or NULL
 */
static char * build_prop_string(pPropertySet_in, pProperties_in)
const PropertySet_t	pPropertySet_in;
const AmpleProperties *	pProperties_in;
{
size_t			uiLength;
char *			pszProps;
unsigned short		i;

if ((pPropertySet_in.pProperties == NULL) || (pProperties_in == NULL))
	return NULL;
/*
 *  scan the list of properties, summing the lengths of the names
 */
for ( uiLength = 0, i = 0 ; i < pProperties_in->uiPropertyCount ; ++i )
	{
	if (hasAmpleProperty(pPropertySet_in, i+1, pProperties_in))
	uiLength += strlen(pProperties_in->paProperties[i].pszName) + 1;
	}
if (uiLength == 0)
	return NULL;
pszProps = allocMemory(uiLength + 1);
pszProps[0] = NUL;
for ( i = 0 ; i < pProperties_in->uiPropertyCount ; ++i )
	{
	if (hasAmpleProperty(pPropertySet_in, i+1, pProperties_in))
		{
	strcat(pszProps, pProperties_in->paProperties[i].pszName);
	if ((i + 1) < pProperties_in->uiPropertyCount)
		strcat(pszProps, " ");
	}
	}
return pszProps;
}

/*****************************************************************************
 * NAME
 *    perform_word_parse
 * DESCRIPTION
 *    apply the PC-PATR style word grammar to this AMPLE analysis
 * RETURN VALUE
 *    TRUE (nonzero) either if no grammar has been loaded and at least one
 *    word parse can be produced from this list of morphemes; otherwise FALSE
 *    (zero)
 */
static int perform_word_parse(pAnal_in, pAmple_in, ppWordParse_out)
AmpleHeadList *	pAnal_in;
AmpleData *	pAmple_in;
PATREdgeList **	ppWordParse_out;
{
PATREdgeList *		pWordParse;
AmpleHeadList *		hp;
AmpleAllomorph *	ap;
AmpleMorpheme *		mp;
PATRWord *		pWord = NULL;
PATRWord *		pNewMorph  = NULL;
char *			pszLex;
char *			pszGloss;
char *			pszPATRCategory;
char *			pszFromCat;
char *			pszToCat;
char *			pszProps;
char *			pszFeatures;
int			bSuccess = FALSE;
char *                  pszTestName = "PC-PATR word parse";
/*
 *  check for valid input, and for a loaded grammar
 */
if ((pAnal_in == NULL) || (pAmple_in == NULL) || (ppWordParse_out == NULL))
	return FALSE;
*ppWordParse_out = NULL;
if (pAmple_in->sPATR.pGrammar == NULL)
	return TRUE;
/*
 *  save pointers to temporary parse structures
 */
markPATRParseGarbage(&pAmple_in->sPATR);
/*
 *  convert the list of morphemes to what parseWithPATR() wants
 */
for ( hp = pAnal_in ; hp ; hp = hp->pLeft )
	{
	ap = hp->pAllomorph;
	if (ap == NULL)
	continue;		/* should never happen */
	mp = ap->pMorpheme;
	if (mp == NULL)
	continue;		/* should never happen */
	if (mp->pszUnderForm != NULL)
	pszLex = mp->pszUnderForm;
	else
	pszLex = ap->pszAllomorph;
	if ((pszLex == NULL) || (*pszLex == NUL))
	pszLex = "0";
	pszGloss = mp->pszMorphName;
	if (mp->pszPATRCat != NULL)
	{
	pszPATRCategory = mp->pszPATRCat;
	}
	else
	{
	switch (hp->eType)
		{
		case AMPLE_PFX:
		pszPATRCategory = "Prefix";
		break;
		case AMPLE_IFX:
		if ((hp->pRight == NULL) || (hp->pRight->eType == AMPLE_SFX))
			pszPATRCategory = "Suffix";
		else
			pszPATRCategory = "Prefix";
		break;
		case AMPLE_SFX:
		pszPATRCategory = "Suffix";
		break;
		default:
		pszPATRCategory = "Root";
		break;
		}
	}
	if (hp->eType == AMPLE_ROOT)
	pszFromCat = NULL;
	else
	pszFromCat = findAmpleCategoryName(get_from(hp),
					   pAmple_in->pCategories);
	pszToCat    = findAmpleCategoryName(get_to(hp), pAmple_in->pCategories);
	pszProps    = build_prop_string(ap->sPropertySet, &pAmple_in->sProperties);
	pszFeatures = build_feature_string(mp->pszMorphFd,
					   pszFromCat, pszToCat,
					   pszProps ? pszProps : "");
	if (pszProps != NULL)
	freeMemory(pszProps);
	pNewMorph = buildPATRWord(pszLex, pszGloss, pszPATRCategory, pszFeatures,
				  mp->pPATRFeature, &pAmple_in->sPATR);
	freeMemory(pszFeatures);
	pNewMorph->pNext = pWord;
	pWord            = pNewMorph;
	}
if (pWord != NULL)
	{
	int iStage = -1;
	pAmple_in->uiPATRCallCount++;
	/*
	 *  parse the word and save a permanent copy of the result
	 */
	pWordParse = parseWithPATR(pWord, &iStage, &pAmple_in->sPATR);
	if ((pWordParse != NULL) && (iStage == 0))
	{
	if (pAmple_in->sPATR.bRecognizeOnly)
		{
		writeAllocMemoryDebugMsg(
		"*NOT* STORING PERMANENT COPY OF PARSE RESULTS FOR AMPLE\n");
		if (pAmple_in->pLogFP)
			fputs("** Word parsed with PC-PATR grammar, but parse results not stored **\n",
			  pAmple_in->pLogFP);
		pWordParse = NULL;
		}
	else
		{
		writeAllocMemoryDebugMsg(
		"BEGIN STORING PERMANENT COPY OF PARSE RESULTS FOR AMPLE\n");
		pWordParse = storePATREdgeList( pWordParse, &pAmple_in->sPATR );
		writeAllocMemoryDebugMsg(
		"DONE STORING PERMANENT COPY OF PARSE RESULTS FOR AMPLE\n");
		}
	bSuccess   = TRUE;
	}
	else
	{
	bSuccess   = FALSE;
	pAmple_in->uiPATRFailCount++;
		if (    (   (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF) ||
			pAmple_in->sPATR.bFailure) &&
				(pAmple_in->pLogFP != NULL) )
			{
		if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_OFF)
		{
		putc('\n', pAmple_in->pLogFP);
		/*
		 *  not tracing, but wanting parse failure output: write
		 *  the decomposed word before the parse failure output
		 */
		for ( hp = pAnal_in ; hp ; hp = hp->pLeft )
			{
			ap = hp->pAllomorph;
			if (ap == NULL)
			continue;		/* should never happen */
			mp = ap->pMorpheme;
			if (mp == NULL)
			continue;		/* should never happen */
			if (mp->pszUnderForm != NULL)
			pszLex = mp->pszUnderForm;
			else
			pszLex = ap->pszAllomorph;
			if ((pszLex == NULL) || (*pszLex == NUL))
			pszLex = "0";
			fputs(pszLex, pAmple_in->pLogFP);
			if (hp->pLeft)
			putc(pAmple_in->sTextCtl.cDecomp, pAmple_in->pLogFP);
			}
		putc('\n', pAmple_in->pLogFP);
		}
			fputs("**** Cannot parse this word with PC-PATR grammar ****\n",
		  pAmple_in->pLogFP);
			/*
			 *  build what structure you can and display it
			 */
		switch (iStage)
		{
		case 1:
			fprintf(pAmple_in->pLogFP,
				"**** Turning off unification ****\n");
			break;
		case 2:
			fprintf(pAmple_in->pLogFP,
				"**** Turning off top-down filtering ****\n");
			break;
		case 3:
			fprintf(pAmple_in->pLogFP,
				"**** Building the largest parse \"bush\" ****\n");
			break;
		case 4:
			fprintf(pAmple_in->pLogFP,
				"**** No output available ****\n");
			break;
		case 5:
			fprintf(pAmple_in->pLogFP,
				"**** Out of Memory (after %lu edges) ****\n",
				pAmple_in->sPATR.uiEdgesAdded);
			break;
		case 6:
			fprintf(pAmple_in->pLogFP,
				"**** Out of Time (after %lu edges) ****\n",
				pAmple_in->sPATR.uiEdgesAdded);
			break;
		}
			if (pWordParse != NULL)
				{
				writePATRParses(pWordParse,
								pAmple_in->pLogFP,
				NULL,
				&pAmple_in->sTextCtl,
								&pAmple_in->sPATR);
				putc('\n', pAmple_in->pLogFP);
				}
			}
	}
	}
else
	{
	pWordParse = NULL;
	bSuccess   = TRUE;
	}
/*
 *  Free any temporary parse structures
 */
collectPATRParseGarbage(&pAmple_in->sPATR);
if (bSuccess)
	*ppWordParse_out = pWordParse;
else
  {
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
	pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	  {
	char *	pszIndent;
	store_AMPLE_trace(pAmple_in, "\n  ", NULL);
#ifdef HAVE_ALLOCA
	pszIndent = (char *)alloca((2*iTracingDepth_m)*sizeof(char));
#else
	pszIndent = (char *)allocMemory((2*iTracingDepth_m)*sizeof(char));
#endif
	sprintf(pszIndent, "%*s", 2*iTracingDepth_m, "");
	store_AMPLE_trace(pAmple_in, pszIndent, NULL);
#ifndef HAVE_ALLOCA
	freeMemory(pszIndent);
#endif
	if (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML)
	  store_AMPLE_trace(pAmple_in, "  <failure test=\"%s\"/>\n", pszTestName);
	else
	  store_AMPLE_trace(pAmple_in, "  <failure test=\"%s\">\n", pszTestName);
#ifdef HAVE_ALLOCA
	pszIndent = (char *)alloca((2*iTracingDepth_m+1)*sizeof(char));
#else
	pszIndent = (char *)allocMemory((2*iTracingDepth_m+1)*sizeof(char));
#endif
	sprintf(pszIndent, "%*s", 2*iTracingDepth_m+1, "");
	store_AMPLE_trace(pAmple_in, "%s</parseNode>\n", pszIndent);
#ifndef HAVE_ALLOCA
	freeMemory(pszIndent);
#endif
	  }
  }
return bSuccess;
}

/*****************************************************************************
 * NAME
 *    writeAmpleParses
 * DESCRIPTION
 *    write the set of PATR style parses of AMPLE analyses to the output file
 * RETURN VALUE
 *    none
 */
void writeAmpleParses(pOutputFP_in, pParses_in, pAmple_in)
FILE *			pOutputFP_in;
AmpleParseList *	pParses_in;
AmpleData *		pAmple_in;
{
AmpleParseList *	pParse;
int			iParseCount = 0;
int			iAmbigCount = 0;

resetLocalGlobals();
if ((pOutputFP_in == NULL) || (pParses_in == NULL))
	return;

if (pAmple_in->sPATR.eTreeDisplay == PATR_NO_TREE)
	return;

for ( pParse = pParses_in ; pParse ; pParse = pParse->pNext )
	{
	if (pParse->pParse != NULL)
	++iParseCount;
	++iAmbigCount;
	}
if (iParseCount == 0)
	return;
fprintf(pOutputFP_in, "\\WordParse");
if (iAmbigCount > 1)
	fprintf(pOutputFP_in, " %%%d%%", iAmbigCount);
putc('\n', pOutputFP_in);
for ( pParse = pParses_in ; pParse ; pParse = pParse->pNext )
	{
	if (pParse->pParse != NULL)
	{
	writePATRParses(pParse->pParse, pOutputFP_in, NULL,
			&pAmple_in->sTextCtl, &pAmple_in->sPATR);
	putc('\n', pOutputFP_in);
	}
	if (iAmbigCount > 1)
	fprintf(pOutputFP_in, "%%\n");
	}
fprintf(pOutputFP_in, "\\endWordParse\n\n");
}
#endif /* EXPERIMENTAL */

#ifndef hab3312
/*****************************************************************************
 * NAME
 *    concatAmpleAmlists
 * DESCRIPTION
 *    concatenate two AmpleAmlist's
 * RETURN VALUE
 *    concatenated list
 */
AmpleAmlist * concatAmpleAmlists(
	AmpleAmlist * pTo_in,
	AmpleAmlist * pNew_in)
{
AmpleAmlist * pAL;

if (pTo_in == NULL)
  {
	return pNew_in;		/* if first is empty, just use second */
  }
if (pNew_in == NULL)		/* if second is empty, just use first */
  {
	return pTo_in;
  }
for (pAL = pTo_in; pAL; pAL = pAL->amlink)
  {				/* find end of first list */
	if (pAL->amlink == NULL)
	  {
	pAL->amlink = pNew_in;	/* point it to the second */
	break;
	  }
  }
return pTo_in;
}

/*****************************************************************************
 * NAME
 *    mergeAmpleAmlists
 * DESCRIPTION
 *    merge two AmpleAmlists
 * RETURN VALUE
 *    merged list
 */
AmpleAmlist * mergeAmpleAmlists(
	AmpleAmlist * pTo_in,
	AmpleAmlist * pNew_io)
{
AmpleAmlist * pALTo;
AmpleAmlist * pALNew;
#ifdef hab3316
AmpleAmlist * pALTemp;
#else  /* hab3316 */
AmpleAmlist * pALPrev;
#endif /* hab3316 */
AmpleAmlist * pALNext;

if (pTo_in == NULL)
  {
	return pNew_io;		/* if first is empty, just use second */
  }
if (pNew_io == NULL)		/* if second is empty, just use first */
  {
	return pTo_in;
  }
for (pALTo = pTo_in; pALTo; pALTo = pALTo->amlink)
  {
#ifdef hab3316
	for (pALNew = pNew_io; pALNew; pALNew = pALNext)
	  {
	pALNext = pALNew->amlink;
	if (pALNew->amp == pALTo->amp)
	  {
		pNew_io = pALNext;
		pALTemp = pALTo->amlink;
		pALTo->amlink = pALNew;
		pALNew->amlink = pALTemp;
	  }
	  }
#else  /* hab3316 */
	for (pALNew = pNew_io,
	   pALPrev = NULL;
	 pALNew;
	 pALPrev = pALNew,
	   pALNew = pALNext)
	  {
	pALNext = pALNew->amlink;
	if (pALNew->amp == pALTo->amp)
	  {
				/* remove it from the second list */
		if (pALPrev == NULL)
		  pNew_io = pALNext; /* it was first; skip it from now on */
		else
		  pALPrev->amlink = pALNext;
	  }
	  }

#endif /* hab3316 */
  }

return concatAmpleAmlists(pTo_in, pNew_io);
}

/*****************************************************************************
 * NAME
 *    getInfixEntries
 * DESCRIPTION
 *    retrieve all infix allomorphs that match the given key (or a leading
 *    substring of it)
 * RETURN VALUE
 *    list of dictionary entries
 */
AmpleAmlist * getInfixEntries(
	char      * pszRestOfWord_in,
	int         iState_in,
	AmpleData * pAmple_in)
{
char        *   pszInfixTail;
AmpleAmlist *	pResultList = NULL;
AmpleAmlist *	pAlloList;

/*
 * for each possible location of an infix
 */
for ( pszInfixTail = pszRestOfWord_in; *pszInfixTail != NUL ; ++pszInfixTail )
	{
	/*
	 *	create list of all infixes whose string matches
	 */
	  int iType = AMPLE_IFX;
	  if ((iState_in == AMPLE_STATE_INTERFIX) ||
	  (iState_in == AMPLE_STATE_ROOT))
	iType = AMPLE_NFXIFX;
	  pAlloList = get_entries( pszInfixTail, iType, pAmple_in);
				/* merge/sort by infix so the result has */
				/* similar infixes together */
	pResultList = mergeAmpleAmlists( pResultList, pAlloList);
	}
return pResultList;
}

/*****************************************************************************
 * NAME
 *    getAllAllomorphs
 * DESCRIPTION
 *    retrieve all allomorphs that match the given key (or a leading
 *    substring of it), given the state
 * RETURN VALUE
 *    list of dictionary entries
 */
AmpleAmlist * getAllAllomorphs(
	char      * pszRestOfWord_in,
	int         iState_in,
	AmpleData * pAmple_in)
{
AmpleAmlist *	pAlloList;
AmpleAmlist *	pResultList = NULL;

switch(iState_in)
  {
  case AMPLE_STATE_BOW:		/* Begin-of-Word and Prefix are the same */
  case AMPLE_STATE_PREFIX:
	pResultList = get_entries( pszRestOfWord_in, AMPLE_PFX, pAmple_in);
	pAlloList   = getInfixEntries( pszRestOfWord_in, iState_in, pAmple_in);
	pResultList = concatAmpleAmlists( pResultList, pAlloList);
	pAlloList   = get_entries( pszRestOfWord_in, AMPLE_ROOT, pAmple_in);
	pResultList = concatAmpleAmlists( pResultList, pAlloList);
	break;
  case AMPLE_STATE_ROOT:
	pResultList = get_entries( pszRestOfWord_in, AMPLE_ROOT, pAmple_in);
	pAlloList   = get_entries( pszRestOfWord_in, AMPLE_SFX, pAmple_in);
	pResultList = concatAmpleAmlists( pResultList, pAlloList);
	pAlloList   = getInfixEntries( pszRestOfWord_in, iState_in, pAmple_in);
	pResultList = concatAmpleAmlists( pResultList, pAlloList);
	if (pAmple_in->iMaxInterfixCount > 0)
	  {
	pAlloList   = get_entries( pszRestOfWord_in, AMPLE_NFX, pAmple_in);
	pResultList = concatAmpleAmlists( pResultList, pAlloList);
	  }
	break;
  case AMPLE_STATE_INTERFIX:
	pResultList = get_entries( pszRestOfWord_in, AMPLE_NFX, pAmple_in);
	pAlloList   = get_entries( pszRestOfWord_in, AMPLE_ROOT, pAmple_in);
	pResultList = concatAmpleAmlists( pResultList, pAlloList);
	pAlloList   = getInfixEntries( pszRestOfWord_in, iState_in, pAmple_in);
	pResultList = concatAmpleAmlists( pResultList, pAlloList);
	break;
  case AMPLE_STATE_SUFFIX:
	pResultList = get_entries( pszRestOfWord_in, AMPLE_SFX, pAmple_in);
	pAlloList   = getInfixEntries( pszRestOfWord_in, iState_in, pAmple_in);
	pResultList = concatAmpleAmlists( pResultList, pAlloList);
	break;
  case AMPLE_STATE_EOW:
  default:
	pResultList = NULL;
	break;
  }
return pResultList;
}
#endif /* hab3312 */

/*****************************************************************************
 * NAME
 *    sgml_trace_success
 * DESCRIPTION
 *    report success for SGML/XML tracing
 * RETURN VALUE
 *    none
 */
static void sgml_trace_success(AmpleData * pAmple_in)
{
  if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	sgml_trace(pAmple_in, "<success/>\n", FALSE);
  else
	sgml_trace(pAmple_in, "<success>\n", FALSE);
  sgml_trace(pAmple_in, "  </parseNode>\n", TRUE);
}
/*****************************************************************************
 * NAME
 *    xml_maxaffix_reached
 * DESCRIPTION
 *    report reached maximum affix or root (XML only)
 * RETURN VALUE
 *    none
 */
static void xml_maximum_reached(AmpleData * pAmple_in, char * pszType_in)
{
  char * pszIndent;
#ifdef HAVE_ALLOCA
  pszIndent = (char *)alloca((2*iTracingDepth_m+1)*sizeof(char));
#else
  pszIndent = (char *)allocMemory((2*iTracingDepth_m+1)*sizeof(char));
#endif
  sprintf(pszIndent, "%*s", 2*iTracingDepth_m, "");
  store_AMPLE_trace(pAmple_in, "  %s<parseNode>\n", pszIndent);
  store_AMPLE_trace(pAmple_in, "  %s<maxReached>", pszIndent);
  store_AMPLE_trace(pAmple_in, "%s</maxReached>\n", pszType_in);
  store_AMPLE_trace(pAmple_in, "  %s</parseNode>\n", pszIndent);
}
/*****************************************************************************
 * NAME
 *    reportInfixEnvironmentFailure
 * DESCRIPTION
 *    report failure of infix environment to match
 * RETURN VALUE
 *    none
 */
static void reportInfixEnvironmentFailure(char *pszInfixTail_in,
					  AmpleAllomorph *ap,
					  AmpleData *pAmple_in)
{
char * pszIndent;

if ((pAmple_in->pszTrace == NULL) && (pAmple_in->pLogFP == NULL))
	return;

#ifdef HAVE_ALLOCA
pszIndent = (char *)alloca((2*iTracingDepth_m+1)*sizeof(char));
#else
pszIndent = (char *)allocMemory((2*iTracingDepth_m+1)*sizeof(char));
#endif
sprintf(pszIndent, "%*s", 2*iTracingDepth_m, "");
if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in, pszIndent, NULL);
	store_AMPLE_trace(pAmple_in,
			  "               The infix location environment(s) failed.\n",
			  NULL);
	}
else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		 pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	{
	  formatFormForXMLEnvironment("InfixEnvironment", pszInfixTail_in,
					  strlen(ap->pszAllomorph), pAmple_in);
	  if (pAmple_in->pszTrace != NULL)
		{
		pAmple_in->pszTrace = stringifyAmpleEnvConstraint(
				pAmple_in->pszTrace,
				&pAmple_in->uiTraceSize,
				ap->pINFIX->pInfixEnv,
				TRUE);
		}
	  else if (pAmple_in->pLogFP != NULL)
		{
		writeAmpleEnvConstraint(
				pAmple_in->pLogFP,
				ap->pINFIX->pInfixEnv,
				TRUE);
		}
	  if (pAmple_in->eTraceAnalysis==AMPLE_TRACE_XML)
		store_AMPLE_trace(pAmple_in, "\"/>\n", NULL);
	  else
		store_AMPLE_trace(pAmple_in, "\">\n", NULL);
	  store_AMPLE_trace(pAmple_in, pszIndent, NULL);
	  store_AMPLE_trace(pAmple_in, "</parseNode>\n", NULL);
	}
}
/*****************************************************************************
 * NAME
 *    reportInfixTypeFailure
 * DESCRIPTION
 *    report failure to try infix because of trying to insert the prefix
 *    into a wrong type of morpheme
 * RETURN VALUE
 *    none
 */
static void reportInfixTypeFailure(char *pszType_in, AmpleData *pAmple_in)
{
char * pszIndent;

if ((pAmple_in->pszTrace == NULL) && (pAmple_in->pLogFP == NULL))
	return;

#ifdef HAVE_ALLOCA
pszIndent = (char *)alloca((2*iTracingDepth_m+1)*sizeof(char));
#else
pszIndent = (char *)allocMemory((2*iTracingDepth_m+1)*sizeof(char));
#endif
sprintf(pszIndent, "%*s", 2*iTracingDepth_m, "");
if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_ON)
	{
	store_AMPLE_trace(pAmple_in, pszIndent, NULL);
	store_AMPLE_trace(pAmple_in,
			  "               Cannot insert this infix in a %s morpheme.\n",
			  pszType_in);
	}
else if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_SGML ||
		 pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	{
	store_AMPLE_trace(pAmple_in, "  %s<failure ", pszIndent);
	if (pAmple_in->eTraceAnalysis == AMPLE_TRACE_XML)
	  {
	store_AMPLE_trace(pAmple_in, " test=\"InfixType: %s\"/>\n", pszType_in);
	  }
	else
	  store_AMPLE_trace(pAmple_in, " test=InfixType: %s>\n", pszType_in);
	store_AMPLE_trace(pAmple_in, "</parseNode>\n", NULL);
	}
#ifndef HAVE_ALLOCA
freeMemory(pszIndent);
#endif

}
/*****************************************************************************
 * NAME
 *    formatFormForXMLEnvironment
 * DESCRIPTION
 *    format string environment for XML failure reporting
 * RETURN VALUE
 *    none
 */
static void formatFormForXMLEnvironment(char *pszTest_in,
					char *pszAllomorph_in,
					int   iAlloLen,
					AmpleData *pAmple_in)
{
  int	cSave;
  char *	pszStr;
  size_t	uiSize;
  size_t	uiMaxSize;

  uiMaxSize = 2 * iTracingDepth_m;
  uiSize    = lengthAmpleCDATA(pszSurfaceForm_m, FALSE);
  if (uiMaxSize < uiSize)
	uiMaxSize = uiSize;
#ifdef HAVE_ALLOCA
  pszStr    = (char *)alloca(uiMaxSize + 1);
#else
  pszStr    = (char *)allocMemory(uiMaxSize + 1);
#endif
  sprintf(pszStr, "%*s", 2*iTracingDepth_m, "");
  store_AMPLE_trace(pAmple_in,"  %s<failure ", pszStr);
  store_AMPLE_trace(pAmple_in,"test=\"%s: ", pszTest_in);

  cSave = *pszAllomorph_in;
  *pszAllomorph_in = NUL;
  storeAmpleCDATA(pszStr, pszSurfaceForm_m,  FALSE);
  *pszAllomorph_in = cSave;
  store_AMPLE_trace(pAmple_in, pszStr, NULL);

  cSave = pszAllomorph_in[iAlloLen];
  pszAllomorph_in[iAlloLen] = NUL;
  storeAmpleCDATA(pszStr, pszAllomorph_in, FALSE);
  pszAllomorph_in[iAlloLen] = cSave;
  store_AMPLE_trace(pAmple_in, " _%s_ ", pszStr);

  storeAmpleCDATA(pszStr, pszAllomorph_in+iAlloLen, FALSE);
  store_AMPLE_trace(pAmple_in, pszStr, NULL);

#ifndef HAVE_ALLOCA
  freeMemory(pszStr);
#endif
}
/*****************************************************************************
 * NAME
 *    reportInfixMorphForLocationFailure
 * DESCRIPTION
 *    report infix morpheme info when there's
 * RETURN VALUE
 *    none
 */
static void reportInfixMorphForLocationFailure(int what,
						   char * ifxtail,
						   AmpleAmlist *ifxp,
						   AmpleAllomorph *ap,
						   AmpleInfixInfo *ip,
						   AmpleData *pAmple_in)
{
if (pAmple_in->eTraceAnalysis != AMPLE_TRACE_OFF)
#ifdef EXPERIMENTAL
	a_trace((what == AMPLE_NFX) ? AMPLE_NFX : AMPLE_IFX,
		ifxtail, ifxp->alen, ap->pMORPHNAME,
		0,
		0,
		ap->sPropertySet,
		ip->iOrderClass,
		ip->iOrderClassMax,
		ap->pszAllomorphID,
		ap->pPATRCAT,
		ap->pEnvironment, pAmple_in);
#else
	a_trace((what == AMPLE_NFX) ? AMPLE_NFX : AMPLE_IFX,
		ifxtail, ifxp->alen, ap->pMORPHNAME,
		0,
		0,
		ap->sPropertySet,
		ip->iOrderClass,
		ip->iOrderClassMax,
		ap->pszAllomorphID,
		NULL,
		ap->pEnvironment, pAmple_in);
#endif
}
