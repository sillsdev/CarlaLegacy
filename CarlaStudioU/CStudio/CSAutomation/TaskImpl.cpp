// TaskImpl.cpp : Implementation of CTaskImpl
#include "stdafx.h"
#include "CSAutomation.h"


#include "..\CSTUDIOAPP\cstudiocom_i.c"
#include <Comdef.h>

#include "atlconv.h"
#include "TaskImpl.h"

/////////////////////////////////////////////////////////////////////////////
// CTaskImpl


STDMETHODIMP CTaskImpl::Perform()
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())
	HRESULT hr;

	ATLASSERT(m_qHook);

	_variant_t v(this);
	hr = m_qHook->PerformTask(v);

	return hr;
}


CTaskImpl::CTaskImpl()
	:	m_bIsInterlinear(FALSE),
		m_nGoal(csGlossedInterlinear)
{
}



STDMETHODIMP CTaskImpl::get_InputPath(BSTR *pbstrPath)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrInputPath.CopyTo(pbstrPath);

	return S_OK;
}

STDMETHODIMP CTaskImpl::put_InputPath(BSTR bstrPath)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bRequiresSave = TRUE;
	m_bstrInputPath =bstrPath;

	return S_OK;
}

STDMETHODIMP CTaskImpl::get_DesiredOutputPath(BSTR *pbstrPath)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrDesiredOutputPath.CopyTo(pbstrPath);

	return S_OK;
}

STDMETHODIMP CTaskImpl::put_DesiredOutputPath(BSTR bstrPath)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bRequiresSave = TRUE;
	m_bstrDesiredOutputPath =bstrPath;
	return S_OK;
}

STDMETHODIMP CTaskImpl::get_SourceLangCode(BSTR *pbstrCode)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrSourceLangCode.CopyTo(pbstrCode);

	return S_OK;
}

STDMETHODIMP CTaskImpl::put_SourceLangCode(BSTR bstrCode)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bRequiresSave = TRUE;
	m_bstrSourceLangCode = bstrCode;
	return S_OK;
}

STDMETHODIMP CTaskImpl::get_TargetLangCode(BSTR *pbstrCode)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrTargetLangCode.CopyTo(pbstrCode);

	return S_OK;
}

STDMETHODIMP CTaskImpl::put_TargetLangCode(BSTR bstrCode)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bRequiresSave = TRUE;
	m_bstrTargetLangCode = bstrCode;
	return S_OK;
}

STDMETHODIMP CTaskImpl::get_AnalysisMarkers(BSTR *pbstrMarkers)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrAnalysisMarkers.CopyTo(pbstrMarkers);

	return S_OK;
}

STDMETHODIMP CTaskImpl::put_AnalysisMarkers(BSTR bstrMarkers)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bRequiresSave = TRUE;
	m_bstrAnalysisMarkers = bstrMarkers;

	return S_OK;
}

STDMETHODIMP CTaskImpl::get_Goal(CSGOAL *pnGoal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	*pnGoal = m_nGoal;

	return S_OK;
}

STDMETHODIMP CTaskImpl::put_Goal(CSGOAL nGoal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bRequiresSave = TRUE;
	m_nGoal = nGoal;

	return S_OK;
}

STDMETHODIMP CTaskImpl::get_InputIsInterlinear(BOOL *pbIsInterlinear)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	*pbIsInterlinear = m_bIsInterlinear;

	return S_OK;
}

STDMETHODIMP CTaskImpl::put_InputIsInterlinear(BOOL bIsInterlinear)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bRequiresSave = TRUE;
	m_bIsInterlinear = bIsInterlinear;

	return S_OK;
}

// IPersistStreamInit

HRESULT CTaskImpl::InitNew()
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bRequiresSave = TRUE; // though we haven't set anything, it should be saved if you don't want to loos it

	m_nGoal = csGlossedInterlinear;
	m_bIsInterlinear = FALSE;
	//AfxMessageBox("initnew");

	HRESULT hr = m_qHook.CoCreateInstance(L"CStudio.Hook");
	if(FAILED(hr))
		return Error(_T("Failed to make contact with CStudio (couldn't create CStudio.Hook Object).  Try this: from DOS, in the directory containing CStudio.exe, type CStudio -RegServer"));

	return S_OK;
}

