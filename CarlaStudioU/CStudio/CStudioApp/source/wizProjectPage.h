#if !defined(AFX_WIZPROJECTLOCATION_H__4337E5C1_069B_11D2_89BE_0000C035C8C8__INCLUDED_)
#define AFX_WIZPROJECTLOCATION_H__4337E5C1_069B_11D2_89BE_0000C035C8C8__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// wizprojectlocation.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CPageProjectPath dialog

#include "WizBaseClasses.h"

class CPageProjectPath : public CWizPage
{
// Construction
public:
	CPageProjectPath(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CPageProjectPath)
	enum { IDD = IDD_WizProjectLocation };
	CString	m_sProjectPath;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPageProjectPath)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual void checkStatus();

	// Generated message map functions
	//{{AFX_MSG(CPageProjectPath)
	afx_msg void OnBTNProjectPath();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WIZPROJECTLOCATION_H__4337E5C1_069B_11D2_89BE_0000C035C8C8__INCLUDED_)
