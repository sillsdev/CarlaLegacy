// EnvironmentListCtrl.cpp: implementation of the CEnvironmentListCtrl class.
//
// 2.5.4 26-Jul-2001 hab Force redrawing of control when the user toggles
//                         the enbale/disable state of an environment
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "..\resource.h"
#include "EnvironmentListCtrl.h"
#include "CWList.h"
#include "TextDisplayInfo.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CEnvironmentListCtrl::CEnvironmentListCtrl(const CTextDisplayInfo* pTDI/*=NULL*/)//CWEnvironConstrainedRule* pRule)
: m_pRule(NULL),
m_pBlankEntry(NULL),
m_nIconID(IDI_MorphEnvironment), // can be changed for string environments
m_pEnvironments(NULL),
m_pTDI(pTDI),
m_bIsMEC(FALSE)
{
	// we don't want any of these features provided by the superclass
	m_dwFlags &= ~ (ALLOW_SORTING | ALLOW_DRAG_REORDER | DOUBLE_CLICK_NEW);
	m_dwFlags |= MULTIPLE_FONTS;

	m_dwColumnEditBitfield=~0; // all editable
}

CEnvironmentListCtrl::~CEnvironmentListCtrl()
{
	if(m_pBlankEntry)	// delete the blank entry which was never used
		delete m_pBlankEntry;
}

void CEnvironmentListCtrl::populate()
{
	ASSERTX(m_pEnvironments);

	for(int i=0; i< m_pEnvironments->GetSize(); i++)
		insertItem(m_pEnvironments->GetAt(i));

	// stick an extra empty one in there at the end
	if(m_pBlankEntry)
		delete m_pBlankEntry;

	m_pBlankEntry = new CStringEnvironment("", "", m_pRule->m_iColumnForEnv, m_pRule);
	insertItem(m_pBlankEntry);
}

// override from CEditListCtrl
CString CEnvironmentListCtrl::getItemText(LPARAM lp, int nCol)
{
	if(nCol==0)
		return ((CStringEnvironment*)lp)->m_sEnv;
	else
		return ((CStringEnvironment*)lp)->m_sComments;

}

// override from CEditListCtrl
void CEnvironmentListCtrl::setItemText(int nItem, int nSubItem, LPCTSTR pszText)
{
	CStringEnvironment* penv = (CStringEnvironment*)GetItemData(nItem);
	ASSERTX(penv);
	if(nSubItem==0)
		penv->setEnvString(pszText);
	else
		penv->m_sComments=pszText;

	if(penv == m_pBlankEntry)	// add it to the list and make a new blank
	{
		// note that we leave it to the invoker of this dialog to call reset()
		//	on the item so that it shows up with the right number of rows in
		//		the main list (not in this dialog)
		m_pEnvironments->Add(m_pBlankEntry);
		ASSERT(m_pRule);
		m_pBlankEntry = new CStringEnvironment("", "", m_pRule->m_iColumnForEnv, m_pRule);
		insertItem(m_pBlankEntry);
	}
}

void CEnvironmentListCtrl::insertItem(CStringEnvironment *penv)
{
if(!m_hWnd)
		return;

	LV_ITEM lvi;
	lvi.mask = LVIF_TEXT | LVIF_PARAM | LVIF_IMAGE | LVIF_STATE;
	lvi.state = 0;
	lvi.stateMask = 0;

	lvi.pszText = LPSTR_TEXTCALLBACK;
	lvi.iImage = 0;          // image list index

	if(!penv->m_bEnabled)
	{
		lvi.state =  INDEXTOOVERLAYMASK(1); // draw the 'not' icon over it
		lvi.stateMask = LVIS_OVERLAYMASK;
	}
	else
	{
		lvi.state = 0;
		lvi.stateMask = NULL;
	}

	lvi.iSubItem = 0;
	lvi.iItem = GetItemCount(); // stick it at the end (that's where we want blanks inserted)
	lvi.lParam = (LPARAM) penv;
	//lvi.state = getStateValue();
	//lvi.stateMask = LVIF_STATE;
	VERIFY(-1 != InsertItem(&lvi));
	//ListView_SetCheckState(this->m_hWnd, 0, pD->m_bEnabled);
}

