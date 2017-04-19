/*      TSINIT.C - initialization functions for STAMP
 ***************************************************************************
 *
 * int loadStampControlFile(const char * pszFilename_in,
 *                          StampData *  pStamp_io)
 *
 * int loadStampTransferFile(const char * pszFilename_in,
 *                           StampData *  pStamp_io)
 *
 * int loadStampSynthesisFile(const char * pszFilename_in,
 *                            StampData *  pStamp_io)
 *
 * int loadStampDictCodeTables(const char * pszFilename_in,
 *                             StampData *  pStamp_io)
 *
 * void reportStampDictCodeTable(int         eDicType_in,
 *                               StampData * pStamp_in)
 *
 * int loadStampDictOrthoChanges(const char * pszFilename_in,
 *                               StampData *  pStamp_io)
 *
 * void resetStampData(StampData * pStamp_io)
 *
 ***************************************************************************
 * edit history is in version.h
 ***************************************************************************
 * Copyright 1988, 2002 by the Summer Institute of Linguistics, Inc.
 * All rights reserved.
 */
#if _MSC_VER >= 800
#include <io.h>
#include <time.h>
#endif

#include <stdio.h>
#include <ctype.h>
#include <time.h>
#include "stamp.h"
#if _MSC_VER >= 800
#define strlwr _strlwr
#endif

static void fix_first_code P((CodeTable * pTable_io));
static void set_ambig P((char  *str, StampData * pStamp_io));
static void set_rootdelim P((char  *str, StampData * pStamp_io));
static void show_codetab P((CodeTable * ctp,
				char *      type,
				FILE *      pOutputFP_in));

#ifdef TONEPARS
/****************************************************************************
 * function prototypes
 */

extern void              parseToneRule P((char *cp, int type,
					  StampData *pStamp_in));
extern void              set_tone_cycle P((int cycle));
extern void                  set_edge_cond     P((char *lp,
						  FILE *pOutputFP_in));
extern void                  set_tone_domain  P((char *lp,
						 FILE *pOutputFP_in));
extern void                  set_tone_type    P((char *lp,
						 FILE *pOutputFP_in));
extern void                  set_tone_value   P((char *lp,
						 int tier,
						 int value,
						 FILE *pOutputFP_in));
extern void                  build_primary_register_tone_combos P((FILE *pOutputFP_in));
#include "trule.h"
extern char * strlwr P((char *string));
#endif /* TONEPARS */

static const char szWhitespace_m[7] = " \t\r\n\f\v";

/******************************************************************************
 * field code table for STAMP control files
 *
 * External Internal  used  description
 * -------- --------  ----  -----------
 * \ca        A       12345   Category
 * \ccl       B       12345   Category Class
 * \mcl       C       12345   Morpheme Class
 * \scl       D       12345   String Class
 * \ap        E       12345   Allomorph Property
 * \mp        F       12345   Morpheme Property
 * \ambig     G       12345   Ambiguity Marker (default %)
 * \rd        H       12345   Root Delimiters (default < >)
 * \ir        I        2      Insertion Rule
 * \fl        J        2      Flag Rule
 * \cr        K        2      Copy Rule
 * \lc        L        23     Lexical Change
 * \maxprops  M       12345   Maximum number of Allomorph/Morpheme Properties
 * \rscid     N         3     Regular Sound Change Markers (default *)
 * \rsc       R         3     Regular Sound Change
 * \sr        S        2      Substitution Rule
 * \test      T         3 5   Synthesis Test
 * \strcheck  V       12345   Character list for string checks 1.5b BJY
 * \pcl       W       12345   Punctuation Class   2.1b1 hab
 * \dsc       e          45   Morpheme Decomposition Separation Character
 *
 * used: 1=STAMP, 2=Transfer, 3=Synthesis, 4=TonePars, 5=ToneGen
 */
static const CodeTable asControlFields_m = { "\
\\ca\0A\0\
\\ccl\0B\0\
\\mcl\0C\0\
\\scl\0D\0\
\\ap\0E\0\
\\mp\0F\0\
\\ambig\0G\0\
\\rd\0H\0\
\\ir\0I\0\
\\fl\0J\0\
\\cr\0K\0\
\\lc\0L\0\
\\maxprops\0M\0\
\\rscid\0N\0\
\\rsc\0R\0\
\\sr\0S\0\
\\test\0T\0\
\\strcheck\0V\0\
\\pcl\0W\0\
\\dsc\0e\0\
", 20, NULL };			/* added \\pcl 2.1b1 hab */
				/* added \\dsc 2.1b7 hab */

/******************************************************************************
 * field code table for TonePars/ToneGen control files
 *
 * External Internal  description
 * -------- --------  -----------
 *** to be done!! **
 * \ca        A       Category
 * \ccl       B       Category Class
 * \mcl       C       Morpheme Class
 * \scl       D       String Class
 * \ap        E       Allomorph Property
 * \mp        F       Morpheme Property
 * \ambig     G       Ambiguity Marker (default %)
 * \rd        H       Root Delimiters (default < >)
 * \ir        I       Insertion Rule
 * \fl        J       Flag Rule
 * \cr        K       Copy Rule
 * \lc        L       Lexical Change
 * \maxprops  M       Maximum number of Allomorph/Morpheme Properties
 * \rscid     N       Regular Sound Change Markers (default *)
 * \rsc       R       Regular Sound Change
 * \sr        S       Substitution Rule
 * \test      T       Synthesis Test
 * \strcheck  V       Character list for string checks 1.5b BJY
 * \pcl       W       Punctuation Class   2.1b1 hab
 *
 */
/*
 *  control code table
 */
static const CodeTable asToneControlFields_m = { "\
\\ambig\0j\0\
\\ap\0l\0\
\\begcycle\0Y\0\
\\ca\0c\0\
\\ccl\0I\0\
\\dch\0D\0\
\\default\0d\0\
\\DoNoMorphemeCrossing\0b\0\
\\domain\0U\0\
\\ec\0G\0\
\\edge_cond\0E\0\
\\edge_rule\0e\0\
\\endcycle\0y\0\
\\endtonedefs\0Z\0\
\\mcl\0i\0\
\\monomoraic\0M\0\
\\morastr\0m\0\
\\mp\0p\0\
\\nocodas\0C\0\
\\phrasefinalchars\0h\0\
\\right_edge_rule\0g\0\
\\scl\0S\0\
\\segments\0R\0\
\\sylalgor\0a\0\
\\sylsep\0H\0\
\\sylstr\0$\0\
\\tbutype\0u\0\
\\tone_reg_value\0x\0\
\\tone_rule\0B\0\
\\tonetype\0T\0\
\\tonevalue\0t\0\
\\v.ccv\0v\0\
\\vc.cv\0V\0\
\\wtbypos\0W\0\
", 34, NULL };


