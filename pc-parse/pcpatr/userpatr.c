/* USERPATR.C - PC-PATR output functions
 ******************************************************************************
 *
 * void showPATRFeature(PATRFeature * x,
 *			int indent,
 *			PATRData * pPATR_in)
 *
 * void writePATRFeatureToLog(PATRFeature * x,
 *			      int indent,
 *			      int bSilent_in,
 *			      PATRData * pPATR_in)
 *
 * void writePATRFlatParseTree(PATREdgeList * pParse_in,
 *			       FILE * pOutputFP_in,
 *			       PATRData * pPATR_in)
 *
 * PATRFeature * unifyPATRParseTreeFeatures(PATREdge * pEdge_in,
 *					    PATRFeature * pTreeFeats_in,
 *					    PATRData * pPATR_in)
 *
 * void writePATRFeature(PATRFeature * featp,
 *			 FILE * pOutputFP_in,
 *			 int indent,
 *			 PATRData * pPATR_in)
 *
 * void writePATRParseFeatures(PATREdgeList * parses,
 *			       FILE * pOutputFP_in,
 *			       PATRData * pPATR_in)
 *
 * void writePATRParses(PATREdgeList * parses,
 *			FILE * pOutputFP_in,
 *                      WordTemplate ** ppWords_in,
 *			PATRData * pPATR_in)
 *
 ******************************************************************************
 * Copyright 1989, 2000 by SIL International.  All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
/*
 *  local function prototypes
 */
static int only_null P((PATRFeature *feat));
static int show_feat_flat P((PATRFeature * x,
				 int length,
				 PATRData * pPATR_in));
static void show_feat_indent P((PATRFeature * x,
				int indent,
				int level,
				PATRData * pPATR_in));
static void check_treenode P((PATREdge * edgep,
				  int depth,
				  PATRData * pPATR_in));
static void print_treenode P((PATREdge * edgep,
				  int depth,
				  PATRData * pPATR_in));
static void print_treeline P((PATREdge * edgep,
				  int depth,
				  PATRData * pPATR_in));
static void lcvert_tree P((PATREdge * edgep, PATRData * pPATR_in));
static void print_feat P((PATREdge * edgep, int depth, PATRData * pPATR_in));
static void output_word P((PATREdge * edgep, PATRData * pPATR_in));
static void output_word_children P((PATREdgeList * edge_listp,
					PATRData * pPATR_in));
static void display_indented_tree P((PATREdge * pParse_in,
					 FILE * pOutputFP_in,
					 PATRData * pPATR_in));
static void write_xml_char_data P((const char * pszString_in,
				   FILE * pOutFP_in,
				   int bCDATA_in));
#define write_PCDATA(in, out) write_xml_char_data(in, out, FALSE)
#define write_CDATA(in, out) write_xml_char_data(in, out, TRUE)
static void write_xml_feature P((PATRFeature * pFeature_in,
				 int iParse_in,
				 const char * pszNodeId_in,
				 FILE * pOutputFP_in,
				 int iIndent_in,
				 PATRData * pPATR_in));
static void write_xml_children P((PATREdgeList * pChildren_in,
				  PATRFeature * pTreeFeats_in,
				  int iParse_in,
				  FILE * pOutFP_in,
				  int iIndent_in,
				  PATRData * pPATR_in));
static void write_xml_node P((PATREdge * pEdge_in,
				  PATRFeature * pTreeFeats_in,
				  int iParse_in,
				  FILE * pOutputFP_in,
				  int iIndent_in,
				  PATRData * pPATR_in));
static void write_xml_parse P((PATREdge * pParse_in,
				   PATRFeature * pTreeFeats_in,
				   int iParse_in,
				   FILE * pOutputFP_in,
				   PATRData * pPATR_in));
static PATRFeature * unify_tree_children_features P((PATREdgeList * pEdges_in,
						   PATRFeature * pTreeFeats_in,
							 PATRData * pPATR_in));

static void write_parse_tree_children_features P((PATREdgeList * pEdges_in,
						  FILE * pOutputFP_in,
						  PATRFeature * pTreeFeats_in,
						  PATRData * pPATR_in));
static void write_parse_tree_features P((PATREdge * pEdge_in,
					 FILE * pOutputFP_in,
					 PATRFeature * pTreeFeats_in,
					 PATRData * pPATR_in));
static void writeANAWordInfoAsXML P((WordTemplate **ppWords_in,
					 FILE *pOutputFP_in,
					 TextControl *pTextControl_in));
static void WriteWordCat P((char *pszCat,
				FILE* pOutputFP_in));
static void WriteWordAnalysisAsXml P((WordAnalysis *pAnal,
					  FILE *pOutputFP_in,
					  TextControl *pTextControl_in,
					  int iWord_in,
					  int iParse_in));
static void WriteAnalysisSubpartAsXml P((char **pszItem,
					 unsigned char cBreak,
					 char *pszElement,
					 char *pszId,
					 FILE *pOutputFP_in,
					 int iWord_in,
					 int iParse_in,
					 int iMorph_in));

#ifdef applec
#pragma segment S_userpatr
#endif
static const char szWhitespace_m[7] = " \t\r\n\f\v";

/*****************************************************************************
 * NAME
 *    only_null
 * ARGUMENTS
 *    feat - pointer to a PATRFeature structure
 * DESCRIPTION
 *    check whether this feature is a NULLFS, or contains only NULLFS features
 * RETURN VALUE
 *    TRUE if NULLFS (or contains only NULLFS), FALSE otherwise
 */
static int only_null(feat)
PATRFeature *feat;
{
PATRComplexFeature *featp;

if (feat == (PATRFeature *)NULL)
	return( TRUE );
feat = followPATRForwardPointers( feat );		/* Follow pointers */
if (feat->eType == PATR_NULLFS)
	return( TRUE );
if (feat->eType == PATR_COMPLEX)
	{
	for ( featp = feat->u.pComplex ; featp ; featp = featp->pNext)
	{
	if (!only_null(featp->pValue))
		return( FALSE );
	}
	return( TRUE );
	}
return( FALSE );
}

/***************************************************************************
 * NAME
 *    show_feat_flat
 * ARGUMENTS
 *    x      - feature structure to show
 *    length - length of the line printed so far
 * DESCRIPTION
 *    Display the contents of a feature structure as a flat, linear string.
 * RETURN VALUE
 *    length of the line printed thus far
 */
static int show_feat_flat( x, length, pPATR_in )
PATRFeature *	x;
int		length;
PATRData *	pPATR_in;
{
int			n;
int			iCoref;
int			bRepeated;
PATRComplexFeature *	flist;			/* Temp feature list */
char			buffer[80];
FILE * fp = pPATR_in->pMem->pPrintsFP ? pPATR_in->pMem->pPrintsFP : stdout;

x = followPATRForwardPointers( x );		/* Follow pointers */

if ( x->eType == PATR_FAILFS )		/* If failure, print fail string */
	{
	n = strlen(x->u.pszAtom) + 5;
	if (length + n >= 80)
	{
	fprintf(fp,"\n          ");
	length = 10;
	}
	fprintf(fp,"FAIL %s", x->u.pszAtom);	/* This contains x/y */
	length += n;
	return( length );
	}

if (x->eType == PATR_ATOM)
	{						/* If atom */
	n = strlen(x->u.pszAtom) + 1;
	if (length + n >= 80)
	{
	fprintf(fp,"\n          ");
	length = 10;
	}
	fprintf(fp,"%s ", x->u.pszAtom);		/* Print it */
	length += n;
	}
else if (x->eType == PATR_DEFATOM)
	{						/* If default atom */
	n = strlen(x->u.pszAtom) + 2;
	if (length + n >= 80)
	{
	fprintf(fp,"\n          ");
	length = 10;
	}
	fprintf(fp,"!%s ", x->u.pszAtom);		/* Print it */
	length += n;
	}
else
	{						/* x is complex or null */
	iCoref = getPATRFeatureCoreference(x, pPATR_in);
	if (iCoref != 0)
	{					/* If used multiple */
	sprintf(buffer, "$%d", iCoref);
	n = strlen(buffer);
	if (length + n + 1 >= 80)
		{
		fprintf(fp,"\n          ");
		length = 10;
		}
	fprintf(fp,"%s", buffer);		/* Print ref number with $ */
	length += n;
	bRepeated = repeatedPATRFeatureCoreference( x, pPATR_in );
	}
	else
	bRepeated = FALSE;
	if (bRepeated && (pPATR_in->iFeatureDisplay & PATR_FEATURE_ONCE))
	{
	fprintf(fp," ");		/* already seen, add space */
	++length;
	}
	else
	{					/* If not already seen */
	if ( x->eType == PATR_NULLFS )
		{
		if (!(pPATR_in->iFeatureDisplay & PATR_FEATURE_TRIM))
		{
		if (length + 3 >= 80)
			{
			fprintf(fp,"\n          ");
			length = 10;
			}
		fprintf(fp,"[] ");
		length += 3;
		}
		}
	else
		{					/* Else (complex) print it */
		if (length + 2 >= 80)
		{
		fprintf(fp,"\n          ");
		length = 10;
		}
		fprintf(fp,"[ ");			/* Print open bracket */
		length += 2;
		sortPATRComplexFeature(x->u.pComplex, pPATR_in->pGrammar,
				   pPATR_in);
		for ( flist = x->u.pComplex ; flist ; flist = flist->pNext)
		{				/* For each feat */
		if (	(pPATR_in->iFeatureDisplay & PATR_FEATURE_TRIM) &&
			only_null(flist->pValue) )
			continue;
		n = strlen(flist->pszLabel) + 1;
		if (length + n >= 80)
			{
			fprintf(fp,"\n          ");
			length = 10;
			}
		fprintf(fp,"%s:", flist->pszLabel);	/* Print label */
		length += n;
						/* Print value */
		length = show_feat_flat(flist->pValue, length, pPATR_in);
		} /* for */
		if (length + 2 >= 80)
		{
		fprintf(fp,"\n          ");
		length = 10;
		}
		fprintf(fp,"] ");			/* Print close bracket */
		length += 2;
		} /* else (complex) */
	} /* else (visited multiple times) */
	} /* else (complex or null) */
return( length );
}

/***************************************************************************
 * NAME
 *    show_feat_indent
 * ARGUMENTS
 *    x     - feature structure to show
 *    level - level to indent
 * DESCRIPTION
 *    Display the contents of a feature structure.
 * RETURN VALUE
 *    none
 */
