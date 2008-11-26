/*      STEST.Y - parse user defined synthesis tests
 ***************************************************************************
 *
 *      YACC grammar and actions for user defined synthesis tests
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */

%{
#include "stamp.h"
#if _MSC_VER >= 800
#include <malloc.h>	/* for _alloca(n) */
#endif

#ifdef THINK_C
#define yyoverflow  /* until we can find a way to extend the stack
					 * a la alloca or salloc */
#endif
/*
 *  local function prototypes
 */
static void		id_error P((char * expected,
					char * found));
static StampAction *	new_action P((int    type,
					  char * string,
					  int    pos));
static StampAction *	add_action P((StampAction * newp,
					  StampAction * listp));
static int		lookup_test P((char  *     name,
					   StampData * pStamp_in));
/*
 *  local semi-global variables
 */
static char szTestName_m[100];
static short bForLeftSeen_m  = FALSE;	/* flag FOR-ALL-LEFT, FOR-SOME-LEFT */
static short bLeftSeen_m     = FALSE;	/* flag LEFT */
static short bForRightSeen_m = FALSE;  /* flag FOR-ALL-RIGHT, FOR-SOME-RIGHT */
static short bRightSeen_m    = FALSE;	/* flag RIGHT */
static AmpleCategoryClass *	pTempCatClass_m;
static AmpleMorphClass *	pTempMorphClass_m;
static StringClass *	pTempStringClass_m;
static PunctClass *	pTempPunctClass_m; /* 2.1b1 hab */
static unsigned short	uiTempProperty;
static int		iTemp_m;
static char *		pszTemp_m;
static AmpleTestNode *	pTestTree_m;
static StampAction *	pTestActions_m;
static char *		pszTestErrorHeader_m;
static StampData *	pStamp_m;

%}

%start sptest

%union  {
	int ival;
	char *cval;
	AmpleTestNode *tstval;
	StampAction *actval;
	}

%token  <cval>  LX_IDENTIFIER
/* %token   <cval>  LX_STRING */
%token  <ival>  LX_ALLOMORPH
%token  <ival>  LX_CURRENT
%token  <ival>  LX_FINAL
%token  <ival>  LX_FA_LEFT
%token  <ival>  LX_FA_RIGHT
%token  <ival>  LX_FS_LEFT
%token  <ival>  LX_FS_RIGHT
%token  <ival>  LX_FLEFT
%token  <ival>  LX_FRIGHT
%token  <ival>  LX_IF
%token  <ival>  LX_IFF
%token  <ival>  LX_THEN
%token  <ival>  LX_INITIAL
%token  <ival>  LX_MEMBER
%token  <ival>  LX_MORPHNAME
%token  <ival>  LX_PFINAL
%token  <ival>  LX_PINITIAL
%token  <ival>  LX_PROPERTY
%token  <ival>  LX_PUNCTUATION	/* 2.1b1 hab */
%token  <ival>  LX_SURFACE
%token  <ival>  LX_TYPE
%token  <ival>  LX_XOR
%token  <ival>  LX_AND
/* %token   <ival>  LX_CONSTANT */
%token  <ival>  LX_EQ   /* =  */
%token  <ival>  LX_GE   /* >= */
%token  <ival>  LX_GT   /* >  */
%token  <ival>  LX_INFX
%token  <ival>  LX_IS
%token  <ival>  LX_LE   /* <= */
%token  <ival>  LX_LEFT
%token  <ival>  LX_LT   /* <  */
%token  <ival>  LX_MATCHES
%token  <ival>  LX_NE   /* ~= */
%token  <ival>  LX_NOT
%token  <ival>  LX_OR
%token  <ival>  LX_PRFX
%token  <ival>  LX_RIGHT
%token  <ival>  LX_ROOT
%token  <ival>  LX_SUFX
%token  <ival>  LX_TOCATEGORY
%token  <ival>  LX_FROMCATEGORY
%token  <ival>  LX_ORDRCLASS
%token  <ival>  LX_NEXT
%token  <ival>  LX_LAST
%token  <ival>  LX_INSERT
%token  <ival>  LX_AFTER
%token  <ival>  LX_BEFORE
%token  <ival>  LX_REPORT
%token  <cval>  LX_MESSAGE

