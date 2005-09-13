/* PCKFUNCS.C - functions used in PC-KIMMO apart from user interface
 ***************************************************************************
 *
 * int moveKimmoAutomata(unsigned lexChar, unsigned surfChar, int *config,
 *			 KimmoData *pKimmo_in)
 * int checkKimmoFinalConfiguration(int *config, KimmoData *pKimmo_in)
 * int validateKimmoWordForm(unsigned char *form, KimmoData *pKimmo_in)
 * void freeKimmoResult(KimmoResult *resp, KimmoData * pKimmo_in)
 * char *eraseKimmoNullChars(char *string, KimmoData * pKimmo_in)
 * void writeKimmoResults(KimmoResult * pResults_in,
 *			  FILE *        pOutputFP_in,
 *			  KimmoData *   pKimmo_in);
 * RESULT *rec_result_to_result(KimmoResult *rresp, KimmoData * pKimmo_in)
 *
 ***************************************************************************
 * Copyright 1989, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
#ifndef HAVE_STRCHR
#define strchr  index
#endif
extern VOIDP  memcpy  P((VOIDP dest, const VOIDP src, size_t n));
extern char * strcat  P((char * dest, const char * src));
extern int    strcmp  P((const char * s1, const char * s2));
extern int    strncmp P((const char * s1, const char * s2, size_t n));
extern char * strchr  P((const char * s, int c));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "kimmo.h"
#include "kimmodef.h"
#include "../pcpatr/patrdef.h"
/*
 *  error messages
 */
static NumberedMessage sBadCharacterInForm_m	= { ERROR_MSG,   800,
	"Form [ %s ] contains character not in alphabet: %s" };
static NumberedMessage sBadRule_m		= { ERROR_MSG,   801,
	"RULE %d is invalid - input %s:%s is not specified by any column" };
/*
 *  local function prototypes
 */
static int	maxlength P((int size1, int size2, int size3));
static void	writeKimmoMorphemes P((KimmoMorpheme * pMorphemes_in,
					   FILE *	       pOutputFP_in,
					   KimmoData *     pKimmo_in));
static char *	buildMorphFeatString P((unsigned short *  pIndexes,
					KimmoData *       pKimmo_in));

#ifdef applec
#pragma segment S_pckfuncs
#endif

/****************************************************************************
 * NAME
 *    moveKimmoAutomata
 * ARGUMENTS
 *    lexC  - character from the lexicon
 *    surfC - character from the input string
 *    config   - vector of automata states
 *    pKimmo_in     - pointer to KimmoData data structure
 * DESCRIPTION
 *    Move all of the automata to the next state based on the input
 *    characters and the current state.
 * RETURN VALUE
 *    0 if successful, or the number of the rule (automaton) that blocked
 *    if unsuccessful
 */
