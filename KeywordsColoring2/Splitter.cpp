// Splitter.cpp : implementation file
//

#include "stdafx.h"
#include "Splitter.h"

//#include "InputTextLeftView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSplitter
IMPLEMENT_DYNAMIC(CSplitter, CSplitterWnd)

CSplitter::CSplitter()
{
}

CSplitter::~CSplitter()
{
}


BEGIN_MESSAGE_MAP(CSplitter, CSplitterWnd)
	//{{AFX_MSG_MAP(CSplitter)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CSplitter message handlers
BOOL CSplitter::ReplaceView(int row, int col,CRuntimeClass * pViewClass,SIZE size)
{
	CCreateContext context;
	BOOL bSetActive;

	// if ((GetPane(row,col)->IsKindOf(pViewClass))==TRUE)
  //     return FALSE;


   // Get pointer to CDocument object so that it can be used in the creation
   // process of the new view
  CDocument * pDoc= ((CView *)GetPane(row,col))->GetDocument();
   //ASSERTX(pDoc);



  CView * pActiveView=GetParentFrame()->GetActiveView();
   if (pActiveView==NULL || pActiveView==GetPane(row,col))
	  bSetActive=TRUE;
   else
	  bSetActive=FALSE;

 // set flag so that document will not be deleted when view is destroyed
	pDoc->m_bAutoDelete=FALSE;
	// Delete existing view
   ((CView *) GetPane(row,col))->DestroyWindow();
	// set flag back to default
	pDoc->m_bAutoDelete=TRUE;

	// Create new view

   context.m_pNewViewClass=pViewClass;
   context.m_pCurrentDoc=pDoc;
   context.m_pNewDocTemplate=NULL;
   context.m_pLastView=NULL;
   context.m_pCurrentFrame=NULL;

  CreateView(row,col,pViewClass,size, &context);

   CView * pNewView= (CView *)GetPane(row,col);
//   ASSERTX(pNewView);

   if (bSetActive==TRUE)
	  GetParentFrame()->SetActiveView(pNewView);

   RecalcLayout();

//   AfxMessageBox("CSplitter OnInitialUpdate");
  // JDH added this
   pNewView->OnInitialUpdate();
  //  AfxMessageBox("CSplitter SendMessage");

   GetPane(row,col)->SendMessage(WM_PAINT);

   return TRUE;
}

CWnd* CSplitter::GetActivePane(int* pRow, int* pCol)
{

	ASSERT_VALID(this);

	// attempt to use active view of frame window
	CWnd* pView = NULL;
	CFrameWnd* pFrameWnd = GetParentFrame();
	ASSERT_VALID(pFrameWnd);
	pView = pFrameWnd->GetActiveView();

	// 0 ligne et 1 colonne. Exemple: Morophophonologie
	int x;
	if(( GetRowCount( ) == 0 ) && ( GetColumnCount()==1 ))
		x = IdFromRowCol( 0, 1 );

	// 1 ligne et 0 colonne. Exemple: Morphologie
	if(( GetRowCount( ) == 1 ) && ( GetColumnCount()==0 ))
		x = IdFromRowCol( 1, 0 );


	// failing that, use the current focus
	if (pView == NULL)
		pView = GetFocus();

	return pView;
}
