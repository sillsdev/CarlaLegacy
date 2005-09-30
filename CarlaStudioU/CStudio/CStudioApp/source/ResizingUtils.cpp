/*
 * ResizingUtils.cpp
 * Utility functions to help Dialogs resize themselves in a neat way
 * (with member panes and windows sizing at the same time)
 */
#include "stdafx.h"
#include "ResizingUtils.h"

/* for --setdpi-- */
#include <windows.h>

static void
vMyStrCpy(TCHAR *tzc, const char *osz)
{
	while (*osz) {
		*tzc = (TCHAR) *osz;
		tzc++;
		osz++;
	}
	*tzc = (TCHAR)0;
}

long FASTCALL RegQueryValueExRecursive( HKEY hKey,
						  LPCTSTR lpValueName,
						  LPDWORD lpReserved,
						  LPDWORD lpType,
						  LPBYTE lpData,
						  LPDWORD lpcbData )
{
	TCHAR szBuffer[ 256 ];
	ASSERT( lstrlen( lpValueName ) < sizeof( szBuffer ) / sizeof(TCHAR) );
	(void)lstrcpy( szBuffer, lpValueName );

	LPTSTR pszBuffer = szBuffer;
	LPTSTR pszLast = szBuffer;
	while( *pszBuffer )
	{
		if( *pszBuffer == _T('\\') || *pszBuffer == _T('/') )
		{
			pszLast = pszBuffer;
			lpValueName = pszLast + 1;
		}
		pszBuffer++;
	}

	bool m_bNeedToCloseKey = false;
	if( pszLast != szBuffer )
	{
		*pszLast = _T('\000');
		HKEY hkeyTemp;
		long lRet = RegOpenKey( hKey, szBuffer, &hkeyTemp );
		if( lRet != ERROR_SUCCESS )
		{
			return lRet;
		}
		hKey = hkeyTemp;
		m_bNeedToCloseKey = true;
	}

	long lRet = RegQueryValueEx( hKey, lpValueName, lpReserved, lpType, lpData, lpcbData );
	if( m_bNeedToCloseKey )
	{
		VERIFY( RegCloseKey( hKey ) == ERROR_SUCCESS );
	}
	return lRet;
}

long FASTCALL RegSetValueExRecursive( HKEY hKey, LPCTSTR lpValueName, DWORD Reserved, DWORD dwType, CONST BYTE* lpData, DWORD cbData )
{
	TCHAR szBuffer[ 256 ];
	ASSERT( lstrlen( lpValueName ) < sizeof( szBuffer )/sizeof(TCHAR) );
	(void)lstrcpy( szBuffer, lpValueName );

	LPTSTR pszBuffer = szBuffer;
	LPTSTR pszLast = szBuffer;
	while( *pszBuffer )
	{
		if( *pszBuffer == _T('\\') || *pszBuffer == _T('/') )
		{
			pszLast = pszBuffer;
			lpValueName = pszLast + 1;
		}
		pszBuffer++;
	}

	bool m_bNeedToCloseKey = false;
	if( pszLast != szBuffer )
	{
		*pszLast = _T('\000');
		HKEY hkeyTemp;
		long lRet = RegOpenKey( hKey, szBuffer, &hkeyTemp );
		if( lRet != ERROR_SUCCESS )
		{
			lRet = RegCreateKey( hKey, szBuffer, &hkeyTemp );
			if( lRet != ERROR_SUCCESS )
				return lRet;
		}
		hKey = hkeyTemp;
		m_bNeedToCloseKey = true;
	}

	long lRet = RegSetValueEx( hKey, lpValueName, Reserved, dwType, lpData, cbData );
	if( m_bNeedToCloseKey )
	{
		VERIFY( RegCloseKey( hKey ) == ERROR_SUCCESS );
	}
	return lRet;
}

static const char *oszScreenRegistry = "SOFTWARE\\SIL\\CarlaStudioU\\Screens\\";

