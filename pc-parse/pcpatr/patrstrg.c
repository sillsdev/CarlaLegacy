/* PATRSTRG.C - functions to turn PC-PATR results into a string
*******************************************************************************
 *
 * int stringifyPATRParses(PATREdgeList * pParses_in,
 *                         PATRData *     pPATR_in,
 *			   const char *   pszSentence_in,
 *                         char **        ppszBuffer_out)
 *
 ******************************************************************************
 * Copyright 1995, 2000 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <string.h>
#include "patr.h"
#include "patrdef.h"

/*
 *  local function prototypes
 */
static void store_flat_tree P((PATREdge * pEdge_in,
				   PATRData * pPATR_in,
				   DynString * pdstr_in));
static void store_flat_tree_children P((PATREdgeList * pEdgeList_in,
					PATRData * pPATR_in,
					DynString * pdstr_in));
static void store_full_tree P((PATREdge * pEdge_in,
				   PATRData * pPATR_in,
				   DynString * pdstr_in));
static void store_treenode P((PATREdge * pEdge_in,
				  int depth,
				  PATRData * pPATR_in));
static void store_treeline P((PATREdge * pEdge_in,
				  int depth,
				  PATRData * pPATR_in));
static void store_indented_tree P((PATREdge * pEdge_in,
				   int level,
				   PATRData * pPATR_in,
				   DynString * pdstr_in));
static void store_indented_tree_children P((PATREdgeList * pEdgeList_in,
						int level,
						PATRData * pPATR_in,
						DynString * pdstr_in));
static int is_null_feat P((PATRFeature *feat));
static void store_parse_tree_features P((PATREdge * pEdge_in,
					 DynString * pdstr_in,
					 PATRFeature * pTreeFeats_in,
					 PATRData * pPATR_in));
static void store_parse_tree_children_features P((PATREdgeList * pEdges_in,
						  DynString * pdstr_in,
						  PATRFeature * pTreeFeats_in,
						  PATRData * pPATR_in));
static void store_feature P((PATRFeature * pf,
				 int indent,
				 PATRData * pPATR_in,
				 DynString * pdstr_in));
static void store_feat_flat P((PATRFeature * pf,
				   PATRData * pPATR_in,
				   DynString * pdstr_in));
static void store_feat_indent P((PATRFeature * pf,
				 int indent,
				 int level,
				 PATRData * pPATR_in,
				 DynString * pdstr_in));


static int store_char_data P((const char * pszString_in, int bCDATA_in,
				  DynString * pdstr));
#define store_PCDATA(in, out) store_char_data(in, FALSE, out)
#define store_CDATA(in, out) store_char_data(in, TRUE, out)

static int store_xml_feature P((PATRFeature * pFeat_in,
				int iParse_in,
				const char * pszNodeId_in,
				PATRData * pPATR_in,
				DynString * pdstr));
static int store_xml_children P((PATREdgeList * pChildren_in,
				 PATRFeature * pTreeFeats_in,
				 int iParse_in,
				 PATRData * pPATR_in,
				 DynString * pdstr));
static int store_xml_node P((PATREdge * pEdge_in,
				 PATRFeature * pTreeFeats_in,
				 int iParse_in,
				 PATRData * pPATR_in,
				 DynString * pdstr));
static int convertPATRParsesToXML P((PATREdgeList * pParses_in,
					 PATRData * pPATR_in,
					 const char * pszSentence_in,
					 char ** ppszBuffer_out));

/*****************************************************************************
 * NAME
 *    stringifyPATRParses
 * DESCRIPTION
 *    Allocate and fill a buffer with all possible legal parses in the chart.
 * RETURN VALUE
 *    pointer to the dynamically allocated character string, or NULL if out of
 *    memory or no parses existed
 */
