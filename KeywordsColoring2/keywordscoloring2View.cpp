// keywordscoloring2View.cpp : implementation of the CKeywordscoloring2View class
//

#include "stdafx.h"
#include "keywordscoloring2.h"

#include "keywordscoloring2Doc.h"
#include "keywordscoloring2View.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CKeywordscoloring2View

IMPLEMENT_DYNCREATE(CKeywordscoloring2View, CView)

BEGIN_MESSAGE_MAP(CKeywordscoloring2View, CView)
	//{{AFX_MSG_MAP(CKeywordscoloring2View)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CKeywordscoloring2View construction/destruction

CKeywordscoloring2View::CKeywordscoloring2View()
{
	// TODO: add construction code here

}

CKeywordscoloring2View::~CKeywordscoloring2View()
{
}

BOOL CKeywordscoloring2View::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CKeywordscoloring2View drawing

void CKeywordscoloring2View::OnDraw(CDC* pDC)
{
	CKeywordscoloring2Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CKeywordscoloring2View diagnostics

#ifdef _DEBUG
void CKeywordscoloring2View::AssertValid() const
{
	CView::AssertValid();
}

void CKeywordscoloring2View::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CKeywordscoloring2Doc* CKeywordscoloring2View::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CKeywordscoloring2Doc)));
	return (CKeywordscoloring2Doc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CKeywordscoloring2View message handlers
