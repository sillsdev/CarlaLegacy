// CWListCtrl.cpp : implementation file
//
// jdh 6/2/99 patch over a bug in MFC related to long strings in lists
// jdh 6/2/99 fixed failed assertion when you try to drag an environment line
// jdh 8/30/99 fixed comment column display on win 98
// 1.7a1 03-Dec-1999 hab Added test data
// jdh 21June2000 made double-click work for manualParseDlg
// 2.4.1 20-Oct-2000 hab Do not do in-place edit on comments and test data

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "CWListCtrl.h"
#include "TabbedTreeDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#include "CWListView.h"
#include "CWList.h"
#ifndef hab218
#include "DlgManualParseChoice.h"
#include "QuickParseDoc.h"
#endif // hab218

#ifndef hab241
#include "ListComment.h"
#include "ListTestData.h"

const int kCommentEntryKind = 99;
const int kTestDataEntryKind = 98;
#endif // hab241

/******* TO DO ********
DONE Make owner drawn line up w/ edit boxes
DONE Make editing set the modified flag
DONE Make label edits (column 0) use existing text
DONE Make multiline edits
DONE Make use right font
DONE Double Click
DONE Drag & Drop
DONE View must tell us about moves
Verification before ending edit
Make edits work right (hard??)
	Clicking in edit box
	allow box to grow or autohscroll
*/
/////////////////////////////////////////////////////////////////////////////
// CWListCtrl

CWListCtrl::CWListCtrl()
{
	// can't support sorting until all of our code doesn't assume a correspondance
	// between the display-order and the underlying data order
	m_dwFlags &= ~ (ALLOW_SORTING );

	// we can't get at our parent yet becase MFC would squawk.  We can't
	// get it through a parameter because... well, trust me.  So we do this somewhere else, later.

//	if(pList->getLangFont())
//		m_dwFlags |= MULTIPLE_FONTS;

}

CWListCtrl::~CWListCtrl()
{
}


BEGIN_MESSAGE_MAP(CWListCtrl, CEditListCtrl)
	//{{AFX_MSG_MAP(CWListCtrl)
		ON_NOTIFY_REFLECT(LVN_GETDISPINFO, OnGetdispinfo)
	ON_WM_PARENTNOTIFY()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

// This is a callback from the listctrl
void CWListCtrl::OnGetdispinfo(NMHDR* pNMHDR, LRESULT* pResult)
{
	LV_DISPINFO* pnmv = (LV_DISPINFO*)pNMHDR;

	// Provide the item or subitem's text, if requested.
	if (pnmv->item.mask & LVIF_TEXT)
	{
	   CWListEntry *pEntry = (CWListEntry *) (pnmv->item.lParam);

	   // jdh 6/2/99 patch over a bug in MFC which leads to a failed assertion
	   // if the string has more than 127 or 128 chars
	   CString s=pEntry->getText(pnmv->item.iSubItem);
		if(s.GetLength() >= 127)
			s.SetAt(126, '\0');

		lstrcpy(pnmv->item.pszText, s);
	}

	*pResult = 0; //	THIS WAS PUT HERE BY THE WIZARD
}


/////////////////////////////////////////////////////////////////////////////
// CWListCtrl message handlers
// we have this lower-case version because
//	CListCtrl::GetItemText doesn't appear to be virtual
CString CWListCtrl::getItemText(int nItem, int nCol)
{
	CWListRowItem* pItem = (CWListRowItem*)GetItemData(nItem);
	ASSERTX(pItem);
	return pItem->getText(nCol);
}

