// CWListView.cpp : implementation file
//
// JDH 5/25/99 3:34:30 PM Added List Comment Capbility (\co)
// 1.7a1 03-Dec-1999 hab Have the Edit/Delete menu item *not* show the
//                       display name of the item (because the selected
//                       item could be a comment or test data).
//                       Added test data.
// 2.1.1 09-Mar-2000 hab Allow full line comments and test data in monads
// 2.1.4 22-Mar-2000 hab Allow editing of full line comments and test data
// 2.4.1 20-Oct-2000 hab Edit Menu now shows the keyboard shortcut of CTRL-I
//                       for all edit/insert items

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "CWListView.h"
//#include "ProjectDoc.h"
#include "CWTopic.h"
//#include "TabbedTreeDoc.h"
#include "LangModelsDoc.h"
#ifndef hab214
#include "ListComment.h"
#include "ListTestData.h"
#endif //hab214

// REMOVE !!!!!!!!!!!!!!!!!!!!!!!!!!!
#include <strstrea.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CWTopic* gTopicForViewCreation; // here 'cause SPLITTER:CreateView doesn't let us pass any parameters to the constructor of the view
#define ID_ListCTRL 3999

const int kCommentEntryKind = 99;
#ifndef hab17a1
const int kTestDataEntryKind = 98;
#endif //hab17a1

/////////////////////////////////////////////////////////////////////////////
// CWListView


IMPLEMENT_DYNCREATE(CWListView, CView)


CWListView::CWListView()
:	CView(),//AfxRegisterWndClass(NULL),WS_CHILD | WS_VISIBLE),
	m_bDragging(FALSE),
	m_pimageListDrag (NULL),
	//m_iClipboardOperation(NULL),
	m_iUndoRow(-1),
	m_pClipboardRowItem(NULL),
	m_pUndoRowItem(NULL),
	m_iUndoOperation(NULL)
//	m_pListCtrl(NULL)
{
	if(gTopicForViewCreation)
	{
		ASSERTX(gTopicForViewCreation->IsKindOf(RUNTIME_CLASS(CWListTopic)));
		m_pTopic  =  (CWListTopic*) gTopicForViewCreation;
		m_pList = m_pTopic->m_pList;
		ASSERTX(m_pList);
	}
	else
	{
		TRACE ("WARNING: gTopicForViewCreation == 0\n");
		m_pList= NULL;
	}
}

CWListView::~CWListView()
{
	if(m_pClipboardRowItem)
		delete m_pClipboardRowItem;
	if(m_pUndoRowItem)
		delete m_pUndoRowItem;
//	if(m_pListCtrl)
//		delete m_pListCtrl;
}



BEGIN_MESSAGE_MAP(CWListView, CView)
	//{{AFX_MSG_MAP(CWListView)
	ON_COMMAND(ID_Edit_Insert_Entry, OnEditInsertEntry)
	ON_COMMAND(ID_EDIT_insert_environ, OnEditInsertEnviron)
	ON_UPDATE_COMMAND_UI(ID_EDIT_insert_environ, OnUpdateEditInsertEnviron)
	ON_COMMAND(ID_EDIT_Insert_Comment, OnEditInsertComment)
	ON_UPDATE_COMMAND_UI(ID_EDIT_Insert_Comment, OnUpdateEditInsertComment)
#ifndef hab17a1
	ON_COMMAND(ID_EDIT_Insert_TestData, OnEditInsertTestData)
	ON_UPDATE_COMMAND_UI(ID_EDIT_Insert_TestData, OnUpdateEditInsertTestData)
#endif //hab17a1

	ON_COMMAND(ID_Edit_Delete, OnEditDelete)
	ON_UPDATE_COMMAND_UI(ID_Edit_Delete, OnUpdateEditDelete)
	ON_UPDATE_COMMAND_UI(ID_Edit_Insert_Entry, OnUpdateEditInsertEntry)
	ON_COMMAND(ID_edit_insert_secondary, OnEditInsertSecondary)
	ON_UPDATE_COMMAND_UI(ID_edit_insert_secondary, OnUpdateEditInsertSecondary)
	ON_COMMAND(ID_EDIT_COPY, OnEditCopy)
	ON_UPDATE_COMMAND_UI(ID_EDIT_COPY, OnUpdateEditCopy)
	ON_COMMAND(ID_EDIT_PASTE, OnEditPaste)
	ON_UPDATE_COMMAND_UI(ID_EDIT_PASTE, OnUpdateEditPaste)
	ON_COMMAND(ID_EDIT_CUT, OnEditCut)
	ON_UPDATE_COMMAND_UI(ID_EDIT_CUT, OnUpdateEditCut)
	ON_COMMAND(ID_EDIT_UNDO, OnEditUndo)
	ON_UPDATE_COMMAND_UI(ID_EDIT_UNDO, OnUpdateEditUndo)
	ON_UPDATE_COMMAND_UI(ID_EDIT_Properties, OnUpdateEditProperties)
	ON_WM_SIZE()
	ON_COMMAND(ID_EDIT_Properties, OnEditProperties)
	ON_WM_DRAWITEM()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CWListView diagnostics

#ifdef _DEBUG
void CWListView::AssertValid() const
{
	CView::AssertValid();
}

void CWListView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}
#endif //_DEBUG


/////////////////////////////////////////////////////////////////////////////
// CWListView message handlers

