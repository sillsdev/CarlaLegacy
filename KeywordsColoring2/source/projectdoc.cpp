// ProjectDoc.cpp : implementation of the CProjectDoc class
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "DlgProjectOpenOrCreate.h"
#include "SFMFile.h"
//#include "DlgProgress.h"
#include "PrefsInputDoc.h"
#include "SafeStream.h"
#include "ProjectDoc.h"
#include "PathDescriptor.h"

#include "LangModelsDoc.h"
#include "QuickParseDoc.h"

#include "CarlaLanguage.h"
#include "ParseStream.h"
#include <strstrea.h>
#include "InputDoc.h"
#include "ProcessingPrefs.h"
#include "SimpleProgressBar.h"

#ifndef __AFXTEMPL_H__
#include <afxtempl.h>
#endif

extern CCarlaStudioApp theApp;

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


const int FORMAT_VERSION = 1;

//CDlgProgress* gpProgressBar = NULL;
//CSimpleProgressBar *gpProgressBar = NULL;

/////////////////////////////////////////////////////////////////////////////
// CProjectDoc

IMPLEMENT_DYNCREATE(CProjectDoc, CDocument)

BEGIN_MESSAGE_MAP(CProjectDoc, CDocument)
	//{{AFX_MSG_MAP(CProjectDoc)
	ON_COMMAND(ID_LangQuickParse, OnQuickParse)
	ON_COMMAND(IDProjectSetup, OnProjectSetup)
	ON_COMMAND(ID_FILE_NewLanguage, OnFILENewLanguage)
	ON_UPDATE_COMMAND_UI(ID_LangQuickParse, OnUpdateQuickParse)
	//}}AFX_MSG_MAP
	ON_COMMAND_RANGE(LANG_MENU_COMMAND_BASE, LANG_MENU_COMMAND_RANGE_END, OnLangPopUpCommand)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CProjectDoc construction/destruction

CProjectDoc::CProjectDoc()
:  m_pDefaultFont(NULL), m_pSrcTextProcessingDefaults(NULL),  m_pAnaProcessingDefaults(NULL), m_pInputDocDisplayPrefs(new CPrefsInputDocDisplay)
{

	// THIS MAY BE A BUG.  It may be that you can't store pointers to fonts gotten this way.
	// the default font is used for things like transcript output
	m_pDefaultFont = CFont::FromHandle( (HFONT) GetStockObject(ANSI_FIXED_FONT));
	ASSERTX(m_pDefaultFont);
}

CProjectDoc::~CProjectDoc()
{
	//for(int i=0; i<m_pLangDocs.GetSize(); i++)
	int i=m_pLangDocs.GetSize();
	while(m_pLangDocs.GetSize())	// now deleted lang docs actually remove themselves via removeLangDoc()
	{
		ASSERTX(i>=0); // just to catch us from an infinite loop if we ever change something in the code
		m_pLangDocs.GetAt(0)->OnCloseDocument();
		i--;
	}

	m_pLangDocs.RemoveAll();

	if(m_pSrcTextProcessingDefaults)
		delete m_pSrcTextProcessingDefaults;
	if(m_pAnaProcessingDefaults)
		delete m_pAnaProcessingDefaults;

	if(m_pInputDocDisplayPrefs)
		delete m_pInputDocDisplayPrefs;
}

