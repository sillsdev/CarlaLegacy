/* ANALDA.C - load the analysis data file
 ***************************************************************************
 *
 *	int loadAmpleControlFile(const char * pszInputFile_in,
 *				 AmpleData * pAmple_io)
 *
 ***************************************************************************
 * Copyright 1988, 2000 by SIL International.  All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"

/*****************************************************************************
 * NAME
 *    AmpleFunctionTable (struct ample_fntab)
 * DESCRIPTION
 *    function tables used to fill in the lists of successor and final tests
 */
typedef struct ample_fntab {
	char *	pszTestName;
	int		eTestFunction;
	} AmpleFunctionTable;

/********************* ANALDA.C FUNCTION PROTOTYPES *********************/

static void             adata_create    P((char * recp,
					   AmpleData * pAmple_io));
static void             add_builtin_fns P((AmpleTestList **listp,
					   const AmpleFunctionTable tab[],
					   int size, int kind,
					   AmpleData * pAmple_io));
static void             add_defined_fn  P((char * name, int kind,
					   char * pszErrorHeader_in,
					   AmpleData * pAmple_io));
static AmplePairList *	adhoc_create    P((char *rp, AmplePairList *adh_list,
					   char *ah_type,
					   AmpleData * pAmple_io));
static void             cr_create       P((char *rp,
					   AmpleData * pAmple_io));
static void             in_fnlist       P((char *test,
					   const AmpleFunctionTable tab[],
					   int size, int kind,
					   AmpleData * pAmple_io));
static int              lookup_test     P((char * name, int kind,
					   char * pszErrorHeader_in,
					   AmpleData * pAmple_io));
static AmpleTestList *	mkfnlist        P((int kind,
					   AmpleData * pAmple_io));
static void             set_rootdelim   P((char *str,
					   AmpleData * pAmple_io));
#ifdef EXPERIMENTAL
static void		process_patr_setting P((char * pszRec_in,
						AmpleData * pAmple_io));
#endif

/********************* ANALDA.C LOCAL VARIABLES *********************/

/*
 *  analysis data record code table
 *	\pcl added by hab for version 3.3.0
 *	\patr added by SRMc for version 3.3.4 (#ifdef EXPERIMENTAL)
 */
#ifndef hab340
static const CodeTable sAnalysisCodeTable_m = { "\
\\pt\0A\0\
\\rt\0B\0\
\\st\0C\0\
\\it\0D\0\
\\ft\0E\0\
\\tc\0F\0\
\\cat\0G\0\
\\catcr\0g\0\
\\ca\0H\0\
\\ccl\0I\0\
\\rd\0J\0\
\\strcheck\0K\0\
\\maxnull\0L\0\
\\scl\0M\0\
\\iah\0N\0\
\\pah\0O\0\
\\rah\0P\0\
\\sah\0Q\0\
\\cr\0R\0\
\\mcl\0S\0\
\\ap\0T\0\
\\mp\0U\0\
\\maxp\0V\0\
\\maxi\0W\0\
\\maxr\0X\0\
\\maxs\0Y\0\
\\mcc\0Z\0\
\\dicdecap\0a\0\
\\maxprops\0b\0\
\\pcl\0c\0\
\\patr\0p\0",
	31,
	NULL
	};
#else /* hab340 */
static const CodeTable sAnalysisCodeTable_m = { "\
\\pt\0A\0\
\\rt\0B\0\
\\st\0C\0\
\\it\0D\0\
\\ft\0E\0\
\\tc\0F\0\
\\cat\0G\0\
\\ca\0H\0\
\\ccl\0I\0\
\\rd\0J\0\
\\strcheck\0K\0\
\\maxnull\0L\0\
\\scl\0M\0\
\\iah\0N\0\
\\pah\0O\0\
\\rah\0P\0\
\\sah\0Q\0\
\\cr\0R\0\
\\mcl\0S\0\
\\ap\0T\0\
\\mp\0U\0\
\\maxp\0V\0\
\\maxi\0W\0\
\\maxr\0X\0\
\\maxs\0Y\0\
\\mcc\0Z\0\
\\dicdecap\0a\0\
\\maxprops\0b\0\
\\pcl\0c\0\
\\patr\0p\0",
	30,
	NULL
	};
#endif /* hab340 */

static const AmpleFunctionTable asPrefixTestTable_m[] = {
	{"SEC_ST",   AMPLE_SEC_ST},
	{"ADHOC_ST", AMPLE_ADHOC_ST},
	{"PEC_ST",   AMPLE_PEC_ST},	/* 3.3.0 hab */
	{"SP_TEST",  AMPLE_SP_TEST}
	};
static const int iPrefixTestTableSize_m =
		sizeof(asPrefixTestTable_m) / sizeof(AmpleFunctionTable);

static const AmpleFunctionTable asInfixTestTable_m[] = {
	{"SEC_ST",   AMPLE_SEC_ST},
	{"ADHOC_ST", AMPLE_ADHOC_ST},
	{"PEC_ST",   AMPLE_PEC_ST},	/* 3.3.0 hab */
	{"SP_TEST",  AMPLE_SP_TEST}
	};
static const int iInfixTestTableSize_m =
		sizeof(asInfixTestTable_m) / sizeof(AmpleFunctionTable);

static const AmpleFunctionTable asRootTestTable_m[] = {
	{"SEC_ST",   AMPLE_SEC_ST},
	{"ADHOC_ST", AMPLE_ADHOC_ST},
	{"ROOTS_ST", AMPLE_ROOTS_ST},
	{"PEC_ST",   AMPLE_PEC_ST},	/* 3.3.0 hab */
	{"SP_TEST",  AMPLE_SP_TEST}
	};
static const int iRootTestTableSize_m =
		sizeof(asRootTestTable_m) / sizeof(AmpleFunctionTable);

static const AmpleFunctionTable asSuffixTestTable_m[] = {
	{"SEC_ST",   AMPLE_SEC_ST},
	{"ADHOC_ST", AMPLE_ADHOC_ST},
	{"PEC_ST",   AMPLE_PEC_ST},	/* 3.3.0 hab */
	{"SP_TEST",  AMPLE_SP_TEST}
	};
static const int iSuffixTestTableSize_m =
		sizeof(asSuffixTestTable_m) / sizeof(AmpleFunctionTable);

static const AmpleFunctionTable asFinalTestTable_m[] = {
	{"MEC_FT",   AMPLE_MEC_FT},
	{"MCC_FT",   AMPLE_MCC_FT},
	{"SP_TEST",  AMPLE_SP_TEST}
	};
static const int iFinalTestTableSize_m =
		sizeof(asFinalTestTable_m) / sizeof(AmpleFunctionTable);

#define AMPLE_FINAL	0x10	/* to go with AMPLE_PFX, AMPLE_IFX,
				   AMPLE_ROOT, and AMPLE_SFX */

static const AmpleFunctionTable asStringEnvTestTable_m[] = {
	{"SEC_ST",   AMPLE_SEC_ST},
	{"SP_TEST",  AMPLE_SP_TEST}
	};
static const int iStringEnvTestTableSize_m = 2;

				/* 3.3.0 hab */
static const AmpleFunctionTable asPunctEnvTestTable_m[] = {
	{"PEC_ST",   AMPLE_PEC_ST},
	{"SP_TEST",  AMPLE_SP_TEST}
	};
static const int iPunctEnvTestTableSize_m = 2;

static const AmpleFunctionTable asAdhocTestTable_m[] = {
	{"ADHOC_ST", AMPLE_ADHOC_ST},
	{"SP_TEST",  AMPLE_SP_TEST}
	};
static const int iAdhocTestTableSize_m = 2;

static const AmpleFunctionTable asCompoundRootTestTable_m[] = {
	{"ROOTS_ST", AMPLE_ROOTS_ST},
	{"SP_TEST",  AMPLE_SP_TEST}
	};
static const int iCompoundRootTestTableSize_m = 2;

static const char	szWhitespace_m[7] = " \t\r\n\f\v";

/*****************************************************************************
 * NAME
 *    mkfnlist
 * DESCRIPTION
 *    creates a function list structure
 * RETURN VALUE
 *    pointer to created structure
 */
