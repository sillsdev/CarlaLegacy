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

#ifndef mr270
#include "..\..\CarlaStudio\CStudio\csremote\CSRemoteRegistry.h"

#else // mr270
#include "..\..\csremote\CSRemoteRegistry.h"

#endif // mr270

#include "processingprefs.h"
#include "PathDescriptor.h"
#include "analysisprocesses.h"
#include "processSequence.h"
#include "projectDoc.h"
#include "carlalanguage.h"

#ifndef mr270
#include "..\..\CarlaStudio\CStudio\CS Utility DLL\cleaner.h"	// Added by ClassView

#else // mr270
#include "..\..\cs utility dll\cleaner.h"

#endif // mr270

#include <strstrea.h>
#include "ParseStream.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

const UINT     wm_ProcessingDone = RegisterWindowMessage( "DoneProcessingDoc" );


static void getCleanParams(CString& sTextMrk, CStringArray& arAnalysisMarkers)
{
	// LOOKUP THE INTERGEN PROCESS (not really needed if the user specified all the params)

	CInterlinearProcessSequence* pSeq = theApp.getProject()->getSourceLang()->getInterlinearSequence();
	if(!pSeq)
		throw("No Interlinear Sequence was found");
	CIntergenProcess* pIntergenProcess= (CIntergenProcess*)pSeq->getFirstProcessOfType(CIntergenProcess::ID());
	ASSERTX(pIntergenProcess->IsKindOf(RUNTIME_CLASS(CIntergenProcess)));
	if(!pIntergenProcess)
		throw("No Intergen Process was found");


	//-----------------------------------------------------------------------
	// GET THE TEXT MARKER, EITHER FROM THE REGISTRY OR FROM INTERGEN

	char lpszTextMark[21];
//	LONG res = getStringParamFromRegistry("TextMarker", lpszTextMark, 20);
//	if(!res && strlen(lpszTextMark))
//	{
//		sTextMrk = lpszTextMark;
//	}
	// empty this item so next time we're not confused if the user doesn't provide it
//	addParamToRegistry("TextMarker",  "" );

	if(sTextMrk.IsEmpty()) // user didn't provide this info
	{
		sTextMrk = pIntergenProcess->getWordMarker(); // so get it from intergen

		if(sTextMrk.IsEmpty())
			throw("Intergen's Word Marker was empty, a it was not specified remotely.");
	}

	//-----------------------------------------------------------------------
	// GET THE ANALYSIS MARKERS TO DELETE, EITHER FROM THE REGISTRY OR FROM INTERGEN

	char lpszAnalysisMarkers[_MAX_PATH+1];
//	res = getStringParamFromRegistry("AnalysisMarkers", lpszAnalysisMarkers, _MAX_PATH);
//	if(!res && strlen(lpszAnalysisMarkers))
//	{
		// break it up into an array of markers
//		CParseStream stream(lpszAnalysisMarkers);
//		CString sMrk;
//		while(stream.word(sMrk, FALSE))
//			arAnalysisMarkers.Add(sMrk);
//	}
	 // empty this item so next time we're not confused if the user doesn't provide it
//	addParamToRegistry("AnalysisMarkers",  "" );

	if(!arAnalysisMarkers.GetSize()) // user didn't provide this info
		pIntergenProcess->getAnalysisMarkers(arAnalysisMarkers); // so get it from intergen

}


LONG handleRemoteProcess( WPARAM wParam, LPARAM lParam)
{

	char lpszInPath[_MAX_PATH+1];
	char lpszOutPath[_MAX_PATH+1];


//	char lpszSrcLang[_MAX_PATH+1];
//	long res = getStringParamFromRegistry("SrcLang", lpszSrcLang, _MAX_PATH);
//	if(res)
//		return res;

	int iResult =99;

	CDocument* pDoc = NULL;
	try
	{
//		long res = getStringParamFromRegistry("InPath", lpszInPath, _MAX_PATH);
//allow a null path which will mean process the front-most
//		if(res)
//		{
//			lpszInPath[0] = '\0';
//			throw ("Couldn't get path of file out of registry\n");
//		}

		if(strlen(lpszInPath))
		{
			CPathDescriptor sPath = lpszInPath;
			if(wParam==1)	// first need to clean it (de-interlinearize it)
			{
				TRACE("De-interlinearize\n");
				CString sCmd;

				ofstream fout;
				CString sCleanedPath = sPath.getDirectory() + "_" + sPath.getFileName() + ".txt";
				fout.open(sCleanedPath);
				if(!fout.is_open())
				{
					CString s;
					s.Format("Couldn't create the file for writing the deinterlinearized text: %s", sCleanedPath);
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
					s.Format("While trying to deinterlinearize %s, got this error:\n%s", sPath.getFullPath(), lpszError);
					throw(s);
				}
				sPath = sCleanedPath;
				if(!sPath.fileExists())
					throw("The deinterlinearizing method apparently did not produce a file, or not in the right place.");
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
//		res = getStringParamFromRegistry("OutPath", lpszOutPath, _MAX_PATH);

//		if(res || (*lpszOutPath) == 0)	// if there was a problem or it's an empty string
//			cmd.eOutputLocation = CRemoteCommand::csSameFolderAsInput; // default
//		else
//		{
//			cmd.eOutputLocation = CRemoteCommand::csSpecifiedPath;
//			cmd.sDesiredOutputPath = lpszOutPath;
//		}

		// End jdh 9/7/99

		iResult = theApp.RunProcessors(&cmd, pDoc);
#ifndef hab15a3
		ASSERTX(pDoc);  // hab 09/09/1999 ensure pDoc is good
#endif // hab15a3

		// jdh 9/8/99 clear the modified bit so it doesn't later override the user's changes in Shoebox
		pDoc->SetModifiedFlag(FALSE);

//		addParamToRegistry("OutPath",  cmd.sActualOutputPath); //sOutputPath );
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
			AfxMessageBox("No Interlinear Sequence was found");
			break;
		}
		CIntergenProcess* pIntergenProcess= (CIntergenProcess*)pSeq->getFirstProcessOfType(CIntergenProcess::ID());
		ASSERTX(pIntergenProcess->IsKindOf(RUNTIME_CLASS(CIntergenProcess)));
		if(pIntergenProcess)
		{
			CString sValue = pIntergenProcess->getWordMarker();

			//--------------------------------------------------------------------
			// make the path for the text marker

			CString sPath;
			sPath.Format("Software\\SIL\\CarlaStudio\\Publish\\%s\\Intergen\\TextMarker", pLang->getAbrev());

			// set the value  for the text marker

			 lReturn = ::RegSetValue(HKEY_CURRENT_USER,
									sPath,
									REG_SZ,
									LPCTSTR(sValue),
									sValue.GetLength());
			if ( lReturn != ERROR_SUCCESS )
			{
				AfxMessageBox("There was an error while CarlaStudio was putting params into the registry");
				break;
			}


			//--------------------------------------------------------------------
			// make the path for the analysis markers

			sValue  = pIntergenProcess->getAnalysisMarkers();
			sPath.Format("Software\\SIL\\CarlaStudio\\Publish\\%s\\Intergen\\AnalMarker", pLang->getAbrev());

			// set the value  for the text marker

			lReturn = ::RegSetValue(HKEY_CURRENT_USER,
									sPath,
									REG_SZ,
									LPCTSTR(sValue),
									sValue.GetLength());
			if ( lReturn != ERROR_SUCCESS )
			{
				AfxMessageBox("There was an error while CarlaStudio was putting params into the registry");
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
