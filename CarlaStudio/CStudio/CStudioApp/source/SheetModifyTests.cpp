// SheetModifyTests.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "SheetModifyTests.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

BOOL CPageModifyTestFinish::OnSetActive()
{
	// turn off the next button
	((CPropertySheet*)GetParent())->SetWizardButtons(PSWIZB_BACK | PSWIZB_FINISH);

	return CPropertyPage::OnSetActive();
}

/////////////////////////////////////////////////////////////////////////////
// CSheetModifyTests

IMPLEMENT_DYNAMIC(CSheetModifyTests, CPropertySheet)

CSheetModifyTests::CSheetModifyTests(CWnd* pParentWnd, UINT iSelectPage)
	:CPropertySheet("Modify Tests", pParentWnd, iSelectPage),
	// we have to change the captions here from what they are in the wizard
	m_affixesPage(CPageAffixes::IDD , IDS_ModifyTestsAffixPage),
	m_categoryPropogationPage(CPageCategoryProp::IDD , IDS_ModifyTestsCatPropPage)
{
	//m_psh.dwFlags |=  PSH_WIZARD | PSH_WIZARDHASFINISH;
	AddPage(&m_affixesPage);
	AddPage(&m_categoryPropogationPage);
	AddPage(&m_finishPage);

	SetWizardMode();
}

CSheetModifyTests::~CSheetModifyTests()
{
}


BEGIN_MESSAGE_MAP(CSheetModifyTests, CPropertySheet)
	//{{AFX_MSG_MAP(CSheetModifyTests)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSheetModifyTests message handlers
