// ProcessOutput.cpp
//
//////////////////////////////////////////////////////////////////////
// rde270 18-Jun-02 Changed around StreamIn to use 'AsyncLoadRichEditCtrl' instead, so much
//  of this code is obsoleted. Added member for tracking the new 'loading' icons to show
//  the RichEdit controls are being loaded asynchronously.
// 2.1.0 07-Mar-2000 hab added "STRING_CHECK" as a possible error indicator
//	 23-May-2000 jdh added getFileSize for pre-TRACE check
//	20sept2000 jdh added sentrans' "ALLOCATE MEMORY" as a possible error indicator

//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "CARLAStudioApp.h"
#include "ProcessOutput.h"
#include <strstrea.h>
#include <fstream.h>
#include "carlalanguage.h"
#include "sfmfile.h"
#include "cwprocess.h"
#include "logwindow.h"
#include "textdisplayinfo.h"

IMPLEMENT_DYNAMIC(CResultStreamFile, CResultStream);
CResultStreamFile::CResultStreamFile(
					CResultStreamDescriptor* pDescriptor,
					LPCTSTR lpszPath,
					CCarlaLanguage *pLang, int eTabIcon/*=kNoIcon*/)
:	CResultStream(pDescriptor, pLang, eTabIcon),
	m_sPath(lpszPath),
	m_hFile(0)
