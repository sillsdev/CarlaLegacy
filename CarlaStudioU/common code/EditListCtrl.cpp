// EditListCtrl.cpp
// Mangaged by	John Hatton
//		If you fix bugs or add features to this, please send them to me.
// Portions gathered from www.Codeguru.com, starting with article by Zafir Anjum
// Partial List of features
//		All columns are editable
//		Drag and drop (controllable by flag)
//		Sorting (controllable by flag)
//		Sort Icon in Header, using GuruHeaderCtrl
//		Highlighting of the whole row (controllable by flag)
//		Intercept standard keys to open, or delete items
//		Owner Drawn
//	Use:  This class assumes that you will subclass it.  Many methods are just stubs,
//			which are called at the right time (which is the tricky thing in MFC).
//		If Create() isn't called (as it doesn't seem to be when inside dialogs),
//			call finishCreate() in the dialog's InitDialog() method.
//	Uses:	CGuruHeaderCtrl, CGuruColumn, CInPlaceEdit
// 2.4.1 20-Oct-2000 hab Do not do in-place edit on comments and test data

#include "stdafx.h"
#include "EditListCtrl.h"
#include "InPlaceEdit.h"
#include <math.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

const IDC_IPEDIT= 4000; // arbitrary
IMPLEMENT_DYNAMIC(CEditListCtrl, CListCtrl);

#ifndef ListView_SetCheckState
   #define ListView_SetCheckState(hwndLV, i, fCheck) \
	  ListView_SetItemState(hwndLV, i, \
	  INDEXTOSTATEIMAGEMASK((fCheck)+1), LVIS_STATEIMAGEMASK)
#endif

/////////////////////////////////////////////////////////////////////////////
// CEditListCtrl

CEditListCtrl::CEditListCtrl()
:CListCtrl(),
m_eHighlightMethod(HIGHLIGHT_ROW), //HIGHLIGHT_NORMAL),
m_dwFlagsForInPlaceEdit(WS_BORDER | ES_AUTOHSCROLL /*ES_MULTILINE*/),
m_dwFlags(ALLOW_SORTING | ALLOW_DRAG_REORDER |DOUBLE_CLICK_NEW|HANDLE_EDITTING),
m_bDragging(FALSE),
m_nSortedCol(-1),
m_bSortAscending(TRUE),
m_pimageListDrag (NULL),
m_nLastClickedItem(-1),
m_bHeaderSubclassed(FALSE),
m_bInEditingMode(FALSE),
m_bDidDrag(FALSE),
m_pStrBuff(NULL),
m_nMaxItemLength(NULL),
m_dwColumnEditBitfield(~0)	// all editabled by default
{
	// jdh Feb  99  This is needed because of what appears to be a bug in
	// in the MFC List control.  GetItemText ignores the buffer-size parameter,
	// overflowing the buffer if the length is greater than the buffer.  This
	// may have something to do with the fact that the strings are retrieved via callbacks
	// So my solution is just to have a huge buffer that will get reused, then check
	// to make sure noone exceeds this maximum length.
	#define kBuffSize 20480
	m_pStrBuff = new TCHAR[kBuffSize+1];	// 20480 = 20k
	m_nMaxItemLength = kBuffSize;
}


CEditListCtrl::~CEditListCtrl()
{
	if(m_pStrBuff)
		delete m_pStrBuff;

	for(int i=0; i< m_columns.GetSize(); i++)
		delete m_columns[i];
}


BEGIN_MESSAGE_MAP(CEditListCtrl, CListCtrl)
	//{{AFX_MSG_MAP(CEditListCtrl)
	ON_WM_HSCROLL()
	ON_NOTIFY_REFLECT(LVN_ENDLABELEDIT, OnEndLabelEdit)
	ON_WM_LBUTTONDOWN()
	ON_WM_LBUTTONUP()
	ON_NOTIFY_REFLECT(LVN_BEGINDRAG, OnBegindrag)
	ON_WM_MOUSEMOVE()
	ON_NOTIFY_REFLECT(LVN_GETDISPINFO, OnGetdispinfo)
	ON_NOTIFY_REFLECT(LVN_INSERTITEM, OnInsertitem)
	ON_NOTIFY_REFLECT(NM_DBLCLK, OnDblclk)
	ON_NOTIFY(HDN_ITEMCLICKA, 0, OnHeaderClicked) // windows 9x
	ON_NOTIFY(HDN_ITEMCLICKW, 0, OnHeaderClicked) // windows nt
	ON_NOTIFY_REFLECT(LVN_KEYDOWN, OnKeydown)
	//}}AFX_MSG_MAP
	ON_MESSAGE(WM_SETFONT, OnSetFont)
	ON_WM_MEASUREITEM_REFLECT( )
	END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CEditListCtrl message handlers

int CEditListCtrl::HitTestEx(CPoint &point, int *col) const
{
int colnum = 0;
	int row = HitTest( point, NULL );

	if( col ) *col = 0;

	// Make sure that the ListView is in LVS_REPORT
	if( (GetWindowLong(m_hWnd, GWL_STYLE) & LVS_TYPEMASK) != LVS_REPORT )
		return row;

	// Get the top and bottom row visible
	row = GetTopIndex();
	int bottom = row + GetCountPerPage();
	if( bottom > GetItemCount() )
		bottom = GetItemCount();

	// Get the number of columns
	CHeaderCtrl* pHeader = (CHeaderCtrl*)GetDlgItem(0);
	int nColumnCount = pHeader->GetItemCount();

	// Loop through the visible rows
	for( ;row <=bottom;row++)
	{
		// Get bounding rect of item and check whether point falls in it.
		CRect rect;
		GetItemRect( row, &rect, LVIR_BOUNDS );
		if( rect.PtInRect(point) )
		{
			// Now find the column
			for( colnum = 0; colnum < nColumnCount; colnum++ )
			{
				int colwidth = GetColumnWidth(colnum);
				if( point.x >= rect.left
					&& point.x <= (rect.left + colwidth ) )
				{
					if( col )
					{
						*col = colnum;
						if( colnum==0)	// jdh added this section to prevent clicking on the icon and getting an annoying edit box
						{
							CRect rIcon;
							GetItemRect( row, &rIcon, LVIR_ICON );
							if(point.x < rIcon.right)
								*col = -1;
						}
					}

					return row;
				}
				rect.left += colwidth;
			}
		}
	}
	return -1;
}




