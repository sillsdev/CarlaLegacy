// SheetLangProperties.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "SheetLangProperties.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#include "carlalanguage.h"

/////////////////////////////////////////////////////////////////////////////
// CSheetLangProperties

IMPLEMENT_DYNAMIC(CSheetLangProperties, CPropertySheet)

CSheetLangProperties::CSheetLangProperties(LPCTSTR pszCaption, CCarlaLanguage* pLang, CWnd* pParentWnd, UINT iSelectPage)
	:CPropertySheet(pszCaption, pParentWnd, iSelectPage),
	m_pageDisplay("Display", pLang->getAbrev().GetLength()>0),
	m_pageAffixDicts("Affix Dicts"),
	m_pageRootUnifiedDicts( pLang->getMFS()->getRootDicList(),
							pLang->getMFS()->getUsingUnifiedDicts(),
							&m_pageAffixDicts,
							FALSE),
	m_pageLocations(pLang->getMFS()->getOutputDirAnalyzedANA(FALSE),
				pLang->getMFS()->getOutputDirInterlinear(FALSE),
				pLang->getMFS()->getOutputDirTransferedANA(FALSE),
				pLang->getMFS()->getOutputDirSynthesizedText(FALSE),
				pLang->getMFS()->getDefaultInputDir(FALSE)//,
				//pLang->m_dwOutputFlags
				)
{
	m_psh.dwFlags |= PSH_NOAPPLYNOW;

	AddPage(&m_pageDisplay);
	AddPage(&m_pageLocations);

	AddPage(&m_pageRootUnifiedDicts);

	// should we show this tab initially?  If not, it can still be added if the
	// user changed the dictionary method inside of the root/unified page
	if(!pLang->getMFS()->getUsingUnifiedDicts())
		AddPage(&m_pageAffixDicts);
}

CSheetLangProperties::~CSheetLangProperties()
{
}


BEGIN_MESSAGE_MAP(CSheetLangProperties, CPropertySheet)
	//{{AFX_MSG_MAP(CSheetLangProperties)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSheetLangProperties message handlers


BOOL CSheetLangProperties::OnInitDialog()
{
	BOOL bResult = CPropertySheet::OnInitDialog();

	// change the default button to OK
	this->PostMessage(DM_SETDEFID, IDOK);

	return bResult;
}
