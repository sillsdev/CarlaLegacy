#if !defined(AFX_DLGLEXTRANS_H__436BCE6F_4FD6_11D2_864E_444553540000__INCLUDED_)
#define AFX_DLGLEXTRANS_H__436BCE6F_4FD6_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgLextrans.h : header file
//
#include "..\resource.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgLextrans dialog

class CDlgLextrans : public CDialog
{
// Construction
public:
	CDlgLextrans(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgLextrans)
	enum { IDD = IDD_DIALOGLextrans };
	BOOL	m_bMonitor;
	BOOL	m_bTrace;
	CString	m_sSourceMarker;
	CString	m_sTargetLexMarker;
	BOOL	m_bUseTargetDict;
	BOOL	m_bReplaceCats;
	BOOL	m_bReplaceProps;
	BOOL	m_bReplaceRoots;
	CString	m_sTargetPropMarker;
	CString	m_sTargetCatMarker;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgLextrans)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgLextrans)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGLEXTRANS_H__436BCE6F_4FD6_11D2_864E_444553540000__INCLUDED_)
