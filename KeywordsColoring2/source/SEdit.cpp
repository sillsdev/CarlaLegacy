// SEdit.cpp : implementation file
//

#include "stdafx.h"
//#include "studio.h"
#include "SEdit.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSEdit

CSEdit::CSEdit()
{
}

CSEdit::~CSEdit()
{
}


BEGIN_MESSAGE_MAP(CSEdit, CEdit)
	//{{AFX_MSG_MAP(CSEdit)
	ON_WM_KEYDOWN()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSEdit message handlers

void CSEdit::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	// TODO: Add your message handler code here and/or call default

	CEdit::OnKeyDown(nChar, nRepCnt, nFlags);
}
