/* COPYFEAT.C - utility functions used for properly copying feature DAGs
 *****************************************************************************
 *
 * void resetPATRFeatureCopyCheck(PATRData * pThis)
 *
 * PATRFeature * checkPATRFeatureCopy(PATRFeature * pFeature_in,
 *				      PATRData * pThis)
 *
 * void recordPATRFeatureCopy(PATRFeature * pFeature_in,
 *			      PATRFeature * pCopy_in,
 *			      PATRData * pThis)
 *
 *****************************************************************************
 * Copyright 1989, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "patr.h"
#include "patrdef.h"
#include "allocmem.h"

struct patr_copy_node
	{					/* A list of copied nodes */
	PATRFeature *node;			/* Node copied */
	PATRFeature *copy;			/* Pointer to copy */
	struct patr_copy_node *link;	/* List link */
	};

/*****************************************************************************
 * NAME
 *    resetPATRFeatureCopyCheck
 * DESCRIPTION
 *    reset the data for checking features being copied
 * RETURN VALUE
 *    none
 */
void resetPATRFeatureCopyCheck(pThis)
PATRData * pThis;
{
PATRFeatureCopy *f, *next;
/* Free multiple refs */
for ( f = pThis->pMem->pFeatureCopyList ; f ; f = next )
	{
	next = f->link;
	freeMemory( f );
	}
pThis->pMem->pFeatureCopyList = NULL;	/* Clear copy node list */
}

/*****************************************************************************
 * NAME
 *    checkPATRFeatureCopy
 * DESCRIPTION
 *    check whether this feature structure has already been copied
 * RETURN VALUE
 *    pointer to existing copy, or NULL if no copy exists yet
 */
PATRFeature * checkPATRFeatureCopy(x, pThis)
PATRFeature * x;
PATRData * pThis;
{
PATRFeatureCopy *m;			/* Temp for mult check */

for ( m = pThis->pMem->pFeatureCopyList ; m ; m = m->link )
	{					/* For each node in list */
	if ( m->node == x )			/* If x found */
	return( m->copy );		/* Return pointer to copy */
	}
return NULL;
}

/***************************************************************************
 * NAME
 *    recordPATRFeatureCopy
 * ARGUMENTS
 *    x     - Address to note has been seen.
 *    xcopy - Address of copy
 * DESCRIPTION
 *    Note that x has been visited, and record address of copy.
 * RETURN VALUE
 *    none
 */
void recordPATRFeatureCopy( x, xcopy, pThis )
PATRFeature * x;
PATRFeature * xcopy;
PATRData * pThis;
{
PATRFeatureCopy *m;				/* Temp for mult check */

/* Allocate copy remember node */
m = (PATRFeatureCopy *)allocMemory(sizeof(PATRFeatureCopy));
m->node = x;					/* Remember x */
m->copy = xcopy;				/* Remember where copy is */
m->link = pThis->pMem->pFeatureCopyList;	/* Link before old top */
pThis->pMem->pFeatureCopyList = m;		/* Set top to this */
}
