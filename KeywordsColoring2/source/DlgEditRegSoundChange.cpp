// DlgEditRegSoundChange.cpp : implementation file
//
////
// 1.7a1 02-Dec-1999 Added regular sound change identifiers

#include "stdafx.h"
#include "..\resource.h"
#include "DlgEditRegSoundChange.h"
#include "TextDisplayInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditRegSoundChange dialog


CDlgEditRegSoundChange::CDlgEditRegSoundChange(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(FALSE, CDlgEditRegSoundChange::IDD, pTDI)
{

	//{{AFX_DATA_INIT(CDlgEditRegSoundChange)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sFrom = _T("");
	m_sTo = _T("");
#ifndef hab17a1
	m_sRscIds = _T("");
#endif hab17a1
	//}}AFX_DATA_INIT
}


void CDlgEditRegSoundChange::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditRegSoundChange)
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_Comments, m_sComments);
	DDX_Text(pDX, IDC_From, m_sFrom);
	DDX_Text(pDX, IDC_To, m_sTo);
#ifndef hab17a1
	DDX_Text(pDX, IDC_RSCIds, m_sRscIds);
#endif hab17a1
	//}}AFX_DATA_MAP

	// when we're opening the dialog, set the fonts
	// to the correct vernacular font
	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		DDX_Control(pDX, IDC_From, m_sEditFrom);
		m_sEditFrom.SetFont(m_pTDI->getFont());

		DDX_Control(pDX, IDC_To, m_sEditTo);
		m_sEditTo.SetFont(m_pTDI->getFont());

#ifndef hab17a1
		DDX_Control(pDX, IDC_RSCIds, m_sEditRscIds);
		m_sEditRscIds.SetFont(m_pTDI->getFont());
#endif // hab17a1

//		DDX_Control(pDX, IDC_Environment, m_sEditEnv);
//		m_sEditEnv.SetFont(m_pTDI->getFont());

		if (m_pTDI->m_bShowCommentsInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Comments);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			// env list is handled by CDlgEnvConstrainedRule::DoDataExchange()
		}
	}
}


BEGIN_MESSAGE_MAP(CDlgEditRegSoundChange, CDialog)
	//{{AFX_MSG_MAP(CDlgEditRegSoundChange)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditRegSoundChange message handlers
