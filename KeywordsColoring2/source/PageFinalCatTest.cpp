// PageFinalCatTest.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "PageFinalCatTest.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageFinalCatTest property page

IMPLEMENT_DYNCREATE(CPageFinalCatTest, CPropertyPage)

CPageFinalCatTest::CPageFinalCatTest() : CPropertyPage(CPageFinalCatTest::IDD)
{
	m_psp.dwFlags &= ~PSP_HASHELP; // no help yet
	//{{AFX_DATA_INIT(CPageFinalCatTest)
	m_bCreateFinalCatTest = TRUE;
	m_bDisableFinalCatTest = TRUE;
	//}}AFX_DATA_INIT
}

CPageFinalCatTest::~CPageFinalCatTest()
{
}

void CPageFinalCatTest::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageFinalCatTest)
	DDX_Check(pDX, IDC_CHECKCreateFinalCatTest, m_bCreateFinalCatTest);
	DDX_Check(pDX, IDC_CHECKDisableFinalCat, m_bDisableFinalCatTest);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPageFinalCatTest, CPropertyPage)
	//{{AFX_MSG_MAP(CPageFinalCatTest)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageFinalCatTest message handlers

BOOL CPageFinalCatTest::OnSetActive()
{
	((CPropertySheet*)GetOwner())->SetWizardButtons(PSWIZB_NEXT | PSWIZB_BACK);
	return CPropertyPage::OnSetActive();
}
