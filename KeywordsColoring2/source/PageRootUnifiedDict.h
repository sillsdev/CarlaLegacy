// jdh 19Sept2000 fixed cancel button

#if !defined(AFX_PAGEROOTUNIFIEDDICT_H__A30E7B80_94C1_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_PAGEROOTUNIFIEDDICT_H__A30E7B80_94C1_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// PageRootUnifiedDict.h : header file
//
#include "WizBaseClasses.h"
#include "flatbutton.h"
#include "filelistctrl.h"

/////////////////////////////////////////////////////////////////////////////
// CPageRootUnifiedDict dialog
class CPageDictAffixes;

class CPageRootUnifiedDict : public CWizPage
{
	DECLARE_DYNAMIC(CPageRootUnifiedDict)

// Construction
public:
	void setModeAndManageAffixPage(CPropertySheet* pSheet,BOOL bUnifiedMode);
	void setLabelMode(CPropertySheet* ps, BOOL bIsUnified);
	void addRootDictPathD(CPathDescriptor *pd);
	CPageRootUnifiedDict(  CFileList* pRootFileList,
						   BOOL bUnifiedMode,
						   CPageDictAffixes* pPageAffixDicts,
						   LPCTSTR pszTitleUnified=NULL,
						   LPCTSTR pszTitleClassic=NULL);
	~CPageRootUnifiedDict();
	BOOL m_bUnifiedMode;

// Dialog Data
	//{{AFX_DATA(CPageRootUnifiedDict)
	enum { IDD = IDD_PageDictRootUnified };
	CSimpleFlatButton	m_btnRemoveDict;
	CSimpleFlatButton	m_btnAddDict;
	CFileListCtrl	m_fileListCtrl;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageRootUnifiedDict)
	public:
	virtual void OnOK();
	virtual void OnCancel();	// jdh 19Sept2000
	virtual BOOL OnSetActive();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CPageDictAffixes* m_pPageAffixDicts;
	void OnBtnDictMethod();
	virtual void checkStatus();
	BOOL OnToolTip(UINT id, NMHDR *pTTTStruct, LRESULT *pResult);
	// Generated message map functions
	//{{AFX_MSG(CPageRootUnifiedDict)
	virtual BOOL OnInitDialog();
	afx_msg void OnBtnAddRoot();
	afx_msg void OnBtnRemove();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGEROOTUNIFIEDDICT_H__A30E7B80_94C1_11D2_864F_AC380CC10000__INCLUDED_)
