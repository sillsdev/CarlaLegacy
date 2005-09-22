
/*  A Bison parser, made from atest.y with Bison version GNU Bison version 1.24
  */

#define YYBISON 1  /* Identify Bison output.  */

#define yyparse ampyyparse
#define yylex ampyylex
#define yyerror ampyyerror
#define yylval ampyylval
#define yychar ampyychar
#define yydebug ampyydebug
#define yynerrs ampyynerrs
#define	LX_IDENTIFIER	258
#define	LX_ALLOMORPH	259
#define	LX_CURRENT	260
#define	LX_FINAL	261
#define	LX_FA_LEFT	262
#define	LX_FA_RIGHT	263
#define	LX_FS_LEFT	264
#define	LX_FS_RIGHT	265
#define	LX_FLEFT	266
#define	LX_FRIGHT	267
#define	LX_IF	268
#define	LX_IFF	269
#define	LX_THEN	270
#define	LX_INITIAL	271
#define	LX_MEMBER	272
#define	LX_MORPHNAME	273
#define	LX_PFINAL	274
#define	LX_PINITIAL	275
#define	LX_PCOMPUTED	276
#define	LX_PROPERTY	277
#define	LX_PUNCTUATION	278
#define	LX_SURFACE	279
#define	LX_TYPE	280
#define	LX_XOR	281
#define	LX_AND	282
#define	LX_EQ	283
#define	LX_GE	284
#define	LX_GT	285
#define	LX_INFX	286
#define	LX_INTERFX	287
#define	LX_INTERFXPFX	288
#define	LX_INTERFXSFX	289
#define	LX_INTERFXIFX	290
#define	LX_IS	291
#define	LX_LE	292
#define	LX_LEFT	293
#define	LX_LT	294
#define	LX_MATCHES	295
#define	LX_NE	296
#define	LX_NOT	297
#define	LX_OR	298
#define	LX_PRFX	299
#define	LX_RIGHT	300
#define	LX_ROOT	301
#define	LX_SUFX	302
#define	LX_TOCATEGORY	303
#define	LX_FROMCATEGORY	304
#define	LX_COMPUTEDCATEGORY	305
#define	LX_ORDRCLASS	306
#define	LX_NEXT	307
#define	LX_LAST	308
#define	LX_WORD	309
#define	LX_CAPITALIZED	310
#define	LX_ORDRCLASSMAX	311

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

#ifndef YYLTYPE
typedef
  struct yyltype
	{
	  int timestamp;
	  int first_line;
	  int first_column;
	  int last_line;
	  int last_column;
	  char *text;
   }
  yyltype;

#define YYLTYPE yyltype
#endif

#include <stdio.h>

#ifndef __cplusplus
#ifndef __STDC__
#define const
#endif
#endif



#define	YYFINAL		154
#define	YYFLAG		-32768
#define	YYNTBASE	59

#define YYTRANSLATE(x) ((unsigned)(x) <= 311 ? yytranslate[x] : 77)

static const char yytranslate[] = {     0,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,    57,
	58,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     1,     2,     3,     4,     5,
	 6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
	16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
	26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
	36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
	46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
	56
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
	 0,     3,     5,     9,    14,    17,    20,    22,    24,    26,
	28,    30,    32,    34,    36,    38,    41,    45,    47,    49,
	51,    53,    55,    57,    59,    64,    69,    75,    81,    86,
	92,    98,   103,   109,   115,   120,   126,   132,   137,   143,
   149,   154,   160,   165,   171,   173,   175,   180,   182,   184,
   186,   188,   190,   192,   194,   196,   198,   200,   206,   212,
   218,   224,   230,   236,   241,   246,   250,   255,   260,   264,
   269,   275,   281,   286,   292,   298,   304,   309,   311,   313,
   315,   317,   319,   321,   323,   325,   327,   329,   331,   333
};

static const short yyrhs[] = {    60,
	61,     0,     3,     0,    61,    62,    65,     0,    13,    65,
	15,    65,     0,    63,    65,     0,    64,    65,     0,    65,
	 0,    27,     0,    43,     0,    26,     0,    14,     0,     7,
	 0,     9,     0,     8,     0,    10,     0,    42,    65,     0,
	57,    61,    58,     0,    66,     0,    67,     0,    69,     0,
	71,     0,    74,     0,    72,     0,    73,     0,    76,    22,
	36,     3,     0,    76,    18,    36,     3,     0,    76,    18,
	36,    17,     3,     0,    76,    18,    36,    76,    18,     0,
	76,     4,    36,     3,     0,    76,     4,    36,    17,     3,
	 0,    76,     4,    36,    76,     4,     0,    76,     4,    40,
	 3,     0,    76,     4,    40,    17,     3,     0,    76,     4,
	40,    76,     4,     0,    76,    24,    36,     3,     0,    76,
	24,    36,    17,     3,     0,    76,    24,    36,    76,     4,
	 0,    76,    24,    40,     3,     0,    76,    24,    40,    17,
	 3,     0,    76,    24,    40,    76,     4,     0,    68,    54,
	36,     3,     0,    68,    54,    36,    17,     3,     0,    68,
	54,    40,     3,     0,    68,    54,    40,    17,     3,     0,
	53,     0,    52,     0,    76,    25,    36,    70,     0,    44,
	 0,    31,     0,    32,     0,    33,     0,    34,     0,    35,
	 0,    46,     0,    47,     0,    16,     0,     6,     0,    76,
	49,    36,    76,    49,     0,    76,    49,    36,    76,    48,
	 0,    76,    48,    36,    76,    49,     0,    76,    48,    36,
	76,    48,     0,    76,    49,    36,    17,     3,     0,    76,
	48,    36,    17,     3,     0,    76,    49,    36,     3,     0,
	76,    48,    36,     3,     0,    50,    36,     3,     0,    50,
	36,    17,     3,     0,    76,     4,    36,    55,     0,    54,
	36,    55,     0,    68,    23,    36,     3,     0,    68,    23,
	36,    17,     3,     0,    76,    51,    75,    76,    51,     0,
	76,    51,    75,     3,     0,    76,    51,    75,    76,    56,
	 0,    76,    56,    75,    76,    51,     0,    76,    56,    75,
	76,    56,     0,    76,    56,    75,     3,     0,    28,     0,
	30,     0,    29,     0,    37,     0,    39,     0,    41,     0,
	38,     0,    45,     0,     5,     0,    11,     0,    12,     0,
	20,     0,    19,     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
   135,   141,   154,   158,   162,   181,   200,   206,   210,   214,
   218,   225,   229,   236,   240,   247,   252,   256,   260,   264,
   268,   272,   276,   280,   287,   297,   301,   308,   312,   318,
   325,   329,   333,   340,   344,   348,   355,   359,   363,   370,
   374,   379,   387,   392,   403,   409,   418,   425,   429,   433,
   437,   441,   445,   449,   453,   457,   461,   468,   472,   476,
   480,   484,   491,   498,   505,   512,   519,   529,   533,   540,
   544,   554,   558,   582,   586,   590,   594,   621,   625,   629,
   633,   637,   641,   648,   652,   656,   660,   665,   670,   674
};

