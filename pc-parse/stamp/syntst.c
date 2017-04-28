/*      SYNTST.C - functions for dealing with user-defined tests
 ***************************************************************************
 *
 * void addStampTest(char *      src,
 *		     StampData * pStamp_in)
 *
 * void writeStampTests(FILE *      pOutputFP_in,
 *                      StampData * pStamp_in)
 *
 * int applyStampTests(StampAnalysis * headp,
 *		       char *          wordp,
 *		       StampAnalysis * curmp,
 *                     int             level,
 *                     StampUnit     * pUnit_in,
 *		       StampData *     pStamp_in)
 *
 * void writeStampTestStatistics(FILE *      pOutputFP_in,
 *				 StampData * pStamp_in)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1989, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#include <ctype.h>
#include "stamp.h"

/*************************************************************************
 *      data used by the tests but hidden from everyone else
 */
static StampAnalysis *	pAnalHead_m;	/* for WINITIAL morpheme access */
static StampAnalysis *	pAnalTail_m;	/* for WFINAL morpheme access */
StampAnalysis *		pForLeft_m;	/* used in FOR_*_LEFT */
StampAnalysis *		pForRight_m;	/* used in FOR_*_RIGHT */
static StampAnalysis *	pCurrent_m;	/* points to current node in list */
static char *		pszSynWord_m;	/* points to synthetic word */
static char *		pszTestName_m;	/* points to name of test */

static void		show_tree P((AmpleTestNode * pTest_in,
					 int             depth,
					 FILE *          pOutputFP_in,
					 StampData *     pStamp_in));
static void		t_indent P((int    depth,
					char * str,
					FILE * pOutputFP_in));
static void		show_where P((int    pos,
					  FILE * pOutputFP_in));
				/* 2.1b1 hab */
static void		show_neighbor P((int    pos,
					 FILE * pOutputFP_in));
static int		user_test P((AmpleTestNode * tp,
					 StampUnit *     pUnit_in,
					 StampData *     pStamp_in));
static StampAnalysis *	getpos P((int  pos));
static char  *		get_surf P((int  pos));
static char *		get_punct P((int pos,
									 StampUnit * pUnit_in)); /* 2.1b1 hab */
static void		do_action P((StampAction * actp,
					 char * name,
					 StampData * pStamp_in));

/*************************************************************************
 * NAME
 *    addStampTest
 * DESCRIPTION
 *    Parse a test and, if successful, add it to the end of the ordered
 *    list of synthesis tests.
 * RETURN VALUE
 *    none
 */
void addStampTest(src, pStamp_in)
char *		src;		/* source text of a user-written test */
StampData *	pStamp_in;
{
StampTestList *	pTest;
StampTestList *	pNewTest;
/*
 *  pointers to test tree and action list built by yyparse()
 */
AmpleTestNode *		pTestTree;
StampAction *		pTestActions;
/*
 *  parse the test to build a parse tree.  if the parse fails, quit.
 */
pTestActions = NULL;
pTestTree = parseStampTest(src, "\nSYNTHESIS TEST: ", &pTestActions,
			   pStamp_in);
if (pTestTree == NULL)
	return;
/*
 *  allocate a new node and fill in the fields
 */
pNewTest = (StampTestList *)allocMemory( sizeof(StampTestList) );
pNewTest->pTest   = pTestTree;			/* set by yyparse() */
pNewTest->pAction = pTestActions;		/* set by yyparse() also */
pNewTest->pNext   = NULL;
/*
 *  add the test to the end of the ordered list
 */
if (pStamp_in->pSynthesisTests == NULL)
	pStamp_in->pSynthesisTests = pNewTest;
else
	{
	for (   pTest = pStamp_in->pSynthesisTests ;
		pTest->pNext ;
		pTest = pTest->pNext )
		;
	pTest->pNext = pNewTest;
	}
}

/*************************************************************************
 * NAME
 *    writeStampTests
 * DESCRIPTION
 *    pretty print all the tests in the list
 * RETURN VALUE
 *    none
 */
void writeStampTests(pOutputFP_in, pStamp_in)
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
StampTestList *	pTest;

if ((pStamp_in == NULL) || (pOutputFP_in == NULL))
	return;

for ( pTest = pStamp_in->pSynthesisTests ; pTest ; pTest = pTest->pNext )
	show_tree(pTest->pTest, 0, pOutputFP_in, pStamp_in);
}

/***************************************************************************
 * NAME
 *    show_tree
 * ARGUMENTS
 *    testp - pointer to the test to be traversed
 *    depth - indentation depth for printout
 * DESCRIPTION
 *    Traverse the syntax tree structure in inorder fashion.
 * RETURN VALUE
 *    none
 */
static void show_tree(testp,depth, pOutputFP_in, pStamp_in)
AmpleTestNode *	testp;
int		depth;
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
char *	p;

t_indent(depth, (testp->iOpCode&OP_NOT) ? "NOT " : "", pOutputFP_in);

