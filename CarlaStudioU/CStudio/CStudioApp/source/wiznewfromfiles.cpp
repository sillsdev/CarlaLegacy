// WizNewFromFiles.cpp : DECLARE_DYNAMICation file
//
// 1.7a1 07-Dec-1999 hab Added interlinear and stamp dict code table processing
//                       Remove Ctrl-Ms from end of lines

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "WizNewFromFiles.h"

#include <strstrea.h>
#include <fstream.h>
#include "PathDescriptor.h"
#include  <io.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWizNewFromFiles

IMPLEMENT_DYNAMIC(CWizNewFromFiles, CPropertySheet)

CWizNewFromFiles::~CWizNewFromFiles()
{
}


BEGIN_MESSAGE_MAP(CWizNewFromFiles, CPropertySheet)
	//{{AFX_MSG_MAP(CWizNewFromFiles)
	ON_MESSAGE(DM_SETDEFID, OnSetDefID) // to change the default button
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWizNewFromFiles message handlers

CWizNewFromFiles::CWizNewFromFiles(CFileList* pRootFileList)
: CPropertySheet(IDS_FilesWizCaption),
	m_dictMethodPage(FALSE /*default to mixed*/, NULL, &m_dictAffixesPage),
	m_dictAffixesPage(_T("Setup Language - Step 6")),
	m_dictRootUnifiedPage(pRootFileList, FALSE, &m_dictAffixesPage, _T("Setup Language - Step 5"), _T("Setup Language - Step 5")),
	m_redundantFieldsNoticePage(IDD_PageRedundantFieldNotice)
{
	AddPage(&m_langDisplayPage);
	AddPage(&m_analysisPage);
	AddPage(&m_transferPage);
	AddPage(&m_synthPage);
	AddPage(&m_dictMethodPage);
	AddPage(&m_dictRootUnifiedPage);
	AddPage(&m_dictAffixesPage);
	AddPage(&m_redundantFieldsNoticePage);
	AddPage(&m_finishPage);
	m_analysisPage.m_pDictRootUnifiedPage = &m_dictRootUnifiedPage; // uses it when parsing .cmd file
	m_analysisPage.m_pDictAffixesPage = &m_dictAffixesPage; // uses it when parsing .cmd file

	SetWizardMode( );
	// this is only allowed inside a DoModal() (but there's no direct hook
	// that would allow us control once we call it; would have to get a call
	// from a property page....
	//			SetWizardButtons(PSWIZB_NEXT | PSWIZB_BACK | PSWIZB_FINISH);
}
int CWizNewFromFiles::DoModal()
{
	int x = CPropertySheet::DoModal();

	if(x == ID_WIZFINISH ) // !=IDCANCEL)
		x = IDOK;

	return x;
}


/////////////////////////////////////////////////////////////////////////////
// CPageNewFromFilesFinish property page

IMPLEMENT_DYNAMIC(CPageNewFromFilesFinish, CWizPage)

CPageNewFromFilesFinish::CPageNewFromFilesFinish() : CWizPage(CPageNewFromFilesFinish::IDD)
{
	//{{AFX_DATA_INIT(CPageNewFromFilesFinish)
	m_sFileList = _T("");
	m_sFolderPath = _T("");
	//}}AFX_DATA_INIT
}

CPageNewFromFilesFinish::~CPageNewFromFilesFinish()
{
}

void CPageNewFromFilesFinish::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageNewFromFilesFinish)
	DDX_Text(pDX, IDC_FolderPath, m_sFolderPath);
	//}}AFX_DATA_MAP

	DDX_Text(pDX, IDC_EDITFilesList, m_sFileList);
}


BEGIN_MESSAGE_MAP(CPageNewFromFilesFinish, CPropertyPage)
	//{{AFX_MSG_MAP(CPageNewFromFilesFinish)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageNewFromFilesFinish message handlers

