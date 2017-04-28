/* LOADTB.C - load the AMPLE dictionary code change tables
 ***************************************************************************
 *
 * void reportAmpleDictCodeTable(int         eType_in,
 *				 AmpleData * pAmple_in);
 *
 * int loadAmpleDictCodeTables(const char * pszCodesFile_in,
 *			       AmpleData *  pAmpleData_io);
 *
 ***************************************************************************
 * Copyright 1988, 1998 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#include "ample.h"
#include "ampledef.h"

/********************* LOADTB.C FUNCTION PROTOTYPES *********************/

static int	code_tab_has_U P((CodeTable * tab,
				  int         do_uf,
				  int         rtype,
				  int         iPrevType_in,
				  FILE *      pLogFP_in));
static char *	dict_name P((int rtype));

static const char	szWhitespace_m[7] = " \t\r\n\f\v";
static const char	szMissingUMsg_m[] =
			"DICTIONARY CODE TABLE: missing \"U\" gate in %s record\n";

/***************************************************************************
 * NAME
 *    reportAmpleDictCodeTable
 * DESCRIPTION
 *    Show the size of the designated code table.
 * RETURN VALUE
 *    none
 */
void reportAmpleDictCodeTable(eType_in, pAmple_in)
int		eType_in;
AmpleData *	pAmple_in;
{
static const char	szReportMessage_s[] =
			   "\t%d change%s loaded from %s dictionary code table.\n";
CodeTable *	pTable;
char *		pszType;

if ((eType_in != 0) && (pAmple_in != NULL))
	{
	switch (eType_in)
	{
	case AMPLE_PFX:
		pTable  = pAmple_in->pPrefixTable;
		pszType = "prefix";
		break;
	case AMPLE_IFX:
		pTable  = pAmple_in->pInfixTable;
		pszType = "infix";
		break;
	case AMPLE_SFX:
		pTable  = pAmple_in->pSuffixTable;
		pszType = "suffix";
		break;
	case AMPLE_ROOT:
		pTable  = pAmple_in->pRootTable;
		pszType = "root";
		break;
	default:
		pTable  = pAmple_in->pDictTable;
		pszType = "unified";
		break;
	}
	if (pTable != NULL)
	reportMessage(TRUE, szReportMessage_s,
			  pTable->uiCodeCount,
			  (pTable->uiCodeCount == 1) ? "" : "s",
			  pszType );
	}
}

/*************************************************************************
 * NAME
 *    code_tab_has_U
 * ARGUMENTS
 *    ctp   - code table
 *    do_uf - do_underlying form flag
 *    rtype - type of record (prefix, infix, root, suffix)
 * DESCRIPTION
 *    See if a code table has a U gate.
 * RETURN VALUE
 *    TRUE  if it does
 *    FALSE otherwise
 */
static int code_tab_has_U(ctp, do_uf, rtype, iPrevType_in, pLogFP_in)
CodeTable * ctp;
int	do_uf;
int	rtype;
int	iPrevType_in;
FILE *	pLogFP_in;
{
char *match;
char *subs;
int ncodes;

if ( ctp != (CodeTable *)NULL )
	{
	/* look for a U gate in the code table */
	for (   match = ctp->pCodeTable, ncodes = ctp->uiCodeCount ;
		ncodes ;
		ncodes-- )
	{
	subs = match + strlen(match) + 1;
	if (strcmp(subs, "U") == 0)
		break;
	match = subs + strlen(subs) + 1;
	}

	if (ncodes)  /* U gate found */
	{
	if (!do_uf && iPrevType_in)
		{
		/*
		 *  previous record did not have a U gate, but this one does;
		 *  alert user of the inconsistency
		 */
		if (pLogFP_in != NULL)
		fprintf(pLogFP_in, szMissingUMsg_m, dict_name(iPrevType_in));
		}
	do_uf = TRUE;     /* will do underlying forms */
	}
	else if (do_uf)
	{
	/*
	 *  another record had a U gate, but this one does not;
	 *  alert user of the inconsistency
	 */
	if (pLogFP_in != NULL)
		fprintf(pLogFP_in, szMissingUMsg_m, dict_name(rtype));
	}
	}
return(do_uf);
} /* end code_tab_has_U */

/*************************************************************************
 * NAME
 *    dict_name
 * ARGUMENTS
 *    rtype - type of record (prefix, infix, root, suffix)
 * DESCRIPTION
 *    return name of dictionary according to the type
 * RETURN VALUE
 *    dictionary name
 */
static char * dict_name(rtype)
int rtype;
{
char *name;

switch (rtype)
	{
	case AMPLE_PFX:	name = "prefix";	break;
	case AMPLE_IFX:	name = "infix";		break;
	case AMPLE_ROOT:	name = "root";		break;
	case AMPLE_SFX:	name = "suffix";	break;
	default:		name = "unified";	break;
	}
return( name );
}

