#define YYBYACC 1
#define YYMAJOR 1
#define YYMINOR 9
#define yyclearin (yychar=(-1))
#define yyerrok (yyerrflag=0)
#define YYRECOVERING (yyerrflag!=0)
#define yyparse stampyyparse
#define yylex stampyylex
#define yyerror stampyyerror
#define yychar stampyychar
#define yyval stampyyval
#define yylval stampyylval
#define yydebug stampyydebug
#define yynerrs stampyynerrs
#define yyerrflag stampyyerrflag
#define yyss stampyyss
#define yyssp stampyyssp
#define yyvs stampyyvs
#define yyvsp stampyyvsp
#define yylhs stampyylhs
#define yylen stampyylen
#define yydefred stampyydefred
#define yydgoto stampyydgoto
#define yysindex stampyysindex
#define yyrindex stampyyrindex
#define yygindex stampyygindex
#define yytable stampyytable
#define yycheck stampyycheck
#define yyname stampyyname
#define yyrule stampyyrule
#define YYPREFIX "stampyy"
#line 14 "sytest.y"
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

#line 59 "sytest.y"
typedef union  {
	int ival;
	char *cval;
	AmpleTestNode *tstval;
	StampAction *actval;
	} YYSTYPE;
#line 85 "sytest_l.c"
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
#define LX_INSERT 302
#define LX_AFTER 303
#define LX_BEFORE 304
#define LX_REPORT 305
#define LX_MESSAGE 306
#define YYERRCODE 256
short stampyylhs[] = {                                        -1,
	0,    0,    1,    3,    3,    3,    3,    3,   13,   13,
   13,   13,    9,    9,   10,   10,    2,    2,    2,    2,
	2,    2,    2,    2,    6,    7,    7,    7,    7,    7,
	7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
   19,   19,    8,   12,   12,   12,   12,   12,   12,    4,
	4,    4,    4,    4,    4,    4,    4,    5,    5,   20,
   20,   11,   11,   11,   11,   11,   11,   14,   14,   14,
   14,   14,   14,   14,   15,   15,   16,   16,   17,   17,
   18,   18,   18,
};
short stampyylen[] = {                                         2,
	2,    5,    1,    3,    4,    2,    2,    1,    1,    1,
	1,    1,    1,    1,    1,    1,    2,    3,    1,    1,
	1,    1,    1,    1,    4,    4,    5,    5,    4,    5,
	5,    4,    5,    5,    4,    5,    5,    4,    5,    5,
	1,    1,    4,    1,    1,    1,    1,    1,    1,    5,
	5,    5,    5,    5,    5,    4,    4,    5,    4,    4,
	5,    1,    1,    1,    1,    1,    1,    1,    1,    1,
	1,    1,    1,    1,    1,    3,    1,    1,    4,    4,
	1,    2,    2,
};
short stampyydefred[] = {                                      0,
	3,    0,    0,   70,   13,   15,   14,   16,   71,   72,
	0,   74,   73,   68,    0,   69,   42,   41,    0,    8,
	0,   22,   23,   19,   20,   21,    0,    0,    0,    0,
   24,    0,   17,    0,   12,   11,    9,   10,    0,    0,
	6,    7,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,   18,    0,    0,    0,    0,   77,   78,    4,
	0,    0,    0,    0,    0,    0,    0,    0,    0,   62,
   64,   63,   65,   66,   67,    0,    0,    5,    0,   82,
   83,    2,    0,   29,    0,    0,   32,    0,    0,   26,
	0,    0,   25,   35,    0,    0,   38,    0,    0,   49,
   48,   45,   44,   46,   47,   43,   57,    0,    0,   56,
	0,    0,   59,    0,   60,    0,    0,    0,   76,   30,
   31,   33,   34,   27,   28,   36,   37,   39,   40,   55,
   53,   52,   54,   51,   50,   58,   61,   80,   79,
};
short stampyydgoto[] = {                                       2,
	3,   20,   21,   22,   23,   24,   25,   26,   27,   28,
   76,  106,   40,   29,   56,   57,   58,   59,   30,   31,
};
short stampyysindex[] = {                                   -241,
	0,    0,  -40,    0,    0,    0,    0,    0,    0,    0,
  -29,    0,    0,    0,  -29,    0,    0,    0,  -40,    0,
 -122,    0,    0,    0,    0,    0,  -29,  -29, -250, -252,
	0, -243,    0,  -39,    0,    0,    0,    0, -267,  -29,
	0,    0, -268, -245, -233, -266, -231, -225, -220, -249,
 -218,  -29,    0, -221, -253,  -68,   27,    0,    0,    0,
 -215, -191, -172, -184, -153, -134, -179, -110,  -92,    0,
	0,    0,    0,    0,    0,  -74, -242,    0, -258,    0,
	0,    0, -267,    0, -181, -180,    0, -171, -170,    0,
 -168, -195,    0,    0, -167, -166,    0, -162, -161,    0,
	0,    0,    0,    0,    0,    0,    0, -159, -234,    0,
 -157, -228,    0, -192,    0, -149,  -17,  -17,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,
};
short stampyyrindex[] = {                                      0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
  109,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,  -41,    0,  -15,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,    0,    0,    0,    0,    0,    0,
};
short stampyygindex[] = {                                      0,
	0,    3,   92,    0,    0,    0,    0,    0,    0,    0,
	0,    0,    0,  -56,   36,    0,    0,    0,    0,    0,
};
#define YYTABLESIZE 277
short stampyytable[] = {                                      19,
   39,   53,   81,   80,   86,   89,   92,   43,   96,   99,
   19,  109,  112,   32,  115,    1,   61,   33,   65,  114,
   62,   44,   66,   51,   45,   52,   46,   47,  116,   41,
   42,   70,   71,   72,   54,   79,   73,   55,   74,   63,
   75,   84,   60,    4,  117,  118,   48,   49,   50,    9,
   10,   64,   81,   67,   78,   85,   82,   12,   13,   68,
  138,  139,  131,  132,   69,   87,   77,    4,  134,  135,
   83,   14,   93,    9,   10,  120,  125,  121,   16,   88,
  100,   12,   13,   81,   90,  122,    4,  123,  124,  126,
  101,  127,    9,   10,  128,   14,  129,  130,   91,  133,
   12,   13,   16,   94,  102,    4,  136,  137,    1,   75,
   34,    9,   10,  103,   14,  104,  105,   95,  119,   12,
   13,   16,   97,    0,    4,    0,    0,    0,    0,    0,
	9,   10,    0,   14,    0,    0,   98,    0,   12,   13,
   16,    0,    0,    0,    0,   35,  107,    0,    4,    0,
	0,    0,   14,    0,    9,   10,   36,   37,    0,   16,
  108,    0,   12,   13,  110,    0,    4,    0,    0,   38,
	0,    0,    9,   10,    0,    0,   14,    0,  111,    0,
   12,   13,  113,   16,    4,    0,    0,    0,    0,    0,
	9,   10,    0,    0,   14,    0,    0,    0,   12,   13,
	0,   16,    0,    0,    0,    0,    0,    0,    0,    0,
	0,    0,   14,    0,    0,    0,    0,    0,    4,   16,
	5,    6,    7,    8,    9,   10,   11,    0,   35,    4,
	0,    0,   12,   13,    0,    9,   10,    0,    0,   36,
   37,    4,    0,   12,   13,    0,   14,    9,   10,    0,
   15,    0,   38,   16,    0,   12,   13,   14,    0,   17,
   18,   15,    0,    0,   16,    0,    0,    0,    0,   14,
   17,   18,    0,    0,    0,    0,   16,
};
short stampyycheck[] = {                                      40,
  123,   41,   44,  257,   61,   62,   63,  258,   65,   66,
   40,   68,   69,   11,  257,  257,  285,   15,  285,   76,
  289,  272,  289,  276,  275,  269,  277,  278,  271,   27,
   28,  281,  282,  283,  302,  257,  286,  305,  288,  285,
  290,  257,   40,  259,  303,  304,  297,  298,  299,  265,
  266,  285,  306,  285,   52,  271,  125,  273,  274,  285,
  117,  118,  297,  298,  285,  257,  285,  259,  297,  298,
   44,  287,  257,  265,  266,  257,  272,  258,  294,  271,
  260,  273,  274,  125,  257,  257,  259,  258,  257,  257,
  270,  258,  265,  266,  257,  287,  258,  257,  271,  257,
  273,  274,  294,  257,  284,  259,  299,  257,    0,  125,
   19,  265,  266,  293,  287,  295,  296,  271,   83,  273,
  274,  294,  257,   -1,  259,   -1,   -1,   -1,   -1,   -1,
  265,  266,   -1,  287,   -1,   -1,  271,   -1,  273,  274,
  294,   -1,   -1,   -1,   -1,  268,  257,   -1,  259,   -1,
   -1,   -1,  287,   -1,  265,  266,  279,  280,   -1,  294,
  271,   -1,  273,  274,  257,   -1,  259,   -1,   -1,  292,
   -1,   -1,  265,  266,   -1,   -1,  287,   -1,  271,   -1,
  273,  274,  257,  294,  259,   -1,   -1,   -1,   -1,   -1,
  265,  266,   -1,   -1,  287,   -1,   -1,   -1,  273,  274,
   -1,  294,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,  287,   -1,   -1,   -1,   -1,   -1,  259,  294,
  261,  262,  263,  264,  265,  266,  267,   -1,  268,  259,
   -1,   -1,  273,  274,   -1,  265,  266,   -1,   -1,  279,
  280,  259,   -1,  273,  274,   -1,  287,  265,  266,   -1,
  291,   -1,  292,  294,   -1,  273,  274,  287,   -1,  300,
  301,  291,   -1,   -1,  294,   -1,   -1,   -1,   -1,  287,
  300,  301,   -1,   -1,   -1,   -1,  294,
};
#define YYFINAL 2
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
#define YYMAXTOKEN 306
#if YYDEBUG
char *stampyyname[] = {
"end-of-file",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,"'('","')'",0,0,"','",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"'{'",0,"'}'",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
"LX_IDENTIFIER","LX_ALLOMORPH","LX_CURRENT","LX_FINAL","LX_FA_LEFT",
"LX_FA_RIGHT","LX_FS_LEFT","LX_FS_RIGHT","LX_FLEFT","LX_FRIGHT","LX_IF",
"LX_IFF","LX_THEN","LX_INITIAL","LX_MEMBER","LX_MORPHNAME","LX_PFINAL",
"LX_PINITIAL","LX_PROPERTY","LX_PUNCTUATION","LX_SURFACE","LX_TYPE","LX_XOR",
"LX_AND","LX_EQ","LX_GE","LX_GT","LX_INFX","LX_IS","LX_LE","LX_LEFT","LX_LT",
"LX_MATCHES","LX_NE","LX_NOT","LX_OR","LX_PRFX","LX_RIGHT","LX_ROOT","LX_SUFX",
"LX_TOCATEGORY","LX_FROMCATEGORY","LX_ORDRCLASS","LX_NEXT","LX_LAST",
"LX_INSERT","LX_AFTER","LX_BEFORE","LX_REPORT","LX_MESSAGE",
};
char *stampyyrule[] = {
"$accept : sptest",
"sptest : name test",
"sptest : name test '{' actions '}'",
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
"orderclass_expr : position LX_ORDRCLASS relop position LX_ORDRCLASS",
"orderclass_expr : position LX_ORDRCLASS relop LX_IDENTIFIER",
"punc_expr : neighbor LX_PUNCTUATION LX_IS LX_IDENTIFIER",
"punc_expr : neighbor LX_PUNCTUATION LX_IS LX_MEMBER LX_IDENTIFIER",
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
"actions : action",
"actions : action ',' actions",
"action : insert",
"action : report",
"insert : LX_INSERT LX_IDENTIFIER LX_BEFORE position",
"insert : LX_INSERT LX_IDENTIFIER LX_AFTER position",
"report : LX_REPORT",
"report : LX_REPORT LX_IDENTIFIER",
"report : LX_REPORT LX_MESSAGE",
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
#line 617 "sytest.y"

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
#line 615 "sytest_l.c"
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
		if ((yychar = yylex()) < 0) yychar = 0;
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
#line 145 "sytest.y"
{
		yyval.tstval = pTestTree_m = makeAmpleTest( yyvsp[0].tstval, szTestName_m );
		pTestActions_m = (StampAction *)NULL;
		}
break;
case 2:
#line 150 "sytest.y"
{
		yyval.tstval = pTestTree_m = makeAmpleTest( yyvsp[-3].tstval, szTestName_m );
		pTestActions_m = yyvsp[-1].actval;
		}
break;
case 3:
#line 158 "sytest.y"
{
		strncpy(szTestName_m, yyvsp[0].cval, 99);    /* save for error messages */
		bForLeftSeen_m = FALSE;    /* These must be initialized for */
		bForRightSeen_m = FALSE;   /* each test we parse! */
		bLeftSeen_m = FALSE;
		bRightSeen_m = FALSE;
		}
break;
case 4:
#line 169 "sytest.y"
{
		yyval.tstval = makeAmpleTestNode(yyvsp[-1].ival, yyvsp[-2].tstval, yyvsp[0].tstval);
		}
break;
case 5:
#line 173 "sytest.y"
{
		yyval.tstval = makeAmpleTestNode( LOGIF, yyvsp[-2].tstval, yyvsp[0].tstval);
		}
break;
case 6:
#line 177 "sytest.y"
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
		yyval.tstval = makeAmpleTestNode(yyvsp[-1].ival, yyvsp[0].tstval, (AmpleTestNode *)NULL);
		bForLeftSeen_m = TRUE;
		}
