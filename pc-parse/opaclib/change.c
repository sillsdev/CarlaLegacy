/* CHANGE.C - functions for working with string changes
 ***************************************************************************
 *
 * Change * parseChangeString(const char *          pszString_in,
 *			      const StringClasses * pClasses_in)
 * char * applyChanges(const char *   pszString_in,
 *		       const Change * pChangeList_in)
 * char * buildChangeString(const Change * pChange_in)
 * int getChangeQuote(const char * pszOld_in, const char * pszNew_in)
 * void freeChangeList(Change * pList_io)
 * void writeChange(const Change * pChange_in, FILE * pOutputFP_in)
 *
 ***************************************************************************
 * edit history is at the end of change.h
 ***************************************************************************
 * Copyright 1988, 2000 by SIL International.  All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#include <stdlib.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern char * strcpy  P((char * dest, const char * src));
extern char * strncpy P((char * dest, const char * src, size_t n));
extern char * strcat  P((char * dest, const char * src));
extern char * strchr  P((const char * s, int c));
extern size_t strspn  P((const char * s, const char * accept));
extern char * strstr  P((const char * s1, const char * s2));
extern size_t strlen  P((const char * s));
#endif /* STDC_HEADERS */
#ifdef HAVE_ALLOCA
#ifdef HAVE_ALLOCA_H
#include <alloca.h>
#else
void * alloca(size_t size);
#endif
#endif
#include "cportlib.h"
#include "allocmem.h"
#include "textctl.h"
#include "strclass.h"
#include "change.h"
#include "rpterror.h"

#ifndef BUFSIZE
#define BUFSIZE 128
#endif
#ifndef TRUE
#define TRUE 1
#endif
#ifndef FALSE
#define FALSE 0
#endif
#ifndef NUL
#define NUL '\0'
#endif

/* OPAC library functions */
extern int matchBeginning P((const char *s, const char *t));
extern int matchEnd P((const char *s, const char *t));

/* local functions */
static char *	xxrealloc P((char *buf, size_t size, char *temp));
static void	xxfree P((char *buf, char *temp));
static void	elex_init P((char *line));
static int	elex_get P((void));
static int	elex_tok P((void));
static void	epar_error P((const char * pszError_in));
static void	show_badenv P((char *envir));
static ChgEnvItem * env_side P((int token, int isright, short * pbNot_out,
				const StringClass * pClasses_in));
static ChangeEnvironment * env_parse P((const StringClass * pClasses_in));
static ChangeEnvironment * parse_environment P((char * pszEnvir_in,
						 const StringClass * pClasses_in));
static int	senv_left P((char *left, ChgEnvItem *env));
static int	senv_right P((char *right, ChgEnvItem *env));
static char *	shorten P((char *string, int size));
static int	chk_senv_left P((int size, char *left, ChgEnvItem *env,
				 char *match));
static int	chk_senv_right P((int size, char *right, ChgEnvItem *env));
static int	check_change_environment P((char *leftstring , int leftsize ,
						char *rightstring ,
						ChangeEnvironment *ec ));
static char *	split_line P((char *line, char **p_rep, char **p_marks,
				  char **p_env));

/***************************************************************************
 * NAME
 *    parseChangeString
 * ARGUMENTS
 *    cp  - pointer to a change definition string
 * DESCRIPTION
 *    Parse a single record entry to build a change_list structure.
 * RETURN VALUE
 *    pointer to newly allocated change_list node, or NULL if error
 */
Change * parseChangeString(pszChange_in, pClasses_in)
const char *		pszChange_in;
const StringClass *	pClasses_in;
{
static char errhead[] = "CHANGE: ";
Change *cc;
ChangeEnvironment *pe;
char *	match;
char *	replace;
char *	env;
char *	buffer;
char *	pszDescription;
/*
 *  split the change into its pieces, and make sure that everything is okay
 */
buffer = duplicateString(pszChange_in);
if (buffer == (char *)NULL)
	return( (Change *)NULL );
pszDescription = strstr(buffer, " // ");
if (pszDescription != NULL)
	{
	*pszDescription = '\0';
	pszDescription += 4;
	pszDescription += strspn(pszDescription, " \t\f\r\n\v");
	if (*pszDescription == '\0')
	pszDescription = NULL;
	}
match = split_line(buffer, &replace, (char **)NULL, &env);
if (match == NULL)
	{
	reportError(ERROR_MSG,
		"%sInvalid change definition: %s\n", errhead, pszChange_in);
	freeMemory(buffer);
	return( (Change *)NULL );
	}
if (env)
	{
	pe = parse_environment( env, pClasses_in );
	if (!pe)
	{
	reportError(ERROR_MSG,
			"%sInvalid environment in change: %s\n",
			errhead, pszChange_in);
	freeMemory(buffer);
	return( (Change *)NULL );
	}
	}
else
	pe = (ChangeEnvironment *)NULL;
/*
 *  allocate and fill in a change_list struct, then return its address
 */
if ((match != NULL) && (replace != NULL))
	{
	cc = (Change *)allocMemory(sizeof(Change));
	cc->pszMatch       = duplicateString( match );
	cc->pszReplace     = duplicateString( replace );
	cc->pEnvironment   = pe;
	cc->pszDescription = duplicateString( pszDescription );
	cc->pNext          = NULL;
	}
else
	cc = (Change *)NULL;
freeMemory(buffer);
return( cc );
}

static char * xxrealloc(pszBuffer, uiNeededSize, pszAutoBuffer)
char *	pszBuffer;
size_t	uiNeededSize;
char *	pszAutoBuffer;
{
char *	pszNewBuffer;

if (pszBuffer == (char *)NULL)
	pszNewBuffer = allocMemory(uiNeededSize);
else if (pszBuffer == pszAutoBuffer)
	pszNewBuffer = strcpy(allocMemory(uiNeededSize), pszBuffer);
else
	pszNewBuffer = reallocMemory(pszBuffer, uiNeededSize);
return(pszNewBuffer);
}

static void xxfree(pszBuffer, pszAutoBuffer)
char *	pszBuffer;
char *	pszAutoBuffer;
{
if (pszBuffer != pszAutoBuffer)
	freeMemory(pszBuffer);
}

/***************************************************************************
 * NAME
 *    applyChanges
 * ARGUMENTS
 *    pszString_in   - pointer to string to be changed
 *    pChangeList_in - pointer to list of changes to apply
 * DESCRIPTION
 *    Apply a list of changes to a string, iterating over the change list
 *    and substituting for each match in the string.
 * RETURN VALUE
 *    pointer to dynamically allocated and (possibly) changed string
 */
