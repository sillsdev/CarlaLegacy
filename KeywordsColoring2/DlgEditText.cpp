// Last revison: 4/19/2002 11:47:16 AM [mr]
// DlgEditText.cpp : implementation file
//

#include "stdafx.h"
#include "keywordscoloring2.h"
#include "DlgEditText.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditText dialog

// CTestEdit	->
static LPCTSTR szOPE = " AND IF IFF NOT OR THEN XOR ";
static LPCTSTR szFOROPE = " FOR_ALL_LEFT FOR_ALL_RIGHT FOR_SOME_LEFT FOR_SOME_RIGHT FOR-ALL-LEFT FOR-ALL-RIGHT FOR-SOME-LEFT FOR-SOME-RIGHT FORALLLEFT FORALLRIGHT FORSOMELEFT FORSOMERIGHT ";
static LPCTSTR szLOC = " current last left next right FINAL INITIAL LEFT RIGHT ";
static LPCTSTR szKEYW = " allomorph capitalized fromcategory morphname orderclass property punctuation string surface tocategory type word ";
static LPCTSTR szKEYW_ACT = " insert before after report ";
static LPCTSTR szCONN = " is matches member = > >= <= < ~= ";
static LPCTSTR szTYP = " prefix infix root suffix initial final ";
static LPCTSTR szNBR = " 0 1 2 3 4 5 6 7 8 9 ";
// <- CTestEdit

static const TCHAR szSection [] = _T("Settings\\TestsColor");

CDlgEditText::CDlgEditText(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditText::IDD, pParent)
{
}


void CDlgEditText::DoDataExchange(CDataExchange* pDX)
{

	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditText)
	DDX_Control(pDX, IDC_BUTTON1, m_btnCheckOnOff);
	//}}AFX_DATA_MAP


	// perform some tests
	if( pDX->m_bSaveAndValidate == 1)
	{
		// link to check rules
	}
}


BEGIN_MESSAGE_MAP(CDlgEditText, CDialog)
	//{{AFX_MSG_MAP(CDlgEditText)
	ON_BN_CLICKED(IDC_BUTTON1, OnCheckOnOff)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditText message handlers

BOOL CDlgEditText::OnInitDialog()
{
	CDialog::OnInitDialog();


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
	m_richTestEdit.AddKeywords(szKEYW_ACT,m_richTestEdit.m_strKEYWords_Act,m_richTestEdit.m_strKEYWords_ActLower);
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


HBITMAP hBitmap;
hBitmap = LoadBitmap(  AfxGetInstanceHandle(),
  MAKEINTRESOURCE( IDB_eye ));
m_btnCheckOnOff.SetBitmap(hBitmap);

	return FALSE;
}

void CDlgEditText::OnCheckOnOff()
{
	// TODO: Add your control notification handler code here

}
