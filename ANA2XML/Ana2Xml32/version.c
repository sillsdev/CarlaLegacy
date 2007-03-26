/* VERSION.C - global variables containing version information for Ana2Xml
 *****************************************************************************
 * Copyright 2000 SIL Inernational
 * All rights reserved.
 */
#include "stdafx.h"

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef __cplusplus
extern "C" {
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

const int	iAna2XmlVersion_g    = VERSION;
const int	iAna2XmlRevision_g   = REVISION;

#if PATCHLEVEL < 0
const int	iAna2XmlPatchlevel_g = -(PATCHLEVEL);
#else
const int	iAna2XmlPatchlevel_g = PATCHLEVEL;
#endif

const char	cAna2XmlPatchSep_g  = PATCHLEVELSEPCHAR;
const char *	pszAna2XmlDate_g     = DATE;
const char *	pszAna2XmlYear_g     = YEAR;
#ifdef __DATE__
const char *	pszAna2XmlCompileFormat_g = COMPILEDFORMAT;
const char *	pszAna2XmlCompileDate_g   = __DATE__;
const char *	pszAna2XmlCompileTime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszAna2XmlTestVersion_g = TESTFORMAT;
#else
const char *	pszAna2XmlTestVersion_g = NULL;
#endif
#endif

#ifdef __cplusplus
}
#endif