BOOL CProjectDoc::OnNewDocument()
{
	m_pInputDocDisplayPrefs = new CPrefsInputDocDisplay;
	m_pSrcTextProcessingDefaults = new CSrcTextProcessingPrefs;
	m_pAnaProcessingDefaults = new CAnaProcessingPrefs;

	if(this !=theApp.getProject())
	{	AfxMessageBox("You must close the open project before you can create a new one");
		return FALSE; // can only have one project at a time;
	}

	BOOL ok=FALSE;

	CDlgProjectOpenOrCreate dlg(AfxGetMainWnd());
	if( dlg.DoModal() != IDOK)
		return false;

	// ok, when we make the document, the framework doesn't seem to provide
	// a way to tell the new document what it should be based on.  Thus,
	// we'll store in a member variable the type we need, so that when the
	// document is initiallized, it can ask us how to make itself. Very
	// inelligant.
/*	switch(dlg.m_iWhatToDo)
	{
		//case 0:	OnFileOpen(); break;	// open existing cwin project
		case 0:	m_iNewProjectCreationMethod = CProjectDoc::kFromScratch; break;
		case 1:	m_iNewProjectCreationMethod = CProjectDoc::kFromCarlaMenu; break;
		case 2:	m_iNewProjectCreationMethod = CProjectDoc::kFromControlFiles; break;
		default: ASSERTX(FALSE); break;
	}
	int iMethod = theApp.getNewProjectCreationMethod();
*/
	CString sProjectPath;
	switch (dlg.m_iWhatToDo)
	{
		case CProjectDoc::kFromScratch:
		case CProjectDoc::kFromControlFiles:
			setSourceLang(NULL);
			setTargetLang(NULL);
			// the new doc will register itself with us
			//setSourceLangDoc((CLangModelsDoc*)
			//	((CCarlaStudioApp*) AfxGetApp())->getLangDocTemplate()
			//			->CreateNewDocument( ));
			//setTargetLangDoc(getSourceLangDoc());
			//m_pLangDocs.Add(m_pSource);
			ok = TRUE; //getSourceLang()->OnEditProperties(TRUE);
			break;
		case CProjectDoc::kFromCarlaMenu:
			ok = doNewFromCarlaMenu(sProjectPath);
			break;

		default: ASSERTX(FALSE); break;
	}

			// *******BUG***********
				// if ok is FALSE, the framework somehow isn't totally
				// coping with it; it calls destroyWindow, but the menus
				// act as if we did make a document, and thus there is
				// a failed assert when the user tries to do anything

				// However, showing the following message box makes everything ok;
				// otherwise, I would remove it (it's not good interface)
	if(!ok)
	{
		for(int m=0; m<m_pLangDocs.GetSize(); m++)
			m_pLangDocs[m]->reallyCloseDocument();
		setSourceLangDoc( NULL);
		MessageBox( NULL, "No Project Created", "Note:", MB_OK);
		return FALSE;
	}
	else
	{
		// tell each language about the others
		// note that this informing process is spread between
		// this and the call to setConversionTargetLang() called
		// by doNewCARLAMenu().  That one just looks for and copies
		// over transfer files to the new control file directory.
		for(int n=0; n<m_pLangDocs.GetSize(); n++)
			for(int m=0; m<m_pLangDocs.GetSize(); m++)
				if(n != m)
					m_pLangDocs[n]->getLang()->
						notifyLanguageAddedToProject(
							m_pLangDocs[m]->getLang());

		SetModifiedFlag();
		// just a hack here untile we do it right some day
		if(sProjectPath.IsEmpty())
			AfxMessageBox("We recommend that you create a new folder to store this project and its files in.");

		if(!DoSave(sProjectPath))
			return FALSE;
		cycleLangDocs();
		if(dlg.m_iWhatToDo == CProjectDoc::kFromScratch
			|| dlg.m_iWhatToDo == CProjectDoc::kFromControlFiles)
			OnFILENewLanguage();
		return TRUE;
	}
}

/////////////////////////////////////////////////////////////////////////////
// CProjectDoc serialization

void CProjectDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CProjectDoc diagnostics

#ifdef _DEBUG
void CProjectDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CProjectDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CProjectDoc commands

BOOL CProjectDoc::OnSaveDocument(LPCTSTR lpszPathName)
{
	ASSERTX(lpszPathName);
	CSafeStream safeWrite(lpszPathName);
	ofstream& fout = safeWrite.openStream();

//	ofstream fout(lpszPathName, ios::out );
	if(!fout.is_open())
	{	TRACE("****Couldn't open %s\n", lpszPathName);
		return 0;
	}
	fout << "\\id This file is used by CarlaStudio to store a project (*.csp), which refers to languages (*.csl files)\n";
	fout << "\\formatVersion " << FORMAT_VERSION << "\n";

	// save the language description files
	for(int i=0; i<m_pLangDocs.GetSize(); i++)
	{
		m_pLangDocs[i]->OnSaveDocument(lpszPathName);
		m_pLangDocs[i]->writeProjectDocLine(fout);	// \lang d:blah\foo.csl
	}

	ASSERTX(m_pSrcTextProcessingDefaults);
	m_pSrcTextProcessingDefaults->writeToFile(fout);
	ASSERTX(m_pAnaProcessingDefaults);
	m_pAnaProcessingDefaults->writeToFile(fout);
	m_pInputDocDisplayPrefs->writeToFile(fout);

	// save the input docs that are currently open so we can reopen them
	CDocTemplate* pT = theApp.getDocTemplate(CSourceTextInputDoc::getRegFileTypeID());
	ASSERTX(pT);
	POSITION pos = pT->GetFirstDocPosition();
	while(pos)
	{
		CSourceTextInputDoc* pDoc = (CSourceTextInputDoc*) pT->GetNextDoc(pos);
		if(pDoc)
		{	pDoc->writeParams(fout);
		}
	}

	// save the ana docs that are currently open so we can reopen them
	pT = theApp.getDocTemplate(CAnaInputDoc::getRegFileTypeID());
	ASSERTX(pT);
	pos = pT->GetFirstDocPosition();
	while(pos)
	{
		CAnaInputDoc* pDoc = (CAnaInputDoc*) pT->GetNextDoc(pos);
		if(pDoc)
		{	pDoc->writeParams(fout);
		}
	}

	safeWrite.close();

	SetModifiedFlag(FALSE);	// clear the modified bit

	SetDirectory(lpszPathName); // make this the working directory

	// save the path of this project so that we open it automatically next time the app is run
	AfxGetApp()->WriteProfileString( "Defaults", "LastProjectFile", lpszPathName);
	return TRUE; //return CDocument::OnSaveDocument(lpszPathName);
}

