/* PRTHEADR.C - Print header info
 *****************************************************************************
 * Copyright 2000 SIL International.  All rights reserved.
 */
#include <stdio.h>

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
#undef  TESTFORMAT
#define COMPILEDFORMAT "Compiled %s %s\n"
#define PATCHLEVELSEPCHAR '.'
#endif	/* Beta */
#endif	/* Alpha */

const int	iSenTransVersion_g    = VERSION;
const int	iSenTransRevision_g   = REVISION;
#if PATCHLEVEL < 0
const int	iSenTransPatchlevel_g = -(PATCHLEVEL);
#else
const int	iSenTransPatchlevel_g = PATCHLEVEL;
#endif
const char	cSenTransPatchSep_g  = PATCHLEVELSEPCHAR;
const char *	pszSenTransDate_g     = DATE;
const char *	pszSenTransYear_g     = YEAR;
#ifdef __DATE__
const char *	pszSenTransCompileFormat_g = COMPILEDFORMAT;
const char *	pszSenTransCompileDate_g   = __DATE__;
const char *	pszSenTransCompileTime_g   = __TIME__;
#else
#ifdef TESTFORMAT
const char *	pszSenTransTestVersion_g = TESTFORMAT;
#else
const char *	pszSenTransTestVersion_g = NULL;
#endif
#endif

/*****************************************************************************
 * NAME
 *    print_header
 * DESCRIPTION
 *    print the program header to the indicated file (possibly the screen)
 * RETURN VALUE
 *    none
 */
void print_header(FILE *pOutFP_in, char *pszTime_in)
{
fprintf(pOutFP_in,
	"SENTRANS: SENtence TRANSfer\n");
fprintf(pOutFP_in, "Version %d.%d%c%d (%s), Copyright %s SIL, Inc.\n",
	iSenTransVersion_g, iSenTransRevision_g, cSenTransPatchSep_g,
	iSenTransPatchlevel_g, pszSenTransDate_g, pszSenTransYear_g);
#ifdef __DATE__
fprintf(pOutFP_in, pszSenTransCompileFormat_g,
	pszSenTransCompileDate_g, pszSenTransCompileTime_g);
#else
if (pszSenTransTestVersion_g != NULL)
	fputs(pszSenTransTestVersion_g, pOutFP_in);
#endif
#ifdef __GO32__
fprintf(pOutFP_in,
#ifdef __DJGPP__
"For 386 CPU (or better) under MS-DOS [compiled with DJGPP %d.%d/GNU C %d.%d]\n",
	__DJGPP__, __DJGPP_MINOR__,
#else
	"For 386 CPU (or better) under MS-DOS [compiled with DJGPP/GNU C %d.%d]\n",
#endif
	__GNUC__, __GNUC_MINOR__ );
#endif
fprintf( pOutFP_in, "                Time %s", pszTime_in );
}
