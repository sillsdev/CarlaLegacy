#include "stdafx.h"
#include "filelist.h"
#include "filelistctrl.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif


/////////////////////////////////////////////////////////////////////////////
// CFileListCtrl
static bool gAddingFileListItems;

CFileListCtrl::CFileListCtrl(CFileList* pFileList, LPCTSTR lpszDefaultExt, UINT nFilterID)
:	m_pFileList(pFileList),
	m_bListChanged(FALSE),
	m_sDefaultExt(lpszDefaultExt)
{
	m_sFilter.LoadString(nFilterID);
	m_pFileList->resetChangeTrackers(); // we presume the owner has , by now, noticed changes from the previous time it showed the list
}

CFileListCtrl::CFileListCtrl(CFileList* pFileList, LPCTSTR lpszDefaultExt, LPCTSTR lpszFilter)
:	m_pFileList(pFileList),
	m_bListChanged(FALSE),
	m_sFilter(lpszFilter),
	m_sDefaultExt(lpszDefaultExt)
{
	m_pFileList->resetChangeTrackers();// we presume the owner has , by now, noticed changes from the previous time it showed the list
}

CFileListCtrl::~CFileListCtrl()
{
}


BEGIN_MESSAGE_MAP(CFileListCtrl, CListCtrl)
	//{{AFX_MSG_MAP(CFileListCtrl)
	ON_NOTIFY_REFLECT(LVN_DELETEITEM, OnDeleteitem)
	ON_WM_LBUTTONDOWN()
	ON_NOTIFY_REFLECT(LVN_ITEMCHANGED, OnItemchanged)
	ON_WM_LBUTTONDBLCLK()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFileListCtrl message handlers

void CFileListCtrl::DoDataExchange(CDataExchange* pDX)
{
	ASSERT(FALSE); // i haven't tested what happens if you call this. It's not needed, anyhow

	CListCtrl::DoDataExchange(pDX);
}

BOOL CFileListCtrl::Create(DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID )
{
ASSERT(FALSE);// never called

	return CListCtrl::Create( dwStyle, rect, pParentWnd, nID);
}



void CFileListCtrl::OnDeleteitem(NMHDR* pNMHDR, LRESULT* pResult)
{
	NM_LISTVIEW* pNMListView = (NM_LISTVIEW*)pNMHDR;
	// TODO: Add your control notification handler code here

	*pResult = 0;
}
#define kPathColumnWidth 50

void CFileListCtrl::populate()
{
	//ModifyStyleEx(NULL, LVS_EX_CHECKBOXES);
	ListView_SetExtendedListViewStyleEx(this->m_hWnd, LVS_EX_CHECKBOXES, LVS_EX_CHECKBOXES);
	insertColumn("Path", kPathColumnWidth);
	DeleteAllItems();
	for(int i=0; i<m_pFileList->m_paths.GetSize();i++)
	{
		CPathDescriptor* pD = m_pFileList->m_paths.ElementAt(i);
		insertItem(pD);
	}
}

void CFileListCtrl::OnLButtonDown(UINT nFlags, CPoint point)
{
	// TODO: Add your message handler code here and/or call default

	CListCtrl::OnLButtonDown(nFlags, point);
}

void CFileListCtrl::insertColumn(LPCTSTR pszName, int iWidth)
{	LV_COLUMN lv;
	lv.mask = LVCF_FMT | LVCF_TEXT | LVCF_WIDTH;
	lv.fmt = LVCFMT_LEFT;
	lv.cx = iWidth;
	lv.pszText = (char*)pszName;
	VERIFY( -1 != InsertColumn(0, &lv));
}


#ifndef ListView_SetCheckState
   #define ListView_SetCheckState(hwndLV, i, fCheck) \
	  ListView_SetItemState(hwndLV, i, \
	  INDEXTOSTATEIMAGEMASK((fCheck)+1), LVIS_STATEIMAGEMASK)
#endif