static const char * const yytname[] = {   "$","error","$undefined.","LX_IDENTIFIER",
"LX_ALLOMORPH","LX_CURRENT","LX_FINAL","LX_FA_LEFT","LX_FA_RIGHT","LX_FS_LEFT",
"LX_FS_RIGHT","LX_FLEFT","LX_FRIGHT","LX_IF","LX_IFF","LX_THEN","LX_INITIAL",
"LX_MEMBER","LX_MORPHNAME","LX_PFINAL","LX_PINITIAL","LX_PCOMPUTED","LX_PROPERTY",
"LX_PUNCTUATION","LX_SURFACE","LX_TYPE","LX_XOR","LX_AND","LX_EQ","LX_GE","LX_GT",
"LX_INFX","LX_INTERFX","LX_INTERFXPFX","LX_INTERFXSFX","LX_INTERFXIFX","LX_IS",
"LX_LE","LX_LEFT","LX_LT","LX_MATCHES","LX_NE","LX_NOT","LX_OR","LX_PRFX","LX_RIGHT",
"LX_ROOT","LX_SUFX","LX_TOCATEGORY","LX_FROMCATEGORY","LX_COMPUTEDCATEGORY",
"LX_ORDRCLASS","LX_NEXT","LX_LAST","LX_WORD","LX_CAPITALIZED","LX_ORDRCLASSMAX",
"'('","')'","sptest","name","test","logop","forleft","forright","factor","property_expr",
"string_expr","neighbor","type_expr","type","category_expr","cap_expr","punc_expr",
"orderclass_expr","relop","position",""
};
#endif

static const short yyr1[] = {     0,
	59,    60,    61,    61,    61,    61,    61,    62,    62,    62,
	62,    63,    63,    64,    64,    65,    65,    65,    65,    65,
	65,    65,    65,    65,    66,    67,    67,    67,    67,    67,
	67,    67,    67,    67,    67,    67,    67,    67,    67,    67,
	67,    67,    67,    67,    68,    68,    69,    70,    70,    70,
	70,    70,    70,    70,    70,    70,    70,    71,    71,    71,
	71,    71,    71,    71,    71,    71,    71,    72,    72,    73,
	73,    74,    74,    74,    74,    74,    74,    75,    75,    75,
	75,    75,    75,    76,    76,    76,    76,    76,    76,    76
};

static const short yyr2[] = {     0,
	 2,     1,     3,     4,     2,     2,     1,     1,     1,     1,
	 1,     1,     1,     1,     1,     2,     3,     1,     1,     1,
	 1,     1,     1,     1,     4,     4,     5,     5,     4,     5,
	 5,     4,     5,     5,     4,     5,     5,     4,     5,     5,
	 4,     5,     4,     5,     1,     1,     4,     1,     1,     1,
	 1,     1,     1,     1,     1,     1,     1,     5,     5,     5,
	 5,     5,     5,     4,     4,     3,     4,     4,     3,     4,
	 5,     5,     4,     5,     5,     5,     4,     1,     1,     1,
	 1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};

static const short yydefact[] = {     0,
	 2,     0,    86,    12,    14,    13,    15,    87,    88,     0,
	90,    89,    84,     0,    85,     0,    46,    45,     0,     0,
	 1,     0,     0,     7,    18,    19,     0,    20,    21,    23,
	24,    22,     0,     0,    16,     0,     0,     0,    11,    10,
	 8,     9,     0,     5,     6,     0,     0,     0,     0,     0,
	 0,     0,     0,     0,     0,     0,     0,    66,     0,    69,
	17,     3,     0,     0,     0,     0,     0,     0,     0,     0,
	 0,     0,     0,     0,    78,    80,    79,    81,    82,    83,
	 0,     0,     4,    67,    70,     0,    41,     0,    43,     0,
	29,     0,    68,     0,    32,     0,     0,    26,     0,     0,
	25,    35,     0,     0,    38,     0,     0,    57,    56,    49,
	50,    51,    52,    53,    48,    54,    55,    47,    65,     0,
	 0,    64,     0,     0,    73,     0,    77,     0,    71,    42,
	44,    30,    31,    33,    34,    27,    28,    36,    37,    39,
	40,    63,    61,    60,    62,    59,    58,    72,    74,    75,
	76,     0,     0,     0
};