void CWListView::OnInitialUpdate()
{
	//CView::OnInitialUpdate();
	CView::OnInitialUpdate();
	CRect r;
	GetClientRect(&r);

	m_listCtrl.Create(WS_CHILD | WS_CLIPSIBLINGS | WS_VISIBLE | LVS_SHOWSELALWAYS |
					/*LVS_EDITLABELS |*/ LVS_SINGLESEL | LVS_REPORT | LVS_OWNERDRAWFIXED,
		r, this, ID_ListCTRL);
	m_listCtrl.m_dwColumnEditBitfield = m_pList->m_dwEditableColumns;

//	ListView_SetExtendedListViewStyleEx (m_listCtrl.m_hWnd, LVS_EX_SUBITEMIMAGES, LVS_EX_SUBITEMIMAGES );
	ASSERTX(m_pList);
	//CListCtrl & clc = GetListCtrl( );
/*
	HICON hiconItem;        // icon for list view items
	//HIMAGELIST himlLarge;   // image list for icon view
	//HIMAGELIST himlSmall;   // image list for other views

	// Create the full-sized and small icon image lists.
   // himlLarge = ImageList_Create(GetSystemMetrics(SM_CXICON),
	//    GetSystemMetrics(SM_CYICON), TRUE, 1, 1);
	m_imageList.Create(GetSystemMetrics(SM_CXSMICON),
		GetSystemMetrics(SM_CYSMICON), TRUE, 2, 2); // this last param is a mystery

	// Add an icon to each image list.
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_EnabledListItem));
	//ImageList_AddIcon(himlLarge, hiconItem);
	 m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_DisabledListItem));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	// icons for environments on their own line
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_EnabledEnvItem));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_DisabledEnvItem));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	// Assign the image lists to the list view control.
   // ListView_SetImageList(hwndLV, himlLarge, LVSIL_NORMAL);
	//ListView_SetImageList(hwndLV, himlSmall, LVSIL_SMALL);
	m_listCtrl.SetImageList( &m_imageList, LVSIL_STATE); //LVSIL_SMALL );
*/
	// Should set the font to the largest font that will appear in any column,
	// so that the rows are tall enough (for now, just set to language font, if any)
	// this has the unwanted side-effect that the bold and italic attributes of the language
	// font are also copied by the non-language texts


/*	CLangModelsDoc* pDoc = (CLangModelsDoc* )GetDocument();
	ASSERTX(pDoc);
	CFont* pFont = pDoc->getLangFont();
	if(pFont)
	{
		//get the size of the language font
		LOGFONT lgFont;
		pFont->GetLogFont(&lgFont);
		int iHeight = lgFont.lfHeight;
		// the result of this call is a temporary font, good only until the end of this msg handler
		pFont = CFont::FromHandle( (HFONT) GetStockObject(ANSI_VAR_FONT));//ANSI_FIXED_FONT));
		pFont->GetLogFont(&lgFont);
		lgFont.lfHeight = iHeight;
		CFont f;
		f.CreateFontIndirect(&lgFont);
		m_listCtrl.SetFont(&f);//i'm not clear on whether this font is copied or pointed to
	}
*/

	//m_listCtrl.ModifyStyle(NULL, LVS_SINGLESEL | LVS_REPORT | LVS_OWNERDRAWFIXED);
	m_pList->insertColumns(m_listCtrl);
	restoreHeaderParams();
	m_pList->populateListCtrl(m_listCtrl);

}


//DEL void CWListView::OnDblclk(NMHDR* pNMHDR, LRESULT* pResult)
//DEL {
//DEL 	ASSERT(FALSE); // REMOVE THIS METHOD IF THIS NEVER CALLED
//DEL
//DEL 	HWND hWnd = pNMHDR->hwndFrom;
//DEL 	//	UINT nID;   // = _AfxGetDlgCtrlID(hWndCtrl);
//DEL 	CListCtrl* pCtrl = (CListCtrl*) CWnd::FromHandle(hWnd);
//DEL
//DEL        POINT pointScreen;
//DEL        DWORD dwPos;
//DEL
//DEL        dwPos = GetMessagePos();
//DEL
//DEL        pointScreen.x = LOWORD (dwPos);
//DEL        pointScreen.y = HIWORD (dwPos);
//DEL
//DEL        //pointLVClient = pointScreen;
//DEL 	::MapWindowPoints(
//DEL 		NULL,	// handle of window to be mapped from
//DEL 		hWnd,	// handle of window to be mapped to
//DEL 		&pointScreen,	// address of structure array with points to map
//DEL 		1 	// number of structures in array
//DEL 	);
//DEL 	CPoint pt_local(pointScreen);
//DEL 	pt_local.x = 5;	// it likes clicks on the left edge, not in the middle, so fake it
//DEL 	UINT flags;
//DEL 	int i = pCtrl->HitTest(pt_local, &flags) ;
//DEL
//DEL 	if(i>=0)
//DEL 	{
//DEL 		selectRowItem(i);
//DEL 		OnEditProperties();
//DEL 		/*
//DEL 		// could be a subclass of CWListEntry, an evironment row, or a comment row
//DEL 		CWListRowItem *pRowItem = (CWListRowItem *) pCtrl->GetItemData(i);
//DEL 		if(pRowItem)
//DEL 		{
//DEL 			pRowItem->doEditDialog(*pCtrl);
//DEL 			((CTabbedTreeDoc*)GetDocument())->setModified(TRUE);
//DEL 		}
//DEL 		pCtrl->Update(i);
//DEL 		*/
//DEL 	}
//DEL 	else OnEditInsertEntry();	// double click by itself means "insert entry"
//DEL
//DEL 	*pResult = 0;
//DEL }

int CWListView::getFirstSelectedRow()
{
//	//CListCtrl& clc = GetListCtrl();
	if(!m_listCtrl.GetSelectedCount())
		return -1;
	ASSERTX(m_pList);

	for(int i=0; i< m_listCtrl.GetItemCount(); i++)
		if(m_listCtrl.GetItemState(i, LVIS_SELECTED) == LVIS_SELECTED)
		{
			return i;
		}
	return -1;
}

// not used.  Can be removed.
//DEL void CWListView::OnClick(NMHDR* pNMHDR, LRESULT* pResult)
//DEL {
//DEL 	HWND hWnd = pNMHDR->hwndFrom;
//DEL 	//	UINT nID;   // = _AfxGetDlgCtrlID(hWndCtrl);
//DEL 	CListCtrl* pCtrl = (CListCtrl*) CWnd::FromHandle(hWnd);
//DEL
//DEL        POINT pointScreen, pointLVClient;
//DEL        DWORD dwPos;
//DEL
//DEL        dwPos = GetMessagePos();
//DEL
//DEL        pointScreen.x = LOWORD (dwPos);
//DEL        pointScreen.y = HIWORD (dwPos);
//DEL
//DEL        pointLVClient = pointScreen;
//DEL 	//CPoint pt;
//DEL 	//pt.x = LOWORD (dwPos);
//DEL 	//pt.y = HIWORD (dwPos);
//DEL 	UINT flags;
//DEL //	int i;// = pCtrl->HitTest( pt, &flags) ;
//DEL
//DEL 	::MapWindowPoints(
//DEL 		NULL,	// handle of window to be mapped from
//DEL 		hWnd,	// handle of window to be mapped to
//DEL 		&pointScreen,	// address of structure array with points to map
//DEL 		1 	// number of structures in array
//DEL 	);
//DEL 	CPoint pt_local(pointScreen);
//DEL
//DEL 	int iItem = pCtrl->HitTest(pt_local, &flags) ;
//DEL
//DEL 	if(iItem < 0)	// hit tests only work if the user clicked on an icon or the label
//DEL 	{				// make clicking anywhere else be like clicking on the label
//DEL 		pt_local.x = 30;	// it likes clicks on the left edge, not in the middle, so fake it
//DEL 		iItem = pCtrl->HitTest(pt_local, &flags) ;
//DEL 		pCtrl->SetItemState(iItem, LVIS_SELECTED, LVIS_SELECTED);
//DEL 	}
//DEL
//DEL 	if(iItem>=0)
//DEL 	{
//DEL 		CWListEntry *pEntry = (CWListEntry *) pCtrl->GetItemData(iItem);
//DEL 		if(pEntry)
//DEL 		{
//DEL 		//	this doesn't display the change immediately anyhow, so I disabled it
//DEL 		//	if(flags & LVHT_ONITEMSTATEICON)
//DEL 		//	{
//DEL 		//		int iState = pEntry->toggleEnabled();
//DEL 		//		pCtrl->SetItemState(iItem, iState, LVIF_STATE);
//DEL 		//	}
//DEL 		}
//DEL 		// BUG: NONE OF THIS UPDATING/REPAINTING STUFF WORKS!!!!!!!!!
//DEL 		pCtrl->Update(iItem);	// repaint this item
//DEL 		CWnd* pW = AfxGetMainWnd( );	// try even harder
//DEL 		if(pW)
//DEL 			pW->UpdateWindow();
//DEL 	}
//DEL
//DEL 	*pResult = 0;
//DEL }

