// LangModelsDoc.cpp : implementation file
//
// JDH 6/3/99 Added OnModifyTests
// jdh 11/9/99 added finishCreateInterface() to enable bi-directional transfer user-interface topic
//       10-Dec-1999 hab Transfer Process Sequence uses "From source"
//                       when the kLocateTransferWithTarget is set
// rde270   26-Jun-2002 After opening the language file, but before opening the control files,
//                      call the function which sets up the code page to be used for
//                      text conversion. Pass it the ???outit.ctl filespec which contains
//                      the best clue to the encoding of the project (it has both word-forming
//                      characters as well as string classes). The code page determined from
//                      the contents of that file will decide the code page to be used for
//                      subsequent data conversion via the 'T2CU8' and 'U82CT' macros (see
//                      CSConv.h).

#include "stdafx.h"
#include "CarlaStudioApp.h"
#include "LangModelsDoc.h"
#include "CWInterface.h"
#include "CWTopic.h"
#include "TabbedTreeChild.h"
#include "CarlaLanguage.h"
#include "ProjectDoc.h"
#include "WizNewFromFiles.h"
#include "WizNewFromScratch.h"
#include "TextDisplayInfo.h"

#include "DlgNewLanguage.h"
#include <strstrea.h>
#include "SFMFile.h"
#include "ParseStream.h"
#include "PathDescriptor.h" // just for checkForFileError

#include "DlgProgress.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

// these are defined in ProjectDoc.cpp.  They are needed because
// I need to pass these parameters to NewDocument, but can't
// call it directly, and thus can't override it to add the parameters
extern CString gsNewLangAbrev;
extern CString gsDirContainingCarlaSet;
/////////////////////////////////////////////////////////////////////////////
// CLangModelsDoc

IMPLEMENT_DYNCREATE(CLangModelsDoc, CTabbedTreeDoc)

CLangModelsDoc::CLangModelsDoc()
:m_pLang(NULL)
//	m_pCarlaMenuInterface(NULL), m_pFunctionalInterface(NULL)
{
	if(!theApp.getProject())
		throw(new CFileException());

	m_pCarlaMenuInterface = new CWCarlaMenuInterface(this);
	m_pFunctionalInterface = new CWFunctionalInterface(this);
	m_pCurrentInterface = m_pFunctionalInterface;

	if(gsNewLangAbrev.GetLength())	// invoked by the projectdoc import code
	{
		m_pLang = new CCarlaLanguage(this, gsNewLangAbrev);
		ASSERTX(gsDirContainingCarlaSet.GetLength());
		m_pLang->m_sDirContainingCarlaSet = gsDirContainingCarlaSet;
		SetModifiedFlag(TRUE);
		// tell the project that this lang is available
		getProject()->registerLangDoc(this);
		//m_pCurrentInterface->setupForLang(m_pLang);
		m_pFunctionalInterface->setupForLang(m_pLang);
		m_pCarlaMenuInterface->setupForLang(m_pLang);
	}
}

/*
// this one called during import from CARLAMenu
// the caller also must call CDocTemplate::createNewFrame() to give us a window,
// since it is not going to call OnNewDocument
CLangModelsDoc::CLangModelsDoc(LPCTSTR lpszAbrev, LPCTSTR lpszDirContainingCarlaSet)
{
	m_pLang = new CCarlaLanguage(lpszAbrev);
	m_pLang->m_sDirContainingCarlaSet = lpszDirContainingCarlaSet;
	getProject()->registerLangDoc(this);
	SetModifiedFlag(TRUE);
}
*/

CLangModelsDoc::~CLangModelsDoc()
{
	// the following is actually to avoid a bug which happens when you cancel in the middle
	// of the carlamenu wizard.  The project wouldn't know that this was deleted
	getProject()->removeLangDoc(this);

	if(m_pLang)
		delete m_pLang;
	if(m_pFunctionalInterface)
		delete m_pFunctionalInterface;
	if(m_pCarlaMenuInterface)
		delete m_pCarlaMenuInterface;
}

