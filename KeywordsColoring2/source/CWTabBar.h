// CWTabBar.h : header file
//
#pragma once
/////////////////////////////////////////////////////////////////////////////
// CWTabBar view
#include "CWTopicTreeView.h"
#include "Splitter.h"


const int kTREEWIDTH = 130;
const UINT kTabBarHeight = 28;
class CWTopicTreeView;
class CWFormView;
class CWTopic;
class CWTopicTab;

class CWTabBar : public CView
{
protected:
	int m_iLastSelectedTab;
	CTabCtrl m_tabCtrl;
	CSplitter m_wndSplitter;
	CWTopicTab* m_pLastTab;
	CWTopic* m_pCurrentTopic;


// Attributes
public:
	DECLARE_DYNCREATE(CWTabBar)
	CWTabBar();           // protected constructor used by dynamic creation
	virtual ~CWTabBar();
// Operations
public:
	CFindReplaceDialog* getFindDlg();
	void switchViewFocus(BOOL bToContent);
	void tabReorganized(int nTab);
	LONG doFindReplace(FINDREPLACE* pFR);
	void topicChanged(CWTopic* pNewTopic);
	void topicTabChanged();
	void retrieveData();
	void populate();


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWTabBar)
	public:
	virtual void OnInitialUpdate();
	virtual BOOL Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext = NULL);
	protected:
	virtual BOOL OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult);
	virtual void OnDraw(CDC* pDC);
	//}}AFX_VIRTUAL


// Implementation
protected:
	//HWND m_hwndTab;
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
protected:
	CWTopicTreeView* getTopicTree();
	//CWFormView* getFormView();
	CView* getContentView();
	//{{AFX_MSG(CWTabBar)
	afx_msg void OnSize(UINT nType, int cx, int cy);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
