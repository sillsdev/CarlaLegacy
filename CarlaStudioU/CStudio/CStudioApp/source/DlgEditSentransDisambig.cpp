 // DlgEditSentransDisambig.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "DlgEditSentransDisambig.h"
#include "TextDisplayInfo.h"
#include "sdfedit.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransDisambig dialog


CDlgEditSentransDisambig::CDlgEditSentransDisambig(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(TRUE, CDlgEditSentransDisambig::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditSentransDisambig)
	m_sComments = _T("");
	m_bEnabled = FALSE;
	m_sMembers = _T("");
	m_iAcceptReject = -1;
	m_bUnanimousEnvirons = FALSE;
	//}}AFX_DATA_INIT
}


void CDlgEditSentransDisambig::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditSentransDisambig)
//	DDX_Control(pDX, IDC_SDF, m_sdfTest);
	DDX_Text(pDX, IDC_Comments, m_sComments);
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_Morphemes, m_sMembers);
	DDX_Radio(pDX, IDC_RADIOAccept, m_iAcceptReject);
	DDX_Check(pDX, IDC_CHECKUnanimousEnvirons, m_bUnanimousEnvirons);
	//}}AFX_DATA_MAP


	// when we're opening the dialog, set the fonts
	// to the correct vernacular font
	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		if (m_pTDI->m_bShowMorphnamesInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Morphemes);
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


BEGIN_MESSAGE_MAP(CDlgEditSentransDisambig, CDialog)
	//{{AFX_MSG_MAP(CDlgEditSentransDisambig)
	ON_COMMAND(ID_Jump, OnJump)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransDisambig message handlers

//DEL BOOL CDlgEditSentransDisambig::OnInitDialog()
//DEL {
//DEL //	m_sComments.SubclassDlgItem(IDD_PageInputDocPanels, this);
//DEL //	m_sdfTest.SubclassDlgItem(IDC_SDF, this);
//DEL
//DEL 	CDialog::OnInitDialog();
//DEL
//DEL 	return TRUE;  // return TRUE unless you set the focus to a control
//DEL 	              // EXCEPTION: OCX Property Pages should return FALSE
//DEL }

void CDlgEditSentransDisambig::OnJump()
{
ASSERT(FALSE);

}
