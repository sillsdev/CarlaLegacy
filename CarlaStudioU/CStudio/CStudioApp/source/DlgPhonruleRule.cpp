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
static const char *oszDialogName = "DlgPhonruleRule";
#define BASE_WIDTH   296
#define BASE_HEIGHT  215

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
	ON_WM_GETMINMAXINFO()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgPhonruleRule message handlers

void CDlgPhonruleRule::vSize(int cx, int cy)
{
	// resize all bits
	CEdit *pE;
	CRect r;

#define TOPBORDER (::GetSystemMetrics(SM_CYCAPTION) + ::GetSystemMetrics(SM_CYFRAME))
#define GROUPBOXESFROMTOP 135
#define ALIGN_BOXES_LEFT  LeftCorrect(58) // (<58)

	/* {
		char zc[100];
		TCHAR sz[100];
		sprintf(zc, "CXFRAME: %d", ::GetSystemMetrics(SM_CXFRAME));
		vMyStrCpy(sz, zc);
		MessageBox(sz);
	} */

	// sizing elements
	tsSizingElement asSizingElements[] = {
		// fixed to the right hand side of the dialog
		{ IDC_STATICcategory, 216, 2*31, 18,16,0 },
		{ IDC_Category,       144, 2*65, 12,36,0 },

		// Aligned from the bottom - negative vertical distance
		{ IDCANCEL,           114, 2*50, -44, 28, 0 },
		{ IDOK,               232, 2*50, -44, 28, 0 },

		/* aligned from the bottom and the left. */
		{ IDC_CHECKEnabled,   LeftCorrect(8),  2*42, (197-BASE_HEIGHT) * 2, 10*2, 1 }, // 8,183,42,10

		// align things on the right hand side
		{ IDC_EnvList,        LeftCorrect(58),  -12,   44*2, 48*2, 1 },  // 58,44,224,48
		{ IDC_Comments,       LeftCorrect(58),  -12,  101*2, 28*2, 1 }, //58,85,224,28,
		{ IDC_STATICapply,    LeftCorrect(174), -12,  135*2, 50*2, 1 }, // 174,135,108,50
			/* radio's */
//		iHorFromBorder, iWidth, iVertFromBorder, iHeight, iAlignLeft;

		{ IDC_RADIORuleType,  LeftCorrect(65),  2*57, 149*2, 10*2, 1 },
		{ IDC_RADIOBaseRule,  LeftCorrect(65),  2*49, 164*2, 10*2, 1 },
		{ IDC_RADIOForce,     LeftCorrect(182), 2*97, 146*2, 10*2, 1 },
		{ IDC_RADIOInitial,   LeftCorrect(182), 2*70, 158*2, 10*2, 1 },
		{ IDC_RADIOFinal,     LeftCorrect(182), 2*68, 170*2, 10*2, 1 },
		{ IDC_STATICruletype, ALIGN_BOXES_LEFT, 2*69, 135*2, 50*2, 1 } // 174,135,108,50
	};
	vResize(this,cx,cy,asSizingElements,sizeof(asSizingElements)/sizeof(asSizingElements[0]));

	/*
	 * The To-box moves half steps and resizes half steps
	 */
	//    EDITTEXT        IDC_To,130,6,39,29,ES_AUTOHSCROLL
	//    LTEXT           "To:",IDC_STATICto,114,9,12,8
	//    EDITTEXT        IDC_From,58,6,43,29,ES_AUTOHSCROLL
#define EDITTEXTHEIGHT 29 /* the from and to-boxes */
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
		{ IDC_To,       260, 78, 12, EDITTEXTHEIGHT*2, 1,1 },
		{ IDC_From,     ALIGN_BOXES_LEFT, 43*2, 12, EDITTEXTHEIGHT*2, 1,0 } // 58,6,43,14
	};
	for (int iItem = 0; iItem < sizeof(asFixedRHSHalfElements)/sizeof(asFixedRHSHalfElements[0]); iItem++) {
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

	if (ERROR_SUCCESS != lGetWindowPlacement(oszDialogName, &wp)) {
		GetWindowPlacement(&wp);
	}

	SetWindowPlacement(&wp);
	vSize(wp.rcNormalPosition.right - wp.rcNormalPosition.left - 8,  // 8 is the magic figure (border width)
			wp.rcNormalPosition.bottom - wp.rcNormalPosition.top - 32); // 32 is magic: border + title bar

//	dpi.Attach(AfxFindResourceHandle(MAKEINTRESOURCE(IDD), RT_DIALOG),
//				m_hWnd,IDD,120.0); // 96 is the DPI

	return TRUE;  // return TRUE unless you set the focus to a control
				  // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgPhonruleRule::OnDestroy()
{
	CDlgEnvConstrainedRule::OnDestroy();

	WINDOWPLACEMENT wp; /* wndpl */
	GetWindowPlacement(&wp);

	lPutWindowPlacement(oszDialogName, &wp);
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
