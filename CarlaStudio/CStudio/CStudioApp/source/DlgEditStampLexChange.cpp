// DlgEditStampLexChange.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgEditStampLexChange.h"
#include "TextDisplayInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampLexChange dialog


CDlgEditStampLexChange::CDlgEditStampLexChange(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(TRUE, CDlgEditStampLexChange::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditStampLexChange)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sFrom = _T("");
	m_sTo = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditStampLexChange::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditStampLexChange)
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
		}
	}
}


BEGIN_MESSAGE_MAP(CDlgEditStampLexChange, CDialog)
	//{{AFX_MSG_MAP(CDlgEditStampLexChange)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampLexChange message handlers
