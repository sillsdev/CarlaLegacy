/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Wed Aug 28 09:09:55 2002
 */
/* Compiler settings for C:\carla\KeywordsColoring2\source\CStudioCOM.idl:
	Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
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

#ifndef __CStudioCOM_h__
#define __CStudioCOM_h__

#ifdef __cplusplus
extern "C"{
#endif

/* Forward Declarations */

#ifndef __ICSHook_FWD_DEFINED__
#define __ICSHook_FWD_DEFINED__
typedef interface ICSHook ICSHook;
#endif 	/* __ICSHook_FWD_DEFINED__ */


#ifndef __IParseCS_FWD_DEFINED__
#define __IParseCS_FWD_DEFINED__
typedef interface IParseCS IParseCS;
#endif 	/* __IParseCS_FWD_DEFINED__ */


#ifndef __CSHook_FWD_DEFINED__
#define __CSHook_FWD_DEFINED__

#ifdef __cplusplus
typedef class CSHook CSHook;
#else
typedef struct CSHook CSHook;
#endif /* __cplusplus */

#endif 	/* __CSHook_FWD_DEFINED__ */


#ifndef __ParseCS_FWD_DEFINED__
#define __ParseCS_FWD_DEFINED__

#ifdef __cplusplus
typedef class ParseCS ParseCS;
#else
typedef struct ParseCS ParseCS;
#endif /* __cplusplus */

#endif 	/* __ParseCS_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * );

#ifndef __ICSHook_INTERFACE_DEFINED__
#define __ICSHook_INTERFACE_DEFINED__

/* interface ICSHook */
/* [unique][helpstring][dual][uuid][object] */


EXTERN_C const IID IID_ICSHook;

#if defined(__cplusplus) && !defined(CINTERFACE)

	MIDL_INTERFACE("11EC31D6-094D-11D3-8664-88970CC10000")
	ICSHook : public IDispatch
	{
	public:
		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE PerformTask(
			/* [in] */ VARIANT varICSTask) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CurrentIntergenAnalysisMarkers(
			/* [in] */ BSTR bstrLangCode,
			/* [retval][out] */ BSTR __RPC_FAR *pAnalysisMarkers) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LangCodes(
			/* [retval][out] */ VARIANT __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LangCodesString(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CurrentIntergenWordMarker(
			/* [in] */ BSTR bstrLangCode,
			/* [retval][out] */ BSTR __RPC_FAR *pWordMarker) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CurrentTextInIncludeExcludeMarkers(
			/* [in] */ BSTR bstrLang,
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CurrentTextInIncludeSpecified(
			/* [in] */ BSTR bstrLang,
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

	};

#else 	/* C style interface */

	typedef struct ICSHookVtbl
	{
		BEGIN_INTERFACE

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )(
			ICSHook __RPC_FAR * This,
			/* [in] */ REFIID riid,
			/* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);

		ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )(
			ICSHook __RPC_FAR * This);

		ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )(
			ICSHook __RPC_FAR * This);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )(
			ICSHook __RPC_FAR * This,
			/* [out] */ UINT __RPC_FAR *pctinfo);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )(
			ICSHook __RPC_FAR * This,
			/* [in] */ UINT iTInfo,
			/* [in] */ LCID lcid,
			/* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )(
			ICSHook __RPC_FAR * This,
			/* [in] */ REFIID riid,
			/* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
			/* [in] */ UINT cNames,
			/* [in] */ LCID lcid,
			/* [size_is][out] */ DISPID __RPC_FAR *rgDispId);

		/* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )(
			ICSHook __RPC_FAR * This,
			/* [in] */ DISPID dispIdMember,
			/* [in] */ REFIID riid,
			/* [in] */ LCID lcid,
			/* [in] */ WORD wFlags,
			/* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
			/* [out] */ VARIANT __RPC_FAR *pVarResult,
			/* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
			/* [out] */ UINT __RPC_FAR *puArgErr);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *PerformTask )(
			ICSHook __RPC_FAR * This,
			/* [in] */ VARIANT varICSTask);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_CurrentIntergenAnalysisMarkers )(
			ICSHook __RPC_FAR * This,
			/* [in] */ BSTR bstrLangCode,
			/* [retval][out] */ BSTR __RPC_FAR *pAnalysisMarkers);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LangCodes )(
			ICSHook __RPC_FAR * This,
			/* [retval][out] */ VARIANT __RPC_FAR *pVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LangCodesString )(
			ICSHook __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_CurrentIntergenWordMarker )(
			ICSHook __RPC_FAR * This,
			/* [in] */ BSTR bstrLangCode,
			/* [retval][out] */ BSTR __RPC_FAR *pWordMarker);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_CurrentTextInIncludeExcludeMarkers )(
			ICSHook __RPC_FAR * This,
			/* [in] */ BSTR bstrLang,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_CurrentTextInIncludeSpecified )(
			ICSHook __RPC_FAR * This,
			/* [in] */ BSTR bstrLang,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		END_INTERFACE
	} ICSHookVtbl;

	interface ICSHook
	{
		CONST_VTBL struct ICSHookVtbl __RPC_FAR *lpVtbl;
	};



