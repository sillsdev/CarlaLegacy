#if !defined(AFX_PAGEDICTAFFIXES_H__A30E7B81_94C1_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_PAGEDICTAFFIXES_H__A30E7B81_94C1_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// PageDictAffixes.h : header file
//
#include "WizBaseClasses.h"
#include "flatbutton.h"
#include "filelistctrl.h"

/////////////////////////////////////////////////////////////////////////////
// CPageDictAffixes dialog

class CPageDictAffixes : public CWizPage
{
	DECLARE_DYNCREATE(CPageDictAffixes)

		// Construction
public:
	CPageDictAffixes(LPCTSTR lpszTitle=NULL);
	~CPageDictAffixes();

// Dialog Data
	//{{AFX_DATA(CPageDictAffixes)
	enum { IDD = IDD_PageDictAffix };
	CSimpleFlatButton	m_btnAddSuffix;
	CSimpleFlatButton	m_btnAddPrefix;
	CSimpleFlatButton	m_btnAddInfix;
	CString	m_sInfixPath;
	CString	m_sPrefixPath;
	CString	m_sSuffixPath;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPageDictAffixes)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual void checkStatus();
	BOOL OnToolTip(UINT id, NMHDR *pTTTStruct, LRESULT *pResult);

	// Generated message map functions
	//{{AFX_MSG(CPageDictAffixes)
	afx_msg void OnBTNPrefix();
	afx_msg void OnBTNInfix();
	afx_msg void OnBTNSuffix();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGEDICTAFFIXES_H__A30E7B81_94C1_11D2_864F_AC380CC10000__INCLUDED_)
