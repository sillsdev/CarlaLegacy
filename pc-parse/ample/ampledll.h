/* AMPLEDLL.H - definitions/declarations for the AMPLE Windows DLL
 ***************************************************************************
 * Copyright 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifndef AMPLE_DLL_INCLUDED
#define AMPLE_DLL_INCLUDED
#ifdef __cplusplus
extern "C" {
#endif

typedef struct ample_setup AmpleSetup;

typedef const char * (/*CALLBACK*/ * AMPLEFUNC5)(AmpleSetup *,
						 const char *,
						 const char *,
						 const char *,
						 const char *);
typedef const char * (/*CALLBACK*/ * AMPLEFUNC4)(AmpleSetup *,
						 const char *,
						 const char *,
						 const char *);
typedef const char * (/*CALLBACK*/ * AMPLEFUNC3)(AmpleSetup *,
						 const char *,
						 const char *);
typedef const char * (/*CALLBACK*/ * AMPLEFUNC2)(AmpleSetup *,
						 const char *);
typedef const char * (/*CALLBACK*/ * AMPLEFUNC1)(AmpleSetup *);
typedef AmpleSetup * (/*CALLBACK*/ * AMPLEFUNC0)(void);

#ifdef __cplusplus
}
#endif
#endif /*AMPLE_DLL_INCLUDED*/