void CFileListCtrl::insertItem(CPathDescriptor *pD)
{
	if(!m_hWnd)
		return;

	LV_ITEM lvi;
	lvi.mask = LVIF_TEXT | LVIF_PARAM ;//|LVIF_IMAGE;//| LVIF_STATE;
	lvi.state = 0;
	lvi.stateMask = 0;


	// for now, we're assuming only one column, which takes up the whole width
	// it seemed that when using list style instead of report style, that GetColumnWidth()
	// wasn't returning an accurate value.  So now we just use the whole width of the control

	CRect r;
	GetClientRect(&r);
	const int kMargin = 20; // room for check box
	int nColumnWidth = r.Width() - kMargin;//GetColumnWidth(0);

	// to do: make these strings work with callbacks if you want resizable
	// columns
	// Another way to do this is to have an owner-drawn control and use the
	// built in pathname drawing routine

	CString sPath = pD->getFullPath();
	// if it won't fit, scrunch it
	if(GetDC()->GetTextExtent(sPath).cx > nColumnWidth)
		sPath = pD->getDisplayPath(int((nColumnWidth/(1.3*GetDC()->GetTextExtent(" ").cx)) ));

	lvi.pszText = (char*) LPCTSTR(sPath);
	lvi.iImage = NULL;          // image list index

	lvi.iSubItem = 0;
	lvi.iItem = 0;
	lvi.lParam = (LPARAM) pD;
	//lvi.state = getStateValue();
	lvi.stateMask = LVIF_STATE;
	gAddingFileListItems = TRUE;
	VERIFY(-1 != InsertItem(&lvi));
	ListView_SetCheckState(this->m_hWnd, 0, pD->m_bEnabled);
	gAddingFileListItems = FALSE;
}

void CFileListCtrl::OnItemchanged(NMHDR* pNMHDR, LRESULT* pResult)
{
	if(gAddingFileListItems)
		return;

	NM_LISTVIEW* pNMListView = (NM_LISTVIEW*)pNMHDR;

	*pResult = 0;

	CPathDescriptor* pD = (CPathDescriptor*)pNMListView->lParam;
	ASSERT(pD);
	if(pNMListView->uChanged &  LVIF_STATE  )
	{
		BOOL bOld = pD->m_bEnabled;
		BOOL bNew = ListView_GetCheckState(this->m_hWnd, pNMListView->iItem) ;//!pD->m_bEnabled;
		if(!bOld && bNew)
			enablePath(pD);
		else if(bOld && !bNew)
			disablePath(pD);
	}
}



void CFileListCtrl::OnAddButton()
{
	m_bListChanged = TRUE;
	CFileDialog dlg(TRUE, NULL, m_sDefaultExt,
		OFN_ALLOWMULTISELECT |OFN_HIDEREADONLY|OFN_FILEMUSTEXIST,
		m_sFilter);
	if(dlg.DoModal() == IDOK)
	{
		POSITION pos = dlg.GetStartPosition(); // handle multiple files
		while(pos)
		{
			CPathDescriptor* pD = new CPathDescriptor(dlg.GetNextPathName(pos));
			//m_pFileList->m_paths.Add(pD);

			// don't allow duplicate entries
			if(-1==m_pFileList->m_paths.findPath(pD) && -1==m_pFileList->m_addedPaths.findPath(pD))
			{
				// update our path arrays
				int n = m_pFileList->m_removedPaths.findPath(pD);
				if(n > -1)	// if they previously removed it, we just delete that remove instruction
				{
					m_pFileList->m_removedPaths.RemoveAt(n);
				}
				else
				{
					m_pFileList->m_addedPaths.Add(pD);
				}

				// since it's added, it also goes in our list of enabled paths
				enablePath(pD);

				// update the screen list control
				insertItem(pD);
			}
		}
	}
}

void CFileListCtrl::OnRemoveButton()
{
	m_bListChanged = TRUE;
	int nItem=-1;

	CPathDescriptor* pD = getFirstSelectedItem(&nItem);
	if(!pD)
		return;

	// update our path arrays
	int n = m_pFileList->m_addedPaths.findPath(pD);
	if(n > -1)	// if they previously added it, we just delete that add instruction
	{
		m_pFileList->m_addedPaths.RemoveAt(n);
	}
	else
		m_pFileList->m_removedPaths.Add(pD);

	// since it's removed, it also goes in our list of disabled paths
	disablePath(pD);

		// update the screen list control
	DeleteItem(nItem);

	ASSERT(pD);
}




void CFileListCtrl::enablePath(CPathDescriptor *pD)
{
	m_bListChanged = TRUE;
	// don't mess with the real thing in case the user Cancels //pD->m_bEnabled=TRUE;
	int n = m_pFileList->m_newlyDisabledPaths.findPath(pD);
	if(n > -1)	// if they previously removed it, we just delete that remove instruction
	{
		m_pFileList->m_newlyDisabledPaths.RemoveAt(n);
	}
	else
	{
		m_pFileList->m_newlyEnabledPaths.Add(pD);
	}
}

