/*	FILE:	    FPUTSS.C
 *	WRITTEN:    24-Feb-87	Stephen McConnel
 *	MODIFIED:   11-Apr-87	SMc - write '\r' for MSDOS Aztec C
 *		    30-Dec-88	SMc - fix for MSDOS Microsoft C
 *		    11-Aug-92	SMc - fix for Microsoft C 7.00 stupidity
 *
 *	FUNCTIONS:	fputss - as defined by DECUS C
 */
#include <stdio.h>
#ifdef _MSC_VER
#include <fcntl.h>
#include <io.h>
#if _MSC_VER >= 700
#define O_TEXT _O_TEXT
#define O_BINARY _O_BINARY
#define setmode(a,b) _setmode(a,b)
#endif
#endif
/************************************************************************
 * NAME
 *    fputss
 * ARGUMENTS
 *    s  - address of NUL-terminated character string
 *    fp - output FILE pointer
 * DESCRIPTION
 *    fputs() writes a string to the indicated file, like fputs(), but
 *    appending a newline like puts().
 * RETURN VALUE
 *    there is no return value
 */
void fputss(s,fp)
char *s;
FILE *fp;
{
#ifdef MSDOS
#ifdef _MSC_VER
register int k;
fputs(s,fp);		/* write the string */
k = setmode(fileno(fp), O_TEXT);	/* force translation of LF to CR-LF */
putc('\n',fp);		/* also write a newline */
if (k == O_BINARY)
	setmode(fileno(fp), O_BINARY);

#else	/* Aztec C */
fputs(s,fp);		/* write the string */
putc('\r',fp);
putc('\n',fp);		/* also write a newline */
#endif

#else
fputs(s,fp);		/* write the string */
putc('\n',fp);		/* also write a newline */
#endif
}
