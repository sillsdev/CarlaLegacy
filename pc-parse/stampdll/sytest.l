%{
/*  STEST.L - lexical scanner for user defined tests
 ***************************************************************************
 *
 *  yylex()
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <string.h>
#include "strlist.h"
#include "stamp.h"
#include "sytest_y.h"       /* produced from sytest.y */
#if _MSC_VER >= 800
#define fileno _fileno
#define isatty _isatty
#endif

#define yylval stampyylval
extern YYSTYPE yylval;
/*
 *  global variables used for yacc & lex routines
 */
static char *	pszStampLexInput_m;	/* input text pointer for lex */
static char *	pszStampLexLocation_m;	/* pointer to where lex is */

static void fixstring P((void));
static int screen P((void));

/***************************************************************************
 *  override the default input from stdin, to read from a NUL-terminated
 *    character string pointed to by the global pszStampLexInput_m.
 *  also, make sure that yylex() can be called more than once by the program
 */
#ifdef FLEX_SCANNER
#define YY_NO_UNPUT
/*
 *  read up to "max_size" characters, stuffing them into "buf", and placing
 *  the number read (or YY_NULL) in "result".
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
for ( result=0 ; *pszStampLexInput_m && (result<(max_size)) ; ++result ) \
	{ (buf)[result] = *pszStampLexInput_m++; }
/*
 *  flex considers yywrap() to be a macro.  it returns 0 if there is more
 *    input, 1 if there is no more input.
 *  note, we need to allow the scanner to restart from scratch on another test
 */
#undef yywrap
#define yywrap() (yy_init = 1)

#else /* FLEX_SCANNER */
/*
 *  read a single character from the input source
 *    (this obscure code works for at least the 4.2BSD lex)
 */
#undef input
#define input() \
( ((yytchar=(yysptr>yysbuf)?U(*--yysptr):U(*pszStampLexInput_m++))=='\n') ? \
  (yylineno++,yytchar) : yytchar )

static int yywrap P((void));    /* defined as a function below */
#endif /* FLEX_SCANNER */

%}

