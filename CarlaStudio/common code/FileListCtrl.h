// filelistctrl.h: interface for the CFileListCtrl class.
// This is seperated from filelist.h so that I can make changes to the
// control, which will have few clients, without recompiling the many
// clients of the fileList
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FILELISTCTRL_H__D7BC9500_89D7_11D2_864F_C8DF0CC10000__INCLUDED_)
#define AFX_FILELISTCTRL_H__D7BC9500_89D7_11D2_864F_C8DF0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CFileList;
class CPathDescriptor;


/////////////////////////////////////////////////////////////////////////////
// CFileListCtrl window

class CFileListCtrl : public CListCtrl
{
// Construction
public:
	CFileListCtrl(CFileList* pFileList, LPCTSTR lpszDefaultExt, UINT nFilterID);
	CFileListCtrl(CFileList* pFileList, LPCTSTR lpszDefaultExt=NULL, LPCTSTR lpszFilter=NULL);

// Attributes
public:
	CString m_sFilter;
	CString m_sDefaultExt;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFileListCtrl)
	public:
	virtual BOOL Create(DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);
	//}}AFX_VIRTUAL

// Implementation
public:
	BOOL isEmpty();
	void addFilePathD(CPathDescriptor *pd);
	void OnEditItem();
	void OnOK();
	BOOL m_bListChanged;
	void insertItem(CPathDescriptor* pD);
	void OnRemoveButton();
	void OnAddButton();
	void populate();
	//void setPathList(CPathDescArray& paths);
	virtual ~CFileListCtrl();

	virtual void OnCancel();

	// Generated message map functions
protected:
	CPathDescriptor* getFirstSelectedItem(int *pnItem=NULL);
	CFileList* m_pFileList;
	void disablePath(CPathDescriptor* pD);
	void enablePath(CPathDescriptor* pD);
	void insertColumn(LPCTSTR pszName, int iWidth);

	//{{AFX_MSG(CFileListCtrl)
	afx_msg void OnDeleteitem(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnItemchanged(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

#endif // !defined(AFX_FILELISTCTRL_H__D7BC9500_89D7_11D2_864F_C8DF0CC10000__INCLUDED_)