static AmpleTestList * mkfnlist( kind, pAmple_io)
int		kind;
AmpleData *	pAmple_io;
{
AmpleTestList **listp = NULL;
AmpleTestList *	flp;
AmpleTestList *	nflp;
/*
 *  allocate space for struct
 */
nflp = (AmpleTestList *)allocMemory(sizeof(AmpleTestList));

switch (kind)
	{
	case AMPLE_PFX:	listp = &pAmple_io->pPrefixSuccTests;	break;
	case AMPLE_IFX:	listp = &pAmple_io->pInfixSuccTests;	break;
	case AMPLE_ROOT:	listp = &pAmple_io->pRootSuccTests;		break;
	case AMPLE_SFX:	listp = &pAmple_io->pSuffixSuccTests;	break;
	case AMPLE_FINAL:	listp = &pAmple_io->pFinalTests;		break;
	}
if (*listp == NULL)
	*listp = nflp;
else
	{
	/* skip to end of linked list */
	for ( flp = *listp ; flp->pNext ; flp = flp->pNext )
	;
	/* add this one to the end of the list */
	flp->pNext = nflp;
	}
/* set this one's link to NULL */
nflp->pNext = NULL;

return (nflp);
} /* end mkfnlist() */

/*****************************************************************************
 * NAME
 *    add_builtin_fns
 * DESCRIPTION
 *    adds any builtin functions to a function list
 * RETURN VALUE
 *    none
 */
static void add_builtin_fns(listp, tab, size, kind, pAmple_io)
AmpleTestList **listp;		/* pointer to a pointer to a function list */
const AmpleFunctionTable	tab[];		/* function table */
int		size;		/* size of function table */
int		kind;		/* kind of function list */
AmpleData *	pAmple_io;
{
int		i;
AmpleTestList *	flp;
int		is_defined;

/* for each built-in function */
for (i = 0; i < size; i++)
	{
	if (strcmp(tab[i].pszTestName, "SP_TEST") != 0)
	{
	/* if it is one of the built-in ones */
	is_defined = FALSE;
	for ( flp = *listp ; flp ; flp = flp->pNext )
		{
		/* check to see if it has been defined */
		if (strcmp(tab[i].pszTestName, flp->pszName) == 0)
		{
		is_defined = TRUE;
		break;
		}
		}
	if (!is_defined)
		{
		/* it was not defined, so add it to list */
		flp = mkfnlist(kind, pAmple_io);
		flp->pszName   = tab[i].pszTestName;
		flp->eFunction = tab[i].eTestFunction;
		flp->pTestTree = NULL;
		}
	}
	}
} /* end add_builtin_fns() */

/*****************************************************************************
 * NAME
 *    in_fnlist
 * DESCRIPTION
 *    inserts the function in tab corresponding to name at the end of list to
 *    create ordered list of predicates for analysis
 * RETURN VALUE
 *    none
 */
static void in_fnlist( test, tab, size, kind, pAmple_io)
char *			test;
const AmpleFunctionTable	tab[];
int			size;
int			kind;
AmpleData *		pAmple_io;
{
int		i;
char *		p;
AmpleTestList *	flp;
AmpleTestNode *	pTest;
char *		pszTestErrorHeader;	/* header for test error messages */
int		bUsesPrev = FALSE;
int		bUsesNext = FALSE;

switch (kind)			/* set the test type for error messages */
	{
	case AMPLE_PFX:	pszTestErrorHeader = "PREFIX TEST: ";	break;
	case AMPLE_IFX:	pszTestErrorHeader = "INFIX TEST: ";	break;
	case AMPLE_ROOT:	pszTestErrorHeader = "ROOT TEST: ";	break;
	case AMPLE_SFX:	pszTestErrorHeader = "SUFFIX TEST: ";	break;
	case AMPLE_FINAL:	pszTestErrorHeader = "FINAL TEST: ";	break;
	default:		pszTestErrorHeader = "";		break;
	}
test += strspn(test, szWhitespace_m);
if (*test == NUL)
	{
	if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP, "%sEmpty definition\n",
		pszTestErrorHeader);
	return;
	}
/*
 *  Search for a match with the name of a builtin test.
 */
for ( p = isolateWord(test), i = 0; i < size ; i++ )
	{
	if (strcmp(test,tab[i].pszTestName) == 0)
	{
	flp = mkfnlist(kind, pAmple_io);
	flp->pszName   = tab[i].pszTestName;
	flp->eFunction = tab[i].eTestFunction;
	flp->pTestTree = NULL;
	return;
	}
	}
/*
 *  If only a name is given, search for a match with the name of a previously
 *  defined test.
 */
if (*p == NUL)
	{
	/*
	 *  if we have only a name given, look for it and add it
	 */
	add_defined_fn(test, kind, pszTestErrorHeader, pAmple_io);
	return;
	}
else if (lookup_test(test, kind, pszTestErrorHeader, pAmple_io))
	return;				/* test already defined?? */
/*
 *  restore whitespace character following the test name
 */
p  = test + strlen(test);
*p = ' ';
/*
 *  Parse a newly defined test.
 */
pTest = parseAmpleTest(test, pszTestErrorHeader, &bUsesPrev, &bUsesNext,
			   pAmple_io);
if (pTest != NULL)
	{
	flp = mkfnlist(kind, pAmple_io);
	flp->pszName   = pTest->uRight.pszString;
	flp->eFunction = tab[size-1].eTestFunction;
	flp->pTestTree = pTest;
	flp->bUsesPrevWord = bUsesPrev;
	flp->bUsesNextWord = bUsesNext;
	}
} /* end in_fnlist() */

/**************************************************************************
 * NAME
 *    add_defined_fn
 * DESCRIPTION
 *    Search for a user-defined function in an earlier test list
 *    If found, add it to the current list.  Otherwise, complain.
 * RETURN VALUE
 *    none
 */
static void add_defined_fn(name, kind, pszErrorHeader_in, pAmple_io)
char *		name;		/* pointer to function name string */
int		kind;		/* kind of test (prefix, etc) */
char *		pszErrorHeader_in;
AmpleData *	pAmple_io;
{
AmpleTestList *		flp = NULL;
AmpleTestList *		new;
int			success;
int			stop = 0;
int			i;
AmpleTestList **	asFunctionTable[5];

asFunctionTable[0] = &pAmple_io->pPrefixSuccTests;
asFunctionTable[1] = &pAmple_io->pInfixSuccTests;
asFunctionTable[2] = &pAmple_io->pRootSuccTests;
asFunctionTable[3] = &pAmple_io->pSuffixSuccTests;
asFunctionTable[4] = &pAmple_io->pFinalTests;
/*
 *  initialize based on kind of function
 */
switch (kind)
	{
	case AMPLE_PFX:	stop = 0;	break;
	case AMPLE_IFX:	stop = 1;	break;
	case AMPLE_ROOT:	stop = 2;	break;
	case AMPLE_SFX:	stop = 3;	break;
	case AMPLE_FINAL:	stop = 4;	break;
	}
/*
 *  search each list in sequence
 */
for ( success = FALSE, i = 0 ; i < stop ; ++i )
	{
	for ( flp = *asFunctionTable[i] ; flp ; flp = flp->pNext )
	{
	if (    (flp->pTestTree != NULL) &&
		(strcmp(flp->pszName, name) == 0) )
		{
		success = TRUE;             /* found it! */
		break;
		}
	}
	if (success)
	break;
	}
if (success)
	{
	new = mkfnlist(kind, pAmple_io);
	new->pszName   = flp->pszName;
	new->eFunction = flp->eFunction;
	new->pTestTree = flp->pTestTree;
	}
else if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP, "%s%s not defined\n",
		pszErrorHeader_in, name );
}

/**************************************************************************
 * NAME
 *    lookup_test
 * DESCRIPTION
 *    Search for a user-defined function in an earlier test list
 *    If found, complain.
 * RETURN VALUE
 *    zero if not found, nonzero if found
 */
static int lookup_test(name, kind, pszErrorHeader_in, pAmple_io)
char *		name;		/* pointer to function name string */
int		kind;		/* kind of test (prefix, etc) */
char *		pszErrorHeader_in;
AmpleData *	pAmple_io;
{
AmpleTestList *flp;

switch (kind)
	{
	case AMPLE_PFX:	flp = pAmple_io->pPrefixSuccTests;	break;
	case AMPLE_IFX:	flp = pAmple_io->pInfixSuccTests;	break;
	case AMPLE_ROOT:	flp = pAmple_io->pRootSuccTests;	break;
	case AMPLE_SFX:	flp = pAmple_io->pSuffixSuccTests;	break;
	case AMPLE_FINAL:	flp = pAmple_io->pFinalTests;	break;
	default:		return( 0 );
	}
for ( ; flp ; flp = flp->pNext )
	{
	if (strcmp(flp->pszName,name) == 0)
	{
	if (pAmple_io->pLogFP != NULL)
		fprintf(pAmple_io->pLogFP, "%s%s already defined\n",
			pszErrorHeader_in, name );
	return( 1 );
	}
	}
return( 0 );
}

