// DlgEditToneTracing.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "dlgedittonetracing.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditToneTracing dialog


CDlgEditToneTracing::CDlgEditToneTracing(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditToneTracing::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditToneTracing)
	m_bDomains = FALSE;
	m_bMora = FALSE;
	m_bSegments = FALSE;
	m_bSyllable = FALSE;
	m_bTBU = FALSE;
	m_bLinkAnalysis = FALSE;
	m_bMorpheme = FALSE;
	m_bToneTier = FALSE;
	m_bToneRule = FALSE;
	//}}AFX_DATA_INIT
}


void CDlgEditToneTracing::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditToneTracing)
	DDX_Check(pDX, IDC_CHECKToneTraceDomains, m_bDomains);
	DDX_Check(pDX, IDC_CHECKToneTraceMora, m_bMora);
	DDX_Check(pDX, IDC_CHECKToneTraceSegments, m_bSegments);
	DDX_Check(pDX, IDC_CHECKToneTraceSyllable, m_bSyllable);
	DDX_Check(pDX, IDC_CHECKToneTraceTBU, m_bTBU);
	DDX_Check(pDX, IDC_CHECKToneTraceLinkAnalysis, m_bLinkAnalysis);
	DDX_Check(pDX, IDC_CHECKToneTraceMorphemeTone, m_bMorpheme);
	DDX_Check(pDX, IDC_CHECKToneTraceTierAssignment, m_bToneTier);
	DDX_Check(pDX, IDC_CHECKToneTraceToneRule, m_bToneRule);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditToneTracing, CDialog)
	//{{AFX_MSG_MAP(CDlgEditToneTracing)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditToneTracing message handlers

void CDlgEditToneTracing::OnOK()
{
	// TODO: Add extra validation here

	CDialog::OnOK();
}
