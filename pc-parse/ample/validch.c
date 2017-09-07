/* VALIDCH.C - check string for valid characters (for AMPLE and STAMP)
 *****************************************************************************
 *
 * char * setAmpleValidCharacters(char * pszChars_in)
 *
 * void validateAmpleString(char *	 str,
 *			    char *	 where,
 *			    char *	 entry,
 *			    char *	 item,
 *			    const char * pszValidChars_in,
 *                          FILE *       pLogFP_in)
 *
 * char * getAmpleRecordIDTag(const char * pszRecKey_in, unsigned uiRecNum_in)
 *
 *****************************************************************************
 * Copyright 1988, 2000 by SIL International.  All rights reserved.
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
extern size_t strspn  P((const char *s, const char *accept));
#endif /* STDC_HEADERS */
#include "stample.h"
#include "allocmem.h"

/********************* LOCAL VARIABLES *********************/

static const char	szWhitespace_m[7] = " \t\n\r\f\v";

/***************************************************************************
 * NAME
 *    setAmpleValidCharacters
 * ARGUMENTS
 *    str - string of chars to use for string validation checks
 * DESCRIPTION
 *    make a copy of the specified string for use in validation later
 * RETURN VALUE
 *    none
 * Added BJY 1.9z
 */
char * setAmpleValidCharacters( pszChars_in )
char *	pszChars_in;
{
char *	p;

if (pszChars_in != NULL)
	{
	/*
	 *  jump to actual start of text
	 */
	p = pszChars_in + strspn(pszChars_in, szWhitespace_m);
	if (*p != NUL)
	return duplicateString( p );
	}
 return NULL;
}

/****************************************************************************
 * NAME
 *    validateAmpleString
 * ARGUMENTS
 *    str - string to check
 *    where - string like "string environment constraint"
 *    entry - name of dictionary entry, test or whatever
 *    item  - environment containing str or may be same as str for
 *              allomorph name checks, etc
 * DESCRIPTION
 *    check str for any characters not in the VC list and print error
 *      message if necessary
 * RETURN VALUE
 *    None
 *
 * Added BJY 1.9z
 */
void validateAmpleString(str, where, entry, item, pszValidChars_in, pLogFP_in)
const char *	str;
const char *	where;
const char *	entry;
const char *	item;
const char *	pszValidChars_in;
FILE *		pLogFP_in;
{
size_t index;
/*
 *  check whether \sec_check loaded from control file yet
 */
if ((pszValidChars_in == NULL) || (*pszValidChars_in == NUL))
	return;
/*
 *  check whether report really wanted
 */
if (pLogFP_in == NULL)
	return;
/*
 *  look for any invalid chars
 */
index = strspn( str, pszValidChars_in );
if (str[index] != NUL)
	{
	/* found an invalid char */
	fprintf(pLogFP_in,
		"STRING_CHECK: Invalid character \"%c\" in %s\n\t( %s )   %s\n",
		str[index], where, entry, item );
	}
}

/*************************************************************************
 * NAME
 *    getAmpleRecordIDTag
 * DESCRIPTION
 *    Return either record key as passed or if key is empty, return a
 *    string containing the record number
 *    (function added BJY 1.9t 4/24/95)
 * RETURN VALUE
 *    Pointer to record key or record number
 */
const char * getAmpleRecordIDTag(pszRecKey_in, uiRecNum_in)
const char *	pszRecKey_in;	/* pointer to key for current record */
unsigned	uiRecNum_in;
{
static char rec_read_buf[8];	/* must be static (accessed by caller) */

if ((pszRecKey_in != NULL) && (*pszRecKey_in != NUL))
	return( pszRecKey_in);
/*
 *  key empty, return record number
 */
sprintf( rec_read_buf, "%u", uiRecNum_in);
return( rec_read_buf);
}
