// CWTopicView.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CWTopicView form view

#ifndef __AFXEXT_H__
#include <afxext.h>
#endif

#ifndef __TopicContentsView__
#define __TopicContentsView__

class CWTopicView : public CFormView
{
protected:
	CWTopicView();           // protected constructor used by dynamic creation
	CWTopicView(UINT nIDTemplate);           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CWTopicView)

// Form Data
public:
	//{{AFX_DATA(CWTopicView)
	enum { IDD = IDD_Categories };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWTopicView)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual ~CWTopicView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
	//{{AFX_MSG(CWTopicView)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

#endif