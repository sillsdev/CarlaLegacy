// Hook.h : Declaration of the CHook

#ifndef __HOOK_H_
#define __HOOK_H_

#include "..\resource.h"       // main symbols
#include "..\CStudioCom.h"

class CCarlaLanguage;
class CIntergenProcess;
class CPathDescriptor;
// had trouble getting ITask to compile in the cstudioapp.cpp
#ifndef ITask
#define ITask IUnknown
#endif

/////////////////////////////////////////////////////////////////////////////
// CHook
class ATL_NO_VTABLE CHook :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CHook, &CLSID_CSHook>,
	public IDispatchImpl<ICSHook, &IID_ICSHook, &LIBID_CStudioLib>
{
public:
	CHook()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_HOOK)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CHook)
	COM_INTERFACE_ENTRY(ICSHook)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()

// ICSHook
public:
	STDMETHOD(get_CurrentTextInIncludeSpecified)(/*[in]*/BSTR bstrLang, /*[out, retval]*/ BOOL *pVal);
	STDMETHOD(get_CurrentTextInIncludeExcludeMarkers)(/*[in]*/ BSTR bstrLang, /*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_CurrentIntergenWordMarker)(/*[in]*/ BSTR bstrLangCode, /*[out, retval]*/ BSTR *pWordMarker);
	STDMETHOD(get_LangCodesString)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_LangCodes)(/*[out, retval]*/ VARIANT *pVal);
	STDMETHOD(get_CurrentIntergenAnalysisMarkers)(/*[in]*/ BSTR bstrLangCode, /*[out, retval]*/ BSTR *pVal);
	STDMETHOD(PerformTask)(/*[in]*/ VARIANT varICSTask);
protected:
	CCarlaLanguage* getLangFromCode(BSTR bstrLangCode);
	CIntergenProcess* getIntergenProcess(BSTR bstrLangCode);
	CString deinterlinearize(CPathDescriptor& pathInput, ITask* pTask);
};

#endif //__HOOK_H_
