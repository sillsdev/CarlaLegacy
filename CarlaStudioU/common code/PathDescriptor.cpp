//jdh 2/9/00 getShortPath() now throws exception if file not found
//		14-Mar-2000 jdh modified nukeDirectory to somewhat alleviate NT security problem
// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse
// 2.1.5 29-Mar-2000 hab Fix bug which checked for time of non-enabled dictionary (also check now for existence)
// 2.1.7 12-Apr-2000 hab Added fileIsReadOnly() and forceFileWritable() functions

#include "stdafx.h"
#include "PathDescriptor.h"

#include <io.h>

#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <direct.h>
#include <errno.h>

#include "CSConv.h" // for USES_CONVERSION stuff

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

CPathDescriptor::CPathDescriptor()
:	m_bEnabled(TRUE),
	CString()
{
	m_sDirectory = _T("");
	m_sFileName = _T("");
	m_sFileExtension = _T("");
}

CPathDescriptor::CPathDescriptor(LPCTSTR lpszPath)
:	m_bEnabled(TRUE),
	CString(lpszPath)
{
	parsePath();
}

void CPathDescriptor::parsePath()
{
	TCHAR dir[_MAX_DIR];
	TCHAR fname[_MAX_FNAME];
	TCHAR ext[_MAX_EXT];
	TCHAR drive[_MAX_DRIVE];
	if(GetLength())
	{	// TO DO: How to check for a valid-looking path?
		_tsplitpath( LPCTSTR(*this), drive, dir, fname, ext );

		m_sDirectory = drive;
		m_sDirectory += dir;
		m_sFileName = fname;
		m_sFileExtension = ext;
	}
	else
	{
		m_sDirectory = _T("");
		m_sFileName = _T("");
		m_sFileExtension = _T("");
	}
}

ostream& operator<<(ostream& sout, CPathDescriptor& pd)
{
	USES_CONVERSION;
	return sout << T2CA(pd.getFullPath());
}

BOOL CPathDescriptor::fileExists() const
{
//	WIN32_FIND_DATA fileInfo;
//	HANDLE h = FindFirstFile(*this, &fileInfo);

	return(0 == _taccess(*this, 0));
}

BOOL CPathDescriptor::fileExistsAndIsClosed() const
{
	if(0 != _taccess(*this, 06))//read & write permission
		return FALSE;
	// that should be enough, but for some reason, it's not.

	HANDLE	hFile = CreateFile(*this,           // open MYFILE.TXT
				GENERIC_READ,              // open for reading
				FILE_SHARE_READ,           // share for reading
				NULL,                      // no security
				OPEN_EXISTING,             // existing file only
				FILE_ATTRIBUTE_NORMAL,     // normal file
				NULL);
	if(hFile != INVALID_HANDLE_VALUE)
	{
		CloseHandle(hFile); // don't really want it open
		return TRUE;
	}
	else
		return FALSE;


//WIN32_FIND_DATA fileInfo;
//	HANDLE h = FindFirstFile(*this, &fileInfo);
//return (INVALID_HANDLE_VALUE != h);
}

void CPathDescriptor::deleteFile()
{
	DeleteFile(*this);
}

// returns the path compressed into 8.3 format called a "short path"
CString CPathDescriptor::getShortPath() const
{
	if(!fileExists())	// GetShortPathName() won't work unless the file exists
	{
		//jdh 2/9/00 added an exception here, had just an assert
		CString sError(_T("This file doesn't exist: "));
		sError += LPCTSTR(*this);
		throw(sError);

		//ASSERTX(FALSE);
		//return *this;	// at least this is better than returning junk
	}

	TCHAR shortPath[1001];
	*shortPath = 0; // testing
	int x = GetShortPathName( LPCTSTR(*this), shortPath, 1000);
	ASSERTX(x <1001 );
	return CString(shortPath);
}


// global
CString getDirectory(LPCTSTR lpszPathName)
{
	TCHAR path_buffer[_MAX_PATH];
	TCHAR drive[_MAX_DRIVE];
	TCHAR dir[_MAX_DIR];
	TCHAR fname[_MAX_FNAME];
	TCHAR ext[_MAX_EXT];

	_tsplitpath( lpszPathName, drive, dir, fname, ext );
	_tmakepath( path_buffer, drive, dir,  NULL, NULL);
	return CString(path_buffer);
}

