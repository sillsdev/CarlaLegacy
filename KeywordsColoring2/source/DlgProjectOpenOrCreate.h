// DlgProjectOpenOrCreate.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgProjectOpenOrCreate dialog

class CDlgProjectOpenOrCreate : public CDialog
{
// Construction
public:
	CDlgProjectOpenOrCreate(CWnd* pParent = NULL);   // standard constructor


// Dialog Data
	//{{AFX_DATA(CDlgProjectOpenOrCreate)
	enum { IDD = IDD_OpenOrCreateProject };
	int		m_iWhatToDo;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgProjectOpenOrCreate)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgProjectOpenOrCreate)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