char *applyChanges(pszString_in, pChangeList_in)
const char *	pszString_in;
const Change *	pChangeList_in;
{
char		szBuffer1[BUFSIZE];
char		szBuffer2[BUFSIZE];
char *		pszOldBuffer;
char *		pszNewBuffer;
size_t		uiOldSize;
size_t		uiNewSize;
char *		pszOld;
char *		pszNew;
char *		pszPosition;
size_t		uiLength;
size_t		uiMatchLength;
size_t		uiReplaceLength;
const Change *	pChange;

if (pszString_in == NULL)
	return( NULL );
if (pChangeList_in == NULL)
	return( duplicateString(pszString_in) );
/*
 *  get a temporary scratch buffer
 */
uiLength = strlen(pszString_in);
if (uiLength >= BUFSIZE)
	{
	uiOldSize    = BUFSIZE;
	uiNewSize    = BUFSIZE;
	pszOldBuffer = szBuffer1;
	pszNewBuffer = szBuffer2;
	}
else
	{
	uiOldSize    = uiLength + 20;
	uiNewSize    = uiLength + 20;
	pszOldBuffer = allocMemory(uiOldSize);
	pszNewBuffer = allocMemory(uiNewSize);
	}
strcpy(pszOldBuffer, pszString_in);

for (	pszOld=pszOldBuffer, pszNew=pszNewBuffer, pChange = pChangeList_in ;
	pChange ;
	pChange = pChange->pNext )
	{
	if (*(pChange->pszMatch) == NUL)
	{
	/*
	 *  insertion change -- try each location in the string
	 */
	uiReplaceLength = strlen(pChange->pszReplace);
	for ( pszPosition = pszOld ; *pszPosition ; ++pszPosition )
		{
		uiLength = pszNew - pszNewBuffer;
		/*
		 *  copy the leading, unmatched stuff
		 */
		while (pszOld < pszPosition)
		{
		if (uiLength >= uiNewSize)
			{
			uiNewSize += 100;
			pszNewBuffer = xxrealloc(pszNewBuffer, uiNewSize,
						 szBuffer2);
			pszNew = pszNewBuffer + uiLength;
			}
		*pszNew++ = *pszOld++;
		++uiLength;
		}
		if (check_change_environment(pszNewBuffer, (int)uiLength, pszOld,
					 pChange->pEnvironment))
		{
		if (uiLength + uiReplaceLength >= uiNewSize)
			{
			uiNewSize += uiReplaceLength + 100;
			pszNewBuffer = xxrealloc(pszNewBuffer,uiNewSize,
						 szBuffer2);
			pszNew = pszNewBuffer + uiLength;
			}
		strcpy(pszNew,pChange->pszReplace);	/* copy new stuff */
		pszNew += uiReplaceLength;	/* move past the new stuff */
		uiLength += uiReplaceLength;
		}
		else if (*pszOld != NUL)
		{
		if (uiLength >= uiNewSize)
			{
			uiNewSize += 100;
			pszNewBuffer = xxrealloc(pszNewBuffer, uiNewSize,
						 szBuffer2);
			pszNew = pszNewBuffer + uiLength;
			}
		*pszNew++ = *pszOld++;	/* move past unwanted match */
		++uiLength;
		}
		}
	/*
	 *  allow insertion at the end of the word as well
	 */
	uiLength = pszNew - pszNewBuffer;
	/*
	 *  copy the leading, unmatched stuff
	 */
	while (pszOld < pszPosition)
		{
		if (uiLength >= uiNewSize)
		{
		uiNewSize += 100;
		pszNewBuffer = xxrealloc(pszNewBuffer, uiNewSize, szBuffer2);
		pszNew = pszNewBuffer + uiLength;
		}
		*pszNew++ = *pszOld++;
		++uiLength;
		}
	if (check_change_environment(pszNewBuffer, (int)uiLength, pszOld,
					 pChange->pEnvironment))
		{
		if (uiLength + uiReplaceLength >= uiNewSize)
		{
		uiNewSize += uiReplaceLength + 100;
		pszNewBuffer = xxrealloc(pszNewBuffer, uiNewSize, szBuffer2);
		pszNew = pszNewBuffer + uiLength;
		}
		strcpy(pszNew,pChange->pszReplace);	/* copy new stuff */
		pszNew += uiReplaceLength;		/* move past the new stuff */
		uiLength += uiReplaceLength;
		}
	}
	else if ((pszPosition = strstr(pszOld, pChange->pszMatch)) != NULL)
	{
	uiMatchLength   = strlen(pChange->pszMatch);
	uiReplaceLength = strlen(pChange->pszReplace);
	do  {
		uiLength = pszNew - pszNewBuffer;
		/*
		 *  copy the leading, unmatched stuff
		 */
		while (pszOld < pszPosition)
		{
		if (uiLength >= uiNewSize)
			{
			uiNewSize += 100;
			pszNewBuffer = xxrealloc(pszNewBuffer, uiNewSize,
						 szBuffer2);
			pszNew = pszNewBuffer + uiLength;
			}
		*pszNew++ = *pszOld++;
		++uiLength;
		}
		if (check_change_environment( pszNewBuffer, (int)uiLength,
					  pszOld + uiMatchLength,
					  pChange->pEnvironment))
		{
		if (uiLength + uiReplaceLength >= uiNewSize)
			{
			uiNewSize += uiReplaceLength + 100;
			pszNewBuffer = xxrealloc(pszNewBuffer, uiNewSize,
						 szBuffer2);
			pszNew = pszNewBuffer + uiLength;
			}
		/*
		 *  copy new stuff, move past the new stuff, and skip over
		 *  match in input string
		 */
		strcpy(pszNew,pChange->pszReplace);
		pszNew += uiReplaceLength;
		uiLength += uiReplaceLength;
		pszOld += uiMatchLength;
		}
		else if (*pszOld != NUL)
		{
		if (uiLength >= uiNewSize)
			{
			uiNewSize += 100;
			pszNewBuffer = xxrealloc(pszNewBuffer, uiNewSize,
						 szBuffer2);
			pszNew = pszNewBuffer + uiLength;
			}
		*pszNew++ = *pszOld++;	/* move past unwanted match */
		++uiLength;
		}
		} while ((pszPosition = strstr(pszOld,pChange->pszMatch)) != NULL);

	} /* end if */
	else
	uiLength = pszNew - pszNewBuffer;
	/*
	 *  copy the trailing (unmatched) stuff, then copy everything over
	 *  to pszOldBuffer for the next change in the list to apply to
	 */
	if (uiLength + strlen(pszOld) >= uiNewSize)
	{
	uiNewSize += strlen(pszOld) + 100;
	pszNewBuffer = xxrealloc(pszNewBuffer, uiNewSize, szBuffer2);
	pszNew = pszNewBuffer + uiLength;
	}
	strcpy(pszNew,pszOld);
	if (strlen(pszNewBuffer) >= uiOldSize)
	{
	uiOldSize = strlen(pszNewBuffer) + 1;
	pszOldBuffer = xxrealloc(pszOldBuffer, uiOldSize, szBuffer1);
	}
	pszOld = strcpy(pszOldBuffer,pszNewBuffer);	/* point at beginnings again */
	pszNew = pszNewBuffer;
	} /* end for */

pszNew = duplicateString( pszOldBuffer );
xxfree( pszOldBuffer, szBuffer1 );	/* release the working buffers */
xxfree( pszNewBuffer, szBuffer2 );
return( pszNew );
}

/*****************************************************************************
 * NAME
 *    freeChangeList
 * ARGUMENTS
 *    pList_in - pointer to a change structure
 * DESCRIPTION
 *    Free the memory allocated for the change structure.
 * RETURN VALUE
 *    none
 */
void freeChangeList(pList_io)
Change *	pList_io;
{
Change *	pChange;
Change *	pNextChange;
ChangeEnvironment *ecp, *nextecp;
ChgEnvItem *eip, *nexteip;

for ( pChange = pList_io ; pChange ; pChange = pNextChange )
	{
	pNextChange = pChange->pNext;
	if (pChange->pszMatch)
	freeMemory(pChange->pszMatch);
	if (pChange->pszReplace)
	freeMemory(pChange->pszReplace);
	if (pChange->pszDescription)
	freeMemory(pChange->pszDescription);
	for ( ecp = pChange->pEnvironment ; ecp ; ecp = nextecp )
	{
	nextecp = ecp->pNext;
	for ( eip = ecp->pLeftEnv ; eip ; eip = nexteip )
		{
		nexteip = eip->pNext;
		if (!(eip->iFlags & E_CLASS))
		freeMemory(eip->u.pszString);
		freeMemory((char *)eip);
		}
	for ( eip = ecp->pRightEnv ; eip ; eip = nexteip )
		{
		nexteip = eip->pNext;
		if (!(eip->iFlags & E_CLASS))
		freeMemory(eip->u.pszString);
		freeMemory((char *)eip);
		}
	freeMemory((char *)ecp);
	}
	freeMemory(pChange);
	}
}

