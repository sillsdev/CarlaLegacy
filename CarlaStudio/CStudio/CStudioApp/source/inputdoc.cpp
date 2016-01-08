// InputDoc.cpp : implementation file
//
//////////////////////////////////////////////////////////////////////
// hab 09/17/99 CC passes after intergen and after sample used default font;
//              made them use the language font.
//	JDH 11/10/99 added "trace file" button/menu
//	jdh 2/9/00  Fixed bug when found opening a file and hitting a sharing violation.
// 2.1.2 hab 03-Mar-2000 Shoebox related constants moved to processstatus.h
//	jdh 23-May-2000 added pre-TRACE check on large files

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "InputDoc.h"
#include <fstream.h>
#include "ProjectDoc.h"
#include "ProcessSequence.h"
#include "cwprocess.h"
#include "processoutput.h"
#include "processStatus.h"

#include "InputDocView.h"
#include "ProcessingPrefs.h"
#include "PrefsInputDoc.h"

#include "CarlaLanguage.h"
#include "SFMFile.h"
#include "ParseStream.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CInputDoc is an abstract class

IMPLEMENT_DYNCREATE(CInputDoc, CDocument)


// this one is for dynamic creation, which can't have any parameters
CInputDoc::CInputDoc()
:m_pView(NULL),
 //m_pDisplayPrefs(new CPrefsInputDocDisplay()),
 m_pBaseStream(NULL), m_pProcessStatus(NULL),
 m_bBaseIsEditable(TRUE)
{
}


BOOL CInputDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;
	return TRUE;
}

CInputDoc::~CInputDoc()
{
	if(m_pProcessStatus)
		delete m_pProcessStatus;
}

//const UINT     wm_ProcessFrontMostDoc = RegisterWindowMessage( "ProcessFrontmostDoc" );

BEGIN_MESSAGE_MAP(CInputDoc, CDocument)
	//{{AFX_MSG_MAP(CInputDoc)
	ON_COMMAND(ID_EditInputDocProperties, OnEditProcessingProperties)
	ON_UPDATE_COMMAND_UI(ID_EditInputDocProperties, OnUpdateEditInputDocProperties)
	ON_COMMAND(ID_InputDocDisplay, OnEditDisplayProperties)
	ON_UPDATE_COMMAND_UI(ID_RunProcessors, OnUpdateRunProcessors)
	ON_COMMAND(ID_RunProcessors, OnRunProcessors)
	ON_COMMAND(ID_FILE_SAVEDOCUMENTAS, OnFileSaveAs)
	ON_COMMAND(ID_RunTrace, OnRunTrace)
	ON_UPDATE_COMMAND_UI(ID_RunProcessors, OnUpdateRunTrace)

	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CInputDoc diagnostics

#ifdef _DEBUG
void CInputDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CInputDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

// called by CInputDocTextView::OnInitialUpdate()
void CInputDoc::doViewDependentSetup()
{
	loadResultPanels(FALSE, NULL);	// no problem if not found

	UpdateAllViews(NULL);
}


// Virtual
// setup the page which tracks which of the available
//	result panels the user wants to show
void CInputDoc::customizePropertySheet(CPropertySheet& dlg)
{
	// this will add a page for these prefs
	getProcessingPrefs()->customizePropertySheet(dlg, TRUE);

//	CInputDoc::customizePropertySheet(dlg);
}

void CInputDoc::propertySheetClosed(CPropertySheet& dlg)
{
	getProcessingPrefs()->propertySheetClosed(dlg);
//	CInputDoc::propertySheetClosed(dlg);
}

//			23-May-2000 jdh added pre-TRACE check on large files
void CInputDoc::OnRunTrace()
{
	const long kMaxBeforeTraceQuestion=200; //bytes
	const long kMaxBeforeTraceUnwise=1000; //bytes

	if(m_pBaseStream->getFileSize() > kMaxBeforeTraceQuestion)
	{
		if (IDOK != AfxMessageBox("Normally, you want to limit your traces to a single word.  Click OK to trace anyways.", MB_OKCANCEL))
			return;
	}

	if(m_pBaseStream->getFileSize() > kMaxBeforeTraceUnwise)
	{
		if (IDOK != AfxMessageBox("No, really.  The trace from a file this large could fill up your hard drive.  Click OK to trace at your own risk.", MB_OKCANCEL))
			return;
	}

	CProcessingPrefs* pPrefs = getProcessingPrefs();

	// turn it on
	pPrefs->m_dwFlags  |= CProcessingPrefs::kTrace;

	OnRunProcessors();

	// turn it back off
	pPrefs->m_dwFlags &= ~ CProcessingPrefs::kTrace;

}

void CInputDoc::OnUpdateRunTrace(CCmdUI* pCmdUI)
{
	pCmdUI->Enable();
}

