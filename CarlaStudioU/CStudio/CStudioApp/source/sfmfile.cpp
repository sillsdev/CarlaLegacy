#include "stdafx.h"
#include "SFMFile.h"
#include "ParseStream.h"
#include <mbstring.h>
#include <strstrea.h>
#define fin m_stream

#ifdef sfmFile_NO_LOGWINDOW
#define LOG(x) NULL
#define LOG2(x, y) NULL
#else
#include "logwindow.h"
#endif

// caller should follow this construction with a check of isOpen()

SFMFile::SFMFile(LPCSTR lpszPathName, char cCommentChar, BOOL bForWriting)
:	m_forWriting(bForWriting),
	m_stream(lpszPathName, ios::in | ios::nocreate),
	m_bNothingLogged(TRUE),
	m_cCommentChar(cCommentChar),
	m_bDidOutputSkippedCommentNotice(FALSE)
{
	USES_CONVERSION;
	m_pathName = A2CT(lpszPathName); // used when reporting errors
}

// bDisabled is ignored on input; on return, it is false if a "\dis" was found
// at the beginning of the line.
// bEnabled can be null where it isn't relevant
BOOL SFMFile::getField(CString& marker, CString& contents, BOOL *bEnabled)
{
	ASSERTX(fin.is_open());
	const int kBuffSize = 5000;	// CURRENTLY MAX FIELD SIZE TOO!

	// suck up and thow away lines at the beginning of the file that start
	// with the comment character
	if( fin.peek() == m_cCommentChar)
	{
#ifndef rde270
		// these files are not wide characters... therefore CString won't be that helpful
		LPSTR sLeadingComments = (LPSTR)alloca(kBuffSize+2);
		LPSTR x = sLeadingComments;
		LPSTR xStart = x;
#else   // rde270
		CString sLeadingComments;
		LPTSTR x = sLeadingComments.GetBuffer(kBuffSize+2);
		LPTSTR xStart = x;
#endif  // rde270
		do
		{
			fin.getline(x, kBuffSize - (x-xStart), '\n');
			x += fin.gcount();
			if(fin.gcount())
			{
				*(x-1) = '\n'; // put a carriage return in place of the null terminator
				*x = '\0';		// null terminate in case the next getline fails
			}
		} while (fin.good() && fin.gcount() && fin.peek() != '\\');

#ifndef rde270
#else   // rde270
		sLeadingComments.ReleaseBuffer();
#endif  // rde270
	}


#ifndef rde270
	LPSTR sField = (LPSTR)alloca(kBuffSize+2);
	LPSTR buff = sField;
	LPSTR start_buff = buff;
#else   // rde270
	CString sField;
	//LPTSTR start_buff = sField.GetBuffer(kBuffSize+2);
	//LPTSTR buff = start_buff;
	LPTSTR buff = sField.GetBuffer(kBuffSize+2);
	LPTSTR start_buff = buff;
#endif  // rde270

	fin.eatwhite();
	LPSTR b = buff;

	do
	{
		fin.getline(b, kBuffSize - (b-buff), '\n');
		b += fin.gcount();
		if(fin.gcount())
		{
			*(b-1) = '\n'; // put a carriage return in place of the null terminator
			*b = '\0';		// null terminate in case the next getline fails
		}

		//strlen(buff);

	} while (fin.good() && fin.gcount() && fin.peek() != '\\');



	if( (kBuffSize-1) <= (b-buff))	// to long (and thus fin.gcount() == 0)
	{
		CString s;
		s.Format(_T("The file %s appears to have a line which is longer than the maximum of %d characters which Carla Studio can handle.\n"),
					(LPCTSTR)m_pathName, kBuffSize);
		throw(s);

	}

	if(!buff[0])	// end of file
	{
#ifndef rde270
#else
		sField.ReleaseBuffer(-1);
#endif
		return FALSE;
	}

	if(bEnabled)
	{
		*bEnabled = (strncmp(buff, "\\dis", 4) != 0); // if the first marker is '\dis', the rule is disabled
		if(!*bEnabled)
		{
			buff +=4;	// skip the \dis
		}
	}

	// eat white space before the SFM Code (will always be there after a \dis)
	while(*buff && _ismbcspace(*buff))
	{
		*buff='~'; // a hack so that iSpaceLoc, below, isn't set to the space between the "\dis" and marker
		++buff;
	}

	// say we had \dis sr blah, now we want \sr blah
	//  but don't do anything if \dis \sr foo
	if(bEnabled && !*bEnabled && *buff != '\\')
	{
		--buff;
		*buff= '\\';
	}

	BOOL bHaveEnvironment = FALSE;
	if(buff[0] == '/' || (buff[0] == '+' && buff[1] == '/') || /*sentrans*/(buff[0] == '&' && buff[1] == '/'))
	{
		bHaveEnvironment = TRUE;
	}

	USES_CONVERSION_U8;
	// some lines may begin with \dis and be followed by an environment
	// these must be treated special
	if(!bHaveEnvironment && buff[0] != '\\'
		&& bEnabled && *bEnabled)	// can't expect a \ if we started with a \dis
	{	//ASSERTX(FALSE);	//  line didn't have backslash as first non-whitespace char
		static CString sRest;

#ifndef rde270
		sRest = U82CT(start_buff);
#else   // rde270
		sRest = start_buff;
		sField.ReleaseBuffer(-1);
#endif  // rde270

		ostrstream sout;
		sout << "Carla Studio encountered a serious problem while trying to read\n   " << T2CA(m_pathName) << '\n';
		sout << "It was expecting to find an SFM marker, but found instead:\n";
		sout <<  start_buff << '\n';

		// to do: add line number?
#ifndef rde270
		// I'm just not sure if sout.str is going to be null terminated, so do it the long way.
		int nLen = sout.pcount();
		char* pSout = (char*)alloca(nLen + 1);
		strncpy(pSout, sout.str(), nLen);
		pSout[nLen] = '\0';
		CString sError(U82CT(pSout));
#else   // rde270
		CString sError (sout.str(), sout.pcount());
#endif// rde270
		sout.rdbuf()->freeze(0); // else get a memory leak
		throw(sError);
	}


	int iSpaceLoc ;
	if(bHaveEnvironment)
		iSpaceLoc = (buff-start_buff)-1;
	else
	{
		// figure out where the marker ends and field contents begin
#ifndef rde270
		LPSTR lpsz = strpbrk(sField, " \t\n");
		iSpaceLoc = (lpsz == NULL) ? -1 : (int)(lpsz - sField);
#else
		iSpaceLoc = sField.FindOneOf(" \t\n");
#endif
		if(iSpaceLoc <= 1)// [0] should be the slash, [1] at least one char
		{
#ifndef rde270
#else
			sField.ReleaseBuffer(-1);
#endif
			return FALSE;
		}
	}

	if(bHaveEnvironment)
		marker = _T("ENV");
	else
	{
		start_buff[iSpaceLoc] = '\0';
#ifndef rde270
		marker = U82CT(buff + 1); // +1 to skip the slash
#else
		marker = buff + 1; // +1 to skip the slash
#endif
		marker.TrimRight();
	}

#ifndef rde270
	contents = U82CT(start_buff + iSpaceLoc+1);
#else
	contents = start_buff + iSpaceLoc+1;
#endif

	contents.TrimLeft();
	contents.TrimRight();

#ifndef rde270
#else
	sField.ReleaseBuffer(-1);
#endif
	return TRUE;
}

