// filelist.h: interface for the CFileList class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FILELIST_H__D7BC9500_89D7_11D2_864F_C8DF0CC10000__INCLUDED_)
#define AFX_FILELIST_H__D7BC9500_89D7_11D2_864F_C8DF0CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "PathDescriptor.h"

class CFileList : public CObject
{
	DECLARE_SERIAL(CFileList);
public:
	void add(LPCTSTR lpszPath);
	void add(CPathDescriptor* pd) {m_paths.Add(pd);}
	CFileList(const CFileList& rCopy);
	virtual void Serialize(CArchive& ar);
	virtual void resetChangeTrackers();
	virtual BOOL OnFileListDialog();
	CFileList();
	virtual ~CFileList();

	int GetSize() const {return m_paths.GetSize();}

	CPathDescriptor*& operator [](int i){return m_paths[i];}

	CPathDescArray m_paths;
	//---- for CFileListCtrl and letting the owner of us know what changed ---/
	// note that m_newlyEnabledPaths is not necessarily a superset of m_addedPaths,
	// since a path could be added but disabled before the user clicks ok
	CPathDescArray m_newlyEnabledPaths;
		// note that m_newlyDisabledPaths is a superset of m_removedPaths
	CPathDescArray m_newlyDisabledPaths;

	CPathDescArray m_removedPaths;
	CPathDescArray m_addedPaths;
};

#endif // !defined(AFX_FILELIST_H__D7BC9500_89D7_11D2_864F_C8DF0CC10000__INCLUDED_)
