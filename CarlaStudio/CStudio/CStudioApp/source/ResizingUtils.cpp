/*
 * ResizingUtils.cpp
 * Utility functions to help Dialogs resize themselves in a neat way
 * (with member panes and windows sizing at the same time)
 */

#include "ResizingUtils.h"

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

static const char *oszScreenRegistry = "SOFTWARE\\SIL\\CarlaStudio\\Screens\\";

long lPutWindowPlacement(LPCTSTR lpScreenName, WINDOWPLACEMENT *pwp)
{
  TCHAR szBuffer[1000];
  lstrcpy(szBuffer, oszScreenRegistry);
  lstrcat(szBuffer, lpScreenName);
  return RegSetValueExRecursive(HKEY_CURRENT_USER, szBuffer, 0,
								REG_BINARY, (CONST BYTE*) pwp,
								(DWORD) sizeof(*pwp));
}

long lGetWindowPlacement(LPCTSTR lpScreenName, WINDOWPLACEMENT *pwp)
{
  TCHAR szBuffer[1000];
  DWORD type;
  DWORD length = sizeof(*pwp);
  lstrcpy(szBuffer, oszScreenRegistry);
  lstrcat(szBuffer, lpScreenName);
  return RegQueryValueExRecursive(HKEY_CURRENT_USER, szBuffer, 0,
								&type, (BYTE*) pwp, &length);
}
