#if !defined(AFX_PAGEFINALCATTEST_H__F3B3C2C5_9340_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_PAGEFINALCATTEST_H__F3B3C2C5_9340_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// PageFinalCatTest.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CPageFinalCatTest dialog

class CPageFinalCatTest : public CPropertyPage
{
	DECLARE_DYNCREATE(CPageFinalCatTest)

// Construction
public:
	CPageFinalCatTest();
	~CPageFinalCatTest();

// Dialog Data
	//{{AFX_DATA(CPageFinalCatTest)
	enum { IDD = IDD_PageCatFinalTest };
	BOOL	m_bCreateFinalCatTest;
	BOOL	m_bDisableFinalCatTest;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageFinalCatTest)
	public:
	virtual BOOL OnSetActive();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CPageFinalCatTest)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGEFINALCATTEST_H__F3B3C2C5_9340_11D2_864F_AC380CC10000__INCLUDED_)
