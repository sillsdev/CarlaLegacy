// Modified by mr (6/18/2002 10:35:42 AM)
// DlgEditTestColor.cpp : implementation file


#include "stdafx.h"
#include "..\resource.h"
#include "DlgEditTestColor.h"
#include "TextDisplayInfo.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


/////////////////////////////////////////////////////////////////////////////
// CDlgEditTestColor dialog


#ifndef mr270

#else // mr270
static const TCHAR szSection [] = _T("Settings\\TestsColor");
#endif // mr270


static const TCHAR szDefaultFontSize [] = _T("10");

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
	DDX_Control(pDX, IDC_STATICTestBckgroundColr, m_staticBackgrColorSyst);
	DDX_Control(pDX, IDC_CHECKTestStrikeout, m_buttonStrikeout);
	DDX_Control(pDX, IDC_COMBOTestFontSize, m_combo);
	DDX_Control(pDX, IDC_RICHEDITTestContent, m_richTestPreview);
	DDX_Control(pDX, IDC_TREETestKeywrdExpl, m_tree);
	DDX_Control(pDX, IDC_BUTTONTestBckgroundColr, m_buttonColorBackground);
	DDX_Control(pDX, IDC_BUTTONTestColorFont, m_buttonColorFont);
	//}}AFX_DATA_MAP

	if( pDX->m_bSaveAndValidate==0 ) // read the Registry
	{


#ifndef mr270
	LOGFONT logfont;
	CString strFontFaceName="Courier New";
	if(m_pFont->GetLogFont(&logfont) != 0)
		strFontFaceName=logfont.lfFaceName;
#endif // mr270


#ifndef mr270

	m_richTestPreview.Initialize(FALSE /*TRUE=Ample FALSE=Stamp*/,
								m_cCommentChar /*User's comment char*/,
								strFontFaceName /*User's font or default font*/,
								m_pTestEditModel /*color model for tests*/,
								TRUE /*control is read-only*/ );

	// initialize combo box with font size
	m_strFontSize = m_richTestPreview.m_lpzFontSize;
	int nId = m_combo.FindString( -1, m_strFontSize );

	if( nId != CB_ERR )
	{
		m_combo.SetCurSel( nId );
	}
	else
	{
		m_combo.SetCurSel( 2 ); // index 2 = size 10 pt
	}

	// initialize the background color button
	m_colorBackground = m_richTestPreview.m_clrBackgoundColor;
	m_buttonColorBackground.currentcolor = m_colorBackground;

	// IF using background system color THEN disabled the button
	BOOL bUseBackground = m_richTestPreview.m_bUseBackgroundSystemColor;
	if(bUseBackground)
	{
		CheckDlgButton(IDC_CHECKTestUseBckgroundColr,bUseBackground);
		m_buttonColorBackground.currentcolor=GetSysColor(COLOR_WINDOW);
		m_buttonColorBackground.EnableWindow(FALSE);
		m_staticBackgrColorSyst.EnableWindow(FALSE);
	}

	// word wrap
	m_bWordWrap = m_richTestPreview.m_pTestEditModel->m_bWordWrap;
	m_richTestPreview.setWordWrap( m_bWordWrap );
	CheckDlgButton( IDC_CHECKTestWordwrap,m_bWordWrap );

#else // mr270

		CWinApp* pApp = AfxGetApp ();

		// initialize the background color button
		m_colorBackground = pApp->GetProfileInt(szSection,"ColorBackground",RGB(255,255,255));
		m_buttonColorBackground.currentcolor = m_colorBackground;

		// IF using background system color THEN disabled the button
		BOOL bUseBackground = pApp->GetProfileInt( szSection,"UseSystemColorBackground",TRUE);
		if(bUseBackground)
		{
			CheckDlgButton(IDC_CHECKTestUseBckgroundColr,bUseBackground);
			m_buttonColorBackground.currentcolor=GetSysColor(COLOR_WINDOW);
			m_buttonColorBackground.EnableWindow(FALSE);
			m_staticBackgrColorSyst.EnableWindow(FALSE);

		}

		// word wrap
		m_bWordWrap = pApp->GetProfileInt( szSection,"WordWrap",FALSE);
		m_richTestPreview.setWordWrap( m_bWordWrap );
		CheckDlgButton( IDC_CHECKTestWordwrap,m_bWordWrap );

#endif // mr270

		// logical operators, FOR operators, locators, item keyword,
		// connectors, types, identifiers, numbers, comment, errors

		OPE = new GROUP_KEYWORDS;
		FOROPE = new GROUP_KEYWORDS;
		LOC = new GROUP_KEYWORDS;
		KEYW = new GROUP_KEYWORDS;
		CONN = new GROUP_KEYWORDS;
		TYPE = new GROUP_KEYWORDS;
		IDENTIF = new GROUP_KEYWORDS;
		NBR = new GROUP_KEYWORDS;
		COM = new GROUP_KEYWORDS;
		ERRORS = new GROUP_KEYWORDS;

#ifndef mr270

		OPE->clrColor = m_richTestPreview.m_colorOPErators.clrColor;
		OPE->bBold = m_richTestPreview.m_colorOPErators.bBold;
		OPE->bItalic = m_richTestPreview.m_colorOPErators.bItalic;
		OPE->bUnderline = m_richTestPreview.m_colorOPErators.bUnderline;
		OPE->bStrikeout = m_richTestPreview.m_colorOPErators.bStrikeout;

		FOROPE->clrColor = m_richTestPreview.m_colorForOPErators.clrColor;
		FOROPE->bBold = m_richTestPreview.m_colorForOPErators.bBold;
		FOROPE->bItalic = m_richTestPreview.m_colorForOPErators.bItalic;
		FOROPE->bUnderline = m_richTestPreview.m_colorForOPErators.bUnderline;
		FOROPE->bStrikeout = m_richTestPreview.m_colorForOPErators.bStrikeout;

		LOC->clrColor = m_richTestPreview.m_colorLOCations.clrColor;
		LOC->bBold = m_richTestPreview.m_colorLOCations.bBold;
		LOC->bItalic = m_richTestPreview.m_colorLOCations.bItalic;
		LOC->bUnderline = m_richTestPreview.m_colorLOCations.bUnderline;
		LOC->bStrikeout = m_richTestPreview.m_colorLOCations.bStrikeout;

		KEYW->clrColor = m_richTestPreview.m_colorKEYWords.clrColor;
		KEYW->bBold = m_richTestPreview.m_colorKEYWords.bBold;
		KEYW->bItalic = m_richTestPreview.m_colorKEYWords.bItalic;
		KEYW->bUnderline = m_richTestPreview.m_colorKEYWords.bUnderline;
		KEYW->bStrikeout = m_richTestPreview.m_colorKEYWords.bStrikeout;

		CONN->clrColor = m_richTestPreview.m_colorCONNectors.clrColor;
		CONN->bBold = m_richTestPreview.m_colorCONNectors.bBold;
		CONN->bItalic = m_richTestPreview.m_colorCONNectors.bItalic;
		CONN->bUnderline = m_richTestPreview.m_colorCONNectors.bUnderline;
		CONN->bStrikeout = m_richTestPreview.m_colorCONNectors.bStrikeout;

		TYPE->clrColor = m_richTestPreview.m_colorTYPes.clrColor;
		TYPE->bBold = m_richTestPreview.m_colorTYPes.bBold;
		TYPE->bItalic = m_richTestPreview.m_colorTYPes.bItalic;
		TYPE->bUnderline = m_richTestPreview.m_colorTYPes.bUnderline;
		TYPE->bStrikeout = m_richTestPreview.m_colorTYPes.bStrikeout;

		IDENTIF->clrColor = m_richTestPreview.m_colorIdentifiers.clrColor;
		IDENTIF->bBold = m_richTestPreview.m_colorIdentifiers.bBold;
		IDENTIF->bItalic = m_richTestPreview.m_colorIdentifiers.bItalic;
		IDENTIF->bUnderline = m_richTestPreview.m_colorIdentifiers.bUnderline;
		IDENTIF->bStrikeout = m_richTestPreview.m_colorIdentifiers.bStrikeout;

		NBR->clrColor = m_richTestPreview.m_colorNBR.clrColor;
		NBR->bBold = m_richTestPreview.m_colorNBR.bBold;
		NBR->bItalic = m_richTestPreview.m_colorNBR.bItalic;
		NBR->bUnderline = m_richTestPreview.m_colorNBR.bUnderline;
		NBR->bStrikeout = m_richTestPreview.m_colorNBR.bStrikeout;

		COM->clrColor = m_richTestPreview.m_colorCOMments.clrColor;
		COM->bBold = m_richTestPreview.m_colorCOMments.bBold;
		COM->bItalic = m_richTestPreview.m_colorCOMments.bItalic;
		COM->bUnderline = m_richTestPreview.m_colorCOMments.bUnderline;
		COM->bStrikeout = m_richTestPreview.m_colorCOMments.bStrikeout;

		ERRORS->clrColor = m_richTestPreview.m_colorError.clrColor;
		ERRORS->bBold = m_richTestPreview.m_colorError.bBold;
		ERRORS->bItalic = m_richTestPreview.m_colorError.bItalic;
		ERRORS->bUnderline = m_richTestPreview.m_colorError.bUnderline;
		ERRORS->bStrikeout = m_richTestPreview.m_colorError.bStrikeout;

#else // mr270
		CWinApp* pApp = AfxGetApp ();

		OPE->clrColor = pApp->GetProfileInt( szSection,"OPEcolor",RGB(255,0,0));
		OPE->bBold = pApp->GetProfileInt( szSection,"OPEbold",FALSE);
		OPE->bItalic = pApp->GetProfileInt( szSection,"OPEitalic",FALSE);
		OPE->bUnderline = pApp->GetProfileInt( szSection,"OPEunderline",FALSE);
		OPE->bStrikeout = pApp->GetProfileInt( szSection,"OPESsrikeout",FALSE);

		FOROPE->clrColor = pApp->GetProfileInt( szSection,"FOROPEcolor",RGB(0,0,255));
		FOROPE->bBold = pApp->GetProfileInt( szSection,"FOROPEbold",FALSE);
		FOROPE->bItalic = pApp->GetProfileInt( szSection,"FOROPEitalic",FALSE);
		FOROPE->bUnderline = pApp->GetProfileInt( szSection,"FOROPEunderline",FALSE);
		FOROPE->bStrikeout = pApp->GetProfileInt( szSection,"FOROPEstrikeout",FALSE);

		LOC->clrColor = pApp->GetProfileInt( szSection,"LOCcolor",RGB(0,0,255));
		LOC->bBold = pApp->GetProfileInt( szSection,"LOCbold",TRUE);
		LOC->bItalic = pApp->GetProfileInt( szSection,"LOCitalic",FALSE);
		LOC->bUnderline = pApp->GetProfileInt( szSection,"LOCunderline",TRUE);
		LOC->bStrikeout = pApp->GetProfileInt( szSection,"LOCstrikeout",FALSE);

		KEYW->clrColor = pApp->GetProfileInt( szSection,"KEYWcolor",RGB(0,0,0));
		KEYW->bBold = pApp->GetProfileInt( szSection,"KEYWbold",TRUE);
		KEYW->bItalic = pApp->GetProfileInt( szSection,"KEYWitalic",FALSE);
		KEYW->bUnderline = pApp->GetProfileInt( szSection,"KEYWunderline",FALSE);
		KEYW->bStrikeout = pApp->GetProfileInt( szSection,"KEYWstrikeout",FALSE);

		CONN->clrColor = pApp->GetProfileInt( szSection,"CONNcolor",RGB(0,0,0));
		CONN->bBold = pApp->GetProfileInt( szSection,"CONNbold",FALSE);
		CONN->bItalic = pApp->GetProfileInt( szSection,"CONNitalic",FALSE);
		CONN->bUnderline = pApp->GetProfileInt( szSection,"CONNunderline",FALSE);
		CONN->bStrikeout = pApp->GetProfileInt( szSection,"CONNstrikeout",FALSE);

		TYPE->clrColor = pApp->GetProfileInt( szSection,"TYPEcolor",RGB(255,0,0));
		TYPE->bBold = pApp->GetProfileInt( szSection,"TYPEbold",FALSE);
		TYPE->bItalic = pApp->GetProfileInt( szSection,"TYPEitalic",FALSE);
		TYPE->bUnderline = pApp->GetProfileInt( szSection,"TYPEunderline",TRUE);
		TYPE->bStrikeout = pApp->GetProfileInt( szSection,"TYPEstrikeout",FALSE);

		IDENTIF->clrColor = pApp->GetProfileInt( szSection,"IDENTIFcolor",RGB(123,112,230));
		IDENTIF->bBold = pApp->GetProfileInt( szSection,"IDENTIFbold",TRUE);
		IDENTIF->bItalic = pApp->GetProfileInt( szSection,"IDENTIFitalic",TRUE);
		IDENTIF->bUnderline = pApp->GetProfileInt( szSection,"IDENTIFunderline",FALSE);
		IDENTIF->bStrikeout = pApp->GetProfileInt( szSection,"IDENTIFstrikeout",FALSE);

		NBR->clrColor = pApp->GetProfileInt( szSection,"NBRcolor",RGB(255,0,255));
		NBR->bBold = pApp->GetProfileInt( szSection,"NBRbold",FALSE);
		NBR->bItalic = pApp->GetProfileInt( szSection,"NBRitalic",FALSE);
		NBR->bUnderline = pApp->GetProfileInt( szSection,"NBRunderline",FALSE);
		NBR->bStrikeout = pApp->GetProfileInt( szSection,"NBRstrikeout",FALSE);

		COM->clrColor = pApp->GetProfileInt( szSection,"COMcolor",RGB(192,192,192));
		COM->bBold = pApp->GetProfileInt( szSection,"COMbold",FALSE);
		COM->bItalic = pApp->GetProfileInt( szSection,"COMitalic",FALSE);
		COM->bUnderline = pApp->GetProfileInt( szSection,"COMunderline",FALSE);
		COM->bStrikeout = pApp->GetProfileInt( szSection,"COMstrikeout",FALSE);

		ERRORS->clrColor = pApp->GetProfileInt( szSection,"ERRORcolor",RGB(128,128,128));
		ERRORS->bBold = pApp->GetProfileInt( szSection,"ERRORbold",FALSE);
		ERRORS->bItalic = pApp->GetProfileInt( szSection,"ERRORitalic",FALSE);
		ERRORS->bUnderline = pApp->GetProfileInt( szSection,"ERRORunderline",FALSE);
		ERRORS->bStrikeout = pApp->GetProfileInt( szSection,"ERRORstrikeout",TRUE);

#endif // mr270

}
	else // write the Registry
	{

#ifndef mr270
	saveNewParam();
#else // mr270

		CWinApp* pApp = AfxGetApp ();
		// color background
		pApp->WriteProfileInt(szSection,"ColorBackground",m_buttonColorBackground.currentcolor);

		// use background color system
		pApp->WriteProfileInt( szSection,"UseSystemColorBackground",IsDlgButtonChecked( IDC_CHECKTestUseBckgroundColr ) );

		// word wrap
		pApp->WriteProfileInt( szSection,"WordWrap",m_bWordWrap);

		// Font Size
		pApp->WriteProfileString( szSection, "FontSize", m_strFontSize );

		// logical operators, FOR operators, locators, item keyword,
		// connectors, types, identifiers, numbers, comment, errors

		writeNewParamInRegistry();
#endif // mr270
	}
}


