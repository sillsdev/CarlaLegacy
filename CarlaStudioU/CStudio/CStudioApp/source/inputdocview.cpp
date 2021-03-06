// InputDocView.cpp : implementation file
//
// JDH 5/28/99 Make popup-menu shortcut to processor properties
// jdh 12April2001	check the readonly flag of the file
// hab 11-Jun-2001 above change in CInputDocView::saveBaseStream failed to check if the file existed or not
// rbr 14-Jul-2001 Revise Andy's 241 attempt to scroll windows after reprocessing a file. It now works.
// hab 07-Aug-2001 Fine tune Randy's 253; one has to adjust for the current position and also one has to call some routines to get others to take effect, apparently.
// jdh 11-Sept-2001 a hack to get a horizontal scrollbar for pc-patr
// hab
// rde269 25-Jun-2002   Added 'GetSelCtrl()' so we can manually return the appropriate RE ctrl
//                      to fix the jump to Shoebox problem of losing focus when alt-tab'ing
//                      away from CS and returning.
// rde270 25-Jun-2002   Changed the RichEdit stuff to use 'AsyncLoadRichEditCtrl', which allows
//                      for asynchronously loading the RichEdit controls to get around the
//                      '10 minutes to load the trample log' I discovered on switching to
//                      unicode.
#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "InputDocView.h"
#include "InputDoc.h"
#include "PrefsInputDoc.h"
#include "cwprocess.h"
#include "processoutput.h"
#include "processStatus.h"
#include "safestream.h"
#include "TextDisplayInfo.h"

//#include "PanelRichEditCtrl.h"
#include "DlgFind.h"

#ifndef rde270
#include "AsyncLoadRichEdit.h"
#endif

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CString gsFindWhat; // global so that each find starts with the contents of the last find
extern DWORD gdwFindFlags;

/////////////////////////////////////////////////////////////////////////////
// CInputDocView

IMPLEMENT_DYNCREATE(CInputDocView, CView)

CInputDocView::CInputDocView()
:	m_pBaseStream(NULL),
	m_pFindDlg(NULL),
	m_iLastFoundPos(0) // would fit better in a subclass of each richedit ctrl, if we had one
{
#ifndef rbr253
	// initialize window line positions
	for (int i=0; i < MAXPANELS; i++)
		m_iLine[i] = 0;
#endif // rbr253
}

CInputDocView::~CInputDocView()
{
	removePanels();
	if(	m_pBaseStream)
		delete 	m_pBaseStream;
	if(m_pFindDlg)
		delete m_pFindDlg;
}

