// Last revison: 4/19/2002 11:47:08 AM [mr]
#if !defined(AFX_DLGEDITTEXT_H__CC991A4C_5A7B_4302_AD8C_CF2FE0B40E1A__INCLUDED_)
#define AFX_DLGEDITTEXT_H__CC991A4C_5A7B_4302_AD8C_CF2FE0B40E1A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgEditText.h : header file
//

#include "TestEdit.h"
#include "FlatButton.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgEditText dialog

class CDlgEditText : public CDialog
{
// Construction
public:
	CDlgEditText(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditText)
	enum { IDD = IDD_EditTest };
	CButton m_btnCheckOnOff;
	CString	m_sLabel;
	CString	m_sDescription;
	BOOL	m_bEnabled;
	CRichEditCtrl	m_richContents;
	CString m_sContents;
	//}}AFX_DATA
	CTestEdit m_richTestEdit;


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditText)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditText)
	virtual BOOL OnInitDialog();
	afx_msg void OnCheckOnOff();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITTEXT_H__CC991A4C_5A7B_4302_AD8C_CF2FE0B40E1A__INCLUDED_)