BEGIN_MESSAGE_MAP(CDlgEditTestColor, CDialog)
	//{{AFX_MSG_MAP(CDlgEditTestColor)
	ON_NOTIFY(TVN_SELCHANGED, IDC_TREETestKeywrdExpl, OnSelchangingTree)
	ON_BN_CLICKED(IDC_CHECKTestUseBckgroundColr, OnCheckUseColorBackgroundSystem)
	ON_BN_CLICKED(IDC_CHECKTestWordwrap, OnCheckWordWrap)
	ON_BN_CLICKED(IDC_BUTTONTestBckgroundColr, clickOnBackgroundColor)
	ON_BN_CLICKED(IDC_BUTTONTestColorFont, clickOnFontColor)
	ON_BN_CLICKED(IDC_CHECKTestBold, OnBOLD)
	ON_BN_CLICKED(IDC_CHECKTestUnderline, OnUNDERLINE)
	ON_BN_CLICKED(IDC_CHECKTestItalic, OnITALIC)
	ON_BN_CLICKED(IDC_CHECKTestStrikeout, OnSTRIKEOUT)
	ON_CBN_SELENDOK(IDC_COMBOTestFontSize, OnFontSize)
	ON_BN_CLICKED(IDC_BUTTONTestResetToDefault, OnDefault)
	ON_WM_DESTROY()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditTestColor message handlers

