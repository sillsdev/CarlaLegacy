// toy program for testing the AMPLE DLL (ampledll.c)
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

HINSTANCE   hAmpleLib_g = 0;

#ifdef _DEBUG
#define DLL_FILE "c:/opac/src/ample/DllDebug/ample320.dll"
#else
#define DLL_FILE "ample320.dll"
#endif

const char *	pszLogFile_g     = "c:/opac/src/ample/test/dlltest.log";

AmpleSetup *	pHgAmple_g = NULL;
const char *	apszHgControlFiles_g[4] = {
	"c:/opac/src/ample/test/hg/hgad01.ctl",	/* analysis data */
	"c:/opac/src/ample/test/hg/hgancd.tab",	/* dict codes */
	NULL,					/* dict orthochange */
	"c:/opac/src/ample/test/hg/hgintx.ctl"	/* text input */
};
const char *	apszHgDictFiles_g[8] = {
	NULL,					/* prefix */
	NULL,					/* infix */
	"c:/opac/src/ample/test/hg/hgsf01.dic",	/* suffix */
	"c:/opac/src/ample/test/hg/hgrt01.dic",	/* root */
	"c:/opac/src/ample/test/hg/hgrtbn.dic",
	"c:/opac/src/ample/test/hg/hgrtnr.dic",
	"c:/opac/src/ample/test/hg/hgrtsp.dic",
	NULL
};
const char *	pszHgInputFile_g   = "c:/opac/src/ample/test/hg/hgtest.txt";
const char *	pszHgOutputFile_g  = "c:/opac/src/ample/test/hg/hgtest.ana";
const char *	pszHgWord_g        = "allchakaachimanqa";

AmpleSetup *	pSbAmple_g = NULL;
const char *	apszSbControlFiles_g[4] = {
	"c:/opac/src/ample/test/sb/sbad01.ctl",	/* analysis data */
	"c:/opac/src/ample/test/sb/sbancd.tab",	/* dict codes */
	NULL,					/* dict orthochange */
	"c:/opac/src/ample/test/sb/sbintx.ctl"	/* text control */
};
const char *	apszSbDictFiles_g[5] = {
	"c:/opac/src/ample/test/sb/sbpf01.dic",	/* prefix */
	"c:/opac/src/ample/test/sb/sbif01.dic",	/* infix */
	"c:/opac/src/ample/test/sb/sbsf01.dic",	/* suffix */
	"c:/opac/src/ample/test/sb/sbrt01.dic",	/* root */
	NULL
};
const char *	pszSbInputFile_g   = "c:/opac/src/ample/test/sb/sbtest.txt";
const char *	pszSbOutputFile_g  = "c:/opac/src/ample/test/sb/sbtest.ana";
const char *	pszSbWord_g        = "maganday";

AmpleSetup *	pLouAmple_g = NULL;
const char *	apszLouControlFiles_g[4] = {
	"c:/opac/src/ample/test/lou/louad.ctl",	/* analysis data */
	"c:/opac/src/ample/test/lou/loucd.tab",	/* dict codes */
	"c:/opac/src/ample/test/lou/louordc.tab",	/* dict orthochange */
	"c:/opac/src/ample/test/lou/louintx.ctl"	/* text control */
};
const char *	apszLouDictFiles_g[5] = {
	NULL,					/* prefix */
	NULL,					/* infix */
	"c:/opac/src/ample/test/lou/lousf.dic",	/* suffix */
	"c:/opac/src/ample/test/lou/lourt.dic",	/* root */
	NULL
};
const char *	pszLouInputFile_g   = "c:/opac/src/ample/test/lou/loutest.txt";
const char *	pszLouOutputFile_g  = "c:/opac/src/ample/test/lou/loutest.ana";
const char *	pszLouWord_g        = "mangatan";

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
setAllocMemoryTracing("ampledll.mem");
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

assert(pfAmpleCreateSetup_g);
assert(pfAmpleDeleteSetup_g);
assert(pfAmpleReset_g);
assert(pfAmpleLoadControlFiles_g);
assert(pfAmpleLoadDictionary_g);
assert(pfAmpleParseFile_g);
assert(pfAmpleParseText_g);
assert(pfAmpleSetParameter_g);

