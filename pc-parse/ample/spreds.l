%{
/* SPREDS.L - lexical scanner for user defined tests
 ***************************************************************************
 *
 *  ampyylex()
 *
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#if _MSC_VER >= 800		/* MSC Visual C/C++ needs this */
#include <process.h>
#endif
/* local headers */
#include "ample.h"
#include "ampledef.h"
#include "atest.h"

int yylex YY_PROTO((FILE *pLogFP_in));
#define YY_DECL int yylex(pLogFP_in) FILE * pLogFP_in;

#define YY_NO_UNPUT	/* don't need this function */
#define yylval ampyylval
/*
 *  global variables used for yacc & lex routines
 */
static char *	pszAmpleLexInput_m;	/* input text pointer for lex */
static char *	pszAmpleLexLocation_m;	/* pointer to where lex is BJY 1.9za */

#ifdef LEX_DEBUG
#define LEX_DEBUG_OUT stdout
#include <assert.h>
char stest_name[100];
YYSTYPE yylval;
void main(void)
{
char *p;
assert(sizeof(int) >= sizeof(char *));
while (p = (char *) yylex())
	fprintf(LEX_DEBUG_OUT, "%s is \"%s\"\n", p, yytext);
}

int yynerrs = 0;

#define token(x)    (int) "x"

#else /* LEX_DEBUG */

#define token(x)        x
static char stest_name[BUFSIZE];       /* user name temp storage */

#ifdef FLEX_SCANNER
extern YYSTYPE yylval;
/*
 *  read up to "max_size" characters, stuffing them into "buf", and placing
 *  the number read (or YY_NULL) in "result".
 *  We handle the test continuation code ('F') here rather than in yywrap().
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
for ( result=0 ; *pszAmpleLexInput_m && (result<(max_size)) ; ++result ) \
	{ \
	(buf)[result] = *pszAmpleLexInput_m++; \
	if ((*pszAmpleLexInput_m=='\0')&&(*(pszAmpleLexInput_m+1)=='F')) \
	pszAmpleLexInput_m += 2; \
	}
/*
 *  yywrap() returns 0 if there is more input, 1 if there is no more input
 *  note, we need to allow the scanner to restart from scratch on another test
 */
#undef yywrap
/* #define yywrap() (yy_saw_eof = 0, yy_init = 1) */
#define yywrap() (yy_init = 1)
#define YY_SKIP_YYWRAP

#else /* FLEX_SCANNER */

#ifdef MSC
static int yywrap(void);
#endif
/*
 *  read a single character from the input source
 */
#undef input
#define input() \
( ((yytchar=(yysptr>yysbuf)?U(*--yysptr):U(*pszAmpleLexInput_m++))=='\n') ? \
  (yylineno++,yytchar) : yytchar )

#endif /* FLEX_SCANNER */

#endif /* LEX_DEBUG */

#define END(v)      (v-1 + sizeof v / sizeof v[0])
static int matchstr P((void)), screen P((void));
%}

