#if !defined(AFX_EDITLISTHEADERCTRL_H__3A1EB322_847B_11D2_864F_C8DF0CC10000__INCLUDED_)
#define AFX_EDITLISTHEADERCTRL_H__3A1EB322_847B_11D2_864F_C8DF0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// guruheaderctrl.h : header file

#include <afxcoll.h>
/////////////////////////////////////////////////////////////////////////////
// CGuruHeaderCtrl window


class CGuruHeaderCtrl : public CHeaderCtrl
{
// Construction
public:
	CGuruHeaderCtrl();

// Attributes
public:
	enum {kDown=0, kUp, kLeft, kRight}; // for eImageStyle
	int	m_nSortCol;
	int	m_eImageStyle;
	//CUIntArray m_colTypes;
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CGuruHeaderCtrl)
	public:
	virtual BOOL Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext = NULL);
	//}}AFX_VIRTUAL
	virtual void DrawItem( LPDRAWITEMSTRUCT lpDrawItemStruct );
	CImageList m_ximageList;

// Implementation
public:
	virtual ~CGuruHeaderCtrl();
	int SetSortImage( int nCol, BOOL bAsc );

	// Generated message map functions
protected:
	//{{AFX_MSG(CGuruHeaderCtrl)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_EDITLISTHEADERCTRL_H__3A1EB322_847B_11D2_864F_C8DF0CC10000__INCLUDED_)
