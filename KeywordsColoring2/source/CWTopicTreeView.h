// CWTopicTreeView.h : interface of the CWTopicTreeView class
//
/////////////////////////////////////////////////////////////////////////////
#pragma once

#include <afxcview.h>
class CTabbedTreeDoc;

class CWTopicTreeView : public CTreeView
{
protected: // create from serialization only
	BOOL m_buildingTree;

// Attributes
public:
	CTabbedTreeDoc* GetDocument();
	CWTopicTreeView();
	DECLARE_DYNCREATE(CWTopicTreeView)
	void TopicTabChanged ();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWTopicTreeView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	protected:
	virtual void OnInitialUpdate(); // called first time after construct
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CWTopicTreeView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	//{{AFX_MSG(CWTopicTreeView)
	afx_msg void OnSelchanged(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnKillFocus(CWnd* pNewWnd);
	afx_msg void OnSetfocus(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnKeydown(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

#ifndef _DEBUG  // debug version in BlueView.cpp
inline CTabbedTreeDoc* CWTopicTreeView::GetDocument()
   { return (CTabbedTreeDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////
