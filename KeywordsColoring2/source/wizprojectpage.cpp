// wizProjectPage.cpp : implementation file
//

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "wizProjectPage.h"
#include "ProjectDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPageProjectPath dialog


CPageProjectPath::CPageProjectPath(CWnd* pParent /*=NULL*/)
	:  CWizPage(CPageProjectPath::IDD)
{
	//{{AFX_DATA_INIT(CPageProjectPath)
	m_sProjectPath = _T("");
	//}}AFX_DATA_INIT
}


void CPageProjectPath::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPageProjectPath)
	DDX_Text(pDX, IDC_ProjectLoc, m_sProjectPath);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPageProjectPath, CDialog)
	//{{AFX_MSG_MAP(CPageProjectPath)
	ON_BN_CLICKED(IDC_BTNProjectLoc, OnBTNProjectPath)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPageProjectPath message handlers

void CPageProjectPath::OnBTNProjectPath()
{
	UpdateData(TRUE); // download any ctrl values, because we're going to upload at the end of this method

	CDocTemplate* pDT = theApp.getDocTemplate(CProjectDoc::getRegFileTypeID());
	CString sFileTypeName;
	pDT->GetDocString(sFileTypeName, CDocTemplate::regFileTypeName);
	CString sFilter;
	pDT-> GetDocString(sFilter, CDocTemplate::filterName);
	CString sExt;
	pDT-> GetDocString(sExt, CDocTemplate::filterExt);
	sFilter += "|*";
	sFilter += sExt;
	sFilter+= "||";
	CFileDialog dlg( FALSE,
		sExt,
		"MyProject",
		OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
		sFilter, NULL );
	CString sPrompt("Save New Project ");

	char* lpszPrompt = new char[sPrompt.GetLength()+1];
	strcpy(lpszPrompt, sPrompt);
	dlg.m_ofn.lpstrTitle  = lpszPrompt;

	if(IDOK == dlg.DoModal())
		m_sProjectPath = dlg.GetPathName();

	UpdateData(FALSE);
	checkStatus();
}

void CPageProjectPath::checkStatus()
{
	if (!m_sProjectPath.GetLength())
		getOwner()->SetWizardButtons(PSWIZB_BACK);
	else
		getOwner()->SetWizardButtons(PSWIZB_FINISH | PSWIZB_BACK);
}
