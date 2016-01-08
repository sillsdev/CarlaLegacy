// PhraseParser.cpp: implementation of the CPhraseParser class.
//
//		Created by factoring out the core of QuickParseView.
//		Initially used for IParsePhrase(), but should eventually
//		replace the core of QuickParseView, so that there is on code
//		base for this function.
//
//	22-May-2000 JDH Created
//////////////////////////////////////////////////////////////////////


#include "stdafx.h"
#include "PhraseParser.h"

#include "CarlaStudioApp.h"
#include <strstrea.h>
#include "ProjectDoc.h"
#include "ProcessStatus.h"

#include "AmpleDLLProcess.h"
#include "ProcessingPrefs.h"
#include "CarlaLanguage.h"
#include "AmpleResult.h"
#include "ProcessSequence.h"


#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CPhraseParser::CPhraseParser()
:m_bDidRefresh(FALSE),
m_bManualRefreshPending(FALSE),
m_pSourceLang(NULL),
m_pAmpleProcess(NULL)
{

}

CPhraseParser::~CPhraseParser()
{
	if(m_pAmpleProcess)
		delete m_pAmpleProcess;
}

void CPhraseParser::setLanguage(CCarlaLanguage* pSrcLang)
{
	if(pSrcLang != m_pSourceLang)
	{
		delete m_pAmpleProcess;
		m_pAmpleProcess = 0;

		m_pSourceLang = pSrcLang;
	}
}

// returns an XML document as a string
CString CPhraseParser::parseString(CString sPhrase, BOOL bTrace, CString sTraceMorphs, BOOL bForceRefresh)
{
	CString sResult;
	try
	{
		//---- BRING THE CONTROL FILES UP TO DATE ON THE DISK
		//jdh 10-june-2000
		if (theApp.getProject()->IsModified())
		{
			throw "Sorry, you have modified the CarlaStudio project and must save it before parsing.  This is a bug which I have not been able to squash.";
			/*			//the following synchronizeExternals() will throw an exception
			//this happens when the MFC code tries to set a waitcursor
			::SetForegroundWindow(theApp.GetMainWnd()->m_hWnd);
			theApp.getProject()->synchronizeExternals();
*/ 		}

		if(bForceRefresh)
			m_bManualRefreshPending = TRUE;

		sPhrase.TrimLeft();
		if(sPhrase.IsEmpty())
			throw "Phrase was empty";


		ASSERTX(m_pSourceLang);
		m_pSourceLang->prepareMFSForProcessors(); // among other things, get the comment character into the MFS

		CSrcTextProcessingPrefs procPrefs(m_pSourceLang,
									NULL,
									CProcessingPrefs::kSourceAna);


		CProcessStatus status(	&procPrefs,
								sPhrase,
								m_pSourceLang,
								m_pSourceLang->getMFS(),
								NULL,	// output lang
								NULL); // output mfs

		// jdh 3/14/2000 changed to this from some custom code
		if (!status.setupTempDir(m_pSourceLang->getName()))
			throw "CS Couldn't setup the temp directory";	// assumes the user has already been informed

	// added jdh 3/13/2000
		m_bDidRefresh = FALSE; // will be set to TRUE if we refresh
		BOOL bDidGetPreprocessedDicts = status.loadPreprocessedSrcDictsArrayFromLang();
		if(!bDidGetPreprocessedDicts || m_bManualRefreshPending || getNeedDictPreprocessing(status))
			if(!this->preprocessDicts(&status))
				throw "CS had problems preprocessing the dictionaries";

		prepareAmpleProcess();
		loadAmpleOptions(bTrace, sTraceMorphs);
		sResult = _T(""); // in case of an exception
		CString sTraceOutput;


		CString sPath;
		sPath.Format(_T("%s\\QP-Ample-Trace.log"), (LPCTSTR)status.getTempDirectory());


	// DO THE PARSING
		if(!bTrace)
		{	// !!! this path is needed if we want to check for errors
			m_pAmpleProcess->processRAWTextString(status, sPath);
		}
		else
		{
			m_pAmpleProcess->processRAWTextString(status, sPath);

			TRY
			{
				CFile log(sPath, CFile::modeRead);
				DWORD sz = log.GetLength();
				if(sz)
				{
					char* buf = new char[sz+2];
					ASSERTX(buf);
					int iReadBytes = log.Read(buf, sz);
					buf[iReadBytes] = '\0'; //terminate it
					USES_CONVERSION_U8;
					sTraceOutput = U82CT(buf);
					delete buf;
				}
				log.Close();
			}
			CATCH( CFileException, e )
			{
				checkForFileError(sPath);
			}
			END_CATCH
		}

		// jdh 3/14/2000 store this set of dictionaries.  we do it only now in so that an error in processing them will be in the user's face
		status.storePreprocessedSrcDictsArrayInLang();
		sResult = status.m_sRAWString;
	}
	catch (CProcessFailure failure)
	{
#ifndef rde270
		// can't use alloca in an exception handler (so we can't convert from wide to narrow
		//  which is required by strstream), so do it a different way...
		CString str;
		if(failure.m_pProcess)	// will be null if not thrown by a process
			AfxFormatString2(str, IDS_CONT_PROC_FAILURE, (LPCTSTR)CString(failure.m_pProcess->getDisplayName()), failure.getReason());
		else
			AfxFormatString1(str, IDS_CONT_PROC_FAILURE2, (LPCTSTR)failure.getReason());
#else   // rde270
		strstream sout;
		if(failure.m_pProcess)	// will be null if not thrown by a process
			sout << "The process \"" << failure.m_pProcess->getDisplayName() << "\"";
		else
			sout << "Processing ";
		sout << " was not completed.\n";
		sout << failure.getReason();
		CString str(sout.str(), sout.pcount());
		sout.rdbuf()->freeze(0); // else get a memory leak
#endif  // rde270
		sResult.Format(_T("<error>%s<\\error>"), (LPCTSTR)str);
		return sResult;
	}
	catch (CString sError)
	{
		sResult.Format(_T("<error>%s<\\error>"), (LPCTSTR)sError);
		return sResult;
	}
	catch (LPCTSTR lpzError)
	{
		sResult.Format(_T("<error>%s<\\error>"), lpzError);
		return sResult;
	}
	return sResult;
}


