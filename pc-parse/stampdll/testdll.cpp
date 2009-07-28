// toy program for testing the STAMP DLL (stampdll.c)
// Copyright 2009 by The Summer Institue of Linguistics all rights reserved.
// Roy Eberhardt June 2009
// Built from Steve McConnel's ampledll.c
// and stamp.c.
// This mimics stamp.c on the command line
// but uses the stampdll.dll
// For actual processing.

#define WINVER 0x0502

#include <stdio.h>
#include <stdlib.h>
//#include <windows.h>
#include <afxwin.h>
#include <assert.h>
#include "stampdll.h"

#ifdef _DEBUG
extern "C" {
extern void setAllocMemoryTracing(const char * pszFilename_in);
};
#endif
/*
 *  Name of declaration file name file
 */
static char *		pszCommandFile_m = NULL;
/*
 *  Input file name
 */
static char *		pszInputFile_m = NULL;
/*
 *  Output file name
 */
static char *		pszOutputFile_m = NULL;
/*
 *  Flag that we are checking memory allocation.
 */
// static int	bCheckAlloc_m = FALSE;
/*
 *  do we monitor progress of parsing?
 */
short			bMonitorProgress_m = FALSE;

short			bPrefixTable = FALSE;
short			bInfixTable  = FALSE;
short			bSuffixTable = FALSE;
short			bRootTable   = FALSE;
short			bUnifiedTable = FALSE;
short			bMatchCategories = TRUE;
int				iDebugLevel = 0;
short			bDoAllSyntheses = FALSE;
char			cComment = '\0';
int				iMaxTrieLevel = 2; //default
short			bQuiet = FALSE;
short			bReportNoEntries = FALSE;
short			bTrace = FALSE;
short			bUnifiedDictionary_m = FALSE;
short			bVerify_m = FALSE;
short			bOnlyTransfer = FALSE;

void testTheDLL(void);
void loadControlFiles(
	StampSetup * pSetup_io,
	const char * apszControlFiles_in[],
	const char * pszLogFile_in);
void loadDictionaries(
	StampSetup * pSetup_io,
	const char * apszDictFiles_in[]);
void ProcessFile(
	StampSetup * pSetup_io,
	const char * pszInputFile_in,
	const char * pszOutputFile_in);
void removeSetup(
	StampSetup * pSetup_io);

static void tsproc();
static void tsinit();
static void parse_command(int argc, char **argv, char *pszTime_in);
FILE *openAFile(char *pszFilename_in);
VOID closeAFile(FILE *fp);
void setDictTable(const char *pszFileName);
void closeUp(void);
static void print_header(FILE *pOutFP_in, char *pszTime_in);

char pszLogFile_g[100];

STAMPFUNC0  pfStampCreateSetup_g      = 0;
STAMPFUNC1  pfStampDeleteSetup_g      = 0;
STAMPFUNC1  pfStampReset_g            = 0;
STAMPFUNC1  pfStampReportVersion_g    = 0;
STAMPFUNC7  pfStampLoadControlFiles_g = 0;
STAMPFUNC3  pfStampLoadDictionary_g   = 0;
STAMPFUNC3  pfStampProcessFile_g      = 0;
STAMPFUNC3  pfStampSetParameter_g     = 0;

HINSTANCE   hStampLib_g = 0;



#ifdef _DEBUG
#define DLL_FILE "C:/StampDLLProject/stampdll/Debug/stampdll.dll"
#else
#define DLL_FILE "stampdll.dll"
#endif

StampSetup *	pHgStamp_g = NULL;

/*
pnstamp.dec (zzSTAMP.DEC)	Declaration File
hgpntr.chg	(xxzzTR.CHG)	Transfer Control File
pnsynt.chg	(zzSYNT.CHG)	Synthesis Control File
pnsycd.tab	(xxSYCD.TAB)	dictionary code table
pnordc.tab	(xxORDC.TAB)	Dictionary orthography change

// Unsure about order of these dictionary files
pnsf01.dic	(xxsf01.dic)	Suffix dictionary file
pnsyrt.dic	(pnsyrt.dic)	Root dictionary file
next root dictionary ...

pnoutx.ctl	(xxoutx.ctl)	text Output Control File
First Input file: pntest.ana
Output file: pntest.syn

Next Input file (or RETURN if no more):
*/

