// toy program for testing the XAMPLE DLL (XAmpledll.c)
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <assert.h>
#include "ampledll.h"
#ifdef _DEBUG
extern "C" {
extern void setAllocMemoryTracing(const char * pszFilename_in);
};
#endif

void testTheDLL(void);
void loadControlFiles(
	AmpleSetup * pSetup_io,
	const char * apszControlFiles_in[],
	const char * pszLogFile_in);
void loadDictionaries(
	AmpleSetup * pSetup_io,
	const char * apszDictFiles_in[]);
void loadGrammarFile(
	AmpleSetup * pSetup_io,
	const char * pszGrammarFile_in);
void parseFile(
	AmpleSetup * pSetup_io,
	const char * pszInputFile_in,
	const char * pszOutputFile_in);
void parseWord(
	AmpleSetup * pSetup_io,
	const char * pszWord_in);
void removeSetup(
	AmpleSetup * pSetup_io);

AMPLEFUNC0  pfAmpleCreateSetup_g      = 0;
AMPLEFUNC1  pfAmpleDeleteSetup_g      = 0;
AMPLEFUNC1  pfAmpleReset_g            = 0;
AMPLEFUNC5  pfAmpleLoadControlFiles_g = 0;
AMPLEFUNC3  pfAmpleLoadDictionary_g   = 0;
AMPLEFUNC3  pfAmpleParseFile_g        = 0;
AMPLEFUNC2  pfAmpleParseText_g        = 0;
AMPLEFUNC3  pfAmpleSetParameter_g     = 0;
AMPLEFUNC2  pfAmpleLoadGrammarFile_g  = 0;

HINSTANCE   hAmpleLib_g = 0;

#ifdef _DEBUG
// #define DLL_FILE "C:/carla/Dev/SOSMirror/pc-parse/ample/Debug-dll/xample.dll"
#define DLL_FILE "Debug-dll/xample.dll"
#else
#define DLL_FILE "xample.dll"
#endif

const char *	pszLogFile_g     = "test/XAmpleDllTest.log";

AmpleSetup *	pHgAmple_g = NULL;
const char *	apszHgControlFiles_g[4] = {
	"test/hg/hgad01.ctl",	/* analysis data */
	"test/hg/hgancd.tab",	/* dict codes */
	NULL,					/* dict orthochange */
	"test/hg/hgintx.ctl"	/* text input */
};
const char *	apszHgDictFiles_g[8] = {
	NULL,					/* prefix */
	NULL,					/* infix */
	"test/hg/hgsf01.dic",	/* suffix */
	"test/hg/hgrt01.dic",	/* root */
	"test/hg/hgrtbn.dic",
	"test/hg/hgrtnr.dic",
	"test/hg/hgrtsp.dic",
	NULL
};
const char *	pszHgInputFile_g   = "test/hg/hgtest.txt";
const char *	pszHgOutputFile_g  = "test/hg/hgtest.ana";
const char *	pszHgWord_g        = "allchakaachimanqa";

AmpleSetup *	pTtAmple_g = NULL;
const char *	apszTtControlFiles_g[4] = {
	"test/tepehua/Ttpatrad.ctl",	/* analysis data */
	"test/tepehua/Ttgecd.tab",	/* dict codes */
	NULL,					/* dict orthochange */
	"test/tepehua/Ttintx.ctl"	/* text control */
};
const char *	apszTtDictFiles_g[5] = {
	"test/tepehua/Ttpf.dic",	/* prefix */
	NULL,			/* infix */
	"test/tepehua/Ttsf.dic",	/* suffix */
	"test/tepehua/Ttrt.dic",	/* root */
	NULL
};
const char *    pszTtGrammarFile_g = "test/tepehua/ttpatr.grm";
const char *	pszTtInputFile_g   = "test/tepehua/Ephtst.txt";
const char *	pszTtOutputFile_g  = "test/tepehua/Ephtst.ana";
const char *	pszTtWord_g        = "klamastak'ayau";

AmpleSetup *	pYalAmple_g = NULL;
const char *	apszYalControlFiles_g[4] = {
	"test/yalalag/Yalad.ctl",	/* analysis data */
	"test/yalalag/Yalcd.tab",	/* dict codes */
	"test/yalalag/Yalordc.tab",	/* dict orthochange */
	"test/yalalag/Yalintx.ctl"	/* text control */
};
const char *	apszYalDictFiles_g[7] = {
	"test/yalalag/Yalpf.dic",	/* prefix */
	NULL,			/* infix */
	"test/yalalag/Yalsf.dic",	/* suffix */
	"test/yalalag/Yalrt.dic",	/* root */
	"test/yalalag/Yalrtbn.dic",	/* root */
	"test/yalalag/Yalloans.dic",	/* root */
	NULL
};
const char *    pszYalGrammarFile_g = "test/yalalag/yalpatr.grm";
const char *	pszYalInputFile_g   = "test/yalalag/Marktest.txt";
const char *	pszYalOutputFile_g  = "test/yalalag/Marktest.ana";
const char *	pszYalWord_g        = "bzorao";