void CInputDoc::OnUpdateRunProcessors(CCmdUI* pCmdUI)
{
	//pCmdUI->Enable(theApp && theApp->getProject());
	CCarlaStudioApp* pApp = (CCarlaStudioApp*)AfxGetApp( );

	if(pApp != NULL) // this gets called *really* early on
	{
		if(pApp->getProject() != NULL)
			pCmdUI->Enable(TRUE);
		else pCmdUI->Enable(FALSE);
	}
}

CWnd* CInputDoc::getWindow()
{
	ASSERTX(m_pView);
	return m_pView->GetParent();
}
void CInputDoc::OnUpdateEditInputDocProperties(CCmdUI* pCmdUI)
{
}

void CInputDoc::OnEditProcessingProperties()
{
	CPropertySheet dlg("Processing Goal");

	customizePropertySheet(dlg);
	if(!dlg.DoModal())
		return;
	readPropertySheet(dlg);
	propertySheetClosed(dlg);

	SetTitle(getFullFileName(GetPathName()));
	UpdateAllViews(NULL);
}

void CInputDoc::OnEditProcessSequence()
{
}

void CInputDoc::loadResultPanels(BOOL bWarnIfNotFound, CProcessStatus* pProcessResults)
{

}


void CInputDoc::SetTitle(LPCTSTR lpszTitle)
{
	CString s(lpszTitle);
	if(!getSrcLang())
		return;
	s+=" (";
	s+= getInputLang()->getName();
	s+=") --> ";
	switch ( getProcessingPrefs()->getGoal())
	{
/*	kSourceAna,		// analysis and auto disambiguation
			kGlossedInterlinear, // perform sentrans "adjustment"
			kAutoSynthCheck,		 // analyze, synthesis, and compare
			kTargetANA,
			kTargetText}*/
	case CProcessingPrefs::kSourceAna:
			s+="ANA (";
			s+= getProcessingPrefs()->getInputLang()->getName();
			s+=")";
			break;
		case CSrcTextProcessingPrefs::kGlossedInterlinear:
			s+= "Interlinear";
			break;
		case CProcessingPrefs::kAutoSynthCheck:
			s+= "Auto-Synthesis Check";
			break;
		case CProcessingPrefs::kTargetANA:
			s+="ANA (";
			if(getProcessingPrefs()->getTarLang())
				s+= getProcessingPrefs()->getTarLang()->getName();
			else s+= "ERROR";
			s+=")";
			break;
		case CProcessingPrefs::kTargetText:
			s+= "Text (";
			if(getProcessingPrefs()->getTarLang())
				s+= getProcessingPrefs()->getTarLang()->getName();
			else s+= "ERROR";
			s+=")";
			break;
		default: " Error: unknown goal"; break;
	}
	if(IsModified())
		s+="*";

	if(!m_bBaseIsEditable)
		s+="      READONLY";

	CDocument::SetTitle(s);
}


// called by CProjectDoc when it is saving
void CInputDoc::writeParams(ofstream & fout)
{
	fout << "\\" << getBeginMarker() << " \"" << getInputFilePath() << "\"\n";
	fout << "\\windowPlacement ";
	outputWindowPlacement(fout, getWindow());
	getProcessingPrefs()->writeToFile(fout);
	fout << "\\" << getEndMarker() << "\n";
}

#ifdef hab212
// moved to processstatus.h by jdh 14-Mar-2000
const UINT     wm_RemoteSaveAll = RegisterWindowMessage( "ShbxSaveAll" );//jdh
const UINT     wm_RemoteRefreshAll = RegisterWindowMessage( "ShbxRefreshAll" );//jdh
// returns TRUE if everything went ok
#endif //hab212

