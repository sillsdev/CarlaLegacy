// CDlgSentransDirective.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgSentransDirective.h"
#include "TextDisplayInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgSentransDirective dialog


CDlgSentransDirective::CDlgSentransDirective(const CTextDisplayInfo* pTDI, CWnd* pParent /*=NULL*/)
	: CDialog(CDlgSentransDirective::IDD, pParent),
	m_pTDI(pTDI)
{
	//{{AFX_DATA_INIT(CDlgSentransDirective)
	m_iLimit = 0;
	m_sComments = _T("");
	m_bEnabled = FALSE;
	m_iType = 0;
	//}}AFX_DATA_INIT
}


void CDlgSentransDirective::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgSentransDirective)
	DDX_Text(pDX, IDC_iLimit, m_iLimit);
	DDX_Text(pDX, IDC_sComments, m_sComments);
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Radio(pDX, IDC_RADIOType, m_iType);
	//}}AFX_DATA_MAP

	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		if (m_pTDI->m_bShowCommentsInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Comments);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
		}
	}
}


BEGIN_MESSAGE_MAP(CDlgSentransDirective, CDialog)
	//{{AFX_MSG_MAP(CDlgSentransDirective)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgSentransDirective message handlers