// EditSubLabel		- Start edit of a sub item label
// Returns		- Temporary pointer to the new edit control
// nItem		- The row index of the item to edit
// nCol			- The column of the sub item.
CEdit* CEditListCtrl::EditSubLabel(int nItem, int nCol)
{

// The returned pointer should not be saved

	// Make sure that the item is visible
	if( !EnsureVisible( nItem, TRUE ) ) return NULL;

	// Make sure that nCol is valid
	CHeaderCtrl* pHeader = (CHeaderCtrl*)GetDlgItem(0);
	int nColumnCount = pHeader->GetItemCount();
	if( nCol >= nColumnCount || GetColumnWidth(nCol) < 5 )
		return NULL;

	// Get the column offset
	int offset = 0;
	for( int i = 0; i < nCol; i++ )
		offset += GetColumnWidth( i );

	CRect rect;
	GetItemRect( nItem, &rect, LVIR_LABEL);//LVIR_BOUNDS );

	// Now scroll if we need to expose the column
	CRect rcClient;
	GetClientRect( &rcClient );
	if( offset + rect.left < 0 || offset + rect.left > rcClient.right )
	{
		CSize size;
		size.cx = offset + rect.left;
		size.cy = 0;
		Scroll( size );
		rect.left -= size.cx;
	}

	// Get Column alignment
	LV_COLUMN lvcol;
	lvcol.mask = LVCF_FMT;
	GetColumn( nCol, &lvcol );
	DWORD dwStyle ;
	if((lvcol.fmt&LVCFMT_JUSTIFYMASK) == LVCFMT_LEFT)
		dwStyle = ES_LEFT;
	else if((lvcol.fmt&LVCFMT_JUSTIFYMASK) == LVCFMT_RIGHT)
		dwStyle = ES_RIGHT;
	else dwStyle = ES_CENTER;


	if(nCol==0)	// added by jdh to handle label column correctly (original code left that to the system)
	{
		CRect rcLabel;
		GetItemRect(nItem, rcLabel, LVIR_LABEL);
		rect.left = rcLabel.left+3; // this 3 is a hack; I don't know why it's needed, but it is
		rect.right = rcLabel.right;
	}
	else
	{
		rect.left = offset+4; // +4 is for the margin between the beginning of the col and beginning of the text
		rect.right = rect.left + GetColumnWidth( nCol ) - 3 ;
	}

	//rect.OffsetRect(0, -2); // added by jdh

	if( rect.right > rcClient.right)
		rect.right = rcClient.right;

	dwStyle |=  WS_CHILD|WS_VISIBLE|m_dwFlagsForInPlaceEdit;

	CFont* pFont = getFontForSubItem(nItem, nCol);
	CEdit *pEdit = new CInPlaceEdit(nItem, nCol, getItemText( nItem, nCol ), pFont);
	ASSERTX(pEdit);
	pEdit->Create( dwStyle, rect, this, IDC_IPEDIT   );
	pEdit->SetSel(0, -1); // select everything (added by jdh to act like the windows explorer)
	m_bInEditingMode = TRUE;
	return pEdit;
}

void CEditListCtrl::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	if( GetFocus() != this ) SetFocus();
	CListCtrl::OnHScroll(nSBCode, nPos, pScrollBar);
}

//DEL void CEditListCtrl::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
//DEL {
//DEL 	if( GetFocus() != this ) SetFocus();
//DEL 	CListCtrl::OnVScroll(nSBCode, nPos, pScrollBar);
//DEL }

/*
Like the built in edit control for the first column, our edit control also
sends the LVN_ENDLABELEDIT notification when the edit is completed. If
this notification message isn’t already being handled, add a handler so
that any changes made with the edit control can be accepted.
*/
void CEditListCtrl::OnEndLabelEdit(NMHDR* pNMHDR, LRESULT* pResult)
{
TRACE(_T("CEditListCtrl::OnEndLabelEdit\n"));


	LV_DISPINFO *plvDispInfo = (LV_DISPINFO *)pNMHDR;
	LV_ITEM	*plvItem = &plvDispInfo->item;

	if (plvItem->pszText != NULL)
	{
		// subclasses can override this next one, else it just calls CListCtr::SetItemText
		setItemText(plvItem->iItem, plvItem->iSubItem, plvItem->pszText);

		// try to force the box the right size after editing and making the string larger
		//if(plvItem->pszText == LPSTR_TEXTCALLBACK)
		this->SetItemText(plvItem->iItem, 0, LPSTR_TEXTCALLBACK);//LPSTR_TEXTCALLBACK);

		//sortItems();

		// inplaceedit uses the param for other things (tab key) //itemModified(	plvItem->lParam,  plvItem->iSubItem);
		itemModified(GetItemData(plvItem->iItem), plvItem->iSubItem);
	}
	m_bInEditingMode =FALSE;
	*pResult = FALSE;

	if(plvItem->lParam == VK_TAB)
	{
		CHeaderCtrl* pHeader = (CHeaderCtrl*)GetDlgItem(0);
		ASSERT(pHeader);
		int c = 1 + plvItem->iSubItem;	// select the next column
		if(c >= pHeader->GetItemCount())
			c=0;

		EditSubLabel(plvItem->iItem, c);
	}
}

// i tried to allow clicking inside a currently in-edit-mode item, without
// that being interpreter as a new request to edit the item.  The problem
// comes down to the CInPlaceEdit getting a KillFocus() (from where) as a result
// of this click.  In other words, it's not CEditListCtrl's fault.
//(LATER) this isn't a problem in MX, just CARLA Studio.  So some other class there
// is causing the problem

