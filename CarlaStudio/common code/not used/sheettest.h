#if !defined(AFX_SHEETTEST_H__F35D6DA1_999C_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_SHEETTEST_H__F35D6DA1_999C_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// sheettest.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSheetTest

class CSheetTest : public CPropertySheet
{
	DECLARE_DYNAMIC(CSheetTest)

// Construction
public:
	CSheetTest(UINT nIDCaption, CWnd* pParentWnd = NULL, UINT iSelectPage = 0);
	CSheetTest(LPCTSTR pszCaption, CWnd* pParentWnd = NULL, UINT iSelectPage = 0);

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSheetTest)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	virtual BOOL OnInitDialog();
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CSheetTest();

	// Generated message map functions
protected:
	CToolTipCtrl m_ToolTip;
	//{{AFX_MSG(CSheetTest)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SHEETTEST_H__F35D6DA1_999C_11D2_864F_AC380CC10000__INCLUDED_)
