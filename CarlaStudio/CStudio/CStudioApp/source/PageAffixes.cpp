// PageAffixes.cpp : implementation file
//
// JDH 6/3/99 Added parameters to the constructor to all setting the caption at run-time

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "PageAffixes.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageAffixes property page

IMPLEMENT_DYNCREATE(CPageAffixes, CPropertyPage)

CPageAffixes::CPageAffixes(UINT nIDTemplate/*=CPageAffixes::IDD*/, UINT nIDCaption/*=0*/)
: CPropertyPage(nIDTemplate, nIDCaption)
{
//	m_psp.dwFlags &= ~PSP_HASHELP; // no help yet
	//{{AFX_DATA_INIT(CPageAffixes)
	m_bInfixes = FALSE;
	m_bPrefixes = FALSE;
	m_bSuffixes = TRUE;
	//}}AFX_DATA_INIT
}

CPageAffixes::~CPageAffixes()
{
}

void CPageAffixes::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageAffixes)
	DDX_Check(pDX, IDC_CHECKIfx, m_bInfixes);
	DDX_Check(pDX, IDC_CHECKPfx, m_bPrefixes);
	DDX_Check(pDX, IDC_CHECKSfx, m_bSuffixes);
	//}}AFX_DATA_MAP

}


BEGIN_MESSAGE_MAP(CPageAffixes, CPropertyPage)
	//{{AFX_MSG_MAP(CPageAffixes)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageAffixes message handlers

/*void CPageAffixes::checkStatus()
{
	if (!(m_bInfixes || m_bPrefixes || m_bSuffixes))
		GetOwner()->SetWizardButtons(PSWIZB_BACK);
	else
		GetOwner()->SetWizardButtons(PSWIZB_NEXT | PSWIZB_BACK); // "  "  "
}
*/

BOOL CPageAffixes::OnSetActive()
{
	// turn off the "back" button if we're the first page
	CPropertySheet* p = (CPropertySheet*)GetParent();
	if(p->GetPage(0) == this)
		p->SetWizardButtons(PSWIZB_NEXT );//|PSWIZB_FINISH);
	else
		p->SetWizardButtons(PSWIZB_NEXT | PSWIZB_BACK);



	return CPropertyPage::OnSetActive();
}