static void show_feat_indent( x, indent, level, pPATR_in )
PATRFeature *	x;
int		indent;
int		level;
PATRData *	pPATR_in;
{
int			n;
int			iCoref;
int			bRepeated;
int			lablen;
int			first;
PATRComplexFeature *	flist;			/* Temp feature list */
FILE * fp = pPATR_in->pMem->pPrintsFP ? pPATR_in->pMem->pPrintsFP : stdout;

x = followPATRForwardPointers( x );		/* Follow pointers */
if (x == NULL)
	{
	fprintf(fp,"NULL");
	return;
	}

if ( x->eType == PATR_FAILFS )		/* If failure, print fail string */
	{
	fprintf(fp,"FAIL %s", x->u.pszAtom);	/* This contains x/y */
	return;
	}

if (x->eType == PATR_ATOM)
	{					/* If atom, print it */
	fprintf(fp, "%s", x->u.pszAtom);
	}
else if (x->eType == PATR_DEFATOM)
	{					/* If default atom, print it */
	fprintf(fp, "!%s", x->u.pszAtom);
	}
else
	{						/* x is complex or null */
	iCoref = getPATRFeatureCoreference(x, pPATR_in);
	if (iCoref != 0)
	{					/* If used multiple */
	fprintf(fp,"$%d", iCoref);		/* Print ref number with $ */
	bRepeated = repeatedPATRFeatureCoreference( x, pPATR_in );
	}
	else
	{
	if (level)
		fprintf(fp,"  ");			/* Else print 2 spaces */
	bRepeated = FALSE;
	}
	if (!bRepeated || !(pPATR_in->iFeatureDisplay & PATR_FEATURE_ONCE))
	{					/* If not already seen */
	if (	!(pPATR_in->iFeatureDisplay & PATR_FEATURE_TRIM) &&
		 (x->eType == PATR_NULLFS))
			fprintf(fp,"[]");
	else
		{					/* Else (complex) print it */
		first = TRUE;
		fprintf(fp,"[ ");			/* Print open bracket */
		sortPATRComplexFeature(x->u.pComplex, pPATR_in->pGrammar,
				   pPATR_in);
		for (flist = x->u.pComplex ; flist ; flist = flist->pNext)
		{				/* For each feat */
		if (	(pPATR_in->iFeatureDisplay & PATR_FEATURE_TRIM) &&
			only_null(flist->pValue) )
			continue;
		if ( !first )
			{
			fprintf(fp,"\n  ");		/* Start new line */
			for ( n = indent; n; n--)	/* Do left margin */
			fprintf(fp," ");
			for ( n = level; n; n--)	/* Do indent */
			fprintf(fp,"           "); /* 11 each nesting level */
			}
		first = FALSE;

		fprintf(fp,"%s:", flist->pszLabel); /*Print label and colon */
		lablen = strlen( flist->pszLabel ) + 3;	/* Align from label */
		if ( lablen < 9 )
			{
			for ( n = 9 - lablen; n; n-- )
			fprintf(fp," ");
			}
						/* Print value */
		show_feat_indent( flist->pValue, indent, level + 1, pPATR_in );
		} /* for */
		fprintf(fp," ]");			/* Print close bracket */
		} /* else (complex) */
	} /* if (not visited multiple times) */
	} /* else (complex or null) */
}

/***************************************************************************
 * NAME
 *    showPATRFeature
 * ARGUMENTS
 *    x      - feature structure to show
 *    indent - amount to indent
 * DESCRIPTION
 *    Display the contents of a feature structure indented nicely.
 * RETURN VALUE
 *    none
 */
void showPATRFeature( x, indent, pPATR_in )
PATRFeature *x;
int indent;
PATRData *	pPATR_in;
{
int bSetCoref = FALSE;

if ((!pPATR_in->bUnification && !pPATR_in->bFailure) || (x == NULL))
	return;
if (pPATR_in->pMem->pMultTop == NULL)
	{
	/* Check for multiple refs */
	bSetCoref = TRUE;
	markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	checkPATRFeatureCoreferences( x, pPATR_in );
	}
if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
	{
	show_feat_flat( x, indent, pPATR_in );
	}
else
	{
	/* Show indented at level 0 */
	show_feat_indent( x, indent, 0, pPATR_in);
	}
/* Space after */
fprintf(pPATR_in->pMem->pPrintsFP == NULL ? stdout : pPATR_in->pMem->pPrintsFP,
	"\n");
if (bSetCoref)
	{
	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	}
}

/***************************************************************************
 * NAME
 *    writePATRFeatureToLog
 * ARGUMENTS
 *    x      - feature structure to show
 *    indent - amount to indent
 * DESCRIPTION
 *    Display the contents of a feature structure indented nicely.
 * RETURN VALUE
 *    none
 */
void writePATRFeatureToLog(x, indent, bSilent_in, pPATR_in)
PATRFeature *	x;
int		indent;
int		bSilent_in;
PATRData *	pPATR_in;
{
FILE *old_printsfp;
int old_trim;
int bSetCoref = FALSE;

if (x == NULL)
	return;
if (pPATR_in->pMem->pMultTop == NULL)
	{
	/* Check for multiple refs */
	bSetCoref = TRUE;
	markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	checkPATRFeatureCoreferences( x, pPATR_in );
	}
old_printsfp = pPATR_in->pMem->pPrintsFP;
old_trim = pPATR_in->iFeatureDisplay & PATR_FEATURE_TRIM;
pPATR_in->iFeatureDisplay &= ~PATR_FEATURE_TRIM;
if (pPATR_in->pLogFP != (FILE *)NULL)
	{
	pPATR_in->pMem->pPrintsFP = pPATR_in->pLogFP;
	if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
	{
	show_feat_flat( x, indent, pPATR_in );
	}
	else
	{
	/* Show indented at level 0 */
	show_feat_indent( x, indent, 0, pPATR_in);
	}
	fprintf(pPATR_in->pLogFP, "\n");		/* Space after */
	}
if (!bSilent_in)
	{
	pPATR_in->pMem->pPrintsFP = stdout;
	if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
	{
	show_feat_flat( x, indent, pPATR_in );
	}
	else
	{
	/* Show indented at level 0 */
	show_feat_indent( x, indent, 0, pPATR_in);
	}
	fprintf(stdout, "\n");		/* Space after */
	}
pPATR_in->iFeatureDisplay |= old_trim;
pPATR_in->pMem->pPrintsFP = old_printsfp;
if (bSetCoref)
	{
	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	}
}

/*
 *    These routines combine the ideas from the original vertical
 *    tree routines from the RTN parser (Alan B) and the output routine from
 *    the chart parser (Jim Skon).
 *
 *                        S
 *                        |
 *                ------------------
 *                NP               VP
 *                |                |
 *                PN               V
 *               Tom              ran
 */

#define FILL_TO(x, y)  for ( ; pPATR_in->pMem->iNextPosition <= x; \
	++pPATR_in->pMem->iNextPosition) \
		fprintf(fp, y)

/*****************************************************************************
 * NAME
 *    calcPATRFullTreePos
 * ARGUMENTS
 *    edgep -
 *    depth -
 * DESCRIPTION
 *    Calculate position of symbol in tree
 * RETURN VALUE
 *    none
 */
void calcPATRFullTreePos( edgep, depth, pPATR_in)
PATREdge *edgep;
int depth;
PATRData * pPATR_in;
{
PATREdgeList * edge_listp;
int len1, len2;

if ((edgep->eType == PATR_LEXICAL_EDGE) || (edgep->u.r.pChildren == NULL))
	{
	/* Calculate length of category including numeric index (if any)
	 */
	len1 = strlen(edgep->pszLabel) + 1;
	if (edgep->iIndex > 0)
	len1 += 2;
	if (edgep->iIndex > 9)
	len1 += 1;
	if (edgep->iIndex > 99)
	len1 += 1;
	/*
	 *  make sure there is enough room for at least a category name of xxx_nn
	 *  somewhere further up the tree.  TODO: this stuff will break if people
	 *  use long category name, need to prescan tree for category name lengths
	 */
	if (len1 < 7)
	len1 = 7;
	/*
	 *  Calculate length of word;  use longest length of word, category, or
	 *  gloss
	 */
	if (edgep->eType == PATR_LEXICAL_EDGE)
	{
	len2 = strlen(edgep->u.l.pszTerminal) + 1;
	if (len2 > len1)
		len1 = len2;
	len2 = strlen(getPATRNodeGloss(edgep, pPATR_in)) + 1;
	if (len2 > len1)
		len1 = len2;
	}
	else
	len2 = 0;

	edgep->iCenterColumn = pPATR_in->pMem->iNextPosition + (len1)/2 - 1;
	pPATR_in->pMem->iNextPosition += len1;
	}
else
	{
	/* For rule edges, center position is average of center position
	 * of leftmost and rightmost child.
	 */
	for (    edge_listp = edgep->u.r.pChildren ;
			 edge_listp->pNext ;
			 edge_listp = edge_listp->pNext )
	;				 /* find leftmost child */
	edgep->iCenterColumn = (edgep->u.r.pChildren->pEdge->iCenterColumn +
							 edge_listp->pEdge->iCenterColumn) / 2;
	}
edgep->iCurrentRow = 2*depth - 2;
}

/*****************************************************************************
 * NAME
 *    check_treenode
 * DESCRIPTION
 *    Check that the label and gloss at each tree node is not too long.
 * RETURN VALUE
 *    none
 */
static void check_treenode(edgep, depth, pPATR_in)
PATREdge * edgep;
int depth;
PATRData * pPATR_in;
{
FILE * fp = NULL;
char * pszGloss;
/*
 *  get the best output file possible for warning messages
 */
fp = pPATR_in->pLogFP;
if (fp == NULL)
	fp = pPATR_in->pMem->pPrintsFP;
if (fp == NULL)
	fp = stdout;

if (strlen(edgep->pszLabel) > 72)
	{
	fprintf(fp,
	"Warning: tree node label is too long and will probably be truncated.\n");
	fprintf(fp, "    Label = \"%s\".\n", edgep->pszLabel);
	}
pszGloss = getPATRNodeGloss(edgep, pPATR_in);
if (strlen(pszGloss) > 79)
	{
	fprintf(fp,
		"Warning: tree node gloss is too long and will be truncated.\n");
	fprintf(fp, "    Gloss = \"%s\".\n", pszGloss);
	}
}

/*****************************************************************************
 * NAME
 *    print_treenode
 * ARGUMENTS
 *    edgep -
 *    depth -
 * DESCRIPTION
 *    Print node of tree at depth
 * RETURN VALUE
 *    none
 */
