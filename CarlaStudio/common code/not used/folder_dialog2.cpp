// FolderDialog.cpp: implementation of the CFolderDialog class.
//	$Copyright ©  1991-1998 Quma Software, Inc.  ALL RIGHTS RESERVED. $
//	$Header: FolderDialog.cpp  Revision:1.11  Tue Jun 23 18:00:44 1998  KenReed $

/*CFolderDialog is an MFC based class that encapsulates the Windows Shell function for browsing folders, ::ShBrowseForFolder.

To use it, you create an instance of CFolderDialog and call the DoModal method. Upon return, the method GetPathName can be used to retrieve the path to the user selected folder.

The constructor allows you to specify an optional initial folder, flags specific to the shell function (see the description of the ulFlags field of the BROWSEINFO structure in the help for Visual Studio or the Windows Shell API) and a pointer to the parent window’s CWnd. All of these arguments are optional.

You may override the two virtual methods OnInitDialog and OnSelChanged in a derived class to customize their behavior. The default behavior of OnInitDialog is to call SetSelection and SetStatusText with the folder name provided in the constructor. The default version of OnSelChanged places the new path into the status text area of the dialog.

The class provides utility functions for 1) enabling or disabling the OK button (EnableOK), 2) setting the status text that appears above the folder list box in the browser folder dialog box (SetStatusText) and 3) setting the current selection (SetSelection). The file MyFolderDialog.h, included in the zip file, shows an example of a derived class which uses SetStatusText.

For advanced users, the BROWSEINFO structure is available via the m_bi,/code> member variable. This structure is initialized by the constructor and any changes should be made before the call to DoModal. See the help for Visual Studio or the Windows Shell API for more information on the BROWSEINFO structure.
*/

#include "stdafx.h"
#include "Folder_Dialog2.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
static int CALLBACK BrowseDirectoryCallback(
				HWND hWnd, UINT uMsg, LPARAM lParam, LPARAM lpData)
{
	// Context was pointer to CFolderDialog instance
	CFolderDialog* pFd = (CFolderDialog*)lpData;

	// Let the class handle it
	pFd->CallbackFunction(hWnd, uMsg, lParam);

	// Always return 0 as per SHBrowseFolder spec
	return 0;
}

CFolderDialog::CFolderDialog(LPCTSTR lpszFolderName, DWORD dwFlags, CWnd* pParentWnd)
{
	// Use the supplied initial folder if non-null.
	if (lpszFolderName == NULL)
		m_strInitialFolderName = _T("");
	else
		m_strInitialFolderName = lpszFolderName;

	memset(&m_bi, '\0', sizeof(BROWSEINFO));

	if (pParentWnd == NULL)
		m_bi.hwndOwner = 0;
	else
		m_bi.hwndOwner = pParentWnd->GetSafeHwnd();

	// Fill in the rest of the structure
	m_bi.pidlRoot = NULL;
	m_bi.pszDisplayName = m_szDisplayName;
	m_bi.lpszTitle = _T("Current Selection");
	m_bi.ulFlags = dwFlags | BIF_STATUSTEXT;
	m_bi.lpfn = BrowseDirectoryCallback;
	m_bi.lParam = (LPARAM)this;

}

CFolderDialog::~CFolderDialog()
{

}

void CFolderDialog::CallbackFunction(HWND hWnd, UINT uMsg,	LPARAM lParam)
{
	// Save the window handle. The Set* functions need it and they may
	//	be called by the virtual funtions.
	m_hDialogBox = hWnd;

	// Dispatch the two message types to the virtual functions
	switch (uMsg)
	{
	case BFFM_INITIALIZED:
		OnInitDialog();
		break;
	case BFFM_SELCHANGED:
		OnSelChanged((ITEMIDLIST*) lParam);
		break;
	}
}

int CFolderDialog::DoModal()
{
	int nReturn = IDOK;

	// initialize the result to the starting folder value
	m_strFinalFolderName = m_strInitialFolderName;

	ITEMIDLIST* piid = NULL;

	// call the shell function
	piid = ::SHBrowseForFolder(&m_bi);

	// process the result
	if (piid && ::SHGetPathFromIDList(piid, m_szPath))
	{
		m_strFinalFolderName = m_szPath;
		nReturn = IDOK;
	}
	else
	{
		nReturn = IDCANCEL;
	}

	// Release the ITEMIDLIST if we got one
	if (piid)
	{
		LPMALLOC lpMalloc;
		VERIFY(::SHGetMalloc(&lpMalloc) == NOERROR);
		lpMalloc->Free(piid);
		lpMalloc->Release();
	}

	return nReturn;
}

CString CFolderDialog::GetPathName() const
{
	return m_strFinalFolderName;
}

void CFolderDialog::EnableOK(BOOL bEnable)
{
	// Documentation is incorrect! It is the lParam, not the wParam, that
	//	controls the enable!
	//::SendMessage(m_hDialogBox, BFFM_ENABLEOK, (bEnable ? 1 : 0), 0);
	::SendMessage(m_hDialogBox, BFFM_ENABLEOK, 0, (bEnable ? 1 : 0));
}

void CFolderDialog::SetSelection(LPCTSTR pszSelection)
{
	::SendMessage(m_hDialogBox, BFFM_SETSELECTION, TRUE, (LPARAM) pszSelection);
}

void CFolderDialog::SetSelection(ITEMIDLIST* pIdl)
{
	::SendMessage(m_hDialogBox, BFFM_SETSELECTION, FALSE, (LPARAM) pIdl);
}

void CFolderDialog::SetStatusText(LPCTSTR pszStatusText)
{
	::SendMessage(m_hDialogBox, BFFM_SETSTATUSTEXT, 0, (LPARAM) pszStatusText);
}

CString CFolderDialog::ShortName(const CString& strName)
{
	CString strShort;
	if (strName.GetLength() <= 35)
		strShort = strName;
	else
		strShort = strName.Left(35) + _T("...");

	return strShort;
}

void CFolderDialog::OnInitDialog()
{
	// Default handing of the init dialog message sets the selection to
	//	the initial folder
	SetSelection(m_strInitialFolderName);
	SetStatusText(ShortName(m_strInitialFolderName));
}

void CFolderDialog::OnSelChanged(ITEMIDLIST* pIdl)
{
	::SHGetPathFromIDList(pIdl, m_szPath);
	m_strFinalFolderName = m_szPath;
	SetStatusText(ShortName(m_strFinalFolderName));
}
