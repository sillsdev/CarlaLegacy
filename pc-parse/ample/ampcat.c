/* ampcat.c - compute categories for AMPLE
 ******************************************************************************
 * extern int
 * computeCategory (AmpleData * pAmple_in,
 *					AmpleHeadList *pAmpleLeftHead_m,
 * 					AmpleHeadList *pAmpleRightHead_m);
 *
 *****************************************************************************
 * edit history is in version.h
 *****************************************************************************
 * Copyright 2005 by SIL International.  All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"
#include "ampcat.h"

typedef struct category {
	enum { eRootCat, eLeftCat, eRightCat, eFail } eDirection;
	int iFrom, iTo;
} tsCategory;

#define TRACE //fprintf(stderr, "stack = %d, line=%d,", jStack,__LINE__); fflush(stderr);
/*
 * The function reduceCategory() is the labourer here.
 * For each word there will be a list of n categories, as:
 * [ c1, c2, ... cn-1, cn ]
 *
 * -- For a list of 1 category, the final category will be the category of that one
 * single category.
 * -- A list of 2 categories can be reduced to a list of one single category by the
 * following application rules:
 *  A/B A -> B (prefix, root)
 *  A A/B -> B (root, suffix)
 *  A B   -> B (root, root, with roots being right-headed)
 *  A B   -> A (root, root, with roots being left-headed)
 * -- A list of two categories or more will be split by a moving splitter.
 * This is the so-called shift-reduce method.
 * Consider the list of categories above:
 *   [ c1 <|> c2  ... cn-1  cn ]
 * <|> is the splitter, and the job is first to try and reduce [ c1 ] to a single category;
 * and then [ c2 ... cn ]; if that fails,  we'll try [ c1 c2 ] and [ c3 ... cn ].
 * This is done by moving the splitter from left to right.
 * This method relies heavily on recursion; to compute the outcome for the string
 * left and right of the splitter is represented as the same job as computing it for
 * the whole; if one of the distributed jobs fail, the main job back-tracks and
 * tries another split. If the main job fails, it reports this back one more level up,
 * etcetera.
 *
 * To gain some speed, we have not used the C-call stack - who knows how much overhead
 * that generates?
 * We have built our own stack.
 */

/* Theoretically this should account for a string of 2**MAX_STACK morphemes;
 * I think that that should do.
 */
#define MAX_STACK 50

typedef struct catstack {
	/* left and right pointer
	 * And splitter, if the computation must be factored out
	 */
	AmpleHeadList *pLeft, *pRight, *pSplitter;

	/* 1 if this category is the right hand side of a split; 0 otherwise.
	 * If this flag is 1, on total failure you can pop two categories from the stack
	 * (short circuit evaluation)
	 */
	int iRight;

	/* resulting category */
	tsCategory *psResult;

	/* if factored out, here's where the results will be returned. */
	tsCategory sLeft;
	tsCategory sRight;
} tsCatStack;