BOOL CLangModelsDoc::OnNewDocument()
{
	if(!theApp.getProject())
		return FALSE;

	if (!CTabbedTreeDoc::OnNewDocument())
		return FALSE;

	ASSERTX(m_pCurrentInterface);
/*	if(gsNewLangAbrev.GetLength())	// invoked by the projectdoc import code
	{
		m_pLang = new CCarlaLanguage(gsNewLangAbrev);
		ASSERTX(gsDirContainingCarlaSet.GetLength());
		m_pLang->m_sDirContainingCarlaSet = gsDirContainingCarlaSet;
	}
	else	// invoked by the user and the File menu
	{
*/
	m_pLang = new CCarlaLanguage(this);


	// create a new language or import one from files?
	CDlgNewLanguage dlg;
	if(IDCANCEL == dlg.DoModal())
	{	MessageBox( NULL, _T("Language creation cancelled."), _T("Note:"), MB_OK);
		return FALSE;
	}

	if(dlg.m_iCreationMethod ==0)
	{
		// to do: put up new language wizard
		CWizNewFromScratch wiz(m_pLang->getMFS()->getRootDicList());
		if(IDCANCEL == wiz.DoModal())
		{
			MessageBox( NULL, _T("Language creation cancelled."), _T("Note:"), MB_OK);
			return FALSE;
		}
		wiz.m_dictRootUnifiedPage.OnOK(); // dump the list into the mfs
		m_pLang->getMFS()->setUnifiedDictMode(wiz.m_dictRootUnifiedPage.m_bUnifiedMode);
		m_pLang->getMFS()->exchangeAffixDictPaths(	wiz.m_dictAffixesPage.m_sPrefixPath,
													wiz.m_dictAffixesPage.m_sInfixPath,
													wiz.m_dictAffixesPage.m_sSuffixPath,
													TRUE); // read the page

		m_pLang->populateWithDefaults();

		m_pLang->readLangDisplayPage(wiz.m_langDisplayPage);
	//	m_pLang->setAbrev(wiz.m_langDisplayPage.m_sAbrev);
	//	m_pLang->setName(wiz.m_langDisplayPage.m_sName);
	//	m_pLang->setFont(&wiz.m_langDisplayPage.m_logFont);
		// cast is because it is normally const (shame, shame)
	//	((CTextDisplayInfo*)m_pLang->getDisplayInfo())->m_bShowMorphnamesInLangFont = wiz.m_langDisplayPage.m_bShowMorphnamesInLangFont;


		m_pLang->getAnalysisModel().processTestPropertyPages(&wiz.m_affixesPage, &wiz.m_categoryPropogationPage, &wiz.m_finalCatTestPage);
		m_pLang->getCommonModel().readWizPages(&wiz.m_finalCatTestPage);
		m_pLang->addDefaultListOfProcessors();
	}
	else	// import from files
	{
		CWizNewFromFiles* pWiz = new CWizNewFromFiles(m_pLang->getMFS()->getRootDicList());
		if(IDCANCEL == pWiz->DoModal())
		{
			MessageBox( NULL, _T("Language creation cancelled."), _T("Note:"), MB_OK);
			return FALSE;
		}
		pWiz->m_dictRootUnifiedPage.OnOK(); // dump the list into the mfs
		m_pLang->getMFS()->setUnifiedDictMode(pWiz->m_dictRootUnifiedPage.m_bUnifiedMode);
		m_pLang->getMFS()->exchangeAffixDictPaths(pWiz->m_dictAffixesPage.m_sPrefixPath,
													pWiz->m_dictAffixesPage.m_sInfixPath,
													pWiz->m_dictAffixesPage.m_sSuffixPath,
													TRUE); // read the page

		//m_pLang->OnEditProperties(FALSE);
		m_pLang->readLangDisplayPage(pWiz->m_langDisplayPage);


	m_pLang->m_pFilesWiz = pWiz;	// now when it saves, it will read the dlg,
										// do the conversion, and delete this dialog.

	}
	m_pFunctionalInterface->setupForLang(m_pLang);
	m_pCarlaMenuInterface->setupForLang(m_pLang);
	SetModifiedFlag(TRUE);
	// tell the project that this lang is available
	getProject()->registerLangDoc(this);
//	OnSaveDocument(getProject()->getProjectDir());
	return TRUE;
}


