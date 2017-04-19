/* DYNSTR.C - functions for dealing with dynamic strings
 ******************************************************************************
 *
 * int appendToDynString(DynString * pdstr, const char * prgch, size_t cch)
 * int appendCharToDynString(DynString * pdstr, int ch)
 * void resetDynString(DynString * pdstr)
 *
 ******************************************************************************
 * Copyright 2000 by SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
extern VOIDP  memcpy  P((VOIDP d, const VOIDP s, size_t n));
#endif /* STDC_HEADERS */
#include "allocmem.h"
#include "dynstr.h"

#ifndef NULL
#define NULL 0
#endif
#ifndef TRUE
#define TRUE 1
#endif
#ifndef FALSE
#define FALSE 0
#endif

/******************************************************************************
 * NAME
 *    assignToDynString
 * DESCRIPTION
 *    Assign a range (array) of characters to the dynamic string.
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurred
 */
int assignToDynString(pdstr, prgch, cch)
DynString * pdstr;
const char * prgch;
size_t cch;
{
size_t cbNewAlloc;

if (pdstr == NULL)
	return -1;
if ((prgch == NULL) || (cch == 0))
	{
	eraseDynString(pdstr);
	return 0;
	}
if (pdstr->pszBuffer == NULL)
	{
	if (cch > 4000)
	{
	cbNewAlloc = 2 * cch;
	cbNewAlloc = 2 * cch;
	if (cch > cbNewAlloc)
		{
		pdstr->bError = TRUE;
		return -1;		/* shouldn't happen, realistically! */
		}
	}
	else
	{
	cbNewAlloc = 4080;
	}
	pdstr->pszBuffer = allocMemory(cbNewAlloc);
	if (pdstr->pszBuffer == NULL)
	{
	pdstr->bError = TRUE;
	return -1;
	}
	pdstr->cbAlloc = cbNewAlloc;
	}
else if (cch >= pdstr->cbAlloc)
	{
	char * pszNewAlloc;
	cbNewAlloc = 2 * pdstr->cbAlloc;
	if (cch > cbNewAlloc)
	cbNewAlloc += cch;
	if (cch > cbNewAlloc)
	{
	pdstr->bError = TRUE;
	return -1;		/* shouldn't happen, realistically! */
	}
	pszNewAlloc = reallocMemory(pdstr->pszBuffer, cbNewAlloc);
	if (pszNewAlloc == NULL)
	{
	pdstr->bError = TRUE;
	return -1;
	}
	pdstr->pszBuffer = pszNewAlloc;
	pdstr->cbAlloc = cbNewAlloc;
	}
memcpy(pdstr->pszBuffer, prgch, cch);
pdstr->cbLen = cch;
pdstr->pszBuffer[pdstr->cbLen] = '\0';
return 0;
}

/******************************************************************************
 * NAME
 *    appendToDynString
 * DESCRIPTION
 *    Append a range (array) of characters to the end of the dynamic string.
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurred
 */
int appendToDynString(pdstr, prgch, cch)
DynString * pdstr;
const char * prgch;
size_t cch;
{
size_t cbNewAlloc;

if (pdstr == NULL)
	return -1;
if (pdstr->bError)
	return -1;		/* don't waste time after first memory alloc failure */
if ((prgch == NULL) || (cch == 0))
	return 0;
if (pdstr->pszBuffer == NULL)
	{
	if (cch > 4000)
	cbNewAlloc = 2 * cch;
	else
	cbNewAlloc = 4080;
	pdstr->pszBuffer = allocMemory(cbNewAlloc);
	if (pdstr->pszBuffer == NULL)
	{
	pdstr->bError = TRUE;
	return -1;
	}
	pdstr->cbAlloc = cbNewAlloc;
	pdstr->cbLen = 0;
	}
else if (pdstr->cbLen + cch >= pdstr->cbAlloc)
	{
	char * pszNewAlloc;
	cbNewAlloc = 2 * pdstr->cbAlloc;
	if (cch > (cbNewAlloc - pdstr->cbLen))
	cbNewAlloc += cch;
	if (cch > (cbNewAlloc - pdstr->cbLen))
	{
	pdstr->bError = TRUE;
	return -1;		/* shouldn't happen, realistically! */
	}
	pszNewAlloc = reallocMemory(pdstr->pszBuffer, cbNewAlloc);
	if (pszNewAlloc == NULL)
	{
	pdstr->bError = TRUE;
	return -1;
	}
	pdstr->pszBuffer = pszNewAlloc;
	pdstr->cbAlloc = cbNewAlloc;
	}
memcpy(pdstr->pszBuffer + pdstr->cbLen, prgch, cch);
pdstr->cbLen += cch;
pdstr->pszBuffer[pdstr->cbLen] = '\0';
return 0;
}

/*****************************************************************************
 * NAME
 *    appendCharToDynString
 * DESCRIPTION
 *    Append a single character to the end of the dynamic string.
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurred
 */
int appendCharToDynString(pdstr, ch)
DynString * pdstr;
int ch;
{
size_t cbNewAlloc;

if ((pdstr == NULL) || (ch == 0))
	return -1;
if (pdstr->bError)
	return -1;		/* don't waste time after first memory alloc failure */
if (pdstr->pszBuffer == NULL)
	{
	cbNewAlloc = 4080;
	pdstr->pszBuffer = allocMemory(cbNewAlloc);
	if (pdstr->pszBuffer == NULL)
	{
	pdstr->bError = TRUE;
	return -1;
	}
	pdstr->cbAlloc = cbNewAlloc;
	pdstr->cbLen = 0;
	}
else if (pdstr->cbLen + 1 >= pdstr->cbAlloc)
	{
	char * pszNewAlloc;
	cbNewAlloc = 2 * pdstr->cbAlloc;
	pszNewAlloc = reallocMemory(pdstr->pszBuffer, cbNewAlloc);
	if (pszNewAlloc == NULL)
	{
	pdstr->bError = TRUE;
	return -1;
	}
	pdstr->pszBuffer = pszNewAlloc;
	pdstr->cbAlloc = cbNewAlloc;
	}
pdstr->pszBuffer[pdstr->cbLen] = ch;
++pdstr->cbLen;
pdstr->pszBuffer[pdstr->cbLen] = '\0';
return 0;
}

/*****************************************************************************
 * NAME
 *    initDynString
 * DESCRIPTION
 *    Initialize the DynString to allocate cch bytes for the buffer, and set
 *    the stored string to empty.
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurred
 */
int initDynString(pdstr, cch)
DynString * pdstr;
size_t cch;
{
if (pdstr == NULL)
	return -1;
if (pdstr->pszBuffer)
	{
	if (cch == 0)
	{
	freeMemory(pdstr->pszBuffer);
	pdstr->pszBuffer = NULL;
	}
	else
	{
	if (pdstr->cbAlloc != cch)
		{
		char * psz = reallocMemory(pdstr->pszBuffer, cch);
		if (psz == NULL)
		{
		pdstr->bError = TRUE;
		return -1;
		}
		pdstr->pszBuffer = psz;
		}
	pdstr->pszBuffer[0] = '\0';
	}
	}
else if (cch != 0)
	{
	char * psz = allocMemory(cch);
	if (psz == NULL)
		{
		pdstr->bError = TRUE;
		return -1;
		}
	pdstr->pszBuffer = psz;
	pdstr->pszBuffer[0] = '\0';
	}
pdstr->bError = FALSE;
pdstr->cbAlloc = cch;
pdstr->cbLen = 0;
return 0;
}

/*****************************************************************************
 * NAME
 *    resetDynString
 * DESCRIPTION
 *    Free any buffer allocated by a DynString, and reset it to its initial
 *    state.
 * RETURN VALUE
 *    none
 */
void resetDynString(pdstr)
DynString * pdstr;
{
if (pdstr == NULL)
	return;
if (pdstr->pszBuffer)
	freeMemory(pdstr->pszBuffer);
pdstr->pszBuffer = NULL;
pdstr->cbLen = 0;
pdstr->cbAlloc = 0;
pdstr->bError = FALSE;
}

/*****************************************************************************
 * NAME
 *    eraseDynString
 * DESCRIPTION
 *    Set the string stored by a DynString to zero length, and reset the error
 *    flag.
 * RETURN VALUE
 *    none
 */
void eraseDynString(pdstr)
DynString * pdstr;
{
if (pdstr == NULL)
	return;
if (pdstr->pszBuffer)
	pdstr->pszBuffer[0] = '\0';
else
	pdstr->cbAlloc = 0;
pdstr->cbLen = 0;
pdstr->bError = FALSE;
}
