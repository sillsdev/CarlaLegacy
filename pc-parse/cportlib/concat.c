/*	FILE:	    CONCAT.C
 *	WRITTEN:    31-Mar-87	Stephen McConnel
 *	MODIFIED:   30-Dec-88	SRMc - add support for Microsoft C
 *		     7-Sep-90	SRMc - support SCO's cross compiler stupidity
 *		    10-Mar-95	SRMc - rename BSD4 to BSD
 *		    20-Oct-95	SRMc - fix for config.h (Autoconf)
 *
 *	FUNCTIONS:	concat - as defined by DECUS C
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#ifndef NULL
#define NULL (VOIDP)0
#endif

/************************************************************************
 * NAME
 *    concat
 * ARGUMENTS
 *    out - address of output buffer
 *    in1 - address of first (NUL-terminated) input string
 *    in2 - address of second input string
 *    ...
 * DESCRIPTION
 *    Concatenate a number of strings.
 *    The last input argument must be a NULL pointer.
 * RETURN VALUE
 *    address of output buffer
 */
#ifdef HAVE_STDARG_H
#include <stdarg.h>
char *concat(char *out, ... )
{
va_list ap;
register char *p, *in;
va_start(ap, out);

#else
#include <varargs.h>
char *concat(va_alist)
va_dcl
{
va_list ap;
register char *p, *in;
char *out;
va_start(ap);
out = va_arg(ap, char *);
#endif

p = out;
if (out == NULL)
	return(out);
while ((in = va_arg(ap, char *)) != NULL)
	{
	while (*in)		/* copy input string to end of output string */
	*p++ = *in++;
	}
*p = '\0';			/* mark end of the string */
va_end(ap);
return( out );
}
