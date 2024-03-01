/* GRAMMAR.C - load a PATR style grammar
 ******************************************************************************
 *
 * int loadPATRGrammar(char *     pszFilename_in,
 *		       PATRData * pPATR_io)
 * void freePATRGrammar(PATRData * pPATR_io)
 *
 ******************************************************************************
 * Copyright 1987, 2002 by SIL International.  All rights reserved.
 */
#include "assert.h"
#include "patr.h"
#include "patrdef.h"
#include "allocmem.h"
#include "rpterror.h"	/* for NumberedMessage and displayNumberedMessage() */
#include "cmd.h"	/* temp fix */
#ifdef HAVE_ALLOCA
#ifdef HAVE_ALLOCA_H
#include <alloca.h>
#else
void * alloca(size_t size);
#endif
#endif

#if _MSC_VER >= 700
#define strcasecmp(x,y) _stricmp(x,y)
#else
#ifndef HAVE_STRCASECMP
#define strcasecmp stricmp
#endif
extern int strcasecmp P((const char *s1, const char *s2));
#endif
/*
 *  define the various token types
 */
#define BECOMES_TOKEN	200			/* -> */
#define KEYWORD_TOKEN	201			/* "rule", "let", ... */
#define SYMBOL_TOKEN	202
#define REPLACE_TOKEN	203			/* => */
#define PRIORITYUNION_TOKEN 204			/* <= */
#define CONSTRAINT_TOKEN    205			/* == */
#define CONDITIONAL_TOKEN   BECOMES_TOKEN	/*  -> */
#define BICONDITIONAL_TOKEN 206			/* <-> */
/*
 *  define the maximum token length.  Anything beyond maximum is ignored.
 */
#define MAX_TOKEN_SIZE 300
/*
 *  define the maximum number of coreferences in a feature structure
 */
#define MAXREF 100

/*-------------------------------------------------------------------
 * ComplexPSR is a linked list of structures.  Each structure usually
 *   represents an element of the phrase structure rule.
 *   It contains the element name  and a pointer to
 *   a linked list of arcs leaving the state.
 *-----------------------------------------------------------------*/

typedef struct complex_psr	/* Complex Phrase Structure Rule structure */
	{
	char *		pszName;	/* Name of element */
	char *		pszLhsName;	/* Name of left hand side */
	struct simple_psr *	pPsrs;		/* list of PSR expansions produced up
					 * to this element */
	struct complex_psr *pNext;		/* Link to next element */
	} ComplexPSR;

typedef struct alloc_simple_psr
	{
	struct alloc_simple_psr *	pNext;
	ComplexPSR			node;
	} Alloc_ComplexPSR;

#define MAX_UNIFICATION_DISJUNCTION 8
typedef struct simple_psr	/* Simple Phrase Structure Rule structure */
	{
	PATRNonterminal *		pHead;	/* beginning list of nonterminals */
	PATRNonterminal *		pTail;	/* end of list of nonterminals */
	PATRFeature *		pFeature;
	PATRFeatureDisjunction *	pFeatures[MAX_UNIFICATION_DISJUNCTION+1];
	PATRFeatureDisjunction *	pFeatureTails[MAX_UNIFICATION_DISJUNCTION+1];
	struct simple_psr *		pNext;
	} SimplePSR;

typedef struct alloc_psr
	{
	struct alloc_psr *	pNext;
	SimplePSR		node;
	} Alloc_SimplePSR;
/*
 *  Symbol list is list of symbols in a rule
 */
typedef struct symlist
	{
	char *		pszSymbol;		/* Symbol */
	struct symlist *	pNext;			/* Link to next */
	} SymbolList;

typedef enum { kNormalToken, kExpressionToken, kLexiconToken } GramTokenType;

/*****************************************************************************
 * NAME
 *    GrammarData
 * DESCRIPTION
 *    data used while loading a grammar (these used to be static globals,
 *    except for the first two, which where separate function parameters)
 */
typedef struct grammar_data
{
	PATRData *         pPATR;
	PATRGrammar *      pGrammar;
	Alloc_ComplexPSR * pComplexPSRList;
	unsigned long      iSizeComplexPSRList;
	Alloc_SimplePSR *  pSimplePSRList;
	unsigned long      iSizeSimplePSRList;
	SymbolList *       pSymbolList;
	/*
	 * Co-reference list
	 */
				/* List of references */
	PATRFeature **     apRefFeature;
				/* Top feature structure for path lookups */
	PATRFeature *      pTopFeature;
	int                bFirstSymbol;	/* True if first symbol in a path */
	const char *       pszGrammarFilename;
	char               chCommentCharacter;
	int                iDebugLevel;
	int                bSilent;
	int                bShowWarnings;
	FILE *             pLogFP;
	unsigned           uiLineNumber;	/* line number from grammar file */
	FILE *             pGrammarFP;	/* Grammar file */
	char               szNextToken[MAX_TOKEN_SIZE+1];
	int                iNextTokenType;
	char               szPsrLhsSymbol[MAX_TOKEN_SIZE+1];
	char               szUnusedFeatureLabel[MAX_TOKEN_SIZE+1];
	char *             psz0;
	/*
	 *  global list of embedded alternatives found while reading the definition
	 *  of the current template
	 */
	PATRFeatureDisjunction * pEmbeddedAlts;
	/*
	 *  grammar feature structure
	 */
	PATRFeature *      pGramFeat;
	/* number of errors found */
	unsigned           iGrammarErrorCount;
	/* Symbol to change to zero in read */
	/* (Left hand symbol in rule) */
	char *             pLeftSymbol;
	/* Left hand symbol with index */
	char *             pIndexedLeftSymbol;
	/* stores path (list of labels) on which an embedded */
	StringList *       pCurrentPath;
	/* end of pCurrentPath stored for push/pop */
	StringList *       pCurrentLast;
	/* path currently being read by read_find_or_create */
	StringList *       pReadingPath;
	int                bStoredPeriod;
	GramTokenType      eTokenizeMode;
	PATRParseData *    pParseData;
	/*
	 *  variable to control grammar input tokenizing
	 */
	const char *       pszReservedChars;
	int				   iNextPartialId;
} GrammarData;

/*
 *  variables to control grammar input tokenizing
 */
static const char szReservedChars_m[]          = "(){}[]<>=:";
static const char szReservedCharsWithSlash_m[] = "(){}[]<>=:/";
static const char szPeriod_m[] = ".";
/*
 *  "out of memory" exception buffer
 */
static jmp_buf sOutOfMemory_m;
/*
 *  error messages
 */
static const NumberedMessage sBadGrammarFile_m		= { ERROR_MSG,   500,
	"Grammar file %s not found" };
static const NumberedMessage sEmptyGrammarFile_m	= { ERROR_MSG,   501,
	"Grammar file %s is empty" };
static const NumberedMessage sBadGrammarDeclaration_m	= { ERROR_MSG,   502,
	"%s%s ... has no %s" };
static const NumberedMessage sNoRulesFound_m		= { ERROR_MSG,   503,
	"No rules found in grammar" };
static const NumberedMessage sBadStartSymbol_m		= { ERROR_MSG,   504,
	"%s is not a valid start symbol" };
static const NumberedMessage sNotDefinedByLet_m		= { WARNING_MSG, 505,
	"%s not defined by Let" };
static const NumberedMessage sIncompatiblePaths_m	= { ERROR_MSG,   506,
	"Let %s be ... has incompatible paths" };
static const NumberedMessage sInvalidDeclarationType_m	= { ERROR_MSG,   508,
	"Invalid declaration type %s - expected Let or Rule" };
static const NumberedMessage sFeaturesProduceFAIL_m	= { ERROR_MSG,   509,
	"Features of %s produce FAIL" };
static const NumberedMessage sBadCall_expand_psrs_m	= { ERROR_MSG,   517,
	"expand_psrs() called with NULL delimiter." };
static const NumberedMessage sUnmatchedInFormula_m	= { ERROR_MSG,   518,
	"Unmatched %s in the following formula:" };
static const NumberedMessage sBadCall_pop_path_m	= { WARNING_MSG, 519,
	"Attempt to pop_path() when pCurrentLast_m is NULL." };
static const NumberedMessage sUnexpectedBeforeInPath_m	= { WARNING_MSG, 521,
	"Unexpected %c before %s" };
static const NumberedMessage sIncompatibleAlternatives_m= { ERROR_MSG,   522,
	"Incompatible alternatives on path <%s>" };
static const NumberedMessage sEmptyPath_m		= { WARNING_MSG, 524,
	"Empty path: %s" };
static const NumberedMessage sPathWithoutEqual_m	= { WARNING_MSG, 525,
	"Path not followed by equal" };
static const NumberedMessage sInvalidDisjunction_m	= { WARNING_MSG, 526,
	"Invalid disjunction" };
static const NumberedMessage sFailsToUnify_m		= { WARNING_MSG, 527,
	"%s fails to unify" };
static const NumberedMessage sInvalidReferenceNumber_m	= { WARNING_MSG, 530,
	"Invalid reference number %s" };
static const NumberedMessage sLabelHasEmptyPath_m	= { WARNING_MSG, 531,
	"Label %s has empty path" };
static const NumberedMessage sUndefinedReference_m	= { WARNING_MSG, 532,
	"Reference $%s not defined above" };
static const NumberedMessage sReferenceNotAllowed_m	= { WARNING_MSG, 533,
	"Reference not allowed before atom" };
static const NumberedMessage sUnexpectedSoSkipping_m	= { WARNING_MSG, 534,
	"Unexpected %s; Skipping to ]" };
static const NumberedMessage sNotDefinedInLet_m		= { WARNING_MSG, 535,
	"%s not defined in Let; Skipping to ]" };
static const NumberedMessage sEOFbeforeBracket_m	= { ERROR_MSG,   536,
	"End of file reached before expected ']' found" };
static const NumberedMessage sEOFbeforeWedge_m		= { ERROR_MSG,   537,
	"End of file reached before expected '>' found" };
static const NumberedMessage sFailureToUnify_m		= { WARNING_MSG, 538,
	"Failure to unify < %s>" };
static const NumberedMessage sRedefinition_m		= { ERROR_MSG,   539,
	"%s %s %s redefined (previous %s %s %s" };
static const NumberedMessage sEOFbeforeBrace_m		= { ERROR_MSG,   540,
	"End of file reached before expected '}' found" };
static const NumberedMessage sUnterminatedFeaturePath_m	= { WARNING_MSG, 541,
	"Unterminated feature path: \"%s\"" };
static const NumberedMessage sSameLeftRightCategories_m	= { ERROR_MSG,   542,
	"Identical left and right categories in rule %s" };
static const NumberedMessage sBadParameter_m		= { ERROR_MSG,   543,
	"Invalid Parameter statement: %s %s %s %s ..." };
static const NumberedMessage sRepeatedNonterminal_m	= { WARNING_MSG, 544,
	"Nonterminal %s is repeated %u times in phrase structure rule" };
static const NumberedMessage sConstraintDisjunctTooNested_m= { ERROR_MSG,550,
	"Unification constraint disjunctions nested more than %d levels" };
static const NumberedMessage sInvalidSlash_m		= { ERROR_MSG,   551,
	"Invalid / in unification constraint (missing { for disjunction?)" };
static const NumberedMessage sInvalidCloseBrace_m	= { ERROR_MSG,   552,
	"Invalid } in unification constraint (missing { for disjunction?)" };
static const NumberedMessage sInvalidConstraintSymbol_m	= { ERROR_MSG,   553,
	"Invalid symbol in unification constraint - \"%s\"" };
static const NumberedMessage sInvalidLexicalRule_m	= { ERROR_MSG,   554,
	"Invalid symbol in \"Define %s as ...\": %s" };
static const NumberedMessage sDisjunctsNotUnified_m	= { ERROR_MSG,   555,
	"Embedded disjunctions did not unify%s" };
static const NumberedMessage sNoDisjunctPriorityUnion_m	= { ERROR_MSG,   556,
	"Priority union operations may not appear in a disjunction" };
static const NumberedMessage sNoPriorityUnionComplexFeature_m= { ERROR_MSG,557,
	"A priority union operation may not contain a complex feature" };
static const NumberedMessage sNoPriorityUnionDisjunction_m= { ERROR_MSG, 558,
	"Priority union operations may not appear in a disjunction" };
static const NumberedMessage sNoPriorityUnionDefaultAtom_m= { ERROR_MSG, 559,
	"A priority union operation may not contain a default atom" };
static const NumberedMessage sNoDisjunctConstraint_m	= { ERROR_MSG,   560,
	"Logical constraint operations may not appear in a disjunction" };
static const NumberedMessage sUnknownError_m		= { ERROR_MSG,   561,
	"Internal program error -- I'm confused...(%s)" };
static const NumberedMessage sNoConstraintCloseParen_m	= { ERROR_MSG,   562,
	"Missing closing parenthesis in logical constraint expression" };
static const NumberedMessage sNoConstraintPath_m	= { ERROR_MSG,   563,
	"Logical constraint expressions may not contain a path" };
static const NumberedMessage sNoConstraintDisjunction_m	= { ERROR_MSG,   564,
	"Logical constraint expressions may not contain a disjunction.\n\
	Use parentheses to group logical operators such as OR (/)" };
static const NumberedMessage sNoConstraintAtom_m	= { ERROR_MSG,   565,
	"Logical constraint operations may not contain an atom" };
static const NumberedMessage sFeaturesProduceCycle_m	= { ERROR_MSG,   566,
	"Features of %s produce a cycle" };
static const NumberedMessage sUnificationProducesCycle_m= { ERROR_MSG,   567,
	"Feature unification produced a cycle" };
static const NumberedMessage sInvalidSlashPU_m		= { ERROR_MSG,   568,
	"Invalid / in priority union expression" };
static const NumberedMessage sInvalidSlashLC_m		= { ERROR_MSG,   569,
	"Invalid / in Logical constraint expression (missing parentheses?)" };
/*
 *  local function prototypes
 */
static int		loadTemplate P((GrammarData * pData));
static int		loadParameter P((GrammarData * pData));
static int		loadLexicalRule P((GrammarData * pData));
static int		loadRule P((GrammarData * pData));
static SimplePSR *	form_to_psrs P((ComplexPSR *, GrammarData * pData));
static void		show_psrs P((SimplePSR *psrs));
static void		install_rule P((char *, char *,
					SimplePSR *,
					PATRFeature *,
					PATRPriorityUnion * pPriorityUnions_in,
					PATRConstraint *    pConstraints_in,
					GrammarData * pData));
static int preservable_optional_constraints_p P((
					char *cat,
					PATRFeature *pDag1,
					PATRFeature *pDag2,
					PATRData *pPATR));
static int designator_has_value_p P((PATRComplexFeature *prefix));
static int count_constraint_prefixes P((
					PATRComplexFeature *prefix,
					PATRFeature *pDag,
					PATRData *pPATR));
static int constraint_prefix_p P((
					PATRComplexFeature *prefix,
					PATRComplexFeature *designator));
static void expand_optional_non_terminal P((
	PATRNonterminal * nterm,
	char * id,
	char * lhs,
	SimplePSR * psr,
	PATRFeature * dag,
	PATRPriorityUnion * pPriorityUnions_in,
	PATRConstraint * pConstraints_in,
	GrammarData * pData));
static void create_partial_rule P((
	PATRNonterminal* nterm,
	char* id,
	char* lhs,
	SimplePSR* psr,
	PATRFeature* dag,
	PATRPriorityUnion* pPriorityUnions_in,
	PATRConstraint* pConstraints_in,
	GrammarData* pData));
static PATRFeature* select_constraints P((
	PATRFeature* pDag,
	PATRNonterminal* non_terminals,
	PATRNonterminal* non_terminals2,
	int prefer_first,
	GrammarData* pData));
static char*	new_partial_cat P((char* cat, char* nterm_name, GrammarData* pData));
static void		install_category P((PATRRule *, int, char *,
						GrammarData * pData));
static void		free_symlist P((GrammarData * pData));
static void		add_to_symlist P((char * sym, GrammarData * pData));
static void		checkForRepeated P((SimplePSR *pPSR_in,
						GrammarData * pData));
static int		balcheck P((ComplexPSR *, GrammarData * pData));
static ComplexPSR *	expand_psrs P((ComplexPSR *, char *,
					   GrammarData * pData));
static long		nomatch P((ComplexPSR *, char *, GrammarData * pData));
static SimplePSR *	append_psrs P((SimplePSR *, SimplePSR *,
					   GrammarData * pData));
static SimplePSR *	union_psrs P((SimplePSR *, SimplePSR *));
static char *		in_symlist P((char *, GrammarData * pData));
static ComplexPSR *	matchfind P((ComplexPSR *, char *));
static PATRNonterminal * new_nonterm P((char *, GrammarData * pData));
static void		append_nonterms P((SimplePSR *, PATRNonterminal *,
					   PATRNonterminal *));
static SimplePSR *	copy_psr P((SimplePSR *, GrammarData * pData));
static PATRNonterminal * copy_nonterm P((PATRNonterminal *,
					 GrammarData * pData));
static PATRDefinition *	newTemplate P((char *name, GrammarData * pData));
static PATRDefinition *	newLexicalRule P((char *name, GrammarData * pData));
static PATRDefinition *	newConstraint P((char *        pszName_in,
					 GrammarData * pData));
static int		unify_template_alts P((PATRDefinition *template,
						   PATRFeatureDisjunction *newalts,
						   GrammarData * pData));
static StringList *	new_path P((char * label, GrammarData * pData));
static StringList *	copy_path P((StringList * pPath_in,
					 GrammarData * pData));
static void		pop_path P((StringList *path, GrammarData * pData));
static StringList *	push_path P((char *label, GrammarData * pData));
static PATRFeature *	read_find_or_create P((PATRFeature *findfs,
						   GrammarData * pData));
static PATRFeature *	loaderr P((const NumberedMessage * mp,
				   const char * s,
				   GrammarData * pData));
static PATRFeature *	load_feat_struct P((PATRFeature * newfs,
						PATRFeature * pathfs,
						GrammarData * pData));
static PATRFeature *	add_path_prefix P((PATRFeature *fs, StringList *path,
					   PATRData * pPATR_io));
static int		add_embedded_disj P((PATRFeatureDisjunction * disj,
						 StringList *  path,
						 GrammarData * pData));
static void		init_current_last P((GrammarData * pData));
static ComplexPSR *	makeform P((char *, char *, ComplexPSR *,
					GrammarData * pData));
static PATRFeature *	read_formula P((int	       bFormulaOnly_in,
					PATRFeature ** ppLHS_out,
					GrammarData *  pData));
static void		init_current_path P((GrammarData * pData));
static PATRFeature *	read_feat_struct P((GrammarData * pData));
static PATRFeatureDisjunction * read_disjunction P((GrammarData * pData));
static PATRFeature *	read_atom P((char *token, PATRData * pPATR_io));
static ComplexPSR *	alloc_ComplexPSR P((GrammarData * pData));
static void		free_ComplexPSR P((GrammarData * pData));
static void		showComplexPSR P((char *, ComplexPSR *));
static SimplePSR *	alloc_SimplePSR P((GrammarData * pData));
static void		free_SimplePSR P((GrammarData * pData));
static int		featureMatchesPSR P((PATRFeature * pFeature_in,
						 SimplePSR *pPSR_in,
						 GrammarData * pData));
static void		readRuleID P((char *pszBuffer, unsigned cbBufferSize,
					  GrammarData * pData));
static int		readCharacter P((GrammarData * pData));
static int		readNextCharacter P((GrammarData * pData));
static void		skipToEndOfLine P((GrammarData * pData));
static int		readToken P((char *pszBuffer, unsigned uiBufferSize,
					 GrammarData * pData));
static int		getToken P((char *pszBuffer, unsigned uiBufferSize,
					GrammarData * pData));
static int		getNextToken P((char *pszBuffer,
					unsigned uiBufferSize,
					GrammarData * pData));
static void		showPATRDefinitions P((PATRGrammar * pGrammar_in,
						   PATRData * pPATR_in));
static void		showRules P((PATRGrammar * pGrammar_in,
					 PATRData * pPATR_in));
static void		showHashTables P((PATRGrammar *pGrammar_in));
static PATRFeatureDisjunction * copyPartialDisjunction P((
						PATRFeatureDisjunction *pList_in,
						PATRFeatureDisjunction *pTail_in,
						PATRData * pPATR_in));
static char *		strappend P((char *t, char *s, PATRData * pPATR_in));
static PATRPriorityUnion * loadPriorityUnion P((
										PATRPriorityUnion * pPriorityUnions_in,
					StringList *        pLeftPath_in,
					GrammarData * pData));
static void		freePriorityUnions P((
										PATRPriorityUnion * pPriorityUnions_in,
						PATRData * pPATR_io));
static void		storePriorityUnions P((
									  PATRPriorityUnion * pPriorityUnions_in,
					  PATRGrammar *       pGrammar_in));

static PATRLogicalExpression * loadPATRLogicalExpression P((
							 GrammarData * pData));
static PATRConstraint *	loadLogicalConstraint P((
											 PATRConstraint * pConstraints_in,
						 StringList *     pLeftPath_in,
						 GrammarData * pData));
static void		freePATRLogicalFactor P((
						  PATRLogicalFactor * pFactor_io,
						  PATRData * pPATR_in));
static void		freePATRLogicalExpression P((
					  PATRLogicalExpression * pExpression_io,
					  PATRData * pPATR_in));
static void		freeLogicalConstraints P((
											PATRConstraint * pConstraints_in,
						PATRData * pPATR_in));
static PATRLogicalFactor * copyPATRLogicalFactor P((
						  PATRLogicalFactor * pFactor_in,
						  PATRData * pPATR_in));
static PATRLogicalExpression * copyPATRLogicalExpression P((
					  PATRLogicalExpression * pExpression_in,
					  PATRData * pPATR_in));
static void		storeLogicalConstraints P((
											 PATRConstraint * pConstraints_in,
						 PATRGrammar * pGrammar_in));
static int		loadConstraint P((GrammarData * pData));
static void		grammar_too_big P((size_t uiRequest_in));

static void		freePATRLexicalRule P((PATRLexicalRule * pLexRule_in,
						   PATRData * pPATR_in));

#ifdef applec
#pragma segment S_grammar
#endif

/*****************************************************************************
 * NAME
 *    loadPATRGrammar
 * DESCRIPTION
 *    Load a grammar from a file, building a grammar structure
 * RETURN VALUE
 *    zero if an error occurs, otherwise non-zero
 */
int loadPATRGrammar(pszFilename_in, pPATR_io)
const char *	pszFilename_in;	/* file name for grammar */
PATRData *	pPATR_io;
{
PATRGrammar	temp_gram;
GrammarData     sData;
PATRParseData	sParseData;
PATRGrammar *	gram = NULL;
char		szToken[MAX_TOKEN_SIZE+1];
int		iTokenType;
unsigned long	uiGrammarItems;
PATRRuleList *	rlp;
int		bInComment;
void (*		pFunc) P((size_t size));

if ((pszFilename_in == NULL) || (pPATR_io == NULL))
	return 0;

memset(&sData, 0, sizeof(sData));
memset(&sParseData, 0, sizeof(sParseData));
 if (pPATR_io->pLogFP != NULL)
   fprintf(pPATR_io->pLogFP, "   Grammar file used: %s\n", pszFilename_in);
sData.pGrammarFP = fopen( pszFilename_in, "r" );	/* Open grammar file */
if (sData.pGrammarFP == NULL)
	{
	/*
	 *  if file doesn't exist, give error message
	 */
	displayNumberedMessage(&sBadGrammarFile_m,
			   pPATR_io->bSilent, pPATR_io->bShowWarnings,
			   pPATR_io->pLogFP,
			   NULL, 0, pszFilename_in);
	return 0;			/* Error exit */
	}
sData.pszGrammarFilename = pszFilename_in;
sData.chCommentCharacter = pPATR_io->cComment;
sData.iDebugLevel        = pPATR_io->iDebugLevel;
sData.bSilent            = pPATR_io->bSilent;
sData.bShowWarnings      = pPATR_io->bShowWarnings;
sData.pLogFP             = pPATR_io->pLogFP;
sData.uiLineNumber       = 1;
sData.iNextTokenType     = 0;
sData.iGrammarErrorCount = 0;
sData.psz0               = NULL;
sData.bStoredPeriod      = FALSE;
sData.eTokenizeMode      = kNormalToken;
sData.pszReservedChars   = szReservedChars_m;
sData.iNextPartialId     = 0;

if (getNextToken(szToken, MAX_TOKEN_SIZE, &sData) == EOF)
	{
	/*
	 *  If file empty, give invalid grammar message
	 */
	displayNumberedMessage(&sEmptyGrammarFile_m,
			   sData.bSilent, sData.bShowWarnings, sData.pLogFP,
			   NULL, 0, pszFilename_in);
	fclose( sData.pGrammarFP );
	sData.pGrammarFP = (FILE *)NULL;
	return 0;
	}
/*
 * Initialize grammar structures
 */
markPATRGarbage(PATR_GARBAGE_GRAMMAR + pPATR_io->iGrammarSelection, pPATR_io);
pFunc = pfOutOfMemory_g;
pfOutOfMemory_g = grammar_too_big;
if (setjmp(sOutOfMemory_m))
	{
	/*
	 *  restore original error handler for memory allocation
	 */
	pfOutOfMemory_g = pFunc;
	collectPATRGarbage(PATR_GARBAGE_GRAMMAR + pPATR_io->iGrammarSelection,
			   pPATR_io);
	return 0;
	}
temp_gram.pDefinitionTable = (PATRDefinition *)NULL;
temp_gram.pRuleTable       = (PATRRuleList *)NULL;
initPATRHashTables(&sParseData);
savePATRHashTables(&sParseData, &temp_gram);
temp_gram.pszStartSymbol   = (char *)NULL;
temp_gram.pszCatFeatName   = (char *)NULL;
temp_gram.pszLexFeatName   = (char *)NULL;
temp_gram.pszGlossFeatName = (char *)NULL;
#ifndef hab130
temp_gram.pszRootGlossFeatName = (char *)NULL;
#endif /* hab130 */
temp_gram.pRestrictors     = (PATRPathList *)NULL;
temp_gram.pAttributeOrder  = (StringList *)NULL;
temp_gram.apPriorityUnions = (PATRPriorityUnion **)NULL;
temp_gram.apConstraints    = (PATRConstraint **)NULL;

sData.pPATR      = pPATR_io;
sData.pGrammar   = &temp_gram;
sData.pParseData = &sParseData;
sParseData.pPATR = pPATR_io;

if (pPATR_io->pszGrammarFile != NULL)
	{
	freeMemory((void *)pPATR_io->pszGrammarFile);
	pPATR_io->pszGrammarFile = NULL;
	}
/*
 *  read the grammar file
 */
bInComment = FALSE;
uiGrammarItems = 0L;
reportProgress( uiGrammarItems );
while ((iTokenType = getToken(szToken, MAX_TOKEN_SIZE, &sData)) != EOF)
	{
	if (    (strcasecmp(szToken, "end") == 0) ||
		(strcasecmp(szToken, "\\end") == 0))
	break;				/* soft EOF */
	if (bCancelPATROperation_g)
	{
	fclose( sData.pGrammarFP );
	sData.pGrammarFP = (FILE *)NULL;
	/*
	 *  restore original error handler for memory allocation
	 */
	pfOutOfMemory_g = pFunc;
	collectPATRGarbage(PATR_GARBAGE_GRAMMAR + pPATR_io->iGrammarSelection,
			   pPATR_io);
	return 0;			/* If cancelled, quit */
	}
	++uiGrammarItems;
	if ((uiGrammarItems % 10) == 0)
	reportProgress( uiGrammarItems );

	if (    (strcasecmp(szToken, "let") == 0) ||
		(strcasecmp(szToken, "\\let") == 0) )
	{
	bInComment = FALSE;
	if (loadTemplate(&sData) == 0)
		{
		++sData.iGrammarErrorCount;
		}
	}
	else if ((strcasecmp(szToken, "parameter") == 0) ||
		 (strcasecmp(szToken, "\\parameter") == 0) )
	{
	bInComment = FALSE;
	if (loadParameter(&sData) == 0)
		{
		++sData.iGrammarErrorCount;
		}
	}
	else if ((strcasecmp(szToken, "define") == 0) ||
		 (strcasecmp(szToken, "\\define") == 0) )
	{
	bInComment = FALSE;
	if (loadLexicalRule(&sData) == 0)
		{
		++sData.iGrammarErrorCount;
		}
	}
	else if ((strcasecmp(szToken, "constraint") == 0) ||
		 (strcasecmp(szToken, "\\constraint") == 0) )
	{
	bInComment = FALSE;
	if (loadConstraint(&sData) == 0)
		{
		++sData.iGrammarErrorCount;
		}
	}
	else if ((strcasecmp(szToken, "rule") == 0) ||
		 (strcasecmp(szToken, "\\rule") == 0) )
	{
	bInComment = FALSE;
	if (loadRule(&sData) == 0)
		{
		++sData.iGrammarErrorCount;
		}
	}
	else if ((strcasecmp(szToken, "lexicon") == 0) ||
		 (strcasecmp(szToken, "\\lexicon") == 0) ||
		 (strcasecmp(szToken, "word") == 0) ||
		 (strcasecmp(szToken, "\\word") == 0) )
	{			/* be compatible with Shieber's grammars */
	bInComment = FALSE;
	do
		{
		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, &sData);
		} while ((iTokenType != EOF) && (strcmp(szToken,szPeriod_m) != 0));
	}
	else if ((strcasecmp(szToken, "comment") == 0) ||
		 (strcasecmp(szToken, "\\comment") == 0) ||
		 (strcasecmp(szToken, "\\co") == 0) )
	{
	bInComment = TRUE;
	skipToEndOfLine(&sData);
	}
	else if (!bInComment)
	{
	displayNumberedMessage(&sInvalidDeclarationType_m,
				   sData.bSilent, sData.bShowWarnings,
				   sData.pLogFP,
				   sData.pszGrammarFilename, sData.uiLineNumber,
				   szToken);
	++sData.iGrammarErrorCount;
	skipToEndOfLine(&sData);
	}
	free_SimplePSR(&sData);
	free_ComplexPSR(&sData);
	free_symlist(&sData);
	}