// virtual override which steers this job to the owning view,
// since that where I had initially implemented it before
// switching to this fancy sub-item-editable list view
void CWListCtrl::DrawItem(LPDRAWITEMSTRUCT lpdis)
 {
	CEditListCtrl::DrawItem(lpdis);
/*
	HFONT hfntPrev=0;
	COLORREF clrPrevText, clrPrevBkgnd;
	int prevBkMode;

	//CLangModelsDoc* pDoc = (CLangModelsDoc* )getParent()->GetDocument();
	//ASSERTX(pDoc->IsKindOf(RUNTIME_CLASS(CLangModelsDoc)));

	CWListRowItem* pRI = (CWListRowItem*)lpdis->itemData;
	ASSERTX(pRI->IsKindOf(RUNTIME_CLASS(CWListRowItem)));

	LV_ITEM itemStruct;
	itemStruct.iItem = lpdis->itemID;
	itemStruct.mask = LVIF_IMAGE;
	ASSERTX(GetItem(&itemStruct));

	CImageList* pImages = GetImageList(LVSIL_STATE);
	ASSERTX(pImages);

	CDC* pCDC = CDC::FromHandle(lpdis->hDC);
	switch(lpdis->itemAction)
	{
		case ODA_SELECT:
		case ODA_DRAWENTIRE:
		{
			CPoint imagePoint(lpdis->rcItem.left, lpdis->rcItem.top);
			int iWhich = itemStruct.iImage >> 12;

			if(!pRI->m_bEnabled)
				pImages->Draw(pCDC, 1, imagePoint, ILD_TRANSPARENT);

			DWORD a = COLOR_HIGHLIGHTTEXT;
			DWORD b = GetSysColor(COLOR_HIGHLIGHT);
			if (lpdis->itemState & ODS_SELECTED)
			{
				prevBkMode = ::SetBkMode(lpdis->hDC, OPAQUE);
				clrPrevText = ::SetTextColor(lpdis->hDC,
						GetSysColor(COLOR_HIGHLIGHTTEXT));
				clrPrevBkgnd = SetBkColor(lpdis->hDC,
						GetSysColor(COLOR_HIGHLIGHT));
			}
			else
			{
				prevBkMode = ::SetBkMode(lpdis->hDC, OPAQUE);
				clrPrevText = ::SetTextColor(lpdis->hDC,
						GetSysColor(COLOR_WINDOWTEXT));
				clrPrevBkgnd = ::SetBkColor(lpdis->hDC,
						GetSysColor(COLOR_WINDOW));
			}

			// DRAW THE VARIOUS COLUMNS
			const int kIconWidth=20;
			int xStart=0;
			for(int c=0; c<m_pList->getColumnCount(); c++)
			{
				CRect r;
				if( c>0)
					xStart += GetColumnWidth(c-1);
				int iLeft = lpdis->rcItem.left+xStart;
				if(c==0)
					iLeft += kIconWidth;

				int iRight = iLeft+GetColumnWidth(c) - 5; // column margin
				if(c==0)
					iRight -= kIconWidth;

				// take the lesser of what room we want an what we have (different where the right edge of the view cuts off the column)
				iRight = (iRight<lpdis->rcItem.right)?iRight:lpdis->rcItem.right;

				r.SetRect(
					iLeft,
					lpdis->rcItem.top,
					iRight,
					lpdis->rcItem.bottom);

				if(m_pList->getUseLangFontInColumn(c))
				{
					CFont* pF = getParent()->getLangFont();
					hfntPrev = (HFONT) 	SelectObject(lpdis->hDC, *pF);
					ASSERTX(hfntPrev);
				}
				int offset = pCDC->GetTextExtent(_T(" "), 1 ).cx*2; // from codeguru article "selection highlighting of an entire row"
				r.left += offset;
				r.right -= offset;

				CString s = pRI->getText(c);
				//r.right -= 10; // just a margin between columns


			// !!!!this DT_END_ELLIPSIS doesn't truncate with some strings!!!!
 //			TRACE("draw item:%s [%d]\n",s, r.left);
				DrawText(
					lpdis->hDC, 	// handle to device context
					s, 	// pointer to string to draw
					-1, // string length, in characters, -1 means null-terminated
					&r , 	// pointer to structure with formatting dimensions
					DT_SINGLELINE  | DT_VCENTER    | DT_END_ELLIPSIS |DT_NOPREFIX	// text-drawing flags
					);
				if(hfntPrev) // restore the previous font
					SelectObject(lpdis->hDC, hfntPrev);
			}
			// is it selected?
			//if (lpdis->itemState & ODS_SELECTED)
			//	DrawFocusRect(lpdis->hDC, &lpdis->rcItem);
		   // Set the appropriate foreground and background colors.
		}
		break;
		default:
			break;
	}
	::SetTextColor(lpdis->hDC, clrPrevText);
	 ::SetBkColor(lpdis->hDC, clrPrevBkgnd);
	::SetBkMode(lpdis->hDC, prevBkMode);
 */
}

