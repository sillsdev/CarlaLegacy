/* RULES.C - functions to load a rules file, free rules, etc. for PC-KIMMO
 ***************************************************************************
 *
 * int loadKimmoRules(unsigned char * pszRuleFile_in,
 *		      KimmoData *     pKimmo_io)
 *
 * void freeKimmoRules(KimmoData * pKimmo_io)
 *
 * void computeKimmoFeasiblePairs(KimmoData * pKimmo_io)
 *
 * void writeKimmoFeasiblePairs(FILE * pOutputFP_in, KimmoData * pKimmo_in)
 *
 * void writeKimmoRule(unsigned uiRuleNumber_in, FILE * pOutputFP_in,
 *		       KimmoData * pKimmo_in)
 *
 ***************************************************************************
 * Copyright 1989, 2002 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
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
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern char * strcpy  P((char * dest, const char * src));
extern char * strncpy P((char * dest, const char * src, size_t n));
extern char * strcat  P((char * dest, const char * src));
extern int    strcmp  P((const char * s1, const char * s2));
extern char * strchr  P((const char * s, int c));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "kimmo.h"
#include "kimmodef.h"

struct alignment_row
	{
	unsigned char lex_char, surf_char;
	unsigned char lex_type, surf_type;
	unsigned short *rule_column;
	};

static unsigned char *find_subset P((unsigned char *name, KimmoData *lang) );
static void prune_pairs P((KimmoRule *rulep, KimmoData *lang));
static int set_alphabet P((unsigned char **tokp, KimmoData *lang));
static int set_any P((KimmoData *lang));
static int set_null P((KimmoData *lang));
static int set_boundary P((KimmoData *lang));
static int add_subset P((unsigned char **tokp, KimmoData *lang));
static int add_rule P((KimmoData *lang));
static int add_twolc_rule P((KimmoData *lang,
				 unsigned char *rule_name_portion));
void free_alignment P((struct alignment_row *alignment, int num_rows));
static int get_alignment P((KimmoData *lang));
static int compare_size P((const VOIDP vap,const VOIDP vbp));
static int		is_alpha P((unsigned char *token,
					KimmoData * pKimmo_in));

/* same chars as isspace() */
static unsigned char szWhitespace_m[7] = " \t\n\v\f\r";

static FILE *rules_fp;		/* input rules FILE pointer */
static char *filename;		/* input rules file name */
static unsigned line_num;	/* input file line number */
static unsigned size_subsets;
static unsigned size_rules;

static int		bSilentMessages_m = FALSE;
static int		bShowWarnings_m   = TRUE;
static FILE *		pLogFP_m          = NULL;
static int		bTwoLCFile_m      = FALSE;
/*
 *  error messages
 */
static NumberedMessage sBadRuleFile_m			= { ERROR_MSG,   200,
	"Rules file could not be opened: %s" };
static NumberedMessage sUnexpectedEndOfRules_m		= { ERROR_MSG,   201,
	"Unexpected end of rules file: %s" };
static NumberedMessage sExpectedALPHABET_m		= { ERROR_MSG,   202,
	"Expected ALPHABET keyword" };
static NumberedMessage sNoALPHABETvalue_m		= { ERROR_MSG,   203,
	"Alphabet contains no members" };
static NumberedMessage sTooManyCharsInAlphabet_m	= { ERROR_MSG,   204,
	"Too many characters in the alphabet" };
static NumberedMessage sCharInAlphabet_m		= { WARNING_MSG, 205,
	"Character is already in the alphabet: %s" };
static NumberedMessage sMissingNULLvalue_m		= { ERROR_MSG,   206,
	"No value given for NULL keyword" };
static NumberedMessage sBadNULLvalue_m			= { ERROR_MSG,   207,
   "Value given for NULL symbol was already declared as alphabetic: %c"};
static NumberedMessage sAlreadyHaveNULL_m		= { ERROR_MSG,   208,
	"The NULL symbol has already been defined" };
static NumberedMessage sNULLsameAsANY_m			= { ERROR_MSG,   209,
	"Value given for NULL symbol was already declared for ANY" };
static NumberedMessage sNULLsameAsBOUNDARY_m		= { ERROR_MSG,   210,
	"Value given for NULL symbol was already declared for BOUNDARY" };
static NumberedMessage sMissingANYvalue_m		= { ERROR_MSG,   211,
	"No value given for ANY keyword" };
static NumberedMessage sBadANYvalue_m			= { ERROR_MSG,   212,
   "Value given for ANY symbol was already declared as alphabetic: %c"};
static NumberedMessage sAlreadyHaveANY_m		= { ERROR_MSG,   213,
	"The ANY symbol has already been defined" };
static NumberedMessage sANYsameAsNULL_m			= { ERROR_MSG,   214,
	"Value given for ANY symbol was already declared for NULL" };
static NumberedMessage sANYsameAsBOUNDARY_m		= { ERROR_MSG,   215,
	"Value given for ANY symbol was already declared for BOUNDARY" };
static NumberedMessage sMissingBOUNDARYvalue_m		= { ERROR_MSG,   216,
	"No value given for BOUNDARY keyword" };
static NumberedMessage sBadBOUNDARYvalue_m		= { ERROR_MSG,   217,
   "Value given for BOUNDARY symbol was already declared as alphabetic: %c"};
static NumberedMessage sAlreadyHaveBOUNDARY_m		= { ERROR_MSG,   218,
	"The BOUNDARY symbol has already been defined" };
static NumberedMessage sBOUNDARYsameAsNULL_m		= { ERROR_MSG,   219,
	"Value given for BOUNDARY symbol was already declared for NULL" };
static NumberedMessage sBOUNDARYsameAsANY_m		= { ERROR_MSG,   220,
	"Value given for BOUNDARY symbol was already declared for ANY" };
static NumberedMessage sMissingSUBSETname_m		= { ERROR_MSG,   221,
	"Subset name not given" };
static NumberedMessage sBadSUBSETname_m			= { ERROR_MSG,   222,
	"Subset name %s is not unique" };
static NumberedMessage sEmptySUBSET_m			= { ERROR_MSG,   223,
	"Subset %s contains no members" };
static NumberedMessage sBadSUBSETvalue_m		= { ERROR_MSG,   224,
	"Subset %s contains a nonalphabetic character: %s" };
static NumberedMessage sCharInSUBSET_m			= { WARNING_MSG, 225,
	"Subset %s already contains %s" };
static NumberedMessage sInvalidKeyword_m		= { ERROR_MSG,   226,
	"Invalid keyword: %s" };
static NumberedMessage sUndefinedANY_m			= { WARNING_MSG, 227,
	"ANY symbol not defined" };
static NumberedMessage sUndefinedNULL_m			= { WARNING_MSG, 228,
	"NULL symbol not defined" };
static NumberedMessage sUndefinedBOUNDARY_m		= { ERROR_MSG,   229,
	"BOUNDARY symbol not defined" };
static NumberedMessage sBadRuleName_m			= { WARNING_MSG, 230,
	"Missing closing delimiter for the name of a rule: %s" };
static NumberedMessage sInvalidNumberOfRows_m		= { ERROR_MSG,   231,
	"Invalid number of rows: %s" };
static NumberedMessage sInvalidNumberOfColumns_m	= { ERROR_MSG,   232,
	"Invalid number of columns: %s" };
static NumberedMessage sBadStateNumber_m		= { ERROR_MSG,   233,
	"Invalid state number: %s" };
static NumberedMessage sBadFinalMark_m			= { ERROR_MSG,   234,
	"Expected final (:) or nonfinal (.) state indicator: %c" };
static NumberedMessage sBadTableEntry_m			= { ERROR_MSG,   235,
	"State table entry out of range: %s" };
static NumberedMessage sBadLexicalCharacter_m		= { ERROR_MSG,   236,
	"Lexical character not in alphabet: %s" };
static NumberedMessage sBadSurfaceCharacter_m		= { ERROR_MSG,   237,
	"Surface character not in alphabet: %s" };
static NumberedMessage sBadTableCharacter_m		= { ERROR_MSG,   238,
	 "Nonnumeric character in state table: %c" };
static NumberedMessage sBadColumnHead_m			= { ERROR_MSG,   239,
"Rule number %d, column %d pairs a BOUNDARY symbol with something else: %s:%s"
	};
static NumberedMessage sNoFeasiblePairsInRules_m	= { ERROR_MSG,   240,
	"No feasible pairs for this set of rules" };
static NumberedMessage sColumnConflict_m		= { WARNING_MSG, 241,
"RULE %d (\"%s\") - %s:%s specified by both columns %d (%s:%s) and %d (%s:%s)"
	};
static NumberedMessage sMissingFeasiblePair_m		= { WARNING_MSG, 242,
	"RULE %d (\"%s\") - %s:%s not specified by any column" };
static NumberedMessage sBadColumn2NULLs_m		= { ERROR_MSG,   243,
	"Rule number %d, column %d pairs two NULL symbols: %s:%s" };
static NumberedMessage sMissingCOMMENTvalue_m		= { WARNING_MSG, 244,
	"No value given for COMMENT keyword" };
static NumberedMessage sBadCOMMENTvalue_m		= { ERROR_MSG,   245,
	"Value given for COMMENT symbol was already declared as alphabetic: %c"};
static NumberedMessage sCOMMENTsameAsNULL_m		= { ERROR_MSG,   246,
	"Value given for COMMENT symbol was already declared for NULL" };
static NumberedMessage sCOMMENTsameAsBOUNDARY_m		= { ERROR_MSG,   247,
	"Value given for COMMENT symbol was already declared for BOUNDARY"};
static NumberedMessage sCOMMENTsameAsANY_m		= { ERROR_MSG,   248,
	"Value given for COMMENT symbol was already declared for ANY" };
static NumberedMessage sInvalidTwolcKeyword_m		= { ERROR_MSG,   249,
	"Invalid keyword for twolc rules files: %s" };
static NumberedMessage sSUBSETinTwolcFile_m		= { ERROR_MSG,   250,
	"SUBSETs not allowed in twolc rules file" };
static NumberedMessage sMissingRuleNameDelim_m		= { WARNING_MSG, 251,
	"Missing opening delimiter for the name of a rule" };
static NumberedMessage sNoRulesDefined_m		= { ERROR_MSG,   252,
	"No rules defined %s" };
static NumberedMessage sBadColumnNumber_m		= { ERROR_MSG,   253,
	"Invalid column number %s in alignment for correspondence pair %s:%s"};
static NumberedMessage sPairInAlignmentTwice_m		= { ERROR_MSG,   254,
	"Pair occurs in alignment twice: %s:%s" };
static NumberedMessage sShortAlignmentRow_m		= { ERROR_MSG,   255,
	 "Too few columns in alignment for correspondence pair %s:%s" };
static NumberedMessage sLongAlignmentRow_m		= { ERROR_MSG,   256,
	 "Too many columns in alignment for correspondence pair %s:%s" };
static NumberedMessage sNoFeasiblePairsInColumn_m	= { ERROR_MSG,   257,
	"RULE %d (\"%s\") - no feasible pairs specified for column %d" };
static NumberedMessage sTwoLCOnOff_m			= { WARNING_MSG, 258,
	"Sorry, cannot set \"twolc\" rules on and off\n" };

#define MAXALPH	255	/* maximum number of alphabetic characters */
/*
 *  macro to check whether a token is a rules file keyword
 */
#define is_keyword(token) \
( (strcmp(token,"ALPHABET")==0) || (strcmp(token,"NULL")==0) || \
  (strcmp(token,"ANY")==0) || (strcmp(token,"BOUNDARY")==0) || \
  (strcmp(token,"SUBSET")==0) || (strcmp(token,"RULE")==0) || \
  (strcmp(token,"END")==0) || (strcmp(token,"COMMENT")==0) )

#ifdef applec
#pragma segment S_rules
#endif

/****************************************************************************
 * NAME
 *    freeKimmoRules
 * ARGUMENTS
 *    lang - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Free the memory used for storing rules for the language.
 * RETURN VALUE
 *    none
 */
