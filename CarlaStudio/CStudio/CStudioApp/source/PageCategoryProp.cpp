// PageCategoryProp.cpp : implementation file
//
// JDH 6/3/99 Added parameters to the constructor to all setting the caption at run-time

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "PageCategoryProp.h"
#include "PageAffixes.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageCategoryProp dialog


CPageCategoryProp::CPageCategoryProp(UINT nIDTemplate, UINT nIDCaption)
	: CPropertyPage(nIDTemplate, nIDCaption)
{
	//{{AFX_DATA_INIT(CPageCategoryProp)
	m_nCatPropScheme = 0;
	//}}AFX_DATA_INIT
}


void CPageCategoryProp::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);

	// may need to disable some options that don't make sense
	if(!pDX->m_bSaveAndValidate)
	{
	}

	//{{AFX_DATA_MAP(CPageCategoryProp)
	DDX_Radio(pDX, IDC_CatPropScheme, m_nCatPropScheme);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CPageCategoryProp, CPropertyPage)
	//{{AFX_MSG_MAP(CPageCategoryProp)
//	ON_COMMAND(ID_HELP, OnHelp)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


BOOL CPageCategoryProp::OnSetActive()
{
	CPropertySheet* psheet= (CPropertySheet*)GetParent();
	ASSERT(psheet->IsKindOf(RUNTIME_CLASS(CPropertySheet)));


	//const int kAffixesPage = 2;

	//CPageAffixes* pAffixes = (CPageAffixes*)psheet->GetPage(kAffixesPage);
	//ASSERT(pAffixes->IsKindOf(RUNTIME_CLASS(CPageAffixes)));

//jdh 6/3/99 change method of finding the affixes page from an absolute location
	// to searching for it
	CPageAffixes* pAffixes = NULL;
	for(int i=0; psheet->GetPageCount(); i++)
	{
		CPropertyPage *p = psheet->GetPage(i);
		if(p->IsKindOf(RUNTIME_CLASS(CPageAffixes)))
		{
			pAffixes = (CPageAffixes*)p;
			break;
		}
	}
	ASSERT(pAffixes);

	// handle case where there are no prefixes
	CWnd *pBtn = GetDlgItem(IDC_CatPropScheme);
	if(!pAffixes->m_bPrefixes)
	{
		pBtn->ModifyStyle(NULL, WS_DISABLED);
		if(m_nCatPropScheme==0) // 0 is now disabled
			m_nCatPropScheme = 1;
	}
	else
	{
		pBtn->ModifyStyle(WS_DISABLED, NULL);	// in case they went back and checked prefixes
	}

	// handle case where there are no suffixes
	pBtn = GetDlgItem(IDC_RADIOSfx);
	if(!pAffixes->m_bSuffixes)
	{
		pBtn->ModifyStyle(NULL, WS_DISABLED);
		if(m_nCatPropScheme==1) // 1 is now disabled
			m_nCatPropScheme = 2;
	}
	else
	{
		pBtn->ModifyStyle(WS_DISABLED, NULL);	// in case they went back and checked suffixes
	}

	// sometimes the change of m_nCatPropScheme didn't take without this
	UpdateData(FALSE);


	((CPropertySheet*)GetOwner())->SetWizardButtons(PSWIZB_NEXT | PSWIZB_BACK);
	return CPropertyPage::OnSetActive();
}
