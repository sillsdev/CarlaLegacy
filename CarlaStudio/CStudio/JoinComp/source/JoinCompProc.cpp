//
// 1.6a2 19-Nov-1999 hab Make the text output display using the lang font
//                       Since JoinComp no longer loses bridges when the same
//                       text is passed through, we can now apply every root
//                       dictionary to the input text
#include "..\stdafx.h"
#include <strstrea.h>
#include <fstream.h>
#include "DlgEditJoinCompProcess.h"
#include "JoinCompProc.h"
#include "SFMFile.h"
#include "ModelFilesSet.h"
#include "processOutput.h"
#include "processStatus.h"

#define INPUTFILE status.sRAWPath

IMPLEMENT_DYNCREATE(CJoinCompProcess, CDLLProcess);

extern "C"
{		int runProcess();

		BOOL setupProcess(char* lpszErrorStr,
					BOOL bDoTrace,
					BOOL bPartial,
					BOOL bShowCompounds,
					BOOL bDebug,
					const char* lpszWordMarker,
					const char* lpszAlloMarker,
					const char* lpszVarMarker,

					const char* lpszDictPath,
					const char* lpszINTXPath,
					const char* lpszInputFilePath,
					const char* lpszOutFilePath,
					const char* lpszLogFilePath);
}


CJoinCompProcess::CJoinCompProcess()
:CDLLProcess()
{
	setDefaultValues();
}


// called by CProcess constructor
// even if the values will be read in, we need this in case some values are
// missing (as will happen when the user is upgrading to a new version)
void CJoinCompProcess::setDefaultValues()
{
	m_bPartialCompoundsOK=	FALSE;
	//m_sVariantForm;
	m_sJoinWordsMarker="r";
	m_sAllomorphMarker="a";
}

void CJoinCompProcess::readParametersFromSFMFile(SFMFile *f)
{
	setDefaultValues();
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here
	BOOL bDummy;
	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker=="-Process")
			break;
		else checkAndReadBool("PartialCompoundsOK",m_bPartialCompoundsOK)

		else checkAndReadBool("ShowLogPanel",bDummy)// backward-compatiblity
		else checkAndReadBool("ShowJoinedTextPanel",bDummy)// backward-compatiblity
		else checkAndReadString("VariantFormMarker", m_sVariantFormMarker)
		else checkAndReadString("JoinWordsMarker", m_sJoinWordsMarker)
		else checkAndReadString("AllomorphMarker", m_sAllomorphMarker)
		else
		{
			f->throwParseFailure("JOINCOMPProcess", sMarker, sField);
			//MSG2("JOINCOMPProcess doesn't understand the field: ", sField);
			//throw("Couldn't read the Process Sequence from the project file.");
		}
	}
}

void CJoinCompProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process " << ID() << PROC_ENABLED_STATUS <<"\n";
	outputBool(fout, "PartialCompoundsOK", m_bPartialCompoundsOK);
	if(m_sVariantFormMarker.GetLength())
		fout << "\\VariantFormMarker " << m_sVariantFormMarker << "\n";

	if(m_sJoinWordsMarker.GetLength())
		fout << "\\JoinWordsMarker " << m_sJoinWordsMarker << "\n";

	if(m_sAllomorphMarker.GetLength())
		fout << "\\AllomorphMarker " << m_sAllomorphMarker << "\n";

	fout << "\\-Process " << ID() << "\n";
}

// EXCEPTIONS: CProcessFailure
// TO DO:	clean up error reporting
//			use dialog to say we're busy and give a cancel button
void CJoinCompProcess::processRAWTextFile(CProcessStatus& status)
{
	// !! i verified that the status is messed up as of here, when
	// this follows phonrule dll
		//!!!!!!
	//	AfxMessageBox("b4 jc test");
	//	registerLog(status, CPathDescriptor("d:/jc crash test.log"));
	//	AfxMessageBox("after jc test");
		//!!!!!!


	CPathDescriptor sLOGPath;
	try
	{
		CString sBaseName = status.m_sFileNameRoot + "-joincomp";
		sLOGPath = status.makeTempPath(sBaseName, ".log");
			//INPUTFILE.getFileName(), ".jnc");

		CModelFilesSet* pSourceMFS = status.getInputMFS();
		ASSERT(pSourceMFS);

#ifndef hab16a2 // invoke JoinComp on all dictionaries
		// JoinComp v. 0.2n preserves bridge chars in a text file so
		// we can do make multiple passes now
		CPathDescriptor sOutputRawTextPath = status.makeTempPath(sBaseName,".txt");
		CPathDescriptor sInputTextPath = status.sRAWPath;
		CPathDescriptor sOutputTextPath = sOutputRawTextPath;
		sOutputRawTextPath.deleteFile();
		sLOGPath.deleteFile();	// don't care if it is found or not

		int iRootFileIndex;
		int iRootFileEnabled;
		for(iRootFileIndex = 0, iRootFileEnabled = 0;
			iRootFileIndex< pSourceMFS->getRootDictCount();
			iRootFileIndex++)
		{
			char lpszErrorStr[1000];
				CPathDescriptor* pd = pSourceMFS->getRootDictPath(iRootFileIndex);
			if(!pd->m_bEnabled)
			  continue;
				// modify text file names so last output becomes this input
			if (iRootFileEnabled > 0)
			  {
				char cNum[4];
				sInputTextPath = sOutputTextPath;
				itoa(iRootFileIndex, cNum, 10);
				sOutputTextPath = status.makeTempPath(sBaseName + cNum, ".txt");
			  }
			BOOL OK =  setupProcess(lpszErrorStr,
					FALSE, //BOOL bDoTrace,
					m_bPartialCompoundsOK,
					TRUE, // TO DO: implement this BOOL bShowCompounds,
					TRUE, // TO DO: implement this BOOL bDebug,
					m_sJoinWordsMarker, //const char* lpszWordMarker,
					m_sAllomorphMarker, // const char* lpszAlloMarker,
					m_sVariantFormMarker, //const char* lpszVarMarker,

					// don't need short paths here, could be changed to long
					status.m_pSrcDicts[iRootFileEnabled]->getFullPath(),
					pSourceMFS->getIntxFullPath(),
					sInputTextPath.getFullPath(),
					sOutputTextPath.getFullPath(),
					sLOGPath.getFullPath());
			if(!OK)
				throw(CProcessFailure(this, lpszErrorStr));

			BOOL bError = runProcess();
			iRootFileEnabled++;
		}

	WIN32_FIND_DATA fileInfo;
			if(INVALID_HANDLE_VALUE == FindFirstFile(sOutputTextPath.getFullPath(), &fileInfo))
				throw(CProcessFailure(this, "JOINCOMP did not produce the expected src text file.  Read the transcript for more information."));
		// register joined text file so the user can view it

		CResultStreamFile* txtStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												"Joined Src Text", //short description
												"Source text with words in a phrase joined by underscores", // long description
												"Joined Src Text" // tab label
											),
					sOutputTextPath.getFullPath(),
					status.getInputLang()); // hab16a2 add lang