void CPageNewFromFilesFinish::addLine(ostrstream& sout, CString sTitle, CString& sPath)
{
	USES_CONVERSION_U8;
	sout << T2CU8(sTitle);
	if(sPath.GetLength())
		sout << ": " << T2CA(sPath);
	else
		sout << ":  none";
	sout << "\r\n";
}

BOOL CPageNewFromFilesFinish::OnSetActive()
{
	CWizNewFromFiles* pWiz = (CWizNewFromFiles*) getOwner();
	pWiz->SetWizardButtons(PSWIZB_FINISH | PSWIZB_NEXT | PSWIZB_BACK);

	// to do: if we had access to the project path, we could give the
	// whole path here.  Better to make a static CCarlaLanguage method
	// that returns this path.

	m_sFolderPath.Format(_T("%s Control Files"), (LPCTSTR)pWiz->m_langDisplayPage.m_sAbrev);

	/*	ostrstream sout;
	CWizNewFromFiles* pWiz = (CWizNewFromFiles*)getOwner();
	addLine(sout, _T("Phonrule"), pWiz->m_analysisPage.m_sPhonrulePath);
	addLine(sout, _T("Dict Code Table"), pWiz->m_analysisPage.m_sCodeTablePath);
	addLine(sout, _T("TextIn"), pWiz->m_analysisPage.m_sTextInPath);
	addLine(sout, _T("Ortho Changes"), pWiz->m_analysisPage.m_sDictOrthoPath);
	addLine(sout, _T("Analysis Data Ctrl"), pWiz->m_analysisPage.m_sAnalysisPath);
	addLine(sout, _T("SENTRANS Disambig Rules"), pWiz->m_analysisPage.m_sSTDisambigPath);
	addLine(sout, _T("SENTRANS Glossing Rules"), pWiz->m_transferPage.m_sSTGlossingPath);
	addLine(sout, _T("STAMP Synthesis"), pWiz->m_synthPage.m_sStampSynth);
	addLine(sout, _T("STAMP Text-Out Control"), pWiz->m_synthPage.m_sTextOut);


	CString temp (sout.str(), sout.pcount());
	sout.rdbuf()->freeze(0); // else get a memory leak
	m_sFileList =  temp;
*/
	UpdateData(FALSE);	// copy it all to the dialog

	return CPropertyPage::OnSetActive();
}



// the user is backing up out of this page
// restore the Next button and remove the finish button
BOOL CPageNewFromFilesFinish::OnKillActive()
{
	getOwner()->SetWizardButtons(PSWIZB_NEXT | PSWIZB_BACK );

	return CPropertyPage::OnKillActive();
}
/////////////////////////////////////////////////////////////////////////////
// CPageAnalysisFiles property page

IMPLEMENT_DYNAMIC(CPageAnalysisFiles, CWizPage)

CPageAnalysisFiles::CPageAnalysisFiles() : CWizPage(CPageAnalysisFiles::IDD)
{
	m_pDictRootUnifiedPage = 0;
	m_pDictAffixesPage = 0;
	//{{AFX_DATA_INIT(CPageAnalysisFiles)
	m_sAnalysisPath = _T("");
	m_sPhonrulePath = _T("");
	m_sCodeTablePath = _T("");
#ifndef hab17a1
	m_sCodeTableItPath = _T("");
#endif // hab17a1
	m_sDictOrthoPath = _T("");
	m_sTextInPath = _T("");
	m_sSTDisambigPath = _T("");
	m_sCommentChar = _T("|");
	//}}AFX_DATA_INIT
}

CPageAnalysisFiles::~CPageAnalysisFiles()
{
}

