/* ENVPAR.C - parse environment constraint expressions for AMPLE and STAMP
 *****************************************************************************
 *
 * void writeAmpleEnvConstraint(FILE *               outfp,
 *                              AmpleEnvConstraint * ec,
 *                              int                  bSGML_in)
 *
 * void writeAmplePCDATA(FILE *       pOutputFP_in,
 *                       const char * pszPCDATA_in,
 *                       int          b7Bit_in)
 *
 * size_t lengthAmplePCDATA(const char * pszPCDATA_in,
 *                          int          b7Bit_in)
 *
 * void storeAmplePCDATA(char *       pszOutput_in,
 *                       const char * pszPCDATA_in,
 *                       int          b7Bit_in)
 *
 * void writeAmpleCDATA(FILE *       pOutputFP_in,
 *                      const char * pszCDATA_in,
 *                      int          b7Bit_in)
 *
 * size_t lengthAmpleCDATA(const char * pszCDATA_in,
 *                         int          b7Bit_in)
 *
 * void storeAmpleCDATA(char *       pszOutput_in,
 *                      const char * pszCDATA_in,
 *                      int          b7Bit_in)
 *
 * void freeAmpleEnvConstraint(AmpleEnvConstraint * ec)
 *
 * void freeAmpleAlloEnvConstraint(AmpleAlloEnv * pAlloEnv_io)
 *
 * AmpleAlloEnv * parseAmpleAlloEnvConstraint(
 *                                char *                     line,
 *                                int *                      parserror,
 *                                unsigned                   uiRecordNumber_in,
 *                                const char *               pszRecordKey_in,
 *                                const Change *             pOrthoChanges_in,
 *                                const StringList *         pCategories_in,
 *                                const AmpleProperties *    pProperties_in,
 *                                const AmpleCategoryClass * pCategClasses_in,
 *                                const AmpleMorphClass *    pMorphClasses_in,
 *                                const StringClass *        pStringClasses_in,
 *				                               3.3.0 hab
 *				  const PunctClass *         pPunctClasses_in,
 *                                const char *               pszValidChars_in,
 *                                FILE *                     pLogFP_in,
 *                                StringList **              ppStringList_io,
 *                                AmpleAlloEnv **            ppAlloEnvList_io)
 *
 * AmpleEnvConstraint * parseAmpleInfixEnvConstraint(
 *                                char *                     line,
 *                                unsigned                   uiRecordNumber_in,
 *                                const char *               pszRecordKey_in,
 *                                const Change *             pOrthoChanges_in,
 *                                const StringList *         pCategories_in,
 *                                const AmpleProperties *    pProperties_in,
 *                                const AmpleCategoryClass * pCategClasses_in,
 *                                const AmpleMorphClass *    pMorphClasses_in,
 *                                const StringClass *        pStringClasses_in,
 *                                const char *               pszValidChars_in,
 *                                FILE *                     pLogFP_in,
 *                                StringList **              ppStringList_io)
 *
 * AmpleEnvConstraint * parseAmpleMorphEnvConstraint(
 *                                 char *                     str,
 *                                 const char *               pszRecordKey_in,
 *                                 const StringList *         pCategories_in,
 *                                 const AmpleProperties *    pProperties_in,
 *                                 const AmpleCategoryClass * pCategClasses_in,
 *                                 const AmpleMorphClass *    pMorphClasses_in,
 *                                 FILE *                     pLogFP_in,
 *                                 StringList **              ppStringList_io)
 *
 * char * stringifyAmpleEnvConstraint(char *               pszString_io,
 *                                    size_t *             puiStringSize_io,
 *                                    AmpleEnvConstraint * pEnvConstraint_in,
 *                                    int                  bSGML_in)
 *
 *****************************************************************************
 * Copyright 1988, 2000 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>
#include <ctype.h>
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern char * strchr  P((const char *s, int c));
extern char * strcpy  P((char *s, const char *t));
extern char * strncpy P((char *s, const char *t, size_t len));
extern int    strcmp  P((const char *s, const char *t));
extern size_t strspn  P((const char *s, const char *accept));
extern void * memset  P((void *s, int c, size_t n));
#endif /* STDC_HEADERS */
#include "stample.h"
#include "opaclib.h"
/* dynstr.c */
extern char * appendDynamicString P((char *       pszString_io,
					 size_t *     puiStringSize_io,
					 const char * pszAdded_in));

/********************* FUNCTION PROTOTYPES *********************/

static void			initEnvLex P((char * line));
static int			getEnvLex P((int iType)); /* 3.3.0 hab */
static int			getEnvToken P((int iType)); /* 3.3.0 hab */
static char *			add_string P(( char * string ));
static void			epar_error P((char * fmt,
						  char * arg));
static void			show_badenv P((char * envir));
static AmpleEnvItem *		env_side P((int    token,
						int    iType, /* 3.3.0 hab */
						int    isright,
						char * flags));
static int			goesPastBound P((AmpleEnvItem *	pEnvSide_in));
static AmpleEnvConstraint *	env_parse P((int iType)); /* 3.3.0 hab */
static int			env_item_comp P((AmpleEnvItem *ei1,
						 AmpleEnvItem *ei2));
static int			env_cond_comp P((AmpleEnvConstraint *ec1,
						 AmpleEnvConstraint *ec2));
static int			env_comp P((AmpleEnvConstraint *env1,
						AmpleEnvConstraint *env2));
static int			allo_env_comp P((AmpleAlloEnv *aenv1,
						 AmpleAlloEnv *aenv2));
static AmpleAlloEnv *		env_add P((AmpleAlloEnv *aenv));

static void			show_left P((AmpleEnvItem *ei, int bSGML_in));
static void			show_right P((AmpleEnvItem *ei, int bSGML_in));
static void			free_env_item P((AmpleEnvItem *ei));
static void			resetLocalGlobals P((void));

/********************* LOCAL VARIABLES *********************/
/*
 *  values returned by getEnvLex()
 */
#define ENV_END         0       /* end of this environment */
#define ENV_STRENV      1       /* '/' */
#define ENV_MORPH       2       /* '+/' */
#define ENV_BOUND       3       /* '#' */
#define ENV_ELLIPSIS    4       /* '...' */
#define ENV_LBRACK      5       /* '[' */
#define ENV_RBRACK      6       /* ']' */
#define ENV_MARK        7       /* '_' */
#define ENV_NOT         8       /* '~' */
#define ENV_LITERAL     9       /* literal string (stored in elex_string) */
#define ENV_NOTMARK     10      /* '~_' */
#define ENV_LPAREN      11      /* '(' */
#define ENV_RPAREN      12      /* ')' */
#define ENV_LCURL       13      /* '{' */
#define ENV_RCURL       14      /* '}' */
#define ENV_PUNCT       15      /* './' 3.3.0 hab */
#ifdef EXPERIMENTAL
#ifndef hab350
#define ENV_ALLOID      16      /* '~/' */
#endif /* hab350 */
#endif /* EXPERIMENTAL */
/*
 *  maximum length of an item in an environment
 */
#define MAXLEXSIZE	64
/*
 *  for function parameter passing to env_side()
 */
#define LEFT_SIDE  0
#define RIGHT_SIDE 1

static const char	szWhitespace_m[7] = " \t\n\r\f\v";

static char *	pszEnvErrHead_m   = NULL;	/* used by epar_error() */
static char *	pszEnvErrTail_m   = NULL;
static char *	pszEnvParseType_m = NULL;
/*
 *  values for eEnvLexState_m
 */
#define EL_INIT 0       /* freshly initialized */
#define EL_WORK 1       /* merely going ahead working */
#define EL_HLD1 2       /* finished with one, holding a '/' */
#define EL_HLD2 3       /* finished with one, holding a '+/' */
#define EL_HLD3 4       /* finished with one, holding a './' 3.3.0 hab */
#ifdef EXPERIMENTAL
#ifndef hab350
#define EL_HLD4 5       /* finished with one, holding a '~/' */
#endif /* hab350 */
#endif /* EXPERIMENTAL */
#define EL_EOF  -1      /* at end of input string */
/*
 *  state of the lexical analyzer
 */
static short	eEnvLexState_m;
/*
 *  pointer to the lexical string
 */
static char *	pszEnvLex_m = NULL;
/*
 *  stores current lexical token
 */
static char	szEnvLexToken_m[MAXLEXSIZE+1];
/*
 *  pointer to whole lexical string 1.9z BJY
 */
static char *	pszEnvLexLine_m;
/*
 *  static global variables used to reduce parameter passing
 */
static unsigned				uiRecordNumber_m     = 0;
static char				szRecordKey_m[MAXLEXSIZE+1];
static const Change *			pEnvirOrthoChanges_m = NULL;
static const StringList *		pCategories_m        = NULL;
static const AmpleProperties *		pProperties_m        = NULL;
static const AmpleCategoryClass *	pCategClasses_m      = NULL;
static const AmpleMorphClass *		pMorphClasses_m      = NULL;
static const StringClass *		pStringClasses_m     = NULL;
static const PunctClass *		pPunctClasses_m      = NULL; /* hab */
static const char *			pszValidCharacters_m = NULL;
static FILE *				pLogFP_m             = NULL;
static StringList **			ppStringList_m       = NULL;
static AmpleAlloEnv **			ppAlloEnvList_m      = NULL;
static char *				pszString_m          = NULL;
static size_t *				puiStringSize_m      = NULL;

/*************************************************************************
 * NAME
 *    initEnvLex
 * ARGUMENTS
 *    line - pointer to a line which is to be lexically scanned
 * DESCRIPTION
 *    Initialize for a lexical scan of an environment constraint string.
 * RETURN VALUE
 *    none
 */
static void initEnvLex(line)
char *line;
{
eEnvLexState_m = EL_INIT;
pszEnvLex_m = line;
pszEnvLexLine_m = line;       /* 1.9z BJY */
}

/*************************************************************************
 * NAME
 *    getEnvLex
 * ARGUMENTS
 *    iType - AMPLE_STRING_ENVIR if string environment,             3.3.0 hab
 *            AMPLE_MORPH_ENVIR  if morpheme environment,
 *            AMPLE_PUNCT_ENVIR  if punctuation environment.
 *            AMPLE_ALLOID_ENVIR  if allomorphs never co-occur. 3.5.0 hab
 * DESCRIPTION
 *    Get the next lexical token, storing a string if needed.
 * RETURN VALUE
 *    integer code for token type (including end of environment), or EOF
 *    if end of input
 */
