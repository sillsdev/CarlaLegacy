// GuruSplash.h: interface for the CGuruSplash class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_GURUSPLASH_H__F3B3C2C1_9340_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_GURUSPLASH_H__F3B3C2C1_9340_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CGuruSplash : public CWnd
{

// Construction
public:
	CGuruSplash(UINT nBitmapID, UINT nDuration = 2500);

// Attributes
public:
	BOOL Create();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMySplashWnd)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	//}}AFX_VIRTUAL

// Implementation
public:

	// Generated message map functions
protected:
	//{{AFX_MSG(CMySplashWnd)
	afx_msg void OnPaint();
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

protected:
	BOOL GetBitmapAndPalette(UINT nIDResource, CBitmap &bitmap, CPalette &pal);

protected:
	UINT m_nBitmapID;
	UINT m_nDuration;
	UINT m_nTimerID;
	CBitmap m_bitmap;
	CPalette m_pal;
	CWnd m_wndInvisible;
};

#endif // !defined(AFX_GURUSPLASH_H__F3B3C2C1_9340_11D2_864F_AC380CC10000__INCLUDED_)
