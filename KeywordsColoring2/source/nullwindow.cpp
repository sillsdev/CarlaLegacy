// nullwindow.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "nullwindow.h"
#include "ProjectDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CNullWindow

IMPLEMENT_DYNCREATE(CNullWindow, CMDIChildWnd)

CNullWindow::CNullWindow()
{
}

CNullWindow::~CNullWindow()
{
}


BEGIN_MESSAGE_MAP(CNullWindow, CMDIChildWnd)
	//{{AFX_MSG_MAP(CNullWindow)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CNullWindow message handlers

BOOL CNullWindow::PreCreateWindow(CREATESTRUCT& cs)
{
   if(cs.style & WS_VISIBLE)
	   TRACE("cnullwindow visible\n");
   cs.style &= ~WS_VISIBLE;
   if(cs.style & WS_VISIBLE)
	   TRACE("cnullwindow visible\n");
  return CMDIChildWnd::PreCreateWindow(cs);
}

void CNullWindow::ActivateFrame(int nCmdShow)
{
	// Only allow it to activate if there are no languages, and someone
	// is needed to run the menus other than the application
//	if(!theApp.getProject()->getLanguageCount())
		CMDIChildWnd::ActivateFrame(SW_MINIMIZE);
}

void CNullWindow::CalcWindowRect(LPRECT lpClientRect, UINT nAdjustType)
{
	// TODO: Add your specialized code here and/or call the base class

	CMDIChildWnd::CalcWindowRect(lpClientRect, nAdjustType);
}