BOOL CInputDoc::doRunProcessors(CRemoteCommand* pRemoteCmd/*=NULL*/)
{
	CWnd* pWnd = getWindow();
	if(pWnd)
		pWnd->BringWindowToTop();

	if(IsModified())	// if changed the contents of the file we're processing
		OnSaveDocument(GetPathName());

	CCarlaLanguage *pSourceLang = getProcessingPrefs()->getSrcLang(); // could be null
	CCarlaLanguage *pTargetLang = getProcessingPrefs()->getTarLang(); // could be null
	ASSERTX(m_strPathName.GetLength());

	#define GOAL getProcessingPrefs()->getGoal()

	// on remote calls, we can override user prefs. Sorry this is all so ugly
	if(pRemoteCmd)
	{
		getProcessingPrefs()->setGoal(pRemoteCmd->iGoal);
		pSourceLang = pRemoteCmd->pSourceLang ;
		if(pSourceLang)
			getProcessingPrefs()->setSrcLang(pSourceLang);
		pTargetLang = pRemoteCmd->pTargetLang;
		if(pTargetLang)
			getProcessingPrefs()->setTarLang(pTargetLang);
		SetModifiedFlag(TRUE);// will also fix the title
	}

	// make the new status structure, which keeps track of which files have been
	// created and are in line for processing, among other things

	if(m_pProcessStatus)
		delete m_pProcessStatus;
	m_pProcessStatus = new CProcessStatus(m_strPathName,
								getProcessingPrefs(),
								pSourceLang,
								(pSourceLang!=0)?pSourceLang->getMFS():NULL,
								pTargetLang,
								(pTargetLang!=0)?pTargetLang->getMFS():NULL);

	//----- ask Shoebox, if it is running, to do a save all
	// note: if this was invoked by a call from CSRemote, then the send will hang us forever
	// thus, we have this bRemoteCall flag to prevent that.  If we are called from
	// Shoebox, it will have saved everything anyways as part of its batch file command
	/*  Windows 10 hangs on this; never worked anyway, so commenting it off
	if(!pRemoteCmd)
		SendMessage(HWND_BROADCAST, wm_RemoteSaveAll, NULL, NULL); */

	//------ SETUP THE TEMP DIRECTORY ----------------------

	if( getCanDoAnalysis() || getProcessingPrefs()->getDoTransfer()
			|| getProcessingPrefs()->getDoInterlinearize()) // JDH 5/28/99 Added to allow Interlinearizing ANA files
	{
		ASSERTX(pSourceLang);
		if (!m_pProcessStatus->setupTempDir(pSourceLang->getName()))
			return FALSE;
	}
	else	// synthesis only
	{
		ASSERTX(pTargetLang);
		if (!m_pProcessStatus->setupTempDir(pTargetLang->getName()))
			return FALSE;
	}

	// load stuff that processors will commonly need, but which doesn't really
	// belong conceptually to the mfs into it, so that the processors can avoid
	// having to know about CCarlaLanguage just to get at the comment character, for example

	if(pSourceLang)
		pSourceLang->prepareMFSForProcessors();
	if(pTargetLang)
		pTargetLang->prepareMFSForProcessors();

	//---- SETUP PROGRESS BAR
	if( getCanDoAnalysis())
		m_pProcessStatus->expectSequenceWithCount(getSrcLang()->getAnalysisSequence()->getProcessorCount());
	if( getProcessingPrefs()->getDoInterlinearize())
		m_pProcessStatus->expectSequenceWithCount(getSrcLang()->getInterlinearSequence()->getProcessorCount());

	if(getProcessingPrefs()->getDoTransfer())
	{
		CTransferProcessSequence* pTSeq = getSrcLang()->getTransferSequence( pTargetLang);
		if(pTSeq)
			m_pProcessStatus->expectSequenceWithCount(pTSeq->getProcessorCount());
	}
	if(getProcessingPrefs()->getDoSynthesis())	// actually, i think you *always* have a synth seq
	{
		CSynthesisProcessSequence* pSSeq = getSrcLang()->getSynthesisSequence();
		if(pSSeq)
			m_pProcessStatus->expectSequenceWithCount(pSSeq->getProcessorCount());
	}


	//---- BRING THE CONTROL FILES UP TO DATE ON THE DISK
	theApp.getProject()->synchronizeExternals();

	//---- ANALYSIS ----------------------------------------------------------

	BOOL bOK = TRUE;
	if( getCanDoAnalysis())
	{
		CProcessSequence* pAnalysisSequence = getSrcLang()->getAnalysisSequence();

		m_pProcessStatus->setCurrentSequenceFunction(pAnalysisSequence->getFunctionCode());
		m_pProcessStatus->setInputLang(pSourceLang);
		m_pProcessStatus->setOutputLang(NULL);
		// do the analysis

		bOK = pAnalysisSequence->continueProcessing(m_pProcessStatus);

		// copy the analyzed text to the user's directory
		if(bOK )
		{
			CPathDescriptor newPath(pSourceLang->getMFS()->getOutputDirAnalyzedANA()+m_pProcessStatus->m_sFileNameRoot+".ana");
			redirectOutputFile(GOAL, CProcessingPrefs::kSourceAna,
				m_pProcessStatus->sANAPath,
				newPath,
				m_pProcessStatus);
		}
	}

	//---- INTERLINEAR ----------------------------------------------------------

	if(bOK && getProcessingPrefs()->getDoInterlinearize())
	{
		ASSERTX(pSourceLang);
		CProcessSequence* pS = pSourceLang->getInterlinearSequence();
		ASSERTX(pS);

		m_pProcessStatus->setInputLang(pSourceLang);
#ifndef hab15a4
		m_pProcessStatus->setOutputLang(pSourceLang); // hab 1999.09.17
		// a final CC pass will use the Output Language;
		// it needs to be set to the Source lang here (at least it worked for me...)
#else
		m_pProcessStatus->setOutputLang(NULL);
#endif
		m_pProcessStatus->setCurrentSequenceFunction(pS->getFunctionCode());
		bOK = pS->continueProcessing(m_pProcessStatus);

		if(bOK )//&& GOAL==CProcessingPrefs::kGlossedInterlinear)
		{
			CString sDestDir;
			CPathDescriptor newPath ;
			if(pRemoteCmd)
			{
				switch(pRemoteCmd->eOutputLocation)
				{
					case CRemoteCommand::csSameFolderAsInput:
							sDestDir = ::getDirectory(m_strPathName);
							break;
					case CRemoteCommand::csSpecifiedPath:
					case CRemoteCommand::csReplaceInput:
							newPath = pRemoteCmd->sDesiredOutputPath;
							break;
					default: throw("Unknown OutputLocation setting");
							break;
				}
			}
			else if(getProcessingPrefs()->m_dwFlags & CProcessingPrefs::kOutputItxToSameDir) // for morris
				sDestDir = ::getDirectory(m_strPathName);
			else // copy to interlinear output dir
				sDestDir = pSourceLang->getMFS()->getOutputDirInterlinear();

			if(newPath.GetLength() == 0)
				newPath = sDestDir+m_pProcessStatus->m_sFileNameRoot+".itx";
			//m_pProcessStatus->sInterlinearPath.copyTo(newPath);

			redirectOutputFile(GOAL, CProcessingPrefs::kGlossedInterlinear,
				m_pProcessStatus->sInterlinearPath,
				newPath,
				m_pProcessStatus);

			if(pRemoteCmd)
				pRemoteCmd->sActualOutputPath=newPath;
		}
	}

	//---- TRANSFER ----------------------------------------------------------

	if(bOK && getProcessingPrefs()->getDoTransfer())
	{
		//CCarlaLanguage* pTarget = getProcessingPrefs()->getTarLang();
		ASSERTX(pTargetLang);
		CTransferProcessSequence* pTransferSequence = getSrcLang()->getTransferSequence(pTargetLang);
		ASSERTX(pTransferSequence);
		m_pProcessStatus->setInputLang(pSourceLang);
		m_pProcessStatus->setOutputLang(pTargetLang);
		m_pProcessStatus->setCurrentSequenceFunction(pTransferSequence->getFunctionCode());

		bOK = pTransferSequence->continueProcessing(m_pProcessStatus);
		if(bOK )//&& GOAL==CProcessingPrefs::kTargetANA)
		{
			//CPathDescriptor x = pTargetLang->getMFS()->getOutputDirTransferedANA();
			//CString z = "s" + x  + "v";

			CPathDescriptor newPath(pTargetLang->getMFS()->getOutputDirTransferedANA()+m_pProcessStatus->m_sFileNameRoot+".ana");
			redirectOutputFile(GOAL, CProcessingPrefs::kTargetANA,
				m_pProcessStatus->sANAPath,
				newPath,
				m_pProcessStatus);
			//m_pProcessStatus->sANAPath.copyTo(pTargetLang->getMFS()->getOutputDirTransferedANA()+m_pProcessStatus->m_sFileNameRoot+".ana");

			if(pRemoteCmd)
				pRemoteCmd->sActualOutputPath=newPath;
		}
	}

	//---- SYNTHESIS ----------------------------------------------------------

	if(bOK && getProcessingPrefs()->getDoSynthesis())
	{
		ASSERTX(pTargetLang);
		//CCarlaLanguage* pTarget = getProcessingPrefs()->getTarLang();
		CProcessSequence* pS = pTargetLang->getSynthesisSequence();
		ASSERTX(pS);
#ifndef hab15a4
		m_pProcessStatus->setInputLang(pTargetLang); // hab 1999.09.17
		// a final CC pass will use the Input Language;
		// it needs to be set to the Target lang here  (at least it worked for me...)
#else
		m_pProcessStatus->setInputLang(NULL);
#endif
		m_pProcessStatus->setOutputLang(pTargetLang);
		m_pProcessStatus->setCurrentSequenceFunction(pS->getFunctionCode());
		bOK = pS->continueProcessing(m_pProcessStatus);

		// copy the synthesized text to the user's directory
		if(bOK)// && GOAL==CProcessingPrefs::kTargetText)
		{
			CPathDescriptor newPath;
			CString sDestDir;
			if(pRemoteCmd)
			{
				switch(pRemoteCmd->eOutputLocation)
				{
					case CRemoteCommand::csSameFolderAsInput:
							sDestDir = ::getDirectory(m_strPathName);
							break;
					case CRemoteCommand::csSpecifiedPath:
							newPath = pRemoteCmd->sDesiredOutputPath;
							break;
					// this case now allowed by csbridge, but would be if they scripted directly
					case CRemoteCommand::csReplaceInput:
							throw("Whoops.  You probably didn't mean to say that CStudio should do a transfer that overwrites the initial file.");
							break;
					default: throw("Unknown OutputLocation setting");
							break;
				}
			}
			else
				sDestDir = pTargetLang->getMFS()->getOutputDirSynthesizedText();

			if(newPath.GetLength() == 0)
				newPath = sDestDir+m_pProcessStatus->m_sFileNameRoot+"_"+pTargetLang->getAbrev()+".txt";

			redirectOutputFile(GOAL, CProcessingPrefs::kTargetText,
				m_pProcessStatus->sRAWPath,
				newPath,
				m_pProcessStatus);
			if(pRemoteCmd)
					pRemoteCmd->sActualOutputPath=newPath;
		}
	}

	if(bOK)
		m_pProcessStatus->finishedProcessing();
		storeAvailablePanels();

	loadResultPanels(bOK, m_pProcessStatus); // don't warn about missing files if there was an error already reported
	m_pProcessStatus->closeProgressDialog();

	ASSERTX(m_pView);	//!!!!!!!WHO'S SETTING THIS?
	m_pView->updatePanels();

#ifndef rde265
	//----- ask Shoebox, to refresh all (if this isn't a remote command)
//	if(!pRemoteCmd)
#else
	//----- ask Shoebox, if it is running, to do a save all
#endif  // rde265
	/*  Windows 10 hangs on this; never worked anyway, so commenting it off
	PostMessage(HWND_BROADCAST, wm_RemoteRefreshAll, NULL, NULL);	// don't wait for it to finish that
*/
	return bOK;
}



