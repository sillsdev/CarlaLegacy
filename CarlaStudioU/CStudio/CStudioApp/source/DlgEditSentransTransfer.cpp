// DlgEditSentransTransfer.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "DlgEditSentransTransfer.h"
#include "TextDisplayInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransTransfer dialog


CDlgEditSentransTransfer::CDlgEditSentransTransfer(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(TRUE, CDlgEditSentransTransfer::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditSentransTransfer)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sFrom = _T("");
	m_sTo = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditSentransTransfer::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditSentransTransfer)
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_Comments, m_sComments);
	DDX_Text(pDX, IDC_From, m_sFrom);
	DDX_Text(pDX, IDC_To, m_sTo);
	//}}AFX_DATA_MAP

	// when we're opening the dialog, set the fonts
	// to the correct vernacular font
	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		if (m_pTDI->m_bShowMorphnamesInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_From);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			pE = (CEdit*) GetDlgItem(IDC_To);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			// env list is handled by CDlgEnvConstrainedRule::DoDataExchange()
		}
		if (m_pTDI->m_bShowCommentsInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Comments);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			// env list is handled by CDlgEnvConstrainedRule::DoDataExchange()
		}
	}
}

BEGIN_MESSAGE_MAP(CDlgEditSentransTransfer, CDialog)
	//{{AFX_MSG_MAP(CDlgEditSentransTransfer)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransTransfer message handlers
