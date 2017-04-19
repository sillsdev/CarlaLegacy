/* WLLAMPLE.C - test program for LinguaLinks AMPLE DLL
 ******************************************************************************
 * Copyright 1997, 2000 by SIL International.  All rights reserved.
 */
#include <windows.h>
#include <stdio.h>
#include <io.h>
#include <string.h>
#include <stdarg.h>
#include <commdlg.h>
#include "resource.h"
#include "wllample.h"

#ifndef NUL
#define NUL '\0'
#endif
#define MAX_MSG_SIZE	1024	/* maximum size of messages */
#define MAXFILENAME	 256 	/* maximum size of file pathname */
#define MAXCUSTFILTER	  40	/* maximum size of custom filter buffer */
/*
 *  Windows handle for this program instance
 */
HANDLE		hInstance_g;
/*
 *  Windows handle for this program's window
 */
HWND		hWindow_g;
/*
 *  Windows handle for a selected font
 */
HFONT		hSelectedFont_g = 0;
/*
 *  handle to hourglass cursor
 */
HANDLE		hHourGlass_g;
/*
 *  current cursor handle
 */
HANDLE		hSaveCursor_g;
/*
 *  buffer for messages
 */
char		szMessageBuffer_g[MAX_MSG_SIZE];
/*
 *  window coordinates
 */
int	iX_g = 1;
int	iY_g = 1;
/*
 *  application name string
 */
const char	szAppName_g[] = "WLLAmple";
/*
 *  filter specifications for directory listings
 */
char		szFilterSpec_g[192] = "\
Control Files (*.ctl)\0*.ctl\0\
Table Files (*.tab)\0*.tab\0\
Dictionary Files (*.dic)\0*.dic\0\
Text Files (*.txt)\0*.txt\0\
All Files (*.*)\0*.*\0\
";
/*
 *  custom filter buffer
 */
char		szCustFilterSpec_g[MAXCUSTFILTER];
/*
 *  structure passed to GetOpenFileName()
 */
OPENFILENAME	sOFN_g;
char		szFilename_g[MAXFILENAME+1];
/*
 *  initial directory for filename dialogs
 */
char		szPathName_g[MAXFILENAME+1] = "\0";
/*
 *  buffers for storing filenames
 */
char		szAnalysisDataFile_g[MAXFILENAME+1];
char		szDictionaryCodesTableFile_g[MAXFILENAME+1];
char		szDictionaryOrthographyChangesTableFile_g[MAXFILENAME+1];
char		szDictionaryFile_g[MAXFILENAME+1];
char		szTextInputControlFile_g[MAXFILENAME+1];
char		szInputTextFile_g[MAXFILENAME+1];
char		szAnalysisOutputFile_g[MAXFILENAME+1];
char		szLogFile_g[MAXFILENAME+1];
char		szDictOutputFile_g[MAXFILENAME+1];
char		szSelectiveFile_g[MAXFILENAME+1];
/*
 *  constants, dialog titles, etc. related to filenames
 */
#define ANALYSIS_DATA_FILE		0
#define DICTIONARY_CODES_FILE		1
#define DICTIONARY_ORTHOCHANGE_FILE	2
#define DICTIONARY_FILE			3
#define TEXT_CONTROL_FILE		4
#define INPUT_TEXT_FILE			5
#define ANALYSIS_OUTPUT_FILE		6
#define LOG_FILE			7
#define DICTIONARY_OUTPUT		8

#define NUMBER_OF_FILES			9

const char *	apszFileTitle_g[NUMBER_OF_FILES] = {
	"Analysis Data File",
	"Dictionary Codes Table File",
	"Dictionary Orthography Changes Table File",
	"(Unified) Dictionary File",
	"Text Input Control File",
	"Input Text File",
	"Analysis Output File",
	"Log File",
	"Dictionary Output File"
	};
char *		apszFilename_g[NUMBER_OF_FILES] = {
	szAnalysisDataFile_g,
	szDictionaryCodesTableFile_g,
	szDictionaryOrthographyChangesTableFile_g,
	szDictionaryFile_g,
	szTextInputControlFile_g,
	szInputTextFile_g,
	szAnalysisOutputFile_g,
	szLogFile_g,
	szDictOutputFile_g
	};
int		aiTop_g[NUMBER_OF_FILES] = {
	1, 21, 41, 61, 81, 101, 121, 141, 161
	};