void CWListView::OnEditInsertEntry()
{
	//CListCtrl & clc = GetListCtrl( );
	int iAtItem = getFirstSelectedRow();
	if(iAtItem == -1)	// if no selection
		iAtItem = -1; // stick it at the end

	int iRow = m_pList->insertNewItem(m_listCtrl, iAtItem, 0);
	if (iRow==-1)
		return;
	if(! (m_pList->m_dwFlags & CWList::ITEMS_HAVE_DIALOG))
		m_listCtrl.EditSubLabel(iRow, 0); // do in-place edit

	m_listCtrl.RedrawItems(iAtItem, m_listCtrl.GetItemCount());

	GetDocument()->SetModifiedFlag(); //((CTabbedTreeDoc*)GetDocument())->SetModifiedFlag(TRUE);
}

void CWListView::OnUpdateEditInsertEntry(CCmdUI* pCmdUI)
{
#ifndef hab241
		pCmdUI->SetText(LPCTSTR(CString("&Insert ") + m_pList->getDisplayName()) + CString("\tCtrl-I"));
#else // hab241
		pCmdUI->SetText(LPCTSTR(CString("&Insert ") + m_pList->getDisplayName()));
#endif // hab241
}


// JDH 5/25/99 3:34:24 PM Added List Comment Capbility (\co)
void CWListView::OnEditInsertComment()
{
	int iAtItem = getFirstSelectedRow();
	if(iAtItem == -1)	// if no selection
		iAtItem = -1; // stick it at the end

	int iRow = m_pList->insertNewItem(m_listCtrl, iAtItem, kCommentEntryKind);
	if (iRow==-1)
		return;
//	if(! (m_pList->m_dwFlags & CWList::ITEMS_HAVE_DIALOG))
//		m_listCtrl.EditSubLabel(iRow, 0); // do in-place edit

	m_listCtrl.RedrawItems(iAtItem, m_listCtrl.GetItemCount());

	GetDocument()->SetModifiedFlag();
}


// JDH 5/25/99 3:34:21 PM Added List Comment Capbility (\co)
void CWListView::OnUpdateEditInsertComment(CCmdUI* pCmdUI)
{
#ifdef hab211
	// we currently don't support whole-line comments in monads
#endif //hab211 ... now we do
	pCmdUI->Enable(m_pList->m_dwFlags & CWList::SUPPORT_LIST_ENTRY_COMMENTS);
}

#ifndef hab17a1
void CWListView::OnEditInsertTestData()
{
	int iAtItem = getFirstSelectedRow();
	if(iAtItem == -1)	// if no selection
		iAtItem = -1; // stick it at the end

	int iRow = m_pList->insertNewItem(m_listCtrl, iAtItem, kTestDataEntryKind);
	if (iRow==-1)
		return;

	m_listCtrl.RedrawItems(iAtItem, m_listCtrl.GetItemCount());

	GetDocument()->SetModifiedFlag();
}


void CWListView::OnUpdateEditInsertTestData(CCmdUI* pCmdUI)
{
#ifdef hab211
	// we currently don't support whole-line Test Datas in monads
#endif //hab211 ... now we do
	pCmdUI->Enable(m_pList->m_dwFlags & CWList::SUPPORT_LIST_ENTRY_TEST_DATAS);
}
#endif //hab17a1

void CWListView::OnEditInsertEnviron()
{
	//CListCtrl & clc = GetListCtrl( );
	if(!m_listCtrl.GetSelectedCount())
		return; // no selection

	//int iRow = getFirstSelectedRow();
	//if(iRow == -1)
	//	return;
	//CWListRowItem* pItem = (CWListRowItem*)m_listCtrl.GetItemData(iRow);
	CWEnvironConstrainedRule* pRule = (CWEnvironConstrainedRule*) getEntryOfSelection(); //(CWEnvironConstrainedRule*) pItem->owningEntry();
//	ASSERTX( pRule->IsKindOf( RUNTIME_CLASS( CWEnvironConstrainedRule ) ) );
	ASSERTX(pRule);

	pRule->insertEnviron(m_listCtrl);
	m_listCtrl.RedrawItems(getFirstSelectedRow(), m_listCtrl.GetItemCount());
	GetDocument()->SetModifiedFlag();//	((CTabbedTreeDoc*)GetDocument())->setModified(TRUE);
}

CWListEntry* CWListView::getEntryOfSelection()
{
	//CListCtrl & clc = GetListCtrl( );
	int iRow = getFirstSelectedRow();
	if(iRow == -1)
		return NULL;
	CWListRowItem* pItem = (CWListRowItem*)m_listCtrl.GetItemData(iRow);
	ASSERTX(pItem);
	return pItem->owningEntry();
}

void CWListView::OnUpdateEditInsertEnviron(CCmdUI* pCmdUI)
{
	// enable this menu only for entry types that have environments
	//		(tests don't have them, for example)
	//	and the rule already has at least one environment (currently, we require
	//     the first environment to be in the rule
	if(m_pList->getEnvironmentType() && m_listCtrl.GetSelectedCount())
	{
		CWEnvironConstrainedRule* pRule = (CWEnvironConstrainedRule*) getEntryOfSelection();
		ASSERTX(pRule);
		pCmdUI->Enable( pRule->getEnvironmentCount()>0);
	}
	else
		pCmdUI->Enable(FALSE);
}