/***************************************************************************
 * field code table for reading dictionary code change tables
 *
 *      External Internal       description
 *      -------- --------       -----------
 *       \ch       C            Change
 *       \prefix   P            prefix dictionary code section
 *       \infix    I            infix dictionary code section
 *       \root     R            root dictionary code section
 *       \suffix   S            suffix dictionary code section
 *       \Unified  U            unified dictionary code section
 */
static const CodeTable asDictCodeFields_m = { "\
\\ch\0C\0\
\\prefix\0P\0\
\\infix\0I\0\
\\root\0R\0\
\\suffix\0S\0\
\\unified\0U",
						  6, NULL };

/***************************************************************************
 *  field code table for orthography change file
 *
 *      External Internal       description
 *      -------- --------       -----------
 *       \ch       C            Change
 *       \scl      S            String class definition
 */
static const CodeTable asDictOrthoFields_m = { "\
\\ch\0C\0\
\\scl\0S",
						   2, NULL };

/*************************************************************************
 * NAME
 *    loadStampControlFile
 * DESCRIPTION
 *    Load the STAMP control file, storing the information contained
 *    therein.
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurs
 */
int loadStampControlFile(pszFilename_in, pStamp_io)
const char *	pszFilename_in;
StampData *	pStamp_io;
{
char *	recp;		/* overall record pointer */
char *	rp;		/* Current string in record */
char *	endp;		/* End of current string in record */
int	code;		/* Field code for current string in record */
FILE *	infp;
unsigned long	uiTemp;
#ifdef TONEPARS
int     iSeenDsc = 0;
#endif /* TONEPARS */
/*
 *  read the entire transfer control file into a single record
 */
infp = fopen(pszFilename_in, "r");
if (infp == NULL)
	{
	return 1;
	}
recp = readStdFormatRecord(infp, &asControlFields_m, pStamp_io->cComment,
			   NULL);
if (pStamp_io->iDebugLevel && (pStamp_io->pLogFP != NULL))
	fprintf(pStamp_io->pLogFP, "\nRECORD IS:\n%s\n\n",
		recp ? recp : "?unreadable? (NULL)");
if (recp == (char *)NULL)
	{
	return 0;			/* nothing in the file?  oh, well... */
	}
/*
 *  fill in global transfer data according to codes in record
 */
for ( rp = recp ; *rp != NUL ; rp = endp )
	{                           /* field code is first char on line */
	code = *rp++;
	rp += strspn(rp, szWhitespace_m);	/* skip over white space */
	endp = rp + strlen(rp) + 1;         /* get pointer to next field */
	if ((pStamp_io->iDebugLevel == 5) && (pStamp_io->pLogFP != NULL))
		fprintf(pStamp_io->pLogFP, "\ncode = %c\n", code);
	switch (code)
		{
		case 'A':               /* Category (\ca) */
			pStamp_io->pCategories = addAmpleCategory(rp,
							  pStamp_io->pCategories,
							  pStamp_io->pLogFP);
			break;

		case 'B':               /* Category Class (\ccl) */
		/* create the category class */
			pStamp_io->pCategClasses = addAmpleCategClass(rp,
							  pStamp_io->pCategories,
							  pStamp_io->pCategClasses,
							  pStamp_io->pLogFP);
			break;

		case 'C':               /* Morpheme Class (\mcl) */
		/* create the morpheme class */
			pStamp_io->pMorphClasses = addAmpleMorphClass(rp,
							  pStamp_io->pMorphClasses,
							  pStamp_io->pLogFP);
			break;

		case 'D':               /* String Class (\scl) */
				/* create the string class */
			pStamp_io->pStringClasses = addStringClass(rp,
							pStamp_io->pStringClasses);
			break;

		case 'E':               /* Allomorph Property (\ap) */
			addAmpleProperty(rp, AMPLE_ALLO_PROP,
				 &pStamp_io->sProperties,
				 pStamp_io->pLogFP);
			break;

#ifdef TONEPARS
	case 'e':	/* \dsc - morpheme decomposition separation char */
		if (*rp == NUL)
		{
		  if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
				"Warning: Empty decomposition separator field - using '%c'\n",
				 pStamp_io->sTextCtl.cDecomp );
		}
		if (iSeenDsc++)
		{
		  if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
				"Warning: Decomposition separator already seen - ignoring this one: '%c'\n",
				 *rp );
		}
		else if (*rp != NUL)
		pStamp_io->sTextCtl.cDecomp = *rp; /* must have one defined! */
		break;
#endif /* TONEPARS */

		case 'F':               /* Morpheme Property (\mp) */
			addAmpleProperty(rp, AMPLE_MORPH_PROP,
				 &pStamp_io->sProperties,
				 pStamp_io->pLogFP);
			break;

		case 'G':               /* ambiguity marker (\ambig) */
			set_ambig(rp, pStamp_io);
			break;

		case 'H':               /* root delimiters (\rd) */
			set_rootdelim(rp, pStamp_io);
			break;

		case 'V':       /* \strcheck string validation list 1.5b BJY */
		if (pStamp_io->pszValidCharacters != NULL)
		freeMemory(pStamp_io->pszValidCharacters);
			pStamp_io->pszValidCharacters = setAmpleValidCharacters( rp );
			break;

		case 'M':       /* maximum number of properties (\maxprops) */
		if (pStamp_io->sProperties.uiPropertyCount != 0)
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP, "\n\
DECLARATIONS FILE: Must define maximum number before defining any properties\n");
		}
		uiTemp = strtoul(rp, NULL, 10);
		if (uiTemp >= 0x10000L)
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
		  "\nDECLARATIONS FILE: Cannot have more than 65535 properties\n");
		}
		else if (uiTemp < pStamp_io->sProperties.uiMaxProperty)
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
	 "\nDECLARATIONS FILE: Cannot decrease the number of properties from %u\n",
				pStamp_io->sProperties.uiMaxProperty);
		}
		else
		pStamp_io->sProperties.uiMaxProperty = (unsigned short)uiTemp;
			break;

		case 'W':               /* Punctuation Class (\pcl)  2.1b1 hab */
				/* create the punctuation class */
			pStamp_io->pPunctClasses = addPunctClass(rp,
							 pStamp_io->pPunctClasses);
			break;

		} /* end switch */

	} /* end for */