// returns an XML document as a string
CString CPhraseParser::parseFile(CString sInputPath, CString sOutputPath, BOOL bForceRefresh)
{
	CString sResult;
	try
	{
		//---- BRING THE CONTROL FILES UP TO DATE ON THE DISK
		//jdh 10-june-2000
		if (theApp.getProject()->IsModified())
		{
			throw _T("Sorry, you have modified the CarlaStudio project and must save it before parsing.  This is a bug which I have not been able to squash.");
			/*			//the following synchronizeExternals() will throw an exception
			//this happens when the MFC code tries to set a waitcursor
			::SetForegroundWindow(theApp.GetMainWnd()->m_hWnd);
			theApp.getProject()->synchronizeExternals();
*/ 		}

		if(bForceRefresh)
			m_bManualRefreshPending = TRUE;


		ASSERTX(m_pSourceLang);
		m_pSourceLang->prepareMFSForProcessors(); // among other things, get the comment character into the MFS

		CSrcTextProcessingPrefs procPrefs(m_pSourceLang,
									NULL,
									CProcessingPrefs::kSourceAna);


		CProcessStatus status(	sInputPath,
								&procPrefs,
								m_pSourceLang,
								m_pSourceLang->getMFS(),
								NULL,	// output lang
								NULL); // output mfs

		// jdh 3/14/2000 changed to this from some custom code
		if (!status.setupTempDir(m_pSourceLang->getName()))
			throw _T("CS Couldn't setup the temp directory");	// assumes the user has already been informed

	// added jdh 3/13/2000
		m_bDidRefresh = FALSE; // will be set to TRUE if we refresh
		BOOL bDidGetPreprocessedDicts = status.loadPreprocessedSrcDictsArrayFromLang();
		if(!bDidGetPreprocessedDicts || m_bManualRefreshPending || getNeedDictPreprocessing(status))
			if(!this->preprocessDicts(&status))
				throw _T("CS had problems preprocessing the dictionaries");

		prepareAmpleProcess();
		sResult = _T(""); // in case of an exception
		CString sTraceOutput;


		CString sPath;
		sPath.Format(_T("%s\\QP-Ample-Trace.log"), (LPCTSTR)status.getTempDirectory());


	// DO THE PARSING

		m_pAmpleProcess->setOutputStyle(_T("AResult"));
		m_pAmpleProcess->setXMLOutputPath(sOutputPath);
		m_pAmpleProcess->processRAWTextFile(status);


		// jdh 3/14/2000 store this set of dictionaries.  we do it only now in so that an error in processing them will be in the user's face
		status.storePreprocessedSrcDictsArrayInLang();
		sResult = status.m_sRAWString;
	}
	catch (CProcessFailure failure)
	{
#ifndef rde270
		// can't use alloca in an exception handler (so we can't convert from wide to narrow
		//  which is required by strstream), so do it a different way...
		CString str;
		if(failure.m_pProcess)	// will be null if not thrown by a process
			AfxFormatString2(str, IDS_CONT_PROC_FAILURE, (LPCTSTR)CString(failure.m_pProcess->getDisplayName()), failure.getReason());
		else
			AfxFormatString1(str, IDS_CONT_PROC_FAILURE2, (LPCTSTR)failure.getReason());
#else   // rde270
		strstream sout;
		if(failure.m_pProcess)	// will be null if not thrown by a process
			sout << "The process \"" << failure.m_pProcess->getDisplayName() << "\"";
		else
			sout << "Processing ";
		sout << " was not completed.\n";
		sout << failure.getReason();
		CString str(sout.str(), sout.pcount());
		sout.rdbuf()->freeze(0); // else get a memory leak
#endif  // rde270
		sResult.Format(_T("<error>%s<\\error>"), (LPCTSTR)str);
		return sResult;
	}
	catch (CString sError)
	{
		sResult.Format(_T("<error>%s<\\error>"), (LPCTSTR)sError);
		return sResult;
	}
	catch (LPCTSTR lpzError)
	{
		sResult.Format(_T("<error>%s<\\error>"), lpzError);
		return sResult;
	}
	return sResult;
}


