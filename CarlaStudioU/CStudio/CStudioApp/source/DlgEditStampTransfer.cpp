// DlgEditStampTransfer.cpp : implementation file
//
// 1.5a7 20-Oct-1999 hab From field did not use language font when it should

#include "stdafx.h"
#include "..\resource.h"
#include "DlgEditStampTransfer.h"
#include "TextDisplayInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampTransfer dialog

CDlgEditStampTransfer::CDlgEditStampTransfer(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(TRUE, CDlgEditStampTransfer::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditStampTransfer)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sFrom = _T("");
	m_iType = -1;
	m_sTo = _T("");
	m_sFlags = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditStampTransfer::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditStampTransfer)
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_Comments, m_sComments);
	DDX_Text(pDX, IDC_FromOrInsert, m_sFrom);
	DDX_Radio(pDX, IDC_RADIOSubstitute, m_iType);
	DDX_Text(pDX, IDC_To, m_sTo);
	DDX_Text(pDX, IDC_Flags, m_sFlags);
	//}}AFX_DATA_MAP


	// when we're opening the dialog, set the fonts
	// to the correct vernacular font

	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		if (m_pTDI->m_bShowMorphnamesInLangFont)
		{
#ifndef hab15a7
				CEdit* pE = (CEdit*) GetDlgItem(IDC_FromOrInsert);  // fix name
#else
			CEdit* pE = (CEdit*) GetDlgItem(IDC_From);
#endif // hab15a7
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

	if(!pDX->m_bSaveAndValidate) // when starting up the dialog
	{
		manageEnabling();
	}
}


BEGIN_MESSAGE_MAP(CDlgEditStampTransfer, CDialog)
	//{{AFX_MSG_MAP(CDlgEditStampTransfer)
	ON_BN_CLICKED(IDC_RADIOSubstitute, OnRadio)
	ON_BN_CLICKED(IDC_RADIOCopy, OnRadio)
	ON_BN_CLICKED(IDC_RADIOInsert, OnRadio)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

void CDlgEditStampTransfer::OnRadio()
{
	UpdateData(); // get m_iType up to date
	manageEnabling();
}

/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampTransfer message handlers

// we need to disable the "From" when we have an insertion rule
void CDlgEditStampTransfer::manageEnabling()
{
	CWnd* pToStatic =  GetDlgItem(IDC_ToStatic);
	CWnd* pToField =  GetDlgItem(IDC_To);
	CWnd* pFromOrInsertStatic = GetDlgItem(IDC_FromOrInsertLabel);
	if(pToStatic && pToField && pFromOrInsertStatic)
	{
		if(m_iType < 2)	// copy or subs
		{
			pToStatic->ModifyStyle(NULL, WS_VISIBLE);	// show it
			pToField->ModifyStyle(NULL, WS_VISIBLE);	// show it
			pFromOrInsertStatic->SetWindowText(_T("From:"));
		}
		else	// insertion rule
		{
			pToStatic->ModifyStyle(WS_VISIBLE, NULL);	// hide it
			pToField->ModifyStyle(WS_VISIBLE, NULL);	// hide it
			pFromOrInsertStatic->SetWindowText(_T("Insert:"));
		}
		pToStatic->Invalidate();
		pToStatic->GetParent()->Invalidate();
		pToField->Invalidate();
		pToField->GetParent()->Invalidate();
		pFromOrInsertStatic->Invalidate();
	}
}
