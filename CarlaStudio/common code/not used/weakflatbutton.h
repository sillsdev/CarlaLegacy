#if !defined(AFX_FLATBUTTON_H__291C7E61_90D6_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_FLATBUTTON_H__291C7E61_90D6_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// flatbutton.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CFlatButton window


class CFlatButton : public CButton
{

// Construction

	public:
	BOOL m_bLBtnDown;
	CBrush m_brBackground;
	COLORREF m_crText;
	CFlatButton();
	void SetBkgndColor (COLORREF rgb);
	void SetTextColor (COLORREF rgb);
	void SetBitmap (UINT);

	// Attributes

	public:

	// Operations

	public:

	// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFlatButton)
	public:
	virtual void DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct);
	//}}AFX_VIRTUAL

	// Implementation

	protected:

		COLORREF m_clrBack;
		COLORREF m_clrText;
		UINT m_idBitmap;


	public:
		UINT m_idCursor;
		void SetCursor (UINT idCursor);
	virtual ~CFlatButton();

	// Generated message map functions

	protected:
	//{{AFX_MSG(CFlatButton)
	afx_msg HBRUSH CtlColor(CDC* pDC, UINT nCtlColor);
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};


//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FLATBUTTON_H__291C7E61_90D6_11D2_864F_AC380CC10000__INCLUDED_)
