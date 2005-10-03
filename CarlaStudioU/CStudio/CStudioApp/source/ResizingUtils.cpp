/*
 * ResizingUtils.cpp
 * Utility functions to help Dialogs resize themselves in a neat way
 * (with member panes and windows sizing at the same time)
 */
#include "stdafx.h"
#include "ResizingUtils.h"

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


/****************************************************

   Set dialog DPI helper class

   Copyright (C)2003 by George Yohng

   http://www.yohng.com

   LICENSE AGREEMENT:

	  You agree to go to http://www.yohng.com/music.html
	  and listen completely (without skips) to the very
	  first track on the list.

 ****************************************************/

#define X_CONST		4 // for some reason screen sizes are multiplied this much
#define Y_CONST		8 // for some reason screen sizes are multiplied this much

///////////////////////////////////////////////////////////////////////////
//
// Helper routines taken from the WIN32SDK DYNDLG sample.
///////////////////////////////////////////////////////////////////////////
//
//
LPWORD lpwAlign ( LPWORD lpIn)
{
  ULONG ul;

  ul = (ULONG) lpIn;
  ul +=3;
  ul >>=2;
  ul <<=2;
  return (LPWORD) ul;
}

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
		return (pTemplate->dwExtendedStyle == 0xFFFF);
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
		return (DLGITEMTEMPLATE*)(lpwAlign(pw));
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
		return (DLGITEMTEMPLATE*)(lpwAlign(pw));
	}

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
		p+=4;     /* skip 8 bytes */
		rstyle=dword_at(p);
		p+=2;
		dialogex=1;
	}else
			p+=2; /* NOT dialogex */

	p+=3;
	/* get the x, y sizes out */
	result->cx = word_at(p);
	p++;
	result->cy = word_at(p);
	p++;

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

