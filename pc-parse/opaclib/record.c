/* RECORD.C - read records in standard format database format
 ***************************************************************************
 *
 * char * readStdFormatRecord(FILE *            pInputFP_in,
 *			      const CodeTable * pCodeTable_in,
 *			      int               cComment_in,
 *			      unsigned *        puiRecordCount_io)
 * void cleanupAfterStdFormatRecord(void)
 *
 ***************************************************************************
 * edit history is at the end of record.h
 ***************************************************************************
 * Copyright 1988, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
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
#else
#ifndef HAVE_STRCHR
#define strchr  index
#define strrchr rindex
#endif
extern VOIDP  memcpy  P((VOIDP dest, const VOIDP src, size_t n));
extern VOIDP  memmove P((VOIDP dest, const VOIDP src, size_t n));
extern VOIDP  memset  P((VOIDP s, int c, size_t n));
extern int    strcmp  P((const char * s1, const char * s2));
extern int    strncmp P((const char * s1, const char * s2, size_t n));
extern char * strchr  P((const char * s, int c));
extern char * strrchr P((const char * s, int c));
extern size_t strspn  P((const char * s, const char * accept));
extern char * strpbrk P((const char * s, const char * accept));
extern char * strstr  P((const char * s1, const char * s2));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/

#include "allocmem.h"
#include "record.h"
/*
 *  macro for safely detecting ASCII whitespace characters
 */
#ifndef isascii
#define isascii(c) (!(c & ~0177))
#endif

#ifndef TRUE
#define TRUE 1
#endif
#ifndef FALSE
#define FALSE 0
#endif
#define NUL '\0'		/* terminates strings */

static char szWhiteSpace_m[7] = " \t\r\n\f\v";
/*
 *  globally accessible data
 */
char *		pRecordBuffer_g      = NULL;
unsigned	uiRecordBufferSize_g = 0;
char		szRecordKey_g[MAX_RECKEY_SIZE];	/* for error messages */

#ifdef RISC
static char *	pszRecordEnd_m   = NULL;
static char *	pszMarker_m      = NULL;
static size_t	uiMarkerSize_m   = 0;
static size_t	uiMarkerLength_m = 0;
/*
 *  macro for adding a character to the record buffer
 */
#define ADD_TO_RECORD(ch) { \
	if (p >= pszRecordEnd_m) \
	{ \
	uiRecordBufferSize_g += BUFSIZ; \
	pRecordBuffer_g = reallocMemory(pRecordBuffer_g, \
					uiRecordBufferSize_g+2); \
	pszRecordEnd_m = pRecordBuffer_g + uiRecordBufferSize_g; \
	p = pszRecordEnd_m - BUFSIZ; \
	} \
	*p++ = ch; }
#else
static size_t	uiRecordLength_m   = 0;
static char *	pszIOBuffer_m      = NULL;
static size_t	uiIOBufferSize_m   = 0;
static size_t	uiIOBufferLength_m = 0;
static char *	pszNextRecord_m    = NULL;
#endif /* RISC */

#ifdef applec
#pragma segment S_opaclib
#endif

/***************************************************************************
 * NAME
 *    readStdFormatRecord
 * ARGUMENTS
 *    pInputFP_in        - pointer to input FILE
 *    pCodeTable_in      - pointer to field code table
 *    cComment_in        - character for marking comments in the file
 *    puiRecordCount_io  - pointer to the number of records read, including
 *			   "do not load" ones
 * DESCRIPTION
 *    Read data until the beginning of the next record (or EOF).  Fill in the
 *    record buffer with data fixed for easier processing via switch statement
 * RETURN VALUE
 *    pointer to buffer containing record, or NULL for EOF
 */
char * readStdFormatRecord(pInputFP_in, pCodeTable_in, cComment_in,
			   puiRecordCount_io)