static void print_treenode( edgep, depth, pPATR_in )
PATREdge * edgep;
int depth;
PATRData * pPATR_in;
{
int len;
int left_pos;
#define MAX_NAME_SIZE 80
char szName[MAX_NAME_SIZE+1];
FILE * fp = pPATR_in->pMem->pPrintsFP ? pPATR_in->pMem->pPrintsFP : stdout;

if (pPATR_in->pMem->iPrintDepth == depth)
	{
	/* print only at current tree depth */
	/* Form name of edge including index if present */
	strncpy(szName, edgep->pszLabel, MAX_NAME_SIZE);
	szName[MAX_NAME_SIZE] = NUL;
	if (edgep->iIndex != 0)
	{
	char szIndex[20];
	sprintf(szIndex, "_%d", edgep->iIndex);
		strncat(szName, szIndex, sizeof(szName) - strlen(szName) - 1);
	}
	if (    (pPATR_in->iParseCount > 1) &&
		(edgep->iCount == pPATR_in->iParseCount) )
	strncat(szName, "+", sizeof(szName) - strlen(szName) - 1);
	if (edgep->bFailed)
		strncat(szName, "-", sizeof(szName) - strlen(szName) - 1);
	/*
	 *  Print edge name
	 */
	len = strlen(szName);
	left_pos = edgep->iCenterColumn - len/2;
	FILL_TO(left_pos, " ");

	fprintf(fp, "%s ", szName);
	pPATR_in->pMem->iNextPosition += len + 1;
	}
else if (pPATR_in->pMem->iPrintDepth == depth+1)
	{
	if (    (edgep->eType == PATR_LEXICAL_EDGE) &&
		pPATR_in->bGloss                   &&
		pPATR_in->bGlossesExist )
	{
	/* Print word gloss */
	strncpy(szName, getPATRNodeGloss(edgep, pPATR_in), MAX_NAME_SIZE);
	szName[MAX_NAME_SIZE] = NUL;
	len = strlen(szName);
	left_pos = edgep->iCenterColumn - len/2;
	FILL_TO(left_pos, " ");
	fprintf(fp, "%s ", szName);
	pPATR_in->pMem->iNextPosition += len + 1;
	}
	}
}

/*****************************************************************************
 * NAME
 *    print_treeline
 * ARGUMENTS
 *    edgep -
 *    depth -
 * DESCRIPTION
 *    Print line of tree at depth
 * RETURN VALUE
 *    none
 */
static void print_treeline( edgep, depth, pPATR_in )
PATREdge *edgep;
int depth;
PATRData * pPATR_in;
{
int len;
int left_pos, center_pos, right_pos;
PATREdgeList *edge_listp;
char *leaf;
FILE * fp = pPATR_in->pMem->pPrintsFP ? pPATR_in->pMem->pPrintsFP : stdout;

if (pPATR_in->pMem->iPrintDepth != depth)    /* only print at current depth */
	return;

if ((edgep->eType == PATR_LEXICAL_EDGE) || (edgep->u.r.pChildren == NULL))
	{
	/*  If this is a lexical edge, print the corresponding word.
	 */
	if (edgep->eType == PATR_LEXICAL_EDGE)
	{
	if (edgep->u.l.pszTerminal == (char *)NULL)
		leaf = (char *)"";
	else
		leaf = edgep->u.l.pszTerminal;
	}
	else
	leaf = "0";

	len = strlen(leaf);
	left_pos = edgep->iCenterColumn - len/2;
	FILL_TO(left_pos, " ");

	fprintf(fp, "%s ", leaf);
	pPATR_in->pMem->iNextPosition += len + 1;
	}
else
	{
	/*  For rule edge, find the centers of the left and rightmost
	 *  children, print tree edge spanning this gap.
	 */
	for (    edge_listp = edgep->u.r.pChildren ;
			 edge_listp->pNext ;
			 edge_listp = edge_listp->pNext )
	;
	right_pos = edgep->u.r.pChildren->pEdge->iCenterColumn;
	left_pos = edge_listp->pEdge->iCenterColumn;
	center_pos = edgep->iCenterColumn;

	FILL_TO(left_pos, " ");
	FILL_TO(center_pos, "_");
	fprintf(fp, "|");
	++pPATR_in->pMem->iNextPosition;
	FILL_TO(right_pos+1, "_");
	}
pPATR_in->pMem->bMoreTree = 1;	/* make sure print iterates one more level */
}

/*****************************************************************************
 * NAME
 *    lcvert_tree
 * ARGUMENTS
 *    edgep -
 * DESCRIPTION
 *    Output a successful parse as a full tree
 * RETURN VALUE
 *    none
 */
static void lcvert_tree( edgep, pPATR_in )
PATREdge *	edgep;
PATRData *	pPATR_in;
{
FILE * fp = pPATR_in->pMem->pPrintsFP ? pPATR_in->pMem->pPrintsFP : stdout;
/*
 *  Calculate horizontal positions for tree edges.  We must do
 *  this with POSTORDER since position of a parent is determined
 *  by the children.
 */
pPATR_in->pMem->iNextPosition = 1;
visitPATRTree(edgep, 1, PATR_POSTORDER, calcPATRFullTreePos, pPATR_in);
/*
 *  The following loop iterates through all the levels of the tree.
 *  We visit all the nodes of the tree during each iteration but
 *  we only print those at the current level.  (This is not very
 *  efficient but using the standard tree visiting routines IMHO
 *  increases the likelihood that the code will be correct and
 *  eases maintenance.  I don't think display routines will be
 *  critical path items with regard to execution time anyway.)
 */
for ( pPATR_in->pMem->iPrintDepth = 1 ;; ++pPATR_in->pMem->iPrintDepth )
	{
	/* pPATR_in->pMem->bMoreTree is set by print_treeline() */
	pPATR_in->pMem->bMoreTree = 0;
	/* Init next pos and current depth */
	pPATR_in->pMem->iNextPosition = 1;
	visitPATRTree(edgep, 1, PATR_POSTORDER, check_treenode, pPATR_in);

	pPATR_in->pMem->iNextPosition = 1;
	visitPATRTree(edgep, 1, PATR_POSTORDER, print_treenode, pPATR_in);
	fprintf(fp,"\n");
	/* Init next pos and current depth */
	pPATR_in->pMem->iNextPosition = 1;
	visitPATRTree(edgep, 1, PATR_POSTORDER, print_treeline, pPATR_in);
	if (pPATR_in->pMem->bMoreTree)
	fprintf(fp,"\n");
	else
	break;			/* no more tree to print */
	}
}

/*****************************************************************************
 * NAME
 *    print_feat
 * ARGUMENTS
 *    edgep -
 *    depth -
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void print_feat(edgep, depth, pPATR_in)
PATREdge * edgep;
int depth;
PATRData * pPATR_in;
{
char buffer[80];
int k;
PATRFeature *	pFeat;
FILE * fp = pPATR_in->pMem->pPrintsFP ? pPATR_in->pMem->pPrintsFP : stdout;

/*  Return if we have already printed the features for this edge. */
if (pPATR_in->iCurrentIndex >= edgep->iIndex)
	return;
pPATR_in->iCurrentIndex = edgep->iIndex;   /* Bump largest printed edge */

/*  Print edge name (with index) and features. */
sprintf(buffer, "%s_%d:", edgep->pszLabel, edgep->iIndex);
if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
	{
	fprintf(fp,"%s ", buffer);
	k = strlen(buffer) + 1;
	while (k++ & 7)
	fprintf(fp," ");
	}
else
	{
	fprintf(fp,"%s\n", buffer);
	k = 0;
	}
if (edgep->pFeature == NULL)
	fprintf(fp,"\n");
else if (edgep->eType == PATR_RULE_EDGE)
	{
	pFeat = findPATRAttribute(edgep->pFeature, storedPATRString("0",
								pPATR_in));
	if (pFeat != NULL)
	showPATRFeature( pFeat, k, pPATR_in );
	}
else
	showPATRFeature( edgep->pFeature, k, pPATR_in );
fprintf(fp,"\n");
}

/****************************************************************************
 * NAME
 *    output_word
 * ARGUMENTS
 *    edgep     - pointer to current parse edge
 * DESCRIPTION
 *    Map current parse edge into tree
 * RETURN VALUE
 *    none
 */
static void output_word(edgep, pPATR_in)
PATREdge *	edgep;
PATRData *	pPATR_in;
{
PATRFeature *	p;
char *	pszLexFeatName;
char *	pszGlossFeatName;
char szBuf[20];

if ((edgep == (PATREdge *)NULL) || (pPATR_in == (PATRData *)NULL))
	return;

appendCharToDynString(&pPATR_in->pMem->dstrOutput, '(');
appendToDynString(&pPATR_in->pMem->dstrOutput, edgep->pszLabel,
		  strlen(edgep->pszLabel));
if (edgep->iIndex != 0)
	{
	sprintf(szBuf, "_%d", edgep->iIndex);
	appendToDynString(&pPATR_in->pMem->dstrOutput, szBuf, strlen(szBuf));
	}
if ((pPATR_in->iParseCount > 1) && (edgep->iCount == pPATR_in->iParseCount))
	{
	appendCharToDynString(&pPATR_in->pMem->dstrOutput, '+');
	}
if (edgep->bFailed)
	{
	appendCharToDynString(&pPATR_in->pMem->dstrOutput, '-');
	}
appendCharToDynString(&pPATR_in->pMem->dstrOutput, ' ');
if (edgep->eType == PATR_RULE_EDGE)
	{
	output_word_children(edgep->u.r.pChildren, pPATR_in);
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
	p = findPATRAttribute(edgep->pFeature, pszLexFeatName);
	if (p != NULL && p->eType == PATR_ATOM)
	{
	appendCharToDynString(&pPATR_in->pMem->dstrOutput, ' ');
	appendToDynString(&pPATR_in->pMem->dstrOutput, p->u.pszAtom,
			  strlen(p->u.pszAtom));
	}
	if (    (edgep->eType == PATR_LEXICAL_EDGE) &&
		pPATR_in->bGloss                  &&
		pPATR_in->bGlossesExist )
	{
	/* Print word gloss */
	p = findPATRAttribute(edgep->pFeature, pszGlossFeatName);
	if (p != NULL && p->eType == PATR_ATOM)
		{
		appendToDynString(&pPATR_in->pMem->dstrOutput, "  '", 3);
		appendToDynString(&pPATR_in->pMem->dstrOutput, p->u.pszAtom,
				  strlen(p->u.pszAtom));
		appendCharToDynString(&pPATR_in->pMem->dstrOutput, '\'');
		}
	}
	}
appendCharToDynString(&pPATR_in->pMem->dstrOutput, ')');
}

/****************************************************************************
 * NAME
 *    output_word_children
 * ARGUMENTS
 *    edge_listp -
 * DESCRIPTION
 *    Call output_word for each node
 * RETURN VALUE
 *    None
 */
static void output_word_children(edge_listp, pPATR_in)
PATREdgeList *	edge_listp;
PATRData *	pPATR_in;
{
if (edge_listp == NULL)
   return;

if (edge_listp->pNext)
	output_word_children(edge_listp->pNext, pPATR_in);

output_word(edge_listp->pEdge, pPATR_in);
}

/****************************************************************************
 * NAME
 *    writePATRFlatParseTree
 * ARGUMENTS
 *    pParse_in  - pointer to parser result
 * DESCRIPTION
 *    Display parser result to screen.  (For testing only.)
 * RETURN VALUE
 *    None
 */
