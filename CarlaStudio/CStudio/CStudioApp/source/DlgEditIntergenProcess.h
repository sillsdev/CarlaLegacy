// 2.1.5 28-Mar-2000 hab Added apply output changes as a boolean
//////////////////////////////////////////////////////////////////

#if !defined(AFX_DLGEDITINTERGENPROCESS_H__756E4DA1_0145_11D2_89BE_0000C035C8C8__INCLUDED_)
#define AFX_DLGEDITINTERGENPROCESS_H__756E4DA1_0145_11D2_89BE_0000C035C8C8__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// DlgEditIntergenProcess.h : header file
//
#include "../resource.h"       // main symbols
#include "IntergenMarkersCtrl.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgEditIntergenProcess dialog
class CIntergenProcess;

class CDlgEditIntergenProcess : public CDialog
{
// Construction
public:
	CDlgEditIntergenProcess(CIntergenProcess* pIntergenProcess);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditIntergenProcess)
	enum { IDD = IDD_EditIntergenProcess };
	CIntergenMarkersCtrl	m_fieldList;
	CString	m_sDecompChar;
	BOOL	m_bUseSFMarkers;
	UINT	m_iMaxLineLength;
	BOOL	m_bAllDecompAmbiguities;
	BOOL	m_bApplyOutputChanges;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditIntergenProcess)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditIntergenProcess)
	virtual BOOL OnInitDialog();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITINTERGENPROCESS_H__756E4DA1_0145_11D2_89BE_0000C035C8C8__INCLUDED_)