static int getEnvLex(iType)	/* 3.3.0 hab */
int iType;			/* 3.3.0 hab */
{
register int type;

if (pszEnvLex_m == (char *)NULL)
	return( EOF );
switch (eEnvLexState_m)
	{
	case EL_INIT:               /* just starting an environment */
	type = getEnvToken(iType); /* 3.3.0 hab */
	eEnvLexState_m = (type==EOF) ? EL_EOF : EL_WORK;
	return( type );

	case EL_WORK:               /* in the middle of an environment */
	switch (type = getEnvToken(iType)) /* 3.3.0 hab */
		{
		case EOF:           eEnvLexState_m = EL_EOF;    return( ENV_END );
		case ENV_STRENV:    eEnvLexState_m = EL_HLD1;   return( ENV_END );
		case ENV_MORPH:     eEnvLexState_m = EL_HLD2;   return( ENV_END );
				/* 3.3.0 hab */
		case ENV_PUNCT:     eEnvLexState_m = EL_HLD3;   return( ENV_END );
#ifdef EXPERIMENTAL
#ifndef hab350
		case ENV_ALLOID:    eEnvLexState_m = EL_HLD4;   return( ENV_END );
#endif /* hab350 */
#endif /* EXPERIMENTAL */
		default:                                    return( type );
		}

	case EL_HLD1:               /* saw a '/' previously */
	eEnvLexState_m = EL_WORK;
	return( ENV_STRENV );

	case EL_HLD2:               /* saw a '+/' previously */
	eEnvLexState_m = EL_WORK;
	return( ENV_MORPH );

				/* 3.3.0 hab */
	case EL_HLD3:               /* saw a './' previously */
	eEnvLexState_m = EL_WORK;
	return( ENV_PUNCT );

#ifdef EXPERIMENTAL
#ifndef hab350
	case EL_HLD4:               /* saw a '~/' previously */
	eEnvLexState_m = EL_WORK;
	return( ENV_ALLOID );

#endif /* hab350 */
#endif /* EXPERIMENTAL */
	default:                    /* assume EL_EOF state */
	pszEnvLex_m = (char *)NULL;
	return( EOF );
	}
}

/*************************************************************************
 * NAME
 *    getEnvToken
 * ARGUMENTS
 *    iType - AMPLE_STRING_ENVIR if string environment,             3.3.0 hab
 *            AMPLE_MORPH_ENVIR  if morpheme environment,
 *            AMPLE_PUNCT_ENVIR  if punctuation environment.
 *            AMPLE_ALLOID_ENVIR if allomorphs never co-occur.  3.5.0 hab
 * DESCRIPTION
 *    Load the next lexical token into szEnvLexToken_m.
 *    This is the only lexical function which modifies pszEnvLex_m.
 * RETURN VALUE
 *    type of token found (ENV_...)
 */
static int getEnvToken(iType)	/* 3.3.0 hab */
int iType;			/* 3.3.0 hab */
{
register char *p;
register int ch;
int got_lcurl;
/*
 *  skip leading white space
 */
while (isascii(*pszEnvLex_m) && isspace(*pszEnvLex_m))
	++pszEnvLex_m;

ch = *pszEnvLex_m++;

if (ch == NUL)
	{
	szEnvLexToken_m[0] = ch;        /* end of the input string */
	--pszEnvLex_m;                 /* stay on the NUL */
	return( EOF );
	}
else if ( (strchr("/_#[]()", ch) != (char *)NULL)
	  || ((iType == AMPLE_MORPH_ENVIR) && /* 3.3.0 hab */
		  (strchr("{}", ch) != (char *)NULL)) )
	{
	szEnvLexToken_m[0] = ch;        /* special single character token */
	szEnvLexToken_m[1] = NUL;
	switch (ch)
	{
	case '/':       return( ENV_STRENV );
	case '_':       return( ENV_MARK );
	case '#':       return( ENV_BOUND );
	case '[':       return( ENV_LBRACK );
	case ']':       return( ENV_RBRACK );
	case '(':       return( ENV_LPAREN );
	case ')':       return( ENV_RPAREN );
	case '{':       return( ENV_LCURL );
	case '}':       return( ENV_RCURL );
	default:        return( EOF );                  /* "can't happen" */
	}
	}
#ifdef EXPERIMENTAL
#ifndef hab350
else if ((ch == '~') && (*pszEnvLex_m == '/'))
	{
	szEnvLexToken_m[0] = ch;        /* special two character token */
	szEnvLexToken_m[1] = *pszEnvLex_m++;
	szEnvLexToken_m[2] = NUL;
	return( ENV_ALLOID );
	}
else if ((ch == '~') &&                 /* if tilde and not ANCC */
	 (iType != AMPLE_ALLOID_ENVIR))
#endif /* hab350 */
#else /* EXPERIMENTAL */
else if (ch == '~')                 /* if tilde */
#endif /* EXPERIMENTAL */
	{                               /* if underline next */
	if (*pszEnvLex_m == '_')
	{
	szEnvLexToken_m[0] = ch;        /* special two character token */
	szEnvLexToken_m[1] = *pszEnvLex_m++;
	szEnvLexToken_m[2] = NUL;
	return( ENV_NOTMARK );
	}                           /* else if space underline next */
	else if ( (*pszEnvLex_m == ' ') && (*(pszEnvLex_m+1) == '_' ) )
	{
	szEnvLexToken_m[0] = ch;        /* special two character token */
	pszEnvLex_m++;                 /* move past space */
	szEnvLexToken_m[1] = *pszEnvLex_m++;
	szEnvLexToken_m[2] = NUL;
	return( ENV_NOTMARK );
	}
	else                            /* else (not underline next) */
	{                           /* special single character token */
	szEnvLexToken_m[0] = ch;
	szEnvLexToken_m[1] = NUL;
	return( ENV_NOT );
	}
	}
else if ((ch == '+') && (*pszEnvLex_m == '/'))
	{
	szEnvLexToken_m[0] = ch;        /* special two character token */
	szEnvLexToken_m[1] = *pszEnvLex_m++;
	szEnvLexToken_m[2] = NUL;
	return( ENV_MORPH );
	}
else if ((ch == '.') && (*pszEnvLex_m == '/')) /* 3.3.0 hab */
	{
	szEnvLexToken_m[0] = ch;        /* special two character token */
	szEnvLexToken_m[1] = *pszEnvLex_m++;
	szEnvLexToken_m[2] = NUL;
	return( ENV_PUNCT );
	}
else if ((ch == '.') && (*pszEnvLex_m == '.') && (*(pszEnvLex_m+1) == '.'))
	{
	szEnvLexToken_m[0] = ch;        /* special three character token */
	szEnvLexToken_m[1] = *pszEnvLex_m++;
	szEnvLexToken_m[2] = *pszEnvLex_m++;
	szEnvLexToken_m[3] = NUL;
	return( ENV_ELLIPSIS );
	}
else
	{                           /* literal string */
	p = szEnvLexToken_m;
	got_lcurl = FALSE;
	do  {
	if (ch == '\\')
		{                                   /* get quoted character */
		if (    (*pszEnvLex_m != NUL) &&
			!(isascii(*pszEnvLex_m) && isspace(*pszEnvLex_m)) )
		ch = *pszEnvLex_m++;
		}
	if (ch == '{')
		got_lcurl = TRUE;
	if ((ch == '}') && got_lcurl)
		{
		if (pLogFP_m != NULL)
#ifdef EXPERIMENTAL
#ifndef hab350
		  if (iType != AMPLE_ALLOID_ENVIR)
		fprintf(pLogFP_m, /* 3.3.0 hab */
			  "WARNING: {} invalid in %s environment; entry: %s\n",
			(iType == AMPLE_STRING_ENVIR) ? "string" :
											"punctuation",
			getAmpleRecordIDTag(szRecordKey_m,
						uiRecordNumber_m));
		  else
		fprintf(pLogFP_m,
			 "WARNING: {} invalid in allomorphs never co-occur environment\n");
#endif /* hab350 */
#else /* EXPERIMENTAL */
		fprintf(pLogFP_m, /* 3.3.0 hab */
			  "WARNING: {} invalid in %s environment; entry: %s\n",
			(iType == AMPLE_STRING_ENVIR) ? "string" :
											"punctuation",
			getAmpleRecordIDTag(szRecordKey_m,
						uiRecordNumber_m));
#endif /* EXPERIMENTAL */
		got_lcurl = FALSE;
		}
	if (p < (szEnvLexToken_m + MAXLEXSIZE))     /* store the character */
		*p++ = ch;
	ch = *pszEnvLex_m++;                       /* get next character */
	} while ((ch != NUL) &&
		 (!(isascii(ch) && isspace(ch))) &&
		 ( (strchr("/~_#[](){}",ch) == (char *)NULL)
		   || ((strchr("{}",ch) != (char *)NULL) &&
				iType != AMPLE_MORPH_ENVIR) ) && /* 3.3.0 hab */
		 !((ch == '+')&&(*pszEnvLex_m == '/')) &&
		 !((ch == '.')&&(*pszEnvLex_m == '/')) && /* 3.3.0 hab */
		 !((ch == '.')&& matchBeginning(pszEnvLex_m,"..")) );
	--pszEnvLex_m;                 /* back up to terminating character */
	*p++ = NUL;                 /* terminate the literal string */
	return( ENV_LITERAL );
	}
}

#ifdef TESTING
#define TEST_OUT stdout
/*************************************************************************
 * NAME
 *    main
 * ARGUMENTS
 *    none (that this program uses)
 * DESCRIPTION
 *    test program for the lexical scanning implemented above
 * RETURN VALUE
 *    none
 */
void main()
{
register int k;
char buf[100];
int environment_type;

environment_type = NULL;
while (fgets(buf,sizeof buf, stdin) != (char *)NULL)
	{
	initEnvLex(buf);
	while ((k = getEnvLex(environment_type)) != EOF)
	{
	fprintf(TEST_OUT,"Lexical token value = %d ", k );
	switch (k)
		{
		case ENV_END:
		fprintf(TEST_OUT,"(ENV_END)");
		break;
		case ENV_STRENV:
		fprintf(TEST_OUT,"(ENV_STRENV)");
		environment_type = AMPLE_STRING_ENVIR;
		break;
		case ENV_MORPH:
		fprintf(TEST_OUT,"(ENV_MORPH)");
		environment_type = AMPLE_MORPH_ENVIR;
		break;
		case ENV_BOUND:
		fprintf(TEST_OUT,"(ENV_BOUND)");
		break;
		case ENV_ELLIPSIS:
		fprintf(TEST_OUT,"(ENV_ELLIPSIS)");
		break;
		case ENV_LBRACK:
		fprintf(TEST_OUT,"(ENV_LBRACK)");
		break;
		case ENV_RBRACK:
		fprintf(TEST_OUT,"(ENV_RBRACK)");
		break;
		case ENV_LCURL:
		fprintf(TEST_OUT,"(ENV_LCURL)");
		break;
		case ENV_RCURL:
		fprintf(TEST_OUT,"(ENV_RCURL)");
		break;
		case ENV_MARK:
		fprintf(TEST_OUT,"(ENV_MARK)");
		break;
		case ENV_NOT:
		fprintf(TEST_OUT,"(ENV_NOT)");
		break;
		case ENV_LITERAL:
		fprintf(TEST_OUT,"(ENV_LITERAL)");
		fprintf(TEST_OUT," = \"%s\"", szEnvLexToken_m);
		break;
		case ENV_LPAREN:
		fprintf(TEST_OUT,"(ENV_LPAREN)");
		break;
		case ENV_RPAREN:
		fprintf(TEST_OUT,"(ENV_RPAREN)");
		break;
		default:
		fprintf(TEST_OUT,"<<UNKNOWN>>");
		break;
		}
	fprintf(TEST_OUT,"\n");
	}
	}
}
#endif

/*************************************************************************
 * NAME
 *    add_string
 * ARGUMENTS
 *    string - pointer to string to add to string list
 * DESCRIPTION
 *    If string doesn't already exist in string list, add it
 * RETURN VALUE
 *    pointer to string in string list
 */
