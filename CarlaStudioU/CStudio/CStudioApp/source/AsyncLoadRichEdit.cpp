// rde270 15-Jun-02 Created to work around the "it takes 10 minutes to load the 'Sample log'"
//  problem in CS Unicode.
// rde271 15-Jul-02 In an effort to make most of CS work for unicode even in a non-unicode
//  build, added a new class (CRichEdit3Ctrl) from which this class now derives.
// rde272 01-Sep-02 If the file handle is still opened during the destructor (implying that
//                  that the user must have clicked the 'x' box to close the window while we
//                  were still loading), then just make sure and close the file at that time
//                  if it's still loaded.
// rde273 17-Nov-02 If the input file has a BOM, then remove it (the control is displaying
//                  it as a box and since we send the code page, it isn't really needed anyway
//
//  The RichEdit control is taking too long to load UTF-8 files, so this control will
//  load the control in the background in chunks. The chunk size and elapsed time between
//  chunks is defined immediately below the include statements.
//  Three additional notes:
//      This control is expecting RichEdit 3 (i.e. _RICHEDIT_VER	0x0300)
//      This control will automatically convert the data read in from the file
//      from UTF-8 to UTF-16 (if _UNICODE is defined)
//      This control will always save the file as UTF-8 (including the BOM) by default (since
//      that is the only unicode format the processors are likely to understand, but it does
//      support import of UTF-16 files (as long as the BOM is present).
#include "stdafx.h"
#include "AsyncLoadRichEdit.h"
#include "../../../common code/CSConv.h"

#if(_RICHEDIT_VER < 0x0300)
#pragma message("This control uses EM_SETTEXTEX which requires RichEdit 3.0)
#endif

#define nBGLoadingElapse    200     // chunk loading rate (200mS/chunk)
#define nBufferSize         0x7FE   // chunk size

#ifndef rde271
IMPLEMENT_SERIAL(AsyncLoadRichEditCtrl, CRichEdit3Ctrl, 1)   // for RUNTIMECLASS()

BEGIN_MESSAGE_MAP(AsyncLoadRichEditCtrl, CRichEdit3Ctrl)
#else   // rde271
IMPLEMENT_SERIAL(AsyncLoadRichEditCtrl, CRichEditCtrl, 1)   // for RUNTIMECLASS()

BEGIN_MESSAGE_MAP(AsyncLoadRichEditCtrl, CRichEditCtrl)
#endif  // rde271
	ON_WM_TIMER()
	ON_WM_DESTROY()
	ON_NOTIFY_REFLECT(EN_MSGFILTER, OnNotifyReflect)
	ON_MESSAGE(WM_SEND_COMPLETE_NOTIFY,OnSendCompleteNotify)
//    ON_MESSAGE(WM_SEND_CHUNK_NOTIFY,OnSendChunkNotify)
END_MESSAGE_MAP()

// pointer to the currently loading instance (it must be static to insure that we're never
//  loading more than one ctrl at a time.
AsyncLoadRichEditCtrl*   AsyncLoadRichEditCtrl::m_pInstanceLoading = 0;

AsyncLoadRichEditCtrl::AsyncLoadRichEditCtrl()
  : m_bStreamInPending(false)   // means we should load if told to become visible (i.e. ShowWindow(SW_SHOW))
  , m_bBackgroundLoading(false) // means the timer is running
  , m_bBackgroundLoaded(false)  // means we've finished loading
  , m_bBackgroundLoadingSuspended(false)    // means we've suspended loading during mouse events.
  , m_nBGLoadingElapse(nBGLoadingElapse)
  , m_nBGTimerId(nBGLoadingElapse)
  , m_hFile(INVALID_HANDLE_VALUE)
  , m_nLenLeftOver(0)
  , m_bVisible(false)
{
	m_crSelection.cpMin = 0;
	m_crSelection.cpMax = 0;
	m_nFirstVisibleLine = 0;
}

AsyncLoadRichEditCtrl::~AsyncLoadRichEditCtrl()
{
	// timer shouldn't still be running at this point.
	if( IsWindow(m_hWnd) && m_bBackgroundLoading )
		KillTimer();

#ifndef  rde272
	// if the user exits the window, we may not have been given a chance to close the file.
	if( m_hFile != INVALID_HANDLE_VALUE )
	{
		CloseHandle(m_hFile);
		m_hFile = INVALID_HANDLE_VALUE;
	}
#endif  // rde272
}

