// DlgEditStampProcess.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgEditStampProcess.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampProcess dialog


CDlgEditStampProcess::CDlgEditStampProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditStampProcess::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditStampProcess)
	m_bCheckMorphnames = FALSE;
	m_bCheckRootCats = FALSE;
	m_bMonitorProgress = FALSE;
	m_bAllAllomorphCombos = FALSE;
	m_bPrintTestParseTrees = FALSE;
	m_bTrace = FALSE;
	//}}AFX_DATA_INIT
}


void CDlgEditStampProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditStampProcess)
	DDX_Check(pDX, IDC_CheckMorphnames, m_bCheckMorphnames);
	DDX_Check(pDX, IDC_CheckRootCats, m_bCheckRootCats);
	DDX_Check(pDX, IDC_MonitorProgress, m_bMonitorProgress);
	DDX_Check(pDX, IDC_OutputAllAllomorphs, m_bAllAllomorphCombos);
	DDX_Check(pDX, IDC_ParseTrees, m_bPrintTestParseTrees);
	DDX_Check(pDX, IDC_Trace, m_bTrace);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditStampProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgEditStampProcess)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampProcess message handlers
