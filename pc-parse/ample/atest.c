
/*  A Bison parser, made from atest.y
	by GNU Bison version 1.28  */

#define YYBISON 1  /* Identify Bison output.  */

#define yyparse ampyyparse
#define yylex ampyylex
#define yyerror ampyyerror
#define yylval ampyylval
#define yychar ampyychar
#define yydebug ampyydebug
#define yynerrs ampyynerrs
#define	LX_IDENTIFIER	257
#define	LX_ALLOMORPH	258
#define	LX_CURRENT	259
#define	LX_FINAL	260
#define	LX_FA_LEFT	261
#define	LX_FA_RIGHT	262
#define	LX_FS_LEFT	263
#define	LX_FS_RIGHT	264
#define	LX_FLEFT	265
#define	LX_FRIGHT	266
#define	LX_IF	267
#define	LX_IFF	268
#define	LX_THEN	269
#define	LX_INITIAL	270
#define	LX_MEMBER	271
#define	LX_MORPHNAME	272
#define	LX_PFINAL	273
#define	LX_PINITIAL	274
#define	LX_PROPERTY	275
#define	LX_PUNCTUATION	276
#define	LX_SURFACE	277
#define	LX_TYPE	278
#define	LX_XOR	279
#define	LX_AND	280
#define	LX_EQ	281
#define	LX_GE	282
#define	LX_GT	283
#define	LX_INFX	284
#define	LX_INTERFX	285
#define	LX_INTERFXPFX	286
#define	LX_INTERFXSFX	287
#define	LX_INTERFXIFX	288
#define	LX_IS	289
#define	LX_LE	290
#define	LX_LEFT	291
#define	LX_LT	292
#define	LX_MATCHES	293
#define	LX_NE	294
#define	LX_NOT	295
#define	LX_OR	296
#define	LX_PRFX	297
#define	LX_RIGHT	298
#define	LX_ROOT	299
#define	LX_SUFX	300
#define	LX_TOCATEGORY	301
#define	LX_FROMCATEGORY	302
#define	LX_ORDRCLASS	303
#define	LX_NEXT	304
#define	LX_LAST	305
#define	LX_WORD	306
#define	LX_CAPITALIZED	307
#define	LX_ORDRCLASSMAX	308

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
#include <stdio.h>

#ifndef __cplusplus
#ifndef __STDC__
#define const
#endif
#endif



#define	YYFINAL		149
#define	YYFLAG		-32768
#define	YYNTBASE	57

#define YYTRANSLATE(x) ((unsigned)(x) <= 308 ? yytranslate[x] : 75)

static const char yytranslate[] = {     0,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,    55,
	56,     2,     2,     2,     2,     2,     2,     2,     2,     2,
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
	 2,     2,     2,     2,     2,     1,     3,     4,     5,     6,
	 7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
	17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
	27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
	37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
	47,    48,    49,    50,    51,    52,    53,    54
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
	 0,     3,     5,     9,    14,    17,    20,    22,    24,    26,
	28,    30,    32,    34,    36,    38,    41,    45,    47,    49,
	51,    53,    55,    57,    59,    64,    69,    75,    81,    86,
	92,    98,   103,   109,   115,   120,   126,   132,   137,   143,
   149,   154,   160,   165,   171,   173,   175,   180,   182,   184,
   186,   188,   190,   192,   194,   196,   198,   200,   206,   212,
   218,   224,   230,   236,   241,   246,   251,   255,   260,   266,
   272,   277,   283,   289,   295,   300,   302,   304,   306,   308,
   310,   312,   314,   316,   318,   320,   322,   324
};