return 0;
}

/*************************************************************************
 * NAME
 *    loadStampTransferFile
 * DESCRIPTION
 *    Load the transfer control file, storing the information contained
 *    therein.
 * RETURN VALUE
 *    none
 */
int loadStampTransferFile(pszFilename_in, pStamp_io)
const char *	pszFilename_in;
StampData *	pStamp_io;
{
char *	recp;		/* overall record pointer */
char *	rp;		/* Current string in record */
char *	endp;		/* End of current string in record */
int	code;		/* Field code for current string in record */
int	i;		/* Temp loop var */
FILE *	infp;
unsigned long	uiTemp;

infp = fopen(pszFilename_in, "r");
if (infp == NULL)
	return 1;
/*
 *  read the entire transfer control file into a single record
 */
recp = readStdFormatRecord(infp, &asControlFields_m, pStamp_io->cComment,
			   NULL);
if (recp == (char *)NULL)
	return 0;			/* nothing in the file?  oh, well... */

pStamp_io->iCopyRulesTotalCount = 0;               /* Init total copy rules */
/*
 *  fill in global transfer data according to codes in record
 */
for ( rp = recp ; *rp != NUL ; rp = endp )
	{                           /* field code is first char on line */
	code = *rp++;
	rp += strspn(rp, szWhitespace_m);	/* skip over white space */
	endp = rp + strlen(rp) + 1;         /* get pointer to next field */
	switch (code)
		{
		case 'A':               /* Category (\ca) */
			pStamp_io->pCategories = addAmpleCategory(rp,
							  pStamp_io->pCategories,
							  pStamp_io->pLogFP);
			break;

		case 'B':               /* Category Class (\ccl) */
		/* create the category class */
			pStamp_io->pCategClasses = addAmpleCategClass(rp,
							  pStamp_io->pCategories,
							  pStamp_io->pCategClasses,
							  pStamp_io->pLogFP);
			break;

		case 'C':               /* Morpheme Class (\mcl) */
		/* create the morpheme class */
			pStamp_io->pMorphClasses = addAmpleMorphClass(rp,
							  pStamp_io->pMorphClasses,
							  pStamp_io->pLogFP);
			break;

		case 'D':               /* String Class (\scl) */
		/* create the string class */
			pStamp_io->pStringClasses = addStringClass(rp,
							pStamp_io->pStringClasses);
			break;

		case 'E':               /* Allomorph Property (\ap) */
		addAmpleProperty(rp, AMPLE_ALLO_PROP,
				 &pStamp_io->sProperties,
				 pStamp_io->pLogFP);
			break;

		case 'F':               /* Morpheme Property (\mp) */
		addAmpleProperty(rp, AMPLE_MORPH_PROP,
				 &pStamp_io->sProperties,
				 pStamp_io->pLogFP);
			break;

		case 'G':               /* ambiguity marker (\ambig) */
			set_ambig(rp, pStamp_io);
			break;

		case 'H':               /* root delimiters (\rd) */
			set_rootdelim(rp, pStamp_io);
			break;

		case 'I':               /* Insertion Rule (\ir) */
			addStampInsertionRule( rp, pStamp_io );
			break;

		case 'J':               /* Flag Rule (\flg) */
			addStampFlagRule( rp, pStamp_io );
			break;

		case 'K':               /* Copy Rule (\cr) */
			pStamp_io->eRuleType = COPYRULE;
			addStampSubstitutionRule(rp, pStamp_io);
			pStamp_io->iCopyRulesTotalCount++;     /* Count number of crules */
			break;

		case 'L':               /* Lexical Change (\lc) */
		/*
		 *  parse the lexical change and, if successful, add it to the list
		 *  for transfer lexical changes
		 */
		pStamp_io->pTransferLexChg = storeStampLexChange(
							pStamp_io->pTransferLexChg,
							rp,
							pStamp_io);
			break;

		case 'M':       /* maximum number of properties (\maxprops) */
		if (pStamp_io->sProperties.uiPropertyCount != 0)
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP, "\n\
TRANSFER FILE: Must define maximum number before defining any properties\n");
		}
		uiTemp = strtoul(rp, NULL, 10);
		if (uiTemp >= 0x10000L)
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
		  "\nTRANSFER FILE: Cannot have more than 65535 properties\n");
		}
		else if (uiTemp < pStamp_io->sProperties.uiMaxProperty)
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
	 "\nTRANSFER FILE: Cannot decrease the number of properties from %u\n",
				pStamp_io->sProperties.uiMaxProperty);
		}
		else
		pStamp_io->sProperties.uiMaxProperty = (unsigned short)uiTemp;
			break;

		case 'S':               /* Substitution Rule (\sr) */
			pStamp_io->eRuleType = SUBRULE;
			addStampSubstitutionRule(rp, pStamp_io);
			break;

		case 'V':       /* \strcheck string validation list 1.5b BJY */
		if (pStamp_io->pszValidCharacters != NULL)
		freeMemory(pStamp_io->pszValidCharacters);
			pStamp_io->pszValidCharacters = setAmpleValidCharacters( rp );
			break;

		case 'W':               /* Punctuation Class (\pcl)  2.1b1 hab */
				/* create the punctuation class */
			pStamp_io->pPunctClasses = addPunctClass(rp,
							 pStamp_io->pPunctClasses);
			break;

		} /* end switch */

	} /* end for */

if ( pStamp_io->iCopyRulesTotalCount > 0 )
	{		/* If there were copy rules */
		/* Allocate an array to keep track of crule execution */
	pStamp_io->pabCopyRulesDone = (int *)allocMemory(
				pStamp_io->iCopyRulesTotalCount * sizeof(int));
	for ( i = 0 ; i < pStamp_io->iCopyRulesTotalCount ; i++ )
		pStamp_io->pabCopyRulesDone[i] = 0;
	}
return 0;
}

/*************************************************************************
 * NAME
 *    loadStampSynthesisFile
 * DESCRIPTION
 *    Load the synthesis control file, and fill in global information from
 *    the various fields.
 * RETURN VALUE
 *    none
 */
