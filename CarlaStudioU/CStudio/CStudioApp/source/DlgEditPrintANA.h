#if !defined(AFX_DLGEDITPRINTANA_H__6DEEB5C1_E2F2_11D3_942A_000267095A18__INCLUDED_)
#define AFX_DLGEDITPRINTANA_H__6DEEB5C1_E2F2_11D3_942A_000267095A18__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgEditPrintANA.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgEditPrintANA dialog

class CDlgEditPrintANA : public CDialog
{
// Construction
public:
	CDlgEditPrintANA(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditPrintANA)
	enum { IDD = IDD_EditPrintANAProcess };
	CString m_sEXEName;
	int m_nDisplayBeginColumn;
	BOOL m_bDisplayAnalysesOnly;
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditPrintANA)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditPrintANA)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITPRINTANA_H__6DEEB5C1_E2F2_11D3_942A_000267095A18__INCLUDED_)