void CPageAnalysisFiles::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageAnalysisFiles)
	DDX_Text(pDX, IDC_commentChar, m_sCommentChar);
	DDV_MaxChars(pDX, m_sCommentChar, 1);
	//}}AFX_DATA_MAP
	const int iPathLen = 34;
	// note, this only works one-way, but in a wizard the default
	// should be blank anyway
	DDX_Text(pDX, IDC_STATICCmd,  ::getTruncatedPath(m_sCmdPath, iPathLen));
	DDX_Text(pDX, IDC_STATICAnalysis, ::getTruncatedPath(m_sAnalysisPath, iPathLen));
	DDX_Text(pDX, IDC_STATICPhonrule, ::getTruncatedPath(m_sPhonrulePath, iPathLen));
	DDX_Text(pDX, IDC_STATICCodeTable, ::getTruncatedPath(m_sCodeTablePath, iPathLen));
#ifndef hab17a1
	DDX_Text(pDX, IDC_STATICCodeTableIt, ::getTruncatedPath(m_sCodeTableItPath, iPathLen));
#endif // hab17a1
	DDX_Text(pDX, IDC_STATICTextIn,  ::getTruncatedPath(m_sTextInPath, iPathLen));

	DDX_Text(pDX, IDC_STATICDictOrtho,  ::getTruncatedPath(m_sDictOrthoPath, iPathLen));

	DDX_Text(pDX, IDC_STDisambig,  ::getTruncatedPath(m_sSTDisambigPath, iPathLen));

	if(m_sCommentChar.IsEmpty())
		m_sCommentChar = _T("|");
#ifndef rde270
	// limit comment chars to ANSI range (it needs to be a 'char' for the processor)
	else if( pDX->m_bSaveAndValidate )
	{
		// make sure this resolves to a single UTF-8 byte (or we can't accept it).
		USES_CONVERSION_U8;
		LPCSTR pStr = T2CU8(m_sCommentChar);
		if( strlen(pStr) > 1 )
		{
			CString prompt;
			AfxFormatString1(prompt,IDS_MUST_BE_ANSI, _T("Comment Character"));
			AfxMessageBox(prompt, MB_ICONEXCLAMATION, AFX_IDP_PARSE_STRING_SIZE);
			prompt.Empty(); // exception prep
			pDX->Fail();
		}
	}
#endif  // rde270
}

BEGIN_MESSAGE_MAP(CPageAnalysisFiles, CPropertyPage)
	//{{AFX_MSG_MAP(CPageAnalysisFiles)
	ON_BN_CLICKED(IDC_BUTTONAnalysis, OnBUTTONAnalysis)
	ON_BN_CLICKED(IDC_BUTTONTextIn, OnBUTTONTextIn)
	ON_BN_CLICKED(IDC_BUTTONDictOrtho, OnBUTTONDictOrtho)
	ON_BN_CLICKED(IDC_BUTTONPhonrule, OnBUTTONPhonrule)
	ON_BN_CLICKED(IDC_BUTTONCodeTable, OnBUTTONCodeTable)
#ifndef hab17a1
	ON_BN_CLICKED(IDC_BUTTONCodeTableIt, OnBUTTONCodeTableIt)
#endif // hab17a1
	ON_BN_CLICKED(IDC_BUTTONSTDisambig, OnBUTTONSTDisambig)
	ON_BN_CLICKED(IDC_BUTTONCmd, OnBUTTONCmd)
//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageAnalysisFiles message handlers

void CPageAnalysisFiles::OnBUTTONAnalysis()
{
	handleFileButton(m_sAnalysisPath, _T("ctl"), _T("Analysis Control|*ad.ctl;*ad01.ctl|All Files|*.*||"));
}

void CPageAnalysisFiles::OnBUTTONTextIn()
{
	handleFileButton(m_sTextInPath, _T("ctl"), _T("TextIn (*intx.ctl)|*intx.ctl|All Files|*.*||") );
}

void CPageAnalysisFiles::OnBUTTONDictOrtho()
{
	handleFileButton(m_sDictOrthoPath, _T("tab"), _T("Source Ortho Change Table (*ordc.tab)|*ordc.tab|All Files (*.*)|*.*||"));
}

void CPageAnalysisFiles::OnBUTTONPhonrule()
{
	handleFileButton(m_sPhonrulePath, _T("rul"), _T("Phonrule Table (*.rul)|*.rul|All Files (*.*)|*.*||"));
}

