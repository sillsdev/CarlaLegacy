/* WRITESTS.C - write AMPLE tests to the log file for debugging/verification
 ***************************************************************************
 *
 * void writeAmpleTests(const char * pszType_in,
 *			AmpleData *  pAmple_in)
 *
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"

static void	tree_walk  P((AmpleTestNode *	pTest_in,
				  int		iDepth_in,
				  const char *	pszType_in,
				  AmpleData *	pAmple_in));
static void	t_indent   P((int	  iDepth_in,
				  char *	  pszString_in,
				  AmpleData * pAmple_in));
static void	show_where P((int	  iPosition_in,
				  AmpleData * pAmple_in));

/***************************************************************************
 * NAME
 *    writeAmpleTests
 * DESCRIPTION
 *    Show the test names in the order they'll be called, and expand the
 *    parse trees for user defined tests.
 * RETURN VALUE
 *    none
 */
void writeAmpleTests(pszType_in, pAmple_in)
const char *	pszType_in;	/* kind of test being shown */
AmpleData *	pAmple_in;	/* current AMPLE data, including tests */
{
AmpleTestList *	pTest;

if ((pAmple_in == NULL) || (pAmple_in->pLogFP == NULL))
	return;
switch (*pszType_in)
	{
	case 'P':	pTest = pAmple_in->pPrefixSuccTests;	break;
	case 'I':	pTest = pAmple_in->pInfixSuccTests;	break;
	case 'R':	pTest = pAmple_in->pRootSuccTests;	break;
	case 'S':	pTest = pAmple_in->pSuffixSuccTests;	break;
	default:	pTest = pAmple_in->pFinalTests;		break;
	}
for ( ; pTest ; pTest = pTest->pNext )
	{
	if (pTest->pTestTree)
	tree_walk(pTest->pTestTree, 0, pszType_in, pAmple_in);
	else
	fprintf( pAmple_in->pLogFP, "\n%s Test %s  (builtin test)\n",
		 pszType_in, pTest->pszName );
	}
}

/***************************************************************************
 * NAME
 *    tree_walk
 * ARGUMENTS
 *    pTest_in - pointer to the test to be traversed
 *    iDepth_in - indentation depth for printout
 * DESCRIPTION
 *    Traverse the syntax tree structure in inorder fashion.
 * RETURN VALUE
 *    none
 */
