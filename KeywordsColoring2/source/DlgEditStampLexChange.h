#if !defined(AFX_DLGEDITSTAMPLEXCHANGE_H__C5BB3601_2D06_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_DLGEDITSTAMPLEXCHANGE_H__C5BB3601_2D06_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgEditStampLexChange.h : header file
//
#include "DlgEnvConstrainedRule.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampLexChange dialog

class CDlgEditStampLexChange : public CDlgEnvConstrainedRule
{
// Construction
public:
	CDlgEditStampLexChange(const CTextDisplayInfo* pTDI);

// Dialog Data
	//{{AFX_DATA(CDlgEditStampLexChange)
	enum { IDD = IDD_EditStampLexChange };
	BOOL	m_bEnabled;
	CString	m_sComments;
	CString	m_sFrom;
	CString	m_sTo;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditStampLexChange)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditStampLexChange)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITSTAMPLEXCHANGE_H__C5BB3601_2D06_11D2_A09E_E12649467D2F__INCLUDED_)