void CPageAnalysisFiles::OnBUTTONCodeTable()
{
	handleFileButton(m_sCodeTablePath, _T("tab"), _T("Code Table (*cd.tab)|*cd.tab|All Files (*.*)|*.*||"));
}

#ifndef hab17a1
void CPageAnalysisFiles::OnBUTTONCodeTableIt()
{
	handleFileButton(m_sCodeTableItPath, _T("tab"), _T("Code Table (*cd.tab)|*cd.tab|All Files (*.*)|*.*||"));
}
#endif // hab17a1

void CPageAnalysisFiles::OnBUTTONSTDisambig()
{
	handleFileButton(m_sSTDisambigPath, _T("sen"), _T("SENTRANS (*.sen)|*.sen|All Files (*.*)|*.*||") );
}

void CPageAnalysisFiles::checkStatus()
{
	if (!m_sTextInPath.GetLength() ||
		!m_sAnalysisPath.GetLength() ||
		!m_sCodeTablePath.GetLength()
		)
		getOwner()->SetWizardButtons(PSWIZB_BACK);
	else
		getOwner()->SetWizardButtons(PSWIZB_NEXT | PSWIZB_BACK); // "  "  "
}
#ifdef nono
/////////////////////////////////////////////////////////////////////////////
// CPageDictionaries property page
/*
/*IMPLEMENT_DYNAMIC(CPageDictionaries, CWizPage)

CPageDictionaries::CPageDictionaries(LPCTSTR lpszTitle, CFileList* pRootFileList, BOOL bCanCopyToCtrlDir)
:	m_bCanCopyToCtrlDir(bCanCopyToCtrlDir),
	m_sTitle(lpszTitle),
	CWizPage(CPageDictionaries::IDD),
	m_fileListCtrl(pRootFileList, ".dic", IDS_Filter_Dictionary)
{
	m_psp.pszTitle = LPCTSTR(m_sTitle);
	m_psp.dwFlags |= PSP_USETITLE;
	m_psp.dwFlags &= ~PSP_HASHELP;  no help yet

	{{AFX_DATA_INIT(CPageDictionaries)
	m_sInfixPath = _T("");
	m_sPrefixPath = _T("");
	m_sSuffixPath = _T("");
	m_bCopyDicts = FALSE;
	}}AFX_DATA_INIT
}

CPageDictionaries::~CPageDictionaries()
{
}

void CPageDictionaries::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	{{AFX_DATA_MAP(CPageDictionaries)
	DDX_Control(pDX, IDC_BTNSuffix, m_btnAddSuffix);
	DDX_Control(pDX, IDC_BTNInfix, m_btnAddInfix);
	DDX_Control(pDX, IDC_BTNPrefix, m_btnAddPrefix);
	DDX_Control(pDX, IDC_RootDicts, m_fileListCtrl);
	DDX_Control(pDX, IDC_BtnRemove, m_btnRemoveRoot);
	DDX_Control(pDX, IDC_BtnAddRoot, m_btnAddRoot);
	}}AFX_DATA_MAP

	 when loading the dialog
	if(!pDX->m_bSaveAndValidate )
	{
/*		if(!m_bCanCopyToCtrlDir)
		{
			CWnd *pWnd = GetDlgItem(IDC_CopyDicts);
			pWnd->ModifyStyle(WS_VISIBLE, NULL); WS_DISABLED);
			pWnd->Invalidate();
			pWnd = GetDlgItem(IDC_StaticCopyNotice);
			pWnd->ModifyStyle(WS_VISIBLE, NULL); WS_DISABLED);
			pWnd->Invalidate();

			 show the "must be in same dir" notice
			pWnd = GetDlgItem(IDC_StaticSameDirNotice);
			pWnd->ModifyStyle( NULL, WS_VISIBLE);
			pWnd->Invalidate();

		}
*/

	 note, this only works one-way, but in a wizard the default
	 was blank anyway
		const int iPathLen = 30;
		DDX_Text(pDX, IDC_Infix, ::getTruncatedPath(m_sInfixPath, iPathLen));
		DDX_Text(pDX, IDC_Prefix, ::getTruncatedPath(m_sPrefixPath, iPathLen));
		DDX_Text(pDX, IDC_Root1, ::getTruncatedPath(m_sRoot1Path, iPathLen));
		DDX_Text(pDX, IDC_Root2, ::getTruncatedPath(m_sRoot2Path, iPathLen));
		DDX_Text(pDX, IDC_Root3, ::getTruncatedPath(m_sRoot3Path, iPathLen));
		DDX_Text(pDX, IDC_Root4, ::getTruncatedPath(m_sRoot4Path, iPathLen));
		DDX_Text(pDX, IDC_Root5, ::getTruncatedPath(m_sRoot5Path, iPathLen));
		DDX_Text(pDX, IDC_Suffix, ::getTruncatedPath(m_sSuffixPath, iPathLen));
	}
}

