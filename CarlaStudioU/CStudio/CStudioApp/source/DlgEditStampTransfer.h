#if !defined(AFX_DLGEDITSTAMPTRANSFER_H__9EA5E641_2C3F_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_DLGEDITSTAMPTRANSFER_H__9EA5E641_2C3F_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgEditStampTransfer.h : header file
#include "DlgEnvConstrainedRule.h"


/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampTransfer dialog

class CDlgEditStampTransfer : public CDlgEnvConstrainedRule
{
// Construction
public:
	CDlgEditStampTransfer(const CTextDisplayInfo* pTDI);

// Dialog Data
	//{{AFX_DATA(CDlgEditStampTransfer)
	enum { IDD = IDD_EditStampTransferRule };
	BOOL	m_bEnabled;
	CString	m_sComments;
	CString	m_sFrom;
	int		m_iType;
	CString	m_sTo;
	CString	m_sFlags;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditStampTransfer)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	void manageEnabling();

	// Generated message map functions
	//{{AFX_MSG(CDlgEditStampTransfer)
	afx_msg void OnRadio();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITSTAMPTRANSFER_H__9EA5E641_2C3F_11D2_A09E_E12649467D2F__INCLUDED_)
