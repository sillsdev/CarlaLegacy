// WHeadingTopicView.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CWHeadingView form view

#ifndef __AFXEXT_H__
#include <afxext.h>
#endif

class CWHeadingView : public CFormView
{
protected:
	CWHeadingView();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CWHeadingView)

// Form Data
public:
	//{{AFX_DATA(CWHeadingView)
	enum { IDD = IDD_HEADING_VIEW };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWHeadingView)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual ~CWHeadingView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
	//{{AFX_MSG(CWHeadingView)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
