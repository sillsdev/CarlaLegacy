// DlgProcessSequence.cpp : implementation file
//
// JDH 6/2/99 Widened dialog to show the names of the processors
// 1.5a7 18-Oct-1999 hab Fix bug: a change to a process' check box would be
//                      lost if either a process was deleted or inserted
// 2.3.1 26-Jun-2000 hab Fix minor display bug: redisplay control so if the
//                        changes a SenTrans type, the new type is shown
//                        immediately

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "DlgProcessSequence.h"
#include "ProcessSequence.h"
#include "DlgChooseProcessor.h"
#include "ResizingUtils.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif



/////////////////////////////////////////////////////////////////////////////
// CDlgProcessSequence dialog
static const char *oszDialogName = "DlgProcessSequence";
#define BASE_WIDTH   365
#define BASE_HEIGHT  144

// iFunctionCode is one of {kDisambig, kTransfer, kSynthesis}
CDlgProcessSequence::CDlgProcessSequence(int iFunctionCode,
										 LPCTSTR lpszTitle,
										 CProcessSequence* pSeq)
	: m_iFunctionCode(iFunctionCode), m_sTitle(lpszTitle),
	m_bModified(FALSE), m_pSequence(pSeq),
	CDialog(CDlgProcessSequence::IDD, NULL)
{
	//{{AFX_DATA_INIT(CDlgProcessSequence)
	m_sValidMsg = _T("");
	//}}AFX_DATA_INIT
}



void CDlgProcessSequence::DoDataExchange(CDataExchange* pDX)
{
	if(!pDX->m_bSaveAndValidate)
	{
		if(!m_pSequence->isValidSequence(m_sValidMsg))
		{
			CWnd *pWnd = GetDlgItem(IDOK);
			pWnd->ModifyStyle(NULL, WS_DISABLED);
			pWnd->Invalidate();
		}
		else
		{
			CWnd *pWnd = GetDlgItem(IDOK);
			pWnd->ModifyStyle(WS_DISABLED, NULL);
			pWnd->Invalidate();
		}
	}

	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgProcessSequence)
	DDX_Control(pDX, IDC_Remove, m_btnRemove);
	DDX_Control(pDX, IDC_Properties, m_btnProperties);
	DDX_Control(pDX, IDC_InsertBefore, m_btnInsertBefore);
	DDX_Control(pDX, IDC_InsertAfter, m_btnInsertAfter);
	DDX_Control(pDX, IDC_ProcessList, m_processListCtrl);
	DDX_Text(pDX, IDC_ValidMsg, m_sValidMsg);
	//}}AFX_DATA_MAP


	if(pDX->m_bSaveAndValidate)
	{
		if(!m_pSequence->isValidSequence(m_sValidMsg))
		{
			AfxMessageBox(m_sValidMsg);
			pDX->Fail();
		}
	}
}


BEGIN_MESSAGE_MAP(CDlgProcessSequence, CDialog)
	//{{AFX_MSG_MAP(CDlgProcessSequence)
	ON_BN_CLICKED(IDC_Remove, OnRemoveProcess)
	ON_BN_CLICKED(IDC_Properties, OnProperties)
	ON_NOTIFY(LVN_GETDISPINFO, IDC_ProcessList, OnGetdispinfoProcessList)
	ON_NOTIFY(NM_DBLCLK, IDC_ProcessList, OnDblclkProcessList)
	ON_BN_CLICKED(IDC_InsertAfter, OnInsertAfter)
	ON_BN_CLICKED(IDC_InsertBefore, OnInsertBefore)
	ON_NOTIFY(LVN_ITEMCHANGED, IDC_ProcessList, OnItemchangedProcessList)
	ON_BN_CLICKED(ID_HELP, OnHelp)
	ON_WM_SIZE()
	ON_WM_DESTROY()
	ON_WM_GETMINMAXINFO()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgProcessSequence message handlers

void CDlgProcessSequence::OnRemoveProcess()
{
	// 1) figure out which process is selected

	CProcess* pProc = getFirstSelectedProcess();
	if (!pProc) return;

	// 2) tell that process it's about to be removed, so it can
	//		warn the user of the consequences.

	// 3) if the user went through with it, then set the modified flag of the project
#ifndef hab15a7
	updateCheckBoxes();
#endif // hab15a7
	for(int i=0; i< m_ppProcesses->GetSize(); i++)
	{
		if ((*m_ppProcesses)[i] == pProc)
		{
			m_ppProcesses->RemoveAt(i);
		// 4) redraw our list
			populateListCtrl();
			UpdateData(FALSE);
			checkButtonStatus();
			return;
		}
	}

	ASSERTX(FALSE);
}