long lPutWindowPlacement(const char *oszScreenName, WINDOWPLACEMENT *pwp)
{
  TCHAR szBuffer[1000];
  vMyStrCpy(szBuffer, oszScreenRegistry);
  vMyStrCpy(szBuffer + strlen(oszScreenRegistry), oszScreenName);
  return RegSetValueExRecursive(HKEY_CURRENT_USER, szBuffer, 0,
								REG_BINARY, (CONST BYTE*) pwp,
								(DWORD) sizeof(*pwp));
}

long lGetWindowPlacement(const char *oszScreenName, WINDOWPLACEMENT *pwp)
{
  TCHAR szBuffer[1000];
  DWORD type;
  DWORD length = sizeof(*pwp);
  vMyStrCpy(szBuffer, oszScreenRegistry);
  vMyStrCpy(szBuffer + strlen(oszScreenRegistry), oszScreenName);
  return RegQueryValueExRecursive(HKEY_CURRENT_USER, szBuffer, 0,
								&type, (BYTE*) pwp, &length);
}

static void getptsize( HDC &dc, HFONT &font, SIZE *pSize )
{
	HFONT oldfont = 0;
	static char *sym = "abcdefghijklmnopqrstuvwxyz"
					   "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	SIZE sz;
	TEXTMETRICA t;
	oldfont = (HFONT)SelectObject(dc,font);
	GetTextMetricsA(dc,&t);
	GetTextExtentPointA(dc,sym, 52, &sz);
	pSize->cy = t.tmHeight;
	pSize->cx = (sz.cx / 26 + 1) / 2;
	SelectObject(dc,oldfont);
}


extern void
vResize(CDialog *cd, int cx, int cy, tsSizingElement *psSE, size_t gNoSE)
{
	size_t gSE;
	CEdit *pE;
	CRect r;

	for (gSE = 0; gSE < gNoSE; gSE++) {
	  pE = (CEdit*) cd->GetDlgItem(psSE[gSE].iItem);
	  if(pE && pE->m_hWnd) {
		pE->GetWindowRect(&r);
		cd->ScreenToClient(&r);

		if (psSE[gSE].iAlignLeft) {
			r.left = psSE[gSE].iHorFromBorder;
		}
		else {
			r.left = cx - psSE[gSE].iHorFromBorder;
		}
		if (psSE[gSE].iWidth < 0) {
			r.right = cx + psSE[gSE].iWidth;
		}
		else {
			r.right = r.left + psSE[gSE].iWidth;
		}
		if (psSE[gSE].iVertFromBorder < 0) {
			r.top = cy + psSE[gSE].iVertFromBorder;
		}
		else {
			r.top = psSE[gSE].iVertFromBorder;
		}
		if (psSE[gSE].iHeight < 0) {
			r.bottom = cy + psSE[gSE].iHeight;
		}
		else {
			r.bottom = r.top + psSE[gSE].iHeight;
		}

		pE->MoveWindow(r.left, r.top, r.Width(), r.Height(), TRUE);
	  }
	}

	/* from SetDPI() */
	SIZE szf;
	PAINTSTRUCT ps;
	CDC *cdc = cd->BeginPaint(&ps);
	HDC dc = cdc->GetSafeHdc();
/*	getptsize(dc,font,&szf);
	EndPaint(hwnd, &ps);

	double x_n=szf.cx,
		   x_d=4,
		   y_n=szf.cy,
		   y_d=8;

	RECT rect;
	cd->GetWindowRect(&rect);
	// GetClientRect(hwnd,&rect);

	rect.right=rect.left+(int)(lpDialogTemplate->cx*x_n/x_d+0.5);
	rect.bottom=rect.top+(int)(lpDialogTemplate->cy*y_n/y_d+0.5);

	ClientToScreen(hwnd, (LPPOINT)&rect);
	ClientToScreen(hwnd, ((LPPOINT)&rect)+1);

	AdjustWindowRectEx(&rect, lpDialogTemplate->style, dd.has_menu, lpDialogTemplate->exStyle );
	MoveWindow(hwnd,rect.left,rect.top,rect.right-rect.left,rect.bottom-rect.top,TRUE);
*/
	/* go through the Item ID's to resize them */
/*	helper::DLGITEMTEMPLATEEX *item=
		(helper::DLGITEMTEMPLATEEX *)helper::FindFirstDlgItem((DLGTEMPLATE *)lpDialogTemplate);

	HWND wnd;

	for(t=0;t<helper::DlgTemplateItemCount((DLGTEMPLATE *)lpDialogTemplate);t++)
	{
		// OLD IMPLEMENTATION: wnd=GetDlgItem(hwnd,item->id);

		// TODO: check if it is the best implementation
		//       are we sure that controls will preserve the order?

		if (!t)
			wnd=GetWindow(hwnd,GW_CHILD);
		else
			wnd=GetWindow(wnd,GW_HWNDNEXT);

		while ((wnd)&&(GetDlgCtrlID(wnd) != item->id))
			wnd=GetWindow(wnd,GW_HWNDNEXT);

		if (!wnd) break;

		MoveWindow(wnd,(int)(item->x*x_n/x_d+0.5),
					   (int)(item->y*y_n/y_d+0.5),
					   (int)(item->cx*x_n/x_d+0.5),
					   (int)(item->cy*y_n/y_d+0.5), TRUE);

		SendMessage(wnd, WM_SETFONT, (LPARAM)font, TRUE);

		item=(helper::DLGITEMTEMPLATEEX *)helper::FindNextDlgItem((DLGITEMTEMPLATE *)item,TRUE);
	}

	UnlockResource(hDialogTemplate);
	FreeResource(hDialogTemplate);
*/
}