BOOL CProjectDoc::OnOpenDocument(LPCTSTR lpszPathName)
{
	if(this != theApp.getProject())
	{	AfxMessageBox("You must close the open project before you can open another one");
		//gpProgressBar = NULL;
		return FALSE; // can only have one project at a time;
	}

/*	CDlgProgress dlg;
	gpProgressBar = &dlg;
	dlg.Create(AfxGetMainWnd( ));
	dlg.SetPos(0);
	dlg.SetStatus("Opening project...");
*/
	CSimpleProgressBar progressBar("Reading Project File...");;
	//gpProgressBar = &progressBar;

	// hide our window since it doesn't show anything
	// didn't work...   getFrame()->ShowWindow(SW_HIDE);

	SFMFile f(lpszPathName, '*'); // comment won't be found in this kind of file
	if(!f.isOpen())	// that's ok, the file could have been deleted since the last run
	{
		CString s("Couldn't open the Project File named:");
		s += lpszPathName;
		MessageBox( NULL, s, NULL, MB_OK);
		//gpProgressBar = NULL;
		return FALSE;
	}

	CString sMarker, sField;
	//CString sTempSrcID;  // holds the id of the lang until we've read everything in
	BOOL bEnabled;
	try
	{
		BOOL bFirst = TRUE;	// need this because early versions didn't have this marker at all, so if it is missing, we know we're incompatible
		while(f.getField(sMarker, sField, &bEnabled))
		{
			if((bFirst &&  sMarker != "id") || sMarker == "formatVersion")
			{
				bFirst = FALSE;
				int iVersion = -1;
				if(sMarker == "formatVersion")
				{
					ASSERTX(sField.GetLength());
					iVersion = atoi(sField);
				}
				if (iVersion < FORMAT_VERSION)
				{
					AfxMessageBox("Sorry, the format of this project file is no longer supported.  No data will actually be lost, however.  You need to create a new project in a different folder, then make a new language using your existing control files. Ah, the joys of alpha testing...");
					AfxThrowUserException();//AfxThrowNotSupportedException( );
				}
			}
			else if (sMarker == "id")
			{}

			else if (sMarker == CSrcTextProcessingPrefs::BEGIN_MARKER())
			{
				// should be null anyhow
				if(m_pSrcTextProcessingDefaults)
					delete m_pSrcTextProcessingDefaults;

				m_pSrcTextProcessingDefaults = new CSrcTextProcessingPrefs(&f);
				m_pSrcTextProcessingDefaults->finishCreate();

				// when a new language is created, this can get triggered
				if(!m_pSrcTextProcessingDefaults->getSrcLang()
					&& m_pLangDocs.GetSize())
				{
					setSourceLangDoc(m_pLangDocs[0]);
				}
			}
			else if (sMarker == CAnaProcessingPrefs::BEGIN_MARKER())
			{
				// should be null anyhow
				if(m_pAnaProcessingDefaults)
					delete m_pAnaProcessingDefaults;

				m_pAnaProcessingDefaults = new CAnaProcessingPrefs(&f);
				m_pAnaProcessingDefaults->finishCreate();

			}
			else if (sMarker == CPrefsInputDocDisplay::getBeginMarker())
			{
				if(m_pInputDocDisplayPrefs)
					delete m_pInputDocDisplayPrefs;

				m_pInputDocDisplayPrefs = new CPrefsInputDocDisplay(&f);
			}

			else if(sMarker == CLangModelsDoc::getProjectDocMarker())
			{
				ASSERTX(!sField.IsEmpty());
	progressBar.SetText("Reading Language File...");
				CLangModelsDoc::loadDocument(sField, lpszPathName);
			}
			else if(sMarker == CSourceTextInputDoc::BEGIN_MARKER())	// reopen a source text window that was open last time we were saved
			{
				ASSERTX(getSourceLangDoc());	// if this fails, it's probably because the \SrcLang marker wasn't found before this one
	progressBar.SetText("Loading Source Document...");
				CSourceTextInputDoc::loadDocument(sField, f);
			}
			else if(sMarker == CAnaInputDoc::BEGIN_MARKER())	// reopen a source text window that was open last time we were saved
			{
				//ASSERTX(getSourceLangDoc());	// if this fails, it's probably because the \SrcLang marker wasn't found before this one
	progressBar.SetText("Loading ANA Document...");
				CAnaInputDoc::loadDocument(sField, f);
			}
			else
				f.logSkip("Project", sMarker, sField);
		}
	}
	catch(LPCTSTR lpszError)
	{
		AfxMessageBox(lpszError);
		return FALSE;
	}
	catch(CString sError)
	{
		AfxMessageBox(sError);
		return FALSE;
	}

	ASSERTX(m_pAnaProcessingDefaults);
	ASSERTX(m_pSrcTextProcessingDefaults);

	finishOpen();
	SetDirectory(lpszPathName); // make this the working directory

	// save the path of this project so that we open it automatically next time the app is run
	AfxGetApp()->WriteProfileString( "Defaults", "LastProjectFile", lpszPathName);
	//gpProgressBar = NULL;

	return TRUE;
}

void CProjectDoc::SetDirectory(LPCTSTR lpszPathName)
{
	SetCurrentDirectory(::getDirectory(lpszPathName));
}

/*BOOL CProjectDoc::loadControlFiles()
{
	// to do: joincomp stuff needs to be stored in our project file
	ASSERTX(m_pSource);
	return getSourceLangDoc()->loadControlFiles();
}
*/