static char * add_string( string )
char *	string;
{
StringList *	slistp;
/*
 * search the string list for a duplicate string
 */
if (ppStringList_m == NULL)
	return duplicateString(string);
for ( slistp = *ppStringList_m ; slistp ; slistp = slistp->pNext )
	{
	/*
	 * if found, exit, leaving slistp pointing to the proper link
	 */
	if (strcmp( string, slistp->pszString ) == 0)
	break;
	}
/*
 * if not found...
 */
if ( !slistp )
	{
	/*
	 * add the string to the list
	 */
	slistp = (StringList *)allocMemory(sizeof(StringList));
	slistp->pszString = duplicateString( string );
	slistp->pNext = *ppStringList_m;
	*ppStringList_m = slistp;
	}
return( slistp->pszString );
}

/*************************************************************************
 * NAME
 *    epar_error
 * ARGUMENTS
 *    fmt - a printf() style format string
 *    arg - argument for fmt
 * DESCRIPTION
 *    Print an error message regarding the parsing of environments.
 * RETURN VALUE
 *    none
 */
static void epar_error(fmt, arg)
char *	fmt;
char *	arg;
{
if (pLogFP_m == NULL)
	return;

fprintf(pLogFP_m, "%s", pszEnvErrHead_m );
fprintf(pLogFP_m, fmt, arg );
if ((pszEnvErrTail_m != (char *)NULL) && (pszEnvParseType_m != (char *)NULL))
	{
	fprintf(pLogFP_m, pszEnvErrTail_m, pszEnvParseType_m );
	fprintf(pLogFP_m, " in entry: %s\n",
		getAmpleRecordIDTag(szRecordKey_m, uiRecordNumber_m) );
	}
}

/*************************************************************************
 * NAME
 *    show_badenv
 * ARGUMENTS
 *    envir - pointer to entire environment string
 * DESCRIPTION
 *    Print the environment, showing where the error was detected.
 * RETURN VALUE
 *    none
 */
static void show_badenv(envir)
char *	envir;
{
char *	p;

if (pLogFP_m == NULL)
	return;

for (	fprintf(pLogFP_m,"%8s"," "), p = envir ;
	*p != NUL ;
	putc(*p++, pLogFP_m) )
	{
	if (p == pszEnvLex_m)
	fprintf(pLogFP_m,"<<ERROR DETECTED HERE>>");
	}
if (p == pszEnvLex_m)
	fprintf(pLogFP_m,"<<ERROR DETECTED HERE>>");
fprintf(pLogFP_m, "\n");
}

/*************************************************************************
 * NAME
 *    env_side
 * ARGUMENTS
 *    token   - first token of this side of the environment
 *    iType   - AMPLE_STRING_ENVIR if string environment,        3.3.0 hab
 *              AMPLE_MORPH_ENVIR  if morpheme environment,
 *              AMPLE_PUNCT_ENVIR  if punctuation environment.
 *              AMPLE_ALLOID_ENVIR if allomorphs never co-occur. 3.5.0 hab
 *    isright - nonzero if right side, zero if left side
 *    flags   - pointer to ec_flags field for env_cond structure
 * DESCRIPTION
 *    Parse one side of an environment.  The list of env_item's is
 *    built such that the first element is closest to the '_' and the last
 *    element is farthest away.
 * RETURN VALUE
 *    pointer to the list of env_item structures, or NULL if an error
 *    occurs
 */
static AmpleEnvItem * env_side(token, iType, isright, flags) /* 3.3.0 hab */
int		token;
int		iType;		/* 3.3.0 hab */
int		isright;
char *		flags;
{
AmpleEnvItem *	env           = NULL;
AmpleEnvItem *	env_tail      = NULL;
AmpleEnvItem *	pe;
int		myflags       = 0;	/* what to put in ei_flags field */
int		need_bracklit = FALSE;	/* have just seen a '[' */
int		need_brack    = FALSE;	/* have just seen '[' <CLASSNAME> */
int		need_curlit   = FALSE;	/* have just seen a '{' */
int		need_curl     = FALSE;	/* have just seen '{' <LITERAL> */
int		need_optitem  = FALSE;	/* have just seen a '(' */
int		need_paren    = FALSE;	/* have just seen '(' <item> */
int		need_end      = FALSE;	/* if (isright), have seen a 2nd '#' */
int		pre_bound     = FALSE;	/* morpheme occurred before word
					   boundary in left environment
					   constraint */
int		bound_count   = 0;	/* word boundary count */
char *		p;

for ( ;; token = getEnvLex(iType) )   /* do forever... */
	{
	/*
	 *  check for absence of absolutely required items
	 */
	if (need_bracklit && (token != ENV_LITERAL))
	{
	epar_error("Missing class name", "");
	goto bad_side;
	}
	if (need_brack && (token != ENV_RBRACK))
	{
	epar_error("Missing ']'", "" );
	goto bad_side;
	}
	if (need_curlit && (token != ENV_LITERAL))
	{
	epar_error("Missing name in curly braces", "");
	goto bad_side;
	}
	if (need_curl && (token != ENV_RCURL))
	{
	epar_error("Missing '}'", "" );
	goto bad_side;
	}
	if (need_optitem
		&& (token != ENV_LITERAL)
		&& (token != ENV_NOT)
		&& (token != ENV_LBRACK)
		&& (token != ENV_RBRACK)
		&& (token != ENV_LCURL)
		&& (token != ENV_RCURL) )
	{
	epar_error("Missing optional item", "");
	goto bad_side;
	}
	if (need_paren && (token != ENV_RPAREN))
	{
	epar_error("Missing ')'", "" );
	goto bad_side;
	}
	if (need_end && (token != ENV_END) && (token != EOF))
	{
		goto bad_bound;
	}
	/*
	 *  take action based on what you see
	 */
	switch (token)
	{
	case EOF:
	case ENV_END:
		if (!isright)
		{
		epar_error("Missing '_'","");
		goto bad_side;
		}
		if (myflags & E_NOT)
		epar_error("Invalid '~'","");
		if (myflags & E_ELLIPSIS)
		epar_error("Invalid '...'","");
		return( env );               /* GOOD RETURN FOR RIGHT SIDE */

	case ENV_BOUND:
		bound_count++;

		if ( isright && (bound_count == 2) )
		need_end = TRUE;
		else if (!isright)
		{
		if ( (bound_count == 1) && (env != NULL) )
			pre_bound = TRUE;
		else if ( (bound_count == 2) && (pre_bound) )
			{
bad_bound:          epar_error("Invalid '#'", "");
			goto bad_side;
			}
		}
		goto new_item;              /* share code with ENV_LITERAL */

	case ENV_ELLIPSIS:
		if (iType == AMPLE_PUNCT_ENVIR) /* 3.3.0 hab */
			epar_error("Ellipsis '...' not allowed", "");
		else if (isright)
		myflags |= E_ELLIPSIS;          /* right side */
		else if (env == (AmpleEnvItem *)NULL)
		epar_error("Invalid '...'", "");
		else
		env->iFlags |= E_ELLIPSIS;    /* left side */
		break;

	case ENV_LBRACK:
#ifdef EXPERIMENTAL
#ifndef hab350
		if (iType == AMPLE_ALLOID_ENVIR)
			{
			epar_error("Classes not allowed", "");
		break;
		}
#endif /* hab350 */
#endif /* EXPERIMENTAL */
		need_bracklit = TRUE;            /* need a class name following */
		myflags |= E_CLASS;
		break;

	case ENV_LCURL:
#ifdef EXPERIMENTAL
#ifndef hab350
		if (iType == AMPLE_ALLOID_ENVIR)
			{
			epar_error("Braces not allowed", "");
		break;
		}
#endif /* hab350 */
#endif /* EXPERIMENTAL */
		need_curlit = TRUE;     /* need a literal following */
		myflags |= E_GROUP;
		break;

	case ENV_RBRACK:
		if (!need_brack)            /* want ']' only if needed */
		{
		epar_error("Unexpected ']' found", "");
		goto bad_side;
		}
		need_brack = FALSE;         /* we don't need it anymore */
		if (need_optitem)
		{                                       /* finished item */
		need_optitem = FALSE;
		need_paren = TRUE;
		}
		break;

	case ENV_RCURL:
		if (!need_curl)            /* want '}' only if needed */
		{
		epar_error("Unexpected '}' found", "");
		goto bad_side;
		}
		need_curl = FALSE;         /* we don't need it anymore */
		if (need_optitem)
		{                                       /* finished item */
		need_optitem = FALSE;
		need_paren = TRUE;
		}
		break;

	case ENV_MARK:
		if (isright)
		{
		epar_error("Second '_' found", "");
		goto bad_side;
		}
		else
		return( env );   /* GOOD RETURN FOR LEFT SIDE */

	case ENV_NOTMARK:
		if (isright)
		{
		epar_error("Second '_' found", "");
		goto bad_side;
		}
		else
		{
		*flags |= E_NOT;        /* mark a negative environment */
		return( env );   /* GOOD RETURN FOR LEFT SIDE */
		}

	case ENV_NOT:
		if (myflags & E_NOT)
		epar_error("Invalid '~'", "");
		myflags |= E_NOT;
		break;

	case ENV_LITERAL:
		if (need_bracklit)
		{
		need_bracklit = FALSE;
		need_brack = TRUE;
		}
		else if (need_curlit)
		{
		need_curlit = FALSE;
		need_curl = TRUE;
		}
		else if (need_optitem)
		{                                       /* finished item */
		need_optitem = FALSE;
		need_paren = TRUE;
		}

new_item:
		pe = (AmpleEnvItem *)allocMemory(sizeof(AmpleEnvItem));
		if (token == ENV_BOUND)
		pe->u.pszString = (char *)NULL;    /* mark boundary */

		else if (myflags & E_GROUP)
		{
		if (iType == AMPLE_MORPH_ENVIR)	/* 3.3.0 hab */
			{
			pe->u.pszString = add_string(szEnvLexToken_m);
			if ( !( (strcmp( szEnvLexToken_m, "root" )   == 0) ||
				(strcmp( szEnvLexToken_m, "prefix" ) == 0) ||
				(strcmp( szEnvLexToken_m, "infix" )  == 0) ||
				(strcmp( szEnvLexToken_m, "suffix" ) == 0) ||
				findAmplePropertyNumber(szEnvLexToken_m,
							pProperties_m) ||
				findAmpleCategoryNumber(szEnvLexToken_m,
						 pCategories_m) ||
	/* 1.4x BJY */	    findAmpleCategClass( szEnvLexToken_m,
						 pCategClasses_m)))
			{		/* 1.5 BJY  Also check for mcl now */
			pe->u.pClass = (AmpleMorphClass *)findAmpleMorphClass(
								  szEnvLexToken_m,
								  pMorphClasses_m);
			if (pe->u.pClass == (AmpleMorphClass *)NULL)
				{
				epar_error("Undefined property %s",
					   szEnvLexToken_m);
				goto bad_side;
				}
			else
				{
				/*
				 *  found a morpheme class, so change flag
				 */
				myflags &= ~E_GROUP;
				myflags |= E_CLASS;
				}
			}
			}
		else
			{
			epar_error("Invalid construct {%s}", szEnvLexToken_m );
			goto bad_side;
			}
		}
		else if (myflags & E_CLASS)
		{		/* 3.3.0 hab */
		if (iType == AMPLE_MORPH_ENVIR)   /* get morpheme class */
			{
			pe->u.pClass = findAmpleMorphClass(szEnvLexToken_m,
							   pMorphClasses_m);
			if (pe->u.pClass == (AmpleMorphClass *)NULL)
			{
			/* 1.5 BJY
			 *  Also look for categories and properties now
			 */
			pe->u.pszString = add_string(szEnvLexToken_m);
			if ( !( (strcmp( szEnvLexToken_m, "root" ) == 0)   ||
				(strcmp( szEnvLexToken_m, "prefix" ) == 0) ||
				(strcmp( szEnvLexToken_m, "infix" ) == 0)  ||
				(strcmp( szEnvLexToken_m, "suffix" ) == 0) ||
				findAmplePropertyNumber(szEnvLexToken_m,
							pProperties_m) ||
				findAmpleCategoryNumber(szEnvLexToken_m,
							pCategories_m) ||
	/* 1.4x BJY */		findAmpleCategClass( szEnvLexToken_m,
							 pCategClasses_m)))
				{
				epar_error("Undefined morpheme class %s",
						szEnvLexToken_m );
				goto bad_side;
				}
			else
				{		/* found category or property */
				myflags &= ~E_CLASS;
				myflags |= E_GROUP;		/* change flag */
				}
			}
			}
		else if (iType == AMPLE_PUNCT_ENVIR) /* 3.3.0 hab */
			{		/* get punctuation class */
			pe->u.pClass = findPunctClass(szEnvLexToken_m,
						   pPunctClasses_m);
			if (pe->u.pClass == (PunctClass *)NULL)
			{
			epar_error("Undefined punctuation class %s",
				   szEnvLexToken_m );
			goto bad_side;
			}
			}
		else		/* get reduplication class or string class */
			{
			pe->u.pClass = findStringClass(szEnvLexToken_m,
						   pStringClasses_m);
			if (pe->u.pClass == (StringClass *)NULL)
			{
			epar_error("Undefined string class %s",
				   szEnvLexToken_m );
			goto bad_side;
			}
			}
		}
		else                /* literal string or morphname */
		{
#ifdef EXPERIMENTAL
#ifndef hab350
		if (iType == AMPLE_MORPH_ENVIR || /* 3.3.0 hab */
			iType == AMPLE_PUNCT_ENVIR ||
			iType == AMPLE_ALLOID_ENVIR)
#endif /* hab350 */
#else /* EXPERIMENTAL */
		if (iType == AMPLE_MORPH_ENVIR || /* 3.3.0 hab */
			iType == AMPLE_PUNCT_ENVIR)
#endif /* EXPERIMENTAL */
			pe->u.pszString = add_string(szEnvLexToken_m);
		else
			{
			/*
			 *  apply orthochanges
			 *  1.9z BJY check for invalid chars
			 */
			p = applyChanges(szEnvLexToken_m, pEnvirOrthoChanges_m);
			validateAmpleString( p, "string environment constraint",
					 getAmpleRecordIDTag(szRecordKey_m,
								 uiRecordNumber_m),
					 pszEnvLexLine_m,
					 pszValidCharacters_m,
					 pLogFP_m);
			pe->u.pszString = add_string(p);
			if (p != pe->u.pszString)
			freeMemory(p);
			}
		}
		pe->iFlags = myflags;
		if (iType == AMPLE_MORPH_ENVIR) /* 3.3.0 hab */
		pe->iFlags |= E_MORPHEME;
		else if (iType == AMPLE_PUNCT_ENVIR)
		pe->iFlags |= E_PUNCT;
#ifdef EXPERIMENTAL
#ifndef hab350
		else if (iType == AMPLE_ALLOID_ENVIR)
		pe->iFlags |= E_ALLOID;
#endif /* hab350 */
#endif /* EXPERIMENTAL */
		myflags = 0;          /* reset for the next item */

		if (isright)
		{
		if (	(env_tail              != NULL) &&
			(pe->iFlags            == 0)    &&
			(env_tail->iFlags      == 0)    &&
			(pe->u.pszString       != NULL) &&
			(env_tail->u.pszString != NULL) )
			{
			/*
			 *  merge this string onto the previous string
			 */
#ifdef HAVE_ALLOCA
			p = (char *)alloca(strlen(env_tail->u.pszString) +
							  strlen(pe->u.pszString) + 1);
#else
			p = (char *)allocMemory(strlen(env_tail->u.pszString) +
							  strlen(pe->u.pszString) + 1);
#endif
			strcat(strcpy(p, env_tail->u.pszString), pe->u.pszString);
			freeMemory(pe);
			env_tail->u.pszString = add_string(p);
#ifndef HAVE_ALLOCA
			freeMemory(p);
#endif
			}
		else
			{
			if (env == (AmpleEnvItem *)NULL)
			env = pe;           /* link at the tail of the list */
			else
			env_tail->pNext = pe;
			env_tail = pe;
			}
		}
		else
		{
		if (	(env              != NULL) &&
			(pe->iFlags       == 0)    &&
			(env->iFlags      == 0)    &&
			(pe->u.pszString  != NULL) &&
			(env->u.pszString != NULL) )
			{
			/*
			 *  merge this string onto the previous string
			 */
#ifdef HAVE_ALLOCA
			p = (char *)alloca(strlen(env->u.pszString) +
							  strlen(pe->u.pszString) + 1);
#else
			p = (char *)allocMemory(strlen(env->u.pszString) +
							  strlen(pe->u.pszString) + 1);
#endif
			strcat(strcpy(p, env->u.pszString), pe->u.pszString);
			freeMemory(pe);
			env->u.pszString = add_string(p);
#ifndef HAVE_ALLOCA
			freeMemory(p);
#endif
			}
		else
			{
			pe->pNext = env;      /* link at the head of the list */
			env = pe;
			}
		}
		break;

	case ENV_LPAREN:
		need_optitem = TRUE;           /* need an item following */
		myflags |= E_OPTIONAL;
		break;

	case ENV_RPAREN:
		if (!need_paren)            /* want ')' only if needed */
		{
		epar_error("Unexpected ')' found", "");
		goto bad_side;
		}
		need_paren = FALSE;         /* we don't need it anymore */
		break;

	default:
		epar_error("Invalid input '%s'", szEnvLexToken_m);
		goto bad_side;

	} /* end switch (token) */
	} /* end for (;;) */

bad_side:               /* here only on parse error */

return( (AmpleEnvItem *)NULL );      /* ERROR RETURN */

}

