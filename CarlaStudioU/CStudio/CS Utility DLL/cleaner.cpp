// CSUtilDLL.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"

#include <mbstring.h>
#include <fstream.h>
#include "Cleaner.h"

#ifndef rde270
#include <malloc.h>
#include "AFXPRIV.H"
#include "CSConv.h"
#endif  // rde270

// This is the constructor of a class that has been exported.
// see CSUtilDLL.h for the class definition
CSCleaner::CSCleaner()
{
	return;
}

//bOneLinePerField: if TRUE, then lines without a marker will be returned as "NOMARKER"
//					else, lines will be combined with the previous marker
BOOL CSCleaner::getField(ifstream& fin, CString& marker, CString& contents, BOOL bOneLinePerField)
{
	static BOOL bNextLineIsBlank=FALSE;
	if(bNextLineIsBlank)
	{
		bNextLineIsBlank=FALSE;
		marker = _T("BLANKLINE");
		contents =_T("");
		return TRUE;
	}

	ASSERT(fin.is_open());

	const int kBuffSize = 5000;	// CURRENTLY MAX FIELD SIZE TOO!

#ifndef rde270
	char*   sField = (char*)alloca(kBuffSize+2);
	LPSTR buff = sField;
	LPSTR start_buff = buff;
#else
	CString sField;
	LPTSTR buff = sField.GetBuffer(kBuffSize+2);
	LPTSTR start_buff = buff;
#endif  // rde270

	fin.eatwhite();
	char* b = buff;
	BOOL bFoundBlank = FALSE;
	int iLastCount=0;
	do
	{
		fin.getline(b, kBuffSize - (b-buff), '\n');
		iLastCount = fin.gcount();	// the peeks below make gcount go to zero, we have to save this
		b += iLastCount;
		if(iLastCount)
		{
			*(b-1) = '\n'; // put a carriage return in place of the null terminator
			*b = '\0';		// null terminate in case the next getline fails
		}
		while(fin.peek() == '\n') // keep swallowing blank lines until we see what's at the end of them
		{
			fin.get(); // swallow the \n;
			if(fin.peek() == '\\')	 // if the blanks are followed by a record, then this constitutes a true blank line
			{
				bFoundBlank=TRUE;
				break;
			}
		}
		//TRACE("buff=%s\ngood %d gcount %d peek %c\n", start_buff, fin.good(), fin.gcount(), fin.peek() );
	} while (!bOneLinePerField &&	// don't get any more lines if this option is on
			!bFoundBlank && fin.good() && iLastCount && fin.peek() != '\\');

	bNextLineIsBlank = bFoundBlank; // will be used on the next call

	if( (kBuffSize-1) <= (b-buff))	// to long (and thus fin.gcount() == 0)
	{
		CString s;
		s.Format(_T("The interlinear file appears to have a line which is longer than the maximum of %d characters which csCleanITX can handle.\n"),
					kBuffSize);
		throw(s);

	}

	if(!buff[0])	// end of file
	{
#ifndef rde270
#else
		sField.ReleaseBuffer(-1);
#endif  // rde270
		return FALSE;
	}

	// eat white space before the SFM Code (will always be there after a \dis)
	while(*buff && _ismbcspace(*buff))
	{
		*buff='~'; // a hack so that iSpaceLoc, below, isn't set to the space between the "\dis" and marker
		++buff;
	}


	// handle case where there is no marker  March 23, 1999
	if(bOneLinePerField && *start_buff != '\\')
	{
		marker = _T("NOMARKER");
		contents = buff;
#ifndef rde270
#else
		sField.ReleaseBuffer(-1);
#endif
		return TRUE;
	}

	int iSpaceLoc ;
	// figure out where the marker ends and field contents begin
#ifndef rde270
	LPSTR lpsz = strpbrk(sField, " \t\n");
	iSpaceLoc = (lpsz == NULL) ? -1 : (int)(lpsz - sField);
	if(iSpaceLoc <= 1)// [0] should be the slash, [1] at least one char
	{
		return FALSE;
	}
#else
	iSpaceLoc = sField.FindOneOf(" \t\n");
	if(iSpaceLoc <= 1)// [0] should be the slash, [1] at least one char
	{	sField.ReleaseBuffer(-1);
		return FALSE;
	}
#endif

	start_buff[iSpaceLoc] = '\0';
	marker = buff + 1; // +1 to skip the slash
	marker.TrimRight();

	contents = start_buff + iSpaceLoc+1;
	contents.TrimLeft();
	contents.TrimRight();

#ifndef rde270
#else   // rde270
	sField.ReleaseBuffer(-1);
#endif
	return TRUE;
}

