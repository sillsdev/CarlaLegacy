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
	unsigned cbLen;
	unsigned cbAlloc;
	int bError;
} DynString;

/*
 * dynstr.c
 */
extern int assignToDynString P((DynString * pdstr, const char * prgch,
				unsigned cch));
extern int appendToDynString P((DynString * pdstr, const char * prgch,
				unsigned cch));
extern int appendCharToDynString P((DynString * pdstr, int ch));
extern int initDynString P((DynString * pdstr, int cch));
extern void resetDynString P((DynString * pdstr));
extern void eraseDynString P((DynString * pdstr));

#ifdef __cplusplus
}
#endif
#endif /* _PATR_H_INCLUDED_ */
