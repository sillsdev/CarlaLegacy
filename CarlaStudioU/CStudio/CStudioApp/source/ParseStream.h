// rde270 18-Jun-02 make throw define type safe so we don't screwup the char/TCHAR deals
// 02-Dec-1999 hab Removed Ctrl-Ms at end of lines (why were they even there??)

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#ifndef rde270
// make this type safe so we don't screwup the char/TCHAR deals
inline void THROW_STR_IF_NOT(BOOL b, LPCTSTR str)
{
	if( !b )
		throw CString(str);
}
#else   // rde270
	#define THROW_STR_IF_NOT(b, str)  if(!(b))	throw CString(str)
#endif  // rde270

#include <afxcoll.h>

class CParseStream : public CObject
{
public:
	BOOL getChar(TCHAR& c);
	BOOL getItemFlexible(CString & sString);
	BOOL readSGMLEndTag(LPCTSTR lpszTag);
	BOOL readSGMLParam(CString& name, CString& value);
	BOOL readSGMLTag(LPCTSTR lpszTag, CMapStringToString& map);
	BOOL atDisabledEnv();
	BOOL peek(CString& s);
	void assertAtEnd();
	BOOL toEndCollectComments(CString& sStr, CString& sComments);
	BOOL endOfLineComment(CString& sComment, BOOL bCurrentLineOnly=FALSE);
	BOOL toEnd(CString& s);
	BOOL swallow(LPCTSTR sMatch);
	BOOL swallow(TCHAR cMatch);
	BOOL environment(CString& sEnv, CString& sComment, BOOL& bEnabled);
	void eatWhiteSpace(BOOL bCurrentLineOnly = FALSE);
	BOOL word(CString& sWord, BOOL bRemoveQuotes);
	BOOL getQuotedString(CString& sWord);
	BOOL integer(int* pInt);
	BOOL getLong(long* pLong);
	BOOL getWindowPlacement(CWnd* pWnd);
	BOOL upTo(CString& sResult, TCHAR cUpTo1, TCHAR cUpTo2=0,
		TCHAR cUpTo3=0, TCHAR cUpTo4=0,
		LPCTSTR lpszUpTo5=0);

	BOOL toEndOfLine(CString& sResult, BOOL bStopAtCommentChar = FALSE);

	CParseStream(LPCTSTR pszBuffer, char cCommentChar='|');
	~CParseStream();

	BOOL atEnd() {return *m_index== '\0';}

protected:
	char m_cCommentChar;
	//void massageRestOfString();
	LPTSTR m_buff;
	LPTSTR m_index;
};

// global
CString getNRStringFromNString(const CString& sStr);
CString getNStringFromNRString(const CString& sStr);
