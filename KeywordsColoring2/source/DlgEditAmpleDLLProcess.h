#if !defined(AFX_DLGEDITAMPLEDLLPROCESS_H__D0B6A680_D629_11D2_8651_183E0CC10000__INCLUDED_)
#define AFX_DLGEDITAMPLEDLLPROCESS_H__D0B6A680_D629_11D2_8651_183E0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgEditAmpleDLLProcess.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgEditAmpleDLLProcess dialog

class CDlgEditAmpleDLLProcess : public CDialog
{
// Construction
public:
	CDlgEditAmpleDLLProcess(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditAmpleDLLProcess)
	enum { IDD = IDD_EditAmpleDLLProcess };
	BOOL	m_bOutputRootGlosses;
	BOOL	m_bTrace;
	int		m_iMaxMorphnameLength;
	CString	m_sTraceMorphs;
	BOOL	m_bCheckMorphnames;
	BOOL	m_bReportAmbig;
	BOOL	m_bWriteDecomp;
	BOOL	m_bWriteWord;
	BOOL	m_bWriteProperties;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditAmpleDLLProcess)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditAmpleDLLProcess)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITAMPLEDLLPROCESS_H__D0B6A680_D629_11D2_8651_183E0CC10000__INCLUDED_)
