//  DlgProgress.cpp : implementation file
// CG: This file was added by the Progress Dialog component

#include "stdafx.h"
#include "..\resource.h"
#include "DlgProgress.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgProgress dialog

CDlgProgress::CDlgProgress(UINT nCaptionID)
{
	m_nCaptionID = CG_IDS_PROGRESS_CAPTION;
	if (nCaptionID != 0)
		m_nCaptionID = nCaptionID;

	m_bCancel=FALSE;
	m_nLower=0;
	m_nUpper=100;
	m_nStep=10;
	//{{AFX_DATA_INIT(CDlgProgress)
	// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	m_bParentDisabled = FALSE;
}

CDlgProgress::~CDlgProgress()
{
	if(m_hWnd!=NULL)
	  DestroyWindow();
}

BOOL CDlgProgress::DestroyWindow()
{
	ReEnableParent();
	return CDialog::DestroyWindow();
}

void CDlgProgress::ReEnableParent()
{
	if(m_bParentDisabled && (m_pParentWnd!=NULL))
	  m_pParentWnd->EnableWindow(TRUE);
	m_bParentDisabled=FALSE;
}

BOOL CDlgProgress::Create(CWnd *pParent)
{
	// Get the true parent of the dialog
	m_pParentWnd = CWnd::GetSafeOwner(pParent);

	// m_bParentDisabled is used to re-enable the parent window
	// when the dialog is destroyed. So we don't want to set
	// it to TRUE unless the parent was already enabled.

	if((m_pParentWnd!=NULL) && m_pParentWnd->IsWindowEnabled())
	{
	  m_pParentWnd->EnableWindow(FALSE);
	  m_bParentDisabled = TRUE;
	}

	if(!CDialog::Create(CDlgProgress::IDD,pParent))
	{
	  ReEnableParent();
	  return FALSE;
	}

	return TRUE;
}

void CDlgProgress::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgProgress)
	DDX_Control(pDX, CG_IDC_PROGDLG_PROGRESS, m_Progress);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDlgProgress, CDialog)
	//{{AFX_MSG_MAP(CDlgProgress)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

void CDlgProgress::SetStatus(LPCTSTR lpszMessage)
{
	ASSERTX(m_hWnd); // Don't call this _before_ the dialog has
					// been created. Can be called from OnInitDialog
	CWnd *pWndStatus = GetDlgItem(CG_IDC_PROGDLG_STATUS);

	// Verify that the static text control exists
	ASSERTX(pWndStatus!=NULL);
	pWndStatus->SetWindowText(lpszMessage);
	m_Progress.ModifyStyle(NULL, WS_VISIBLE);

}

void CDlgProgress::SetStatusNoProgressBar(LPCTSTR lpszMessage)
{
	ASSERTX(m_hWnd); // Don't call this _before_ the dialog has
					// been created. Can be called from OnInitDialog
	CWnd *pWndStatus = GetDlgItem(CG_IDC_PROGDLG_STATUS);

	CWnd *pWndPercent = GetDlgItem(CG_IDC_PROGDLG_PERCENT);
	pWndPercent->ModifyStyle(WS_VISIBLE, NULL);
	pWndPercent->Invalidate();

	// Verify that the static text control exists
	ASSERTX(pWndStatus!=NULL);
	pWndStatus->SetWindowText(lpszMessage);
	m_Progress.ModifyStyle(WS_VISIBLE, NULL);
	m_Progress.Invalidate(); // is this needed? not sure
	Invalidate(); // is this needed? not sure
	PumpMessages();
	// didn't help SendMessage(WM_PAINT);
}

void CDlgProgress::OnCancel()
{
	m_bCancel=TRUE;
}

void CDlgProgress::SetRange(int nLower,int nUpper)
{
	m_nLower = nLower;
	m_nUpper = nUpper;
	m_Progress.SetRange(nLower,nUpper);
}

int CDlgProgress::SetPos(int nPos)
{
	PumpMessages();
	int iResult = m_Progress.SetPos(nPos);
	UpdatePercent(nPos);
	return iResult;
}

int CDlgProgress::SetStep(int nStep)
{
	m_nStep = nStep; // Store for later use in calculating percentage
	return m_Progress.SetStep(nStep);
}

int CDlgProgress::OffsetPos(int nPos)
{
	PumpMessages();
	int iResult = m_Progress.OffsetPos(nPos);
	UpdatePercent(iResult+nPos);
	return iResult;
}

int CDlgProgress::StepIt()
{
	PumpMessages();
	int iResult = m_Progress.StepIt();
	UpdatePercent(iResult+m_nStep);
	return iResult;
}

void CDlgProgress::PumpMessages()
{
	// Must call Create() before using the dialog
	ASSERTX(m_hWnd!=NULL);

	MSG msg;
	// Handle dialog messages
	while(PeekMessage(&msg, NULL, 0, 0, PM_REMOVE))
	{
	  if(!IsDialogMessage(&msg))
	  {
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	  }
	}
}


BOOL CDlgProgress::CheckCancelButton()
{
	// Process all pending messages
	PumpMessages();

	// Reset m_bCancel to FALSE so that
	// CheckCancelButton returns FALSE until the user
	// clicks Cancel again. This will allow you to call
	// CheckCancelButton and still continue the operation.
	// If m_bCancel stayed TRUE, then the next call to
	// CheckCancelButton would always return TRUE

	BOOL bResult = m_bCancel;
	m_bCancel = FALSE;

	return bResult;
}

void CDlgProgress::UpdatePercent(int nNewPos)
{
	CWnd *pWndPercent = GetDlgItem(CG_IDC_PROGDLG_PERCENT);
	int nPercent;

	int nDivisor = m_nUpper - m_nLower;
	ASSERTX(nDivisor>0);  // m_nLower should be smaller than m_nUpper

	int nDividend = (nNewPos - m_nLower);
	ASSERTX(nDividend>=0);   // Current position should be greater than m_nLower

	nPercent = nDividend * 100 / nDivisor;

	// Since the Progress Control wraps, we will wrap the percentage
	// along with it. However, don't reset 100% back to 0%
	if(nPercent!=100)
	  nPercent %= 100;

	// Display the percentage
	CString strBuf;
	strBuf.Format(_T("%d%c"),nPercent,_T('%'));

	CString strCur; // get current percentage
	pWndPercent->GetWindowText(strCur);

	if (strCur != strBuf)
		pWndPercent->SetWindowText(strBuf);
}

/////////////////////////////////////////////////////////////////////////////
// CDlgProgress message handlers

BOOL CDlgProgress::OnInitDialog()
{
	CDialog::OnInitDialog();
	m_Progress.SetRange(m_nLower,m_nUpper);
	m_Progress.SetStep(m_nStep);
	m_Progress.SetPos(m_nLower);

	CString strCaption;
	ASSERTX(strCaption.LoadString(m_nCaptionID));
	SetWindowText(strCaption);

	return TRUE;
}
