//{{AFX_INCLUDES()
//#include "msflexgrid.h"
//}}AFX_INCLUDES
#if !defined(AFX_DLGENVIRONMENTS_H__2E3A43A5_3528_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_DLGENVIRONMENTS_H__2E3A43A5_3528_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgEnvironments.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgEnvironments dialog

class CDlgEnvironments : public CDialog
{
// Construction
public:
	CDlgEnvironments(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEnvironments)
	enum { IDD = IDD_Environments};
//	CMSFlexGrid	m_grid;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEnvironments)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEnvironments)
	afx_msg void Ontest();
	afx_msg void OnKeyDownMsflexgrid1(short FAR* KeyCode, short Shift);
	DECLARE_EVENTSINK_MAP()
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGENVIRONMENTS_H__2E3A43A5_3528_11D2_A09E_E12649467D2F__INCLUDED_)
