// Hook.cpp : Implementation of CHook
#include "stdafx.h"
#include "CARLAStudioApp.h"
#include <atlconv.h>

#ifndef mr270
#import "..\..\CarlaStudio\CStudio\csautomation\csautomation.tlb" no_namespace

#else // mr270
#import "..\..\csautomation\csautomation.tlb" no_namespace

#endif // mr270

#include "Hook.h"

#include "LangModelsDoc.h"
#include "CarlaLanguage.h"
#include "InputDoc.h"
//#include "..\..\csremote\CSRemoteRegistry.h"
#include "processingprefs.h"
#include "PathDescriptor.h"
#include "analysisprocesses.h"
#include "processSequence.h"
#include "projectDoc.h"
//#include "carlalanguage.h"
#ifndef mr270

#include "..\..\CarlaStudio\CStudio\CS Utility DLL\cleaner.h"	// Added by ClassView

#else // mr270
#include "..\..\cs utility dll\cleaner.h"

#endif // mr270



#include <strstrea.h>
#include "ParseStream.h"
#include <io.h>

/////////////////////////////////////////////////////////////////////////////
// CHook
static CString sThrow; // static so it doesn't go out of scope during the throw
						// and loose its contents
#define throwIt throw (LPCTSTR)sThrow;

static BOOL backupFile(LPCTSTR lpszInPath, int nMaxBaks);

