#if !defined(AFX_DLGEDITTONEGENPROCESS_H__AA7BDDA1_127E_11D3_8669_8C970CC10000__INCLUDED_)
#define AFX_DLGEDITTONEGENPROCESS_H__AA7BDDA1_127E_11D3_8669_8C970CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgEditToneGenProcess.h : header file
//
// 2.4.1 01-Nov-2000 hab Reworked to handle ToneGen 1.0.0

/////////////////////////////////////////////////////////////////////////////
// CDlgEditToneGenProcess dialog

class CDlgEditToneGenProcess : public CDialog
{
// Construction
public:
	CDlgEditToneGenProcess(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditToneGenProcess)
	enum { IDD = IDD_EditToneGenProcess };
	CButton	m_btnTracingOptions;
	CButton	m_btnControlPath;
	BOOL	m_bMonitorProgress;
	BOOL	m_bVerifyControlFileInformation;
	BOOL	m_bTraceToneProcessing;
	CString	m_sControlFilePath;
	UINT	m_nTracingLevel;
	BOOL	m_bCheckMorphnames;
	BOOL	m_bOutputAllSyntheses;
	BOOL	m_bCheckRootCats;
	BOOL	m_bTraceSynthesis;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditToneGenProcess)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditToneGenProcess)
	afx_msg void OnBUTTONToneGenControlFile();
	afx_msg void OnBUTTONToneGenTraceOptions();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITTONEGENPROCESS_H__AA7BDDA1_127E_11D3_8669_8C970CC10000__INCLUDED_)