// Stamp Control Files  ... order, dictionaries and xxoutxt.ctl

const char *apszStampControlFiles_g[6]  = {
	NULL,						/* Declarations File */
	NULL,						/* Transfer Control File */
	NULL,						/* Synthesis Control File */
	NULL,						/* Dictionary Code Table */
	NULL,						/* Dictionary orthography change */
	NULL};						/* outtx Out text changes */

// Target Dictionary Files

const char *apszStampDictionaryFiles_g[8] = {
	NULL,						/* prefix */
	NULL,						/* infix */
	NULL,						/* suffix */
	NULL,						/* root */
	NULL,						/* Bible names */
	NULL,						/* Next Root Dic */
	NULL,						/* Spanish Loans */
	NULL
};

const char * pszResult_g;

/*************************************************************************
 * NAME
 *    main
 * DESCRIPTION
 *    main program for morphological transfer and synthesis program
 * RETURN VALUE
 *    none
 */
int main(int argc, char ** argv)
/* number of command line arguments */
/* pointer to array of command line arguments */
{
time_t		clock;
char *		pszTime;

time( &clock );
pszTime = ctime(&clock);

parse_command(argc, argv, pszTime);

tsinit();
/*
 *  process the data
 */
tsproc();

//That should be all.
closeAmpleCmdFile();

void closeUp(void);	/* free malloc memory and release dll */

exitSafely(0);		/* exit with error level 0 (no errors) */

return 0;		/* (not reached) */
}
/***************************************************************************
 * NAME
 *    closeUp
 * DESCRIPTION
 *    free memory from malloc allocation and release DLL
 * RETURN VALUE
 *    none
 */
void closeUp(void)
{

removeSetup(pHgStamp_g); //test only

pHgStamp_g = 0;

FreeLibrary(hStampLib_g);

for (int i = 0; i < 6; ++i)
	if (apszStampControlFiles_g[i] != NULL)
		free ((void *)apszStampControlFiles_g[i]);

for (int i = 0; i < 8; ++i)
	if (apszStampDictionaryFiles_g[i] != NULL)
		free ((void *)apszStampDictionaryFiles_g[i]);

}

/***************************************************************************
 * NAME
 *    parse_command
 * DESCRIPTION
 *    Print a terse summary of the command options, then exit the program.
 * RETURN VALUE
 *    none
 */