void CDlgProcessSequence::OnProperties()
{
	// 1) figure out which process is selected
	CProcess* pProc = getFirstSelectedProcess();
	if (!pProc) return;

	// 2) tell that process to put up the edit dialog
	if (pProc->doEditDialog(m_iFunctionCode))
	{
		m_bModified=TRUE;
		// these two often don't work
		SetRedraw(TRUE);
		Invalidate();	// may have changed something that effects the display
	}
}

CProcess* CDlgProcessSequence::getFirstSelectedProcess(int *pIndex)
{
	if(!m_processListCtrl.GetSelectedCount())
		return NULL;	// none selected

	for(int i=0; i< m_processListCtrl.GetItemCount(); i++)
	{
		if(m_processListCtrl.GetItemState(i, LVIS_SELECTED) == LVIS_SELECTED)
		{
			if(pIndex)
				*pIndex = i;
			return (CProcess*)m_processListCtrl.GetItemData(i);
		}
	}
	return NULL;
}

#ifndef ListView_SetCheckState
   #define ListView_SetCheckState(hwndLV, i, fCheck) \
	  ListView_SetItemState(hwndLV, i, \
	  INDEXTOSTATEIMAGEMASK((fCheck)+1), LVIS_STATEIMAGEMASK)
#endif

// put all the current processes in the list control
void CDlgProcessSequence::populateListCtrl()
{
	// make sure it's empty
	for(; m_processListCtrl.GetItemCount() ;)
		m_processListCtrl.DeleteItem(0);

	//	m_processListCtrl.LockWindowUpdate();	//don't want to show the remove

	for (int i = 0; i < m_ppProcesses->GetSize(); i++)
	{
		(*m_ppProcesses)[i]->addItemToListControl(m_processListCtrl);
		ListView_SetCheckState(m_processListCtrl.m_hWnd, i, (*m_ppProcesses)[i]->m_bEnabled);
	}

	//m_processListCtrl.UnlockWindowUpdate();	//don't want to show the remove
}

void CDlgProcessSequence::OnGetdispinfoProcessList(NMHDR* pNMHDR, LRESULT* pResult)
{
	LV_DISPINFO* pnmv = (LV_DISPINFO*)pNMHDR;
	// TODO: Add your control notification handler code here

	*pResult = 0;

	// Provide the item or subitem's text, if requested.
	if (pnmv->item.mask & LVIF_TEXT)
	{
		CProcess* pProc = (CProcess *) (pnmv->item.lParam);
		lstrcpy(pnmv->item.pszText, pProc->getListCtrlText(pnmv->item.iSubItem));
	}

	*pResult = 0; //	THIS WAS PUT HERE BY THE WIZARD
}

static void
vSize(CDialog *cd, int cx, int cy)
{
	// resize all bits
	CRect r;

	// Align things from boundary (left or right) and bottom
	tsSizingElement asSizingElements[] =
	{
		{ IDCANCEL,         (BASE_WIDTH - 238) * 2, 100, -1*(BASE_HEIGHT - 120) * 2, 28, 0 },    // 238,120,50,14
		{ IDOK,             (BASE_WIDTH - 178) * 2, 100, -1*(BASE_HEIGHT - 120) * 2, 28, 0 },    // 178,120,50,14
		{ ID_HELP,          (BASE_WIDTH - 304) * 2, 100, -1*(BASE_HEIGHT - 120) * 2, 28, 0 },    // 304,120,50,14
		{ IDC_InsertBefore, (BASE_WIDTH - 304) * 2, 100, 11*2, 28, 0}, //  304,11,50,14
		{ IDC_InsertAfter,  (BASE_WIDTH - 304) * 2, 100, 29*2, 28, 0}, //  304,29,50,14
		{ IDC_Remove,       (BASE_WIDTH - 304) * 2, 100, 48*2, 28, 0}, //  304,48,50,14
		{ IDC_Properties,   (BASE_WIDTH - 304) * 2, 100, 66*2, 28, 0}, //  304,66,50,14
		{ IDC_ValidMsg, 10 * 2, 278*2, -1*(BASE_HEIGHT - 96) * 2, 20*2, 1 }, //10,96,278,20
		{ IDC_Uncheck,   9 * 2, 128*2, -1*(BASE_HEIGHT - 81) * 2,  8*2, 1 },  // 9,81,128,8
		{ IDC_ProcessList, 8 * 2, -1*(BASE_WIDTH - 284 - 8) * 2, 10 * 2, -2 * (BASE_HEIGHT - 10 - 69), 1 }      // 8,10,284,69
	};
	vResize(cd, cx, cy, asSizingElements, sizeof(asSizingElements)/sizeof(asSizingElements[0]));

}

