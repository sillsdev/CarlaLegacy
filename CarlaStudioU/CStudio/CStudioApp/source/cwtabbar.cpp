// WTabBar.cpp : implementation file
//
// jdh 2/8/00 Fixed bug where trying to find/replace lead to crash when there was no active data window
// rde270 25-Jun-2002   changed retrieveData to return a BOOL so we can indicate whether the
//                      data was retrieved successfully. It won't, for example, if what the
//                      user enters for a field which is a CWChar turns out to be longer than
//                      a 'char'. This returned false will prevent the tab from switching.
#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "CWTabBar.h"
#include "CWInterface.h"
#include "TabbedTreeDoc.h"
#include "CWTopicTreeView.h"
#include "CWFormView.h"
#include "CWTopic.h"
#include "CWListView.h"
#include "CWHeadingView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

CWTopic* gTopicForViewCreation = 0; // here 'cause SPLITTER:CreateView doesn't let us pass any parameters to the constructor of the view
extern CString gsFindWhat;
extern DWORD gdwFindFlags;

#define RTRACE(x) AfxMessageBox(x)

/////////////////////////////////////////////////////////////////////////////
// CWTabBar

IMPLEMENT_DYNCREATE(CWTabBar, CView)

CWTabBar::CWTabBar()
:m_pLastTab(NULL), m_pCurrentTopic(NULL)

{
	m_iLastSelectedTab = 0;
}

CWTabBar::~CWTabBar()
{
}


BEGIN_MESSAGE_MAP(CWTabBar, CView)
	//{{AFX_MSG_MAP(CWTabBar)
	ON_WM_SIZE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CWTabBar diagnostics

#ifdef _DEBUG
void CWTabBar::AssertValid() const
{
	CView::AssertValid();
}

void CWTabBar::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CWTabBar message handlers

void CWTabBar::OnInitialUpdate()
{
//RTRACE("TabBar OnInitialUpdate\n"); //!!
	populate();

}

void CWTabBar::populate()
{
	m_tabCtrl.DeleteAllItems();
	CTabbedTreeDoc* pDoc = (CTabbedTreeDoc*) GetDocument();
	TopicTabArray* pTabs = pDoc->GetCurrentInterface()->GetTopicTabArray();
	ASSERTX(pTabs);

	TC_ITEM tie;
	tie.mask = TCIF_TEXT ;

	for (int i =0; i< pTabs->GetSize(); i++)
	{
		tie.pszText = (LPTSTR) LPCTSTR ( (*pTabs)[i]->m_label );
		if (-1 == m_tabCtrl.InsertItem(i, &tie ))
		{
			ASSERTX(FALSE);
		}
	}
}

BOOL CWTabBar::OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult)
{
//	TRACE("CWTabBar OnNotify\n");
	int iSel = m_tabCtrl.GetCurSel();
	if(iSel != m_iLastSelectedTab)
	{
		m_iLastSelectedTab = iSel;
		CTabbedTreeDoc *pDoc = (CTabbedTreeDoc*) GetDocument();
		pDoc->GetCurrentInterface()->SetCurrentTabInt(iSel);

		return 1;
	}
	else return CView::OnNotify(wParam, lParam, pResult);
}

void CWTabBar::OnSize(UINT nType, int cx, int cy)
{
	CView::OnSize(nType, cx, cy);

	if(m_tabCtrl.m_hWnd)
	{	m_tabCtrl.MoveWindow(0, 0, cx, cy);
		//#define kBorder 1
		#define kTopBorder 5
		#define kTabHeight 20
		m_wndSplitter.MoveWindow(
			0,
			(kTabHeight + kTopBorder),
			cx-(0),
			cy-(kTabHeight + kTopBorder));
	}
}