static void parse_command(int argc, char **argv, char *pszTime_in)
//int	argc;		/* number of command line arguments */
//char **	argv;		/* pointer to array of command line arguments */
//char *	pszTime_in;
{
int	k;
int	bShowUsage = FALSE;
VOIDP	trap_address = NULL;
int	trap_count = 0;
char *p = NULL;

int result = 0; char *pdest = NULL;

/*
 *  parse command line for any options
 */
while ((k = getopt(argc, argv, "ac:d:f:i:mno:qrtuvx/z:Z:")) != EOF)
	{
	switch (k)
		{
		case 'a':                       /* generate all possible syntheses */
			bDoAllSyntheses = TRUE;		/* (we want them all!!) */
			break;

		case 'c':						/* record comment character */
			cComment = *optarg;			/* used by record.c */
			break;

		case 'd':                       /* maximum trie depth */
			iMaxTrieLevel = atoi(optarg);
			if (iMaxTrieLevel < 0)
				iMaxTrieLevel = 0;		/* force a minimum */
			break;

		case 'f':                       /* file of declaration file names */
			pszCommandFile_m = optarg;      /* pick up name */
			break;

		case 'i':		/* input file name */
			pszInputFile_m = optarg;		/* pick up name */
			break;

		case 'm':		/* monitor progress option */
			bMonitorProgress_m = TRUE;
			break;

		case 'n':		/* 1.5a BJY Don't check root categories */
			bMatchCategories = FALSE;
			break;

		case 'o':		/* output file name */
			pszOutputFile_m = optarg;		/* pick up name */
			// tie this to the size of pszLogFile_g so we don't get overflow
			strcpy(pszLogFile_g, optarg);
			   // Search forward.
				pdest = strchr( optarg, '.' );
				result = (int)(pdest - optarg + 1);
				if ( pdest != NULL )
					pszLogFile_g[result - 1] = '\0';
				strcat(pszLogFile_g, "log.log");

			  break;

	case 'q':
		bQuiet = TRUE;
		break;

		case 'r':                       /* Unfound morphemes option WM */
			bReportNoEntries = TRUE;
			break;

		case 't':                       /* trace option */
			bTrace = TRUE;
			break;

	case 'u':			/* combined dictionaries option */
		bUnifiedDictionary_m = TRUE;
		break;

		case 'v':                       /* verify tests option */
			bVerify_m = TRUE;
			break;

		case 'x':                       /* transfer only option */
			bOnlyTransfer = TRUE;
			break;

		case '/':                       /* debugging option */
			++iDebugLevel;				/* debug level counter */
			break;
// Not implemented
//	case 'z':		/* memory allocation trace filename */
//	    setAllocMemoryTracing(optarg);
//	    pHgStamp_g->bCheckAlloc_m = TRUE;
//	    break;
//
//	case 'Z':		/* memory allocation trap address,count */
//	    trap_address = (VOIDP)strtoul(optarg, &p, 0);
//	    if (trap_address != (VOIDP)NULL)
//		{
//		if (*p == ',')
//		    trap_count = (int)strtoul(p+1, NULL, 10);
//		if (trap_count == 0)
//		    trap_count = 1;
//		setAllocMemoryTrap(trap_address, trap_count);
//		pHgStamp_g->bCheckAlloc_m = TRUE;
//		}
//	    break;

		default:                        /* unrecognized option */
		bShowUsage = TRUE;
			break;
			}
	} /* end switch */

if ((optind < argc) && (strcmp(argv[optind],"?") == 0))
	bShowUsage = TRUE;

if (	bShowUsage ||
	((optind < argc) && (strcmp(argv[optind],"?") == 0)) )
	{
	usage();		/* tell the user what he can do */
	void closeUp(void);	/* free malloc memory and release dll */
	exitSafely(1);	/* exit with error status */
	}
}

/***************************************************************************
 * NAME
 *    usage
 * DESCRIPTION
 *    Print a terse summary of the command options.
 * RETURN VALUE
 *    none
 */
static void usage()
{
fputs("\
Usage: stamp [options]\n\
\n\
-a       return All valid allomorph combinations, not just the first\n\
-c char  select the record Comment character (default is '|')\n\
", stderr); fputs("\
-d num   select the maximum trie Depth (default is 2)\n\
-f file  File containing names of data files\n\
-i file  name of a single Input analysis file\n\
-m       Monitor progress by displaying a dot for each word processed\n\
", stderr); fputs("\
-n       No checking of root categories during synthesis\n\
-o file  name of the Output synthesis file\n\
-q       work Quietly without any screen output\n\
-r       Report morphemes not found in dictionaries\n\
", stderr); fputs("\
-t       Trace transfer and synthesis (produces voluminous output)\n\
-u       dictionaries are Unified, not split into prefix, ..., root\n\
-v       Verify tests by pretty printing the parse trees\n\
-x       apply transfer without synthesis\n\
", stderr);
}

/****************************************************************************
 * NAME
 *    tsinit
 * DESCRIPTION
 *    Initialization for transfer and synthesis:  load the control files and
 *    dictionaries.
 * RETURN VALUE
 *    none
 */
