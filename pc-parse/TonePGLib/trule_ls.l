%{
/*	TRULE_LS.L - lexical scanner for user defined tone rules
 ***************************************************************************
 *
 *	yylex()
 *
 ***************************************************************************
 *	EDIT HISTORY
 *	14-Feb-95	H.A. Black  initial coding, based on spreds.l
 * 1.9k 22-Mar-94 hab make DJGPP compiler happy: remove its warning msgs
***************************************************************************
 * Copyright 1995  by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <io.h>
#include "stamp.h"

#include "trule_yg.h"

#ifdef IsItNeeded
#ifndef __GNUC__
	void yy_push_state();
	void yy_pop_state();
	int yy_top_state();
#endif /* __GNUC__ */
#endif

#ifdef LEX_DEBUG

#include <assert.h>

#define token(x)	(int) x

int yylex();

char string_buf[100];
char current_id[100];
char last_id[100];
YYSTYPE yylval;
void main(void)
{
   char *p;
   int d;

   assert(sizeof(int) >= sizeof(char *));
/*   while ((p = (char *) yylex()))
	   printf("\n%s is \"%s\"", p, yytext); */
   while ((d = yylex()))
	   printf("\n%d is \"%s\"", d, yytext);
}

int yynerrs = 0;

#else /* LEX_DEBUG */

/* #include "ample.h" */

#define token(x)        x
extern char *rpp;               /* pointer to input buffer */
extern char *lexp;		/* pointer to where lex is */
extern char string_buf[];
extern char current_id[];
extern char last_id[];

#ifdef FLEX_SCANNER
extern YYSTYPE yylval;
/*
 *  read up to "max_size" characters, stuffing them into "buf", and placing
 *  the number read (or YY_NULL) in "result".
 *  We handle the test continuation code ('F') here rather than in yywrap().
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
for ( result=0 ; *rpp && (result<(max_size)) ; ++result ) \
	{ (buf)[result] = *rpp++; if ((*rpp=='\0')&&(*(rpp+1)=='F')) rpp += 2; }
/*
 *  yywrap() returns 0 if there is more input, 1 if there is no more input
 *  note, we need to allow the scanner to restart from scratch on another test
 */
#undef yywrap
/* #define yywrap() (yy_saw_eof = 0, yy_init = 1) */
#define yywrap() (yy_init = 1)

#else /* FLEX_SCANNER */

#ifdef MSC
static yywrap(void);
#endif
/*
 *  read a single character from the input source
 */
#undef input
#define input() \
( ((yytchar=(yysptr>yysbuf)?U(*--yysptr):U(*rpp++))=='\n') ? \
  (yylineno++,yytchar) : yytchar )

#endif /* FLEX_SCANNER */

#endif /* LEX_DEBUG */

#define END(v)		(v-1 + sizeof v / sizeof v[0])
static int matchstr(void), screen(void);
char *cp;
%}