/***************************************************************************
 * NAME
 *    adhoc_create
 * DESCRIPTION
 *    Add an adhoc pair to an adhoc pair list.
 * RETURN VALUE
 *    the (updated) adhoc pair pointer
 */
static AmplePairList * adhoc_create( rp, adh_list, ah_type, pAmple_io )
char *		rp;		/* string containing the adhoc pair */
AmplePairList *	adh_list;	/* pointer to the adhoc pair list */
char *		ah_type;	/* pointer to name of ad hoc pair type */
AmpleData *	pAmple_io;
{
AmplePairList *	ahplp;
AmplePairList *	plp;
char *			end;
char *			rp2;
static const char	errhead[] = "AD HOC PAIR: ";
/*
 *  split out the two morphnames, making sure that we have two of them
 */
rp += strspn(rp, szWhitespace_m);
rp2 = isolateWord(rp);
end = isolateWord(rp2);
if (*rp == NUL)
	{
	if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP,
		"%sEmpty %s ad hoc pair\n",
		errhead, ah_type);
	return(adh_list);
	}
else if (*rp2 == NUL)
	{
	if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP,
		"%sMissing morphname in %s ad hoc pair\n",
		errhead, ah_type);
	return(adh_list);
	}
else if (*end != NUL)
	{
	if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP,
		"%sToo many morphnames in %s ad hoc pair - ignoring extra\n",
		errhead, ah_type);
	}

ahplp = (AmplePairList *)allocMemory( sizeof(AmplePairList));
for ( plp = adh_list ; adh_list && plp->pNext ; plp = plp->pNext )
	;
if (plp)
	plp->pNext = ahplp;
else
	adh_list = ahplp;

ahplp->pszLeft  = duplicateString( rp );
ahplp->pszRight = duplicateString( rp2 );
ahplp->pNext    = NULL;

return(adh_list);

} /* end adhoc_create */

/***************************************************************************
 * NAME
 *    cr_create
 * DESCRIPTION
 *    add another compound root category pair to the global list
 * RETURN VALUE
 *    none
 */
static void cr_create(rp, pAmple_io)
char *	rp;	/* pointer to line containing compound root category pair */
AmpleData * pAmple_io;
{
char *		end;
char *		rp2;
		/* categories to add to pAmple_io->pCompoundRootPairs */
unsigned char	cats[3];
static const char	errhead[] = "COMPOUND ROOT PAIR: ";
/*
 *  split out the two categories, making sure that we have two of them
 */
rp += strspn(rp, szWhitespace_m);
if ((rp == (char *)NULL) || (*rp == NUL))
	{
	if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP,
		"%sEmpty category pair\n", errhead);
	return;
	}
rp2 = isolateWord(rp);
if (*rp2 == NUL)
	{
	if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP,
		"%sMissing category\n", errhead);
	return;
	}
end = isolateWord(rp2);
if (*end != NUL)
	{
	if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP,
		"%sToo many categories - ignoring extra\n", errhead);
	}
/*
 *  check for valid category names
 */
if ((cats[0] = findAmpleCategoryNumber(rp, pAmple_io->pCategories)) == 0)
	{
	if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP,
		"%sUndefined category %s\n", errhead, rp);
	return;
	}
if ((cats[1] = findAmpleCategoryNumber(rp2, pAmple_io->pCategories)) == 0)
	{
	if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP,
		"%sUndefined category %s\n", errhead, rp2);
	return;
	}
/*
 *  add this pair to the list
 */
cats[2] = NUL;
if (pAmple_io->pCompoundRootPairs == NULL)
	{			/* create the Compound Root Pairs array */
	pAmple_io->pCompoundRootPairs = (unsigned char *)
						 duplicateString((char *)cats);
	}
else
	{			/* add to the Compound Root Pairs array */
	pAmple_io->pCompoundRootPairs = reallocMemory(
			pAmple_io->pCompoundRootPairs,
			strlen((char *)pAmple_io->pCompoundRootPairs) + 3);
	strcat((char *)pAmple_io->pCompoundRootPairs, (char *)cats);
	}
}

/*************************************************************************
 * NAME
 *    set_rootdelim
 * DESCRIPTION
 *    Use the first two non-whitespace characters in the string for the
 *    delimiters in the input analysis strings.
 * RETURN VALUE
 *    none
 */
static void set_rootdelim(str, pAmple_io)
char *		str;		/* pointer to a string */
AmpleData *	pAmple_io;
{
int	begin;
int	end;

str += strspn(str, szWhitespace_m);
if (*str)
	{
	begin = *str++;
	str += strspn(str, szWhitespace_m);
	if (*str)
	{
	end = *str;
	if (begin != end)
		{
		pAmple_io->cBeginRoot = begin;
		pAmple_io->cEndRoot   = end;
		return;
		}
	else
		{
		if (pAmple_io->pLogFP != NULL)
		fprintf(pAmple_io->pLogFP,
			"The root delimiters must be different!\n");
		return;
		}
	}
	}
if (pAmple_io->pLogFP != NULL)
	fprintf(pAmple_io->pLogFP, "Invalid root delimiter field\n");
}

/*****************************************************************************
 * NAME
 *    adata_create
 * DESCRIPTION
 *    fills in data structures for source dialect data lists
 * RETURN VALUE
 *    none
 */
