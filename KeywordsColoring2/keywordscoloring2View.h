// keywordscoloring2View.h : interface of the CKeywordscoloring2View class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_KEYWORDSCOLORING2VIEW_H__6A0E6C63_BDCE_4F11_A7C0_B5AC42A610CD__INCLUDED_)
#define AFX_KEYWORDSCOLORING2VIEW_H__6A0E6C63_BDCE_4F11_A7C0_B5AC42A610CD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CKeywordscoloring2View : public CView
{
protected: // create from serialization only
	CKeywordscoloring2View();
	DECLARE_DYNCREATE(CKeywordscoloring2View)

// Attributes
public:
	CKeywordscoloring2Doc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CKeywordscoloring2View)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CKeywordscoloring2View();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CKeywordscoloring2View)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in keywordscoloring2View.cpp
inline CKeywordscoloring2Doc* CKeywordscoloring2View::GetDocument()
   { return (CKeywordscoloring2Doc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_KEYWORDSCOLORING2VIEW_H__6A0E6C63_BDCE_4F11_A7C0_B5AC42A610CD__INCLUDED_)
