// CWListView.h : header file
//
// 1.7a1 03-Dec-1999 hab Allow for test data
//                       Remove ctrl-Ms at end of lines
// 2.1.2 13-Mar-2000 jdh unimplemented method getRowOfEntry
/////////////////////////////////////////////////////////////////////////////
// CWListView view

#include <afxcview.h>
#include "CWList.h"
#include "CWTopicView.h"
#include "CWListCtrl.h"
#include "LangModelsDoc.h"
class CWListTopic;

class CWListView : public CView //CCtrlView //CListView
{

protected:

	CWListEntry* getEntryOfSelection();
	CWListTopic* m_pTopic;
	CImageList m_imageList;
	CWListView();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CWListView)
	BOOL			m_bDragging;
	int				m_iItemDrag;
	int				m_iItemDrop;
	CPoint			m_ptHotSpot;
	CPoint			m_ptOrigin;
	CSize			m_sizeDelta;
	CImageList		*m_pimageListDrag;
	int				m_iDragHorizontalLimit;
	CWListCtrl		m_listCtrl;

// Attributes
public:
	int getFirstSelectedRow();
	CWList* m_pList;

#ifndef mr270
	int m_nBookmarkCount;
#endif // mr270a


// Operations
public:
	CFont* getLangFont();
	LONG doFindReplace(FINDREPLACE * pFR);
	void retrieveHeaderParams();
	void restoreHeaderParams();
	//int getRowOfEntry(CWListEntry* pEntry); //jdh 3/13/2000 removed because it wasn't implemented anyhow

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWListView)
	public:
	virtual void OnInitialUpdate();
	protected:
	virtual void OnDraw(CDC* pDC);
	virtual void OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint);
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual ~CWListView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
public:
	const CTextDisplayInfo* getLangDisplayInfo();
		afx_msg void OnEditProperties();
		afx_msg void OnEditInsertEntry();
protected:
	void setUndoOperation(int iOperation=0, CWListRowItem* pItem=NULL, int iRow=-1);
	CWListRowItem* m_pUndoRowItem;
	int m_iUndoOperation;
	int m_iUndoRow;
	CWListRowItem* m_pClipboardRowItem;
//	int m_iClipboardRow;
	CWListRowItem* getRowItem(int index);
	void selectRowItem(int index, BOOL bSelect=TRUE);
	//{{AFX_MSG(CWListView)
	afx_msg void OnEditInsertEnviron();
	afx_msg void OnUpdateEditInsertEnviron(CCmdUI* pCmdUI);
	afx_msg void OnEditDelete();
	afx_msg void OnUpdateEditDelete(CCmdUI* pCmdUI);
	afx_msg void OnUpdateEditInsertEntry(CCmdUI* pCmdUI);
	afx_msg void OnEditInsertSecondary();
	afx_msg void OnUpdateEditInsertSecondary(CCmdUI* pCmdUI);
	afx_msg void OnEditCopy();
	afx_msg void OnUpdateEditCopy(CCmdUI* pCmdUI);
	afx_msg void OnEditPaste();
	afx_msg void OnUpdateEditPaste(CCmdUI* pCmdUI);
	afx_msg void OnEditCut();
	afx_msg void OnUpdateEditCut(CCmdUI* pCmdUI);
	afx_msg void OnEditUndo();
	afx_msg void OnUpdateEditUndo(CCmdUI* pCmdUI);
	afx_msg void OnUpdateEditProperties(CCmdUI* pCmdUI);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnEditInsertComment();
	afx_msg void OnUpdateEditInsertComment(CCmdUI* pCmdUI);
#ifndef hab17a1
	afx_msg void OnEditInsertTestData();
	afx_msg void OnUpdateEditInsertTestData(CCmdUI* pCmdUI);
#endif //hab17a1

#ifndef mr270a
	afx_msg void OnBookmarkOuiNon();
	afx_msg void OnBookmarkNext();
	afx_msg void OnBookmarkPrevious();
	afx_msg void OnBookmarkClear();
	afx_msg void OnUpdateBookmarkNext(CCmdUI* pCmdUI);
	afx_msg void OnUpdateBookmarkPrevious(CCmdUI* pCmdUI);
	afx_msg void OnUpdateBookmarkClearAll(CCmdUI* pCmdUI);


#endif // mr270a

	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
