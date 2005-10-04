// CDlgPhonruleRule.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "DlgPhonruleRule.h"
#include "TextDisplayInfo.h"

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
	resizerset = false;
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
static const char *oszDialogName = "DlgPhonruleRule";

BOOL CDlgPhonruleRule::OnInitDialog()
{
	CDlgEnvConstrainedRule::OnInitDialog();

	CResizerInit(&resizer, AfxFindResourceHandle(MAKEINTRESOURCE(IDD), RT_DIALOG),
				m_hWnd,IDD);
	CResizerResizerFlags(&resizer, IDOK,			RESIZER_MOVES_WITH_RIGHTBOTTOM);
	CResizerResizerFlags(&resizer, IDCANCEL,		RESIZER_MOVES_WITH_RIGHTBOTTOM);
	CResizerResizerFlags(&resizer, IDC_EnvList,	RESIZER_SIZES_HORIZONTAL);
	CResizerResizerFlags(&resizer, IDC_Comments,	RESIZER_SIZES_HORIZONTAL);
	CResizerResizerFlags(&resizer, IDC_STATICapply,	RESIZER_SIZES_HORIZONTAL);
	CResizerResizerFlags(&resizer, IDC_From,		RESIZER_SIZES_HORIZONTAL | RESIZER_SIZES_HOR_HALFSPEED );
	CResizerResizerFlags(&resizer, IDC_To,		RESIZER_SIZES_HORIZONTAL | RESIZER_SIZES_HOR_HALFSPEED | RESIZER_MOVES_WITH_RIGHTTOP | RESIZER_MOVES_HOR_HALFSPEED);
	CResizerResizerFlags(&resizer, IDC_STATICto,	RESIZER_MOVES_WITH_RIGHTTOP | RESIZER_MOVES_HOR_HALFSPEED);
	CResizerResizerFlags(&resizer, IDC_Category,	RESIZER_MOVES_WITH_RIGHTTOP);
	CResizerResizerFlags(&resizer, IDC_STATICcategory,	RESIZER_MOVES_WITH_RIGHTTOP);
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

	if (resizerset)
		CResizerResize(&resizer, cx, cy*2);
	// TODO: Add your message handler code here
	/* finally, the ultimate resizer - resize the List control automatically */
	CListCtrl *clc = (CListCtrl *) GetDlgItem(IDC_EnvList);
	if (clc && clc->m_hWnd) {
		CRect r;
		clc->GetClientRect(&r);
		clc->SetColumnWidth(0, r.Width()/3);
	}
}

void CDlgPhonruleRule::OnGetMinMaxInfo(MINMAXINFO FAR* lpMMI)
{
	CDlgEnvConstrainedRule::OnGetMinMaxInfo(lpMMI);

	// restrict minimum size to original size.
	lpMMI->ptMinTrackSize.x = (long) (((double) resizer.sDialogData.cx) * resizer.x_factor + ::GetSystemMetrics(SM_CXFRAME));
	lpMMI->ptMinTrackSize.y = (long) (((double) resizer.sDialogData.cy) * 2 + ::GetSystemMetrics(SM_CYFRAME) +
							  ::GetSystemMetrics(SM_CYCAPTION));
	lpMMI->ptMaxTrackSize.y = lpMMI->ptMinTrackSize.y; // don't change height
}
