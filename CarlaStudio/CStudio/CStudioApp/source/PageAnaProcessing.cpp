// PageAnaProcessing.cpp : implementation file
//
// JDH 5/28/99 Allow Interlinearizting ANA files

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "PageAnaProcessing.h"
#include "ProjectDoc.h"
#include "LangModelsDoc.h"
#include "CarlaLanguage.h"
#include "ProcessingPrefs.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


//const int kFirstPossibleANAGoal = CProcessingPrefs::kGlossedInterlinear; //CProcessingPrefs::kTargetANA;
const int vecPossibleGoals[] = {CProcessingPrefs::kGlossedInterlinear,
								CProcessingPrefs::kTargetANA,
								CProcessingPrefs::kTargetText };

/////////////////////////////////////////////////////////////////////////////
// CPageAnaProcessing dialog


CPageAnaProcessing::CPageAnaProcessing(
							int iGoal,
							CCarlaLanguage* pInputLang,
							CCarlaLanguage* pTargetLang,
							BOOL bVerbosity,
							BOOL bShowMakeDefaultBtn,
							DWORD dwFlags)
:	CPropertyPage(CPageAnaProcessing::IDD),
	m_bVerbosity(bVerbosity),
	m_pInputLang(pInputLang),
	m_pTargetLang(pTargetLang),
	m_bMakeDefault(TRUE),
	m_bShowDefaultButton(bShowMakeDefaultBtn)
{
//	ASSERTX(iGoal >= kFirstPossibleANAGoal);
	//{{AFX_DATA_INIT(CPageSrcTextProcessing)
	m_iGoal = iGoal;
	m_bLeaveNonGoalsInTemp = dwFlags & CProcessingPrefs::kLeaveNonGoalsInTemp;
	//}}AFX_DATA_INIT
}

void CPageAnaProcessing::DoDataExchange(CDataExchange* pDX)
{
	//	int iWhichGoalRadio = m_iGoal-kFirstPossibleANAGoal;

	// since we're skipping Autosynth, we have to use this array to map from buttons to goal constants
	int iWhichGoalRadio=0;
	if(!pDX->m_bSaveAndValidate ) // for loading dialog only
	{
		for(int g=0; g<sizeof(vecPossibleGoals); g++)
			if(vecPossibleGoals[g] == m_iGoal)
				iWhichGoalRadio = g;
	}

	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageAnaProcessing)
	DDX_Control(pDX, IDC_InputLang, m_comboInputLang);
	DDX_Control(pDX, IDC_TargetLangCombo, m_comboTargetLang);
	DDX_Control(pDX, IDC_MakeDefault, m_btnMakeDefault);
	DDX_Check(pDX, IDC_Verbose, m_bVerbosity);
	DDX_Check(pDX, IDC_MakeDefault, m_bMakeDefault);
	DDX_Check(pDX, IDC_LeaveNonGoalsInTemp, m_bLeaveNonGoalsInTemp);
	//}}AFX_DATA_MAP

	DDX_Radio(pDX, IDC_RADIOProduce, iWhichGoalRadio);

	if(!pDX->m_bSaveAndValidate )
	{
		// Input Lang COMBO-BOX MAINTENANCE
		CProjectDoc *pProj = theApp.getProject();
		for(int i=pProj->getLangDocs().GetSize()-1; i>=0; i--)
		{
			CLangModelsDoc* pLangDoc = pProj->getLangDocs()[i];
			int index = m_comboInputLang.AddString(pLangDoc->getLang()->getName());
			m_comboInputLang.SetItemDataPtr(index, pLangDoc->getLang());
			if(pLangDoc->getLang() == m_pInputLang)
				m_comboInputLang.SetCurSel(index);
		}
		if(m_comboInputLang.GetCurSel() == CB_ERR )
			m_comboInputLang.SetCurSel(0); // in case there is no targeLang, don't want a blank combo box

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
		int i = m_comboInputLang.GetCurSel();
		ASSERTX(i!=CB_ERR);
		m_pInputLang = (CCarlaLanguage*)m_comboInputLang.GetItemDataPtr(i);
		i = m_comboTargetLang.GetCurSel();
		m_pTargetLang = (CCarlaLanguage*)m_comboTargetLang.GetItemDataPtr(i);
		if(m_pTargetLang == (void*)-1)	// no lang selected
			m_pTargetLang = NULL;

		//m_iGoal = iWhichGoalRadio +kFirstPossibleANAGoal;
		m_iGoal = vecPossibleGoals[iWhichGoalRadio];
		if(m_iGoal == CProcessingPrefs::kTargetANA && m_pInputLang==m_pTargetLang) // transfer
		{
			AfxMessageBox("When the input language is the same as the target language, there is no transfer to do.");
			pDX->Fail();
		}
	}
}


BEGIN_MESSAGE_MAP(CPageAnaProcessing, CDialog)
	//{{AFX_MSG_MAP(CPageAnaProcessing)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageAnaProcessing message handlers