int stringifyPATRParses(pParses_in, pPATR_in, pszSentence_in, ppszBuffer_out)
PATREdgeList * pParses_in;
PATRData *     pPATR_in;
const char *   pszSentence_in;
char **        ppszBuffer_out;
{
int		count;
PATREdgeList *	pel;
int		iSaveFeatureDisplay;
int		iSaveParseCount;
int		iSaveCurrentIndex;
DynString	dstr;
char		szBuffer[20];
PATRFeature * pParseFeatures;
int bUnifiedParseFeatures;

if (ppszBuffer_out == NULL)
	return -1;
*ppszBuffer_out = NULL;
if (pPATR_in == NULL)
	return -1;
if (pParses_in == NULL)
	return 0;
if (pPATR_in->eTreeDisplay == PATR_XML_TREE)
	{
	return convertPATRParsesToXML(pParses_in, pPATR_in, pszSentence_in,
				  ppszBuffer_out);
	}

dstr.pszBuffer = NULL;
dstr.cbAlloc = 0;
dstr.cbLen = 0;
dstr.bError = FALSE;
iSaveFeatureDisplay = pPATR_in->iFeatureDisplay;
iSaveParseCount = pPATR_in->iParseCount;
iSaveCurrentIndex = pPATR_in->iCurrentIndex;

if (pPATR_in->bFailure && !pPATR_in->bUnification)
	pPATR_in->iFeatureDisplay |= PATR_FEATURE_ALL;
/*
 *  count number of parses
 */
for ( pPATR_in->iParseCount = 0, pel = pParses_in ; pel ; pel = pel->pNext )
	{
	++pPATR_in->iParseCount;
	}
/*
 *  convert the parses into a dynamically allocated character string
 */
for ( count = 0, pel = pParses_in ; pel != NULL ; pel = pel->pNext )
	{
	if (++count > pPATR_in->iMaxAmbiguities)	/* limit number of parses */
	continue;				/* displayed */
	pParseFeatures = NULL;
	bUnifiedParseFeatures = FALSE;
	if (    (pPATR_in->iFeatureDisplay & PATR_FEATURE_ALL) ||
		(pPATR_in->eTreeDisplay == PATR_XML_TREE) )
	{
	if (	!failedPATRParse(pel->pEdge) &&
		(pel->pEdge->pFeature != NULL) )
		{
		markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		pParseFeatures = unifyPATRParseTreeFeatures(pel->pEdge, NULL,
							pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		checkPATRFeatureCoreferences(pParseFeatures, pPATR_in);
		bUnifiedParseFeatures = TRUE;
		}
	}
	markPATRParseUnprinted(pel->pEdge);
	sprintf(szBuffer, "\n%d:\n", count);
	appendToDynString(&dstr, szBuffer, strlen(szBuffer));

	switch (pPATR_in->eTreeDisplay)
	{
	case PATR_FLAT_TREE:			/* flat tree */
		store_flat_tree(pel->pEdge, pPATR_in, &dstr);
		appendCharToDynString(&dstr, '\n');
		appendCharToDynString(&dstr, '\n');
		break;
	case PATR_FULL_TREE:			/* full tree */
		store_full_tree(pel->pEdge, pPATR_in, &dstr);
		if (pPATR_in->bGloss && pPATR_in->bGlossesExist)
		appendCharToDynString(&dstr, '\n');
		break;
	case PATR_INDENTED_TREE:		/* indented tree */
		store_indented_tree(pel->pEdge, 0, pPATR_in, &dstr);
		appendCharToDynString(&dstr, '\n');
		break;
	}
	store_parse_tree_features(pel->pEdge, &dstr, pParseFeatures, pPATR_in);
	if (bUnifiedParseFeatures)
	{
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	}
	}
sprintf(szBuffer, "%d", pPATR_in->iParseCount);
appendToDynString(&dstr, szBuffer, strlen(szBuffer));
appendToDynString(&dstr, " parse", 6);
if (pPATR_in->iParseCount != 1)
	appendCharToDynString(&dstr, 's');
appendToDynString(&dstr, " found", 6);
if (pPATR_in->iParseCount > pPATR_in->iMaxAmbiguities)
	{
	appendToDynString(&dstr, " (", 2);
	sprintf(szBuffer, "%d", pPATR_in->iMaxAmbiguities);
	appendToDynString(&dstr, szBuffer, strlen(szBuffer));
	appendToDynString(&dstr, " printed)", 9);
	}
appendCharToDynString(&dstr, '\n');

pPATR_in->iFeatureDisplay = iSaveFeatureDisplay;
pPATR_in->iParseCount = iSaveParseCount;	/* restore previous values */
pPATR_in->iCurrentIndex = iSaveCurrentIndex;

if (dstr.bError)
	{
	if (dstr.pszBuffer)
	free(dstr.pszBuffer);
	return -1;
	}
else
	{
	*ppszBuffer_out = dstr.pszBuffer;
	return 0;
	}
}

/****************************************************************************
 * NAME
 *    store_flat_tree
 * DESCRIPTION
 *    Map current parse edge into tree
 * RETURN VALUE
 *    none
 */
static void store_flat_tree(pEdge_in, pPATR_in, pdstr_in)
PATREdge * pEdge_in;
PATRData * pPATR_in;
DynString * pdstr_in;
{
PATRFeature * p;
char * pszLexFeatName;
char * pszGlossFeatName;
char szBuffer[20];

if ((pEdge_in == NULL) || (pPATR_in == NULL) || (pdstr_in == NULL))
	return;
appendCharToDynString(pdstr_in, '(');
appendToDynString(pdstr_in, pEdge_in->pszLabel, strlen(pEdge_in->pszLabel));
if (pEdge_in->iIndex != 0)
	{
	appendCharToDynString(pdstr_in, '_');
	sprintf(szBuffer, "%d", pEdge_in->iIndex);
	appendToDynString(pdstr_in, szBuffer, strlen(szBuffer));
	}
if (	(pPATR_in->iParseCount > 1) &&
	(pEdge_in->iCount == pPATR_in->iParseCount) )
	appendCharToDynString(pdstr_in, '+');
if (pEdge_in->bFailed)
	appendCharToDynString(pdstr_in, '-');

appendCharToDynString(pdstr_in, ' ');

if (pEdge_in->eType == PATR_RULE_EDGE)
	store_flat_tree_children(pEdge_in->u.r.pChildren, pPATR_in, pdstr_in);
else
	{
	if (pPATR_in->pGrammar != NULL)
	{
	pszLexFeatName   = pPATR_in->pGrammar->pszLexFeatName;
	pszGlossFeatName = pPATR_in->pGrammar->pszGlossFeatName;
	}
	else
	{
	pszLexFeatName   = storedPATRString( "lex", pPATR_in);
	pszGlossFeatName = storedPATRString( "gloss", pPATR_in);
	}
	p = findPATRAttribute(pEdge_in->pFeature, pszLexFeatName);
	if (p != NULL && p->eType == PATR_ATOM)
	{
	appendCharToDynString(pdstr_in, ' ');
	appendToDynString(pdstr_in, p->u.pszAtom, strlen(p->u.pszAtom));
	}
	if (    (pEdge_in->eType == PATR_LEXICAL_EDGE) &&
		pPATR_in->bGloss                  &&
		pPATR_in->bGlossesExist )
	{
	/* Print word gloss */
	p = findPATRAttribute(pEdge_in->pFeature, pszGlossFeatName);
	if (p != NULL && p->eType == PATR_ATOM)
		{
		appendToDynString(pdstr_in, "  '", 3);
		appendToDynString(pdstr_in, p->u.pszAtom, strlen(p->u.pszAtom));
		appendCharToDynString(pdstr_in, '\'');
		}
	}
	}
appendCharToDynString(pdstr_in, ')');
}

/****************************************************************************
 * NAME
 *    store_flat_tree_children
 * DESCRIPTION
 *    Call store_flat_tree for each node
 * RETURN VALUE
 *    None
 */
static void store_flat_tree_children(pEdgeList_in, pPATR_in, pdstr_in)
PATREdgeList * pEdgeList_in;
PATRData * pPATR_in;
DynString * pdstr_in;
{
if (pEdgeList_in == NULL)
   return;

if (pEdgeList_in->pNext)
	store_flat_tree_children(pEdgeList_in->pNext, pPATR_in, pdstr_in);

store_flat_tree(pEdgeList_in->pEdge, pPATR_in, pdstr_in);
}

/*****************************************************************************
 * NAME
 *    store_full_tree
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
/*	    lcvert_tree(pel->pEdge, pPATR_in);*/
static void store_full_tree(pEdge_in, pPATR_in, pdstr_in)
PATREdge * pEdge_in;
PATRData * pPATR_in;
DynString * pdstr_in;
{
/*
 *  Calculate horizontal positions for tree edges.  We must do
 *  this with POSTORDER since position of a parent is determined
 *  by the children.
 */
pPATR_in->pMem->iNextPosition = 1;
visitPATRTree(pEdge_in, 1, PATR_POSTORDER, calcPATRFullTreePos, pPATR_in);
/*
 *  The following loop iterates through all the levels of the tree.
 *  We visit all the nodes of the tree during each iteration but
 *  we only print those at the current level.  (This is not very
 *  efficient but using the standard tree visiting routines IMHO
 *  increases the likelihood that the code will be correct and
 *  eases maintenance.  I don't think display routines will be
 *  critical path items with regard to execution time anyway.)
 */
memcpy(&pPATR_in->pMem->dstrOutput, pdstr_in,
	   sizeof(pPATR_in->pMem->dstrOutput));
for ( pPATR_in->pMem->iPrintDepth = 1 ;; ++pPATR_in->pMem->iPrintDepth )
	{
	/* pPATR_in->pMem->bMoreTree is set by print_treeline() */
	/* Init next pos and current depth */
	pPATR_in->pMem->bMoreTree = FALSE;
	pPATR_in->pMem->iNextPosition = 1;

	visitPATRTree(pEdge_in, 1, PATR_POSTORDER, store_treenode, pPATR_in);

	appendCharToDynString(&pPATR_in->pMem->dstrOutput, '\n');
	/* Init next pos and current depth */
	pPATR_in->pMem->iNextPosition = 1;

	visitPATRTree(pEdge_in, 1, PATR_POSTORDER, store_treeline, pPATR_in);

	if (pPATR_in->pMem->bMoreTree)
	appendCharToDynString(&pPATR_in->pMem->dstrOutput, '\n');
	else
	break;			/* no more tree to print */
	}
memcpy(pdstr_in, &pPATR_in->pMem->dstrOutput,
	   sizeof(pPATR_in->pMem->dstrOutput));
memset(&pPATR_in->pMem->dstrOutput, 0, sizeof(pPATR_in->pMem->dstrOutput));
}


#define FILL_TO(x, y) \
for (; pPATR_in->pMem->iNextPosition <= (x); ++pPATR_in->pMem->iNextPosition) \
{ \
	appendCharToDynString(&dstr, (y)); \
}

/*****************************************************************************
 * NAME
 *    store_treenode
 * DESCRIPTION
 *    Store node of tree at depth
 * RETURN VALUE
 *    none
 */
static void store_treenode(pEdge_in, depth, pPATR_in)
PATREdge * pEdge_in;
int depth;
PATRData * pPATR_in;
{
unsigned len;
int left_pos;
DynString dstr;
char szExtra[32];
unsigned cbName;
unsigned cbExtra;
char * pszGloss;

memcpy(&dstr, &pPATR_in->pMem->dstrOutput, sizeof(dstr));
if (pPATR_in->pMem->iPrintDepth == depth)
	{
	/* print only at current tree depth */
	/* Form name of edge including index if present */
	if (pEdge_in->iIndex == 0)
	{
	szExtra[0] = '\0';
	}
	else
	{
	sprintf(szExtra, "_%d", pEdge_in->iIndex);
	}
	if (    (pPATR_in->iParseCount > 1) &&
		(pEdge_in->iCount == pPATR_in->iParseCount) )
	strcat(szExtra, "+");
	if (pEdge_in->bFailed)
		strcat(szExtra, "-");
	/*
	 *  Print edge name
	 */
	cbName = strlen(pEdge_in->pszLabel);
	cbExtra = strlen(szExtra);
	len = cbName + cbExtra;
	left_pos = pEdge_in->iCenterColumn - len/2;
	FILL_TO(left_pos, ' ');
	appendToDynString(&dstr, pEdge_in->pszLabel, cbName);
	if (cbExtra)
	appendToDynString(&dstr, szExtra, cbExtra);
	appendCharToDynString(&dstr, ' ');
	pPATR_in->pMem->iNextPosition += len + 1;
	}
else if (pPATR_in->pMem->iPrintDepth == depth+1)
	{
	if (    (pEdge_in->eType == PATR_LEXICAL_EDGE) &&
		pPATR_in->bGloss                       &&
		pPATR_in->bGlossesExist )
	{
	/* Print word gloss */
	pszGloss = getPATRNodeGloss(pEdge_in, pPATR_in);
	len = strlen(pszGloss);
	left_pos = pEdge_in->iCenterColumn - len/2;
	FILL_TO(left_pos, ' ');
	appendToDynString(&dstr, pszGloss, len);
	appendCharToDynString(&dstr, ' ');
	pPATR_in->pMem->iNextPosition += len + 1;
	}
	}
memcpy(&pPATR_in->pMem->dstrOutput, &dstr, sizeof(dstr));
}

/*****************************************************************************
 * NAME
 *    store_treeline
 * DESCRIPTION
 *    Print line of tree at depth
 * RETURN VALUE
 *    none
 */
static void store_treeline(pEdge_in, depth, pPATR_in)
PATREdge * pEdge_in;
int depth;
PATRData * pPATR_in;
{
int len;
int left_pos, center_pos, right_pos;
PATREdgeList * pel;
char * leaf;
DynString dstr;

if (pPATR_in->pMem->iPrintDepth != depth)    /* only print at current depth */
	return;

memcpy(&dstr, &pPATR_in->pMem->dstrOutput, sizeof(dstr));
if (	(pEdge_in->eType == PATR_LEXICAL_EDGE) ||
	(pEdge_in->u.r.pChildren == NULL))
	{
	/*  If this is a lexical edge, print the corresponding word.
	 */
	if (pEdge_in->eType == PATR_LEXICAL_EDGE)
	{
	if (pEdge_in->u.l.pszTerminal == (char *)NULL)
		leaf = (char *)"";
	else
		leaf = pEdge_in->u.l.pszTerminal;
	}
	else
	leaf = "0";

	len = strlen(leaf);
	left_pos = pEdge_in->iCenterColumn - len/2;
	FILL_TO(left_pos, ' ');
	if (len)
	appendToDynString(&dstr, leaf, len);
	appendCharToDynString(&dstr, ' ');
	pPATR_in->pMem->iNextPosition += len + 1;
	}
else
	{
	/*  For rule edge, find the centers of the left and rightmost
	 *  children, print tree edge spanning this gap.
	 */
	for (    pel = pEdge_in->u.r.pChildren ;
			 pel->pNext ;
			 pel = pel->pNext )
	;
	right_pos = pEdge_in->u.r.pChildren->pEdge->iCenterColumn;
	left_pos = pel->pEdge->iCenterColumn;
	center_pos = pEdge_in->iCenterColumn;
	FILL_TO(left_pos, ' ');
	FILL_TO(center_pos, '_');
	appendCharToDynString(&dstr, '|');
	++pPATR_in->pMem->iNextPosition;
	FILL_TO(right_pos+1, '_');
	}
pPATR_in->pMem->bMoreTree = 1;	/* make sure print iterates one more level */
memcpy(&pPATR_in->pMem->dstrOutput, &dstr, sizeof(dstr));
}

/*****************************************************************************
 * NAME
 *    store_indented_tree
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void store_indented_tree(pEdge_in, level, pPATR_in, pdstr_in)
PATREdge * pEdge_in;
int level;
PATRData * pPATR_in;
DynString * pdstr_in;
{
PATRFeature * p;
char * pszLexFeatName;
char * pszGlossFeatName;
char szBuffer[20];
int i;

if ((pEdge_in == NULL) || (pPATR_in == NULL) || (pdstr_in == NULL))
	return;

if (level > 0)
	{
	appendCharToDynString(pdstr_in, '\n');
	for ( i = 0 ; i < level ; ++i )
	appendToDynString(pdstr_in, "    ", 4);
	}
appendToDynString(pdstr_in, pEdge_in->pszLabel, strlen(pEdge_in->pszLabel));
if (pEdge_in->iIndex != 0)
	{
	appendCharToDynString(pdstr_in, '_');
	sprintf(szBuffer, "%d", pEdge_in->iIndex);
	appendToDynString(pdstr_in, szBuffer, strlen(szBuffer));
	}
if (	(pPATR_in->iParseCount > 1) &&
	(pEdge_in->iCount == pPATR_in->iParseCount) )
	appendCharToDynString(pdstr_in, '+');
if (pEdge_in->bFailed)
	appendCharToDynString(pdstr_in, '-');

appendCharToDynString(pdstr_in, ' ');

if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	store_indented_tree_children(pEdge_in->u.r.pChildren, level + 1, pPATR_in,
				 pdstr_in);
	}
else
	{
	if (pPATR_in->pGrammar != NULL)
	{
	pszLexFeatName   = pPATR_in->pGrammar->pszLexFeatName;
	pszGlossFeatName = pPATR_in->pGrammar->pszGlossFeatName;
	}
	else
	{
	pszLexFeatName   = storedPATRString( "lex", pPATR_in);
	pszGlossFeatName = storedPATRString( "gloss", pPATR_in);
	}
	p = findPATRAttribute(pEdge_in->pFeature, pszLexFeatName);
	if (p != NULL && p->eType == PATR_ATOM)
	{
	appendCharToDynString(pdstr_in, ' ');
	appendToDynString(pdstr_in, p->u.pszAtom, strlen(p->u.pszAtom));
	}
	if (    (pEdge_in->eType == PATR_LEXICAL_EDGE) &&
		pPATR_in->bGloss                  &&
		pPATR_in->bGlossesExist )
	{
	/* Print word gloss */
	p = findPATRAttribute(pEdge_in->pFeature, pszGlossFeatName);
	if (p != NULL && p->eType == PATR_ATOM)
		{
		appendToDynString(pdstr_in, "  '", 3);
		appendToDynString(pdstr_in, p->u.pszAtom, strlen(p->u.pszAtom));
		appendCharToDynString(pdstr_in, '\'');
		}
	}
	}
}

