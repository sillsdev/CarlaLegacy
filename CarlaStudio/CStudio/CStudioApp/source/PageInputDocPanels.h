#if !defined(AFX_PAGEINPUTDOCPANELS_H__8B1EF3E1_3B36_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_PAGEINPUTDOCPANELS_H__8B1EF3E1_3B36_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// PageInputDocPanels.h : header file
//
#include "afxwin.h"
class CResultStreamDescriptor;
#include "processoutput.h"

/////////////////////////////////////////////////////////////////////////////
// CPageInputDocPanels dialog

class CPanelListBox : public CCheckListBox
{
public: CPanelListBox()
			: CCheckListBox() {}
		 BOOL Create( DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID );

};

class CPageInputDocPanels : public CPropertyPage
{
// Construction
public:
	CPageInputDocPanels(CResultDescriptorArray* pDescriptors, CArray<bool, bool> * ppanelAvailability=NULL);

// Dialog Data
	//{{AFX_DATA(CPageInputDocPanels)
	enum { IDD = IDD_PageInputDocPanels };
	CPanelListBox	m_panelList;
	CString	m_sPanelDetails;
	BOOL	m_bShowAvailableOnly;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPageInputDocPanels)
	public:
	virtual void WinHelp(DWORD dwData, UINT nCmd = HELP_CONTEXT);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	BOOL m_bDoReloadList;
	CArray<bool, bool> * m_ppanelAvailability;
	CResultDescriptorArray* m_pDescriptors;
	// Generated message map functions
	//{{AFX_MSG(CPageInputDocPanels)
	virtual BOOL OnInitDialog();
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnCancelMode();
	afx_msg void OnSelchangePanelList();
	afx_msg void OnAvailableOnlyButton();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGEINPUTDOCPANELS_H__8B1EF3E1_3B36_11D2_A09E_E12649467D2F__INCLUDED_)