BOOL CLangModelsDoc::OnOpenDocument(LPCTSTR lpszPathName)
{
	if(!theApp.getProject())
		throw(new CFileException); // can't open a lang doc without a project

	// tell the project that this lang is available
	m_pLang = new CCarlaLanguage(this);
	m_pLang->open(lpszPathName);

#define rde270  // this was moved to inside the 'open' above (so it'll happen earlier).
				// (to fix the PC-PATR SentenceFinalPunctuation problem)
#ifndef rde270
	// now that we have a CModelFilesSet, we can get the path to the intergen "outit.ctl" file
	//  (which is our best bet for determining whether this project is UTF8Safe or not). So
	//  before loading the control files (which I'm assuming are the only files that may contain
	//  non UTF-8 safe data), establish whether we're UTF-8 safe or not.
	if( !EstablishUTF8Safeness(m_pLang->getMFS()->getCtrlFilePath(_T("outit.ctl"))) )
	{
		// this means that not both projects are the same encoding. This isn't allowed at
		//  present
		delete  m_pLang; m_pLang = 0;
		CString str; str.Format(_T("The language model '%s' is using a different encoding scheme than some other language model in this project."), lpszPathName);
		AfxMessageBox(str,MB_ICONEXCLAMATION);
		return false;
	}
#endif  // rde270

	m_pLang->loadControlFiles(FALSE);

	getProject()->registerLangDoc(this);
	m_pFunctionalInterface->setupForLang(m_pLang);
	m_pCarlaMenuInterface->setupForLang(m_pLang);

	return TRUE;
}

const int kTransferCMDBase = 2500;


BEGIN_MESSAGE_MAP(CLangModelsDoc, CTabbedTreeDoc)
	//{{AFX_MSG_MAP(CLangModelsDoc)
	ON_COMMAND(ID_CARLAMenu, OnCARLAMenu)
	ON_COMMAND(ID_AmpleLinks, OnFunctional)
	ON_UPDATE_COMMAND_UI(ID_AmpleLinks, OnUpdateFunctional)
	ON_UPDATE_COMMAND_UI(ID_CARLAMenu, OnUpdateCARLAMenu)
	ON_UPDATE_COMMAND_UI(ID_LangProperties, OnUpdateLangProperties)
	ON_COMMAND(ID_LangProperties, OnLangProperties)
	ON_COMMAND(ID_LangSynthesisSeq, OnLangSynthesisSeq)
	ON_COMMAND(ID_LangAnalysisSeq, OnLangAnalysisSeq)
	ON_COMMAND(ID_LangQuickParse, OnLangQuickParse)
	ON_COMMAND(ID_LangInterlinearSeq, OnLangInterlinearSeq)
	ON_COMMAND(ID_LangRemove, OnRemoveLanguage)
	ON_COMMAND(ID_LANGUAGE_SETUPTESTS, OnModifyTests)
	//}}AFX_MSG_MAP

	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	// ENABLING THIS CAUSES A CRASH WHEN THE TEXT IS CHANGED!!!!
		// happens with either EN_UPDATE or EN_CHANGED, even if the OnDataModified just returns without doing anything

//	ON_CONTROL_RANGE(EN_UPDATE, kBaseFormControlID, kBaseFormControlID+100, OnDataModified)
//	ON_CONTROL_RANGE(BN_PUSHED, kBaseFormControlID, kBaseFormControlID+100, OnDataModified)

	ON_COMMAND_RANGE(kTransferCMDBase, kTransferCMDBase + LANG_MENU_MAX_LANGS-1, OnTransferSeqCommand)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLangModelsDoc diagnostics

