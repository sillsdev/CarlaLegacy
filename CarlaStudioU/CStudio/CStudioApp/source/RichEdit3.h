#pragma once

#include <afxcmn.h>     // for the base class

// subclassing CRichEditCtrl to correct faulty behavior when using CRichEditCtrl for Rich
//  Edit version 3.0
class CRichEdit3Ctrl : public CRichEditCtrl
{
	DECLARE_SERIAL(CRichEdit3Ctrl)
public:
	CRichEdit3Ctrl();
	virtual ~CRichEdit3Ctrl();
	BOOL Create(DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID);

	// these functions mimic the CEdit interface (so we don't need to change existing code,
	//  while changing to CRichEditCtrl)
	void SetSel(DWORD dwSelection, BOOL bNoScroll = FALSE);
	void SetSel(int nStartChar, int nEndChar, BOOL bNoScroll = FALSE);
	int GetWindowText(LPTSTR lpszStringBuf, int nMaxCount, UINT codepage, DWORD dwFlags = GT_USECRLF) const;
	void GetWindowText(CString& rString, UINT codepage) const;
	void SetWindowText(LPCTSTR lpszString, UINT codepage, DWORD dwFlags = ST_SELECTION );
	int GetWindowTextLength(UINT codepage, DWORD dwFlags = GTL_NUMBYTES | GTL_USECRLF ) const;
	CString GetSelText(UINT codepage) const;

	// but these are the new versions people *should* be using for CRichEdit
	void SetSel(CHARRANGE &cr) { CRichEditCtrl::SetSel(cr); };

protected:
	// protect these version, so we can prevent code from calling this mindlessly
	// (you should really be using the above versions)
	int GetWindowText(LPTSTR lpszStringBuf, int nMaxCount) const;
	void GetWindowText(CString& rString) const;
	void SetWindowText(LPCTSTR lpszString);
	int GetWindowTextLength() const;
	CString GetSelText() const;
};

// this class is specifically designed to be a swap in replacement for CEdit. It implements
//  the same functionality that CEdit gave (so you don't have to change existing code that,
//  but modifies it for a) the CRichEdit3 interface and b) support unicode. It is specifically
//  (though not necessarily) meant for giving non-unicode apps, unicode support for their
//  CEdit controls.
class CRichEdit : public CRichEdit3Ctrl
{
	DECLARE_SERIAL(CRichEdit)
	CRichEdit() : m_cp(CP_ACP) {};  // need default ctor for DECLARE_SERIAL
public:
	// must give the ctor the code page that we'll use for subsequent calls, but the rest
	//  of the CEdit i/f should be the same as CEdit.
	CRichEdit(UINT codepage) : m_cp(codepage) {};
	virtual ~CRichEdit() {};
	BOOL CreateEx(DWORD dwExStyle, LPCTSTR lpszClassName,
		LPCTSTR lpszWindowName, DWORD dwStyle,
		int x, int y, int nWidth, int nHeight,
		HWND hWndParent, HMENU nIDorHMenu, LPVOID lpParam = NULL);

	// these are the CEdit methods that we're providing support for. If your existing CEdit
	//  code calls other methods that are differently implemented in CRichEdit(3) and/or
	//  don't take into account unicode data, then you should add your calls here.
	int GetWindowText(LPTSTR lpszStringBuf, int nMaxCount) const
		{ return CRichEdit3Ctrl::GetWindowText(lpszStringBuf, nMaxCount, m_cp); };
	void GetWindowText(CString& rString) const
		{ CRichEdit3Ctrl::GetWindowText(rString, m_cp); };
	void SetWindowText(LPCTSTR lpszString)
		{ CRichEdit3Ctrl::SetWindowText(lpszString, m_cp); };
	int GetWindowTextLength() const
		{ return CRichEdit3Ctrl::GetWindowTextLength(m_cp); };
	CString GetSelText() const
		{ return CRichEdit3Ctrl::GetSelText(m_cp); };
	void SetLimitText(UINT nMax);

protected:
	UINT    m_cp;
};