void CWListView::OnEditDelete()
{
	int iRow = getFirstSelectedRow();
	if (iRow <0)
		return;

	CWListRowItem* pItem = (CWListRowItem*)m_listCtrl.GetItemData(iRow);
	ASSERTX(pItem);
	pItem->deleteSelf(m_listCtrl, m_pList);

	setUndoOperation(ID_Edit_Delete, pItem, iRow);	// store the deleted item for undoing

	//pItem->onEditDelete();
		GetDocument()->SetModifiedFlag();//((CTabbedTreeDoc*)GetDocument())->setModified(TRUE);
}

void CWListView::OnUpdateEditDelete(CCmdUI* pCmdUI)
{
	//CListCtrl& clc = GetListCtrl();
	if(m_listCtrl.GetSelectedCount() == 0)
	{
		pCmdUI->Enable(FALSE);
	}
	else
	{
		pCmdUI->Enable( TRUE );
		int iRow = getFirstSelectedRow();
		ASSERTX(iRow >= 0);
		CWListRowItem* pItem = (CWListRowItem*)m_listCtrl.GetItemData(iRow);
		ASSERTX(pItem);
#ifndef hab17a1
		// just use "Delete Selected Item" since there are now
		// at least two possibilities: the item and comments
#else // hab17a1
		pCmdUI->SetText(LPCTSTR(CString("Delete ") + pItem->getDisplayName()));
#endif //hab17a1
	}
}


//DEL void CWListView::OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint)
//DEL {
//DEL 	CView::OnUpdate(pSender, lHint, pHint);
//DEL }

void CWListView::OnEditInsertSecondary()
{
	int iAtItem = getFirstSelectedRow();
	if(iAtItem == -1)
		iAtItem = -1;

	//CListCtrl & clc = GetListCtrl( );
	BOOL ok = m_pList->insertNewItem(m_listCtrl, iAtItem, 1);
	if (!ok)
		return;
	m_listCtrl.RedrawItems(iAtItem, m_listCtrl.GetItemCount());

		GetDocument()->SetModifiedFlag();//((CTabbedTreeDoc*)GetDocument())->setModified(TRUE);
}

void CWListView::OnUpdateEditInsertSecondary(CCmdUI* pCmdUI)
{
	if(m_pList->haveSecondaryEntryType())
	{
		pCmdUI->Enable(TRUE);
		CString s;
		s.Format("I&nsert %s...", m_pList->getSecondaryEntryTypeDisplayName());
		pCmdUI->SetText(s);
	}
	else
		pCmdUI->Enable(FALSE);
}

/*
// unchanged, copied code
void CWListView::OnBegindrag(LPNMHDR pnmhdr, LRESULT *pResult)
{
	CPoint			ptItem, ptAction, ptImage;
	NM_LISTVIEW		*pnmListView = (NM_LISTVIEW *)pnmhdr;

//	((CListCtrlPage *)GetParent())->ShowNotification(pnmhdr, pResult);
	ASSERTX(!m_bDragging);
	m_bDragging = TRUE;
	m_iItemDrag = pnmListView->iItem;
	ptAction = pnmListView->ptAction;
	//CListCtrl& clc = GetListCtrl();

	m_iItemDrag = pnmListView->iItem;
	m_listCtrl.GetItemPosition(m_iItemDrag, &ptItem);  // ptItem is relative to (0,0) and not the view origin

	m_listCtrl.GetOrigin(&m_ptOrigin);

	m_iDragHorizontalLimit = ptAction.x;	// save this so that we limit the user to up and down dragging
	ASSERTX(m_pimageListDrag == NULL);
	//** CREATE THE DRAGE IMAGE
//	TRACE("---creating drag image:");
	m_pimageListDrag = m_listCtrl.CreateDragImage(m_iItemDrag, &ptImage);
//	TRACE("---done\n");
	m_sizeDelta = ptAction - ptImage;   // difference between cursor pos and image pos
	m_ptHotSpot = ptAction - ptItem + m_ptOrigin;  // calculate hotspot for the cursor
	m_pimageListDrag->DragShowNolock(TRUE);  // lock updates and show drag image
	m_pimageListDrag->SetDragCursorImage(0, m_ptHotSpot);  // define the hot spot for the new cursor image

	m_pimageListDrag->BeginDrag(0, CPoint(0,0));//CPoint(ptAction.x-ptImage.x,ptAction.y-ptImage.y));//CPoint(0, 0));
	ptAction -= m_sizeDelta;
	m_pimageListDrag->DragEnter(this, ptAction);
	m_pimageListDrag->DragMove(ptAction);  // move image to overlap original icon
	SetCapture();
}

//DEL void CWListView::OnMouseMove(UINT nFlags, CPoint point)
//DEL {
//DEL 	long		lStyle;
//DEL 	int			iItem;
//DEL 	LV_ITEM		lvitem;
//DEL 	//CListCtrl& clc = GetListCtrl();
//DEL
//DEL 	lStyle = GetWindowLong(m_hWnd, GWL_STYLE);
//DEL 	lStyle &= LVS_TYPEMASK;  // drag will do different things in list and report mode
//DEL 	if (m_bDragging)
//DEL 	{
//DEL 		point.x = m_iDragHorizontalLimit;	// limit to up and down dragging
//DEL 		ASSERTX(m_pimageListDrag != NULL);
//DEL 		m_pimageListDrag->DragMove(point - m_sizeDelta);  // move the image
//DEL 		if ((iItem = m_listCtrl.HitTest(point)) != -1)
//DEL 		{
//DEL 			m_iItemDrop = iItem;
//DEL 			m_pimageListDrag->DragLeave(this); // unlock the window and hide drag image
//DEL 			if (lStyle == LVS_REPORT || lStyle == LVS_LIST)
//DEL 			{
//DEL 				lvitem.iItem = iItem;
//DEL 				lvitem.iSubItem = 0;
//DEL 				lvitem.mask = LVIF_STATE;
//DEL 				lvitem.stateMask = LVIS_DROPHILITED;  // highlight the drop target
//DEL 				m_listCtrl.SetItem(&lvitem);
//DEL 			}
//DEL
//DEL 			point -= m_sizeDelta;
//DEL 			m_pimageListDrag->DragEnter(this, point);  // lock updates and show drag image
//DEL 		}
//DEL 	}
//DEL
//DEL 	CView::OnMouseMove(nFlags, point);
//DEL }
/*

void CMyListCtrl::OnButtonUp(CPoint point)
{
	if (m_bDragging)  // end of the drag operation
	{
		long		lStyle;
		CString		cstr;

		lStyle = GetWindowLong(m_hWnd, GWL_STYLE) & LVS_TYPEMASK;
		m_bDragging = FALSE;

		ASSERTX(m_pimageListDrag != NULL);
		m_pimageListDrag->DragLeave(this);
		m_pimageListDrag->EndDrag();
		delete m_pimageListDrag;
		m_pimageListDrag = NULL;

		if (lStyle == LVS_REPORT && m_iItemDrop != m_iItemDrag)
		{
			cstr = GetItemText(m_iItemDrag, 0);
			SetItemText(m_iItemDrop, 1, cstr);  // drop subitem text is dragged main item text
		}

		if (lStyle == LVS_LIST && m_iItemDrop != m_iItemDrag)  //add ** to the drop item text
		{
			cstr = GetItemText(m_iItemDrop, 0);
			cstr += _T("**");
			SetItemText(m_iItemDrop, 0, cstr);
		}

		if (lStyle == LVS_ICON || lStyle == LVS_SMALLICON)  // move the icon
		{
			point -= m_ptHotSpot;  // the icon should be drawn exactly where the image is
			point += m_ptOrigin;
			SetItemPosition(m_iItemDrag, point);  // just move the dragged item
		}

		::ReleaseCapture();
	}
}

void CMyListCtrl::OnLButtonUp(UINT nFlags, CPoint point)
{
	OnButtonUp(point);
	CListCtrl::OnLButtonUp(nFlags, point);
}

void CMyListCtrl::OnRButtonUp(UINT nFlags, CPoint point)
{
	OnButtonUp(point);
	CListCtrl::OnRButtonUp(nFlags, point);
}
*/
//DEL void CWListView::OnLButtonDown(UINT nFlags, CPoint point)
//DEL {
//DEL 	// TODO: Add your message handler code here and/or call default
//DEL
//DEL 	CView::OnLButtonDown(nFlags, point);
//DEL }