// switch to the "carlamenu"-style interface
/*void CProjectDoc::OnCARLAMenu()
{
	if(m_pCurrentInterface != m_pCarlaMenuInterface)
	{
		m_pCurrentInterface = m_pCarlaMenuInterface;
		m_pCarlaMenuInterface->SetCurrentTabInt(0);
		m_pSettingsFrame->InterfaceChanged();
		UpdateAllViews(NULL, NULL, NULL);
	}
}
// switch to the "functional"-style interface
void CProjectDoc::OnFunctional()
{
	if(m_pCurrentInterface != m_pFunctionalInterface)
	{
		m_pCurrentInterface = m_pFunctionalInterface;
		m_pSettingsFrame->InterfaceChanged();
		m_pFunctionalInterface->SetCurrentTabInt(0);
		UpdateAllViews(NULL, NULL, NULL);
	}
}

void CProjectDoc::OnUpdateFunctional(CCmdUI* pCmdUI)
{
	pCmdUI->SetCheck( m_pCurrentInterface == m_pFunctionalInterface  );
}

void CProjectDoc::OnUpdateCARLAMenu(CCmdUI* pCmdUI)
{
	pCmdUI->SetCheck( m_pCurrentInterface == m_pCarlaMenuInterface  );
}
*/


// invoked by a menu choice
void CProjectDoc::OnProjectSetup()
{
	CPropertySheet dlg("Project Settings");

	// this will add a page for these prefs
	m_pSrcTextProcessingDefaults->customizePropertySheet(dlg, FALSE);
	m_pAnaProcessingDefaults->customizePropertySheet(dlg, FALSE);

	// in the future, can add other pages here

	if(!dlg.DoModal())
	{	m_pSrcTextProcessingDefaults->propertySheetClosed(dlg);
		m_pAnaProcessingDefaults->propertySheetClosed(dlg);
		return;
	}
	m_pSrcTextProcessingDefaults->readPropertySheet(dlg);
	m_pSrcTextProcessingDefaults->propertySheetClosed(dlg);
	m_pAnaProcessingDefaults->readPropertySheet(dlg);
	m_pAnaProcessingDefaults->propertySheetClosed(dlg);

	SetModifiedFlag();

	// tell our project window to update so any font changes show up
	UpdateAllViews(NULL, NULL, NULL);
	updateAllOtherWindows();
}

void CProjectDoc::OnCloseDocument()
{
	((CCarlaStudioApp*) AfxGetApp())->projectClosing();
	CDocument::OnCloseDocument();
	//updateAllOtherWindows();
}

void CProjectDoc::updateAllOtherWindows()
{
	// tell all the src text windows so any font changes show up
	CDocTemplate* pT = theApp.getDocTemplate(CSourceTextInputDoc::getRegFileTypeID());
	ASSERTX(pT);
	POSITION pos = pT->GetFirstDocPosition();
	while(pos)
	{
		CSourceTextInputDoc* pDoc = (CSourceTextInputDoc*) pT->GetNextDoc(pos);
		if(pDoc)
			pDoc->UpdateAllViews(NULL, NULL, NULL);
	}

	// tell all the ana windows so any font changes show up
	pT = theApp.getDocTemplate(CAnaInputDoc::getRegFileTypeID());
	ASSERTX(pT);
	pos = pT->GetFirstDocPosition();
	while(pos)
	{
		CAnaInputDoc* pDoc = (CAnaInputDoc*) pT->GetNextDoc(pos);
		if(pDoc)
			pDoc->UpdateAllViews(NULL, NULL, NULL);
	}

	// tell all the lang model windows so any font changes show up
	pT = theApp.getDocTemplate(CLangModelsDoc::getRegFileTypeID());
	ASSERTX(pT);
	pos = pT->GetFirstDocPosition();
	while(pos)
	{
		CLangModelsDoc* pDoc = (CLangModelsDoc*) pT->GetNextDoc(pos);
		if(pDoc)
			pDoc->UpdateAllViews(NULL, NULL, NULL);
	}

		// tell all the quick parse windows so any font changes show up
	pT = theApp.getDocTemplate(CQuickParseDoc::getRegFileTypeID());
	ASSERTX(pT);
	pos = pT->GetFirstDocPosition();
	while(pos)
	{
		CQuickParseDoc* pDoc = (CQuickParseDoc*) pT->GetNextDoc(pos);
		if(pDoc)
			pDoc->UpdateAllViews(NULL, NULL, NULL);
	}
}


void CProjectDoc::synchronizeExternals()
{
// make sure the control files are up to date (and created, for that matter)
	if(IsModified())
		DoSave(m_strPathName);
}

// the default font is used for things like transcript output
CFont* CProjectDoc::getDefaultFont()
{
	return m_pDefaultFont;
}



// called by the constructor of CInputDoc, which can only
// be a default constructor and thus needs help getting
// its parameters set accordingly.
/*void CProjectDoc::setupProcessDoc(CInputDoc * pDoc)
{
	// to do; we'll have to determine what language the doc is
	// to do: we'll have to figure out which sequence is appropriate
	//	for the type of document.  Analysis will be right for
	//  text docs, transfer or synthesis for ANA or PTEXT

	// to do: open a dialog letting the user chose which sequence(s)
	// *or*, wait until they click on the execute the first time and then ask them

//	pDoc->setProcessSequence(getSourceLang()->getAnalysisSequence());
}
*/

