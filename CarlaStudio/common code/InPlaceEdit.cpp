
#include "stdafx.h"
#include "InPlaceEdit.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define COVER_CLICK_BUG	// There is a bug, probably not with this class, where in CStudio (but not MX)

/////////////////////////////////////////////////////////////////////////////
// CInPlaceEdit
// mostly from Zafir's www.codeguru article on in-place editing
//	I added Rex Myer's multi-line edit ability, also from www.codeguru
// This is used by CEditListCtrl

// pFont should be NULL instead of giving us a temporary.  If it is
// null, the parent window's font will be used
CInPlaceEdit::CInPlaceEdit(int iItem, int iSubItem, CString sInitText, CFont* pFont)
:	m_sInitText( sInitText ),
	m_pFont(pFont)
{
	m_iItem = iItem;
	m_iSubItem = iSubItem;
	m_bESC = FALSE;
}

CInPlaceEdit::~CInPlaceEdit()
{
}


BEGIN_MESSAGE_MAP(CInPlaceEdit, CEdit)
	//{{AFX_MSG_MAP(CInPlaceEdit)
	ON_WM_KILLFOCUS()
	ON_WM_NCDESTROY()
	ON_WM_CHAR()
	ON_WM_CREATE()
	ON_WM_LBUTTONDOWN()
	ON_WM_LBUTTONUP()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CInPlaceEdit message handlers

BOOL CInPlaceEdit::PreTranslateMessage(MSG* pMsg)
{
	if( pMsg->message == WM_KEYDOWN )
	{
		if(pMsg->wParam == VK_TAB)
		{
			OnTabKey();
			return TRUE;
		}
		if(pMsg->wParam == VK_RETURN)
		{
			OnKillFocus(NULL);
			return TRUE;
		}
		if(0//pMsg->wParam == VK_RETURN
				|| pMsg->wParam == VK_DELETE
				|| pMsg->wParam == VK_ESCAPE
				|| GetKeyState( VK_CONTROL)
				)
		{
			::TranslateMessage(pMsg);
			::DispatchMessage(pMsg);
			return TRUE;		    	// DO NOT process further
		}
	}

	return CEdit::PreTranslateMessage(pMsg);
}


void CInPlaceEdit::OnKillFocus(CWnd* pNewWnd)
{
	#ifdef COVER_CLICK_BUG	// There is a bug, probably not with this class, where in  CStudio CListView (but not dialogs or in MX)
		ReleaseCapture();
	#endif
	CEdit::OnKillFocus(pNewWnd);

	CString str;
	GetWindowText(str);

	// Send Notification to parent of ListView ctrl
	LV_DISPINFO dispinfo;
	dispinfo.hdr.hwndFrom = GetParent()->m_hWnd;
	dispinfo.hdr.idFrom = GetDlgCtrlID();
	dispinfo.hdr.code = LVN_ENDLABELEDIT;

	dispinfo.item.mask = LVIF_TEXT;
	dispinfo.item.iItem = m_iItem;
	dispinfo.item.iSubItem = m_iSubItem;
	dispinfo.item.pszText = m_bESC ? NULL : LPTSTR((LPCTSTR)str);
	dispinfo.item.cchTextMax = str.GetLength();
	dispinfo.item.lParam = 0;

	GetParent()->GetParent()->SendMessage( WM_NOTIFY, GetParent()->GetDlgCtrlID(),
					(LPARAM)&dispinfo );

	DestroyWindow();
}

void CInPlaceEdit::OnNcDestroy()
{
	CEdit::OnNcDestroy();

	delete this;
}



void CInPlaceEdit::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	if( nChar == VK_ESCAPE || nChar == VK_RETURN)
	{
		if( nChar == VK_ESCAPE )
			m_bESC = TRUE;
		GetParent()->SetFocus();
		return;
	}


	CEdit::OnChar(nChar, nRepCnt, nFlags);

	// Resize edit control if needed

	// Get text extent
	CString str;

	GetWindowText( str );
	CWindowDC dc(this);
	CFont *pFont = GetParent()->GetFont();
	CFont *pFontDC = dc.SelectObject( pFont );
	CSize size = dc.GetTextExtent( str );
	dc.SelectObject( pFontDC );
	size.cx += 5;			   	// add some extra buffer

	// Get client rect
	CRect rect, parentrect;
	GetClientRect( &rect );
	GetParent()->GetClientRect( &parentrect );

	// Transform rect to parent coordinates
	ClientToScreen( &rect );
	GetParent()->ScreenToClient( &rect );

	// Check whether control needs to be resized
	// and whether there is space to grow
	if( size.cx > rect.Width() )
	{
		if( size.cx + rect.left < parentrect.right )
			rect.right = rect.left + size.cx;
		else
			rect.right = parentrect.right;
		MoveWindow( &rect );
	}
}

int CInPlaceEdit::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CEdit::OnCreate(lpCreateStruct) == -1)
		return -1;

#ifdef COVER_CLICK_BUG	// There is a bug, probably not with this class, where in  CStudio CListView (but not dialogs or in MX)
	SetCapture();
#endif

	// Set the proper font
	if(m_pFont)
		SetFont(m_pFont);
	else
	{
		CFont* font = GetParent()->GetFont();
		SetFont(font);
	}

	SetWindowText( m_sInitText );
	SetFocus();
	CalculateSize();
	SetSel( 0, 0); // this would be select all --> -1 );
	return 0;
}


void CInPlaceEdit::OnLButtonUp(UINT nFlags, CPoint point)
{
#ifdef COVER_CLICK_BUG	// There is a bug, probably not with this class, where in CStudio (but not MX)
	CRect r;
	GetRect(&r);
	if(r.PtInRect(point))
	{
		CEdit::OnLButtonUp(nFlags, point);
		SetCapture();
	}
#else
		CEdit::OnLButtonUp(nFlags, point);
#endif
}

