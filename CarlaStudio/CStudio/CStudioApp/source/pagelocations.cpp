// CPageLocations.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "PageLocations.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageLocations property page

IMPLEMENT_DYNAMIC(CPageLocations, CPropertyPage)

CPageLocations::CPageLocations(const CPathDescriptor& pathAnalyzedANA,
							   const CPathDescriptor& pathInterlinear,
							   const CPathDescriptor& pathTransferedANA,
							   const CPathDescriptor& pathSynthesized,
							   const CPathDescriptor& pathDefaultInput)
								//BOOL bCopyInterlinearToSrcDir)
: CPropertyPage(CPageLocations::IDD),
m_pathAnalyzedANA(pathAnalyzedANA, "","",IDB_ChooseFolder, IDS_SelectFolderPrompt, IDS_MSGCancelMeansDefault,  _T("DEFAULT"),CPathCtrl::kSelectFolder),
m_pathInterlinear(pathInterlinear, "","",IDB_ChooseFolder, IDS_SelectFolderPrompt, IDS_MSGCancelMeansDefault,  _T("DEFAULT"),CPathCtrl::kSelectFolder),
m_pathTransferedANA(pathTransferedANA, "","",IDB_ChooseFolder, IDS_SelectFolderPrompt, IDS_MSGCancelMeansDefault,  _T("DEFAULT"),CPathCtrl::kSelectFolder),
m_pathSynthesized(pathSynthesized, "","",IDB_ChooseFolder, IDS_SelectFolderPrompt, IDS_MSGCancelMeansDefault,  _T("DEFAULT"),CPathCtrl::kSelectFolder)
{

	//{{AFX_DATA_INIT(CPageLocations)
//	m_bCopyInterlinearToSrcDir = bCopyInterlinearToSrcDir;
//	m_bLeaveNonGoalsInTempDir = FALSE;
	//}}AFX_DATA_INIT
}


CPageLocations::~CPageLocations()
{
}

void CPageLocations::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageLocations)
	DDX_Control(pDX, IDC_TransferedANA, m_pathTransferedANA);
	DDX_Control(pDX, IDC_Synthesized, m_pathSynthesized);
	DDX_Control(pDX, IDC_AnalyzedANA, m_pathAnalyzedANA);
	DDX_Control(pDX, IDC_Interlinear, m_pathInterlinear);
//	DDX_Check(pDX, IDC_CopyInterlinearToSrcDir, m_bCopyInterlinearToSrcDir);
//	DDX_Check(pDX, IDC_LeaveNonGoalsInTemp, m_bLeaveNonGoalsInTempDir);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPageLocations, CPropertyPage)
	//{{AFX_MSG_MAP(CPageLocations)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CPageLocations message handlers

BOOL CPageLocations::OnInitDialog()
{
	CPropertyPage::OnInitDialog();

	EnableToolTips(TRUE);

	m_pathInterlinear.init();
	m_pathAnalyzedANA.init();
	m_pathTransferedANA.init();
	m_pathSynthesized.init();

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}