/****************************************************************************
 * NAME
 *    store_indented_tree_children
 * DESCRIPTION
 *    Call store_indented_tree for each node
 * RETURN VALUE
 *    None
 */
static void store_indented_tree_children(pEdgeList_in, level, pPATR_in,
					 pdstr_in)
PATREdgeList * pEdgeList_in;
int level;
PATRData * pPATR_in;
DynString * pdstr_in;
{
if (pEdgeList_in == NULL)
   return;

if (pEdgeList_in->pNext)
	store_indented_tree_children(pEdgeList_in->pNext, level, pPATR_in,
				 pdstr_in);
store_indented_tree(pEdgeList_in->pEdge, level, pPATR_in, pdstr_in);
}

/*****************************************************************************
 * NAME
 *    is_null_feat
 * DESCRIPTION
 *    check whether this feature is a NULLFS, or contains only NULLFS features
 * RETURN VALUE
 *    TRUE if NULLFS (or contains only NULLFS), FALSE otherwise
 */
static int is_null_feat(feat)
PATRFeature *	feat;	/* pointer to a Feature node */
{
PATRComplexFeature *featp;

if (feat == (PATRFeature *)NULL)
	return( TRUE );
feat = followPATRForwardPointers( feat );		/* Follow pointers */
if (feat->eType == PATR_NULLFS)
	return( TRUE );
if (feat->eType == PATR_COMPLEX)
	{
	for ( featp = feat->u.pComplex ; featp ; featp = featp->pNext )
	{
	if (!is_null_feat(featp->pValue))
		return( FALSE );
	}
	return( TRUE );
	}
return( FALSE );
}

/*****************************************************************************
 * NAME
 *    store_parse_tree_features
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void store_parse_tree_features(pEdge_in, pdstr_in, pTreeFeats_in,
					  pPATR_in)
PATREdge * pEdge_in;
DynString * pdstr_in;
PATRFeature * pTreeFeats_in;
PATRData * pPATR_in;
{
PATRFeature * pf;
PATRComplexFeature * pcf;
char szIndex[16];
int k;
const char * pszExtra;
int bFailed;
int bCorefChecked;
PATRDisplayedFeature * pSaveMultTop = pPATR_in->pMem->pMultTop;
const char * psz;
unsigned cb;

if ((pEdge_in == NULL) || (pdstr_in == NULL) || (pPATR_in == NULL))
	return;
if (!(pPATR_in->iFeatureDisplay & PATR_FEATURE_ON))
	return;

if (!(pPATR_in->iFeatureDisplay & PATR_FEATURE_ALL))
	{
	/*
	 *  show only the top feature
	 */
	markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	markPATRParseCoref(pEdge_in, pPATR_in);
	psz = pEdge_in->pszLabel ? pEdge_in->pszLabel : "{NULL}";
	cb = strlen(psz);
	appendToDynString(pdstr_in, psz, cb);
	if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
	{
	appendToDynString(pdstr_in, ": ", 2);
	cb += 2;
	while (cb++ & 7)
		appendCharToDynString(pdstr_in, ' ');
	k = (int)cb;
	}
	else
	{
	appendToDynString(pdstr_in,":\n", 2);
	k = 0;
	}
	pf = findPATRAttribute(pEdge_in->pFeature,
			   storedPATRString("0", pPATR_in));
	if (pf != NULL)
	store_feature( pf, k, pPATR_in, pdstr_in );
	appendCharToDynString(pdstr_in, '\n');
	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	return;
	}
/*
 *  all features requested.
 */