break;
case 7:
#line 196 "sytest.y"
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
		yyval.tstval = makeAmpleTestNode(yyvsp[-1].ival, yyvsp[0].tstval, (AmpleTestNode *)NULL);
		}
break;
case 8:
#line 215 "sytest.y"
{
		}
break;
case 9:
#line 221 "sytest.y"
{
		yyval.ival = LOGAND;
		}
break;
case 10:
#line 225 "sytest.y"
{
		yyval.ival = LOGOR;
		}
break;
case 11:
#line 229 "sytest.y"
{
		yyval.ival = LOGXOR;
		}
break;
case 12:
#line 233 "sytest.y"
{
		yyval.ival = LOGIFF;
		}
break;
case 13:
#line 240 "sytest.y"
{
		yyval.ival = ALL_LEFT;
		}
break;
case 14:
#line 244 "sytest.y"
{
		yyval.ival = SOME_LEFT;
		}
break;
case 15:
#line 251 "sytest.y"
{
		yyval.ival = ALL_RIGHT;
		}
break;
case 16:
#line 255 "sytest.y"
{
		yyval.ival = SOME_RIGHT;
		}
break;
case 17:
#line 262 "sytest.y"
{
		yyval.tstval = yyvsp[0].tstval;
				yyval.tstval->iOpCode ^= OP_NOT;
		}
