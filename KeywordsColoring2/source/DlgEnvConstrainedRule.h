#if !defined(AFX_DLGENVCONSTRAINEDRULE_H__706AE000_9A71_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_DLGENVCONSTRAINEDRULE_H__706AE000_9A71_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgEnvConstrainedRule.h : header file
//
//#include "EnvironmentListCtrl.h"
#include "SDialog.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgEnvConstrainedRule dialog
class CEnvironmentListCtrl;
class CWEnvironConstrainedRule;
class CTextDisplayInfo;

// this is an abstract superclass for dialogs that will include a listctrl to show environments
class CDlgEnvConstrainedRule : public CSDialog
{
// Construction
public:
	virtual  ~CDlgEnvConstrainedRule();
	void setRule(CWEnvironConstrainedRule* pRule);
	CDlgEnvConstrainedRule(BOOL bMorphEnv, // if false, it's a string env (only affects the icon)
							UINT id,
							const CTextDisplayInfo* pTDI,
							CWnd* pParent = NULL);   // standard constructor

	const	CTextDisplayInfo* m_pTDI;
// Dialog Data
	//{{AFX_DATA(CDlgEnvConstrainedRule)
//	enum { IDD = IDD_PageRedundantFieldNotice };
	CEnvironmentListCtrl*	m_pListCtrlEnvironments;
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEnvConstrainedRule)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	BOOL m_bIsMorphEnv;

	// Generated message map functions
	//{{AFX_MSG(CDlgEnvConstrainedRule)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGENVCONSTRAINEDRULE_H__706AE000_9A71_11D2_864F_AC380CC10000__INCLUDED_)