sprintf(szIndex, "%d", pEdge_in->iIndex);
bFailed = failedPATRParse(pEdge_in);
if (!bFailed)
	{
	pszExtra = "";
	if ((pTreeFeats_in != NULL) && (pEdge_in->eType == PATR_LEXICAL_EDGE))
	{
	pszExtra = " (unified)";
	}
	pf = NULL;
	bCorefChecked = FALSE;
	if (pTreeFeats_in != NULL)
	{
	for ( pcf = pTreeFeats_in->u.pComplex ; pcf ; pcf = pcf->pNext )
		{
		if (pcf->pszLabel == (char *)pEdge_in->iIndex)
		{
		pf = pcf->pValue;
		break;
		}
		}
	}
	else if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	pf = findPATRAttribute(pEdge_in->pFeature,
				   storedPATRString("0", pPATR_in));
	if (pf != NULL)
		{
		markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		checkPATRFeatureCoreferences(pf, pPATR_in);
		bCorefChecked = TRUE;
		}
	}
	if (pf != NULL)
	{
	appendToDynString(pdstr_in, pEdge_in->pszLabel,
			  strlen(pEdge_in->pszLabel));
	appendCharToDynString(pdstr_in, '_');
	appendToDynString(pdstr_in, szIndex, strlen(szIndex));
	if (pszExtra && *pszExtra)
		appendToDynString(pdstr_in, pszExtra, strlen(pszExtra));
	appendCharToDynString(pdstr_in, ':');
	if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
		{
		appendCharToDynString(pdstr_in, ' ');
		k = strlen(pEdge_in->pszLabel) + strlen(szIndex) +
							  strlen(pszExtra) + 3;
		while (k++ & 7)
		appendCharToDynString(pdstr_in, ' ');
		}
	else
		{
		appendCharToDynString(pdstr_in, '\n');
		k = 0;
		}
	store_feature(pf, k, pPATR_in, pdstr_in);
	appendCharToDynString(pdstr_in, '\n');
	}
	if (bCorefChecked)
	{
	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	pPATR_in->pMem->pMultTop = pSaveMultTop;
	}
	}

if (	(bFailed || (pEdge_in->eType == PATR_LEXICAL_EDGE)) &&
	(pEdge_in->pFeature != NULL) )
	{
	if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	PATREdgeList * pel;
	int bFailedChild = FALSE;
	for ( pel = pEdge_in->u.r.pChildren ; pel ; pel = pel->pNext )
		{
		if (failedPATRParse(pel->pEdge))
		{
		bFailedChild = TRUE;
		break;
		}
		}
	if (bFailedChild)
		{
		pf = NULL;
		appendToDynString(pdstr_in, pEdge_in->pszLabel,
			  strlen(pEdge_in->pszLabel));
		appendCharToDynString(pdstr_in, '_');
		appendToDynString(pdstr_in, szIndex, strlen(szIndex));
		appendCharToDynString(pdstr_in, ':');
		if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
		appendToDynString(pdstr_in, "  ", 2);
		else
		appendCharToDynString(pdstr_in, '\n');
		appendToDynString(pdstr_in, "[***]\n\n", 7);
		}
	else
		{
		pf = findPATRAttribute(pEdge_in->pFeature,
				   storedPATRString("0", pPATR_in));
		}
	}
	else
	{
	pf = pEdge_in->pFeature;
	}
	if (pf != NULL)
	{
	if (pEdge_in->bFailed)
		{
		pszExtra = " (failed)";
		}
	else if (pTreeFeats_in != NULL)
		{
		pszExtra = " (lexicon)";
		}
	else
		{
		pszExtra = "";
		}
	appendToDynString(pdstr_in, pEdge_in->pszLabel,
			  strlen(pEdge_in->pszLabel));
	appendCharToDynString(pdstr_in, '_');
	appendToDynString(pdstr_in, szIndex, strlen(szIndex));
	if (pszExtra && *pszExtra)
		appendToDynString(pdstr_in, pszExtra, strlen(pszExtra));
	appendCharToDynString(pdstr_in, ':');

	if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
		{
		appendCharToDynString(pdstr_in, ' ');
		k = strlen(pEdge_in->pszLabel) + strlen(szIndex) +
							  strlen(pszExtra) + 3;
		while (k++ & 7)
		appendCharToDynString(pdstr_in, ' ');
		}
	else
		{
		appendCharToDynString(pdstr_in, '\n');
		k = 0;
		}
	markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	checkPATRFeatureCoreferences(pf, pPATR_in);

	store_feature(pf, k, pPATR_in, pdstr_in);
	appendCharToDynString(pdstr_in, '\n');

	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	pPATR_in->pMem->pMultTop = pSaveMultTop;
	}
	}
if (	(pPATR_in->iFeatureDisplay & PATR_FEATURE_ALL) &&
	(pEdge_in->eType == PATR_RULE_EDGE) )
	{
	store_parse_tree_children_features(pEdge_in->u.r.pChildren, pdstr_in,
					   pTreeFeats_in, pPATR_in);
	}
}

/*****************************************************************************
 * NAME
 *    store_parse_tree_children_features
 * DESCRIPTION
 *    recursively write the feature structures for each parse tree edge in
 *    the given list of edges
 * RETURN VALUE
 *    none
 */
static void store_parse_tree_children_features(pEdges_in, pdstr_in,
						   pTreeFeats_in, pPATR_in)
PATREdgeList * pEdges_in;
DynString * pdstr_in;
PATRFeature * pTreeFeats_in;
PATRData * pPATR_in;
{
if (pEdges_in == NULL)
	return;
if (pEdges_in->pNext)
	store_parse_tree_children_features(pEdges_in->pNext, pdstr_in,
					   pTreeFeats_in, pPATR_in);
store_parse_tree_features(pEdges_in->pEdge, pdstr_in, pTreeFeats_in,
			  pPATR_in);
}

/*****************************************************************************
 * NAME
 *    store_feature
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void store_feature( pf, indent, pPATR_in, pdstr_in )
PATRFeature * pf;
int indent;
PATRData * pPATR_in;
DynString * pdstr_in;
{
int bSetCoref = FALSE;

if ((pf == NULL) || (pPATR_in == NULL) || (pdstr_in == NULL))
	return;
if (!pPATR_in->bUnification && !pPATR_in->bFailure)
	return;
if (pPATR_in->pMem->pMultTop == NULL)
	{
	/* Check for multiple refs */
	bSetCoref = TRUE;
	markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	checkPATRFeatureCoreferences( pf, pPATR_in );
	}
if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
	{
	store_feat_flat(pf, pPATR_in, pdstr_in);
	}
else
	{
	/* Show indented at level 0 */
	store_feat_indent( pf, indent, 0, pPATR_in, pdstr_in );
	}
appendCharToDynString(pdstr_in, '\n');		/* Space after */
if (bSetCoref)
	{
	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	}
}

/***************************************************************************
 * NAME
 *    store_feat_flat
 * ARGUMENTS
 *    pf     - feature structure to show
 * DESCRIPTION
 *    Store the contents of a feature structure as a flat, linear string.
 * RETURN VALUE
 *    none
 */
static void store_feat_flat(pf, pPATR_in, pdstr_in)
PATRFeature * pf;
PATRData * pPATR_in;
DynString * pdstr_in;
{
PATRFeature * x;
unsigned n;
int iCoref;
int bRepeated;
PATRComplexFeature * flist;			/* Temp feature list */
char szBuffer[20];

x = followPATRForwardPointers( pf );		/* Follow pointers */

if (x->eType == PATR_FAILFS)		/* If failure, store fail string */
	{
	appendToDynString(pdstr_in, "FAIL ", 5);
	/* This contains x/y */
	n = strlen(x->u.pszAtom);
	appendToDynString(pdstr_in, x->u.pszAtom, n);
	return;
	}

if (x->eType == PATR_ATOM || x->eType == PATR_DEFATOM)
	{						/* If atom or default atom */
	n = strlen(x->u.pszAtom);
	appendToDynString(pdstr_in, x->u.pszAtom, n);	/* Store it */
	appendCharToDynString(pdstr_in, ' ');
	}
else
	{						/* x is complex or null */
	iCoref = getPATRFeatureCoreference(x, pPATR_in);
	if (iCoref != 0)
	{					/* If used multiple */
	sprintf(szBuffer, "$%d", iCoref);
	n = strlen(szBuffer);
	appendToDynString(pdstr_in, szBuffer, n);	/* Print ref number with $ */
	bRepeated = repeatedPATRFeatureCoreference( x, pPATR_in );
	}
	else
	bRepeated = FALSE;
	if (bRepeated && (pPATR_in->iFeatureDisplay & PATR_FEATURE_ONCE))
	{
	appendCharToDynString(pdstr_in, ' ');		/* already seen, add space */
	}
	else
	{					/* If not already seen */
	if (x->eType == PATR_NULLFS)
		{
		if (!(pPATR_in->iFeatureDisplay & PATR_FEATURE_TRIM))
		{
		appendToDynString(pdstr_in, "[] ", 3);
		}
		}
	else
		{					/* Else (complex) print it */
		appendToDynString(pdstr_in, "[ ", 2);	/* Print open bracket */
		sortPATRComplexFeature(x->u.pComplex, pPATR_in->pGrammar,
				   pPATR_in);
		for ( flist = x->u.pComplex ; flist ; flist = flist->pNext)
		{				/* For each feat */
		if (	(pPATR_in->iFeatureDisplay & PATR_FEATURE_TRIM) &&
			is_null_feat(flist->pValue) )
			continue;
		/* Print label */
		n = strlen(flist->pszLabel);
		appendToDynString(pdstr_in, flist->pszLabel, n);
		appendCharToDynString(pdstr_in, ':');
						/* Print value */
		store_feat_flat(flist->pValue, pPATR_in, pdstr_in);
		}
		appendToDynString(pdstr_in, "] ", 2);	/* Print close bracket */
		}
	}
	}
}