#ifdef _DEBUG
void CLangModelsDoc::AssertValid() const
{
	CTabbedTreeDoc::AssertValid();
}

void CLangModelsDoc::Dump(CDumpContext& dc) const
{
	CTabbedTreeDoc::Dump(dc);
}
#endif //_DEBUG


/////////////////////////////////////////////////////////////////////////////
// CLangModelsDoc commands



// switch to the "carlamenu"-style interface
void CLangModelsDoc::OnCARLAMenu()
{
	if(m_pCurrentInterface != m_pCarlaMenuInterface)
	{
		SetModifiedFlag();
		m_pCurrentInterface = m_pCarlaMenuInterface;
		m_pCarlaMenuInterface->SetCurrentTabInt(0);
		getFrame()->InterfaceChanged();
		UpdateAllViews(NULL, NULL, NULL);
	}
}
// switch to the "functional"-style interface
void CLangModelsDoc::OnFunctional()
{
	if(m_pCurrentInterface != m_pFunctionalInterface)
	{
		SetModifiedFlag();
		m_pCurrentInterface = m_pFunctionalInterface;
		getFrame()->InterfaceChanged();
		m_pFunctionalInterface->SetCurrentTabInt(0);
		UpdateAllViews(NULL, NULL, NULL);
	}
}

void CLangModelsDoc::OnUpdateFunctional(CCmdUI* pCmdUI)
{
	pCmdUI->SetCheck( m_pCurrentInterface == m_pFunctionalInterface  );
}

void CLangModelsDoc::OnUpdateCARLAMenu(CCmdUI* pCmdUI)
{
	pCmdUI->SetCheck( m_pCurrentInterface == m_pCarlaMenuInterface  );
}

/////////////////////////////////////////////////////////////////////////////
// CLangModelsDoc accessors

CCarlaLanguage* CLangModelsDoc::getLang()
{
	ASSERTX(m_pLang);
	return m_pLang;
}

CProjectDoc* CLangModelsDoc::getProject()
{
	CProjectDoc* pProjectDoc = theApp.getProject();
	return pProjectDoc;	// may be null
}

CFont* CLangModelsDoc::getLangFont()
{
	return m_pLang->getFont();
}

const CTextDisplayInfo* CLangModelsDoc::getLangDisplayInfo()
{
	return m_pLang->getDisplayInfo();
}
void CLangModelsDoc::OnCloseDocument()
{
	CFrameWnd* pF = getFrame();
	if(!theApp.getProject(TRUE) || !pF ||
		getProject()->getIsClosing())
		CTabbedTreeDoc::OnCloseDocument();
	else
		pF->ShowWindow(SW_MINIMIZE);
}

void CLangModelsDoc::reallyCloseDocument()
{
	CTabbedTreeDoc::OnCloseDocument();
}

void CLangModelsDoc::showWindow()
{
	CFrameWnd* pF = getFrame();
	ASSERTX(pF);
	pF->ShowWindow(SW_SHOWNORMAL);
	getFrame()->GetMDIFrame()->MDIActivate(pF);
}

void CLangModelsDoc::SetTitle(LPCTSTR lpszTitle)
{
	if(m_pLang)	// this gets called before there is a lang during new language creation
	{
		CString s = _T("Language Model: ") + m_pLang->getName();
		if(IsModified())
			s+=_T(" *");
		CTabbedTreeDoc::SetTitle(s);
	}
	else
		CDocument::SetTitle(lpszTitle);

}

BOOL CLangModelsDoc::OnSaveDocument(LPCTSTR lpszPathName)
{
	CWnd* pWnd = getFrame();
	if(pWnd) // will be null when just finished import
	{
		ASSERTX(pWnd->IsKindOf(RUNTIME_CLASS(CTabbedTreeChild)));
		((CTabbedTreeChild*)pWnd)->retrieveData(); // get any new data lurking in the interface into our members
	}
	ASSERTX(m_pLang);
	m_pLang->save(lpszPathName);
	SetModifiedFlag(FALSE);
	return TRUE;
}