static const short yyrhs[] = {    58,
	59,     0,     3,     0,    59,    60,    63,     0,    13,    63,
	15,    63,     0,    61,    63,     0,    62,    63,     0,    63,
	 0,    26,     0,    42,     0,    25,     0,    14,     0,     7,
	 0,     9,     0,     8,     0,    10,     0,    41,    63,     0,
	55,    59,    56,     0,    64,     0,    65,     0,    67,     0,
	69,     0,    72,     0,    70,     0,    71,     0,    74,    21,
	35,     3,     0,    74,    18,    35,     3,     0,    74,    18,
	35,    17,     3,     0,    74,    18,    35,    74,    18,     0,
	74,     4,    35,     3,     0,    74,     4,    35,    17,     3,
	 0,    74,     4,    35,    74,     4,     0,    74,     4,    39,
	 3,     0,    74,     4,    39,    17,     3,     0,    74,     4,
	39,    74,     4,     0,    74,    23,    35,     3,     0,    74,
	23,    35,    17,     3,     0,    74,    23,    35,    74,     4,
	 0,    74,    23,    39,     3,     0,    74,    23,    39,    17,
	 3,     0,    74,    23,    39,    74,     4,     0,    66,    52,
	35,     3,     0,    66,    52,    35,    17,     3,     0,    66,
	52,    39,     3,     0,    66,    52,    39,    17,     3,     0,
	51,     0,    50,     0,    74,    24,    35,    68,     0,    43,
	 0,    30,     0,    31,     0,    32,     0,    33,     0,    34,
	 0,    45,     0,    46,     0,    16,     0,     6,     0,    74,
	48,    35,    74,    48,     0,    74,    48,    35,    74,    47,
	 0,    74,    47,    35,    74,    48,     0,    74,    47,    35,
	74,    47,     0,    74,    48,    35,    17,     3,     0,    74,
	47,    35,    17,     3,     0,    74,    48,    35,     3,     0,
	74,    47,    35,     3,     0,    74,     4,    35,    53,     0,
	52,    35,    53,     0,    66,    22,    35,     3,     0,    66,
	22,    35,    17,     3,     0,    74,    49,    73,    74,    49,
	 0,    74,    49,    73,     3,     0,    74,    49,    73,    74,
	54,     0,    74,    54,    73,    74,    49,     0,    74,    54,
	73,    74,    54,     0,    74,    54,    73,     3,     0,    27,
	 0,    29,     0,    28,     0,    36,     0,    38,     0,    40,
	 0,    37,     0,    44,     0,     5,     0,    11,     0,    12,
	 0,    20,     0,    19,     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
   133,   139,   152,   156,   160,   179,   198,   204,   208,   212,
   216,   223,   227,   234,   238,   245,   250,   254,   258,   262,
   266,   270,   274,   278,   285,   295,   299,   306,   310,   316,
   323,   327,   331,   338,   342,   346,   353,   357,   361,   368,
   372,   377,   385,   390,   401,   407,   416,   423,   427,   431,
   435,   439,   443,   447,   451,   455,   459,   466,   470,   474,
   478,   482,   489,   496,   503,   513,   517,   524,   528,   538,
   542,   566,   570,   574,   578,   605,   609,   613,   617,   621,
   625,   632,   636,   640,   644,   649,   654,   658
};
#endif


#if YYDEBUG != 0 || defined (YYERROR_VERBOSE)

static const char * const yytname[] = {   "$","error","$undefined.","LX_IDENTIFIER",
"LX_ALLOMORPH","LX_CURRENT","LX_FINAL","LX_FA_LEFT","LX_FA_RIGHT","LX_FS_LEFT",
"LX_FS_RIGHT","LX_FLEFT","LX_FRIGHT","LX_IF","LX_IFF","LX_THEN","LX_INITIAL",
"LX_MEMBER","LX_MORPHNAME","LX_PFINAL","LX_PINITIAL","LX_PROPERTY","LX_PUNCTUATION",
"LX_SURFACE","LX_TYPE","LX_XOR","LX_AND","LX_EQ","LX_GE","LX_GT","LX_INFX","LX_INTERFX",
"LX_INTERFXPFX","LX_INTERFXSFX","LX_INTERFXIFX","LX_IS","LX_LE","LX_LEFT","LX_LT",
"LX_MATCHES","LX_NE","LX_NOT","LX_OR","LX_PRFX","LX_RIGHT","LX_ROOT","LX_SUFX",
"LX_TOCATEGORY","LX_FROMCATEGORY","LX_ORDRCLASS","LX_NEXT","LX_LAST","LX_WORD",
"LX_CAPITALIZED","LX_ORDRCLASSMAX","'('","')'","sptest","name","test","logop",
"forleft","forright","factor","property_expr","string_expr","neighbor","type_expr",
"type","category_expr","cap_expr","punc_expr","orderclass_expr","relop","position", NULL
};
#endif

