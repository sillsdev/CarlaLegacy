/* TEXTIN.C - read the next word from a text file
 ***************************************************************************
 *
 * WordTemplate * readTemplateFromText(FILE * pInputFP_in,
 *				       const TextControl * pTextCtl_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1982, 2000 by SIL International.  All rights reserved.
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
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern VOIDP  memmove P((VOIDP dest, VOIDP src, size_t n));
extern VOIDP  memcpy  P((VOIDP dest, VOIDP src, size_t n));
extern char * strcpy  P((char * dest, const char * src));
extern char * strchr  P((const char * s, int c));
extern char * strrchr P((const char * s, int c));
extern size_t strlen  P((const char * s));
#endif
extern int exitSafely P((int status));
#ifndef EXIT_FAILURE
#define	EXIT_FAILURE	1	/* Failing exit status.  */
#define	EXIT_SUCCESS	0	/* Successful exit status.  */
#endif

#include "allocmem.h"
#include "template.h"
#include "textctl.h"
#include "rpterror.h"

#undef BUFSIZE
#define BUFSIZE 300

/* local functions */
static char * addchar P((int        ch,
			 char *     pp,
			 char **    pend,
			 char **    pbuf,
			 unsigned * psize,
			 char **    pword));
static unsigned char * read_chunk P((FILE *           infp,
					 unsigned char ** pszString_io,
					 int *            pNextChar_out));
static unsigned char * fill_format P((WordTemplate *       pWord_out,
					  unsigned char *      pszChunk_in,
					  int *                pNextChar_io,
					  FILE *               infp,
					  unsigned char     ** pszString_io,
					  const TextControl *  pTextCtl_in));
static unsigned char * find_word_in_nonalpha P((
						unsigned char *     pszNonAlpha_in,
						const TextControl * pTextCtl_in));
static WordTemplate * fill_template P((FILE *              infp,
					   unsigned char **    pszString_io,
					   const TextControl * textin_ctl));

/*****************************************************************************
 *  control data set by the text input control file (xxINTX.CTL)
 */
static unsigned char szDefaultBarcodes_m[] = "bdefhijmrsuvyz";
static TextControl sDefaultTextControl_m = {
	NULL,	/* filename */
	NULL,	/* list of lowercase/uppercase pairs sorted by lowercase */
	NULL,	/* list of lowercase/uppercase pairs sorted by uppercase */
	NULL,	/* array of caseless letters */
	NULL,	/* list of input orthography changes */
	NULL,	/* list of output (orthography) changes */
	NULL,	/* list of format markers (fields) to include */
	NULL,	/* list of format markers (fields) to exclude */
	'\\',	/* initial character of format markers */
	'%',	/* character for marking ambiguities and failures (database) */
	'%',	/* character for marking ambiguities and failures (text) */
	'-',	/* character for marking decomposition */
	'|',	/* initial character of secondary format markers */
	szDefaultBarcodes_m,/* string of characters for secondary format markers */
	1,		/* flag whether or not to capitalize individual letters */
	1,		/* flag whether or not to handle capitalization */
	500		/* maximum number of ambiguous decapitalizations allowed */
	};

/***************************************************************************
 * NAME
 *    addchar
 * ARGUMENTS
 *    ch    - character to add
 *    pLoc_in    - pointer to current location in buffer
 *    ppEnd_io  - address of pointer to end of buffer
 *    ppszBuffer_io  - address of pointer to allocated buffer
 *    puiAllocSize_io - pointer to size of allocated buffer
 *    ppszStorage_io - address of pointer to buffer
 * DESCRIPTION
 *    Add a character to a buffer, allocating more space as needed.
 *    *ppEnd_io, *ppszBuffer_io, *puiAllocSize_io, and *ppszStorage_io may be
 *    changed as a side-effect.
 * RETURN VALUE
 *    pointer to current location in buffer (updated value of pLoc_in)
 */
static char * addchar(ch, pLoc_in, ppEnd_io, ppszBuffer_io, puiAllocSize_io,
			  ppszStorage_io)
int		ch;
char *		pLoc_in;
char **		ppEnd_io;
char **		ppszBuffer_io;
unsigned *	puiAllocSize_io;
char **		ppszStorage_io;
{
unsigned size;
char *p;

if (pLoc_in >= *ppEnd_io)
	{
	size = *puiAllocSize_io;
	*puiAllocSize_io = size ? size+BUFSIZE : 2*BUFSIZE;
	p = allocMemory(*puiAllocSize_io);
	if (p == (char *)NULL)
	{
	*ppszBuffer_io = p;
	*ppEnd_io = p;
	*puiAllocSize_io = 0;
	return( p );
	}
	*ppszBuffer_io = strcpy(p, *ppszStorage_io);
	if (size)
	freeMemory( *ppszStorage_io );
	*ppszStorage_io = *ppszBuffer_io;
	pLoc_in = *ppszBuffer_io + strlen(*ppszBuffer_io);
	*ppEnd_io = *ppszBuffer_io + *puiAllocSize_io - 1;
	}
*pLoc_in++ = (char)ch;
return(pLoc_in);
}

