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

const char *kpszFailure = "Batch process did not produce the expected ana file.  Check the log for more information.";

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
		if(sMarker=="-Process")
			break;
		else checkAndReadInt("FileType",m_iFileType)
		else checkAndReadString("Name", m_sName)
		else checkAndReadString("Description", m_sDescription)
		else checkAndReadString("BatchPath", m_sBatchPath)
		else
		{
			f->throwParseFailure("Batch-Process", sMarker, sField);
		}
	}
}

void CBatchProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process " << ID() << PROC_ENABLED_STATUS <<"\n";
	fout << "\\Name " << m_sName << "\n";
	fout << "\\Description " << m_sDescription << "\n";
	fout << "\\FileType " << m_iFileType << "\n";
	fout << "\\BatchPath " << m_sBatchPath << "\n";
	fout << "\\-Process " << ID() << "\n";
}

const char* CBatchProcess::getToolPath()
{
	return m_sBatchPath;
}

CString CBatchProcess::getBatchName(CProcessStatus& status)
{
	CString sBatchFile;
	sBatchFile.Format("%s Batch%d",
			  status.getInputMFS()->getAbrev(),
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
	sout << m_sInPath.getQuotedPath() << ' ';
	sout << m_sOutPath.getQuotedPath();
	switch(m_iFileType)
	  {
	  case kNone:  break;
	  case kText:  checkInPathValidity(m_sInPath, "Text"); break;
	  case kDicts: checkInPathValidity(m_sInPath, "Dictionary"); break;
	  case kANA:   checkInPathValidity(m_sInPath, "ANA"); break;
	  case kInterlinear: checkInPathValidity(m_sInPath, "Interlinear"); break;
	  default: ASSERTX(FALSE); break;
	  }
#endif // ORIG
	CString s(sout.str(), sout.pcount());
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
		CString sBaseName = getFileName(status.sRAWPath) + "-bat";
		beforeProcessing(status, sBaseName); 	// open the log file

		m_sOutPath = status.makeTempPath(sBaseName,".itx");
		m_sOutPath.deleteFile();

		runBatchFile(status.sInterlinearPath, m_sOutPath, status);

		if(!m_sOutPath.fileExistsAndIsClosed())
			throw(CProcessFailure(this, kpszFailure));

		// register ana file so the user can view it
		CResultStreamFile* outStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
					"Interlinear text from Batch", //short description
					"Interlinear text produced by Batch Processor", // long description
					"Batch Itx" // tab label
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
		CString sBaseName = getFileName(status.sRAWPath) + "-bat";
		beforeProcessing(status, sBaseName); 	// open the log file

		m_sOutPath = status.makeTempPath(sBaseName,".inf");
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
		CString sBaseName = getFileName(status.sRAWPath) + "-bat";
		beforeProcessing(status, sBaseName); 	// open the log file

		m_sOutPath = status.makeTempPath(sBaseName,".txt");
		m_sOutPath.deleteFile();

		runBatchFile(status.sRAWPath, m_sOutPath, status);

		if(!m_sOutPath.fileExistsAndIsClosed())
			throw(CProcessFailure(this, kpszFailure));

		// register text file so the user can view it
		CResultStreamFile* outStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
						"Text from Batch", //short description
						"Text produced by Batch Processor", // long description
						"Batch Txt" // tab label
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
					throw CProcessFailure(this, "There were no source dictionaries specified");
				sLogBase = "anal-dicts-" + getFileName(m_sBatchPath);
				break;
			case CProcess::kSynthesis:
				pRootUnifiedDicts = & status.m_pTarDicts;
				if((*pRootUnifiedDicts).GetSize()==0)
					throw CProcessFailure(this, "There were no target dictionaries specified");
				sLogBase = "synth-dicts-" + getFileName(m_sBatchPath);
			break;
			default: // the user should never be able to make this happen
				throw CProcessFailure(this, "When processing dictionaries, Batch should only be included as part of the analysis or synthesis sequences.");
		}

		beforeProcessing(status, sLogBase); 	// load the table and open the log file

		for(int iRootFileIndex = 0; iRootFileIndex< (*pRootUnifiedDicts).GetSize(); iRootFileIndex++)
		{
			CString sBaseName = (*pRootUnifiedDicts)[iRootFileIndex]->getFileName()+  "-bat";

			m_sOutPath = status.makeTempPath(sBaseName,".dic");
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
		CString sBaseName = getFileName(status.sANAPath) + "-bat";

		m_sOutPath = status.makeTempPath(sBaseName,".ana");
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
					"ANA from Batch", //short description
					"ANA produced by Batch Processor", // long description
					"Batch ANA" // tab label
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
{	return "Various";
}
LPCTSTR CBatchProcess::OUTPUT_TYPE_DISPLAY()
{	return "Various";
}

// This should be preceed by beforeProcessing() and followed by endProcessing().
// In between these calls, it can be called repeatedly with different files.
void CBatchProcess::runBatchFile(CPathDescriptor& inPath, CPathDescriptor& outPath, CProcessStatus& status)
{

	if(!inPath.fileExists())
	{
		CString s;
		s.Format("The input file %s could not be found or opened", inPath.getQuotedPath());
		throw CProcessFailure(this, s);
	}


	ASSERTX(outPath.getFullPath().GetLength());
	ASSERTX(m_pLogOut);

	*m_pLogOut << "Processing " << inPath.getFullPath() << " with " << m_sBatchPath << "...";

	m_sInPath = inPath;
	if(!executeTool(status))
	  {
		CString s = "Failed to process the file with " + m_sBatchPath;
		throw(CProcessFailure(this, s));
	  }

	waitForCompletion(&status, &outPath);
	*m_pLogOut << "Done.\n";
}

// for processing information type batch files
void CBatchProcess::runBatchFile(CPathDescriptor& outPath, CProcessStatus& status)
{
	ASSERTX(outPath.getFullPath().GetLength());
	ASSERTX(m_pLogOut);

	*m_pLogOut << "Processing with " << m_sBatchPath << "...";

	if(!executeTool(status))
	  {
		CString s = "Failed to process with " + m_sBatchPath;
		throw(CProcessFailure(this, s));
	  }

	waitForCompletion(&status, &outPath);
	*m_pLogOut << "Done.\n";
}

// open the log file
void CBatchProcess::beforeProcessing(CProcessStatus& status, CString & sBaseName)
{
	//---- SETUP THE LOG FILE, WHICH WE WRITE TO, NOT THE BATCH FILE

	m_sLogPath = status.makeTempPath(sBaseName, ".log");
	m_sLogPath.deleteFile();
	m_pLogOut = new ofstream(m_sLogPath.getFullPath());
	ASSERTX(m_pLogOut);
	if(!m_pLogOut->is_open())
	{
		CString s;
		s.Format("Could not open log file  \"%s\" ", m_sLogPath.getFullPath());
		throw CProcessFailure(this, s);
	}


}
void CBatchProcess::afterProcessing(CProcessStatus& status)
{
	//---- CLOSE AND REGISTER THE LOG FILE, WHICH WE WRITE TO, NOT THE CC-DLL

	if(m_pLogOut)
		delete m_pLogOut;	// close the file
	m_pLogOut = NULL;

	registerLog(status, m_sLogPath);
	m_sLogPath = "";

}


void CBatchProcess::checkInPathValidity(CPathDescriptor & inPath, CString sType)
{
  if(inPath.getShortPath().IsEmpty())
	{
	  CString s = "Huh?  There was no " + sType + " file path given to the Batch process.  You should look into the log of the previous processor (if any) and look for errors, then report this as a bug.";
	  throw(CProcessFailure(this, s));
	}
}
