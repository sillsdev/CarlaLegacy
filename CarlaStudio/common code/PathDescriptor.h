// 2.1.2 14-Mar-2000 jdh Various additions to support using dictionary preprocessors w/ quickparse
// 2.1.7 12-Apr-2000 hab Added fileIsReadOnly() and forceFileWritable() functions

#ifndef __CPATHDESCRIPTOR
#define  __CPATHDESCRIPTOR
#pragma once

#include <afxtempl.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#ifndef ASSERTX
#define ASSERTX ASSERT
#endif

class CPathDescriptor : public CObject, public CString	//CObject for serialization
{
	DECLARE_SERIAL(CPathDescriptor);
	public:
		void stringSerialize(CString& s, BOOL bStoring);
		BOOL IsEmpty() const;
		CString getDisplayPath(int nMaxChars);
		virtual void Serialize(CArchive& ar);
		BOOL m_bEnabled;
		BOOL moveTo(LPCTSTR lpszPath, BOOL bFailIfExists, BOOL bChangeDescriptor=FALSE);
		BOOL copyTo(LPCTSTR lspzToPath, BOOL bFailIfExists=FALSE);
		void set(CPathDescriptor& path, LPCTSTR lpszExt);
		CString getShortPath() const;
		CPathDescriptor();
		CPathDescriptor(LPCTSTR lpszPath);
		CString getFullPath() const {return *this;}
		CString getDirectory() const {ASSERTX(m_sDirectory.GetLength()); return m_sDirectory;}
		CString getFileName() const {ASSERTX(m_sFileName.GetLength()); return m_sFileName;}
		CString getFileExtension() const {ASSERTX(m_sFileExtension.GetLength()); return m_sFileExtension;}
		CString getFileFullName() const {return getFileName()+getFileExtension();}
		CString getQuotedPath() const {CString s; s.Format("\"%s\"", getFullPath()); return s;}
		CString operator=(CString& s) { CString::operator=(s); parsePath(); return s;}
		LPCTSTR operator=(LPCTSTR lpszpath) { CString::operator=(lpszpath); parsePath(); return lpszpath;}
		CPathDescriptor& operator=(const CPathDescriptor& pd) { operator=(pd.getFullPath()); return *this;}
		operator LPCTSTR() const {return getFullPath();}
		BOOL fileExists() const;
		BOOL fileExistsAndIsClosed() const;
		void deleteFile();
		BOOL getModifiedSince(CTime& lastTime) const;
		CTime getModifiedTime() const;
#ifndef hab217
		BOOL fileIsReadOnly(void);
		BOOL forceFileWritable(void);
#endif // hab217
	protected:
		void parsePath();
		CString m_sDirectory;
		CString m_sFileName;
		CString m_sFileExtension;

};
#include <iostream.h>
ostream& operator<<(ostream& sout, CPathDescriptor& pd);

//typedef CTypedPtrArray<CPtrArray, CPathDescriptor*> CPathDescArray;
class CPathDescArray : public CTypedPtrArray<CPtrArray, CPathDescriptor*>
{
	public:
		void DeleteAndRemoveAll();
		BOOL getAnyDontExist() const;
		CPathDescArray(BOOL bOwning = FALSE):m_bOwning(bOwning){}	// if owning, will delete members when destructed
		~CPathDescArray();	// jdh 3/14/2000
		BOOL removePtr(CPathDescriptor *pD);
		int findPtr(CPathDescriptor* pD);
		int findPath(CPathDescriptor *pInFind);
		BOOL getAnyModifiedSince(CTime t) const;

		BOOL m_bOwning;
};

void fixDirectory(CString& dir);
DWORD checkForSystemError(LPCTSTR lpszDetails=NULL);
DWORD checkForFileError(LPCTSTR lpszPath,  LPCTSTR lpszPath2=NULL, BOOL bIgnoreERROR_ALREADY_EXISTS = TRUE, BOOL bExceptionInsteadOfDialog=FALSE);
BOOL nukeDirectory(LPCTSTR lpszDirPath, BOOL* pbDeletedAllFiles);
CString getDirectory(LPCTSTR lpszPathName);
CString getFullFileName(LPCTSTR lpszPathName);
CString getFileName(LPCTSTR lpszPathName);
CTime getModifiedTime(LPCTSTR lpszPath);
CString getParentDirectory(LPCTSTR lpszPathName);
BOOL ensureDirExists(LPCTSTR lpszDir);
#endif