#ifdef _DEBUG
		status.m_pResultStreams.AssertValid();
#endif

		status.registerResultStream(txtStream);

		registerLog(status, sLOGPath, status.getInputLang());

		status.sRAWPath = sOutputTextPath; // this will feed the next pass through
													// if we're doing this for multiple dicts
#else // hab16a2 invoke JoinComp on all Dictionaries
	// TO DO NEED TO RUN JOINCOMP FOR EACH ROOT DICTIONARY
	// currently joincomp won't take multiple dicts and will
	// undo any previous runs, so we can't just run it multiple times

	//		int iRootFileIndex;
	//	for(iRootFileIndex = 0; iRootFileIndex< pSourceMFS->getRootDictCount(); iRootFileIndex++)
	//	{

			CPathDescriptor sOutputRawTextPath = status.makeTempPath(sBaseName,".txt");
			sOutputRawTextPath.deleteFile();
			sLOGPath.deleteFile();	// don't care if it is found or not

			char lpszErrorStr[1000];
			BOOL OK =  setupProcess(lpszErrorStr,
					FALSE, //BOOL bDoTrace,
					m_bPartialCompoundsOK,
					TRUE, // TO DO: implement this BOOL bShowCompounds,
					TRUE, // TO DO: implement this BOOL bDebug,
					m_sJoinWordsMarker, //const char* lpszWordMarker,
					m_sAllomorphMarker, // const char* lpszAlloMarker,
					m_sVariantFormMarker, //const char* lpszVarMarker,

					// don't need short paths here, could be changed to long
					status.m_pSrcDicts[0]->getFullPath(),//pSourceMFS->getRootDictShortPath(0),
					pSourceMFS->getIntxFullPath(),
					status.sRAWPath.getFullPath(),//.getFileFullName(),
					sOutputRawTextPath.getFullPath(),
					sLOGPath.getFullPath());
			if(!OK)
				throw(CProcessFailure(this, lpszErrorStr));

			BOOL bError = runProcess();

	WIN32_FIND_DATA fileInfo;
			if(INVALID_HANDLE_VALUE == FindFirstFile(sOutputRawTextPath.getFullPath(), &fileInfo))
				throw(CProcessFailure(this, "JOINCOMP did not produce the expected src text file.  Read the transcript for more information."));

		// register joined text file so the user can view it
		CResultStreamFile* txtStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												"Joined Src Text", //short description
												"Source text with words in a phrase joined by underscores", // long description
												"Joined Src Text" // tab label
											),
					sOutputRawTextPath.getFullPath());
#ifdef _DEBUG
		status.m_pResultStreams.AssertValid();
#endif

		status.registerResultStream(txtStream);

		registerLog(status, sLOGPath, status.getInputLang());

		status.sRAWPath = sOutputRawTextPath; // this will feed the next pass through
													// if we're doing this for multiple dicts
#endif // hab16a2 - invoke JoinComp on all dictionaries

	}
	catch(CProcessFailure failure)
	{
		registerLog(status, sLOGPath);
		throw(failure);
	}
	catch(CString sError)
	{
		throw(CProcessFailure(this, sError));
	}
}


// iFunctionCode unused by this subclass
BOOL CJoinCompProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditJoinCompProcess dlg;

	// Load in all our settings
	dlg.m_bPartialCompoundsOK=	m_bPartialCompoundsOK;
	dlg.m_sVariantFormMarker=			m_sVariantFormMarker;
	dlg.m_sJoinWordsMarker=		m_sJoinWordsMarker;
	dlg.m_sAllomorphMarker=		m_sAllomorphMarker;
//	dlg.m_bShowLogPanel=m_bShowLogPanel;
//	dlg.m_bShowJoinedTextPanel = m_bShowJoinedTextPanel;
	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bPartialCompoundsOK=	dlg.m_bPartialCompoundsOK;
	m_sVariantFormMarker=			dlg.m_sVariantFormMarker;
	m_sJoinWordsMarker=		dlg.m_sJoinWordsMarker;
	m_sAllomorphMarker=		dlg.m_sAllomorphMarker;
//	m_bShowLogPanel =		dlg.m_bShowLogPanel;
//	m_bShowJoinedTextPanel = dlg.m_bShowJoinedTextPanel;

	return TRUE;
}