switch (testp->iOpCode & OP_MASK)
	{
	case TOP_NODE:
		fprintf(pOutputFP_in,
		"\nSynthesis Test %s\n----------------------------\n",
		testp->uRight.pszString );
		show_tree( testp->uLeft.pChild, depth, pOutputFP_in, pStamp_in );
		break;
	case LOGAND:        /* 'AND' (A && B) */
		fprintf(pOutputFP_in, "(\n");
		show_tree( testp->uLeft.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, "AND\n", pOutputFP_in);
		show_tree( testp->uRight.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, ")\n", pOutputFP_in);
		break;
	case LOGOR: /* 'OR'  (A || B) */
		fprintf(pOutputFP_in, "(\n");
		show_tree( testp->uLeft.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, "OR\n", pOutputFP_in);
		show_tree( testp->uRight.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, ")\n", pOutputFP_in);
		break;
	case LOGXOR:        /* 'XOR' ((!A && B) || (A && !B)) */
		fprintf(pOutputFP_in, "(\n");
		show_tree( testp->uLeft.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, "XOR\n", pOutputFP_in);
		show_tree( testp->uRight.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, ")\n", pOutputFP_in);
		break;
	case LOGIFF:        /* 'IFF' ((A && B) || (!A && !B)) */
		fprintf(pOutputFP_in, "(\n");
		show_tree( testp->uLeft.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, "IFF\n", pOutputFP_in);
		show_tree( testp->uRight.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, ")\n", pOutputFP_in);
		break;
	case LOGIF: /* 'IF' ... 'THEN' (!A || B) */
		fprintf(pOutputFP_in, "(\n");
		t_indent(depth, "IF\n", pOutputFP_in);
		show_tree( testp->uLeft.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, "THEN\n", pOutputFP_in);
		show_tree( testp->uRight.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, ")\n", pOutputFP_in);
		break;
	case ALL_LEFT:      /* 'FOR_ALL_LEFT' */
		fprintf(pOutputFP_in, "(\n");
		t_indent(depth, "FOR_ALL_LEFT\n", pOutputFP_in);
		show_tree( testp->uLeft.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, ")\n", pOutputFP_in);
		break;
	case SOME_LEFT:     /* 'FOR_SOME_LEFT' */
		fprintf(pOutputFP_in, "(\n");
		t_indent(depth, "FOR_SOME_LEFT\n", pOutputFP_in);
		show_tree( testp->uLeft.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, ")\n", pOutputFP_in);
		break;
	case ALL_RIGHT:     /* 'FOR_ALL_RIGHT' */
		fprintf(pOutputFP_in, "(\n");
		t_indent(depth, "FOR_ALL_RIGHT\n", pOutputFP_in);
		show_tree( testp->uLeft.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, ")\n", pOutputFP_in);
		break;
	case SOME_RIGHT:    /* 'FOR_SOME_RIGHT' */
		fprintf(pOutputFP_in, "(\n");
		t_indent(depth, "FOR_SOME_RIGHT\n", pOutputFP_in);
		show_tree( testp->uLeft.pChild, depth+1, pOutputFP_in, pStamp_in );
		t_indent(depth, ")\n", pOutputFP_in);
		break;

	case PROP_IS:       /* 'property' 'is' IDENTIFIER */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "property is ");
	p =  findAmplePropertyName(testp->uRight.uiProperty,
				   &pStamp_in->sProperties);
	fprintf( pStamp_in->pLogFP, "property is %s\n",	p ? p : "??UNKNOWN??");
		break;
	case MORPH_IS:      /* 'morphname' 'is' STRING */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "morphname is \"%s\"\n",
		testp->uRight.pszString );
		break;
	case MORPH_MEMBER:  /* 'morphname' 'is' 'member' IDENTIFIER */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "morphname is member %s\n",
		testp->uRight.pMorphClass->pszName );
		break;
	case MOR_IS_MORPH: /* 'morphname' 'is' ... 'morphname' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "morphname is ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "morphname\n");
		break;
	case ALLO_IS:       /* 'allomorph' 'is'  STRING */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "allomorph is \"%s\"\n",
		testp->uRight.pszString );
		break;
	case ALLO_MEMBER:   /* 'allomorph' 'is' 'member' IDENTIFIER */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "allomorph is member %s\n",
		testp->uRight.pStringClass->pszName );
		break;
	case ALLO_IS_AL:    /* 'allomorph' 'is' ... 'allomorph' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "allomorph is ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "allomorph\n");
		break;
	case ALLO_MATCH:    /* 'allomorph' 'matches'  STRING */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "allomorph matches \"%s\"\n",
		testp->uRight.pszString );
		break;
	case AL_MAT_MEM: /* 'allomorph' 'matches' 'member' IDENTIFIER */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "allomorph matches member %s\n",
		testp->uRight.pStringClass->pszName );
		break;
	case AL_MAT_AL:     /* 'allomorph' 'matches' ... 'allomorph' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "allomorph matches ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "allomorph\n");
		break;
	case STRING_IS:     /* 'string' 'is'  STRING */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "string is \"%s\"\n", testp->uRight.pszString );
		break;
	case STRING_MEMBER: /* 'string' 'is' 'member' IDENTIFIER */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "string is member %s\n",
		testp->uRight.pStringClass->pszName );
		break;
	case ST_IS_AL: /* 'string' 'is' ... 'allomorph' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "string is ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "allomorph\n");
		break;
	case ST_MATCH:      /* 'string' 'matches'  STRING */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "string matches \"%s\"\n",
		testp->uRight.pszString );
		break;
	case ST_MAT_MEM: /* 'string' 'matches' 'member' IDENTIFIER */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "string matches member %s\n",
		testp->uRight.pStringClass->pszName );
		break;
	case ST_MAT_AL: /* 'string' 'matches' ... 'allomorph' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "string matches ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "allomorph\n");
		break;

	case TYPE_IS:       /* 'type' 'is' <type> */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "type is ");
		switch (testp->uRight.iValue)
			{
			case PFX:           fprintf(pOutputFP_in, "prefix");       break;
			case IFX:           fprintf(pOutputFP_in, "infix");        break;
			case ROOT:          fprintf(pOutputFP_in, "root");         break;
			case SFX:           fprintf(pOutputFP_in, "suffix");       break;
			case WINITIAL:      fprintf(pOutputFP_in, "initial");      break;
			case WFINAL:        fprintf(pOutputFP_in, "final");        break;
			default:            fprintf(pOutputFP_in, "<?>");          break;
			}
		fprintf(pOutputFP_in, "\n");
		break;
	case FROM_IS_FROM:  /* 'fromcategory' 'is' ... 'fromcategory' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "fromcategory is ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "fromcategory\n");
		break;
	case FR_IS_TO:      /* 'fromcategory' 'is' ... 'tocategory' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "fromcategory is ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "tocategory\n");
		break;
	case TO_IS_FROM:    /* 'tocategory' 'is' ... 'fromcategory' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "tocategory is ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "fromcategory\n");
		break;
	case TO_IS_TO:      /* 'tocategory' 'is' ... 'tocategory' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "tocategory is ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "tocategory\n");
		break;
	case FROM_MEMBER:   /* 'fromcategory 'is' 'member' IDENTIFIER */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "fromcategory is member %s\n",
		testp->uRight.pCategClass->pszName );
		break;
	case TO_MEMBER:     /* 'tocategory 'is' 'member' IDENTIFIER */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "tocategory is member %s\n",
		testp->uRight.pCategClass->pszName );
		break;
	case FROM_IS:       /* 'fromcategory 'is' IDENTIFIER */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "fromcategory is %s (%d)\n",
		   findAmpleCategoryName(testp->uRight.iValue,
					 pStamp_in->pCategories),
		   testp->uRight.iValue );
		break;
	case TO_IS:         /* 'tocategory 'is' IDENTIFIER */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "tocategory is %s (%d)\n",
		   findAmpleCategoryName(testp->uRight.iValue,
					 pStamp_in->pCategories),
		   testp->uRight.iValue );
		break;
	case ORDR_EQ:       /* 'orderclass' '=' ... 'orderclass' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass = ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass\n");
		break;
	case ORDR_GT:       /* 'orderclass' '>' ... 'orderclass' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass > ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass\n");
		break;
	case ORDR_GE:       /* 'orderclass' '>=' ... 'orderclass' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass >= ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass\n");
		break;
	case ORDR_LE:       /* 'orderclass' '<=' ... 'orderclass' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass <= ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass\n");
		break;
	case ORDR_LT:       /* 'orderclass' '<' ... 'orderclass' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass < ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass\n");
		break;
	case ORDR_NE:       /* 'orderclass' '~=' ... 'orderclass' */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass ~= ");
		show_where( testp->uRight.iValue, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass\n");
		break;
	case ORDR_EQ_CON:   /* 'orderclass' '=' CONSTANT */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass = %d\n", testp->uRight.iValue );
		break;
	case ORDR_GT_CON:   /* 'orderclass' '>' CONSTANT */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass > %d\n", testp->uRight.iValue );
		break;
	case ORDR_GE_CON:   /* 'orderclass' '>=' CONSTANT */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass >= %d\n", testp->uRight.iValue );
		break;
	case ORDR_LE_CON:   /* 'orderclass' '<=' CONSTANT */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass <= %d\n", testp->uRight.iValue );
		break;
	case ORDR_LT_CON:   /* 'orderclass' '<' CONSTANT */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass < %d\n", testp->uRight.iValue );
		break;
	case ORDR_NE_CON:   /* 'orderclass' '~=' CONSTANT */
		show_where( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "orderclass ~= %d\n", testp->uRight.iValue );
		break;
				/* 2.1b1 hab */
	case PUNCT_IS:     /* 'punctuation' 'is'  STRING */
		show_neighbor( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "punctuation is \"%s\"\n", testp->uRight.pszString );
		break;
				/* 2.1b1 hab */
	case PUNCT_MEMBER: /* 'punctuation' 'is' 'member' IDENTIFIER */
		show_neighbor( testp->uLeft.iPosition, pOutputFP_in );
		fprintf(pOutputFP_in, "punctuation is member %s\n",
		testp->uRight.pPunctClass->pszName );
		break;
	default:
		fprintf(pOutputFP_in, "<<? UNKNOWN NODE TYPE ?>>\n");
		break;
	}
} /* end show_tree */