/***************************************************************************
 * NAME
 *    store_feat_indent
 * ARGUMENTS
 *    pf    - feature structure to show
 *    level - level to indent
 * DESCRIPTION
 *    Store the contents of a feature structure.
 * RETURN VALUE
 *    none
 */
static void store_feat_indent(pf, indent, level, pPATR_in, pdstr_in)
PATRFeature * pf;
int indent;
int level;
PATRData * pPATR_in;
DynString * pdstr_in;
{
int n;
int iCoref;
int bRepeated;
int lablen;
int first;
PATRComplexFeature * pcf;
char szBuffer[20];
unsigned cb;
PATRFeature * x;

x = followPATRForwardPointers(pf);		/* Follow pointers */
if (x == NULL)
	{
	appendToDynString(pdstr_in, "NULL", 4);
	return;
	}

if (x->eType == PATR_FAILFS)		/* If failure, print fail string */
	{
	appendToDynString(pdstr_in, "FAIL ", 5);
	/* This contains x/y */
	appendToDynString(pdstr_in, x->u.pszAtom, strlen(x->u.pszAtom));
	return;
	}

if (x->eType == PATR_ATOM || x->eType == PATR_DEFATOM)
	{					/* If atom or default atom, store it */
	appendToDynString(pdstr_in, x->u.pszAtom, strlen(x->u.pszAtom));
	}
else
	{					/* x is complex or null */
	iCoref = getPATRFeatureCoreference(x, pPATR_in);
	if (iCoref != 0)
	{				/* If used multiple */
	sprintf(szBuffer, "$%d", iCoref);	/* Print ref number with $ */
	appendToDynString(pdstr_in, szBuffer, strlen(szBuffer));
	bRepeated = repeatedPATRFeatureCoreference( x, pPATR_in );
	}
	else
	{
	if (level)
		appendToDynString(pdstr_in, "  ", 2);	/* Else print 2 spaces */
	bRepeated = FALSE;
	}
	if (!bRepeated || !(pPATR_in->iFeatureDisplay & PATR_FEATURE_ONCE))
	{					/* If not already seen */
	if (	!(pPATR_in->iFeatureDisplay & PATR_FEATURE_TRIM) &&
		 (x->eType == PATR_NULLFS))
			appendToDynString(pdstr_in, "[]", 2);
	else
		{					/* Else (complex) print it */
		first = TRUE;
		appendToDynString(pdstr_in, "[ ", 2);	/* Print open bracket */
		sortPATRComplexFeature(x->u.pComplex, pPATR_in->pGrammar,
				   pPATR_in);
		for (pcf = x->u.pComplex ; pcf ; pcf = pcf->pNext)
		{				/* For each feat */
		if (	(pPATR_in->iFeatureDisplay & PATR_FEATURE_TRIM) &&
			is_null_feat(pcf->pValue) )
			continue;
		if (!first)
			{				/* Start new line */
			appendToDynString(pdstr_in, "\n  ", 3);
			for ( n = indent; n; n--)	/* left margin */
			appendCharToDynString(pdstr_in, ' ');
			/* indent 11 each nesting level */
			for ( n = level; n; n--)
			appendToDynString(pdstr_in, "           ", 11);
			}
		first = FALSE;
		/*Print label and colon */
		cb = strlen(pcf->pszLabel);
		appendToDynString(pdstr_in, pcf->pszLabel, cb);
		appendCharToDynString(pdstr_in, ':');
		lablen = cb + 3;	/* Align from label */
		if ( lablen < 9 )
			{
			for ( n = 9 - lablen; n; n-- )
			appendCharToDynString(pdstr_in, ' ');
			}
						/* Print value */
		store_feat_indent(pcf->pValue, indent, level + 1, pPATR_in,
				  pdstr_in);
		}
		appendToDynString(pdstr_in, " ]", 2);	/* Print close bracket */
		}
	}
	}
}


/******************************************************************************
 *  constant data used for XML output
 */
#ifndef hab124
const static char szCloseTag_m[]          = "</Analysis>\n";
const static char szParseBeginTag_m[]     = "<Parse>\n";
const static char szParseEndTag_m[]       = "</Parse>\n";
const static char szSharedTagHead_m[]     = "<Shared id=\"";
const static char szEmptyTagTail_m[]      = "/>\n";
const static char szNodeTagHead_m[]       = "<Node cat=\"";
const static char szNodeRule_m[]          = "\" rule=\"";
const static char szNodeTagMid_m[]        = "\" id=\"";
const static char szBeginTagTail_m[]      = ">\n";
const static char szNodeEndTag_m[]        = "</Node>\n";
const static char szNoFeature_m[]         = "<Fs></Fs>\n";
const static char szLeafTagHead_m[]       = "<Leaf cat=\"";
const static char szLeafEndTag_m[]        = "</Leaf>\n";
const static char szStrBeginTagHead_m[]   = "<Str";
const static char szStrEndTag_m[]         = "</Str>";
const static char szFsBeginTagHead_m[]    = "<Fs";
const static char szFsEndTag_m[]          = "</Fs>\n";
const static char szFBeginTagHead_m[]     = "<F name=\"";
const static char szFEndTag_m[]           = "</F>\n";
const static char szAnyTagHead_m[]        = "<Any";
const static char szAnyTagTail_m[]        = "/>";
const static char szFAIL_m[]              = "FAIL ";
const static char szERROR_m[]             = "<ERROR>\n";
const static char szAmp_m[]               = "&amp;";
const static char szLt_m[]                = "&lt;";
const static char szGt_m[]                = "&gt;";
const static char szQuot_m[]              = "&quot;";
const static char szNoLexFeature_m[]      = "<Lexfs></Lexfs>\n";
const static char szLexFsBeginTagHead_m[] = "<Lexfs";
const static char szLexFsEndTag_m[]       = "</Lexfs>\n";
#else
const static char szXmlHeader_m[] = "\
<?xml version=\"1.0\"?>\n\
<!DOCTYPE analysis SYSTEM \"pcpatr.dtd\">\n\
";
const static char szCloseTag_m[]          = "</analysis>\n";
const static char szParseBeginTag_m[]     = "<parse>\n";
const static char szParseEndTag_m[]       = "</parse>\n";
const static char szSharedTagHead_m[]     = "<shared id=\"";
const static char szEmptyTagTail_m[]      = "/>\n";
const static char szNodeTagHead_m[]       = "<node cat=\"";
const static char szNodeRule_m[]          = "\" rule=\"";
const static char szNodeTagMid_m[]        = "\" id=\"";
const static char szBeginTagTail_m[]      = ">\n";
const static char szNodeEndTag_m[]        = "</node>\n";
const static char szNoFeature_m[]         = "<fs></fs>\n";
const static char szLeafTagHead_m[]       = "<leaf cat=\"";
const static char szLeafEndTag_m[]        = "</leaf>\n";
const static char szStrBeginTagHead_m[]   = "<str";
const static char szStrEndTag_m[]         = "</str>";
const static char szFsBeginTagHead_m[]    = "<fs";
const static char szFsEndTag_m[]          = "</fs>\n";
const static char szFBeginTagHead_m[]     = "<f name=\"";
const static char szFEndTag_m[]           = "</f>\n";
const static char szAnyTagHead_m[]        = "<any";
const static char szAnyTagTail_m[]        = "/>";
const static char szFAIL_m[]              = "FAIL ";
const static char szERROR_m[]             = "<ERROR>\n";
const static char szAmp_m[]               = "&amp;";
const static char szLt_m[]                = "&lt;";
const static char szGt_m[]                = "&gt;";
const static char szQuot_m[]              = "&quot;";
const static char szNoLexFeature_m[]      = "<lexfs></lexfs>\n";
const static char szLexFsBeginTagHead_m[] = "<lexfs";
const static char szLexFsEndTag_m[]       = "</lexfs>\n";
#endif /* hab124 */
const static unsigned cbCloseTag_m          = 12;
const static unsigned cbParseBeginTag_m     =  8;
const static unsigned cbParseEndTag_m       =  9;
const static unsigned cbSharedTagHead_m     = 12;
const static unsigned cbEmptyTagTail_m      =  3;
const static unsigned cbNodeTagHead_m       = 11;
const static unsigned cbNodeRule_m          =  8;
const static unsigned cbNodeTagMid_m        =  6;
const static unsigned cbBeginTagTail_m      =  2;
const static unsigned cbNodeEndTag_m        =  8;
const static unsigned cbNoFeature_m         = 10;
const static unsigned cbLeafTagHead_m       = 11;
const static unsigned cbLeafEndTag_m        =  8;
const static unsigned cbStrBeginTagHead_m   =  4;
const static unsigned cbStrEndTag_m         =  6;
const static unsigned cbFsBeginTagHead_m    =  3;
const static unsigned cbFsEndTag_m          =  6;
const static unsigned cbFBeginTagHead_m     =  9;
const static unsigned cbFEndTag_m           =  5;
const static unsigned cbAnyTagHead_m        =  4;
const static unsigned cbAnyTagTail_m        =  2;
const static unsigned cbFAIL_m              =  5;
const static unsigned cbERROR_m             =  8;
const static unsigned cbAmp_m               =  5;
const static unsigned cbLt_m                =  4;
const static unsigned cbGt_m                =  4;
const static unsigned cbQuot_m              =  6;
const static unsigned cbNoLexFeature_m      = 16;
const static unsigned cbLexFsBeginTagHead_m =  6;
const static unsigned cbLexFsEndTag_m       =  9;

