// ItemEditDialogs.cpp : implementation file
//
// 1.5a7 23-Oct-1999 hab Allow test contents and description to use language font
//                      Allow string classes and morpheme classes to use lang font

#include "stdafx.h"
#include "ItemEditDialogs.h"
#include "TextDisplayInfo.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditTest dialog



#ifndef hab15a7
CDlgEditTest::CDlgEditTest(const CTextDisplayInfo* pTDI)
	: CSDialog(CDlgEditTest::IDD),
	  m_pTDI(pTDI)
#else
CDlgEditTest::CDlgEditTest(CWnd* pParent /*=NULL*/)
	: CSDialog(CDlgEditTest::IDD, pParent)
#endif // hab15a7
{
	//{{AFX_DATA_INIT(CDlgEditTest)
	m_sContents = _T("");
	m_sDescription = _T("");
	m_sLabel = _T("");
	m_bEnabled = FALSE;
	m_bIsAmpleTest = TRUE;
	//}}AFX_DATA_INIT
}

static const TCHAR szSection [] = _T("Settings\\TestsColor");

void CDlgEditTest::DoDataExchange(CDataExchange* pDX)
{

	CSDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditTest)
	DDX_Text(pDX, IDC_EDITContents, m_sContents);
	DDX_Text(pDX, IDC_EDITDescription, m_sDescription);
	DDX_Text(pDX, IDC_EDITLabel, m_sLabel);
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	//}}AFX_DATA_MAP
#ifndef hab15a7
	// when we're opening the dialog, set the fonts
	// to the correct vernacular font

	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		if (m_pTDI->m_bShowUserTestsInLangFont)
		{
		  CEdit* pE = (CEdit*) GetDlgItem(IDC_EDITContents);  // fix name
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			pE = (CEdit*) GetDlgItem(IDC_To);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
		}
		if (m_pTDI->m_bShowCommentsInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_EDITDescription);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
		}
	}
#endif // hab15a7
}


BEGIN_MESSAGE_MAP(CDlgEditTest, CSDialog)
	//{{AFX_MSG_MAP(CDlgEditTest)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