/****************************************************************************
 * NAME
 *    expand_left_env
 * DESCRIPTION
 *    Write the left side of a string environment to the indicated buffer.
 * RETURN VALUE
 *    None
 */
static void expand_left_env(buf, eip)
char *		buf;	/* pointer to beginning of output buffer */
ChgEnvItem *	eip;	/* chg_env_item pointer */
{
StringClass *scp;

if (eip == (ChgEnvItem *)NULL)
	return;
expand_left_env(buf, eip->pNext);
strcat(buf, " ");
if (eip->iFlags & E_NOT)
	strcat(buf, "~");
if (eip->iFlags & E_OPTIONAL)
	strcat(buf, "(");
if (eip->iFlags & E_CLASS)
	{
	scp = (StringClass *)eip->u.pClass;
	strcat(buf, "[");
	strcat(buf, scp->pszName);
	strcat(buf, "]");
	}
else if (eip->u.pszString == NULL)
	strcat(buf, "#");
else
	strcat(buf, eip->u.pszString);
if (eip->iFlags & E_OPTIONAL)
	strcat(buf, ")");
if (eip->iFlags & E_ELLIPSIS)
	strcat(buf, " ...");
}

/****************************************************************************
 * NAME
 *    expand_right_env
 * DESCRIPTION
 *    Write the right side of a string environment to the indicated file.
 * RETURN VALUE
 *    None
 */
static void expand_right_env(buf, eip)
char *		buf;	/* output char pointer */
ChgEnvItem *	eip;	/* chg_env_item pointer */
{
StringClass *scp;

for ( ; eip ; eip = eip->pNext )
	{
	strcat(buf, " ");
	if (eip->iFlags & E_ELLIPSIS)
	strcat(buf, "... ");
	if (eip->iFlags & E_NOT)
	strcat(buf, "~");
	if (eip->iFlags & E_OPTIONAL)
	strcat(buf, "(");
	if (eip->iFlags & E_CLASS)
	{
	scp = (StringClass *)eip->u.pClass;
	strcat(buf, "[");
	strcat(buf, scp->pszName);
	strcat(buf, "]");
	}
	else if (eip->u.pszString == NULL)
	strcat(buf, "#");
	else
	strcat(buf, eip->u.pszString);
	if (eip->iFlags & E_OPTIONAL)
	strcat(buf, ")");
	}
}

/****************************************************************************
 * NAME
 *    getChangeQuote
 * DESCRIPTION
 *    Get a quote character that is not used in either string.
 * RETURN VALUE
 *    None
 */
int getChangeQuote(pszOld_in, pszNew_in)
const char *	pszOld_in;	/* pointer to the string to change from */
const char *	pszNew_in;	/* pointer to the string to change to */
{
int i;

if (	((pszOld_in == NULL) || (strchr(pszOld_in,'"') == NULL) ) &&
	((pszNew_in == NULL) || (strchr(pszNew_in,'"') == NULL) ) )
	return( '"' );
if (	((pszOld_in == NULL) || (strchr(pszOld_in,'\'') == NULL) ) &&
	((pszNew_in == NULL) || (strchr(pszNew_in,'\'') == NULL) ) )
	return( '\'' );
for ( i = '!' ; i < '~' ; ++i )
	{
	if (    ((pszOld_in == NULL) || (strchr(pszOld_in,i) == NULL) ) &&
		((pszNew_in == NULL) || (strchr(pszNew_in,i) == NULL) ) )
	break;
	}
return( i );
}

/*****************************************************************************
 * NAME
 *    buildChangeString
 * DESCRIPTION
 *    convert a Change data structure into a text string representation
 * RETURN VALUE
 *    pointer to string containing expanded change, or NULL if an error occurs
 */
char * buildChangeString(pChange_in)
const Change *	pChange_in;
{
size_t			uiLength;
ChangeEnvironment *	pEnvCond;
ChgEnvItem *		pChgEnvItem;
StringClass *		pClass;
char			cQuote;
char *			pszChange;
/*
 *  calculate the length of the change and allocate memory for it
 */
uiLength = 7;			/* 4 quotes + 2 spaces + NUL */
if (pChange_in->pszMatch != NULL)
	uiLength += strlen(pChange_in->pszMatch);
if (pChange_in->pszReplace != NULL)
	uiLength += strlen(pChange_in->pszReplace);
if (pChange_in->pszDescription != NULL)
	uiLength += strlen(pChange_in->pszDescription) + 4;	/* " // " */
for (   pEnvCond = pChange_in->pEnvironment ;
	pEnvCond ;
	pEnvCond = pEnvCond->pNext )
	{
	uiLength += 5;		/* / + _ + 3 spaces */
	if (pEnvCond->bNot)
	++uiLength;
	for (   pChgEnvItem = pEnvCond->pLeftEnv ;
		pChgEnvItem ;
		pChgEnvItem = pChgEnvItem->pNext )
	{
	++uiLength;
	if (pChgEnvItem->iFlags & E_NOT)
		++uiLength;
	if (pChgEnvItem->iFlags & E_OPTIONAL)
		uiLength += 2;
	if (pChgEnvItem->iFlags & E_CLASS)
		{
		pClass = (StringClass *)pChgEnvItem->u.pClass;
		uiLength += strlen(pClass->pszName) + 2;
		}
	else if (pChgEnvItem->u.pszString == NULL)
		++uiLength;
	else
		uiLength += strlen(pChgEnvItem->u.pszString);
	if (pChgEnvItem->iFlags & E_ELLIPSIS)
		uiLength += 4;
	}
	for (   pChgEnvItem = pEnvCond->pRightEnv ;
		pChgEnvItem ;
		pChgEnvItem = pChgEnvItem->pNext )
	{
	++uiLength;
	if (pChgEnvItem->iFlags & E_NOT)
		++uiLength;
	if (pChgEnvItem->iFlags & E_OPTIONAL)
		uiLength += 2;
	if (pChgEnvItem->iFlags & E_CLASS)
		{
		pClass = (StringClass *)pChgEnvItem->u.pClass;
		uiLength += strlen(pClass->pszName) + 2;
		}
	else if (pChgEnvItem->u.pszString == NULL)
		++uiLength;
	else
		uiLength += strlen(pChgEnvItem->u.pszString);
	if (pChgEnvItem->iFlags & E_ELLIPSIS)
		uiLength += 4;
	}
	}
pszChange = allocMemory(uiLength);
cQuote = getChangeQuote(pChange_in->pszMatch, pChange_in->pszReplace);
sprintf(pszChange, "%c%s%c %c%s%c",
	cQuote, pChange_in->pszMatch ? pChange_in->pszMatch : "",
	cQuote, cQuote,
	pChange_in->pszReplace ? pChange_in->pszReplace : "", cQuote);
for (   pEnvCond = pChange_in->pEnvironment ;
	pEnvCond ;
	pEnvCond = pEnvCond->pNext )
	{
	strcat(pszChange, "  /");
	expand_left_env(pszChange, pEnvCond->pLeftEnv);
	strcat(pszChange, " ");
	if (pEnvCond->bNot)
	strcat(pszChange, "~");
	strcat(pszChange, "_");
	expand_right_env(pszChange, pEnvCond->pRightEnv);
	}
if (pChange_in->pszDescription != NULL)
	strcat(strcat(pszChange, " // "), pChange_in->pszDescription);
return pszChange;
}

/***************************************************************************
 *  values returned by elex_get()
 */
#define ENV_END		0	/* end of this environment */
#define ENV_BEGIN	1	/* '/' */
#define ENV_PLUSBEGIN	2	/* '+/' */
#define ENV_BOUND	3	/* '#' */
#define ENV_ELLIPSIS	4	/* '...' */
#define ENV_LBRACK	5	/* '[' */
#define ENV_RBRACK	6	/* ']' */
#define ENV_MARK	7	/* '_' */
#define ENV_NOT		8	/* '~' */
#define ENV_LITERAL	9	/* literal string (stored in elex_string) */
#define ENV_NOTMARK	10	/* '~_' */
#define ENV_LPAREN	11	/* '(' */
#define ENV_RPAREN	12	/* ')' */
/*
 *  values for elex_state
 */
