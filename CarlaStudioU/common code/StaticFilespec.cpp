/*
 *  StaticFilespec.cpp
 *
 *  CStaticFilespec implementation
 *    A simple class for displaying long filespecs in static text controls
 *
 *  Usage:          See http://www.codeguru.com/controls/cstatic_filespec.shtml
 *  Author:         Ravi Bhavnani
 *  Edit history:   24-Nov-1997   Ravi B    Original creation
 */

#include "stdafx.h"
#include "StaticFilespec.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CStaticFilespec

CStaticFilespec::CStaticFilespec
  (DWORD  dwFormat      /* = DT_LEFT | DT_NOPREFIX | DT_VCENTER */,
   BOOL   bPathEllipsis /* = FALSE */ )
{
  m_bPathEllipsis = bPathEllipsis;
  m_dwFormat = dwFormat;
}

CStaticFilespec::~CStaticFilespec()
{
}

BEGIN_MESSAGE_MAP(CStaticFilespec, CStatic)
	//{{AFX_MSG_MAP(CStaticFilespec)
	ON_WM_PAINT()
	ON_WM_ERASEBKGND()
  ON_MESSAGE( WM_SETTEXT, OnSetText )
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CStaticFilespec message handlers

BOOL CStaticFilespec::OnEraseBkgnd(CDC* pDC)
{
RECT  rectWnd;    // window rectangle

  // Erase background
  GetClientRect (&rectWnd);
  pDC->FillSolidRect (&rectWnd, ::GetSysColor (COLOR_3DFACE));
	return (TRUE);
}

void CStaticFilespec::OnPaint()
{
//	CWnd::OnPaint(); // jdh


CPaintDC		dc (this);            // device context for painting
DWORD       dwFormat;             // text format
RECT				rectWnd;						  // window rectangle
CString			strText;              // window text
CWnd*       pWndParent = NULL;    // parent window

	// Set default font
  pWndParent = GetParent();
  if (pWndParent)
	 dc.SelectObject (pWndParent->GetFont());

	// Draw text
  GetWindowText (strText);
  GetClientRect (&rectWnd);
  dwFormat = m_dwFormat | (m_bPathEllipsis ? DT_PATH_ELLIPSIS : DT_END_ELLIPSIS);
  ::DrawTextEx (dc.m_hDC,
				strText.GetBuffer (0),
				strText.GetLength(),
				&rectWnd,
				dwFormat,
				NULL);
  strText.ReleaseBuffer();

 // CBrush b;
 // b.CreateSolidBrush(RGB(0,0,0) );
 // dc.FrameRect(&rectWnd, &b);

	// Do not call CWnd::OnPaint() for painting messages
}

BOOL CStaticFilespec::OnSetText
  (WPARAM wParam,
   LPARAM lParam)
{
  DefWindowProc (WM_SETTEXT, wParam, lParam);
  Invalidate();
  return (TRUE);
}