void CSCleaner::outputAccumulated(ostream& fout, CString &sAccumulate)
{
	if(!sAccumulate.IsEmpty())
	{
		// strip extra whitespace

		sAccumulate.TrimLeft();// remove leading whitespace
#ifndef rde270
		USES_CONVERSION_U8;
		LPCSTR b = T2CU8(sAccumulate);
		LPSTR buff = (LPSTR)alloca(strlen(b) + 1);
#else
		const char* b = LPCTSTR(sAccumulate);
		char* buff = new char[sAccumulate.GetLength()+1];
#endif
		char* c = buff;
		while(*b)
		{
			if(*b == '_') // inserted by joincomp
				*(c++) = ' ';

			else if(! (::iswspace(*b) && ::iswspace(*(b+1))))
			{
				*c = *b;
				++c;
			}
			++b;
		}
		*c='\0';

		// replace with preceding marker (i.e. \v )
		//fout <<'\\'<<lpszPrecedingMarker<<' '<<buff<<'\n';
		fout <<' '<<buff<<'\n';
		delete buff;
	}
	sAccumulate="";
}
void CSCleaner::reportError(LPCTSTR lpszError)
{
	throw(lpszError);
}

//exceptions: LPCTSTR error

// This version of the algorithm just leaves the word line alone
// and strips the analysis lines.  It leaves all unrecognized lines alone.  This one packs
void CSCleaner::stripITXAnalysis(ostream& fout, LPCTSTR lpszPath, LPCTSTR lpszTextMarker, CStringArray& stripFields)
{
#ifndef rde270
	USES_CONVERSION;
	ifstream fin(T2CA(lpszPath));
#else
	ifstream fin(lpszPath);
#endif
	if(!fin.is_open())
		reportError(_T("File not found\n"));

	CString sMarker, sField;

	BOOL bFirst=TRUE;
	CString sAccumulate;
	while(getField(fin, sMarker, sField, FALSE /* get til the next marker, even if multiple lines*/))
	{
		BOOL bHandled = FALSE;
		if(sMarker == _T("BLANKLINE"))
		{
			bHandled = TRUE;
		}
		else for(int i=0; i< stripFields.GetSize(); i++)
		{
			if(sMarker == stripFields[i])
			{
				bHandled = TRUE;
				break;
			}
		}
		// notice that both the lpszTextMarker and all unrecognized markers are handled here
		if(!bHandled)
		{
			outputAccumulated(fout, sAccumulate);
			if(bFirst)
			{
				bFirst=FALSE;
			}
			else
				fout << '\n';
			fout << '\\'<< T2CA(sMarker);
			if(!sField.IsEmpty()) // don't want to insert an empty space here if there is no following field; that makes the eventual accumulated text start with an extra space
				fout <<' '<< T2CA(sField); // can't include the \n at the end in case we have to put the accumulated text here
		}
	}

	outputAccumulated(fout, sAccumulate);
	return;
}

// deletes every line that only has the lpszMarker (and no text on the line)
// this is useful since give this text:
//			\word In the begining
//	Intergen will put out
//			\word				<------- this is the line we want to remove
//			\word In the begining
//  This is a problem even if we use a different marker goind into Ample vs out of intergen:
//			\specialParseField In the begining
//	Intergen will put out
//			\specialParseField	<------- this is the line we want to remove
//			\word In the begining
// DOESN'T MAKE A BACKUP OF THE INPUT.  REPLACES IT
void CSCleaner::stripLeftOverMarker(LPCTSTR lpszPath, LPCTSTR lpszMarker)
{
	if(lpszMarker[0] == '\\') // we don't want the leading slash
		++lpszMarker;

	USES_CONVERSION;
	ifstream fin(T2CA(lpszPath));
	if(!fin.is_open())
		reportError(_T("File not found\n"));

	CString sMarker, sField;

	//::GetTempPath(MAX_PATH, lpszTempDir);
	TCHAR lpszTemp[MAX_PATH];

	GetTempFileName(_T("."), _T("STP"), 0, lpszTemp);
	ofstream fout(T2CA(lpszTemp));
	while(getField(fin, sMarker, sField, FALSE))
	{
		if(sMarker == _T("BLANKLINE"))
			fout << '\n';
		else if(sMarker != lpszMarker || !sField.IsEmpty())
			fout << '\\'<< T2CA(sMarker) <<' '<< T2CA(sField) << '\n';
	}
	fin.close();
	fout.close();
	if(!DeleteFile(lpszPath))
	{
		static CString s;
		s.Format(_T("StripLeftovermarker() could not delete the file %s"), lpszPath);
		reportError(s);
	}

	// can use movefile because it will fail across different volumnes (e.g. c to d)
	if(!MoveFile(lpszTemp, lpszPath))
	{
		static CString s;
		s.Format(_T("StripLeftovermarker() could not move the file %s to %s"), lpszTemp, lpszPath);
		reportError(s);
	}
	DeleteFile(lpszTemp);

}