static void tree_walk(pTest_in, iDepth_in, pszType_in, pAmple_in)
AmpleTestNode *	pTest_in;
int		iDepth_in;
const char *	pszType_in;
AmpleData *	pAmple_in;
{
char *	p;

if (pAmple_in->pLogFP == NULL)
	return;

t_indent(iDepth_in, (pTest_in->iOpCode&OP_NOT) ? "NOT " : "", pAmple_in);

switch (pTest_in->iOpCode & OP_MASK)
	{
	case TOP_NODE:
	fprintf( pAmple_in->pLogFP,
		 "\n%s Test %s\n----------------------------\n",
		 pszType_in, pTest_in->uRight.pszString );
	tree_walk( pTest_in->uLeft.pChild, iDepth_in, pszType_in, pAmple_in);
	break;
	case LOGAND:	/* 'AND' (A && B) */
	fprintf( pAmple_in->pLogFP, "(\n");
	tree_walk( pTest_in->uLeft.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,"AND\n", pAmple_in);
	tree_walk( pTest_in->uRight.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,")\n", pAmple_in);
	break;
	case LOGOR: /* 'OR' (A || B) */
	fprintf( pAmple_in->pLogFP, "(\n");
	tree_walk( pTest_in->uLeft.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,"OR\n", pAmple_in);
	tree_walk( pTest_in->uRight.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,")\n", pAmple_in);
	break;
	case LOGXOR:	/* 'XOR' ((!A && B) || (A && !B)) */
	fprintf( pAmple_in->pLogFP, "(\n");
	tree_walk( pTest_in->uLeft.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,"XOR\n", pAmple_in);
	tree_walk( pTest_in->uRight.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,")\n", pAmple_in);
	break;
	case LOGIFF:	/* 'IFF' ((A && B) || (!A && !B)) */
	fprintf( pAmple_in->pLogFP, "(\n");
	tree_walk( pTest_in->uLeft.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,"IFF\n", pAmple_in);
	tree_walk( pTest_in->uRight.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,")\n", pAmple_in);
	break;
	case LOGIF: /* 'IF' ... 'THEN' (!A || B) */
	fprintf( pAmple_in->pLogFP, "(\n");
	t_indent(iDepth_in,"IF\n", pAmple_in);
	tree_walk( pTest_in->uLeft.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,"THEN\n", pAmple_in);
	tree_walk( pTest_in->uRight.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,")\n", pAmple_in);
	break;
	case ALL_LEFT:	/* 'FOR_ALL_LEFT' */
	fprintf( pAmple_in->pLogFP, "(\n");
	t_indent(iDepth_in,"FOR_ALL_LEFT\n", pAmple_in);
	tree_walk( pTest_in->uLeft.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,")\n", pAmple_in);
	break;
	case SOME_LEFT:	/* 'FOR_SOME_LEFT' */
	fprintf( pAmple_in->pLogFP, "(\n");
	t_indent(iDepth_in,"FOR_SOME_LEFT\n", pAmple_in);
	tree_walk( pTest_in->uLeft.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,")\n", pAmple_in);
	break;
	case ALL_RIGHT:	/* 'FOR_ALL_RIGHT' */
	fprintf( pAmple_in->pLogFP, "(\n");
	t_indent(iDepth_in,"FOR_ALL_RIGHT\n", pAmple_in);
	tree_walk( pTest_in->uLeft.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,")\n", pAmple_in);
	break;
	case SOME_RIGHT:	/* 'FOR_SOME_RIGHT' */
	fprintf( pAmple_in->pLogFP, "(\n");
	t_indent(iDepth_in,"FOR_SOME_RIGHT\n", pAmple_in);
	tree_walk( pTest_in->uLeft.pChild, iDepth_in+1, pszType_in, pAmple_in);
	t_indent(iDepth_in,")\n", pAmple_in);
	break;

	case PROP_IS:	/* 'property' 'is' IDENTIFIER */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	p =  findAmplePropertyName(pTest_in->uRight.uiProperty,
				   &pAmple_in->sProperties);
	fprintf( pAmple_in->pLogFP, "property is %s\n",	p ? p : "??UNKNOWN??");
	break;
	case MORPH_IS:	/* 'morphname' 'is' STRING */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP,
		 "morphname is \"%s\"\n", pTest_in->uRight.pszString );
	break;
	case MORPH_MEMBER:	/* 'morphname' 'is' 'member' IDENTIFIER */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "morphname is member %s\n",
		 pTest_in->uRight.pMorphClass->pszName);
	break;
	case MOR_IS_MORPH: /* 'morphname' 'is' ... 'morphname' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "morphname is ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "morphname\n");
	break;
	case ALLO_IS:	/* 'allomorph' 'is'  STRING */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP,
		 "allomorph is \"%s\"\n", pTest_in->uRight.pszString );
	break;
	case ALLO_MEMBER:	/* 'allomorph' 'is' 'member' IDENTIFIER */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "allomorph is member %s\n",
		 pTest_in->uRight.pStringClass->pszName );
	break;
	case ALLO_IS_AL:	/* 'allomorph' 'is' ... 'allomorph' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "allomorph is ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "allomorph\n");
	break;
	case ALLO_MATCH:	/* 'allomorph' 'matches'  STRING */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "allomorph matches \"%s\"\n",
		 pTest_in->uRight.pszString );
	break;
	case AL_MAT_MEM: /* 'allomorph' 'matches' 'member' IDENTIFIER */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "allomorph matches member %s\n",
		 pTest_in->uRight.pStringClass->pszName );
	break;
	case AL_MAT_AL:	/* 'allomorph' 'matches' ... 'allomorph' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "allomorph matches ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "allomorph\n");
	break;
	case STRING_IS:	/* 'string' 'is'  STRING */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP,
		 "string is \"%s\"\n", pTest_in->uRight.pszString );
	break;
	case STRING_MEMBER: /* 'string' 'is' 'member' IDENTIFIER */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "string is member %s\n",
		 pTest_in->uRight.pStringClass->pszName );
	break;
	case ST_IS_AL: /* 'string' 'is' ... 'allomorph' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "string is ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "allomorph\n");
	break;
	case ST_MATCH:	/* 'string' 'matches'  STRING */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP,
		 "string matches \"%s\"\n", pTest_in->uRight.pszString );
	break;
	case ST_MAT_MEM: /* 'string' 'matches' 'member' IDENTIFIER */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "string matches member %s\n",
		 pTest_in->uRight.pStringClass->pszName );
	break;
	case ST_MAT_AL: /* 'string' 'matches' ... 'allomorph' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "string matches ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "allomorph\n");
	break;

	case WORD_IS:	/* ... 'word' 'is' STRING */
	fprintf( pAmple_in->pLogFP, "%s word is \"%s\"\n",
		(pTest_in->uLeft.iPosition==LAST)?"last":"next",
		pTest_in->uRight.pszString );
	break;
	case WORD_MEMBER:	/* 'word' 'is' 'member' IDENTIFIER */
	fprintf( pAmple_in->pLogFP, "%s word is member %s\n",
		(pTest_in->uLeft.iPosition==LAST)?"last":"next",
		pTest_in->uRight.pStringClass->pszName );
	break;
	case WORD_MATCH:	/* 'word' 'matches' STRING */
	fprintf( pAmple_in->pLogFP, "%s word matches \"%s\"\n",
		(pTest_in->uLeft.iPosition==LAST)?"last":"next",
		pTest_in->uRight.pszString );
	break;
	case WD_MAT_MEM: /* 'word' 'matches' 'member' IDENTIFIER */
	fprintf( pAmple_in->pLogFP, "%s word matches member %s\n",
		(pTest_in->uLeft.iPosition==LAST)?"last":"next",
		pTest_in->uRight.pStringClass->pszName );
	break;

	case TYPE_IS:	/* 'type' 'is' <type> */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "type is ");
	switch (pTest_in->uRight.iValue)
		{
		case AMPLE_PFX:	fprintf( pAmple_in->pLogFP, "prefix");	break;
		case AMPLE_IFX:	fprintf( pAmple_in->pLogFP, "infix");	break;
		case AMPLE_ROOT:	fprintf( pAmple_in->pLogFP, "root");	break;
		case AMPLE_SFX:	fprintf( pAmple_in->pLogFP, "suffix");	break;
		case WINITIAL:	fprintf( pAmple_in->pLogFP, "initial");	break;
		case WFINAL:	fprintf( pAmple_in->pLogFP, "final");	break;
		default:		fprintf( pAmple_in->pLogFP, "<?>");	break;
		}
	fprintf( pAmple_in->pLogFP, "\n");
	break;
	case FROM_IS_FROM:	/* 'fromcategory' 'is' ... 'fromcategory' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "fromcategory is ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "fromcategory\n");
	break;
	case FR_IS_TO:	/* 'fromcategory' 'is' ... 'tocategory' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "fromcategory is ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "tocategory\n");
	break;
	case TO_IS_FROM:	/* 'tocategory' 'is' ... 'fromcategory' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "tocategory is ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "fromcategory\n");
	break;
	case TO_IS_TO:	/* 'tocategory' 'is' ... 'tocategory' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "tocategory is ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "tocategory\n");
	break;
	case FROM_MEMBER:	/* 'fromcategory 'is' 'member' IDENTIFIER */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "fromcategory is member %s\n",
		 pTest_in->uRight.pCategClass->pszName );
	break;
	case TO_MEMBER:	/* 'tocategory 'is' 'member' IDENTIFIER */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "tocategory is member %s\n",
		 pTest_in->uRight.pCategClass->pszName);
	break;
	case FROM_IS:	/* 'fromcategory 'is' IDENTIFIER */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "fromcategory is %s\n",
		 findAmpleCategoryName((int)pTest_in->uRight.iValue,
					   pAmple_in->pCategories) );
	break;
	case TO_IS: /* 'tocategory 'is' IDENTIFIER */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "tocategory is %s\n",
		 findAmpleCategoryName((int)pTest_in->uRight.iValue,
					   pAmple_in->pCategories) );
	break;
	case ORDR_EQ:	/* 'orderclass' '=' ... 'orderclass' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass = ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass\n");
	break;
	case ORDR_GT:	/* 'orderclass' '>' ... 'orderclass' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass > ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass\n");
	break;
	case ORDR_GE:	/* 'orderclass' '>=' ... 'orderclass' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass >= ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass\n");
	break;
	case ORDR_LE:	/* 'orderclass' '<=' ... 'orderclass' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass <= ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass\n");
	break;
	case ORDR_LT:	/* 'orderclass' '<' ... 'orderclass' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass < ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass\n");
	break;
	case ORDR_NE:	/* 'orderclass' '~=' ... 'orderclass' */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass ~= ");
	show_where( pTest_in->uRight.iValue, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass\n");
	break;
	case ORDR_EQ_CON:	/* 'orderclass' '=' CONSTANT */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass = %d\n", pTest_in->uRight.iValue );
	break;
	case ORDR_GT_CON:	/* 'orderclass' '>' CONSTANT */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass > %d\n", pTest_in->uRight.iValue );
	break;
	case ORDR_GE_CON:	/* 'orderclass' '>=' CONSTANT */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass >= %d\n", pTest_in->uRight.iValue);
	break;
	case ORDR_LE_CON:	/* 'orderclass' '<=' CONSTANT */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass <= %d\n", pTest_in->uRight.iValue);
	break;
	case ORDR_LT_CON:	/* 'orderclass' '<' CONSTANT */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass < %d\n", pTest_in->uRight.iValue );
	break;
	case ORDR_NE_CON:	/* 'orderclass' '~=' CONSTANT */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "orderclass ~= %d\n", pTest_in->uRight.iValue);
	break;
	case AL_IS_CAP:	  /* 'allomorph' 'is' 'capitalized' 1.9zb BJY */
	show_where( pTest_in->uLeft.iPosition, pAmple_in );
	fprintf( pAmple_in->pLogFP, "allomorph is capitalized\n" );
	break;
	case WD_IS_CAP:	  /* 'word' 'is' 'capitalized' 1.9zb BJY */
	fprintf( pAmple_in->pLogFP, "word is capitalized\n" );
	break;
				/* 3.3.0 hab */
	case PUNCT_IS:	/* ... 'punctuation' 'is' STRING */
	fprintf( pAmple_in->pLogFP, "%s punctuation is \"%s\"\n",
		(pTest_in->uLeft.iPosition==LAST)?"last":"next",
		pTest_in->uRight.pszString );
	break;
				/* 3.3.0 hab */
	case PUNCT_MEMBER:	/* 'punctuation' 'is' 'member' IDENTIFIER */
	fprintf( pAmple_in->pLogFP, "%s punctuation is member %s\n",
		(pTest_in->uLeft.iPosition==LAST)?"last":"next",
		pTest_in->uRight.pPunctClass->pszName );
	break;
	default:
	fprintf( pAmple_in->pLogFP, "<<? UNKNOWN NODE TYPE ?>>\n");
	break;
	}
} /* end tree_walk */

