 // DlgEditSentransDisambig.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "DlgEditSentransDisambig.h"
#include "TextDisplayInfo.h"
#include "sdfedit.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransDisambig dialog
static const char *oszDialogName = "DlgEditSentransDisambig";
#define BASE_WIDTH   303 // should correspond to the values in the .rc file!
#define BASE_HEIGHT  178


CDlgEditSentransDisambig::CDlgEditSentransDisambig(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(TRUE, CDlgEditSentransDisambig::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgEditSentransDisambig)
	m_sComments = _T("");
	m_bEnabled = FALSE;
	m_sMembers = _T("");
	m_iAcceptReject = -1;
	m_bUnanimousEnvirons = FALSE;
	//}}AFX_DATA_INIT
}


void CDlgEditSentransDisambig::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEditSentransDisambig)
//	DDX_Control(pDX, IDC_SDF, m_sdfTest);
	DDX_Text(pDX, IDC_Comments, m_sComments);
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_Morphemes, m_sMembers);
	DDX_Radio(pDX, IDC_RADIOAccept, m_iAcceptReject);
	DDX_Check(pDX, IDC_CHECKUnanimousEnvirons, m_bUnanimousEnvirons);
	//}}AFX_DATA_MAP


	// when we're opening the dialog, set the fonts
	// to the correct vernacular font
	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		if (m_pTDI->m_bShowMorphnamesInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Morphemes);
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


BEGIN_MESSAGE_MAP(CDlgEditSentransDisambig, CDialog)
	//{{AFX_MSG_MAP(CDlgEditSentransDisambig)
	ON_COMMAND(ID_Jump, OnJump)
	ON_WM_SIZE()
	ON_WM_DESTROY()
	ON_WM_GETMINMAXINFO()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransDisambig message handlers

//DEL BOOL CDlgEditSentransDisambig::OnInitDialog()
//DEL {
//DEL //	m_sComments.SubclassDlgItem(IDD_PageInputDocPanels, this);
//DEL //	m_sdfTest.SubclassDlgItem(IDC_SDF, this);
//DEL
//DEL 	CDialog::OnInitDialog();
//DEL
//DEL 	return TRUE;  // return TRUE unless you set the focus to a control
//DEL 	              // EXCEPTION: OCX Property Pages should return FALSE
//DEL }

void CDlgEditSentransDisambig::OnJump()
{
ASSERT(FALSE);

}

BOOL CDlgEditSentransDisambig::OnInitDialog()
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

void CDlgEditSentransDisambig::vSize(int cx, int cy)
{
	// resize all bits
	CRect r;

	// top of the environment list
#define ENVLISTTOP (::GetSystemMetrics(SM_CYCAPTION) + ::GetSystemMetrics(SM_CYFRAME) + 44)

	// Align things from boundary (left or right) and bottom
	tsSizingElement asSizingElements[] =
	{
		{ IDCANCEL, (BASE_WIDTH - 246) * 2, 100, -1*(BASE_HEIGHT - 159) * 2, 28, 0 },
		{ IDOK,     (BASE_WIDTH - 174) * 2, 100, -1*(BASE_HEIGHT - 159) * 2, 28, 0 },
		{ IDC_CHECKEnabled, (6) * 2, 84, -1*(BASE_HEIGHT - 163) * 2, 20, 1 },
		{ IDC_STATICcomments,13 * 2,72, -1*(BASE_HEIGHT - 125) * 2, 16, 1 },
		{ IDC_Comments, 56*2, -12, -1*(BASE_HEIGHT - 100 - 27) * 2, 27 * 2, 1 },
		{ IDC_EnvList,  56*2, -12, ENVLISTTOP * 2, -1 * (BASE_HEIGHT - (ENVLISTTOP + 47)) * 2, 1 }
	};
	vResize(this, cx, cy, asSizingElements, sizeof(asSizingElements)/sizeof(asSizingElements[0]));

	// finally, the ultimate resizer - resize the List control automatically
	CListCtrl *clc = (CListCtrl *) GetDlgItem(IDC_EnvList);
	if (clc && clc->m_hWnd) {
	  clc->GetClientRect(&r);
	  clc->SetColumnWidth(0, r.Width()/3);
	}
}

void CDlgEditSentransDisambig::OnSize(UINT nType, int cx, int cy)
{
	CDlgEnvConstrainedRule::OnSize(nType, cx, cy);

	// TODO: Add your message handler code here
	vSize(cx,cy);
}

void CDlgEditSentransDisambig::OnDestroy()
{
	CDlgEnvConstrainedRule::OnDestroy();

	WINDOWPLACEMENT wp; /* wndpl */
	GetWindowPlacement(&wp);

	lPutWindowPlacement(oszDialogName, &wp);
}

void CDlgEditSentransDisambig::OnGetMinMaxInfo(MINMAXINFO FAR* lpMMI)
{
	CDlgEnvConstrainedRule::OnGetMinMaxInfo(lpMMI);

	// restrict minimum size to original size.
	lpMMI->ptMinTrackSize.x = BASE_WIDTH * 2 + 2 * ::GetSystemMetrics(SM_CXFRAME);
	lpMMI->ptMinTrackSize.y = BASE_HEIGHT * 2 + 2 * ::GetSystemMetrics(SM_CYFRAME) +
							  ::GetSystemMetrics(SM_CYCAPTION);
//	lpMMI->ptMaxTrackSize.y = lpMMI->ptMinTrackSize.y; // don't change height
}