// Visual Basic doesn't appear to support IPersistStream of just any ol' component, so we implement saving ourself
STDMETHODIMP CTaskImpl::Save(BSTR bstrPath)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	HRESULT hr;


	// create the storage
	CComPtr<IStorage> qStorage;
	USES_CONVERSION;
	hr = ::StgCreateDocfile(bstrPath, STGM_DIRECT | STGM_READWRITE | STGM_CREATE | STGM_SHARE_EXCLUSIVE, NULL,
							&qStorage);
	if(FAILED(hr))
		return hr;

	// get our IPersisStorage interface

	CComQIPtr<IPersistStorage, &IID_IPersistStorage> qPersistStorage(this);
	ASSERT(qPersistStorage);
	hr = qPersistStorage->Save(qStorage, FALSE);

	//hr = ::OleSave(qPersistStorage, qStorage, FALSE);
	if(FAILED(hr))
		return hr;

	return S_OK;
}

STDMETHODIMP CTaskImpl::Load(BSTR bstrPath)
{
	HRESULT hr;
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	if(!m_qHook)
		return Error("TaskImpl expected to be hooked up to CarlaStudio before Load was called.");

	CComPtr<IStorage> qStorage;

	// note that this file is closed when the smart pointer qStorage goes out of scope

	hr = ::StgOpenStorage(bstrPath, NULL, STGM_DIRECT | STGM_READ | STGM_SHARE_EXCLUSIVE, NULL, NULL,
							&qStorage);
	if (FAILED(hr))
		return hr;

	// get the IPersistStorage interface of this object

	CComQIPtr<IPersistStorage, &IID_IPersistStorage> qMyPersistStorage(this);
	ASSERT(qMyPersistStorage);


	// tell myself to load from that storage
	hr = qMyPersistStorage->Load(qStorage);
	if(FAILED(hr))
		return hr;

	return S_OK;
}

// ActualOutputPath is where cs actually output to, whereas the DesiredOutputPath might be empty
// if the user didn't specify it
STDMETHODIMP CTaskImpl::get_ActualOutputPath(BSTR *pbstrPath)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrActualOutputPath.CopyTo(pbstrPath);

	return S_OK;
}

STDMETHODIMP CTaskImpl::put_ActualOutputPath(BSTR bstrPath)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bRequiresSave = TRUE;
	m_bstrActualOutputPath =bstrPath;

	return S_OK;
}

STDMETHODIMP CTaskImpl::get_IncludeLinesWithSpecifiedMarkers(BOOL *pVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	*pVal = m_bIncludeLinesWithSpecifiedMarkers;
	return S_OK;
}

STDMETHODIMP CTaskImpl::put_IncludeLinesWithSpecifiedMarkers(BOOL newVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bIncludeLinesWithSpecifiedMarkers = newVal;
	m_bRequiresSave = TRUE;
	return S_OK;
}

STDMETHODIMP CTaskImpl::get_MarkersToIncludeOrExclude(BSTR *pVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrMarkersToIncludeOrExclude.CopyTo(pVal);

	return S_OK;
}

STDMETHODIMP CTaskImpl::put_MarkersToIncludeOrExclude(BSTR newVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrMarkersToIncludeOrExclude = newVal;
	m_bRequiresSave = TRUE;

	return S_OK;
}

STDMETHODIMP CTaskImpl::get_LangCodes(VARIANT *pVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

/*	SAFEARRAY* pSA;
	SAFEARRAYBOUND saBound = {3, 0};
	pSA = SafeArrayCreate(VT_VARIANT, 1, &saBound);
	long indexArray[2];
	indexArray[1]=0;
	indexArray[0]=0;
	CComBSTR b(L"One");
	_variant_t v(b);
	HRESULT hr = SafeArrayPutElement(pSA, indexArray, &v);
	b.Detach();

	b = L"Two";
	indexArray[0]=1;
	_variant_t v2(b);
	hr = SafeArrayPutElement(pSA, indexArray, &v2);

	b = L"Three";
	indexArray[0]=2;
	_variant_t v3(b);
	hr = SafeArrayPutElement(pSA, indexArray, &v3);

	pVal->vt = VT_ARRAY;
	pVal->parray = pSA;
*/

	SAFEARRAY* pSA;
	SAFEARRAYBOUND saBound = {2, 0};
	pSA = SafeArrayCreate(VT_VARIANT, 1, &saBound);
	long indexArray[2];
	indexArray[1]=0;
	indexArray[0]=0;

	long l = 1969;
	_variant_t v1; v1.vt=VT_UI4; v1.uiVal = 1969;
	HRESULT hr = SafeArrayPutElement(pSA, indexArray, &v1);

	indexArray[0]=1;
	_variant_t v2; v2.vt=VT_UI4; v2.uiVal = 1979;
	hr = SafeArrayPutElement(pSA, indexArray, &v2);


	pVal->vt = VT_ARRAY;
	pVal->parray = pSA;
/*
	SAFEARRAY* pSA;
	SAFEARRAYBOUND saBound = {3, 0};
	pSA = SafeArrayCreate(VT_BSTR, 1, &saBound);
	long indexArray[2];
	indexArray[1]=0;
	indexArray[0]=0;
	CComBSTR b(L"One");
	BSTR x = ::SysAllocString(L"uno");

	HRESULT hr = SafeArrayPutElement(pSA, indexArray, x);
	b.Detach();

	b = L"Two";
	indexArray[0]=1;
	hr = SafeArrayPutElement(pSA, indexArray, b.m_str);
	b.Detach();

	b = L"Three";
	indexArray[0]=2;
	hr = SafeArrayPutElement(pSA, indexArray, b.m_str);
	b.Detach();

	pVal->vt = VT_ARRAY;
	pVal->parray = pSA;

*/
	//BSTR* pB=0;
	//long ix = 1;
	//hr = SafeArrayGetElement(pSA, &ix, &pB);

	return S_OK;
}


