// WizLangProps.h : header file
//
// 1.5a5 24-Sep-1999 hab allow user the ability to show properties in language font
// 1.5a7 20-Oct-1999 hab allow user the ability to show string and morpheme class names in language font
// jdh 11/11/99 Fix for Korean Windows

//{{AFX_INCLUDES()
//#include "listview.h"
//}}AFX_INCLUDES
#ifndef __WizSetup__
#define __WizSetup__

#include "WizBaseClasses.h"

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
// CPageLangSetupFinish dialog

class CPageLangSetupFinish : public CWizPage
{
//	DECLARE_DYNCREATE(CPageLangSetupFinish)

// Construction
public:
	virtual BOOL OnSetActive();
	virtual BOOL OnKillActive();
	CPageLangSetupFinish(BOOL bProjectCreation);
	~CPageLangSetupFinish();

// Dialog Data
	//{{AFX_DATA(CPageLangSetupFinish)
	enum { IDD = IDD_WizSetupFinish };
	CString	m_sMsg;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageLangSetupFinish)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CPageLangSetupFinish)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};



/////////////////////////////////////////////////////////////////////////////
// CPageLangDisplay dialog

class CPageLangDisplay : public CWizPage
{
	DECLARE_DYNCREATE(CPageLangDisplay)

// Construction
public:
	CPageLangDisplay(LPCTSTR lpszCaption=NULL, BOOL bAbrevIsReadOnly=FALSE);
	~CPageLangDisplay();
	LOGFONT m_logFont;

// Dialog Data
	//{{AFX_DATA(CPageLangDisplay)
	enum { IDD = IDD_PageLangDisplayProperties };
	CStatic	m_StaticFontCtrl;
	CString	m_sAbrev;
	CString	m_sName;
	CString	m_sFontDescription;
	BOOL	m_bShowMorphnamesInLangFont;
	BOOL	m_bShowCommentsInLangFont;
#ifndef hab15a5
	BOOL	m_bShowPropertiesInLangFont;
#endif // hab15a5
#ifndef hab15a7
	BOOL	m_bShowStringClassesInLangFont;
	BOOL	m_bShowMorphemeClassesInLangFont;
	BOOL	m_bShowUserTestsInLangFont;
#endif // hab15a7
	BOOL	m_bDisableFontAssociation;
	BOOL	m_bLocateTransferWithTarget;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageLangDisplay)
	public:
	virtual BOOL OnApply();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	BOOL m_bAbrevIsReadOnly;
	CString m_sTitle;
	virtual void checkStatus();
	// Generated message map functions
	//{{AFX_MSG(CPageLangDisplay)
	afx_msg void OnBUTTONFont();
	afx_msg void OnChangeEDITAbrev();
	afx_msg void OnChangeEDITName();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

/////////////////////////////////////////////////////////////////////////////
// CWizLanguageProperties

// THIS CLASS IS UNUSED RIGHT NOW, BUT MAY BE REINSTATED

/*class CWizLanguageProperties : public CPropertySheet
{
//	DECLARE_DYNAMIC(CWizLanguageProperties)

// Construction
public:
	int DoModal();
	CWizLanguageProperties(BOOL bProjectCreation);
	CWizLanguageProperties(UINT nIDCaption, CWnd* pParentWnd = NULL, UINT iSelectPage = 0);
	CWizLanguageProperties(LPCTSTR pszCaption, CWnd* pParentWnd = NULL, UINT iSelectPage = 0);

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWizLanguageProperties)
	//}}AFX_VIRTUAL

// Implementation
public:
	CPageLangSetupFinish m_finishPage;
	CPageLangDisplay m_namesPage;
	CPropertyPage m_testsPage, m_orderclassPage;
	virtual ~CWizLanguageProperties();

	// Generated message map functions
protected:
	//{{AFX_MSG(CWizLanguageProperties)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
*/

#endif
