// DlgEditIntergenProcess.cpp : implementation file
//
// 2.1.5 28-Mar-2000 hab Added apply output changes as a boolean
//////////////////////////////////////////////////////////////////

#include "stdafx.h"
//#include "CarlaStudioApp.h"
#include "DlgEditIntergenProcess.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditIntergenProcess dialog


CDlgEditIntergenProcess::CDlgEditIntergenProcess(CIntergenProcess* pIntergenProcess)
	: CDialog(CDlgEditIntergenProcess::IDD, NULL),
		m_fieldList(pIntergenProcess)
{
	//{{AFX_DATA_INIT(CDlgEditIntergenProcess)
	m_sDecompChar = _T("");
	m_bUseSFMarkers = FALSE;
	m_iMaxLineLength = 0;
	m_bAllDecompAmbiguities = FALSE;
	m_bApplyOutputChanges = FALSE;
	//}}AFX_DATA_INIT
}


void CDlgEditIntergenProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditIntergenProcess)
	DDX_Control(pDX, IDC_FieldList, m_fieldList);
	DDX_Text(pDX, IDC_DecompChar, m_sDecompChar);
	DDV_MaxChars(pDX, m_sDecompChar, 1);
	DDX_Check(pDX, IDC_UseSFMarkers, m_bUseSFMarkers);
	DDX_Text(pDX, IDC_MaxLineLength, m_iMaxLineLength);
	DDV_MinMaxUInt(pDX, m_iMaxLineLength, 10, 10000);
	DDX_Check(pDX, IDC_allDecompAmbiguities, m_bAllDecompAmbiguities);
	DDX_Check(pDX, IDC_CHECK_IntergenOutputChanges, m_bApplyOutputChanges);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditIntergenProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgEditIntergenProcess)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditIntergenProcess message handlers

BOOL CDlgEditIntergenProcess::OnInitDialog()
{
	CDialog::OnInitDialog();


	m_fieldList.finishCreate();
	m_fieldList.populate();
	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgEditIntergenProcess::OnOK()
{
	m_fieldList.onOK();
	CDialog::OnOK();
}