int		aiFilterIndex_g[NUMBER_OF_FILES] = {
	1, 2, 2, 3, 1, 4, 5, 5, 5
	};
/*
 *  buffer for text to parse
 */
char		szText_g[1024] = "\
Chayta rikar loomaman wicharkur hamakuykuran yachachinanpaq\
";
/*
 *  buffers for key and entry for updating loaded dictionary
 */
char		szNewEntry_g[1024] = "\
\\e mateo\r\n\
\\t root\r\n\
\\c N0\r\n\
\\a mateo {Matthew_1}\r\n\
\\a mateu {Matthew_2}\r\n\
\\a matei {Matthew_3}\r\n\
";
char		szRemoveEntry_g[] = "\
\\e nazarenu\r\n\
\\t root\r\n\
\\c N0\r\n\
\\a nazarenu {Nazarene_1}\r\n\
\\noload\r\n\
";
const static char	szSelectiveSuffixes_m[] = "\
1O 1P 3 3FUT 3P ADVDS ADVSS1 AG BCM2 BNF CAUS DEF DIR GOAL IMPFV IN INF INST\n\
INTER JUST LOC NOM OBJ PASS PLALL PLUR PRT PST PUR REF REL SIM TOP UP VRBL ";
const static char	szSelectiveRoots_m[] = "\
allcha alli allpa aypalla chay disi*pulu duyn~u dyus hama hirka inti:ru\n\
inu*til jesus ka kushi kuya llaki lu:ma mundu ni n~awpa pasaypa rika runa\n\
rura shunta shuqu wicha: yanapa: yarpa: yarqa: yatra yaykU ";
/*
 *  name of the LinguaLinks AMPLE DLL file
 */
const static char	szAmpleLib_m[] =
#ifdef _DEBUG
					"\\opac\\src\\ample\\LLDebug\\llample.dll";
#else
				  "\\opac\\src\\ample\\LLRelease\\llample.dll";
#endif
/*
 *  Windows handle for the LinguaLinks AMPLE DLL file
 */
HANDLE			hAmpleLib_g;
/*
 *  definitions and variables for DLL functions
 */
typedef char * (CALLBACK * AMPLEFUNC0)(void);
typedef char * (CALLBACK * AMPLEFUNC1)(const char *);
typedef char * (CALLBACK * AMPLEFUNC2)(const char *,
					   const char *);
typedef char * (CALLBACK * AMPLEFUNC3)(const char *,
					   const char *,
					   const char *);
typedef char * (CALLBACK * AMPLEFUNC4)(const char *,
					   const char *,
					   const char *,
					   const char *);

const static char	szAmpleReset_m[]            = "AmpleReset";
const static char	szAmpleLoadControlFiles_m[] = "AmpleLoadControlFiles";
const static char	szAmpleLoadDictionary_m[]   = "AmpleLoadDictionary";
const static char	szAmpleParseText_m[]        = "AmpleParseText";
const static char	szAmpleParseFile_m[]        = "AmpleParseFile";
const static char	szAmpleUpdateEntry_m[]      = "AmpleUpdateEntry";
const static char	szAmpleWriteDictionary_m[]  = "AmpleWriteDictionary";
const static char	szAmpleGetParameter_m[]     = "AmpleGetParameter";
const static char	szAmpleSetParameter_m[]     = "AmpleSetParameter";
const static char	szAmpleAddSelectiveAnalysisMorphs_m[]    =
					"AmpleAddSelectiveAnalysisMorphs";
const static char	szAmpleRemoveSelectiveAnalysisMorphs_m[] =
					"AmpleRemoveSelectiveAnalysisMorphs";

AMPLEFUNC0		pfAmpleReset_g;
AMPLEFUNC4		pfAmpleLoadControlFiles_g;
AMPLEFUNC1		pfAmpleLoadDictionary_g;
AMPLEFUNC1		pfAmpleParseText_g;
AMPLEFUNC2		pfAmpleParseFile_g;
AMPLEFUNC1		pfAmpleUpdateEntry_g;
AMPLEFUNC1		pfAmpleWriteDictionary_g;
AMPLEFUNC1		pfAmpleGetParameter_g;
AMPLEFUNC2		pfAmpleSetParameter_g;
AMPLEFUNC1		pfAmpleAddSelectiveAnalysisMorphs_g;
AMPLEFUNC0		pfAmpleRemoveSelectiveAnalysisMorphs_g;