static const short yydefgoto[] = {   152,
	 2,    21,    43,    22,    23,    24,    25,    26,    27,    28,
   118,    29,    30,    31,    32,    81,    33
};

static const short yypact[] = {     7,
-32768,    -5,-32768,-32768,-32768,-32768,-32768,-32768,-32768,     8,
-32768,-32768,-32768,     8,-32768,    -2,-32768,-32768,     5,    -5,
	54,     8,     8,-32768,-32768,-32768,   -22,-32768,-32768,-32768,
-32768,-32768,    51,    73,-32768,    18,    35,    40,-32768,-32768,
-32768,-32768,     8,-32768,-32768,    69,   -24,    42,    78,    85,
	80,    88,    94,    96,   152,   152,     8,-32768,   133,-32768,
-32768,-32768,    26,    39,    67,    19,     6,    74,   134,    84,
   106,   168,   128,   138,-32768,-32768,-32768,-32768,-32768,-32768,
   149,   159,-32768,-32768,-32768,   135,-32768,   139,-32768,   143,
-32768,   153,-32768,   155,-32768,   160,   161,-32768,   164,   154,
-32768,-32768,   172,   173,-32768,   182,   184,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,   183,
	79,-32768,   187,    86,-32768,    57,-32768,    59,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,   192,   195,-32768
};

static const short yypgoto[] = {-32768,
-32768,   176,-32768,-32768,-32768,    49,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,    97,   150
};


#define	YYLAST		232


static const short yytable[] = {     3,
	46,     4,     5,     6,     7,     8,     9,    10,    95,     1,
	 3,    64,     3,    11,    12,    65,     8,     9,     8,     9,
	58,    91,    96,     3,    11,    12,    11,    12,    85,     8,
	 9,    47,    13,    36,    59,    92,    14,    11,    12,    15,
	37,    87,    86,    13,    16,    13,    17,    18,    19,    14,
	15,    20,    15,    39,    48,    88,    13,    16,    34,    17,
	18,    19,    35,    15,    20,    40,    41,    39,    49,    89,
	44,    45,    50,    93,    51,    52,    98,    66,     3,    40,
	41,    67,    42,    90,     8,     9,   102,    57,     3,    60,
	99,    62,    11,    12,     8,     9,    42,    61,    53,    54,
   103,    55,    11,    12,    63,    83,    56,   148,   105,   150,
	 3,    13,   149,    68,   151,    70,     8,     9,    15,    71,
	69,    13,   106,    72,    11,    12,   143,   144,    15,    73,
   119,    74,     3,   146,   147,    84,   101,   129,     8,     9,
   122,   130,     3,    13,   120,   131,    11,    12,     8,     9,
	15,   125,    82,     3,   123,   132,    11,    12,   133,     8,
	 9,   127,   134,     3,   135,    13,   136,    11,    12,     8,
	 9,   137,    15,   108,   138,    13,   139,    11,    12,    75,
	76,    77,    15,   109,   140,   142,    13,   141,    78,   145,
	79,   153,    80,    15,   154,    38,    13,     0,   110,   111,
   112,   113,   114,    15,     0,     0,     0,     0,     0,     0,
	 0,   115,     0,   116,   117,    94,    97,   100,     0,   104,
   107,     0,   121,   124,     0,     0,     0,     0,     0,     0,
   126,   128
};

static const short yycheck[] = {     5,
	23,     7,     8,     9,    10,    11,    12,    13,     3,     3,
	 5,    36,     5,    19,    20,    40,    11,    12,    11,    12,
	 3,     3,    17,     5,    19,    20,    19,    20,     3,    11,
	12,    54,    38,    36,    17,    17,    42,    19,    20,    45,
	36,     3,    17,    38,    50,    38,    52,    53,    54,    42,
	45,    57,    45,    14,     4,    17,    38,    50,    10,    52,
	53,    54,    14,    45,    57,    26,    27,    14,    18,     3,
	22,    23,    22,    55,    24,    25,     3,    36,     5,    26,
	27,    40,    43,    17,    11,    12,     3,    15,     5,    55,
	17,    43,    19,    20,    11,    12,    43,    58,    48,    49,
	17,    51,    19,    20,    36,    57,    56,    51,     3,    51,
	 5,    38,    56,    36,    56,    36,    11,    12,    45,    40,
	36,    38,    17,    36,    19,    20,    48,    49,    45,    36,
	 3,    36,     5,    48,    49,     3,     3,     3,    11,    12,
	 3,     3,     5,    38,    17,     3,    19,    20,    11,    12,
	45,     3,    56,     5,    17,     3,    19,    20,     4,    11,
	12,     3,     3,     5,     4,    38,     3,    19,    20,    11,
	12,    18,    45,     6,     3,    38,     4,    19,    20,    28,
	29,    30,    45,    16,     3,     3,    38,     4,    37,     3,
	39,     0,    41,    45,     0,    20,    38,    -1,    31,    32,
	33,    34,    35,    45,    -1,    -1,    -1,    -1,    -1,    -1,
	-1,    44,    -1,    46,    47,    66,    67,    68,    -1,    70,
	71,    -1,    73,    74,    -1,    -1,    -1,    -1,    -1,    -1,
	81,    82
};
/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
#line 3 "bison.simple"

/* Skeleton output parser for bison,
   Copyright (C) 1984, 1989, 1990 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

#ifndef alloca
#ifdef __GNUC__
#define alloca __builtin_alloca
#else /* not GNU C.  */
#if (!defined (__STDC__) && defined (sparc)) || defined (__sparc__) || defined (__sparc) || defined (__sgi)
#include <alloca.h>
#else /* not sparc */
#if defined (MSDOS) && !defined (__TURBOC__)
#include <malloc.h>
#else /* not MSDOS, or __TURBOC__ */
#if defined(_AIX)
#include <malloc.h>
 #pragma alloca