/***************************************************************************
 * NAME
 *    decapitalizeWord
 * DESCRIPTION
 *    Make the word all lowercase, and allocate space for it.
 * RETURN VALUE
 *    Capitalization flag for the word
 */
long decapitalizeWord(pWord_io, pTextCtl_in)
WordTemplate *       pWord_io;		/* pointer to WordTemplate structure */
const TextControl *  pTextCtl_in;
{
char *	word;
short	numalpha;
short	numupper;
long		flag;
long		bitfield;
long		bitmask;
long		firstalpha;
int		iLength;
unsigned char *	p;
/*
 *  Capitalization information is stored in a bit field, where the number 4
 *    is the first char, 8 the second, etc. up to the limit of the integer.
 *  If the word has more capitals than just the first letter, but is not all
 *    caps, then the integer representing the bit field is output.
 */
word = pWord_io->pszOrigWord;
flag = NOCAP;			/* assume not capitalized */
numupper = 0;
/*
 *  check decapitalization flag
 */
if (pTextCtl_in->bCapitalize)
	{
	/*
	 *  check for all uppercase letters
	 */
	bitfield = 0;
	bitmask = 4;
	firstalpha = 0;
	numalpha = 0;
	for ( p = (unsigned char *)word ; *p != NUL ; p += iLength )
	{
	if ((iLength = matchLowercaseChar(p, pTextCtl_in)) != 0)
		{
		++numalpha;			/* Count lower/uppercase alphabetics */
		if (firstalpha == 0)
		firstalpha = bitmask;
		}
	else if ((iLength = matchUppercaseChar(p, pTextCtl_in)) != 0)
		{
		/*
		 *  If uppercase, Or mask into bitfield and Count uppercase
		 */
		bitfield |= bitmask;
		++numupper;
		++numalpha;			/* Count upper/lowercase alphabetics */
		if (firstalpha == 0)
		firstalpha = bitmask;
		}
	else if ((iLength = matchCaselessChar(p, pTextCtl_in)) == 0)
		iLength = 1;
	bitmask <<= 1;		/* Shift mask for each alphabetic char */
	if ( bitmask < 0 )	/* If it reaches negative */
		bitmask = 0;	/* Zero it */
	}
	if (pTextCtl_in->bIndividualCapitalize)
	flag = bitfield;
	if ((numalpha > 1) && (numupper == numalpha))
	flag = ALLCAP;			/* If all cap Set all cap flag */
	else if ((numupper == 1) || !pTextCtl_in->bIndividualCapitalize)
	{
	/*
	 *  check for initial letter capitalized
	 *  If initial is capitalized, set initcap flag
	 */
	for ( p = (unsigned char *)word ; *p != NUL ; p += iLength )
		{
		if (matchUppercaseChar(p, pTextCtl_in) != 0)
		{
		flag = INITCAP;
		break;
		}
		if (matchLowercaseChar(p, pTextCtl_in) != 0)
		break;
		iLength = matchCaselessChar(p, pTextCtl_in);
		if (iLength == 0)
		iLength = 1;
		}
	}
	}
if ((flag == NOCAP) && (numupper == 0))
	{
	pWord_io->paWord = (char **)allocMemory(2 * sizeof(char *));
	pWord_io->paWord[0] = applyChanges(pWord_io->pszOrigWord,
					   pTextCtl_in->pOrthoChanges);
	pWord_io->paWord[1] = NULL;
	}
else
	{
	/*
	 *  convert word to all lower case (possibly ambiguosly)
	 */
	const StringList *	pLowerSet;
	const StringList *	ps;
	char *	pszDecapWord;
	char *	pszLower;
	size_t	uiCharCount;
	size_t	uiNumberAlternatives;
	size_t	uiNum;
	size_t	uiSpan;
	size_t	uiWordLength;
	int		iLowerLength;
	size_t	i;
	size_t	j;
	size_t	k;
#ifdef DEBUG
	printf("decapitalizeWord(\"%s\") =>", pWord_io->pszOrigWord);
#endif
	/*
	 *  count the number of multibyte characters in the string
	 */
	uiCharCount = 0;
	for ( p = (unsigned char *)pWord_io->pszOrigWord ; *p ; p += iLength )
	{
	iLength = matchAlphaChar(p, pTextCtl_in);
	if (iLength == 0)
		iLength = 1;
	++uiCharCount;
	}
	/*
	 *  calculate the number of (ambiguous) downcase conversions
	 */
	uiNumberAlternatives = 1;
	i = 0;
	for ( p = (unsigned char *)pWord_io->pszOrigWord ; *p ; p += iLength )
	{
	if (i >= uiCharCount)
		{
		++i;	/* ensure i != uiCharCount to force error message */
		break;
		}
	iLength = matchUppercaseChar(p, pTextCtl_in);
	if (iLength != 0)
		{
		pLowerSet = convUpperToLowerSet(p, pTextCtl_in);
		uiNumberAlternatives *= getStringListSize( pLowerSet );
		}
	else
		{
		iLength = matchAlphaChar(p, pTextCtl_in);
		if (iLength == 0)
		iLength = 1;
		}
	++i;
	}
	if ((i != uiCharCount) || (uiNumberAlternatives < 1))
	{
	reportError(ERROR_MSG,
			"error getting lowercase equivalents for \"%s\"\n",
			pWord_io->pszOrigWord);
	exitSafely(EXIT_FAILURE);
	}
	if (uiNumberAlternatives > pTextCtl_in->uiMaxAmbigDecap)
	uiNumberAlternatives = pTextCtl_in->uiMaxAmbigDecap;
	if (uiNumberAlternatives < 1)
	uiNumberAlternatives = 1;	/* ->uiMaxAmbigDecap may be zero */

	uiNum = (unsigned)((uiNumberAlternatives + 1) * sizeof(char *));
	if ((uiNum / sizeof(char *)) != (uiNumberAlternatives + 1))
	{
	reportError(WARNING_MSG,
		   "%lu lowercase equivalents is too many: storing only 500\n",
			uiNumberAlternatives);
	uiNumberAlternatives = 500;
	uiNum = (unsigned)(501 * sizeof(char *));
	}
#ifdef DEBUG
	printf(" %u:", uiNumberAlternatives);
#endif
	pWord_io->paWord = (char **)allocMemory(uiNum);
	/*
	 *  calculate the maximum length of the downcased word
	 */
	uiWordLength = 1;		/* count the terminating NUL byte */
	for ( p = (unsigned char *)pWord_io->pszOrigWord ; *p ; p += iLength )
	{
	iLength = matchUppercaseChar(p, pTextCtl_in);
	if (iLength != 0)
		{
		pLowerSet = convUpperToLowerSet(p, pTextCtl_in);
		uiSpan = 0;
		for ( ps = pLowerSet ; ps ; ps = ps->pNext )
		{
		k = strlen( ps->pszString );
		if (k > uiSpan)
			uiSpan = k;
		}
		}
	else
		{
		iLength = matchAlphaChar(p, pTextCtl_in);
		if (iLength == 0)
		iLength = 1;
		uiSpan = iLength;
		}
	uiWordLength += uiSpan;
	}
	pszDecapWord = allocMemory(uiWordLength);
	for ( i = 0 ; i < uiNumberAlternatives ; ++i )
	{
	strcpy(pszDecapWord, pWord_io->pszOrigWord);
	uiSpan = 1;
	j = 0;
	for ( p = (unsigned char *)pszDecapWord ; *p ; p += iLength )
		{
		iLength = matchUppercaseChar(p, pTextCtl_in);
		if (iLength != 0)
		{
		pLowerSet = convUpperToLowerSet(p, pTextCtl_in);
		uiNum = getStringListSize(pLowerSet);
		pszLower = pLowerSet->pszString;
		if (uiNum > 1)
			{
			k = (i / uiSpan) % uiNum;
			uiSpan *= uiNum;
			for ( ps = pLowerSet ; ps ; ps = ps->pNext )
			{
			if (k == 0)
				{
				pszLower = ps->pszString;
				break;
				}
			--k;
			}
			}
		/*
		 *  replace the uppercase multibyte character with an
		 *  equivalent lowercase multibyte character
		 */
		iLowerLength = strlen(pszLower);
		if (iLowerLength != iLength)
			memmove(p + iLowerLength,
				p + iLength,
				strlen((char *)p + iLength) + 1);
		memcpy(p, pszLower, iLowerLength);
		iLength = iLowerLength;
		}
		else
		{
		iLength = matchAlphaChar(p, pTextCtl_in);
		if (iLength == 0)
			iLength = 1;
		}
		++j;
		}
	pWord_io->paWord[i] = applyChanges(pszDecapWord,
					   pTextCtl_in->pOrthoChanges);
#ifdef DEBUG
	printf(" \"%s\"", pWord_io->paWord[i]);
#endif
	}
	pWord_io->paWord[uiNumberAlternatives] = NULL;
	freeMemory( pszDecapWord );
#ifdef DEBUG
	printf("\n");
#endif
	}

return( flag );
}

/*****************************************************************************
 * NAME
 *    read_chunk
 * DESCRIPTION
 *    read the next chunk of whitespace delimited text from the input file
 * RETURN VALUE
 *    pointer to the input buffer containing the next chunk of text, or NULL
 *    if EOF
 */
static unsigned char szChunkBuffer_m[BUFSIZE];
static unsigned char * pszNextWord_m = NULL;
static unsigned char * read_chunk(infp, ppszString_io, pNextChar_out)
FILE *	infp;
unsigned char ** ppszString_io;
int *	pNextChar_out;
{
int		nextc;
unsigned char *	p      = szChunkBuffer_m;
unsigned char *	mybuf  = NULL;
unsigned	mysize = 0;
unsigned char *	endbuf = szChunkBuffer_m + BUFSIZE - 1;
unsigned char *	pszBuffer = szChunkBuffer_m;

if (pszNextWord_m != NULL)
	{
	pszBuffer     = pszNextWord_m;
	pszNextWord_m = NULL;
	return pszBuffer;
	}
memset(szChunkBuffer_m, 0, BUFSIZE);
if (infp != NULL)
	{
	nextc  = getc(infp);
	if (nextc == EOF)
	return NULL;
	}
else
	{
	if ((ppszString_io != NULL) &&
	(*ppszString_io != NULL))
	{
	nextc = **ppszString_io;
	if (nextc == NUL)
		return NULL;
	(*ppszString_io)++;
	}
	else
	return NULL;
	}
/*
 *  collect any leading whitespace
 */
while (isascii(nextc) && isspace(nextc))
	{
	p = (unsigned char *)addchar(nextc, (char *)p, (char **)&endbuf,
				 (char **)&mybuf, &mysize,
				 (char **)&pszBuffer);
	if (p == NULL)
	goto out_of_memory;
	if (infp != NULL)
	{
	nextc  = getc(infp);
	if (nextc == EOF)
		break;
	}
	else
	{
	if ((ppszString_io != NULL) &&
		(*ppszString_io != NULL))
		{
		nextc = **ppszString_io;
		if (nextc == NUL)
		{
		nextc = EOF;
		break;
		}
		(*ppszString_io)++;
		}
	else
		break;
	}
	}
/*
 *  collect nonwhitespace chunk
 */
if (nextc != EOF)
	{
	while (!isascii(nextc) || !isspace(nextc))
	{
	p = (unsigned char *)addchar(nextc, (char *)p, (char **)&endbuf,
					 (char **)&mybuf, &mysize,
					 (char **)&pszBuffer);
	if (p == NULL)
		goto out_of_memory;
	if (infp != NULL)
		{
		nextc  = getc(infp);
		if (nextc == EOF)
		break;
		}
	else
		{
		if ((ppszString_io != NULL) &&
		(*ppszString_io != NULL))
		{
		nextc = **ppszString_io;
		if (nextc == NUL)
			{
			nextc = EOF;
			break;
			}
		(*ppszString_io)++;
		}
		else
		break;
		}
	}
	}
/*
 *  collect any trailing whitespace
 */
if (nextc != EOF)
	{
	while (isascii(nextc) && isspace(nextc))
	{
	p = (unsigned char *)addchar(nextc, (char *)p, (char **)&endbuf,
					 (char **)&mybuf, &mysize,
					 (char **)&pszBuffer);
	if (p == NULL)
		goto out_of_memory;
	if (infp != NULL)
		{
		nextc  = getc(infp);
		if (nextc == EOF)
		break;
		}
	else
		{
		if ((ppszString_io != NULL) &&
		(*ppszString_io != NULL))
		{
		nextc = **ppszString_io;
		if (nextc == NUL)
			{
			nextc = EOF;
			break;
			}
		(*ppszString_io)++;
		}
		else
		break;
		}
	}
	}
*p = NUL;
*pNextChar_out = nextc;
if (nextc != EOF)
	{
	if (infp != NULL)
	ungetc(nextc, infp);
	else
	(*ppszString_io)--;
	}
return pszBuffer;

out_of_memory:
if (pszBuffer != szChunkBuffer_m)
	freeMemory(pszBuffer);
return NULL;
}

/*****************************************************************************
 * NAME
 *    fill_format
 * DESCRIPTION
 *    Fill in the format field, adding as much to it as necessary.
 *    This has way too many goto statements for a purist, but what do you
 *    expect when implementing a Finite State Machine in software?
 * RETURN VALUE
 *    pointer to a chunk of text that contains an actual word
 */
static unsigned char * fill_format(pWord_out, pszChunk_in, pNextChar_io,
				   infp, ppszString_io, pTextCtl_in)
WordTemplate *		pWord_out;
unsigned char *		pszChunk_in;
int *			pNextChar_io;
FILE *			infp;
unsigned char **        ppszString_io;
const TextControl *	pTextCtl_in;
{
unsigned char *	pc;
char		buffer[BUFSIZE];
char *		p           = buffer;
char *		mybuf      = NULL;
unsigned	mysize = 0;
char *		endbuf     = buffer + BUFSIZE - 1;
unsigned char * pszChunk    = NULL;
char *		stdfmt;

memset(buffer, 0, BUFSIZE);
pWord_out->pszFormat = buffer;
for ( pc = pszChunk_in ; ; )
	{
	if ((pTextCtl_in->cFormatMark != NUL) && (*pc == pTextCtl_in->cFormatMark))
	{
	/*
	 *  collect the standard format marker itself
	 */
collect_marker:
	for (;;)
		{
		p = addchar(*pc, p, &endbuf, &mybuf, &mysize,
			&pWord_out->pszFormat);
		if (p == NULL)
		goto out_of_memory;
		++pc;
		if (*pc == NUL)
		break;
		if (    (isascii(*pc) && isspace(*pc)) ||
			(*pc == pTextCtl_in->cFormatMark) )
		break;
		}
	/*
	 *  check the std fmt marker against the wanted/unwanted lists
	 */
	stdfmt = strrchr(pWord_out->pszFormat, pTextCtl_in->cFormatMark);
	if (    (   (pTextCtl_in->pIncludeFields != NULL)              &&
			!isMemberOfStringList(pTextCtl_in->pIncludeFields,
					  stdfmt) )                       ||
		(   (pTextCtl_in->pExcludeFields != NULL)              &&
			isMemberOfStringList(pTextCtl_in->pExcludeFields,
					 stdfmt) ) )
		{
		/*
		 *  skip this field by reading until next std fmt marker
		 */
		for (;;)
		{
		if (*pc == NUL)
			{
			pszChunk = read_chunk(infp, ppszString_io, pNextChar_io);
			if (pszChunk == NULL)
			goto eof_format;
			pc = pszChunk;
			}
		if (*pc == pTextCtl_in->cFormatMark)
			goto collect_marker;

		p = addchar(*pc, p, &endbuf, &mybuf, &mysize,
				&pWord_out->pszFormat);
		if (p == NULL)
			goto out_of_memory;
		++pc;
		}
		}
	else
		{
		/*
		 *  this field is included, so handle the character that terminated
		 *  the marker
		 */
		if (*pc == NUL)
		{
		goto get_next_chunk;
		}
		else if (*pc == pTextCtl_in->cFormatMark)
		{
		goto collect_marker;
		}
		else
		{
		goto add_random_char;
		}
		}
	}
	else if ((pTextCtl_in->cBarMark != NUL) &&
		 (*pc == pTextCtl_in->cBarMark))
	{
	/*
	 *  add the "barchar" to the format field
	 */
	p = addchar(*pc, p, &endbuf, &mybuf, &mysize,
			&pWord_out->pszFormat);
	if (p == (char *)NULL)
		goto out_of_memory;
	if (	(pc[1] != NUL) &&
		(strchr((char *)pTextCtl_in->pszBarCodes, pc[1]) != NULL) )
		{
		/*
		 *  add the "barcode" to the format field
		 */
		++pc;
		p = addchar(*pc, p, &endbuf, &mybuf, &mysize,
			&pWord_out->pszFormat);
		if (p == (char *)NULL)
		goto out_of_memory;
		}
	}
	else if (matchAlphaChar(pc, pTextCtl_in))
	{
	/*
	 *  found the beginning of an actual word
	 */
	if (pc != pszChunk)
		pszChunk = (unsigned char *)duplicateString((char *)pc);
	if (pszChunk_in != szChunkBuffer_m)
		freeMemory(pszChunk_in);
	break;
	}
	else
	{
add_random_char:
	p = addchar(*pc, p, &endbuf, &mybuf, &mysize,
			&pWord_out->pszFormat);
	if (p == (char *)NULL)
		goto out_of_memory;
	}
	/*
	 *  advance the pointer, and handle hitting the end of a chunk
	 */
	++pc;
	if (*pc == NUL)
	{
get_next_chunk:
	pszChunk = read_chunk(infp, ppszString_io, pNextChar_io);
	if (pszChunk == NULL)
		goto eof_format;
	pc = pszChunk;
	}
	}
/*
 *  finish fixing standard format markers and leading punctuation
 */
eof_format:
if (pWord_out->pszFormat == buffer)
	pWord_out->pszFormat = duplicateString(buffer);	/* allocate space */
else
	pWord_out->pszFormat = fitAllocStringExactly(pWord_out->pszFormat);

return pszChunk;

out_of_memory:
if ((pWord_out->pszFormat != NULL) && (pWord_out->pszFormat != buffer))
	freeMemory(pWord_out->pszFormat);
pWord_out->pszFormat = NULL;
return NULL;
}

/*****************************************************************************
 * NAME
 *    find_word_in_non_alpha
 * DESCRIPTION
 *    Search the string (which is the "trailing nonalphabetic characters") for
 *    an embedded word.
 * RETURN VALUE
 *    pointer to dynamically allocated string containing the next word to
 *    return from read_chunk(), or NULL
 */
static unsigned char * find_word_in_nonalpha(pszNonAlpha_in, pTextCtl_in)
unsigned char *		pszNonAlpha_in;
const TextControl *	pTextCtl_in;
{
unsigned char *	pszNextWord = NULL;
unsigned char * pc;

if (pszNonAlpha_in == NULL)
	return pszNextWord;
for ( pc = pszNonAlpha_in ; *pc ; )
	{
	if (    (pTextCtl_in->cFormatMark != NUL) &&
		(*pc == pTextCtl_in->cFormatMark) )
	{
	pszNextWord = (unsigned char *)duplicateString((char *)pc);
	*pc = NUL;
	}
	else if ((pTextCtl_in->cBarMark != NUL) &&
		 (*pc == pTextCtl_in->cBarMark))
	{
	++pc;
	if (	(*pc != NUL) &&
		(strchr((char *)pTextCtl_in->pszBarCodes, *pc) != NULL) )
		{
		++pc;	/* swallow the "bar code" */
		}
	}
	else if (matchAlphaChar(pc, pTextCtl_in))
	{
	pszNextWord = (unsigned char *)duplicateString((char *)pc);
	*pc = NUL;
	}
	else
	{
	++pc;
	}
	}
return pszNextWord;
}

/***************************************************************************
 * NAME
 *    fill_template
 * ARGUMENTS
 *    infp - pointer to input FILE
 * DESCRIPTION
 *    Parse input text, filling this_word for each word and its context.
 * RETURN VALUE
 *    pointer to statically allocated word_template structure, or NULL if EOF
 */
static WordTemplate * fill_template(infp, ppszString_io, pTextCtl_in)
FILE *			infp;
unsigned char **        ppszString_io;
const TextControl *	pTextCtl_in;
{
int			nextc;
static WordTemplate	this_word;
int			iCharSize;
unsigned char *		pc;
unsigned char *		pszChunk;

this_word.pszFormat   = NULL;
this_word.pszNonAlpha = NULL;
this_word.iCapital    = NOCAP;
this_word.pszOrigWord = NULL;
this_word.paWord      = NULL;
/*
 *  fill the buffer with the next whitespace delimited chunk of text
 */
pszChunk = read_chunk(infp, ppszString_io, &nextc);
if ((pszChunk == NULL) || (*pszChunk == NUL))
	return NULL;
/*
 *  check for a leading format marker (or non word formation character)
 */
if (    (   (pTextCtl_in->cFormatMark != NUL) &&
		(pszChunk[0] == pTextCtl_in->cFormatMark) ) ||
	(   (pTextCtl_in->cBarMark != NUL) &&
		(pszChunk[0] == pTextCtl_in->cBarMark) ) ||
	((iCharSize = matchAlphaChar(pszChunk, pTextCtl_in)) == 0) )
	{
	/*
	 *  fill in the format field
	 */
	pszChunk = fill_format(&this_word, pszChunk, &nextc, infp, ppszString_io,
			   pTextCtl_in);
	if ((pszChunk == NULL) || (*pszChunk == NUL))
	return &this_word;
	iCharSize = matchAlphaChar(pszChunk, pTextCtl_in);
	}
/*
 *  skip over the word
 */
for (	pc = pszChunk ;
	iCharSize != 0 ;
	iCharSize = matchAlphaChar(pc, pTextCtl_in) )
	pc += iCharSize;
/*
 *  store the trailing nonalphabetic field (if any)
 */
if (*pc != NUL)
	{
	this_word.pszNonAlpha = duplicateString((char *)pc);
	*pc = NUL;
	}
/*
 *  store the original word (if any), and the decapitalized form(s) as well
 */
if (*pszChunk != NUL)
	{
	this_word.pszOrigWord = duplicateString((char *)pszChunk);
	this_word.iCapital    = decapitalizeWord(&this_word, pTextCtl_in);
	}
/*
 *  free the buffer if dynamically allocated
 */
if (pszChunk != szChunkBuffer_m)
	free(pszChunk);
/*
 *  check for another word hidden in the trailing nonalphabetic field
 *  (most likely after one or more dashes)
 */
pszNextWord_m = find_word_in_nonalpha((unsigned char *)this_word.pszNonAlpha,
					  pTextCtl_in);

return &this_word;
} /* end fill_template() */

/***************************************************************************
 * NAME
 *    readTemplateFromText
 * DESCRIPTION
 *    read a word of text into a word_template structure
 * RETURN VALUE
 *    pointer to dynamically allocated word_template structure, or NULL if EOF
 */
WordTemplate * readTemplateFromText(pInputFP_in, pTextCtl_in)
FILE *		pInputFP_in;
const TextControl *	pTextCtl_in;
{
WordTemplate *	wtp;
WordTemplate *	w;

if (pTextCtl_in == NULL)
	pTextCtl_in = &sDefaultTextControl_m;

wtp = fill_template(pInputFP_in, (unsigned char **)NULL, pTextCtl_in);
if (wtp != NULL)
	{
	w = (WordTemplate *)allocMemory( sizeof(WordTemplate) );
	if (w != NULL)
	{
	w->pszFormat   = wtp->pszFormat;
	w->pszNonAlpha = wtp->pszNonAlpha;
	w->iCapital    = wtp->iCapital;
	w->pszOrigWord = wtp->pszOrigWord;
	w->paWord      = wtp->paWord;
	}
	return( w );
	}
else
	return(NULL);
}

/***************************************************************************
 * NAME
 *    readTemplateFromTextString
 * DESCRIPTION
 *    read a word of text into a word_template structure
 * RETURN VALUE
 *    pointer to dynamically allocated word_template structure, or NULL if EOF
 */
WordTemplate * readTemplateFromTextString(ppszString_io, pTextCtl_in)
unsigned char **	ppszString_io;
const TextControl *	pTextCtl_in;
{
WordTemplate *	wtp;
WordTemplate *	w;

if (pTextCtl_in == NULL)
	pTextCtl_in = &sDefaultTextControl_m;

wtp = fill_template((FILE *)NULL, ppszString_io, pTextCtl_in);
if (wtp != NULL)
	{
	w = (WordTemplate *)allocMemory( sizeof(WordTemplate) );
	if (w != NULL)
	{
	w->pszFormat   = wtp->pszFormat;
	w->pszNonAlpha = wtp->pszNonAlpha;
	w->iCapital    = wtp->iCapital;
	w->pszOrigWord = wtp->pszOrigWord;
	w->paWord      = wtp->paWord;
	}
	return( w );
	}
else
	{
	return(NULL);
	}
}

/***************************************************************************
 *	EDIT HISTORY
 *	25-JUL-82	D. Weber/Bob Kasper
 *	13-MAR-85	hab/djw
 *	24-Sep-85	SRMc - port CQAP to Unix and MSDOS
 *	05-JUN-86	hab
 *	 2-May-88	SRMc - fflush(stdout) before writing to stderr
 *	25-May-88	SRMc - use change_list struct for ortho_chg, make
 *                              nonalph and word_init char pointers, not
 *				arrays
 *	27-May-88	SRMc - total rewrite of fill_template(), merging in
 *				functionality of do_word()
 *                           - replace set_caps() with decapital()
 *	28-May-88	SRMc - restore (a more flexible) handling of
 *				Manuscripter "bar codes"
 *      30-May-88       SRMc - check for NUL forminit
 *	 1-Jun-88	SRMc - rename norm_word to this_word, and add
 *				last_word and next_word
 *	 2-Jun-88	SRMc - remove new_word[256] field from template
 *				structure
 *	 8-Jun-88	SRMc - handle a single word read in output report
 *	28-Jul-88	SRMc - replace ssalloc() with malloc() and realloc()
 *	21-Oct-88	SRMc - remove register from function parameter
 *				declarations
 *			     - reorganize the file header comments
 *	10-Nov-88	SRMc - replace free() with myfree()
 *	 4-Jan-89	SRMc - fix for Microsoft C
 *	 7-Mar-89	SRMc - add monitoring of progress by printing a dot
 *				as each word is read
 *	18-Mar-89	SRMc - allow something like "word (word) word" or
 *				"word--word--word", i.e., punctuation without
 *				surrounding whitespace
 *	26-Jul-89	hab  - replace struct strlist in defs.h with
 *				STAMP's strlist.h
 *	27-Jul-89	hab  - add extern void myfree()
 *			       move monitoring of progress to anal.c
 *      28-Jul-89       hab  - allow for a \nocap option: do not do any
 *                              capitalization processing of input text
 *      01-Aug-89       ab/hab - Define myisspace(), myisdigit(), myispunct()
 *                               to handle 8-bit characters
 *      07-Aug-89       ab/hab - rename myrealloc() to myshrink()
 * 1.4v  8-Nov-89 ALB Prevent INPUT: xx words message if log to screen
 * 1.5k 10-Jan-90 ALB Fix bugs in handling bar codes at ends of words
 * 1.5m 10-Jan-90 ALB Add code to output bitmap for upper case letters
 * 1.5p 28-Feb-90 ALB Fix bug of not accepting 8-bit char at front of wrd
 * 1.5s 16-Mar-90 ALB Add \noincap to prevent internal recapitalization
 * 1.5v  6-Apr-90 ALB Fix bug of all 8-bit looking like wfc chars
 *                      Remove nonalpha, use alpha for everything
 * 1.6a 21-Jun-90 BK  Fix up for THINKC on MAC
 *	20-Dec-90	SRMc - replace zero() with bzero() or memset()
 *			     - use strchr() and strrchr() throughout
 *			     - replace streq() with strcmp()
 *	28-Dec-90	SRMc - revise to use word_template structure defined
 *				for STAMP
 *			     - renamed TXTIN() to txtin()
 *			     - fix for STAMP's apply_cc()
 *	31-Dec-90	SRMc - *correctly* fix for STAMP's apply_cc()
 *	 5-Jan-91	SRMc - adjust for revised memory allocation with
 *				accounting
 *	28-Jan-91	SRMc - allow multiple consecutive barcodes to follow
 *				a word, as well as to precede a word
 *	 5-Jan-91	SRMc - rename primary function to textin(), change it
 *				to return (struct word_template *) rather
 *				than int, and NOT to fill lookahead and
 *				lookbehind buffers
 *			     - merge in settxt.c, rename set_text() to
 *				static setup_textin(), incorporate
 *				load_intx_ctl_file() as interface for
 *				outside world
 ***************************************************************************
 **	EDIT HISTORY of SETTXT.C (merged in 5-Feb-91)
 **	25-May-88	Steve McConnel - replaces SALPHA.C, PRINOP.C, and
 **					  SETSTD.C
 **	27-May-88	SRMc - new version of TXTIN()
 **	30-May-88	SRMc - add handling of \format, \barchar, \barcodes,
 **				and \ambig fields
 **	 2-Jun-88	SRMc - move \dsc from acode_tab to text_codes
 **	28-Jul-88	SRMc - replace ssalloc() with malloc() and realloc()
 **	27-Aug-88	SRMc - add error checking and error messages
 **	14-Oct-88	SRMc - add \n after display of word-formation
 **				characters
 **	21-Oct-88	SRMc - reorganize the file header comments
 **	20-Jul-89	hab  - rename dict.h to ample.h
 **	26-Jul-89	hab  - rename load_scl to add_scl
 **                            replace struct strlist in defs.h with
 **                             STAMP's strlist.h
 **     27-Jul-89       hab  - add Copyright 1989
 **     28-Jul-89       hab  - allow for a \nocap option: do not do any
 **                             capitalization processing of input text
 **     01-Aug-89       ab/hab - Define myisspace(), myisdigit(), myispunct()
 **                              to handle 8-bit characters
 **1.4d 24-Oct-89 ALB Add mystrchr to fix 8-bit wfc bug (removed in 1.5v)
 **1.5s 16-Mar-90 ALB Add \noincap to prevent internal recapitalization
 **1.5v  6-Apr-90 ALB Fix bug of all 8-bit looking like wfc chars
 **                     Remove nonalpha, use alpha for everything
 **1.6e 02-Aug-90 hab Add lower-upper word formation character handling
 **	20-Dec-90	SRMc - replace zero() with bzero() or memset()
 **			     - declare set_text() as void
 **	27-Dec-90	SRMc - use parse_change() from STAMP's change.c
 ***************************************************************************
 *  2-Mar-91	SRMc - use old-style memory allocation (no accounting)
 * 11-Mar-91	SRMc - remove #define strchr -- it's in OPACLIB.H
 * 18-Sep-91	SRMc - use new struct text_control from textctl.h
 *		     - remove all external data references, including
 *			num_words
 * 23-Jan-92	SRMc - move edit history to end of the file
 *		     - replace skipwhite() with inline code
 *  3-Jun-92	SRMc - replace bzero() with memset()
 *		     - remove alpha, loweralpha, and upperalpha fields
 *			from the text_control struct
 *		     - use myisalpha() throughout
 *  4-Jun-92	SRMc - remove obsolete #if'ed sections
 *  5-Jun-92	SRMc - provide default text_control struct
 *		     - remove call to ufopen()
 *  8-Jun-92	SRMc - fix some infelicities in decapital()
 *  2-Jul-92	SRMc - handle buggy getc() macro for GNU C on SCO UNIX
 *		     - Require more than one alphabetic character in
 *			a word for it to be marked ALLCAP
 *  3-Sep-92	SRMc - Remove show_wfc() from setup_textin()
 *  5-Apr-93	SRMc - quit collecting non_alpha at '\n' character
 * 25-May-93	SRMc - allow myalloc() and friends to return NULL
 *		     - use mystrdup() where appropriate
 * 26-May-93	SRMc - split load_intx_ctl_file() into another file
 *		     - use member_strlist() instead of internal
 *			in_strlist()
 * 21-Oct-93	SRMc - check for excessive "format" matter in
 *			fill_template()
 * 14-Oct-96	SRMc - change #include "opaclib.h" to #include "myalloc.h"
 *		     - fix for renamed WordTemplate elements
 * 25-Nov-96	SRMc - adjust definition of "all caps" slightly to not include
 *			2-letter words that begin with a caseless (\wfc) letter
 * 27-Nov-96	SRMc - fix for possibly ambiguous decapitalization process
 *  4-Dec-96	SRMc - rename decapital() to decapitalizeWord(), and make it a
 *			global function
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 31-Jan-97	SRMc - fix for STDC_HEADERS
 * 24-Feb-97	SRMc - simplify decapitalizeWord()
 *  1-Apr-97	SRMc - fix bug with format marker immediately following a word
 * 17-Apr-97	SRMc - fix for inclusion in Windows DLL
 * 23-May-97	SRMc - renamed safe_exit() to exitSafely()
 *  2-Oct-97	SRMc - fix for revised reportError()
 * 10-Oct-97	SRMc - cosmetic changes and proofreading
 * 14-Jul-98	SRMc - fix for multibyte character handling by the TextControl
 *			data structure and related functions
 * 10-May-2000  hab  - add readTemplateFromTextString() and related mods to
 *                      have pertinent routines "read" string instead of file
 * 11-May-2000	SRMc - minor cleanup from Andy's changes
 */