int loadStampSynthesisFile(pszFilename_in, pStamp_io)
const char *	pszFilename_in;
StampData *	pStamp_io;
{
char *	recp;		/* overall record pointer */
char *	rp;		/* Current string in record */
char *	endp;		/* End of current string in record */
int	code;		/* Field code for current string in record */
FILE *	infp;
unsigned long	uiTemp;

infp = fopen(pszFilename_in, "r");
if (infp == NULL)
	return 1;
/*
 *  read the entire synthesis control file into a single record
 */
recp = readStdFormatRecord(infp, &asControlFields_m, pStamp_io->cComment,
			   NULL);
if (recp == (char *)NULL)
	return 0;			/* nothing in the file?  oh, well... */
/*
 *  fill in global synthesis data according to codes in record
 */
for ( rp = recp ; *rp != NUL ; rp = endp )
	{                           /* field code is first char on line */
	code = *rp++;
	rp += strspn(rp, szWhitespace_m);	/* skip over white space */
	endp = rp + strlen(rp) + 1;         /* get pointer to next field */
	switch (code)
		{
		case 'A':               /* Category (\ca) */
			pStamp_io->pCategories = addAmpleCategory(rp,
							  pStamp_io->pCategories,
							  pStamp_io->pLogFP);
			break;

		case 'B':               /* Category Class (\ccl) */
		/* create the category class */
			pStamp_io->pCategClasses = addAmpleCategClass(rp,
							  pStamp_io->pCategories,
							  pStamp_io->pCategClasses,
							  pStamp_io->pLogFP);
			break;

		case 'C':               /* Morpheme Class (\mcl) */
		/* create the morpheme class */
			pStamp_io->pMorphClasses = addAmpleMorphClass(rp,
							  pStamp_io->pMorphClasses,
							  pStamp_io->pLogFP);
			break;

		case 'D':               /* String Class (\scl) */
		/* create the string class */
			pStamp_io->pStringClasses = addStringClass(rp,
							pStamp_io->pStringClasses);
			break;

		case 'E':               /* Allomorph Property (\ap) */
		addAmpleProperty(rp, AMPLE_ALLO_PROP,
				 &pStamp_io->sProperties,
				 pStamp_io->pLogFP);
			break;

		case 'F':               /* Morpheme Property (\mp) */
		addAmpleProperty(rp, AMPLE_MORPH_PROP,
				 &pStamp_io->sProperties,
				 pStamp_io->pLogFP);
			break;

		case 'G':               /* ambiguity marker (\ambig) */
			set_ambig(rp, pStamp_io);
			break;

		case 'H':               /* root delimiters (\rd) */
			set_rootdelim(rp, pStamp_io);
			break;

		case 'N':               /* regular sound change markers (\rscid) */
			setStampRegSoundChangeMarkers(rp, pStamp_io);
			break;

		case 'L':               /* Lexical Change (\lc) */
		/*
		 *  parse the lexical change and, if successful, add it to the list
		 *  for synthesis lexical changes
		 */
		pStamp_io->pSynthesisLexChg = storeStampLexChange(
						   pStamp_io->pSynthesisLexChg,
						   rp,
						   pStamp_io);
			break;

		case 'M':       /* maximum number of properties (\maxprops) */
		if (pStamp_io->sProperties.uiPropertyCount != 0)
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP, "\n\
SYNTHESIS FILE: Must define maximum number before defining any properties\n");
		}
		uiTemp = strtoul(rp, NULL, 10);
		if (uiTemp >= 0x10000L)
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
		 "\nSYNTHESIS FILE: Cannot have more than 65535 properties\n");
		}
		else if (uiTemp < pStamp_io->sProperties.uiMaxProperty)
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
	"\nSYNTHESIS FILE: Cannot decrease the number of properties from %u\n",
				pStamp_io->sProperties.uiMaxProperty);
		}
		else
		pStamp_io->sProperties.uiMaxProperty = (unsigned short)uiTemp;
			break;

		case 'R':               /* Regular Sound Change (\rsc) */
			addStampRegSoundChange(rp, pStamp_io);
			break;

		case 'T':               /* Synthesis Test (\test) */
			addStampTest( rp, pStamp_io );
			break;

		case 'V':       /* \strcheck string validation list 1.5b BJY */
		if (pStamp_io->pszValidCharacters != NULL)
		freeMemory(pStamp_io->pszValidCharacters);
			pStamp_io->pszValidCharacters = setAmpleValidCharacters( rp );
			break;

		case 'W':               /* Punctuation Class (\pcl)  2.1b1 hab */
				/* create the punctuation class */
			pStamp_io->pPunctClasses = addPunctClass(rp,
							 pStamp_io->pPunctClasses);
			break;

		} /* end switch */

	} /* end for */

deleteStampCurrentYYBuffer(); /* free buffer allocated by yylex */
return 0;
}

#ifdef TONEPARS
/*************************************************************************
 * NAME
 *    loadToneControlFile
 * DESCRIPTION
 *    Load the TonePars/ToneGen control file, storing the information contained
 *    therein.
 * RETURN VALUE
 *    zero if successful, nonzero if an error occurs
 */