extern void
CSetDPIInit(CSetDPI *cs, HINSTANCE hInst, HWND dlg, int iIDD, double dpi)
{
	BOOL bDialogEx = 0;

	/* set variables */
	cs->inst = hInst;
	cs->IDD  = iIDD;
	cs->hwnd = dlg;

	helper::DLGTEMPLATEEX *lpDialogTemplate;

	if (!hInst)
		{ } // hInst = AfxFindResourceHandle(IMAKEINTRESOURCE(IDD), RT_DIALOG);

	HRSRC hResource = ::FindResource(hInst, MAKEINTRESOURCE(cs->IDD), RT_DIALOG);
	HANDLE hDialogTemplate = LoadResource(hInst, hResource);
	lpDialogTemplate = (helper::DLGTEMPLATEEX *)LockResource(hDialogTemplate);

	bDialogEx = helper::IsDialogEx((const DLGTEMPLATE*) lpDialogTemplate);

	querydialogdata((LPCSTR)lpDialogTemplate, &cs->sDialogData);
/*	cs->sDialogData.style	= lpDialogTemplate->style;
	cs->sDialogData.exStyle	= lpDialogTemplate->exStyle;
 */
	if ((cs->sDialogData.pt<0)||(cs->sDialogData.pt>32767))
	{
		// I don't know what to do if it happens this way
		// this is a compromise solution:
		cs->sDialogData.pt = -cs->sDialogData.pt;
		cs->sDialogData.pt &= 0xFFFF;
	}

	cs->font=CreateFontW(
		-(int)(cs->sDialogData.pt*dpi/72.0 + 0.5), // negative makes it use "char size"
	0,              // logical average character width
	0,              // angle of escapement
	0,              // base-line orientation angle
	cs->sDialogData.weight,  // weight
	cs->sDialogData.italic,  // italic
	FALSE,          // underline attribute flag
	FALSE,          // strikeout attribute flag
	DEFAULT_CHARSET,    // character set identifier
	OUT_DEFAULT_PRECIS, // output precision
	CLIP_DEFAULT_PRECIS,// clipping precision
	DEFAULT_QUALITY,    // output quality
	DEFAULT_PITCH,  // pitch and family
	cs->sDialogData.faceName  // pointer to typeface name string
	);

	cs->oldfont=(HFONT)::SendMessage(cs->hwnd, WM_GETFONT, 0, 0);
	SendMessage(cs->hwnd, WM_SETFONT, (LPARAM)cs->font, TRUE);

	/* Pick up all of the item ID's */
	/* go through the Item ID's to resize them */
	helper::DLGITEMTEMPLATEEX *itemE =
		(helper::DLGITEMTEMPLATEEX *)helper::FindFirstDlgItem((DLGTEMPLATE *)lpDialogTemplate);
	DLGITEMTEMPLATE *item = (DLGITEMTEMPLATE *) itemE;

	cs->jNtItems = 0;
	int jMax = helper::DlgTemplateItemCount((DLGTEMPLATE *)lpDialogTemplate);
	while (cs->jNtItems < jMax) {
		if (bDialogEx) {
			cs->asDI[cs->jNtItems].x = itemE->x;
			cs->asDI[cs->jNtItems].y = itemE->y;
			cs->asDI[cs->jNtItems].cx= itemE->cx;
			cs->asDI[cs->jNtItems].cy= itemE->cy;
			cs->asDI[cs->jNtItems].id= itemE->id;
			itemE=(helper::DLGITEMTEMPLATEEX *)helper::FindNextDlgItem((DLGITEMTEMPLATE *)itemE,TRUE);
		}
		else {
			cs->asDI[cs->jNtItems].x = item->x;
			cs->asDI[cs->jNtItems].y = item->y;
			cs->asDI[cs->jNtItems].cx= item->cx;
			cs->asDI[cs->jNtItems].cy= item->cy;
			cs->asDI[cs->jNtItems].id= item->id;
			cs->asDI[cs->jNtItems].uiFlags = 0;
			item = helper::FindNextDlgItem(item,FALSE);
		}
		cs->asDI[cs->jNtItems].uiFlags = 0;
		cs->jNtItems++;
	}

	UnlockResource(hDialogTemplate);
	FreeResource(hDialogTemplate);

	/* Get current point size information */
	PAINTSTRUCT ps;
	SIZE szf;
	HDC dc=BeginPaint(cs->hwnd, &ps);
	getptsize(dc,cs->font,&szf);
	EndPaint(cs->hwnd, &ps);

	double	x_n=szf.cx,
			x_d=X_CONST,
			y_n=szf.cy,
			y_d=Y_CONST;
	cs->x_factor = x_n/x_d;
	cs->y_factor = y_n/y_d;

}	/* CSetDPIInit */

extern void
CSetDPIResizerFlags(CSetDPI *cs, DWORD id, unsigned uiFlags)
{
	for (int j = 0; j < cs->jNtItems; j++) {
		if (cs->asDI[j].id == id) {
			cs->asDI[j].uiFlags = uiFlags;
			return;
		}
	}
	return;
} /* CSetDPIResizerFlags */