BOOL CDlgProcessSequence::OnInitDialog()
{
	CDialog::OnInitDialog();
	SetWindowText(m_sTitle);
	//if(!m_ppProcesses->GetSize()) // are we empty?
	//	insertProcess(FALSE);
	// retrieve the window placement
	WINDOWPLACEMENT wp;

	if (ERROR_SUCCESS == lGetWindowPlacement(oszDialogName, &wp)) {
	  SetWindowPlacement(&wp);
	  int cx = wp.rcNormalPosition.right - wp.rcNormalPosition.left;
	  int cy = wp.rcNormalPosition.bottom - wp.rcNormalPosition.top;
	   //  + ::GetSystemMetrics(SM_CXFRAME) * 2
	   //  + ::GetSystemMetrics(SM_CYFRAME) + ::GetSystemMetrics(SM_CYCAPTION);
	  vSize(this,
			cx - 8,   // total width minus border width
			cy - 32); // total height minus border + title bar
	  setupListCtrl(cx);
	}
	else {
	  setupListCtrl(0);
	}

	checkButtonStatus();

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgProcessSequence::OnDblclkProcessList(NMHDR* pNMHDR, LRESULT* pResult)
{
	HWND hWnd = pNMHDR->hwndFrom;
	CListCtrl* pCtrl = (CListCtrl*) CWnd::FromHandle(hWnd);

	   POINT pointScreen;
	   DWORD dwPos;

	   dwPos = GetMessagePos();

	   pointScreen.x = LOWORD (dwPos);
	   pointScreen.y = HIWORD (dwPos);

	::MapWindowPoints(NULL,	hWnd,&pointScreen,	1);
	CPoint pt_local(pointScreen);
	pt_local.x = 5;	// it likes clicks on the left edge, not in the middle, so fake it
	UINT flags;
	int i = pCtrl->HitTest(pt_local, &flags) ;

	if(i>=0)
	{	// could be a subclass of CWListEntry, an evironment row, or a comment row
			CProcess *pProc  = (CProcess *) pCtrl->GetItemData(i);
		if(pProc)
#ifndef hab231
		  {
			pProc->doEditDialog(m_iFunctionCode);
			populateListCtrl();
		  }
#else // hab231
			pProc->doEditDialog(m_iFunctionCode);
#endif // hab231
	}
	*pResult = 0;
}

void CDlgProcessSequence::setupListCtrl(int cx)
{
	ListView_SetExtendedListViewStyleEx(m_processListCtrl.m_hWnd, LVS_EX_CHECKBOXES, LVS_EX_CHECKBOXES);
	if (cx <= 0) { cx = 600; } // default width
	else { cx -= 8 * 2/* distance to left border */ + (365-284)*2/* distance to right border */; }

	LV_COLUMN lv;
	lv.mask = LVCF_FMT | LVCF_TEXT | LVCF_WIDTH;
	lv.fmt = LVCFMT_LEFT;

	struct list_columns {
		char *oszName;
		int width;
	} asListColumns[] = {
		{ "Processor", cx*3/10 }, // 3
		{ "Input", cx/10 },       // 1
		{ "Output", cx*3/10 },    // 3
		{ "Name", cx*3/10 }       // 3
	};
	for (int iColumn= 0; iColumn < sizeof(asListColumns)/sizeof(asListColumns[0]); iColumn++) {
		lv.cx      = asListColumns[iColumn].width;
		lv.pszText = asListColumns[iColumn].oszName;
		ASSERTX( -1 != m_processListCtrl.InsertColumn(iColumn, &lv));
	}

	m_iconList.Create(GetSystemMetrics(SM_CXSMICON),
			GetSystemMetrics(SM_CYSMICON), TRUE, 1, 2); // this last param is a mystery

	HICON hiconItem;        // icon for list view items
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_Process));
	m_iconList.Add(hiconItem);
	DeleteObject(hiconItem);

	m_processListCtrl.SetImageList( &m_iconList, LVSIL_SMALL);

	populateListCtrl();
}



void CDlgProcessSequence::OnInsertAfter()
{
	insertProcess(FALSE);
}

void CDlgProcessSequence::OnInsertBefore()
{
	insertProcess(TRUE);
}


// before should be true if we're supposed to add the new
//  process before, false if we should insert it after
void CDlgProcessSequence::insertProcess(BOOL before)
{
	int iSelection =-1;
	CProcess* pProc =  getFirstSelectedProcess(&iSelection);
#ifndef hab15a7
	updateCheckBoxes();
#endif // hab15a7
	if(!m_ppProcesses->GetSize())	// empty list
	{
		before = FALSE;	// will insert After -1
	}
	else if(!pProc)// button should have been disabled
	{	ASSERTX(FALSE);
		return;
	}

	// 1) put up a dialog so the user can choose
	CDlgChooseProcessor dlg(m_pSequence);

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return;

//	CProcessTemplate* pTemplate = dlg.getFirstSelectedItem();

	if(!dlg.m_pChosenTemplate)
		return;

	// 2) if the user chose one, then add the process to our sequence
	pProc = dlg.m_pChosenTemplate->createProcess(m_pSequence->getFunctionCode());
	if(!pProc)
		return; // the template should have already informed the user

	int iLoc;
	if (before)
		iLoc = iSelection;
	else
		iLoc = 1+iSelection;

	m_ppProcesses->InsertAt(iLoc, pProc);

	// 3) let the process put up the edit dialog or a wizard

	populateListCtrl();
	selectItem(iLoc);

	UpdateData(FALSE);
}


