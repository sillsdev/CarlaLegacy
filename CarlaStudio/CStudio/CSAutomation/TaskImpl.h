// TaskImpl.h : Declaration of the CTaskImpl

#ifndef __TASKIMPL_H_
#define __TASKIMPL_H_

#include "resource.h"       // main symbols
#include "..\CSTUDIOAPP\cstudiocom.h"

/////////////////////////////////////////////////////////////////////////////
// CTaskImpl
class ATL_NO_VTABLE CTaskImpl :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CTaskImpl, &CLSID_TaskImpl>,
	public IDispatchImpl<ITask, &IID_ITask, &LIBID_CSAUTOMATIONLib>,
	public IPersistStorageImpl<CTaskImpl>,
	public IPersistStreamInitImpl<CTaskImpl>,	// needed for the ipersisstorageimpl to work
	public ISupportErrorInfoImpl<&IID_ITask>
{
public:
	CTaskImpl();

DECLARE_REGISTRY_RESOURCEID(IDR_TASKIMPL)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_PROP_MAP(CTaskImpl)
	PROP_ENTRY("Goal", 6, CLSID_NULL)
	PROP_ENTRY("InputIsInterlinear", 7, CLSID_NULL)
	PROP_ENTRY("AnalysisMarkers", 5, CLSID_NULL)
	PROP_ENTRY("InterlinearWordMarker", 18, CLSID_NULL)
	PROP_ENTRY("InputPath", 1, CLSID_NULL)
	PROP_ENTRY("DesiredOutputPath", 2, CLSID_NULL)
	PROP_ENTRY("SrcLangCode", 3, CLSID_NULL)
	PROP_ENTRY("TargetLangCode", 4, CLSID_NULL)
	PROP_ENTRY("IncludeLinesWIthSpecifiedMarkers", 12, CLSID_NULL)
	PROP_ENTRY("MarkersToIncludeOrExclude", 13, CLSID_NULL)
	PROP_ENTRY("OutputLocation", 17, CLSID_NULL)
END_PROP_MAP()

BEGIN_COM_MAP(CTaskImpl)
	COM_INTERFACE_ENTRY(ITask)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(IPersistStorage)
	COM_INTERFACE_ENTRY(IPersistStreamInit)
	COM_INTERFACE_ENTRY(ISupportErrorInfo)
END_COM_MAP()

// ITask
public:
/*	typedef enum CSGOAL
						{	SrcANA	= 1,
							SrcInterlinear	= 2
			}	CSGOAL;

*/
	BOOL m_bIsInterlinear;
	STDMETHOD(Perform)();
	STDMETHOD(get_InputIsInterlinear)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_InputIsInterlinear)(/*[in]*/ BOOL newVal);
	CSGOAL m_nGoal;
	CComBSTR m_bstrInputPath;
	CComBSTR m_bstrDesiredOutputPath;
	CComBSTR m_bstrAnalysisMarkers;
	CComBSTR m_bstrSourceLangCode;
	CComBSTR m_bstrTargetLangCode;


	STDMETHOD(get_Goal)(/*[out, retval]*/ CSGOAL *pVal);
	STDMETHOD(put_Goal)(/*[in]*/ CSGOAL newVal);
	STDMETHOD(get_AnalysisMarkers)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_AnalysisMarkers)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_TargetLangCode)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_TargetLangCode)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_SourceLangCode)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_SourceLangCode)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_DesiredOutputPath)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_DesiredOutputPath)(/*[in]*/ BSTR newVal);

	CComBSTR m_bstrActualOutputPath;
	STDMETHOD(get_ActualOutputPath)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_ActualOutputPath)(/*[in]*/ BSTR newVal);

	STDMETHOD(get_InputPath)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_InputPath)(/*[in]*/ BSTR newVal);


  // For IPersistStreamInit
public:
	STDMETHOD(RetrieveTextInSettings)();
	STDMETHOD(RetrieveIntergenSettings)();
	STDMETHOD(get_InterlinearWordMarker)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_InterlinearWordMarker)(/*[in]*/ BSTR newVal);
	CSOUTPUTLOCATION m_nOutputLocation;
	STDMETHOD(get_OutputLocation)(/*[out, retval]*/ CSOUTPUTLOCATION *pVal);
	STDMETHOD(put_OutputLocation)(/*[in]*/ CSOUTPUTLOCATION newVal);
	STDMETHOD(get_LangCodesString)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(get_LangCodes)(/*[out, retval]*/ VARIANT *pVal);
	STDMETHOD(get_MarkersToIncludeOrExclude)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_MarkersToIncludeOrExclude)(/*[in]*/ BSTR newVal);
	CComBSTR m_bstrMarkersToIncludeOrExclude;
	BOOL m_bIncludeLinesWithSpecifiedMarkers;
	STDMETHOD(get_IncludeLinesWithSpecifiedMarkers)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_IncludeLinesWithSpecifiedMarkers)(/*[in]*/ BOOL newVal);
	STDMETHOD(Load)(/*[in]*/ BSTR bstrPath);
	STDMETHOD(Save)(/*[in]*/ BSTR bstrPath);
	BOOL m_bRequiresSave;
protected:
	CComBSTR m_bstrInterlinearWordMarker;
	virtual HRESULT STDMETHODCALLTYPE GetClassID(
		  /* [out] */ CLSID __RPC_FAR *pClassID) {*pClassID = CLSID_TaskImpl; return S_OK;}
	STDMETHOD(InitNew)();

//	HRESULT prepareHook();
	CComPtr<ICSHook> m_qHook;
};

#endif //__TASKIMPL_H_