void CInPlaceEdit::OnLButtonDown(UINT nFlags, CPoint point)
{
#ifdef COVER_CLICK_BUG	// There is a bug, probably not with this class, where in CStudio (but not MX)
	// this never gets called; instead, and clicks cause the edit to loose focus and die

	CRect r;
	GetRect(&r);
	if(r.PtInRect(point))
	{
		CEdit::OnLButtonDown(nFlags, point);
	//	SetCapture();
					// note: this makes selecting with the mouse not work
					// but if I remove it, then you only get one click
					// solution: put it at the end of OnLButtUp() instead
	}
	else // part of hack to cover premature killfocus bug
	{
		ReleaseCapture();
		// doesn't work ::PostMessage(NULL, WM_KILLFOCUS, (WPARAM)this->m_hWnd, NULL);

		//doesn't work ::PostMessage(NULL, WM_LBUTTONDOWN, point.x, point.y);
		OnKillFocus(NULL);
	}
#else
	CEdit::OnLButtonDown(nFlags, point);
#endif
}


// copied verbatim from Rex Myer's codeguru article
void CInPlaceEdit::CalculateSize()
{	// Get text extent
	CString str;
	GetWindowText( str );
	CWindowDC dc(this);
	CFont *pFont = GetParent()->GetFont();
	CFont *pFontDC = dc.SelectObject( pFont );
	CSize size;
	// Get client clientRect
	CRect clientRect, parentrect;
	GetClientRect( &clientRect );
	GetParent()->GetClientRect( &parentrect );
	// Transform clientRect to parent coordinates
	ClientToScreen( &clientRect );
	GetParent()->ScreenToClient( &clientRect );
	if( !(GetStyle() & ES_MULTILINE ) )
	{
		size = dc.GetTextExtent( str );
		dc.SelectObject( pFontDC );
		size.cx += 5;                       // add some extra buffer
	}	else
	{
		CRect thinrect( clientRect );  // To measure the skinniest text box
		CRect widerect( clientRect );  // To measure the wides text box
		widerect.right = parentrect.right;

		// Use the shortest of the two box sizes.
		int thinheight = dc.DrawText( str, &thinrect, DT_CALCRECT|DT_NOPREFIX|DT_LEFT|DT_EXPANDTABS|DT_WORDBREAK );
		int wideheight = dc.DrawText( str, &widerect, DT_CALCRECT|DT_NOPREFIX|DT_LEFT|DT_EXPANDTABS|DT_WORDBREAK );
		if( thinheight >= wideheight )
		{
			size.cy = wideheight + 5;
			size.cx = widerect.right - widerect.left + 5;
		}
		else
		{
			size.cy = thinheight + 5;
			size.cx = thinrect.right - thinrect.left + 5;
		}
	}
	// Check whether control needs to be resized
	// and whether there is space to grow
	int changed = 0;
	if( size.cx > clientRect.Width() )
	{
		if( size.cx + clientRect.left < parentrect.right-2 )
			clientRect.right = clientRect.left + size.cx;
		else
			clientRect.right = parentrect.right-2;
		changed = 1;
	}

	size.cy += 3 ; // jdh added to show underscores more clearly (and more often) Seems to help a little

	if( size.cy > clientRect.Height() )
	{
		if( size.cy + clientRect.top < parentrect.bottom-2 )
			clientRect.bottom = clientRect.top + size.cy;
		else
		{
			clientRect.bottom = parentrect.bottom-2;
			ShowScrollBar( SB_VERT );
		}
		changed = 1;
	}
		// If the size became larger rposition the window.
	if( changed )
		MoveWindow( &clientRect );
}


//DEL void CInPlaceEdit::buttonDown(CPoint pt)
//DEL {
//DEL OnLButtonDown(NULL, pt);
//DEL }

//DEL void CInPlaceEdit::OnKillfocusReflect()
//DEL {
//DEL 	// TODO: Add your control notification handler code here
//DEL 	ASSERT(FALSE);
//DEL }

// this isn't a real message, of course.  We call this ourselves.
void CInPlaceEdit::OnTabKey()
{
	//#ifdef COVER_CLICK_BUG	// There is a bug, probably not with this class, where in CStudio (but not MX)

	// this line is different from OnKillFocus()
	CEdit::OnKillFocus(NULL);

	CString str;
	GetWindowText(str);

	// Send Notification to parent of ListView ctrl
	LV_DISPINFO dispinfo;
	dispinfo.hdr.hwndFrom = GetParent()->m_hWnd;
	dispinfo.hdr.idFrom = GetDlgCtrlID();
	dispinfo.hdr.code = LVN_ENDLABELEDIT;

	dispinfo.item.mask = LVIF_TEXT;
	dispinfo.item.iItem = m_iItem;
	dispinfo.item.iSubItem = m_iSubItem;
	dispinfo.item.pszText = m_bESC ? NULL : LPTSTR((LPCTSTR)str);
	dispinfo.item.cchTextMax = str.GetLength();

	// this line is different from OnKillFocus()
	dispinfo.item.lParam = VK_TAB; // signal a tab

	int id = GetParent()->GetDlgCtrlID();
	CWnd* par = GetParent()->GetParent();
	DestroyWindow();
	par->SendMessage(WM_NOTIFY, id, (LPARAM)&dispinfo );
	//	destroyed so can't get parent GetParent()->GetParent()->SendMessage( WM_NOTIFY, GetParent()->GetDlgCtrlID(),
	//				(LPARAM)&dispinfo );

//	DestroyWindow();
}