BOOL CDlgEditTestColor::OnInitDialog()
{
	CDialog::OnInitDialog();


	m_tree.SetBkColor( RGB (255,255,204) );

	// initalizes the tree
	HTREEITEM hItem=NULL;


	CTreeCtrl *pTree =& m_tree;

	HTREEITEM hLogicOpe = insertItem( pTree,"Logical Operators",TVI_ROOT,TVI_LAST,0);
		insertItem( pTree,"AND",hLogicOpe,TVI_LAST,0);
		insertItem( pTree,"IF",hLogicOpe,TVI_LAST,0);
		insertItem( pTree,"AND",hLogicOpe,TVI_LAST,0);
		insertItem( pTree,"NOT",hLogicOpe,TVI_LAST,0);
		insertItem( pTree,"OR",hLogicOpe,TVI_LAST,0);
		insertItem( pTree,"THEN",hLogicOpe,TVI_LAST,0);
		insertItem( pTree,"XOR",hLogicOpe,TVI_LAST,0);
		m_hItemOPE=hLogicOpe; // used by OnDefault

	HTREEITEM hLogicForOpe = insertItem( pTree,"FOR Operators",TVI_ROOT,TVI_LAST,1);
		insertItem( pTree,"FOR_ALL_LEFT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FOR_ALL_RIGHT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FOR_SOME_LEFT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FOR_SOME_RIGHT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FOR-ALL-LEFT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FOR-ALL-RIGHT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FOR-SOME-LEFT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FOR-SOME-RIGHT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FORALLLEFT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FORALLRIGHT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FORSOMELEFT",hLogicForOpe,TVI_LAST,1);
		insertItem( pTree,"FORSOMERIGHT",hLogicForOpe,TVI_LAST,1);

	HTREEITEM hLoc = insertItem( pTree,"Locators",TVI_ROOT,TVI_LAST,2);
		insertItem( pTree,"current",hLoc,TVI_LAST,2);
		insertItem( pTree,"last",hLoc,TVI_LAST,2);
		insertItem( pTree,"left",hLoc,TVI_LAST,2);
		insertItem( pTree,"next",hLoc,TVI_LAST,2);
		insertItem( pTree,"right",hLoc,TVI_LAST,2);
		insertItem( pTree,"FINAL",hLoc,TVI_LAST,2);
		insertItem( pTree,"INITIAL",hLoc,TVI_LAST,2);
		insertItem( pTree,"LEFT",hLoc,TVI_LAST,2);
		insertItem( pTree,"RIGHT",hLoc,TVI_LAST,2);

	HTREEITEM hItemKEYW = insertItem( pTree,"Item Keywords",TVI_ROOT,TVI_LAST,3);
		insertItem( pTree,"allomorph",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"capitalized",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"fromcategory",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"morphname",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"orderclass",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"property",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"punctuation",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"string",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"surface",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"tocategory",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"type",hItemKEYW,TVI_LAST,3);
		insertItem( pTree,"word",hItemKEYW,TVI_LAST,3);


	HTREEITEM hItemKEYWStamp = insertItem( pTree,"Stamp only",hItemKEYW,TVI_LAST,10);
		insertItem( pTree,"insert",hItemKEYWStamp,TVI_LAST,11);
		insertItem( pTree,"before",hItemKEYWStamp,TVI_LAST,11);
		insertItem( pTree,"after",hItemKEYWStamp,TVI_LAST,12);
		insertItem( pTree,"report",hItemKEYWStamp,TVI_LAST,13);

	HTREEITEM hCONN = insertItem( pTree,"Connectors",TVI_ROOT,TVI_LAST,4);
		insertItem( pTree,"is",hCONN,TVI_LAST,4);
		insertItem( pTree,"is member",hCONN,TVI_LAST,4);
		insertItem( pTree,"matches",hCONN,TVI_LAST,4);
		insertItem( pTree,"matches member",hCONN,TVI_LAST,4);
		insertItem( pTree,"=",hCONN,TVI_LAST,4);
		insertItem( pTree,">",hCONN,TVI_LAST,4);
		insertItem( pTree,">=",hCONN,TVI_LAST,4);
		insertItem( pTree,"<=",hCONN,TVI_LAST,4);
		insertItem( pTree,"<",hCONN,TVI_LAST,4);
		insertItem( pTree,"~=",hCONN,TVI_LAST,4);

	HTREEITEM hTYP = insertItem( pTree,"Morpheme types",TVI_ROOT,TVI_LAST,5);
		insertItem( pTree,"prefix",hTYP,TVI_LAST,5);
		insertItem( pTree,"infix",hTYP,TVI_LAST,5);
		insertItem( pTree,"root",hTYP,TVI_LAST,5);
		insertItem( pTree,"suffix",hTYP,TVI_LAST,5);
		insertItem( pTree,"initial",hTYP,TVI_LAST,5);
		insertItem( pTree,"final",hTYP,TVI_LAST,5);


	HTREEITEM hIDENTIF = insertItem( pTree,"Identifiers",TVI_ROOT,TVI_LAST,6);

	HTREEITEM hNUMBER = insertItem( pTree,"Numbers",TVI_ROOT,TVI_LAST,7);

	HTREEITEM hCOMMENT = insertItem( pTree,"Comments",TVI_ROOT,TVI_LAST,8);

	HTREEITEM hERRORS = insertItem( pTree,"Errors",TVI_ROOT,TVI_LAST,9);

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
		case 10:
			str = "\\co Click on insert, before, after, report to see more examples.";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();
			break;

		case 11:
			str = "( insert \"x\" before current )";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();
			break;

		case 12:
			str = "( insert \"a\" after current )";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();
			break;


		case 13:
			str = "( left orderclass > current orderclass )\n( report \"Orderclass Violation\" )";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();
			break;


		case 0:	// logical operators
			str = "IF (current property is voiced)\nTHEN\n\t((left property is voices-following-C)\n\tOR (left morphname is HYPHEN-Q))";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont= OPE->clrColor;
			m_FontBOLD = OPE->bBold;
			m_FontITALIC = OPE->bItalic;
			m_FontUNDERLINE = OPE->bUnderline;
			m_FontSTRIKEOUT = OPE->bStrikeout;
			break;

		case 1:	// FOR operators
			str = "IF current morphname is \"INS\"\nTHEN\n\t(FOR_SOME_RIGHT\n\t(\tRIGHT type is root\nAND RIGHT tocategory is VO\t))";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont= FOROPE->clrColor;
			m_FontBOLD = FOROPE->bBold;
			m_FontITALIC = FOROPE->bItalic;
			m_FontUNDERLINE = FOROPE->bUnderline;
			m_FontSTRIKEOUT = FOROPE->bStrikeout;

			break;

		case 2:	// locators
			str = "fromcategory is current tocategory\n\nIF left type is suffix THEN left tocategory is current fromcategory";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont= LOC->clrColor;
			m_FontBOLD = LOC->bBold;
			m_FontITALIC = LOC->bItalic;
			m_FontUNDERLINE = LOC->bUnderline;
			m_FontSTRIKEOUT = LOC->bStrikeout;
			break;

		case 3:	// item keyword
			str = "Final allomorph is member Econ\n\ncurrent allomorph matches \"b\"\n\nnext word is member XBZI";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont= KEYW->clrColor;
			m_FontBOLD = KEYW->bBold;
			m_FontITALIC = KEYW->bItalic;
			m_FontUNDERLINE = KEYW->bUnderline;
			m_FontSTRIKEOUT = KEYW->bStrikeout;
			break;

		case 4:	// connectors
#ifndef mr270
			str = "left string matches current allomorph\n\ncurrent surface is \"glyph\"";
#else // mr270
			str = "left string matches current allomorph\n\ncurrent string is \"glyph\"";
#endif // mr270

			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont= CONN->clrColor;
			m_FontBOLD = CONN->bBold;
			m_FontITALIC = CONN->bItalic;
			m_FontUNDERLINE = CONN->bUnderline;
			m_FontSTRIKEOUT = CONN->bStrikeout;
			break;

		case 5:	// types
			str = "NOT left type is root\n\nINITIAL type is prefix\n\nFINAL type is suffix";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont= TYPE->clrColor;
			m_FontBOLD = TYPE->bBold;
			m_FontITALIC = TYPE->bItalic;
			m_FontUNDERLINE = TYPE->bUnderline;
			m_FontSTRIKEOUT = TYPE->bStrikeout;
			break;

		case 6:	// identifiers

		#ifndef mr270
			str = "current allomorph is \"chro\"\ncurrent allomorph is .chro.\ncurrent allomorph is \'chro\'";
		#else // mr270
			str = "\"a\"\t\'a\'\t.a.\n\"abc\"\t\'abc\'\t.abc.\n\"u\'la\"\t\'u\"la\'\t.u\"la\'.\n";
		#endif // mr270

			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont= IDENTIF->clrColor;
			m_FontBOLD = IDENTIF->bBold;
			m_FontITALIC = IDENTIF->bItalic;
			m_FontUNDERLINE = IDENTIF->bUnderline;
			m_FontSTRIKEOUT = IDENTIF->bStrikeout;
			break;

		case 7:	// numbers
			str = "current orderclass = 0\n\nleft orderclass ~= 250";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont= NBR->clrColor;
			m_FontBOLD = NBR->bBold;
			m_FontITALIC = NBR->bItalic;
			m_FontUNDERLINE = NBR->bUnderline;
			m_FontSTRIKEOUT = NBR->bStrikeout;
			break;


		case 8:	// comment

#ifndef mr270
			str = m_cCommentChar;
			str += " FINAL allomorph is member \"Egon\"\n\n\\co FINAL allomorph is member \"Egon\"";
#else // mr270
			str = "| FINAL allomorph is member \"Egon\"\n\n\\co FINAL allomorph is member \"Egon\"";
#endif // mr270

			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont= COM->clrColor;
			m_FontBOLD = COM->bBold;
			m_FontITALIC = COM->bItalic;
			m_FontUNDERLINE = COM->bUnderline;
			m_FontSTRIKEOUT = COM->bStrikeout;
			break;

		case 9:	// errors
			str = "FINAL alomorph ix membre \"Egon\"";
			m_richTestPreview.SetWindowText(str);
			m_richTestPreview.FormatAll();

			m_colorFont= ERRORS->clrColor;
			m_FontBOLD = ERRORS->bBold;
			m_FontITALIC = ERRORS->bItalic;
			m_FontUNDERLINE = ERRORS->bUnderline;
			m_FontSTRIKEOUT = ERRORS->bStrikeout;

			m_buttonStrikeout.ShowWindow(SW_SHOW);  // only here.
			break;
		}

		m_buttonColorFont.currentcolor = m_colorFont; // paint the button
		RedrawWindow( NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW | RDW_ERASE );

		CheckDlgButton( IDC_CHECKTestBold,m_FontBOLD );
		CheckDlgButton( IDC_CHECKTestUnderline,m_FontUNDERLINE );
		CheckDlgButton( IDC_CHECKTestItalic,m_FontITALIC );
		CheckDlgButton( IDC_CHECKTestStrikeout,m_FontSTRIKEOUT );
	}

	*pResult = 0;
}