#define EL_INIT	0	/* freshly initialized */
#define EL_WORK	1	/* merely going ahead working */
#define EL_HLD1	2	/* finished with one, holding a '/' */
#define EL_HLD2	3	/* finished with one, holding a '+/' */
#define EL_EOF	-1	/* at end of input string */

#define LEFT_SIDE  0            /* for function parameter passing */
#define RIGHT_SIDE 1            /*  to env_side() */

#define MAXLEXSIZE	50
static short elex_state;	/* state of the lexical analyzer */
static char *elex_ptr = NULL;		/* pointer to the lexical string */
static char elex_string[MAXLEXSIZE+1];	/* stores current lexical token */

/*************************************************************************
 * NAME
 *    elex_init
 * ARGUMENTS
 *    pszLine_in - pointer to a line which is to be lexically scanned
 * DESCRIPTION
 *    Initialize for a lexical scan of an environment constraint string.
 * RETURN VALUE
 *    none
 */
static void elex_init(pszLine_in)
char *pszLine_in;
{
elex_state = EL_INIT;
elex_ptr = pszLine_in;
}

/*************************************************************************
 * NAME
 *    elex_get
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Get the next lexical token, storing a string if needed.
 * RETURN VALUE
 *    integer code for token type (including end of environment), or EOF
 *    if end of input
 */
static int elex_get()
{
register int type;

if (elex_ptr == (char *)NULL)
	return( EOF );
switch (elex_state)
	{
	case EL_INIT:		/* just starting an environment */
	type = elex_tok();
	elex_state = (type==EOF) ? EL_EOF : EL_WORK;
	return( type );

	case EL_WORK:		/* in the middle of an environment */
	switch (type = elex_tok())
		{
		case EOF:		elex_state = EL_EOF;	return( ENV_END );
		case ENV_BEGIN:	elex_state = EL_HLD1;	return( ENV_END );
		case ENV_PLUSBEGIN:	elex_state = EL_HLD2;	return( ENV_END );
		default:					return( type );
		}

	case EL_HLD1:		/* saw a '/' previously */
	elex_state = EL_WORK;
	return( ENV_BEGIN );

	case EL_HLD2:		/* saw a '+/' previously */
	elex_state = EL_WORK;
	return( ENV_PLUSBEGIN );

	default:			/* assume EL_EOF state */
	elex_ptr = (char *)NULL;
	return( EOF );
	}
}

/*************************************************************************
 * NAME
 *    elex_tok
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Load the next lexical token into elex_string.
 *    This is the only lexical function which modifies elex_ptr.
 * RETURN VALUE
 *    type of token found (ENV_...)
 */
static int elex_tok()
{
register char *p;
register int ch;

while (isascii(*elex_ptr) && isspace(*elex_ptr))
	++elex_ptr;			/* skip leading white space */

ch = *elex_ptr++;

if (ch == NUL)
	{
	elex_string[0] = (char)ch;	/* end of the input string */
	--elex_ptr;			/* stay on the NUL */
	return( EOF );
	}
else if (strchr("/_#[]()", ch) != (char *)NULL)
	{
	elex_string[0] = (char)ch;	/* special single character token */
	elex_string[1] = NUL;
	switch (ch)
	{
	case '/':	return( ENV_BEGIN );
	case '_':	return( ENV_MARK );
	case '#':	return( ENV_BOUND );
	case '[':	return( ENV_LBRACK );
	case ']':	return( ENV_RBRACK );
	case '(':	return( ENV_LPAREN );
	case ')':	return( ENV_RPAREN );
	default:	return( EOF );			/* "can't happen" */
	}
	}
else if (ch == '~')
	{
	elex_string[0] = (char)ch;
	while (isascii(*elex_ptr) && isspace(*elex_ptr))
	++elex_ptr;			/* allow for possible white space */
	if (*elex_ptr == '_')
	{
	elex_string[1] = *elex_ptr++;	/* special two character token */
	elex_string[2] = NUL;
	return( ENV_NOTMARK );
	}
	else
	{				/* special single character token */
	elex_string[0] = (char)ch;
	elex_string[1] = NUL;
	return( ENV_NOT );
	}
	}
else if ((ch == '+') && (*elex_ptr == '/'))
	{
	elex_string[0] = (char)ch;	/* special two character token */
	elex_string[1] = *elex_ptr++;
	elex_string[2] = NUL;
	return( ENV_PLUSBEGIN );
	}
else if ((ch == '.') && (*elex_ptr == '.') && (*(elex_ptr+1) == '.'))
	{
	elex_string[0] = (char)ch;	/* special three character token */
	elex_string[1] = *elex_ptr++;
	elex_string[2] = *elex_ptr++;
	elex_string[3] = NUL;
	return( ENV_ELLIPSIS );
	}
else
	{				/* literal string */
	p = elex_string;
	do  {
	if (ch == '\\')
		{					/* get quoted character */
		if (    (*elex_ptr != NUL) &&
			!(isascii(*elex_ptr) && isspace(*elex_ptr)) )
		ch = *elex_ptr++;
		}
	if (p < (elex_string + MAXLEXSIZE))	/* store the character */
		*p++ = (char)ch;
	ch = *elex_ptr++;			/* get next character */
	} while ((ch != NUL) &&
		 (!(isascii(ch) && isspace(ch))) &&
		 (strchr("/~_#[](){}",ch) == (char *)NULL) &&
		 !((ch == '+')&&(*elex_ptr == '/')) &&
		 !((ch == '.')&& matchBeginning(elex_ptr,"..")) );
	--elex_ptr;			/* back up to terminating character */
	*p++ = NUL;			/* terminate the literal string */
	return( ENV_LITERAL );
	}
}

#ifdef TESTING
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
main()
{
register int k;
char buf[100];

while (fgets(buf,sizeof buf, stdin) != (char *)NULL)
	{
	elex_init(buf);
	while ((k = elex_get()) != EOF)
	{
	printf("Lexical token value = %d ", k );
	switch (k)
		{
		case ENV_END:	printf("(ENV_END)");		break;
		case ENV_BEGIN:	printf("(ENV_BEGIN)");		break;
		case ENV_PLUSBEGIN:	printf("(ENV_PLUSBEGIN)");	break;
		case ENV_BOUND:	printf("(ENV_BOUND)");		break;
		case ENV_ELLIPSIS:	printf("(ENV_ELLIPSIS)");	break;
		case ENV_LBRACK:	printf("(ENV_LBRACK)");		break;
		case ENV_RBRACK:	printf("(ENV_RBRACK)");		break;
		case ENV_MARK:	printf("(ENV_MARK)");		break;
		case ENV_NOTMARK:	printf("(ENV_NOTMARK)");	break;
		case ENV_NOT:	printf("(ENV_NOT)");		break;
		case ENV_LITERAL:
		printf("(ENV_LITERAL)");
		printf(" = \"%s\"", elex_string);
		break;
		case ENV_LPAREN:	printf("(ENV_LPAREN)");		break;
		case ENV_RPAREN:	printf("(ENV_RPAREN)");		break;
		default:		printf("<<UNKNOWN>>");		break;
		}
	printf("\n");
	}
	}
}
#endif
/*===========================================================================*/

/*************************************************************************
 * NAME
 *    epar_error
 * DESCRIPTION
 *    Print an error message regarding the parsing of environments.
 * RETURN VALUE
 *    none
 */
