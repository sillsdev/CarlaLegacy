// DlgBatchProcess.cpp : implementation file
//
// 2.1.0 06-Mar-2000 hab Initial coding
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "..\resource.h"
#include "DlgBatchProcess.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgBatchProcess dialog


CDlgBatchProcess::CDlgBatchProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgBatchProcess::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgBatchProcess)
	m_sName = _T("");
	m_sDescription = _T("");
	m_iFileType = -1;
	m_sBatchPath = _T("");
	//}}AFX_DATA_INIT
}


void CDlgBatchProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgBatchProcess)
	DDX_Control(pDX, IDC_BUTTONBrowseBatchFile, m_btnBatchPath);
	DDX_Text(pDX, IDC_EDITName, m_sName);
	DDX_Text(pDX, IDC_EDITDescription, m_sDescription);
	DDX_Radio(pDX, IDC_RADIOBatchFileKind, m_iFileType);
	DDX_Text(pDX, IDC_STATICBatchPath, m_sBatchPath);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgBatchProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgBatchProcess)
	ON_BN_CLICKED(IDC_BUTTONBrowseBatchFile, OnButtonBatchPath)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgBatchProcess message handlers

void CDlgBatchProcess::OnButtonBatchPath()
{
	UpdateData(TRUE); // download any ctrl values, because we're going to upload at the end of this method
	CFileDialog	dlg( TRUE,
		NULL, //ext
		m_sBatchPath,
		OFN_FILEMUSTEXIST | OFN_HIDEREADONLY ,	// flags
		"Batch files(*.bat)|*.bat||", // filter
		NULL ); // parent window

	if(IDOK != dlg.DoModal())
	{
		m_sBatchPath = "";	// let cancel be the way to clear a file
	}
	else
		m_sBatchPath = dlg.GetPathName();
	UpdateData(FALSE);
	//checkStatus();
}

void CDlgBatchProcess::OnOK()
{
	// TODO: Add extra validation here

	CDialog::OnOK();
}