/*****************************************************************************
 * NAME
 *    goesPastBound
 * DESCRIPTION
 *    check whether this side of an environment constraint goes past a word
 *    boundary
 * RETURN VALUE
 *    TRUE if this side of an environment constraint goes past a word boundary,
 *    otherwise FALSE
 */
static int goesPastBound(pEnvSide_in)
AmpleEnvItem *	pEnvSide_in;
{
AmpleEnvItem *	pEnv;

for ( pEnv = pEnvSide_in ; pEnv ; pEnv = pEnv->pNext )
	{
	if ((pEnv->iFlags & E_CLASS) || (pEnv->u.pszString != (char *)NULL))
	continue;
	if (pEnv->pNext != NULL)
	return TRUE;
	}
return FALSE;
}

/*************************************************************************
 * NAME
 *    env_parse
 * ARGUMENTS
 *    iType - AMPLE_STRING_ENVIR if string environment,             3.3.0 hab
 *            AMPLE_MORPH_ENVIR  if morpheme environment,
 *            AMPLE_PUNCT_ENVIR  if punctuation environment.
 *            AMPLE_ALLOID_ENVIR if allomorphs never co-occur.      3.5.0 hab
 * DESCRIPTION
 *    Parse a single environment constraint, building the structure for the
 *    interpreter to run over later.
 * RETURN VALUE
 *    pointer to the env_cond structure, or NULL if an error occurs
 */
static AmpleEnvConstraint * env_parse(iType) /* 3.3.0 hab */
int		iType;		/* 3.3.0 hab */
{
AmpleEnvConstraint *	ec;
int			token;
				/* 3.3.0 hab */
#ifdef EXPERIMENTAL
#ifndef hab350
pszEnvParseType_m = (iType == AMPLE_MORPH_ENVIR) ? "morpheme" :
					(iType == AMPLE_STRING_ENVIR) ? "string" :
					(iType == AMPLE_PUNCT_ENVIR) ? "punctuation" : "never";
#endif /* hab350 */
#else /* EXPERIMENTAL */
pszEnvParseType_m = (iType == AMPLE_MORPH_ENVIR) ? "morpheme" :
					(iType == AMPLE_STRING_ENVIR) ? "string" : "punctuation";
#endif /* EXPERIMENTAL */
ec = (AmpleEnvConstraint *)allocMemory(sizeof(AmpleEnvConstraint));
				/* 3.3.0 hab */
ec->eType = iType;
ec->bNot  = FALSE;
/*
 *  parse the left side of the environment (before the '_')
 */
token = getEnvLex(iType);	/* 3.3.0 hab */
if ((token == EOF) || (token == ENV_END))
	goto empty_env;                     /* no environment after all */
else if (token == ENV_NOTMARK)
	ec->bNot = TRUE;			/* starts with "~_" */
else if (token != ENV_MARK)
	{
	ec->pLeftEnv = env_side(token, iType, LEFT_SIDE, &ec->bNot); /* 3.3.0 hab*/
	if (ec->pLeftEnv == (AmpleEnvItem *)NULL)
	goto bad_side;                  /* parsing error occurred */
	}
/*
 *  parse the right side of the environment (after the '_')
 */
token = getEnvLex(iType);	/* 3.3.0 hab */
if ((token != EOF) && (token != ENV_END))
	{
	ec->pRightEnv = env_side(token, iType, RIGHT_SIDE, &ec->bNot); /* 3.3.0 hab */
	if (ec->pRightEnv == (AmpleEnvItem *)NULL)
	goto bad_side;                  /* parsing error occurred */
	}
else if (ec->pLeftEnv == (AmpleEnvItem *)NULL)
	goto empty_env;             /* only a '_', nothing on either side */
/*
 *  mark whether adjacent words needed in this environment constraint
 */
ec->bUsesPrevWord = goesPastBound(ec->pLeftEnv);
ec->bUsesNextWord = goesPastBound(ec->pRightEnv);
				/* 3.3.0 hab */
if (iType == AMPLE_PUNCT_ENVIR &&
	(ec->bUsesPrevWord ||
	 ec->bUsesNextWord))
	{
	if (pLogFP_m != NULL)
		fprintf(pLogFP_m, "%s%s environment constraints may not cross word boundaries\n",
		pszEnvErrHead_m, pszEnvParseType_m );
	goto bad_side;
	}
return( ec );                           /* successful return */

empty_env:                              /* no environment */
#ifndef hab341
epar_error("Empty %s environment constraint", pszEnvParseType_m);
#else
if (pLogFP_m != NULL)
	fprintf(pLogFP_m, "%sEmpty %s environment constraint\n",
		pszEnvErrHead_m, pszEnvParseType_m );
#endif /* hab341 */

bad_side:

return( (AmpleEnvConstraint *)NULL );
}

