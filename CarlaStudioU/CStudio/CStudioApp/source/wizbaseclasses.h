// GENERIC WIZARD-RELATED CLASSES GO HERE

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
// CWizFilePage abstract superclass for all pages

#ifndef __WizBaseClasses__
#define __WizBaseClasses__

class CWizPage : public CPropertyPage
{
	DECLARE_DYNCREATE(CWizPage)

// Construction
public:
	CWizPage() {ASSERTX(FALSE);}
	CWizPage(int id);
//	void setOwner(CPropertySheet* pOwner);

// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CWizPage)
	public:
	virtual BOOL OnSetActive();
	protected:
//	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CPropertySheet* getOwner();
//		CPropertySheet* m_pOwner;
	void handleFileButton(CString& sPath, LPTSTR  pszExtension, LPTSTR  pszFilter);
	virtual void checkStatus();

	// Generated message map functions
	//{{AFX_MSG(CWizPage)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

#endif