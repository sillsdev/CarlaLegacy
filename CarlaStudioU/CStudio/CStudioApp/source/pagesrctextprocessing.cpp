// PageSrcDocProcessing.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "PageSrcTextProcessing.h"
#include "ProjectDoc.h"
#include "LangModelsDoc.h"
#include "CarlaLanguage.h"
#include "ProcessingPrefs.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageSrcTextProcessing dialog

//CPageSrcTextProcessing::CPageSrcTextProcessing()
//{}

CPageSrcTextProcessing::CPageSrcTextProcessing(
							int iGoal,
							CCarlaLanguage* pSourceLang,
							CCarlaLanguage* pTargetLang,
							BOOL bVerbosity,
							BOOL bShowMakeDefaultBtn,
							DWORD dwFlags)
:	CPropertyPage(CPageSrcTextProcessing::IDD),
	m_bVerbosity(bVerbosity),
	m_pSourceLang(pSourceLang),
	m_pTargetLang(pTargetLang),
	m_bMakeDefault(TRUE),
	m_bShowDefaultButton(bShowMakeDefaultBtn)
{
	//{{AFX_DATA_INIT(CPageSrcTextProcessing)
	m_iGoal = iGoal;
	m_bOutputItxToSameDir = dwFlags & CProcessingPrefs::kOutputItxToSameDir;
	m_bLeaveNonGoalsInTemp = dwFlags & CProcessingPrefs::kLeaveNonGoalsInTemp;
	//}}AFX_DATA_INIT
}


void CPageSrcTextProcessing::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageSrcTextProcessing)
	DDX_Control(pDX, IDC_TargetLangCombo, m_comboTargetLang);
	DDX_Control(pDX, IDC_SourceLang, m_comboSrcLang);
	DDX_Control(pDX, IDC_MakeDefault, m_btnMakeDefault);
	DDX_Check(pDX, IDC_MakeDefault, m_bMakeDefault);
	DDX_Check(pDX, IDC_Verbose, m_bVerbosity);
	DDX_Radio(pDX, IDC_radioGoal, m_iGoal);
	DDX_Check(pDX, IDC_CopyInterlinearToSrcDir, m_bOutputItxToSameDir);
	DDX_Check(pDX, IDC_LeaveNonGoalsInTemp, m_bLeaveNonGoalsInTemp);
	//}}AFX_DATA_MAP

	CProjectDoc *pProj = theApp.getProject();
	if(!pDX->m_bSaveAndValidate )
	{
		// source COMBO-BOX MAINTENANCE
		for(int i=pProj->getLangDocs().GetSize()-1; i>=0; i--)
		{
			CLangModelsDoc* pLangDoc = pProj->getLangDocs()[i];
			int index = m_comboSrcLang.AddString(pLangDoc->getLang()->getName());
			m_comboSrcLang.SetItemDataPtr(index, pLangDoc->getLang());
			if(pLangDoc->getLang() == m_pSourceLang)
				m_comboSrcLang.SetCurSel(index);
		}
		if(m_comboSrcLang.GetCurSel() == CB_ERR )
			m_comboSrcLang.SetCurSel(0); // in case there is no sourceLang, don't want a blank combo box

		// TARGET COMBO-BOX MAINTENANCE
		for(i=pProj->getLangDocs().GetSize()-1; i>=0; i--)
		{
			CLangModelsDoc* pLangDoc = pProj->getLangDocs()[i];
			int index = m_comboTargetLang.AddString(pLangDoc->getLang()->getName());
			m_comboTargetLang.SetItemDataPtr(index, pLangDoc->getLang());
			if(pLangDoc && pLangDoc->getLang() == m_pTargetLang)
				m_comboTargetLang.SetCurSel(index);
		}
		if(m_comboTargetLang.GetCurSel() == CB_ERR )
			m_comboTargetLang.SetCurSel(0); // in case there is no targeLang, don't want a blank combo box

		// DEFAULT BUTTON VISIBILITY
		if(!m_bShowDefaultButton)
		{	m_btnMakeDefault.SetCheck(0);
			// hide the button
			m_btnMakeDefault.ModifyStyle(WS_VISIBLE, NULL);
		}
	}
	else	// retrieve the results
	{
		int i = m_comboSrcLang.GetCurSel();
		ASSERTX(i!=CB_ERR);
		m_pSourceLang = (CCarlaLanguage*)m_comboSrcLang.GetItemDataPtr(i);
		i = m_comboTargetLang.GetCurSel();
		m_pTargetLang = (CCarlaLanguage*)m_comboTargetLang.GetItemDataPtr(i);
		if(m_pTargetLang == (void*)-1)	// no lang selected
			m_pTargetLang = NULL;
		if(m_iGoal == CProcessingPrefs::kTargetANA && m_pSourceLang==m_pTargetLang) // transfer
		{
			AfxMessageBox(_T("When the input language is the same as the target language, there is no transfer to do."));
			pDX->Fail();
		}
/*	allow this until we implement the autosynthesis option
	if(m_iGoal == CProcessingPrefs::kTargetText && m_pSourceLang==m_pTargetLang) // transfer
		{
			AfxMessageBox(_T("The text is already in chosen target langauge."));
			pDX->Fail();
		}
*/
	}
}


BEGIN_MESSAGE_MAP(CPageSrcTextProcessing, CDialog)
	//{{AFX_MSG_MAP(CPageSrcTextProcessing)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageSrcTextProcessing message handlers
