/* AMPCAT.H - definitions/declarations for AMPLE library
 ***************************************************************************
 * Copyright 2005 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _AMPCAT_H_INCLUDED_
#define _AMPCAT_H_INCLUDED_
#ifdef __cplusplus
extern "C" {
#endif

#include "stample.h"


/* This function will compute the category of the entire head list, via a reduce-shift
 * algorithm.
 * If there is no solution to the computation, 0 will be returned.
 */
extern int
computeCategory P((AmpleData * pAmple_in,
				 AmpleHeadList *pAmpleLeftHead_m,
				 AmpleHeadList *pAmpleRightHead_m));

#ifdef __cplusplus
}
#endif
#endif /* _AMPCAT_H_INCLUDED_*/