void CPageDictionaries::checkStatus()
{
		if (m_fileListCtrl.isEmpty()) !m_sRoot1Path.GetLength())
  getOwner()->SetWizardButtons(PSWIZB_BACK);	// PSWIZB_BACK should be removed once all other pages have their own classes <-- huh?
		else
			getOwner()->SetWizardButtons(PSWIZB_NEXT | PSWIZB_BACK);
}

BEGIN_MESSAGE_MAP(CPageDictionaries, CPropertyPage)
	{{AFX_MSG_MAP(CPageDictionaries)
	ON_BN_CLICKED(IDC_BTNInfix, OnBTNInfix)
	ON_BN_CLICKED(IDC_BTNPrefix, OnBTNPrefix)
	ON_BN_CLICKED(IDC_BTNSuffix, OnBTNSuffix)
	ON_BN_CLICKED(IDC_BtnRemove, OnBtnRemoveRoot)
	ON_BN_CLICKED(IDC_BtnAddRoot, OnBtnAddRoot)
	ON_NOTIFY_EX( TTN_NEEDTEXT, 0, OnToolTip )
	}}AFX_MSG_MAP
END_MESSAGE_MAP()


void CPageDictionaries::OnBtnRemoveRoot()
{
	m_fileListCtrl.OnRemoveButton();
	checkStatus();
}

void CPageDictionaries::OnBtnAddRoot()
{
	m_fileListCtrl.OnAddButton();
	checkStatus();
}

