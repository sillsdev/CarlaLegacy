// carlastudioapp.cpp : Defines the class behaviors for the application.
//
//changes
// hab  09/09/1999 fix typo in bug report message (shouldn't this really be a StringResource?)
//jdh 11/08/99 changed to use the TEMP environment variable instead of assuming it's in the windows dir (per Randy Regnier)
//jdh 11/10/99 fixed bug with CTRL-/ "run processors"
// 2.1.5 24-Mar-2000 hab Fix Project numbering bug in File menu
//		 20-June-2000 jdh added anx as a valid ana file extension
//		10-July 2000 added msg when project is closed but something tried to open it.
// 2.4.0 20-Sep-2000 hab Allow for various upper/lower case in ANA file
//                       extensions
// jdh 12April2001	Don't save documents if they aren't modified
//					Open as readonly if that flag is on the file
//					Allow "open as readonly" handling of open file dialog
/////////////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "CARLAStudioApp.h"

#include <io.h>
#include "process.h"	// for the template list

#include "CStudioMainFrm.h"
#include "dlgTipDay.h"


#include "projectDoc.h"
#include "LangModelsDoc.h"
#include "LogWindow.h"
#include "TabbedTreeChild.h"
#include "InputDocView.h"
#include "CWTabBar.h"
#include "QuickParseView.h"
#include "Nullwindow.h"

#include "ProcessSequence.h"
#include <afxcview.h>
#include "InputDoc.h"
#include "AnalysisProcesses.h"	// for filling in the template list
#include "QuickParseDoc.h"

#include "wincon.h"
#include "guruSplash.h"
#include "../CStudioCOM.h"
#include "../CStudioCOM_i.c"
#include "hook.h"	// our COM hook we provide for external scripting
#include "ParseCSImpl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

const int kMaxProjectsInMRU = 5;

CStudioModule _Module;

/////////////////////////////////////////////////////////////////////////////
// CCarlaStudioApp

BEGIN_MESSAGE_MAP(CCarlaStudioApp, CWinApp)
	ON_COMMAND(CG_IDS_TIPOFTHEDAY, ShowTipOfTheDay)
	//{{AFX_MSG_MAP(CCarlaStudioApp)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
	ON_COMMAND(IDProjectSetup, OnProjectSetup)
	ON_UPDATE_COMMAND_UI(IDProjectSetup, OnUpdateProjectSetup)
	ON_COMMAND(ID_FILE_SAVEProject, OnFILESAVEProject)
	ON_COMMAND(ID_FILE_NEW_PROJECT, OnFileNewProject)
	ON_COMMAND(ID_FILE_NewLanguage, OnFILENewLanguage)
	ON_UPDATE_COMMAND_UI(ID_FILE_NewLanguage, OnUpdateFILENewLanguage)
	ON_UPDATE_COMMAND_UI(ID_FILE_NEW_PROJECT, OnUpdateFileNewProject)
	ON_COMMAND(ID_WINDOW_ARRANGE, OnWindowArrange)
	ON_COMMAND(ID_FILE_OPEN, OnFileOpen)
	ON_COMMAND(ID_FILE_OPEN_Document, OnFILEOPENDocument)
	ON_COMMAND(ID_FILE_OPEN_Project, OnFILEOPENProject)
	ON_COMMAND(ID_FILE_CLOSE_PROJECT, OnFileCloseProject)
	ON_UPDATE_COMMAND_UI(ID_FILE_OPEN_Document, OnUpdateFILEOPENDocument)
	ON_UPDATE_COMMAND_UI(ID_FILE_MRU_PROJECT, OnUpdateFileMruProject)
	ON_COMMAND(ID_APP_EXIT, OnAppExit)
	ON_COMMAND(ID_LangQuickParse, OnQuickParse)
	ON_UPDATE_COMMAND_UI(ID_LangQuickParse, OnUpdateQuickParse)
	ON_COMMAND(ID_FILE_SaveAll, OnFILESaveAll)
	ON_COMMAND(ID_RunProcessors, OnRunProcessors)
	ON_UPDATE_COMMAND_UI(ID_RunProcessors, OnUpdateRunProcessors)
	ON_COMMAND(ID_FILE_NewDocument, OnFILENewDocument)
	ON_COMMAND(ID_Jump, OnJump)
	//}}AFX_MSG_MAP
	// Standard file based document commands
	ON_COMMAND(ID_FILE_NEW, CCarlaStudioApp::OnFileNew)
	ON_COMMAND(ID_FILE_OPEN, CWinApp::OnFileOpen)
	// Standard print setup command
	ON_COMMAND(ID_FILE_PRINT_SETUP, CWinApp::OnFilePrintSetup)
	// intercept these lang pop-ups and route them to the project,
	// which will in turn route them to the appropriate language
	ON_COMMAND_RANGE(LANG_MENU_COMMAND_BASE, LANG_MENU_COMMAND_RANGE_END, OnLangPopUpCommand)
	ON_COMMAND_RANGE(ID_FILE_MRU_PROJECT, ID_FILE_MRU_PROJECT+kMaxProjectsInMRU, OnFileMruProject)

END_MESSAGE_MAP()

void CCarlaStudioApp::OnLangPopUpCommand(UINT id)
{
	getProject()->OnLangPopUpCommand(id);
}

/////////////////////////////////////////////////////////////////////////////
// CCarlaStudioApp construction

#ifndef hab215
CCarlaStudioApp::CCarlaStudioApp()
  :m_recentProjectsList(14, "Recent Projects", "File%d", kMaxProjectsInMRU) // increase index so 1st project number is not same as last document number
{
//	m_iNewProjectCreationMethod = -1; // undefined
}
#else //hab215
CCarlaStudioApp::CCarlaStudioApp()
:m_recentProjectsList(13, "Recent Projects", "File%d", kMaxProjectsInMRU)
{
//	m_iNewProjectCreationMethod = -1; // undefined
}
#endif // hab215

/////////////////////////////////////////////////////////////////////////////
// The one and only CCarlaStudioApp objec

CCarlaStudioApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CCarlaStudioApp initialization