static void tsinit()
{
char		infname[BUFSIZE];
//Change *	pChg;
//int		iCount = 0;
char		szPrompt[64];
static const char	szRootDictPrompt_s[] = "\
Root dictionary file (xxRTnn.DIC)";
static const char	szDictPrompt_s[] = "\
Dictionary file (xxYYYYnn.DIC)";
static const char	szDictLoadMessage_s[] = "\
		%s DICTIONARY: Loaded %d record%s\n";
static const char	szDictErrorMessage_s[] = "\
Cannot open dictionary file %s\n";
static const char	szMissingDictCodeRecord_s[] = "\
DICTIONARY CODE TABLE: missing record in change table.\n\
			   Expected a %s record, but did not find it\n";

/*
 *  open -f namefile if there is one
 *  If logging file names and not verifying tests, output to log file as well
 */
openAmpleCmdFile(pszCommandFile_m, bQuiet );

/*
 *  load the overall STAMP control file
 */
getAmpleCmd("STAMP declarations file (zzSTAMP.DEC): ", infname, BUFSIZE);
if (infname[0] != '\0') {
	apszStampControlFiles_g[0] = (char *)malloc(strlen(infname)+1);
	strcpy((char *)apszStampControlFiles_g[0],infname);
	}

/*
 *  load the transfer (dialect-pair-specific) control file
 */
getAmpleCmd("Transfer file (xxzzTR.CHG) [none]: ", infname, BUFSIZE);
if (infname[0] != '\0') {
	apszStampControlFiles_g[1] = (char *)malloc(strlen(infname)+1);
	strcpy((char *)apszStampControlFiles_g[1],infname);
	}

/*
 *  load the synthesis control file
 */
getAmpleCmd("Synthesis file (zzSYNT.CHG) [none]: ", infname, BUFSIZE);
if (infname[0] != '\0') {
	apszStampControlFiles_g[2] = (char *)malloc(strlen(infname)+1);
	strcpy((char *)apszStampControlFiles_g[2],infname);
	}

/*
 *  load the dictionary code table file
 */

getAmpleCmd("Dictionary code table (zzSYCD.TAB): ", infname, BUFSIZE);
if (infname[0] != '\0') {
	apszStampControlFiles_g[3] = (char *)malloc(strlen(infname)+1);
	strcpy((char *)apszStampControlFiles_g[3],infname);
	}
/*
 *  load the dictionary orthography change table
 */
getAmpleCmd("Dictionary orthography change table (zzORDC.TAB) [none]: ",
		infname, BUFSIZE);
if (infname[0] != '\0') {
	apszStampControlFiles_g[4] = (char *)malloc(strlen(infname)+1);
	strcpy((char *)apszStampControlFiles_g[4],infname);
	}

/* ================================================================
 *  load the morpheme dictionaries
 */
//getAndClearAllocMemorySum();                 /* Clear memory used for report */
	setDictTable(apszStampControlFiles_g[3]); //set bxxxxxTable binaries.
if (bUnifiedDictionary_m || bUnifiedTable)
	{
	/*
	 *  load Target Dialect unified dictionary: may be multiple files
	 */
	sprintf(szPrompt, "%s: ", szDictPrompt_s);
	getAmpleCmd(szPrompt, infname, BUFSIZE);
	sprintf(szPrompt, "Next %s [no more]: ", szDictPrompt_s);
	int k = 0;
	do  {
		apszStampDictionaryFiles_g[k] = (char *)malloc(strlen(infname)+1);
			strcpy((char *)apszStampDictionaryFiles_g[k],infname);
		getAmpleCmd(szPrompt, infname, BUFSIZE);
		++k;
		} while ( infname[0] );
	}
else
	{
	if (bPrefixTable == TRUE)
	{                                   /* load TD prefix dictionary */
	getAmpleCmd("Prefix dictionary file (zzPF01.DIC): ",
			infname, BUFSIZE);
	apszStampDictionaryFiles_g[0] = (char *)malloc(strlen(infname)+1);
			strcpy((char *)apszStampDictionaryFiles_g[0],infname);
	}
	if (bInfixTable == TRUE)
	{                                   /* load TD infix dictionary */
	getAmpleCmd("Infix dictionary file (zzIF01.DIC): ", infname, BUFSIZE);
	apszStampDictionaryFiles_g[1] = (char *)malloc(strlen(infname)+1);
		strcpy((char *)apszStampDictionaryFiles_g[1],infname);
	}
	if (bSuffixTable == TRUE)
	{                                   /* load TD suffix dictionary */
	getAmpleCmd("Suffix dictionary file (zzSF01.DIC): ", infname, BUFSIZE);
	apszStampDictionaryFiles_g[2] = (char *)malloc(strlen(infname)+1);
		strcpy((char *)apszStampDictionaryFiles_g[2],infname);
	}
	/*
	 *  the following is not needed if synthesis is not done.
	 *
	 *  load Target Dialect root dictionary: may be multiple files
	 */
	if (bRootTable == TRUE)
	{
	sprintf(szPrompt, "%s: ", szRootDictPrompt_s);
	getAmpleCmd(szPrompt, infname, BUFSIZE);
	sprintf(szPrompt, "Next %s [no more]: ", szRootDictPrompt_s);
	int k = 2;
	do  {
		++k;
		apszStampDictionaryFiles_g[k] = (char *)malloc(strlen(infname)+1);
		strcpy((char *)apszStampDictionaryFiles_g[k],infname);
		getAmpleCmd(szPrompt, infname, BUFSIZE);
		} while ( infname[0] && k < 8);
	}
	}
/*
 *  load text output control file (orthography changes)
 */
getAmpleCmd("Output text control file (zzOUTTX.CTL) [none]: ",
		infname, BUFSIZE);
if ( infname[0] != '\0')
	{
	apszStampControlFiles_g[5] = (char *)malloc(strlen(infname)+1);
		strcpy((char *)apszStampControlFiles_g[5],infname);
	}

// Call the DLL

hStampLib_g = LoadLibrary( DLL_FILE );
assert(hStampLib_g);

pfStampCreateSetup_g      = (STAMPFUNC0)GetProcAddress(hStampLib_g,
							  "StampCreateSetup");
pfStampLoadControlFiles_g = (STAMPFUNC7)GetProcAddress(hStampLib_g,
							  "StampLoadControlFiles");
pfStampReset_g            = (STAMPFUNC1)GetProcAddress(hStampLib_g,
							  "StampReset");
pfStampLoadDictionary_g   = (STAMPFUNC3)GetProcAddress(hStampLib_g,
							  "StampLoadDictionary");
pfStampProcessFile_g    = (STAMPFUNC3)GetProcAddress(hStampLib_g,
							  "StampProcessFile");
pfStampSetParameter_g     = (STAMPFUNC3)GetProcAddress(hStampLib_g,
							  "StampSetParameter");
pfStampDeleteSetup_g      = (STAMPFUNC1)GetProcAddress(hStampLib_g,
							  "StampDeleteSetup");
pfStampReportVersion_g	  = (STAMPFUNC1)GetProcAddress(hStampLib_g,
							  "StampReportVersion");

assert(pfStampCreateSetup_g);
assert(pfStampDeleteSetup_g);
assert(pfStampReset_g);
assert(pfStampLoadControlFiles_g);
assert(pfStampLoadDictionary_g);
assert(pfStampProcessFile_g);
assert(pfStampSetParameter_g);
assert(pfStampReportVersion_g);

pHgStamp_g = (*pfStampCreateSetup_g)();

// truncate the log file
//FILE * pLogFP = fopen(pszLogFile_g, "w");
//if (pLogFP != NULL)
//    fclose(pLogFP);


loadControlFiles(pHgStamp_g,
		 apszStampControlFiles_g,
		 pszLogFile_g);


loadDictionaries(pHgStamp_g,
		 apszStampDictionaryFiles_g);
}

