// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse
// 2.1.8 26-May-2000 hab Add manual parse to QP

#if !defined(AFX_QUICKPARSEVIEW_H__EAC54CC1_585C_11D2_864E_444553540000__INCLUDED_)
#define AFX_QUICKPARSEVIEW_H__EAC54CC1_585C_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// QuickParseView.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CQuickParseView form view

#ifndef __AFXEXT_H__
#include <afxext.h>
#endif

class CAmpleDLLProcess;
class CProcessStatus;
#ifndef hab218
class CAlloResult;
class CAllo;
class CCarlaLanguage;
#endif // hab218

class CQuickParseView : public CFormView
{
protected:
	CQuickParseView();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CQuickParseView)

// Form Data
public:
	//{{AFX_DATA(CQuickParseView)
	enum { IDD = IDD_QuickParse };
	BOOL	m_bTrace;
	CString	m_sInput;
	CString	m_sOutput;
	CString	m_sTraceMorphs;
	BOOL	m_bManualParse;
	//}}AFX_DATA

// Attributes
public:

// Operations
public:
	BOOL m_bManualRefreshPending;
	BOOL m_bDidRefresh;
	void languageChanged();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CQuickParseView)
	public:
	virtual void OnInitialUpdate();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual BOOL OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult);
	virtual void OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint);
	//}}AFX_VIRTUAL

// Implementation
protected:
	CTime m_lastPreprocessTime;
	BOOL getNeedDictPreprocessing(CProcessStatus& status);
	BOOL preprocessDicts(CProcessStatus* pStatus);	// jdh 3/13/2000
	void setFonts();
	void loadAmpleOptions();
	CAmpleDLLProcess* m_pAmpleProcess;
	void prepareAmpleProcess();
	virtual ~CQuickParseView();
#ifndef hab218
	void getManualParse(CProcessStatus &status, CString &sPath, CCarlaLanguage* pSourceLang);
	CString & getUserChoice(CString &sAlloResults, CString &sInput);
	CString m_sResult;
	CAlloResult * m_pAlloResult;
	CAllo * m_pAlloChosen;
#endif

#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
	//{{AFX_MSG(CQuickParseView)
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnEditPaste();
	afx_msg void OnUpdateEditPaste(CCmdUI* pCmdUI);
	afx_msg void OnEditCopy();
	afx_msg void OnUpdateEditCopy(CCmdUI* pCmdUI);
	afx_msg void OnQuickParseGo();
	afx_msg void OnUpdateQuickParseGo(CCmdUI* pCmdUI);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnEditDelete();
	afx_msg void OnViewErrors();
	afx_msg void OnCHECKTrace();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_QUICKPARSEVIEW_H__EAC54CC1_585C_11D2_864E_444553540000__INCLUDED_)
