#if !defined(AFX_DLGEDITPCPATRDLLPROCESS_H__2CF61DED_4780_11D4_942A_0050BF068CF6__INCLUDED_)
#define AFX_DLGEDITPCPATRDLLPROCESS_H__2CF61DED_4780_11D4_942A_0050BF068CF6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// dlgeditpcpatrdllprocess.h : header file
//
#include "../resource.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgEditPCPATRDllProcess dialog

class CDlgEditPCPATRDllProcess : public CDialog
{
// Construction
public:
	CDlgEditPCPATRDllProcess(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditPCPATRDllProcess)
	enum { IDD = IDD_EditPCPATRDllProcess };
	BOOL	m_bAmplePropertyIsFeature;
	BOOL	m_bPromoteDefaultAtomicValues;
	BOOL	m_bShowFailures;
	BOOL	m_bDisplayFeatures;
	BOOL	m_bDisplayGloss;
	BOOL	m_bTrimEmptyFeatures;
	BOOL	m_bPerformUnification;
	BOOL	m_bWriteAmpleParses;
	UINT	m_uiMaxAmbiguities;
	CString	m_sSentenceFinalPunctuation;
	UINT	m_uiTimeLimit;
	int		m_iTreeDisplayFormat;
	CString	m_sGrammarFileName;
	BOOL	m_bFlatFeatureDisplay;
	BOOL	m_bAllFeatures;
	int		m_iRootGlossSetting;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditPCPATRDllProcess)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	void handleDisplayFeaturesSubItems(void);
	// Generated message map functions
	//{{AFX_MSG(CDlgEditPCPATRDllProcess)
	afx_msg void OnBUTTONGrammar();
	afx_msg void OnCHECKDisplayFeatures();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITPCPATRDLLPROCESS_H__2CF61DED_4780_11D4_942A_0050BF068CF6__INCLUDED_)