int moveKimmoAutomata(lexC, surfC, config, pKimmo_in)
unsigned lexC, surfC;
int *config;
KimmoData *pKimmo_in;
{
unsigned i, j, num;
KimmoRule *rp;
register unsigned char *lexp, *surfp;
register KimmoFSAColumn *cp, *mp;
unsigned char lexChar, surfChar;
char *	pszLex;
char	szLexchar[2];
char *	pszSurf;
char	szSurfchar[2];

lexChar = lexC;		/* ensure 8-bit characters */
surfChar = surfC;
num = pKimmo_in->uiAutomataSize;
for (rp = pKimmo_in->pAutomata, i = 0 ; i < num ; ++i, ++rp, ++config)
	{
	if (!rp->bActive)
	continue;			/* ignore if rule turned off */
	for (   cp = rp->pColumns, mp = (KimmoFSAColumn *)NULL, j = 0 ;
		j < rp->iColumnCount ;
		++j, ++cp )
	{
	lexp  = cp->pLexChars;
	surfp = cp->pSurfChars;
	/*
	 *  check the easy case where either lexChar or surfChar must
	 *    match a single character (KIMMO_ALPHABET_CHAR or KIMMO_NULL_CHAR)
	 */
	if (	((lexChar == *lexp) && (surfChar == *surfp)) ||
		(   (cp->eLexType & (KIMMO_ALPHABET_CHAR | KIMMO_NULL_CHAR)) &&
			(lexChar == *lexp) &&
			(cp->eSurfType & (KIMMO_SUBSET_CHAR | KIMMO_ANY_CHAR)) &&
			(strchr((char *)surfp, surfChar) != (char *)NULL) ) ||
		(   (cp->eSurfType & (KIMMO_ALPHABET_CHAR | KIMMO_NULL_CHAR))&&
			(surfChar == *surfp) &&
			(cp->eLexType & (KIMMO_SUBSET_CHAR | KIMMO_ANY_CHAR)) &&
			(strchr((char *)lexp, lexChar) != (char *)NULL) ) )
		{
		mp = cp;
		break;
		}
	/*
	 *  check the harder case where both lexChar or surfChar may
	 *    match multiple characters (KIMMO_SUBSET_CHAR or KIMMO_ANY_CHAR)
	 */
	if (	(cp->eLexType  & (KIMMO_SUBSET_CHAR | KIMMO_ANY_CHAR)) &&
		(cp->eSurfType & (KIMMO_SUBSET_CHAR | KIMMO_ANY_CHAR)) )
		{
		for ( ; *lexp != NUL ; ++lexp, ++surfp )
		{
		if ((lexChar == *lexp) && (surfChar == *surfp))
			{
			mp = cp;
			break;
			}
		}
		if (mp != (KimmoFSAColumn *)NULL)
		break;
		}
	}
	if (mp == (KimmoFSAColumn *)NULL)
	{
	szLexchar[1] = NUL;
	switch (lexChar)
		{
		case KIMMO_ALPHA_NULL:
		szLexchar[0] = (char)pKimmo_in->cNull;
		pszLex = szLexchar;
		break;
		case KIMMO_ALPHA_BOUNDARY:
		szLexchar[0] = (char)pKimmo_in->cBoundary;
		pszLex = szLexchar;
		break;
		case KIMMO_ALPHA_ANY:
		szLexchar[0] = (char)pKimmo_in->cAny;
		pszLex = szLexchar;
		break;
		default:
		pszLex = (lexChar <= pKimmo_in->uiAlphabetSize) ?
				   (char *)pKimmo_in->ppszAlphabet[lexChar-1] : "?BAD?";
		break;
		}
	szSurfchar[1] = NUL;
	switch (surfChar)
		{
		case KIMMO_ALPHA_NULL:
		szSurfchar[0] = (char)pKimmo_in->cNull;
		pszSurf = szSurfchar;
		break;
		case KIMMO_ALPHA_BOUNDARY:
		szSurfchar[0] = (char)pKimmo_in->cBoundary;
		pszSurf = szSurfchar;
		break;
		case KIMMO_ALPHA_ANY:
		szSurfchar[0] = (char)pKimmo_in->cAny;
		pszSurf = szSurfchar;
		break;
		default:
		pszSurf = (surfChar <= pKimmo_in->uiAlphabetSize) ?
				  (char *)pKimmo_in->ppszAlphabet[surfChar-1] : "?BAD?";
		break;
		}
	displayNumberedMessage(&sBadRule_m,
				   pKimmo_in->bSilent, pKimmo_in->bShowWarnings,
				   pKimmo_in->pLogFP,
				   NULL, 0, i+1, pszLex, pszSurf);
	return(i+1);
	}

	if ((*config = mp->puiTransitions[ (*config) - 1 ]) == 0)
	return(i+1);	/* number of the rule that blocked */
	}
return(0);		/* not blocked by any rule */
}

/****************************************************************************
 * NAME
 *    checkKimmoFinalConfiguration
 * ARGUMENTS
 *    config - final configuration states of the rules
 *    pKimmo_in   - pointer to KimmoData data structure
 * DESCRIPTION
 *    determine if, in the final configuration of the automata, the current
 *    state of each of the rules is one of the defined final states for that
 *    rule
 * RETURN VALUE
 *    zero if okay, otherwise the number of the first automata which fails
 */
int checkKimmoFinalConfiguration(config,pKimmo_in)
int *config;
KimmoData *pKimmo_in;
{
register int i;
register KimmoRule *rp;
int num;
/*
 *  for each rule (automata), check whether the state indicated by the
 *    final configuration is a valid final state
 */
num = pKimmo_in->uiAutomataSize;
for ( rp = pKimmo_in->pAutomata, i = 0 ; i < num ; ++i, ++rp )
	{
	if (!rp->bActive)
	continue;		/* ignore if rule turned off */
	if (rp->puiFinalStates[config[i]-1])
	continue;		/* valid final state for this rule */
	return( i + 1 );		/* failed this rule -- return rule number */
	}
/*
 * if all rules are in a final state, checkKimmoFinalConfiguration() passes
 */
return(0);
}

