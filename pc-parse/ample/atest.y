%{/* ATEST.Y -  YACC grammar and actions for user defined analysis tests
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
/* Bison includes stdio, and MSC doesn't like seeing it twice */
#ifndef NULL
#include <stdio.h>
#endif
/* local headers */
#include "ample.h"
#include "ampledef.h"

/********************* ATEST.Y FUNCTION PROTOTYPES *********************/

	   int		yyparse  P((void));
	   int		yyerror  P((char *s));
static void		id_error P((char *expected, char *found));
static void             setUsesSurroundingWord P((int pos)); /* 3.3.0 hab */

/********************* ATEST.Y LOCAL VARIABLES *********************/

static FILE *		pLogFP_m = NULL;
static const AmpleData *pAmpleData_m = NULL;
static char *		pszErrorHeader_m = "";
static char		szTestName_m[100];
static char *		pszTemp_m;

static short	bForLeftSeen_m = FALSE;  /* flag FOR-ALL-LEFT, FOR-SOME-LEFT */
static short	bLeftSeen_m = FALSE;     /* flag LEFT */
static short	bForRightSeen_m = FALSE; /* flag FOR-ALL-RIGHT, FOR-SOME-RIGHT */
static short	bRightSeen_m = FALSE;    /* flag RIGHT */
static char	bUsesPrevWord_m = FALSE;
static char	bUsesNextWord_m = FALSE;

static AmpleCategoryClass *	pTempCatClass_m;
static AmpleMorphClass *	pTempMorphClass_m;
static StringClass *		pTempStringClass_m;
static PunctClass *		pTempPunctClass_m; /* 3.3.0 hab */
static unsigned short		uiTempProperty_m;
static int			iTemp_m;
/*
 *  pointer to tree built for user defined tests
 */
static AmpleTestNode *	pAmpleTestTree_m = NULL;
%}

%start sptest

%union  {
	int ival;
	char *cval;
	AmpleTestNode *tstval;
	}

%token  <cval>  LX_IDENTIFIER
/* %token       <cval>  LX_STRING */
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
%token  <ival>  LX_PUNCTUATION	/* 3.3.0 hab */
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
%token  <ival>  LX_WORD
%token  <ival>  LX_CAPITALIZED  /* 1.9zb BJY */
%token  <ival>  LX_ORDRCLASSMAX	/* hab360 */

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
%type   <ival>      neighbor
%type   <tstval>    cap_expr    /* 1.9zb BJY */
%type   <tstval>    punc_expr   /* 3.3.0 hab */

%%

sptest
	: name test
	{
	$$ = pAmpleTestTree_m = makeAmpleTest( $2, szTestName_m );
	}
	;