/*****************************************************************************
 * NAME
 *    About
 * DESCRIPTION
 *    Processes messages for "About" dialog box:
 *        WM_INITDIALOG - initialize dialog box
 *        WM_COMMAND    - Input received
 * RETURN VALUE
 *    TRUE if the message handled, FALSE otherwise
 */
BOOL FAR PASCAL About(
	HWND	hDialog_in,	/* dialog box window */
	unsigned	uiMessage_in,	/* message number */
	WORD	wParam_in,	/* first parameter for message */
	LONG	lParam_in)	/* second parameter for message */
{
switch (uiMessage_in)
	{
	case WM_INITDIALOG:
	return (TRUE);

	case WM_COMMAND:
	if ((wParam_in == IDOK) || (wParam_in == IDCANCEL))
		{
		EndDialog(hDialog_in, TRUE);
		return (TRUE);
		}
	return (TRUE);
	}
return (FALSE);
}

/*****************************************************************************
 * NAME
 *    writeMessage
 * DESCRIPTION
 *    write a character string to the indicated (pixel) position in the
 *    indicated window
 * RETURN VALUE
 *    none
 */
void writeMessage(
	HWND		hWindow_in,	/* window handle */
	int			iLeft_in,	/* leftmost pixel (X) coordinate */
	int			iTop_in,	/* topmost  pixel (Y) coordinate */
	const char *	pszFormat_in,	/* printf() style format string */
	...)				/* parameters to format string */
{
va_list	vaMarker;
RECT	sRect;

va_start( vaMarker, pszFormat_in );

wvsprintf(szMessageBuffer_g, pszFormat_in, vaMarker);

iX_g         = iLeft_in;
iY_g         = iTop_in;
sRect.left   = iX_g;
sRect.top    = iY_g;
sRect.right  = 1024;
sRect.bottom = iY_g + 19;
InvalidateRect(hWindow_in, &sRect, TRUE);
UpdateWindow(hWindow_in);

va_end( vaMarker );
}

/*****************************************************************************
 * NAME
 *    getInputFilename
 * DESCRIPTION
 *    get the pathname of an input file using a standard dialog box
 * RETURN VALUE
 *    none
 */
void getInputFilename(
	HWND	hWindow_in,	/* handle of parent window */
	int		iSelect_in)	/* index into filename information arrays */
{
memcpy(szFilename_g, apszFilename_g[iSelect_in], MAXFILENAME);
sOFN_g.lpstrTitle   = apszFileTitle_g[iSelect_in];
sOFN_g.nFilterIndex = aiFilterIndex_g[iSelect_in];
if (!GetOpenFileName((LPOPENFILENAME)&sOFN_g))
	{
	/*
	 *  canceled by user
	 */
	return;
	}
memcpy(apszFilename_g[iSelect_in], szFilename_g, MAXFILENAME);

writeMessage(hWindow_in, 300, aiTop_g[iSelect_in],
		 "%s", apszFilename_g[iSelect_in]);
}

/*****************************************************************************
 * NAME
 *    getOutputFilename
 * DESCRIPTION
 *    get the pathname of an output file using a standard dialog box
 * RETURN VALUE
 *    none
 */
void getOutputFilename(
	HWND	hWindow_in,	/* handle of parent window */
	int		iSelect_in)	/* index into filename information arrays */
{
memcpy(szFilename_g, apszFilename_g[iSelect_in], MAXFILENAME);
sOFN_g.lpstrTitle   = apszFileTitle_g[iSelect_in];
sOFN_g.nFilterIndex = aiFilterIndex_g[iSelect_in];
if (!GetSaveFileName((LPOPENFILENAME)&sOFN_g))
	{
	/*
	 *  canceled by user
	 */
	return;
	}
memcpy(apszFilename_g[iSelect_in], szFilename_g, MAXFILENAME);

writeMessage(hWindow_in, 300, aiTop_g[iSelect_in],
		 "%s", apszFilename_g[iSelect_in]);
}

/*****************************************************************************
 * NAME
 *    setDefaultOutputFile
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void setDefaultOutputFile(
	HWND	hWindow_in,
	int		iSelect_in,
	char *	pszFiletype_in)
{
char *	p;

if (szInputTextFile_g[0] == NUL)
	return;
strncpy(apszFilename_g[iSelect_in], szInputTextFile_g, MAXFILENAME);
p = strrchr(apszFilename_g[iSelect_in], '\\');
if (p == NULL)
	p = apszFilename_g[iSelect_in];
p = strrchr(p, '.');
if (p != NULL)
	*p = NUL;
strncat(apszFilename_g[iSelect_in], pszFiletype_in,
	MAXFILENAME - strlen(apszFilename_g[iSelect_in]));

writeMessage(hWindow_in, 300, aiTop_g[iSelect_in],
		 "%s", apszFilename_g[iSelect_in]);
}

/*****************************************************************************
 * NAME
 *    processData
 * DESCRIPTION
 *
 * RETURN VALUE
 *    none
 */
