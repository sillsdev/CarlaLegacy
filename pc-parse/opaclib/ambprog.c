/* AMBPROG.C - progress reporting with ambiguity indications
 ***************************************************************************
 *
 * unsigned showAmbiguousProgress(unsigned uiAmbiguityCount_in,
 *				  unsigned uiDotsCount_in)
 *
 ***************************************************************************
 * edit history is at the end of the file
 ***************************************************************************
 * Copyright 1995, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#ifdef __STDC__
unsigned long showAmbiguousProgress(unsigned uiAmbiguityCount_in,
					unsigned long uiDotsCount_in);
#endif

/*****************************************************************************
 * NAME
 *    showAmbiguousProgress
 * ARGUMENTS
 *    uiAmbiguityCount_in - ambiguity count (0 means failure)
 *    uiDotsCount_in      - number of characters written to screen on this line
 * DESCRIPTION
 *    Write a progress indicator to the screen.  If uiAmbiguityCount_in is 0,
 *    then a star (*) is written.  If uiAmbiguityCount_in is 1, then a dot (.)
 *    is written.  Otherwise, if uiAmbiguityCount_in is less than 10, the
 *    count digit is written, and if it is greater than 10, a greater than sign
 *    (>) is written.
 *    The progress characters are grouped in bunches of 10, with 5 bunches
 *    on a line and space between each bunch.  Every other line ends with the
 *    total count thus far (uiDotsCount_in).
 * RETURN VALUE
 *    updated value for uiDotsCount_in
 */
unsigned long showAmbiguousProgress(uiAmbiguityCount_in, uiDotsCount_in)
unsigned	uiAmbiguityCount_in;
unsigned long	uiDotsCount_in;
{
if (uiAmbiguityCount_in == 0)
	putc('*', stderr);
else if (uiAmbiguityCount_in == 1)
	putc('.', stderr);
else if (uiAmbiguityCount_in < 10)
	putc('0'+uiAmbiguityCount_in, stderr);
else
	putc('>', stderr);
++uiDotsCount_in;
if ((uiDotsCount_in % 100) == 0)
	fprintf(stderr, "  %lu\n", uiDotsCount_in);
else if ((uiDotsCount_in % 50) == 0)
	fputc('\n', stderr);
else if ((uiDotsCount_in % 10) == 0)
	fprintf(stderr, "  ");
#ifdef MACINTOSH
fflush(stderr);
#endif
return( uiDotsCount_in );
}

/***************************************************************************
 * EDIT HISTORY
 * 12-Oct-95	SRMc - create from similar code in several programs
 * 20-Oct-95	SRMc - fix for config.h (Autoconf)
 * 29-Oct-96	SRMc - revise to conform with AMPLE 2.0c practice
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 *  5-Aug-97	SRMc - revise according to Andy Black's request to use '*' for
 *			failures (uiAmbiguityCount_in == 0)
 */
