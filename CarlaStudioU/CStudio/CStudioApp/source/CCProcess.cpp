//test
// CCProcess.cpp: implementation of the CCCProcess class.
//
//////////////////////////////////////////////////////////////////////
// 2.0.2 19-Jan-2000 hab Fix memory leaks

#include "stdafx.h"
#include "CCProcess.h"

#include <strstrea.h>
#include <fstream.h>
#include "DlgCCProcess.h"
#include "SFMFile.h"
#include "ModelFilesSet.h" // for accessing list of dicts
#include "processOutput.h"
#include <io.h>
#include "processStatus.h"


#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif


extern "C"
{
int WINAPI CCLoadTable(char *lpszCCTableFile,
					   HANDLE* hpLoadHandle,
					   HINSTANCE hParent);

int WINAPI  CCProcessFile (HANDLE hProFileHandle,
						   char *lpInputFile, char *lpOutputFile,
						   BOOL bAppendOutput);

int WINAPI CCUnloadTable(HANDLE hUnlHandle);

int WINAPI CCReinitializeTable(HANDLE hReHandle);
}

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
IMPLEMENT_DYNCREATE(CCCProcess, CDLLProcess);


CCCProcess::~CCCProcess()
{
	if(m_hCCEnvironment)
		unloadTable();

	if(m_pLogOut)
		delete m_pLogOut;
}

CCCProcess::CCCProcess()
:CDLLProcess(),
	m_hCCEnvironment(NULL) ,
	m_pLogOut(NULL)
///	m_funcCCProcessFile(NULL)
{
	setDefaultValues();
/*
	WIN32_FIND_DATA findFileData;
	HANDLE hFileInfo = FindFirstFile( "CC32.DLL", &findFileData);
	BOOL bFound = (INVALID_HANDLE_VALUE != hFileInfo);
	if (!bFound)
	{	AfxMessageBox("Couldn't find C32.DLL");
		return;
	}

	HINSTANCE hDLL = LoadLibrary(findFileData.cFileName);
	if(!hDLL)
	{ AfxMessageBox("Found, but couldn't load C32.DLL");
		return;
	}


	m_funcCCLoadTable	= GetProcAddress(hDLL, "CCLoadTable");
	m_funcCCProcessFile	= GetProcAddress(hDLL, "CCProcessFile");
	m_funcCCUnloadTable = GetProcAddress(hDLL, "CCUnloadTable");

	if(!m_funcCCLoadTable || !m_funcCCProcessFile || !m_funcCCUnloadTable)
	{	AfxMessageBox("Found DLL but couldn't retrieve function pointers.");
		return;
	}
*/
}


// called by CProcess constructor
// even if the values will be read in, we need this in case some values are
// missing (as will happen when the user is upgrading to a new version)
void CCCProcess::setDefaultValues()
{
	m_iFileType = kText;
}

void CCCProcess::readParametersFromSFMFile(SFMFile *f)
{
	setDefaultValues();
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here
	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker==_T("-Process"))
			break;
		else checkAndReadInt("FileType",m_iFileType)
		else checkAndReadString("Name", m_sName)
		else checkAndReadString("Description", m_sDescription)
		else checkAndReadString("TablePath", m_sTablePath)
		else
		{
			f->throwParseFailure(_T("CC-Process"), sMarker, sField);
		}
	}
}

void CCCProcess::writeToStream(ostream& fout) const
{
	USES_CONVERSION;
	fout << "\\+Process " << ID() << PROC_ENABLED_STATUS <<"\n";
	fout << "\\Name " << T2CA(m_sName) << "\n";
	fout << "\\Description " << T2CA(m_sDescription) << "\n";
	fout << "\\FileType " << m_iFileType << "\n";
	fout << "\\TablePath " << T2CA(m_sTablePath) << "\n";
	fout << "\\-Process " << ID() << "\n";
}