BOOL CDlgEditTest::OnInitDialog()
{
	CDialog::OnInitDialog();

	// CTestEdit	-> // added by mr 4/26/2002
	TCHAR szOPE [] = " AND IF IFF NOT OR THEN XOR ";
	TCHAR szFOROPE [] = " FOR_ALL_LEFT FOR_ALL_RIGHT FOR_SOME_LEFT FOR_SOME_RIGHT FOR-ALL-LEFT FOR-ALL-RIGHT FOR-SOME-LEFT FOR-SOME-RIGHT FORALLLEFT FORALLRIGHT FORSOMELEFT FORSOMERIGHT ";
	TCHAR szLOC [] = " current last left next right FINAL INITIAL LEFT RIGHT ";
	TCHAR szCONN [] = " is matches member = > >= <= < ~= ";
	TCHAR szTYP [] = " prefix infix root suffix initial final ";
	TCHAR szNBR [] = " 0 1 2 3 4 5 6 7 8 9 ";
	TCHAR szKEYW [] = " allomorph capitalized fromcategory morphname orderclass property punctuation string surface tocategory type word ";
	// <- CTestEdit

	// IF Syntehis test, THEN
	// those keywords need to be added to the Keyword list.
	if( !m_bIsAmpleTest ) // added by mr 5/24/2002
	{
		lstrcat(szKEYW," insert before after report ");
	}



	CWnd* pWnd=NULL;
	pWnd = GetDlgItem( IDC_EDITLabel );
	pWnd->SetWindowText( m_sLabel );

	pWnd = GetDlgItem( IDC_EDITDescription );
	pWnd->SetWindowText( m_sDescription );

	pWnd = GetDlgItem( IDC_EDITContents );
	pWnd->SetWindowText( m_sContents );


// CTestEdit	->
	ModifyStyle(0, WS_CLIPCHILDREN);

	m_richTestEdit.SubclassDlgItem(IDC_EDITContents, this);

	m_richTestEdit.Initialize();

	m_richTestEdit.SetStringQuotes(_T("\""));
	m_richTestEdit.SetStringQuotes(_T("\'"));
	m_richTestEdit.SetStringQuotes(_T("."));

	m_richTestEdit.SetSLComment(_T('|'));
	m_richTestEdit.SetSLComment(_T("\\co"));

	m_richTestEdit.AddKeywords(szOPE,m_richTestEdit.m_strOPErators,m_richTestEdit.m_strOPEratorsLower);
	m_richTestEdit.AddKeywords(szFOROPE,m_richTestEdit.m_strFOROPerators,m_richTestEdit.m_strFOROPeratorsLower);
	m_richTestEdit.AddKeywords(szLOC,m_richTestEdit.m_strLOCations,m_richTestEdit.m_strLOCationsLower);


	m_richTestEdit.AddKeywords(szKEYW,m_richTestEdit.m_strKEYWords,m_richTestEdit.m_strKEYWordsLower);
	m_richTestEdit.AddKeywords(szCONN,m_richTestEdit.m_strCONNectors,m_richTestEdit.m_strCONNectorsLower);
	m_richTestEdit.AddKeywords(szTYP,m_richTestEdit.m_strTYPes,m_richTestEdit.m_strTYPesLower);
	m_richTestEdit.AddKeywords(szNBR,m_richTestEdit.m_strNBR,m_richTestEdit.m_strNBRLower);


	m_richTestEdit.FormatAll();
	// <- CTestEdit


	if( m_sLabel.IsEmpty() )
	{
		GotoDlgCtrl( GetDlgItem( IDC_EDITLabel ) );
	}
	else
	{
		m_richTestEdit.SetFocus();
	}

	return FALSE;
}

void CDlgEditTest::OnCheckOnOff()
{

}

/////////////////////////////////////////////////////////////////////////////
// CDlgEditTest message handlers
/////////////////////////////////////////////////////////////////////////////
// CDlgEditOrthoChange dialog


CDlgEditOrthoChange::CDlgEditOrthoChange(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(FALSE, CDlgEditOrthoChange::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditOrthoChange)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sFrom = _T("");
	m_sTo = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditOrthoChange::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditOrthoChange)
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_Comments, m_sComments);
	DDX_Text(pDX, IDC_From, m_sFrom);
	DDX_Text(pDX, IDC_To, m_sTo);
	//}}AFX_DATA_MAP

	// when we're opening the dialog, set the fonts
	// to the correct vernacular font
	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		DDX_Control(pDX, IDC_From, m_sEditFrom);
		m_sEditFrom.SetFont(m_pTDI->getFont());

		DDX_Control(pDX, IDC_To, m_sEditTo);
		m_sEditTo.SetFont(m_pTDI->getFont());

		//DDX_Control(pDX, IDC_Environment, m_sEditEnv);
		//m_sEditEnv.SetFont(m_pContentsFont);
		if (m_pTDI->m_bShowCommentsInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Comments);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			// env list is handled by CDlgEnvConstrainedRule::DoDataExchange()
		}
	}
}

BEGIN_MESSAGE_MAP(CDlgEditOrthoChange, CSDialog)
	//{{AFX_MSG_MAP(CDlgEditOrthoChange)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditOrthoChange message handlers
/////////////////////////////////////////////////////////////////////////////
// CDlgEditEnvironment dialog


CDlgEditEnvironment::CDlgEditEnvironment(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditEnvironment::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditEnvironment)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sEnvironment = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditEnvironment::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditEnvironment)
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_Comments, m_sComments);
//	DDX_Text(pDX, IDC_Environment, m_sEnvironment);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEditEnvironment, CDialog)
	//{{AFX_MSG_MAP(CDlgEditEnvironment)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditEnvironment message handlers