/*************************************************************************
 * NAME
 *    env_item_comp
 * ARGUMENTS
 *    ei1 - pointer to first list of environment items
 *    ei2 - pointer to second list of environment items
 * DESCRIPTION
 *    Compare the two lists of environment items
 * RETURN VALUE
 *    TRUE if the lists are equivalent, FALSE if not
 */
static int env_item_comp( ei1, ei2 )
AmpleEnvItem *	ei1;
AmpleEnvItem *	ei2;
{
int		same;
AmpleEnvItem *	ei1p;
AmpleEnvItem *	ei2p;

same = TRUE;
for ( ei1p = ei1, ei2p = ei2; same; ei1p = ei1p->pNext,
					ei2p = ei2p->pNext )
	{
	/* if end of both environment lists, we have a match! */
	if (!ei1p && !ei2p)
	break;
	/* if end of only one environment list, we have a mismatch */
	else if (!ei1p || !ei2p)
	same = FALSE;
	/* if flags are different, we have a mismatch */
	else if ( ei1p->iFlags != ei2p->iFlags )
	same = FALSE;
	/* if a literal, and strings are different, we have a mismatch */
	else if ( !(ei1p->iFlags & E_CLASS) )
	{
	if (	(ei1p->u.pszString == NULL) ||
		(ei2p->u.pszString == NULL) ||			/* 1.4v BJY */
		(strcmp(ei1p->u.pszString, ei2p->u.pszString) != 0) )
		same = FALSE;
	}
	/* else if classes are different, we have a mismatch;
	   Since morpheme class structures are identical to
	   string class structures, use the string class pointers
	   to handle both classes */
	else if (ei1p->u.pClass != ei2p->u.pClass)
	same = FALSE;
	if (!same)      /* 1.4v BJY avoid null pointer access at end of loop */
	break;
	}
return( same );
}

/*************************************************************************
 * NAME
 *    env_cond_comp
 * ARGUMENTS
 *    ec1 - pointer to first env_cond structure
 *    ec2 - pointer to second env_cond structure
 * DESCRIPTION
 *    Compare the two env_cond structures
 * RETURN VALUE
 *    TRUE if the structures are equivalent, FALSE if not
 */
static int env_cond_comp( ec1, ec2 )
AmpleEnvConstraint *	ec1;
AmpleEnvConstraint *	ec2;
{
/* compare flags */
if (ec1->bNot != ec2->bNot)
	return( FALSE );
if (ec1->eType != ec2->eType)
	return( FALSE );
/* compare left environment items */
if ( !env_item_comp( ec1->pLeftEnv, ec2->pLeftEnv ) )
	return( FALSE );
/* compare right environment items */
if ( !env_item_comp( ec1->pRightEnv, ec2->pRightEnv ) )
	return( FALSE );
/* nothing failed */
return( TRUE );
}

/*************************************************************************
 * NAME
 *    env_comp
 * ARGUMENTS
 *    env1 - pointer to first list of environment constraints
 *    env2 - pointer to second list of environment constraints
 * DESCRIPTION
 *    Compare the two lists of environment constraints
 * RETURN VALUE
 *    TRUE if the lists are equivalent, FALSE if not
 */
static int env_comp( env1, env2 )
AmpleEnvConstraint *	env1;
AmpleEnvConstraint *	env2;
{
int			same;
AmpleEnvConstraint *	env1p;
AmpleEnvConstraint *	env2p;

same = TRUE;
for ( env1p = env1, env2p = env2; same; env1p = env1p->pNext,
					env2p = env2p->pNext )
	{
	/* if end of both environment lists, we have a match! */
	if (!env1p && !env2p)
	break;
	/* if end of only one environment, we have a mismatch */
	else if (!env1p || !env2p)
	same = FALSE;
	/* if environment items aren't the same, we have a mismatch */
	else if ( !env_cond_comp( env1p, env2p ) )
	same = FALSE;
	if (!same)      /* 1.4v BJY avoid null pointer access at end of loop */
	break;
	}
return( same );
}

/*************************************************************************
 * NAME
 *    allo_env_comp
 * ARGUMENTS
 *    aenv1 - pointer to first allo_env structure
 *    aenv2 - pointer to second allo_env structure
 * DESCRIPTION
 *    Compare the two allo_env structures
 * RETURN VALUE
 *    TRUE if the structures are equivalent, FALSE if not
 */
static int allo_env_comp( aenv1, aenv2 )
AmpleAlloEnv *	aenv1;
AmpleAlloEnv *	aenv2;
{
if ( env_comp( aenv1->pStringCond, aenv2->pStringCond ) &&
	 env_comp( aenv1->pMorphCond, aenv2->pMorphCond ) )
	return( TRUE );
return( FALSE );
}

/*************************************************************************
 * NAME
 *    env_add
 * DESCRIPTION
 *    If the aenv constraint isn't already in *ppAlloEnvList_m, add it and
 *    return its address; otherwise, return the address of the already-existing
 *    copy in *ppAlloEnvList_m and free the memory used by aenv
 * RETURN VALUE
 *    pointer to allo_env structure containing the constraints, or NULL
 *    if none or error
 */
static AmpleAlloEnv * env_add( aenv )
AmpleAlloEnv *	aenv;	/* pointer to AmpleAlloEnv to add to list of allomorph
			 * environment constraints */
{
AmpleAlloEnv *	aelistp;

if (ppAlloEnvList_m == NULL)
	return aenv;

for ( aelistp = *ppAlloEnvList_m ; aelistp ; aelistp = aelistp->pLink )
	{
	if ( allo_env_comp( aenv, aelistp ) )
	{
	freeAmpleAlloEnvConstraint( aenv );
	return( aelistp );
	}
	}
aenv->pLink      = *ppAlloEnvList_m;
*ppAlloEnvList_m = aenv;
return( aenv );
}

/***************************************************************************
 * NAME
 *    show_left
 * ARGUMENTS
 *    pEnvItem_in - pointer to list of env_item structures
 * DESCRIPTION
 *    Display the contents of a list of env_item's, which are to the left
 *    of the environment bar.
 * RETURN VALUE
 *    none
 */
static void show_left(pEnvItem_in, bSGML_in)
AmpleEnvItem *	pEnvItem_in;
int		bSGML_in;
{
char	szOpen[8];
char	szClose[12];
char *	pszName;

if (	(pLogFP_m == NULL) &&
	((pszString_m == NULL) || (puiStringSize_m == NULL)) )
	return;
/*
 *  use recursion to move across the list of items
 *  (want to show items in reverse order of storage)
 */
if (pEnvItem_in == (AmpleEnvItem *)NULL)
	return;
show_left( pEnvItem_in->pNext, bSGML_in );

szOpen[0]  = NUL;
szClose[0] = NUL;
if ( pEnvItem_in->iFlags & E_OPTIONAL )
	strcat(szOpen, "(");
if ( pEnvItem_in->iFlags & E_NOT )
	strcat(szOpen, "~");
if ( pEnvItem_in->iFlags & E_GROUP )
	strcat(szOpen, "{");
if ( pEnvItem_in->iFlags & E_CLASS )
	{
	strcat(szOpen, "[");
	pszName = (pEnvItem_in->iFlags & E_MORPHEME) ?
			((AmpleMorphClass *)(pEnvItem_in->u.pClass))->pszName :
			((StringClass *)(pEnvItem_in->u.pClass))->pszName;
	strcat(szClose, "]");
	}
else if ( pEnvItem_in->u.pszString )
	pszName = pEnvItem_in->u.pszString;
else
	pszName = "#";
if ( pEnvItem_in->iFlags & E_GROUP )
	strcat(szClose, "}");
if ( pEnvItem_in->iFlags & E_OPTIONAL )
	strcat(szClose, ")");
if ( pEnvItem_in->iFlags & E_ELLIPSIS )
	strcat(szClose," ...");
strcat(szClose, " ");

if (pszString_m != NULL)
	{
	if (bSGML_in)
	{
	char *	pszTemp;
	if (szOpen[0] != NUL)
		{
		char * pszStr;
#ifdef HAVE_ALLOCA
		pszStr = (char *)alloca(lengthAmpleCDATA(szOpen, FALSE) + 1);
#else
		pszStr = (char *)allocMemory(lengthAmpleCDATA(szOpen, FALSE) + 1);
#endif
		storeAmpleCDATA(pszStr, szOpen, FALSE);
		pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
						   pszStr);
#ifndef HAVE_ALLOCA
		freeMemory(pszStr);
#endif
		}
#ifdef HAVE_ALLOCA
	pszTemp = (char *)alloca(lengthAmpleCDATA(pszName, FALSE) + 1);
#else
	pszTemp = (char *)allocMemory(lengthAmpleCDATA(pszName, FALSE) + 1);
#endif
	storeAmpleCDATA(pszTemp, pszName, FALSE);
	pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
					   pszTemp);
#ifndef HAVE_ALLOCA
	freeMemory(pszTemp);
#endif
	if (szClose[0] != NUL)
		{
		char * pszStr;
#ifdef HAVE_ALLOCA
		pszStr = (char *)alloca(lengthAmpleCDATA(szClose, FALSE) + 1);
#else
		pszStr = (char *)allocMemory(lengthAmpleCDATA(szClose, FALSE) + 1);
#endif
		storeAmpleCDATA(pszStr, szClose, FALSE);
		pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
						   pszStr);
#ifndef HAVE_ALLOCA
		freeMemory(pszStr);
#endif
		}
	}
	else
	{
	if (szOpen[0] != NUL)
		pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
						   szOpen);
	pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
					   pszName);
	if (szClose[0] != NUL)
		pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
						   szClose);
	}
	}
else if (pLogFP_m != NULL)
	{
	if (bSGML_in)
	{
	if (szOpen[0] != NUL)
		writeAmpleCDATA(pLogFP_m, szOpen, FALSE);
	writeAmpleCDATA(pLogFP_m, pszName, FALSE);
	if (szClose[0] != NUL)
		writeAmpleCDATA(pLogFP_m, szClose, FALSE);
	}
	else
	{
	if (szOpen[0] != NUL)
		fputs(szOpen, pLogFP_m);
	fputs(pszName, pLogFP_m);
	if (szClose[0] != NUL)
		fputs(szClose, pLogFP_m);
	}
	}
}

/***************************************************************************
 * NAME
 *    show_right
 * ARGUMENTS
 *    pEnvItem_in - pointer to list of env_item structures
 * DESCRIPTION
 *    Display the contents of a list of env_item's, which are to the right
 *    of the environment bar.
 * RETURN VALUE
 *    none
 */