static const short yyr1[] = {     0,
	57,    58,    59,    59,    59,    59,    59,    60,    60,    60,
	60,    61,    61,    62,    62,    63,    63,    63,    63,    63,
	63,    63,    63,    63,    64,    65,    65,    65,    65,    65,
	65,    65,    65,    65,    65,    65,    65,    65,    65,    65,
	65,    65,    65,    65,    66,    66,    67,    68,    68,    68,
	68,    68,    68,    68,    68,    68,    68,    69,    69,    69,
	69,    69,    69,    69,    69,    70,    70,    71,    71,    72,
	72,    72,    72,    72,    72,    73,    73,    73,    73,    73,
	73,    74,    74,    74,    74,    74,    74,    74
};

static const short yyr2[] = {     0,
	 2,     1,     3,     4,     2,     2,     1,     1,     1,     1,
	 1,     1,     1,     1,     1,     2,     3,     1,     1,     1,
	 1,     1,     1,     1,     4,     4,     5,     5,     4,     5,
	 5,     4,     5,     5,     4,     5,     5,     4,     5,     5,
	 4,     5,     4,     5,     1,     1,     4,     1,     1,     1,
	 1,     1,     1,     1,     1,     1,     1,     5,     5,     5,
	 5,     5,     5,     4,     4,     4,     3,     4,     5,     5,
	 4,     5,     5,     5,     4,     1,     1,     1,     1,     1,
	 1,     1,     1,     1,     1,     1,     1,     1
};

static const short yydefact[] = {     0,
	 2,     0,    84,    12,    14,    13,    15,    85,    86,     0,
	88,    87,    82,     0,    83,    46,    45,     0,     0,     1,
	 0,     0,     7,    18,    19,     0,    20,    21,    23,    24,
	22,     0,     0,    16,     0,     0,    11,    10,     8,     9,
	 0,     5,     6,     0,     0,     0,     0,     0,     0,     0,
	 0,     0,     0,     0,     0,    67,    17,     3,     0,     0,
	 0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
	76,    78,    77,    79,    80,    81,     0,     0,     4,    68,
	 0,    41,     0,    43,     0,    29,     0,    66,     0,    32,
	 0,     0,    26,     0,     0,    25,    35,     0,     0,    38,
	 0,     0,    57,    56,    49,    50,    51,    52,    53,    48,
	54,    55,    47,    65,     0,     0,    64,     0,     0,    71,
	 0,    75,     0,    69,    42,    44,    30,    31,    33,    34,
	27,    28,    36,    37,    39,    40,    63,    61,    60,    62,
	59,    58,    70,    72,    73,    74,     0,     0,     0
};

static const short yydefgoto[] = {   147,
	 2,    20,    41,    21,    22,    23,    24,    25,    26,    27,
   113,    28,    29,    30,    31,    77,    32
};

static const short yypact[] = {     8,
-32768,    -5,-32768,-32768,-32768,-32768,-32768,-32768,-32768,     7,
-32768,-32768,-32768,     7,-32768,-32768,-32768,   -18,    -5,    -4,
	 7,     7,-32768,-32768,-32768,   -21,-32768,-32768,-32768,-32768,
-32768,    52,    28,-32768,   -25,    -1,-32768,-32768,-32768,-32768,
	 7,-32768,-32768,    30,    -6,    14,    37,    39,    42,    50,
	55,    56,   213,   213,     7,-32768,-32768,-32768,     6,    13,
	17,    49,    77,   105,    84,   115,   126,   184,   136,   155,
-32768,-32768,-32768,-32768,-32768,-32768,   166,   176,-32768,-32768,
	89,-32768,    92,-32768,   100,-32768,   101,-32768,   103,-32768,
   102,   107,-32768,   106,    95,-32768,-32768,   112,   119,-32768,
   116,   124,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,   127,    16,-32768,   130,    36,-32768,
   -14,-32768,   -12,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,   140,   144,-32768
};

static const short yypgoto[] = {-32768,
-32768,   117,-32768,-32768,-32768,    57,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,    96,   169
};


#define	YYLAST		253