// virtual override needed because we don't store the text in the list item itself
void CWListCtrl::setItemText(int nItem, int nSubItem, LPCTSTR pszText)
{
	CWListRowItem* pItem = (CWListRowItem*)GetItemData(nItem);
	ASSERTX(pItem);
	 pItem->setText(nSubItem, pszText);
}

CWListView* CWListCtrl::getParent()
{
	CWListView* pParent = (CWListView*)GetParent();
#ifndef hab218
	ASSERTX(pParent->IsKindOf(RUNTIME_CLASS(CWListView)) ||
		pParent->IsKindOf(RUNTIME_CLASS(CDlgManualParseChoice)));
#else // hab218
	ASSERTX(pParent->IsKindOf(RUNTIME_CLASS(CWListView)));
#endif // hab218
	return pParent;
}

//virtual override to move the item in our array and in the list
// called after a successful drag and drop
void CWListCtrl::finishDrag(int iFrom, int iTo)
{
	CWListRowItem *p = (CWListRowItem *) GetItemData(iFrom);
	ASSERTX(p);

	// JDH 6/2/99 changed this check from an assert, so that if the user
	// drags a ListRowItem that is not an entry (e.g. an environment), we
	// just ignore the drag
	if(!p->IsKindOf(RUNTIME_CLASS(CWListEntry)))
		return;

	{
		CWListEntry *pEntry = (CWListEntry *) p;
		pEntry->doMoveToSlot(*this, iTo);
		listModified();
		this->SetItemState(iTo, LVIS_SELECTED, LVIS_SELECTED);
		this->RedrawItems(iFrom<iTo?iFrom:iTo, this->GetItemCount()+1);
	}

//	CEditListCtrl::finishDrag(iFrom, iTo);// actually fix the display list now
}

void CWListCtrl::listModified()
{
#ifndef hab218
	CWListView *pParent = getParent();
	if (!pParent->IsKindOf(RUNTIME_CLASS(CDlgManualParseChoice)))
	  ((CTabbedTreeDoc*)pParent->GetDocument())->SetModifiedFlag(TRUE);
#else // hab218
	((CTabbedTreeDoc*)getParent()->GetDocument())->SetModifiedFlag(TRUE);
#endif // hab218
}

#ifndef hab241
int CWListCtrl::getItemType(int nItem)
{
  CWListRowItem* pItem = (CWListRowItem*)GetItemData(nItem);
  if (pItem->IsKindOf(RUNTIME_CLASS(CListEntryComment)))
	return kCommentEntryKind;
  else if (pItem->IsKindOf(RUNTIME_CLASS(CListEntryTestData)))
	return kTestDataEntryKind;
  else
	return 0;
}
#endif // hab241

//virtual override since we can have different fonts for different columns
CFont* CWListCtrl::getFontForSubItem(int nItem, int nCol)
{
	static CFont fntNotEditable;

#ifndef hab218
				// it'd sure be nice if there were an easier
				// way...
	ASSERT(getParent());
	CWListView *pParent = getParent();
	CWList * pList;
	if (pParent->IsKindOf(RUNTIME_CLASS(CDlgManualParseChoice)))
	  {
		CDlgManualParseChoice * pDlg = (CDlgManualParseChoice *)pParent;
		pList = pDlg->m_pList;
	  }
	else
	  {
		pList = pParent->m_pList;
	  }
	ASSERT(pList);
	if(pList->getUseLangFontInColumn(nCol))
	  {
		CFont* pF;
		if (pParent->IsKindOf(RUNTIME_CLASS(CDlgManualParseChoice)))
		  {
		CDlgManualParseChoice * pDlg = (CDlgManualParseChoice *)pParent;
		pF = pDlg->getLangFont();
		  }
		else
		  pF = pParent->getLangFont();
		ASSERT(pF);
		return pF;
	  }
#else // hab218
	ASSERT(getParent());
	ASSERT(getParent()->m_pList);
	if(getParent()->m_pList->getUseLangFontInColumn(nCol))
	{
		CFont* pF = getParent()->getLangFont();
		ASSERT(pF);
		return pF;
	}
#endif //hab218
		// if not editable
/*	else if(! (getParent()->m_pList->m_dwEditableColumns & (1 << nCol)))
	{
		//fntNotEditable.FromHandle((HFONT)GetStockObject(ANSI_FIXED_FONT));
		if(!HFONT(fntNotEditable))
		{
			CFont* pf = GetFont();
			LOGFONT lf;
			pf->GetLogFont(&lf);
			lf.lfItalic=TRUE;
			fntNotEditable.CreateFontIndirect(&lf);
			//fntNotEditable.CreateFont(lf.lfHeight ,0,0,0,0,TRUE,0,0,ANSI_CHARSET,0,0,0,lf.lfPitchAndFamily ,lf.lfFaceName);
		}
		return &fntNotEditable;
		//return getParent()->getLangFont();
	}
*/	else
		return GetFont();

}

