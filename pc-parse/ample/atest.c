#define YYBYACC 1
#define YYMAJOR 1
#define YYMINOR 9
#define yyclearin (yychar=(-1))
#define yyerrok (yyerrflag=0)
#define YYRECOVERING (yyerrflag!=0)
#define yyparse ampyyparse
#define yylex ampyylex
#define yyerror ampyyerror
#define yychar ampyychar
#define yyval ampyyval
#define yylval ampyylval
#define yydebug ampyydebug
#define yynerrs ampyynerrs
#define yyerrflag ampyyerrflag
#define yyss ampyyss
#define yyssp ampyyssp
#define yyvs ampyyvs
#define yyvsp ampyyvsp
#define yylhs ampyylhs
#define yylen ampyylen
#define yydefred ampyydefred
#define yydgoto ampyydgoto
#define yysindex ampyysindex
#define yyrindex ampyyrindex
#define yygindex ampyygindex
#define yytable ampyytable
#define yycheck ampyycheck
#define yyname ampyyname
#define yyrule ampyyrule
#define YYPREFIX "ampyy"
#line 1 "atest.y"
/* ATEST.Y -  YACC grammar and actions for user defined analysis tests
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
#line 50 "atest.y"
typedef union  {
	int ival;
	char *cval;
	AmpleTestNode *tstval;
	} YYSTYPE;
#line 88 "atest.c"
#define LX_IDENTIFIER 257
#define LX_ALLOMORPH 258
#define LX_CURRENT 259
#define LX_FINAL 260
#define LX_FA_LEFT 261
#define LX_FA_RIGHT 262
#define LX_FS_LEFT 263
#define LX_FS_RIGHT 264
#define LX_FLEFT 265
#define LX_FRIGHT 266
#define LX_IF 267
#define LX_IFF 268
#define LX_THEN 269
#define LX_INITIAL 270
#define LX_MEMBER 271
#define LX_MORPHNAME 272
#define LX_PFINAL 273
#define LX_PINITIAL 274
#define LX_PROPERTY 275
#define LX_PUNCTUATION 276
#define LX_SURFACE 277
#define LX_TYPE 278
#define LX_XOR 279
#define LX_AND 280
#define LX_EQ 281
#define LX_GE 282
#define LX_GT 283
#define LX_INFX 284
#define LX_IS 285
#define LX_LE 286
#define LX_LEFT 287
#define LX_LT 288
#define LX_MATCHES 289
#define LX_NE 290
#define LX_NOT 291
#define LX_OR 292
#define LX_PRFX 293
#define LX_RIGHT 294
#define LX_ROOT 295
#define LX_SUFX 296
#define LX_TOCATEGORY 297
#define LX_FROMCATEGORY 298
#define LX_ORDRCLASS 299
#define LX_NEXT 300
#define LX_LAST 301
#define LX_WORD 302
#define LX_CAPITALIZED 303
#define YYERRCODE 256
short ampyylhs[] = {                                        -1,
	0,    1,    3,    3,    3,    3,    3,   13,   13,   13,
   13,    9,    9,   10,   10,    2,    2,    2,    2,    2,
	2,    2,    2,    2,    6,    7,    7,    7,    7,    7,
	7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
	7,    7,    7,    7,   15,   15,    8,   12,   12,   12,
   12,   12,   12,    4,    4,    4,    4,    4,    4,    4,
	4,   16,   16,   17,   17,    5,    5,   11,   11,   11,
   11,   11,   11,   14,   14,   14,   14,   14,   14,   14,
};
short ampyylen[] = {                                         2,
	2,    1,    3,    4,    2,    2,    1,    1,    1,    1,
	1,    1,    1,    1,    1,    2,    3,    1,    1,    1,
	1,    1,    1,    1,    4,    4,    5,    5,    4,    5,
	5,    4,    5,    5,    4,    5,    5,    4,    5,    5,
	4,    5,    4,    5,    1,    1,    4,    1,    1,    1,
	1,    1,    1,    5,    5,    5,    5,    5,    5,    4,
	4,    4,    3,    4,    5,    5,    4,    1,    1,    1,
	1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
};
short ampyydefred[] = {                                      0,
	2,    0,    0,   76,   12,   14,   13,   15,   77,   78,
	0,   80,   79,   74,    0,   75,   46,   45,    0,    0,
	7,    0,   21,   22,   18,   19,   20,    0,    0,    0,
	0,   23,   24,    0,   16,    0,    0,   11,   10,    8,
	9,    0,    5,    6,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,   63,   17,    3,    0,    0,
	0,    0,    0,    0,    0,    0,    0,   68,   70,   69,
   71,   72,   73,    0,    0,    0,    0,    4,   29,    0,
   62,    0,   32,    0,    0,   26,    0,    0,   25,   35,
	0,    0,   38,    0,    0,   53,   52,   49,   48,   50,
   51,   47,   61,    0,    0,   60,    0,    0,   67,    0,
   64,    0,   41,    0,   43,    0,   30,   31,   33,   34,
   27,   28,   36,   37,   39,   40,   59,   57,   56,   58,
   55,   54,   66,   65,   42,   44,
};
short ampyydgoto[] = {                                       2,
	3,   21,   22,   23,   24,   25,   26,   27,   28,   29,
   74,  102,   42,   30,   31,   32,   33,
};
short ampyysindex[] = {                                   -250,
	0,    0,  -40,    0,    0,    0,    0,    0,    0,    0,
  -28,    0,    0,    0,  -28,    0,    0,    0, -269,  -40,
	0, -116,    0,    0,    0,    0,    0,  -28,  -28, -245,
 -265,    0,    0, -235,    0, -277,  -39,    0,    0,    0,
	0,  -28,    0,    0, -260, -246, -239, -249, -234, -223,
 -222,  -99, -221, -229,  -28,    0,    0,    0, -256, -216,
 -198, -215, -180, -162, -124, -144, -126,    0,    0,    0,
	0,    0,    0, -108, -252, -251, -243,    0,    0, -192,
	0, -189,    0, -191, -188,    0, -185, -190,    0,    0,
 -183, -178,    0, -176, -175,    0,    0,    0,    0,    0,
	0,    0,    0, -173, -274,    0, -170, -253,    0, -211,
	0, -167,    0, -165,    0, -159,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,
};
short ampyyrindex[] = {                                      0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,   99,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,
};
short ampyygindex[] = {                                      0,
	0,   -7,   80,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,  114,    0,    0,    0,
};
#define YYTABLESIZE 274
short ampyytable[] = {                                      20,
   79,   57,    4,   34,  111,  113,    1,   35,    9,   10,
   53,   20,   45,  115,   80,   36,   12,   13,  112,  114,
   43,   44,  128,  129,   59,   56,   46,  116,   60,   47,
   14,   48,   49,   55,   58,   63,   54,   16,   61,   64,
   83,   89,    4,  131,  132,   62,   81,   78,    9,   10,
   65,   50,   51,   52,   84,   76,   12,   13,   86,   77,
	4,   66,   67,   75,  117,  119,    9,   10,  118,  120,
   14,  121,   87,  123,   12,   13,   90,   16,    4,  124,
  125,  122,  126,  127,    9,   10,  130,  133,   14,  134,
   91,  135,   12,   13,   93,   16,    4,  136,    1,   37,
	0,    0,    9,   10,    0,    0,   14,    0,   94,    0,
   12,   13,  103,   16,    4,    0,    0,    0,    0,    0,
	9,   10,    0,    0,   14,    0,  104,    0,   12,   13,
  106,   16,    4,    0,    0,   96,    0,    0,    9,   10,
	0,    0,   14,    0,  107,   97,   12,   13,  109,   16,
	4,   38,    0,    0,    0,    0,    9,   10,    0,   98,
   14,    0,   39,   40,   12,   13,    0,   16,   99,    0,
  100,  101,   82,   85,   88,   41,   92,   95,   14,  105,
  108,   68,   69,   70,    0,   16,   71,  110,   72,    0,
   73,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    4,    0,
	5,    6,    7,    8,    9,   10,   11,    0,   38,    0,
	4,    0,   12,   13,    0,    0,    9,   10,    0,   39,
   40,    0,    0,    0,   12,   13,   14,    0,    0,    0,
   15,    0,   41,   16,    0,    0,    0,    0,   14,   17,
   18,   19,   15,    0,    0,   16,    0,    0,    0,    0,
	0,   17,   18,   19,
};
short ampyycheck[] = {                                      40,
  257,   41,  259,   11,  257,  257,  257,   15,  265,  266,
  276,   40,  258,  257,  271,  285,  273,  274,  271,  271,
   28,   29,  297,  298,  285,  303,  272,  271,  289,  275,
  287,  277,  278,  269,   42,  285,  302,  294,  285,  289,
  257,  257,  259,  297,  298,  285,  303,   55,  265,  266,
  285,  297,  298,  299,  271,  285,  273,  274,  257,  289,
  259,  285,  285,  285,  257,  257,  265,  266,  258,  258,
  287,  257,  271,  257,  273,  274,  257,  294,  259,  258,
  257,  272,  258,  257,  265,  266,  257,  299,  287,  257,
  271,  257,  273,  274,  257,  294,  259,  257,    0,   20,
   -1,   -1,  265,  266,   -1,   -1,  287,   -1,  271,   -1,
  273,  274,  257,  294,  259,   -1,   -1,   -1,   -1,   -1,
  265,  266,   -1,   -1,  287,   -1,  271,   -1,  273,  274,
  257,  294,  259,   -1,   -1,  260,   -1,   -1,  265,  266,
   -1,   -1,  287,   -1,  271,  270,  273,  274,  257,  294,
  259,  268,   -1,   -1,   -1,   -1,  265,  266,   -1,  284,
  287,   -1,  279,  280,  273,  274,   -1,  294,  293,   -1,
  295,  296,   59,   60,   61,  292,   63,   64,  287,   66,
   67,  281,  282,  283,   -1,  294,  286,   74,  288,   -1,
  290,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  259,   -1,
  261,  262,  263,  264,  265,  266,  267,   -1,  268,   -1,
  259,   -1,  273,  274,   -1,   -1,  265,  266,   -1,  279,
  280,   -1,   -1,   -1,  273,  274,  287,   -1,   -1,   -1,
  291,   -1,  292,  294,   -1,   -1,   -1,   -1,  287,  300,
  301,  302,  291,   -1,   -1,  294,   -1,   -1,   -1,   -1,
   -1,  300,  301,  302,
};
#define YYFINAL 2
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
#define YYMAXTOKEN 303
#if YYDEBUG
char *ampyyname[] = {
"end-of-file",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,"'('","')'",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"LX_IDENTIFIER",
"LX_ALLOMORPH","LX_CURRENT","LX_FINAL","LX_FA_LEFT","LX_FA_RIGHT","LX_FS_LEFT",
"LX_FS_RIGHT","LX_FLEFT","LX_FRIGHT","LX_IF","LX_IFF","LX_THEN","LX_INITIAL",
"LX_MEMBER","LX_MORPHNAME","LX_PFINAL","LX_PINITIAL","LX_PROPERTY",
"LX_PUNCTUATION","LX_SURFACE","LX_TYPE","LX_XOR","LX_AND","LX_EQ","LX_GE",
"LX_GT","LX_INFX","LX_IS","LX_LE","LX_LEFT","LX_LT","LX_MATCHES","LX_NE",
"LX_NOT","LX_OR","LX_PRFX","LX_RIGHT","LX_ROOT","LX_SUFX","LX_TOCATEGORY",
"LX_FROMCATEGORY","LX_ORDRCLASS","LX_NEXT","LX_LAST","LX_WORD","LX_CAPITALIZED",
};
char *ampyyrule[] = {
"$accept : sptest",
"sptest : name test",
"name : LX_IDENTIFIER",
"test : test logop factor",
"test : LX_IF factor LX_THEN factor",
"test : forleft factor",
"test : forright factor",
"test : factor",
"logop : LX_AND",
"logop : LX_OR",
"logop : LX_XOR",
"logop : LX_IFF",
"forleft : LX_FA_LEFT",
"forleft : LX_FS_LEFT",
"forright : LX_FA_RIGHT",
"forright : LX_FS_RIGHT",
"factor : LX_NOT factor",
"factor : '(' test ')'",
"factor : property_expr",
"factor : string_expr",
"factor : type_expr",
"factor : category_expr",
"factor : orderclass_expr",
"factor : cap_expr",
"factor : punc_expr",
"property_expr : position LX_PROPERTY LX_IS LX_IDENTIFIER",
"string_expr : position LX_MORPHNAME LX_IS LX_IDENTIFIER",
"string_expr : position LX_MORPHNAME LX_IS LX_MEMBER LX_IDENTIFIER",
"string_expr : position LX_MORPHNAME LX_IS position LX_MORPHNAME",
"string_expr : position LX_ALLOMORPH LX_IS LX_IDENTIFIER",
"string_expr : position LX_ALLOMORPH LX_IS LX_MEMBER LX_IDENTIFIER",
"string_expr : position LX_ALLOMORPH LX_IS position LX_ALLOMORPH",
"string_expr : position LX_ALLOMORPH LX_MATCHES LX_IDENTIFIER",
"string_expr : position LX_ALLOMORPH LX_MATCHES LX_MEMBER LX_IDENTIFIER",
"string_expr : position LX_ALLOMORPH LX_MATCHES position LX_ALLOMORPH",
"string_expr : position LX_SURFACE LX_IS LX_IDENTIFIER",
"string_expr : position LX_SURFACE LX_IS LX_MEMBER LX_IDENTIFIER",
"string_expr : position LX_SURFACE LX_IS position LX_ALLOMORPH",
"string_expr : position LX_SURFACE LX_MATCHES LX_IDENTIFIER",
"string_expr : position LX_SURFACE LX_MATCHES LX_MEMBER LX_IDENTIFIER",
"string_expr : position LX_SURFACE LX_MATCHES position LX_ALLOMORPH",
"string_expr : neighbor LX_WORD LX_IS LX_IDENTIFIER",
"string_expr : neighbor LX_WORD LX_IS LX_MEMBER LX_IDENTIFIER",
"string_expr : neighbor LX_WORD LX_MATCHES LX_IDENTIFIER",
"string_expr : neighbor LX_WORD LX_MATCHES LX_MEMBER LX_IDENTIFIER",
"neighbor : LX_LAST",
"neighbor : LX_NEXT",
"type_expr : position LX_TYPE LX_IS type",
"type : LX_PRFX",
"type : LX_INFX",
"type : LX_ROOT",
"type : LX_SUFX",
"type : LX_INITIAL",
"type : LX_FINAL",
"category_expr : position LX_FROMCATEGORY LX_IS position LX_FROMCATEGORY",
"category_expr : position LX_FROMCATEGORY LX_IS position LX_TOCATEGORY",
"category_expr : position LX_TOCATEGORY LX_IS position LX_FROMCATEGORY",
"category_expr : position LX_TOCATEGORY LX_IS position LX_TOCATEGORY",
"category_expr : position LX_FROMCATEGORY LX_IS LX_MEMBER LX_IDENTIFIER",
"category_expr : position LX_TOCATEGORY LX_IS LX_MEMBER LX_IDENTIFIER",
"category_expr : position LX_FROMCATEGORY LX_IS LX_IDENTIFIER",
"category_expr : position LX_TOCATEGORY LX_IS LX_IDENTIFIER",
"cap_expr : position LX_ALLOMORPH LX_IS LX_CAPITALIZED",
"cap_expr : LX_WORD LX_IS LX_CAPITALIZED",
"punc_expr : neighbor LX_PUNCTUATION LX_IS LX_IDENTIFIER",
"punc_expr : neighbor LX_PUNCTUATION LX_IS LX_MEMBER LX_IDENTIFIER",
"orderclass_expr : position LX_ORDRCLASS relop position LX_ORDRCLASS",
"orderclass_expr : position LX_ORDRCLASS relop LX_IDENTIFIER",
"relop : LX_EQ",
"relop : LX_GT",
"relop : LX_GE",
"relop : LX_LE",
"relop : LX_LT",
"relop : LX_NE",
"position : LX_LEFT",
"position : LX_RIGHT",
"position : LX_CURRENT",
"position : LX_FLEFT",
"position : LX_FRIGHT",
"position : LX_PINITIAL",
"position : LX_PFINAL",
};
#endif
#ifdef YYSTACKSIZE
#undef YYMAXDEPTH
#define YYMAXDEPTH YYSTACKSIZE
#else
#ifdef YYMAXDEPTH
#define YYSTACKSIZE YYMAXDEPTH
#else
#define YYSTACKSIZE 500
#define YYMAXDEPTH 500
#endif
#endif
int yydebug;
int yynerrs;
int yyerrflag;
int yychar;
short *yyssp;
YYSTYPE *yyvsp;
YYSTYPE yyval;
YYSTYPE yylval;
short yyss[YYSTACKSIZE];
YYSTYPE yyvs[YYSTACKSIZE];
#define yystacksize YYSTACKSIZE
#line 607 "atest.y"

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
	while ( yylex(pLogFP_m) > 0 )
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
freeAmpleYYLexBuffer();		/* free buffer allocated by yylex(pLogFP_m) */
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
#line 554 "atest.c"
#define YYABORT goto yyabort
#define YYREJECT goto yyabort
#define YYACCEPT goto yyaccept
#define YYERROR goto yyerrlab
int
yyparse()
{
	register int yym, yyn, yystate;
#if YYDEBUG
	register char *yys;
	extern char *getenv();

	if (yys = getenv("YYDEBUG"))
	{
		yyn = *yys;
		if (yyn >= '0' && yyn <= '9')
			yydebug = yyn - '0';
	}
#endif

	yynerrs = 0;
	yyerrflag = 0;
	yychar = (-1);

	yyssp = yyss;
	yyvsp = yyvs;
	*yyssp = yystate = 0;

yyloop:
	if ((yyn = yydefred[yystate]) != 0) goto yyreduce;
	if (yychar < 0)
	{
		if ((yychar = yylex(pLogFP_m)) < 0) yychar = 0;
#if YYDEBUG
		if (yydebug)
		{
			yys = 0;
			if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
			if (!yys) yys = "illegal-symbol";
			printf("%sdebug: state %d, reading %d (%s)\n",
					YYPREFIX, yystate, yychar, yys);
		}
#endif
	}
	if ((yyn = yysindex[yystate]) && (yyn += yychar) >= 0 &&
			yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
	{
#if YYDEBUG
		if (yydebug)
			printf("%sdebug: state %d, shifting to state %d\n",
					YYPREFIX, yystate, yytable[yyn]);
#endif
		if (yyssp >= yyss + yystacksize - 1)
		{
			goto yyoverflow;
		}
		*++yyssp = yystate = yytable[yyn];
		*++yyvsp = yylval;
		yychar = (-1);
		if (yyerrflag > 0)  --yyerrflag;
		goto yyloop;
	}
	if ((yyn = yyrindex[yystate]) && (yyn += yychar) >= 0 &&
			yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
	{
		yyn = yytable[yyn];
		goto yyreduce;
	}
	if (yyerrflag) goto yyinrecovery;
#ifdef lint
	goto yynewerror;
#endif
	yyerror("syntax error");
#ifdef lint
	goto yyerrlab;
#endif
	++yynerrs;
yyinrecovery:
	if (yyerrflag < 3)
	{
		yyerrflag = 3;
		for (;;)
		{
			if ((yyn = yysindex[*yyssp]) && (yyn += YYERRCODE) >= 0 &&
					yyn <= YYTABLESIZE && yycheck[yyn] == YYERRCODE)
			{
#if YYDEBUG
				if (yydebug)
					printf("%sdebug: state %d, error recovery shifting\
 to state %d\n", YYPREFIX, *yyssp, yytable[yyn]);
#endif
				if (yyssp >= yyss + yystacksize - 1)
				{
					goto yyoverflow;
				}
				*++yyssp = yystate = yytable[yyn];
				*++yyvsp = yylval;
				goto yyloop;
			}
			else
			{
#if YYDEBUG
				if (yydebug)
					printf("%sdebug: error recovery discarding state %d\n",
							YYPREFIX, *yyssp);
#endif
				if (yyssp <= yyss) goto yyabort;
				--yyssp;
				--yyvsp;
			}
		}
	}
	else
	{
		if (yychar == 0) goto yyabort;
#if YYDEBUG
		if (yydebug)
		{
			yys = 0;
			if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
			if (!yys) yys = "illegal-symbol";
			printf("%sdebug: state %d, error recovery discards token %d (%s)\n",
					YYPREFIX, yystate, yychar, yys);
		}
#endif
		yychar = (-1);
		goto yyloop;
	}
yyreduce:
#if YYDEBUG
	if (yydebug)
		printf("%sdebug: state %d, reducing by rule %d (%s)\n",
				YYPREFIX, yystate, yyn, yyrule[yyn]);
#endif
	yym = yylen[yyn];
	yyval = yyvsp[1-yym];
	switch (yyn)
	{
case 1:
#line 129 "atest.y"
{
	yyval.tstval = pAmpleTestTree_m = makeAmpleTest( yyvsp[0].tstval, szTestName_m );
	}
break;
case 2:
#line 135 "atest.y"
{
	strncpy(szTestName_m, yyvsp[0].cval, 99); /* save for error messages */
	bForLeftSeen_m  = FALSE;   /* These must be initialized for */
	bForRightSeen_m = FALSE;   /* each test we parse! */
	bLeftSeen_m     = FALSE;
	bRightSeen_m    = FALSE;
	bUsesPrevWord_m = FALSE;
	bUsesNextWord_m = FALSE;
	}
break;
case 3:
#line 148 "atest.y"
{
	yyval.tstval = makeAmpleTestNode(yyvsp[-1].ival, yyvsp[-2].tstval, yyvsp[0].tstval);
	}
break;
case 4:
#line 152 "atest.y"
{
	yyval.tstval = makeAmpleTestNode( LOGIF, yyvsp[-2].tstval, yyvsp[0].tstval);
	}
break;
case 5:
#line 156 "atest.y"
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
	yyval.tstval = makeAmpleTestNode(yyvsp[-1].ival, yyvsp[0].tstval, (AmpleTestNode *)NULL);
	bForLeftSeen_m = TRUE;
	}
break;
case 6:
#line 175 "atest.y"
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
	yyval.tstval = makeAmpleTestNode(yyvsp[-1].ival, yyvsp[0].tstval, (AmpleTestNode *)NULL);
	}
break;
case 7:
#line 194 "atest.y"
{
	}
break;
case 8:
#line 200 "atest.y"
{
	yyval.ival = LOGAND;
	}
break;
case 9:
#line 204 "atest.y"
{
	yyval.ival = LOGOR;
	}
break;
case 10:
#line 208 "atest.y"
{
	yyval.ival = LOGXOR;
	}
break;
case 11:
#line 212 "atest.y"
{
	yyval.ival = LOGIFF;
	}
break;
case 12:
#line 219 "atest.y"
{
	yyval.ival = ALL_LEFT;
	}
break;
case 13:
#line 223 "atest.y"
{
	yyval.ival = SOME_LEFT;
	}
break;
case 14:
#line 230 "atest.y"
{
	yyval.ival = ALL_RIGHT;
	}
break;
case 15:
#line 234 "atest.y"
{
	yyval.ival = SOME_RIGHT;
	}
break;
case 16:
#line 241 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
		yyval.tstval->iOpCode ^= OP_NOT;
	}
break;
case 17:
#line 246 "atest.y"
{
	yyval.tstval = yyvsp[-1].tstval;
	}
break;
case 18:
#line 250 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	}
break;
case 19:
#line 254 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	}
break;
case 20:
#line 258 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	}
break;
case 21:
#line 262 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	}
break;
case 22:
#line 266 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	}
break;
case 23:
#line 270 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	}
break;
case 24:
#line 274 "atest.y"
{
		yyval.tstval = yyvsp[0].tstval;
	}
break;
case 25:
#line 281 "atest.y"
{
	if ((uiTempProperty_m = findAmplePropertyNumber(yyvsp[0].cval,
						 &pAmpleData_m->sProperties)) == 0)
	   id_error("property", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestProperty(PROP_IS, yyvsp[-3].ival, uiTempProperty_m);
	}
break;
case 26:
#line 291 "atest.y"
{
	yyval.tstval = makeAmpleTestString(MORPH_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	}
break;
case 27:
#line 295 "atest.y"
{
	if ((pTempMorphClass_m = findAmpleMorphClass(yyvsp[0].cval,
					 pAmpleData_m->pMorphClasses)) == NULL)
		id_error("morpheme class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestMorphClass(MORPH_MEMBER, yyvsp[-4].ival, pTempMorphClass_m);
	}
break;
case 28:
#line 302 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(MOR_IS_MORPH, yyvsp[-4].ival, yyvsp[-1].ival);
	}
break;
case 29:
#line 306 "atest.y"
{
	if (strcmp(yyvsp[0].cval,"0") == 0)
		*(yyvsp[0].cval) = NUL;
	yyval.tstval = makeAmpleTestString(ALLO_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	}
break;
case 30:
#line 312 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(ALLO_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
	}
break;
case 31:
#line 319 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(ALLO_IS_AL, yyvsp[-4].ival, yyvsp[-1].ival);
	}
break;
case 32:
#line 323 "atest.y"
{
	yyval.tstval = makeAmpleTestString(ALLO_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	}
break;
case 33:
#line 327 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(AL_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
	}
break;
case 34:
#line 334 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(AL_MAT_AL, yyvsp[-4].ival, yyvsp[-1].ival);
	}
break;
case 35:
#line 338 "atest.y"
{
	yyval.tstval = makeAmpleTestString(STRING_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	}
break;
case 36:
#line 342 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(STRING_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
	}
break;
case 37:
#line 349 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(ST_IS_AL, yyvsp[-4].ival, yyvsp[-1].ival);
	}