fclose( sData.pGrammarFP );
sData.pGrammarFP = (FILE *)NULL;
if (pPATR_io->iDebugLevel >= 4)
	{
	/*
	 *  Show the defined templates and rules
	 */
	showPATRDefinitions( &temp_gram, pPATR_io );
	showRules( &temp_gram, pPATR_io );
	}
if (pPATR_io->iDebugLevel >= 5)
	{
	/*
	 *  Show the stored strings
	 */
	showPATRStrings(pPATR_io);
	}
/*
 *  verify the Start symbol
 */
if (temp_gram.pRuleTable != (PATRRuleList *)NULL)
	{
	if (temp_gram.pszStartSymbol != NULL)
	{
	for ( rlp = temp_gram.pRuleTable ; rlp ; rlp = rlp->pNext )
		{
		if (strcmp(rlp->pRule->apszNonterms[0], temp_gram.pszStartSymbol)
									  == 0)
		break;
		}
	if (rlp == NULL)
		{
		++sData.iGrammarErrorCount;
		displayNumberedMessage(&sBadStartSymbol_m,
				   sData.bSilent, sData.bShowWarnings,
				   sData.pLogFP,
				   sData.pszGrammarFilename, 0,
				   temp_gram.pszStartSymbol);
		}
	}
	else
	{
	for ( rlp = temp_gram.pRuleTable ; rlp->pNext ; rlp = rlp->pNext )
		;
	temp_gram.pszStartSymbol = storedPATRString(
						   rlp->pRule->apszNonterms[0],
						   pPATR_io);
	}
	}
/*
 *  set return value corresponding to whether found rules or not
 */
if (temp_gram.pRuleTable == (PATRRuleList *)NULL)
	{
	displayNumberedMessage(&sNoRulesFound_m,
			   sData.bSilent, sData.bShowWarnings, sData.pLogFP,
			   sData.pszGrammarFilename, 0);
	++sData.iGrammarErrorCount;
	}
if (sData.iGrammarErrorCount != 0)
	{
	/*
	 *  restore original error handler for memory allocation
	 */
	pfOutOfMemory_g = pFunc;
	collectPATRGarbage(PATR_GARBAGE_GRAMMAR + pPATR_io->iGrammarSelection,
			   pPATR_io);
	return 0;
	}
if (temp_gram.pszCatFeatName == NULL)
	temp_gram.pszCatFeatName = storedPATRString("cat", pPATR_io);
if (temp_gram.pszLexFeatName == NULL)
	temp_gram.pszLexFeatName = storedPATRString("lex", pPATR_io);
if (temp_gram.pszGlossFeatName == NULL)
	temp_gram.pszGlossFeatName = storedPATRString("gloss", pPATR_io);
#ifndef hab130
if (temp_gram.pszRootGlossFeatName == NULL)
	temp_gram.pszRootGlossFeatName = storedPATRString("rootgloss", pPATR_io);
#endif /* hab130 */
/*
 *  copy the grammar values into a dynamically allocated data structure
 */
gram = (PATRGrammar *)allocMemory(sizeof(PATRGrammar));
gram->pDefinitionTable = temp_gram.pDefinitionTable;
gram->pRuleTable       = temp_gram.pRuleTable;
gram->pszStartSymbol   = temp_gram.pszStartSymbol;
gram->pszCatFeatName   = temp_gram.pszCatFeatName;
gram->pszLexFeatName   = temp_gram.pszLexFeatName;
gram->pszGlossFeatName = temp_gram.pszGlossFeatName;
#ifndef hab130
gram->pszRootGlossFeatName = temp_gram.pszRootGlossFeatName;
#endif /* hab130 */
gram->pRestrictors     = temp_gram.pRestrictors;
gram->pAttributeOrder  = temp_gram.pAttributeOrder;
gram->apPriorityUnions = temp_gram.apPriorityUnions;
gram->apConstraints    = temp_gram.apConstraints;
savePATRHashTables(&sParseData, gram);
if (pPATR_io->iDebugLevel >= 4)
	showHashTables(gram);

pPATR_io->pGrammar       = gram;
pPATR_io->pszGrammarFile = duplicateString(pszFilename_in);
/*
 *  restore original error handler for memory allocation
 */
pfOutOfMemory_g = pFunc;

return 1;
}

/*----------------------------------------------------------------------------
 * NAME
 *    loadTemplate
 * DESCRIPTION
 *    Load one "Let" template from the grammar file
 * RETURN VALUE
 *    TRUE if successful, FALSE if error
 */
static int loadTemplate(pData)
GrammarData * pData;
{
char			szToken[MAX_TOKEN_SIZE+1];
int			iTokenType;
char			szNextToken[MAX_TOKEN_SIZE+1];
int			iNextTokenType;
PATRDefinition *	pDef;		/* temporary Definition struct */
PATRFeature *		pTmpFeat;	/* temporary Feature struct */
PATRFeatureDisjunction * pAlts;		/* list of alternative feature
					   structures */
/*
 *  Get the template name
 */
iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
if ((iTokenType != SYMBOL_TOKEN) && (iTokenType != KEYWORD_TOKEN))
	{
	displayNumberedMessage(&sBadGrammarDeclaration_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Let", "", "identifier");
	return ( FALSE );                   /* Error exit */
	}
/*
 *  Get next token ("be")
 */
iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
if (strcasecmp(szNextToken, "be") != 0)
	{
	displayNumberedMessage(&sBadGrammarDeclaration_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Let", szToken, "be");
	return ( FALSE );			/* Error exit */
	}
pDef = newTemplate(szToken, pData); /* Make new Definition */
getToken(szToken, MAX_TOKEN_SIZE, pData);	/* skip next token ("be") */

while ((iNextTokenType=getNextToken(szNextToken,MAX_TOKEN_SIZE,pData)) != EOF)
	{
	if (iNextTokenType == KEYWORD_TOKEN)
	break;
	if (pDef == NULL)
	continue;
	if (strcmp(szNextToken, ".") == 0)
	{
	iTokenType = getToken(szNextToken, MAX_TOKEN_SIZE, pData);
	break;
	}

	pTmpFeat = NULL;				/* initialize */
	pAlts = pData->pEmbeddedAlts = NULL;
	if (iNextTokenType == '<')			/* If path */
	{					/* Get feature path */
	pTmpFeat = read_formula(TRUE, NULL, pData);
	}
	else if (iNextTokenType == '[')		/* Else if fs */
	{					/* Get fs */
	init_current_path(pData);
	pTmpFeat = read_feat_struct(pData);
	init_current_path(pData);
	}
	else if (iNextTokenType == '{')		/* read disjunction */
	{
	pAlts = read_disjunction(pData);
	}
	else if ((pAlts = findPATRTemplate(szNextToken,
					   pData->pGrammar, pData->pPATR)) != NULL)
	{				/* Else if template, move on */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	}
	else
	{
	/*
	 *  else (not template), move to next token and complain
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	displayNumberedMessage(&sNotDefinedByLet_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber,
				   szToken);
	}
	/*
	 *  We're done processing a term:
	 *  Now unify it with each of the alternatives of pDef
	 */
	if (pAlts != NULL)
	{
	/*
	 *  there were top-level alternatives, so unify new fs in
	 */
	if (!unify_template_alts(pDef, pAlts, pData))
		{					/* If fail, give message */
		displayNumberedMessage(&sIncompatiblePaths_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber,
				   pDef->pszName);
		return( FALSE );			/* Error exit */
		}
	}
	else if (pTmpFeat)
	{
	pAlts = createPATRFeatureDisjunction( pTmpFeat, pData->pPATR );
	if (	!unify_template_alts(pDef, pAlts, pData) ||
		(   pData->pEmbeddedAlts &&
			!unify_template_alts(pDef, pData->pEmbeddedAlts, pData) ) )
		{                               /* If fail, give message */
		displayNumberedMessage(&sIncompatiblePaths_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber,
				   pDef->pszName);
		return ( FALSE );                   /* Error exit */
		}
	}
	} /* end one template */
return ( TRUE );                        /* Return success */
}

/*----------------------------------------------------------------------------
 * NAME
 *    loadParameter
 * DESCRIPTION
 *    Load one parameter value from the grammar file
 * RETURN VALUE
 *    TRUE if successful, FALSE if error
 */
static int loadParameter(pData)
GrammarData * pData;
{
char		szToken[MAX_TOKEN_SIZE+1];
int		iTokenType;
char		szKeyword[MAX_TOKEN_SIZE+1];
char		szQualifier[MAX_TOKEN_SIZE+1];
char		szFunction[MAX_TOKEN_SIZE+1];
StringList *	pPath;
StringList *	pPathTail;
PATRPathList *	pRestrict;
PATRPathList *	pRestrictTail;
StringList *	pOrder;
StringList *	pOrderTail;
/*
 *  Parameter: Start symbol is XXX.
 *  Parameter: Restrictor is <XXX> <YYY ZZZ>.
 *  Parameter: Attribute order is XXX YYY ZZZ.
 *  Parameter: Translation at <XXX YYY>.	???
 *  Parameter: Category feature is XXX.
 *  Parameter: Lexical feature is XXX.
 *  Parameter: Gloss feature is XXX.
 */
/*
 *  Get the parameter name
 */
iTokenType = getToken(szKeyword, MAX_TOKEN_SIZE, pData);
if (iTokenType == ':')
	getToken(szKeyword, MAX_TOKEN_SIZE, pData);
/*
 *  Get the parameter qualifier
 */
getToken(szQualifier, MAX_TOKEN_SIZE, pData);
szFunction[0] = NUL;
if (	(strcasecmp(szKeyword,   "start")  == 0) &&
	(strcasecmp(szQualifier, "symbol") == 0) )
	{
	/*
	 *  Get the function word ("is")
	 */
	getToken(szFunction, MAX_TOKEN_SIZE, pData);
	if (strcasecmp(szFunction, "is") != 0)
	goto bad_parameter;
	/*
	 *  Get the Start symbol and store it
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	pData->pGrammar->pszStartSymbol = storedPATRString( szToken, pData->pPATR);
	iTokenType = getNextToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType == '.')
	getToken(szToken, MAX_TOKEN_SIZE, pData);  /* skip terminating . */
	}
else if (strcasecmp(szKeyword, "restrictor") == 0)
	{
	if (strcasecmp(szQualifier, "is") != 0)
	goto bad_parameter;
	pData->pGrammar->pRestrictors = (PATRPathList *)NULL;
	pRestrictTail       = (PATRPathList *)NULL;
	while ((iTokenType = getNextToken(szToken, MAX_TOKEN_SIZE, pData)) != EOF)
	{
	if (iTokenType == '.')
		{
		getToken(szToken, MAX_TOKEN_SIZE, pData);
		break;
		}
	if (iTokenType != '<')
		break;
	getToken(szToken, MAX_TOKEN_SIZE, pData);
	pRestrict = (PATRPathList *)allocMemory( sizeof(PATRPathList) );
	pRestrict->pNext = (PATRPathList *)NULL;
	pRestrict->pPath = (StringList *)NULL;
	pPathTail        = (StringList *)NULL;
	for (;;)
		{
		/*
		 *  Get next token
		 */
		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
		if ((iTokenType == EOF) || (iTokenType == '>'))
		break;
		pPath = (StringList *)allocMemory( sizeof(StringList) );
		pPath->pszString = storedPATRString( szToken, pData->pPATR);
		pPath->pNext     = NULL;
		if (pPathTail == NULL)
		pRestrict->pPath = pPath;
		else
		pPathTail->pNext = pPath;
		pPathTail = pPath;
		}
	if (pRestrict->pPath == (StringList *)NULL)
		{
		freeMemory( pRestrict );
		displayNumberedMessage(&sEmptyPath_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP, pData->pszGrammarFilename,
				   pData->uiLineNumber,
				   "Parameter:Restrictoris...");
		}
	else if (pRestrictTail == (PATRPathList *)NULL)
		pData->pGrammar->pRestrictors = pRestrict;
	else
		pRestrictTail->pNext = pRestrict;
	pRestrictTail = pRestrict;
	}
	}
else if ((strcasecmp(szKeyword, "attribute") == 0) &&
	 (strcasecmp(szQualifier, "order") == 0) )
	{
	/*
	 *  Get the function word ("is")
	 */
	getToken(szFunction, MAX_TOKEN_SIZE, pData);
	if (strcasecmp(szFunction, "is") != 0)
	goto bad_parameter;
	pData->pGrammar->pAttributeOrder = (StringList *)NULL;
	pOrderTail             = (StringList *)NULL;
	while ((iTokenType = getNextToken(szToken, MAX_TOKEN_SIZE, pData)) != EOF)
	{
	if (iTokenType == '.')
		{
		getToken(szToken, MAX_TOKEN_SIZE, pData);
		break;
		}
	if (iTokenType == KEYWORD_TOKEN)
		break;
	/*
	 *  Get next token
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	pOrder = (StringList *)allocMemory( sizeof(StringList) );
	pOrder->pszString = storedPATRString(szToken, pData->pPATR);
	pOrder->pNext     = NULL;
	if (pOrderTail == NULL)
		pData->pGrammar->pAttributeOrder = pOrder;
	else
		pOrderTail->pNext = pOrder;
	pOrderTail = pOrder;
	}
	}
else if (strcasecmp(szKeyword, "translation") == 0)
	{
	if (strcasecmp(szQualifier, "at") != 0)
	goto bad_parameter;
	do
	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	} while ((iTokenType != EOF) && (iTokenType != '.'));
	}
else if ((strcasecmp(szKeyword,   "category") == 0) &&
	 (strcasecmp(szQualifier, "feature")  == 0) )
	{
	/*
	 *  Get the function word ("is")
	 */
	getToken(szFunction, MAX_TOKEN_SIZE, pData);
	if (strcasecmp(szFunction, "is") != 0)
	goto bad_parameter;
	/*
	 *  Get the Category feature name and store it
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	pData->pGrammar->pszCatFeatName = storedPATRString(szToken, pData->pPATR);
	iTokenType = getNextToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType == '.')
	getToken(szToken, MAX_TOKEN_SIZE, pData);      /* skip terminating . */
	}
else if ((strcasecmp(szKeyword,   "lexical") == 0) &&
	 (strcasecmp(szQualifier, "feature") == 0) )
	{
	/*
	 *  Get the function word ("is")
	 */
	getToken(szFunction, MAX_TOKEN_SIZE, pData);
	if (strcasecmp(szFunction, "is") != 0)
	goto bad_parameter;
	/*
	 *  Get the Lexical feature name and store it
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	pData->pGrammar->pszLexFeatName = storedPATRString(szToken, pData->pPATR);
	iTokenType = getNextToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType == '.')
	getToken(szToken, MAX_TOKEN_SIZE, pData); /* skip terminating . */
	}
else if ((strcasecmp(szKeyword,   "gloss")   == 0) &&
	 (strcasecmp(szQualifier, "feature") == 0) )
	{
	/*
	 *  Get the function word ("is")
	 */
	getToken(szFunction, MAX_TOKEN_SIZE, pData);
	if (strcasecmp(szFunction, "is") != 0)
	goto bad_parameter;
	/*
	 *  Get the Gloss feature name and store it
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	pData->pGrammar->pszGlossFeatName = storedPATRString(szToken,
							 pData->pPATR);
	iTokenType = getNextToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType == '.')
	getToken(szToken, MAX_TOKEN_SIZE, pData);      /* skip terminating . */
	}
#ifndef hab130
else if ((strcasecmp(szKeyword,   "rootgloss") == 0) &&
	 (strcasecmp(szQualifier, "feature")   == 0) )
	{
	/*
	 *  Get the function word ("is")
	 */
	getToken(szFunction, MAX_TOKEN_SIZE, pData);
	if (strcasecmp(szFunction, "is") != 0)
	goto bad_parameter;
	/*
	 *  Get the Root Gloss feature name and store it
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	pData->pGrammar->pszRootGlossFeatName = storedPATRString(szToken,
								 pData->pPATR);
	iTokenType = getNextToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType == '.')
	getToken(szToken, MAX_TOKEN_SIZE, pData);      /* skip terminating . */
	}
#endif /* hab130 */
else
	{
bad_parameter:
	getNextToken(szToken, MAX_TOKEN_SIZE, pData);
	displayNumberedMessage(&sBadParameter_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   szKeyword, szQualifier, szFunction, szToken);
	return( FALSE );		/* Return failure */
	}
return( TRUE );			/* Return success */
}

/*----------------------------------------------------------------------------
 * NAME
 *    loadLexicalRule
 * DESCRIPTION
 *    Load one lexical rule from file
 * RETURN VALUE
 *    one if successful, or zero if error
 */
static int loadLexicalRule(pData)
GrammarData * pData;
{
char		  szToken[MAX_TOKEN_SIZE+1];
int		  iTokenType;
char		  szNextToken[MAX_TOKEN_SIZE+1];
int		  iNextTokenType;
PATRDefinition *  pDef;
PATRLexicalRule * pLexRule;
PATRLexicalRule * pLexRulePrev;
PATRFeature *	  pFeat;
PATRFeature *	  pFeatPrev;
/*
 *  Define Name as <out a> = <in a>
 *		   <out b> = <in b c>
 *		   <out d> = <in d>
 *		   <out d e> => f
 */
/*
 *  Get the name of the lexical rule
 */
iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
if ((iTokenType != SYMBOL_TOKEN) && (iTokenType != KEYWORD_TOKEN))
	{
	displayNumberedMessage(&sBadGrammarDeclaration_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Define", "", "identifier");
	return ( FALSE );                   /* Error exit */
	}
/*
 *  Get next token ("as")
 */
iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
if (strcasecmp(szNextToken, "as") != 0)
	{
	displayNumberedMessage(&sBadGrammarDeclaration_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Define", szToken, "as");
	return ( FALSE );			/* Error exit */
	}
pDef = newLexicalRule( szToken, pData );	/* Make new Definition */
getToken(szToken, MAX_TOKEN_SIZE, pData);	/* skip next token ("as") */

pLexRulePrev = (PATRLexicalRule *)NULL;
while ((iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData)) !=
	   EOF)
	{
	if (iNextTokenType == KEYWORD_TOKEN)
	break;
	if (pDef == NULL)
	continue;

	pLexRule = (PATRLexicalRule *)NULL;
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if (strcmp(szToken, ".") == 0)
	break;
	if (iTokenType != '<')
	{
bad_definition:
	displayNumberedMessage(&sInvalidLexicalRule_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber,
				   pDef->pszName, szToken);
	break;
	}
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if (strcmp(szToken, "out") != 0)
	goto bad_definition;
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if ((iTokenType != SYMBOL_TOKEN) && (iTokenType != KEYWORD_TOKEN))
	goto bad_definition;
	pLexRule = (PATRLexicalRule *)allocMemory(sizeof(PATRLexicalRule));
	pLexRule->pInFeat  = (PATRFeature *)NULL;
	pLexRule->pOutFeat = (PATRFeature *)NULL;
	pLexRule->pNext    = (PATRLexicalRule *)NULL;
	pFeatPrev = (PATRFeature *)NULL;
	do
	{
	pFeat = (PATRFeature *)allocMemory(sizeof(PATRFeature));
	pFeat->eType = PATR_COMPLEX;
	pFeat->u.pComplex = (PATRComplexFeature *)allocMemory(
						  sizeof(PATRComplexFeature));
	pFeat->u.pComplex->pszLabel = storedPATRString(szToken, pData->pPATR);
	pFeat->u.pComplex->pValue   = (PATRFeature *)NULL;
	pFeat->u.pComplex->pNext    = (PATRComplexFeature *)NULL;
	if (pLexRule->pOutFeat == (PATRFeature *)NULL)
		pLexRule->pOutFeat = pFeat;
	else
		pFeatPrev->u.pComplex->pValue = pFeat;
	pFeatPrev = pFeat;

	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	} while ((iTokenType == SYMBOL_TOKEN) ||
		 (iTokenType == KEYWORD_TOKEN));
	if (iTokenType != '>')
	goto bad_definition;

	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType == '=')
	pLexRule->bReplace = FALSE;
	else if (iTokenType == REPLACE_TOKEN)
	pLexRule->bReplace = TRUE;
	else
	goto bad_definition;

	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType == '<')
	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if (strcmp(szToken, "in") != 0)
		goto bad_definition;
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if ((iTokenType != SYMBOL_TOKEN) && (iTokenType != KEYWORD_TOKEN))
		goto bad_definition;
	pFeatPrev = (PATRFeature *)NULL;
	do
		{
		pFeat = (PATRFeature *)allocMemory(sizeof(PATRFeature));
		pFeat->eType = PATR_COMPLEX;
		pFeat->u.pComplex = (PATRComplexFeature *)allocMemory(
						  sizeof(PATRComplexFeature));
		pFeat->u.pComplex->pszLabel = storedPATRString(szToken,
							 pData->pPATR);
		pFeat->u.pComplex->pValue   = (PATRFeature *)NULL;
		pFeat->u.pComplex->pNext    = (PATRComplexFeature *)NULL;
		if (pLexRule->pInFeat == (PATRFeature *)NULL)
		pLexRule->pInFeat = pFeat;
		else
		pFeatPrev->u.pComplex->pValue = pFeat;
		pFeatPrev = pFeat;

		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
		} while ((iTokenType == SYMBOL_TOKEN) ||
			 (iTokenType == KEYWORD_TOKEN));
	if (iTokenType != '>')
		goto bad_definition;
	}
	else if ((iTokenType == SYMBOL_TOKEN) || (iTokenType == KEYWORD_TOKEN))
	{
	pLexRule->pInFeat = (PATRFeature *)allocMemory(sizeof(PATRFeature));
	pLexRule->pInFeat->eType     = PATR_ATOM;
	pLexRule->pInFeat->u.pszAtom = storedPATRString(szToken, pData->pPATR);
	}
	else if (iTokenType == '[')
	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType != ']')
		goto bad_definition;
	pLexRule->pInFeat = (PATRFeature *)allocMemory(sizeof(PATRFeature));
	pLexRule->pInFeat->eType     = PATR_NULLFS;
	pLexRule->pInFeat->u.pszAtom = NULL;
	}
	else
	goto bad_definition;

	if (pDef->u.pLexRule == (PATRLexicalRule *)NULL)
	pDef->u.pLexRule = pLexRule;
	else
	pLexRulePrev->pNext = pLexRule;
	pLexRulePrev = pLexRule;
	}
return TRUE;
}

/*****************************************************************************
 * NAME
 *    loadRule
 * DESCRIPTION
 *    Load one PS rule from file, along with its feature constraints
 * RETURN VALUE
 *    one if successful, or zero if error
 */
