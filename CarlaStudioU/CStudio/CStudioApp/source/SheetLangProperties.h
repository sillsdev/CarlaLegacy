#if !defined(AFX_SHEETLANGPROPERTIES_H__15416B43_958A_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_SHEETLANGPROPERTIES_H__15416B43_958A_11D2_864F_AC380CC10000__INCLUDED_

#include "wizLangProps.h"	// Added by ClassView
#include "PageDictAffixes.h"	// Added by ClassView
#include "PageRootUnifiedDict.h"	// Added by ClassView
#include "PageLocations.h"
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SheetLangProperties.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSheetLangProperties

class CCarlaLanguage;

class CSheetLangProperties : public CPropertySheet
{
	DECLARE_DYNAMIC(CSheetLangProperties)

// Construction
public:
	CSheetLangProperties(LPCTSTR pszCaption, CCarlaLanguage* pLang, CWnd* pParentWnd = NULL, UINT iSelectPage = 0);

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSheetLangProperties)
	public:
	virtual BOOL OnInitDialog();
	//}}AFX_VIRTUAL

// Implementation
public:
	CPageLocations m_pageLocations;
	CPageRootUnifiedDict m_pageRootUnifiedDicts;
	CPageDictAffixes m_pageAffixDicts;
	CPageLangDisplay m_pageDisplay;
	virtual ~CSheetLangProperties();

	// Generated message map functions
protected:
	//{{AFX_MSG(CSheetLangProperties)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SHEETLANGPROPERTIES_H__15416B43_958A_11D2_864F_AC380CC10000__INCLUDED_)