%type   <cval>      name
%type   <tstval>    factor
%type   <tstval>    test
%type   <tstval>    category_expr
%type   <tstval>    orderclass_expr
%type   <tstval>    property_expr
%type   <tstval>    string_expr
%type   <tstval>    type_expr
%type   <ival>      forleft
%type   <ival>      forright
%type   <ival>      relop
%type   <ival>      type
%type   <tstval>    sptest
%type   <ival>      logop
%type   <ival>      position

%type   <actval>    actions
%type   <actval>    action
%type   <actval>    insert
%type   <actval>    report
%type   <ival>      neighbor	/* 2.1b1 hab */
%type   <tstval>    punc_expr	/* 2.1b1 hab */
%%

sptest
	: name test
		{
		$$ = pTestTree_m = makeAmpleTest( $2, szTestName_m );
		pTestActions_m = (StampAction *)NULL;
		}
	| name test '{' actions '}'
		{
		$$ = pTestTree_m = makeAmpleTest( $2, szTestName_m );
		pTestActions_m = $4;
		}
	;

name
	: LX_IDENTIFIER         /* name of the test */
		{
		strncpy(szTestName_m, $1, 99);    /* save for error messages */
		bForLeftSeen_m = FALSE;    /* These must be initialized for */
		bForRightSeen_m = FALSE;   /* each test we parse! */
		bLeftSeen_m = FALSE;
		bRightSeen_m = FALSE;
		}
	;

test
	: test logop factor
		{
		$$ = makeAmpleTestNode($2, $1, $3);
		}
	| LX_IF factor LX_THEN factor
		{
		$$ = makeAmpleTestNode( LOGIF, $2, $4);
		}
	| forleft factor
		{
		if (bForLeftSeen_m == TRUE)
			{
		if (pStamp_m->pLogFP != NULL)
		fprintf(pStamp_m->pLogFP,
						"%s%s contains more than one leftward iteration\n",
						pszTestErrorHeader_m, szTestName_m );
			}
		if (bLeftSeen_m == FALSE)
			{
		if (pStamp_m->pLogFP != NULL)
		fprintf(pStamp_m->pLogFP,
						"%s%s contains a leftward iteration without a LEFT\n",
						pszTestErrorHeader_m, szTestName_m );
			}
		$$ = makeAmpleTestNode($1, $2, (AmpleTestNode *)NULL);
		bForLeftSeen_m = TRUE;
		}
	| forright factor
		{
		if (bForRightSeen_m == TRUE)
			{
		if (pStamp_m->pLogFP != NULL)
		fprintf(pStamp_m->pLogFP,
						"%s%s contains more than one rightward iteration\n",
						pszTestErrorHeader_m, szTestName_m );
			}
		if (bRightSeen_m == FALSE)
			{
		if (pStamp_m->pLogFP != NULL)
		fprintf(pStamp_m->pLogFP,
					   "%s%s contains a rightward iteration without a RIGHT\n",
						pszTestErrorHeader_m, szTestName_m );
			}
		bForRightSeen_m = TRUE;
		$$ = makeAmpleTestNode($1, $2, (AmpleTestNode *)NULL);
		}
	| factor
		{
		}
	;

logop
	: LX_AND
		{
		$$ = LOGAND;
		}
	| LX_OR
		{
		$$ = LOGOR;
		}
	| LX_XOR
		{
		$$ = LOGXOR;
		}
	| LX_IFF
		{
		$$ = LOGIFF;
		}
	;

forleft
	: LX_FA_LEFT
		{
		$$ = ALL_LEFT;
		}
	| LX_FS_LEFT
		{
		$$ = SOME_LEFT;
		}
	;

forright
	: LX_FA_RIGHT
		{
		$$ = ALL_RIGHT;
		}
	| LX_FS_RIGHT
		{
		$$ = SOME_RIGHT;
		}
	;

factor
	: LX_NOT factor
		{
		$$ = $2;
				$$->iOpCode ^= OP_NOT;
		}
	| '(' test  ')'
		{
		$$ = $2;
		}
	| property_expr
		{
		$$ = $1;
		}
	| string_expr
		{
		$$ = $1;
		}
	| type_expr
		{
		$$ = $1;
		}
	| category_expr
		{
		$$ = $1;
		}
	| orderclass_expr
		{
		$$ = $1;
		}
	| punc_expr			/* 2.1b1 hab */
		{
		$$ = $1;
	}
	;

