/* this ALWAYS GENERATED file contains the proxy stub code */


/* File created by MIDL compiler version 5.01.0164 */
/* at Wed Aug 28 09:09:55 2002
 */
/* Compiler settings for C:\carla\KeywordsColoring2\source\CStudioCOM.idl:
	Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
	error checks: allocation ref bounds_check enum stub_data
*/
//@@MIDL_FILE_HEADING(  )


/* verify that the <rpcproxy.h> version is high enough to compile this file*/
#ifndef __REDQ_RPCPROXY_H_VERSION__
#define __REQUIRED_RPCPROXY_H_VERSION__ 440
#endif


#include "rpcproxy.h"
#ifndef __RPCPROXY_H_VERSION__
#error this stub requires an updated version of <rpcproxy.h>
#endif // __RPCPROXY_H_VERSION__


#include "CStudioCOM.h"

#define TYPE_FORMAT_STRING_SIZE   1021
#define PROC_FORMAT_STRING_SIZE   85

typedef struct _MIDL_TYPE_FORMAT_STRING
	{
	short          Pad;
	unsigned char  Format[ TYPE_FORMAT_STRING_SIZE ];
	} MIDL_TYPE_FORMAT_STRING;

typedef struct _MIDL_PROC_FORMAT_STRING
	{
	short          Pad;
	unsigned char  Format[ PROC_FORMAT_STRING_SIZE ];
	} MIDL_PROC_FORMAT_STRING;


extern const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString;
extern const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString;


/* Object interface: IUnknown, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: IDispatch, ver. 0.0,
   GUID={0x00020400,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: ICSHook, ver. 0.0,
   GUID={0x11EC31D6,0x094D,0x11D3,{0x86,0x64,0x88,0x97,0x0C,0xC1,0x00,0x00}} */


extern const MIDL_STUB_DESC Object_StubDesc;


#pragma code_seg(".orpc")