static void epar_error(pszError_in)
const char * pszError_in;
{
reportError(ERROR_MSG,
		"\nCHANGE ENVIRONMENT:\n    %s string environment constraint\n",
		pszError_in );
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
static const char szErrorPoint_m[] = "<<ERROR DETECTED HERE>>";
static void show_badenv(envir)
char *envir;
{
char *	p;
char *	q;
char *	pszBuffer;

#ifdef HAVE_ALLOCA
pszBuffer = (char *)alloca(strlen(envir) + 50);
#else
pszBuffer = (char *)allocMemory(strlen(envir) + 50);
#endif
strcpy(pszBuffer, "\n        ");
p = envir;
q = pszBuffer + strlen(pszBuffer);
while (*p != NUL)
	{
	if (p == elex_ptr)
	{
	strcpy(q, szErrorPoint_m);
	q += strlen(szErrorPoint_m);
	}
	*q++ = *p++;
	}
if (p == elex_ptr)
	strcpy(q, szErrorPoint_m);
strcat(q, "\n");
reportError(ERROR_MSG, pszBuffer);
#ifndef HAVE_ALLOCA
freeMemory(pszBuffer);
#endif
}

/*************************************************************************
 * NAME
 *    env_side
 * ARGUMENTS
 *    token      - first token of this side of the environment
 *    isright    - nonzero if right side, zero if left side
 *    pbNot_out  - pointer to ec_flags field for chg_envir structure
 * DESCRIPTION
 *    Parse one side of an environment.  The list of chg_env_item's is
 *    built such that the first element is closest to the '_' and the last
 *    element is farthest away.
 * RETURN VALUE
 *    pointer to the list of chg_env_item structures, or NULL if an error
 *    occurs
 */
static ChgEnvItem * env_side(token, isright, pbNot_out, pClasses_in)
int			token;
int			isright;
short *			pbNot_out;
const StringClass *	pClasses_in;
{
ChgEnvItem *env, *env_tail;
register ChgEnvItem *pe;
int myflags;			/* what to put in ei_flags field */
int need_bracklit = FALSE;	/* have just seen a '[' */
int need_brack = FALSE;		/* have just seen '[' <CLASSNAME> */
int need_optitem = FALSE;	/* have just seen a '(' */
int need_paren = FALSE;		/* have just seen '(' <item> */
int need_end = FALSE;		/* if (isright), have just seen a '#' */
#ifdef DOUBLE_POUND
int bound_count = 0;		/* word boundary count */
int pre_bound = FALSE;		/* morpheme occurred before word boundary
				   in left environment constraint */
#endif

env = (ChgEnvItem *)NULL, env_tail = (ChgEnvItem *)NULL;
for ( myflags = 0 ;; token = elex_get() )	/* do forever... */
	{
	/*
	 *  check for absence of absolutely required items
	 */
	if (need_bracklit && (token != ENV_LITERAL))
	{
	epar_error("Missing class name in");    goto bad_side;
	}
	if (need_brack && (token != ENV_RBRACK))
	{
	epar_error("Missing ']' in");    goto bad_side;
	}
	if (need_optitem && (token != ENV_LITERAL) && (token != ENV_NOT) &&
			(token != ENV_LBRACK) && (token != ENV_RBRACK) )
	{
	epar_error("Missing optional item in");    goto bad_side;
	}
	if (need_paren && (token != ENV_RPAREN))
	{
	epar_error("Missing ')' in");    goto bad_side;
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
		epar_error("Missing '_' in");    goto bad_side;
		}
		if (myflags & E_NOT)
		epar_error("Invalid '~' in");
		if (myflags & E_ELLIPSIS)
		epar_error("Invalid '...' in");
		return( env );		/* GOOD RETURN FOR RIGHT SIDE */

	case ENV_BOUND:
#ifdef DOUBLE_POUND
		bound_count++;
		if (isright)
		{
		if (bound_count == 2)
			need_end = TRUE;
		}
		else if ( (bound_count == 1) && (env != NULL) )
		pre_bound = TRUE;
		else if ( (bound_count == 2) && (pre_bound) )
#else
		if (isright)
		need_end = TRUE;
		else if (env != NULL)
#endif
		{
bad_bound:      epar_error("Invalid '#' in");
		goto bad_side;
		}
		goto new_item;		/* share code with ENV_LITERAL */

	case ENV_ELLIPSIS:
		if (isright)
		myflags |= E_ELLIPSIS;		/* right side */
		else if (env == (ChgEnvItem *)NULL)
		epar_error("Invalid '...' in");
		else
		env->iFlags |= E_ELLIPSIS;	/* left side */
		break;

	case ENV_LBRACK:
		need_bracklit = TRUE;	/* need a class name following */
		myflags |= E_CLASS;
		break;

	case ENV_RBRACK:
		if (!need_brack)		/* want ']' only if needed */
		{
		epar_error("Unexpected ']' found in");    goto bad_side;
		}
		need_brack = FALSE;		/* we don't need it anymore */
		if (need_optitem)
		{					/* finished item */
		need_optitem = FALSE;    need_paren = TRUE;
		}
		break;

	case ENV_MARK:
		if (isright)
		{
		epar_error("Second '_' found in");    goto bad_side;
		}
		else
		return( env );		/* GOOD RETURN FOR LEFT SIDE */

	case ENV_NOTMARK:
		if (isright)
		{
		epar_error("Second '_' found in");    goto bad_side;
		}
		else
		{
		*pbNot_out = TRUE;	/* mark a negative environment */
		return( env );		/* GOOD RETURN FOR LEFT SIDE */
		}

	case ENV_NOT:
		if (myflags & E_NOT)
		epar_error("Invalid '~' in");
		myflags |= E_NOT;
		break;

	case ENV_LITERAL:
		if (need_bracklit)
		{
		need_bracklit = FALSE;	need_brack = TRUE;
		}
		else if (need_optitem)
		{                                       /* finished item */
		need_optitem = FALSE;	need_paren = TRUE;
		}
new_item:   pe = (ChgEnvItem *)allocMemory(sizeof(ChgEnvItem));
		if (token == ENV_BOUND)
		pe->u.pszString = (char *)NULL;    /* mark boundary */
		else if (myflags & E_CLASS)
		{		/* look the class and fix the flag bits */
		pe->u.pClass = findStringClass( elex_string, pClasses_in);
		if (pe->u.pClass == (void *)NULL)
			{
			char msg[100];
			sprintf(msg,"Undefined class %s",elex_string);
			epar_error(msg);
			goto bad_side;
			}
		}
		else
		{
		pe->u.pszString = duplicateString(elex_string);
		}
		pe->iFlags = (char)myflags;
		myflags    = 0;		/* reset for the next item */
		if (isright)
		{
		if (env == (ChgEnvItem *)NULL)
			env = pe;		/* link at the tail of the list */
		else
			env_tail->pNext = pe;
		env_tail = pe;
		}
		else
		{
		pe->pNext = env;	/* link at the head of the list */
		env = pe;
		}
		break;

	case ENV_LPAREN:
		need_optitem = TRUE;	/* need an item following */
		myflags |= E_OPTIONAL;
		break;

	case ENV_RPAREN:
		if (!need_paren)		/* want ')' only if needed */
		{
		epar_error("Unexpected ')' found in");    goto bad_side;
		}
		need_paren = FALSE;		/* we don't need it anymore */
		break;

	default:
		{
		char msg[100];
		sprintf(msg, "Invalid input '%s' in", elex_string);
		epar_error(msg);
		}
		goto bad_side;
		break;

	} /* end switch (token) */
	} /* end for (;;) */

bad_side:		/* here only on parse error */
			/* release any allocated space */
for ( pe = env ; pe != (ChgEnvItem *)NULL ; pe = env )
	{
	env = pe->pNext;
	if (!(pe->iFlags & E_CLASS) && (pe->u.pszString != (char *)NULL))
	freeMemory(pe->u.pszString );
	freeMemory( (char *)pe );
	}
return( (ChgEnvItem *)NULL );	/* ERROR RETURN */
}

