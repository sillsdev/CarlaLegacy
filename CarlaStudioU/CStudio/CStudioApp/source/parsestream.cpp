//
// 02-Dec-1999 hab removed ctrl-Ms at the end of every line (why were they there?)
// jdh 25may2000 added handling of properly quoted params to readSGMLParam

#include "stdafx.h"
#include "ParseStream.h"
#include <mbstring.h>

// the const semantics here mean that we promise not to change it,
// but we must cast to non-const since there isn't a LPCTSTR type

CParseStream::CParseStream(LPCTSTR pszBuffer, char cCommentChar) //, BOOL bOwnTheBuffer)
:  m_buff((LPTSTR)pszBuffer), m_cCommentChar(cCommentChar), m_index((LPTSTR)pszBuffer) //,m_bOwnTheBuffer(bOwnTheBuffer)
{
	ASSERTX(m_buff);
}

CParseStream::~CParseStream()
{
//	if (m_buff && m_bOwnTheBuffer)
//		delete m_buff;
}

// bCurrentLineOnly: if true. will not eat a '\n'
void CParseStream::eatWhiteSpace(BOOL bCurrentLineOnly)
{
	if(bCurrentLineOnly)
	{
		while(*m_index && _ismbcspace(*m_index) && (*m_index != '\n'))
			++m_index;

		//if(*m_index == '\n')
		//	++m_index;	// swallow up the return, leaving us at the start of the next line
	}
	else
	{
		while(*m_index && _ismbcspace(*m_index))
			++m_index;
	}
}

BOOL CParseStream::integer(int* pInt)
{
	CString sWord;
	if(!word(sWord, FALSE))
		return FALSE;

	*pInt = _ttoi(sWord);
	return TRUE;
}

BOOL CParseStream::getLong(long* pLong)
{
	CString sWord;
	if(!word(sWord, FALSE))
		return FALSE;

	*pLong = _ttoi(sWord);
	return TRUE;
}
//#include "InputDocView.h"

BOOL CParseStream::getWindowPlacement(CWnd* pWnd)
{
	if(*m_index != '$')	// just something to tell us if there is
		return FALSE;	// no windowplacement next in the file

	m_index++;

	ASSERTX(pWnd);
	static WINDOWPLACEMENT wp;
	pWnd->GetWindowPlacement(&wp);
	getLong(&wp.rcNormalPosition.left);
	getLong(&wp.rcNormalPosition.right);
	getLong(&wp.rcNormalPosition.top);
	getLong(&wp.rcNormalPosition.bottom);

	getLong(&wp.ptMinPosition.x);
	getLong(&wp.ptMinPosition.y);
	integer((int*) &wp.showCmd );

	wp.flags = WPF_SETMINPOSITION;
	return pWnd->SetWindowPlacement(&wp);
}


BOOL CParseStream::getQuotedString(CString& sString)
{
	eatWhiteSpace();
	LPTSTR start = m_index;

	if(!*m_index || *m_index!='"')
		return false;

	++start; // skip the quote
	++m_index;

	while( *m_index && *m_index!='"')
		++m_index;

	if(*m_index=='"')
		++m_index;

	int count = m_index - start;

	//if((m_index-start >= 2) && *(m_index-1)=='"')
	//feb 99 changed to this
	if((m_index-start >= 1) && *(m_index-1)=='"')
		--count;


	sString = CString(start, count); // count could be zero

	//feb 99 changed so that "" will return TRUE //return count>0;
	return TRUE;
}

// will return FALSE if the first char is a comment, but doesn't
//  currently detect something like   hello|this is a comment <--- to do
BOOL CParseStream::word(CString& sWord, BOOL bRemoveQuotes)
{
	int iSkippedQuotes = 0;
	eatWhiteSpace();
	LPTSTR start = m_index;

	// jdh added comment check sept 19 1998
	if(m_index[0] == m_cCommentChar)
	{
		sWord = _T("");
		return false;
	}

	// handle the special (and difficult to without complicating this code)
	// case of " ", as in \ch "#" " "
	if(bRemoveQuotes && m_index[0] == '"'  && m_index[1] == ' '  && m_index[2] == '"')
	{
		m_index+=3;
		sWord = _T(" ");
		return TRUE;
	}

		// don't ever return what looks like an environment constraint
	if(    (*m_index == '/' )
		|| (*m_index=='+' && m_index[1]=='/')
		|| (*m_index=='&' && m_index[1]=='/'))/*sentrans*/
	{
		sWord=_T("");
		return FALSE;
	}

	if(bRemoveQuotes && *m_index=='"')
	{
		++iSkippedQuotes;
		++start;
	}

// seems like the the above moves the start forward, but not m_index;
	while( *m_index && !_ismbcspace(*m_index) && *m_index!= m_cCommentChar)
		++m_index;

	int count = m_index - start;

	if(bRemoveQuotes && (m_index-start >= 1) && *(m_index-1)=='"')
	{
		++iSkippedQuotes;
		--count;
	}

	// notice that iSkippedQuotes==2 means we had matching quotes

	sWord = CString(start, count); // count could be zero
	// if we had a word like "", this should be valid, as an empty string
	return (count>0 || iSkippedQuotes==2);
}

