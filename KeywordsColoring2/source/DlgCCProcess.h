#if !defined(AFX_DLGCCPROCESS_H__A7066662_5878_11D2_864E_444553540000__INCLUDED_)
#define AFX_DLGCCPROCESS_H__A7066662_5878_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgCCProcess.h : header file
//
#include "../resource.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgCCProcess dialog

class CDlgCCProcess : public CDialog
{
// Construction
public:
	CDlgCCProcess(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgCCProcess)
	enum { IDD = IDD_CCProcess };
	CButton	m_btnTablePath;
	CString	m_sName;
	CString	m_sDescription;
	int		m_iFileType;
	CString	m_sTablePath;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgCCProcess)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgCCProcess)
	afx_msg void OnButtonTablePath();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGCCPROCESS_H__A7066662_5878_11D2_864E_444553540000__INCLUDED_)