void CProjectDoc::updateMenus()
{
/*	CWnd* x = AfxGetMainWnd();
	CMenu* pTopMenu = x->GetMenu();

	for (int iPos = pTopMenu->GetMenuItemCount()-1; iPos >= 0; iPos--)
	{
		CString sLabel;
		pTopMenu->GetMenuString(iPos, sLabel, MF_BYPOSITION );
		if(sLabel=="&Project")
		{
			CMenu* pMenu = pTopMenu->GetSubMenu(iPos);
			ASSERTX(pMenu);
			#define kNumMenuItemsB4Langs 2
			for(UINT z=pMenu->GetMenuItemCount(); z >= kNumMenuItemsB4Langs; z--)
			{
				pMenu->DeleteMenu(z, MF_BYPOSITION );
			}
			UINT iCount = pMenu->GetMenuItemCount();
			for( int iLang=0; iLang<m_pLangDocs.GetSize(); iLang++)
			{
				CMenu subMenu;
				//subMenu.LoadMenu(MAKEINTRESOURCE(IDR_LangPopup));
				subMenu.CreateMenu();
				// stick in all the commands; iLang couldn't figure out how to determine
				// which instance of this popupmenu we had when a command came through
				// (that is, for which language), so iLang've had to resort to different
				// command ids for each language/menu item pair.  Furthermore, iLang
				// couldn't figure out how to determine the command ID of an existing
				// menu item, so iLang couldn't just change them all in place, like iLang wanted
				// to. Hence the unelegantness of all this.
				int flags = MF_ENABLED | MF_BYPOSITION | MF_STRING | MF_ENABLED;
				subMenu.InsertMenu(0, flags,
					LANG_MENU_COMMAND_BASE + (LANG_MENU_NUM_ITEMS*iLang) + 0, "Show Model Window");
				subMenu.InsertMenu(1, flags,
					LANG_MENU_COMMAND_BASE + (LANG_MENU_NUM_ITEMS*iLang) + 1, "Properties...");
				subMenu.InsertMenu(2, flags,
					LANG_MENU_COMMAND_BASE + (LANG_MENU_NUM_ITEMS*iLang) + 2, "Analysis Sequence...");

				// stick in an item for each transfer process sequence
				// note that this is written with the assumption that there
				// is one transfer sequence for each other language in the
				// project
				int iIndex = 3;
				for(int iTrg=0; iTrg<m_pLangDocs.GetSize(); iTrg++)
				{
					if(iTrg != iLang)
					{
						CString s("Transfer To ");
						s += m_pLangDocs[iTrg]->getLang()->getName();
						s += " Sequence...";
						subMenu.InsertMenu(iIndex, flags,
							LANG_MENU_COMMAND_BASE + (LANG_MENU_NUM_ITEMS*iLang) + iIndex, s);
						iIndex++;
					}
				}

				subMenu.InsertMenu(iIndex, flags,
					LANG_MENU_COMMAND_BASE + (LANG_MENU_NUM_ITEMS*iLang) + iIndex, "Synthesis Sequence...");


				// now we can insert this new menu item for the lang along with it's submenu
				pMenu->AppendMenu(MF_STRING | MF_ENABLED |MF_POPUP,
					(unsigned int)subMenu.GetSafeHmenu(), m_pLangDocs[iLang]->getLang()->getName());
				subMenu.Detach();
			}
			break;
		}
	}
	x->DrawMenuBar();
*/
}

/*
void CProjectDoc::OnUpdateProjectSetup(CCmdUI* pCmdUI)
{
	// This is just a hook to change other menus, since
	// I couldn't get the menu changed during the actual
	// creation of the document;  the changes I make
	// seem to be undone unless the window is already drawn.
	// Also, I can't put an update handler on the actual
	// menus I want to change because they are popup ones
	// and don't have a command ID.  So we do it here.
	updateMenus();
}
*/

// this handler receives the range of command ids assigned to
// the popup (hiearchical) menus assigned to the languages
// the commands are generated so that the language index and
// command are combined into the one number.  This takes these
// apart and the dispatches the command to the correct language.
void CProjectDoc::OnLangPopUpCommand(UINT id)
{
	//!!!!!!this is currently unused but worth keeping

/*	id -= LANG_MENU_COMMAND_BASE;
	int langIndex;
	if (id >1)
		langIndex = id / LANG_MENU_NUM_ITEMS;
	else
		langIndex = 0;

	int cmd = (id-(langIndex*LANG_MENU_NUM_ITEMS));//id % LANG_MENU_NUM_ITEMS;

	ASSERTX(m_pLangDocs.GetSize() > langIndex);
	CCarlaLanguage* pLang = m_pLangDocs[langIndex]->getLang();

	BOOL bModified=false;
	if( 0==cmd)
		m_pLangDocs[langIndex]->showWindow();
	else if (1==cmd)
	{
		bModified = pLang->OnEditProperties(FALSE);
		if(bModified)
			updateAllOtherWindows();
	}
	else if (2==cmd)
		bModified = pLang->OnEditAnalysisSeq();
	else if (cmd>2 && cmd < (LANG_MENU_NUM_ITEMS-1))
	{
		int iTrgItemIndex = cmd-3;
		// Note that this array is mapping is different from that of m_pLangDocs
		// in that the pLang.m_pTargetSequences[3] might == m_pLangDocs[4]
		// because each language isn't included in its own transferTargetList.
		// We don't have to do anything special here, though, since the
		// menu setup already reflects this reality.
		bModified = pLang->OnEditTransferSequence(iTrgItemIndex);
	}
	else if (LANG_MENU_NUM_ITEMS-1==cmd) // last item
		bModified = pLang->OnEditSynthesisSeq();
	else
		ASSERTX(FALSE);

	if(bModified)
		SetModifiedFlag(TRUE);
		*/
}