BOOL CPageDictionaries::OnInitDialog()
{
	CPropertyPage::OnInitDialog();

	//m_fileListCtrl.SubclassDlgItem (IDC_FileList, this);
	m_fileListCtrl.populate();


	m_btnAddPrefix.SetBitmap(IDB_AddFile);
	m_btnAddSuffix.SetBitmap(IDB_AddFile);
	m_btnAddInfix.SetBitmap(IDB_AddFile);
	m_btnRemoveRoot.SetBitmap(IDB_Delete);
	m_btnAddRoot.SetBitmap(IDB_AddFile);


	EnableToolTips(TRUE);

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

BOOL CPageDictionaries::OnToolTip(UINT id, NMHDR *pTTTStruct, LRESULT *pResult)
{
	TOOLTIPTEXT *pTTT = (TOOLTIPTEXT *)pTTTStruct;
	UINT nID =pTTTStruct->idFrom;
	if (pTTT->uFlags & TTF_IDISHWND)
	{
		// idFrom is actually the HWND of the tool
		nID = ::GetDlgCtrlID((HWND)nID);


		// don't want a seperate string rsrc for every add buttton
		if(nID == IDC_BTNPrefix
			|| nID == IDC_BTNSuffix
			|| nID == IDC_BTNInfix
			|| nID == IDC_BtnAddRoot)
			nID = IDS_TTAddFile;

		if(nID)
		{
			pTTT->lpszText = MAKEINTRESOURCE(nID);	// assumes the id has a string id
			pTTT->hinst = AfxGetResourceHandle();
			return(TRUE);
		}
	}
	return(FALSE);
}

void CPageDictionaries::OnOK()
{
	m_fileListCtrl.OnOK();

	CPropertyPage::OnOK();
	unified
}



// called by the analysis page when it reads a .cmd file
void CPageDictionaries::addRootDictPathD(CPathDescriptor *pd)
{
	m_fileListCtrl.addFilePathD(pd);
}


void CPageDictionaries::OnBTNInfix()
{
	handleFileButton(m_sInfixPath, _T("dic"), _T("Infix Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||"));
}

void CPageDictionaries::OnBTNPrefix()
{
	handleFileButton(m_sPrefixPath, _T("dic"), _T("Prefix Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||"));
}

/*void CPageDictionaries::OnBTNRoot1()
{
	handleFileButton(m_sRoot1Path, _T("dic"), _T("Root Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||"));
}

void CPageDictionaries::OnBTNRoot2()
{
	handleFileButton(m_sRoot2Path, _T("dic"), _T("Root Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||"));
}

void CPageDictionaries::OnBTNRoot3()
{
	handleFileButton(m_sRoot3Path, _T("dic"), _T("Root Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||"));
}

void CPageDictionaries::OnBTNRoot4()
{
	handleFileButton(m_sRoot4Path, _T("dic"), _T("Root Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||"));
}

void CPageDictionaries::OnBTNRoot5()
{
	handleFileButton(m_sRoot5Path, _T("dic"), _T("Root Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||"));
}
*/

void CPageDictionaries::OnBTNSuffix()
{
	handleFileButton(m_sSuffixPath, _T("dic"), _T("Suffic Dictionary (*.dic; *.db)|*.dic; *.db|All Files (*.*)|*.*||"));
}

#endif

/////////////////////////////////////////////////////////////////////////////
// CPageFilesTransfer dialog


CPageFilesTransfer::CPageFilesTransfer(CWnd* pParent /*=NULL*/)
	: CWizPage(CPageFilesTransfer::IDD)
{
	//{{AFX_DATA_INIT(CPageFilesTransfer)
	m_sSTGlossingPath = _T("");
	//}}AFX_DATA_INIT
}


void CPageFilesTransfer::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageFilesTransfer)
	//}}AFX_DATA_MAP
	// note, this only works one-way, but in a wizard the default
	// was blank anyway
	const int iPathLen = 55;
	DDX_Text(pDX, IDC_STGlossing, ::getTruncatedPath(m_sSTGlossingPath, iPathLen));
}


BEGIN_MESSAGE_MAP(CPageFilesTransfer, CWizPage)
	//{{AFX_MSG_MAP(CPageFilesTransfer)
	ON_BN_CLICKED(IDC_btnSTGlossing, OnbtnSTGlossing)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageFilesTransfer message handlers

void CPageFilesTransfer::OnbtnSTGlossing()
{
	handleFileButton(m_sSTGlossingPath, _T("sen"), _T("SENTRANS Glossing Control File (*.sen)|*.sen|All Files (*.*)|*.*||"));
}


/////////////////////////////////////////////////////////////////////////////
// CPageFilesSynth dialog


CPageFilesSynth::CPageFilesSynth(CWnd* pParent /*=NULL*/)
	: CWizPage(CPageFilesSynth::IDD)
{
	//{{AFX_DATA_INIT(CPageFilesSynth)
	m_sStampSynth = _T("");
	m_sTextOut = _T("");
	m_sCodeTableStampPath = _T("");
	//}}AFX_DATA_INIT
}


void CPageFilesSynth::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageFilesSynth)
	//}}AFX_DATA_MAP
	// note, this only works one-way, but in a wizard the default
	// was blank anyway
	const int iPathLen = 24;
	DDX_Text(pDX, IDC_STAMPSynth, ::getTruncatedPath(m_sStampSynth, iPathLen));
	DDX_Text(pDX, IDC_TextOut, ::getTruncatedPath(m_sTextOut, iPathLen));
	DDX_Text(pDX, IDC_StampDictCode, ::getTruncatedPath(m_sCodeTableStampPath, iPathLen));
}


