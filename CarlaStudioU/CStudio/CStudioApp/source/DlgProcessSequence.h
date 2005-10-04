// DlgProccessSequence.h : header file
//
// 1.5a7 18-Oct-1999 hab Fix bug: a change to a process' check box would be
//                      lost if either a process was deleted or inserted

/////////////////////////////////////////////////////////////////////////////
#include "ResizingUtils.h"
// CDlgProcessSequence dialog
class CProcess;
class CCarlaLanguage;
class CProcessSequence ;

class CDlgProcessSequence : public CDialog
{
// Construction
public:
	BOOL m_iFunctionCode;
	BOOL m_bModified;
	CDlgProcessSequence(int iFunctionCode, LPCTSTR lpszTitle, CProcessSequence* pSeq);
	CTypedPtrArray<CPtrArray, CProcess*>*  m_ppProcesses;

// Dialog Data
	//{{AFX_DATA(CDlgProcessSequence)
	enum { IDD = IDD_ProcessSequence };
	CButton	m_btnRemove;
	CButton	m_btnProperties;
	CButton	m_btnInsertBefore;
	CButton	m_btnInsertAfter;
	CListCtrl	m_processListCtrl;
	CString	m_sValidMsg;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgProcessSequence)
	public:
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	CProcessSequence* m_pSequence;
	CString m_sTitle;

	void checkButtonStatus();
	void selectItem(int i);
	CImageList m_iconList;
	void setupListCtrl(int cx);
	CProcess* getFirstSelectedProcess(int *pIndex=0);
	void populateListCtrl();
	void insertProcess(BOOL before) ;

	CResizer resizer;
	BOOL resizerset;

	// Generated message map functions
	//{{AFX_MSG(CDlgProcessSequence)
	afx_msg void OnRemoveProcess();
	afx_msg void OnProperties();
	afx_msg void OnGetdispinfoProcessList(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDblclkProcessList(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnInsertAfter();
	afx_msg void OnInsertBefore();
	afx_msg void OnItemchangedProcessList(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnHelp();
	virtual void OnOK();
	afx_msg void OnDestroy();
	virtual BOOL OnInitDialog();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnGetMinMaxInfo(MINMAXINFO FAR* lpMMI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
#ifndef hab15a7
private:
	void updateCheckBoxes(void);
#endif // hab15a7
};