/*****************************************************************************
 * NAME
 *    findKimmoAlphabetIndex
 * ARGUMENTS
 *    token - pointer to the beginning of a string
 *    pKimmo_in  - pointer to the current KimmoData structure
 * DESCRIPTION
 *    search the alphabet for the first "character" token matching the
 *    beginning of the string
 * RETURN VALUE
 *    0 if not found, or array index + 1 if found
 */
int findKimmoAlphabetIndex(token, pKimmo_in)
unsigned char *token;
KimmoData *pKimmo_in;
{
unsigned i;
char *letter;
char toklet = *token;

for ( i = 0 ; i < pKimmo_in->uiAlphabetSize ; ++i )
	{
	letter = (char *)pKimmo_in->ppszAlphabet[i];
	if (*letter != toklet)
	continue;
	if (strncmp((char *)token, letter, strlen(letter)) == 0)
	return( i+1 );
	}
return( 0 );
}

/****************************************************************************
 * NAME
 *    validateKimmoWordForm
 * ARGUMENTS
 *    form  - pointer to word string
 *    pKimmo_in  - pointer to KimmoData data structure
 * DESCRIPTION
 *    validate a form (i.e. supposed alphabetic sequence of characters
 *    make up a word) and convert it to alphabet indexes
 * RETURN VALUE
 *    TRUE if valid, FALSE if invalid
 */
int validateKimmoWordForm(form, pKimmo_in)
unsigned char *form;
KimmoData *pKimmo_in;
{
unsigned char *p, *q, *r;
int k;
unsigned char *string;

for ( p = q = form ; *p != NUL ; )
	{
	if ((k = findKimmoAlphabetIndex(p, pKimmo_in)) != 0)
	{
	*q++ = k;
	p += strlen((char *)pKimmo_in->ppszAlphabet[k-1]);
	}
	else if (*p == pKimmo_in->cNull)
	{
	*q++ = KIMMO_ALPHA_NULL;
	++p;
	}
	else
	{
	/*
	 *  rebuild the original string
	 */
	string = (unsigned char *)duplicateString((char *)form);
	string[0] = NUL;
	for ( r = form ; r < q ; ++r )
		strcat((char *)string,
		   (char *)convertKimmoIndexToCharacter(*r, pKimmo_in));
	strcat((char *)string, (char *)p);
	displayNumberedMessage(&sBadCharacterInForm_m,
				   pKimmo_in->bSilent, pKimmo_in->bShowWarnings,
				   pKimmo_in->pLogFP,
				   NULL, 0, string, p);
	if (pKimmo_in->pLogFP != (FILE *)NULL)
		{
		fprintf(pKimmo_in->pLogFP, sBadCharacterInForm_m.pszMessage, string, p);
		putc('\n', pKimmo_in->pLogFP);
		}
	freeMemory(string);
	return(FALSE);
	}
	}
*q = NUL;
return(TRUE);
}

#ifdef NEED_8BIT_STRCHR
/************************************************************************
 * NAME
 *    strchr
 * ARGUMENTS
 *    s - address of NUL-terminated character string
 *    c - character to search for
 * DESCRIPTION
 *    Search for the first occurrence of the character c in the string s.
 *    This is the same as the 4.2BSD function index().
 *    This a special 8-bit clean version of strchr().
 * RETURN VALUE
 *    address of the first occurrence of c in s, or NULL if c does not
 *    occur in s
 */
char *strchr( s, c )
const char *s;
int c;
{
unsigned k;
unsigned char *str;
unsigned ch;

if (s == NULL)
	return( NULL );
str = (unsigned char *)s;
ch  = c & 0xFF;
do  {
	k = *str++;
	if (k == ch)
	return( (char *)--str );
	} while (k != NUL );
return( NULL );		/* signal that c was not found */
}
#endif

/*****************************************************************************
 * NAME
 *    convertKimmoIndexToCharacter
 * ARGUMENTS
 *    idx  - index value to translate to a "character" (string)
 *    pKimmo_in - pointer to the current KimmoData structure
 * DESCRIPTION
 *    look up the value in the language's alphabet array
 * RETURN VALUE
 *    pointer to a "character" (string)
 */