void freeKimmoRules(lang)
KimmoData *lang;
{
unsigned i;
unsigned j;
register KimmoRule *rp;
register KimmoFSAColumn *cp;
/*
 *  clear the stored alphabet information
 */
if (lang->ppszAlphabet != (unsigned char **)NULL)
	{
	for ( i = 0 ; i < lang->uiAlphabetSize ; ++i )
	freeMemory(lang->ppszAlphabet[i]);
	freeMemory(lang->ppszAlphabet);
	lang->ppszAlphabet = (unsigned char **)NULL;
	lang->uiAlphabetSize = 0;
	}
lang->cNull = NUL;
lang->cAny  = NUL;
lang->cBoundary = NUL;

if (lang->pSubsets)
	{
	for ( i = 0 ; i < lang->uiSubsetCount ; ++i )
	{
	if (lang->pSubsets[i].pszName != (unsigned char *)NULL)
		freeMemory(lang->pSubsets[i].pszName);
	if (lang->pSubsets[i].pszMembers != (unsigned char *)NULL)
		freeMemory(lang->pSubsets[i].pszMembers);
	}
	freeMemory( lang->pSubsets );
	}
lang->pSubsets = (KimmoSubset *)NULL;
lang->uiSubsetCount = 0;
/*
 *  clear the feasible pairs
 */
if (lang->pFeasiblePairs != NULL)
	{
	freeMemory(lang->pFeasiblePairs);
	lang->pFeasiblePairs = NULL;
	}
lang->uiFeasiblePairsCount = 0;
/*
 *  clear the automata
 */
if (lang->pAutomata)
	{
	for ( rp = lang->pAutomata, i = 0 ; i < lang->uiAutomataSize ; ++i, ++rp )
	{
	freeMemory(rp->pszName);
	if (rp->pColumns)
		{
		for ( cp = rp->pColumns, j = 0 ; j < rp->iColumnCount ; ++j, ++cp )
		{
		if (cp->pszLexName)
			freeMemory( cp->pszLexName );
		if (cp->pLexChars)
			freeMemory( cp->pLexChars );
		if (cp->pszSurfName)
			freeMemory( cp->pszSurfName );
		if (cp->pSurfChars)
			freeMemory( cp->pSurfChars );
		if (cp->puiTransitions)
			freeMemory( cp->puiTransitions );
		}
		freeMemory( rp->pColumns );
		}
	freeMemory(rp->puiFinalStates);
	}
	freeMemory(lang->pAutomata);
	}
lang->pAutomata = (KimmoRule *)NULL;
lang->uiAutomataSize = 0;
freeMemory(lang->pszRulesFile);
lang->pszRulesFile = (char *)NULL;
}

/****************************************************************************
 * NAME
 *    find_subset
 * ARGUMENTS
 *    name - pointer to the name of the subset
 *    lang - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Search for a matching alphabet subset, and return a pointer to the
 *    associated string of characters.
 * RETURN VALUE
 *    pointer to the string of alphabetic characters associated with the
 *    subset name, or NULL if name is not associated with a subset
 */
static unsigned char *find_subset(name,lang)
unsigned char *name;
KimmoData *lang;
{
register unsigned k;
register KimmoSubset *sp;

for ( sp = lang->pSubsets, k = 0 ; k < lang->uiSubsetCount ; ++k, ++sp )
	{
	if (!strcmp((char *)sp->pszName,(char *)name))
	return(sp->pszMembers);
	}
return((unsigned char *)NULL);
}

/****************************************************************************
 * NAME
 *    prune_pairs
 * ARGUMENTS
 *    rulep - pointer to a KimmoRule
 *    lang  - pointer to a KimmoData data structure
 * DESCRIPTION
 *    For each of the columns of a KimmoRule, trim feasible pairs that are
 *    subsumed by another column of lower specificity.
 *    Also check for overlapping feasible pairs in columns of equal
 *    specificity.
 * RETURN VALUE
 *    none
 */
static void prune_pairs(rulep,lang)
KimmoRule *rulep;
KimmoData *lang;
{
unsigned i, j;
register KimmoFSAColumn *cp, *xp;
unsigned ck, cl, cnum, xk, xnum;

for ( cp = rulep->pColumns, i = 0 ; i < rulep->iColumnCount ; ++i, ++cp )
	{
	for ( xp = rulep->pColumns, j = 0 ; j < rulep->iColumnCount ; ++j, ++xp )
	{
	if (xp->uiPrecedence >= cp->uiPrecedence)
		continue;
	/*
	 *  column xp has lower specificity than column cp, so if any
	 *    feasible pair in xp is also in cp, remove it from cp
	 */
	for ( xnum = strlen((char *)xp->pLexChars), xk = 0 ; xk < xnum ; ++xk )
		{
		for ( cnum=strlen((char *)cp->pLexChars), ck=0 ; ck < cnum ; ++ck )
		{
		if (	(xp->pLexChars[xk] == cp->pLexChars[ck]) &&
			(xp->pSurfChars[xk] == cp->pSurfChars[ck]) )
			{
			/*
			 *  remove cp->pLexChars[ck] and cp->pSurfChars[ck]
			 */
			for ( cl = ck ; cl < cnum ; ++cl)
			{
			cp->pLexChars[cl]  = cp->pLexChars[cl+1];
			cp->pSurfChars[cl] = cp->pSurfChars[cl+1];
			}
			--cnum;		/* fewer pairs to check now */
			cp->pLexChars[cnum] = NUL;
			cp->pSurfChars[cnum] = NUL;
			}
		}
		}
	}
	}
/*
 *  complain if there's any remaining overlap
 */
for ( cp = rulep->pColumns, i = 0 ; i < rulep->iColumnCount ; ++i, ++cp )
	{
	for (   xp = &rulep->pColumns[i+1], j = i + 1 ;
		j < rulep->iColumnCount ;
		++j, ++xp )
	{
	for ( xnum = strlen((char *)xp->pLexChars), xk = 0 ; xk < xnum ; ++xk )
		{
		for ( cnum=strlen((char *)cp->pLexChars), ck=0 ; ck < cnum ; ++ck )
		{
		if (	(xp->pLexChars[xk] == cp->pLexChars[ck]) &&
			(xp->pSurfChars[xk] == cp->pSurfChars[ck]) )
			{
			displayNumberedMessage(&sColumnConflict_m,
					   bSilentMessages_m, bShowWarnings_m,
					   pLogFP_m,
					   NULL, 0,
					 (int)(rulep - lang->pAutomata)+1,
					 rulep->pszName,
			 convertKimmoIndexToCharacter(xp->pLexChars[xk], lang),
			 convertKimmoIndexToCharacter(xp->pSurfChars[xk],lang),
					 i+1, cp->pszLexName, cp->pszSurfName,
					 j+1, xp->pszLexName, xp->pszSurfName );
			}
		}
		}
	}
	}
}

/*****************************************************************************
 * NAME
 *    is_alpha
 * ARGUMENTS
 *    token - pointer to a string with a single "character"
 *    lang  - pointer to the current KimmoData structure
 * DESCRIPTION
 *    search the alphabet for the "character" token
 * RETURN VALUE
 *    0 if not found, or array index + 1 if found
 */
static int is_alpha(token, lang)
unsigned char *token;
KimmoData *lang;
{
unsigned i;

for ( i = 0 ; i < lang->uiAlphabetSize ; ++i )
	{
	if (strcmp((char *)lang->ppszAlphabet[i], (char *)token) == 0)
	return( i+1 );
	}
return( 0 );
}

/****************************************************************************
 * NAME
 *    computeKimmoFeasiblePairs
 * ARGUMENTS
 *    lang - pointer to KimmoData data structure
 * DESCRIPTION
 *    Compute the feasible pairs for the active set of rules.
 * RETURN VALUE
 *    none
 */