/*************************************************************************
 * NAME
 *    env_parse
 * ARGUMENTS
 *    envtype    - name of environment type (string) for error messages
 * DESCRIPTION
 *    Parse a single environment constraint, building the structure for the
 *    interpreter to run over later.
 * RETURN VALUE
 *    pointer to the chg_envir structure, or NULL if an error occurs
 */
static ChangeEnvironment * env_parse(pClasses_in)
const StringClass *	pClasses_in;
{
register ChangeEnvironment *ec;
register int token;
ChgEnvItem *e, *ne;

ec = (ChangeEnvironment *)allocMemory(sizeof(ChangeEnvironment));
ec->bNot = FALSE;
/*
 *  parse the left side of the environment (before the '_')
 */
token = elex_get();
if ((token == EOF) || (token == ENV_END))
	goto empty_env;			/* no environment after all */
else if (token == ENV_NOTMARK)
	ec->bNot = TRUE;			/* starts with "~_" */
else if (token != ENV_MARK)
	{
	ec->pLeftEnv = env_side(token, LEFT_SIDE, &ec->bNot, pClasses_in);
	if (ec->pLeftEnv == (ChgEnvItem *)NULL)
	goto bad_side;			/* parsing error occurred */
	}
/*
 *  parse the right side of the environment (after the '_')
 */
token = elex_get();
if ((token != EOF) && (token != ENV_END))
	{
	ec->pRightEnv = env_side(token, RIGHT_SIDE, &ec->bNot, pClasses_in);
	if (ec->pRightEnv == (ChgEnvItem *)NULL)
	goto bad_side;			/* parsing error occurred */
	}
else if (ec->pLeftEnv == (ChgEnvItem *)NULL)
	goto empty_env;		/* only a '_', nothing on either side */

return( ec );				/* successful return */

empty_env:				/* no environment */
epar_error("Empty");

bad_side:				/* need to clean up */
for ( e = ec->pLeftEnv ; e != (ChgEnvItem *)NULL ; e = ne )
	{
	ne = e->pNext;		/* free anything built for the left */
	freeMemory( (char *)e );
	}
freeMemory( (char *)ec );		/* free this node */
return( (ChangeEnvironment *)NULL );
}

/*************************************************************************
 * NAME
 *    parse_environment
 * ARGUMENTS
 *    envir       - pointer to NUL-terminated string containing an environment
 *			constraints
 *    errmsgfmt  - printf style format for error messages (which are sent to
 *			stdout), or NULL for no error messages
 * DESCRIPTION
 *    Parse the environment constraint string, building a linked list of
 *    chg_envir structs.
 * RETURN VALUE
 *    pointer to list of chg_envir structs containing the constraints, or NULL
 *    if error
 */
static ChangeEnvironment * parse_environment(pszEnvir_in, pClasses_in)
char *			pszEnvir_in;
const StringClass *	pClasses_in;
{
int			iToken;
int			bParseError = FALSE;
ChangeEnvironment *	pHead       = NULL;
ChangeEnvironment *	pEnv;
/*
 *  first, check for an empty environment
 */
if (pszEnvir_in == NULL)
	return( NULL );			/* no environment */
pszEnvir_in += strspn(pszEnvir_in, " \r\n\t\f\v");
if (*pszEnvir_in == NUL)
	return( NULL );			/* no environment */

elex_init(pszEnvir_in);			/* initialize the lexical scan */

while ( (iToken = elex_get()) != EOF )
	{
	if ( ((iToken == ENV_BEGIN) || (iToken == ENV_PLUSBEGIN)) &&
	 ((pEnv = env_parse(pClasses_in))
						!= (ChangeEnvironment *)NULL))
	{
	pEnv->pNext = pHead;		/* link into the list */
	pHead = pEnv;
	}
	else
	{
	bParseError = TRUE;		/* nothing else if valid here */
	break;
	}
	}
if (bParseError)
	show_badenv(pszEnvir_in);		/* show the bad environment */

return( pHead );
}

/*************************************************************************
 * NAME
 *    shorten
 * ARGUMENTS
 *    string - pointer to a NUL-terminated string
 *    size   - number of bytes
 * DESCRIPTION
 *    Chop the indicated number of bytes from the end of the string.
 * RETURN VALUE
 *    pointer to the string, which is now shorter
 */
static char *shorten(string,size)
char *string;
int size;
{
size_t len;

if ((string == (char *)NULL) || (size <= 0))
	return(string);		/* check for reasonable arguments */

len = strlen(string) - size;	/* find out where to chop */
if (len <= 0)
	*string = NUL;		/* nothing left of the string... */
else
	*(string + len) = NUL;
return(string);
}

/*************************************************************************
 * NAME
 *    chk_senv_left
 * ARGUMENTS
 *    size - size of left-hand string that matched
 *    left - NUL-terminated left-hand string to be checked
 *    env  - pointer to list of left-hand side chg_env_item's
 *    match - portion of string that was matched
 *            This is needed only for chk_senv_left, since the original string
 *            is (partly) destroyed by shorten
 * DESCRIPTION
 *    Check what to do based on size of matched string.
 * RETURN VALUE
 *    TRUE if successful, FALSE if unsuccessful
 */
static int chk_senv_left(size,left,env,match)
int size;
char *left;
ChgEnvItem *env;
char *match;
{
/*
 *  figure out what to do based on success (stored in size) , E_NOT,
 *  and E_OPTIONAL
 */
if (    (!size && (env->iFlags & E_NOT)) ||
	(size && !(env->iFlags & E_NOT)) )
	{					/* happily progress along */
	if (senv_left( shorten(left,(size ? size : 1)), env->pNext ))
	   return( TRUE );
					/* restore matched string that was
					   deleted by shorten */
	strcpy((left + strlen(left)), match);
	}
/* else -- bugfix 1/22/92 */
if (env->iFlags & E_OPTIONAL)
	{
	if (senv_left( left, env->pNext ))
	return( TRUE );			/* didn't need it after all */
	}

return( FALSE );
}

/*************************************************************************
 * NAME
 *    chk_senv_right
 * ARGUMENTS
 *    size - size of right-hand string that matched
 *    right - NUL-terminated left-hand string to be checked
 *    env  - pointer to list of left-hand side chg_env_item's
 * DESCRIPTION
 *    Check what to do based on size of matched string.
 * RETURN VALUE
 *    TRUE if successful, FALSE if unsuccessful
 */
static int chk_senv_right(size,right,env)
int size;
char *right;
ChgEnvItem *env;
{
	/*
	 *  figure out what to do based on success (stored in size) , E_NOT,
	 *  and E_OPTIONAL
	 */
if (    (size && !(env->iFlags & E_NOT)) ||
	(!size && (env->iFlags & E_NOT)) )
	{
	if (senv_right( right + (size ? size : 1), env->pNext ))
	return( TRUE );
	}
/* else -- bugfix 1/22/92 */
if (env->iFlags & E_OPTIONAL)
	{
	if (senv_right( right, env->pNext ))
	return( TRUE );
	}
return( FALSE );
}

/*************************************************************************
 * NAME
 *    senv_left
 * ARGUMENTS
 *    left - NUL-terminated left-hand string to be checked
 *    env  - pointer to list of left-hand side chg_env_item's
 * DESCRIPTION
 *    Check whether the given string matches the given environment items.
 *    This is a recursive function.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int senv_left(left,env)
char *left;
ChgEnvItem *env;
{
size_t size;
char *myleft;
StringList *sp;
StringClass *scl;

if (env == (ChgEnvItem *)NULL)
	return( TRUE );		/* no (more) environment */
if (left == (char *)NULL)
	return( FALSE );		/* no string at all?? */
