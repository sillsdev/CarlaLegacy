// SDialog.cpp : implementation file
//

#include "stdafx.h"
#include "carlastudioapp.h"
#include "SDialog.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSDialog dialog


CSDialog::CSDialog(UINT id, CWnd* pParent /*=NULL*/)
	: CDialog(id, pParent)
{
	//{{AFX_DATA_INIT(CSDialog)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CSDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSDialog)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSDialog, CDialog)
	//{{AFX_MSG_MAP(CSDialog)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSDialog message handlers
#include "..\..\cs utility dll\focuser.h"
BOOL CSDialog::PreTranslateMessage(MSG* pMsg)
{
	if( pMsg->message == WM_KEYDOWN )
	{
		if(pMsg->wParam == VK_F4 ||
			(pMsg->wParam == 0x4a/*j*/ && (GetKeyState(VK_CONTROL)<0)))
		{
			//short st = GetKeyState(VK_CONTROL);
			CFocuser foc;
			CWnd* p = this->GetFocus();

// PROBLEM: p is always some temp window, and I can't figure out what class this window is
// so at this point we have to use the clipboard

			if(!p)
				return FALSE;

			CString s = "";
			if(p->IsKindOf(RUNTIME_CLASS(CRichEditCtrl)))
			{
				CRichEditCtrl* pRec = ((CRichEditCtrl*)p);
				long lStart, lEnd;
				pRec->GetSel(lStart, lEnd);
				if(lEnd > lStart)
					s = pRec->GetSelText();
			}
#ifndef rde279
			// actually, I don't think it's too bad being a CTempWnd (it seems to work just
			//  fine for the QuickParse edit control). Perhaps, we should use the clipboard
			//  only if we can't get any selected text from the temporary window... I don't
			//  think it'll hurt anything to send the EM_GETSEL message to something which
			//  isn't actually a CEdit control).
			else
			{
				// assume it is CEdit.
				CEdit* pec = ((CEdit*)p);
				int iStart, iEnd; iStart = iEnd = 0;
				pec->GetSel(iStart, iEnd);
				if(iEnd > iStart)
				{
					CString sWin;
					pec->GetWindowText(sWin);
					CString sSel(LPCTSTR(sWin) + iStart, (iEnd-iStart));
					s = sSel;
				}
				// now, otherwise, use the clipboard.
				else if(OpenClipboard())
				{
					HANDLE h = GetClipboardData(
#ifdef  _UNICODE
									CF_UNICODETEXT);
#else   // !_UNICODE
									CF_TEXT);
#endif  // !_UNICODE
					CString sclip = (LPCTSTR) LocalLock(h);
					LocalUnlock(h);
					// just get the first word
					sclip.TrimLeft();
					int ls = sclip.Find(' ', 0);
					if(ls>0)
						s = sclip.Left(ls);
					else
						s = sclip;

					CloseClipboard();
				}
			}
#else   // rde279
			else if(p->IsKindOf(RUNTIME_CLASS(CEdit)))
			{
				CEdit* pec = ((CEdit*)p);
				int iStart, iEnd;
				pec->GetSel(iStart, iEnd);
				if(iEnd > iStart)
				{
					CString sWin;
					pec->GetWindowText(sWin);
					CString sSel(LPCTSTR(sWin) + iStart, (iEnd-iStart));
					s = sSel;
				}
			}
			else
			{
				if(OpenClipboard())
				{
					HANDLE h;
					h = GetClipboardData(CF_TEXT);
					CString sclip = (LPCTSTR) LocalLock(h);
					LocalUnlock(h);
					// just get the first word
					sclip.TrimLeft();
					int ls = sclip.Find(' ', 0);
					if(ls>0)
						s = sclip.Left(ls);
					else
						s = sclip;
				}
				CloseClipboard();


			}
#endif  // rde279
			if(s.IsEmpty())
				AfxMessageBox("Sorry, in this context you must first copy the search word to the clipboard.  Select the word, press Ctrl-c, and the try again.");
			else
				foc.focusShbxOnWord(s);

			return TRUE;
		}
	}

	return CDialog::PreTranslateMessage(pMsg);
}