CCarlaLanguage* CProjectDoc::getSourceLang()
{
	ASSERTX(m_pSrcTextProcessingDefaults);
	return m_pSrcTextProcessingDefaults->getSrcLang();
}

CLangModelsDoc* CProjectDoc::getSourceLangDoc()
{
	return getSourceLang()->getLangDoc();
}

// may return null if user is doing analysis only
CLangModelsDoc* CProjectDoc::getTargetLangDoc()
{
	CCarlaLanguage* pL = getTargetLang();
	if(pL)
		return pL->getLangDoc();
	else return NULL; // no target langauge
}
// may return null if user is doing analysis only
CCarlaLanguage* CProjectDoc::getTargetLang()
{
	ASSERTX(m_pSrcTextProcessingDefaults);
	return m_pSrcTextProcessingDefaults->getTarLang();
}

// called by new and newly opened CLangModelsDocs
void CProjectDoc::registerLangDoc(CLangModelsDoc * pLangDoc)
{
	m_pLangDocs.Add(pLangDoc);
	// if this is our first language, point everything at it
/* can't do this, because the srcprocessingprefs haven't been created yet

  if(m_pLangDocs.GetSize()==1)
	{
		setSourceLangDoc(pLangDoc);
		setTargetLangDoc(pLangDoc);// this is questionable
	}
*/
}

// called when the lang is deleting
// this turns out to be necessary for the case where the user cancels in the middle of a carlamenu import wizard
//	THIS IS NOT TO BE CONFUSED WITH removeLanguage, WHICH IS THE USER INSTIGATED
//  REMOVAL OF AN INSTALLED LANGUAGE (though that also call this function)
void CProjectDoc::removeLangDoc(CLangModelsDoc * pLangDoc)
{
	for(int i=0; i<m_pLangDocs.GetSize(); i++)
	{
		if(m_pLangDocs[i] == pLangDoc)
		{
			m_pLangDocs.RemoveAt(i);
		}
	}

	// don't check to see if we found it
}

BOOL CProjectDoc::getIsClosing()
{
	 POSITION p = GetFirstViewPosition();
	 return (p == NULL);
}

CFrameWnd* CProjectDoc::getFrame()
{
	POSITION p  = GetFirstViewPosition( );
	CView* pView= GetNextView(p);
	if(!pView)
		return NULL; // happens when app is quiting
	CFrameWnd* pF = pView->GetParentFrame();
	return  pF;
}

void CProjectDoc::setSourceLangDoc(CLangModelsDoc * pDoc)
{
// can be legitimately null	ASSERTX(pDoc);
	if(!pDoc)
		setSourceLang(NULL);
	else
		setSourceLang(pDoc->getLang());
}

void CProjectDoc::setTargetLangDoc(CLangModelsDoc * pDoc)
{
	if(pDoc)
		setTargetLang( pDoc->getLang());	// can be NULL for analysis only
	else setTargetLang(NULL);
}

void CProjectDoc::setTargetLang(CCarlaLanguage* pLang)
{
	ASSERTX(m_pSrcTextProcessingDefaults);
	m_pSrcTextProcessingDefaults->setTarLang(pLang);
}
void CProjectDoc::setSourceLang(CCarlaLanguage* pLang)
{
	ASSERTX(m_pSrcTextProcessingDefaults);
	m_pSrcTextProcessingDefaults->setSrcLang(pLang);
}

// Called when one of our control files is being read and the
//		reader needs to convert an id to a pointer to the lang.
// Returns a pointer to the lang if found, otherwise NULL.
// Note that when an id is read from a file, we may not have
// loaded that language yet.  So currently, we deal with this
// by not calling this function until the "FinishCreate" cycle,
// which happens after all language files are loaded.

CCarlaLanguage* CProjectDoc::getLangFromID(LPCTSTR lpszLangID)
{
	CLangModelsDoc* pLD = getLangDocFromID(lpszLangID);
	if(!pLD)
		return NULL;
	return pLD->getLang();
}

CLangModelsDoc* CProjectDoc::getLangDocFromID(LPCTSTR lpszLangID)
{
	ASSERTX(lpszLangID && strlen(lpszLangID));
	for( int i=0; i<m_pLangDocs.GetSize(); i++)
	{
		if(m_pLangDocs[i]->getLang()->getUniqueID() == lpszLangID)
			return m_pLangDocs[i];
	}
	return NULL; // lang with that id not found
}

