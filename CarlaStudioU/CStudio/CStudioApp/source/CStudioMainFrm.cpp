// ProjMainFrm.cpp : implementation of the CStudioMainFrame class
//

#include "stdafx.h"
#include "CARLAStudioApp.h"

#include "CStudioMainFrm.h"
#include "remoteHandlers.h"	// for csremote only, not csbridge

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CStudioMainFrame

IMPLEMENT_DYNAMIC(CStudioMainFrame, CMDIFrameWnd)

// unused? const UINT     wm_ProcessFrontMostDoc = RegisterWindowMessage( "ProcessDoc" );
const UINT     wm_InterlinearizeDoc = RegisterWindowMessage( _T("InterlinearizeDoc") );
const UINT     wm_CarlaStudioPing = RegisterWindowMessage( _T("CarlaStudioPing") );
const UINT     wm_CSPublishParams = RegisterWindowMessage( _T("CSPublishParams") );


LONG CStudioMainFrame::OnRemoteProcess( WPARAM wParam, LPARAM lParam)
{
	return ::handleRemoteProcess(wParam, lParam);
}


LONG CStudioMainFrame::OnPing(WPARAM wParam, LPARAM lParam)
{
	PostThreadMessage((DWORD)lParam, // thread id
		wm_CarlaStudioPing, NULL, NULL);
	return 0;
}

BEGIN_MESSAGE_MAP(CStudioMainFrame, CMDIFrameWnd)
	ON_WM_INITMENU()
	//{{AFX_MSG_MAP(CStudioMainFrame)
	ON_WM_CREATE()
	ON_WM_CLOSE()
	//}}AFX_MSG_MAP
	// Global help commands
	ON_COMMAND(ID_HELP_FINDER, CMDIFrameWnd::OnHelpFinder)
	ON_COMMAND(ID_HELP, CMDIFrameWnd::OnHelp)
	ON_COMMAND(ID_CONTEXT_HELP, CMDIFrameWnd::OnContextHelp)
	ON_COMMAND(ID_DEFAULT_HELP, CMDIFrameWnd::OnHelpFinder)
	// Interapplication communication
   // ON_REGISTERED_MESSAGE( wm_ProcessFrontMostDoc, OnRemoteProcess )
	ON_REGISTERED_MESSAGE( wm_InterlinearizeDoc, OnRemoteProcess )
	ON_REGISTERED_MESSAGE( wm_CarlaStudioPing, OnPing )
	ON_REGISTERED_MESSAGE( wm_CSPublishParams, OnPublishParams )

END_MESSAGE_MAP()

static UINT indicators[] =
{
	ID_SEPARATOR,           // status line indicator
	ID_INDICATOR_CAPS,
	ID_INDICATOR_NUM,
	ID_INDICATOR_SCRL,
};

/////////////////////////////////////////////////////////////////////////////
// CStudioMainFrame construction/destruction

CStudioMainFrame::CStudioMainFrame()
{
	// TODO: add member initialization code here

}

CStudioMainFrame::~CStudioMainFrame()
{
}

int CStudioMainFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CMDIFrameWnd::OnCreate(lpCreateStruct) == -1)
		return -1;

	if (!m_wndToolBar.Create(this) ||
		!m_wndToolBar.LoadToolBar(IDR_MAINFRAME))
	{
		TRACE(_T("Failed to create toolbar\n"));
		return -1;      // fail to create
	}

	if (!m_wndStatusBar.Create(this) ||
		!m_wndStatusBar.SetIndicators(indicators,
		  sizeof(indicators)/sizeof(UINT)))
	{
		TRACE(_T("Failed to create status bar\n"));
		return -1;      // fail to create
	}

	// TODO: Remove this if you don't want tool tips or a resizeable toolbar
	m_wndToolBar.SetBarStyle(m_wndToolBar.GetBarStyle() |
		CBRS_TOOLTIPS | CBRS_FLYBY | CBRS_SIZE_DYNAMIC);

	// TODO: Delete these three lines if you don't want the toolbar to
	//  be dockable
	m_wndToolBar.EnableDocking(CBRS_ALIGN_ANY);
	EnableDocking(CBRS_ALIGN_ANY);
	DockControlBar(&m_wndToolBar);

	return 0;
}

