// PhraseParser.h: interface for the CPhraseParser class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_PHRASEPARSER_H__30061626_5AEA_495B_913D_A4828CB1B6A8__INCLUDED_)
#define AFX_PHRASEPARSER_H__30061626_5AEA_495B_913D_A4828CB1B6A8__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CAmpleDLLProcess;
class CProcessStatus;
class CCarlaLanguage;

class CPhraseParser
{
public:
	CPhraseParser();
	virtual ~CPhraseParser();
	BOOL m_bManualRefreshPending;
	BOOL m_bDidRefresh;
	CString parseString(CString sPhrase, BOOL bTrace, CString sTraceWords, BOOL bForceRefresh=FALSE);
	CString CPhraseParser::parseFile(CString sInputPath, CString sOutputPath, BOOL bForceRefresh) ;

	void setLanguage(CCarlaLanguage* pSrcLang);
protected:
	CCarlaLanguage* m_pSourceLang;
	void prepareAmpleProcess();
	void loadAmpleOptions(BOOL bTrace, CString sTraceMorphs);
	BOOL preprocessDicts(CProcessStatus* pStatus);
	BOOL getNeedDictPreprocessing(CProcessStatus& status);

	CTime m_lastPreprocessTime;
	CAmpleDLLProcess* m_pAmpleProcess;
};

#endif // !defined(AFX_PHRASEPARSER_H__30061626_5AEA_495B_913D_A4828CB1B6A8__INCLUDED_)