static void adata_create(pRecord_in, pAmple_io)
char *		pRecord_in;		/* pointer to analysis data record */
AmpleData *	pAmple_io;
{
int			code;
char *			rp;
char *			pszNextField;
char *			p2;
AmpleMorphConstraint *	mr;
static const char	errhead[] = "SETUP ANALYSIS: ";
unsigned char *		old_pairs;
unsigned long		uiTemp;

pAmple_io->pPrefixAdhocPairs = NULL;
pAmple_io->pInfixAdhocPairs  = NULL;
pAmple_io->pRootAdhocPairs   = NULL;
pAmple_io->pSuffixAdhocPairs = NULL;
pAmple_io->pPrefixSuccTests = NULL;
pAmple_io->pInfixSuccTests  = NULL;
pAmple_io->pRootSuccTests   = NULL;
pAmple_io->pSuffixSuccTests = NULL;
pAmple_io->pFinalTests      = NULL;
pAmple_io->pCompoundRootPairs = NULL;

/* initialize the string classes */
if (pAmple_io->pStringClasses != NULL)
	{
	freeStringClasses(pAmple_io->pStringClasses);
	pAmple_io->pStringClasses = NULL;
	}
/*
 *  initialize the properties, categories, category classes, and morpheme
 *  classes
 */
freeAmpleProperties(&pAmple_io->sProperties, pAmple_io->pPropertySets);
pAmple_io->pPropertySets    = NULL;
freeAmpleCategories(pAmple_io->pCategories);
pAmple_io->pCategories      = NULL;
freeAmpleCategClasses(pAmple_io->pCategoryClasses);
pAmple_io->pCategoryClasses = NULL;
freeAmpleMorphClasses(pAmple_io->pMorphClasses);
pAmple_io->pMorphClasses    = NULL;

pAmple_io->iMaxNullCount = 10;  /* default to 10 null morphemes per word */
/*
 *  fill in lists line by line according to codes in record
 */
rp = pRecord_in;
while (*rp != NUL)
	{
	/* field code is first char on line */
	code = *rp++;
	/* rp on data, skip over white space */
	while (isascii(*rp) && isspace(*rp))
	++rp;
	pszNextField = rp + strlen(rp) + 1;
	switch (code)
	{
	case 'A':		/* Prefix Successor predicate */
		in_fnlist( rp, asPrefixTestTable_m, iPrefixTestTableSize_m,
			   AMPLE_PFX, pAmple_io);
		break;

	case 'B':		/* Root Successor predicate */
		in_fnlist( rp, asRootTestTable_m, iRootTestTableSize_m,
			   AMPLE_ROOT, pAmple_io);
		break;

	case 'C':		/* Suffix Successor predicate */
		in_fnlist( rp, asSuffixTestTable_m, iSuffixTestTableSize_m,
			   AMPLE_SFX, pAmple_io);
		break;

	case 'D':		/* Infix Successor predicate */
		in_fnlist( rp, asInfixTestTable_m, iInfixTestTableSize_m,
			   AMPLE_IFX, pAmple_io);
		break;

	case 'E':		/* Final Test predicate */
		in_fnlist( rp, asFinalTestTable_m, iFinalTestTableSize_m,
			   AMPLE_FINAL, pAmple_io);
		break;

	case 'F':		/* defunct (\tc ?) */
		break;

	case 'G':		/* category to output */
		p2 = isolateWord(rp);
		if ((*rp == 's') || (*rp == 'S'))
#ifndef hab340
		  {			/* reset any previous settings */
		pAmple_io->eWriteCategory &= ~AMPLE_AFFIX;
		pAmple_io->eWriteCategory |= AMPLE_SUFFIX_CATEGORY;
		  }
#else
		pAmple_io->eWriteCategory = AMPLE_SUFFIX_CATEGORY;
#endif /* hab340 */
		else if ((*rp == 'p') || (*rp == 'P'))
#ifndef hab340
		  {			/* reset any previous settings */
		pAmple_io->eWriteCategory &= ~AMPLE_AFFIX;
		pAmple_io->eWriteCategory |= AMPLE_PREFIX_CATEGORY;
		  }
#else
		pAmple_io->eWriteCategory = AMPLE_PREFIX_CATEGORY;
#endif /* hab340 */
		else if (pAmple_io->pLogFP != NULL)
		fprintf(pAmple_io->pLogFP,
			"%s\\cat must be followed by prefix or suffix\n",
			errhead );
		if ((*p2 == 'm') || (*p2 == 'M'))
		pAmple_io->bWriteMorphCats = TRUE;	/* write morph cats */
		else
		pAmple_io->bWriteMorphCats = FALSE;	/* don't write ... */
		break;

#ifndef hab340
	case 'g':		/* category to output for compound roots */
		p2 = isolateWord(rp);
		if ((*rp == 'l') || (*rp == 'L'))
		  {			/* reset any previous settings */
		pAmple_io->eWriteCategory &= ~AMPLE_COMPOUND_ROOT;
		pAmple_io->eWriteCategory |= AMPLE_COMPOUND_ROOT_LEFTHEAD;
		  }
		else if ((*rp == 'r') || (*rp == 'R'))
		  {			/* reset any previous settings */
		pAmple_io->eWriteCategory &= ~AMPLE_COMPOUND_ROOT;
		pAmple_io->eWriteCategory |= AMPLE_COMPOUND_ROOT_RIGHTHEAD;
		  }
		else if (pAmple_io->pLogFP != NULL)
		fprintf(pAmple_io->pLogFP,
			"%s\\catcr must be followed by left or right\n",
			errhead );
		break;
#endif /* hab340 */

	case 'H':		/* category definition */
		pAmple_io->pCategories = addAmpleCategory(rp,
							  pAmple_io->pCategories,
							  pAmple_io->pLogFP);
		break;

	case 'I':		/* category class definition */
		pAmple_io->pCategoryClasses = addAmpleCategClass(rp,
						   pAmple_io->pCategories,
						   pAmple_io->pCategoryClasses,
						   pAmple_io->pLogFP);
		break;

	case 'J':		/* root delimiters */
		set_rootdelim(rp, pAmple_io);
		break;

	case 'K':		/* string validation list 1.9z BJY */
		if (pAmple_io->pszValidChars != NULL)
		freeMemory( pAmple_io->pszValidChars );
		pAmple_io->pszValidChars = setAmpleValidCharacters( rp );
		break;

	case 'L':		/* maximum number of null morphemes per word */
		p2 = isolateWord(rp);
		pAmple_io->iMaxNullCount = atoi(rp);
		if (pAmple_io->iMaxNullCount < 0)
		{
		pAmple_io->iMaxNullCount = 0;
		if (pAmple_io->pLogFP != NULL)
			fprintf(pAmple_io->pLogFP,
			   "%sCannot have fewer than zero nulls - assuming zero\n",
				errhead);
		}
		break;

	case 'M':		/* string class definition */
		pAmple_io->pStringClasses = addStringClass(rp,
						pAmple_io->pStringClasses);
		break;

	case 'N':		/* infix adhoc pair */
		pAmple_io->pInfixAdhocPairs = adhoc_create(rp,
						   pAmple_io->pInfixAdhocPairs,
							   "infix",
							   pAmple_io);
		break;

	case 'O':		/* prefix adhoc pair */
		pAmple_io->pPrefixAdhocPairs = adhoc_create(rp,
						  pAmple_io->pPrefixAdhocPairs,
								"prefix",
								pAmple_io);
		break;

	case 'P':		/* compound roots adhoc pair */
		pAmple_io->pRootAdhocPairs = adhoc_create(rp,
						pAmple_io->pRootAdhocPairs,
							  "root",
							  pAmple_io);
		break;

	case 'Q':		/* suffix adhoc pair */
		pAmple_io->pSuffixAdhocPairs = adhoc_create(rp,
						  pAmple_io->pSuffixAdhocPairs,
								"suffix",
								pAmple_io);
		break;

	case 'R':		/* compound root category pairs */
		cr_create( rp, pAmple_io );
		break;

	case 'S':		/* morpheme class definition */
		pAmple_io->pMorphClasses = addAmpleMorphClass(rp,
							  pAmple_io->pMorphClasses,
							  pAmple_io->pLogFP);
		break;

	case 'T':		/* Allomorph properties definition */
		addAmpleProperty(rp, AMPLE_ALLO_PROP,
				 &pAmple_io->sProperties,
				 pAmple_io->pLogFP);
		break;

	case 'U':		/* Morpheme properties definition */
		addAmpleProperty(rp, AMPLE_MORPH_PROP,
				 &pAmple_io->sProperties,
				 pAmple_io->pLogFP);
		break;

	case 'V':		/* Maximum number of prefixes allowed */
		p2 = isolateWord(rp);
		pAmple_io->iMaxPrefixCount = atoi(rp);
		if (pAmple_io->iMaxPrefixCount < 0)
		{
		pAmple_io->iMaxPrefixCount = 0;
		if (pAmple_io->pLogFP != NULL)
			fprintf(pAmple_io->pLogFP,
			"%sCannot have fewer than zero prefixes - assuming zero\n",
				errhead );
		}
		break;

	case 'W':		/* Maximum number of infixes allowed */
		p2 = isolateWord(rp);
		pAmple_io->iMaxInfixCount = atoi(rp);
		if (pAmple_io->iMaxInfixCount < 0)
		{
		pAmple_io->iMaxInfixCount = 0;
		if (pAmple_io->pLogFP != NULL)
			fprintf(pAmple_io->pLogFP,
			 "%sCannot have fewer than zero infixes - assuming zero\n",
				errhead);
		}
		break;

	case 'X':		/* Maximum number of compound roots allowed */
		p2 = isolateWord(rp);
		pAmple_io->iMaxRootCount = atoi(rp);
		if (pAmple_io->iMaxRootCount < 1)
		{
		pAmple_io->iMaxRootCount = 1;
		if (pAmple_io->pLogFP != NULL)
			fprintf(pAmple_io->pLogFP,
				"%sMust have at least one root\n",
				errhead);
		}
		break;

	case 'Y':		/* Maximum number of suffixes allowed */
		p2 = isolateWord(rp);
		pAmple_io->iMaxSuffixCount = atoi(rp);
		if (pAmple_io->iMaxSuffixCount < 0)
		{
		pAmple_io->iMaxSuffixCount = 0;
		if (pAmple_io->pLogFP != NULL)
			fprintf(pAmple_io->pLogFP,
			"%sCannot have fewer than zero suffixes - assuming zero\n",
				errhead);
		}
		break;

	case 'Z':		/* morpheme co-occurrence constraint */
		mr = parseAmpleMorphConstraint( rp, pAmple_io );
		if (mr != (AmpleMorphConstraint *)NULL)
		{
		mr->pNext = pAmple_io->pMorphConstraints;
		pAmple_io->pMorphConstraints = mr;
		}
		break;

	case 'a':		/* do decapitalization of dictionary */
		pAmple_io->bDictionaryCapitals = TRUE;	/* 1.9zb BJY */
		break;

	case 'b':		/* set the maximum number of properties */
		if (pAmple_io->sProperties.uiPropertyCount != 0)
		{
		if (pAmple_io->pLogFP != NULL)
			fprintf(pAmple_io->pLogFP,
		 "\n%sMust define maximum number before defining any properties\n",
				errhead);
		}
		uiTemp = strtoul(rp, NULL, 10);
		if (uiTemp >= 0x10000L)
		{
		if (pAmple_io->pLogFP != NULL)
			fprintf(pAmple_io->pLogFP,
				"%sCannot have more than 65535 properties\n",
				errhead);
		}
		else if (uiTemp < pAmple_io->sProperties.uiMaxProperty)
		{
		if (pAmple_io->pLogFP != NULL)
			fprintf(pAmple_io->pLogFP,
			"%sCannot decrease the number of properties from %u\n",
				errhead,
				pAmple_io->sProperties.uiMaxProperty);
		}
		else
		pAmple_io->sProperties.uiMaxProperty = (unsigned short)uiTemp;
		break;

				/* 3.3.0 hab */
	case 'c':		/* punctuation class definition */
		pAmple_io->pPunctClasses = addPunctClass(rp,
							 pAmple_io->pPunctClasses);
		break;

#ifdef EXPERIMENTAL
				/* 3.3.4 SRMc */
	case 'p':		/* PCPATR word parser control setting */
		process_patr_setting(rp, pAmple_io);
		break;
#endif

	default:
		break;
	} /* end switch */
	/*
	 *  pass over rest of the field
	 */
	rp = pszNextField;
	} /* end of record */

#ifndef hab340
if ( pAmple_io->eWriteCategory != AMPLE_NO_CATEGORY &&
	!(pAmple_io->eWriteCategory & AMPLE_SUFFIX_CATEGORY) &&
	!(pAmple_io->eWriteCategory & AMPLE_PREFIX_CATEGORY) )
  pAmple_io->eWriteCategory = AMPLE_NO_CATEGORY; /* had \catcr without also
							having \cat so don't use
							\catcr info. */
#endif /* hab340 */
if (pAmple_io->eWriteCategory != AMPLE_NO_CATEGORY)
	pAmple_io->iOutputFlags |= WANT_CATEGORY;
else
	pAmple_io->iOutputFlags &= ~WANT_CATEGORY;
/*
 *  put pAmple_io->pCompoundRootPairs into the permanent heap
 */
if ( pAmple_io->pCompoundRootPairs )
	{
	old_pairs = pAmple_io->pCompoundRootPairs;
	pAmple_io->pCompoundRootPairs = (unsigned char *)duplicateString(
							   (char *)old_pairs );
	freeMemory( (char *)old_pairs );
	}
/*
 *  insert built-in functions not invoked by the user
 */
if (pAmple_io->iMaxPrefixCount)
	{
	add_builtin_fns( &pAmple_io->pPrefixSuccTests, asStringEnvTestTable_m,
			 iStringEnvTestTableSize_m, AMPLE_PFX, pAmple_io);
				/* 3.3.0 hab */
	add_builtin_fns( &pAmple_io->pPrefixSuccTests, asPunctEnvTestTable_m,
			 iPunctEnvTestTableSize_m, AMPLE_PFX, pAmple_io);
	/* ADHOC_ST only if needed */
	if (pAmple_io->pPrefixAdhocPairs)
	add_builtin_fns( &pAmple_io->pPrefixSuccTests, asAdhocTestTable_m,
			 iAdhocTestTableSize_m, AMPLE_PFX, pAmple_io);
	}
if (pAmple_io->iMaxInfixCount)
	{
	add_builtin_fns( &pAmple_io->pInfixSuccTests, asStringEnvTestTable_m,
			 iStringEnvTestTableSize_m, AMPLE_IFX, pAmple_io);
				/* 3.3.0 hab */
	add_builtin_fns( &pAmple_io->pInfixSuccTests, asPunctEnvTestTable_m,
			 iPunctEnvTestTableSize_m, AMPLE_IFX, pAmple_io);
	/* ADHOC_ST only if needed */
	if (pAmple_io->pInfixAdhocPairs)
	add_builtin_fns( &pAmple_io->pInfixSuccTests, asAdhocTestTable_m,
			 iAdhocTestTableSize_m, AMPLE_IFX, pAmple_io);
	}
add_builtin_fns( &pAmple_io->pRootSuccTests, asStringEnvTestTable_m,
		 iStringEnvTestTableSize_m, AMPLE_ROOT, pAmple_io);
				/* 3.3.0 hab */
add_builtin_fns( &pAmple_io->pRootSuccTests, asPunctEnvTestTable_m,
		 iPunctEnvTestTableSize_m, AMPLE_ROOT, pAmple_io);
/* ADHOC_ST only if needed */
if (pAmple_io->pRootAdhocPairs)
	add_builtin_fns( &pAmple_io->pRootSuccTests, asAdhocTestTable_m,
			 iAdhocTestTableSize_m, AMPLE_ROOT, pAmple_io);
/* ROOTS_ST only if needed */
if ((pAmple_io->iMaxRootCount > 1) && pAmple_io->pCompoundRootPairs)
	add_builtin_fns( &pAmple_io->pRootSuccTests, asCompoundRootTestTable_m,
			 iCompoundRootTestTableSize_m, AMPLE_ROOT, pAmple_io);

if (pAmple_io->iMaxSuffixCount)
	{
	add_builtin_fns( &pAmple_io->pSuffixSuccTests, asStringEnvTestTable_m,
			 iStringEnvTestTableSize_m, AMPLE_SFX, pAmple_io);
				/* 3.3.0 hab */
	add_builtin_fns( &pAmple_io->pSuffixSuccTests, asPunctEnvTestTable_m,
			 iPunctEnvTestTableSize_m, AMPLE_SFX, pAmple_io);
	/* ADHOC_ST only if needed */
	if (pAmple_io->pSuffixAdhocPairs)
	add_builtin_fns( &pAmple_io->pSuffixSuccTests, asAdhocTestTable_m,
			 iAdhocTestTableSize_m, AMPLE_SFX, pAmple_io);
	}

add_builtin_fns( &pAmple_io->pFinalTests, asFinalTestTable_m,
		 iFinalTestTableSize_m, AMPLE_FINAL, pAmple_io);
}