CString getFileName(LPCTSTR lpszPathName)
{
   if(!lpszPathName || !_tcslen(lpszPathName))
	   return CString(_T(""));

   TCHAR drive[_MAX_DRIVE];
   TCHAR dir[_MAX_DIR];
   TCHAR fname[_MAX_FNAME];
   TCHAR ext[_MAX_EXT];

  _tsplitpath( lpszPathName, drive, dir, fname, ext );
	CString s(fname);
//	s+=ext;
	return CString(s);
}

// if the string is empty, returns an empty string
CString getFullFileName(LPCTSTR lpszPathName)
{
	if(_tcslen( lpszPathName) )
	{
	   TCHAR drive[_MAX_DRIVE];
	   TCHAR dir[_MAX_DIR];
	   TCHAR fname[_MAX_FNAME];
	   TCHAR ext[_MAX_EXT];

	  _tsplitpath( lpszPathName, drive, dir, fname, ext );
		CString x(fname);
		x += ext;
		return x;
	} else return CString();
}
// global: ensures the dir ends in a slash, for concatenation purposes
void fixDirectory(CString& sDir)
{
	ASSERTX(sDir.GetLength());
	if(sDir[sDir.GetLength()-1] != '\\')
		sDir += _T("\\");
}

// global: alerts the user to system errors and returns the error, if any
// ERROR_ALREADY_EXISTS is returned when you open an ofstream on an existing
//		file; it's not really an error condition as far as I can tell; the
//		file is still opened.
DWORD checkForFileError(LPCTSTR lpszPath1, LPCTSTR lpszPath2, BOOL bIgnoreERROR_ALREADY_EXISTS, BOOL bExceptionInsteadOfDialog)
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
		s.Format(_T("%s\n%s"),  lpBuffer, lpszPath1);
		if(lpszPath2)
		{	s += _T("\nDest: ");
			s += lpszPath2;
		}
		if(bExceptionInsteadOfDialog)
			throw s;
		else
			AfxMessageBox(s);
		::LocalFree(lpBuffer);
	}
	else
	{
		CString s(_T("Unknown Error\n"));
		s.Format(_T("Unknown Error\n%s"),  lpBuffer, lpszPath1);
		if(lpszPath2)
		{	s += _T("\nDest: ");
			s += lpszPath2;
		}
		AfxMessageBox(s);
	}
	return dwError;
}


// same as above but no file-specific stuff
DWORD checkForSystemError(LPCTSTR lpszDetails)
{
	DWORD dwError = ::GetLastError();

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
		if(lpszDetails)
		{
			s += _T("\n");
			s += lpszDetails;
		}
		AfxMessageBox(s);
		::LocalFree(lpBuffer);
	}
	else
	{
		CString s(_T("Unknown Error\n"));
		if(lpszDetails)
		{
			s += _T("\n");
			s += lpszDetails;
		}
		AfxMessageBox(s);
	}
	return dwError;
}

// used to copy a path but change the extension,
// a common operation made by text processors
void CPathDescriptor::set(CPathDescriptor & path, LPCTSTR lpszExt)
{
	*this = path.getDirectory() + path.getFileName() + lpszExt;
	parsePath();
}

// removes the directory and all the files in it
// returns TRUE if the directory is now not there
BOOL nukeDirectory(LPCTSTR lpszDirPath, BOOL* pbDeletedAllFiles)
{
	if(-1 == _taccess(lpszDirPath, 0))
		return TRUE;	// doesn't exist (that's assumed to be fine)

	//char* lpszFixedDirPath = new char[_tcslen(lpszDirPath) + 10];
	CString sFixedDirPath(lpszDirPath);
	//strcpy(lpszFixedDirPath, lpszDirPath);
	::fixDirectory(sFixedDirPath);	// make sure this ends with a '/'

	CString sFilePattern(sFixedDirPath);

	sFilePattern+=_T("*.*");
	WIN32_FIND_DATA findFileData;
	HANDLE hFileInfo = FindFirstFile(sFilePattern, &findFileData);
	BOOL bFound = (INVALID_HANDLE_VALUE != hFileInfo);
	BOOL bOK= TRUE;
	while (bOK && bFound)
	{
		CString p(sFixedDirPath);
		p += findFileData.cFileName;
		if('.' != findFileData.cFileName[0])	// skip "." and ".."
			bOK = DeleteFile(p);
		bFound = FindNextFile(hFileInfo, &findFileData);
	}

	if (pbDeletedAllFiles)
			*pbDeletedAllFiles = TRUE;	//// jdh 3/14/2000  added this because under NT we are able to delete the files but not always the dir
	if(bOK)
	{
		return RemoveDirectory(lpszDirPath); // jdh 3/14/2000 this always fails with Windows NT on a dir we created this run

	}
	return bOK;
}

