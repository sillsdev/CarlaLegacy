// IntergenMarkersCtrl.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "AnalysisProcesses.h"
#include "IntergenMarkersCtrl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CIntergenMarkersCtrl

CIntergenMarkersCtrl::CIntergenMarkersCtrl(CIntergenProcess* pIntergenProcess)
:CEditListCtrl(),
m_pIntergenProcess(pIntergenProcess)
{
	// we don't want any of these features provided by the superclass
	m_dwFlags &= ~ (ALLOW_SORTING|DOUBLE_CLICK_NEW|HANDLE_EDITTING);

	m_dwColumnEditBitfield=~0; // all editable
}

CIntergenMarkersCtrl::~CIntergenMarkersCtrl()
{
}


BEGIN_MESSAGE_MAP(CIntergenMarkersCtrl, CEditListCtrl)
	//{{AFX_MSG_MAP(CIntergenMarkersCtrl)
	ON_WM_LBUTTONDBLCLK()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CIntergenMarkersCtrl message handlers


void CIntergenMarkersCtrl::makeColumns()
{
	this->ModifyStyle(NULL, LVS_EDITLABELS );//|LVS_OWNERDRAWFIXED);

	ListView_SetExtendedListViewStyleEx(this->m_hWnd, LVS_EX_CHECKBOXES, LVS_EX_CHECKBOXES);
	insertColumn(_T("Description"), 400, NULL);
	insertColumn(_T("SF Marker"), 100, CGuruColumn::ALLOW_EDITTING);// use the list horiz scroll bar to show a long comment

}

void CIntergenMarkersCtrl::makeImageList()
{
 /*	m_imageList.Create(GetSystemMetrics(SM_CXSMICON),
		GetSystemMetrics(SM_CYSMICON), TRUE, 1, 1);

	HICON hiconItem;
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_SFMarker));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	SetImageList( &m_imageList, LVSIL_SMALL);
*/}

#ifndef ListView_SetCheckState
#ifndef rde270
	// make these defines typesafe, so I don't screw up the switch to unicode
   inline void ListView_SetCheckState(HWND hwndLV, int i, BOOL fCheck) \
   {  ListView_SetItemState(hwndLV, i, \
	  INDEXTOSTATEIMAGEMASK((fCheck)+1), LVIS_STATEIMAGEMASK) }
#else   // rde270
   #define ListView_SetCheckState(hwndLV, i, fCheck) \
	  ListView_SetItemState(hwndLV, i, \
	  INDEXTOSTATEIMAGEMASK((fCheck)+1), LVIS_STATEIMAGEMASK)
#endif  // rde270
#endif

void CIntergenMarkersCtrl::addItem(CIntergenMarker *pMarker)
{
	LV_ITEM lvi;
	lvi.mask = LVIF_TEXT | LVIF_PARAM  | LVIF_STATE; //|LVIF_IMAGE
	lvi.state = 0;
	lvi.stateMask = 0;
	//lvi.iImage = 0;
	lvi.iSubItem = 0;
	lvi.iItem = 0;
	lvi.lParam = (LPARAM) pMarker;

	lvi.pszText = (LPTSTR) LPSTR_TEXTCALLBACK;
	ASSERTX(-1 != InsertItem(&lvi));
	ListView_SetCheckState(m_hWnd, lvi.iItem, pMarker->m_bEnabled);
}

CString CIntergenMarkersCtrl::getItemText(LPARAM lp, int nCol)
{
	switch(nCol)
	{
	case 0: return ((CIntergenMarker*)lp)->m_sMarker;
			break;
	case 1: return ((CIntergenMarker*)lp)->m_sDescription;
		break;
	}
	return _T("ERROR");
}

void CIntergenMarkersCtrl::setItemText(int nItem, int nSubItem, LPCTSTR pszText)
{
	CIntergenMarker* pm = (CIntergenMarker*)GetItemData(nItem);
	if(nSubItem==0 && pszText && _tcslen(pszText)>0)
	{
		CString s = pszText;
		s.TrimLeft();
		int nSpaceLoc = s.Find(' ');
		if(nSpaceLoc >0)
			pm->m_sMarker = s.Left(nSpaceLoc);
		else
			pm->m_sMarker = s;
	}
}


void CIntergenMarkersCtrl::populate()
{
	for(int i= m_pIntergenProcess->m_markers.GetSize()-1; i>=0;  i--)
	{
		addItem(m_pIntergenProcess->m_markers[i]);
	}
}

void CIntergenMarkersCtrl::onOK()
{
	ASSERT(m_pIntergenProcess);
	m_pIntergenProcess->m_markers.RemoveAll();
	for(int i=0; i<GetItemCount();i++)
//	for(int i=GetItemCount()-1; i>=0 ; i--)
	{
		CIntergenMarker* pm = (CIntergenMarker*)GetItemData(i);
		pm->m_bEnabled = ListView_GetCheckState(m_hWnd, i);
		m_pIntergenProcess->m_markers.Add(pm);
	}
}



void CIntergenMarkersCtrl::OnLButtonDblClk(UINT nFlags, CPoint point)
{
	POSITION pos = GetFirstSelectedItemPosition();
	int iFirst = GetNextSelectedItem(pos);

	if(iFirst < 0)
		return ;

	this->EditSubLabel(iFirst, 0);
	//CEditListCtrl::OnLButtonDblClk(nFlags, point);
}
