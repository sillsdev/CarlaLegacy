
/*  A Bison parser, made from trule_yg.y with Bison version GNU Bison version 1.24
  */

#define YYBISON 1  /* Identify Bison output.  */

#define	LX_A	258
#define	LX_AND	259
#define	LX_APPLIES	260
#define	LX_ASSOCIATE	261
#define	LX_AT	262
#define	LX_BIMORAIC	263
#define	LX_BOUNDARY	264
#define	LX_CATEGORY	265
#define	LX_CODA	266
#define	LX_CONDITION	267
#define	LX_COPY	268
#define	LX_CURRENT	269
#define	LX_CYCLE	270
#define	LX_CYCLICALLY	271
#define	LX_DEFAULT	272
#define	LX_DELETE	273
#define	LX_DELINK	274
#define	LX_DELINKED	275
#define	LX_DIRECTION	276
#define	LX_DISYLLABIC	277
#define	LX_DOMAIN	278
#define	LX_DOMAINS	279
#define	LX_ECONDITION	280
#define	LX_EDGE	281
#define	LX_EDGE_IN	282
#define	LX_EXTRAMETRICAL	283
#define	LX_FEATURE_ADDING	284
#define	LX_FEATURE_CHANGING	285
#define	LX_FEATURE_FILLING	286
#define	LX_FILL_IN	287
#define	LX_FINAL	288
#define	LX_FLOATING	289
#define	LX_HAS	290
#define	LX_IDENTIFIER	291
#define	LX_IF	292
#define	LX_IN	293
#define	LX_INFIX	294
#define	LX_INITIAL	295
#define	LX_INSERT	296
#define	LX_IS	297
#define	LX_ITERATION	298
#define	LX_ITERATIVELY	299
#define	LX_LEFT	300
#define	LX_LEFT_FLOATING	301
#define	LX_LEFTTWO	302
#define	LX_LEFTWARD	303
#define	LX_LINK	304
#define	LX_LINKED	305
#define	LX_LO_AND	306
#define	LX_LO_IFF	307
#define	LX_LO_NOT	308
#define	LX_LO_OR	309
#define	LX_LO_XOR	310
#define	LX_MEMBER	311
#define	LX_MELODY	312
#define	LX_MODE	313
#define	LX_MONOMORAIC	314
#define	LX_MONOSYLLABIC	315
#define	LX_MORPHEME	316
#define	LX_MORPHNAME	317
#define	LX_NONE	318
#define	LX_NONITERATIVELY	319
#define	LX_OCP	320
#define	LX_OCP_BLOCKAGE	321
#define	LX_OCP_IGNORED	322
#define	LX_OCP_MERGER	323
#define	LX_OF	324
#define	LX_ONE_TO_ONE	325
#define	LX_ONSET	326
#define	LX_OPTIONAL	327
#define	LX_PATTERN	328
#define	LX_PFINAL	329
#define	LX_PINITIAL	330
#define	LX_POLYSYLLABIC	331
#define	LX_PREFIX	332
#define	LX_PROPERTY	333
#define	LX_QUADRISYLLABIC	334
#define	LX_RIGHT	335
#define	LX_RIGHT_FLOATING	336
#define	LX_RIGHTTWO	337
#define	LX_RIGHTWARD	338
#define	LX_ROOT	339
#define	LX_SEGMENT	340
#define	LX_SET	341
#define	LX_SPREAD	342
#define	LX_SUFFIX	343
#define	LX_SYLLABLE	344
#define	LX_TBU	345
#define	LX_TBUS	346
#define	LX_THEN	347
#define	LX_TO	348
#define	LX_TONE	349
#define	LX_TONES	350
#define	LX_TRISYLLABIC	351
#define	LX_TYPE	352
#define	LX_UNDER	353
#define	LX_USING	354
#define	LX_WITH	355
#define	LX_WITHIN	356
#define	LX_WORD	357

#line 15 "trule_yg.y"

	/* Bison includes stdio, and MSC doesn't like seeing it twice */
#ifndef MSC
#include <stdio.h>
#endif
#ifndef NULL
#include <stdio.h>
#endif

#include <ctype.h>
#include <stdlib.h>
#include <string.h>

#ifdef __STDC__
#include <stdlib.h>
#endif

#ifdef ORIG
#include "defs.h"
#include "class.h"
#include "myallo.h"
#include "trule.h"
#include "tonepars.h"
#include "tone.h"
#else  /* ORIG */
#include "stamp.h"
#include "trule.h"
#endif /* ORIG */

/********************* TRULE_YG.Y EXTERN FUNCTIONS *********************/

			/* tone.c */
extern char  *edge_cond_name   P((long ec));
extern long   find_edge_cond P((char *cp));
extern int    find_tone_domain P((char *cp));
extern int    find_tone_type   P((char *cp));
extern char  *tone_type_name P((int td));
extern struct tone_value_list *find_tone_value_list  P((char *cp));
extern char  *tone_domain_name P((int td));

			/* yacc/bison */
extern int yylex P((void));

/********************* TRULE_YG.Y FUNCTION PROTOTYPES *********************/

static int               check_tone_pos P((int pos));
	   struct cycle     *get_default_cycle P((void));
	   struct tone_rule *get_edge_cond_rule_head P(( void ));
	   void              parseToneRule P((char *cp, int type,
					  StampData *pStamp_in));
	   struct tone_rule *get_tone_rule_head P(( void ));
	   struct tone_rule *get_tone_rule_tail P(( void ));
static void              id_error P((char *expected,
					 char *found));
	   void              init_tone_rule P((int   rd, StampData *pStamp_in));
	   void              init_tone_rule_stats  P((void));
static struct action *link_action P((struct action    *ac_head,
					 struct action    *ac_new));
static struct domain_list *link_domain_list P((struct domain_list *dl_head,
						   struct domain_list *dl_new));
static struct tone_pattern *link_tone_pattern P((struct tone_pattern *tp_head,
						 struct tone_pattern *tp_new));
static struct tone_rule    *link_tone_rule    P((struct tone_rule    *tp_head,
						 struct tone_rule    *tp_new));
static struct action *mkaction P((int               op,
				  struct tone_id   *tip,
				  int               dim,
				  int               ocp,
				  struct domain_id *dip,
				  long              econd));
static struct cycle *mkcycle P((int                 dir,
				struct domain_list *domains));
static struct domain_id *mkdomainid P((int type,
					   int domain));
static struct domain_list *mkdomainlist P((int domain));
static struct cond_node *mklfcc P((int               opcode,
				   int               left,
				   AmpleCategoryClass *right));
static struct cond_node *mklfdi P((int               opcode,
				   int               left,
				   struct domain_id *right));
static struct cond_node *mklfi P((int opcode,
				  int left,
				  int right));
static struct cond_node *mklflg P((int           opcode,
				   int           left,
				   unsigned short right));
static struct cond_node *mklfli P((int  opcode,
				   int  left,
				   long right));
static struct cond_node *mklfmc P((int                 opcode,
				   int                 left,
				   AmpleMorphClass *right));
static struct cond_node *mklfs P((int   opcode,
				  int   left,
				  char *right));
static struct cond_node *mklfsc P((int                  opcode,
				   int                  left,
				   StringClass *right));
static struct cond_node *mklfti P((int             opcode,
				   int             left,
				   struct tone_id *right));
static struct cond_node *mklftp P((int                  opcode,
				   int                  left,
				   struct tone_pattern *right));
static struct cond_node *mknode P((int               opcode,
				   struct cond_node *left,
				   struct cond_node *right));
static struct tone_rule *mkrule P((struct action    *action,
				   struct cycle     *cycle,
				   struct cond_node *condition));
static struct tone_id *mktoneid P((int                     status,
				   int                     params,
				   int                     pos,
				   struct tone_value_list *tvlp));
static struct tone_pattern *mktonepattern P((struct tone_id *toneid));
	   void              set_tone_cycle P((int cycle));
static void              show_domain_id   P((struct domain_id *dp));
	   void              show_rule_action P((struct action *ap));
static void              show_rule_cond   P((struct cond_node *cdp));
static void              show_tone_id     P((struct tone_id *tp));
static void              show_tone_pattern P((struct tone_pattern *tp));
static void              show_tone_rule   P((struct tone_rule *tp));
	   void              show_tone_rules  P((void));
static void              show_where       P((int pos));
	   void              tone_rule_stats  P((void));
static void              t_indent         P((int depth,
						 char *str));
static void              tree_walk        P((struct cond_node *condp,
						 int depth));
	   void              yyerror  P((char *s));

#undef P

/********************* TRULE_YG.Y EXTERN VARIABLES *********************/
				/* used in trule_ls.l */
char *rpp;               /* pointer to input buffer */
char *lexp;		 /* pointer to where lex is */
char string_buf[100];
char current_id[100];
char last_id[100];

				/* tone type values */
extern int Linked;
extern int Floating;
extern int LeftFloating;
extern int RightFloating;
extern int Boundary;
extern int Delinked;
extern int Melody;

/********************* TRULE_YG.Y LOCAL VARIABLES *********************/

static char lstname[100];
static char *ltname  = (char *) 0;
static char *cp;

static AmpleCategoryClass     *tmp_ccp;
static struct domain_list     *tmp_dl, *tmp_dl2;
static AmpleMorphClass        *tmp_mcp;
static StringClass            *tmp_scp;
static unsigned short          tmp_prop;
static struct tone_value_list *tmp_tone;
static struct tone_pattern    *tmp_tp;
static int                     temp, temp2;
static long                    templ;

static int               default_action_params = DEFAULT_ACTION_PARAMS;
static int               default_tone_params   = DEFAULT_TONE_PARAMS;
static struct domain_id *default_domain        = (struct domain_id *)NULL;
static struct cycle     *default_cycle         = (struct cycle *)NULL;
static int               rule_debug            = FALSE;
static char             *tsterrhead            = "\nTONERULE";
static struct tone_rule *trule                 = (struct tone_rule *)NULL;
				/* head of list of edge condition tone rules */
static struct tone_rule *Erule_head            = (struct tone_rule *)NULL;
				/* head of list of tone rules */
static struct tone_rule *Trule_head            = (struct tone_rule *)NULL;

static int               do_morph_expr_check;
static StampData *	pStamp_m;

