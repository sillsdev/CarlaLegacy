// TabbedTreeChild.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "TabbedTreeChild.h"
#include "CWTabBar.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CString gsFindWhat; // global so that each find starts with the contents of the last find
extern DWORD gdwFindFlags;

/////////////////////////////////////////////////////////////////////////////
// CTabbedTreeChild

IMPLEMENT_DYNCREATE(CTabbedTreeChild, CMDIChildWnd)

CTabbedTreeChild::CTabbedTreeChild()
: m_pFindDlg(NULL)
{
}

CTabbedTreeChild::~CTabbedTreeChild()
{
	if(m_pFindDlg)
		delete m_pFindDlg;
}

static UINT WM_FINDREPLACE = ::RegisterWindowMessage(FINDMSGSTRING);


BEGIN_MESSAGE_MAP(CTabbedTreeChild, CMDIChildWnd)
	//{{AFX_MSG_MAP(CTabbedTreeChild)
	ON_WM_MDIACTIVATE()
	ON_COMMAND(ID_EDIT_FIND, OnEditFind)
	ON_UPDATE_COMMAND_UI(ID_EDIT_FIND, OnUpdateEditFind)
	ON_REGISTERED_MESSAGE( WM_FINDREPLACE, OnFindReplace )
	ON_COMMAND(ID_EDIT_FindAgain, OnEDITFindAgain)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTabbedTreeChild message handlers

BOOL CTabbedTreeChild::OnCreateClient(LPCREATESTRUCT lpcs, CCreateContext* pContext)
{
	return CMDIChildWnd::OnCreateClient(lpcs, pContext);
}

void CTabbedTreeChild::InterfaceChanged()
{
	getTabBar()->populate();
}

 //called by LangModelsDoc::TopicChanged()
void CTabbedTreeChild::TopicChanged(CWTopic* pNewTopic)
{
	getTabBar()->topicChanged(pNewTopic);
}

// Syncronize the data in the current view before changing the view
//	or writing out the control files
//  Called by TopicChanged and CWLangModelsDoc::OnSaveDocument
void CTabbedTreeChild::retrieveData()
{
	getTabBar()->retrieveData();
}

CWTabBar* CTabbedTreeChild::getTabBar()
{
	CWnd* pBar =	GetWindow(GW_CHILD);
	ASSERTX(pBar->IsKindOf(RUNTIME_CLASS(CWTabBar)));
	return (CWTabBar*)pBar;
}

// this function is specific to CarlaStudio, where we want
// the language menu to be renamed to the name of the language
void CTabbedTreeChild::OnMDIActivate(BOOL bActivate, CWnd* pActivateWnd, CWnd* pDeactivateWnd)
{
	CMDIChildWnd::OnMDIActivate(bActivate, pActivateWnd, pDeactivateWnd);

	if(!bActivate)
		return;

//	CWnd* pWnd = AfxGetMainWnd(); //this->GetParent(); //AfxGetMainWnd();
//	CMenu* pTopMenu = pWnd->GetMenu();
//	if(!pTopMenu || !::IsMenu(pTopMenu->m_hMenu))
//		return;

//	CString s;
//	#define kLangMenuPosition 3
//	int iLangMenuPosition = kLangMenuPosition;


//	pTopMenu->GetMenuString(iLangMenuPosition, s, MF_BYPOSITION);
	//TRACE("OnMDIActivate(%d) menu was %s (%s)\n", bActivate, s, getTabBar()->GetDocument()->GetTitle());

//	if(s == "&View")	// when maximized, all menus are shifted one to the right by the little icon menu
//		++iLangMenuPosition;

/*	if(bActivate)
	{
		CString s = getTabBar()->GetDocument()->GetTitle();
		if(s.Right(2) == " *")	// remove the modified indicator
			s = s.Left(s.GetLength() -2);
		pTopMenu->ModifyMenu( iLangMenuPosition, MF_BYPOSITION | MF_STRING, 0,s); //m_pLang->getName() );
	}
	else	// if we're being deactivated in favor of a non-lang document, then we would like this menu to go away. But that would be messy. So for now we just rename it.
*/

	//pTopMenu->ModifyMenu( iLangMenuPosition, MF_BYPOSITION | MF_STRING, 0, "&Language");

//	pWnd->DrawMenuBar();
}

void CTabbedTreeChild::OnEditFind()
{
	if(m_pFindDlg)
		return;

	m_pFindDlg = getTabBar()->getFindDlg();

/*
	m_pFindDlg = new CDlgFind(); //CFindReplaceDialog();
	m_pFindDlg->Create(TRUE, "",
		NULL, //replace with
		FR_HIDEWHOLEWORD|FR_HIDEUPDOWN, // flags
		this);
*/

	// reset our index of which item we're on (is this used?)
//	m_pFindDlg->m_fr.lCustData = (LPARAM)-1;
}

void CTabbedTreeChild::OnUpdateEditFind(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(TRUE);
}


LONG CTabbedTreeChild::OnFindReplace(WPARAM wParam, LPARAM lParam)
{
	FINDREPLACE* pFind = (FINDREPLACE*) lParam;

	/*typedef struct {    // fr
	DWORD        lStructSize;
	HWND         hwndOwner;
	HINSTANCE    hInstance;
	DWORD        Flags;
	LPTSTR        lpstrFindWhat;
	LPTSTR        lpstrReplaceWith;
	WORD         wFindWhatLen;
	WORD         wReplaceWithLen;
	LPARAM        lCustData;
	LPFRHOOKPROC lpfnHook;
	LPCTSTR       lpTemplateName;
}*/
	if(pFind->Flags & FR_DIALOGTERM)
	{
		//delete m_pFindDlg;
		m_pFindDlg=NULL;
		return 0;
	}

		getTabBar()->doFindReplace(pFind);

	return 0;
}

// called by tabbedTreeView::OnKeyDown when the user wants
// to switch over from the tree to the content
void CTabbedTreeChild::switchViewFocus(BOOL bToContent)
{
	getTabBar()->switchViewFocus(bToContent);
}

void CTabbedTreeChild::OnEDITFindAgain()
{
	if(gsFindWhat.IsEmpty())
		OnEditFind();
	else
	{
		FINDREPLACE find;
		const char* p = LPCTSTR(gsFindWhat);
		find.lpstrFindWhat =const_cast<char*> (p);
		find.Flags=gdwFindFlags;
		getTabBar()->doFindReplace(&find);
	}

}
