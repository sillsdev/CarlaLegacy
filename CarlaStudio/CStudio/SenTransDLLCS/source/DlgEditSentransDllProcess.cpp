// DlgEditSentransDllProcess.cpp : implementation file
//
// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
// jdh 15June2000 enable otherFile option

#include "stdafx.h"
//#include "..\CarlaStudioApp.h"
#include "DlgEditSentransDllProcess.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransDllProcess dialog


CDlgEditSentransDllProcess::CDlgEditSentransDllProcess(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEditSentransDllProcess::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEditSentransDllProcess)
	m_bOutputClassContents = FALSE;
	m_bTraceRules = FALSE;
	m_iFunction = -1;
	m_sRuleFilePath = _T("");
	//}}AFX_DATA_INIT

	m_bInTransferSeq = FALSE;
	m_bInInterlinearSeq = FALSE;
}


void CDlgEditSentransDllProcess::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);

		// setup the function buttons
	if(!pDX->m_bSaveAndValidate)
	{
		// the dialog template has all the radios disabled.
		// we need to enable the appropriate on (NOT a good interface)
		if(m_bInTransferSeq)
		{
			CWnd *pWndRadio = GetDlgItem(IDC_radioFunction3);
			if (pWndRadio)
			  {
				pWndRadio->ModifyStyle(WS_DISABLED, NULL);
				pWndRadio->Invalidate();
			  }
		}
		else if(m_bInInterlinearSeq)
		{
			CWnd *pWndRadio = GetDlgItem(IDC_radioFunction2);
			if (pWndRadio)
			  {
				pWndRadio->ModifyStyle(WS_DISABLED, NULL);
				pWndRadio->Invalidate();
			  }
		}
		else //analysis
		{
			CWnd *pWndRadio = GetDlgItem(IDC_radioFunction1);
			if (pWndRadio)
			  {
				pWndRadio->ModifyStyle(WS_DISABLED, NULL);
				pWndRadio->Invalidate();
			  }

			// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
			pWndRadio = GetDlgItem(IDC_radioFunction4);
			if (pWndRadio)
			  {
				pWndRadio->ModifyStyle(WS_DISABLED, NULL);
				pWndRadio->Invalidate();
			  }

			// jdh 15June2000 enable otherFile
			pWndRadio = GetDlgItem(IDC_radioFunction5);
			if (pWndRadio)
			  {
				pWndRadio->ModifyStyle(WS_DISABLED, NULL);
				pWndRadio->Invalidate();
			  }


			if(!(m_iFunction== 0 || m_iFunction==3	// one of these must be selected
				 || m_iFunction==4)) // jdh 15June2000
				m_iFunction = 0;
		}
	}

	// NOTICE THAT BECAUSE OF THE LATE ADDITION (6/99) OF THE FOURTH FUNCTION
	// (kAdjustAnalysis), the button orders and this enumeration are now out
	// of sync.  I can't change the enumeration order because that would break
	// existing user's control files.  I can't display the button in the order
	// of the enumeration because that would put this new one at the end (wrong).
	//
	// Note that MFC determines the "value" of the radio button set by the tab
	// order of the selected button.
	// So, the tab order of the buttons must put the new one (radio4) after
	// radio3, instead of after radio1 as you would expect. The user won't know
	// because most of the buttons are disabled at any one time anyways.

	//{{AFX_DATA_MAP(CDlgEditSentransDllProcess)
	DDX_Check(pDX, IDC_OutputClassContents, m_bOutputClassContents);
	DDX_Check(pDX, IDC_TraceRules, m_bTraceRules);
	DDX_Radio(pDX, IDC_radioFunction1, m_iFunction);
	DDX_Text(pDX, IDC_EDITRuleFile, m_sRuleFilePath);
	//}}AFX_DATA_MAP


}


BEGIN_MESSAGE_MAP(CDlgEditSentransDllProcess, CDialog)
	//{{AFX_MSG_MAP(CDlgEditSentransDllProcess)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEditSentransDllProcess message handlers
