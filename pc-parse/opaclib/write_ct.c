/* WRITE_CT.C - function to write a CodeTable structure to a file
 ***************************************************************************
 *
 * void writeCodeTable(FILE *      pLogFP_in,
 *		       CodeTable * pTable_in);
 *
 ***************************************************************************
 * Edit history is at the end of record.h
 ***************************************************************************
 * Copyright 1997 by the Summer Institute of Linguistics, Inc.
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
extern size_t strlen  P((const char * s));
#endif
#include "record.h"

/*****************************************************************************
 * NAME
 *    writeCodeTable
 * DESCRIPTION
 *    display the content of a CodeTable for debugging
 * RETURN VALUE
 *    none
 */
void writeCodeTable(pLogFP_in, pTable_in)
FILE *			pLogFP_in;
const CodeTable *	pTable_in;
{
unsigned	i;
char *		p;

if (pLogFP_in == NULL)
	return;

if (pTable_in == NULL)
	{
	fprintf(pLogFP_in,
		"DEBUG: tab->size = 0, ->first = NULL, ->table = NULL\n");
	return;
	}
fprintf(pLogFP_in,
	"DEBUG: tab->size = %d, ->first = \"%s\",\n\t->table = ",
	pTable_in->uiCodeCount, pTable_in->pszFirstCode);
for ( p = pTable_in->pCodeTable, i = 0 ; i < pTable_in->uiCodeCount ; ++i )
	{
	fprintf(pLogFP_in, "|%s|", p);
	p += strlen(p) + 1;
	fprintf(pLogFP_in, "%s|", p);
	p += strlen(p) + 1;
	}
fprintf(pLogFP_in, "\n");
}
