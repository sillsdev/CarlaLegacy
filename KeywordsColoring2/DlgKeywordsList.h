#if !defined(AFX_DLGKEYWORDSLIST_H__17C1F418_E972_437E_A390_DB23E6F45B32__INCLUDED_)
#define AFX_DLGKEYWORDSLIST_H__17C1F418_E972_437E_A390_DB23E6F45B32__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgKeywordsList.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgKeywordsList dialog

class CDlgKeywordsList : public CDialog
{
// Construction
public:
	CDlgKeywordsList(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgKeywordsList)
	enum { IDD = IDD_KeywordsList };
	CRichEditCtrl	m_text;
	CListCtrl	m_list;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgKeywordsList)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	CString splitString (CString sS, int& nId, TCHAR cSep);


	// Generated message map functions
	//{{AFX_MSG(CDlgKeywordsList)
	virtual BOOL OnInitDialog();
	afx_msg void OnDblclkList(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnItemchangedList(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGKEYWORDSLIST_H__17C1F418_E972_437E_A390_DB23E6F45B32__INCLUDED_)