/****************************************************

   Set dialog DPI helper class

   Copyright (C)2003 by George Yohng

   http://www.yohng.com

   LICENSE AGREEMENT:

	  You agree to go to http://www.yohng.com/music.html
	  and listen completely (without skips) to the very
	  first track on the list.

 ****************************************************/


class helper
{
public:
	// Constants used in DLGINIT resources for OLE control containers
	// NOTE: These are NOT real Windows messages they are simply tags
	// used in the control resource and are never used as 'messages'
	enum
	{
		ATL_WM_OCC_LOADFROMSTREAM = 0x0376,
		ATL_WM_OCC_LOADFROMSTORAGE = 0x0377,
		ATL_WM_OCC_INITNEW = 0x0378,
		ATL_WM_OCC_LOADFROMSTREAM_EX = 0x037A,
		ATL_WM_OCC_LOADFROMSTORAGE_EX = 0x037B,
		ATL_DISPID_DATASOURCE = 0x80010001,
		ATL_DISPID_DATAFIELD = 0x80010002,
	};

//local struct used for implementation
#pragma pack(push, 1)
	struct DLGINITSTRUCT
	{
		WORD nIDC;
		WORD message;
		DWORD dwSize;
	};
	struct DLGTEMPLATEEX
	{
		WORD dlgVer;
		WORD signature;
		DWORD helpID;
		DWORD exStyle;
		DWORD style;
		WORD cDlgItems;
		short x;
		short y;
		short cx;
		short cy;

		// Everything else in this structure is variable length,
		// and therefore must be determined dynamically

		// sz_Or_Ord menu;			// name or ordinal of a menu resource
		// sz_Or_Ord windowClass;	// name or ordinal of a window class
		// WCHAR title[titleLen];	// title string of the dialog box
		// short pointsize;			// only if DS_SETFONT is set
		// short weight;			// only if DS_SETFONT is set
		// short bItalic;			// only if DS_SETFONT is set
		// WCHAR font[fontLen];		// typeface name, if DS_SETFONT is set
	};
	struct DLGITEMTEMPLATEEX
	{
		DWORD helpID;
		DWORD exStyle;
		DWORD style;
		short x;
		short y;
		short cx;
		short cy;
		DWORD id;

		// Everything else in this structure is variable length,
		// and therefore must be determined dynamically

		// sz_Or_Ord windowClass;	// name or ordinal of a window class
		// sz_Or_Ord title;			// title string or ordinal of a resource
		// WORD extraCount;			// bytes following creation data
	};
#pragma pack(pop)

	static BOOL IsDialogEx(const DLGTEMPLATE* pTemplate)
	{
		return ((DLGTEMPLATEEX*)pTemplate)->signature == 0xFFFF;
	}