CCarlaLanguage* CInputDoc::getInputLang()
{
	ASSERTX(getProcessingPrefs());
	return getProcessingPrefs()->getInputLang();
}

CCarlaLanguage* CInputDoc::getSrcLang()
{
	ASSERTX(getProcessingPrefs());
	return getProcessingPrefs()->getSrcLang();
}

CCarlaLanguage* CInputDoc::getTarLang()
{
	ASSERTX(getProcessingPrefs());
	return getProcessingPrefs()->getTarLang();
}

void CInputDoc::storeAvailablePanels()
{
	ASSERTX(m_pProcessStatus);
	for(int i=0; i< m_pProcessStatus->m_pResultStreams.GetSize(); i++)
	{
		getDisplayPrefs()->includeDescriptor(m_pProcessStatus->m_pResultStreams[i]->getDescriptor());
	}
}


// called by the inputdocView.onupdate()
// not all the result streams are necessarily visible, or shown
// in the order of our results list, since the user has control
// over what shows up (and, eventually, in what order they show up)

// @@@@@@@#######@@@@@@@#########
// this appears to be totally incorrect logic here.
//  it appears that what you really get is the nth stream type
// that is marker as showable.  We need to change it so that what
// you get is truelly the Nth Visible stream.
// @@@@@@@#######@@@@@@@#########