void CInputDocView::populatePanels()
{
	int iSelectedTab = m_tabCtrl.GetCurSel();
	removePanels();

	CInputDoc* pDoc = (CInputDoc*) GetDocument();

	// add the base file (which will be:
	//		source file for a parsing operation
	//		ana or ptext for a transfer or synthesis operation

	//CResultStream* pBaseStream = pDoc->getBaseStream();
#ifndef rde270
	// the first panel (i.e. the file we're processing), should be synchronously streamed in
	//  (the meaning of the 3rd parameter), since it has to be closed (finished loading into
	//  the control) by the time we try to process it.
	addPanel(m_pBaseStream, kBasePanelID+0, true);
#else
	addPanel(m_pBaseStream, kBasePanelID+0);
#endif
	//delete pBaseStream;


	// add the various result panels
	CProcessStatus* pResults = pDoc->getProcessResults();
	if(pResults)
	{
		CPrefsInputDocDisplay* pPrefs = pDoc->getDisplayPrefs();

		int iPanelCount=1; // one for the input file
		for (int i =0; i< pResults->m_pResultStreams.GetSize(); i++)
		{
			CResultStreamDescriptor* pD =pResults->m_pResultStreams[i]->getDescriptor() ;

			if(	pPrefs->getShowPanel(pD))
			{
				iPanelCount++;
				addPanel(pResults->m_pResultStreams[i], kBasePanelID+i+1/*id 0 is the basestream */);
			}
		}
		// try to reselect the tab the user had before
		// this is simplistic, and could be redone to store the descriptor
		// they had chosen and reselect that.
		if(iPanelCount > iSelectedTab) // iSelectedTab is zero-based
		{
			m_tabCtrl.SetCurSel(iSelectedTab);
			tabSelected(iSelectedTab); // don't know why this isn't triggered
		}
		else
		{
			m_tabCtrl.SetCurSel(0);	// should always at least be the source panel
			tabSelected(0); // don't know why this isn't triggered
		}
	}
}
// id 0 is the basestream
#ifndef rde270
void CInputDocView::addPanel(CResultStream* pStream, int id, BOOL bSyncStreamIn)
#else
void CInputDocView::addPanel(CResultStream* pStream, int id)
#endif
{
	CRect r;//(0,0, 100, 100);
	GetClientRect(&r);
#ifndef rde270
	// change the dimensions a little so we don't get the annoying non-repaint of m_tabCtrl
	//  when we repaint the RECtrl after a chunk has been loaded offline.
	r.top = 21;
	AsyncLoadRichEditCtrl* pEC = new AsyncLoadRichEditCtrl;
#else   // rde270
	r.top = 25;
	r.right -= 5;
	r.bottom -= 5;
	CRichEditCtrl* pEC = new CRichEditCtrl;//CPanelRichEditCtrl;//
#endif
	//	CEdit* pEC = new CEdit;
	m_pEditCtrls.Add(pEC);



	DWORD dwFlags = ECO_SAVESEL | ES_AUTOVSCROLL | ES_MULTILINE |
				ES_NOHIDESEL   | WS_BORDER | WS_VSCROLL | WS_CHILD | WS_VISIBLE | ES_WANTRETURN;

#ifndef jdhhab621
	// a hack to get a scrollbar for pc-patr.  This could be generalized or put in the user's
	// control, but not without work that seems unjustified if it's just for pcpatr.

	if (pStream->getDescriptor()->getTabLabel().Find(_T("PATR")) != -1)
		dwFlags |= WS_HSCROLL | ES_AUTOHSCROLL;
#endif // jdhhab261

	pEC->Create(dwFlags,
				(RECT&)r,
				&m_tabCtrl,
				id);

	CFont* test = pStream->getFont();
	pEC->SetFont(test);

#ifndef rde270
	// delay StreamIn until after setting up of the associated tab (because during StreamIn
	//  our callback must have the pStream which is stored in the tab's lParam member.
#else   // rde270
	// NOTE: I'm not clear on whether StreamIn is done with the stream when it returns;
	// it doesn't seem to delete it, but you'd think it would need
	// to keep it around so it can get at large files when the user
	// scrolls down; maybe not.  Why it matters is, what if the cwCOOKIE
	// member points to a CResultsStream that I've deleted?
	// For now, I'm going to go on the assumption that the whole
	// file is read right here.
	pEC->StreamIn(SF_TEXT, pStream->getEditStreamIn()); // icon may be set in here

	// Set editing flags and limit

	CInputDoc* pDoc = (CInputDoc*) GetDocument();
	if(id==kBasePanelID && pDoc->m_bBaseIsEditable)
	{
		pEC->SetReadOnly(FALSE);
		const long kMaxAddableChars = 2000;
		long l = pEC->GetTextLength() + kMaxAddableChars;
		pEC->LimitText(l);
		pEC->SetEventMask( ENM_KEYEVENTS| ENM_CHANGE );// want to know when the user changes something
	}
	else
		pEC->SetReadOnly(TRUE);
#endif  // rde270


/*	ALL THIS WAS FOR CEDIT, NOT CRICHEDIT
	EDITSTREAM es =  pStream->getEditStreamIn();
	long sz = pEC->GetLimitText()-10;
	LPTSTR buff = new char [sz+1];
	ASSERTX(buff);
	long actual;
	(es.pfnCallback)((DWORD)(pStream), (unsigned char*)buff, sz, &actual);
	buff[actual] = '\0';
	CString sOverflowMsg = pStream->getOverflowMsg();
	if(actual > sz - sOverflowMsg.GetLength())
	{
		buff[sz-sOverflowMsg.GetLength()] = '\0';
		CString s = buff;
		s += sOverflowMsg;
		pEC->SetWindowText(s);
	}
	else
		pEC->SetWindowText(buff);


	// make it close
	(es.pfnCallback)((DWORD)(pStream), (unsigned char*)buff, 0, &actual);
	delete buff;
*/

	// make the tab for this item
	TC_ITEM tie;
	tie.mask = TCIF_TEXT |TCIF_PARAM ;
	tie.lParam = (LPARAM)pStream;
	tie.pszText = (LPTSTR)  LPCTSTR(pStream->getDescriptor()->getTabLabel());
	int iconEnum = pStream->getTabIconEnum();
	if(iconEnum>=0)
	{
		tie.mask |= TCIF_IMAGE;
		tie.iImage = iconEnum;
	}

#ifndef rde270
	// save the inserted tab's index (so it can be accessed by knowing the EC).
	int nIndex = m_tabCtrl.InsertItem(99, &tie );
	::SetWindowLong(pEC->GetSafeHwnd(),GWL_USERDATA,nIndex);
	if( -1 == nIndex )
#else   // rde270
	if (-1 == m_tabCtrl.InsertItem(99, &tie ))
#endif  // rde270
	{
		ASSERTX(FALSE);
	}
	else
	{
		//CToolTipCtrl* pTip = new CToolTipCtrl;
		//pTip->Create(this); // <--- or should it be the tab bar?
		//pTip->
		CToolTipCtrl* pTip = m_tabCtrl.GetToolTips();
		ASSERT(pTip);
		CRect r;
		m_tabCtrl.GetItemRect(m_tabCtrl.GetItemCount()-1, &r);
		CString s;
		s.Format(_T("%s"), (LPCTSTR)pStream->getToolTipText());
		pTip->AddTool(&m_tabCtrl, s, &r, id);
	}

#ifndef rde270
	// moved 'StreamIn' here because we want the tab already setup for when we get the
	//  'finished-a-chunk' callback.
	// use the 'AsyncLoadRichEdit' to stream it in [load asynchronously so we don't kill
	//  the UI for minutes (on big files).]
#pragma message("If you subclass CResultStream with something besides CResultStreamFile, this'll break!")
	CResultStreamFile* pStreamFile = (CResultStreamFile*)pStream;
	// ASSERT(pStreamFile->IsKindOf(RUNTIME_CLASS(CResultStreamFile)));
	// this assert is what *should* be, but the various streams are from the processor DLLs
	//  and for some reason IsKindOf doesn't appear to work across DLL boundaries.

	pEC->StreamIn(pStreamFile->getPath(), bSyncStreamIn, CInputDocView::OnStreamInChunkComplete, (DWORD_PTR)this);

	// Set editing flags and limit
	CInputDoc* pDoc = (CInputDoc*) GetDocument();
	if(id==kBasePanelID && pDoc->m_bBaseIsEditable)
	{
		pEC->SetReadOnly(FALSE);
		const long kMaxAddableChars = 2000;
		long l = pEC->GetTextLength() + kMaxAddableChars;
		pEC->LimitText(l);
		pEC->SetEventMask( ENM_KEYEVENTS| ENM_CHANGE );// want to know when the user changes something

		// if the editable file was imported as UTF-16, then we must make it 'modified' so
		//  it'll be saved as UTF-8 before processing (Ample, et al., can deal with UTF-8,
		//  but not UTF-16).
		if(     (pEC->FileEncoding() != eUTF8)
			&&  (pEC->FileEncoding() != eAnsi) )
			GetDocument()->SetModifiedFlag();
	}
	else
		pEC->SetReadOnly(TRUE);
#endif  // rde270
}