int loadToneControlFile(pszFilename_in, pStamp_io)
const char *	pszFilename_in;
StampData *	pStamp_io;
{
char *	recp;		/* overall record pointer */
char *	rp;		/* Current string in record */
char *	endp;		/* End of current string in record */
int	code;		/* Field code for current string in record */
FILE *	infp;
static char pszErrHead[] = "\nLOAD TONE CONTROL: ";
int iSeenSegments = 0;
char *pEnd;
Change *	last = NULL;
Change *	chp  = NULL;
/*
 *  read the entire transfer control file into a single record
 */
infp = fopen(pszFilename_in, "r");
if (infp == NULL)
	{
	return 1;
	}
recp = readStdFormatRecord(infp, &asToneControlFields_m, pStamp_io->cComment,
			   NULL);
if (pStamp_io->iDebugLevel && (pStamp_io->pLogFP != NULL))
	fprintf(pStamp_io->pLogFP, "\nRECORD IS:\n%s\n\n",
		recp ? recp : "?unreadable? (NULL)");
if (recp == (char *)NULL)
	{
	return 0;			/* nothing in the file?  oh, well... */
	}
/*
 *  fill in global tone data according to codes in record
 */
for ( rp = recp ; *rp != NUL ; rp = endp )
	{                           /* field code is first char on line */
	code = *rp++;
	rp += strspn(rp, szWhitespace_m);	/* skip over white space */
	endp = rp + strlen(rp) + 1;         /* get pointer to next field */
	if ((pStamp_io->iDebugLevel == 5) && (pStamp_io->pLogFP != NULL))
		fprintf(pStamp_io->pLogFP, "\ncode = %c\n", code);
	switch (code)
		{
#ifndef ToneGen
		case 'c':               /* Category (\ca) */
			pStamp_io->pCategories = addAmpleCategory(rp,
							  pStamp_io->pCategories,
							  pStamp_io->pLogFP);
			break;

		case 'I':               /* Category Class (\ccl) */
		/* create the category class */
			pStamp_io->pCategClasses = addAmpleCategClass(rp,
							  pStamp_io->pCategories,
							  pStamp_io->pCategClasses,
							  pStamp_io->pLogFP);
			break;

		case 'i':               /* Morpheme Class (\mcl) */
		/* create the morpheme class */
			pStamp_io->pMorphClasses = addAmpleMorphClass(rp,
							  pStamp_io->pMorphClasses,
							  pStamp_io->pLogFP);
			break;

		case 'j':               /* ambiguity marker (\ambig) */
			set_ambig(rp, pStamp_io);
			break;

		case 'l':               /* Allomorph Property (\ap) */
			addAmpleProperty(rp, AMPLE_ALLO_PROP,
				 &pStamp_io->sProperties,
				 pStamp_io->pLogFP);
			break;

		case 'p':               /* Morpheme Property (\mp) */
			addAmpleProperty(rp, AMPLE_MORPH_PROP,
				 &pStamp_io->sProperties,
				 pStamp_io->pLogFP);
			break;

		case 'S':               /* String Class (\scl) */
				/* create the string class */
			pStamp_io->pStringClasses = addStringClass(rp,
							pStamp_io->pStringClasses);
			break;
#endif /* ToneGen */

	case '$':               /* \sylstr -  syllable symbol string */
	  pEnd = isolateWord(rp);
	  pStamp_io->pszSylStr = duplicateString(strtok(rp, szWhitespace_m));
	  break;

	case 'a':		/* \sylalgor - syllabification algorithm */
	  pEnd = isolateWord(rp);
	  pStamp_io->iSylAlgorithm = atoi(rp);
				/* force default if value is bad */
	  if (pStamp_io->iSylAlgorithm <= 0 )
		pStamp_io->iSylAlgorithm = SA_DEFAULT;
	  break;

	case 'B':		/* \tone_rule - tone rule */
	  parseToneRule(rp, TONE_RULE, pStamp_io);
	  break;

	case 'b':               /* \DoNoMorphemeCrossing - do not assign */
				/*  lexical tones past the tbus of */
				/*   a morpheme */
	  pEnd = isolateWord(rp);
	  pStamp_io->bDoMorphemeCrossing = FALSE;
	  break;

	case 'C':		/* \nocodas - no codas in syllabification */
	  pEnd = isolateWord(rp);
	  pStamp_io->iSylFlags &= (!DO_CODAS);
	  break;

	case 'D':		/* \dch - decomposition field change */
	  chp = parseChangeString(rp, pStamp_io->pStringClasses);
	  if (chp)
		{
		  if (last)
		last->pNext = chp;
		  else
		pStamp_io->pTPOrthoChanges = chp;
		  last = chp;
		}
	  break;

	case 'd':		/* \default - set tone rule default */
	  parseToneRule(rp, DEFAULT_RULE, pStamp_io);
	  break;

	case 'E':		/* \edge_cond - edge condition */
	  parseToneRule(rp, EDGE_CONDITION, pStamp_io);
	  break;

	case 'e':		/* \edge_rule - edge rule */
	  parseToneRule(rp, EDGE_RULE, pStamp_io);
	  break;

	case 'G':               /* \ec -  edge condition definition */
	  pEnd = isolateWord(rp);
	  set_edge_cond( duplicateString(strtok(rp, szWhitespace_m)),
			 pStamp_io->pLogFP);
	  break;

	case 'g':		/* \right_edge_rule - right edge rule */
	  parseToneRule(rp, RIGHT_EDGE_RULE, pStamp_io);
	  pStamp_io->iTryRightEdgeRules++;
	  break;

	case 'H':               /* \sylsep -  syllable separation character */
	  pEnd = isolateWord(rp);
	  pStamp_io->pszSylSepChar = duplicateString(strtok(rp,
								szWhitespace_m));
	  break;

	case 'h':               /* \phrasefinalchars -  phrase final */
				/* punctuation characters */
	  pEnd = isolateWord(rp);
	  pStamp_io->pszPhraseFinalChars = duplicateString(strtok(rp,
								  szWhitespace_m));
	  break;

	case 'M':               /* \monomoriac -  syllables are mono-moraic */
	  pEnd = isolateWord(rp);
	  pStamp_io->iSylFlags |= MONO_MORAIC;
	  break;

	case 'm':               /* \morastr -  mora symbol string */
	  pEnd = isolateWord(rp);
	  pStamp_io->pszMoraStr = duplicateString(strtok(rp, szWhitespace_m));
	  break;

	case 'R':		/* \segments - TONEPARS segment file */
	  pEnd = isolateWord(rp);
	  if (iSeenSegments)
		{
		  if (pStamp_io->pLogFP)
		fprintf(pStamp_io->pLogFP,
		   "%sSegment file already set - ignoring this \\segments field",
			   pszErrHead );
		}
	  else if (*rp == NUL)
		{
		  if (pStamp_io->pLogFP)
		fprintf(pStamp_io->pLogFP,
			  "%sEmpty segments file (\\segments) field", pszErrHead );
		}
	  else
		{
		  rp = strtok(rp, szWhitespace_m);
		  if (rp != (char *)NULL)
		{
		  pStamp_io->pszSegFileName = duplicateString(rp);
		  ++iSeenSegments;
		}
		}
	  break;

	case 'T':               /* \tonetype -  tone type definition */
	  set_tone_type( rp, pStamp_io->pLogFP );
	  break;

	case 't':               /* \tonevalue -  tone value definition */
	  pEnd = isolateWord(rp);	/* for the primary tier */
	  set_tone_value( duplicateString(strtok(rp, szWhitespace_m)), PRIMARY,
			  FALSE, pStamp_io->pLogFP);
	  break;

	case 'U':               /* \domain -  domain definition */
	  pEnd = isolateWord(rp);
	  set_tone_domain( duplicateString(strtok(rp, szWhitespace_m)),
						  pStamp_io->pLogFP);
	  break;

	case 'u':		/* \tbutype - tone bearing unit type */
	  pEnd = isolateWord(rp);
	  rp = zapnl(rp);
	  if (streq(strlwr(rp),"mora"))
		pStamp_io->iTbuType = MORA_TBU;
	  else if (streq(strlwr(rp),"syllable"))
		pStamp_io->iTbuType = SYLLABLE_TBU;
	  else if (streq(strlwr(rp),"vowel"))
		pStamp_io->iTbuType = VOWEL_TBU;
	  else if (pStamp_io->pLogFP)
		fprintf(pStamp_io->pLogFP,
			"%sUnrecognized tbu type parameter (%s); will use mora.",
			pszErrHead, rp );
	  break;

	case 'V':		/* \vc.cv - disambiguate to vc.cv */
	  pEnd = isolateWord(rp);
	  pStamp_io->iSylFlags |= DO_VC_CV;
	  break;

	case 'v':		/* \v.ccv - disambiguate to v.ccv */
	  pEnd = isolateWord(rp);
	  pStamp_io->iSylFlags &= (!DO_VC_CV);
	  break;

	case 'W':               /* \wtbypos -  do weight by position */
	  pEnd = isolateWord(rp);
	  pStamp_io->iSylFlags |= DO_WT_BY_POS;
	  break;

	case 'x':               /* \tone_reg_value -  tone value definition */
	  pEnd = isolateWord(rp);	/* for the register tier */
	  set_tone_value( duplicateString(strtok(rp, szWhitespace_m)),
			  REGISTER, FALSE, pStamp_io->pLogFP);
	  break;

	case 'Y':               /* \begcycle -  begin cyclic rules */
	  pEnd = isolateWord(rp);
	  set_tone_cycle( TRUE );
	  break;

	case 'y':               /* \endcycle -  end cyclic rules */
	  pEnd = isolateWord(rp);
	  set_tone_cycle( FALSE );
	  break;

	case 'Z':               /* \endtonedefs -  end cyclic rules */
	  pEnd = isolateWord(rp);
				/* build all combinations of */
				/* primary/register tones in the tone value */
				/* list */
	  build_primary_register_tone_combos(pStamp_io->pLogFP);
	  break;

		} /* end switch */

	} /* end for */
return 0;

}
#endif /* TONEPARS */

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
size_t	uiOldSize;
size_t	uiNewSize;

