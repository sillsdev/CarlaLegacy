#if !defined(AFX_SPLITTER_H__8FCA6642_95B2_11D3_93AF_EA6567D58D04__INCLUDED_)
#define AFX_SPLITTER_H__8FCA6642_95B2_11D3_93AF_EA6567D58D04__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Splitter.h : header file
//

#ifndef _CSPlitter_
	#define _CSPlitter_
#endif
/////////////////////////////////////////////////////////////////////////////
// CSplitter window

class CSplitter : public CSplitterWnd
{
	DECLARE_DYNAMIC(CSplitter)
	// Construction
public:
	CSplitter();

// Attributes
public:

// Operations
public:
	BOOL ReplaceView(int row, int col,CRuntimeClass * pViewClass,SIZE size);
	CWnd* GetActivePane(int* pRow, int* pCol);

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

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SPLITTER_H__8FCA6642_95B2_11D3_93AF_EA6567D58D04__INCLUDED_)