//DEL STDMETHODIMP CTaskImpl::get_CurrentIntergenAnalysisMarkers(BSTR bstrLangCode, BSTR *pbstrMarkers)
//DEL {
//DEL 	AFX_MANAGE_STATE(AfxGetStaticModuleState())
//DEL
//DEL 	ATLASSERT(m_qHook);
//DEL 	HRESULT hr = m_qHook->get_CurrentIntergenAnalysisMarkers(bstrLangCode, pbstrMarkers);
//DEL
//DEL 	return S_OK;
//DEL }

// asks CStudio for the list of languages in the current project
STDMETHODIMP CTaskImpl::get_LangCodesString(BSTR *pbstrLangCodes)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	ATLASSERT(m_qHook);
	HRESULT hr = m_qHook->get_LangCodesString(pbstrLangCodes);

	return hr;
}



STDMETHODIMP CTaskImpl::get_OutputLocation(CSOUTPUTLOCATION *pVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	*pVal  = m_nOutputLocation;
	return S_OK;
}

STDMETHODIMP CTaskImpl::put_OutputLocation(CSOUTPUTLOCATION newVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_nOutputLocation = newVal;

	return S_OK;
}

// This property InterlinearWordMarker, is use only when we're de-interlinearizing
// (using clean). Else MarkersToIncludeOrExclude is relevant.
STDMETHODIMP CTaskImpl::get_InterlinearWordMarker(BSTR *pbstrMarker)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrInterlinearWordMarker.CopyTo(pbstrMarker);
	return S_OK;
}

// This property InterlinearWordMarker, is use only when we're de-interlinearizing
// (using clean). Else MarkersToIncludeOrExclude is relevant.
STDMETHODIMP CTaskImpl::put_InterlinearWordMarker(BSTR bstrMarker)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrInterlinearWordMarker = bstrMarker;

	return S_OK;
}

// asks CStudio for the current settings
// called to set default values for the task or when the user wants to reset to the
// values currently in CStudio
STDMETHODIMP CTaskImpl::RetrieveIntergenSettings()
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	ATLASSERT(m_qHook);
	HRESULT hr =  m_qHook->get_CurrentIntergenAnalysisMarkers(m_bstrSourceLangCode,
														&m_bstrAnalysisMarkers);
	if(FAILED(hr))
		return hr;

	hr = m_qHook->get_CurrentIntergenWordMarker(m_bstrSourceLangCode,
														&m_bstrInterlinearWordMarker);
	return hr;
}

// asks CStudio for the current settings
// called to set default values for the task or when the user wants to reset to the
// values currently in CStudio
STDMETHODIMP CTaskImpl::RetrieveTextInSettings()
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	ATLASSERT(m_qHook);
	HRESULT hr = m_qHook->get_CurrentTextInIncludeSpecified(m_bstrSourceLangCode, &m_bIncludeLinesWithSpecifiedMarkers);
	if(FAILED(hr))
		return hr;
	hr = m_qHook->get_CurrentTextInIncludeExcludeMarkers(m_bstrSourceLangCode,
														&m_bstrMarkersToIncludeOrExclude);

	return S_OK;
}