void writePATRFlatParseTree( pParse_in, pOutputFP_in, pPATR_in )
PATREdgeList *	pParse_in;
FILE *		pOutputFP_in;
PATRData *	pPATR_in;
{
char *p, *q;
unsigned length;
int ch;

if (pParse_in != (PATREdgeList *)NULL)
	{
	eraseDynString(&pPATR_in->pMem->dstrOutput);
	output_word(pParse_in->pEdge, pPATR_in);
	for ( length = 0, p = q = pPATR_in->pMem->dstrOutput.pszBuffer ; *p ; ++p, ++length )
	{
	ch = *p;
	if (ch == '(')
		{
		q = strchr(p+1, '(');
		if (q == NULL)
		{
		if (length + strlen(p) >= 75)
			length = 75;
		}
		else if ((length + (q - p)) >= 75)
		length = 75;
		if (length >= 75)
		{
		fputs("\n        ", pOutputFP_in);
		length = 8;
		}
		}
	putc(ch, pOutputFP_in);
	}
	putc('\n', pOutputFP_in);
	}
}

/*****************************************************************************
 * NAME
 *    display_indented_tree
 * ARGUMENTS
 *    pParse_in - pointer to the PATREdge parse tree
 *    pOutputFP_in - output FILE pointer
 * DESCRIPTION
 *    Display the parse tree in indented (outline) form.
 * RETURN VALUE
 *    none
 */
static void display_indented_tree(pParse_in, pOutputFP_in, pPATR_in)
PATREdge *	pParse_in;
FILE *		pOutputFP_in;
PATRData *	pPATR_in;
{
char *p, *q;
int i, indent;
int ch;

if (pParse_in != (PATREdge *)NULL)
	{
	eraseDynString(&pPATR_in->pMem->dstrOutput);
	output_word(pParse_in, pPATR_in);
	for ( indent = 0, p = pPATR_in->pMem->dstrOutput.pszBuffer ; *p ; )
	{
	ch = *p++;
	if (ch == '(')
		{
		if (indent > 0)
		{
		putc('\n', pOutputFP_in);
		for ( i = 0 ; i < indent ; ++i )
			fputs("    ", pOutputFP_in);
		}
		++indent;
		}
	else if (ch == ')')
		--indent;
	else if (ch == ' ')
		continue;
	else
		{
		putc(ch, pOutputFP_in);
		q = strpbrk(p, "()");
		if (q == NULL)
		q = p + strlen(p);
		while (p < q)
		{
		ch = *p++;
		putc(ch, pOutputFP_in);
		}
		}
	}
	putc('\n', pOutputFP_in);
	}
}

/*****************************************************************************
 * NAME
 *    write_xml_char_data
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void write_xml_char_data(pszString_in, pOutFP_in, bCDATA_in)
const char * pszString_in;
FILE * pOutFP_in;
int bCDATA_in;
{
const char * psz;

if ((pszString_in == NULL) || (pOutFP_in == NULL))
	return;
for ( psz = pszString_in ; *psz ; ++psz )
	{
	if (*psz == '&')
	{
	fputs("&amp;", pOutFP_in);
	}
	else if (*psz == '<')
	{
	fputs("&lt;", pOutFP_in);
	}
	else if (*psz == '>')
	{
	fputs("&gt;", pOutFP_in);
	}
	else if (bCDATA_in && (*psz == '"'))
	{
	fputs("&quot;", pOutFP_in);
	}
	else
	{
	putc(*psz, pOutFP_in);
	}
	}
}

/*****************************************************************************
 * NAME
 *    write_xml_feature
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void write_xml_feature(pFeature_in, iParse_in, pszNodeId_in,
				  pOutputFP_in, iIndent_in, pPATR_in)
PATRFeature * pFeature_in;
int           iParse_in;
const char *  pszNodeId_in;
FILE *        pOutputFP_in;
int           iIndent_in;
PATRData *    pPATR_in;
{
PATRFeature * pFeat;
PATRComplexFeature * pcf;
PATRFeature * pChild;
int iCoref;
int bRepeated;

if (pFeature_in == NULL)
	return;
pFeat = followPATRForwardPointers( pFeature_in );	/* Follow pointers */
if (pFeat == NULL)
	return;
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
#ifndef hab124
	fprintf(pOutputFP_in, "%*s<Str>", iIndent_in, "");
	write_PCDATA(pFeat->u.pszAtom, pOutputFP_in);
	fprintf(pOutputFP_in, "</Str>\n");
#else
	fprintf(pOutputFP_in, "%*s<str>", iIndent_in, "");
	write_PCDATA(pFeat->u.pszAtom, pOutputFP_in);
	fprintf(pOutputFP_in, "</str>\n");
#endif /* hab124 */
	break;
	case PATR_COMPLEX:
	sortPATRComplexFeature(pFeat->u.pComplex, pPATR_in->pGrammar,
				   pPATR_in);
	for ( pcf = pFeat->u.pComplex ; pcf ; pcf = pcf->pNext)
		{
		iCoref = getPATRFeatureCoreference(pcf->pValue, pPATR_in);
		if (iCoref != 0)
		bRepeated = repeatedPATRFeatureCoreference(pcf->pValue,
							   pPATR_in);
		else
		bRepeated = FALSE;
#ifndef hab124
		fprintf(pOutputFP_in, "%*s<F name=\"", iIndent_in + 2, "");
#else
		fprintf(pOutputFP_in, "%*s<f name=\"", iIndent_in + 2, "");
#endif /* hab124 */
		write_CDATA(pcf->pszLabel, pOutputFP_in);
		if (bRepeated)
		{
#ifndef hab124
		  fprintf(pOutputFP_in, "\" fVal=\"_%d%s.co%d\"></F>\n", /* hab125 */
#else
		fprintf(pOutputFP_in, "\" fVal=\"_%d%s:co%d\"></f>\n",
#endif /* hab124 */
			iParse_in, pszNodeId_in, iCoref);
		}
		else
		{
		fprintf(pOutputFP_in, "\">");
		/* Print value */
		pChild = followPATRForwardPointers( pcf->pValue );
		if (	(pChild->eType == PATR_ATOM) ||
			(pChild->eType == PATR_DEFATOM) )
			{
			/* TODO: distinguish <num>, <sym>, <plus/>, <minus/>? */
#ifndef hab124
			if (iCoref != 0)
			  fprintf(pOutputFP_in, "<Str id=\"_%d%s.co%d\">", /* hab125 */
				iParse_in, pszNodeId_in, iCoref);
			else
			fprintf(pOutputFP_in, "<Str>");
			write_PCDATA(pChild->u.pszAtom, pOutputFP_in);
			fprintf(pOutputFP_in, "</Str></F>\n"); /* hab125 */
#else
			if (iCoref != 0)
			  fprintf(pOutputFP_in, "<str id=\"_%d%s.co%d\">", /* hab125 */
				iParse_in, pszNodeId_in, iCoref);
			else
			fprintf(pOutputFP_in, "<str>");
			write_PCDATA(pChild->u.pszAtom, pOutputFP_in);
			fprintf(pOutputFP_in, "</str></f>\n");
#endif /* hab124 */
			}
		else if (pChild->eType == PATR_FAILFS)
			{
			/* TODO: distinguish <num>, <sym>, <plus/>, <minus/>? */
#ifndef hab124
			if (iCoref != 0)
			fprintf(pOutputFP_in, "<Str id=\"_%d%s.co%d\">", /* hab125 */
				iParse_in, pszNodeId_in, iCoref);
			else
			fprintf(pOutputFP_in, "<Str>");
			fprintf(pOutputFP_in, "FAIL ");
			write_PCDATA(pChild->u.pszAtom, pOutputFP_in);
			fprintf(pOutputFP_in, "</Str></F>\n");
#else
			if (iCoref != 0)
			fprintf(pOutputFP_in, "<str id=\"_%d%s:co%d\">",
				iParse_in, pszNodeId_in, iCoref);
			else
			fprintf(pOutputFP_in, "<str>");
			fprintf(pOutputFP_in, "FAIL ");
			write_PCDATA(pChild->u.pszAtom, pOutputFP_in);
			fprintf(pOutputFP_in, "</str></f>\n");
#endif /* hab124 */
			}
		else if (pChild->eType == PATR_NULLFS)
			{
#ifndef hab124
			if (iCoref != 0)
			fprintf(pOutputFP_in, "<Any id=\"_%d%s.co%d\"/>", /* hab125 */
				iParse_in, pszNodeId_in, iCoref);
			else
			fprintf(pOutputFP_in, "<Any/>");
			fprintf(pOutputFP_in, "</F>\n");
#else
			if (iCoref != 0)
			fprintf(pOutputFP_in, "<any id=\"_%d%s:co%d\"/>",
				iParse_in, pszNodeId_in, iCoref);
			else
			fprintf(pOutputFP_in, "<any/>");
			fprintf(pOutputFP_in, "</f>\n");
#endif /* hab124 */
			}
		else
			{
			/* must be COMPLEX */
#ifndef hab124
			if (iCoref != 0)
			fprintf(pOutputFP_in, "\n%*s<Fs id=\"_%d%s.co%d\">\n", /* hab125 */
				iIndent_in + 4, "", iParse_in,
				pszNodeId_in, iCoref);
			else
			fprintf(pOutputFP_in, "\n%*s<Fs>\n",
				iIndent_in + 4, "");
			write_xml_feature(pChild, iParse_in, pszNodeId_in,
					  pOutputFP_in, iIndent_in + 4, pPATR_in);
			fprintf(pOutputFP_in, "%*s</Fs>\n", iIndent_in + 4, "");
			fprintf(pOutputFP_in, "%*s</F>\n", iIndent_in + 2, "");
#else
			if (iCoref != 0)
			fprintf(pOutputFP_in, "\n%*s<fs id=\"_%d%s:co%d\">\n",
				iIndent_in + 4, "", iParse_in,
				pszNodeId_in, iCoref);
			else
			fprintf(pOutputFP_in, "\n%*s<fs>\n",
				iIndent_in + 4, "");
			write_xml_feature(pChild, iParse_in, pszNodeId_in,
					  pOutputFP_in, iIndent_in + 4, pPATR_in);
			fprintf(pOutputFP_in, "%*s</fs>\n", iIndent_in + 4, "");
			fprintf(pOutputFP_in, "%*s</f>\n", iIndent_in + 2, "");
#endif /* hab124 */
			}
		}
		}
	break;
	case PATR_NULLFS:
#ifndef hab124
	fprintf(pOutputFP_in, "%*s<Any/>\n", iIndent_in, "");
#else
	fprintf(pOutputFP_in, "%*s<any/>\n", iIndent_in, "");
#endif /* hab124 */
	break;
	case PATR_FAILFS:
	/*
	 *  if failure, print fail string:  u.pszAtom contains x/y
	 */
#ifndef hab124
	fprintf(pOutputFP_in, "%*s<Str>FAIL ", iIndent_in, "");
	write_PCDATA(pFeat->u.pszAtom, pOutputFP_in);
	fprintf(pOutputFP_in, "</Str>\n");
#else
	fprintf(pOutputFP_in, "%*s<str>FAIL ", iIndent_in, "");
	write_PCDATA(pFeat->u.pszAtom, pOutputFP_in);
	fprintf(pOutputFP_in, "</str>\n");
#endif /* hab124 */
	break;
	default:
	/* should never happen */
	fprintf(pOutputFP_in, "<ERROR>\n");
	break;
	}
}