#else /* not MSDOS, __TURBOC__, or _AIX */
#ifdef __hpux
#ifdef __cplusplus
extern "C" {
void *alloca (unsigned int);
};
#else /* not __cplusplus */
void *alloca ();
#endif /* not __cplusplus */
#endif /* __hpux */
#endif /* not _AIX */
#endif /* not MSDOS, or __TURBOC__ */
#endif /* not sparc.  */
#endif /* not GNU C.  */
#endif /* alloca not defined.  */

/* This is the parser code that is written into each bison parser
  when the %semantic_parser declaration is not specified in the grammar.
  It was written by Richard Stallman by simplifying the hairy parser
  used when %semantic_parser is specified.  */

/* Note: there must be only one dollar sign in this file.
   It is replaced by the list of actions, each action
   as one case of the switch.  */

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0
#define YYACCEPT	return(0)
#define YYABORT 	return(1)
#define YYERROR		goto yyerrlab1
/* Like YYERROR except do call yyerror.
   This remains here temporarily to ease the
   transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */
#define YYFAIL		goto yyerrlab
#define YYRECOVERING()  (!!yyerrstatus)
#define YYBACKUP(token, value) \
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
	{ yychar = (token), yylval = (value);			\
	  yychar1 = YYTRANSLATE (yychar);				\
	  YYPOPSTACK;						\
	  goto yybackup;						\
	}								\
  else								\
	{ yyerror ("syntax error: cannot back up"); YYERROR; }	\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

#ifndef YYPURE
#define YYLEX		yylex(pLogFP_m)
#endif

#ifdef YYPURE
#ifdef YYLSP_NEEDED
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, &yylloc, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval, &yylloc)
#endif
#else /* not YYLSP_NEEDED */
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval)
#endif
#endif /* not YYLSP_NEEDED */
#endif

/* If nonreentrant, generate the variables here */

#ifndef YYPURE

int	yychar;			/*  the lookahead symbol		*/
YYSTYPE	yylval;			/*  the semantic value of the		*/
				/*  lookahead symbol			*/

#ifdef YYLSP_NEEDED
YYLTYPE yylloc;			/*  location data for the lookahead	*/
				/*  symbol				*/
#endif

int yynerrs;			/*  number of parse errors so far       */
#endif  /* not YYPURE */

#if YYDEBUG != 0
int yydebug;			/*  nonzero means print parse trace	*/
/* Since this is uninitialized, it does not stop multiple parsers
   from coexisting.  */
#endif

/*  YYINITDEPTH indicates the initial size of the parser's stacks	*/

#ifndef	YYINITDEPTH
#define YYINITDEPTH 200
#endif

/*  YYMAXDEPTH is the maximum size the stacks can grow to
	(effective only if the built-in stack extension method is used).  */

#if YYMAXDEPTH == 0
#undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
#define YYMAXDEPTH 10000
#endif

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
int yyparse (void);
#endif

#if __GNUC__ > 1		/* GNU C and GNU C++ define this.  */
#define __yy_memcpy(FROM,TO,COUNT)	__builtin_memcpy(TO,FROM,COUNT)
#else				/* not GNU C or C++ */
#ifndef __cplusplus

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (from, to, count)
	 char *from;
	 char *to;
	 int count;
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
	*t++ = *f++;
}

#else /* __cplusplus */

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (char *from, char *to, int count)
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
	*t++ = *f++;
}

#endif
#endif

#line 192 "bison.simple"

/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
#define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
#else
#define YYPARSE_PARAM
#define YYPARSE_PARAM_DECL
#endif

int
yyparse(YYPARSE_PARAM)
	 YYPARSE_PARAM_DECL
{
  register int yystate;
  register int yyn;
  register short *yyssp;
  register YYSTYPE *yyvsp;
  int yyerrstatus;	/*  number of tokens to shift before error messages enabled */
  int yychar1 = 0;		/*  lookahead token as an internal (translated) token number */

  short	yyssa[YYINITDEPTH];	/*  the state stack			*/
  YYSTYPE yyvsa[YYINITDEPTH];	/*  the semantic value stack		*/

  short *yyss = yyssa;		/*  refer to the stacks thru separate pointers */
  YYSTYPE *yyvs = yyvsa;	/*  to allow yyoverflow to reallocate them elsewhere */

#ifdef YYLSP_NEEDED
  YYLTYPE yylsa[YYINITDEPTH];	/*  the location stack			*/
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;

#define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
#else
#define YYPOPSTACK   (yyvsp--, yyssp--)
#endif

  int yystacksize = YYINITDEPTH;

#ifdef YYPURE
  int yychar;
  YYSTYPE yylval;
  int yynerrs;
#ifdef YYLSP_NEEDED
  YYLTYPE yylloc;
#endif
#endif

  YYSTYPE yyval;		/*  the variable used to return		*/
				/*  semantic values from the action	*/
				/*  routines				*/

  int yylen;

#if YYDEBUG != 0
  if (yydebug)
	fprintf(stderr, "Starting parse\n");
#endif

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
	 Waste one element of value and location stack
	 so that they stay on the same level as the state stack.
	 The wasted elements are never initialized.  */

  yyssp = yyss - 1;
  yyvsp = yyvs;
#ifdef YYLSP_NEEDED
  yylsp = yyls;
#endif

/* Push a new state, which is found in  yystate  .  */
/* In all cases, when you get here, the value and location stacks
   have just been pushed. so pushing a state here evens the stacks.  */
yynewstate:

  *++yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
	{
	  /* Give user a chance to reallocate the stack */
	  /* Use copies of these so that the &'s don't force the real ones into memory. */
	  YYSTYPE *yyvs1 = yyvs;
	  short *yyss1 = yyss;
#ifdef YYLSP_NEEDED
	  YYLTYPE *yyls1 = yyls;
#endif

	  /* Get the current used size of the three stacks, in elements.  */
	  int size = yyssp - yyss + 1;

#ifdef yyoverflow
	  /* Each stack pointer address is followed by the size of
	 the data in use in that stack, in bytes.  */
#ifdef YYLSP_NEEDED
	  /* This used to be a conditional around just the two extra args,
	 but that might be undefined if yyoverflow is a macro.  */
	  yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yyls1, size * sizeof (*yylsp),
		 &yystacksize);
#else
	  yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yystacksize);