CResultStream* CInputDoc::getNthVisibleStream(int index)
{
	// notice that this call has the unfortunate sematics of
	//  "give me the Nth descriptor of what you *expect* to be availible"
	//  it may expect a stream that isn't actually availible, because the
	// procssing may have failed.
	CResultStreamDescriptor* pRSD = NULL;

	int iTotalExpectedStreams = getDisplayPrefs()->getExpectedVisibleDescriptorCount();

	// unless something went wrong, this will only execute once
	// the for loop is to skip over missing streams looking for one
	// that is actually availible.  For example, if ample fails,
	// the .ana will be missing but the .log will be there.
	CResultStream* pRS=NULL;


	// there is a bug here where iTotalExpectedStreams is too small, so this
	// fails.  I have removed the asserts until I find the problem because
	// it isn't really catastrophic so long as the caller checks the result

	for (int i=index; !pRS  && i < iTotalExpectedStreams; i++)
	{	pRSD = getDisplayPrefs()->getNthVisibleDescriptor(i);
		ASSERTX(pRSD);
		// now we need to get from this descriptor to the right stream
		pRS = getResultStreamFromDescriptor(*pRSD);
		// we won't be able to find it when the processing was aborted for some reason
		// so the call must notice that it is null
	}
#ifdef _DEBUG
	ASSERT(pRS);
#endif

	//ASSERTX(pRS);
	return pRS;
}

CPrefsInputDocDisplay* CInputDoc::getDisplayPrefs()
{
	return theApp.getProject()->getInputDocDisplayPrefs();
	//ASSERTX(pDisplayPrefs);
	//return pDisplayPrefs;
}

CResultStream* CInputDoc::getResultStreamFromDescriptor(CResultStreamDescriptor& rRSD)
{
	ASSERTX(m_pProcessStatus);
	for (int i=0; i< m_pProcessStatus->m_pResultStreams.GetSize(); i++)
	{
		CResultStreamDescriptor& testRSD = *m_pProcessStatus->m_pResultStreams[i]->getDescriptor();
		if(testRSD == rRSD)
			return m_pProcessStatus->m_pResultStreams[i];
	}
	return NULL;
}

void CInputDoc::OnEditDisplayProperties()
{
	CTypedPtrArray<CPtrArray, CResultStream*>  *pResultStreams=0;
	if(m_pProcessStatus)
		pResultStreams=&m_pProcessStatus->m_pResultStreams;

	getDisplayPrefs()->doEditDialog(pResultStreams);// could be null
	m_pView->updatePanels();
	UpdateAllViews(NULL);
}

