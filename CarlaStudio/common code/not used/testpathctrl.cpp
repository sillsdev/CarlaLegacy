// testpathctrl.cpp : implementation file
//

#include "stdafx.h"
#include "..\Mex\mex.h"
#include "testpathctrl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTestPathCtrl dialog


CTestPathCtrl::CTestPathCtrl(CWnd* pParent /*=NULL*/)
	: CPropertyPage(CTestPathCtrl::IDD),
	m_test(NULL, "", "txt", IDB_New, NULL, NULL, NULL, CPathCtrl::kSelectFolder)
{
	//{{AFX_DATA_INIT(CTestPathCtrl)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CTestPathCtrl::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTestPathCtrl)
	DDX_Control(pDX, IDC_test, m_test);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CTestPathCtrl, CPropertyPage)
	//{{AFX_MSG_MAP(CTestPathCtrl)
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTestPathCtrl message handlers

BOOL CTestPathCtrl::OnInitDialog()
{
	CDialog::OnInitDialog();

	m_test.init();

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

void CTestPathCtrl::OnCancel()
{
	// TODO: Add extra cleanup here

	CDialog::OnCancel();
}

void CTestPathCtrl::OnButton1()
{
	// TODO: Add your control notification handler code here

}
