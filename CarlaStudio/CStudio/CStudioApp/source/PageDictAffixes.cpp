// PageDictAffixes.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "PageDictAffixes.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageDictAffixes dialog

IMPLEMENT_DYNCREATE(CPageDictAffixes, CWizPage)

CPageDictAffixes::CPageDictAffixes(LPCTSTR lpszTitle)
: CWizPage(CPageDictAffixes::IDD)
{
	if(lpszTitle)
	{
		m_psp.pszTitle = lpszTitle;
		m_psp.dwFlags |= PSP_USETITLE;
	}
//	m_psp.dwFlags &= ~PSP_HASHELP; // no help yet


	//{{AFX_DATA_INIT(CPageDictAffixes)
	m_sInfixPath = _T("");
	m_sPrefixPath = _T("");
	m_sSuffixPath = _T("");
	//}}AFX_DATA_INIT
}

CPageDictAffixes::~CPageDictAffixes()
{
}

void CPageDictAffixes::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageDictAffixes)
	DDX_Control(pDX, IDC_BTNSuffix, m_btnAddSuffix);
	DDX_Control(pDX, IDC_BTNPrefix, m_btnAddPrefix);
	DDX_Control(pDX, IDC_BTNInfix, m_btnAddInfix);
	DDX_Text(pDX, IDC_Infix, m_sInfixPath);
	DDX_Text(pDX, IDC_Prefix, m_sPrefixPath);
	DDX_Text(pDX, IDC_Suffix, m_sSuffixPath);
	//}}AFX_DATA_MAP

	if(pDX->m_bSaveAndValidate)
	{
		if(	m_sPrefixPath.GetLength()==0
			&& m_sInfixPath.GetLength()==0
			&& m_sSuffixPath.GetLength() ==0)
		{
			//disabled because this is called even when the user is first clicking on a button to add the first dict.
				//AfxMessageBox("Warning: you have selected the \"classic\" dictionary organization method, but no affix dictionaries have been specified");

		}
	}
}


BEGIN_MESSAGE_MAP(CPageDictAffixes, CDialog)
	//{{AFX_MSG_MAP(CPageDictAffixes)
	ON_BN_CLICKED(IDC_BTNPrefix, OnBTNPrefix)
	ON_BN_CLICKED(IDC_BTNInfix, OnBTNInfix)
	ON_BN_CLICKED(IDC_BTNSuffix, OnBTNSuffix)
	ON_NOTIFY_EX( TTN_NEEDTEXT, 0, OnToolTip )
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageDictAffixes message handlers

void CPageDictAffixes::OnBTNPrefix()
{
	handleFileButton(m_sPrefixPath, "dic", "Prefix Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||");
}

void CPageDictAffixes::OnBTNInfix()
{
	handleFileButton(m_sInfixPath, "dic", "Infix Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||");
}

void CPageDictAffixes::OnBTNSuffix()
{
	handleFileButton(m_sSuffixPath, "dic", "Suffic Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||");
}

BOOL CPageDictAffixes::OnInitDialog()
{
	CPropertyPage::OnInitDialog();

	m_btnAddPrefix.SetBitmap(IDB_AddFile);
	m_btnAddSuffix.SetBitmap(IDB_AddFile);
	m_btnAddInfix.SetBitmap(IDB_AddFile);

	EnableToolTips(TRUE);

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

BOOL CPageDictAffixes::OnToolTip(UINT id, NMHDR *pTTTStruct, LRESULT *pResult)
{
	TOOLTIPTEXT *pTTT = (TOOLTIPTEXT *)pTTTStruct;
	UINT nID =pTTTStruct->idFrom;
	if (pTTT->uFlags & TTF_IDISHWND)
	{
		// idFrom is actually the HWND of the tool
		nID = ::GetDlgCtrlID((HWND)nID);


		// don't want a seperate string rsrc for every add buttton
		if(nID == IDC_BTNPrefix
			|| nID == IDC_BTNSuffix
			|| nID == IDC_BTNInfix)
			nID = IDS_TTAddFile;

		if(nID)
		{
			pTTT->lpszText = MAKEINTRESOURCE(nID);	// assumes the id has a string id
			pTTT->hinst = AfxGetResourceHandle();
			return TRUE;
		}
	}
	return FALSE;
}

void CPageDictAffixes::checkStatus()
{
	if(!this->m_hWnd)
		return;

	DWORD nNextOrFinish = PSWIZB_NEXT;

	// are we the last page in the wizard?
	if(getOwner()->GetPageIndex(this) + 1 == getOwner()->GetPageCount())
		nNextOrFinish = PSWIZB_FINISH;

	getOwner()->SetWizardButtons(nNextOrFinish | PSWIZB_BACK); // "  "  "
}