// Things that go in here are things that depend on knowning
// about other languages (transfer)
// Thus, this is called after all language documents have been opened
void CLangModelsDoc::finishCreateData()
{
	// this code was delayed to here instead of readParams
	// as a hack to get around some conflict with
	// pumpMessages of the CDlgProgress which I didn't
	// take enough time to understand.  The down-side
	// is that the window will be shown as default size-location and
	// then resize in front of the user, not very pretty.
	if(!m_sWindowPlacementField.IsEmpty())
	{
		CParseStream stream(m_sWindowPlacementField);
		stream.getWindowPlacement(getFrame());
		getFrame()->Invalidate();
		//didn't work getFrame()->ActivateFrame(SW_SHOW);
	// didn't work to put a maximize into effect	AfxGetMainWnd()->Invalidate();
		m_sWindowPlacementField = _T("");
	}

	ASSERTX(m_pLang);
	m_pLang->finishCreate();

	// jdh 11/9/99 moved some lines from here to finishCreateInterface()
}

// jdh 11/9/99 moved this lines to this new, separate method to enable bidirection transfer topics
//			(can't do the "from" part until all the other langs have had a finishCreate())
//
void CLangModelsDoc::finishCreateInterface()
{
	updateInterface();
}

// jdh 1//9/99 added this so we can re-do the transfer tabs as the user changes display settings
void CLangModelsDoc::updateInterface()
{
	ASSERTX(m_pCurrentInterface);
	ASSERTX(m_pFunctionalInterface);
	ASSERTX(m_pCarlaMenuInterface);
	m_pFunctionalInterface->populateTransferTab(); //setupForLang(m_pLang);
	m_pCarlaMenuInterface->populateTransferTab(); //setupForLang(m_pLang);

	CTabbedTreeChild* pF = getFrame();
	if(pF)
	{
		pF->InterfaceChanged();
		m_pCurrentInterface->SetCurrentTabInt(0);	// just to the data shown isn't out-of-date now (it would be nice if there was a fn just to redraw)
	}
}

#include "DlgEnvironments.h"

void CLangModelsDoc::OnTestGrid()
{
	CDlgEnvironments dlg;

	dlg.DoModal();
}


// we use this as a hook to customize the language menu
void CLangModelsDoc::OnUpdateLangProperties(CCmdUI* pCmdUI)
{

	CWnd* pWnd = AfxGetMainWnd();
	//CMenu* pTopMenu = pWnd->GetMenu();

	// this is wierd but it seemed that we have to search for the menu
	// I know, it should be 3, but sometimes our commands ended up in the view menu
/*	CMenu* pMenu = NULL;
	for(int i=2; i < 5; i++)
	{
		CString s;
		pTopMenu->GetMenuString(i, s,  MF_BYPOSITION );
		if(s == _T("&Language"))
		{
			pMenu = pTopMenu->GetSubMenu(i);
			break;
		}
	}
*/
	CMenu* pMenu = pCmdUI->m_pMenu;

	if(!pMenu)	// null when you make a choice in the menu?
		return;

	const int kSynthSeqIndex = 3;
	//const int kItemsAfterTransfer = 2;

	const CTypedPtrArray<CPtrArray, CLangModelsDoc*>& pLangDocs = getProject()->getLangDocs();

	// remove existing transfer menu items
	for(	int z=pMenu->GetMenuItemCount();
			z >= 0; z--)
	{
		int iCMD = pMenu->GetMenuItemID(z);
		// is this a transfer sequence item?
		if(iCMD >= kTransferCMDBase && iCMD <= (kTransferCMDBase+ pLangDocs.GetSize()-1))
			pMenu->DeleteMenu(z, MF_BYPOSITION );
	}
	// now we should have the menu as in the resource editor

	// stick in an item for each transfer process sequence
	// note that this is written with the assumption that there
	// is one transfer sequence for each other language in the
	// project
	int iItem = kSynthSeqIndex;	// which menu item
	int iCount = 0;	// index into the transfer sequences
	for(int iTrg=0; iTrg<pLangDocs.GetSize(); iTrg++)
	{
		if(pLangDocs[iTrg] != this)
		{
#ifndef hab17a1
				CString s(_T("Transfer "));
				if ((m_pLang->m_wDisplayFlags & m_pLang->kLocateTransferWithTarget) > 0)
			  s += _T("From ");
			else
			  s += _T("To ");
#else // hab17a1
			CString s(_T("Transfer To "));
#endif // hab17a1
			s += pLangDocs[iTrg]->getLang()->getName();
			s += _T(" Sequence...");
			pMenu->InsertMenu(iItem,
				MF_ENABLED | MF_BYPOSITION | MF_STRING ,
				kTransferCMDBase + iCount, // cmd id
				s);
			iItem++; iCount++;
		}
	}
	pWnd->DrawMenuBar();
}