break;
case 38:
#line 353 "atest.y"
{
	yyval.tstval = makeAmpleTestString(ST_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	}
break;
case 39:
#line 357 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(ST_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
	}
break;
case 40:
#line 364 "atest.y"
{
		yyval.tstval = makeAmpleTestInt(ST_MAT_AL, yyvsp[-4].ival, yyvsp[-1].ival );
	}
break;
case 41:
#line 368 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-3].ival); /* 3.3.0 hab */
	yyval.tstval = makeAmpleTestString(WORD_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	}
break;
case 42:
#line 373 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-4].ival); /* 3.3.0 hab */
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(WORD_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
	}
break;
case 43:
#line 381 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-3].ival); /* 3.3.0 hab */
	yyval.tstval = makeAmpleTestString(WORD_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	}
break;
case 44:
#line 386 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-4].ival); /* 3.3.0 hab */
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(WD_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
	}
break;
case 45:
#line 397 "atest.y"
{
	yyval.ival = LAST;
	/* 3.3.0 hab  can't be here because is used by punctuation now, too */
	/* bUsesPrevWord_m = TRUE; */
	}
break;
case 46:
#line 403 "atest.y"
{
	yyval.ival = NEXT;
	/* 3.3.0 hab  can't be here because is used by punctuation now, too */
	/* bUsesNextWord_m = TRUE; */
	}