#ifndef rde270
	// no longer using m_editStream stuff, but I did add the 'waiting icons'
	, m_eTabLoadingIcon(kLoadingIcon1)
{
#else   // rde270
{
	m_editStream.dwCookie = (DWORD)this;
	m_editStream.pfnCallback = NULL;	// should be set later
#endif  // rde270
}

#ifndef rde270
// This functionality is now in AsyncLoadRichEdit.cpp/h
#else   // rde270
EDITSTREAM CResultStreamFile::getEditStreamIn()
{
	m_editStream.pfnCallback = CResultStreamFile::EditStreamInCallback;

	m_hFile = CreateFile(m_sPath,           // open MYFILE.TXT
				GENERIC_READ,              // open for reading
				FILE_SHARE_READ,           // share for reading
				NULL,                      // no security
				OPEN_EXISTING,             // existing file only
				FILE_ATTRIBUTE_NORMAL,     // normal file
				NULL);

	if(m_hFile == INVALID_HANDLE_VALUE)
	{
		checkForFileError(m_sPath, FALSE);
	}

	//TRACE("Stream %s Opened\n", m_sPath);
	return m_editStream;
}
// lpszPath may be different than m_sPath if the caller is doing a "safe" write to a temporary file
EDITSTREAM CResultStreamFile::getEditStreamOut(LPCTSTR lpszPath)
{
	m_editStream.pfnCallback = CResultStreamFile::EditStreamOutCallback;

	m_hFile = CreateFile(lpszPath,           // open MYFILE.TXT
				GENERIC_WRITE,              // open for reading
				FILE_SHARE_WRITE,           // share for reading
				NULL,                      // no security
				CREATE_ALWAYS,             // existing file only
				FILE_ATTRIBUTE_NORMAL,     // normal file
				NULL);

	if(m_hFile == INVALID_HANDLE_VALUE)
	{
		checkForFileError(lpszPath, FALSE);
	}

	//TRACE("Stream %s getEditStreamOut\n", lpszPath);
	return m_editStream;
}

DWORD CALLBACK CResultStreamFile::EditStreamInCallback(
	DWORD dwCookie,
	LPBYTE pbBuff, LONG cb, LONG FAR *pcb)
{
/*dwCookie

Value of the dwCookie member of the EDITSTREAM structure.

pbBuff Pointer to the buffer to read from or write to.

cb Count of bytes to read or write.

pcb Pointer to a variable that receives the number of bytes actually read or written.
*/
	CResultStreamFile* self = (CResultStreamFile*)dwCookie;
	if(INVALID_HANDLE_VALUE == self->m_hFile)	// error situation, user should have been notified alread
		return 1;

	ASSERTX(self->m_hFile);

	// Attempt a synchronous read operation.
	unsigned long lNumRead;

	BOOL bResult = ReadFile(self->m_hFile, pbBuff, cb, &lNumRead, NULL) ;

	*pcb = lNumRead;
	ASSERTX( *pcb >= 0); // check this conversion from unsigned long to long
	// Check for end of file.

//	TRACE("Stream %s Read %ld Bytes\n", self->m_sPath, lNumRead);

	if (!bResult)
	{
		// we got an error or
		CloseHandle(self->m_hFile);
		checkForFileError(self->m_sPath);
		TRACE(_T("****Stream %s Had Error, was Closed\n"), self->m_sPath);
		return 1;
	}
	if(!lNumRead)
	{
		BOOL bClosed =  CloseHandle(self->m_hFile);
		if(bClosed)
		;//TRACE(_T("Stream %s Closed\n"), self->m_sPath);
		else
		{
			checkForFileError(self->m_sPath);
		}
	}
	if( self->m_eTabIcon == kUnknownStatus )	// we'll only check files that were initially created with unknown status, instead of kNoIcon
	{
		//jdh 20sept2000 added sentrans' "ALLOCATE MEMORY"
		LPTSTR errorStrings[] = {_T("error"), _T("Error"), _T("Expected"), _T("Undefined"), _T("Cannot"), _T("Empty"), _T("WARNING"), _T("MORPH_CHECK"), _T("in entry:"), _T("STRING_CHECK"), _T("ALLOCATE MEMORY")};
		CString s((LPCTSTR)pbBuff, lNumRead);
		for(int i = 0; i<11; i++)
		{
			if(s.Find(errorStrings[i])>-1)	//pbBuff isn't zero terminated, I think, which is why I'm doing this slower way
		//if(_tcsstr(pbBuff, _T("Error")) >0)
			{
				self->m_eTabIcon=kErrorIcon;
				break;
			}
		}
	}

	return 0; // continue
}

// unlike EditStreamInCallback, for this one the caller must explicitly
// close the document when it is done writing
DWORD CALLBACK CResultStreamFile::EditStreamOutCallback(
	DWORD dwCookie,
	LPBYTE pbBuff, LONG cb, LONG FAR *pcb)
{
/*dwCookie

Value of the dwCookie member of the EDITSTREAM structure.

pbBuff Pointer to the buffer to read from or write to.

cb Count of bytes to read or write.

pcb Pointer to a variable that receives the number of bytes actually read or written.
*/
 CResultStreamFile* self = (CResultStreamFile*)dwCookie;
 if(INVALID_HANDLE_VALUE == self->m_hFile)	// error situation, user should have been notified alread
	 return 1;

	ASSERTX(self->m_hFile);

	unsigned long lNumWritten;

  BOOL bResult = WriteFile(self->m_hFile, pbBuff, cb, &lNumWritten, NULL) ;

	*pcb = lNumWritten;
	ASSERTX( *pcb >= 0); // check this conversion from unsigned long to long
	// Check for end of file.

//	TRACE("Stream %s Wrote %ld Bytes\n", self->m_sPath, lNumWritten);

	if (!bResult)
	{
		// we got an error or
		CloseHandle(self->m_hFile);
		checkForFileError(self->m_sPath);
		TRACE(_T("****Stream %s Had Error, was Closed (EditStreamOutCallback)\n"), self->m_sPath);
		return 1;
	}
	return 0; // continue
}
#endif  // rde270

#ifndef rde270
BOOL CResultStreamFile::IsError(LPCTSTR szBuff)
{
	BOOL bResult = (m_eTabIcon == kErrorIcon);  // check from previous round

	if( m_eTabIcon == kUnknownStatus )	// we'll only check files that were initially created with unknown status, instead of kNoIcon
	{
		//jdh 20sept2000 added sentrans' "ALLOCATE MEMORY"
		LPTSTR errorStrings[] = {_T("error"), _T("Error"), _T("Expected"), _T("Undefined"), _T("Cannot"), _T("Empty"), _T("WARNING"), _T("MORPH_CHECK"), _T("in entry:"), _T("STRING_CHECK"), _T("ALLOCATE MEMORY")};
		CString s(szBuff);
		for(int i = 0; !bResult && (i < 11); i++)
		{
			if( s.Find( errorStrings[i] ) > -1 )
			{
				m_eTabIcon = kErrorIcon;
				bResult = true;
			}
		}
	}

	return bResult;
}
#endif  // rde270

CResultStream::~CResultStream()
{
	if(m_pDescriptor)
		delete m_pDescriptor;
}
IMPLEMENT_DYNAMIC(CResultStreamDescriptor, CObject);


 // a null language means use the default font (example: log outpus won't have a lang)
CFont* CResultStream::getFont()
{
	if(m_pLang)
		return m_pLang->getFont();
	else	//
	{
		// don't forget that this fromHandle business only gives you a temporary font
		CFont* pDefaultFont = CFont::FromHandle( (HFONT) GetStockObject(ANSI_FIXED_FONT));
		ASSERTX(pDefaultFont);
		return pDefaultFont;
		//Font::FromHandle( (HFONT) GetStockObject(SYSTEM_FONT));
	}
}


IMPLEMENT_DYNAMIC(CResultStream, CObject);
void CResultStream::setLang(CCarlaLanguage* pLang)
{
	ASSERTX(pLang);
	m_pLang = pLang;
}



bool operator==(CResultStreamDescriptor& a, CResultStreamDescriptor&b)
{
	return (	a.m_sProcessID == b.m_sProcessID
			&& a.m_sShortDescription == b.m_sShortDescription);
}

CString CResultStreamDescriptor::getTabLabel() const
{
	if(m_sTabLabel.GetLength())
		return m_sTabLabel;
	else
		return getShortDescription();
}

bool CResultStreamDescriptor::operator=(const CResultStreamDescriptor&b)
{
	m_sProcessID = b.m_sProcessID;
	m_sShortDescription = b.m_sShortDescription;
	m_sLongDescription = b.m_sLongDescription;
	m_sTabLabel = b.m_sTabLabel;
	m_bShow = b.m_bShow;

	return TRUE;
}

//	friend
ostream& operator <<( ostream& fout, const CResultStreamDescriptor& rRSD )
{
	USES_CONVERSION_U8;
	fout << "\\" << T2CU8(CResultStreamDescriptor::getBeginMarker()) << "\n";
	fout << "\\ProcessID " << T2CU8(rRSD.m_sProcessID) << '\n';
	fout << "\\ShortDescription " << T2CU8(rRSD.m_sShortDescription) << '\n'; // assuming one-line only
	fout << "\\LongDescription " << T2CU8(rRSD.m_sLongDescription) << '\n'; // assuming one-line only
	// notice that tablabel isn't saved, because it can contain run-dependent info

	outputBool(fout, "DoShow", rRSD.m_bShow);
	fout << "\\" << T2CU8(CResultStreamDescriptor::getEndMarker())<< '\n';
	return fout;
}

CResultStreamDescriptor::CResultStreamDescriptor()
:m_bShow(TRUE)
{

}

CResultStreamDescriptor::CResultStreamDescriptor(SFMFile* f)
:m_bShow(TRUE)
{
	// notice that tablabel isn't saved or read,
	// because it can contain run-dependent info

	CString sMarker, sField;
	while(f->getField(sMarker, sField))
	{
		if(sMarker==getEndMarker())
			break;
		else if (sMarker == _T("ProcessID"))
			m_sProcessID = sField;
		else if (sMarker == _T("ShortDescription"))
			m_sShortDescription = sField;
		else if (sMarker == _T("LongDescription"))
			m_sLongDescription = sField;
		else checkAndReadBool("DoShow", m_bShow)
		else f->logSkip(_T("CResultStreamDescriptor"), sMarker, sField);
	}
}

CString CResultStreamDescriptor::getListDisplayString()
{
	CString s;
	s.Format(_T("%s"), (LPCTSTR)m_sShortDescription);
	return s;
}


CString CResultStreamDescriptor::getDetailsText()
{
	CString s;
	s.Format(_T("Generated by: %s\r\nDescription: %s"), (LPCTSTR)getProcessDisplayName(), (LPCTSTR)m_sLongDescription);
	return s;

}

// THIS FILE CAN'T GO IN THE LIBRARY BECUASE THEN THE FOLLOWING
// PREPROCESSING TRICK WON'T WORK.

CString CResultStreamDescriptor::getProcessDisplayName()
{
// processor dlls can't call any CCarlaStudioApp functions, and
// they don't need to use this method
#ifndef _WINDLL
	if(m_sProcessID == _T("FILE"))
		return _T("File");

	CProcessTemplate* pT = ((CCarlaStudioApp*)AfxGetApp())->findTemplateFromID(m_sProcessID);
	USES_CONVERSION;
	if(!pT)
		return _T("Absent Processor");	// didn't show up when the app looked around for processors
	else
		return pT->getDisplayName();
#else
	ASSERTX(FALSE);
	return _T("DLL ERROR in CResultStreamDescriptor::getProcessDisplayName()");
#endif
}

CResultStreamDescriptor::CResultStreamDescriptor(CProcess* pProducer,
								LPCTSTR sShortDesc,
								LPCTSTR sLongDescription, //=NULL,
								LPCTSTR sTabLabel//=NULL
								)
:	m_sShortDescription(sShortDesc),
	m_sLongDescription(sLongDescription),
	m_sTabLabel(sTabLabel),
	m_bShow(TRUE)
{
	USES_CONVERSION;
	if(pProducer)	// will be null for files straight off the disk
		m_sProcessID = A2CT(pProducer->getProcessorID());
	else
		m_sProcessID = _T("FILE");
}

// simple constructor for log streams
CResultStreamDescriptor::CResultStreamDescriptor(CProcess * pProducer)
:	m_sLongDescription(_T("Log of this process; read it for status and diagnostics.")),
	m_bShow(TRUE)
{
	USES_CONVERSION;
	m_sShortDescription = *(A2CT(pProducer->getDisplayName())) + _T(" Log");

	m_sProcessID = A2CT(pProducer->getProcessorID());
	m_sShortDescription = A2CT(pProducer->getDisplayName());
	m_sTabLabel.Format(_T("%s Log"), (LPCTSTR)m_sShortDescription);
	m_sShortDescription+= _T(" Log");
}


// this is overridden by CResultStreamFile to point the user to the actual file
CString CResultStream::getOverflowMsg()
{
	return _T("\r\n---Warning: this text is too long to show completely.");
}

CString CResultStreamFile::getOverflowMsg()
{
		CString s;;
		s = _T("\r\n-----This file is too long to show completely.  To open the file with another application, do this:  From the Document menu, choose \"Open currently selected file\"");
		return s;
}

BOOL CResultStreamFile::openExternally()
{
#ifndef rde270
	// in NT-Unicode (or maybe I'm wrong, but I can't find out another way to do this), it
	//  tries to open a new instance of the app that handles these files. So, if this is
	//  a filetype that is opened by CS, then, trap that and send it immediately to
	//  ID_FILE_OPEN_Document
#pragma message("What other file types is CS the default application for besides *.ana???")
	if( m_sPath.Right(4) == _T(".ana") )
	{
		return (AfxGetApp()->OpenDocumentFile(m_sPath) != 0);
	}
#endif  // rde270

	HINSTANCE res = ShellExecute(AfxGetMainWnd( )->m_hWnd,	// handle to parent window
				_T("open"),
				m_sPath,
				NULL,
				NULL,
				SW_SHOWNORMAL);

	if((DWORD)res == 0x1f )
	{
		CString s;
		s.Format(_T("Windows doesn't know what application to use for files of type \"%s\"."), (LPCTSTR)m_sPath.Right(3));
		s+= _T(" Instructions on what you should do now available from the Win95 help system.  Under the Win95 Start button, choose \"Help\". In its index, lookup \"file types, associating with programs\"");
		AfxMessageBox(s);
	}
	else if((DWORD)res <32)
		checkForFileError(m_sPath);

	return ((DWORD)res >= 32);
}


// Must be called after a richedit::STREAMOUT(getEditStreamOUT()) to close the stream,
// since RICHEDIT doesn't tell our callback function to close anything
void CResultStreamFile::closeOutFile()
{
	ASSERTX(m_hFile);
	BOOL bClosed =  CloseHandle(m_hFile);

	if(bClosed)
		;//TRACE(_T("Stream %s Closed\n"), m_sPath);
	else
	{
		checkForFileError(m_sPath);
	}
}

int CResultStream::getTabIconEnum() const
{
	return m_eTabIcon;
}

const CTextDisplayInfo* CResultStream::getDisplayInfo() const
{
	return m_pLang->getDisplayInfo();
}

CString CResultStream::getToolTipText()
{
	return _T("");
}

CString CResultStreamFile::getToolTipText()
{
	return m_sPath;
}

//jdh may/24/2000
long CResultStreamFile::getFileSize()
{
	HANDLE hFile = CreateFile(m_sPath,           // open MYFILE.TXT
				GENERIC_READ,              // open for reading
				FILE_SHARE_READ,           // share for reading
				NULL,                      // no security
				OPEN_EXISTING,             // existing file only
				FILE_ATTRIBUTE_NORMAL,     // normal file
				NULL);

	if(hFile == INVALID_HANDLE_VALUE)
	{
		checkForFileError(m_sPath, FALSE);
		return 0;
	}

	long n = GetFileSize(hFile, NULL);

	BOOL bClosed =  CloseHandle(hFile);

	if(bClosed)
		return n;
	else
	{
		checkForFileError(m_sPath);
		return 0;
	}
}