// EXCEPTIONS: CProcessFailure
void CCCProcess::processInterlinearFile(CProcessStatus& status)
{
	try
	{
		// using the sRAWPath here instead of the input file root should allow
		// us to feed on cc-process into another directly
		CString sBaseName = getFileName(status.sRAWPath) + _T("-cc");
		beforeProcessing(status, sBaseName); 	// load the table and open the log file

		CPathDescriptor sOutputPath = status.makeTempPath(sBaseName,_T(".itx"));
		sOutputPath.deleteFile();

		runCCDLL(status.sInterlinearPath, sOutputPath);

		if(!sOutputPath.fileExistsAndIsClosed())
			throw(CProcessFailure(this, _T("CC did not produce the expected file.  Check the log for more information.")));

		// register ana file so the user can view it
		CResultStreamFile* outStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												_T("Interlinear text from CC"), //short description
												_T("Interlinear text produced by CC Processor"), // long description
												_T("CC Itx") // tab label
											),
					sOutputPath.getFullPath(),
					status.getOutputLang());

					status.registerResultStream(outStream);
		afterProcessing(status);
		status.sInterlinearPath = sOutputPath; // this will feed the next pass through
	}
	catch(CProcessFailure failure)
	{
		afterProcessing(status);
		throw(failure);
	}
	catch(CString sError)
	{
		afterProcessing(status);
		throw(CProcessFailure(this, sError));
	}
}


// EXCEPTIONS: CProcessFailure
void CCCProcess::processRAWTextFile(CProcessStatus& status)
{
	try
	{
		// using the sRAWPath here instead of the input file root should allow
		// us to feed on cc-process into another directly
		CString sBaseName = getFileName(status.sRAWPath) + _T("-cc");
		beforeProcessing(status, sBaseName); 	// load the table and open the log file

		CPathDescriptor sOutputPath = status.makeTempPath(sBaseName,_T(".txt"));
		sOutputPath.deleteFile();

		runCCDLL(status.sRAWPath, sOutputPath);

		if(!sOutputPath.fileExistsAndIsClosed())
			throw(CProcessFailure(this, _T("CC did not produce the expected file.  Check the log for more information.")));

		// register ana file so the user can view it
		CResultStreamFile* outStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												_T("Text from CC"), //short description
												_T("Text produced by CC Processor"), // long description
												_T("CC Txt") // tab label
											),
					sOutputPath.getFullPath(),
					status.getInputLang());	// <-- should this be output lang some times? how do I know?
		status.registerResultStream(outStream);
		afterProcessing(status);
		status.sRAWPath = sOutputPath; // this will feed the next pass through
	}
	catch(CProcessFailure failure)
	{
		afterProcessing(status);
		throw(failure);
	}
	catch(CString sError)
	{
		afterProcessing(status);
		throw(CProcessFailure(this, sError));
	}
}

// EXCEPTIONS: CProcessFailure
void CCCProcess::processDictionaries(CProcessStatus& status)
{	try
	{
		CModelFilesSet* pSourceMFS = status.getInputMFS();
		ASSERT(pSourceMFS);

		// do we operate on the src dicts or target dicts?
		CTypedPtrArray<CPtrArray, CPathDescriptor*>* pRootUnifiedDicts;
		CString sLogBase;
		switch(status.m_iCurrentSeqFunction)
		{
			case CProcess::kAnalysis:
				pRootUnifiedDicts = & status.m_pSrcDicts;
				if((*pRootUnifiedDicts).GetSize()==0)
					throw CProcessFailure(this, _T("There were source dictionaries specified"));
				sLogBase = _T("anal-dicts-") + getFileName(m_sTablePath);
				break;
			case CProcess::kSynthesis:
				pRootUnifiedDicts = & status.m_pTarDicts;
				if((*pRootUnifiedDicts).GetSize()==0)
					throw CProcessFailure(this, _T("There were target dictionaries specified"));
				sLogBase = _T("synth-dicts-") + getFileName(m_sTablePath);
			break;
			default: // the user should never be able to make this happen
				throw CProcessFailure(this, _T("When processing dictionaries, CC should only be included as part of the analysis or synthesis sequences."));
		}

		beforeProcessing(status, sLogBase); 	// load the table and open the log file

		for(int iRootFileIndex = 0; iRootFileIndex< (*pRootUnifiedDicts).GetSize(); iRootFileIndex++)
		{
			CString sBaseName = (*pRootUnifiedDicts)[iRootFileIndex]->getFileName()+  _T("-cc");

			CPathDescriptor sOutputPath = status.makeTempPath(sBaseName,_T(".dic"));
			sOutputPath.deleteFile();

			runCCDLL(*(*pRootUnifiedDicts)[iRootFileIndex], sOutputPath);

			if(!sOutputPath.fileExistsAndIsClosed())
				throw(CProcessFailure(this, _T("CC did not produce the expected file.  Check the log for more information.")));

			// register this new dict so that the next process uses it
			(*(*pRootUnifiedDicts)[iRootFileIndex]) = sOutputPath;
		}

		afterProcessing(status);	// unload the cc table and close the log file
	}
	catch(CProcessFailure failure)
	{
		afterProcessing(status);
		throw(failure);
	}
	catch(CString sError)
	{
		afterProcessing(status);
		throw(CProcessFailure(this, sError));
	}
}


