// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse

#if !defined(AFX_QUICKPARSEDOC_H__EB7262A1_52EB_11D2_864E_444553540000__INCLUDED_)
#define AFX_QUICKPARSEDOC_H__EB7262A1_52EB_11D2_864E_444553540000__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// QuickParseDoc.h : header file
//
class CCarlaLanguage;
class CQuickParseView;

/////////////////////////////////////////////////////////////////////////////
// CQuickParseDoc document
class CQuickParseDoc : public CDocument
{
protected:
	CQuickParseDoc();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CQuickParseDoc)

// Attributes
public:
	static CString getRegFileTypeID() {return "QuickParse";}

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CQuickParseDoc)
	public:
	virtual void SetTitle(LPCTSTR lpszTitle);
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	void setView(CQuickParseView* pV);
	void setup(CCarlaLanguage* pSrcLang);
	virtual ~CQuickParseDoc();
	CCarlaLanguage* m_pSourceLang;

	// Generated message map functions
protected:
	CQuickParseView* m_pQPView;
	//{{AFX_MSG(CQuickParseDoc)
	afx_msg void OnQuickParseChangeLang();
	afx_msg void OnUpdateQuickParseChangeLang(CCmdUI* pCmdUI);
	afx_msg void OnQuickParseRefreshRequest();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_QUICKPARSEDOC_H__EB7262A1_52EB_11D2_864E_444553540000__INCLUDED_)
