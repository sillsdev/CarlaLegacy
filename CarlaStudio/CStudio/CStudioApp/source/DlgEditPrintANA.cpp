// DlgEditPrintANA.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgEditPrintANA.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditPrintANA dialog


CDlgEditPrintANA::CDlgEditPrintANA(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditPrintANA::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditPrintANA)
	m_sEXEName = _T("PrintANA");
	m_nDisplayBeginColumn = 25;
	m_bDisplayAnalysesOnly = FALSE;
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgEditPrintANA::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditPrintANA)
	DDX_Check(pDX, IDC_CHECKDisplayAnalysesOnly, m_bDisplayAnalysesOnly);
	DDX_Text(pDX, IDC_EDITEXENamePrintAna, m_sEXEName);
	DDX_Text(pDX, IDC_EDITBeginPrintColumn, m_nDisplayBeginColumn);
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditPrintANA, CDialog)
	//{{AFX_MSG_MAP(CDlgEditPrintANA)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditPrintANA message handlers