break;
case 47:
#line 412 "atest.y"
{
		yyval.tstval = makeAmpleTestInt(TYPE_IS, yyvsp[-3].ival, yyvsp[0].ival);
	}
break;
case 48:
#line 419 "atest.y"
{
	yyval.ival = AMPLE_PFX;
	}
break;
case 49:
#line 423 "atest.y"
{
	yyval.ival = AMPLE_IFX;
	}
break;
case 50:
#line 427 "atest.y"
{
	yyval.ival = AMPLE_ROOT;
	}
break;
case 51:
#line 431 "atest.y"
{
	yyval.ival = AMPLE_SFX;
	}
break;
case 52:
#line 435 "atest.y"
{
	yyval.ival = WINITIAL;
	}
break;
case 53:
#line 439 "atest.y"
{
	yyval.ival = WFINAL;
	}
break;
case 54:
#line 446 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(FROM_IS_FROM, yyvsp[-4].ival, yyvsp[-1].ival);
	}
break;
case 55:
#line 450 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(FR_IS_TO, yyvsp[-4].ival, yyvsp[-1].ival);
	}
break;
case 56:
#line 454 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(TO_IS_FROM, yyvsp[-4].ival, yyvsp[-1].ival);
	}
break;
case 57:
#line 458 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(TO_IS_TO, yyvsp[-4].ival, yyvsp[-1].ival);
	}