/*************************************************************************
 * NAME
 *    tsproc
 * DESCRIPTION
 *    Top-level processing function for transfer and synthesis.
 *    This prompts the user for input and output files, then for each
 *    file, it coordinates the transfer and synthesis of each word.
 * RETURN VALUE
 *    none
 */
static void tsproc()
{
char outfilename[BUFSIZE];
char infilename[BUFSIZE];

/*
 *  Get input file name from command line or user
 */
if ( !pszInputFile_m )				/* If not on cmd line, ask */
	{
	getAmpleCmd("\nFirst Input file: ", infilename, 100);
	}
else
	strcpy( infilename, pszInputFile_m);	/* Else copy from cmd line */
/*
 *  process each input file to a separate output file
 */
do  {

	/*
	 *  ask for the output file (if not in cmd line)
	 */
	if ( !pszOutputFile_m )			/* If not in command line */
		{
		getAmpleCmd("Output file: ", outfilename, 100);		/* Ask */
		}
	else					/* Else (in command line) */
		{
		strcpy( outfilename, pszOutputFile_m);	/* Pick up file name */
		pszOutputFile_m = NULL;			/* Clear so only used once */
		}

	//Call the DLL - process the file.

	ProcessFile(pHgStamp_g,
		infilename,				//Ana file
		outfilename);			//Output file

	if ( !pszInputFile_m || (pszLogFile_g[0] != '\0'))      /* If input file not from cmd line */
		{                       /* Ask for another */
		getAmpleCmd("Next Input file (or RETURN if no more): ",
			infilename, 100);
		}
	else
		infilename[0] = NUL;      /* Else (from cmd line) clear name */

	} while (infilename[0]);      /* until the user wants no more */
}


