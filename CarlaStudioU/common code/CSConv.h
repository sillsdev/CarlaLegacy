// rde270   20-Jun-2002 Created some macros, like the 'T2CA' macros provided by Atl for
//                      converting back and forth between "T" and "U8" (utf-8)
#pragma once

#include <atlconv.h>

#ifdef CSUTILDLL_EXPORTS
#define CSUTILDLL_API __declspec(dllexport)
#else
#define CSUTILDLL_API __declspec(dllimport)
#endif

// our version of USES_CONVERSION calls a global function to get the code page to use for
//  conversion (so that if we open a non-UTF8Safe project, we'll use CP_ACP and not clobber
//  the control files' data). THAT IS, even though the code might be using the "T2CU8"
//  (convert to 'UTF-8') macro, we may *still* use the equivalent of "T2CA".
// This method will return CP_ACP (which should be sufficient for project and language
//  control files) until you call EstablishUTF8Safeness.
CSUTILDLL_API UINT GetCSAcp();

// call the following method providing a file spec which will be opened and examined by
//  IMultiLanguage2 to determine which code page the data in the file is safe to convert
//  with (and which will subsequently be returned by GetCSAcp()).
// For example, if sPath is a file which contains UTF-8 data, then GetCSAcp() will
//  *subsequently* return CP_UTF8. If the file contains non-UTF-8 data, then GetCSAcp() will
//  return CP_ACP (so we don't clobber custom encoded data).
// If this method returns 'false', it means that one project (which called it) is using one
//  encoding and a subsequent project is using a different encoding. In this case, just fail
//  to load the project.
CSUTILDLL_API BOOL EstablishUTF8Safeness(const CString& sPath);

// call the following when one project is closed and before another is opened (to clear the global)
CSUTILDLL_API void ResetUTF8Safeness();

#define USES_CONVERSION_U8  USES_CONVERSION; UINT _csacp = GetCSAcp()
//
//  It would really be nice to allow both kinds of projects to be opened
//  at the same time, but there's no easy way to do this (you'd have to make the model
//  language set pointer available to each call to GetCSAcp(). Something along the lines of:
//
//  #define USES_CONVERSION_U8(MFS) USES_CONVERSION; UINT _csacp = GetCSAcp(MFS);
//
//  and then have GetCSAcp() maintain different code page globals for each different MFS.
//  Of course, the hard part is getting *each and every* instance of USES_CONVERSION_U8
//  to have access to the MFS for it's current execution. So I'm leaving this out until
//  someone complains that it's totally needed.

inline LPSTR WINAPI WCH2AHelper(LPSTR lpa, LPCWSTR lpw, UINT acp)
{
	// but this helper is for converting a single TCHAR to an Ansi str, therefore
	//  only the first element of _lpw is valid. Null it out also.
	WCHAR strWide[2];
	strWide[0] = (WCHAR)lpw;
	strWide[1] = '\0';
	return AtlW2AHelper(lpa, strWide, 4, acp);
}

#define W2U8(lpw) (\
	((_lpw = lpw) == NULL) ? NULL : (\
		_convert = (lstrlenW(_lpw)+1)*4,\
		AtlW2AHelper((LPSTR) alloca(_convert), _lpw, _convert, _csacp)))
#define U82W(lpa) (\
	((_lpa = lpa) == NULL) ? NULL : (\
		_convert = (lstrlenA(_lpa)+1),\
		AtlA2WHelper((LPWSTR) alloca(_convert*3), _lpa, _convert, _csacp)))
#define WCH2U8(c) (\
	((_lpw = (LPWSTR)c) == NULL) ? NULL : (\
		WCH2AHelper((LPSTR) alloca(4), _lpw, _csacp)))


#define U82CW(lpa)      ((LPCWSTR)U82W(lpa))
#define W2CU8(lpw)      ((LPCSTR)W2U8(lpw))
#define WCH2CU8(lpw)    ((LPCSTR)WCH2U8(lpw))

#ifdef _UNICODE
	#define TCH2U8  WCH2U8
	#define TCH2CU8 WCH2CU8
	#define T2CU8   W2CU8
	#define T2U8    W2U8
	#define U82T    U82W
	#define U82CT   U82CW
#else   // !_UNICODE
	inline LPCSTR T2CU8(LPCTSTR lp) { return lp; }  // Ansi *is* UTF-8
	inline LPCTSTR U82CT(LPCSTR lp) { return lp; }  // even though UTF-8 isn't Ansi, we don't really want to convert it
	inline char TCH2CU8(TCHAR c)    { return c; }   // anything that can be a single byte is already UTF-8
#endif  // !_UNICODE