/* change high end range from 128-254 (þ) to 127-255(ÿ) hab 3.2.7 */
/* letter          [a-zA-Z-ÿ] */
/* LETTER          [A-Z-ÿ] */
identifier      [a-zA-Z-ÿ0-9\!\@\$\%\^\&\*_\-\+\`\{\}\[\]\;\:\'\"\\\,\.\/\?\#]
white_space [ \t\n]
other       .

%%

"="             return( yylval.ival = token(LX_EQ) );
">"             return( yylval.ival = token(LX_GT) );
">="                return( yylval.ival = token(LX_GE) );
"<="                return( yylval.ival = token(LX_LE) );
"<"             return( yylval.ival = token(LX_LT) );
"~="                return( yylval.ival = token(LX_NE) );

\"[^ \t\n]*\"           { return( matchstr() ); }
\'[^ \t\n]*\'           { return( matchstr() ); }
\.[^ \t\n]*\.           { return( matchstr() ); }
\[[^ \t\n]*\]           { return( matchstr() ); }

{identifier}+           { pszAmpleLexLocation_m =	/* BJY 1.9za */
				  (char *)yy_current_buffer->yy_buf_pos;
			  return( screen() ); }

{white_space}+          ;

{other}             return( token(yytext[0]) );

%%

/*
 *  reserved word screener (taken from Schreiner & Freidman)
 */

static const struct rwtable {     /* reserved word table */
	char *rw_name;      /* representation name */
	int rw_yylex;       /* yylex() value */
	} rwtable[] = {
	{"AND",                 token(LX_AND)},
	{"FINAL",               token(LX_PFINAL)},
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
	{"IF",                  token(LX_IF)},
	{"IFF",                 token(LX_IFF)},
	{"INITIAL",             token(LX_PINITIAL)},
	{"LEFT",                token(LX_FLEFT)},
	{"NOT",                 token(LX_NOT)},
	{"OR",                  token(LX_OR)},
	{"RIGHT",               token(LX_FRIGHT)},
	{"THEN",                token(LX_THEN)},
	{"XOR",                 token(LX_XOR)},
	{"allomorph",           token(LX_ALLOMORPH)},
	{"capitalized",         token(LX_CAPITALIZED)}, /* 1.9zb BJY */
	{"current",             token(LX_CURRENT)},
	{"final",               token(LX_FINAL)},
	{"fromcategory",        token(LX_FROMCATEGORY)},
	{"infix",               token(LX_INFX)},
	{"initial",             token(LX_INITIAL)},
	{"interfix",            token(LX_INTERFX)},
	{"interfixinfix",       token(LX_INTERFXIFX)},
	{"interfixprefix",      token(LX_INTERFXPFX)},
	{"interfixsuffix",      token(LX_INTERFXSFX)},
	{"is",                  token(LX_IS)},
	{"last",                token(LX_LAST)},
	{"left",                token(LX_LEFT)},
	{"matches",             token(LX_MATCHES)},
	{"member",              token(LX_MEMBER)},
	{"morphname",           token(LX_MORPHNAME)},
	{"next",                token(LX_NEXT)},
	{"orderclass",          token(LX_ORDRCLASS)},
	{"orderclassmax",       token(LX_ORDRCLASSMAX)}, /* hab360 */
	{"orderclassmin",       token(LX_ORDRCLASS)}, /* hab360 */
	{"outputcategory",      token(LX_COMPUTEDCATEGORY)},
	{"prefix",              token(LX_PRFX)},
	{"property",            token(LX_PROPERTY)},
	{"punctuation",         token(LX_PUNCTUATION)},	/* hab 3.3.0 */
	{"right",               token(LX_RIGHT)},
	{"root",                token(LX_ROOT)},
	{"string",              token(LX_SURFACE)},
	{"suffix",              token(LX_SUFX)},
	{"tocategory",          token(LX_TOCATEGORY)},
	{"type",                token(LX_TYPE)},
	{"word",                token(LX_WORD)},
	};


/*****************************************************************************
 * NAME
 *    matchstr
 * DESCRIPTION
 *    processes the string to match
 * RETURN VALUE
 *    token value of STRING
 */
static int matchstr()
{
char *cp;

yytext[yyleng-1] = '\0';
cp               = (char *)yytext + 1;
yylval.cval      = strcpy(stest_name, cp);
return( token(LX_IDENTIFIER) );
}

/*****************************************************************************
 * NAME
 *    screen
 * DESCRIPTION
 *    acts as a screening filter for reserved words
 * RETURN VALUE
 *    token value of string
 */
static int screen()
{
const struct rwtable *low = rwtable;
const struct rwtable *high = END(rwtable);
const struct rwtable *mid;
int c;
/*
 *  look for it in reserved_word list
 */
while (low <= high)
	{
	mid = low + (high-low)/2;
	if ((c = strcmp(mid->rw_name, (char *)yytext)) == 0)
	{
	yylval.ival = mid->rw_yylex;
	return( mid->rw_yylex );
	}
	else if (c < 0)
	low = mid+1;
	else
	high = mid-1;
	}
/*
 *  assume it is an identifier
 */
yylval.cval = strcpy(stest_name, (char *)yytext);
return(token(LX_IDENTIFIER));
}

#ifndef FLEX_SCANNER
#ifndef LEX_DEBUG
/*****************************************************************************
 * NAME
 *    yywrap
 * DESCRIPTION
 *    does any processing after the "EOF" condition has been reached.
 *    NOTE: this is a part of the lex library provided by UNIX.
 *    it is included here for portability purposes.
 * RETURN VALUE
 *    0 if there is more input (the analysis data code is 'F')
 *    1 if there is no more input; this tells yacc that there
 *            are no more characters.
 */
static int yywrap()
{
if (*pszAmpleLexInput_m != 'F')
	return(1);
else
	{
	pszAmpleLexInput_m++;            /* skip the F */
	return(0);
	}
}
#endif /* LEX_DEBUG */
#endif /* FLEX_SCANNER */

/*****************************************************************************
 * NAME
 *    setAmpleLexInput
 * DESCRIPTION
 *     set input string for yylex()
 * RETURN VALUE
 *    none
 */
void setAmpleLexInput( pszTest_in )
char *	pszTest_in;
{
pszAmpleLexInput_m = pszTest_in;
}

/*****************************************************************************
 * NAME
 *    getAmpleLexLocation
 * DESCRIPTION
 *    get the current location in the yylex() input string
 * RETURN VALUE
 *    pointer to where the lexical input is at
 */
char * getAmpleLexLocation()
{
return pszAmpleLexLocation_m;
}

#ifndef THINK_C
/*****************************************************************************
 * NAME
 *    freeAmpleYYLexBuffer
 * DESCRIPTION
 *    Deletes buffer created by yylex
 * RETURN VALUE
 *    none
 */
void freeAmpleYYLexBuffer()
{
if ( yy_current_buffer )
	yy_delete_buffer( yy_current_buffer );
}
#endif /* THINK_C */
