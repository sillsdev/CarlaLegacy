// dlgeditpcpatrdllprocess.cpp : implementation file
//

#include "stdafx.h"
#include "dlgeditpcpatrdllprocess.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditPCPATRDllProcess dialog


CDlgEditPCPATRDllProcess::CDlgEditPCPATRDllProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditPCPATRDllProcess::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditPCPATRDllProcess)
	m_bAmplePropertyIsFeature = FALSE;
	m_bPromoteDefaultAtomicValues = TRUE;
	m_bShowFailures = FALSE;
	m_bDisplayFeatures = TRUE;
	m_bDisplayGloss = TRUE;
	m_bTrimEmptyFeatures = FALSE;
	m_bPerformUnification = TRUE;
	m_bWriteAmpleParses = TRUE;
	m_uiMaxAmbiguities = 10;
	m_sSentenceFinalPunctuation = _T(". ? ! : ;");
	m_uiTimeLimit = 0;
	m_iTreeDisplayFormat = -1;
	m_sGrammarFileName = _T("");
	m_bFlatFeatureDisplay = FALSE;
	m_bAllFeatures = FALSE;
	m_iRootGlossSetting = -1;
	//}}AFX_DATA_INIT
}


void CDlgEditPCPATRDllProcess::DoDataExchange(CDataExchange* pDX)
{
  CDialog::DoDataExchange(pDX);

  // setup the function buttons
  if(!pDX->m_bSaveAndValidate)
	{
	  // disable some check boxes based on appropriate values
	  handleDisplayFeaturesSubItems();
	}

  //{{AFX_DATA_MAP(CDlgEditPCPATRDllProcess)
  DDX_Check(pDX, IDC_CHECK_AmplePropertyIsFeature, m_bAmplePropertyIsFeature);
  DDX_Check(pDX, IDC_CHECK_PromoteDefaultAtomicValues, m_bPromoteDefaultAtomicValues);
  DDX_Check(pDX, IDC_CHECK_ShowFailures, m_bShowFailures);
  DDX_Check(pDX, IDC_CHECK_Features, m_bDisplayFeatures);
  DDX_Check(pDX, IDC_CHECK_Gloss, m_bDisplayGloss);
  DDX_Check(pDX, IDC_CHECK_TrimEmptyFeatures, m_bTrimEmptyFeatures);
  DDX_Check(pDX, IDC_CHECK_Unification, m_bPerformUnification);
  DDX_Check(pDX, IDC_CHECK_WriteAmpleParses, m_bWriteAmpleParses);
  DDX_Text(pDX, IDC_EDIT_MaxAmbiguities, m_uiMaxAmbiguities);
  DDX_Text(pDX, IDC_EDIT_SentenceFinalPunctuation, m_sSentenceFinalPunctuation);
  DDX_Text(pDX, IDC_EDIT_TimeLimit, m_uiTimeLimit);
  DDX_Radio(pDX, IDC_RADIO_DisplayNoTree, m_iTreeDisplayFormat);
  DDX_Text(pDX, IDC_STATIC_GrammarFileName, m_sGrammarFileName);
  DDX_Check(pDX, IDC_CHECK_FlatFeatureDisplay, m_bFlatFeatureDisplay);
	DDX_Check(pDX, IDC_CHECK_AllFeatures, m_bAllFeatures);
	DDX_Radio(pDX, IDC_RADIO_RootGlossNo, m_iRootGlossSetting);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditPCPATRDllProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgEditPCPATRDllProcess)
	ON_BN_CLICKED(IDC_BUTTON_Grammar, OnBUTTONGrammar)
	ON_BN_CLICKED(IDC_CHECK_Features, OnCHECKDisplayFeatures)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditPCPATRDllProcess message handlers

void CDlgEditPCPATRDllProcess::OnBUTTONGrammar()
{
  UpdateData(TRUE); // download any ctrl values, because we're going to upload at the end of this method
  CFileDialog	dlg( TRUE,
			 NULL, //ext
			 m_sGrammarFileName,
			 OFN_FILEMUSTEXIST | OFN_HIDEREADONLY ,	// flags
			 _T("Grammar files(*.grm)|*.grm|All files (*.*)|*.*||"), // filter
			 NULL ); // parent window

  if(IDOK != dlg.DoModal())
	{
	  m_sGrammarFileName = _T("");	// let cancel be the way to clear a file
	}
  else
	m_sGrammarFileName = dlg.GetPathName();
  UpdateData(FALSE);
}

void CDlgEditPCPATRDllProcess::OnCHECKDisplayFeatures()
{
  UpdateData(TRUE);
  handleDisplayFeaturesSubItems();
  UpdateData(FALSE);
}

void CDlgEditPCPATRDllProcess::handleDisplayFeaturesSubItems(void)
{
  CButton* pB = (CButton*)GetDlgItem(IDC_CHECK_AllFeatures);
  if (pB)
	pB->EnableWindow(m_bDisplayFeatures);
  pB = (CButton*)GetDlgItem(IDC_CHECK_FlatFeatureDisplay);
  if (pB)
	pB->EnableWindow(m_bDisplayFeatures);
  pB = (CButton*)GetDlgItem(IDC_CHECK_TrimEmptyFeatures);
  if (pB)
	pB->EnableWindow(m_bDisplayFeatures);
}
