// PageRootUnifiedDict.cpp : implementation file
//
// jdh 19Sept2000 made cancel button code actually execute.

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "PageRootUnifiedDict.h"
#include "PageDictMethod.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

LPCTSTR kUnifiedListLabel = _T("Dictionaries (Unified style)");
LPCTSTR kClassicListLabel = _T("Root Dictionaries");

LPCTSTR kUnifiedTabLabel = _T("Dicts");
LPCTSTR kClassicTabLabel = _T("Root Dicts");

LPCTSTR kUnifiedWizLabel = _T("Choose existing dictionaries");
LPCTSTR kClassicWizLabel = _T("Choose existing root dictionaries");

/////////////////////////////////////////////////////////////////////////////
// CPageRootUnifiedDict property page

IMPLEMENT_DYNAMIC(CPageRootUnifiedDict, CWizPage)

CPageRootUnifiedDict::CPageRootUnifiedDict(CFileList* pRootFileList,
										   BOOL bUnifiedMode,
										   CPageDictAffixes* pPageAffixDicts,
										   LPCTSTR pszTitleUnified,
										   LPCTSTR pszTitleClassic)
:	CWizPage(CPageRootUnifiedDict::IDD),
	m_fileListCtrl(pRootFileList, ".dic", IDS_Filter_Dictionary),
	m_bUnifiedMode(bUnifiedMode),
	m_pPageAffixDicts(pPageAffixDicts)
{

	if(!pszTitleUnified)
	{
		m_psp.pszTitle = bUnifiedMode?kUnifiedTabLabel:kClassicTabLabel;
	}
	else
	{
		m_psp.pszTitle = bUnifiedMode?pszTitleUnified:pszTitleClassic;
	}
	m_psp.dwFlags |= PSP_USETITLE;
//	m_psp.dwFlags &= ~PSP_HASHELP; // no help yet

	//{{AFX_DATA_INIT(CPageRootUnifiedDict)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

CPageRootUnifiedDict::~CPageRootUnifiedDict()
{
}

void CPageRootUnifiedDict::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageRootUnifiedDict)
	DDX_Control(pDX, IDC_BtnRemove, m_btnRemoveDict);
	DDX_Control(pDX, IDC_BtnAddRoot, m_btnAddDict);
	DDX_Control(pDX, IDC_RootDicts, m_fileListCtrl);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPageRootUnifiedDict, CPropertyPage)
	//{{AFX_MSG_MAP(CPageRootUnifiedDict)
	ON_BN_CLICKED(IDC_BtnAddRoot, OnBtnAddRoot)
	ON_BN_CLICKED(IDC_BtnRemove, OnBtnRemove)
	ON_BN_CLICKED(IDC_BtnDictMethod, OnBtnDictMethod)
	//}}AFX_MSG_MAP
	ON_NOTIFY_EX( TTN_NEEDTEXT, 0, OnToolTip )
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageRootUnifiedDict message handlers

