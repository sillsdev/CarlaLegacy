// BlueView.cpp : implementation of the CWTopicTreeView class
//

#include "stdafx.h"
#include "CARLAStudioApp.h"

#include "TabbedTreeDoc.h"
#include "TabbedTreeChild.h"
#include "CWTopicTreeView.h"

#include "CWTopic.h"
#include "CWInterface.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWTopicTreeView

IMPLEMENT_DYNCREATE(CWTopicTreeView, CTreeView)

BEGIN_MESSAGE_MAP(CWTopicTreeView, CTreeView)
	//{{AFX_MSG_MAP(CWTopicTreeView)
	ON_NOTIFY_REFLECT(TVN_SELCHANGED, OnSelchanged)
	ON_WM_KILLFOCUS()
	ON_NOTIFY_REFLECT(NM_SETFOCUS, OnSetfocus)
	ON_NOTIFY_REFLECT(TVN_KEYDOWN, OnKeydown)
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CTreeView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CTreeView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CTreeView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWTopicTreeView construction/destruction

CWTopicTreeView::CWTopicTreeView()
{
	m_buildingTree = FALSE;

}

CWTopicTreeView::~CWTopicTreeView()
{
}

//DEL BOOL CWTopicTreeView::PreCreateWindow(CREATESTRUCT& cs)
//DEL {
//DEL 	// TODO: Modify the Window class or styles here by modifying
//DEL 	//  the CREATESTRUCT cs
//DEL
//DEL 	return CTreeView::PreCreateWindow(cs);
//DEL }

/////////////////////////////////////////////////////////////////////////////
// CWTopicTreeView drawing

void CWTopicTreeView::OnDraw(CDC* pDC)
{
	CTabbedTreeDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	// TODO: add draw code for native data here
}

void CWTopicTreeView::OnInitialUpdate()
{

	CTreeView::OnInitialUpdate();

	GetTreeCtrl().ModifyStyle(NULL, TVS_SHOWSELALWAYS |
		TVS_HASBUTTONS | TVS_HASLINES | TVS_LINESATROOT); // | TVS_LINESATROOT);


	TopicTabChanged();
	// TODO: You may populate your TreeView with items by directly accessing
	//  its tree control through a call to GetTreeCtrl().
}

/////////////////////////////////////////////////////////////////////////////
// CWTopicTreeView printing

BOOL CWTopicTreeView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CWTopicTreeView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CWTopicTreeView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CWTopicTreeView diagnostics

#ifdef _DEBUG
void CWTopicTreeView::AssertValid() const
{
	CTreeView::AssertValid();
}

void CWTopicTreeView::Dump(CDumpContext& dc) const
{
	CTreeView::Dump(dc);
}

