#if !defined(AFX_DLGEDITTESTCOLOR_H__B3CFB14A_68CE_4662_8281_893B03A31DB1__INCLUDED_)
#define AFX_DLGEDITTESTCOLOR_H__B3CFB14A_68CE_4662_8281_893B03A31DB1__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgEditTestColor.h : header file
//

#include "ColorBtn.h"
#include "TestEdit.h"
#include "flatbutton.h"


/////////////////////////////////////////////////////////////////////////////
// CDlgEditTestColor dialog

class CDlgEditTestColor : public CDialog
{
// Construction
public:
	CDlgEditTestColor(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditTestColor)
	enum { IDD = IDD_EditSetColor };
	CButton	m_buttonStrikeout;
	CComboBox	m_combo;
	CTestEdit	m_richTestPreview;
	CTreeCtrl	m_tree;
	CColorBtn	m_buttonColorBackground;
	CColorBtn	m_buttonColorFont;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditTestColor)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	//CColorBtn colorbtn;
	void refreshRichEditCtrl( );
	void writeNewParamInRegistry();


	// Generated message map functions
	//{{AFX_MSG(CDlgEditTestColor)
	virtual BOOL OnInitDialog();
	afx_msg void OnSelchangingTree(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnCheckUseColorBackgroundSystem();
	afx_msg void OnCheckWordWrap();
	afx_msg void clickOnBackgroundColor();
	afx_msg void clickOnFontColor();
	afx_msg void OnBOLD();
	afx_msg void OnUNDERLINE();
	afx_msg void OnITALIC();
	afx_msg void OnSTRIKEOUT();
	afx_msg void OnFontSize();
	afx_msg void OnDefault();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()



	DWORD m_dwTreeID;
	HTREEITEM m_hItemOPE;

	COLORREF m_colorBackground;
	COLORREF m_colorFont;
	BOOL m_FontBOLD,m_FontITALIC,m_FontUNDERLINE,m_FontSTRIKEOUT;

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGEDITTESTCOLOR_H__B3CFB14A_68CE_4662_8281_893B03A31DB1__INCLUDED_)