property_expr
	: position LX_PROPERTY LX_IS LX_IDENTIFIER
		{
		if ((uiTempProperty = findAmplePropertyNumber($4, &pStamp_m->sProperties)) == 0)
		   id_error("property", $4);
		$$ = makeAmpleTestProperty(PROP_IS, $1, uiTempProperty);
		}
	;

string_expr
	: position LX_MORPHNAME LX_IS LX_IDENTIFIER
		{
		$$ = makeAmpleTestString(MORPH_IS, $1, duplicateString($4) );
		}
	| position LX_MORPHNAME LX_IS LX_MEMBER LX_IDENTIFIER
		{
		if ((pTempMorphClass_m = findAmpleMorphClass($5, pStamp_m->pMorphClasses)) == NULL)
			id_error("morpheme class", $5);
		$$ = makeAmpleTestMorphClass(MORPH_MEMBER, $1, pTempMorphClass_m);
		}
	| position LX_MORPHNAME LX_IS position LX_MORPHNAME
		{
		$$ = makeAmpleTestInt(MOR_IS_MORPH, $1, $4);
		}
	| position LX_ALLOMORPH LX_IS LX_IDENTIFIER
		{
		if (strcmp($4,"0") == 0)
			*($4) = NUL;
		$$ = makeAmpleTestString(ALLO_IS, $1, duplicateString($4));
		}
	| position LX_ALLOMORPH LX_IS LX_MEMBER LX_IDENTIFIER
		{
		if ((pTempStringClass_m = findStringClass($5, pStamp_m->pStringClasses)) == NULL)
			id_error("string class", $5);
		$$ = makeAmpleTestStringClass(ALLO_MEMBER, $1, pTempStringClass_m );
		}
	| position LX_ALLOMORPH LX_IS position LX_ALLOMORPH
		{
		$$ = makeAmpleTestInt(ALLO_IS_AL, $1, $4);
		}
	| position LX_ALLOMORPH LX_MATCHES LX_IDENTIFIER
		{
		$$ = makeAmpleTestString(ALLO_MATCH, $1, duplicateString($4));
		}
	| position LX_ALLOMORPH LX_MATCHES LX_MEMBER LX_IDENTIFIER
		{
		if ((pTempStringClass_m = findStringClass($5, pStamp_m->pStringClasses)) == NULL)
			id_error("string class", $5);
		$$ = makeAmpleTestStringClass(AL_MAT_MEM, $1, pTempStringClass_m );
		}
	| position LX_ALLOMORPH LX_MATCHES position LX_ALLOMORPH
		{
		$$ = makeAmpleTestInt(AL_MAT_AL, $1, $4);
		}
	| position LX_SURFACE LX_IS LX_IDENTIFIER
		{
		$$ = makeAmpleTestString(STRING_IS, $1, duplicateString($4));
		}
	| position LX_SURFACE LX_IS LX_MEMBER LX_IDENTIFIER
		{
		if ((pTempStringClass_m = findStringClass($5, pStamp_m->pStringClasses)) == NULL)
			id_error("string class", $5);
		$$ = makeAmpleTestStringClass(STRING_MEMBER, $1, pTempStringClass_m );
		}
	| position LX_SURFACE LX_IS position LX_ALLOMORPH
		{
		$$ = makeAmpleTestInt(ST_IS_AL, $1, $4);
		}
	| position LX_SURFACE LX_MATCHES LX_IDENTIFIER
		{
		$$ = makeAmpleTestString(ST_MATCH, $1, duplicateString($4));
		}
	| position LX_SURFACE LX_MATCHES LX_MEMBER LX_IDENTIFIER
		{
		if ((pTempStringClass_m = findStringClass($5, pStamp_m->pStringClasses)) == NULL)
			id_error("string class", $5);
		$$ = makeAmpleTestStringClass(ST_MAT_MEM, $1, pTempStringClass_m );
		}
	| position LX_SURFACE LX_MATCHES position LX_ALLOMORPH
		{
		$$ = makeAmpleTestInt(ST_MAT_AL, $1, $4 );
		}
	;