BOOL AsyncLoadRichEditCtrl::Create(DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID)
{
#ifndef rde271
	BOOL b = CRichEdit3Ctrl::Create(dwStyle, rect, pParentWnd, nID);
#else   // rde271
	BOOL b = CWnd::Create(RICHEDIT_CLASS, NULL, dwStyle, rect, pParentWnd, nID);
#endif  // rde271

	// ask for scroll events so we can 'Invalidate' afterwards
	//  (so it doesn't look 'sloppy' after scrolling)
	SetEventMask(ENM_MOUSEEVENTS | ENM_SCROLLEVENTS);

	return b;
}

// don't let unknowing user clobber our desire to have the scroll and mouse events
//  (i.e. call GetEventMask first).
DWORD AsyncLoadRichEditCtrl::SetEventMask(DWORD dwEventMask)
{
#ifndef rde271
	return CRichEdit3Ctrl::SetEventMask( GetEventMask() | dwEventMask );
#else   // rde271
	return CRichEditCtrl::SetEventMask( GetEventMask() | dwEventMask );
#endif  // rde271
}

long AsyncLoadRichEditCtrl::StreamIn
(
	const CString&      strFile,
	BOOL                bSynchronously,     // = false
	VIEWSTREAMCALLBACK  pCb,                // = 0,
	DWORD_PTR           dwCookie            // = 0
)
{
	// keep track of for later use.
	m_strFile = strFile;
	m_pCb = pCb;
	m_dwCookie = dwCookie;

	if( bSynchronously )
	{
		m_bVisible = true;
		StreamInEx(m_strFile, bSynchronously);
		PostSendCompleteNotify();
	}

	// otherwise, just postpone loading until it becomes visible.
	else
	{
		// don't actually stream it in now. Wait until the user selects the tab
		//  (which will generate ShowWindow with SW_SHOW).
		m_bStreamInPending = true;
		m_bBackgroundLoading = m_bBackgroundLoaded = false;
	}

	return true;
}

BOOL AsyncLoadRichEditCtrl::ShowWindow(int nCmdShow)
{
	m_bVisible = false;
	if( nCmdShow == SW_SHOW )
	{
		m_bVisible = true;
		StartAsyncLoadEx();
		Invalidate();

		if( m_bBackgroundLoaded )
		{
			// if it's already loaded, then tell the parent they can continue with some other
			//  control
			PostSendCompleteNotify();
		}
	}
	else if( (nCmdShow == SW_HIDE) && (m_bBackgroundLoading) )
	{
		// if switching to a new tab, then stop the timer for this control.
		KillTimer();
	}

#ifndef rde271
	return CRichEdit3Ctrl::ShowWindow(nCmdShow);
#else   // rde271
	return CRichEditCtrl::ShowWindow(nCmdShow);
#endif  // rde271
}

#ifdef _UNICODE
// special version for unicode (*W messages)
long AsyncLoadRichEditCtrl::FindText(DWORD dwFlags, FINDTEXTEX* pFindText) const
	{ ASSERT(::IsWindow(m_hWnd)); return (long)::SendMessage(m_hWnd, EM_FINDTEXTEXW, dwFlags, (LPARAM)pFindText); }
#endif  // _UNICODE

BOOL AsyncLoadRichEditCtrl::ShouldLoadFile()
{
	// yes, you should load this file, if:
	//  a) it isn't already loaded
	//  b) it isn't already loading
	//  c) it isn't in the suspended state (due to key/mouse events) and
	//  d) there isn't already another control loading.
	return (    !m_bBackgroundLoaded
			&&  !m_bBackgroundLoading
			&&  !m_bBackgroundLoadingSuspended
			&&  !m_pInstanceLoading);
}

BOOL AsyncLoadRichEditCtrl::StartAsyncLoad()
{
	ASSERT(!m_bBackgroundLoading);
	ASSERT(!m_bBackgroundLoaded);

	return StartAsyncLoadEx();
}

void AsyncLoadRichEditCtrl::StopAsyncLoad()
{
	if( m_bBackgroundLoading )
	{
		KillTimer();
		if( m_hFile != INVALID_HANDLE_VALUE )
		{
			CloseHandle(m_hFile);
			m_hFile = INVALID_HANDLE_VALUE;
		}
	}
}

BOOL AsyncLoadRichEditCtrl::StartAsyncLoadEx()
{
	if( m_bStreamInPending )
	{
		// *now* do the stream in.
		m_bStreamInPending = false;
		StreamInEx(m_strFile, false);
	}
	else if( !m_bBackgroundLoading && !m_bBackgroundLoaded )
	{
		// if we weren't finished from previously loading, then restart.
		StartTimer();
	}

	return true;
}