/*****************************************************************************
 * NAME
 *    t_indent
 * DESCRIPTION
 *    indent for the tree display
 * RETURN VALUE
 *    none
 */
static void t_indent(depth, str, pOutputFP_in)
int	depth;
char *	str;
FILE *	pOutputFP_in;
{
int k;

for ( k = 0 ; k < depth ; ++k )
	fprintf(pOutputFP_in, "    ");
fprintf(pOutputFP_in, "%s",str);
}

/*****************************************************************************
 * NAME
 *    show_where
 * DESCRIPTION
 *    show the morpheme position
 * RETURN VALUE
 *    none
 */
static void show_where( pos, pOutputFP_in )
int	pos;
FILE *	pOutputFP_in;
{
switch (pos)
	{
	case ARGCURRENT:    fprintf(pOutputFP_in, "current ");     break;
	case ARGLEFT:       fprintf(pOutputFP_in, "left ");        break;
	case ARGRIGHT:      fprintf(pOutputFP_in, "right ");       break;
	case FORLEFT:       fprintf(pOutputFP_in, "LEFT ");        break;
	case FORRIGHT:      fprintf(pOutputFP_in, "RIGHT ");       break;
	case INITIALM:      fprintf(pOutputFP_in, "INITIAL ");     break;
	case FINALM:        fprintf(pOutputFP_in, "FINAL ");       break;
	default:            fprintf(pOutputFP_in, "<?> ");         break;
	}
}

/*****************************************************************************
 * NAME
 *    show_neighbor
 * DESCRIPTION
 *    show the morpheme position
 * RETURN VALUE
 *    none
 */
