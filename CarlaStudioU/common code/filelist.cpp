// filelist.cpp: implementation of the CFileList class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "filelist.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
IMPLEMENT_SERIAL(CFileList, CObject, 1);

CFileList::CFileList()
{

}

CFileList::~CFileList()
{
	resetChangeTrackers(); // delete paths still in m_removedPaths

	for(int iPath=0; iPath< m_paths.GetSize(); iPath++)
		delete m_paths[iPath];
	m_paths.RemoveAll();

}


// copy constructor
// note: ignores all intermediate state members, copying just the paths
CFileList::CFileList(const CFileList &rCopy)
{
	for(int i=0; i<rCopy.GetSize();i++)
	{
		CPathDescriptor* pd = new CPathDescriptor(rCopy.m_paths.GetAt(i)->getFullPath());
		m_paths.Add(pd);
	}
}

void CFileList::resetChangeTrackers()
{
	m_newlyDisabledPaths.RemoveAll();
	m_newlyEnabledPaths.RemoveAll();
	m_addedPaths.RemoveAll();

	for(int iPath=0; iPath< m_removedPaths.GetSize(); iPath++)
		delete m_removedPaths[iPath];
	m_removedPaths.RemoveAll();

}


BOOL CFileList::OnFileListDialog()
{

/*	CDlgCorpus dlg(this);
	if(IDOK == dlg.DoModal())
	{
		return TRUE;
	}
*/
	return FALSE;
}




void CFileList::Serialize(CArchive &ar)
{
	if(ar.IsStoring())
	{
		int pathCount = m_paths.GetSize();
		ar << pathCount;

		for(int iPath=0; iPath < pathCount; iPath++)
		{
			m_paths[iPath]->Serialize(ar);
		}
	}
	else
	{
		int corpusCount;
		ar >> corpusCount;

		for(int iPath=0; iPath < corpusCount; iPath++)
		{
			CPathDescriptor* pD = new CPathDescriptor();
			pD->Serialize(ar);
			m_paths.Add(pD);
		}
	}
}



void CFileList::add(LPCTSTR lpszPath)
{
	CPathDescriptor* pd = new CPathDescriptor(lpszPath);
	this->m_paths.Add(pd);
}