void processData(
	HWND	hWindow_in)
{
char *	pszError;
char *	pszResult;
char *	p;
int	iErrorCount = 0;
int	iRow;
/*
 *  Try to load the LinguaLinks AMPLE DLL
 */
hAmpleLib_g = LoadLibrary(szAmpleLib_m);
if ((size_t)hAmpleLib_g < 32)
	{
	switch ((size_t)hAmpleLib_g)
	{
	case 0:
		pszError = "System was out of memory, executable file was corrupt, or relocations were invalid.";
		break;
	case 2:
		pszError = "File was not found.";
		break;
	case 3:
		pszError = "Path was not found.";
		break;
	case 5:
		pszError = "Attempt was made to dynamically link to a task, or there was a sharing or network-protection error.";
		break;
	case 6:
		pszError = "Library required separate data segments for each task.";
		break;
	case 8:
		pszError = "There was insufficient memory to start the application.";
		break;
	case 10:
		pszError = "Windows version was incorrect.";
		break;
	case 11:
		pszError = "Executable file was invalid. Either it was not a Windows application or there was an error in the .EXE image.";
		break;
	case 12:
		pszError = "Application was designed for a different operating system.";
		break;
	case 13:
		pszError = "Application was designed for MS-DOS 4.0.";
		break;
	case 14:
		pszError = "Type of executable file was unknown.";
		break;
	case 15:
		pszError = "Attempt was made to load a real-mode application (developed for an earlier version of Windows).";
		break;
	case 16:
		pszError = "Attempt was made to load a second instance of an executable file containing multiple data segments that were not marked read-only.";
		break;
	case 19:
		pszError = "Attempt was made to load a compressed executable file. The file must be decompressed before it can be loaded.";
		break;
	case 20:
		pszError = "Dynamic-link library (DLL) file was invalid. One of the DLLs required to run this application was corrupt.";
		break;
	case 21:
		pszError = "Application requires Microsoft Windows 32-bit extensions.";
		break;
	default:
		pszError = NULL;
		break;
	}
	if (pszError == NULL)
	wsprintf(szMessageBuffer_g, "Error loading %s: unknown error [%zu]",
		 (LPSTR)szAmpleLib_m, (size_t)hAmpleLib_g);
	else
	wsprintf(szMessageBuffer_g, "Error loading %s: %s",
		 (LPSTR)szAmpleLib_m, pszError);
	MessageBox(0, szMessageBuffer_g, szAppName_g,
		   MB_OK | MB_ICONEXCLAMATION);
	return;
	}
/*
 *  now that the DLL is loaded, try to access the various functions
 */
pfAmpleLoadControlFiles_g = (AMPLEFUNC4)GetProcAddress(hAmpleLib_g,
						   szAmpleLoadControlFiles_m);
pfAmpleLoadDictionary_g   = (AMPLEFUNC1)GetProcAddress(hAmpleLib_g,
						   szAmpleLoadDictionary_m);
pfAmpleParseText_g        = (AMPLEFUNC1)GetProcAddress(hAmpleLib_g,
						   szAmpleParseText_m);
pfAmpleParseFile_g        = (AMPLEFUNC2)GetProcAddress(hAmpleLib_g,
						   szAmpleParseFile_m);
pfAmpleUpdateEntry_g      = (AMPLEFUNC1)GetProcAddress(hAmpleLib_g,
						   szAmpleUpdateEntry_m);
pfAmpleReset_g            = (AMPLEFUNC0)GetProcAddress(hAmpleLib_g,
						   szAmpleReset_m);
pfAmpleGetParameter_g     = (AMPLEFUNC1)GetProcAddress(hAmpleLib_g,
						   szAmpleGetParameter_m);
pfAmpleSetParameter_g     = (AMPLEFUNC2)GetProcAddress(hAmpleLib_g,
						   szAmpleSetParameter_m);
pfAmpleWriteDictionary_g   = (AMPLEFUNC1)GetProcAddress(hAmpleLib_g,
						   szAmpleWriteDictionary_m);
pfAmpleAddSelectiveAnalysisMorphs_g = (AMPLEFUNC1)GetProcAddress(hAmpleLib_g,
					   szAmpleAddSelectiveAnalysisMorphs_m);
pfAmpleRemoveSelectiveAnalysisMorphs_g =(AMPLEFUNC0)GetProcAddress(hAmpleLib_g,
					   szAmpleRemoveSelectiveAnalysisMorphs_m);
/*
 *  verify that the functions are accessible
 */
if (pfAmpleLoadControlFiles_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleLoadControlFiles_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
if (pfAmpleLoadDictionary_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleLoadDictionary_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
if (pfAmpleParseText_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleParseText_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
if (pfAmpleParseFile_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleParseFile_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
if (pfAmpleUpdateEntry_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleUpdateEntry_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
if (pfAmpleReset_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleReset_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
if (pfAmpleGetParameter_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleGetParameter_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
if (pfAmpleSetParameter_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleSetParameter_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
if (pfAmpleWriteDictionary_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleWriteDictionary_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
if (pfAmpleAddSelectiveAnalysisMorphs_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleAddSelectiveAnalysisMorphs_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
if (pfAmpleRemoveSelectiveAnalysisMorphs_g == NULL)
	{
	wsprintf(szMessageBuffer_g, "Cannot find %s in %s",
		 szAmpleRemoveSelectiveAnalysisMorphs_m, szAmpleLib_m);
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	++iErrorCount;
	}
/*
 *  now that the DLL is loaded, and the functions are accessible, try to
 *  process some data
 */
if (iErrorCount == 0)
	{
	if (szLogFile_g[0] != NUL)
	{
	pszResult = (*pfAmpleSetParameter_g)("LogFile", szLogFile_g);
	writeMessage(hWindow_in, 280, aiTop_g[LOG_FILE], "**");
	writeMessage(hWindow_in, 300, aiTop_g[LOG_FILE], "%s", szLogFile_g);
	}
	iRow = 9 * 20 + 1;
	/*
	 *  ask for root glosses
	 */
	pszResult = (*pfAmpleSetParameter_g)("RootGlosses", "TRUE");
	writeMessage(hWindow_in,100, iRow,
		 "AmpleSetParameter(\"RootGlosses\",\"TRUE\") => \"%s\"",
		 pszResult);
	iRow += 20;
	/*
	 *  load the control files
	 */
	pszResult = (*pfAmpleLoadControlFiles_g)(
					 szAnalysisDataFile_g,
					 szDictionaryCodesTableFile_g,
					 szDictionaryOrthographyChangesTableFile_g,
					 szTextInputControlFile_g);
	writeMessage(hWindow_in,   1, iRow, "%s", szAmpleLoadControlFiles_m);
	writeMessage(hWindow_in, 200, iRow, "\"%s\"", pszResult);
	iRow += 20;
	/*
	 *  load the dictionary file
	 */
	pszResult = (*pfAmpleLoadDictionary_g)(szDictionaryFile_g);
	writeMessage(hWindow_in,  1, iRow, "%s", szAmpleLoadDictionary_m);
	writeMessage(hWindow_in,200, iRow, "\"%s\"", pszResult);
	iRow += 20;
	/*
	 *  parse a text string
	 */
	pszResult = (*pfAmpleSetParameter_g)("TraceAnalysis", "SGML");
	pszResult = (*pfAmpleParseText_g)(szText_g);
	writeMessage(hWindow_in,   1, iRow, "%s", szAmpleParseText_m);
	writeMessage(hWindow_in, 200, iRow, "\"%s\"", pszResult);
	iRow += 20;
	/*
	 *  parse a file (to SGML <AResult>
	 */
	pszResult = (*pfAmpleSetParameter_g)("OutputStyle", "AResult");
	pszResult = (*pfAmpleParseFile_g)(szInputTextFile_g,
					  szAnalysisOutputFile_g);
	writeMessage(hWindow_in,   1, iRow, "%s", szAmpleParseFile_m);
	writeMessage(hWindow_in, 200, iRow, "\"%s\"", pszResult);
	iRow += 20;
	/*
	 *  parse a file (to AMPLE .ana)
	 */
	pszResult = (*pfAmpleSetParameter_g)("OutputStyle", "Ana");
	p = strrchr(szAnalysisOutputFile_g, '.');
	if (p != NULL)
	*p = '\0';
	strncat(szAnalysisOutputFile_g, ".ana",
		MAXFILENAME - strlen(szAnalysisOutputFile_g));
	pszResult = (*pfAmpleParseFile_g)(szInputTextFile_g,
					  szAnalysisOutputFile_g);
	writeMessage(hWindow_in,   1, iRow, "%s", szAmpleParseFile_m);
	writeMessage(hWindow_in, 200, iRow, "\"%s\"", pszResult);
	iRow += 20;
	/*
	 *  parse a file (to AMPLE .ana) with selective analysis
	 */
	strcpy(szSelectiveFile_g, szInputTextFile_g);
	p = strrchr(szSelectiveFile_g, '.');
	if (p != NULL)
	*p = '\0';
	strncat(szSelectiveFile_g, ".sel",
		MAXFILENAME - strlen(szSelectiveFile_g));
	pszResult = (*pfAmpleSetParameter_g)("SelectiveAnalysisFile",
					 szSelectiveFile_g);
	p = strrchr(szAnalysisOutputFile_g, '.');
	if (p != NULL)
	*p = '\0';
	strncat(szAnalysisOutputFile_g, ".an2",
		MAXFILENAME - strlen(szAnalysisOutputFile_g));
	pszResult = (*pfAmpleParseFile_g)(szInputTextFile_g,
					  szAnalysisOutputFile_g);
	writeMessage(hWindow_in,   1, iRow, "%s", szAmpleParseFile_m);
	writeMessage(hWindow_in, 200, iRow, "\"%s\"", pszResult);
	iRow += 20;
	pszResult = (*pfAmpleSetParameter_g)("SelectiveAnalysisFile", NULL);
	/*
	 *  parse a file (to AMPLE .ana) with selective analysis
	 */
	pszResult = (*pfAmpleAddSelectiveAnalysisMorphs_g)(szSelectiveSuffixes_m);
	pszResult = (*pfAmpleAddSelectiveAnalysisMorphs_g)(szSelectiveRoots_m);
	p = strrchr(szAnalysisOutputFile_g, '.');
	if (p != NULL)
	*p = '\0';
	strncat(szAnalysisOutputFile_g, ".an3",
		MAXFILENAME - strlen(szAnalysisOutputFile_g));
	pszResult = (*pfAmpleParseFile_g)(szInputTextFile_g,
					  szAnalysisOutputFile_g);
	writeMessage(hWindow_in,   1, iRow, "%s", szAmpleParseFile_m);
	writeMessage(hWindow_in, 200, iRow, "\"%s\"", pszResult);
	iRow += 20;
	pszResult = (*pfAmpleRemoveSelectiveAnalysisMorphs_g)();
	/*
	 *  update a dictionary entry
	 */
	pszResult = (*pfAmpleUpdateEntry_g)(szNewEntry_g);
	writeMessage(hWindow_in,   1, iRow, "%s", szAmpleUpdateEntry_m);
	writeMessage(hWindow_in, 200, iRow, "\"%s\"", pszResult);
	pszResult = (*pfAmpleUpdateEntry_g)(szRemoveEntry_g);
	writeMessage(hWindow_in, 500, iRow, "\"%s\"", pszResult);
	iRow += 20;
	/*
	 *  write the updated dictionary to a file
	 */
	if (szDictOutputFile_g[0] != NUL)
	{
	pszResult = (*pfAmpleWriteDictionary_g)(szDictOutputFile_g);
	writeMessage(hWindow_in,  1, iRow, "%s", szAmpleWriteDictionary_m);
	writeMessage(hWindow_in,200, iRow, "\"%s\"", pszResult);
	iRow += 20;
	}
	/*
	 *  turn off the log file and try processing again
	 */
	if (szLogFile_g[0] != NUL)
	{
	pszResult = (*pfAmpleSetParameter_g)("LogFile", NULL);
	writeMessage(hWindow_in, 280, aiTop_g[LOG_FILE], " ");
	writeMessage(hWindow_in, 300, aiTop_g[LOG_FILE], "%s", "NULL");
	pszResult = (*pfAmpleSetParameter_g)("AppendLogFile", "TRUE");
	}
	pszResult = (*pfAmpleParseText_g)(szText_g);
	writeMessage(hWindow_in,   1, iRow, "%s", szAmpleParseText_m);
	writeMessage(hWindow_in, 200, iRow, "\"%s\"", pszResult);
	iRow += 20;
	/*
	 *  reset the DLL: unload the control files and dictionary
	 */
	pszResult = (*pfAmpleReset_g)();
	writeMessage(hWindow_in,   1, iRow, "%s", szAmpleReset_m);
	writeMessage(hWindow_in, 200, iRow, "\"%s\"", pszResult);
	iRow += 20;
	}
/*
 *  unload the DLL and reset the function pointers
 */
FreeLibrary(hAmpleLib_g);
hAmpleLib_g               = 0;
pfAmpleLoadControlFiles_g = NULL;
pfAmpleLoadDictionary_g   = NULL;
pfAmpleParseText_g        = NULL;
pfAmpleParseFile_g        = NULL;
pfAmpleUpdateEntry_g      = NULL;
pfAmpleReset_g            = NULL;
pfAmpleWriteDictionary_g  = NULL;
pfAmpleGetParameter_g     = NULL;
pfAmpleSetParameter_g     = NULL;
}

/*****************************************************************************
 * NAME
 *    AmpleWndProc
 * DESCRIPTION
 *    Processes these messages:
 *        WM_COMMAND - Menu commands
 *            IDM_ANALDATAFILE    - Select the analysis data file
 *            IDM_DICTCODES       - Select the dictionary codes table file
 *            IDM_DICTORTHOCHANGE - Select the dictionary orthography changes
 *                                  table file
 *            IDM_DICTIONARY      - Select the (unified) dictionary file
 *            IDM_TEXTCTL         - Select the text input control file
 *            IDM_ANAFILE         - Set the analysis output file
 *            IDM_LOGFILE         - Set the log file
 *            IDM_EXIT            - Exit the program
 *            IDM_PROCESS         - Process the data
 *            IDM_ABOUT           - Display the About dialog box
 *        WM_DESTROY - destroy window
 * RETURN VALUE
 *    NULL (?)
 */
LRESULT FAR PASCAL AmpleWndProc(
	HWND	hWindow_in,
	UINT	uiMessage_in,
	WPARAM	wParam_in,
	LPARAM	lParam_in)
{
#ifndef WIN32
FARPROC		lpProcAbout;
#endif
HDC		hDC;
PAINTSTRUCT	ps;

switch (uiMessage_in)
	{
	case WM_PAINT:
	hDC = BeginPaint(hWindow_in, &ps);
	TextOut(hDC, iX_g, iY_g,
		szMessageBuffer_g, (int)strlen(szMessageBuffer_g));
	EndPaint(hWindow_in, &ps);
	break;

	case WM_COMMAND:
	switch (wParam_in)
		{
		case IDM_ANALDATAFILE:
		getInputFilename(hWindow_in, ANALYSIS_DATA_FILE);
		break;

		case IDM_DICTCODES:
		getInputFilename(hWindow_in, DICTIONARY_CODES_FILE);
		break;

		case IDM_DICTORTHOCHANGE:
		getInputFilename(hWindow_in, DICTIONARY_ORTHOCHANGE_FILE);
		break;

		case IDM_DICTIONARY:
		getInputFilename(hWindow_in, DICTIONARY_FILE);
		break;

		case IDM_TEXTCTL:
		getInputFilename(hWindow_in, TEXT_CONTROL_FILE);
		break;

		case IDM_ANAFILE:
		getOutputFilename(hWindow_in, ANALYSIS_OUTPUT_FILE);
		break;

		case IDM_LOGFILE:
		getOutputFilename(hWindow_in, LOG_FILE);
		break;

		case IDM_DICTOUTFILE:
		getOutputFilename(hWindow_in, DICTIONARY_OUTPUT);
		break;

		case IDM_INPUTFILE:
		getInputFilename(hWindow_in, INPUT_TEXT_FILE);
		if (szAnalysisOutputFile_g[0] == NUL)
			setDefaultOutputFile(hWindow_in, ANALYSIS_OUTPUT_FILE,
					 ".PAR");
		if (szLogFile_g[0] == NUL)
			setDefaultOutputFile(hWindow_in, LOG_FILE, ".LOG");
		break;

		case IDM_EXIT:
		DestroyWindow(hWindow_in);
		break;

		case IDM_PROCESS:
		processData(hWindow_in);
		break;

		case IDM_ABOUT:
#ifdef WIN32
		/* this isn't important enough for me to waste time on!! - SRMc */
#else
		lpProcAbout = MakeProcInstance(About, hInstance_g);
		DialogBox(hInstance_g, "AboutBox", hWindow_in, lpProcAbout);
		FreeProcInstance(lpProcAbout);
#endif
		break;

		default:
		break;
		}
	break;

	case WM_DESTROY:
	PostQuitMessage(0);
	break;

	default:
	return DefWindowProc(hWindow_in, uiMessage_in, wParam_in, lParam_in);
	}
return 0;
}

/*****************************************************************************
 * NAME
 *    WinMain
 * DESCRIPTION
 *    main procedure for a Windows program
 * RETURN VALUE
 *    the return value of the PostQuitMessage function if successful, or NULL
 *    if it terminates before entering the message loop
 */
int PASCAL WinMain(hInstance_in, hPrevInstance_in, lpszCmdLine_in, iCmdShow_in)
HINSTANCE hInstance_in;
HINSTANCE hPrevInstance_in;
LPSTR     lpszCmdLine_in;
int       iCmdShow_in;
{
MSG		msg;
HANDLE		hMemory;
PWNDCLASS	pWndClass;
BOOL		bSuccess;
int		i;

if (hPrevInstance_in)
	{
	wsprintf(szMessageBuffer_g, "Instance already running");
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	return 0;
	}

hMemory = LocalAlloc(LPTR, sizeof(WNDCLASS));
pWndClass = (PWNDCLASS) LocalLock(hMemory);
pWndClass->hCursor = LoadCursor(NULL, IDC_ARROW);
pWndClass->hIcon = LoadIcon(NULL, IDI_APPLICATION);
pWndClass->lpszMenuName =  "Menu";
pWndClass->lpszClassName = "WLLAmple";
pWndClass->hbrBackground = GetStockObject(WHITE_BRUSH);
pWndClass->hInstance = hInstance_in;
pWndClass->style = 0;
pWndClass->lpfnWndProc = AmpleWndProc;

bSuccess = RegisterClass(pWndClass);

LocalUnlock(hMemory);
LocalFree(hMemory);
if (!bSuccess)
	{
	wsprintf(szMessageBuffer_g, "Cannot register class");
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	return 0;
	}

hInstance_g = hInstance_in;

hWindow_g = CreateWindow("WLLAmple",
			"WLLAmple",
			WS_OVERLAPPEDWINDOW,
			CW_USEDEFAULT,
			CW_USEDEFAULT,
			CW_USEDEFAULT,
			CW_USEDEFAULT,
			NULL,
			NULL,
			hInstance_in,
			NULL);

if (!hWindow_g)
	{
	wsprintf(szMessageBuffer_g, "Cannot create window");
	MessageBox(0, szMessageBuffer_g, szAppName_g, MB_OK | MB_ICONEXCLAMATION);
	return 0;
	}

ShowWindow(hWindow_g, iCmdShow_in);
UpdateWindow(hWindow_g);
/*
 *  Get an hourglass cursor to use during file transfers
 */
hHourGlass_g = LoadCursor(NULL, IDC_WAIT);
/*
 *  fill in non-variant fields of OPENFILENAME structure
 */
sOFN_g.lStructSize       = sizeof(OPENFILENAME);
sOFN_g.hwndOwner         = hWindow_g;
sOFN_g.lpstrFilter       = szFilterSpec_g;
sOFN_g.lpstrCustomFilter = szCustFilterSpec_g;
sOFN_g.nMaxCustFilter    = MAXCUSTFILTER;
sOFN_g.nMaxFile          = MAXFILENAME;
sOFN_g.lpstrInitialDir   = szPathName_g;
sOFN_g.Flags             = 0L;
sOFN_g.lpfnHook          = NULL;
sOFN_g.lpstrFile         = szFilename_g;
/*
 *  write the file titles to the window
 */
for ( i = 0 ; i < NUMBER_OF_FILES ; ++i )
	{
	wsprintf(szMessageBuffer_g, "%s:", apszFileTitle_g[i]);
	writeMessage(hWindow_g, 1, aiTop_g[i], szMessageBuffer_g);
	}
/*
 *  process the user input
 */
while (GetMessage(&msg, 0, 0, 0))
	{
	TranslateMessage(&msg);
	DispatchMessage(&msg);
	}
return (int)(msg.wParam);
}
/*
  File settings for GNU Emacs (Please leave for Steve McConnel's sake!)
  Local Variables:
  mode:C
  compile-command:"nmake -f wllample.mak \"CFG=wllample - Win32 Debug\""
  End:
 */