extern void
CSetDPIResize(CSetDPI *cs, int cx, int cy)
{
	RECT rect;
	int xdif = 0;// = cx / cs->x_factor - cs->sDialogData.cx;
	int ydif = 0;// = cy / cs->y_factor - cs->sDialogData.cy;
	int x, y, wcx, wcy;

	GetClientRect(cs->hwnd,&rect);

	rect.right  = rect.left + (int)(cx * cs->x_factor + 0.5);
	rect.bottom = rect.top  + (int)(cy * cs->y_factor + 0.5);

	ClientToScreen(cs->hwnd, (LPPOINT)&rect);
	// ClientToScreen(cs->hwnd, ((LPPOINT)&rect)+1);
	xdif = rect.right  / X_CONST - cs->sDialogData.cx;
	ydif = rect.bottom / Y_CONST - cs->sDialogData.cy;

	AdjustWindowRectEx(&rect, cs->sDialogData.style, cs->sDialogData.has_menu, cs->sDialogData.exStyle );
	/*
	MoveWindow(cs->hwnd,rect.left,rect.top,rect.right-rect.left,rect.bottom-rect.top,TRUE);
	*/
	CEdit *pE;
	HWND wnd;

	for(int t=0; t<cs->jNtItems; t++)
	{
		// TODO: check if it is the best implementation
		//       are we sure that controls will preserve the order?
		if (!t)
			wnd=GetWindow(cs->hwnd,GW_CHILD);
		else
			wnd=GetWindow(wnd,GW_HWNDNEXT);

		while ((wnd)&&(GetDlgCtrlID(wnd) != cs->asDI[t].id))
			wnd=GetWindow(wnd,GW_HWNDNEXT);

		if (!wnd) break;
		x	= cs->asDI[t].x;
		y	= cs->asDI[t].y;
		wcx	= cs->asDI[t].cx;
		wcy	= cs->asDI[t].cy;
		if (cs->asDI[t].uiFlags & RESIZER_MOVES_WITH_LEFTBOTTOM) {
			if (cs->asDI[t].uiFlags & RESIZER_MOVES_VER_HALFSPEED) {
				y = y + ydif / 2;
			}
			else {
				y = y + ydif;
			}
		}
		if (cs->asDI[t].uiFlags & RESIZER_SIZES_VERTICAL) {
			if (cs->asDI[t].uiFlags & RESIZER_SIZES_VER_HALFSPEED) {
				wcy = wcy + ydif / 2;
			}
			else {
				wcy = wcy + ydif;
			}
		}
		if (cs->asDI[t].uiFlags & RESIZER_MOVES_WITH_RIGHTTOP) {
			if (cs->asDI[t].uiFlags & RESIZER_MOVES_HOR_HALFSPEED) {
				x = x + xdif / 2;
			}
			else {
				x = x + xdif;
			}
		}
		if (cs->asDI[t].uiFlags & RESIZER_SIZES_HORIZONTAL) {
			if (cs->asDI[t].uiFlags & RESIZER_SIZES_HOR_HALFSPEED) {
				wcx = wcx + xdif / 2;
			}
			else {
				wcx = wcx + xdif;
			}
		}

/*		MoveWindow(wnd,(int)(x * cs->x_factor + 0.5),
				   (int)(y * cs->y_factor + 0.5),
				   (int)(cs->asDI[t].cx* cs->x_factor + 0.5),
				   (int)(cs->asDI[t].cy* cs->y_factor + 0.5), TRUE);*/
		MoveWindow(wnd,	(int)(x * cs->x_factor + 0.5),
						(int)(y * cs->y_factor + 0.5),
						(int)(wcx * cs->x_factor + 0.5),
						(int)(wcy * cs->y_factor + 0.5), TRUE);
		SendMessage(wnd, WM_SETFONT, (LPARAM)cs->font, TRUE);

	}
} /* Resize */

extern void
CSetDPIDetach(CSetDPI *cs)
{
	SendMessage(cs->hwnd, WM_SETFONT, (LPARAM)cs->oldfont, TRUE);

	HWND wnd;
	for(int t=0; t<cs->jNtItems; t++)
	{
		// OLD IMPLEMENTATION: wnd=GetDlgItem(hwnd,item->id);

		// TODO: check if it is the best implementation
		//       are we sure that controls will preserve the order?

		if (!t)
			wnd=GetWindow(cs->hwnd,GW_CHILD);
		else
			wnd=GetWindow(wnd,GW_HWNDNEXT);

		while ((wnd)&&(GetDlgCtrlID(wnd) != cs->asDI[t].id))
			wnd=GetWindow(wnd,GW_HWNDNEXT);

		if (!wnd) break;

		SendMessage(wnd, WM_SETFONT, (LPARAM)cs->oldfont, TRUE);
	}

	DeleteObject(cs->font);
	cs->hwnd=0;
	cs->font=0;
	cs->oldfont=0;
	cs->jNtItems = 0;
}

extern void
CSetDPIInitialSize(CSetDPI *dpi)
{
	CSetDPIResize(dpi, dpi->sDialogData.cx * X_CONST / 2,
							dpi->sDialogData.cy * Y_CONST / 2);
} /* CSetDPIInitialSize */