BOOL CCarlaStudioApp::InitInstance()
{
try
{
// turn this on for extra new/delete checking in debug version
//	afxMemDF |= checkAlwaysMemDF;

	if (!InitATL())
		return FALSE;

	AfxInitRichEdit( );

	//AddToRecentFileList ("x");

//AfxEnableControlContainer( );	// for using activeX

	// Standard initialization
	// If you are not using these features and wish to reduce the size
	//  of your final executable, you should remove from the following
	//  the specific initialization routines you do not need.

#ifdef _AFXDLL
	Enable3dControls();			// Call this when using MFC in a shared DLL
#else
	Enable3dControlsStatic();	// Call this when linking to MFC statically
#endif

	LoadStdProfileSettings();  // Load standard INI file options (including MRU)
	m_recentProjectsList.ReadList();

	// Register the application's document templates.  Document templates
	//  serve as the connection between documents, frame windows and views.

	CMultiDocTemplate* pDocTemplate;


	// PROJECT
		pDocTemplate = new CMultiDocTemplate(
		IDR_CStudioPTYPE,
		RUNTIME_CLASS(CProjectDoc),
		RUNTIME_CLASS(CNullWindow),//
		RUNTIME_CLASS(CEditView));
	AddDocTemplate(pDocTemplate);

	// language model document
	pDocTemplate = new CMultiDocTemplate(
		IDR_CStudioLangTYPE,
		RUNTIME_CLASS(CLangModelsDoc),
		RUNTIME_CLASS(CTabbedTreeChild), // custom MDI child frame
		RUNTIME_CLASS(CWTabBar));
	AddDocTemplate(pDocTemplate);

	// ANA
	pDocTemplate = new CMultiDocTemplate(
		IDR_CStudioAnaDocType,
		RUNTIME_CLASS(CAnaInputDoc),
		RUNTIME_CLASS(CMDIChildWnd),
		RUNTIME_CLASS(CInputDocView));
		AddDocTemplate(pDocTemplate);

	// SOURCE
	pDocTemplate = new CMultiDocTemplate(
		IDR_CStudioSrcDocType,
		RUNTIME_CLASS(CSourceTextInputDoc),
		RUNTIME_CLASS(CMDIChildWnd),
		RUNTIME_CLASS(CInputDocView));
		AddDocTemplate(pDocTemplate);


	// LOG WINDOW
	pDocTemplate = new CMultiDocTemplate(
			IDR_CLogWindowType,
			RUNTIME_CLASS(CLogWindow),
			RUNTIME_CLASS(CMDIChildWnd),
			RUNTIME_CLASS(CEditView));
		AddDocTemplate(pDocTemplate);

	// QUICK PARSE
	pDocTemplate = new CMultiDocTemplate(
			IDR_QuickParseDocType,
			RUNTIME_CLASS(CQuickParseDoc),
			RUNTIME_CLASS(CMDIChildWnd),
			RUNTIME_CLASS(CQuickParseView));
		AddDocTemplate(pDocTemplate);



/*	pDocTemplate = new CMultiDocTemplate(
		IDR_CStudioPTYPE,
		RUNTIME_CLASS(CProjectDoc),
		RUNTIME_CLASS(CMDIChildWnd),
		RUNTIME_CLASS(CEditView));	// I don't what this means here, since the views are chosen in the settings child window code
	AddDocTemplate(pDocTemplate);
*/
	// create main MDI Frame window
	CStudioMainFrame* pMainFrame = new CStudioMainFrame;
	if (!pMainFrame->LoadFrame(IDR_MAINFRAME))
		return FALSE;
	m_pMainWnd = pMainFrame;

	// Enable drag/drop open
	m_pMainWnd->DragAcceptFiles();

	// Enable DDE Execute open
	EnableShellOpen();
	RegisterShellFileTypes(FALSE);// no printing

	// this must come before the commandline parser, since it might open a project
	CProcessSequence::getAvailableProcessorList(m_pProcessTemplates);


	// Parse command line for standard shell commands, DDE, file open
	CCommandLineInfo cmdInfo;

	cmdInfo.m_bShowSplash = TRUE;

	ParseCommandLine(cmdInfo);

	if (cmdInfo.m_bRunEmbedded || cmdInfo.m_bRunAutomated)
	{
		// this will be true when someone makes a hook object but CS wasn't
		// already running.  COM will run CS for the purpose of getting a hook object.

		// if we wanted to allow CS to run and provide com objects without
		// being visible, then we'd uncomment this line
				//return TRUE;
	}

#ifndef _DEBUG
	if( cmdInfo.m_bShowSplash )
	{
		CGuruSplash * pSplashWnd = new CGuruSplash(IDB_SPLASH,2000);
		pSplashWnd->Create();
	}
#endif

	// jdh the following code is so that we don't get a blank project by default
	// ParseCommand will have changed this to FileOpen if the user opened a project from windows file manager
	if(cmdInfo.m_nShellCommand == CCommandLineInfo::FileNew)
		cmdInfo.m_nShellCommand = CCommandLineInfo::FileNothing;

	pMainFrame->ShowWindow(m_nCmdShow);
	pMainFrame->UpdateWindow();

//	OnAppAbout();

	// Dispatch commands specified on the command line
	if (!ProcessShellCommand(cmdInfo))
		return FALSE;

	m_sLastOpenDir = GetProfileString( "Defaults", "LastOpenDir");

	CString sProjectPath = GetProfileString( "Defaults", "LastProjectFile");
	if(!getProject(TRUE)) // if command-line didn't open one
	{
		if(sProjectPath.GetLength())
		{
			if(askUserToFindFileIfNotFound(sProjectPath, CProjectDoc::getRegFileTypeID()))
				CProjectDoc* pDoc = (CProjectDoc*)OpenDocumentFile(sProjectPath);
		}
		else
		{
			OnFileNewProject();
		}
	}
	// The main window has been initialized, so show and update it.
	//these were above the openDocumentFIle stuff before
	//pMainFrame->ShowWindow(m_nCmdShow);
//	pMainFrame->UpdateWindow();

	}
	catch(LPCTSTR lpszError)
	{
		CString s;
		s = "CARLAStudio has encountered an unexpected condition.\n";
		s += "This is definitely a bug in CarlaStudio.\n";
#ifndef hab15a3
		s += "Please send a bug report, and include the following information:\n\n"; // hab 09/09/1999 fix typo
#else
		s += "Please sent a bug report, and include the following information:\n\n";
#endif // hab15a3
		CString sWhere;\
		sWhere.Format("Uncaught LPTSTR Exception \"%s\"", lpszError);
		s += sWhere;
		AfxMessageBox(s, MB_ICONSTOP | MB_OK);
		return FALSE;
	}
		catch(CString sError)
	{
		CString s;
		s = "CARLAStudio has encountered an unexpected condition.\n";
		s += "This is definitely a bug in CarlaStudio.\n";
#ifndef hab15a3
		s += "Please send a bug report, and include the following information:\n\n"; // hab 09/09/1999 fix typo
#else
		s += "Please sent a bug report, and include the following information:\n\n";
#endif // hab15a3
		CString sWhere;\
		sWhere.Format("Uncaught CString Exception \"%s\"", sError);
		s += sWhere;
		AfxMessageBox(s, MB_ICONSTOP | MB_OK);
		return FALSE;
	}

	// CG: This line inserted by 'Tip of the Day' component.
	ShowTipAtStartup();


	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About
#include "CreditStatic.h"

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	CCreditStatic	m_credits;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	DDX_Control(pDX, IDC_Credits, m_credits);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

// App command to run the dialog
void CCarlaStudioApp::OnAppAbout()
{
	CAboutDlg aboutDlg;
	aboutDlg.DoModal();
}

/////////////////////////////////////////////////////////////////////////////
// CCarlaStudioApp commands

void CCarlaStudioApp::createProjectFromScratch()
{

}

void CCarlaStudioApp::createProjectFromCarlaMenu()
{

}

void CCarlaStudioApp::createProjectFromControlFiles()
{

}

// override of CWinApp::OnFileNew()
void CCarlaStudioApp::OnFileNew()
{
/*	CDlgProjectOpenOrCreate dlg;
	if( dlg.DoModal() != IDOK)
		return;

	// ok, when we make the document, the framework doesn't seem to provide
	// a way to tell the new document what it should be based on.  Thus,
	// we'll store in a member variable the type we need, so that when the
	// document is initiallized, it can ask us how to make itself. Very
	// inelligant.
	switch(dlg.m_iWhatToDo)
	{
		//case 0:	OnFileOpen(); break;	// open existing cwin project
		case 0:	m_iNewProjectCreationMethod = CProjectDoc::kFromScratch; break;
		case 1:	m_iNewProjectCreationMethod = CProjectDoc::kFromCarlaMenu; break;
		case 2:	m_iNewProjectCreationMethod = CProjectDoc::kFromControlFiles; break;
		default: ASSERTX(FALSE); break;
	}

*/	//	pTemplate->OpenDocumentFile(NULL);

// the default here would ask the user to choose between creating a
// or project a language
	if (m_pDocManager != NULL)
		m_pDocManager->OnFileNew();
}

// called by CProjectDoc::OnNewDocument()
/*int CCarlaStudioApp::getNewProjectCreationMethod()
{
	ASSERTX(m_iNewProjectCreationMethod != -1);
	return m_iNewProjectCreationMethod;
}
*/

// called by dialog pages to fit a long path into a small edit box
CString getTruncatedPath(LPCTSTR lpszPath, int iCharacters)
{
	ASSERTX(iCharacters > 5);
	CString s(lpszPath);
	int l = s.GetLength();
	if (l <= iCharacters)
		return s;
	CString r(LPCTSTR(s) + (l-iCharacters), iCharacters);
	r.SetAt(0,'.');
	r.SetAt(1,'.');
	r.SetAt(2,'.');
	return r;
}

/*
CDocTemplate* CCarlaStudioApp::getProjectDocTemplate()
{
	POSITION pos;
	pos = GetFirstDocTemplatePosition();
	CString sType;
	CDocTemplate* pT=NULL;
	do
	{
		pT = GetNextDocTemplate(pos);
		if(pT)
			pT->GetDocString( sType, CDocTemplate::regFileTypeId );
	}
	while (sType != CProjectDoc::getRegFileTypeID() && pos);

	ASSERTX(sType == CProjectDoc::getRegFileTypeID());
	return pT;
}
*/
// right now, just returns the first doc of the first template
 // TO DO: 1)  keep track of the "active" project or something...
CProjectDoc* CCarlaStudioApp::getProject(BOOL bDontComplainIfNone)
{
	CDocTemplate* pT=getDocTemplate(CProjectDoc::getRegFileTypeID() );

	CString sType;
	POSITION pos;
	pos = pT->GetFirstDocPosition();
	if(pos)
	{
		return (CProjectDoc*)pT->GetNextDoc(pos);
	}
	else if(!bDontComplainIfNone)
	{
		//ASSERTX(FALSE);
		//jdh 10 July 200 added this msg, removed assert
		 AfxMessageBox("You must open or create a project before doing that.");
	}

	return NULL;
}

CDocTemplate* CCarlaStudioApp::getDocTemplate(LPCTSTR lpszTemplateName)
{
	POSITION pos;
	pos = GetFirstDocTemplatePosition();
	CString sType;
	CDocTemplate* pT=NULL;
	do
	{
		pT = GetNextDocTemplate(pos);
		if(pT)
			pT->GetDocString( sType, CDocTemplate::regFileTypeId );
	}
	while (sType != lpszTemplateName && pos);

	ASSERTX(sType ==lpszTemplateName);

	return pT;
}

CCarlaStudioApp::~CCarlaStudioApp()
{
	for(int i=0; i < m_pProcessTemplates.GetSize(); i++)
	{
		delete m_pProcessTemplates[i];
	}
//	m_pProcessTemplates.DeleteAllItems();
}

// this is here because OpnDocumentFile must do checking and be stingy, because
// we can't control what it is asked to open.  Use this instead for requests
// generated inside our app where we know this type of document can be opened now.
CDocument* CCarlaStudioApp::internalOpenDocumentFile(LPCTSTR lpszFileName)
{
	CDocument* pDoc = CWinApp::OpenDocumentFile(lpszFileName);
	if(pDoc && pDoc->IsKindOf(RUNTIME_CLASS(CProjectDoc)))
		((CProjectDoc*)pDoc)->cleanupAfterOpen();

	return pDoc;
}
// this can be called by a "most-recent-used" selection, or presumably
// when the user clicks on a file in the explore.  So we need to check
// that this kind of file can be opened now.
CDocument* CCarlaStudioApp::OpenDocumentFile(LPCTSTR lpszFileName)
{
	CDocument* pDoc =  NULL;

	CString s(lpszFileName);
	// Is it a project?
	CString sExt = s.Right(3);
#ifndef hab240
	sExt.MakeLower();
#endif // hab240
	if(sExt == "csp"  )
	{
		if(getProject(TRUE))
			OnFileCloseProject();

	// notice the three failed attempts at hiding the project window without
		// incuring the wrath of the Window menu
	// Doing it this way, we couldn't specify that the doc should be invisble
		//pDoc =  CWinApp::OpenDocumentFile(lpszFileName);

	/*	Hiding the window this way also lead to our bug
		pDoc = getDocTemplate(CProjectDoc::getRegFileTypeID())->OpenDocumentFile(lpszFileName, TRUE); // false lead to Window menu not showing new windows after one had been closed //FALSE);
		POSITION pos = pDoc->GetFirstViewPosition() ;
		CView* pv =  pDoc->GetNextView(pos);
		pv->GetParentFrame()->ShowWindow(SW_HIDE);
	*/

	// this works but the doc would still show in the Window menu
		pDoc = getDocTemplate(CProjectDoc::getRegFileTypeID())->OpenDocumentFile(lpszFileName, TRUE); // false lead to Window menu not showing new windows after one had been closed //FALSE);
		if(!pDoc)
			return NULL;
		POSITION pos = pDoc->GetFirstViewPosition() ;
		CView* pv =  pDoc->GetNextView(pos);
		CRect r2;
		pv->GetParentFrame()->GetWindowRect(&r2);
		r2.OffsetRect(0, 20);
		pv->GetParentFrame()->MoveWindow(&r2);

		if(pDoc && pDoc->IsKindOf(RUNTIME_CLASS(CProjectDoc)))
			((CProjectDoc*)pDoc)->cleanupAfterOpen();
	}

	// Is it an input doc??
	else if(sExt.Left(2) == "an") // permit ana, anb
	{
		if(!getProject(TRUE))
		{
			AfxMessageBox("You must open a project before opening other document types.");
			return NULL;
		}
//		pDoc =  CWinApp::OpenDocumentFile(lpszFileName);
		// go straight to the template so that we know it will be opened as a src text
		CDocTemplate* pT=getDocTemplate(CAnaInputDoc::getRegFileTypeID() );
		pDoc =  pT->OpenDocumentFile(lpszFileName);
		getProject()->SetModifiedFlag(); // having this doc open needs to be saved w/ the project
	}
	else // all other extensions assume it's a text doc
	{
		if(!getProject(TRUE))
		{
			AfxMessageBox("You must open a project before opening other document types.");
			return NULL;
		}

		// go straight to the template so that we know it will be opened as a src text
		CDocTemplate* pT=getDocTemplate(CSourceTextInputDoc::getRegFileTypeID() );
		// make sure the file isn't already open
		POSITION pos = pT->GetFirstDocPosition();
		while(pos)
		{
			pDoc = pT->GetNextDoc(pos);
			if(pDoc->GetPathName() == lpszFileName) // found it already open
			{
				break;
			}
			pDoc = NULL; // that's not it
		}

		if(!pDoc)
		{
			pDoc =  pT->OpenDocumentFile(lpszFileName);
			getProject()->SetModifiedFlag(); // having this doc open needs to be saved w/ the project
		}
	}


	return pDoc;
}

void CCarlaStudioApp::OnProjectSetup()
{
	getProject()->OnProjectSetup();
}

void CCarlaStudioApp::OnUpdateProjectSetup(CCmdUI* pCmdUI)
{
/* UNUSED
	// This is just a hook to change other menus, since
	// I couldn't get the menu changed during the actual
	// creation of the document;  the changes I make
	// seem to be undone unless the window is already drawn.
	// Also, I can't put an update handler on the actual
	// menus I want to change because they are popup ones
	// and don't have a command ID.  So we do it here.
	if(getProject())
		getProject()->updateMenus();
*/
}



void CCarlaStudioApp::projectClosing()
{
	// close everything but what "belongs" to the project

	POSITION templatePos;
	templatePos = GetFirstDocTemplatePosition();
	CString sType;
	CDocTemplate* pT=NULL;
	do	// for each template type
	{
		pT = GetNextDocTemplate(templatePos);
		if(pT)
			pT->GetDocString( sType, CDocTemplate::regFileTypeId );

		if(sType != CProjectDoc::getRegFileTypeID() && sType != CLangModelsDoc::getRegFileTypeID())
		{
			POSITION docPos = pT->GetFirstDocPosition();
			while(docPos)
			{
				pT->GetNextDoc(docPos)->OnCloseDocument();
				docPos = pT->GetFirstDocPosition();
			}
		}
	}
	while (templatePos);
}



// we provide this so that classes can get at the default font
// without haveing to "know about" the CProjectDoc
CFont* getDefaultUserFont()
{
	CProjectDoc *pDoc = ((CCarlaStudioApp*)AfxGetApp())->getProject();
	ASSERTX(pDoc);
	return pDoc->getDefaultFont();
}


void CCarlaStudioApp::OnFileNewProject()
{
	if(getProject(TRUE))
		OnFileCloseProject();

	CProjectDoc* pDoc = (CProjectDoc*) getDocTemplate(CProjectDoc::getRegFileTypeID())->OpenDocumentFile(NULL);
	if(pDoc)
		pDoc->cleanupAfterOpen();
}

void CCarlaStudioApp::OnFILENewLanguage()
{
	getProject()->OnFILENewLanguage();
}

void CCarlaStudioApp::OnUpdateFILENewLanguage(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(getProject(TRUE) != NULL);
}

void CCarlaStudioApp::OnUpdateFileNewProject(CCmdUI* pCmdUI)
{
	//pCmdUI->Enable(getProject(TRUE) == NULL);
}

/*void CCarlaStudioApp::writeToLog(LPCTSTR lpszA, LPCTSTR lpszB, LPCTSTR lpszC, LPCTSTR lpszD)
{
	CLogWindow* pDoc=NULL;
	CDocTemplate* pT=getDocTemplate("LogWindow" );
	CString sType;
	POSITION pos;
	pos = pT->GetFirstDocPosition();
	if(pos)
	{
		pDoc = (CLogWindow*)pT->GetNextDoc(pos);
	}
	else
	{	pDoc = (CLogWindow*)pT->OpenDocumentFile(NULL);
	}
	ASSERTX(pDoc);

	pDoc->append(lpszA, lpszB, lpszC, lpszD);
}
*/

// we use this hook to add items for each language,
// so the user can get to the lang even if its
// window is closed
void CCarlaStudioApp::OnWindowArrange()
{
	if(getProject())
		getProject()->updateWindowMenu();
}

void CCarlaStudioApp::OnFileOpen()
{
	if(!getProject(TRUE))
	{
			CString sFilter;
			CDocTemplate* pDT = theApp.getDocTemplate(CProjectDoc::getRegFileTypeID());
			pDT-> GetDocString(sFilter, CDocTemplate::filterName);
			CString sExt;
			pDT-> GetDocString(sExt, CDocTemplate::filterExt);
			sFilter += "|*";
			sFilter += sExt;
			sFilter+= "||";
			CFileDialog dlg( TRUE,
				sExt,
				NULL, // file name
				OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT | OFN_PATHMUSTEXIST ,
				sFilter, NULL );

			if(IDOK==dlg.DoModal())
			{
				CWinApp::OpenDocumentFile(dlg.GetPathName());
			}
	}
	else
		OnFILEOPENDocument(); //CWinApp::OnFileOpen();
}

// Static
BOOL CCarlaStudioApp::askUserToFindFileIfNotFound(CString & sPath, LPCTSTR lpszRegFileTypeID)
{
	if(0==_access(sPath, 00))
		return TRUE;
	else
		return askUserToFindFile(sPath, lpszRegFileTypeID);
}

// Static
BOOL CCarlaStudioApp::askUserToFindFile(CString & sPath, LPCTSTR lpszRegFileTypeID)
{
	CDocTemplate* pDT = theApp.getDocTemplate(lpszRegFileTypeID);
	CString sFileTypeName;
	pDT->GetDocString(sFileTypeName, CDocTemplate::regFileTypeName);
	CString s;
	CString sMsg("CarlaStudio couldn't open the ");
	sMsg += sFileTypeName;
	sMsg += " named: ";
	sMsg += getFullFileName(sPath);
	sMsg += ", which it expected to find at ";
	sMsg += sPath;
	sMsg += "\n\nThis can happen if you've copied this project from a different computer or moved files around on your computer.\n\n";
	sMsg += "After you choose OK, CarlaStudio will let you locate this file.";
	MessageBox( NULL, sMsg, "File not found",  MB_ICONQUESTION | MB_OK);

	pDT-> GetDocString(s, CDocTemplate::filterName);
	CString sExt;
	pDT-> GetDocString(sExt, CDocTemplate::filterExt);
	s += "|*";
	s += sExt;
	s+= "||";
	CFileDialog dlg( TRUE,
		sExt,
		getFullFileName(sPath),
		OFN_HIDEREADONLY  | OFN_FILEMUSTEXIST,
		s, NULL );
	CString sPrompt("Please locate the file: ");
	sPrompt += getFullFileName(sPath);

	char* lpszPrompt = new char[sPrompt.GetLength()+1];
	strcpy(lpszPrompt, sPrompt);
	dlg.m_ofn.lpstrTitle  = lpszPrompt;
	if(IDOK != dlg.DoModal())
	{
		return FALSE;
	}
	// apparently the dlg takes ownership delete lpszPrompt;
	sPath = dlg.GetPathName();
	return TRUE;
}

CProcessTemplate* CCarlaStudioApp::findTemplateFromID(LPCTSTR lpszProcID)
{
	for (int i = 0; i < m_pProcessTemplates.GetSize(); i++)
	{
		if(lpszProcID == m_pProcessTemplates[i]->getIdentifier())
			return m_pProcessTemplates[i];
	}

	return NULL;
}

// "document" here means a subclass of CInputDoc (src text, ana, ptext, etc)
// this exists to limit the file-types the user can open to things we can
// turn into CInputDocs.
void CCarlaStudioApp::OnFILEOPENDocument()
{
	if(!getProject(TRUE))
		return;

	//		 20-June-2000 jdh added anx as a valid ana file extension
	CString sFilter("Source Texts And ANA Files (*.txt; *.ana; *.anx)|*.txt; *.ana; *.anx|Other text files (*.*)|*.*||");

	CFileDialog dlg( TRUE,
		NULL, // not needed for an open, presumably //sExt,
		NULL, // file name
		/*jdh 12april2001  OFN_HIDEREADONLY |*/ OFN_OVERWRITEPROMPT | OFN_PATHMUSTEXIST ,
		sFilter, NULL );

	//getProject()->setWorkingDirectory();
	dlg.m_ofn.lpstrInitialDir= m_sLastOpenDir; // may be empty

	if(IDOK==dlg.DoModal())
	{
		m_sLastOpenDir = ::getDirectory(dlg.GetPathName()); // save for next time
		CInputDoc* pIDoc = (CInputDoc* ) /*CWinApp::*/OpenDocumentFile(dlg.GetPathName());

		// jdh 12April2001		Allow "open as readonly" handling of open file dialog
		if(pIDoc
			&& ( dlg.GetReadOnlyPref() || (FILE_ATTRIBUTE_READONLY & ::GetFileAttributes(pIDoc->GetPathName())))
			&&	pIDoc->IsKindOf(RUNTIME_CLASS(CInputDoc)))/*should always be true, but just to be safe*/
		{
			pIDoc->SetBaseReadOnly(TRUE);
		}
	}

}

void CCarlaStudioApp::OnFILEOPENProject()
{
	if(getProject(TRUE))
		OnFileCloseProject();
	CString sFilter;
	CDocTemplate* pDT = theApp.getDocTemplate(CProjectDoc::getRegFileTypeID());
	pDT-> GetDocString(sFilter, CDocTemplate::filterName);
	CString sExt;
	pDT-> GetDocString(sExt, CDocTemplate::filterExt);
	sFilter += "|*";
	sFilter += sExt;
	sFilter+= "||";
	CFileDialog dlg( TRUE,
		sExt,
		NULL, // file name
		OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT | OFN_PATHMUSTEXIST ,
		sFilter, AfxGetMainWnd() );

	if(IDOK==dlg.DoModal())
	{
		CProjectDoc* pDoc = (CProjectDoc*)CWinApp::OpenDocumentFile(dlg.GetPathName());
		if(pDoc)
			pDoc->cleanupAfterOpen();

	}
}

void CCarlaStudioApp::OnFileCloseProject()
{
	if(getProject(TRUE))
		getProject()-> OnCloseDocument( );
}

void CCarlaStudioApp::OnUpdateFILEOPENDocument(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(getProject(TRUE) && getProject()->getHaveLanguages());
}

void CCarlaStudioApp::AddToRecentFileList(LPCTSTR lpszPathName)
{
	CString s(lpszPathName);
	if(s.Right(3) == "txt" || s.Right(3) == "ana"		// SOURCE & ana TEXTS
		|| s.Right(3) == "anx") // jdh 20June2000 added
	{
		CWinApp::AddToRecentFileList(lpszPathName);
	}
	else if(s.Right(3) == "csp")	// PROJECTS
	{
		// fully qualify the path name
		//TCHAR szTemp[_MAX_PATH];
		//AfxFullPath(szTemp, lpszPathName);

		// then add to recent file list
		m_recentProjectsList.Add(lpszPathName);//szTemp);
	}
}

void CCarlaStudioApp::OnUpdateFileMruProject(CCmdUI* pCmdUI)
{
		m_recentProjectsList.UpdateMenu(pCmdUI);
}

void CCarlaStudioApp::OnFileMruProject(UINT id)
{
	ASSERT_VALID(this);

	ASSERTX(id >= ID_FILE_MRU_PROJECT);
	ASSERTX(id < ID_FILE_MRU_PROJECT + (UINT)m_recentProjectsList.GetSize());
	int nIndex = id - ID_FILE_MRU_PROJECT;
	ASSERTX(m_recentProjectsList[nIndex].GetLength() != 0);

	TRACE2("PROJECT MRU: open file (%d) '%s'.\n", (nIndex) + 1,
			(LPCTSTR)m_recentProjectsList[nIndex]);

	if (OpenDocumentFile(m_recentProjectsList[nIndex]) == NULL)
		m_recentProjectsList.Remove(nIndex);
}

int CCarlaStudioApp::ExitInstance()
{
	m_recentProjectsList.WriteList();

	if(	!m_sLastOpenDir.IsEmpty())
	{
		WriteProfileString( "Defaults", "LastOpenDir", m_sLastOpenDir);
	}

	if (m_bATLInited)
	{
		_Module.RevokeClassObjects();
		_Module.Term();
		CoUninitialize();
	}

	return CWinApp::ExitInstance();
}


void CCarlaStudioApp::OnAppExit()
{
	CWinApp::OnAppExit();

}

int CCarlaStudioApp::Run()
{
	try
	{
		return CWinApp::Run();
	}
	catch(LPCTSTR lpszError)
	{
		CString s;
		s = "CARLAStudio has encountered an unexpected condition.\n";
		s += "This is definitely a bug in CarlaStudio.\n";
#ifndef hab15a3
		s += "Please send a bug report, and include the following information:\n\n"; // hab 09/09/1999 fix typo
#else
		s += "Please sent a bug report, and include the following information:\n\n";
#endif // hab15a3
		CString sWhere;\
		sWhere.Format("Uncaught LPTSTR Exception \"%s\"", lpszError);
		s += sWhere;
		AfxMessageBox(s, MB_ICONSTOP | MB_OK);
	}
		catch(CString sError)
	{
		CString s;
		s = "CARLAStudio has encountered an unexpected condition.\n";
		s += "This is definitely a bug in CarlaStudio.\n";
#ifndef hab15a3
		s += "Please send a bug report, and include the following information:\n\n"; // hab 09/09/1999 fix typo
#else
		s += "Please sent a bug report, and include the following information:\n\n";
#endif // hab15a3
		CString sWhere;\
		sWhere.Format("Uncaught CString Exception \"%s\"", sError);
		s += sWhere;
		AfxMessageBox(s, MB_ICONSTOP | MB_OK);
	}


	return 0; // I couldn't figure out what the return values of winapp::run are.
}

void CCarlaStudioApp::ShowTipAtStartup(void)
{
	// CG: This function added by 'Tip of the Day' component.

	CCommandLineInfo cmdInfo;
	ParseCommandLine(cmdInfo);
	if (cmdInfo.m_bShowSplash)
	{
		CDlgTipDay dlg;
		if (dlg.m_bStartup)
			dlg.DoModal();
	}
}

void CCarlaStudioApp::ShowTipOfTheDay(void)
{
	// CG: This function added by 'Tip of the Day' component.

	CDlgTipDay dlg;
	dlg.DoModal();

}

// putting this here lets us invoke a quickParse from any document type
void CCarlaStudioApp::OnQuickParse()
{
	getProject()->OnQuickParse();
}

void CCarlaStudioApp::OnUpdateQuickParse(CCmdUI* pCmdUI)
{
	if(!getProject(TRUE))
		pCmdUI->Enable(FALSE);
	else
		getProject()->OnUpdateQuickParse(pCmdUI);
}

BOOL CCarlaStudioApp::OnDDECommand(LPTSTR lpszCommand)
{
	// TODO: Add your specialized code here and/or call the base class

	return CWinApp::OnDDECommand(lpszCommand);
}

// i overroad the CWinApp version because, in vc++6.0, it often choked
// when it called CWnd::GetSafeOwner_
// but now I've got it disabled, looking for the problem to come back
#include <AFXPRIV.H>
int CCarlaStudioApp::DoMessageBox(LPCTSTR lpszPrompt, UINT nType, UINT nIDPrompt)
{
//	return CWinApp::DoMessageBox(lpszPrompt, nType, nIDPrompt);

	// disable windows for modal dialog
	EnableModeless(FALSE);
	HWND hWndTop=NULL; // jdh made null since we don't fill it in

	HWND hWnd = AfxGetMainWnd()->GetSafeHwnd();

	//HWND hWnd = CWnd::GetSafeOwner_(NULL, &hWndTop); // <--  dies here when AfxGetThreadState()->m_pRoutingFrame  gives a bad result

	// set help context if possible
	DWORD* pdwContext = NULL;
/*	if (hWnd != NULL)
	{
		// use app-level context or frame level context
		LRESULT lResult = ::SendMessage(hWndTop, WM_HELPPROMPTADDR, 0, 0);
		if (lResult != 0)
			pdwContext = (DWORD*)lResult;
	}
*/
	// for backward compatibility use app context if possible
	if (pdwContext == NULL && this != NULL)
		pdwContext = &m_dwPromptContext;

	DWORD dwOldPromptContext = 0;
	if (pdwContext != NULL)
	{
		// save old prompt context for restoration later
		dwOldPromptContext = *pdwContext;
		if (nIDPrompt != 0)
			*pdwContext = HID_BASE_PROMPT+nIDPrompt;
	}

	// determine icon based on type specified
	if ((nType & MB_ICONMASK) == 0)
	{
		switch (nType & MB_TYPEMASK)
		{
		case MB_OK:
		case MB_OKCANCEL:
			nType |= MB_ICONEXCLAMATION;
			break;

		case MB_YESNO:
		case MB_YESNOCANCEL:
			nType |= MB_ICONEXCLAMATION;
			break;

		case MB_ABORTRETRYIGNORE:
		case MB_RETRYCANCEL:
			// No default icon for these types, since they are rarely used.
			// The caller should specify the icon.
			break;
		}
	}

#ifdef _DEBUG
	if ((nType & MB_ICONMASK) == 0)
		TRACE0("Warning: no icon specified for message box.\n");
#endif

	TCHAR szAppName[_MAX_PATH];
	LPCTSTR pszAppName;
	if (this != NULL)
		pszAppName = m_pszAppName;
	else
	{
		pszAppName = szAppName;
		GetModuleFileName(NULL, szAppName, _MAX_PATH);
	}

	int nResult =
		::MessageBox(hWnd, lpszPrompt, pszAppName, nType);

	// restore prompt context if possible
	if (pdwContext != NULL)
		*pdwContext = dwOldPromptContext;

	// re-enable windows
	if (hWndTop != NULL)
		::EnableWindow(hWndTop, TRUE);
	EnableModeless(TRUE);

	return nResult;

}

BOOL CAboutDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	m_credits.SetCredits(IDS_Credits);
	//m_credits.SetGradient(GRADIENT_LEFT_DARK);
//	m_credits.SetTextHeight(TOP_LEVEL_TITLE_HEIGHT, 30);
	m_credits.SetTransparent(TRUE); // doesn't do anything
	m_credits.StartScrolling();

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

void CCarlaStudioApp::OnFILESaveAll()
{
	OnFILESAVEProject();

	POSITION templatePos;
	templatePos = GetFirstDocTemplatePosition();
	CString sType;
	CDocTemplate* pT=NULL;
	do	// for each template type
	{
		pT = GetNextDocTemplate(templatePos);
		if(pT)
			pT->GetDocString( sType, CDocTemplate::regFileTypeId );

		// ignore file types that "belong" to the project; they were saved by ONFILESAVEProject();
		// also ignore the log window
		if(sType != CProjectDoc::getRegFileTypeID()
			&& sType != CLangModelsDoc::getRegFileTypeID()
			&& sType != CLogWindow::getRegFileTypeID()
			&& sType != CQuickParseDoc::getRegFileTypeID())
		{
			POSITION docPos = pT->GetFirstDocPosition();
			while(docPos)
			{
				CDocument* pDoc = pT->GetNextDoc(docPos);
				ASSERTX(pDoc != NULL);
				// note: this doesn't handle case where user moved or deleted the file out from under us, if that's possible
				if(pDoc->IsModified()) 	// jdh 12April2001	don't save if not modified
				{
					pDoc->OnSaveDocument(pDoc->GetPathName());
				}
			}
		}
	}
	while (templatePos);

}

// file save currently does a save-all, which currently just
// will save the project and all the languages
void CCarlaStudioApp::OnFILESAVEProject()
{
	getProject()->OnSaveDocument(getProject()->GetPathName());
}

// this is here so that the user doesn't have to switch to the src or ana
// document before giving process cmd.
// It only works if there is exactly one document open.

void CCarlaStudioApp::OnRunProcessors()
{
	RunProcessors(); // need OnRunProcessors because it must be void,
					// but we need to
					// 1) return a BOOL when called by csremote
					// 2) accept which doc so in the future csremote can tell us that
}

void CCarlaStudioApp::OnUpdateRunProcessors(CCmdUI* pCmdUI)
{
	CDocTemplate* pT=getDocTemplate(CSourceTextInputDoc::getRegFileTypeID() );

	CString sType;
	POSITION pos;
	pos = pT->GetFirstDocPosition();
	BOOL bHaveAtLeastOneInputDoc = (pos != NULL);
	if(!bHaveAtLeastOneInputDoc)	// check for an ANA doc
	{
		pT=getDocTemplate(CAnaInputDoc::getRegFileTypeID() );
		pos = pT->GetFirstDocPosition();
		bHaveAtLeastOneInputDoc = (pos != NULL);
	}

	pCmdUI->Enable(getProject(TRUE)!=NULL && bHaveAtLeastOneInputDoc);
}

int CCarlaStudioApp::RunProcessors(/*in, out*/	CRemoteCommand* pRemoteCmd/*=NULL*/,
								   /*in*/		CDocument *pDoc/*=NULL*/)
{
	enum{kSuccess=0, kProcessError=1, kNoDoc=2, kMultipleDocs=3, kBadDoc=4};
	if(!pDoc)
	{
		CDocTemplate* pT=getDocTemplate(CSourceTextInputDoc::getRegFileTypeID() );

		CString sType;
		POSITION pos;
		pos = pT->GetFirstDocPosition();
		if(pos)
			pDoc = (CInputDoc*)pT->GetNextDoc(pos);
		else
		{
			pT=getDocTemplate(CAnaInputDoc::getRegFileTypeID() );
			pos = pT->GetFirstDocPosition();
			if(pos)
				pDoc = (CInputDoc*)pT->GetNextDoc(pos);
		}
	}

	// disabled because when we're called from the CSREmote, how do we know
	// if this document (pDoc) isn't the front-most window?
	// therefore, we just parse the first do we come to
	/*if(pos)
	{
		AfxMessageBox("Since you have more than one document open, you must first bring the document you want to process to the top.");
		return kMultipleDocs; // error more than one doc open
	}
	else */

	if(pDoc)
	{
		if(!pDoc->IsKindOf(RUNTIME_CLASS(CInputDoc)))
		{
				AfxMessageBox("CarlaStudio does not know how to process this file.");
				return kBadDoc;
		}

		//jdh 11/10/99 added check for pRemoteCmd.  It will be null when the user does a Ctrl-\ from the language window

		if(pRemoteCmd && !pRemoteCmd->pSourceLang)	// jdh 9/4/99 trying to make csremote work again
			pRemoteCmd->pSourceLang = ((CInputDoc*)pDoc)->getSrcLang();

		BOOL bOK = ((CInputDoc*)pDoc)->doRunProcessors(pRemoteCmd);
		if(!bOK)
			return kProcessError;
		else
			return kSuccess;
	}
	else	// for csremote, where the OnUpdateRunProcessors isn't used
	{
		AfxMessageBox("You must first open a document you want to process.");
		return kNoDoc; // error no docs open
	}
}

void CCarlaStudioApp::OnFILENewDocument()
{
	// in adding this feature, it turned out that an unsaved doc, with no
	// pathname, caused a lot of problems down the line.  THerefore, I just
	// assume that this is a scratch document and so I create on in the windows
	// temp directory with a name that is not already open this session.

	CString sTry;
	CDocTemplate* pT=getDocTemplate(CSourceTextInputDoc::getRegFileTypeID() );
/*#ifdef Before1_04
	#define ROOTTEMPDIR  "C:\\WINDOWS\\TEMP\\CSTUDIO"
	CString sTempDocsDir = ROOTTEMPDIR;
#else
	#ifdef BeforeNov99  // hab 1.04
	TCHAR lpszWinDirectory[MAX_PATH];
		GetWindowsDirectory(lpszWinDirectory, MAX_PATH);
	CString sTempDocsDir;
	sTempDocsDir.Format("%s\\TEMP\\CSTUDIO", lpszWinDirectory);
#endif // Before1_04
*/

	//jdh 11/11/99 changed to use the TEMP environment variable instead of assuming it's in the windows dir (per Randy Regnier)
	CString sTempDocsDir;
	sTempDocsDir.Format("%s\\CSTUDIO", getenv("TEMP"));


	CreateDirectory(sTempDocsDir, NULL);// MAKE SURE IT IS THERE
	sTempDocsDir+="\\TempDocs";
	CreateDirectory(sTempDocsDir, NULL);// MAKE SURE IT IS THERE

	// find a name that isn't already in use as an open document
	for(int i=1; ; i++)
	{
		sTry.Format("%s\\doc%d.txt", sTempDocsDir, i);
		BOOL bNameTaken = FALSE;
		POSITION pos = pT->GetFirstDocPosition();
		while(pos)
		{
			CDocument* pDoc = pT->GetNextDoc(pos);
			ASSERT(pDoc);
			if(pDoc->GetPathName() == sTry)
			{
				bNameTaken = TRUE;
				break;	// don't check the rest of the open documents
			}
		}
		if(!bNameTaken)
			break; // don't try any new names
	}

	CPathDescriptor pd(sTry);

	// will overwrite any existing file with this name

	FILE * tempFile = 	fopen(sTry, "w");
	fclose(tempFile);


	CDocument* pDoc = pT->OpenDocumentFile(sTry);
	if(!pDoc)
		return;

}

#include "focuser.h"
void CCarlaStudioApp::OnJump()
{
	CFocuser foc;
	CWnd* p = ::AfxGetMainWnd();
	if(!p || !p->IsKindOf(RUNTIME_CLASS(CFrameWnd)))
		return;
	CFrameWnd* pf = (CFrameWnd*)p;
	pf = pf->GetActiveFrame();

	if(!pf)
		return;
	CView* pv = pf->GetActiveView();
	if(!pv)
		return;
	p = pv->GetFocus();
	if(!p)
		return;

	CString s;
	if(p->IsKindOf(RUNTIME_CLASS(CRichEditCtrl)))
	{
		CRichEditCtrl* pRec = ((CRichEditCtrl*)p);
		long lStart, lEnd;
		pRec->GetSel(lStart, lEnd);
		if(lEnd > lStart)
			s = pRec->GetSelText();
	}
	else if(p->IsKindOf(RUNTIME_CLASS(CEdit)))
	{
		CEdit* pec = ((CEdit*)p);
		int iStart, iEnd;
		pec->GetSel(iStart, iEnd);
		if(iEnd > iStart)
		{
			CString sWin;
			pec->GetWindowText(sWin);
			CString sSel(LPCTSTR(sWin) + iStart, (iEnd-iStart));
			s = sSel;
		}
	}
	else
	{
		if(OpenClipboard(NULL))
		{
			HANDLE h;
			h = GetClipboardData(CF_TEXT);
			CString sclip = (LPCTSTR) LocalLock(h);
			LocalUnlock(h);
			sclip.TrimLeft();
			int ls = sclip.Find(' ', 0);
			if(ls>0)
				s = sclip.Left(ls);
			else
				s = sclip;
		}
		CloseClipboard();


	}
		if(s.IsEmpty())
			AfxMessageBox("You must select a word first.");
		else
			foc.focusShbxOnWord(s);
}



///////// for atl



BEGIN_OBJECT_MAP(ObjectMap)
	OBJECT_ENTRY(CLSID_CSHook, CHook)
	OBJECT_ENTRY(CLSID_ParseCS, CParseCSImpl)
END_OBJECT_MAP()

LONG CStudioModule::Unlock()
{
	AfxOleUnlockApp();
	return 0;
}

LONG CStudioModule::Lock()
{
	AfxOleLockApp();
	return 1;
}
LPCTSTR CStudioModule::FindOneOf(LPCTSTR p1, LPCTSTR p2)
{
	while (*p1 != NULL)
	{
		LPCTSTR p = p2;
		while (*p != NULL)
		{
			if (*p1 == *p)
				return CharNext(p1);
			p = CharNext(p);
		}
		p1++;
	}
	return NULL;
}


BOOL CCarlaStudioApp::InitATL()
{
	m_bATLInited = TRUE;

#if _WIN32_WINNT >= 0x0400
	HRESULT hRes = CoInitializeEx(NULL, COINIT_MULTITHREADED);
#else
	HRESULT hRes = CoInitialize(NULL);
#endif

	if (FAILED(hRes))
	{
		m_bATLInited = FALSE;
		return FALSE;
	}

	_Module.Init(ObjectMap, AfxGetInstanceHandle());
	_Module.dwThreadID = GetCurrentThreadId();

	LPTSTR lpCmdLine = GetCommandLine(); //this line necessary for _ATL_MIN_CRT
	TCHAR szTokens[] = _T("-/");

	BOOL bRun = TRUE;
	LPCTSTR lpszToken = _Module.FindOneOf(lpCmdLine, szTokens);
	while (lpszToken != NULL)
	{
		if (lstrcmpi(lpszToken, _T("UnregServer"))==0)
		{
			_Module.UpdateRegistryFromResource(IDR_CSTUDIO, FALSE);
			_Module.UnregisterServer(TRUE); //TRUE means typelib is unreg'd
			bRun = FALSE;
			break;
		}
		if (lstrcmpi(lpszToken, _T("RegServer"))==0)
		{
			_Module.UpdateRegistryFromResource(IDR_CSTUDIO, TRUE);
			HRESULT hr = _Module.RegisterServer(TRUE);

/*			READ THE FOLLOWING, WHICH IS INTERESTING, BUT I FOUND THAT IT DIDN'T
			QUITE WORK FOR SOME REASON.  INSTEAD, i NOW HAVE A POST-BUILD STEP
			IN THE SETTING FOR THIS PROJECT WHICH COPIES THE CStudioCom.tlb to CStudio.tlb
			SO THAT THE DEFAULT CODE, ABOVE, WORKS.


			// we know the above fails because it is looking for CStudio.tlb, which
			// doesn't exist, because our .idl is named CStudioCom.idl, which
			// has the nice effect of outputing CStudioCom.h instead of the ambiguous
			// (and conflicting) CStudio.h

			// it is possible to put the tlb in a resource, but I haven't tried that
			// yet, since it would mean pasting in the contents of the tlb every time
			// the tlb changed.

			//  So, I've inserted this coad to load and register the type lib correctly.


			ITypeLib* pITypeLib = NULL;
			hr = LoadTypeLib(L"CStudioCom.tlb", &pITypeLib);
			if(FAILED(hr))
			{
				AfxMessageBox("Could not register the CStudioCOM.tlb type library.  Is it missing?");
			}
			else
			{
				hr = RegisterTypeLib(pITypeLib, L"CStudioCOM.tlb", NULL);
				if(FAILED(hr))
					AfxMessageBox("Could not register the CStudioCOM.tlb type library.");
			}
*/

			bRun = FALSE;
			break;
		}
		lpszToken = _Module.FindOneOf(lpszToken, szTokens);
	}

	if (!bRun)
	{
		m_bATLInited = FALSE;
		_Module.Term();
		CoUninitialize();
		return FALSE;
	}

	hRes = _Module.RegisterClassObjects(CLSCTX_LOCAL_SERVER,
		REGCLS_MULTIPLEUSE);
	if (FAILED(hRes))
	{
		m_bATLInited = FALSE;
		CoUninitialize();
		return FALSE;
	}

	return TRUE;

}