void CInputDocView::removePanels()
{
	if(m_tabCtrl.m_hWnd)
		m_tabCtrl.DeleteAllItems();
	for(int i=0; i< m_pEditCtrls.GetSize(); i++)
	{
		delete m_pEditCtrls[i];
	}
	m_pEditCtrls.RemoveAll();
}

#ifndef rde270
// used to stop the current loading if the user starts another processing cycle (or the
//  files'll be locked).
void CInputDocView::stopLoadingPanels()
{
	for(int i=0; i< m_pEditCtrls.GetSize(); i++)
	{
		m_pEditCtrls[i]->StopAsyncLoad();
	}
}

void CInputDocView::choosePanel(AsyncLoadRichEditCtrl* pEdit)
#else   // rde270
void CInputDocView::choosePanel(CWnd* pEdit)
#endif  // rde270
{
	// 1) hide 'em all
	for(int i=0; i< m_pEditCtrls.GetSize(); i++)
	{
#ifndef rde270
		// no need to hide the one we're about to show.
		if( (m_pEditCtrls[i]->m_hWnd) && (pEdit != m_pEditCtrls[i]) )
#else   // rde270
		if(m_pEditCtrls[i]->m_hWnd)
#endif  // rde270
		{
		  m_pEditCtrls[i]->ShowWindow(SW_HIDE);
		}
	}

	// 2) show the chosen one
	if(pEdit->m_hWnd)
		pEdit->ShowWindow(SW_SHOW);
	// this is just a hack, to sort-of help the problem of unwanted selection of the src text,
	// but it only help once the user clicks on some tab, which causes this to be exectuted
//	if(pEdit.m_hWnd)
//		m_EditSrcText.SetSel(-1,0);
}

static UINT WM_FINDREPLACE = ::RegisterWindowMessage(FINDMSGSTRING);

BEGIN_MESSAGE_MAP(CInputDocView, CView)
	//{{AFX_MSG_MAP(CInputDocView)
	ON_WM_HELPINFO()
	ON_WM_SIZE()
	ON_WM_CONTEXTMENU()
	ON_COMMAND(ID_EDIT_COPY, OnEditCopy)
	ON_UPDATE_COMMAND_UI(ID_EDIT_COPY, OnUpdateEditCopy)
	ON_COMMAND(ID_OpenStreamExternal, OnOpenStreamExternal)
	ON_UPDATE_COMMAND_UI(ID_OpenStreamExternal, OnUpdateOpenStreamExternal)
	ON_COMMAND(ID_EDIT_CUT, OnEditCut)
	ON_COMMAND(ID_EDIT_PASTE, OnEditPaste)
	ON_UPDATE_COMMAND_UI(ID_EDIT_PASTE, OnUpdateEditPaste)
	ON_UPDATE_COMMAND_UI(ID_EDIT_CUT, OnUpdateEditCut)
	ON_COMMAND(ID_EDIT_UNDO, OnEditUndo)
	ON_UPDATE_COMMAND_UI(ID_EDIT_UNDO, OnUpdateEditUndo)
	ON_COMMAND(ID_EDIT_FIND, OnEditFind)
	ON_UPDATE_COMMAND_UI(ID_EDIT_FIND, OnUpdateEditFind)
	ON_COMMAND(ID_EDIT_FindAgain, OnEDITFindAgain)
	ON_UPDATE_COMMAND_UI(ID_POPUP_PROCESSPROPERTIES, OnUpdateProcessorProperties)
	ON_BN_CLICKED(3000, OnParseButton)
	ON_REGISTERED_MESSAGE( WM_FINDREPLACE, OnFindReplace )
	ON_COMMAND(ID_POPUP_PROCESSPROPERTIES, OnProcessorProperties)
	//}}AFX_MSG_MAP
#ifndef rde270
	ON_NOTIFY_RANGE(EN_STREAMIN_COMPLETE, kBasePanelID, kBasePanelID+MAXPANELS, OnStreamInComplete)
#endif  // rde270
//	ON_NOTIFY_EX( TTN_NEEDTEXT, 0, OnToolTip )

END_MESSAGE_MAP()