// called by inputDocView as a hook so we can change the menu title
void CInputDoc::OnActivate()
{
/*	CWnd* pWnd = AfxGetMainWnd(); //getWindow(); //AfxGetMainWnd();
	CMenu* pTopMenu = pWnd->GetMenu();
	if(!::IsMenu(pTopMenu->m_hMenu))
		return;

	CString s;
	const int kInputDocMenuPosition = 3;	// actually the *expected* position, it does change
	int iInputDocMenuPosition = kInputDocMenuPosition;
	pTopMenu->GetMenuString(iInputDocMenuPosition, s, MF_BYPOSITION);
	TRACE("CInputDoc::OnActivate menu was %s\n", s);
	if(s == "&View")	// when maximized, all menus are shifted one to the right by the little icon menu
		++iInputDocMenuPosition;

	pTopMenu->ModifyMenu( iInputDocMenuPosition,
		MF_BYPOSITION | MF_STRING, 0,
		getFileName(GetPathName()));
	pWnd->DrawMenuBar();
	*/
}

void CInputDoc::readPropertySheet(CPropertySheet& dlg)
{
	// read changes made to the corresponding property page
	getProcessingPrefs()->readPropertySheet(dlg);

	// in the future, can read other pages here

	// set the src lang of the base stream in case the user changed it
	ASSERTX(m_pBaseStream);
	m_pBaseStream->setLang(getInputLang());
}

void CInputDoc::OnRunProcessors()
{
	doRunProcessors(FALSE);
}


///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
// CSourceTextInputDoc
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
//#include "pathdescriptor.h"

IMPLEMENT_DYNCREATE(CSourceTextInputDoc, CInputDoc)

// STATIC
// called by CProjectDoc when it is opening
// This reads parameters out of the project document.  These
// params give us the path of the base file (src document)
// the size and placement of the window, the processing goal, etc.

// NOTE: This is *NOT* called when the user opens a document explicity; only when starting up and reopening docs
//				which the user left open last time.
CSourceTextInputDoc* CSourceTextInputDoc::loadDocument( LPCTSTR lpszField, SFMFile & f)
{
	CDocTemplate* pT = theApp.getDocTemplate(getRegFileTypeID());
	ASSERTX(pT);
	CParseStream stream(lpszField);
	CString sPath;
	stream.getQuotedString(sPath);
	CPathDescriptor path(sPath);
	if(!path.fileExists())	// don't bother the user (mar 99)
	//if(!theApp.askUserToFindFileIfNotFound(sPath, getRegFileTypeID()))
	{
		// need to skip the rest of the fields related to this document in the project file
		CString sMarker, sField;
		do
		{
			f.getField(sMarker, sField);
		} while (sMarker != END_MARKER());
		return NULL;
	}

	// jdh I'm not certain what this does, but it appears that it will just set
	// the member variable m_strPathName, so that whent the panels are displayed,
	// we then go and load up that file into the first panel.
	CSourceTextInputDoc* pDoc = (CSourceTextInputDoc*)pT->OpenDocumentFile(sPath);

	if(pDoc)	//jdh 2/9/00  Added check for NULL doc, which will crop up when there was something like a sharing violation.
	{
		ASSERTX(pDoc->IsKindOf(RUNTIME_CLASS(CSourceTextInputDoc)));
		pDoc->readParams(f);

		// jdh 12April2001	check the readonly flag of the file
		pDoc->SetBaseReadOnly(FILE_ATTRIBUTE_READONLY & ::GetFileAttributes(pDoc->GetPathName()));
		/*the above sets the title, too*/
	}
	else //jdh 2/9/00  Added handler for when we get a NULL doc
	{
		// need to skip the rest of the fields related to this document in the project file
		CString sMarker, sField;
		do
		{
			f.getField(sMarker, sField);
		} while (sMarker != END_MARKER());
	}
	return pDoc;
}

// this one is for dynamic creation, which can't have any parameters
CSourceTextInputDoc::CSourceTextInputDoc()
:m_pProcessingPrefs(0)
{	CProjectDoc *pProjectDoc = theApp.getProject(TRUE);
	if(!pProjectDoc)
		throw(new CFileException());

	//m_pSrcLang = pProjectDoc->getSrcLang();
	//m_pTarLang = pProjectDoc->getTarLang(); // may be NULL

	// copy-construct the prefs
	m_pProcessingPrefs = new CSrcTextProcessingPrefs(pProjectDoc->getSourceProcessingDefaults());
}

/*BOOL CSourceTextInputDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;
	return TRUE;
}*/

CSourceTextInputDoc::~CSourceTextInputDoc()
{
	if(m_pProcessingPrefs)
		delete m_pProcessingPrefs;
}

// there will be several streams returned by the processors,
// which are pointed to by our m_pProcessStatus member.
//	We also need to display the original document we are
//  processing; this method makes a stream for that document.
//  Called by CInputDocView::populate()
CResultStream* CSourceTextInputDoc::getBaseStream()
{
	if(!m_pBaseStream)
	{
		CResultStreamDescriptor* pDesc =
		new CResultStreamDescriptor(NULL,
								"Src File",
								"Source Text File" // long description
								);
		// note: m_pSrcLang may be null at this point (see constructor)
		m_pBaseStream = new CResultStreamFile(pDesc, m_strPathName, getSrcLang());
	}
	return m_pBaseStream;
}

