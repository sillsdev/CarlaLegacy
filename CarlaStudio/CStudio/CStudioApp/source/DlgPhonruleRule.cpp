// CDlgPhonruleRule.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgPhonruleRule.h"
#include "TextDisplayInfo.h"
#include "ResizingUtils.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgPhonruleRule dialog


CDlgPhonruleRule::CDlgPhonruleRule(const CTextDisplayInfo* pTDI)
	: CDlgEnvConstrainedRule(FALSE, CDlgPhonruleRule::IDD, pTDI)
{
	//{{AFX_DATA_INIT(CDlgPhonruleRule)
	m_sCategory = _T("");
	m_bEnabled = FALSE;
	m_sFrom = _T("");
	m_sTo = _T("");
	m_iForceType = 0;
	m_iRuleType = 0;
	m_sComments = _T("");
	//}}AFX_DATA_INIT
}


void CDlgPhonruleRule::DoDataExchange(CDataExchange* pDX)
{
	CDlgEnvConstrainedRule::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgPhonruleRule)
	DDX_Text(pDX, IDC_Category, m_sCategory);
	DDX_Check(pDX, IDC_CHECKEnabled, m_bEnabled);
	DDX_Text(pDX, IDC_From, m_sFrom);
	DDX_Text(pDX, IDC_To, m_sTo);
	DDX_Radio(pDX, IDC_RADIOForce, m_iForceType);
	DDX_Radio(pDX, IDC_RADIORuleType, m_iRuleType);
	DDX_Text(pDX, IDC_Comments, m_sComments);
	//}}AFX_DATA_MAP

		// when we're opening the dialog, set the fonts
	// to the correct vernacular font
	if(!pDX->m_bSaveAndValidate && m_pTDI)
	{
		DDX_Control(pDX, IDC_From, m_editFrom);
		m_editFrom.SetFont(m_pTDI->getFont());

		DDX_Control(pDX, IDC_To, m_editTo);
		m_editTo.SetFont(m_pTDI->getFont());
		if (m_pTDI->m_bShowCommentsInLangFont)
		{
			CEdit* pE = (CEdit*) GetDlgItem(IDC_Comments);
			if(pE)
				pE->SetFont(m_pTDI->getFont());
		}
	}

}


BEGIN_MESSAGE_MAP(CDlgPhonruleRule, CDialog)
	//{{AFX_MSG_MAP(CDlgPhonruleRule)
	ON_WM_DESTROY()
	ON_WM_SIZE()
	ON_WM_CANCELMODE()
	ON_WM_GETMINMAXINFO()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgPhonruleRule message handlers

#define BASE_WIDTH   289
#define BASE_HEIGHT  201