/*
 *  If we had the DECUS C function salloc() or the 4.2BSD Unix function
 *  alloca() guaranteed to be available [these allocate storage on the
 *  stack, which gets reclaimed automatically when the function exits],
 *  this would be a virtual mirror image of senv_right() below.  Alas,
 *  this is not guaranteed, so I allocate space explicitly and use
 *  myriads of goto's instead of return's in order to guarantee that the
 *  space is released.
 */
myleft = duplicateString( left );
/*
 *  match the current environment against what's wanted
 */
for (;; strcpy(left,shorten(myleft,1)) )
	{
	/*
	 *  handle hitting the beginning of the word
	 */
	if (*left == NUL)
	{
	if ((env->iFlags&E_CLASS) || (env->u.pszString!=(char *)NULL))
		{
		if ((env->iFlags & E_OPTIONAL) && senv_left(left,env->pNext))
		goto goodleft;
		if (    (env->iFlags & E_NOT) &&
			(env->pNext==(ChgEnvItem *)NULL) )
		goto goodleft;		/* boundary is "NOT something" */
		else
		goto badleft;		/* had to match something more */
		}
	else
		{				/* boundary */
		if (env->iFlags & E_NOT)
		goto badleft;		/* didn't want this boundary */
		else
		goto goodleft;		/* wanted this boundary */
		}
	}
	/*
	 *  handle having something to match against
	 */
	if ( env->iFlags & E_CLASS )
	{				/* check against a string class */
	size = 0;			/* assume it won't be in the class */
					/* for each element that matches the
					   string, see if it will work */
	scl = (StringClass *)env->u.pClass;
	for ( sp = scl->pMembers ; sp ; sp = sp->pNext )
	   {
	   if (matchEnd(left, sp->pszString))
		  {
		  size = strlen(sp->pszString);
		  if (chk_senv_left((int)size, left, env, sp->pszString) )
		  goto goodleft;
		  }
		}
					/* if did not match the class */
	if (size == 0 &&		/* check for negation, etc. */
		chk_senv_left(0, left, env, "") ) goto goodleft;
	}
	else if (env->u.pszString != (char *)NULL)
	{				/* check against a literal string */
	size = (matchEnd(left,env->u.pszString)) ?
				strlen(env->u.pszString) : 0;
					/* check for validity */
	if (chk_senv_left((int)size, left, env, "") ) goto goodleft;
	}
	else
	{				/* check word initial condition */
	if (	((env->iFlags & E_NOT) && (*left != NUL)) ||
		(!(env->iFlags & E_NOT) && (env->iFlags & E_ELLIPSIS)) ||
		(!(env->iFlags & E_NOT) && (*left == NUL)) )
		goto goodleft;		/* word boundary condition okay */
	else
		goto badleft;
	}
	/*
	 *  now check for E_ELLIPSIS case
	 */
	if (!(env->iFlags & E_ELLIPSIS))
	goto badleft;			/* had to match here */
	/* if we reach here, we try again further out (due to '...') */
	}

goodleft:
freeMemory( myleft );			/* too bad we don't have salloc() */
return( TRUE );

badleft:
freeMemory( myleft );			/*   or alloca() to use!! */
return( FALSE );
} /* end of senv_left() */

/*************************************************************************
 * NAME
 *    senv_right
 * ARGUMENTS
 *    right - NUL-terminated right-hand string to be checked
 *    env   - pointer to list of right-hand side chg_env_item's
 * DESCRIPTION
 *    Check whether the given string matches the given environment items.
 *    This is a recursive function, thanks to ellipses.
 * RETURN VALUE
 *    nonzero if successful, zero if unsuccessful
 */
static int senv_right(right,env)
char *right;
ChgEnvItem *env;
{
size_t size;
StringList *sp;
StringClass *scl;

if (env == (ChgEnvItem *)NULL)
	return( TRUE );		/* no (more) environment */
if (right == (char *)NULL)
	return( FALSE );		/* no string at all?? */
/*
 *  match the current environment against what's wanted
 */
for (;; ++right )
	{
	/*
	 *  handle hitting the end of the word
	 */
	if (*right == NUL)
	{
	if ((env->iFlags&E_CLASS) || (env->u.pszString!=(char *)NULL))
		{
		if ((env->iFlags&E_OPTIONAL) && senv_right(right,env->pNext))
		return( TRUE );
		if (    (env->iFlags & E_NOT) &&
			(env->pNext==(ChgEnvItem *)NULL) )
		return( TRUE );		/* boundary is "NOT something" */
		else
		return( FALSE );	/* had to match something more */
		}
	else
		{
		if (env->iFlags & E_NOT)
		return( FALSE );	/* didn't want this boundary */
		else
		return( TRUE );		/* wanted this boundary */
		}
	}
	/*
	 *  handle having something to match against
	 */
	if ( env->iFlags & E_CLASS )
	{				/* check against a string class */
	size = 0;			/* assume it won't match */
					/* for each element that matches the
					   string, see if it will work */
	scl = (StringClass *)env->u.pClass;
	for ( sp = scl->pMembers ; sp ; sp = sp->pNext )
	   {
	   if (matchBeginning(right, sp->pszString))
		  {
		  size = strlen(sp->pszString);
		  if (chk_senv_right((int)size, right, env))
		  return( TRUE );
		  }
	   }
					/* if it did not match the class */
	if (	(size == 0) &&		/*  check for negation, etc. */
		chk_senv_right(0, right, env) )
		return( TRUE );
	}
	else if (env->u.pszString != (char *)NULL)
	{				/* check against a literal string */
	size = (matchBeginning(right,env->u.pszString)) ?
				strlen(env->u.pszString) : 0;
					/* check for validity */
	if (chk_senv_right((int)size, right, env) ) return( TRUE );
	}
	else
	{				/* check word final condition */
	if (env->iFlags & E_NOT)
		return( *right != NUL );	/* ellipses don't matter for ~# */
	if (env->iFlags & E_ELLIPSIS)
		return( TRUE );		/* we always eventually end! */
	return( *right == NUL );
	}
	/*
	 *  now check for E_ELLIPSIS case
	 */
	if (!(env->iFlags & E_ELLIPSIS))
	return( FALSE );		/* had to match here */
	/* if we reach here, we try again further out (due to '...') */
	}
} /* end of senv_right() */

/*************************************************************************
 * NAME
 *    check_change_environment
 * ARGUMENTS
 *    leftstring  - pointer to the leftside environment string
 *    leftsize    - length of the leftside environment string
 *    rightstring - pointer to the rightside environment string
 *    ec          - pointer to the allomorph's string environment
 * DESCRIPTION
 *    Check if this change is allowed by it's surface (string)
 *    environment.
 *	(Note: the change string begins at leftstring+leftsize and
 *				  and ends at rightstring;
 *	       the length of the change string is
 *			rightstring - (leftstring+leftsize)  )
 * RETURN VALUE
 *    nonzero if okay, zero if the environment is wrong
 */
static int check_change_environment(leftstring,leftsize,rightstring,ec)
char *leftstring;
int leftsize;
char *rightstring;
ChangeEnvironment *ec;
{
char *left;
int val;
/*
 *  handle null arguments safely
 */
if (ec == (ChangeEnvironment *)NULL)
	return( TRUE );		/* no environment constraint at all */
if (leftstring == (char *)NULL)
	{
	leftstring = "";
	leftsize   = 0;
	}
if (rightstring == (char *)NULL)
	rightstring = "";
/*
 *  allocate space for a copy of the leftside string
 */
left = allocMemory( leftsize+1 );
/*
 *  go through the list of string environment conditions, quitting at the
 *  first one that succeeds
 */
for ( val = FALSE ; ec != (ChangeEnvironment *)NULL ; ec = ec->pNext )
	{
	strncpy(left, leftstring, leftsize);   /* need fresh copy each time */
	left[leftsize] = NUL;		/* Ensure null termination */
	val = senv_left( left, ec->pLeftEnv) &&
	  senv_right( rightstring, ec->pRightEnv );
	if (ec->bNot)			/* check for negative environment */
	val = !val;
	if (val)
	break;				/* both sides okay, so quit */
	}
freeMemory( left );			/* free the allocated space */
return( val );
} /* end of check_change_environment() */