//DEL BOOL CWListCtrl::OnChildNotify(UINT message, WPARAM wParam, LPARAM lParam, LRESULT* pLResult)
//DEL {
//DEL 	// TODO: Add your specialized code here and/or call the base class
//DEL
//DEL 	return CEditListCtrl::OnChildNotify(message, wParam, lParam, pLResult);
//DEL }

//DEL BOOL CWListCtrl::OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult)
//DEL {
//DEL 	// TODO: Add your specialized code here and/or call the base class
//DEL
//DEL 	return CEditListCtrl::OnNotify(wParam, lParam, pResult);
//DEL }
#include "InPlaceEdit.h"

void CWListCtrl::OnParentNotify(UINT message, LPARAM lParam)
{
	// none of this worked to fix the bug where clicking in an inPlaceEdit causes it to loose focus and die.
	//  Even if I caught the message and didn't pass it on, the edit box would still close
/*	if(message == WM_LBUTTONDOWN)
		if(m_pEditCtrl)
		{
			// didn't helpSendChildNotifyLastMsg();
			CPoint p(lParam);
//			m_pEditCtrl->buttonDown(p);
			return;
		}

*/

	CEditListCtrl::OnParentNotify(message, lParam);

	// TODO: Add your message handler code here

}

// override
// called when the user double clicks on an item or (eventually) when they press Return on one
void CWListCtrl::activateItem(LPARAM lpItem, int index)
{
	//if(((CWListRowItem*)lpItem)->doEditDialog(*this))
	//{
	//	Update(index);
	//	listModified();
	//}

#ifndef hab218
	CWListView *pParent = getParent();
	if (pParent->IsKindOf(RUNTIME_CLASS(CDlgManualParseChoice)))
		((CDlgManualParseChoice*)pParent)->OnOK();	// jdh 21June2000
	else
	  pParent->OnEditProperties();
#else // hab218
	getParent()->OnEditProperties();
#endif // hab218
}