static int loadRule(pData)
GrammarData * pData;
{
char		szToken[MAX_TOKEN_SIZE+1];	/* Token from grammar */
int		iTokenType;
char		szNextToken[MAX_TOKEN_SIZE+1];
int		iNextTokenType;
char *		p;
ComplexPSR *	firstelm;	/* First formula element */
ComplexPSR *	lastelm;	/* Last formula element */
PATRFeature *	pTempFeat;	/* Temporary feature structure */
SimplePSR *	psrs;		/* simple PSRs corresponding to complex PSR */
SimplePSR *	psr;
int		feature_used;
char		szRuleID[MAX_TOKEN_SIZE+1];
int		iDisjunctionLevel;
int		i;
int		bPriorityUnionRecent;
int		bLogicalConstraintRecent;
PATRFeature *		pLHS;
PATRPriorityUnion *	pPriorityUnions = NULL;
StringList *		pLeftPath       = NULL;
PATRConstraint *	pConstraints    = NULL;
char			szErrMsgBuff[128];
PATRFeatureDisjunction *	pDisj;
PATRFeatureDisjunction *	pNextDisj;
/*
 *  Get the rule left identifier
 */
memset(szRuleID, 0, MAX_TOKEN_SIZE+1);
iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
if (iTokenType == '{')
	{
	/*
	 *  read the rule's identifier string
	 */
	readRuleID( szRuleID, MAX_TOKEN_SIZE, pData );
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	}
if (	(iTokenType == EOF) ||
	(strchr(pData->pszReservedChars, iTokenType) != NULL))
	{
	displayNumberedMessage(&sBadGrammarDeclaration_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Rule", "", "leftsideidentifier");
	return( 0 );			/* Error exit */
	}
/*
 *  Get next token ("=")
 */
iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
if ((iNextTokenType != '=') && (strcmp(szNextToken, "->") != 0))
	{
	displayNumberedMessage(&sBadGrammarDeclaration_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Rule", szToken, "=");
	return( 0 );			/* Error exit */
	}
					/* clear features for this formula */
pData->pGramFeat = createPATRNullFeature(pData->pPATR);
strcpy( pData->szPsrLhsSymbol, szToken );	/* Save formula symbol */
pData->pIndexedLeftSymbol = allocPATRStringCopy( pData->szPsrLhsSymbol,
						 pData->pPATR );
p = strchr(pData->szPsrLhsSymbol, '_');	/* Check for underline */
if (p != NULL)
	*p = NUL;
						/* Put formula symbol first */
firstelm = makeform(pData->szPsrLhsSymbol, (char *)NULL, (ComplexPSR *)NULL,
			pData);
lastelm = firstelm;				/* Set last to it */
						/* Add open brace at start */
lastelm = makeform( "{", NULL, lastelm, pData );
psrs = NULL;
free_symlist(pData);				/* Free the symbol list */
/*
 *  Add cat feature, unless pData->szPsrLhsSymbol is "X" (BK)
 */
if (strcmp( pData->szPsrLhsSymbol, "X" ) != 0)
	{
	pTempFeat = createPATRNullFeature(pData->pPATR);
	if (pData->pGrammar->pszCatFeatName == NULL)
	pData->pGrammar->pszCatFeatName = storedPATRString("cat",
							   pData->pPATR);
	addPATRFeatureToComplex(pTempFeat,
		createPATRComplexFeature(pData->pGrammar->pszCatFeatName,
					 createPATRAtomFeature(
					storedPATRString(pData->szPsrLhsSymbol,
							 pData->pPATR),
					pData->pPATR),
					 pData->pPATR));
	if (pData->psz0 == NULL)
	pData->psz0 = storedPATRString("0", pData->pPATR);
	addPATRFeatureToComplex(pData->pGramFeat,
				createPATRComplexFeature( pData->psz0, pTempFeat,
							  pData->pPATR ) );
	}
if (p != NULL)
	*p = '_';					/* restore the underline */
/*
 *  skip next token ("=")
 */
getToken(szToken, MAX_TOKEN_SIZE, pData);
/*
 *  read the context-free Phrase Structure Rule
 */
pData->pszReservedChars = szReservedCharsWithSlash_m;
while ((iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData))
	   != EOF)
	{
	if (    (iNextTokenType == '.') ||
		(iNextTokenType == '<') ||
		(iNextTokenType == KEYWORD_TOKEN) )
	break;
	if (iNextTokenType == ':')
	{
	getToken(szToken, MAX_TOKEN_SIZE, pData);
	break;			/* skip colon at end of PS Rule */
	}
	/*
	 *  Get next token
	 */
	iTokenType     = getToken(szToken, MAX_TOKEN_SIZE, pData);
	iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
	if (strchr(pData->pszReservedChars, iTokenType) != NULL)
	{
	/*
	 *  If not symbol, make formula element
	 */
	lastelm = makeform(szToken, (char *)NULL, lastelm, pData );
	}
	else
	{
	/*
	 *  else (symbol), add token to symbol list and make formula element
	 */
	add_to_symlist( szToken, pData );
	lastelm = makeform( in_symlist(szToken, pData),
				pData->pIndexedLeftSymbol,
				lastelm, pData );
	}
	}
/*
 *  Finish phrase structure rule by adding the close brace, and
 *  initialize unification features for each psr
 */
lastelm = makeform("}", (char *)NULL, lastelm, pData);
psrs = form_to_psrs(firstelm, pData);
for ( psr = psrs ; psr ; psr = psr->pNext )
	{
	checkForRepeated( psr, pData );
	psr->pFeatures[0] = (PATRFeatureDisjunction *)allocMemory(
						   sizeof(PATRFeatureDisjunction));
	psr->pFeatures[0]->pFeature = copyPATRFeature( pData->pGramFeat,
						   pData->pPATR );
	psr->pFeatures[0]->pNext = NULL;
	psr->pFeatureTails[0]   = NULL;
	}
if (pData->pPATR->iDebugLevel >= 5)
	{
	fprintf(stdout,  "\nSimplePSRs for %s: %p\n", firstelm->pszName, (void *)psrs );
	show_psrs( psrs );
	}
/*
 *  read the unifications for this rule
 */
iDisjunctionLevel = 0;
bPriorityUnionRecent     = FALSE;
bLogicalConstraintRecent = FALSE;
while ((iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData)) !=
	   EOF)
	{
	if (iNextTokenType == '.')
	{
	getToken(szToken, MAX_TOKEN_SIZE, pData);
	break;
	}
	else if (iNextTokenType == KEYWORD_TOKEN)
	break;
	/*
	 *  Get next token
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if ( iTokenType == '<' )
	{
	/*
	 *  if start of path formula, set symbol to change to zero
	 */
	pData->pLeftSymbol = pData->szPsrLhsSymbol;
	/* Read the structure */
	pTempFeat = read_formula(FALSE, &pLHS, pData);
	if (pTempFeat == NULL)
		{
		if (pLHS == NULL)
		{
		sprintf(szErrMsgBuff, "%s: %u", __FILE__ , __LINE__);
		displayNumberedMessage(&sUnknownError_m,
					   pData->bSilent, pData->bShowWarnings,
					   pData->pLogFP,
					   pData->pszGrammarFilename,
					   pData->uiLineNumber,
					   szErrMsgBuff);
		continue;
		}
		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
		if (iDisjunctionLevel != 0)
		{
		if (iTokenType == PRIORITYUNION_TOKEN)
			{
			displayNumberedMessage(&sNoDisjunctPriorityUnion_m,
					   pData->bSilent,
					   pData->bShowWarnings,
					   pData->pLogFP,
					   pData->pszGrammarFilename,
					   pData->uiLineNumber, "");
			}
		else if (iTokenType == CONSTRAINT_TOKEN)
			{
			displayNumberedMessage(&sNoDisjunctConstraint_m,
					   pData->bSilent,
					   pData->bShowWarnings,
					   pData->pLogFP,
					   pData->pszGrammarFilename,
					   pData->uiLineNumber, "");
			}
		else
			{
			sprintf(szErrMsgBuff, "%s: %u", __FILE__ , __LINE__);
unknown_error:	    displayNumberedMessage(&sUnknownError_m,
					   pData->bSilent,
					   pData->bShowWarnings,
					   pData->pLogFP,
					   pData->pszGrammarFilename,
					   pData->uiLineNumber, szErrMsgBuff);
			}
		do  {
			iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE,
						  pData);
			} while (iNextTokenType != KEYWORD_TOKEN);
		break;
		}
		pLeftPath = copy_path( pData->pReadingPath, pData );
		switch (iTokenType)
		{
		case PRIORITYUNION_TOKEN:
			pPriorityUnions = loadPriorityUnion(pPriorityUnions,
							pLeftPath,
							pData);
			bPriorityUnionRecent     = TRUE;
			break;
		case CONSTRAINT_TOKEN:
			pConstraints = loadLogicalConstraint(pConstraints,
							 pLeftPath,
							 pData);
			bLogicalConstraintRecent = TRUE;
			break;
		default:
			sprintf(szErrMsgBuff, "%s: %u", __FILE__ , __LINE__);
			goto unknown_error;
		}
		continue;
		}
	/*
	 *  unify with previous features for each psr
	 */
	feature_used = 0;
	for ( psr = psrs ; psr ; psr = psr->pNext )
		{
		/*
		 *  fix features for empty rules (special case)
		 */
		if (featureMatchesPSR(pTempFeat, psr, pData))
		{
		/*
		 *  pTempFeat applies to this psr
		 */
		++feature_used;
		/*
		 *  add this unification formula to the rule's features
		 */
		for (	pDisj = psr->pFeatures[iDisjunctionLevel] ;
			pDisj != psr->pFeatureTails[iDisjunctionLevel] ;
			pDisj = pDisj->pNext )
			{
			if (pDisj == NULL)
			break;
			pDisj->pFeature = unifyPATRFeatures(pDisj->pFeature,
							pTempFeat,
							TRUE, pData->pPATR);
			if (pDisj->pFeature == NULL)
			{		/* If fail, give error and exit */
			displayNumberedMessage(&sFeaturesProduceFAIL_m,
						   pData->bSilent,
						   pData->bShowWarnings,
						   pData->pLogFP,
						   pData->pszGrammarFilename,
						   pData->uiLineNumber,
						   pData->szPsrLhsSymbol);
			pData->pGrammar->pRuleTable = NULL;
			goto abort_rule;
			}
			if (!verifyAcyclicPATRFeature(pDisj->pFeature))
			{
			displayNumberedMessage(&sFeaturesProduceCycle_m,
						   pData->bSilent,
						   pData->bShowWarnings,
						   pData->pLogFP,
						   pData->pszGrammarFilename,
						   pData->uiLineNumber,
						   pData->szPsrLhsSymbol);
			pData->pGrammar->pRuleTable = NULL;
			goto abort_rule;
			}
			}
		}
		}
	}
	else if ( iTokenType == '{' )
	{				/* If start of disjunction */
	++iDisjunctionLevel;
	if (iDisjunctionLevel > MAX_UNIFICATION_DISJUNCTION)
		{
		displayNumberedMessage(&sConstraintDisjunctTooNested_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP, pData->pszGrammarFilename,
				   pData->uiLineNumber,
				   MAX_UNIFICATION_DISJUNCTION);
		goto abort_rule;
		}
	for ( psr = psrs ; psr ; psr = psr->pNext )
		{
		psr->pFeatures[iDisjunctionLevel] = copyPartialDisjunction(
					   psr->pFeatures[iDisjunctionLevel-1],
					   psr->pFeatureTails[iDisjunctionLevel-1],
					   pData->pPATR);
		psr->pFeatureTails[iDisjunctionLevel] = NULL;
		}
	}
	else if (iTokenType == '/')
	{				/* If disjunction alternative */
	if (iDisjunctionLevel <= 0)
		{
		if (bPriorityUnionRecent)
		displayNumberedMessage(&sInvalidSlashPU_m, pData->bSilent,
					   pData->bShowWarnings, pData->pLogFP,
					   pData->pszGrammarFilename,
					   pData->uiLineNumber);
		else if (bLogicalConstraintRecent)
		displayNumberedMessage(&sInvalidSlashLC_m, pData->bSilent,
					   pData->bShowWarnings, pData->pLogFP,
					   pData->pszGrammarFilename,
					   pData->uiLineNumber);
		else
		displayNumberedMessage(&sInvalidSlash_m, pData->bSilent,
					   pData->bShowWarnings, pData->pLogFP,
					   pData->pszGrammarFilename,
					   pData->uiLineNumber);
		goto abort_rule;
		}
	for ( psr = psrs ; psr ; psr = psr->pNext )
		{
		psr->pFeatureTails[iDisjunctionLevel] =
					psr->pFeatures[iDisjunctionLevel];
		pNextDisj = copyPartialDisjunction(
				psr->pFeatures[iDisjunctionLevel-1],
				psr->pFeatureTails[iDisjunctionLevel-1],
				pData->pPATR);
		for ( pDisj = pNextDisj ; pDisj->pNext ; pDisj = pDisj->pNext )
		;
		pDisj->pNext = psr->pFeatures[iDisjunctionLevel];
		psr->pFeatures[iDisjunctionLevel] = pNextDisj;
		}
	}
	else if ( iTokenType == '}' )
	{				/* If end of disjunction */
	if (iDisjunctionLevel <= 0)
		{
		displayNumberedMessage(&sInvalidCloseBrace_m, pData->bSilent,
				   pData->bShowWarnings, pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber);
		goto abort_rule;
		}
	for ( psr = psrs ; psr ; psr = psr->pNext )
		{
		/*
		 *  Remove the previous level's disjunctions up to the indicated
		 *  tail, and move all of this level's disjunctions to the
		 *  previous level
		 */
		pNextDisj = NULL;
		for (   pDisj = psr->pFeatures[iDisjunctionLevel-1] ;
			pDisj != psr->pFeatureTails[iDisjunctionLevel-1] ;
			pDisj = pNextDisj )
		{
		if (pDisj == NULL)
			break;
		pNextDisj = pDisj->pNext;
		freeMemory( pDisj );
		}
		for (   pDisj = psr->pFeatures[iDisjunctionLevel] ;
			pDisj && pDisj->pNext ;
			pDisj = pDisj->pNext )
		;
		pDisj->pNext = pNextDisj;
		psr->pFeatures[iDisjunctionLevel-1] =
					   psr->pFeatures[iDisjunctionLevel];
		psr->pFeatures[iDisjunctionLevel]     = NULL;
		psr->pFeatureTails[iDisjunctionLevel] = NULL;
		}
	--iDisjunctionLevel;
	}
	else
	{
	displayNumberedMessage(&sInvalidConstraintSymbol_m, pData->bSilent,
				   pData->bShowWarnings, pData->pLogFP,
				   pData->pszGrammarFilename, pData->uiLineNumber,
				   szToken);
abort_rule:
	for ( psr = psrs ; psr ; psr = psr->pNext )
		{
		for ( i = 0 ; i <= iDisjunctionLevel ; ++i )
		{
		for (pDisj=psr->pFeatures[i] ; pDisj ; pDisj = pNextDisj)
			{
			pNextDisj = pDisj->pNext;
			freeMemory( pDisj );
			}
		}
		}
	pData->pszReservedChars = szReservedChars_m;
	if (pPriorityUnions != NULL)
		freePriorityUnions(pPriorityUnions, pData->pPATR);
	if (pConstraints != NULL)
		freeLogicalConstraints(pConstraints, pData->pPATR);
	/*
	 *  skip forward until the next keyword in the grammar file
	 */
	iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
	if ((iNextTokenType == EOF) || (iNextTokenType == KEYWORD_TOKEN))
		return 0;
	do  {
		iTokenType     = getToken(szToken, MAX_TOKEN_SIZE, pData);
		iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
		} while ((iNextTokenType != EOF) &&
			 (iNextTokenType != KEYWORD_TOKEN));
	return 0;
	}
	bPriorityUnionRecent     = FALSE;
	bLogicalConstraintRecent = FALSE;
	}
/*
 *  Install a rule for each element of psrs
 */
for ( psr = psrs ; psr ; psr = psr->pNext )
	{
	for ( pDisj = psr->pFeatures[0] ; pDisj ; pDisj = pNextDisj )
	{
	install_rule(szRuleID, firstelm->pszName, psr, pDisj->pFeature,
			 pPriorityUnions, pConstraints,
			 pData);
	pNextDisj = pDisj->pNext;
	freeMemory( pDisj );
	}
	}
pData->pszReservedChars = szReservedChars_m;
/*
 *  keep the collection of different priority union lists and constraint sets
 */
if (pPriorityUnions != NULL)
	storePriorityUnions(pPriorityUnions, pData->pGrammar);
if (pConstraints != NULL)
	storeLogicalConstraints(pConstraints, pData->pGrammar);
return( 1 );
}

/*****************************************************************************
 * NAME
 *    form_to_psrs
 * ARGUMENTS
 *    form  - ComplexPSR to convert
 *    pGrammar_in - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Convert formula to PS rules
 * RETURN VALUE
 *    Return pointer to resulting list of rules
 */
static SimplePSR * form_to_psrs(form, pData)
ComplexPSR *form;
GrammarData *	pData;
{
ComplexPSR *net;       /* Net pointer */
ComplexPSR *tnet;      /* Temporary net pointer */

if (pData->pPATR->iDebugLevel >= 5)	/* Show formula before compile */
	showComplexPSR( "debug (before compile):\n", form );

if ( !balcheck( form, pData ) )		/* Balance check on parens */
	return( NULL );			/* Return NULL if it fails */
/*
 *  Put braces inside all optional elements.
 */
for ( net = form->pNext; net->pNext; net = net->pNext ) /* For each element */
	{
	if ( *net->pszName == '(' )                /* Add { after ( */
		net = makeform( "{", NULL, net, pData );
	if ( *net->pNext->pszName == ')' )          /* Add } before ) */
		net = makeform( "}", NULL, net, pData );
	}

if (pData->pPATR->iDebugLevel >= 5)         /* Show formula after compile */
	{
	showComplexPSR( "debug (after compile):\n", form );
	fprintf(stdout,  "\n" );
	}
/*
 *  All formulas begin with form=LHS, and form->link="{",
 *  so skip the first symbol, and look for the closing "}"
 */
tnet = expand_psrs( form->pNext, "}", pData );
return( tnet->pPsrs );
}

/*****************************************************************************
 * NAME
 *    show_psrs
 * ARGUMENTS
 *    psrs - SimplePSR list to display
 * DESCRIPTION
 *    Display list of psrs for debugging
 * RETURN VALUE
 *    none
 */
static void show_psrs( psrs )
SimplePSR *psrs;
{
SimplePSR *psr;
PATRNonterminal *nterm;

for ( psr = psrs; psr; psr = psr->pNext )
	{      /* For each rule */
	fprintf(stdout,  "\n   " );
	/*
	 *  For each nonterm, output cat name */
	 for ( nterm = psr->pHead ; nterm ; nterm = nterm->pNext )
	 if (nterm->bOptional) {
		 fprintf(stdout,  "(%s/%s) ", nterm->pszName, nterm->pszLhsName );
	 } else {
		 fprintf(stdout,  "%s/%s ", nterm->pszName, nterm->pszLhsName );
	 }
	}
fprintf(stdout,  "\n" );
}

/*****************************************************************************
 * NAME
 *    showPATRRule
 * DESCRIPTION
 *    Print a grammar rule
 * RETURN VALUE
 *    none
 */
void showPATRRule(rulep)
PATRRule *	rulep;
{
int i;
PATRNonterminal *non_terminal = rulep->pRHS;

fprintf(stdout, "%s -> ", rulep->apszNonterms[0]);
for ( i = 1 ; i <= rulep->iNontermCount ; i++ )
	{
	if (non_terminal->bOptional) {
		fprintf(stdout, "(%s) ", rulep->apszNonterms[i]);
	} else {
		fprintf(stdout, "%s ", rulep->apszNonterms[i]);
	}
	non_terminal = non_terminal->pNext;
	}
fprintf(stdout, "\n");
}

/*****************************************************************************
 * NAME
 *    install_rule
 * ARGUMENTS
 *    id      - unique identifying string
 *    lhs     - LHS nonterminal
 *    rhs     - List of RHS nonterminals from expanded formula
 *    dag     - feature structure representing constraints on rule
 *    pGrammar_in   - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Install a grammar rule, and index it for use by left-corner parser.
 * RETURN VALUE
 *    none
 */
static void install_rule(id, lhs, psr, dag,
			 pPriorityUnions_in, pConstraints_in, pData)
char *			id;
char *			lhs;
SimplePSR *         psr;
PATRFeature *		dag;
PATRPriorityUnion *	pPriorityUnions_in;
PATRConstraint *	pConstraints_in;
GrammarData *		pData;
{
PATRNonterminal *	rhs;
PATRRule *		rulep;
PATRRuleList *		listp;
PATRNonterminal *	nterm;
int			nonterm_count;

/*
 * We try to preserve optional non-terminals in the rule
 * to avoid exponential explosions when a rule has a lot of them.
 * For instance, rule cat -> head (nt1) (nt2) ... (ntN).
 * would expand to 2^N rules if we eliminated optional non-terminals
 * by creating rules with the non-terminal and rules without it.
 * The parser optionally skips optional non-terminals in the rules.
 */
rhs = psr->pHead;
/*
 * Expand optional non-terminals at beginning of rule
 * so that the parser can index the first non-terminal.
 * This still avoids an exponential explosion since
 * rule cat -> (nt1) (nt2) (nt3) (nt4) head. becomes
 * rule cat -> nt1 (nt2) (nt3) (nt4) head.
 * rule cat -> nt2 (nt3) (nt4) head.
 * rule cat -> nt3 (nt4) head.
 * rule cat -> nt4 head.
 * rule cat -> head.
 */
if (rhs && rhs->bOptional) {
	expand_optional_non_terminal(rhs, id, lhs, psr, dag,
			pPriorityUnions_in, pConstraints_in, pData);
	return;
}
/* Convert to Chomsky Normal Form. */
if (FALSE && !partial_cat_p(lhs) && lhs[0] != 'X') {
	for (nterm = rhs; nterm; nterm = nterm->pNext) {
		if (nterm->bOptional && !partial_cat_p(nterm->pszName) && nterm->pNext) {
			create_partial_rule(nterm, id, lhs, psr, dag, pPriorityUnions_in, pConstraints_in, pData);
			return;
		}
	}
}
/* Move optional constraints to non-terminal. */
for (nterm = rhs; nterm; nterm = nterm->pNext) {
	if (nterm->bOptional) {
		nterm->pFeature = skip_optional_attr(dag, nterm->pszName, FALSE, pData->pPATR);
		dag = skip_optional_attr(dag, nterm->pszName, TRUE, pData->pPATR);
	}
}
/* Expand optional non-terminals that whose constraints can't be preserved. */
for( nterm = rhs ; nterm ; nterm = nterm->pNext ) {
if (FALSE && nterm->bOptional) {
	expand_optional_non_terminal(nterm, id, lhs, psr, dag,
			pPriorityUnions_in, pConstraints_in, pData);
	return;
}
}

/* Make space for the rule */
rulep = allocPATRRule(pData->pPATR);
/*
 * Install its components
 */
if ((id == NULL) || (*id == NUL))
	rulep->pszID   = NULL;
else
	rulep->pszID   = allocPATRStringCopy( id, pData->pPATR );
rulep->pszLHS      = lhs;
rulep->pRHS        = rhs;
rulep->pUniFeature = dag;
rulep->pPriorityUnions = pPriorityUnions_in;
rulep->pConstraints    = pConstraints_in;
rulep->iLineNumber = pData->uiLineNumber;
install_category( rulep, 0, lhs, pData );
nonterm_count = 0;
for( nterm = rhs ; nterm ; nterm = nterm->pNext )
	install_category( rulep, ++nonterm_count, nterm->pszName, pData );
rulep->iNontermCount = nonterm_count;
/*
 *  BK: check and report if A-over-A rule
 */
if (nonterm_count > 0 && strcmp( lhs, rulep->apszNonterms[1] ) == 0)
	{
	int obligatory = 0;
	PATRNonterminal *nonterm;
	for (nonterm = rhs; nonterm; nonterm = nonterm->pNext)
		if (!nonterm->bOptional) obligatory++;
	if (obligatory == 1) {
		displayNumberedMessage(&sSameLeftRightCategories_m,
				   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
				   pData->pszGrammarFilename, pData->uiLineNumber,
				   lhs);
		++pData->iGrammarErrorCount;
	}
	}

/* Compute left corner indices */
addPATRLeftCorner(rulep, pData->pParseData);
if (nonterm_count)	/* BK: don't compute first relation if empty rhs */
	buildPATRFirst(rulep->apszNonterms[0], rulep->apszNonterms[1],
		   pData->pParseData);

if (pData->pPATR->iDebugLevel >= 5)
	{
	showPATRRule(rulep);
	fprintf(stdout,  "Feature structure\n" );
	showPATRFeature( rulep->pUniFeature, 0, pData->pPATR);
	}
/*
 *  Link the rule into the chain of rules
 */
listp             = allocPATRRuleList(pData->pPATR);
listp->pRule      = rulep;
listp->pNext      = pData->pGrammar->pRuleTable;
pData->pGrammar->pRuleTable = listp;
}

/*****************************************************************************
 * NAME
 *    preservable_optional_constraints_p
 * ARGUMENTS
 *    cat     - name of optional category
 *    pDag1    - constraints to iterate
 *    pDag2    - constraints to check against
 * DESCRIPTION
 *    Are all cat constraints preservable in dag1?
 * RETURN VALUE
 *    int
 */
static int preservable_optional_constraints_p(cat, pDag1, pDag2, pPATR)
char *cat;
PATRFeature *pDag1;
PATRFeature *pDag2;
PATRData *pPATR;
{
/*
 * We can only preserve cat's optional constraints if they can't
 * change the outcome of the unification if cat is skipped by the parser.
 * The parser doesn't have access to the original constraints, just
 * a DAG that is the result of a number of unifications.  So it
 * can't remove the constraints if it decides to skip a non-terminal.
 * The best that it can do is to remove vacuous features under cat
 * to make the output look better.
 */
PATRComplexFeature *flist;
int count = 0;
if (!pDag1->pFirstFeat && !pDag1->pSecondFeat) {
	for ( flist=pDag1->u.pComplex; flist; flist = flist->pNext )
	{
	if (strcmp(flist->pszLabel, cat) == 0) {
		/* Is pDag1 preservable? */
		if (designator_has_value_p(flist)) {
			/* pDag1 has a constant value like <cat foo> = +. */
			/* This could cause a unification failure. */
			return FALSE;
		}
		count = count_constraint_prefixes(flist, pDag2, pPATR);
		if (count > 1) {
			/* pDag2 refers to flist multiple times. */
			/* Example: <root a> = <cat> and <root b> = <cat>. */
			/* This could cause a unification failure if */
			/* <root a f> = + and <root b f> = -. */
			count = count_constraint_prefixes(flist, pDag2, pPATR);
			return FALSE;
		}
	}
	}
	return TRUE;
}
/* Recurse down pDag1. */
if (!preservable_optional_constraints_p(cat, pDag1->pFirstFeat, pDag2, pPATR)) {
	return FALSE;
}
if (!preservable_optional_constraints_p(cat, pDag1->pSecondFeat, pDag2, pPATR)) {
	return FALSE;
}
return TRUE;
}