// EXCEPTIONS: CProcessFailure
void CCCProcess::processANAFile(CProcessStatus& status)
{
	CPathDescriptor sLOGPath ;
	try
	{
		// using the sRAWPath here instead of the input file root should allow
		// us to feed on cc-process into another directly
		CString sBaseName = getFileName(status.sANAPath) + _T("-cc");

		CPathDescriptor sOutputANAPath = status.makeTempPath(sBaseName,_T(".ana"));
		sOutputANAPath.deleteFile();


		beforeProcessing(status, sBaseName);	// load the table and open the log file

		// PUT CC CALL HERE

		runCCDLL(status.sANAPath, sOutputANAPath);

		if(!sOutputANAPath.fileExistsAndIsClosed())
			throw(CProcessFailure(this, _T("CC did not produce the expected ana file.  Check the log for more information.")));

		// register ana file so the user can view it
		CResultStreamFile* anaStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												_T("ANA from CC"), //short description
												_T("ANA produced by CC Processor"), // long description
												_T("CC ANA") // tab label
											),
					sOutputANAPath.getFullPath(),
					status.getInputLang());	// <-- should this be output lang some times? how do I know?

		status.registerResultStream(anaStream);

		afterProcessing(status);

		status.sANAPath = sOutputANAPath; // this will feed the next pass through
	}
	catch(CProcessFailure failure)
	{
		afterProcessing(status);
		throw(failure);
	}
	catch(CString sError)
	{
		afterProcessing(status);
		throw(CProcessFailure(this, sError));
	}
}


// iFunctionCode unused by this subclass
BOOL CCCProcess::doEditDialog(int iFunctionCode)
{
	CDlgCCProcess dlg;

	// Load in all our settings
	dlg.m_sName = m_sName;
	dlg.m_sDescription = m_sDescription;
	dlg.m_sTablePath = m_sTablePath;
	dlg.m_iFileType = m_iFileType;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_sName = dlg.m_sName;
	m_sDescription = dlg.m_sDescription;
	m_sTablePath = dlg.m_sTablePath;
	m_iFileType = dlg.m_iFileType;

	return TRUE;
}

PROCESS_FILE_TYPE CCCProcess::getInputType()
{
	switch(m_iFileType)
	{
		case kText: return RAWTEXT; break;
		case kDicts: return DICT; break;
		case kANA: return ANA; break;
		case kInterlinear: return INTERLINEAR; break;
		default: ASSERTX(FALSE); return RAWTEXT; break;
	}
	return RAWTEXT;
}

PROCESS_FILE_TYPE CCCProcess::getOutputType()
{
	switch(m_iFileType)
	{
		case kText: return RAWTEXT; break;
		case kDicts: return DICT; break;
		case kANA: return ANA; break;
		case kInterlinear: return INTERLINEAR; break;
		default: ASSERTX(FALSE); return RAWTEXT; break;
	}
	return RAWTEXT;
}


//	static
LPCTSTR CCCProcess::INPUT_TYPE_DISPLAY()
{	return _T("Various");
}
LPCTSTR CCCProcess::OUTPUT_TYPE_DISPLAY()
{	return _T("Various");
}

