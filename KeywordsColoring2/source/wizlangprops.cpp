// WizLangProps.cpp : implementation file
//
// 1.5a5 24-Sep-1999 hab allow user the ability to show properties in language font
// 1.5a7 20-Oct-1999 hab allow user the ability to show user tests, string and morpheme class names in language font
// jdh 11/11/99 Fix for Korean Windows

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "WizLangProps.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWizLanguageProperties

//IMPLEMENT_DYNAMIC(CWizLanguageProperties, CPropertySheet)

/*CWizLanguageProperties::CWizLanguageProperties(UINT nIDCaption, CWnd* pParentWnd, UINT iSelectPage)
	:CPropertySheet(nIDCaption, pParentWnd, iSelectPage)
{
}

CWizLanguageProperties::CWizLanguageProperties(LPCTSTR pszCaption, CWnd* pParentWnd, UINT iSelectPage)
	:CPropertySheet(pszCaption, pParentWnd, iSelectPage)
{
}
*/
//	Parameters:	bProjectCreation should be FALSE if the project already exists and the user is just
//						changing some paramters using this wizard

/*CWizLanguageProperties::CWizLanguageProperties(BOOL bProjectCreation)
: CPropertySheet(IDS_SetupWizCaption),	// caption seems to be overriden by caption pages
	m_namesPage(),
	m_testsPage(IDD_WizSetupTests),
	m_orderclassPage(IDD_WizSetupOrderclass),
	m_finishPage(bProjectCreation)
{
//	m_namesPage.setOwner(this);
//	m_finishPage.setOwner(this);
	AddPage(&m_namesPage);
	AddPage(&m_testsPage);
	AddPage(&m_orderclassPage);
	if(bProjectCreation)
	{	AddPage(&m_finishPage);
		SetWizardMode( );
	}
}
CWizLanguageProperties::~CWizLanguageProperties()
{
}


BEGIN_MESSAGE_MAP(CWizLanguageProperties, CPropertySheet)
	//{{AFX_MSG_MAP(CWizLanguageProperties)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWizLanguageProperties message handlers



int CWizLanguageProperties::DoModal()
{
	int x = CPropertySheet::DoModal();

	// there's something I don't understand about wizards; DoModal is supposed
	// to return only IDCancel or IDOK.  However, when the user clicks on
	// the FINISH button, I'm getting something like 1235.  So this hack
	// patches the problem

	if(x != IDCANCEL)
		x = IDOK;

	return x;
}
*/

/////////////////////////////////////////////////////////////////////////////
// CPageLangSetupFinish property page

//IMPLEMENT_DYNCREATE(CPageLangSetupFinish, CPropertyPage)

CPageLangSetupFinish::CPageLangSetupFinish(BOOL bProjectCreation) : CWizPage(CPageLangSetupFinish::IDD)
{
/*	if(bProjectCreation)
		m_sMsg = _T("That's all we need to know to get started.  You can change any of these settings by at any time.  Just choose Project Settings from the Settings menu.");
	else
		m_sMsg = _T("Press Finish to make any changes take effect.");

*/
// THIS IS NOT NEEDED ANYMORE, SINCE WE DON'T SHOW THE FINISH PAGE EXCEPT ON CREATION, WHEN IT IS A WIZARD

//{{AFX_DATA_INIT(CPageLangSetupFinish)
		m_sMsg = _T("That's all we need to know to get started.  You can change any of these settings by at any time.  Just choose ProjectSettings from the File menu.");
//}}AFX_DATA_INIT
}

CPageLangSetupFinish::~CPageLangSetupFinish()
{
}

void CPageLangSetupFinish::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageLangSetupFinish)
	DDX_Text(pDX, IDC_STATICMsg, m_sMsg);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPageLangSetupFinish, CPropertyPage)
	//{{AFX_MSG_MAP(CPageLangSetupFinish)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageLangSetupFinish message handlers

BOOL CPageLangSetupFinish::OnSetActive()
{
	ASSERTX(getOwner());
	getOwner()->SetWizardButtons(PSWIZB_FINISH | PSWIZB_NEXT | PSWIZB_BACK);

	return CPropertyPage::OnSetActive();
}