void CEditListCtrl::OnLButtonDown(UINT nFlags, CPoint point)
{
//TRACE(_T("CEditListCtrl::OnLButtonDown\n"));
	int index;
	m_bDidDrag=FALSE;
	BOOL bWasEditing=m_bInEditingMode;
	CListCtrl::OnLButtonDown(nFlags, point);
	if(m_bDidDrag)
		return;

//	TRACE(_T("wasEditing=%d inEditing=%d last=%d\n"), bWasEditing, m_bInEditingMode, m_nLastClickedItem);
	int colnum;
	if( ( index = HitTestEx( point, &colnum )) != -1 )
	{
		UINT flag = LVIS_FOCUSED;
		//if( m_nLastClickedItem == index
			//GetItemState( index, flag ) & flag) == flag // this is the right way, but i (jdh) found that by the time this gets called, it is always already focussed
		//	&& colnum >= 0)
		if(  m_nLastClickedItem == index &&
			(GetItemState( index, flag ) & flag) == flag
			&& colnum >= 0)
		{
			// Add check for LVS_EDITLABELS
			if( (m_dwFlags & HANDLE_EDITTING)
				&& m_dwColumnEditBitfield & (1 << colnum) )
#ifdef hab241
				EditSubLabel( index, colnum );
#else // hab241
			if (getItemType(index) == 0) // skip all but default type (e.g. skip comment and test data)
			  EditSubLabel( index, colnum );
#endif // hab241

			m_nLastClickedItem=-1;
		}
		else if(!bWasEditing)
		{
			m_nLastClickedItem = index;
			SetItemState( index, LVIS_SELECTED | LVIS_FOCUSED ,
						LVIS_SELECTED | LVIS_FOCUSED);
		}
	}
/*	if(!m_bInEditingMode && ( index = HitTestEx( point, &colnum )) != -1 )
	{
		{
			m_nLastClickedItem = index;
			SetItemState( index, LVIS_SELECTED | LVIS_FOCUSED ,
						LVIS_SELECTED | LVIS_FOCUSED);
		}
	}
*/
}

//	virtual override
// from codeguru
// Note that in CarlaStudio, I override this with the subclass CListCtrl
void CEditListCtrl::DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct)
{
	CDC* pDC = CDC::FromHandle(lpDrawItemStruct->hDC);
	CRect rcItem(lpDrawItemStruct->rcItem);
	int nItem = lpDrawItemStruct->itemID;
	CImageList* pImageList;

	// Save dc state
	int nSavedDC = pDC->SaveDC();

	// Get item image and state info
	LV_ITEM lvi;
	lvi.mask = LVIF_IMAGE | LVIF_STATE;
	lvi.iItem = nItem;
	lvi.iSubItem = 0;
	lvi.stateMask = 0xFFFF;		// get all state flags
	GetItem(&lvi);

	// Should the item be highlighted
	BOOL bHighlight =((lvi.state & LVIS_DROPHILITED)
				|| ( (lvi.state & LVIS_SELECTED)
					&& ((GetFocus() == this)
						|| (GetStyle() & LVS_SHOWSELALWAYS)
						)
					)
				);


	// Get rectangles for drawing
	CRect rcBounds, rcLabel, rcIcon;
	GetItemRect(nItem, rcBounds, LVIR_BOUNDS);
	GetItemRect(nItem, rcLabel, LVIR_LABEL);
	GetItemRect(nItem, rcIcon, LVIR_ICON);
	CRect rcCol( rcBounds );


	CString sLabel = GetItemText( nItem, 0 );

	// Labels are offset by a certain amount
	// This offset is related to the width of a space character
	int offset = pDC->GetTextExtent(_T(" "), 1 ).cx*2;

	CRect rcHighlight;
	CRect rcWnd;
	int nExt;
	switch( m_eHighlightMethod )
	{
	case HIGHLIGHT_NORMAL:
		nExt = pDC->GetOutputTextExtent(sLabel).cx + offset;
		rcHighlight = rcLabel;
		if( rcLabel.left + nExt < rcLabel.right )
			rcHighlight.right = rcLabel.left + nExt;
		break;
	case HIGHLIGHT_ALLCOLUMNS:
		rcHighlight = rcBounds;
		rcHighlight.left = rcLabel.left;
		break;
	case HIGHLIGHT_ROW:
		GetClientRect(&rcWnd);
		rcHighlight = rcBounds;
		rcHighlight.left = rcLabel.left;
		rcHighlight.right = rcWnd.right;
		break;
	case HIGHLIGHT_LABEL:
		rcHighlight = rcLabel;
		break;
	default: ASSERT(FALSE);break;
	}

	// Draw the background "color" tppabs="http://www.codeguru.com/listview/color"
	if( bHighlight )
	{
		pDC->SetTextColor(::GetSysColor(COLOR_HIGHLIGHTTEXT));
		pDC->SetBkColor(::GetSysColor(COLOR_HIGHLIGHT));

		pDC->FillRect(rcHighlight, &CBrush(::GetSysColor(COLOR_HIGHLIGHT)));
	}
	else
		pDC->FillRect(rcHighlight, &CBrush(::GetSysColor(COLOR_WINDOW)));



	// Set clip region
	rcCol.right = rcCol.left + GetColumnWidth(0);
	CRgn rgn;
	rgn.CreateRectRgnIndirect(&rcCol);
	pDC->SelectClipRgn(&rgn);
	rgn.DeleteObject();

	// Draw state icon
	if (lvi.state & LVIS_STATEIMAGEMASK)
	{
		int nImage = ((lvi.state & LVIS_STATEIMAGEMASK)>>12) - 1;
		pImageList = GetImageList(LVSIL_STATE);
		if (pImageList)
		{
			pImageList->Draw(pDC, nImage,
				CPoint(rcCol.left, rcCol.top), ILD_TRANSPARENT);
		}
	}

	// Draw normal and overlay icon
	pImageList = GetImageList(LVSIL_SMALL);
	if (pImageList)
	{
		UINT nOvlImageMask=lvi.state & LVIS_OVERLAYMASK;
		pImageList->Draw(pDC, lvi.iImage,
			CPoint(rcIcon.left, rcIcon.top),
			(bHighlight?ILD_BLEND50:0) | ILD_TRANSPARENT | nOvlImageMask );
	}



	// Draw item label - Column 0
	rcLabel.left += offset/2;
	rcLabel.right -= offset;

	//pDC->DrawText(sLabel,-1,rcLabel,DT_LEFT | DT_SINGLELINE | DT_NOPREFIX | DT_NOCLIP
	//			| DT_VCENTER | DT_END_ELLIPSIS);

	drawItemText(pDC, nItem, 0/*column*/, sLabel, rcLabel, DT_LEFT); //jdh don't know why justify was hard-coded to be left by zafir

	// Draw labels for remaining columns
	LV_COLUMN lvc;
	lvc.mask = LVCF_FMT | LVCF_WIDTH;

	if( m_eHighlightMethod == 0 )		// Highlight only first column
	{
		pDC->SetTextColor(::GetSysColor(COLOR_WINDOWTEXT));
		pDC->SetBkColor(::GetSysColor(COLOR_WINDOW));
	}

	rcBounds.right = rcHighlight.right > rcBounds.right ? rcHighlight.right :
							rcBounds.right;
	rgn.CreateRectRgnIndirect(&rcBounds);
	pDC->SelectClipRgn(&rgn);

	for(int nColumn = 1; GetColumn(nColumn, &lvc); nColumn++)
	{
		CString sSubItem;

		rcCol.left = rcCol.right;
		rcCol.right += lvc.cx;

		// Draw the background if needed
		if( m_eHighlightMethod == HIGHLIGHT_NORMAL )
			pDC->FillRect(rcCol, &CBrush(::GetSysColor(COLOR_WINDOW)));

		// jdh changed to handle long lines (old version gave an assert)
	//	sSubItem = GetItemText(nItem, nColumn);


		//LPTSTR buff = sSubItem.GetBuffer(m_nMaxItemLength+1);
		int len = GetItemText(nItem, nColumn, m_pStrBuff, m_nMaxItemLength);

		if(len==0)
			(*m_pStrBuff) = '\0';
		// jdh Feb  99  This is needed because of what appears to be a bug in
	// in the MFC List control.  GetItemText ignores the buffer-size parameter,
	// overflowing the buffer if the length is greater than the buffer.  This
	// may have something to do with the fact that the strings are retrieved via callbacks
	// So my solution is just to have a huge buffer that will get reused, then check
	// to make sure noone exceeds this maximum length.
		if(len > m_nMaxItemLength)
		{
			CString s;
			s.Format(_T("Please report this problem: The text for %s was %d characters long, but the maximum allowed is only %d characters.\n"),
						sLabel, len, m_nMaxItemLength);
			AfxMessageBox(s);
			ASSERTX(FALSE);
		}

		sSubItem = m_pStrBuff;

		if (sSubItem.GetLength() == 0)
			continue;

		// Get the text justification
		UINT nJustify = DT_LEFT;
		switch(lvc.fmt & LVCFMT_JUSTIFYMASK)
		{
		case LVCFMT_RIGHT:
			nJustify = DT_RIGHT;
			break;
		case LVCFMT_CENTER:
			nJustify = DT_CENTER;
			break;
		default:
			break;
		}

		rcLabel = rcCol;
		rcLabel.left += offset;
		rcLabel.right -= offset;

		drawItemText(pDC, nItem, nColumn, sSubItem, rcLabel, nJustify);
		//pDC->DrawText(sSubItem, -1, rcLabel, nJustify | DT_SINGLELINE |
		//			DT_NOPREFIX | DT_VCENTER | DT_END_ELLIPSIS);
	}

	// Draw focus rectangle if item has focus
	if (lvi.state & LVIS_FOCUSED && (GetFocus() == this))
		pDC->DrawFocusRect(rcHighlight);


	// Restore dc
	pDC->RestoreDC( nSavedDC );
}


