/* WORDANAL.C - functions dealing with lists of WordAnalysis data structures
 *****************************************************************************
 *
 * void writeWordAnalysisList(const WordAnalysis * pAnalyses_in,
 *			      FILE *               pOutputFP_in)
 *
 * void freeWordAnalysisList(WordAnalysis * pAnalyses_io)
 *
 *****************************************************************************
 * Copyright 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include "template.h"
#include "allocmem.h"
#ifndef NULL
#define NULL (void *)0
#endif

/*****************************************************************************
 * NAME
 *    writeWordAnalysisList
 * DESCRIPTION
 *    write a list of WordAnalysis data structures to an output file for
 *    debugging purposes
 * RETURN VALUE
 *    none
 */
void writeWordAnalysisList(pAnalyses_in, pOutputFP_in)
const WordAnalysis *	pAnalyses_in;
FILE *			pOutputFP_in;
{
const WordAnalysis *	pAnal;

fprintf(pOutputFP_in, "\nWordAnalysis list:\n");
for ( pAnal = pAnalyses_in ; pAnal ; pAnal = pAnal->pNext )
	{
	fprintf(pOutputFP_in, "=====================================\n");
	fprintf(pOutputFP_in, "pszAnalysis = \"%s\"\n",
		pAnal->pszAnalysis ? pAnal->pszAnalysis : "{NULL}");
	fprintf(pOutputFP_in, "pszDecomposition = \"%s\"\n",
		pAnal->pszDecomposition ? pAnal->pszDecomposition : "{NULL}");
	fprintf(pOutputFP_in, "pszCategory = \"%s\"\n",
		pAnal->pszCategory ? pAnal->pszCategory : "{NULL}");
	fprintf(pOutputFP_in, "pszProperties = \"%s\"\n",
		pAnal->pszProperties ? pAnal->pszProperties : "{NULL}");
	fprintf(pOutputFP_in, "pszFeatures = \"%s\"\n",
		pAnal->pszFeatures ? pAnal->pszFeatures : "{NULL}");
	fprintf(pOutputFP_in, "pszUnderlyingForm = \"%s\"\n",
		pAnal->pszUnderlyingForm ? pAnal->pszUnderlyingForm : "{NULL}");
	fprintf(pOutputFP_in, "pszSurfaceForm = \"%s\"\n",
		pAnal->pszSurfaceForm ? pAnal->pszSurfaceForm : "{NULL}");
	}
fprintf(pOutputFP_in, "=====================================\n");
}

/*****************************************************************************
 * NAME
 *    freeWordAnalysisList
 * DESCRIPTION
 *    free the memory allocated for a list of WordAnalysis data structures
 * RETURN VALUE
 *    none
 */
void freeWordAnalysisList(pAnalyses_io)
WordAnalysis *	pAnalyses_io;
{
WordAnalysis *	pAnal;
WordAnalysis *	pNextAnal;

for ( pAnal = pAnalyses_io ; pAnal ; pAnal = pNextAnal )
	{
	pNextAnal = pAnal->pNext;
	if (pAnal->pszAnalysis != NULL)
	freeMemory( pAnal->pszAnalysis );
	if (pAnal->pszDecomposition != NULL)
	freeMemory( pAnal->pszDecomposition );
	if (pAnal->pszCategory != NULL)
	freeMemory( pAnal->pszCategory );
	if (pAnal->pszProperties != NULL)
	freeMemory( pAnal->pszProperties );
	if (pAnal->pszFeatures != NULL)
	freeMemory( pAnal->pszFeatures );
	if (pAnal->pszUnderlyingForm != NULL)
	freeMemory( pAnal->pszUnderlyingForm );
	if (pAnal->pszSurfaceForm != NULL)
	freeMemory( pAnal->pszSurfaceForm );
	freeMemory( pAnal );
	}
}
