// rde269 25-Jun-2002   Added 'GetSelCtrl()' so we can manually return the appropriate RE ctrl
//                      to fix the jump to Shoebox problem of losing focus when alt-tab'ing
//                      away from CS and returning.
// rde270 25-Jun-2002   Changed the RichEdit stuff to use 'AsyncLoadRichEditCtrl', which allows
//                      for asynchronously loading the RichEdit controls to get around the
//                      '10 minutes to load the trample log' I discovered on switching to
//                      unicode.
#if !defined(AFX_InputDocView_H__0AEF6401_1702_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_InputDocView_H__0AEF6401_1702_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// InputDocView.h : header file
//
#include "InputDocTabBar.h"
#include "afxtempl.h"

#ifndef rde270
class AsyncLoadRichEditCtrl;
#endif

const UINT kBasePanelID = 7000;	// what should this be?

/////////////////////////////////////////////////////////////////////////////
// CInputDocView view
class CResultsDescriptor;
class CResultStream;
class CProcessStatus;

class CInputDocView : public CView
{
#ifndef rbr253
#define MAXPANELS 100
#endif // rbr253
protected:
	CImageList m_imageList;	// this could just as well belong to the m_tabCtrl, where it is used
	CInputDocView();           // protected constructor used by dynamic creation
	DECLARE_DYNCREATE(CInputDocView)
	void populatePanels();
#ifndef rde270
	void choosePanel(AsyncLoadRichEditCtrl* pEdit);
	CTypedPtrArray<CPtrArray, AsyncLoadRichEditCtrl*>  m_pEditCtrls;
#else
	void choosePanel(CWnd* pEdit);
	CTypedPtrArray<CPtrArray, CRichEditCtrl*>  m_pEditCtrls;
#endif

#ifndef rbr253
	int m_iLine[MAXPANELS];
#endif // rbr253
//	CTypedPtrArray<CPtrArray, CEdit*>  m_pEditCtrls;
	afx_msg void OnParseButton();
	BOOL OnToolTip(UINT id, NMHDR *pTTTStruct, LRESULT *pResult);

	CInputDocTabBar m_tabCtrl;
// Attributes
public:


// Operations
public:
	void SetBaseReadOnly(BOOL bReadOnly);
	BOOL  saveBaseStream(LPCTSTR lpszPat);
	CResultStream* getSelectedResultStream();
	void updatePanels();
#ifndef rde270
	void addPanel(CResultStream* pStream, int id, BOOL bSyncStreamIn = false);
	void stopLoadingPanels();
	void SpeedUpLoadingCurTab();
	void DontSpeedUpLoadingCurTab();
#else
	void addPanel(CResultStream* pStream, int id);
#endif
#ifndef rde269
	AsyncLoadRichEditCtrl* GetSelCtrl();
#endif
	void removePanels();
	void tabSelected(int iTab);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CInputDocView)
	public:
	virtual void OnInitialUpdate();
	protected:
	virtual void OnDraw(CDC* pDC);      // overridden to draw this view
	virtual void OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint);
	virtual void OnActivateView(BOOL bActivate, CView* pActivateView, CView* pDeactiveView);
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual ~CInputDocView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

	// Generated message map functions
protected:
	LONG doFind();
	int m_iLastFoundPos;
	CFindReplaceDialog* m_pFindDlg;
	LONG OnFindReplace(WPARAM wParam, LPARAM lParam);

	void makeImageList();
	CResultStream* m_pBaseStream;
#ifndef rde270
	static DWORD CALLBACK OnStreamInChunkComplete(AsyncLoadRichEditCtrl* pCtrl, DWORD_PTR dwCookie, LPCTSTR szBuff);
	void InvalidateCurTab();
	afx_msg void OnStreamInComplete( UINT id, NMHDR * pNotifyStruct, LRESULT * result );
#endif
	//{{AFX_MSG(CInputDocView)
	afx_msg BOOL OnHelpInfo(HELPINFO* pHelpInfo);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnContextMenu(CWnd* pWnd, CPoint point);
	afx_msg void OnEditCopy();
	afx_msg void OnUpdateEditCopy(CCmdUI* pCmdUI);
	afx_msg void OnOpenStreamExternal();
	afx_msg void OnUpdateOpenStreamExternal(CCmdUI* pCmdUI);
	afx_msg void OnEditCut();
	afx_msg void OnEditPaste();
	afx_msg void OnUpdateEditPaste(CCmdUI* pCmdUI);
	afx_msg void OnUpdateEditCut(CCmdUI* pCmdUI);
	afx_msg void OnEditUndo();
	afx_msg void OnUpdateEditUndo(CCmdUI* pCmdUI);
	afx_msg void OnEditFind();
	afx_msg void OnUpdateEditFind(CCmdUI* pCmdUI);
	afx_msg void OnEDITFindAgain();
	afx_msg void OnUpdateProcessorProperties(CCmdUI* pCmdUI);
	afx_msg void OnProcessorProperties();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_InputDocView_H__0AEF6401_1702_11D2_A09E_E12649467D2F__INCLUDED_)