void computeKimmoFeasiblePairs(lang)
KimmoData *lang;
{
KimmoRule *rp;
KimmoFSAColumn *cp;
unsigned i, j, k, x, idx;
unsigned char *lexp, *lexsub;
unsigned char *surfp, *surfsub;
unsigned num_pairs, num_allocated;
unsigned char *check_pairs;

if ( lang->pAutomata == (KimmoRule *)NULL )
	return;
/*
 *  release any previously allocated space
 */
for ( rp = lang->pAutomata, i = 0 ; i < lang->uiAutomataSize ; ++i, ++rp )
	{
	for ( cp = rp->pColumns, j = 0 ; j < rp->iColumnCount ; ++j, ++cp )
	{
	if (cp->pLexChars)
		{
		freeMemory(cp->pLexChars);
		cp->pLexChars = NULL;
		}
	if (cp->pSurfChars)
		{
		freeMemory(cp->pSurfChars);
		cp->pSurfChars = NULL;
		}
	cp->uiPrecedence = 0;
	}
	}
/*
 *  accumulate all the feasible pairs across all of the active rules
 */
num_pairs = 0;
num_allocated = 0;
lexp  = (unsigned char *)NULL;
surfp = (unsigned char *)NULL;
for ( rp = lang->pAutomata, i = 0 ; i < lang->uiAutomataSize ; ++i, ++rp )
	{
	if (!rp->bActive)
	continue;
	for ( cp = rp->pColumns, j = 0 ; j < rp->iColumnCount ; ++j, ++cp )
	{
	if (	!((	(cp->eLexType == KIMMO_ALPHABET_CHAR) ||
			(cp->eLexType == KIMMO_BOUNDARY_CHAR) ||
			(cp->eLexType == KIMMO_NULL_CHAR) )
			&&
		(	(cp->eSurfType == KIMMO_ALPHABET_CHAR) ||
			(cp->eSurfType == KIMMO_BOUNDARY_CHAR) ||
			(cp->eSurfType == KIMMO_NULL_CHAR) ))  )
		continue;			/* need both alphabetic or null */
	if (lexp == (unsigned char *)NULL)
		{
		/*
		 *  allocate space for the very first feasible pair
		 */
		num_allocated = 100;
		lexp  = (unsigned char *)allocMemory( num_allocated+1 );
		surfp = (unsigned char *)allocMemory( num_allocated+1 );
		idx = convertCharacterToKimmoIndex(cp->pszLexName, lang);
		lexp[num_pairs] = idx;
		idx = convertCharacterToKimmoIndex(cp->pszSurfName, lang);
		surfp[num_pairs] = idx;
		if ((lexp[num_pairs] != 0) && (surfp[num_pairs] != 0))
		++num_pairs;		/* don't advance if error */
		lexp[num_pairs] = NUL;
		surfp[num_pairs] = NUL;
		continue;
		}
	/*
	 *  check whether this feasible pair is already listed
	 */
	for ( k = 0 ; k < num_pairs ; ++k )
		{
		if (    (lexp[k] == convertCharacterToKimmoIndex(cp->pszLexName,
								 lang)) &&
			(surfp[k] == convertCharacterToKimmoIndex(cp->pszSurfName,
								  lang)) )
		break;			/* ==> k < num_pairs */
		}
	if (k == num_pairs)
		{
		/*
		 *  add this feasible pair to the list
		 */
		if (num_pairs == num_allocated)
		{
		num_allocated += 100;
		lexp  = (unsigned char *)reallocMemory(lexp, num_allocated+1);
		surfp = (unsigned char *)reallocMemory(surfp, num_allocated+1);
		}
		idx = convertCharacterToKimmoIndex(cp->pszLexName, lang);
		lexp[num_pairs] = idx;
		idx = convertCharacterToKimmoIndex(cp->pszSurfName, lang);
		surfp[num_pairs] = idx;
		if ((lexp[num_pairs] != 0) && (surfp[num_pairs] != 0))
		++num_pairs;		/* don't advance if error */
		lexp[num_pairs] = NUL;
		surfp[num_pairs] = NUL;
		}
	}
	}
if (num_pairs == 0)
	{
	sNoFeasiblePairsInRules_m.eType = WARNING_MSG;
	displayNumberedMessage(&sNoFeasiblePairsInRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   NULL, 0);
	sNoFeasiblePairsInRules_m.eType = ERROR_MSG;
	lang->uiFeasiblePairsCount = 0;
	lang->pFeasiblePairs = NULL;
	return;
	}
if (num_pairs != num_allocated)
	{
	lexp  = (unsigned char *)reallocMemory(lexp, num_pairs+1);
	surfp = (unsigned char *)reallocMemory(surfp, num_pairs+1);
	}
/*
 *  allocate array for verifying pairs
 */
check_pairs = (unsigned char *)allocMemory(num_pairs);
/*
 *  now, fill in the feasible pairs and precedence for each column of
 *  each rule
 */
for ( rp = lang->pAutomata, i = 0 ; i < lang->uiAutomataSize ; ++i, ++rp )
	{
	if (!rp->bActive)
	continue;
	for ( cp = rp->pColumns, j = 0 ; j < rp->iColumnCount ; ++j, ++cp )
	{
	cp->pLexChars = (unsigned char *)allocMemory(num_pairs+1);
	cp->pSurfChars = (unsigned char *)allocMemory(num_pairs+1);
	/*
	 *  *:* - any pair
	 */
	if (	(cp->eLexType  == KIMMO_ANY_CHAR) &&
		(cp->eSurfType == KIMMO_ANY_CHAR) )
		{
		strcpy((char *)cp->pLexChars,(char *)lexp);
		strcpy((char *)cp->pSurfChars,(char *)surfp);
		}
	/*
	 *  *:S - any pair with surface character in subset
	 */
	else if ((cp->eLexType  == KIMMO_ANY_CHAR) &&
		 (cp->eSurfType == KIMMO_SUBSET_CHAR))
		{
		surfsub = find_subset(cp->pszSurfName, lang);
		for ( x = 0, k = 0 ; k < num_pairs ; ++k )
		{
		if (strchr((char *)surfsub,(int)((char)surfp[k])) != NULL)
			{
			cp->pLexChars[x] = lexp[k];
			cp->pSurfChars[x] = surfp[k];
			++x;
			}
		}
		cp->pLexChars[x] = '\0';
		cp->pSurfChars[x] = '\0';
		}
	/*
	 *  *:c or *:0 - any pair with matching surface character
	 */
	else if (cp->eLexType == KIMMO_ANY_CHAR)
		{
		for ( x = 0, k = 0 ; k < num_pairs ; ++k )
		{
		if (	(   (surfp[k] == KIMMO_ALPHA_NULL) &&
				(cp->eSurfType == KIMMO_NULL_CHAR) ) ||
			(surfp[k] == is_alpha(cp->pszSurfName, lang)) )
			{
			cp->pLexChars[x] = lexp[k];
			cp->pSurfChars[x] = surfp[k];
			++x;
			}
		}
		cp->pLexChars[x] = '\0';
		cp->pSurfChars[x] = '\0';
		}
	/*
	 *  S:* - any pair with lexical character in subset
	 */
	else if ((cp->eLexType  == KIMMO_SUBSET_CHAR) &&
		 (cp->eSurfType == KIMMO_ANY_CHAR))
		{
		lexsub = find_subset(cp->pszLexName, lang);
		for ( x = 0, k = 0 ; k < num_pairs ; ++k )
		{
		if (strchr((char *)lexsub, (int)((char)lexp[k])) != NULL)
			{
			cp->pLexChars[x] = lexp[k];
			cp->pSurfChars[x] = surfp[k];
			++x;
			}
		}
		cp->pLexChars[x] = '\0';
		cp->pSurfChars[x] = '\0';
		}
	/*
	 *  S:S - any pair with lexical character and surface character each
	 *		in appropriate subsets
	 */
	else if ((cp->eLexType  == KIMMO_SUBSET_CHAR) &&
		 (cp->eSurfType == KIMMO_SUBSET_CHAR))
		{
		lexsub  = find_subset(cp->pszLexName, lang);
		surfsub = find_subset(cp->pszSurfName, lang);
		for ( x = 0, k = 0 ; k < num_pairs ; ++k )
		{
		if (  (strchr((char *)lexsub, (int)((char)lexp[k])) != NULL) &&
			  (strchr((char *)surfsub,(int)((char)surfp[k])) != NULL) )
			{
			cp->pLexChars[x] = lexp[k];
			cp->pSurfChars[x] = surfp[k];
			++x;
			}
		}
		cp->pLexChars[x] = '\0';
		cp->pSurfChars[x] = '\0';
		}
	/*
	 *  S:c or S:0 - any pair with lexical character in subset and
	 *		matching surface character
	 */
	else if (cp->eLexType == KIMMO_SUBSET_CHAR)
		{
		lexsub  = find_subset(cp->pszLexName, lang);
		for ( x = 0, k = 0 ; k < num_pairs ; ++k )
		{
		if ( (strchr((char *)lexsub,(int)((char)lexp[k])) != NULL) &&
			 (   (   (surfp[k] == KIMMO_ALPHA_NULL) &&
				 (cp->eSurfType == KIMMO_NULL_CHAR) ) ||
			 (surfp[k] == is_alpha(cp->pszSurfName, lang)) ) )
			{
			cp->pLexChars[x] = lexp[k];
			cp->pSurfChars[x] = surfp[k];
			++x;
			}
		}
		cp->pLexChars[x] = '\0';
		cp->pSurfChars[x] = '\0';
		}
	/*
	 *  c:* or 0:* - any pair with matching lexical character
	 */
	else if (cp->eSurfType == KIMMO_ANY_CHAR)
		{
		for ( x = 0, k = 0 ; k < num_pairs ; ++k )
		{
		if (	(   (lexp[k] == KIMMO_ALPHA_NULL) &&
				(cp->eLexType == KIMMO_NULL_CHAR) ) ||
			(lexp[k] == is_alpha(cp->pszLexName, lang)) )
			{
			cp->pLexChars[x] = lexp[k];
			cp->pSurfChars[x] = surfp[k];
			++x;
			}
		}
		cp->pLexChars[x] = '\0';
		cp->pSurfChars[x] = '\0';
		}
	/*
	 *  c:S or 0:S - any pair with matching lexical character and
	 *		surface character in subset
	 */
	else if (cp->eSurfType == KIMMO_SUBSET_CHAR)
		{
		surfsub  = find_subset(cp->pszSurfName, lang);
		for ( x = 0, k = 0 ; k < num_pairs ; ++k )
		{

		if (	(   (	(lexp[k] == KIMMO_ALPHA_NULL) &&
				(cp->eLexType == KIMMO_NULL_CHAR) ) ||
				(lexp[k] == is_alpha(cp->pszLexName, lang)) ) &&
			(strchr((char *)surfsub,surfp[k]) != (char *)NULL) )
			{
			cp->pLexChars[x] = lexp[k];
			cp->pSurfChars[x] = surfp[k];
			++x;
			}
		}
		cp->pLexChars[x] = '\0';
		cp->pSurfChars[x] = '\0';
		}
	/*
	 *  c:c  or c:0 or 0:c or 0:0 - only the matching pair
	 */
	else
		{
		cp->pLexChars[0] = convertCharacterToKimmoIndex(cp->pszLexName,
								lang);
		cp->pSurfChars[0] = convertCharacterToKimmoIndex(cp->pszSurfName,
								 lang);
		cp->pLexChars[1] = '\0';
		cp->pSurfChars[1] = '\0';
		}
	cp->uiPrecedence = strlen((char *)cp->pLexChars);
	if (cp->uiPrecedence < num_pairs)
		{
		cp->pLexChars = (unsigned char *)
				reallocMemory(cp->pLexChars, cp->uiPrecedence+1);
		cp->pSurfChars = (unsigned char *)
				reallocMemory(cp->pSurfChars,cp->uiPrecedence+1);
		}
	}
	/*
	 * now, prune the pairs stored for each column
	 */
	prune_pairs( rp, lang );
	/*
	 *  verify that this rule spans all possible feasible pairs
	 */
	memset((char *)check_pairs,NUL,num_pairs);
	for ( cp = rp->pColumns, j = 0 ; j < rp->iColumnCount ; ++j, ++cp )
	{
	for ( x = 0 ; x < strlen((char *)cp->pLexChars) ; ++x )
		{
		for ( k = 0 ; k < num_pairs ; ++k )
		{
		if (	(cp->pLexChars[x] == lexp[k]) &&
			(cp->pSurfChars[x] == surfp[k]) )
			{
			check_pairs[k] = 1;
			break;
			}
		}
		}
	}
	for ( k = 0 ; k < num_pairs ; ++k )
	{
	if (!check_pairs[k])
		{
		displayNumberedMessage(&sMissingFeasiblePair_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   NULL, 0,
				   i+1, rp->pszName,
				convertKimmoIndexToCharacter(lexp[k], lang),
				convertKimmoIndexToCharacter(surfp[k], lang) );
		}
	}
	}
freeMemory(check_pairs);
/*
 *  allocate storage and copy feasible pairs
 */
lang->uiFeasiblePairsCount = num_pairs;
lang->pFeasiblePairs = allocMemory((num_pairs+1) * sizeof(KimmoPair));
for ( i = 0 ; i < num_pairs ; ++i )
	{
	lang->pFeasiblePairs[i].cLexical = lexp[i];
	lang->pFeasiblePairs[i].cSurface = surfp[i];
	}
lang->pFeasiblePairs[num_pairs].cLexical = '\0';
lang->pFeasiblePairs[num_pairs].cSurface = '\0';
freeMemory(lexp);
freeMemory(surfp);
}

/****************************************************************************
 * NAME
 *    get_token
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Get the next token from the rules file.
 * RETURN VALUE
 *    pointer to the token string, or NULL if EOF
 */
static unsigned char *get_token(cComment_in)
int	cComment_in;
{
static unsigned char *token = (unsigned char *)NULL;
/*
 *  get the next token, reading from the file if necessary
 */
if (line_num == 0)
	token = (unsigned char *)NULL;	/* reset at beginning of file */
else if (token != (unsigned char *)NULL)
	token = tokenizeString(NULL,szWhitespace_m); /* get the next token */

while (token == (unsigned char *)NULL)
	{
	token = (unsigned char *)readLineFromFile(rules_fp, &line_num,
						  cComment_in);
	if (token == (unsigned char *)NULL)
	return( (unsigned char *)NULL );	/* signal EOF */
	token = tokenizeString(token,szWhitespace_m);
	}
return(token);
}

#ifndef __STDC__
#define const
#endif
/*****************************************************************************
 * NAME
 *    compare_size
 * ARGUMENTS
 *    a - address of first char_array element
 *    b - address of second char_array element
 * DESCRIPTION
 *    Compare two elements of a char_array, to sort them longest first.
 * RETURN VALUE
 *    <0, 0, or >0 depending on the relative sort order
 */
static int compare_size(vap,vbp)
const VOIDP vap;
const VOIDP vbp;
{
int ax,bx;
const char **a, **b;

a = (const char **)vap;
b = (const char **)vbp;
ax = strlen(*a);
bx = strlen(*b);
if (ax == bx)
	return( strcmp(*a,*b) );
return( bx - ax );
}
#ifndef __STDC__
#undef const
#endif

/****************************************************************************
 * NAME
 *    set_alphabet
 * ARGUMENTS
 *    tokp  - address of pointer to the next token
 *    lang  - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Load the alphabet from the rules file, and add it to the KimmoData
 *    data.
 * RETURN VALUE
 *    0 if successful, -1 if error in loading rules from rulefile
 */
static int set_alphabet(tokp,lang)
unsigned char **tokp;
KimmoData *lang;
{
int i, j;
unsigned char *tok;
unsigned char **alpha;
/*
 *  bring in the alphabet
 */
alpha = (unsigned char **)allocMemory(
				(KIMMO_ALPHA_MAX+1) * sizeof(unsigned char *));
for ( i = 0 ; ; )
	{
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   "reading ALPHABET characters");
	freeMemory(alpha);
	return( -1 );
	}
	if (is_keyword((char *)tok))
	break;
	if (i >= KIMMO_ALPHA_MAX)
	{
	displayNumberedMessage(&sTooManyCharsInAlphabet_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num);
	freeMemory(alpha);
	return( -1 );
	}
	for ( j = 0 ; j < i ; ++j )
	{
	if (strcmp((char *)alpha[j], (char *)tok) == 0)
		{
		displayNumberedMessage(&sCharInAlphabet_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   tok );
		break;
		}
	}
	if (j >= i)
	alpha[i++] = (unsigned char *)duplicateString((char *)tok);
	}

