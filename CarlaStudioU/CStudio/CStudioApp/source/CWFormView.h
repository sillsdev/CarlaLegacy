// CWFormView.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CWFormView view

#pragma once

class CWFormTopic;
class CTextDisplayInfo;

class CWFormView : public CScrollView
{
protected:
	void setFonts();
	CWFormTopic* m_pTopic;
	DECLARE_DYNCREATE(CWFormView)

// Attributes
public:
	CWFormView();           // protected constructor used by dynamic creation
	BOOL didInitialUpdate;
	CWFormView(CWFormTopic* pTopic);
	void retrieveData();

// Operations
public:
	const CTextDisplayInfo* getLangDisplayInfo();
	LONG doFindReplace(FINDREPLACE * pFR);
	virtual void OnDataModified();
	virtual ~CWFormView();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWFormView)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	virtual void OnDraw(CDC* pDC);      // overridden to draw this view
	virtual void OnInitialUpdate();     // first time after construct
	virtual BOOL OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult);
	virtual void OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint);
	//}}AFX_VIRTUAL

// Implementation
protected:
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
	//{{AFX_MSG(CWFormView)
	afx_msg BOOL OnEraseBkgnd(CDC* pDC);
	afx_msg BOOL OnCopyData(CWnd* pWnd, COPYDATASTRUCT* pCopyDataStruct);
	afx_msg void OnEditCopy();
	afx_msg void OnEditPaste();
	afx_msg void OnUpdateEditPaste(CCmdUI* pCmdUI);
	afx_msg void OnEditUndo();
	afx_msg void OnEditCut();
	afx_msg void OnUpdateEditCut(CCmdUI* pCmdUI);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