letter          [a-zA-Z€-þ]
LETTER          [A-Z€-þ]
identifier      [a-zA-Z€-þ0-9\!\@\$\%\^\&\*_\-\+\`\{\}\[\]\'\"\\\/\?\#]
white_space	[ \t\n]
other		.

%%

\"[^ \t\n]*\"			{ return( matchstr() ); }
\'[^ \t\n]*\'			{ return( matchstr() ); }
\.[^ \t\n]*\.			{ return( matchstr() ); }
\[[^ \t\n]*\]			{ return( matchstr() ); }

{identifier}+			{ lexp = yy_current_buffer->yy_buf_pos;
				  return( screen() ); }


{white_space}+			;

{other}				{ return( token(yytext[0]) ); }

%%

/*
 *	reserved word screener (taken from Schreiner & Freidman)
 */

static struct rwtable {		/* reserved word table */
	char *rw_name;		/* representation name */
	int rw_yylex;		/* yylex() value */
	} rwtable[] = {
		{"AND",                 token(LX_LO_AND)},
	{"Associate",		token(LX_ASSOCIATE)},
	{"CONDITION",		token(LX_CONDITION)},
	{"CYCLE",		token(LX_CYCLE)},
	{"Copy",		token(LX_COPY)},
	{"DIRECTION",		token(LX_DIRECTION)},
	{"Delete",		token(LX_DELETE)},
	{"Delink",		token(LX_DELINK)},
	{"FINAL",		token(LX_PFINAL)},
	{"FOR-ALL-LEFT",        token(LX_FA_LEFT)},
	{"FOR-ALL-RIGHT",       token(LX_FA_RIGHT)},
	{"FOR-SOME-LEFT",       token(LX_FS_LEFT)},
	{"FOR-SOME-RIGHT",      token(LX_FS_RIGHT)},
	{"FORALLLEFT",          token(LX_FA_LEFT)},
	{"FORALLRIGHT",         token(LX_FA_RIGHT)},
	{"FORSOMELEFT",         token(LX_FS_LEFT)},
	{"FORSOMERIGHT",        token(LX_FS_RIGHT)},
	{"FOR_ALL_LEFT",        token(LX_FA_LEFT)},
	{"FOR_ALL_RIGHT",       token(LX_FA_RIGHT)},
	{"FOR_SOME_LEFT",       token(LX_FS_LEFT)},
	{"FOR_SOME_RIGHT",      token(LX_FS_RIGHT)},
	{"Fill-in",		token(LX_FILL_IN)},
	{"IF",			token(LX_IF)},
	{"IFF",			token(LX_LO_IFF)},
	{"INITIAL",		token(LX_PINITIAL)},
	{"ITERATION",		token(LX_ITERATION)},
	{"Insert",		token(LX_INSERT)},
	{"LEFT",                token(LX_FLEFT)},
	{"Link",		token(LX_LINK)},
	{"NOT",			token(LX_LO_NOT)},
	{"OCP",			token(LX_OCP)},
	{"OCP-blockage",	token(LX_OCP_BLOCKAGE)},
	{"OCP-ignored",		token(LX_OCP_IGNORED)},
	{"OCP-merger",		token(LX_OCP_MERGER)},
	{"OR",			token(LX_LO_OR)},
	{"RIGHT",               token(LX_FRIGHT)},
	{"Set",			token(LX_SET)},
	{"Spread",		token(LX_SPREAD)},
	{"THEN",		token(LX_THEN)},
	{"XOR",			token(LX_LO_XOR)},
	{"a",			token(LX_A)},
	{"and",			token(LX_AND)},
	{"applies",		token(LX_APPLIES)},
	{"at",			token(LX_WITHIN)},
	{"bimoraic",		token(LX_BIMORAIC)},
	{"boundary",		token(LX_BOUNDARY)},
	{"category",		token(LX_CATEGORY)},
	{"coda",		token(LX_CODA)},
	{"condition",		token(LX_ECONDITION)},
	{"current",		token(LX_CURRENT)},
	{"cyclically",		token(LX_CYCLICALLY)},
	{"default",		token(LX_DEFAULT)},
	{"delinked",		token(LX_DELINKED)},
	{"disyllabic",		token(LX_DISYLLABIC)},
	{"domain",		token(LX_DOMAIN)},
	{"domains",		token(LX_DOMAINS)},
	{"edge",		token(LX_EDGE)},
	{"edge-in",		token(LX_EDGE_IN)},
	{"extrametrical",	token(LX_EXTRAMETRICAL)},
	{"feature-adding",	token(LX_FEATURE_ADDING)},
	{"feature-changing",	token(LX_FEATURE_CHANGING)},
	{"feature-filling",	token(LX_FEATURE_FILLING)},
	{"final",		token(LX_FINAL)},
	{"floating",		token(LX_FLOATING)},
	{"has",			token(LX_HAS)},
	{"in",			token(LX_WITHIN)},
	{"infix",		token(LX_INFIX)},
	{"initial",		token(LX_INITIAL)},
	{"is",			token(LX_IS)},
	{"iteratively",		token(LX_ITERATIVELY)},
	{"left",		token(LX_LEFT)},
	{"left-floating",	token(LX_LEFT_FLOATING)},
	{"left-to-right",	token(LX_RIGHTWARD)},
	{"lefttwo",		token(LX_LEFTTWO)},
	{"leftward",		token(LX_LEFTWARD)},
	{"linked",		token(LX_LINKED)},
	{"melody",		token(LX_MELODY)},
	{"member",		token(LX_MEMBER)},
	{"mode",		token(LX_MODE)},
	{"monomoraic",		token(LX_MONOMORAIC)},
	{"monosyllabic",	token(LX_MONOSYLLABIC)},
	{"morpheme",		token(LX_MORPHEME)},
	{"morphname",		token(LX_MORPHNAME)},
	{"non-iteratively",	token(LX_NONITERATIVELY)},
	{"none",		token(LX_NONE)},
	{"noniteratively",	token(LX_NONITERATIVELY)},
	{"of",			token(LX_OF)},
	{"one-to-one",		token(LX_ONE_TO_ONE)},
	{"onset",		token(LX_ONSET)},
	{"optional",		token(LX_OPTIONAL)},
	{"pattern",		token(LX_PATTERN)},
	{"polysyllabic",	token(LX_POLYSYLLABIC)},
	{"prefix",		token(LX_PREFIX)},
	{"property",		token(LX_PROPERTY)},
	{"quadrisyllabic",	token(LX_QUADRISYLLABIC)},
	{"right",		token(LX_RIGHT)},
	{"right-floating",	token(LX_RIGHT_FLOATING)},
	{"right-to-left",	token(LX_LEFTWARD)},
	{"righttwo",		token(LX_RIGHTTWO)},
	{"rightward",		token(LX_RIGHTWARD)},
	{"root",		token(LX_ROOT)},
	{"segment",		token(LX_SEGMENT)},
	{"suffix",		token(LX_SUFFIX)},
	{"syllable",		token(LX_SYLLABLE)},
	{"tbu",			token(LX_TBU)},
	{"tbus",		token(LX_TBUS)},
	{"to",			token(LX_TO)},
	{"tone",		token(LX_TONE)},
	{"tones",		token(LX_TONES)},
	{"trisyllabic",		token(LX_TRISYLLABIC)},
	{"type",		token(LX_TYPE)},
	{"underlying",		token(LX_UNDER)},
	{"using",		token(LX_USING)},
	{"with",		token(LX_WITH)},
	{"within",		token(LX_WITHIN)},
	{"word",		token(LX_WORD)},
	};


/*****************************************************************
 *
 *                         matchstr
 *
 *****************************************************************
 *
 * matchstr
 * processes the string to match
 *
 * RETURNS:
 *    token value of STRING
 */

static int matchstr(void)
{
   yytext[yyleng-1] = '\0';
   cp = (char *)yytext + 1;
   yylval.cval = strcpy(string_buf, cp);
   return( token(LX_IDENTIFIER) );

} /* end matchstr */

/*****************************************************************
 *
 *                         screen
 *
 *****************************************************************
 *
 * screen
 * acts as a screening filter for reserved words
 *
 * RETURNS:
 *    token value of string
 */

static int screen(void)
{	struct rwtable	*low = rwtable,
			*high = END(rwtable),
			*mid;
	int c;

				/* look for it in reserved_word list */
	while (low <= high)
	{	mid = low + (high-low)/2;
		if ((c = strcmp(mid->rw_name, (char *)yytext)) == 0) {
						yylval.ival = mid->rw_yylex;
			return( mid->rw_yylex );
						}
		else if (c < 0)
			low = mid+1;
		else
			high = mid-1;
	}
				/* assume it is an identifier */
				/* save preceding identifier value */
	strcpy(last_id, current_id);
	yylval.cval = strcpy(string_buf, (char *)yytext);
	strcpy(current_id, yytext);
	return(token(LX_IDENTIFIER));

} /* end screen */

#ifndef FLEX_SCANNER
#ifndef LEX_DEBUG

/*****************************************************************
 *
 *                         yywrap
 *
 *****************************************************************
 *
 * yywrap
 * does any processing after the "EOF" condition has been reached.
 * NOTE: this is a part of the lex library provided by UNIX.
 * 	 it is included here for portability purposes.
 *
 * RETURNS:
 *    0 if there is more input (the analysis data code is 'F')
 *    1 if there is no more input; this tells yacc that there
 *            are no more characters.
 */

static yywrap(void)
{
   if (*rpp != 'F')
	  return(1);
   else {
	  rpp++;			/* skip the F */
	  return(0);
   }

} /* end yywrap */

#endif /* LEX_DEBUG */
#endif /* FLEX_SCANNER */

/*****************************************************************
 *
 * yy_delete_current_buffer
 *    Deletes buffer created by yylex
 *
 * RETURNS:  none
 */
void yy_delete_current_buffer( void )
	{
	if ( yy_current_buffer )
	yy_delete_buffer( yy_current_buffer );
	}

/*****************************************************************
 *
 * yy_make_compiler_happy
 *    Calls some routines that the compiler complains about so it
 *    won't complain (now, isn't this silly?)
 *
 * RETURNS:  none
 */
void yy_make_compiler_happy( void )
	{
	int c = 0;
	char *cp= (char*)NULL;

	yyunput(c, cp);
#ifdef IsItNeeded
#ifndef __GNUC__
	yy_push_state(c);
	yy_pop_state();
	yy_top_state();
#endif /* __GNUC__ */
#endif
	}