//DEL void CWListView::OnLButtonUp(UINT nFlags, CPoint point)
//DEL {
//DEL 	OnButtonUp(point);
//DEL
//DEL 	CView::OnLButtonUp(nFlags, point);
//DEL }

/*
void CWListView::OnBegindrag(NMHDR* pnmhdr, LRESULT* pResult)
{
	*pResult = 0;
	m_iItemDrop=-1; // prevents disastrous confusion with accidental near-drags
	// begin what I copied from the  sample code

	CPoint			ptItem, ptAction, ptImage;
	NM_LISTVIEW		*pnmListView = (NM_LISTVIEW *)pnmhdr;
	//CListCtrl& clc = GetListCtrl();

	m_iItemDrag = pnmListView->iItem;
	m_listCtrl.GetItemPosition(m_iItemDrag, &ptItem);  // ptItem is relative to (0,0) and not the view origin
	// Always returns zero in report view
	if(! m_listCtrl.GetOrigin(&m_ptOrigin))
	{
		m_ptOrigin.x = m_ptOrigin.y = 0;
	}
	CWListRowItem *p = (CWListRowItem *) m_listCtrl.GetItemData(m_iItemDrag);
	ASSERTX(p);
	if(!p->IsKindOf(RUNTIME_CLASS(CWListEntry)))
		return;

	//((CListCtrlPage *)GetParent())->ShowNotification(pnmhdr, pResult);
	ASSERTX(!m_bDragging);
	m_bDragging = TRUE;
	ptAction = pnmListView->ptAction;
	e = ptAction.x;
//!!test
//ptAction.x=18;
//end test
	ASSERTX(m_pimageListDrag == NULL);
TRACE("OnBegindrag: CreateDragImage...");
	m_pimageListDrag = m_listCtrl.CreateDragImage(m_iItemDrag, &ptImage);
TRACE("done\n");
	m_sizeDelta = ptAction - ptImage;   // difference between cursor pos and image pos
	m_ptHotSpot = ptAction - ptItem + m_ptOrigin;  // calculate hotspot for the cursor
	m_pimageListDrag->DragShowNolock(TRUE);  // lock updates and show drag image
	m_pimageListDrag->SetDragCursorImage(0, m_ptHotSpot);  // define the hot spot for the new cursor image
	m_pimageListDrag->BeginDrag(0, CPoint(0, 0));
	ptAction -= m_sizeDelta;
	m_pimageListDrag->DragEnter(this, ptAction);
	m_pimageListDrag->DragMove(ptAction);  // move image to overlap original icon
	SetCapture();
}
*/
//DEL void CWListView::OnButtonUp(CPoint point)
//DEL {
//DEL 	if (m_bDragging)  // end of the drag operation
//DEL 	{
//DEL 		long		lStyle;
//DEL 		CString		cstr;
//DEL
//DEL 		lStyle = GetWindowLong(m_hWnd, GWL_STYLE) & LVS_TYPEMASK;
//DEL 		m_bDragging = FALSE;
//DEL
//DEL 		ASSERTX(m_pimageListDrag != NULL);
//DEL 		m_pimageListDrag->DragLeave(this);
//DEL 		m_pimageListDrag->EndDrag();
//DEL 		delete m_pimageListDrag;
//DEL 		m_pimageListDrag = NULL;
//DEL 		//CListCtrl& clc = GetListCtrl();
//DEL
//DEL 		if (lStyle == LVS_REPORT && m_iItemDrop != m_iItemDrag && m_iItemDrop>=0)
//DEL 		{
//DEL 			CWListRowItem *p = (CWListRowItem *) m_listCtrl.GetItemData(m_iItemDrag);
//DEL 			ASSERTX(p);
//DEL 			if(p->IsKindOf(RUNTIME_CLASS(CWListEntry)))
//DEL 			{
//DEL 				CWListEntry *pEntry = (CWListEntry *) p;
//DEL 				pEntry->doMoveToSlot(m_listCtrl, m_iItemDrop);
//DEL 				((CTabbedTreeDoc*)GetDocument())->setModified(TRUE);
//DEL
//DEL 			}
//DEL 			//cstr = pCtrl->GetItemText(m_iItemDrag, 0);
//DEL 			//SetItemText(m_iItemDrop, 1, cstr);  // drop subitem text is dragged main item text
//DEL 		}
//DEL 		::ReleaseCapture();
//DEL 	}
//DEL }
/*
void CWListView::OnMouseMove(UINT nFlags, CPoint point)
{
	long		lStyle;
	int			iItem;
	LV_ITEM		lvitem;

	//CListCtrl& clc = GetListCtrl();
	lStyle = GetWindowLong(m_hWnd, GWL_STYLE);
	lStyle &= LVS_TYPEMASK;  // drag will do different things in list and report mode
	if (m_bDragging)
	{
		//point.x = m_iDragHorizontalLimit;
		ASSERTX(m_pimageListDrag != NULL);
		m_pimageListDrag->DragMove(point - m_sizeDelta);  // move the image
		if ((iItem = m_listCtrl.HitTest(point)) != -1)
		{
			m_iItemDrop = iItem;
			m_pimageListDrag->DragLeave(this); // unlock the window and hide drag image
			if (lStyle == LVS_REPORT || lStyle == LVS_LIST)
			{
				lvitem.iItem = iItem;
				lvitem.iSubItem = 0;
				lvitem.mask = LVIF_STATE;
				lvitem.stateMask = LVIS_DROPHILITED;  // highlight the drop target
				m_listCtrl.SetItem(&lvitem);
			}

			point -= m_sizeDelta;
			m_pimageListDrag->DragEnter(this, point);  // lock updates and show drag image
		}
	}

	CView::OnMouseMove(nFlags, point);
}
*/

