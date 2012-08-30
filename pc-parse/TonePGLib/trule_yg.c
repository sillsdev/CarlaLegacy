/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

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
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
	  know about them.  */
   enum yytokentype {
	 LX_A = 258,
	 LX_AND = 259,
	 LX_ANTEPENULTIMATE = 260,
	 LX_APPLIES = 261,
	 LX_ASSOCIATE = 262,
	 LX_AT = 263,
	 LX_BIMORAIC = 264,
	 LX_BOUNDARY = 265,
	 LX_CATEGORY = 266,
	 LX_CODA = 267,
	 LX_CONDITION = 268,
	 LX_COPY = 269,
	 LX_CURRENT = 270,
	 LX_CYCLE = 271,
	 LX_CYCLICALLY = 272,
	 LX_DEFAULT = 273,
	 LX_DELETE = 274,
	 LX_DELINK = 275,
	 LX_DELINKED = 276,
	 LX_DIRECTION = 277,
	 LX_DISYLLABIC = 278,
	 LX_DOMAIN = 279,
	 LX_DOMAINS = 280,
	 LX_ECONDITION = 281,
	 LX_EDGE = 282,
	 LX_EDGE_IN = 283,
	 LX_EXTRAMETRICAL = 284,
	 LX_FA_LEFT = 285,
	 LX_FA_RIGHT = 286,
	 LX_FIRST = 287,
	 LX_FS_LEFT = 288,
	 LX_FS_RIGHT = 289,
	 LX_FEATURE_ADDING = 290,
	 LX_FEATURE_CHANGING = 291,
	 LX_FEATURE_FILLING = 292,
	 LX_FILL_IN = 293,
	 LX_FINAL = 294,
	 LX_FLEFT = 295,
	 LX_FLOATING = 296,
	 LX_FRIGHT = 297,
	 LX_HAS = 298,
	 LX_IDENTIFIER = 299,
	 LX_IF = 300,
	 LX_IN = 301,
	 LX_INFIX = 302,
	 LX_INITIAL = 303,
	 LX_INSERT = 304,
	 LX_IS = 305,
	 LX_ITERATION = 306,
	 LX_ITERATIVELY = 307,
	 LX_LEFT = 308,
	 LX_LEFT_FLOATING = 309,
	 LX_LEFTTWO = 310,
	 LX_LEFTWARD = 311,
	 LX_LINK = 312,
	 LX_LINKED = 313,
	 LX_LO_AND = 314,
	 LX_LO_IFF = 315,
	 LX_LO_NOT = 316,
	 LX_LO_OR = 317,
	 LX_LO_XOR = 318,
	 LX_MEMBER = 319,
	 LX_MELODY = 320,
	 LX_MODE = 321,
	 LX_MONOMORAIC = 322,
	 LX_MONOSYLLABIC = 323,
	 LX_MORPHEME = 324,
	 LX_MORPHNAME = 325,
	 LX_NONE = 326,
	 LX_NONITERATIVELY = 327,
	 LX_OCP = 328,
	 LX_OCP_BLOCKAGE = 329,
	 LX_OCP_IGNORED = 330,
	 LX_OCP_MERGER = 331,
	 LX_OF = 332,
	 LX_ONE_TO_ONE = 333,
	 LX_ONSET = 334,
	 LX_OPTIONAL = 335,
	 LX_PATTERN = 336,
	 LX_PENULTIMATE = 337,
	 LX_PFINAL = 338,
	 LX_PINITIAL = 339,
	 LX_POLYSYLLABIC = 340,
	 LX_PREFIX = 341,
	 LX_PROPERTY = 342,
	 LX_QUADRISYLLABIC = 343,
	 LX_RIGHT = 344,
	 LX_RIGHT_FLOATING = 345,
	 LX_RIGHTTWO = 346,
	 LX_RIGHTWARD = 347,
	 LX_ROOT = 348,
	 LX_SECOND = 349,
	 LX_SEGMENT = 350,
	 LX_SET = 351,
	 LX_SPREAD = 352,
	 LX_SUFFIX = 353,
	 LX_SYLLABLE = 354,
	 LX_TBU = 355,
	 LX_TBUS = 356,
	 LX_THEN = 357,
	 LX_THIRD = 358,
	 LX_TO = 359,
	 LX_TONE = 360,
	 LX_TONES = 361,
	 LX_TRISYLLABIC = 362,
	 LX_TYPE = 363,
	 LX_ULTIMATE = 364,
	 LX_UNDER = 365,
	 LX_USING = 366,
	 LX_WITH = 367,
	 LX_WITHIN = 368,
	 LX_WORD = 369
   };
#endif
/* Tokens.  */
#define LX_A 258
#define LX_AND 259
#define LX_ANTEPENULTIMATE 260
#define LX_APPLIES 261
#define LX_ASSOCIATE 262
#define LX_AT 263
#define LX_BIMORAIC 264
#define LX_BOUNDARY 265
#define LX_CATEGORY 266
#define LX_CODA 267
#define LX_CONDITION 268
#define LX_COPY 269
#define LX_CURRENT 270
#define LX_CYCLE 271
#define LX_CYCLICALLY 272
#define LX_DEFAULT 273
#define LX_DELETE 274
#define LX_DELINK 275
#define LX_DELINKED 276
#define LX_DIRECTION 277
#define LX_DISYLLABIC 278
#define LX_DOMAIN 279
#define LX_DOMAINS 280
#define LX_ECONDITION 281
#define LX_EDGE 282
#define LX_EDGE_IN 283
#define LX_EXTRAMETRICAL 284
#define LX_FA_LEFT 285
#define LX_FA_RIGHT 286
#define LX_FIRST 287
#define LX_FS_LEFT 288
#define LX_FS_RIGHT 289
#define LX_FEATURE_ADDING 290
#define LX_FEATURE_CHANGING 291
#define LX_FEATURE_FILLING 292
#define LX_FILL_IN 293
#define LX_FINAL 294
#define LX_FLEFT 295
#define LX_FLOATING 296
#define LX_FRIGHT 297
#define LX_HAS 298
#define LX_IDENTIFIER 299
#define LX_IF 300
#define LX_IN 301
#define LX_INFIX 302
#define LX_INITIAL 303
#define LX_INSERT 304
#define LX_IS 305
#define LX_ITERATION 306
#define LX_ITERATIVELY 307
#define LX_LEFT 308
#define LX_LEFT_FLOATING 309
#define LX_LEFTTWO 310
#define LX_LEFTWARD 311
#define LX_LINK 312
#define LX_LINKED 313
#define LX_LO_AND 314
#define LX_LO_IFF 315
#define LX_LO_NOT 316
#define LX_LO_OR 317
#define LX_LO_XOR 318
#define LX_MEMBER 319
#define LX_MELODY 320
#define LX_MODE 321
#define LX_MONOMORAIC 322
#define LX_MONOSYLLABIC 323
#define LX_MORPHEME 324
#define LX_MORPHNAME 325
#define LX_NONE 326
#define LX_NONITERATIVELY 327
#define LX_OCP 328
#define LX_OCP_BLOCKAGE 329
#define LX_OCP_IGNORED 330
#define LX_OCP_MERGER 331
#define LX_OF 332
#define LX_ONE_TO_ONE 333
#define LX_ONSET 334
#define LX_OPTIONAL 335
#define LX_PATTERN 336
#define LX_PENULTIMATE 337
#define LX_PFINAL 338
#define LX_PINITIAL 339
#define LX_POLYSYLLABIC 340
#define LX_PREFIX 341
#define LX_PROPERTY 342
#define LX_QUADRISYLLABIC 343
#define LX_RIGHT 344
#define LX_RIGHT_FLOATING 345
#define LX_RIGHTTWO 346
#define LX_RIGHTWARD 347
#define LX_ROOT 348
#define LX_SECOND 349
#define LX_SEGMENT 350
#define LX_SET 351
#define LX_SPREAD 352
#define LX_SUFFIX 353
#define LX_SYLLABLE 354
#define LX_TBU 355
#define LX_TBUS 356
#define LX_THEN 357
#define LX_THIRD 358
#define LX_TO 359
#define LX_TONE 360
#define LX_TONES 361
#define LX_TRISYLLABIC 362
#define LX_TYPE 363
#define LX_ULTIMATE 364
#define LX_UNDER 365
#define LX_USING 366
#define LX_WITH 367
#define LX_WITHIN 368
#define LX_WORD 369




/* Copy the first part of user declarations.  */
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

static short	bForLeftSeen_m = FALSE;  /* flag FOR-ALL-LEFT, FOR-SOME-LEFT */
static short	bLeftSeen_m = FALSE;     /* flag LEFT */
static short	bForRightSeen_m = FALSE; /* flag FOR-ALL-RIGHT, FOR-SOME-RIGHT */
static short	bRightSeen_m = FALSE;    /* flag RIGHT */

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


/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 205 "trule_yg.y"
{
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
	}