// code from microsft samples, I think
void CEditListCtrl::OnBegindrag(LPNMHDR pnmhdr, LRESULT *pResult)
{
	if(!(m_dwFlags & ALLOW_DRAG_REORDER))
		return;

	CPoint			ptItem, ptAction, ptImage;
	NM_LISTVIEW		*pnmListView = (NM_LISTVIEW *)pnmhdr;

//	((CListCtrlPage *)GetParent())->ShowNotification(pnmhdr, pResult);
#ifdef _DEBUG
	ASSERT(!m_bDragging);
#endif
	if(m_bDragging)
		return;

	m_bDragging = TRUE;
	m_iItemDrag = pnmListView->iItem;
	ptAction = pnmListView->ptAction;

	m_iItemDrag = pnmListView->iItem;
	GetItemPosition(m_iItemDrag, &ptItem);  // ptItem is relative to (0,0) and not the view origin

	GetOrigin(&m_ptOrigin);
	m_iDragHorizontalLimit = ptAction.x;	// save this so that we limit the user to up and down dragging

	ASSERTX(m_pimageListDrag == NULL);
	BOOL bIsOwnerDrawn = GetStyle() & LVS_OWNERDRAWFIXED;
	ModifyStyle(LVS_OWNERDRAWFIXED, NULL);

	m_pimageListDrag = CreateDragImage(m_iItemDrag, &ptImage);

	if(bIsOwnerDrawn)
		ModifyStyle(NULL, LVS_OWNERDRAWFIXED);

	m_sizeDelta.cx = ptAction.x - ptImage.x;   // difference between cursor pos and image pos
	m_sizeDelta.cy = ptAction.y - ptImage.y;

	m_pimageListDrag->BeginDrag(0, CPoint (0, 0)/*hot spot relative to upperleft of image*/);
	m_pimageListDrag->DragEnter(	this, ptAction+m_sizeDelta);

/*	// CREATE THE DRAGE IMAGE
//	TRACE(_T("---creating drag image:"));
	m_pimageListDrag = CreateDragImage(m_iItemDrag, &ptImage);
//	TRACE(_T("---done\n"));
	m_sizeDelta = ptAction - ptImage;   // difference between cursor pos and image pos
	m_ptHotSpot = ptAction - ptItem + m_ptOrigin;  // calculate hotspot for the cursor
	m_pimageListDrag->DragShowNolock(TRUE);  // lock updates and show drag image
	m_pimageListDrag->SetDragCursorImage(0, m_ptHotSpot);  // define the hot spot for the new cursor image

	//m_pimageListDrag->BeginDrag(0, CPoint(0,0));//CPoint(ptAction.x-ptImage.x,ptAction.y-ptImage.y));//CPoint(0, 0));
	m_pimageListDrag->BeginDrag(0, CPoint(ptAction.x-ptImage.x,ptAction.y-ptImage.y));//CPoint(0, 0));
	ptAction -= m_sizeDelta;
	m_pimageListDrag->DragEnter(this, ptAction);
	m_pimageListDrag->DragMove(ptAction);  // move image to overlap original icon
*/	SetCapture();

	m_bDidDrag = TRUE; // help the editting code know not to start an edit
}