static void show_neighbor( pos, pOutputFP_in )
int	pos;
FILE *	pOutputFP_in;
{
switch (pos)
	{
	case LAST:    fprintf(pOutputFP_in, "last ");     break;
	case NEXT:    fprintf(pOutputFP_in, "next ");     break;
	default:      fprintf(pOutputFP_in, "<?> ");      break;
	}
}

/*************************************************************************
 * NAME
 *    applyStampTests
 * DESCRIPTION
 *    Apply every test in the list to the word at the current morpheme.
 * RETURN VALUE
 *    TRUE (nonzero) if the word passes the tests for this morpheme and
 *    allomorph, FALSE (zero) if it fails
 */
#ifndef hab217
int applyStampTests(headp, wordp, curmp, level, pUnit_in, pStamp_in)
StampAnalysis *	headp;		/* pointer to list of analysis morphemes */
char *		wordp;		/* pointer to a synthesized word */
StampAnalysis *	curmp;		/* pointer to the current morpheme to apply the
				   tests to */
int             level;          /* trace printout indentation level */
StampUnit *	pUnit_in;
StampData *	pStamp_in;
#else
int applyStampTests(headp,wordp,curmp, pUnit_in, pStamp_in)
StampAnalysis *	headp;		/* pointer to list of analysis morphemes */
char *		wordp;		/* pointer to a synthesized word */
StampAnalysis *	curmp;		/* pointer to the current morpheme to apply the
				   tests to */
StampUnit *	pUnit_in;
StampData *	pStamp_in;
#endif /* hab217 */
{
StampTestList *tp;
StampAnalysis *ap;
/*
 *  quickly handle not having any tests to apply
 */
if (pStamp_in->pSynthesisTests == NULL)
	return( TRUE );
/*
 *  protect ourselves from invalid input
 */
if (    (headp == NULL) ||
		(wordp == NULL) ||
		(curmp == NULL) )
	return(FALSE);
#ifdef hab217
/*
 *  produce some trace output if desired
 */
if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
	{
	fprintf(pStamp_in->pLogFP, "Testing:");
	writeStampBriefAnalysis( headp, curmp, pStamp_in->pLogFP, pStamp_in );
	fprintf(pStamp_in->pLogFP, "\n        ");
	for ( ap = headp ; ap ; ap = ap->pRightLink )
		{
		fprintf(pStamp_in->pLogFP, (ap == curmp) ? " [* %s *]" : " %s",
		  (ap->pCurrentAllo->pszAllomorph && *ap->pCurrentAllo->pszAllomorph) ?
								ap->pCurrentAllo->pszAllomorph : "0" );
		}
	fputc('\n', pStamp_in->pLogFP);
	}
#endif /* hab217 */
/*
 *  save information needed by all the tests
 */
pAnalHead_m = headp;               /* save pointer to first node in list */
pCurrent_m = curmp;               /* save pointer to current node in list */
for ( ap = curmp ; ap->pRightLink ; ap = ap->pRightLink )
	;
pAnalTail_m = ap;                  /* save pointer to last node in list */
pszSynWord_m  = wordp;               /* save pointer to synthetic word */
/*
 *  apply any tests defined by the user
 */
for ( tp = pStamp_in->pSynthesisTests ; tp ; tp = tp->pNext )
	{
	++(tp->uiTestTrials);
	pForLeft_m = NULL;           /* reset these for each */
	pForRight_m = NULL;          /*     test */

				/*  added pUnit_in 2.1b1 hab */
	if (user_test(tp->pTest->uLeft.pChild, pUnit_in, pStamp_in))
		{
		if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
#ifndef hab217
	  if (tp->pAction)
			fprintf(pStamp_in->pLogFP, "    %s passed (and the action was performed)\n",
			tp->pTest->uRight.pszString);
#else
			fprintf(pStamp_in->pLogFP, "    %s passed\n",
			tp->pTest->uRight.pszString);
#endif /* hab217 */
		do_action(tp->pAction, tp->pTest->uRight.pszString, pStamp_in);
		}
	else
		{
		++(tp->uiTestFailures);
		if (pStamp_in->bTrace && (pStamp_in->pLogFP != NULL))
#ifndef hab217
	  if (!tp->pAction)
			fprintf(pStamp_in->pLogFP, "    %s failed\n",
			tp->pTest->uRight.pszString);
#else
			fprintf(pStamp_in->pLogFP, "    %s failed%s\n",
			tp->pTest->uRight.pszString,
			(tp->pAction) ? " (so no action was performed)" : "");
#endif /* hab217 */
		if (tp->pAction == NULL)
			return(FALSE);      /* first failure without action kills it */
		}
	}

return( TRUE );         /* reach here only if all tests succeeded */
}

/*************************************************************************
 * NAME
 *    writeStampTestStatistics
 * DESCRIPTION
 *    Display the statistics for using the tests from processing a file.
 *    Also, reset the counters in preparation for another file.
 * RETURN VALUE
 *    none
 */
void writeStampTestStatistics(pOutputFP_in, pStamp_in)
FILE *		pOutputFP_in;
StampData *	pStamp_in;
{
StampTestList *	tp;

if (pOutputFP_in == NULL)
	return;
if (pStamp_in->pSynthesisTests == NULL)
	return;                     /* nothing to show (not even a newline) */

fprintf(pOutputFP_in, "\n   Counts for user-defined tests:");

for ( tp = pStamp_in->pSynthesisTests ; tp != NULL ; tp = tp->pNext )
	{
	fprintf(pOutputFP_in, "\n%23s failed %5ld times, succeeded %5ld.",
						tp->pTest->uRight.pszString,
						tp->uiTestFailures,
						tp->uiTestTrials - tp->uiTestFailures );
	tp->uiTestTrials   = 0L;		/* reset for the next file */
	tp->uiTestFailures = 0L;
	}
putc('\n', pOutputFP_in);
}