/*****************************************************************************
 * NAME
 *    write_xml_children
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
static void write_xml_children(pChildren_in, pTreeFeats_in, iParse_in,
				   pOutFP_in, iIndent_in, pPATR_in)
PATREdgeList * pChildren_in;
PATRFeature *  pTreeFeats_in;
int            iParse_in;
FILE *         pOutFP_in;
int            iIndent_in;
PATRData *     pPATR_in;
{
if (pChildren_in == NULL)
	return;
if (pChildren_in->pNext)
	write_xml_children(pChildren_in->pNext, pTreeFeats_in, iParse_in,
			   pOutFP_in, iIndent_in, pPATR_in);
write_xml_node(pChildren_in->pEdge, pTreeFeats_in, iParse_in, pOutFP_in,
		   iIndent_in, pPATR_in);
}

/*****************************************************************************
 * NAME
 *    write_xml_node
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
static void write_xml_node(pEdge_in, pTreeFeats_in, iParse_in,
			   pOutputFP_in, iIndent_in, pPATR_in)
PATREdge *    pEdge_in;
PATRFeature * pTreeFeats_in;
int           iParse_in;
FILE *        pOutputFP_in;
int           iIndent_in;
PATRData *    pPATR_in;
{
const char * pszAll = "";
const char * pszFail = "";
char * pszLexFeatName;
char * pszGlossFeatName;
const char * pszPreGloss = "";
const char * pszGloss = "";
const char * pszPostGloss = "";
PATRFeature * pFeat;
PATRFeature * pf;
PATRComplexFeature * pcf;
char szNodeId[32];
const char * pszFeatNodeId;
PATRDisplayedFeature * pSaveMultTop = NULL;

if (pEdge_in == NULL)
	return;
sprintf(szNodeId, "_%d", pEdge_in->iIndex);
if (pEdge_in->bPrinted)
	{
#ifndef hab124
	fprintf(pOutputFP_in, "%*s<Shared id=\"_%d.%s\"/>\n", /* hab125 */
		iIndent_in, "", iParse_in, szNodeId);
#else
	fprintf(pOutputFP_in, "%*s<shared id=\"_%d:%s\"/>\n",
		iIndent_in, "", iParse_in, szNodeId);
#endif /* hab124 */
	return;
	}
pEdge_in->bPrinted = TRUE;
if (    (pPATR_in->iParseCount > 1) &&
	 (pEdge_in->iCount == pPATR_in->iParseCount))
	{
	pszAll = " all=\"true\"";
	}
if (pEdge_in->bFailed)
	{
	pszFail = " fail=\"true\"";
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
#ifndef hab124
	fprintf(pOutputFP_in, "%*s<Node cat=\"", iIndent_in, "");
#else
	fprintf(pOutputFP_in, "%*s<node cat=\"", iIndent_in, "");
#endif /* hab124 */
	write_CDATA(pEdge_in->pszLabel, pOutputFP_in);
	if (pEdge_in->u.r.pRule && pEdge_in->u.r.pRule->pszID)
	{
	fprintf(pOutputFP_in, "\" rule=\"");
	write_CDATA(pEdge_in->u.r.pRule->pszID, pOutputFP_in);
	}
	fprintf(pOutputFP_in, "\" id=\"_%d._%d\"%s%s>\n", /* hab125 */
		iParse_in, pEdge_in->iIndex, pszAll, pszFail);
	if (pFeat == NULL)
	{
	if (pPATR_in->bUnification)
#ifndef hab124
		fprintf(pOutputFP_in, "%*s<Fs></Fs>\n", iIndent_in, "");
#else
		fprintf(pOutputFP_in, "%*s<fs></fs>\n", iIndent_in, "");
#endif /* hab124 */
	}
	else
	{
#ifndef hab124
	fprintf(pOutputFP_in, "%*s<Fs>\n", iIndent_in + 2, "");
#else
	fprintf(pOutputFP_in, "%*s<fs>\n", iIndent_in + 2, "");
#endif /* hab124 */
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
	write_xml_feature(pFeat, iParse_in, pszFeatNodeId, pOutputFP_in,
			  iIndent_in + 2, pPATR_in);
	if (pTreeFeats_in == NULL)
		{
		collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		pPATR_in->pMem->pMultTop = pSaveMultTop;
		}
#ifndef hab124
	fprintf(pOutputFP_in, "%*s</Fs>\n", iIndent_in + 2, "");
#else
	fprintf(pOutputFP_in, "%*s</fs>\n", iIndent_in + 2, "");
#endif /* hab124 */
	}
	write_xml_children(pEdge_in->u.r.pChildren, pTreeFeats_in, iParse_in,
			   pOutputFP_in, iIndent_in + 2, pPATR_in);
#ifndef hab124
	fprintf(pOutputFP_in, "%*s</Node>\n", iIndent_in, "");
#else
	fprintf(pOutputFP_in, "%*s</node>\n", iIndent_in, "");
#endif /* hab124 */
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
	if (pPATR_in->bGloss && pPATR_in->bGlossesExist)
	{
	/* Print word gloss */
	pf = findPATRAttribute(pEdge_in->pFeature,
						 pszGlossFeatName);
	if (pf != NULL && pf->eType == PATR_ATOM)
		{
		pszPreGloss  = " gloss=\"";
		pszGloss     = pf->u.pszAtom;
		pszPostGloss = "\"";
		}
	}
#ifndef hab124
	fprintf(pOutputFP_in, "%*s<Leaf cat=\"", iIndent_in, "");
#else
	fprintf(pOutputFP_in, "%*s<leaf cat=\"", iIndent_in, "");
#endif /* hab124 */
	write_CDATA(pEdge_in->pszLabel, pOutputFP_in);
	fprintf(pOutputFP_in, "\" id=\"_%d._%d\"%s%s%s", /* hab125 */
		iParse_in, pEdge_in->iIndex, pszAll, pszFail, pszPreGloss);
	write_CDATA(pszGloss, pOutputFP_in);
	fprintf(pOutputFP_in, "%s>\n", pszPostGloss);
	if (pFeat == NULL)
	{
	if (pPATR_in->bUnification)
#ifndef hab124
		fprintf(pOutputFP_in, "%*s<Fs></Fs>\n", iIndent_in, "");
#else
		fprintf(pOutputFP_in, "%*s<fs></fs>\n", iIndent_in, "");
#endif /* hab124 */
	}
	else
	{
#ifndef hab124
	fprintf(pOutputFP_in, "%*s<Fs>\n", iIndent_in + 2, "");
#else
	fprintf(pOutputFP_in, "%*s<fs>\n", iIndent_in + 2, "");
#endif /* hab124 */
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
	write_xml_feature(pFeat, iParse_in, pszFeatNodeId, pOutputFP_in,
			  iIndent_in + 2, pPATR_in);
	if (pTreeFeats_in == NULL)
		{
		collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
		resetPATRFeatureCoreferenceCheck(pPATR_in);
		pPATR_in->pMem->pMultTop = pSaveMultTop;
		}
#ifndef hab124
	fprintf(pOutputFP_in, "%*s</Fs>\n", iIndent_in + 2, "");
#else
	fprintf(pOutputFP_in, "%*s</fs>\n", iIndent_in + 2, "");
#endif /* hab124 */
	}
	if ((pEdge_in->pFeature == NULL) || (pTreeFeats_in == NULL))
	{
	if (pPATR_in->bUnification)
#ifndef hab124
		fprintf(pOutputFP_in, "%*s<Lexfs></Lexfs>\n", iIndent_in, "");
#else
		fprintf(pOutputFP_in, "%*s<lexfs></lexfs>\n", iIndent_in, "");
#endif /* hab124 */
	}
	else
	{
	pSaveMultTop = pPATR_in->pMem->pMultTop;
	markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	checkPATRFeatureCoreferences(pEdge_in->pFeature, pPATR_in);

#ifndef hab124
	fprintf(pOutputFP_in, "%*s<Lexfs>\n", iIndent_in + 2, "");
#else
	fprintf(pOutputFP_in, "%*s<lexfs>\n", iIndent_in + 2, "");
#endif /* hab124 */
	write_xml_feature(pEdge_in->pFeature, iParse_in, szNodeId,
			  pOutputFP_in, iIndent_in + 2, pPATR_in);
#ifndef hab124
	fprintf(pOutputFP_in, "%*s</Lexfs>\n", iIndent_in + 2, "");
#else
	fprintf(pOutputFP_in, "%*s</lexfs>\n", iIndent_in + 2, "");
#endif /* hab124 */

	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	pPATR_in->pMem->pMultTop = pSaveMultTop;
	}
#ifndef hab124
	fprintf(pOutputFP_in, "%*s<Str>", iIndent_in + 2, "");
#else
	fprintf(pOutputFP_in, "%*s<str>", iIndent_in + 2, "");
#endif /* hab124 */
	pf = findPATRAttribute(pEdge_in->pFeature, pszLexFeatName);
	if ((pf != NULL) && (pf->eType == PATR_ATOM))
	{
	write_PCDATA(pf->u.pszAtom, pOutputFP_in);
	}
	else
	{
	write_PCDATA(pEdge_in->u.l.pszTerminal, pOutputFP_in);
	}
#ifndef hab124
	fprintf(pOutputFP_in, "</Str>\n");
	fprintf(pOutputFP_in, "%*s</Leaf>\n", iIndent_in, "");
#else
	fprintf(pOutputFP_in, "</str>\n");
	fprintf(pOutputFP_in, "%*s</leaf>\n", iIndent_in, "");
#endif /* hab124 */
	}
}

/*****************************************************************************
 * NAME
 *    write_xml_parse
 * DESCRIPTION
 *    Display the parse tree in XML format.  This bundles the features with
 *    nodes of the tree.
 * RETURN VALUE
 *    none
 */
static void write_xml_parse(pParse_in, pTreeFeats_in, iParse_in,
				pOutputFP_in, pPATR_in)