#ifndef rde270
// this notify is sent by the new RE controls when it finishes (completely) streaming in a
//  file. Use this to set the icon to the 'old style' icon from the loading icons we've been
//  using to show it was being filled. Also, check to see if any other RE ctrls are in need
//  of being started (i.e. don't wait until they are made visible; do it when we're finished
//  with the visible one).
void CInputDocView::OnStreamInComplete( UINT id, NMHDR * pNotifyStruct, LRESULT * result )
{
	// OnParentNotify
	// go thru the windows one at a time (from left to right) and load them.
	BOOL bSetItem = false;
	int nSize = m_pEditCtrls.GetSize();
	int i;
	for( i = 0; i < nSize; i++ )
	{
		// set the final icon for this tab (now that we're done with the 'loading' icons.
		if( id == (UINT) m_pEditCtrls[i]->GetDlgCtrlID() )
		{
			LONG iTabIndex = ::GetWindowLong(m_pEditCtrls[i]->GetSafeHwnd(),GWL_USERDATA);

			TC_ITEM tie;
			tie.mask = TCIF_PARAM;
			m_tabCtrl.GetItem(iTabIndex,&tie);
			CResultStream* pStream = (CResultStream*)tie.lParam;
			tie.mask = TCIF_IMAGE;
			tie.iImage = pStream->getTabIconEnum();
			if( tie.iImage < 0 )
				tie.iImage = -1;    // means no icon
			m_tabCtrl.SetItem(iTabIndex,&tie);
			bSetItem = true;
			break;
		}
	}

	// if any are still not loaded, then start them... (don't wait until visible)
	for( i = 0; i < nSize; i++ )
	{
		if( m_pEditCtrls[i]->ShouldLoadFile() )
		{
			m_pEditCtrls[i]->StartAsyncLoad();
			break;
		}
	}

	// when finished with them all, we must invalidate the current tab so *it* get's
	//  repainted (after SetItem above, it goes away).
	if( i == nSize )
	{
		m_tabCtrl.Invalidate();
		m_tabCtrl.UpdateWindow();
		bSetItem = true;
	}

	// then repaint the current EC as well
	if( bSetItem )
		InvalidateCurTab();

	*result = false;
}

// this function is called when each chunk is completed (so we can check the imported data
//  for any of our various error conditions (and use error icons if needed).
DWORD CInputDocView::OnStreamInChunkComplete
(
	AsyncLoadRichEditCtrl*  pCtrl,
	DWORD_PTR               dwCookie,
	LPCTSTR                 szBuff
)
{
	CInputDocView* pView = (CInputDocView*)dwCookie;

	// first of all, see if there was one of our error codes.
	LONG iTabIndex = ::GetWindowLong(pCtrl->GetSafeHwnd(), GWL_USERDATA);
	TC_ITEM tie;
	tie.mask = TCIF_PARAM;
	pView->m_tabCtrl.GetItem(iTabIndex,&tie);
	CResultStreamFile* pStream = (CResultStreamFile*)tie.lParam;
	if( !pStream )
	{
		ASSERT(false);
		return -1;
	}

	if( pStream->IsError(szBuff) )
	{
		switch( pStream->m_eTabLoadingIcon )
		{
		case CResultStream::kLoadingErrorIcon1:
			pStream->m_eTabLoadingIcon = CResultStream::kLoadingErrorIcon2;
			break;
		case CResultStream::kLoadingErrorIcon2:
			pStream->m_eTabLoadingIcon = CResultStream::kLoadingErrorIcon3;
			break;
		case CResultStream::kLoadingIcon1:
		case CResultStream::kLoadingIcon2:
		case CResultStream::kLoadingIcon3:
		case CResultStream::kLoadingErrorIcon3:
			pStream->m_eTabLoadingIcon = CResultStream::kLoadingErrorIcon1;
			break;
		};
	}
	else
	{
		switch( pStream->m_eTabLoadingIcon )
		{
		case CResultStream::kLoadingIcon1:
			pStream->m_eTabLoadingIcon = CResultStream::kLoadingIcon2;
			break;
		case CResultStream::kLoadingIcon2:
			pStream->m_eTabLoadingIcon = CResultStream::kLoadingIcon3;
			break;
		case CResultStream::kLoadingIcon3:
			pStream->m_eTabLoadingIcon = CResultStream::kLoadingIcon1;
			break;
		};
	}

	tie.mask = TCIF_IMAGE;
	tie.iImage = pStream->m_eTabLoadingIcon;
	pView->m_tabCtrl.SetItem(iTabIndex,&tie);

	// must invalidate the current tab so *it* get's repainted (after SetItem above, it goes away).
	pView->InvalidateCurTab();

	return 0;
}

void CInputDocView::InvalidateCurTab()
{
	// finally, we must invalidate the currently selected tab (because it was just
	//  overwritten when we swapped the icon above
	int nSize = m_pEditCtrls.GetSize();
	int nCurSelTab = m_tabCtrl.GetCurSel();
	for( int i = 0; i < nSize; i++ )
	{
		if( nCurSelTab == ::GetWindowLong(m_pEditCtrls[i]->GetSafeHwnd(),GWL_USERDATA) )
		{
			m_pEditCtrls[i]->Invalidate();
			break;
		}
	}
}

// if the user clicks on the tab of a currently loading tab, we'll drop the timer delay to
//  a minimum (so it'll load as fast as possible).
void CInputDocView::SpeedUpLoadingCurTab()
{
	// tell the currently selected tab to speed up loading (if needed)
	int nCurSelTab = m_tabCtrl.GetCurSel();
	m_pEditCtrls[nCurSelTab]->SpeedUpLoading();
}

void CInputDocView::DontSpeedUpLoadingCurTab()
{
	// tell the currently selected tab to speed up loading (if needed)
	int nCurSelTab = m_tabCtrl.GetCurSel();
	m_pEditCtrls[nCurSelTab]->DontSpeedUpLoading();
}
#endif  // rde270

