// EnvironmentListCtrl.h: interface for the CEnvironmentListCtrl class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ENVIRONMENTLISTCTRL_H__F35D6DA3_999C_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_ENVIRONMENTLISTCTRL_H__F35D6DA3_999C_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "EditListCtrl.h"

class CStringEnvironment;
class CWEnvironConstrainedRule;
class CTextDisplayInfo;

class CEnvironmentListCtrl : public CEditListCtrl
{
public:
	BOOL m_bIsMEC;
	void setRule(CWEnvironConstrainedRule *pRule);
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	virtual void OnRButtonDown(UINT nFlags, CPoint point);
	void OnEditDelete();
	CImageList m_imageList;
	virtual void populate();
	CTypedPtrArray<CPtrArray, CStringEnvironment*>* m_pEnvironments;
	CEnvironmentListCtrl(const CTextDisplayInfo* pTDI=NULL);//CWEnvironConstrainedRule* pRule);
	virtual ~CEnvironmentListCtrl();
	CWEnvironConstrainedRule* m_pRule;

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CEnvironmentListCtrl)
	//}}AFX_VIRTUAL

	void OnUpdateToggleEnable(CCmdUI* pCmdUI);
	void OnToggleEnable();
	UINT m_nIconID;
protected:
	virtual int getLargestFontHeight();
	const CTextDisplayInfo* m_pTDI;
	virtual CFont* getFontForSubItem(int nItem, int nCol);
	virtual void keyPressedOnItem(LV_KEYDOWN* pLVKeyDow, LPARAM p, int iItem);
	virtual void deleteItem(LPARAM pItem, int nItem);
	int getEnvIndex(CStringEnvironment* penv);
	virtual void makeImageList();
	CStringEnvironment* m_pBlankEntry;
	virtual void makeColumns();
	void insertItem(CStringEnvironment* penv);
	virtual void setItemText(int nItem, int nSubItem, LPCTSTR pszText);
	virtual CString getItemText(LPARAM lp, int nCol);
	//{{AFX_MSG(CEnvironmentListCtrl)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#endif // !defined(AFX_ENVIRONMENTLISTCTRL_H__F35D6DA3_999C_11D2_864F_AC380CC10000__INCLUDED_)