/*****************************************************************************
 * NAME
 *    loadAmpleControlFile
 * DESCRIPTION
 *    load the "analysis data file"
 * RETURN VALUE
 *    0 if successful, 1 if an error occurs
 */
int loadAmpleControlFile(pszInputFile_in, pAmple_io)
const char *	pszInputFile_in;
AmpleData *	pAmple_io;
{
FILE *		pInputFP;
char *		rp;

pInputFP = fopen(pszInputFile_in, "r");
if (pInputFP == NULL)
	{
	reportError(ERROR_MSG,
		"Cannot open analysis data file %s\n", pszInputFile_in);
	return 2;
	}
/*
 *  get data record
 */
rp = readStdFormatRecord(pInputFP,
			 &sAnalysisCodeTable_m,
			 pAmple_io->cBeginComment,
			 NULL);
fclose(pInputFP);
if (rp != NULL)
	{
	getAndClearAllocMemorySum();         /* Clear memory used for report */
	adata_create(rp, pAmple_io);
	pAmple_io->pszAnalysisDataFile = duplicateString( pszInputFile_in );
#ifndef THINK_C
	freeAmpleYYLexBuffer(); /* free buffer allocated by yylex */
#endif
	return 0;
	}
return 1;
}

/*****************************************************************************
 * NAME
 *    freeAmpleTestTree
 * DESCRIPTION
 *    free the memory allocated for an AMPLE user-defined test tree
 * RETURN VALUE
 *    none
 */
