/* dynstr.C - appending to a dynamic string
 ***************************************************************************
 *
 * char * appendDynamicString(pszString_io, puiStringSize_io, pszAdded_in)
 * char *       pszString_io;
 * size_t *     puiStringSize_io;
 * const char * pszAdded_in;
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1998, 2000 by SIL International.  All rights reserved.
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
extern char * strcpy  P((char * s1, const char * s2));
extern size_t strlen  P((const char * s));
#endif /*STDC_HEADERS*/
#include "allocmem.h"
#ifndef NULL
#define NULL 0
#endif

/*****************************************************************************
 * NAME
 *    appendDynamicString
 * DESCRIPTION
 *    add a string to the end of a dynamically allocated string
 * RETURN VALUE
 *    pointer to the (possibly reallocated) dynamic string
 */
char * appendDynamicString(pszString_io, puiStringSize_io, pszAdded_in)
char *       pszString_io;
size_t *     puiStringSize_io;
const char * pszAdded_in;
{
size_t	uiUsed;
size_t	uiNeeded;

if (	(pszString_io     == NULL) ||
	(puiStringSize_io == NULL) ||
	(pszAdded_in      == NULL) ||
	(*pszAdded_in     == '\0') )
	return pszString_io;

uiUsed   = strlen(pszString_io);
uiNeeded = uiUsed + strlen(pszAdded_in);
if (uiNeeded >= *puiStringSize_io)
	{
	*puiStringSize_io = uiNeeded + 64;		/* allow for growth */
	pszString_io = reallocMemory(pszString_io, *puiStringSize_io);
	}
strcpy(pszString_io + uiUsed, pszAdded_in);
return pszString_io;
}

/*****************************************************************************
 * EDIT HISTORY
 * 24-Oct-1998	SRMc - original creation
 */
