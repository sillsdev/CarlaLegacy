// SafeStream.h: interface for the CSafeStream class.
//
//	Created: John Hatton, August 26, 1998
//
//	Use this function to safely write a text file so that
//  any errors that occur before the file is completely written
//  and closed will leave any pre-existing file unharmed.
//  It does this by creating a temporary file and renaming this
//	to the "real" file name only when closed successfully.
//
//	if the bMakeBackup parameter is TRUE, then the file being
//  replaced is renamed to file-ext.back

//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SAFESTREAM_H__FAF19981_3CCF_11D2_A09E_E12649467D2F__INCLUDED_)
#define AFX_SAFESTREAM_H__FAF19981_3CCF_11D2_A09E_E12649467D2F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

class ofstream;

class CSafeStream : public CObject
{
public:
	CString getTempPath();
	CSafeStream(LPCTSTR lpszPath, bool bMakeBackup = TRUE);
	virtual ~CSafeStream();
	void close();
	ofstream& openStream();


protected:
	DWORD checkForFileError(LPCTSTR lpszPath, BOOL bIgnoreERROR_ALREADY_EXISTS=TRUE);
	CString getFileName(LPCTSTR lpszPathName);
	CString getDirectory(LPCTSTR lpszPathName);

	CString m_sPath;
	CString m_sTempPath;
	ofstream* m_pOut;
	bool m_bNeedToClose;
	bool m_bMakeBackup;
};

#endif // !defined(AFX_SAFESTREAM_H__FAF19981_3CCF_11D2_A09E_E12649467D2F__INCLUDED_)