long AsyncLoadRichEditCtrl::StreamInEx(const CString& strFile, BOOL bSynchronously)
{
#ifdef  _DEBUG
	m_nChunk = 0;
#endif

	// in this routine, do the actual streaming in.
	m_hFile = ReadWriteFirstChunk(strFile);

	// unless finished, start a timer to do the rest after delaying
	//  so the UI continues to work.
	if( bSynchronously )
	{
		while( m_hFile != INVALID_HANDLE_VALUE )
		{
			ReadWriteNextChunk(m_hFile);
			m_bBackgroundLoaded = (m_hFile == INVALID_HANDLE_VALUE);
		}
	}
	else if( m_hFile != INVALID_HANDLE_VALUE )
		StartTimer();

	return 1;
}

// start a timer to finish loading the file in the background
void AsyncLoadRichEditCtrl::StartTimer()
{
	ASSERT(!m_bStreamInPending);
	ASSERT(!m_bBackgroundLoaded);
	ASSERT(!m_bBackgroundLoading);

	// make the timer ID the same as the elapse time (in ms) so we know what it is in OnTimer
	m_nBGTimerId = m_nBGLoadingElapse;
	m_bBackgroundLoading = (SetTimer(m_nBGTimerId,m_nBGLoadingElapse,NULL) != 0);

	if( !m_bBackgroundLoading )
		throw;  // out of system resource condition
	else
		m_pInstanceLoading = this;
}

#define nBGLoadingElapseForSpeed    1
void AsyncLoadRichEditCtrl::SpeedUpLoading()
{
	// we don't want this triggering just while the user selects the tab, so keep track of
	//  the request and start it next time (during OnTimer call).
	if( m_bBackgroundLoading )
	{
		m_nBGLoadingElapse = nBGLoadingElapseForSpeed;
	}
}

void AsyncLoadRichEditCtrl::DontSpeedUpLoading()
{
	if( m_nBGLoadingElapse == nBGLoadingElapseForSpeed )
	{
		m_nBGLoadingElapse = nBGLoadingElapse;
	}
}

// kill the timer (may be restarted later)
void AsyncLoadRichEditCtrl::KillTimer()
{
	ASSERT(!m_bStreamInPending);
	ASSERT(m_bBackgroundLoading);
	m_bBackgroundLoading = false;
	m_pInstanceLoading = 0;
	CWnd::KillTimer(m_nBGTimerId);
}

void AsyncLoadRichEditCtrl::OnTimer( UINT nIDEvent )
{
	// only do the processing for *our* timer
	if( (nIDEvent == m_nBGTimerId) || (nIDEvent == m_nBGLoadingElapse) )
	{
		ASSERT(!m_bStreamInPending);
		ASSERT(m_bBackgroundLoading);
		ASSERT(!m_bBackgroundLoaded);

		ReadWriteNextChunk(m_hFile);
		m_bBackgroundLoaded = (m_hFile == INVALID_HANDLE_VALUE);

		if( m_bBackgroundLoaded )
		{
			KillTimer();
			PostSendCompleteNotify();
		}
		else
		{
			if( nIDEvent != m_nBGLoadingElapse )
			{
				// this means that the user has requested us to speed it up. So restart
				//  the timer with this new value.
				KillTimer();
				StartTimer();
			}
		}
	}
	else
#ifndef rde271
		CRichEdit3Ctrl::OnTimer(nIDEvent);
#else   // rde271
		CRichEditCtrl::OnTimer(nIDEvent);
#endif  // rde271
}

// send ourself these messages so we can do the 'OnNotify' calls *not* on the timer thread.
void AsyncLoadRichEditCtrl::PostSendCompleteNotify()
{
	PostMessage(WM_SEND_COMPLETE_NOTIFY);
}

void AsyncLoadRichEditCtrl::PostSendChunkNotify(LPCTSTR szBuff)
{
	// PostMessage(WM_SEND_CHUNK_NOTIFY);
	if( m_pCb )
	{
		(*m_pCb)(this, m_dwCookie, szBuff);
	}
}

// send a notification to our parent that we're done filling the last control.
LRESULT AsyncLoadRichEditCtrl::OnSendCompleteNotify(WPARAM wParam, LPARAM)
{
	MSGFILTER msg;
	msg.msg = WM_NOTIFY;
	msg.wParam = wParam;
	msg.nmhdr.idFrom = GetDlgCtrlID();
	msg.nmhdr.code = EN_STREAMIN_COMPLETE;
	msg.nmhdr.hwndFrom = GetSafeHwnd();
	GetParent()->SendMessage(WM_NOTIFY, msg.nmhdr.idFrom, (LPARAM)&msg);
	return 0;
}


