#ifndef hab130l
/* DispHead.c
 *****************************************************************************
 * Display PC_PATR header information
 *****************************************************************************
 * Copyright 2002 by SIL International.  All rights reserved.
 */
#include "patr.h"
/*  #include "pcpatr.h" */


/*****************************************************************************
 * NAME
 *    display_header
 * DESCRIPTION
 *    Write the program header information to the screen (stderr).
 * RETURN VALUE
 *    none
 */
void display_header(FILE * pOutFP_in)
{
if (pOutFP_in == NULL)
	return;

fprintf(pOutFP_in, "PC-PATR (PATR II style unification parser)\n");
fprintf(pOutFP_in, "Version %d.%d%c%d (%s), Copyright %s SIL\n",
	iPATRVersion_g, iPATRRevision_g, cPATRPatchSep_g,
	iPATRPatchlevel_g, pszPATRDate_g, pszPATRYear_g);
#ifdef __DATE__
fprintf(pOutFP_in, pszPATRCompileFormat_g,
	pszPATRCompileDate_g, pszPATRCompileTime_g);
#else
if (pszPATRTestVersion_g != NULL)
	fputs(pszPATRTestVersion_g, pOutFP_in);
#endif
fprintf(pOutFP_in, "with PC-Kimmo functions version %d.%d%c%d (%s)\n",
	iKimmoVersion_g, iKimmoRevision_g, cKimmoPatchSep_g,
	iKimmoPatchlevel_g, pszKimmoDate_g);
fprintf(pOutFP_in, "    and AMPLE functions version %d.%d%c%d (%s)\n",
	iAmpleVersion_g, iAmpleRevision_g, cAmplePatchSep_g,
	iAmplePatchlevel_g, pszAmpleDate_g);
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
}
#endif /* hab130l */
