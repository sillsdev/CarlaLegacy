/* MKTEST.C - functions to build an AmpleTestNode tree for AMPLE and STAMP
 ***************************************************************************
 *
 * AmpleTestNode * makeAmpleTest(AmpleTestNode * pTest_in,
 *				 char *          pszName_in)
 * AmpleTestNode * makeAmpleTestNode(int             iOpCode_in,
 *				     AmpleTestNode * pLeft_in,
 *				     AmpleTestNode * pRight_in)
 * AmpleTestNode * makeAmpleTestInt(int iOpCode_in,
 *				    int iLeft_in,
 *				    int iRight_in)
 * AmpleTestNode * makeAmpleTestString(int    iOpCode_in,
 *				       int    iLeft_in,
 *				       char * pszRight_in)
 * AmpleTestNode * makeAmpleTestStringClass(int           iOpCode_in,
 *					    int           iLeft_in,
 *					    StringClass * pRight_in)
 * AmpleTestNode * makeAmpleTestMorphClass(int               iOpCode_in,
 *					   int               iLeft_in,
 *					   AmpleMorphClass * pRight_in)
 * AmpleTestNode * makeAmpleTestCategClass(int                  iOpCode_in,
 *					   int                  iLeft_in,
 *					   AmpleCategoryClass * pRight_in)
 * AmpleTestNode * makeAmpleTestProperty(int      iOpCode_in,
 *					 int      iLeft_in,
 *					 unsigned uiRight_in)
 *                                                          3.3.0 hab
 * AmpleTestNode * makeAmpleTestPunct(int    iOpCode_in,
 *				      int    iLeft_in,
 *				      char * pszRight_in)
 * AmpleTestNode * makeAmpleTestPunctClass(int           iOpCode_in,
 *					   int           iLeft_in,
 *					   PunctClass * pRight_in)
 *
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "stample.h"
#include "allocmem.h"

/*****************************************************************************
 * NAME
 *    makeAmpleTest
 * DESCRIPTION
 *    Create the top node in the syntax parse tree.
 * RETURN VALUE
 *    pointer to the test_node structure
 */
AmpleTestNode * makeAmpleTest(pTest_in, pszName_in)
AmpleTestNode *	pTest_in;	/* pointer to test tree */
char *		pszName_in;	/* pointer to test name */
{
AmpleTestNode *	tp;

tp = (AmpleTestNode *)allocMemory(sizeof(AmpleTestNode));
tp->iOpCode          = TOP_NODE;
tp->uLeft.pChild     = pTest_in;
tp->uRight.pszString = duplicateString( pszName_in );
return(tp);
}

/*****************************************************************************
 * NAME
 *    makeAmpleTestNode
 * DESCRIPTION
 *    Create a node in the syntax parse tree
 * RETURN VALUE
 *    pointer to the test_node structure
 */
AmpleTestNode * makeAmpleTestNode(iOpCode_in, pLeft_in, pRight_in)
int		iOpCode_in;		/* kind of node */
AmpleTestNode *	pLeft_in;		/* left child of this node */
AmpleTestNode *	pRight_in;		/* right child of this node */
{
AmpleTestNode *	tp;

tp = (AmpleTestNode *)allocMemory(sizeof(AmpleTestNode));
tp->iOpCode       = iOpCode_in & OP_MASK;
tp->uLeft.pChild  = pLeft_in;
tp->uRight.pChild = pRight_in;
return(tp);
}

/*****************************************************************************
 * NAME
 *    makeAmpleTestInt
 * DESCRIPTION
 *    Create a leaf node using an integer value in the syntax parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
AmpleTestNode * makeAmpleTestInt(iOpCode_in, iLeft_in, iRight_in)
int	iOpCode_in;		/* kind of node */
int	iLeft_in;		/* position code for left argument */
int	iRight_in;		/* integer value stored for right argument */
{
AmpleTestNode *	tp;

tp = (AmpleTestNode *)allocMemory(sizeof(AmpleTestNode));
tp->iOpCode          = iOpCode_in & OP_MASK;
tp->uLeft.iPosition  = iLeft_in;
tp->uRight.iValue    = iRight_in;
return(tp);
}

/*****************************************************************************
 * NAME
 *    makeAmpleTestString
 * DESCRIPTION
 *    Create a leaf node storing a string value in the syntax parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
AmpleTestNode * makeAmpleTestString(iOpCode_in, iLeft_in, pszRight_in)
int	iOpCode_in;	/* kind of node */
int	iLeft_in;	/* position code for left argument */
char *	pszRight_in;	/* pointer to character string for right argument */
{
AmpleTestNode *	tp;

tp = (AmpleTestNode *)allocMemory(sizeof(AmpleTestNode));
tp->iOpCode          = iOpCode_in & OP_MASK;
tp->uLeft.iPosition  = iLeft_in;
tp->uRight.pszString = pszRight_in;
return(tp);
}

