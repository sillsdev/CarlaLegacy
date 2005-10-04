// DlgEditSentransTransfer.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "DlgEditSentransTransfer.h"
#include "TextDisplayInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransTransfer dialog
static const char *oszDialogName = "DlgEditSentransTransfer";

CDlgEditSentransTransfer::CDlgEditSentransTransfer(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(TRUE, CDlgEditSentransTransfer::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditSentransTransfer)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sFrom = _T("");
	m_sTo = _T("");
	resizerset= false;
	//}}AFX_DATA_INIT
}


void CDlgEditSentransTransfer::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditSentransTransfer)
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_Comments, m_sComments);
	DDX_Text(pDX, IDC_From, m_sFrom);
	DDX_Text(pDX, IDC_To, m_sTo);
	//}}AFX_DATA_MAP

	// when we're opening the dialog, set the fonts
	// to the correct vernacular font
	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		if (m_pTDI->m_bShowMorphnamesInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_From);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			pE = (CEdit*) GetDlgItem(IDC_To);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			// env list is handled by CDlgEnvConstrainedRule::DoDataExchange()
		}
		if (m_pTDI->m_bShowCommentsInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Comments);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
			// env list is handled by CDlgEnvConstrainedRule::DoDataExchange()
		}
	}
}

BEGIN_MESSAGE_MAP(CDlgEditSentransTransfer, CDialog)
	//{{AFX_MSG_MAP(CDlgEditSentransTransfer)
	ON_WM_DESTROY()
	ON_WM_SIZE()
	ON_WM_GETMINMAXINFO()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransTransfer message handlers
BOOL CDlgEditSentransTransfer::OnInitDialog()
{
	CDlgEnvConstrainedRule::OnInitDialog();

	CResizerInit(&resizer, AfxFindResourceHandle(MAKEINTRESOURCE(IDD), RT_DIALOG),
				m_hWnd,IDD);

	CResizerResizerFlags(&resizer, IDOK,			RESIZER_MOVES_WITH_RIGHTBOTTOM);
	CResizerResizerFlags(&resizer, IDCANCEL,		RESIZER_MOVES_WITH_RIGHTBOTTOM);
	CResizerResizerFlags(&resizer, IDC_CHECKEnabled,	RESIZER_MOVES_WITH_LEFTBOTTOM);
	CResizerResizerFlags(&resizer, IDC_EnvList,	RESIZER_SIZES_HORIZONTAL | RESIZER_SIZES_VERTICAL);
	CResizerResizerFlags(&resizer, IDC_Comments,	RESIZER_MOVES_WITH_LEFTBOTTOM | RESIZER_SIZES_HORIZONTAL);
	CResizerResizerFlags(&resizer, IDC_STATICcomments,	RESIZER_MOVES_WITH_LEFTBOTTOM);
	resizerset=true;

	// retrieve the window placement
	WINDOWPLACEMENT wp;

	if (ERROR_SUCCESS == lGetWindowPlacement(oszDialogName, &wp)) {
		SetWindowPlacement(&wp);
	}
	else {
		GetWindowPlacement(&wp);
		wp.rcNormalPosition.bottom = resizer.sDialogData.cy;
		wp.rcNormalPosition.right = resizer.sDialogData.cx;
		SetWindowPlacement(&wp);
		CResizerInitialSize(&resizer);
	}

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgEditSentransTransfer::OnDestroy()
{
	CDlgEnvConstrainedRule::OnDestroy();

	WINDOWPLACEMENT wp; /* wndpl */
	GetWindowPlacement(&wp);

	lPutWindowPlacement(oszDialogName, &wp);
}

void CDlgEditSentransTransfer::OnSize(UINT nType, int cx, int cy)
{
	CDlgEnvConstrainedRule::OnSize(nType, cx, cy);

	// TODO: Add your message handler code here
	// resize all bits
	if (resizerset)
		CResizerResize(&resizer, cx, cy*2);

	/* finally, the ultimate resizer - resize the List control automatically */
	CListCtrl *clc = (CListCtrl *) GetDlgItem(IDC_EnvList);
	if (clc && clc->m_hWnd) {
		CRect r;
		clc->GetClientRect(&r);
		clc->SetColumnWidth(0, r.Width()/3);
	}
}

void CDlgEditSentransTransfer::OnGetMinMaxInfo(MINMAXINFO FAR* lpMMI)
{
	CDlgEnvConstrainedRule::OnGetMinMaxInfo(lpMMI);

	// restrict minimum size to original size.
	lpMMI->ptMinTrackSize.x = (long) (((double) resizer.sDialogData.cx) * resizer.x_factor + ::GetSystemMetrics(SM_CXFRAME));
	lpMMI->ptMinTrackSize.y = (long) (((double) resizer.sDialogData.cy) * 2 + ::GetSystemMetrics(SM_CYFRAME) +
							  ::GetSystemMetrics(SM_CYCAPTION));
//	lpMMI->ptMaxTrackSize.y = lpMMI->ptMinTrackSize.y;

}
