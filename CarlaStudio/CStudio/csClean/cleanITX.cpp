#include "stdafx.h"
#include "cleanitx.h"
#include "SFMFile.h"
#include <mbstring.h>

BOOL static getField(ifstream& fin, CString& marker, CString& contents)
{
	static BOOL bNextLineIsBlank=FALSE;
	if(bNextLineIsBlank)
	{
		bNextLineIsBlank=FALSE;
		marker = "BLANKLINE";
		contents ="";
		return TRUE;
	}

	ASSERTX(fin.is_open());

	const int kBuffSize = 5000;	// CURRENTLY MAX FIELD SIZE TOO!

	CString sField;
	LPTSTR buff = sField.GetBuffer(kBuffSize+2);
	LPTSTR start_buff = buff;

	fin.eatwhite();
	char* b = buff;
	BOOL bFoundBlank = FALSE;
	do
	{
		fin.getline(b, kBuffSize - (b-buff), '\n');
		b += fin.gcount();
		if(fin.gcount())
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
	} while (!bFoundBlank && fin.good() && fin.gcount() && fin.peek() != '\\');

	bNextLineIsBlank = bFoundBlank; // will be used on the next call

	if( (kBuffSize-1) <= (b-buff))	// to long (and thus fin.gcount() == 0)
	{
		CString s;
		s.Format("The interlinear file appears to have a line which is longer than the maximum of %d characters which csCleanITX can handle.\n",
					kBuffSize);
		throw(s);

	}

	if(!buff[0])	// end of file
	{	sField.ReleaseBuffer(-1);
		return FALSE;
	}

	// eat white space before the SFM Code (will always be there after a \dis)
	while(*buff && _ismbcspace(*buff))
	{
		*buff='~'; // a hack so that iSpaceLoc, below, isn't set to the space between the "\dis" and marker
		++buff;
	}


	int iSpaceLoc ;
	// figure out where the marker ends and field contents begin
	iSpaceLoc = sField.FindOneOf(" \t\n");
	if(iSpaceLoc <= 1)// [0] should be the slash, [1] at least one char
	{	sField.ReleaseBuffer(-1);
		return FALSE;
	}


	start_buff[iSpaceLoc] = '\0';
	marker = buff + 1; // +1 to skip the slash
	marker.TrimRight();

	contents = start_buff + iSpaceLoc+1;
	contents.TrimLeft();
	contents.TrimRight();

	sField.ReleaseBuffer(-1);
	return TRUE;
}

static void outputAccumulated(ostream& fout, CString &sAccumulate)
{
	if(!sAccumulate.IsEmpty())
	{
		// strip extra whitespace

		sAccumulate.TrimLeft();// remove leading whitespace
		const char* b = LPCTSTR(sAccumulate);
		char* buff = new char[sAccumulate.GetLength()+1];
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
	}
	sAccumulate="";
}
static void reportError(LPCTSTR lpszError)
{
	throw(lpszError);
}

//exceptions: LPCTSTR error

void cleanITX(ostream& fout, LPCTSTR lpszPath, LPCTSTR lpszTextMarker, CStringArray& stripFields)
{
//	for(int i=0; i< stripFields.GetSize(); i++)
//		fout << "strip \\" << LPCTSTR(stripFields[i]) << '\n';

	SFMFile f(lpszPath, NULL);

	if(!f.isOpen())
		reportError("File not found\n");

	CString sMarker, sField;

	BOOL bEnabled;
	BOOL bFirst=TRUE;
	CString sAccumulate;
	while(f.getField(sMarker, sField, &bEnabled))
	{
		BOOL bHandled = FALSE;
		if(sMarker == lpszTextMarker)
		{
			bHandled = TRUE;
			sAccumulate += ' ' + sField;
		}
		for(int i=0; i< stripFields.GetSize(); i++)
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
			fout << '\\'<<sMarker ;
			if(!sField.IsEmpty()) // don't want to insert an empty space here if there is no following field; that makes the eventual accumulated text start with an extra space
				fout <<' '<<sField; // can't include the \n at the end in case we have to put the accumulated text here
		}
	}

	outputAccumulated(fout, sAccumulate);
	return;
}

// this version strips everything from the word line to the next blank line
void cleanITXBlanks(ostream& fout, LPCTSTR lpszPath, LPCTSTR lpszTextMarker)
{
//	for(int i=0; i< stripFields.GetSize(); i++)
//		fout << "strip \\" << LPCTSTR(stripFields[i]) << '\n';

	ifstream fin(lpszPath);
	if(!fin.is_open())
		reportError("File not found\n");

	CString sMarker, sField;

	BOOL bFirst=TRUE;
	CString sAccumulate;
	BOOL bHaveTextLine = FALSE;
	BOOL bBlankLinePending = FALSE;
	while(getField(fin, sMarker, sField))
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
			fout << "\n\\"<<sMarker<<' '<<sField; // no return yet incase the text wants to accumulate on this
			bBlankLinePending = FALSE;
			bHaveTextLine = FALSE;
		}
		else if(!bHaveTextLine)	// just output fields found before the text line
		{
			if(!bFirst)
				fout << '\n';
			bFirst=FALSE;
			fout << "\\"<<sMarker<<' '<<sField;// no return yet incase the text wants to accumulate on this
		}
		else
		{	// it's a throw-away line
		}
	}

	outputAccumulated(fout, sAccumulate);
	return;
}