#line 200 "trule_yg.y"
typedef union  {
	int                  ival;
	char                *cval;
	struct action       *acval;
	struct domain_id    *dival;
	struct domain_list  *dlval;
	struct cond_node    *cnval;
	struct cycle        *cyval;
	struct tone_id      *tival;
	struct tone_pattern *tpval;
	struct tone_rule    *trval;
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



#define	YYFINAL		302
#define	YYFLAG		-32768
#define	YYNTBASE	109

#define YYTRANSLATE(x) ((unsigned)(x) <= 357 ? yytranslate[x] : 161)

static const char yytranslate[] = {     0,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,     2,     2,   104,
   105,     2,     2,   106,     2,   108,     2,     2,     2,     2,
	 2,     2,     2,     2,     2,     2,     2,   103,   107,     2,
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
	56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
	66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
	76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
	86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
	96,    97,    98,    99,   100,   101,   102
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
	 0,     2,     4,     6,     8,    10,    12,    14,    16,    20,
	24,    28,    32,    36,    40,    44,    48,    54,    57,    59,
	63,    66,    68,    72,    76,    78,    84,    89,    94,    98,
   103,   107,   111,   114,   120,   122,   124,   126,   128,   130,
   132,   134,   136,   141,   147,   151,   156,   160,   165,   169,
   174,   177,   181,   184,   188,   192,   197,   200,   202,   205,
   207,   209,   211,   213,   215,   217,   219,   221,   225,   227,
   229,   231,   234,   237,   239,   241,   243,   247,   250,   254,
   258,   261,   263,   265,   271,   275,   280,   283,   286,   288,
   291,   295,   299,   302,   306,   308,   312,   317,   320,   324,
   326,   328,   330,   332,   334,   336,   338,   343,   348,   354,
   359,   365,   370,   375,   380,   385,   391,   396,   401,   406,
   413,   421,   427,   432,   438,   444,   451,   457,   464,   472,
   478,   483,   485,   487,   489,   491,   494,   496,   498,   500,
   502,   504,   506,   508,   510,   512,   514,   516,   518,   520,
   522,   524,   526,   528,   530,   532,   534,   536,   538,   540,
   542,   544,   546,   548,   550,   552,   554,   556,   558,   560,
   562,   564,   566,   568
};

static const short yyrhs[] = {   110,
	 0,   117,     0,   111,     0,   112,     0,   113,     0,   114,
	 0,   115,     0,   116,     0,    21,   103,   127,     0,    43,
   103,   128,     0,    58,   103,   130,     0,    65,   103,   132,
	 0,    23,   103,   135,     0,    15,   103,    63,     0,    15,
   103,    23,     0,    15,   103,   127,     0,   118,   104,    72,
   105,   119,     0,   118,   119,     0,    36,     0,   120,   121,
   141,     0,   120,   121,     0,   122,     0,   120,   106,   122,
	 0,   107,   136,   108,     0,   108,     0,   123,   124,   125,
   131,   133,     0,   123,   124,   125,   131,     0,   123,   124,
   125,   133,     0,   123,   124,   125,     0,   123,   124,   131,
   133,     0,   123,   124,   131,     0,   123,   124,   133,     0,
   123,   124,     0,    86,    26,    25,    93,    36,     0,     6,
	 0,    18,     0,    19,     0,    41,     0,    49,     0,    87,
	 0,    32,     0,    13,     0,     3,   158,    36,    94,     0,
	 3,   157,   158,    36,    94,     0,     3,   158,    94,     0,
	 3,   157,   158,    94,     0,     3,    36,    94,     0,     3,
   157,    36,    94,     0,   158,    36,    95,     0,   157,   158,
	36,    95,     0,   158,    95,     0,   157,   158,    95,     0,
	36,    95,     0,   157,    36,    95,     0,    17,    36,    94,
	 0,   157,    17,    36,    94,     0,   126,   129,     0,   126,
	 0,   127,   128,     0,   127,     0,   128,     0,    48,     0,
	83,     0,    64,     0,    44,     0,    27,     0,    70,     0,
	99,   130,    58,     0,    29,     0,    30,     0,    31,     0,
   100,   132,     0,    72,    66,     0,    66,     0,    67,     0,
	68,     0,   101,   134,   135,     0,   101,   135,     0,    45,
	26,    69,     0,    80,    26,    69,     0,    36,    23,     0,
	61,     0,   102,     0,     5,    16,   127,   101,   137,     0,
	 5,    16,   127,     0,     5,    16,   101,   137,     0,    36,
	23,     0,   138,    24,     0,   139,     0,   140,   139,     0,
	36,     4,    36,     0,   140,    36,   106,     0,    36,   106,
	 0,    12,   103,   142,     0,   143,     0,   142,   156,   143,
	 0,    37,   143,    92,   143,     0,    53,   143,     0,   104,
   142,   105,     0,   144,     0,   145,     0,   146,     0,   147,
	 0,   148,     0,   149,     0,   150,     0,    26,    25,    42,
	36,     0,   157,    10,    42,    36,     0,   157,    10,    42,
	56,    36,     0,   157,    62,    42,    36,     0,   157,    62,
	42,    56,    36,     0,   157,    78,    42,    36,     0,   157,
	89,    35,   154,     0,   157,    61,    42,   155,     0,   157,
	85,    42,    36,     0,   157,    85,    42,    56,    36,     0,
   157,    90,    42,   133,     0,   157,    90,    42,    28,     0,
   157,    90,    35,   151,     0,   157,    61,    90,    36,    35,
   151,     0,   157,    61,    98,    90,    36,    35,   151,     0,
   157,    61,    35,    36,   160,     0,   157,    94,    42,   151,
	 0,   157,   158,    94,    42,   151,     0,   157,    61,    94,
	42,   151,     0,   157,    61,    98,    94,    42,   151,     0,
   157,    94,    73,    42,   152,     0,   157,    61,    94,    73,
	42,   152,     0,   157,    61,    98,    94,    73,    42,   152,
	 0,   102,    94,    73,    42,   152,     0,   157,    97,    42,
   159,     0,   124,     0,    63,     0,   153,     0,    63,     0,
   153,   124,     0,   124,     0,    71,     0,    11,     0,    60,
	 0,    22,     0,    96,     0,    79,     0,    76,     0,    59,
	 0,     8,     0,    51,     0,    52,     0,    54,     0,    55,
	 0,    14,     0,    45,     0,    47,     0,    80,     0,    82,
	 0,    75,     0,    40,     0,    74,     0,    33,     0,     9,
	 0,    20,     0,    34,     0,    46,     0,    50,     0,    57,
	 0,    81,     0,    77,     0,    39,     0,    84,     0,    88,
	 0,    40,     0,    33,     0,    90,     0,    91,     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
   370,   371,   377,   378,   379,   380,   381,   382,   392,   406,
   420,   435,   450,   466,   475,   492,   508,   521,   541,   555,
   568,   590,   594,   612,   616,   626,   640,   653,   666,   679,
   692,   705,   718,   741,   763,   770,   777,   784,   790,   798,
   808,   828,   838,   857,   883,   898,   920,   938,   964,   983,
  1005,  1021,  1040,  1058,  1080,  1097,  1124,  1128,  1139,  1143,
  1147,  1156,  1160,  1170,  1176,  1188,  1208,  1218,  1228,  1236,
  1243,  1253,  1264,  1271,  1278,  1285,  1296,  1307,  1324,  1328,
  1336,  1349,  1360,  1375,  1389,  1402,  1419,  1431,  1439,  1443,
  1460,  1485,  1502,  1518,  1527,  1534,  1547,  1561,  1571,  1579,
  1587,  1604,  1612,  1620,  1627,  1634,  1644,  1663,  1680,  1699,
  1713,  1732,  1752,  1767,  1784,  1798,  1820,  1836,  1852,  1873,
  1907,  1941,  1973,  2021,  2065,  2080,  2096,  2114,  2130,  2147,
  2165,  2184,  2188,  2196,  2200,  2209,  2224,  2238,  2243,  2251,
  2256,  2261,  2266,  2271,  2276,  2281,  2289,  2294,  2299,  2304,
  2313,  2318,  2323,  2329,  2334,  2340,  2345,  2350,  2355,  2363,
  2371,  2377,  2384,  2391,  2397,  2403,  2413,  2417,  2421,  2425,
  2429,  2433,  2440,  2444
};

static const char * const yytname[] = {   "$","error","$undefined.","LX_A","LX_AND",
"LX_APPLIES","LX_ASSOCIATE","LX_AT","LX_BIMORAIC","LX_BOUNDARY","LX_CATEGORY",
"LX_CODA","LX_CONDITION","LX_COPY","LX_CURRENT","LX_CYCLE","LX_CYCLICALLY","LX_DEFAULT",
"LX_DELETE","LX_DELINK","LX_DELINKED","LX_DIRECTION","LX_DISYLLABIC","LX_DOMAIN",
"LX_DOMAINS","LX_ECONDITION","LX_EDGE","LX_EDGE_IN","LX_EXTRAMETRICAL","LX_FEATURE_ADDING",
"LX_FEATURE_CHANGING","LX_FEATURE_FILLING","LX_FILL_IN","LX_FINAL","LX_FLOATING",
"LX_HAS","LX_IDENTIFIER","LX_IF","LX_IN","LX_INFIX","LX_INITIAL","LX_INSERT",
"LX_IS","LX_ITERATION","LX_ITERATIVELY","LX_LEFT","LX_LEFT_FLOATING","LX_LEFTTWO",
"LX_LEFTWARD","LX_LINK","LX_LINKED","LX_LO_AND","LX_LO_IFF","LX_LO_NOT","LX_LO_OR",
"LX_LO_XOR","LX_MEMBER","LX_MELODY","LX_MODE","LX_MONOMORAIC","LX_MONOSYLLABIC",
"LX_MORPHEME","LX_MORPHNAME","LX_NONE","LX_NONITERATIVELY","LX_OCP","LX_OCP_BLOCKAGE",
"LX_OCP_IGNORED","LX_OCP_MERGER","LX_OF","LX_ONE_TO_ONE","LX_ONSET","LX_OPTIONAL",
"LX_PATTERN","LX_PFINAL","LX_PINITIAL","LX_POLYSYLLABIC","LX_PREFIX","LX_PROPERTY",
"LX_QUADRISYLLABIC","LX_RIGHT","LX_RIGHT_FLOATING","LX_RIGHTTWO","LX_RIGHTWARD",
"LX_ROOT","LX_SEGMENT","LX_SET","LX_SPREAD","LX_SUFFIX","LX_SYLLABLE","LX_TBU",
"LX_TBUS","LX_THEN","LX_TO","LX_TONE","LX_TONES","LX_TRISYLLABIC","LX_TYPE",
"LX_UNDER","LX_USING","LX_WITH","LX_WITHIN","LX_WORD","':'","'('","')'","','",
"';'","'.'","Default_Or_Rule","Default","Direction","Iteration","Feature_Op",
"Ocp","Entity","Cycle_Default","Tone_Rule","name","Tone_Rule_Body","Rule_Body",
"Rule_End","Rule_Action","operation","Tone","Dir_Iter_Mode","Dir_Iter","direction",
"iteration","Mode","feature_op","OCP","ocp","Domain","edge","entity","Cycle",
"Domain_cycle","Multi_domains","Two_domains","More_domains","Condition","Condition_Body",
"Factor","Edge_expr","Morpheme_expr","Prosodic_expr","Segment_expr","Tbu_expr",
"Tone_expr","Type_expr","Tone_none","Tone_Pattern","Tone_Pat","onset_coda","prosodic_shape",
"logop","position","tone_status","type","tbu_tbus",""
};
#endif

static const short yyr1[] = {     0,
   109,   109,   110,   110,   110,   110,   110,   110,   111,   112,
   113,   114,   115,   116,   116,   116,   117,   117,   118,   119,
   119,   120,   120,   121,   121,   122,   122,   122,   122,   122,
   122,   122,   122,   122,   123,   123,   123,   123,   123,   123,
   123,   123,   124,   124,   124,   124,   124,   124,   124,   124,
   124,   124,   124,   124,   124,   124,   125,   125,   126,   126,
   126,   127,   127,   128,   128,   128,   128,   129,   130,   130,
   130,   131,   132,   132,   132,   132,   133,   133,   134,   134,
   135,   135,   135,   136,   136,   136,   137,   137,   138,   138,
   139,   140,   140,   141,   142,   142,   142,   143,   143,   143,
   143,   143,   143,   143,   143,   143,   144,   145,   145,   145,
   145,   145,   146,   146,   147,   147,   148,   148,   148,   148,
   148,   148,   149,   149,   149,   149,   149,   149,   149,   149,
   150,   151,   151,   152,   152,   153,   153,   154,   154,   155,
   155,   155,   155,   155,   155,   155,   156,   156,   156,   156,
   157,   157,   157,   157,   157,   157,   157,   157,   157,   158,
   158,   158,   158,   158,   158,   158,   159,   159,   159,   159,
   159,   159,   160,   160
};

static const short yyr2[] = {     0,
	 1,     1,     1,     1,     1,     1,     1,     1,     3,     3,
	 3,     3,     3,     3,     3,     3,     5,     2,     1,     3,
	 2,     1,     3,     3,     1,     5,     4,     4,     3,     4,
	 3,     3,     2,     5,     1,     1,     1,     1,     1,     1,
	 1,     1,     4,     5,     3,     4,     3,     4,     3,     4,
	 2,     3,     2,     3,     3,     4,     2,     1,     2,     1,
	 1,     1,     1,     1,     1,     1,     1,     3,     1,     1,
	 1,     2,     2,     1,     1,     1,     3,     2,     3,     3,
	 2,     1,     1,     5,     3,     4,     2,     2,     1,     2,
	 3,     3,     2,     3,     1,     3,     4,     2,     3,     1,
	 1,     1,     1,     1,     1,     1,     4,     4,     5,     4,
	 5,     4,     4,     4,     4,     5,     4,     4,     4,     6,
	 7,     5,     4,     5,     5,     6,     5,     6,     7,     5,
	 4,     1,     1,     1,     1,     2,     1,     1,     1,     1,
	 1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
	 1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
	 1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
	 1,     1,     1,     1
};

static const short yydefact[] = {     0,
	 0,     0,     0,    19,     0,     0,     0,     1,     3,     4,
	 5,     6,     7,     8,     2,     0,     0,     0,     0,     0,
	 0,     0,    35,    42,    36,    37,    41,    38,    39,     0,
	40,     0,    18,     0,    22,     0,    15,    62,    14,    63,
	16,     9,     0,    82,    83,    13,    66,    65,    64,    67,
	10,    69,    70,    71,    11,    74,    75,    76,     0,    12,
	 0,     0,     0,     0,    25,    21,     0,   160,   151,     0,
   161,   159,   162,     0,   157,   152,   163,   153,   164,   165,
   158,   156,   154,   166,   155,    33,     0,     0,    81,    73,
	 0,     0,    23,     0,     0,     0,    20,     0,     0,     0,
	 0,    53,     0,     0,    29,    58,    60,    61,    31,    32,
	 0,     0,     0,     0,    51,     0,    17,     0,    24,     0,
	47,     0,     0,     0,    45,    55,    72,     0,     0,     0,
	78,    27,    28,     0,    57,    59,    30,     0,    54,     0,
	52,    49,    34,     0,    85,     0,     0,     0,     0,     0,
	94,    95,   100,   101,   102,   103,   104,   105,   106,     0,
	48,     0,    46,    43,     0,     0,    77,    26,     0,    56,
	50,     0,    86,     0,    89,     0,     0,     0,     0,    98,
	 0,     0,   147,   148,   149,   150,     0,     0,     0,     0,
	 0,     0,     0,     0,     0,     0,     0,    44,    79,    80,
	68,     0,    87,    93,    88,     0,    90,    84,     0,     0,
	 0,    99,    96,     0,     0,     0,     0,     0,     0,     0,
	 0,     0,     0,     0,     0,     0,     0,     0,     0,    91,
	92,   107,    97,     0,   108,     0,     0,   146,   141,   145,
   140,   144,   143,   142,   114,     0,     0,     0,     0,     0,
   110,     0,   112,   115,     0,   139,   138,   113,   133,   132,
   119,   118,   117,   123,     0,   172,   168,   171,   167,   169,
   170,   131,     0,   135,   137,   130,   134,   109,   173,   174,
   122,     0,   125,     0,     0,     0,     0,   111,   116,   127,
   124,   136,   120,   128,     0,   126,     0,   121,   129,     0,
	 0,     0
};

static const short yydefgoto[] = {   300,
	 8,     9,    10,    11,    12,    13,    14,    15,    16,    33,
	34,    66,    35,    36,   260,   105,   106,    41,    51,   135,
	55,   109,    60,   110,   130,    46,    95,   173,   174,   175,
   176,    97,   151,   152,   153,   154,   155,   156,   157,   158,
   159,   261,   276,   277,   258,   245,   187,    87,    88,   272,
   281
};

static const short yypact[] = {   289,
   -85,   -82,   -52,-32768,   -43,   -41,    34,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,     6,    25,   -33,   -16,   149,
	82,   102,-32768,-32768,-32768,-32768,-32768,-32768,-32768,    74,
-32768,    68,-32768,   124,-32768,   306,-32768,-32768,-32768,-32768,
-32768,-32768,   119,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,    79,-32768,
   129,    51,    46,   156,-32768,   161,   356,-32768,-32768,   143,
-32768,-32768,-32768,    89,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,   144,   155,   -27,-32768,-32768,
   103,    46,-32768,   188,   108,   104,-32768,   112,   248,     5,
   116,-32768,   102,    58,    47,   134,   149,-32768,   110,-32768,
   182,   142,   -19,   148,-32768,   202,-32768,    76,-32768,    16,
-32768,   153,     8,   160,-32768,-32768,-32768,   223,   224,   -16,
-32768,   110,-32768,    82,-32768,-32768,-32768,   164,-32768,   165,
-32768,-32768,-32768,   219,   163,   237,    83,    83,   172,    16,
   170,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,   105,
-32768,   173,-32768,-32768,   205,   208,-32768,-32768,   213,-32768,
-32768,    -1,-32768,   251,-32768,   242,   219,   243,   199,-32768,
   220,    98,-32768,-32768,-32768,-32768,    83,   253,    37,   255,
   257,   258,   272,    99,   -37,   266,   217,-32768,-32768,-32768,
-32768,   278,-32768,-32768,-32768,     0,-32768,-32768,   280,    83,
   275,-32768,-32768,   -23,   282,   121,   285,    -3,    88,   -13,
   286,    90,     3,   206,   -18,   206,   291,   195,   292,-32768,
-32768,-32768,-32768,   256,-32768,   288,   -56,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,   293,   206,   299,   307,     4,
-32768,   308,-32768,-32768,   309,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,   256,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,   206,-32768,-32768,-32768,   306,-32768,-32768,-32768,
-32768,   206,-32768,   256,   300,   206,   313,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,   206,-32768,   256,-32768,-32768,   327,
   348,-32768
};

static const short yypgoto[] = {-32768,
-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,   265,
-32768,-32768,   287,-32768,   -36,-32768,-32768,   -11,   -70,-32768,
   215,   254,   259,  -103,-32768,   -73,-32768,   181,-32768,   184,
-32768,-32768,   211,  -121,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,  -215,  -180,-32768,-32768,-32768,-32768,   -66,   -59,-32768,
-32768
};


#define	YYLAST		438


static const short yytable[] = {    86,
	99,   133,   202,   202,   226,   137,    42,   100,   114,   262,
   264,    23,   235,   256,    38,   108,   140,    17,    24,    43,
	18,   203,   251,    25,    26,   179,   180,   113,   168,    69,
   131,   283,   236,   279,   280,   227,   136,    27,   247,   123,
   124,   146,   252,   162,    44,   286,    28,    37,    72,    40,
	19,    23,   147,   160,    29,    75,   167,   291,    24,    20,
	76,    21,    78,    25,    26,   213,   293,   115,   148,   248,
   296,   215,    38,   257,   107,   141,   287,    27,   216,   298,
   160,   160,   104,   160,   290,    45,    28,    39,   233,    81,
	82,    30,    31,    43,    29,    83,    69,    85,   125,    61,
   197,   163,   128,   294,   204,   231,   145,    40,   146,    32,
	52,    53,    54,    68,   188,    72,   299,   149,    44,   150,
   160,   263,    75,    38,    71,   254,   217,    76,   238,    78,
   218,    30,    31,   224,   219,   148,    22,   129,    73,    62,
   225,    89,   239,   160,    90,   255,   103,   104,   183,   184,
	77,   185,   186,    91,    79,    92,    81,    82,    40,    45,
	94,    80,    83,    68,    85,   189,   190,    56,    57,    58,
	47,   111,    96,    59,    71,    47,   144,   249,   101,   240,
   241,   250,   191,   102,   149,    84,   150,    48,    73,   192,
   112,    38,    48,   193,   194,   116,   242,   275,   195,   243,
	77,   196,   212,   118,    79,   121,   120,    49,    67,   126,
   104,    80,    49,    50,    68,   119,   244,   138,    50,    69,
   183,   184,    70,   185,   186,    71,    40,   266,   275,    63,
	64,    65,   134,   267,   268,    84,   139,   143,    72,    73,
   292,    74,   142,   103,   104,    75,   161,   275,   165,   166,
	76,    77,    78,   164,   172,    79,    68,   170,    67,   171,
   275,   178,    80,   177,    68,   181,   198,    71,   259,    69,
   201,   269,    70,   199,   205,    71,   200,   206,   270,    81,
	82,    73,   271,   122,   209,    83,    84,    85,    72,    73,
   210,    74,   211,    77,   214,    75,   220,    79,   221,   222,
	76,    77,    78,     1,    80,    79,   223,   228,    67,     2,
   229,     3,    80,   230,    68,   232,   234,   237,   274,    69,
   246,   253,    70,   278,     4,    71,   301,   282,    84,    81,
	82,     5,   265,   273,   295,    83,    84,    85,    72,    73,
   284,    74,   285,   288,   289,    75,     6,   302,   169,    93,
	76,    77,    78,     7,   297,    79,   117,   208,   132,   207,
   182,   127,    80,     0,    68,     0,     0,     0,     0,    69,
	 0,     0,     0,     0,     0,    71,     0,     0,     0,    81,
	82,     0,     0,     0,     0,    83,    84,    85,    72,    73,
	 0,    98,     0,     0,     0,    75,     0,     0,     0,     0,
	76,    77,    78,     0,     0,    79,     0,     0,     0,     0,
	 0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
	 0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
	82,     0,     0,     0,     0,    83,    84,    85
};

static const short yycheck[] = {    36,
	67,   105,     4,     4,    42,   109,    18,    67,    36,    28,
   226,     6,    36,    11,    48,    86,    36,   103,    13,    36,
   103,    23,    36,    18,    19,   147,   148,    87,   132,    14,
   104,   247,    56,    90,    91,    73,   107,    32,    42,    99,
	36,    26,    56,    36,    61,    42,    41,    23,    33,    83,
   103,     6,    37,   120,    49,    40,   130,   273,    13,   103,
	45,   103,    47,    18,    19,   187,   282,    95,    53,    73,
   286,    35,    48,    71,    86,    95,    73,    32,    42,   295,
   147,   148,   101,   150,   265,   102,    41,    63,   210,    74,
	75,    86,    87,    36,    49,    80,    14,    82,    94,    26,
   160,    94,    45,   284,   106,   106,   118,    83,    26,   104,
	29,    30,    31,     9,    10,    33,   297,   102,    61,   104,
   187,   225,    40,    48,    20,    36,    90,    45,     8,    47,
	94,    86,    87,    35,    98,    53,   103,    80,    34,    72,
	42,    23,    22,   210,    66,    56,   100,   101,    51,    52,
	46,    54,    55,    25,    50,   105,    74,    75,    83,   102,
	 5,    57,    80,     9,    82,    61,    62,    66,    67,    68,
	27,    17,    12,    72,    20,    27,   101,    90,    36,    59,
	60,    94,    78,    95,   102,    81,   104,    44,    34,    85,
	36,    48,    44,    89,    90,    93,    76,   234,    94,    79,
	46,    97,   105,    16,    50,    94,   103,    64,     3,    94,
   101,    57,    64,    70,     9,   108,    96,    36,    70,    14,
	51,    52,    17,    54,    55,    20,    83,    33,   265,   106,
   107,   108,    99,    39,    40,    81,    95,    36,    33,    34,
   277,    36,    95,   100,   101,    40,    94,   284,    26,    26,
	45,    46,    47,    94,    36,    50,     9,    94,     3,    95,
   297,    25,    57,   101,     9,    94,    94,    20,    63,    14,
	58,    77,    17,    69,    24,    20,    69,    36,    84,    74,
	75,    34,    88,    36,    42,    80,    81,    82,    33,    34,
	92,    36,    73,    46,    42,    40,    42,    50,    42,    42,
	45,    46,    47,    15,    57,    50,    35,    42,     3,    21,
	94,    23,    57,    36,     9,    36,    42,    36,    63,    14,
	36,    36,    17,    36,    36,    20,     0,    35,    81,    74,
	75,    43,    42,    42,    35,    80,    81,    82,    33,    34,
	42,    36,    36,    36,    36,    40,    58,     0,   134,    63,
	45,    46,    47,    65,    42,    50,    92,   177,   105,   176,
   150,   103,    57,    -1,     9,    -1,    -1,    -1,    -1,    14,
	-1,    -1,    -1,    -1,    -1,    20,    -1,    -1,    -1,    74,
	75,    -1,    -1,    -1,    -1,    80,    81,    82,    33,    34,
	-1,    36,    -1,    -1,    -1,    40,    -1,    -1,    -1,    -1,
	45,    46,    47,    -1,    -1,    50,    -1,    -1,    -1,    -1,
	-1,    -1,    57,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
	-1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
	75,    -1,    -1,    -1,    -1,    80,    81,    82
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
#define YYLEX		yylex()
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

case 9:
#line 393 "trule_yg.y"
{
		default_action_params |= yyvsp[0].ival;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: DIRECTION: dir");
			fprintf(pStamp_m->pLogFP, " [dir = %d, default = 0x%x)]",
				yyvsp[0].ival, (unsigned)default_action_params);
		  }
		  ;
	break;}
case 10:
#line 407 "trule_yg.y"
{
		default_action_params |= yyvsp[0].ival;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: ITERATION: iter");
			fprintf(pStamp_m->pLogFP, " [iter = %d, default = 0x%x)]",
				yyvsp[0].ival, (unsigned)default_action_params);
		  }
		  ;
	break;}
