// DlgEditStampFlag.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgEditStampFlag.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampFlag dialog


CDlgEditStampFlag::CDlgEditStampFlag(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditStampFlag::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditStampFlag)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sFlag = _T("");
	m_sMorphemes = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditStampFlag::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditStampFlag)
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_sComments, m_sComments);
	DDX_Text(pDX, IDC_sFlag, m_sFlag);
	DDX_Text(pDX, IDC_sMorphemes, m_sMorphemes);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditStampFlag, CDialog)
	//{{AFX_MSG_MAP(CDlgEditStampFlag)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampFlag message handlers