// truncate the log file
FILE * fp = fopen(pszLogFile_g, "w");
if (fp != NULL)
	fclose(fp);
//
//  1. create the first AMPLE setup
//  2. load the control files for the first AMPLE setup
//  3. load the dictionaries for the first AMPLE setup
//  4. parse the text file for the first AMPLE setup
//  5. parse the word for the first AMPLE setup
//  6. reset the data in the first AMPLE setup
//  7. delete the first AMPLE setup
//  8. create the second AMPLE setup
//  9. load the control files for the second AMPLE setup
// 10. load the dictionaries for the second AMPLE setup
// 11. parse the text file for the second AMPLE setup
// 12. parse the word for the second AMPLE setup
// 13. reset the data in the second AMPLE setup
// 14. delete the second AMPLE setup
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
pSbAmple_g = (*pfAmpleCreateSetup_g)();
loadControlFiles(pSbAmple_g,
		 apszSbControlFiles_g,
		 pszLogFile_g);
loadDictionaries(pSbAmple_g,
		 apszSbDictFiles_g);
parseFile(pSbAmple_g,
	  pszSbInputFile_g,
	  pszSbOutputFile_g);
parseWord(pSbAmple_g,
	  pszSbWord_g);
removeSetup(pSbAmple_g);
pSbAmple_g = 0;
pLouAmple_g = (*pfAmpleCreateSetup_g)();
loadControlFiles(pLouAmple_g,
		 apszLouControlFiles_g,
		 pszLogFile_g);
loadDictionaries(pLouAmple_g,
		 apszLouDictFiles_g);
parseFile(pLouAmple_g,
	  pszLouInputFile_g,
	  pszLouOutputFile_g);
parseWord(pLouAmple_g,
	  pszLouWord_g);
removeSetup(pLouAmple_g);
pLouAmple_g = 0;
//
//  1. create the first AMPLE setup
//  2. create the second AMPLE setup
//  3. load the control files for the first AMPLE setup
//  4. load the control files for the second AMPLE setup
//  5. load the dictionaries for the first AMPLE setup
//  6. load the dictionaries for the second AMPLE setup
//  7. parse the text file for the first AMPLE setup
//  8. parse the text file for the second AMPLE setup
//  9. parse the word for the first AMPLE setup
// 10. reset the data in the first AMPLE setup
// 11. delete the first AMPLE setup
// 12. parse the word for the second AMPLE setup
// 13. reset the data in the second AMPLE setup
// 14. delete the second AMPLE setup
//
pHgAmple_g = (*pfAmpleCreateSetup_g)();
pSbAmple_g = (*pfAmpleCreateSetup_g)();
pLouAmple_g = (*pfAmpleCreateSetup_g)();
loadControlFiles(pHgAmple_g, apszHgControlFiles_g, pszLogFile_g);
loadControlFiles(pSbAmple_g, apszSbControlFiles_g, pszLogFile_g);
loadControlFiles(pLouAmple_g, apszLouControlFiles_g, pszLogFile_g);
loadDictionaries(pHgAmple_g, apszHgDictFiles_g);
loadDictionaries(pSbAmple_g, apszSbDictFiles_g);
loadDictionaries(pLouAmple_g, apszLouDictFiles_g);
parseFile(pHgAmple_g, pszHgInputFile_g, pszHgOutputFile_g);
parseFile(pSbAmple_g, pszSbInputFile_g, pszSbOutputFile_g);
parseFile(pLouAmple_g, pszLouInputFile_g, pszLouOutputFile_g);
parseWord(pHgAmple_g, pszHgWord_g);
removeSetup(pHgAmple_g);
pHgAmple_g = 0;
parseWord(pSbAmple_g, pszSbWord_g);
removeSetup(pSbAmple_g);
pSbAmple_g = 0;
parseWord(pLouAmple_g, pszLouWord_g);
removeSetup(pLouAmple_g);
pLouAmple_g = 0;

FreeLibrary(hAmpleLib_g);
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    loadControlFiles
// DESCRIPTION
//    load the control files for the given AMPLE setup
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
//    load the dictionary files for the given AMPLE setup
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
//    parseFile
// DESCRIPTION
//    parse the words in the given file using the given AMPLE setup
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
//    parse the given word using the given AMPLE setup
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
//    reset and then delete an AMPLE setup
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