case 11:
#line 421 "trule_yg.y"
{
		default_action_params |= yyvsp[0].ival;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: MODE: feature_op");
			fprintf(pStamp_m->pLogFP, " [feat = %d, default = 0x%x)]",
				yyvsp[0].ival, (unsigned)default_action_params);
		  }
		  ;
	break;}
case 12:
#line 436 "trule_yg.y"
{
		default_action_params |= yyvsp[0].ival;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: OCP: ocp");
			fprintf(pStamp_m->pLogFP, " [ocp = %d, default = 0x%x)]",
				yyvsp[0].ival, (unsigned)default_action_params);
		  }
		  ;
	break;}
case 13:
#line 451 "trule_yg.y"
{
		default_domain = yyvsp[0].dival;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: DOMAIN: domain");
			fprintf(pStamp_m->pLogFP,
				" [domain = 0x%x, default = 0x%x)]", (unsigned)yyvsp[0].dival,
			   (unsigned)default_action_params);
		  }
		  ;
	break;}
case 14:
#line 467 "trule_yg.y"
{
		default_cycle = (struct cycle *)NULL;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: CYCLE: none");
		  }
		  ;
	break;}
case 15:
#line 476 "trule_yg.y"
{
		default_cycle = mkcycle(0, (struct domain_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: CYCLE: domain");
			fprintf(pStamp_m->pLogFP, " [0x%x mkcycle(0, NULL)]",
			   (unsigned)default_cycle);
		  }
		  ;
	break;}
case 16:
#line 493 "trule_yg.y"
{
		default_cycle = mkcycle(yyvsp[0].ival, (struct domain_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: CYCLE: direction");
			fprintf(pStamp_m->pLogFP, " [0x%x mkcycle(%d, NULL)]", yyvsp[0].ival,
			   (unsigned)default_cycle);
		  }
		  ;
	break;}
case 17:
#line 509 "trule_yg.y"
{
		trule->tr_name = duplicateString(ltname);
		trule->tr_params |= OPTIONAL;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_Rule:=name (optional) %s",
				(unsigned)trule, "Tone_Rule_Body (set name = ");
			fprintf(pStamp_m->pLogFP, "\"%s\" and optional flag)",
				ltname );
		  }
		  ;
	break;}
case 18:
#line 522 "trule_yg.y"
{
		trule->tr_name = duplicateString(ltname);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_Rule:=name Tone_Rule_Body %s",
				(unsigned)trule, "(set name = ");
			fprintf(pStamp_m->pLogFP, "\"%s\")", ltname);
		  }
		  ;
	break;}
case 19:
#line 542 "trule_yg.y"
{
		ltname = strcpy(lstname,yyvsp[0].cval);    /* save for error messages */
		  ;
	break;}
case 20:
#line 556 "trule_yg.y"
{
		trule = mkrule( yyvsp[-2].acval, yyvsp[-1].cyval, yyvsp[0].cnval );
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_Rule_Body:=Rule_Body Rule_End %s",
				(unsigned)trule, "Condition ");
			fprintf(pStamp_m->pLogFP,
				"[mkrule(0x%x, 0x%x, 0x%x)]", (unsigned)yyvsp[-2].acval,
				(unsigned)yyvsp[-1].cyval, (unsigned)yyvsp[0].cnval);
		  }
		  ;
	break;}
case 21:
#line 569 "trule_yg.y"
{
		trule = mkrule( yyvsp[-1].acval, yyvsp[0].cyval, (struct cond_node *)NULL );
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_Rule_Body:=Rule_Body Rule_End ",
				(unsigned)trule);
			fprintf(pStamp_m->pLogFP,
				"[mkrule(0x%x, 0x%x, NULL)]", (unsigned)yyvsp[-1].acval,
				(unsigned)yyvsp[0].cyval);
		  }
		  ;
	break;}
case 22:
#line 591 "trule_yg.y"
{
		yyval.acval = yyvsp[0].acval;
		  ;
	break;}
case 23:
#line 595 "trule_yg.y"
{
		yyval.acval = link_action(yyvsp[-2].acval, yyvsp[0].acval);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Body:=Rule_Body ; Rule_Action ",
				(unsigned)yyval.acval);
			fprintf(pStamp_m->pLogFP,
				"[link_action(0x%x, 0x%x)]", (unsigned)yyvsp[-2].acval,
				(unsigned)yyvsp[0].acval);
		  }
		  ;
	break;}
case 24:
#line 613 "trule_yg.y"
{
		yyval.cyval = yyvsp[-1].cyval;
		  ;
	break;}
case 25:
#line 617 "trule_yg.y"
{
		yyval.cyval = default_cycle;
		  ;
	break;}
case 26:
#line 627 "trule_yg.y"
{
		yyval.acval = mkaction(yyvsp[-4].ival, yyvsp[-3].tival, yyvsp[-2].ival, yyvsp[-1].ival, yyvsp[0].dival, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone %s",
				(unsigned)yyval.acval, "Dir_Iter_Mode OCP Domain");
			fprintf(pStamp_m->pLogFP,
			   "\n\t\t\t[mkaction(%d, 0x%x, 0x%x, 0x%x, 0x%x, 0)]",
			   yyvsp[-4].ival, (unsigned)yyvsp[-3].tival, (unsigned)yyvsp[-2].ival, (unsigned)yyvsp[-1].ival,
			   (unsigned)yyvsp[0].dival);
		  }
		  ;
	break;}
case 27:
#line 641 "trule_yg.y"
{
		yyval.acval = mkaction(yyvsp[-3].ival, yyvsp[-2].tival, yyvsp[-1].ival, yyvsp[0].ival, (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone %s",
				(unsigned)yyval.acval, "Dir_Iter_Mode OCP");
			fprintf(pStamp_m->pLogFP,
			   "\n\t\t\t[mkaction(%d, 0x%x, 0x%x, 0x%x, NULL, 0)]",
			   yyvsp[-3].ival, (unsigned)yyvsp[-2].tival, (unsigned)yyvsp[-1].ival, (unsigned)yyvsp[0].ival);
		  }
		  ;
	break;}
case 28:
#line 654 "trule_yg.y"
{
		yyval.acval = mkaction(yyvsp[-3].ival, yyvsp[-2].tival, yyvsp[-1].ival, 0, yyvsp[0].dival, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone %s",
				(unsigned)yyval.acval, "Dir_Iter_Mode Domain");
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0x%x, 0, 0x%x, 0)]",
				yyvsp[-3].ival, (unsigned)yyvsp[-2].tival, (unsigned)yyvsp[-1].ival, (unsigned)yyvsp[0].dival);
		  }
		  ;
	break;}
case 29:
#line 667 "trule_yg.y"
{
		yyval.acval = mkaction(yyvsp[-2].ival, yyvsp[-1].tival, yyvsp[0].ival, 0, (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tRule_Action:=operation Tone Dir_Iter_Mode",
			   (unsigned)yyval.acval);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0x%x, 0, NULL, 0)]",
				yyvsp[-2].ival, (unsigned)yyvsp[-1].tival, (unsigned)yyvsp[0].ival);
		  }
		  ;
	break;}
case 30:
#line 680 "trule_yg.y"
{
		yyval.acval = mkaction(yyvsp[-3].ival, yyvsp[-2].tival, 0, yyvsp[-1].ival, yyvsp[0].dival, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone OCP Domain",
				(unsigned)yyval.acval);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0, 0x%x, 0x%x, 0)]",
				yyvsp[-3].ival, (unsigned)yyvsp[-2].tival, (unsigned)yyvsp[-1].ival, (unsigned)yyvsp[0].dival);
		  }
		  ;
	break;}
case 31:
#line 693 "trule_yg.y"
{
		yyval.acval = mkaction(yyvsp[-2].ival, yyvsp[-1].tival, 0, yyvsp[0].ival, (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone OCP",
				(unsigned)yyval.acval);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0, 0x%x, NULL, 0)]",
				yyvsp[-2].ival, (unsigned)yyvsp[-1].tival, (unsigned)yyvsp[0].ival);
		  }
		  ;
	break;}
case 32:
#line 706 "trule_yg.y"
{
		yyval.acval = mkaction(yyvsp[-2].ival, yyvsp[-1].tival, 0, 0, yyvsp[0].dival, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone Domain",
				(unsigned)yyval.acval);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0, 0, 0x%x, 0)]",
				yyvsp[-2].ival, (unsigned)yyvsp[-1].tival, (unsigned)yyvsp[0].dival);
		  }
		  ;
	break;}
case 33:
#line 719 "trule_yg.y"
{
		yyval.acval = mkaction(yyvsp[-1].ival, yyvsp[0].tival, 0, 0, (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=operation Tone",
				(unsigned)yyval.acval);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%x, 0, 0, NULL, 0)]",
				yyvsp[-1].ival, (unsigned)yyvsp[0].tival);
		  }
		  ;
	break;}
case 34:
#line 742 "trule_yg.y"
{
		if ((templ = find_edge_cond(yyvsp[0].cval)) == 0)
		   id_error("edge condition", yyvsp[0].cval);
		yyval.acval = mkaction(SET_EDGE_COND, (struct tone_id *)NULL, 0, 0,
				  (struct domain_id *)NULL, templ);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tRule_Action:=set edge condition to COND",
				(unsigned)yyval.acval);
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, NULL, 0, 0, NULL, %ld)]",
				SET_EDGE_COND, templ);
		  }
		  ;
	break;}
case 35:
#line 764 "trule_yg.y"
{
		yyval.ival = ASSOCIATE;
		  ;
	break;}
case 36:
#line 771 "trule_yg.y"
{
		yyval.ival = DELETE;
		  ;
	break;}
case 37:
#line 778 "trule_yg.y"
{
		yyval.ival = DELINK;
		  ;
	break;}
case 38:
#line 785 "trule_yg.y"
{
		yyval.ival = INSERT;
		  ;
	break;}
case 39:
#line 791 "trule_yg.y"
{
		yyval.ival = LINK;
		  ;
	break;}
case 40:
#line 799 "trule_yg.y"
{
		yyval.ival = SPREAD;
		  ;
	break;}
case 41:
#line 809 "trule_yg.y"
{
		yyval.ival = FILL_IN;
		  ;
	break;}
case 42:
#line 829 "trule_yg.y"
{
		yyval.ival = COPY;
		  ;
	break;}