/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ICSHook_PerformTask_Proxy(
	ICSHook __RPC_FAR * This,
	/* [in] */ VARIANT varICSTask)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  7);



		RpcTryFinally
			{

			_StubMsg.BufferLength = 8U;
			NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR *)&varICSTask,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[960] );

			NdrProxyGetBuffer(This, &_StubMsg);
			NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
									(unsigned char __RPC_FAR *)&varICSTask,
									(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[960] );

			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[0] );

			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB ICSHook_PerformTask_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	void __RPC_FAR *_p_varICSTask;
	VARIANT varICSTask;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	_p_varICSTask = &varICSTask;
	MIDL_memset(
			   _p_varICSTask,
			   0,
			   sizeof( VARIANT  ));
	RpcTryFinally
		{
		if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
			NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[0] );

		NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_varICSTask,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[960],
								  (unsigned char)0 );


		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((ICSHook*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> PerformTask((ICSHook *) ((CStdStubBuffer *)This)->pvServerObject,varICSTask);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 4U;
		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrUserMarshalFree( &_StubMsg,
							(unsigned char __RPC_FAR *)&varICSTask,
							&__MIDL_TypeFormatString.Format[960] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_CurrentIntergenAnalysisMarkers_Proxy(
	ICSHook __RPC_FAR * This,
	/* [in] */ BSTR bstrLangCode,
	/* [retval][out] */ BSTR __RPC_FAR *pAnalysisMarkers)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	if(pAnalysisMarkers)
		{
		MIDL_memset(
			   pAnalysisMarkers,
			   0,
			   sizeof( BSTR  ));
		}
	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  8);



		if(!pAnalysisMarkers)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 8U;
			NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR *)&bstrLangCode,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxyGetBuffer(This, &_StubMsg);
			NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
									(unsigned char __RPC_FAR *)&bstrLangCode,
									(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[6] );

			NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR * __RPC_FAR *)&pAnalysisMarkers,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988],
									  (unsigned char)0 );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[980],
						 ( void __RPC_FAR * )pAnalysisMarkers);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB ICSHook_get_CurrentIntergenAnalysisMarkers_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	BSTR _M0;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	void __RPC_FAR *_p_bstrLangCode;
	BSTR bstrLangCode;
	BSTR __RPC_FAR *pAnalysisMarkers;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	_p_bstrLangCode = &bstrLangCode;
	MIDL_memset(
			   _p_bstrLangCode,
			   0,
			   sizeof( BSTR  ));
	( BSTR __RPC_FAR * )pAnalysisMarkers = 0;
	RpcTryFinally
		{
		if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
			NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[6] );

		NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_bstrLangCode,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970],
								  (unsigned char)0 );

		pAnalysisMarkers = &_M0;
		MIDL_memset(
			   pAnalysisMarkers,
			   0,
			   sizeof( BSTR  ));

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((ICSHook*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_CurrentIntergenAnalysisMarkers(
									  (ICSHook *) ((CStdStubBuffer *)This)->pvServerObject,
									  bstrLangCode,
									  pAnalysisMarkers);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 8U + 11U;
		NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR *)pAnalysisMarkers,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.BufferLength += 16;

		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
								(unsigned char __RPC_FAR *)pAnalysisMarkers,
								(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrUserMarshalFree( &_StubMsg,
							(unsigned char __RPC_FAR *)&bstrLangCode,
							&__MIDL_TypeFormatString.Format[970] );

		NdrPointerFree( &_StubMsg,
						(unsigned char __RPC_FAR *)pAnalysisMarkers,
						&__MIDL_TypeFormatString.Format[980] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_LangCodes_Proxy(
	ICSHook __RPC_FAR * This,
	/* [retval][out] */ VARIANT __RPC_FAR *pVal)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	if(pVal)
		{
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( VARIANT  ));
		}
	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  9);



		if(!pVal)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 0U;
			NdrProxyGetBuffer(This, &_StubMsg);
			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[16] );

			NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR * __RPC_FAR *)&pVal,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[1006],
									  (unsigned char)0 );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[998],
						 ( void __RPC_FAR * )pVal);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB ICSHook_get_LangCodes_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	VARIANT _M1;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	VARIANT __RPC_FAR *pVal;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	( VARIANT __RPC_FAR * )pVal = 0;
	RpcTryFinally
		{
		pVal = &_M1;
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( VARIANT  ));

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((ICSHook*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_LangCodes((ICSHook *) ((CStdStubBuffer *)This)->pvServerObject,pVal);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 8U + 11U;
		NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR *)pVal,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[1006] );

		_StubMsg.BufferLength += 16;

		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
								(unsigned char __RPC_FAR *)pVal,
								(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[1006] );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrPointerFree( &_StubMsg,
						(unsigned char __RPC_FAR *)pVal,
						&__MIDL_TypeFormatString.Format[998] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_LangCodesString_Proxy(
	ICSHook __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	if(pVal)
		{
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( BSTR  ));
		}
	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  10);



		if(!pVal)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 0U;
			NdrProxyGetBuffer(This, &_StubMsg);
			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[22] );

			NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR * __RPC_FAR *)&pVal,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988],
									  (unsigned char)0 );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[980],
						 ( void __RPC_FAR * )pVal);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB ICSHook_get_LangCodesString_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	BSTR _M2;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	BSTR __RPC_FAR *pVal;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	( BSTR __RPC_FAR * )pVal = 0;
	RpcTryFinally
		{
		pVal = &_M2;
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( BSTR  ));

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((ICSHook*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_LangCodesString((ICSHook *) ((CStdStubBuffer *)This)->pvServerObject,pVal);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 8U + 11U;
		NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR *)pVal,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.BufferLength += 16;

		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
								(unsigned char __RPC_FAR *)pVal,
								(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrPointerFree( &_StubMsg,
						(unsigned char __RPC_FAR *)pVal,
						&__MIDL_TypeFormatString.Format[980] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_CurrentIntergenWordMarker_Proxy(
	ICSHook __RPC_FAR * This,
	/* [in] */ BSTR bstrLangCode,
	/* [retval][out] */ BSTR __RPC_FAR *pWordMarker)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	if(pWordMarker)
		{
		MIDL_memset(
			   pWordMarker,
			   0,
			   sizeof( BSTR  ));
		}
	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  11);



		if(!pWordMarker)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 8U;
			NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR *)&bstrLangCode,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxyGetBuffer(This, &_StubMsg);
			NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
									(unsigned char __RPC_FAR *)&bstrLangCode,
									(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[6] );

			NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR * __RPC_FAR *)&pWordMarker,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988],
									  (unsigned char)0 );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[980],
						 ( void __RPC_FAR * )pWordMarker);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB ICSHook_get_CurrentIntergenWordMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	BSTR _M3;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	void __RPC_FAR *_p_bstrLangCode;
	BSTR bstrLangCode;
	BSTR __RPC_FAR *pWordMarker;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	_p_bstrLangCode = &bstrLangCode;
	MIDL_memset(
			   _p_bstrLangCode,
			   0,
			   sizeof( BSTR  ));
	( BSTR __RPC_FAR * )pWordMarker = 0;
	RpcTryFinally
		{
		if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
			NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[6] );

		NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_bstrLangCode,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970],
								  (unsigned char)0 );

		pWordMarker = &_M3;
		MIDL_memset(
			   pWordMarker,
			   0,
			   sizeof( BSTR  ));

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((ICSHook*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_CurrentIntergenWordMarker(
								 (ICSHook *) ((CStdStubBuffer *)This)->pvServerObject,
								 bstrLangCode,
								 pWordMarker);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 8U + 11U;
		NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR *)pWordMarker,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.BufferLength += 16;

		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
								(unsigned char __RPC_FAR *)pWordMarker,
								(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrUserMarshalFree( &_StubMsg,
							(unsigned char __RPC_FAR *)&bstrLangCode,
							&__MIDL_TypeFormatString.Format[970] );

		NdrPointerFree( &_StubMsg,
						(unsigned char __RPC_FAR *)pWordMarker,
						&__MIDL_TypeFormatString.Format[980] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_CurrentTextInIncludeExcludeMarkers_Proxy(
	ICSHook __RPC_FAR * This,
	/* [in] */ BSTR bstrLang,
	/* [retval][out] */ BSTR __RPC_FAR *pVal)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	if(pVal)
		{
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( BSTR  ));
		}
	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  12);



		if(!pVal)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 8U;
			NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR *)&bstrLang,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxyGetBuffer(This, &_StubMsg);
			NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
									(unsigned char __RPC_FAR *)&bstrLang,
									(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[6] );

			NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR * __RPC_FAR *)&pVal,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988],
									  (unsigned char)0 );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[980],
						 ( void __RPC_FAR * )pVal);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB ICSHook_get_CurrentTextInIncludeExcludeMarkers_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	BSTR _M4;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	void __RPC_FAR *_p_bstrLang;
	BSTR bstrLang;
	BSTR __RPC_FAR *pVal;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	_p_bstrLang = &bstrLang;
	MIDL_memset(
			   _p_bstrLang,
			   0,
			   sizeof( BSTR  ));
	( BSTR __RPC_FAR * )pVal = 0;
	RpcTryFinally
		{
		if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
			NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[6] );

		NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_bstrLang,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970],
								  (unsigned char)0 );

		pVal = &_M4;
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( BSTR  ));

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((ICSHook*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_CurrentTextInIncludeExcludeMarkers(
										  (ICSHook *) ((CStdStubBuffer *)This)->pvServerObject,
										  bstrLang,
										  pVal);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 8U + 11U;
		NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR *)pVal,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.BufferLength += 16;

		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
								(unsigned char __RPC_FAR *)pVal,
								(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrUserMarshalFree( &_StubMsg,
							(unsigned char __RPC_FAR *)&bstrLang,
							&__MIDL_TypeFormatString.Format[970] );

		NdrPointerFree( &_StubMsg,
						(unsigned char __RPC_FAR *)pVal,
						&__MIDL_TypeFormatString.Format[980] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE ICSHook_get_CurrentTextInIncludeSpecified_Proxy(
	ICSHook __RPC_FAR * This,
	/* [in] */ BSTR bstrLang,
	/* [retval][out] */ BOOL __RPC_FAR *pVal)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  13);



		if(!pVal)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 8U;
			NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR *)&bstrLang,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxyGetBuffer(This, &_StubMsg);
			NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
									(unsigned char __RPC_FAR *)&bstrLang,
									(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[28] );

			*pVal = *(( BOOL __RPC_FAR * )_StubMsg.Buffer)++;

			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[1016],
						 ( void __RPC_FAR * )pVal);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB ICSHook_get_CurrentTextInIncludeSpecified_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	BOOL _M5;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	void __RPC_FAR *_p_bstrLang;
	BSTR bstrLang;
	BOOL __RPC_FAR *pVal;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	_p_bstrLang = &bstrLang;
	MIDL_memset(
			   _p_bstrLang,
			   0,
			   sizeof( BSTR  ));
	( BOOL __RPC_FAR * )pVal = 0;
	RpcTryFinally
		{
		if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
			NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[28] );

		NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_bstrLang,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970],
								  (unsigned char)0 );

		pVal = &_M5;

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((ICSHook*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_CurrentTextInIncludeSpecified(
									 (ICSHook *) ((CStdStubBuffer *)This)->pvServerObject,
									 bstrLang,
									 pVal);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 4U + 4U;
		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		*(( BOOL __RPC_FAR * )_StubMsg.Buffer)++ = *pVal;

		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrUserMarshalFree( &_StubMsg,
							(unsigned char __RPC_FAR *)&bstrLang,
							&__MIDL_TypeFormatString.Format[970] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}

CINTERFACE_PROXY_VTABLE(14) _ICSHookProxyVtbl =
{
	&IID_ICSHook,
	IUnknown_QueryInterface_Proxy,
	IUnknown_AddRef_Proxy,
	IUnknown_Release_Proxy ,
	0 /* IDispatch_GetTypeInfoCount_Proxy */ ,
	0 /* IDispatch_GetTypeInfo_Proxy */ ,
	0 /* IDispatch_GetIDsOfNames_Proxy */ ,
	0 /* IDispatch_Invoke_Proxy */ ,
	ICSHook_PerformTask_Proxy ,
	ICSHook_get_CurrentIntergenAnalysisMarkers_Proxy ,
	ICSHook_get_LangCodes_Proxy ,
	ICSHook_get_LangCodesString_Proxy ,
	ICSHook_get_CurrentIntergenWordMarker_Proxy ,
	ICSHook_get_CurrentTextInIncludeExcludeMarkers_Proxy ,
	ICSHook_get_CurrentTextInIncludeSpecified_Proxy
};


static const PRPC_STUB_FUNCTION ICSHook_table[] =
{
	STUB_FORWARDING_FUNCTION,
	STUB_FORWARDING_FUNCTION,
	STUB_FORWARDING_FUNCTION,
	STUB_FORWARDING_FUNCTION,
	ICSHook_PerformTask_Stub,
	ICSHook_get_CurrentIntergenAnalysisMarkers_Stub,
	ICSHook_get_LangCodes_Stub,
	ICSHook_get_LangCodesString_Stub,
	ICSHook_get_CurrentIntergenWordMarker_Stub,
	ICSHook_get_CurrentTextInIncludeExcludeMarkers_Stub,
	ICSHook_get_CurrentTextInIncludeSpecified_Stub
};

CInterfaceStubVtbl _ICSHookStubVtbl =
{
	&IID_ICSHook,
	0,
	14,
	&ICSHook_table[-3],
	CStdStubBuffer_DELEGATING_METHODS
};


/* Object interface: IParseCS, ver. 0.0,
   GUID={0x6698ECD9,0x76C3,0x48C7,{0x93,0x9E,0xBD,0x39,0xBF,0xE2,0x74,0x55}} */


extern const MIDL_STUB_DESC Object_StubDesc;


#pragma code_seg(".orpc")

/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IParseCS_ParseString_Proxy(
	IParseCS __RPC_FAR * This,
	/* [in] */ BSTR bstrPhrase,
	/* [in] */ BOOL bTrace,
	/* [in] */ BSTR bstrTraceWords,
	/* [in] */ BOOL bForceRefresh,
	/* [retval][out] */ BSTR __RPC_FAR *pbstrResult)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	if(pbstrResult)
		{
		MIDL_memset(
			   pbstrResult,
			   0,
			   sizeof( BSTR  ));
		}
	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  7);



		if(!pbstrResult)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 8U + 11U + 11U + 11U;
			NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR *)&bstrPhrase,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR *)&bstrTraceWords,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxyGetBuffer(This, &_StubMsg);
			NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
									(unsigned char __RPC_FAR *)&bstrPhrase,
									(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			*(( BOOL __RPC_FAR * )_StubMsg.Buffer)++ = bTrace;

			NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
									(unsigned char __RPC_FAR *)&bstrTraceWords,
									(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			*(( BOOL __RPC_FAR * )_StubMsg.Buffer)++ = bForceRefresh;

			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[38] );

			NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR * __RPC_FAR *)&pbstrResult,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988],
									  (unsigned char)0 );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[980],
						 ( void __RPC_FAR * )pbstrResult);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB IParseCS_ParseString_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	BSTR _M6;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	void __RPC_FAR *_p_bstrPhrase;
	void __RPC_FAR *_p_bstrTraceWords;
	BOOL bForceRefresh;
	BOOL bTrace;
	BSTR bstrPhrase;
	BSTR bstrTraceWords;
	BSTR __RPC_FAR *pbstrResult;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	_p_bstrPhrase = &bstrPhrase;
	MIDL_memset(
			   _p_bstrPhrase,
			   0,
			   sizeof( BSTR  ));
	_p_bstrTraceWords = &bstrTraceWords;
	MIDL_memset(
			   _p_bstrTraceWords,
			   0,
			   sizeof( BSTR  ));
	( BSTR __RPC_FAR * )pbstrResult = 0;
	RpcTryFinally
		{
		if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
			NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[38] );

		NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_bstrPhrase,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970],
								  (unsigned char)0 );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		bTrace = *(( BOOL __RPC_FAR * )_StubMsg.Buffer)++;

		NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_bstrTraceWords,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970],
								  (unsigned char)0 );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		bForceRefresh = *(( BOOL __RPC_FAR * )_StubMsg.Buffer)++;

		pbstrResult = &_M6;
		MIDL_memset(
			   pbstrResult,
			   0,
			   sizeof( BSTR  ));

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((IParseCS*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ParseString(
			   (IParseCS *) ((CStdStubBuffer *)This)->pvServerObject,
			   bstrPhrase,
			   bTrace,
			   bstrTraceWords,
			   bForceRefresh,
			   pbstrResult);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 8U + 11U;
		NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR *)pbstrResult,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.BufferLength += 16;

		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
								(unsigned char __RPC_FAR *)pbstrResult,
								(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrUserMarshalFree( &_StubMsg,
							(unsigned char __RPC_FAR *)&bstrPhrase,
							&__MIDL_TypeFormatString.Format[970] );

		NdrUserMarshalFree( &_StubMsg,
							(unsigned char __RPC_FAR *)&bstrTraceWords,
							&__MIDL_TypeFormatString.Format[970] );

		NdrPointerFree( &_StubMsg,
						(unsigned char __RPC_FAR *)pbstrResult,
						&__MIDL_TypeFormatString.Format[980] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IParseCS_get_Options_Proxy(
	IParseCS __RPC_FAR * This,
	/* [retval][out] */ long __RPC_FAR *pVal)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  8);



		if(!pVal)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 0U;
			NdrProxyGetBuffer(This, &_StubMsg);
			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[56] );

			*pVal = *(( long __RPC_FAR * )_StubMsg.Buffer)++;

			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[1016],
						 ( void __RPC_FAR * )pVal);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB IParseCS_get_Options_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	long _M7;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	long __RPC_FAR *pVal;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	( long __RPC_FAR * )pVal = 0;
	RpcTryFinally
		{
		pVal = &_M7;

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((IParseCS*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_Options((IParseCS *) ((CStdStubBuffer *)This)->pvServerObject,pVal);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 4U + 4U;
		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		*(( long __RPC_FAR * )_StubMsg.Buffer)++ = *pVal;

		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IParseCS_put_Options_Proxy(
	IParseCS __RPC_FAR * This,
	/* [in] */ long newVal)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  9);



		RpcTryFinally
			{

			_StubMsg.BufferLength = 4U;
			NdrProxyGetBuffer(This, &_StubMsg);
			*(( long __RPC_FAR * )_StubMsg.Buffer)++ = newVal;

			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[62] );

			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB IParseCS_put_Options_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	long newVal;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	RpcTryFinally
		{
		if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
			NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[62] );

		newVal = *(( long __RPC_FAR * )_StubMsg.Buffer)++;


		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((IParseCS*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> put_Options((IParseCS *) ((CStdStubBuffer *)This)->pvServerObject,newVal);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 4U;
		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IParseCS_get_LangCodesString_Proxy(
	IParseCS __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	if(pVal)
		{
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( BSTR  ));
		}
	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  10);



		if(!pVal)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 0U;
			NdrProxyGetBuffer(This, &_StubMsg);
			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[22] );

			NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR * __RPC_FAR *)&pVal,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988],
									  (unsigned char)0 );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[980],
						 ( void __RPC_FAR * )pVal);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB IParseCS_get_LangCodesString_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	BSTR _M8;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	BSTR __RPC_FAR *pVal;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	( BSTR __RPC_FAR * )pVal = 0;
	RpcTryFinally
		{
		pVal = &_M8;
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( BSTR  ));

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((IParseCS*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_LangCodesString((IParseCS *) ((CStdStubBuffer *)This)->pvServerObject,pVal);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 8U + 11U;
		NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR *)pVal,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.BufferLength += 16;

		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
								(unsigned char __RPC_FAR *)pVal,
								(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrPointerFree( &_StubMsg,
						(unsigned char __RPC_FAR *)pVal,
						&__MIDL_TypeFormatString.Format[980] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IParseCS_get_SourceLangeCode_Proxy(
	IParseCS __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	if(pVal)
		{
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( BSTR  ));
		}
	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  11);



		if(!pVal)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 0U;
			NdrProxyGetBuffer(This, &_StubMsg);
			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[22] );

			NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR * __RPC_FAR *)&pVal,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988],
									  (unsigned char)0 );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[980],
						 ( void __RPC_FAR * )pVal);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB IParseCS_get_SourceLangeCode_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	BSTR _M9;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	BSTR __RPC_FAR *pVal;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	( BSTR __RPC_FAR * )pVal = 0;
	RpcTryFinally
		{
		pVal = &_M9;
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( BSTR  ));

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((IParseCS*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_SourceLangeCode((IParseCS *) ((CStdStubBuffer *)This)->pvServerObject,pVal);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 8U + 11U;
		NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR *)pVal,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.BufferLength += 16;

		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
								(unsigned char __RPC_FAR *)pVal,
								(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrPointerFree( &_StubMsg,
						(unsigned char __RPC_FAR *)pVal,
						&__MIDL_TypeFormatString.Format[980] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IParseCS_put_SourceLangeCode_Proxy(
	IParseCS __RPC_FAR * This,
	/* [in] */ BSTR newVal)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  12);



		RpcTryFinally
			{

			_StubMsg.BufferLength = 8U;
			NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR *)&newVal,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxyGetBuffer(This, &_StubMsg);
			NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
									(unsigned char __RPC_FAR *)&newVal,
									(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[66] );

			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB IParseCS_put_SourceLangeCode_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	void __RPC_FAR *_p_newVal;
	BSTR newVal;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	_p_newVal = &newVal;
	MIDL_memset(
			   _p_newVal,
			   0,
			   sizeof( BSTR  ));
	RpcTryFinally
		{
		if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
			NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[66] );

		NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_newVal,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970],
								  (unsigned char)0 );


		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((IParseCS*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> put_SourceLangeCode((IParseCS *) ((CStdStubBuffer *)This)->pvServerObject,newVal);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 4U;
		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrUserMarshalFree( &_StubMsg,
							(unsigned char __RPC_FAR *)&newVal,
							&__MIDL_TypeFormatString.Format[970] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IParseCS_ParseFile_Proxy(
	IParseCS __RPC_FAR * This,
	BSTR sInputFilePath,
	BSTR sOutputFilePath,
	BOOL bForceRefresh)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  13);



		RpcTryFinally
			{

			_StubMsg.BufferLength = 8U + 15U + 11U;
			NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR *)&sInputFilePath,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR *)&sOutputFilePath,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrProxyGetBuffer(This, &_StubMsg);
			NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
									(unsigned char __RPC_FAR *)&sInputFilePath,
									(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
									(unsigned char __RPC_FAR *)&sOutputFilePath,
									(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970] );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			*(( BOOL __RPC_FAR * )_StubMsg.Buffer)++ = bForceRefresh;

			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[72] );

			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB IParseCS_ParseFile_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	void __RPC_FAR *_p_sInputFilePath;
	void __RPC_FAR *_p_sOutputFilePath;
	BOOL bForceRefresh;
	BSTR sInputFilePath;
	BSTR sOutputFilePath;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	_p_sInputFilePath = &sInputFilePath;
	MIDL_memset(
			   _p_sInputFilePath,
			   0,
			   sizeof( BSTR  ));
	_p_sOutputFilePath = &sOutputFilePath;
	MIDL_memset(
			   _p_sOutputFilePath,
			   0,
			   sizeof( BSTR  ));
	RpcTryFinally
		{
		if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
			NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[72] );

		NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_sInputFilePath,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970],
								  (unsigned char)0 );

		NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_sOutputFilePath,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[970],
								  (unsigned char)0 );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		bForceRefresh = *(( BOOL __RPC_FAR * )_StubMsg.Buffer)++;


		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((IParseCS*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ParseFile(
			 (IParseCS *) ((CStdStubBuffer *)This)->pvServerObject,
			 sInputFilePath,
			 sOutputFilePath,
			 bForceRefresh);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 4U;
		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrUserMarshalFree( &_StubMsg,
							(unsigned char __RPC_FAR *)&sInputFilePath,
							&__MIDL_TypeFormatString.Format[970] );

		NdrUserMarshalFree( &_StubMsg,
							(unsigned char __RPC_FAR *)&sOutputFilePath,
							&__MIDL_TypeFormatString.Format[970] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IParseCS_get_LangInfoXML_Proxy(
	IParseCS __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal)
{

	HRESULT _RetVal;

	RPC_MESSAGE _RpcMessage;

	MIDL_STUB_MESSAGE _StubMsg;

	if(pVal)
		{
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( BSTR  ));
		}
	RpcTryExcept
		{
		NdrProxyInitialize(
					  ( void __RPC_FAR *  )This,
					  ( PRPC_MESSAGE  )&_RpcMessage,
					  ( PMIDL_STUB_MESSAGE  )&_StubMsg,
					  ( PMIDL_STUB_DESC  )&Object_StubDesc,
					  14);



		if(!pVal)
			{
			RpcRaiseException(RPC_X_NULL_REF_POINTER);
			}
		RpcTryFinally
			{

			_StubMsg.BufferLength = 0U;
			NdrProxyGetBuffer(This, &_StubMsg);
			NdrProxySendReceive(This, &_StubMsg);

			if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
				NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[22] );

			NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
									  (unsigned char __RPC_FAR * __RPC_FAR *)&pVal,
									  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988],
									  (unsigned char)0 );

			_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
			_RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;

			}
		RpcFinally
			{
			NdrProxyFreeBuffer(This, &_StubMsg);

			}
		RpcEndFinally

		}
	RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
		{
		NdrClearOutParameters(
						 ( PMIDL_STUB_MESSAGE  )&_StubMsg,
						 ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[980],
						 ( void __RPC_FAR * )pVal);
		_RetVal = NdrProxyErrorHandler(RpcExceptionCode());
		}
	RpcEndExcept
	return _RetVal;
}

