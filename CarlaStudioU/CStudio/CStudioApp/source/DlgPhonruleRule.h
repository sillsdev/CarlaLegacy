#if !defined(AFX_CDlgPhonruleRule_H__408DD7A2_47C6_11D2_864E_444553540000__INCLUDED_)
#define AFX_CDlgPhonruleRule_H__408DD7A2_47C6_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// CDlgPhonruleRule.h : header file
//
class CTextDisplayInfo;
#include "DlgEnvConstrainedRule.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgPhonruleRule dialog

class CDlgPhonruleRule : public CDlgEnvConstrainedRule
{
// Construction
public:
	CDlgPhonruleRule(const CTextDisplayInfo* pTDI);

// Dialog Data
	//{{AFX_DATA(CDlgPhonruleRule)
	enum { IDD = IDD_EditPhonruleRule };
	CString	m_sCategory;
	BOOL	m_bEnabled;
	CString	m_sFrom;
	CString	m_sTo;
	int		m_iForceType;
	int		m_iRuleType;
	CString	m_sComments;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgPhonruleRule)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CEdit m_editEnv, m_editFrom, m_editTo;

	void vSize(int cx, int cy);
	// Generated message map functions
	//{{AFX_MSG(CDlgPhonruleRule)
	afx_msg void OnDestroy();
	virtual BOOL OnInitDialog();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnGetMinMaxInfo(MINMAXINFO FAR* lpMMI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CDlgPhonruleRule_H__408DD7A2_47C6_11D2_864E_444553540000__INCLUDED_)
