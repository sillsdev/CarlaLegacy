// DlgEditAmpleProcess.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "DlgEditAmpleProcess.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditAmpleProcess dialog


CDlgEditAmpleProcess::CDlgEditAmpleProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditAmpleProcess::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditAmpleProcess)
	m_bCheckMorphnames = FALSE;
	m_iMaxMorphnameLength = 0;
	m_bOutputRootGlosses = FALSE;
	m_bPrintTestParseTrees = FALSE;
	m_bReportAmbiguityPercentages = FALSE;
	m_bWriteDecompField = FALSE;
	m_bWritePField = FALSE;
	m_bWriteWordField = FALSE;
	m_bTrace = FALSE;
	//}}AFX_DATA_INIT
}


void CDlgEditAmpleProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditAmpleProcess)
	DDX_Check(pDX, IDC_CheckMorphnames, m_bCheckMorphnames);
	DDX_Text(pDX, IDC_MaxMorphLength, m_iMaxMorphnameLength);
	DDV_MinMaxInt(pDX, m_iMaxMorphnameLength, 5, 100);
	DDX_Check(pDX, IDC_OutputRootGlosses, m_bOutputRootGlosses);
	DDX_Check(pDX, IDC_ParseTrees, m_bPrintTestParseTrees);
	DDX_Check(pDX, IDC_ReportAmbig, m_bReportAmbiguityPercentages);
	DDX_Check(pDX, IDC_WriteDecompField, m_bWriteDecompField);
	DDX_Check(pDX, IDC_WritePField, m_bWritePField);
	DDX_Check(pDX, IDC_WriteWordField, m_bWriteWordField);
	DDX_Check(pDX, IDC_Trace, m_bTrace);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditAmpleProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgEditAmpleProcess)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditAmpleProcess message handlers
