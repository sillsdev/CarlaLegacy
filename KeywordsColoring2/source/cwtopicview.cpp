// CWTopicView.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "CWTopicView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

UINT gWhichTopicDialogID = CWTopicView::IDD; // here 'cause SPLITTER:CreateView doesn't let us pass any parameters to the constructor of the view

/////////////////////////////////////////////////////////////////////////////
// CWTopicView

IMPLEMENT_DYNCREATE(CWTopicView, CFormView)

CWTopicView::CWTopicView()
	: CFormView(gWhichTopicDialogID)
//	: CFormView(CWTopicView::IDD)
{
	//{{AFX_DATA_INIT(CWTopicView)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

// subclasses will use this one
CWTopicView::CWTopicView(UINT nIDTemplate)
	: CFormView(nIDTemplate)
{
	//{{AFX_DATA_INIT(CWTopicView)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

CWTopicView::~CWTopicView()
{
}

void CWTopicView::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CWTopicView)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CWTopicView, CFormView)
	//{{AFX_MSG_MAP(CWTopicView)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWTopicView diagnostics

#ifdef _DEBUG
void CWTopicView::AssertValid() const
{
	CFormView::AssertValid();
}

void CWTopicView::Dump(CDumpContext& dc) const
{
	CFormView::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CWTopicView message handlers