/***************************************************************************
 * NAME
 *    t_indent
 * ARGUMENTS
 *    iDepth_in - indentation depth for printout
 *    pszString_in   - what to display
 * DESCRIPTION
 *    indent for the tree display
 * RETURN VALUE
 *    none
 */
static void t_indent(iDepth_in, pszString_in, pAmple_in)
int		iDepth_in;
char *		pszString_in;
AmpleData *	pAmple_in;
{
register int k;

if (pAmple_in->pLogFP == NULL)
	return;
for ( k = 0 ; k < iDepth_in ; ++k )
	fprintf( pAmple_in->pLogFP, "    ");
fprintf( pAmple_in->pLogFP, "%s", pszString_in);
}

/***************************************************************************
 * NAME
 *    show_where
 * ARGUMENTS
 *    pos   - morpheme position
 * DESCRIPTION
 *    show the morpheme position
 * RETURN VALUE
 *    none
 */
static void show_where( pos, pAmple_in )
int		pos;
AmpleData *	pAmple_in;
{
if (pAmple_in->pLogFP == NULL)
	return;
switch (pos)
	{
	case ARGCURRENT:	fprintf( pAmple_in->pLogFP, "current ");   break;
	case ARGLEFT:	fprintf( pAmple_in->pLogFP, "left ");      break;
	case ARGRIGHT:	fprintf( pAmple_in->pLogFP, "right ");     break;
	case FORLEFT:	fprintf( pAmple_in->pLogFP, "LEFT ");      break;
	case FORRIGHT:	fprintf( pAmple_in->pLogFP, "RIGHT ");     break;
	case INITIALM:	fprintf( pAmple_in->pLogFP, "INITIAL ");   break;
	case FINALM:	fprintf( pAmple_in->pLogFP, "FINAL ");     break;
	default:		fprintf( pAmple_in->pLogFP, "<?> ");       break;
	}
}
