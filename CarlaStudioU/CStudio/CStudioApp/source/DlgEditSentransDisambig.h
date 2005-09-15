 #if !defined(AFX_DLGEDITSENTRANSDISAMBIG_H__98FFB2A1_22CD_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_DLGEDITSENTRANSDISAMBIG_H__98FFB2A1_22CD_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgEditSentransDisambig.h : header file
//
#include "DlgEnvConstrainedRule.h"
#include "sdfedit.h"
#include "ResizingUtils.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransDisambig dialog

class CDlgEditSentransDisambig : public CDlgEnvConstrainedRule
{
// Construction
public:
	CDlgEditSentransDisambig(const CTextDisplayInfo* pTDI);

// Dialog Data
	//{{AFX_DATA(CDlgEditSentransDisambig)
	enum { IDD = IDD_EditSentransDisambig };
	CString	m_sComments;
	BOOL	m_bEnabled;
	CString	m_sMembers;
	int		m_iAcceptReject;
	BOOL	m_bUnanimousEnvirons;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditSentransDisambig)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	void vSize(int cx, int cy);
	// Generated message map functions
	//{{AFX_MSG(CDlgEditSentransDisambig)
	afx_msg void OnJump();
	virtual BOOL OnInitDialog();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnDestroy();
	afx_msg void OnGetMinMaxInfo(MINMAXINFO FAR* lpMMI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITSENTRANSDISAMBIG_H__98FFB2A1_22CD_11D2_A09E_E12649467D2F__INCLUDED_)
