// DlgEditText.cpp : implementation file
//

#include "stdafx.h"
#include "keywordscoloring2.h"
#include "DlgEditText.h"
#include "DlgEditTestColor.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditText dialog

// CTestEdit	->
static LPCTSTR szOPE = " IF IFF NOT THEN AND OR XOR = > >= <= < ~= ";
static LPCTSTR szPOS = " left right current LEFT RIGHT INITIAL FINAL last next FOR_ALL_LEFT FOR_SOME_LEFT FOR_ALL_RIGHT FOR_SOME_RIGHT ";
static LPCTSTR szTYP = " prefix infix root suffix initial final fromcategory tocategory ";
static LPCTSTR szTRM = " allomorph is matches member morphname orderclass property string type word ";
static LPCTSTR szACT = " insert report after before ";
static LPCTSTR szNBR = " 0 1 2 3 4 5 6 7 8 9 ";
// <- CTestEdit

static const TCHAR szSection [] = _T("Settings\\TestsColor");

CDlgEditText::CDlgEditText(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditText::IDD, pParent)
{
	//{{AFX_DATA_MAP(CDlgEditText)

	//}}AFX_DATA_MAP
}


void CDlgEditText::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);

	// perform some tests
	if( pDX->m_bSaveAndValidate == 1)
	{
		// link to check rules
	}
}


BEGIN_MESSAGE_MAP(CDlgEditText, CDialog)
	//{{AFX_MSG_MAP(CDlgEditText)
	ON_BN_CLICKED(IDC_BUTTON1, OnCustomize)
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

	m_richTestEdit.AddOPErators(szOPE);
	m_richTestEdit.AddPOSition(szPOS);
	m_richTestEdit.AddTYPe(szTYP);
	m_richTestEdit.AddTRM(szTRM);
	m_richTestEdit.AddNBR(szACT);
	m_richTestEdit.AddACTions(szACT);

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



void CDlgEditText::OnCustomize()
{
	CDlgEditTestColor dlg (this);

	dlg.DoModal( );

	// ---------------------
	// refresh the control
	// ---------------------

	m_richTestEdit.Initialize();

	m_richTestEdit.setSelectionCharFormat();
	m_richTestEdit.FormatAll();
}