static int
reduceCategory(AmpleData * pAmple_in,
				AmpleHeadList *pAmpleLeftHead_m,
				AmpleHeadList *pAmpleRightHead_m)
{
	tsCatStack asStack[MAX_STACK];
	register tsCatStack *psStackPointer;
	int jStack;
	tsCategory sResult;

	/* throw the incoming category list on the stack */
	psStackPointer = asStack;
	psStackPointer->pLeft = pAmpleLeftHead_m;
	psStackPointer->pRight = pAmpleRightHead_m;
	psStackPointer->pSplitter = NULL;
	psStackPointer->iRight = 0;
	psStackPointer->psResult = &sResult;
	jStack = 1;

	while (jStack != 0) {
		/* we have to factor the computation out;
		 * there are several possibilities;
		 * - if the left and right head are one and the same,
		 *   we can compute the category by just copying the information from the
		 *   morpheme
		 * - if the left and right head are different, then we go into
		 *   a loop to test left-right reductions
		 *   #. if there is a splitter already, we can check the results that were
		 *      returned from previous computations
		 *   #. if there is no splitter yet, we have to add it to the stack
		 */
		jStack--;
		psStackPointer = asStack + jStack;
		TRACE

		/*fprintf(stderr, "now dealing with [%s]-[%s]\n",
				psStackPointer->pLeft->pAllomorph->pMorpheme->pszMorphName,
				psStackPointer->pRight->pAllomorph->pMorpheme->pszMorphName);
		TRACE*/

		if (psStackPointer->pLeft == psStackPointer->pRight) {
			switch(psStackPointer->pRight->eType) {
			case AMPLE_PFX:
			case AMPLE_IFX:
			case AMPLE_NFXPFX:
			case AMPLE_NFXIFX:
				TRACE
				psStackPointer->psResult->eDirection = eRightCat; /* all right seeking */
				psStackPointer->psResult->iTo    = psStackPointer->pRight->iToCategory;
				psStackPointer->psResult->iFrom  = psStackPointer->pRight->iFromCategory;
				TRACE
				break;
			case AMPLE_SFX:
			case AMPLE_NFXSFX:
				TRACE
				psStackPointer->psResult->eDirection = eLeftCat; /* all left seeking */
				psStackPointer->psResult->iTo   = psStackPointer->pRight->iToCategory;
				psStackPointer->psResult->iFrom = psStackPointer->pRight->iFromCategory;
				TRACE
				break;
			case AMPLE_ROOT:
				TRACE
				psStackPointer->psResult->eDirection = eRootCat; /* a root */
				psStackPointer->psResult->iTo   = psStackPointer->pRight->iROOTCATEG;
				TRACE
				break;
			case AMPLE_NFX:                        /* an error; */
			default:
				TRACE
				psStackPointer->psResult->eDirection = eFail;
				jStack -= psStackPointer->iRight;
				TRACE
			}
		}
		/* more than one category; must see how the factoring out went.
		 * if it went well, we must try application
		 */
		else if (psStackPointer->pSplitter != NULL) {
			/* fail, unless proven otherwise */
			TRACE
			psStackPointer->psResult->eDirection = eFail;
			if (psStackPointer->sLeft.eDirection == eRootCat) {
				if (psStackPointer->sRight.eDirection == eRootCat) {
					/* root compounding */
					if (pAmple_in->eWriteCategory & AMPLE_COMPOUND_ROOT_LEFTHEAD) {
						*psStackPointer->psResult = psStackPointer->sLeft;
					}
					else {
						*psStackPointer->psResult = psStackPointer->sRight;
					}
				}
				else if (psStackPointer->sRight.eDirection == eLeftCat) {
					/* application */
					if (psStackPointer->sLeft.iTo == psStackPointer->sRight.iFrom) {
						psStackPointer->psResult->iTo = psStackPointer->sRight.iTo;
						psStackPointer->psResult->eDirection = eRootCat;
					}
				}
			}
			else if (psStackPointer->sLeft.eDirection == eRightCat) {
				if (psStackPointer->sRight.eDirection == eRootCat) {
					if (psStackPointer->sLeft.iFrom == psStackPointer->sRight.iTo) {
						psStackPointer->psResult->iTo = psStackPointer->sLeft.iTo;
						psStackPointer->psResult->eDirection = eRootCat;
					}
				}
			}
			TRACE

			if (psStackPointer->psResult->eDirection != eFail) {
				/* reduced to ONE category */
			TRACE
			}
			else {
				/* shift one to the right -- there is always room for that
				 * (as it has obviously been done before for this one...)
				 */
				psStackPointer->pSplitter = psStackPointer->pSplitter->pRight;
				if (psStackPointer->pSplitter == psStackPointer->pRight) {
					 /* tried all splits; does not reduce */
					jStack -= psStackPointer->iRight;
			TRACE
				}
				else {
			TRACE
					/* and factor out */
					psStackPointer[1].pLeft = psStackPointer->pLeft;
					psStackPointer[1].pRight = psStackPointer->pSplitter;
					psStackPointer[1].pSplitter = NULL;
					psStackPointer[1].psResult = &psStackPointer->sLeft;
					psStackPointer[1].iRight = 0;
					psStackPointer[2].pLeft = psStackPointer->pSplitter->pRight;
					psStackPointer[2].pRight = psStackPointer->pRight;
					psStackPointer[2].pSplitter = NULL;
					psStackPointer[2].psResult = &psStackPointer->sRight;
					psStackPointer[2].iRight = 1;
					jStack += 3; /* add two and have to retry this one */
				}
			TRACE
			}
		}
		else { /* left is not right, and
				* the splitter is NULL, so this one has never been tried
				*/
			if (jStack + 3 >= MAX_STACK) {
			TRACE
				psStackPointer->psResult->eDirection = eFail; /* no room to distribute */
				jStack -= psStackPointer->iRight;
			}
			else {
				/* start splitting at position pLeft */
				psStackPointer->pSplitter = psStackPointer->pLeft;
				/* and factor out */
				psStackPointer[1].pLeft = psStackPointer->pLeft;
				psStackPointer[1].pRight = psStackPointer->pSplitter;
				psStackPointer[1].pSplitter = NULL;
				psStackPointer[1].psResult = &psStackPointer->sLeft;
				psStackPointer[1].iRight = 0;
				psStackPointer[2].pLeft = psStackPointer->pSplitter->pRight;
				psStackPointer[2].pRight = psStackPointer->pRight;
				psStackPointer[2].pSplitter = NULL;
				psStackPointer[2].psResult = &psStackPointer->sRight;
				psStackPointer[2].iRight = 1;
				jStack += 3; /* add two and have to retry this one */
			}
			TRACE
		}
			TRACE
	} /* while (jStack != 0) */

	if (sResult.eDirection == eRootCat) {
		return sResult.iTo;
	}
	else {
		return 0;
	}
} /* reduceCategory */


extern int
computeCategory (AmpleData * pAmple_in,
				 AmpleHeadList *pAmpleLeftHead_m,
				 AmpleHeadList *pAmpleRightHead_m)
{
	if (pAmpleLeftHead_m == NULL) {
		return 0;
	}
	if (pAmpleRightHead_m == NULL) {
		return 0;
	}

	/* the presupposition is that right always occurs to the right of left.
	 * being pathetically defensive, I check that assumption
	 */
	{
		AmpleHeadList *pWalk;
		int jCount = 0;

		for (pWalk = pAmpleLeftHead_m; pWalk != pAmpleRightHead_m; pWalk = pWalk->pRight) {
			if (pWalk == NULL) {
				fprintf(pAmple_in->pLogFP,
					"CATCOMP: righthead not right of lefthead");
				return 0;
			}
			jCount++;
			if(jCount > 100) {
				fprintf(pAmple_in->pLogFP,
					"CATCOMP: more than %d morphs?",
					jCount);
				return 0;
			}
		}
	}

	return reduceCategory(pAmple_in, pAmpleLeftHead_m, pAmpleRightHead_m);
} /* computeCategory */