BOOL CWTabBar::Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext)
{
	BOOL ok =  CWnd::Create(lpszClassName, lpszWindowName, dwStyle, rect, pParentWnd, nID, pContext);
	if(!ok)
		return FALSE;

	CView::OnInitialUpdate();
	CRect r;
	GetClientRect(&r);


	 ok	 = m_tabCtrl.Create(TVS_SHOWSELALWAYS| WS_CHILD | WS_CLIPSIBLINGS | WS_VISIBLE,
		r, this, NULL );

	if(!ok)
		return FALSE;


	if(!m_wndSplitter.CreateStatic (&m_tabCtrl,1,2,WS_CHILD))
	{
		TRACE0("Failed to main CreateStaticSplitter\n");
		return FALSE;
	}

		// Calculate the size of the splitter panes
	SIZE	size;

	size.cx = kTREEWIDTH; //(rect.right - m_wndSplitterInner.GetSplitterWidth())/2;
	size.cy = rect.bottom - kTabBarHeight;

	//set the views
	ok = m_wndSplitter.CreateView(0,0,RUNTIME_CLASS(CWTopicTreeView), size,
		pContext);

	if(!ok)
		return FALSE;
	size.cx = (rect.right - m_wndSplitter.GetSplitterWidth()) - 80;

	ok = m_wndSplitter.CreateView(0,1,RUNTIME_CLASS(CWFormView), size,
		pContext);

	if(!ok)
		return FALSE;

//	SetActiveView((CView *)m_wndSplitter.GetPane(0,1));

	//show the splitter
	m_wndSplitter.ShowWindow(SW_SHOWNORMAL);
	m_wndSplitter.UpdateWindow();

	return ok;
}

#ifndef rde270
// This call can now fail (e.g. if the user tries to put what resolves to a multi-byte
//  UTF-8 sequence (i.e. non-Ascii) into a CWChar).
BOOL CWTabBar::retrieveData()
#else
void CWTabBar::retrieveData()
#endif
{
	// send this on to the form view
	CWnd *pWnd = getContentView();

#ifndef rde270
	try
	{
#endif
		// could also be a heading view or a list view
		if(pWnd->IsKindOf(RUNTIME_CLASS(CWFormView)))
			((CWFormView*)pWnd)->retrieveData();
		else if (pWnd->IsKindOf(RUNTIME_CLASS(CWListView)))
			((CWListView*)pWnd)->retrieveHeaderParams();
#ifndef rde270
	}
	catch(CUserException e)
	{
		// if any of the data are invalid (i.e. so far, a CWChar that is more than 1 char),
		//  then we return false (to prevent the UI from changing topics).
		return false;
	}
#endif

	return true;
}
/*
void CWTabBar::topicTabChanged()
{
	// inform our tree view
	getTopicTree()->TopicTabChanged();
}
*/

void CWTabBar::OnDraw(CDC* pDC)
{
	// this is a pure virtual function, so we can't get rid of it,
	// but we don't need to do anything in it either
}

CView* CWTabBar::getContentView()
{
	CView* pV = (CView*)m_wndSplitter.GetPane(0,1);
	ASSERTX(pV->IsKindOf(RUNTIME_CLASS(CView)));
	return pV;
}

CWTopicTreeView* CWTabBar::getTopicTree()
{
	CWnd* pV = m_wndSplitter.GetPane(0,0);
	ASSERTX(pV->IsKindOf(RUNTIME_CLASS(CWTopicTreeView)));
	return (CWTopicTreeView*)pV;
}

