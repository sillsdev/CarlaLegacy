// PageCatFinalModifyTests.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "pagecatfinalmodifytests.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageCatFinalModifyTest property page

IMPLEMENT_DYNCREATE(CPageCatFinalModifyTest, CPropertyPage)

CPageCatFinalModifyTest::CPageCatFinalModifyTest(UINT nIDTemplate/*=CPageCatFinalModifyTest::IDD*/, UINT nIDCaption/*=0*/)
: CPropertyPage(nIDTemplate, nIDCaption)
{
	m_psp.dwFlags &= ~PSP_HASHELP; // no help yet
	//{{AFX_DATA_INIT(CPageCatFinalModifyTest)
	m_bDisableFinalCatTest = FALSE;
	m_bCreateFinalCatTests = FALSE;
	//}}AFX_DATA_INIT
}

CPageCatFinalModifyTest::~CPageCatFinalModifyTest()
{
}

void CPageCatFinalModifyTest::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageCatFinalModifyTest)
	DDX_Check(pDX, IDC_CHECKDisableFinalCatModifyTests, m_bDisableFinalCatTest);
	DDX_Check(pDX, IDC_CHECKCreateFinalCatTestModifyTests, m_bCreateFinalCatTests);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPageCatFinalModifyTest, CPropertyPage)
	//{{AFX_MSG_MAP(CPageCatFinalModifyTest)
	ON_BN_CLICKED(IDC_CHECKCreateFinalCatTestModifyTests, OnCHECKCreateFinalCatTestModifyTests)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageCatFinalModifyTest message handlers

BOOL CPageCatFinalModifyTest::OnSetActive()
{
	((CPropertySheet*)GetOwner())->SetWizardButtons(PSWIZB_NEXT | PSWIZB_BACK);
	return CPropertyPage::OnSetActive();
}

void CPageCatFinalModifyTest::OnCHECKCreateFinalCatTestModifyTests()
{
	CButton* pB = (CButton*)GetDlgItem(IDC_CHECKCreateFinalCatTestModifyTests);
	CEdit* pE = (	CEdit*)GetDlgItem(IDC_CHECKDisableFinalCatModifyTests);
	if(pB && pE)
		pE->EnableWindow(pB->GetCheck());
}