break;
case 18:
#line 267 "sytest.y"
{
		yyval.tstval = yyvsp[-1].tstval;
		}
break;
case 19:
#line 271 "sytest.y"
{
		yyval.tstval = yyvsp[0].tstval;
		}
break;
case 20:
#line 275 "sytest.y"
{
		yyval.tstval = yyvsp[0].tstval;
		}
break;
case 21:
#line 279 "sytest.y"
{
		yyval.tstval = yyvsp[0].tstval;
		}
break;
case 22:
#line 283 "sytest.y"
{
		yyval.tstval = yyvsp[0].tstval;
		}
break;
case 23:
#line 287 "sytest.y"
{
		yyval.tstval = yyvsp[0].tstval;
		}
break;
case 24:
#line 291 "sytest.y"
{
		yyval.tstval = yyvsp[0].tstval;
	}
break;
case 25:
#line 298 "sytest.y"
{
		if ((uiTempProperty = findAmplePropertyNumber(yyvsp[0].cval, &pStamp_m->sProperties)) == 0)
		   id_error("property", yyvsp[0].cval);
		yyval.tstval = makeAmpleTestProperty(PROP_IS, yyvsp[-3].ival, uiTempProperty);
		}
break;
case 26:
#line 307 "sytest.y"
{
		yyval.tstval = makeAmpleTestString(MORPH_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval) );
		}