/*****************************************************************************
 * NAME
 *    fix_first_code
 * DESCRIPTION
 *    add the pszFirstCode code to the pCodeTable if it isn't already there
 * RETURN VALUE
 *    none
 */
static void fix_first_code(pTable_io)
CodeTable *	pTable_io;
{
unsigned	i;
char *		p;
size_t		uiOldSize;
size_t		uiNewSize;

for ( p = pTable_io->pCodeTable, i = 0 ; i < pTable_io->uiCodeCount ; ++i )
	{
	if (strcmp(p, pTable_io->pszFirstCode) == 0)
	return;
	p += strlen(p) + 1;		/* move past match string */
	p += strlen(p) + 1;		/* move past replace string */
	}
uiOldSize = p - pTable_io->pCodeTable;
uiNewSize = uiOldSize + strlen(pTable_io->pszFirstCode) + 3;

if (pTable_io->pCodeTable == NULL)
	pTable_io->pCodeTable = allocMemory(uiNewSize);
else
	pTable_io->pCodeTable = reallocMemory(pTable_io->pCodeTable, uiNewSize);
strcpy(pTable_io->pCodeTable + uiOldSize, pTable_io->pszFirstCode);
strcpy(pTable_io->pCodeTable + uiOldSize + strlen(pTable_io->pszFirstCode)+1,
	   "r");
pTable_io->uiCodeCount++;
}

/*****************************************************************************
 * NAME
 *    loadAmpleDictCodeTables
 * DESCRIPTION
 *    load the AMPLE dictionary code change tables file
 * RETURN VALUE
 *    0 if successful, nonzero if an error occurs
 */