/*****************************************************************************
 * NAME
 *    store_char_data
 * DESCRIPTION
 *
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurred
 */
static int store_char_data(pszString_in, bCDATA_in, pdstr)
const char * pszString_in;
int bCDATA_in;
DynString * pdstr;
{
const char * psz;

if (pszString_in == NULL)
	return 0;
for ( psz = pszString_in ; *psz ; ++psz )
	{
	if (*psz == '&')
	{
	if (appendToDynString(pdstr, szAmp_m, cbAmp_m))
		return -1;
	}
	else if (*psz == '<')
	{
	if (appendToDynString(pdstr, szLt_m, cbLt_m))
		return -1;
	}
	else if (*psz == '>')
	{
	if (appendToDynString(pdstr, szGt_m, cbGt_m))
		return -1;
	}
	else if (bCDATA_in && (*psz == '"'))
	{
	if (appendToDynString(pdstr, szQuot_m, cbQuot_m))
		return -1;
	}
	else
	{
	if (appendCharToDynString(pdstr, *psz))
		return -1;
	}
	}
return 0;
}

/*****************************************************************************
 * NAME
 *    store_xml_feature
 * DESCRIPTION
 *
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurred
 */
static int store_xml_feature(pFeat_in, iParse_in, pszNodeId_in, pPATR_in,
				 pdstr)
PATRFeature * pFeat_in;
int iParse_in;
const char * pszNodeId_in;
PATRData * pPATR_in;
DynString * pdstr;
{
PATRFeature * pFeat;
PATRComplexFeature * pcf;
PATRFeature * pChild;
int iCoref;
int bRepeated;
char szCoref[64];

if (pFeat_in == NULL)
	return 0;
pFeat = followPATRForwardPointers( pFeat_in );		/* Follow pointers */
if (pFeat == NULL)
	return 0;

if (pszNodeId_in == NULL)
	pszNodeId_in = "";
switch (pFeat->eType)
	{
	case PATR_ATOM:
	case PATR_DEFATOM:
	/*
	 *  if atom or default atom, print it
	 */
	/* TODO: distinguish <num>, <sym>, <plus/>, <minus/>? */
	if (appendToDynString(pdstr, szStrBeginTagHead_m, cbStrBeginTagHead_m))
		return -1;
	if (appendCharToDynString(pdstr, '>'))
		return -1;
	if (store_PCDATA(pFeat->u.pszAtom, pdstr))
		return -1;
	if (appendToDynString(pdstr, szStrEndTag_m, cbStrEndTag_m))
		return -1;
	if (appendCharToDynString(pdstr, '\n'))
		return -1;
	break;

	case PATR_COMPLEX:
	sortPATRComplexFeature(pFeat->u.pComplex, pPATR_in->pGrammar,
				   pPATR_in);
	for ( pcf = pFeat->u.pComplex ; pcf ; pcf = pcf->pNext)
		{
		iCoref = getPATRFeatureCoreference(pcf->pValue, pPATR_in);
		if (iCoref != 0)
		{
		bRepeated = repeatedPATRFeatureCoreference(pcf->pValue,
							   pPATR_in);
#ifndef hab125
		sprintf(szCoref, "\"_%d%s.co%d\"",
			iParse_in, pszNodeId_in, iCoref);
#else /* hab125 */
		sprintf(szCoref, "\"_%d%s:co%d\"",
			iParse_in, pszNodeId_in, iCoref);
#endif /* hab125 */
		}
		else
		{
		bRepeated = FALSE;
		szCoref[0] = '\0';
		}
		if (appendToDynString(pdstr, szFBeginTagHead_m, cbFBeginTagHead_m))
		return -1;
		if (store_CDATA(pcf->pszLabel, pdstr))
		return -1;
		if (appendCharToDynString(pdstr, '"'))
		return -1;

		if (bRepeated)
		{
		if (appendToDynString(pdstr, " fVal=", 6))
			return -1;
		if (appendToDynString(pdstr, szCoref, strlen(szCoref)))
			return -1;
		if (appendCharToDynString(pdstr, '>'))
			return -1;
		if (appendToDynString(pdstr, szFEndTag_m, cbFEndTag_m))
			return -1;
		}
		else
		{
		if (appendCharToDynString(pdstr, '>'))
			return -1;
		/* store value */
		pChild = followPATRForwardPointers( pcf->pValue );
		if (	(pChild->eType == PATR_ATOM) ||
			(pChild->eType == PATR_DEFATOM) )
			{
			/* TODO: distinguish <num>, <sym>, <plus/>, <minus/>? */
			if (appendToDynString(pdstr, szStrBeginTagHead_m,
					  cbStrBeginTagHead_m))
			return -1;
			if (iCoref != 0)
			{
			if (appendToDynString(pdstr, " id=", 4))
				return -1;
			if (appendToDynString(pdstr, szCoref, strlen(szCoref)))
				return -1;
			}
			if (appendCharToDynString(pdstr, '>'))
			return -1;
			if (store_PCDATA(pChild->u.pszAtom, pdstr))
			return -1;
			if (appendToDynString(pdstr, szStrEndTag_m, cbStrEndTag_m))
			return -1;
			if (appendToDynString(pdstr, szFEndTag_m, cbFEndTag_m))
			return -1;
			}
		else if (pChild->eType == PATR_FAILFS)
			{
			/* TODO: distinguish <num>, <sym>, <plus/>, <minus/>? */
			if (appendToDynString(pdstr, szStrBeginTagHead_m,
					  cbStrBeginTagHead_m))
			return -1;
			if (iCoref != 0)
			{
			if (appendToDynString(pdstr, " id=", 4))
				return -1;
			if (appendToDynString(pdstr, szCoref, strlen(szCoref)))
				return -1;
			}
			if (appendCharToDynString(pdstr, '>'))
			return -1;
			if (appendToDynString(pdstr, szFAIL_m, cbFAIL_m))
			return -1;
			if (store_PCDATA(pChild->u.pszAtom, pdstr))
			return -1;
			if (appendToDynString(pdstr, szStrEndTag_m, cbStrEndTag_m))
			return -1;
			if (appendToDynString(pdstr, szFEndTag_m, cbFEndTag_m))
			return -1;
			}
		else if (pChild->eType == PATR_NULLFS)
			{
			if (appendToDynString(pdstr, szAnyTagHead_m, cbAnyTagHead_m))
			return -1;
			if (iCoref != 0)
			{
			if (appendToDynString(pdstr, " id=", 4))
				return -1;
			if (appendToDynString(pdstr, szCoref, strlen(szCoref)))
				return -1;
			}
			if (appendToDynString(pdstr, szAnyTagTail_m, cbAnyTagTail_m))
			return -1;
			if (appendToDynString(pdstr, szFEndTag_m, cbFEndTag_m))
			return -1;
			}
		else
			{
			/* must be COMPLEX */
			if (appendToDynString(pdstr, "\n", 1))
			return -1;
			if (appendToDynString(pdstr, szFsBeginTagHead_m,
					  cbFsBeginTagHead_m))
			return -1;
			if (iCoref != 0)
			{
			if (appendToDynString(pdstr, " id=", 4))
				return -1;
			if (appendToDynString(pdstr, szCoref, strlen(szCoref)))
				return -1;
			}
			if (appendToDynString(pdstr, ">\n", 2))
			return -1;
			if (store_xml_feature(pChild, iParse_in, pszNodeId_in,
					  pPATR_in, pdstr))
			return -1;
			if (appendToDynString(pdstr, szFsEndTag_m, cbFsEndTag_m))
			return -1;
			if (appendToDynString(pdstr, szFEndTag_m, cbFEndTag_m))
			return -1;
			}
		}
		}
	break;

	case PATR_NULLFS:
	if (appendToDynString(pdstr, szAnyTagHead_m, cbAnyTagHead_m))
		return -1;
	if (appendToDynString(pdstr, szEmptyTagTail_m, cbEmptyTagTail_m))
		return -1;
	break;

	case PATR_FAILFS:
	/*
	 *  if failure, print fail string:  u.pszAtom contains x/y
	 */
	if (appendToDynString(pdstr, szStrBeginTagHead_m, cbStrBeginTagHead_m))
		return -1;
	if (appendToDynString(pdstr, ">", 1))
		return -1;
	if (appendToDynString(pdstr, szFAIL_m, cbFAIL_m))
		return -1;
	if (store_PCDATA(pFeat->u.pszAtom, pdstr))
		return -1;
	if (appendToDynString(pdstr, szStrEndTag_m, cbStrEndTag_m))
		return -1;
	break;

	default:
	/* should never happen!! */
	if (appendToDynString(pdstr, szERROR_m, cbERROR_m))
		return -1;
	break;
	}
return 0;
}