/*************************************************************************
 * NAME
 *    openAFile
 * DESCRIPTION
 *    Open a file.
 * RETURN VALUE
 *    file pointer
 */
FILE *openAFile(char *pszFilename_in)
{
if (pszFilename_in != NULL)			/* If command file given */
	return fopenAlways(pszFilename_in, "r");	/* Open file */
else
	return NULL;
}

/*************************************************************************
 * NAME
 *    closeAFile
 * DESCRIPTION
 *    Close a file
 * RETURN VALUE
 *    none
 */
void closeAFile(FILE *fp)
{
if (fp != NULL)		    /* If there was a command file */
	{
	fclose( fp );		    /* Close file */
	}
}


/**************************************************************************
 * void setDictTable(const char pszFileName)
 *	from the dictionary code table find out what dictionaries we are using
 *  so we know what we are loading.
 */
void setDictTable(const char *pszFileName)
{
FILE *fpDCT;
if (!(fpDCT = openAFile((char *)pszFileName)))
	{
		fprintf(stderr, "Problem with dictionary code table file\n");
		void closeUp(void);	/* free malloc memory and release dll */
		exit(1);	// Cannot go on without this info.
	}
	char str[80];
	while (fgets(str, 80, fpDCT))
	{
		if (str[0] != '\\')
			continue;
		if (strncmp("\\prefix", str, 7) == 0)
		{
			bPrefixTable = TRUE;
			continue;
		}
		if (strncmp("\\infix", str, 6) == 0)
		{
			bInfixTable = TRUE;
			continue;
		}
		if (strncmp("\\suffix", str, 7) == 0)
		{
			bSuffixTable = TRUE;
			continue;
		}
		if (strncmp("\\root", str, 5) == 0)
		{
			bRootTable = TRUE;
			continue;
		}
		if (strncmp("\\unified", str, 8) == 0)
		{
			bUnifiedTable = TRUE;
//			continue;
		}
	}

	closeAFile(fpDCT);
	return;
}


// Comments from Steve's program
//  1. create the first STAMP setup
//  2. load the control files for the first STAMP setup
//  3. load the dictionaries for the first STAMP setup
//  4. Process the text file for the first STAMP setup
//  5. Process the word for the first STAMP setup
//  6. reset the data in the first STAMP setup
//  7. delete the first STAMP setup
//  8. create the second STAMP setup
//  9. load the control files for the second STAMP setup
// 10. load the dictionaries for the second STAMP setup
// 11. Process the text file for the second STAMP setup
// 12. Process the word for the second STAMP setup
// 13. reset the data in the second STAMP setup
// 14. delete the second STAMP setup
//


///////////////////////////////////////////////////////////////////////////////
// NAME
//    loadControlFiles
// DESCRIPTION
//    load the control files for the given STAMP setup
// RETURN VALUE
//    none
//
void loadControlFiles(
	StampSetup *	pSetup_io,
	const char *	apszControlFiles_in[],
	const char *	pszLogFile_in)
{
if (pfStampReset_g)
	{
	pszResult_g = (*pfStampReset_g)(pSetup_io);
	printf("StampReset():\n\t%s\n", pszResult_g);
	}
else
	printf("CANNOT CALL DLL/StampReset()\n");

if (pfStampSetParameter_g != NULL)
	{
// -a  DoAllSyntheses

if (bDoAllSyntheses == TRUE)
	{
	pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
					   "DoAllSynthesis", "TRUE");
	printf("StampSetParameter(\"DoAllSynthesis\", \"TRUE\"):\n\t%s\n",
	   pszResult_g);
	}

// -c on commandline  cComment
if (cComment != '\0')
	{
		char temp[2] = {'\0','\0'};
		temp[0] = cComment;
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						"BeginComment", temp);
		printf("StampSetParameter(\"BeginComment\", %s)):\n\t%s\n",
						temp, pszResult_g);
	}