break;
case 27:
#line 311 "sytest.y"
{
		if ((pTempMorphClass_m = findAmpleMorphClass(yyvsp[0].cval, pStamp_m->pMorphClasses)) == NULL)
			id_error("morpheme class", yyvsp[0].cval);
		yyval.tstval = makeAmpleTestMorphClass(MORPH_MEMBER, yyvsp[-4].ival, pTempMorphClass_m);
		}
break;
case 28:
#line 317 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt(MOR_IS_MORPH, yyvsp[-4].ival, yyvsp[-1].ival);
		}
break;
case 29:
#line 321 "sytest.y"
{
		if (strcmp(yyvsp[0].cval,"0") == 0)
			*(yyvsp[0].cval) = NUL;
		yyval.tstval = makeAmpleTestString(ALLO_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
		}
break;
case 30:
#line 327 "sytest.y"
{
		if ((pTempStringClass_m = findStringClass(yyvsp[0].cval, pStamp_m->pStringClasses)) == NULL)
			id_error("string class", yyvsp[0].cval);
		yyval.tstval = makeAmpleTestStringClass(ALLO_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
		}
break;
case 31:
#line 333 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt(ALLO_IS_AL, yyvsp[-4].ival, yyvsp[-1].ival);
		}
break;
case 32:
#line 337 "sytest.y"
{
		yyval.tstval = makeAmpleTestString(ALLO_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
		}
break;
case 33:
#line 341 "sytest.y"
{
		if ((pTempStringClass_m = findStringClass(yyvsp[0].cval, pStamp_m->pStringClasses)) == NULL)
			id_error("string class", yyvsp[0].cval);
		yyval.tstval = makeAmpleTestStringClass(AL_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
		}
break;
case 34:
#line 347 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt(AL_MAT_AL, yyvsp[-4].ival, yyvsp[-1].ival);
		}
break;
case 35:
#line 351 "sytest.y"
{
		yyval.tstval = makeAmpleTestString(STRING_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
		}
break;
case 36:
#line 355 "sytest.y"
{
		if ((pTempStringClass_m = findStringClass(yyvsp[0].cval, pStamp_m->pStringClasses)) == NULL)
			id_error("string class", yyvsp[0].cval);
		yyval.tstval = makeAmpleTestStringClass(STRING_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
		}
break;
case 37:
#line 361 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt(ST_IS_AL, yyvsp[-4].ival, yyvsp[-1].ival);
		}
break;
case 38:
#line 365 "sytest.y"
{
		yyval.tstval = makeAmpleTestString(ST_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
		}
break;
case 39:
#line 369 "sytest.y"
{
		if ((pTempStringClass_m = findStringClass(yyvsp[0].cval, pStamp_m->pStringClasses)) == NULL)
			id_error("string class", yyvsp[0].cval);
		yyval.tstval = makeAmpleTestStringClass(ST_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
		}
break;
case 40:
#line 375 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt(ST_MAT_AL, yyvsp[-4].ival, yyvsp[-1].ival );
		}
break;
case 41:
#line 382 "sytest.y"
{
	yyval.ival = LAST;
	}
break;
case 42:
#line 386 "sytest.y"
{
	yyval.ival = NEXT;
	}
break;
case 43:
#line 393 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt(TYPE_IS, yyvsp[-3].ival, yyvsp[0].ival);
		}
break;
case 44:
#line 400 "sytest.y"
{
		yyval.ival = PFX;
		}
break;
case 45:
#line 404 "sytest.y"
{
		yyval.ival = IFX;
		}
break;
case 46:
#line 408 "sytest.y"
{
		yyval.ival = ROOT;
		}
break;
case 47:
#line 412 "sytest.y"
{
		yyval.ival = SFX;
		}
break;
case 48:
#line 416 "sytest.y"
{
		yyval.ival = WINITIAL;
		}
break;
case 49:
#line 420 "sytest.y"
{
		yyval.ival = WFINAL;
		}
break;
case 50:
#line 427 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt(FROM_IS_FROM, yyvsp[-4].ival, yyvsp[-1].ival);
		}
break;
case 51:
#line 431 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt(FR_IS_TO, yyvsp[-4].ival, yyvsp[-1].ival);
		}
break;
case 52:
#line 435 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt(TO_IS_FROM, yyvsp[-4].ival, yyvsp[-1].ival);
		}
