// BatchProcess.cpp: implementation of the CBatchProcess class.
//
// 2.1.0 06-Mar-2000 hab Initial coding
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "BatchProcess.h"

#include <strstrea.h>
#include <fstream.h>
#include "DlgBatchProcess.h"
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

LPCTSTR kpszFailure = _T("Batch process did not produce the expected ana file.  Check the log for more information.");

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
IMPLEMENT_DYNCREATE(CBatchProcess, CDOSProcess);


CBatchProcess::~CBatchProcess()
{
	if(m_pLogOut)
		delete m_pLogOut;
}

CBatchProcess::CBatchProcess()
:CDOSProcess(),
	m_pLogOut(NULL)
{
	setDefaultValues();
}


// called by CProcess constructor
// even if the values will be read in, we need this in case some values are
// missing (as will happen when the user is upgrading to a new version)
void CBatchProcess::setDefaultValues()
{
	m_iFileType = kNone;
}

void CBatchProcess::readParametersFromSFMFile(SFMFile *f)
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
		else checkAndReadString("BatchPath", m_sBatchPath)
		else
		{
			f->throwParseFailure(_T("Batch-Process"), sMarker, sField);
		}
	}
}

void CBatchProcess::writeToStream(ostream& fout) const
{
	USES_CONVERSION;
	fout << "\\+Process " << ID() << PROC_ENABLED_STATUS <<"\n";
	fout << "\\Name " << T2CA(m_sName) << "\n";
	fout << "\\Description " << T2CA(m_sDescription) << "\n";
	fout << "\\FileType " << m_iFileType << "\n";
	fout << "\\BatchPath " << T2CA(m_sBatchPath) << "\n";
	fout << "\\-Process " << ID() << "\n";
}

LPCTSTR CBatchProcess::getToolPath()
{
	return m_sBatchPath;
}

CString CBatchProcess::getBatchName(CProcessStatus& status)
{
	CString sBatchFile;
	sBatchFile.Format(_T("%s Batch%d"),
			  (LPCTSTR)status.getInputMFS()->getAbrev(),
			  status.m_iProcNumber);
	return sBatchFile;
}


CString CBatchProcess::getCommandLine(CProcessStatus& status)
{
	// note: the default directory will be set the dir containing the source file
	//       so that doesn't need to be specified

	strstream sout;

#ifdef ORIG
	if (m_iFileType != kNone)
	  {
		sout << m_sInPath.getShortPath() << ' ';
		sout << m_sOutPath.getQuotedPath() << ' ';
		sout << m_sLogPath.getQuotedPath();
	  }
	switch(m_iFileType)
	  {
	  case kNone:  sout << m_sOutPath.getQuotedPath() << ' '; break;
	  case kText:  checkInPathValidity(m_sInPath, "Text"); break;
	  case kDicts: checkInPathValidity(m_sInPath, "Dictionary"); break;
	  case kANA:   checkInPathValidity(m_sInPath, "ANA"); break;
	  case kInterlinear: checkInPathValidity(m_sInPath, "Interlinear"); break;
	  default: ASSERTX(FALSE); break;
	  }
#else // ORIG
	USES_CONVERSION_U8;
	sout << T2CA(m_sInPath.getQuotedPath()) << ' ';
	sout << T2CA(m_sOutPath.getQuotedPath());
#ifndef rde271c
	sout << ' ' << T2CA(m_sLogPath.getQuotedPath());
#endif  // rde271c
	switch(m_iFileType)
	  {
	  case kNone:  break;
	  case kText:  checkInPathValidity(m_sInPath, _T("Text")); break;
	  case kDicts: checkInPathValidity(m_sInPath, _T("Dictionary")); break;
	  case kANA:   checkInPathValidity(m_sInPath, _T("ANA")); break;
	  case kInterlinear: checkInPathValidity(m_sInPath, _T("Interlinear")); break;
	  default: ASSERTX(FALSE); break;
	  }
#endif // ORIG

#ifndef rde270
	// I'm just not sure if sout.str is going to be null terminated, so do it the long way.
	int nLen = sout.pcount();
	char* pSout = (char*)alloca(nLen + 1);
	strncpy(pSout, sout.str(), nLen);
	pSout[nLen] = '\0';
	CString s(U82CT(pSout));
#else   // rde270
	CString s(sout.str(), sout.pcount());
#endif  // rde270
	sout.rdbuf()->freeze(0); // else get a memory leak

	return s;
}

