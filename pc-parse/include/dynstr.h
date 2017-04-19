/* DYNSTR.H - data structure and function declarations for dynamic strings
 ******************************************************************************
 * Copyright 2000 by SIL International.  All rights reserved.
 */
#ifndef _DYNSTR_H_INCLUDED_
#define _DYNSTR_H_INCLUDED_
#ifdef __cplusplus
extern "C" {
#endif

/*****************************************************************************
 * NAME
 *    DynString
 * DESCRIPTION
 *    data structure for holding a dynamically allocated / growing string
 */
typedef struct {
	char * pszBuffer;
	size_t cbLen;
	size_t cbAlloc;
	int bError;
} DynString;

/*
 * dynstr.c
 */
extern int assignToDynString P((DynString * pdstr, const char * prgch,
				size_t cch));
extern int appendToDynString P((DynString * pdstr, const char * prgch,
				size_t cch));
extern int appendCharToDynString P((DynString * pdstr, int ch));
extern int initDynString P((DynString * pdstr, size_t cch));
extern void resetDynString P((DynString * pdstr));
extern void eraseDynString P((DynString * pdstr));

#ifdef __cplusplus
}
#endif
#endif /* _PATR_H_INCLUDED_ */