BEGIN_MESSAGE_MAP(CPageFilesSynth, CDialog)
	//{{AFX_MSG_MAP(CPageFilesSynth)
	ON_BN_CLICKED(IDC_btnSTAMPSynth, OnbtnSTAMPSynth)
	ON_BN_CLICKED(IDC_btnTextOut, OnbtnTextOut)
	ON_BN_CLICKED(IDC_btnStampDictCode, OnbtnCodeTableStamp)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageFilesSynth message handlers

void CPageFilesSynth::OnbtnSTAMPSynth()
{
	handleFileButton(m_sStampSynth, _T("chg"), _T("Stamp Synthesis Control File (*.chg)|*.chg|All Files (*.*)|*.*||"));
}

void CPageFilesSynth::OnbtnTextOut()
{
	handleFileButton(m_sTextOut, _T("ctl"), _T("Text Out Control File (*.ctl)|*.ctl|All Files (*.*)|*.*||"));
}

#ifndef hab17a1
void CPageFilesSynth::OnbtnCodeTableStamp()
{
	handleFileButton(m_sCodeTableStampPath, _T("tab"), _T("Code Table (*cd.tab)|*cd.tab|All Files (*.*)|*.*||"));
}
#endif // hab17a1

//sFile can be either a file name or a path
static CString getFilePath(CString sDefaultDir, CString sFile)
{
	CString s;
	if(-1 == sFile.Find(_T("\\")))
		s =  sDefaultDir+sFile;
	else
		s = sFile;

//	if (_access(s, 00) != 0)
//		s = _T("Not Found");

	return s;
}