neighbor			/* 2.1b1 hab */
	: LX_LAST
	{
	$$ = LAST;
	}
	| LX_NEXT
	{
	$$ = NEXT;
	}
	;

type_expr
	: position LX_TYPE LX_IS type
		{
		$$ = makeAmpleTestInt(TYPE_IS, $1, $4);
		}
	;

type
	: LX_PRFX
		{
		$$ = PFX;
		}
	| LX_INFX
		{
		$$ = IFX;
		}
	| LX_ROOT
		{
		$$ = ROOT;
		}
	| LX_SUFX
		{
		$$ = SFX;
		}
	| LX_INITIAL
		{
		$$ = WINITIAL;
		}
	| LX_FINAL
		{
		$$ = WFINAL;
		}
	;

category_expr
	: position LX_FROMCATEGORY LX_IS position LX_FROMCATEGORY
		{
		$$ = makeAmpleTestInt(FROM_IS_FROM, $1, $4);
		}
	| position LX_FROMCATEGORY LX_IS position LX_TOCATEGORY
		{
		$$ = makeAmpleTestInt(FR_IS_TO, $1, $4);
		}
	| position LX_TOCATEGORY LX_IS position LX_FROMCATEGORY
		{
		$$ = makeAmpleTestInt(TO_IS_FROM, $1, $4);
		}
	| position LX_TOCATEGORY LX_IS position LX_TOCATEGORY
		{
		$$ = makeAmpleTestInt(TO_IS_TO, $1, $4);
		}
	| position LX_FROMCATEGORY LX_IS LX_MEMBER LX_IDENTIFIER
		{
		if ((pTempCatClass_m = findAmpleCategClass($5, pStamp_m->pCategClasses)) == NULL)
			id_error("category class", $5);
		$$ = makeAmpleTestCategClass(FROM_MEMBER, $1, pTempCatClass_m);
		}
	| position LX_TOCATEGORY LX_IS LX_MEMBER LX_IDENTIFIER
		{
		if ((pTempCatClass_m = findAmpleCategClass($5, pStamp_m->pCategClasses)) == NULL)
			id_error("category class", $5);
		$$ = makeAmpleTestCategClass(TO_MEMBER, $1, pTempCatClass_m);
		}
	| position LX_FROMCATEGORY LX_IS LX_IDENTIFIER
		{
		if ((iTemp_m = findAmpleCategoryNumber($4, pStamp_m->pCategories)) == 0)
			id_error("category", $4);
		$$ = makeAmpleTestInt(FROM_IS, $1, iTemp_m);
		}
	| position LX_TOCATEGORY LX_IS LX_IDENTIFIER
		{
		if ((iTemp_m = findAmpleCategoryNumber($4, pStamp_m->pCategories)) == 0)
			id_error("category", $4);
		$$ = makeAmpleTestInt(TO_IS, $1, iTemp_m);
		}
	;

orderclass_expr
	: position LX_ORDRCLASS relop position LX_ORDRCLASS
		{
		$$ = makeAmpleTestInt( $3, $1, $4 );
		}
	| position LX_ORDRCLASS relop LX_IDENTIFIER
		{
		iTemp_m = atoi($4);    /* convert identifier to integer */
					/* check for valid digit sequence */
		pszTemp_m = $4;
		if (*pszTemp_m == '-') pszTemp_m++;   /* skip initial minus sign */
		while (*pszTemp_m != NUL)  /* rest should be digits */
			{
			if (!isdigit(*pszTemp_m++))
				{           /* found a non-digit; report error */
		if (pStamp_m->pLogFP != NULL)
			fprintf(pStamp_m->pLogFP, "\
%s%s constant %s in orderclass expression is not a number.\n\
\n%19sWill use the value %d for it\n",
						pszTestErrorHeader_m, szTestName_m, $4, " ", iTemp_m);
		break;
		}
		}
		$$ = makeAmpleTestInt( $3 + (ORDR_EQ_CON-ORDR_EQ), $1, iTemp_m );
	}
	;