case 43:
#line 839 "trule_yg.y"
{
		if ((tmp_tone = find_tone_value_list(yyvsp[-1].cval)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", yyvsp[-1].cval);
		yyval.tival = mktoneid(yyvsp[-2].ival, SINGLE, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=a tone_status TONE tone",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, 0, 0x%x)]",
				yyvsp[-2].ival, (unsigned)tmp_tone);
		  }
		  ;
	break;}
case 44:
#line 858 "trule_yg.y"
{
		if ((tmp_tone = find_tone_value_list(yyvsp[-1].cval)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", yyvsp[-1].cval);
		yyvsp[-3].ival = check_tone_pos(yyvsp[-3].ival);
		yyval.tival = mktoneid(yyvsp[-2].ival, SINGLE, yyvsp[-3].ival, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=a position tone_status TONE tone",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, %d, 0x%x)]",
				yyvsp[-2].ival, yyvsp[-3].ival, (unsigned)tmp_tone);
		  }
		  ;
	break;}
case 45:
#line 884 "trule_yg.y"
{
		yyval.tival = mktoneid(yyvsp[-1].ival, SINGLE, 0, (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=a tone_status tone",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, 0, NULL)]", yyvsp[-1].ival);
		  }
		  ;
	break;}
case 46:
#line 899 "trule_yg.y"
{
		yyvsp[-2].ival = check_tone_pos(yyvsp[-2].ival);
		yyval.tival = mktoneid(yyvsp[-1].ival, SINGLE, yyvsp[-2].ival, (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=a position tone_status tone",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, %d, NULL)]", yyvsp[-1].ival, yyvsp[-2].ival);
		  }
		  ;
	break;}
case 47:
#line 921 "trule_yg.y"
{
		if ((tmp_tone = find_tone_value_list(yyvsp[-1].cval)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", yyvsp[-1].cval);
		yyval.tival = mktoneid(0, SINGLE, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%x\tTone:=a TONE tone",
			   (unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, SINGLE, 0, 0x%x)]",
				(unsigned)tmp_tone);
		  }
		  ;
	break;}
case 48:
#line 939 "trule_yg.y"
{
		if ((tmp_tone = find_tone_value_list(yyvsp[-1].cval)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", yyvsp[-1].cval);
		yyvsp[-2].ival = check_tone_pos(yyvsp[-2].ival);
		yyval.tival = mktoneid(0, SINGLE, yyvsp[-2].ival, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=a position TONE tone",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, SINGLE, %d, 0x%x)]",
				yyvsp[-2].ival, (unsigned)tmp_tone);
		  }
		  ;
	break;}
case 49:
#line 965 "trule_yg.y"
{
		if ((tmp_tone = find_tone_value_list(yyvsp[-1].cval)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", yyvsp[-1].cval);
		yyval.tival = mktoneid(yyvsp[-2].ival, PLURAL, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=tone_status TONE tones",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, 0, 0x%x)]",
				yyvsp[-2].ival, (unsigned)tmp_tone);
		  }
		  ;
	break;}
case 50:
#line 984 "trule_yg.y"
{
		if ((tmp_tone = find_tone_value_list(yyvsp[-1].cval)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", yyvsp[-1].cval);
		yyvsp[-3].ival = check_tone_pos(yyvsp[-3].ival);
		yyval.tival = mktoneid(yyvsp[-2].ival, PLURAL, yyvsp[-3].ival, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=position tone_status TONE tones",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, %d, 0x%x)]",
				yyvsp[-2].ival, yyvsp[-3].ival, (unsigned)tmp_tone);
		  }
		  ;
	break;}
case 51:
#line 1006 "trule_yg.y"
{
		yyval.tival = mktoneid(yyvsp[-1].ival, PLURAL, 0, (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=tone_status tones",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, 0, NULL)]", yyvsp[-1].ival);
		  }
		  ;
	break;}
case 52:
#line 1022 "trule_yg.y"
{
		yyvsp[-2].ival = check_tone_pos(yyvsp[-2].ival);
		yyval.tival = mktoneid(yyvsp[-1].ival, PLURAL, yyvsp[-2].ival, (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=position tone_status tones",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, %d, NULL)]", yyvsp[-1].ival, yyvsp[-2].ival);
		  }
		  ;
	break;}
case 53:
#line 1041 "trule_yg.y"
{
		if ((tmp_tone = find_tone_value_list(yyvsp[-1].cval)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", yyvsp[-1].cval);
		yyval.tival = mktoneid(0, PLURAL, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%x\tTone:=TONE tones",
			   (unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, PLURAL, 0, 0x%x)]",
				(unsigned)tmp_tone);
		  }
		  ;
	break;}
case 54:
#line 1059 "trule_yg.y"
{
		if ((tmp_tone = find_tone_value_list(yyvsp[-1].cval)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", yyvsp[-1].cval);
		yyvsp[-2].ival = check_tone_pos(yyvsp[-2].ival);
		yyval.tival = mktoneid(0, PLURAL, yyvsp[-2].ival, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=position TONE tones",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, SINGLE, %d, 0x%x)]",
				yyvsp[-2].ival, (unsigned)tmp_tone);
		  }
		  ;
	break;}
case 55:
#line 1081 "trule_yg.y"
{
		if ((tmp_tone = find_tone_value_list(yyvsp[-1].cval)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", yyvsp[-1].cval);
		yyval.tival = mktoneid(0, DEFAULT, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=default TONE tone",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, DEFAULT, 0, 0x%x)]",
				(unsigned)tmp_tone);
		  }
		  ;
	break;}
case 56:
#line 1098 "trule_yg.y"
{
		if ((tmp_tone = find_tone_value_list(yyvsp[-1].cval)) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", yyvsp[-1].cval);
		yyvsp[-3].ival = check_tone_pos(yyvsp[-3].ival);
		yyval.tival = mktoneid(0, DEFAULT, yyvsp[-3].ival, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone:=position default TONE tone",
				(unsigned)yyval.tival);
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, DEFAULT, %d, 0x%x)]",
				yyvsp[-3].ival, (unsigned)tmp_tone);
		  }
		  ;
	break;}
case 57:
#line 1125 "trule_yg.y"
{
		yyval.ival = yyvsp[-1].ival + yyvsp[0].ival;
		  ;
	break;}
case 58:
#line 1129 "trule_yg.y"
{
		yyval.ival = yyvsp[0].ival;
		  ;
	break;}
case 59:
#line 1140 "trule_yg.y"
{
		yyval.ival = yyvsp[-1].ival + yyvsp[0].ival;
		  ;
	break;}
case 60:
#line 1144 "trule_yg.y"
{
		yyval.ival = yyvsp[0].ival;
		  ;
	break;}
case 61:
#line 1148 "trule_yg.y"
{
		yyval.ival = yyvsp[0].ival;
		  ;
	break;}
case 62:
#line 1157 "trule_yg.y"
{
		yyval.ival = LEFTWARD;
		  ;
	break;}
case 63:
#line 1161 "trule_yg.y"
{
		yyval.ival = RIGHTWARD;
		  ;
	break;}
case 64:
#line 1171 "trule_yg.y"
{
		yyval.ival = NONITERATIVELY;
		  ;
	break;}
case 65:
#line 1177 "trule_yg.y"
{
		yyval.ival = ITERATIVELY;
		  ;
	break;}
case 66:
#line 1189 "trule_yg.y"
{
		yyval.ival = EDGE_IN;
		  ;
	break;}
case 67:
#line 1209 "trule_yg.y"
{
		yyval.ival = ONE_TO_ONE;
		  ;
	break;}
case 68:
#line 1219 "trule_yg.y"
{
		yyval.ival = yyvsp[-1].ival;
		  ;
	break;}
case 69:
#line 1229 "trule_yg.y"
{
		yyval.ival = FEATURE_ADDING;
		  ;
	break;}
case 70:
#line 1237 "trule_yg.y"
{
		yyval.ival = FEATURE_CHANGING;
		  ;
	break;}
case 71:
#line 1244 "trule_yg.y"
{
		yyval.ival = FEATURE_FILLING;
		  ;
	break;}
case 72:
#line 1254 "trule_yg.y"
{
		yyval.ival = yyvsp[0].ival;
		  ;
	break;}
case 73:
#line 1265 "trule_yg.y"
{
		yyval.ival = OPTIONAL_OCP_BLOCKAGE;
		  ;
	break;}
case 74:
#line 1272 "trule_yg.y"
{
		yyval.ival = OCP_BLOCKAGE;
		  ;
	break;}
case 75:
#line 1279 "trule_yg.y"
{
		yyval.ival = OCP_IGNORED;
		  ;
	break;}
case 76:
#line 1286 "trule_yg.y"
{
		yyval.ival = OCP_MERGER;
		  ;
	break;}
case 77:
#line 1297 "trule_yg.y"
{
		yyval.dival = yyvsp[0].dival;
		yyval.dival->di_edge = yyvsp[-1].ival;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tDomain:=within edge entity", (unsigned)yyval.dival);
			fprintf(pStamp_m->pLogFP, " (set edge = %d)", yyvsp[-1].ival);
		  }
		  ;
	break;}
case 78:
#line 1308 "trule_yg.y"
{
		yyval.dival = yyvsp[0].dival;
		yyval.dival->di_edge = 0;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tDomain:=within entity", (unsigned)yyval.dival);
			fprintf(pStamp_m->pLogFP, " (set edge = 0)");
		  }
		  ;
	break;}
case 79:
#line 1325 "trule_yg.y"
{
		yyval.ival = LEFT_EDGE;
		  ;
	break;}
case 80:
#line 1329 "trule_yg.y"
{
		yyval.ival = RIGHT_EDGE;
		  ;
	break;}
case 81:
#line 1337 "trule_yg.y"
{
		if ((temp = find_tone_domain(yyvsp[-1].cval)) == 0)
		   id_error("domain", yyvsp[-1].cval);
		yyval.dival = mkdomainid(DI_DOMAIN, temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tentity:=DOMAIN domain", (unsigned)yyval.dival);
			fprintf(pStamp_m->pLogFP,
				" [mkdomainid(%d, %d)]", DI_DOMAIN, temp);
		  }
		  ;
	break;}
case 82:
#line 1350 "trule_yg.y"
{
		yyval.dival = mkdomainid(DI_MORPHEME, 0);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tentity:=morpheme", (unsigned)yyval.dival);
			fprintf(pStamp_m->pLogFP,
				" [mkdomainid(%d, 0)]", DI_MORPHEME);
		  }
		  ;
	break;}
case 83:
#line 1361 "trule_yg.y"
{
		yyval.dival = mkdomainid(DI_WORD, 0);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tentity:=word", (unsigned)yyval.dival);
			fprintf(pStamp_m->pLogFP, " [mkdomainid(%d, 0)]", DI_WORD);
		  }
		  ;
	break;}
case 84:
#line 1376 "trule_yg.y"
{
		yyval.cyval = mkcycle(yyvsp[-2].ival, yyvsp[0].dlval);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tCycle:=applies cyclically direction %s",
				(unsigned)yyval.cyval, "within Domain_cycle");
			fprintf(pStamp_m->pLogFP,
				" [mkcycle(%d, 0x%x)]", yyvsp[-2].ival, (unsigned)yyvsp[0].dlval);
		  }
		  ;
	break;}
case 85:
#line 1390 "trule_yg.y"
{
		yyval.cyval = mkcycle(yyvsp[0].ival, (struct domain_list*)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tCycle:=applies cyclically direction",
				(unsigned)yyval.cyval);
			fprintf(pStamp_m->pLogFP, " [mkcycle(%d, NULL)]", yyvsp[0].ival);
		  }
		  ;
	break;}
case 86:
#line 1403 "trule_yg.y"
{
		yyval.cyval = mkcycle(0, yyvsp[0].dlval);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tCycle:=applies cyclically %s",
				(unsigned)yyval.cyval, "within Domain_cycle");
			fprintf(pStamp_m->pLogFP,
				" [mkcycle(0, 0x%x)]", (unsigned)yyvsp[0].dlval);
		  }
		  ;
	break;}
case 87:
#line 1420 "trule_yg.y"
{
		if ((temp = find_tone_domain(yyvsp[-1].cval)) == 0)
		   id_error("domain", yyvsp[-1].cval);
		yyval.dlval = mkdomainlist(temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tDomain_cycle:=DOMAIN domain",(unsigned)yyval.dlval);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
		  }
		  ;
	break;}
case 88:
#line 1432 "trule_yg.y"
{
		yyval.dlval = yyvsp[-1].dlval;
		  ;
	break;}
case 89:
#line 1440 "trule_yg.y"
{
		yyval.dlval = yyvsp[0].dlval;
		  ;
	break;}
case 90:
#line 1444 "trule_yg.y"
{
		yyval.dlval = link_domain_list(yyvsp[-1].dlval, yyvsp[0].dlval);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMulti_domains:=More_domains Two_domains",
				(unsigned)yyval.dlval);
			fprintf(pStamp_m->pLogFP,
				" [link_domain_list(0x%x, 0x%x)]",
				(unsigned)yyvsp[-1].dlval, (unsigned)yyvsp[0].dlval);
		  }
		  ;
	break;}
case 91:
#line 1461 "trule_yg.y"
{
		if ((temp = find_tone_domain(yyvsp[-2].cval)) == 0)
		   id_error("domain", yyvsp[-2].cval);
		if ((temp2 = find_tone_domain(yyvsp[0].cval)) == 0)
		   id_error("domain", yyvsp[0].cval);
		tmp_dl  = mkdomainlist(temp);
		tmp_dl2 = mkdomainlist(temp2);
		yyval.dlval = link_domain_list(tmp_dl, tmp_dl2);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTwo_domains:=DOMAIN and DOMAIN",
				(unsigned)yyval.dlval);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp2);
			fprintf(pStamp_m->pLogFP,
				" [link_domain_list(0x%x, 0x%x)]",
				(unsigned)tmp_dl, (unsigned)tmp_dl2);
		  }
		  ;
	break;}
case 92:
#line 1486 "trule_yg.y"
{
		if ((temp = find_tone_domain(yyvsp[-1].cval)) == 0)
		   id_error("domain", yyvsp[-1].cval);
		tmp_dl = mkdomainlist(temp);
		yyval.dlval = link_domain_list(yyvsp[-2].dlval, tmp_dl);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMore_domains:=More_domains DOMAIN ,",
				(unsigned)yyval.dlval);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
			fprintf(pStamp_m->pLogFP,
				" [link_domain_list(0x%x, 0x%x)]",
				(unsigned)yyvsp[-2].dlval, (unsigned)tmp_dl);
		  }
		  ;
	break;}
case 93:
#line 1503 "trule_yg.y"
{
		if ((temp = find_tone_domain(yyvsp[-1].cval)) == 0)
		   id_error("domain", yyvsp[-1].cval);
		yyval.dlval = mkdomainlist(temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%x\tMore_domains:=DOMAIN ,",
				(unsigned)yyval.dlval);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
		  }
		  ;
	break;}
case 94:
#line 1519 "trule_yg.y"
{
		yyval.cnval = yyvsp[0].cnval;
		  ;
	break;}
case 95:
#line 1528 "trule_yg.y"
{
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tCondition_Body:=Factor [0x%x]",
			  (unsigned)yyval.cnval, (unsigned)yyvsp[0].cnval);
		  ;
	break;}
case 96:
#line 1535 "trule_yg.y"
{
		yyval.cnval = mknode(yyvsp[-1].ival, yyvsp[-2].cnval, yyvsp[0].cnval);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tCondition_Body:=Condition_Body logop %s",
				(unsigned)yyval.cnval, "Factor ");
			fprintf(pStamp_m->pLogFP,
				"[mknode(%d, 0x%x, 0x%x)]", (unsigned)yyvsp[-1].ival,
				(unsigned)yyvsp[-2].cnval, (unsigned)yyvsp[0].cnval);
		  }
		  ;
	break;}
case 97:
#line 1548 "trule_yg.y"
{
		yyval.cnval = mknode( LOGIF, yyvsp[-2].cnval, yyvsp[0].cnval);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tIF factor THEN factor", (unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, "[mknode(%d, 0x%x, 0x%x)]",
				LOGIF, (unsigned)yyvsp[-2].cnval, (unsigned)yyvsp[0].cnval);
		  }
		  ;
	break;}
case 98:
#line 1562 "trule_yg.y"
{
		yyval.cnval = yyvsp[0].cnval;
				yyval.cnval->cn_opcode ^= OP_NOT;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			 "\n0x%x\tFactor:=NOT Factor (set flag for node 0x%x)",
			  (unsigned)yyval.cnval, (unsigned)yyval.cnval);
		  ;
	break;}
case 99:
#line 1572 "trule_yg.y"
{
		yyval.cnval = yyvsp[-1].cnval;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tFactor:='(' Condition_Body ')' [0x%x]",
			  (unsigned)yyval.cnval, (unsigned)yyvsp[-1].cnval);
		  ;
	break;}
case 100:
#line 1580 "trule_yg.y"
{
		yyval.cnval = yyvsp[0].cnval;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tFactor:=Edge_expr [0x%x]",
			  (unsigned)yyval.cnval, (unsigned)yyvsp[0].cnval);
		  ;
	break;}
case 101:
#line 1588 "trule_yg.y"
{
		yyval.cnval = yyvsp[0].cnval;
		if (!(default_tone_params & CYCLIC) &&
			do_morph_expr_check &&
			pStamp_m->pLogFP != NULL)
		  {
			fprintf(pStamp_m->pLogFP, "%s %s %s", tsterrhead, ltname,
			  "morpheme-oriented condition in a non-cyclic rule.");
			fprintf(pStamp_m->pLogFP,
				"\n%19sThe condition will probably not work."," ");
		  }
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tFactor:=Morpheme_expr [0x%x]",
			  (unsigned)yyval.cnval, (unsigned)yyvsp[0].cnval);
		  ;
	break;}
case 102:
#line 1605 "trule_yg.y"
{
		yyval.cnval = yyvsp[0].cnval;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tFactor:=Prosodic_expr [0x%x]",
			  (unsigned)yyval.cnval, (unsigned)yyvsp[0].cnval);
		  ;
	break;}
case 103:
#line 1613 "trule_yg.y"
{
		yyval.cnval = yyvsp[0].cnval;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%x\tFactor:=Segment_expr [0x%x]",
			  (unsigned)yyval.cnval, (unsigned)yyvsp[0].cnval);
		  ;
	break;}
case 104:
#line 1621 "trule_yg.y"
{
		yyval.cnval = yyvsp[0].cnval;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP, "\n0x%x\tFactor:=Tbu_expr [0x%x]",
			 (unsigned)yyval.cnval, (unsigned)yyvsp[0].cnval);
		  ;
	break;}
case 105:
#line 1628 "trule_yg.y"
{
		yyval.cnval = yyvsp[0].cnval;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP, "\n0x%x\tFactor:=Tone_expr [0x%x]",
			 (unsigned)yyval.cnval, (unsigned)yyvsp[0].cnval);
		  ;
	break;}
case 106:
#line 1635 "trule_yg.y"
{
		yyval.cnval = yyvsp[0].cnval;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP, "\n0x%x\tFactor:=Type_expr [0x%x]",
			 (unsigned)yyval.cnval, (unsigned)yyvsp[0].cnval);
		  ;
	break;}
case 107:
#line 1645 "trule_yg.y"
{
		if ((templ = find_edge_cond(yyvsp[0].cval)) == 0L)
		  id_error("edge condition", yyvsp[0].cval);
		yyval.cnval = mklfli(EDGE_COND_IS, 0, templ);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tEdge_expr:=edge condition is EDGE_COND ",
				(unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, "[mklfli(%d, 0, %ld)]",
				EDGE_COND_IS, templ);
		  }
		  ;
	break;}