// jdh 3/14/2000 changed to throw exception if file is not found
CTime CPathDescriptor::getModifiedTime() const
{
	struct _stat file_stat;
	if(_tstat( getFullPath(), &file_stat ) !=0)
	{
		checkForFileError(getFullPath(), NULL, TRUE, TRUE);
		return CTime();
	}

	return CTime(file_stat.st_mtime);
}

BOOL CPathDescriptor::getModifiedSince(CTime& lastTime) const
{
	CTime modTime = getModifiedTime();
	//LOG4(modTime.Format(), " last=", lastTime.Format(), "\r\n");
//	CString s;
//	s.Format("modified %s  last %s", modTime.Format("%A, %B %d, %Y"), lastTime.Format("%A, %B %d, %Y"));
//	AfxMessageBox(s);
	return modTime > lastTime;
}

CTime getModifiedTime(LPCTSTR lpszPath)
{
	struct _stat file_stat;
	if(_tstat( lpszPath, &file_stat ) !=0)
	{
		checkForFileError(lpszPath);	// should be pretty rare
		return CTime();
	}

	return CTime(file_stat.st_mtime);
}



BOOL CPathDescriptor::copyTo(LPCTSTR lspzToPath, BOOL bFailIfExists)
{
	if(!CopyFile(getFullPath(), lspzToPath, bFailIfExists))
	{
		checkForFileError(getFullPath(), lspzToPath);
		return FALSE;
	}
	return TRUE;
}

// 3/14/2000 jdh added bChangeDescriptor option
// 3/15/2000 jdh fixed bChangeDescriptor option
BOOL CPathDescriptor::moveTo(LPCTSTR lspzToPath, BOOL bFailIfExists, BOOL bChangeDescriptor)
{
#ifdef ORIG
	if(!MoveFileEx(	getFullPath(),
					lspzToPath,
					MOVEFILE_COPY_ALLOWED | (bFailIfExists)?NULL:MOVEFILE_REPLACE_EXISTING
					)	)
#else // ORIG
	if(!MoveFile(getFullPath(), lspzToPath)	)
#endif // ORIG
	{
		checkForFileError(getFullPath(), lspzToPath);
		return FALSE;
	}
	 if(bChangeDescriptor)
		*this = lspzToPath;
	//parsePath();
	return TRUE;

}

CString getParentDirectory(LPCTSTR lpszPathName)
{
  TCHAR drive[_MAX_DRIVE];
   TCHAR dir[_MAX_DIR];
   TCHAR fname[_MAX_FNAME];
   TCHAR ext[_MAX_EXT];

  _tsplitpath( lpszPathName, drive, dir, fname, ext );

	CString s(dir);
	if(s[s.GetLength()-1] == '\\') // the trailing '\' doesn't count
		s = s.Left(s.GetLength()-1); // cut off the trailing '\'

	int i = s.ReverseFind('\\');

	if(i>-1)
		dir[i] = '\0';
	else
		dir[0] = '\0';

	TCHAR path_buffer[_MAX_PATH];
	_tmakepath( path_buffer, drive, dir,  NULL, NULL);
	return path_buffer;
}

// currently can only add the last part of the directory
// i.e.  given d:\a\b\c\      a and b must already exist
BOOL ensureDirExists(LPCTSTR lpszDir)
{
	int error =_tmkdir(lpszDir);
	if(error != 0 && error !=EACCES)
	{	checkForFileError(lpszDir);
		return FALSE;
	}
	return TRUE;
}

IMPLEMENT_SERIAL(CPathDescriptor, CObject, 1);
void CPathDescriptor::Serialize(CArchive &ar)
{
	if (ar.IsStoring())
	{
		CString s = getFullPath();
		ar << s;
		ar << (int)m_bEnabled;
	}
	else
	{
		CString s;
		ar >> s;
		this->operator=(s);
		ar >> m_bEnabled;
		parsePath();
	}
}



// give the best string we can in the given amount of chars
CString CPathDescriptor::getDisplayPath(int nMaxChars)
{
	int nFullLen = GetLength();
	int nNameLen = getFileFullName().GetLength();
	CString s;

	if(nFullLen <= nMaxChars)
		return getFullPath();

	if(nNameLen>= nMaxChars)	// big file name
	{
		//favor the beginning of the file name
		// this commented out version adds the ellipses at the end to.  the other
		// version, which is better until I get dynamic re-figuring based on
		// column resizing, lets the list ctrl do the ellipsing on the right edge
		//s.Format( "...%s...", getFileFullName().Left(nMaxChars-6));
		s.Format( _T("...%s"), getFileFullName().Left(nMaxChars-3));
		return s;
	}

	int nDir = (nMaxChars-nNameLen) - 3; // 3 for ellipses
	s.Format(_T("...%s%s"), m_sDirectory.Right(nDir), getFileFullName());
	return s;
}