unsigned char *convertKimmoIndexToCharacter(idx, pKimmo_in)
unsigned idx;
KimmoData *pKimmo_in;
{
static unsigned char buf_any[2], buf_boundary[2], buf_null[2];

if (idx <= pKimmo_in->uiAlphabetSize)
	return( pKimmo_in->ppszAlphabet[idx-1] );
if (idx == KIMMO_ALPHA_NULL)
	{
	buf_null[0] = pKimmo_in->cNull;
	buf_null[1] = NUL;
	return( buf_null );
	}
else if (idx == KIMMO_ALPHA_BOUNDARY)
	{
	buf_boundary[0] = pKimmo_in->cBoundary;
	buf_boundary[1] = NUL;
	return( buf_boundary );
	}
else if (idx == KIMMO_ALPHA_ANY)
	{
	buf_any[0] = pKimmo_in->cAny;
	buf_any[1] = NUL;
	return( buf_any );
	}
return( (unsigned char *)"????" );
}

/*****************************************************************************
 * NAME
 *    convertCharacterToKimmoIndex
 * ARGUMENTS
 *    token - pointer to a "character" (string)
 *    pKimmo_in  - pointer to the current KimmoData structure
 * DESCRIPTION
 *    look up the value in the language's alphabet array
 * RETURN VALUE
 *    index value translated from a "character" (string)
 */
int convertCharacterToKimmoIndex(token, pKimmo_in)
unsigned char *token;
KimmoData *pKimmo_in;
{
unsigned i;

if ((token == NULL) || (*token == NUL))
	return(0);
if (strlen((char *)token) == 1)
	{
	if (*token == pKimmo_in->cNull)
	return( KIMMO_ALPHA_NULL );
	else if (*token == pKimmo_in->cBoundary)
	return( KIMMO_ALPHA_BOUNDARY );
	else if (*token == pKimmo_in->cAny)
	return( KIMMO_ALPHA_ANY );
	}
for ( i = 0 ; i < pKimmo_in->uiAlphabetSize ; ++i )
	{
	if (strcmp((char *)pKimmo_in->ppszAlphabet[i], (char *)token) == 0)
	return( i+1 );
	}
return( 0 );
}

/****************************************************************************
 * NAME
 *    writeKimmoIndexString
 * ARGUMENTS
 *    outfp  - output FILE pointer
 *    string - string of alphabet index values
 *    pKimmo_in   - pointer to the current KimmoData structure
 * DESCRIPTION
 *    write the result in human readable form
 * RETURN VALUE
 *    none
 */
void writeKimmoIndexString(outfp, string, pKimmo_in)
FILE *outfp;
unsigned char *string;
KimmoData *pKimmo_in;
{
unsigned char *p;

if (string != (unsigned char *)NULL)
	{
	fprintf(outfp, "   ");
	for ( p = string ; *p ; ++p )
	{
	if (*p <= pKimmo_in->uiAlphabetSize)
		fprintf(outfp, "%s", pKimmo_in->ppszAlphabet[*p-1]);
	else if (*p == KIMMO_ALPHA_NULL)
		fprintf(outfp, "%c", pKimmo_in->cNull);
	else
		fprintf(outfp, "?");
	}
	}
}

/****************************************************************************
 * NAME
 *    freeKimmoResult
 * ARGUMENTS
 *    resp - pointer to linked list of KimmoResults
 * DESCRIPTION
 *    Free the memory used by a linked list of KimmoResults.
 * RETURN VALUE
 *    none
 */
void freeKimmoResult(resp, pKimmo_in)
KimmoResult * resp;
KimmoData * pKimmo_in;
{
KimmoResult *	rp;
KimmoResult *	nextrp;
KimmoMorpheme *	mop;
KimmoMorpheme *	nextmop;

for ( rp = resp ; rp != (KimmoResult *)NULL ; rp = nextrp )
	{
	nextrp = rp->pNext;
	if (rp->pszSynthesis != (unsigned char *)NULL)
	freeMemory(rp->pszSynthesis);
	for ( mop = rp->pAnalysis ; mop != (KimmoMorpheme *)NULL ; mop = nextmop )
	{
	nextmop = mop->pNext;
	freeMemory(mop);
	}
	if (rp->pParseChart != NULL)
	freePATREdgeList(rp->pParseChart, &pKimmo_in->sPATR);
	if (rp->pszResult != NULL)
	freeMemory(rp->pszResult);
	if (rp->pszGloss != NULL)
	freeMemory(rp->pszGloss);
	freeMemory(rp);
	}
}

