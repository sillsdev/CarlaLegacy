#if !defined(AFX_PAGEAFFIXES_H__F3B3C2C3_9340_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_PAGEAFFIXES_H__F3B3C2C3_9340_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// PageAffixes.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CPageAffixes dialog

class CPageAffixes : public CPropertyPage
{
	DECLARE_DYNCREATE(CPageAffixes)

// Construction
public:
	CPageAffixes(UINT nIDTemplate=CPageAffixes::IDD, UINT nIDCaption=0);// jdh 6/3/99
	~CPageAffixes();

// Dialog Data
	//{{AFX_DATA(CPageAffixes)
	enum { IDD = IDD_PageAffixes };
	BOOL	m_bInfixes;
	BOOL	m_bPrefixes;
	BOOL	m_bSuffixes;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageAffixes)
	public:
	virtual BOOL OnSetActive();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	void checkStatus();
	// Generated message map functions
	//{{AFX_MSG(CPageAffixes)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGEAFFIXES_H__F3B3C2C3_9340_11D2_864F_AC380CC10000__INCLUDED_)
