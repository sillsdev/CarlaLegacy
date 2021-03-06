// DlgProgress.h : header file
// CG: This file was added by the Progress Dialog component

/////////////////////////////////////////////////////////////////////////////
// CDlgProgress dialog

#ifndef __DLGPROGRESS_H__
#define __DLGPROGRESS_H__


class CDlgProgress : public CDialog
{
// Construction / Destruction
public:
	CDlgProgress(UINT nCaptionID = 0);   // standard constructor
	~CDlgProgress();

	BOOL Create(CWnd *pParent=NULL);

	// Checking for Cancel button
	BOOL CheckCancelButton();
	// Progress Dialog manipulation
	void SetStatus(LPCTSTR lpszMessage);
   void SetStatusNoProgressBar(LPCTSTR lpszMessage);
   void SetRange(int nLower,int nUpper);
	int  SetStep(int nStep);
	int  SetPos(int nPos);
	int  OffsetPos(int nPos);
	int  StepIt();

// Dialog Data
	//{{AFX_DATA(CDlgProgress)
	enum { IDD = CG_IDD_PROGRESS };
	CProgressCtrl	m_Progress;
	//}}AFX_DATA

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgProgress)
	public:
	virtual BOOL DestroyWindow();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	UINT m_nCaptionID;
	int m_nLower;
	int m_nUpper;
	int m_nStep;

	BOOL m_bCancel;
	BOOL m_bParentDisabled;

	void ReEnableParent();

	virtual void OnCancel();
	virtual void OnOK() {};
	void UpdatePercent(int nCurrent);
	void PumpMessages();

	// Generated message map functions
	//{{AFX_MSG(CDlgProgress)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

extern CDlgProgress* gpProgressDlg; // defined in ProjectDoc.cpp


#define PROGRESS(X) {\
				if(gpProgressDlg)\
					gpProgressDlg->SetStatusNoProgressBar(X);}

#define PROGRESS2(X, Y) { CString sMacroPogress(X);\
				sMacroPogress+=(Y);\
				if(gpProgressDlg)\
					gpProgressDlg->SetStatusNoProgressBar(sMacroPogress);}

#define PROGRESS3(X, Y, Z) { CString sMacroPogress(X);\
				sMacroPogress+=(Y);\
				sMacroPogress+=(Z);\
				if(gpProgressDlg)\
					gpProgressDlg->SetStatusNoProgressBar(sMacroPogress);}

#define PROGRESS4(W, X, Y, Z) { CString sMacroPogress(W);\
				sMacroPogress+=(X);\
				sMacroPogress+=(Y);\
				sMacroPogress+=(Z);\
				if(gpProgressDlg)\
					gpProgressDlg->SetStatusNoProgressBar(sMacroPogress);}

#endif // __DLGPROGRESS_H__
