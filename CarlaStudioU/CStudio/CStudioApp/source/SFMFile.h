// SFMFile.h: header file
//

/////////////////////////////////////////////////////////////////////////////

//#ifndef __AFXTEMPL_H__
//#include <afxtempl.h>
//#endif

//#include <afxcoll.h>
#pragma once

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#include <fstream.h>

#define MSG2(X, Y) { CString sError(X);\
				sError+=(Y);\
				AfxMessageBox(sError);}

#define THROWSTRING2(X, Y) { CString sError(X);\
				sError+=(Y);\
				throw(sError);}

#define THROWSTRING3(X, Y, Z) { CString sError(X);\
				sError+=(Y);\
				sError+=(Z);\
				throw(sError);}

#define outputBool(SOUT,MARKER,VALUE) SOUT<<"\\"<<MARKER<<" "<<(VALUE?1:0)<<"\n";
#define outputChar(SOUT,MARKER,VALUE) SOUT<<"\\"<<MARKER<<" "<< (char)VALUE <<"\n";
#define outputStr(SOUT,MARKER,VALUE) SOUT<<"\\"<<MARKER<<" "<< T2CU8(VALUE) <<"\n";
#define outputInt(SOUT,MARKER,VALUE) SOUT<<"\\"<<MARKER<<" "<<VALUE<<"\n";

// notice that there is no space or \n after the output item
#define ifTrueOutputItem(SOUT,VALUE,ITEM) if(VALUE) SOUT<<ITEM;


#define checkAndReadBool(MARKER,MEMBER)	if (sMarker == MARKER)\
										{	MEMBER = (sField == _T("1"));}

#define checkAndReadChar(MARKER,MEMBER)	if (sMarker == MARKER)\
										{	MEMBER = sField[0];}

#define checkAndReadString(MARKER,MEMBER)	if (sMarker == MARKER)\
										{	MEMBER = sField;}


#define checkAndReadInt(MARKER,MEMBER)	if (sMarker == MARKER)\
										{	MEMBER = _ttoi(sField);}

//===========================================
class SFMFile : public CObject
{
public:
	bool m_bDidOutputSkippedCommentNotice;
	void logCommentSkip(LPCTSTR lpszField, LPCTSTR lpszMoreInfo= NULL);
	void logSkip(LPCTSTR lpszParserName, LPCTSTR lpszMarker, LPCTSTR lpszField, LPCTSTR lpszMoreInfo = NULL);
	void logParseFailure(LPCTSTR lpszParserName, LPCTSTR lpszMarker, LPCTSTR lpszField, LPCTSTR lpszMoreInfo = NULL);
	void throwParseFailure(LPCTSTR lpszParserName, LPCTSTR lpszMarker, LPCTSTR lpszField, LPCTSTR lpszMoreInfo = NULL);
	BOOL ensureOpen(LPCTSTR sDesciption, BOOL doLogIfMissing=TRUE, BOOL doDialogIfMissing=FALSE);
	SFMFile(LPCSTR lpszPathName, char cCommentChar, BOOL bForWriting = FALSE);
//	virtual ~SFMFile();

	BOOL getField(CString& marker, CString& contents,
					BOOL *bEnabled=NULL);
	BOOL isOpen() {return m_stream.is_open();}
	CString m_pathName;
protected:
	BOOL m_forWriting;
	fstream m_stream;
	BOOL m_bNothingLogged;
	char m_cCommentChar;
};

// global
void outputWindowPlacement(ostream& fout, CWnd* pWnd);
