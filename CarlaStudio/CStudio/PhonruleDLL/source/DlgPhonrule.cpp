// DlgPhonrule.cpp : implementation file
//

#include "..\stdafx.h"
#include "DlgPhonrule.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgPhonrule dialog


CDlgPhonrule::CDlgPhonrule(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgPhonrule::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgPhonrule)
	m_bTrace = FALSE;
	m_bMonitorRules = FALSE;
	//}}AFX_DATA_INIT
}



void CDlgPhonrule::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgPhonrule)
	DDX_Check(pDX, IDC_CHECKTrace, m_bTrace);
	DDX_Check(pDX, IDC_CHECKMonitor, m_bMonitorRules);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgPhonrule, CDialog)
	//{{AFX_MSG_MAP(CDlgPhonrule)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgPhonrule message handlers