#ifdef COBJMACROS


#define ICSHook_QueryInterface(This,riid,ppvObject)	\
	(This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ICSHook_AddRef(This)	\
	(This)->lpVtbl -> AddRef(This)

#define ICSHook_Release(This)	\
	(This)->lpVtbl -> Release(This)


#define ICSHook_GetTypeInfoCount(This,pctinfo)	\
	(This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define ICSHook_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
	(This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define ICSHook_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
	(This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define ICSHook_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
	(This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define ICSHook_PerformTask(This,varICSTask)	\
	(This)->lpVtbl -> PerformTask(This,varICSTask)

#define ICSHook_get_CurrentIntergenAnalysisMarkers(This,bstrLangCode,pAnalysisMarkers)	\
	(This)->lpVtbl -> get_CurrentIntergenAnalysisMarkers(This,bstrLangCode,pAnalysisMarkers)

#define ICSHook_get_LangCodes(This,pVal)	\
	(This)->lpVtbl -> get_LangCodes(This,pVal)

#define ICSHook_get_LangCodesString(This,pVal)	\
	(This)->lpVtbl -> get_LangCodesString(This,pVal)

#define ICSHook_get_CurrentIntergenWordMarker(This,bstrLangCode,pWordMarker)	\
	(This)->lpVtbl -> get_CurrentIntergenWordMarker(This,bstrLangCode,pWordMarker)

#define ICSHook_get_CurrentTextInIncludeExcludeMarkers(This,bstrLang,pVal)	\
	(This)->lpVtbl -> get_CurrentTextInIncludeExcludeMarkers(This,bstrLang,pVal)

#define ICSHook_get_CurrentTextInIncludeSpecified(This,bstrLang,pVal)	\
	(This)->lpVtbl -> get_CurrentTextInIncludeSpecified(This,bstrLang,pVal)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ICSHook_PerformTask_Proxy(
	ICSHook __RPC_FAR * This,
	/* [in] */ VARIANT varICSTask);


void __RPC_STUB ICSHook_PerformTask_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_CurrentIntergenAnalysisMarkers_Proxy(
	ICSHook __RPC_FAR * This,
	/* [in] */ BSTR bstrLangCode,
	/* [retval][out] */ BSTR __RPC_FAR *pAnalysisMarkers);


void __RPC_STUB ICSHook_get_CurrentIntergenAnalysisMarkers_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_LangCodes_Proxy(
	ICSHook __RPC_FAR * This,
	/* [retval][out] */ VARIANT __RPC_FAR *pVal);


void __RPC_STUB ICSHook_get_LangCodes_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_LangCodesString_Proxy(
	ICSHook __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ICSHook_get_LangCodesString_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_CurrentIntergenWordMarker_Proxy(
	ICSHook __RPC_FAR * This,
	/* [in] */ BSTR bstrLangCode,
	/* [retval][out] */ BSTR __RPC_FAR *pWordMarker);


void __RPC_STUB ICSHook_get_CurrentIntergenWordMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_CurrentTextInIncludeExcludeMarkers_Proxy(
	ICSHook __RPC_FAR * This,
	/* [in] */ BSTR bstrLang,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB ICSHook_get_CurrentTextInIncludeExcludeMarkers_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_CurrentTextInIncludeSpecified_Proxy(
	ICSHook __RPC_FAR * This,
	/* [in] */ BSTR bstrLang,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB ICSHook_get_CurrentTextInIncludeSpecified_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);



#endif 	/* __ICSHook_INTERFACE_DEFINED__ */


#ifndef __IParseCS_INTERFACE_DEFINED__
#define __IParseCS_INTERFACE_DEFINED__

/* interface IParseCS */
/* [unique][helpstring][dual][uuid][object] */


EXTERN_C const IID IID_IParseCS;

#if defined(__cplusplus) && !defined(CINTERFACE)

	MIDL_INTERFACE("6698ECD9-76C3-48C7-939E-BD39BFE27455")
	IParseCS : public IDispatch
	{
	public:
		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ParseString(
			/* [in] */ BSTR bstrPhrase,
			/* [in] */ BOOL bTrace,
			/* [in] */ BSTR bstrTraceWords,
			/* [in] */ BOOL bForceRefresh,
			/* [retval][out] */ BSTR __RPC_FAR *pbstrResult) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Options(
			/* [retval][out] */ long __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Options(
			/* [in] */ long newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LangCodesString(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SourceLangeCode(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_SourceLangeCode(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ParseFile(
			BSTR sInputFilePath,
			BSTR sOutputFilePath,
			BOOL bForceRefresh) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LangInfoXML(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

	};

#else 	/* C style interface */

	typedef struct IParseCSVtbl
	{
		BEGIN_INTERFACE

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )(
			IParseCS __RPC_FAR * This,
			/* [in] */ REFIID riid,
			/* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);

		ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )(
			IParseCS __RPC_FAR * This);

		ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )(
			IParseCS __RPC_FAR * This);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )(
			IParseCS __RPC_FAR * This,
			/* [out] */ UINT __RPC_FAR *pctinfo);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )(
			IParseCS __RPC_FAR * This,
			/* [in] */ UINT iTInfo,
			/* [in] */ LCID lcid,
			/* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )(
			IParseCS __RPC_FAR * This,
			/* [in] */ REFIID riid,
			/* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
			/* [in] */ UINT cNames,
			/* [in] */ LCID lcid,
			/* [size_is][out] */ DISPID __RPC_FAR *rgDispId);

		/* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )(
			IParseCS __RPC_FAR * This,
			/* [in] */ DISPID dispIdMember,
			/* [in] */ REFIID riid,
			/* [in] */ LCID lcid,
			/* [in] */ WORD wFlags,
			/* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
			/* [out] */ VARIANT __RPC_FAR *pVarResult,
			/* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
			/* [out] */ UINT __RPC_FAR *puArgErr);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ParseString )(
			IParseCS __RPC_FAR * This,
			/* [in] */ BSTR bstrPhrase,
			/* [in] */ BOOL bTrace,
			/* [in] */ BSTR bstrTraceWords,
			/* [in] */ BOOL bForceRefresh,
			/* [retval][out] */ BSTR __RPC_FAR *pbstrResult);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_Options )(
			IParseCS __RPC_FAR * This,
			/* [retval][out] */ long __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_Options )(
			IParseCS __RPC_FAR * This,
			/* [in] */ long newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LangCodesString )(
			IParseCS __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_SourceLangeCode )(
			IParseCS __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_SourceLangeCode )(
			IParseCS __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ParseFile )(
			IParseCS __RPC_FAR * This,
			BSTR sInputFilePath,
			BSTR sOutputFilePath,
			BOOL bForceRefresh);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LangInfoXML )(
			IParseCS __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		END_INTERFACE
	} IParseCSVtbl;

	interface IParseCS
	{
		CONST_VTBL struct IParseCSVtbl __RPC_FAR *lpVtbl;
	};



#ifdef COBJMACROS


#define IParseCS_QueryInterface(This,riid,ppvObject)	\
	(This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IParseCS_AddRef(This)	\
	(This)->lpVtbl -> AddRef(This)

#define IParseCS_Release(This)	\
	(This)->lpVtbl -> Release(This)


#define IParseCS_GetTypeInfoCount(This,pctinfo)	\
	(This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IParseCS_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
	(This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IParseCS_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
	(This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IParseCS_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
	(This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IParseCS_ParseString(This,bstrPhrase,bTrace,bstrTraceWords,bForceRefresh,pbstrResult)	\
	(This)->lpVtbl -> ParseString(This,bstrPhrase,bTrace,bstrTraceWords,bForceRefresh,pbstrResult)

#define IParseCS_get_Options(This,pVal)	\
	(This)->lpVtbl -> get_Options(This,pVal)

#define IParseCS_put_Options(This,newVal)	\
	(This)->lpVtbl -> put_Options(This,newVal)

#define IParseCS_get_LangCodesString(This,pVal)	\
	(This)->lpVtbl -> get_LangCodesString(This,pVal)

#define IParseCS_get_SourceLangeCode(This,pVal)	\
	(This)->lpVtbl -> get_SourceLangeCode(This,pVal)

#define IParseCS_put_SourceLangeCode(This,newVal)	\
	(This)->lpVtbl -> put_SourceLangeCode(This,newVal)

#define IParseCS_ParseFile(This,sInputFilePath,sOutputFilePath,bForceRefresh)	\
	(This)->lpVtbl -> ParseFile(This,sInputFilePath,sOutputFilePath,bForceRefresh)

#define IParseCS_get_LangInfoXML(This,pVal)	\
	(This)->lpVtbl -> get_LangInfoXML(This,pVal)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IParseCS_ParseString_Proxy(
	IParseCS __RPC_FAR * This,
	/* [in] */ BSTR bstrPhrase,
	/* [in] */ BOOL bTrace,
	/* [in] */ BSTR bstrTraceWords,
	/* [in] */ BOOL bForceRefresh,
	/* [retval][out] */ BSTR __RPC_FAR *pbstrResult);


void __RPC_STUB IParseCS_ParseString_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IParseCS_get_Options_Proxy(
	IParseCS __RPC_FAR * This,
	/* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IParseCS_get_Options_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IParseCS_put_Options_Proxy(
	IParseCS __RPC_FAR * This,
	/* [in] */ long newVal);


void __RPC_STUB IParseCS_put_Options_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IParseCS_get_LangCodesString_Proxy(
	IParseCS __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IParseCS_get_LangCodesString_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IParseCS_get_SourceLangeCode_Proxy(
	IParseCS __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IParseCS_get_SourceLangeCode_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IParseCS_put_SourceLangeCode_Proxy(
	IParseCS __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB IParseCS_put_SourceLangeCode_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IParseCS_ParseFile_Proxy(
	IParseCS __RPC_FAR * This,
	BSTR sInputFilePath,
	BSTR sOutputFilePath,
	BOOL bForceRefresh);


void __RPC_STUB IParseCS_ParseFile_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IParseCS_get_LangInfoXML_Proxy(
	IParseCS __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IParseCS_get_LangInfoXML_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);



#endif 	/* __IParseCS_INTERFACE_DEFINED__ */



#ifndef __CStudioLib_LIBRARY_DEFINED__
#define __CStudioLib_LIBRARY_DEFINED__

/* library CStudioLib */
/* [helpstring][version][uuid] */


EXTERN_C const IID LIBID_CStudioLib;

EXTERN_C const CLSID CLSID_CSHook;

#ifdef __cplusplus

class DECLSPEC_UUID("11EC31D7-094D-11D3-8664-88970CC10000")
CSHook;
#endif

EXTERN_C const CLSID CLSID_ParseCS;

#ifdef __cplusplus

class DECLSPEC_UUID("5A2AFAD2-B372-4F91-AD5D-23905E202EE3")
ParseCS;
#endif
#endif /* __CStudioLib_LIBRARY_DEFINED__ */

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