case 108:
#line 1664 "trule_yg.y"
{
		if ((temp = findAmpleCategoryNumber(yyvsp[0].cval, pStamp_m->pCategories)) == 0)
			id_error("category", yyvsp[0].cval);
		yyval.cnval = mklfi(CATEGORY_IS, yyvsp[-3].ival, temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMorpheme_expr:=position category is %s",
			   (unsigned)yyval.cnval, "CATEGORY");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d \"%s\")]",
				CATEGORY_IS, yyvsp[-3].ival, temp, yyvsp[0].cval);
		  }
		  ;
	break;}
case 109:
#line 1681 "trule_yg.y"
{
		if ((tmp_ccp = findAmpleCategClass(yyvsp[0].cval, pStamp_m->pCategClasses)) ==
											(AmpleCategoryClass *)NULL)
			id_error("category class", yyvsp[0].cval);
		yyval.cnval = mklfcc(CATEGORY_MEMBER, yyvsp[-4].ival, tmp_ccp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMorpheme_expr:=position category is %s",
				(unsigned)yyval.cnval, "member CATEGORY_CLASS ");
			fprintf(pStamp_m->pLogFP,
				"[mklfcc(%d, %d, 0x%x \"%s\")]", CATEGORY_MEMBER,
				yyvsp[-4].ival, (unsigned)tmp_ccp, yyvsp[0].cval);
		  }
		  ;
	break;}
case 110:
#line 1700 "trule_yg.y"
{
		yyval.cnval = mklfs(MORPH_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMorpheme_expr:=position morphname is %s",
				(unsigned)yyval.cnval, "MORPHNAME ");
			fprintf(pStamp_m->pLogFP,
				"[mklfs(%d, %d, \"%s\")]", MORPH_IS, yyvsp[-3].ival, yyvsp[0].cval );
		  }
		  ;
	break;}
case 111:
#line 1714 "trule_yg.y"
{
		if ((tmp_mcp = findAmpleMorphClass(yyvsp[0].cval, pStamp_m->pMorphClasses)) ==
											   (AmpleMorphClass *)NULL)
			id_error("morpheme class", yyvsp[0].cval);
				yyval.cnval = mklfmc(MORPH_MEMBER, yyvsp[-4].ival, tmp_mcp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMorpheme_expr:=position morphname is %s",
				(unsigned)yyval.cnval, "member MORPHCLASS ");
			fprintf(pStamp_m->pLogFP,
				"[mklfmc(%d, %d, 0x%x \"%s\")]", MORPH_MEMBER,
				yyvsp[-4].ival, (unsigned)tmp_mcp, yyvsp[0].cval );
		  }
		  ;
	break;}
case 112:
#line 1733 "trule_yg.y"
{
		if ((tmp_prop = findAmplePropertyNumber(yyvsp[0].cval, &pStamp_m->sProperties)) == 0)
		   id_error("property", yyvsp[0].cval);
		yyval.cnval = mklflg(PROP_IS, yyvsp[-3].ival, tmp_prop);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tMorpheme_expr:=position property is %s",
				(unsigned)yyval.cnval, "PROPERTY ");
			fprintf(pStamp_m->pLogFP,
				"[mklflg(%d, %d, 0x%08x \"%s\")]", PROP_IS, yyvsp[-3].ival,
				tmp_prop, yyvsp[0].cval );
		  }
		  ;
	break;}
case 113:
#line 1753 "trule_yg.y"
{
				yyval.cnval = mklfi(SYLLABLE_HAS, yyvsp[-3].ival, yyvsp[0].ival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tProsodic_expr:=position syllable has %s",
				(unsigned)yyval.cnval, "ONSET/CODA ");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]",
				SYLLABLE_HAS, yyvsp[-3].ival, yyvsp[0].ival);
		  }
		  ;
	break;}
case 114:
#line 1768 "trule_yg.y"
{
				yyval.cnval = mklfi(MORPH_PROSODY, yyvsp[-3].ival, yyvsp[0].ival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tProsodic_expr:=position morpheme is %s",
				(unsigned)yyval.cnval, "PROSODY ");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]",
				MORPH_PROSODY, yyvsp[-3].ival, yyvsp[0].ival);
		  }
		  ;
	break;}
case 115:
#line 1785 "trule_yg.y"
{
		yyval.cnval = mklfs(SEGMENT_IS, yyvsp[-3].ival, duplicateString(yyvsp[0].cval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tSegment_expr:=position segment is %s",
				(unsigned)yyval.cnval, "SEGMENT ");
			fprintf(pStamp_m->pLogFP,
				"[mklfs(%d, %d, \"%s\")]", SEGMENT_IS, yyvsp[-3].ival, yyvsp[0].cval );
		  }
		  ;
	break;}
case 116:
#line 1799 "trule_yg.y"
{
		if ((tmp_scp = findStringClass(yyvsp[0].cval, pStamp_m->pStringClasses))
			== (StringClass *)NULL)
			id_error("string class", yyvsp[0].cval);
				yyval.cnval = mklfsc(SEGMENT_MEMBER, yyvsp[-4].ival, tmp_scp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tSegment_expr:=position segment is %s",
				(unsigned)yyval.cnval, "member STRINGCLASS ");
			fprintf(pStamp_m->pLogFP, "[mklfsc(%d, %d, 0x%x \"%s\")]",
				SEGMENT_MEMBER,
				yyvsp[-4].ival, (unsigned)tmp_scp, yyvsp[0].cval );
		  }
		  ;
	break;}
case 117:
#line 1821 "trule_yg.y"
{
				yyval.cnval = mklfdi(TBU_DOMAIN, yyvsp[-3].ival, yyvsp[0].dival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTbu_expr:=position tbu is DOMAIN ",
				(unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, "[mklfdi(%d, %d, 0x%x)]",
				TBU_DOMAIN, yyvsp[-3].ival,
				(unsigned)yyvsp[0].dival);
		  }
		  ;
	break;}
case 118:
#line 1837 "trule_yg.y"
{
				yyval.cnval = mklfi(TBU_EXTRAMET, yyvsp[-3].ival, 0);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTbu_expr:=position tbu is extrametrical ",
				(unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, 0)]",
				TBU_EXTRAMET, yyvsp[-3].ival);
		  }
		  ;
	break;}
case 119:
#line 1853 "trule_yg.y"
{
				yyval.cnval = mklfti(TBU_HAS, yyvsp[-3].ival, yyvsp[0].tival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTbu_expr:=position tbu has TONE ",
				(unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%x)]",
				TBU_HAS, yyvsp[-3].ival, (unsigned)yyvsp[0].tival);
		  }
		  ;
	break;}
case 120:
#line 1874 "trule_yg.y"
{
		cp = last_id;	        /* get value of the identifier */
		temp = atoi(cp);	/* convert identifier to integer */
					/* check for valid digit sequence */
		while (*cp != NUL)	/* should be digits */
		  {
			if (!isdigit(*cp++) &&
			pStamp_m->pLogFP != NULL)
			  {			/* found a non-digit; report error */
			fprintf(pStamp_m->pLogFP, "%s %s constant %s %s",
				tsterrhead, ltname, last_id,
				   "in tbu expression is not a number.");
			fprintf(pStamp_m->pLogFP,
				"\n%19sWill use the value %d for it", " ",
				temp);
			break;
			  }
		  }
				yyval.cnval = mklfti(TBU_NUMBER, yyvsp[-5].ival, yyvsp[0].tival);
		yyval.cnval->cn_tbu_num = temp;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTbu_expr:=position morpheme tbu NUMBER %s",
			   (unsigned)yyval.cnval, "has TONE ");
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%x)]",
				TBU_NUMBER, yyvsp[-5].ival, (unsigned)yyvsp[-2].cval);
			fprintf(pStamp_m->pLogFP, " and set tbu num = %d]", temp);
		  }
		  ;
	break;}
case 121:
#line 1908 "trule_yg.y"
{
		cp = last_id;	        /* get value of the identifier */
		temp = atoi(cp);	/* convert identifier to integer */
					/* check for valid digit sequence */
		while (*cp != NUL)	/* should be digits */
		  {
			if (!isdigit(*cp++) &&
			pStamp_m->pLogFP != NULL)
			  {			/* found a non-digit; report error */
			fprintf(pStamp_m->pLogFP, "%s %s constant %s %s",
				tsterrhead, ltname, last_id,
				   "in tbu expression is not a number.");
			fprintf(pStamp_m->pLogFP,
				   "\n%19sWill use the value %d for it", " ",temp);
			break;
			  }
		  }
				yyval.cnval = mklfti(TBU_UNDER_NUMBER, yyvsp[-6].ival, yyvsp[0].tival);
		yyval.cnval->cn_tbu_num = temp;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTbu_expr:=position morpheme underlying %s",
			   (unsigned)yyval.cnval, " tbu NUMBER has TONE ");
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%x)]",
				TBU_UNDER_NUMBER, yyvsp[-6].ival,
			   (unsigned)yyvsp[0].tival);
			fprintf(pStamp_m->pLogFP, " and set tbu num = %d]", temp);
		  }
		  ;
	break;}
case 122:
#line 1942 "trule_yg.y"
{
		temp = atoi(yyvsp[-1].cval);	/* convert identifier to integer */
		cp = yyvsp[-1].cval;		/* check for valid digit sequence */
		while (*cp != NUL)	/* should be digits */
		  {
			if (!isdigit(*cp++) &&
			pStamp_m->pLogFP != NULL)
			  {			/* found a non-digit; report error */
			fprintf(pStamp_m->pLogFP, "%s %s constant %s %s",
				tsterrhead, ltname, yyvsp[-1].cval,
				   "in tbu expression is not a number.");
			fprintf(pStamp_m->pLogFP,
				   "\n%19sWill use the value %d for it", " ",temp);
			break;
			  }
		  }
				yyval.cnval = mklfi(MORPH_HAS_N_TBUS, yyvsp[-4].ival, temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTbu_expr:=position morpheme has NUMBER %s",
			   (unsigned)yyval.cnval, "tbus ");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]",
				MORPH_HAS_N_TBUS, yyvsp[-4].ival, temp);
		  }
		  ;
	break;}
case 123:
#line 1974 "trule_yg.y"
{
				yyval.cnval = mklfti(TONE_IS, yyvsp[-3].ival, yyvsp[0].tival);
#ifdef B4_0_4_11
		if ((default_tone_params & CYCLIC) &&
			(yyvsp[-3].ival == ARGCURRENT ||
			 yyvsp[-3].ival == ARGLEFT    ||
			 yyvsp[-3].ival == ARGRIGHT) &&
			pStamp_m->pLogFP != NULL)
		  {
			fprintf(pStamp_m->pLogFP, "%s %s ", tsterrhead, ltname);
			fprintf(pStamp_m->pLogFP,
				"has a '%s tone is' condition in a cyclic rule.",
			   (yyvsp[-3].ival == ARGCURRENT ? "current"
								 : (yyvsp[-3].ival == ARGLEFT ? "left"
												  : "right")));
			fprintf(pStamp_m->pLogFP,
			   "\n%19sThe condition will probably not work.", " ");
		  }
#else
		if ((default_tone_params & CYCLIC) &&
			yyvsp[-3].ival == ARGCURRENT &&
			pStamp_m->pLogFP != NULL)
		  {
			fprintf(pStamp_m->pLogFP, "%s %s ", tsterrhead, ltname);
			fprintf(pStamp_m->pLogFP,
			"has a 'current tone is' condition in a cyclic rule.");
			fprintf(pStamp_m->pLogFP,
			   "\n%19sThe condition will probably not work.", " ");
		  }
#endif /* B4_0_4_11 */
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_expr:=position tone is TONE ",
			   (unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%x)]",
				TONE_IS, yyvsp[-3].ival,
			   (unsigned)yyvsp[0].tival);
		  }
		  ;
	break;}
case 124:
#line 2022 "trule_yg.y"
{
		if (yyvsp[-3].ival != yyvsp[0].tival->ti_status &&
			pStamp_m->pLogFP != NULL)
		  {
			fprintf(pStamp_m->pLogFP,
			   "%s %s tone status inconsistency (%s is not %s) %s",
			   tsterrhead, ltname, tone_type_name(yyvsp[-3].ival),
			   tone_type_name(yyvsp[0].tival->ti_status),
				   "in 'pos tone_status tone is TONE' condition.");
			fprintf(pStamp_m->pLogFP,
				"\n%19sWill use %s for both.", " ",
				tone_type_name(yyvsp[0].tival->ti_status));
		  }
				yyval.cnval = mklfti(TONESTATUS_TONE_IS, yyvsp[-4].ival, yyvsp[0].tival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTone_expr:=position tonestatus tone is %s",
			   (unsigned)yyval.cnval, "TONE");
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%x)]",
				TONESTATUS_TONE_IS, yyvsp[-4].ival,
			   (unsigned)yyvsp[0].tival);
		  }
		  ;
	break;}
case 125:
#line 2066 "trule_yg.y"
{
				yyval.cnval = mklfti(MORPH_TONE_IS, yyvsp[-4].ival, yyvsp[0].tival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTone_expr:=position morpheme tone is TONE",
			   (unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%x)]",
				MORPH_TONE_IS, yyvsp[-4].ival,
			   (unsigned)yyvsp[0].tival);
		  }
		  ;
	break;}
case 126:
#line 2081 "trule_yg.y"
{
				yyval.cnval = mklfti(MORPH_UL_TONE_IS, yyvsp[-5].ival, yyvsp[0].tival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_expr:=position morpheme underlying ",
				(unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, "tone is TONE");
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%x)]",
				MORPH_UL_TONE_IS, yyvsp[-5].ival,
			   (unsigned)yyvsp[0].tival);
		  }
		  ;
	break;}
case 127:
#line 2097 "trule_yg.y"
{
				yyval.cnval = mklftp(TONE_PATTERN_IS, yyvsp[-4].ival, yyvsp[0].tpval);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_expr:=position tone pattern is %s",
				(unsigned)yyval.cnval, "TONEPATTERN ");
			fprintf(pStamp_m->pLogFP,
				"[mklftp(%d, %d, 0x%x)]", TONE_PATTERN_IS, yyvsp[-4].ival,
				(unsigned)yyvsp[0].tpval);
		  }
		  ;
	break;}
case 128:
#line 2115 "trule_yg.y"
{
				yyval.cnval = mklftp(MORPH_TONE_PAT_IS, yyvsp[-5].ival, yyvsp[0].tpval);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%x\tTone_expr:=position morpheme tone pattern",
			   (unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, "is TONEPATTERN");
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%x)]",
				MORPH_TONE_PAT_IS, yyvsp[-5].ival,
			   (unsigned)yyvsp[-1].ival);
		  }
		  ;
	break;}
case 129:
#line 2131 "trule_yg.y"
{
				yyval.cnval = mklftp(MORPH_UL_TONE_PAT_IS, yyvsp[-6].ival, yyvsp[0].tpval);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_expr:=position morpheme underlying ",
			   (unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, "tone pattern is TONEPATTERN ");
			fprintf(pStamp_m->pLogFP,
				"[mklftp(%d, %d, 0x%x)]", MORPH_UL_TONE_PAT_IS, yyvsp[-6].ival,
			   (unsigned)yyvsp[0].tpval);
		  }
		  ;
	break;}
case 130:
#line 2148 "trule_yg.y"
{
				yyval.cnval = mklftp(WORD_TONE_IS, yyvsp[-4].ival, yyvsp[0].tpval);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_expr:=word tone pattern is %s",
			   (unsigned)yyval.cnval, "TONEPATTERN ");
			fprintf(pStamp_m->pLogFP, "[mklftp(%d, %d, 0x%x)]",
				WORD_TONE_IS, yyvsp[-4].ival,
			   (unsigned)yyvsp[0].tpval);
		  }
		  ;
	break;}
case 131:
#line 2166 "trule_yg.y"
{
				yyval.cnval = mklfi(TYPE_IS, yyvsp[-3].ival, yyvsp[0].ival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tType_expr:=position type is TYPE ",
				(unsigned)yyval.cnval);
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]", TYPE_IS,
				yyvsp[-3].ival, yyvsp[0].ival);
		  }
		  ;
	break;}
case 132:
#line 2185 "trule_yg.y"
{
				yyval.tival = yyvsp[0].tival;
		  ;
	break;}
case 133:
#line 2189 "trule_yg.y"
{
				yyval.tival = (struct tone_id *)NULL;
		  ;
	break;}
case 134:
#line 2197 "trule_yg.y"
{
				yyval.tpval = yyvsp[0].tpval;
		  ;
	break;}
case 135:
#line 2201 "trule_yg.y"
{
				yyval.tpval = (struct tone_pattern *)NULL;
		  ;
	break;}