/*************************************************************************
 * NAME
 *    user_test
 * ARGUMENTS
 *    tp - pointer to a node in a test tree
 * DESCRIPTION
 *    Recursively apply this test to the data pointed to by pAnalHead_m,
 *    pAnalTail_m, curmp, and pszSynWord_m.
 *
 *    This function is less complicated than it may appear.  Essentially,
 *    it is a simple recursive postorder traversal of a binary tree.  It's
 *    only that there is a large number of different types of nodes to
 *    handle differently.
 * RETURN VALUE
 *    nonzero if the data passes the test, zero if it fails
 */
static int user_test(tp, pUnit_in, pStamp_in)
AmpleTestNode *	tp;
StampUnit *	pUnit_in;
StampData *	pStamp_in;
{
register StampAnalysis *hp, *hp2;
int val, rval, lval;
char *p;

if (tp == NULL)
	return( TRUE );                     /* no test => TRUE */

hp  = NULL;
hp2 = NULL;
val = FALSE;                            /* let's be pessimistic */

switch (tp->iOpCode & OP_MASK)
	{
								/*
								 *  these nodes have subtrees
								 */
	case LOGAND:                /* 'AND' */
		val = (user_test( tp->uLeft.pChild, pUnit_in, pStamp_in) &&
		   user_test( tp->uRight.pChild, pUnit_in, pStamp_in));
		break;

	case LOGOR:                 /* 'OR' */
		val = (user_test( tp->uLeft.pChild, pUnit_in, pStamp_in) ||
		   user_test( tp->uRight.pChild, pUnit_in, pStamp_in));
		break;

	case LOGXOR:                /* 'XOR' */
		lval = user_test( tp->uLeft.pChild, pUnit_in, pStamp_in);
		rval = user_test( tp->uRight.pChild, pUnit_in, pStamp_in);
		val = ((!lval && rval) || (lval && !rval));
		break;

	case LOGIFF:                /* 'IFF' */
		lval = user_test( tp->uLeft.pChild, pUnit_in, pStamp_in);
		rval = user_test( tp->uRight.pChild, pUnit_in, pStamp_in);
		val = ((lval && rval) || (!lval && !rval));
		break;

	case LOGIF:                 /* 'IF' ... 'THEN' */
		val = ( !user_test(tp->uLeft.pChild, pUnit_in, pStamp_in) ||
		 user_test(tp->uRight.pChild, pUnit_in, pStamp_in) );
		break;

	case ALL_LEFT:              /* 'FOR_ALL_LEFT' */
		for (   pForLeft_m = pCurrent_m->pLeftLink, val = TRUE ;
				(pForLeft_m != NULL) && (val == TRUE) ;
				pForLeft_m = pForLeft_m->pLeftLink )
			{
			val = user_test( tp->uLeft.pChild, pUnit_in, pStamp_in);
			}
		break;

	case SOME_LEFT:             /* 'FOR_SOME_LEFT' */
		for (   pForLeft_m = pCurrent_m->pLeftLink, val = FALSE ;
				pForLeft_m != NULL ;
				pForLeft_m = pForLeft_m->pLeftLink )
			{
			val = user_test( tp->uLeft.pChild, pUnit_in, pStamp_in);
			if (val)
				break;          /* need to preserve pointer value */
			}
		break;

	case ALL_RIGHT:             /* 'FOR_ALL_RIGHT' */
		for (   pForRight_m = pCurrent_m->pRightLink, val = TRUE ;
				(pForRight_m != NULL) && (val == TRUE) ;
				pForRight_m = pForRight_m->pRightLink )
			{
			val = user_test( tp->uLeft.pChild, pUnit_in, pStamp_in);
			}
		break;

	case SOME_RIGHT:    /* 'FOR_SOME_RIGHT' */
		for (   pForRight_m = pCurrent_m->pRightLink, val = FALSE ;
				pForRight_m != NULL ;
				pForRight_m = pForRight_m->pRightLink )
			{
			val = user_test(tp->uLeft.pChild, pUnit_in, pStamp_in);
			if (val)
				break;          /* need to preserve pointer value */
			}
		break;
								/*
								 *  the rest of these are leaf nodes
								 */
	case PROP_IS:       /* 'property' 'is' IDENTIFIER */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				(tp->uRight.uiProperty != 0) )
			{
		/* Check property */
			if (hasAmpleProperty(hp->pCurrentAllo->uAlloPropertySet,
				 tp->uRight.uiProperty,
				 &pStamp_in->sProperties) )
				val = TRUE;
			else
				val = FALSE;
			}
		break;

	case MORPH_IS:      /* 'morphname' 'is' STRING */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = (strcmp(hp->m.pszMorphname, tp->uRight.pszString) == 0);
			}
		break;

	case MORPH_MEMBER:  /* 'morphname' 'is' 'member' IDENTIFIER */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = isAmpleMorphClassMember(hp->m.pszMorphname,
					  tp->uRight.pMorphClass);
			}
		break;

	case MOR_IS_MORPH: /* 'morphname' 'is' POSITION 'morphname' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (strcmp(hp->m.pszMorphname, hp2->m.pszMorphname) == 0);
			}
		break;

	case ALLO_IS:       /* 'allomorph' 'is'  STRING */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				(tp->uRight.pszString != NULL) )
			{
			val = (strcmp( hp->pCurrentAllo->pszAllomorph,
			   tp->uRight.pszString) == 0);
			}
		break;

	case ALLO_MEMBER:   /* 'allomorph' 'is' 'member' IDENTIFIER */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = isStringClassMember( hp->pCurrentAllo->pszAllomorph,
					   tp->uRight.pStringClass);
			}
		break;

	case ALLO_IS_AL:    /* 'allomorph' 'is' POSITION 'allomorph' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (strcmp(hp->pCurrentAllo->pszAllomorph,
			  hp2->pCurrentAllo->pszAllomorph) == 0);
			}
		break;

	case ALLO_MATCH:    /* 'allomorph' 'matches'  STRING */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			if (    (tp->uLeft.iPosition == ARGLEFT) ||
					(tp->uLeft.iPosition == FORLEFT) ||
					(tp->uLeft.iPosition == INITIALM) )
				{                                       /* match end */
				val = matchEnd(hp->pCurrentAllo->pszAllomorph,
				   tp->uRight.pszString);
				}
			else
				{                                       /* match beginning */
				val = matchBeginning(hp->pCurrentAllo->pszAllomorph,
					 tp->uRight.pszString);
				}
			}
		break;

	case AL_MAT_MEM: /* 'allomorph' 'matches' 'member' IDENTIFIER */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			if (    (tp->uLeft.iPosition == ARGLEFT) ||
					(tp->uLeft.iPosition == FORLEFT) ||
					(tp->uLeft.iPosition == INITIALM) )
				{					/* match end */
				val = matchEndWithStringClass(hp->pCurrentAllo->pszAllomorph,
						  tp->uRight.pStringClass) != 0;
				}
			else
				{					/* match beginning */
				val = matchBeginWithStringClass(hp->pCurrentAllo->pszAllomorph,
						tp->uRight.pStringClass) != 0;
				}
			}
		break;

	case AL_MAT_AL:     /* 'allomorph' 'matches' POSITION 'allomorph' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			if (    (tp->uLeft.iPosition == ARGLEFT) ||
					(tp->uLeft.iPosition == FORLEFT) ||
					(tp->uLeft.iPosition == INITIALM) )
				val = matchEnd(hp->pCurrentAllo->pszAllomorph,
										hp2->pCurrentAllo->pszAllomorph);
			else
				val = matchBeginning(hp->pCurrentAllo->pszAllomorph,
										hp2->pCurrentAllo->pszAllomorph);
			}
		break;

	case STRING_IS:     /* 'string' 'is'  STRING */
		if (    ((p = get_surf(tp->uLeft.iPosition)) != NULL) &&
				(tp->uRight.pszString != NULL) )
			{
			val = (strcmp( p, tp->uRight.pszString ) == 0);
			}
