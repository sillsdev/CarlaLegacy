// PageInputDocPanels.cpp : implementation file
//

#include "stdafx.h"
#include "../resource.h"
#include "PageInputDocPanels.h"
//#include "CWProcess.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageInputDocPanels dialog


CPageInputDocPanels::CPageInputDocPanels(CResultDescriptorArray* pDescriptors,
										 CArray<bool, bool> * ppanelAvailability)
	:  m_pDescriptors(pDescriptors),
		CPropertyPage(CPageInputDocPanels::IDD),
		m_ppanelAvailability(ppanelAvailability) // may be null
{
	if(m_ppanelAvailability)	// must be a one-to-one mapping if we have one
		ASSERTX(m_ppanelAvailability->GetSize() == pDescriptors->GetSize());
	m_bDoReloadList=TRUE;

	//{{AFX_DATA_INIT(CPageInputDocPanels)
	m_sPanelDetails = _T("");
	m_bShowAvailableOnly = TRUE;
	//}}AFX_DATA_INIT
}


void CPageInputDocPanels::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageInputDocPanels)
	DDX_Control(pDX, IDC_InputDocPanelList, m_panelList);
	DDX_Text(pDX, IDC_PanelDetails, m_sPanelDetails);
	DDX_Check(pDX, IDC_availableOnly, m_bShowAvailableOnly);
	//}}AFX_DATA_MAP

	if(!pDX->m_bSaveAndValidate && m_bDoReloadList) // loading for first time
	{
		m_panelList.ResetContent();	// clear all the items out
		m_bDoReloadList=FALSE;
		for(int i=0; i< m_pDescriptors->GetSize(); i++)
		{
			if(!m_bShowAvailableOnly || ((m_ppanelAvailability && m_ppanelAvailability->GetAt(i))))
			{
				CString s = m_pDescriptors->ElementAt(i).getListDisplayString();
				//if(m_ppanelAvailability && m_ppanelAvailability->GetAt(i))
				//	s+= " *";
				int index = m_panelList.AddString(s);
				m_panelList.SetItemData(index, (DWORD)&m_pDescriptors->ElementAt(i));// ALLOWS US TO match items to descriptors even if some are hidden
				m_panelList.SetCheck(index, m_pDescriptors->ElementAt(i).m_bShow);
			}
		}
	}

	if(pDX->m_bSaveAndValidate)
	{
		for(int i=0; i< m_panelList.GetCount(); i++)
		{
			CResultStreamDescriptor* pRSD = (CResultStreamDescriptor*)m_panelList.GetItemData(i);
			ASSERTX(pRSD->IsKindOf(RUNTIME_CLASS(CResultStreamDescriptor)));
			pRSD->m_bShow = m_panelList.GetCheck(i);
		}
	}
}


BEGIN_MESSAGE_MAP(CPageInputDocPanels, CDialog)
	//{{AFX_MSG_MAP(CPageInputDocPanels)
	ON_WM_CREATE()
	ON_WM_CANCELMODE()
	ON_LBN_SELCHANGE(IDC_InputDocPanelList, OnSelchangePanelList)
	ON_BN_CLICKED(IDC_availableOnly, OnAvailableOnlyButton)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageInputDocPanels message handlers

BOOL CPageInputDocPanels::OnInitDialog()
{
	m_panelList.SubclassDlgItem(IDD_PageInputDocPanels, this);
	CDialog::OnInitDialog();


	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

int CPageInputDocPanels::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CDialog::OnCreate(lpCreateStruct) == -1)
		return -1;

	return 0;
}

void CPageInputDocPanels::OnCancelMode()
{
	CDialog::OnCancelMode();

	// TODO: Add your message handler code here

}

BOOL CPanelListBox::Create( DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID )
{
 BOOL x = CCheckListBox::Create( WS_CHILD|WS_VISIBLE | LBS_HASSTRINGS | LBS_OWNERDRAWFIXED|  dwStyle,  rect,  pParentWnd,  nID );
	ModifyStyleEx(NULL, WS_EX_CLIENTEDGE);
	return x;
}

void CPageInputDocPanels::OnSelchangePanelList()
{
//clistbox
	for(int i=0; i< m_panelList.GetCount(); i++)
		if(m_panelList.GetSel(i))
			break;

	if(i == m_panelList.GetCount())
		return; // no selection

	CResultStreamDescriptor* pRSD = (CResultStreamDescriptor*)m_panelList.GetItemData(i);
	ASSERTX(pRSD->IsKindOf(RUNTIME_CLASS(CResultStreamDescriptor)));
	pRSD->m_bShow = m_panelList.GetCheck(i);

	m_sPanelDetails =pRSD->getDetailsText();
	//m_sPanelDetails = m_pDescriptors->ElementAt(i).getDetailsText();
	UpdateData(FALSE); // display the change
}

void CPageInputDocPanels::OnAvailableOnlyButton()
{
	m_bShowAvailableOnly = !m_bShowAvailableOnly;
	m_bDoReloadList=TRUE;
	UpdateData(FALSE); // display the change
}

void CPageInputDocPanels::WinHelp(DWORD dwData, UINT nCmd)
{
	// TODO: Add your specialized code here and/or call the base class

	CDialog::WinHelp(dwData, nCmd);
}
