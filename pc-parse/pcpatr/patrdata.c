/* PATRDATA.C - global data for PC-PATR library
 ***************************************************************************
 * Copyright 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "patr.h"
#include "version.h"
#ifdef HAVE_CONFIG_H
#include "config.h"
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

const int	iPATRVersion_g    = VERSION;
const int	iPATRRevision_g   = REVISION;
#if PATCHLEVEL < 0
const int	iPATRPatchlevel_g = -(PATCHLEVEL);
#else
const int	iPATRPatchlevel_g = PATCHLEVEL;
#endif
const char	cPATRPatchSep_g  = PATCHLEVELSEPCHAR;
const char *	pszPATRDate_g     = DATE;
const char *	pszPATRYear_g     = YEAR;
#ifdef __DATE__
const char *	pszPATRCompileFormat_g = COMPILEDFORMAT;
const char *	pszPATRCompileDate_g   = __DATE__;
const char *	pszPATRCompileTime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszPATRTestVersion_g = TESTFORMAT;
#else
const char *	pszPATRTestVersion_g = NULL;
#endif
#endif
/*
 *  flag used for interactive cancellation
 */
int	bCancelPATROperation_g = FALSE;