// EXCEPTIONS: CProcessFailure
void CBatchProcess::processInterlinearFile(CProcessStatus& status)
{
	try
	{
		// using the sRAWPath here instead of the input file root should allow
		// us to feed on cc-process into another directly
		CString sBaseName = getFileName(status.sRAWPath) + _T("-bat");
		beforeProcessing(status, sBaseName); 	// open the log file

		m_sOutPath = status.makeTempPath(sBaseName,_T(".itx"));
		m_sOutPath.deleteFile();

		runBatchFile(status.sInterlinearPath, m_sOutPath, status);

		if(!m_sOutPath.fileExistsAndIsClosed())
			throw(CProcessFailure(this, kpszFailure));

		// register ana file so the user can view it
		CResultStreamFile* outStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
					_T("Interlinear text from Batch"), //short description
					_T("Interlinear text produced by Batch Processor"), // long description
					_T("Batch Itx") // tab label
									),
					m_sOutPath.getFullPath(),
					status.getOutputLang());

		status.registerResultStream(outStream);
		afterProcessing(status);
		status.sInterlinearPath = m_sOutPath; // this will feed the next pass through
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
void CBatchProcess::processInformationFile(CProcessStatus& status)
{
	try
	{
		// using the sRAWPath here instead of the input file root should allow
		// us to feed one batch-process into another directly
		CString sBaseName = getFileName(status.sRAWPath) + _T("-bat");
		beforeProcessing(status, sBaseName); 	// open the log file

		m_sOutPath = status.makeTempPath(sBaseName,_T(".inf"));
		m_sOutPath.deleteFile();

		runBatchFile(m_sOutPath, status);

		if(!m_sOutPath.fileExistsAndIsClosed())
			throw(CProcessFailure(this, kpszFailure));

		afterProcessing(status);
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
void CBatchProcess::processRAWTextFile(CProcessStatus& status)
{
	try
	{
		// using the sRAWPath here instead of the input file root should allow
		// us to feed one batch-process into another directly
		CString sBaseName = getFileName(status.sRAWPath) + _T("-bat");
		beforeProcessing(status, sBaseName); 	// open the log file

		m_sOutPath = status.makeTempPath(sBaseName,_T(".txt"));
		m_sOutPath.deleteFile();

		runBatchFile(status.sRAWPath, m_sOutPath, status);

		if(!m_sOutPath.fileExistsAndIsClosed())
			throw(CProcessFailure(this, kpszFailure));

		// register text file so the user can view it
		CResultStreamFile* outStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
						_T("Text from Batch"), //short description
						_T("Text produced by Batch Processor"), // long description
						_T("Batch Txt") // tab label
											),
					m_sOutPath.getFullPath(),
					status.getInputLang());	// <-- should this be output lang some times? how do I know?
		status.registerResultStream(outStream);
		afterProcessing(status);
		status.sRAWPath = m_sOutPath; // this will feed the next pass through
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
void CBatchProcess::processDictionaries(CProcessStatus& status)
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
					throw CProcessFailure(this, _T("There were no source dictionaries specified"));
				sLogBase = _T("anal-dicts-") + getFileName(m_sBatchPath);
				break;
			case CProcess::kSynthesis:
				pRootUnifiedDicts = & status.m_pTarDicts;
				if((*pRootUnifiedDicts).GetSize()==0)
					throw CProcessFailure(this, _T("There were no target dictionaries specified"));
				sLogBase = _T("synth-dicts-") + getFileName(m_sBatchPath);
			break;
			default: // the user should never be able to make this happen
				throw CProcessFailure(this, _T("When processing dictionaries, Batch should only be included as part of the analysis or synthesis sequences."));
		}

		beforeProcessing(status, sLogBase); 	// load the table and open the log file

		for(int iRootFileIndex = 0; iRootFileIndex< (*pRootUnifiedDicts).GetSize(); iRootFileIndex++)
		{
			CString sBaseName = (*pRootUnifiedDicts)[iRootFileIndex]->getFileName()+  _T("-bat");

			m_sOutPath = status.makeTempPath(sBaseName,_T(".dic"));
			m_sOutPath.deleteFile();

			runBatchFile(*(*pRootUnifiedDicts)[iRootFileIndex],
					 m_sOutPath, status);

			if(!m_sOutPath.fileExistsAndIsClosed())
				throw(CProcessFailure(this, kpszFailure));

			// register this new dict so that the next process uses it
			(*(*pRootUnifiedDicts)[iRootFileIndex]) = m_sOutPath;
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
void CBatchProcess::processANAFile(CProcessStatus& status)
{
	CPathDescriptor sLOGPath ;
	try
	{
		// using the sRAWPath here instead of the input file root should allow
		// us to feed one batch process into another directly
		CString sBaseName = getFileName(status.sANAPath) + _T("-bat");

		m_sOutPath = status.makeTempPath(sBaseName,_T(".ana"));
		m_sOutPath.deleteFile();

		beforeProcessing(status, sBaseName);

		runBatchFile(status.sANAPath, m_sOutPath, status);

		registerLog(status, m_sLogPath, status.getInputLang());

		if(!m_sOutPath.fileExistsAndIsClosed())
			throw(CProcessFailure(this, kpszFailure));

		// register ana file so the user can view it
		CResultStreamFile* anaStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
					_T("ANA from Batch"), //short description
					_T("ANA produced by Batch Processor"), // long description
					_T("Batch ANA") // tab label
									),
					m_sOutPath.getFullPath(),
					status.getInputLang());	// <-- should this be output lang some times? how do I know?

		status.registerResultStream(anaStream);

		afterProcessing(status);

		status.sANAPath = m_sOutPath; // this will feed the next pass through
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
BOOL CBatchProcess::doEditDialog(int iFunctionCode)
{
	CDlgBatchProcess dlg;

	// Load in all our settings
	dlg.m_sName = m_sName;
	dlg.m_sDescription = m_sDescription;
	dlg.m_sBatchPath = m_sBatchPath;
	dlg.m_iFileType = m_iFileType;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_sName = dlg.m_sName;
	m_sDescription = dlg.m_sDescription;
	m_sBatchPath = dlg.m_sBatchPath;
	m_iFileType = dlg.m_iFileType;

	return TRUE;
}

PROCESS_FILE_TYPE CBatchProcess::getInputType()
{
	switch(m_iFileType)
	{
		case kNone: return INFORMATION; break;
		case kText: return RAWTEXT; break;
		case kDicts: return DICT; break;
		case kANA: return ANA; break;
		case kInterlinear: return INTERLINEAR; break;
		default: ASSERTX(FALSE); return INFORMATION; break;
	}
	return INFORMATION;
}

PROCESS_FILE_TYPE CBatchProcess::getOutputType()
{
	switch(m_iFileType)
	{
		case kNone: return INFORMATION; break;
		case kText: return RAWTEXT; break;
		case kDicts: return DICT; break;
		case kANA: return ANA; break;
		case kInterlinear: return INTERLINEAR; break;
		default: ASSERTX(FALSE); return INFORMATION; break;
	}
	return INFORMATION;
}


//	static
LPCTSTR CBatchProcess::INPUT_TYPE_DISPLAY()
{	return _T("Various");
}
LPCTSTR CBatchProcess::OUTPUT_TYPE_DISPLAY()
{	return _T("Various");
}

// This should be preceed by beforeProcessing() and followed by endProcessing().
// In between these calls, it can be called repeatedly with different files.
void CBatchProcess::runBatchFile(CPathDescriptor& inPath, CPathDescriptor& outPath, CProcessStatus& status)
{

	if(!inPath.fileExists())
	{
		CString s;
		s.Format(_T("The input file %s could not be found or opened"), (LPCTSTR)inPath.getQuotedPath());
		throw CProcessFailure(this, s);
	}


	ASSERTX(outPath.getFullPath().GetLength());
	ASSERTX(m_pLogOut);

	USES_CONVERSION;
	*m_pLogOut << "Processing " << T2CA(inPath.getFullPath()) << " with " << T2CA(m_sBatchPath) << "...";

	m_sInPath = inPath;
#ifndef rde731b
	suspendProcessingLog(status);
#endif  // rde731b
	if(!executeTool(status))
	  {
		CString s = _T("Failed to process the file with ") + m_sBatchPath;
		throw(CProcessFailure(this, s));
	  }

	waitForCompletion(&status, &outPath);
#ifndef rde731b
	resumeProcessingLog(status);
#endif  // rde731b
	*m_pLogOut << "Done.\n";
}

// for processing information type batch files
void CBatchProcess::runBatchFile(CPathDescriptor& outPath, CProcessStatus& status)
{
	ASSERTX(outPath.getFullPath().GetLength());
	ASSERTX(m_pLogOut);

	USES_CONVERSION;
	*m_pLogOut << "Processing with " << T2CA(m_sBatchPath) << "...";

	if(!executeTool(status))
	  {
		CString s = _T("Failed to process with ") + m_sBatchPath;
		throw(CProcessFailure(this, s));
	  }

	waitForCompletion(&status, &outPath);
	*m_pLogOut << "Done.\n";
}

// open the log file
void CBatchProcess::beforeProcessing(CProcessStatus& status, CString & sBaseName)
{
	//---- SETUP THE LOG FILE, WHICH WE WRITE TO, NOT THE BATCH FILE

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


}
#ifndef rde271c
// temporarily close the log file (so the batch file can write to it).
void CBatchProcess::suspendProcessingLog(CProcessStatus& status)
{
	ASSERTX(m_pLogOut->is_open());
	*m_pLogOut << "\n\nFrom '>> %3' at the end of your batch file command line... \n{{\n";
	m_pLogOut->close();
}

// reopen the log file to continue processing.
void CBatchProcess::resumeProcessingLog(CProcessStatus& status)
{
	ASSERTX(!m_pLogOut->is_open());
	USES_CONVERSION;
	m_pLogOut->open(T2CA(m_sLogPath.getFullPath()), ios::out | ios::app);
	*m_pLogOut << "\n}} back to CStudio... ";
}

// close the log file... for good.
#endif  // rde271c
void CBatchProcess::afterProcessing(CProcessStatus& status)
{
	//---- CLOSE AND REGISTER THE LOG FILE, WHICH WE WRITE TO, NOT THE CC-DLL

	if(m_pLogOut)
		delete m_pLogOut;	// close the file
	m_pLogOut = NULL;

	registerLog(status, m_sLogPath);
	m_sLogPath = _T("");

}


void CBatchProcess::checkInPathValidity(CPathDescriptor & inPath, CString sType)
{
  if(inPath.getShortPath().IsEmpty())
	{
	  CString s = _T("Huh?  There was no ") + sType + _T(" file path given to the Batch process.  You should look into the log of the previous processor (if any) and look for errors, then report this as a bug.");
	  throw(CProcessFailure(this, s));
	}
}
