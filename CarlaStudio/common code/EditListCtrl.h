#if !defined(AFX_EDITLISTCTRL_H__3D3D2902_823D_11D2_864F_C8DF0CC10000__INCLUDED_)
#define AFX_EDITLISTCTRL_H__3D3D2902_823D_11D2_864F_C8DF0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// EditListCtrl.h : header file
//
// 2.4.1 20-Oct-2000 hab Do not do in-place edit on comments and test data
#include "GuruHeaderCtrl.h"
#include <afxtempl.h>

class CGuruColumn
{
public:
	//CFont* m_pFont;
	CString m_sName;
	void insertColumnIntoCtrl(CListCtrl* pLC);
	CGuruColumn(LPCTSTR pszTitle,
				int nWidth,
				DWORD flags);
			//CFont* m_pFont=NULL); // ! caller should must not give me one of those temporary CFont ptrs.
	int m_nWidth;
	enum{ALLOW_EDITTING=1, SPECIAL_SORT_ORDER=2};
	DWORD m_dwFlags;
};

/////////////////////////////////////////////////////////////////////////////
// CEditListCtrl window

class CInPlaceEdit;
class CEditListCtrl : public CListCtrl
{
DECLARE_DYNAMIC(CEditListCtrl)
// Construction
public:
	CEditListCtrl();

// Attributes
public:
	virtual CString getItemText(int nRow, int nCol) {return GetItemText(nRow,nCol);}// subclass can override this, whearas GetTextItem doesn't appear to be virtual

public:	// flags for customizing without subclassing methods
	enum EHighlight {HIGHLIGHT_LABEL=0,HIGHLIGHT_NORMAL, HIGHLIGHT_ALLCOLUMNS, HIGHLIGHT_ROW};
	UINT  m_eHighlightMethod;		// Indicate type of selection highlighting
	DWORD m_dwFlagsForInPlaceEdit;
	enum{ ALLOW_SORTING=1, ALLOW_DRAG_REORDER=2, DOUBLE_CLICK_NEW=4, MULTIPLE_FONTS=8, HANDLE_EDITTING=16 };
	DWORD m_dwFlags;

protected:

	BOOL			m_bDragging;
	int				m_iItemDrag;
	int				m_iItemDrop;
	CPoint			m_ptHotSpot;
	CPoint			m_ptOrigin;
	CSize			m_sizeDelta;
	CImageList		*m_pimageListDrag;
	int				m_iDragHorizontalLimit;
	CGuruHeaderCtrl	m_headerctrl;
	CTypedPtrArray<CPtrArray, CGuruColumn*> m_columns;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CEditListCtrl)
	public:
	virtual void DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct);
	virtual BOOL Create(DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID);
	protected:
	virtual void PreSubclassWindow();
	//}}AFX_VIRTUAL

// Implementation
public:
	DWORD m_dwColumnEditBitfield;
	int m_nMaxItemLength;
	void insertColumn(CGuruColumn* pCol);
	virtual void initialSort();
	LPARAM getFirstSelectedItemData(int* pIndex =NULL);
	virtual void finishCreate();
	static int CALLBACK CompareFunc(LPARAM lParam1, LPARAM lParam2,  LPARAM pListCtrl);
	int HitTestEx(CPoint &point, int *col) const;
	virtual ~CEditListCtrl();
	void forceRowHeightRecalc();
	CEdit* EditSubLabel( int nItem, int nCol );

	// Generated message map functions
protected:
	char* m_pStrBuff;
	virtual int getLargestFontHeight();
	virtual void addNewItem();
	virtual void keyPressedOnItem(LV_KEYDOWN* pLVKeyDow, LPARAM p, int iItem);
	virtual void deleteItem(LPARAM pItem, int nItem);
	virtual void activateItem(LPARAM lpItem, int index);
//	CInPlaceEdit* m_pEditCtrl;
	BOOL m_bDidDrag;
	CImageList m_imageList;
	virtual void insertColumn(LPCTSTR pszName, int iWidth, DWORD flags=NULL);
	virtual void makeColumns();
	virtual void makeImageList();
	virtual void itemModified(LPARAM lParam, int nCol);
	virtual void drawItemText(CDC* pDC, int nRow, int nCol, LPCTSTR pszStr, CRect &rect, UINT nJustifyFlag);
	virtual void sortItems();
	void OnHeaderClicked(NMHDR* pNMHDR, LRESULT* pResult);
	BOOL m_bSortAscending;
	int m_nSortedCol;
	virtual int compareItems(LPARAM pItem1, LPARAM pItem2);
	virtual CString getItemText(LPARAM lp, int nCol);
	int m_nLastClickedItem;
	virtual CFont* getFontForSubItem(int nItem, int nCol);
	bool m_bInEditingMode;
	virtual void listModified() {} // can override to notify the owning document
	virtual void finishDrag(int nFrom, int nTo) ;
	virtual void setItemText(int nItem, int nSubItem, LPCTSTR pszText) {SetItemText(nItem, nSubItem, pszText);}
	//{{AFX_MSG(CEditListCtrl)
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg void OnEndLabelEdit(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnBegindrag(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg void OnGetdispinfo(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnInsertitem(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDblclk(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnKeydown(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	afx_msg LRESULT OnSetFont(WPARAM wParam, LPARAM);
	afx_msg void MeasureItem ( LPMEASUREITEMSTRUCT lpMeasureItemStruct );

	DECLARE_MESSAGE_MAP()
#ifndef hab241
	  virtual int getItemType(int nItem) {return 0;} // default type is 0
#endif // hab241
private:
	bool m_bHeaderSubclassed;
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_EDITLISTCTRL_H__3D3D2902_823D_11D2_864F_C8DF0CC10000__INCLUDED_)
