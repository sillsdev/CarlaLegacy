#if !defined(AFX_DLGEDITTONETRACING_H__ACC1A9A1_AE40_11D4_942A_0050BF068CF6__INCLUDED_)
#define AFX_DLGEDITTONETRACING_H__ACC1A9A1_AE40_11D4_942A_0050BF068CF6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// dlgedittonetracing.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgEditToneTracing dialog

class CDlgEditToneTracing : public CDialog
{
// Construction
public:
	CDlgEditToneTracing(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditToneTracing)
	enum { IDD = IDD_EditToneTracing };
	BOOL	m_bDomains;
	BOOL	m_bMora;
	BOOL	m_bSegments;
	BOOL	m_bSyllable;
	BOOL	m_bTBU;
	BOOL	m_bLinkAnalysis;
	BOOL	m_bMorpheme;
	BOOL	m_bToneTier;
	BOOL	m_bToneRule;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditToneTracing)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditToneTracing)
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITTONETRACING_H__ACC1A9A1_AE40_11D4_942A_0050BF068CF6__INCLUDED_)
