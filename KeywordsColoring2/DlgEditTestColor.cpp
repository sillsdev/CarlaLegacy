// DlgEditTestColor.cpp : implementation file
//

#include "stdafx.h"
#include "keywordscoloring2.h"
#include "DlgEditTestColor.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditTestColor dialog

// CTestEdit	->
static LPCTSTR szOPE = " IF IFF NOT THEN AND OR XOR = > >= <= < ~= ";
static LPCTSTR szPOS = " left right current LEFT RIGHT INITIAL FINAL last next FOR_ALL_LEFT FOR_SOME_LEFT FOR_ALL_RIGHT FOR_SOME_RIGHT ";
static LPCTSTR szTYP = " prefix infix root suffix initial final fromcategory tocategory ";
static LPCTSTR szTRM = " allomorph is matches member morphname orderclass property string type word ";
static LPCTSTR szACT = " insert report after before ";
static LPCTSTR szNBR = " 0 1 2 3 4 5 6 7 8 9 ";
// <- CTestEdit

static const TCHAR szSection [] = _T("Settings\\TestsColor");


CDlgEditTestColor::CDlgEditTestColor(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditTestColor::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditTestColor)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT

	m_dwTreeID=0; // index tree by default
}


void CDlgEditTestColor::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditTestColor)
	DDX_Control(pDX, IDOK, m_buttonEXIT);
	DDX_Control(pDX, IDC_CHECK4, m_buttonStrikeout);
	DDX_Control(pDX, IDC_COMBO1, m_combo);
	DDX_Control(pDX, IDC_RICHEDIT1, m_richTestPreview);
	DDX_Control(pDX, IDC_TREE1, m_tree);
	DDX_Control(pDX, IDC_BUTTON3, m_buttonColorBackground);
	DDX_Control(pDX, IDC_BUTTON4, m_buttonColorFont);
	//}}AFX_DATA_MAP


	CWinApp* pApp = AfxGetApp ();

	if( pDX->m_bSaveAndValidate==0 )
	{

		// initialize combo box with font size
		CString strSize = pApp->GetProfileString(szSection,"FontSize","10");
		int nId = m_combo.FindString( -1, strSize );

		if( nId != CB_ERR )
		{
			m_combo.SetCurSel( nId );
		}
		else
		{
			m_combo.SetCurSel( 2 ); // index 2 = size 10 pt
		}

		// initialize the background color button
		m_colorBackground = pApp->GetProfileInt(szSection,"ColorBackground",RGB(255,255,255));
		m_buttonColorBackground.currentcolor = m_colorBackground;

		// IF using background system color THEN disabled the button
		BOOL bUseBackground = pApp->GetProfileInt( szSection,"UseSystemColorBackground",TRUE);
		if(bUseBackground)
		{
			CheckDlgButton(IDC_CHECK5,bUseBackground);
			m_buttonColorBackground.currentcolor=GetSysColor(COLOR_WINDOW);
			m_buttonColorBackground.EnableWindow(FALSE);

		}

		// word wrap
		BOOL bWW = pApp->GetProfileInt( szSection,"WordWrap",0);
		m_richTestPreview.setWordWrap( bWW );
		CheckDlgButton( IDC_CHECK6,bWW );

	}
	else
	{
		// color background
		pApp->WriteProfileInt(szSection,"ColorBackground",m_buttonColorBackground.currentcolor);

		// use background color system
		pApp->WriteProfileInt( szSection,"UseSystemColorBackground",IsDlgButtonChecked( IDC_CHECK5 ) );

	}
}