void CPageAnalysisFiles::OnBUTTONCmd()
{
	handleFileButton(m_sCmdPath, _T("cmd"), _T("Ample CMD File(*.cmd)|*.cmd|All Files (*.*)|*.*||"));

	if(!m_sCmdPath.GetLength())	// cancelled
		return;

	CString sDir = getDirectory(m_sCmdPath);

	// parse the cmd file
	USES_CONVERSION;
	ifstream fin(T2CA(m_sCmdPath), ios::in | ios::nocreate);
	char lpsz[MAX_PATH];
	fin.getline(lpsz, MAX_PATH);
	m_sAnalysisPath = getFilePath(sDir, A2CT(lpsz));

	fin.getline(lpsz, MAX_PATH);
	m_sCodeTablePath = getFilePath(sDir, A2CT(lpsz));

	fin.getline(lpsz, MAX_PATH);
	if(strlen(lpsz))
		m_sDictOrthoPath = getFilePath(sDir, A2CT(lpsz));

	//----- start getting the dictionary files
	// these may be file names or full paths

	fin.getline(lpsz, MAX_PATH);
	CString sDict = A2CT(lpsz);

	BOOL bHaveAffixDicts=FALSE;

	if(-1 != sDict.Find(_T("pf")))
	{
		bHaveAffixDicts=TRUE;	// not using unified mode
		if(m_pDictAffixesPage)
				m_pDictAffixesPage->m_sPrefixPath = getFilePath(sDir, sDict);
		fin.getline(lpsz, MAX_PATH);
		sDict = A2CT(lpsz);
	}
	if(-1 != sDict.Find(_T("if")))
	{
		bHaveAffixDicts=TRUE;	// not using unified mode
		if(m_pDictAffixesPage)
				m_pDictAffixesPage->m_sInfixPath = getFilePath(sDir, sDict);
		fin.getline(lpsz, MAX_PATH);
		sDict = A2CT(lpsz);
	}
	if(-1 != sDict.Find(_T("sf")))
	{
		bHaveAffixDicts=TRUE;	// not using unified mode
		if(m_pDictAffixesPage)
				m_pDictAffixesPage->m_sSuffixPath = getFilePath(sDir, sDict);
		fin.getline(lpsz, MAX_PATH);
		sDict = A2CT(lpsz);
	}
	while(sDict.GetLength())
	{
		if(m_pDictRootUnifiedPage)
			m_pDictRootUnifiedPage->addRootDictPathD(new CPathDescriptor(getFilePath(sDir, sDict)));
		fin.getline(lpsz, MAX_PATH);
		sDict = A2CT(lpsz);
	}

	// we have, supposedly, figured out whether they are using unified dicts or not
	m_pDictRootUnifiedPage->setModeAndManageAffixPage(getOwner(), !bHaveAffixDicts);

	// skip the blank line, if there is one. Note that if we have too many dicts, this will not help
	fin.getline(lpsz, MAX_PATH);
	CString sTextIn = A2CT(lpsz);

	if(sTextIn.GetLength())
	{
		fin.getline(lpsz, MAX_PATH);
		m_sTextInPath = getFilePath(sDir, sTextIn);
	}

	checkStatus();
	UpdateData(FALSE);
}
/*	DDX_Text(pDX, IDC_STATICCmd,  ::getTruncatedPath(m_sCmdPath, iPathLen));
	DDX_Text(pDX, IDC_STATICAnalysis, ::getTruncatedPath(m_sAnalysisPath, iPathLen));
	DDX_Text(pDX, IDC_STATICPhonrule, ::getTruncatedPath(m_sPhonrulePath, iPathLen));
	DDX_Text(pDX, IDC_STATICCodeTable, ::getTruncatedPath(m_sCodeTablePath, iPathLen));
	DDX_Text(pDX, IDC_STATICTextIn,  ::getTruncatedPath(m_sTextInPath, iPathLen));

	DDX_Text(pDX, IDC_STATICDictOrtho,  ::getTruncatedPath(m_sDictOrthoPath, iPathLen));

	fout  <<
	fout <<   pSourceMFS->getCtrlFilePath("cd.tab") << "\n";
	if(status.getInputLang()->getUsingDictOrtho() )
		fout  << pSourceMFS->getCtrlFilePath("ordc.tab") << "\n";
	else
		fout << "\n";

	// note that these lines must appear based on whether ample is expecting
	// them, and thus expecting a line giving a name or a simple carriage return.
	// ample decides whether to ask for each type based on the maximums for each type
	if(!status.getInputLang()->getUsingUnifiedDicts())
	{
		if(status.getInputLang()->getHavePrefixes())
		fout <<	pSourceMFS->getDictFilesDirectory()   << pSourceMFS->getPrefixDictName() << "\n";

		if(status.getInputLang()->getHaveInfixes())
			fout <<	pSourceMFS->getDictFilesDirectory()  << pSourceMFS->getInfixDictName() << "\n";

		if(status.getInputLang()->getHaveSuffixes())
			fout <<	pSourceMFS->getDictFilesDirectory() << pSourceMFS->getSuffixDictName() << "\n";

	}
	// do this next whether we have unified or not, since they're all store in the same array
	for( int i=0; i< pSourceMFS->getRootDictCount(); i++)
		fout << pSourceMFS->getRootDictShortPath(i) << "\n";

	fout << "\n";	// empty line means "no more dictionaries"
	fout <<  pSourceMFS->getCtrlFilesDirectory()  << pSourceMFS->getIntxFileFullName() <<"\n";
	fout << "y\ny\n";
*/
// from www.codegure.com by Chris Green.

LRESULT CWizNewFromFiles::OnSetDefID(WPARAM wParam, LPARAM lParam)
{
//	ASSERT(FALSE); // NEVER CALLED.  Sigh....
	//int nIDOldDef = LOWORD(DefWindowProc(DM_GETDEFID, wParam, lParam));
	switch (GetActiveIndex())
	{   case 1:
		return DefWindowProc(DM_SETDEFID, IDOK, lParam);
		break;
	}
	return Default();
}
