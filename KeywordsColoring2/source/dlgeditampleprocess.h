#if !defined(AFX_DLGEDITAMPLEPROCESS_H__57CB1461_FF6D_11D1_89BE_0000C035C8C8__INCLUDED_)
#define AFX_DLGEDITAMPLEPROCESS_H__57CB1461_FF6D_11D1_89BE_0000C035C8C8__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgEditAmpleProcess.h : header file
//
//#include "CARLAStudioApp.h"	// for globals
#include "../resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CDlgEditAmpleProcess dialog

class CDlgEditAmpleProcess : public CDialog
{
// Construction
public:
	CDlgEditAmpleProcess(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditAmpleProcess)
	enum { IDD = IDD_EditAmpleProcess };
	BOOL m_bCheckMorphnames;
	int m_iMaxMorphnameLength;
	BOOL m_bOutputRootGlosses;
	BOOL m_bPrintTestParseTrees;
	BOOL m_bReportAmbiguityPercentages;
	BOOL m_bWriteDecompField;
	BOOL m_bWritePField;
	BOOL m_bWriteWordField;
	BOOL	m_bTrace;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditAmpleProcess)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditAmpleProcess)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITAMPLEPROCESS_H__57CB1461_FF6D_11D1_89BE_0000C035C8C8__INCLUDED_)
