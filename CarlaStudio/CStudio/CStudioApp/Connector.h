// Connector.h : Declaration of the CConnector

#ifndef __CONNECTOR_H_
#define __CONNECTOR_H_

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CConnector
class ATL_NO_VTABLE CConnector :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CConnector, &CLSID_Connector>,
	public IDispatchImpl<IConnector, &IID_IConnector, &LIBID_CStudioLib>
{
public:
	CConnector()
	{
	}

DECLARE_REGISTRY_RESOURCEID(IDR_CONNECTOR)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CConnector)
	COM_INTERFACE_ENTRY(IConnector)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()

// IConnector
public:
	STDMETHOD(Perform)(/*[in]*/ VARIANT varITask);
};

#endif //__CONNECTOR_H_