// -d MaxTrieLevel
if (iMaxTrieLevel != 2)
	{
		char temp[2] = {'\0','\0'};
		if (iMaxTrieLevel < 0)
			iMaxTrieLevel = 0;
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						"MaxTrieDepth", _itoa(iMaxTrieLevel,temp,10));
		printf("StampSetParameter(\"MaxTrieDepth\", %s):\n\t%s\n",
						_itoa(iMaxTrieLevel,temp,10), pszResult_g);
	}

// -/ debug level
	if (iDebugLevel > 0)
	{
		char temp[2] = {'\0','\0'};
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						"DebugLevel", _itoa(iDebugLevel,temp,10));
		printf("StampSetParameter(\"DebugLevel\", %s)):\n\t%s\n",
						_itoa(iDebugLevel,temp,10), pszResult_g);
	}
// -m Monitor Progress

	if (bMonitorProgress_m == TRUE)
	{
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						   "MonitorProgress", "TRUE");
		printf("StampSetParameter(\"MonitorProgress\", \"TRUE\"):\n\t%s\n",
			pszResult_g);
	}

// -n MatchCategories
	if (bMatchCategories == FALSE)
	{
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						   "MatchCategories", "FALSE");
		printf("StampSetParameter(\"MatchCategories\", \"FALSE\"):\n\t%s\n",
			pszResult_g);
	}

// -q Quiet
	if (bQuiet == TRUE)
	{
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						   "Quiet", "TRUE");
		printf("StampSetParameter(\"Quiet\", \"TRUE\"):\n\t%s\n",
			pszResult_g);
	}

// -r ReportNoEntries
	if (bReportNoEntries == TRUE)
	{
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						   "ReportNoEntries", "TRUE");
		printf("StampSetParameter(\"ReportNoEntries\", \"TRUE\"):\n\t%s\n",
			pszResult_g);
	}

// -t Trace
	if (bTrace == TRUE)
	{
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						   "TraceAnalysis", "TRUE");
		printf("StampSetParameter(\"TraceAnalysis\", \"TRUE\"):\n\t%s\n",
			pszResult_g);
	}

// -u UnifiedDictionary
	if (bUnifiedDictionary_m == TRUE)
	{
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						   "UnifiedDictionary", "TRUE");
		printf("StampSetParameter(\"UnifiedDictionary\", \"TRUE\"):\n\t%s\n",
			pszResult_g);
	}

// -v Verify Tests
	if (bVerify_m == TRUE)
	{
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						   "VerifyTests", "TRUE");
		printf("StampSetParameter(\"VerifyTests\", \"TRUE\"):\n\t%s\n",
			pszResult_g);
	}

// -x Only Transfer
	if (bOnlyTransfer == TRUE)
	{
		pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
						   "OnlyTransfer", "TRUE");
		printf("StampSetParameter(\"OnlyTransfer\", \"TRUE\"):\n\t%s\n",
			pszResult_g);
	}

// LogFile
//    pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
//					   "AppendLogFile", "TRUE");
	printf("StampSetParameter(\"AppendLogFile\", \"TRUE\"):\n\t%s\n",
	   pszResult_g);

	pszResult_g = (*pfStampSetParameter_g)(pSetup_io,
					   "LogFile", pszLogFile_in);
	printf("StampSetParameter(\"LogFile\", \"%s\"):\n\t%s\n",
	   pszLogFile_in ? pszLogFile_in : "{NULL}", pszResult_g);

	//Header
	pszResult_g = (*pfStampReportVersion_g)(pSetup_io);
	printf("StampReportVersion(\"Header\", \"%s\"):\n\t%s\n",
	   pszLogFile_in ? pszLogFile_in : "{NULL}", pszResult_g);
	}
else
	printf("CANNOT CALL DLL/StampSetParameter()\n");

if (pfStampLoadControlFiles_g != 0)
	{
	pszResult_g = (*pfStampLoadControlFiles_g)(pSetup_io,
						apszControlFiles_in[0],
						apszControlFiles_in[1],
						apszControlFiles_in[2],
						apszControlFiles_in[3],
						apszControlFiles_in[4],
						apszControlFiles_in[5]);

	printf("StampLoadControlFiles():\n\t%s\n", pszResult_g);
	}