/////////////////////////////////////////////////////////////////////////////
// CDlgEditMCC dialog


CDlgEditMCC::CDlgEditMCC(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(TRUE, CDlgEditMCC::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditMCC)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sEnvironComment = _T("");
	m_sEnvironment = _T("");
	m_sMembers = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditMCC::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditMCC)
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_Comments, m_sComments);
	DDX_Text(pDX, IDC_Members, m_sMembers);
	//}}AFX_DATA_MAP

	// to the correct vernacular font
	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		if (m_pTDI->m_bShowMorphnamesInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Members);
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


BEGIN_MESSAGE_MAP(CDlgEditMCC, CSDialog)
	//{{AFX_MSG_MAP(CDlgEditMCC)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditMCC message handlers



void CDlgEditClass::DoDataExchange(CDataExchange* pDX)
{
	CSDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditClass)
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_EDITContents, m_sContents);
	DDX_Text(pDX, IDC_EDITDescription, m_sComments);
	DDX_Text(pDX, IDC_EDITLabel, m_sLabel);
	//}}AFX_DATA_MAP
	if(!pDX->m_bSaveAndValidate
		&& m_pTDI)	// will be NULL for stuff list a category class list
	{
		if(m_bContentsAreStrings ||	// we have a string class
			(m_bContentsAreMorphnames && m_pTDI->m_bShowMorphnamesInLangFont))
		{
			//DDX_Control(pDX, IDC_EDITContents, m_contentsEditText);
			//m_contentsEditText.SetFont(m_pTDI->getFont());
			CEdit* pE = (CEdit*) GetDlgItem(IDC_EDITContents);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
		}
#ifndef hab15a7
		if( (m_bContentsAreStrings  && m_pTDI->m_bShowStringClassesInLangFont) ||
			(m_bContentsAreMorphnames && m_pTDI->m_bShowMorphemeClassesInLangFont))
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_EDITLabel);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
		}
#endif // hab15a7
		if (m_pTDI->m_bShowCommentsInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_EDITDescription);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			// env list is handled by CDlgEnvConstrainedRule::DoDataExchange()
		}
	}
}


BEGIN_MESSAGE_MAP(CDlgEditClass, CSDialog)
	//{{AFX_MSG_MAP(CDlgEditClass)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditClass message handlers

CDlgEditClass::CDlgEditClass(const CTextDisplayInfo* pTDI, BOOL bContentsAreMorphnames, BOOL bContentsAreStrings)
	: CSDialog(CDlgEditClass::IDD, NULL),
	m_pTDI(pTDI),
	m_bContentsAreMorphnames(bContentsAreMorphnames),
	m_bContentsAreStrings(bContentsAreStrings)
{
	//{{AFX_DATA_INIT(CDlgEditClass)
	m_bEnabled = FALSE;
	m_sContents = _T("");
	m_sComments = _T("");
	m_sLabel = _T("");
	//}}AFX_DATA_INIT
}
/////////////////////////////////////////////////////////////////////////////
// CDlgEditCmpdRootPair dialog


CDlgEditCmpdRootPair::CDlgEditCmpdRootPair(const CTextDisplayInfo* pTDI)
	: CSDialog(CDlgEditCmpdRootPair::IDD),
	m_pTDI(pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditCmpdRootPair)
	m_sCategory1 = _T("");
	m_sCategory2 = _T("");
	m_bEnabled = FALSE;
	m_sComments = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditCmpdRootPair::DoDataExchange(CDataExchange* pDX)
{
	CSDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditCmpdRootPair)
	DDX_Text(pDX, IDC_Cat1, m_sCategory1);
	DDX_Text(pDX, IDC_Cat2, m_sCategory2);
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_EDITDescription, m_sComments);
	//}}AFX_DATA_MAP

	if(!pDX->m_bSaveAndValidate && m_pTDI && m_pTDI->m_bShowCommentsInLangFont)
	{
		CEdit* pE = (CEdit*) GetDlgItem(IDC_EDITDescription);
		if(pE)
			pE->SetFont(m_pTDI->getFont());
	}
}


