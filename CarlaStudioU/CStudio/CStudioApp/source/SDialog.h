#if !defined(AFX_SDIALOG_H__DC6F7FA2_D58F_11D2_8651_183E0CC10000__INCLUDED_)
#define AFX_SDIALOG_H__DC6F7FA2_D58F_11D2_8651_183E0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SDialog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSDialog dialog

class CSDialog : public CDialog
{
// Construction
public:
	CSDialog(UINT id, CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSDialog)
	enum { IDD = IDD_HEADING_VIEW };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSDialog)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSDialog)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SDIALOG_H__DC6F7FA2_D58F_11D2_8651_183E0CC10000__INCLUDED_)
