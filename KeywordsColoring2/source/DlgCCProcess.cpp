// DlgCCProcess.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgCCProcess.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgCCProcess dialog


CDlgCCProcess::CDlgCCProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgCCProcess::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgCCProcess)
	m_sName = _T("");
	m_sDescription = _T("");
	m_iFileType = -1;
	m_sTablePath = _T("");
	//}}AFX_DATA_INIT
}


void CDlgCCProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgCCProcess)
	DDX_Control(pDX, IDC_BUTTONBrowseTableFile, m_btnTablePath);
	DDX_Text(pDX, IDC_EDITName, m_sName);
	DDX_Text(pDX, IDC_EDITDescription, m_sDescription);
	DDX_Radio(pDX, IDC_RADIOFileKind, m_iFileType);
	DDX_Text(pDX, IDC_STATICTablePath, m_sTablePath);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgCCProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgCCProcess)
	ON_BN_CLICKED(IDC_BUTTONBrowseTableFile, OnButtonTablePath)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgCCProcess message handlers

void CDlgCCProcess::OnButtonTablePath()
{
	UpdateData(TRUE); // download any ctrl values, because we're going to upload at the end of this method
	CFileDialog	dlg( TRUE,
		NULL, //ext
		m_sTablePath,
		OFN_FILEMUSTEXIST | OFN_HIDEREADONLY ,	// flags
		"CC Tables(*.cct)|*.cct||", // filter
		NULL ); // parent window

	if(IDOK != dlg.DoModal())
	{
		m_sTablePath = "";	// let cancel be the way to clear a file
	}
	else
		m_sTablePath = dlg.GetPathName();
	UpdateData(FALSE);
	//checkStatus();
}

void CDlgCCProcess::OnOK()
{
	// TODO: Add extra validation here

	CDialog::OnOK();
}
