// EditListHeaderCtrl.cpp : implementation file
//

#include "stdafx.h"
#include "GuruHeaderCtrl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CGuruHeaderCtrl

CGuruHeaderCtrl::CGuruHeaderCtrl()
{
		m_nSortCol = -1;
}

CGuruHeaderCtrl::~CGuruHeaderCtrl()
{
}


BEGIN_MESSAGE_MAP(CGuruHeaderCtrl, CHeaderCtrl)
	//{{AFX_MSG_MAP(CGuruHeaderCtrl)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CGuruHeaderCtrl message handlers

// from zafir's article in www.codeguru.com
int CGuruHeaderCtrl::SetSortImage(int nCol, int eImageStyle)
{
	int nPrevCol = m_nSortCol;

	m_nSortCol = nCol;
	m_eImageStyle = eImageStyle;

	// Change the item to ownder drawn
	HD_ITEM hditem;

	hditem.mask = HDI_FORMAT;
	GetItem( nCol, &hditem );
	hditem.fmt |= HDF_OWNERDRAW;
	SetItem( nCol, &hditem );

	// Invalidate header control so that it gets redrawn
	Invalidate();
	return nPrevCol;
}




void CGuruHeaderCtrl::DrawItem( LPDRAWITEMSTRUCT lpDrawItemStruct )
{
	CDC dc;

	dc.Attach( lpDrawItemStruct->hDC );

	// Get the column rect
	CRect rcLabel( lpDrawItemStruct->rcItem );

	// Save DC
	int nSavedDC = dc.SaveDC();

	// Set clipping region to limit drawing within column
	CRgn rgn;
	rgn.CreateRectRgnIndirect( &rcLabel );
	dc.SelectObject( &rgn );
	rgn.DeleteObject();

		// Draw the background
		dc.FillRect(rcLabel, &CBrush(::GetSysColor(COLOR_3DFACE)));

	// Labels are offset by a certain amount
	// This offset is related to the width of a space character
	int offset = dc.GetTextExtent(_T(" "), 1 ).cx*2;


	// Get the column text and format
	TCHAR buf[256];
	HD_ITEM hditem;

	hditem.mask = HDI_TEXT | HDI_FORMAT;
	hditem.pszText = buf;
	hditem.cchTextMax = 255;

	GetItem( lpDrawItemStruct->itemID, &hditem );

	// Determine format for drawing column label
	UINT uFormat = DT_SINGLELINE | DT_NOPREFIX | DT_NOCLIP
						| DT_VCENTER | DT_END_ELLIPSIS ;

	if( hditem.fmt & HDF_CENTER)
		uFormat |= DT_CENTER;
	else if( hditem.fmt & HDF_RIGHT)
		uFormat |= DT_RIGHT;
	else
		uFormat |= DT_LEFT;

	// Adjust the rect if the mouse button is pressed on it
	if( lpDrawItemStruct->itemState == ODS_SELECTED )
	{
		rcLabel.left++;
		rcLabel.top += 2;
		rcLabel.right++;
	}

	// Adjust the rect further if Sort arrow is to be displayed
	if( lpDrawItemStruct->itemID == (UINT)m_nSortCol )
	{
		rcLabel.right -= 3 * offset;
	}

	rcLabel.left += offset;
	rcLabel.right -= offset;

	// Draw column label
	if( rcLabel.left < rcLabel.right )
		dc.DrawText(buf,-1,rcLabel, uFormat);

	// Draw the Sort arrow
	if( lpDrawItemStruct->itemID == (UINT)m_nSortCol )
	{
		CRect rcIcon( lpDrawItemStruct->rcItem );

		// Set up pens to use for drawing the triangle
		CPen penLight(PS_SOLID, 1, GetSysColor(COLOR_3DHILIGHT));
		CPen penShadow(PS_SOLID, 1, GetSysColor(COLOR_3DSHADOW));
		CPen *pOldPen = dc.SelectObject( &penLight );

		switch( m_eImageStyle )
		{
		case kDown:
			// Draw triangle pointing upwards
			dc.MoveTo( rcIcon.right - 2*offset, offset-1);
			dc.LineTo( rcIcon.right - 3*offset/2, rcIcon.bottom - offset );
			dc.LineTo( rcIcon.right - 5*offset/2-2, rcIcon.bottom - offset );
			dc.MoveTo( rcIcon.right - 5*offset/2-1, rcIcon.bottom - offset-1 );

			dc.SelectObject( &penShadow );
			dc.LineTo( rcIcon.right - 2*offset, offset-2);
			break;
		case kUp:
			// Draw triangle pointing downwords
			dc.MoveTo( rcIcon.right - 3*offset/2, offset-1);
			dc.LineTo( rcIcon.right - 2*offset-1, rcIcon.bottom - offset + 1 );
			dc.MoveTo( rcIcon.right - 2*offset-1, rcIcon.bottom - offset );

			dc.SelectObject( &penShadow );
			dc.LineTo( rcIcon.right - 5*offset/2-1, offset -1 );
			dc.LineTo( rcIcon.right - 3*offset/2, offset -1);
			break;
		case kLeft:
			// Draw triangle pointing left
			dc.MoveTo(rcIcon.right -3*offset/2,  offset-2 );
			dc.LineTo(  rcIcon.right -3*offset/2 , rcIcon.bottom-offset-1 );
			dc.SelectObject( &penShadow );
			dc.MoveTo(rcIcon.right -3*offset/2,  offset-2 );
			dc.LineTo(  rcIcon.right -5*offset/2, rcIcon.bottom - 3*offset/2);//the point
			dc.LineTo(  rcIcon.right -3*offset/2 +1, rcIcon.bottom-offset );
			break;

		case kRight:
			// Draw triangle pointing right
			dc.MoveTo(rcIcon.right -5*offset/2,  rcIcon.bottom-offset-1);
			dc.LineTo(rcIcon.right -3*offset/2  , rcIcon.bottom - 3*offset/2-1);//the point
			dc.SelectObject( &penShadow );
			dc.LineTo(rcIcon.right -5*offset/2  , offset-2);//the point
			dc.LineTo(  rcIcon.right -5*offset/2, rcIcon.bottom-offset );
			break;
		}

		// Restore the pen
		dc.SelectObject( pOldPen );
	}

	// Restore dc
	dc.RestoreDC( nSavedDC );

	// Detach the dc before returning
	dc.Detach();
}

BOOL CGuruHeaderCtrl::Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext)
{
	// TODO: Add your specialized code here and/or call the base class

	return CWnd::Create(lpszClassName, lpszWindowName, dwStyle, rect, pParentWnd, nID, pContext);
}