int loadAmpleDictCodeTables(pszCodesFile_in, pAmpleData_io)
const char *	pszCodesFile_in;
AmpleData *	pAmpleData_io;
{
FILE *		pCodeFP;
char *		rp;
int		code;
char *		p;
char *		firstmark;
char *		pszMatch;
char *		pszReplace;
int		cQuote;
size_t	uiTableLength = 0;
size_t	uiOldLength;
CodeTable **	ppTable = NULL;
int		bSkipSection = TRUE;
int		iPreviousType;
/*
 *  code table for reading dictionary code change tables
 */
static const CodeTable dcode_codes = {
	"\\ch\0C\0\\prefix\0P\0\\infix\0I\0\\root\0R\0\\suffix\0S\0\\unified\0U",
	6,
	NULL
	};

pAmpleData_io->pszDictionaryCodesFile = NULL;
pAmpleData_io->pPrefixTable = NULL;
pAmpleData_io->pInfixTable  = NULL;
pAmpleData_io->pSuffixTable = NULL;
pAmpleData_io->pRootTable   = NULL;
pAmpleData_io->pDictTable   = NULL;

pCodeFP = fopen(pszCodesFile_in, "r");
if (pCodeFP == (FILE *)NULL)
	{
	reportError(ERROR_MSG,
		"Cannot open dictionary codes file %s\n", pszCodesFile_in);
	return 2;
	}

rp = readStdFormatRecord(pCodeFP,
			 &dcode_codes,
			 pAmpleData_io->cBeginComment,
			 NULL);
fclose(pCodeFP);
if (rp == NULL)
	{
	reportError(ERROR_MSG,
		"Empty dictionary codes file %s\n", pszCodesFile_in);
	return 1;
	}
pAmpleData_io->pszDictionaryCodesFile = duplicateString( pszCodesFile_in );
while (*rp)
	{
	code = *rp++;		/* grab the table code */
	rp += strspn(rp, szWhitespace_m);	/* skip following whitespace */
	switch (code)
	{
	case 'C':		/* change */
		if (bSkipSection || (ppTable == NULL))
		break;
		/*
		 *  isolate the pieces of the change
		 */
		cQuote = *rp++;
		pszMatch = rp;
		rp += strlen(rp) + 1;   /* skip over this record */
		p = strchr(pszMatch, cQuote);
		if (p == NULL)
		break;
		*p++ = NUL;
		p = strchr(p, cQuote);
		if (p == NULL)
		break;
		pszReplace = p+1;
		p = strchr(pszReplace, cQuote);
		if (p == NULL)
		break;
		*p = NUL;
		/*
		 *  add this change to the end of the table of changes
		 */
		uiOldLength = uiTableLength;
		uiTableLength += strlen(pszMatch) + strlen(pszReplace) + 2;
		if ((*ppTable)->pCodeTable == NULL)
		(*ppTable)->pCodeTable = allocMemory(uiTableLength);
		else
		(*ppTable)->pCodeTable = reallocMemory((*ppTable)->pCodeTable,
							 uiTableLength);
		strcpy((*ppTable)->pCodeTable + uiOldLength, pszMatch);
		strcpy((*ppTable)->pCodeTable + uiOldLength + strlen(pszMatch)+1,
		   pszReplace);
		(*ppTable)->uiCodeCount++;
		break;

	case 'P':
		if (pAmpleData_io->iMaxPrefixCount == 0)
		{
		ppTable      = NULL;
		bSkipSection = TRUE;
		break;
		}
		ppTable = &(pAmpleData_io->pPrefixTable);
		goto common;

	case 'I':
		if (pAmpleData_io->iMaxInfixCount == 0)
		{
		ppTable      = NULL;
		bSkipSection = TRUE;
		break;
		}
		ppTable = &(pAmpleData_io->pInfixTable);
		goto common;

	case 'S':
		if (pAmpleData_io->iMaxSuffixCount == 0)
		{
		ppTable      = NULL;
		bSkipSection = TRUE;
		break;
		}
		ppTable = &(pAmpleData_io->pSuffixTable);
		goto common;

	case 'R':
		ppTable = &(pAmpleData_io->pRootTable);
		goto common;

	case 'U':
		ppTable = &(pAmpleData_io->pDictTable);
common:
		bSkipSection = FALSE;
		*ppTable = (CodeTable *)allocMemory(sizeof(CodeTable));
		(*ppTable)->pCodeTable = NULL;
		uiTableLength = 0;
		(*ppTable)->uiCodeCount  = 0;
		firstmark = rp;
		rp += strlen(rp) + 1;   /* skip over this initial record */
		if (*firstmark == pAmpleData_io->sTextCtl.cFormatMark)
		{
		isolateWord(firstmark);
		(*ppTable)->pszFirstCode = duplicateString(firstmark);
		}
		else
		(*ppTable)->pszFirstCode = NULL;
		break;

	default:
		rp += strlen(rp) + 1;
		break;
	} /* end switch */
	}

pAmpleData_io->iOutputFlags &= ~WANT_UNDERLYING;

iPreviousType = 0;
if (pAmpleData_io->pDictTable != NULL)
	{
	if (code_tab_has_U(pAmpleData_io->pDictTable,
			   pAmpleData_io->iOutputFlags & WANT_UNDERLYING,
			   AMPLE_UNIFIED,
			   iPreviousType,
			   pAmpleData_io->pLogFP))
	pAmpleData_io->iOutputFlags |= WANT_UNDERLYING;
	iPreviousType = AMPLE_UNIFIED;
	if ((pAmpleData_io->pDictTable)->pszFirstCode != NULL)
	fix_first_code(pAmpleData_io->pDictTable);
	}
if (pAmpleData_io->pPrefixTable != NULL)
	{
	if (code_tab_has_U(pAmpleData_io->pPrefixTable,
			   pAmpleData_io->iOutputFlags & WANT_UNDERLYING,
			   AMPLE_PFX,
			   iPreviousType,
			   pAmpleData_io->pLogFP))
	pAmpleData_io->iOutputFlags |= WANT_UNDERLYING;
	iPreviousType = AMPLE_PFX;
	if ((pAmpleData_io->pPrefixTable)->pszFirstCode != NULL)
	fix_first_code(pAmpleData_io->pPrefixTable);
	}
if (pAmpleData_io->pInfixTable != NULL)
	{
	if (code_tab_has_U(pAmpleData_io->pInfixTable,
			   pAmpleData_io->iOutputFlags & WANT_UNDERLYING,
			   AMPLE_IFX,
			   iPreviousType,
			   pAmpleData_io->pLogFP))
	pAmpleData_io->iOutputFlags |= WANT_UNDERLYING;
	iPreviousType = AMPLE_IFX;
	if ((pAmpleData_io->pInfixTable)->pszFirstCode != NULL)
	fix_first_code(pAmpleData_io->pInfixTable);
	}
if (pAmpleData_io->pSuffixTable != NULL)
	{
	if (code_tab_has_U(pAmpleData_io->pSuffixTable,
			   pAmpleData_io->iOutputFlags & WANT_UNDERLYING,
			   AMPLE_SFX,
			   iPreviousType,
			   pAmpleData_io->pLogFP))
	pAmpleData_io->iOutputFlags |= WANT_UNDERLYING;
	iPreviousType = AMPLE_SFX;
	if ((pAmpleData_io->pSuffixTable)->pszFirstCode != NULL)
	fix_first_code(pAmpleData_io->pSuffixTable);
	}
if (pAmpleData_io->pRootTable != NULL)
	{
	if (code_tab_has_U(pAmpleData_io->pRootTable,
			   pAmpleData_io->iOutputFlags & WANT_UNDERLYING,
			   AMPLE_ROOT,
			   iPreviousType,
			   pAmpleData_io->pLogFP))
	pAmpleData_io->iOutputFlags |= WANT_UNDERLYING;
	iPreviousType = AMPLE_ROOT;
	if ((pAmpleData_io->pRootTable)->pszFirstCode != NULL)
	fix_first_code(pAmpleData_io->pRootTable);
	}
return 0;
}
