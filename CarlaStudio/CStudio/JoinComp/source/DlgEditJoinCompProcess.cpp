
// DlgEditJoinCompProcess.cpp : implementation file
//

#include "..\stdafx.h"
#include "dlgeditjoincompprocess.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditJoinCompProcess dialog


CDlgEditJoinCompProcess::CDlgEditJoinCompProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditJoinCompProcess::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditJoinCompProcess)
	m_sAllomorphMarker = _T("");
	m_sJoinWordsMarker = _T("");
	m_bPartialCompoundsOK = FALSE;
	m_sVariantFormMarker = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditJoinCompProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditJoinCompProcess)
	DDX_Text(pDX, IDC_AllomorphMarker, m_sAllomorphMarker);
	DDX_Text(pDX, IDC_JoinWordsMarker, m_sJoinWordsMarker);
	DDX_Check(pDX, IDC_PartialCompoundsOK, m_bPartialCompoundsOK);
	DDX_Text(pDX, IDC_VariantFormMarker, m_sVariantFormMarker);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditJoinCompProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgEditJoinCompProcess)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditJoinCompProcess message handlers
