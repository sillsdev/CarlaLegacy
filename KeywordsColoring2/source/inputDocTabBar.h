#if !defined(AFX_InputDocTabBar_H__9DE7FE82_1738_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_InputDocTabBar_H__9DE7FE82_1738_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// InputDocTabBar.h : header file
//
class CInputDocView;

/////////////////////////////////////////////////////////////////////////////
// CInputDocTabBar window

class CInputDocTabBar : public CTabCtrl
{
// Construction
public:
	CInputDocTabBar();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CInputDocTabBar)
	public:
	protected:
	virtual BOOL OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult);
	//}}AFX_VIRTUAL
//	BOOL OnToolTip(UINT id, NMHDR *pTTTStruct, LRESULT *pResult);

// Implementation
public:
	void setOwner(CInputDocView* pOwner);
	CInputDocView* m_pOwner;
	virtual ~CInputDocTabBar();

	// Generated message map functions
protected:
	void OnTextChanged();
	//{{AFX_MSG(CInputDocTabBar)
	afx_msg void OnSelchange(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDestroyClipboard();
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_InputDocTabBar_H__9DE7FE82_1738_11D2_A09E_E12649467D2F__INCLUDED_)