break;
case 53:
#line 439 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt(TO_IS_TO, yyvsp[-4].ival, yyvsp[-1].ival);
		}
break;
case 54:
#line 443 "sytest.y"
{
		if ((pTempCatClass_m = findAmpleCategClass(yyvsp[0].cval, pStamp_m->pCategClasses)) == NULL)
			id_error("category class", yyvsp[0].cval);
		yyval.tstval = makeAmpleTestCategClass(FROM_MEMBER, yyvsp[-4].ival, pTempCatClass_m);
		}
break;
case 55:
#line 449 "sytest.y"
{
		if ((pTempCatClass_m = findAmpleCategClass(yyvsp[0].cval, pStamp_m->pCategClasses)) == NULL)
			id_error("category class", yyvsp[0].cval);
		yyval.tstval = makeAmpleTestCategClass(TO_MEMBER, yyvsp[-4].ival, pTempCatClass_m);
		}
break;
case 56:
#line 455 "sytest.y"
{
		if ((iTemp_m = findAmpleCategoryNumber(yyvsp[0].cval, pStamp_m->pCategories)) == 0)
			id_error("category", yyvsp[0].cval);
		yyval.tstval = makeAmpleTestInt(FROM_IS, yyvsp[-3].ival, iTemp_m);
		}
break;
case 57:
#line 461 "sytest.y"
{
		if ((iTemp_m = findAmpleCategoryNumber(yyvsp[0].cval, pStamp_m->pCategories)) == 0)
			id_error("category", yyvsp[0].cval);
		yyval.tstval = makeAmpleTestInt(TO_IS, yyvsp[-3].ival, iTemp_m);
		}
