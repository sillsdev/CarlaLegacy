// DlgEnvironments.cpp : implementation file
//

#include "stdafx.h"
#include "../resource.h"
#include "DlgEnvironments.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEnvironments dialog


CDlgEnvironments::CDlgEnvironments(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEnvironments::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEnvironments)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgEnvironments::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEnvironments)
//	DDX_Control(pDX, IDC_MSFLEXGRID1, m_grid);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEnvironments, CDialog)
	//{{AFX_MSG_MAP(CDlgEnvironments)
	ON_BN_CLICKED(IDtest, Ontest)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEnvironments message handlers

void CDlgEnvironments::Ontest()
{
/*	m_grid.SetCol(0);
	m_grid.SetRow(0);
	m_grid.SetText("zero-zero");
	m_grid.SetCol(1);
	m_grid.SetRow(1);
	m_grid.SetText("one-one");
*/
}

BEGIN_EVENTSINK_MAP(CDlgEnvironments, CDialog)
	//{{AFX_EVENTSINK_MAP(CDlgEnvironments)
	ON_EVENT(CDlgEnvironments, IDC_MSFLEXGRID1, -602 /* KeyDown */, OnKeyDownMsflexgrid1, VTS_PI2 VTS_I2)
	//}}AFX_EVENTSINK_MAP
END_EVENTSINK_MAP()

void CDlgEnvironments::OnKeyDownMsflexgrid1(short FAR* KeyCode, short Shift)
{
	// TODO: Add your control notification handler code here

}
