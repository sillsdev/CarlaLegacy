// PatrParser.h: Definition of the PatrParser class
// Copyright 1999, 2000 by SIL International.  All rights reserved.

#ifndef _PATRPARSER_H_INCLUDED_
#define _PATRPARSER_H_INCLUDED_
#pragma once

#include "resource.h"       // main symbols
#include "patr.h"

#ifndef hab131
extern "C" {
#include "disphead.h"
}
#endif // hab131

///////////////////////////////////////////////////////////////////////////////
// PatrParser

class PatrParser :
	public IDispatchImpl<IPatrParser, &IID_IPatrParser, &LIBID_PATR100Lib>,
	public ISupportErrorInfo,
	public CComObjectRoot,
	public CComCoClass<PatrParser,&CLSID_PatrParser>
{
public:
	PatrParser();
BEGIN_COM_MAP(PatrParser)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(IPatrParser)
	COM_INTERFACE_ENTRY(ISupportErrorInfo)
END_COM_MAP()
//DECLARE_NOT_AGGREGATABLE(PatrParser)
// Remove the comment from the line above if you don't want your object to
// support aggregation.

DECLARE_REGISTRY_RESOURCEID(IDR_PatrParser)
// ISupportsErrorInfo
	STDMETHOD(InterfaceSupportsErrorInfo)(REFIID riid);

public:
// IPatrParser
	STDMETHOD(ParseString)(/*[in]*/ BSTR bstrSentence,
						   /*[out, retval]*/ BSTR * pbstrParse);
	STDMETHOD(ParseFile)(/*[in]*/ BSTR bstrInput, /*[in]*/ BSTR bstrOutput);
	STDMETHOD(LoadGrammarFile)(/*[in]*/ BSTR bstrGrammarFile);
	STDMETHOD(LoadLexiconFile)(/*[in]*/ BSTR bstrLexiconFile,
		/*[in]*/ BOOL fAdd);
	STDMETHOD(Clear)();
	STDMETHOD(OpenLog)(/*[in]*/ BSTR bstrLogFile);
	STDMETHOD(CloseLog)();
	STDMETHOD(get_GrammarFile)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_LexiconFile)(/*[in]*/ long iFile,
		/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_LogFile)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_Unification)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_Unification)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_TreeDisplay)(/*[out, retval]*/ long *pVal);
	STDMETHOD(put_TreeDisplay)(/*[in]*/ long newVal);
#ifndef hab130
	STDMETHOD(get_RootGlossFeature)(/*[out, retval]*/ long *pVal);
	STDMETHOD(put_RootGlossFeature)(/*[in]*/ long newVal);
#endif // hab130
	STDMETHOD(get_Gloss)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_Gloss)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_MaxAmbiguity)(/*[out, retval]*/ long *pVal);
	STDMETHOD(put_MaxAmbiguity)(/*[in]*/ long newVal);
	STDMETHOD(get_CheckCycles)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_CheckCycles)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_CommentChar)(/*[out, retval]*/ long *pVal);
	STDMETHOD(put_CommentChar)(/*[in]*/ long newVal);
	STDMETHOD(get_TimeLimit)(/*[out, retval]*/ long *pVal);
	STDMETHOD(put_TimeLimit)(/*[in]*/ long newVal);
	STDMETHOD(get_TopDownFilter)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_TopDownFilter)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_TrimEmptyFeatures)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_TrimEmptyFeatures)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_DebuggingLevel)(/*[out, retval]*/ long *pVal);
	STDMETHOD(put_DebuggingLevel)(/*[in]*/ long newVal);
	STDMETHOD(get_LexRecordMarker)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_LexRecordMarker)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_LexWordMarker)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_LexWordMarker)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_LexCategoryMarker)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_LexCategoryMarker)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_LexFeaturesMarker)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_LexFeaturesMarker)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_LexGlossMarker)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_LexGlossMarker)(/*[in]*/ BSTR newVal);
#ifndef hab130
	STDMETHOD(get_LexRootGlossMarker)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_LexRootGlossMarker)(/*[in]*/ BSTR newVal);
#endif // hab130
	STDMETHOD(get_TopFeatureOnly)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_TopFeatureOnly)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_DisplayFeatures)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_DisplayFeatures)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_FlatFeatureDisplay)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_FlatFeatureDisplay)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_Failures)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_Failures)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_CodePage)(/*[out, retval]*/ long *pVal);
	STDMETHOD(put_CodePage)(/*[in]*/ long newVal);
	STDMETHOD(DisambiguateAnaFile)(/*[in]*/ BSTR bstrInput,
		/*[in]*/ BSTR bstrOutput);
	STDMETHOD(get_WriteAmpleParses)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_WriteAmpleParses)(/*[in]*/ BOOL newVal);
	STDMETHOD(LoadAnaFile)(/*[in]*/ BSTR bstrAnaFile, /*[in]*/ BOOL fAdd);
	STDMETHOD(ReloadLexicon)();
	STDMETHOD(get_LexiconFileCount)(/*[out, retval]*/ long * pVal);
	STDMETHOD(get_PromoteDefaultAtoms)(/*[out, retval]*/ BOOL * pVal);
	STDMETHOD(put_PromoteDefaultAtoms)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_SentenceFinalPunctuation)(/*[out, retval]*/ BSTR * pVal);
	STDMETHOD(put_SentenceFinalPunctuation)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_AmplePropertyIsFeature)(/*[out, retval]*/ BOOL * pVal);
	STDMETHOD(put_AmplePropertyIsFeature)(/*[in]*/ BOOL newVal);

	// ATL support method (replaces destructor)
	void FinalRelease();

protected:
	PATRMemory m_memory;
	PATRData m_data;
	const char ** m_ppszLexFiles;
	char * m_pbAnaLexFile;
	unsigned m_uiLexFileCount;
	unsigned m_uiLexFileAlloc;
	const char * m_pszLogFile;
	const char * m_pszError;
	UINT m_iCodePage;
	bool m_bWriteAmpleParses;
	TextControl m_sTextCtl;

	// internal support methods
	HRESULT ConvertBstrToString(const BSTR bstr, UINT iCodePage, char ** ppsz);
	HRESULT ConvertStringToBstr(const char * psz, UINT iCodePage,
		BSTR * pbstr);
	HRESULT LoadLexicon(BSTR bstrFile, BOOL fAdd, bool fAna);
};

// Local Variables:
// mode:C++
// c-file-style:"cellar"
// compile-command:"nmake -f Patr100.mak"
// End:

#endif /*_PATRPARSER_H_INCLUDED_*/