break;
case 58:
#line 462 "atest.y"
{
	if ((pTempCatClass_m = findAmpleCategClass(yyvsp[0].cval,
					  pAmpleData_m->pCategoryClasses)) == NULL)
		id_error("category class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestCategClass(FROM_MEMBER, yyvsp[-4].ival, pTempCatClass_m);
	}
break;
case 59:
#line 469 "atest.y"
{
	if ((pTempCatClass_m = findAmpleCategClass(yyvsp[0].cval,
					  pAmpleData_m->pCategoryClasses)) == NULL)
		id_error("category class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestCategClass(TO_MEMBER, yyvsp[-4].ival, pTempCatClass_m);
	}
break;
case 60:
#line 476 "atest.y"
{
	if ((iTemp_m = findAmpleCategoryNumber(yyvsp[0].cval,
						pAmpleData_m->pCategories)) == 0)
		id_error("category", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestInt(FROM_IS, yyvsp[-3].ival, iTemp_m);
	}
break;
case 61:
#line 483 "atest.y"
{
	if ((iTemp_m = findAmpleCategoryNumber(yyvsp[0].cval,
						pAmpleData_m->pCategories)) == 0)
		id_error("category", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestInt(TO_IS, yyvsp[-3].ival, iTemp_m);
	}
break;
case 62:
#line 493 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(AL_IS_CAP, yyvsp[-3].ival, 0);
	}
break;
case 63:
#line 497 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(WD_IS_CAP, yyvsp[-2].ival, 0);
	}
break;
case 64:
#line 504 "atest.y"
{
	yyval.tstval = makeAmpleTestPunct(PUNCT_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	}
break;
case 65:
#line 508 "atest.y"
{
	pTempPunctClass_m = findPunctClass(yyvsp[0].cval, pAmpleData_m->pPunctClasses);
	if (pTempPunctClass_m == NULL)
		id_error("punctuation class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestPunctClass(PUNCT_MEMBER, yyvsp[-4].ival, pTempPunctClass_m );
	}
break;
case 66:
#line 518 "atest.y"
{
	yyval.tstval = makeAmpleTestInt( yyvsp[-2].ival, yyvsp[-4].ival, yyvsp[-1].ival );
	}
break;
case 67:
#line 522 "atest.y"
{
	iTemp_m = atoi(yyvsp[0].cval);    /* convert identifier to integer */
			/* check for valid digit sequence */
	pszTemp_m = yyvsp[0].cval;
	if (*pszTemp_m == '-') pszTemp_m++;   /* skip initial minus sign */
	while (*pszTemp_m != NUL)  /* rest should be digits */
	   {
	   if (!isdigit(*pszTemp_m++))
		{           /* found a non-digit; report error */
		if (pLogFP_m != NULL)
		{
		fprintf(pLogFP_m,
		"%s%s constant %s in orderclass expression is not a number.\n",
			pszErrorHeader_m, szTestName_m, yyvsp[0].cval );
		fprintf(pLogFP_m,
			"%19sWill use the value %d for it\n", " ", iTemp_m);
		}
		break;
		}
	   }
	yyval.tstval = makeAmpleTestInt( yyvsp[-1].ival + (ORDR_EQ_CON-ORDR_EQ), yyvsp[-3].ival, iTemp_m );
	}
break;
case 68:
#line 548 "atest.y"
{
	yyval.ival = ORDR_EQ;
	}
break;
case 69:
#line 552 "atest.y"
{
	yyval.ival = ORDR_GT;
	}
break;
case 70:
#line 556 "atest.y"
{
	yyval.ival = ORDR_GE;
	}
break;
case 71:
#line 560 "atest.y"
{
	yyval.ival = ORDR_LE;
	}
break;
case 72:
#line 564 "atest.y"
{
	yyval.ival = ORDR_LT;
	}
break;
case 73:
#line 568 "atest.y"
{
	yyval.ival = ORDR_NE;
	}
break;
case 74:
#line 575 "atest.y"
{
	yyval.ival = ARGLEFT;
	}
break;
case 75:
#line 579 "atest.y"
{
	yyval.ival = ARGRIGHT;
	}
break;
case 76:
#line 583 "atest.y"
{
	yyval.ival = ARGCURRENT;
	}
break;
case 77:
#line 587 "atest.y"
{
	++bLeftSeen_m;
	yyval.ival = FORLEFT;
	}
break;
case 78:
#line 592 "atest.y"
{
	++bRightSeen_m;
	yyval.ival = FORRIGHT;
	}
break;
case 79:
#line 597 "atest.y"
{
	yyval.ival = INITIALM;
	}
break;
case 80:
#line 601 "atest.y"
{
	yyval.ival = FINALM;
	}
break;
#line 1281 "atest.c"
	}
	yyssp -= yym;
	yystate = *yyssp;
	yyvsp -= yym;
	yym = yylhs[yyn];
	if (yystate == 0 && yym == 0)
	{
#if YYDEBUG
		if (yydebug)
			printf("%sdebug: after reduction, shifting from state 0 to\
 state %d\n", YYPREFIX, YYFINAL);
#endif
		yystate = YYFINAL;
		*++yyssp = YYFINAL;
		*++yyvsp = yyval;
		if (yychar < 0)
		{
			if ((yychar = yylex(pLogFP_m)) < 0) yychar = 0;
#if YYDEBUG
			if (yydebug)
			{
				yys = 0;
				if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
				if (!yys) yys = "illegal-symbol";
				printf("%sdebug: state %d, reading %d (%s)\n",
						YYPREFIX, YYFINAL, yychar, yys);
			}
#endif
		}
		if (yychar == 0) goto yyaccept;
		goto yyloop;
	}
	if ((yyn = yygindex[yym]) && (yyn += yystate) >= 0 &&
			yyn <= YYTABLESIZE && yycheck[yyn] == yystate)
		yystate = yytable[yyn];
	else
		yystate = yydgoto[yym];
#if YYDEBUG
	if (yydebug)
		printf("%sdebug: after reduction, shifting from state %d \
to state %d\n", YYPREFIX, *yyssp, yystate);
#endif
	if (yyssp >= yyss + yystacksize - 1)
	{
		goto yyoverflow;
	}
	*++yyssp = yystate;
	*++yyvsp = yyval;
	goto yyloop;
yyoverflow:
	yyerror("yacc stack overflow");
yyabort:
	return (1);
yyaccept:
	return (0);
}
