/* CONSTRAI.C - functions for handling priority logical constraints in PC-PATR
 ***************************************************************************
 *
 * void writePATRConstraint(pConstraint_in, pPATR_in, pOutputFP_in)
 * PATRConstraint * pConstraint_in;
 * PATRData *       pPATR_in;
 * FILE *           pOutputFP_in;
 *
 * void writePATRLogicalExpression(pExpression_in, pPATR_in, pOutputFP_in)
 * PATRLogicalExpression * pExpression_in;
 * PATRData *              pPATR_in;
 * FILE *                  pOutputFP_in;
 *
 * void applyPATRConstraint(pFeature_io, pConstraint_in, pPATR_in)
 * PATRFeature *    pFeature_io;
 * PATRConstraint * pConstraint_in;
 * PATRData *       pPATR_in;
 *
 ***************************************************************************
 * Copyright 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"

void writePATRLogicalFactor P((PATRLogicalFactor * pFactor_in,
				   PATRData *          pPATR_in,
				   FILE *              pOutput_in));
int evalLogicalFactor P((PATRFeature *       pFeature_in,
			 PATRLogicalFactor * pFactor_in));
int evalLogicalExpression P((PATRFeature *           pFeature_in,
				 PATRLogicalExpression * pExpression_in));

/*****************************************************************************
 * NAME
 *    writePATRLogicalFactor
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void writePATRLogicalFactor(pFactor_in, pPATR_in, pOutputFP_in)
PATRLogicalFactor * pFactor_in;
PATRData *          pPATR_in;
FILE *              pOutputFP_in;
{
if (pPATR_in == NULL)
	return;
if (pFactor_in == NULL)
	{
	fprintf(pOutputFP_in, "{NULL}");
	return;
	}
switch (pFactor_in->eType)
	{
	case kExpression:
	writePATRLogicalExpression(pFactor_in->u.pExpression, pPATR_in,
				   pOutputFP_in);
	break;
	case kFeature:
	writePATRFeature(pFactor_in->u.pFeature, pOutputFP_in, 20, pPATR_in);
	break;
	default:
	fprintf(pOutputFP_in, "BAD PATRLogicalExpression: eOperation = %d",
		   (int)pFactor_in->eType);
	break;
	}
}

/*****************************************************************************
 * NAME
 *    writePATRLogicalExpression
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void writePATRLogicalExpression(pExpression_in, pPATR_in, pOutputFP_in)
PATRLogicalExpression * pExpression_in;
PATRData *              pPATR_in;
FILE *                  pOutputFP_in;
{
if (pPATR_in == NULL)
	return;
if (pExpression_in == NULL)
	{
	fprintf(pOutputFP_in, "{NULL}");
	return;
	}
fprintf(pOutputFP_in, "(");
switch (pExpression_in->eOperation)
	{
	case kExist:
	writePATRLogicalFactor(pExpression_in->pLeft, pPATR_in, pOutputFP_in);
	break;
	case kNegate:
	fprintf(pOutputFP_in, "~");
	writePATRLogicalFactor(pExpression_in->pLeft, pPATR_in, pOutputFP_in);
	break;
	case kAnd:
	writePATRLogicalFactor(pExpression_in->pLeft, pPATR_in, pOutputFP_in);
	fprintf(pOutputFP_in, " & ");
	writePATRLogicalFactor(pExpression_in->pRight, pPATR_in, pOutputFP_in);
	break;
	case kOr:
	writePATRLogicalFactor(pExpression_in->pLeft, pPATR_in, pOutputFP_in);
	fprintf(pOutputFP_in, " / ");
	writePATRLogicalFactor(pExpression_in->pRight, pPATR_in, pOutputFP_in);
	break;
	case kConditional:
	writePATRLogicalFactor(pExpression_in->pLeft, pPATR_in, pOutputFP_in);
	fprintf(pOutputFP_in, " -> ");
	writePATRLogicalFactor(pExpression_in->pRight, pPATR_in, pOutputFP_in);
	break;
	case kBiconditional:
	writePATRLogicalFactor(pExpression_in->pLeft, pPATR_in, pOutputFP_in);
	fprintf(pOutputFP_in, " <-> ");
	writePATRLogicalFactor(pExpression_in->pRight, pPATR_in, pOutputFP_in);
	break;
	default:
	fprintf(pOutputFP_in, "BAD PATRLogicalExpression: eOperation = %d",
		   (int)pExpression_in->eOperation);
	break;
	}
fprintf(pOutputFP_in, ")");
}

/*****************************************************************************
 * NAME
 *    writePATRConstraint
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void writePATRConstraint(pConstraint_in, pPATR_in, pOutputFP_in)
PATRConstraint * pConstraint_in;
PATRData *       pPATR_in;
FILE *           pOutputFP_in;
{
fprintf(pOutputFP_in, "<");
writeStringList(pConstraint_in->pPath, " ", pOutputFP_in);
fprintf(pOutputFP_in, "> ==\n        ");
writePATRLogicalExpression(pConstraint_in->pExpression, pPATR_in,
			   pOutputFP_in);
fprintf(pOutputFP_in, "\n");
}

/*****************************************************************************
 * NAME
 *    evalLogicalFactor
 * DESCRIPTION
 *
 * RETURN VALUE
 *    TRUE or FALSE
 */