BOOL CPageRootUnifiedDict::OnInitDialog()
{
	CPropertyPage::OnInitDialog();

	//m_fileListCtrl.SubclassDlgItem (IDC_FileList, this);
	m_fileListCtrl.populate();

	m_btnRemoveDict.SetBitmap(IDB_Delete);
	m_btnAddDict.SetBitmap(IDB_AddFile);

	checkStatus();

	EnableToolTips(TRUE);

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

BOOL CPageRootUnifiedDict::OnToolTip(UINT id, NMHDR *pTTTStruct, LRESULT *pResult)
{
	TOOLTIPTEXT *pTTT = (TOOLTIPTEXT *)pTTTStruct;
	UINT nID =pTTTStruct->idFrom;
	if (pTTT->uFlags & TTF_IDISHWND)
	{
		// idFrom is actually the HWND of the tool
		nID = ::GetDlgCtrlID((HWND)nID);


		// don't want a seperate string rsrc for every add buttton
		if(nID == IDC_BtnAddRoot)
			nID = IDS_TTAddFile;

		if(nID)
		{
			pTTT->lpszText = MAKEINTRESOURCE(nID);	// assumes the id has a string id
			pTTT->hinst = AfxGetResourceHandle();
			return(TRUE);
		}
	}
	return FALSE;
}

void CPageRootUnifiedDict::OnBtnAddRoot()
{
	m_fileListCtrl.OnAddButton();
	checkStatus();
}

void CPageRootUnifiedDict::OnBtnRemove()
{
	m_fileListCtrl.OnRemoveButton();
	checkStatus();
}

void CPageRootUnifiedDict::OnOK()
{
	m_fileListCtrl.OnOK();

	CPropertyPage::OnOK();
}

// jdh 19Sept2000 added this method to fix cancel button
void CPageRootUnifiedDict::OnCancel()
{
	m_fileListCtrl.OnCancel();

	CPropertyPage::OnCancel();
}

void CPageRootUnifiedDict::checkStatus()
{
	if(!this->m_hWnd)
		return;

	DWORD nNextOrFinish = PSWIZB_NEXT;

	// are we the last page in the wizard?
	if(getOwner()->GetPageIndex(this) + 1 == getOwner()->GetPageCount())
		nNextOrFinish = PSWIZB_FINISH;

	if (m_fileListCtrl.isEmpty()) //!m_sRoot1Path.GetLength())
		getOwner()->SetWizardButtons(PSWIZB_BACK);	//PSWIZB_BACK should be removed once all other pages have their own classes <-- huh?
	else
		getOwner()->SetWizardButtons(nNextOrFinish | PSWIZB_BACK); // "  "  "
	// set the tab to reflect our status as all the dicts or just the roots

	setLabelMode(getOwner(), m_bUnifiedMode);
}

// called by pageAnalysisFiles is parsing the *.cmd file
void CPageRootUnifiedDict::addRootDictPathD(CPathDescriptor *pd)
{
	m_fileListCtrl.addFilePathD(pd);
}

void CPageRootUnifiedDict::setLabelMode(CPropertySheet* ps, BOOL bIsUnified)
{
	// ps is needed because we can't get our owner unless our window has been
	// built, which apparently doesn't happen until we have been the active
	// page.  in the meantime, we will be called on to set our tab correctly.

	m_bUnifiedMode = bIsUnified;

	if(ps->m_hWnd)	// is our property sheet visible?
	{
		CString sCaption;
		if(m_bUnifiedMode)
			sCaption = _T("Dicts");
		else
			sCaption = _T("Root Dicts");

		TC_ITEM tcItem;
		tcItem.mask = TCIF_TEXT;
		tcItem.pszText = (LPTSTR)((LPCTSTR)sCaption);
		int n = ps->GetPageIndex(this);
		ps->GetTabControl()->SetItem(n, &tcItem );
	}

	// set the label on the group box surrounding the file list
	if(m_hWnd)
	{
		CWnd *pLabel = GetDlgItem(IDC_DictListLabel);
		pLabel->SetWindowText(m_bUnifiedMode?kUnifiedListLabel:kClassicListLabel);
	}
}


void CPageRootUnifiedDict::OnBtnDictMethod()
{
	CPropertySheet sheet;
	sheet.AddPage(new CPageDictMethod(m_bUnifiedMode, getOwner(), m_pPageAffixDicts));

	// always applies immediately anyhow, so hide this button
	sheet.m_psh.dwFlags |= PSH_NOAPPLYNOW;

	// this sheet is too dumb to properly cancel, so hide that button
	// doesn't work because it's not created yet
	//CWnd *pBtn = sheet.GetDlgItem(IDCANCEL);
	//ASSERT(pBtn);
	//pBtn->ModifyStyle(WS_VISIBLE, NULL);

	sheet.DoModal();
}

BOOL CPageRootUnifiedDict::OnSetActive()
{
	// don't show the "change dict method" button in wizards,
	// because that choice will belong to its own page
	if(getOwner()->m_psh.dwFlags &  PSH_WIZARD  )
	{
		CWnd *pBtn = GetDlgItem(IDC_BtnDictMethod);
		pBtn->ModifyStyle(WS_VISIBLE, NULL);
	}

	checkStatus();

	return CPropertyPage::OnSetActive();
}

//DEL BOOL CPageRootUnifiedDict::OnWizardFinish()
//DEL {
//DEL OnOK();
//DEL 	return CPropertyPage::OnWizardFinish();
//DEL }


// called by pageAnalysis when it parses the CMD file
// we want to do what the dictMethod page does, without showing it
// pSheet is needed because this can't get its owner if its never been displayed
void CPageRootUnifiedDict::setModeAndManageAffixPage(CPropertySheet* pSheet, BOOL bUnifiedMode)
{
	m_bUnifiedMode = bUnifiedMode;
	CPageDictMethod::manageAffixPage(pSheet, m_pPageAffixDicts, m_bUnifiedMode);
}