// ??? enabled by the LVS_OWNERDRAWFIXED flag on the listctrl ??
// ?? or is it the message map, which has 	ON_WM_DRAWITEM() ??
//DEL void CWListView::DrawItem( LPDRAWITEMSTRUCT lpdis)
//DEL {
//DEL ASSERT(FALSE);
//DEL
//DEL 	HFONT hfntPrev=0;
//DEL 	COLORREF clrPrevText, clrPrevBkgnd;
//DEL 	int prevBkMode;
//DEL
//DEL 	CLangModelsDoc* pDoc = (CLangModelsDoc* )GetDocument();
//DEL 	ASSERTX(pDoc->IsKindOf(RUNTIME_CLASS(CLangModelsDoc)));
//DEL
//DEL 	CWListRowItem* pRI = (CWListRowItem*)lpdis->itemData;
//DEL 	ASSERTX(pRI->IsKindOf(RUNTIME_CLASS(CWListRowItem)));
//DEL
//DEL
//DEL 	//CView* pView = (CView*) CWnd::FromHandle(lpdis->hwndItem);
//DEL  	//ASSERTX(pView->IsKindOf(RUNTIME_CLASS(CView)));
//DEL 	//CListCtrl& clc = pView->GetListCtrl();
//DEL
//DEL 	// doesn't draw in the right color
//DEL 	//FillRect(lpdis->hDC, &lpdis->rcItem, (HBRUSH) COLOR_WINDOW+1 );// docs say to add one
//DEL 	// neither does this
//DEL 	//FillRect(lpdis->hDC, &lpdis->rcItem, (HBRUSH) m_listCtrl.GetTextBkColor()+1 );// docs say to add one
//DEL
//DEL /*typedef struct _LV_ITEM {
//DEL     UINT   mask;         // see below
//DEL     int    iItem;        // see below
//DEL     int    iSubItem;     // see below
//DEL     UINT   state;        // see below
//DEL     UINT   stateMask;    // see below
//DEL     LPSTR  pszText;      // see below
//DEL     int    cchTextMax;   // see below
//DEL     int    iImage;       // see below
//DEL     LPARAM lParam;       // 32-bit value to associate with item
//DEL } LV_ITEM;*/
//DEL
//DEL 	LV_ITEM itemStruct;
//DEL 	itemStruct.iItem = lpdis->itemID;
//DEL 	itemStruct.mask = LVIF_IMAGE;
//DEL 	ASSERTX(m_listCtrl.GetItem(&itemStruct));
//DEL
//DEL 	CImageList* pImages = m_listCtrl.GetImageList(LVSIL_STATE);
//DEL 	ASSERTX(pImages);
//DEL //INDEXTOSTATEIMAGEMASK
//DEL
//DEL 	CDC* pCDC = CDC::FromHandle(lpdis->hDC);
//DEL 	switch(lpdis->itemAction)
//DEL 	{
//DEL 		case ODA_SELECT:
//DEL 		case ODA_DRAWENTIRE:
//DEL 		{
//DEL 			CPoint imagePoint(lpdis->rcItem.left, lpdis->rcItem.top);
//DEL 			int iWhich = itemStruct.iImage >> 12;
//DEL
//DEL 			if(!pRI->m_bEnabled)
//DEL 				pImages->Draw(pCDC, 1, imagePoint, ILD_TRANSPARENT);
//DEL
//DEL 			DWORD a = COLOR_HIGHLIGHTTEXT;
//DEL 			DWORD b = GetSysColor(COLOR_HIGHLIGHT);
//DEL 			if (lpdis->itemState & ODS_SELECTED)
//DEL 			{
//DEL 				prevBkMode = SetBkMode(lpdis->hDC, OPAQUE);
//DEL 				clrPrevText = SetTextColor(lpdis->hDC,
//DEL 						GetSysColor(COLOR_HIGHLIGHTTEXT));
//DEL 				clrPrevBkgnd = SetBkColor(lpdis->hDC,
//DEL 						GetSysColor(COLOR_HIGHLIGHT));
//DEL 			}
//DEL 			else
//DEL 			{
//DEL 				prevBkMode = SetBkMode(lpdis->hDC, OPAQUE);
//DEL 				clrPrevText = SetTextColor(lpdis->hDC,
//DEL 						GetSysColor(COLOR_WINDOWTEXT));
//DEL 				clrPrevBkgnd = SetBkColor(lpdis->hDC,
//DEL 						GetSysColor(COLOR_WINDOW));
//DEL 			}
//DEL
//DEL 			// DRAW THE VARIOUS COLUMNS
//DEL 			const int kIconWidth=20;
//DEL 			int xStart=0;
//DEL 			for(int c=0; c<m_pList->getColumnCount(); c++)
//DEL 			{
//DEL 				CRect r;
//DEL 				if( c>0)
//DEL 					xStart += m_listCtrl.GetColumnWidth(c-1);
//DEL 				int iLeft = lpdis->rcItem.left+xStart;
//DEL 				if(c==0)
//DEL 					iLeft += kIconWidth;
//DEL
//DEL 				int iRight = iLeft+m_listCtrl.GetColumnWidth(c) - 5; // column margin
//DEL 				if(c==0)
//DEL 					iRight -= kIconWidth;
//DEL
//DEL 				// take the lesser of what room we want an what we have (different where the right edge of the view cuts off the column)
//DEL 				iRight = (iRight<lpdis->rcItem.right)?iRight:lpdis->rcItem.right;
//DEL
//DEL 				r.SetRect(
//DEL 					iLeft,
//DEL 					lpdis->rcItem.top,
//DEL 					iRight,
//DEL 					lpdis->rcItem.bottom);
//DEL
//DEL 				if(m_pList->getUseLangFontInColumn(c))
//DEL 				{
//DEL 					CFont* pF = pDoc->getLangFont();
//DEL 					hfntPrev = (HFONT) 	SelectObject(lpdis->hDC, *pF);
//DEL 					ASSERTX(hfntPrev);
//DEL 				}
//DEL 				int offset = pCDC->GetTextExtent(_T(" "), 1 ).cx*2; // from codeguru article "selection highlighting of an entire row"
//DEL 				r.left += offset;
//DEL 				r.right -= offset;
//DEL
//DEL 				CString s = pRI->getText(c);
//DEL 				//r.right -= 10; // just a margin between columns
//DEL
//DEL 				// how wide is this string?
//DEL /*					int iDesiredWidth = LOWORD(GetTabbedTextExtent(lpdis->hDC,  s, s.GetLength(),0, NULL));
//DEL 				int availableWidth = r.right-r.left;
//DEL 			if( availableWidth < iDesiredWidth)
//DEL 				{
//DEL 					CRect ellipsisRect(r);
//DEL 					int iEllipsisWidth = LOWORD(GetTabbedTextExtent(lpdis->hDC,  "...", 3,0, NULL));
//DEL 					ellipsisRect.left = availableWidth - iEllipsisWidth;
//DEL 					ellipsisRect.right = availableWidth;
//DEL 					DrawText(
//DEL 						lpdis->hDC, 	// handle to device context
//DEL 						"...", 	// pointer to string to draw
//DEL 						3, // string length, in characters, -1 means null-terminated
//DEL 						&ellipsisRect , 	// pointer to structure with formatting dimensions
//DEL 						NULL 	// text-drawing flags
//DEL 						);
//DEL 					r.right = ellipsisRect.left - 5;
//DEL
//DEL 				}
//DEL */
//DEL 			// !!!!this DT_END_ELLIPSIS doesn't truncate with some strings!!!!
//DEL //			TRACE("draw item:%s [%d]\n",s, r.left);
//DEL 				DrawText(
//DEL 					lpdis->hDC, 	// handle to device context
//DEL 					s, 	// pointer to string to draw
//DEL 					-1, // string length, in characters, -1 means null-terminated
//DEL 					&r , 	// pointer to structure with formatting dimensions
//DEL 					DT_SINGLELINE  | DT_VCENTER    | DT_END_ELLIPSIS |DT_NOPREFIX	// text-drawing flags
//DEL 					);
//DEL 				if(hfntPrev) // restore the previous font
//DEL 					SelectObject(lpdis->hDC, hfntPrev);
//DEL 			}
//DEL 			// is it selected?
//DEL 			//if (lpdis->itemState & ODS_SELECTED)
//DEL 			//	DrawFocusRect(lpdis->hDC, &lpdis->rcItem);
//DEL 		   // Set the appropriate foreground and background colors.
//DEL 		}
//DEL 		break;
//DEL 		default:
//DEL 			break;
//DEL 	}
//DEL 	SetTextColor(lpdis->hDC, clrPrevText);
//DEL     SetBkColor(lpdis->hDC, clrPrevBkgnd);
//DEL 	SetBkMode(lpdis->hDC, prevBkMode);
//DEL
//DEL }

