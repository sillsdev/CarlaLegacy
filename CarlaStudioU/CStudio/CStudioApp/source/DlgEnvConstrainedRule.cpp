// DlgEnvConstrainedRule.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
//#include "..\cstudio.h"
#include "DlgEnvConstrainedRule.h"
#include "EnvironmentListCtrl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEnvConstrainedRule dialog


CDlgEnvConstrainedRule::CDlgEnvConstrainedRule(BOOL bIsMorphEnv,
											   UINT id,
											   const CTextDisplayInfo* pTDI,
											   CWnd* pParent /*=NULL*/)
	: CSDialog(id, pParent),
	m_pTDI(pTDI), // may be null
	m_bIsMorphEnv(bIsMorphEnv),
	m_pListCtrlEnvironments(new CEnvironmentListCtrl(pTDI)) // this is a pointer so that we don't have to expose the CEditCtrl to dozens of classes via the header file of this class
{
	ASSERT(bIsMorphEnv || pTDI);// should have a lang font if its a string environment

	//{{AFX_DATA_INIT(CDlgEnvConstrainedRule)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgEnvConstrainedRule::DoDataExchange(CDataExchange* pDX)
{
	CSDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEnvConstrainedRule)
	DDX_Control(pDX, IDC_EnvList, *m_pListCtrlEnvironments);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEnvConstrainedRule, CSDialog)
	//{{AFX_MSG_MAP(CDlgEnvConstrainedRule)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEnvConstrainedRule message handlers

BOOL CDlgEnvConstrainedRule::OnInitDialog()
{
	CSDialog::OnInitDialog();

	m_pListCtrlEnvironments->m_bIsMEC = m_bIsMorphEnv;
	m_pListCtrlEnvironments->m_nIconID = m_bIsMorphEnv?IDI_MorphEnvironment:IDI_StringEnvironment;
	m_pListCtrlEnvironments->finishCreate();
	m_pListCtrlEnvironments->populate();

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgEnvConstrainedRule::setRule(CWEnvironConstrainedRule *pRule)
{
	m_pListCtrlEnvironments->setRule(pRule);
}

CDlgEnvConstrainedRule::~CDlgEnvConstrainedRule()
{
	if(m_pListCtrlEnvironments)
		delete m_pListCtrlEnvironments;
}