if (i == 0)
	{
	displayNumberedMessage(&sNoALPHABETvalue_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num);
	freeMemory(alpha);
	return( -1 );
	}
/*
 *  store the string of alphabetic characters
 */
alpha[i] = (unsigned char *)NULL;
if (i < KIMMO_ALPHA_MAX)
	lang->ppszAlphabet = (unsigned char **)reallocMemory(alpha,
						  (i+1) * sizeof(unsigned char *));
else
	lang->ppszAlphabet = alpha;
lang->uiAlphabetSize = i;
/*
 *  sort the alphabet by size of the characters
 */
qsort((VOIDP)lang->ppszAlphabet, (size_t)lang->uiAlphabetSize,
	(size_t)sizeof(unsigned char *), compare_size);

*tokp = tok;
return( 0 );
}

/****************************************************************************
 * NAME
 *    set_any
 * ARGUMENTS
 *    lang - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Load the "any" character from the rules file, and add it to the
 *    KimmoData data.
 * RETURN VALUE
 *    0 if successful, -1 if error
 */
static int set_any(lang)
KimmoData *lang;
{
unsigned char *tok;
unsigned kw_line;

kw_line = line_num;
tok = get_token(lang->cComment);
if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "reading ANY symbol");
	return( -1 );
	}
if (is_keyword((char *)tok))		/* Error if no value given for ANY */
	{
	displayNumberedMessage(&sMissingANYvalue_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if (tok[1] != NUL)
	{
	/* SHOULD COMPLAIN */
	tok[1] = NUL;
	}

if (is_alpha(tok, lang))
	{
	displayNumberedMessage(&sBadANYvalue_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line,
			   *tok );
	return( -1 );
	}
if (lang->cAny != NUL)
	{
	displayNumberedMessage(&sAlreadyHaveANY_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if ((*tok != NUL) && (*tok == lang->cNull))
	{
	displayNumberedMessage(&sANYsameAsNULL_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if ((*tok != NUL) && (*tok == lang->cBoundary))
	{
	displayNumberedMessage(&sANYsameAsBOUNDARY_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
lang->cAny = *tok;
return( 0 );
}

/****************************************************************************
 * NAME
 *    bad_comment
 * ARGUMENTS
 *    token - comment value
 *    lang  - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Check comment value
 * RETURN VALUE
 *    0 if successful, -1 if error
 */
static int bad_comment(token, lang)
unsigned char token;
KimmoData *lang;
{
unsigned kw_line;
unsigned char buf[2];

kw_line = line_num;
buf[0] = token;
buf[1] = NUL;
if (is_alpha(buf, lang))
	{
	displayNumberedMessage(&sBadCOMMENTvalue_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line);
	return( -1 );
	}
if ((token != NUL) && (token == lang->cAny))
	{
	displayNumberedMessage(&sCOMMENTsameAsANY_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if ((token != NUL) && (token == lang->cNull))
	{
	displayNumberedMessage(&sCOMMENTsameAsNULL_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if ((token != NUL) && (token == lang->cBoundary))
	{
	displayNumberedMessage(&sCOMMENTsameAsBOUNDARY_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
lang->cComment = token;
return( 0 );
}

/****************************************************************************
 * NAME
 *    set_null
 * ARGUMENTS
 *    lang - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Load the null character from the rules file, and add it to the
 *    KimmoData data.
 * RETURN VALUE
 *    0 if successful, -1 if error
 */
static int set_null(lang)
KimmoData *lang;
{
unsigned char *tok;
unsigned kw_line;

kw_line = line_num;
tok = get_token(lang->cComment);
if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "reading NULL symbol");
	return( -1 );
	}
if (is_keyword((char *)tok))		/* Error if no value given for NULL */
	{
	displayNumberedMessage(&sMissingNULLvalue_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if (tok[1] != NUL)
	{
	/* SHOULD COMPLAIN */
	tok[1] = NUL;
	}
if (is_alpha(tok, lang))
	{
	displayNumberedMessage(&sBadNULLvalue_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line,
			   *tok );
	return( -1 );
	}
if (lang->cNull != NUL)
	{
	displayNumberedMessage(&sAlreadyHaveNULL_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if ((*tok != NUL) && (*tok == lang->cAny))
	{
	displayNumberedMessage(&sNULLsameAsANY_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if ((*tok != NUL) && (*tok == lang->cBoundary))
	{
	displayNumberedMessage(&sNULLsameAsBOUNDARY_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
lang->cNull = *tok;
return( 0 );
}

/****************************************************************************
 * NAME
 *    set_boundary
 * ARGUMENTS
 *    lang - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Load the boundary character from the rules file, and add it to the
 *    KimmoData data.
 * RETURN VALUE
 *    0 if successful, -1 if error
 */
static int set_boundary(lang)
KimmoData *lang;
{
unsigned char *tok;
unsigned kw_line;

kw_line = line_num;
tok = get_token(lang->cComment);
if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "reading BOUNDARY symbol");
	return( -1 );
	}
if (is_keyword((char *)tok))	/* Error if no value given for BOUNDARY */
	{
	displayNumberedMessage(&sMissingBOUNDARYvalue_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if (tok[1] != NUL)
	{
	/* SHOULD COMPLAIN */
	tok[1] = NUL;
	}
if (is_alpha(tok, lang))
	{
	displayNumberedMessage(&sBadBOUNDARYvalue_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line,
			   *tok );
	return( -1 );
	}
if (lang->cBoundary != NUL)
	{
	displayNumberedMessage(&sAlreadyHaveBOUNDARY_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if ((*tok != NUL) && (*tok == lang->cNull))
	{
	displayNumberedMessage(&sBOUNDARYsameAsNULL_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if ((*tok != NUL) && (*tok == lang->cAny))
	{
	displayNumberedMessage(&sBOUNDARYsameAsANY_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
lang->cBoundary = *tok;
return( 0 );
}

/****************************************************************************
 * NAME
 *    add_subset
 * ARGUMENTS
 *    tokp - address of pointer to the following token
 *    lang - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Load one alphabet subset from the rules file, and add it to the KimmoData
 *    data.
 * RETURN VALUE
 *    0 if successful, -1 if error
 */
static int add_subset(tokp,lang)
unsigned char **tokp;
KimmoData *lang;
{
int i, j;
unsigned kw_line;
unsigned char *tok;
unsigned char sub_name[MAXALPH+1];
unsigned char sub_chars[MAXALPH+1];
/*
 *  first, get the name of the subset
 */
kw_line = line_num;
tok = get_token(lang->cComment);
if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "reading SUBSET name");
	return( -1 );
	}
if (is_keyword((char *)tok))
	{
	displayNumberedMessage(&sMissingSUBSETname_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
strncpy((char *)sub_name, (char *)tok, (size_t)MAXALPH);
sub_name[MAXALPH] = NUL;
/*
 *  now, get the members of the subset; either alphabetic characters or
 *  the NULL symbol
 */
memset((char *)sub_chars, NUL, MAXALPH+1);
for ( i = 0 ;;)
	{
	tok = get_token(lang->cComment);
	if ((tok == (unsigned char *)NULL) || is_keyword((char *)tok) )
	break;
	j = is_alpha(tok, lang);
	if ((j == 0) && (tok[0] == lang->cNull) && (tok[1] == NUL))
	j = KIMMO_ALPHA_NULL;
	if (j == 0)
	{
	displayNumberedMessage(&sBadSUBSETvalue_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, kw_line,
				   sub_name, tok);
	return( -1 );
	}
	if (strchr((char *)sub_chars, (int)((char)j)) != (char *)NULL)
	displayNumberedMessage(&sCharInSUBSET_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, kw_line,
				   sub_name, tok);
	else
	sub_chars[i++] = j;
	}
if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "reading SUBSET characters");
	return( -1 );
	}
if (sub_name[0] == NUL)
	{
	displayNumberedMessage(&sMissingSUBSETname_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line );
	return( -1 );
	}
if (    is_alpha(sub_name, lang) ||
	(   (sub_name[1] == NUL) &&
		(   (sub_name[0] == lang->cNull) ||
		(sub_name[0] == lang->cBoundary) ||
		(sub_name[0] == lang->cAny) ) ) ||
	(find_subset(sub_name,lang) != (unsigned char *)NULL) )
	{
	displayNumberedMessage(&sBadSUBSETname_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line,
			   sub_name );
	return( -1 );
	}
if (sub_chars[0] == NUL)
	{
	displayNumberedMessage(&sEmptySUBSET_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, kw_line,
			   sub_name );
	return( -1 );
	}
/*
 *  if necessary, allocate space for this subset
 */
if (lang->uiSubsetCount >= size_subsets)
	{
	size_subsets += 20;		/* grow the array as needed */
	if (lang->pSubsets == (KimmoSubset *)NULL)
	lang->pSubsets = (KimmoSubset *)allocMemory(
					   size_subsets * sizeof(KimmoSubset));
	else
	lang->pSubsets = (KimmoSubset *)reallocMemory(lang->pSubsets,
					   size_subsets * sizeof(KimmoSubset));
	}

lang->pSubsets[lang->uiSubsetCount].pszName    = (unsigned char *)
						 duplicateString((char *)sub_name);
lang->pSubsets[lang->uiSubsetCount].pszMembers = (unsigned char *)
						duplicateString((char *)sub_chars);
++lang->uiSubsetCount;

*tokp = tok;
return( 0 );
}

/****************************************************************************
 * NAME
 *    add_rule
 * ARGUMENTS
 *    lang - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Load one rule from the rules file, and add it to the KimmoData data.
 * RETURN VALUE
 *    0 if successful, -1 if error
 */
static int add_rule(lang)
KimmoData *lang;
{
unsigned char *tok;
unsigned char *q;
KimmoRule *rp;
KimmoFSAColumn *cp;
unsigned i, j, x;
/*
 *  make sure we have space to store this rule
 */
if (lang->uiAutomataSize >= size_rules)
	{
	size_rules += 20;
	if (lang->pAutomata == (KimmoRule *)NULL)
	lang->pAutomata = (KimmoRule *)allocMemory(size_rules * sizeof(KimmoRule));
	else
	lang->pAutomata = (KimmoRule *)reallocMemory( lang->pAutomata,
						size_rules * sizeof(KimmoRule) );
	}
rp = &(lang->pAutomata[lang->uiAutomataSize]);
++lang->uiAutomataSize;
rp->bActive = 1;		/* rules start out active */

/*****************************************************************
 *  get the rule name, which begins and ends with a quote mark
 *  (we can't use get_token() here because of possible whitespace)
 */
/* get rest of line following RULE keyword */
tok = tokenizeString(NULL,NULL);
if (tok != (unsigned char *)NULL)
	{
	/* eat up whitespace */
	while ((*tok != NUL) && isascii(*tok) && isspace(*tok))
	++tok;
	}
if ((tok == (unsigned char *)NULL) || (*tok == NUL))
	{
	/* RULE keyword was alone on this line */
	do  {			/* get another line that contains something */
	tok = (unsigned char *)readLineFromFile(rules_fp, &line_num,
						lang->cComment);
	tok += strspn((char *)tok, (char *)szWhitespace_m);
	if (*tok == NUL)
		continue;
	trimTrailingWhitespace((char *)tok);
	} while ((tok != (unsigned char *)NULL) && (*tok == NUL));
	}
if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "reading RULE");
	return( -1 );
	}
/*
 *  first char of tok should be '"'
 *  look for it in the rest of tok, and point q at it
 */
q = (unsigned char *)strchr((char *)tok+1, (int)((char)*tok));
if (q == (unsigned char *)NULL)
	displayNumberedMessage(&sBadRuleName_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   tok);
else
	{
	/*
	 *  replace the second '"' with NUL to terminate the string containing the
	 *  rule name, and advance q beyond it
	 */
	*q++ = NUL;
	}
/*
 *  the rule name is the string following the first quote mark
 */
rp->pszName = (unsigned char *)duplicateString((char *)tok+1);

/*****************************************************************
 *  get the dimensions of the state table
 *  (after call to tokenizeString() we can use get_token())
 */
tok = tokenizeString(q, szWhitespace_m);
if (tok == (unsigned char *)NULL)
	{
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   "reading RULE");
	return( -1 );
	}
	}
rp->iRowCount = atoi((char *)tok);
if (rp->iRowCount <= 0)
	{
	displayNumberedMessage(&sInvalidNumberOfRows_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   tok);
	return( -1 );
	}
tok = get_token(lang->cComment);
if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "reading RULE");
	return( -1 );
	}
rp->iColumnCount = atoi((char *)tok);
if ( rp->iColumnCount <= 0 )
	{
	displayNumberedMessage(&sInvalidNumberOfColumns_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   tok);
	return( -1 );
	}
/*
 *  allocate memory for the rest of the automaton
 */
rp->pColumns = (KimmoFSAColumn *)
			allocMemory(sizeof(KimmoFSAColumn) * rp->iColumnCount);
for ( cp = rp->pColumns, i = 0 ; i < rp->iColumnCount ; ++i, ++cp )
	{
	cp->pszLexName = (unsigned char *)NULL;
	cp->eLexType = 0;
	cp->pLexChars = (unsigned char *)NULL;
	cp->pszSurfName = (unsigned char *)NULL;
	cp->eSurfType = 0;
	cp->pSurfChars = (unsigned char *)NULL;
	cp->uiPrecedence = 0;
	cp->puiTransitions = (unsigned short *)allocMemory(
						sizeof(short) * rp->iRowCount);
	}
rp->puiFinalStates = (unsigned char *)allocMemory(
					sizeof(unsigned char) * rp->iRowCount);

/*****************************************************************
 *  get the lexical characters
 */
for ( i = 0 ; i < rp->iColumnCount ; ++i )
	{
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   "reading RULE");
	return( -1 );
	}
	x = strlen((char *)tok);
	if (is_alpha(tok, lang))
	rp->pColumns[i].eLexType = KIMMO_ALPHABET_CHAR;
	else if ((x == 1) && (*tok == lang->cAny))
	rp->pColumns[i].eLexType = KIMMO_ANY_CHAR;
	else if ((x == 1) && (*tok == lang->cNull))
	rp->pColumns[i].eLexType = KIMMO_NULL_CHAR;
	else if ((x == 1) && (*tok == lang->cBoundary))
	rp->pColumns[i].eLexType = KIMMO_BOUNDARY_CHAR;
	else if (find_subset(tok,lang) != (unsigned char *)NULL)
	rp->pColumns[i].eLexType = KIMMO_SUBSET_CHAR;
	else
	{
	displayNumberedMessage(&sBadLexicalCharacter_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   tok);
	return( -1 );
	}
	rp->pColumns[i].pszLexName = (unsigned char *)duplicateString((char *)tok);
	/*
	 *  rp->pColumns[i].lex_chars is filled in by computeKimmoFeasiblePairs()
	 */
	}

/*****************************************************************
 *  get the surface characters
 */
for ( i = 0 ; i < rp->iColumnCount ; ++i )
	{
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   "reading RULE");
	return( -1 );
	}
	x = strlen((char *)tok);
	if (is_alpha(tok, lang))
	rp->pColumns[i].eSurfType = KIMMO_ALPHABET_CHAR;
	else if ((x == 1) && (*tok == lang->cAny))
	rp->pColumns[i].eSurfType = KIMMO_ANY_CHAR;
	else if ((x == 1) && (*tok == lang->cNull))
	rp->pColumns[i].eSurfType = KIMMO_NULL_CHAR;
	else if ((x == 1) && (*tok == lang->cBoundary))
	rp->pColumns[i].eSurfType = KIMMO_BOUNDARY_CHAR;
	else if (find_subset(tok,lang) != (unsigned char *)NULL)
	rp->pColumns[i].eSurfType = KIMMO_SUBSET_CHAR;
	else
	{
	displayNumberedMessage(&sBadSurfaceCharacter_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   tok);
	return( -1 );
	}
	rp->pColumns[i].pszSurfName = (unsigned char *)duplicateString(
								  (char *)tok);
	/*
	 *  rp->pColumns[i].surf_chars is filled in by computeKimmoFeasiblePairs()
	 */
	}
/*
 *  check for valid use of the BOUNDARY character -- must be in pairs
 *  check for valid use of the NULL character -- must NOT be in pairs
 */
for ( i = 0 ; i < rp->iColumnCount ; ++i )
	{
	if ( ( (rp->pColumns[i].eLexType  == KIMMO_BOUNDARY_CHAR) &&
	   (rp->pColumns[i].eSurfType != KIMMO_BOUNDARY_CHAR) ) ||
	 ( (rp->pColumns[i].eLexType  != KIMMO_BOUNDARY_CHAR) &&
	   (rp->pColumns[i].eSurfType == KIMMO_BOUNDARY_CHAR) ) )
	{
	--line_num;
	displayNumberedMessage(&sBadColumnHead_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   lang->uiAutomataSize, i+1,
				   rp->pColumns[i].pszLexName,
				   rp->pColumns[i].pszSurfName );
	return( -1 );
	}
	if ( (rp->pColumns[i].eLexType  == KIMMO_NULL_CHAR) &&
	 (rp->pColumns[i].eSurfType == KIMMO_NULL_CHAR) )
	{
	--line_num;
	displayNumberedMessage(&sBadColumn2NULLs_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   lang->uiAutomataSize, i+1,
				   rp->pColumns[i].pszLexName,
				   rp->pColumns[i].pszSurfName );
	return( -1 );
	}
	}

/*****************************************************************
 *  get the state table and final/non-final state indicators
 */
for ( i = 0 ; i < rp->iRowCount ; ++i )
	{
	/*************************************************
	 *  get and validate the state number
	 */
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   "reading RULE");
	return( -1 );
	}
	if ( (unsigned)atoi((char *)tok) != i+1 )
	{
	displayNumberedMessage(&sBadStateNumber_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   tok);
	return( -1 );
	}
	/*************************************************
	 *  get the final/non-final state indicator
	 */
	while ( isascii(*tok) && isdigit(*tok) )
	++tok;
	if (*tok == NUL)
	{
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
		{
		displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   "reading RULE");
		return( -1 );
		}
	}
	if ((*tok != ':') && (*tok != '.'))
	{
	displayNumberedMessage(&sBadFinalMark_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   *tok);
	return( -1 );
	}
	rp->puiFinalStates[i] = (*tok++ == ':');

	/*************************************************
	 *  get a row of new states for a given state
	 */
	for ( j = 0 ; j < rp->iColumnCount ; ++j )
	{
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
		{
		displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   "reading RULE");
		return( -1 );
		}
	if ( !(isascii(*tok) && isdigit(*tok)) )
		{
		displayNumberedMessage(&sBadTableCharacter_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   *tok);
		return( -1 );
		}
	x = atoi((char *)tok);
	if (x > rp->iRowCount)
		{
		displayNumberedMessage(&sBadTableEntry_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   tok);
		return( -1 );
		}
	rp->pColumns[j].puiTransitions[i] = x;
	}
	}
return( 0 );
}

/****************************************************************************
 * NAME
 *    free_alignment
 * ARGUMENTS
 *    alignment - pointer to an array of ALIGNMENT data structures
 *    num_rows  - number of rows in the array
 * DESCRIPTION
 *    Free the space used to store the alignment table from a twolc rules file
 * RETURN VALUE
 *    none
 */
void free_alignment(alignment, num_rows)
struct alignment_row *alignment;
int num_rows;
{
int k;
struct alignment_row *rowp;

for ( rowp = alignment, k = 0 ; k < num_rows ; ++rowp, ++k )
	{
	freeMemory(rowp->rule_column);
	}
freeMemory(alignment);
}

/****************************************************************************
 * NAME
 *    get_alignment
 * ARGUMENTS
 *    lang - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Get the correspondence pairs for each rule (listed in a table at the
 *    end of a twolc rules file) and add them to the KimmoData data.
 * RETURN VALUE
 *    0 if successful, -1 if error
 */
static int get_alignment(lang)
KimmoData *lang;
{
KimmoRule *rp;
KimmoFSAColumn *cp;
unsigned i, j, k, x;
unsigned char *tok;
unsigned char *lexp, *surfp;
unsigned char *this_row;
unsigned num_pairs, num_allocated;
struct alignment_row *alignment, *rowp;
int idx;
unsigned char *lp, *sp;

if ( lang->pAutomata == (KimmoRule *)NULL )
	{
	displayNumberedMessage(&sNoRulesDefined_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "before ALIGNMENT");
	return( -1 );
	}
/*
 *  release any previously allocated space
 */
for ( rp = lang->pAutomata, i = 0 ; i < lang->uiAutomataSize ; ++i, ++rp )
	{
	for ( cp = rp->pColumns, j = 0 ; j < rp->iColumnCount ; ++j, ++cp )
	{
	if (cp->pLexChars)
		freeMemory(cp->pLexChars);
	if (cp->pSurfChars)
		freeMemory(cp->pSurfChars);
	cp->uiPrecedence = 0;
	}
	}
num_pairs = 0;
num_allocated = 0;
lexp  = (unsigned char *)NULL;
surfp = (unsigned char *)NULL;
tok = (unsigned char *)NULL;
rowp = alignment = (struct alignment_row *)NULL;
/*
 *  get the first row of the alignment table
 */
do  {
	this_row = (unsigned char *)readLineFromFile(rules_fp, &line_num,
						 lang->cComment);
	if (this_row == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sNoFeasiblePairsInRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   NULL, 0);
	return( -1 );
	}
	tok = tokenizeString(this_row, szWhitespace_m);
	} while (tok == (unsigned char *)NULL);
/*
 *  read, validate, and store each row of the alignment table,
 *  maintaining a list of the feasible pairs in lexp and surfp
 */
while ( strcmp((char *)tok,"END") != 0 )  /* stop at keyword END */
	{
	/*
	 *  make sure we have space to store this feasible pair,
	 *  in lexp and surfp and in alignment table
	 */
	if (num_pairs >= num_allocated)
	{
	num_allocated += 20;
	if (lexp == (unsigned char *)NULL)	/* first feasible pair */
		{
		lexp  = (unsigned char *)allocMemory( num_allocated+1 );
		*lexp = NUL;
		surfp = (unsigned char *)allocMemory( num_allocated+1 );
		*surfp = NUL;
		alignment = (struct alignment_row *)allocMemory(
				num_allocated * sizeof(struct alignment_row));
		}
	else
		{
		lexp  = (unsigned char *)reallocMemory(lexp, num_allocated+1);
		surfp = (unsigned char *)reallocMemory(surfp, num_allocated+1);
		alignment = (struct alignment_row *)reallocMemory( alignment,
				num_allocated * sizeof(struct alignment_row) );
		}
	}
	rowp = &(alignment[num_pairs]);
	/*
	 *  initialize this row
	 */
	rowp->lex_type = 0;
	rowp->lex_char = NUL;
	rowp->surf_type = 0;
	rowp->surf_char = NUL;
	rowp->rule_column = (unsigned short *)allocMemory(
				sizeof(unsigned short) * lang->uiAutomataSize);
	/*
	 *  error check the lexical character, determine its type, and
	 *  store in alignment
	 */
	x = strlen((char *)tok);
	if ((idx = is_alpha(tok, lang)) != 0)
	{
	rowp->lex_char = idx;
	rowp->lex_type = KIMMO_ALPHABET_CHAR;
	}
	else if ((x == 1) && (*tok == lang->cNull))
	{
	rowp->lex_char = KIMMO_ALPHA_NULL;
	rowp->lex_type = KIMMO_NULL_CHAR;
	}
	else if ((x == 1) && (*tok == lang->cBoundary))
	{
	rowp->lex_char = KIMMO_ALPHA_BOUNDARY;
	rowp->lex_type = KIMMO_BOUNDARY_CHAR;	/* PC-KIMMO requires #:#, */
	rowp->surf_char = KIMMO_ALPHA_BOUNDARY;	/* but twolc writes #:0   */
	rowp->surf_type = KIMMO_BOUNDARY_CHAR;
	}
	else
	{
	displayNumberedMessage(&sBadLexicalCharacter_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   tok);
	free_alignment(alignment, num_pairs);
	return( -1 );
	}
	/*
	 *  error check the surface character, determine its type, and
	 *  store in alignment
	 */
	if ( (tok = tokenizeString(NULL, szWhitespace_m)) == NULL )
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   "reading RULE");
	free_alignment(alignment, num_pairs);
	return( -1 );
	}
	x = strlen((char *)tok);
	if ((idx = is_alpha(tok, lang)) != 0)
	{
	rowp->surf_char = idx;
	rowp->surf_type = KIMMO_ALPHABET_CHAR;
	}
	else if ((x == 1) && (*tok == lang->cNull))
	{
	if (rowp->lex_type != KIMMO_BOUNDARY_CHAR)
		{
		rowp->surf_char = KIMMO_ALPHA_NULL;
		rowp->surf_type = KIMMO_NULL_CHAR;
		}
	}
	else if ((x == 1) && (*tok == lang->cBoundary))
	{
	rowp->surf_char = KIMMO_ALPHA_BOUNDARY;
	rowp->surf_type = KIMMO_BOUNDARY_CHAR;
	}
	else
	{
	displayNumberedMessage(&sBadSurfaceCharacter_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   tok);
	free_alignment(alignment, num_pairs);
	return( -1 );
	}
	/*
	 *  make sure this feasible pair isn't already listed
	 */
	for ( k = 0 ; k < num_pairs ; ++k )
	{
	if ((lexp[k] == rowp->lex_char) && (surfp[k] == rowp->surf_char))
		{
		displayNumberedMessage(&sPairInAlignmentTwice_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
			   convertKimmoIndexToCharacter(rowp->lex_char, lang),
			   convertKimmoIndexToCharacter(rowp->surf_char,lang));
		free_alignment(alignment, num_pairs);
		return( -1 );
		}
	}
	/*
	 *  add this feasible pair to the master list
	 */
	lexp[num_pairs]  = rowp->lex_char;
	surfp[num_pairs] = rowp->surf_char;
	++num_pairs;
	lexp[num_pairs]  = NUL;
	surfp[num_pairs] = NUL;

	/**********************************************************************
	 *  Get and validate the column numbers for this correspondence pair.
	 *  There should be one column number for each rule.
	 */
	for ( i = 0 ; i < lang->uiAutomataSize ; ++i )
	{
	/* make sure row doesn't end too early */
	if ( (tok = tokenizeString(NULL, szWhitespace_m)) == NULL )
		{
		displayNumberedMessage(&sShortAlignmentRow_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
			   convertKimmoIndexToCharacter(rowp->lex_char, lang),
			   convertKimmoIndexToCharacter(rowp->surf_char,lang));
		free_alignment(alignment, num_pairs);
		return( -1 );
		}
	/* validate character, store in array */
	if (	( (j = atoi((char *)tok)) <= 0 ) ||
		( j > lang->pAutomata[i].iColumnCount )  )
		{
		displayNumberedMessage(&sBadColumnNumber_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   tok,
			   convertKimmoIndexToCharacter(rowp->lex_char, lang),
			   convertKimmoIndexToCharacter(rowp->surf_char,lang));
		free_alignment(alignment, num_pairs);
		return( -1 );
		}
	rowp->rule_column[i] = j;
	} /* end of loop stepping through number of rules */
	/*
	 *  make sure there's nothing left in the row
	 */
	if ( (tok = tokenizeString(NULL, szWhitespace_m)) != NULL )
	{
	displayNumberedMessage(&sLongAlignmentRow_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
			   convertKimmoIndexToCharacter(rowp->lex_char, lang),
			   convertKimmoIndexToCharacter(rowp->surf_char,lang));
	free_alignment(alignment, num_pairs);
	return( -1 );
	}
	/*
	 *  get the next line of the alignment table that contains something
	 */
	do  {
	this_row = (unsigned char *)readLineFromFile(rules_fp, &line_num,
							 lang->cComment);
	if (this_row == (unsigned char *)NULL)
		{
		displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   "reading ALIGNMENT");
		free_alignment(alignment, num_pairs);
		return( -1 );
		}
	tok = tokenizeString(this_row, szWhitespace_m);
	} while (tok == (unsigned char *)NULL);

	} /* end of loop stepping through rows of alignment */

if (num_pairs == 0)
	{
	displayNumberedMessage(&sNoFeasiblePairsInRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num);
	lang->uiFeasiblePairsCount = 0;
	lang->pFeasiblePairs = NULL;
	free_alignment(alignment, num_pairs);
	return( -1 );
	}

if (num_pairs != num_allocated)
	{
	alignment = (struct alignment_row *)reallocMemory( alignment,
					num_pairs * sizeof(struct alignment_row) );
	}
lang->uiFeasiblePairsCount = num_pairs;
lang->pFeasiblePairs = allocMemory((num_pairs+1) * sizeof(KimmoPair));
for ( i = 0 ; i < num_pairs ; ++i )
	{
	lang->pFeasiblePairs[i].cLexical = lexp[i];
	lang->pFeasiblePairs[i].cSurface = surfp[i];
	}
lang->pFeasiblePairs[num_pairs].cLexical = '\0';
lang->pFeasiblePairs[num_pairs].cSurface = '\0';
freeMemory(lexp);	lexp  = NULL;
freeMemory(surfp);	surfp = NULL;

/****************************************************************************
 *  Place correspondence pairs into the rules
 *
 *  For each column of each rule, step through the rows of the alignment table.
 *  At each row, see if the entry for this rule is this column number.
 *  If so, add the correspondence pair to this column.
 *
 *  If this column has only one pair, use those characters as
 *  the lex and surf names and set the type;
 *  otherwise, set both lex_name and surf_name to (lex_char:surf_char)
 *  and set the _types to subset.
 *
 *  (It is possible that in a column with more than one pair, either
 *  the surface or lexical character may be the same for all pairs.
 *  There is no problem with listing these out explicitly, although it would
 *  be possible to look for this case and then set the appropriate member of
 *  the pair to the correct character and make its type alphabetic.
 *  All this should affect is which branch of the if statement in
 *  moveKimmoAutomata() is chosen.)
 */
for ( i = 0, rp = lang->pAutomata ; i < lang->uiAutomataSize ; ++i, ++rp )
	{
	for ( j = 0, cp = rp->pColumns ; j < rp->iColumnCount ; ++j, ++cp )
	{
	/*
	 *  if this column has no feasible pairs yet, allocate enough
	 *  space for all possible feasible pairs
	 */
	if (cp->pLexChars == (unsigned char *)NULL)
		{
		cp->pLexChars  = (unsigned char *)allocMemory( num_pairs+1 );
		cp->pSurfChars = (unsigned char *)allocMemory( num_pairs+1 );
		}
	/*
	 *  step through the rows of the alignment table
	 */
	for ( rowp = alignment, k = 0 ; k < num_pairs ; ++rowp, ++k )
		{
		/*
		 *  does this pair belong in this column?
		 */
		if ( rowp->rule_column[i] == j+1 )
		{
		char buf[2];
		/*
		 *  add this feasible pair
		 */
		buf[1] = NUL;
		buf[0] = (char)rowp->lex_char;
		strcat((char *)cp->pLexChars, buf);
		buf[0] = (char)rowp->surf_char;
		strcat((char *)cp->pSurfChars, buf);
		++(cp->uiPrecedence);
		}
		}
	/*
	 *  readjust size of these fields
	 */
	if (  ( x = strlen((char *)cp->pLexChars) ) != num_pairs  )
		{
		cp->pLexChars  = (unsigned char *)reallocMemory(cp->pLexChars,
								x+1);
		cp->pSurfChars = (unsigned char *)reallocMemory(cp->pSurfChars,
								x+1);
		}
	cp->pLexChars[x] = '\0';
	cp->pSurfChars[x] = '\0';
	/*
	 *  figure out what the _names and _types should be for this column
	 */
	if (x == 0)		/* no pair assigned to this column number */
		{
		displayNumberedMessage(&sNoFeasiblePairsInColumn_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   NULL, 0,
				   i+1, rp->pszName, j+1);
		free_alignment(alignment, num_pairs);
		return( -1 );
		}
	lp = convertKimmoIndexToCharacter(*cp->pLexChars, lang);
	sp = convertKimmoIndexToCharacter(*cp->pSurfChars, lang);
	if (x == 1)		/* only one pair for this column */
		{
		cp->pszLexName = (unsigned char *)duplicateString((char *)lp);
		cp->pszSurfName = (unsigned char *)duplicateString((char *)sp);
		if (*cp->pLexChars == KIMMO_ALPHA_NULL)
		cp->eLexType = KIMMO_NULL_CHAR;
		else if (*cp->pLexChars == KIMMO_ALPHA_BOUNDARY)
		cp->eLexType = KIMMO_BOUNDARY_CHAR;
		else
		cp->eLexType = KIMMO_ALPHABET_CHAR;
		/*
		 *  these are the only possibilities, and if we've gotten this far,
		 *  then we already know they're valid characters
		 */
		if (*cp->pSurfChars == KIMMO_ALPHA_NULL)
		cp->eSurfType = KIMMO_NULL_CHAR;
		else if (*cp->pSurfChars == KIMMO_ALPHA_BOUNDARY)
		cp->eSurfType = KIMMO_BOUNDARY_CHAR;
		else
		cp->eSurfType = KIMMO_ALPHABET_CHAR;
		}
	else
		{
		/*
		 *  more than one pair; call this a subset and construct a name
		 */
		cp->eLexType  = KIMMO_SUBSET_CHAR;
		cp->eSurfType = KIMMO_SUBSET_CHAR;
		cp->pszLexName = (unsigned char *)allocMemory(
				  4 + strlen((char *)lp) + strlen((char *)sp));
		sprintf((char *)cp->pszLexName, "(%s:%s)", lp, sp);
		cp->pszSurfName = (unsigned char *)duplicateString(
							   (char *)cp->pszLexName);
		}
	/*
	 *  It's okay for these names to be the same, since it's the actual
	 *  characters themselves that are used for rule processing.  The
	 *  subset name is only used in writeKimmoRule(), for debug output for
	 *  the user.
	 */
	} /* step through columns */
	} /* step through rules */

free_alignment(alignment, num_pairs);
return( 0 );
}

/****************************************************************************
 * NAME
 *    add_twolc_rule
 * ARGUMENTS
 *    lang - pointer to a KimmoData data structure
 *    rule_name_portion - the portion of the rule name gotten by get_tok()--may
 *    be the whole rule, or just part of it, since a rule name can include
 *    whitespace
 * DESCRIPTION
 *    Load one rule (generated by the rule compiler twolc) from the rules file,
 *    and add it to the KimmoData data.
 * RETURN VALUE
 *    0 if successful, -1 if error
 */
static int add_twolc_rule(lang, rule_name_portion)
KimmoData *lang;
unsigned char *rule_name_portion;
{
unsigned char *tok;
unsigned char *q, *bad_rule_name;
KimmoRule *rp;
KimmoFSAColumn *cp;
unsigned i, j, x;

/*
 *  make sure we have space to store this rule
 */
if (lang->uiAutomataSize >= size_rules)
	{
	size_rules += 20;
	if (lang->pAutomata == (KimmoRule *)NULL)
	lang->pAutomata = (KimmoRule *)allocMemory(
						   size_rules * sizeof(KimmoRule));
	else
	lang->pAutomata = (KimmoRule *)reallocMemory( lang->pAutomata,
						   size_rules * sizeof(KimmoRule));
	}
rp = &(lang->pAutomata[lang->uiAutomataSize]);
++lang->uiAutomataSize;
rp->bActive = 1;		/* rules start out active */

/*****************************************************************
 *  get the rule name, which begins and ends with a quote mark
 *  (we can't use get_token() here because of possible whitespace)
 *  In the twolc version, we have to do more work because there is
 *  no RULE keyword.
 */
/*
 *  Get rest of line following the portion of the rule gotten by get_token().
 *  This line should contain the table dimensions, possibly preceded by a
 *  portion of the rule name.
 */
tok = tokenizeString(NULL,NULL);
/*
 *  First char of rule_name_portion should be '"'; see if another one (of
 *  whatever's first) occurs in rule_name_portion.  If so, point q at it.
 *  (The only way we could reach this point and have a rule name delimited
 *  by something other than '"' is if the keyword RULE is used.)
 */
q = (unsigned char *)strchr((char *)rule_name_portion+1,
				(int)((char)*rule_name_portion));
if (q != (unsigned char *)NULL)
	{
	/*
	 *  Entire rule name is in rule_name_portion.
	 *  Replace the second '"' with NUL to terminate the string containing
	 *  the rule name.
	 *  Then find table dimensions in tok and point q at them.
	 */
	*q = NUL;
	rp->pszName = (unsigned char *)duplicateString(
						  (char *)rule_name_portion+1);
	if (tok != (unsigned char *)NULL)		/* eat up whitespace */
	while ((*tok != NUL) && isascii(*tok) && isspace(*tok))
		++tok;
	if ((tok == (unsigned char *)NULL) || (*tok == NUL))
	{
	/* nothing in this line */
	do  {		/* get another line containing something */
		tok = (unsigned char *)readLineFromFile(rules_fp, &line_num,
							lang->cComment);
		tok += strspn((char *)tok, (char *)szWhitespace_m);
		if (*tok == NUL)
		continue;
		trimTrailingWhitespace((char *)tok);
		} while ((tok != (unsigned char *)NULL) && (*tok == NUL));
	}
	if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   "reading RULE");
	return( -1 );
	}
	q = tok;
	}
else
	{
	/*
	 *  We didn't get the whole rule name; get the rest from what's in tok.
	 *  Find the rule name's final '"' in tok.
	 *  Replace it with NUL to terminate the string containing the rule name,
	 *  and advance q beyond it, to point at the table dimensions.
	 */
	q = (unsigned char *)strchr((char *)tok, (int)((char)*rule_name_portion));
	if (q == (unsigned char *)NULL)
	{
	bad_rule_name = (unsigned char *)allocMemory(
		  strlen((char *)rule_name_portion) + strlen((char *)tok) + 1);
	sprintf((char *)bad_rule_name, "%s %s",
		(char *)rule_name_portion+1, (char *)tok);
	displayNumberedMessage(&sBadRuleName_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   bad_rule_name);
	return( -1 );
	}
	else
	*q++ = NUL;
	/*
	 *  Put the two pieces of the rule name together,
	 *  leaving off the initial character (a quote mark),
	 *  and replacing the space that was gobbled.
	 */
	rp->pszName = (unsigned char *)allocMemory(
		  strlen((char *)rule_name_portion) + strlen((char *)tok) + 1);
	sprintf((char *)rp->pszName, "%s %s",
		(char *)rule_name_portion+1, (char *)tok);
	}

/*****************************************************************
 *  get the dimensions of the state table
 *  (after call to tokenizeString() we can use get_token())
 */
tok = tokenizeString(q, szWhitespace_m);
if (tok == (unsigned char *)NULL)
	{
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   "reading RULE");
	return( -1 );
	}
	}
rp->iRowCount = atoi((char *)tok);
if (rp->iRowCount <= 0)
	{
	displayNumberedMessage(&sInvalidNumberOfRows_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   tok);
	return( -1 );
	}
tok = get_token(lang->cComment);
if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "reading RULE");
	return( -1 );
	}