// this is a hack.  I couldn't get newly created language documents
// to show up correctly; so I close them and reopen them all
void CProjectDoc::cycleLangDocs()
{
	if(IsModified())
	{
		ASSERTX(m_strPathName.GetLength());
		DoSave(m_strPathName);
	}
	if(!m_pLangDocs.GetSize())
		return;

	CStringArray sPaths;
	CString sSrcPath = getSourceLang()->getFilePath();
	CString sTarPath;
	if(getTargetLang())
		sTarPath = getTargetLang()->getFilePath();

	setSourceLangDoc(NULL);
	setTargetLangDoc( NULL);

	int iCheck=m_pLangDocs.GetSize();
	while(m_pLangDocs.GetSize())	// now deleted lang docs actually remove themselves via removeLangDoc()
	{
		ASSERTX(iCheck>=0); // just to catch us from an infinite loop if we ever change something in the code
		sPaths.Add(m_pLangDocs.GetAt(0)->getLang()->getFilePath());
		// this closes and deletes the document
		m_pLangDocs.GetAt(0)->reallyCloseDocument(); //delete m_pLangDocs[i];
		iCheck--;
	}
	m_pLangDocs.RemoveAll();

	for(int i=0; i<sPaths.GetSize(); i++)
	{
		// assumption: the field following \lang is just the path, since this
		// call expects the field of the project do and we're just giving it the path
		CLangModelsDoc *pLangDoc=CLangModelsDoc::loadDocument(sPaths[i], m_strPathName);
		if(sPaths[i] == sSrcPath)
			setSourceLangDoc(pLangDoc);
		if(sPaths[i] == sTarPath)
			setTargetLangDoc(pLangDoc);
	}

	finishOpen();
}

void CProjectDoc::finishOpen()
{
	// make a transfer path from every lang to every lang, including
	// from each lang to itself
	for(int i=0; i<m_pLangDocs.GetSize(); i++)
	{
		m_pLangDocs[i]->finishCreateData();
	}

	// jdh 11/9/99 added this section to enable bidirection transfer topics
	//			(can't do the "from" part until all the other langs have had a finishCreate())
	for(i=0; i<m_pLangDocs.GetSize(); i++)
	{
		m_pLangDocs[i]->finishCreateInterface();
	}
}

// when the user changes these settings in a src document, he
// has the option of making those settings the "default".  If
// he does that, this gets called.
void CProjectDoc::setSrcTextProcessingDefaults(CSrcTextProcessingPrefs* pCopy)
{
	ASSERTX(pCopy != m_pSrcTextProcessingDefaults);
	delete m_pSrcTextProcessingDefaults;
	m_pSrcTextProcessingDefaults=new CSrcTextProcessingPrefs(pCopy);
}

// when the user changes these settings in a src document, he
// has the option of making those settings the "default".  If
// he does that, this gets called.
void CProjectDoc::setAnaProcessingDefaults(CAnaProcessingPrefs* pCopy)
{
	ASSERTX(pCopy != m_pAnaProcessingDefaults);
	delete m_pAnaProcessingDefaults;
	m_pAnaProcessingDefaults=new CAnaProcessingPrefs(pCopy);
}


CString CProjectDoc::getProjectDir()
{
	return ::getDirectory(m_strPathName);
}

void CProjectDoc::OnFILENewLanguage()
{
	if(m_pLangDocs.GetSize() >= LANG_MENU_MAX_LANGS)
	{
		AfxMessageBox("Sorry, the maximum number of languages has been reached.  Please write to carlastudio_support@sil.org to have the maximum increased.");
		return;
	}

	CLangModelsDoc* pLangDoc = (CLangModelsDoc*)theApp.getDocTemplate(CLangModelsDoc::getRegFileTypeID())->OpenDocumentFile(NULL);

	if(pLangDoc)
	{
		for(int i=0; i<m_pLangDocs.GetSize(); i++)
		{
			if(m_pLangDocs[i] != pLangDoc)
			{
				// tell this lang about all the others
				pLangDoc->getLang()->notifyLanguageAddedToProject(m_pLangDocs[i]->getLang());

				// tell all the other languages about this one
				m_pLangDocs[i]->getLang()->notifyLanguageAddedToProject(pLangDoc->getLang());
			}
		}

		pLangDoc->OnSaveDocument(getProjectDir());
		if(1==m_pLangDocs.GetSize())
			setSourceLangDoc(pLangDoc);
/*		CString sPath(pLangDoc->getLang()->getFilePath());

		// should have been the last registered doc
		i = m_pLangDocs.GetSize()-1;
		ASSERTX(pLangDoc == m_pLangDocs[i]);
		// closing the doc deletes it
		pLangDoc->reallyCloseDocument();
		//delete m_pLangDocs[i];
		m_pLangDocs.RemoveAt(i);

		pLangDoc=openLanguageDoc(sPath);
		if(pLangDoc)
		{
			if(1==m_pLangDocs.GetSize())
				setSourceLangDoc(pLangDoc);

			// tell all the other languages about this one for transfer purposes
			for(int i=0; i<m_pLangDocs.GetSize(); i++)
			{
				if(m_pLangDocs[i] != pLangDoc)
					m_pLangDocs[i]->getLang()->notifyLanguageAddedToProject(pLangDoc->getLang());
			}

			pLangDoc->finishCreate();
		}
*/
		// why all the docs and not just this one? So that all the transfer
		// stuff will show up correctly right away.

		SetModifiedFlag();
		cycleLangDocs();
	}
}