	inline static WORD& DlgTemplateItemCount(DLGTEMPLATE* pTemplate)
	{
		if (IsDialogEx(pTemplate))
			return reinterpret_cast<DLGTEMPLATEEX*>(pTemplate)->cDlgItems;
		else
			return pTemplate->cdit;
	}

	inline static const WORD& DlgTemplateItemCount(const DLGTEMPLATE* pTemplate)
	{
		if (IsDialogEx(pTemplate))
			return reinterpret_cast<const DLGTEMPLATEEX*>(pTemplate)->cDlgItems;
		else
			return pTemplate->cdit;
	}

	static DLGITEMTEMPLATE* FindFirstDlgItem(const DLGTEMPLATE* pTemplate)
	{
		BOOL bDialogEx = IsDialogEx(pTemplate);

		WORD* pw;
		DWORD dwStyle;
		if (bDialogEx)
		{
			pw = (WORD*)((DLGTEMPLATEEX*)pTemplate + 1);
			dwStyle = ((DLGTEMPLATEEX*)pTemplate)->style;
		}
		else
		{
			pw = (WORD*)(pTemplate + 1);
			dwStyle = pTemplate->style;
		}

		// Check for presence of menu and skip it if there is one
		// 0x0000 means there is no menu
		// 0xFFFF means there is a menu ID following
		// Everything else means that this is a NULL terminated Unicode string
		// which identifies the menu resource
		if (*pw == 0xFFFF)
			pw += 2;				// Has menu ID, so skip 2 words
		else
			while (*pw++);			// Either No menu, or string, skip past terminating NULL

		// Check for presence of class name string
		// 0x0000 means "Use system dialog class name"
		// 0xFFFF means there is a window class (atom) specified
		// Everything else means that this is a NULL terminated Unicode string
		// which identifies the menu resource
		if (*pw == 0xFFFF)
			pw += 2;				// Has class atom, so skip 2 words
		else
			while (*pw++);			// Either No class, or string, skip past terminating NULL

		// Skip caption string
		while (*pw++);

		// If we have DS_SETFONT, there is extra font information which we must now skip
		if (dwStyle & DS_SETFONT)
		{
			// If it is a regular DLGTEMPLATE there is only a short for the point size
			// and a string specifying the font (typefacename).  If this is a DLGTEMPLATEEX
			// then there is also the font weight, and bItalic which must be skipped
			if (bDialogEx)
				pw += 3;			// Skip font size, weight, (italic, charset)
			else
				pw += 1;			// Skip font size
			while (*pw++);			// Skip typeface name
		}

		// Dword-align and return
		return (DLGITEMTEMPLATE*)(((DWORD_PTR)pw + 3) & ~3);
	}

	// Given the current dialog item and whether this is an extended dialog
	// return a pointer to the next DLGITEMTEMPLATE*
	static DLGITEMTEMPLATE* FindNextDlgItem(DLGITEMTEMPLATE* pItem, BOOL bDialogEx)
	{
		WORD* pw;

		// First skip fixed size header information, size of which depends
		// if this is a DLGITEMTEMPLATE or DLGITEMTEMPLATEEX
		if (bDialogEx)
			pw = (WORD*)((DLGITEMTEMPLATEEX*)pItem + 1);
		else
			pw = (WORD*)(pItem + 1);

		if (*pw == 0xFFFF)			// Skip class name ordinal or string
			pw += 2; // (WORDs)
		else
			while (*pw++);

		if (*pw == 0xFFFF)			// Skip title ordinal or string
			pw += 2; // (WORDs)
		else
			while (*pw++);

		WORD cbExtra = *pw++;		// Skip extra data

		// cbExtra includes the size WORD in DIALOG resource.
		if (cbExtra != 0 && !bDialogEx)
			cbExtra -= 2;

		// Dword-align and return
		return (DLGITEMTEMPLATE*)(((DWORD_PTR)pw + cbExtra + 3) & ~3);
	}

};


struct dialogdata_t
{
	int       pt,has_menu;
	unsigned  weight;
	BOOL      italic;
	LPCWSTR    faceName;
};


#define word_at(ptr)  (*(WORD *)(ptr))
#define dword_at(ptr) (*(DWORD *)(ptr))

