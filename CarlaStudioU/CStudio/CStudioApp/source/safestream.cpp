// SafeStream.cpp: implementation of the CSafeStream class.
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
//
//	TO DO:  if the bUseTemp parameter is TRUE, then the files are written
// to the Windows temp directory and then moved.  Otherwise, the
//  same directory as the destination is used.
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "SafeStream.h"
#include <fstream.h>
#include  <io.h>
#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
CString CSafeStream::getDirectory(LPCTSTR lpszPathName)
{
	TCHAR path_buffer[_MAX_PATH];
   TCHAR drive[_MAX_DRIVE];
   TCHAR dir[_MAX_DIR];
   TCHAR fname[_MAX_FNAME];
   TCHAR ext[_MAX_EXT];

  _tsplitpath( lpszPathName, drive, dir, fname, ext );
   _tmakepath( path_buffer, drive, dir,  NULL, NULL);
	if(!_tcslen(path_buffer))
		return _T(".");
	return path_buffer;
}

CSafeStream::CSafeStream(LPCTSTR lpszPath, bool bMakeBackup)
:	m_sPath(lpszPath),
	m_bNeedToClose(FALSE),
	m_bMakeBackup(bMakeBackup),
	m_pOut(NULL)
{
	//m_sTempPath.Format("%s-tmp.%s",getFileName(lpszPath), getFileExt(lpszPath));

	UINT iUniqueNum = GetTempFileName(
		getDirectory(m_sPath), 	// directory name for temporary file  ("." = use current dir)
		getFileName(m_sPath).Left(3), // address of filename prefix
		NULL , // make up a number
		m_sTempPath.GetBuffer(MAX_PATH+1)
		);
	m_sTempPath.ReleaseBuffer();
}

CSafeStream::~CSafeStream()
{
	if(m_bNeedToClose)
	{
		TRACE(_T("CSafeStream.close() wasn't called.  Deleting file %s\n"), m_sTempPath);
		m_pOut->close();
		DeleteFile(m_sTempPath);
	}
	if(m_pOut)
		delete m_pOut;
}

// you can call getTempPath(), instead of this, when you don't want a stream, just a path
ofstream& CSafeStream::openStream()
{
	USES_CONVERSION;
	m_pOut = new ofstream(T2CA(m_sTempPath), ios::out);
	if(m_pOut->is_open())
	{
		m_bNeedToClose = TRUE;
		return *m_pOut;
	}
	checkForFileError(m_sTempPath);
	ASSERTX(FALSE);
	return *m_pOut;	// not a good choice, but highly unlikely to get this far
}

DWORD CSafeStream::checkForFileError(LPCTSTR lpszPath, BOOL bIgnoreERROR_ALREADY_EXISTS)
{
	DWORD dwError = ::GetLastError();
	if(dwError == ERROR_ALREADY_EXISTS && bIgnoreERROR_ALREADY_EXISTS)
		return FALSE;

	if(!dwError)
		return FALSE;

	LPTSTR lpBuffer;
	if(::FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM |
			FORMAT_MESSAGE_ALLOCATE_BUFFER,
			NULL, dwError,
			MAKELANGID(LANG_NEUTRAL, SUBLANG_SYS_DEFAULT),
			(LPTSTR) &lpBuffer, 0, NULL) != 0)
	{
		CString s(lpBuffer);
		s += _T("\n");
		s += lpszPath;
		AfxMessageBox(s);
		::LocalFree(lpBuffer);
	}
	else
	{
		CString s(_T("Unknown Error\n"));
		s += _T("\n");
		s += lpszPath;
		AfxMessageBox(s);
	}
	return dwError;
}
CString CSafeStream::getFileName(LPCTSTR lpszPathName)
{
   TCHAR drive[_MAX_DRIVE];
   TCHAR dir[_MAX_DIR];
   TCHAR fname[_MAX_FNAME];
   TCHAR ext[_MAX_EXT];

  _tsplitpath( lpszPathName, drive, dir, fname, ext );
	CString s(fname);
//	s+=ext;
	return CString(s);
}

void CSafeStream::close()
{
	m_bNeedToClose = FALSE;
	if(m_pOut)	// they may have used this class without using the stream function openStream()
	{
		m_pOut->close();
		delete m_pOut;
		m_pOut=NULL;
	}

	// rename
	if(m_bMakeBackup)
	{
		CString s(m_sPath.Left(m_sPath.GetLength()-4)); // everything but the ext
		CString sBackPath;
		sBackPath.Format(_T("%s-%s.bak"), (LPCTSTR)s, (LPCTSTR)m_sPath.Right(3));
		if(_taccess(sBackPath, 0) != -1)
		{
			if(!DeleteFile(sBackPath))	// delete old backup
			{
				checkForFileError(sBackPath);
				return;
			}
		}
		if(_taccess(m_sPath, 0) != -1)
		{
			if(! MoveFile (m_sPath, sBackPath)) // make the old file the backup
			{
				checkForFileError(m_sPath);
				return;
			}
		}
	}
	else	// no backup file wanted
	{
		if(_taccess(m_sPath, 0) != -1)
		{
			if(!DeleteFile(m_sPath))	// delete old file
			{
				checkForFileError(m_sPath);
				return;
			}
		}
	}
	if(! MoveFile (m_sTempPath, m_sPath)) // make our file the real one
	{
		checkForFileError(m_sTempPath);
		return;
	}
}

// call this instead of openStream() when you don't want a stream, just a path
CString CSafeStream::getTempPath()
{
	return m_sTempPath;
}
