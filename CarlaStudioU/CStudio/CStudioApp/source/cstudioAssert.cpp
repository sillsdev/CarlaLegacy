// hab  09/09/1999 fix typo in bug report message (shouldn't this really be a StringResource?)

#include "stdafx.h"
#include "cstudioAssert.h"



void handleFailedAssert(LPCSTR lpszFileName, int iLine, LPCSTR lpszDate)
{
	CString s;
	s = _T("CARLAStudio has encountered an unexpected condition.\n");
	s += _T("This is most likely a bug in CarlaStudio.\n");
	CString sReport;
	USES_CONVERSION_U8;
	sReport.Format(_T("Failed assertion in file %s, line %d, compiled %s"), A2CT(lpszFileName), iLine, A2CT(lpszDate));
	if(OpenClipboard(NULL))
	{
		sReport +=_T("\r\n\r\nI am using the following version of CarlaStudio (see the Help:About CarlaStudio):\r\n\r\nI was doing the following when this bug bit me: \r\n");
		HGLOBAL clipbuffer;
		char * buffer;
		EmptyClipboard();
#ifndef rde270
		// turn it to ascii for the clipboard (since we're using 'CF_TEXT')
		LPCSTR pReport = T2CU8(sReport);
		clipbuffer = GlobalAlloc(GMEM_DDESHARE, strlen(pReport) + 1);
		buffer = (LPSTR)GlobalLock(clipbuffer);
		strcpy(buffer, pReport);
#else   // rde270
		clipbuffer = GlobalAlloc(GMEM_DDESHARE, sReport.GetLength()+1);
		buffer = (char*)GlobalLock(clipbuffer);
		strcpy(buffer, LPCTSTR(sReport));
#endif  // rde270
		GlobalUnlock(clipbuffer);
		SetClipboardData(CF_TEXT,clipbuffer);
		CloseClipboard();
#ifndef hab15a3
		s += _T("Please send a bug report to CarlaStudio Support.  A report has been placed on your clipboard, so that you can just go to your email program and paste in the message."); // hab 09/09/1999 fix typo
#else
		s += _T("Please sent a bug report to CarlaStudio Support.  A report has been placed on your clipboard, so that you can just go to your email program and paste in the message.");
#endif // hab15a3
	}
	else	// couldn't get it on the clipboard
#ifndef hab15a3
	  s += _T("Please send a bug report to CarlaStudio Support with this information:\n") + sReport; // hab 009/09/1999 fix typo
#else
		s += _T("Please sent a bug report to CarlaStudio Support with this information:\n") + sReport;
#endif // hab 15a3

	AfxMessageBox(s, MB_ICONSTOP | MB_OK);
	#ifdef _DEBUG
		AfxDebugBreak();
	#else
		#ifdef CSTUDIODLL	// we know we're inside a try..catch block
			throw CString(_T("Failed Assertion"));
		#else
		//AfxGetApp()->OnAppExit();
		//didn't work ::PostThreadMessage(AfxGetThread()->m_nThreadID, WM_QUIT, NULL, NULL);
		AfxGetMainWnd()->SendMessage(WM_CLOSE);
		#endif
	#endif
}
