// PhonruleProcess.cpp: implementation of the CPhonruleProcess class.
//
// jdh 11/11/99 watch the Status prefs for turning on tracing temporarily
// 2,4,1 18-Dec-2000 hab Use registreLog instead of status.registerResultStream
//                       on PhonRUle log so if there is a warning or error, the
//                       "big red X" icon (yeah, I know it's actually a white
//                       X in a red circle, but...) will show on the
//                       display tab.
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "PathDescriptor.h"
#include "PhonruleProcess.h"
#include "SFMFile.h"
#include "ModelFilesSet.h"
#include "processOutput.h"
#include "processStatus.h"
#include "ProcessingPrefs.h"

#include "DlgPhonrule.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_DYNCREATE(CPhonruleProcess, CDLLProcess);

extern "C"
{
// files used by the phonrule c code, which we need to make
// sure are closed properly
	extern FILE* logfile;
	extern FILE* errlogfile;
	extern FILE* outfile;

	int runProcess();

	BOOL setupProcess(char* lpszErrorStr,	// what's this for?
					BOOL bDoTrace,
					BOOL bMontorRules,
					char cCommentChar,

					const char* lpszRulesPath,
					const char* lpszDictInPath,
					const char* lpszDictOutPath,
					const char* lpszLogFilePath,
					BOOL bAppendLog);
}

CPhonruleProcess::CPhonruleProcess()
:CDLLProcess()
{
	setDefaultValues();
}

CPhonruleProcess::~CPhonruleProcess()
{

}

// called by CProcess constructor
// even if the values will be read in, we need this in case some values are
// missing (as will happen when the user is upgrading to a new version)
void CPhonruleProcess::setDefaultValues()
{
	m_bMonitorRules = FALSE;
	m_bTrace = FALSE;
	m_cCommentChar = '|';
}

void CPhonruleProcess::readParametersFromSFMFile(SFMFile *f)
{
	setDefaultValues();
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here
	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker=="-Process")
			break;
		else checkAndReadBool("MonitorRules",m_bMonitorRules)
		else checkAndReadBool("Trace",m_bTrace)
		else if(sMarker == "CommentChar" && sField.GetLength())
		{
#if !defined(rde270) && defined(_DEBUG)
			USES_CONVERSION_U8;
			CString str(sField[0]);
			ASSERT(strlen(T2CU8(str)) <= 1);
#endif
			m_cCommentChar = (char)sField[0];
		}
		else
		{
			f->throwParseFailure(_T("PhonruleProcess"), sMarker, sField);
		}
	}
}

void CPhonruleProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process " << ID() << PROC_ENABLED_STATUS <<"\n";
	outputBool(fout, "MonitorRules", m_bMonitorRules);
	outputBool(fout, "Trace", m_bTrace);
	fout << "\\CommentChar " << m_cCommentChar << "\n";
	fout << "\\-Process " << ID() << "\n";
}

