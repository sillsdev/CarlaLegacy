#if !defined(AFX_DLGEDITTONEPARSEPROCESS_H__AA7BDDA1_127E_11D3_8669_8C970CC10000__INCLUDED_)
#define AFX_DLGEDITTONEPARSEPROCESS_H__AA7BDDA1_127E_11D3_8669_8C970CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgEditToneParseProcess.h : header file
//
// jdh 2/9/00 added m_sAnswerFile
// 2.0.5 10-Feb-2000 hab Added -v option to verify control file information
// 2.4.1 01-Nov-2000 hab Reworked to handle TonePars 1.0.0

/////////////////////////////////////////////////////////////////////////////
// CDlgEditToneParseProcess dialog

class CDlgEditToneParseProcess : public CDialog
{
// Construction
public:
	CDlgEditToneParseProcess(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditToneParseProcess)
	enum { IDD = IDD_EditToneParseProcess };
	CButton	m_btnTracingOptions;
	CButton	m_btnControlPath;
	BOOL	m_bMonitorProgress;
	BOOL	m_bVerifyControlFileInformation;
	BOOL	m_bTraceToneProcessing;
	CString	m_sControlFilePath;
	UINT	m_nTracingLevel;
	BOOL	m_bCheckMorphnames;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditToneParseProcess)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditToneParseProcess)
	afx_msg void OnBUTTONToneParsControlFile();
	afx_msg void OnBUTTONToneParsTraceOptions();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITTONEPARSEPROCESS_H__AA7BDDA1_127E_11D3_8669_8C970CC10000__INCLUDED_)
