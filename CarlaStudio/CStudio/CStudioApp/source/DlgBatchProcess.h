#if !defined(AFX_DLGBATCHPROCESS_H__A7066662_5878_11D2_864E_444553540000__INCLUDED_)
#define AFX_DLGBATCHPROCESS_H__A7066662_5878_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgBatchProcess.h : header file
//
// 2.1.0 06-Mar-2000 hab Initial coding
//////////////////////////////////////////////////////////////////////


#include "../resource.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgBatchProcess dialog

class CDlgBatchProcess : public CDialog
{
// Construction
public:
	CDlgBatchProcess(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgBatchProcess)
	enum { IDD = IDD_BatchProcess };
	CButton	m_btnBatchPath;
	CString	m_sName;
	CString	m_sDescription;
	int		m_iFileType;
	CString	m_sBatchPath;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgBatchProcess)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgBatchProcess)
	afx_msg void OnButtonBatchPath();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGBATCHPROCESS_H__A7066662_5878_11D2_864E_444553540000__INCLUDED_)