const char * pszResult_g;

///////////////////////////////////////////////////////////////////////////////
// NAME
//    main
// DESCRIPTION
//    the main function of the program
// RETURN VALUE
//    0 if successful, otherwise nonzero
//
int main(int argc, char ** argv)
{
#ifdef _DEBUG
setAllocMemoryTracing("xampledll.mem");
#endif

testTheDLL();
return 0;
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    testTheDLL
// DESCRIPTION
//    load the DLL and put it through its paces (at least to some degree)
// RETURN VALUE
//    none
//
void testTheDLL()
{
hAmpleLib_g = LoadLibrary( DLL_FILE );
assert(hAmpleLib_g);

pfAmpleCreateSetup_g      = (AMPLEFUNC0)GetProcAddress(hAmpleLib_g,
							  "AmpleCreateSetup");
pfAmpleLoadControlFiles_g = (AMPLEFUNC5)GetProcAddress(hAmpleLib_g,
													  "AmpleLoadControlFiles");
pfAmpleReset_g            = (AMPLEFUNC1)GetProcAddress(hAmpleLib_g,
							  "AmpleReset");
pfAmpleLoadDictionary_g   = (AMPLEFUNC3)GetProcAddress(hAmpleLib_g,
							  "AmpleLoadDictionary");
pfAmpleParseFile_g        = (AMPLEFUNC3)GetProcAddress(hAmpleLib_g,
							  "AmpleParseFile");
pfAmpleParseText_g        = (AMPLEFUNC2)GetProcAddress(hAmpleLib_g,
							  "AmpleParseText");
pfAmpleSetParameter_g     = (AMPLEFUNC3)GetProcAddress(hAmpleLib_g,
							  "AmpleSetParameter");
pfAmpleDeleteSetup_g      = (AMPLEFUNC1)GetProcAddress(hAmpleLib_g,
							  "AmpleDeleteSetup");
pfAmpleLoadGrammarFile_g  = (AMPLEFUNC2)GetProcAddress(hAmpleLib_g,
							  "AmpleLoadGrammarFile");

assert(pfAmpleCreateSetup_g);
assert(pfAmpleDeleteSetup_g);
assert(pfAmpleReset_g);
assert(pfAmpleLoadControlFiles_g);
assert(pfAmpleLoadDictionary_g);
assert(pfAmpleParseFile_g);
assert(pfAmpleParseText_g);
assert(pfAmpleSetParameter_g);
assert(pfAmpleLoadGrammarFile_g);

// truncate the log file
FILE * fp = fopen(pszLogFile_g, "w");
if (fp != NULL)
	fclose(fp);
//
//  1. create the first XAMPLE setup
//  2. load the control files for the first XAMPLE setup
//  3. load the dictionaries for the first XAMPLE setup
//  4. parse the text file for the first XAMPLE setup
//  5. parse the word for the first XAMPLE setup
//  6. reset the data in the first XAMPLE setup
//  7. delete the first XAMPLE setup
//  8. create the second XAMPLE setup
//  9. load the control files for the second XAMPLE setup
// 10. load the dictionaries for the second XAMPLE setup
// 11. load the grammar file for the second XAMPLE setup
// 12. parse the text file for the second XAMPLE setup
// 13. parse the word for the second XAMPLE setup
// 14. reset the data in the second XAMPLE setup
// 15. delete the second XAMPLE setup
//
pHgAmple_g = (*pfAmpleCreateSetup_g)();
loadControlFiles(pHgAmple_g,
		 apszHgControlFiles_g,
		 pszLogFile_g);
loadDictionaries(pHgAmple_g,
		 apszHgDictFiles_g);
parseFile(pHgAmple_g,
	  pszHgInputFile_g,
	  pszHgOutputFile_g);
parseWord(pHgAmple_g,
	  pszHgWord_g);
removeSetup(pHgAmple_g);
pHgAmple_g = 0;
pTtAmple_g = (*pfAmpleCreateSetup_g)();
loadControlFiles(pTtAmple_g,
		 apszTtControlFiles_g,
		 pszLogFile_g);
loadDictionaries(pTtAmple_g,
		 apszTtDictFiles_g);
loadGrammarFile(pTtAmple_g,
		pszTtGrammarFile_g);
parseFile(pTtAmple_g,
	  pszTtInputFile_g,
	  pszTtOutputFile_g);
parseWord(pTtAmple_g,
	  pszTtWord_g);
removeSetup(pTtAmple_g);
pTtAmple_g = 0;
pYalAmple_g = (*pfAmpleCreateSetup_g)();
loadControlFiles(pYalAmple_g,
		 apszYalControlFiles_g,
		 pszLogFile_g);
loadDictionaries(pYalAmple_g,
		 apszYalDictFiles_g);
loadGrammarFile(pYalAmple_g,
		pszYalGrammarFile_g);
parseFile(pYalAmple_g,
	  pszYalInputFile_g,
	  pszYalOutputFile_g);
parseWord(pYalAmple_g,
	  pszYalWord_g);
removeSetup(pYalAmple_g);
pYalAmple_g = 0;
//
//  1. create the first XAMPLE setup
//  2. create the second XAMPLE setup
//  3. load the control files for the first XAMPLE setup
//  4. load the control files for the second XAMPLE setup
//  5. load the dictionaries for the first XAMPLE setup
//  6. load the dictionaries for the second XAMPLE setup
//  7. load the grammar file for the first XAMPLE setup
//  8. load the grammar file for the second XAMPLE setup
//  9. parse the text file for the first XAMPLE setup
// 10. parse the text file for the second XAMPLE setup
// 11. parse the word for the first XAMPLE setup
// 12. reset the data in the first XAMPLE setup
// 13. delete the first XAMPLE setup
// 14. parse the word for the second XAMPLE setup
// 15. reset the data in the second XAMPLE setup
// 16. delete the second XAMPLE setup
//
pHgAmple_g = (*pfAmpleCreateSetup_g)();
pTtAmple_g = (*pfAmpleCreateSetup_g)();
pYalAmple_g = (*pfAmpleCreateSetup_g)();
loadControlFiles(pHgAmple_g, apszHgControlFiles_g, pszLogFile_g);
loadControlFiles(pTtAmple_g, apszTtControlFiles_g, pszLogFile_g);
loadControlFiles(pYalAmple_g, apszYalControlFiles_g, pszLogFile_g);
loadDictionaries(pHgAmple_g, apszHgDictFiles_g);
loadDictionaries(pTtAmple_g, apszTtDictFiles_g);
loadDictionaries(pYalAmple_g, apszYalDictFiles_g);
loadGrammarFile(pTtAmple_g, pszTtGrammarFile_g);
loadGrammarFile(pYalAmple_g, pszYalGrammarFile_g);
parseFile(pHgAmple_g, pszHgInputFile_g, pszHgOutputFile_g);
parseFile(pTtAmple_g, pszTtInputFile_g, pszTtOutputFile_g);
parseFile(pYalAmple_g, pszYalInputFile_g, pszYalOutputFile_g);
parseWord(pHgAmple_g, pszHgWord_g);
removeSetup(pHgAmple_g);
pHgAmple_g = 0;
parseWord(pTtAmple_g, pszTtWord_g);
removeSetup(pTtAmple_g);
pTtAmple_g = 0;
parseWord(pYalAmple_g, pszYalWord_g);
removeSetup(pYalAmple_g);
pYalAmple_g = 0;

FreeLibrary(hAmpleLib_g);
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    loadControlFiles
// DESCRIPTION
//    load the control files for the given XAMPLE setup
// RETURN VALUE
//    none
//
void loadControlFiles(
	AmpleSetup *	pSetup_io,
	const char *	apszControlFiles_in[],
	const char *	pszLogFile_in)
{
if (pfAmpleReset_g)
	{
	pszResult_g = (*pfAmpleReset_g)(pSetup_io);
	printf("AmpleReset():\n\t%s\n", pszResult_g);
	}
else
	printf("CANNOT CALL DLL/AmpleReset()\n");

if (pfAmpleSetParameter_g != NULL)
	{
	pszResult_g = (*pfAmpleSetParameter_g)(pSetup_io,
					   "AppendLogFile", "TRUE");
	printf("AmpleSetParameter(\"AppendLogFile\", \"TRUE\"):\n\t%s\n",
	   pszResult_g);
	pszResult_g = (*pfAmpleSetParameter_g)(pSetup_io,
					   "LogFile", pszLogFile_in);
	printf("AmpleSetParameter(\"LogFile\", \"%s\"):\n\t%s\n",
	   pszLogFile_in ? pszLogFile_in : "{NULL}", pszResult_g);
	}
else
	printf("CANNOT CALL DLL/AmpleSetParameter()\n");

if (pfAmpleLoadControlFiles_g != 0)
	{
	pszResult_g = (*pfAmpleLoadControlFiles_g)(pSetup_io,
						apszControlFiles_in[0],
											apszControlFiles_in[1],
											apszControlFiles_in[2],
											apszControlFiles_in[3]);
	printf("AmpleLoadControlFiles():\n\t%s\n", pszResult_g);
	}
else
	printf("CANNOT CALL DLL/AmpleLoadControlFiles()\n");
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    loadDictionaries
// DESCRIPTION
//    load the dictionary files for the given XAMPLE setup
// RETURN VALUE
//    none
//
void loadDictionaries(
	AmpleSetup *	pSetup_io,
	const char *	apszDictFiles_in[])
{
int		i;

if (pfAmpleLoadDictionary_g != 0)
	{
	if (apszDictFiles_in[0] != NULL)
	{
	pszResult_g = (*pfAmpleLoadDictionary_g)(pSetup_io,
						  apszDictFiles_in[0],
						  "P");
	printf("AmpleLoadDictionary(\"%s\",\"P\"):\n\t%s\n",
		   apszDictFiles_in[0], pszResult_g);
	}
	if (apszDictFiles_in[1] != NULL)
	{
	pszResult_g = (*pfAmpleLoadDictionary_g)(pSetup_io,
						  apszDictFiles_in[1],
						  "I");
	printf("AmpleLoadDictionary(\"%s\",\"I\"):\n\t%s\n",
		   apszDictFiles_in[1], pszResult_g);
	}
	if (apszDictFiles_in[2] != NULL)
	{
	pszResult_g = (*pfAmpleLoadDictionary_g)(pSetup_io,
						  apszDictFiles_in[2],
						  "S");
	printf("AmpleLoadDictionary(\"%s\",\"S\"):\n\t%s\n",
		   apszDictFiles_in[2], pszResult_g);
	}
	for ( i = 3 ; apszDictFiles_in[i] ; ++i )
	{
	pszResult_g = (*pfAmpleLoadDictionary_g)(pSetup_io,
						  apszDictFiles_in[i],
						  "R");
	printf("AmpleLoadDictionary(\"%s\",\"R\"):\n\t%s\n",
		   apszDictFiles_in[i], pszResult_g);
	}
	}
else
	printf("CANNOT CALL DLL/AmpleLoadDictionary()\n");
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    loadGrammarFile
// DESCRIPTION
//    load the grammar file for the given XAMPLE setup
// RETURN VALUE
//    none
//
void loadGrammarFile(
	AmpleSetup *	pSetup_io,
	const char *	pszGrammarFile_in)
{
if (pfAmpleLoadGrammarFile_g != 0)
	{
	if (pszGrammarFile_in != NULL)
	{
	pszResult_g = (*pfAmpleLoadGrammarFile_g)(pSetup_io,
						  pszGrammarFile_in);
	printf("AmpleLoadGrammarFile(\"%s\"):\n\t%s\n",
		   pszGrammarFile_in, pszResult_g);
	}
	}
else
	printf("CANNOT CALL DLL/AmpleLoadGrammarFile()\n");
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    parseFile
// DESCRIPTION
//    parse the words in the given file using the given XAMPLE setup
// RETURN VALUE
//    none
//
void parseFile(
	AmpleSetup *	pSetup_io,
	const char *	pszInputFile_in,
	const char *	pszOutputFile_in)
{
if (pfAmpleParseFile_g != NULL)
	{
	pszResult_g = (*pfAmpleParseFile_g)(pSetup_io,
					 pszInputFile_in,
					 pszOutputFile_in);
	printf("AmpleParseFile(\"%s\",\"%s\"):\n\t%s\n",
	   pszInputFile_in, pszOutputFile_in, pszResult_g);
	}
else
	printf("CANNOT CALL DLL/AmpleParseFile()\n");
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    parseWord
// DESCRIPTION
//    parse the given word using the given XAMPLE setup
// RETURN VALUE
//    none
//
void parseWord(
	AmpleSetup *	pSetup_io,
	const char *	pszWord_in)
{
if (pfAmpleParseText_g != NULL)
	{
	pszResult_g = (*pfAmpleParseText_g)(pSetup_io,
					 pszWord_in);
	printf("AmpleParseText(\"%s\"):\n%s\n",
	   pszWord_in, pszResult_g);
	}
else
	printf("CANNOT CALL DLL/AmpleParseText()\n");
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    removeSetup
// DESCRIPTION
//    reset and then delete an XAMPLE setup
// RETURN VALUE
//    none
//
void removeSetup(
	AmpleSetup * pSetup_io)
{
if (pfAmpleReset_g != NULL)
	{
	pszResult_g = (*pfAmpleReset_g)(pSetup_io);
	printf("AmpleReset():\n\t%s\n", pszResult_g);
	}
if (pfAmpleDeleteSetup_g != NULL)
	{
	pszResult_g = (*pfAmpleDeleteSetup_g)(pSetup_io);
	printf("AmpleDeleteSetup():\n\t%s\n", pszResult_g);
	}
}

/*
  File settings for GNU Emacs (Please leave for Steve McConnel's sake!)
  Local Variables:
  mode:C++
  compile-command:"nmake -f testdll.mak \"CFG=testdll - Win32 Debug\""
  End:
 */
