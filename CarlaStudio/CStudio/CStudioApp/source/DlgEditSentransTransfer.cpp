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
#define BASE_HEIGHT  157


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
	ON_WM_DESTROY()
	ON_WM_SIZE()
	ON_WM_GETMINMAXINFO()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransTransfer message handlers
void CDlgEditSentransTransfer::vSize(int cx, int cy)
{
	// resize all bits
	CEdit *pE;
	CRect r;
	int iItem;

/*
 * Items that shift right when resized.
 *
 *  DEFPUSHBUTTON   IDOK     190,138,50,14
 *  PUSHBUTTON      IDCANCEL 245,138,50,14
 */

	/* Align things from boundary (left or right) and bottom */
	struct {
		int iItem;
		int iFromBorder,    // distance from boundary boundary from right + width
			iWidth,         // if this is 0, aligns right hand side
			iTopFromBottom, // is bottom from bottom + height; OR (if iHeight is negative)
							//      distance from top from top
			iHeight;        // if this is negative, this element doesn't move but stretch with the bottom
		int iAlignLeft;
	} asSizingElements[] =
	{
		{ IDCANCEL, (BASE_WIDTH - 245) * 2, 100, (BASE_HEIGHT - 138) * 2, 28, 0 },
		{ IDOK,     (BASE_WIDTH - 190) * 2, 100, (BASE_HEIGHT - 138) * 2, 28, 0 },
		{ IDC_CHECKEnabled, (10) * 2, 84, (BASE_HEIGHT - 135) * 2, 20, 1 },
		{ IDC_STATICcomments,18 * 2,68, (BASE_HEIGHT - 102) * 2, 16, 1 },
		{ IDC_Comments, 60*2, 0, (BASE_HEIGHT - 100) * 2, 62, 1 },
		{ IDC_EnvList,  60*2, 0, 44 * 2, -134, 1 }

	};
	for (iItem = 0; iItem < sizeof(asSizingElements)/sizeof(asSizingElements[0]); iItem++) {
	  pE = (CEdit*) GetDlgItem(asSizingElements[iItem].iItem);
	  if(pE && pE->m_hWnd)
	  {
		pE->GetWindowRect(&r);
		ScreenToClient(&r);

		if (asSizingElements[iItem].iAlignLeft) {
			r.left = asSizingElements[iItem].iFromBorder;
		}
		else {
			r.left = cx - asSizingElements[iItem].iFromBorder;
		}
		if (asSizingElements[iItem].iWidth == 0) {
			r.right = cx - 12;
		}
		else {
			r.right = r.left + asSizingElements[iItem].iWidth;
		}
		if (asSizingElements[iItem].iHeight < 0) {
			r.top    = asSizingElements[iItem].iTopFromBottom;
			r.bottom = cy + asSizingElements[iItem].iHeight;
		}
		else {
			r.top = cy - asSizingElements[iItem].iTopFromBottom;
			r.bottom = r.top + asSizingElements[iItem].iHeight;
		}

		pE->MoveWindow(r.left, r.top, r.Width(), r.Height(), TRUE);
	  }
	}

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
