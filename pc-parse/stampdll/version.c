/* VERSION.C - global variables containing version information for STAMP
 *****************************************************************************
 * Copyright 1997, 1998 Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include "version.h"

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

const int	iStampVersion_g    = VERSION;
const int	iStampRevision_g   = REVISION;
#if PATCHLEVEL < 0
const int	iStampPatchlevel_g = -(PATCHLEVEL);
#else
const int	iStampPatchlevel_g = PATCHLEVEL;
#endif
#if PATCHLEVEL < 0
const int	iStampDLLPatchLevel_g = -(DLLPATCHLEVEL);
#else
const int   iStampDLLPatchLevel_g = DLLPATCHLEVEL;
#endif
const char	cStampPatchSep_g  = PATCHLEVELSEPCHAR;
const char *	pszStampDate_g     = CHANGEDATE;
const char *	pszStampYear_g     = YEAR;
#ifdef __DATE__
const char *	pszStampCompileFormat_g = COMPILEDFORMAT;
const char *	pszStampCompileDate_g   = __DATE__;
const char *	pszStampCompileTime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszStampTestVersion_g = TESTFORMAT;
#else
const char *	pszStampTestVersion_g = NULL;
#endif
#endif