// code from microsft samples, I think
void CEditListCtrl::OnMouseMove(UINT nFlags, CPoint point)
{
	long		lStyle;
	int			iItem;

	lStyle = GetWindowLong(m_hWnd, GWL_STYLE);
	lStyle &= LVS_TYPEMASK;  // drag will do different things in list and report mode
	if (m_bDragging)
	{
		if(!(m_dwFlags & ALLOW_DRAG_REORDER)) // actually, it won't get here if this is not allowed
			return;
		point.x = m_iDragHorizontalLimit;	// limit to up and down dragging
		ASSERTX(m_pimageListDrag != NULL);
		m_pimageListDrag->DragMove(point - m_sizeDelta);  // move the image
		if ((iItem = HitTest(point)) != -1)
		{
			m_iItemDrop = iItem;
			// This highlight code doesn't do anything (did it use to?) the item doesn't highlight
/*			m_pimageListDrag->DragLeave(this); // unlock the window and hide drag image
			if (lStyle == LVS_REPORT || lStyle == LVS_LIST)
			{
				lvitem.iItem = iItem;
				lvitem.iSubItem = 0;
				lvitem.mask = LVIF_STATE;
				lvitem.stateMask = LVIS_DROPHILITED;  // highlight the drop target
				SetItem(&lvitem);
			}

			point -= m_sizeDelta;
			m_pimageListDrag->DragEnter(this, point);  // lock updates and show drag image
*/
		}
	}

	CListCtrl::OnMouseMove(nFlags, point);

/*	if( m_bDragging )
	{
		CPoint m_ptDropPoint = point;
		//this->GetParent()->ClientToScreen(&m_ptDropPoint);

		//MOVE THE DRAG IMAGE
		m_pimageListDrag->DragMove(m_ptDropPoint);

		//TEMPORARILY UNLOCK WINDOW UPDATES
//		m_pimageListDrag->DragShowNolock(FALSE);

		//CONVERT THE DROP POINT TO CLIENT CO-ORDIANTES
		//m_pDropWnd = WindowFromPoint(m_ptDropPoint);
		//m_pDropWnd->ScreenToClient(&m_ptDropPoint);

		//LOCK WINDOW UPDATES
//		m_pimageListDrag->DragShowNolock(TRUE);
	}
	CListCtrl::OnMouseMove(nFlags, point);
	*/
}


void CEditListCtrl::OnLButtonUp(UINT nFlags, CPoint point)
{
//	TRACE(_T("button up\n"));
	if (m_bDragging)  // end of the drag operation
	{
		if(!(m_dwFlags & ALLOW_DRAG_REORDER))	// actually, shouldn't get here if this is true
			return;
		long		lStyle;
		CString		cstr;

		lStyle = GetWindowLong(m_hWnd, GWL_STYLE) & LVS_TYPEMASK;
		m_bDragging = FALSE;

		ASSERTX(m_pimageListDrag != NULL);
		m_pimageListDrag->DragLeave(this);
		m_pimageListDrag->EndDrag();
		delete m_pimageListDrag;
		m_pimageListDrag = NULL;
		//CListCtrl& clc = GetListCtrl();

		if (lStyle == LVS_REPORT && m_iItemDrop != m_iItemDrag && m_iItemDrop>=0)
		{
			finishDrag(m_iItemDrag, m_iItemDrop); //
		}
		::ReleaseCapture();
	}
/*	else
	{
		int colnum;
		int index;
		TRACE(_T("Up editing=%d last=%d\n"), m_bInEditingMode, m_nLastClickedItem);
		if(!m_bInEditingMode && ( index = HitTestEx( point, &colnum )) != -1 )
		{
			TRACE(_T("    index=%d column=%d"), index, colnum);
			UINT flag = LVIS_FOCUSED;
			if(  m_nLastClickedItem == index &&
				(GetItemState( index, flag ) & flag) == flag
				&& colnum >= 0)
			{
				// Add check for LVS_EDITLABELS
				if( GetWindowLong(m_hWnd, GWL_STYLE))// & LVS_EDITLABELS )
					EditSubLabel( index, colnum );

				m_nLastClickedItem=-1;
			}
		}
	}
*/		else CListCtrl::OnLButtonUp(nFlags, point);
}

// If a subclass is using callback texts, it probably needs to override this
// in order to move the underlying items around in its data structure, then
// call this method if it doesn't want to handle updating the display itself.

