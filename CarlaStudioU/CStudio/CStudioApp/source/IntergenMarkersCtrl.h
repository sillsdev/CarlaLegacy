#if !defined(AFX_INTERGENMARKERSCTRL_H__C5728042_9E30_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_INTERGENMARKERSCTRL_H__C5728042_9E30_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// IntergenMarkersCtrl.h : header file
//
class CIntergenMarker;
class CIntergenProcess;

/////////////////////////////////////////////////////////////////////////////
// CIntergenMarkersCtrl window
#include "EditListCtrl.h"
class CIntergenMarkersCtrl : public CEditListCtrl
{
// Construction
public:
	CIntergenMarkersCtrl(CIntergenProcess* pIntergenProces);

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CIntergenMarkersCtrl)
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	void onOK();
	virtual void populate();
	void addItem(CIntergenMarker* pMarker);
	virtual ~CIntergenMarkersCtrl();

	// Generated message map functions
protected:
	CIntergenProcess* m_pIntergenProcess;
	virtual void setItemText(int nItem, int nSubItem, LPCTSTR pszText);
	virtual CString getItemText(LPARAM lp, int nCol);
	CImageList m_imageList;
	virtual void makeImageList();
	virtual void makeColumns();
	//{{AFX_MSG(CIntergenMarkersCtrl)
	afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_INTERGENMARKERSCTRL_H__C5728042_9E30_11D2_864F_AC380CC10000__INCLUDED_)
