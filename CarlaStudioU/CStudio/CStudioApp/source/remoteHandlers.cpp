// Handle messages sent from csRemote
// Note that this file is for csRemote, which will be (or has been)
// superceded by the COM-based csBridge (or whatever better name I
// come up with).  CSRemote uses the registry to pass parameters to
// and from CarlaStudio, and a windows message to tell CS to read
// those parameters and process the file.

// jdh 9/7/99 allow csremote to specify output path
// jdh 9/8/99 clear the doc's modified bit after processing so it doesn't later override the user's changes in Shoebox
// hab 09/09/1999 ensure pDoc is valid before setting modified flag or processing file

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "remoteHandlers.h"

#include "InputDoc.h"
#include "..\..\csremote\CSRemoteRegistry.h"
#include "processingprefs.h"
#include "PathDescriptor.h"
#include "analysisprocesses.h"
#include "processSequence.h"
#include "projectDoc.h"
#include "carlalanguage.h"
#include "cleaner.h"
#include <strstrea.h>
#include "ParseStream.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

const UINT     wm_ProcessingDone = RegisterWindowMessage( _T("DoneProcessingDoc") );


static void getCleanParams(CString& sTextMrk, CStringArray& arAnalysisMarkers)
{
	// LOOKUP THE INTERGEN PROCESS (not really needed if the user specified all the params)

	CInterlinearProcessSequence* pSeq = theApp.getProject()->getSourceLang()->getInterlinearSequence();
	if(!pSeq)
		throw(_T("No Interlinear Sequence was found"));

	USES_CONVERSION;
	CIntergenProcess* pIntergenProcess= (CIntergenProcess*)pSeq->getFirstProcessOfType(A2CT(CIntergenProcess::ID()));
	ASSERTX(pIntergenProcess->IsKindOf(RUNTIME_CLASS(CIntergenProcess)));
	if(!pIntergenProcess)
		throw(_T("No Intergen Process was found"));


	//-----------------------------------------------------------------------
	// GET THE TEXT MARKER, EITHER FROM THE REGISTRY OR FROM INTERGEN

	TCHAR lpszTextMark[21];
	LONG res = getStringParamFromRegistry(_T("TextMarker"), lpszTextMark, 20);
	if(!res && _tcslen(lpszTextMark))
	{
		sTextMrk = lpszTextMark;
	}
	// empty this item so next time we're not confused if the user doesn't provide it
	addParamToRegistry(_T("TextMarker"),  _T("") );

	if(sTextMrk.IsEmpty()) // user didn't provide this info
	{
		sTextMrk = pIntergenProcess->getWordMarker(); // so get it from intergen

		if(sTextMrk.IsEmpty())
			throw(_T("Intergen's Word Marker was empty, a it was not specified remotely."));
	}

	//-----------------------------------------------------------------------
	// GET THE ANALYSIS MARKERS TO DELETE, EITHER FROM THE REGISTRY OR FROM INTERGEN

	TCHAR lpszAnalysisMarkers[_MAX_PATH+1];
	res = getStringParamFromRegistry(_T("AnalysisMarkers"), lpszAnalysisMarkers, _MAX_PATH);
	if(!res && _tcslen(lpszAnalysisMarkers))
	{
		// break it up into an array of markers
		CParseStream stream(lpszAnalysisMarkers);
		CString sMrk;
		while(stream.word(sMrk, FALSE))
			arAnalysisMarkers.Add(sMrk);
	}
	 // empty this item so next time we're not confused if the user doesn't provide it
	addParamToRegistry(_T("AnalysisMarkers"),  _T("") );

	if(!arAnalysisMarkers.GetSize()) // user didn't provide this info
		pIntergenProcess->getAnalysisMarkers(arAnalysisMarkers); // so get it from intergen

}