digit       [0-9]
/* change high end range from 128-254 (þ) to 127-255(ÿ) hab 2.0b5 */
identifier      [a-zA-Z-ÿ0-9\!\@\$\%\^\&\*_\-\+\`\[\]\;\:\'\"\\\.\/\?\#]
white_space [ \t\n]
other       .

%%

"="             return yylval.ival = LX_EQ;
">"             return yylval.ival = LX_GT;
">="            return yylval.ival = LX_GE;
"<="            return yylval.ival = LX_LE;
"<"             return yylval.ival = LX_LT;
"~="            return yylval.ival = LX_NE;

\"[^ \t\n]*\"           { fixstring(); return( LX_IDENTIFIER ); }
\'[^ \t\n]*\'           { fixstring(); return( LX_IDENTIFIER ); }
\.[^ \t\n]*\.           { fixstring(); return( LX_IDENTIFIER ); }
\[[^ \t\n]*\]           { fixstring(); return( LX_IDENTIFIER ); }

\"[^\"]*\"          { fixstring(); return( LX_MESSAGE ); }
\'[^\']*\'          { fixstring(); return( LX_MESSAGE ); }
\.[^\.]*\.          { fixstring(); return( LX_MESSAGE ); }

{identifier}+           { pszStampLexLocation_m = (char *)yy_current_buffer->yy_buf_pos; /* BJY 1.5c */
						  return( screen() ); }

{white_space}+          ;

{other}             return( yytext[0] );

%%

/*************************************************************************
 * NAME
 *    fixstring
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Fix up the string value passed to yyparse() by eliminating the
 *    surrounding quoting delimiters.
 * RETURN VALUE
 *    none
 */
static void fixstring()
{
yytext[yyleng-1] = '\0';    /* erase trailing delimiter */
yylval.cval = yytext + 1;   /* skip over leading delimiter */
}

/*************************************************************************
 * NAME
 *    screen
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    reserved word screener (taken from Schreiner & Freidman) which
 *    recognizes the keywords of the grammar being parsed by yyparse()
 * RETURN VALUE
 *    token value of a keyword, or else the token value LX_IDENTIFIER
 */
struct rwtable          /* reserved word table */
	{
	char *rw_name;      /* representation name */
	int rw_yylex;       /* yylex() value read from sytest_y.h */
	};
static int screen()
{
static const struct rwtable asKeywords_s[] = {
	/*
	 *  these must be in alphabetical order, since binary search is
	 *  used below in the code
	 */
	{ "AND",		LX_AND, },
	{ "FINAL",		LX_PFINAL, },
	{ "FOR-ALL-LEFT",	LX_FA_LEFT, },
	{ "FOR-ALL-RIGHT",	LX_FA_RIGHT, },
	{ "FOR-SOME-LEFT",	LX_FS_LEFT, },
	{ "FOR-SOME-RIGHT",	LX_FS_RIGHT, },
	{ "FORALLLEFT",	LX_FA_LEFT, },
	{ "FORALLRIGHT",	LX_FA_RIGHT, },
	{ "FORSOMELEFT",	LX_FS_LEFT, },
	{ "FORSOMERIGHT",	LX_FS_RIGHT, },
	{ "FOR_ALL_LEFT",	LX_FA_LEFT, },
	{ "FOR_ALL_RIGHT",	LX_FA_RIGHT, },
	{ "FOR_SOME_LEFT",	LX_FS_LEFT, },
	{ "FOR_SOME_RIGHT",	LX_FS_RIGHT, },
	{ "IF",		LX_IF, },
	{ "IFF",		LX_IFF, },
	{ "INITIAL",	LX_PINITIAL, },
	{ "LEFT",		LX_FLEFT, },
	{ "NOT",		LX_NOT, },
	{ "OR",		LX_OR, },
	{ "RIGHT",		LX_FRIGHT, },
	{ "THEN",		LX_THEN, },
	{ "XOR",		LX_XOR, },
	{ "after",		LX_AFTER, },		/* for actions */
	{ "allomorph",	LX_ALLOMORPH, },
	{ "before",		LX_BEFORE, },		/* for actions */
	{ "current",	LX_CURRENT, },
	{ "final",		LX_FINAL, },
	{ "fromcategory",	LX_FROMCATEGORY, },
	{ "infix",		LX_INFX, },
	{ "initial",	LX_INITIAL, },
	{ "insert",		LX_INSERT, },		/* for actions */
	{ "is",		LX_IS, },
	{ "last",		LX_LAST, },
	{ "left",		LX_LEFT, },
	{ "matches",	LX_MATCHES, },
	{ "member",		LX_MEMBER, },
	{ "morphname",	LX_MORPHNAME, },
	{ "next",		LX_NEXT, },
	{ "orderclass",	LX_ORDRCLASS, },
	{ "prefix",		LX_PRFX, },
	{ "property",	LX_PROPERTY, },
	{ "punctuation",    LX_PUNCTUATION, },      /* 2.1b1 hab */
	{ "report",		LX_REPORT, },		/* for actions */
	{ "right",		LX_RIGHT, },
	{ "root",		LX_ROOT, },
	{ "string",		LX_SURFACE, },
	{ "suffix",		LX_SUFX, },
	{ "tocategory",	LX_TOCATEGORY, },
	{ "type",		LX_TYPE, }
	};
const struct rwtable *low  = asKeywords_s;
const struct rwtable *high = &asKeywords_s[(sizeof(asKeywords_s) /
						sizeof(struct rwtable)) - 1];
const struct rwtable *mid;
int cmp;
/*
 *  look for the literal string (yytext) in reserved word table using a
 *  binary search
 */
while (low <= high)
	{
	mid = low + (high-low)/2;
	if ((cmp = strcmp(mid->rw_name, yytext)) == 0)
	{
	yylval.ival = mid->rw_yylex;
	return( mid->rw_yylex );
	}
	else if (cmp < 0)
	low = mid+1;
	else
	high = mid-1;
	}
/*
 *  assume the literal is an identifier, not a keyword
 */
yylval.cval = yytext;
return( LX_IDENTIFIER );

} /* end screen */

#ifndef FLEX_SCANNER
/*************************************************************************
 * NAME
 *    yywrap
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    does any processing after the EOF condition has been reached.
 *    NOTE: this is a part of the lex library provided by UNIX.
 *      it is included here for portability purposes.
 * RETURN VALUE
 *    0 if there is more input
 *    1 if there is no more input; this tells yacc that there
 *            are no more characters.
 */
static int yywrap()
{
return(1);      /* simplicity itself: we're done */
}
#endif /* FLEX_SCANNER */

/*****************************************************************************
 * NAME
 *    setStampLexInput
 * DESCRIPTION
 *     set input string for yylex()
 * RETURN VALUE
 *    none
 */
void setStampLexInput( pszTest_in )
char *	pszTest_in;
{
pszStampLexInput_m = pszTest_in;
}

/*****************************************************************************
 * NAME
 *    getStampLexLocation
 * DESCRIPTION
 *    get the current location in the yylex() input string
 * RETURN VALUE
 *    pointer to where the lexical input is at
 */
char * getStampLexLocation()
{
return pszStampLexLocation_m;
}

/*****************************************************************
 *
 * deleteStampCurrentYYBuffer
 *    Deletes buffer created by yylex
 *
 * RETURNS:  none
 */
void deleteStampCurrentYYBuffer()
{
if ( yy_current_buffer )
	yy_delete_buffer( yy_current_buffer );
}
