// WizNewFromFiles.h : header file
//
// 1.7a1 07-Dec-1999 hab Remove ctrl-Ms from end of lines
//                       Add interlinear and stamp dict code table processing

class CWizFilesWizard;
class ostrstream;
#include "WizBaseClasses.h"
#include "WizLangProps.h"	// for pages these have in common
#include "WizProjectPage.h"
#include "PageRootUnifiedDict.h"
#include "PageDictAffixes.h"
#include "PageDictMethod.h"


/////////////////////////////////////////////////////////////////////////////
// CPageFilesSynth dialog

class CPageFilesSynth : public CWizPage
{
// Construction
public:
	CPageFilesSynth(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CPageFilesSynth)
	enum { IDD = IDD_WizFilesSynth };
	CString	m_sStampSynth;
	CString	m_sTextOut;
#ifndef hab17a1
	CString	m_sCodeTableStampPath;
#endif // hab17a1
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPageFilesSynth)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CPageFilesSynth)
	afx_msg void OnbtnSTAMPSynth();
	afx_msg void OnbtnTextOut();
#ifndef hab17a1
	afx_msg void OnbtnCodeTableStamp();
#endif // hab17a1
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


class CPageFilesTransfer : public CWizPage
{
// Construction
public:
	CPageFilesTransfer(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CPageFilesTransfer)
	enum { IDD = IDD_WizFilesTransfer };
	CString	m_sSTGlossingPath;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPageFilesTransfer)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CPageFilesTransfer)
	afx_msg void OnbtnSTGlossing();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////
// CPageAnalysisFiles dialog


class CPageAnalysisFiles : public CWizPage
{
	DECLARE_DYNAMIC(CPageAnalysisFiles)

// Construction
public:
	CPageRootUnifiedDict* m_pDictRootUnifiedPage;
	CPageDictAffixes* m_pDictAffixesPage;
	CPageAnalysisFiles();
	~CPageAnalysisFiles();

// Dialog Data
	//{{AFX_DATA(CPageAnalysisFiles)
	enum { IDD = IDD_WizFilesAnalysis };
	CString	m_sAnalysisPath;
	CString	m_sPhonrulePath;
	CString	m_sCodeTablePath;
#ifndef hab17a1
	CString	m_sCodeTableItPath;
#endif // hab17a1
	CString	m_sDictOrthoPath;
	CString	m_sTextInPath;
	CString	m_sSTDisambigPath;
	CString m_sCmdPath;
	CString	m_sCommentChar;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageAnalysisFiles)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual void checkStatus();
	// Generated message map functions
	//{{AFX_MSG(CPageAnalysisFiles)
	afx_msg void OnBUTTONAnalysis();
	afx_msg void OnBUTTONTextIn();
	afx_msg void OnBUTTONDictOrtho();
	afx_msg void OnBUTTONPhonrule();
	afx_msg void OnBUTTONCodeTable();
#ifndef hab17a1
	afx_msg void OnBUTTONCodeTableIt();
#endif // hab17a1
	afx_msg void OnBUTTONSTDisambig();
	afx_msg void OnBUTTONCmd();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
// CPageNewFromFilesFinish dialog

class CPageNewFromFilesFinish : public CWizPage
{
	DECLARE_DYNAMIC(CPageNewFromFilesFinish)

// Construction
public:
	CPageNewFromFilesFinish();
	~CPageNewFromFilesFinish();

// Dialog Data
	//{{AFX_DATA(CPageNewFromFilesFinish)
	enum { IDD = IDD_WizFilesFinish };
	CString	m_sFileList;
	CString	m_sFolderPath;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPageNewFromFilesFinish)
	public:
	virtual BOOL OnSetActive();
	virtual BOOL OnKillActive();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	void addLine(ostrstream& sout, CString sTitle, CString& sPath) ;

	// Generated message map functions
	//{{AFX_MSG(CPageNewFromFilesFinish)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};


/////////////////////////////////////////////////////////////////////////////
// CWizFilesWizard

class CWizNewFromFiles : public CPropertySheet
{
	DECLARE_DYNAMIC(CWizNewFromFiles)

// Construction
public:
	int DoModal();
	CWizNewFromFiles(CFileList* pRootFileList);

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWizNewFromFiles)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CWizNewFromFiles();
	// these are all public so that the ProjectDoc can load/read their attributes (like file paths)
	CPageLangDisplay m_langDisplayPage;
	CPageNewFromFilesFinish m_finishPage;
	CPageAnalysisFiles m_analysisPage;
	//CPageDictionaries m_dictPage;
	CPageDictMethod m_dictMethodPage;// jdh 17 sept 2001
	CPageRootUnifiedDict m_dictRootUnifiedPage;
	CPageDictAffixes m_dictAffixesPage;
//	CPageProjectPath m_projectPage;
	CPageFilesTransfer m_transferPage;
	CPageFilesSynth m_synthPage;
	CWizPage m_redundantFieldsNoticePage;
	// Generated message map functions
protected:
	afx_msg LRESULT OnSetDefID(WPARAM wParam, LPARAM lParam);
	//{{AFX_MSG(CWizNewFromFiles)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