// Modified (just to fit) from Wayne Berthin's codegure article on drag-n-drop row reordering
// note the in carlastudio this is overriden by a subclass, so I've never
// tested it.
void CEditListCtrl::finishDrag(int iFrom, int iTo)
{
	//GET INFORMATION ON THE DRAGGED ITEM BY SETTING AN LV_ITEM STRUCTURE
	//AND THEN CALLING GetItem TO FILL IT IN
	TCHAR szLabel[256];
	LV_ITEM lvi;
	ZeroMemory(&lvi, sizeof(LV_ITEM));
	lvi.mask = ~0;//LVIF_TEXT | LVIF_IMAGE | LVIF_STATE | LVIF_PARAM;
	lvi.stateMask = ~0; //LVIS_DROPHILITED | LVIS_FOCUSED | LVIS_SELECTED;
	lvi.pszText = szLabel;
	lvi.iItem = iFrom;
	lvi.cchTextMax = 255;
	GetItem(&lvi);

	BOOL bCheckState; // I couldn't get the check state to copy without doing it explicitly, like this
	if(ListView_GetExtendedListViewStyle(m_hWnd) & LVS_EX_CHECKBOXES )
		bCheckState = ListView_GetCheckState(m_hWnd, iFrom);

	//DELETE THE ITEM THAT WAS DRAGGED FROM ITS ORIGINAL LOCATION
	DeleteItem(iFrom);

	//INSERT THE DROPPED ITEM
	if(iTo < 0)
		iTo = GetItemCount();
	lvi.iItem = iTo;
	InsertItem(&lvi);

	if(ListView_GetExtendedListViewStyle(m_hWnd) & LVS_EX_CHECKBOXES )
		ListView_SetCheckState(m_hWnd, iTo, bCheckState);

	if(lvi.pszText != LPSTR_TEXTCALLBACK)
	{
		//FILL IN ALL OF THE COLUMNS
		CHeaderCtrl* pHeader = (CHeaderCtrl*)GetDlgItem(0);
		int nColumnCount = pHeader->GetItemCount();
		lvi.mask = LVIF_TEXT;
		//lvi.iItem = iTo;


		for(int col=1; col < nColumnCount; col++)
		{
			_tcscpy(lvi.pszText, (LPCTSTR)(GetItemText(iFrom,col)));
			lvi.iSubItem = col;
			SetItem(&lvi);
		}
	}

	listModified();
}


// virtual
// subclasses can override if there are different font for different rows
// in most cases, the column structure will be enough to give the font, for the whole column
CFont* CEditListCtrl::getFontForSubItem(int nItem, int nCol)
{
	if(m_dwFlags & MULTIPLE_FONTS)	// in this case user must sub
		AfxMessageBox(_T("Since subclass of CEditListCtrl has set the flag MULTIPLE_FONTS, it must override getFontForSubItem()"));

	//return m_columns[nCol]->m_pFont; // may be NULL
	return NULL; // better not to risk someone storing a temporary, which GetFont returns
					//GetFont();
}

CString CEditListCtrl::getItemText(LPARAM lp, int nCol)
{
	return _T("Subclass of CEditListCtrl must override getItemText(LPARAM)");
}

void CEditListCtrl::OnGetdispinfo(NMHDR* pNMHDR, LRESULT* pResult)
{
	LV_DISPINFO* pnmv = (LV_DISPINFO*)pNMHDR;

	// Provide the item or subitem's text, if requested.
	if (pnmv->item.mask & LVIF_TEXT)
	{
		  lstrcpy(pnmv->item.pszText, getItemText(pnmv->item.lParam, pnmv->item.iSubItem));
	}

	*pResult = 0; //	THIS WAS PUT HERE BY THE WIZARD
}

// from zafir's article _T("Sorting the list based on text in any column") in www.codeguru.com
// SortTextItems	- Sort the list based on column text
// Returns		- Returns true for success
// nCol			- column that contains the text to be sorted
// bAscending		- indicate sort order
// low			- row to start scanning from - default row is 0
// high			- row to end scan. -1 indicates last row
/*BOOL CEditListCtrl::SortTextItems( int nCol, BOOL bAscending,
					int low, //= 0
				int high //= -1
				)
{
	if( nCol >= ((CHeaderCtrl*)GetDlgItem(0))->GetItemCount() )
		return FALSE;

	if( high == -1 ) high = GetItemCount() - 1;

	int lo = low;
	int hi = high;
	CString midItem;

	if( hi <;= lo ) return FALSE;

	midItem = GetItemText( (lo+hi)/2, nCol );

	// loop through the list until indices cross
	while( lo <;= hi )
	{
		// rowText will hold all column text for one row
		CStringArray rowText;

		// find the first element that is greater than or equal to
		// the partition element starting from the left Index.
		if( bAscending )
			while( ( lo <; high ) && ( GetItemText(lo, nCol) <; midItem ) )
				++lo;
		else
			while( ( lo <; high ) && ( GetItemText(lo, nCol) > midItem ) )
				++lo;

		// find an element that is smaller than or equal to
		// the partition element starting from the right Index.
		if( bAscending )
			while( ( hi > low ) && ( GetItemText(hi, nCol) > midItem ) )
				--hi;
		else
			while( ( hi > low ) && ( GetItemText(hi, nCol) <; midItem ) )
				--hi;

		// if the indexes have not crossed, swap
		// and if the items are not equal
		if( lo <;= hi )
		{
			// swap only if the items are not equal
			if( GetItemText(lo, nCol) != GetItemText(hi, nCol))
			{
				// swap the rows
				LV_ITEM lvitemlo, lvitemhi;
				int nColCount =
					((CHeaderCtrl*)GetDlgItem(0))->GetItemCount();
				rowText.SetSize( nColCount );
				int i;
				for( i=0; i<;nColCount; i++)
					rowText[i] = GetItemText(lo, i);
				lvitemlo.mask = LVIF_IMAGE | LVIF_PARAM | LVIF_STATE;
				lvitemlo.iItem = lo;
				lvitemlo.iSubItem = 0;
				lvitemlo.stateMask = LVIS_CUT | LVIS_DROPHILITED |
						LVIS_FOCUSED |  LVIS_SELECTED |
						LVIS_OVERLAYMASK | LVIS_STATEIMAGEMASK;

				lvitemhi = lvitemlo;
				lvitemhi.iItem = hi;

				GetItem( &lvitemlo );
				GetItem( &lvitemhi );

				for( i=0; i<;nColCount; i++)
					SetItemText(lo, i, GetItemText(hi, i));

				lvitemhi.iItem = lo;
				SetItem( &lvitemhi );

				for( i=0; i<;nColCount; i++)
					SetItemText(hi, i, rowText[i]);

				lvitemlo.iItem = hi;
				SetItem( &lvitemlo );
			}

			++lo;
			--hi;
		}
	}

	// If the right index has not reached the left side of array
	// must now sort the left partition.
	if( low <; hi )
		SortTextItems( nCol, bAscending , low, hi);

	// If the left index has not reached the right side of array
	// must now sort the right partition.
	if( lo <; high )
		SortTextItems( nCol, bAscending , lo, high );

	return TRUE;
}
*/

