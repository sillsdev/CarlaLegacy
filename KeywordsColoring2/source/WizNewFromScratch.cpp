// WizNewFromScratch.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "WizNewFromScratch.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWizNewFromScratch

IMPLEMENT_DYNAMIC(CWizNewFromScratch, CPropertySheet)

CWizNewFromScratch::CWizNewFromScratch(CFileList* pRootFileList)
	:CPropertySheet(IDS_NewFromScratchCaption),
	m_dictRootUnifiedPage(  pRootFileList,
							TRUE,
							&m_dictAffixesPage,
							"Dictionaries (Unified style)",
							"Root Dictionaries"),
	m_dictMethodPage(TRUE /*default to unified*/, NULL, &m_dictAffixesPage)
{
	AddPage(&m_disclaimerPage);
	AddPage(&m_langDisplayPage);
	AddPage(&m_affixesPage);
	AddPage(&m_categoryPropogationPage);
	AddPage(&m_finalCatTestPage);
	AddPage(&m_dictMethodPage);
	//Let the dictMethodPage insert this if appropriate
			// AddPage(&m_dictAffixesPage);
	AddPage(&m_dictRootUnifiedPage);

	SetWizardMode();
}


CWizNewFromScratch::~CWizNewFromScratch()
{
}


BEGIN_MESSAGE_MAP(CWizNewFromScratch, CPropertySheet)
	//{{AFX_MSG_MAP(CWizNewFromScratch)
//	ON_COMMAND(ID_HELP, OnHelp)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWizNewFromScratch message handlers

//DEL BOOL CWizNewFromScratch::OnHelpInfo(HELPINFO* pHelpInfo)
//DEL {
//DEL 	// TODO: Add your message handler code here and/or call default
//DEL
//DEL 	return CPropertySheet::OnHelpInfo(pHelpInfo);
//DEL }

//DEL void CWizNewFromScratch::OnHelp()
//DEL {
//DEL 	// TODO: Add your command handler code here
//DEL
//DEL }
