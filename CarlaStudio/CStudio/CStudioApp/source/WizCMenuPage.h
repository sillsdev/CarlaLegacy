#if !defined(AFX_WIZCMENUPAGE_H__FF611C82_06B4_11D2_89BE_0000C035C8C8__INCLUDED_)
#define AFX_WIZCMENUPAGE_H__FF611C82_06B4_11D2_89BE_0000C035C8C8__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// WizCMenuPage.h : header file
//
#include "WizBaseClasses.h"

/////////////////////////////////////////////////////////////////////////////
// CPageCMenu dialog

class CPageCMenu : public CWizPage
{
// Construction
public:
	char m_cCommentChar;
	CPageCMenu(CWnd* pParent = NULL);   // standard constructor
	virtual LRESULT OnWizardNext();
// Dialog Data
	//{{AFX_DATA(CPageCMenu)
	enum { IDD = IDD_WizCMenuSettings };
	CString	m_sCMenuSetPath;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPageCMenu)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	void checkStatus();

	// Generated message map functions
	//{{AFX_MSG(CPageCMenu)
	afx_msg void OnBTNCarlaSetPath();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WIZCMENUPAGE_H__FF611C82_06B4_11D2_89BE_0000C035C8C8__INCLUDED_)
