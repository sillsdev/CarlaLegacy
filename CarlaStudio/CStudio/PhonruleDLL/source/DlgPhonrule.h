#if !defined(AFX_DLGPHONRULE_H__D1D1FC41_4F0B_11D2_864E_444553540000__INCLUDED_)
#define AFX_DLGPHONRULE_H__D1D1FC41_4F0B_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgPhonrule.h : header file
//
#include "..\resource.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgPhonrule dialog


class CDlgPhonrule : public CDialog
{
// Construction
public:
	CDlgPhonrule(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgPhonrule)
	enum { IDD = IDD_PhonruleParameters };
	BOOL	m_bTrace;
	BOOL	m_bMonitorRules;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgPhonrule)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgPhonrule)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGPHONRULE_H__D1D1FC41_4F0B_11D2_864E_444553540000__INCLUDED_)