FILE *			pInputFP_in;
const CodeTable *	pCodeTable_in;
int			cComment_in;
unsigned *		puiRecordCount_io;
{
char *p, *q;
char *match, *subs;
int n;
int		cFlag;
int		bSkipThisRecord = 0;
const char *	pszRecordMarker;
char		szMarker[12];
#ifdef RISC
int		ch;
int		cPrevious;
int		skipping;
#else
char *		r;
size_t		length;
size_t		uiRecordMarkerLength;
size_t		length_code;
size_t		length_match;
int		eof_seen;
#endif /* RISC */

if (	(pInputFP_in == NULL) ||
	(pCodeTable_in == NULL) ||
	(pCodeTable_in->pCodeTable == NULL) ||
	(*pCodeTable_in->pCodeTable == NUL) )
	return NULL;
pszRecordMarker = pCodeTable_in->pszFirstCode;
/*
 *  if this is the initial call,
 *  1. allocate space for the buffers, leaving room for terminating NULs
 *  2. read the file until the first record marker
 */
if (ftell(pInputFP_in) == 0L)
	{
	if (pRecordBuffer_g == (char *)NULL)
	{					/* need 2 consecutive NULs */
	pRecordBuffer_g = allocMemory(BUFSIZ+2);
	uiRecordBufferSize_g = BUFSIZ+2;
	}
#ifdef RISC
	pszRecordEnd_m = pRecordBuffer_g + uiRecordBufferSize_g;
	if (pszMarker_m == (char *)NULL)
	{
	pszMarker_m = allocMemory(17);
	uiMarkerSize_m = 16;
	}
	uiMarkerLength_m = 0;
#else
	uiRecordLength_m = 0;
	if (pszIOBuffer_m == (char *)NULL)
	{
	pszIOBuffer_m = allocMemory(BUFSIZ+1);
	uiIOBufferSize_m = BUFSIZ;
	}
	uiIOBufferLength_m = 0;
#endif /* RISC */
	if ((pszRecordMarker == NULL) || (pszRecordMarker[0] == NUL))
	{
	szMarker[0] = *pCodeTable_in->pCodeTable;
	szMarker[1] = NUL;
	pszRecordMarker = szMarker;
	}
#ifdef RISC
	cFlag = pszRecordMarker[0];
	for ( cPrevious = '\n' ;; cPrevious = ch )
	{
	ch = getc(pInputFP_in);
	if (ch == EOF)
		return NULL;	/* EOF or I/O error before first record */
	if ((ch == cFlag) && (cPrevious == '\n'))
		{
		do  {
		if (uiMarkerLength_m >= uiMarkerSize_m)
			{
			uiMarkerSize_m += BUFSIZ;
			pszMarker_m = reallocMemory(pszMarker_m, uiMarkerSize_m+1);
			}
		pszMarker_m[uiMarkerLength_m++] = ch;
		ch = getc(pInputFP_in);
		} while ((ch != EOF) && !(isascii(ch) && isspace(ch)));
		pszMarker_m[uiMarkerLength_m] = NUL;
		if (    (pszRecordMarker[1] == NUL) ||
			(strcmp(pszMarker_m, pszRecordMarker) == 0) )
		{
		if (ch != EOF)
			ungetc(ch, pInputFP_in);
		goto first_record_found;
		}
		uiMarkerLength_m = 0;
		}
	}
#else
	uiRecordMarkerLength = strlen(pszRecordMarker);
	for (;;)
	{
	length = fread(pszIOBuffer_m + uiIOBufferLength_m,
			   (size_t)1,
			   (size_t)BUFSIZ,
			   pInputFP_in);
	if (length == 0)
		{
		uiIOBufferLength_m = 0;
		pszNextRecord_m    = NULL;
		return NULL;			/* EOF or I/O error */
		}
	uiIOBufferLength_m += length;
	pszIOBuffer_m[uiIOBufferLength_m] = NUL;
	p = pszIOBuffer_m;
	while ((p = strstr(p, pszRecordMarker)) != NULL)
		{
		if (    ((p == pszIOBuffer_m) || (*(p-1) == '\n')) &&
			(   (uiRecordMarkerLength == 1) ||
			(p[uiRecordMarkerLength] == NUL) ||
			(	isascii(p[uiRecordMarkerLength]) &&
				isspace(p[uiRecordMarkerLength]))) )
		break;
		p += uiRecordMarkerLength;	/* move past this false alarm */
		}
	if (p != NULL)
		{			/* point to the first record in the file */
		pszNextRecord_m = p;
		goto first_record_found;	/* we've found the first record! */
		}
	/*
	 *  save the last partial line from pszIOBuffer_m, add another I/O
	 *  block to it
	 */
	p = strrchr(pszIOBuffer_m, '\n');
	if (p != NULL)
		{
		uiIOBufferLength_m = strlen(p+1);
		memmove(pszIOBuffer_m, p+1, uiIOBufferLength_m);
		pszIOBuffer_m[uiIOBufferLength_m] = NUL;
		}
	uiIOBufferSize_m = uiIOBufferLength_m + BUFSIZ;
	pszIOBuffer_m = reallocMemory(pszIOBuffer_m, uiIOBufferSize_m+1);
	}
#endif /* RISC */
first_record_found:
	pszRecordMarker = pCodeTable_in->pszFirstCode;
	}

memset(szRecordKey_g, NUL, MAX_RECKEY_SIZE);	/* clear record key */
/*
 *  check whether we've already encountered the EOF
 */
#ifdef RISC
if (uiMarkerLength_m == 0)
#else
if (pszNextRecord_m == (char *)NULL)
#endif
	return(NULL);		/* EOF already encountered */
/*
 *  initialize some variables
 */
if (pszRecordMarker == NULL)
	{
	szMarker[0] = pCodeTable_in->pCodeTable[0];
	strcpy(&szMarker[1], "EOFEOFEOF");
	pszRecordMarker = szMarker;
	}
cFlag = pszRecordMarker[0];
#ifdef RISC
p = pRecordBuffer_g;
#else
uiRecordMarkerLength = strlen(pszRecordMarker);
eof_seen = FALSE;
#endif /* RISC */
/*
 *  collect the next record into the buffer
 */
#ifdef RISC
do  {
	/*
	 *  replace this field code with its one character substitution
	 */
	for (   match = pCodeTable_in->pCodeTable, n = pCodeTable_in->uiCodeCount ;
		n ;
		--n )
	{
	subs = match + strlen(match) + 1;
	if (strcmp(pszMarker_m, match) == 0)
		{
		/*
		 *  fix for switch (*p) after readStdFormatRecord()
		 */
		ADD_TO_RECORD(*subs);
		if (*subs == '!')
		bSkipThisRecord = 1;
		break;
		}
	match = subs + strlen(subs) + 1;
	}
	/*
	 *  if the code was found, its first character has been replaced by
	 *    the desired substitution, and the rest of the code ignored
	 *  if the code was not found, skip over this field
	 */
	skipping = (n == 0);
	uiMarkerLength_m = 0;
	/*
	 *  gather the rest of this field
	 */
	for ( cPrevious = NUL ;; cPrevious = ch )
	{
	ch = getc(pInputFP_in);
	if (ch == EOF)
		break;		/* EOF or I/O error before next field */
	if ((ch == cFlag) && (cPrevious == '\n'))
		break;
	if (skipping)
		continue;
	if (ch == cComment_in)
		{
		while ((ch != EOF) && (ch != '\n'))
		ch = getc(pInputFP_in);
		}
	if (cPrevious == '\n')
		ADD_TO_RECORD(cPrevious);
	if ((ch != EOF) && (ch != '\n'))
		ADD_TO_RECORD(ch);
	}
	if (!skipping)
	ADD_TO_RECORD(NUL);
	if (ch == EOF)
	break;		/* EOF or I/O error before next field */
	/*
	 *  collect the next field code marker
	 */
	do  {
	if (uiMarkerLength_m >= uiMarkerSize_m)
		{
		uiMarkerSize_m += BUFSIZ;
		pszMarker_m = reallocMemory(pszMarker_m, uiMarkerSize_m+1);
		}
	pszMarker_m[uiMarkerLength_m++] = ch;
	ch = getc(pInputFP_in);
	} while ((ch != EOF) && !(isascii(ch) && isspace(ch)));
	pszMarker_m[uiMarkerLength_m] = NUL;
	if (ch != EOF)
	ungetc(ch, pInputFP_in);
	/*
	 *  repeat until the next record marker field code is found
	 */
	} while (strcmp(pszMarker_m, pszRecordMarker) != 0);

#else /* RISC */

for ( uiRecordLength_m = 0 ;;)
	{
	p = pszNextRecord_m;
	while ((p = strstr(p+1, pszRecordMarker)) != NULL)
	{
	if (	(*(p-1) == '\n') &&
		(isascii(p[uiRecordMarkerLength]) && isspace(p[uiRecordMarkerLength])) )
		break;
	}
	if (p != NULL)
	{
	uiRecordLength_m = p - pszNextRecord_m;
	break;
	}
	/*
	 *  need to get more information from the file
	 */
	if (pszNextRecord_m != pszIOBuffer_m)
	{
	uiIOBufferLength_m -= pszNextRecord_m - pszIOBuffer_m;
	memmove(pszIOBuffer_m, pszNextRecord_m, uiIOBufferLength_m);
	pszIOBuffer_m[uiIOBufferLength_m] = NUL;
	pszNextRecord_m = pszIOBuffer_m;
	}
	if (uiIOBufferSize_m < uiIOBufferLength_m + BUFSIZ)
	{
	uiIOBufferSize_m = uiIOBufferLength_m + BUFSIZ;
	pszIOBuffer_m = reallocMemory(pszIOBuffer_m, uiIOBufferSize_m+1);
	pszNextRecord_m = pszIOBuffer_m;
	}
	length = fread(pszIOBuffer_m+uiIOBufferLength_m, (size_t)1, (size_t)BUFSIZ,
		   pInputFP_in);
	if (length == 0)
	{
	uiRecordLength_m = uiIOBufferLength_m;
	eof_seen = TRUE;
	break;			/* EOF or I/O error */
	}
	uiIOBufferLength_m += length;
	pszIOBuffer_m[uiIOBufferLength_m] = NUL;
	}
if (uiRecordLength_m == 0)
	{
	pszNextRecord_m = NULL;
	return(NULL);
	}
if (uiRecordLength_m >= uiRecordBufferSize_g-1)
	{
	pRecordBuffer_g = reallocMemory(pRecordBuffer_g,
					uiRecordLength_m + 2);
	uiRecordBufferSize_g = uiRecordLength_m + 2;
	}
for (	p = pRecordBuffer_g, q = pszNextRecord_m, length = 0 ;
	q < pszNextRecord_m + uiRecordLength_m ;
	++length )
	{
	if (*q == cComment_in)
	{
	q = strchr(q, '\n');
	if (q == NULL)
		break;
	}
	if ((*q == cFlag) && ((q == pszNextRecord_m) || (*(q-1) == '\n')))
	{
	if ((p != pRecordBuffer_g) && (*(p-1) == '\n'))
		*(p-1) = NUL;		/* terminate previous field */
	/*
	 *  get the length of the code
	 */
	for ( r = q ; (*r != NUL) && !(isascii(*r) && isspace(*r)) ; ++r )
		;
	length_code = r - q;
	/*
	 *  look up the code in pCodeTable_in
	 */
	for (	match = pCodeTable_in->pCodeTable,
			n = pCodeTable_in->uiCodeCount ;
		n ;
		--n )
		{
		length_match = strlen(match);
		subs = match + length_match + 1;
		if (    (length_code == length_match) &&
			(strncmp(match, q, length_code) == 0) )
		{
		/*
		 *  fix for switch (*p) after readStdFormatRecord()
		 */
		*p++ = *subs;
		q += length_code;
		if (*subs == '!')
			bSkipThisRecord = 1;
		break;
		}
		match = subs + strlen(subs) + 1;
		}
	/*
	 *  if the code was found, its first character has been replaced by
	 *    the desired substitution, and the rest of the it with spaces
	 *  if the code was not found, skip over this field
	 */
	if (n == 0)
		{		/* code not found -- skip this field */
		for (;;)
		{
		q = strchr(q, '\n');
		if (q == NULL)
			break;
		if (*(++q) == cFlag)
			break;
		}
		if (q == NULL)
		break;		/* no more fields in this record */
		continue;
		}
	}
	*p++ = *q++;
	}
#endif /* RISC */
*p++ = NUL;
#ifndef RISC
*p++ = NUL;
if (eof_seen)
	pszNextRecord_m = NULL;
else
	pszNextRecord_m += uiRecordLength_m;
#endif /* RISC */

if (puiRecordCount_io != NULL)
	++(*puiRecordCount_io);
/*
 *  store the record key
 */
p = strpbrk(pRecordBuffer_g, szWhiteSpace_m);
if (p != NULL)
	{
	p += strspn(p, szWhiteSpace_m);
	q = strpbrk(p, szWhiteSpace_m);
	if (q == NULL)
	q = p + strlen(p);
	memcpy(szRecordKey_g, p, (q-p < MAX_RECKEY_SIZE)? q-p : MAX_RECKEY_SIZE-1);
	}
if (bSkipThisRecord)
	{					/* make this an empty record */
	memset(pRecordBuffer_g, NUL, uiRecordBufferSize_g);
	}
return(pRecordBuffer_g);
}

/***************************************************************************
 * NAME
 *    cleanupAfterStdFormatRecord
 * ARGUMENTS
 *    none
 * DESCRIPTION
 *    Give back space allocated for readStdFormatRecord().
 * RETURN VALUE
 *    none
 */
void cleanupAfterStdFormatRecord()
{
if (pRecordBuffer_g != (char *)NULL)
	freeMemory(pRecordBuffer_g);
pRecordBuffer_g = (char *)NULL;
uiRecordBufferSize_g = 0;

#ifdef RISC
if (pszMarker_m != (char *)NULL)
	freeMemory(pszMarker_m);
pszMarker_m      = (char *)NULL;
pszRecordEnd_m   = (char *)NULL;
uiMarkerSize_m   = 0;
uiMarkerLength_m = 0;
#else
if (pszIOBuffer_m != (char *)NULL)
	freeMemory(pszIOBuffer_m);
pszIOBuffer_m      = (char *)NULL;
uiIOBufferSize_m   = 0;
uiIOBufferLength_m = 0;
uiRecordLength_m   = 0;
pszNextRecord_m    = (char *)NULL;
#endif /* RISC */
}
