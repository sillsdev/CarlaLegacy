#if !defined(AFX_PAGEDISCLAIMER_H__AF29DF03_CA35_11D2_864F_DC3D0CC10000__INCLUDED_)
#define AFX_PAGEDISCLAIMER_H__AF29DF03_CA35_11D2_864F_DC3D0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// PageDisclaimer.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CPageDisclaimer dialog

class CPageDisclaimer : public CPropertyPage
{
	DECLARE_DYNCREATE(CPageDisclaimer)

// Construction
public:
	CPageDisclaimer();
	~CPageDisclaimer();

// Dialog Data
	//{{AFX_DATA(CPageDisclaimer)
	enum { IDD = IDD_PageDisclaimer };
		// NOTE - ClassWizard will add data members here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageDisclaimer)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CPageDisclaimer)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGEDISCLAIMER_H__AF29DF03_CA35_11D2_864F_DC3D0CC10000__INCLUDED_)
