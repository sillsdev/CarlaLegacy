#if !defined(AFX_NULLWINDOW_H__2385D4C1_1E61_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_NULLWINDOW_H__2385D4C1_1E61_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// nullwindow.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CNullWindow frame

class CNullWindow : public CMDIChildWnd
{
	DECLARE_DYNCREATE(CNullWindow)
protected:
	CNullWindow();           // protected constructor used by dynamic creation

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNullWindow)
	public:
	virtual void ActivateFrame(int nCmdShow = -1);
	protected:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	virtual void CalcWindowRect(LPRECT lpClientRect, UINT nAdjustType = adjustBorder);
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual ~CNullWindow();

	// Generated message map functions
	//{{AFX_MSG(CNullWindow)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NULLWINDOW_H__2385D4C1_1E61_11D2_A09E_E12649467D2F__INCLUDED_)