void CDlgEditTestColor::OnCheckUseColorBackgroundSystem()
{
	BOOL bEnable=TRUE;

	if( IsDlgButtonChecked( IDC_CHECKTestUseBckgroundColr ) )
	{
		bEnable=FALSE;
	}
	m_buttonColorBackground.EnableWindow(bEnable);
	m_staticBackgrColorSyst.EnableWindow(bEnable);
	m_colorBackground=GetSysColor(COLOR_WINDOW);
	m_buttonColorBackground.currentcolor=GetSysColor(COLOR_WINDOW);
	m_richTestPreview.SetBackgroundColor( TRUE,GetSysColor(COLOR_WINDOW) );
}

void CDlgEditTestColor::OnCheckWordWrap()
{
	m_bWordWrap=FALSE;
	int nVal = IsDlgButtonChecked( IDC_CHECKTestWordwrap );

	if( nVal==1 )
	{
		m_bWordWrap=TRUE;
	}
	m_richTestPreview.setWordWrap( m_bWordWrap );
}

void CDlgEditTestColor::refreshRichEditCtrl()
{

		switch(m_dwTreeID)
	{
		case 0: // logical operators
			m_richTestPreview.setColor( m_richTestPreview.m_colorOPErators,m_colorFont,m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
				OPE->clrColor=m_colorFont;OPE->bBold=m_FontBOLD;OPE->bItalic=m_FontITALIC;OPE->bStrikeout=m_FontSTRIKEOUT;OPE->bUnderline=m_FontUNDERLINE;
			break;
		case 1: // FOR operators
			m_richTestPreview.setColor( m_richTestPreview.m_colorForOPErators,m_colorFont,m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
				FOROPE->clrColor=m_colorFont;FOROPE->bBold=m_FontBOLD;FOROPE->bItalic=m_FontITALIC;FOROPE->bStrikeout=m_FontSTRIKEOUT;FOROPE->bUnderline=m_FontUNDERLINE;
			break;
		case 2: // locators
			m_richTestPreview.setColor( m_richTestPreview.m_colorLOCations,m_colorFont,m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
				LOC->clrColor=m_colorFont;LOC->bBold=m_FontBOLD;LOC->bItalic=m_FontITALIC;LOC->bStrikeout=m_FontSTRIKEOUT;LOC->bUnderline=m_FontUNDERLINE;
			break;
		case 3: // item keyword
			m_richTestPreview.setColor( m_richTestPreview.m_colorKEYWords,m_colorFont,m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
				KEYW->clrColor=m_colorFont;KEYW->bBold=m_FontBOLD;KEYW->bItalic=m_FontITALIC;KEYW->bStrikeout=m_FontSTRIKEOUT;KEYW->bUnderline=m_FontUNDERLINE;
			break;
		case 4: // connectors
			m_richTestPreview.setColor( m_richTestPreview.m_colorCONNectors,m_colorFont,m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
				CONN->clrColor=m_colorFont;CONN->bBold=m_FontBOLD;CONN->bItalic=m_FontITALIC;CONN->bStrikeout=m_FontSTRIKEOUT;CONN->bUnderline=m_FontUNDERLINE;
			break;
		case 5: // types
			m_richTestPreview.setColor( m_richTestPreview.m_colorTYPes,m_colorFont,m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
				TYPE->clrColor=m_colorFont;TYPE->bBold=m_FontBOLD;TYPE->bItalic=m_FontITALIC;TYPE->bStrikeout=m_FontSTRIKEOUT;TYPE->bUnderline=m_FontUNDERLINE;
			break;
		case 6: // identifiers
			m_richTestPreview.setColor( m_richTestPreview.m_colorIdentifiers,m_colorFont,m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
				IDENTIF->clrColor=m_colorFont;IDENTIF->bBold=m_FontBOLD;IDENTIF->bItalic=m_FontITALIC;IDENTIF->bStrikeout=m_FontSTRIKEOUT;IDENTIF->bUnderline=m_FontUNDERLINE;
			break;
		case 7: // numbers
			m_richTestPreview.setColor( m_richTestPreview.m_colorNBR,m_colorFont,m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
				NBR->clrColor=m_colorFont;NBR->bBold=m_FontBOLD;NBR->bItalic=m_FontITALIC;NBR->bStrikeout=m_FontSTRIKEOUT;NBR->bUnderline=m_FontUNDERLINE;
			break;
		case 8: // comment
			m_richTestPreview.setColor( m_richTestPreview.m_colorCOMments,m_colorFont,m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
				COM->clrColor=m_colorFont;COM->bBold=m_FontBOLD;COM->bItalic=m_FontITALIC;COM->bStrikeout=m_FontSTRIKEOUT;COM->bUnderline=m_FontUNDERLINE;
			break;
		case 9: // errors
			m_richTestPreview.setColor( m_richTestPreview.m_colorError,m_colorFont,m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT );
				ERRORS->clrColor=m_colorFont;ERRORS->bBold=m_FontBOLD;ERRORS->bItalic=m_FontITALIC;ERRORS->bStrikeout=m_FontSTRIKEOUT;ERRORS->bUnderline=m_FontUNDERLINE;
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
	refreshRichEditCtrl();
}

void CDlgEditTestColor::OnBOLD()
{
	m_FontBOLD=FALSE;

	if( IsDlgButtonChecked( IDC_CHECKTestBold ) )
	{
		m_FontBOLD=TRUE;
	}
	refreshRichEditCtrl();
}

void CDlgEditTestColor::OnUNDERLINE()
{
	m_FontUNDERLINE=FALSE;

	if( IsDlgButtonChecked( IDC_CHECKTestUnderline ) )
	{
		m_FontUNDERLINE=TRUE;
	}
	refreshRichEditCtrl();
}

void CDlgEditTestColor::OnITALIC()
{
	m_FontITALIC=FALSE;

	if( IsDlgButtonChecked( IDC_CHECKTestItalic ) )
	{
		m_FontITALIC=TRUE;
	}
	refreshRichEditCtrl();
}

void CDlgEditTestColor::OnSTRIKEOUT()
{
	m_FontSTRIKEOUT=FALSE;

	if( IsDlgButtonChecked( IDC_CHECKTestStrikeout ) )
	{
		m_FontSTRIKEOUT=TRUE;
	}
	refreshRichEditCtrl();
}

#ifndef mr270
void CDlgEditTestColor::saveNewParam( )
#else // mr270
void CDlgEditTestColor::writeNewParamInRegistry( )
#endif // mr270
{
#ifndef mr270

	m_richTestPreview.m_pTestEditModel->m_colorBkg = m_buttonColorBackground.currentcolor;
	m_richTestPreview.m_pTestEditModel->m_bUseSystemColorBkg = IsDlgButtonChecked( IDC_CHECKTestUseBckgroundColr );
	m_richTestPreview.m_pTestEditModel->m_bWordWrap = m_bWordWrap;
	m_richTestPreview.m_pTestEditModel->m_strFontSize = m_strFontSize;

	m_richTestPreview.m_pTestEditModel->m_OPEColor = OPE->clrColor;
	m_richTestPreview.m_pTestEditModel->m_bOPEBold = OPE->bBold;
	m_richTestPreview.m_pTestEditModel->m_bOPEItalic = OPE->bItalic;
	m_richTestPreview.m_pTestEditModel->m_bOPEUnderline = OPE->bUnderline;
	m_richTestPreview.m_pTestEditModel->m_bOPEStrikeout = OPE->bStrikeout;

	m_richTestPreview.m_pTestEditModel->m_FOROPColor = FOROPE->clrColor;
	m_richTestPreview.m_pTestEditModel->m_bFOROPBold = FOROPE->bBold;
	m_richTestPreview.m_pTestEditModel->m_bFOROPItalic = FOROPE->bItalic;
	m_richTestPreview.m_pTestEditModel->m_bFOROPUnderline = FOROPE->bUnderline;
	m_richTestPreview.m_pTestEditModel->m_bFOROPStrikeout = FOROPE->bStrikeout;

	m_richTestPreview.m_pTestEditModel->m_LOCColor = LOC->clrColor;
	m_richTestPreview.m_pTestEditModel->m_bLOCBold = LOC->bBold;
	m_richTestPreview.m_pTestEditModel->m_bLOCItalic = LOC->bItalic;
	m_richTestPreview.m_pTestEditModel->m_bLOCUnderline = LOC->bUnderline;
	m_richTestPreview.m_pTestEditModel->m_bLOCStrikeout = LOC->bStrikeout;

	m_richTestPreview.m_pTestEditModel->m_KEYWColor = KEYW->clrColor;
	m_richTestPreview.m_pTestEditModel->m_bKEYWBold = KEYW->bBold;
	m_richTestPreview.m_pTestEditModel->m_bKEYWItalic = KEYW->bItalic;
	m_richTestPreview.m_pTestEditModel->m_bKEYWUnderline = KEYW->bUnderline;
	m_richTestPreview.m_pTestEditModel->m_bKEYWStrikeout = KEYW->bStrikeout;

	m_richTestPreview.m_pTestEditModel->m_CONColor = CONN->clrColor;
	m_richTestPreview.m_pTestEditModel->m_bCONBold = CONN->bBold;
	m_richTestPreview.m_pTestEditModel->m_bCONItalic = CONN->bItalic;
	m_richTestPreview.m_pTestEditModel->m_bCONUnderline = CONN->bUnderline;
	m_richTestPreview.m_pTestEditModel->m_bCONStrikeout = CONN->bStrikeout;

	m_richTestPreview.m_pTestEditModel->m_TYPColor = TYPE->clrColor;
	m_richTestPreview.m_pTestEditModel->m_bTYPBold = TYPE->bBold;
	m_richTestPreview.m_pTestEditModel->m_bTYPItalic = TYPE->bItalic;
	m_richTestPreview.m_pTestEditModel->m_bTYPUnderline = TYPE->bUnderline;
	m_richTestPreview.m_pTestEditModel->m_bTYPStrikeout = TYPE->bStrikeout;

	m_richTestPreview.m_pTestEditModel->m_IDENTIFColor = IDENTIF->clrColor;
	m_richTestPreview.m_pTestEditModel->m_bIDENTIFBold = IDENTIF->bBold;
	m_richTestPreview.m_pTestEditModel->m_bIDENTIFItalic = IDENTIF->bItalic;
	m_richTestPreview.m_pTestEditModel->m_bIDENTIFUnderline = IDENTIF->bUnderline;
	m_richTestPreview.m_pTestEditModel->m_bIDENTIFStrikeout = IDENTIF->bStrikeout;

	m_richTestPreview.m_pTestEditModel->m_NBRColor = NBR->clrColor;
	m_richTestPreview.m_pTestEditModel->m_bNBRBold = NBR->bBold;
	m_richTestPreview.m_pTestEditModel->m_bNBRItalic = NBR->bItalic;
	m_richTestPreview.m_pTestEditModel->m_bNBRUnderline = NBR->bUnderline;
	m_richTestPreview.m_pTestEditModel->m_bNBRStrikeout = NBR->bStrikeout;

	m_richTestPreview.m_pTestEditModel->m_COMColor = COM->clrColor;
	m_richTestPreview.m_pTestEditModel->m_bCOMBold = COM->bBold;
	m_richTestPreview.m_pTestEditModel->m_bCOMItalic = COM->bItalic;
	m_richTestPreview.m_pTestEditModel->m_bCOMUnderline = COM->bUnderline;
	m_richTestPreview.m_pTestEditModel->m_bCOMStrikeout = COM->bStrikeout;

	m_richTestPreview.m_pTestEditModel->m_ERRORColor = ERRORS->clrColor;
	m_richTestPreview.m_pTestEditModel->m_bERRORBold = ERRORS->bBold;
	m_richTestPreview.m_pTestEditModel->m_bERRORItalic = ERRORS->bItalic;
	m_richTestPreview.m_pTestEditModel->m_bERRORUnderline = ERRORS->bUnderline;
	m_richTestPreview.m_pTestEditModel->m_bERRORStrikeout = ERRORS->bStrikeout;

#else // mr270

	CWinApp* pApp = AfxGetApp ();

	 pApp->WriteProfileInt( szSection,"OPEcolor",OPE->clrColor);
	 pApp->WriteProfileInt( szSection,"OPEbold",OPE->bBold);
	 pApp->WriteProfileInt( szSection,"OPEitalic",OPE->bItalic);
	 pApp->WriteProfileInt( szSection,"OPEunderline",OPE->bUnderline);
	 pApp->WriteProfileInt( szSection,"OPESsrikeout",OPE->bStrikeout);

	 pApp->WriteProfileInt( szSection,"FOROPEcolor",FOROPE->clrColor);
	 pApp->WriteProfileInt( szSection,"FOROPEbold",FOROPE->bBold);
	 pApp->WriteProfileInt( szSection,"FOROPEitalic",FOROPE->bItalic);
	 pApp->WriteProfileInt( szSection,"FOROPEunderline",FOROPE->bUnderline);
	 pApp->WriteProfileInt( szSection,"FOROPEstrikeout",FOROPE->bStrikeout);

	 pApp->WriteProfileInt( szSection,"LOCcolor",LOC->clrColor);
	 pApp->WriteProfileInt( szSection,"LOCbold",LOC->bBold);
	 pApp->WriteProfileInt( szSection,"LOCitalic",LOC->bItalic);
	 pApp->WriteProfileInt( szSection,"LOCunderline",LOC->bUnderline);
	 pApp->WriteProfileInt( szSection,"LOCstrikeout",LOC->bStrikeout);

	 pApp->WriteProfileInt( szSection,"KEYWcolor",KEYW->clrColor);
	 pApp->WriteProfileInt( szSection,"KEYWbold",KEYW->bBold);
	 pApp->WriteProfileInt( szSection,"KEYWitalic",KEYW->bItalic);
	 pApp->WriteProfileInt( szSection,"KEYWunderline",KEYW->bUnderline);
	 pApp->WriteProfileInt( szSection,"KEYWstrikeout",KEYW->bStrikeout);

	 pApp->WriteProfileInt( szSection,"CONNcolor",CONN->clrColor);
	 pApp->WriteProfileInt( szSection,"CONNbold",CONN->bBold);
	 pApp->WriteProfileInt( szSection,"CONNitalic",CONN->bItalic);
	 pApp->WriteProfileInt( szSection,"CONNunderline",CONN->bUnderline);
	 pApp->WriteProfileInt( szSection,"CONNstrikeout",CONN->bStrikeout);

	 pApp->WriteProfileInt( szSection,"TYPEcolor",TYPE->clrColor);
	 pApp->WriteProfileInt( szSection,"TYPEbold",TYPE->bBold);
	 pApp->WriteProfileInt( szSection,"TYPEitalic",TYPE->bItalic);
	 pApp->WriteProfileInt( szSection,"TYPEunderline",TYPE->bUnderline);
	 pApp->WriteProfileInt( szSection,"TYPEstrikeout",TYPE->bStrikeout);

	 pApp->WriteProfileInt( szSection,"IDENTIFcolor",IDENTIF->clrColor);
	 pApp->WriteProfileInt( szSection,"IDENTIFbold",IDENTIF->bBold);
	 pApp->WriteProfileInt( szSection,"IDENTIFitalic",IDENTIF->bItalic);
	 pApp->WriteProfileInt( szSection,"IDENTIFunderline",IDENTIF->bUnderline);
	 pApp->WriteProfileInt( szSection,"IDENTIFstrikeout",IDENTIF->bStrikeout);

	 pApp->WriteProfileInt( szSection,"NBRcolor",NBR->clrColor);
	 pApp->WriteProfileInt( szSection,"NBRbold",NBR->bBold);
	 pApp->WriteProfileInt( szSection,"NBRitalic",NBR->bItalic);
	 pApp->WriteProfileInt( szSection,"NBRunderline",NBR->bUnderline);
	 pApp->WriteProfileInt( szSection,"NBRstrikeout",NBR->bStrikeout);

	 pApp->WriteProfileInt( szSection,"COMcolor",COM->clrColor);
	 pApp->WriteProfileInt( szSection,"COMbold",COM->bBold);
	 pApp->WriteProfileInt( szSection,"COMitalic",COM->bItalic);
	 pApp->WriteProfileInt( szSection,"COMunderline",COM->bUnderline);
	 pApp->WriteProfileInt( szSection,"COMstrikeout",COM->bStrikeout);

	 pApp->WriteProfileInt( szSection,"ERRORcolor",ERRORS->clrColor);
	 pApp->WriteProfileInt( szSection,"ERRORbold",ERRORS->bBold);
	 pApp->WriteProfileInt( szSection,"ERRORitalic",ERRORS->bItalic);
	 pApp->WriteProfileInt( szSection,"ERRORunderline",ERRORS->bUnderline);
	 pApp->WriteProfileInt( szSection,"ERRORstrikeout",ERRORS->bStrikeout);
#endif // mr270

}

void CDlgEditTestColor::OnFontSize()
{
	m_strFontSize = szDefaultFontSize; // default
	int nID = m_combo.GetCurSel();
	m_combo.GetLBText(nID,m_strFontSize);
	m_richTestPreview.SetFontSize( m_strFontSize );
	m_richTestPreview.setSelectionCharFormat();
}

void CDlgEditTestColor::OnDefault()
{
	CWinApp* pApp = AfxGetApp ();

	// background - color system
	m_buttonColorBackground.EnableWindow(FALSE);
	m_buttonColorBackground.currentcolor=GetSysColor(COLOR_WINDOW);
	m_richTestPreview.SetBackgroundColor( TRUE,GetSysColor(COLOR_WINDOW) );
	CheckDlgButton(IDC_CHECKTestUseBckgroundColr,TRUE);


	// word wrap - yes
	m_bWordWrap=TRUE;
	m_richTestPreview.setWordWrap( TRUE );
	CheckDlgButton(IDC_CHECKTestWordwrap,TRUE);

	// font size - 10 is the size by default
	CString strSize("10");
	m_combo.SetCurSel(2);
	m_richTestPreview.SetFontSize( strSize );
	m_richTestPreview.setSelectionCharFormat();
	m_strFontSize="10";


	// logical operators
	OPE->clrColor=RGB(255,0,0);
	OPE->bBold=FALSE;
	OPE->bItalic=FALSE;
	OPE->bUnderline=FALSE;
	OPE->bStrikeout=FALSE;
	m_richTestPreview.setColor(m_richTestPreview.m_colorOPErators,OPE->clrColor,OPE->bBold,OPE->bItalic,OPE->bUnderline,OPE->bStrikeout);

	// FOR operators
	FOROPE->clrColor=RGB(0,0,255);
	FOROPE->bBold=FALSE;
	FOROPE->bItalic=FALSE;
	FOROPE->bUnderline=FALSE;
	FOROPE->bStrikeout=FALSE;
	m_richTestPreview.setColor(m_richTestPreview.m_colorForOPErators,FOROPE->clrColor,FOROPE->bBold,FOROPE->bItalic,FOROPE->bUnderline,FOROPE->bStrikeout);

	// locators
	LOC->clrColor=RGB(0,0,255);
	LOC->bBold=TRUE;
	LOC->bItalic=FALSE;
	LOC->bUnderline=TRUE;
	LOC->bStrikeout=FALSE;
	m_richTestPreview.setColor(m_richTestPreview.m_colorLOCations,LOC->clrColor,LOC->bBold,LOC->bItalic,LOC->bUnderline,LOC->bStrikeout);

	// item keyword
	KEYW->clrColor=RGB(0,0,0);
	KEYW->bBold=TRUE;
	KEYW->bItalic=FALSE;
	KEYW->bUnderline=FALSE;
	KEYW->bStrikeout=FALSE;
	m_richTestPreview.setColor(m_richTestPreview.m_colorKEYWords,KEYW->clrColor,KEYW->bBold,KEYW->bItalic,KEYW->bUnderline,KEYW->bStrikeout);

	// connectors
	CONN->clrColor=RGB(0,0,0);
	CONN->bBold=FALSE;
	CONN->bItalic=FALSE;
	CONN->bUnderline=FALSE;
	CONN->bStrikeout=FALSE;
	m_richTestPreview.setColor(m_richTestPreview.m_colorCONNectors,CONN->clrColor,CONN->bBold,CONN->bItalic,CONN->bUnderline,CONN->bStrikeout);

	// types
	TYPE->clrColor=RGB(255,0,0);
	TYPE->bBold=FALSE;
	TYPE->bItalic=FALSE;
	TYPE->bUnderline=TRUE;
	TYPE->bStrikeout=FALSE;
	m_richTestPreview.setColor(m_richTestPreview.m_colorTYPes,TYPE->clrColor,TYPE->bBold,TYPE->bItalic,TYPE->bUnderline,TYPE->bStrikeout);


	// identifiers
	IDENTIF->clrColor=RGB(123,112,230);
	IDENTIF->bBold=TRUE;
	IDENTIF->bItalic=TRUE;
	IDENTIF->bUnderline=FALSE;
	IDENTIF->bStrikeout=FALSE;
	m_richTestPreview.setColor(m_richTestPreview.m_colorIdentifiers,IDENTIF->clrColor,IDENTIF->bBold,IDENTIF->bItalic,IDENTIF->bUnderline,IDENTIF->bStrikeout);

	// numbers
	NBR->clrColor=RGB(255,0,255);
	NBR->bBold=FALSE;
	NBR->bItalic=FALSE;
	NBR->bUnderline=FALSE;
	NBR->bStrikeout=FALSE;
	m_richTestPreview.setColor(m_richTestPreview.m_colorNBR,NBR->clrColor,NBR->bBold,NBR->bItalic,NBR->bUnderline,NBR->bStrikeout);


	// comment
	COM->clrColor=RGB(192,192,192);
	COM->bBold=FALSE;
	COM->bItalic=FALSE;
	COM->bUnderline=FALSE;
	COM->bStrikeout=FALSE;
	m_richTestPreview.setColor(m_richTestPreview.m_colorCOMments,COM->clrColor,COM->bBold,COM->bItalic,COM->bUnderline,COM->bStrikeout);


	// errors
	ERRORS->clrColor=RGB(128,128,128);
	ERRORS->bBold=FALSE;
	ERRORS->bItalic=FALSE;
	ERRORS->bUnderline=FALSE;
	ERRORS->bStrikeout=TRUE;
	m_richTestPreview.setColor(m_richTestPreview.m_colorError,ERRORS->clrColor,ERRORS->bBold,ERRORS->bItalic,ERRORS->bUnderline,ERRORS->bStrikeout);


	// tree: select the first item
	m_tree.SelectItem(m_hItemOPE);
	m_dwTreeID = 0;
	// select the tree control
	GotoDlgCtrl( GetDlgItem(IDC_TREETestKeywrdExpl));


	// refresh the richeditctrl
	m_richTestPreview.setColor( m_richTestPreview.m_colorOPErators,
								OPE->clrColor,OPE->bBold,OPE->bItalic,
								OPE->bUnderline,OPE->bStrikeout );
	m_richTestPreview.FormatAll();


	// color button need to be refreshed
	m_buttonColorFont.currentcolor = RGB(255,0,0);
	RedrawWindow( NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW | RDW_ERASE );

	// check buttons need to be refreshed too
	CheckDlgButton( IDC_CHECKTestBold,OPE->bBold );
	CheckDlgButton( IDC_CHECKTestUnderline,OPE->bItalic );
	CheckDlgButton( IDC_CHECKTestItalic,OPE->bUnderline );
	CheckDlgButton( IDC_CHECKTestStrikeout,OPE->bStrikeout );
}


HTREEITEM CDlgEditTestColor::insertItem( CTreeCtrl* pTree,
						CString sTextItem,
						HTREEITEM hParent,
						HTREEITEM hInsertAfter,
						LPARAM lParam )
{

	TVITEM tvi;
	tvi.mask=TVIF_TEXT|TVIF_PARAM;
	tvi.hItem=hParent;
	tvi.pszText=(LPTSTR)(LPCTSTR)sTextItem;
	tvi.lParam=lParam;

	TVINSERTSTRUCT tvstruct;
	tvstruct.hParent=hParent;
	tvstruct.hInsertAfter=TVI_LAST;
	tvstruct.item=tvi;

	HTREEITEM hTreeItem=pTree->InsertItem( &tvstruct );

	return hTreeItem;
}

void CDlgEditTestColor::OnDestroy()
{
	CDialog::OnDestroy();

	delete OPE,FOROPE,LOC,
			KEYW,CONN,TYPE,IDENTIF,
			NBR,COM,ERRORS;
}