static void show_right(pEnvItem_in, bSGML_in)
AmpleEnvItem *	pEnvItem_in;
int		bSGML_in;
{
AmpleEnvItem * pEI;
char	       szOpen[12];
char	       szClose[8];
char *	       pszName;

if (	(pLogFP_m == NULL) &&
	((pszString_m == NULL) || (puiStringSize_m == NULL)) )
	return;

for ( pEI = pEnvItem_in ; pEI ; pEI = pEI->pNext )
	{
	strcpy(szOpen, " ");
	szClose[0] = NUL;
	if ( pEI->iFlags & E_ELLIPSIS )
	strcat(szOpen,"... ");
	if ( pEI->iFlags & E_OPTIONAL )
	strcat(szOpen, "(");
	if ( pEI->iFlags & E_NOT )
	strcat(szOpen, "~");
	if ( pEI->iFlags & E_GROUP )
	strcat(szOpen, "{");
	if ( pEI->iFlags & E_CLASS )
	{
	strcat(szOpen, "[");
	pszName = (pEI->iFlags & E_MORPHEME) ?
		((AmpleMorphClass *)(pEI->u.pClass))->pszName :
		((StringClass *)(pEI->u.pClass))->pszName;
	strcat(szClose, "]");
	}
	else if ( pEI->u.pszString )
	pszName = pEI->u.pszString;
	else
	pszName = "#";
	if ( pEI->iFlags & E_GROUP )
	strcat(szClose, "}");
	if ( pEI->iFlags & E_OPTIONAL )
	strcat(szClose, ")");

	if (pszString_m != NULL)
	{
	if (bSGML_in)
		{
		char * pszTemp;
		if (szOpen[0] != NUL)
		{
		char * pszStr;
#ifdef HAVE_ALLOCA
		pszStr = (char *)alloca(lengthAmpleCDATA(szOpen, FALSE) + 1);
#else
		pszStr = (char *)allocMemory(lengthAmpleCDATA(szOpen,FALSE)+1);
#endif
		storeAmpleCDATA(pszStr, szOpen, FALSE);
		pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
						  pszStr);
#ifndef HAVE_ALLOCA
		freeMemory(pszStr);
#endif
		}
#ifdef HAVE_ALLOCA
		pszTemp = (char *)alloca(lengthAmpleCDATA(pszName, FALSE) + 1);
#else
		pszTemp = (char *)allocMemory(lengthAmpleCDATA(pszName,FALSE) + 1);
#endif
		storeAmpleCDATA(pszTemp, pszName, FALSE);
		pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
						  pszTemp);
#ifndef HAVE_ALLOCA
		freeMemory(pszTemp);
#endif
		if (szClose[0] != NUL)
		{
		char * pszStr;
#ifdef HAVE_ALLOCA
		pszStr = (char *)alloca(lengthAmpleCDATA(szClose, FALSE) + 1);
#else
		pszStr = (char *)allocMemory(lengthAmpleCDATA(szClose,
								  FALSE) + 1);
#endif
		storeAmpleCDATA(pszStr, szClose, FALSE);
		pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
						  pszStr);
#ifndef HAVE_ALLOCA
		freeMemory(pszStr);
#endif
		}
		}
	else
		{
		if (szOpen[0] != NUL)
		pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
						  szOpen);
		pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
						  pszName);
		if (szClose[0] != NUL)
		pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
						  szClose);
		}
	}
	else if (pLogFP_m != NULL)
	{
	if (bSGML_in)
		{
		writeAmpleCDATA( pLogFP_m, szOpen, FALSE);
		writeAmpleCDATA( pLogFP_m, pszName, FALSE);
		if (szClose[0] != NUL)
		writeAmpleCDATA( pLogFP_m, szClose, FALSE);
		}
	else
		{
		fputs(szOpen, pLogFP_m);
		fputs(pszName, pLogFP_m);
		if (szClose[0] != NUL)
		fputs(szClose, pLogFP_m);
		}
	}
	}
}

/***************************************************************************
 * NAME
 *    writeAmpleEnvConstraint
 * ARGUMENTS
 *    ec - pointer to a list of env_cond structures
 * DESCRIPTION
 *    Display the contents of a list of env_cond's.
 * RETURN VALUE
 *    none
 */
void writeAmpleEnvConstraint(outfp, ec, bSGML_in)
FILE *			outfp;
AmpleEnvConstraint *	ec;
int			bSGML_in;
{
resetLocalGlobals();
pLogFP_m = outfp;
if (pLogFP_m == NULL)
	return;

for ( ; ec ; ec = ec->pNext )
	{
	/*
	 *  show the appropriate marker
	 */
	if (bSGML_in)
	{
	if (ec->eType == AMPLE_MORPH_ENVIR)
		writeAmpleCDATA(pLogFP_m, "  +/ ", FALSE);
	else if (ec->eType == AMPLE_STRING_ENVIR) /* 3.3.0 hab */
		writeAmpleCDATA(pLogFP_m, "   / ", FALSE);
	else
		writeAmpleCDATA(pLogFP_m, "  ./ ", FALSE);
	}
	else
	{
	if (ec->eType == AMPLE_MORPH_ENVIR)
		fprintf(pLogFP_m, "  +/ ");
	else if (ec->eType == AMPLE_STRING_ENVIR) /* 3.3.0 hab */
		fprintf(pLogFP_m, "   / ");
	else
		fprintf(pLogFP_m, "  ./ ");
	}
	/*
	 *  show the left side
	 */
	show_left( ec->pLeftEnv, bSGML_in );
	/*
	 *  show the environment bar
	 */
	if (bSGML_in)
	{
	if (ec->bNot)
		writeAmpleCDATA(pLogFP_m, "~", FALSE);
	writeAmpleCDATA(pLogFP_m, "_", FALSE);
	}
	else
	{
	if (ec->bNot)
		fprintf(pLogFP_m, "~");
	fprintf(pLogFP_m, "_");
	}
	/*
	 *  show the right side
	 */
	show_right( ec->pRightEnv, bSGML_in );
	}
pLogFP_m = NULL;
}

/*****************************************************************************
 * NAME
 *    writeAmplePCDATA
 * DESCRIPTION
 *    write a string of #PCDATA to an SGML file
 * RETURN VALUE
 *    none
 */
void writeAmplePCDATA(pOutputFP_in, pszPCDATA_in, b7Bit_in)
FILE *		pOutputFP_in;
const char *	pszPCDATA_in;
int		b7Bit_in;
{
const char *	p;
int		iChar;

resetLocalGlobals();
if ((pszPCDATA_in == NULL) || (pOutputFP_in == NULL))
	return;
for ( p = pszPCDATA_in ; *p ; ++p )
	{
	iChar = *p & 0xFF;
	switch (iChar)
	{
	case '&':
		fputs("&amp;", pOutputFP_in);
		break;
	case '<':
		fputs("&lt;", pOutputFP_in);
		break;
	case ']':
		fputs("&rsqb;", pOutputFP_in);
		break;
#ifdef FULL_ENTITIES
	case '"':
		fputs("&quot;", pOutputFP_in);
		break;
#endif
	default:
		if (b7Bit_in && (iChar & 0x80))
		fprintf(pOutputFP_in, "&#%3d;", iChar);
		else
		fputc( iChar, pOutputFP_in );
		break;
	}
	}
}

/*****************************************************************************
 * NAME
 *    lengthAmplePCDATA
 * DESCRIPTION
 *    calculate the length of a string of #PCDATA
 * RETURN VALUE
 *    the length of the string needed to store the #PCDATA
 */
size_t lengthAmplePCDATA(pszPCDATA_in, b7Bit_in)
const char *	pszPCDATA_in;
int		b7Bit_in;
{
const char *	p;
int		iChar;
size_t		uiLength;

resetLocalGlobals();
if (pszPCDATA_in == NULL)
	return 0;
for ( uiLength = 0, p = pszPCDATA_in ; *p ; ++p )
	{
	iChar = *p & 0xFF;
	switch (iChar)
	{
	case '&':
		uiLength += 5;
		break;
	case '<':
		uiLength += 4;
		break;
	case ']':
		uiLength += 6;
		break;
#ifdef FULL_ENTITIES
	case '"':
		uiLength += 6;
		break;
#endif
	default:
		if (b7Bit_in && (iChar & 0x80))
		uiLength += 6;
		else
		++uiLength;
		break;
	}
	}
return uiLength;
}

/*****************************************************************************
 * NAME
 *    storeAmplePCDATA
 * DESCRIPTION
 *    store a string as #PCDATA
 * RETURN VALUE
 *    none
 */
void storeAmplePCDATA(pszOutput_in, pszPCDATA_in, b7Bit_in)
char *		pszOutput_in;
const char *	pszPCDATA_in;
int		b7Bit_in;
{
const char *	p;
char *		q;
int		iChar;

resetLocalGlobals();
if ((pszPCDATA_in == NULL) || (pszOutput_in == NULL))
	return;
*pszOutput_in = NUL;
for ( q = pszOutput_in, p = pszPCDATA_in ; *p ; ++p )
	{
	iChar = *p & 0xFF;
	switch (iChar)
	{
	case '&':
		strcpy(q, "&amp;");
		q += 5;
		break;
	case '<':
		strcpy(q, "&lt;");
		q += 4;
		break;
	case ']':
		strcpy(q, "&rsqb;");
		q += 6;
		break;
#ifdef FULL_ENTITIES
	case '"':
		strcpy(q, "&quot;");
		q += 6;
		break;
#endif
	default:
		if (b7Bit_in && (iChar & 0x80))
		{
		sprintf(q, "&#%3d;", iChar);
		q += 6;
		}
		else
		{
		*q++ = iChar;
		*q   = NUL;
		}
		break;
	}
	}
}

/*****************************************************************************
 * NAME
 *    writeAmpleCDATA
 * DESCRIPTION
 *    write a string of CDATA to an SGML file
 * RETURN VALUE
 *    none
 */
void writeAmpleCDATA(pOutputFP_in, pszCDATA_in, b7Bit_in)
FILE *		pOutputFP_in;
const char *	pszCDATA_in;
int		b7Bit_in;
{
const char *	p;
int		iChar;

resetLocalGlobals();
if ((pszCDATA_in == NULL) || (pOutputFP_in == NULL))
	return;
for ( p = pszCDATA_in ; *p ; ++p )
	{
	iChar = *p & 0xFF;
	switch (iChar)
	{
	case '&':
		fputs("&amp;", pOutputFP_in);
		break;
	case '"':
		fputs("&quot;", pOutputFP_in);
		break;
	default:
		if (b7Bit_in && (iChar & 0x80))
		fprintf(pOutputFP_in, "&#%3d;", iChar);
		else
		fputc( iChar, pOutputFP_in );
		break;
	}
	}
}

/*****************************************************************************
 * NAME
 *    lengthAmpleCDATA
 * DESCRIPTION
 *    calculate the length of a string of CDATA
 * RETURN VALUE
 *    the length of the string needed to store the CDATA
 */
size_t lengthAmpleCDATA(pszCDATA_in, b7Bit_in)
const char *	pszCDATA_in;
int		b7Bit_in;
{
const char *	p;
int		iChar;
size_t		uiLength;

resetLocalGlobals();
if (pszCDATA_in == NULL)
	return 0;
for ( uiLength = 0, p = pszCDATA_in ; *p ; ++p )
	{
	iChar = *p & 0xFF;
	switch (iChar)
	{
	case '&':
		uiLength += 5;
		break;
	case '"':
		uiLength += 6;
		break;
	default:
		if (b7Bit_in && (iChar & 0x80))
		uiLength += 6;
		else
		++uiLength;
		break;
	}
	}
return uiLength;
}

/*****************************************************************************
 * NAME
 *    storeAmpleCDATA
 * DESCRIPTION
 *    store a string as CDATA
 * RETURN VALUE
 *    none
 */