// override from CEditListCtrl
void CEnvironmentListCtrl::makeColumns()
{
	this->ModifyStyle(NULL, LVS_OWNERDRAWFIXED);	// couldn't think of a handy place to put this...

	insertColumn("Comment", 2000, NULL);// use the list horiz scroll bar to show a long comment

	CRect rect;
	GetClientRect(&rect);
	int nColInterval = rect.Width()/3;  // relative positioning; first column takes one third
	insertColumn("Environment", nColInterval, NULL);
}

// override
void CEnvironmentListCtrl::makeImageList()
{
	m_imageList.Create(GetSystemMetrics(SM_CXSMICON),
		GetSystemMetrics(SM_CYSMICON), TRUE, 2, 1);

	HICON hiconItem;        // icon for list view items
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(m_nIconID));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	// make the "disabled" overlay icon
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_DisabledOverlay));
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

	m_imageList.SetOverlayImage( 1, // the 2nd image is #1(zero-based) in the list
								1);	// is the overlay image #1 (one-based).

	SetImageList( &m_imageList, LVSIL_SMALL);
}



BEGIN_MESSAGE_MAP(CEnvironmentListCtrl, CEditListCtrl)
	//{{AFX_MSG_MAP(CEnvironmentListCtrl)
	ON_COMMAND(ID_Env_Delete, OnEditDelete)// don't work
	ON_COMMAND(ID_Env_Enable, OnToggleEnable)// don't work
	ON_UPDATE_COMMAND_UI(ID_Env_Enable, OnUpdateToggleEnable)// don't work
	// don't work ON_NOTIFY_REFLECT(WM_INITMENUPOPUP, OnUpdateToggleEnable)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

// called via popup menu
// the key DEL goes straight to deleteItem via CEditListCtrl.  It doesn't use an accelerator.
 void CEnvironmentListCtrl::OnEditDelete()
 {
	int nItem;
	CStringEnvironment* penv = (CStringEnvironment*)getFirstSelectedItemData(&nItem);
	if (!penv)
		return;

	deleteItem((LPARAM)penv, nItem);
  }

// note: need to define the semantics: is it the entry in the display list or
// underlying array?  These will be different if we allow sorting
int CEnvironmentListCtrl::getEnvIndex(CStringEnvironment *penv)
{
	ASSERT(FALSE);
	return -1;
}


// override from CEditListCtrl
// called when the user presses the delete key
void CEnvironmentListCtrl::deleteItem(LPARAM pItem, int nItem)
{
	ASSERTX(pItem);
	if((CStringEnvironment*)pItem == m_pBlankEntry)
	{
		AfxMessageBox("This environment is a blank that you can fill in.  You cannot delete it.");
		return;
	}
	DeleteItem(nItem); // remove from the display list

	m_pEnvironments->RemoveAt(nItem); // assumes list is never sorted!!!!!!!

//	setUndoOperation(ID_Edit_Delete, pItem, iRow);	// store the deleted item for undoing
}

//virtual on CWnd REMOVED BECAUSE ONCONTEXTMENU WAS NEVER CALLED
// WHEN I CALLED VIA THE OWNING DIALOG, THEN EVERYTHING WAS DISABLED
// SO NOW I USE ONRBUTTONDOWN() INSTEAD
//DEL void CEnvironmentListCtrl::OnContextMenu(CWnd *pWnd, CPoint point)
//DEL {
//DEL     CMenu menu;
//DEL     if (menu.LoadMenu(IDR_EnvironPopup))
//DEL     {
//DEL         CMenu* pPopup = menu.GetSubMenu(0);
//DEL         ASSERTX(pPopup != NULL);
//DEL
//DEL         pPopup->TrackPopupMenu(TPM_LEFTALIGN | TPM_RIGHTBUTTON,
//DEL             point.x, point.y,
//DEL             AfxGetMainWnd()); // use main window for cmds
//DEL     }
//DEL }