static void freeAmpleTestTree(pTree_io)
AmpleTestNode *	pTree_io;
{
if (pTree_io == NULL)
	return;

switch (pTree_io->iOpCode & OP_MASK)
	{
	case TOP_NODE:
	freeMemory( pTree_io->uRight.pszString );
	freeAmpleTestTree( pTree_io->uLeft.pChild );
	break;

	case LOGAND:	/* 'AND' (A && B) */
	case LOGOR:		/* 'OR' (A || B) */
	case LOGXOR:	/* 'XOR' ((!A && B) || (A && !B)) */
	case LOGIFF:	/* 'IFF' ((A && B) || (!A && !B)) */
	case LOGIF:		/* 'IF' ... 'THEN' (!A || B) */
	freeAmpleTestTree( pTree_io->uLeft.pChild );
	freeAmpleTestTree( pTree_io->uRight.pChild );
	break;

	case ALL_LEFT:	/* 'FOR_ALL_LEFT' */
	case SOME_LEFT:	/* 'FOR_SOME_LEFT' */
	case ALL_RIGHT:	/* 'FOR_ALL_RIGHT' */
	case SOME_RIGHT:	/* 'FOR_SOME_RIGHT' */
	freeAmpleTestTree( pTree_io->uLeft.pChild );
	break;

	case PROP_IS:	/* 'property' 'is' IDENTIFIER */
	break;
	case MORPH_IS:	/* 'morphname' 'is' STRING */
	freeMemory( pTree_io->uRight.pszString );
	break;
	case ALLO_IS:	/* 'allomorph' 'is'  STRING */
	freeMemory( pTree_io->uRight.pszString );
	break;
	case ALLO_MATCH:	/* 'allomorph' 'matches'  STRING */
	freeMemory( pTree_io->uRight.pszString );
	break;
	case STRING_IS:	/* 'string' 'is'  STRING */
	freeMemory( pTree_io->uRight.pszString );
	break;
	case ST_MATCH:	/* 'string' 'matches'  STRING */
	freeMemory( pTree_io->uRight.pszString );
	break;
	case WORD_IS:	/* ... 'word' 'is' STRING */
	freeMemory( pTree_io->uRight.pszString );
	break;
	case WORD_MATCH:	/* 'word' 'matches' STRING */
	freeMemory( pTree_io->uRight.pszString );
	break;

	default:
	break;
	}

freeMemory( pTree_io );
}

/*****************************************************************************
 * NAME
 *    freeAmpleTestList
 * DESCRIPTION
 *    free the memory allocated for a list of AMPLE successor or final tests
 * RETURN VALUE
 *    none
 */
static void freeAmpleTestList(pTestList_io)
AmpleTestList *		pTestList_io;
{
AmpleTestList *		pTest;
AmpleTestList *		pNextTest;

for ( pTest = pTestList_io ; pTest ; pTest = pNextTest )
	{
	pNextTest = pTest->pNext;
	if (pTest->pTestTree != NULL)
	freeAmpleTestTree( pTest->pTestTree );
	freeMemory( pTest );
	}
}

/*****************************************************************************
 * NAME
 *    removeDuplicatedTests
 * DESCRIPTION
 *    clear pointers to duplicated user-defined tests
 * RETURN VALUE
 *    none
 */
static void removeDuplicatedTests(pAmple_io)
AmpleData *	pAmple_io;
{
AmpleTestList *	aTests[5];
AmpleTestList *	pTestI;
AmpleTestList *	pTestJ;
int		i;
int		j;

aTests[0] = pAmple_io->pPrefixSuccTests;
aTests[1] = pAmple_io->pRootSuccTests;
aTests[2] = pAmple_io->pSuffixSuccTests;
aTests[3] = pAmple_io->pInfixSuccTests;
aTests[4] = pAmple_io->pFinalTests;

for ( i = 0 ; i < 4 ; ++i )
	{
	for ( pTestI = aTests[i] ; pTestI ; pTestI = pTestI->pNext )
	{
	for ( j = i+1 ; j < 5 ; ++j )
		{
		for ( pTestJ = aTests[j] ; pTestJ ; pTestJ = pTestJ->pNext )
		{
		if (pTestI->pTestTree == pTestJ->pTestTree)
			pTestJ->pTestTree = NULL;
		}
		}
	}
	}
}

/*****************************************************************************
 * NAME
 *    freeAmplePairList
 * DESCRIPTION
 *    free the memory allocated for a list of pairs of strings
 * RETURN VALUE
 *    void
 */
static void freeAmplePairList( pPairList_io )
AmplePairList *		pPairList_io;
{
AmplePairList *		pPair;
AmplePairList *		pNextPair;

for ( pPair = pPairList_io ; pPair ; pPair = pNextPair )
	{
	pNextPair = pPair->pNext;
	if (pPair->pszLeft != NULL)
	freeMemory( pPair->pszLeft );
	if (pPair->pszRight != NULL)
	freeMemory( pPair->pszRight );
	freeMemory( pPair );
	}
}

/*****************************************************************************
 * NAME
 *    freeAmpleMorphConstraints
 * DESCRIPTION
 *    free the memory allocated for a list of AMPLE morpheme co-occurrence
 *    constraints
 * RETURN VALUE
 *    none
 */
void freeAmpleMorphConstraints( pMorphConstraints_io )
AmpleMorphConstraint *	pMorphConstraints_io;
{
AmpleMorphConstraint *	pConstraint;
AmpleMorphConstraint *	pNextConstraint;
AmpleMorphlist *	pMorph;
AmpleMorphlist *	pNextMorph;

for (	pConstraint = pMorphConstraints_io ;
	pConstraint ;
	pConstraint = pNextConstraint )
	{
	pNextConstraint = pConstraint->pNext;
	if (pConstraint->pszLabel != NULL)
	freeMemory(pConstraint->pszLabel);
	for ( pMorph = pConstraint->pMorphs ; pMorph ; pMorph = pNextMorph )
	{
	pNextMorph = pMorph->pNext;
	if (!pMorph->bClass)
		freeMemory( pMorph->u.pszMorphName );
	freeMemory( pMorph );
	}
	if (pConstraint->pEnvironment != NULL)
	freeAmpleEnvConstraint( pConstraint->pEnvironment );
	freeMemory( pConstraint );
	}
}

/*****************************************************************************
 * NAME
 *    resetAmpleData
 * DESCRIPTION
 *    free the memory allocated for the AMPLE control data and reestablish the
 *    default values
 * RETURN VALUE
 *    none
 */