/*****************************************************************************
 * NAME
 *    designator_has_value_p
 * ARGUMENTS
 *    designator
 * DESCRIPTION
 *    Is designator equated to a value?
 * RETURN VALUE
 *    int
 */
static int designator_has_value_p(prefix)
PATRComplexFeature *prefix;
{
PATRFeature *value = prefix->pValue;
value = followPATRForwardPointers(value);
if (value->eType == PATR_ATOM) {
	return TRUE;
}
if (value->eType == PATR_COMPLEX) {
	PATRComplexFeature *flist;
	for (flist = value->u.pComplex; flist; flist = flist->pNext) {
	if (designator_has_value_p(flist)) {
		return TRUE;
	}
	}
}
return FALSE;
}

/*****************************************************************************
 * NAME
 *    count_constraint_prefixes
 * ARGUMENTS
 *    prefix   - constraint prefix
 *    pDag    - constraints to check
 * DESCRIPTION
 *    Count how often prefix occurs in pDag.
 * RETURN VALUE
 *    int
 */
static int count_constraint_prefixes(prefix, pDag, pPATR)
PATRComplexFeature *prefix;
PATRFeature *pDag;
PATRData *pPATR;
{
PATRComplexFeature *flist;
if (!pDag->pFirstFeat && !pDag->pSecondFeat) {
	for ( flist=pDag->u.pComplex; flist; flist = flist->pNext )
	{
	if (flist->pszLabel == prefix->pszLabel) {
		if (constraint_prefix_p(prefix, flist)) {
			return 1;
		}
	}
	}
	return 0;
}
return count_constraint_prefixes(prefix, pDag->pFirstFeat, pPATR) +
		count_constraint_prefixes(prefix, pDag->pSecondFeat, pPATR);
}

/*****************************************************************************
 * NAME
 *    constraint_prefix_p
 * ARGUMENTS
 *    prefix       - prefix of a designator
 *    designator   - constraint designator
 * DESCRIPTION
 *    Is prefix a prefix of a constraint designator?
 * RETURN VALUE
 *    int
 */
static int constraint_prefix_p(prefix, designator)
PATRComplexFeature *prefix;
PATRComplexFeature *designator;
{
PATRFeature *p_value;
PATRFeature *d_value;
while (TRUE)
{
if (prefix->pszLabel != designator->pszLabel) {
	/* The labels don't match, so prefix is not a prefix of designator. */
	return FALSE;
}
p_value = followPATRForwardPointers(prefix->pValue);
d_value = followPATRForwardPointers(designator->pValue);
if (p_value->eType != PATR_COMPLEX) {
	/* We completely matched prefix. */
	return TRUE;
}
if (d_value->eType != PATR_COMPLEX) {
	/* We are at the end of designator, but there is still some prefix left. */
	return FALSE;
}
/* Go to the next feature. */
prefix = p_value->u.pComplex;
designator = d_value->u.pComplex;
}
/* We should never get here. */
return TRUE;
}

/*****************************************************************************
 * NAME
 *    expand_optional_non_terminal
 * ARGUMENTS
 *    nterm   - non-terminal to expand
 *    id      - unique identifying string
 *    lhs     - LHS nonterminal
 *    rhs     - List of RHS nonterminals from expanded formula
 *    dag     - feature structure representing constraints on rule
 *    pPriorityUnions_in
 *    pConstraints_in
 *    pData   - grammar data
 * DESCRIPTION
 *    Install two rules, one with nterm and one without.
 * RETURN VALUE
 *    void
 */
static void expand_optional_non_terminal(nterm, id, lhs, psr, dag,
	pPriorityUnions_in, pConstraints_in, pData)
PATRNonterminal * nterm;
char *			id;
char *			lhs;
SimplePSR *         psr;
PATRFeature *		dag;
PATRPriorityUnion *	pPriorityUnions_in;
PATRConstraint *	pConstraints_in;
GrammarData *		pData;
{
SimplePSR *psr2;
PATRFeature * dag2;
PATRNonterminal * nterm2;
/* Make a rule without nterm. */
psr2 = copy_psr(psr, pData);
if (psr2->pHead->pszName == nterm->pszName) {
	/* Remove the non-terminal at the beginning. */
	psr2->pHead = psr2->pHead->pNext;
	if (psr->pHead == psr->pTail) {
		/* Update end of list pointer. */
		psr2->pTail = NULL;
	}
} else {
	/* Remove an embedded non-terminal. */
	for( nterm2 = psr2->pHead ; nterm2 ; nterm2 = nterm2->pNext ) {
	if (nterm2->pNext->pszName == nterm->pszName) {
		nterm2->pNext = nterm2->pNext->pNext;
		break;
	}
	}
}
dag2 = skip_optional_attr(dag, nterm->pszName, TRUE, pData->pPATR);
install_rule(id, lhs, psr2, dag2, pPriorityUnions_in, pConstraints_in, pData);
/* Make a rule with nterm obligatory. */
psr2 = copy_psr(psr, pData);
for( nterm2 = psr2->pHead ; nterm2 ; nterm2 = nterm2->pNext ) {
if (nterm2->pszName == nterm->pszName) {
	nterm2->bOptional = FALSE;
	break;
}
}
install_rule(id, lhs, psr2, dag, pPriorityUnions_in, pConstraints_in, pData);
}

/*****************************************************************************
 * NAME
 *    create_partial_rule
 * ARGUMENTS
 *    nterm   - non-terminal to expand
 *    id      - unique identifying string
 *    lhs     - LHS nonterminal
 *    rhs     - List of RHS nonterminals from expanded formula
 *    dag     - feature structure representing constraints on rule
 *    pPriorityUnions_in
 *    pConstraints_in
 *    pData   - grammar data
 * DESCRIPTION
 *    Create a partial rule from psr stopping at nterm.
 * RETURN VALUE
 *    void
 */
static void create_partial_rule(nterm, id, lhs, psr, dag,
	pPriorityUnions_in, pConstraints_in, pData)
	PATRNonterminal* nterm;
char* id;
char* lhs;
SimplePSR* psr;
PATRFeature* dag;
PATRPriorityUnion* pPriorityUnions_in;
PATRConstraint* pConstraints_in;
GrammarData* pData;
{
	SimplePSR* psr2;
	SimplePSR* psr3;
	PATRFeature* dag2;
	PATRFeature* dag3;
	PATRNonterminal* nterm2;
	PATRNonterminal* nterm3;
	PATRNonterminal* remainder;
	char* partial_lhs;
	char* lhs2 = NULL;
	/*
	 * Split "lhs -> cat1 cat2 nterm cat3 cat4" into
	 * "lhs -> partial_cat cat3 cat4" and partial_cat -> cat1 cat2 nterm".
	 * Split the constraints between the two rules using select_constraints.
	 * This avoids an exponential explosion of rules when there are
	 * a lot of optional non-terminals.
	 */

	/* Create a new rule with the prefix replaced with a partial category. */
	partial_lhs = new_partial_cat(lhs, nterm->pszName, pData);
	psr2 = copy_psr(psr, pData);
	for (nterm2 = psr2->pHead; nterm2; nterm2 = nterm2->pNext) {
		if (nterm2->pszName == nterm->pszName) {
			break;
		}
	}
	assert(nterm2);
	nterm3 = allocPATRNonterminal(pData->pPATR);
	nterm3->pszName = partial_lhs;
	nterm3->pszLhsName = lhs;
	nterm3->pNext = nterm2->pNext;
	nterm2->pNext = NULL;
	remainder = psr2->pHead;
	nterm2->pNext = NULL;  /* end remainder. */
	psr2->pHead = nterm3;
	dag2 = select_constraints(dag, psr2->pHead, remainder, TRUE, pData);
	if (!dag2)
	{
		dag2 = createPATRNullFeature(pData->pPATR);
	}
	install_rule(id, lhs, psr2, dag2, pPriorityUnions_in, pConstraints_in, pData);

	/* Create a new rule for the prefix as a partial category. */
	psr3 = copy_psr(psr, pData);
	for (nterm2 = psr3->pHead; nterm2; nterm2 = nterm2->pNext) {
		nterm2->pszLhsName = partial_lhs;
		if (nterm2->pszName == nterm->pszName) {
			break;
		}
	}
	assert(nterm2);
	nterm2->pNext = NULL;
	psr3->pTail = nterm2;
	dag3 = select_constraints(dag, remainder, psr2->pHead, FALSE, pData);
	if (!dag3)
	{
		dag3 = createPATRNullFeature(pData->pPATR);
	}
	install_rule(id, partial_lhs, psr3, dag3, pPriorityUnions_in, pConstraints_in, pData);
}

/*****************************************************************************
 * NAME
 *    partial_cat_p
 * ARGUMENTS
 *    cat - string
 * DESCRIPTION
 *    Is cat a partial category.
 * RETURN VALUE
 *    int
 */
int partial_cat_p(cat)
char* cat;
{
	return cat[0] == '/';
}

/*****************************************************************************
 * NAME
 *    new_partial_cat
 * ARGUMENTS
 * 	  cat - category
 *    nterm_name - name of non-terminal that caused the partial cat
 *    pData - grammar data
 * DESCRIPTION
 *    Create a unique partial category name.
 * RETURN VALUE
 *    int
 */
static char* new_partial_cat(cat, nterm_name, pData)
char* cat;
char* nterm_name;
GrammarData* pData;
{
	char partial_cat[1024];
	pData->iNextPartialId++;
	sprintf(partial_cat, "/%s/%d", cat, pData->iNextPartialId);
	return storedPATRString(partial_cat, pData->pPATR);
}

/*****************************************************************************
 * NAME
 *    select_constraints
 * ARGUMENTS
 *    pDag - feature structure
 *    non_terminals - non-terminals to select from
 *    non_terminals2 - remaining non-terminals in original rule
 *    prefer_first - whether to prefer non-terminals over non_terminals2
 *    pThis - PATR data
 * DESCRIPTION
 *    Select constraints for non_terminals from the feature structure.
 * RETURN VALUE
 *    PATRFeature *
 */
static PATRFeature* select_constraints(pDag, non_terminals, non_terminals2, prefer_first, pData)
PATRFeature* pDag;
PATRNonterminal* non_terminals;
PATRNonterminal* non_terminals2;
int prefer_first;
GrammarData* pData;
{
	PATRFeature* pFirstFeat;
	PATRFeature* pSecondFeat;
	PATRFeature* pDag2;
	if (!pDag->pFirstFeat && !pDag->pSecondFeat)
	{
		/* Does pDag contain a constraint for non_terminals? */
		PATRComplexFeature* flist;
		PATRNonterminal* nterm = NULL;
		PATRNonterminal* nterm1 = NULL;
		PATRNonterminal* nterm2 = NULL;
		/* There should be at most two features. */
		assert(!pDag->u.pComplex || !pDag->u.pComplex->pNext || !pDag->u.pComplex->pNext->pNext);
		for (flist = pDag->u.pComplex; flist; flist = flist->pNext)
		{
			/* Look for the feature in non_terminals. */
			for (nterm = non_terminals; nterm; nterm = nterm->pNext)
			{
				if (strcmp(flist->pszLabel, nterm->pszName) == 0) {
					nterm1 = nterm;
					break;
				}
			}
			/* Look for the feature in the remaining non_terminals. */
			for (nterm = non_terminals2; nterm; nterm = nterm->pNext)
			{
				if (strcmp(flist->pszLabel, nterm->pszName) == 0) {
					nterm2 = nterm;
					break;
				}
			}
		}
		/* Choose which rule the constraint should go with. */
		if (nterm1 && !nterm2)
		{
			return pDag;
		}
		if (nterm2 && !nterm1)
		{
			return NULL;
		}
		if (nterm1 && nterm2)
		{
			/*
			 * This constraint is split between the partial and remainder rules.
			 * It should go with the rule that it is optional in.
			 */
			assert(!(nterm1->bOptional && nterm2->bOptional));
			if (nterm1->bOptional)
			{
				return pDag;
			}
			if (nterm2->bOptional)
			{
				return NULL;
			}
		}
		/* Use prefer_first to decide which rule this constraint goes with. */
		if (prefer_first)
		{
			return pDag;
		}
		return NULL;
	}
	/* Unify pDag again. */
	pFirstFeat = select_constraints(pDag->pFirstFeat, non_terminals, non_terminals2, prefer_first, pData);
	pSecondFeat = select_constraints(pDag->pSecondFeat, non_terminals, non_terminals2, prefer_first, pData);
	if (!pFirstFeat) {
		return pSecondFeat;
	}
	if (!pSecondFeat) {
		return pFirstFeat;
	}
	pDag2 = unifyPATRFeatures(pFirstFeat, pSecondFeat, TRUE, pData->pPATR);
	return pDag2;
}

/*****************************************************************************
 * NAME
 *    skip_optional_attr
 * ARGUMENTS
 *    pDag - feature structure
 *    attr - attribute
 *    exclude - whether to exclude or include optional constraints
 *    pPATR - PATR data
 * DESCRIPTION
 *    Reunify pDag from constraints skipping constraints that mention attr.
 * RETURN VALUE
 *    PATRFeature *
 */
PATRFeature *skip_optional_attr(pDag, attr, exclude, pPATR)
PATRFeature *	pDag;
char * attr;
int exclude;
PATRData * pPATR;
{
/*
 * We can retroactively skip constraints that mention attr
 * because the unifier preserved the sources of each unification.
 * This is too complicated for the parser to do since its DAG
 * is created by unifying active and passive edges on top
 * of the rule constraints.
 */
PATRFeature *pFirstFeat;
PATRFeature *pSecondFeat;
PATRFeature *pDag2;
/* See if pDag has attr. */
int has_attr = FALSE;
PATRComplexFeature *flist;
if (pDag->pFirstFeat || pDag->pSecondFeat) {
	/* Unify pDag again. */
	pFirstFeat = skip_optional_attr(pDag->pFirstFeat, attr, exclude, pPATR);
	pSecondFeat = skip_optional_attr(pDag->pSecondFeat, attr, exclude, pPATR);
	if (!pFirstFeat) {
		return pSecondFeat;
	}
	if (!pSecondFeat) {
		return pFirstFeat;
	}
	pDag2 = unifyPATRFeatures(pFirstFeat, pSecondFeat, TRUE, pPATR);
	return pDag2;
}
for (flist = pDag->u.pComplex ; flist ; flist = flist->pNext) {
	if (strcmp(flist->pszLabel, attr) == 0) {
		has_attr = TRUE;
		break;
	}
}
if (has_attr == exclude)
{
	return NULL;
}
return pDag;
}

/*****************************************************************************
 * NAME
 *    install_category
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void install_category( rulep, index, pszTerm, pData )
PATRRule * rulep;
int index;
char * pszTerm;
GrammarData * pData;
{
char * s;

if (index >= rulep->iNontermsAlloc)
	{
	int iAlloc;
	char ** ppsz;
	if (rulep->apszNonterms)
	{
	iAlloc = 2 * rulep->iNontermsAlloc;
	if (iAlloc <= index)
		iAlloc = index + 1;
	ppsz = (char **)reallocMemory(rulep->apszNonterms,
						  iAlloc * sizeof(char *));
	}
	else
	{
	iAlloc = 16;
	if (iAlloc <= index)
		iAlloc = index + 1;
	ppsz = (char **)allocMemory(iAlloc * sizeof(char *));
	}
	rulep->apszNonterms = ppsz;
	rulep->iNontermsAlloc = iAlloc;
	}
rulep->apszNonterms[index] = allocPATRStringCopy( pszTerm, pData->pPATR );
if ((s = strchr(rulep->apszNonterms[index], '_')) != NULL)
	*s = NUL;			/* If underline in symbol, cut off index */
}

/*****************************************************************************
 * NAME
 *    freePATRGrammar
 * DESCRIPTION
 *    Free all the memory allocated for the stored grammar, including the
 *    PATRGrammar data structure
 * RETURN VALUE
 *    none
 */
void freePATRGrammar(pPATR_io)
PATRData *	pPATR_io;	/* pointer to PATRData structure */
{
PATRDefinition *	pDef;
PATRDefinition *	pNextDef;
StringList *		pPath;
StringList *		pNextPath;
PATRPathList *		pRestrict;
PATRPathList *		pNextRestrict;
StringList *		pOrder;
StringList *		pNextOrder;
unsigned		i;

/*free_symlist(pData);*/
if (pPATR_io == NULL)
	return;
if (pPATR_io->pGrammar != NULL)
	{
	for (   pDef = pPATR_io->pGrammar->pDefinitionTable ;
		pDef ;
		pDef = pNextDef )
	{
	pNextDef = pDef->pNext;
	freeMemory(pDef->pszName);
	if (pDef->eType == PATR_CONSTRAINT)
		freePATRLogicalExpression(pDef->u.pExpression, pPATR_io);
	if (pDef->eType == PATR_LEXICAL_RULE)
		freePATRLexicalRule(pDef->u.pLexRule, pPATR_io);
	freeMemory(pDef);
	}
	for (   pRestrict = pPATR_io->pGrammar->pRestrictors ;
		pRestrict ;
		pRestrict = pNextRestrict )
	{
	pNextRestrict = pRestrict->pNext;
	for ( pPath = pRestrict->pPath ; pPath ; pPath = pNextPath )
		{
		pNextPath = pPath->pNext;
		freeMemory( pPath );
		}
	freeMemory( pRestrict );
	}
	for (   pOrder = pPATR_io->pGrammar->pAttributeOrder ;
		pOrder ;
		pOrder = pNextOrder )
	{
	pNextOrder = pOrder->pNext;
	freeMemory( pOrder );
	}
	if (pPATR_io->pGrammar->apPriorityUnions != NULL)
	{
	for ( i = 0 ; pPATR_io->pGrammar->apPriorityUnions[i] ; ++i )
		freePriorityUnions(pPATR_io->pGrammar->apPriorityUnions[i],
				   pPATR_io);
	freeMemory( pPATR_io->pGrammar->apPriorityUnions );
	}
	if (pPATR_io->pGrammar->apConstraints != NULL)
	{
	for ( i = 0 ; pPATR_io->pGrammar->apConstraints[i] ; ++i )
		freeLogicalConstraints(pPATR_io->pGrammar->apConstraints[i],
				   pPATR_io);
	freeMemory( pPATR_io->pGrammar->apConstraints );
	}
	freeMemory( pPATR_io->pGrammar );
	pPATR_io->pGrammar = NULL;
	collectPATRGarbage(PATR_GARBAGE_GRAMMAR + pPATR_io->iGrammarSelection,
			   pPATR_io);
	}
if (pPATR_io->pszGrammarFile != NULL)
	{
	freeMemory( (void *)pPATR_io->pszGrammarFile );
	pPATR_io->pszGrammarFile = NULL;
	}
}

/*****************************************************************************
 * NAME
 *    free_symlist
 * ARGUMENTS
 * DESCRIPTION
 *    Free an old symbol list
 * RETURN VALUE
 *    none
 */
static void free_symlist(pData)
GrammarData *	pData;
{
SymbolList *sp, *nextsp;

for ( sp = pData->pSymbolList ; sp ; sp = nextsp )
	{
	nextsp = sp->pNext;
	freeMemory((void *)sp->pszSymbol);		/* Free the symbol string */
	freeMemory((void *)sp);			/* Free the list element */
	}
pData->pSymbolList = NULL;
}

/*****************************************************************************
 * NAME
 *    add_to_symlist
 * ARGUMENTS
 *    sym - Symbol to add to list
 * DESCRIPTION
 *    Add symbol to symbol list
 * RETURN VALUE
 *    none
 */
static void add_to_symlist(sym, pData)
char *sym;
GrammarData *	pData;
{
SymbolList *ps;
/*
 *  check for a repeated nonterminal in a PSR
 */
for ( ps = pData->pSymbolList ; ps ; ps = ps->pNext )
	{
	if (strcmp(sym, ps->pszSymbol) == 0)
	{
	return;
	}
	}
ps = (SymbolList *)allocMemory(sizeof(SymbolList));
ps->pszSymbol = duplicateString( sym );
ps->pNext     = pData->pSymbolList;		/* Point to next on list */
pData->pSymbolList = ps;			/* Point top to this */
}

/*----------------------------------------------------------------------------
 * NAME
 *    checkForRepeated
 * DESCRIPTION
 *    check the rule for repeated elements
 * RETURN VALUE
 *    none
 */
static void checkForRepeated( pPSR_in, pData )
SimplePSR *	pPSR_in;
GrammarData *	pData;
{
SimplePSR *	pPSR;
PATRNonterminal *	pN;
PATRNonterminal *	pnt;
unsigned	uiRepeatCount;
char		xindex[3];
char *		pszLhs;
char *		pszName;

xindex[0] = '_';
xindex[1] = 'A';
xindex[2] = '\0';
/*
 *  check for a repeated nonterminal in the set of PSRs
 */
for ( pPSR = pPSR_in ; pPSR ; pPSR = pPSR->pNext )
	{
	if (pPSR->pHead)
	pszLhs = pPSR->pHead->pszLhsName;
	else
	pszLhs = NULL;
	uiRepeatCount = 0;
	for ( pnt = pPSR->pHead ; pnt ; pnt = pnt->pNext )
	{
	if (pszLhs == pnt->pszName)
		{
		xindex[1] = 'A' + (char)uiRepeatCount;
		pnt->pszName = strappend(pnt->pszName, xindex, pData->pPATR);
		++uiRepeatCount;
		}
	}
	if (uiRepeatCount != 0)
	displayNumberedMessage(&sRepeatedNonterminal_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber,
				   pszLhs, uiRepeatCount+1);
	for ( pN = pPSR->pHead ; pN ; pN = pN->pNext )
	{
	uiRepeatCount = 0;
	pszName = pN->pszName;
	for ( pnt = pN->pNext ; pnt ; pnt = pnt->pNext )
		{
		if (pszName == pnt->pszName)
		{
		xindex[1] = 'A' + (char)uiRepeatCount;
		pnt->pszName = strappend(pnt->pszName, xindex, pData->pPATR);
		++uiRepeatCount;
		}
		}
	if (uiRepeatCount != 0)
		displayNumberedMessage(&sRepeatedNonterminal_m, pData->bSilent,
				   pData->bShowWarnings, pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber, pszName,
				   uiRepeatCount+1);
	}
	}
}

/*****************************************************************************
 * NAME
 *    balcheck
 * ARGUMENTS
 *    form - ComplexPSR to check
 * DESCRIPTION
 *    Check for balanced parens & brackets
 * RETURN VALUE
 *    Return success or NULL for failure
 */
static int balcheck( form, pData )
ComplexPSR *form;
GrammarData *	pData;
{
ComplexPSR *net;           /* Temporary net variable */
int parcnt;             /* Count of parens */
int bracecnt;           /* Count of braces */

parcnt = 0;             /* Init counts of parens and braces */
bracecnt = 0;

for ( net = form->pNext; net; net = net->pNext ) /* For each element */
	{
	switch ( *net->pszName )
		{
		case '(':
		/*
		 *  For open paren, Count it.
		 */
			parcnt++;
			break;
		case '{':
		/*
		 *  For open brace, Count it.
		 */
			bracecnt++;
			break;
		case ')':
		/*
		 *  For close paren, If count down is negative, Give message and
		 *  fail.
		 */
			if ( --parcnt < 0 )
				return( nomatch( form, ")", pData ) );
			break;
		case '}':
		/*
		 *  For close brace, If count down is negative, Give message and
		 *  fail.
		 */
			if ( --bracecnt < 0 )
				return( nomatch( form, "}", pData ) );
			break;
	}
	}
/*
 *  If unmatched paren, Give message and fail
 */
if ( parcnt )
	return( nomatch( form, "(", pData ) );
/*
 *  If unmatched brace, Give message and fail
 */
if ( bracecnt )
	return( nomatch( form, "{", pData ) );
/*
 *  Another balance check: For each element,
 *    For open paren, If no matching close paren, Give message and fail
 *    For open brace, If no matching close brace, Give message and fail
 */
for ( net = form->pNext; net->pNext; net = net->pNext )
	{
	switch ( *net->pszName )
		{
		case '(':
			if ( !matchfind( net, ")" ) )
				return( nomatch( form, "(", pData ) );
			break;
		case '{':
			if ( !matchfind( net, "}" ) )
				return( nomatch( form, "{", pData ) );
			break;
		}
	}
/*
 *  Return TRUE for success
 */
return( TRUE );
}

/*****************************************************************************
 * NAME
 *    expand_psrs
 * ARGUMENTS
 *    net   - Net to start at
 *    delim - Element to find
 * DESCRIPTION
 *    Find element, allowing for paren matching
 *    This works recursively, by calling itself to skip over any lower
 *    level parenthesized or bracketed sections it comes to during
 *    the search.  The lower level call moves the variable net forward
 *    to the end of the parenthesized section.
 * RETURN VALUE
 *    Return the first ComplexPSR element of net matching delim.
 *    The psrs field of that formula is a SimplePSR list for all expansions
 *    of net up to delim.
 */