#endif

	  yyss = yyss1; yyvs = yyvs1;
#ifdef YYLSP_NEEDED
	  yyls = yyls1;
#endif
#else /* no yyoverflow */
	  /* Extend the stack our own way.  */
	  if (yystacksize >= YYMAXDEPTH)
	{
	  yyerror("parser stack overflow");
	  return 2;
	}
	  yystacksize *= 2;
	  if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;
	  yyss = (short *) alloca (yystacksize * sizeof (*yyssp));
	  __yy_memcpy ((char *)yyss1, (char *)yyss, size * sizeof (*yyssp));
	  yyvs = (YYSTYPE *) alloca (yystacksize * sizeof (*yyvsp));
	  __yy_memcpy ((char *)yyvs1, (char *)yyvs, size * sizeof (*yyvsp));
#ifdef YYLSP_NEEDED
	  yyls = (YYLTYPE *) alloca (yystacksize * sizeof (*yylsp));
	  __yy_memcpy ((char *)yyls1, (char *)yyls, size * sizeof (*yylsp));
#endif
#endif /* no yyoverflow */

	  yyssp = yyss + size - 1;
	  yyvsp = yyvs + size - 1;
#ifdef YYLSP_NEEDED
	  yylsp = yyls + size - 1;
#endif

#if YYDEBUG != 0
	  if (yydebug)
	fprintf(stderr, "Stack size increased to %d\n", yystacksize);
#endif

	  if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
	}

#if YYDEBUG != 0
  if (yydebug)
	fprintf(stderr, "Entering state %d\n", yystate);
#endif

  goto yybackup;
 yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
	goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
	 or a valid token in external form.  */

  if (yychar == YYEMPTY)
	{
#if YYDEBUG != 0
	  if (yydebug)
	fprintf(stderr, "Reading a token: ");
#endif
	  yychar = YYLEX;
	}

  /* Convert token to internal form (in yychar1) for indexing tables with */

  if (yychar <= 0)		/* This means end of input. */
	{
	  yychar1 = 0;
	  yychar = YYEOF;		/* Don't call YYLEX any more */

#if YYDEBUG != 0
	  if (yydebug)
	fprintf(stderr, "Now at end of input.\n");
#endif
	}
  else
	{
	  yychar1 = YYTRANSLATE(yychar);

#if YYDEBUG != 0
	  if (yydebug)
	{
	  fprintf (stderr, "Next token is %d (%s", yychar, yytname[yychar1]);
	  /* Give the individual parser a way to print the precise meaning
		 of a token, for further debugging info.  */
#ifdef YYPRINT
	  YYPRINT (stderr, yychar, yylval);
#endif
	  fprintf (stderr, ")\n");
	}
#endif
	}

  yyn += yychar1;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != yychar1)
	goto yydefault;

  yyn = yytable[yyn];

  /* yyn is what to do for this token type in this state.
	 Negative => reduce, -yyn is rule number.
	 Positive => shift, yyn is new state.
	   New state is final state => don't bother to shift,
	   just return success.
	 0, or most negative number => error.  */

  if (yyn < 0)
	{
	  if (yyn == YYFLAG)
	goto yyerrlab;
	  yyn = -yyn;
	  goto yyreduce;
	}
  else if (yyn == 0)
	goto yyerrlab;

  if (yyn == YYFINAL)
	YYACCEPT;

  /* Shift the lookahead token.  */

#if YYDEBUG != 0
  if (yydebug)
	fprintf(stderr, "Shifting token %d (%s), ", yychar, yytname[yychar1]);
#endif

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
	yychar = YYEMPTY;

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  /* count tokens shifted since error; after three, turn off error status.  */
  if (yyerrstatus) yyerrstatus--;

  yystate = yyn;
  goto yynewstate;

/* Do the default action for the current state.  */
yydefault:

  yyn = yydefact[yystate];
  if (yyn == 0)
	goto yyerrlab;

/* Do a reduction.  yyn is the number of a rule to reduce with.  */
yyreduce:
  yylen = yyr2[yyn];
  if (yylen > 0)
	yyval = yyvsp[1-yylen]; /* implement default value of the action */

#if YYDEBUG != 0
  if (yydebug)
	{
	  int i;

	  fprintf (stderr, "Reducing via rule %d (line %d), ",
		   yyn, yyrline[yyn]);

	  /* Print the symbols being reduced, and their result.  */
	  for (i = yyprhs[yyn]; yyrhs[i] > 0; i++)
	fprintf (stderr, "%s ", yytname[yyrhs[i]]);
	  fprintf (stderr, " -> %s\n", yytname[yyr1[yyn]]);
	}
