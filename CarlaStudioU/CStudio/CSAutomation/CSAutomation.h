/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Tue Aug 07 11:54:22 2001
 */
/* Compiler settings for C:\carla\Dev\CarlaStudio\CStudio\CSAutomation\CSAutomation.idl:
	Oicf (OptLev=i2), W1, Zp8, env=Win32, ms_ext, c_ext
	error checks: allocation ref bounds_check enum stub_data
*/
//@@MIDL_FILE_HEADING(  )


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 440
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __CSAutomation_h__
#define __CSAutomation_h__

#ifdef __cplusplus
extern "C"{
#endif

/* Forward Declarations */

#ifndef __ITask_FWD_DEFINED__
#define __ITask_FWD_DEFINED__
typedef interface ITask ITask;
#endif 	/* __ITask_FWD_DEFINED__ */


#ifndef __TaskImpl_FWD_DEFINED__
#define __TaskImpl_FWD_DEFINED__

#ifdef __cplusplus
typedef class TaskImpl TaskImpl;
#else
typedef struct TaskImpl TaskImpl;
#endif /* __cplusplus */

#endif 	/* __TaskImpl_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * );

#ifndef __ITask_INTERFACE_DEFINED__
#define __ITask_INTERFACE_DEFINED__

/* interface ITask */
/* [unique][helpstring][oleautomation][dual][uuid][object] */

typedef
enum CSGOAL
	{	csSourceAna	= 0,
	csGlossedInterlinear	= csSourceAna + 1,
	csAutoSynthCheck	= csGlossedInterlinear + 1,
	csTargetANA	= csAutoSynthCheck + 1,
	csTargetText	= csTargetANA + 1
	}	CSGOAL;

typedef
enum CSOUTPUTLOCATION
	{	csReplaceInput	= 0,
	csSameFolderAsInput	= csReplaceInput + 1,
	csSpecifiedPath	= csSameFolderAsInput + 1
	}	CSOUTPUTLOCATION;


EXTERN_C const IID IID_ITask;

#if defined(__cplusplus) && !defined(CINTERFACE)

	MIDL_INTERFACE("61FE777C-09DF-11D3-8664-E0570BC14908")
	ITask : public IDispatch
	{
	public:
		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Perform( void) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Save(
			/* [in] */ BSTR bstrPath) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Load(
			/* [in] */ BSTR bstrPath) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_InputPath(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_InputPath(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_DesiredOutputPath(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_DesiredOutputPath(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SourceLangCode(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_SourceLangCode(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetLangCode(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TargetLangCode(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_AnalysisMarkers(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_AnalysisMarkers(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Goal(
			/* [retval][out] */ CSGOAL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Goal(
			/* [in] */ CSGOAL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_InputIsInterlinear(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_InputIsInterlinear(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ActualOutputPath(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ActualOutputPath(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_IncludeLinesWithSpecifiedMarkers(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_IncludeLinesWithSpecifiedMarkers(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_MarkersToIncludeOrExclude(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_MarkersToIncludeOrExclude(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LangCodes(
			/* [retval][out] */ VARIANT __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LangCodesString(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_OutputLocation(
			/* [retval][out] */ CSOUTPUTLOCATION __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_OutputLocation(
			/* [in] */ CSOUTPUTLOCATION newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_InterlinearWordMarker(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_InterlinearWordMarker(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RetrieveIntergenSettings( void) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RetrieveTextInSettings( void) = 0;

	};

#else 	/* C style interface */

	typedef struct ITaskVtbl
	{
		BEGIN_INTERFACE

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )(
			ITask __RPC_FAR * This,
			/* [in] */ REFIID riid,
			/* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);

		ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )(
			ITask __RPC_FAR * This);

		ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )(
			ITask __RPC_FAR * This);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )(
			ITask __RPC_FAR * This,
			/* [out] */ UINT __RPC_FAR *pctinfo);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )(
			ITask __RPC_FAR * This,
			/* [in] */ UINT iTInfo,
			/* [in] */ LCID lcid,
			/* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )(
			ITask __RPC_FAR * This,
			/* [in] */ REFIID riid,
			/* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
			/* [in] */ UINT cNames,
			/* [in] */ LCID lcid,
			/* [size_is][out] */ DISPID __RPC_FAR *rgDispId);

		/* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )(
			ITask __RPC_FAR * This,
			/* [in] */ DISPID dispIdMember,
			/* [in] */ REFIID riid,
			/* [in] */ LCID lcid,
			/* [in] */ WORD wFlags,
			/* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
			/* [out] */ VARIANT __RPC_FAR *pVarResult,
			/* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
			/* [out] */ UINT __RPC_FAR *puArgErr);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Perform )(
			ITask __RPC_FAR * This);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Save )(
			ITask __RPC_FAR * This,
			/* [in] */ BSTR bstrPath);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Load )(
			ITask __RPC_FAR * This,
			/* [in] */ BSTR bstrPath);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_InputPath )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_InputPath )(
			ITask __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_DesiredOutputPath )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_DesiredOutputPath )(
			ITask __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_SourceLangCode )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_SourceLangCode )(
			ITask __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_TargetLangCode )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_TargetLangCode )(
			ITask __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_AnalysisMarkers )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_AnalysisMarkers )(
			ITask __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_Goal )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ CSGOAL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_Goal )(
			ITask __RPC_FAR * This,
			/* [in] */ CSGOAL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_InputIsInterlinear )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_InputIsInterlinear )(
			ITask __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_ActualOutputPath )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_ActualOutputPath )(
			ITask __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_IncludeLinesWithSpecifiedMarkers )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_IncludeLinesWithSpecifiedMarkers )(
			ITask __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_MarkersToIncludeOrExclude )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_MarkersToIncludeOrExclude )(
			ITask __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LangCodes )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ VARIANT __RPC_FAR *pVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LangCodesString )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_OutputLocation )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ CSOUTPUTLOCATION __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_OutputLocation )(
			ITask __RPC_FAR * This,
			/* [in] */ CSOUTPUTLOCATION newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_InterlinearWordMarker )(
			ITask __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_InterlinearWordMarker )(
			ITask __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *RetrieveIntergenSettings )(
			ITask __RPC_FAR * This);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *RetrieveTextInSettings )(
			ITask __RPC_FAR * This);

		END_INTERFACE
	} ITaskVtbl;

	interface ITask
	{
		CONST_VTBL struct ITaskVtbl __RPC_FAR *lpVtbl;
	};



#ifdef COBJMACROS


#define ITask_QueryInterface(This,riid,ppvObject)	\
	(This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ITask_AddRef(This)	\
	(This)->lpVtbl -> AddRef(This)

#define ITask_Release(This)	\
	(This)->lpVtbl -> Release(This)


#define ITask_GetTypeInfoCount(This,pctinfo)	\
	(This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define ITask_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
	(This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define ITask_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
	(This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define ITask_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
	(This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define ITask_Perform(This)	\
	(This)->lpVtbl -> Perform(This)

#define ITask_Save(This,bstrPath)	\
	(This)->lpVtbl -> Save(This,bstrPath)

#define ITask_Load(This,bstrPath)	\
	(This)->lpVtbl -> Load(This,bstrPath)

#define ITask_get_InputPath(This,pVal)	\
	(This)->lpVtbl -> get_InputPath(This,pVal)

#define ITask_put_InputPath(This,newVal)	\
	(This)->lpVtbl -> put_InputPath(This,newVal)

#define ITask_get_DesiredOutputPath(This,pVal)	\
	(This)->lpVtbl -> get_DesiredOutputPath(This,pVal)

#define ITask_put_DesiredOutputPath(This,newVal)	\
	(This)->lpVtbl -> put_DesiredOutputPath(This,newVal)

#define ITask_get_SourceLangCode(This,pVal)	\
	(This)->lpVtbl -> get_SourceLangCode(This,pVal)

#define ITask_put_SourceLangCode(This,newVal)	\
	(This)->lpVtbl -> put_SourceLangCode(This,newVal)

#define ITask_get_TargetLangCode(This,pVal)	\
	(This)->lpVtbl -> get_TargetLangCode(This,pVal)

#define ITask_put_TargetLangCode(This,newVal)	\
	(This)->lpVtbl -> put_TargetLangCode(This,newVal)

#define ITask_get_AnalysisMarkers(This,pVal)	\
	(This)->lpVtbl -> get_AnalysisMarkers(This,pVal)

#define ITask_put_AnalysisMarkers(This,newVal)	\
	(This)->lpVtbl -> put_AnalysisMarkers(This,newVal)

#define ITask_get_Goal(This,pVal)	\
	(This)->lpVtbl -> get_Goal(This,pVal)

#define ITask_put_Goal(This,newVal)	\
	(This)->lpVtbl -> put_Goal(This,newVal)

#define ITask_get_InputIsInterlinear(This,pVal)	\
	(This)->lpVtbl -> get_InputIsInterlinear(This,pVal)

#define ITask_put_InputIsInterlinear(This,newVal)	\
	(This)->lpVtbl -> put_InputIsInterlinear(This,newVal)

#define ITask_get_ActualOutputPath(This,pVal)	\
	(This)->lpVtbl -> get_ActualOutputPath(This,pVal)

#define ITask_put_ActualOutputPath(This,newVal)	\
	(This)->lpVtbl -> put_ActualOutputPath(This,newVal)

#define ITask_get_IncludeLinesWithSpecifiedMarkers(This,pVal)	\
	(This)->lpVtbl -> get_IncludeLinesWithSpecifiedMarkers(This,pVal)

#define ITask_put_IncludeLinesWithSpecifiedMarkers(This,newVal)	\
	(This)->lpVtbl -> put_IncludeLinesWithSpecifiedMarkers(This,newVal)

#define ITask_get_MarkersToIncludeOrExclude(This,pVal)	\
	(This)->lpVtbl -> get_MarkersToIncludeOrExclude(This,pVal)

#define ITask_put_MarkersToIncludeOrExclude(This,newVal)	\
	(This)->lpVtbl -> put_MarkersToIncludeOrExclude(This,newVal)

#define ITask_get_LangCodes(This,pVal)	\
	(This)->lpVtbl -> get_LangCodes(This,pVal)

#define ITask_get_LangCodesString(This,pVal)	\
	(This)->lpVtbl -> get_LangCodesString(This,pVal)

#define ITask_get_OutputLocation(This,pVal)	\
	(This)->lpVtbl -> get_OutputLocation(This,pVal)

#define ITask_put_OutputLocation(This,newVal)	\
	(This)->lpVtbl -> put_OutputLocation(This,newVal)

#define ITask_get_InterlinearWordMarker(This,pVal)	\
	(This)->lpVtbl -> get_InterlinearWordMarker(This,pVal)

#define ITask_put_InterlinearWordMarker(This,newVal)	\
	(This)->lpVtbl -> put_InterlinearWordMarker(This,newVal)

#define ITask_RetrieveIntergenSettings(This)	\
	(This)->lpVtbl -> RetrieveIntergenSettings(This)

#define ITask_RetrieveTextInSettings(This)	\
	(This)->lpVtbl -> RetrieveTextInSettings(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ITask_Perform_Proxy(
	ITask __RPC_FAR * This);


void __RPC_STUB ITask_Perform_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ITask_Save_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BSTR bstrPath);


void __RPC_STUB ITask_Save_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ITask_Load_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BSTR bstrPath);


void __RPC_STUB ITask_Load_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_InputPath_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ITask_get_InputPath_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_InputPath_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB ITask_put_InputPath_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_DesiredOutputPath_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ITask_get_DesiredOutputPath_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_DesiredOutputPath_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB ITask_put_DesiredOutputPath_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_SourceLangCode_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ITask_get_SourceLangCode_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_SourceLangCode_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB ITask_put_SourceLangCode_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_TargetLangCode_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ITask_get_TargetLangCode_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_TargetLangCode_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB ITask_put_TargetLangCode_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_AnalysisMarkers_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ITask_get_AnalysisMarkers_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_AnalysisMarkers_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB ITask_put_AnalysisMarkers_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_Goal_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ CSGOAL __RPC_FAR *pVal);


void __RPC_STUB ITask_get_Goal_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_Goal_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ CSGOAL newVal);


void __RPC_STUB ITask_put_Goal_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_InputIsInterlinear_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB ITask_get_InputIsInterlinear_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_InputIsInterlinear_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB ITask_put_InputIsInterlinear_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_ActualOutputPath_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ITask_get_ActualOutputPath_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_ActualOutputPath_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB ITask_put_ActualOutputPath_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_IncludeLinesWithSpecifiedMarkers_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB ITask_get_IncludeLinesWithSpecifiedMarkers_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_IncludeLinesWithSpecifiedMarkers_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB ITask_put_IncludeLinesWithSpecifiedMarkers_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_MarkersToIncludeOrExclude_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ITask_get_MarkersToIncludeOrExclude_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_MarkersToIncludeOrExclude_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB ITask_put_MarkersToIncludeOrExclude_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_LangCodes_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ VARIANT __RPC_FAR *pVal);


void __RPC_STUB ITask_get_LangCodes_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_LangCodesString_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ITask_get_LangCodesString_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_OutputLocation_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ CSOUTPUTLOCATION __RPC_FAR *pVal);


void __RPC_STUB ITask_get_OutputLocation_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_OutputLocation_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ CSOUTPUTLOCATION newVal);


void __RPC_STUB ITask_put_OutputLocation_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ITask_get_InterlinearWordMarker_Proxy(
	ITask __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ITask_get_InterlinearWordMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE ITask_put_InterlinearWordMarker_Proxy(
	ITask __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB ITask_put_InterlinearWordMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ITask_RetrieveIntergenSettings_Proxy(
	ITask __RPC_FAR * This);


void __RPC_STUB ITask_RetrieveIntergenSettings_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ITask_RetrieveTextInSettings_Proxy(
	ITask __RPC_FAR * This);


void __RPC_STUB ITask_RetrieveTextInSettings_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);



#endif 	/* __ITask_INTERFACE_DEFINED__ */



#ifndef __CSAUTOMATIONLib_LIBRARY_DEFINED__
#define __CSAUTOMATIONLib_LIBRARY_DEFINED__

/* library CSAUTOMATIONLib */
/* [helpstring][version][uuid] */


EXTERN_C const IID LIBID_CSAUTOMATIONLib;

EXTERN_C const CLSID CLSID_TaskImpl;

#ifdef __cplusplus

class DECLSPEC_UUID("61FE777D-09DF-11D3-8664-E0570BC14908")
TaskImpl;
#endif
#endif /* __CSAUTOMATIONLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long __RPC_FAR *, unsigned long            , BSTR __RPC_FAR * );
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * );
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * );
void                      __RPC_USER  BSTR_UserFree(     unsigned long __RPC_FAR *, BSTR __RPC_FAR * );

unsigned long             __RPC_USER  VARIANT_UserSize(     unsigned long __RPC_FAR *, unsigned long            , VARIANT __RPC_FAR * );
unsigned char __RPC_FAR * __RPC_USER  VARIANT_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, VARIANT __RPC_FAR * );
unsigned char __RPC_FAR * __RPC_USER  VARIANT_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, VARIANT __RPC_FAR * );
void                      __RPC_USER  VARIANT_UserFree(     unsigned long __RPC_FAR *, VARIANT __RPC_FAR * );

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif
