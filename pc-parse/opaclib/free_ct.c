/* FREE_CT.C - function to free a CodeTable structure
 ***************************************************************************
 *
 * void freeCodeTable(CodeTable * pTable_io);
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
#include "record.h"
#include "allocmem.h"

/***************************************************************************
 * NAME
 *    freeCodeTable
 * ARGUMENTS
 *    pTable_io - pointer to CodeTable data structure to deallocate
 * DESCRIPTION
 *    Release the space allocated to a CodeTable data structure.
 * RETURN VALUE
 *    none
 */
void freeCodeTable( pTable_io )
CodeTable *	pTable_io;
{
if ( pTable_io != NULL )
	{
	if (pTable_io->pCodeTable != NULL)
	freeMemory( pTable_io->pCodeTable );
	if (pTable_io->pszFirstCode != NULL)
	freeMemory( pTable_io->pszFirstCode );
	freeMemory( pTable_io );
	}
}