/*****************************************************************************
 * NAME
 *    store_xml_children
 * DESCRIPTION
 *
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurred
 */
static int store_xml_children(pChildren_in, pTreeFeats_in, iParse_in, pPATR_in,
				  pdstr)
PATREdgeList * pChildren_in;
PATRFeature * pTreeFeats_in;
int iParse_in;
PATRData * pPATR_in;
DynString * pdstr;
{
if (pChildren_in == NULL)
	return 0;

if (pChildren_in->pNext)
	{
	if (store_xml_children(pChildren_in->pNext, pTreeFeats_in, iParse_in,
			   pPATR_in, pdstr))
	return -1;
	}
return store_xml_node(pChildren_in->pEdge, pTreeFeats_in, iParse_in, pPATR_in,
			  pdstr);
}

/*****************************************************************************
 * NAME
 *    store_xml_node
 * DESCRIPTION
 *
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurred
 */
static int store_xml_node(pEdge_in, pTreeFeats_in, iParse_in, pPATR_in, pdstr)
PATREdge * pEdge_in;
PATRFeature * pTreeFeats_in;
int iParse_in;
PATRData * pPATR_in;
DynString * pdstr;
{
char szIndex[64];
char szNodeId[32];
const char * pszAll;
const char * pszFail;
char * pszLexFeatName;
char * pszGlossFeatName;
const char * pszPreGloss;
const char * pszGloss;
const char * pszPostGloss;
const char * pszFeatNodeId;
PATRFeature * pFeat;
PATRFeature * pf;
PATRComplexFeature * pcf;
PATRDisplayedFeature * pSaveMultTop = NULL;
int bFail;

if (pEdge_in == NULL)
	return 0;

sprintf(szNodeId, "_%d", pEdge_in->iIndex);
#ifndef hab125
sprintf(szIndex, "_%d.%s\"", iParse_in, szNodeId);
#else /* hab125 */
sprintf(szIndex, "_%d:%s\"", iParse_in, szNodeId);
#endif /* hab125 */
if (pEdge_in->bPrinted)
	{
	if (appendToDynString(pdstr, szSharedTagHead_m, cbSharedTagHead_m))
	return -1;
	if (appendToDynString(pdstr, szIndex, strlen(szIndex)))
	return -1;
	if (appendToDynString(pdstr, szEmptyTagTail_m, cbEmptyTagTail_m))
	return -1;
	return 0;
	}
pEdge_in->bPrinted = TRUE;
if ((pPATR_in->iParseCount > 1) && (pEdge_in->iCount == pPATR_in->iParseCount))
	{
	pszAll = " all=\"true\"";
	}
else
	{
	pszAll = "";
	}
if (pEdge_in->bFailed)
	{
	pszFail = " fail=\"true\"";
	}
else
	{
	pszFail = "";
	}
if (pTreeFeats_in != NULL)
	{
	pFeat = NULL;
	for ( pcf = pTreeFeats_in->u.pComplex ; pcf ; pcf = pcf->pNext )
	{
	if (pcf->pszLabel == (char *)pEdge_in->iIndex)
		{
		pFeat = pcf->pValue;
		break;
		}
	}
	}
else if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	pFeat = findPATRAttribute(pEdge_in->pFeature,
				  storedPATRString("0", pPATR_in));
	}
else
	{
	pFeat = pEdge_in->pFeature;
	}
if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	if (appendToDynString(pdstr, szNodeTagHead_m, cbNodeTagHead_m))
	return -1;
	if (store_CDATA(pEdge_in->pszLabel, pdstr))
	return -1;
	if (pEdge_in->u.r.pRule->pszID)
	{
	if (appendToDynString(pdstr, szNodeRule_m, cbNodeRule_m))
		return -1;
	if (appendToDynString(pdstr, pEdge_in->u.r.pRule->pszID,
			  strlen(pEdge_in->u.r.pRule->pszID)))
		return -1;
	}
	if (appendToDynString(pdstr, szNodeTagMid_m, cbNodeTagMid_m))
	return -1;
	if (appendToDynString(pdstr, szIndex, strlen(szIndex)))
	return -1;
	if (appendToDynString(pdstr, pszAll, strlen(pszAll)))
	return -1;
	if (appendToDynString(pdstr, pszFail, strlen(pszFail)))
	return -1;
	if (appendToDynString(pdstr, szBeginTagTail_m, cbBeginTagTail_m))
	return -1;
	if (pFeat == NULL)
	{
	if (pPATR_in->bUnification)
		{
		if (appendToDynString(pdstr, szNoFeature_m, cbNoFeature_m))
		return -1;
		}
	}
	else
	{
	if (appendToDynString(pdstr, szFsBeginTagHead_m, cbFsBeginTagHead_m))
		return -1;
	if (appendToDynString(pdstr, ">\n", 2))
		return -1;
	if (pTreeFeats_in == NULL)
		{
		pSaveMultTop = pPATR_in->pMem->pMultTop;
		markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		checkPATRFeatureCoreferences(pFeat, pPATR_in);
		pszFeatNodeId = szNodeId;
		}
	else
		{
		pszFeatNodeId = "";
		}
	bFail = store_xml_feature(pFeat, iParse_in, pszFeatNodeId, pPATR_in,
				  pdstr);
	if (pTreeFeats_in == NULL)
		{
		collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		pPATR_in->pMem->pMultTop = pSaveMultTop;
		}
	if (bFail)
		return -1;
	if (appendToDynString(pdstr, szFsEndTag_m, cbFsEndTag_m))
		return -1;
	}
	if (store_xml_children(pEdge_in->u.r.pChildren, pTreeFeats_in, iParse_in,
			   pPATR_in, pdstr))
	return -1;
	if (appendToDynString(pdstr, szNodeEndTag_m, cbNodeEndTag_m))
	return -1;
	}
