// AmpleDLLWrapper.h: interface for the AmpleDLLWrapper class.
//
//////////////////////////////////////////////////////////////////////
// 1.7a1 07-Dec-1999 hab Added interlinear and stamp dict code table processing
// jdh june 13 2000 added outputStyle option to AmpleOptions so we can get xml output in the file
// 2.3.2 19-Sep-2000 hab Have manual parse apply input text changes to string

#if !defined(AFX_AMPLEDLLWRAPPER_H__FF6E4D21_B522_11D2_864F_0080C88B8417__INCLUDED_)
#define AFX_AMPLEDLLWRAPPER_H__FF6E4D21_B522_11D2_864F_0080C88B8417__INCLUDED_

#include "PathDescriptor.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

extern "C" {

	typedef void* LPAmpleSetup ;
	typedef LPAmpleSetup (CALLBACK * SPECAmpleCreateSetup) (void);
	typedef const char * (/*CALLBACK*/ * SPECAmpleDeleteSetup)(LPAmpleSetup pSetup_io);

	typedef const char * (/*CALLBACK*/ * SPECAmpleLoadControlFiles)(
						   LPAmpleSetup pSetup_io,
						   const char * pszAnalysisDataFile_in,
							const char * pszDictCodeTable_in,
							const char * pszDictOrthoChangeTable_in,
							const char * pszTextInputControlFile_in);

	typedef const char * (/*CALLBACK*/ * SPECAmpleLoadDictionary)(
											   LPAmpleSetup pSetup_io,
												const char *pszFilePath_in,
												const char* pszDictType);

	typedef const char * (/*CALLBACK*/ * SPECAmpleParseFile)(	LPAmpleSetup pSetup_io,
													const char *pszInFilePath_in,
													const char *pszOutFilePath_in);

	typedef const char * (/*CALLBACK*/ * SPECAmpleParseText)(	LPAmpleSetup pSetup_io,
													const char *pszInputText_in);

#ifndef hab218
	typedef const char * (/*CALLBACK*/ * SPECAmpleGetAllAllomorphs)(
						  LPAmpleSetup pSetup_io,
									  const char *pszRestOfWord_in,
						  const char *pszState_in);
#endif

#ifndef hab232
	typedef const char * (/*CALLBACK*/ * SPECAmpleApplyInputChangesToWord)(
						  LPAmpleSetup pSetup_io,
									  const char *pszWord_in);
#endif

	typedef const char * (/*CALLBACK*/ * SPECAmpleSetParameter)(
							LPAmpleSetup pSetup_io,
							const char * pszName_in,
							const char * pszValue_in);

	typedef const char * (/*CALLBACK*/ * SPECAmpleAddSelectiveAnalysisMorphs)(LPAmpleSetup pSetup_io,
																	const char * pszMorphs_in);
	typedef const char * (/*CALLBACK*/ * SPECAmpleRemoveSelectiveAnalysisMorphs)(LPAmpleSetup pSetup_io);
	typedef const char * (/*CALLBACK*/ * SPECAmpleReset)(LPAmpleSetup pSetup_io);

	typedef const char * (/*CALLBACK*/ * SPECAmpleReportVersion)(	LPAmpleSetup pSetup_io);
	/* hab 1999.06.25 */
  typedef const char * (/*CALLBACK*/ * SPECAmpleInitializeMorphChecking)(	LPAmpleSetup pSetup_io);
  typedef const char * (/*CALLBACK*/ * SPECAmpleCheckMorphReferences)(	LPAmpleSetup pSetup_io);
	/* hab 1999.06.25 */
}

class CModelFilesSet;
class CCarlaLanguage;
class CProcessStatus;

class CAmpleOptions
{
public:
	CAmpleOptions();
	~CAmpleOptions();

