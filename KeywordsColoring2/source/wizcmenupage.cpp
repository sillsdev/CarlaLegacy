// WizCMenuPage.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "WizCMenuPage.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#include "WizNewFromCarla.h"
#include "ProjectDoc.h"

/////////////////////////////////////////////////////////////////////////////
// CPageCMenu dialog

// before we can move to the next page, we need to load in the carla.set
// file and make sure we read it ok, so that the names page can be
// partially filled in
LRESULT CPageCMenu::OnWizardNext()
{
	CWizNewFromCarla* pWiz = (CWizNewFromCarla*)getOwner();
	CString sSrcAbrev, sTarAbrev;
	if(pWiz->m_pProjectDoc->readCarlaMenuSettings(m_sCMenuSetPath, sSrcAbrev, sTarAbrev, m_cCommentChar))
	{
		// kind of a hack, letting this page know about the next page
		pWiz->m_srcLangDisplayPage.m_sAbrev = sSrcAbrev;
		if(!sTarAbrev.GetLength()) // no target lang found in the carla.set
		{
			pWiz->RemovePage(&pWiz->m_tarLangDisplayPage);
		}
		else
		{
			pWiz->m_tarLangDisplayPage.m_sAbrev = sTarAbrev;
		}
		return 0;
	}
	else
		return -1; // prevent moving forward
}

CPageCMenu::CPageCMenu(CWnd* pParent /*=NULL*/)
	: CWizPage(CPageCMenu::IDD),
	m_cCommentChar('|')	// cmenu has one comment char for both languages
{
	//{{AFX_DATA_INIT(CPageCMenu)
	m_sCMenuSetPath = _T("");
	//}}AFX_DATA_INIT
}

void CPageCMenu::checkStatus()
{
	if(m_sCMenuSetPath.GetLength())
		getOwner()->SetWizardButtons(PSWIZB_NEXT );
	else
		getOwner()->SetWizardButtons(NULL);
}

void CPageCMenu::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageCMenu)
	DDX_Text(pDX, IDC_CarlaSetPath, m_sCMenuSetPath);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPageCMenu, CDialog)
	//{{AFX_MSG_MAP(CPageCMenu)
	ON_BN_CLICKED(IDC_BTNCarlaSetPath, OnBTNCarlaSetPath)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageCMenu message handlers

void CPageCMenu::OnBTNCarlaSetPath()
{
	handleFileButton(m_sCMenuSetPath, "set", "Carla Menu (CARLA.SET)|CARLA.SET|Carla Menu (*.SET)|*.SET|");
}
