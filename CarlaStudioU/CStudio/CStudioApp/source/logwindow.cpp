// LogWindow.cpp : implementation file
//

#include "stdafx.h"
//#include "..\CarlaStudioApp.h"
#include "LogWindow.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLogWindow

IMPLEMENT_DYNCREATE(CLogWindow, CDocument)

CLogWindow::CLogWindow()
:m_bNew(TRUE)
{
}

BOOL CLogWindow::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;
	return TRUE;
}

CLogWindow::~CLogWindow()
{
}


BEGIN_MESSAGE_MAP(CLogWindow, CDocument)
	//{{AFX_MSG_MAP(CLogWindow)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLogWindow diagnostics

#ifdef _DEBUG
void CLogWindow::AssertValid() const
{
	CDocument::AssertValid();
}

void CLogWindow::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CLogWindow serialization

void CLogWindow::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CLogWindow commands

void CLogWindow::append(LPCTSTR lpszA, LPCTSTR lpszB, LPCTSTR lpszC, LPCTSTR lpszD)
{
   POSITION pos = GetFirstViewPosition();
   CView* pView = GetNextView(pos);
	ASSERTX(pView);
	ASSERTX(pView->IsKindOf(RUNTIME_CLASS(CEditView)));
	CEdit& ce  = ((CEditView*)pView)->GetEditCtrl();
   if(m_bNew)
   {
		m_bNew=FALSE;
		CFont* pFont = CFont::FromHandle( (HFONT) GetStockObject(ANSI_FIXED_FONT));
		ce.SetFont(pFont);
   }
	ce.ReplaceSel(lpszA);	// assumes sel is always at the end
	if(lpszB)
		ce.ReplaceSel(lpszB);
	if(lpszC)
		ce.ReplaceSel(lpszC);
	if(lpszD)
		ce.ReplaceSel(lpszD);

	SetModifiedFlag(FALSE);  // don't want to bug the user with saving changes
}

//global
void CLogWindow::writeToLog(LPCTSTR lpszA, LPCTSTR lpszB, LPCTSTR lpszC, LPCTSTR lpszD)
{
	CLogWindow* pDoc=NULL;
	CWinApp* pApp = AfxGetApp();

	POSITION pos;
	pos = pApp->GetFirstDocTemplatePosition();
	CString sType;
	CDocTemplate* pT=NULL;
	do
	{
		pT = pApp->GetNextDocTemplate(pos);
		if(pT)
			pT->GetDocString( sType, CDocTemplate::regFileTypeId );
	}
	while (sType != _T("LogWindow") && pos);

	ASSERTX(sType ==_T("LogWindow"));



	pos = pT->GetFirstDocPosition();
	if(pos)
	{
		pDoc = (CLogWindow*)pT->GetNextDoc(pos);
	}
	else	// need to open the log window
	{	pDoc = (CLogWindow*)pT->OpenDocumentFile(NULL);
	}
	ASSERTX(pDoc);

	pDoc->append(lpszA, lpszB, lpszC, lpszD);
}
