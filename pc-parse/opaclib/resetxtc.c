/* RESETXTC.C - reset the text control file information for textin()/textout()
 *****************************************************************************
 *
 * void resetTextControl(TextControl * pTextCtl_io)
 *
 ***************************************************************************
 * edit history is at the end of the file
 *****************************************************************************
 * Copyright 1996, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include "allocmem.h"
#include "textctl.h"

#ifndef NULL
#define NULL (VOIDP)0
#endif

#ifndef TRUE
#define TRUE 1
#define FALSE 0
#endif

/*****************************************************************************
 * NAME
 *    resetTextControl
 * DESCRIPTION
 *    erase any memory allocated by load{Intx|Outx}CtlFile()
 * RETURN VALUE
 *    none
 */
void resetTextControl(pTextCtl_io)
TextControl *	pTextCtl_io;
{
/*
 *  free any memory that has been allocated
 */
if (pTextCtl_io->pszTextControlFile != NULL)
	freeMemory(pTextCtl_io->pszTextControlFile);
if (pTextCtl_io->pOrthoChanges != NULL)
	freeChangeList( pTextCtl_io->pOrthoChanges );
if (pTextCtl_io->pOutputChanges != NULL)
	freeChangeList( pTextCtl_io->pOutputChanges );
freeStringList( pTextCtl_io->pIncludeFields );
freeStringList( pTextCtl_io->pExcludeFields );
if (pTextCtl_io->pszBarCodes != NULL)
	freeMemory( pTextCtl_io->pszBarCodes );

resetWordFormationChars(pTextCtl_io);
/*
 *  set the default values
 */
pTextCtl_io->pszTextControlFile    = NULL;
pTextCtl_io->pOrthoChanges         = NULL;
pTextCtl_io->pOutputChanges        = NULL;
pTextCtl_io->pIncludeFields        = NULL;
pTextCtl_io->pExcludeFields        = NULL;
pTextCtl_io->cFormatMark           = '\\';
pTextCtl_io->cAnaAmbig             = '%';
pTextCtl_io->cTextAmbig            = '%';
pTextCtl_io->cDecomp               = '-';
pTextCtl_io->cBarMark              = '|';
pTextCtl_io->pszBarCodes           = NULL;
pTextCtl_io->bIndividualCapitalize = TRUE;
pTextCtl_io->bCapitalize           = TRUE;
pTextCtl_io->uiMaxAmbigDecap       = 500;
}

/***************************************************************************
 * EDIT HISTORY
 *  X-Xxx-96	Steve McConnel - created
 * 30-Jan-97	SRMc - remove #include <string.h>
 */