//this code from codeguru by Yonat Sharon
BOOL CStudioMainFrame::PreCreateWindow(CREATESTRUCT& cs)
{
	//    // Restore main window position    //
	CWinApp* app = AfxGetApp();
	int s, t, b, r, l;
	// only restore if there is a previously saved position
	if ( -1 != (s = app->GetProfileInt(_T("Frame"), _T("Status"),   -1)) &&
		 -1 != (t = app->GetProfileInt(_T("Frame"), _T("Top"),      -1)) &&
		 -1 != (l = app->GetProfileInt(_T("Frame"), _T("Left"),     -1)) &&
		 -1 != (b = app->GetProfileInt(_T("Frame"), _T("Bottom"),   -1)) &&
		 -1 != (r = app->GetProfileInt(_T("Frame"), _T("Right"),    -1))       )
	{
		// don't keep a minimized state
		if(s == SW_SHOWMINIMIZED   )
		{
			s = SW_RESTORE;
		}
		// restore the window's status
		app->m_nCmdShow = s;
		// restore the window's width and height
		cs.cx = r - l;
		cs.cy = b - t;
		// the following correction is needed when the taskbar is
		// at the left or top and it is not "auto-hidden"
		RECT workArea;
		SystemParametersInfo(SPI_GETWORKAREA, 0, &workArea, 0);
		l += workArea.left;
		t += workArea.top;
		// make sure the window is not completely out of sight
		int max_x = GetSystemMetrics(SM_CXSCREEN) -
						GetSystemMetrics(SM_CXICON);
		int max_y = GetSystemMetrics(SM_CYSCREEN) -
						GetSystemMetrics(SM_CYICON);
		cs.x = min(l, max_x);
		cs.y = min(t, max_y);
	}
	return CMDIFrameWnd::PreCreateWindow(cs);
}

//this code from codeguru by Yonat Sharon
void CStudioMainFrame::OnClose()
{    // Save main window position
	CWinApp* app = AfxGetApp();
	WINDOWPLACEMENT wp;    GetWindowPlacement(&wp);
	app->WriteProfileInt(_T("Frame"), _T("Status"), wp.showCmd);
	app->WriteProfileInt(_T("Frame"), _T("Top"),    wp.rcNormalPosition.top);
	app->WriteProfileInt(_T("Frame"), _T("Left"),   wp.rcNormalPosition.left);
	app->WriteProfileInt(_T("Frame"), _T("Bottom"), wp.rcNormalPosition.bottom);
	app->WriteProfileInt(_T("Frame"), _T("Right"),  wp.rcNormalPosition.right);

	CMDIFrameWnd::OnClose();
}

/////////////////////////////////////////////////////////////////////////////
// CStudioMainFrame diagnostics

#ifdef _DEBUG
void CStudioMainFrame::AssertValid() const
{
	CMDIFrameWnd::AssertValid();
}

void CStudioMainFrame::Dump(CDumpContext& dc) const
{
	CMDIFrameWnd::Dump(dc);
}

#endif //_DEBUG



void CStudioMainFrame::OnInitMenu(CMenu* pMenu)
{
   CMDIFrameWnd::OnInitMenu(pMenu);

	// CG: This block added by 'Tip of the Day' component.
	{
		// TODO: This code adds the "Tip of the Day" menu item
		// on the fly.  It may be removed after adding the menu
		// item to all applicable menu items using the resource
		// editor.

		// Add Tip of the Day menu item on the fly!
		static CMenu* pSubMenu = NULL;

		CString strHelp; strHelp.LoadString(CG_IDS_TIPOFTHEDAYHELP);
		CString strMenu;
		int nMenuCount = pMenu->GetMenuItemCount();
		BOOL bFound = FALSE;
		for (int i=0; i < nMenuCount; i++)
		{
			pMenu->GetMenuString(i, strMenu, MF_BYPOSITION);
			if (strMenu == strHelp)
			{
				pSubMenu = pMenu->GetSubMenu(i);
				bFound = TRUE;
				ASSERT(pSubMenu != NULL);
			}
		}

		CString strTipMenu;
		strTipMenu.LoadString(CG_IDS_TIPOFTHEDAYMENU);
		if (!bFound)
		{
			// Help menu is not available. Please add it!
			if (pSubMenu == NULL)
			{
				// The same pop-up menu is shared between mainfrm and frame
				// with the doc.
				static CMenu popUpMenu;
				pSubMenu = &popUpMenu;
				pSubMenu->CreatePopupMenu();
				pSubMenu->InsertMenu(0, MF_STRING|MF_BYPOSITION,
					CG_IDS_TIPOFTHEDAY, strTipMenu);
			}
			pMenu->AppendMenu(MF_STRING|MF_BYPOSITION|MF_ENABLED|MF_POPUP,
				(UINT)pSubMenu->m_hMenu, strHelp);
			DrawMenuBar();
		}
		else
		{
			// Check to see if the Tip of the Day menu has already been added.
			pSubMenu->GetMenuString(0, strMenu, MF_BYPOSITION);

			if (strMenu != strTipMenu)
			{
				// Tip of the Day submenu has not been added to the
				// first position, so add it.
				pSubMenu->InsertMenu(0, MF_BYPOSITION);  // Separator
				pSubMenu->InsertMenu(0, MF_STRING|MF_BYPOSITION,
					CG_IDS_TIPOFTHEDAY, strTipMenu);
			}
		}
	}

}

CWnd* CStudioMainFrame::getFrontMostChild()
{
/*	CMDIChildWnd* f;
	f = MDIGetActive();
	CWnd* p = f->GetActiveFrame();
	p = p->GetTopWindow();
	while (p && !p->IsKindOf(RUNTIME_CLASS(CInputDocView)))
	{
		p = p->GetParent();
	}


	return p;
*/ return NULL;
}


LONG CStudioMainFrame::OnPublishParams(WPARAM wParam, LPARAM lParam)
{
	return handlePublishParamsMessage(wParam, lParam);
}
