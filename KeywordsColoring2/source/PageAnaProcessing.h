#if !defined(AFX_PAGEANAPROCESSING_H__C9F87261_57B7_11D2_864E_444553540000__INCLUDED_)
#define AFX_PAGEANAPROCESSING_H__C9F87261_57B7_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// PageAnaProcessing.h : header file
//

class CCarlaLanguage;
class CProjectDoc;

/////////////////////////////////////////////////////////////////////////////
// CPageAnaProcessing dialog

class CPageAnaProcessing : public CPropertyPage
{
// Construction
public:
	CPageAnaProcessing(	int iGoal,
							CCarlaLanguage* pInputLang,
							CCarlaLanguage* pTargetLang,
							BOOL bVerbosity,
							BOOL bShowMakeDefaultBtn,
							DWORD dwFlags);

// Dialog Data
	//{{AFX_DATA(CPageAnaProcessing)
	enum { IDD = IDD_PageAnaProcessing };
	CComboBox	m_comboInputLang;
	CComboBox		m_comboTargetLang;
	CButton	m_btnMakeDefault;
	BOOL	m_bVerbosity;
	BOOL	m_bMakeDefault;
	int		m_iGoal;
	BOOL	m_bLeaveNonGoalsInTemp;
	//}}AFX_DATA

	CProjectDoc* m_pProj;
	CCarlaLanguage* m_pInputLang;
	CCarlaLanguage* m_pTargetLang;
	BOOL m_bShowDefaultButton;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPageAnaProcessing)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CPageAnaProcessing)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGEANAPROCESSING_H__C9F87261_57B7_11D2_864E_444553540000__INCLUDED_)
