#if !defined(AFX_LISTVIEWESSAI_H__F568919B_08C2_47A8_8091_5E48A6483084__INCLUDED_)
#define AFX_LISTVIEWESSAI_H__F568919B_08C2_47A8_8091_5E48A6483084__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ListViewEssai.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CListViewEssai view

class CListViewEssai : public CListView
{
protected:
	CListViewEssai();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CListViewEssai)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CListViewEssai)
	public:
	virtual void OnInitialUpdate();
	protected:
	virtual void OnDraw(CDC* pDC);      // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	afx_msg void OnCLICK(NMHDR* pNMHDR, LRESULT* pResult);

	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual ~CListViewEssai();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
protected:
	//{{AFX_MSG(CListViewEssai)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LISTVIEWESSAI_H__F568919B_08C2_47A8_8091_5E48A6483084__INCLUDED_)