BEGIN_MESSAGE_MAP(CDlgEditTestColor, CDialog)
	//{{AFX_MSG_MAP(CDlgEditTestColor)
	ON_NOTIFY(TVN_SELCHANGED, IDC_TREE1, OnSelchangingTree)
	ON_BN_CLICKED(IDC_CHECK5, OnCheckUseColorBackgroundSystem)
	ON_BN_CLICKED(IDC_CHECK6, OnCheckWordWrap)
	ON_BN_CLICKED(IDC_BUTTON3, clickOnBackgroundColor)
	ON_BN_CLICKED(IDC_BUTTON4, clickOnFontColor)
	ON_BN_CLICKED(IDC_CHECK1, OnBOLD)
	ON_BN_CLICKED(IDC_CHECK2, OnUNDERLINE)
	ON_BN_CLICKED(IDC_CHECK3, OnITALIC)
	ON_BN_CLICKED(IDC_CHECK4, OnSTRIKEOUT)
	ON_CBN_SELENDOK(IDC_COMBO1, OnFontSize)
	ON_BN_CLICKED(IDC_BUTTON2, OnDefault)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditTestColor message handlers

BOOL CDlgEditTestColor::OnInitDialog()
{
	CDialog::OnInitDialog();


	m_buttonEXIT.SetBitmap( IDB_EXIT_26x24 );


// CTestEdit	->
	m_richTestPreview.SubclassDlgItem(IDC_EDITContents, this);
	m_richTestPreview.ModifyStyle(0, WS_CLIPCHILDREN);

	// this line must be before Initialize
	CWinApp* pApp = AfxGetApp ();

	m_richTestPreview.Initialize();

	m_richTestPreview.SetStringQuotes(_T("\""));
	m_richTestPreview.SetStringQuotes(_T("\'"));
	m_richTestPreview.SetStringQuotes(_T("."));
	m_richTestPreview.SetSLComment(_T('|'));
	m_richTestPreview.SetSLComment(_T("\\co"));
	m_richTestPreview.AddOPErators(szOPE);
	m_richTestPreview.AddPOSition(szPOS);
	m_richTestPreview.AddTYPe(szTYP);
	m_richTestPreview.AddTRM(szTRM);
	m_richTestPreview.AddNBR(szACT);
	m_richTestPreview.AddACTions(szACT);
// <- CTestEdit



	m_tree.SetBkColor( RGB (255,255,204) );

	// initalizes the tree with keywords categories
	HTREEITEM hItem=NULL;

	m_hItemOPE = m_tree.InsertItem( "Operators",TVI_ROOT,TVI_LAST );
	m_tree.SetItemData( m_hItemOPE, 0 );

	hItem = m_tree.InsertItem( "Positions",TVI_ROOT,TVI_LAST );
	m_tree.SetItemData( hItem, 1 );

	hItem = m_tree.InsertItem( "Types",TVI_ROOT,TVI_LAST );
	m_tree.SetItemData( hItem, 2 );

	hItem = m_tree.InsertItem( "Members",TVI_ROOT,TVI_LAST );
	m_tree.SetItemData( hItem, 3 );

	hItem = m_tree.InsertItem( "Numbers",TVI_ROOT,TVI_LAST );
	m_tree.SetItemData( hItem, 4 );

	hItem = m_tree.InsertItem( "Actions",TVI_ROOT,TVI_LAST );
	m_tree.SetItemData( hItem, 5 );

	hItem = m_tree.InsertItem( "Strings",TVI_ROOT,TVI_LAST );
	m_tree.SetItemData( hItem, 6 );

	hItem = m_tree.InsertItem( "Comments",TVI_ROOT,TVI_LAST );
	m_tree.SetItemData( hItem, 7 );

	hItem = m_tree.InsertItem( "Errors",TVI_ROOT,TVI_LAST );
	m_tree.SetItemData( hItem, 8 );

	m_tree.SetFocus();

	return FALSE;
}


