// keywordscoloring2Doc.cpp : implementation of the CKeywordscoloring2Doc class
//

#include "stdafx.h"
#include "keywordscoloring2.h"

#include "keywordscoloring2Doc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CKeywordscoloring2Doc

IMPLEMENT_DYNCREATE(CKeywordscoloring2Doc, CDocument)

BEGIN_MESSAGE_MAP(CKeywordscoloring2Doc, CDocument)
	//{{AFX_MSG_MAP(CKeywordscoloring2Doc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CKeywordscoloring2Doc construction/destruction

CKeywordscoloring2Doc::CKeywordscoloring2Doc()
{
	// TODO: add one-time construction code here

}

CKeywordscoloring2Doc::~CKeywordscoloring2Doc()
{
}

BOOL CKeywordscoloring2Doc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CKeywordscoloring2Doc serialization

void CKeywordscoloring2Doc::Serialize(CArchive& ar)
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
// CKeywordscoloring2Doc diagnostics

#ifdef _DEBUG
void CKeywordscoloring2Doc::AssertValid() const
{
	CDocument::AssertValid();
}

void CKeywordscoloring2Doc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CKeywordscoloring2Doc commands
