#if !defined(AFX_WIZNEWFROMSCRATCH_H__F3B3C2C2_9340_11D2_864F_AC380CC10000__INCLUDED_)
#define AFX_WIZNEWFROMSCRATCH_H__F3B3C2C2_9340_11D2_864F_AC380CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// WizNewFromScratch.h : header file
//
class CFileList;
#include "PageDisclaimer.h"
#include "PageRootUnifiedDict.h"
#include "PageDictAffixes.h"
#include "PageAffixes.h"
#include "PageCategoryProp.h"
#include "PageFinalCatTest.h"
#include "PageDictMethod.h"
#include "wizLangProps.h"	// Added by ClassView

/////////////////////////////////////////////////////////////////////////////
// CWizNewFromScratch

class CWizNewFromScratch : public CPropertySheet
{
	DECLARE_DYNAMIC(CWizNewFromScratch)

// Construction
public:
	CWizNewFromScratch(CFileList* pRootFileList);

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWizNewFromScratch)
	//}}AFX_VIRTUAL

// Implementation
public:
	CPageLangDisplay m_langDisplayPage;
	CPageFinalCatTest m_finalCatTestPage;
	CPageDictMethod m_dictMethodPage;
	CPageDictAffixes m_dictAffixesPage;
	CPageRootUnifiedDict m_dictRootUnifiedPage;
	CPageAffixes m_affixesPage;
	CPageCategoryProp m_categoryPropogationPage;
	CPageDisclaimer m_disclaimerPage;

	virtual ~CWizNewFromScratch();

	// Generated message map functions
protected:
	//{{AFX_MSG(CWizNewFromScratch)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WIZNEWFROMSCRATCH_H__F3B3C2C2_9340_11D2_864F_AC380CC10000__INCLUDED_)