void CEnvironmentListCtrl::OnToggleEnable()
{
	int n;
	CStringEnvironment* penv = (CStringEnvironment*)getFirstSelectedItemData(&n);
	if(!penv)
		return;
	penv->m_bEnabled= !penv->m_bEnabled;
	if(!penv->m_bEnabled)
		SetItemState(n, INDEXTOOVERLAYMASK(1), LVIS_OVERLAYMASK);
	else
#ifndef hab254
	  {
		SetItemState(n, NULL, LVIS_OVERLAYMASK);	// clear the overlay
		RedrawItems(n,n);
	  }
#else
		SetItemState(n, NULL, LVIS_OVERLAYMASK);	// clear the overlay
#endif // hab254
}

void CEnvironmentListCtrl::OnUpdateToggleEnable(CCmdUI *pCmdUI)
{
	int n;
	CStringEnvironment* penv = (CStringEnvironment*)getFirstSelectedItemData(&n);
	if(!penv)
		return;

	pCmdUI->Enable();
	pCmdUI->SetCheck(penv->m_bEnabled);	// check if enabled
}

// override from CEditListCtrl
void CEnvironmentListCtrl::keyPressedOnItem(LV_KEYDOWN *pLVKeyDow, LPARAM p, int iItem)
{
	if(pLVKeyDow->wVKey == VK_SPACE)
		OnToggleEnable();
}

void CEnvironmentListCtrl::OnRButtonDown(UINT nFlags, CPoint point)
{
	CMenu menu;
	int pMenuID = 0;
	VERIFY(menu.LoadMenu(IDR_EnvironPopup));
	CMenu* pPopup = menu.GetSubMenu(pMenuID);
	ASSERT(pPopup != NULL);
	POINT pp;
	GetCursorPos(&pp);
	DWORD n = pPopup->TrackPopupMenu(
		TPM_LEFTALIGN | TPM_LEFTBUTTON | TPM_NONOTIFY | TPM_RETURNCMD,	pp.x,pp.y,this);
	pPopup->DestroyMenu();

	//The value of SelectionMade is
	//the id of the command selected//or 0 if no selection was made
	switch(n)
	{
		case ID_Env_Enable: OnToggleEnable(); break;
		case ID_Env_Delete: OnEditDelete(); break;
	}
}

// Intercept messages that belong to me but the silly system never gives me
BOOL CEnvironmentListCtrl::PreTranslateMessage(MSG *pMsg)
{
	if(pMsg->message == WM_RBUTTONDOWN) //WM_CONTEXTMENU never was sent here
	{
		//OnContextMenu(CWnd::FromHandle(pMsg->hwnd), pMsg->pt);
		OnRButtonDown(NULL, pMsg->pt);
		return TRUE;	// was handled
	}
	return CEditListCtrl::PreTranslateMessage(pMsg);
}

//DEL void CEnvironmentListCtrl::setRule(CEnvironmentConstrainedRule *pRule)
//DEL {
//DEL
//DEL }

void CEnvironmentListCtrl::setRule(CWEnvironConstrainedRule *pRule)
{
	m_pRule = pRule;
	// to do: copy the array so that we can leave the list alone if
	// the user cancels?
	m_pEnvironments= &pRule->m_environments;
}

CFont* CEnvironmentListCtrl::getFontForSubItem(int nItem, int nCol)
{
	if(m_pTDI && nCol==0 &&
		// either this is an SEC or (an MEC with the showMorphnamesInLangFont flag on)
		( !m_bIsMEC || m_pTDI->m_bShowMorphnamesInLangFont)) // the environment column
	{
		return m_pTDI->getFont();
	}
	else if(m_pTDI && nCol==1 && m_pTDI->m_bShowCommentsInLangFont)
	{
		return m_pTDI->getFont();
	}

	else
		return GetFont(); // use whatever this listCtrl's default font is
}

// override
int CEnvironmentListCtrl::getLargestFontHeight()
{
	int langFontHeight=0;
	int defaultFontHeight=0;
	LOGFONT lf;

	if(m_pTDI)
	{
		m_pTDI->getFont()->GetLogFont(&lf);
		langFontHeight = abs(lf.lfHeight);
	}

	CFont* pf = GetFont(); // default font of this list
	pf->GetLogFont(&lf);
	defaultFontHeight = abs(lf.lfHeight);

	// return the larger of the two
	return (langFontHeight>defaultFontHeight?langFontHeight:defaultFontHeight);
}