static const short yytable[] = {     3,
	44,     4,     5,     6,     7,     8,     9,    10,    80,    37,
	 1,     3,    37,    11,    12,    82,    35,     8,     9,    84,
	38,    39,    81,    38,    39,    11,    12,    56,    60,    83,
	45,    13,    61,    85,   143,    14,   145,    40,    15,   144,
	40,   146,    55,    13,    16,    17,    18,    14,    62,    19,
	15,    86,    63,     3,    57,    46,    16,    17,    18,     8,
	 9,    19,   138,   139,    59,    87,    33,    11,    12,    47,
	34,    64,    48,    65,    49,    50,    66,    42,    43,    90,
	67,     3,   141,   142,    68,    13,    96,     8,     9,    69,
	70,   124,    15,    91,   125,    11,    12,    58,    51,    52,
	53,    88,   126,   127,   129,    54,   128,    93,   131,     3,
   130,    79,   132,    13,   133,     8,     9,    97,   135,     3,
	15,    94,   134,    11,    12,     8,     9,   136,   100,   137,
	 3,    98,   140,    11,    12,    36,     8,     9,   114,   148,
	 3,    13,   101,   149,    11,    12,     8,     9,    15,    78,
	 0,    13,   115,     0,    11,    12,     0,   117,    15,     3,
	 0,     0,    13,     0,     0,     8,     9,     0,   120,    15,
	 3,   118,    13,    11,    12,     0,     8,     9,   122,    15,
	 3,     0,     0,     0,    11,    12,     8,     9,     0,   103,
	 0,    13,     0,     0,    11,    12,     0,     0,    15,   104,
	 0,     0,    13,     0,     0,     0,     0,     0,     0,    15,
	 0,     0,    13,   105,   106,   107,   108,   109,     0,    15,
	 0,     0,     0,     0,     0,     0,   110,     0,   111,   112,
	89,    92,    95,     0,    99,   102,     0,   116,   119,    71,
	72,    73,     0,     0,     0,   121,   123,     0,    74,     0,
	75,     0,    76
};

static const short yycheck[] = {     5,
	22,     7,     8,     9,    10,    11,    12,    13,     3,    14,
	 3,     5,    14,    19,    20,     3,    35,    11,    12,     3,
	25,    26,    17,    25,    26,    19,    20,    53,    35,    17,
	52,    37,    39,    17,    49,    41,    49,    42,    44,    54,
	42,    54,    15,    37,    50,    51,    52,    41,    35,    55,
	44,     3,    39,     5,    56,     4,    50,    51,    52,    11,
	12,    55,    47,    48,    35,    17,    10,    19,    20,    18,
	14,    35,    21,    35,    23,    24,    35,    21,    22,     3,
	39,     5,    47,    48,    35,    37,     3,    11,    12,    35,
	35,     3,    44,    17,     3,    19,    20,    41,    47,    48,
	49,    53,     3,     3,     3,    54,     4,     3,     3,     5,
	 4,    55,    18,    37,     3,    11,    12,     3,     3,     5,
	44,    17,     4,    19,    20,    11,    12,     4,     3,     3,
	 5,    17,     3,    19,    20,    19,    11,    12,     3,     0,
	 5,    37,    17,     0,    19,    20,    11,    12,    44,    54,
	-1,    37,    17,    -1,    19,    20,    -1,     3,    44,     5,
	-1,    -1,    37,    -1,    -1,    11,    12,    -1,     3,    44,
	 5,    17,    37,    19,    20,    -1,    11,    12,     3,    44,
	 5,    -1,    -1,    -1,    19,    20,    11,    12,    -1,     6,
	-1,    37,    -1,    -1,    19,    20,    -1,    -1,    44,    16,
	-1,    -1,    37,    -1,    -1,    -1,    -1,    -1,    -1,    44,
	-1,    -1,    37,    30,    31,    32,    33,    34,    -1,    44,
	-1,    -1,    -1,    -1,    -1,    -1,    43,    -1,    45,    46,
	62,    63,    64,    -1,    66,    67,    -1,    69,    70,    27,
	28,    29,    -1,    -1,    -1,    77,    78,    -1,    36,    -1,
	38,    -1,    40
};
/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
#line 3 "/usr/share/bison.simple"
/* This file comes from bison-1.28.  */

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
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

/* This is the parser code that is written into each bison parser
  when the %semantic_parser declaration is not specified in the grammar.
  It was written by Richard Stallman by simplifying the hairy parser
  used when %semantic_parser is specified.  */

