
// DlgManualParseChoice.h : header file
//
// jdh 21June2000 made double-click work

#if !defined(AFX_DLGMANUALPARSECHOICE_H__0A6556C4_2BDC_11D4_942A_0050BF068CF6__INCLUDED_)
#define AFX_DLGMANUALPARSECHOICE_H__0A6556C4_2BDC_11D4_942A_0050BF068CF6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


#include "CWList.h"
#include "CWListCtrl.h"
#include "..\resource.h"
class CAlloResult;

/////////////////////////////////////////////////////////////////////////////
// CDlgManualParseChoice dialog

class CDlgManualParseChoice : public CDialog
{
// Construction
public:
	CDlgManualParseChoice(const CTextDisplayInfo* pTDI, CWnd* pParent = NULL);
	DECLARE_DYNCREATE(CDlgManualParseChoice)

// Dialog Data
	//{{AFX_DATA(CDlgManualParseChoice)
	enum { IDD = IDD_ManualParseChoice };
	CWListCtrl	m_ListCtrl;
	//}}AFX_DATA
	int m_iChoice;
	CAlloResult * m_pAlloResult;
	CWAllomorphSelectionList m_AlloList;
	CWAllomorphSelectionList * m_pList;
	CFont * getLangFont(void) {return m_AlloList.getLangFont();}
	virtual void OnOK();	// jdh 21June2000

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgManualParseChoice)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CDlgManualParseChoice();           // protected constructor used by dynamic creation
	void fillListControl(void);

	// Generated message map functions
	//{{AFX_MSG(CDlgManualParseChoice)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGMANUALPARSECHOICE_H__0A6556C4_2BDC_11D4_942A_0050BF068CF6__INCLUDED_)