PATREdge *	pParse_in;
PATRFeature *	pTreeFeats_in;
int		iParse_in;
FILE *		pOutputFP_in;
PATRData *	pPATR_in;
{
if (pParse_in != (PATREdge *)NULL)
	{
#ifndef hab124
	fprintf(pOutputFP_in, "  <Parse>\n");
#else
	fprintf(pOutputFP_in, "  <parse>\n");
#endif /* hab124 */
	write_xml_node(pParse_in, pTreeFeats_in, iParse_in, pOutputFP_in, 4,
		   pPATR_in);
#ifndef hab124
	fprintf(pOutputFP_in, "  </Parse>\n");
#else
	fprintf(pOutputFP_in, "  </parse>\n");
#endif /* hab124 */
	}
}

/*****************************************************************************
 * NAME
 *    unify_tree_children_features
 * DESCRIPTION
 *    add the feature structures of each of the children nodes to the overall
 *    parse tree feature structure.  the individual items in this complex
 *    feature are labeled by the numeric tree node index values.  These are
 *    not valid (string) pointers, but who cares?
 * RETURN VALUE
 *    complex feature structure containing all parse tree children node
 *    features unified in
 */
static PATRFeature * unify_tree_children_features(pEdges_in, pTreeFeats_in,
						  pPATR_in)
PATREdgeList * pEdges_in;
PATRFeature * pTreeFeats_in;
PATRData * pPATR_in;
{
PATRFeature * pParseFeature = pTreeFeats_in;

if (pEdges_in == NULL)
	return pParseFeature;
if (pEdges_in->pNext)
	pParseFeature = unify_tree_children_features(pEdges_in->pNext,
						 pParseFeature,
						 pPATR_in);
return unifyPATRParseTreeFeatures(pEdges_in->pEdge, pParseFeature, pPATR_in);
}

/*****************************************************************************
 * NAME
 *    unifyPATRParseTreeFeatures
 * DESCRIPTION
 *    add the feature structure for this node in the parse tree (and the
 *    feature structures for all children nodes) to the overall parse tree
 *    feature structure.  pTreeFeats should be set to NULL for the initial
 *    call to the top node of the parse tree.
 * RETURN VALUE
 *    complex feature structure containing all parse tree node feature
 *    structures, with coreferences properly instantiated
 */
PATRFeature * unifyPATRParseTreeFeatures(pEdge_in, pTreeFeats_in, pPATR_in)
PATREdge * pEdge_in;
PATRFeature * pTreeFeats_in;
PATRData * pPATR_in;
{
PATRFeature * pParseFeature = pTreeFeats_in;
PATRFeature * pFeatCopy;
PATRFeature * pFeat;
PATRComplexFeature * pComp;
PATRComplexFeature * pPrev;
char * psz0;
char * pszLHS;
int i;
PATRNonterminal * pnt;
PATREdgeList * pel;

if (pEdge_in->pFeature)
	{
	pFeat = followPATRForwardPointers( pEdge_in->pFeature );
	if ((pFeat != NULL) && (pFeat->eType == PATR_COMPLEX))
	{
	if (pEdge_in->eType == PATR_RULE_EDGE)
		{
		/*
		 *  copy the rule edge's feature structure, except for the
		 *  member labeled "0" (it is shared verbatim with one
		 *  labeled with the rule's LHS nonterminal, and would
		 *  introduce spurious coreferences)
		 */
		psz0 = storedPATRString( "0", pPATR_in);
		for (   pComp = pFeat->u.pComplex, pPrev = NULL ;
			pComp ;
			pComp = pComp->pNext )
		{
		if (pComp->pszLabel == psz0)
			{
			if (pPrev == NULL)
			pFeat->u.pComplex = pComp->pNext;
			else
			pPrev->pNext = pComp->pNext;
			break;
			}
		pPrev = pComp;
		}
		pFeatCopy = copyPATRFeature(pFeat, pPATR_in);
		if (pComp != NULL)
		{
		if (pPrev == NULL)
			pFeat->u.pComplex = pComp;
		else
			pPrev->pNext = pComp;
		}
		/*
		 *  change the labels of these features to match the tree
		 *  indexed labels
		 */
		if (pEdge_in->u.r.pRule)
		{
		pszLHS = pEdge_in->u.r.pRule->pRHS ?
			pEdge_in->u.r.pRule->pRHS->pszLhsName :
			pEdge_in->u.r.pRule->pszLHS;
		}
		else
		{
		pszLHS = NULL;
		}
		for (   pComp = pFeatCopy->u.pComplex, pPrev = NULL ;
			pComp ;
			pComp = pComp->pNext )
		{
		if (pComp->pszLabel == pszLHS)
			{
			/* consumes more memory, but what else can we do? */
			if (pPATR_in->iDebugLevel)
			{
			fprintf(stdout,
				"DEBUG: change label from \"%s\" to #%d\n",
				pComp->pszLabel, pEdge_in->iIndex);
			if (pPATR_in->pLogFP)
				fprintf(pPATR_in->pLogFP,
					"DEBUG: change label from \"%s\" to #%d\n",
					pComp->pszLabel, pEdge_in->iIndex);
			}
			pComp->pszLabel = (char *)pEdge_in->iIndex;
			}
		else
			{
			if (pPATR_in->iDebugLevel)
			{
			fprintf(stdout,
				"DEBUG: change label from \"%s\" to ",
				pComp->pszLabel );
			if (pPATR_in->pLogFP)
				fprintf(pPATR_in->pLogFP,
					"DEBUG: change label from \"%s\" to ",
					pComp->pszLabel );
			}
			for ( pnt = pEdge_in->u.r.pRule->pRHS, i = 1, pel = NULL ;
			  pnt ;
			  pnt = pnt->pNext, ++i )
			{
			if (pComp->pszLabel == pnt->pszName)
				{
				int iRev = pEdge_in->u.r.pRule->iNontermCount - i;
				for ( pel = pEdge_in->u.r.pChildren ;
				  pel && iRev ;
				  pel = pel->pNext, --iRev )
				{
				/* step to desired child */
				}
				break;
				}
			}
			if ((pel != NULL) && (pel->pEdge != NULL))
			{
			if (pPATR_in->iDebugLevel)
				{
				fprintf(stdout, "#%d\n",
					pel->pEdge->iIndex);
			if (pPATR_in->pLogFP)
				fprintf(pPATR_in->pLogFP, "#%d\n",
					pel->pEdge->iIndex);
				}
			pComp->pszLabel = (char *)pel->pEdge->iIndex;
			}
			else
			{
			if (pPATR_in->iDebugLevel)
				{
				/* i hope this doesn't happen */
				fprintf(stdout, " !!UGH!!\n");
				if (pPATR_in->pLogFP)
				fprintf(pPATR_in->pLogFP, " !!UGH!!\n");
				}
			}
			}
		}
		if (pParseFeature == NULL)
		{
		pParseFeature = pFeatCopy;
		}
		else
		{
		unifyPATRFeatures(pParseFeature, pFeatCopy, FALSE, pPATR_in);
		}
		}
	else
		{
		/*
		 *  Lexical edge
		 */
		pFeatCopy = copyPATRFeature(pFeat, pPATR_in);
		if (pParseFeature == NULL)
		{
		/* should never happen! */
		pParseFeature = createPATRNullFeature(pPATR_in);
		}
		if (pPATR_in->iDebugLevel)
		{
		fprintf(stdout,
			"DEBUG: add lexical feature labeled #%d\n",
			pEdge_in->iIndex);
		if (pPATR_in->pLogFP)
			fprintf(pPATR_in->pLogFP,
				"DEBUG: add lexical feature labeled #%d\n",
				pEdge_in->iIndex);
		}
		pFeat = createPATRNullFeature(pPATR_in);
		pFeat->eType = PATR_COMPLEX;
		pFeat->u.pComplex = createPATRComplexFeature(
							  (char *)pEdge_in->iIndex,
							  pFeatCopy,
							  pPATR_in);
		unifyPATRFeatures(pParseFeature, pFeat, FALSE, pPATR_in);
		}
	}
	}
if (pEdge_in->eType == PATR_RULE_EDGE)
	{
	return unify_tree_children_features(pEdge_in->u.r.pChildren, pParseFeature,
					pPATR_in);
	}
else
	{
	return pParseFeature;
	}
}

/*****************************************************************************
 * NAME
 *    write_parse_tree_children_features
 * DESCRIPTION
 *    recursively write the feature structures for each parse tree edge in
 *    the given list of edges
 * RETURN VALUE
 *    none
 */
static void write_parse_tree_children_features(pEdges_in, pOutputFP_in,
						   pTreeFeats_in, pPATR_in)
PATREdgeList * pEdges_in;
FILE * pOutputFP_in;
PATRFeature * pTreeFeats_in;
PATRData * pPATR_in;
{
if (pEdges_in == NULL)
	return;
if (pEdges_in->pNext)
	write_parse_tree_children_features(pEdges_in->pNext, pOutputFP_in,
					   pTreeFeats_in, pPATR_in);
write_parse_tree_features(pEdges_in->pEdge, pOutputFP_in, pTreeFeats_in,
			  pPATR_in);
}

/*****************************************************************************
 * NAME
 *    write_parse_tree_features
 * DESCRIPTION
 *    write the feature structures associated with this parse tree, stopping
 *    with the top node's feature if so desired.  an attempt has been made to
 *    handle coreferences properly by preparing the set of node features
 *    stored in pTreeFeats_in, labeled by tree index numbers (not by
 *    proper string pointers)
 * RETURN VALUE
 *    none
 */
static void write_parse_tree_features(pEdge_in, pOutputFP_in, pTreeFeats_in,
					  pPATR_in)
PATREdge * pEdge_in;
FILE * pOutputFP_in;
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

if (	(pEdge_in     == NULL) ||
	(pOutputFP_in == NULL) ||
	(pPATR_in     == NULL))
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
	if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
	{
	fprintf(pOutputFP_in,"%s: ", pEdge_in->pszLabel);
	k = strlen(pEdge_in->pszLabel) + 2;
	while (k++ & 7)
		putc(' ', pOutputFP_in);
	}
	else
	{
	fprintf(pOutputFP_in,"%s:\n", pEdge_in->pszLabel);
	k = 0;
	}
	pf = findPATRAttribute(pEdge_in->pFeature,
			   storedPATRString("0", pPATR_in));
	if (pf != NULL)
	showPATRFeature( pf, k, pPATR_in );
	putc('\n', pOutputFP_in);
	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	return;
	}

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
	if (pf == NULL && pEdge_in->eType == PATR_RULE_EDGE)
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
	fprintf(pOutputFP_in,"%s_%s%s:",
		pEdge_in->pszLabel, szIndex, pszExtra);
	if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
		{
		putc(' ', pOutputFP_in);
		k = strlen(pEdge_in->pszLabel) + strlen(szIndex) +
							  strlen(pszExtra) + 3;
		while (k++ & 7)
		putc(' ', pOutputFP_in);
		}
	else
		{
		putc('\n', pOutputFP_in);
		k = 0;
		}
	showPATRFeature(pf, k, pPATR_in);
	putc('\n', pOutputFP_in);
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
		fprintf(pOutputFP_in,"%s_%s:%s[***]\n\n",
			pEdge_in->pszLabel, szIndex,
		(pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT) ? "  " : "\n");
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
	fprintf(pOutputFP_in,"%s_%s%s:",
		pEdge_in->pszLabel, szIndex, pszExtra);
	if (pPATR_in->iFeatureDisplay & PATR_FEATURE_FLAT)
		{
		putc(' ', pOutputFP_in);
		k = strlen(pEdge_in->pszLabel) + strlen(szIndex) +
							  strlen(pszExtra) + 3;
		while (k++ & 7)
		putc(' ', pOutputFP_in);
		}
	else
		{
		putc('\n', pOutputFP_in);
		k = 0;
		}
	markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	checkPATRFeatureCoreferences(pf, pPATR_in);

	showPATRFeature(pf, k, pPATR_in);
	putc('\n', pOutputFP_in);

	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	pPATR_in->pMem->pMultTop = pSaveMultTop;
	}
	}
