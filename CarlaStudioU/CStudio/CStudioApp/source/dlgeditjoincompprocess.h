#if !defined(AFX_DLGEDITJOINCOMPPROCESS_H__D1A20B81_02C0_11D2_89BE_0000C035C8C8__INCLUDED_)
#define AFX_DLGEDITJOINCOMPPROCESS_H__D1A20B81_02C0_11D2_89BE_0000C035C8C8__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// dlgeditjoincompprocess.h : header file
//
#include "../resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CDlgEditJoinCompProcess dialog

class CDlgEditJoinCompProcess : public CDialog
{
// Construction
public:
	CDlgEditJoinCompProcess(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditJoinCompProcess)
	enum { IDD = IDD_EditJoinCompProcess };
	CString	m_sAllomorphMarker;
	CString	m_sJoinWordsMarker;
	BOOL	m_bPartialCompoundsOK;
	CString	m_sVariantFormMarker;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditJoinCompProcess)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditJoinCompProcess)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITJOINCOMPPROCESS_H__D1A20B81_02C0_11D2_89BE_0000C035C8C8__INCLUDED_)
