#if !defined(AFX_LOGWINDOW_H__09FFD2E1_31E8_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_LOGWINDOW_H__09FFD2E1_31E8_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// LogWindow.h : header file
//

#define LOG4(W, X, Y, Z) CLogWindow::writeToLog(W, X, Y, Z)
#define LOG3(W, X, Y) CLogWindow::writeToLog(W, X, Y)
#define LOG2(W, X) CLogWindow::writeToLog(W, X)
#define LOG(W) CLogWindow::writeToLog(W)

/////////////////////////////////////////////////////////////////////////////
// CLogWindow document

class CLogWindow : public CDocument
{
protected:
	CLogWindow();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CLogWindow)

// Attributes
public:
	static CString getRegFileTypeID() {return "LogWindow";}

// Operations
public:
	static	void writeToLog(LPCTSTR lpszA, LPCTSTR lpszB=NULL, LPCTSTR lpszC=NULL, LPCTSTR lpszD=NULL);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLogWindow)
	public:
	virtual void Serialize(CArchive& ar);   // overridden for document i/o
	protected:
	virtual BOOL OnNewDocument();
	//}}AFX_VIRTUAL

// Implementation
public:
	void append(LPCTSTR lpszA, LPCTSTR lpszB=NULL,  LPCTSTR lpszC=NULL,  LPCTSTR lpszD=NULL);
	virtual ~CLogWindow();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
protected:
	BOOL m_bNew;
	//{{AFX_MSG(CLogWindow)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LOGWINDOW_H__09FFD2E1_31E8_11D2_A09E_E12649467D2F__INCLUDED_)
