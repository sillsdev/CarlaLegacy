// DlgProjectOpenOrCreate.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "DlgProjectOpenOrCreate.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgProjectOpenOrCreate dialog


CDlgProjectOpenOrCreate::CDlgProjectOpenOrCreate(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgProjectOpenOrCreate::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgProjectOpenOrCreate)
	m_iWhatToDo = 1;
	//}}AFX_DATA_INIT
}


void CDlgProjectOpenOrCreate::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgProjectOpenOrCreate)
	DDX_Radio(pDX, IDC_RProjectWizard, m_iWhatToDo);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgProjectOpenOrCreate, CDialog)
	//{{AFX_MSG_MAP(CDlgProjectOpenOrCreate)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()
