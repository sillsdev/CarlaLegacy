// InputDocTabBar.cpp : implementation file
//

/*	this class is probably not needed.  To get rid of it, we
	just need to put the proper message-mapping macro into
	CInputDocView
*/
// jdh 12April2001 can't modify if readonly
// rde270   25-Jun-2002 Add methods to speed up the loading of a file. Basically, if one
//                      clicks on the currently loading tab, it'll reduce the background
//                      loading timer from 200mS to 1mS (or as fast as possible).

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "InputDocTabBar.h"
#include "InputDocView.h"
#include "inputDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CInputDocTabBar

CInputDocTabBar::CInputDocTabBar()
:m_pOwner(NULL)
{
}

CInputDocTabBar::~CInputDocTabBar()
{
}


BEGIN_MESSAGE_MAP(CInputDocTabBar, CTabCtrl)
	//{{AFX_MSG_MAP(CInputDocTabBar)
	ON_NOTIFY_REFLECT(TCN_SELCHANGE, OnSelchange)
	ON_WM_DESTROYCLIPBOARD()
//    ON_EN_CHANGE(kBasePanelID, OnTextChanged)
	//}}AFX_MSG_MAP
	//ON_NOTIFY_EX( TTN_NEEDTEXT, 0, OnToolTip )
#ifndef rde270
	ON_WM_LBUTTONDOWN()
	ON_WM_LBUTTONUP()
#endif  // rde270
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CInputDocTabBar message handlers

void CInputDocTabBar::OnSelchange(NMHDR* pNMHDR, LRESULT* pResult)
{
	ASSERTX(m_pOwner);
	m_pOwner->tabSelected(GetCurSel());

	*pResult = 0;
}

void CInputDocTabBar::setOwner(CInputDocView * pOwner)
{
	m_pOwner= pOwner;
}

//DEL void CInputDocTabBar::OnDestroy()
//DEL {
//DEL 	CTabCtrl::OnDestroy();
//DEL
//DEL 	// TODO: Add your message handler code here
//DEL
//DEL }

void CInputDocTabBar::OnDestroyClipboard()
{
	CTabCtrl::OnDestroyClipboard();

	// TODO: Add your message handler code here

}

//DEL void CInputDocTabBar::OnKillFocus(CWnd* pNewWnd)
//DEL {
//DEL 	CTabCtrl::OnKillFocus(pNewWnd);
//DEL
//DEL 	// TODO: Add your message handler code here
//DEL
//DEL }

//DEL void CInputDocTabBar::ParentNotify(UINT message, LPARAM lParam)
//DEL {
//DEL 	// TODO: Add your message handler code here
//DEL
//DEL }

//DEL void CInputDocTabBar::OnClose()
//DEL {
//DEL 	// TODO: Add your message handler code here and/or call default
//DEL
//DEL 	CTabCtrl::OnClose();
//DEL }

//DEL void CInputDocTabBar::PostNcDestroy()
//DEL {
//DEL 	// TODO: Add your specialized code here and/or call the base class
//DEL
//DEL 	CTabCtrl::PostNcDestroy();
//DEL }

  BOOL CInputDocTabBar::OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult)
  {
	NMHDR* pn = (NMHDR*) lParam;
	if(pn->code ==EN_SAVECLIPBOARD)	// it crashes when this is called
		return TRUE; // pretend we handled it
	else if(pn->code == EN_CHANGE)
		ASSERT(FALSE);// NEVER CALLED even though I've set the even mask properly!
	else if(pn->code == EN_MSGFILTER)
	{
		MSGFILTER* pm = (MSGFILTER*)lParam;
		if(pm->msg == WM_KEYDOWN)
		{
			ASSERT(m_pOwner);
			if(((CInputDoc*)(m_pOwner->GetDocument()))->m_bBaseIsEditable) 		// jdh 12April2001 can't  modify src view if readonly
				m_pOwner->GetDocument()->SetModifiedFlag(TRUE);
			else
				AfxMessageBox(_T("This document was opened as \"Read-only\", meaning you can't make changes to it.  If you want to make changes, you'll need to close this document, make sure the Read-only flag of the file is cleared, and then open it again."));
		}
	}

	return CTabCtrl::OnNotify(wParam, lParam, pResult);
  }


void CInputDocTabBar::OnTextChanged()
{
ASSERT(FALSE); // NEVER CALLED even though I've set the even mask properly!
}


/*BOOL CInputDocTabBar::OnToolTip(UINT id, NMHDR *pTTTStruct, LRESULT *pResult)
{
	TOOLTIPTEXT *pTTT = (TOOLTIPTEXT *)pTTTStruct;
	UINT nID =pTTTStruct->idFrom;
	if (pTTT->uFlags & TTF_IDISHWND)
	{
		// idFrom is actually the HWND of the tool
		nID = ::GetDlgCtrlID((HWND)nID);


		pTTT->lpszText = "tab";//MAKEINTRESOURCE(nID);	// assumes the id has a string id
		pTTT->hinst = AfxGetResourceHandle();
		return TRUE;
	}
	return FALSE;
}
*/
//DEL BOOL CInputDocTabBar::Create(DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID)
//DEL {
//DEL
//DEL 	BOOL b = CTabCtrl::Create(dwStyle, rect, pParentWnd, nID);
//DEL 	EnableToolTips(TRUE);
//DEL 	return b;
//DEL }

#ifndef rde270
void CInputDocTabBar::OnLButtonDown(UINT nFlags, CPoint point)
{
	TRACE(_T("OnLButtonDown\n"));

	m_pOwner->SpeedUpLoadingCurTab();

	CTabCtrl::OnLButtonDown(nFlags, point);
}

void CInputDocTabBar::OnLButtonUp(UINT nFlags, CPoint point)
{
	TRACE(_T("OnLButtonUp\n"));

	m_pOwner->DontSpeedUpLoadingCurTab();

	CTabCtrl::OnLButtonUp(nFlags, point);
}
#endif  // rde270