/*****************************************************************************
 * NAME
 *    makeAmpleTestStringClass
 * DESCRIPTION
 *    Create a leaf node pointing to a string class in the syntax parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
AmpleTestNode * makeAmpleTestStringClass(iOpCode_in, iLeft_in, pRight_in)
int		iOpCode_in;	/* kind of node */
int		iLeft_in;	/* position code for left argument */
StringClass *	pRight_in;	/* pointer to string class for right argument*/
{
AmpleTestNode *	tp;

tp = (AmpleTestNode *)allocMemory(sizeof(AmpleTestNode));
tp->iOpCode             = iOpCode_in & OP_MASK;
tp->uLeft.iPosition     = iLeft_in;
tp->uRight.pStringClass = pRight_in;
return(tp);
}

/*****************************************************************************
 * NAME
 *    makeAmpleTestMorphClass
 * DESCRIPTION
 *    Create a leaf node pointing to a morpheme class in the parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
AmpleTestNode * makeAmpleTestMorphClass(iOpCode_in, iLeft_in, pRight_in)
int			iOpCode_in;	/* kind of node */
int			iLeft_in;	/* position code for left argument */
AmpleMorphClass *	pRight_in;	/* pointer to morpheme class for
					 * right argument */
{
AmpleTestNode *	tp;

tp = (AmpleTestNode *)allocMemory(sizeof(AmpleTestNode));
tp->iOpCode            = iOpCode_in & OP_MASK;
tp->uLeft.iPosition    = iLeft_in;
tp->uRight.pMorphClass = pRight_in;
return(tp);
}

/*****************************************************************************
 * NAME
 *    makeAmpleTestCategClass
 * DESCRIPTION
 *    Create a leaf node pointing to a category class in the parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
AmpleTestNode * makeAmpleTestCategClass(iOpCode_in, iLeft_in, pRight_in)
int			iOpCode_in;	/* kind of node */
int			iLeft_in;	/* position code for left argument */
AmpleCategoryClass *	pRight_in;	/* pointer to category class for
					 * right argument */
{
AmpleTestNode *	tp;

tp = (AmpleTestNode *)allocMemory(sizeof(AmpleTestNode));
tp->iOpCode            = iOpCode_in & OP_MASK;
tp->uLeft.iPosition    = iLeft_in;
tp->uRight.pCategClass = pRight_in;
return(tp);
}

/*****************************************************************************
 * NAME
 *    makeAmpleTestProperty
 * DESCRIPTION
 *    Create a leaf node pointing to a property in the parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
AmpleTestNode * makeAmpleTestProperty(iOpCode_in, iLeft_in, uiRight_in)
int		iOpCode_in;	/* kind of node */
int		iLeft_in;	/* position code for left argument */
unsigned	uiRight_in;	/* value for property */
{
AmpleTestNode *	tp;

tp = (AmpleTestNode *)allocMemory(sizeof(AmpleTestNode));
tp->iOpCode            = iOpCode_in & OP_MASK;
tp->uLeft.iPosition    = iLeft_in;
tp->uRight.uiProperty = (unsigned short)uiRight_in;
return(tp);
}

/*****************************************************************************
 * NAME
 *    makeAmpleTestPunct    3.3.0 hab
 * DESCRIPTION
 *    Create a leaf node storing a punctuation value in the syntax parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
AmpleTestNode * makeAmpleTestPunct(iOpCode_in, iLeft_in, pszRight_in)
int	iOpCode_in;	/* kind of node */
int	iLeft_in;	/* position code for left argument */
char *	pszRight_in;	/* pointer to character punctuation for right argument */
{
AmpleTestNode *	tp;

tp = (AmpleTestNode *)allocMemory(sizeof(AmpleTestNode));
tp->iOpCode          = iOpCode_in & OP_MASK;
tp->uLeft.iPosition  = iLeft_in;
tp->uRight.pszString = pszRight_in;
return(tp);
}

/*****************************************************************************
 * NAME
 *    makeAmpleTestPunctClass   3.3.0 hab
 * DESCRIPTION
 *    Create a leaf node pointing to a punctuation class in the syntax parse tree.
 * RETURN VALUE
 *    pointer to the leaf node structure
 */
AmpleTestNode * makeAmpleTestPunctClass(iOpCode_in, iLeft_in, pRight_in)
int		iOpCode_in;	/* kind of node */
int		iLeft_in;	/* position code for left argument */
PunctClass *	pRight_in;	/* pointer to punctuation class for right argument*/
{
AmpleTestNode *	tp;

tp = (AmpleTestNode *)allocMemory(sizeof(AmpleTestNode));
tp->iOpCode             = iOpCode_in & OP_MASK;
tp->uLeft.iPosition     = iLeft_in;
tp->uRight.pPunctClass = pRight_in;
return(tp);
}
