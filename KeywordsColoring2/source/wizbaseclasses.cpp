#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "WizBaseClasses.h"
#include "WizNewFromFiles.h"

/////////////////////////////////////////////////////////////////////////////
// CWizFilePage abstract superclass for all these property pages

IMPLEMENT_DYNCREATE(CWizPage, CPropertyPage)


BEGIN_MESSAGE_MAP(CWizPage, CPropertyPage)
	//{{AFX_MSG_MAP(CWizPage)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/*void CWizPage::setOwner(CPropertySheet* pOwner)
{
	m_pOwner = pOwner;
}
*/

//void CWizPage::DoDataExchange(CDataExchange* pDX)    // DDX/DDV support
//{
//}

CWizPage::CWizPage(int id)
://m_pOwner(NULL),
CPropertyPage(id)
{

}


BOOL CWizPage::OnSetActive()
{
	checkStatus();

	return CPropertyPage::OnSetActive();
}


// should be overridden to enable/disable next button
void CWizPage::checkStatus()
{
	CWnd* pW  = GetParent();
	if(pW->IsKindOf(RUNTIME_CLASS(CPropertySheet)))//CWizNewFromFiles)))
	{
		//ASSERTX(m_pOwner);
		//m_pOwner->
		((CPropertySheet*)pW)->SetWizardButtons(PSWIZB_BACK |  PSWIZB_NEXT ); // first page overrides this so back is ok
	}
}

void CWizPage::handleFileButton(CString& sPath, char* pszExtension, char* pszFilter)
{
	UpdateData(TRUE); // download any ctrl values, because we're going to upload at the end of this method
	CFileDialog	dlg( TRUE,
		pszExtension,
		sPath,
		OFN_FILEMUSTEXIST | OFN_HIDEREADONLY ,	// flags
		pszFilter, // filter
		NULL ); // parent window

	if(IDOK != dlg.DoModal())
	{
		sPath = "";	// let cancel be the way to clear a file
	}
	else
		sPath = dlg.GetPathName();
	UpdateData(FALSE);
	checkStatus();
}


CPropertySheet* CWizPage::getOwner()
{
	CWnd* pW  = GetParent();
	ASSERTX(pW);
	ASSERTX(pW->IsKindOf(RUNTIME_CLASS(CPropertySheet)));
	return (CPropertySheet*)pW;
}