LONG handleRemoteProcess( WPARAM wParam, LPARAM lParam)
{

	TCHAR lpszInPath[_MAX_PATH+1];
	TCHAR lpszOutPath[_MAX_PATH+1];


//	TCHAR lpszSrcLang[_MAX_PATH+1];
//	long res = getStringParamFromRegistry(_T("SrcLang"), lpszSrcLang, _MAX_PATH);
//	if(res)
//		return res;

	int iResult =99;

	CDocument* pDoc = NULL;
	try
	{
		long res = getStringParamFromRegistry(_T("InPath"), lpszInPath, _MAX_PATH);
//allow a null path which will mean process the front-most
		if(res)
		{
			lpszInPath[0] = '\0';
//			throw (_T("Couldn't get path of file out of registry\n"));
		}

		if(_tcslen(lpszInPath))
		{
			CPathDescriptor sPath = lpszInPath;
			if(wParam==1)	// first need to clean it (de-interlinearize it)
			{
				TRACE(_T("De-interlinearize\n"));
				CString sCmd;

				ofstream fout;
				CString sCleanedPath = sPath.getDirectory() + _T("_") + sPath.getFileName() + _T(".txt");
				USES_CONVERSION;
				fout.open(T2CA(sCleanedPath));
				if(!fout.is_open())
				{
					CString s;
					s.Format(_T("Couldn't create the file for writing the deinterlinearized text: %s"), (LPCTSTR)sCleanedPath);
					throw(s);
				}
				try
				{
					CStringArray analysisMarkers;
					CString sTextMrk;
					getCleanParams(sTextMrk, analysisMarkers);


					CSCleaner cleaner;
					cleaner.cleanITX(fout, sPath.getFullPath(), sTextMrk, analysisMarkers);
					// the blanks algorithm is dangerous because if the blank is missing,
					// it will throw away lines after the last analysis line and before
					// the next text line (lines like \ch, \v, etc).
					//cleaner.cleanITXBlanks(fout, sPath.getFullPath(), sTextMrk);
				}
				catch(LPCTSTR lpszError)
				{
					CString s;
					s.Format(_T("While trying to deinterlinearize %s, got this error:\n%s"), (LPCTSTR)sPath.getFullPath(), lpszError);
					throw(s);
				}
				sPath = sCleanedPath;
				if(!sPath.fileExists())
					throw(_T("The deinterlinearizing method apparently did not produce a file, or not in the right place."));
			}
			pDoc = theApp.OpenDocumentFile(sPath);
		}

#ifndef hab15a3
		if (pDoc)  // hab 109/09/1999 make sure doc exists (it could be null if the OpenDocumentFile above did not find it)
		  {
#endif // hab15a3
		CRemoteCommand cmd;
		cmd.iGoal = CProcessingPrefs::kGlossedInterlinear; // always interlinearize

		// Begin jdh 9/7/99 allow csremote to specify output path
		res = getStringParamFromRegistry(_T("OutPath"), lpszOutPath, _MAX_PATH);

		if(res || (*lpszOutPath) == 0)	// if there was a problem or it's an empty string
			cmd.eOutputLocation = CRemoteCommand::csSameFolderAsInput; // default
		else
		{
			cmd.eOutputLocation = CRemoteCommand::csSpecifiedPath;
			cmd.sDesiredOutputPath = lpszOutPath;
		}

		// End jdh 9/7/99

		iResult = theApp.RunProcessors(&cmd, pDoc);
#ifndef hab15a3
		ASSERTX(pDoc);  // hab 09/09/1999 ensure pDoc is good
#endif // hab15a3

		// jdh 9/8/99 clear the modified bit so it doesn't later override the user's changes in Shoebox
		pDoc->SetModifiedFlag(FALSE);

		addParamToRegistry(_T("OutPath"),  cmd.sActualOutputPath); //sOutputPath );
#ifndef hab15a3
		  } // end of if (pDoc)  hab 09/09/1999
#endif // hab15a3
	}
	catch(LPCTSTR lpszError)
	{
		AfxMessageBox(lpszError);
		iResult = 9; // WHAT SHOULD THIS REALY BE?
	}

	// tell the caller that we are finished by sending the wm_ProcessingDone message
	// back to it
	PostThreadMessage((DWORD)lParam, // thread id
		wm_ProcessingDone, NULL, (long)iResult);
	return NULL;
}

// handle request from csremote to put various information in the registry
LONG handlePublishParamsMessage(WPARAM wParam, LPARAM lParam)
{
	USES_CONVERSION;
	CProjectDoc *pProj = theApp.getProject();
	if(!pProj)
		return 1;
	long lReturn=-1;

	for(int i=0; i<pProj->getLanguageCount(); i++)
	{
		CCarlaLanguage* pLang = pProj->getLangFromIndex(i);
		if(!pLang)
			return 2;

		// get the corresponding intergen processor

		CInterlinearProcessSequence* pSeq = pLang->getInterlinearSequence();
		if(!pSeq)
		{
			AfxMessageBox(_T("No Interlinear Sequence was found"));
			break;
		}
		CIntergenProcess* pIntergenProcess= (CIntergenProcess*)pSeq->getFirstProcessOfType(A2CT(CIntergenProcess::ID()));
		ASSERTX(pIntergenProcess->IsKindOf(RUNTIME_CLASS(CIntergenProcess)));
		if(pIntergenProcess)
		{
			CString sValue = pIntergenProcess->getWordMarker();

			//--------------------------------------------------------------------
			// make the path for the text marker

			CString sPath;
			sPath.Format(_T("Software\\SIL\\CarlaStudio\\Publish\\%s\\Intergen\\TextMarker"), (LPCTSTR)pLang->getAbrev());

			// set the value  for the text marker

			 lReturn = ::RegSetValue(HKEY_CURRENT_USER,
									sPath,
									REG_SZ,
									LPCTSTR(sValue),
									sValue.GetLength());
			if ( lReturn != ERROR_SUCCESS )
			{
				AfxMessageBox(_T("There was an error while CarlaStudio was putting params into the registry"));
				break;
			}


			//--------------------------------------------------------------------
			// make the path for the analysis markers

			sValue  = pIntergenProcess->getAnalysisMarkers();
			sPath.Format(_T("Software\\SIL\\CarlaStudio\\Publish\\%s\\Intergen\\AnalMarker"), (LPCTSTR)pLang->getAbrev());

			// set the value  for the text marker

			lReturn = ::RegSetValue(HKEY_CURRENT_USER,
									sPath,
									REG_SZ,
									LPCTSTR(sValue),
									sValue.GetLength());
			if ( lReturn != ERROR_SUCCESS )
			{
				AfxMessageBox(_T("There was an error while CarlaStudio was putting params into the registry"));
				break;
			}
		}
	}

	// tell the caller that we are finished by sending the wm_ProcessingDone message
	// back to it
	PostThreadMessage((DWORD)lParam, // thread id
		wm_ProcessingDone, NULL, (long)lReturn);

	return 0;
}