if (pTable_io == NULL)
	return;
if (pTable_io->pszFirstCode == NULL)
	{
	pTable_io->pszFirstCode = duplicateString(pTable_io->pCodeTable);
	return;
	}
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

/*************************************************************************
 * NAME
 *    loadStampDictCodeTables
 * DESCRIPTION
 *    Load and process the dictionary codes table file.
 *
 *    field code table for dictionary code table file
 *
 *      External Internal       description
 *      -------- --------       -----------
 *	\ch       C		code change
 *	\prefix   P		prefix region marker
 *	\infix    I		infix region marker
 *	\root     R		root region marker
 *	\suffix   S		suffix region marker
 *	\unified  U		unified dictionary region marker
 * RETURN VALUE
 *    none
 */
int loadStampDictCodeTables(pszFilename_in, pStamp_io)
const char *	pszFilename_in;
StampData *	pStamp_io;
{
char *		recp;		/* overall record pointer */
char *		rp;		/* Current entry in record */
char *		endp;		/* End of current entry in record */
char *		p;
char *		firstmark;
int		code;		/* Field code for current entry */
char *		pszMatch;
char *		pszReplace;
int		cQuote;
size_t	uiTableLength = 0;
size_t	uiOldLength;
CodeTable **	ppTable = NULL;
FILE *		infp;
static const char	szErrorHead_s[] = "\nDICTIONARY CODE TABLE: ";

pStamp_io->pDictTable   = NULL;
pStamp_io->pPrefixTable = NULL;
pStamp_io->pInfixTable  = NULL;
pStamp_io->pRootTable   = NULL;
pStamp_io->pSuffixTable = NULL;

infp = fopen(pszFilename_in, "r");
if (infp == NULL)
	return 1;
/*
 *  read the dictionary code table file into a single record
 */
recp = readStdFormatRecord(infp, &asDictCodeFields_m, pStamp_io->cComment,
			   NULL);
if (recp == NULL)
	return 0;			/* nothing in the file?  oh, well... */
/*
 *  fill in the dictionary code tables
 */
for ( rp = recp ; *rp != NUL ; rp = endp )
	{                           /* field code is first char on line */
	code = *rp++;
	rp += strspn(rp, szWhitespace_m);	/* skip over white space */
	endp = rp + strlen(rp) + 1;         /* get pointer to next field */
	switch (code)
		{
		case 'C':               /* dictionary code change (\ch) */
		if (ppTable == NULL)
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
				"%sWarning: field out of place: \\ch %s\n",
				szErrorHead_s, rp);
		break;
		}
		/*
		 *  isolate the pieces of the change
		 */
		cQuote     = *rp++;
		pszMatch   = rp;
		pszReplace = NULL;
		p = strchr(pszMatch, cQuote);
		if (p != NULL)
		{
		*p++ = NUL;
		p    = strchr(p, cQuote);
		if (p != NULL)
			{
			pszReplace = p + 1;
			p          = strchr(pszReplace, cQuote);
			if (p != NULL)
			*p = NUL;
			}
		}
		if (    (pszMatch   == NULL) || (*pszMatch   == NUL) ||
			(pszReplace == NULL) || (*pszReplace == NUL) )
		{
		if (pStamp_io->pLogFP != NULL)
			fprintf(pStamp_io->pLogFP,
				"%sInvalid \\ch field", szErrorHead_s);
		break;
		}
		/*
		 *  add this change to the end of the table of changes
		 */
		uiOldLength    = uiTableLength;
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

		case 'P':               /* Prefix region marker (\prefix) */
		ppTable = &(pStamp_io->pPrefixTable);
		goto common;

		case 'I':               /* Infix region marker (\infix) */
		ppTable = &(pStamp_io->pInfixTable);
		goto common;

		case 'R':               /* Root region marker (\root) */
		ppTable = &(pStamp_io->pRootTable);
		goto common;

		case 'S':               /* Suffix region marker (\suffix) */
		ppTable = &(pStamp_io->pSuffixTable);
		goto common;

	case 'U':		/* unified dictionary codes */
		ppTable = &(pStamp_io->pDictTable);
common:
		*ppTable = (CodeTable *)allocMemory(sizeof(CodeTable));
		(*ppTable)->pCodeTable = NULL;
		uiTableLength = 0;
		(*ppTable)->uiCodeCount  = 0;
		firstmark = rp;
		if (*firstmark == pStamp_io->sTextCtl.cFormatMark)
		{
		isolateWord(firstmark);
		(*ppTable)->pszFirstCode = duplicateString(firstmark);
		}
		else
		(*ppTable)->pszFirstCode = NULL;
		break;

	default:
		break;
		} /* end switch */

	} /* end for */