void storeAmpleCDATA(pszOutput_in, pszCDATA_in, b7Bit_in)
char *		pszOutput_in;
const char *	pszCDATA_in;
int		b7Bit_in;
{
const char *	p;
char *		q;
int		iChar;

resetLocalGlobals();
if ((pszCDATA_in == NULL) || (pszOutput_in == NULL))
	return;
*pszOutput_in = NUL;
for ( q = pszOutput_in, p = pszCDATA_in ; *p ; ++p )
	{
	iChar = *p & 0xFF;
	switch (iChar)
	{
	case '&':
		strcpy(q, "&amp;");
		q += 5;
		break;
	case '"':
		strcpy(q, "&quot;");
		q += 6;
		break;
	default:
		if (b7Bit_in && (iChar & 0x80))
		{
		sprintf(q, "&#%3d;", iChar);
		q += 6;
		}
		else
		{
		*q++ = iChar;
		*q   = NUL;
		}
		break;
	}
	}
}

/*************************************************************************
 * NAME
 *    free_env_item
 * DESCRIPTION
 *    free the memory used by a list of AmpleEnvItem struct
 * RETURN VALUE
 *    none
 */
static void free_env_item( ei )
AmpleEnvItem *	ei;
{
AmpleEnvItem *	eip;

while (ei)
	{
	eip = ei;
	ei = ei->pNext;
	freeMemory( (char *)eip );
	}
}

/*************************************************************************
 * NAME
 *    freeAmpleEnvConstraint
 * DESCRIPTION
 *    free the memory allocated for a list of AmpleEnvConstraint structs
 * RETURN VALUE
 *    none
 */
void freeAmpleEnvConstraint( ec )
AmpleEnvConstraint *	ec;
{
AmpleEnvConstraint *	ecp;

resetLocalGlobals();
while ( ec )
	{
	ecp = ec;
	ec = ec->pNext;
	free_env_item( ecp->pLeftEnv );
	free_env_item( ecp->pRightEnv );
	freeMemory( (char *)ecp );
	}
}

/*************************************************************************
 * NAME
 *    freeAmpleAlloEnvConstraint
 * DESCRIPTION
 *    free the memory allocated for an AMPLE allomorph environment constraint
 * RETURN VALUE
 *    none
 */
void freeAmpleAlloEnvConstraint( pAlloEnv_io )
AmpleAlloEnv *pAlloEnv_io;
{
resetLocalGlobals();
freeAmpleEnvConstraint( pAlloEnv_io->pStringCond );
freeAmpleEnvConstraint( pAlloEnv_io->pMorphCond );
#ifndef hab3318
freeAmpleEnvConstraint( pAlloEnv_io->pPunctCond );
#endif /* hab3318 */
freeMemory( (char *)pAlloEnv_io );
}

/*************************************************************************
 * NAME
 *    parseAmpleAlloEnvConstraint
 * ARGUMENTS
 *    line      - pointer to NUL-terminated string containing the environment
 *                constraints on an allomorph
 *    parserror - pointer to error flag for the environment parsing
 * DESCRIPTION
 *    Parse the environment constraint string for an allomorph, which
 *    may contain either string environment constraints or morpheme
 *    environment constraints, or a mixture of both.
 * RETURN VALUE
 *    pointer to allo_env structure containing the constraints, or NULL
 *    if none or error
 */
AmpleAlloEnv * parseAmpleAlloEnvConstraint(line, parserror,
					   uiRecordNumber_in, pszRecordKey_in,
					   pOrthoChanges_in, pCategories_in,
					   pProperties_in, pCategClasses_in,
					   pMorphClasses_in, pStringClasses_in,
					   pPunctClasses_in, /* 3.3.0 hab */
					   pszValidChars_in, pLogFP_in,
					   ppStringList_io, ppAlloEnvList_io)
char *				line;
int *				parserror;
unsigned			uiRecordNumber_in;
const char *			pszRecordKey_in;
const Change *			pOrthoChanges_in;
const StringList *		pCategories_in;
const AmpleProperties *		pProperties_in;
const AmpleCategoryClass *	pCategClasses_in;
const AmpleMorphClass *		pMorphClasses_in;
const StringClass *		pStringClasses_in;
const PunctClass *		pPunctClasses_in; /* 3.3.0 hab */
const char *			pszValidChars_in;
FILE *				pLogFP_in;
StringList **			ppStringList_io;
AmpleAlloEnv **			ppAlloEnvList_io;
{
int			token;
AmpleAlloEnv *		a_env;
AmpleEnvConstraint *	e_cond;

resetLocalGlobals();
*parserror = FALSE;             /* no errors yet */
/*
 *  first, check for an empty environment
 */
if (line == (char *)NULL)
	return( (AmpleAlloEnv *)NULL);	/* no environment */
line += strspn(line, szWhitespace_m);	/* skip leading whitespace */
if (*line == NUL)
	return( (AmpleAlloEnv *)NULL);	/* no environment */

uiRecordNumber_m     = uiRecordNumber_in;
if ((pszRecordKey_in != NULL) && (*pszRecordKey_in != NUL))
	strncpy(szRecordKey_m, pszRecordKey_in, MAXLEXSIZE);
else
	strcpy(szRecordKey_m, "unknown");
pEnvirOrthoChanges_m = pOrthoChanges_in;
pCategories_m        = pCategories_in;
pProperties_m        = pProperties_in;
pCategClasses_m      = pCategClasses_in;
pMorphClasses_m      = pMorphClasses_in;
pStringClasses_m     = pStringClasses_in;
pPunctClasses_m      = pPunctClasses_in; /* 3.3.0 hab */
pszValidCharacters_m = pszValidChars_in;
pLogFP_m             = pLogFP_in;
ppStringList_m       = ppStringList_io;
ppAlloEnvList_m      = ppAlloEnvList_io;

pszEnvErrHead_m = "ALLOMORPH ENVIRONMENT: ";
pszEnvErrTail_m = " in a %s environment";

initEnvLex(line);                        /* initialize the lexical scan */

a_env = (AmpleAlloEnv *)allocMemory(sizeof(AmpleAlloEnv));

while ( (token = getEnvLex(0)) != EOF )
	{
	if (    (token == ENV_STRENV) &&
		((e_cond = env_parse(AMPLE_STRING_ENVIR)) != NULL))
	{
	e_cond->pNext = a_env->pStringCond;
	a_env->pStringCond = e_cond;    /* link into the proper list */
	}
	else if ((token == ENV_MORPH) &&
		 ((e_cond = env_parse(AMPLE_MORPH_ENVIR)) != NULL))
	{
	e_cond->pNext = a_env->pMorphCond;
	a_env->pMorphCond = e_cond;     /* link into the proper list */
	}
	else if ((token == ENV_PUNCT) && /* 3.3.0 hab */
		 ((e_cond = env_parse(AMPLE_PUNCT_ENVIR)) != NULL))
	{
	e_cond->pNext = a_env->pPunctCond;
	a_env->pPunctCond = e_cond;     /* link into the proper list */
	}
	else
	{
	*parserror = TRUE;      /* nothing else if valid here */
	break;
	}
	}
if (*parserror)
	show_badenv(line);                  /* show the bad environment */
/*
 *  if no string or morpheme environment constraints, then free the space
 *  and return NULL
 */
if (    (a_env->pStringCond == (AmpleEnvConstraint *)NULL) &&
		(a_env->pPunctCond  == (AmpleEnvConstraint *)NULL) && /* 3.3.0 hab */
	(a_env->pMorphCond  == (AmpleEnvConstraint *)NULL) )
	{
	freeMemory( a_env );
	a_env = NULL;
	}
else
	a_env = env_add( a_env );
/*
 *  reset the temporary globals
 */
uiRecordNumber_m     = 0;
memset(szRecordKey_m, 0, MAXLEXSIZE+1);
pEnvirOrthoChanges_m = NULL;
pCategories_m        = NULL;
pProperties_m        = NULL;
pCategClasses_m      = NULL;
pMorphClasses_m      = NULL;
pStringClasses_m     = NULL;
pPunctClasses_m      = NULL;	/* 3.3.0 hab */
pszValidCharacters_m = NULL;
pLogFP_m             = NULL;
ppStringList_m       = NULL;
ppAlloEnvList_m      = NULL;

return( a_env );
}

/*************************************************************************
 * NAME
 *    parseAmpleInfixEnvConstraint
 * ARGUMENTS
 *    line - pointer to NUL-terminated string containing the environment
 *              constraints on an infix
 * DESCRIPTION
 *    Parse the environment constraint string for an infix, which may
 *    contain only string environment constraints.
 * RETURN VALUE
 *    pointer to env_cond structure containing the constraints, or NULL
 *    if none or error
 */
AmpleEnvConstraint * parseAmpleInfixEnvConstraint(line, uiRecordNumber_in,
						  pszRecordKey_in,
						  pOrthoChanges_in,
						  pCategories_in,
						  pProperties_in,
						  pCategClasses_in,
						  pMorphClasses_in,
						  pStringClasses_in,
						  pszValidChars_in, pLogFP_in,
						  ppStringList_io)
char *				line;
unsigned			uiRecordNumber_in;
const char *			pszRecordKey_in;
const Change *			pOrthoChanges_in;
const StringList *		pCategories_in;
const AmpleProperties *		pProperties_in;
const AmpleCategoryClass *	pCategClasses_in;
const AmpleMorphClass *		pMorphClasses_in;
const StringClass *		pStringClasses_in;
const char *			pszValidChars_in;
FILE *				pLogFP_in;
StringList **			ppStringList_io;
{
int			token;
AmpleEnvConstraint *	e_cond;
AmpleEnvConstraint *	head;
AmpleEnvConstraint *	tail;
int			parserror;
/*
 *  first, check for an empty environment
 */
resetLocalGlobals();
if (line == (char *)NULL)
	return( (AmpleEnvConstraint *)NULL);   /* no environment */
line += strspn(line, szWhitespace_m);	/* skip leading whitespace */
if (*line == NUL)
	return( (AmpleEnvConstraint *)NULL);   /* no environment */

uiRecordNumber_m     = uiRecordNumber_in;
if ((pszRecordKey_in != NULL) && (*pszRecordKey_in != NUL))
	strncpy(szRecordKey_m, pszRecordKey_in, MAXLEXSIZE);
else
	strcpy(szRecordKey_m, "unknown");
pEnvirOrthoChanges_m = pOrthoChanges_in;
pCategories_m        = pCategories_in;
pProperties_m        = pProperties_in;
pCategClasses_m      = pCategClasses_in;
pMorphClasses_m      = pMorphClasses_in;
pStringClasses_m     = pStringClasses_in;
pszValidCharacters_m = pszValidChars_in;
pLogFP_m             = pLogFP_in;
ppStringList_m       = ppStringList_io;
ppAlloEnvList_m      = NULL;

pszEnvErrHead_m = "INFIX ENVIRONMENT: ";
pszEnvErrTail_m = (char *)NULL;

initEnvLex(line);                        /* initialize the lexical scan */
parserror = FALSE;                      /* no errors yet */

head = tail = (AmpleEnvConstraint *)NULL;

while ( (token = getEnvLex(0)) != EOF )
	{
	if (token == ENV_MORPH ||
	token == ENV_PUNCT)	/* 3.3.0 hab */
	token = ENV_STRENV;     /* only string environments, so why not? */
	if (    (token == ENV_STRENV) &&
		((e_cond = env_parse(AMPLE_STRING_ENVIR)) != NULL))
	{
				/* link it into the list, preserving the order
				 * of the input */
	if (head == (AmpleEnvConstraint *) NULL )
		head = tail = e_cond;
	else
		{
		tail->pNext = e_cond;
		tail = e_cond;
		}
	}
	else
	{
	parserror = TRUE;       /* nothing else if valid here */
	break;
	}
	}
if (parserror)
	show_badenv(line);                  /* show the bad environment */
/*
 *  reset the temporary globals
 */
uiRecordNumber_m     = 0;
memset(szRecordKey_m, 0, MAXLEXSIZE+1);
pEnvirOrthoChanges_m = NULL;
pCategories_m        = NULL;
pProperties_m        = NULL;
pCategClasses_m      = NULL;
pMorphClasses_m      = NULL;
pStringClasses_m     = NULL;
pszValidCharacters_m = NULL;
pLogFP_m             = NULL;
ppStringList_m       = NULL;
ppAlloEnvList_m      = NULL;

return( head );
}

