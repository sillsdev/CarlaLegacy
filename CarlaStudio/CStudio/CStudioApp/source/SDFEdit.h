#if !defined(AFX_SDFEDIT_H__4B74B7C0_CB23_11D2_8650_DC3D0CC10000__INCLUDED_)
#define AFX_SDFEDIT_H__4B74B7C0_CB23_11D2_8650_DC3D0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SDFEdit.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSDFEdit window

class CSDFEdit : public CEdit
{
// Construction
public:
	CSDFEdit();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSDFEdit)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CSDFEdit();

	// Generated message map functions
protected:
	//{{AFX_MSG(CSDFEdit)
	afx_msg void OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct);
	afx_msg void OnPaint();
	afx_msg void OnUpdate();
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SDFEDIT_H__4B74B7C0_CB23_11D2_8650_DC3D0CC10000__INCLUDED_)
