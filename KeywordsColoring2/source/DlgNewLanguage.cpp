// DlgNewLanguage.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgNewLanguage.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgNewLanguage dialog


CDlgNewLanguage::CDlgNewLanguage(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgNewLanguage::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgNewLanguage)
	m_iCreationMethod = 0;
	//}}AFX_DATA_INIT
}


void CDlgNewLanguage::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgNewLanguage)
	DDX_Radio(pDX, IDC_radioFunction1, m_iCreationMethod);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgNewLanguage, CDialog)
	//{{AFX_MSG_MAP(CDlgNewLanguage)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgNewLanguage message handlers