void CLangModelsDoc::OnLangProperties()
{
	BOOL bOldUnified = m_pLang->getMFS()->getUsingUnifiedDicts();

	if(m_pLang->OnEditProperties(FALSE))
		SetModifiedFlag(TRUE);

	// if they changed dictionary methods, update the display
	if(bOldUnified != m_pLang->getMFS()->getUsingUnifiedDicts())
	{
		ASSERTX(m_pFunctionalInterface);
		ASSERTX(m_pCarlaMenuInterface);
		m_pFunctionalInterface->populateDictTab();
		m_pCarlaMenuInterface->populateDictTab();

		UpdateAllViews(NULL, 99); // tell them to repopulate whatever tabs they're showing
	}
}

void CLangModelsDoc::OnLangSynthesisSeq()
{
	if(m_pLang->OnEditSynthesisSeq())
		SetModifiedFlag(TRUE);
}

void CLangModelsDoc::OnLangAnalysisSeq()
{
	if(m_pLang->OnEditAnalysisSeq())
		SetModifiedFlag(TRUE);
}

void CLangModelsDoc::OnTransferSeqCommand(UINT id)
{
	if(m_pLang->OnEditTransferSequence(id-kTransferCMDBase))
		SetModifiedFlag(TRUE);
}

void CLangModelsDoc::OnLangInterlinearSeq()
{
	if(m_pLang->OnEditInterlinearSeq())
		SetModifiedFlag(TRUE);
}

// called by CCarlaLanguage when it is saving
void CLangModelsDoc::writeParams(ofstream & fout)
{
	USES_CONVERSION_U8;
	fout << "\\" << T2CU8(getLangDocBeginMarker()) << "\n";

	CWnd* pWnd = getFrame();
	if(pWnd) // will be null when we just did an conversion-import
	{
		fout << "\\windowPlacement ";
		outputWindowPlacement(fout, getFrame());
	}
	fout << "\\-LangDoc\n";
}

// called by loadDocument
// By the time we get the SFMFile here,
// the first line has already been read in by loadDocument.
void CLangModelsDoc::readParams(SFMFile & f)
{
	CString sMarker, sField;
	while(f.getField(sMarker, sField))
	{
		if(sMarker==_T("-LangDoc"))
			break;
		else if (sMarker == _T("windowPlacement"))
		{
			m_sWindowPlacementField = sField;
			// this code was delayed to finishCreate()
			// as a hack to get around some conflict with
			// pumpMessages of the CDlgProgress which I didn't
			// take enough time to understand.

			//CParseStream stream(sField);
			//stream.getWindowPlacement(getFrame());
		//	getFrame()->Invalidate();
		}
		else f.logSkip(_T("CLangModelsDoc"),sMarker, sField);
	}

}