// get a single string environment: /_ blah... foo
// bEnabled is left as-is unless we encounter  |DIS /_blah
BOOL CParseStream::environment(CString& sEnv, CString& sComment, BOOL& bEnabled)
{
	eatWhiteSpace();

	// recognize |DIS as a disabled environment (not put out by CARLAMenu but by this app
	if (atDisabledEnv())
	{
		m_index+=4;	// skip |DIS
		eatWhiteSpace();
		bEnabled = FALSE;
	}

	// next sequence should either be '/' or '+/'
	if(	(*m_index != '/' )
		&& !(m_index[0] == '+' && m_index[1] == '/')
		&& !(m_index[0] == '&' && m_index[1] == '/')) /*sentrans*/
	{
		sEnv = sComment = _T("");
		return FALSE;
	}

	LPTSTR start = m_index;

	// TO DO: Make it handle whatever the character is that turns off tokens (is // = /  ?)
	// Now walk over this environment string, stop when you find another, a comment, or the end

	if((*m_index == '+') || (*m_index == '&'/*sentrans*/))
		++m_index;

	do
	{
		++m_index;
	}
	while(	*m_index
			&& !(m_index[0] == '+' && m_index[1] == '/')
			&& !(m_index[0] == '&' && m_index[1] == '/') 	// sentrans
			&& (*m_index != '/')
			&& (*m_index != m_cCommentChar));

	sEnv = CString(start, m_index-start);
	sEnv.TrimRight();
	endOfLineComment(sComment, TRUE); // grab a comment if it's there
	return TRUE;
}

BOOL CParseStream::swallow(LPCTSTR sMatch)
{
	int len = _tcslen(sMatch);

	eatWhiteSpace();
	if(0==_tcsncmp(sMatch, m_index,  len) )
	{	m_index += len;
		return TRUE;
	}
	else
		return FALSE;
}

BOOL CParseStream::swallow(TCHAR cMatch)
{
	eatWhiteSpace();
	if(m_index[0] == cMatch)
	{	++m_index;
		return TRUE;
	}
	else
		return FALSE;
}

BOOL CParseStream::toEnd(CString& s)
{
	eatWhiteSpace();
	//massageRestOfString();
	s = CString(m_index);
	return TRUE;
}

// note the parameter lpszUpTo5 allows you to specify a string,
//  but it is compared without regard to case
BOOL CParseStream::upTo(CString& sResult, TCHAR cUpTo1, TCHAR cUpTo2, TCHAR cUpTo3, TCHAR cUpTo4, LPCTSTR lpszUpTo5)
{
	eatWhiteSpace(FALSE); // don't want suck up more than one line

	LPTSTR start = m_index;
	int iLen = 0;
	if(lpszUpTo5)
		iLen = _tcslen(lpszUpTo5);

	while( *m_index && *m_index != '\\'
			&& *m_index != cUpTo1 && *m_index != cUpTo2
			&& *m_index != cUpTo3 && *m_index != cUpTo4
			&& (lpszUpTo5?(_tcsnicmp(m_index,lpszUpTo5, iLen) !=0 ):TRUE)
		)
		++m_index;

	int count = m_index - start;


	sResult = CString(start, count); // count could be zero
	sResult.TrimRight();
	return count>0;
}

// if all that is left on the line is a \n, will swallow it but return FALSE
BOOL CParseStream::toEndOfLine(CString& sResult, BOOL bStopAtCommentChar)
{
	eatWhiteSpace(TRUE); // don't want suck up more than one line

	LPTSTR start = m_index;

	while( *m_index && *m_index != '\n' && (!bStopAtCommentChar || (*m_index != m_cCommentChar)))
		++m_index;

	int count = m_index - start;

	if(*m_index == '\n')	// skip the '\n' but don't include it in the count,
			++m_index;	//  so it doesn't get sent as part of the answer

	sResult = CString(start, count); // count could be zero
	sResult.TrimRight();

	return count>0;
}

// bCurrentLineOnly: if TRUE, comment can start on next line
BOOL CParseStream::endOfLineComment(CString& sComment, BOOL bCurrentLineOnly)
{
	eatWhiteSpace(bCurrentLineOnly);	// won't eat a carriage return
	if(*m_index!='\n' && !atDisabledEnv() && swallow(m_cCommentChar))
	{
		toEndOfLine(sComment);
		return TRUE;
	}
	else return FALSE; // no comment found
}