	CPathDescriptor m_pathXMLOutputPath; 	//jdh 13june2000
	CString m_sOutputStyle;			//jdh 13june2000
	int m_iMaxMorphnameLength;
	BOOL m_bOutputRootGlosses;
	BOOL m_bReportAmbiguityPercentages;
	BOOL m_bCheckMorphnames;
	BOOL m_bPrintTestParseTrees;
	BOOL m_bWriteDecompField;
#ifndef hab17a1
	BOOL m_bWritePField;	// what's p?  hab: it's property, John.
#else
	BOOL m_bWritePField;	// what's p?
#endif // hab17a1
	BOOL m_bWriteWordField;

	BOOL m_bTrace;
	CString m_sTraceMorphs;
};

class CAmpleDLLWrapper
{
public:
	BOOL m_bLastRunHadErrors;
	CString parseString(CString& sInput, BOOL bCheckForErrors);
#ifndef hab218
	CString getAllAllomorphs(CString& sInput, CString& sState, BOOL bCheckForErrors);
#endif
#ifndef hab232
	CString applyInputChanges(CString& sInput);
#endif
	CString parseFile(CPathDescriptor& input, CPathDescriptor& output, BOOL bCheckForErrors);
	CAmpleDLLWrapper(const CCarlaLanguage* pLang);
	virtual ~CAmpleDLLWrapper();

	void create();
	LPAmpleSetup getSetup();
	void setLogFile(LPCTSTR lpszPath=NULL);
	void setOptions(CAmpleOptions* pOptions);//int iMaxMorphnameLength, BOOL bTrace, CString sTraceMorphs);
	void updateExternals(CProcessStatus& status);
	BOOL getDictFilesNeedUpdate(CProcessStatus& status);
#ifndef hab17a1
	BOOL getControlFilesNeedUpdate(CProcessStatus& status);
#else // hab17a1
	BOOL getControlFilesNeedUpdate();
#endif // hab17a1


	CTime m_lastDictUpdate;
	CTime m_lastControlFileUpdate;

	SPECAmpleParseFile	m_pfAmpleParseFile;
	SPECAmpleParseText	m_pfAmpleParseText;
#ifndef hab218
	SPECAmpleGetAllAllomorphs	m_pfAmpleGetAllAllomorphs;
#endif
#ifndef hab232
	SPECAmpleApplyInputChangesToWord m_pfAmpleApplyInputChangesToWord;
#endif
	SPECAmpleSetParameter m_pfAmpleSetParameter;
	SPECAmpleAddSelectiveAnalysisMorphs m_pfAmpleAddSelectiveAnalysisMorphs;
	SPECAmpleRemoveSelectiveAnalysisMorphs m_pfAmpleRemoveSelectiveAnalysisMorphs;

	BOOL m_bPreviousOutputRootGlosses;

protected:
	void checkLogForErrors();
	CAmpleOptions* m_pOptions;
	//CString m_sTraceMorphs;
	//BOOL m_bTrace;
	//int m_iMaxMorphnameLength;
	void setOptions();
	SPECAmpleReset m_pfAmpleReset;
	SPECAmpleLoadControlFiles	m_pfAmpleLoadControlFiles;
	SPECAmpleLoadDictionary	m_pfAmpleLoadDictionary;
	SPECAmpleCreateSetup m_pfAmpleCreateSetup;
	SPECAmpleDeleteSetup m_pfAmpleDeleteSetup;
	SPECAmpleReportVersion m_pfAmpleReportVersion;
  /* hab 1999.06.25 */
	SPECAmpleInitializeMorphChecking m_pfAmpleInitializeMorphChecking;
	SPECAmpleCheckMorphReferences m_pfAmpleCheckMorphReferences;
  /* hab 1999.06.25 */

	HINSTANCE m_hAmpleLib;
	LPAmpleSetup m_pSetup;
	const CCarlaLanguage* m_pLang;
	void throwIfError(CString & sResult);
	CPathDescriptor m_sLogPath;
	 CModelFilesSet* m_pMFS;
	void removeSetup();
};

#endif // !defined(AFX_AMPLEDLLWRAPPER_H__FF6E4D21_B522_11D2_864F_0080C88B8417__INCLUDED_)