#ifndef YYSTACK_USE_ALLOCA
#ifdef alloca
#define YYSTACK_USE_ALLOCA
#else /* alloca not defined */
#ifdef __GNUC__
#define YYSTACK_USE_ALLOCA
#define alloca __builtin_alloca
#else /* not GNU C.  */
#if (!defined (__STDC__) && defined (sparc)) || defined (__sparc__) || defined (__sparc) || defined (__sgi) || (defined (__sun) && defined (__i386))
#define YYSTACK_USE_ALLOCA
#include <alloca.h>
#else /* not sparc */
/* We think this test detects Watcom and Microsoft C.  */
/* This used to test MSDOS, but that is a bad idea
   since that symbol is in the user namespace.  */
#if (defined (_MSDOS) || defined (_MSDOS_)) && !defined (__TURBOC__)
#if 0 /* No need for malloc.h, which pollutes the namespace;
	 instead, just don't use alloca.  */
#include <malloc.h>
#endif
#else /* not MSDOS, or __TURBOC__ */
#if defined(_AIX)
/* I don't know what this was needed for, but it pollutes the namespace.
   So I turned it off.   rms, 2 May 1997.  */
/* #include <malloc.h>  */
 #pragma alloca
#define YYSTACK_USE_ALLOCA
#else /* not MSDOS, or __TURBOC__, or _AIX */
#if 0
#ifdef __hpux /* haible@ilog.fr says this works for HPUX 9.05 and up,
		 and on HPUX 10.  Eventually we can turn this on.  */
#define YYSTACK_USE_ALLOCA
#define alloca __builtin_alloca
#endif /* __hpux */
#endif
#endif /* not _AIX */
#endif /* not MSDOS, or __TURBOC__ */
#endif /* not sparc */
#endif /* not GNU C */
#endif /* alloca not defined */
#endif /* YYSTACK_USE_ALLOCA not defined */

#ifdef YYSTACK_USE_ALLOCA
#define YYSTACK_ALLOC alloca
#else
#define YYSTACK_ALLOC malloc
#endif

/* Note: there must be only one dollar sign in this file.
   It is replaced by the list of actions, each action
   as one case of the switch.  */

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0
#define YYACCEPT	goto yyacceptlab
#define YYABORT 	goto yyabortlab
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

/* Define __yy_memcpy.  Note that the size argument
   should be passed with type unsigned int, because that is what the non-GCC
   definitions require.  With GCC, __builtin_memcpy takes an arg
   of type size_t, but it can handle unsigned int.  */

#if __GNUC__ > 1		/* GNU C and GNU C++ define this.  */
#define __yy_memcpy(TO,FROM,COUNT)	__builtin_memcpy(TO,FROM,COUNT)
#else				/* not GNU C or C++ */
#ifndef __cplusplus

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (to, from, count)
	 char *to;
	 char *from;
	 unsigned int count;
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
__yy_memcpy (char *to, char *from, unsigned int count)
{
  register char *t = to;
  register char *f = from;
  register int i = count;

  while (i-- > 0)
	*t++ = *f++;
}

#endif
#endif

#line 217 "/usr/share/bison.simple"

/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
#ifdef __cplusplus
#define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
#define YYPARSE_PARAM_DECL
#else /* not __cplusplus */
#define YYPARSE_PARAM_ARG YYPARSE_PARAM
#define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
#endif /* not __cplusplus */
#else /* not YYPARSE_PARAM */
#define YYPARSE_PARAM_ARG
#define YYPARSE_PARAM_DECL
#endif /* not YYPARSE_PARAM */

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
#ifdef YYPARSE_PARAM
int yyparse (void *);
#else
int yyparse (void);
#endif
#endif

int
yyparse(YYPARSE_PARAM_ARG)
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
  int yyfree_stacks = 0;

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
	  if (yyfree_stacks)
		{
		  free (yyss);
		  free (yyvs);
#ifdef YYLSP_NEEDED
		  free (yyls);
#endif
		}
	  return 2;
	}
	  yystacksize *= 2;
	  if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;
#ifndef YYSTACK_USE_ALLOCA
	  yyfree_stacks = 1;
#endif
	  yyss = (short *) YYSTACK_ALLOC (yystacksize * sizeof (*yyssp));
	  __yy_memcpy ((char *)yyss, (char *)yyss1,
		   size * (unsigned int) sizeof (*yyssp));
	  yyvs = (YYSTYPE *) YYSTACK_ALLOC (yystacksize * sizeof (*yyvsp));
	  __yy_memcpy ((char *)yyvs, (char *)yyvs1,
		   size * (unsigned int) sizeof (*yyvsp));
