/* KIMMDATA.C - global data for PC-KIMMO library
 ***************************************************************************
 * Copyright 1997, 2000 by SIL International.  All rights reserved.
 */
#include "version.h"
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL 0
#endif

#if (VERSION < 1) && (REVISION < 99)
#define TESTFORMAT     "Alpha test version\n"
#define COMPILEDFORMAT "Alpha test version compiled %s %s\n"
#define PATCHLEVELSEPCHAR 'a'
#else
#if (PATCHLEVEL < 0) || ((VERSION < 1) && (REVISION == 99))
#define TESTFORMAT     "Beta test version\n"
#define COMPILEDFORMAT "Beta test version compiled %s %s\n"
#define PATCHLEVELSEPCHAR 'b'
#else
#undef  TESTFORMAT
#define COMPILEDFORMAT "Compiled %s %s\n"
#define PATCHLEVELSEPCHAR '.'
#endif
#endif

const int	iKimmoVersion_g    = VERSION;
const int	iKimmoRevision_g   = REVISION;
#if PATCHLEVEL < 0
const int	iKimmoPatchlevel_g = -(PATCHLEVEL);
#else
const int	iKimmoPatchlevel_g = PATCHLEVEL;
#endif
const char	cKimmoPatchSep_g  = PATCHLEVELSEPCHAR;
const char *	pszKimmoDate_g     = DATE;
const char *	pszKimmoYear_g     = YEAR;
#ifdef __DATE__
const char *	pszKimmoCompileFormat_g = COMPILEDFORMAT;
const char *	pszKimmoCompileDate_g   = __DATE__;
const char *	pszKimmoCompileTime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszKimmoTestVersion_g = TESTFORMAT;
#else
const char *	pszKimmoTestVersion_g = NULL;
#endif
#endif
/*
 *  interactive cancellation flag
 */
int	bCancelKimmoOperation_g = 0;
