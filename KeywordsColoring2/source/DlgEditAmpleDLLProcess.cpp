// DlgEditAmpleDLLProcess.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgEditAmpleDLLProcess.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditAmpleDLLProcess dialog


CDlgEditAmpleDLLProcess::CDlgEditAmpleDLLProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditAmpleDLLProcess::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditAmpleDLLProcess)
	m_bOutputRootGlosses = FALSE;
	m_bTrace = FALSE;
	m_iMaxMorphnameLength = 0;
	m_sTraceMorphs = _T("");
	m_bCheckMorphnames = FALSE;
	m_bReportAmbig = FALSE;
	m_bWriteDecomp = FALSE;
	m_bWriteWord = FALSE;
	m_bWriteProperties = FALSE;
	//}}AFX_DATA_INIT
}


void CDlgEditAmpleDLLProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditAmpleDLLProcess)
	DDX_Check(pDX, IDC_OutputRootGlosses, m_bOutputRootGlosses);
	DDX_Check(pDX, IDC_Trace, m_bTrace);
	DDX_Text(pDX, IDC_MaxMorphLength, m_iMaxMorphnameLength);
	DDX_Text(pDX, IDC_EDITTraceMorphs, m_sTraceMorphs);
	DDX_Check(pDX, IDC_CheckMorphnames, m_bCheckMorphnames);
	DDX_Check(pDX, IDC_ReportAmbig, m_bReportAmbig);
	DDX_Check(pDX, IDC_WriteDecompField, m_bWriteDecomp);
	DDX_Check(pDX, IDC_WriteWordField, m_bWriteWord);
	DDX_Check(pDX, IDC_WritePField, m_bWriteProperties);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditAmpleDLLProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgEditAmpleDLLProcess)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditAmpleDLLProcess message handlers
