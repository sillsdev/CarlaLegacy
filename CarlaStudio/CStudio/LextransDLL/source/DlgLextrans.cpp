
// DlgLextrans.cpp : implementation file
//

#include "..\stdafx.h"
#include "DlgLextrans.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgLextrans dialog


CDlgLextrans::CDlgLextrans(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgLextrans::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgLextrans)
	m_bMonitor = FALSE;
	m_bTrace = FALSE;
	m_sSourceMarker = _T("");
	m_sTargetLexMarker = _T("");
	m_bUseTargetDict = FALSE;
	m_bReplaceCats = FALSE;
	m_bReplaceProps = FALSE;
	m_bReplaceRoots = FALSE;
	m_sTargetPropMarker = _T("");
	m_sTargetCatMarker = _T("");
	//}}AFX_DATA_INIT
}


void CDlgLextrans::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgLextrans)
	DDX_Check(pDX, IDC_CHECKMonitor, m_bMonitor);
	DDX_Check(pDX, IDC_CHECKTrace, m_bTrace);
	DDX_Text(pDX, IDC_EDITSourceMarker, m_sSourceMarker);
	DDX_Text(pDX, IDC_EDITTargetMarker, m_sTargetLexMarker);
	DDX_Check(pDX, IDC_CHECKUseTarget, m_bUseTargetDict);
	DDX_Check(pDX, IDC_CHECKReplaceCats, m_bReplaceCats);
	DDX_Check(pDX, IDC_CHECKReplaceProps, m_bReplaceProps);
	DDX_Check(pDX, IDC_CHECKReplaceRoots, m_bReplaceRoots);
	DDX_Text(pDX, IDC_EDITTargetPropMarker, m_sTargetPropMarker);
	DDX_Text(pDX, IDC_EDITCatMarker, m_sTargetCatMarker);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgLextrans, CDialog)
	//{{AFX_MSG_MAP(CDlgLextrans)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgLextrans message handlers
