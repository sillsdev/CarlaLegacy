#pragma once

#include "WizBaseClasses.h"
#include "flatbutton.h"
#include "filelistctrl.h"


/////////////////////////////////////////////////////////////////////////////
// CPageDictionaries dialog

class CPageDictionaries : public CWizPage
{
	DECLARE_DYNAMIC(CPageDictionaries)

// Construction
public:
	void addRootDictPathD(CPathDescriptor* pd);
//	 BOOL m_bCanCopyToCtrlDir;
	CPageDictionaries(LPCTSTR lpszTitle,
					   CFileList* pFileList,
					   BOOL bCanCopyToCtrlDir=TRUE);
	~CPageDictionaries();

// Dialog Data
	//{{AFX_DATA(CPageDictionaries)
	enum { IDD = IDD_PageFilesDict };
	CSimpleFlatButton	m_btnAddSuffix;
	CSimpleFlatButton	m_btnAddInfix;
	CSimpleFlatButton	m_btnAddPrefix;
	CFileListCtrl	m_fileListCtrl;
	CSimpleFlatButton	m_btnRemoveRoot;
	CSimpleFlatButton	m_btnAddRoot;
	CString	m_sInfixPath;
	CString	m_sPrefixPath;
	CString	m_sSuffixPath;
//	BOOL	m_bCopyDicts;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageDictionaries)
	public:
	virtual void OnOK();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CString m_sTitle;
	virtual void checkStatus();
	virtual BOOL OnToolTip(UINT id, NMHDR *pTTTStruct, LRESULT *pResult);

	// Generated message map functions
	//{{AFX_MSG(CPageDictionaries)
	afx_msg void OnBTNInfix();
	afx_msg void OnBTNPrefix();
	afx_msg void OnBTNSuffix();
	afx_msg void OnBtnRemoveRoot();
	afx_msg void OnBtnAddRoot();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};