void AsyncLoadRichEditCtrl::OnDestroy()
{
	// we need to catch this message to gracefully stop the timer in case it's still running
	//  when the user deletes the window.
	if( m_bBackgroundLoading )
		KillTimer();
}

// UI problems:
// During scrolling, the size of the document changes (as we're adding text to the control)
//  so sometimes, the rendering looks 'choppy'. So if we get a scroll message, then invalidate
//  the control so it repaints nicely.
// During mouse events, turn off timer so we don't go hacking things while the user is selecting
//  text.
void AsyncLoadRichEditCtrl::OnNotifyReflect ( NMHDR * pNotifyStruct, LRESULT* result )
{

	ASSERT( pNotifyStruct->code == EN_MSGFILTER );
	MSGFILTER* pMsg = (MSGFILTER*)pNotifyStruct;

	switch(pMsg->msg)
	{
	case WM_VSCROLL:
	case WM_HSCROLL:
		{
			// tell control to repaint (if visible) so the text doesn't get chopped when scrolling
			if( m_bVisible )
				Invalidate();
			break;
		}
	case WM_LBUTTONDOWN:
		{
			// if selecting text, then turn off the timer for now. (restart on WM_LBUTTONUP).
			if( m_bBackgroundLoading )
			{
				m_bBackgroundLoadingSuspended = true;
				KillTimer();
			}
			break;
		}
	case WM_LBUTTONDBLCLK:
	case WM_LBUTTONUP:
		{
			// if selecting text, then turn off the timer for now. (restart in lbtnup).
			if( m_bBackgroundLoadingSuspended )
			{
				m_bBackgroundLoadingSuspended = false;
				StartTimer();
			}
			break;
		}
	};

	*result = false;    // must return false, it won't actually scroll.
}

// these routines are for keeping track of (and restoring) the selection/visible text state
//  in case the user was doing something before we inserted new text.
void AsyncLoadRichEditCtrl::PushSelection()
{
	if( m_bVisible )
		SetRedraw(false);

	// remember what was selected and what was visible
	GetSel(m_crSelection);
	m_nFirstVisibleLine = GetFirstVisibleLine();

/*
	TRACE(_T("PushSel: sel: (%d.%d), line: (%d)\n"),
		m_crSelection.cpMin, m_crSelection.cpMax, m_nFirstVisibleLine);
*/
}
void AsyncLoadRichEditCtrl::SelectEnd()
{
	CHARRANGE   crEnd = { -1, -1 };
	SetSel(crEnd);
}
void AsyncLoadRichEditCtrl::PopSelection()
{
	// restore what was selected and what was visible
	SetSel(m_crSelection);
	int nFirstVisibleLine = GetFirstVisibleLine();
	if( nFirstVisibleLine != m_nFirstVisibleLine )
	{
		LineScroll(m_nFirstVisibleLine - nFirstVisibleLine);
	}

	// repaint if visible
	if( m_bVisible )
	{
		SetRedraw(true);
		Invalidate();
	}
/*
	TRACE(_T("PopSel: sel: (%d.%d), line: (%d)\n"),
		m_crSelection.cpMin, m_crSelection.cpMax, m_nFirstVisibleLine);
*/
}

void AsyncLoadRichEditCtrl::SetTextEx(_eEncoding eEncoding, LPCTSTR lpszText)
{
	// add this new text to the end of the control, but only after remember the state so
	//  it can be restored later.
	PushSelection();
		SelectEnd();

#ifndef  rde271
		UINT codepage = CP_ACP;
		if( (eEncoding == CP_UTF16) || (eEncoding == CP_UTF8) )
			codepage = CP_UTF16;
		SetWindowText(lpszText, codepage);
#else   // rde271
		SETTEXTEX   st;
#ifdef  _UNICODE
		if( (eEncoding == CP_UTF16) || (eEncoding == CP_UTF8) )
			st.codepage = CP_UTF16;
		else
			// otherwise, we don't really know what it is, so use the ANSI. It'll look like
			//  gibberish, but it'll work.
			st.codepage = CP_ACP;
#else   // !_UNICODE (i.e. ANSI)
		st.codepage = CP_ACP;
#endif  // _UNICODE
		st.flags = ST_SELECTION;
		SendMessage(EM_SETTEXTEX, (WPARAM)&st, (LPARAM)lpszText);
#endif  // rde271

	PopSelection();
}