STDMETHODIMP CHook::PerformTask(VARIANT varICSTask)
{
	USES_CONVERSION;
	if(!varICSTask.punkVal)
		return E_POINTER;

	if(varICSTask.vt != VT_DISPATCH && varICSTask.vt != VT_UNKNOWN)
		return E_INVALIDARG;


	ITaskPtr qTask(varICSTask.punkVal);
	char* lpszInPath = OLE2A(qTask->GetInputPath());

	CDocument* pDoc = NULL;
	try
	{
		// clear this in case we don't get to the end
		CComBSTR bstrNULL("");
		qTask->PutActualOutputPath(bstrNULL.m_str);


		CPathDescriptor sPath = lpszInPath;
		if(!sPath.fileExists())
		{
			sThrow.Format("Could not find the input file, %s", sPath.getFullPath());
			throwIt;
		}

		CRemoteCommand cmd;
		// fill in our CRemoteCommand from the COM Task object

		cmd.iGoal = qTask->GetGoal();

		cmd.eOutputLocation = (CRemoteCommand::CSOUTPUTLOCATION)qTask->GetOutputLocation();
		if(cmd.eOutputLocation == (CRemoteCommand::CSOUTPUTLOCATION)csSpecifiedPath)
		{
			cmd.sDesiredOutputPath = OLE2A(qTask->GetDesiredOutputPath());
			if(cmd.sDesiredOutputPath.GetLength() == 0)
				throw "You must specify the desired output path";
		}
		else if(cmd.eOutputLocation == csReplaceInput)
		{
			const int kNumBackups = 3;
			if(!backupFile(sPath, kNumBackups))
			{
				cmd.sDesiredOutputPath = sPath.getDirectory()+sPath.getFileName()+"2"+sPath.getFileExtension();
				CString s;
				s.Format("Couldn't backup %s, so the output file will not overwrite it.  Instead, the resulting file will be %s", sPath.getFileFullName(), cmd.sDesiredOutputPath);
				AfxMessageBox(s);
			}
			else
				cmd.sDesiredOutputPath = sPath;
		}

		cmd.pSourceLang = getLangFromCode(qTask->GetSourceLangCode());
		if(!cmd.pSourceLang)
			throw "You must specify a source language";

		CString sTarLangCode = OLE2A(qTask->GetTargetLangCode());
		if(cmd.iGoal == CProcessingPrefs::kTargetText)
		{
			if(sTarLangCode.IsEmpty())
				throw "You must specify a target language when doing transfer";

			cmd.pTargetLang = theApp.getProject()->getLangFromID(sTarLangCode);
			if(!cmd.pTargetLang)
			{
				sThrow.Format("This project does not have a language with code %s", sTarLangCode);
				throwIt;
			}
		}


		if(qTask->GetInputIsInterlinear())	// first need to clean it (de-interlinearize it)
		{
			// may throw exception
			sPath = deinterlinearize(sPath, qTask);




			cmd.sMarkersToIncludeOrExclude = OLE2A(qTask->GetInterlinearWordMarker());
			cmd.sMarkersToIncludeOrExclude.TrimLeft();

			// trim any leading backslash
			if(!cmd.sMarkersToIncludeOrExclude.IsEmpty() && cmd.sMarkersToIncludeOrExclude[0] == '\\')
				cmd.sMarkersToIncludeOrExclude = cmd.sMarkersToIncludeOrExclude.Mid(1);

			if(cmd.sMarkersToIncludeOrExclude.IsEmpty())
				throw "You must specify the marker for the text line";

			// set up intergen process to remove unwanted empty lines left in by intergen
			CIntergenProcess *pI = getIntergenProcess(qTask->GetSourceLangCode());
			if(pI)
				pI->m_sPostIntergenStripMarker = cmd.sMarkersToIncludeOrExclude;


			// add a leading back-slash
			cmd.sMarkersToIncludeOrExclude = CString("\\")+cmd.sMarkersToIncludeOrExclude ;

			cmd.bIncludeMarkers  = TRUE;;
		}
		else // plain 'ol text, so set the textin text markers
		{
			cmd.bIncludeMarkers  = qTask->GetIncludeLinesWithSpecifiedMarkers();
			cmd.sMarkersToIncludeOrExclude = OLE2A(qTask->GetMarkersToIncludeOrExclude());
			if(cmd.sMarkersToIncludeOrExclude.IsEmpty())
				throw("You must include the text markers to include or exclude");
		}

		// for now, we don't have a way of passing these parameters to anyone, so we
		// just change the values in the TextInModel and set the modified bit of the language

		cmd.pSourceLang->getTextInModel().sMarkersToIncludeOrExclude.setData(cmd.sMarkersToIncludeOrExclude);
			// radio 0 is include, 1 is exclude
		cmd.pSourceLang->getTextInModel().rIncludeOrExcludeMarkers.setData(cmd.bIncludeMarkers?0:1);
		cmd.pSourceLang->getLangDoc()->SetModifiedFlag(); // so it will get save and change the control files

		pDoc = theApp.OpenDocumentFile(sPath);
		if(!pDoc)
		{
			sThrow.Format("Couldn't open the file: %s", sPath.getFullPath());
			throwIt;
		}

		// bring CStudio to the front during parsing.  The caller is responsible
		// for bringing itself to the front aftwards
		::SetForegroundWindow(theApp.GetMainWnd()->m_hWnd);

		int iResult = theApp.RunProcessors(&cmd, pDoc);
		if(iResult)
		{
			sThrow = cmd.sErrorMessage;
			throwIt;
		}

		// put result parameters in the Task Object
		CComBSTR bstrOut(cmd.sActualOutputPath);
		qTask->PutActualOutputPath(bstrOut.m_str);
	}
	catch(LPCTSTR lpszError)
	{
		return Error(lpszError);
	}
	catch(CString s)
	{
		return Error(s);
	}

	return S_OK;
}

STDMETHODIMP CHook::get_LangCodes(VARIANT *pVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	// TODO: Add your implementation code here

	return S_OK;
}

STDMETHODIMP CHook::get_LangCodesString(BSTR *pVal)
{
	USES_CONVERSION;
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	CProjectDoc *pp = theApp.getProject();
	CComBSTR s;

	int i;
	CTypedPtrArray<CPtrArray , CLangModelsDoc*>& vecLangDocs = pp->getLangDocs();
	for(i = 0; i<vecLangDocs.GetSize(); i++)
	{
		CLangModelsDoc* pDoc = vecLangDocs.ElementAt(i);
		CCarlaLanguage *pL = pDoc->getLang();
		s += A2OLE(pL->getUniqueID());
		if(i<(vecLangDocs.GetSize()-1)) // if not the last one
			s += L",";
	}
	s.CopyTo(pVal);
	return S_OK;
}