// EXCEPTIONS: CProcessFailure
// TO DO:	clean up error reporting
//			use dialog to say we're busy and give a cancel button
void CPhonruleProcess::processDictionaries(CProcessStatus& status)
{
	CPathDescriptor sLOGPath;
	try
	{
		CModelFilesSet* pMFS = NULL;

		// do we operate on the src dicts or target dicts?
		CTypedPtrArray<CPtrArray, CPathDescriptor*>* pRootUnifiedDicts;
		switch(status.m_iCurrentSeqFunction)
		{
			case CProcess::kAnalysis:
				pRootUnifiedDicts = & status.m_pSrcDicts;
				pMFS =status.getInputMFS();
				if((*pRootUnifiedDicts).GetSize()==0)
					throw CProcessFailure(this, _T("There were no source dictionaries specified"));
				break;
			case CProcess::kSynthesis:
				pMFS =status.getOutputMFS();
				pRootUnifiedDicts = & status.m_pTarDicts;
				if((*pRootUnifiedDicts).GetSize()==0)
					throw CProcessFailure(this, _T("There were target dictionaries specified"));
				break;
			default: // the user should never be able to make this happen
				throw CProcessFailure(this, _T("Phonrule should only be called as part of analysis or synthesis"));
		}

		// combine all runs into one log
		sLOGPath = status.makeTempPath(pMFS->getAbrev() + _T("-phrl"), _T(".log"));
		sLOGPath.deleteFile();

		for(int iRootFileIndex = 0; iRootFileIndex< (*pRootUnifiedDicts).GetSize(); iRootFileIndex++)
		{

			CString sBaseName = (*pRootUnifiedDicts)[iRootFileIndex]->getFileName() + _T("-phrl");
			CPathDescriptor sOutputDictPath = status.makeTempPath(sBaseName,_T(".dic"));
			sOutputDictPath.deleteFile();

			USES_CONVERSION;
			char lpszErrorStr[1000];
			BOOL OK = setupProcess(lpszErrorStr,
						m_bTrace ||
						(status.m_pProcPrefs->m_dwFlags & CProcessingPrefs::kTrace), // jdh 11/11/99
						m_bMonitorRules,
						m_cCommentChar,
						T2CA(pMFS->getPhonrulePath()),			// lpszRulesPath
						T2CA((*pRootUnifiedDicts)[iRootFileIndex]->getFullPath()),	// lpszDictInPath
						T2CA(sOutputDictPath.getFullPath()),			// lpszDictOutPath
						T2CA(sLOGPath.getFullPath()),				// lpszLogFilePath
						TRUE); // append log

			if(!OK)
				throw(CProcessFailure(this, A2CT(lpszErrorStr)));


			BOOL bError = runProcess();

			WIN32_FIND_DATA fileInfo;
			if(INVALID_HANDLE_VALUE == FindFirstFile(sOutputDictPath.getFullPath(), &fileInfo))
				throw(CProcessFailure(this, _T("Phonrule DLL did not produce the expected dictionary.  Check the phonrule log for more information.")));

			// change the path so that latter processes will use what we produced
			(*(*pRootUnifiedDicts)[iRootFileIndex]) = sOutputDictPath;//.getFullPath();

			// make sure these are closed
			if(logfile)
				fclose(logfile);	// this is the same as errlogfile
			if(outfile)
				fclose(outfile);
		}

#ifndef rde279
#pragma message("I don't know if chopping this out is correct, but the logStream being created here is unused so it memory leaks")
#else
		CResultStreamFile* logStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												_T("Phonrule Log"), //short description
												_T("Log of this process; read it for status and diagnostics."), // long description
												pMFS->getAbrev() + _T(" Phnrl Log")
											),
					sLOGPath.getFullPath(),
					status.getInputLang());
#endif
#ifndef hab241
		registerLog(status, sLOGPath, status.getInputLang());
#else // hab241
		status.registerResultStream(logStream);
#endif // hab241
	}
	catch(CProcessFailure failure)
	{
		if(logfile)
			fclose(logfile);	// this is the same as errlogfile
		if(outfile)
			fclose(outfile);

		registerLog(status, sLOGPath, status.getInputLang());
		throw(failure);
	}
	catch(CString sError)
	{
		if(logfile)
			fclose(logfile);	// this is the same as errlogfile
		if(outfile)
			fclose(outfile);
		registerLog(status, sLOGPath, status.getInputLang());
		throw(CProcessFailure(this, sError));
	}
}


// iFunctionCode unused by this subclass
BOOL CPhonruleProcess::doEditDialog(int iFunctionCode)
{
	CDlgPhonrule dlg;

	// Load in all our settings
	dlg.m_bMonitorRules=	m_bMonitorRules;
	dlg.m_bTrace=	m_bTrace;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bMonitorRules = dlg.m_bMonitorRules;
	m_bTrace=	dlg.m_bTrace;

	return TRUE;
}