name
	: LX_IDENTIFIER         /* name of the test */
	{
	strncpy(szTestName_m, $1, 99); /* save for error messages */
	bForLeftSeen_m  = FALSE;   /* These must be initialized for */
	bForRightSeen_m = FALSE;   /* each test we parse! */
	bLeftSeen_m     = FALSE;
	bRightSeen_m    = FALSE;
	bUsesPrevWord_m = FALSE;
	bUsesNextWord_m = FALSE;
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
		if (pLogFP_m != NULL)
		fprintf(pLogFP_m,
			"%s%s contains more than one leftward iteration\n",
			pszErrorHeader_m, szTestName_m );
		}
	if (bLeftSeen_m == FALSE)
		{
		if (pLogFP_m != NULL)
		fprintf(pLogFP_m,
			"%s%s contains a leftward iteration without a LEFT\n",
			pszErrorHeader_m, szTestName_m );
		}
	$$ = makeAmpleTestNode($1, $2, (AmpleTestNode *)NULL);
	bForLeftSeen_m = TRUE;
	}
	| forright factor
	{
	if (bForRightSeen_m == TRUE)
		{
		if (pLogFP_m != NULL)
		fprintf(pLogFP_m,
			"%s%s contains more than one rightward iteration\n",
			pszErrorHeader_m, szTestName_m );
		}
	if (bRightSeen_m == FALSE)
		{
		if (pLogFP_m != NULL)
		fprintf(pLogFP_m,
			   "%s%s contains a rightward iteration without a RIGHT\n",
			pszErrorHeader_m, szTestName_m );
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
	| cap_expr                  /* 1.9zb BJY */
	{
	$$ = $1;
	}
	| punc_expr			/* 3.3.0 hab */
		{
		$$ = $1;
	}
	;

property_expr
	: position LX_PROPERTY LX_IS LX_IDENTIFIER
	{
	if ((uiTempProperty_m = findAmplePropertyNumber($4,
						 &pAmpleData_m->sProperties)) == 0)
	   id_error("property", $4);
	$$ = makeAmpleTestProperty(PROP_IS, $1, uiTempProperty_m);
	}
	;

string_expr
	: position LX_MORPHNAME LX_IS LX_IDENTIFIER
	{
	$$ = makeAmpleTestString(MORPH_IS, $1, duplicateString($4));
	}
	| position LX_MORPHNAME LX_IS LX_MEMBER LX_IDENTIFIER
	{
	if ((pTempMorphClass_m = findAmpleMorphClass($5,
					 pAmpleData_m->pMorphClasses)) == NULL)
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
	pTempStringClass_m = findStringClass($5, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
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
	pTempStringClass_m = findStringClass($5, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
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
	pTempStringClass_m = findStringClass($5, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
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
	pTempStringClass_m = findStringClass($5, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", $5);
	$$ = makeAmpleTestStringClass(ST_MAT_MEM, $1, pTempStringClass_m );
	}
	| position LX_SURFACE LX_MATCHES position LX_ALLOMORPH
	{
		$$ = makeAmpleTestInt(ST_MAT_AL, $1, $4 );
	}
	| neighbor LX_WORD LX_IS LX_IDENTIFIER
	{
	setUsesSurroundingWord($1); /* 3.3.0 hab */
	$$ = makeAmpleTestString(WORD_IS, $1, duplicateString($4));
	}
	| neighbor LX_WORD LX_IS LX_MEMBER LX_IDENTIFIER
	{
	setUsesSurroundingWord($1); /* 3.3.0 hab */
	pTempStringClass_m = findStringClass($5, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", $5);
	$$ = makeAmpleTestStringClass(WORD_MEMBER, $1, pTempStringClass_m );
	}
	| neighbor LX_WORD LX_MATCHES LX_IDENTIFIER
	{
	setUsesSurroundingWord($1); /* 3.3.0 hab */
	$$ = makeAmpleTestString(WORD_MATCH, $1, duplicateString($4));
	}
	| neighbor LX_WORD LX_MATCHES LX_MEMBER LX_IDENTIFIER
	{
	setUsesSurroundingWord($1); /* 3.3.0 hab */
	pTempStringClass_m = findStringClass($5, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", $5);
	$$ = makeAmpleTestStringClass(WD_MAT_MEM, $1, pTempStringClass_m );
	}
	;

neighbor
	: LX_LAST
	{
	$$ = LAST;
	/* 3.3.0 hab  can't be here because is used by punctuation now, too */
	/* bUsesPrevWord_m = TRUE; */
	}
	| LX_NEXT
	{
	$$ = NEXT;
	/* 3.3.0 hab  can't be here because is used by punctuation now, too */
	/* bUsesNextWord_m = TRUE; */
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
	$$ = AMPLE_PFX;
	}
	| LX_INFX
	{
	$$ = AMPLE_IFX;
	}
	| LX_ROOT
	{
	$$ = AMPLE_ROOT;
	}
	| LX_SUFX
	{
	$$ = AMPLE_SFX;
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
	if ((pTempCatClass_m = findAmpleCategClass($5,
					  pAmpleData_m->pCategoryClasses)) == NULL)
		id_error("category class", $5);
	$$ = makeAmpleTestCategClass(FROM_MEMBER, $1, pTempCatClass_m);
	}
	| position LX_TOCATEGORY LX_IS LX_MEMBER LX_IDENTIFIER
	{
	if ((pTempCatClass_m = findAmpleCategClass($5,
					  pAmpleData_m->pCategoryClasses)) == NULL)
		id_error("category class", $5);
	$$ = makeAmpleTestCategClass(TO_MEMBER, $1, pTempCatClass_m);
	}
	| position LX_FROMCATEGORY LX_IS LX_IDENTIFIER
	{
	if ((iTemp_m = findAmpleCategoryNumber($4,
						pAmpleData_m->pCategories)) == 0)
		id_error("category", $4);
	$$ = makeAmpleTestInt(FROM_IS, $1, iTemp_m);
	}
	| position LX_TOCATEGORY LX_IS LX_IDENTIFIER
	{
	if ((iTemp_m = findAmpleCategoryNumber($4,
						pAmpleData_m->pCategories)) == 0)
		id_error("category", $4);
	$$ = makeAmpleTestInt(TO_IS, $1, iTemp_m);
	}
	;

cap_expr           /* added 1.9zb BJY */
	: position LX_ALLOMORPH LX_IS LX_CAPITALIZED
	{
	$$ = makeAmpleTestInt(AL_IS_CAP, $1, 0);
	}
	| LX_WORD LX_IS LX_CAPITALIZED
	{
	$$ = makeAmpleTestInt(WD_IS_CAP, $1, 0);
	}
	;

punc_expr			/* added 3.3.0 hab */
	: neighbor LX_PUNCTUATION LX_IS LX_IDENTIFIER
	{
	$$ = makeAmpleTestPunct(PUNCT_IS, $1, duplicateString($4));
	}
	| neighbor LX_PUNCTUATION LX_IS LX_MEMBER LX_IDENTIFIER
	{
	pTempPunctClass_m = findPunctClass($5, pAmpleData_m->pPunctClasses);
	if (pTempPunctClass_m == NULL)
		id_error("punctuation class", $5);
	$$ = makeAmpleTestPunctClass(PUNCT_MEMBER, $1, pTempPunctClass_m );
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
		if (pLogFP_m != NULL)
		{
		fprintf(pLogFP_m,
		"%s%s constant %s in orderclass expression is not a number.\n",
			pszErrorHeader_m, szTestName_m, $4 );
		fprintf(pLogFP_m,
			"%19sWill use the value %d for it\n", " ", iTemp_m);
		}
		break;
		}
	   }
	$$ = makeAmpleTestInt( $3 + (ORDR_EQ_CON-ORDR_EQ), $1, iTemp_m );
	}
				/* change begin hab360 */
	| position LX_ORDRCLASS relop position LX_ORDRCLASSMAX
	{
	$$ = makeAmpleTestInt( $3 + (ORDR_EQ_ORDRMAX-ORDR_EQ) , $1, $4 );
	}
	| position LX_ORDRCLASSMAX relop position LX_ORDRCLASS
	{
	$$ = makeAmpleTestInt( $3 + (ORDRMAX_EQ_ORDR-ORDR_EQ), $1, $4 );
	}
	| position LX_ORDRCLASSMAX relop position LX_ORDRCLASSMAX
	{
	$$ = makeAmpleTestInt( $3 + (ORDRMAX_EQ_ORDRMAX-ORDR_EQ), $1, $4 );
	}
	| position LX_ORDRCLASSMAX relop LX_IDENTIFIER
	{
	iTemp_m = atoi($4);    /* convert identifier to integer */
			/* check for valid digit sequence */
	pszTemp_m = $4;
	if (*pszTemp_m == '-') pszTemp_m++;   /* skip initial minus sign */
	while (*pszTemp_m != NUL)  /* rest should be digits */
	   {
	   if (!isdigit(*pszTemp_m++))
		{           /* found a non-digit; report error */
		if (pLogFP_m != NULL)
		{
		fprintf(pLogFP_m,
		"%s%s constant %s in orderclass expression is not a number.\n",
			pszErrorHeader_m, szTestName_m, $4 );
		fprintf(pLogFP_m,
			"%19sWill use the value %d for it\n", " ", iTemp_m);
		}
		break;
		}
	   }
	$$ = makeAmpleTestInt( $3 + (ORDRMAX_EQ_CON-ORDR_EQ), $1, iTemp_m );
	}
				/* change end hab360 */
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

%%

/*****************************************************************************
 * NAME
 *    yyerror
 * DESCRIPTION
 *    error message routine for yacc
 */
int yyerror(s)
char *	s;	/* pointer to error message */
{
if (pLogFP_m != NULL)
	fprintf(pLogFP_m, "%s%s in %s\n", pszErrorHeader_m, s, szTestName_m );
return 0;
} /* end yyerror */

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
if (pLogFP_m != NULL)
	fprintf(pLogFP_m, "%sUndefined %s %s in %s\n",
		pszErrorHeader_m, expected, found, szTestName_m );
} /* end id_error */

/*****************************************************************************
 * NAME
 *    parseAmpleTest
 * DESCRIPTION
 *    parse the AMPLE test and build the internal tree representation
 * RETURN VALUE
 *    pointer to tree built for user defined tests, or NULL if an error occurs
 */
AmpleTestNode *	parseAmpleTest(pszTest_in, pszErrorHeader_in,
				   pbUsesPrev_out, pbUsesNext_out, pAmpleData_in)
char *			pszTest_in;
char *			pszErrorHeader_in;
int *			pbUsesPrev_out;
int *			pbUsesNext_out;
const AmpleData *	pAmpleData_in;
{
AmpleTestNode *	pValue;
char *		p;
/*
 *  set or reset all of the local global variables
 */
pLogFP_m           = pAmpleData_in->pLogFP;
pAmpleData_m       = pAmpleData_in;
pszErrorHeader_m   = pszErrorHeader_in;
memset(szTestName_m, 0, sizeof(szTestName_m));
pszTemp_m          = NULL;
bForLeftSeen_m     = FALSE;
bLeftSeen_m        = FALSE;
bForRightSeen_m    = FALSE;
bRightSeen_m       = FALSE;
bUsesPrevWord_m    = FALSE;
bUsesNextWord_m    = FALSE;
pTempCatClass_m    = NULL;
pTempMorphClass_m  = NULL;
pTempStringClass_m = NULL;
uiTempProperty_m   = 0;
iTemp_m            = 0;
pAmpleTestTree_m   = NULL;
/*
 *  set up for lexical input
 */
setAmpleLexInput( pszTest_in );
if (yyparse())
	{				/* show where parse failed in the test */
	p = getAmpleLexLocation();
	if (*p != NUL)				/* BJY 1.9za */
	{
	/*
	 *  skip name in test display
	 */
	while (!(isascii(*p) && isspace(*p)) && (*p != NUL))
		++p;
	if (*p != NUL)
		++p;
	if (pLogFP_m != NULL)
		{
		fprintf(pLogFP_m, "%s <<ERROR DETECTED HERE>>", p );
		fprintf(pLogFP_m, " %s\n", (p + strlen(p) + 1) );
		}
	}
	else
	{
	for (	p = pszTest_in ;
		!(isascii(*p) && isspace(*p)) && (*p != NUL) ;
		++p )
		;                   /* skip name in test display */
	if ( *p != NUL )
		++p;
	if (pLogFP_m != NULL)
		fprintf(pLogFP_m,
		"%s <<ERROR DETECTED AT THE END; Possible missing parenthesis>>\n",
			p);
	}
	/*
	 *  now skip the rest of the input
	 */
	while ( yylex() > 0 )
	;
	pValue = NULL;
	}
else
	{
	pValue = pAmpleTestTree_m;
	if (pbUsesPrev_out != NULL)
	*pbUsesPrev_out = bUsesPrevWord_m;
	if (pbUsesNext_out != NULL)
	*pbUsesNext_out = bUsesNextWord_m;
	}

#ifndef THINK_C
freeAmpleYYLexBuffer();		/* free buffer allocated by yylex() */
#endif
pszErrorHeader_m = "";
pLogFP_m         = NULL;
pAmpleTestTree_m = NULL;

return pValue;
}

/*****************************************************************
 * NAME
 *    setUsesSurroundingWord   3.3.0 hab
 * ARGUMENTS
 *    pos  = last or next position
 * DESCRIPTION
 *    sets global "uses last/next word" variables
 * RETURN VALUE
 *    none
 */
static void setUsesSurroundingWord(pos)
int pos;
{
if (pos == LAST)
	bUsesPrevWord_m = TRUE;
else if (pos == NEXT)
	bUsesNextWord_m = TRUE;
} /* end setUsesSurroundingWord */