rp->iColumnCount = atoi((char *)tok);
if ( rp->iColumnCount <= 0 )
	{
	displayNumberedMessage(&sInvalidNumberOfColumns_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   tok);
	return( -1 );
	}
/*
 *  allocate memory for the rest of the automaton
 */
rp->pColumns = (KimmoFSAColumn *)
			allocMemory(sizeof(KimmoFSAColumn) * rp->iColumnCount);
for ( cp = rp->pColumns, i = 0 ; i < rp->iColumnCount ; ++i, ++cp )
	{
	cp->pszLexName = (unsigned char *)NULL;
	cp->eLexType = 0;
	cp->pLexChars = (unsigned char *)NULL;
	cp->pszSurfName = (unsigned char *)NULL;
	cp->eSurfType = 0;
	cp->pSurfChars = (unsigned char *)NULL;
	cp->uiPrecedence = 0;
	cp->puiTransitions = (unsigned short *)allocMemory(
						sizeof(short) * rp->iRowCount);
	}
rp->puiFinalStates = (unsigned char *)allocMemory(
					sizeof(unsigned char) * rp->iRowCount);

/*****************************************************************
 *  Correspondence pairs occur at the end of a twolc rule file.
 *  These are filled in by get_alignment().
 */

/*****************************************************************
 *  get the state table and final/non-final state indicators
 */
