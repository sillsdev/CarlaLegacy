#if !defined(AFX_CWLISTCTRL_H__3D3D2905_823D_11D2_864F_C8DF0CC10000__INCLUDED_)
#define AFX_CWLISTCTRL_H__3D3D2905_823D_11D2_864F_C8DF0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// CWListCtrl.h : header file
//
// 2.4.1 20-Oct-2000 hab Do not do in-place edit on comments and test data
#include "EditListCtrl.h"
class CWListView;

/////////////////////////////////////////////////////////////////////////////
// CWListCtrl window

class CWListCtrl : public CEditListCtrl
{
// Construction
public:
	CWListCtrl();

// Attributes
public:

// Operations
public:
	virtual void DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWListCtrl)
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual CString getItemText(int nRow, int nCol);
	virtual ~CWListCtrl();

	// Generated message map functions
protected:
	virtual void drawItemText(CDC* pDC, int nRow, int nCol, LPCTSTR pszStr, CRect &rect, UINT nJustifyFlag);
	virtual int getLargestFontHeight();
	virtual void addNewItem();
	virtual void makeImageList();
	virtual void activateItem(LPARAM lpItem, int index);
	virtual CFont* getFontForSubItem(int nItem, int nCol);
	virtual void listModified();
	virtual void finishDrag(int iFrom, int iTo);
	CWListView* getParent();
	//{{AFX_MSG(CWListCtrl)
	afx_msg void OnGetdispinfo(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnParentNotify(UINT message, LPARAM lParam);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
	virtual void setItemText(int nItem, int nSubItem, LPCTSTR pszText);
#ifndef hab241
	virtual int getItemType(int nItem);
#endif // hab241
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CWLISTCTRL_H__3D3D2905_823D_11D2_864F_C8DF0CC10000__INCLUDED_)
