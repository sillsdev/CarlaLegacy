#if !defined(AFX_DLGNEWLANGUAGE_H__B6077363_3344_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_DLGNEWLANGUAGE_H__B6077363_3344_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgNewLanguage.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgNewLanguage dialog

class CDlgNewLanguage : public CDialog
{
// Construction
public:
	CDlgNewLanguage(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgNewLanguage)
	enum { IDD = IDD_LanguageCreation };
	int		m_iCreationMethod;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgNewLanguage)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgNewLanguage)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGNEWLANGUAGE_H__B6077363_3344_11D2_A09E_E12649467D2F__INCLUDED_)