void CDlgEditTestColor::OnSelchangingTree(NMHDR* pNMHDR, LRESULT* pResult)
{
	NM_TREEVIEW* pNMTreeView = (NM_TREEVIEW*)pNMHDR;

	HTREEITEM hItem = m_tree.GetSelectedItem ();


	if( hItem != NULL )
	{
		CString x = m_tree.GetItemText( hItem );
		m_dwTreeID = m_tree.GetItemData( hItem );


		// one shows this button only with ERRORS
		// otherwise it hided.
		m_buttonStrikeout.ShowWindow(SW_HIDE);


		CWinApp* pApp = AfxGetApp ();
		CString str;
		switch( m_dwTreeID )
		{
		case 0:	// OPERATORS
			str = "IF (current property is voiced)\nTHEN\n\t((left property is voices-following-C)\n\tOR (left morphname is HYPHEN-Q))";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont=pApp->GetProfileInt( szSection,"OPEcolor",RGB(255,0,0));
			m_FontBOLD = pApp->GetProfileInt( szSection,"OPEbold",FALSE);
			m_FontITALIC = pApp->GetProfileInt( szSection,"OPEIialic",FALSE);
			m_FontUNDERLINE = pApp->GetProfileInt( szSection,"OPEunderline",FALSE);
			m_FontSTRIKEOUT = pApp->GetProfileInt( szSection,"OPESsrikeout",FALSE);
			break;

		case 1:	// POSITIONS
			str = "IF current morphname is \"INS\"\nTHEN\n\t(FOR_SOME_RIGHT\n\t(\tRIGHT type is root\nAND RIGHT tocategory is VO\t))";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont=pApp->GetProfileInt( szSection,"POScolor",RGB(0,0,255));
			m_FontBOLD = pApp->GetProfileInt( szSection,"POSbold",FALSE);
			m_FontITALIC = pApp->GetProfileInt( szSection,"POSitalic",FALSE);
			m_FontUNDERLINE = pApp->GetProfileInt( szSection,"POSunderline",FALSE);
			m_FontSTRIKEOUT = pApp->GetProfileInt( szSection,"POSstrikeout",FALSE);
			break;

		case 2:	// TYPES
			str = "fromcategory is current tocategory\n\nIF left type is suffix THEN left tocategory is current fromcategory";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont=pApp->GetProfileInt( szSection,"TYPcolor",RGB(0,255,0));
			m_FontBOLD = pApp->GetProfileInt( szSection,"TYPbold",FALSE);
			m_FontITALIC = pApp->GetProfileInt( szSection,"TYPitalic",FALSE);
			m_FontUNDERLINE = pApp->GetProfileInt( szSection,"TYPunderline",FALSE);
			m_FontSTRIKEOUT = pApp->GetProfileInt( szSection,"TYPstrikeout",FALSE);
			break;

		case 3:	// MEMBERS
			str = "Final allomorph is member Econ\n\ncurrent allomorph matches \"b\"\n\nnext word is member XBZI";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont=pApp->GetProfileInt( szSection,"TRMcolor",RGB(0,0,0));
			m_FontBOLD = pApp->GetProfileInt( szSection,"TRMbold",FALSE);
			m_FontITALIC = pApp->GetProfileInt( szSection,"TRMitalic",FALSE);
			m_FontUNDERLINE = pApp->GetProfileInt( szSection,"TRMunderline",FALSE);
			m_FontSTRIKEOUT = pApp->GetProfileInt( szSection,"TRMstrikeout",FALSE);
			break;

		case 4:	// NUMBERS
			str = "current orderclass = 0\n\nleft orderclass ~= 250";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont=pApp->GetProfileInt( szSection,"NBRcolor",RGB(255,0,255));
			m_FontBOLD = pApp->GetProfileInt( szSection,"NBRbold",FALSE);
			m_FontITALIC = pApp->GetProfileInt( szSection,"NBRitalic",FALSE);
			m_FontUNDERLINE = pApp->GetProfileInt( szSection,"NBRunderline",FALSE);
			m_FontSTRIKEOUT = pApp->GetProfileInt( szSection,"NBRstrikeout",FALSE);
			break;

		case 5:	// ACTIONS
			str = "insert \"t\" before current";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont=pApp->GetProfileInt( szSection,"ACTcolor",RGB(255,0,0));
			m_FontBOLD = pApp->GetProfileInt( szSection,"ACTbold",FALSE);
			m_FontITALIC = pApp->GetProfileInt( szSection,"ACTitalic",FALSE);
			m_FontUNDERLINE = pApp->GetProfileInt( szSection,"ACTunderline",TRUE);
			m_FontSTRIKEOUT = pApp->GetProfileInt( szSection,"ACTstrikeout",FALSE);
			break;

		case 6:	// STRINGS
			str = "\"a\"\t\'a\'\t.a.\n\"abc\"\t\'abc\'\t.abc.\n\"u\'la\"\t\'u\"la\'\t.u\"la\'.\n";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont=pApp->GetProfileInt( szSection,"STRINGcolor",RGB(123,112,230));
			m_FontBOLD = pApp->GetProfileInt( szSection,"STRINGbold",TRUE);
			m_FontITALIC = pApp->GetProfileInt( szSection,"STRINGitalic",TRUE);
			m_FontUNDERLINE = pApp->GetProfileInt( szSection,"STRINGunderline",FALSE);
			m_FontSTRIKEOUT = pApp->GetProfileInt( szSection,"STRINGstrikeout",FALSE);
			break;

		case 7:	// COMMENTS
			str = "\\co Comment\n\n| Comment 2";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont=pApp->GetProfileInt( szSection,"COMcolor",RGB(192,192,192));
			m_FontBOLD = pApp->GetProfileInt( szSection,"COMbold",FALSE);
			m_FontITALIC = pApp->GetProfileInt( szSection,"COMitalic",TRUE);
			m_FontUNDERLINE = pApp->GetProfileInt( szSection,"COMunderline",FALSE);
			m_FontSTRIKEOUT = pApp->GetProfileInt( szSection,"COMstrikeout",FALSE);
			break;

		case 8:	// ERRORS
			str = "FINAL alomorph ix membre \"Egon\"";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont=pApp->GetProfileInt( szSection,"ERRORcolor",RGB(128,128,128));
			m_FontBOLD = pApp->GetProfileInt( szSection,"ERRORbold",FALSE);
			m_FontITALIC = pApp->GetProfileInt( szSection,"ERRORitalic",FALSE);
			m_FontUNDERLINE = pApp->GetProfileInt( szSection,"ERRORunderline",FALSE);
			m_FontSTRIKEOUT = pApp->GetProfileInt( szSection,"ERRORstrikeout",TRUE);
			m_buttonStrikeout.ShowWindow(SW_SHOW);
			break;
		}

		m_buttonColorFont.currentcolor = m_colorFont; // paint the button
		RedrawWindow( NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW | RDW_ERASE );

		CheckDlgButton( IDC_CHECK1,m_FontBOLD );
		CheckDlgButton( IDC_CHECK2,m_FontUNDERLINE );
		CheckDlgButton( IDC_CHECK3,m_FontITALIC );
		CheckDlgButton( IDC_CHECK4,m_FontSTRIKEOUT );
	}

	*pResult = 0;
}