for ( i = 0 ; i < rp->iRowCount ; ++i )
	{
	/*************************************************
	 *  get and validate the state number
	 */
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   "reading RULE");
	return( -1 );
	}
	if ( (unsigned)atoi((char *)tok) != i+1 )
	{
	displayNumberedMessage(&sBadStateNumber_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   tok);
	return( -1 );
	}
	/*************************************************
	 *  get the final/non-final state indicator
	 */
	while ( isascii(*tok) && isdigit(*tok) )
	++tok;
	if (*tok == NUL)
	{
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
		{
		displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   "reading RULE");
		return( -1 );
		}
	}
	if ((*tok != ':') && (*tok != '.'))
	{
	displayNumberedMessage(&sBadFinalMark_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   *tok);
	return( -1 );
	}
	rp->puiFinalStates[i] = (*tok++ == ':');

	/*************************************************
	 *  get a row of new states for a given state
	 */
	for ( j = 0 ; j < rp->iColumnCount ; ++j )
	{
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
		{
		displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   "reading RULE");
		return( -1 );
		}
	if ( !(isascii(*tok) && isdigit(*tok)) )
		{
		displayNumberedMessage(&sBadTableCharacter_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   *tok);
		return( -1 );
		}
	x = atoi((char *)tok);
	if (x > rp->iRowCount)
		{
		displayNumberedMessage(&sBadTableEntry_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   tok);
		return( -1 );
		}
	rp->pColumns[j].puiTransitions[i] = x;
	}
	}
