/* LOADCC.C - load a list of environmentally conditioned changes
 ***************************************************************************
 *
 * Change * loadAmpleDictOrthoChanges(pszDictOrthoFile_in, pAmpleData_io)
 * const char *	pszDictOrthoFile_in;
 * AmpleData *	pAmpleData_io;
 *
 ***************************************************************************
 * Copyright 1988, 1996 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"
/*
 *  dictionary orthography change code table
 */
static const CodeTable sDictOrthoCodes_m = { "\\ch\0C\0\\scl\0S", 2, NULL };

static const char	szWhitespace_m[7] = " \t\r\n\f\v";

/***************************************************************************
 * NAME
 *    loadAmpleDictOrthoChanges
 * DESCRIPTION
 *    Load a list of dictionary orthography changes from a file.
 * RETURN VALUE
 *    0 if successful, or 1 if an error occurs
 */
int loadAmpleDictOrthoChanges(pszDictOrthoFile_in, pAmpleData_io)
const char *	pszDictOrthoFile_in;
AmpleData *	pAmpleData_io;
{
FILE *		infp;
Change *	head;
Change *	tail;
Change *	cc;
char *		rp;
char *		end;
int		code;

infp = fopen(pszDictOrthoFile_in, "r");
if (infp == NULL)
	{
	reportError(ERROR_MSG,
		 "Cannot open dictionary orthography changes file %s\n",
		 pszDictOrthoFile_in);
	return 2;
	}

rp = readStdFormatRecord(infp,
			 &sDictOrthoCodes_m,
			 pAmpleData_io->cBeginComment,
			 NULL);
fclose(infp);

if (rp == NULL)
	return 1;

pAmpleData_io->pszDictOrthoChangeFile = duplicateString( pszDictOrthoFile_in );

head = tail = (Change *)NULL;
while (*rp != NUL)
	{
	code = *rp++;		/* grab the table code */
	rp += strspn(rp, szWhitespace_m);		/* skip following whitespace */
	switch (code)
	{
	case 'C':		/* change */
		end = rp + strlen(rp);
		cc = parseChangeString( rp, pAmpleData_io->pStringClasses);
		if (cc != (Change *)NULL)
		{		/* link change to end of list */
		if (head == (Change *)NULL)
			head = cc;
		else
			tail->pNext = cc;
		tail = cc;
		}
		rp = end;
		break;

	case 'S':		/* string class */
		end = rp + strlen(rp);
		pAmpleData_io->pStringClasses = addStringClass(rp,
						pAmpleData_io->pStringClasses);
		rp = end;
		break;

	} /* end switch */
	while (*rp++ != NUL)	/* skip rest of this entry in the record */
	;
	} /* end for */

pAmpleData_io->pDictOrthoChanges = head;
return 0;
}
