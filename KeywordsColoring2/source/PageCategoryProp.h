#if !defined(AFX_PAGECATEGORYPROP_H__F3B3C2C4_9340_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_PAGECATEGORYPROP_H__F3B3C2C4_9340_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// PageCategoryProp.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CPageCategoryProp dialog

class CPageCategoryProp : public CPropertyPage
{
// Construction
public:
	CPageCategoryProp(UINT nIDTemplate=CPageCategoryProp::IDD, UINT nIDCaption=0);

// Dialog Data
	//{{AFX_DATA(CPageCategoryProp)
	enum { IDD = IDD_PageCatPropogation };
	int		m_nCatPropScheme;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPageCategoryProp)
	public:
	virtual BOOL OnSetActive();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CPageCategoryProp)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGECATEGORYPROP_H__F3B3C2C4_9340_11D2_864F_AC380CC10000__INCLUDED_)