// called by CProjectDoc::OnOpenDocument() for each \+Lang field it encounters
// This STATIC method will read the parameters and then try to open the language
// file.
CLangModelsDoc* CLangModelsDoc::loadDocument(LPCTSTR lpszField,  LPCTSTR sProjectPath)
{
	CString sPath(lpszField); // sAbrev,
//	CParseStream stream(lpszField);
//	stream.word(sAbrev, FALSE);	// i'm  thinking the abrev appearing in the project file is not used anymore
//	stream.getQuotedString(sPath);
	//CCarlaLanguage *pLang = new CCarlaLanguage(sAbrev);
	CFileStatus status;
	// is the file there?
	if(!CFile::GetStatus(sPath, status))
	{
	// if not, look in the same directory as this project
		//CString sPossiblePath = getLang()->getFilePath(getLang()->getLanguageDirectory(sProjectPath, FALSE));
		CString sPossiblePath = ::getDirectory(sProjectPath);
		sPossiblePath += getFileName(sPath);
		sPossiblePath += _T(" control files\\");
		sPossiblePath += getFullFileName(sPath);
		// if it's there, switch the path and don't bother the user
		if(CFile::GetStatus(sPossiblePath, status))
			sPath = sPossiblePath;
		else
		{	// ask the user to find it

			if(!theApp.askUserToFindFile(sPath, CLangModelsDoc::getRegFileTypeID()))
			{
				THROWSTRING3(_T("The language file"), getFullFileName(sPath), _T(" could not be found."));
			}
		}
	}

	CLangModelsDoc *pLangDoc = (CLangModelsDoc *)theApp.internalOpenDocumentFile(sPath);

	if(!pLangDoc)
	{
		checkForFileError(sPath);
		THROWSTRING3(_T("The language file "), sPath, _T(" could not be opened."));
	}
	else if(!pLangDoc->IsKindOf(RUNTIME_CLASS(CLangModelsDoc)))
	{
		ASSERTX(FALSE); // to do notify user or something
	}

	return pLangDoc;
}

//called by cProjectDoc OnSaveDocument.
void CLangModelsDoc::writeProjectDocLine(ofstream & fout)
{
	USES_CONVERSION_U8;
	ASSERTX(!m_pLang->getFilePath().IsEmpty()); // should save language before calling this so the path is set
	fout << "\\" << T2CU8(getProjectDocMarker()) << " " << T2CA(m_pLang->getFilePath()) << "\n";
}

BOOL CLangModelsDoc::SaveModified()
{
	return TRUE; // if the user said No, I don't want to save the
	// project changes, then we don't want to ask them about saving
	// the changes just for this document.
}



void CLangModelsDoc::OnLangQuickParse()
{
	getProject()->OnQuickParse();
}


void CLangModelsDoc::SetModifiedFlag(BOOL bModified)
{
	if(bModified==IsModified())
		return; // no change

	CDocument::SetModifiedFlag(bModified);
	SetTitle(NULL);

	// modifying a language doc means, effectiving, modifying the project.
	// remember that we are saved only when the project is saved.
	if(bModified)
		this->getProject()->SetModifiedFlag(bModified);
}

// JDH 6/3/99 Added
void CLangModelsDoc::OnModifyTests()
{
	// make sure no changes that were just made get left out of consideration
	// when setting the inital parameters of this wizard (e.g. maxPrefixes)

	CWnd* pWnd = getFrame();
	if(pWnd) // will be null when just finished import
	{
		ASSERTX(pWnd->IsKindOf(RUNTIME_CLASS(CTabbedTreeChild)));
		((CTabbedTreeChild*)pWnd)->retrieveData(); // get any new data lurking in the interface into our members
	}

	m_pLang->getAnalysisModel().doModifyTestsDialog();

	// Note that we don't currently have the ability to "refresh" the display
	// so that changes the wizard just made will show up.

	// in fact, there is a  bug here where if you're in the maximums when you
	// invoke the wizard, when you move *out* of the maximums form, the old values
	// that are in the form will become the the current values again
}