// TO DO: implement the commented out section below, which hasn't been tested,
// AND add a way to get the new location back out.
BOOL SFMFile::ensureOpen(LPCTSTR sDesciption, BOOL doLogIfMissing, BOOL doDialogIfMissing)
{
	if(isOpen())
		return TRUE;

	if(doLogIfMissing || doDialogIfMissing)
	{
		CString s(_T("Couldn't open the "));
		s += sDesciption;
		s += _T(" at:");
		s += m_pathName;
		s += _T("\r\n");
		if(doLogIfMissing)
			LOG(s);
		if(doDialogIfMissing)
			AfxMessageBox(s);
	}
	return FALSE;
}

// TODO: add line number to output
void SFMFile::logSkip(LPCTSTR lpszParserName,
								LPCTSTR lpszMarker,
								LPCTSTR lpszField,
								LPCTSTR lpszMoreInfo)
{
	USES_CONVERSION_U8;
	ostrstream sout;
	if(m_bNothingLogged)
	{
		m_bNothingLogged=FALSE;
		sout << "The following possible problem(s) occurred while parsing the file " << T2CA(m_pathName) << "\r\n";
	}

	sout << "   The CStudio parser " << T2CA(lpszParserName) << " did not recognize this line: \\";
	sout << T2CA(lpszMarker) << " " << T2CA(lpszField) << "\r\n";
	if(lpszMoreInfo)
		sout << "    " << T2CU8(lpszMoreInfo) <<  "\r\n";
	// to do: add line number?
#ifndef rde270
	// I'm just not sure if sout.str is going to be null terminated, so do it the long way.
	int nLen = sout.pcount();
	char* pSout = (char*)alloca(nLen + 1);
	strncpy(pSout, sout.str(), nLen);
	pSout[nLen] = '\0';
	CString sError(U82CT(pSout));
#else   // rde270
	CString sError (sout.str(), sout.pcount());
#endif  // rde270
	sout.rdbuf()->freeze(0); // else get a memory leak
	LOG(sError);
}



