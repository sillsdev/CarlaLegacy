#if !defined(AFX_TABBEDTREECHILD_H__51E4EFA2_2621_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_TABBEDTREECHILD_H__51E4EFA2_2621_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// TabbedTreeChild.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTabbedTreeChild frame
//#include  "Splitter.h"
//#include "TabbedTreeView.h"
#include "CWTabBar.h"

class CTabbedTreeChild : public CMDIChildWnd
{
	DECLARE_DYNCREATE(CTabbedTreeChild)
protected:
	CTabbedTreeChild();           // protected constructor used by dynamic creation
	CFindReplaceDialog* m_pFindDlg;


// Attributes
public:

// Operations
public:
	void switchViewFocus(BOOL bToContent);
	void TopicChanged(CWTopic* pNewTopic);
	void InterfaceChanged();
	void retrieveData();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTabbedTreeChild)
	public:
	protected:
	virtual BOOL OnCreateClient(LPCREATESTRUCT lpcs, CCreateContext* pContext);
	//}}AFX_VIRTUAL

// Implementation
protected:
	CWTabBar* getTabBar();
	afx_msg LONG OnFindReplace(WPARAM wParam, LPARAM lParam);
	virtual ~CTabbedTreeChild();
	// Generated message map functions
	//{{AFX_MSG(CTabbedTreeChild)
	afx_msg void OnMDIActivate(BOOL bActivate, CWnd* pActivateWnd, CWnd* pDeactivateWnd);
	afx_msg void OnEditFind();
	afx_msg void OnUpdateEditFind(CCmdUI* pCmdUI);
	afx_msg void OnEDITFindAgain();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TABBEDTREECHILD_H__51E4EFA2_2621_11D2_A09E_E12649467D2F__INCLUDED_)
