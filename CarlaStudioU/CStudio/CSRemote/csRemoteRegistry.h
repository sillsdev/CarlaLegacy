// RemoteReg.h: interface for the CRemoteReg class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_REMOTEREG_H__F2AECB81_CB8B_11D2_8650_DC3D0CC10000__INCLUDED_)
#define AFX_REMOTEREG_H__F2AECB81_CB8B_11D2_8650_DC3D0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


LONG addParamToRegistry(LPCTSTR lpszParamName, LPCTSTR lpszValue);
LONG getRegistryKeyToCStudioParams(HKEY *paramsKey);
LONG getStringParamFromRegistry(LPCTSTR lpszParamName, LPTSTR lpszValue, LONG maxlen);


#endif // !defined(AFX_REMOTEREG_H__F2AECB81_CB8B_11D2_8650_DC3D0CC10000__INCLUDED_)
