#if !defined(AFX_TESTPATHCTRL_H__7D1C1B60_98F1_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_TESTPATHCTRL_H__7D1C1B60_98F1_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// testpathctrl.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTestPathCtrl dialog

#include "pathctrl.h"
class CTestPathCtrl : public CPropertyPage
{
// Construction
public:
	CTestPathCtrl(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CTestPathCtrl)
	enum { IDD = IDD_test };
	CPathCtrl	m_test;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTestPathCtrl)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CTestPathCtrl)
	virtual BOOL OnInitDialog();
	virtual void OnCancel();
	afx_msg void OnButton1();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TESTPATHCTRL_H__7D1C1B60_98F1_11D2_864F_AC380CC10000__INCLUDED_)