static ComplexPSR * expand_psrs( net, delim, pData )
ComplexPSR * net;
char *       delim;
GrammarData * pData;
{
SimplePSR *psrs, *psr;
PATRNonterminal *nttemp;
int preserve_optional_non_terminals = TRUE;

if (!delim)
	{
	displayNumberedMessage(&sBadCall_expand_psrs_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber);
	return( NULL );
	}
psrs = alloc_SimplePSR(pData);
for ( net = net->pNext ; net ; net = net->pNext )
	{
	if ( delim && (*net->pszName == *delim) )
	{    /* If match found */
		net->pPsrs = psrs;
	return( net );
	}
	switch ( *net->pszName )
		{
		case '(':                           /* For open paren */
			net = expand_psrs( net, ")", pData );
						/* Find matching close */
			/* Combine the two sets of SimplePSRs:
			 * psrs = optional elements are not used;
			 * append_psrs(psrs,net->psrs) = optional elements are used;
			 */
			if (preserve_optional_non_terminals &&
					!net->pPsrs->pNext && net->pPsrs->pHead == net->pPsrs->pTail)
			{
			/* A single optional element is treated as a special case
			 * to avoid exponential explosions in morpheme rules.
			 */
			SimplePSR *optional_psr = copy_psr(net->pPsrs, pData);
			optional_psr->pHead->bOptional = TRUE;
			psrs = append_psrs(psrs, optional_psr, pData);
			break;
			}
			psrs = union_psrs( psrs, append_psrs(psrs, net->pPsrs, pData) );
			break;
		case '{':                           /* For open brace */
			net = expand_psrs( net, "}", pData );
							/* Find matching close */
			psrs = append_psrs( psrs, net->pPsrs, pData );
			break;
		case ')':                           /* For close paren */
			return( NULL );                 /* Fail to find */
		case '}':                           /* For close brace */
			return( NULL );                 /* Fail to find */
		case '/':                           /* For alternative separator */
			net = expand_psrs( net, "}", pData );
						/* Find remaining alternatives */
		net->pPsrs = union_psrs( psrs, net->pPsrs );
		return( net );
	default:
		/*
		 *  Nonterminal Symbol: add it to end of each SimplePSR's nonterm
		 *  list
		 */
		nttemp = new_nonterm(net->pszName, pData);
		nttemp->pszLhsName = net->pszLhsName;
		/* For each expansion */
		for ( psr = psrs ; psr ; psr = psr->pNext )
				append_nonterms( psr, nttemp, nttemp );
		} /* end switch */
	} /* end for */

/*
 *  should never get here, since formulas already checked for balanced delims
 *  by balcheck in form_to_psrs().
 *
 *  Return NULL if delim not found
 */
nomatch(net, delim, pData);
return( (ComplexPSR *)0 );
}

/*****************************************************************************
 * NAME
 *    nomatch
 * ARGUMENTS
 *    form - ComplexPSR with unmatched paren or bracket
 *    s    - String with paren or bracket
 * DESCRIPTION
 *    Give unmatched paren message
 * RETURN VALUE
 *    Returns zero for convenience for caller
 */
static long nomatch( form, s, pData)
ComplexPSR *form;
char *s;
GrammarData *	pData;
{
char errtxt[128];

displayNumberedMessage(&sUnmatchedInFormula_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   s);
showComplexPSR( errtxt, form );       /* Show the formula */
return ( 0 );        /* Return zero so it can be passed on up */
}

/*****************************************************************************
 * NAME
 *    append_psrs
 * ARGUMENTS
 *    psr1 -
 *    psr2 -
 * DESCRIPTION
 *    Form the cross product of all possible concatenations of
 *    the sequences of psrs1 followed by those of psrs2.
 *    we must copy the elements of psrs1, because their tails are changed.
 * RETURN VALUE
 *
 */
static SimplePSR * append_psrs( psrs1, psrs2, pData )
SimplePSR * psrs1;
SimplePSR * psrs2;
GrammarData *	pData;
{
SimplePSR *result, *psr1, *psr2, *copy1;

result = NULL;
for ( psr2 = psrs2; psr2; psr2 = psr2->pNext )
	{
	for ( psr1 = psrs1; psr1; psr1 = psr1->pNext )
	{
	copy1 = copy_psr( psr1, pData );
	append_nonterms( copy1, psr2->pHead, psr2->pTail );
	if (result)
		copy1->pNext = result;
	else
		copy1->pNext = NULL;
	result = copy1;
	}
	}
return( result );
}

/*****************************************************************************
 * NAME
 *    union_psrs
 * ARGUMENTS
 *    psr1 -
 *    psr2 -
 * DESCRIPTION
 *    add psrs2 to the end of psrs1
 * RETURN VALUE
 *
 */
static SimplePSR *union_psrs( psrs1, psrs2 )
SimplePSR *psrs1, *psrs2;
{
SimplePSR *psr1;

for ( psr1 = psrs1; psr1->pNext; psr1 = psr1->pNext )
	;
psr1->pNext = psrs2;
return( psrs1 );
}

/*****************************************************************************
 * NAME
 *    in_symlist
 * ARGUMENTS
 *    sym - Symbol to look for
 * DESCRIPTION
 *
 * RETURN VALUE
 *    Return numbered equivalent of symbol
 */
static char * in_symlist(sym, pData)
char *sym;
GrammarData *	pData;
{
SymbolList *tsym;

if (pData->pSymbolList == NULL)		/* If list is empty (Let) */
	return( sym );			/* Return same symbol */
/*
 *  For each symbol, If match, Return it
 */
for ( tsym = pData->pSymbolList; tsym; tsym = tsym->pNext )
	{
	if (strcmp(sym, tsym->pszSymbol) == 0)
	return( tsym->pszSymbol );
	}
return( NULL );                /* No match, so return NULL */
}

/*****************************************************************************
 * NAME
 *    matchfind
 * ARGUMENTS
 *    net - Net to start at
 *    s   - Element to find
 * DESCRIPTION
 *    Find element, allowing for parend matching
 *    This works recursively, by calling itself to skip over any lower
 *    level parenthesized or bracketed sections it comes to during
 *    the search.  The lower level call moves the variable net forward
 *    to the end of the parenthesized section.
 * RETURN VALUE
 *    Return element found, NULL if not found
 */
static ComplexPSR *matchfind( net, s )
ComplexPSR *net;
char *s;
{
for ( net = net->pNext; net; net = net->pNext )   /* For each element */
	{
	if ( *net->pszName == *s )             /* If match found */
		return( net );                  /* Return the place */
	switch ( *net->pszName )
		{
		case '(':                           /* For open parend */
			net = matchfind( net, ")" );    /* Find matching close */
			break;
		case '{':                           /* For open brace */
			net = matchfind( net, "}" );    /* Find matching close */
			break;
		case ')':                           /* For close parend */
			return( NULL );                 /* Fail to find */
		case '}':                           /* For close brace */
			return( NULL );                 /* Fail to find */
		}
	if ( !net )                         /* If failure, return NULL */
		return( NULL );
	}
return( NULL );                         /* Return NULL if not found */
}

/*****************************************************************************
 * NAME
 *    new_nonterm
 * ARGUMENTS
 *    name -
 * DESCRIPTION
 *
 * RETURN VALUE
 *    Return a new PATRNonterminal struct
 */
static PATRNonterminal * new_nonterm(name, pData)
char *     name;
GrammarData *	pData;
{
PATRNonterminal * nt;

nt = allocPATRNonterminal(pData->pPATR);
nt->pszName    = storedPATRString(name, pData->pPATR);
nt->pszLhsName = NULL;
nt->pNext      = NULL;
return nt;
}

/*****************************************************************************
 * NAME
 *    append_nonterms
 * ARGUMENTS
 *    psr  -
 *    head -
 *    tail -
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void append_nonterms(psr, head, tail)
SimplePSR *psr;
PATRNonterminal *head;
PATRNonterminal *tail;
{
if ( psr->pTail )
	psr->pTail->pNext = head;
else
	psr->pHead = head;
psr->pTail = tail;
}

/*****************************************************************************
 * NAME
 *    copy_psr
 * ARGUMENTS
 *    psr -
 * DESCRIPTION
 *    Copy psr structure, and its list of nonterminals
 * RETURN VALUE
 *
 */
static SimplePSR * copy_psr(psr, pData)
SimplePSR *	psr;
GrammarData *	pData;
{
SimplePSR *	psrcopy;
PATRNonterminal *	nt;
PATRNonterminal *	ntcopy;

psrcopy = alloc_SimplePSR(pData);
if (psr->pHead)
	{
	psrcopy->pTail = psrcopy->pHead = copy_nonterm( psr->pHead, pData );
	for( nt = psr->pHead->pNext ; nt ; nt = nt->pNext )
	{
	ntcopy = copy_nonterm( nt, pData );
	psrcopy->pTail->pNext = ntcopy;
	psrcopy->pTail        = ntcopy;
	}
	}
else
	psrcopy->pTail = psrcopy->pHead = NULL;
psrcopy->pNext = psr->pNext;
return( psrcopy );
}

/*****************************************************************************
 * NAME
 *    copy_nonterm
 * ARGUMENTS
 *    nonterm
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
static PATRNonterminal * copy_nonterm(nonterm, pData)
PATRNonterminal *nonterm;
GrammarData *	pData;
{
PATRNonterminal *copy;

copy = new_nonterm( nonterm->pszName, pData);
copy->pszLhsName = nonterm->pszLhsName;
copy->bOptional = nonterm->bOptional;
copy->pFeature = nonterm->pFeature;
copy->pNext      = NULL;
return( copy );
}

/***************************************************************************
 * NAME
 *    newTemplate
 * ARGUMENTS
 *    name  - name being defined by Let
 *    pGrammar_in - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Make a new Definition/PATR_TEMPLATE struct with name and a null feat
 *    struct.
 *        AB: Could be optimized from linear search.
 * RETURN VALUE
 *    New PATRDefinition struct.
 */
static PATRDefinition * newTemplate( name, pData )
char *        name;
GrammarData * pData;
{
PATRDefinition * pDef;

pDef = findPATRDefinition(name, pData->pGrammar);
if (pDef != NULL)		/* If already defined, complain and quit */
	{
	char * pszCmd;
	char * psz2nd;
	switch (pDef->eType)
	{
	case PATR_TEMPLATE:	pszCmd = "Let";		psz2nd = "be";	break;
	case PATR_LEXICAL_RULE:	pszCmd = "Define";	psz2nd = "as";	break;
	case PATR_CONSTRAINT:	pszCmd = "Constraint";	psz2nd = "is";	break;
	default:		pszCmd = "?BAD?";	psz2nd = "??";	break;
	}
	displayNumberedMessage(&sRedefinition_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Let", name, "be",
			   pszCmd, name, psz2nd);
	return( NULL );
	}
/*
 *  allocate a new PATR_TEMPLATE definition, and add it to the beginning of
 *  the list
 */
pDef = (PATRDefinition *)allocMemory(sizeof(PATRDefinition));
pDef->eType             = PATR_TEMPLATE;
pDef->pszName           = duplicateString( name );
pDef->u.pFeatDisj       = createPATRFeatureDisjunction(
					   createPATRNullFeature(pData->pPATR),
					   pData->pPATR);
pDef->pNext             = pData->pGrammar->pDefinitionTable;
pData->pGrammar->pDefinitionTable = pDef;
return( pDef );
}

/***************************************************************************
 * NAME
 *    newLexicalRule
 * ARGUMENTS
 *    name  - name being defined by Define
 *    pGrammar_in - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Make a new Definition/PATR_LEXICAL_RULE struct with name
 *        AB: Could be optimized from linear search.
 * RETURN VALUE
 *    New PATRDefinition struct.
 */
static PATRDefinition * newLexicalRule( name, pData )
char *        name;
GrammarData * pData;
{
PATRDefinition * pDef;

pDef = findPATRDefinition(name, pData->pGrammar);
if (pDef != NULL)		/* If already defined, complain and quit */
	{
	char * pszCmd;
	char * psz2nd;
	switch (pDef->eType)
	{
	case PATR_TEMPLATE:	pszCmd = "Let";		psz2nd = "be";	break;
	case PATR_LEXICAL_RULE:	pszCmd = "Define";	psz2nd = "as";	break;
	case PATR_CONSTRAINT:	pszCmd = "Constraint";	psz2nd = "is";	break;
	default:		pszCmd = "?BAD?";	psz2nd = "??";	break;
	}
	displayNumberedMessage(&sRedefinition_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Define", name, "as",
			   pszCmd, name, psz2nd);
	return( NULL );
	}
/*
 *  allocate a new PATR_LEXICAL_RULE definition, and add it to the beginning of
 *  the list
 */
pDef = (PATRDefinition *)allocMemory(sizeof(PATRDefinition));
pDef->eType             = PATR_LEXICAL_RULE;
pDef->pszName           = duplicateString( name );
pDef->u.pLexRule        = NULL;
pDef->pNext             = pData->pGrammar->pDefinitionTable;
pData->pGrammar->pDefinitionTable = pDef;
return( pDef );
}

/***************************************************************************
 * NAME
 *    newConstraint
 * ARGUMENTS
 *    pszName_in  - name being defined by Constraint
 *    pGrammar_in - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Make a new Definition/PATR_CONSTRAINT struct with name
 * RETURN VALUE
 *    New PATRDefinition struct.
 */
static PATRDefinition * newConstraint( pszName_in, pData )
char *        pszName_in;
GrammarData * pData;
{
PATRDefinition * pDef;

pDef = findPATRDefinition(pszName_in, pData->pGrammar);
if (pDef != NULL)		/* If already defined, complain and quit */
	{
	char * pszCmd;
	char * psz2nd;
	switch (pDef->eType)
	{
	case PATR_TEMPLATE:	pszCmd = "Let";		psz2nd = "be";	break;
	case PATR_LEXICAL_RULE:	pszCmd = "Define";	psz2nd = "as";	break;
	case PATR_CONSTRAINT:	pszCmd = "Constraint";	psz2nd = "is";	break;
	default:		pszCmd = "?BAD?";	psz2nd = "??";	break;
	}
	displayNumberedMessage(&sRedefinition_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Constraint", pszName_in, "is",
			   pszCmd, pszName_in, psz2nd);
	return( NULL );
	}
/*
 *  allocate a new PATR_CONSTRAINT definition, and add it to the beginning of
 *  the list
 */
pDef = (PATRDefinition *)allocMemory(sizeof(PATRDefinition));
pDef->eType             = PATR_CONSTRAINT;
pDef->pszName           = duplicateString( pszName_in );
pDef->u.pExpression     = NULL;
pDef->pNext             = pData->pGrammar->pDefinitionTable;
pData->pGrammar->pDefinitionTable = pDef;
return( pDef );
}

/*****************************************************************************
 * NAME
 *    unify_template_alts
 * DESCRIPTION
 *    Unify alternates from PATR_TEMPLATE definition (pDef_io)
 * RETURN VALUE
 *
 */
static int unify_template_alts( pDef_io, pNewAlts_in, pData)
PATRDefinition *		pDef_io;
PATRFeatureDisjunction *	pNewAlts_in;
GrammarData *	pData;
{
PATRFeatureDisjunction *	pResults;

pResults = unifyPATRDisjuncts( pDef_io->u.pFeatDisj, pNewAlts_in,
				   pData->pPATR);
if (pResults != NULL)
	{
	pDef_io->u.pFeatDisj = pResults;
	}
return(pResults != NULL);
}

/***************************************************************************
 * NAME
 *    new_path
 * ARGUMENTS
 *    label -
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
static StringList * new_path( label, pData )
char *		label;
GrammarData *	pData;
{
StringList *path;				/* Result structure */
/*
 *  Get space for new one
 */
path = allocPATRFeaturePath(pData->pPATR);
/* Store the label */
path->pszString = storedPATRString( label, pData->pPATR);
path->pNext     = NULL;
return (path);
}

/*****************************************************************************
 * NAME
 *    copy_path
 * DESCRIPTION
 *
 * RETURN VALUE
 *    pointer to a new copy of a feature path
 */
static StringList * copy_path(pPath_in, pData)
StringList * pPath_in;
GrammarData *	pData;
{
StringList * pNewHead = NULL;
StringList * pNewTail = NULL;
StringList * pNew;
StringList * pNode;

for ( pNode = pPath_in ; pNode ; pNode = pNode->pNext )
	{
	pNew = new_path(pNode->pszString, pData);
	if (pNewHead == NULL)
	pNewHead = pNew;
	else
	pNewTail->pNext = pNew;
	pNewTail = pNew;
	}
return pNewHead;
}

/* pData->pCurrentPath access-update functions */

/*****************************************************************************
 * NAME
 *    init_current_last
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void init_current_last(pData)
GrammarData *	pData;
{
StringList *path;

if (pData->pCurrentPath)
	{
	for ( path = pData->pCurrentPath ; path->pNext ; path = path->pNext )
	;
	pData->pCurrentLast = path;
	}
else
	pData->pCurrentLast = NULL;
}

/*****************************************************************************
 * NAME
 *    init_current_path
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void init_current_path(pData)
GrammarData *	pData;
{
pData->pCurrentPath = NULL;
pData->pCurrentLast = NULL;
}

/*****************************************************************************
 * NAME
 *    pop_path
 * ARGUMENTS
 *    path - previous element of path list, which becomes pData->pCurrentLast
 * DESCRIPTION
 *    Removes pData->pCurrentLast from pData->pCurrentPath list.
 * RETURN VALUE
 *    none
 */
static void pop_path( path, pData )
StringList * path;
GrammarData * pData;
{
if (path)
	path->pNext = NULL;
else
	pData->pCurrentPath = NULL;
/*
 *  free pData->pCurrentLast structure, and set it back to path
 */
if (pData->pCurrentLast)
	deallocatePATRFeaturePath( pData->pCurrentLast, pData->pPATR );
else
	displayNumberedMessage(&sBadCall_pop_path_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber);
pData->pCurrentLast = path;
}

/*****************************************************************************
 * NAME
 *    push_path
 * ARGUMENTS
 *    label -
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
static StringList * push_path( label, pData )
char *        label;
GrammarData * pData;
{
StringList * tpath;
StringList * prev_last;

prev_last = pData->pCurrentLast;
tpath = new_path( label, pData );
if (pData->pCurrentLast)
	{
	pData->pCurrentLast->pNext = tpath;
	pData->pCurrentLast = tpath;
	}
else
	pData->pCurrentPath = pData->pCurrentLast = tpath;
return( prev_last );
}

/*----------------------------------------------------------------------------
 * NAME
 *    read_find_or_create
 * DESCRIPTION
 *    Read the next path element from the input.
 *    If label is not the end of the path, then find or create it as a label
 *    in feature structure findfs.  This does a recursive call if it does not
 *    see the end of the path.
 * RETURN VALUE
 *    Lowest level feature structure found or created.
 */
static PATRFeature * read_find_or_create(findfs, pData)
PATRFeature *	findfs;		/* Feature structure to find or create in. */
GrammarData *	pData;
{
char *	label;
char *	tlabel;
PATRFeature *	f;
StringList *	path;
char	szToken[MAX_TOKEN_SIZE+1];
int	iTokenType;
char	szNextToken[MAX_TOKEN_SIZE+1];
int	iNextTokenType;
/*
 *  Get next token
 */
iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
label = szToken;
/*
 *  If change to zero And label matches, Change to indexed one
 */
if ((pData->pLeftSymbol != NULL) && (strcmp(label, pData->pLeftSymbol) == 0))
	label = pData->pIndexedLeftSymbol;
else if ( pData->bFirstSymbol )
	{					/* Else if first symbol */
	tlabel = in_symlist(label, pData);	/* Find it in right hand side list */
	/*
	 *  Right hand symbols take precedence over left symbol
	 */
	if ( tlabel )			/* If found substitute equivalent */
	label = tlabel;
	else
	{
	/*
	 *  If label is formula symbol, use indexed one
	 */
	if (strcmp(label, pData->szPsrLhsSymbol) == 0)
		label = pData->pIndexedLeftSymbol;
	}
	}
pData->pLeftSymbol = NULL;		/* Next path will not be left symbol */
pData->bFirstSymbol = FALSE;			/* No longer first symbol */
					/* Find or create it */
f    = findOrAddPATRAttribute( findfs, label, pData->pPATR);
path = new_path( label, pData );	/* store label used */

iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
if (iNextTokenType == EOF)
	{
	/*
	 *  If end of file, report and exit
	 */
	displayNumberedMessage(&sEOFbeforeWedge_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber);
	/* Possible memory leak */
	return( (PATRFeature *)NULL );
	}
/*
 *  if not end of path, find or create next path element
 *  else (end of path), move past end of path token
 */
if (iNextTokenType != '>' )
	f = read_find_or_create(f, pData);
else
	getToken(szToken, MAX_TOKEN_SIZE, pData);

path->pNext  = pData->pReadingPath;		/* Now add path to the front of list */
pData->pReadingPath = path;

return( f );				/* Return struct found or created */
}

/***************************************************************************
 * NAME
 *    loaderr
 * ARGUMENTS
 *    mp - message to give user, may contain one %s
 *    s  - string to print as part of message
 * DESCRIPTION
 *    Give error message, advance file to next keyword, and
 *    create a null structure.
 * RETURN VALUE
 *    A null structure.
 */
static PATRFeature * loaderr( mp, s, pData )
const NumberedMessage * mp;
const char *		s;
GrammarData *	pData;
{
char	szToken[MAX_TOKEN_SIZE+1];
int	iTokenType;

displayNumberedMessage(mp,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   s);
do					/* Advance to desired token */
	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	} while ((iTokenType != EOF) && (iTokenType != KEYWORD_TOKEN));

return createPATRNullFeature(pData->pPATR);	/* Return a new null */
}

/*----------------------------------------------------------------------------
 * NAME
 *    read_formula
 * DESCRIPTION
 *    Read a feature structure from an input file.  It clears the reference
 *    list, and then calls load_formula() to do the actual reading.
 * RETURN VALUE
 *    Next feature structure from file.  NULL if no more.
 */
static PATRFeature * read_formula(bFormulaOnly_in, ppLHS_out, pData)
int		bFormulaOnly_in;
PATRFeature **  ppLHS_out;
GrammarData *	pData;
{
char			 szToken[MAX_TOKEN_SIZE+1];
int			 iTokenType;
char			 szNextToken[MAX_TOKEN_SIZE+1];
int			 iNextTokenType;
PATRFeature *		 pNewFS;
PATRFeature *		 pLeftFS;
PATRFeature *		 pRightFS;
PATRFeatureDisjunction * tfeatd;
int			 failed = FALSE;
StringList *		 tpath;
char			 errtxt[512];

if (ppLHS_out != NULL)
	*ppLHS_out = NULL;

pNewFS = createPATRNullFeature(pData->pPATR);	/* Start with a null fs */

iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
if (iNextTokenType == '<' )		/* If start of path, move into it */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);

iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
if (iNextTokenType == '>')		/* If empty path, refuse it */
	return( loaderr(&sEmptyPath_m, "", pData) );
pData->bFirstSymbol = TRUE;
pData->pReadingPath = NULL;
/* Add path to pNewFS */
pLeftFS = read_find_or_create(pNewFS, pData);

iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
switch (iNextTokenType)
	{
	case '=':
	break;
	case PRIORITYUNION_TOKEN:
	case CONSTRAINT_TOKEN:
	if (!bFormulaOnly_in)
		{
		if (ppLHS_out != NULL)
		*ppLHS_out = pNewFS;
		return NULL;
		}
	/* fall through */
	default:
	return( loaderr(&sPathWithoutEqual_m, "", pData) );
	}
iTokenType     = getToken(szToken, MAX_TOKEN_SIZE, pData);	/* Move to equal */
iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
if (iNextTokenType == '<')
	{
	/*
	 *  If next is path, move to first thing on path
	 */
	iTokenType     = getToken(szToken, MAX_TOKEN_SIZE, pData);
	iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
	if (iNextTokenType == '>')		/* If empty path, refuse it */
	return( loaderr(&sEmptyPath_m, "", pData) );

	pData->bFirstSymbol = TRUE;
	pData->pReadingPath = NULL;
	/* Add path to pNewFS */
	pRightFS = read_find_or_create(pNewFS, pData);
	if (unifyPATRFeatures(pRightFS, pLeftFS, FALSE, pData->pPATR) == NULL)
	failed = TRUE;
	if (!verifyAcyclicPATRFeature(pRightFS))
	{
	displayNumberedMessage(&sUnificationProducesCycle_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber, "");
	failed = TRUE;
	}
	}
else if (iNextTokenType == '[')
	{
	/*
	 *  If next is feature struct, remember path for disjunctions
	 */
	pData->pCurrentPath = pData->pReadingPath;
	init_current_last(pData);
	/*
	 *  Get the next token
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	/* Get feature structure */
	pRightFS = read_feat_struct(pData);
	init_current_path(pData);
	if (unifyPATRFeatures(pRightFS, pLeftFS, FALSE, pData->pPATR) == NULL)
	failed = TRUE;
	if (!verifyAcyclicPATRFeature(pRightFS))
	{
	displayNumberedMessage(&sUnificationProducesCycle_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP, pData->pszGrammarFilename,
				   pData->uiLineNumber, "");
	failed = TRUE;
	}
	}
else if (iNextTokenType == '{')
	{
	/*
	 *  If next is disjunction, remember path for disjunctions
	 */
	pData->pCurrentPath = pData->pReadingPath;
	init_current_last(pData);
	tfeatd = read_disjunction(pData);
	if ( !tfeatd )			/* Couldn't build disjunction, warn */
	return( loaderr(&sInvalidDisjunction_m, "", pData) );
	if ( tfeatd->pNext )		/* If more than one alternative */
	{		/* add a disjunction into pData->pEmbeddedAlts */
	add_embedded_disj(tfeatd, pData->pCurrentPath, pData);
	}
	else				/* Else (only one alternative) */
	{				/* Unify it with left */
	if (unifyPATRFeatures(tfeatd->pFeature,
				  pLeftFS, FALSE, pData->pPATR) == NULL)
		failed = TRUE;
	if (!verifyAcyclicPATRFeature(tfeatd->pFeature))
		{
		displayNumberedMessage(&sUnificationProducesCycle_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber, "");
		failed = TRUE;
		}
	}
	init_current_path(pData);
	}
else				/* Else (it is atom) */
	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);  /* Move to atom */
	if (szToken[0] == '!')		/* If default atom (marked !atom) */
	{
	pLeftFS->eType = PATR_DEFATOM; 	/* Make left have it as default atom */
					/* Plus 1 below makes copy without ! */
	pLeftFS->u.pszAtom = storedPATRString( &szToken[1], pData->pPATR);
	}
	else
	{
	pLeftFS->eType = PATR_ATOM;	/* Make left have it as an atom */
	pLeftFS->u.pszAtom = storedPATRString(szToken, pData->pPATR);
	}
	}
if ( failed )
	{
	errtxt[0] = NUL;
	for ( tpath = pData->pReadingPath ; tpath ; tpath = tpath->pNext )
	{
	strcat(errtxt, tpath->pszString );
		strcat(errtxt, " ");
	}
	displayNumberedMessage(&sFailureToUnify_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   errtxt);
	}
return( pNewFS );
}