BOOL CPathDescriptor::IsEmpty() const
{
	return CString::IsEmpty();
}


// used to encode the enabled/disabled state when serializing to a standard format file
void CPathDescriptor::stringSerialize(CString &s, BOOL bStoring)
{
	if(bStoring)
	{
		if(m_bEnabled)
			s = getFullPath();
		else
		{
			s = _T("~");
			s += getFullPath();
		}
	}
	else
	{
		if(s[0] == '~')
		{
			*this = s.Right(s.GetLength()-1);
			m_bEnabled = FALSE;
		}
		else
		{
			*this = s;
			m_bEnabled = TRUE;

		}


	}
}

// Function name	: CPathDescArray::findPtr
// Description	    : Finds this pointer in the list.  Ignores its contents.
// Return type		: int: the index of this item, -1 if not found
// Argument         : CPathDescriptor *pD
// Created by	    : John Hatton
// Created on      :  12/2/98 9:04:55 AM
int CPathDescArray::findPtr(CPathDescriptor *pD)
{
	for(int i=0; i<GetSize(); i++)
	{
		if (pD == ElementAt(i))
			return i;
	}
	return -1; // not found
}

BOOL CPathDescArray::removePtr(CPathDescriptor *pD)
{
	int n = findPtr(pD);
	if(n == -1)
		return FALSE;
	RemoveAt(n, 0);
	return TRUE;
}


// Function name	: CPathDescriptor::findPath
// Description	    : Searches for a path with a matching, well, path
// Return type		: int
// Input Argument   : CPathDescriptor *pInFind
// Created by	    : John Hatton
// Created on      :  12/2/98 9:13:56 AM
int CPathDescArray::findPath(CPathDescriptor *pInFind)
{
	CString sFind = pInFind->getFullPath();
	for(int i=0; i<GetSize(); i++)
	{
		if (ElementAt(i)->getFullPath() == sFind)
			return i;
	}
	return -1; // not found
}

#ifndef hab217
BOOL CPathDescriptor::fileIsReadOnly(void)
{
  DWORD dwResult = GetFileAttributes(getFullPath());
  if (dwResult == 0xFFFFFFFF)
	{
	  checkForFileError(getFullPath(), _T(""));
	  return FALSE;
	}
  if (dwResult & FILE_ATTRIBUTE_READONLY)
	return TRUE;

  return FALSE;
}

BOOL CPathDescriptor::forceFileWritable(void)
{
  LPCTSTR lpszPath = getFullPath();
  if (!fileIsReadOnly())
	return TRUE;		// nothing to do

  DWORD dwResult = GetFileAttributes(lpszPath);
  DWORD dwReadOnlyMask = FILE_ATTRIBUTE_READONLY ^ 0xFFFFFFFF;
  dwResult &= dwReadOnlyMask;	// turn off read only attribute
  if (!SetFileAttributes(lpszPath, dwResult))
	{
	  checkForFileError(lpszPath, _T(""));
	  return FALSE;
	}
  return TRUE;
}
#endif //hab217

//jdh 3/14/2000
CPathDescArray::~CPathDescArray()
{
	if(m_bOwning)
		DeleteAndRemoveAll();
}


//jdh 3/14/2000
BOOL CPathDescArray::getAnyModifiedSince(CTime t) const
{
	for(int i=0; i<GetSize(); i++)
	{
#ifndef hab215
			if (GetAt(i)->m_bEnabled   &&
			GetAt(i)->fileExists() &&
			GetAt(i)->getModifiedSince(t))
				return TRUE;
#else //hab215
		if (GetAt(i)->getModifiedSince(t))
			return TRUE;
#endif // hab215
	}
	return FALSE;
}

//jdh 3/14/2000
BOOL CPathDescArray::getAnyDontExist() const
{
	for(int i=0; i<GetSize(); i++)
	{
		if (!GetAt(i)->fileExists())	// could use fileExistsAndIsClosed()
			return TRUE;
	}
	return FALSE;

}

void CPathDescArray::DeleteAndRemoveAll()
{
	ASSERTX(m_bOwning);// should call this otherwise
	for(int i=0; i< GetSize(); i++)
		delete operator[](i);

	RemoveAll();
}
