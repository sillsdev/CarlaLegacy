#if !defined(AFX_SHEETModifyTests_H__DA1165A0_198E_11D3_866D_74980CC10000__INCLUDED_)
#define AFX_SHEETModifyTests_H__DA1165A0_198E_11D3_866D_74980CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SheetModifyTests.h : header file
//

#include "PageAffixes.h"
#include "PageCategoryProp.h"

/////////////////////////////////////////////////////////////////////////////
// CSheetModifyTests

class CPageModifyTestFinish : public CPropertyPage
{
public:
		CPageModifyTestFinish()
			: CPropertyPage(IDD_ModifyTestsFinish) {}
	BOOL OnSetActive();
};

class CSheetModifyTests : public CPropertySheet
{
	DECLARE_DYNAMIC(CSheetModifyTests)

// Construction
public:
	CSheetModifyTests(CWnd* pParentWnd = NULL, UINT iSelectPage = 0);

// Attributes
public:
	CPageAffixes m_affixesPage;
	CPageCategoryProp m_categoryPropogationPage;
	CPageModifyTestFinish m_finishPage;
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSheetModifyTests)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CSheetModifyTests();

	// Generated message map functions
protected:
	//{{AFX_MSG(CSheetModifyTests)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SHEETModifyTests_H__DA1165A0_198E_11D3_866D_74980CC10000__INCLUDED_)