/***************************************************************************
 * NAME
 *    load_feat_struct
 * ARGUMENTS
 *    newfs  - Feature structure to load into.
 *    pathfs - Feature structure for paths to look or create in.
 * DESCRIPTION
 *    Load a feature structure from an input file.  It looks for
 *    an open square bracket, and loads the feature structure
 *    up the the matching close square bracket.  It calls itself
 *    recursively when it sees a new open bracket coming.
 * RETURN VALUE
 *    Next feature structure from file.  NULL if no more.
 */
static PATRFeature * load_feat_struct(newfs, pathfs, pData)
PATRFeature * newfs;
PATRFeature * pathfs;
GrammarData * pData;
{
char			szToken[MAX_TOKEN_SIZE+1];
int			iTokenType;
char			szNextToken[MAX_TOKEN_SIZE+1];
int			iNextTokenType;
char			szLabel[MAX_TOKEN_SIZE+1];
PATRFeature *		nestfs;
PATRFeature *		tfeat;
PATRFeatureDisjunction *	tfeatd;
int			refnum;
StringList *			last_path;
char			errtxt[128];
/*
 *  Get the next token
 */
iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
if (iTokenType == '[')			/* If at open bracket, move past it */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
while (iTokenType != ']')		/* While next not end, load features */
	{
	if (iTokenType == '{')		/* read a disjunction */
	{
	tfeatd = read_disjunction(pData);
	if (tfeatd == NULL)		/* Couldn't build disjunction, warn */
		return( loaderr(&sInvalidDisjunction_m, "", pData) );
	if (tfeatd->pNext != NULL)
		{
		/*
		 *  If more than one alternative, add a disjunction into
		 *  pData->pEmbeddedAlts
		 */
		add_embedded_disj(tfeatd, pData->pCurrentPath, pData);
		}
	else
		{
		if (unifyPATRFeatures(tfeatd->pFeature,
				  newfs, FALSE, pData->pPATR) == NULL)
		return( loaderr(&sFailsToUnify_m, szToken, pData) );
		if (!verifyAcyclicPATRFeature(tfeatd->pFeature))
		return loaderr(&sUnificationProducesCycle_m, szToken, pData);
		}
	/*
	 *  get ready for next term
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	}
	else if ((iNextTokenType = getNextToken(szNextToken,
						MAX_TOKEN_SIZE, pData)) == ':')
	{
	strcpy(szLabel, szToken);		/* Else copy token to label */
	/*
	 *  BK: should check whether label already exists
	 *      newfs before some calls to addPATRFeatureToComplex (below)
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);	/* Get : */
	refnum = 0;                     /* Clear refnum as reference flag */
	iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
	if (iNextTokenType == '$')        /* If next is reference */
		{
		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);  /* Get $ */
		refnum = atoi( &szToken[1] );	/* Get reference number */
		if ((refnum < 1) || (refnum > MAXREF))
		{
		sprintf(errtxt, "%s (should be > 0 and < %d)",
			szToken, MAXREF );
		return loaderr( &sInvalidReferenceNumber_m, errtxt, pData);
		}
		iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
		}
	if (iNextTokenType == '[' )	/* If nested struct next, read it */
		{
		/*
		 *  Move to the next token
		 */
		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
		last_path = push_path( szLabel, pData );
		nestfs = load_feat_struct( createPATRNullFeature(pData->pPATR),
					   pathfs, pData);
		pop_path( last_path, pData );
		addPATRFeatureToComplex(newfs,
					createPATRComplexFeature(
					   storedPATRString(szLabel,
								pData->pPATR),
					   nestfs,
					   pData->pPATR));
		if ( refnum )		/* If reference, remember it */
		pData->apRefFeature[refnum] = nestfs;
		/*
		 *  Get next token for top of loop
		 */
		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
		}
	else if (iNextTokenType == '{')		/* If disjunction, read it */
		{
		last_path = push_path( szLabel, pData );
		tfeatd = read_disjunction(pData);
		if ( !tfeatd )		/* Couldn't build disjunction, warn */
		return loaderr(&sInvalidDisjunction_m, "", pData);
		if ( tfeatd->pNext )	/* If more than one alternative, */
		{	  /* add a disjunction into pData->pEmbeddedAlts */
		add_embedded_disj(tfeatd, pData->pCurrentPath, pData);
		}
		else
		{
		addPATRFeatureToComplex(newfs,
					createPATRComplexFeature(
					   storedPATRString(szLabel,
								pData->pPATR),
					   tfeatd->pFeature,
					   pData->pPATR) );
		if ( refnum )		/* If reference, remember it */
			pData->apRefFeature[refnum] = tfeatd->pFeature;
		}
		pop_path( last_path, pData );
		/*
		 *  Get next token for top of loop
		 */
		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
		}
	else if (iNextTokenType == '<')	/* If path expression, read it */
		{
		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
		iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
		if (iNextTokenType == '>')	/* If empty path, refuse it */
		return( loaderr(&sLabelHasEmptyPath_m, szLabel, pData) );
		pData->pReadingPath = NULL;
		/*
		 *  Add path to fs
		 */
		nestfs = read_find_or_create( pData->pTopFeature, pData);
		addPATRFeatureToComplex(newfs,
					createPATRComplexFeature(
					   storedPATRString(szLabel,
								pData->pPATR),
					   nestfs,
					   pData->pPATR));
		/*
		 *  Move to next thing after path
		 */
		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
		}
	else
		{
		/*
		 *  Get next token
		 */
		iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
		if (iTokenType == ']')	/* If end of structure */
		{
		if ( refnum )		/* If a reference */
			{
			if (!pData->apRefFeature[refnum])
			{		/* If not valid, give message */
			sprintf( errtxt, "%d", refnum );
			return loaderr(&sUndefinedReference_m, errtxt, pData);
			}
			else		/* Else (valid) point to reference */
			addPATRFeatureToComplex(newfs,
						createPATRComplexFeature(
							storedPATRString(szLabel,
								 pData->pPATR),
						   pData->apRefFeature[refnum],
							pData->pPATR));
			}
		else			/* Else (no ref) make null */
			addPATRFeatureToComplex(newfs,
						createPATRComplexFeature(
							storedPATRString(szLabel,
								 pData->pPATR),
							createPATRNullFeature(
								 pData->pPATR),
							pData->pPATR));
		return( newfs );
		}
		else			/* Else (atom or next label) */
		{
		iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE,
						  pData);
		if (iNextTokenType != ':')	/* If atom */
			{				/* Add label and atom */
			tfeat = read_atom( szToken, pData->pPATR );
			addPATRFeatureToComplex(newfs,
						createPATRComplexFeature(
							storedPATRString(szLabel,
								 pData->pPATR),
							tfeat,
							pData->pPATR));
			if ( refnum )		/* If reference, complain */
			return loaderr( &sReferenceNotAllowed_m, "", pData);
			/*
			 *  Move to next token
			 */
			iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
			}
		else				/* Else (next label) */
			{
			if ( refnum )		/* If a reference */
			{
			if (!pData->apRefFeature[refnum])
				{			/* give message if invalid */
				sprintf( errtxt, "%d", refnum );
				return loaderr(&sUndefinedReference_m, errtxt,
					   pData);
				}
			else		/* Else (valid) point to reference */
				addPATRFeatureToComplex(newfs,
							createPATRComplexFeature(
							storedPATRString(szLabel,
								 pData->pPATR),
						   pData->apRefFeature[refnum],
							pData->pPATR));
			}
			else		/* Else (no ref) make null */
			addPATRFeatureToComplex(newfs,
						createPATRComplexFeature(
							storedPATRString(szLabel,
								 pData->pPATR),
					   createPATRNullFeature(pData->pPATR),
							pData->pPATR));
			}
		}
		}
	}
	else			/* Else (next not colon) try Let */
	{
	/*
	 *  Look up token in Definition/PATR_TEMPLATE list
	 */
	tfeatd = findPATRTemplate(szToken, pData->pGrammar, pData->pPATR);
	if (tfeatd == NULL)
		{
		/*
		 *  If not found in Definition list, warn
		 */
		if (strchr( "[]{}<>=", iTokenType) != NULL)
		{
		iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE,
						  pData);
		sprintf( errtxt, "%c before %s", szToken[0], szNextToken );
		return( loaderr( &sUnexpectedSoSkipping_m, errtxt, pData) );
		}
		else
		return( loaderr( &sNotDefinedInLet_m, szToken, pData) );
		}
	if ( tfeatd->pNext )		/* If more than one alternative, */
		{		  /* add a disjunction into pData->pEmbeddedAlts */
		add_embedded_disj(tfeatd, pData->pCurrentPath, pData);
		}
	else
		{
		if (unifyPATRFeatures(tfeatd->pFeature,
				  newfs, FALSE, pData->pPATR) == NULL)
		return( loaderr(&sFailsToUnify_m, szToken, pData) );
		if (!verifyAcyclicPATRFeature(tfeatd->pFeature))
		return loaderr(&sUnificationProducesCycle_m, szToken, pData);
		}
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	}
	if (iTokenType == EOF)
	{
	/* This may be a memory leak */
		displayNumberedMessage(&sEOFbeforeBracket_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber);
	return( (PATRFeature *)NULL );
	}
	} /* End while */
return( newfs );
}

/***************************************************************************
 * NAME
 *    read_feat_struct
 * ARGUMENTS
 *    pGrammar_in - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Read a feature structure from an input file.  It clears
 *    the reference list, and then calls load_feat_struct to
 *    do the actual reading.
 * RETURN VALUE
 *    Next feature structure from file.  NULL if no more.
 */
static PATRFeature * read_feat_struct(pData)
GrammarData *	pData;
{
int i;
PATRFeature * references[MAXREF];
/*
 *  Allocate pData->apRefFeature
 */
pData->apRefFeature = references;
for ( i = 0 ; i < MAXREF ; i++ )		/* Clear out references */
	pData->apRefFeature[i] = (PATRFeature *)NULL;

pData->pTopFeature = createPATRNullFeature(pData->pPATR);	/* Clear top */
						/* Load the structure */
pData->pTopFeature = load_feat_struct(pData->pTopFeature, pData->pTopFeature,
					  pData);
pData->apRefFeature = NULL;
return pData->pTopFeature;			/* Return structure */
}

/***************************************************************************
 * NAME
 *    read_atom
 * ARGUMENTS
 *    token - atomic token from the grammar file
 * DESCRIPTION
 *    create an appropriate atomic feature structure,
 *    corresponding to the next atomic token from the grammar file.
 * RETURN VALUE
 *    atomic or default feature structure
 */
static PATRFeature * read_atom( token, pPATR_in )
char *     token;
PATRData * pPATR_in;
{
PATRFeature *tfeat;			/* result feature structure */

if ( *token == '!' )			/* If default atom, marked !atom */
	{
	tfeat = allocPATRFeature(pPATR_in);		/* Allocate space */
	tfeat->eType     = PATR_DEFATOM;	/* Make it default */
					/* Make atom of rest */
	tfeat->u.pszAtom = storedPATRString(token + 1, pPATR_in);
	}
#ifndef hab130v
else if ( *token == '^' &&	/* if indexed variable (^1, ^2, ..., ^9) */
	  *(token+1) >= '1' && *(token+1) <= '9' &&
	  *(token+2) == NUL)
	{
	tfeat = allocPATRFeature(pPATR_in);		/* Allocate space */
	tfeat->eType     = PATR_VARIABLE;	/* Mark it as a variable */
					/* Set the index to digit minus 1 */
	tfeat->u.iVariable = *(token+1) - '1';
	/*
	  NB: this is only valid in logical constraints.
	  How can we notify the user when this is not found within a logical
	  constraint?
	 */
	}
#endif /* hab130v */
else
	tfeat = createPATRAtomFeature(storedPATRString(token, pPATR_in), pPATR_in);
return( tfeat );
}

/*----------------------------------------------------------------------------
 * NAME
 *    read_disjunction
 * DESCRIPTION
 *    Load a disjunction of feature structures from an input file.  It
 *    looks for an open { brace, and loads a set of alternatives up to
 *    the matching close } brace.  It calls itself recursively when it
 *    sees a new open brace coming.
 * RETURN VALUE
 *    list of alternative feature structures from file.  NULL if no more.
 */
static PATRFeatureDisjunction * read_disjunction(pData)
GrammarData *	pData;
{
char			szToken[MAX_TOKEN_SIZE+1];
int			iTokenType;
char			szNextToken[MAX_TOKEN_SIZE+1];
int			iNextTokenType;
PATRFeature *		tfeat;
PATRFeatureDisjunction *	results = NULL;		/* result list */
PATRFeatureDisjunction *	newalt, *newalts;
PATRFeatureDisjunction *	embedded_alts_stack;
StringList *			current_path_stack;
StringList *			current_last_stack;
PATRFeature *		pTopFeature_stack;
PATRFeatureDisjunction *	pFeatDisj;
/*
 *  save path embedding and alternative information before entering a new
 *  scope for each disjunct
 */
embedded_alts_stack    = pData->pEmbeddedAlts;
current_path_stack     = pData->pCurrentPath;
current_last_stack     = pData->pCurrentLast;
pTopFeature_stack = pData->pTopFeature;
/*
 *  Get the next token
 */
iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
if (iTokenType == '{')			/* If at open brace, move past it */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);

while (iTokenType != '}')		/* While next not closing brace */
	{
	if (iTokenType == '[')		/* If nested struct next, read it */
	{
	/* initialize pData->pEmbeddedAlts for this disjunct */
	pData->pEmbeddedAlts = NULL;
	init_current_path(pData);
	tfeat = createPATRNullFeature(pData->pPATR);
	pData->pTopFeature = tfeat;
	tfeat = load_feat_struct( tfeat, tfeat, pData);
	if (pData->pEmbeddedAlts)  /* if there were embedded disjunctions */
		{		   /* unify each alternative with copies of tfeat */
		newalts = unifyPATRDisjuncts(createPATRFeatureDisjunction(tfeat,
								 pData->pPATR),
					 pData->pEmbeddedAlts,
					 pData->pPATR);
		if (newalts == NULL)
		{
		for (	pFeatDisj = pData->pEmbeddedAlts ;
			pFeatDisj ;
			pFeatDisj = pFeatDisj->pNext )
			{
			if (pFeatDisj->pFeature->eType != PATR_ATOM)
			break;
			}
		displayNumberedMessage(&sDisjunctsNotUnified_m,
					   pData->bSilent, pData->bShowWarnings,
					   pData->pLogFP,
					   pData->pszGrammarFilename,
					   pData->uiLineNumber,
					   pFeatDisj ?
					  "" : " (possibly missing brackets)");
		}
		else
		{
		for (newalt = newalts ; newalt->pNext ; newalt = newalt->pNext)
			;		/* set newalt to the last alternative */
		newalt->pNext = results; /* link newalt into the result list */
		results = newalts;
		}
		}
	else
		{
		newalt = createPATRFeatureDisjunction( tfeat, pData->pPATR );
		newalt->pNext = results;	/* link newalt into the result list */
		results = newalt;
		}
	}
	else if (strchr( "]{<>=", iTokenType) != NULL)
		{			/* Else (next disjunct not a bracketed term) */
	iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
	displayNumberedMessage(&sUnexpectedBeforeInPath_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP, pData->pszGrammarFilename,
				   pData->uiLineNumber, szToken[0], szNextToken);
	}
	else
	{
	/*
	 *  link this atomic feature into the result list
	 */
	tfeat        = read_atom( szToken, pData->pPATR );
	newalt       = createPATRFeatureDisjunction( tfeat, pData->pPATR );
	newalt->pNext = results;
	results      = newalt;
	}
	/*
	 *  Get next token for top of loop
	 */
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType == EOF)
		{
		displayNumberedMessage(&sEOFbeforeBrace_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP, pData->pszGrammarFilename,
				   pData->uiLineNumber);
	/* Possible memory leak */
		return( (PATRFeatureDisjunction *)NULL );
	}
	} /* End while */

pData->pEmbeddedAlts = embedded_alts_stack;  /* restore pData->pEmbeddedAlts */
pData->pCurrentPath = current_path_stack;
pData->pCurrentLast = current_last_stack;
pData->pTopFeature = pTopFeature_stack;

return( results );
}

/***************************************************************************
 * NAME
 *    add_path_prefix
 * ARGUMENTS
 *    fs   - a feature structure
 *    path - path at which fs should be embedded
 * DESCRIPTION
 *    Prefix path to fs
 * RETURN VALUE
 *    Resulting feature structure with fs as value of path.
 */
static PATRFeature * add_path_prefix( fs, path, pPATR_in )
PATRFeature * fs;
StringList * path;
PATRData * pPATR_in;
{
PATRFeature *result;
PATRFeature *tfeat;

if (!path)
	return( fs );
result = createPATRNullFeature(pPATR_in);
if( path->pNext )
	tfeat = add_path_prefix( fs, path->pNext, pPATR_in );
else
	tfeat = fs;
/* is path->label guaranteed to be from storedPATRString()? FIXME */
addPATRFeatureToComplex( result,
			 createPATRComplexFeature( path->pszString, tfeat,
						   pPATR_in ) );
return( result );
}

/***************************************************************************
 * NAME
 *    add_embedded_disj
 * ARGUMENTS
 *    disj  - a list of alternative feature structures
 *    path  - path at which disj should be embedded
 *    pGrammar_in - pointer to PATRGrammar structure
 * DESCRIPTION
 *    Add path prefix to each disjunct, then multiply disj into
 *    pData->pEmbeddedAlts.
 * RETURN VALUE
 *    None.
 */
static int add_embedded_disj(disj, path, pData)
PATRFeatureDisjunction * disj;
StringList *		 path;
GrammarData *		 pData;
{
PATRFeature *			tfeat;
PATRFeatureDisjunction *	tfeatd;
/*
 *  Add path prefix to each disjunct
 */
for ( tfeatd = disj ; tfeatd ; tfeatd = tfeatd->pNext )
	{
	tfeat = add_path_prefix( tfeatd->pFeature, path, pData->pPATR );
	tfeatd->pFeature = tfeat;
	}
/*
 *  Multiply disj into pData->pEmbeddedAlts
 */
if ( pData->pEmbeddedAlts )
	{
	tfeatd = unifyPATRDisjuncts(pData->pEmbeddedAlts, disj, pData->pPATR);
	if ( tfeatd )
	pData->pEmbeddedAlts = tfeatd;
	else
	{					/* If fail, give message */
	displayNumberedMessage(&sIncompatibleAlternatives_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber,
				 (path && path->pszString) ? path->pszString : "");
	return( FALSE );
	}
	}
else
	pData->pEmbeddedAlts = disj;

return( TRUE );
}

/*****************************************************************************
 * NAME
 *    makeform
 * ARGUMENTS
 *    name      - Name to put in new element
 *    lhs_uname - Unification name of left hand side
 *    prevelm   - Previous element to link after
 * DESCRIPTION
 *    Make new element and add after previous
 * RETURN VALUE
 *    Return pointer to new element
 */
static ComplexPSR * makeform( name, lhs_uname, prevelm, pData )
char *       name;
char *       lhs_uname;
ComplexPSR * prevelm;
GrammarData *	pData;
{
ComplexPSR *tempelm;           /* Temp formula element */

tempelm = alloc_ComplexPSR(pData);
/* Store element name */
tempelm->pszName = storedPATRString(name, pData->pPATR);
if ( lhs_uname )
	tempelm->pszLhsName = storedPATRString(lhs_uname, pData->pPATR);
else
	tempelm->pszLhsName = NULL;

tempelm->pNext = NULL;           /* Clear link */

if ( prevelm )                  /* If there is a prev */
	{
	tempelm->pNext = prevelm->pNext;  /* Point to same as prev */
	prevelm->pNext = tempelm;        /* Point prev to it */
	}

return ( tempelm );             /* Return new element */
}

/*--------------------------------------------------------------------
 * Description -- Eat any white space and comments at current place,
 *   then read next token.  A token is any string between delimiters,
 *   where delimiters are space, CR, and comments.  Reserved chars
 *   end tokens, and are returned individually as tokens.
 * Return value -- Pointer to token string.  NULL for EOF.
 *
 * Finite state machine of lexical analyzer:
 *
 *                                    isspace
 *                               ,------------>   return token
 *     others (into token)      /    next is reserved (into token)
 *    ,----------------------> b ------------->
 *    |                       /  \ \              return token
 *    |                       `<-'   `-------->
 *    |        others (into token)   '/' & next is '*'
 *    |                                eat comment first
 *    |       reserved char (into token)
 *    |    ,----------------------------------->   return token
 *    |   /
 *    |  /    other (into token) & next is reserved
 *    | / ,----------------------------------------->   return token
 *    |//       '/' & next is '*'
 *    a  ----------------->,  eat comment
 *  /  \  \                 \
 *  `<-'   `<----------------'
 * isspace
 *
 *----------------------------------------------------------------*/

/*****************************************************************************
 * NAME
 *    readCharacter
 * DESCRIPTION
 *    Get character from file or string
 * RETURN VALUE
 *    Character
 */
static int readCharacter(pData)
GrammarData *	pData;
{
int c;

if (pData->pGrammarFP != NULL)
	{
	c = getc( pData->pGrammarFP );
	if (c == '\n')
	++pData->uiLineNumber;
	return( c );
	}
else
	{
	return( EOF );
	}
}

/*****************************************************************************
 * NAME
 *    readNextCharacter
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Show next char from pData->pGrammarFP (get and unget)
 * RETURN VALUE
 *    Next char that will come from readCharacter.
 */
static int readNextCharacter(pData)
GrammarData *	pData;
{
if (pData->pGrammarFP != NULL)
	return( ungetc( getc(pData->pGrammarFP), pData->pGrammarFP));
else
	return( EOF );
}

/*****************************************************************************
 * NAME
 *    skipToEndOfLine
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Eats from pData->pGrammarFP until end of line or EOF.
 * RETURN VALUE
 *    none
 */
static void skipToEndOfLine(pData)
GrammarData *	pData;
{
int c;                      /* Input char */

while ( (c = readCharacter(pData)) != EOF)      /* Protect against EOF */
	if (c == '\n' )                     /* If end of line */
	break;
}

/*****************************************************************************
 * NAME
 *    parsePATRFeaturePath
 * ARGUMENTS
 *    pszFeaturePath_in - string containing a feature path assignment
 * DESCRIPTION
 *    build a feature structure corresponding to the path assignment string
 * RETURN VALUE
 *    pointer to the constructed feature structure, or NULL if error
 */
PATRFeature * parsePATRFeaturePath(pszFeaturePath_in,
				  pGrammar_in, pPATR_in)
char *		pszFeaturePath_in;
PATRGrammar *	pGrammar_in;
PATRData *      pPATR_in;
{
char *endpath, *equals, *tok, *endtok, endch;
PATRFeature *feature, *fnp, *end_fnp, *right_feature;

if (*pszFeaturePath_in != '<')
	return((PATRFeature *)NULL);

endpath = strchr(pszFeaturePath_in, '>');
if (endpath == (char *)NULL)
	{
	displayNumberedMessage(&sUnterminatedFeaturePath_m,
			   pPATR_in->bSilent, pPATR_in->bShowWarnings,
			   pPATR_in->pLogFP, NULL, 0, pszFeaturePath_in);
	return((PATRFeature *)NULL);
	}
equals = strchr(pszFeaturePath_in, '=');
if (equals == (char *)NULL)
	{
	displayNumberedMessage(&sPathWithoutEqual_m,
			   pPATR_in->bSilent, pPATR_in->bShowWarnings,
			   pPATR_in->pLogFP, NULL, 0);
	return((PATRFeature *)NULL);
	}
if (equals < endpath)
	{
	displayNumberedMessage(&sUnexpectedBeforeInPath_m,
			   pPATR_in->bSilent, pPATR_in->bShowWarnings,
			   pPATR_in->pLogFP, NULL, 0, '=', ">");
	return((PATRFeature *)NULL);
	}
for (	tok = pszFeaturePath_in + 1 ;
	*tok && isascii(*tok) && isspace(*tok) ;
	++tok )
	;
if (*tok == '>')
	{
	displayNumberedMessage(&sEmptyPath_m,
			   pPATR_in->bSilent, pPATR_in->bShowWarnings,
			   pPATR_in->pLogFP, NULL, 0, pszFeaturePath_in);
	return((PATRFeature *)NULL);
	}
*endpath = NUL;
fnp = feature = createPATRNullFeature(pPATR_in);
do  {
	for (   endtok = tok ;
		*endtok && !(isascii(*endtok) && isspace(*endtok)) ;
		++endtok )
	;
	endch = *endtok;
	*endtok = NUL;
	fnp->eType = PATR_COMPLEX;
	fnp->u.pComplex = createPATRComplexFeature(storedPATRString(tok, pPATR_in),
						   createPATRNullFeature(pPATR_in),
						   pPATR_in );
	fnp = fnp->u.pComplex->pValue;
	*endtok = endch;
	for ( tok = endtok ; *tok && isascii(*tok) && isspace(*tok) ; ++tok )
	;
	} while (*tok != NUL);
*endpath = '>';
end_fnp = fnp;
for ( tok = equals+1 ; *tok && isascii(*tok) && isspace(*tok) ; ++tok )
	;
if (*tok == '<')
	{
	endpath = strchr(tok, '>');
	if (endpath == (char *)NULL)
	{
	displayNumberedMessage(&sUnterminatedFeaturePath_m,
				   pPATR_in->bSilent, pPATR_in->bShowWarnings,
				   pPATR_in->pLogFP,
				   NULL, 0,
				   pszFeaturePath_in);
	return((PATRFeature *)NULL);
	}
	for ( ++tok ; *tok && isascii(*tok) && isspace(*tok) ; ++tok )
	;
	if (*tok == '>')
	{
	displayNumberedMessage(&sEmptyPath_m,
				   pPATR_in->bSilent, pPATR_in->bShowWarnings,
				   pPATR_in->pLogFP,
				   NULL, 0,
				   pszFeaturePath_in);
	return((PATRFeature *)NULL);
	}
	*endpath = NUL;
	fnp = right_feature = createPATRNullFeature(pPATR_in);
	do  {
	for (	endtok = tok ;
		*endtok && !(isascii(*endtok) && isspace(*endtok)) ;
		++endtok )
		;
	endch = *endtok;
	*endtok = NUL;
	fnp->eType = PATR_COMPLEX;
	fnp->u.pComplex = createPATRComplexFeature(storedPATRString(tok,
									pPATR_in),
						   createPATRNullFeature(pPATR_in),
						   pPATR_in );
	fnp = fnp->u.pComplex->pValue;
	*endtok = endch;
	for ( tok = endtok ; *tok && isascii(*tok) && isspace(*tok) ; ++tok )
		;
	} while (*tok != NUL);
	*endpath = '>';
	if (unifyPATRFeatures(right_feature, feature, FALSE, pPATR_in) == NULL)
	displayNumberedMessage(&sFailureToUnify_m,
				   pPATR_in->bSilent, pPATR_in->bShowWarnings,
				   pPATR_in->pLogFP,
				   NULL, 0,
				   pszFeaturePath_in);
	else if (!verifyAcyclicPATRFeature(right_feature))
	{
	displayNumberedMessage(&sUnificationProducesCycle_m,
				   pPATR_in->bSilent, pPATR_in->bShowWarnings,
				   pPATR_in->pLogFP,
				   NULL, 0);
	}
	else
	{
	end_fnp->eType = PATR_FORWARD;
	end_fnp->u.pForward = fnp;
	}
	}
else
	{
	for (   endtok = tok ;
		*endtok && !(isascii(*endtok) && isspace(*endtok)) ;
		++endtok )
	;
	endch = *endtok;
	*endtok = NUL;
	end_fnp->eType = PATR_ATOM;
	end_fnp->u.pszAtom = storedPATRString(tok, pPATR_in);
	*endtok = endch;
	}
return(feature);
}