STDMETHODIMP CHook::get_CurrentIntergenWordMarker(BSTR bstrLangCode, BSTR *pbstrWordMarker)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	try
	{
		// GET THE TEXT MARKER FROM INTERGEN

		CIntergenProcess* pI = getIntergenProcess(bstrLangCode);
		CComBSTR b(pI->getWordMarker());
		*pbstrWordMarker = b.Detach();
	}
	catch (LPCTSTR lpszError)
	{
		return Error(lpszError);
	}

	return S_OK;
}

STDMETHODIMP CHook::get_CurrentIntergenAnalysisMarkers(BSTR bstrLangCode, BSTR *pAnalysisMarkers)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	// GET THE ANALYSIS MARKERS
	try
	{
		CIntergenProcess* pIntergenProcess = getIntergenProcess(bstrLangCode);

		//CStringArray arAnalysisMarkers;
		CString sMarkers = pIntergenProcess->getAnalysisMarkers();
		*pAnalysisMarkers = sMarkers.AllocSysString();
	}
	catch (LPCTSTR lpszError)
	{
		return Error(lpszError);
	}

	return S_OK;
}

// LOOKUP THE INTERGEN PROCESS
// Exceptions: LPCTSTR
// Protected (not COM)
CIntergenProcess* CHook::getIntergenProcess(BSTR bstrLangCode)
{
	// will throw an exception if not found
	CCarlaLanguage* pLang = getLangFromCode(bstrLangCode);
	ASSERTX(pLang);

	CInterlinearProcessSequence* pSeq = pLang->getInterlinearSequence();
	if(!pSeq)
		throw ("No Interlinear Sequence was found");
	CIntergenProcess* pIntergenProcess= (CIntergenProcess*)pSeq->getFirstProcessOfType(CIntergenProcess::ID());
	ASSERTX(pIntergenProcess->IsKindOf(RUNTIME_CLASS(CIntergenProcess)));
	if(!pIntergenProcess)
		throw ("No Intergen Process was found");

	return pIntergenProcess;
}

// Protected (not COM)
CCarlaLanguage* CHook::getLangFromCode(BSTR bstrLangCode)
{
	USES_CONVERSION;
	CString sLangCode = OLE2A(bstrLangCode);
	if(sLangCode.IsEmpty())
		throw ("Somehow CarlaStudio was handed an empty language code string");

	CCarlaLanguage* pLang = theApp.getProject()->getLangFromID(sLangCode);
	if(!pLang)
	{
		sThrow.Format("This project does not have a language with code %s", sLangCode);
		throwIt;
	}

	return pLang;
}

STDMETHODIMP CHook::get_CurrentTextInIncludeExcludeMarkers(BSTR bstrLang, BSTR *pbstrMarkers)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	try
	{
		CCarlaLanguage* pLang = getLangFromCode(bstrLang);
		*pbstrMarkers = pLang->getTextInModel().sMarkersToIncludeOrExclude.getData().AllocSysString();
	}
	catch (LPCTSTR lpszError)
	{
		return Error(lpszError);
	}
	return S_OK;
}

// returns true if the user has specified which markers to inlclude (as opposed
// to which markers to exclude)
STDMETHODIMP CHook::get_CurrentTextInIncludeSpecified(BSTR bstrLang, BOOL *pbInclude)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	try
	{
		CCarlaLanguage* pLang = getLangFromCode(bstrLang);
		// radio 0 is include, 1 is exclude
		*pbInclude = (pLang->getTextInModel().rIncludeOrExcludeMarkers == 0);
	}
	catch (LPCTSTR lpszError)
	{
		return Error(lpszError);
	}
	return S_OK;
}