#endif


  switch (yyn) {

case 1:
#line 136 "atest.y"
{
	yyval.tstval = pAmpleTestTree_m = makeAmpleTest( yyvsp[0].tstval, szTestName_m );
	;
	break;}
case 2:
#line 142 "atest.y"
{
	strncpy(szTestName_m, yyvsp[0].cval, 99); /* save for error messages */
	bForLeftSeen_m  = FALSE;   /* These must be initialized for */
	bForRightSeen_m = FALSE;   /* each test we parse! */
	bLeftSeen_m     = FALSE;
	bRightSeen_m    = FALSE;
	bUsesPrevWord_m = FALSE;
	bUsesNextWord_m = FALSE;
	;
	break;}
case 3:
#line 155 "atest.y"
{
	yyval.tstval = makeAmpleTestNode(yyvsp[-1].ival, yyvsp[-2].tstval, yyvsp[0].tstval);
	;
	break;}
case 4:
#line 159 "atest.y"
{
	yyval.tstval = makeAmpleTestNode( LOGIF, yyvsp[-2].tstval, yyvsp[0].tstval);
	;
	break;}
case 5:
#line 163 "atest.y"
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
	;
	break;}
case 6:
#line 182 "atest.y"
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
	;
	break;}
case 7:
#line 201 "atest.y"
{
	;
	break;}
case 8:
#line 207 "atest.y"
{
	yyval.ival = LOGAND;
	;
	break;}
case 9:
#line 211 "atest.y"
{
	yyval.ival = LOGOR;
	;
	break;}
case 10:
#line 215 "atest.y"
{
	yyval.ival = LOGXOR;
	;
	break;}
case 11:
#line 219 "atest.y"
{
	yyval.ival = LOGIFF;
	;
	break;}
case 12:
#line 226 "atest.y"
{
	yyval.ival = ALL_LEFT;
	;
	break;}
case 13:
#line 230 "atest.y"
{
	yyval.ival = SOME_LEFT;
	;
	break;}
case 14:
#line 237 "atest.y"
{
	yyval.ival = ALL_RIGHT;
	;
	break;}
case 15:
#line 241 "atest.y"
{
	yyval.ival = SOME_RIGHT;
	;
	break;}
case 16:
#line 248 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
		yyval.tstval->iOpCode ^= OP_NOT;
	;
	break;}
case 17:
#line 253 "atest.y"
{
	yyval.tstval = yyvsp[-1].tstval;
	;
	break;}
