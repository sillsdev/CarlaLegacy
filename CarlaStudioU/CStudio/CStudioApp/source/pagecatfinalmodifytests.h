#if !defined(AFX_PAGECATFINALMODIFYTESTS_H__B1342439_F47A_4502_81BE_2CA96EB476FD__INCLUDED_)
#define AFX_PAGECATFINALMODIFYTESTS_H__B1342439_F47A_4502_81BE_2CA96EB476FD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// pagecatfinalmodifytests.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CPageCatFinalModifyTest dialog

class CPageCatFinalModifyTest : public CPropertyPage
{
	DECLARE_DYNCREATE(CPageCatFinalModifyTest)

// Construction
public:
	CPageCatFinalModifyTest(UINT nIDTemplate=CPageCatFinalModifyTest::IDD, UINT nIDCaption=0);
	~CPageCatFinalModifyTest();

// Dialog Data
	//{{AFX_DATA(CPageCatFinalModifyTest)
	enum { IDD = IDD_PageCatFinalModifyTest };
	BOOL	m_bDisableFinalCatTest;
	BOOL	m_bCreateFinalCatTests;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageCatFinalModifyTest)
	public:
	virtual BOOL OnSetActive();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CPageCatFinalModifyTest)
	afx_msg void OnCHECKCreateFinalCatTestModifyTests();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGECATFINALMODIFYTESTS_H__B1342439_F47A_4502_81BE_2CA96EB476FD__INCLUDED_)