// exceptions: LPCTSTRs
// returns path to the file this produces
CString CHook::deinterlinearize(CPathDescriptor& pathInput, ITask* pTask)
{
	USES_CONVERSION;
	ITaskPtr qTask(pTask);

	ofstream fout;
	CString sCleanedPath = pathInput.getDirectory() + "_" + pathInput.getFileName() + ".txt";
	fout.open(sCleanedPath);
	if(!fout.is_open())
	{
		sThrow.Format("Couldn't create the file for writing the deinterlinearized text: %s", sCleanedPath);
		throwIt;
	}
	try
	{
		CString sTextMrk;
		// this property InterlinearWordMarker, is use only when we're de-interlinearizing
		// (using clean). Else MarkersToIncludeOrExclude is relevant.
		sTextMrk = OLE2A(qTask->GetInterlinearWordMarker());
		sTextMrk.TrimRight();
		sTextMrk.TrimLeft();
		if(sTextMrk.GetLength() && sTextMrk[0] == '\\')	// trim off leading slash
			sTextMrk = sTextMrk.Mid(1);
		if(sTextMrk.IsEmpty())
			throw "The Interlinear Word Marker is empty.";

		// break up the string of markers into an array of markers
		CParseStream stream(OLE2A(qTask->GetAnalysisMarkers()));
		CString sMrk;
		CStringArray analysisMarkers;
		while(stream.word(sMrk, FALSE))
		{
			if(sMrk.GetLength() && sMrk[0] == '\\')	// trim off leading slash
				sMrk = sMrk.Mid(1);
			analysisMarkers.Add(sMrk);
		}

		CSCleaner cleaner;
		cleaner.stripITXAnalysis(fout, pathInput.getFullPath(), sTextMrk, analysisMarkers);


		//this algorithm stuffed the text onto the previous marker, whatever it was
		// this would require that the user specify what all those markers might be
		// to ample, so that it would parse the right ones.
		//cleaner.cleanITX(fout, pathInput.getFullPath(), sTextMrk, analysisMarkers);

		// the blanks algorithm is dangerous because if the blank is missing,
		// it will throw away lines after the last analysis line and before
		// the next text line (lines like \ch, \v, etc).
		//cleaner.cleanITXBlanks(fout, pathInput.getFullPath(), sTextMrk);
	}
	catch(LPCTSTR lpszError)
	{
		sThrow.Format("While trying to deinterlinearize %s, got this error:\n%s", pathInput.getFullPath(), lpszError);
		throwIt;
	}

	if(!CPathDescriptor(sCleanedPath).fileExists())
		throw("The deinterlinearizing method apparently did not produce a file, or not in the right place.");

	return sCleanedPath;
}


// makes multiple backups
BOOL backupFile(LPCTSTR lpszInPath, int nMaxBaks)
{
	char lpszBakPath[_MAX_PATH+1];
	//sprintf(lpszBakPath, "%s.bak", lpszInPath); // leave the old extension, but add .bak
	int nMaxNumber = nMaxBaks + 1;// plus one because we always delete one of the files
						// if nMaxBaks is 3, then we go to 4 but delete file 1, leaving three around at any one time

	for(int i=1; i <= nMaxNumber; i++)
	{
		sprintf(lpszBakPath, "%s.%d.bak", lpszInPath, i);
		if(-1==_access(lpszBakPath, 00)) // if not found
			break;
	}
	if(i > nMaxNumber) // all numbers used up
		i = 1;

	// remove the next highest, so we can use that slot next time
	// that way, after, say, 1,2,3,4, we'll use 1 and delete 2, so next
	// time we'll use 2 and delete 3, etc.
	char lpszRemoveBakPath[_MAX_PATH+1];
	sprintf(lpszRemoveBakPath, "%s.%d.bak", lpszInPath, (i%nMaxNumber)+1);
	remove(lpszRemoveBakPath);

	// delete any old backup using this name
	remove(lpszBakPath);
	// change the name of the input to that of the backup
	return CopyFile(lpszInPath, lpszBakPath, FALSE);
}