BOOL CInputDocView::OnToolTip(UINT id, NMHDR *pTTTStruct, LRESULT *pResult)
{
 /*   TOOLTIPTEXT *pTTT = (TOOLTIPTEXT *)pTTTStruct;
	UINT nID =pTTTStruct->idFrom;
	if (pTTT->uFlags & TTF_IDISHWND)
	{
		// idFrom is actually the HWND of the tool
		nID = ::GetDlgCtrlID((HWND)nID);


		pTTT->lpszText = _T("hello");//MAKEINTRESOURCE(nID);	// assumes the id has a string id
		pTTT->hinst = AfxGetResourceHandle();
		return TRUE;
	}
*/	return FALSE;
}

/////////////////////////////////////////////////////////////////////////////
// CInputDocView drawing


void CInputDocView::OnDraw(CDC* pDC)
{
	CDocument* pDoc = GetDocument();
	// TODO: add draw code here
}

/////////////////////////////////////////////////////////////////////////////
// CInputDocView diagnostics

#ifdef _DEBUG
void CInputDocView::AssertValid() const
{
	CView::AssertValid();
}

void CInputDocView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}
#endif //_DEBUG



void CInputDocView::OnParseButton()
{
	((CSourceTextInputDoc*)GetDocument())->doRunProcessors();
}

void CInputDocView::OnInitialUpdate()
{
	CView::OnInitialUpdate();


	CSourceTextInputDoc* pDoc = (CSourceTextInputDoc*)GetDocument();
	ASSERTX(pDoc);
	pDoc->setView(this);
	m_pBaseStream = pDoc->getBaseStream();

	CRect r;
	GetClientRect(&r);
	m_tabCtrl.setOwner(this);
	BOOL ok = m_tabCtrl.Create(TVS_SHOWSELALWAYS| WS_CHILD | WS_CLIPSIBLINGS
								| WS_VISIBLE|TCS_TOOLTIPS ,
		r, this, 1234 );

	makeImageList();

	CFont* pTabFont = CFont::FromHandle( (HFONT) GetStockObject(ANSI_FIXED_FONT));
	ASSERTX(pTabFont);
	m_tabCtrl.SetFont(pTabFont);

	populatePanels();

	// make the panel for the source text.  Eventually, that
	// needs to be unhardwired or moved to a subclass, since
	// we will want windows that dont' have a source text
/*	CRect r(0,0,100,110);
	m_EditSrcText.Create(ES_AUTOVSCROLL | WS_BORDER | WS_VSCROLL | WS_CHILD | WS_VISIBLE | ES_MULTILINE | ES_READONLY, (RECT&)r, this, NULL);
	// is this needed?
	m_EditSrcText.BringWindowToTop();
*/
}

BOOL CInputDocView::OnHelpInfo(HELPINFO* pHelpInfo)
{
	// TODO: Add your message handler code here and/or call default

	return CView::OnHelpInfo(pHelpInfo);
}

// called by ResultsTabBar::OnSelChanged
void CInputDocView::tabSelected(int iTab)
{
	ASSERTX(iTab <= m_pEditCtrls.GetSize());
#ifndef rde270
	choosePanel(m_pEditCtrls[iTab]);
#else   // rde270
	choosePanel((CWnd*)m_pEditCtrls[iTab]);
#endif  // rde270
}

#ifndef rde269
// if the user is trying to jump to Shoebox, the existing code was failing when you alt-tab
//  away from CS and then go back; basically, the RE ctrl no longer had the focus. Now use
//  something a little more explicit to get the appropriate control.
AsyncLoadRichEditCtrl* CInputDocView::GetSelCtrl()
{
	int iTab = m_tabCtrl.GetCurSel();
	ASSERTX(iTab <= m_pEditCtrls.GetSize());
	return m_pEditCtrls[iTab];
}
#endif  // rde269

void CInputDocView::updatePanels()
{
#ifndef rbr253
	int i;
	for(i=0; i< m_pEditCtrls.GetSize(); i++)
	{
		// Remember window positions.
		if(m_pEditCtrls[i]->m_hWnd)
			m_iLine[i] = m_pEditCtrls[i]->GetFirstVisibleLine();
	}
#endif // rbr253

	LockWindowUpdate();
	populatePanels();
	UnlockWindowUpdate();

#ifndef rbr253
	for(i=0; i< m_pEditCtrls.GetSize(); i++)
	{
		if(m_pEditCtrls[i]->m_hWnd)
		{
#ifndef hab254
		  int iPos = m_pEditCtrls[i]->GetFirstVisibleLine();
				// following seems to be needed to get
				// some windows to scroll to their proper
				// position; I don't know why...
		  int iCount = m_pEditCtrls[i]->GetLineCount();
		  m_pEditCtrls[i]->LineScroll(m_iLine[i] - iPos);
#else
			// Restore window positions.
			m_pEditCtrls[i]->LineScroll(m_iLine[i]);
#endif // hab254
			m_pEditCtrls[i]->Invalidate();
		}
	}
#endif // rbr253
}

void CInputDocView::OnSize(UINT nType, int cx, int cy)
{
	CView::OnSize(nType, cx, cy);

/*	if(m_parseButton.m_hWnd)
	{	CRect r;
		GetClientRect(&r);
		m_parseButton.MoveWindow(r.right - 60, r.top+3,
								60, 20);
	}
*/
	if(m_tabCtrl.m_hWnd)
		m_tabCtrl.MoveWindow(0, 0, cx, cy-2);


	for(int i=0; i< m_pEditCtrls.GetSize(); i++)
	{
		if(m_pEditCtrls[i]->m_hWnd)
		{
			m_pEditCtrls[i]->MoveWindow(0, 21, cx, cy-(21+2));
		}
	}
}