#if 1
	get_surf(ARGCURRENT);	/* frees any allocated memory */
#endif
		break;

	case STRING_MEMBER: /* 'string' 'is' 'member' IDENTIFIER */
		if ((p = get_surf(tp->uLeft.iPosition)) != NULL)
			{
			val = isStringClassMember( p, tp->uRight.pStringClass );
			}
#if 1
	get_surf(ARGCURRENT);	/* frees any allocated memory */
#endif
		break;

	case ST_IS_AL:      /* 'string' 'is' POSITION 'allomorph' */
		if (    ((p = get_surf(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (strcmp( p, hp2->pCurrentAllo->pszAllomorph ) == 0);
			}
#if 1
	get_surf(ARGCURRENT);	/* frees any allocated memory */
#endif
		break;

	case ST_MATCH:      /* 'string' 'matches'  STRING */
		if (    ((p = get_surf(tp->uLeft.iPosition)) != NULL) &&
				(tp->uRight.pszString != NULL) )
			{
			if (    (tp->uLeft.iPosition == ARGLEFT) ||
					(tp->uLeft.iPosition == FORLEFT) ||
					(tp->uLeft.iPosition == INITIALM) )
				{					/* match end */
				val = matchEnd( p, tp->uRight.pszString );
				}
			else
				{					/* match beginning */
				val = matchBeginning( p, tp->uRight.pszString );
				}
			}
#if 1
	get_surf(ARGCURRENT);	/* frees any allocated memory */
#endif
		break;

	case ST_MAT_MEM: /* 'string' 'matches' 'member' IDENTIFIER */
		if ((p = get_surf(tp->uLeft.iPosition)) != NULL)
			{
			if (    (tp->uLeft.iPosition == ARGLEFT) ||
					(tp->uLeft.iPosition == FORLEFT) ||
					(tp->uLeft.iPosition == INITIALM) )
				{					/* match end */
				val = matchEndWithStringClass( p, tp->uRight.pStringClass ) != 0;
				}
			else
				{					/* match beginning */
				val = matchBeginWithStringClass( p, tp->uRight.pStringClass ) != 0;
				}
			}
#if 1
	get_surf(ARGCURRENT);	/* frees any allocated memory */
#endif
		break;

	case ST_MAT_AL: /* 'string' 'matches' POSITION 'allomorph' */
		if (    ((p = get_surf(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			if (    (tp->uLeft.iPosition == ARGLEFT) ||
					(tp->uLeft.iPosition == FORLEFT) ||
					(tp->uLeft.iPosition == INITIALM) )
				{                                       /* match end */
				val = matchEnd( p, hp2->pCurrentAllo->pszAllomorph );
				}
			else
				{                                       /* match beginning */
				val = matchBeginning( p, hp2->pCurrentAllo->pszAllomorph );
				}
			}
#if 1
	get_surf(ARGCURRENT);	/* frees any allocated memory */
#endif
		break;

	case TYPE_IS:       /* 'type' 'is' <type> */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			if (tp->uRight.iValue == WINITIAL)
				val = (hp->pLeftLink == NULL);
			else if (tp->uRight.iValue == WFINAL)
				val = (hp->pRightLink == NULL);
			else
				val = (hp->m.iMorphType & tp->uRight.iValue);
			}
		break;

	case FROM_IS_FROM:  /* 'fromcategory' 'is' ... 'fromcategory' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (hp->m.iFromCategory == hp2->m.iFromCategory);
			}
		break;

	case FR_IS_TO:      /* 'fromcategory' 'is' ... 'tocategory' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (hp->m.iFromCategory == hp2->m.iToCategory);
			}
		break;

	case TO_IS_FROM:    /* 'tocategory' 'is' ... 'fromcategory' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (hp->m.iToCategory == hp2->m.iFromCategory);
			}
		break;

	case TO_IS_TO:      /* 'tocategory' 'is' ... 'tocategory' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (hp->m.iToCategory == hp2->m.iToCategory);
			}
		break;

	case FROM_MEMBER:   /* 'fromcategory 'is' 'member' IDENTIFIER */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = isAmpleCategClassMember((int)hp->m.iFromCategory,
					  tp->uRight.pCategClass);
			}
		break;

	case TO_MEMBER:     /* 'tocategory 'is' 'member' IDENTIFIER */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = isAmpleCategClassMember((int)hp->m.iToCategory,
					  tp->uRight.pCategClass);
			}
		break;

	case FROM_IS:       /* 'fromcategory 'is' IDENTIFIER */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = (hp->m.iFromCategory == tp->uRight.iValue);
			}
		break;

	case TO_IS:         /* 'tocategory 'is' IDENTIFIER */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = (hp->m.iToCategory == tp->uRight.iValue);
			}
		break;

	case ORDR_EQ:       /* 'orderclass' '=' ... 'orderclass' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (hp->m.iOrderClass == hp2->m.iOrderClass);
			}
		break;

	case ORDR_GT:       /* 'orderclass' '>' ... 'orderclass' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (hp->m.iOrderClass > hp2->m.iOrderClass);
			}
		break;

	case ORDR_GE:       /* 'orderclass' '>=' ... 'orderclass' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (hp->m.iOrderClass >= hp2->m.iOrderClass);
			}
		break;

	case ORDR_LE:       /* 'orderclass' '<=' ... 'orderclass' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (hp->m.iOrderClass <= hp2->m.iOrderClass);
			}
		break;

	case ORDR_LT:       /* 'orderclass' '<' ... 'orderclass' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (hp->m.iOrderClass < hp2->m.iOrderClass);
			}
		break;

	case ORDR_NE:       /* 'orderclass' '~=' ... 'orderclass' */
		if (    ((hp = getpos(tp->uLeft.iPosition)) != NULL) &&
				((hp2= getpos(tp->uRight.iValue)) != NULL))
			{
			val = (hp->m.iOrderClass != hp2->m.iOrderClass);
			}
		break;

	case ORDR_EQ_CON:   /* 'orderclass' '=' CONSTANT */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = (hp->m.iOrderClass == tp->uRight.iValue);
			}
		break;

	case ORDR_GT_CON:   /* 'orderclass' '>' CONSTANT */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = (hp->m.iOrderClass > tp->uRight.iValue);
			}
		break;

	case ORDR_GE_CON:   /* 'orderclass' '>=' CONSTANT */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = (hp->m.iOrderClass >= tp->uRight.iValue);
			}
		break;

	case ORDR_LE_CON:   /* 'orderclass' '<=' CONSTANT */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = (hp->m.iOrderClass <= tp->uRight.iValue);
			}
		break;

	case ORDR_LT_CON:   /* 'orderclass' '<' CONSTANT */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = (hp->m.iOrderClass < tp->uRight.iValue);
			}
		break;

	case ORDR_NE_CON:   /* 'orderclass' '~=' CONSTANT */
		if ((hp = getpos(tp->uLeft.iPosition)) != NULL)
			{
			val = (hp->m.iOrderClass != tp->uRight.iValue);
			}
		break;
				/* 2.1b1 hab */
	case PUNCT_IS:	/* 'punctuation' 'is'  STRING */
	if (	(tp->uRight.pszString != (char *)NULL) &&
		((p = get_punct(tp->uLeft.iPosition, pUnit_in)) != NULL) )
		{
		val = (strcmp( p, tp->uRight.pszString ) == 0);
		}
	break;
				/* 2.1b1 hab */
	case PUNCT_MEMBER: /* 'punctuation' 'is' 'member' IDENTIFIER */
	if ((p = get_punct(tp->uLeft.iPosition, pUnit_in)) != NULL)
		{
		val = isPunctClassMember( p, tp->uRight.pPunctClass );
		}
	break;

	default:
		reportError(ERROR_MSG,
	   "\nSYNTHESIS TEST: %s is corrupted - the result is unpredictable\n",
			pszTestName_m );
		return( FALSE );
	}
