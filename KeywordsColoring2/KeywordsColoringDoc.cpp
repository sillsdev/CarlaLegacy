// KeywordsColoringDoc.cpp : implementation of the CKeywordsColoringDoc class
//

#include "stdafx.h"
#include "KeywordsColoring2.h"

#include "KeywordsColoringDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CKeywordsColoringDoc

IMPLEMENT_DYNCREATE(CKeywordsColoringDoc, CDocument)

BEGIN_MESSAGE_MAP(CKeywordsColoringDoc, CDocument)
	//{{AFX_MSG_MAP(CKeywordsColoringDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CKeywordsColoringDoc construction/destruction

CKeywordsColoringDoc::CKeywordsColoringDoc()
{
	// TODO: add one-time construction code here

}

CKeywordsColoringDoc::~CKeywordsColoringDoc()
{
}

BOOL CKeywordsColoringDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CKeywordsColoringDoc serialization

void CKeywordsColoringDoc::Serialize(CArchive& ar)
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
// CKeywordsColoringDoc diagnostics

#ifdef _DEBUG
void CKeywordsColoringDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CKeywordsColoringDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CKeywordsColoringDoc commands