else if (pEdge_in->eType == PATR_LEXICAL_EDGE)
	{
	if (pPATR_in->pGrammar != NULL)
	{
	pszLexFeatName   = pPATR_in->pGrammar->pszLexFeatName;
	pszGlossFeatName = pPATR_in->pGrammar->pszGlossFeatName;
	}
	else
	{
	pszLexFeatName   = storedPATRString( "lex", pPATR_in);
	pszGlossFeatName = storedPATRString( "gloss", pPATR_in);
	}
	pszPreGloss  = "";
	pszGloss     = "";
	pszPostGloss = "";
	if (pPATR_in->bGloss && pPATR_in->bGlossesExist)
	{
	/* point to word gloss */
	pf = findPATRAttribute(pEdge_in->pFeature, pszGlossFeatName);
	if (pf != NULL && pf->eType == PATR_ATOM)
		{
		pszPreGloss  = " gloss=\"";
		pszGloss     = pf->u.pszAtom;
		pszPostGloss = "\"";
		}
	}
	if (appendToDynString(pdstr, szLeafTagHead_m, cbLeafTagHead_m))
	return -1;
	if (store_CDATA(pEdge_in->pszLabel, pdstr))
	return -1;
	if (appendToDynString(pdstr, szNodeTagMid_m, cbNodeTagMid_m))
	return -1;
	if (appendToDynString(pdstr, szIndex, strlen(szIndex)))
	return -1;
	if (appendToDynString(pdstr, pszAll, strlen(pszAll)))
	return -1;
	if (appendToDynString(pdstr, pszFail, strlen(pszFail)))
	return -1;
	if (appendToDynString(pdstr, pszPreGloss, strlen(pszPreGloss)))
	return -1;
	if (store_CDATA(pszGloss, pdstr))
	return -1;
	if (appendToDynString(pdstr, pszPostGloss, strlen(pszPostGloss)))
	return -1;
	if (appendToDynString(pdstr, szBeginTagTail_m, cbBeginTagTail_m))
	return -1;
	if (pFeat == NULL)
	{
	if (pPATR_in->bUnification)
		{
		if (appendToDynString(pdstr, szNoFeature_m, cbNoFeature_m))
		return -1;
		}
	}
	else
	{
	if (appendToDynString(pdstr, szFsBeginTagHead_m, cbFsBeginTagHead_m))
		return -1;
	if (appendToDynString(pdstr, ">\n", 2))
		return -1;
	if (pTreeFeats_in == NULL)
		{
		pSaveMultTop = pPATR_in->pMem->pMultTop;
		markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		checkPATRFeatureCoreferences(pFeat, pPATR_in);
		pszFeatNodeId = szNodeId;
		}
	else
		{
		pszFeatNodeId = "";
		}
	bFail = store_xml_feature(pFeat, iParse_in, pszFeatNodeId, pPATR_in,
				  pdstr);
	if (pTreeFeats_in == NULL)
		{
		collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		pPATR_in->pMem->pMultTop = pSaveMultTop;
		}
	if (bFail)
		return -1;
	if (appendToDynString(pdstr, szFsEndTag_m, cbFsEndTag_m))
		return -1;
	}
	if ((pEdge_in->pFeature == NULL) || (pTreeFeats_in == NULL))
	{
	if (pPATR_in->bUnification)
		{
		if (appendToDynString(pdstr, szNoLexFeature_m, cbNoLexFeature_m))
		return -1;
		}
	}
	else
	{
	if (appendToDynString(pdstr, szLexFsBeginTagHead_m, cbLexFsBeginTagHead_m))
		return -1;

	if (appendToDynString(pdstr, ">\n", 2))
		return -1;

	pSaveMultTop = pPATR_in->pMem->pMultTop;
	markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	checkPATRFeatureCoreferences(pEdge_in->pFeature, pPATR_in);

	bFail = store_xml_feature(pEdge_in->pFeature, iParse_in, szNodeId,
				  pPATR_in, pdstr);

	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	pPATR_in->pMem->pMultTop = pSaveMultTop;

	if (bFail)
		return -1;

	if (appendToDynString(pdstr, szLexFsEndTag_m, cbLexFsEndTag_m))
		return -1;

	}
	if (appendToDynString(pdstr, szStrBeginTagHead_m, cbStrBeginTagHead_m))
	return -1;
	if (appendCharToDynString(pdstr, '>'))
	return -1;
	pf = findPATRAttribute(pEdge_in->pFeature, pszLexFeatName);
	if ((pf != NULL) && (pf->eType == PATR_ATOM))
	{
	if (store_PCDATA(pf->u.pszAtom, pdstr))
		return -1;
	}
	else
	{
	if (store_PCDATA(pEdge_in->u.l.pszTerminal, pdstr))
		return -1;
	}
	if (appendToDynString(pdstr, szStrEndTag_m, cbStrEndTag_m))
	return -1;
	if (appendCharToDynString(pdstr, '\n'))
	return -1;
	if (appendToDynString(pdstr, szLeafEndTag_m, cbLeafEndTag_m))
	return -1;
	}
return 0;
}

/*****************************************************************************
 * NAME
 *    convertPATRParsesToXML
 * DESCRIPTION
 *
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurred
 */
static int convertPATRParsesToXML(pParses_in, pPATR_in, pszSentence_in,
				  ppszBuffer_out)
PATREdgeList * pParses_in;
PATRData *     pPATR_in;
const char *   pszSentence_in;
char **        ppszBuffer_out;
{
int iSaveFeatureDisplay;
int iSaveParseCount;
int iSaveCurrentIndex;
char szOpenTag[80];
PATREdgeList * pel;
int count;
const char * pszFail = "";
PATRFeature * pParseFeatures;
DynString dstr;
int iRetVal;
int bUnifiedParseFeatures;

if (ppszBuffer_out == NULL)
	return -1;
*ppszBuffer_out = NULL;
if (pPATR_in == NULL)
	return -1;
if (pParses_in == NULL)
	return 0;

dstr.pszBuffer = NULL;
dstr.cbLen = 0;
dstr.cbAlloc = 0;
dstr.bError = FALSE;
iSaveFeatureDisplay = pPATR_in->iFeatureDisplay;
iSaveParseCount     = pPATR_in->iParseCount;
iSaveCurrentIndex   = pPATR_in->iCurrentIndex;
/*
 *  count number of parses and set the fail attribute string
 */
pPATR_in->iParseCount = 0;
for ( pel = pParses_in ; pel ; pel = pel->pNext )
	{
	++pPATR_in->iParseCount;
	if (failedPATRParse(pel->pEdge))
	{
	pszFail = " fail=\"true\"";
	}
	}

#ifndef hab124
sprintf(szOpenTag, "<Analysis count=\"%d\"%s>\n",
	pPATR_in->iParseCount, pszFail);
#else
if (appendToDynString(&dstr, szXmlHeader_m, strlen(szXmlHeader_m)))
	return -1;

sprintf(szOpenTag, "<analysis count=\"%d\"%s>\n",
	pPATR_in->iParseCount, pszFail);
#endif /* hab124 */
if (appendToDynString(&dstr, szOpenTag, strlen(szOpenTag)))
	return -1;

iRetVal = 0;
for ( count = 0, pel = pParses_in ; pel != NULL ; pel = pel->pNext )
	{
	/* limit number of parses written to output */
	if (++count > pPATR_in->iMaxAmbiguities)
	continue;
	pParseFeatures = NULL;
	bUnifiedParseFeatures = FALSE;
	if (    (pPATR_in->iFeatureDisplay & PATR_FEATURE_ALL) ||
		(pPATR_in->eTreeDisplay == PATR_XML_TREE) )
	{
	if (	!failedPATRParse(pel->pEdge) &&
		(pel->pEdge->pFeature != NULL) )
		{
		markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		pParseFeatures = unifyPATRParseTreeFeatures(pel->pEdge, NULL,
							pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		checkPATRFeatureCoreferences(pParseFeatures, pPATR_in);
		bUnifiedParseFeatures = TRUE;
		}
	}
	markPATRParseUnprinted(pel->pEdge);
	if (appendToDynString(&dstr, szParseBeginTag_m, cbParseBeginTag_m))
	{
	iRetVal = -1;
	break;
	}
	if (store_xml_node(pel->pEdge, pParseFeatures, count, pPATR_in, &dstr))
	{
	iRetVal = -1;
	break;
	}
	if (appendToDynString(&dstr, szParseEndTag_m, cbParseEndTag_m))
	{
	iRetVal = -1;
	break;
	}
	if (bUnifiedParseFeatures)
	{
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	}
	}
if (iRetVal == 0)
	{
	if (appendToDynString(&dstr, szCloseTag_m, cbCloseTag_m))
	iRetVal = -1;
	}
/*
 *  restore previous values
 */
pPATR_in->iFeatureDisplay = iSaveFeatureDisplay;
pPATR_in->iParseCount     = iSaveParseCount;
pPATR_in->iCurrentIndex   = iSaveCurrentIndex;

if (dstr.bError)
	iRetVal = -1;
if (iRetVal == 0)
	*ppszBuffer_out = dstr.pszBuffer;
else if (dstr.pszBuffer != NULL)
	freeMemory(dstr.pszBuffer);

return iRetVal;
}