void CInputDocView::OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint)
{
	if(!m_pEditCtrls.GetSize())
		return;	// not setup yet

	ASSERTX(m_pBaseStream);
	// there is a bug here where the visible screen-full of text does not reset its
	// leading to that of the new font. (jan 99)

/*	 None of this had any effect!
	CHARRANGE csel;
	csel.cpMin=0;
	csel.cpMax=-1;
	m_pEditCtrls[0]->SetSel(csel);
	CFont* pf=m_pBaseStream->getFont();
	LOGFONT lf;
	pf->GetLogFont(&lf);
	CHARFORMAT cr;
	cr.dwMask = CFM_SIZE;
	cr.yHeight=lf.lfHeight;
	cr.cbSize = sizeof(CHARFORMAT);
	//m_pEditCtrls[0]->SetDefaultCharFormat(cr);
	m_pEditCtrls[0]->SetSelectionCharFormat(cr);
*/
	m_pEditCtrls[0]->SetFont(m_pBaseStream->getFont());
	m_pEditCtrls[0]->Invalidate();


	// set the fonts; fonts can change from one update to the next,
	// when the user changes the font, for, say, the source language
	CProjectDoc *pProjectDoc = theApp.getProject();

	CInputDoc* pDoc = (CInputDoc*) GetDocument();
	CProcessStatus* pResults = pDoc->getProcessResults();

	if(pResults)
	{
		// note that the first panel is not from a result stream; it is the source.
		int x = pResults->m_pResultStreams.GetSize();
		int y = m_pEditCtrls.GetSize();
	//	ASSERTX( x == y-1);

		for(int i=1; i< m_pEditCtrls.GetSize(); i++)
		{
			if(m_pEditCtrls[i]->m_hWnd)
			{	// note that the first panel is not from a result stream; it is the source.
				// thus, we have [i-1] for this index
				ASSERTX(::IsWindow(m_pEditCtrls[i]->m_hWnd));
				// there's a bug that sometime show up on this
				// call; the above assert is to narrow down the
				// problem, but I'm waiting for the bug to
				// reappear again. july 15
				CResultStream* pS = pDoc->getNthVisibleStream(i-1);

				// there is a bug here where iTotalExpectedStreams is too small, so this
				// fails.  I have removed the asserts until I find the problem because
				// it isn't really catastrophic

				// ASSERTX(pS);
				if(pS)
					m_pEditCtrls[i]->SetFont(pS->getFont(), FALSE);
				//	pResults->m_pResultStreams[i-1]->getFont(), FALSE);
				m_pEditCtrls[i]->Invalidate();
			}
		}
	}


	// disable the parse button if there is no open project
//	if(m_parseButton.m_hWnd)
//		m_parseButton.EnableWindow(pProjectDoc != NULL);

//	UpdateData(FALSE);	// run the DDX updating stuff
}

void CInputDocView::OnContextMenu(CWnd* pWnd, CPoint point)
{
	// make sure window is active
	GetParentFrame()->ActivateFrame();

	CMenu menu;
	if (menu.LoadMenu(IDR_InputDocPopup))
	{
		CMenu* pPopup = menu.GetSubMenu(0);
		ASSERTX(pPopup != NULL);

		pPopup->TrackPopupMenu(TPM_LEFTALIGN | TPM_RIGHTBUTTON,
			point.x, point.y,
			AfxGetMainWnd()); // use main window for cmds
	}
}


void CInputDocView::OnActivateView(BOOL bActivate, CView* pActivateView, CView* pDeactiveView)
{
	if(bActivate)
		((CInputDoc*)GetDocument()	)->OnActivate();
	CView::OnActivateView(bActivate, pActivateView, pDeactiveView);
}

void CInputDocView::OnOpenStreamExternal()
{
	CInputDoc* pDoc = (CInputDoc*) GetDocument();

	CResultStream* pS = getSelectedResultStream();

	if(pS)
	{
		pS->openExternally();
	}
}

void CInputDocView::OnUpdateOpenStreamExternal(CCmdUI* pCmdUI)
{
	CInputDoc* pDoc = (CInputDoc*) GetDocument();
	pCmdUI->Enable(TRUE); //pDoc->getProcessResults() != NULL);
}

CResultStream* CInputDocView::getSelectedResultStream()
{
	int i = m_tabCtrl.GetCurSel();
	ASSERTX(i >=0);
	TC_ITEM tab_item;
	tab_item.mask = TCIF_PARAM;
	ASSERTX(m_tabCtrl.GetItem(i, &tab_item));
	ASSERTX(tab_item.lParam); // to do: add dynamic macros to this class so we can check its type
	CResultStream* pRS = (CResultStream*)tab_item.lParam;
	return pRS;
}


// Function name	: CInputDocView::saveBaseStream
// Description	    : called by the document to save the src text or ana back the disk
//	Param lpszPath// Return type		:
// Created by	    : John Hatton
// Created on      :  12/26/98 10:36:27 AM
BOOL  CInputDocView::saveBaseStream(LPCTSTR lpszPath)
{
#ifndef hab252
  DWORD dwResult = ::GetFileAttributes(lpszPath);
	// jdh 12April2001	check the readonly flag of the file
	if (dwResult != -1 && dwResult & FILE_ATTRIBUTE_READONLY)
#else // hab252
	// jdh 12April2001	check the readonly flag of the file
	if (::GetFileAttributes(lpszPath) & FILE_ATTRIBUTE_READONLY)
#endif // hab252
	{
		CString s;
		s.Format(_T("The file %s is marked as Read-Only, so CS cannot save your changes.  You can choose \"Save Document As...\" from the File menu to save this with a different name."), lpszPath);
		::AfxMessageBox(s);
		return FALSE;
	}


	// save to a temporary file first, then swap the old and the new names when successfully written
	// not only is this safer, it allows us to ignore the problem of reading and writing
	// from the same file at the same time, as might happen if the file is very long
	// and we have to use the stream to read in at the same time we're writing out.
	CSafeStream ss(lpszPath, TRUE);

#ifndef rde270
	AsyncLoadRichEditCtrl* pEC = m_pEditCtrls.GetAt(0);
	pEC->StreamOut(ss.getTempPath());
#else
	CRichEditCtrl* pEC = m_pEditCtrls.GetAt(0);
	ASSERTX(pEC);
	pEC->StreamOut(SF_TEXT, m_pBaseStream->getEditStreamOut(ss.getTempPath()));
	m_pBaseStream->closeOutFile();
#endif
	ss.close();
	pEC->SetModify(FALSE);
	return TRUE;
}