void CFileListCtrl::disablePath(CPathDescriptor *pD)
{
	m_bListChanged = TRUE;
	// don't mess with the real thing in case the user Cancels //pD->m_bEnabled=FALSE;

	// unless, that is, this item was just created during this dialog
	if(m_pFileList->m_addedPaths.findPtr(pD)>-1)
		pD->m_bEnabled=FALSE;

	int n = m_pFileList->m_newlyEnabledPaths.findPath(pD);
	if(n > -1)	// if they previously enabled it, we just delete that notice to enable
	{
		m_pFileList->m_newlyEnabledPaths.RemoveAt(n);
	}
	else
	{
		m_pFileList->m_newlyDisabledPaths.Add(pD);
	}
}

void CFileListCtrl::OnLButtonDblClk(UINT nFlags, CPoint point)
{
	OnEditItem();
	CListCtrl::OnLButtonDblClk(nFlags, point);
}



void CFileListCtrl::OnEditItem()
{
	// This isn't enough.  We need to add the new item to the added items
	// and the old item as if it were removed.  I decided I don't need this
	// feature anyways, so I haven't done it.

/*	CPathDescriptor* pD = getFirstSelectedItem();
	if(!pD)
		return;

	CFileDialog dlg(TRUE, pD->getFileExtension(), pD->getFullPath(),
		OFN_HIDEREADONLY|OFN_FILEMUSTEXIST, m_sFilter);
	if(dlg.DoModal() != IDOK)
		return;

	*pD = dlg.GetPathName();
*/
}

CPathDescriptor* CFileListCtrl::getFirstSelectedItem(int *pnItem)
{
	if(GetSelectedCount() == 0)
		return NULL;

	POSITION pos = GetFirstSelectedItemPosition();
	int nItem = GetNextSelectedItem(pos);
	if(pnItem)
		*pnItem = nItem;

	CPathDescriptor* pD = (CPathDescriptor* )GetItemData(nItem);
	ASSERT(pD->IsKindOf(RUNTIME_CLASS(CPathDescriptor)));
	return pD;
}

// must be called by the dialog that owns us
void CFileListCtrl::OnCancel()
{
	m_pFileList->m_removedPaths.RemoveAll();
}

// Function name	: CFileListCtrl::OnOK
// Description	    : owner must call this to when the user clicks ok so that the pathlist
//						can be modified with the files that have been added and removed
//						must be called by the dialog that owns us
// Return type		: void
// Created by	    : John Hatton
// Created on      :  12/2/98 8:53:06 AM
void CFileListCtrl::OnOK()
{
	// remove what needs to  be removed
	int sz = m_pFileList->m_removedPaths.GetSize();
	for(int iRemove=0; iRemove < sz; iRemove++)
	{
		CPathDescriptor* pD = m_pFileList->m_removedPaths[iRemove];
		int n = m_pFileList->m_paths.findPtr(pD);
		VERIFY(n >-1);
		m_pFileList->m_paths.RemoveAt(n);
		// don't delete because the user of this object will want to look at
		// the path in m_remoedPaths
				//delete pD;
	}

	// add what needs to  be added

	for(int iAdd=0; iAdd < m_pFileList->m_addedPaths.GetSize(); iAdd++)
	{
		CPathDescriptor* pD = m_pFileList->m_addedPaths[iAdd];
		m_pFileList->m_paths.Add(pD);
	}

	// set enabled guys
	for(int i=0; i < m_pFileList->m_newlyEnabledPaths.GetSize(); i++)
	{
		m_pFileList->m_newlyEnabledPaths[i]->m_bEnabled = TRUE;
	}
	for(i=0; i < m_pFileList->m_newlyDisabledPaths.GetSize(); i++)
	{
		m_pFileList->m_newlyDisabledPaths[i]->m_bEnabled = FALSE;
	}

}

// used to add paths programmatically
void CFileListCtrl::addFilePathD(CPathDescriptor *pd)
{
	m_pFileList->add(pd);
	this->insertItem(pd);
}


BOOL CFileListCtrl::isEmpty()
{	// i'm not certain this is the right equation...

	return !
		(	m_pFileList->m_addedPaths.GetSize() // have some new ones
			// or not all the old ones have been removed
			|| (m_pFileList->m_removedPaths.GetSize() < m_pFileList->m_paths.GetSize())
		);
}
