// PageDisclaimer.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "PageDisclaimer.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageDisclaimer property page

IMPLEMENT_DYNCREATE(CPageDisclaimer, CPropertyPage)

CPageDisclaimer::CPageDisclaimer() : CPropertyPage(CPageDisclaimer::IDD)
{
	//{{AFX_DATA_INIT(CPageDisclaimer)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

CPageDisclaimer::~CPageDisclaimer()
{
}

void CPageDisclaimer::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageDisclaimer)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPageDisclaimer, CPropertyPage)
	//{{AFX_MSG_MAP(CPageDisclaimer)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageDisclaimer message handlers