// this wasn't implemented correctly (in CRichEditCtrl) for unicode text, so I'm doing it myself
CString AsyncLoadRichEditCtrl::GetSelText() const
{
	ASSERT(::IsWindow(m_hWnd));
#ifndef  rde271
	// if the going translation code page is UTF8, then the data in the RichEdit control
	//  will be unicode (so use CP_UTF16 in order to get selected text).
	return CRichEdit3Ctrl::GetSelText( (GetCSAcp() == eUTF8) ? CP_UTF16 : CP_ACP );
#else   // rde271
	CHARRANGE cr; cr.cpMin = cr.cpMax = 0;
	::SendMessage(m_hWnd, EM_EXGETSEL, 0, (LPARAM)&cr);

	int nSize = (cr.cpMax - cr.cpMin + 1)*sizeof(TCHAR);
	LPTSTR lpsz = (LPTSTR)_alloca(nSize);
	lpsz[0] = NULL;

	GETTEXTEX gt;
	gt.cb = nSize;
	gt.flags = GT_DEFAULT;
#ifdef  _UNICODE
	gt.codepage = CP_UTF16;
#else   // !_UNICODE (i.e. ANSI)
	gt.codepage = CP_ACP;
#endif  // _UNICODE
	gt.lpDefaultChar = NULL;
	gt.lpUsedDefChar = NULL;
	::SendMessage(m_hWnd, EM_GETSELTEXT, (WPARAM)&gt, (LPARAM)lpsz);
	return lpsz;
#endif  // rde271
}

void    AsyncLoadRichEditCtrl::ReadWriteNextChunk(HANDLE& hFile)
{
	ASSERT(hFile);

	// Attempt a synchronous read operation.
	long lNumRead;
	LPBYTE pbBuff = (LPBYTE)alloca(nBufferSize + sizeof(TCHAR));
	memset(pbBuff,0,nBufferSize + sizeof(TCHAR));

	// if we had any leftover from the last read (e.g. the buffer was mid-way thru a UTF-8
	//  sequence), then put the leftover first in the buffer.
	if( m_nLenLeftOver > 0 )
		strncpy((LPSTR)pbBuff,m_szLeftOver,m_nLenLeftOver);

	// read in the rest of the buffer-ful
	BOOL bResult = ReadFile(hFile, &pbBuff[m_nLenLeftOver], nBufferSize - m_nLenLeftOver, (unsigned long*)&lNumRead, NULL);

	// add to the count read in those we manually copied
	lNumRead += m_nLenLeftOver;

	if( bResult && (lNumRead > 0) )
	{
		// convert it to UTF-16 first since that's a bit faster
		ConvertAndAdd(m_eEncoding, pbBuff, lNumRead);
	}
	else
	{
		CloseHandle(hFile);
		hFile = INVALID_HANDLE_VALUE;
	}
}

// if we read upto the middle of a multi-byte UTF-8 sequence, we need to backup a bit so we
//  only have full character sequences in the buffer (so the convert to U16 doesn't fail).
/*
From Peter_Constable@sil.org:
Non-initial bytes are always in the range 0x80 - 0xBF, and can be tested
for by doing a bit compare with bits 10??????. Initial bytes are always in
the range 0xC0 - 0xFF, and when you encounter an initial byte, you can
always tell exactly how may follow bytes there should be: if 0xC0 - 0xDF,
there is exactly one following byte; if 0xE0 - 0xEF, there are exactly two
follow bytes; if 0xF0 - 0xFF, there are exactly three follow bytes. Put
another way, the number of continguous 1 bits (going high to low) tells you
how long the total UTF-8 sequence is: 110????? for a two-byte sequence,
1110???? for a three-byte sequence, and 1111???? for a four-byte sequence
(recalling that 10?????? is always a follow byte --- 0??????? would be a
one-byte sequence).
*/
void AsyncLoadRichEditCtrl::TruncateToLastFullU8Char(LPCSTR szBuff, long& lNumRead)
{
	ASSERT(lNumRead > 0);
	m_nLenLeftOver = 0;

	int nIndex = lNumRead - 1;
	if( !(szBuff[nIndex] & 0x80) )
	{
		// it is an ascii char, so we're done.
		return;
	}

	// otherwise, this must be part of a UTF-8 sequence
	int nBytesInSeq;
	do
	{
		// go left until we hit an initial byte (i.e. look for 10??????)
		while( (szBuff[nIndex] & (1 << 7)) && !(szBuff[nIndex] & (1 << 6)) )
		{
			nIndex--;
		}

		// now see how many bytes this UTF-8 sequence is supposed to have
		int nBitNum = 7;
		nBytesInSeq = 0;
		while( szBuff[nIndex] & (1 << nBitNum--) )
		{
			nBytesInSeq++;
		}
	} while( nBytesInSeq > (lNumRead - nIndex--) );

	m_nLenLeftOver = lNumRead - (++nIndex + nBytesInSeq);
	if( m_nLenLeftOver > 0 )
		strncpy(m_szLeftOver, &szBuff[nIndex + nBytesInSeq], m_nLenLeftOver);

	lNumRead -= m_nLenLeftOver;

	// adjusted size indicates how many chars in the buffer were good (i.e. whether we had
	//  to truncate any).
}