CTabbedTreeDoc* CWTopicTreeView::GetDocument() // non-debug version is inline
{
	ASSERTX(m_pDocument->IsKindOf(RUNTIME_CLASS(CTabbedTreeDoc)));
	return (CTabbedTreeDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CWTopicTreeView message handlers


void CWTopicTreeView::TopicTabChanged ()
{
	//TRACE("TopicTabChanged\n");

	CTabbedTreeDoc* pDoc = GetDocument();
	CWTopicTab* pTab = pDoc->GetCurrentTopicTab();


	CTreeCtrl & treeCtl = GetTreeCtrl();
	TV_INSERTSTRUCT subItem;

	m_buildingTree = TRUE;


	treeCtl.DeleteAllItems();

//	char* lpsz;

	subItem.hInsertAfter = TVI_LAST;
	subItem.item.mask = TVIF_TEXT | TVIF_PARAM;

	HTREEITEM hSelectItem = 0;

	for (int topicIndex = 0; topicIndex < pTab->m_topics.GetSize(); topicIndex++)
	{
		CWTopic *pCurrentMainTopic = pTab->m_topics[topicIndex];
		ASSERTX(pCurrentMainTopic);

	//	pCurrentMainTopic->addToTree(subItem);

		subItem.hParent = TVI_ROOT;

		if (pCurrentMainTopic->IsKindOf(RUNTIME_CLASS(CWHeadingTopic)))
		{
			CWHeadingTopic* pHeadingTopic = (CWHeadingTopic*)pCurrentMainTopic;
			subItem.item.pszText = (LPTSTR) LPCTSTR( pHeadingTopic->m_label); // this is ok so long as we don't change the label
			subItem.item.lParam = (LPARAM) pHeadingTopic;
			HTREEITEM hHeadingItem = treeCtl.InsertItem(&subItem);

			subItem.hParent = hHeadingItem;
			for(int subIndex =0; subIndex < pHeadingTopic->m_pTopics.GetSize(); subIndex++)
			{
			//	subItem.hParent = hHeadingItem;

				CWTopic *pSubTopic = pHeadingTopic->m_pTopics[subIndex];
				ASSERTX(pSubTopic);

				subItem.item.pszText = (LPTSTR) LPCTSTR( pSubTopic->m_label); // this is ok so long as we don't change the label

				subItem.item.lParam = (LPARAM) pSubTopic;
				HTREEITEM hNewItem = treeCtl.InsertItem(&subItem);
				ASSERTX(hNewItem);

			//	if(topicIndex==0 && subIndex==0)
			//		treeCtl.SelectItem(hNewItem);
			}
			treeCtl.Expand(hHeadingItem, //hHeadingItem
						TVE_EXPAND);
			if(topicIndex==0)
			{	hSelectItem = hHeadingItem;
			}
		}
		else	// non-heading, top-level topic
		{
			//CWHeadingTopic* pHeadingTopic = (CWHeadingTopic*)pCurrentMainTopic;
			subItem.item.pszText = (LPTSTR) LPCTSTR( pCurrentMainTopic->m_label); // this is ok so long as we don't change the label
			subItem.item.lParam = (LPARAM) pCurrentMainTopic;
			HTREEITEM hItem = treeCtl.InsertItem(&subItem);
			if(topicIndex==0)
			{		hSelectItem = hItem;
			}
		}

		// select the first item (whether heading or normal topic)

//	crahes:	treeCtl.Expand(TVI_ROOT, //hHeadingItem
//						TVE_EXPAND);
	}

 // 	treeCtl.DeleteAllItems();

	ASSERTX(hSelectItem);
	treeCtl.SelectItem(hSelectItem);
	//treeCtl.EnsureVisible(hSelectItem);

		m_buildingTree = FALSE;
}



// TO DO: I think this gets called twice for an initial selection;
//     there should be a code we can check for

void CWTopicTreeView::OnSelchanged(NMHDR* pNMHDR, LRESULT* pResult)
{
	if(m_buildingTree)	// don't want to act on all these spurious messages
		return;

	NM_TREEVIEW* pNMTreeView = (NM_TREEVIEW*)pNMHDR;
	if (pNMTreeView->itemNew.lParam > 1000)
	{	CWTopic* new_topic = (CWTopic*) pNMTreeView->itemNew.lParam;

		CTabbedTreeDoc *pDoc = (CTabbedTreeDoc*) GetDocument();
		pDoc->GetCurrentInterface()->SetCurrentTopic(new_topic);
	}
	else
		ASSERTX(FALSE); // looks like a bad param

	*pResult = 0; // this was created by default
}

void CWTopicTreeView::OnKillFocus(CWnd* pNewWnd)
{
	CTreeView::OnKillFocus(pNewWnd);

	// TODO: Add your message handler code here

}

void CWTopicTreeView::OnSetfocus(NMHDR* pNMHDR, LRESULT* pResult)
{
// this is never called; i was trying to fix the problem of
	// the text view always getting the focus when it is
	// clicked on; I would rather it never get focus
	*pResult = 0;
}

void CWTopicTreeView::OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint)
{
	if(lHint==99)
		TopicTabChanged();
}

void CWTopicTreeView::OnKeydown(NMHDR* pNMHDR, LRESULT* pResult)
{
	TV_KEYDOWN* pTVKeyDown = (TV_KEYDOWN*)pNMHDR;

	// shift focus over to the data on tab or enter
	if(pTVKeyDown->wVKey == VK_TAB )
	{
		CTabbedTreeDoc *pDoc = (CTabbedTreeDoc*) GetDocument();
		pDoc->getFrame()->switchViewFocus(TRUE);
	}
	*pResult = 1; // non zero means don't search for this key in the list
}