BEGIN_MESSAGE_MAP(CSourceTextInputDoc, CInputDoc)
	//{{AFX_MSG_MAP(CSourceTextInputDoc)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSourceTextInputDoc diagnostics

#ifdef _DEBUG
void CSourceTextInputDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CSourceTextInputDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CSourceTextInputDoc commands

// called by CProjectDoc when it is opening
void CSourceTextInputDoc::readParams(SFMFile & f)
{
	CString sMarker, sField;
	while(f.getField(sMarker, sField))
	{
		if(sMarker==getEndMarker())
			break;
		else if (sMarker == "windowPlacement")
		{
			CParseStream stream(sField);
			stream.getWindowPlacement(getWindow());
			getWindow()->Invalidate();
		}
		else if (sMarker == CSrcTextProcessingPrefs::BEGIN_MARKER())
		{
			if(m_pProcessingPrefs)
				delete m_pProcessingPrefs;

			m_pProcessingPrefs = new CSrcTextProcessingPrefs(&f);
			m_pProcessingPrefs->finishCreate();
		}
		else THROWSTRING2("CSourceTextInputDoc doesn't understand the marker: ", sMarker);
	}
}



///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
// CAnaInputDoc
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////

IMPLEMENT_DYNCREATE(CAnaInputDoc , CInputDoc)

// STATIC
// called by CProjectDoc when it is opening
// This reads parameters out of the project document.  These
// params give us the path of the base file (ana document)
// the size and placement of the window, the processing goal, etc.
CAnaInputDoc * CAnaInputDoc ::loadDocument( LPCTSTR lpszField, SFMFile & f)
{
	CDocTemplate* pT = theApp.getDocTemplate(getRegFileTypeID());
	ASSERTX(pT);
	CParseStream stream(lpszField);
	CString sPath;
	stream.getQuotedString(sPath);
	//if(!theApp.askUserToFindFileIfNotFound(sPath, getRegFileTypeID()))
	//	return NULL;

	CPathDescriptor path(sPath);
	if(!path.fileExists())	// don't bother the user (mar 99)
	{
		// need to skip the rest of the fields related to this document in the project file
		CString sMarker, sField;
		do
		{
			f.getField(sMarker, sField);
		} while (sMarker != END_MARKER());
		return NULL;
	}
	// jdh I'm not certain what this does, but it appears that it will just set
	// the member variable m_strPathName, so that whent the panels are displayed,
	// we then go and load up that file into the first panel.
	CAnaInputDoc * pDoc = (CAnaInputDoc *)pT->OpenDocumentFile(sPath);

	ASSERTX(pDoc->IsKindOf(RUNTIME_CLASS(CAnaInputDoc )));
	pDoc->readParams(f);
	pDoc->SetTitle(getFullFileName(pDoc->GetPathName()));
	return pDoc;
}

// this one is for dynamic creation, which can't have any parameters
CAnaInputDoc ::CAnaInputDoc ()
:m_pProcessingPrefs(NULL)
{	CProjectDoc *pProjectDoc = theApp.getProject(TRUE);
	if(!pProjectDoc)
		throw(new CFileException());

	// copy-construct the prefs
	m_pProcessingPrefs = new CAnaProcessingPrefs(pProjectDoc->getAnaProcessingDefaults());
}

CAnaInputDoc ::~CAnaInputDoc ()
{
	if(m_pProcessingPrefs)
		delete m_pProcessingPrefs;
}


BEGIN_MESSAGE_MAP(CAnaInputDoc , CInputDoc)
	//{{AFX_MSG_MAP(CAnaInputDoc )
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAnaInputDoc  diagnostics

#ifdef _DEBUG
void CAnaInputDoc ::AssertValid() const
{
	CDocument::AssertValid();
}

void CAnaInputDoc ::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CAnaInputDoc  commands


// called by CProjectDoc when it is opening
void CAnaInputDoc ::readParams(SFMFile & f)
{
	CString sMarker, sField;
	while(f.getField(sMarker, sField))
	{
		if(sMarker==getEndMarker())
			break;
		else if (sMarker == "windowPlacement")
		{
			CParseStream stream(sField);
			stream.getWindowPlacement(getWindow());
			getWindow()->Invalidate();
		}
		else if (sMarker == CAnaProcessingPrefs::BEGIN_MARKER())
		{
			if(m_pProcessingPrefs)
				delete m_pProcessingPrefs;

			m_pProcessingPrefs = new CAnaProcessingPrefs(&f);
			m_pProcessingPrefs->finishCreate();
		}
		else THROWSTRING2("CAnaInputDoc  doesn't understand the marker: ", sMarker);
	}
}

