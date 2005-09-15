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
			r.left = psSE[gSE].iFromBorder;
		}
		else {
			r.left = cx - psSE[gSE].iFromBorder;
		}
		if (psSE[gSE].iWidth < 0) {
			r.right = cx + psSE[gSE].iWidth;
		}
		else {
			r.right = r.left + psSE[gSE].iWidth;
		}
		if (psSE[gSE].iTopFromBorder < 0) {
			r.top = cy + psSE[gSE].iTopFromBorder;
		}
		else {
			r.top = psSE[gSE].iTopFromBorder;
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
}