punc_expr			/* added 2.1b1 hab */
	: neighbor LX_PUNCTUATION LX_IS LX_IDENTIFIER
	{
	$$ = makeAmpleTestPunct(PUNCT_IS, $1, duplicateString($4));
	}
	| neighbor LX_PUNCTUATION LX_IS LX_MEMBER LX_IDENTIFIER
	{
	pTempPunctClass_m = findPunctClass($5, pStamp_m->pPunctClasses);
	if (pTempPunctClass_m == NULL)
		id_error("punctuation class", $5);
	$$ = makeAmpleTestPunctClass(PUNCT_MEMBER, $1, pTempPunctClass_m );
	}
	;

relop
	: LX_EQ
		{
		$$ = ORDR_EQ;
		}
	| LX_GT
		{
		$$ = ORDR_GT;
		}
	| LX_GE
		{
		$$ = ORDR_GE;
		}
	| LX_LE
		{
		$$ = ORDR_LE;
		}
	| LX_LT
		{
		$$ = ORDR_LT;
		}
	| LX_NE
		{
		$$ = ORDR_NE;
		}
	;

position
	: LX_LEFT
		{
		$$ = ARGLEFT;
		}
	| LX_RIGHT
		{
		$$ = ARGRIGHT;
		}
	| LX_CURRENT
		{
		$$ = ARGCURRENT;
		}
	| LX_FLEFT
		{
		++bLeftSeen_m;
		$$ = FORLEFT;
		}
	| LX_FRIGHT
		{
		++bRightSeen_m;
		$$ = FORRIGHT;
		}
	| LX_PINITIAL
		{
		$$ = INITIALM;
		}
	| LX_PFINAL
		{
		$$ = FINALM;
		}
	;

actions : action
		{
		$$ = $1;        /* return pointer to action struct */
		}
	| action ',' actions
		{
		$$ = add_action( $1, $3 );  /* append action to list */
		}
	;

action
	: insert
		{
		$$ = $1;
		}
	| report
		{
		$$ = $1;
		}
	;

insert
	: LX_INSERT LX_IDENTIFIER LX_BEFORE position
		{
		$$ = new_action( INSERT_BEFORE, $2, $4 );
		}
	| LX_INSERT LX_IDENTIFIER LX_AFTER position
		{
		$$ = new_action( INSERT_AFTER, $2, $4 );
		}
	;

report
	: LX_REPORT
		{
		$$ = new_action( REPORT, (char *)NULL, 0 );
		}
	| LX_REPORT LX_IDENTIFIER
		{
		$$ = new_action( REPORT, $2, 0 );
		}
	| LX_REPORT LX_MESSAGE
		{
		$$ = new_action( REPORT, $2, 0 );
		}
	;

%%

/*************************************************************************
 * NAME
 *    yyerror
 * ARGUMENTS
 *    s - pointer to error message string
 * DESCRIPTION
 *    print an error message for yyparse() (and yylex()?)
 * RETURN VALUE
 *    none
 */
void yyerror(s)
char *s;
{
if (pStamp_m->pLogFP != NULL)
	fprintf(pStamp_m->pLogFP, "%s%s in %s\n",
		pszTestErrorHeader_m, s, szTestName_m );
}

/*****************************************************************
 * NAME
 *    id_error
 * ARGUMENTS
 *    expected = type of identifier expected
 *    found    = string that was found
 * DESCRIPTION
 *    prints an error message when an incorrect IDENTIFIER is found
 * RETURN VALUE
 *    none
 */
static void id_error(expected, found)
char *expected, *found;
{
if (pStamp_m->pLogFP != NULL)
	fprintf(pStamp_m->pLogFP, "%sUndefined %s %s in %s\n",
			pszTestErrorHeader_m, expected, found, szTestName_m );
}

/*************************************************************************
 * NAME
 *    new_action
 * ARGUMENTS
 *    type   - code for the type of action
 *    string - pointer to the string associated with this action
 *    pos    - code for the morpheme position, if any, used by this action
 * DESCRIPTION
 *    Allocate memory for an action struct, and fill in the fields.
 * RETURN VALUE
 *    pointer to the newly allocted action struct
 */
static StampAction *new_action(type, string, pos)
int type;
char *string;
int pos;
{
register StampAction *ap;

ap            = (StampAction *)allocMemory( sizeof(StampAction) );
ap->eType     = type;
ap->pszString = (string) ? duplicateString( string ) : (char *)NULL;
ap->iPosition = pos;
ap->pNext     = (StampAction *)NULL;
return( ap );
}