// there will be several streams returned by the processors,
// which are pointed to by our m_pProcessStatus member.
//	We also need to display the original document we are
//  processing; this method makes a stream for that document.
//  Called by CInputDocView::populate()
CResultStream* CAnaInputDoc ::getBaseStream()
{
	if(!m_pBaseStream)
	{
		CResultStreamDescriptor* pDesc =
		new CResultStreamDescriptor(NULL,
								"ANA File",
								"ANA File" // long description
								);
		// note: m_pSrcLang may be null at this point (see constructor)
		m_pBaseStream = new CResultStreamFile(pDesc, m_strPathName, getInputLang());
	}
	return m_pBaseStream;
}


// save changes the user has made to the base document (src text or ana)

// Function name	: CInputDoc::OnSaveDocument
// Description	    : This will save the contents of the base stream (the first panel,
//						the src or ana doc, the one the user is allowed to edit).
// Return type		: BOOL
// Argument         : LPCTSTR lpszPathName
// Created by	    : John Hatton
// Created on      :  12/26/98 10:10:18 AM
BOOL CInputDoc::OnSaveDocument(LPCTSTR lpszPathName)
{
	if(!m_bBaseIsEditable)
		return TRUE;

	ASSERTX(m_pView);
	BOOL bSaved= m_pView->saveBaseStream(lpszPathName);
	if(bSaved)
		this->SetModifiedFlag(FALSE);
	return bSaved;
}



void CInputDoc::SetModifiedFlag(BOOL bModified)
{
	if(bModified==IsModified())
		return; // no change

	CDocument::SetModifiedFlag(bModified);
	SetTitle(getFullFileName(GetPathName()));
}

void CInputDoc::OnFileSaveAs()
{
	CDocTemplate* pDT = GetDocTemplate();
	CString sFileTypeName;
	pDT->GetDocString(sFileTypeName, CDocTemplate::regFileTypeName);
	CString sFilter;
	pDT-> GetDocString(sFilter, CDocTemplate::filterName);
	CString sExt;//="txt";
	pDT-> GetDocString(sExt, CDocTemplate::filterExt);
	sFilter += "|*";
	sFilter += sExt;
	sFilter+= "||";
	CFileDialog dlg( FALSE,
		sExt,
		this->GetPathName(),
		OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
		sFilter, NULL );
	//CString sPrompt("Save As");

	//char* lpszPrompt = new char[sPrompt.GetLength()+1];
	//strcpy(lpszPrompt, sPrompt);
	dlg.m_ofn.lpstrTitle  = "Save As";//lpszPrompt;

	if(IDOK == dlg.DoModal())
	{
		this->SetPathName(dlg.GetPathName());
		OnSaveDocument(dlg.GetPathName());
	}
}

// we have to override this because our base stream also needs the path name
// changed.  This is used when the user does a saveas
void CInputDoc::SetPathName(LPCTSTR lpszPathName, BOOL bAddToMRU)
{
	if(m_pBaseStream)
	{
		m_pBaseStream->setPath(lpszPathName);
	}

	CDocument::SetPathName(lpszPathName, bAddToMRU);
}


// this is called after each stage of processing, in order to (if appropriate)
// copy the file from the temp directory to a user-designated location, and
// to change the result-stream that is shown to this new file, rather than to
// the original.  The benefit of that step is so that if the user asks for the
// file to be opened externally, the correct copy of the file is opened (not the
// one in the temp directory).
// nGoal is the users's goal
// nStage is the stage that we just finished (e.g. CProcessingPrefs::kSourceAna)
void CInputDoc::redirectOutputFile(int nGoal, int nStage,
								   CPathDescriptor &originalOutPath,
								   CPathDescriptor &newPath,
								   CProcessStatus *pStatus)
{
	// if we do have this flag kLeaveNonGoalsInTemp set, then only
	// continue if this stage is our final goal
	if((getProcessingPrefs()->m_dwFlags & CProcessingPrefs::kLeaveNonGoalsInTemp)
		&& nGoal!=nStage)
		return;

	originalOutPath.copyTo(newPath);


	// now find the matching result stream and change it to point to this new copy
	int nCount = m_pProcessStatus->m_pResultStreams.GetSize();
	for(int i=nCount-1; i >=0; i--)
	{
		CResultStream* p = m_pProcessStatus->m_pResultStreams.ElementAt(i);
		ASSERT(p);
		if(p->IsKindOf(RUNTIME_CLASS(CResultStreamFile)))
		{
			CResultStreamFile* pf = (CResultStreamFile*)p;
			if(	pf->getPath() == originalOutPath)
			{
				pf->setPath(newPath);
				break;
			}

		}
	}
}

//jdh 12April2001 Support various readonly behaviors
void CInputDoc::SetBaseReadOnly(BOOL bReadOnly)
{
	m_bBaseIsEditable = ! bReadOnly;
	m_pView->SetBaseReadOnly(bReadOnly);
	SetTitle(getFullFileName(GetPathName()));
}