static void querydialogdata( LPCSTR data, dialogdata_t * result )
{
	WORD *p = (WORD *)data;
	unsigned long rstyle = dword_at(p);
	int dialogex=0;

	p += 2;

	if (rstyle == 0xffff0001)
	{
		p+=4;
		rstyle=dword_at(p);
		p+=2;
		dialogex=1;
	}else
		p+=2;

	p+=5;

	// Skip menu
	switch(word_at(p))
	{
	case 0x0000: // no menu name
		result->has_menu=0;
		p++;
		break;
	case 0xffff: // has menu
		result->has_menu=1;
		p += 2;
		break;
	default:     // has menu
		result->has_menu=1;
		p+=wcslen((LPCWSTR)p)+1;
		break;
	}

	// skip class name
	switch(word_at(p))
	{
	case 0x0000:
		p++;
		break;
	case 0xffff:
		p += 2;
		break;
	default:
		p+=wcslen((LPCWSTR)p)+1;
		break;
	}

	// skip the caption
	p+=wcslen((LPCWSTR)p)+1;

	// get the font name

	if (rstyle & DS_SETFONT)
	{
		result->pt = word_at(p); p++;
		if (dialogex)
		{
			result->weight = word_at(p); p++;
			result->italic = LOBYTE(word_at(p)); p++;
		}else
		{
			result->weight = FW_DONTCARE;
			result->italic = FALSE;
		}
		result->faceName = (LPCWSTR)p;
		p += wcslen( result->faceName ) + 1;
	}else
	{
		result->faceName=L"Tahoma"; // TODO: put system font name here
		result->pt=8; // TODO
		result->weight=FW_NORMAL; // TODO
		result->italic=FALSE; // TODO
	}
}

CSetDPI::CSetDPI()
{
	hwnd=0;
	font=0;
	oldfont=0;
	inst=0;
	IDD=0;
}
CSetDPI::~CSetDPI()
{
	Detach();
}