/***************************************************************************
 * NAME
 *    eraseKimmoNullChars
 * ARGUMENTS
 *    string - input string to modify
 *    pKimmo_in   - pointer to the current KimmoData structure
 * DESCRIPTION
 *    Erase any null characters that are found in 'string'.
 * RETURN VALUE
 *    pointer to modified string
 */
char *eraseKimmoNullChars(string, pKimmo_in)
char *string;
KimmoData *pKimmo_in;
{
register char *p, *q;
int i, k;

if ((string == (char *)NULL) || (*string == NUL))
	return(string);
for ( p = q = string ; *p ; )
	{
	if ((i = findKimmoAlphabetIndex((unsigned char *)p, pKimmo_in)) != 0)
	{
	k = strlen( (char *)pKimmo_in->ppszAlphabet[i-1] );
	memcpy(q, pKimmo_in->ppszAlphabet[i-1], k);
	p += k;
	q += k;
	}
	else if (*p == (char)pKimmo_in->cNull)
	++p;
	else
	{
	/* should complain */
	break;
	}
	}
*q = NUL;
return(string);
}

/***************************************************************************
 * NAME
 *    maxlength
 * ARGUMENTS
 *    size1 - length of first object
 *    size2 - length of second object
 *    size3 - length of third object
 * DESCRIPTION
 *    Find the maximum length
 * RETURN VALUE
 *    Maximum length
 */
static int maxlength(size1, size2, size3)
int size1;
int size2;
int size3;
{
int ml;

if (size1 > size2)
	{
	if (size1 > size3)
	ml = size1;
	else
	ml = size3;
	}
else
	{
	if (size2 > size3)
	ml = size2;
	else
	ml = size3;
	}
return(ml);
}

/****************************************************************************
 * NAME
 *    writeKimmoMorphemes
 * ARGUMENTS
 *    morphs - pointer to linked list of KimmoMorpheme nodes
 *    outfp  - output FILE pointer
 * DESCRIPTION
 *    Write the lexical and feature strings and the names of the used lexicons
 *    to the indicated output file.
 * RETURN VALUE
 *    none
 */
static void writeKimmoMorphemes(morphs, outfp, pKimmo_in)
KimmoMorpheme *morphs;
FILE *outfp;
KimmoData *	pKimmo_in;
{
KimmoMorpheme *mp;
int strsize, featsize, lexsize, i;

for ( mp = morphs ; mp != (KimmoMorpheme *)NULL ; mp = mp->pNext )
	{
	if (mp->pLexItem != (KimmoLexItem *)NULL )
	{
	strsize = strlen((char *)mp->pLexItem->pszLexString);
	featsize = strlen((char *)mp->pLexItem->pszGloss);
	lexsize = strlen((char *)mp->pszLexiconSection);
	fprintf( outfp, "%s", mp->pLexItem->pszLexString);
	for ( i = maxlength(strsize,featsize,lexsize) - strsize ; i != 0 ; i--)
		putc( ' ', outfp);
	putc( ' ', outfp);
	}
	}
putc('\n', outfp);
if (pKimmo_in->sPATR.bGloss)
	{
	for ( mp = morphs ; mp != (KimmoMorpheme *)NULL ; mp = mp->pNext )
	{
	if (mp->pLexItem != (KimmoLexItem *)NULL )
		{
		strsize = strlen((char *)mp->pLexItem->pszLexString);
		featsize = strlen((char *)mp->pLexItem->pszGloss);
		lexsize = strlen((char *)mp->pszLexiconSection);
		fprintf( outfp, "%s", mp->pLexItem->pszGloss);
		for (   i = maxlength(strsize,featsize,lexsize) - featsize ;
			i != 0 ;
			i-- )
		putc( ' ', outfp);
		putc( ' ', outfp );
		}
	}
	putc('\n', outfp);
	}
for ( mp = morphs ; mp != (KimmoMorpheme *)NULL ; mp = mp->pNext )
	{
	strsize = strlen((char *)mp->pLexItem->pszLexString);
	featsize = strlen((char *)mp->pLexItem->pszGloss);
	lexsize = strlen((char *)mp->pszLexiconSection);
	fprintf( outfp, "%s", mp->pszLexiconSection);
	for ( i = maxlength( strsize, featsize, lexsize) - lexsize ; i != 0 ; i-- )
	putc( ' ', outfp);
	putc( ' ', outfp );
	}
putc( '\n', outfp);
}

