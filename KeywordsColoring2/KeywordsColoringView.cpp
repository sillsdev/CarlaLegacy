// KeywordsColoringView.cpp : implementation of the CKeywordsColoringView class
//

#include "stdafx.h"
#include "KeywordsColoring2.h"

#include "KeywordsColoringDoc.h"
#include "KeywordsColoringView.h"
#include "Splitter.h"

#include "TreeViewEssai.h"
#include "ListViewEssai.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CKeywordsColoringView

IMPLEMENT_DYNCREATE(CKeywordsColoringView, CView)

BEGIN_MESSAGE_MAP(CKeywordsColoringView, CView)
	//{{AFX_MSG_MAP(CKeywordsColoringView)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CKeywordsColoringView construction/destruction

CKeywordsColoringView::CKeywordsColoringView()
{
	// TODO: add construction code here

}

CKeywordsColoringView::~CKeywordsColoringView()
{
}

BOOL CKeywordsColoringView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CKeywordsColoringView drawing

void CKeywordsColoringView::OnDraw(CDC* pDC)
{
	CKeywordsColoringDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CKeywordsColoringView printing

BOOL CKeywordsColoringView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CKeywordsColoringView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CKeywordsColoringView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CKeywordsColoringView diagnostics

#ifdef _DEBUG
void CKeywordsColoringView::AssertValid() const
{
	CView::AssertValid();
}

void CKeywordsColoringView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CKeywordsColoringDoc* CKeywordsColoringView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CKeywordsColoringDoc)));
	return (CKeywordsColoringDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CKeywordsColoringView message handlers
