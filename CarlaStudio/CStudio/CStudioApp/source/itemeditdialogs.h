// ItemEditDialogs.h : header file

// april 19 1999 jdh Made subclasses of CSDialog to enable shoebox jumping
//
// 1.5a7 22-Oct-1999 hab Allow test contents and description to use language font
#ifndef __AFXTEMPL_H__
#include <afxtempl.h>
#endif
#include <afxcoll.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#endif

//#include "CARLAStudioApp.h"
#include "..\resource.h"
#include "DlgEnvConstrainedRule.h"
#include "SDialog.h"

class CTextDisplayInfo;
/////////////////////////////////////////////////////////////////////////////
// CDlgEditTest dialog

class CDlgEditTest : public CSDialog
{
// Construction
public:
#ifndef hab15a7
	CDlgEditTest(const CTextDisplayInfo* pTDI);
#else
	CDlgEditTest(CWnd* pParent = NULL);   // standard constructor
#endif // hab15a7

// Dialog Data
	//{{AFX_DATA(CDlgEditTest)
	enum { IDD = IDD_EditTest };
	CString	m_sContents;
	CString	m_sDescription;
	CString	m_sLabel;
	BOOL	m_bEnabled;
#ifndef hab15a7
	const	CTextDisplayInfo* m_pTDI;
#endif // hab15a7
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditTest)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditTest)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
/////////////////////////////////////////////////////////////////////////////
// CDlgEditOrthoChange dialog

class CDlgEditOrthoChange : public CDlgEnvConstrainedRule
{
// Construction
public:
	CDlgEditOrthoChange(const CTextDisplayInfo* pTDI);

// Dialog Data
	//{{AFX_DATA(CDlgEditOrthoChange)
	enum { IDD = IDD_EditOrthoChange };
	BOOL	m_bEnabled;
	CString	m_sComments;
	CString	m_sFrom;
	CString	m_sTo;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditOrthoChange)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CEdit m_sEditEnv, m_sEditFrom, m_sEditTo;

	// Generated message map functions
	//{{AFX_MSG(CDlgEditOrthoChange)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
/////////////////////////////////////////////////////////////////////////////
// CDlgEditEnvironment dialog
// NOW UNUSED
class CDlgEditEnvironment : public CDialog
{
// Construction
public:
	CDlgEditEnvironment(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditEnvironment)
	enum { IDD = IDD_EditEnvironment };
	BOOL	m_bEnabled;
	CString	m_sComments;
	CString	m_sEnvironment;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditEnvironment)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditEnvironment)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
/////////////////////////////////////////////////////////////////////////////
// CDlgEditMCC dialog

class CDlgEditMCC : public CDlgEnvConstrainedRule
{
// Construction
public:
	CDlgEditMCC(const CTextDisplayInfo* pTDI);

// Dialog Data
	//{{AFX_DATA(CDlgEditMCC)
	enum { IDD = IDD_EditMCC };
	BOOL	m_bEnabled;
	CString	m_sComments;
	CString	m_sEnvironComment;
	CString	m_sEnvironment;
	CString	m_sMembers;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditMCC)
	public:
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditMCC)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
/////////////////////////////////////////////////////////////////////////////
// CDlgEditClass dialog

class CDlgEditClass : public CSDialog
{
// Construction
public:
	CDlgEditClass(const CTextDisplayInfo* pTDI,
					BOOL bContentsAreMorphnames=FALSE,
					BOOL bContentsAreStrings=FALSE);   // standard constructor
	const CTextDisplayInfo* m_pTDI;

// Dialog Data
	//{{AFX_DATA(CDlgEditClass)
	enum { IDD = IDD_EditClass };
	CEdit	m_contentsEditText;
	BOOL	m_bEnabled;
	CString	m_sContents;
	CString	m_sComments;
	CString	m_sLabel;
	//}}AFX_DATA
	BOOL m_bContentsAreMorphnames;
	BOOL m_bContentsAreStrings;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditClass)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditClass)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
/////////////////////////////////////////////////////////////////////////////
// CDlgEditCmpdRootPair dialog

class CDlgEditCmpdRootPair : public CSDialog
{
// Construction
public:
	CDlgEditCmpdRootPair(const CTextDisplayInfo* pTDI);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEditCmpdRootPair)
	enum { IDD = IDD_EditCompoundRoot };
	CString	m_sCategory1;
	CString	m_sCategory2;
	BOOL	m_bEnabled;
	CString	m_sComments;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditCmpdRootPair)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	const CTextDisplayInfo* m_pTDI;

	// Generated message map functions
	//{{AFX_MSG(CDlgEditCmpdRootPair)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
/////////////////////////////////////////////////////////////////////////////
// CDlgEditAdhocPair dialog

class CDlgEditAdhocPair : public CSDialog
{
// Construction
public:
	CDlgEditAdhocPair(const CTextDisplayInfo* pTDI);

	const CTextDisplayInfo* m_pTDI;
// Dialog Data
	//{{AFX_DATA(CDlgEditAdhocPair)
	enum { IDD = IDD_EditAdhocPair };
	BOOL	m_bEnabled;
	CString	m_sComments;
	CString	m_sMorph2;
	CString	m_sMorph1;
	CString	m_sMorphType;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEditAdhocPair)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEditAdhocPair)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