#ifdef YYLSP_NEEDED
	  yyls = (YYLTYPE *) YYSTACK_ALLOC (yystacksize * sizeof (*yylsp));
	  __yy_memcpy ((char *)yyls, (char *)yyls1,
		   size * (unsigned int) sizeof (*yylsp));
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
#line 134 "atest.y"
{
	yyval.tstval = pAmpleTestTree_m = makeAmpleTest( yyvsp[0].tstval, szTestName_m );
	;
	break;}
case 2:
#line 140 "atest.y"
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
#line 153 "atest.y"
{
	yyval.tstval = makeAmpleTestNode(yyvsp[-1].ival, yyvsp[-2].tstval, yyvsp[0].tstval);
	;
	break;}
case 4:
#line 157 "atest.y"
{
	yyval.tstval = makeAmpleTestNode( LOGIF, yyvsp[-2].tstval, yyvsp[0].tstval);
	;
	break;}
case 5:
#line 161 "atest.y"
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
#line 180 "atest.y"
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
#line 199 "atest.y"
{
	;
	break;}
case 8:
#line 205 "atest.y"
{
	yyval.ival = LOGAND;
	;
	break;}
case 9:
#line 209 "atest.y"
{
	yyval.ival = LOGOR;
	;
	break;}
case 10:
#line 213 "atest.y"
{
	yyval.ival = LOGXOR;
	;
	break;}
case 11:
#line 217 "atest.y"
{
	yyval.ival = LOGIFF;
	;
	break;}
case 12:
#line 224 "atest.y"
{
	yyval.ival = ALL_LEFT;
	;
	break;}
case 13:
#line 228 "atest.y"
{
	yyval.ival = SOME_LEFT;
	;
	break;}
case 14:
#line 235 "atest.y"
{
	yyval.ival = ALL_RIGHT;
	;
	break;}
case 15:
#line 239 "atest.y"
{
	yyval.ival = SOME_RIGHT;
	;
	break;}
case 16:
#line 246 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
		yyval.tstval->iOpCode ^= OP_NOT;
	;
	break;}
case 17:
#line 251 "atest.y"
{
	yyval.tstval = yyvsp[-1].tstval;
	;
	break;}