// This should be preceed by beforeProcessing() and followed by endProcessing().
// In between these calls, it can be called repeatedly with different files.
void CCCProcess::runCCDLL(CPathDescriptor& inPath, CPathDescriptor& outPath)
{
	ASSERTX(m_hCCEnvironment);

	if(!inPath.fileExists())
	{
		CString s;
		s.Format(_T("The input file %s could not be found or opened"), (LPCTSTR)inPath.getQuotedPath());
		throw CProcessFailure(this, s);
	}

	// in case we're calling this repeatedly (as for dictionaries)
	CCReinitializeTable(m_hCCEnvironment);


	ASSERTX(outPath.getFullPath().GetLength());
	ASSERTX(m_pLogOut);

#ifndef rde270
	USES_CONVERSION;
	LPCSTR lpszInPath = T2CA(inPath.getFullPath());
	LPCSTR lpszOutPath = T2CA(outPath.getFullPath());

	*m_pLogOut << "Processing " << lpszInPath << " with " << T2CA(m_sTablePath) << "...";

	LPSTR lpszIn = new char[strlen(lpszInPath) + 1];
	strcpy(lpszIn, lpszInPath);
	LPSTR lpszOut = new char[strlen(lpszOutPath) + 1];
	strcpy(lpszOut, lpszOutPath);
	int iResult =  CCProcessFile (m_hCCEnvironment,
						   lpszIn,
						   lpszOut,
						   FALSE);
#else   // rde270
	*m_pLogOut << "Processing " << inPath.getFullPath() << " with " << m_sTablePath << "...";

	char* lpszIn = new char[inPath.getFullPath().GetLength() + 1];
	strcpy(lpszIn, inPath.getFullPath());
	char* lpszOut = new char[outPath.getFullPath().GetLength() + 1];
	strcpy(lpszOut, outPath.getFullPath());
	int iResult =  CCProcessFile (m_hCCEnvironment,
						   lpszIn,
						   lpszOut,
						   FALSE);
#endif  // rde270

	if(iResult)
	{
		*m_pLogOut << "Failed.  CC DLL returned error code " << iResult << "\n";
		CString s;
		s.Format(_T("CC couldn't process the file: %s"), (LPCTSTR)inPath.getFullPath());
#ifndef hab202
		delete lpszIn;	// clean up memory
		delete lpszOut;
#endif // hab202
		throw CProcessFailure(this, s);
	}
	*m_pLogOut << "Done.\n";
#ifndef hab202
	delete lpszIn;		// clean up memory
	delete lpszOut;
#endif // hab202
}

void CCCProcess::unloadTable()
{
	// don't assert because a failure to parse the table will give an empty handle
	//ASSERT(m_hCCEnvironment);
	if(m_hCCEnvironment)
		CCUnloadTable(m_hCCEnvironment);
	m_hCCEnvironment = NULL;
}

// load the table and open the log file
void CCCProcess::beforeProcessing(CProcessStatus& status, CString & sBaseName)
{
	//---- SETUP THE LOG FILE, WHICH WE WRITE TO, NOT THE CC-DLL

	m_sLogPath = status.makeTempPath(sBaseName, _T(".log"));
	m_sLogPath.deleteFile();
	USES_CONVERSION;
	m_pLogOut = new ofstream(T2CA(m_sLogPath.getFullPath()));
	ASSERTX(m_pLogOut);
	if(!m_pLogOut->is_open())
	{
		CString s;
		s.Format(_T("Could not open log file  \"%s\" "), (LPCTSTR)m_sLogPath.getFullPath());
		throw CProcessFailure(this, s);
	}


	//---- LOAD THE CC TABLE INTO THE DLL BUFFER

	if(_taccess(m_sTablePath, 04))	// read permission
	{
		CString s;
		s.Format(_T("The CC-Table \"%s\" could not be found or opened"), (LPCTSTR)m_sTablePath);
		throw CProcessFailure(this, s);
	}

#ifndef rde270
	LPCSTR lpszTablePath = T2CA(m_sTablePath);
	LPSTR lpsz = new char[strlen(lpszTablePath) + 1];
	strcpy(lpsz, lpszTablePath);
#else
	char* lpsz = new char[m_sTablePath.GetLength() + 1];
	strcpy(lpsz, m_sTablePath);
#endif
	int iResult = CCLoadTable(lpsz, //char *lpszCCTableFile,
					   &m_hCCEnvironment,
					  AfxGetInstanceHandle()); // HINSTANCE hParent
	if(iResult)
	{
		*m_pLogOut << "While loading table, CC DLL returned error code " << iResult << "\n";
#ifndef hab202
		delete lpsz;	// clean up memory
#endif // hab202
		CString s;
		s.Format(_T("CC couldn't load the table: %s"), (LPCTSTR)m_sTablePath);
		throw CProcessFailure(this, s);
	}
#ifndef hab202
	delete lpsz;		// clean up memory
#endif // hab202
}
void CCCProcess::afterProcessing(CProcessStatus& status)
{
	//---- CLOSE AND REGISTER THE LOG FILE, WHICH WE WRITE TO, NOT THE CC-DLL

	if(m_pLogOut)
		delete m_pLogOut;	// close the file
	m_pLogOut = NULL;

	registerLog(status, m_sLogPath);
	m_sLogPath = _T("");

	//---- UNLOAD THE CC TABLE INTO THE DLL BUFFER

	unloadTable();
}