int CALLBACK CEditListCtrl::CompareFunc(LPARAM lParam1, LPARAM lParam2, LPARAM pListCtrl)
{
	CEditListCtrl* pCtrl = (CEditListCtrl*)pListCtrl;
	ASSERT(pCtrl->IsKindOf(RUNTIME_CLASS(CEditListCtrl)));
	return pCtrl->compareItems(lParam1, lParam2);
}

int CEditListCtrl::compareItems(LPARAM pItem1, LPARAM pItem2)
{
	BOOL b;
	CString s1 = getItemText(pItem1, m_nSortedCol);
	CString s2 = getItemText(pItem2, m_nSortedCol);
	b  = s1 > s2;
	if(!m_bSortAscending)
		return !b;
	return b;
}


void CEditListCtrl::OnHeaderClicked(NMHDR *pNMHDR, LRESULT *pResult)
{
	if(!(m_dwFlags & ALLOW_SORTING))
		return;

	HD_NOTIFY *phdn = (HD_NOTIFY *) pNMHDR;
	if( phdn->iButton == 0 )
	{
		// User clicked on header using left mouse button

		if( phdn->iItem == m_nSortedCol )
			m_bSortAscending = !m_bSortAscending;
		else
			 m_bSortAscending = TRUE;
		m_nSortedCol = phdn->iItem;
		sortItems();
	}
	*pResult = 0;
}

// subclass should override if you need more than just up and down options for the header sort image
void CEditListCtrl::sortItems()
{
	if(!(m_dwFlags & ALLOW_SORTING))
		return;

	if(m_nSortedCol == -1)
		return;
	if(m_headerctrl.m_hWnd)
		m_headerctrl.SetSortImage( m_nSortedCol, m_bSortAscending );
	SortItems(CEditListCtrl::CompareFunc, (LPARAM)this);
}

void CEditListCtrl::PreSubclassWindow()
{
	// use our special header control which has the images for sorting diff columns
	CListCtrl::PreSubclassWindow();


	// this all doesn't work becuase there is no header control create at this point
	// see OnInsertItem for my work-around
/*
	HWND hWnd =::GetDlgItem(m_hWnd,0);
	CHeaderCtrl* pH= GetHeaderCtrl();
	if(pH)
		hWnd = pH->m_hWnd;

	m_headerctrl.SubclassWindow( hWnd );
*/
}


void CEditListCtrl::OnInsertitem(NMHDR* pNMHDR, LRESULT* pResult)
{
	// here's our hack to get the header subclassed.
	// is *should* be done in PreSubclassWindow(), but for some reason there is no
	// header control availible at that point, nor in Create()
	// by the time we get here, it is available, so we do the subclassing here,
	// when the first item is inserted
	if(!m_bHeaderSubclassed)
	{
		m_bHeaderSubclassed=TRUE;
		CHeaderCtrl* pH= GetHeaderCtrl();
		m_headerctrl.SubclassWindow( pH->m_hWnd );
	}

	NM_LISTVIEW* pNMListView = (NM_LISTVIEW*)pNMHDR;
	// TODO: Add your control notification handler code here

	*pResult = 0;
}

// nCol: which column (0 for the label, 1..n for the subitems)
// pszStr: the text for that column, according to GetItemText
//subclasses will usually use either the pszStr or the nCol, whichever is more useful

void CEditListCtrl::drawItemText(CDC* pDC, int nRow, int nCol, LPCTSTR pszStr, CRect &rect, UINT nJustifyFlag)
{
	CFont* pf= getFontForSubItem(nRow, nCol);	// allows each column, or even individual items to have different fonts
	CGdiObject* pOldFont = pDC->SelectObject(pf);

	pDC->DrawText(pszStr, -1, rect, nJustifyFlag | DT_SINGLELINE |
					DT_NOPREFIX | DT_VCENTER | DT_END_ELLIPSIS);

	pDC->SelectObject(pOldFont);
}

// subclasses that deal in large numbers of items will want to do something different
// nCol is given here because some applications (like the MX prototype) can be
// smart about what other windows need updating, depending on what field of an item
// was modified.
void CEditListCtrl::itemModified(LPARAM lParam, int nCol)
{
	listModified();
}

// subclasses must override this
// this will be called at the right time
void CEditListCtrl::makeImageList()
{

}

BOOL CEditListCtrl::Create(DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID)
{
	// make the header visually reflect whether these items are sortable or not
	if(m_dwFlags & ALLOW_SORTING)
		dwStyle &= ~LVS_NOSORTHEADER; //this->ModifyStyle(LVS_NOSORTHEADER , NULL);
	else
		dwStyle |= LVS_NOSORTHEADER; //this->ModifyStyle(NULL , LVS_NOSORTHEADER);
	BOOL bok = CListCtrl::Create(dwStyle, rect, pParentWnd, nID);
	finishCreate();
	return bok;
}

// subclasses must override this
void CEditListCtrl::makeColumns()
{

}

void CEditListCtrl::insertColumn(LPCTSTR pszName, int iWidth, DWORD flags/*=NULL*/)
{
	CGuruColumn* pc = new CGuruColumn(pszName, iWidth, flags);
	insertColumn(pc);
}

// this one gives full access to the CGuruColumn because the caller creates it himself
void CEditListCtrl::insertColumn(CGuruColumn *pCol)
{
	m_columns.Add(pCol);
	pCol->insertColumnIntoCtrl(this);

}

void CGuruColumn::insertColumnIntoCtrl(CListCtrl *pLC)
{
	LV_COLUMN lv;
	lv.mask = LVCF_FMT | LVCF_TEXT | LVCF_WIDTH;
	lv.fmt = LVCFMT_LEFT;
	lv.cx = m_nWidth;
	lv.pszText = (LPTSTR)LPCTSTR(m_sName);
	VERIFY( -1 != pLC->InsertColumn(0, &lv)); // DO WE NEED THE SUBITEM SPECIFIED?
}