/*
 *  return (possibly negated) truth value
 */
return((tp->iOpCode & OP_NOT) ? !val : val);
}

/***************************************************************************
 * NAME
 *    getpos
 * ARGUMENTS
 *    pos - position code stored in a test tree leaf node
 * DESCRIPTION
 *    Get the pointer to the desired morpheme in the analysis.
 * RETURNS:
 *    pointer to analysis node, or NULL if invalid position code
 */
static StampAnalysis * getpos(pos)
int pos;
{
switch (pos)
	{
	case ARGCURRENT:    return( pCurrent_m );
	case ARGLEFT:       return( pCurrent_m->pLeftLink );
	case ARGRIGHT:      return( pCurrent_m->pRightLink );
	case FORLEFT:       return( pForLeft_m );
	case FORRIGHT:      return( pForRight_m );
	case INITIALM:      return( pAnalHead_m );
	case FINALM:        return( pAnalTail_m );
	default:            return( NULL );
	}
}

/***************************************************************************
 * NAME
 *    get_surf
 * ARGUMENTS
 *    pos   - position argument from test tree node
 * DESCRIPTION
 *    Obtain the appropriate surface string for the indicated morpheme.
 *    This is a bit tricky because previous tests may have inserted phonemes
 *    between morphemes (e.g., Campa epenthesis).
 * RETURN VALUE
 *    pointer to the surface string (all the way to the edge of the word)
 */
