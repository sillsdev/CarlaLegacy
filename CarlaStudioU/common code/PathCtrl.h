// PathCtrl.h: interface for the CPathCtrl class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_PATHCTRL_H__CF02E961_98DB_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_PATHCTRL_H__CF02E961_98DB_11D2_864F_AC380CC10000__INCLUDED_

#include "PathDescriptor.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CSimpleFlatButton;
class CStaticFilespec;

class CPathCtrl : public CStatic
{
public:
	CPathCtrl(const CPathDescriptor& path,  // does not change the original
					 LPCTSTR lpszFilter,
					 LPCTSTR lpszDefaultExt,
					 UINT nButtonBitMapID,
					 UINT selectionPromptID=NULL,
					 UINT emptyPromptID=NULL,
					 //UINT nPathToolTipID=NULL, // didn't word
					 LPCTSTR pszDisplayWhenEmpty=_T(""),  // or this should be specified
					 DWORD nFlags=kCheckForExistence
					);

	virtual ~CPathCtrl();

// Implementation
public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	enum{		kSelectFolder=1,
				kCheckForExistence=2}; // not implemented
	DWORD m_nFlags;
	CPathDescriptor m_path;
	void init();
	virtual void OnDraw(CDC* pDC);

	// Generated message map functions
protected:
	UINT m_nPathToolTipID;
	CToolTipCtrl m_ToolTip;
	void updatePathDisplay();
	CString m_sDisplayWhenEmpty;
	UINT m_nEmptyPromptID;
	UINT m_nSelectionPromptID;
	BOOL m_bFoldersOnly;
	CString m_sDefaultExt;
	CString m_sFilter;
	UINT m_nButtonBitmapID;
	//{{AFX_MSG(CPathCtrl)
	afx_msg void OnAddButton();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

	CStaticFilespec* m_pStatic;
	CSimpleFlatButton* m_pButton;
};

#endif // !defined(AFX_PATHCTRL_H__CF02E961_98DB_11D2_864F_AC380CC10000__INCLUDED_)