void CSetDPI::Attach(HINSTANCE hInst,HWND _hwnd,int _IDD,double dpi)
{
	int t;

	if (hwnd) Detach();

	inst = hInst;
	IDD = _IDD;

	hwnd=_hwnd;

	helper::DLGTEMPLATEEX *lpDialogTemplate;

	if (!hInst)
		{ } // hInst = AfxFindResourceHandle(IMAKEINTRESOURCE(IDD), RT_DIALOG);

	HRSRC hResource = ::FindResource(hInst, MAKEINTRESOURCE(IDD), RT_DIALOG);
	HANDLE hDialogTemplate = LoadResource(hInst, hResource);
	lpDialogTemplate = (helper::DLGTEMPLATEEX *)LockResource(hDialogTemplate);

	dialogdata_t dd;
	querydialogdata((LPCSTR)lpDialogTemplate,&dd);

	if ((dd.pt<0)||(dd.pt>32767))
	{
		// I don't know what to do if it happens this way
		// this is a compromise solution:
		dd.pt=-dd.pt;
		dd.pt&=0xFFFF;
	}

	font=CreateFontW(
		-(int)(dd.pt*dpi/72.0 + 0.5), // negative makes it use "char size"
	0,              // logical average character width
	0,              // angle of escapement
	0,              // base-line orientation angle
	dd.weight,  // weight
	dd.italic,  // italic
	FALSE,          // underline attribute flag
	FALSE,          // strikeout attribute flag
	DEFAULT_CHARSET,    // character set identifier
	OUT_DEFAULT_PRECIS, // output precision
	CLIP_DEFAULT_PRECIS,// clipping precision
	DEFAULT_QUALITY,    // output quality
	DEFAULT_PITCH,  // pitch and family
	dd.faceName  // pointer to typeface name string
	);

	oldfont=(HFONT)::SendMessage(hwnd, WM_GETFONT, 0, 0);
	SendMessage(hwnd, WM_SETFONT, (LPARAM)font, TRUE);

	SIZE szf;

	PAINTSTRUCT ps;
	HDC dc=BeginPaint(hwnd, &ps);
	getptsize(dc,font,&szf);
	EndPaint(hwnd, &ps);

	double x_n=szf.cx,
		   x_d=4,
		   y_n=szf.cy,
		   y_d=8;

	RECT rect;
	GetClientRect(hwnd,&rect);

	rect.right=rect.left+(int)(lpDialogTemplate->cx*x_n/x_d+0.5);
	rect.bottom=rect.top+(int)(lpDialogTemplate->cy*y_n/y_d+0.5);

	ClientToScreen(hwnd, (LPPOINT)&rect);
	ClientToScreen(hwnd, ((LPPOINT)&rect)+1);

	AdjustWindowRectEx(&rect, lpDialogTemplate->style, dd.has_menu, lpDialogTemplate->exStyle );
	MoveWindow(hwnd,rect.left,rect.top,rect.right-rect.left,rect.bottom-rect.top,TRUE);

	/* go through the Item ID's to resize them */
	helper::DLGITEMTEMPLATEEX *item=
		(helper::DLGITEMTEMPLATEEX *)helper::FindFirstDlgItem((DLGTEMPLATE *)lpDialogTemplate);

	HWND wnd;

	for(t=0;t<helper::DlgTemplateItemCount((DLGTEMPLATE *)lpDialogTemplate);t++)
	{
		// OLD IMPLEMENTATION: wnd=GetDlgItem(hwnd,item->id);

		// TODO: check if it is the best implementation
		//       are we sure that controls will preserve the order?

		if (!t)
			wnd=GetWindow(hwnd,GW_CHILD);
		else
			wnd=GetWindow(wnd,GW_HWNDNEXT);

		while ((wnd)&&(GetDlgCtrlID(wnd) != item->id))
			wnd=GetWindow(wnd,GW_HWNDNEXT);

		if (!wnd) break;

		MoveWindow(wnd,(int)(item->x*x_n/x_d+0.5),
					   (int)(item->y*y_n/y_d+0.5),
					   (int)(item->cx*x_n/x_d+0.5),
					   (int)(item->cy*y_n/y_d+0.5), TRUE);

		SendMessage(wnd, WM_SETFONT, (LPARAM)font, TRUE);

		item=(helper::DLGITEMTEMPLATEEX *)helper::FindNextDlgItem((DLGITEMTEMPLATE *)item,TRUE);
	}

	UnlockResource(hDialogTemplate);
	FreeResource(hDialogTemplate);
}

void CSetDPI::Detach()
{
	if (!hwnd) return;
	SendMessage(hwnd, WM_SETFONT, (LPARAM)oldfont, TRUE);


	HRSRC hResource = ::FindResource(inst, MAKEINTRESOURCE(IDD), RT_DIALOG);
	HANDLE hDialogTemplate = LoadResource(inst, hResource);
	helper::DLGTEMPLATEEX *lpDialogTemplate =
		(helper::DLGTEMPLATEEX *)LockResource(hDialogTemplate);


	helper::DLGITEMTEMPLATEEX *item=
		(helper::DLGITEMTEMPLATEEX *)helper::FindFirstDlgItem((DLGTEMPLATE *)lpDialogTemplate);

	int t;
	HWND wnd;
	for(t=0;t<helper::DlgTemplateItemCount((DLGTEMPLATE *)lpDialogTemplate);t++)
	{
		// OLD IMPLEMENTATION: wnd=GetDlgItem(hwnd,item->id);

		// TODO: check if it is the best implementation
		//       are we sure that controls will preserve the order?

		if (!t)
			wnd=GetWindow(hwnd,GW_CHILD);
		else
			wnd=GetWindow(wnd,GW_HWNDNEXT);

		while ((wnd)&&(GetDlgCtrlID(wnd) != item->id))
			wnd=GetWindow(wnd,GW_HWNDNEXT);

		if (!wnd) break;

		SendMessage(wnd, WM_SETFONT, (LPARAM)oldfont, TRUE);
		item=(helper::DLGITEMTEMPLATEEX *)helper::FindNextDlgItem((DLGITEMTEMPLATE *)item,TRUE);
	}

	UnlockResource(hDialogTemplate);
	FreeResource(hDialogTemplate);


	DeleteObject(font);
	hwnd=0;
	font=0;
	oldfont=0;
}