/****************************************************************************
 * NAME
 *    writeKimmoResults
 * DESCRIPTION
 *    Write the results to the indicated output file.
 * RETURN VALUE
 *    none
 */
void writeKimmoResults(pResults_in, pOutputFP_in, pKimmo_in)
KimmoResult *	pResults_in;	/* pointer to list of KimmoResult nodes */
FILE *		pOutputFP_in;	/* output FILE pointer */
KimmoData *	pKimmo_in;
{
KimmoResult *	rp;

if (	(pResults_in  == NULL) ||
	(pOutputFP_in == NULL) ||
	(pKimmo_in    == NULL) )
	return;
if (	(pKimmo_in->bAlignment || pKimmo_in->bUsePATR) &&
	(pResults_in->pszSynthesis == NULL) )
	{
	for ( rp = pResults_in ; rp ; rp = rp->pNext )
	{
	if (rp != pResults_in)
		putc('\n', pOutputFP_in);
	if (pKimmo_in->bUsePATR)
		{
		if (pKimmo_in->bAlignment)
		writeKimmoMorphemes(rp->pAnalysis, pOutputFP_in, pKimmo_in);
		else
		{
		fprintf(pOutputFP_in, "%s", rp->pszResult);
		if ((rp->pszGloss != NULL) && pKimmo_in->sPATR.bGloss)
			fprintf(pOutputFP_in, "     %s", rp->pszGloss);
		putc('\n', pOutputFP_in);
		}
		if (rp->pParseChart != (PATREdgeList *)NULL)
		writePATRParses(rp->pParseChart, pOutputFP_in,
				NULL, NULL, &pKimmo_in->sPATR);
		else
		fprintf(pOutputFP_in, "\nWord grammar result is NULL\n");
		}
	else		/* pKimmo_in->bAlignment must be on */
		writeKimmoMorphemes(rp->pAnalysis, pOutputFP_in, pKimmo_in);
	}
	}
else
	{
	for ( rp = pResults_in ; rp ; rp = rp->pNext )
	{
	fprintf(pOutputFP_in, "%s", rp->pszResult);
	if (    (rp->pszGloss != (unsigned char *)NULL) &&
		pKimmo_in->sPATR.bGloss)
		fprintf(pOutputFP_in, "     %s", rp->pszGloss);
	putc('\n', pOutputFP_in);
	}
	}
putc('\n', pOutputFP_in);
}

/*****************************************************************************
 * NAME
 *    concatKimmoMorphLexemes
 * DESCRIPTION
 *    concatenate the lexical strings from a list of KimmoMorphemes
 * RETURN VALUE
 *    dynamically allocated string containing the concatenated lexical strings
 *    from a list of morphemes, or NULL
 */
unsigned char * concatKimmoMorphLexemes(pMorphemes_in, pszSeparate_in,
					pKimmo_in)
KimmoMorpheme * pMorphemes_in;
char *		pszSeparate_in;
KimmoData *	pKimmo_in;
{
unsigned char *	pszLexemes;
size_t		uiLexemesLength;
size_t		uiSeparateLength;
KimmoMorpheme *	pMorph;

if (pMorphemes_in == NULL)
	return NULL;
if (pszSeparate_in == NULL)
	uiSeparateLength = 0;
else
	uiSeparateLength = strlen(pszSeparate_in);
uiLexemesLength = 1;
for ( pMorph = pMorphemes_in ; pMorph ; pMorph = pMorph->pNext )
	{
	uiLexemesLength += strlen((char *)pMorph->pLexItem->pszLexString);
	if (pMorph->pNext)
	uiLexemesLength += uiSeparateLength;
	}
pszLexemes = (unsigned char *)allocMemory( uiLexemesLength );
pszLexemes[0] = NUL;
for ( pMorph = pMorphemes_in ; pMorph ; pMorph = pMorph->pNext )
	{
	strcat((char *)pszLexemes, (char *)pMorph->pLexItem->pszLexString);
	if ((pMorph->pNext != NULL) && (pszSeparate_in != NULL))
	strcat((char *)pszLexemes, pszSeparate_in);
	}
return pszLexemes;
}