void CPhraseParser::prepareAmpleProcess()
{
	if(m_pAmpleProcess)
	{
		return;
	}

	//LOG2(_T("CPhraseParser creating ample process"), _T("\r\n"));
	m_pAmpleProcess = new CAmpleDLLProcess();
}

void CPhraseParser::loadAmpleOptions(BOOL bTrace, CString sTraceMorphs)
{
	ASSERTX(m_pAmpleProcess);
	m_pAmpleProcess->setTrace(bTrace, sTraceMorphs);
	m_pAmpleProcess->setReloadOptions();
}



// 3/13/2000 JDH Added this method
BOOL CPhraseParser::preprocessDicts(CProcessStatus* pStatus)
{
	ASSERTX(m_pSourceLang);

	CProcessSequence* pAnalysisSequence = m_pSourceLang->getAnalysisSequence();
	const CProcessingPrefs* pOuterPrefs = pStatus->getProcPrefs();
	CSrcTextProcessingPrefs prefs(m_pSourceLang,NULL, CProcessingPrefs::kPreprocessDicts);
	pStatus->m_pProcPrefs = &prefs;

	pStatus->setCurrentSequenceFunction(pAnalysisSequence->getFunctionCode());
	pStatus->setInputLang(m_pSourceLang);
	pStatus->setOutputLang(NULL);

	// this is already done when a new status is created, but is needed if it has been around and loaded with preprocessed dictionaries
	pStatus->loadOriginalDictsArrayFromLang();

	//----- ask Shoebox, if it is running, to do a save all
	// note: if this was invoked by a call from CSRemote, then the send will hang us forever
	// thus, we have this bRemoteCall flag to prevent that.  If we are called from
	// Shoebox, it will have saved everything anyways as part of its batch file command
	/*  Windows 10 hangs on this; never worked anyway, so commenting it off
	::SendMessage(HWND_BROADCAST, wm_RemoteSaveAll, NULL, NULL); */

	m_pSourceLang->prepareMFSForProcessors();


	//---- SETUP PROGRESS BAR
	//!!! this is wrong since we'll be skipping non-dict ones, but it's only for a progress bar
	pStatus->expectSequenceWithCount(pAnalysisSequence->getProcessorCount());


	//---- BRING THE CONTROL FILES UP TO DATE ON THE DISK
	theApp.getProject()->synchronizeExternals();


	// do the processing; the kPreprocessDicts goal will cause this to skip non-dictionary processors

	BOOL bOK = pAnalysisSequence->continueProcessing(pStatus);

	if(!bOK)
		throw CString(_T("There was a problem refreshing the dictionaries.  You'll need to open a source document and parse it to see what the problem is."));
	else	// move the dicts to a safe folder so they'll be around
	{
		CString sDictTempDir;
		sDictTempDir.Format(_T("%s\\CSTUDIO\\Preprocessed Dicts"), _tgetenv(_T("TEMP")));
//add error checking!!!
		BOOL bDidDeleteFiles=FALSE;
		::nukeDirectory(sDictTempDir,&bDidDeleteFiles);
		CreateDirectory(sDictTempDir, NULL); // in case it wasn't there already

		for(int i=0; i<pStatus->m_pSrcDicts.GetSize(); i++)
		{
			CString s;
			s.Format(_T("%s\\%s"), (LPCTSTR)sDictTempDir, (LPCTSTR)pStatus->m_pSrcDicts[i]->getFileFullName());
#ifndef hab213
			pStatus->m_pSrcDicts[i]->copyTo(s,FALSE);
			*pStatus->m_pSrcDicts[i] = (LPCTSTR)s; // change descriptor
#ifndef hab217
			pStatus->m_pSrcDicts[i]->forceFileWritable(); // make copy be writable, no matter what the source was
#endif //hab217
#else // hab213
			pStatus->m_pSrcDicts[i]->moveTo(s,FALSE, TRUE);	// this moves the original source if there is no dict preprocessing!!!
#endif // hab213
		}
	}
	pStatus->m_pProcPrefs = pOuterPrefs; // change it back

	m_bDidRefresh = TRUE;
	m_bManualRefreshPending = FALSE;
	m_lastPreprocessTime= CTime::GetCurrentTime();
	return bOK;
}

//we need to preprocess the dicts if the dicts  or certain control files have been modified
// we don't have a way of knowing which control files, so if any have been then we redo the dictionaries
BOOL CPhraseParser::getNeedDictPreprocessing(CProcessStatus& status)
{
	//check if the src dicts in the mfs's list have been modified

	// to do: currently, each qp window handles its own m_lastPreprocessTime, which
	//  is overly conservative, since they share the preprocessed list of the language (actually its mfs)

	if( status.getInputLang()->getMFS()->getRootDicList()
		->m_paths.getAnyModifiedSince(m_lastPreprocessTime))
		return TRUE;

	//check to make sure the status's files still exist
	if( status.m_pSrcDicts.getAnyDontExist())
		return TRUE;

	//check the control files to see if they have been modified

	// note we only check phonrule at this time.  Others could be added.

	CPathDescriptor pd;

	pd = status.getInputMFS()->getPhonrulePath();
	if(pd.getModifiedSince(m_lastPreprocessTime))
		return TRUE;

	return FALSE;
}
