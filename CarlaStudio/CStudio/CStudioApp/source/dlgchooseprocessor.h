#if !defined(AFX_DLGCHOOSEPROCESSOR_H__587DE681_149E_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_DLGCHOOSEPROCESSOR_H__587DE681_149E_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgChooseProcessor.h : header file
//
class CProcess ;

/////////////////////////////////////////////////////////////////////////////
// CDlgChooseProcessor dialog

class CDlgChooseProcessor : public CDialog
{
// Construction
public:
	CDlgChooseProcessor(const CProcessSequence* pSeq);
	CProcessTemplate* m_pChosenTemplate;
	CProcessTemplate* getFirstSelectedItem();

// Dialog Data
	//{{AFX_DATA(CDlgChooseProcessor)
	enum { IDD = IDD_ChooseProcessor };
	CListCtrl	m_listctrl;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgChooseProcessor)
	public:
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CImageList m_iconList;
	const CProcessSequence* m_pSequence;

	// Generated message map functions
	//{{AFX_MSG(CDlgChooseProcessor)
	virtual BOOL OnInitDialog();
	afx_msg void OnGetdispinfoList(NMHDR* pNMHDR, LRESULT* pResult);
	virtual void OnOK();
	afx_msg void OnDblclkList(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnItemchangingList(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGCHOOSEPROCESSOR_H__587DE681_149E_11D2_A09E_E12649467D2F__INCLUDED_)