int evalLogicalFactor(pFeature_in, pFactor_in)
PATRFeature *       pFeature_in;
PATRLogicalFactor * pFactor_in;
{
if ((pFeature_in == NULL) || (pFactor_in == NULL))
	return TRUE;
switch (pFactor_in->eType)
	{
	case kExpression:
	return evalLogicalExpression(pFeature_in, pFactor_in->u.pExpression);

	case kFeature:
	return subsumesPATRFeature(pFactor_in->u.pFeature, pFeature_in);

	default:
	return FALSE;
	}
}

/*****************************************************************************
 * NAME
 *    evalLogicalExpression
 * DESCRIPTION
 *
 * RETURN VALUE
 *    TRUE or FALSE
 */
int evalLogicalExpression(pFeature_in, pExpression_in)
PATRFeature *           pFeature_in;
PATRLogicalExpression * pExpression_in;
{
int bLeftValue;
int bRightValue;

if ((pFeature_in == NULL) || (pExpression_in == NULL))
	return TRUE;
switch (pExpression_in->eOperation)
	{
	case kExist:
	return evalLogicalFactor(pFeature_in, pExpression_in->pLeft);

	case kNegate:
	return !evalLogicalFactor(pFeature_in, pExpression_in->pLeft);

	case kAnd:
	return  evalLogicalFactor(pFeature_in, pExpression_in->pLeft) &&
		evalLogicalFactor(pFeature_in, pExpression_in->pRight);

	case kOr:
	return  evalLogicalFactor(pFeature_in, pExpression_in->pLeft) ||
		evalLogicalFactor(pFeature_in, pExpression_in->pRight);

	case kConditional:
	bLeftValue  = evalLogicalFactor(pFeature_in, pExpression_in->pLeft);
	bRightValue = evalLogicalFactor(pFeature_in, pExpression_in->pRight);
	return !bLeftValue || bRightValue;

	case kBiconditional:
	bLeftValue  = evalLogicalFactor(pFeature_in, pExpression_in->pLeft);
	bRightValue = evalLogicalFactor(pFeature_in, pExpression_in->pRight);
	return (bLeftValue && bRightValue) || (!bLeftValue && !bRightValue);

	default:
	return FALSE;
	}
}

/*****************************************************************************
 * NAME
 *    applyPATRConstraint
 * DESCRIPTION
 *    Check whether the PATR feature satisfies the given logical constraint.
 * RETURN VALUE
 *    TRUE if the constraint is satisfied, otherwise FALSE
 */
int applyPATRConstraint(pFeature_in, pConstraint_in, pPATR_in)
PATRFeature *    pFeature_in;
PATRConstraint * pConstraint_in;
PATRData *       pPATR_in;
{
PATRFeature * pTestFeature;
int           bValue = TRUE;

if ((pFeature_in == NULL) || (pConstraint_in == NULL) || (pPATR_in == NULL))
	return TRUE;

if (pPATR_in->iDebugLevel >= 2)
	{
	fprintf(stdout, "DEBUG: applyPATRConstraint(pFeature, pConstraint)\n");
	fprintf(stdout, "pFeature = ");
	writePATRFeature(pFeature_in, stdout, 12, pPATR_in);
	fprintf(stdout, "\npConstraint = ");
	writePATRConstraint(pConstraint_in, pPATR_in, stdout);
	fprintf(stdout, "\n");
	}

pTestFeature = followPATRFeaturePath(pFeature_in, pConstraint_in->pPath);
if (pTestFeature != NULL)
	bValue = evalLogicalExpression(pTestFeature, pConstraint_in->pExpression);

if (pPATR_in->iDebugLevel >= 2)
	fprintf(stdout, "DEBUG: applyPATRConstraint() => %s\n",
		pTestFeature ? (bValue ? "TRUE" : "FALSE") : "TRUE (N/A)");

return bValue;
}