if (	(pPATR_in->iFeatureDisplay & PATR_FEATURE_ALL) &&
	(pEdge_in->eType == PATR_RULE_EDGE) )
	{
	write_parse_tree_children_features(pEdge_in->u.r.pChildren, pOutputFP_in,
					   pTreeFeats_in, pPATR_in);
	}
}

/*****************************************************************************
 * NAME
 *    writePATRFeature
 * ARGUMENTS
 *    featp  - pointer to PATRFeature node
 *    pOutputFP_in  - output FILE pointer
 *    indent - number of chars already on line
 * DESCRIPTION
 *    Write the feature structure to the file in flat format.
 * RETURN VALUE
 *    none
 */
void writePATRFeature(featp, pOutputFP_in, indent, pPATR_in)
PATRFeature *	featp;
FILE *		pOutputFP_in;
int		indent;
PATRData *	pPATR_in;
{
int bSetCoref = FALSE;

pPATR_in->iCurrentIndex = 0;
pPATR_in->pMem->pPrintsFP = pOutputFP_in;
if (pPATR_in->pMem->pMultTop == NULL)
	{
	/* Check for multiple refs */
	bSetCoref = TRUE;
	markPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	checkPATRFeatureCoreferences(featp, pPATR_in);
	}
show_feat_flat(featp, indent, pPATR_in);
if (bSetCoref)
	{
	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	}
pPATR_in->pMem->pPrintsFP = NULL;
}

/*****************************************************************************
 * NAME
 *    writePATRParseFeatures
 * ARGUMENTS
 *    parses - list of parses
 *    pOutputFP_in  - output FILE pointer
 * DESCRIPTION
 *    Print the features from this parse.
 * RETURN VALUE
 *    none
 */
void writePATRParseFeatures(parses, pOutputFP_in, pPATR_in)
PATREdgeList *	parses;
FILE *		pOutputFP_in;
PATRData *	pPATR_in;
{
pPATR_in->iCurrentIndex = 0;
pPATR_in->pMem->pPrintsFP = pOutputFP_in;
visitPATREdges(parses, 1, PATR_PREORDER, print_feat, pPATR_in);
pPATR_in->pMem->pPrintsFP = NULL;
}

/*****************************************************************************
 * NAME
 *    writePATRParses
 * ARGUMENTS
 *    parses       - list of parses
 *    pOutputFP_in - output FILE pointer
 *    ppWords_in   - ANA word info
 *    pPATR_in     -
 * DESCRIPTION
 *    Write all possible legal parses in the chart to the given file.
 * RETURN VALUE
 *    none
 */
void writePATRParses(parses, pOutputFP_in, ppWords_in, pTextControl_in, pPATR_in)
PATREdgeList *	parses;
FILE *		pOutputFP_in;
WordTemplate ** ppWords_in;
TextControl *	pTextControl_in;
PATRData *	pPATR_in;
{
int count;
PATREdgeList * pel;
int iSaveFeatureDisplay;
int iSaveParseCount;
int iSaveCurrentIndex;
FILE * pSavePrintsFP;
PATRFeature * pParseFeatures;
int bUnifiedParseFeatures;

if ((pOutputFP_in == NULL) || (pPATR_in == NULL))
	return;

iSaveFeatureDisplay = pPATR_in->iFeatureDisplay;
iSaveParseCount = pPATR_in->iParseCount;
iSaveCurrentIndex = pPATR_in->iCurrentIndex;
pSavePrintsFP = pPATR_in->pMem->pPrintsFP;

pPATR_in->pMem->pPrintsFP = pOutputFP_in;
if (pPATR_in->bFailure && !pPATR_in->bUnification)
	pPATR_in->iFeatureDisplay |= PATR_FEATURE_ALL;
/*
 *  count number of parses
 */
for ( pPATR_in->iParseCount = 0, pel = parses ; pel ; pel = pel->pNext )
	{
	++pPATR_in->iParseCount;
	}
/*
 *  print the parses
 */
if (pPATR_in->eTreeDisplay == PATR_XML_TREE)
	{
	const char * pszFail = "";
	for ( pel = parses ; pel ; pel = pel->pNext )
	{
	if (failedPATRParse(pel->pEdge))
		{
		pszFail = " fail=\"true\"";
		}
	}
#ifndef hab124
	fprintf(pOutputFP_in, "<Analysis count=\"%d\"%s>\n",
		pPATR_in->iParseCount, pszFail);
#else
	fprintf(pOutputFP_in, "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n");
	fprintf(pOutputFP_in, "<!DOCTYPE analysis SYSTEM \"pcpatr.dtd\">\n");
	fprintf(pOutputFP_in, "<Analysis count=\"%d\"%s>\n",
		pPATR_in->iParseCount, pszFail);
#endif /* hab124 */
	writeANAWordInfoAsXML(ppWords_in, pOutputFP_in, pTextControl_in);
	}
for ( count = 0, pel = parses ; pel != NULL ; pel = pel->pNext )
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
	switch (pPATR_in->eTreeDisplay)
	{
	case PATR_FLAT_TREE:			/* flat tree */
		fprintf(pOutputFP_in,"\n%d:\n", count);
		writePATRFlatParseTree(pel, pOutputFP_in, pPATR_in);
		break;
	case PATR_FULL_TREE:			/* full tree */
		fprintf(pOutputFP_in,"\n%d:\n", count);
		lcvert_tree(pel->pEdge, pPATR_in);
		break;
	case PATR_INDENTED_TREE:		/* indented tree */
		fprintf(pOutputFP_in,"\n%d:\n", count);
		display_indented_tree(pel->pEdge, pOutputFP_in, pPATR_in);
		break;
	case PATR_XML_TREE:		/* indented tree */
		write_xml_parse(pel->pEdge, pParseFeatures, count,
				pOutputFP_in, pPATR_in);
		break;
	}
	if (pPATR_in->eTreeDisplay != PATR_XML_TREE)
	{
	if (    (pPATR_in->eTreeDisplay == PATR_FLAT_TREE)     ||
		(pPATR_in->eTreeDisplay == PATR_INDENTED_TREE) ||
		(pPATR_in->bGloss && pPATR_in->bGlossesExist) )
		putc('\n', pOutputFP_in);
	write_parse_tree_features(pel->pEdge, pOutputFP_in,
				  pParseFeatures, pPATR_in);
	}
	if (bUnifiedParseFeatures)
	{
	resetPATRFeatureCoreferenceCheck(pPATR_in);
	collectPATRGarbage(PATR_GARBAGE_DISPLAY, pPATR_in);
	}
	}
if (pPATR_in->eTreeDisplay == PATR_XML_TREE)
	{
#ifndef hab124
	fprintf(pOutputFP_in,"</Analysis>\n");
#else
	fprintf(pOutputFP_in,"</analysis>\n");
#endif /* hab124 */
	}
else
	{
	if (pPATR_in->iParseCount == 1)
	fprintf(pOutputFP_in, "1 parse found\n");
	else if (pPATR_in->iParseCount > 1)
	{
	fprintf(pOutputFP_in, "%d parses found", pPATR_in->iParseCount);
	if (pPATR_in->iParseCount > pPATR_in->iMaxAmbiguities)
		fprintf(pOutputFP_in, " (%d printed)", pPATR_in->iMaxAmbiguities);
	putc('\n', pOutputFP_in);
	}
	}
/*
 * restore previous values
 */
pPATR_in->iFeatureDisplay = iSaveFeatureDisplay;
pPATR_in->iParseCount = iSaveParseCount;
pPATR_in->iCurrentIndex = iSaveCurrentIndex;
pPATR_in->pMem->pPrintsFP = pSavePrintsFP;
}

/*****************************************************************************
 * NAME
 *    getPATRNodeGloss
 * ARGUMENTS
 *    edgep -
 * DESCRIPTION
 *
 * RETURN VALUE
 *
 */
char * getPATRNodeGloss(edgep, pPATR_in)
PATREdge * edgep;
PATRData * pPATR_in;
{
PATRFeature *	p;
char *	pszGlossFeatName;

if (pPATR_in->pGrammar != NULL)
	pszGlossFeatName = pPATR_in->pGrammar->pszGlossFeatName;
else
	pszGlossFeatName = storedPATRString( "gloss", pPATR_in);

p = findPATRAttribute(edgep->pFeature, pszGlossFeatName);
if (p != NULL && p->eType == PATR_ATOM)
	return p->u.pszAtom;
return "";
}
/*****************************************************************************
 * NAME
 *    writeANAWordInfoAsXML
 * ARGUMENTS
 *    ppWords_in - ANA Word info
 *    pOutputFP_in - output file
 * DESCRIPTION
 *    Output words in ANA as xml
 * RETURN VALUE
 *
 */