/*****************************************************************************
 * NAME
 *    concatKimmoMorphGlosses
 * DESCRIPTION
 *    concatenate the gloss strings from a list of KimmoMorphemes
 * RETURN VALUE
 *    dynamically allocated string containing the concatenated gloss strings
 *    from a list of morphemes, or NULL
 */
unsigned char * concatKimmoMorphGlosses(pMorphemes_in, pszSeparate_in,
					pKimmo_in)
KimmoMorpheme * pMorphemes_in;
char *		pszSeparate_in;
KimmoData *	pKimmo_in;
{
unsigned char *	pszGlosses;
size_t		uiGlossesLength;
size_t		uiSeparateLength;
KimmoMorpheme *	pMorph;

if (pMorphemes_in == NULL)
	return NULL;
if (pszSeparate_in == NULL)
	uiSeparateLength = 0;
else
	uiSeparateLength = strlen(pszSeparate_in);
uiGlossesLength = 1;
for ( pMorph = pMorphemes_in ; pMorph ; pMorph = pMorph->pNext )
	{
	uiGlossesLength += strlen((char *)pMorph->pLexItem->pszGloss);
	if (pMorph->pNext)
	uiGlossesLength += uiSeparateLength;
	}
pszGlosses = (unsigned char *)allocMemory( uiGlossesLength );
pszGlosses[0] = NUL;
for ( pMorph = pMorphemes_in ; pMorph ; pMorph = pMorph->pNext )
	{
	strcat((char *)pszGlosses, (char *)pMorph->pLexItem->pszGloss);
	if ((pMorph->pNext != NULL) && (pszSeparate_in != NULL))
	strcat((char *)pszGlosses, pszSeparate_in);
	}
return pszGlosses;
}

/*****************************************************************************
 * NAME
 *    buildMorphemeFeatString
 * ARGUMENTS
 *    pIndexes - array of indexes into the language feature names array
 * DESCRIPTION
 *    convert the array of indexes into a character string listing the feature
 *    names
 * RETURN VALUE
 *    pointer to the (possibly empty) string of feature names
 */
static char * buildMorphFeatString(pIndexes, pKimmo_in)
unsigned short *	pIndexes;
KimmoData *		pKimmo_in;
{
int i;
unsigned	uiTotalLength;
char *		pszFeatures;

if ((pIndexes == NULL) || (pIndexes[0] == 0))
	return( duplicateString("") );

uiTotalLength = 0;
for ( i = 0 ; pIndexes[i] != 0 ; ++i )
	{
	uiTotalLength += strlen((char *)pKimmo_in->ppszFeatures[pIndexes[i]-1]);
	++uiTotalLength;
	}
pszFeatures = (char *)allocMemory(uiTotalLength);
pszFeatures[0]    = '\0';
for ( i = 0 ; pIndexes[i] != 0 ; ++i )
	{
	if (i != 0)
	strcat(pszFeatures, " ");
	strcat(pszFeatures, (char *)pKimmo_in->ppszFeatures[pIndexes[i]-1]);
	}
return( pszFeatures );
}

/*****************************************************************************
 * NAME
 *    concatKimmoMorphFeatures
 * DESCRIPTION
 *    concatenate the feature names from a list of KimmoMorphemes
 * RETURN VALUE
 *    dynamically allocated string containing the concatenated feature names
 *    from a list of morphemes, or NULL
 */
unsigned char * concatKimmoMorphFeatures(pMorphemes_in, pszSeparate_in,
					 pKimmo_in)
