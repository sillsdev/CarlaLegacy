#if !defined(AFX_DLGEDITSENTRANSTRANSFER_H__20F66B41_26FC_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_DLGEDITSENTRANSTRANSFER_H__20F66B41_26FC_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgEditSentransTransfer.h : header file
//
#include "DlgEnvConstrainedRule.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransTransfer dialog

class CDlgEditSentransTransfer : public CDlgEnvConstrainedRule
{
// Construction
public:
	CDlgEditSentransTransfer(const CTextDisplayInfo* pTDI);

// Dialog Data
	//{{AFX_DATA(CDlgEditSentransTransfer)
	enum { IDD = IDD_EditSentransTransfer };
	BOOL	m_bEnabled;
	CString	m_sComments;
	CString	m_sFrom;
	CString	m_sTo;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditSentransTransfer)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	void vSize(int cx, int cy);
	// Generated message map functions
	//{{AFX_MSG(CDlgEditSentransTransfer)
	virtual BOOL OnInitDialog();
	afx_msg void OnDestroy();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnGetMinMaxInfo(MINMAXINFO FAR* lpMMI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITSENTRANSTRANSFER_H__20F66B41_26FC_11D2_A09E_E12649467D2F__INCLUDED_)