void CWTabBar::topicChanged(CWTopic * pNewTopic)
{
	ASSERTX(pNewTopic->IsKindOf(RUNTIME_CLASS(CWTopic)));

//RTRACE("TabBar topicChanged 1\n"); //!!
#ifndef rde270
	// don't continue if this fails (it means the user entered a bad value).
	if( !retrieveData() )
		return;
#else   // rde270
	retrieveData();
#endif  // rde270

	// did just the topic (tree selection) change, or did
	// the user change to a whole new topic tab (click on the tab bar)?
	if (!m_pLastTab || pNewTopic->GetOwningTab() != m_pLastTab)
	{
		m_pLastTab = pNewTopic->GetOwningTab();
		getTopicTree()->TopicTabChanged();
	}


	SIZE	size;
	CRect	rect;
	GetClientRect(&rect);

	size.cx = kTREEWIDTH; //(rect.right - m_wndSplitterInner.GetSplitterWidth())/2;
	size.cy = rect.bottom;

	gTopicForViewCreation = pNewTopic; // use global because we can't send this information directly to the cformview constructor

	if(pNewTopic->IsKindOf(RUNTIME_CLASS(CWFormTopic)))
	{
///(" replacing form view...\n"); //!!
		m_wndSplitter.ReplaceView(0,1, RUNTIME_CLASS(CWFormView), size);
//RTRACE(" after replacing form view...\n"); //!!
	}
	else if (pNewTopic->IsKindOf(RUNTIME_CLASS(CWListTopic)))
	{	m_wndSplitter.ReplaceView(0,1, RUNTIME_CLASS(CWListView), size);
		// the following is a hack; it appears that the list
		// gets drawn, then everything but the header is deleted,
		// with the background color.  This causes it to be
		// redrawn yet again
		// Also, I note that when the list is drawn, the whole
		// Win95 screen is redrawn, which is a visiable flicker
		// even on my 233Mhz machine.
		getContentView()->Invalidate(FALSE);
	}
	else if (pNewTopic->IsKindOf(RUNTIME_CLASS(CWHeadingTopic)))
		m_wndSplitter.ReplaceView(0,1, RUNTIME_CLASS(CWHeadingView), size);
	else
		ASSERTX(FALSE);	// unhandled topic type

	// we want the focus to be on the data, not the topic tree
//	GetParentFrame()->SetActiveView((CView*)getContentView());
//	getContentView()->SetFocus();
	gTopicForViewCreation = NULL;
}

LONG CWTabBar::doFindReplace(FINDREPLACE * pFRStruct)
{
	// send this on to the form view
	CWnd *pWnd = getContentView();
	gsFindWhat = pFRStruct->lpstrFindWhat;	// save for next time
	gdwFindFlags = pFRStruct->Flags;		// save for next time or F3

	// could also be a heading view or a list view
	if(pWnd->IsKindOf(RUNTIME_CLASS(CWFormView)))
		return ((CWFormView*)pWnd)->doFindReplace(pFRStruct);
	else if (pWnd->IsKindOf(RUNTIME_CLASS(CWListView)))
		return ((CWListView*)pWnd)->doFindReplace(pFRStruct);

	return 0;
}

// called by CTabbedTreeView::switchViewFocus which is called from
// tabbedTreeView::OnKeyDown when the user wants
// to switch over from the tree to the content

void CWTabBar::switchViewFocus(BOOL bToContent)
{
	if(bToContent)
	{
		GetParentFrame()->SetActiveView((CView*)getContentView());
		getContentView()->SetFocus();
	}
	else	// as of this writing, there is no method for the user to actually invoke this switching back to the tree view (couldn't think of a good key combination)
	{
		GetParentFrame()->SetActiveView((CView*)getTopicTree());
		getTopicTree()->SetFocus();
	}
}

#include "DlgFind.h"

CFindReplaceDialog* CWTabBar::getFindDlg()
{
	CFindReplaceDialog* pD=NULL;

	// send this on to the form view
	CWnd *pWnd = getContentView();


	if(pWnd->IsKindOf(RUNTIME_CLASS(CWFormView)))
		pD = new CFindReplaceDialog();
	else if (pWnd->IsKindOf(RUNTIME_CLASS(CWListView)))
	{
		CWListView* pLV = (CWListView*) pWnd;
		pD = new CDlgFind(pLV->getLangDisplayInfo());
	}
	// jdh 2/8/00
	// Shame shame shame!  added this !missing! else statement, which
	//  is triggered when the focus is on a window that doesn't support
	//  search/replace
	else
	{
		AfxMessageBox(_T("Sorry, you must first click in a list of data, then trying finding again."));
		return NULL;
	}

	pD->Create(TRUE, gsFindWhat,
		NULL, //replace with
		FR_HIDEWHOLEWORD|FR_HIDEUPDOWN|gdwFindFlags, // flags
		GetParent()); // <---- that might be wrong!!!!!!!!!!!!!

	return pD;
}