void resetAmpleData(pAmple_io)
AmpleData *	pAmple_io;
{
/*
 *  data from analysis data file
 */
if (pAmple_io->pszAnalysisDataFile != NULL)
	{
	freeMemory( pAmple_io->pszAnalysisDataFile );
	pAmple_io->pszAnalysisDataFile = NULL;
	}
removeDuplicatedTests( pAmple_io );
freeAmpleTestList( pAmple_io->pPrefixSuccTests );
freeAmpleTestList( pAmple_io->pRootSuccTests );
freeAmpleTestList( pAmple_io->pSuffixSuccTests );
freeAmpleTestList( pAmple_io->pInfixSuccTests );
freeAmpleTestList( pAmple_io->pFinalTests );
pAmple_io->pPrefixSuccTests = NULL;
pAmple_io->pRootSuccTests   = NULL;
pAmple_io->pSuffixSuccTests = NULL;
pAmple_io->pInfixSuccTests  = NULL;
pAmple_io->pFinalTests      = NULL;

freeAmplePairList( pAmple_io->pInfixAdhocPairs );
freeAmplePairList( pAmple_io->pPrefixAdhocPairs );
freeAmplePairList( pAmple_io->pRootAdhocPairs );
freeAmplePairList( pAmple_io->pSuffixAdhocPairs );
pAmple_io->pInfixAdhocPairs  = NULL;
pAmple_io->pPrefixAdhocPairs = NULL;
pAmple_io->pRootAdhocPairs   = NULL;
pAmple_io->pSuffixAdhocPairs = NULL;

if (pAmple_io->pCompoundRootPairs != NULL)
	{
	freeMemory( pAmple_io->pCompoundRootPairs );
	pAmple_io->pCompoundRootPairs = NULL;
	}
freeAmpleMorphClasses(pAmple_io->pMorphClasses);
pAmple_io->pMorphClasses     = NULL;
freeAmpleCategories(pAmple_io->pCategories);
pAmple_io->pCategories       = NULL;
freeAmpleCategClasses(pAmple_io->pCategoryClasses);
pAmple_io->pCategoryClasses  = NULL;
freeAmpleProperties(&pAmple_io->sProperties, pAmple_io->pPropertySets);
pAmple_io->pPropertySets     = NULL;
freeAmpleMorphConstraints( pAmple_io->pMorphConstraints );
pAmple_io->pMorphConstraints = NULL;
				/* 3.3.0 hab */
if (pAmple_io->pPunctClasses != NULL)
	{
	freePunctClasses(pAmple_io->pPunctClasses);
	pAmple_io->pPunctClasses = NULL;
	}
/*
 *  set default values
 */
pAmple_io->eWriteCategory        = AMPLE_NO_CATEGORY;
pAmple_io->bWriteMorphCats       = FALSE;
pAmple_io->cBeginRoot            = '<';
pAmple_io->cEndRoot              = '>';
pAmple_io->iMaxPrefixCount       = 0;
pAmple_io->iMaxInfixCount        = 0;
pAmple_io->iMaxRootCount         = 1;
pAmple_io->iMaxSuffixCount       = 100;
pAmple_io->iMaxNullCount         = 10;
pAmple_io->bDictionaryCapitals   = FALSE;
/*
 *  data from dictionary codes table file
 */
if (pAmple_io->pszDictionaryCodesFile != NULL)
	freeMemory( pAmple_io->pszDictionaryCodesFile );
if (pAmple_io->pPrefixTable != NULL)
	freeCodeTable( pAmple_io->pPrefixTable );
if (pAmple_io->pInfixTable != NULL)
	freeCodeTable( pAmple_io->pInfixTable );
if (pAmple_io->pSuffixTable != NULL)
	freeCodeTable( pAmple_io->pSuffixTable );
if (pAmple_io->pRootTable != NULL)
	freeCodeTable( pAmple_io->pRootTable );
#ifndef rbr3317
if (pAmple_io->pDictTable != NULL)
	freeCodeTable( pAmple_io->pDictTable);
#endif /* rbr3317 */
pAmple_io->pszDictionaryCodesFile = NULL;
pAmple_io->pPrefixTable           = NULL;
pAmple_io->pInfixTable            = NULL;
pAmple_io->pSuffixTable           = NULL;
pAmple_io->pRootTable             = NULL;
#ifndef rbr3317
pAmple_io->pDictTable             = NULL;
#endif /* rbr3317 */
/*
 *  data from dictionary orthography changes table file
 */
if (pAmple_io->pszDictOrthoChangeFile != NULL)
	{
	freeMemory( pAmple_io->pszDictOrthoChangeFile );
	pAmple_io->pszDictOrthoChangeFile = NULL;
	}
if (pAmple_io->pDictOrthoChanges != NULL)
	{
	freeChangeList( pAmple_io->pDictOrthoChanges );
	pAmple_io->pDictOrthoChanges = NULL;
	}
/*
 *  data from dictionary files
 */
freeAmpleDictionary( pAmple_io );
freeAmpleSelectiveAnalInfo( pAmple_io );
/*
 *  data from the text input control file
 */
resetTextControl( &(pAmple_io->sTextCtl) );
/*
 *  data from the text input control file, dictionary files, ...
 */
if (pAmple_io->pStringClasses != NULL)
	{
	freeStringClasses(pAmple_io->pStringClasses);
	pAmple_io->pStringClasses = NULL;
	}
if (pAmple_io->pszTrace != NULL)
	{
	freeMemory(pAmple_io->pszTrace);
	pAmple_io->pszTrace    = NULL;
	}
pAmple_io->uiTraceSize = 0;
#ifdef EXPERIMENTAL
/*
 *  data from the PC-PATR grammar file
 */
freePATRGrammar(&pAmple_io->sPATR);
pAmple_io->sPATR.bFailure        = FALSE;
pAmple_io->sPATR.bUnification    = TRUE;
pAmple_io->sPATR.eTreeDisplay    = PATR_FLAT_TREE;
pAmple_io->sPATR.bGloss          = TRUE;
pAmple_io->sPATR.bGlossesExist   = TRUE;
pAmple_io->sPATR.iFeatureDisplay = PATR_FEATURE_ON | PATR_FEATURE_FLAT |
								  PATR_FEATURE_ALL;
pAmple_io->sPATR.bCheckCycles    = TRUE;
pAmple_io->sPATR.bTopDownFilter  = TRUE;
pAmple_io->sPATR.iMaxAmbiguities = 10;
pAmple_io->sPATR.iDebugLevel     = 0;
pAmple_io->sPATR.cComment        = PATR_DEFAULT_COMMENT;
pAmple_io->sPATR.bSilent         = FALSE;
pAmple_io->sPATR.bShowWarnings   = TRUE;
pAmple_io->sPATR.bPromoteDefAtoms = TRUE;
pAmple_io->sPATR.bPropIsFeature  = TRUE;
pAmple_io->sPATR.pLogFP          = NULL;
pAmple_io->uiPATRCallCount       = 0L;
pAmple_io->uiPATRFailCount       = 0L;
pAmple_io->uiPATRSkipCount       = 0L;
#endif /* EXPERIMENTAL */
/*
 *  data from the AMPLE command line
 */
pAmple_io->bDebugAllomorphConds = FALSE;
pAmple_io->cBeginComment        = '|';
pAmple_io->iMaxTrieDepth        = 2;
pAmple_io->bRootGlosses         = FALSE;
pAmple_io->iMaxMorphnameLength  = 15;
pAmple_io->eTraceAnalysis       = AMPLE_TRACE_OFF;
pAmple_io->iDebugLevel          = 0;
}

#ifdef EXPERIMENTAL
#include "cmd.h"

#define KW_CHECKCYCLES        1
#define KW_DEBUGGINGLEVEL     2
#define KW_FEATURESTYLE       3
#define KW_MAXAMBIGUITY       4
#define KW_SHOWALLFEATURES    5
#define KW_SHOWFAILURES       6
#define KW_SHOWFEATURES       7
#define KW_SHOWGLOSSES        8
#define KW_TIMELIMIT          9
#define KW_TOPDOWNFILTER     10
#define KW_TREESTYLE         11
#define KW_TRIMEMPTYFEATURES 12
#define KW_UNIFICATION       13
#define KW_PROMOTEDEFATOMS   14
#define KW_PROPFEATURE       15

#define KW_OFF      20
#define KW_ON       21

#define KW_FLAT     30
#define KW_FULL     31
#define KW_INDENTED 32
#define KW_NONE     33
#define KW_XML      34

static const CmdKeyword rgKeywords_m[] = {
	{ "checkcycles",		KW_CHECKCYCLES,		0 },
	{ "debugginglevel",		KW_DEBUGGINGLEVEL,	0 },
	{ "featurestyle",		KW_FEATURESTYLE,	0 },
	{ "maxambiguity",		KW_MAXAMBIGUITY,	0 },
	{ "promotedefatoms",	KW_PROMOTEDEFATOMS,	0 },
	{ "propertyisfeature",	KW_PROPFEATURE,		0 },
	{ "showallfeatures",	KW_SHOWALLFEATURES,	0 },
	{ "showfailures",		KW_SHOWFAILURES,	0 },
	{ "showfeatures",		KW_SHOWFEATURES,	0 },
	{ "showglosses",		KW_SHOWGLOSSES,		0 },
	{ "timelimit",		KW_TIMELIMIT,		0 },
	{ "topdownfilter",		KW_TOPDOWNFILTER,	0 },
	{ "treestyle",		KW_TREESTYLE,		0 },
	{ "trimemptyfeatures",	KW_TRIMEMPTYFEATURES,	0 },
	{ "unification",		KW_UNIFICATION,		0 },
};
static const int cKeywords_m = (sizeof(rgKeywords_m) / sizeof(CmdKeyword));

static const CmdKeyword rgOnOff_m[] = {
	{ "off",	KW_OFF, 0 },
	{ "on",	KW_ON,  0 },
	};
static const int cOnOff_m = (sizeof(rgOnOff_m) / sizeof(CmdKeyword));

const CmdKeyword rgTreeStyle_m[] = {
	{ "flat",		KW_FLAT,     0 },
	{ "full",		KW_FULL,     0 },
	{ "indented",	KW_INDENTED, 0 },
	{ "none",		KW_NONE,     0 },
	{ "xml",		KW_XML,      0 },
	};
const int cTreeStyle_m = (sizeof(rgTreeStyle_m) / sizeof(CmdKeyword));

const CmdKeyword rgFeatureStyle_m[] = {
	{ "flat",	KW_FLAT, 0 },
	{ "full",	KW_FULL, 0 },
	};
const int cFeatureStyle_m = (sizeof(rgFeatureStyle_m) / sizeof(CmdKeyword));

/*****************************************************************************
 * NAME
 *    patr_setting_error
 * DESCRIPTION
 *    report an error in a \patr setting field
 * RETURN VALUE
 *    none
 */