#define nU16BOMLen 2
#define nBOMLen 3

HANDLE  AsyncLoadRichEditCtrl::ReadWriteFirstChunk(LPCTSTR lpszFile)
{
	HANDLE hFile = CreateFile
					(
						lpszFile,               // open MYFILE.TXT
						GENERIC_READ,           // open for reading
						FILE_SHARE_READ,        // share for reading
						NULL,                   // no security
						OPEN_EXISTING,          // existing file only
						FILE_ATTRIBUTE_NORMAL,  // normal file
						NULL
					);

	if( hFile == INVALID_HANDLE_VALUE )
	{
		TRACE(_T("ReadWriteFirstChunk: CreateFile failed: INVALID_HANDLE_VALUE\n"));
		return hFile;
	}

	// in particular, we're expecting UTF-8 data in this file.
	static BYTE szBOM[nBOMLen] = { 0xEF, 0xBB, 0xBF };
	static BYTE szU16BOM[nU16BOMLen] = { 0xFF, 0xFE };
	long lNumRead;
	LPBYTE pbBuff = (LPBYTE)alloca(nBufferSize + (nBOMLen * sizeof(TCHAR)));
	BOOL bResult = ReadFile(hFile, pbBuff, nBufferSize - nBOMLen, (unsigned long*)&lNumRead, NULL);

	if( bResult && (lNumRead > 0) )
	{
		// worst-case is to assume it's ansi (so we won't try to convert it).
		m_eEncoding = eAnsi;

#ifndef rde273
		LPBYTE pbBuffStart = pbBuff;
#endif  // rde273
		// we're not really expecting UTF-16 file, but check just in case.
		if( !memcmp((LPVOID)pbBuff, (LPVOID)szU16BOM, nU16BOMLen ) )
		{
			// file is UTF-16!
			m_eEncoding = eUTF16;
#ifndef rde273
			// skip past the BOM which for some reason is not being removed by the control
			pbBuffStart += nU16BOMLen;
			lNumRead -= nU16BOMLen;
#endif  // rde273
		}

		// see if the UTF-8 BOM is already there. If so, then just pass it on...
		else if( !memcmp((LPVOID)pbBuff, (LPVOID)szBOM, nBOMLen ) )
		{
			m_eEncoding = eUTF8;
#ifndef rde273
			// skip past the BOM which for some reason is not being removed by the control
			pbBuffStart += nBOMLen;
			lNumRead -= nBOMLen;
#endif  // rde273
		}

		// otherwise, try to use MultiLanguage2 to determine what it is.
		else
		{
			// if it isn't there, see if this file contains UTF-8 data (if so, then put
			//  the BOM in the stream--this'll help the control know to render it as unicode)
			MyML2Ptr m_pML2;
			if( !!m_pML2 )  // if it's not bad (i.e. good)
			{
#ifndef rde273
				// it turns out we *don't* want the BOM in the stream because the control
				//  isn't removing it... (it displays as a box)
				m_eEncoding = m_pML2.WhichEncoding(pbBuff,lNumRead);
#else   // rde273
				switch(m_pML2.WhichEncoding(pbBuff,lNumRead))
				{
					case CP_UTF8:
						// it has at least *some* UTF8, so go ahead and put the bom at
						//  the beginning of the stream
						memmove(&pbBuff[nBOMLen],pbBuff,lNumRead);
						memcpy(pbBuff,szBOM,nBOMLen);
						lNumRead += nBOMLen;
						m_eEncoding = eUTF8;
						break;
					case CP_UTF16:
						// it has at least *some* UTF16, so go ahead and put the bom at
						//  the beginning of the stream
						memmove(&pbBuff[nU16BOMLen],pbBuff,lNumRead);
						memcpy(pbBuff,szU16BOM,nU16BOMLen);
						lNumRead += nU16BOMLen;
						m_eEncoding = eUTF16;
						break;
				}
#endif  // rde273
			}

/*
				INT i, nScores; i = lNumRead; nScores = 10;
				DetectEncodingInfo* pDEI = (DetectEncodingInfo*)alloca(sizeof(DetectEncodingInfo)*nScores);
				HRESULT hr = m_pML2->DetectInputCodepage
								(
									MLDETECTCP_8BIT,
									CP_UTF8,
									(LPSTR)pbBuff,
									&i,
									pDEI,
									&nScores
								);

				for(i = 0; (m_eEncoding == eAnsi) && (i < nScores); i++ )
				{
					switch( pDEI[i].nCodePage )
					{
					case CP_UTF8:
						// it has at least *some* UTF8, so go ahead and put the bom at
						//  the beginning of the stream
						memmove(&pbBuff[nBOMLen],pbBuff,lNumRead);
						memcpy(pbBuff,szBOM,nBOMLen);
						lNumRead += nBOMLen;
						m_eEncoding = eUTF8;
						break;
					case CP_UTF16:
						// it has at least *some* UTF16, so go ahead and put the bom at
						//  the beginning of the stream
						memmove(&pbBuff[nU16BOMLen],pbBuff,lNumRead);
						memcpy(pbBuff,szU16BOM,nU16BOMLen);
						lNumRead += nU16BOMLen;
						m_eEncoding = eUTF16;
						break;
					}
				}
			}
*/
		}

		ConvertAndAdd(m_eEncoding, pbBuffStart, lNumRead);
	}
	else
	{
		CloseHandle(hFile);
		hFile = INVALID_HANDLE_VALUE;
	}

	return hFile;
}