// Any comments found will be appended to sComments
// Always returns TRUE
// Given:   | my
//			a b | name
//			c
//			| is john
// Returns TRUE, with sStr="a b c" and sComments = sComments+"my name is john"
BOOL CParseStream::toEndCollectComments(CString& sStr, CString& sComments)
{
	sStr = _T("");
	CString sOneStr, sOneComment;
	do
	{
		if( endOfLineComment(sOneComment, TRUE))
			sComments += sOneComment;
		else if(toEndOfLine(sOneStr, TRUE))
			sStr += sOneStr + ' '; // space added aug 31 1998

	} while( *m_index);

	sStr.TrimRight();
	return TRUE;
}

// CEdit boxes don't like CR's; they like LFs
/*NOT USEFULE CAUSE WHAT WE NEED TO DO IS CONVERT ALL \N TO \N\R
void CParseStream::massageRestOfString()
{
	LPTSTR b = m_index;
	while(*b)
	{
		if(*b == '\n')
			*b = '\r';
		++b;
	}
}
*/

// This function converts all the CR's in the text to LF-CR combinations,
// which will look right in the CEdit boxes.
CString getNRStringFromNString(const CString& sStr)
{
	int i = (2 * sStr.GetLength()) +1; // 2 * lets us convert a string of CRs to CR/LF
	LPTSTR y = new TCHAR[i];
	LPTSTR start = y;
	LPTSTR x = (LPTSTR) LPCTSTR(sStr);
	while(*x)
	{
		if(*x == '\n')
		{	*y = '\r';
			++y;
			*y = '\n';
		}
		else
			*y = *x;
		++x; ++y;
	}
	*y='\0';

	CString result(start);
	delete start;
	return result;
}

// This function removes the LF the LF-CR combinations,
// in preperation for writing to a text file.
CString getNStringFromNRString(const CString& sStr)
{
	int i = (2 * sStr.GetLength()) +1; // 2 * lets us convert a string of CRs to CR/LF
	LPTSTR y = new TCHAR[i];
	LPTSTR start = y;
	LPTSTR x = (LPTSTR) LPCTSTR(sStr);
	while(*x)
	{
		if(*x == '\r' && *(x+1) == '\n')
		{
			*y = '\n';
			x++; // skip ahead;
		}
		else
			*y = *x;
		++x; ++y;
	}
	*y='\0';

	CString result(start);
	delete start;
	return result;
}

// throws the rest of the buffer, if there is any left
void CParseStream::assertAtEnd()
{
	if(!atEnd())
	{
		static CString sRest;
		sRest = m_index;
		throw(sRest);
	}
}

BOOL CParseStream::peek(CString & s)
{
	ASSERTX(FALSE); // not implemented
	return FALSE;
}

BOOL CParseStream::atDisabledEnv()
{
	eatWhiteSpace();
	return (m_index[0] == m_cCommentChar && m_index[1] == 'D' && m_index[2] == 'I' && m_index[3] == 'S');
}

BOOL CParseStream::readSGMLTag(LPCTSTR lpszTag, CMapStringToString& map)
{

	CString s(_T("<"));
	s+= lpszTag;
	if( !swallow(s))
		return FALSE;

	// now get any parameters   (e.g. id="blah")

	CString sName, sValue;
	BOOL bFound;
	do
	{
		if(swallow('>'))
			return TRUE;
		bFound = readSGMLParam(sName, sValue);
		if (bFound)
			map.SetAt(sName, sValue);
	} while (bFound);

	return FALSE;	// some error in reading a value
}

// jdh 25may2000 added handling of properly quoted params.  Returns without quotes
BOOL CParseStream::readSGMLParam(CString & sName, CString & sValue)
{
	if(! upTo(sName, '='))
		return FALSE;

	swallow('=');
	if(swallow('"')) // jdh 25may2000
	{
		BOOL b = upTo(sValue, '"');
		if(b)
			swallow('"'); // closing quote
		return b;
	}
	else
		return upTo(sValue, '>', ' ');
}

BOOL CParseStream::readSGMLEndTag(LPCTSTR lpszTag)
{
	CString s;
	s.Format(_T("</%s>"), lpszTag);
	return swallow(s);
}

// given --> returns
// "big dog" --> big dog
//	bigdog --> bigdog

BOOL CParseStream::getItemFlexible(CString &sString)
{
	// for now, we don't have a great algorithm, just this hack
	eatWhiteSpace(FALSE); // not just the current line
	if(*m_index == '"')
		return getQuotedString(sString);
	else
		return word(sString, FALSE);
}

BOOL CParseStream::getChar(TCHAR &c)
{
	c = *m_index;
	++m_index;
	return c != '\0';
}