else
	printf("CANNOT CALL DLL/StampLoadControlFiles()\n");
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    loadDictionaries
// DESCRIPTION
//    load the dictionary files for the given STAMP setup
// RETURN VALUE
//    none
//
void loadDictionaries(
	StampSetup *	pSetup_io,
	const char *	apszDictFiles_in[])
{
int		i;


if (pfStampLoadDictionary_g != 0) {
// Unified Dictionary
	if (bUnifiedTable)
	{
	for ( i = 0 ; apszDictFiles_in[i] ; ++i )
		{
		pszResult_g = (*pfStampLoadDictionary_g)(pSetup_io,
							  apszDictFiles_in[i],
							  "U");
		printf("StampLoadDictionary(\"%s\",\"U\"):\n\t%s\n",
			   apszDictFiles_in[i], pszResult_g);
		}
	}
	else
	{
		// Non Unified
		if (apszDictFiles_in[0] != NULL)
		{
		pszResult_g = (*pfStampLoadDictionary_g)(pSetup_io,
							  apszDictFiles_in[0],
							  "P");
		printf("StampLoadDictionary(\"%s\",\"P\"):\n\t%s\n",
			   apszDictFiles_in[0], pszResult_g);
		}
		if (apszDictFiles_in[1] != NULL)
		{
		pszResult_g = (*pfStampLoadDictionary_g)(pSetup_io,
							  apszDictFiles_in[1],
							  "I");
		printf("StampLoadDictionary(\"%s\",\"I\"):\n\t%s\n",
			   apszDictFiles_in[1], pszResult_g);
		}
		if (apszDictFiles_in[2] != NULL)
		{
		pszResult_g = (*pfStampLoadDictionary_g)(pSetup_io,
							  apszDictFiles_in[2],
							  "S");
		printf("StampLoadDictionary(\"%s\",\"S\"):\n\t%s\n",
			   apszDictFiles_in[2], pszResult_g);
		}
		for ( i = 3 ; apszDictFiles_in[i] ; ++i )
		{
		pszResult_g = (*pfStampLoadDictionary_g)(pSetup_io,
							  apszDictFiles_in[i],
							  "R");
		printf("StampLoadDictionary(\"%s\",\"R\"):\n\t%s\n",
			   apszDictFiles_in[i], pszResult_g);
		}
	}
}
else
	printf("CANNOT CALL DLL/StampLoadDictionary()\n");
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    Process File
// DESCRIPTION
//    Process ANA(s) using the given STAMP setup
// RETURN VALUE
//    none
//
void ProcessFile(
	StampSetup *	pSetup_io,
	const char *	pszInputFile_in,
	const char *	pszOutputFile_in)
{
if (pfStampProcessFile_g != NULL)
	{
	pszResult_g = (*pfStampProcessFile_g)(pSetup_io,
					 pszInputFile_in,
					 pszOutputFile_in);
	printf("StampProcessFile(\"%s\",\"%s\"):\n\t%s\n",
	   pszInputFile_in, pszOutputFile_in, pszResult_g);
	}
else
	printf("CANNOT CALL DLL/StampProcessFile()\n");
}


///////////////////////////////////////////////////////////////////////////////
// NAME
//    removeSetup
// DESCRIPTION
//    reset and then delete an STAMP setup
// RETURN VALUE
//    none
//
void removeSetup(
	StampSetup * pSetup_io)
{
if (pfStampReset_g != NULL)
	{
	pszResult_g = (*pfStampReset_g)(pSetup_io);
	printf("StampReset():\n\t%s\n", pszResult_g);
	}
if (pfStampDeleteSetup_g != NULL)
	{
	pszResult_g = (*pfStampDeleteSetup_g)(pSetup_io);
	printf("StampDeleteSetup():\n\t%s\n", pszResult_g);
	}
}

/*
  File settings for GNU Emacs (Please leave for Steve McConnel's sake!)
  Local Variables:
  mode:C++
  compile-command:"nmake -f testdll.mak \"CFG=testdll - Win32 Debug\""
  End:
 */