void AsyncLoadRichEditCtrl::ConvertAndAdd(_eEncoding eEncoding, LPBYTE pbBuff, long lNumRead)
{
	USES_CONVERSION_U8;
#ifndef rde273
	// if the file is actually UTF-16 encoded, we need a full wide char for termination.
	pbBuff[lNumRead] = pbBuff[lNumRead+1] = 0;
#else   // rde273
	pbBuff[lNumRead] = 0;
#endif  // rde273
	LPCTSTR lpConvertedText = 0;

	switch(eEncoding)
	{
	case eUTF8:
		TruncateToLastFullU8Char((LPCSTR)pbBuff, lNumRead);
		pbBuff[lNumRead] = 0;
		lpConvertedText = U82CT((LPCSTR)pbBuff);
		break;
	case eUTF16:
		// otherwise, bring it in as is (so we don't confuse things)
		lpConvertedText = (LPCTSTR)pbBuff;
		break;
	case eAnsi:
		lpConvertedText = A2CT((LPCSTR)pbBuff);
		eEncoding = eUTF16;
		break;
	default:
		ASSERT(false);
		break;
	};

	// add this text to control
	SetTextEx(eEncoding, lpConvertedText);

	// if this is on the timer thread, then call the user-defined callback to inform them that
	//  a chunk has been completed.
	PostSendChunkNotify(lpConvertedText);
}

long AsyncLoadRichEditCtrl::StreamOut(const CString& strFile, _eEncoding eEncoding /* = eUTF8 */ )
{
	// we must override this so we can stream out UTF-8.
	HANDLE hFile = CreateFile
					(
						strFile,                    // open MYFILE.TXT
						GENERIC_WRITE,              // open for writing
						FILE_SHARE_READ,            // share only for reading
						NULL,                       // no security
						CREATE_ALWAYS,              // existing file only
						FILE_ATTRIBUTE_NORMAL,      // normal file
						NULL
					);

	if(hFile == INVALID_HANDLE_VALUE)
	{
		return 0;
	}

	EDITSTREAM es;
	es.pfnCallback = AsyncLoadRichEditCtrl::EditStreamOutCallback;
	es.dwCookie = (DWORD_PTR)hFile;

	// tell the control to give it to us as UTF-8 text.
	int nFormat = SF_TEXT;

	// if we imported as Ansi, then we must output the same way (whether the user wants it
	//  or not (the only way we'd import as ansi is if it *was* ansi and converting it to
	//  UTF-8, for example, would clobber it).
	if( m_eEncoding == eAnsi )
		eEncoding = eAnsi;

	// if we stream'd it *in* as UTF-8, then do the same for output
	switch( eEncoding )
	{
#ifdef  _UNICODE
	case eUTF16:
		nFormat |= SF_UNICODE;
		break;
	case eUTF8:
		ASSERT(eEncoding == CP_UTF8);
		nFormat |= (eEncoding << 16) | SF_USECODEPAGE;
		break;
#endif  // !_UNICODE
	case eAnsi:
	default:
		break;
	};

#ifndef rde271
	long lNumWritten = CRichEdit3Ctrl::StreamOut(nFormat, es);
#else   // rde271
	long lNumWritten = CRichEditCtrl::StreamOut(nFormat, es);
#endif  // rde271

	CloseHandle(hFile);

	return lNumWritten;
}