case 136:
#line 2210 "trule_yg.y"
{
				tmp_tp = mktonepattern(yyvsp[0].tival);
		yyval.tpval = link_tone_pattern(yyvsp[-1].tpval, tmp_tp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%x\tTone_Pat:=Tone_Pat Tone ",
			   (unsigned)yyval.tpval);
			fprintf(pStamp_m->pLogFP, "[mktonepattern(0x%x)]",
				(unsigned)yyvsp[0].tival);
			fprintf(pStamp_m->pLogFP,"[link_tone_pattern(0x%x, 0x%x)]",
			   (unsigned)yyvsp[-1].tpval, (unsigned)tmp_tp);
		  }
		  ;
	break;}
case 137:
#line 2225 "trule_yg.y"
{
				yyval.tpval = mktonepattern(yyvsp[0].tival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%x\tTone_Pattern:=Tone ",
			   (unsigned)yyval.tpval);
			fprintf(pStamp_m->pLogFP, "[mktonepattern(0x%x)]",
				(unsigned)yyvsp[0].tival);
		  }
		  ;
	break;}
case 138:
#line 2239 "trule_yg.y"
{
		yyval.ival = ONSET;
		  ;
	break;}
case 139:
#line 2244 "trule_yg.y"
{
		yyval.ival = CODA;
		  ;
	break;}
case 140:
#line 2252 "trule_yg.y"
{
		yyval.ival = MONOSYLLABIC;
		  ;
	break;}
case 141:
#line 2257 "trule_yg.y"
{
		yyval.ival = DISYLLABIC;
		  ;
	break;}
case 142:
#line 2262 "trule_yg.y"
{
		yyval.ival = TRISYLLABIC;
		  ;
	break;}
case 143:
#line 2267 "trule_yg.y"
{
		yyval.ival = QUADRISYLLABIC;
		  ;
	break;}
case 144:
#line 2272 "trule_yg.y"
{
		yyval.ival = POLYSYLLABIC;
		  ;
	break;}
case 145:
#line 2277 "trule_yg.y"
{
		yyval.ival = MONOMORAIC;
		  ;
	break;}
case 146:
#line 2282 "trule_yg.y"
{
		yyval.ival = BIMORAIC;
		  ;
	break;}
case 147:
#line 2290 "trule_yg.y"
{
		yyval.ival = LOGAND;
		  ;
	break;}
case 148:
#line 2295 "trule_yg.y"
{
		yyval.ival = LOGIFF;
		  ;
	break;}
case 149:
#line 2300 "trule_yg.y"
{
		yyval.ival = LOGOR;
		  ;
	break;}
case 150:
#line 2305 "trule_yg.y"
{
		yyval.ival = LOGXOR;
		  ;
	break;}
case 151:
#line 2314 "trule_yg.y"
{
		yyval.ival = ARGCURRENT;
		  ;
	break;}
case 152:
#line 2319 "trule_yg.y"
{
		yyval.ival = ARGLEFT;
		  ;
	break;}
case 153:
#line 2324 "trule_yg.y"
{
		yyval.ival = ARGLEFTTWO;
		  ;
	break;}
case 154:
#line 2330 "trule_yg.y"
{
		yyval.ival = ARGRIGHT;
		  ;
	break;}
case 155:
#line 2335 "trule_yg.y"
{
		yyval.ival = ARGRIGHTTWO;
		  ;
	break;}
case 156:
#line 2341 "trule_yg.y"
{
		yyval.ival = INITIALM;
		  ;
	break;}
case 157:
#line 2346 "trule_yg.y"
{
		yyval.ival = WINITIAL;
		  ;
	break;}
case 158:
#line 2351 "trule_yg.y"
{
		yyval.ival = FINALM;
		  ;
	break;}
case 159:
#line 2356 "trule_yg.y"
{
		yyval.ival = WFINAL;
		  ;
	break;}
case 160:
#line 2364 "trule_yg.y"
{
		if ((yyval.ival = Boundary) == 0)
		  id_error("tone_status", "boundary");
		  ;
	break;}
case 161:
#line 2372 "trule_yg.y"
{
		if ((yyval.ival = Delinked) == 0)
		   id_error("tone_status", "delinked");
		  ;
	break;}
case 162:
#line 2378 "trule_yg.y"
{
		if ((yyval.ival = Floating) == 0)
		  id_error("tone_status", "floating");
		  ;
	break;}
case 163:
#line 2385 "trule_yg.y"
{
		if ((yyval.ival = LeftFloating) == 0)
		  id_error("tone_status", "left-floating");
		  ;
	break;}
case 164:
#line 2392 "trule_yg.y"
{
		if ((yyval.ival = Linked) == 0)
		   id_error("tone_status", "linked");
		  ;
	break;}
case 165:
#line 2398 "trule_yg.y"
{
		if ((yyval.ival = Melody) == 0)
		  id_error("tone_status", "melody");
		  ;
	break;}
case 166:
#line 2404 "trule_yg.y"
{
		if ((yyval.ival = RightFloating) == 0)
		  id_error("tone_status", "right-floating");
		  ;
	break;}
case 167:
#line 2414 "trule_yg.y"
{
		yyval.ival = PFX;
		  ;
	break;}
case 168:
#line 2418 "trule_yg.y"
{
		yyval.ival = IFX;
		  ;
	break;}
case 169:
#line 2422 "trule_yg.y"
{
		yyval.ival = ROOT;
		  ;
	break;}
case 170:
#line 2426 "trule_yg.y"
{
		yyval.ival = SFX;
		  ;
	break;}
case 171:
#line 2430 "trule_yg.y"
{
		yyval.ival = WINITIAL;
		  ;
	break;}
case 172:
#line 2434 "trule_yg.y"
{
		yyval.ival = WFINAL;
		  ;
	break;}
case 173:
#line 2441 "trule_yg.y"
{
		yyval.ival = 0;
		  ;
	break;}
case 174:
#line 2445 "trule_yg.y"
{
		yyval.ival = 0;
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
#line 2458 "trule_yg.y"


/*****************************************************************
 * NAME
 *    check_tone_pos
 * ARGUMENTS:
 *    pos = morpheme position
 * DESCRIPTION
 *    Determine if morpheme position is reasonable for a tone operation.
 *    Correct it if not along with a warning message.
 * RETURN VALUE
 *    (possibly corrected) morpheme position
 */
static int check_tone_pos(pos)
	 int pos;
{
  switch(pos)
	{
	case LX_CURRENT:		/* these are all fine */
	case LX_LEFT:
	case LX_LEFTTWO:
	case LX_RIGHT:
	case LX_RIGHTTWO:
	  break;
	case LX_PINITIAL:
	case LX_INITIAL:
	  pos = LX_LEFT;
	  if (pStamp_m->pLogFP != NULL)
	{
	  fprintf(pStamp_m->pLogFP,
		  "%s WARNING: using left position instead of %s in tone action",
		  tsterrhead, (pos == LX_PINITIAL) ? "PINITIAL" : "initial");
	  fprintf(pStamp_m->pLogFP, "\n\t\t\tportion of %s", ltname );
	}
	  break;
	case LX_PFINAL:
	case LX_FINAL:
	  pos = LX_RIGHT;
	  if (pStamp_m->pLogFP != NULL)
	{
	  fprintf(pStamp_m->pLogFP,
		  "%s WARNING: using right position instead of %s in tone action",
		  tsterrhead, (pos == LX_PFINAL) ? "PFINAL" : "final");
	  fprintf(pStamp_m->pLogFP, "\n\t\t\tportion of %s", ltname );
	}
	  break;
	}
  return(pos);

} /* end check_tone_pos */

/*****************************************************************
 * NAME
 *    get_default_cycle
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Return pointer to default cycle struct
 * RETURN VALUE
 *    pointer to the cycle struct
 */
struct cycle *get_default_cycle()
{
  return(default_cycle);

} /* end get_default_cycle */

/*****************************************************************
 * NAME
 *    get_edge_cond_rule_head
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Return pointer to head of linked list of tone_rule structs which
 *    are all edge conditions
 * RETURN VALUE
 *    pointer to the head of the list
 */
struct tone_rule *get_edge_cond_rule_head()
{
  return(Erule_head);

} /* end get_edge_cond_rule_head */

/*****************************************************************
 * NAME
 *    parseToneRule
 * ARGUMENTS:
 *    cp   - pointer to text of the rule
 *    type - type of tone rule: edge condition, edge rule, or tone rule
 * DESCRIPTION
 *    Call yyparse() and process the result
 * RETURN VALUE
 *    NONE
 */
void parseToneRule(cp, type, pStamp_in)
	 char *cp;
	 int type;
	 StampData *pStamp_in;
{
				/* initialize */
  trule = (struct tone_rule *)NULL;

  default_tone_params = CLEAR_RULE_TYPE(default_tone_params);

  do_morph_expr_check = TRUE;
				/* set error message */
  switch (type)
	{
	case DEFAULT_RULE:
	  tsterrhead = "\nDEFAULT_RULE";
	  default_tone_params |= DEFAULT_RULE;
	  ltname = "a default setting rule"; /* is this needed? */
	  do_morph_expr_check = FALSE;
	  break;

	case EDGE_CONDITION:
	  tsterrhead = "\nEDGE_CONDITION";
	  default_tone_params |= EDGE_CONDITION;
	  do_morph_expr_check = FALSE;
	  break;

	case EDGE_RULE:
	  tsterrhead = "\nEDGE_RULE";
	  default_tone_params |= EDGE_RULE;
	  break;

	case RIGHT_EDGE_RULE:
	  tsterrhead = "\nRIGHT_EDGE_RULE";
	  default_tone_params |= RIGHT_EDGE_RULE;
	  break;

	default:
	case TONE_RULE:
	  tsterrhead = "\nTONE_RULE";
	  default_tone_params |= TONE_RULE;
	  break;
	}
  if (rule_debug)
	{
	  fprintf(pStamp_m->pLogFP, "\n\nWorking on:");
	  fprintf(pStamp_m->pLogFP, "%s: %s", tsterrhead, cp);
	}
				/* go parse the input */
  rpp = cp;			/* set up for lexical input */
  pStamp_m = pStamp_in;
  if (yyparse())
	{                           /* show where parse failed in the test */
	  if (pStamp_m->pLogFP != NULL)
	{
	  if (*lexp)
		{
		  fprintf(pStamp_m->pLogFP, "\n%s <<ERROR DETECTED HERE>>", lexp );
		  fprintf(pStamp_m->pLogFP, " %s", (lexp + strlen(lexp) +1));
		}
	  else
		fprintf(pStamp_m->pLogFP,
		"\n%s <<ERROR DETECTED AT THE END; Possible missing paren>>",
		cp);
	}
				/* now skip the rest of the input by */
				/* repeatedly calling yylex */
	  while (YYLEX > 0)
	;
	}
  else
	{
				/* process the result */
	  switch (type)
	{
	case DEFAULT_RULE:
				/* nothing to do */
	  break;

	case EDGE_CONDITION:
	  if (trule != (struct tone_rule *)NULL &&
		  trule->tr_action != (struct action *)NULL &&
		  trule->tr_action->ac_op != SET_EDGE_COND)
		{
		  if (pStamp_m->pLogFP != NULL)
		{
		  fprintf(pStamp_m->pLogFP,
		   "\n%s: expected edge condition and got regular rule in %s.",
			  tsterrhead, ltname);
		  fprintf(pStamp_m->pLogFP, "\n\t\tWill ignore this rule!");
		}
		}
	  else
		{
				/* add rule to list */
		  Erule_head = link_tone_rule(Erule_head, trule);
		}
	  break;

	default:
	case EDGE_RULE:
	case RIGHT_EDGE_RULE:
	case TONE_RULE:
				/* add rule to list */
	  Trule_head = link_tone_rule(Trule_head, trule);
	  break;
	}
	}

} /* end parseToneRule */

/*****************************************************************
 * NAME
 *    get_tone_rule_head
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Return pointer to head of linked list of tone_rule structs
 * RETURN VALUE
 *    pointer to the head of the list
 */
struct tone_rule *get_tone_rule_head()
{
  return(Trule_head);

} /* end get_tone_rule_head */

/*****************************************************************
 * NAME
 *    get_tone_rule_tail
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Return pointer to tail of linked list of tone_rule structs
 * RETURN VALUE
 *    pointer to the tail of the list
 */
struct tone_rule *get_tone_rule_tail()
{
  struct tone_rule *trp;

  for (trp = Trule_head;
	   trp != (struct tone_rule *)NULL &&
	   trp->tr_right != (struct tone_rule *)NULL;
	   trp = trp->tr_right)
	;

  return(trp);

} /* end get_tone_rule_head */

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
	fprintf(pStamp_m->pLogFP, "%s Undefined %s %s in %s", tsterrhead,
		expected, found, ltname );
} /* end id_error */

/*****************************************************************
 * NAME
 *    init_tone_rule
 * ARGUMENTS:
 *    rd = rule debug flag
 * DESCRIPTION
 *    Initialize local statics
 * RETURN VALUE
 *    NONE
 */
void init_tone_rule(rd, pStamp_in)
	 int   rd;
	 StampData *pStamp_in;
{
  pStamp_m = pStamp_in;
  if (pStamp_in->pLogFP == NULL)
	rule_debug = FALSE;
  else
	rule_debug = rd;

} /* end init_tone_rule */

/*****************************************************************
 * NAME
 *    init_tone_rule_stats
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Initialize tone rule statistics
 * RETURN VALUE
 *    NONE
 */
