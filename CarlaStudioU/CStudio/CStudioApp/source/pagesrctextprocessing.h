#if !defined(AFX_PAGESRCDOCPROCESSING_H__6C053BA1_2915_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_PAGESRCDOCPROCESSING_H__6C053BA1_2915_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// PageSrcDocProcessing.h : header file
//
class CCarlaLanguage;
class CProjectDoc;

/////////////////////////////////////////////////////////////////////////////
// CPageSrcTextProcessing dialog

class CPageSrcTextProcessing : public CPropertyPage
{
// Construction
public:
	CPageSrcTextProcessing();
	CPageSrcTextProcessing(	int iGoal,
							CCarlaLanguage* pSourceLang,
							CCarlaLanguage* pTargetLang,
							BOOL bVerbosity,
							BOOL bShowMakeDefaultBtn,
							DWORD dwFlags);
	// Dialog Data
	//{{AFX_DATA(CPageSrcTextProcessing)
	enum { IDD = IDD_PageSrcTextProcessing };
	CComboBox	m_comboTargetLang;
	CComboBox	m_comboSrcLang;
	CButton	m_btnMakeDefault;
	BOOL	m_bMakeDefault;
	BOOL	m_bVerbosity;
	int		m_iGoal;
	BOOL	m_bOutputItxToSameDir;
	BOOL	m_bLeaveNonGoalsInTemp;
	//}}AFX_DATA

	CProjectDoc* m_pProj;
	CCarlaLanguage* m_pSourceLang;
	CCarlaLanguage* m_pTargetLang;
	BOOL m_bShowDefaultButton;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPageSrcTextProcessing)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CPageSrcTextProcessing)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGESRCDOCPROCESSING_H__6C053BA1_2915_11D2_A09E_E12649467D2F__INCLUDED_)
