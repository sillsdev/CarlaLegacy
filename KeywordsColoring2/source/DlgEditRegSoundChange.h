#if !defined(AFX_DLGEDITREGSOUNDCHANGE_H__B140E2C1_2D32_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_DLGEDITREGSOUNDCHANGE_H__B140E2C1_2D32_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgEditRegSoundChange.h : header file
//
////
// 1.7a1 02-Dec-1999 Added regular sound change identifiers

class CTextDisplayInfo;
#include "DlgEnvConstrainedRule.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgEditRegSoundChange dialog

class CDlgEditRegSoundChange : public CDlgEnvConstrainedRule
{
// Construction
public:
	CDlgEditRegSoundChange(const CTextDisplayInfo* pTDI);

// Dialog Data
	//{{AFX_DATA(CDlgEditRegSoundChange)
	enum { IDD = IDD_EditRegularSoundChange };
	BOOL	m_bEnabled;
	CString	m_sComments;
	CString	m_sFrom;
	CString	m_sTo;
#ifndef hab17a1
	CString	m_sRscIds;
#endif // hab17a1
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditRegSoundChange)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CEdit m_sEditEnv, m_sEditFrom, m_sEditTo;
#ifndef hab17a1
	CEdit m_sEditRscIds;
#endif // hab17a1
	// Generated message map functions
	//{{AFX_MSG(CDlgEditRegSoundChange)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITREGSOUNDCHANGE_H__B140E2C1_2D32_11D2_A09E_E12649467D2F__INCLUDED_)
