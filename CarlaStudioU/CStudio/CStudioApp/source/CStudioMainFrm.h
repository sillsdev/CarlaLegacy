// CStudioMainFrm.h : interface of the CStudioMainFrame class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_PROJMAINFRM_H__F2B8DE09_FEC1_11D1_89BE_0000C035C8C8__INCLUDED_)
#define AFX_PROJMAINFRM_H__F2B8DE09_FEC1_11D1_89BE_0000C035C8C8__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

class CStudioMainFrame : public CMDIFrameWnd
{
	DECLARE_DYNAMIC(CStudioMainFrame)
public:
	CStudioMainFrame();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CStudioMainFrame)
	public:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CStudioMainFrame();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:  // control bar embedded members
	CStatusBar  m_wndStatusBar;
	CToolBar    m_wndToolBar;

	// these two are for csremote only, not csBridge (reinstated jdh 9/4/99)
	LONG OnPublishParams( WPARAM wParam, LPARAM lParam);
	afx_msg LONG OnRemoteProcess( WPARAM wParam, LPARAM lParam);

// Generated message map functions
protected:
	CWnd* getFrontMostChild();
	afx_msg void OnInitMenu(CMenu* pMenu);
	//{{AFX_MSG(CStudioMainFrame)
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnClose();
	//}}AFX_MSG
	afx_msg LONG OnPing(WPARAM wParam, LPARAM lParam);

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROJMAINFRM_H__F2B8DE09_FEC1_11D1_89BE_0000C035C8C8__INCLUDED_)
