// WizNewFromCarla.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "WizNewFromCarla.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#include "ProjectDoc.h"

/////////////////////////////////////////////////////////////////////////////
// CWizNewFromCarla

IMPLEMENT_DYNAMIC(CWizNewFromCarla, CPropertySheet)

CWizNewFromCarla::CWizNewFromCarla(CProjectDoc* pProj)
: CPropertySheet(IDS_NewFromCarlaWizCaption),
	//m_cmenuPage(),
	//m_srcLangDisplayPage(),
	//m_tarLangDisplayPage(),
	//m_projectPage(),
	m_srcLangDisplayPage(NULL, TRUE), // true == abrev is  readonly
	m_tarLangDisplayPage(NULL, TRUE), // true == abrev is  readonly
	m_pProjectDoc(pProj)
{
	AddPage(&m_cmenuPage);
	AddPage(&m_srcLangDisplayPage);
	// may be removed when we know if there is a target
	AddPage(&m_tarLangDisplayPage);
	AddPage(&m_projectPage);

	SetWizardMode( );
}

/*CWizNewFromCarla::CWizNewFromCarla(UINT nIDCaption, CWnd* pParentWnd, UINT iSelectPage)
	:CPropertySheet(nIDCaption, pParentWnd, iSelectPage)
{
}

CWizNewFromCarla::CWizNewFromCarla(LPCTSTR pszCaption, CWnd* pParentWnd, UINT iSelectPage)
	:CPropertySheet(pszCaption, pParentWnd, iSelectPage)
{
}
*/
CWizNewFromCarla::~CWizNewFromCarla()
{
}


int CWizNewFromCarla::DoModal()
{
	int x = CPropertySheet::DoModal();

	// there's something I don't understand about wizards; DoModal is supposed
	// to return only IDCancel or IDOK.  However, when the user clicks on
	// the FINISH button, I'm getting something like 1235.  So this hack
	// patches the problem

	if(x != IDCANCEL)
		x = IDOK;

	return x;
}

BEGIN_MESSAGE_MAP(CWizNewFromCarla, CPropertySheet)
	//{{AFX_MSG_MAP(CWizNewFromCarla)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWizNewFromCarla message handlers
