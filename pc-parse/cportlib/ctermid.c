/*	FILE:		CTERMI.C
 *	DATE WRITTEN:	12-Feb-87	BY: Steve McConnel
 *	DATE MODIFIED:	10-Mar-95	SRMc - rename BSD4 to BSD
 *			23-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	ctermid - as defined by Unix System V
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifdef STDC_HEADERS
#include <string.h>
#else
extern char * strcpy  P((char * dest, const char * src));
#endif

#ifdef UNIX
#include <stdio.h>
#define L_ctermid 12			/* must match sysV.h */
#define TTYNAME "/dev/tty"
#endif
#ifdef MSDOS
#define L_ctermid 4			/* must match sysV.h */
#define TTYNAME "CON"
#endif
#ifdef _WINDOWS
#define L_ctermid 4			/* must match sysV.h */
#define TTYNAME "CON"
#endif

#ifndef NULL
#define NULL (VOIDP)0
#endif
#define NUL '\0'

/************************************************************************
 * NAME
 *    ctermid
 * ARGUMENTS
 *    s - (optional) address of buffer to store results
 * DESCRIPTION
 *    Fill a buffer with the pathname of the controlling terminal.  If the
 *    argument s is NULL, an internal static buffer is used.
 * RETURN VALUE
 *    address of the buffer containing the pathname of the controlling
 *    terminal - either s or an internal static buffer
 */
char *ctermid(s)
char *s;
{
static char buf[L_ctermid];

#ifdef UNIX
register FILE *f;
register int i, k;
register char *p;
char tbuf[L_ctermid];
#endif

if (s == NULL)
	s = buf;
strcpy(s, TTYNAME );

#ifdef UNIX
f = fopen("/etc/ttys","r");
if (f)
	{
	for ( i = 0,  k = ttyslot() ; i < k ; ++i )
	fgets( tbuf, L_ctermid+2, f );
	if (k)
	strcpy( s+5, tbuf+2 );
	for ( p = s ; (*p != NUL) ; ++p )
	{
	if (*p == '\n')
		*p = NUL;
	}
	}
#endif

return( s );
}