BOOL CPageLangSetupFinish::OnKillActive()
{
	ASSERTX(getOwner());
	getOwner()->SetWizardButtons(PSWIZB_NEXT | PSWIZB_BACK );

	return CPropertyPage::OnKillActive();
}
/////////////////////////////////////////////////////////////////////////////
// CPageLangDisplay property page

IMPLEMENT_DYNCREATE(CPageLangDisplay, CWizPage)

CPageLangDisplay::CPageLangDisplay(LPCTSTR lpszTitle, BOOL bAbrevIsReadOnly)
: m_sTitle(lpszTitle),
 m_bAbrevIsReadOnly(bAbrevIsReadOnly),
 CWizPage(CPageLangDisplay::IDD)
{
	if(lpszTitle)
	{
		m_sTitle = lpszTitle;
		m_psp.pszTitle = LPCTSTR(m_sTitle);
		m_psp.dwFlags |= PSP_USETITLE;
	}
//	m_psp.dwFlags &= ~PSP_HASHELP; // no help yet

	//{{AFX_DATA_INIT(CPageLangDisplay)
	m_sAbrev = _T("");
	m_sName = _T("");
	m_sFontDescription = _T("");
	m_bShowMorphnamesInLangFont = FALSE;
	m_bShowCommentsInLangFont = FALSE;

#ifndef hab15a5
	m_bShowPropertiesInLangFont = FALSE;
#endif // hab15a5
#ifndef hab15a7
	m_bShowStringClassesInLangFont = FALSE;
	m_bShowMorphemeClassesInLangFont = FALSE;
	m_bShowUserTestsInLangFont = FALSE;
#endif // hab15a7
	m_bDisableFontAssociation = FALSE;
	m_bLocateTransferWithTarget = FALSE;
	//}}AFX_DATA_INIT

	// caller might set this to, but we need to setup a default
	// in case it doesn't

	CFont* pFont = CFont::FromHandle( (HFONT) GetStockObject(ANSI_FIXED_FONT));
	pFont->GetLogFont(&m_logFont);
}

CPageLangDisplay::~CPageLangDisplay()
{
}

void CPageLangDisplay::checkStatus()
{
	UpdateData(TRUE);
	if(getOwner())	// THIS DOESN'T HELP WHEN WE'RE NOT IN A WIZARD.  RELYING ON THE DDX CHECK BELOW FOR NOW...
	{
		if (m_sAbrev.GetLength()  && m_sName.GetLength())
			getOwner()->SetWizardButtons(PSWIZB_NEXT );	// this is first, so no "back"
		else
			getOwner()->SetWizardButtons(NULL );
	}
}

void CPageLangDisplay::DoDataExchange(CDataExchange* pDX)
{
	m_sFontDescription = m_logFont.lfFaceName;
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageLangDisplay)
	DDX_Control(pDX, IDC_StaticFont, m_StaticFontCtrl);
	DDX_Text(pDX, IDC_EDITAbrev, m_sAbrev);
	DDV_MaxChars(pDX, m_sAbrev, 3);
	DDX_Text(pDX, IDC_EDITName, m_sName);
	DDX_Text(pDX, IDC_StaticFont, m_sFontDescription);
	DDX_Check(pDX, IDC_MorphnamesInLangFont, m_bShowMorphnamesInLangFont);
	DDX_Check(pDX, IDC_CommentsInLangFont, m_bShowCommentsInLangFont);
#ifndef hab15a5
	DDX_Check(pDX, IDC_PropertiesInLangFont, m_bShowPropertiesInLangFont);
#endif //hab15a5
#ifndef hab15a7
	DDX_Check(pDX, IDC_StringClassInLangFont, m_bShowStringClassesInLangFont);
	DDX_Check(pDX, IDC_MorphemeClassInLangFont, m_bShowMorphemeClassesInLangFont);
	DDX_Check(pDX, IDC_TestContentsInLangFont, m_bShowUserTestsInLangFont);
