#if !defined(AFX_WIZNEWFROMCARLA_H__FF611C81_06B4_11D2_89BE_0000C035C8C8__INCLUDED_)
#define AFX_WIZNEWFROMCARLA_H__FF611C81_06B4_11D2_89BE_0000C035C8C8__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// WizNewFromCarla.h : header file
//
#include "wizLangProps.h"
#include "wizCMenuPage.h"
#include "wizProjectPage.h"
/////////////////////////////////////////////////////////////////////////////
// CWizNewFromCarla
class CProjectDoc;

class CWizNewFromCarla : public CPropertySheet
{
	DECLARE_DYNAMIC(CWizNewFromCarla)

// Construction
public:
	int DoModal();
	CWizNewFromCarla(CProjectDoc* pProj);
	//CWizNewFromCarla(UINT nIDCaption, CWnd* pParentWnd = NULL, UINT iSelectPage = 0);
	//CWizNewFromCarla(LPCTSTR pszCaption, CWnd* pParentWnd = NULL, UINT iSelectPage = 0);
	CPageLangDisplay m_srcLangDisplayPage;
	CPageLangDisplay m_tarLangDisplayPage;
	CPageProjectPath m_projectPage;
	CPageCMenu m_cmenuPage;
	CProjectDoc *m_pProjectDoc;

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWizNewFromCarla)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CWizNewFromCarla();

	// Generated message map functions
protected:
	//{{AFX_MSG(CWizNewFromCarla)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WIZNEWFROMCARLA_H__FF611C81_06B4_11D2_89BE_0000C035C8C8__INCLUDED_)
