// CWFormView.cpp : implementation file
//
// jdh 9/1/99 changed kLabelWidth from 200 to 250

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "CWFormView.h"
#include "CWTopic.h"
#include "LangModelsDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CWTopic* gTopicForViewCreation; // here 'cause SPLITTER:CreateView doesn't let us pass any parameters to the constructor of the view


/////////////////////////////////////////////////////////////////////////////
// CWFormView

IMPLEMENT_DYNCREATE(CWFormView, CScrollView)

CWFormView::CWFormView()
{
	didInitialUpdate=FALSE;
	if(gTopicForViewCreation)
	{
			ASSERTX(gTopicForViewCreation->IsKindOf(RUNTIME_CLASS(CWFormTopic)));
		m_pTopic = (CWFormTopic*) gTopicForViewCreation;
	}
	else
	{
		TRACE (_T("WARNING: gTopicForViewCreation == 0\n"));
		m_pTopic= NULL;
	}
}

CWFormView::~CWFormView()
{
}

//	PROBABLY UNUSED, SINCE THE SPLITTER USES THE DEFAULT CONSTRUCTOR
CWFormView::CWFormView(CWFormTopic* pTopic)
{
	ASSERTX(FALSE); // NOTICE IF IT GETS USED
	ASSERTX(gTopicForViewCreation->IsKindOf(RUNTIME_CLASS(CWFormTopic)));
	m_pTopic = (CWFormTopic*) gTopicForViewCreation;
}

BEGIN_MESSAGE_MAP(CWFormView, CScrollView)

	//{{AFX_MSG_MAP(CWFormView)
	ON_WM_ERASEBKGND()
	ON_WM_COPYDATA()
	ON_COMMAND(ID_EDIT_COPY, OnEditCopy)
	ON_COMMAND(ID_EDIT_PASTE, OnEditPaste)
	ON_UPDATE_COMMAND_UI(ID_EDIT_PASTE, OnUpdateEditPaste)
	ON_COMMAND(ID_EDIT_UNDO, OnEditUndo)
	ON_COMMAND(ID_EDIT_CUT, OnEditCut)
	ON_UPDATE_COMMAND_UI(ID_EDIT_CUT, OnUpdateEditCut)
	ON_WM_MOVE()
	ON_WM_CANCELMODE()
	ON_WM_SIZE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWFormView drawing

// Causes all the data in the checkboxes, editctrls, etc to be loaded back into
//  the member variables of the model
void CWFormView::retrieveData()
{
	if(m_pTopic)
		for(int i=0; i<m_pTopic->m_pItems.GetSize(); i++)
		{
			m_pTopic->m_pItems[i]->retrieveData();
		}
}

void CWFormView::OnInitialUpdate()
{
	if (didInitialUpdate)	// initial view gets called twice
	{ TRACE(_T("CFormView::OnInitialUpdate() called twice.\n"));
		return;
	}
	didInitialUpdate = TRUE;


	SIZE sz;
	sz.cx=100; sz.cy=100;
	SetScaleToFitSize(sz);

/*	HGDIOBJ fnt = GetStockObject(SYSTEM_FONT);
	SetFont( CFont* pFont, FALSE);

	HFONT hfnt, hOldFont;

	hfnt = GetStockObject(SYSTEM_FONT);
	if (hOldFont = SelectObject(hdc, hfnt)) {
	//    TextOut(hdc, 10, 50, _T("Sample ANSI_VAR_FONT text."), 26);
	 //   SelectObject(hdc, hOldFont);
	}
*/
	const int kTopMargin = 10;
	int iTop = kTopMargin;
	const int kLabelWidth = 250;
	const int kLeft = 10;

	// HAVE THE TOPIC ITSELF POPULATE THIS FORM WITH CONTROLS

	CLangModelsDoc* pLangDoc = (CLangModelsDoc*)GetDocument();
	ASSERTX(pLangDoc);


	if(m_pTopic)
	{
		pLangDoc->m_bSettingUpPhase = TRUE;
CString s;
		for(int i=0; i<m_pTopic->m_pItems.GetSize(); i++)
		{
			CWAtomic* pItem = m_pTopic->m_pItems[i];
			ASSERTX(pItem);
//s.Format(_T("Adding item %d"),i );
//AfxMessageBox(s);
			iTop += pItem->AddToView(kLeft, iTop, kLabelWidth, this, kBaseFormControlID+i);
			iTop += kHorizontalLeading;
		}
		pLangDoc->m_bSettingUpPhase = FALSE;
	}

	CSize sizeTotal;
	// TODO: calculate the total size of this view
	sizeTotal.cx = sizeTotal.cy = iTop;
	SetScrollSizes(MM_TEXT, sizeTotal);

	CScrollView::OnInitialUpdate();

}

void CWFormView::OnDraw(CDC* pDC)
{
	CDocument* pDoc = GetDocument();
	// TODO: add draw code here
}

/////////////////////////////////////////////////////////////////////////////
// CWFormView diagnostics

#ifdef _DEBUG
void CWFormView::AssertValid() const
{
	CScrollView::AssertValid();
}