void CProjectDoc::updateWindowMenu()
{
// unused
}


CPrefsInputDocDisplay* CProjectDoc::getInputDocDisplayPrefs()
{
	ASSERTX(m_pInputDocDisplayPrefs);
	return m_pInputDocDisplayPrefs;
}

// the problem is how to keep the project document from displaying it's empty window
// I still don't have this right, though.  Other aspects of my attempts are found
// in overrides in CNullWindow
void CProjectDoc::cleanupAfterOpen()
{
	   POSITION pos = GetFirstViewPosition();
	CView* pView= GetNextView(pos);
	ASSERTX(pView);
	ASSERTX(pView->IsKindOf(RUNTIME_CLASS(CEditView)));
	CEdit& ce  = ((CEditView*)pView)->GetEditCtrl();
	ce.ReplaceSel("This window represents your project, but has no purpose at this time.  My apologies for the nuisance.");
	SetModifiedFlag(FALSE);  // don't want this message to make the whole project dirty
return;
/*
	POSITION p  = GetFirstViewPosition( );
	CView* pView= GetNextView(p);
	CWnd* pWnd = pView->GetParent();


	WINDOWPLACEMENT wp;
	pWnd->GetWindowPlacement(&wp);


//	didn't work
//	if(wp.showCmd == SW_MAXIMIZE)
//	{
//		wp.showCmd = SW_SHOWNORMAL;
//		pWnd->SetWindowPlacement(&wp);
//	}

	// this is a bit of a hack; there is a problem where if there is no language
	// in the project, then no document at all would be active, and then the
	// menu is the app itself, which we aren't wanting.  So until we learn to
	// hide a window but select it, we just don't hide it in that case.
	if(m_pLangDocs.GetSize())
		wp.showCmd = SW_HIDE;
	else
	{	// SW_MINIMIZED is supposed to activate it, but that wasn't working
		wp.showCmd = SW_SHOWNORMAL  ;
		pWnd->SetWindowPlacement(&wp);
		wp.showCmd = SW_SHOWMINIMIZED ;
	}


// doesn't work	wp.flags = 0; // set to avoid bug where if we're in maximized mode, this window isn't hidden


	//---------to do so that one of the other windows starts life activated
	//pWnd->GetParentFrame();
	((CMDIFrameWnd*)(theApp.m_pMainWnd))->MDINext();
	//AfxGetMainWnd()->MDINext();//Activate(pWnd);

	pWnd->SetWindowPlacement(&wp);

// --------------
//	put something in there so that until we can truely hide the thing, it isn't empy

	   POSITION pos = GetFirstViewPosition();
   pView = GetNextView(pos);
	ASSERTX(pView);
	ASSERTX(pView->IsKindOf(RUNTIME_CLASS(CEditView)));
	CEdit& ce  = ((CEditView*)pView)->GetEditCtrl();
	ce.ReplaceSel("Please ignore this window.");
	SetModifiedFlag(FALSE);  // don't want this message to make the whole project dirty



	// maybe this isn't the best place for this...
	// when the user creates a project from scratch, we follow that by opening the "new lang" wizard
	if(m_pLangDocs.GetSize() == 0)
		OnFILENewLanguage();
*/}

bool CProjectDoc::getHaveLanguages()
{
	return (m_pLangDocs.GetSize() > 0);
}

CCarlaLanguage* CProjectDoc::getLangFromIndex(int i)
{
	if(i >= m_pLangDocs.GetSize())
	{
		AfxMessageBox("This project thinks that it doesn't have any languages installed.  Please report this bug.  If you receive this message as soon as you run CarlaStudio, the default project may be corrupt. Find CStudio.ini and delete it.  Next, run CarlaStudio again and create a new project.");
		ASSERTX(i < m_pLangDocs.GetSize());
	}
	return m_pLangDocs[i]->getLang();
}

void CProjectDoc::OnQuickParse()
{
	CDocTemplate* pT = theApp.getDocTemplate(CQuickParseDoc::getRegFileTypeID());
	//CQuickParseDoc* pDoc = (CQuickParseDoc*)pT->CreateNewDocument();
	CQuickParseDoc* pDoc = (CQuickParseDoc*)pT->OpenDocumentFile(NULL);
	if(!pDoc)
		return;

	ASSERTX(pDoc->IsKindOf(RUNTIME_CLASS(CQuickParseDoc)));
	pDoc->setup(getSourceLang());
}

void CProjectDoc::OnUpdateQuickParse(CCmdUI* pCmdUI)
{
	pCmdUI->Enable( getHaveLanguages());
}

void CProjectDoc::setWorkingDirectory()
{
	SetDirectory(m_strPathName); // make this the working directory
}

int CProjectDoc::getLanguageCount()
{
	return m_pLangDocs.GetSize();
}