case 18:
#line 255 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 19:
#line 259 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 20:
#line 263 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 21:
#line 267 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 22:
#line 271 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 23:
#line 275 "atest.y"
{
	yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 24:
#line 279 "atest.y"
{
		yyval.tstval = yyvsp[0].tstval;
	;
	break;}
case 25:
#line 286 "atest.y"
{
	if ((uiTempProperty_m = findAmplePropertyNumber(yyvsp[0].cval,
						 &pAmpleData_m->sProperties)) == 0)
	   id_error("property", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestProperty(PROP_IS, yyvsp[-3].ival, uiTempProperty_m);
	;
	break;}
case 26:
#line 296 "atest.y"
{
	yyval.tstval = makeAmpleTestString(MORPH_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 27:
#line 300 "atest.y"
{
	if ((pTempMorphClass_m = findAmpleMorphClass(yyvsp[0].cval,
					 pAmpleData_m->pMorphClasses)) == NULL)
		id_error("morpheme class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestMorphClass(MORPH_MEMBER, yyvsp[-4].ival, pTempMorphClass_m);
	;
	break;}
case 28:
#line 307 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(MOR_IS_MORPH, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 29:
#line 311 "atest.y"
{
	if (strcmp(yyvsp[0].cval,"0") == 0)
		*(yyvsp[0].cval) = NUL;
	yyval.tstval = makeAmpleTestString(ALLO_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 30:
#line 317 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(ALLO_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 31:
#line 324 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(ALLO_IS_AL, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 32:
#line 328 "atest.y"
{
	yyval.tstval = makeAmpleTestString(ALLO_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 33:
#line 332 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(AL_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 34:
#line 339 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(AL_MAT_AL, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 35:
#line 343 "atest.y"
{
	yyval.tstval = makeAmpleTestString(STRING_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 36:
#line 347 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(STRING_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 37:
#line 354 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(ST_IS_AL, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 38:
#line 358 "atest.y"
{
	yyval.tstval = makeAmpleTestString(ST_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 39:
#line 362 "atest.y"
{
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(ST_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 40:
#line 369 "atest.y"
{
		yyval.tstval = makeAmpleTestInt(ST_MAT_AL, yyvsp[-4].ival, yyvsp[-1].ival );
	;
	break;}
case 41:
#line 373 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-3].ival); /* 3.3.0 hab */
	yyval.tstval = makeAmpleTestString(WORD_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 42:
#line 378 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-4].ival); /* 3.3.0 hab */
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(WORD_MEMBER, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 43:
#line 386 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-3].ival); /* 3.3.0 hab */
	yyval.tstval = makeAmpleTestString(WORD_MATCH, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 44:
#line 391 "atest.y"
{
	setUsesSurroundingWord(yyvsp[-4].ival); /* 3.3.0 hab */
	pTempStringClass_m = findStringClass(yyvsp[0].cval, pAmpleData_m->pStringClasses);
	if (pTempStringClass_m == NULL)
		id_error("string class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestStringClass(WD_MAT_MEM, yyvsp[-4].ival, pTempStringClass_m );
	;
	break;}
case 45:
#line 402 "atest.y"
{
	yyval.ival = LAST;
	/* 3.3.0 hab  can't be here because is used by punctuation now, too */
	/* bUsesPrevWord_m = TRUE; */
	;
	break;}
case 46:
#line 408 "atest.y"
{
	yyval.ival = NEXT;
	/* 3.3.0 hab  can't be here because is used by punctuation now, too */
	/* bUsesNextWord_m = TRUE; */
	;
	break;}
case 47:
#line 417 "atest.y"
{
		yyval.tstval = makeAmpleTestInt(TYPE_IS, yyvsp[-3].ival, yyvsp[0].ival);
	;
	break;}
case 48:
#line 424 "atest.y"
{
	yyval.ival = AMPLE_PFX;
	;
	break;}
case 49:
#line 428 "atest.y"
{
	yyval.ival = AMPLE_IFX;
	;
	break;}
case 50:
#line 432 "atest.y"
{
	yyval.ival = AMPLE_NFX;
	;
	break;}
case 51:
#line 436 "atest.y"
{
	yyval.ival = AMPLE_NFXPFX;
	;
	break;}
case 52:
#line 440 "atest.y"
{
	yyval.ival = AMPLE_NFXSFX;
	;
	break;}
case 53:
#line 444 "atest.y"
{
	yyval.ival = AMPLE_NFXIFX;
	;
	break;}
case 54:
#line 448 "atest.y"
{
	yyval.ival = AMPLE_ROOT;
	;
	break;}
case 55:
#line 452 "atest.y"
{
	yyval.ival = AMPLE_SFX;
	;
	break;}
case 56:
#line 456 "atest.y"
{
	yyval.ival = WINITIAL;
	;
	break;}
case 57:
#line 460 "atest.y"
{
	yyval.ival = WFINAL;
	;
	break;}
case 58:
#line 467 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(FROM_IS_FROM, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 59:
#line 471 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(FR_IS_TO, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 60:
#line 475 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(TO_IS_FROM, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 61:
#line 479 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(TO_IS_TO, yyvsp[-4].ival, yyvsp[-1].ival);
	;
	break;}
case 62:
#line 483 "atest.y"
{
	if ((pTempCatClass_m = findAmpleCategClass(yyvsp[0].cval,
					  pAmpleData_m->pCategoryClasses)) == NULL)
		id_error("category class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestCategClass(FROM_MEMBER, yyvsp[-4].ival, pTempCatClass_m);
	;
	break;}
case 63:
#line 490 "atest.y"
{
	if ((pTempCatClass_m = findAmpleCategClass(yyvsp[0].cval,
					  pAmpleData_m->pCategoryClasses)) == NULL)
		id_error("category class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestCategClass(TO_MEMBER, yyvsp[-4].ival, pTempCatClass_m);
	;
	break;}
case 64:
#line 497 "atest.y"
{
	if ((iTemp_m = findAmpleCategoryNumber(yyvsp[0].cval,
						pAmpleData_m->pCategories)) == 0)
		id_error("category", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestInt(FROM_IS, yyvsp[-3].ival, iTemp_m);
	;
	break;}
case 65:
#line 504 "atest.y"
{
	if ((iTemp_m = findAmpleCategoryNumber(yyvsp[0].cval,
						pAmpleData_m->pCategories)) == 0)
		id_error("category", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestInt(TO_IS, yyvsp[-3].ival, iTemp_m);
	;
	break;}
case 66:
#line 514 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(AL_IS_CAP, yyvsp[-3].ival, 0);
	;
	break;}
case 67:
#line 518 "atest.y"
{
	yyval.tstval = makeAmpleTestInt(WD_IS_CAP, yyvsp[-2].ival, 0);
	;
	break;}
case 68:
#line 525 "atest.y"
{
	yyval.tstval = makeAmpleTestPunct(PUNCT_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
	;
	break;}
case 69:
#line 529 "atest.y"
{
	pTempPunctClass_m = findPunctClass(yyvsp[0].cval, pAmpleData_m->pPunctClasses);
	if (pTempPunctClass_m == NULL)
		id_error("punctuation class", yyvsp[0].cval);
	yyval.tstval = makeAmpleTestPunctClass(PUNCT_MEMBER, yyvsp[-4].ival, pTempPunctClass_m );
	;
	break;}
case 70:
#line 539 "atest.y"
{
	yyval.tstval = makeAmpleTestInt( yyvsp[-2].ival, yyvsp[-4].ival, yyvsp[-1].ival );
	;
	break;}
case 71:
#line 543 "atest.y"
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
case 72:
#line 567 "atest.y"
{
	yyval.tstval = makeAmpleTestInt( yyvsp[-2].ival + (ORDR_EQ_ORDRMAX-ORDR_EQ) , yyvsp[-4].ival, yyvsp[-1].ival );
	;
	break;}
case 73:
#line 571 "atest.y"
{
	yyval.tstval = makeAmpleTestInt( yyvsp[-2].ival + (ORDRMAX_EQ_ORDR-ORDR_EQ), yyvsp[-4].ival, yyvsp[-1].ival );
	;
	break;}
case 74:
#line 575 "atest.y"
{
	yyval.tstval = makeAmpleTestInt( yyvsp[-2].ival + (ORDRMAX_EQ_ORDRMAX-ORDR_EQ), yyvsp[-4].ival, yyvsp[-1].ival );
	;
	break;}
case 75:
#line 579 "atest.y"
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
case 76:
#line 606 "atest.y"
{
	yyval.ival = ORDR_EQ;
	;
	break;}
case 77:
#line 610 "atest.y"
{
	yyval.ival = ORDR_GT;
	;
	break;}
case 78:
#line 614 "atest.y"
{
	yyval.ival = ORDR_GE;
	;
	break;}
case 79:
#line 618 "atest.y"
{
	yyval.ival = ORDR_LE;
	;
	break;}
case 80:
#line 622 "atest.y"
{
	yyval.ival = ORDR_LT;
	;
	break;}
case 81:
#line 626 "atest.y"
{
	yyval.ival = ORDR_NE;
	;
	break;}
case 82:
#line 633 "atest.y"
{
	yyval.ival = ARGLEFT;
	;
	break;}
case 83:
#line 637 "atest.y"
{
	yyval.ival = ARGRIGHT;
	;
	break;}
case 84:
#line 641 "atest.y"
{
	yyval.ival = ARGCURRENT;
	;
	break;}
case 85:
#line 645 "atest.y"
{
	++bLeftSeen_m;
	yyval.ival = FORLEFT;
	;
	break;}
case 86:
#line 650 "atest.y"
{
	++bRightSeen_m;
	yyval.ival = FORRIGHT;
	;
	break;}
case 87:
#line 655 "atest.y"
{
	yyval.ival = INITIALM;
	;
	break;}
case 88:
#line 659 "atest.y"
{
	yyval.ival = FINALM;
	;
	break;}
}
   /* the action file gets copied in in place of this dollarsign */
#line 543 "/usr/share/bison.simple"

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

 yyacceptlab:
  /* YYACCEPT comes here.  */
  if (yyfree_stacks)
	{
	  free (yyss);
	  free (yyvs);
#ifdef YYLSP_NEEDED
	  free (yyls);
#endif
	}
  return 0;

 yyabortlab:
  /* YYABORT comes here.  */
  if (yyfree_stacks)
	{
	  free (yyss);
	  free (yyvs);
#ifdef YYLSP_NEEDED
	  free (yyls);
#endif
	}
  return 1;
}
#line 664 "atest.y"


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