void CDlgEditTestColor::OnCheckUseColorBackgroundSystem()
{
	BOOL bEnable=TRUE;

	if( IsDlgButtonChecked( IDC_CHECK5 ) )
	{
		bEnable=FALSE;
	}
	m_buttonColorBackground.EnableWindow(bEnable);
	m_colorBackground=GetSysColor(COLOR_WINDOW);
	m_buttonColorBackground.currentcolor=GetSysColor(COLOR_WINDOW);
	m_richTestPreview.SetBackgroundColor( TRUE,GetSysColor(COLOR_WINDOW) );
}

void CDlgEditTestColor::OnCheckWordWrap()
{
	BOOL bWW=FALSE;
	int nVal = IsDlgButtonChecked( IDC_CHECK6 );

	if( nVal==1 )
	{
		bWW=TRUE;
	}
	m_richTestPreview.setWordWrap( bWW );

	CWinApp* pApp = AfxGetApp ();
	pApp->WriteProfileInt( szSection,"WordWrap",bWW);
}

void CDlgEditTestColor::refreshRichEditCtrl( )
{

	switch(m_dwTreeID)
	{
		case 0: // OPERATORS
			m_richTestPreview.SetOPEratorsColor(m_colorFont, m_FontBOLD,
								  m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
			break;
		case 1: // POSITIONS
			m_richTestPreview.SetPOSitionColor(m_colorFont, m_FontBOLD,
								  m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
			break;
		case 2: // TYPES
			m_richTestPreview.SetTYPeColor(m_colorFont, m_FontBOLD,
								  m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
			break;
		case 3: // MEMBERS
			m_richTestPreview.SetTRMColor(m_colorFont, m_FontBOLD,
								  m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
			break;
		case 4: // NUMBERS
			m_richTestPreview.SetNBRColor(m_colorFont, m_FontBOLD,
								  m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
			break;
		case 5: // ACTIONS
			m_richTestPreview.SetACTionsColor(m_colorFont, m_FontBOLD,
								  m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
			break;
		case 6: // STRINGS
			m_richTestPreview.SetStringColor(m_colorFont, m_FontBOLD,
								  m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
			break;
		case 7: // COMMENTS
			m_richTestPreview.SetCOMmentsColor(m_colorFont, m_FontBOLD,
								  m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
			break;
		case 8: // ERRORS
			m_richTestPreview.SetMistakeColor(m_colorFont, m_FontBOLD,
								  m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
			break;
	}
	m_richTestPreview.FormatAll();
}


void CDlgEditTestColor::clickOnBackgroundColor()
{
	m_colorBackground=m_buttonColorBackground.currentcolor;
	m_richTestPreview.SetBackgroundColor( FALSE,m_colorBackground );
}

void CDlgEditTestColor::clickOnFontColor()
{
	m_colorFont=m_buttonColorFont.currentcolor;
	refreshRichEditCtrl( );
	writeNewParamInRegistry();
}

void CDlgEditTestColor::OnBOLD()
{
	m_FontBOLD=FALSE;

	if( IsDlgButtonChecked( IDC_CHECK1 ) )
	{
		m_FontBOLD=TRUE;
	}
	refreshRichEditCtrl( );
	writeNewParamInRegistry();
}

void CDlgEditTestColor::OnUNDERLINE()
{
	m_FontUNDERLINE=FALSE;

	if( IsDlgButtonChecked( IDC_CHECK2 ) )
	{
		m_FontUNDERLINE=TRUE;
	}
	refreshRichEditCtrl( );
	writeNewParamInRegistry();
}

void CDlgEditTestColor::OnITALIC()
{
	m_FontITALIC=FALSE;

	if( IsDlgButtonChecked( IDC_CHECK3 ) )
	{
		m_FontITALIC=TRUE;
	}
	refreshRichEditCtrl( );
	writeNewParamInRegistry();
}

void CDlgEditTestColor::OnSTRIKEOUT()
{
	m_FontSTRIKEOUT=FALSE;

	if( IsDlgButtonChecked( IDC_CHECK4 ) )
	{
		m_FontSTRIKEOUT=TRUE;
	}
	refreshRichEditCtrl( );
	writeNewParamInRegistry();
}


void CDlgEditTestColor::writeNewParamInRegistry( )
{
	CWinApp* pApp = AfxGetApp ();

	switch( m_dwTreeID )
	{
	case 0: // OPERATORS
		pApp->WriteProfileInt( szSection,"OPEcolor",m_colorFont),
		pApp->WriteProfileInt( szSection,"OPEbold",m_FontBOLD),
		pApp->WriteProfileInt( szSection,"OPEIialic",m_FontITALIC),
		pApp->WriteProfileInt( szSection,"OPEunderline",m_FontUNDERLINE),
		pApp->WriteProfileInt( szSection,"OPESsrikeout",m_FontSTRIKEOUT);
		break;
	case 1: // POSitions
		pApp->WriteProfileInt( szSection,"POScolor",m_colorFont),
		pApp->WriteProfileInt( szSection,"POSbold",m_FontBOLD),
		pApp->WriteProfileInt( szSection,"POSitalic",m_FontITALIC),
		pApp->WriteProfileInt( szSection,"POSunderline",m_FontUNDERLINE),
		pApp->WriteProfileInt( szSection,"POSstrikeout",m_FontSTRIKEOUT);
		break;
	case 2: // TYPES
		pApp->WriteProfileInt( szSection,"TYPcolor",m_colorFont),
		pApp->WriteProfileInt( szSection,"TYPbold",m_FontBOLD),
		pApp->WriteProfileInt( szSection,"TYPitalic",m_FontITALIC),
		pApp->WriteProfileInt( szSection,"TYPunderline",m_FontUNDERLINE),
		pApp->WriteProfileInt( szSection,"TYPstrikeout",m_FontSTRIKEOUT);
		break;
	case 3: // MEMBERS
		pApp->WriteProfileInt( szSection,"TRMcolor",m_colorFont),
		pApp->WriteProfileInt( szSection,"TRMbold",m_FontBOLD),
		pApp->WriteProfileInt( szSection,"TRMitalic",m_FontITALIC),
		pApp->WriteProfileInt( szSection,"TRMunderline",m_FontUNDERLINE),
		pApp->WriteProfileInt( szSection,"TRMstrikeout",m_FontSTRIKEOUT);
		break;

	case 4: // NUMBERS
		pApp->WriteProfileInt( szSection,"NBRcolor",m_colorFont),
		pApp->WriteProfileInt( szSection,"NBRbold",m_FontBOLD),
		pApp->WriteProfileInt( szSection,"NBRitalic",m_FontITALIC),
		pApp->WriteProfileInt( szSection,"NBRunderline",m_FontUNDERLINE),
		pApp->WriteProfileInt( szSection,"NBRstrikeout",m_FontSTRIKEOUT);
		break;

	case 5: // ACTIONS
		pApp->WriteProfileInt( szSection,"ACTcolor",m_colorFont),
		pApp->WriteProfileInt( szSection,"ACTbold",m_FontBOLD),
		pApp->WriteProfileInt( szSection,"ACTitalic",m_FontITALIC),
		pApp->WriteProfileInt( szSection,"ACTunderline",m_FontUNDERLINE),
		pApp->WriteProfileInt( szSection,"ACTstrikeout",m_FontSTRIKEOUT);
		break;

	case 6: // STRINGS
		pApp->WriteProfileInt( szSection,"STRINGcolor",m_colorFont),
		pApp->WriteProfileInt( szSection,"STRINGbold",m_FontBOLD),
		pApp->WriteProfileInt( szSection,"STRINGitalic",m_FontITALIC),
		pApp->WriteProfileInt( szSection,"STRINGunderline",m_FontUNDERLINE),
		pApp->WriteProfileInt( szSection,"STRINGstrikeout",m_FontSTRIKEOUT);
		break;

	case 7: // COMMENTS
		pApp->WriteProfileInt( szSection,"COMcolor",m_colorFont),
		pApp->WriteProfileInt( szSection,"COMbold",m_FontBOLD),
		pApp->WriteProfileInt( szSection,"COMitalic",m_FontITALIC),
		pApp->WriteProfileInt( szSection,"COMunderline",m_FontUNDERLINE),
		pApp->WriteProfileInt( szSection,"COMstrikeout",m_FontSTRIKEOUT);
		break;

	case 8: // ERROrS
		pApp->WriteProfileInt( szSection,"ERRORcolor",m_colorFont),
		pApp->WriteProfileInt( szSection,"ERRORbold",m_FontBOLD),
		pApp->WriteProfileInt( szSection,"ERRORitalic",m_FontITALIC),
		pApp->WriteProfileInt( szSection,"ERRORunderline",m_FontUNDERLINE),
		pApp->WriteProfileInt( szSection,"ERRORstrikeout",m_FontSTRIKEOUT);
		break;
	}
}

void CDlgEditTestColor::OnFontSize()
{
	CString strSize("10"); // default
	int nID = m_combo.GetCurSel();
	m_combo.GetLBText(nID,strSize );
	CWinApp* pApp = AfxGetApp ();
	pApp->WriteProfileString( szSection, "FontSize", strSize );
	m_richTestPreview.SetFontSize( strSize );
	m_richTestPreview.setSelectionCharFormat();
}

void CDlgEditTestColor::OnDefault()
{

	CWinApp* pApp = AfxGetApp ();

	// background - color system
	m_buttonColorBackground.EnableWindow(FALSE);
	m_buttonColorBackground.currentcolor=GetSysColor(COLOR_WINDOW);
	m_richTestPreview.SetBackgroundColor( TRUE,GetSysColor(COLOR_WINDOW) );
	CheckDlgButton(IDC_CHECK5,TRUE);

	// word wrap - yes
	m_richTestPreview.setWordWrap( TRUE );
	CheckDlgButton(IDC_CHECK6,TRUE);
	pApp->WriteProfileInt( szSection,"WordWrap",TRUE);

	// font size - 10
	CString strSize("10");
	m_combo.SetCurSel(2);
	m_richTestPreview.SetFontSize( strSize );
	m_richTestPreview.setSelectionCharFormat();
	pApp->WriteProfileString( szSection, "FontSize", strSize );


	// save temporarerily tree index (m_dwTreeID)
	DWORD dwTemp = m_dwTreeID;

	// operators
	m_colorFont = RGB(255,0,0);
	m_FontBOLD = FALSE;
	m_FontITALIC = FALSE;
	m_FontUNDERLINE = FALSE;
	m_FontSTRIKEOUT = FALSE;
	m_dwTreeID = 0;
	refreshRichEditCtrl( );
	writeNewParamInRegistry();

	// positions
	m_colorFont = RGB(0,0,255);
	m_FontBOLD = FALSE;
	m_FontITALIC = FALSE;
	m_FontUNDERLINE = FALSE;
	m_FontSTRIKEOUT = FALSE;
	m_dwTreeID = 1;
	refreshRichEditCtrl( );
	writeNewParamInRegistry();

	// types
	m_colorFont = RGB(0,255,0);
	m_FontBOLD = FALSE;
	m_FontITALIC = FALSE;
	m_FontUNDERLINE = FALSE;
	m_FontSTRIKEOUT = FALSE;
	m_dwTreeID = 2;
	refreshRichEditCtrl( );
	writeNewParamInRegistry();

	// members
	m_colorFont = RGB(0,0,0);
	m_FontBOLD = TRUE;
	m_FontITALIC = FALSE;
	m_FontUNDERLINE = FALSE;
	m_FontSTRIKEOUT = FALSE;
	m_dwTreeID = 3;
	refreshRichEditCtrl( );
	writeNewParamInRegistry();

	// number
	m_colorFont = RGB(255,0,255);
	m_FontBOLD = FALSE;
	m_FontITALIC = FALSE;
	m_FontUNDERLINE = FALSE;
	m_FontSTRIKEOUT = FALSE;
	m_dwTreeID = 4;
	refreshRichEditCtrl( );
	writeNewParamInRegistry();

	// actions
	m_colorFont = RGB(255,0,0);
	m_FontBOLD = FALSE;
	m_FontITALIC = FALSE;
	m_FontUNDERLINE = TRUE;
	m_FontSTRIKEOUT = FALSE;
	m_dwTreeID = 5;
	refreshRichEditCtrl( );
	writeNewParamInRegistry();

	// strings
	m_colorFont = RGB(123,112,230);
	m_FontBOLD = TRUE;
	m_FontITALIC = TRUE;
	m_FontUNDERLINE = FALSE;
	m_FontSTRIKEOUT = FALSE;
	m_dwTreeID = 6;
	refreshRichEditCtrl( );
	writeNewParamInRegistry();

	// comments
	m_colorFont = RGB(192,192,192);
	m_FontBOLD = FALSE;
	m_FontITALIC = TRUE;
	m_FontUNDERLINE = FALSE;
	m_FontSTRIKEOUT = FALSE;
	m_dwTreeID = 7;
	refreshRichEditCtrl( );
	writeNewParamInRegistry();

	// errors
	m_colorFont = RGB(128,128,128);
	m_FontBOLD = FALSE;
	m_FontITALIC = FALSE;
	m_FontUNDERLINE = FALSE;
	m_FontSTRIKEOUT = TRUE;
	m_dwTreeID = 8;
	refreshRichEditCtrl( );
	writeNewParamInRegistry();


	// refresh the tree selecting item 0
	m_tree.SelectItem(m_hItemOPE);
	m_dwTreeID = 0;

	// if last index chosse by the user was 0,
	// color button need to be refreshed
	if( dwTemp==0 )
	{
		m_buttonColorFont.currentcolor = RGB(255,0,0);
		RedrawWindow( NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW | RDW_ERASE );
	}
}