/*****************************************************************************
 * NAME
 *    alloc_ComplexPSR
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new ComplexPSR structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new ComplexPSR struct.
 */
static ComplexPSR * alloc_ComplexPSR(pData)
GrammarData *	pData;
{
Alloc_ComplexPSR *f;

f = (Alloc_ComplexPSR *)allocMemory(sizeof(Alloc_ComplexPSR));
++pData->iSizeComplexPSRList;
f->node.pszName    = NULL;
f->node.pszLhsName = NULL;
f->node.pPsrs       = NULL;
f->node.pNext      = NULL;
f->pNext = pData->pComplexPSRList;
pData->pComplexPSRList = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    free_ComplexPSR
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    free the list of ComplexPSR structures
 * RETURN VALUE
 *    none
 */
static void free_ComplexPSR(pData)
GrammarData *	pData;
{
Alloc_ComplexPSR *pACPSR, *nextpACPSR;

for ( pACPSR = pData->pComplexPSRList ; pACPSR ; pACPSR = nextpACPSR )
	{
	nextpACPSR = pACPSR->pNext;
	freeMemory( pACPSR );
	--pData->iSizeComplexPSRList;
	}
pData->pComplexPSRList = NULL;
}

/*****************************************************************************
 * NAME
 *    showComplexPSR
 * ARGUMENTS
 *    text - debug message text
 *    net  - ComplexPSR to display
 * DESCRIPTION
 *    Display current formula for debugging
 * RETURN VALUE
 *    none
 */
static void showComplexPSR( text, net )
char *text;
ComplexPSR *net;
{
ComplexPSR *tnet;

fputs(text, stdout);
for ( tnet = net ; tnet ; tnet = tnet->pNext )	/* For each element */
	fprintf(stdout, "  %s", tnet->pszName);
putc('\n', stdout);
}

/*****************************************************************************
 * NAME
 *    alloc_SimplePSR
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Allocate a new SimplePSR structure, saving a list of same.
 * RETURN VALUE
 *    pointer to new SimplePSR struct.
 */
static SimplePSR * alloc_SimplePSR(pData)
GrammarData *	pData;
{
Alloc_SimplePSR *f;

f = (Alloc_SimplePSR *)allocMemory(sizeof(Alloc_SimplePSR));
++pData->iSizeSimplePSRList;
f->node.pHead  = NULL;
f->node.pTail  = NULL;
f->node.pFeature = NULL;
f->node.pNext  = NULL;
f->pNext = pData->pSimplePSRList;
pData->pSimplePSRList = f;
return( &(f->node) );
}

/*****************************************************************************
 * NAME
 *    free_SimplePSR
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    free the list of SimplePSR structures
 * RETURN VALUE
 *    none
 */
static void free_SimplePSR(pData)
GrammarData *	pData;
{
Alloc_SimplePSR *pASPSR, *nextpASPSR;

for ( pASPSR = pData->pSimplePSRList ; pASPSR ; pASPSR = nextpASPSR )
	{
	nextpASPSR = pASPSR->pNext;
	freeMemory( pASPSR );
	--pData->iSizeSimplePSRList;
	}
pData->pSimplePSRList = NULL;
}

/*----------------------------------------------------------------------------
 * NAME
 *    featureMatchesPSR
 * DESCRIPTION
 *    check whether the toplevel feature nodes match with the SimplePSR
 *    nodes
 * RETURN VALUE
 *    TRUE if the feature match up with the Phrase Structure Rules
 */
static int featureMatchesPSR(pFeature_in, pPSR_in, pData)
PATRFeature *	pFeature_in;
SimplePSR *	pPSR_in;
GrammarData *	pData;
{
PATRFeature *	pFeature;
PATRComplexFeature * pComplexFeature;
PATRNonterminal *	pNonterm;
int		bLabelFound;
int		bMatches;

if ((pFeature_in == NULL) || (pPSR_in == NULL))
	return FALSE;
pFeature = followPATRForwardPointers( pFeature_in );
if (pFeature->eType != PATR_COMPLEX)
	return FALSE;
bMatches = TRUE;
for (	pComplexFeature = pFeature_in->u.pComplex ;
	pComplexFeature ;
	pComplexFeature = pComplexFeature->pNext )
	{
	if (    (pPSR_in->pHead == NULL) &&
		(strcmp(pComplexFeature->pszLabel, pData->szPsrLhsSymbol) == 0) )
	{
	/*
	 *  for empty rules, change the label so that features will work
	 */
	pComplexFeature->pszLabel = pData->psz0;
	bLabelFound               = TRUE;
	}
	else if ((pPSR_in->pHead != NULL) &&
		 (pPSR_in->pHead->pszLhsName != NULL) &&
		(strcmp(pComplexFeature->pszLabel,pPSR_in->pHead->pszLhsName)==0))
	{
	bLabelFound = TRUE;
	}
	else
	{
	bLabelFound = FALSE;
	for (	pNonterm = pPSR_in->pHead ;
		pNonterm ;
		pNonterm = pNonterm->pNext )
		{
		if (strcmp(pComplexFeature->pszLabel, pNonterm->pszName) == 0)
		{
		bLabelFound = TRUE;
		break;
		}
		}
	}
	if (bLabelFound == FALSE)
	{
	bMatches = FALSE;
	strncpy(pData->szUnusedFeatureLabel, pComplexFeature->pszLabel,
		MAX_TOKEN_SIZE);
	pData->szUnusedFeatureLabel[MAX_TOKEN_SIZE] = NUL;
	break;
	}
	}
return bMatches;
}

/*----------------------------------------------------------------------------
 * NAME
 *    readRuleID
 * DESCRIPTION
 *    read the Rule Identification string from the grammar file.  it is
 *    enclosed in braces ({...})
 * RETURN VALUE
 *    none
 */
static void readRuleID(pszBuffer, cbBufferSize, pData)
char *	  pszBuffer;		/* buffer for storing Rule ID string */
unsigned  cbBufferSize;		/* number of chars stored in the buffer */
GrammarData *	pData;
{
unsigned i = 0;
int c;

while ((c = readCharacter(pData)) != EOF)
	{
	if (c == '}')
	break;
	if (i < cbBufferSize)
	pszBuffer[i++] = c;
	}
pszBuffer[i] = NUL;
}

/*----------------------------------------------------------------------------
 * NAME
 *    readToken
 * DESCRIPTION
 *    Eat any white space and comments at current place,
 *    then read next token.
 * RETURN VALUE
 *    token type (EOF for EOF, 0 for error, ...)
 */
static int readToken(pszBuffer, uiBufferSize, pData)
char *		pszBuffer;
unsigned	uiBufferSize;
GrammarData *	pData;
{
int		c;		/* input char */
 int		c2;		/* lookahead input char */
char *		pStore;		/* pointer into pszBuffer for storing chars */
char *		pEnd;		/* pointer to absolute end of pszBuffer */
int		iTokenType;

if ((pszBuffer == NULL) || (uiBufferSize < 2))
	return 0;
pStore = pszBuffer;		/* Set to store at begin token */
pEnd   = pszBuffer + uiBufferSize;
if (pData->bStoredPeriod)
	{
	pData->bStoredPeriod = FALSE;
	*pStore++ = '.';
	goto do_return;
	}
/*
 *  look for the start of a token
 */
while ((c = readCharacter(pData)) != EOF)
	{
	if (isascii(c) && isspace(c))		/* Ignore White space */
	{
	continue;
	}
	if (c == pData->chCommentCharacter)		/* One line comment */
	{
	skipToEndOfLine(pData);
	continue;
	}
	c2 = readNextCharacter(pData);
	if ((c == '-') && (c2 == '>'))
	{
	*pStore++ = c;
	*pStore++ = readCharacter(pData);
	goto do_return;		/* Return token */
	}
	if ((c == '=') && (c2 == '>'))
	{
	*pStore++ = c;
	*pStore++ = readCharacter(pData);
	goto do_return;		/* Return token */
	}
	if ((pData->eTokenizeMode == kExpressionToken) &&
		 (	(c == '&') || (c == '~') ) )
	{
	*pStore++ = c;
	goto do_return;		/* Return token */
	}
	if ((c == '<') && (c2 == '='))
	{
	*pStore++ = c;
	*pStore++ = readCharacter(pData);
	goto do_return;		/* Return token */
	}
	if ((c == '=') && (c2 == '='))
	{
	*pStore++ = c;
	*pStore++ = readCharacter(pData);
	goto do_return;		/* Return token */
	}
	if ((c == '<') && (c2 == '-'))
	{
	*pStore++ = c;
	*pStore++ = readCharacter(pData);
	if (readNextCharacter(pData) == '>')
		*pStore++ = readCharacter(pData);
	goto do_return;		/* Return token */
	}
	if ((strchr(pData->pszReservedChars, c) != NULL) ||
	(strchr(pData->pszReservedChars, c2) != NULL) )
	{
	/*
	 *  If reserved char or next res
	 */
	*pStore++ = c;		/* Store in token */
	goto do_return;		/* Return token */
	}
	if (c == '.')
	{
	*pStore++ = c;		/* Store in token */
	goto do_return;		/* Return token */
	}
	else			/* Start of token */
	{
	*pStore++ = c;		/* Store in token */
	break;
	}
	}
if (c == EOF)
	{
	*pStore++ = NUL;
	if (pData->iDebugLevel >= 8)
	fprintf(stdout, "DEBUG readToken() => EOF\t\t\"\"\n");
	return( EOF );		/* end of file */
	}
/*
 *  store the rest of token
 */
while ((c = readCharacter(pData)) != EOF)
	{
	if (isascii(c) && isspace(c))
	{				/* whitespace */
	break;				/* return token */
	}
	if (c == pData->chCommentCharacter)
	{				/* One line comment */
	skipToEndOfLine(pData);		/* Eat rest of comment */
	break;				/* Return token */
	}
	c2 = readNextCharacter(pData);
	if (strchr(pData->pszReservedChars, c2) != NULL)
	{				/* If next resv */
	if (pStore < pEnd)
		*pStore++ = c;		/* Store in token */
	break;				/* Return token */
	}
	if ((c == '.') && ((isascii(c2) && isspace(c2)) || c2 == EOF))
	{
	pData->bStoredPeriod = TRUE;	/* store token for next call */
	break;
	}
	else if (pStore < pEnd)		/* If not overflow */
	{
	*pStore++ = c;			/* Store in token */
	}
	}

do_return:
*pStore++ = NUL;			/* Terminate token */
if ((pszBuffer[1] == NUL) &&
	(strchr(pData->pszReservedChars, pszBuffer[0]) != NULL))
	{
	iTokenType = pszBuffer[0];
	}
else if (strcmp(pszBuffer, szPeriod_m) == 0)
	{
	iTokenType = pszBuffer[0];
	}
else if (strcmp(pszBuffer, "->") == 0)
	{
	iTokenType = BECOMES_TOKEN;
	}
else if (strcmp(pszBuffer, "=>") == 0)
	{
	iTokenType = REPLACE_TOKEN;
	}
else if ((pData->eTokenizeMode == kExpressionToken) &&
	 (	(strcmp(pszBuffer, "&") == 0) ||
		(strcmp(pszBuffer, "~") == 0) ) )
	{
	iTokenType = pszBuffer[0];
	}
else if (strcmp(pszBuffer, "<=") == 0)
	{
	iTokenType = PRIORITYUNION_TOKEN;
	}
else if (strcmp(pszBuffer, "==") == 0)
	{
	iTokenType = CONSTRAINT_TOKEN;
	}
else if (strcmp(pszBuffer, "<->") == 0)
	{
	iTokenType = BICONDITIONAL_TOKEN;
	}
else if ((strcasecmp(pszBuffer, "let")          == 0) ||
	 (strcasecmp(pszBuffer, "\\let")        == 0) ||
	 (strcasecmp(pszBuffer, "rule")         == 0) ||
	 (strcasecmp(pszBuffer, "\\rule")       == 0) ||
	 (strcasecmp(pszBuffer, "parameter")    == 0) ||
	 (strcasecmp(pszBuffer, "\\parameter")  == 0) ||
	 (strcasecmp(pszBuffer, "constraint")   == 0) ||
	 (strcasecmp(pszBuffer, "\\constraint") == 0) ||
	 (strcasecmp(pszBuffer, "define")       == 0) ||
	 (strcasecmp(pszBuffer, "\\define")     == 0) ||
	 (strcasecmp(pszBuffer, "lexicon")      == 0) ||
	 (strcasecmp(pszBuffer, "\\lexicon")    == 0) ||
	 (  (pData->eTokenizeMode == kLexiconToken) &&
		(    (strcasecmp(pszBuffer, "word")   == 0) ||
		 (strcasecmp(pszBuffer, "\\word") == 0) ) ) ||
	 (strcasecmp(pszBuffer, "end")          == 0) ||
	 (strcasecmp(pszBuffer, "\\end")        == 0) ||
	 (strcasecmp(pszBuffer, "comment")      == 0) ||
	 (strcasecmp(pszBuffer, "\\comment")    == 0) ||
	 (strcasecmp(pszBuffer, "\\co")         == 0) )
	{
	iTokenType = KEYWORD_TOKEN;
	}
else
	{
	iTokenType = SYMBOL_TOKEN;
	}
/*
 *  switch the context sensitive tokenize mode appropriately
 */
if (	(iTokenType == CONSTRAINT_TOKEN) ||
	(strcasecmp(pszBuffer, "constraint") == 0) ||
	(strcasecmp(pszBuffer, "\\constraint") == 0) )
	pData->eTokenizeMode = kExpressionToken;
else if ((strcasecmp(pszBuffer, "lexicon") == 0) ||
	 (strcasecmp(pszBuffer, "\\lexicon") == 0) )
	pData->eTokenizeMode = kLexiconToken;
else if ((iTokenType == KEYWORD_TOKEN) &&
	 (  (strcasecmp(pszBuffer, "word") == 0) ||
		(strcasecmp(pszBuffer, "\\word") == 0) ) )
	pData->eTokenizeMode = kLexiconToken;	/* (stays the same) */
else if (iTokenType == KEYWORD_TOKEN)
	pData->eTokenizeMode = kNormalToken;
if (pData->iDebugLevel >= 8)
	{
	fprintf(stdout, "DEBUG readToken() => ");
	switch (iTokenType)
	{
	case BECOMES_TOKEN:
		fprintf(stdout, "BECOMES_TOKEN (aka CONDITIONAL_TOKEN)");
		break;
	case KEYWORD_TOKEN:
		fprintf(stdout, "KEYWORD_TOKEN");
		break;
	case SYMBOL_TOKEN:
		fprintf(stdout, "SYMBOL_TOKEN");
		break;
	case PRIORITYUNION_TOKEN:
		fprintf(stdout, "PRIORITYUNION_TOKEN");
		break;
	case CONSTRAINT_TOKEN:
		fprintf(stdout, "CONSTRAINT_TOKEN");
		break;
	case BICONDITIONAL_TOKEN:
		fprintf(stdout, "BICONDITIONAL_TOKEN");
		break;
	default:
		fprintf(stdout, "'%c'\t", iTokenType);
		break;
	}
	fprintf(stdout, "\t\"%s\"\n", pszBuffer);
	}
return( iTokenType );
}

/*----------------------------------------------------------------------------
 * NAME
 *    getToken
 * DESCRIPTION
 *    Eat any white space and comments at current place,
 *    then read next token.
 * RETURN VALUE
 *    token type (EOF for EOF)
 */
static int getToken(pszBuffer, uiBufferSize, pData)
char *		pszBuffer;
unsigned	uiBufferSize;
GrammarData *	pData;
{
int	iTokenType;

if ((pszBuffer == NULL) || (uiBufferSize == 0))
	return 0;
else if (pData->iNextTokenType)		/* If next token has been read */
	{					/* Bring token from next */
	strncpy(pszBuffer, pData->szNextToken, uiBufferSize);
	pszBuffer[uiBufferSize] = NUL;
	iTokenType = pData->iNextTokenType;
	pData->iNextTokenType = 0;
	return iTokenType;
	}
else
	return readToken(pszBuffer, uiBufferSize, pData);
}

/*----------------------------------------------------------------------------
 * NAME
 *    getNextToken
 * DESCRIPTION
 *    Gets next token without moving past it.  This is
 *    useful for routines that want to look ahead.
 * RETURN VALUE
 *    token type (EOF for EOF)
 */
static int getNextToken(pszBuffer, uiBufferSize, pData)
char *		pszBuffer;
unsigned	uiBufferSize;
GrammarData *	pData;
{
if ((pszBuffer == NULL) || (uiBufferSize == 0))
	return 0;
else if (pData->iNextTokenType == 0)
	{				/* read next token and store it */
	pData->iNextTokenType = readToken(pData->szNextToken, MAX_TOKEN_SIZE,
					  pData);
	}
strncpy(pszBuffer, pData->szNextToken, uiBufferSize);
pszBuffer[uiBufferSize] = NUL;
return pData->iNextTokenType;
}

/*****************************************************************************
 * NAME
 *    showPATRDefinitions
 * DESCRIPTION
 *    write the PATRDefinition list to stdout for debugging
 * RETURN VALUE
 *    none
 */
static void showPATRDefinitions(pGrammar_in, pPATR_in)
PATRGrammar *	pGrammar_in;
PATRData *	pPATR_in;
{
PATRDefinition *		pDef;
PATRFeatureDisjunction *	tfeatd;
PATRFeature *			pFeat;
PATRLexicalRule *		pLex;

fprintf(stdout,  "PATRDefinition list:\n" );
for ( pDef = pGrammar_in->pDefinitionTable ; pDef ; pDef = pDef->pNext )
	{
	fprintf(stdout,  "%s", pDef->pszName);
	switch (pDef->eType)
	{
	case PATR_TEMPLATE:
		fprintf(stdout, "    (Template)\n");
		for (tfeatd = pDef->u.pFeatDisj ; tfeatd ; tfeatd = tfeatd->pNext)
		{
		fprintf(stdout, "    feat = ");
		writePATRFeatureToLog(tfeatd->pFeature, 12, FALSE, pPATR_in);
		}
		fprintf(stdout, "\n");
		break;

	case PATR_LEXICAL_RULE:
		fprintf(stdout, "    (Lexical Rule)\n");
		for ( pLex = pDef->u.pLexRule ; pLex ; pLex = pLex->pNext )
		{
		fprintf(stdout, "        <out");
		for (	pFeat = pLex->pOutFeat ;
			pFeat && pFeat->eType == PATR_COMPLEX ;
			pFeat = pFeat->u.pComplex->pValue )
			fprintf(stdout, " %s", pFeat->u.pComplex->pszLabel );
		fprintf(stdout, "> = ");
		if (pLex->pInFeat->eType == PATR_ATOM)
			{
			fprintf(stdout, "%s\n", pLex->pInFeat->u.pszAtom);
			}
		else
			{
			fprintf(stdout, "<in");
			for (   pFeat = pLex->pInFeat ;
				pFeat && pFeat->eType == PATR_COMPLEX ;
				pFeat = pFeat->u.pComplex->pValue )
			fprintf(stdout, " %s", pFeat->u.pComplex->pszLabel );
			fprintf(stdout, ">\n");
			}
		}
		fprintf(stdout, "\n");
		break;

	case PATR_CONSTRAINT:
		fprintf(stdout, "    (Constraint)\n");
		writePATRLogicalExpression(pDef->u.pExpression, pPATR_in, stdout);
		fprintf(stdout, "\n\n");
		break;

	default:
		fprintf(stdout, "    BOGUS!!!\n\n");
		break;
	}
	}
}

/*----------------------------------------------------------------------------
 * NAME
 *    showRules
 * DESCRIPTION
 *    write the Rule list to stdout for debugging
 * RETURN VALUE
 *    none
 */
static void showRules(pGrammar_in, pPATR_in)
PATRGrammar *	pGrammar_in;
PATRData *	pPATR_in;
{
PATRRuleList *	pRuleList;
PATRRule *		pRule;
PATRNonterminal *	pNonterm;
PATRPriorityUnion *	pPri;
PATRConstraint *	pCon;

fprintf(stdout,  "\nRule list:\n" );
for (	pRuleList = pGrammar_in->pRuleTable ;
	pRuleList ;
	pRuleList = pRuleList->pNext)
	{
	pRule = pRuleList->pRule;
	fprintf(stdout, "Rule {%s} (line %d) has %d nonterms\n",
	   pRule->pszID ? pRule->pszID : "",
	   pRule->iLineNumber, pRule->iNontermCount);
	showPATRRule(pRule);
	fprintf(stdout, "%s ->", pRule->pszLHS);
	for ( pNonterm = pRule->pRHS ; pNonterm ; pNonterm = pNonterm->pNext )
	if (pNonterm->bOptional) {
		fprintf(stdout, "  (%s(%s))", pNonterm->pszName, pNonterm->pszLhsName);
	} else {
		fprintf(stdout, "  %s(%s)", pNonterm->pszName, pNonterm->pszLhsName);
	}
	fprintf(stdout, "\nUnifications feature:   (%p)\n", (void *)pRule->pUniFeature);
	writePATRFeatureToLog(pRule->pUniFeature, 0, FALSE, pPATR_in);
	fprintf(stdout, "\n");
	fprintf(stdout, "Priority union operations:\n");
	for ( pPri = pRule->pPriorityUnions ; pPri ; pPri = pPri->pNext )
	writePATRPriorityUnion(pPri, stdout);
	fprintf(stdout, "\n\nLogical constraint expressions:\n");
	for ( pCon = pRule->pConstraints ; pCon ; pCon = pCon->pNext )
	writePATRConstraint(pCon, pPATR_in, stdout);
	fprintf(stdout, "\n\n");
	}
fprintf(stdout, "\n");
}

/*----------------------------------------------------------------------------
 * NAME
 *    showHashTables
 * DESCRIPTION
 *    write the hash tables to stdout for debugging
 * RETURN VALUE
 *    none
 */
static void showHashTables(pGrammar_in)
PATRGrammar *	pGrammar_in;
{
int i;
PATRHashList *	pHL;
PATRRuleList *	pRL;
PATRRule *		pR;
StringList *	pNTL;
PATRNonterminal *	pN;

fprintf(stdout,  "\nLC hash table:\n" );
for ( i = 0 ; i < PATR_HASH_SIZE ; ++i )
	{
	if (pGrammar_in->aLeftCorners[i] != NULL)
	{
	fprintf(stdout, "\taLeftCorners[%d]\n", i);
	for ( pHL = pGrammar_in->aLeftCorners[i] ; pHL ; pHL = pHL->pNext )
		{
		fprintf(stdout, "\t\tkey = \"%s\" =>", pHL->pszKey);
		for ( pRL = (PATRRuleList *)pHL->pData ; pRL ; pRL = pRL->pNext )
		{
		pR = pRL->pRule;
		fprintf(stdout, "\n\t\t\tRule {%s} (line %d):  %s  ->",
			   pR->pszID ? pR->pszID:"", pR->iLineNumber, pR->pszLHS);
		for ( pN = pR->pRHS ; pN ; pN = pN->pNext )
			if (pN->bOptional) {
				fprintf(stdout, "  (%s)", pN->pszName);
			} else {
				fprintf(stdout, "  %s", pN->pszName);
			}
		}
		fprintf(stdout, "\n");
		}
	}
	}
fprintf(stdout,  "\nFirst hash table:\n" );
for ( i = 0 ; i < PATR_HASH_SIZE ; ++i )
	{
	if (pGrammar_in->aFirsts[i] != NULL)
	{
	fprintf(stdout, "\taFirsts[%d]\n", i);
	for ( pHL = pGrammar_in->aFirsts[i] ; pHL ; pHL = pHL->pNext )
		{
		fprintf(stdout, "\t\tkey = \"%s\" =>", pHL->pszKey);
		for ( pNTL = (StringList *)pHL->pData ; pNTL ; pNTL = pNTL->pNext )
		fprintf(stdout, "  %s", pNTL->pszString);
		fprintf(stdout, "\n");
		}
	}
	}
fprintf(stdout,  "\nFirst Inverse hash table:\n" );
for ( i = 0 ; i < PATR_HASH_SIZE ; ++i )
	{
	if (pGrammar_in->aFirstInverses[i] != NULL)
	{
	fprintf(stdout, "\taFirstInverses[%d]\n", i);
	for ( pHL = pGrammar_in->aFirstInverses[i] ; pHL ; pHL = pHL->pNext )
		{
		fprintf(stdout, "\t\tkey = \"%s\" =>", pHL->pszKey);
		for ( pNTL = (StringList *)pHL->pData ; pNTL ; pNTL = pNTL->pNext )
		fprintf(stdout, "  %s", pNTL->pszString);
		fprintf(stdout, "\n");
		}
	}
	}
fprintf(stdout, "\n");
}

/*----------------------------------------------------------------------------
 * NAME
 *    copyPartialDisjunction
 * DESCRIPTION
 *    copy the old PATRFeatureDisjunction until the next node is the given
 *    tail, or NULL
 * RETURN VALUE
 *    pointer to the new (partial) copy of the old list of Features
 *    (disjunction)
 */
static PATRFeatureDisjunction * copyPartialDisjunction(pList_in, pTail_in,
							   pPATR_in)
PATRFeatureDisjunction * pList_in;
PATRFeatureDisjunction * pTail_in;
PATRData * pPATR_in;
{
PATRFeatureDisjunction *pNewListHead;
PATRFeatureDisjunction *pNewListTail;
PATRFeatureDisjunction *pNewDisj;
PATRFeatureDisjunction *pDisj;

pNewListHead = NULL;
pNewListTail = NULL;
for ( pDisj = pList_in ; pDisj != pTail_in ; pDisj = pDisj->pNext )
	{
	if (pDisj == NULL)
	break;
	pNewDisj = (PATRFeatureDisjunction *)allocMemory(
						   sizeof(PATRFeatureDisjunction));
	pNewDisj->pNext = NULL;
	pNewDisj->pFeature = copyPATRFeature( pDisj->pFeature, pPATR_in );
	if (pNewListHead == NULL)
	pNewListHead = pNewDisj;
	else
	pNewListTail->pNext = pNewDisj;
	pNewListTail = pNewDisj;
	}
return( pNewListHead );
}

/*****************************************************************************
 * NAME
 *    strappend
 * ARGUMENTS
 *    t - String to append onto
 *    s - String to append
 * DESCRIPTION
 *    Append string s onto string t
 * RETURN VALUE
 *    Return pointer to appended strings
 */
static char * strappend( t, s, pPATR_in )
char *     t;
char *     s;
PATRData * pPATR_in;
{
char * pszNew;
char * pszTemp;
#ifdef HAVE_ALLOCA
pszTemp = (char *)alloca( (unsigned)(strlen( t ) + strlen( s ) + 1 ));
#else
pszTemp = (char *)allocateMemory( (unsigned)(strlen( t ) + strlen( s ) + 1 ));
#endif
strcat( strcpy (pszTemp, t), s );
pszNew = storedPATRString(pszTemp, pPATR_in);
#ifndef HAVE_ALLOCA
freeMemory( pszTemp );
#endif
return( pszNew );
}

/*****************************************************************************
 * NAME
 *    loadPriorityUnion
 * DESCRIPTION
 *    create a priority union operation and add it to the end of the ordered
 *    list of priority union operations
 * RETURN VALUE
 *    pointer to the ordered list of priority union operations (the same as
 *    pPriorityUnions_in if that argument is not NULL)
 */
static PATRPriorityUnion * loadPriorityUnion(pPriorityUnions_in, pLeftPath_in,
						 pData)
PATRPriorityUnion * pPriorityUnions_in;
StringList *        pLeftPath_in;
GrammarData *	pData;
{
PATRPriorityUnion * pNewUnion;
PATRPriorityUnion * pUnion;
PATRFeature *	    pRightFS   = NULL;
StringList *	    pRightPath = NULL;
char		    szToken[MAX_TOKEN_SIZE+1];
int		    iTokenType;
char	            szNextToken[MAX_TOKEN_SIZE+1];
int	            iNextTokenType;

iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
if (iTokenType == '<')
	{
	/*
	 *  If next is path, move to first thing on path
	 */
	iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
	if (iNextTokenType == '>')		/* If empty path, refuse it */
	{
	displayNumberedMessage(&sEmptyPath_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber, "");
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	return pPriorityUnions_in;
	}
	pData->bFirstSymbol = TRUE;
	pData->pReadingPath = NULL;
	pRightFS = createPATRNullFeature(pData->pPATR);  /* Start with a null fs */
	read_find_or_create(pRightFS, pData);
	pRightPath = copy_path( pData->pReadingPath, pData );
	}
else if (iTokenType == '[')
	{
	displayNumberedMessage(&sNoPriorityUnionComplexFeature_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "");
	do	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	} while (iTokenType != ']');
	return pPriorityUnions_in;
	}
else if (iTokenType == '{')
	{
	displayNumberedMessage(&sNoPriorityUnionDisjunction_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber, "");
	do	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	} while (iTokenType != '}');
	return pPriorityUnions_in;
	}