#ifdef HAVE_STDARG_H
static void patr_setting_error(AmpleData * pAmple_in,
				   const char * pszFormat_in, ...)
{
va_list marker;

va_start( marker, pszFormat_in );
#else
static void patr_setting_error( va_alist )
{
va_list marker;
AmpleData * pAmple_in;
char *	pszFormat_in;

va_start( marker );
pAmple_in    = va_arg( marker, AmpleData * );
pszFormat_in = va_arg( marker, char * );
#endif

if (pAmple_in->pLogFP != NULL)
	{
#ifdef HAVE_VPRINTF
	vfprintf(pAmple_in->pLogFP, pszFormat_in, marker);
#else
#ifdef HAVE_DOPRNT
	_doprnt(pszFormat_in, marker, pAmple_in->pLogFP);
#endif
#endif
	}
va_end( marker );
}

/*****************************************************************************
 * NAME
 *    process_patr_setting
 * DESCRIPTION
 *    Process the content of a \patr field in the analysis control file.
 * RETURN VALUE
 *    none
 */
static void process_patr_setting(pszRec_in, pAmple_io)
char * pszRec_in;
AmpleData * pAmple_io;
{
char * pszKeyword;
char * pszValue;
static const char szMissingValue[] = "Missing value in \\patr %s field\n";
static const char szAmbigValue[] = "Ambiguous value in \\patr %s field: %s\n";
static const char szInvalidValue[] = "Invalid value in \\patr %s field: %s\n";
pszKeyword = pszRec_in;
pszValue = isolateWord(pszRec_in);
isolateWord(pszValue);

switch (lookupCmdKeyword(pszKeyword, rgKeywords_m, cKeywords_m, NULL))
	{
	case CMD_NULL:
	patr_setting_error(pAmple_io, "Missing keyword in \\patr field\n");
	break;
	case CMD_AMBIGUOUS:
	patr_setting_error(pAmple_io,
			   "Ambiguous keyword in \\patr field: %s\n",
			   pszKeyword);
	break;
	case KW_CHECKCYCLES:
	switch (lookupCmdKeyword(pszValue, rgOnOff_m, cOnOff_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_ON:
		pAmple_io->sPATR.bCheckCycles = TRUE;
		break;
		case KW_OFF:
		pAmple_io->sPATR.bCheckCycles = FALSE;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_DEBUGGINGLEVEL:
	if ((pszValue == NULL) || (*pszValue == NUL))
		{
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		}
	else
		{
		char * psz;
		long iTemp = strtol(pszValue, &psz, 10);
		if ((psz == pszValue) || (iTemp < 0))
		{
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		}
		else
		{
		pAmple_io->sPATR.iDebugLevel = (short)iTemp;
		if ((long)pAmple_io->sPATR.iDebugLevel != iTemp)
			{
			pAmple_io->sPATR.iDebugLevel = ~0;
			}
		}
		}
	break;
	case KW_FEATURESTYLE:
	switch (lookupCmdKeyword(pszValue, rgFeatureStyle_m, cFeatureStyle_m,
				 NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_FLAT:
		pAmple_io->sPATR.iFeatureDisplay |= PATR_FEATURE_FLAT;
		break;
		case KW_FULL:
		pAmple_io->sPATR.iFeatureDisplay &= ~PATR_FEATURE_FLAT;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_MAXAMBIGUITY:
	if ((pszValue == NULL) || (*pszValue == NUL))
		{
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		}
	else
		{
		char * psz;
		long iTemp = strtol(pszValue, &psz, 10);
		if ((psz == pszValue) || (iTemp < 0))
		{
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		}
		else
		{
		pAmple_io->sPATR.iMaxAmbiguities = (unsigned short)iTemp;
		if ((long)pAmple_io->sPATR.iMaxAmbiguities != iTemp)
			{
			pAmple_io->sPATR.iMaxAmbiguities = ~0;
			}
		}
		}
	break;
	case KW_SHOWALLFEATURES:
	switch (lookupCmdKeyword(pszValue, rgOnOff_m, cOnOff_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_ON:
		pAmple_io->sPATR.iFeatureDisplay |= PATR_FEATURE_ALL;
		break;
		case KW_OFF:
		pAmple_io->sPATR.iFeatureDisplay &= ~PATR_FEATURE_ALL;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_SHOWFAILURES:
	switch (lookupCmdKeyword(pszValue, rgOnOff_m, cOnOff_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_ON:
		pAmple_io->sPATR.bFailure = TRUE;
		break;
		case KW_OFF:
		pAmple_io->sPATR.bFailure = FALSE;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_SHOWFEATURES:
	switch (lookupCmdKeyword(pszValue, rgOnOff_m, cOnOff_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_ON:
		pAmple_io->sPATR.iFeatureDisplay |= PATR_FEATURE_ON;
		break;
		case KW_OFF:
		pAmple_io->sPATR.iFeatureDisplay &= ~PATR_FEATURE_ON;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_SHOWGLOSSES:
	switch (lookupCmdKeyword(pszValue, rgOnOff_m, cOnOff_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_ON:
		pAmple_io->sPATR.bGloss = TRUE;
		break;
		case KW_OFF:
		pAmple_io->sPATR.bGloss = FALSE;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_TIMELIMIT:
	if ((pszValue == NULL) || (*pszValue == NUL))
		{
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		}
	else
		{
		char * psz;
		time_t iTemp = strtoul(pszValue, &psz, 10);
		if (psz == pszValue)
		{
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		}
		else
		{
		pAmple_io->sPATR.iMaxProcTime = iTemp;
		}
		}
	break;
	case KW_TOPDOWNFILTER:
	switch (lookupCmdKeyword(pszValue, rgOnOff_m, cOnOff_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_ON:
		pAmple_io->sPATR.bTopDownFilter = TRUE;
		break;
		case KW_OFF:
		pAmple_io->sPATR.bTopDownFilter = FALSE;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_TREESTYLE:
	switch (lookupCmdKeyword(pszValue, rgTreeStyle_m, cTreeStyle_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_FLAT:
		pAmple_io->sPATR.eTreeDisplay = PATR_FLAT_TREE;
		break;
		case KW_FULL:
		pAmple_io->sPATR.eTreeDisplay = PATR_FULL_TREE;
		break;
		case KW_INDENTED:
		pAmple_io->sPATR.eTreeDisplay = PATR_INDENTED_TREE;
		break;
		case KW_NONE:
		pAmple_io->sPATR.eTreeDisplay = PATR_NO_TREE;
		break;
		case KW_XML:
		pAmple_io->sPATR.eTreeDisplay = PATR_XML_TREE;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_TRIMEMPTYFEATURES:
	switch (lookupCmdKeyword(pszValue, rgOnOff_m, cOnOff_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_ON:
		pAmple_io->sPATR.iFeatureDisplay |= PATR_FEATURE_TRIM;
		break;
		case KW_OFF:
		pAmple_io->sPATR.iFeatureDisplay &= ~PATR_FEATURE_TRIM;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_UNIFICATION:
	switch (lookupCmdKeyword(pszValue, rgOnOff_m, cOnOff_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_ON:
		pAmple_io->sPATR.bUnification = TRUE;
		break;
		case KW_OFF:
		pAmple_io->sPATR.bUnification = FALSE;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_PROMOTEDEFATOMS:
	switch (lookupCmdKeyword(pszValue, rgOnOff_m, cOnOff_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_ON:
		pAmple_io->sPATR.bPromoteDefAtoms = TRUE;
		break;
		case KW_OFF:
		pAmple_io->sPATR.bPromoteDefAtoms = FALSE;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	case KW_PROPFEATURE:
	switch (lookupCmdKeyword(pszValue, rgOnOff_m, cOnOff_m, NULL))
		{
		case CMD_NULL:
		patr_setting_error(pAmple_io, szMissingValue, pszKeyword);
		break;
		case CMD_AMBIGUOUS:
		patr_setting_error(pAmple_io, szAmbigValue,
				   pszKeyword, pszValue);
		break;
		case KW_ON:
		pAmple_io->sPATR.bPropIsFeature = TRUE;
		break;
		case KW_OFF:
		pAmple_io->sPATR.bPropIsFeature = FALSE;
		break;
		default:
		patr_setting_error(pAmple_io, szInvalidValue,
				   pszKeyword, pszValue);
		break;
		}
	break;
	default:
	patr_setting_error(pAmple_io,
			   "Invalid keyword in \\patr field: %s\n",
			   pszKeyword);
	break;
	}
}
#endif
