// 02-Dec-1999 hab Removed Ctrl-Ms at end of lines (why were they even there??)

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

	#define THROW_STR_IF_NOT(b, str)  if(!(b))	throw CString(str)

#include <afxcoll.h>

class CParseStream : public CObject
{
public:
	BOOL getChar(char& c);
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
	BOOL swallow(const char* sMatch);
	BOOL swallow(char cMatch);
	BOOL environment(CString& sEnv, CString& sComment, BOOL& bEnabled);
	void eatWhiteSpace(BOOL bCurrentLineOnly = FALSE);
	BOOL word(CString& sWord, BOOL bRemoveQuotes);
	BOOL getQuotedString(CString& sWord);
	BOOL integer(int* pInt);
	BOOL getLong(long* pLong);
	BOOL getWindowPlacement(CWnd* pWnd);
	BOOL upTo(CString& sResult, char cUpTo1, char cUpTo2=0,
		char cUpTo3=0, char cUpTo4=0,
		LPCTSTR lpszUpTo5=0);

	BOOL toEndOfLine(CString& sResult, BOOL bStopAtCommentChar = FALSE);

	CParseStream(const char* pszBuffer, char cCommentChar='|');
	~CParseStream();

	BOOL atEnd() {return *m_index== '\0';}

protected:
	char m_cCommentChar;
	//void massageRestOfString();
	char* m_buff;
	char* m_index;
};

// global
CString getNRStringFromNString(const CString& sStr);
CString getNStringFromNRString(const CString& sStr);