else
	{
	if (szToken[0] == '!')		/* If default atom (marked !atom) */
	{
	displayNumberedMessage(&sNoPriorityUnionDefaultAtom_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP, pData->pszGrammarFilename,
				   pData->uiLineNumber, "");
	return pPriorityUnions_in;
	}
	else
	{
	/* Start with a null fs */
	pRightFS = createPATRNullFeature(pData->pPATR);
	pRightFS->eType = PATR_ATOM;	/* Make left have it as an atom */
	pRightFS->u.pszAtom = storedPATRString(szToken, pData->pPATR);
	}
	}
pNewUnion = ((PATRPriorityUnion *)allocMemory(sizeof(PATRPriorityUnion)));
pNewUnion->pOutputPath = pLeftPath_in;
if (pRightPath != NULL)
	{
	pNewUnion->pInputPath = pRightPath;
	pNewUnion->pInputAtom = NULL;
	}
else
	{
	pNewUnion->pInputPath = NULL;
	pNewUnion->pInputAtom = storePATRFeature( pRightFS, pData->pPATR );
	}
pNewUnion->pNext   = NULL;
if (pPriorityUnions_in == NULL)
	pPriorityUnions_in = pNewUnion;
else
	{
	for (pUnion = pPriorityUnions_in ; pUnion->pNext ; pUnion = pUnion->pNext)
	;
	pUnion->pNext = pNewUnion;
	}
return pPriorityUnions_in;
}

/*****************************************************************************
 * NAME
 *    freePriorityUnions
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void freePriorityUnions(pPriorityUnions_in, pPATR_in)
PATRPriorityUnion * pPriorityUnions_in;
PATRData * pPATR_in;
{
PATRPriorityUnion * pUnion;
PATRPriorityUnion * pNextUnion;

for ( pUnion = pPriorityUnions_in ; pUnion ; pUnion = pNextUnion )
	{
	pNextUnion = pUnion->pNext;
	if (pUnion->pInputAtom)
	freePATRFeature( pUnion->pInputAtom, pPATR_in );
	freeMemory( pUnion );
	}
}

/*****************************************************************************
 * NAME
 *    storePriorityUnions
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void storePriorityUnions(pPriorityUnions_in, pGrammar_in)
PATRPriorityUnion * pPriorityUnions_in;
PATRGrammar *       pGrammar_in;
{
unsigned	i;

if ((pPriorityUnions_in == NULL) || (pGrammar_in == NULL))
	return;
if (pGrammar_in->apPriorityUnions == NULL)
	{
	pGrammar_in->apPriorityUnions = (PATRPriorityUnion **)allocMemory(
						  2 * sizeof(PATRPriorityUnion *));
	pGrammar_in->apPriorityUnions[0] = pPriorityUnions_in;
	pGrammar_in->apPriorityUnions[1] = NULL;
	return;
	}
for ( i = 0 ; pGrammar_in->apPriorityUnions[i] ; ++i )
	;
pGrammar_in->apPriorityUnions = (PATRPriorityUnion **)reallocMemory(
					pGrammar_in->apPriorityUnions,
						(i + 2) * sizeof(PATRPriorityUnion *));
pGrammar_in->apPriorityUnions[i++] = pPriorityUnions_in;
pGrammar_in->apPriorityUnions[i]   = NULL;
}

/*****************************************************************************
 * NAME
 *    loadPATRLogicalExpression
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
static PATRLogicalExpression * loadPATRLogicalExpression(pData)
GrammarData * pData;
{
char                    szToken[MAX_TOKEN_SIZE+1];
int                     iTokenType;
char                    szNextToken[MAX_TOKEN_SIZE+1];
int                     iNextTokenType;
PATRLogicalFactor       sLeftFactor;
PATRLogicalFactor       sRightFactor;
PATRLogicalExpression   sExpression;
PATRLogicalExpression * pExpression;
int                     bLeftNot  = FALSE;
int                     bRightNot = FALSE;

memset(&sLeftFactor,  0, sizeof(sLeftFactor));
memset(&sRightFactor, 0, sizeof(sRightFactor));
/*
 *  read the left (or only) logical factor
 */
iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
if (iTokenType == '~')
	{
	bLeftNot   = TRUE;
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	}
if (iTokenType == '(')
	{
	sLeftFactor.eType         = kExpression;
	sLeftFactor.u.pExpression = loadPATRLogicalExpression(pData);
	if (sLeftFactor.u.pExpression == NULL)
	return NULL;
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType != ')')
	{
	freePATRLogicalExpression(sLeftFactor.u.pExpression, pData->pPATR);
	displayNumberedMessage(&sNoConstraintCloseParen_m,
				   pData->bSilent, pData->bShowWarnings,
				   pData->pLogFP,
				   pData->pszGrammarFilename,
				   pData->uiLineNumber,
				   "");
	return NULL;
	}
	}
else if (iTokenType == '[')
	{
	sLeftFactor.eType      = kFeature;
	sLeftFactor.u.pFeature = read_feat_struct(pData);
	if (sLeftFactor.u.pFeature == NULL)
	{
	}
	}
else if (iTokenType == '<')
	{
	displayNumberedMessage(&sNoConstraintPath_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "");
	do	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	} while (iTokenType != '>');
	return NULL;
	}
else if (iTokenType == '{')
	{
	displayNumberedMessage(&sNoConstraintDisjunction_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "");
	do	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	} while (iTokenType != '}');
	return NULL;
	}
else
	{
	/* error */
	displayNumberedMessage(&sNoConstraintAtom_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber, "");
	return NULL;
	}
/*
 *  check the next token for a binary operator
 */
iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
switch (iNextTokenType)
	{
	case CONDITIONAL_TOKEN:		/*  -> */
	sExpression.eOperation = kConditional;
	break;
	case BICONDITIONAL_TOKEN:		/* <-> */
	sExpression.eOperation = kBiconditional;
	break;
	case '&':
	sExpression.eOperation = kAnd;
	break;
	case '/':
	sExpression.eOperation = kOr;
	break;
	default:
	/*
	 *  must be a unary operation
	 */
	if ((sLeftFactor.eType == kExpression) && !bLeftNot)
		return sLeftFactor.u.pExpression;
	/*
	 *  need to build a logical expression data structure
	 */
	pExpression = ((PATRLogicalExpression *)allocMemory(
						   sizeof(PATRLogicalExpression)));
	pExpression->eOperation = bLeftNot ? kNegate : kExist;
	pExpression->pLeft      = ((PATRLogicalFactor *)allocMemory(
						   sizeof(PATRLogicalFactor)));
	pExpression->pLeft->eType = sLeftFactor.eType;
	if (sLeftFactor.eType == kFeature)
		pExpression->pLeft->u.pFeature = storePATRFeature(
													   sLeftFactor.u.pFeature,
							   pData->pPATR);
	else
		pExpression->pLeft->u.pExpression = sLeftFactor.u.pExpression;
	pExpression->pRight = NULL;
	return pExpression;
	}
/*
 *  move past the binary operator token
 */
iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
/*
 *  read the right logical factor
 */
iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
if (iTokenType == '~')
	{
	bRightNot   = TRUE;
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	}
if (iTokenType == '(')
	{
	sRightFactor.eType         = kExpression;
	sRightFactor.u.pExpression = loadPATRLogicalExpression(pData);
	if (sRightFactor.u.pExpression == NULL)
	{
	if (sLeftFactor.eType == kExpression)
		freePATRLogicalExpression(sLeftFactor.u.pExpression, pData->pPATR);
	return NULL;
	}
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	if (iTokenType != ')')
	{
	if (sLeftFactor.eType == kExpression)
		freePATRLogicalExpression(sLeftFactor.u.pExpression, pData->pPATR);
	freePATRLogicalExpression(sRightFactor.u.pExpression, pData->pPATR);
	displayNumberedMessage(&sNoConstraintCloseParen_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber, "");
	return NULL;
	}
	}
else if (iTokenType == '[')
	{
	sRightFactor.eType      = kFeature;
	sRightFactor.u.pFeature = read_feat_struct(pData);
	if (sRightFactor.u.pFeature == NULL)
	{
	if (sLeftFactor.eType == kExpression)
		freePATRLogicalExpression(sLeftFactor.u.pExpression, pData->pPATR);
	return NULL;
	}
	}
else if (iTokenType == '<')
	{
	if (sLeftFactor.eType == kExpression)
	freePATRLogicalExpression(sLeftFactor.u.pExpression, pData->pPATR);
	displayNumberedMessage(&sNoConstraintPath_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber, "");
	do	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	} while (iTokenType != '>');
	return NULL;
	}
else if (iTokenType == '{')
	{
	if (sLeftFactor.eType == kExpression)
	freePATRLogicalExpression(sLeftFactor.u.pExpression, pData->pPATR);
	displayNumberedMessage(&sNoConstraintDisjunction_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber, "");
	do	{
	iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
	} while (iTokenType != '}');
	return NULL;
	}
else
	{
	if (sLeftFactor.eType == kExpression)
	freePATRLogicalExpression(sLeftFactor.u.pExpression, pData->pPATR);
	displayNumberedMessage(&sNoConstraintAtom_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber, "");
	return NULL;
	}
/*
 *  put together the logical expression and return it
 */
pExpression = ((PATRLogicalExpression *)allocMemory(
						   sizeof(PATRLogicalExpression)));
pExpression->eOperation = sExpression.eOperation;
if (bLeftNot)
	{
	pExpression->pLeft = ((PATRLogicalFactor *)allocMemory(
						   sizeof(PATRLogicalFactor)));
	pExpression->pLeft->eType = kExpression;
	pExpression->pLeft->u.pExpression = ((PATRLogicalExpression *)allocMemory(
						   sizeof(PATRLogicalExpression)));
	pExpression->pLeft->u.pExpression->eOperation = kNegate;
	pExpression->pLeft->u.pExpression->pLeft      = ((PATRLogicalFactor *)
					   allocMemory(sizeof(PATRLogicalFactor)));
	pExpression->pLeft->u.pExpression->pLeft->eType = sLeftFactor.eType;
	if (sLeftFactor.eType == kFeature)
	pExpression->pLeft->u.pExpression->pLeft->u.pFeature =
									  storePATRFeature(sLeftFactor.u.pFeature,
							   pData->pPATR);
	else
	pExpression->pLeft->u.pExpression->pLeft->u.pExpression =
													 sLeftFactor.u.pExpression;
	pExpression->pLeft->u.pExpression->pRight = NULL;
	}
else
	{
	pExpression->pLeft = ((PATRLogicalFactor *)allocMemory(
						   sizeof(PATRLogicalFactor)));
	pExpression->pLeft->eType = sLeftFactor.eType;
	if (sLeftFactor.eType == kFeature)
	pExpression->pLeft->u.pFeature = storePATRFeature(
													   sLeftFactor.u.pFeature,
							   pData->pPATR);
	else
	pExpression->pLeft->u.pExpression = sLeftFactor.u.pExpression;
	}
if (bRightNot)
	{
	pExpression->pRight = ((PATRLogicalFactor *)allocMemory(
						   sizeof(PATRLogicalFactor)));
	pExpression->pRight->eType = kExpression;
	pExpression->pRight->u.pExpression = ((PATRLogicalExpression *)allocMemory(
						   sizeof(PATRLogicalExpression)));
	pExpression->pRight->u.pExpression->eOperation = kNegate;
	pExpression->pRight->u.pExpression->pLeft      = ((PATRLogicalFactor *)
					   allocMemory(sizeof(PATRLogicalFactor)));
	pExpression->pRight->u.pExpression->pLeft->eType = sRightFactor.eType;
	if (sRightFactor.eType == kFeature)
	pExpression->pRight->u.pExpression->pLeft->u.pFeature =
									 storePATRFeature(sRightFactor.u.pFeature,
							  pData->pPATR);
	else
	pExpression->pRight->u.pExpression->pLeft->u.pExpression =
													sRightFactor.u.pExpression;
	pExpression->pRight->u.pExpression->pRight = NULL;
	}
else
	{
	pExpression->pRight = ((PATRLogicalFactor *)allocMemory(
						   sizeof(PATRLogicalFactor)));
	pExpression->pRight->eType = sRightFactor.eType;
	if (sRightFactor.eType == kFeature)
	pExpression->pRight->u.pFeature = storePATRFeature(
													  sRightFactor.u.pFeature,
							  pData->pPATR);
	else
	pExpression->pRight->u.pExpression = sRightFactor.u.pExpression;
	}

return pExpression;
}

/*****************************************************************************
 * NAME
 *    loadLogicalConstraint
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
static PATRConstraint *	loadLogicalConstraint(pConstraints_in, pLeftPath_in,
						  pData)
PATRConstraint * pConstraints_in;
StringList *     pLeftPath_in;
GrammarData *	pData;
{
PATRConstraint *        pNewConstraint;
PATRConstraint *        pConstraint;
PATRLogicalExpression * pExpression = NULL;
char                    szNextToken[MAX_TOKEN_SIZE+1];
int                     iNextTokenType;
PATRDefinition *        pDef;

iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
if ((iNextTokenType == SYMBOL_TOKEN) || (iNextTokenType == KEYWORD_TOKEN))
	{
	pDef = findPATRDefinition(szNextToken, pData->pGrammar);
	if ((pDef != NULL) && (pDef->eType == PATR_CONSTRAINT))
	{
	pExpression = copyPATRLogicalExpression(pDef->u.pExpression,
						pData->pPATR);
	/* consume token */
	getToken(szNextToken, MAX_TOKEN_SIZE, pData);
	}
	}
if (pExpression == NULL)
	pExpression = loadPATRLogicalExpression(pData);
if (pExpression != NULL)
	{
	pNewConstraint = ((PATRConstraint *)allocMemory(sizeof(PATRConstraint)));
	pNewConstraint->pPath       = pLeftPath_in;
	pNewConstraint->pExpression = pExpression;
	pNewConstraint->pNext       = NULL;
	if (pConstraints_in == NULL)
	pConstraints_in = pNewConstraint;
	else
	{
	for (	pConstraint = pConstraints_in ;
		pConstraint->pNext ;
		pConstraint = pConstraint->pNext )
		;
	pConstraint->pNext = pNewConstraint;
	}
	}
else
	freeStringList( pLeftPath_in );

return pConstraints_in;
}

/*****************************************************************************
 * NAME
 *    freePATRLogicalFactor
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void freePATRLogicalFactor(pFactor_io, pPATR_in)
PATRLogicalFactor * pFactor_io;
PATRData * pPATR_in;
{
if (pFactor_io == NULL)
	return;
switch (pFactor_io->eType)
	{
	case kExpression:
	freePATRLogicalExpression(pFactor_io->u.pExpression, pPATR_in);
	break;
	case kFeature:
	freePATRFeature(pFactor_io->u.pFeature, pPATR_in);
	break;
	}
freeMemory(pFactor_io);
}

/*****************************************************************************
 * NAME
 *    freePATRLogicalExpression
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void freePATRLogicalExpression(pExpression_io, pPATR_in)
PATRLogicalExpression * pExpression_io;
PATRData * pPATR_in;
{
if (pExpression_io == NULL)
	return;
switch (pExpression_io->eOperation)
	{
	case kExist:
	case kNegate:
	freePATRLogicalFactor(pExpression_io->pLeft, pPATR_in);
	break;
	case kAnd:
	case kOr:
	case kConditional:
	case kBiconditional:
	freePATRLogicalFactor(pExpression_io->pLeft, pPATR_in);
	freePATRLogicalFactor(pExpression_io->pRight, pPATR_in);
	break;
	}
freeMemory(pExpression_io);
}

/*****************************************************************************
 * NAME
 *    freeLogicalConstraints
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void freeLogicalConstraints(pConstraints_in, pPATR_io)
PATRConstraint * pConstraints_in;
PATRData * pPATR_io;
{
PATRConstraint * pCon;
PATRConstraint * pNextConstraint;

for ( pCon = pConstraints_in ; pCon ; pCon = pNextConstraint )
	{
	pNextConstraint = pCon->pNext;
	freePATRLogicalExpression( pCon->pExpression, pPATR_io );
	freeMemory( pCon );
	}
}

/*****************************************************************************
 * NAME
 *    copyPATRLogicalFactor
 * DESCRIPTION
 *
 * RETURN VALUE
 *    pointer to a newly allocated copy of the PATRLogicalFactor
 */
static PATRLogicalFactor * copyPATRLogicalFactor(pFactor_in, pPATR_in)
PATRLogicalFactor * pFactor_in;
PATRData * pPATR_in;
{
PATRLogicalFactor * pNewFactor;

if (pFactor_in == NULL)
	return NULL;
pNewFactor = ((PATRLogicalFactor *)allocMemory(sizeof(PATRLogicalFactor)));
pNewFactor->eType = pFactor_in->eType;
switch (pFactor_in->eType)
	{
	case kExpression:
	pNewFactor->u.pExpression = copyPATRLogicalExpression(
							pFactor_in->u.pExpression,
							pPATR_in);
	break;
	case kFeature:
	/* Don't use copyPATRFeature because it fails on freePATRFeature! */
	pNewFactor->u.pFeature = storePATRFeature(pFactor_in->u.pFeature,
						  pPATR_in);
	break;
	default:
	freeMemory(pNewFactor);
	pNewFactor = NULL;
	break;
	}
return pNewFactor;
}

/*****************************************************************************
 * NAME
 *    copyPATRLogicalExpression
 * DESCRIPTION
 *
 * RETURN VALUE
 *    pointer to a newly allocated copy of the PATRLogicalExpression
 */
static PATRLogicalExpression * copyPATRLogicalExpression(pExpression_in,
							 pPATR_in)
PATRLogicalExpression * pExpression_in;
PATRData * pPATR_in;
{
PATRLogicalExpression * pNewExpression;

if (pExpression_in == NULL)
	return NULL;
pNewExpression = ((PATRLogicalExpression *)allocMemory(
						   sizeof(PATRLogicalExpression)));
pNewExpression->eOperation = pExpression_in->eOperation;
switch (pExpression_in->eOperation)
	{
	case kExist:
	case kNegate:
	pNewExpression->pLeft = copyPATRLogicalFactor(pExpression_in->pLeft,
							  pPATR_in);
	break;
	case kAnd:
	case kOr:
	case kConditional:
	case kBiconditional:
	pNewExpression->pLeft  = copyPATRLogicalFactor(pExpression_in->pLeft,
							   pPATR_in);
	pNewExpression->pRight = copyPATRLogicalFactor(pExpression_in->pRight,
							   pPATR_in);
	break;
	default:
	freeMemory(pNewExpression);
	pNewExpression = NULL;
	break;
	}
return pNewExpression;
}

/*****************************************************************************
 * NAME
 *    storeLogicalConstraints
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void storeLogicalConstraints(pConstraints_in, pGrammar_in)
PATRConstraint * pConstraints_in;
PATRGrammar *	 pGrammar_in;
{
unsigned	i;

if ((pConstraints_in == NULL) || (pGrammar_in == NULL))
	return;
if (pGrammar_in->apConstraints == NULL)
	{
	pGrammar_in->apConstraints = (PATRConstraint **)allocMemory(
						 2 * sizeof(PATRConstraint *));
	pGrammar_in->apConstraints[0] = pConstraints_in;
	pGrammar_in->apConstraints[1] = NULL;
	return;
	}
for ( i = 0 ; pGrammar_in->apConstraints[i] ; ++i )
	;
pGrammar_in->apConstraints = (PATRConstraint **)reallocMemory(
					   pGrammar_in->apConstraints,
					   (i + 2) * sizeof(PATRConstraint *));
pGrammar_in->apConstraints[i++] = pConstraints_in;
pGrammar_in->apConstraints[i]   = NULL;
}

/*****************************************************************************
 * NAME
 *    loadConstraint
 * DESCRIPTION
 *    load one constraint definition from the grammar file
 * RETURN VALUE
 *    zero if an error occurs, otherwise non-zero
 */
static int loadConstraint(pData)
GrammarData * pData;
{
char		szToken[MAX_TOKEN_SIZE+1];
int		iTokenType;
char		szNextToken[MAX_TOKEN_SIZE+1];
int		iNextTokenType;
PATRDefinition *	pDef;
PATRLogicalExpression * pExpression;
/*
 *  Constraint name is [finite: +] <-> [tense: []]
 */
/*
 *  Get the name of the constraint
 */
iTokenType = getToken(szToken, MAX_TOKEN_SIZE, pData);
if ((iTokenType != SYMBOL_TOKEN) && (iTokenType != KEYWORD_TOKEN))
	{
	displayNumberedMessage(&sBadGrammarDeclaration_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Constraint", "", "identifier");
	return ( FALSE );                   /* Error exit */
	}
/*
 *  Get next token ("is")
 */
iNextTokenType = getNextToken(szNextToken, MAX_TOKEN_SIZE, pData);
if (strcasecmp(szNextToken, "is") != 0)
	{
	displayNumberedMessage(&sBadGrammarDeclaration_m,
			   pData->bSilent, pData->bShowWarnings, pData->pLogFP,
			   pData->pszGrammarFilename, pData->uiLineNumber,
			   "Constraint", szToken, "is");
	return ( FALSE );			/* Error exit */
	}
getToken(szNextToken, MAX_TOKEN_SIZE, pData);	/* skip next token ("is") */

pData->pszReservedChars = szReservedCharsWithSlash_m;

pExpression = loadPATRLogicalExpression(pData);

pData->pszReservedChars = szReservedChars_m;

if (pExpression == NULL)
	return FALSE;

	/* Make new Definition */
pDef = newConstraint( szToken, pData );
pDef->u.pExpression = pExpression;
return TRUE;
}

/*****************************************************************************
 * NAME
 *    grammar_too_big
 * DESCRIPTION
 *    complain about running out of memory while parsing a sentence
 * RETURN VALUE
 *    none
 */
static void grammar_too_big(uiRequest_in)
size_t	uiRequest_in;
{
/* REVIEW: how much memory leakage might this allow? */
longjmp(sOutOfMemory_m, uiRequest_in ? (int)uiRequest_in : 1);
}

/*****************************************************************************
 * NAME
 *    freePATRLexicalRule
 * DESCRIPTION
 *    free the memory allocated for a PATRLexicalRule
 * RETURN VALUE
 *    none
 */
static void freePATRLexicalRule(pLexRule_in, pPATR_in)
PATRLexicalRule * pLexRule_in;
PATRData * pPATR_in;
{
PATRLexicalRule * pRule;
PATRLexicalRule * pNextRule;

for (pRule = pLexRule_in ; pRule; pRule = pNextRule)
	{
	pNextRule = pRule->pNext;
	if (pRule->pInFeat)
	freePATRFeature(pRule->pInFeat, pPATR_in);
	if (pRule->pOutFeat)
	freePATRFeature(pRule->pOutFeat, pPATR_in);
	freeMemory( pRule );
	}
}