case 18:
#line 257 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 19:
#line 261 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 20:
#line 265 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 21:
#line 269 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 22:
#line 273 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 23:
#line 277 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 24:
#line 281 "atest.y"
{
		yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 25:
#line 288 "atest.y"
{
	if ((uiTempProperty_m = findAmplePropertyNumber(yyvsp[0].cval,
						 &pAmpleData_m->sProperties)) == 0)
	   id_error("property", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestProperty(PROP_IS, yyvsp[-3].ival, uiTempProperty_m);
	;
	break;}
case 26:
#line 298 "atest.y"
{
	yyval.tstval = makeAmpleTestString(MORPH_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 27:
#line 302 "atest.y"
{
	if ((pTempMorphClass_m = findAmpleMorphClass(yyvsp[0].cval,
					 pAmpleData_m->pMorphClasses)) == NULL)
		id_error("morpheme class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestMorphClass(MORPH_MEMBER, yyvsp[-4].ival, pTempMorphClass_m);
	;
	break;}
case 28:
#line 309 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(MOR_IS_MORPH, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 29:
#line 313 "atest.y"
{
	if (strcmp(yyvsp[0].cval,"0") == 0)
		*(yyvsp[0].cval) = NUL;
	yyval.tstval = makeAmpleTestString(ALLO_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 30:
#line 319 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(ALLO_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 31:
#line 326 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(ALLO_IS_AL, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 32:
#line 330 "atest.y"
{
	yyval.tstval = makeAmpleTestString(ALLO_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 33:
#line 334 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(AL_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 34:
#line 341 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(AL_MAT_AL, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 35:
#line 345 "atest.y"
{
	yyval.tstval = makeAmpleTestString(STRING_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 36:
#line 349 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(STRING_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 37:
#line 356 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(ST_IS_AL, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 38:
#line 360 "atest.y"
{
	yyval.tstval = makeAmpleTestString(ST_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 39:
#line 364 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(ST_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 40:
#line 371 "atest.y"
{
		yyval.tstval = makeAmpleTestInt(ST_MAT_AL, yyvsp[-4].ival, yyvsp[-1].ival );
	;
	break;}
case 41:
#line 375 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-3].ival); /* 3.3.0 hab */
	yyval.tstval = makeAmpleTestString(WORD_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 42:
#line 380 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-4].ival); /* 3.3.0 hab */
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(WORD_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 43:
#line 388 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-3].ival); /* 3.3.0 hab */
	yyval.tstval = makeAmpleTestString(WORD_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 44:
#line 393 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-4].ival); /* 3.3.0 hab */
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(WD_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 45:
#line 404 "atest.y"
{
	yyval.ival = LAST;
	/* 3.3.0 hab  can't be here because is used by punctuation now, too */
	/* bUsesPrevWord_m = TRUE; */
	;
	break;}
case 46:
#line 410 "atest.y"
{
	yyval.ival = NEXT;
	/* 3.3.0 hab  can't be here because is used by punctuation now, too */
	/* bUsesNextWord_m = TRUE; */
	;
	break;}
case 47:
#line 419 "atest.y"
{
		yyval.tstval = makeAmpleTestInt(TYPE_IS, yyvsp[-3].ival, yyvsp[0].ival);
	;
	break;}
case 48:
#line 426 "atest.y"
{
	yyval.ival = AMPLE_PFX;
	;
	break;}
case 49:
#line 430 "atest.y"
{
	yyval.ival = AMPLE_IFX;
	;
	break;}
case 50:
#line 434 "atest.y"
{
	yyval.ival = AMPLE_NFX;
	;
	break;}
case 51:
#line 438 "atest.y"
{
	yyval.ival = AMPLE_NFXPFX;
	;
	break;}
case 52:
#line 442 "atest.y"
{
	yyval.ival = AMPLE_NFXSFX;
	;
	break;}
case 53:
#line 446 "atest.y"
{
	yyval.ival = AMPLE_NFXIFX;
	;
	break;}
case 54:
#line 450 "atest.y"
{
	yyval.ival = AMPLE_ROOT;
	;
	break;}
case 55:
#line 454 "atest.y"
{
	yyval.ival = AMPLE_SFX;
	;
	break;}
case 56:
#line 458 "atest.y"
{
	yyval.ival = WINITIAL;
	;
	break;}
case 57:
#line 462 "atest.y"
{
	yyval.ival = WFINAL;
	;
	break;}
case 58:
#line 469 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(FROM_IS_FROM, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 59:
#line 473 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(FR_IS_TO, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 60:
#line 477 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(TO_IS_FROM, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 61:
#line 481 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(TO_IS_TO, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 62:
#line 485 "atest.y"
{
	if ((pTempCatClass_m = findAmpleCategClass(yyvsp[0].cval,
					  pAmpleData_m->pCategoryClasses)) == NULL)
		id_error("category class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestCategClass(FROM_MEMBER, yyvsp[-4].ival, pTempCatClass_m);
	;
	break;}
case 63:
#line 492 "atest.y"
{
	if ((pTempCatClass_m = findAmpleCategClass(yyvsp[0].cval,
					  pAmpleData_m->pCategoryClasses)) == NULL)
		id_error("category class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestCategClass(TO_MEMBER, yyvsp[-4].ival, pTempCatClass_m);
	;
	break;}
case 64:
#line 499 "atest.y"
{
	if ((iTemp_m = findAmpleCategoryNumber(yyvsp[0].cval,
						pAmpleData_m->pCategories)) == 0)
		id_error("category", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestInt(FROM_IS, yyvsp[-3].ival, iTemp_m);
	;
	break;}
case 65:
#line 506 "atest.y"
{
	if ((iTemp_m = findAmpleCategoryNumber(yyvsp[0].cval,
						pAmpleData_m->pCategories)) == 0)
		id_error("category", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestInt(TO_IS, yyvsp[-3].ival, iTemp_m);
	;
	break;}
case 66:
#line 513 "atest.y"
{
	if ((iTemp_m = findAmpleCategoryNumber(yyvsp[0].cval,
						pAmpleData_m->pCategories)) == 0)
		id_error("category", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestInt(COMPUTED_IS, LX_PCOMPUTED, iTemp_m);
	;
	break;}
case 67:
#line 520 "atest.y"
{
	if ((pTempCatClass_m = findAmpleCategClass(yyvsp[0].cval,
						pAmpleData_m->pCategoryClasses)) == 0)
		id_error("category class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestCategClass(COMPUTED_MEMBER, LX_PCOMPUTED, pTempCatClass_m);
	;
	break;}
case 68:
#line 530 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(AL_IS_CAP, yyvsp[-3].ival, 0);
	;
	break;}
case 69:
#line 534 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(WD_IS_CAP, yyvsp[-2].ival, 0);
	;
	break;}
case 70:
#line 541 "atest.y"
{
	yyval.tstval = makeAmpleTestPunct(PUNCT_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 71:
#line 545 "atest.y"
{
	pTempPunctClass_m = findPunctClass(yyvsp[0].cval, pAmpleData_m->pPunctClasses);
	if (pTempPunctClass_m == NULL)
		id_error("punctuation class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestPunctClass(PUNCT_MEMBER, yyvsp[-4].ival, pTempPunctClass_m );
	;
	break;}
case 72:
#line 555 "atest.y"
{
	yyval.tstval = makeAmpleTestInt( yyvsp[-2].ival, yyvsp[-4].ival, yyvsp[-1].ival );
	;
	break;}
case 73:
#line 559 "atest.y"
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
	;
	break;}
case 74:
#line 583 "atest.y"
{
	yyval.tstval = makeAmpleTestInt( yyvsp[-2].ival + (ORDR_EQ_ORDRMAX-ORDR_EQ) , yyvsp[-4].ival, yyvsp[-1].ival );
	;
	break;}
case 75:
#line 587 "atest.y"
{
	yyval.tstval = makeAmpleTestInt( yyvsp[-2].ival + (ORDRMAX_EQ_ORDR-ORDR_EQ), yyvsp[-4].ival, yyvsp[-1].ival );
	;
	break;}
case 76:
#line 591 "atest.y"
{
	yyval.tstval = makeAmpleTestInt( yyvsp[-2].ival + (ORDRMAX_EQ_ORDRMAX-ORDR_EQ), yyvsp[-4].ival, yyvsp[-1].ival );
	;
	break;}
case 77:
#line 595 "atest.y"
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
	yyval.tstval = makeAmpleTestInt( yyvsp[-1].ival + (ORDRMAX_EQ_CON-ORDR_EQ), yyvsp[-3].ival, iTemp_m );
	;
	break;}
case 78:
#line 622 "atest.y"
{
	yyval.ival = ORDR_EQ;
	;
	break;}
case 79:
#line 626 "atest.y"
{
	yyval.ival = ORDR_GT;
	;
	break;}
case 80:
#line 630 "atest.y"
{
	yyval.ival = ORDR_GE;
	;
	break;}
case 81:
#line 634 "atest.y"
{
	yyval.ival = ORDR_LE;
	;
	break;}
case 82:
#line 638 "atest.y"
{
	yyval.ival = ORDR_LT;
	;
	break;}
case 83:
#line 642 "atest.y"
{
	yyval.ival = ORDR_NE;
	;
	break;}
case 84:
#line 649 "atest.y"
{
	yyval.ival = ARGLEFT;
	;
	break;}
case 85:
#line 653 "atest.y"
{
	yyval.ival = ARGRIGHT;
	;
	break;}
case 86:
#line 657 "atest.y"
{
	yyval.ival = ARGCURRENT;
	;
	break;}
case 87:
#line 661 "atest.y"
{
	++bLeftSeen_m;
	yyval.ival = FORLEFT;
	;
	break;}
case 88:
#line 666 "atest.y"
{
	++bRightSeen_m;
	yyval.ival = FORRIGHT;
	;
	break;}
case 89:
#line 671 "atest.y"
{
	yyval.ival = INITIALM;
	;
	break;}
case 90:
#line 675 "atest.y"
{
	yyval.ival = FINALM;
	;
	break;}
}
   /* the action file gets copied in in place of this dollarsign */
#line 487 "bison.simple"

  yyvsp -= yylen;
  yyssp -= yylen;
#ifdef YYLSP_NEEDED
  yylsp -= yylen;
#endif

#if YYDEBUG != 0
  if (yydebug)
	{
	  short *ssp1 = yyss - 1;
	  fprintf (stderr, "state stack now");
	  while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
	  fprintf (stderr, "\n");
	}
#endif

  *++yyvsp = yyval;

#ifdef YYLSP_NEEDED
  yylsp++;
  if (yylen == 0)
	{
	  yylsp->first_line = yylloc.first_line;
	  yylsp->first_column = yylloc.first_column;
	  yylsp->last_line = (yylsp-1)->last_line;
	  yylsp->last_column = (yylsp-1)->last_column;
	  yylsp->text = 0;
	}
  else
	{
	  yylsp->last_line = (yylsp+yylen-1)->last_line;
	  yylsp->last_column = (yylsp+yylen-1)->last_column;
	}
#endif

  /* Now "shift" the result of the reduction.
	 Determine what state that goes to,
	 based on the state we popped back to
	 and the rule number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
	yystate = yytable[yystate];
  else
	yystate = yydefgoto[yyn - YYNTBASE];

  goto yynewstate;

yyerrlab:   /* here on detecting error */

  if (! yyerrstatus)
	/* If not already recovering from an error, report this error.  */
	{
	  ++yynerrs;

#ifdef YYERROR_VERBOSE
	  yyn = yypact[yystate];

	  if (yyn > YYFLAG && yyn < YYLAST)
	{
	  int size = 0;
	  char *msg;
	  int x, count;

	  count = 0;
	  /* Start X at -yyn if nec to avoid negative indexes in yycheck.  */
	  for (x = (yyn < 0 ? -yyn : 0);
		   x < (sizeof(yytname) / sizeof(char *)); x++)
		if (yycheck[x + yyn] == x)
		  size += strlen(yytname[x]) + 15, count++;
	  msg = (char *) malloc(size + 15);
	  if (msg != 0)
		{
		  strcpy(msg, "parse error");

		  if (count < 5)
		{
		  count = 0;
		  for (x = (yyn < 0 ? -yyn : 0);
			   x < (sizeof(yytname) / sizeof(char *)); x++)
			if (yycheck[x + yyn] == x)
			  {
			strcat(msg, count == 0 ? ", expecting `" : " or `");
			strcat(msg, yytname[x]);
			strcat(msg, "'");
			count++;
			  }
		}
		  yyerror(msg);
		  free(msg);
		}
	  else
		yyerror ("parse error; also virtual memory exceeded");
	}
	  else
#endif /* YYERROR_VERBOSE */
	yyerror("parse error");
	}

  goto yyerrlab1;
yyerrlab1:   /* here on error raised explicitly by an action */

  if (yyerrstatus == 3)
	{
	  /* if just tried and failed to reuse lookahead token after an error, discard it.  */

	  /* return failure if at end of input */
	  if (yychar == YYEOF)
	YYABORT;

#if YYDEBUG != 0
	  if (yydebug)
	fprintf(stderr, "Discarding token %d (%s).\n", yychar, yytname[yychar1]);
#endif

	  yychar = YYEMPTY;
	}

  /* Else will try to reuse lookahead token
	 after shifting the error token.  */

  yyerrstatus = 3;		/* Each real token shifted decrements this */

  goto yyerrhandle;

yyerrdefault:  /* current state does not do anything special for the error token. */

#if 0
  /* This is wrong; only states that explicitly want error tokens
	 should shift them.  */
  yyn = yydefact[yystate];  /* If its default is to accept any token, ok.  Otherwise pop it.*/
  if (yyn) goto yydefault;
#endif

yyerrpop:   /* pop the current state because it cannot handle the error token */

  if (yyssp == yyss) YYABORT;
  yyvsp--;
  yystate = *--yyssp;
#ifdef YYLSP_NEEDED
  yylsp--;
#endif

#if YYDEBUG != 0
  if (yydebug)
	{
	  short *ssp1 = yyss - 1;
	  fprintf (stderr, "Error: state stack now");
	  while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
	  fprintf (stderr, "\n");
	}
#endif

yyerrhandle:

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
	goto yyerrdefault;

  yyn += YYTERROR;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != YYTERROR)
	goto yyerrdefault;

  yyn = yytable[yyn];
  if (yyn < 0)
	{
	  if (yyn == YYFLAG)
	goto yyerrpop;
	  yyn = -yyn;
	  goto yyreduce;
	}
  else if (yyn == 0)
	goto yyerrpop;

  if (yyn == YYFINAL)
	YYACCEPT;

#if YYDEBUG != 0
  if (yydebug)
	fprintf(stderr, "Shifting error token, ");
#endif

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  yystate = yyn;
  goto yynewstate;
}
#line 680 "atest.y"


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
