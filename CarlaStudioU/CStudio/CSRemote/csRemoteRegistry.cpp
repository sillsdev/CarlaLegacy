// RemoteReg.cpp: utilities for external apps to exchange
//		parameters with CarlaStudio via the registry
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
//#include <windows.h>
#include "csRemoteRegistry.h"
#include "simpleRegKey.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

#define CHECKFAIL(x) {long CHECKFAILres=x;if(ERROR_SUCCESS!=CHECKFAILres)return CHECKFAILres;}


// create from values.  Used for registering services
LONG addParamToRegistry(LPCTSTR lpszParamName, LPCTSTR lpszValue)
{

	// get to the key that contains these params
	HKEY paramsKey;
	CHECKFAIL( getRegistryKeyToCStudioParams(&paramsKey));

	// make a new key for this service
	CSimpleRegKey key;
	key.Attach(paramsKey);

	// add the values for this service
	CHECKFAIL( key.SetValue(lpszValue, lpszParamName));

	return ERROR_SUCCESS;
}

	// get or create Current_USER:Software:SIL:CarlaStduio:RemoteParams
LONG getRegistryKeyToCStudioParams(HKEY *paramsKey)
{
	*paramsKey = NULL;

	CSimpleRegKey softwareKey, silKey, cstudioKey, tempParamsKey, thisObjectKey, descKey;

	CHECKFAIL(softwareKey.Open(HKEY_CURRENT_USER, _T("SOFTWARE"), KEY_READ));
	CHECKFAIL(silKey.Create(softwareKey, _T("SIL")));
	CHECKFAIL(cstudioKey.Create(silKey, _T("CarlaStudio")));
	CHECKFAIL(tempParamsKey.Create(cstudioKey, _T("RemoteParams")));

	*paramsKey = tempParamsKey.Detach();// so it won't be closed when this goes out of scope
	return ERROR_SUCCESS;
}

LONG getStringParamFromRegistry(LPCTSTR lpszParamName, LPTSTR lpszValue, LONG maxlen)
{
	LONG res;

	HKEY paramsKey;
	CHECKFAIL( getRegistryKeyToCStudioParams(&paramsKey));

	DWORD dwLen = maxlen-1;
	DWORD dwType = NULL;

	// ERROR_MORE_DATA here means the value is too long
	res = RegQueryValueEx(paramsKey, lpszParamName, NULL,
		&dwType, (LPBYTE)lpszValue, &dwLen);
	if(ERROR_SUCCESS != res)
		return res;

	res = ::RegCloseKey(paramsKey);
	if(ERROR_SUCCESS != res)
		return res;
	return ERROR_SUCCESS;
}
