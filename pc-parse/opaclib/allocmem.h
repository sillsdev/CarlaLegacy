/* ALLOCMEM.H - "safe" memory allocation functions
 ***************************************************************************
 *
 *	function prototypes
 *
 ***************************************************************************
 * edit history is at the end of ALLOCMEM.C
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef _ALLOCMEM_H_INCLUDED
#define _ALLOCMEM_H_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif
/*
 *  get a definition for size_t and VOIDP
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef STDC_HEADERS
#include <stddef.h>
#else
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#endif
#ifdef HAVE_STDARG_H
#include <stdarg.h>
#else
#include <varargs.h>
#endif

extern VOIDP		allocMemory P((size_t uiSize_in));
extern VOIDP		reallocMemory P((VOIDP pBuffer_in, size_t uiSize_in));
extern char *		duplicateString P((const char * pszString_in));
extern char *		fitAllocStringExactly P((char * pszString_in));
extern void		freeMemory P((VOIDP pBlock_io));
extern void		setAllocMemoryTracing P((const char * pszFilename_in));
extern void		setAllocMemoryTrap P((const VOIDP pAddress_in,
						  int iCount_in));
extern unsigned long	getAndClearAllocMemorySum P((void));
extern void		writeAllocMemoryDebugMsg P((
					const char * pszFormat_in, ...));

extern char		szOutOfMemoryMarker_g[/*101*/];
extern void (*		pfOutOfMemory_g) P((size_t size));

#ifdef __cplusplus
}
#endif
#endif /* _ALLOCMEM_H_INCLUDED */