/*************************************************************************
 * NAME
 *    add_action
 * ARGUMENTS
 *    newp  - pointer to a new action struct
 *    listp - pointer to an existing list of action struct's
 * DESCRIPTION
 *    Add an action to a list of actions.
 * RETURN VALUE
 *    pointer to the expanded list
 */
static StampAction *add_action( newp, listp )
StampAction *newp;
StampAction *listp;
{
newp->pNext = listp;     /* simple, but I understand as C code */
return( newp );         /*   better than doing in yacc above */
}

/**************************************************************************
 * NAME
 *    lookup_test
 * ARGUMENTS
 *    name - pointer to function name string
 * DESCRIPTION
 *    Search for a user-defined function in the existing list.
 * RETURN VALUE
 *    nonzero if found, zero if not found
 */
static int lookup_test(name, pStamp_in)
char *		name;
StampData *	pStamp_in;
{
register StampTestList *pTest;

for ( pTest = pStamp_in->pSynthesisTests ; pTest ; pTest = pTest->pNext )
	{
	/*
	 *  check whether this name is already used?
	 */
	if (!strcmp(name, pTest->pTest->uRight.pszString))
		return( 1 );
	}
return( 0 );
}

/*************************************************************************
 * NAME
 *    parseStampTest
 * ARGUMENTS
 *    test - pointer to test field
 * DESCRIPTION
 *    Parse a test field, creating a binary parse tree.
 * RETURN VALUE
 *    pointer to the newly created test tree, or NULL if the parse failed
 */
AmpleTestNode * parseStampTest(pszTest_in, pszTestErrorHeader_in,
				   ppTestActions_out, pStamp_in)
char *		pszTest_in;
char *		pszTestErrorHeader_in;
StampAction **	ppTestActions_out;
StampData *	pStamp_in;
{
char *	p;

if (pszTest_in == NULL)
	goto empty_test;
pszTest_in += strspn(pszTest_in, " \t\r\n\f\v");
if (*pszTest_in == NUL)
	{
empty_test:
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP, "%sEmpty definition",
		pszTestErrorHeader_in);
	return( NULL );
	}
/*
 *  Search for a match with the name of an existing test.
 */
isolateWord(pszTest_in);                    /* isolate the test name */
if (lookup_test(pszTest_in, pStamp_in))
	{
	if (pStamp_in->pLogFP != NULL)
	fprintf(pStamp_in->pLogFP, "%sTest already defined",
		pszTestErrorHeader_in);
	return( NULL );
	}
if (pStamp_in == NULL)
	{
	reportError(ERROR_MSG, "%sInternal program error (pStamp_in == NULL)",
	   pszTestErrorHeader_in);
	return( NULL );
	}
/*
 *  restore whitespace character following the test name
 */
p = pszTest_in + strlen(pszTest_in);
*p = ' ';
/*
 *  Parse a newly defined test.
 */
setStampLexInput( pszTest_in );
pTestTree_m          = NULL;
pTestActions_m       = NULL;
pszTestErrorHeader_m = pszTestErrorHeader_in;
pStamp_m             = pStamp_in;

if (stampyyparse())
	{                           /* show where parse failed in the test */
	p = getStampLexLocation();
	if (*p != NUL)		/* BJY (1.5c) */
		{
		while (!myisspace(*p) && (*p != NUL))
		++p;                               /* skip name in test display */
		if (*p != NUL)
			++p;
	if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP, "\n%s <<ERROR DETECTED HERE>> %s\n",
					p, (p + strlen(p) +	1) );
		}
	else
		{
		for ( p = pszTest_in ; !myisspace(*p) && (*p != NUL) ; ++p )
			;                   /* skip name in test display */
		if ( *p != NUL )
			++p;
	if (pStamp_in->pLogFP != NULL)
		fprintf(pStamp_in->pLogFP, "\n%s %s\n",
					p,
				"<<ERROR DETECTED AT THE END; Possible missing parenthesis>>");
		}
	while ( stampyylex() > 0 )       /* now skip the rest of the input */
		;
	if (ppTestActions_out != NULL)
	*ppTestActions_out = NULL;
	return( NULL );
	}
if (ppTestActions_out != NULL)
	*ppTestActions_out = pTestActions_m;
return( pTestTree_m );        /* we have a valid test! */
}