static void writeANAWordInfoAsXML(WordTemplate **ppWords_in, FILE *pOutputFP_in, TextControl *pTextControl_in)
{
  int iWord;
  int iParse;
  WordTemplate *wtp;
  WordAnalysis * pAnal;

  if (ppWords_in == NULL)
	return;
  fprintf(pOutputFP_in,"<Input>\n");
  for (iWord = 1; ppWords_in[iWord-1]; iWord++)
	{
	  fprintf(pOutputFP_in,"<Word id=\"word%d\">\n", iWord);
	  wtp = ppWords_in[iWord-1];
	  if (wtp->pszOrigWord != NULL)
	fprintf(pOutputFP_in,"<OrigWord id=\"w%d\">%s</OrigWord>\n",
		iWord, wtp->pszOrigWord);
	  for ( iParse=1, pAnal = wtp->pAnalyses ;
		pAnal ;
		iParse++, pAnal = pAnal->pNext )
	{
	  fprintf(pOutputFP_in,"<WordParse id=\"parse%d.%d\">\n", iWord, iParse);
	  fprintf(pOutputFP_in,"<Morphs id=\"a%d.%d\">\n", iWord, iParse);
	  WriteWordAnalysisAsXml(pAnal, pOutputFP_in, pTextControl_in, iWord, iParse);
	  fprintf(pOutputFP_in,"</Morphs>\n");
	  if (pAnal->pszCategory != NULL)
	{
	  fprintf(pOutputFP_in,"<WordCat id=\"a%d.%d\">",
		  iWord, iParse);
	  WriteWordCat(pAnal->pszCategory, pOutputFP_in);
	  fprintf(pOutputFP_in, "</WordCat>\n");
	}
	  fprintf(pOutputFP_in,"</WordParse>\n");
	}
	  if (wtp->pszFormat != NULL)
	fprintf(pOutputFP_in,"<Format id=\"fmt%d\">%s</Format>\n",
		iWord, wtp->pszFormat);
	  if (wtp->pszNonAlpha != NULL)
	fprintf(pOutputFP_in,"<NonAlpha id=\"na%d\">%s</NonAlpha>\n",
		iWord, wtp->pszNonAlpha);
	  if (wtp->iCapital != 0)
	fprintf(pOutputFP_in,"<Capital id=\"cap%d\" value=\"%d\"/>\n",
		iWord, wtp->iCapital);
	  fprintf(pOutputFP_in,"</Word>\n");
	}
  fprintf(pOutputFP_in,"</Input>\n");
}
/*****************************************************************************
 * NAME
 *    WriteWordCat
 * ARGUMENTS
 *    ppWords_in - ANA Word info
 *    pOutputFP_in - output file
 * DESCRIPTION
 *    Output word cat
 * RETURN VALUE
 *
 */
static void WriteWordCat(char *pszCat, FILE* pOutputFP_in)
{
  char *cp = strchr(pszCat, ' ');
  if (cp == NULL)
	fprintf(pOutputFP_in, "%s", pszCat);
  else
	{
	  *cp = '\0';
	  fprintf(pOutputFP_in, "%s", pszCat);
	  *cp = ' ';
	}
}
/*****************************************************************************
 * NAME
 *    WriteWordAnalysisAsXml
 * ARGUMENTS
 *    ppWords_in - ANA Word info
 *    pOutputFP_in - output file
 * DESCRIPTION
 *    Output word analysis as xml
 * RETURN VALUE
 *
 */
static void WriteWordAnalysisAsXml(WordAnalysis *pAnal, FILE *pOutputFP_in, TextControl *pTextControl_in, int iWord_in, int iParse_in)
{
  char *nextp;
  char *catp = NULL;
  int iMorph = 1;
  short state;                    /* finite state machine state */
#define WANT_PREFIX     0
#define WANT_ROOTCAT    1
#define WANT_ROOTNAME   2
#define WANT_SUFFIX     3

  char *pszAnalysis;
  char *pszDecomposition;
  char *pszCategory;
  char *pszProperties;
  char *pszFeatures;
  char *pszUnderlyingForm;
  char bufferAnalysis[BUFSIZE];
  char bufferDecomp[BUFSIZE];
  char bufferCategory[BUFSIZE];
  char bufferProperties[BUFSIZE];
  char bufferFeatures[BUFSIZE];
  char bufferUnderlyingForm[BUFSIZE];
  unsigned char cDecomp = '-';
  unsigned char cSplitter = '=';

  if (pAnal == NULL || pAnal->pszAnalysis == NULL)
	return;  /* nothing to do */
  if (pTextControl_in != NULL)
	cDecomp = pTextControl_in->cDecomp;

/*
 *  initialize the state and some pointers
 */
  state = WANT_PREFIX;
  pszDecomposition = NULL;
  pszCategory = NULL;
  pszProperties = NULL;
  pszFeatures = NULL;
  pszUnderlyingForm = NULL;
memset(&bufferAnalysis, '\0', BUFSIZE);
memset(&bufferDecomp, '\0', BUFSIZE);
memset(&bufferCategory, '\0', BUFSIZE);
memset(&bufferProperties, '\0', BUFSIZE);
memset(&bufferFeatures, '\0', BUFSIZE);
memset(&bufferUnderlyingForm, '\0', BUFSIZE);

/*  writeWordAnalysisList(pAnal, pOutputFP_in); */

/* save original of these because we change them */
  pszAnalysis = strcpy(bufferAnalysis, pAnal->pszAnalysis);
  /*
   * I do not know why, but the following causes the decomp, etc to come out
   * correctly in the Patr100.DLL when invoked by CarlaStudio Unicode version.
   * If we leave it out, the content of the underlying form field is used.
   */
  fprintf(pOutputFP_in, "", bufferDecomp);
  if (pAnal->pszDecomposition != NULL)
	pszDecomposition = strcpy(bufferDecomp, pAnal->pszDecomposition);
  fprintf(pOutputFP_in, "", bufferCategory);
  if (pAnal->pszCategory != NULL)
	pszCategory = strcpy(bufferCategory, pAnal->pszCategory);
  fprintf(pOutputFP_in, "", bufferProperties);
  if (pAnal->pszProperties != NULL)
	pszProperties = strcpy(bufferProperties, pAnal->pszProperties);
  fprintf(pOutputFP_in, "", bufferFeatures);
  if (pAnal->pszFeatures != NULL)
	pszFeatures = strcpy(bufferFeatures, pAnal->pszFeatures);
  fprintf(pOutputFP_in, "", bufferUnderlyingForm);
  if (pAnal->pszUnderlyingForm != NULL)
	pszUnderlyingForm = strcpy(bufferUnderlyingForm, pAnal->pszUnderlyingForm);
  /*
  fprintf(pOutputFP_in, "\nfd at beginning: %s\n", pszFeatures);
  fprintf(pOutputFP_in, "\nfdbuf at beginning: %s\n", bufferFeatures);
  */
/*
 *  scan across the analysis string
 */
for (	pszAnalysis = bufferAnalysis + strspn(bufferAnalysis, szWhitespace_m) ;
	*pszAnalysis != NUL ;
	pszAnalysis = nextp + strspn(nextp, szWhitespace_m) )
	{
	/*
	 *  check for state switching markers
	 */
	if (*pszAnalysis == '<')       /* is it the marker beginning roots? */
		{
		if (state == WANT_SUFFIX)
			{
			/* shouldn't happen */
			}
		else if (state != WANT_PREFIX)
			{
		  return; /* something's really wrong */
			}
		state = WANT_ROOTCAT;   /* next thing we want is a root category */
		nextp = pszAnalysis + 1;
		continue;
		}
	if (*pszAnalysis == '>')         /* is it the marker ending roots? */
		{
		if (state != WANT_ROOTCAT)
			{
		  return; /* something's really wrong */
			}
		state = WANT_SUFFIX;    /* now we go looking for suffixes */
		nextp = pszAnalysis + 1;
		continue;
		}
	/*
	 *  handle the token in the input string according to the state
	 */
	nextp = isolateWord(pszAnalysis);           /* split out the token */
	switch (state)
	  {
	  case WANT_PREFIX:
	fprintf(pOutputFP_in, "<Prefix id=\"pfx%d.%d.%d\">\n",
		iWord_in, iParse_in, iMorph);
	fprintf(pOutputFP_in, "<Morph id=\"m%d.%d.%d\">%s</Morph>\n",
		iWord_in, iParse_in, iMorph, pszAnalysis);
	WriteAnalysisSubpartAsXml(&pszUnderlyingForm, cSplitter, "UnderForm", "ul",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszDecomposition, cDecomp, "Decomp", "d",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszCategory, cSplitter, "MorphCat", "mcat",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszProperties, cSplitter, "Prop", "p",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszFeatures, cSplitter, "FeatDesc", "fd",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	fprintf(pOutputFP_in, "</Prefix>\n");
	iMorph++;
	break;

	  case WANT_ROOTCAT:
	catp = pszAnalysis;
	state = WANT_ROOTNAME;
	break;

	  case WANT_ROOTNAME:
	fprintf(pOutputFP_in, "<Root id=\"rt%d.%d.%d\">\n",
		iWord_in, iParse_in, iMorph);
	fprintf(pOutputFP_in, "<Morph id=\"m%d.%d.%d\">%s</Morph>\n",
		iWord_in, iParse_in, iMorph, pszAnalysis);
	WriteAnalysisSubpartAsXml(&pszUnderlyingForm, cSplitter, "UnderForm", "ul",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszDecomposition, cDecomp, "Decomp", "d",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(& catp, cSplitter, "MorphCat", "mcat",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszProperties, cSplitter, "Prop", "p",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszFeatures, cSplitter, "FeatDesc", "fd",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	fprintf(pOutputFP_in, "</Root>\n");
	state = WANT_ROOTCAT;
	iMorph++;
	break;

	  case WANT_SUFFIX:
	fprintf(pOutputFP_in, "<Suffix id=\"sfx%d.%d.%d\">\n",
		iWord_in, iParse_in, iMorph);
	fprintf(pOutputFP_in, "<Morph id=\"m%d.%d.%d\">%s</Morph>\n",
		iWord_in, iParse_in, iMorph, pszAnalysis);
	WriteAnalysisSubpartAsXml(&pszUnderlyingForm, cSplitter, "UnderForm", "ul",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszDecomposition, cDecomp, "Decomp", "d",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszCategory, cSplitter, "MorphCat", "mcat",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszProperties, cSplitter, "Prop", "p",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	WriteAnalysisSubpartAsXml(&pszFeatures, cSplitter, "FeatDesc", "fd",
				  pOutputFP_in, iWord_in, iParse_in, iMorph);
	fprintf(pOutputFP_in, "</Suffix>\n");
	iMorph++;
	break;

	  } /* end switch */
	} /* end for */
}
/*****************************************************************************
 * NAME
 *    WriteAnalysisSubpartAsXml
 * ARGUMENTS
 *    ppWords_in - ANA Word info
 *    pOutputFP_in - output file
 * DESCRIPTION
 *    Output word analysis as xml
 * RETURN VALUE
 *
 */
static void WriteAnalysisSubpartAsXml(char **ppszItem, unsigned char cBreak, char *pszElement, char *pszId, FILE *pOutputFP_in, int iWord_in, int iParse_in, int iMorph_in)
{
  char *pszEnd;

  if (ppszItem == NULL || *ppszItem == NULL)
	return;
  pszEnd = strchr(*ppszItem, cBreak);
  if (pszEnd != NULL)
	*pszEnd = '\0';
  fprintf(pOutputFP_in, "<%s id=\"%s%d.%d.%d\">%s</%s>\n",
	  pszElement, pszId, iWord_in, iParse_in, iMorph_in, *ppszItem, pszElement);
  if (pszEnd != NULL)
	*ppszItem = pszEnd + 1;
}