// store the widths of the columns so we can restore them later
void CWListView::retrieveHeaderParams()
{
	ASSERTX(m_pList);
	m_pList->retrieveHeaderParams(m_listCtrl);
}

void CWListView::restoreHeaderParams()
{
	ASSERTX(m_pList);
	m_pList->restoreHeaderParams(m_listCtrl);
}

LONG CWListView::doFindReplace(FINDREPLACE * pFR)
{
	//CListCtrl& clc = GetListCtrl();

	ASSERTX(m_pList);

	// start looking after the currently selected row, or at zero if none
	int iStartingRow= getFirstSelectedRow()+1;

	for(int i=iStartingRow; i< m_listCtrl.GetItemCount(); i++)
	{
		CWListRowItem* pItem = (CWListRowItem*)m_listCtrl.GetItemData(i);
		ASSERTX(pItem);
		if(pItem->doFindReplace(pFR))
		{
			selectRowItem(i); //pItem->owningEntry();
			return 0;
		}
	}
	// if not found, start over from the top
	for(i=0; i< iStartingRow; i++)
	{
		CWListRowItem* pItem = (CWListRowItem*)m_listCtrl.GetItemData(i);
		ASSERTX(pItem);
		if(pItem->doFindReplace(pFR))
		{
			selectRowItem(i); //pItem->owningEntry();
			return 0;
		}
	}


	if(iStartingRow >=0)
		selectRowItem(iStartingRow-1, FALSE);	// don't want it to stay selected if nothing is found

	CString s;
	s.Format("Cannot find string \"%s\"", pFR->lpstrFindWhat);
	AfxMessageBox(s);
	return 0;
}

void CWListView::selectRowItem(int index, BOOL bSelect)
{
	//CListCtrl& clc = GetListCtrl();
	m_listCtrl.SetItem(index, 0 ,
				LVIF_STATE,		// nMask
				NULL, // lpszItem
				NULL, // nImage
				bSelect?LVIS_SELECTED:0, // state
				LVIS_SELECTED, // state mask
				NULL // lparam
				);

	m_listCtrl.EnsureVisible(index, FALSE); // must show the whole thing
}

void CWListView::OnEditPaste()
{
	ASSERTX(m_pClipboardRowItem);

	//CListCtrl & clc = GetListCtrl( );

	int iAtItem = getFirstSelectedRow();
	if(iAtItem == -1)	// if no selection
		iAtItem = -1; // stick it at the end

	int iNewRow=-1;

	//if(m_iClipboardOperation == ID_EDIT_COPY || m_iClipboardOperation == ID_EDIT_CUT)
	{
		if(m_pClipboardRowItem->IsKindOf(RUNTIME_CLASS(CWListEntry)))
		{
			CWListEntry *pNewEntry = (CWListEntry*) ((CWListEntry*)m_pClipboardRowItem)->getCopy();
			if(!pNewEntry)
			{
				AfxMessageBox("Sorry, pasting hasn't been implemented for this type yet.");
				return;
			}
			iNewRow = m_pList->insertNewItem(m_listCtrl, iAtItem, 0, pNewEntry);
		}
		else if(m_pClipboardRowItem->IsKindOf(RUNTIME_CLASS(CStringEnvironment)))
		{
			CStringEnvironment* pEnv = new CStringEnvironment((CStringEnvironment*)m_pClipboardRowItem, ((CStringEnvironment*)m_pClipboardRowItem)->m_pOwner);
			if(!pEnv)
			{
				AfxMessageBox("There was an error while trying to paste that item.");
				return;
			}

			CWEnvironConstrainedRule* pEntry =  (CWEnvironConstrainedRule*) getEntryOfSelection();
			// the entry could be something like a flag
			if(pEntry && pEntry->IsKindOf(RUNTIME_CLASS(CWEnvironConstrainedRule)))
				iNewRow = ((CWEnvironConstrainedRule*)pEntry)->insertEnviron(m_listCtrl, pEnv);
		}
		else
			AfxMessageBox("Sorry, pasting that kind of item hasn't been implemented yet.");

		if(iNewRow)
		{
			m_listCtrl.RedrawItems(iAtItem, m_listCtrl.GetItemCount());
			selectRowItem(iAtItem);
				GetDocument()->SetModifiedFlag();//((CTabbedTreeDoc*)GetDocument())->setModified(TRUE);
		}
	}
//	else
//		AfxMessageBox("Sorry, that function is still under construction.");
}