/* Line 193 of yacc.c.  */
#line 525 "y.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 538 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
	int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
	/* The OS might guarantee only one guard page at the bottom of the stack,
	   and a page size can be as small as 4096 bytes.  So we cannot safely
	   invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
	   to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
	   && ! ((defined YYMALLOC || defined malloc) \
		 && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
	 && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
	 ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
	  + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
	  __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
	  do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
		(To)[yyi] = (From)[yyi];		\
	}					\
	  while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
	do									\
	  {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
	  }									\
	while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  24
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   529

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  121
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  58
/* YYNRULES -- Number of rules.  */
#define YYNRULES  197
/* YYNRULES -- Number of states.  */
#define YYNSTATES  333

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   369

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
	   0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	   2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	   2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	   2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
	 116,   117,     2,     2,   118,     2,   120,     2,     2,     2,
	   2,     2,     2,     2,     2,     2,     2,     2,   115,   119,
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
	   2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
	   5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
	  15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
	  25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
	  35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
	  45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
	  55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
	  65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
	  75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
	  85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
	  95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
	 105,   106,   107,   108,   109,   110,   111,   112,   113,   114
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
	   0,     0,     3,     5,     7,     9,    11,    13,    15,    17,
	  19,    23,    27,    31,    35,    39,    43,    47,    51,    57,
	  60,    62,    66,    69,    71,    75,    79,    81,    87,    93,
	  98,   103,   108,   112,   117,   122,   126,   130,   134,   137,
	 143,   145,   147,   149,   151,   153,   155,   157,   159,   164,
	 170,   174,   179,   183,   188,   192,   197,   200,   204,   207,
	 211,   215,   220,   223,   225,   228,   230,   232,   234,   236,
	 238,   240,   242,   244,   248,   250,   252,   254,   257,   260,
	 262,   264,   266,   270,   273,   277,   280,   284,   288,   291,
	 293,   295,   300,   305,   311,   315,   320,   323,   326,   328,
	 331,   335,   339,   342,   346,   348,   352,   357,   360,   363,
	 365,   367,   369,   371,   374,   378,   380,   382,   384,   386,
	 388,   390,   392,   397,   402,   408,   413,   419,   424,   429,
	 434,   439,   445,   450,   455,   460,   467,   475,   481,   486,
	 492,   498,   505,   511,   518,   526,   532,   537,   539,   541,
	 543,   545,   548,   550,   552,   554,   556,   558,   560,   562,
	 564,   566,   568,   570,   572,   574,   576,   578,   580,   582,
	 584,   586,   588,   590,   592,   594,   596,   598,   600,   602,
	 604,   606,   608,   610,   612,   614,   616,   618,   620,   622,
	 624,   626,   628,   630,   632,   634,   636,   638
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
	 122,     0,    -1,   123,    -1,   130,    -1,   124,    -1,   125,
	  -1,   126,    -1,   127,    -1,   128,    -1,   129,    -1,    22,
	 115,   140,    -1,    51,   115,   141,    -1,    66,   115,   143,
	  -1,    73,   115,   145,    -1,    24,   115,   149,    -1,    16,
	 115,    71,    -1,    16,   115,    24,    -1,    16,   115,   140,
	  -1,   131,   116,    80,   117,   132,    -1,   131,   132,    -1,
	  44,    -1,   133,   134,   156,    -1,   133,   134,    -1,   135,
	  -1,   133,   118,   135,    -1,   119,   151,   120,    -1,   120,
	  -1,   136,   137,   138,   144,   146,    -1,   136,   137,   138,
	 144,   147,    -1,   136,   137,   138,   144,    -1,   136,   137,
	 138,   146,    -1,   136,   137,   138,   147,    -1,   136,   137,
	 138,    -1,   136,   137,   144,   146,    -1,   136,   137,   144,
	 147,    -1,   136,   137,   144,    -1,   136,   137,   146,    -1,
	 136,   137,   147,    -1,   136,   137,    -1,    96,    27,    26,
	 104,    44,    -1,     7,    -1,    19,    -1,    20,    -1,    49,
	  -1,    57,    -1,    97,    -1,    38,    -1,    14,    -1,     3,
	 176,    44,   105,    -1,     3,   174,   176,    44,   105,    -1,
	   3,   176,   105,    -1,     3,   174,   176,   105,    -1,     3,
	  44,   105,    -1,     3,   174,    44,   105,    -1,   176,    44,
	 106,    -1,   174,   176,    44,   106,    -1,   176,   106,    -1,
	 174,   176,   106,    -1,    44,   106,    -1,   174,    44,   106,
	  -1,    18,    44,   105,    -1,   174,    18,    44,   105,    -1,
	 139,   142,    -1,   139,    -1,   140,   141,    -1,   140,    -1,
	 141,    -1,    56,    -1,    92,    -1,    72,    -1,    52,    -1,
	  28,    -1,    78,    -1,   111,   143,    66,    -1,    35,    -1,
	  36,    -1,    37,    -1,   112,   145,    -1,    80,    74,    -1,
	  74,    -1,    75,    -1,    76,    -1,   113,   148,   149,    -1,
	 113,   149,    -1,   113,   148,   150,    -1,   113,   150,    -1,
	  53,    27,    77,    -1,    89,    27,    77,    -1,    44,    24,
	  -1,    69,    -1,   114,    -1,   175,    99,    77,   114,    -1,
	 175,   100,    77,   114,    -1,     6,    17,   140,   113,   152,
	  -1,     6,    17,   140,    -1,     6,    17,   113,   152,    -1,
	  44,    24,    -1,   153,    25,    -1,   154,    -1,   155,   154,
	  -1,    44,     4,    44,    -1,   155,    44,   118,    -1,    44,
	 118,    -1,    13,   115,   157,    -1,   160,    -1,   157,   173,
	 160,    -1,    45,   160,   102,   160,    -1,   158,   160,    -1,
	 159,   160,    -1,    30,    -1,    33,    -1,    31,    -1,    34,
	  -1,    61,   160,    -1,   116,   157,   117,    -1,   161,    -1,
	 162,    -1,   163,    -1,   164,    -1,   165,    -1,   166,    -1,
	 167,    -1,    27,    26,    50,    44,    -1,   174,    11,    50,
	  44,    -1,   174,    11,    50,    64,    44,    -1,   174,    70,
	  50,    44,    -1,   174,    70,    50,    64,    44,    -1,   174,
	  87,    50,    44,    -1,   174,    99,    43,   171,    -1,   174,
	  69,    50,   172,    -1,   174,    95,    50,    44,    -1,   174,
	  95,    50,    64,    44,    -1,   174,   100,    50,   146,    -1,
	 174,   100,    50,    29,    -1,   174,   100,    43,   168,    -1,
	 174,    69,   100,    44,    43,   168,    -1,   174,    69,   110,
	 100,    44,    43,   168,    -1,   174,    69,    43,    44,   178,
	  -1,   174,   105,    50,   168,    -1,   174,   176,   105,    50,
	 168,    -1,   174,    69,   105,    50,   168,    -1,   174,    69,
	 110,   105,    50,   168,    -1,   174,   105,    81,    50,   169,
	  -1,   174,    69,   105,    81,    50,   169,    -1,   174,    69,
	 110,   105,    81,    50,   169,    -1,   114,   105,    81,    50,
	 169,    -1,   174,   108,    50,   177,    -1,   137,    -1,    71,
	  -1,   170,    -1,    71,    -1,   170,   137,    -1,   137,    -1,
	  79,    -1,    12,    -1,    68,    -1,    23,    -1,   107,    -1,
	  88,    -1,    85,    -1,    67,    -1,     9,    -1,    59,    -1,
	  60,    -1,    62,    -1,    63,    -1,    15,    -1,    53,    -1,
	  55,    -1,    89,    -1,    91,    -1,    40,    -1,    42,    -1,
	  84,    -1,    48,    -1,    83,    -1,    39,    -1,    32,    -1,
	  94,    -1,   103,    -1,     5,    -1,    82,    -1,   109,    -1,
	  10,    -1,    21,    -1,    41,    -1,    54,    -1,    58,    -1,
	  65,    -1,    90,    -1,    86,    -1,    47,    -1,    93,    -1,
	  98,    -1,    48,    -1,    39,    -1,   100,    -1,   101,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
	   0,   392,   392,   393,   399,   400,   401,   402,   403,   404,
	 414,   428,   442,   457,   472,   488,   497,   514,   530,   543,
	 561,   579,   592,   614,   618,   636,   640,   650,   664,   678,
	 691,   704,   717,   730,   743,   756,   769,   782,   795,   818,
	 840,   847,   854,   861,   867,   875,   885,   905,   915,   934,
	 960,   975,   997,  1015,  1041,  1060,  1082,  1098,  1117,  1135,
	1157,  1174,  1201,  1205,  1216,  1220,  1224,  1233,  1237,  1247,
	1253,  1265,  1285,  1295,  1305,  1313,  1320,  1330,  1341,  1348,
	1355,  1362,  1373,  1384,  1401,  1412,  1430,  1434,  1442,  1455,
	1466,  1481,  1493,  1510,  1524,  1537,  1554,  1566,  1574,  1578,
	1595,  1620,  1637,  1653,  1662,  1669,  1682,  1693,  1712,  1734,
	1738,  1745,  1749,  1756,  1766,  1774,  1782,  1799,  1807,  1815,
	1822,  1829,  1839,  1858,  1875,  1894,  1908,  1927,  1947,  1962,
	1979,  1993,  2015,  2031,  2047,  2068,  2102,  2136,  2168,  2216,
	2260,  2275,  2291,  2311,  2327,  2344,  2362,  2381,  2385,  2393,
	2397,  2406,  2421,  2435,  2440,  2448,  2453,  2458,  2463,  2468,
	2473,  2478,  2486,  2491,  2496,  2501,  2510,  2515,  2520,  2526,
	2531,  2537,  2544,  2551,  2556,  2561,  2566,  2574,  2579,  2584,
	2589,  2594,  2599,  2607,  2615,  2621,  2628,  2635,  2641,  2647,
	2657,  2661,  2665,  2669,  2673,  2677,  2684,  2688
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LX_A", "LX_AND", "LX_ANTEPENULTIMATE",
  "LX_APPLIES", "LX_ASSOCIATE", "LX_AT", "LX_BIMORAIC", "LX_BOUNDARY",
  "LX_CATEGORY", "LX_CODA", "LX_CONDITION", "LX_COPY", "LX_CURRENT",
  "LX_CYCLE", "LX_CYCLICALLY", "LX_DEFAULT", "LX_DELETE", "LX_DELINK",
  "LX_DELINKED", "LX_DIRECTION", "LX_DISYLLABIC", "LX_DOMAIN",
  "LX_DOMAINS", "LX_ECONDITION", "LX_EDGE", "LX_EDGE_IN",
  "LX_EXTRAMETRICAL", "LX_FA_LEFT", "LX_FA_RIGHT", "LX_FIRST",
  "LX_FS_LEFT", "LX_FS_RIGHT", "LX_FEATURE_ADDING", "LX_FEATURE_CHANGING",
  "LX_FEATURE_FILLING", "LX_FILL_IN", "LX_FINAL", "LX_FLEFT",
  "LX_FLOATING", "LX_FRIGHT", "LX_HAS", "LX_IDENTIFIER", "LX_IF", "LX_IN",
  "LX_INFIX", "LX_INITIAL", "LX_INSERT", "LX_IS", "LX_ITERATION",
  "LX_ITERATIVELY", "LX_LEFT", "LX_LEFT_FLOATING", "LX_LEFTTWO",
  "LX_LEFTWARD", "LX_LINK", "LX_LINKED", "LX_LO_AND", "LX_LO_IFF",
  "LX_LO_NOT", "LX_LO_OR", "LX_LO_XOR", "LX_MEMBER", "LX_MELODY",
  "LX_MODE", "LX_MONOMORAIC", "LX_MONOSYLLABIC", "LX_MORPHEME",
  "LX_MORPHNAME", "LX_NONE", "LX_NONITERATIVELY", "LX_OCP",
  "LX_OCP_BLOCKAGE", "LX_OCP_IGNORED", "LX_OCP_MERGER", "LX_OF",
  "LX_ONE_TO_ONE", "LX_ONSET", "LX_OPTIONAL", "LX_PATTERN",
  "LX_PENULTIMATE", "LX_PFINAL", "LX_PINITIAL", "LX_POLYSYLLABIC",
  "LX_PREFIX", "LX_PROPERTY", "LX_QUADRISYLLABIC", "LX_RIGHT",
  "LX_RIGHT_FLOATING", "LX_RIGHTTWO", "LX_RIGHTWARD", "LX_ROOT",
  "LX_SECOND", "LX_SEGMENT", "LX_SET", "LX_SPREAD", "LX_SUFFIX",
  "LX_SYLLABLE", "LX_TBU", "LX_TBUS", "LX_THEN", "LX_THIRD", "LX_TO",
  "LX_TONE", "LX_TONES", "LX_TRISYLLABIC", "LX_TYPE", "LX_ULTIMATE",
  "LX_UNDER", "LX_USING", "LX_WITH", "LX_WITHIN", "LX_WORD", "':'", "'('",
  "')'", "','", "';'", "'.'", "$accept", "Default_Or_Rule", "Default",
  "Direction", "Iteration", "Feature_Op", "Ocp", "Entity", "Cycle_Default",
  "Tone_Rule", "name", "Tone_Rule_Body", "Rule_Body", "Rule_End",
  "Rule_Action", "operation", "Tone", "Dir_Iter_Mode", "Dir_Iter",
  "direction", "iteration", "Mode", "feature_op", "OCP", "ocp", "Domain",
  "Location", "edge", "entity", "location", "Cycle", "Domain_cycle",
  "Multi_domains", "Two_domains", "More_domains", "Condition",
  "Condition_Body", "ForLeft", "ForRight", "Factor", "Edge_expr",
  "Morpheme_expr", "Prosodic_expr", "Segment_expr", "Tbu_expr",
  "Tone_expr", "Type_expr", "Tone_none", "Tone_Pattern", "Tone_Pat",
  "onset_coda", "prosodic_shape", "logop", "position", "word_position",
  "tone_status", "type", "tbu_tbus", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
	   0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
	 265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
	 275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
	 285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
	 295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
	 305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
	 315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
	 325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
	 335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
	 345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
	 355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
	 365,   366,   367,   368,   369,    58,    40,    41,    44,    59,
	  46
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
	   0,   121,   122,   122,   123,   123,   123,   123,   123,   123,
	 124,   125,   126,   127,   128,   129,   129,   129,   130,   130,
	 131,   132,   132,   133,   133,   134,   134,   135,   135,   135,
	 135,   135,   135,   135,   135,   135,   135,   135,   135,   135,
	 136,   136,   136,   136,   136,   136,   136,   136,   137,   137,
	 137,   137,   137,   137,   137,   137,   137,   137,   137,   137,
	 137,   137,   138,   138,   139,   139,   139,   140,   140,   141,
	 141,   141,   141,   142,   143,   143,   143,   144,   145,   145,
	 145,   145,   146,   146,   147,   147,   148,   148,   149,   149,
	 149,   150,   150,   151,   151,   151,   152,   152,   153,   153,
	 154,   155,   155,   156,   157,   157,   157,   157,   157,   158,
	 158,   159,   159,   160,   160,   160,   160,   160,   160,   160,
	 160,   160,   161,   162,   162,   162,   162,   162,   163,   163,
	 164,   164,   165,   165,   165,   165,   165,   165,   166,   166,
	 166,   166,   166,   166,   166,   166,   167,   168,   168,   169,
	 169,   170,   170,   171,   171,   172,   172,   172,   172,   172,
	 172,   172,   173,   173,   173,   173,   174,   174,   174,   174,
	 174,   174,   174,   174,   174,   174,   174,   175,   175,   175,
	 175,   175,   175,   176,   176,   176,   176,   176,   176,   176,
	 177,   177,   177,   177,   177,   177,   178,   178
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
	   0,     2,     1,     1,     1,     1,     1,     1,     1,     1,
	   3,     3,     3,     3,     3,     3,     3,     3,     5,     2,
	   1,     3,     2,     1,     3,     3,     1,     5,     5,     4,
	   4,     4,     3,     4,     4,     3,     3,     3,     2,     5,
	   1,     1,     1,     1,     1,     1,     1,     1,     4,     5,
	   3,     4,     3,     4,     3,     4,     2,     3,     2,     3,
	   3,     4,     2,     1,     2,     1,     1,     1,     1,     1,
	   1,     1,     1,     3,     1,     1,     1,     2,     2,     1,
	   1,     1,     3,     2,     3,     2,     3,     3,     2,     1,
	   1,     4,     4,     5,     3,     4,     2,     2,     1,     2,
	   3,     3,     2,     3,     1,     3,     4,     2,     2,     1,
	   1,     1,     1,     2,     3,     1,     1,     1,     1,     1,
	   1,     1,     4,     4,     5,     4,     5,     4,     4,     4,
	   4,     5,     4,     4,     4,     6,     7,     5,     4,     5,
	   5,     6,     5,     6,     7,     5,     4,     1,     1,     1,
	   1,     2,     1,     1,     1,     1,     1,     1,     1,     1,
	   1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
	   1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
	   1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
	   1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
	   0,     0,     0,     0,    20,     0,     0,     0,     0,     2,
	   4,     5,     6,     7,     8,     9,     3,     0,     0,     0,
	   0,     0,     0,     0,     1,    40,    47,    41,    42,    46,
	  43,    44,     0,    45,     0,    19,     0,    23,     0,    16,
	  67,    15,    68,    17,    10,     0,    89,    90,    14,    71,
	  70,    69,    72,    11,    74,    75,    76,    12,    79,    80,
	  81,     0,    13,     0,     0,     0,     0,    26,    22,     0,
	 183,   166,     0,   184,   176,   171,   185,   172,     0,   174,
	 167,   186,   168,   187,   188,   175,   173,   169,   189,   170,
	  38,     0,     0,    88,    78,     0,     0,    24,     0,     0,
	   0,    21,     0,     0,     0,     0,    58,     0,     0,    32,
	  63,    65,    66,    35,    36,    37,     0,     0,     0,     0,
	  56,     0,    18,     0,    25,     0,    52,     0,     0,     0,
	  50,    60,    77,   180,   177,     0,   181,     0,   178,   179,
	 182,     0,    83,    85,     0,    29,    30,    31,     0,    62,
	  64,    33,    34,     0,    59,     0,    57,    54,    39,     0,
	  94,     0,   109,   111,   110,   112,     0,     0,     0,     0,
	 103,     0,     0,   104,   115,   116,   117,   118,   119,   120,
	 121,     0,    53,     0,    51,    48,     0,     0,    82,    84,
	   0,     0,    27,    28,     0,    61,    55,     0,    95,     0,
	  98,     0,     0,     0,     0,   113,     0,     0,   162,   163,
	 164,   165,     0,   107,   108,     0,     0,     0,     0,     0,
	   0,     0,     0,     0,     0,    49,    86,    87,     0,     0,
	  73,     0,    96,   102,    97,     0,    99,    93,     0,     0,
	   0,   114,   105,     0,     0,     0,     0,     0,     0,     0,
	   0,     0,     0,     0,     0,     0,     0,     0,     0,    91,
	  92,   100,   101,   122,   106,     0,   123,     0,     0,   161,
	 156,   160,   155,   159,   158,   157,   129,     0,     0,     0,
	   0,     0,   125,     0,   127,   130,     0,   154,   153,   128,
	 148,   147,   134,   133,     0,   132,   138,     0,   195,   191,
	 194,   190,   192,   193,   146,     0,   150,   152,   145,   149,
	 124,   196,   197,   137,     0,   140,     0,     0,     0,     0,
	 126,   131,     0,   142,   139,   151,   135,   143,     0,   141,
	   0,   136,   144
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
	  -1,     8,     9,    10,    11,    12,    13,    14,    15,    16,
	  17,    35,    36,    68,    37,    38,   291,   109,   110,    43,
	  53,   149,    57,   113,    62,   114,   115,   141,   142,   143,
	  99,   198,   199,   200,   201,   101,   170,   171,   172,   173,
	 174,   175,   176,   177,   178,   179,   180,   292,   308,   309,
	 289,   276,   212,    91,   144,    92,   304,   313
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -140
static const yytype_int16 yypact[] =
{
	 285,   -93,   -83,   -63,  -140,   -53,   -30,    10,   131,  -140,
	-140,  -140,  -140,  -140,  -140,  -140,  -140,    26,    -8,   -42,
	 -32,   133,   157,   172,  -140,  -140,  -140,  -140,  -140,  -140,
	-140,  -140,   122,  -140,    71,  -140,    84,  -140,   385,  -140,
	-140,  -140,  -140,  -140,  -140,   146,  -140,  -140,  -140,  -140,
	-140,  -140,  -140,  -140,  -140,  -140,  -140,  -140,  -140,  -140,
	-140,    83,  -140,   150,    64,   181,   177,  -140,   174,   438,
	-140,  -140,   155,  -140,  -140,  -140,  -140,  -140,   104,  -140,
	-140,  -140,  -140,  -140,  -140,  -140,  -140,  -140,  -140,  -140,
	  -5,   279,   -38,  -140,  -140,   102,   181,  -140,   204,   105,
	 107,  -140,   121,   333,   -27,   124,  -140,   172,    21,   -69,
	 123,   133,  -140,   136,  -140,  -140,   193,   144,   -29,   147,
	-140,   198,  -140,    14,  -140,   129,  -140,   149,   -25,   152,
	-140,  -140,  -140,  -140,  -140,   231,  -140,   232,  -140,  -140,
	-140,    44,  -140,  -140,    -6,   136,  -140,  -140,   157,  -140,
	-140,  -140,  -140,   156,  -140,   158,  -140,  -140,  -140,   219,
	 153,   239,  -140,  -140,  -140,  -140,   125,   125,   162,   129,
	 173,   125,   125,  -140,  -140,  -140,  -140,  -140,  -140,  -140,
	-140,   186,  -140,   163,  -140,  -140,   194,   205,  -140,  -140,
	 206,   207,  -140,  -140,   209,  -140,  -140,     0,  -140,   245,
	-140,   244,   219,   240,   197,  -140,   215,    74,  -140,  -140,
	-140,  -140,   125,  -140,  -140,   253,   -14,   254,   255,   256,
	 265,   100,   -22,   260,   208,  -140,  -140,  -140,   200,   201,
	-140,   267,  -140,  -140,  -140,     1,  -140,  -140,   268,   125,
	 272,  -140,  -140,    53,   280,     4,   282,   -15,    41,    65,
	 283,    68,    19,   277,   -18,   277,   278,   176,   288,  -140,
	-140,  -140,  -140,  -140,  -140,   331,  -140,   295,    54,  -140,
	-140,  -140,  -140,  -140,  -140,  -140,  -140,   297,   277,   300,
	 301,   -12,  -140,   303,  -140,  -140,   309,  -140,  -140,  -140,
	-140,  -140,  -140,  -140,   -35,  -140,  -140,   331,  -140,  -140,
	-140,  -140,  -140,  -140,  -140,   277,  -140,  -140,  -140,   385,
	-140,  -140,  -140,  -140,   277,  -140,   331,   312,   277,   306,
	-140,  -140,   -32,  -140,  -140,  -140,  -140,  -140,   277,  -140,
	 331,  -140,  -140
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
	-140,  -140,  -140,  -140,  -140,  -140,  -140,  -140,  -140,  -140,
	-140,   261,  -140,  -140,   294,  -140,   -37,  -140,  -140,    -9,
	 -70,  -140,   214,   269,   257,  -106,   -88,    69,   -20,   224,
	-140,   178,  -140,   175,  -140,  -140,   212,  -140,  -140,  -111,
	-140,  -140,  -140,  -140,  -140,  -140,  -140,  -139,   -99,  -140,
	-140,  -140,  -140,   -67,  -140,   -61,  -140,  -140
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint16 yytable[] =
{
	  48,    90,   103,   146,   231,   231,   119,   151,   104,    45,
	  44,   293,    45,   269,    40,   155,    39,   129,   135,   183,
	 112,   147,    18,    49,   232,   152,   133,   270,   255,   244,
	 118,   287,    19,    25,    46,   278,   245,    46,   318,   192,
	  26,   150,   128,   107,   108,    27,    28,    50,    40,   133,
	  42,    40,    20,   134,   137,   204,   205,   193,   181,   256,
	 213,   214,    21,    41,    29,    45,   279,    51,   120,   319,
	  40,   271,   272,    52,   135,    30,   134,   156,   130,    47,
	 184,   111,    47,    31,    42,    22,   246,    42,    45,   273,
	  46,   247,   274,   190,   191,   294,   248,   266,   288,   181,
	 181,   242,   181,   136,   181,   181,    42,   107,   108,   282,
	 137,   275,   285,    46,   160,   138,   296,   267,   233,   262,
	 224,   188,    32,    33,   139,    23,   136,   159,   264,   283,
	 140,    24,   286,   208,   209,    47,   210,   211,   138,   315,
	  71,   280,    34,   253,    71,   181,   281,   139,   295,    63,
	 254,    64,   161,   140,   311,   312,   161,    94,    47,   162,
	 163,    49,   164,   165,    74,    75,   324,    77,    74,    75,
	  93,    77,   181,    79,   166,   326,    95,    79,    80,   329,
	  82,    96,    80,    98,    82,    50,   167,   100,    25,   331,
	 167,   241,    54,    55,    56,    26,    70,   215,   323,   105,
	  27,    28,    65,    66,    67,    51,   121,    73,    85,    86,
	 106,    52,    85,    86,    87,   298,    89,   327,    87,    29,
	  89,   123,   125,   299,   300,   124,   126,    76,   307,   131,
	  30,   332,   208,   209,   148,   210,   211,   153,    31,   168,
	  81,   169,   158,   168,    83,   169,    58,    59,    60,   108,
	 154,    84,    61,   157,   182,   216,   217,   185,   186,   187,
	 307,   195,   301,   197,   196,   203,   202,   206,   225,   302,
	 234,   226,   325,   218,   303,   230,    88,    32,    33,   307,
	  69,   219,   227,   228,   229,   220,   221,    70,   235,    70,
	 238,   222,    71,   307,   223,    72,   240,   116,    73,   239,
	  73,     1,   188,   243,   249,   250,   251,     2,   252,     3,
	 257,   261,   263,   258,   259,   260,    74,    75,    76,    77,
	  76,    78,   265,   117,   268,    79,   277,   284,   297,     4,
	  80,    81,    82,    81,    69,    83,     5,    83,   305,   310,
	 314,    70,    84,    70,    84,   317,    71,   320,   290,    72,
	 316,     6,    73,   321,    73,   328,   330,   122,     7,    97,
	  85,    86,   194,   322,   132,   189,    87,    88,    89,    88,
	  74,    75,    76,    77,    76,    78,   236,   127,   145,    79,
	 237,   207,     0,     0,    80,    81,    82,    81,    69,    83,
	   0,    83,     0,     0,     0,    70,    84,     0,    84,     0,
	  71,     0,   306,    72,     0,     0,    73,     0,     0,     0,
	   0,     0,     0,     0,    85,    86,     0,     0,     0,     0,
	  87,    88,    89,    88,    74,    75,    76,    77,     0,    78,
	   0,     0,     0,    79,     0,     0,     0,     0,    80,    81,
	  82,     0,     0,    83,     0,     0,     0,     0,    70,     0,
	  84,     0,     0,    71,     0,     0,     0,     0,     0,    73,
	   0,     0,     0,     0,     0,     0,     0,     0,    85,    86,
	   0,     0,     0,     0,    87,    88,    89,    74,    75,    76,
	  77,     0,   102,     0,     0,     0,    79,     0,     0,     0,
	   0,    80,    81,    82,     0,     0,    83,     0,     0,     0,
	   0,     0,     0,    84,     0,     0,     0,     0,     0,     0,
	   0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
	   0,    85,    86,     0,     0,     0,     0,    87,    88,    89
};

static const yytype_int16 yycheck[] =
{
	  20,    38,    69,   109,     4,     4,    44,   113,    69,    44,
	  19,    29,    44,     9,    56,    44,    24,    44,    53,    44,
	  90,   109,   115,    28,    24,   113,     5,    23,    50,    43,
	  91,    12,   115,     7,    69,    50,    50,    69,    50,   145,
	  14,   111,   103,   112,   113,    19,    20,    52,    56,     5,
	  92,    56,   115,    32,    89,   166,   167,   145,   125,    81,
	 171,   172,   115,    71,    38,    44,    81,    72,   106,    81,
	  56,    67,    68,    78,    53,    49,    32,   106,   105,   114,
	 105,    90,   114,    57,    92,   115,   100,    92,    44,    85,
	  69,   105,    88,    99,   100,   113,   110,    44,    79,   166,
	 167,   212,   169,    82,   171,   172,    92,   112,   113,    44,
	  89,   107,    44,    69,   123,    94,   255,    64,   118,   118,
	 181,   141,    96,    97,   103,   115,    82,   113,   239,    64,
	 109,     0,    64,    59,    60,   114,    62,    63,    94,   278,
	  15,   100,   116,    43,    15,   212,   105,   103,   254,    27,
	  50,    80,    27,   109,   100,   101,    27,    74,   114,    30,
	  31,    28,    33,    34,    39,    40,   305,    42,    39,    40,
	  24,    42,   239,    48,    45,   314,    26,    48,    53,   318,
	  55,   117,    53,     6,    55,    52,    61,    13,     7,   328,
	  61,   117,    35,    36,    37,    14,    10,    11,   297,    44,
	  19,    20,   118,   119,   120,    72,   104,    21,    83,    84,
	 106,    78,    83,    84,    89,    39,    91,   316,    89,    38,
	  91,    17,   115,    47,    48,   120,   105,    41,   265,   105,
	  49,   330,    59,    60,   111,    62,    63,    44,    57,   114,
	  54,   116,    44,   114,    58,   116,    74,    75,    76,   113,
	 106,    65,    80,   106,   105,    69,    70,   105,    27,    27,
	 297,   105,    86,    44,   106,    26,   113,   105,   105,    93,
	  25,    77,   309,    87,    98,    66,    90,    96,    97,   316,
	   3,    95,    77,    77,    77,    99,   100,    10,    44,    10,
	  50,   105,    15,   330,   108,    18,    81,    18,    21,   102,
	  21,    16,   322,    50,    50,    50,    50,    22,    43,    24,
	  50,    44,    44,   105,   114,   114,    39,    40,    41,    42,
	  41,    44,    50,    44,    44,    48,    44,    44,    50,    44,
	  53,    54,    55,    54,     3,    58,    51,    58,    50,    44,
	  43,    10,    65,    10,    65,    44,    15,    44,    71,    18,
	  50,    66,    21,    44,    21,    43,    50,    96,    73,    65,
	  83,    84,   148,   294,   107,   141,    89,    90,    91,    90,
	  39,    40,    41,    42,    41,    44,   201,    44,   109,    48,
	 202,   169,    -1,    -1,    53,    54,    55,    54,     3,    58,
	  -1,    58,    -1,    -1,    -1,    10,    65,    -1,    65,    -1,
	  15,    -1,    71,    18,    -1,    -1,    21,    -1,    -1,    -1,
	  -1,    -1,    -1,    -1,    83,    84,    -1,    -1,    -1,    -1,
	  89,    90,    91,    90,    39,    40,    41,    42,    -1,    44,
	  -1,    -1,    -1,    48,    -1,    -1,    -1,    -1,    53,    54,
	  55,    -1,    -1,    58,    -1,    -1,    -1,    -1,    10,    -1,
	  65,    -1,    -1,    15,    -1,    -1,    -1,    -1,    -1,    21,
	  -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    83,    84,
	  -1,    -1,    -1,    -1,    89,    90,    91,    39,    40,    41,
	  42,    -1,    44,    -1,    -1,    -1,    48,    -1,    -1,    -1,
	  -1,    53,    54,    55,    -1,    -1,    58,    -1,    -1,    -1,
	  -1,    -1,    -1,    65,    -1,    -1,    -1,    -1,    -1,    -1,
	  -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
	  -1,    83,    84,    -1,    -1,    -1,    -1,    89,    90,    91
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
	   0,    16,    22,    24,    44,    51,    66,    73,   122,   123,
	 124,   125,   126,   127,   128,   129,   130,   131,   115,   115,
	 115,   115,   115,   115,     0,     7,    14,    19,    20,    38,
	  49,    57,    96,    97,   116,   132,   133,   135,   136,    24,
	  56,    71,    92,   140,   140,    44,    69,   114,   149,    28,
	  52,    72,    78,   141,    35,    36,    37,   143,    74,    75,
	  76,    80,   145,    27,    80,   118,   119,   120,   134,     3,
	  10,    15,    18,    21,    39,    40,    41,    42,    44,    48,
	  53,    54,    55,    58,    65,    83,    84,    89,    90,    91,
	 137,   174,   176,    24,    74,    26,   117,   135,     6,   151,
	  13,   156,    44,   174,   176,    44,   106,   112,   113,   138,
	 139,   140,   141,   144,   146,   147,    18,    44,   176,    44,
	 106,   104,   132,    17,   120,   115,   105,    44,   176,    44,
	 105,   105,   145,     5,    32,    53,    82,    89,    94,   103,
	 109,   148,   149,   150,   175,   144,   146,   147,   111,   142,
	 141,   146,   147,    44,   106,    44,   106,   106,    44,   113,
	 140,    27,    30,    31,    33,    34,    45,    61,   114,   116,
	 157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
	 167,   174,   105,    44,   105,   105,    27,    27,   149,   150,
	  99,   100,   146,   147,   143,   105,   106,    44,   152,   153,
	 154,   155,   113,    26,   160,   160,   105,   157,    59,    60,
	  62,    63,   173,   160,   160,    11,    69,    70,    87,    95,
	  99,   100,   105,   108,   176,   105,    77,    77,    77,    77,
	  66,     4,    24,   118,    25,    44,   154,   152,    50,   102,
	  81,   117,   160,    50,    43,    50,   100,   105,   110,    50,
	  50,    50,    43,    43,    50,    50,    81,    50,   105,   114,
	 114,    44,   118,    44,   160,    50,    44,    64,    44,     9,
	  23,    67,    68,    85,    88,   107,   172,    44,    50,    81,
	 100,   105,    44,    64,    44,    44,    64,    12,    79,   171,
	  71,   137,   168,    29,   113,   146,   168,    50,    39,    47,
	  48,    86,    93,    98,   177,    50,    71,   137,   169,   170,
	  44,   100,   101,   178,    43,   168,    50,    44,    50,    81,
	  44,    44,   148,   169,   168,   137,   168,   169,    43,   168,
	  50,   168,   169
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
	{								\
	  yychar = (Token);						\
	  yylval = (Value);						\
	  yytoken = YYTRANSLATE (yychar);				\
	  YYPOPSTACK (1);						\
	  goto yybackup;						\
	}								\
  else								\
	{								\
	  yyerror (YY_("syntax error: cannot back up")); \
	  YYERROR;							\
	}								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
	do									\
	  if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
	  else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
		YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
		YYRHSLOC (Rhs, 0).last_column;				\
	}								\
	while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
	 fprintf (File, "%d.%d-%d.%d",			\
		  (Loc).first_line, (Loc).first_column,	\
		  (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
	YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
	{									  \
	  YYFPRINTF (stderr, "%s ", Title);					  \
	  yy_symbol_print (stderr,						  \
		  Type, Value); \
	  YYFPRINTF (stderr, "\n");						  \
	}									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
	FILE *yyoutput;
	int yytype;
	YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
	return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
	YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
	{
	  default:
	break;
	}
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
	FILE *yyoutput;
	int yytype;
	YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
	YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
	YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
	yytype_int16 *bottom;
	yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
	YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
	yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
	YYSTYPE *yyvsp;
	int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
		 yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
	{
	  fprintf (stderr, "   $%d = ", yyi + 1);
	  yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
			   &(yyvsp[(yyi + 1) - (yynrhs)])
						   );
	  fprintf (stderr, "\n");
	}
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
	yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
	const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
	continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
	char *yydest;
	const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
	continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
	{
	  YYSIZE_T yyn = 0;
	  char const *yyp = yystr;

	  for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
		goto do_not_strip_quotes;

	  case '\\':
		if (*++yyp != '\\')
		  goto do_not_strip_quotes;
		/* Fall through.  */
	  default:
		if (yyres)
		  yyres[yyn] = *yyp;
		yyn++;
		break;

	  case '"':
		if (yyres)
		  yyres[yyn] = '\0';
		return yyn;
	  }
	do_not_strip_quotes: ;
	}

  if (! yyres)
	return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
	return 0;
  else
	{
	  int yytype = YYTRANSLATE (yychar);
	  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
	  YYSIZE_T yysize = yysize0;
	  YYSIZE_T yysize1;
	  int yysize_overflow = 0;
	  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
	  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
	  int yyx;

# if 0
	  /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
	  YY_("syntax error, unexpected %s");
	  YY_("syntax error, unexpected %s, expecting %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s or %s");
	  YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
	  char *yyfmt;
	  char const *yyf;
	  static char const yyunexpected[] = "syntax error, unexpected %s";
	  static char const yyexpecting[] = ", expecting %s";
	  static char const yyor[] = " or %s";
	  char yyformat[sizeof yyunexpected
			+ sizeof yyexpecting - 1
			+ ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
			   * (sizeof yyor - 1))];
	  char const *yyprefix = yyexpecting;

	  /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
	  int yyxbegin = yyn < 0 ? -yyn : 0;

	  /* Stay within bounds of both yycheck and yytname.  */
	  int yychecklim = YYLAST - yyn + 1;
	  int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
	  int yycount = 1;

	  yyarg[0] = yytname[yytype];
	  yyfmt = yystpcpy (yyformat, yyunexpected);

	  for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
		if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
		  {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
		  }
		yyarg[yycount++] = yytname[yyx];
		yysize1 = yysize + yytnamerr (0, yytname[yyx]);
		yysize_overflow |= (yysize1 < yysize);
		yysize = yysize1;
		yyfmt = yystpcpy (yyfmt, yyprefix);
		yyprefix = yyor;
	  }

	  yyf = YY_(yyformat);
	  yysize1 = yysize + yystrlen (yyf);
	  yysize_overflow |= (yysize1 < yysize);
	  yysize = yysize1;

	  if (yysize_overflow)
	return YYSIZE_MAXIMUM;

	  if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
		 Don't have undefined behavior even if the translation
		 produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
		{
		  if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
		  else
		{
		  yyp++;
		  yyf++;
		}
		}
	}
	  return yysize;
	}
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
	const char *yymsg;
	int yytype;
	YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
	yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
	{

	  default:
	break;
	}
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
	void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
	 || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{

  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
	 `yyss': related to states,
	 `yyvs': related to semantic values,
	 `yyls': related to locations.

	 Refer to the stacks thru separate pointers, to allow yyoverflow
	 to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
	 action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
	 Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
	 Waste one element of value and location stack
	 so that they stay on the same level as the state stack.
	 The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
	 have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
	{
	  /* Get the current used size of the three stacks, in elements.  */
	  YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
	  {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
			&yyss1, yysize * sizeof (*yyssp),
			&yyvs1, yysize * sizeof (*yyvsp),

			&yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
	  }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
	  goto yyexhaustedlab;
# else
	  /* Extend the stack our own way.  */
	  if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
	  yystacksize *= 2;
	  if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

	  {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
	  }
# endif
#endif /* no yyoverflow */

	  yyssp = yyss + yysize - 1;
	  yyvsp = yyvs + yysize - 1;


	  YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

	  if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
	}

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
	 look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
	goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
	{
	  YYDPRINTF ((stderr, "Reading a token: "));
	  yychar = YYLEX;
	}

  if (yychar <= YYEOF)
	{
	  yychar = yytoken = YYEOF;
	  YYDPRINTF ((stderr, "Now at end of input.\n"));
	}
  else
	{
	  yytoken = YYTRANSLATE (yychar);
	  YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
	}

  /* If the proper action on seeing token YYTOKEN is to reduce or to
	 detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
	goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
	{
	  if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
	  yyn = -yyn;
	  goto yyreduce;
	}

  if (yyn == YYFINAL)
	YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
	 status.  */
  if (yyerrstatus)
	yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
	yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
	goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
	 `$$ = $1'.

	 Otherwise, the following line sets YYVAL to garbage.
	 This behavior is undocumented and Bison
	 users should not rely upon it.  Assigning to YYVAL
	 unconditionally makes the parser a bit smaller, and it avoids a
	 GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
	{
		case 10:
#line 415 "trule_yg.y"
	{
		default_action_params |= (yyvsp[(3) - (3)].ival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: DIRECTION: dir");
			fprintf(pStamp_m->pLogFP, " [dir = %d, default = 0x%x)]",
				(yyvsp[(3) - (3)].ival), (unsigned)default_action_params);
		  }
		  }
	break;

  case 11:
#line 429 "trule_yg.y"
	{
		default_action_params |= (yyvsp[(3) - (3)].ival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: ITERATION: iter");
			fprintf(pStamp_m->pLogFP, " [iter = %d, default = 0x%x)]",
				(yyvsp[(3) - (3)].ival), (unsigned)default_action_params);
		  }
		  }
	break;

  case 12:
#line 443 "trule_yg.y"
	{
		default_action_params |= (yyvsp[(3) - (3)].ival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: MODE: feature_op");
			fprintf(pStamp_m->pLogFP, " [feat = %d, default = 0x%x)]",
				(yyvsp[(3) - (3)].ival), (unsigned)default_action_params);
		  }
		  }
	break;

  case 13:
#line 458 "trule_yg.y"
	{
		default_action_params |= (yyvsp[(3) - (3)].ival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: OCP: ocp");
			fprintf(pStamp_m->pLogFP, " [ocp = %d, default = 0x%x)]",
				(yyvsp[(3) - (3)].ival), (unsigned)default_action_params);
		  }
		  }
	break;

  case 14:
#line 473 "trule_yg.y"
	{
		default_domain = (yyvsp[(3) - (3)].dival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: DOMAIN: domain");
			fprintf(pStamp_m->pLogFP,
				" [domain = 0x%lx, default = 0x%x)]", (unsigned long)(yyvsp[(3) - (3)].dival),
			   (unsigned)default_action_params);
		  }
		  }
	break;

  case 15:
#line 489 "trule_yg.y"
	{
		default_cycle = (struct cycle *)NULL;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: CYCLE: none");
		  }
		  }
	break;

  case 16:
#line 498 "trule_yg.y"
	{
		default_cycle = mkcycle(0, (struct domain_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: CYCLE: domain");
			fprintf(pStamp_m->pLogFP, " [0x%lx mkcycle(0, NULL)]",
			   (unsigned long)default_cycle);
		  }
		  }
	break;

  case 17:
#line 515 "trule_yg.y"
	{
		default_cycle = mkcycle((yyvsp[(3) - (3)].ival), (struct domain_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\nDefault: CYCLE: direction");
			fprintf(pStamp_m->pLogFP, " [0x%x mkcycle(%ld, NULL)]", (yyvsp[(3) - (3)].ival),
			   (unsigned long)default_cycle);
		  }
		  }
	break;

  case 18:
#line 531 "trule_yg.y"
	{
		trule->tr_name = duplicateString(ltname);
		trule->tr_params |= OPTIONAL;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone_Rule:=name (optional) %s",
				(unsigned long)trule, "Tone_Rule_Body (set name = ");
			fprintf(pStamp_m->pLogFP, "\"%s\" and optional flag)",
				ltname );
		  }
		  }
	break;

  case 19:
#line 544 "trule_yg.y"
	{
		trule->tr_name = duplicateString(ltname);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone_Rule:=name Tone_Rule_Body %s",
				(unsigned long)trule, "(set name = ");
			fprintf(pStamp_m->pLogFP, "\"%s\")", ltname);
		  }
		  }
	break;

  case 20:
#line 562 "trule_yg.y"
	{
		ltname = strcpy(lstname,(yyvsp[(1) - (1)].cval));    /* save for error messages */
		bForLeftSeen_m  = FALSE;   /* These must be initialized for */
		bForRightSeen_m = FALSE;   /* each test we parse! */
		bLeftSeen_m     = FALSE;
		bRightSeen_m    = FALSE;
		  }
	break;

  case 21:
#line 580 "trule_yg.y"
	{
		trule = mkrule( (yyvsp[(1) - (3)].acval), (yyvsp[(2) - (3)].cyval), (yyvsp[(3) - (3)].cnval) );
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone_Rule_Body:=Rule_Body Rule_End %s",
				 (unsigned long)trule, "Condition ");
			fprintf(pStamp_m->pLogFP,
				"[mkrule(0x%lx, 0x%lx, 0x%lx)]", (unsigned long)(yyvsp[(1) - (3)].acval),
				(unsigned long)(yyvsp[(2) - (3)].cyval), (unsigned long)(yyvsp[(3) - (3)].cnval));
		  }
		  }
	break;

  case 22:
#line 593 "trule_yg.y"
	{
		trule = mkrule( (yyvsp[(1) - (2)].acval), (yyvsp[(2) - (2)].cyval), (struct cond_node *)NULL );
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone_Rule_Body:=Rule_Body Rule_End ",
				(unsigned long)trule);
			fprintf(pStamp_m->pLogFP,
				"[mkrule(0x%lx, 0x%lx, NULL)]", (unsigned long)(yyvsp[(1) - (2)].acval),
				(unsigned long)(yyvsp[(2) - (2)].cyval));
		  }
		  }
	break;

  case 23:
#line 615 "trule_yg.y"
	{
		(yyval.acval) = (yyvsp[(1) - (1)].acval);
		  }
	break;

  case 24:
#line 619 "trule_yg.y"
	{
		(yyval.acval) = link_action((yyvsp[(1) - (3)].acval), (yyvsp[(3) - (3)].acval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Body:=Rule_Body ; Rule_Action ",
				(unsigned long)(yyval.acval));
			fprintf(pStamp_m->pLogFP,
				"[link_action(0x%lx, 0x%lx)]", (unsigned long)(yyvsp[(1) - (3)].acval),
				(unsigned long)(yyvsp[(3) - (3)].acval));
		  }
		  }
	break;

  case 25:
#line 637 "trule_yg.y"
	{
		(yyval.cyval) = (yyvsp[(2) - (3)].cyval);
		  }
	break;

  case 26:
#line 641 "trule_yg.y"
	{
		(yyval.cyval) = default_cycle;
		  }
	break;

  case 27:
#line 651 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (5)].ival), (yyvsp[(2) - (5)].tival), (yyvsp[(3) - (5)].ival), (yyvsp[(4) - (5)].ival), (yyvsp[(5) - (5)].dival), 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone %s",
				(unsigned long)(yyval.acval), "Dir_Iter_Mode OCP Domain");
			fprintf(pStamp_m->pLogFP,
			   "\n\t\t\t[mkaction(%d, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0)]",
			   (yyvsp[(1) - (5)].ival), (unsigned long)(yyvsp[(2) - (5)].tival), (unsigned long)(yyvsp[(3) - (5)].ival), (unsigned long)(yyvsp[(4) - (5)].ival),
			   (unsigned long)(yyvsp[(5) - (5)].dival));
		  }
		  }
	break;

  case 28:
#line 665 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (5)].ival), (yyvsp[(2) - (5)].tival), (yyvsp[(3) - (5)].ival), (yyvsp[(4) - (5)].ival), (yyvsp[(5) - (5)].dival), 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone %s",
				(unsigned long)(yyval.acval), "Dir_Iter_Mode OCP Location");
			fprintf(pStamp_m->pLogFP,
			   "\n\t\t\t[mkaction(%d, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0)]",
			   (yyvsp[(1) - (5)].ival), (unsigned long)(yyvsp[(2) - (5)].tival), (unsigned long)(yyvsp[(3) - (5)].ival), (unsigned long)(yyvsp[(4) - (5)].ival),
			   (unsigned long)(yyvsp[(5) - (5)].dival));
		  }
		  }
	break;

  case 29:
#line 679 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (4)].ival), (yyvsp[(2) - (4)].tival), (yyvsp[(3) - (4)].ival), (yyvsp[(4) - (4)].ival), (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone %s",
				(unsigned long)(yyval.acval), "Dir_Iter_Mode OCP");
			fprintf(pStamp_m->pLogFP,
			   "\n\t\t\t[mkaction(%d, 0x%lx, 0x%lx, 0x%lx, NULL, 0)]",
			   (yyvsp[(1) - (4)].ival), (unsigned long)(yyvsp[(2) - (4)].tival), (unsigned long)(yyvsp[(3) - (4)].ival), (unsigned long)(yyvsp[(4) - (4)].ival));
		  }
		  }
	break;

  case 30:
#line 692 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (4)].ival), (yyvsp[(2) - (4)].tival), (yyvsp[(3) - (4)].ival), 0, (yyvsp[(4) - (4)].dival), 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone %s",
				(unsigned long)(yyval.acval), "Dir_Iter_Mode Domain");
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%lx, 0x%lx, 0, 0x%lx, 0)]",
				(yyvsp[(1) - (4)].ival), (unsigned long)(yyvsp[(2) - (4)].tival), (unsigned long)(yyvsp[(3) - (4)].ival), (unsigned long)(yyvsp[(4) - (4)].dival));
		  }
		  }
	break;

  case 31:
#line 705 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (4)].ival), (yyvsp[(2) - (4)].tival), (yyvsp[(3) - (4)].ival), 0, (yyvsp[(4) - (4)].dival), 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone %s",
				(unsigned long)(yyval.acval), "Dir_Iter_Mode Location");
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%lx, 0x%lx, 0, 0x%lx, 0)]",
				(yyvsp[(1) - (4)].ival), (unsigned long)(yyvsp[(2) - (4)].tival), (unsigned long)(yyvsp[(3) - (4)].ival), (unsigned long)(yyvsp[(4) - (4)].dival));
		  }
		  }
	break;

  case 32:
#line 718 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].tival), (yyvsp[(3) - (3)].ival), 0, (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%lx\tRule_Action:=operation Tone Dir_Iter_Mode",
			   (unsigned long)(yyval.acval));
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%lx, 0x%lx, 0, NULL, 0)]",
				(yyvsp[(1) - (3)].ival), (unsigned long)(yyvsp[(2) - (3)].tival), (unsigned long)(yyvsp[(3) - (3)].ival));
		  }
		  }
	break;

  case 33:
#line 731 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (4)].ival), (yyvsp[(2) - (4)].tival), 0, (yyvsp[(3) - (4)].ival), (yyvsp[(4) - (4)].dival), 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone OCP Domain",
				(unsigned long)(yyval.acval));
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%lx, 0, 0x%lx, 0x%lx, 0)]",
				(yyvsp[(1) - (4)].ival), (unsigned long)(yyvsp[(2) - (4)].tival), (unsigned long)(yyvsp[(3) - (4)].ival), (unsigned long)(yyvsp[(4) - (4)].dival));
		  }
		  }
	break;

  case 34:
#line 744 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (4)].ival), (yyvsp[(2) - (4)].tival), 0, (yyvsp[(3) - (4)].ival), (yyvsp[(4) - (4)].dival), 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone OCP Location",
				(unsigned long)(yyval.acval));
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%lx, 0, 0x%lx, 0x%lx, 0)]",
				(yyvsp[(1) - (4)].ival), (unsigned long)(yyvsp[(2) - (4)].tival), (unsigned long)(yyvsp[(3) - (4)].ival), (unsigned long)(yyvsp[(4) - (4)].dival));
		  }
		  }
	break;

  case 35:
#line 757 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].tival), 0, (yyvsp[(3) - (3)].ival), (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone OCP",
				(unsigned long)(yyval.acval));
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%lx, 0, 0x%lx, NULL, 0)]",
				(yyvsp[(1) - (3)].ival), (unsigned long)(yyvsp[(2) - (3)].tival), (unsigned long)(yyvsp[(3) - (3)].ival));
		  }
		  }
	break;

  case 36:
#line 770 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].tival), 0, 0, (yyvsp[(3) - (3)].dival), 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone Domain",
				(unsigned long)(yyval.acval));
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%lx, 0, 0, 0x%lx, 0)]",
				(yyvsp[(1) - (3)].ival), (unsigned long)(yyvsp[(2) - (3)].tival), (unsigned long)(yyvsp[(3) - (3)].dival));
		  }
		  }
	break;

  case 37:
#line 783 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].tival), 0, 0, (yyvsp[(3) - (3)].dival), 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone Location",
				(unsigned long)(yyval.acval));
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%lx, 0, 0, 0x%lx, 0)]",
				(yyvsp[(1) - (3)].ival), (unsigned long)(yyvsp[(2) - (3)].tival), (unsigned long)(yyvsp[(3) - (3)].dival));
		  }
		  }
	break;

  case 38:
#line 796 "trule_yg.y"
	{
		(yyval.acval) = mkaction((yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].tival), 0, 0, (struct domain_id *)NULL, 0L);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=operation Tone",
				(unsigned long)(yyval.acval));
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, 0x%lx, 0, 0, NULL, 0)]",
				(yyvsp[(1) - (2)].ival), (unsigned long)(yyvsp[(2) - (2)].tival));
		  }
		  }
	break;

  case 39:
#line 819 "trule_yg.y"
	{
		if ((templ = find_edge_cond((yyvsp[(5) - (5)].cval))) == 0)
		   id_error("edge condition", (yyvsp[(5) - (5)].cval));
		(yyval.acval) = mkaction(SET_EDGE_COND, (struct tone_id *)NULL, 0, 0,
				  (struct domain_id *)NULL, templ);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tRule_Action:=set edge condition to COND",
				(unsigned long)(yyval.acval));
			fprintf(pStamp_m->pLogFP,
				"\n\t\t\t[mkaction(%d, NULL, 0, 0, NULL, %ld)]",
				SET_EDGE_COND, templ);
		  }
		  }
	break;

  case 40:
#line 841 "trule_yg.y"
	{
		(yyval.ival) = ASSOCIATE;
		  }
	break;

  case 41:
#line 848 "trule_yg.y"
	{
		(yyval.ival) = DELETE;
		  }
	break;

  case 42:
#line 855 "trule_yg.y"
	{
		(yyval.ival) = DELINK;
		  }
	break;

  case 43:
#line 862 "trule_yg.y"
	{
		(yyval.ival) = INSERT;
		  }
	break;

  case 44:
#line 868 "trule_yg.y"
	{
		(yyval.ival) = LINK;
		  }
	break;

  case 45:
#line 876 "trule_yg.y"
	{
		(yyval.ival) = SPREAD;
		  }
	break;

  case 46:
#line 886 "trule_yg.y"
	{
		(yyval.ival) = FILL_IN;
		  }
	break;

  case 47:
#line 906 "trule_yg.y"
	{
		(yyval.ival) = COPY;
		  }
	break;

  case 48:
#line 916 "trule_yg.y"
	{
		if ((tmp_tone = find_tone_value_list((yyvsp[(3) - (4)].cval))) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", (yyvsp[(3) - (4)].cval));
		(yyval.tival) = mktoneid((yyvsp[(2) - (4)].ival), SINGLE, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=a tone_status TONE tone",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, 0, 0x%lx)]",
				(yyvsp[(2) - (4)].ival), (unsigned long)tmp_tone);
		  }
		  }
	break;

  case 49:
#line 935 "trule_yg.y"
	{
		if ((tmp_tone = find_tone_value_list((yyvsp[(4) - (5)].cval))) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", (yyvsp[(4) - (5)].cval));
		(yyvsp[(2) - (5)].ival) = check_tone_pos((yyvsp[(2) - (5)].ival));
		(yyval.tival) = mktoneid((yyvsp[(3) - (5)].ival), SINGLE, (yyvsp[(2) - (5)].ival), tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=a position tone_status TONE tone",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, %d, 0x%lx)]",
				(yyvsp[(3) - (5)].ival), (yyvsp[(2) - (5)].ival), (unsigned long)tmp_tone);
		  }
		  }
	break;

  case 50:
#line 961 "trule_yg.y"
	{
		(yyval.tival) = mktoneid((yyvsp[(2) - (3)].ival), SINGLE, 0, (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=a tone_status tone",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, 0, NULL)]", (yyvsp[(2) - (3)].ival));
		  }
		  }
	break;

  case 51:
#line 976 "trule_yg.y"
	{
		(yyvsp[(2) - (4)].ival) = check_tone_pos((yyvsp[(2) - (4)].ival));
		(yyval.tival) = mktoneid((yyvsp[(3) - (4)].ival), SINGLE, (yyvsp[(2) - (4)].ival), (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=a position tone_status tone",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, SINGLE, %d, NULL)]", (yyvsp[(3) - (4)].ival), (yyvsp[(2) - (4)].ival));
		  }
		  }
	break;

  case 52:
#line 998 "trule_yg.y"
	{
		if ((tmp_tone = find_tone_value_list((yyvsp[(2) - (3)].cval))) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", (yyvsp[(2) - (3)].cval));
		(yyval.tival) = mktoneid(0, SINGLE, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%lx\tTone:=a TONE tone",
			   (unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, SINGLE, 0, 0x%lx)]",
				(unsigned long)tmp_tone);
		  }
		  }
	break;

  case 53:
#line 1016 "trule_yg.y"
	{
		if ((tmp_tone = find_tone_value_list((yyvsp[(3) - (4)].cval))) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", (yyvsp[(3) - (4)].cval));
		(yyvsp[(2) - (4)].ival) = check_tone_pos((yyvsp[(2) - (4)].ival));
		(yyval.tival) = mktoneid(0, SINGLE, (yyvsp[(2) - (4)].ival), tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=a position TONE tone",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, SINGLE, %d, 0x%lx)]",
				(yyvsp[(2) - (4)].ival), (unsigned long)tmp_tone);
		  }
		  }
	break;

  case 54:
#line 1042 "trule_yg.y"
	{
		if ((tmp_tone = find_tone_value_list((yyvsp[(2) - (3)].cval))) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", (yyvsp[(2) - (3)].cval));
		(yyval.tival) = mktoneid((yyvsp[(1) - (3)].ival), PLURAL, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=tone_status TONE tones",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, 0, 0x%lx)]",
				(yyvsp[(1) - (3)].ival), (unsigned long)tmp_tone);
		  }
		  }
	break;

  case 55:
#line 1061 "trule_yg.y"
	{
		if ((tmp_tone = find_tone_value_list((yyvsp[(3) - (4)].cval))) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", (yyvsp[(3) - (4)].cval));
		(yyvsp[(1) - (4)].ival) = check_tone_pos((yyvsp[(1) - (4)].ival));
		(yyval.tival) = mktoneid((yyvsp[(2) - (4)].ival), PLURAL, (yyvsp[(1) - (4)].ival), tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=position tone_status TONE tones",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, %d, 0x%lx)]",
				(yyvsp[(2) - (4)].ival), (yyvsp[(1) - (4)].ival), (unsigned long)tmp_tone);
		  }
		  }
	break;

  case 56:
#line 1083 "trule_yg.y"
	{
		(yyval.tival) = mktoneid((yyvsp[(1) - (2)].ival), PLURAL, 0, (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=tone_status tones",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, 0, NULL)]", (yyvsp[(1) - (2)].ival));
		  }
		  }
	break;

  case 57:
#line 1099 "trule_yg.y"
	{
		(yyvsp[(1) - (3)].ival) = check_tone_pos((yyvsp[(1) - (3)].ival));
		(yyval.tival) = mktoneid((yyvsp[(2) - (3)].ival), PLURAL, (yyvsp[(1) - (3)].ival), (struct tone_value_list *)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=position tone_status tones",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(%d, PLURAL, %d, NULL)]", (yyvsp[(2) - (3)].ival), (yyvsp[(1) - (3)].ival));
		  }
		  }
	break;

  case 58:
#line 1118 "trule_yg.y"
	{
		if ((tmp_tone = find_tone_value_list((yyvsp[(1) - (2)].cval))) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", (yyvsp[(1) - (2)].cval));
		(yyval.tival) = mktoneid(0, PLURAL, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%lx\tTone:=TONE tones",
			   (unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, PLURAL, 0, 0x%lx)]",
				(unsigned long)tmp_tone);
		  }
		  }
	break;

  case 59:
#line 1136 "trule_yg.y"
	{
		if ((tmp_tone = find_tone_value_list((yyvsp[(2) - (3)].cval))) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", (yyvsp[(2) - (3)].cval));
		(yyvsp[(1) - (3)].ival) = check_tone_pos((yyvsp[(1) - (3)].ival));
		(yyval.tival) = mktoneid(0, PLURAL, (yyvsp[(1) - (3)].ival), tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=position TONE tones",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, SINGLE, %d, 0x%lx)]",
				(yyvsp[(1) - (3)].ival), (unsigned long)tmp_tone);
		  }
		  }
	break;

  case 60:
#line 1158 "trule_yg.y"
	{
		if ((tmp_tone = find_tone_value_list((yyvsp[(2) - (3)].cval))) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", (yyvsp[(2) - (3)].cval));
		(yyval.tival) = mktoneid(0, DEFAULT, 0, tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=default TONE tone",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, DEFAULT, 0, 0x%lx)]",
				(unsigned long)tmp_tone);
		  }
		  }
	break;

  case 61:
#line 1175 "trule_yg.y"
	{
		if ((tmp_tone = find_tone_value_list((yyvsp[(3) - (4)].cval))) ==
										(struct tone_value_list *)NULL)
		   id_error("tone", (yyvsp[(3) - (4)].cval));
		(yyvsp[(1) - (4)].ival) = check_tone_pos((yyvsp[(1) - (4)].ival));
		(yyval.tival) = mktoneid(0, DEFAULT, (yyvsp[(1) - (4)].ival), tmp_tone);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone:=position default TONE tone",
				(unsigned long)(yyval.tival));
			fprintf(pStamp_m->pLogFP,
				" [mktoneid(0, DEFAULT, %d, 0x%lx)]",
				(yyvsp[(1) - (4)].ival), (unsigned long)tmp_tone);
		  }
		  }
	break;

  case 62:
#line 1202 "trule_yg.y"
	{
		(yyval.ival) = (yyvsp[(1) - (2)].ival) + (yyvsp[(2) - (2)].ival);
		  }
	break;

  case 63:
#line 1206 "trule_yg.y"
	{
		(yyval.ival) = (yyvsp[(1) - (1)].ival);
		  }
	break;

  case 64:
#line 1217 "trule_yg.y"
	{
		(yyval.ival) = (yyvsp[(1) - (2)].ival) + (yyvsp[(2) - (2)].ival);
		  }
	break;

  case 65:
#line 1221 "trule_yg.y"
	{
		(yyval.ival) = (yyvsp[(1) - (1)].ival);
		  }
	break;

  case 66:
#line 1225 "trule_yg.y"
	{
		(yyval.ival) = (yyvsp[(1) - (1)].ival);
		  }
	break;

  case 67:
#line 1234 "trule_yg.y"
	{
		(yyval.ival) = LEFTWARD;
		  }
	break;

  case 68:
#line 1238 "trule_yg.y"
	{
		(yyval.ival) = RIGHTWARD;
		  }
	break;

  case 69:
#line 1248 "trule_yg.y"
	{
		(yyval.ival) = NONITERATIVELY;
		  }
	break;

  case 70:
#line 1254 "trule_yg.y"
	{
		(yyval.ival) = ITERATIVELY;
		  }
	break;

  case 71:
#line 1266 "trule_yg.y"
	{
		(yyval.ival) = EDGE_IN;
		  }
	break;

  case 72:
#line 1286 "trule_yg.y"
	{
		(yyval.ival) = ONE_TO_ONE;
		  }
	break;

  case 73:
#line 1296 "trule_yg.y"
	{
		(yyval.ival) = (yyvsp[(2) - (3)].ival);
		  }
	break;

  case 74:
#line 1306 "trule_yg.y"
	{
		(yyval.ival) = FEATURE_ADDING;
		  }
	break;

  case 75:
#line 1314 "trule_yg.y"
	{
		(yyval.ival) = FEATURE_CHANGING;
		  }
	break;

  case 76:
#line 1321 "trule_yg.y"
	{
		(yyval.ival) = FEATURE_FILLING;
		  }
	break;

  case 77:
#line 1331 "trule_yg.y"
	{
		(yyval.ival) = (yyvsp[(2) - (2)].ival);
		  }
	break;

  case 78:
#line 1342 "trule_yg.y"
	{
		(yyval.ival) = OPTIONAL_OCP_BLOCKAGE;
		  }
	break;

  case 79:
#line 1349 "trule_yg.y"
	{
		(yyval.ival) = OCP_BLOCKAGE;
		  }
	break;

  case 80:
#line 1356 "trule_yg.y"
	{
		(yyval.ival) = OCP_IGNORED;
		  }
	break;

  case 81:
#line 1363 "trule_yg.y"
	{
		(yyval.ival) = OCP_MERGER;
		  }
	break;

  case 82:
#line 1374 "trule_yg.y"
	{
		(yyval.dival) = (yyvsp[(3) - (3)].dival);
		(yyval.dival)->di_edge = (yyvsp[(2) - (3)].ival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%lx\tDomain:=within edge entity", (unsigned long)(yyval.dival));
			fprintf(pStamp_m->pLogFP, " (set edge = %d)", (yyvsp[(2) - (3)].ival));
		  }
		  }
	break;

  case 83:
#line 1385 "trule_yg.y"
	{
		(yyval.dival) = (yyvsp[(2) - (2)].dival);
		(yyval.dival)->di_edge = 0;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tDomain:=within entity", (unsigned long)(yyval.dival));
			fprintf(pStamp_m->pLogFP, " (set edge = 0)");
		  }
		  }
	break;

  case 84:
#line 1402 "trule_yg.y"
	{
		(yyval.dival) = (yyvsp[(3) - (3)].dival);
		(yyval.dival)->di_edge = (yyvsp[(2) - (3)].ival);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%lx\tLocation:=within edge location", (unsigned long)(yyval.dival));
			fprintf(pStamp_m->pLogFP, " (set edge = %d)", (yyvsp[(2) - (3)].ival));
		  }
		  }
	break;

  case 85:
#line 1413 "trule_yg.y"
	{
		(yyval.dival) = (yyvsp[(2) - (2)].dival);
		(yyval.dival)->di_edge = 0;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tLocation:=within location", (unsigned long)(yyval.dival));
			fprintf(pStamp_m->pLogFP, " (set edge = 0)");
		  }
		  }
	break;

  case 86:
#line 1431 "trule_yg.y"
	{
		(yyval.ival) = LEFT_EDGE;
		  }
	break;

  case 87:
#line 1435 "trule_yg.y"
	{
		(yyval.ival) = RIGHT_EDGE;
		  }
	break;

  case 88:
#line 1443 "trule_yg.y"
	{
		if ((temp = find_tone_domain((yyvsp[(1) - (2)].cval))) == 0)
		   id_error("domain", (yyvsp[(1) - (2)].cval));
		(yyval.dival) = mkdomainid(DI_DOMAIN, temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tentity:=DOMAIN domain", (unsigned long)(yyval.dival));
			fprintf(pStamp_m->pLogFP,
				" [mkdomainid(%d, %d)]", DI_DOMAIN, temp);
		  }
		  }
	break;

  case 89:
#line 1456 "trule_yg.y"
	{
		(yyval.dival) = mkdomainid(DI_MORPHEME, 0);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tentity:=morpheme", (unsigned long)(yyval.dival));
			fprintf(pStamp_m->pLogFP,
				" [mkdomainid(%d, 0)]", DI_MORPHEME);
		  }
		  }
	break;

  case 90:
#line 1467 "trule_yg.y"
	{
		(yyval.dival) = mkdomainid(DI_WORD, 0);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tentity:=word", (unsigned long)(yyval.dival));
			fprintf(pStamp_m->pLogFP, " [mkdomainid(%d, 0)]", DI_WORD);
		  }
		  }
	break;

  case 91:
#line 1482 "trule_yg.y"
	{
		(yyval.dival) = mkdomainid(DI_SYLLABLE, (yyvsp[(1) - (4)].ival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tlocation:=word_position syllable",
				(unsigned long)(yyval.dival));
			fprintf(pStamp_m->pLogFP,
				" [mkdomainid(%d, %d)]", DI_SYLLABLE, 0);
		  }
		  }
	break;

  case 92:
#line 1494 "trule_yg.y"
	{
		(yyval.dival) = mkdomainid(DI_TBU, (yyvsp[(1) - (4)].ival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tlocation:=word_position tbu",
				(unsigned long)(yyval.dival));
			fprintf(pStamp_m->pLogFP,
				" [mkdomainid(%d, 0)]", DI_TBU);
		  }
		  }
	break;

  case 93:
#line 1511 "trule_yg.y"
	{
		(yyval.cyval) = mkcycle((yyvsp[(3) - (5)].ival), (yyvsp[(5) - (5)].dlval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tCycle:=applies cyclically direction %s",
				(unsigned long)(yyval.cyval), "within Domain_cycle");
			fprintf(pStamp_m->pLogFP,
				" [mkcycle(%d, 0x%lx)]", (yyvsp[(3) - (5)].ival), (unsigned long)(yyvsp[(5) - (5)].dlval));
		  }
		  }
	break;

  case 94:
#line 1525 "trule_yg.y"
	{
		(yyval.cyval) = mkcycle((yyvsp[(3) - (3)].ival), (struct domain_list*)NULL);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tCycle:=applies cyclically direction",
				(unsigned long)(yyval.cyval));
			fprintf(pStamp_m->pLogFP, " [mkcycle(%d, NULL)]", (yyvsp[(3) - (3)].ival));
		  }
		  }
	break;

  case 95:
#line 1538 "trule_yg.y"
	{
		(yyval.cyval) = mkcycle(0, (yyvsp[(4) - (4)].dlval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tCycle:=applies cyclically %s",
				(unsigned long)(yyval.cyval), "within Domain_cycle");
			fprintf(pStamp_m->pLogFP,
				" [mkcycle(0, 0x%lx)]", (unsigned long)(yyvsp[(4) - (4)].dlval));
		  }
		  }
	break;

  case 96:
#line 1555 "trule_yg.y"
	{
		if ((temp = find_tone_domain((yyvsp[(1) - (2)].cval))) == 0)
		   id_error("domain", (yyvsp[(1) - (2)].cval));
		(yyval.dlval) = mkdomainlist(temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%lx\tDomain_cycle:=DOMAIN domain",(unsigned long)(yyval.dlval));
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
		  }
		  }
	break;

  case 97:
#line 1567 "trule_yg.y"
	{
		(yyval.dlval) = (yyvsp[(1) - (2)].dlval);
		  }
	break;

  case 98:
#line 1575 "trule_yg.y"
	{
		(yyval.dlval) = (yyvsp[(1) - (1)].dlval);
		  }
	break;

  case 99:
#line 1579 "trule_yg.y"
	{
		(yyval.dlval) = link_domain_list((yyvsp[(1) - (2)].dlval), (yyvsp[(2) - (2)].dlval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tMulti_domains:=More_domains Two_domains",
				(unsigned long)(yyval.dlval));
			fprintf(pStamp_m->pLogFP,
				" [link_domain_list(0x%lx, 0x%lx)]",
				(unsigned long)(yyvsp[(1) - (2)].dlval), (unsigned long)(yyvsp[(2) - (2)].dlval));
		  }
		  }
	break;

  case 100:
#line 1596 "trule_yg.y"
	{
		if ((temp = find_tone_domain((yyvsp[(1) - (3)].cval))) == 0)
		   id_error("domain", (yyvsp[(1) - (3)].cval));
		if ((temp2 = find_tone_domain((yyvsp[(3) - (3)].cval))) == 0)
		   id_error("domain", (yyvsp[(3) - (3)].cval));
		tmp_dl  = mkdomainlist(temp);
		tmp_dl2 = mkdomainlist(temp2);
		(yyval.dlval) = link_domain_list(tmp_dl, tmp_dl2);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTwo_domains:=DOMAIN and DOMAIN",
				(unsigned long)(yyval.dlval));
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp2);
			fprintf(pStamp_m->pLogFP,
				" [link_domain_list(0x%lx, 0x%lx)]",
				(unsigned long)tmp_dl, (unsigned long)tmp_dl2);
		  }
		  }
	break;

  case 101:
#line 1621 "trule_yg.y"
	{
		if ((temp = find_tone_domain((yyvsp[(2) - (3)].cval))) == 0)
		   id_error("domain", (yyvsp[(2) - (3)].cval));
		tmp_dl = mkdomainlist(temp);
		(yyval.dlval) = link_domain_list((yyvsp[(1) - (3)].dlval), tmp_dl);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tMore_domains:=More_domains DOMAIN ,",
				(unsigned long)(yyval.dlval));
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
			fprintf(pStamp_m->pLogFP,
				" [link_domain_list(0x%lx, 0x%lx)]",
				(unsigned long)(yyvsp[(1) - (3)].dlval), (unsigned long)tmp_dl);
		  }
		  }
	break;

  case 102:
#line 1638 "trule_yg.y"
	{
		if ((temp = find_tone_domain((yyvsp[(1) - (2)].cval))) == 0)
		   id_error("domain", (yyvsp[(1) - (2)].cval));
		(yyval.dlval) = mkdomainlist(temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%lx\tMore_domains:=DOMAIN ,",
				(unsigned long)(yyval.dlval));
			fprintf(pStamp_m->pLogFP, " [mkdomainlist(%d)]", temp);
		  }
		  }
	break;

  case 103:
#line 1654 "trule_yg.y"
	{
		(yyval.cnval) = (yyvsp[(3) - (3)].cnval);
		  }
	break;

  case 104:
#line 1663 "trule_yg.y"
	{
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%lx\tCondition_Body:=Factor [0x%lx]",
			  (unsigned long)(yyval.cnval), (unsigned long)(yyvsp[(1) - (1)].cnval));
		  }
	break;

  case 105:
#line 1670 "trule_yg.y"
	{
		(yyval.cnval) = mknode((yyvsp[(2) - (3)].ival), (yyvsp[(1) - (3)].cnval), (yyvsp[(3) - (3)].cnval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tCondition_Body:=Condition_Body logop %s",
				(unsigned long)(yyval.cnval), "Factor ");
			fprintf(pStamp_m->pLogFP,
				"[mknode(%u, 0x%lx, 0x%lx)]", (unsigned)(yyvsp[(2) - (3)].ival),
				(unsigned long)(yyvsp[(1) - (3)].cnval), (unsigned long)(yyvsp[(3) - (3)].cnval));
		  }
		  }
	break;

  case 106:
#line 1683 "trule_yg.y"
	{
		(yyval.cnval) = mknode( LOGIF, (yyvsp[(2) - (4)].cnval), (yyvsp[(4) - (4)].cnval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tIF factor THEN factor", (unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, "[mknode(%d, 0x%lx, 0x%lx)]",
				LOGIF, (unsigned long)(yyvsp[(2) - (4)].cnval), (unsigned long)(yyvsp[(4) - (4)].cnval));
		  }
		  }
	break;

  case 107:
#line 1694 "trule_yg.y"
	{
		if (bForLeftSeen_m == TRUE)
		  {
			if (pStamp_m->pLogFP != NULL)
			  fprintf(pStamp_m->pLogFP,
				  "%s contains more than one leftward iteration\n",
				  ltname );
		  }
		if (bLeftSeen_m == FALSE)
		  {
			if (pStamp_m->pLogFP != NULL)
			  fprintf(pStamp_m->pLogFP,
				  "%s contains a leftward iteration without a LEFT\n",
				  ltname );
		  }
		bForLeftSeen_m = TRUE;
		(yyval.cnval) = mknode( (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].cnval), (struct cond_node *)NULL);
		  }
	break;

  case 108:
#line 1713 "trule_yg.y"
	{
		if (bForRightSeen_m == TRUE)
		  {
			if (pStamp_m->pLogFP != NULL)
			  fprintf(pStamp_m->pLogFP,
				  "%s contains more than one rightward iteration\n",
				  ltname );
		  }
		if (bRightSeen_m == FALSE)
		  {
			if (pStamp_m->pLogFP != NULL)
			  fprintf(pStamp_m->pLogFP,
				  "%s contains a rightward iteration without a RIGHT\n",
				  ltname );
		  }
		bForRightSeen_m = TRUE;
		(yyval.cnval) = mknode( (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].cnval), (struct cond_node *)NULL);
		  }
	break;

  case 109:
#line 1735 "trule_yg.y"
	{
	(yyval.ival) = ALL_LEFT;
	}
	break;

  case 110:
#line 1739 "trule_yg.y"
	{
	(yyval.ival) = SOME_LEFT;
	}
	break;

  case 111:
#line 1746 "trule_yg.y"
	{
	(yyval.ival) = ALL_RIGHT;
	}
	break;

  case 112:
#line 1750 "trule_yg.y"
	{
	(yyval.ival) = SOME_RIGHT;
	}
	break;

  case 113:
#line 1757 "trule_yg.y"
	{
		(yyval.cnval) = (yyvsp[(2) - (2)].cnval);
				(yyval.cnval)->cn_opcode ^= OP_NOT;
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			 "\n0x%lx\tFactor:=NOT Factor (set flag for node 0x%lx)",
			  (unsigned long)(yyval.cnval), (unsigned long)(yyval.cnval));
		  }
	break;

  case 114:
#line 1767 "trule_yg.y"
	{
		(yyval.cnval) = (yyvsp[(2) - (3)].cnval);
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%lx\tFactor:='(' Condition_Body ')' [0x%lx]",
			  (unsigned long)(yyval.cnval), (unsigned long)(yyvsp[(2) - (3)].cnval));
		  }
	break;

  case 115:
#line 1775 "trule_yg.y"
	{
		(yyval.cnval) = (yyvsp[(1) - (1)].cnval);
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%lx\tFactor:=Edge_expr [0x%lx]",
			  (unsigned long)(yyval.cnval), (unsigned long)(yyvsp[(1) - (1)].cnval));
		  }
	break;

  case 116:
#line 1783 "trule_yg.y"
	{
		(yyval.cnval) = (yyvsp[(1) - (1)].cnval);
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
			  "\n0x%lx\tFactor:=Morpheme_expr [0x%lx]",
			  (unsigned long)(yyval.cnval), (unsigned long)(yyvsp[(1) - (1)].cnval));
		  }
	break;

  case 117:
#line 1800 "trule_yg.y"
	{
		(yyval.cnval) = (yyvsp[(1) - (1)].cnval);
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%lx\tFactor:=Prosodic_expr [0x%lx]",
			  (unsigned long)(yyval.cnval), (unsigned long)(yyvsp[(1) - (1)].cnval));
		  }
	break;

  case 118:
#line 1808 "trule_yg.y"
	{
		(yyval.cnval) = (yyvsp[(1) - (1)].cnval);
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP,
			  "\n0x%lx\tFactor:=Segment_expr [0x%lx]",
			  (unsigned long)(yyval.cnval), (unsigned long)(yyvsp[(1) - (1)].cnval));
		  }
	break;

  case 119:
#line 1816 "trule_yg.y"
	{
		(yyval.cnval) = (yyvsp[(1) - (1)].cnval);
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP, "\n0x%lx\tFactor:=Tbu_expr [0x%lx]",
			 (unsigned long)(yyval.cnval), (unsigned long)(yyvsp[(1) - (1)].cnval));
		  }
	break;

  case 120:
#line 1823 "trule_yg.y"
	{
		(yyval.cnval) = (yyvsp[(1) - (1)].cnval);
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP, "\n0x%lx\tFactor:=Tone_expr [0x%lx]",
			 (unsigned long)(yyval.cnval), (unsigned long)(yyvsp[(1) - (1)].cnval));
		  }
	break;

  case 121:
#line 1830 "trule_yg.y"
	{
		(yyval.cnval) = (yyvsp[(1) - (1)].cnval);
		if (rule_debug)
		  fprintf(pStamp_m->pLogFP, "\n0x%lx\tFactor:=Type_expr [0x%lx]",
			 (unsigned long)(yyval.cnval), (unsigned long)(yyvsp[(1) - (1)].cnval));
		  }
	break;

  case 122:
#line 1840 "trule_yg.y"
	{
		if ((templ = find_edge_cond((yyvsp[(4) - (4)].cval))) == 0L)
		  id_error("edge condition", (yyvsp[(4) - (4)].cval));
		(yyval.cnval) = mklfli(EDGE_COND_IS, 0, templ);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tEdge_expr:=edge condition is EDGE_COND ",
				(unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, "[mklfli(%d, 0, %ld)]",
				EDGE_COND_IS, templ);
		  }
		  }
	break;

  case 123:
#line 1859 "trule_yg.y"
	{
		if ((temp = findAmpleCategoryNumber((yyvsp[(4) - (4)].cval), pStamp_m->pCategories)) == 0)
			id_error("category", (yyvsp[(4) - (4)].cval));
		(yyval.cnval) = mklfi(CATEGORY_IS, (yyvsp[(1) - (4)].ival), temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tMorpheme_expr:=position category is %s",
			   (unsigned long)(yyval.cnval), "CATEGORY");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d \"%s\")]",
				CATEGORY_IS, (yyvsp[(1) - (4)].ival), temp, (yyvsp[(4) - (4)].cval));
		  }
		  }
	break;

  case 124:
#line 1876 "trule_yg.y"
	{
		if ((tmp_ccp = findAmpleCategClass((yyvsp[(5) - (5)].cval), pStamp_m->pCategClasses)) ==
											(AmpleCategoryClass *)NULL)
			id_error("category class", (yyvsp[(5) - (5)].cval));
		(yyval.cnval) = mklfcc(CATEGORY_MEMBER, (yyvsp[(1) - (5)].ival), tmp_ccp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tMorpheme_expr:=position category is %s",
				(unsigned long)(yyval.cnval), "member CATEGORY_CLASS ");
			fprintf(pStamp_m->pLogFP,
				"[mklfcc(%d, %d, 0x%lx \"%s\")]", CATEGORY_MEMBER,
				(yyvsp[(1) - (5)].ival), (unsigned long)tmp_ccp, (yyvsp[(5) - (5)].cval));
		  }
		  }
	break;

  case 125:
#line 1895 "trule_yg.y"
	{
		(yyval.cnval) = mklfs(MORPH_IS, (yyvsp[(1) - (4)].ival), duplicateString((yyvsp[(4) - (4)].cval)));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tMorpheme_expr:=position morphname is %s",
				(unsigned long)(yyval.cnval), "MORPHNAME ");
			fprintf(pStamp_m->pLogFP,
				"[mklfs(%d, %d, \"%s\")]", MORPH_IS, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].cval) );
		  }
		  }
	break;

  case 126:
#line 1909 "trule_yg.y"
	{
		if ((tmp_mcp = findAmpleMorphClass((yyvsp[(5) - (5)].cval), pStamp_m->pMorphClasses)) ==
											   (AmpleMorphClass *)NULL)
			id_error("morpheme class", (yyvsp[(5) - (5)].cval));
				(yyval.cnval) = mklfmc(MORPH_MEMBER, (yyvsp[(1) - (5)].ival), tmp_mcp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tMorpheme_expr:=position morphname is %s",
				(unsigned long)(yyval.cnval), "member MORPHCLASS ");
			fprintf(pStamp_m->pLogFP,
				"[mklfmc(%d, %d, 0x%lx \"%s\")]", MORPH_MEMBER,
				(yyvsp[(1) - (5)].ival), (unsigned long)tmp_mcp, (yyvsp[(5) - (5)].cval) );
		  }
		  }
	break;

  case 127:
#line 1928 "trule_yg.y"
	{
		if ((tmp_prop = findAmplePropertyNumber((yyvsp[(4) - (4)].cval), &pStamp_m->sProperties)) == 0)
		   id_error("property", (yyvsp[(4) - (4)].cval));
		(yyval.cnval) = mklflg(PROP_IS, (yyvsp[(1) - (4)].ival), tmp_prop);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tMorpheme_expr:=position property is %s",
				(unsigned long)(yyval.cnval), "PROPERTY ");
			fprintf(pStamp_m->pLogFP,
				"[mklflg(%d, %d, 0x%08x \"%s\")]", PROP_IS, (yyvsp[(1) - (4)].ival),
				tmp_prop, (yyvsp[(4) - (4)].cval) );
		  }
		  }
	break;

  case 128:
#line 1948 "trule_yg.y"
	{
				(yyval.cnval) = mklfi(SYLLABLE_HAS, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].ival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tProsodic_expr:=position syllable has %s",
				(unsigned long)(yyval.cnval), "ONSET/CODA ");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]",
				SYLLABLE_HAS, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].ival));
		  }
		  }
	break;

  case 129:
#line 1963 "trule_yg.y"
	{
				(yyval.cnval) = mklfi(MORPH_PROSODY, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].ival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tProsodic_expr:=position morpheme is %s",
				(unsigned long)(yyval.cnval), "PROSODY ");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]",
				MORPH_PROSODY, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].ival));
		  }
		  }
	break;

  case 130:
#line 1980 "trule_yg.y"
	{
		(yyval.cnval) = mklfs(SEGMENT_IS, (yyvsp[(1) - (4)].ival), duplicateString((yyvsp[(4) - (4)].cval)));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tSegment_expr:=position segment is %s",
				(unsigned long)(yyval.cnval), "SEGMENT ");
			fprintf(pStamp_m->pLogFP,
				"[mklfs(%d, %d, \"%s\")]", SEGMENT_IS, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].cval) );
		  }
		  }
	break;

  case 131:
#line 1994 "trule_yg.y"
	{
		if ((tmp_scp = findStringClass((yyvsp[(5) - (5)].cval), pStamp_m->pStringClasses))
			== (StringClass *)NULL)
			id_error("string class", (yyvsp[(5) - (5)].cval));
				(yyval.cnval) = mklfsc(SEGMENT_MEMBER, (yyvsp[(1) - (5)].ival), tmp_scp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tSegment_expr:=position segment is %s",
				(unsigned long)(yyval.cnval), "member STRINGCLASS ");
			fprintf(pStamp_m->pLogFP, "[mklfsc(%d, %d, 0x%lx \"%s\")]",
				SEGMENT_MEMBER,
				(yyvsp[(1) - (5)].ival), (unsigned long)tmp_scp, (yyvsp[(5) - (5)].cval) );
		  }
		  }
	break;

  case 132:
#line 2016 "trule_yg.y"
	{
				(yyval.cnval) = mklfdi(TBU_DOMAIN, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].dival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTbu_expr:=position tbu is DOMAIN ",
				(unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, "[mklfdi(%d, %d, 0x%lx)]",
				TBU_DOMAIN, (yyvsp[(1) - (4)].ival),
				(unsigned long)(yyvsp[(4) - (4)].dival));
		  }
		  }
	break;

  case 133:
#line 2032 "trule_yg.y"
	{
				(yyval.cnval) = mklfi(TBU_EXTRAMET, (yyvsp[(1) - (4)].ival), 0);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTbu_expr:=position tbu is extrametrical ",
				(unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, 0)]",
				TBU_EXTRAMET, (yyvsp[(1) - (4)].ival));
		  }
		  }
	break;

  case 134:
#line 2048 "trule_yg.y"
	{
				(yyval.cnval) = mklfti(TBU_HAS, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].tival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTbu_expr:=position tbu has TONE ",
				(unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%lx)]",
				TBU_HAS, (yyvsp[(1) - (4)].ival), (unsigned long)(yyvsp[(4) - (4)].tival));
		  }
		  }
	break;

  case 135:
#line 2069 "trule_yg.y"
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
				(yyval.cnval) = mklfti(TBU_NUMBER, (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].tival));
		(yyval.cnval)->cn_tbu_num = temp;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%lx\tTbu_expr:=position morpheme tbu NUMBER %s",
			   (unsigned long)(yyval.cnval), "has TONE ");
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%lx)]",
				TBU_NUMBER, (yyvsp[(1) - (6)].ival), (unsigned long)(yyvsp[(4) - (6)].cval));
			fprintf(pStamp_m->pLogFP, " and set tbu num = %d]", temp);
		  }
		  }
	break;

  case 136:
#line 2103 "trule_yg.y"
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
				(yyval.cnval) = mklfti(TBU_UNDER_NUMBER, (yyvsp[(1) - (7)].ival), (yyvsp[(7) - (7)].tival));
		(yyval.cnval)->cn_tbu_num = temp;
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%lx\tTbu_expr:=position morpheme underlying %s",
			   (unsigned long)(yyval.cnval), " tbu NUMBER has TONE ");
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%lx)]",
				TBU_UNDER_NUMBER, (yyvsp[(1) - (7)].ival),
			   (unsigned long)(yyvsp[(7) - (7)].tival));
			fprintf(pStamp_m->pLogFP, " and set tbu num = %d]", temp);
		  }
		  }
	break;

  case 137:
#line 2137 "trule_yg.y"
	{
		temp = atoi((yyvsp[(4) - (5)].cval));	/* convert identifier to integer */
		cp = (yyvsp[(4) - (5)].cval);		/* check for valid digit sequence */
		while (*cp != NUL)	/* should be digits */
		  {
			if (!isdigit(*cp++) &&
			pStamp_m->pLogFP != NULL)
			  {			/* found a non-digit; report error */
			fprintf(pStamp_m->pLogFP, "%s %s constant %s %s",
				tsterrhead, ltname, (yyvsp[(4) - (5)].cval),
				   "in tbu expression is not a number.");
			fprintf(pStamp_m->pLogFP,
				   "\n%19sWill use the value %d for it", " ",temp);
			break;
			  }
		  }
				(yyval.cnval) = mklfi(MORPH_HAS_N_TBUS, (yyvsp[(1) - (5)].ival), temp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%lx\tTbu_expr:=position morpheme has NUMBER %s",
			   (unsigned long)(yyval.cnval), "tbus ");
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]",
				MORPH_HAS_N_TBUS, (yyvsp[(1) - (5)].ival), temp);
		  }
		  }
	break;

  case 138:
#line 2169 "trule_yg.y"
	{
				(yyval.cnval) = mklfti(TONE_IS, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].tival));
#ifdef B4_0_4_11
		if ((default_tone_params & CYCLIC) &&
			((yyvsp[(1) - (4)].ival) == ARGCURRENT ||
			 (yyvsp[(1) - (4)].ival) == ARGLEFT    ||
			 (yyvsp[(1) - (4)].ival) == ARGRIGHT) &&
			pStamp_m->pLogFP != NULL)
		  {
			fprintf(pStamp_m->pLogFP, "%s %s ", tsterrhead, ltname);
			fprintf(pStamp_m->pLogFP,
				"has a '%s tone is' condition in a cyclic rule.",
			   ((yyvsp[(1) - (4)].ival) == ARGCURRENT ? "current"
								 : ((yyvsp[(1) - (4)].ival) == ARGLEFT ? "left"
												  : "right")));
			fprintf(pStamp_m->pLogFP,
			   "\n%19sThe condition will probably not work.", " ");
		  }
#else
		if ((default_tone_params & CYCLIC) &&
			(yyvsp[(1) - (4)].ival) == ARGCURRENT &&
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
				"\n0x%lx\tTone_expr:=position tone is TONE ",
			   (unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, "[mklfti(%d, %d, 0x%lx)]",
				TONE_IS, (yyvsp[(1) - (4)].ival),
			   (unsigned long)(yyvsp[(4) - (4)].tival));
		  }
		  }
	break;

  case 139:
#line 2217 "trule_yg.y"
	{
		if ((yyvsp[(2) - (5)].ival) != (yyvsp[(5) - (5)].tival)->ti_status &&
			pStamp_m->pLogFP != NULL)
		  {
			fprintf(pStamp_m->pLogFP,
			   "%s %s tone status inconsistency (%s is not %s) %s",
			   tsterrhead, ltname, tone_type_name((yyvsp[(2) - (5)].ival)),
			   tone_type_name((yyvsp[(5) - (5)].tival)->ti_status),
				   "in 'pos tone_status tone is TONE' condition.");
			fprintf(pStamp_m->pLogFP,
				"\n%19sWill use %s for both.", " ",
				tone_type_name((yyvsp[(5) - (5)].tival)->ti_status));
		  }
				(yyval.cnval) = mklfti(TONESTATUS_TONE_IS, (yyvsp[(1) - (5)].ival), (yyvsp[(5) - (5)].tival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%lx\tTone_expr:=position tonestatus tone is %s",
			   (unsigned long)(yyval.cnval), "TONE");
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%lx)]",
				TONESTATUS_TONE_IS, (yyvsp[(1) - (5)].ival),
			   (unsigned long)(yyvsp[(5) - (5)].tival));
		  }
		  }
	break;

  case 140:
#line 2261 "trule_yg.y"
	{
				(yyval.cnval) = mklfti(MORPH_TONE_IS, (yyvsp[(1) - (5)].ival), (yyvsp[(5) - (5)].tival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%lx\tTone_expr:=position morpheme tone is TONE",
			   (unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%lx)]",
				MORPH_TONE_IS, (yyvsp[(1) - (5)].ival),
			   (unsigned long)(yyvsp[(5) - (5)].tival));
		  }
		  }
	break;

  case 141:
#line 2276 "trule_yg.y"
	{
				(yyval.cnval) = mklfti(MORPH_UL_TONE_IS, (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].tival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone_expr:=position morpheme underlying ",
				(unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, "tone is TONE");
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%lx)]",
				MORPH_UL_TONE_IS, (yyvsp[(1) - (6)].ival),
			   (unsigned long)(yyvsp[(6) - (6)].tival));
		  }
		  }
	break;

  case 142:
#line 2292 "trule_yg.y"
	{
				(yyval.cnval) = mklftp(TONE_PATTERN_IS, (yyvsp[(1) - (5)].ival), (yyvsp[(5) - (5)].tpval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone_expr:=position tone pattern is %s",
				(unsigned long)(yyval.cnval), "TONEPATTERN ");
			fprintf(pStamp_m->pLogFP,
				"[mklftp(%d, %d, 0x%lx)]", TONE_PATTERN_IS, (yyvsp[(1) - (5)].ival),
				(unsigned long)(yyvsp[(5) - (5)].tpval));
		  }
		  }
	break;

  case 143:
#line 2312 "trule_yg.y"
	{
				(yyval.cnval) = mklftp(MORPH_TONE_PAT_IS, (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].tpval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
			   "\n0x%lx\tTone_expr:=position morpheme tone pattern",
			   (unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, "is TONEPATTERN");
			fprintf(pStamp_m->pLogFP, " [mklfti(%d, %d, 0x%lx)]",
				MORPH_TONE_PAT_IS, (yyvsp[(1) - (6)].ival),
			   (unsigned long)(yyvsp[(5) - (6)].ival));
		  }
		  }
	break;

  case 144:
#line 2328 "trule_yg.y"
	{
				(yyval.cnval) = mklftp(MORPH_UL_TONE_PAT_IS, (yyvsp[(1) - (7)].ival), (yyvsp[(7) - (7)].tpval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone_expr:=position morpheme underlying ",
			   (unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, "tone pattern is TONEPATTERN ");
			fprintf(pStamp_m->pLogFP,
				"[mklftp(%d, %d, 0x%lx)]", MORPH_UL_TONE_PAT_IS, (yyvsp[(1) - (7)].ival),
			   (unsigned long)(yyvsp[(7) - (7)].tpval));
		  }
		  }
	break;

  case 145:
#line 2345 "trule_yg.y"
	{
				(yyval.cnval) = mklftp(WORD_TONE_IS, (yyvsp[(1) - (5)].ival), (yyvsp[(5) - (5)].tpval));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone_expr:=word tone pattern is %s",
			   (unsigned long)(yyval.cnval), "TONEPATTERN ");
			fprintf(pStamp_m->pLogFP, "[mklftp(%d, %d, 0x%lx)]",
				WORD_TONE_IS, (yyvsp[(1) - (5)].ival),
			   (unsigned long)(yyvsp[(5) - (5)].tpval));
		  }
		  }
	break;

  case 146:
#line 2363 "trule_yg.y"
	{
				(yyval.cnval) = mklfi(TYPE_IS, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].ival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tType_expr:=position type is TYPE ",
				(unsigned long)(yyval.cnval));
			fprintf(pStamp_m->pLogFP, "[mklfi(%d, %d, %d)]", TYPE_IS,
				(yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].ival));
		  }
		  }
	break;

  case 147:
#line 2382 "trule_yg.y"
	{
				(yyval.tival) = (yyvsp[(1) - (1)].tival);
		  }
	break;

  case 148:
#line 2386 "trule_yg.y"
	{
				(yyval.tival) = (struct tone_id *)NULL;
		  }
	break;

  case 149:
#line 2394 "trule_yg.y"
	{
				(yyval.tpval) = (yyvsp[(1) - (1)].tpval);
		  }
	break;

  case 150:
#line 2398 "trule_yg.y"
	{
				(yyval.tpval) = (struct tone_pattern *)NULL;
		  }
	break;

  case 151:
#line 2407 "trule_yg.y"
	{
				tmp_tp = mktonepattern((yyvsp[(2) - (2)].tival));
		(yyval.tpval) = link_tone_pattern((yyvsp[(1) - (2)].tpval), tmp_tp);
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP,
				"\n0x%lx\tTone_Pat:=Tone_Pat Tone ",
			   (unsigned long)(yyval.tpval));
			fprintf(pStamp_m->pLogFP, "[mktonepattern(0x%lx)]",
				(unsigned long)(yyvsp[(2) - (2)].tival));
			fprintf(pStamp_m->pLogFP,"[link_tone_pattern(0x%lx, 0x%lx)]",
			   (unsigned long)(yyvsp[(1) - (2)].tpval), (unsigned long)tmp_tp);
		  }
		  }
	break;

  case 152:
#line 2422 "trule_yg.y"
	{
				(yyval.tpval) = mktonepattern((yyvsp[(1) - (1)].tival));
		if (rule_debug)
		  {
			fprintf(pStamp_m->pLogFP, "\n0x%lx\tTone_Pattern:=Tone ",
			   (unsigned long)(yyval.tpval));
			fprintf(pStamp_m->pLogFP, "[mktonepattern(0x%lx)]",
				(unsigned long)(yyvsp[(1) - (1)].tival));
		  }
		  }
	break;

  case 153:
#line 2436 "trule_yg.y"
	{
		(yyval.ival) = ONSET;
		  }
	break;

  case 154:
#line 2441 "trule_yg.y"
	{
		(yyval.ival) = CODA;
		  }
	break;

  case 155:
#line 2449 "trule_yg.y"
	{
		(yyval.ival) = MONOSYLLABIC;
		  }
	break;

  case 156:
#line 2454 "trule_yg.y"
	{
		(yyval.ival) = DISYLLABIC;
		  }
	break;

  case 157:
#line 2459 "trule_yg.y"
	{
		(yyval.ival) = TRISYLLABIC;
		  }
	break;

  case 158:
#line 2464 "trule_yg.y"
	{
		(yyval.ival) = QUADRISYLLABIC;
		  }
	break;

  case 159:
#line 2469 "trule_yg.y"
	{
		(yyval.ival) = POLYSYLLABIC;
		  }
	break;

  case 160:
#line 2474 "trule_yg.y"
	{
		(yyval.ival) = MONOMORAIC;
		  }
	break;

  case 161:
#line 2479 "trule_yg.y"
	{
		(yyval.ival) = BIMORAIC;
		  }
	break;

  case 162:
#line 2487 "trule_yg.y"
	{
		(yyval.ival) = LOGAND;
		  }
	break;

  case 163:
#line 2492 "trule_yg.y"
	{
		(yyval.ival) = LOGIFF;
		  }
	break;

  case 164:
#line 2497 "trule_yg.y"
	{
		(yyval.ival) = LOGOR;
		  }
	break;

  case 165:
#line 2502 "trule_yg.y"
	{
		(yyval.ival) = LOGXOR;
		  }
	break;

  case 166:
#line 2511 "trule_yg.y"
	{
		(yyval.ival) = ARGCURRENT;
		  }
	break;

  case 167:
#line 2516 "trule_yg.y"
	{
		(yyval.ival) = ARGLEFT;
		  }
	break;

  case 168:
#line 2521 "trule_yg.y"
	{
		(yyval.ival) = ARGLEFTTWO;
		  }
	break;

  case 169:
#line 2527 "trule_yg.y"
	{
		(yyval.ival) = ARGRIGHT;
		  }
	break;

  case 170:
#line 2532 "trule_yg.y"
	{
		(yyval.ival) = ARGRIGHTTWO;
		  }
	break;

  case 171:
#line 2538 "trule_yg.y"
	{
		++bLeftSeen_m;
		(yyval.ival) = FORLEFT;
		  }
	break;

  case 172:
#line 2545 "trule_yg.y"
	{
		++bRightSeen_m;
		(yyval.ival) = FORRIGHT;
		  }
	break;

  case 173:
#line 2552 "trule_yg.y"
	{
		(yyval.ival) = INITIALM;
		  }
	break;

  case 174:
#line 2557 "trule_yg.y"
	{
		(yyval.ival) = WINITIAL;
		  }
	break;

  case 175:
#line 2562 "trule_yg.y"
	{
		(yyval.ival) = FINALM;
		  }
	break;

  case 176:
#line 2567 "trule_yg.y"
	{
		(yyval.ival) = WFINAL;
		  }
	break;

  case 177:
#line 2575 "trule_yg.y"
	{
		(yyval.ival) = FIRSTINWORD;
		  }
	break;

  case 178:
#line 2580 "trule_yg.y"
	{
		(yyval.ival) = SECONDINWORD;
		  }
	break;

  case 179:
#line 2585 "trule_yg.y"
	{
		(yyval.ival) = THIRDINWORD;
		  }
	break;

  case 180:
#line 2590 "trule_yg.y"
	{
		(yyval.ival) = ANTEPENULTIMATE;
		  }
	break;

  case 181:
#line 2595 "trule_yg.y"
	{
		(yyval.ival) = PENULTIMATE;
		  }
	break;

  case 182:
#line 2600 "trule_yg.y"
	{
		(yyval.ival) = ULTIMATE;
		  }
	break;

  case 183:
#line 2608 "trule_yg.y"
	{
		if (((yyval.ival) = Boundary) == 0)
		  id_error("tone_status", "boundary");
		  }
	break;

  case 184:
#line 2616 "trule_yg.y"
	{
		if (((yyval.ival) = Delinked) == 0)
		   id_error("tone_status", "delinked");
		  }
	break;

  case 185:
#line 2622 "trule_yg.y"
	{
		if (((yyval.ival) = Floating) == 0)
		  id_error("tone_status", "floating");
		  }
	break;

  case 186:
#line 2629 "trule_yg.y"
	{
		if (((yyval.ival) = LeftFloating) == 0)
		  id_error("tone_status", "left-floating");
		  }
	break;

  case 187:
#line 2636 "trule_yg.y"
	{
		if (((yyval.ival) = Linked) == 0)
		   id_error("tone_status", "linked");
		  }
	break;

  case 188:
#line 2642 "trule_yg.y"
	{
		if (((yyval.ival) = Melody) == 0)
		  id_error("tone_status", "melody");
		  }
	break;

  case 189:
#line 2648 "trule_yg.y"
	{
		if (((yyval.ival) = RightFloating) == 0)
		  id_error("tone_status", "right-floating");
		  }
	break;

  case 190:
#line 2658 "trule_yg.y"
	{
		(yyval.ival) = PFX;
		  }
	break;

  case 191:
#line 2662 "trule_yg.y"
	{
		(yyval.ival) = IFX;
		  }
	break;

  case 192:
#line 2666 "trule_yg.y"
	{
		(yyval.ival) = ROOT;
		  }
	break;

  case 193:
#line 2670 "trule_yg.y"
	{
		(yyval.ival) = SFX;
		  }
	break;

  case 194:
#line 2674 "trule_yg.y"
	{
		(yyval.ival) = WINITIAL;
		  }
	break;

  case 195:
#line 2678 "trule_yg.y"
	{
		(yyval.ival) = WFINAL;
		  }
	break;

  case 196:
#line 2685 "trule_yg.y"
	{
		(yyval.ival) = 0;
		  }
	break;

  case 197:
#line 2689 "trule_yg.y"
	{
		(yyval.ival) = 0;
		  }
	break;


/* Line 1267 of yacc.c.  */
#line 4403 "y.tab.c"
	  default: break;
	}
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
	 that goes to, based on the state we popped back to and the rule
	 number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
	yystate = yytable[yystate];
  else
	yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
	{
	  ++yynerrs;
#if ! YYERROR_VERBOSE
	  yyerror (YY_("syntax error"));
#else
	  {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
		YYSIZE_T yyalloc = 2 * yysize;
		if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
		  yyalloc = YYSTACK_ALLOC_MAXIMUM;
		if (yymsg != yymsgbuf)
		  YYSTACK_FREE (yymsg);
		yymsg = (char *) YYSTACK_ALLOC (yyalloc);
		if (yymsg)
		  yymsg_alloc = yyalloc;
		else
		  {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
		  }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
		(void) yysyntax_error (yymsg, yystate, yychar);
		yyerror (yymsg);
	  }
	else
	  {
		yyerror (YY_("syntax error"));
		if (yysize != 0)
		  goto yyexhaustedlab;
	  }
	  }
#endif
	}



  if (yyerrstatus == 3)
	{
	  /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

	  if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
		YYABORT;
	}
	  else
	{
	  yydestruct ("Error: discarding",
			  yytoken, &yylval);
	  yychar = YYEMPTY;
	}
	}

  /* Else will try to reuse look-ahead token after shifting the error
	 token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
	 YYERROR and the label yyerrorlab therefore never appears in user
	 code.  */
  if (/*CONSTCOND*/ 0)
	 goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
	 this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
	{
	  yyn = yypact[yystate];
	  if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
		{
		  yyn = yytable[yyn];
		  if (0 < yyn)
		break;
		}
	}

	  /* Pop the current state because it cannot handle the error token.  */
	  if (yyssp == yyss)
	YYABORT;


	  yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
	  YYPOPSTACK (1);
	  yystate = *yyssp;
	  YY_STACK_PRINT (yyss, yyssp);
	}

  if (yyn == YYFINAL)
	YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
	 yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
	 this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
	{
	  yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
	  YYPOPSTACK (1);
	}
#ifndef yyoverflow
  if (yyss != yyssa)
	YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
	YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 2702 "trule_yg.y"


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
  switch (type)
	{
	case DI_DOMAIN:  		/* fall through */
	case DI_MORPHEME:		/* fall through */
	case DI_WORD:
	dip->u.di_domain = domain;
	break;
	default:
	dip->u.di_word_position = domain;
	break;
	}

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

  switch (dp->di_type)
	{
	case DI_DOMAIN:
	cp = tone_domain_name(dp->u.di_domain);
	break;
	case DI_MORPHEME:
	cp = "morpheme";
	break;
	case DI_WORD:
		cp = "word";
	break;
	default:
	switch (dp->u.di_word_position)
	  {
	  case FIRSTINWORD:
		  cp = "first";
		  break;
	  case SECONDINWORD:
		  cp = "second";
		  break;
	  case THIRDINWORD:
		  cp = "third";
		  break;
	  case ANTEPENULTIMATE:
		  cp = "antepenultimate";
		  break;
	  case PENULTIMATE:
		  cp = "penultimate";
		  break;
	  case ULTIMATE:
		  cp = "ultimate";
		  break;
	  }
	break;
	}


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
	p =  findAmplePropertyName((unsigned int)condp->cr.r_int,
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
