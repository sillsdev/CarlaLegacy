// Ana2Xml.h : Declaration of the CAna2Xml

#ifndef __ANA2XML_H_
#define __ANA2XML_H_

#include "resource.h"       // main symbols
#include "Ana2XmlLib.h"

/////////////////////////////////////////////////////////////////////////////
// CAna2Xml
class ATL_NO_VTABLE CAna2Xml :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CAna2Xml, &CLSID_Ana2Xml>,
	public IDispatchImpl<IAna2Xml, &IID_IAna2Xml, &LIBID_ANA2XMLCOMLib>
{
public:
	CAna2Xml();

DECLARE_REGISTRY_RESOURCEID(IDR_ANA2XML)
DECLARE_NOT_AGGREGATABLE(CAna2Xml)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CAna2Xml)
	COM_INTERFACE_ENTRY(IAna2Xml)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()

// IAna2Xml
public:
	STDMETHOD(FinalCleanup)();
	STDMETHOD(get_RootEndDelimiter)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_RootEndDelimiter)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_RootBeginDelimiter)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_RootBeginDelimiter)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_AmbiguitySepCharacter)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_AmbiguitySepCharacter)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_LogFileName)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_LogFileName)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_OutputFileName)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_OutputFileName)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_InputFileName)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_InputFileName)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_DecompositionSepCharacter)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_DecompositionSepCharacter)(/*[in]*/ BSTR newVal);
	STDMETHOD(ConvertFile)(/*[in]*/ BSTR bstrInput, /*[in]*/ BSTR bstrOutput);
	AnaData m_AnaData;

	// internal support methods (taken unashamedly and with much gratitude
	// from the PcPatr code)
	HRESULT ConvertBstrToString(const BSTR bstr, UINT iCodePage, char ** ppsz);
	HRESULT ConvertStringToBstr(const char * psz, UINT iCodePage,
		BSTR * pbstr);
};

/* clever hack to handle function prototypes flexibly */
#ifdef HAVE_PROTOTYPES
#define P(args) args
#else
#define P(args) ()
#endif
				// Ana2Xml lib

extern void          performMapping        P((AnaData * pAnaData_in));
extern void          openFiles             P((AnaData * pAnaData_in));
extern void          closeFiles            P((AnaData * pAnaData_in));

#undef P


#endif //__ANA2XML_H_
