// sheettest.cpp : implementation file
//

#include "stdafx.h"
#include "..\Mex\mex.h"
#include "sheettest.h"
#include "testpathctrl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSheetTest

IMPLEMENT_DYNAMIC(CSheetTest, CPropertySheet)

CSheetTest::CSheetTest(UINT nIDCaption, CWnd* pParentWnd, UINT iSelectPage)
	:CPropertySheet(nIDCaption, pParentWnd, iSelectPage)
{
}

CSheetTest::CSheetTest(LPCTSTR pszCaption, CWnd* pParentWnd, UINT iSelectPage)
	:CPropertySheet(pszCaption, pParentWnd, iSelectPage)
{
	CPropertyPage* p = new CTestPathCtrl();
	AddPage(p);
}


CSheetTest::~CSheetTest()
{
}


BEGIN_MESSAGE_MAP(CSheetTest, CPropertySheet)
	//{{AFX_MSG_MAP(CSheetTest)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSheetTest message handlers

BOOL CSheetTest::PreTranslateMessage(MSG* pMsg)
{
	if (m_hWnd)
	{
		m_ToolTip.RelayEvent (pMsg);
		return CPropertySheet::PreTranslateMessage(pMsg);
	}
	return (FALSE);
}

BOOL CSheetTest::OnInitDialog()
{
	BOOL bResult = CPropertySheet::OnInitDialog();

	m_ToolTip.Create (this);m_ToolTip.Activate (TRUE);
	CWnd*    pWnd = GetWindow (GW_CHILD);while (pWnd)
	{
		int nID = pWnd->GetDlgCtrlID ();
		if (nID >0)     // was !=0, but that doesn't seem to be enough -jdh
		{
			m_ToolTip.AddTool (pWnd, pWnd->GetDlgCtrlID ());
		}
		pWnd = pWnd->GetWindow (GW_HWNDNEXT);
	}

	return bResult;
}