void __RPC_STUB IParseCS_get_LangInfoXML_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase)
{
	BSTR _M10;
	HRESULT _RetVal;
	MIDL_STUB_MESSAGE _StubMsg;
	BSTR __RPC_FAR *pVal;

NdrStubInitialize(
					 _pRpcMessage,
					 &_StubMsg,
					 &Object_StubDesc,
					 _pRpcChannelBuffer);
	( BSTR __RPC_FAR * )pVal = 0;
	RpcTryFinally
		{
		pVal = &_M10;
		MIDL_memset(
			   pVal,
			   0,
			   sizeof( BSTR  ));

		*_pdwStubPhase = STUB_CALL_SERVER;
		_RetVal = (((IParseCS*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> get_LangInfoXML((IParseCS *) ((CStdStubBuffer *)This)->pvServerObject,pVal);

		*_pdwStubPhase = STUB_MARSHAL;

		_StubMsg.BufferLength = 8U + 11U;
		NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
								  (unsigned char __RPC_FAR *)pVal,
								  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.BufferLength += 16;

		NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
		NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
								(unsigned char __RPC_FAR *)pVal,
								(PFORMAT_STRING) &__MIDL_TypeFormatString.Format[988] );

		_StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
		*(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;

		}
	RpcFinally
		{
		NdrPointerFree( &_StubMsg,
						(unsigned char __RPC_FAR *)pVal,
						&__MIDL_TypeFormatString.Format[980] );

		}
	RpcEndFinally
	_pRpcMessage->BufferLength =
		(unsigned int)((long)_StubMsg.Buffer - (long)_pRpcMessage->Buffer);

}

extern const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[2];

static const MIDL_STUB_DESC Object_StubDesc =
	{
	0,
	NdrOleAllocate,
	NdrOleFree,
	0,
	0,
	0,
	0,
	0,
	__MIDL_TypeFormatString.Format,
	1, /* -error bounds_check flag */
	0x20000, /* Ndr library version */
	0,
	0x50100a4, /* MIDL Version 5.1.164 */
	0,
	UserMarshalRoutines,
	0,  /* notify & notify_flag routine table */
	1,  /* Flags */
	0,  /* Reserved3 */
	0,  /* Reserved4 */
	0   /* Reserved5 */
	};

CINTERFACE_PROXY_VTABLE(15) _IParseCSProxyVtbl =
{
	&IID_IParseCS,
	IUnknown_QueryInterface_Proxy,
	IUnknown_AddRef_Proxy,
	IUnknown_Release_Proxy ,
	0 /* IDispatch_GetTypeInfoCount_Proxy */ ,
	0 /* IDispatch_GetTypeInfo_Proxy */ ,
	0 /* IDispatch_GetIDsOfNames_Proxy */ ,
	0 /* IDispatch_Invoke_Proxy */ ,
	IParseCS_ParseString_Proxy ,
	IParseCS_get_Options_Proxy ,
	IParseCS_put_Options_Proxy ,
	IParseCS_get_LangCodesString_Proxy ,
	IParseCS_get_SourceLangeCode_Proxy ,
	IParseCS_put_SourceLangeCode_Proxy ,
	IParseCS_ParseFile_Proxy ,
	IParseCS_get_LangInfoXML_Proxy
};


static const PRPC_STUB_FUNCTION IParseCS_table[] =
{
	STUB_FORWARDING_FUNCTION,
	STUB_FORWARDING_FUNCTION,
	STUB_FORWARDING_FUNCTION,
	STUB_FORWARDING_FUNCTION,
	IParseCS_ParseString_Stub,
	IParseCS_get_Options_Stub,
	IParseCS_put_Options_Stub,
	IParseCS_get_LangCodesString_Stub,
	IParseCS_get_SourceLangeCode_Stub,
	IParseCS_put_SourceLangeCode_Stub,
	IParseCS_ParseFile_Stub,
	IParseCS_get_LangInfoXML_Stub
};

CInterfaceStubVtbl _IParseCSStubVtbl =
{
	&IID_IParseCS,
	0,
	15,
	&IParseCS_table[-3],
	CStdStubBuffer_DELEGATING_METHODS
};

#pragma data_seg(".rdata")

static const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[2] =
		{

			{
			VARIANT_UserSize
			,VARIANT_UserMarshal
			,VARIANT_UserUnmarshal
			,VARIANT_UserFree
			},
			{
			BSTR_UserSize
			,BSTR_UserMarshal
			,BSTR_UserUnmarshal
			,BSTR_UserFree
			}

		};


#if !defined(__RPC_WIN32__)
#error  Invalid build platform for this stub.
#endif

#if !(TARGET_IS_NT40_OR_LATER)
#error You need a Windows NT 4.0 or later to run this stub because it uses these features:
#error   [wire_marshal] or [user_marshal] attribute.
#error However, your C/C++ compilation flags indicate you intend to run this app on earlier systems.
#error This app will die there with the RPC_X_WRONG_STUB_VERSION error.
#endif


static const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString =
	{
		0,
		{

			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x4,		/* x86, MIPS & PPC Stack size = 4 */
#else
			0x4,		/* Alpha Stack size = 4 */
#endif
/*  2 */	NdrFcShort( 0x3c0 ),	/* Type Offset=960 */
/*  4 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/*  6 */
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/*  8 */	NdrFcShort( 0x3ca ),	/* Type Offset=970 */
/* 10 */
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 12 */	NdrFcShort( 0x3d4 ),	/* Type Offset=980 */
/* 14 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 16 */
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 18 */	NdrFcShort( 0x3e6 ),	/* Type Offset=998 */
/* 20 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 22 */
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 24 */	NdrFcShort( 0x3d4 ),	/* Type Offset=980 */
/* 26 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 28 */
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 30 */	NdrFcShort( 0x3ca ),	/* Type Offset=970 */
/* 32 */
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 34 */	NdrFcShort( 0x3f8 ),	/* Type Offset=1016 */
/* 36 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 38 */
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 40 */	NdrFcShort( 0x3ca ),	/* Type Offset=970 */
/* 42 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 44 */
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 46 */	NdrFcShort( 0x3ca ),	/* Type Offset=970 */
/* 48 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 50 */
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 52 */	NdrFcShort( 0x3d4 ),	/* Type Offset=980 */
/* 54 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 56 */
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 58 */	NdrFcShort( 0x3f8 ),	/* Type Offset=1016 */
/* 60 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 62 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 64 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 66 */
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 68 */	NdrFcShort( 0x3ca ),	/* Type Offset=970 */
/* 70 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 72 */
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 74 */	NdrFcShort( 0x3ca ),	/* Type Offset=970 */
/* 76 */
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC Stack size = 1 */
#else
			0x2,		/* Alpha Stack size = 2 */
#endif
/* 78 */	NdrFcShort( 0x3ca ),	/* Type Offset=970 */
/* 80 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 82 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */

			0x0
		}
	};

static const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString =
	{
		0,
		{
			NdrFcShort( 0x0 ),	/* 0 */
/*  2 */
			0x12, 0x0,	/* FC_UP */
/*  4 */	NdrFcShort( 0x3a8 ),	/* Offset= 936 (940) */
/*  6 */
			0x2b,		/* FC_NON_ENCAPSULATED_UNION */
			0x9,		/* FC_ULONG */
/*  8 */	0x7,		/* Corr desc: FC_USHORT */
			0x0,		/*  */
/* 10 */	NdrFcShort( 0xfff8 ),	/* -8 */
/* 12 */	NdrFcShort( 0x2 ),	/* Offset= 2 (14) */
/* 14 */	NdrFcShort( 0x10 ),	/* 16 */
/* 16 */	NdrFcShort( 0x2b ),	/* 43 */
/* 18 */	NdrFcLong( 0x3 ),	/* 3 */
/* 22 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 24 */	NdrFcLong( 0x11 ),	/* 17 */
/* 28 */	NdrFcShort( 0x8002 ),	/* Simple arm type: FC_CHAR */
/* 30 */	NdrFcLong( 0x2 ),	/* 2 */
/* 34 */	NdrFcShort( 0x8006 ),	/* Simple arm type: FC_SHORT */
/* 36 */	NdrFcLong( 0x4 ),	/* 4 */
/* 40 */	NdrFcShort( 0x800a ),	/* Simple arm type: FC_FLOAT */
/* 42 */	NdrFcLong( 0x5 ),	/* 5 */
/* 46 */	NdrFcShort( 0x800c ),	/* Simple arm type: FC_DOUBLE */
/* 48 */	NdrFcLong( 0xb ),	/* 11 */
/* 52 */	NdrFcShort( 0x8006 ),	/* Simple arm type: FC_SHORT */
/* 54 */	NdrFcLong( 0xa ),	/* 10 */
/* 58 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 60 */	NdrFcLong( 0x6 ),	/* 6 */
/* 64 */	NdrFcShort( 0xd6 ),	/* Offset= 214 (278) */
/* 66 */	NdrFcLong( 0x7 ),	/* 7 */
/* 70 */	NdrFcShort( 0x800c ),	/* Simple arm type: FC_DOUBLE */
/* 72 */	NdrFcLong( 0x8 ),	/* 8 */
/* 76 */	NdrFcShort( 0xd0 ),	/* Offset= 208 (284) */
/* 78 */	NdrFcLong( 0xd ),	/* 13 */
/* 82 */	NdrFcShort( 0xe2 ),	/* Offset= 226 (308) */
/* 84 */	NdrFcLong( 0x9 ),	/* 9 */
/* 88 */	NdrFcShort( 0xee ),	/* Offset= 238 (326) */
/* 90 */	NdrFcLong( 0x2000 ),	/* 8192 */
/* 94 */	NdrFcShort( 0xfa ),	/* Offset= 250 (344) */
/* 96 */	NdrFcLong( 0x24 ),	/* 36 */
/* 100 */	NdrFcShort( 0x304 ),	/* Offset= 772 (872) */
/* 102 */	NdrFcLong( 0x4024 ),	/* 16420 */
/* 106 */	NdrFcShort( 0x2fe ),	/* Offset= 766 (872) */
/* 108 */	NdrFcLong( 0x4011 ),	/* 16401 */
/* 112 */	NdrFcShort( 0x2fc ),	/* Offset= 764 (876) */
/* 114 */	NdrFcLong( 0x4002 ),	/* 16386 */
/* 118 */	NdrFcShort( 0x2fa ),	/* Offset= 762 (880) */
/* 120 */	NdrFcLong( 0x4003 ),	/* 16387 */
/* 124 */	NdrFcShort( 0x2f8 ),	/* Offset= 760 (884) */
/* 126 */	NdrFcLong( 0x4004 ),	/* 16388 */
/* 130 */	NdrFcShort( 0x2f6 ),	/* Offset= 758 (888) */
/* 132 */	NdrFcLong( 0x4005 ),	/* 16389 */
/* 136 */	NdrFcShort( 0x2f4 ),	/* Offset= 756 (892) */
/* 138 */	NdrFcLong( 0x400b ),	/* 16395 */
/* 142 */	NdrFcShort( 0x2e2 ),	/* Offset= 738 (880) */
/* 144 */	NdrFcLong( 0x400a ),	/* 16394 */
/* 148 */	NdrFcShort( 0x2e0 ),	/* Offset= 736 (884) */
/* 150 */	NdrFcLong( 0x4006 ),	/* 16390 */
/* 154 */	NdrFcShort( 0x2e6 ),	/* Offset= 742 (896) */
/* 156 */	NdrFcLong( 0x4007 ),	/* 16391 */
/* 160 */	NdrFcShort( 0x2dc ),	/* Offset= 732 (892) */
/* 162 */	NdrFcLong( 0x4008 ),	/* 16392 */
/* 166 */	NdrFcShort( 0x2de ),	/* Offset= 734 (900) */
/* 168 */	NdrFcLong( 0x400d ),	/* 16397 */
/* 172 */	NdrFcShort( 0x2dc ),	/* Offset= 732 (904) */
/* 174 */	NdrFcLong( 0x4009 ),	/* 16393 */
/* 178 */	NdrFcShort( 0x2da ),	/* Offset= 730 (908) */
/* 180 */	NdrFcLong( 0x6000 ),	/* 24576 */
/* 184 */	NdrFcShort( 0x2d8 ),	/* Offset= 728 (912) */
/* 186 */	NdrFcLong( 0x400c ),	/* 16396 */
/* 190 */	NdrFcShort( 0x2d6 ),	/* Offset= 726 (916) */
/* 192 */	NdrFcLong( 0x10 ),	/* 16 */
/* 196 */	NdrFcShort( 0x8002 ),	/* Simple arm type: FC_CHAR */
/* 198 */	NdrFcLong( 0x12 ),	/* 18 */
/* 202 */	NdrFcShort( 0x8006 ),	/* Simple arm type: FC_SHORT */
/* 204 */	NdrFcLong( 0x13 ),	/* 19 */
/* 208 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 210 */	NdrFcLong( 0x16 ),	/* 22 */
/* 214 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 216 */	NdrFcLong( 0x17 ),	/* 23 */
/* 220 */	NdrFcShort( 0x8008 ),	/* Simple arm type: FC_LONG */
/* 222 */	NdrFcLong( 0xe ),	/* 14 */
/* 226 */	NdrFcShort( 0x2ba ),	/* Offset= 698 (924) */
/* 228 */	NdrFcLong( 0x400e ),	/* 16398 */
/* 232 */	NdrFcShort( 0x2c0 ),	/* Offset= 704 (936) */
/* 234 */	NdrFcLong( 0x4010 ),	/* 16400 */
/* 238 */	NdrFcShort( 0x27e ),	/* Offset= 638 (876) */
/* 240 */	NdrFcLong( 0x4012 ),	/* 16402 */
/* 244 */	NdrFcShort( 0x27c ),	/* Offset= 636 (880) */
/* 246 */	NdrFcLong( 0x4013 ),	/* 16403 */
/* 250 */	NdrFcShort( 0x27a ),	/* Offset= 634 (884) */
/* 252 */	NdrFcLong( 0x4016 ),	/* 16406 */
/* 256 */	NdrFcShort( 0x274 ),	/* Offset= 628 (884) */
/* 258 */	NdrFcLong( 0x4017 ),	/* 16407 */
/* 262 */	NdrFcShort( 0x26e ),	/* Offset= 622 (884) */
/* 264 */	NdrFcLong( 0x0 ),	/* 0 */
/* 268 */	NdrFcShort( 0x0 ),	/* Offset= 0 (268) */
/* 270 */	NdrFcLong( 0x1 ),	/* 1 */
/* 274 */	NdrFcShort( 0x0 ),	/* Offset= 0 (274) */
/* 276 */	NdrFcShort( 0xffffffff ),	/* Offset= -1 (275) */
/* 278 */
			0x15,		/* FC_STRUCT */
			0x7,		/* 7 */
/* 280 */	NdrFcShort( 0x8 ),	/* 8 */
/* 282 */	0xb,		/* FC_HYPER */
			0x5b,		/* FC_END */
/* 284 */
			0x12, 0x0,	/* FC_UP */
/* 286 */	NdrFcShort( 0xc ),	/* Offset= 12 (298) */
/* 288 */
			0x1b,		/* FC_CARRAY */
			0x1,		/* 1 */
/* 290 */	NdrFcShort( 0x2 ),	/* 2 */
/* 292 */	0x9,		/* Corr desc: FC_ULONG */
			0x0,		/*  */
/* 294 */	NdrFcShort( 0xfffc ),	/* -4 */
/* 296 */	0x6,		/* FC_SHORT */
			0x5b,		/* FC_END */
/* 298 */
			0x17,		/* FC_CSTRUCT */
			0x3,		/* 3 */
/* 300 */	NdrFcShort( 0x8 ),	/* 8 */
/* 302 */	NdrFcShort( 0xfffffff2 ),	/* Offset= -14 (288) */
/* 304 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 306 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 308 */
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/* 310 */	NdrFcLong( 0x0 ),	/* 0 */
/* 314 */	NdrFcShort( 0x0 ),	/* 0 */
/* 316 */	NdrFcShort( 0x0 ),	/* 0 */
/* 318 */	0xc0,		/* 192 */
			0x0,		/* 0 */
/* 320 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 322 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 324 */	0x0,		/* 0 */
			0x46,		/* 70 */
/* 326 */
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/* 328 */	NdrFcLong( 0x20400 ),	/* 132096 */
/* 332 */	NdrFcShort( 0x0 ),	/* 0 */
/* 334 */	NdrFcShort( 0x0 ),	/* 0 */
/* 336 */	0xc0,		/* 192 */
			0x0,		/* 0 */
/* 338 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 340 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 342 */	0x0,		/* 0 */
			0x46,		/* 70 */
/* 344 */
			0x12, 0x0,	/* FC_UP */
/* 346 */	NdrFcShort( 0x1fc ),	/* Offset= 508 (854) */
/* 348 */
			0x2a,		/* FC_ENCAPSULATED_UNION */
			0x49,		/* 73 */
/* 350 */	NdrFcShort( 0x18 ),	/* 24 */
/* 352 */	NdrFcShort( 0xa ),	/* 10 */
/* 354 */	NdrFcLong( 0x8 ),	/* 8 */
/* 358 */	NdrFcShort( 0x58 ),	/* Offset= 88 (446) */
/* 360 */	NdrFcLong( 0xd ),	/* 13 */
/* 364 */	NdrFcShort( 0x78 ),	/* Offset= 120 (484) */
/* 366 */	NdrFcLong( 0x9 ),	/* 9 */
/* 370 */	NdrFcShort( 0x94 ),	/* Offset= 148 (518) */
/* 372 */	NdrFcLong( 0xc ),	/* 12 */
/* 376 */	NdrFcShort( 0xbc ),	/* Offset= 188 (564) */
/* 378 */	NdrFcLong( 0x24 ),	/* 36 */
/* 382 */	NdrFcShort( 0x114 ),	/* Offset= 276 (658) */
/* 384 */	NdrFcLong( 0x800d ),	/* 32781 */
/* 388 */	NdrFcShort( 0x130 ),	/* Offset= 304 (692) */
/* 390 */	NdrFcLong( 0x10 ),	/* 16 */
/* 394 */	NdrFcShort( 0x148 ),	/* Offset= 328 (722) */
/* 396 */	NdrFcLong( 0x2 ),	/* 2 */
/* 400 */	NdrFcShort( 0x160 ),	/* Offset= 352 (752) */
/* 402 */	NdrFcLong( 0x3 ),	/* 3 */
/* 406 */	NdrFcShort( 0x178 ),	/* Offset= 376 (782) */
/* 408 */	NdrFcLong( 0x14 ),	/* 20 */
/* 412 */	NdrFcShort( 0x190 ),	/* Offset= 400 (812) */
/* 414 */	NdrFcShort( 0xffffffff ),	/* Offset= -1 (413) */
/* 416 */
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 418 */	NdrFcShort( 0x4 ),	/* 4 */
/* 420 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 422 */	NdrFcShort( 0x0 ),	/* 0 */
/* 424 */
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 426 */
			0x48,		/* FC_VARIABLE_REPEAT */
			0x49,		/* FC_FIXED_OFFSET */
/* 428 */	NdrFcShort( 0x4 ),	/* 4 */
/* 430 */	NdrFcShort( 0x0 ),	/* 0 */
/* 432 */	NdrFcShort( 0x1 ),	/* 1 */
/* 434 */	NdrFcShort( 0x0 ),	/* 0 */
/* 436 */	NdrFcShort( 0x0 ),	/* 0 */
/* 438 */	0x12, 0x0,	/* FC_UP */
/* 440 */	NdrFcShort( 0xffffff72 ),	/* Offset= -142 (298) */
/* 442 */
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 444 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 446 */
			0x16,		/* FC_PSTRUCT */
			0x3,		/* 3 */
/* 448 */	NdrFcShort( 0x8 ),	/* 8 */
/* 450 */
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 452 */
			0x46,		/* FC_NO_REPEAT */
			0x5c,		/* FC_PAD */
/* 454 */	NdrFcShort( 0x4 ),	/* 4 */
/* 456 */	NdrFcShort( 0x4 ),	/* 4 */
/* 458 */	0x11, 0x0,	/* FC_RP */
/* 460 */	NdrFcShort( 0xffffffd4 ),	/* Offset= -44 (416) */
/* 462 */
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 464 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 466 */
			0x21,		/* FC_BOGUS_ARRAY */
			0x3,		/* 3 */
/* 468 */	NdrFcShort( 0x0 ),	/* 0 */
/* 470 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 472 */	NdrFcShort( 0x0 ),	/* 0 */
/* 474 */	NdrFcLong( 0xffffffff ),	/* -1 */
/* 478 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 480 */	NdrFcShort( 0xffffff54 ),	/* Offset= -172 (308) */
/* 482 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 484 */
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 486 */	NdrFcShort( 0x8 ),	/* 8 */
/* 488 */	NdrFcShort( 0x0 ),	/* 0 */
/* 490 */	NdrFcShort( 0x6 ),	/* Offset= 6 (496) */
/* 492 */	0x8,		/* FC_LONG */
			0x36,		/* FC_POINTER */
/* 494 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 496 */
			0x11, 0x0,	/* FC_RP */
/* 498 */	NdrFcShort( 0xffffffe0 ),	/* Offset= -32 (466) */
/* 500 */
			0x21,		/* FC_BOGUS_ARRAY */
			0x3,		/* 3 */
/* 502 */	NdrFcShort( 0x0 ),	/* 0 */
/* 504 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 506 */	NdrFcShort( 0x0 ),	/* 0 */
/* 508 */	NdrFcLong( 0xffffffff ),	/* -1 */
/* 512 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 514 */	NdrFcShort( 0xffffff44 ),	/* Offset= -188 (326) */
/* 516 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 518 */
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 520 */	NdrFcShort( 0x8 ),	/* 8 */
/* 522 */	NdrFcShort( 0x0 ),	/* 0 */
/* 524 */	NdrFcShort( 0x6 ),	/* Offset= 6 (530) */
/* 526 */	0x8,		/* FC_LONG */
			0x36,		/* FC_POINTER */
/* 528 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 530 */
			0x11, 0x0,	/* FC_RP */
/* 532 */	NdrFcShort( 0xffffffe0 ),	/* Offset= -32 (500) */
/* 534 */
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 536 */	NdrFcShort( 0x4 ),	/* 4 */
/* 538 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 540 */	NdrFcShort( 0x0 ),	/* 0 */
/* 542 */
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 544 */
			0x48,		/* FC_VARIABLE_REPEAT */
			0x49,		/* FC_FIXED_OFFSET */
/* 546 */	NdrFcShort( 0x4 ),	/* 4 */
/* 548 */	NdrFcShort( 0x0 ),	/* 0 */
/* 550 */	NdrFcShort( 0x1 ),	/* 1 */
/* 552 */	NdrFcShort( 0x0 ),	/* 0 */
/* 554 */	NdrFcShort( 0x0 ),	/* 0 */
/* 556 */	0x12, 0x0,	/* FC_UP */
/* 558 */	NdrFcShort( 0x17e ),	/* Offset= 382 (940) */
/* 560 */
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 562 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 564 */
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 566 */	NdrFcShort( 0x8 ),	/* 8 */
/* 568 */	NdrFcShort( 0x0 ),	/* 0 */
/* 570 */	NdrFcShort( 0x6 ),	/* Offset= 6 (576) */
/* 572 */	0x8,		/* FC_LONG */
			0x36,		/* FC_POINTER */
/* 574 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 576 */
			0x11, 0x0,	/* FC_RP */
/* 578 */	NdrFcShort( 0xffffffd4 ),	/* Offset= -44 (534) */
/* 580 */
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/* 582 */	NdrFcLong( 0x2f ),	/* 47 */
/* 586 */	NdrFcShort( 0x0 ),	/* 0 */
/* 588 */	NdrFcShort( 0x0 ),	/* 0 */
/* 590 */	0xc0,		/* 192 */
			0x0,		/* 0 */
/* 592 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 594 */	0x0,		/* 0 */
			0x0,		/* 0 */
/* 596 */	0x0,		/* 0 */
			0x46,		/* 70 */
/* 598 */
			0x1b,		/* FC_CARRAY */
			0x0,		/* 0 */
/* 600 */	NdrFcShort( 0x1 ),	/* 1 */
/* 602 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 604 */	NdrFcShort( 0x4 ),	/* 4 */
/* 606 */	0x1,		/* FC_BYTE */
			0x5b,		/* FC_END */
/* 608 */
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 610 */	NdrFcShort( 0x10 ),	/* 16 */
/* 612 */	NdrFcShort( 0x0 ),	/* 0 */
/* 614 */	NdrFcShort( 0xa ),	/* Offset= 10 (624) */
/* 616 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 618 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 620 */	NdrFcShort( 0xffffffd8 ),	/* Offset= -40 (580) */
/* 622 */	0x36,		/* FC_POINTER */
			0x5b,		/* FC_END */
/* 624 */
			0x12, 0x0,	/* FC_UP */
/* 626 */	NdrFcShort( 0xffffffe4 ),	/* Offset= -28 (598) */
/* 628 */
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 630 */	NdrFcShort( 0x4 ),	/* 4 */
/* 632 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 634 */	NdrFcShort( 0x0 ),	/* 0 */
/* 636 */
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 638 */
			0x48,		/* FC_VARIABLE_REPEAT */
			0x49,		/* FC_FIXED_OFFSET */
/* 640 */	NdrFcShort( 0x4 ),	/* 4 */
/* 642 */	NdrFcShort( 0x0 ),	/* 0 */
/* 644 */	NdrFcShort( 0x1 ),	/* 1 */
/* 646 */	NdrFcShort( 0x0 ),	/* 0 */
/* 648 */	NdrFcShort( 0x0 ),	/* 0 */
/* 650 */	0x12, 0x0,	/* FC_UP */
/* 652 */	NdrFcShort( 0xffffffd4 ),	/* Offset= -44 (608) */
/* 654 */
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 656 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 658 */
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 660 */	NdrFcShort( 0x8 ),	/* 8 */
/* 662 */	NdrFcShort( 0x0 ),	/* 0 */
/* 664 */	NdrFcShort( 0x6 ),	/* Offset= 6 (670) */
/* 666 */	0x8,		/* FC_LONG */
			0x36,		/* FC_POINTER */
/* 668 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 670 */
			0x11, 0x0,	/* FC_RP */
/* 672 */	NdrFcShort( 0xffffffd4 ),	/* Offset= -44 (628) */
/* 674 */
			0x1d,		/* FC_SMFARRAY */
			0x0,		/* 0 */
/* 676 */	NdrFcShort( 0x8 ),	/* 8 */
/* 678 */	0x2,		/* FC_CHAR */
			0x5b,		/* FC_END */
/* 680 */
			0x15,		/* FC_STRUCT */
			0x3,		/* 3 */
/* 682 */	NdrFcShort( 0x10 ),	/* 16 */
/* 684 */	0x8,		/* FC_LONG */
			0x6,		/* FC_SHORT */
/* 686 */	0x6,		/* FC_SHORT */
			0x4c,		/* FC_EMBEDDED_COMPLEX */
/* 688 */	0x0,		/* 0 */
			NdrFcShort( 0xfffffff1 ),	/* Offset= -15 (674) */
			0x5b,		/* FC_END */
/* 692 */
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 694 */	NdrFcShort( 0x18 ),	/* 24 */
/* 696 */	NdrFcShort( 0x0 ),	/* 0 */
/* 698 */	NdrFcShort( 0xa ),	/* Offset= 10 (708) */
/* 700 */	0x8,		/* FC_LONG */
			0x36,		/* FC_POINTER */
/* 702 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 704 */	NdrFcShort( 0xffffffe8 ),	/* Offset= -24 (680) */
/* 706 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 708 */
			0x11, 0x0,	/* FC_RP */
/* 710 */	NdrFcShort( 0xffffff0c ),	/* Offset= -244 (466) */
/* 712 */
			0x1b,		/* FC_CARRAY */
			0x0,		/* 0 */
/* 714 */	NdrFcShort( 0x1 ),	/* 1 */
/* 716 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 718 */	NdrFcShort( 0x0 ),	/* 0 */
/* 720 */	0x1,		/* FC_BYTE */
			0x5b,		/* FC_END */
/* 722 */
			0x16,		/* FC_PSTRUCT */
			0x3,		/* 3 */
/* 724 */	NdrFcShort( 0x8 ),	/* 8 */
/* 726 */
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 728 */
			0x46,		/* FC_NO_REPEAT */
			0x5c,		/* FC_PAD */
/* 730 */	NdrFcShort( 0x4 ),	/* 4 */
/* 732 */	NdrFcShort( 0x4 ),	/* 4 */
/* 734 */	0x12, 0x0,	/* FC_UP */
/* 736 */	NdrFcShort( 0xffffffe8 ),	/* Offset= -24 (712) */
/* 738 */
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 740 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 742 */
			0x1b,		/* FC_CARRAY */
			0x1,		/* 1 */
/* 744 */	NdrFcShort( 0x2 ),	/* 2 */
/* 746 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 748 */	NdrFcShort( 0x0 ),	/* 0 */
/* 750 */	0x6,		/* FC_SHORT */
			0x5b,		/* FC_END */
/* 752 */
			0x16,		/* FC_PSTRUCT */
			0x3,		/* 3 */
/* 754 */	NdrFcShort( 0x8 ),	/* 8 */
/* 756 */
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 758 */
			0x46,		/* FC_NO_REPEAT */
			0x5c,		/* FC_PAD */
/* 760 */	NdrFcShort( 0x4 ),	/* 4 */
/* 762 */	NdrFcShort( 0x4 ),	/* 4 */
/* 764 */	0x12, 0x0,	/* FC_UP */
/* 766 */	NdrFcShort( 0xffffffe8 ),	/* Offset= -24 (742) */
/* 768 */
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 770 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 772 */
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 774 */	NdrFcShort( 0x4 ),	/* 4 */
/* 776 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 778 */	NdrFcShort( 0x0 ),	/* 0 */
/* 780 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 782 */
			0x16,		/* FC_PSTRUCT */
			0x3,		/* 3 */
/* 784 */	NdrFcShort( 0x8 ),	/* 8 */
/* 786 */
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 788 */
			0x46,		/* FC_NO_REPEAT */
			0x5c,		/* FC_PAD */
/* 790 */	NdrFcShort( 0x4 ),	/* 4 */
/* 792 */	NdrFcShort( 0x4 ),	/* 4 */
/* 794 */	0x12, 0x0,	/* FC_UP */
/* 796 */	NdrFcShort( 0xffffffe8 ),	/* Offset= -24 (772) */
/* 798 */
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 800 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 802 */
			0x1b,		/* FC_CARRAY */
			0x7,		/* 7 */
/* 804 */	NdrFcShort( 0x8 ),	/* 8 */
/* 806 */	0x19,		/* Corr desc:  field pointer, FC_ULONG */
			0x0,		/*  */
/* 808 */	NdrFcShort( 0x0 ),	/* 0 */
/* 810 */	0xb,		/* FC_HYPER */
			0x5b,		/* FC_END */
/* 812 */
			0x16,		/* FC_PSTRUCT */
			0x3,		/* 3 */
/* 814 */	NdrFcShort( 0x8 ),	/* 8 */
/* 816 */
			0x4b,		/* FC_PP */
			0x5c,		/* FC_PAD */
/* 818 */
			0x46,		/* FC_NO_REPEAT */
			0x5c,		/* FC_PAD */
/* 820 */	NdrFcShort( 0x4 ),	/* 4 */
/* 822 */	NdrFcShort( 0x4 ),	/* 4 */
/* 824 */	0x12, 0x0,	/* FC_UP */
/* 826 */	NdrFcShort( 0xffffffe8 ),	/* Offset= -24 (802) */
/* 828 */
			0x5b,		/* FC_END */

			0x8,		/* FC_LONG */
/* 830 */	0x8,		/* FC_LONG */
			0x5b,		/* FC_END */
/* 832 */
			0x15,		/* FC_STRUCT */
			0x3,		/* 3 */
/* 834 */	NdrFcShort( 0x8 ),	/* 8 */
/* 836 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 838 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 840 */
			0x1b,		/* FC_CARRAY */
			0x3,		/* 3 */
/* 842 */	NdrFcShort( 0x8 ),	/* 8 */
/* 844 */	0x7,		/* Corr desc: FC_USHORT */
			0x0,		/*  */
/* 846 */	NdrFcShort( 0xffd8 ),	/* -40 */
/* 848 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 850 */	NdrFcShort( 0xffffffee ),	/* Offset= -18 (832) */
/* 852 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 854 */
			0x1a,		/* FC_BOGUS_STRUCT */
			0x3,		/* 3 */
/* 856 */	NdrFcShort( 0x28 ),	/* 40 */
/* 858 */	NdrFcShort( 0xffffffee ),	/* Offset= -18 (840) */
/* 860 */	NdrFcShort( 0x0 ),	/* Offset= 0 (860) */
/* 862 */	0x6,		/* FC_SHORT */
			0x6,		/* FC_SHORT */
/* 864 */	0x38,		/* FC_ALIGNM4 */
			0x8,		/* FC_LONG */
/* 866 */	0x8,		/* FC_LONG */
			0x4c,		/* FC_EMBEDDED_COMPLEX */
/* 868 */	0x0,		/* 0 */
			NdrFcShort( 0xfffffdf7 ),	/* Offset= -521 (348) */
			0x5b,		/* FC_END */
/* 872 */
			0x12, 0x0,	/* FC_UP */
/* 874 */	NdrFcShort( 0xfffffef6 ),	/* Offset= -266 (608) */
/* 876 */
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 878 */	0x2,		/* FC_CHAR */
			0x5c,		/* FC_PAD */
/* 880 */
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 882 */	0x6,		/* FC_SHORT */
			0x5c,		/* FC_PAD */
/* 884 */
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 886 */	0x8,		/* FC_LONG */
			0x5c,		/* FC_PAD */
/* 888 */
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 890 */	0xa,		/* FC_FLOAT */
			0x5c,		/* FC_PAD */
/* 892 */
			0x12, 0x8,	/* FC_UP [simple_pointer] */
/* 894 */	0xc,		/* FC_DOUBLE */
			0x5c,		/* FC_PAD */
/* 896 */
			0x12, 0x0,	/* FC_UP */
/* 898 */	NdrFcShort( 0xfffffd94 ),	/* Offset= -620 (278) */
/* 900 */
			0x12, 0x10,	/* FC_UP */
/* 902 */	NdrFcShort( 0xfffffd96 ),	/* Offset= -618 (284) */
/* 904 */
			0x12, 0x10,	/* FC_UP */
/* 906 */	NdrFcShort( 0xfffffdaa ),	/* Offset= -598 (308) */
/* 908 */
			0x12, 0x10,	/* FC_UP */
/* 910 */	NdrFcShort( 0xfffffdb8 ),	/* Offset= -584 (326) */
/* 912 */
			0x12, 0x10,	/* FC_UP */
/* 914 */	NdrFcShort( 0xfffffdc6 ),	/* Offset= -570 (344) */
/* 916 */
			0x12, 0x10,	/* FC_UP */
/* 918 */	NdrFcShort( 0x2 ),	/* Offset= 2 (920) */
/* 920 */
			0x12, 0x0,	/* FC_UP */
/* 922 */	NdrFcShort( 0xfffffc66 ),	/* Offset= -922 (0) */
/* 924 */
			0x15,		/* FC_STRUCT */
			0x7,		/* 7 */
/* 926 */	NdrFcShort( 0x10 ),	/* 16 */
/* 928 */	0x6,		/* FC_SHORT */
			0x2,		/* FC_CHAR */
/* 930 */	0x2,		/* FC_CHAR */
			0x38,		/* FC_ALIGNM4 */
/* 932 */	0x8,		/* FC_LONG */
			0x39,		/* FC_ALIGNM8 */
/* 934 */	0xb,		/* FC_HYPER */
			0x5b,		/* FC_END */
/* 936 */
			0x12, 0x0,	/* FC_UP */
/* 938 */	NdrFcShort( 0xfffffff2 ),	/* Offset= -14 (924) */
/* 940 */
			0x1a,		/* FC_BOGUS_STRUCT */
			0x7,		/* 7 */
/* 942 */	NdrFcShort( 0x20 ),	/* 32 */
/* 944 */	NdrFcShort( 0x0 ),	/* 0 */
/* 946 */	NdrFcShort( 0x0 ),	/* Offset= 0 (946) */
/* 948 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 950 */	0x6,		/* FC_SHORT */
			0x6,		/* FC_SHORT */
/* 952 */	0x6,		/* FC_SHORT */
			0x6,		/* FC_SHORT */
/* 954 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 956 */	NdrFcShort( 0xfffffc4a ),	/* Offset= -950 (6) */
/* 958 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 960 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 962 */	NdrFcShort( 0x0 ),	/* 0 */
/* 964 */	NdrFcShort( 0x10 ),	/* 16 */
/* 966 */	NdrFcShort( 0x0 ),	/* 0 */
/* 968 */	NdrFcShort( 0xfffffc3a ),	/* Offset= -966 (2) */
/* 970 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 972 */	NdrFcShort( 0x1 ),	/* 1 */
/* 974 */	NdrFcShort( 0x4 ),	/* 4 */
/* 976 */	NdrFcShort( 0x0 ),	/* 0 */
/* 978 */	NdrFcShort( 0xfffffd4a ),	/* Offset= -694 (284) */
/* 980 */
			0x11, 0x4,	/* FC_RP [alloced_on_stack] */
/* 982 */	NdrFcShort( 0x6 ),	/* Offset= 6 (988) */
/* 984 */
			0x13, 0x0,	/* FC_OP */
/* 986 */	NdrFcShort( 0xfffffd50 ),	/* Offset= -688 (298) */
/* 988 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 990 */	NdrFcShort( 0x1 ),	/* 1 */
/* 992 */	NdrFcShort( 0x4 ),	/* 4 */
/* 994 */	NdrFcShort( 0x0 ),	/* 0 */
/* 996 */	NdrFcShort( 0xfffffff4 ),	/* Offset= -12 (984) */
/* 998 */
			0x11, 0x4,	/* FC_RP [alloced_on_stack] */
/* 1000 */	NdrFcShort( 0x6 ),	/* Offset= 6 (1006) */
/* 1002 */
			0x13, 0x0,	/* FC_OP */
/* 1004 */	NdrFcShort( 0xffffffc0 ),	/* Offset= -64 (940) */
/* 1006 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 1008 */	NdrFcShort( 0x0 ),	/* 0 */
/* 1010 */	NdrFcShort( 0x10 ),	/* 16 */
/* 1012 */	NdrFcShort( 0x0 ),	/* 0 */
/* 1014 */	NdrFcShort( 0xfffffff4 ),	/* Offset= -12 (1002) */
/* 1016 */
			0x11, 0xc,	/* FC_RP [alloced_on_stack] [simple_pointer] */
/* 1018 */	0x8,		/* FC_LONG */
			0x5c,		/* FC_PAD */

			0x0
		}
	};

const CInterfaceProxyVtbl * _CStudioCOM_ProxyVtblList[] =
{
	( CInterfaceProxyVtbl *) &_ICSHookProxyVtbl,
	( CInterfaceProxyVtbl *) &_IParseCSProxyVtbl,
	0
};

const CInterfaceStubVtbl * _CStudioCOM_StubVtblList[] =
{
	( CInterfaceStubVtbl *) &_ICSHookStubVtbl,
	( CInterfaceStubVtbl *) &_IParseCSStubVtbl,
	0
};

PCInterfaceName const _CStudioCOM_InterfaceNamesList[] =
{
	"ICSHook",
	"IParseCS",
	0
};

const IID *  _CStudioCOM_BaseIIDList[] =
{
	&IID_IDispatch,
	&IID_IDispatch,
	0
};


#define _CStudioCOM_CHECK_IID(n)	IID_GENERIC_CHECK_IID( _CStudioCOM, pIID, n)

int __stdcall _CStudioCOM_IID_Lookup( const IID * pIID, int * pIndex )
{
	IID_BS_LOOKUP_SETUP

	IID_BS_LOOKUP_INITIAL_TEST( _CStudioCOM, 2, 1 )
	IID_BS_LOOKUP_RETURN_RESULT( _CStudioCOM, 2, *pIndex )

}

const ExtendedProxyFileInfo CStudioCOM_ProxyFileInfo =
{
	(PCInterfaceProxyVtblList *) & _CStudioCOM_ProxyVtblList,
	(PCInterfaceStubVtblList *) & _CStudioCOM_StubVtblList,
	(const PCInterfaceName * ) & _CStudioCOM_InterfaceNamesList,
	(const IID ** ) & _CStudioCOM_BaseIIDList,
	& _CStudioCOM_IID_Lookup,
	2,
	1,
	0, /* table of [async_uuid] interfaces */
	0, /* Filler1 */
	0, /* Filler2 */
	0  /* Filler3 */
};