if (pStamp_io->iDebugLevel && (pStamp_io->pLogFP != NULL))
	{
	show_codetab(pStamp_io->pDictTable,  "Unified", pStamp_io->pLogFP);
	show_codetab(pStamp_io->pPrefixTable,"Prefix",  pStamp_io->pLogFP);
	show_codetab(pStamp_io->pInfixTable, "Infix",   pStamp_io->pLogFP);
	show_codetab(pStamp_io->pRootTable,  "Root",    pStamp_io->pLogFP);
	show_codetab(pStamp_io->pSuffixTable,"Suffix",  pStamp_io->pLogFP);
	}
fix_first_code(pStamp_io->pDictTable);
fix_first_code(pStamp_io->pPrefixTable);
fix_first_code(pStamp_io->pInfixTable);
fix_first_code(pStamp_io->pSuffixTable);
fix_first_code(pStamp_io->pRootTable);

return 0;
}

/***************************************************************************
 * NAME
 *    reportStampDictCodeTable
 * DESCRIPTION
 *    Show the size of the designated code table.
 * RETURN VALUE
 *    none
 */
void reportStampDictCodeTable(eType_in, pStamp_in)
int		eType_in;
StampData *	pStamp_in;
{
static const char	szReportMessage_s[] =
			   "\t%d change%s loaded from %s dictionary code table.\n";
CodeTable *	pTable;
char *		pszType;

if ((eType_in != 0) && (pStamp_in != NULL))
	{
	switch (eType_in)
	{
	case PFX:
		pTable  = pStamp_in->pPrefixTable;
		pszType = "prefix";
		break;
	case IFX:
		pTable  = pStamp_in->pInfixTable;
		pszType = "infix";
		break;
	case SFX:
		pTable  = pStamp_in->pSuffixTable;
		pszType = "suffix";
		break;
	case ROOT:
		pTable  = pStamp_in->pRootTable;
		pszType = "root";
		break;
	default:
		pTable  = pStamp_in->pDictTable;
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
 *    loadStampDictOrthoChanges
 * DESCRIPTION
 *    Load the dictionary orthography change file, storing the information
 *    contained therein.
 * RETURN VALUE
 *    none
 */
int loadStampDictOrthoChanges(pszFilename_in, pStamp_io)
const char *	pszFilename_in;
StampData *	pStamp_io;
{
char *		recp;		/* overall record pointer */
char *		rp;		/* Current string in record */
char *		endp;		/* End of current string in record */
int		code;		/* Field code for current string in record */
Change *	last;
Change *	chp;
FILE *		infp;

infp = fopen(pszFilename_in, "r");
if (infp == NULL)
	return 1;
/*
 *  read the entire synthesis control file into a single record
 */
recp = readStdFormatRecord(infp, &asDictOrthoFields_m, pStamp_io->cComment,
			   NULL);
if (recp == (char *)NULL)
	return 0;			/* nothing in the file?  oh, well... */
/*
 *  process the dictionary orthography changes
 */
last = (Change *)NULL;
for ( rp = recp ; *rp != NUL ; rp = endp )
	{                           /* field code is first char on line */
	code = *rp++;
	rp += strspn(rp, szWhitespace_m);	/* skip over white space */
	endp = rp + strlen(rp) + 1;         /* get pointer to next field */
	switch (code)
		{
		case 'C':                       /* change (\ch) */
		chp = parseChangeString(rp, pStamp_io->pStringClasses);
			if (chp)
				{
				if (last)
					last->pNext = chp;
				else
					pStamp_io->pDictOrthoChanges = chp;
				last = chp;
				}
			break;

		case 'S':                       /* string class definition (\scl) */
					/* create the string class */
			pStamp_io->pStringClasses = addStringClass(rp,
							 pStamp_io->pStringClasses);
			break;

		} /* end switch */

	} /* end for */
return 0;
}

/*************************************************************************
 * NAME
 *    set_ambig
 * ARGUMENTS
 *    str - pointer to string
 * DESCRIPTION
 *    Use the first non-whitespace character in the string as the
 *    ambiguity marker assumed in input analysis files.  Also used
 *    in analysis files output during transfer only.
 * RETURN VALUE
 *    none
 */
static void set_ambig(str, pStamp_io)
char *		str;
StampData *	pStamp_io;
{
str += strspn(str, szWhitespace_m);
if (*str)
	pStamp_io->sTextCtl.cAnaAmbig = *str;
else if (pStamp_io->pLogFP != NULL)
	fprintf(pStamp_io->pLogFP,
		"Invalid \ambig field - must define an ambiguity marker!\n");
}

/*************************************************************************
 * NAME
 *    set_rootdelim
 * ARGUMENTS
 *    str - pointer to a string
 * DESCRIPTION
 *    Use the first two non-whitespace characters in the string for the
 *    delimiters in the input analysis strings.
 * RETURN VALUE
 *    none
 */
static void set_rootdelim(str, pStamp_io)
char *		str;
StampData *	pStamp_io;
{
int begin, end;

str += strspn(str, szWhitespace_m);
if (*str)
	{
	begin = *str++;
	str += strspn(str, szWhitespace_m);
	if (*str)
		{
		end = *str;
		if (begin != end)
			{
			pStamp_io->cBeginRoot = begin;
			pStamp_io->cEndRoot   = end;
			return;
			}
		else
			{
		if (pStamp_io->pLogFP != NULL)
		fprintf(pStamp_io->pLogFP,
			"The root delimiters must be different!\n");
			return;
			}
		}
	}
if (pStamp_io->pLogFP != NULL)
	fprintf(pStamp_io->pLogFP, "Invalid root delimiter field\n");
}

/***************************************************************************
 * NAME
 *    show_codetab
 * ARGUMENTS
 *    ctp  - pointer to code_table to display
 *    type - pointer to dictionary type string
 * DESCRIPTION
 *    Display the indicated dictionary code table.
 * RETURN VALUE
 *    none
 */
static void show_codetab( ctp, type, pOutputFP_in )
CodeTable *	ctp;
char *		type;
FILE *		pOutputFP_in;
{
char *	p;
int	k;

if (pOutputFP_in == NULL)
	return;
if (ctp == NULL)
	fprintf(pOutputFP_in, "Empty %s dictionary code table.\n", type);
else
	{
	if (ctp->pszFirstCode)
		fprintf(pOutputFP_in, "\n%s dictionary code table (first = %s)",
		type, ctp->pszFirstCode);
	else
		fprintf(pOutputFP_in, "\n%s dictionary code table", type);
	for ( p = ctp->pCodeTable, k = ctp->uiCodeCount ; k ; --k )
		{
		fprintf(pOutputFP_in, "\n        \"%s\"  >  \"", p);
		p += strlen(p) + 1;
		fprintf(pOutputFP_in, "%s\"", p );
		p += strlen(p) + 1;
		}
	}
}

/*****************************************************************************
 * NAME
 *    resetStampData
 * DESCRIPTION
 *    Free all the memory allocated for the StampData data structure.
 * RETURN VALUE
 *    none
 */
void resetStampData(StampData * pStamp_io)
{
AmpleAlloEnv * pEnv;
AmpleAlloEnv * pNextEnv;
StampTestList * pTest;
StampTestList * pNextTest;
StampAction * pAct;
StampAction * pNextAct;

freeMemory(pStamp_io->pabCopyRulesDone);
pStamp_io->pabCopyRulesDone = NULL;
pStamp_io->iCopyRulesTotalCount = 0;
freeChangeList(pStamp_io->pDictOrthoChanges);
pStamp_io->pDictOrthoChanges = NULL;
freeStringList( pStamp_io->pStringList );
pStamp_io->pStringList = NULL;
freeStringClasses(pStamp_io->pStringClasses);
pStamp_io->pStringClasses = NULL;
if (pStamp_io->pPunctClasses != NULL)
	{
	freePunctClasses(pStamp_io->pPunctClasses);
	pStamp_io->pPunctClasses = NULL;
	}
if (pStamp_io->pDictTable)
	{
	freeCodeTable(pStamp_io->pDictTable);
	pStamp_io->pDictTable = NULL;
	}
if (pStamp_io->pPrefixTable)
	{
	freeCodeTable(pStamp_io->pPrefixTable);
	pStamp_io->pPrefixTable = NULL;
	}
if (pStamp_io->pInfixTable)
	{
	freeCodeTable(pStamp_io->pInfixTable);
	pStamp_io->pInfixTable = NULL;
	}
if (pStamp_io->pRootTable)
	{
	freeCodeTable(pStamp_io->pRootTable);
	pStamp_io->pRootTable = NULL;
	}
if (pStamp_io->pSuffixTable)
	{
	freeCodeTable(pStamp_io->pSuffixTable);
	pStamp_io->pSuffixTable = NULL;
	}
resetTextControl( &(pStamp_io->sTextCtl) );
freeStampDictionary(pStamp_io);
if (pStamp_io->pCategories)
	{
	freeStringList(pStamp_io->pCategories);
	pStamp_io->pCategories = NULL;
	}
/*unlinkStringList( &pStamp_io->pCategorySetsList );*/
freeStringList(pStamp_io->pCategorySetsList);
pStamp_io->pCategorySetsList = NULL;
freeAmpleCategClasses(pStamp_io->pCategClasses);
pStamp_io->pCategClasses = NULL;
freeAmpleMorphClasses(pStamp_io->pMorphClasses);
pStamp_io->pMorphClasses = NULL;
freeAmpleProperties(&pStamp_io->sProperties, pStamp_io->pPropertyList);
		/*    AmpleProperties		pStamp_io->sProperties;*/
		/*unlinkStringList( &pStamp_io->pPropertyList );*/
pStamp_io->pPropertyList = NULL;
freeStampLexChanges(pStamp_io->pTransferLexChg);
pStamp_io->pTransferLexChg = NULL;
freeStampTransferRules(pStamp_io);
freeStampLexChanges(pStamp_io->pSynthesisLexChg);
pStamp_io->pSynthesisLexChg = NULL;
for ( pTest = pStamp_io->pSynthesisTests ; pTest ; pTest = pNextTest )
	{
	pNextTest = pTest->pNext;
	freeAmpleTestTree(pTest->pTest);
	for ( pAct = pTest->pAction ; pAct ; pAct = pNextAct )
	{
	pNextAct = pAct->pNext;
	freeMemory( pAct->pszString );
	freeMemory( pAct );
	}
	freeMemory(pTest);
	}
pStamp_io->pSynthesisTests = NULL;
if (pStamp_io->pszValidCharacters != NULL)
	{
	freeMemory(pStamp_io->pszValidCharacters);
	pStamp_io->pszValidCharacters = NULL;
	}
for ( pEnv = pStamp_io->pAlloEnvList ; pEnv ; pEnv = pNextEnv )
	{
	pNextEnv = pEnv->pLink;
	freeAmpleAlloEnvConstraint(pEnv);
	}
pStamp_io->pAlloEnvList = NULL;
freeStampRegSoundChanges(pStamp_io);
#ifdef TONEPARS
freeChangeList(pStamp_io->pTPOrthoChanges);
pStamp_io->pTPOrthoChanges = NULL;
/*    char *                      pStamp_io->pszSylStr;*/
/*    char *                      pStamp_io->pszSylSepChar;*/
/*    char *                      pStamp_io->pszMoraStr;*/
/*    char *                      pStamp_io->pszPhraseFinalChars;*/
/*    char *                      pStamp_io->pszSegFileName;*/
/*    struct segment_list *       pStamp_io->pSegments;*/
/*    struct stamp_analysis * pStamp_io->pInitialMorpheme;*/
/*    struct stamp_analysis * pStamp_io->pFinalMorpheme;*/
#endif /* TONEPARS */
}