/***************************************************************************
 * NAME
 *    split_line
 * ARGUMENTS
 *    line
 *    p_rep
 *    p_marks
 *    p_env
 * DESCRIPTION
 *    Parse a line of input which has the following fields:
 *	1) an initial delimited string
 *	2) if p_rep is not NULL, a second delimited string
 *	3) if p_marks is not NULL, an optional list of items before any
 *	   environment
 *	4) if p_env is not NULL, an optional environment
 *    The delimiter at the end of the initial string is replaced by a NUL.
 *    The second delimited string is treated similarly, with the address
 *    of the string being stored through p_rep.  If an environment is found,
 *    a pointer to it is stored through p_env.  If any tokens are found
 *    between the end of the strings and the beginning of an environment,
 *    the address of the initial token is stored through p_marks.
 * RETURN VALUE
 *    pointer to the initial delimited string in the input line
 *    (p_rep, p_marks, and p_env are pointers to values which may be
 *    changed as a side effect of this function)
 *    NULL if a required string is not found
 */
static char *split_line(line,p_rep,p_marks,p_env)
char *line;
char **p_rep;
char **p_marks;
char **p_env;
{
register char *p;
char *match, *replace, *marks, *env;
char delim;
/*
 *  find the initial (match) string, and terminate it with a NUL
 */
for ( match = line ; (isascii(*match) && isspace(*match)) ; ++match )
	;
if ((delim = *match++) == NUL)
	return((char *)NULL);
if ((p = strchr(match,delim)) == (char *)NULL)
	return((char *)NULL);
*p++ = NUL;
/*
 *  if requested, find the second (replace) string, and terminate it likewise
 */
if (p_rep != (char **)NULL)
	{
	if ((replace = strchr(p,delim)) == (char *)NULL)
	return((char *)NULL);
	if ((p = strchr(++replace,delim)) == (char *)NULL)	/* (adjust replace) */
	return((char *)NULL);
	*p++ = NUL;
	}
else
	replace = (char *)NULL;
/*
 *  isolate any markers or environment
 */
env = (char *)NULL;
for ( marks = p ; (isascii(*marks) && isspace(*marks)) ; ++marks )
	;
if ((*marks != NUL) && (p_env != (char **)NULL))
	{
	if ((*marks == '/') || matchBeginning(marks,"+/"))
	{
	env = marks;
	marks = (char *)NULL;
	}
	else
	{
	/*
	 *  look for an environment marker (/ or +/) preceded by whitespace
	 */
	p = marks;
	while ((env = strchr(p,'/')) != (char *)NULL)
		{
		p = env+1;			/* advance start of search */
		if (*(env-1) == '+')
		--env;			/* back up to leading + if +/ */
		if (isascii(*(env-1)) && isspace(*(env-1)))
		{
		*(env-1) = NUL;		/* terminate markers */
		break;
		}
		}
	}
	}
if (marks && (*marks == NUL))
	marks = (char *)NULL;		/* convert empty string to NULL */
/*
 *  check for unwanted clutter
 */
if ((marks != (char *)NULL) && (p_marks == (char **)NULL))
	return((char *)NULL);		/* unwanted markers */
if ((env != (char *)NULL) && (p_env == (char **)NULL))
	return((char *)NULL);		/* unwanted environment */
/*
 *  we've collected everything safely, so stuff the return values and return
 */
if (p_rep != (char **)NULL)
	*p_rep = replace;
if (p_marks != (char **)NULL)
	*p_marks = marks;
if (p_env != (char **)NULL)
	*p_env = env;
return( match );
}

/****************************************************************************
 * NAME
 *    write_left_env
 * DESCRIPTION
 *    Write the left side of a string environment to the indicated buffer.
 * RETURN VALUE
 *    None
 */
static void write_left_env(eip, pOutputFP_in)
ChgEnvItem *	eip;			/* chg_env_item pointer */
FILE *		pOutputFP_in;
{
StringClass *scp;

if (eip == (ChgEnvItem *)NULL)
	return;
write_left_env(eip->pNext, pOutputFP_in);
putc(' ', pOutputFP_in);
if (eip->iFlags & E_NOT)
	putc('~', pOutputFP_in);
if (eip->iFlags & E_OPTIONAL)
	putc('(', pOutputFP_in);
if (eip->iFlags & E_CLASS)
	{
	scp = (StringClass *)eip->u.pClass;
	fprintf(pOutputFP_in, "[%s]", scp->pszName);
	}
else if (eip->u.pszString == NULL)
	putc('#', pOutputFP_in);
else
	fputs(eip->u.pszString, pOutputFP_in);
if (eip->iFlags & E_OPTIONAL)
	putc(')', pOutputFP_in);
if (eip->iFlags & E_ELLIPSIS)
	fputs(" ...", pOutputFP_in);
}

/****************************************************************************
 * NAME
 *    write_right_env
 * DESCRIPTION
 *    Write the right side of a string environment to the indicated file.
 * RETURN VALUE
 *    None
 */
static void write_right_env(eip, pOutputFP_in)
ChgEnvItem *	eip;			/* chg_env_item pointer */
FILE *		pOutputFP_in;
{
StringClass *scp;

for ( ; eip ; eip = eip->pNext )
	{
	putc(' ', pOutputFP_in);
	if (eip->iFlags & E_ELLIPSIS)
	fputs("... ", pOutputFP_in);
	if (eip->iFlags & E_NOT)
	putc('~', pOutputFP_in);
	if (eip->iFlags & E_OPTIONAL)
	putc('(', pOutputFP_in);
	if (eip->iFlags & E_CLASS)
	{
	scp = (StringClass *)eip->u.pClass;
	fprintf(pOutputFP_in, "[%s]", scp->pszName);
	}
	else if (eip->u.pszString == NULL)
	putc('#', pOutputFP_in);
	else
	fputs(eip->u.pszString, pOutputFP_in);
	if (eip->iFlags & E_OPTIONAL)
	putc(')', pOutputFP_in);
	}
}

/*****************************************************************************
 * NAME
 *    writeChange
 * DESCRIPTION
 *    write this change to an output file
 * RETURN VALUE
 *    non
 */
void writeChange(pChange_in, pOutputFP_in)
const Change *	pChange_in;
FILE *		pOutputFP_in;
{
int			cQuote;
ChangeEnvironment *	pEnvCond;

if (pOutputFP_in == NULL)
	return;
if (pChange_in != NULL)
	{
	cQuote = getChangeQuote(pChange_in->pszMatch, pChange_in->pszReplace);
	fprintf(pOutputFP_in, "%c%s%c %c%s%c",
		cQuote, pChange_in->pszMatch ? pChange_in->pszMatch : "", cQuote,
		cQuote, pChange_in->pszReplace ? pChange_in->pszReplace : "",
		cQuote);
	for (   pEnvCond = pChange_in->pEnvironment ;
		pEnvCond ;
		pEnvCond = pEnvCond->pNext )
	{
	fputs("  /", pOutputFP_in);
	write_left_env(pEnvCond->pLeftEnv, pOutputFP_in);
	putc(' ', pOutputFP_in);
	if (pEnvCond->bNot)
		putc('~', pOutputFP_in);
	putc('_', pOutputFP_in);
	write_right_env(pEnvCond->pRightEnv, pOutputFP_in);
	}
	if (pChange_in->pszDescription != NULL)
	fprintf(pOutputFP_in, " // %s", pChange_in->pszDescription);
	}
putc('\n', pOutputFP_in);
}