// Function name	: CInputDocView::OnTextChanged
// Description	    : Called when the user edited the base panel
// Return type		: void
// Created by	    : John Hatton
// Created on      :  12/26/98 1:36:15 PM
//DEL void CInputDocView::OnTextChanged()
//DEL {
//DEL 	GetDocument()->SetModifiedFlag(TRUE);
//DEL }

void CInputDocView::OnEditCut()
{
	// figure out which edit control is frontmost
	int iSelectedTab = m_tabCtrl.GetCurSel();
	// only the first panel is editable, and only if the doc's editable flag is set
	m_pEditCtrls[iSelectedTab]->Cut();
	GetDocument()->SetModifiedFlag();
}

void CInputDocView::OnEditPaste()
{
	// figure out which edit control is frontmost
	int iSelectedTab = m_tabCtrl.GetCurSel();
	// only the first panel is editable, and only if the doc's editable flag is set
	m_pEditCtrls[iSelectedTab]->Paste();
	GetDocument()->SetModifiedFlag();
}

void CInputDocView::OnUpdateEditPaste(CCmdUI* pCmdUI)
{
	// figure out which edit control is frontmost
	int iSelectedTab = m_tabCtrl.GetCurSel();

	pCmdUI->Enable(iSelectedTab==0 && // only the first panel is editable,
					((CInputDoc*)GetDocument())->m_bBaseIsEditable //only if the doc's editable flag is set
					&& m_pEditCtrls[iSelectedTab]->CanPaste());	// if there's a format it can handle
}

void CInputDocView::OnUpdateEditCut(CCmdUI* pCmdUI)
{
	// figure out which edit control is frontmost
	int iSelectedTab = m_tabCtrl.GetCurSel();
	// only the first panel is editable, and only if the doc's editable flag is set
	pCmdUI->Enable(iSelectedTab==0 && ((CInputDoc*)GetDocument())->m_bBaseIsEditable);
}
void CInputDocView::OnEditCopy()
{
	// figure out which edit control is frontmost
	int iSelectedTab = m_tabCtrl.GetCurSel();
	ASSERTX(iSelectedTab < m_pEditCtrls.GetSize());

	// tell the edit control to do the copy
	m_pEditCtrls[iSelectedTab]->Copy();

	// only when we had richedit ctrls
	//AfxMessageBox("There is a bug here, in which if you copy from an output panel and then quit CarlaStudio, it will crash.  Of course, you'll be trying to get out anyways....");
}

void CInputDocView::OnUpdateEditCopy(CCmdUI* pCmdUI)
{
	// figure out which edit control is frontmost
	int iSelectedTab = m_tabCtrl.GetCurSel();
	ASSERTX(iSelectedTab < m_pEditCtrls.GetSize());
// for rich edit
	long start, end;
	//int start, end;
	m_pEditCtrls[iSelectedTab]->GetSel(start, end);
	pCmdUI->Enable(start != end);
}

void CInputDocView::OnEditUndo()
{
	// figure out which edit control is frontmost
	int iSelectedTab = m_tabCtrl.GetCurSel();
	// only the first panel is editable, and only if the doc's editable flag is set
	m_pEditCtrls[iSelectedTab]->Undo();
}

void CInputDocView::OnUpdateEditUndo(CCmdUI* pCmdUI)
{
	// figure out which edit control is frontmost
	int iSelectedTab = m_tabCtrl.GetCurSel();
	// only the first panel is editable, and only if the doc's editable flag is set
	pCmdUI->Enable(	m_pEditCtrls[iSelectedTab]->CanUndo());
}

//	Make a list of icons that can go on the tabs.
//	Currently, we just have one icon, to signal an error.
void CInputDocView::makeImageList()
{
	m_imageList.Create(GetSystemMetrics(SM_CXSMICON),
		GetSystemMetrics(SM_CYSMICON), TRUE, 1, 1);

	HICON hiconItem;        // icon for list view items
	hiconItem = LoadIcon(/*AfxGetInstanceHandle()*/NULL, MAKEINTRESOURCE(IDI_ERROR));
	ASSERT(hiconItem);
	m_imageList.Add(hiconItem);
	DeleteObject(hiconItem);

#ifndef rde270
	// add some 'clock' icons so we can show which tab is being loaded.
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_LOADING_1));
	VERIFY(CResultStream::kLoadingIcon1 == m_imageList.Add(hiconItem));
	DeleteObject(hiconItem);
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_LOADING_2));
	VERIFY(CResultStream::kLoadingIcon2 == m_imageList.Add(hiconItem));
	DeleteObject(hiconItem);
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_LOADING_3));
	VERIFY(CResultStream::kLoadingIcon3 == m_imageList.Add(hiconItem));
	DeleteObject(hiconItem);

	// error icons
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_ERR_LOADING_1));
	VERIFY(CResultStream::kLoadingErrorIcon1 == m_imageList.Add(hiconItem));
	DeleteObject(hiconItem);
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_ERR_LOADING_2));
	VERIFY(CResultStream::kLoadingErrorIcon2 == m_imageList.Add(hiconItem));
	DeleteObject(hiconItem);
	hiconItem = LoadIcon(AfxGetInstanceHandle(), MAKEINTRESOURCE(IDI_ERR_LOADING_3));
	VERIFY(CResultStream::kLoadingErrorIcon3 == m_imageList.Add(hiconItem));
	DeleteObject(hiconItem);
