// WHeadingTopicView.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "CWHeadingView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWHeadingView

IMPLEMENT_DYNCREATE(CWHeadingView, CFormView)

CWHeadingView::CWHeadingView()
	: CFormView(CWHeadingView::IDD)
{
	//{{AFX_DATA_INIT(CWHeadingView)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

CWHeadingView::~CWHeadingView()
{
}

void CWHeadingView::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CWHeadingView)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CWHeadingView, CFormView)
	//{{AFX_MSG_MAP(CWHeadingView)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWHeadingView diagnostics

#ifdef _DEBUG
void CWHeadingView::AssertValid() const
{
	CFormView::AssertValid();
}

void CWHeadingView::Dump(CDumpContext& dc) const
{
	CFormView::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CWHeadingView message handlers
