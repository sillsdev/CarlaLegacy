// rde271 15-Jul-02 In an effort to make most of CS work for unicode even in a non-unicode
//  build, added a few new classes (CRichEdit3Ctrl--to encapsulate the RichEdit 3 changes)
//  and CRichEdit which is designed to be a swap in replacement for CEdit. It implements
//  the same functionality that CEdit gave (so you don't have to change existing code, but
//  modifies it for a) the CRichEdit3 interface and b) unicode support. It is specifically
//  (though not necessarily) meant for giving non-unicode apps, unicode support for their
//  CEdit controls.

#include "stdafx.h"
#include "RichEdit3.h"
#include <malloc.h> // for alloca

// _RICHEDIT_VER is defined in Stdafx.h (where it must be defined as 3.0 before certain
//  system include files). It must be there for this code to work correctly.
#if(_RICHEDIT_VER < 0x0300)
#pragma message("This control uses EM_SETTEXTEX which requires RichEdit 3.0")
#endif

IMPLEMENT_SERIAL(CRichEdit3Ctrl, CRichEditCtrl, 1)   // for RUNTIMECLASS()

CRichEdit3Ctrl::CRichEdit3Ctrl()
{
}

CRichEdit3Ctrl::~CRichEdit3Ctrl()
{
}

BOOL CRichEdit3Ctrl::Create(DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID)
{
	// the RichEdit 3.0 class name is different from the MFC provided by CRichEditCtrl
	//  (it's defined in RichEdit.h)
	BOOL b = CWnd::Create(RICHEDIT_CLASS, NULL, dwStyle, rect, pParentWnd, nID);
	return b;
}

void CRichEdit3Ctrl::SetSel(DWORD dwSelection, BOOL /* bNoScroll */ )
{
	//REVIEW: not sure if anything needs to be done about bNoScroll...
	CHARRANGE cr;
	cr.cpMin = (dwSelection & 0xFFFF);
	cr.cpMax = (dwSelection >> 16);
	CRichEditCtrl::SetSel(cr);
}

void CRichEdit3Ctrl::SetSel(int nStartChar, int nEndChar, BOOL /* bNoScroll */ )
{
	//REVIEW: not sure if anything needs to be done about bNoScroll...
	CRichEditCtrl::SetSel( nStartChar, nEndChar );
}

void CRichEdit3Ctrl::SetWindowText(LPCTSTR lpszString, UINT	codepage, DWORD dwFlags /* = ST_SELECTION */ )
{
	SETTEXTEX   st;
	st.codepage = codepage;
	st.flags = dwFlags;
	SendMessage(EM_SETTEXTEX, (WPARAM)&st, (LPARAM)lpszString);
}

void CRichEdit3Ctrl::GetWindowText(CString& rString, UINT codepage) const
{
	int nLen = GetWindowTextLength(codepage);
	GetWindowText(rString.GetBuffer(nLen+1),nLen,codepage);
	rString.ReleaseBuffer();
}

int CRichEdit3Ctrl::GetWindowText(LPTSTR lpszStringBuf, int nMaxCount, UINT codepage, DWORD dwFlags /* = GT_USECRLF */ ) const
{
	GETTEXTEX gt; memset(&gt,0,sizeof(gt));
	gt.cb = nMaxCount;
	gt.flags = dwFlags;
	gt.codepage = codepage;
	// gotta use the global scope SendMessage, because this method is const, but SendMessage isn't
	return ::SendMessage(m_hWnd, EM_GETTEXTEX, (WPARAM)&gt, (LPARAM)lpszStringBuf);
}

// since this is an ansi app, we want the # of bytes (i.e. GTL_NUMBYTES) and, by default,
//  we'll use the 'convert CRs to CR/LFs' in the GetText routine, so use that (i.e.
//  GTL_USECRLF) here to calculate the size (or the allocated memory for the text will be
//  too small!)
int CRichEdit3Ctrl::GetWindowTextLength(UINT codepage, DWORD dwFlags /* = GTL_NUMBYTES | GTL_USECRLF */ ) const
{
	GETTEXTLENGTHEX gtl;
	gtl.codepage = codepage;
	gtl.flags = dwFlags;
	return ::SendMessage(m_hWnd, EM_GETTEXTLENGTHEX, (WPARAM)&gtl, 0);
}

CString CRichEdit3Ctrl::GetSelText(UINT codepage) const
{
	ASSERT(::IsWindow(m_hWnd));
	CHARRANGE cr = { 0, 0 };
	GetSel(cr);

	int nCharSize = (codepage == CP_ACP) ? 1 : 2;
	int nSize = (cr.cpMax - cr.cpMin + 1) * nCharSize;
	LPTSTR lpsz = (LPTSTR)_alloca(nSize);
	lpsz[0] = NULL;

	GETTEXTEX gt;
	gt.cb = nSize;
	gt.flags = GT_DEFAULT;
	gt.codepage = codepage;
	gt.lpDefaultChar = NULL;
	gt.lpUsedDefChar = NULL;
	::SendMessage(m_hWnd, EM_GETSELTEXT, (WPARAM)&gt, (LPARAM)lpsz);
	return lpsz;
}

//=====================================for CRichEdit=====================================//
IMPLEMENT_SERIAL(CRichEdit, CRichEdit3Ctrl, 1)   // for RUNTIMECLASS()

BOOL CRichEdit::CreateEx(DWORD dwExStyle, LPCTSTR lpszClassName,
	LPCTSTR lpszWindowName, DWORD dwStyle,
	int x, int y, int nWidth, int nHeight,
	HWND hWndParent, HMENU nIDorHMenu, LPVOID lpParam)
{
	// the class name should be RICHEDIT_CLASS
	ASSERT( CString(lpszClassName) == RICHEDIT_CLASS );

	return CWnd::CreateEx(dwExStyle, lpszClassName, lpszWindowName, dwStyle,
					x, y, nWidth, nHeight, hWndParent, nIDorHMenu, lpParam);
}

void CRichEdit::SetLimitText(UINT nMax)
{
	SendMessage(EM_EXLIMITTEXT, 0, nMax);
}
