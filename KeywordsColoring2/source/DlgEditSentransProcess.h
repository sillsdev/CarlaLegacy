#if !defined(AFX_DLGEDITSENTRANSPROCESS_H__3323E1C1_2B85_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_DLGEDITSENTRANSPROCESS_H__3323E1C1_2B85_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgEditSentransProcess.h : header file
//
#include "../resource.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransProcess dialog

class CDlgEditSentransProcess : public CDialog
{
// Construction
public:
	BOOL m_bInTransferSeq;
	BOOL m_bInInterlinearSeq;
	CDlgEditSentransProcess(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditSentransProcess)
	enum { IDD = IDD_EditSentransProcess };
	BOOL	m_bMonitorAmbiguities;
	BOOL	m_bMonitorRulesApplied;
	BOOL	m_bOutputClassContents;
	BOOL	m_bTraceRules;
	int		m_iFunction;
	CString	m_sRuleFilePath;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditSentransProcess)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditSentransProcess)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITSENTRANSPROCESS_H__3323E1C1_2B85_11D2_A09E_E12649467D2F__INCLUDED_)