return( 0 );
}

/****************************************************************************
 * NAME
 *    fix_twolc_boundary
 * ARGUMENTS
 *    lang - pointer to the current KimmoData structure
 * DESCRIPTION
 *    set the boundary character, and remove it from the alphabet
 *    (in twolc rules, boundary is set to # and it is included in the alphabet)
 * RETURN VALUE
 *    none
 */
static void fix_twolc_boundary(lang)
KimmoData *lang;
{
unsigned j;

lang->cBoundary = '#';
if ((j = is_alpha((unsigned char *)"#", lang)) != 0)
	{
	freeMemory(lang->ppszAlphabet[j-1]);
	for ( ; j < lang->uiAlphabetSize ; ++j )
	lang->ppszAlphabet[j-1] = lang->ppszAlphabet[j];
	--lang->uiAlphabetSize;
	lang->ppszAlphabet[lang->uiAlphabetSize] = (unsigned char *)NULL;
	}
}

/****************************************************************************
 * NAME
 *    loadKimmoRules
 * ARGUMENTS
 *    rulefile - name of a PC-KIMMO rules file
 *    lang     - pointer to a KimmoData data structure
 * DESCRIPTION
 *    Load the alphabet information and rules (automata) from a rules file.
 *    If the initial declarations are terminated by END, followed by the
 *    keyword AUTOMATA, treat this as a twolc rules file:  use add_twolc_rule()
 *    instead of add_rule(), and don't allow SUBSETs.
 * RETURN VALUE
 *    0 if successful, -1 if error in loading rules or cancelled
 */
int loadKimmoRules(rulefile, lang)
unsigned char *rulefile;
KimmoData *lang;
{
unsigned char *tok;
unsigned long cRules = 0L;
int retValue;

if ((rulefile == NULL) || (lang == NULL))
	return -1;
bSilentMessages_m = lang->bSilent;
bShowWarnings_m   = lang->bShowWarnings;
pLogFP_m          = lang->pLogFP;
/*
 *  erase any existing rules
 */
freeKimmoRules(lang);
reportProgress( cRules );
/*
 * start out assuming this is not a twolc rules file
 */
lang->bTwoLCFile = FALSE;
bTwoLCFile_m     = FALSE;
/*
 *  open the Rules file
 */
if ( (rules_fp = fopen((char *)rulefile, "r")) == (FILE *)NULL )
	{
	displayNumberedMessage(&sBadRuleFile_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   NULL, 0,
			   rulefile);
	return( -1 );
	}
filename = (char *)rulefile;
/*
 *  initialize the alphabet and arrays of KimmoSubsets and KimmoRules
 */
lang->ppszAlphabet   = (unsigned char **)NULL;
lang->uiAlphabetSize = 0;
lang->cNull          = NUL;
lang->cAny           = NUL;
lang->cBoundary      = NUL;
lang->pSubsets       = (KimmoSubset *)NULL;
lang->uiSubsetCount  = 0;
size_subsets         = 0;
lang->pAutomata      = (KimmoRule *)NULL;
lang->uiAutomataSize = 0;
size_rules           = 0;
lang->pszRulesFile   = (char *)NULL;
/*
 * set lang->cComment to default (';')
 */
lang->cComment       = KIMMO_DEFAULT_COMMENT;
lang->sPATR.cComment = PATR_DEFAULT_COMMENT;
line_num = 0;
/*
 * Check for comment definition
 */
tok = get_token(lang->cComment);
if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "nothing in file");
	goto bad_rulefile;
	}
else while (strcmp((char *)tok,"COMMENT") == 0)
	{		/* set the COMMENT character */
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num);
	goto bad_rulefile;
	}
	if (is_keyword((char *)tok))
	{
	displayNumberedMessage(&sMissingCOMMENTvalue_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num);
	continue;
	}
	if (!bad_comment(*tok, lang))
	{
	lang->cComment       = *tok;
	lang->sPATR.cComment = *tok;
	}
	tok = get_token(lang->cComment);
	}

/*
 *  read the ALPHABET:  it must come next
 */
if (tok == (unsigned char *)NULL)
	{
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num,
			   "nothing in file");
	goto bad_rulefile;
	}
else if (strcmp((char *)tok,"ALPHABET") != 0)
	{
	displayNumberedMessage(&sExpectedALPHABET_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   filename, line_num);
	goto bad_rulefile;
	}
else if (set_alphabet(&tok,lang) == -1)
	goto bad_rulefile;
/*
 *  load the rest of rules file following the ALPHABET
 */