BEGIN_MESSAGE_MAP(CDlgEditCmpdRootPair, CSDialog)
	//{{AFX_MSG_MAP(CDlgEditCmpdRootPair)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditCmpdRootPair message handlers
/////////////////////////////////////////////////////////////////////////////
// CDlgEditAdhocPair dialog


CDlgEditAdhocPair::CDlgEditAdhocPair(const CTextDisplayInfo* pTDI)
	: CSDialog(CDlgEditAdhocPair::IDD, NULL),
		m_pTDI(pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditAdhocPair)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sMorph2 = _T("");
	m_sMorph1 = _T("");
	m_sMorphType = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEditAdhocPair::DoDataExchange(CDataExchange* pDX)
{
	CSDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditAdhocPair)
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_EDITComments, m_sComments);
	DDX_Text(pDX, IDC_Morph2, m_sMorph2);
	DDX_Text(pDX, IDC_Morph1, m_sMorph1);
	DDX_CBString(pDX, IDC_COMBOMorphTypes, m_sMorphType);
	//}}AFX_DATA_MAP

		// to the correct vernacular font
	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		if (m_pTDI->m_bShowMorphnamesInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Morph1);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			pE = (CEdit*) GetDlgItem(IDC_Morph2);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			// env list is handled by CDlgEnvConstrainedRule::DoDataExchange()
		}
		if (m_pTDI->m_bShowCommentsInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_EDITComments);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
		}
	}
}


BEGIN_MESSAGE_MAP(CDlgEditAdhocPair, CSDialog)
	//{{AFX_MSG_MAP(CDlgEditAdhocPair)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditAdhocPair message handlers

//DEL BOOL CDlgEditMCC::OnInitDialog()
//DEL {
//DEL 	CDialog::OnInitDialog();
//DEL
//DEL 	m_listCtrlEnvironments.finishCreate();
//DEL 	m_listCtrlEnvironments.populate();
//DEL
//DEL 	return TRUE;  // return TRUE unless you set the focus to a control
//DEL 	              // EXCEPTION: OCX Property Pages should return FALSE
//DEL }

// I added this because the embedded list ctrl isn't getting any menu-related messages!
//DEL void CDlgEditMCC::OnContextMenu(CWnd* pWnd, CPoint point)
//DEL {
//DEL 	if(pWnd== &m_listCtrlEnvironments)
//DEL 		m_listCtrlEnvironments.OnContextMenu(pWnd, point);
//DEL }

//DEL void CDlgEditMCC::OnEnvEnable()
//DEL {
//DEL 	ASSERT(FALSE); // never called
//DEL 	m_listCtrlEnvironments.OnToggleEnable();
//DEL
//DEL }

//DEL void CDlgEditMCC::OnUpdateEnvEnable(CCmdUI* pCmdUI)
//DEL {
//DEL 	ASSERT(FALSE); // never called
//DEL 	m_listCtrlEnvironments.OnUpdateToggleEnable(pCmdUI);
//DEL }

//DEL void CDlgEditMCC::OnRButtonDown(UINT nFlags, CPoint point)
//DEL {
//DEL //ASSERT(FALSE); // never called
//DEL 	m_listCtrlEnvironments.OnRButtonDown(nFlags, point);
//DEL
//DEL 	//CDialog::OnRButtonDown(nFlags, point);
//DEL }

//DEL BOOL CDlgEditMCC::PreTranslateMessage(MSG* pMsg)
//DEL {
//DEL 	if(pMsg->hwnd == m_listCtrlEnvironments.m_hWnd && pMsg->message == WM_RBUTTONDOWN)
//DEL 		OnRButtonDown(NULL, pMsg->pt);
//DEL 	else
//DEL 		return CDialog::PreTranslateMessage(pMsg);
//DEL }