// override
void CWListCtrl::makeImageList()
{
#ifndef hab218
	CWListView *pParent = getParent();
	if (pParent->IsKindOf(RUNTIME_CLASS(CDlgManualParseChoice)))
	  {
		return;
	  }
#endif // hab218
	if(getParent()->m_pList->getLangFont())	/// just a convenient place to get this done
		m_dwFlags |= MULTIPLE_FONTS;


/*	THIS DIDN'T WORK (AND WASN'T NEEDED)
	Because, surprisingly, the header uses the imagelist of the ctrl, not its own
	image list (so why does it have one? you ask)

	 // make a list for the header control to show the little pencil on editable columns
	m_headerctrl.m_ximageList.m_hImageList=NULL; // there's a compiler/mfc problem where this is set to cdcdcdcd and mfc squawks because it isn't null
	m_headerctrl.m_ximageList.Create(GetSystemMetrics(SM_CXSMICON),
		GetSystemMetrics(SM_CYSMICON), TRUE, 1, 1);

	HICON hiconItem;        // icon for list view items
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_Editable));
	m_headerctrl.m_ximageList.Add(hiconItem);
	DeleteObject(hiconItem);

	// our header control may not have been subclassed yet
	CHeaderCtrl* pHeader =(CHeaderCtrl*)GetDlgItem(0);
	pHeader->SetImageList( &m_headerctrl.m_ximageList);

*/
	// make our image list for the list items

/*	m_imageList.Create(GetSystemMetrics(SM_CXSMICON),
		GetSystemMetrics(SM_CYSMICON), TRUE, 10, 1);

	HICON hiconItem;        // icon for list view items
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_GenericListItem));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_MorphEnvironment));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_StringEnvironment));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	// make the "disabled" overlay icon
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_DisabledOverlay));

	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	m_imageList.SetOverlayImage( 3, // the 4th image is #3(zero-based) in the list
								1);	// is the overlay image #1 (one-based).


	// with all this bitmap stuff I was trying to get the darn thing to show transparently,
	// but it instead is invisible when a bitmap instead of an icon.  I also tried using
	// LoadImage(... LR_LOADTRANSPARENT) on the icon (instead of the bitmap) to no avail.

	// 	CBitmap* bmp = new CBitmap();
//	bmp.FromHandle( (HBITMAP)
//		LoadImage (AfxGetInstanceHandle (),MAKEINTRESOURCE (IDB_Editable),
//			IMAGE_BITMAP,0,0,LR_LOADTRANSPARENT));		// TRANSPARENT DOESN'T ACTUALLY WORK


//	bmp->LoadBitmap(IDB_Editable);
//	m_imageList.Add(bmp, RGB(0,0,0));//RGB(255,255,255)/*mask color);

	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_Editable));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	// SPECIAL ICONS FOR VARIOUS TYPES


	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_STAMPFlag));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_GenericListItemB));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);
*/
	int ids[] = {IDI_GenericListItem0,IDI_MorphEnvironment,IDI_StringEnvironment,
				IDI_DisabledOverlay, IDI_Editable, IDI_STAMPFlag, IDI_GenericListItem1,
				IDI_GenericListItem2,
				IDI_SENTRANSLimit, IDI_SENTRANSBegin, IDI_SENTRANSEnd, IDI_SENTRANSRulesOn, IDI_SENTRANSRulesOff,
				IDI_CommentListItem, IDI_TestDataListItem};

	m_imageList.Create(GetSystemMetrics(SM_CXSMICON),
		GetSystemMetrics(SM_CYSMICON), TRUE, sizeof(ids), 1);

	for(int i=0; i< sizeof(ids); i++)
	{
		HICON hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(ids[i]));
		m_imageList.Add(hiconItem);
		DeleteObject(hiconItem);
	}

	m_imageList.SetOverlayImage( 3, // the 4th image is #3(zero-based) in the list
							1);	// is the overlay image #1 (one-based).

	SetImageList( &m_imageList, LVSIL_SMALL);
}

// override
void CWListCtrl::addNewItem()
{
#ifndef hab218
	CWListView *pParent = getParent();
	if (!pParent->IsKindOf(RUNTIME_CLASS(CDlgManualParseChoice)))
	  pParent->OnEditInsertEntry();
#else // hab218
	getParent()->OnEditInsertEntry();
#endif // hab218
}
// override
int CWListCtrl::getLargestFontHeight()
{
	int langFontHeight=0;
	int defaultFontHeight=0;
	LOGFONT lf;

#ifndef hab218
	CWListView *pParent = getParent();
	CFont* pf;
	if (pParent->IsKindOf(RUNTIME_CLASS(CDlgManualParseChoice)))
	  {
		CDlgManualParseChoice * pDlg = (CDlgManualParseChoice *)pParent;
		pf = pDlg->getLangFont();
	  }
	else
	  pf = pParent->m_pList->getLangFont();
#else // hab218
	CFont* pf = getParent()->m_pList->getLangFont();
#endif // hab218
	if(pf)
	{
		pf->GetLogFont(&lf);
		langFontHeight = abs(lf.lfHeight);
	}

	pf = GetFont(); // default font of this list
	pf->GetLogFont(&lf);
	defaultFontHeight = lf.lfHeight;

	// return the larger of the two
	return (abs(langFontHeight)>abs(defaultFontHeight)?langFontHeight:defaultFontHeight);
}

#ifndef hab17a1
#include "ListTestData.h"
#endif //hab17a1
#include "ListComment.h" // so we can check if this is a comment we're drawing
//#include "CarlaLanguage.h" // so we can get at the comment character

static CString formatForSingleLine(LPCTSTR szIn, char cCommentChar);

