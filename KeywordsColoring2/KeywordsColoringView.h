// KeywordsColoringView.h : interface of the CKeywordsColoringView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_KEYWORDSCOLORINGVIEW_H__FF9B0CBB_2ABC_4ADE_9D74_E213F82C4085__INCLUDED_)
#define AFX_KEYWORDSCOLORINGVIEW_H__FF9B0CBB_2ABC_4ADE_9D74_E213F82C4085__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CKeywordsColoringView : public CView
{
protected: // create from serialization only
	CKeywordsColoringView();
	DECLARE_DYNCREATE(CKeywordsColoringView)

// Attributes
public:
	CKeywordsColoringDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKeywordsColoringView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CKeywordsColoringView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CKeywordsColoringView)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in KeywordsColoringView.cpp
inline CKeywordsColoringDoc* CKeywordsColoringView::GetDocument()
   { return (CKeywordsColoringDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KEYWORDSCOLORINGVIEW_H__FF9B0CBB_2ABC_4ADE_9D74_E213F82C4085__INCLUDED_)
