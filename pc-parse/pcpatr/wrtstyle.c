/* WRTSTYLE.C - write PC-PATR parse results to a file in a stylized fashion
 ***************************************************************************
 *
 * void writePATRStyledOutput(PATREdgeList *    pParses_in,
 *			      char *	        pszWord_in,
 *			      char *	        pszLex_in,
 *			      char *	        pszGloss_in,
 *			      FILE *            pOutputFP_in,
 *			      PATRFeatureTags * pFeatTags_in,
 *			      char *	        pszParseStartTag_in,
 *			      char *	        pszParseEndTag_in,
 *			      PATRData *	pPATR_in,
 *			      unsigned *	puiAmbigCount_io)
 *
 ************************************************************************
 * Copyright 1997, 2000 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"

/*****************************************************************************
 * NAME
 *    writePATRStyledOutput
 * DESCRIPTION
 *    Write the parse trees and associated features from the parse chart
 *    pointed to by pParses_in in a highly stylized fashion.  (This was
 *    written for KTAGGER and may not be useful for any other purpose.)
 * RETURN VALUE
 *    none
 */
void writePATRStyledOutput(pParses_in, pszWord_in, pszLex_in, pszGloss_in,
			   pOutputFP_in, pFeatTags_in,
			   pszParseStartTag_in, pszParseEndTag_in, pPATR_in,
			   puiAmbigCount_io)
PATREdgeList *		pParses_in;
char *			pszWord_in;
char *			pszLex_in;
char *			pszGloss_in;
FILE *			pOutputFP_in;
PATRFeatureTags *	pFeatTags_in;
char *			pszParseStartTag_in;
char *			pszParseEndTag_in;
PATRData *		pPATR_in;
unsigned *		puiAmbigCount_io;
{
PATREdgeList *		elp;
PATRFeature *		fnp;
PATRFeatureTags *	pField;
unsigned		uiAmbiguityCount;
char *			psz0;

if (puiAmbigCount_io != NULL)
	uiAmbiguityCount = *puiAmbigCount_io;
else
	uiAmbiguityCount = 0;
psz0 = storedPATRString("0", pPATR_in);
for ( elp = pParses_in ; elp ; elp = elp->pNext )
	{
	++uiAmbiguityCount;
	fputs(pszParseStartTag_in, pOutputFP_in);
	for (   pField = pFeatTags_in ; pField ; pField = pField->pNext )
	{
	fputs(pField->pszStartTag, pOutputFP_in);
	if (	(strcmp(pField->pFeaturePath->pszString, "WORD") ==0) &&
		(pField->pFeaturePath->pNext == (StringList *)NULL))
		{
		fputs(pszWord_in, pOutputFP_in);
		}
	else if ((strcmp(pField->pFeaturePath->pszString,"GLOSS")==0) &&
		 (pField->pFeaturePath->pNext == (StringList *)NULL))
		{
		fputs(pszGloss_in[0] ? pszGloss_in : "???", pOutputFP_in);
		}
	else if ((strcmp(pField->pFeaturePath->pszString,"LEX") == 0) &&
		 (pField->pFeaturePath->pNext == (StringList *)NULL))
		{
		fputs(pszLex_in[0] ? pszLex_in : "???", pOutputFP_in);
		}
	else if ((strcmp(pField->pFeaturePath->pszString,"TREE") ==0) &&
		 (pField->pFeaturePath->pNext == (StringList *)NULL))
		{
		pPATR_in->iFeatureDisplay &= ~PATR_FEATURE_ON;
		pPATR_in->eTreeDisplay     = PATR_FLAT_TREE;
		writePATRFlatParseTree(elp, pOutputFP_in, pPATR_in);
		}
	else if ((strcmp(pField->pFeaturePath->pszString,"FEAT") ==0) &&
		 (pField->pFeaturePath->pNext == (StringList *)NULL))
		{
		fnp = findPATRAttribute(elp->pEdge->pFeature, psz0);
		if (fnp == (PATRFeature *)NULL)
		fputs("???", pOutputFP_in);
		else
		{
		if (	(fnp->eType == PATR_ATOM) ||
			(fnp->eType == PATR_DEFATOM) )
			fputs( fnp->u.pszAtom, pOutputFP_in );
		else if (fnp->eType == PATR_COMPLEX)
			writePATRFeature(fnp, pOutputFP_in, 0, pPATR_in);
		else
			fputs("***", pOutputFP_in);
		}
		}
	else
		{
		fnp = findPATRAttribute(elp->pEdge->pFeature, psz0);
		fnp = followPATRFeaturePath( fnp, pField->pFeaturePath );
		if (fnp == (PATRFeature *)NULL)
		fputs("???", pOutputFP_in);
		else
		{
		if (	(fnp->eType == PATR_ATOM) ||
			(fnp->eType == PATR_DEFATOM) )
			fputs( fnp->u.pszAtom, pOutputFP_in );
		else if (fnp->eType == PATR_COMPLEX)
			writePATRFeature(fnp, pOutputFP_in, 0, pPATR_in);
		else
			fputs("***", pOutputFP_in);
		}
		}
	fputs(pField->pszEndTag, pOutputFP_in);
	}
	fputs(pszParseEndTag_in, pOutputFP_in);
	}
if (pParses_in == (PATREdgeList *)NULL)
	{
	fprintf(pOutputFP_in, "%s%s ***%s",
		pszParseStartTag_in, pszWord_in, pszParseEndTag_in);
	}
if (puiAmbigCount_io != NULL)
	*puiAmbigCount_io = uiAmbiguityCount;
}
