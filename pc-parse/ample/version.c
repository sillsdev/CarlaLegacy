/* VERSION.C - global variables containing version information for AMPLE
 *****************************************************************************
 * Copyright 1996, 2000 SIL International.  All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include "version.h"
#ifndef NULL
#define NULL 0
#endif

#if (VERSION < 1) && (REVISION < 99)
#define TESTFORMAT     "Alpha test version\n"
#define COMPILEDFORMAT "Alpha test version compiled %s %s\n"
#define PATCHLEVELSEPCHAR 'a'
#else   /* Alpha */
#if (PATCHLEVEL < 0) || ((VERSION < 1) && (REVISION == 99))
#define TESTFORMAT     "Beta test version\n"
#define COMPILEDFORMAT "Beta test version compiled %s %s\n"
#define PATCHLEVELSEPCHAR 'b'
#else   /* Beta */
#ifdef EXPERIMENTAL
#define TESTFORMAT     "Extended version\n"
#define COMPILEDFORMAT "Extended version compiled %s %s\n"
#define PATCHLEVELSEPCHAR 'x'
#else   /* EXPERIMENTAL */
#undef  TESTFORMAT
#define COMPILEDFORMAT "Compiled %s %s\n"
#define PATCHLEVELSEPCHAR '.'
#endif	/* EXPERIMENTAL */
#endif	/* Beta */
#endif	/* Alpha */

const int	iAmpleVersion_g    = VERSION;
const int	iAmpleRevision_g   = REVISION;
#if PATCHLEVEL < 0
const int	iAmplePatchlevel_g = -(PATCHLEVEL);
#else
const int	iAmplePatchlevel_g = PATCHLEVEL;
#endif
const char	cAmplePatchSep_g  = PATCHLEVELSEPCHAR;
const char *	pszAmpleDate_g     = DATE;
const char *	pszAmpleYear_g     = YEAR;
#ifdef __DATE__
const char *	pszAmpleCompileFormat_g = COMPILEDFORMAT;
const char *	pszAmpleCompileDate_g   = __DATE__;
const char *	pszAmpleCompileTime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszAmpleTestVersion_g = TESTFORMAT;
#else
const char *	pszAmpleTestVersion_g = NULL;
#endif
#endif
