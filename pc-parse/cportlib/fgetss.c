/* FGETSS.C - wrapper for fgets() that removes trailing newline
 *****************************************************************************
 *
 * char * fgetss(char *s, int n, FILE *stream)
 *
 *****************************************************************************
 * Copyright 1985, 1997 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include <stdio.h>
#ifdef __STDC__
char * fgetss(char *s, int n, FILE *stream);
#endif

/************************************************************************
 * NAME
 *    fgetss
 * ARGUMENTS
 *    s      - pointer to input buffer
 *    n      - size of input buffer
 *    stream - input FILE pointer
 * DESCRIPTION
 *    Get a line from a stream, removing the trailing newline.  This is
 *    just like fgets(), except it treats newlines the same as gets().
 *    (This is a DECUS C function.)
 * RETURN VALUE
 *    pointer to the input buffer (original value of `s') if valid input
 *    NULL if input is not valid (EOF, etc)
 */
char *fgetss(s, n, stream)
char *s;
int n;
FILE *stream;
{
register char *p;

if (fgets(s, n, stream) != NULL)
	{
	for (p = s ; *p != '\0' ; ++p)
	{
	if (*p == '\n')
		{
		*p = '\0';		/* remove trailing newline */
		break;
		}
	}
	return(s);
	}
else
	return(NULL);
}

/*****************************************************************************
 * EDIT HISTORY
 *  6-Sep-85	Steve McConnel
 * 14-Feb-86	SRMc - reformat & edit comments
 * 24-Feb-87	SRMc - remove call to index()
 * 23-Jan-97	SRMc - add prototype for strict ANSI C
 */
