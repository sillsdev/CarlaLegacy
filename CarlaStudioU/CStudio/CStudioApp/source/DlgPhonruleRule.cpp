// CDlgPhonruleRule.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgPhonruleRule.h"
#include "TextDisplayInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgPhonruleRule dialog


CDlgPhonruleRule::CDlgPhonruleRule(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(FALSE, CDlgPhonruleRule::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgPhonruleRule)
	m_sCategory = _T("");
	m_bEnabled = FALSE;
	m_sFrom = _T("");
	m_sTo = _T("");
	m_iForceType = 0;
	m_iRuleType = 0;
	m_sComments = _T("");
	//}}AFX_DATA_INIT
}


void CDlgPhonruleRule::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgPhonruleRule)
	DDX_Text(pDX, IDC_Category, m_sCategory);
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_From, m_sFrom);
	DDX_Text(pDX, IDC_To, m_sTo);
	DDX_Radio(pDX, IDC_RADIOForce, m_iForceType);
	DDX_Radio(pDX, IDC_RADIORuleType, m_iRuleType);
	DDX_Text(pDX, IDC_Comments, m_sComments);
	//}}AFX_DATA_MAP

		// when we're opening the dialog, set the fonts
	// to the correct vernacular font
	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		DDX_Control(pDX, IDC_From, m_editFrom);
		m_editFrom.SetFont(m_pTDI->getFont());

		DDX_Control(pDX, IDC_To, m_editTo);
		m_editTo.SetFont(m_pTDI->getFont());
		if (m_pTDI->m_bShowCommentsInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Comments);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
		}
	}

}


BEGIN_MESSAGE_MAP(CDlgPhonruleRule, CDialog)
	//{{AFX_MSG_MAP(CDlgPhonruleRule)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgPhonruleRule message handlers
