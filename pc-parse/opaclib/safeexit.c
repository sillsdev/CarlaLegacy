/* SAFEEXIT.C - "safe" exit function
 ***************************************************************************
 *
 * int exitSafely(int iCode_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1996, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef STDC_HEADERS
#include <stdlib.h>
#else
extern void exit P((int code));
#endif

#ifdef __STDC__
int exitSafely(int iCode_in);
#endif

/*************************************************************************
 * NAME
 *    exitSafely
 * DESCRIPTION
 *    This function is used instead of just calling exit().  When compiled for
 *    Windows, exitSafely() is defined elsewhere and does not call exit()
 *    because Windows doesn't like that very much!
 * RETURN VALUE
 *    none, but it must be defined as returning int to keep everyone happy
 */
int exitSafely(iCode_in)
int	iCode_in;	/* error code to return from program */
{
exit(iCode_in);
return(iCode_in);		/* never reached, but keeps compilers happy */
}

/***************************************************************************
 * EDIT HISTORY
 * 10-Oct-96	SRMc - extract my_exit() from AMPLE sources, rename to
 *		     - safe_exit()
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 * 31-Jan-97	SRMc - fix for STDC_HEADERS
 * 23-May-97	SRMc - renamed safe_exit() to exitSafely()
 */