for (;;)
	{
	if (bCancelKimmoOperation_g)
	goto cancelled;
	++cRules;
	if ((cRules & 0x0FL) == 0L)
	reportProgress( cRules );
	if (tok == (unsigned char *)NULL)		/* EOF */
	{
	sUnexpectedEndOfRules_m.eType = WARNING_MSG;
	displayNumberedMessage(&sUnexpectedEndOfRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   "expected END");
	sUnexpectedEndOfRules_m.eType = ERROR_MSG;
	break;
	}
	if (strcmp((char *)tok, "END") == 0)
	{
	/* twolc rules files have END after ALPHABET and NULL, and before */
	/* rules */
	tok = get_token(lang->cComment);
	if (tok == (unsigned char *)NULL)	/* EOF */
		break;
	if (strcmp((char *)tok,"AUTOMATA") == 0)
		{
		/* this is a twolc rules file; continue reading file */
		fix_twolc_boundary(lang);

		if (lang->uiSubsetCount > 0)
		{
		displayNumberedMessage(&sSUBSETinTwolcFile_m,
					   bSilentMessages_m, bShowWarnings_m,
					   pLogFP_m,
					   NULL, 0);
		goto bad_rulefile;
		}
		else
		{
		bTwoLCFile_m = TRUE;
		tok = get_token(lang->cComment);
		}
		}
	else
		break;
	}
	else if (strcmp((char *)tok,"ANY") == 0)
	{				/* set the ANY character */
	if (set_any(lang) == -1)
		goto bad_rulefile;
	tok = get_token(lang->cComment);
	}
	else if (strcmp((char *)tok,"NULL") == 0)
	{				/* set the NULL character */
	if (set_null(lang) == -1)
		goto bad_rulefile;
	tok = get_token(lang->cComment);
	}
	else if (strcmp((char *)tok,"BOUNDARY") == 0)
	{				/* set the BOUNDARY character */
	if (set_boundary(lang) == -1)
		goto bad_rulefile;
	tok = get_token(lang->cComment);
	}
	else if (strcmp((char *)tok,"SUBSET") == 0)
	{				/* add an alphabet SUBSET */
	if (bTwoLCFile_m)
		{
		displayNumberedMessage(&sInvalidTwolcKeyword_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num,
				   tok);
		goto bad_rulefile;
		}
	else if (add_subset(&tok,lang) == -1)
		goto bad_rulefile;
	}
	else if (strcmp((char *)tok,"RULE") == 0)
	{				/* add a RULE */
	if (bTwoLCFile_m)
		{
		/*
		 *  just swallow the keyword RULE if it occurs in a
		 *  twolc rules file
		 */
		tok = get_token(lang->cComment);
		if (*tok != '"')
		displayNumberedMessage(&sMissingRuleNameDelim_m,
					   bSilentMessages_m, bShowWarnings_m,
					   pLogFP_m,
					   filename, line_num);
		/* keep going, assuming it's using something else to delimit it */
		if (add_twolc_rule(lang,tok) == -1)
		goto bad_rulefile;

		tok = get_token(lang->cComment);
		}
	else	/* !(bTwoLCFile_m) */
		{
		if (add_rule(lang) == -1)
		goto bad_rulefile;
		tok = get_token(lang->cComment);
		}
	}
	else if (*tok == '"')
	{
	/*
	 *  twolc rules start with just a quote mark, not the keyword RULE.
	 *  Pass the portion of the rule name that is in tok to
	 *  add_twolc_rule(), so it can figure out what it needs to do to get
	 *  the complete rule name.
	 */
	if (add_twolc_rule(lang,tok) == -1)
		goto bad_rulefile;

	tok = get_token(lang->cComment);
	}
	else if (strcmp((char *)tok,"COMMENT") == 0)
	{				/* add or change COMMENT character */
	tok = get_token(lang->cComment);
	if ( (tok == (unsigned char *)NULL) || is_keyword((char *)tok) )
		{
		displayNumberedMessage(&sMissingCOMMENTvalue_m,
				   bSilentMessages_m, bShowWarnings_m,
				   pLogFP_m,
				   filename, line_num);
		continue;
		}
	if (!bad_comment(*tok, lang))
		lang->cComment = *tok;
	tok = get_token(lang->cComment);
	}
	else if (strcmp((char *)tok,"ALIGNMENT") == 0)
	{
	if (get_alignment(lang) == -1)
		goto bad_rulefile;
	break;		/* there can't be anything else after the alignment */
	}
	else
	{
	displayNumberedMessage(&sInvalidKeyword_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   filename, line_num,
				   tok);
	goto bad_rulefile;
	}
	}
reportProgress( cRules );

if (bTwoLCFile_m)
	{
	if (lang->pFeasiblePairs == NULL)
	{
	displayNumberedMessage(&sNoFeasiblePairsInRules_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   NULL, 0);
	goto bad_rulefile;
	}
	}

/*
 *  check that the special characters are defined
 *  For twolc files, there is no ANY character, NULL is declared, and
 *  BOUNDARY is defined in get_alignment().
 */
if (lang->cAny == NUL)
	{
	if (!bTwoLCFile_m)
	displayNumberedMessage(&sUndefinedANY_m,
				   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
				   NULL, 0 );
	}
if (lang->cNull == NUL)
	displayNumberedMessage(&sUndefinedNULL_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   NULL, 0 );
if (lang->cBoundary == NUL)
	{
	displayNumberedMessage(&sUndefinedBOUNDARY_m,
			   bSilentMessages_m, bShowWarnings_m, pLogFP_m,
			   NULL, 0 );
	goto bad_rulefile;		/* need this for the lexicon file */
	}
/*
 *  squeeze the arrays of KimmoSubsets and KimmoRules to exact fits
 *  then calculate the feasible pairs, and return zero to indicate success
 */
if (lang->uiSubsetCount < size_subsets)
	lang->pSubsets = (KimmoSubset *)reallocMemory(lang->pSubsets,
			  lang->uiSubsetCount * (unsigned)sizeof(KimmoSubset));
if (lang->uiAutomataSize < size_rules)
	lang->pAutomata = (KimmoRule *)reallocMemory(lang->pAutomata,
			   lang->uiAutomataSize * (unsigned)sizeof(KimmoRule));
fclose(rules_fp);
/*
 *  if this wasn't a twolc rules file, call computeKimmoFeasiblePairs() to
 *  expand column heads (SUBSETs and the ANY character need expanding)
 */
if (!bTwoLCFile_m)
	computeKimmoFeasiblePairs(lang);

lang->pszRulesFile = duplicateString((char *)rulefile);
lang->bTwoLCFile   = bTwoLCFile_m;
return( 0 );

/*------------------------------ CANCELLATION ------------------------------*/
cancelled:
/* handled the same as an error */

/*------------------------------ ERROR RETURN ------------------------------*/
bad_rulefile:

retValue = -1;
fclose(rules_fp);
freeKimmoRules(lang);
return( retValue );
}

/****************************************************************************
 * NAME
 *    writeKimmoFeasiblePairs
 * DESCRIPTION
 *    write a list of the current Kimmo feasible pairs to the output file
 * RETURN VALUE
 *    none
 */
void writeKimmoFeasiblePairs(pOutputFP_in, pKimmo_in)
FILE *		pOutputFP_in;
KimmoData *	pKimmo_in;
{
int	i;
int	num;
int	left;
int	j;
int	max;
char	fmt[8];

if (	(pOutputFP_in == NULL) ||
	(pKimmo_in    == NULL) ||
	(pKimmo_in->pFeasiblePairs == NULL) )
	return;
/*
 *  display the feasible pairs
 */
j    = 0;
left = pKimmo_in->uiFeasiblePairsCount;
					/* (alphabet stored longest first) */
i    = strlen((char *)pKimmo_in->ppszAlphabet[0]);
sprintf(fmt, " %%%ds", i);
max  = 79 / (i + 1);

while ( left > 0 )
	{
	num = (max < left) ? max : left;
	for ( i = 0 ; i < num ; i++ )
	fprintf(pOutputFP_in, fmt,
		convertKimmoIndexToCharacter(
			pKimmo_in->pFeasiblePairs[i+j].cLexical, pKimmo_in) );
	putc( '\n', pOutputFP_in);
	for ( i = 0 ; i < num ; i++ )
	fprintf(pOutputFP_in, fmt,
		convertKimmoIndexToCharacter(
			pKimmo_in->pFeasiblePairs[i+j].cSurface, pKimmo_in) );
	putc( '\n', pOutputFP_in);
	left -= num;
	j    += num;
	if (left > 0)
	putc( '\n', pOutputFP_in);	/* separate each set of two lines */
	}
}

/****************************************************************************
 * NAME
 *    writeKimmoRule
 * DESCRIPTION
 *    write the designated Kimmo rule to the output file
 * RETURN VALUE
 *    none
 */
void writeKimmoRule(uiRuleNumber_in, pOutputFP_in, pKimmo_in)
unsigned	uiRuleNumber_in;
FILE *		pOutputFP_in;
KimmoData *	pKimmo_in;
{
unsigned	i;
unsigned	j;
KimmoRule *	rp;
KimmoFSAColumn *cp;
unsigned char *	lp;
unsigned char *	sp;

if ((pOutputFP_in == NULL) || (pKimmo_in == NULL))
	return;
if ((uiRuleNumber_in == 0) || (uiRuleNumber_in > pKimmo_in->uiAutomataSize))
	return;
rp = &pKimmo_in->pAutomata[uiRuleNumber_in-1];
fprintf(pOutputFP_in, "%3d %s \"%s\"\n",
	uiRuleNumber_in, (rp->bActive) ? "on " : "off", rp->pszName );
if (!rp->bActive)
	return;

for ( cp = rp->pColumns, i = 0 ; i < rp->iColumnCount ; ++i, ++cp )
	{
	fprintf(pOutputFP_in, "%s:%s  (", cp->pszLexName, cp->pszSurfName );
	for ( lp = cp->pLexChars, sp = cp->pSurfChars ; *lp != NUL ; ++lp, ++sp )
	fprintf(pOutputFP_in, " %s:%s",
		convertKimmoIndexToCharacter(*lp, pKimmo_in),
		convertKimmoIndexToCharacter(*sp, pKimmo_in));
	fprintf(pOutputFP_in, " )\n" );
	}
for ( i = 0 ; i < rp->iRowCount ; ++i )
	{
	fprintf(pOutputFP_in, "%2d%c", i+1, (rp->puiFinalStates[i]) ? ':' : '.');
	for ( j = 0 ; j < rp->iColumnCount ; ++j )
	fprintf(pOutputFP_in, " %2d", rp->pColumns[j].puiTransitions[i]);
	fprintf(pOutputFP_in, "\n");
	}
}

/****************************************************************************
 * NAME
 *    writeKimmoRulesStatus
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Execute a LIST RULES command.
 * RETURN VALUE
 *    none
 */
void writeKimmoRulesStatus(pOutputFP_in, pKimmo_in)
FILE *		pOutputFP_in;
KimmoData *	pKimmo_in;
{
int i;
int num;
KimmoRule *rp;

for (	num = pKimmo_in->uiAutomataSize, rp = pKimmo_in->pAutomata, i = 0 ;
	i < num ;
	++i, ++rp )
	{
	fprintf(pOutputFP_in, "%3d %s \"%s\"\n",
		i+1, (rp->bActive) ? "on " : "off", rp->pszName );
	}
}

/*****************************************************************************
 * NAME
 *    setKimmoRuleStatus
 * ARGUMENTS
 *    num - number string of the first rule to set, or NULL for all rules
 *    val - value for setting: TRUE for ON, FALSE for OFF
 * DESCRIPTION
 *    Execute a SET RULES {ON|OFF} {ALL|<number(s)>} command.
 * RETURN VALUE
 *    none
 */
void setKimmoRuleStatus(iRule_in, bValue_in, pKimmo_io)
int		iRule_in;
int		bValue_in;
KimmoData *	pKimmo_io;
{
unsigned i;

if (pKimmo_io->bTwoLCFile)
	{
	displayNumberedMessage(&sTwoLCOnOff_m,
			   bSilentMessages_m, bShowWarnings_m, NULL,
			   NULL, 0 );
	return;
	}
if (iRule_in == 0)
	{
	for ( i = 0 ; i < pKimmo_io->uiAutomataSize ; ++i )
	pKimmo_io->pAutomata[i].bActive = bValue_in;
	}
else if ((iRule_in > 0) && (iRule_in <= pKimmo_io->uiAutomataSize))
	{
	pKimmo_io->pAutomata[iRule_in-1].bActive = bValue_in;
	}
computeKimmoFeasiblePairs(pKimmo_io);
}

/*****************************************************************************
 * NAME
 *    checkKimmoRuleStatus
 * DESCRIPTION
 *    check whether the given rule is ON or OFF
 * RETURN VALUE
 *    TRUE if the given rule is ON, otherwise FALSE
 */
int checkKimmoRuleStatus(iRule_in, pKimmo_in)
int		iRule_in;
KimmoData *	pKimmo_in;
{
if (	(pKimmo_in != NULL) &&
	(iRule_in > 0) &&
	(iRule_in <= pKimmo_in->uiAutomataSize) )
	return pKimmo_in->pAutomata[iRule_in-1].bActive;
else
	return FALSE;
}