void CWFormView::Dump(CDumpContext& dc) const
{
	CScrollView::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CWFormView message handlers

BOOL CWFormView::OnEraseBkgnd(CDC* pDC)
{
	DWORD clr = GetSysColor(COLOR_3DFACE);
	CBrush br(clr);
	CBrush* pOldBrush = (CBrush*) pDC->SelectObject(br);

	 CRect rect;
	 pDC->GetClipBox(&rect);     // Erase the area needed

	 pDC->PatBlt(rect.left, rect.top, rect.Width(),
		rect.Height(), PATCOPY);
//     pDC->SelectObject(pOldBrush);
	return TRUE;

//	return CView::OnEraseBkgnd(pDC);
}



BOOL CWFormView::OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult)
{
	// TODO: Add your specialized code here and/or call the base class

ASSERTX(FALSE); ///// NEVER CALLED!
	return CScrollView::OnNotify(wParam, lParam, pResult);
}

void CWFormView::OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint)
{
	setFonts();
}

void CWFormView::setFonts()
{
	//CProjectDoc *pProjectDoc = theApp.getProject();
	//ASSERTX(pProjectDoc);
	CLangModelsDoc* pLangDoc = (CLangModelsDoc*)GetDocument();

	if(m_pTopic)
		for(int i=0; i<m_pTopic->m_pItems.GetSize(); i++)
		{
			CWAtomic* pItem = m_pTopic->m_pItems[i];
			// TO DO: fill in these other two fonts
			pItem->doUpdate();//pLangDoc->getLangFont(), NULL, NULL);
		}
}

BOOL CWFormView::OnCopyData(CWnd* pWnd, COPYDATASTRUCT* pCopyDataStruct)
{
	return CScrollView::OnCopyData(pWnd, pCopyDataStruct);
}

void CWFormView::OnEditCopy()
{
	CWnd* pW = GetFocus();
	if(pW && pW->IsKindOf(RUNTIME_CLASS(CEdit)))
		((CEdit*)pW)->Copy();
}

void CWFormView::OnEditPaste()
{
	CWnd* pW = GetFocus();
	if(pW && pW->IsKindOf(RUNTIME_CLASS(CEdit)))
		((CEdit*)pW)->Paste();
}

void CWFormView::OnUpdateEditPaste(CCmdUI* pCmdUI)
{
	CWnd* pW = GetFocus();
	pCmdUI->Enable(pW && pW->IsKindOf(RUNTIME_CLASS(CEdit)));
}

void CWFormView::OnEditUndo()
{
	CWnd* pW = GetFocus();
	if(pW && pW->IsKindOf(RUNTIME_CLASS(CEdit)))
		((CEdit*)pW)->Undo();
}

void CWFormView::OnEditCut()
{
	CWnd* pW = GetFocus();
	if(pW && pW->IsKindOf(RUNTIME_CLASS(CEdit)))
	{
		//leave it to OnUpdateEditCut to not allow this unless there was somethign to cut
		CEdit* pE = (CEdit*)pW;
		pE->Cut();
	}
}

void CWFormView::OnUpdateEditCut(CCmdUI* pCmdUI)
{
	CWnd* pW = GetFocus();
	if(pW && pW->IsKindOf(RUNTIME_CLASS(CEdit)))
	{
		CEdit* pE = (CEdit*)pW;
		int start, finish;
		pE->GetSel(start, finish);
		pCmdUI->Enable(start != finish);
	}
	else
		pCmdUI->Enable(FALSE);
}




void CWFormView::OnSize(UINT nType, int cx, int cy)
{
	CScrollView::OnSize(nType, cx, cy);

	CLangModelsDoc* pLangDoc = (CLangModelsDoc*)GetDocument();

	if(m_pTopic)
		for(int i=0; i<m_pTopic->m_pItems.GetSize(); i++)
		{
			CWAtomic* pItem = m_pTopic->m_pItems[i];
			// TO DO: fill in these other two fonts
			pItem->OnSize(nType, cx,cy);//pLangDoc->getLangFont(), NULL, NULL);
		}
}

afx_msg void CWFormView::OnDataModified()
{
 GetDocument()->SetModifiedFlag();
}


LONG CWFormView::doFindReplace(FINDREPLACE * pFR)
{
	AfxMessageBox(_T("Sorry, Find-Replace in this kind of view is still under construction."));
	return 0;
}

//DEL  void CWFormView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags  )
//DEL  {
//DEL ASSERT(FALSE);
//DEL  }
//DEL void CWFormView::OnKeyDownInControl(WPARAM wParam, LPARAM lParam, LRESULT* pResult)
//DEL {
//DEL //ASSERT(FALSE);
//DEL 	if(wParam == VK_TAB)
//DEL 		ASSERT(FALSE);
//DEL }

BOOL CWFormView::PreTranslateMessage(MSG* pMsg)
{
	if( pMsg->message == WM_KEYDOWN )
	{
		if(pMsg->wParam == VK_TAB)	// tab to the next item in the form
		{
			CWnd* p = this->GetNextDlgTabItem(this->GetFocus());
			if(p)
			{
				p->SetFocus();
				// to do: figure out how to scroll the item into position
			}
			return TRUE;
		}
	}
/*never get these
	if(pMsg->message == BN_CLICKED)
		TRACE(_T("BN_CLICKED \n"));
	if(pMsg->message == BN_HILITE)
		TRACE(_T("BN_HILITE \n"));
	if(pMsg->message == BN_PUSHED)
		TRACE(_T("BN_PUSHED \n"));
*/
	return CScrollView::PreTranslateMessage(pMsg);
}

const CTextDisplayInfo* CWFormView::getLangDisplayInfo()
{
	return ((CLangModelsDoc*)GetDocument())->getLangDisplayInfo();
}