KimmoMorpheme * pMorphemes_in;
char *		pszSeparate_in;
KimmoData *	pKimmo_in;
{
unsigned char *	pszFeatures;
char *		pszMorphFeats;
size_t		uiFeaturesLength;
size_t		uiSeparateLength;
size_t		uiAllocated;
size_t		uiLength;
KimmoMorpheme *	pMorph;

if (pMorphemes_in == NULL)
	return NULL;

if (pszSeparate_in == NULL)
	uiSeparateLength = 0;
else
	uiSeparateLength = strlen(pszSeparate_in);

pszFeatures = (unsigned char *)allocMemory(100);
memset(pszFeatures, '\0', 100);
uiAllocated      = 100;
uiFeaturesLength = 0;
for ( pMorph = pMorphemes_in ; pMorph ; pMorph = pMorph->pNext )
	{
	pszMorphFeats = buildMorphFeatString(pMorph->pLexItem->puiFeatureIndexes,
					 pKimmo_in);
	uiLength = strlen(pszMorphFeats);
	if (uiFeaturesLength + uiLength + uiSeparateLength >= uiAllocated)
	{
	uiAllocated = uiFeaturesLength + uiLength + uiSeparateLength + 1;
	pszFeatures = (unsigned char *)reallocMemory(pszFeatures, uiAllocated);
	}
	if (uiFeaturesLength != 0)
	{
	strcat((char *)pszFeatures, pszSeparate_in);
	uiFeaturesLength += uiSeparateLength;
	}
	strcat((char *)pszFeatures, pszMorphFeats);
	uiFeaturesLength += uiLength;
	freeMemory(pszMorphFeats);
	}
if (uiFeaturesLength + 1 < uiAllocated)
	pszFeatures = (unsigned char *)reallocMemory(pszFeatures,
						 uiFeaturesLength + 1);
return pszFeatures;
}

/****************************************************************************
 * NAME
 *    parseKimmoResultWithPATR
 * DESCRIPTION
 *    Run PC-PATR functions for morpheme list.
 *    The grammar file must be loaded before calling this function.
 * RETURN VALUE
 *    Pointer to the PATR result
 */
PATREdgeList * parseKimmoResultWithPATR(pMorphList_in, pKimmo_in)
KimmoMorpheme *	pMorphList_in;	/* list of morphemes */
KimmoData *	pKimmo_in;	/* pointer to current language data */
{
PATREdgeList *		pResult = NULL;
KimmoMorpheme *		mp;
KimmoLexItem *		li;
PATRWord *		pNewMorph;	/* Sentence Word to add it to */
static PATRWord *	pWord = NULL;
PATRWord *		pPrevMorph = NULL;

if ((pMorphList_in == NULL) || (pKimmo_in == NULL))
	return( NULL );
/*
 *  save pointers to temporary parse structures
 */
markPATRParseGarbage(&pKimmo_in->sPATR);
/*
 *  convert the list of morphemes to what parseWithPATR() wants
 */
for ( mp = pMorphList_in ; mp ; mp = mp->pNext )
	{
	li = mp->pLexItem;
	if (li == (KimmoLexItem *)NULL)
	continue;
	pNewMorph = buildPATRWordForKimmo((char *)li->pszLexString,
					  (char *)li->pszGloss,
					  (char *)mp->pszLexiconSection,
					  li->puiFeatureIndexes,
					  (char **)pKimmo_in->ppszFeatures,
					  &pKimmo_in->sPATR);
	if (pPrevMorph == NULL)			/* If first (no prev) */
	pWord = pNewMorph;			/* Set head to this */
	else
	pPrevMorph->pNext = pNewMorph;		/* Else link from prev */
	pPrevMorph = pNewMorph;			/* Set prev to this */
	}

if (pWord != NULL)
	{
	/*
	 *  parse the word and save a permanent copy of the result
	 */
	int iStage;
	pResult = parseWithPATR(pWord, &iStage, &pKimmo_in->sPATR);
	if (pResult != NULL)
	{
	pResult = storePATREdgeList( pResult, &pKimmo_in->sPATR );
	}
	}
/*
 *  Free any temporary parse structures
 */
collectPATRParseGarbage(&pKimmo_in->sPATR);

return( pResult );
}

/*****************************************************************************
 * NAME
 *    findLexical
 * DESCRIPTION
 *    find the first matching lexical character in the NUL,NUL terminated
 *    array of feasible pairs
 * RETURN VALUE
 *    pointer to the first feasible pair with a matching lexical character,
 *    or NULL if not found
 */
KimmoPair * findLexical(pPairs_in, cLexical_in)
KimmoPair *	pPairs_in;
int		cLexical_in;
{
unsigned	i;

if (pPairs_in == NULL)
	return NULL;
for ( i = 0 ; pPairs_in[i].cLexical ; ++i )
	{
	if (pPairs_in[i].cLexical == cLexical_in)
	return pPairs_in + i;
	}
return NULL;
}