void CDlgPhonruleRule::vSize(int cx, int cy)
{
	// resize all bits
	CEdit *pE;
	CRect r;
	/* items that align right hand side: */
	int aiItemsRH[] = {
						IDC_EnvList,
						IDC_Comments,
						IDC_STATICapply};

/*
	DEFPUSHBUTTON   "OK",IDOK,173,179,50,14   = 116,22,50,14 (232, 100, 44, 28)
	PUSHBUTTON      "Cancel",IDCANCEL,232,179,50,14 = 57,22,50,14 (114, 100, 44, 28)
	IDC_STATICcategory 181,9,31,8 = (108,62,192,16)
	IDC_Category, 217,6,65,14 = (72,130,189,28)
 */

	struct {
		int iItem;
		int iLeftFromRight, // is right hand boundary from right + width
			iWidth,
			iTop,
			iHeight;
	} asFixedRHSElements[] = // fixed right hand side
	{
		{ IDC_STATICcategory, 216,62,18,16 },
		{ IDC_Category, 144,130,12,28 }
	};

	pE = (CEdit*) GetDlgItem(IDC_From);
	pE = (CEdit*) GetDlgItem(IDC_To);

	/* align things on the right hand side */
	for (int iItem = 0; iItem < sizeof(aiItemsRH)/sizeof(int); iItem++) {
	  pE = (CEdit*) GetDlgItem(aiItemsRH[iItem]);
	  if(pE && pE->m_hWnd)
	  {
		pE->GetWindowRect(&r);
		ScreenToClient(&r);
		r.right = cx - 12;
		if (r.right < r.left + 10)
		  r.right = r.left + 10;

		pE->MoveWindow(r.left, r.top, r.Width(), r.Height(), TRUE);
	  }
	}

	/* Align things from boundary (left or right) and bottom */
	struct {
		int iItem;
		int iFromBorder, // distance from boundary boundary from right + width
			iWidth,
			iTopFromBottom, // is bottom from bottom + height
			iHeight;
		int iAlignLeft;
	} asFixedSizeElements[] =
	{
		{ IDCANCEL, 114, 100, 44, 28, 0 },
		{ IDOK, 232, 100, 44, 28, 0 },
		{ IDC_CHECKEnabled, 16, 84, 36, 20, 1 } // 8,183,42,10
	};
	for (iItem = 0; iItem < sizeof(asFixedSizeElements)/sizeof(asFixedSizeElements[0]); iItem++) {
	  pE = (CEdit*) GetDlgItem(asFixedSizeElements[iItem].iItem);
	  if(pE && pE->m_hWnd)
	  {
		pE->GetWindowRect(&r);
		ScreenToClient(&r);

		if (asFixedSizeElements[iItem].iAlignLeft) {
			r.left = asFixedSizeElements[iItem].iFromBorder;
		}
		else {
			r.left = cx - asFixedSizeElements[iItem].iFromBorder;
		}
		r.top = cy - asFixedSizeElements[iItem].iTopFromBottom;
		r.right = r.left + asFixedSizeElements[iItem].iWidth;
		r.bottom = r.top + asFixedSizeElements[iItem].iHeight;

		pE->MoveWindow(r.left, r.top, r.Width(), r.Height(), TRUE);
	  }
	}

	// the category box does not resize, it just moves
	for (iItem = 0; iItem < sizeof(asFixedRHSElements)/sizeof(asFixedRHSElements[0]); iItem++) {
	  pE = (CEdit*) GetDlgItem(asFixedRHSElements[iItem].iItem);
	  if(pE && pE->m_hWnd)
	  {
		pE->GetWindowRect(&r);
		ScreenToClient(&r);

		r.left = cx - asFixedRHSElements[iItem].iLeftFromRight;
		r.top = asFixedRHSElements[iItem].iTop;
		r.right = r.left + asFixedRHSElements[iItem].iWidth;
		r.bottom = r.top + asFixedRHSElements[iItem].iHeight;

		pE->MoveWindow(r.left, r.top, r.Width(), r.Height(), TRUE);
	  }
	}

	/*
	 * The To-box moves half steps and resizes half steps
	 */
	//    EDITTEXT        IDC_To,130,6,39,14,ES_AUTOHSCROLL
	//    LTEXT           "To:",IDC_STATICto,114,9,12,8
	//    EDITTEXT        IDC_From,58,6,43,14,ES_AUTOHSCROLL
	struct {
		int iItem;
		int iBaseLeft, // is distance from left hand boundary
			iWidth,
			iTop,
			iHeight;
		int iResizes;
		int iMoves;
	} asFixedRHSHalfElements[] = // fixed right hand side
	{
		{ IDC_STATICto, 228, 24, 18, 16, 0,1 },
		{ IDC_To,       260, 78, 12, 28, 1,1 },
		{ IDC_From,     112, 86, 12, 38, 1,0 }
	};
	for (iItem = 0; iItem < sizeof(asFixedRHSHalfElements)/sizeof(asFixedRHSHalfElements[0]); iItem++) {
	  pE = (CEdit*) GetDlgItem(asFixedRHSHalfElements[iItem].iItem);
	  if(pE && pE->m_hWnd)
	  {
		pE->GetWindowRect(&r);
		ScreenToClient(&r);

		if (asFixedRHSHalfElements[iItem].iMoves) {
		  r.left = asFixedRHSHalfElements[iItem].iBaseLeft + (cx - BASE_WIDTH * 2) / 2;
		}
		else {
		  r.left = asFixedRHSHalfElements[iItem].iBaseLeft;
		}
		r.top = asFixedRHSHalfElements[iItem].iTop;
		if (asFixedRHSHalfElements[iItem].iResizes) {
		  r.right = r.left + asFixedRHSHalfElements[iItem].iWidth + (cx - BASE_WIDTH * 2) / 2;
		}
		else {
		  r.right = r.left + asFixedRHSHalfElements[iItem].iWidth;
		}
		r.bottom = r.top + asFixedRHSHalfElements[iItem].iHeight;

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


BOOL CDlgPhonruleRule::OnInitDialog()
{
	CDlgEnvConstrainedRule::OnInitDialog();

	// retrieve the window placement
	WINDOWPLACEMENT wp;

	if (ERROR_SUCCESS == lGetWindowPlacement("DlgPhonruleRule", &wp)) {
	  SetWindowPlacement(&wp);
	  vSize(wp.rcNormalPosition.right - wp.rcNormalPosition.left - 8,  // 8 is the magic figure (border width)
			wp.rcNormalPosition.bottom - wp.rcNormalPosition.top - 32); // 32 is magic: border + title bar
	}

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgPhonruleRule::OnDestroy()
{
	CDlgEnvConstrainedRule::OnDestroy();

	WINDOWPLACEMENT wp; /* wndpl */
	GetWindowPlacement(&wp);

	lPutWindowPlacement("DlgPhonruleRule", &wp);
}

void CDlgPhonruleRule::OnSize(UINT nType, int cx, int cy)
{
	CDlgEnvConstrainedRule::OnSize(nType, cx, cy);

	// TODO: Add your message handler code here
	vSize(cx,cy);
}

void CDlgPhonruleRule::OnGetMinMaxInfo(MINMAXINFO FAR* lpMMI)
{
	CDlgEnvConstrainedRule::OnGetMinMaxInfo(lpMMI);

	// restrict minimum size to original size.
	lpMMI->ptMinTrackSize.x = BASE_WIDTH * 2 + 2 * ::GetSystemMetrics(SM_CXFRAME);
	lpMMI->ptMinTrackSize.y = BASE_HEIGHT * 2 + 2 * ::GetSystemMetrics(SM_CYFRAME) +
							  ::GetSystemMetrics(SM_CYCAPTION);
	lpMMI->ptMaxTrackSize.y = lpMMI->ptMinTrackSize.y; // don't change height
}