#endif //hab15a7
	DDX_Check(pDX, IDC_DisableFontAssociation, m_bDisableFontAssociation);
	DDX_Check(pDX, IDC_ShowFromTransfer, m_bLocateTransferWithTarget);
	//}}AFX_DATA_MAP


/*	this got called all the time, before the user had a chance
	if(	pDX->m_bSaveAndValidate
		&& !(m_sAbrev.GetLength()  && m_sName.GetLength()))
	{
		AfxMessageBox ("Please enter something in the name and abreviation boxes");
		pDX->Fail();
	}
*/
}


BEGIN_MESSAGE_MAP(CPageLangDisplay, CPropertyPage)
	//{{AFX_MSG_MAP(CPageLangDisplay)
	ON_BN_CLICKED(IDC_BUTTONFont, OnBUTTONFont)
	ON_EN_CHANGE(IDC_EDITAbrev, OnChangeEDITAbrev)
	ON_EN_CHANGE(IDC_EDITName, OnChangeEDITName)
	ON_WM_CREATE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageLangDisplay message handlers

/*class CFixedFontDialog: public CFontDialog
{
	public: CFixedFontDialog(LPLOGFONT lplfInitial, DWORD dwFlags, CDC* pdcPrinter,
	CWnd* pParentWnd);

			void GetCurrentFont(LPLOGFONT lplf);
};



CFixedFontDialog::CFixedFontDialog(LPLOGFONT lplfInitial, DWORD dwFlags, CDC* pdcPrinter,
	CWnd* pParentWnd) : CFontDialog(lplfInitial, dwFlags,pdcPrinter,pParentWnd)
{}


void CFixedFontDialog::GetCurrentFont(LPLOGFONT lplf)
{
	// this is the fix, commenting this out:	ASSERTX(m_hWnd != NULL);
	ASSERTX(lplf != NULL);

	if (m_hWnd != NULL)
		SendMessage(WM_CHOOSEFONT_GETLOGFONT, 0, (DWORD)(LPVOID)lplf);
	else
		*lplf = m_lf;
}
*/
void CPageLangDisplay::OnBUTTONFont()
{
	CFontDialog dlg( &m_logFont, //LPLOGFONT lplfInitial = NULL,
					 CF_BOTH, //DWORD dwFlags = CF_EFFECTS | CF_SCREENFONTS,
					 NULL, // CDC* pdcPrinter = NULL,
					 NULL); // CWnd* pParentWnd = NULL );
	if( IDOK ==	dlg.DoModal())
	{
		m_sFontDescription = dlg.GetFaceName();
		dlg.GetCurrentFont( &m_logFont);

		// can't do an updateData(FALSE), because that would replace the old
		// value of the name and abbreviation.
		// so we have to put in the text directly
		m_StaticFontCtrl.SetWindowText(m_sFontDescription);
	}
}

void CPageLangDisplay::OnChangeEDITAbrev()
{
	checkStatus();	// must have something in this field
}

void CPageLangDisplay::OnChangeEDITName()
{
	checkStatus();	// must have something in this field
}

BOOL CPageLangDisplay::OnInitDialog()
{
	// if we're not in a wizard, we want the abrev box uneditable
	// However, I can't get it to display correctly, even with this
	// code; it always looks editable.  I've also tried doing this
	// at ddx time, no difference, and tried with WS_DISABLED.
	//
	// Also tried putting this in OnCreate, but I couldn't get a
	// handle to the CEDit at that time

	CPropertyPage::OnInitDialog();

	if(m_bAbrevIsReadOnly)
	{
			CWnd *pWnd = GetDlgItem(IDC_EDITAbrev);
			::SendMessage(pWnd->m_hWnd, EM_SETREADONLY, (WPARAM)TRUE, 0);

	//		pWnd->ModifyStyle(NULL ,  ES_READONLY);
			pWnd->Invalidate();
			pWnd->GetParent()->Invalidate();
			Invalidate();
	}
	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}


BOOL CPageLangDisplay::OnApply()
{
	if(!(m_sAbrev.GetLength()  && m_sName.GetLength()))
	{
		AfxMessageBox ("Please enter something in the name and abreviation boxes");
		return FALSE;
	}
	else
		return CPropertyPage::OnApply();
}
