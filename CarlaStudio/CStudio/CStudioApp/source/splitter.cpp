// Splitter.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "Splitter.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSplitter

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
   ASSERTX(pDoc);
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
   ASSERTX(pNewView);

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