static char * get_surf(pos)
int pos;
{
static char *	pszAllo_s = NULL;
static size_t	iAlloSize_s = 0;
StampAnalysis *	mp;

if ((pszAllo_s != NULL) && (iAlloSize_s != 0))
	freeMemory( pszAllo_s );
pszAllo_s = NULL;
iAlloSize_s = 0;
/*
 *  take short cuts for the ones we know for sure
 */
if (pos == ARGCURRENT)
	return( pCurrent_m->pszAlloStart ); /* we always know the current location */
else if (pos == ARGRIGHT)
	return( pCurrent_m->pszAlloEnd );   /* next to the right is easy as well */
/*
 *  figure out which morpheme we want
 */
mp = getpos(pos);
if (mp == NULL)
	return( "" );                       /* maybe a word edge? */
/*
 *  if morpheme is to the left of current, we need to make a NUL-terminated
 *    copy of the substring
 */
if ((pos == ARGLEFT) || (pos == FORLEFT) || (pos == INITIALM))
	{                                   /* leftward from beginning */
	/*
	 *  surface string is everything from the beginning of the word
	 *    to the beginning of the following allomorph
	 */
	iAlloSize_s = mp->pRightLink->pszAlloStart - pszSynWord_m + 1;
	pszAllo_s = allocMemory((unsigned)iAlloSize_s); /* allocate some memory */
	strncpy(pszAllo_s, pszSynWord_m, iAlloSize_s-1);
	pszAllo_s[iAlloSize_s-1] = NUL;
	return( pszAllo_s );
	}
else                                    /* rightward to end */
	/*
	 *  surface string is everything from the end of the previous allomorph
	 *    to the end of the word
	 */
	return( mp->pLeftLink->pszAlloEnd );
}

/***************************************************************************
 * NAME
 *    get_punct    2.1b1 hab
 * ARGUMENTS
 *    pos   - position argument from test tree node
 * DESCRIPTION
 *    Obtain the format marker field (for pos = LAST) or trailing
 *    non-alphabetic field string (for pos = NEXT) from pCurrentWord_m
 * RETURNS:
 *    pointer to the appropriate string
 */
static char *get_punct(pos, pUnit_in)
int pos;
StampUnit * pUnit_in;
{
if (pos == LAST)
	return( pUnit_in->pCurrentWord->pTemplate->pszFormat );
else if (pos == NEXT)
	return( pUnit_in->pCurrentWord->pTemplate->pszNonAlpha );
return( (char *)NULL );		/* only valid for LAST and NEXT */
}

/*************************************************************************
 * NAME
 *    do_action
 * ARGUMENTS
 *    actp - pointer to a list of test actions to perform
 *    name - pointer to the name of the test
 * DESCRIPTION
 *    Perform the actions in the list.
 * RETURN VALUE
 *    none
 */
static void do_action(actp, name, pStamp_in)
StampAction *actp;
char *name;
StampData *	pStamp_in;
{
StampAnalysis *anal;      /* Temp analysis pointer */
StampAnalysis *fanal;     /* Following analyses */
size_t ins_len;                /* Length of string to insert */
char *beg;                    /* Beginning of allo */
int type;                   /* Temp for action type */

for ( ; actp ; actp = actp->pNext )       /* For each action */
	{
	type = actp->eType;              /* Put type in a local */
	/*
	 *  If report, show analysis: Give test name and print report string
	 */
	if ( type == REPORT )
		{
	if (pStamp_in->pLogFP != NULL)
		{
		fprintf(pStamp_in->pLogFP, "\nReport from test %s:\n", name );
		writeStampBriefAnalysis( pAnalHead_m, NULL, pStamp_in->pLogFP, pStamp_in );
		if ( actp->pszString )
		fprintf(pStamp_in->pLogFP, "\n%s", actp->pszString );
		fprintf(pStamp_in->pLogFP, "\n" );
		}
		}
	else                                    /* Else, (not report) */
		{
		anal = getpos( actp->iPosition );   /* Get analysis node */

		if ( !anal )                    /* If none, don't try to insert */
			return;
				/*
				* If insert after a node before the last one, just
				*   do an insert before the following node.
				* Otherwise, it is a special case, simpler in that
				*   it does not have to push anything down.
				*/
		if ( type == INSERT_AFTER )             /* If insert after */
			{
			if ( anal->pRightLink )
				{                               /* If not last */
				anal = anal->pRightLink;         /* Insert before next */
				type = INSERT_BEFORE;
				}
			else                                /* Else, (insert after last) */
				{
				strcpy( anal->pszAlloEnd, actp->pszString );
				}
			}

		if ( type == INSERT_BEFORE ) /* If insert before */
			{
				/*
				* move rest of pszSynWord_m down to make room for insertion
				*/
			ins_len = strlen( actp->pszString ); /* Get length */
			beg = anal->pszAlloStart;             /* Common subexpression */
												/* Move, including NUL */
			memmove( (void *)(beg + ins_len), (void *)beg,
						 (unsigned)( strlen( beg ) + 1) );
				/*
				* insert the string into the gap in pszSynWord_m
				*/
			memmove( (void *)beg, (void *)actp->pszString, (unsigned)ins_len );
				/*
				* adjust following pszSynWord_m pointers
				*/
			for ( fanal = anal; fanal; fanal = fanal->pRightLink )
				{
				fanal->pszAlloStart += ins_len;
				fanal->pszAlloEnd   += ins_len;
				}
			}
		}
	}
}
