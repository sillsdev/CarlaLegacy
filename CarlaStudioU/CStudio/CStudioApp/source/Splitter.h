// Splitter.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSplitter window

#ifndef _CSPlitter_
	#define _CSPlitter_


class CSplitter : public CSplitterWnd
{
// Construction
public:
	BOOL ReplaceView(int row, int col,CRuntimeClass * pViewClass,SIZE size);
	CSplitter();

// Attributes
public:
	int GetSplitterWidth() const { return m_cxSplitter; }

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSplitter)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CSplitter();

	// Generated message map functions
protected:
	//{{AFX_MSG(CSplitter)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#endif
/////////////////////////////////////////////////////////////////////////////
