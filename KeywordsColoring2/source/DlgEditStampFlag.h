#if !defined(AFX_DLGEDITSTAMPFLAG_H__78F73741_2C7C_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_DLGEDITSTAMPFLAG_H__78F73741_2C7C_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgEditStampFlag.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgEditStampFlag dialog

class CDlgEditStampFlag : public CDialog
{
// Construction
public:
	CDlgEditStampFlag(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditStampFlag)
	enum { IDD = IDD_EditStampFlag };
	BOOL	m_bEnabled;
	CString	m_sComments;
	CString	m_sFlag;
	CString	m_sMorphemes;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditStampFlag)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditStampFlag)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITSTAMPFLAG_H__78F73741_2C7C_11D2_A09E_E12649467D2F__INCLUDED_)
