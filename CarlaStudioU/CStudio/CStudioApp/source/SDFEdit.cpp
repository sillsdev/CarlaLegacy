 // SDFEdit.cpp : implementation file
//

#include "stdafx.h"
#include "..\resource.h"
#include "SDFEdit.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSDFEdit

CSDFEdit::CSDFEdit()
{
}

CSDFEdit::~CSDFEdit()
{
}


BEGIN_MESSAGE_MAP(CSDFEdit, CEdit)
	//{{AFX_MSG_MAP(CSDFEdit)
	ON_WM_DRAWITEM()
	ON_WM_PAINT()
	ON_CONTROL_REFLECT(EN_UPDATE, OnUpdate)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSDFEdit message handlers

void CSDFEdit::OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct)
{
	// TODO: Add your message handler code here and/or call default

	CEdit::OnDrawItem(nIDCtl, lpDrawItemStruct);
}

void CSDFEdit::OnPaint()
{
	CPaintDC dc(this); // device context for painting

	dc.TextOut(0,0, "hello");

	// TODO: Add your message handler code here

	// Do not call CEdit::OnPaint() for painting messages
}

void CSDFEdit::OnUpdate()
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CEdit::OnInitDialog()
	// function to send the EM_SETEVENTMASK message to the control
	// with the ENM_UPDATE flag ORed into the lParam mask.

	// TODO: Add your control notification handler code here

}
