#if !defined(AFX_FLATBUTTON_H__291C7E63_90D6_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_FLATBUTTON_H__291C7E63_90D6_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// flatbutton.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSimpleFlatButton window


class CSimpleFlatButton : public CButton
{
	 DECLARE_DYNAMIC(CSimpleFlatButton)
private:
	UINT m_nBitmapID;
	 bool m_bRaised;
	 bool m_bDrawBackground;
public:
	BOOL m_bMonichromeWhenIdle;
	void SetBitmap(UINT nID);
	 CSimpleFlatButton()
		  : CButton()
		  , m_bRaised(false)  // internal only
		  , m_bDrawBackground(true)      // internal only
		  , m_nBitmapID(0)
		  , m_bMonichromeWhenIdle(FALSE)
	 {}

	 // drawing
protected:
	 virtual void DrawText(CDC* pDC, const CRect& rect, LPCTSTR text, UINT state=0);
	 virtual void DrawBorders(CDC* pDC, CRect& rect, UINT state=0);
	 virtual void Draw(CDC* pDC, const CRect& rect, UINT state=0);

protected:
	 //{{AFX_MSG(CSimpleFlatButton)
	 afx_msg BOOL OnEraseBkgnd(CDC* pDC);
	 afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	 afx_msg LONG OnMouseLeave(WPARAM, LPARAM);
	 //}}AFX_MSG
	 //{{AFX_VIRTUAL(CSimpleFlatButton)
	 virtual void PreSubclassWindow();
	 virtual void DrawItem(LPDRAWITEMSTRUCT lpDIS);
	 //}}AFX_VIRTUAL
	 DECLARE_MESSAGE_MAP();
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FLATBUTTON_H__291C7E63_90D6_11D2_864F_AC380CC10000__INCLUDED_)
