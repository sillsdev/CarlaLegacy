// PathCtrl.cpp: implementation of the CPathCtrl class.
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "PathCtrl.h"
#include "FlatButton.h"
#include "StaticFileSpec.h"
//#include "folder_dialog2.h"
#include "dirdialog.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

const UINT kButtonID = 1009;

/////////////////////////////////////////////////////////////////////////////
// CPathCtrl

CPathCtrl::CPathCtrl(const CPathDescriptor& path,
					 LPCTSTR lpszFilter,
					 LPCTSTR lpszDefaultExt,
					 UINT nButtonBitMapID, // will also be used for the id of the button and should have a string resource for a tool tip on the button
					 UINT selectionPromptID,
					 UINT emptyPromptID,
					// UINT nPathToolTipID,
					 LPCTSTR pszDisplayWhenEmpty,  // can be a default or something like "No Prefix"
					 DWORD nFlags)
   :CStatic(),
   m_pButton(NULL),
	m_pStatic(NULL),
	m_path(path),
	m_nButtonBitmapID(nButtonBitMapID),
	m_sDefaultExt(lpszDefaultExt ),
	m_sFilter(lpszFilter),
	m_nFlags(nFlags),
	m_nSelectionPromptID(selectionPromptID),
	m_nEmptyPromptID(emptyPromptID),
//	m_nPathToolTipID(nPathToolTipID), // didn't work for some reason
	m_sDisplayWhenEmpty(pszDisplayWhenEmpty)
{
}

CPathCtrl::~CPathCtrl()
{
	if(m_pButton)
		delete m_pButton;
	if(m_pStatic)
		delete m_pStatic;
 }

BEGIN_MESSAGE_MAP(CPathCtrl, CStatic)
	//{{AFX_MSG_MAP(CPathCtrl)
		ON_BN_CLICKED(kButtonID, OnAddButton)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


void CPathCtrl::OnDraw(CDC *pDC)
{
	//just here because the base class is virual and you have to override Draw
}



void CPathCtrl::init()
{
	SetWindowText(_T(""));
	m_pButton = new CSimpleFlatButton();
	CRect r;
	this->GetClientRect(r);
	const int kButtonWidth=16;
	const int kBtnBorder=4;
	const int kSpaceBetweenStaticAndButton= 6;

	r.left=r.right-(kButtonWidth+kBtnBorder);
	m_pButton->Create(_T("x"), WS_CHILD|WS_VISIBLE, r, this, kButtonID);
	m_pButton->SetBitmap(m_nButtonBitmapID);

	m_pStatic = new CStaticFilespec(DT_LEFT | DT_NOPREFIX | DT_VCENTER, TRUE);
	this->GetClientRect(r);
	r.right -= (kButtonWidth+kBtnBorder+kSpaceBetweenStaticAndButton);

	m_pStatic->Create(_T("x"),  SS_SUNKEN|WS_CHILD|WS_VISIBLE, r, this);
	updatePathDisplay();

	// SETUP TOOL-TIPS

	m_ToolTip.Create (this);
	m_ToolTip.Activate (TRUE);

	CString sTemp;
	if(sTemp.LoadString(m_nButtonBitmapID))
		m_ToolTip.AddTool (m_pButton, m_nButtonBitmapID); // this would use the same id as the button itself :m_pButton->GetDlgCtrlID ());
	else
		m_ToolTip.AddTool (m_pButton, _T("Select a path")); // this would use the same id as the button itself :m_pButton->GetDlgCtrlID ());

// didn't work for some reason
	//if(m_nPathToolTipID)
	//	m_ToolTip.AddTool (m_pStatic, m_nPathToolTipID);

}

void CPathCtrl::OnAddButton()
{

	if(m_nEmptyPromptID && !m_path.IsEmpty())
	{
		AfxMessageBox(m_nEmptyPromptID, MB_ICONINFORMATION);
		//AfxMessageBox("In the following box, click 'Cancel' to empty this file path", MB_ICONINFORMATION   );
	}

	//char pszSelectionPrompt[1001];
	CString sSelectionPrompt;
	if(m_nSelectionPromptID)
		sSelectionPrompt.LoadString(m_nSelectionPromptID);
	//AfxLoadString(m_nSelectionPromptID, pszSelectionPrompt, 1000);
	//AfxLoadString
	if(m_nFlags & kSelectFolder)
	{
		CString s;
		//CFolderDialog dlg(m_path.IsEmpty()?m_path.getFullPath():m_path.getDirectory());
		CDirDialog dlg;
		dlg.m_strWindowTitle = _T("Select Folder");
		dlg.m_strSelDir = m_path.getFullPath();
		if(m_nSelectionPromptID)
			dlg.m_strTitle = sSelectionPrompt;
		else
			dlg.m_strTitle = _T(" ");
			//dlg.m_bi.lpszTitle =sSelectionPrompt;
		if(dlg.DoBrowse() == IDOK)
		{
			m_path = dlg.m_strPath +_T("\\"); //dlg.GetPathName() +_T("\\");
		}
		else if(m_nEmptyPromptID)
		{
			m_path=_T("");
		}
	}
	else
	{
		CFileDialog dlg(TRUE, m_sDefaultExt, m_path.getFullPath(),
			OFN_HIDEREADONLY,//|OFN_FILEMUSTEXIST,
			m_sFilter);
		if(m_nSelectionPromptID)
			dlg.m_ofn.lpstrTitle= sSelectionPrompt;
		if(dlg.DoModal() == IDOK)
		{
			m_path = dlg.GetPathName();
		}
		else if(m_nEmptyPromptID)
		{
			m_path=_T("");
		}
	}

	updatePathDisplay();
}

void CPathCtrl::updatePathDisplay()
{
	ASSERT(m_pStatic);

	if(m_path.IsEmpty())
		m_pStatic->SetWindowText(m_sDisplayWhenEmpty);
	else
		m_pStatic->SetWindowText(m_path.getFullPath());
}

BOOL CPathCtrl::PreTranslateMessage(MSG *pMsg)
{
	if (m_hWnd)
	{
		m_ToolTip.RelayEvent (pMsg);
		return CStatic::PreTranslateMessage(pMsg);
	}
	return (FALSE);
}