// this version of the algorithm can get you back to the non-interlinearized state,
// but that then requires that the user tell ample which markers to parse (or which
// not to.  In contrast, the algorithm "stripITXAnalysis" just leaves the word line alone
// and strips the analysis lines.  It leaves all unrecognized lines alone.  This one packs
// all the text on word lines onto the preceding unrecognized marker, whatever it was.

//exceptions: LPCTSTR error

void CSCleaner::cleanITX(ostream& fout, LPCTSTR lpszPath, LPCTSTR lpszTextMarker, CStringArray& stripFields)
{

//	for(int i=0; i< stripFields.GetSize(); i++)
//		fout << "strip \\" << LPCTSTR(stripFields[i]) << '\n';

	USES_CONVERSION;
	ifstream fin(T2CA(lpszPath));
	if(!fin.is_open())
		reportError(_T("File not found\n"));

	CString sMarker, sField;

	BOOL bFirst=TRUE;
	CString sAccumulate;
	while(getField(fin, sMarker, sField, TRUE /* handle orphans seperately*/))
	{
		BOOL bHandled = FALSE;
		if(sMarker == _T("BLANKLINE"))
		{
			bHandled = TRUE;
		}
		else if(sMarker == lpszTextMarker
				|| sMarker == "NOMARKER") // treat material on a line by itself as TEXT
		{
			bHandled = TRUE;
			// jdh 6/8/99 deal with the situation where the very first line we
			// see is the word marker, so that if we just spit it out, then there
			// will be no preceding marker.  So, in the abscense of a marker to attach
			// the text to, I just use the word (text) marker
			if(bFirst)
			{
				bFirst=FALSE;
				fout << '\\' << T2CA(lpszTextMarker);
			}
			sAccumulate += ' ' + sField;
		}
		else for(int i=0; i< stripFields.GetSize(); i++)
		{
			if(sMarker == stripFields[i])
			{
				bHandled = TRUE;
				break;
			}
		}
		if(!bHandled)
		{
			outputAccumulated(fout, sAccumulate);
			if(bFirst)
			{
				bFirst=FALSE;
			}
			else
				fout << '\n';
			fout << '\\'<< T2CA(sMarker);
			if(!sField.IsEmpty()) // don't want to insert an empty space here if there is no following field; that makes the eventual accumulated text start with an extra space
				fout <<' '<< T2CA(sField); // can't include the \n at the end in case we have to put the accumulated text here
		}
	}

	outputAccumulated(fout, sAccumulate);
	return;
}

// this version strips everything from the word line to the next blank line
// !!!!!!!!!!!!!!!!!!!!!!!!!
// this algorithm is dangerous because if the blank is missing,
// it will throw away lines after the last analysis line and before
// the next text line (lines like \ch, \v, etc).
// !!!!!!!!!!!!!!!!!!!!!!!!!
void CSCleaner::cleanITXBlanks(ostream& fout, LPCTSTR lpszPath, LPCTSTR lpszTextMarker)
{
//	for(int i=0; i< stripFields.GetSize(); i++)
//		fout << "strip \\" << LPCTSTR(stripFields[i]) << '\n';

	USES_CONVERSION;
	ifstream fin(T2CA(lpszPath));
	if(!fin.is_open())
		reportError(_T("File not found\n"));

	CString sMarker, sField;

	BOOL bFirst=TRUE;
	CString sAccumulate;
	BOOL bHaveTextLine = FALSE;
	BOOL bBlankLinePending = FALSE;
	while(getField(fin, sMarker, sField, FALSE))
	{
		if(sMarker == lpszTextMarker) // will catch first and any subsequent text lines in the bundle
		{
			bHaveTextLine = TRUE;
			bBlankLinePending = FALSE;
			sAccumulate += ' ' + sField;
		}

		else if(sMarker == "BLANKLINE")
		{
			bBlankLinePending = TRUE;
			// wait to see if the next marker is the text marker or not
			// if it is, we need to keep accumulating. Else, we can output the accumulated text
		}
		else if(bBlankLinePending)
		{
			outputAccumulated(fout, sAccumulate);
			fout << "\n\\"<< T2CA(sMarker) <<' '<< T2CA(sField); // no return yet incase the text wants to accumulate on this
			bBlankLinePending = FALSE;
			bHaveTextLine = FALSE;
		}
		else if(!bHaveTextLine)	// just output fields found before the text line
		{
			if(!bFirst)
				fout << '\n';
			bFirst=FALSE;
			fout << "\\"<< T2CA(sMarker) <<' '<< T2CA(sField);// no return yet incase the text wants to accumulate on this
		}
		else
		{	// it's a throw-away line
		}
	}

	outputAccumulated(fout, sAccumulate);
	return;
}
