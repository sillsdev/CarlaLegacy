#if !defined(AFX_SEDIT_H__DC6F7FA3_D58F_11D2_8651_183E0CC10000__INCLUDED_)
#define AFX_SEDIT_H__DC6F7FA3_D58F_11D2_8651_183E0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SEdit.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSEdit window

class CSEdit : public CEdit
{
// Construction
public:
	CSEdit();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSEdit)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CSEdit();

	// Generated message map functions
protected:
	//{{AFX_MSG(CSEdit)
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SEDIT_H__DC6F7FA3_D58F_11D2_8651_183E0CC10000__INCLUDED_)
