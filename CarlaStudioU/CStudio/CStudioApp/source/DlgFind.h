#if !defined(AFX_DLGFIND_H__25513541_C89F_11D2_864F_DC3D0CC10000__INCLUDED_)
#define AFX_DLGFIND_H__25513541_C89F_11D2_864F_DC3D0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgFind.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgFind dialog
class CTextDisplayInfo;

class CDlgFind : public CFindReplaceDialog
{
// Construction
public:
	const CTextDisplayInfo* m_pDisplayInfo;
	CDlgFind(const CTextDisplayInfo* pDisplayInfo, CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgFind)
//	enum { IDD = IDD_Find };
//	BOOL	m_bMatchCase;
//	CString	m_sWhat;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgFind)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgFind)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGFIND_H__25513541_C89F_11D2_864F_DC3D0CC10000__INCLUDED_)