void CWListCtrl::drawItemText(CDC *pDC, int nRow, int nCol, LPCTSTR pszStr, CRect &rect, UINT nJustifyFlag)
{
	COLORREF oldTextColor = NULL;
	CWListRowItem* pItem = (CWListRowItem*)this->GetItemData(nRow);
	CString sText;

	//this was leading to an unhandled exception & I don't feel like spending any more time on it at the moment
	//char cCommentChar = ((CCarlaLanguage*)getParent()->GetDocument())->getCommentChar();
	char cCommentChar = '|';

	// change parameters for full-line comments if that's what we have
	if(pItem->IsKindOf(RUNTIME_CLASS(CListEntryComment)))
	{
		CRect rcBounds;
		GetItemRect(nRow, rcBounds, LVIR_BOUNDS);
		rect.right=rcBounds.right; // take up the full width

		// Set clip region
		CRgn rgn;
		rgn.CreateRectRgnIndirect(&rcBounds);
		pDC->SelectClipRgn(&rgn);
		rgn.DeleteObject();

		oldTextColor = pDC->SetTextColor(RGB(0, 0 ,255) );
		nCol = -1; // signal that this is a commentline, so the correct font is chosen
		pszStr = sText = formatForSingleLine(pszStr, cCommentChar);
	}
#ifndef hab17a1
	else if(pItem->IsKindOf(RUNTIME_CLASS(CListEntryTestData)))
	{
		CRect rcBounds;
		GetItemRect(nRow, rcBounds, LVIR_BOUNDS);
		rect.right=rcBounds.right; // take up the full width

		// Set clip region
		CRgn rgn;
		rgn.CreateRectRgnIndirect(&rcBounds);
		pDC->SelectClipRgn(&rgn);
		rgn.DeleteObject();

		oldTextColor = pDC->SetTextColor(RGB(0, 0 , 150) );
		nCol = -2; // signal that this is a test data line, so the correct font is chosen
		pszStr = sText = formatForSingleLine(pszStr, cCommentChar);
	}
#endif //hab17a1
	else if (nCol > 0) // don't bother filtering labels
	{
		// strip out inline comments and returns
		pszStr = sText = formatForSingleLine(pszStr, cCommentChar);
	}

	CFont* pf= getFontForSubItem(nRow, nCol);	// allows each column, or even individual items to have different fonts
	CGdiObject* pOldFont = pDC->SelectObject(pf);


	if(!pItem->m_bEnabled						// the item is not enabled
		||!pItem->owningEntry()->m_bEnabled)	// its owner is not enabled
		oldTextColor = pDC->SetTextColor(RGB(150,150,150) );

/* i'd started on this but not finished.  the idea was to display, somehow, that
the environment was disabled if it was, but in the same column as and enabled rule.
	else if(pItem->IsKindOf(RUNTIME_CLASS(CWEnvironConstrainedRule)))
	{
		CWEnvironConstrainedRule* pRule= (CWEnvironConstrainedRule*)pItem;
		if(nCol == pRule->m_iColumnForEnv)
		{
			CWE pRule->getEnvironment
		}

	}
*/	pDC->DrawText(pszStr, -1, rect, nJustifyFlag | DT_SINGLELINE |
					DT_NOPREFIX | DT_VCENTER | DT_END_ELLIPSIS);

	pDC->SelectObject(pOldFont);
	if(oldTextColor)
		pDC->SetTextColor(oldTextColor);
}

CString formatForSingleLine(LPCTSTR szIn, char cCommentChar)
{
	CString s;
	size_t length = _tcslen(szIn);
	LPTSTR x  = s.GetBufferSetLength(length+1);
	LPCTSTR p = szIn;
	while(*p)
	{
		if(*p=='\r' || *p=='\n')
		{
			if(*(x-1) !=' ') // don't want more than one space to appear
				*(x++) =' ';
		}
		else if(*p==cCommentChar) // don't show in-line comments
		{
			while(*p && *p!='\r' && *p!='\n') // skip to end of line
			{
					++p;
					if(!*p) // don't want to swallow up terminator
					{
						--p;
						break;
					}
			}
		}
		else
			*(x++) =*p;

		++p;
	}
	*x = '\0';
	s.ReleaseBuffer();

	return s;
}