// unlike EditStreamInCallback, for this one the caller must explicitly
// close the document when it is done writing
DWORD CALLBACK AsyncLoadRichEditCtrl::EditStreamOutCallback(
	DWORD_PTR dwCookie,
	LPBYTE pbBuff, LONG cb, LONG FAR *pcb)
{
/*dwCookie

Value of the dwCookie member of the EDITSTREAM structure.

pbBuff Pointer to the buffer to read from or write to.

cb Count of bytes to read or write.

pcb Pointer to a variable that receives the number of bytes actually read or written.
*/
	HANDLE hFile = (HANDLE) dwCookie;
	if(hFile == INVALID_HANDLE_VALUE)	// error situation, user should have been notified alread
		return 1;

	ASSERTX(hFile);

	unsigned long lNumWritten;

	BOOL bResult = WriteFile(hFile, pbBuff, cb, &lNumWritten, NULL) ;

	*pcb = lNumWritten;

	if( !bResult || (lNumWritten == 0) )
	{
		// we got an error or we're finished.
		return 1;
	}

	return 0; // continue
}

/*
LRESULT AsyncLoadRichEditCtrl::OnSendChunkNotify(WPARAM, LPARAM)
{
	MSGFILTER msg;
	msg.msg = WM_NOTIFY;
	msg.nmhdr.idFrom = GetDlgCtrlID();
	msg.nmhdr.code = EN_STREAMIN_CHUNK_COMPLETE;
	msg.nmhdr.hwndFrom = GetSafeHwnd();
	GetParent()->SendMessage(WM_NOTIFY, msg.nmhdr.idFrom, (LPARAM)&msg);
	return 0;
}
*/

/*
** this function works totally fine, but the above is a more better way to do it.
// if we read upto the middle of a multi-byte UTF-8 sequence, we need to backup a bit so we
//  only have full character sequences in the buffer (so the convert to U16 doesn't fail).
void AsyncLoadRichEditCtrl::TruncateToLastFullU8Char(LPCSTR szBuff, unsigned long& lNumRead)
{
	ASSERT(lNumRead > 0);
	m_nLenLeftOver = 0;

	// There may be a better way to do this, but for now, send the last bytes to the
	//  conversion routine and see if it succeeds or not (telling us that it was *not*
	//  in the middle of a sequence).
	char lpa[maxUTF8chars + 1];

	int nTruncSize = 0;
	for( int i = 1; i < (int)min(lNumRead,maxUTF8chars); i++ )   // i = num of chars from end of buffer
		for( int j = 1; j < maxUTF8chars; j++ )             // j = num of chars in testing sequence
		{
			int nIndex = lNumRead - j - i + 1;
			strncpy(lpa,&szBuff[nIndex],j);
			lpa[j] = '\0';

			int nRet = MultiByteToWideChar(CP_UTF8, 0, lpa, -1, 0, 0);
			if( nRet == 2 ) // for success, we must get: 1 wchar + 0 term (=2)
			{
				// found the last full UTF-8 char!
				//  now make sure that all of what we're looking at is necessary
				//  (by chopping off chars until we *no longer* have a good wchar)
				while( (nRet == 2) && (--j) )
				{
					lpa[j] = '\0';
					nRet = MultiByteToWideChar(CP_UTF8, 0, lpa, -1, 0, 0);
				}

				// keep track of what we're going to hack off (put one back on)
				m_nLenLeftOver = lNumRead - (nIndex + ++j);
				if( m_nLenLeftOver > 0 )
					strncpy(m_szLeftOver, &szBuff[nIndex + j], m_nLenLeftOver);

				lNumRead -= m_nLenLeftOver;
				return;
			}
		}

	// adjusted size indicates how many chars in the buffer were good (i.e. whether we had
	//  to truncate any). Use this value to bump up the seek point in the file (so we start
	//  on the full character next time).
}
*/