/*************************************************************************
 * NAME
 *    parseAmpleMorphEnvConstraint
 * ARGUMENTS
 *    str - pointer to a string defining a morpheme environment constraint
 * DESCRIPTION
 *    Parse a morpheme environment constraint, build the env_cond structure
 *    for it.
 * RETURN VALUE
 *    pointer to the list built, or NULL if an error occurred.
 */
AmpleEnvConstraint * parseAmpleMorphEnvConstraint(str, pszRecordKey_in,
						  pCategories_in,
						  pProperties_in,
						  pCategClasses_in,
						  pMorphClasses_in, pLogFP_in,
						  ppStringList_io)
char *				str;
const char *			pszRecordKey_in;
const StringList *		pCategories_in;
const AmpleProperties *		pProperties_in;
const AmpleCategoryClass *	pCategClasses_in;
const AmpleMorphClass *		pMorphClasses_in;
FILE *				pLogFP_in;
StringList **			ppStringList_io;
{
int			token;
AmpleEnvConstraint *	e_cond;
AmpleEnvConstraint *	head;
int			parserror;
/*
 *  first, check for an empty environment
 */
resetLocalGlobals();
if (str == NULL)
	return NULL;	/* no environment */
str += strspn(str, szWhitespace_m);
if (*str == NUL)
	return NULL;	/* no environment */

uiRecordNumber_m     = 0;
if ((pszRecordKey_in != NULL) && (*pszRecordKey_in != NUL))
	strncpy(szRecordKey_m, pszRecordKey_in, 64);
else
	strcpy(szRecordKey_m, "unknown");
pEnvirOrthoChanges_m = NULL;
pCategories_m        = pCategories_in;
pProperties_m        = pProperties_in;
pCategClasses_m      = pCategClasses_in;
pMorphClasses_m      = pMorphClasses_in;
pStringClasses_m     = NULL;
pszValidCharacters_m = NULL;
pLogFP_m             = pLogFP_in;
ppStringList_m       = ppStringList_io;
ppAlloEnvList_m      = NULL;

pszEnvErrHead_m = "\nMORPHEME ENVIRONMENT: ";
pszEnvErrTail_m = NULL;
initEnvLex(str);		/* initialize the lexical scan */
parserror = FALSE;		/* no errors yet */
head      = NULL;

while ( (token = getEnvLex(0)) != EOF )
	{
	if (token == ENV_STRENV)
		token = ENV_MORPH;      /* only morpheme environments, so why not? */
	if ( (token == ENV_MORPH) &&
		 ((e_cond = env_parse(AMPLE_MORPH_ENVIR)) != NULL))
		{
		e_cond->pNext = head; /* link into the list */
		head = e_cond;
		}
	else
		{
		parserror = TRUE;       /* nothing else if valid here */
		break;
		}
	}
if (parserror)
	show_badenv(str);                   /* show the bad environment */
/*
 *  reset the temporary globals
 */
uiRecordNumber_m     = 0;
memset(szRecordKey_m, 0, MAXLEXSIZE+1);
pEnvirOrthoChanges_m = NULL;
pCategories_m        = NULL;
pProperties_m        = NULL;
pCategClasses_m      = NULL;
pMorphClasses_m      = NULL;
pStringClasses_m     = NULL;
pszValidCharacters_m = NULL;
pLogFP_m             = NULL;
ppStringList_m       = NULL;
ppAlloEnvList_m      = NULL;

return( head );
}

#ifdef EXPERIMENTAL
#ifndef hab350
/*************************************************************************
 * NAME
 *    parseAmpleNeverEnvConstraint
 * ARGUMENTS
 *    str - pointer to a string defining an allomorphs never co-occur
 *          constraint
 * DESCRIPTION
 *    Parse an allomorphs never co-occur constraint, build the
 *    env_cond structure for it.
 * RETURN VALUE
 *    pointer to the list built, or NULL if an error occurred.
 */
AmpleEnvConstraint * parseAmpleNeverEnvConstraint(str, pszRecordKey_in,
						  pCategories_in,
						  pProperties_in,
						  pCategClasses_in,
						  pMorphClasses_in, pLogFP_in,
						  ppStringList_io)
char *				str;
const char *			pszRecordKey_in;
const StringList *		pCategories_in;
const AmpleProperties *		pProperties_in;
const AmpleCategoryClass *	pCategClasses_in;
const AmpleMorphClass *		pMorphClasses_in;
FILE *				pLogFP_in;
StringList **			ppStringList_io;
{
int			token;
AmpleEnvConstraint *	e_cond;
AmpleEnvConstraint *	head;
int			parserror;
/*
 *  first, check for an empty environment
 */
resetLocalGlobals();
if (str == NULL)
	return NULL;	/* no environment */
str += strspn(str, szWhitespace_m);
if (*str == NUL)
	return NULL;	/* no environment */

uiRecordNumber_m     = 0;
if ((pszRecordKey_in != NULL) && (*pszRecordKey_in != NUL))
	strncpy(szRecordKey_m, pszRecordKey_in, 64);
else
	strcpy(szRecordKey_m, "unknown");
pEnvirOrthoChanges_m = NULL;
pCategories_m        = pCategories_in;
pProperties_m        = pProperties_in;
pCategClasses_m      = pCategClasses_in;
pMorphClasses_m      = pMorphClasses_in;
pStringClasses_m     = NULL;
pszValidCharacters_m = NULL;
pLogFP_m             = pLogFP_in;
ppStringList_m       = ppStringList_io;
ppAlloEnvList_m      = NULL;

pszEnvErrHead_m = "\nALLOMORPHS NEVER CO_OCCUR: ";
pszEnvErrTail_m = NULL;
initEnvLex(str);		/* initialize the lexical scan */
parserror = FALSE;		/* no errors yet */
head      = NULL;

while ( (token = getEnvLex(0)) != EOF )
	{
	if (token == ENV_STRENV ||
	token == ENV_MORPH  ||
	token == ENV_PUNCT)
		token = ENV_ALLOID;      /* only allos never co-occur, so why not? */
	if ( (token == ENV_ALLOID) &&
		 ((e_cond = env_parse(AMPLE_ALLOID_ENVIR)) != NULL))
		{
		e_cond->pNext = head; /* link into the list */
		head = e_cond;
		}
	else
		{
		parserror = TRUE;       /* nothing else if valid here */
		break;
		}
	}
if (parserror)
	show_badenv(str);                   /* show the bad environment */
/*
 *  reset the temporary globals
 */
uiRecordNumber_m     = 0;
memset(szRecordKey_m, 0, MAXLEXSIZE+1);
pEnvirOrthoChanges_m = NULL;
pCategories_m        = NULL;
pProperties_m        = NULL;
pCategClasses_m      = NULL;
pMorphClasses_m      = NULL;
pStringClasses_m     = NULL;
pszValidCharacters_m = NULL;
pLogFP_m             = NULL;
ppStringList_m       = NULL;
ppAlloEnvList_m      = NULL;

return( head );
}
#endif /* hab350 */
#endif /* EXPERIMENTAL */

/*****************************************************************************
 * NAME
 *    stringifyAmpleEnvConstraint
 * DESCRIPTION
 *    add the expansion of the given environment constraint to the end of the
 *    dynamically allocated string
 * RETURN VALUE
 *    pointer to the (possibly reallocated) dynamic string
 */
char * stringifyAmpleEnvConstraint(pszString_io, puiStringSize_io,
				   pEnvConstraint_in, bSGML_in)
char *               pszString_io;
size_t *             puiStringSize_io;
AmpleEnvConstraint * pEnvConstraint_in;
int                  bSGML_in;
{
AmpleEnvConstraint * pEC;
char *               pszSlash;
char *		     pszBar;
char		     szBuffer[32];

resetLocalGlobals();
if ((pszString_io == NULL) || (puiStringSize_io == NULL))
	return pszString_io;

pszString_m     = pszString_io;
puiStringSize_m = puiStringSize_io;

for ( pEC = pEnvConstraint_in ; pEC ; pEC = pEC->pNext )
	{
	/*
	 *  show the appropriate marker
	 */
	if (pEC->eType == AMPLE_MORPH_ENVIR)
	pszSlash = "  +/ ";
	else
	pszSlash = "   / ";
	if (bSGML_in)
	{
	storeAmpleCDATA(szBuffer, pszSlash, FALSE);
	pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
					   szBuffer);
	}
	else
	{
	pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
					   pszSlash);
	}
	/*
	 *  show the left side
	 */
	show_left( pEC->pLeftEnv, bSGML_in );

	/*
	 *  show the environment bar
	 */
	if (pEC->bNot)
	pszBar = "~_";
	else
	pszBar = "_";
	if (bSGML_in)
	{
	storeAmpleCDATA(szBuffer, pszBar, FALSE);
	pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
					   szBuffer);
	}
	else
	{
	pszString_m = appendDynamicString(pszString_m, puiStringSize_m,
					   pszBar);
	}
	/*
	 *  show the right side
	 */
	show_right( pEC->pRightEnv, bSGML_in );
	}
return pszString_m;
}

/*****************************************************************************
 * NAME
 *    resetLocalGlobals
 * DESCRIPTION
 *    reset all of the local global variables to their original pristine state
 * RETURN VALUE
 *    none
 */
static void resetLocalGlobals()
{
pszEnvErrHead_m      = NULL;
pszEnvErrTail_m      = NULL;
pszEnvParseType_m    = NULL;
eEnvLexState_m       = 0;
pszEnvLex_m          = NULL;
pszEnvLexLine_m      = NULL;
uiRecordNumber_m     = 0;
pEnvirOrthoChanges_m = NULL;
pCategories_m        = NULL;
pProperties_m        = NULL;
pCategClasses_m      = NULL;
pMorphClasses_m      = NULL;
pStringClasses_m     = NULL;
pPunctClasses_m      = NULL;	/* 3.3.0 hab */
pszValidCharacters_m = NULL;
pLogFP_m             = NULL;
ppStringList_m       = NULL;
ppAlloEnvList_m      = NULL;
pszString_m          = NULL;
puiStringSize_m      = NULL;
memset(szEnvLexToken_m, 0, sizeof(szEnvLexToken_m));
memset(szRecordKey_m, 0, sizeof(szRecordKey_m));
}