void CWListView::OnUpdateEditPaste(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(m_pClipboardRowItem!=NULL);
}



void CWListView::OnEditCopy()
{
	int iRow = getFirstSelectedRow();
	ASSERTX(iRow > -1); // else shouldn't have been enabled
	//m_iClipboardOperation = ID_EDIT_COPY;

	if(m_pClipboardRowItem)
		delete m_pClipboardRowItem;

	m_pClipboardRowItem = getRowItem(iRow)->getCopy();

	setUndoOperation(ID_EDIT_COPY, NULL);

	if(!m_pClipboardRowItem)
		AfxMessageBox("Sorry, copying that kind of item isn't implemented yet.");
}

void CWListView::OnEditCut()
{
	OnEditCopy();
	if(m_pClipboardRowItem)	// ok, we've made a copy, now delete the original
	{
		int iRow = getFirstSelectedRow();
		ASSERTX(iRow > -1); // else shouldn't have been enabled

		CWListRowItem* pDel= getRowItem(iRow);
		pDel->deleteSelf(m_listCtrl, m_pList); // doesn't actually delete, just removes itself
		setUndoOperation(ID_EDIT_CUT, pDel, iRow);	// store the deleted item for undoing
	}
}

void CWListView::OnUpdateEditCopy(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(getFirstSelectedRow() != -1);
}

void CWListView::OnUpdateEditCut(CCmdUI* pCmdUI)
{
	OnUpdateEditCopy(pCmdUI);
}

CWListRowItem* CWListView::getRowItem(int index)
{
	//CListCtrl & clc = GetListCtrl( );
	CWListRowItem* pItem = (CWListRowItem*)m_listCtrl.GetItemData(index);
	ASSERTX(pItem);
	return pItem;
}

void CWListView::setUndoOperation(int iOperation, CWListRowItem* pItem, int iRow)
{
	if(pItem)
		ASSERT(iRow>-1);

	m_iUndoOperation = iOperation;
	if(m_pUndoRowItem)
		delete m_pUndoRowItem;
	m_iUndoRow = iRow;

	m_pUndoRowItem = pItem; // may be null, like for a COPY
}

void CWListView::OnEditUndo()
{
	switch (m_iUndoOperation)
	{
		case ID_EDIT_CUT:
			ASSERTX(m_iUndoRow>-1);
			selectRowItem(m_iUndoRow);
			OnEditPaste();

			setUndoOperation();// clear the undo

			break;
		case ID_Edit_Delete:
			{
				ASSERTX(m_iUndoRow>-1);
				selectRowItem(m_iUndoRow);
				CWListRowItem* pTemp = m_pClipboardRowItem;
				m_pClipboardRowItem = m_pUndoRowItem;
				OnEditPaste();
				m_pClipboardRowItem = pTemp; // this will allow us to copy X, delete Y, undo, and still paste X

				setUndoOperation();// clear the undo;
			}
			break;
		default: break;
	}
}

void CWListView::OnUpdateEditUndo(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(m_iUndoOperation != NULL);
	switch (m_iUndoOperation)
	{
		case ID_EDIT_CUT:
			pCmdUI->SetText("Undo Cut");
			break;
		case ID_Edit_Delete:
			pCmdUI->SetText("Undo Delete");
			break;
		default: break;
	}
}

void CWListView::OnEditProperties()
{
	int iRow = getFirstSelectedRow();
	if(iRow<0)
		return;

	// could be a subclass of CWListEntry, an evironment row, or a comment row (<-- really? i don't think we allow comment rows)
	CWListRowItem *pRowItem = getRowItem(iRow);
	if(pRowItem )
	{
		if(!pRowItem->IsKindOf(RUNTIME_CLASS(CWListEntry)))
			pRowItem =	pRowItem->owningEntry();	// open the dialog on the full entry

		BOOL bChanged = TRUE;
#ifndef hab214
		if(m_pList->m_dwFlags & CWList::ITEMS_HAVE_DIALOG ||
		   (pRowItem->IsKindOf(RUNTIME_CLASS(CListEntryComment))) ||
		   (pRowItem->IsKindOf(RUNTIME_CLASS(CListEntryTestData))))
#else //hab214
		if(m_pList->m_dwFlags & CWList::ITEMS_HAVE_DIALOG)
#endif //hab214
			bChanged = pRowItem->doEditDialog(m_listCtrl);
		else
			m_listCtrl.EditSubLabel(iRow, 0); // do in-place edit

		//m_listCtrl.Update(iRow);
		// update all the way to the end in case the number of rows this takes
		//	up has changed, as when environments are added or removed
		if(bChanged)
		{
			m_listCtrl.RedrawItems(iRow, 1+m_listCtrl.GetItemCount());
			GetDocument()->SetModifiedFlag();//((CTabbedTreeDoc*)GetDocument())->setModified(TRUE);
		}
	}
}

void CWListView::OnUpdateEditProperties(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(getFirstSelectedRow() != -1);
}

void CWListView::OnDraw(CDC* pDC)
{
	// TODO: Add your specialized code here and/or call the base class


}

CFont* CWListView::getLangFont()
{
	return ((CLangModelsDoc*)GetDocument())->getLangFont();
}

void CWListView::OnSize(UINT nType, int cx, int cy)
{
	CView::OnSize(nType, cx, cy);

	if(m_listCtrl.m_hWnd)
		m_listCtrl.MoveWindow(0,0, cx, cy);

}



void CWListView::OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint)
{
	// in case the font was chagned
	m_listCtrl.forceRowHeightRecalc();	// if this was slow, we could add a hint for when this is needed
	CView::OnUpdate(pSender, lHint, pHint);
}

const CTextDisplayInfo* CWListView::getLangDisplayInfo()
{
	return ((CLangModelsDoc*)GetDocument())->getLangDisplayInfo();
}