void init_tone_rule_stats()
{
  struct tone_rule *tp;

  for (tp = Trule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	tp->tr_tried = tp->tr_applied = 0L;

  for (tp = Erule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	tp->tr_tried = tp->tr_applied = 0L;


} /* end init_tone_rule_stats */

/*****************************************************************
 * NAME
 *    link_action
 * ARGUMENTS:
 *    ac_head = pointer to head of action list
 *    ac_new  = pointer to action struct to be linked to end of list
 * DESCRIPTION
 *    Append an action struct to a linked list of action structs
 * RETURN VALUE
 *    pointer to the head of the list
 */
static struct action *link_action(ac_head, ac_new)
	 struct action    *ac_head;
	 struct action    *ac_new;
{
  register struct action *ac;

				/* find end of list */
  for (ac = ac_head;
	   ac != (struct action *)NULL &&
	   ac->ac_next != (struct action *)NULL;
	   ac = ac->ac_next)
	;
				/* insert new */
  if (ac == (struct action *)NULL)
	ac_head = ac_new;		/* should never happen, but... */
  else
	ac->ac_next = ac_new;

  return(ac_head);

} /* end link_action */

/*****************************************************************
 * NAME
 *    link_domain_list
 * ARGUMENTS:
 *    dl_head = pointer to head of domain_list list
 *    dl_new  = pointer to domain_list struct to be linked to end of list
 * DESCRIPTION
 *    Append a domain_list struct to a linked list of domain_list structs
 * RETURN VALUE
 *    pointer to the head of the list
 */
static struct domain_list *link_domain_list(dl_head, dl_new)
	 struct domain_list    *dl_head;
	 struct domain_list    *dl_new;
{
  register struct domain_list *dl;

				/* find end of list */
  for (dl = dl_head;
	   dl != (struct domain_list *)NULL &&
	   dl->dl_next != (struct domain_list *)NULL;
	   dl = dl->dl_next)
	;
				/* insert new */
  if (dl == (struct domain_list *)NULL)
	dl_head = dl_new;		/* should never happen, but... */
  else
	dl->dl_next = dl_new;

  return(dl_head);

} /* end link_domain_list */

/*****************************************************************
 * NAME
 *    link_tone_pattern
 * ARGUMENTS:
 *    tp_head = pointer to head of tone_pattern list
 *    tp_new  = pointer to tone_pattern struct to be linked to end of list
 * DESCRIPTION
 *    Append a tone_pattern struct to a linked list of tone_pattern structs
 * RETURN VALUE
 *    pointer to the head of the list
 */
static struct tone_pattern *link_tone_pattern(tp_head, tp_new)
	 struct tone_pattern    *tp_head;
	 struct tone_pattern    *tp_new;
{
  register struct tone_pattern *tp;

				/* find end of list */
  for (tp = tp_head;
	   tp != (struct tone_pattern *)NULL &&
	   tp->tp_next != (struct tone_pattern *)NULL;
	   tp = tp->tp_next)
	;
				/* insert new */
  if (tp == (struct tone_pattern *)NULL)
	tp_head = tp_new;		/* should never happen, but... */
  else
	tp->tp_next = tp_new;

  return(tp_head);

} /* end link_tone_pattern */

/*****************************************************************
 * NAME
 *    link_tone_rule
 * ARGUMENTS:
 *    tp_head = pointer to head of tone_rule list
 *    tp_new  = pointer to tone_rule struct to be linked to end of list
 * DESCRIPTION
 *    Append a tone_rule struct to a linked list of tone_rule structs
 * RETURN VALUE
 *    pointer to the head of the list
 */
static struct tone_rule *link_tone_rule(tp_head, tp_new)
	 struct tone_rule    *tp_head;
	 struct tone_rule    *tp_new;
{
  register struct tone_rule *tp;

				/* find end of list */
  for (tp = tp_head;
	   tp != (struct tone_rule *)NULL &&
	   tp->tr_right != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	;
				/* insert new */
  if (tp == (struct tone_rule *)NULL)
	tp_head = tp_new;
  else
	{
	  tp->tr_right = tp_new;
	  tp->tr_left  = tp;
	}

  return(tp_head);

} /* end link_tone_rule */

/*****************************************************************
 * NAME
 *    mkaction
 * ARGUMENTS:
 *    op    = operation
 *    tip   = pointer to tone_id    struct
 *    dim   = direction, iteration, mode values
 *    ocp   = OCP flag
 *    dip   = pointer to domain_id struct
 *    econd = edge condition
 * DESCRIPTION
 *    Create an action struct and set it's operation, tone, params, and domain
 * RETURN VALUE
 *    pointer to the action structure
 */
static struct action *mkaction(op, tip, dim, ocp, dip, econd)
	 int               op;
	 struct tone_id   *tip;
	 int               dim;
	 int               ocp;
	 struct domain_id *dip;
	 long              econd;
{
  register struct action *acp;
  register int            params;

				/* allocate an action struct */
  acp = structalloc( action );
				/* initialize its link */
  acp->ac_next = (struct action *)NULL;

				/* set values without explicit defaults */
  acp->ac_op     = op;
  acp->ac_tone   = tip;

				/* force a linked status for SPREAD */
  if (op == SPREAD &&
	  acp->ac_tone != (struct tone_id *)NULL)
	acp->ac_tone->ti_status = Linked;


  if (op == SET_EDGE_COND)
	{
	  acp->ac_econds = econd;
	  acp->ac_params = 0;
	}
  else
	{
	  acp->ac_econds = 0L;
				/* check for defaults */
	  if (dip == (struct domain_id *)NULL)
	acp->ac_domain = default_domain;
	  else
	acp->ac_domain = dip;
				/* set parameters */
	  params = dim + ocp;
	  if (!DIRECTION(params))
	acp->ac_params += DIRECTION(default_action_params);
	  else
	acp->ac_params += DIRECTION(params);
	  if (!ITERATION(params))
	acp->ac_params += ITERATION(default_action_params);
	  else
	acp->ac_params += ITERATION(params);
	  if (!MODE(params))
	acp->ac_params += MODE(default_action_params);
	  else
	acp->ac_params += MODE(params);
	  if (!OCP(params))
	acp->ac_params += OCP(default_action_params);
	  else
	acp->ac_params += OCP(params);
	}

  return(acp);

} /* end mkaction */

/*****************************************************************
 * NAME
 *    mkcycle
 * ARGUMENTS:
 *    dir     = direction flag
 *    domains = head of linked list of domain_list structs
 * DESCRIPTION
 *    Create a cycle struct and set it's direction and domain list
 * RETURN VALUE
 *    pointer to the cycle structure
 */
static struct cycle *mkcycle(dir, domains)
	 int                 dir;
	 struct domain_list *domains;
{
  register struct cycle *cp;

				/* allocate a cycle struct */
  cp = structalloc( cycle );

				/* set values */
  cp->cy_dir    = dir;
  cp->cy_domain = domains;

  return(cp);

} /* end mkcycle */

/*****************************************************************
 * NAME
 *    mkdomainid
 * ARGUMENTS:
 *    type   = type of entity (domain or morpheme)
 *    domain = domain value if type is domain
 * DESCRIPTION
 *    Create a domain_id struct and set it's type and domain
 * RETURN VALUE
 *    pointer to the domain_id structure
 */
static struct domain_id *mkdomainid(type, domain)
	 int type;
	 int domain;
{
  register struct domain_id *dip;

				/* allocate a domain_id struct */
  dip = structalloc( domain_id );

				/* set values */
  dip->di_edge   = 0;
  dip->di_type   = type;
  dip->di_domain = domain;

  return(dip);

} /* end mkdomainid */

/*****************************************************************
 * NAME
 *    mkdomainlist
 * ARGUMENTS:
 *    domain = domain value
 * DESCRIPTION
 *    Create a domain_list struct and set it's domain
 * RETURN VALUE
 *    pointer to the domain_list structure
 */
static struct domain_list *mkdomainlist(domain)
	 int domain;
{
  register struct domain_list *dlp;

				/* allocate a domain_list struct */
  dlp = structalloc( domain_list );

				/* set values */
  dlp->dl_domain = domain;
  dlp->dl_next   = (struct domain_list *)NULL;

  return(dlp);

} /* end mkdomainlist */

/*****************************************************************
 * NAME
 *    mklfcc
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to category class for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a category class in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfcc(opcode, left, right)
	 int               opcode;
	 int               left;
	 AmpleCategoryClass *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_ccp  = right;		/* store the category class pointer */

  return(cp);

} /* end mklfcc */

/*****************************************************************
 * NAME
 *    mklfdi
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to domain_id struct for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a domain_id struct in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfdi(opcode, left, right)
	 int               opcode;
	 int               left;
	 struct domain_id *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_dip  = right;		/* store the domain_id pointer */

  return(cp);

} /* end mklfdi */

/*****************************************************************
 * NAME
 *    mklfi
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = integer value stored for right argument
 * DESCRIPTION
 *    Create a leaf node using an integer value in the condition parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfi(opcode, left, right)
	 int opcode;
	 int left;
	 int right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos = left;			/* store the left morpheme position */
  cp->cr.r_int = right;			/* store the integer value */

  return(cp);

} /* end mklfi */

/*****************************************************************
 * NAME
 *    mklflg
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = value for property
 * DESCRIPTION
 *    Create a leaf node pointing to a property in the condition  parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklflg(opcode, left, right)
	 int           opcode;
	 int           left;
	 unsigned short right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;                 /* store the left morpheme position */
					/* store the allomorph property */
  cp->cr.r_prop = (unsigned short *) allocMemory(sizeof(unsigned short));
  *(cp->cr.r_prop) = right;

  return(cp);

} /* end mklflg */

/*****************************************************************
 * NAME
 *    mklfli
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = integer value stored for right argument
 * DESCRIPTION
 *    Create a leaf node using a long integer value in the condition
 *    parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfli(opcode, left, right)
	 int opcode;
	 int left;
	 long right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_long = right;		/* store the long integer value */

  return(cp);

} /* end mklfli */

/*****************************************************************
 * NAME
 *    mklfmc
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to morpheme class for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a morpheme class in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfmc(opcode, left, right)
	 int                 opcode;
	 int                 left;
	 AmpleMorphClass *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
					/* store the morpheme class pointer */
  cp->cr.r_mcp  = (StringClass *)right;

  return(cp);

} /* end mklfmc */

/*****************************************************************
 * NAME
 *    mklfs
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to character string for right argument
 * DESCRIPTION
 *    Create a leaf node storing a string value in the condition parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfs(opcode, left, right)
	 int   opcode;
	 int   left;
	 char *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode   = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos    = left;		/* store the left morpheme position */
  cp->cr.r_string = right;		/* store the integer value */

  return(cp);

} /* end mklfs */

/*****************************************************************
 * NAME
 *    mklfsc
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to string class for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a string class in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfsc(opcode, left, right)
	 int                  opcode;
	 int                  left;
	 StringClass         *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_scp  = right;		/* store the string class pointer */

  return(cp);

} /* end mklfsc */

/*****************************************************************
 * NAME
 *    mklfti
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to tone_id struct for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a tone_id struct in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklfti(opcode, left, right)
	 int             opcode;
	 int             left;
	 struct tone_id *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_tip  = right;		/* store the tone_id pointer */

  return(cp);

} /* end mklfti */

/*****************************************************************
 * NAME
 *    mklftp
 * ARGUMENTS
 *    opcode = kind of node
 *    left   = position code for left argument
 *    right  = pointer to tone_pattern struct for right argument
 * DESCRIPTION
 *    Create a leaf node pointing to a tone_pattern struct in the condition
 *		parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
static struct cond_node *mklftp(opcode, left, right)
	 int                  opcode;
	 int                  left;
	 struct tone_pattern *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* store the opcode */
  cp->cl.l_pos  = left;			/* store the left morpheme position */
  cp->cr.r_tpip = right;		/* store the tone_id pointer */

  return(cp);

} /* end mklftp */

/*****************************************************************
 * NAME
 *    mknode
 * ARGUMENTS:
 *    opcode = kind of node
 *    left   = left child of this node
 *    right  = right child of this node
 * DESCRIPTION
 *    Create a node in the conditions parse tree
 * RETURN VALUE
 *    pointer to the cond_node structure
 */
static struct cond_node *mknode(opcode, left, right )
	 int               opcode;
	 struct cond_node *left;
	 struct cond_node *right;
{
  register struct cond_node *cp;

  cp = structalloc( cond_node );
  cp->cn_opcode = opcode & OP_MASK;	/* save the op code */
  cp->cl.l_son = left;			/* save the left subtree */
  cp->cr.r_son = right;			/* save the right subtree */

  return(cp);

} /* end mknode */

/*****************************************************************
 * NAME
 *    mkrule
 * ARGUMENTS:
 *    action    = pointer to action    struct
 *    cycle     = pointer to cycle     struct
 *    condition = pointer to cond_node struct
 * DESCRIPTION
 *    Create a tone_rule struct and set it's action, cycle, and condition
 * RETURN VALUE
 *    pointer to the tone_rule structure
 */
static struct tone_rule *mkrule(action, cycle, condition)
	 struct action    *action;
	 struct cycle     *cycle;
	 struct cond_node *condition;
{
  register struct tone_rule *tp;
  tp = structalloc( tone_rule );
				/* initialize */
  tp->tr_name     = (char *)NULL;
  tp->tr_params   = default_tone_params;

  tp->tr_action = action;
  tp->tr_cond   = condition;
  tp->tr_cycle  = cycle;

  tp->tr_right = tp->tr_left = (struct tone_rule *)NULL;

  return(tp);

} /* end mkrule */

/*****************************************************************
 * NAME
 *    mktoneid
 * ARGUMENTS:
 *    status  = tone status (linked, floating, etc.)
 *    params  = parameters (single/plural, default)
 *    pos     = morpheme position (unspecified, current, left, right)
 *    tvlp    = pointer to a tone_value_list struct
 * DESCRIPTION
 *    Create a tone_id struct and set it's status, params, and value
 * RETURN VALUE
 *    pointer to the tone_id structure
 */
static struct tone_id *mktoneid(status, params, pos, tvlp)
	 int                     status;
	 int                     params;
	 int                     pos;
	 struct tone_value_list *tvlp;
{
  register struct tone_id *tip;

  tip            = structalloc( tone_id );
  tip->ti_status = status;
  tip->ti_params = params;
  tip->ti_pos    = pos;
  tip->ti_value  = tvlp;

  return(tip);

} /* end mktoneid */

/*****************************************************************
 * NAME
 *    mktonepattern
 * ARGUMENTS:
 *    toneid  = pointer to a tone_id struct
 * DESCRIPTION
 *    Create a tone_pattern struct and set it's tone_id
 * RETURN VALUE
 *    pointer to the tone_pattern structure
 */
static struct tone_pattern *mktonepattern(toneid)
	 struct tone_id *toneid;
{
  register struct tone_pattern *tpp;

  tpp            = structalloc( tone_pattern );
  tpp->tp_tone = toneid;

  return(tpp);

} /* end mktonepattern */

/*****************************************************************
 * NAME
 *    set_tone_cycle
 * ARGUMENTS:
 *    cycle = true or false
 * DESCRIPTION
 *    Set default tone cycle parameter to cycle
 * RETURN VALUE
 *    NONE
 */
void set_tone_cycle(cycle)
	 int cycle;
{

  if (cycle)
	default_tone_params |= CYCLIC;
  else
	default_tone_params &= NONCYCLIC;

} /* end set_tone_cycle */

/*****************************************************************
 * NAME
 *    show_domain_id
 * ARGUMENTS:
 *    dp - pointer to a domain_id structure
 * DESCRIPTION
 *    Show a domain_id
 * RETURN VALUE
 *    NONE
 */
static void show_domain_id(dp)
	 struct domain_id *dp;
{

  if (dp == (struct domain_id*)NULL ||
	  pStamp_m->pLogFP == NULL)
	return;

  switch (dp->di_edge)
	{
	case LEFT_EDGE:
	  cp = "at left edge of";
	  break;

	case RIGHT_EDGE:
	  cp = "at right edge of";
	  break;

	case 0:
	  cp = "within";
	  break;

	default:
	  cp = "Unknown domain edge!  Program error!";
	  break;
	}
  fprintf(pStamp_m->pLogFP, "\n\t\t%s", cp);

  if (dp->di_type == DI_MORPHEME)
	cp = "morpheme";
  else if (dp->di_type == DI_DOMAIN)
	cp = tone_domain_name(dp->di_domain);
  else
	cp = "What should this be?";
  fprintf(pStamp_m->pLogFP, " %s", cp);

} /* end show_domain_id */

/*****************************************************************
 * NAME
 *    show_rule_action
 * ARGUMENTS:
 *    ap - pointer to an action structure
 * DESCRIPTION
 *    Show a tone rule's actions
 * RETURN VALUE
 *    NONE
 */
void show_rule_action(ap)
	 struct action *ap;
{
  char *op;

  if (pStamp_m->pLogFP == NULL)
	return;			/* no place to show it! */

  if (ap == (struct action *)NULL)
	{
	  fprintf(pStamp_m->pLogFP,
		  "\n\tNo action for rule!  This should not happen!");
	  return;
	}

  switch (ap->ac_op)
	{
	case ASSOCIATE:
	  op = "Associate";
	  break;

	case DELETE:
	  op = "Delete";
	  break;

	case DELINK:
	  op = "Delink";
	  break;

	case INSERT:
	  op = "Insert";
	  break;

	case LINK:
	  op = "Link";
	  break;

	case SPREAD:
	  op = "Spread";
	  break;

	case COPY:
	  op = "Copy";
	  break;

	case SET_EDGE_COND:
	  op = "Set edge condition to ";
	  break;

	default:
	  op = "Unknown operation!  Program error!";
	  break;
	}
  fprintf(pStamp_m->pLogFP, "\n\t%s", op);

  if (ap->ac_op == SET_EDGE_COND)
	{
	  if ((op = edge_cond_name(ap->ac_econds)) != (char *)NULL)
	fprintf(pStamp_m->pLogFP, "%s", op);
	  else
	fprintf(pStamp_m->pLogFP,
		   "unknown edge condition (%ld)!  Program error!", ap->ac_econds);
	}
  else
	{
	  show_tone_id(ap->ac_tone);

	  if (DIRECTION(ap->ac_params) == LEFTWARD)
	fprintf(pStamp_m->pLogFP, " right-to-left");
	  else
	fprintf(pStamp_m->pLogFP, " left-to-right");

	  switch (ITERATION(ap->ac_params))
	{
	case NONITERATIVELY:
	  op = "non-iteratively";
	  break;

	case ITERATIVELY:
	  op = "iteratively";
	  break;

	case EDGE_IN:
	  op = "edge-in";
	  break;

	case ONE_TO_ONE:
	  op = "one-to-one";
	  break;

	default:
	  op = "Unknown iteration type! Program error!";
	  break;
	}
	  fprintf(pStamp_m->pLogFP, " %s", op);

	  if (ap->ac_op != DELETE)
	{
	  switch(MODE(ap->ac_params))
		{
		case FEATURE_ADDING:
		  op = "feature-adding";
		  break;

		case FEATURE_CHANGING:
		  op = "feature-changing";
		  break;

		case FEATURE_FILLING:
		  op = "feature-filling";
		  break;

		default:
		  op = "Unknown mode!  Program error!";
		  break;
		}
	  fprintf(pStamp_m->pLogFP, "\n\t\tusing %s mode", op);

	  switch (OCP(ap->ac_params))
		{
		case OPTIONAL_OCP_BLOCKAGE:
		  op = "optional-OCP-blockage";
		  break;

		case OCP_BLOCKAGE:
		  op = "OCP-blockage";
		  break;

		case OCP_IGNORED:
		  op = "OCP-ignored";
		  break;

		case OCP_MERGER:
		  op = "OCP-merger";
		  break;

		default:
		  op = "Unknown OCP parameter!  Program error!";
		  break;
		}
	  fprintf(pStamp_m->pLogFP, " with %s", op);
	}

	  show_domain_id(ap->ac_domain);
	}

} /* end show_rule_action */

/*****************************************************************
 * NAME
 *    show_rule_cond
 * ARGUMENTS:
 *    cdp - pointer to a cond_node struct
 * DESCRIPTION
 *    Show a tone rule's condtions
 * RETURN VALUE
 *    NONE
 */