CGuruColumn::CGuruColumn(LPCTSTR pszTitle, int nWidth, DWORD flags)
: m_sName(pszTitle),
	m_nWidth(nWidth),
	m_dwFlags(flags)
{
}

// this is separated from Create() because when this is used in a dialog, subclassing
// a dialog control, Create isn't called.  THe dialog class can call this in OnInitDialog()

void CEditListCtrl::finishCreate()
{

	// haven't implemented support for this yet SetExtendedStyle(LVS_EX_HEADERDRAGDROP );

	makeImageList();
	makeColumns();
	forceRowHeightRecalc();

	// Change the font size to that of the largest font we're going to show, so that
	// the row height will be large enough. NEEDS WORK!

/*	if(m_dwFlags & MULTIPLE_FONTS)
	{
		// BUGs: This always switches us to the heavy (system?) font, whether we do a GetFont()
		// or ask explictly for ANSI_VAR_FONT
		// Something about the GetLogFont / CreateFontIndirect changes the font, not just the parameters you changed
		CFont* pFont;// = GetFont();
		pFont = GetFont(); //CFont::FromHandle( (HFONT) GetStockObject(ANSI_VAR_FONT));//ANSI_FIXED_FONT));
		LOGFONT lgFont;
		pFont->GetLogFont(&lgFont);
		lgFont.lfHeight = getLargestFontHeight();
		lgFont.lfWidth=0; // make proportional to the new heigh
		CFont f;
		f.CreateFontIndirect(&lgFont);
		SetFont(&f);
	}
*/
}

//void CEditListCtrl::OnContextMenu(CWnd* pWnd, CPoint point)
//{
//	// TODO: Add your message handler code here
//
//}

LPARAM CEditListCtrl::getFirstSelectedItemData(int* pIndex /*=NULL*/)
{
	POSITION pos = GetFirstSelectedItemPosition();
	int iFirst = GetNextSelectedItem(pos);

	if(pIndex)
	{
		*pIndex = iFirst;
	}

	if(iFirst < 0)
		return NULL;
	return GetItemData(iFirst);
}



// this  is here because I can't figure out which windows message to intercept that
// will be at the right time for an initial sort
void CEditListCtrl::initialSort()
{
	if(!(m_dwFlags & ALLOW_SORTING))
		return;

	if(m_nSortedCol > -1)	// subclass may have set this for an initial sort order
			sortItems();

}

void CEditListCtrl::OnDblclk(NMHDR* pNMHDR, LRESULT* pResult)
{
	int index;
	LPARAM lp = getFirstSelectedItemData(&index);
	if(lp)
		activateItem(lp, index);
	else if(m_dwFlags & DOUBLE_CLICK_NEW)
		addNewItem();

	*pResult = 0;
}

// called when the user double clicks on an item or when they press Return on one
// subclasses must override to do anything
void CEditListCtrl::activateItem(LPARAM lpItem, int index)
{
	TRACE(_T("Subclass of CEditListCtrl must override activateItem if you want it to do something"));
}

void CEditListCtrl::OnKeydown(NMHDR* pNMHDR, LRESULT* pResult)
{
	LV_KEYDOWN* pLVKeyDow = (LV_KEYDOWN*)pNMHDR;

	int iItem;
	LPARAM p = getFirstSelectedItemData(&iItem);
	if(!p)
		return;

	if (pLVKeyDow->wVKey == VK_DELETE)
		deleteItem(p, iItem);
	else if(pLVKeyDow->wVKey == VK_RETURN)
		activateItem(p, iItem);
	else // this is a hack to make up for my inability to do a popup menu insed a listctrl inside a dialog
		keyPressedOnItem(pLVKeyDow, p, iItem);
//		;

	*pResult = 0;
}

void CEditListCtrl::deleteItem(LPARAM pItem, int nItem)
{
	TRACE(_T("Subclass of CEditListCtrl must override deleteItem if you want it to do something"));
}

void CEditListCtrl::keyPressedOnItem(LV_KEYDOWN *pLVKeyDow, LPARAM p, int iItem)
{
// this base class does nothing
}

//subclass must override
// used when the user double-clicks below all existing rows
// enabled by DOUBLE_CLICK_NEW
void CEditListCtrl::addNewItem()
{
	AfxMessageBox(_T("Subclass of CEditListCtrl must override addNewItem since DOUBLE_CLICK_NEW is specified"));
}



int CEditListCtrl::getLargestFontHeight()
{
	AfxMessageBox(_T("Since subclass of CEditListCtrl has set the flag MULTIPLE_FONTS, it must override getLargestFontHeight()"));
	return 12;
}

// from codeguru.com "Changing row height in owner drawn control"
LRESULT CEditListCtrl::OnSetFont(WPARAM wParam, LPARAM)
{	LRESULT res =  Default();
	forceRowHeightRecalc();
	return res;
}

// from codeguru.com "Changing row height in owner drawn control"
void CEditListCtrl::MeasureItem ( LPMEASUREITEMSTRUCT lpMeasureItemStruct )
{
	//LOGFONT lf;
	//GetFont()->GetLogFont( &lf );
	int h = getLargestFontHeight();

	// I don't know the correct formula for computing the height; it is some
	// combination of text, icon height, maybe a margin too?
	// To Do: look into using GetTextMetrics()

	h=int(ceil(1.2*h));

	if( abs(h)< 16 /*icon height*/)
		h=16;

	if( h < 0 )
		lpMeasureItemStruct->itemHeight = -h;
	else
		lpMeasureItemStruct->itemHeight = h;
}


// from codeguru.com "Changing row height in owner drawn control"
void CEditListCtrl::forceRowHeightRecalc()
{
	if(!m_hWnd)
		return;

	CRect rc;
	GetWindowRect( &rc );
	WINDOWPOS wp;
	wp.hwnd = m_hWnd;
	wp.cx = rc.Width();
	wp.cy = rc.Height();
	wp.flags = SWP_NOACTIVATE | SWP_NOMOVE | SWP_NOOWNERZORDER | SWP_NOZORDER;
	SendMessage( WM_WINDOWPOSCHANGED, 0, (LPARAM)&wp );
}
