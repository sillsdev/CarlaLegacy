// DlgFind.cpp : implementation file
//

#include "stdafx.h"
//#include "cstudio.h"
#include "..\resource.h"

#include "DlgFind.h"
#include "TextDisplayInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

CString gsFindWhat; // global so that each find starts with the contents of the last find
DWORD gdwFindFlags=NULL;

/////////////////////////////////////////////////////////////////////////////
// CDlgFind dialog

// I STARTED OUT WITH A TEMPLATE, BUT COULDN'T FIGURE OUT HOW TO MAKE IT
// WORK (i DIDN'T TRY TOO HARD)
// INSTEAD, I FOUND THAT ALL I NEED THIS CLASS FOR IS TO SET THE FONT
// OF THE FIND-WHAT BOX, WHICH I GET VIA A CONSTANT DEFINED IN <dlgs.h>

CDlgFind::CDlgFind(const CTextDisplayInfo* pDisplayInfo, CWnd* pParent /*=NULL*/)
	: CFindReplaceDialog(),
	m_pDisplayInfo(pDisplayInfo)
{
	//{{AFX_DATA_INIT(CDlgFind)
//	m_bMatchCase = FALSE;
//	m_sWhat = _T("");
	//}}AFX_DATA_INIT
}
#include <dlgs.h>

void CDlgFind::DoDataExchange(CDataExchange* pDX)
{
	CFindReplaceDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgFind)
//	DDX_Check(pDX, IDC_MatchCase, m_bMatchCase);
//	DDX_Text(pDX, IDC_What, m_sWhat);
	//}}AFX_DATA_MAP

	/*HWND phw;
	(CEdit*)GetDlgItem(edt1, &phw);
	if(phw)
	{
		;
	} */
	CWnd* p = GetDlgItem(edt1);
	if(p && m_pDisplayInfo)
	{
		p->SetFont(m_pDisplayInfo->getFont());
	}

}


BEGIN_MESSAGE_MAP(CDlgFind, CFindReplaceDialog)
	//{{AFX_MSG_MAP(CDlgFind)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgFind message handlers