break;
case 58:
#line 470 "sytest.y"
{
		yyval.tstval = makeAmpleTestInt( yyvsp[-2].ival, yyvsp[-4].ival, yyvsp[-1].ival );
		}
break;
case 59:
#line 474 "sytest.y"
{
		iTemp_m = atoi(yyvsp[0].cval);    /* convert identifier to integer */
					/* check for valid digit sequence */
		pszTemp_m = yyvsp[0].cval;
		if (*pszTemp_m == '-') pszTemp_m++;   /* skip initial minus sign */
		while (*pszTemp_m != NUL)  /* rest should be digits */
			{
			if (!isdigit(*pszTemp_m++))
				{           /* found a non-digit; report error */
		if (pStamp_m->pLogFP != NULL)
			fprintf(pStamp_m->pLogFP, "\
%s%s constant %s in orderclass expression is not a number.\n\
\n%19sWill use the value %d for it\n",
						pszTestErrorHeader_m, szTestName_m, yyvsp[0].cval, " ", iTemp_m);
		break;
		}
		}
		yyval.tstval = makeAmpleTestInt( yyvsp[-1].ival + (ORDR_EQ_CON-ORDR_EQ), yyvsp[-3].ival, iTemp_m );
	}
break;
case 60:
#line 497 "sytest.y"
{
	yyval.tstval = makeAmpleTestPunct(PUNCT_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	}
break;
case 61:
#line 501 "sytest.y"
{
	pTempPunctClass_m = findPunctClass(yyvsp[0].cval, pStamp_m->pPunctClasses);
	if (pTempPunctClass_m == NULL)
		id_error("punctuation class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestPunctClass(PUNCT_MEMBER, yyvsp[-4].ival, pTempPunctClass_m );
	}
break;
case 62:
#line 511 "sytest.y"
{
		yyval.ival = ORDR_EQ;
		}
break;
case 63:
#line 515 "sytest.y"
{
		yyval.ival = ORDR_GT;
		}
break;
case 64:
#line 519 "sytest.y"
{
		yyval.ival = ORDR_GE;
		}
break;
case 65:
#line 523 "sytest.y"
{
		yyval.ival = ORDR_LE;
		}
break;
case 66:
#line 527 "sytest.y"
{
		yyval.ival = ORDR_LT;
		}
break;
case 67:
#line 531 "sytest.y"
{
		yyval.ival = ORDR_NE;
		}
break;
case 68:
#line 538 "sytest.y"
{
		yyval.ival = ARGLEFT;
		}
break;
case 69:
#line 542 "sytest.y"
{
		yyval.ival = ARGRIGHT;
		}
break;
case 70:
#line 546 "sytest.y"
{
		yyval.ival = ARGCURRENT;
		}
break;
case 71:
#line 550 "sytest.y"
{
		++bLeftSeen_m;
		yyval.ival = FORLEFT;
		}
break;
case 72:
#line 555 "sytest.y"
{
		++bRightSeen_m;
		yyval.ival = FORRIGHT;
		}
break;
case 73:
#line 560 "sytest.y"
{
		yyval.ival = INITIALM;
		}
break;
case 74:
#line 564 "sytest.y"
{
		yyval.ival = FINALM;
		}
break;
case 75:
#line 570 "sytest.y"
{
		yyval.actval = yyvsp[0].actval;        /* return pointer to action struct */
		}
break;
case 76:
#line 574 "sytest.y"
{
		yyval.actval = add_action( yyvsp[-2].actval, yyvsp[0].actval );  /* append action to list */
		}
break;
case 77:
#line 581 "sytest.y"
{
		yyval.actval = yyvsp[0].actval;
		}
break;
case 78:
#line 585 "sytest.y"
{
		yyval.actval = yyvsp[0].actval;
		}
break;
case 79:
#line 592 "sytest.y"
{
		yyval.actval = new_action( INSERT_BEFORE, yyvsp[-2].cval, yyvsp[0].ival );
		}
break;
case 80:
#line 596 "sytest.y"
{
		yyval.actval = new_action( INSERT_AFTER, yyvsp[-2].cval, yyvsp[0].ival );
		}
break;
case 81:
#line 603 "sytest.y"
{
		yyval.actval = new_action( REPORT, (char *)NULL, 0 );
		}
break;
case 82:
#line 607 "sytest.y"
{
		yyval.actval = new_action( REPORT, yyvsp[0].cval, 0 );
		}
break;
case 83:
#line 611 "sytest.y"
{
		yyval.actval = new_action( REPORT, yyvsp[0].cval, 0 );
		}
break;
#line 1333 "sytest_l.c"
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
			if ((yychar = yylex()) < 0) yychar = 0;
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