// TODO: add line number to output
void SFMFile::logParseFailure(LPCTSTR lpszParserName,
								LPCTSTR lpszMarker,
								LPCTSTR lpszField,
								LPCTSTR lpszMoreInfo)
{
	USES_CONVERSION_U8;
	ostrstream sout;

	if(m_bNothingLogged)
	{
		m_bNothingLogged=FALSE;
		sout << "The following possible problem(s) occurred while parsing the file " << T2CA(m_pathName) << "\r\n";
	}

	sout << "The parser " << T2CA(lpszParserName) << " cannot understand ";
	sout << "\r\n\\" << T2CA(lpszMarker) << " " << T2CA(lpszField) << "\r\n";
	if(lpszMoreInfo)
		sout << T2CU8(lpszMoreInfo) << "\r\n";
	// to do: add line number?
#ifndef rde270
	// I'm just not sure if sout.str is going to be null terminated, so do it the long way.
	int nLen = sout.pcount();
	char* pSout = (char*)alloca(nLen + 1);
	strncpy(pSout, sout.str(), nLen);
	pSout[nLen] = '\0';
	CString sError(U82CT(pSout));
#else   // rde270
	CString sError (sout.str(), sout.pcount());
#endif  // rde270
	sout.rdbuf()->freeze(0); // else get a memory leak
	LOG2(sError,_T(""));
}

// TODO: add line number to output
void SFMFile::throwParseFailure(LPCTSTR lpszParserName,
								LPCTSTR lpszMarker,
								LPCTSTR lpszField,
								LPCTSTR lpszMoreInfo)
{
	USES_CONVERSION_U8;
	ostrstream sout;

	sout << "The parser " << T2CA(lpszParserName) << " cannot understand ";
	sout << "\n\\" << T2CA(lpszMarker) << " " << T2CA(lpszField) << '\n';
	if(lpszMoreInfo)
		sout << T2CU8(lpszMoreInfo) << '\n';
	sout << "File: " << T2CA(m_pathName) << '\n';
	// to do: add line number?
#ifndef rde270
	// I'm just not sure if sout.str is going to be null terminated, so do it the long way.
	int nLen = sout.pcount();
	char* pSout = (char*)alloca(nLen + 1);
	strncpy(pSout, sout.str(), nLen);
	pSout[nLen] = '\0';
	CString sError(U82CT(pSout));
#else   // rde270
	CString sError (sout.str(), sout.pcount());
#endif  // rde270
	sout.rdbuf()->freeze(0); // else get a memory leak
	throw(sError);
}

// global; doesn't really belong with SFMFile, which is input only

void outputWindowPlacement(ostream& fout, CWnd* pWnd)
{
	WINDOWPLACEMENT wp;
	ASSERTX(pWnd);
	pWnd->GetWindowPlacement(&wp);
	fout << '$';
	fout << wp.rcNormalPosition.left << " ";
	fout << wp.rcNormalPosition.right << " ";
	fout << wp.rcNormalPosition.top << " ";
	fout << wp.rcNormalPosition.bottom << ' ';
	fout << wp.ptMinPosition.x << ' ';
	fout << wp.ptMinPosition.y << ' ';
	fout << wp.showCmd << '\n';
}


void SFMFile::logCommentSkip(LPCTSTR lpszField, LPCTSTR lpszMoreInfo)
{
	USES_CONVERSION_U8;
	ostrstream sout;
	if(m_bNothingLogged)
	{
		m_bNothingLogged=FALSE;
		sout << "The following possible problem(s) occurred while parsing the file " << T2CA(m_pathName) << "\r\n";
	}

	if(!m_bDidOutputSkippedCommentNotice)
	{
		m_bDidOutputSkippedCommentNotice = TRUE;
		sout << "Sorry, CarlaStudio did not know where to locate one or more comments.\r\n";
		sout << "You will need to copy these 'skipped comments' and paste them where you want them.\r\n";
	}
	sout << "Skipped comment: \"" << T2CU8(lpszField) << "\"\r\n";
	if(lpszMoreInfo)
				sout << "    " << T2CU8(lpszMoreInfo) <<  "\r\n";
	// to do: add line number?
	sout << "\r\n";
#ifndef rde270
	// I'm just not sure if sout.str is going to be null terminated, so do it the long way.
	int nLen = sout.pcount();
	char* pSout = (char*)alloca(nLen + 1);
	strncpy(pSout, sout.str(), nLen);
	pSout[nLen] = '\0';
	CString sError(U82CT(pSout));
#else   // rde270
	CString sError (sout.str(), sout.pcount());
#endif  // rde270
	sout.rdbuf()->freeze(0); // else get a memory leak
	LOG(sError);
}
