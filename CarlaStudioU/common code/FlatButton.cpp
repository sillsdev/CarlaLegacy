// FlatButton.cpp : implementation file
// taken from www.codeguru.com (as CBtnMenu), author  Girish Bharadwaj.

#include "stdafx.h"
#include "FlatButton.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


///////////////////////////////////////////////////////////////////////////
//
BEGIN_MESSAGE_MAP(CSimpleFlatButton, CButton)
//{{AFX_MSG_MAP(CSimpleFlatButton)
ON_WM_ERASEBKGND()
ON_WM_MOUSEMOVE()
ON_MESSAGE(WM_MOUSELEAVE,OnMouseLeave)
//}}AFX_MSG_MAP
END_MESSAGE_MAP()
IMPLEMENT_DYNAMIC(CSimpleFlatButton,CButton)


// this routine uses DrawState to draw the text approriately.
// it automatically centres the text within the button border

void CSimpleFlatButton::DrawText(CDC* pDC, const CRect& rect, LPCTSTR text, UINT state) {
	 // we want transparent text
	 int nBkModeOld = pDC->SetBkMode(TRANSPARENT);
	 // setup text color
	 COLORREF textcol = ::GetSysColor(COLOR_BTNTEXT);
	 COLORREF oldTextColor = pDC->SetTextColor(textcol);
	 // centre the text
	 CSize textSizeClient = pDC->GetTextExtent(text,_tcslen(text));
	 int x = rect.left+(rect.Width()-textSizeClient.cx)/2;
	 int y = rect.top+(rect.Height()-textSizeClient.cy)/2;
	 // draw the text
	 pDC->DrawState(CPoint(x,y), rect.Size(), text,
		  (state & ODS_DISABLED?DSS_DISABLED:DSS_NORMAL), true, 0, (HBRUSH)NULL
		  );
	 // restore dc
	 pDC->SetTextColor(oldTextColor);
	 pDC->SetBkMode(nBkModeOld);
}


// this routine (optionally) draws the borders on the button
// flat buttons use only single->pixel borders, so we cannot use
// DrawFrameControl.

void CSimpleFlatButton::DrawBorders(CDC* pDC, CRect& rect,UINT state) {
	 if (state & ODS_SELECTED) {
		  pDC->Draw3dRect(rect,::GetSysColor(COLOR_3DSHADOW),
							   ::GetSysColor(COLOR_3DHILIGHT));
		  rect.DeflateRect(1,1);
	 } else if (! m_bRaised && ! (state & ODS_FOCUS))
			//|| state & ODS_DISABLED) // jdh added
	 {
		  // no border -> flat look
		  rect.DeflateRect(1,1);
	 } else {

		  pDC->Draw3dRect(rect,::GetSysColor(COLOR_3DHILIGHT),
							   ::GetSysColor(COLOR_3DSHADOW));
		  rect.DeflateRect(1,1);
	 }
	 rect.DeflateRect(1,1);
	 if (state & ODS_SELECTED) {
		  rect.OffsetRect(1,1);    // offset image when pressed
	 }
}


// Here we draw the appropriate parts of the button

void CSimpleFlatButton::Draw(CDC* pDC, const CRect& inrect, UINT state) {
	 CRect rect = inrect;
	 DrawBorders(pDC,rect,state);
	 if(m_nBitmapID==0)
	 {
		 CString text;
		 GetWindowText(text);
		 if (! text.IsEmpty()) {
			  DrawText(pDC,rect,text,state);
		 }
	 }
	 else
	 {		//jdh I grabbed all this code from a different flat button thing in code.guru
		CDC memdc;
		CBitmap bmp;
		CBitmap *poldbmp;

		HBITMAP	hBitmap = 	(HBITMAP) LoadImage (AfxGetInstanceHandle (),
						MAKEINTRESOURCE (m_nBitmapID),
						IMAGE_BITMAP,0,0,
						((m_bRaised|!m_bMonichromeWhenIdle)?LR_DEFAULTCOLOR:LR_MONOCHROME)
							|LR_LOADMAP3DCOLORS|LR_LOADTRANSPARENT );

					bmp.Attach (hBitmap);
	//	bmp.LoadBitmap(m_nBitmapID); //jdh changed to load, which is presumably slower; the above would let me cache it

		BITMAP bitmap;
		bmp.GetBitmap (&bitmap);

		memdc.CreateCompatibleDC( pDC );
		// Select the bitmap into the DC
		poldbmp = memdc.SelectObject( &bmp);
		// Copy (BitBlt) bitmap from memory DC to screen DC
		//pDC -> StretchBlt( rect.left,rect.top,
		//	rect.right-rect.left, rect.bottom -rect.top, &memdc, 0,0, bitmap.bmWidth,bitmap.bmHeight,SRCCOPY );

		// center in the button (all this jdh)
		int left= rect.left + (rect.Width()-bitmap.bmWidth)/2;
		int top= rect.top + (rect.Height()-bitmap.bmHeight)/2;




		pDC -> BitBlt(left,top, bitmap.bmWidth,bitmap.bmHeight, &memdc, 0,0, SRCCOPY);

		memdc.SelectObject( poldbmp );
		bmp.Detach ();
	 }
}

// Overrides
void CSimpleFlatButton::PreSubclassWindow() {
	 SetButtonStyle(GetButtonStyle() | BS_OWNERDRAW | BS_NOTIFY);
}


// we use m_bDrawBackground flag to allow us to
// repaint behind the button before drawing on top

void CSimpleFlatButton::DrawItem(LPDRAWITEMSTRUCT lpDIS) {
	 if (m_bDrawBackground)
	 {
		  m_bDrawBackground = false;
		  // if not redrawing the whole thing,
		  CWnd* pParent = GetParent();
		  CRect rect; GetWindowRect(rect);
		  pParent->ScreenToClient(rect);
		  pParent->InvalidateRect(rect);
		  pParent->UpdateWindow();
	 } else
	 {
		  m_bDrawBackground = true;
		  CDC* pDC = CDC::FromHandle(lpDIS->hDC);
		  ASSERT_VALID(pDC);
		  CRect rectClient = lpDIS->rcItem;
		  Draw(pDC,rectClient,lpDIS->itemState);
	 }
}

// Messages
BOOL CSimpleFlatButton::OnEraseBkgnd(CDC*) {
	 return true;    // we don't do any erasing when owner drawn
}


// the m_bRaised flag inidicates whether or not to
// draw the borders.  If the mouse is over the button
// the borders are drawn.  We use TrackMouseEvent to
// detect when the mouse leaves the button so we can
// turn off the flag

void CSimpleFlatButton::OnMouseMove(UINT, CPoint)
{
	if(this->GetState() & ODS_DISABLED) // jdh added
		return;

	if (! m_bRaised) {
		  // draw with button borders
		  m_bRaised = true;
		  Invalidate();
		  // remember to remove button borders when we leave
		  TRACKMOUSEEVENT trackmouseevent;
		  trackmouseevent.cbSize = sizeof(trackmouseevent);
		  trackmouseevent.dwFlags = TME_LEAVE;
		  trackmouseevent.hwndTrack = GetSafeHwnd();
		  trackmouseevent.dwHoverTime = HOVER_DEFAULT;
		  _TrackMouseEvent(&trackmouseevent);
	 }
}

LONG CSimpleFlatButton::OnMouseLeave(WPARAM, LPARAM) {
	 // remove button borders
	 TRACE(_T("CSimpleFlatButton leave\n"));
	 m_bRaised = false;
	 Invalidate();
	 return 0;
}


void CSimpleFlatButton::SetBitmap(UINT nID)
{
	m_nBitmapID = nID;
}
