#if !defined(AFX_FORMBUTTON_H__75593422_A3C9_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_FORMBUTTON_H__75593422_A3C9_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// FormButton.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CFormButton window

class CFormButton : public CButton
{
// Construction
public:
	CFormButton();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFormButton)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CFormButton();

	// Generated message map functions
protected:
	//{{AFX_MSG(CFormButton)
	afx_msg void OnClicked();
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FORMBUTTON_H__75593422_A3C9_11D2_864F_AC380CC10000__INCLUDED_)
