#if !defined(AFX_PAGEDICTMETHOD_H__A30E7B82_94C1_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_PAGEDICTMETHOD_H__A30E7B82_94C1_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// PageDictMethod.h : header file
//
#include "WizBaseClasses.h"

/////////////////////////////////////////////////////////////////////////////
// CPageDictMethod dialog
class CPageDictAffixes;

class CPageDictMethod : public CWizPage
{
	DECLARE_DYNAMIC(CPageDictMethod)

// Construction
public:
	CPageDictAffixes* m_pAffixPage;
	CPageDictMethod(BOOL bUnifiedDictMethod,
					CPropertySheet* pModifyPropertySheet,
					CPageDictAffixes* pPageAffixDicts);
	~CPageDictMethod();
	static void manageAffixPage(CPropertySheet* pSheet, CPageDictAffixes* pPage, BOOL bUnifiedMethod);

	enum {kUnified=0, kClassic=1};
// Dialog Data
	//{{AFX_DATA(CPageDictMethod)
	enum { IDD = IDD_ChooseDictMethod };
	int		m_nDictMethod;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageDictMethod)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	void manageChange();
	// Generated message map functions
	//{{AFX_MSG(CPageDictMethod)
	afx_msg void OnBtnDictMethod();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
	CPropertySheet* m_pModifyPropSheet;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGEDICTMETHOD_H__A30E7B82_94C1_11D2_864F_AC380CC10000__INCLUDED_)