// this is supposed to enable/disable all the buttons
// that depend on a selection; it sort of works
void CDlgProcessSequence::OnItemchangedProcessList(NMHDR* pNMHDR, LRESULT* pResult)
{
///	HWND hWnd = pNMHDR->hwndFrom;
//	CListCtrl* clc = (CListCtrl*) CWnd::FromHandle(hWnd);

	checkButtonStatus();
	*pResult = 0;
}

void CDlgProcessSequence::selectItem(int i)
{
	// this does select the item (ie if you ask, the control
	// will tell you that it is selected, but for some reason it doesn't
	// show as selected
	ASSERTX(i<m_processListCtrl.GetItemCount());
	// haven't written code to unselect selected items yet
	ASSERTX(m_processListCtrl.GetSelectedCount() == 0);
	m_processListCtrl.SetItemState(i, LVIS_SELECTED | LVIS_FOCUSED,
									LVIS_SELECTED | LVIS_FOCUSED);
	m_processListCtrl.RedrawItems(i,i);
}

void CDlgProcessSequence::checkButtonStatus()
{
	BOOL bHaveSelection =(m_processListCtrl.GetSelectedCount()>0);
	m_btnInsertAfter.EnableWindow(bHaveSelection);
	m_btnProperties.EnableWindow(bHaveSelection);
	m_btnRemove.EnableWindow(bHaveSelection);

	if(!m_ppProcesses->GetSize())
	{
		m_btnInsertBefore.SetWindowText("Insert...");
		m_btnInsertBefore.EnableWindow(TRUE);
	}
	else
	{
		m_btnInsertBefore.SetWindowText("Insert Before...");
		m_btnInsertBefore.EnableWindow(bHaveSelection);
	}
}

void CDlgProcessSequence::OnHelp()
{
	//int x = GetWindowContextHelpId( ) ;
	//TRACE("CDlgProcessSequence help id %d\n", x);
	//CDialog::CMDIFrameWnd::OnHelp();
	AfxGetApp()->WinHelp(CDlgProcessSequence::IDD+0x20000); // i couln't find *why* this 20000 is needed, but it is since the .hm file has the dialog+0x20000
}

void CDlgProcessSequence::OnOK()
{
	// assumes that the list here is the same as the list in the ctrl
#ifndef hab15a7
		updateCheckBoxes();
#else  // hab15a7
	for(int i=0; i< m_ppProcesses->GetSize() ; i++)
		(*m_ppProcesses)[i]->m_bEnabled = ListView_GetCheckState(m_processListCtrl.m_hWnd, i);
#endif // hab15a7
	CDialog::OnOK();
}

#ifndef hab15a7
void CDlgProcessSequence::updateCheckBoxes()
{
	for(int i=0; i< m_ppProcesses->GetSize() ; i++)
		(*m_ppProcesses)[i]->m_bEnabled = ListView_GetCheckState(m_processListCtrl.m_hWnd, i);
}
#endif // hab15a7

void CDlgProcessSequence::OnSize(UINT nType, int cx, int cy)
{
	CDialog::OnSize(nType, cx, cy);

	// TODO: Add your message handler code here
	vSize(this, cx, cy);
}

void CDlgProcessSequence::OnDestroy()
{
	CDialog::OnDestroy();

	// TODO: Add your message handler code here
	WINDOWPLACEMENT wp; /* wndpl */
	GetWindowPlacement(&wp);

	lPutWindowPlacement(oszDialogName, &wp);
}

void CDlgProcessSequence::OnGetMinMaxInfo(MINMAXINFO FAR* lpMMI)
{
	// TODO: Add your message handler code here and/or call default

	CDialog::OnGetMinMaxInfo(lpMMI);
	lpMMI->ptMinTrackSize.x = BASE_WIDTH * 2 + 2 * ::GetSystemMetrics(SM_CXFRAME);
	lpMMI->ptMinTrackSize.y = BASE_HEIGHT * 2 + 2 * ::GetSystemMetrics(SM_CYFRAME) +
							  ::GetSystemMetrics(SM_CYCAPTION);
//	lpMMI->ptMaxTrackSize.x = lpMMI->ptMinTrackSize.x;

}
