// DlgEditSentransTransfer.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "DlgEditSentransTransfer.h"
#include "TextDisplayInfo.h"
#include "ResizingUtils.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransTransfer dialog
static const char *oszDialogName = "DlgEditSentransTransfer";
#define BASE_WIDTH   302 // should correspond to the values in the .rc file!
#define BASE_HEIGHT  185


CDlgEditSentransTransfer::CDlgEditSentransTransfer(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(TRUE, CDlgEditSentransTransfer::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditSentransTransfer)
	m_bEnabled = FALSE;
	m_sComments = _T("");
	m_sFrom = _T("");
	m_sTo = _T("");
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
	ON_WM_SIZE()
	ON_WM_DESTROY()
	ON_WM_GETMINMAXINFO()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransTransfer message handlers

void CDlgEditSentransTransfer::vSize(int cx, int cy)
{
	// resize all bits
	CRect r;

	// Align things from boundary (left or right) and bottom
	tsSizingElement asSizingElements[] =
	{
#define ENVLISTTOP 73
	/*
#define EDITTEXTHEIGHT 27
#define BUTTONSFROMTOP 176

		{ IDCANCEL, (BASE_WIDTH - 246) * 2, 100, (BUTTONSFROMTOP - BASE_HEIGHT) * 2, 28, 0 },
		{ IDOK,     (BASE_WIDTH - 174) * 2, 100, (BUTTONSFROMTOP - BASE_HEIGHT) * 2, 28, 0 },
		{ IDC_CHECKEnabled, (6) * 2, 84, (180 - BASE_HEIGHT) * 2, 20, 1 },
		{ IDC_STATICcomments,13 * 2,72, (143 - BASE_HEIGHT) * 2, 16, 1 },
		{ IDC_Comments, 56*2, -12, (141 - BASE_HEIGHT) * 2, 27 * 2, 1 },
		{ IDC_EnvList,  56*2, -12, ENVLISTTOP * 2, ((ENVLISTTOP + 49) - BASE_HEIGHT) * 2, 1 }
*/

		{ IDCANCEL, (BASE_WIDTH - 245) * 2, 100, (166 - BASE_HEIGHT) * 2, 28, 0 },
		{ IDOK,     (BASE_WIDTH - 190) * 2, 100, (166 - BASE_HEIGHT) * 2, 28, 0 },
		{ IDC_CHECKEnabled, (10) * 2, 84, (164 - BASE_HEIGHT) * 2, 20, 1 },
		{ IDC_STATICcomments,18 * 2,68, (131 - BASE_HEIGHT) * 2, 16, 1 },
		{ IDC_Comments, 60*2, -12, (129 - BASE_HEIGHT) * 2, 62, 1 },
		{ IDC_EnvList,  60*2, -12, ENVLISTTOP * 2, ((ENVLISTTOP + 49) - BASE_HEIGHT) * 2, 1 }

	};
	vResize(this, cx, cy, asSizingElements, sizeof(asSizingElements)/sizeof(asSizingElements[0]));

	/* finally, the ultimate resizer - resize the List control automatically */
	CListCtrl *clc = (CListCtrl *) GetDlgItem(IDC_EnvList);
	if (clc && clc->m_hWnd) {
	  clc->GetClientRect(&r);
	  clc->SetColumnWidth(0, r.Width()/3);
	}
}

BOOL CDlgEditSentransTransfer::OnInitDialog()
{
	CDlgEnvConstrainedRule::OnInitDialog();

	// retrieve the window placement
	WINDOWPLACEMENT wp;

	if (ERROR_SUCCESS == lGetWindowPlacement(oszDialogName, &wp)) {
	  SetWindowPlacement(&wp);
	  vSize(wp.rcNormalPosition.right - wp.rcNormalPosition.left - 8,  // 8 is the magic figure (border width)
			wp.rcNormalPosition.bottom - wp.rcNormalPosition.top - 32); // 32 is magic: border + title bar
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
	vSize(cx,cy);
}

void CDlgEditSentransTransfer::OnGetMinMaxInfo(MINMAXINFO FAR* lpMMI)
{
	CDlgEnvConstrainedRule::OnGetMinMaxInfo(lpMMI);

	// restrict minimum size to original size.
	lpMMI->ptMinTrackSize.x = BASE_WIDTH * 2 + 2 * ::GetSystemMetrics(SM_CXFRAME);
	lpMMI->ptMinTrackSize.y = BASE_HEIGHT * 2 + 2 * ::GetSystemMetrics(SM_CYFRAME) +
							  ::GetSystemMetrics(SM_CYCAPTION);
//	lpMMI->ptMaxTrackSize.y = lpMMI->ptMinTrackSize.y;

}