static void show_rule_cond(cdp)
	 struct cond_node *cdp;
{

  if (cdp == (struct cond_node *)NULL ||
	  pStamp_m->pLogFP == NULL)
	return;

  fprintf(pStamp_m->pLogFP, "\n\tCONDITION:\n");
  tree_walk(cdp, 3);

} /* end show_rule_cond */

/*****************************************************************
 * NAME
 *    show_tone_id
 * ARGUMENTS:
 *    tp - pointer to a tone_id structure
 * DESCRIPTION
 *    Show a tone_id
 * RETURN VALUE
 *    NONE
 */
static void show_tone_id(tp)
	 struct tone_id *tp;
{
  if (pStamp_m->pLogFP == NULL)
	return;

  if (tp == (struct tone_id*)NULL)
	{
	  fprintf(pStamp_m->pLogFP, " none");
	  return;
	}

  if (tp->ti_params == DEFAULT)
	fprintf(pStamp_m->pLogFP, " default");
  else if (tp->ti_params & 001)
	fprintf(pStamp_m->pLogFP, " a ");
  if (tp->ti_pos)
	  show_where(tp->ti_pos);
  fprintf(pStamp_m->pLogFP, "%s", tone_type_name(tp->ti_status));
  if (tp->ti_value != (struct tone_value_list *)NULL)
	fprintf(pStamp_m->pLogFP, " %s", tp->ti_value->tv_str);
  fprintf(pStamp_m->pLogFP, " tone");
  if (tp->ti_params & 002)
	putc('s', pStamp_m->pLogFP);

} /* end show_tone_id */

/*****************************************************************
 * NAME
 *    show_tone_pattern
 * ARGUMENTS:
 *    tp - pointer to a tone_pattern structure
 * DESCRIPTION
 *    Show a tone_pattern
 * RETURN VALUE
 *    NONE
 */
static void show_tone_pattern(tp)
	 struct tone_pattern *tp;
{

  if (pStamp_m->pLogFP == NULL)
	return;

  if (tp == (struct tone_pattern*)NULL)
	{
	  fprintf(pStamp_m->pLogFP, " none");
	  return;
	}

  for (;
	   tp != (struct tone_pattern*)NULL;
	   tp = tp->tp_next)
	show_tone_id(tp->tp_tone);

} /* end show_tone_pattern */

/*****************************************************************
 * NAME
 *    show_tone_rule
 * ARGUMENTS:
 *    tp - pointer to a tone rule structure
 * DESCRIPTION
 *    Show a tone rule
 * RETURN VALUE
 *    NONE
 */
static void show_tone_rule(tp)
	 struct tone_rule *tp;
{
  char               *cp;
  struct action      *ap;
  struct domain_list *dlp;

  if (pStamp_m->pLogFP == NULL)
	return;

  if (tp == (struct tone_rule*)NULL)
	return;

  fprintf(pStamp_m->pLogFP, "\n%s is ", tp->tr_name);
  switch(RULE_TYPE(tp->tr_params))
	{
	case EDGE_CONDITION:
	  cp = "an edge condition";
	  break;

	case EDGE_RULE:
	  cp = "an edge rule";
	  break;

	case RIGHT_EDGE_RULE:
	  cp = "a right edge rule";
	  break;

	case TONE_RULE:
	  cp = "a tone rule";
	  break;

	default:
	  cp = "Unknown type! Program error!!";
	}
  fprintf(pStamp_m->pLogFP, "%s", cp);
  if (OPTIONALITY(tp->tr_params))
	fprintf(pStamp_m->pLogFP, ", is optional");
  if (!RULE_CYCLICITY(tp->tr_params))
	{
	  fprintf(pStamp_m->pLogFP, " and is noncyclic");
	}
  else
	{
	  fprintf(pStamp_m->pLogFP, " and is cyclic\n\t\t");
	  if (tp->tr_cycle == (struct cycle *)NULL)
	{
	  fprintf(pStamp_m->pLogFP,
		  "from the innermost morphological domain outward");
	}
	  else if (tp->tr_cycle->cy_domain == (struct domain_list *)NULL)
	{
	  fprintf(pStamp_m->pLogFP, "in a %s fashion across the word",
		 (tp->tr_cycle->cy_dir == RIGHTWARD) ? "left-to-right"
											 : "right-to-left");
	}
	  else
	{
	  fprintf(pStamp_m->pLogFP, "within the ");
	  for (dlp = tp->tr_cycle->cy_domain;
		   dlp != (struct domain_list *)NULL;
		   dlp = dlp->dl_next)
		{
/*	  fprintf(pStamp_m->pLogFP, "%s", find_domain_name(dlp->dl_domain)); */
		}
	  fprintf(pStamp_m->pLogFP, " domain(s)");
	}

	}
  putc('.', pStamp_m->pLogFP);

  for (ap = tp->tr_action;
	   ap != (struct action *)NULL;
	   ap = ap->ac_next)
	{
	  show_rule_action(ap);
	  putc((ap->ac_next == (struct action *)NULL) ? '.' : ',',
	   pStamp_m->pLogFP);
	}
  show_rule_cond(tp->tr_cond);

} /* end show_tone_rule */

/*****************************************************************
 * NAME
 *    show_tone_rules
 * ARGUMENTS:
 *    NONE
 * DESCRIPTION
 *    Show tone rules
 * RETURN VALUE
 *    NONE
 */
void show_tone_rules()
{
  struct tone_rule *tp;

  if (pStamp_m->pLogFP == NULL)
	return;

  fprintf(pStamp_m->pLogFP, "\n\nTone Rules:");

  for (tp = Trule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	show_tone_rule(tp);


  fprintf(pStamp_m->pLogFP, "\n\nEdge Condition Rules:");

  for (tp = Erule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	show_tone_rule(tp);

} /* end show_tone_rules */

/***************************************************************************
 * NAME
 *    show_where
 * ARGUMENTS
 *    pos   - morpheme position
 * DESCRIPTION
 *    show the morpheme position
 * RETURN VALUE
 *    none
 */
static void show_where( pos )
	 int pos;
{
  if (pStamp_m->pLogFP == NULL)
	return;

  switch (pos)
	{
	case ARGCURRENT:	fprintf(pStamp_m->pLogFP, "current ");	break;
	case ARGLEFT:	fprintf(pStamp_m->pLogFP, "left ");	break;
	case ARGRIGHT:	fprintf(pStamp_m->pLogFP, "right ");	break;
	case INITIALM:	fprintf(pStamp_m->pLogFP, "INITIAL ");	break;
	case FINALM:	fprintf(pStamp_m->pLogFP, "FINAL ");	break;
	case WINITIAL:	fprintf(pStamp_m->pLogFP, "initial ");	break;
	case WFINAL:	fprintf(pStamp_m->pLogFP, "final ");	break;
	default:		fprintf(pStamp_m->pLogFP, "<?> ");	break;
	}
}	/* end show_where  */

/***************************************************************************
 * NAME
 *    t_indent
 * ARGUMENTS
 *    depth - indentation depth for printout
 *    str   - what to display
 * DESCRIPTION
 *    indent for the tree display
 * RETURN VALUE
 *    none
 */
static void t_indent(depth,str)      /* indent for the tree display */
	 int depth;
	 char *str;
{
  register int k;
  if (pStamp_m->pLogFP == NULL)
	return;

  for ( k = 0 ; k < depth ; ++k )
	fprintf(pStamp_m->pLogFP, "    ");
  fprintf(pStamp_m->pLogFP, "%s",str);
}

/***************************************************************************
 * NAME
 *    tone_rule_stats
 * ARGUMENTS
 *    NONE
 * DESCRIPTION
 *    show tone rule statistics
 * RETURN VALUE
 *    none
 */
void tone_rule_stats()
{
  struct tone_rule *tp;

  if (pStamp_m->pLogFP == NULL)
	return;

  fprintf(pStamp_m->pLogFP, "\n\n   Counts for Tone Rules:");

  for (tp = Trule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	fprintf(pStamp_m->pLogFP,  "\n%26s tried %5ld time%s applied %ld.",
			tp->tr_name,
			tp->tr_tried, (tp->tr_tried==1) ? ", " : "s,",
			tp->tr_applied );

  fprintf(pStamp_m->pLogFP, "\n\n   Counts for Edge Condition Rules:");

  for (tp = Erule_head;
	   tp != (struct tone_rule *)NULL;
	   tp = tp->tr_right)
	fprintf(pStamp_m->pLogFP,  "\n%26s tried %5ld time%s applied %ld.",
			tp->tr_name,
			tp->tr_tried, (tp->tr_tried==1) ? ", " : "s,",
			tp->tr_applied );

} 	/* end tone_rule_stats */

/***************************************************************************
 * NAME
 *    tree_walk
 * ARGUMENTS
 *    condp - pointer to the cond to be traversed
 *    depth - indentation depth for printout
 * DESCRIPTION
 *    Traverse the syntax tree structure in inorder fashion.
 * RETURN VALUE
 *    none
 */
static void tree_walk(condp,depth)
	 struct cond_node *condp;
	 int depth;
{
  char *p;

  if (pStamp_m->pLogFP == NULL)
	return;

  t_indent(depth, (condp->cn_opcode&OP_NOT) ? "NOT " : "" );

switch (condp->cn_opcode & OP_MASK)
	{
	case LOGAND:	/* 'AND' (A && B) */
	fprintf(pStamp_m->pLogFP, "(\n");
	tree_walk( condp->cl.l_son, depth+1 );
	t_indent(depth,"AND\n");
	tree_walk( condp->cr.r_son, depth+1 );
	t_indent(depth,")\n");
	break;
	case LOGOR:	/* 'OR'  (A || B) */
	fprintf(pStamp_m->pLogFP, "(\n");
	tree_walk( condp->cl.l_son, depth+1 );
	t_indent(depth,"OR\n");
	tree_walk( condp->cr.r_son, depth+1 );
	t_indent(depth,")\n");
	break;
	case LOGXOR:	/* 'XOR' ((!A && B) || (A && !B)) */
	fprintf(pStamp_m->pLogFP, "(\n");
	tree_walk( condp->cl.l_son, depth+1 );
	t_indent(depth,"XOR\n");
	tree_walk( condp->cr.r_son, depth+1 );
	t_indent(depth,")\n");
	break;
	case LOGIFF:	/* 'IFF' ((A && B) || (!A && !B)) */
	fprintf(pStamp_m->pLogFP, "(\n");
	tree_walk( condp->cl.l_son, depth+1 );
	t_indent(depth,"IFF\n");
	tree_walk( condp->cr.r_son, depth+1 );
	t_indent(depth,")\n");
	break;

	case CATEGORY_IS:	/* 'category' 'is' IDENTIFIER */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "category is %s\n",
		findAmpleCategoryName((int)condp->cr.r_int,
					  pStamp_m->pCategories) );
	break;
	case CATEGORY_MEMBER:	/* 'category 'is' 'member' IDENTIFIER */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "category is member %s\n",
		condp->cr.r_ccp->pszName );
	break;
	case EDGE_COND_IS:       /* 'edge' 'condition' 'is' IDENTIFIER */
	fprintf(pStamp_m->pLogFP, "edge condition is %s\n",
		edge_cond_name( condp->cr.r_int ));
	break;
	case PROP_IS:       /* 'property' 'is' IDENTIFIER */
	show_where( condp->cl.l_pos );
	p =  findAmplePropertyName((unsigned int)condp->cr.r_prop,
				   &pStamp_m->sProperties);
	fprintf( pStamp_m->pLogFP, "property is %s\n",	p ? p : "??UNKNOWN??");
	break;
	case MORPH_IS:	/* 'morphname' 'is' STRING */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morphname is \"%s\"\n", condp->cr.r_string);
	break;
	case MORPH_MEMBER:	/* 'morphname' 'is' 'member' IDENTIFIER */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morphname is member %s\n",
		condp->cr.r_mcp->pszName );
	break;
	case MORPH_PROSODY: /* 'morpheme' 'is' PROSODIC_SHAPE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morpheme is ");
	switch (condp->cr.r_int)
		{
		case MONOSYLLABIC:
		  fprintf(pStamp_m->pLogFP, "monosyllabic");
		  break;
		case DISYLLABIC:
		  fprintf(pStamp_m->pLogFP, "disyllabic");
		  break;
		case TRISYLLABIC:
		  fprintf(pStamp_m->pLogFP, "trisyllabic");
		  break;
		case QUADRISYLLABIC:
		  fprintf(pStamp_m->pLogFP, "quadrisyllabic");
		  break;
		case POLYSYLLABIC:
		  fprintf(pStamp_m->pLogFP, "polysyllabic");
		  break;
		case MONOMORAIC:
		  fprintf(pStamp_m->pLogFP, "monomoraic");
		  break;
		case BIMORAIC:
		  fprintf(pStamp_m->pLogFP, "bimoraic");
		  break;
		default:
		  fprintf(pStamp_m->pLogFP, "<?>");
		  break;
		}
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case SEGMENT_IS:	/* 'segment' 'is'  STRING */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "segment is \"%s\"\n", condp->cr.r_string );
	break;
	case SEGMENT_MEMBER:	/* 'segment' 'is' 'member' IDENTIFIER */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "segment is member %s\n",
		condp->cr.r_scp->pszName );
	break;
	case SYLLABLE_HAS: /* 'syllable' 'has' ONSET_CODA */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "syllable has ");
	if (condp->cr.r_int == ONSET)
	  fprintf(pStamp_m->pLogFP, "onset");
	else
	  fprintf(pStamp_m->pLogFP, "coda");
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TBU_DOMAIN:	/* 'tbu' 'is'  DOMAIN */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "tbu is");
	show_domain_id( condp->cr.r_dip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TBU_EXTRAMET: /* 'tbu' 'is' 'extrametrical' */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "tbu is extrametrical\n");
	break;
	case TBU_HAS: /* 'tbu' 'has' TONE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "tbu has");
	show_tone_id( condp->cr.r_tip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TBU_NUMBER: /* 'morpheme' 'tbu' NUMBER 'has' TONE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morpheme tbu %d has", condp->cn_tbu_num);
	show_tone_id( condp->cr.r_tip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TONE_IS:	/* 'tone' 'is' TONE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "tone is");
	show_tone_id( condp->cr.r_tip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case MORPH_TONE_IS:	/* 'morpheme' 'tone' 'is' TONE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morpheme tone is");
	show_tone_id( condp->cr.r_tip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case MORPH_UL_TONE_IS:	/* 'morpheme' 'underlying' 'tone' 'is' TONE */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morpheme underlying tone is");
	show_tone_id( condp->cr.r_tip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TONE_PATTERN_IS:	/* 'tone' 'pattern' 'is' TONE_PATTERN */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "tone pattern is");
	show_tone_pattern( condp->cr.r_tpip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case MORPH_UL_TONE_PAT_IS:	/* 'morpheme' 'underlying' 'tone' 'pattern'
				   'is' TONE_PATTERN */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "morpheme underlying tone pattern is");
	show_tone_pattern( condp->cr.r_tpip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case WORD_TONE_IS:	/* 'word' 'tone' 'pattern' 'is' TONE_PATTERN */
	fprintf(pStamp_m->pLogFP, "word tone pattern is");
	show_tone_pattern( condp->cr.r_tpip );
	fprintf(pStamp_m->pLogFP, "\n");
	break;
	case TYPE_IS:	/* 'type' 'is' <type> */
	show_where( condp->cl.l_pos );
	fprintf(pStamp_m->pLogFP, "type is ");
	switch (condp->cr.r_int)
		{
		case PFX:	   fprintf(pStamp_m->pLogFP, "prefix");	  break;
		case IFX:	   fprintf(pStamp_m->pLogFP, "infix");	  break;
		case ROOT:	   fprintf(pStamp_m->pLogFP, "root");	  break;
		case SFX:	   fprintf(pStamp_m->pLogFP, "suffix");	  break;
		case WINITIAL: fprintf(pStamp_m->pLogFP, "initial");  break;
		case WFINAL:   fprintf(pStamp_m->pLogFP, "final");	  break;
		default:	   fprintf(pStamp_m->pLogFP, "<?>");	  break;
		}
	fprintf(pStamp_m->pLogFP, "\n");
	break;

	default:
	fprintf(pStamp_m->pLogFP, "<<? UNKNOWN NODE TYPE ?>>\n");
	break;
	}
} /* end tree_walk */

/*****************************************************************
 *
 *                         yyerror
 *
 *****************************************************************
 *
 * yyerror
 * error message routine for yacc
 * ARGUMENTS:
 *    s = pointer to error message
 *
 */
void yyerror(s)
	 char *s;
{
  if (pStamp_m->pLogFP == NULL)
	return;

  fprintf(pStamp_m->pLogFP, "%s %s in %s", tsterrhead, s, ltname );
} /* end yyerror */
