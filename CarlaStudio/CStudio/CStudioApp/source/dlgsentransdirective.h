#if !defined(AFX_CDlgSentransDirective_H__336A01C3_3CB8_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_CDlgSentransDirective_H__336A01C3_3CB8_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// CDlgSentransDirective.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgSentransDirective dialog

class CTextDisplayInfo;

class CDlgSentransDirective : public CDialog
{
// Construction
public:
	CDlgSentransDirective(const CTextDisplayInfo* pTDI, CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgSentransDirective)
	enum { IDD = IDD_EditSentransDirective };
	int		m_iLimit;
	CString	m_sComments;
	BOOL	m_bEnabled;
	int		m_iType;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgSentransDirective)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	const CTextDisplayInfo* m_pTDI;

	// Generated message map functions
	//{{AFX_MSG(CDlgSentransDirective)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CDlgSentransDirective_H__336A01C3_3CB8_11D2_A09E_E12649467D2F__INCLUDED_)