#endif

	m_tabCtrl.SetImageList( &m_imageList);
}


void CInputDocView::OnEditFind()
{
	CInputDoc* pDoc = (CInputDoc*) GetDocument();
	CResultStream* pS = getSelectedResultStream();
	ASSERT(pS);
	m_pFindDlg = new CDlgFind(pS->getDisplayInfo()); //CFindReplaceDialog();
	m_pFindDlg->Create(TRUE, gsFindWhat,
		NULL, //replace with
#ifndef rde270
		// unicode (or RE3, whichever) requires that we fix a direction, so pick 'down'
		FR_DOWN | FR_HIDEUPDOWN | gdwFindFlags, // flags
#else   // rde270
		FR_HIDEUPDOWN | gdwFindFlags, // flags
#endif  // rde270
		this);

}

void CInputDocView::OnUpdateEditFind(CCmdUI* pCmdUI)
{
	pCmdUI->Enable(TRUE);
}


LONG CInputDocView::OnFindReplace(WPARAM wParam, LPARAM lParam)
{
	FINDREPLACE* pFind = (FINDREPLACE*) lParam;

	/*typedef struct {    // fr
	DWORD        lStructSize;
	HWND         hwndOwner;
	HINSTANCE    hInstance;
	DWORD        Flags;
	LPTSTR        lpstrFindWhat;
	LPTSTR        lpstrReplaceWith;
	WORD         wFindWhatLen;
	WORD         wReplaceWithLen;
	LPARAM        lCustData;
	LPFRHOOKPROC lpfnHook;
	LPCTSTR       lpTemplateName;
}*/

	if(pFind->Flags & FR_DIALOGTERM)
	{
		//delete m_pFindDlg;
		m_pFindDlg=NULL;
		return 0;
	}

	gsFindWhat = pFind->lpstrFindWhat;	// save for next time or F3
	gdwFindFlags = pFind->Flags;		// save for next time or F3

	return doFind();
}

LONG CInputDocView::doFind()
{
	int iSelectedTab = m_tabCtrl.GetCurSel();

	/*
	typedef struct _findtextex
	{
		CHARRANGE chrg;      // range to search
		LPSTR lpstrText;     // null-terminated string to find
		CHARRANGE chrgText;  // range in which text is found
	} FINDTEXTEX;
	*/


	FINDTEXTEX ft;
	CHARRANGE cr;
	m_pEditCtrls[iSelectedTab]->GetSel(cr);
	m_iLastFoundPos = (cr.cpMax>cr.cpMin)?cr.cpMax:cr.cpMin;

#ifndef rde270
	ft.lpstrText = (LPCTSTR)gsFindWhat;
#else   // rde270
	const char* p = LPCTSTR(gsFindWhat);
	ft.lpstrText=const_cast<char*> (p);
#endif  // rde270
	ft.chrg.cpMin= m_iLastFoundPos+1; // skip us over the last found (will be 0 if not found last time)
	ft.chrg.cpMax=-1;

	// this understands the flags FR_MATCHCASE && FR_WHOLEWORD
	m_iLastFoundPos = m_pEditCtrls[iSelectedTab]->FindText(gdwFindFlags, &ft);

	// should we start again from the top?
	if(ft.chrg.cpMin>0 && m_iLastFoundPos==-1)
	{
		ft.chrg.cpMin=0;
		m_iLastFoundPos = m_pEditCtrls[iSelectedTab]->FindText(gdwFindFlags, &ft);
	}

	if(m_iLastFoundPos>-1)
	{
		m_pEditCtrls[iSelectedTab]->SetSel(ft.chrgText);

	}
	else
	{
		CString s;
		s.Format(_T("Cannot find the string '%s'"), (LPCTSTR)gsFindWhat);
		AfxMessageBox(s);
	}
	return 0;
}

void CInputDocView::OnEDITFindAgain()
{
	if(gsFindWhat.IsEmpty())
		OnEditFind();
	else
		doFind();
}


// I abandoned this after considering what I'd have do to make it work:
//		Add process sequence to the processStatus
//		Add the processStatus to the constructor for resultStream
//		Add findProcessor(processorID) to processSequence

//	I may come back to it later when I have time to do all that

// JDH 5/28/99 Make popup-menu shortcut to processor properties

void CInputDocView::OnUpdateProcessorProperties(CCmdUI* pCmdUI)
{

}

// JDH 5/28/99 Make popup-menu shortcut to processor properties
void CInputDocView::OnProcessorProperties()
{
	CResultStream* pRS = getSelectedResultStream();
	if(!pRS)
		return;

	CString sID = pRS->getDescriptor()->getProcessID();

}

void CInputDocView::SetBaseReadOnly(BOOL bReadOnly)
{
	m_pEditCtrls[0]->SetReadOnly(bReadOnly);
}
