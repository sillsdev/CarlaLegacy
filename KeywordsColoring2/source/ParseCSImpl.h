// ParseCSImpl.h : Declaration of the CParseCSImpl

#ifndef __PARSECS_H_
#define __PARSECS_H_

#include "..\resource.h"       // main symbols
#include "..\CStudioCom.h"

class CCarlaLanguage;
class CPhraseParser;


/////////////////////////////////////////////////////////////////////////////
// CParseCSImpl
class ATL_NO_VTABLE CParseCSImpl :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CParseCSImpl, &CLSID_ParseCS>,
	public IDispatchImpl<IParseCS, &IID_IParseCS, &LIBID_CStudioLib>,
	public ISupportErrorInfoImpl<&IID_IParseCS>
{
public:
	CParseCSImpl();
	void FinalRelease(); // override

DECLARE_REGISTRY_RESOURCEID(IDR_PARSECS)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CParseCSImpl)
	COM_INTERFACE_ENTRY(IParseCS)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(ISupportErrorInfo)
END_COM_MAP()

// IParseCS
public:
	STDMETHOD(get_LangInfoXML)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(ParseFile)(BSTR sInputFilePath, BSTR sOutputFilePath, BOOL bForceRefresh);
	STDMETHOD(get_SourceLangeCode)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_SourceLangeCode)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_LangCodesString)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(ParseString)(/*[in]*/BSTR sPhrase, /*[in]*/ BOOL bTrace, /*[in]*/ BSTR sTraceWords,
						/*[in]*/ BOOL bForceRefresh,
						/*[out, retval]*/ BSTR *sResult);
	STDMETHOD(get_Options)(/*[out, retval]*/ long *pVal);
	STDMETHOD(put_Options)(/*[in]*/ long newVal);

protected:
	CPhraseParser* m_pPhraseParser;
	CCarlaLanguage* getLangFromCode(BSTR bstrLangCode);
	CComBSTR m_bstrSourceLangCode;
};

#endif //__PARSECS_H_
