
/////////////////////////////////////////////////////////////////
// LongOperation.cpp// (c) 1997, Klaus Gütter#include "stdafx.h"
#include "stdafx.h"
#include <afxpriv.h> // defines WM_SETMESSAGESTRING
//#include "..\resource.h"
#include "SimpleProgressBar.h"
#include <afxcmn.h>

#ifdef _DEBUG
#undef THIS_FILE
#define new DEBUG_NEW
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/*CSimpleProgressBar::CSimpleProgressBar(UINT nIDText, bool bStart):	m_bStarted(false)
,	m_hwndProgress(NULL){	VERIFY(m_strText.LoadString(nIDText));	if (bStart)
		Start();}
*/
CSimpleProgressBar::CSimpleProgressBar(LPCTSTR lpszText, bool bStart)
:	m_strText(lpszText),	m_bStarted(false),	m_hwndProgress(NULL)
{	if (bStart)
		Start();
}


CSimpleProgressBar::~CSimpleProgressBar()
{
	if (m_bStarted)		Stop();
}
void CSimpleProgressBar::Start()
{	if (m_bStarted)		Stop();
	// display text in the status bar
	CWnd* pMainWnd = ::AfxGetMainWnd();
	if (pMainWnd)
		pMainWnd->SendMessage(WM_SETMESSAGESTRING, 0, (LPARAM)(LPCTSTR)m_strText);
	// switch on wait cursor
	::AfxGetApp()->BeginWaitCursor();	m_bStarted = true;
}

void CSimpleProgressBar::Stop()
{	if (!m_bStarted)
		return;
	if (m_hwndProgress)
	{
		// clean up and destroy progress bar
		CStatusBar* pStatusBar = DYNAMIC_DOWNCAST(CStatusBar, CWnd::FromHandle(::GetParent(m_hwndProgress)));
		ASSERT_VALID(pStatusBar);		::DestroyWindow(m_hwndProgress);
		m_hwndProgress = NULL;		// remove progress bar pane
		int anPart[32];
		int nParts = pStatusBar->GetStatusBarCtrl().GetParts(31, anPart);
		nParts--;
		pStatusBar->GetStatusBarCtrl().SetParts(nParts, anPart+1);
	}
	// switch back to standard text in the status bar
	CWnd* pMainWnd = ::AfxGetMainWnd();
	if (pMainWnd)
		pMainWnd->SendMessage(WM_SETMESSAGESTRING, AFX_IDS_IDLEMESSAGE, 0);
	// switch off wait cursor
	::AfxGetApp()->EndWaitCursor();
	m_bStarted = false;
}

void CSimpleProgressBar::Step(int nPercentage)
{
	if (!m_bStarted)
		Start();
	::AfxGetApp()->RestoreWaitCursor();
	if (nPercentage >= 0)
	{
		m_nPercentage = nPercentage;
		ASSERT(nPercentage <= 100);
		// create or update a progress control in the status bar
		if (m_hwndProgress == NULL)
			CreateProgressControl();
		if (m_hwndProgress)
			::SendMessage(m_hwndProgress, PBM_SETPOS, (WPARAM)nPercentage, 0);
	}
}

#include < stdarg.h >
// jdh from codeguru articel : StatusBarMessage()
//	by Keith Rule -- keithr@europa.com
void CSimpleProgressBar::SetTextEx(char* fmt, ...)
{
	if (AfxGetApp() != NULL && AfxGetApp()->m_pMainWnd != NULL)
	{
		char buffer[256];
		CStatusBar* pStatus = (CStatusBar*)
		AfxGetApp()->m_pMainWnd->GetDescendantWindow(AFX_IDW_STATUS_BAR);
		va_list argptr;
		va_start(argptr, fmt);
		vsprintf(buffer, fmt, argptr);
		va_end(argptr);
		if (pStatus != NULL)
		{
			pStatus->SetPaneText(0, buffer);
			pStatus->UpdateWindow();
		}
	}
}

void CSimpleProgressBar::SetText(LPCTSTR lpszText){	m_strText = lpszText;
	CWnd* pMainWnd = ::AfxGetMainWnd();	if (pMainWnd)
		pMainWnd->SendMessage(WM_SETMESSAGESTRING, 0, (LPARAM)(LPCTSTR)m_strText);}

void CSimpleProgressBar::CreateProgressControl(){	ASSERT(m_hwndProgress == NULL);
	// find status bar
CWnd* pMainWnd = ::AfxGetMainWnd();	if (pMainWnd == NULL)
		return;	CStatusBar* pStatusBar = DYNAMIC_DOWNCAST(CStatusBar,
		pMainWnd->GetDescendantWindow(AFX_IDW_STATUS_BAR, TRUE));
	if (pStatusBar == NULL || pStatusBar->m_hWnd == NULL)		return;
	CRect rc; // this will be the location for the progress bar pane
	pStatusBar->GetItemRect(0, rc);	if (!m_strText.IsEmpty())	{
		// adjust so that the text in the leftmost pane will not be covered
		CClientDC dc(pStatusBar);		dc.SelectObject(pStatusBar->GetFont());
		CSize sz = dc.GetTextExtent(m_strText);		TEXTMETRIC tm;
		dc.GetTextMetrics(&tm);		rc.left += sz.cx + 2*tm.tmAveCharWidth;	}
	int cx = rc.Width();	if (cx < 20)	{
		// no sense in displaying such a small progress bar
		TRACE0("ProgressDisplay would be too small\n");		return;	}	else if (cx > 200)
	{		// arbitrarily limiting progress bar width to 200 pixel
			cx = 200;
		rc.left = rc.right - cx;	}
	// add a pane between the text and the currently leftmost pane
		int anPart[32];
	int nParts = pStatusBar->GetStatusBarCtrl().GetParts(31, anPart+1);
	anPart[0] = rc.left;	nParts++;
	pStatusBar->GetStatusBarCtrl().SetParts(nParts, anPart);
	pStatusBar->GetStatusBarCtrl().GetRect(1, rc);	// create progress bar control
	m_hwndProgress = ::CreateWindow(PROGRESS_CLASS, "",
		WS_CHILD | WS_VISIBLE, rc.left, rc.top, rc.Width(), rc.Height(),
		pStatusBar->m_hWnd, (HMENU)1, AfxGetInstanceHandle(), NULL);
		pStatusBar->UpdateWindow();}