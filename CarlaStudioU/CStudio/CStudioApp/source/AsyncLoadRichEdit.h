// rde270 15-Jun-02 Created to work around the "it takes 10 minutes to load the 'Sample log'"
//  problem in CS Unicode.
// rde271 15-Jul-02 In an effort to make most of CS work for unicode even in a non-unicode
//  build, added a new class (CRichEdit3Ctrl) from which this class now derives.
//
//  The RichEdit control is taking too long to load UTF-8 files, so this control will
//  load the control in the background in chunks. The chunk size and elapsed time between
//  chunks is defined immediately below the include statements.
//  Three additional notes:
//      This control is expecting RichEdit 3 (i.e. _RICHEDIT_VER	0x0300)
//      This control will automatically convert the data read in from the file
//      from UTF-8 to UTF-16 (if _UNICODE is defined)
//      This control will always save the file as UTF-8 (including the BOM) (unless it was
//      originally opened already as UTF-16 (BOM necessary), in which case it'll store the
//      file as UTF-16 again.
#pragma once

#include "MyMLang.h"    // for _eEncoding

#define maxUTF8chars    4   // maximum of 4 chars in a UTF-8 sequence

// the user can use this which we'll call after each chunk is streamed in (for updating
//  a 'loading' icon, or for searching the imported text for certain keywords 'error').
#ifndef rde271
#include "RichEdit3.h"  // for CRichEdit3Ctrl

class AsyncLoadRichEditCtrl : public CRichEdit3Ctrl
#else   // rde271
class AsyncLoadRichEditCtrl : public CRichEditCtrl
#endif  // rde271
{
	DECLARE_SERIAL(AsyncLoadRichEditCtrl)
public:
	AsyncLoadRichEditCtrl();
	virtual ~AsyncLoadRichEditCtrl();

	typedef DWORD (CALLBACK *VIEWSTREAMCALLBACK)(AsyncLoadRichEditCtrl* pCtrl, DWORD_PTR dwCookie, LPCTSTR szBuff);

	BOOL    Create(DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID);
	DWORD   SetEventMask(DWORD dwEventMask);

	long    StreamIn(const CString& strFile, BOOL bSynchronously = false, VIEWSTREAMCALLBACK pCb = 0, DWORD_PTR dwCookie = 0 );

	_eEncoding  FileEncoding() const    { return m_eEncoding; };

	long    StreamOut(const CString& strFile, _eEncoding eEncoding = eUTF8);

#ifdef  _UNICODE
	// the base class Find isn't using the wide messages for this...
	long FindText(DWORD dwFlags, FINDTEXTEX* pFindText) const;
#endif

	// call this to determine if the file should be loaded or not.
	BOOL    ShouldLoadFile();

	// normally, you request the 'StreamIn' above, but it won't start loading until you call
	//  ShowWindow with SW_SHOW
	BOOL    ShowWindow(int nCmdShow);

	// however, if you're done with all your other processing and want to get it started
	//  even though it won't be visible, call this method.
	BOOL    StartAsyncLoad();
	void    StopAsyncLoad();
	void    SpeedUpLoading();   // reduce the timer to minimum
	void    DontSpeedUpLoading();

	CString GetSelText() const;

protected:
	void    SetTextEx(_eEncoding eEncoding, LPCTSTR lpszText);
	BOOL    StartAsyncLoadEx();
	long    StreamInEx(const CString& strFile, BOOL bSynchronously);
	HANDLE  ReadWriteFirstChunk(LPCTSTR lpszFile);
	void    ReadWriteNextChunk(HANDLE& hFile);
	void    PushSelection();
	void    SelectEnd();
	void    PopSelection();
	void    StartTimer();
	void    KillTimer();
	void    PostSendCompleteNotify();
	void    PostSendChunkNotify(LPCTSTR szBuff);
	void    TruncateToLastFullU8Char(LPCSTR szBuff, long& lNumRead);

protected:
	CString         m_strFile;
	BOOL            m_bStreamInPending;
	BOOL            m_bBackgroundLoading;
	BOOL            m_bBackgroundLoaded;
	BOOL            m_bBackgroundLoadingSuspended;
	unsigned int    m_nBGLoadingElapse;
	unsigned int    m_nBGTimerId;
	HANDLE          m_hFile;
	CHARRANGE       m_crSelection;
	int             m_nFirstVisibleLine;
	BOOL            m_bVisible;

	// in case we don't read in a complete UTF-8 sequence, keep track of the left-over for
	//  the next read cycle.
	int             m_nLenLeftOver;
	char            m_szLeftOver[maxUTF8chars];

	// data members for calling the owner after each chunk is finished.
	VIEWSTREAMCALLBACK  m_pCb;
	DWORD_PTR           m_dwCookie;

	int             m_nChunk;
	_eEncoding      m_eEncoding;

	static AsyncLoadRichEditCtrl*   m_pInstanceLoading;

protected:
	void    ConvertAndAdd(_eEncoding eEncoding, LPBYTE pbBuff, long lNumRead);

	static DWORD CALLBACK EditStreamOutCallback(DWORD_PTR dwCookie, LPBYTE pbBuff, LONG cb, LONG *pcb);

	afx_msg LRESULT OnSendCompleteNotify(WPARAM, LPARAM);
	afx_msg LRESULT OnSendChunkNotify(WPARAM, LPARAM);
	afx_msg void OnTimer( UINT nIDEvent );  // timer for asynchronous loading of the control
	afx_msg void OnDestroy( );              // gracefully kill the timer (in case it's still running)
	afx_msg void OnNotifyReflect( NMHDR * pNotifyStruct, LRESULT* result );
	DECLARE_MESSAGE_MAP()
};

// this message is for ourself (so we can send the 'complete' notify not on the OnTimer call thread).
#define WM_SEND_COMPLETE_NOTIFY         WM_USER

// this message is sent to the parent on completion of a StreamIn event
// The parent can catch it via:
//
//  ON_NOTIFY(EN_STREAMIN_COMPLETE, id, OnStreamInComplete)
//
// where:
//  afx_msg void OnStreamInComplete( NMHDR * pNotifyStruct, LRESULT * result );
//
#define EN_STREAMIN_COMPLETE            0x0731 // arbitrary # (i.e. can be changed)

// The parent call also request a callback to be called each time a chunk of text is
//  read in. This is done by passing a function point (defined similarly to the following)
//  to StreamIn. The 3rd parameter will be the text read in (in UTF-16 if _UNICODE is defined)
// static DWORD CALLBACK OnStreamInChunkComplete(AsyncLoadRichEditCtrl* pCtrl, DWORD_PTR dwCookie, LPCTSTR szBuff);
