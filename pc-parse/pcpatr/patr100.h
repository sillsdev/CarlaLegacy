/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Fri Jun 15 14:12:37 2001
 */
/* Compiler settings for C:\carla\Dev\SOSMirror\pc-parse\pcpatr\patr100.idl:
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

#ifndef __patr100_h__
#define __patr100_h__

#ifdef __cplusplus
extern "C"{
#endif

/* Forward Declarations */

#ifndef __IPatrParser_FWD_DEFINED__
#define __IPatrParser_FWD_DEFINED__
typedef interface IPatrParser IPatrParser;
#endif 	/* __IPatrParser_FWD_DEFINED__ */


#ifndef __PatrParser_FWD_DEFINED__
#define __PatrParser_FWD_DEFINED__

#ifdef __cplusplus
typedef class PatrParser PatrParser;
#else
typedef struct PatrParser PatrParser;
#endif /* __cplusplus */

#endif 	/* __PatrParser_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * );

#ifndef __IPatrParser_INTERFACE_DEFINED__
#define __IPatrParser_INTERFACE_DEFINED__

/* interface IPatrParser */
/* [unique][helpstring][dual][uuid][object] */


EXTERN_C const IID IID_IPatrParser;

#if defined(__cplusplus) && !defined(CINTERFACE)

	MIDL_INTERFACE("327879FF-5405-11D3-8FD4-00400541F6D3")
	IPatrParser : public IDispatch
	{
	public:
		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ParseString(
			/* [in] */ BSTR bstrSentence,
			/* [retval][out] */ BSTR __RPC_FAR *pbstrParse) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ParseFile(
			/* [in] */ BSTR bstrInput,
			/* [in] */ BSTR bstrOutput) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE LoadGrammarFile(
			/* [in] */ BSTR bstrGrammarFile) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE LoadLexiconFile(
			/* [in] */ BSTR bstrLexiconFile,
			/* [in] */ BOOL fAdd) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OpenLog(
			/* [in] */ BSTR bstrLogFile) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CloseLog( void) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_GrammarFile(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LexiconFile(
			/* [in] */ long iFile,
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LogFile(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Unification(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Unification(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TreeDisplay(
			/* [retval][out] */ long __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TreeDisplay(
			/* [in] */ long newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Gloss(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Gloss(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_MaxAmbiguity(
			/* [retval][out] */ long __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_MaxAmbiguity(
			/* [in] */ long newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CheckCycles(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_CheckCycles(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CommentChar(
			/* [retval][out] */ long __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_CommentChar(
			/* [in] */ long newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TimeLimit(
			/* [retval][out] */ long __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TimeLimit(
			/* [in] */ long newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TopDownFilter(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TopDownFilter(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TrimEmptyFeatures(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TrimEmptyFeatures(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_DebuggingLevel(
			/* [retval][out] */ long __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_DebuggingLevel(
			/* [in] */ long newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LexRecordMarker(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_LexRecordMarker(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LexWordMarker(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_LexWordMarker(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LexCategoryMarker(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_LexCategoryMarker(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LexFeaturesMarker(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_LexFeaturesMarker(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LexGlossMarker(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_LexGlossMarker(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TopFeatureOnly(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TopFeatureOnly(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_DisplayFeatures(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_DisplayFeatures(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_FlatFeatureDisplay(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_FlatFeatureDisplay(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Failures(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_Failures(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CodePage(
			/* [retval][out] */ long __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_CodePage(
			/* [in] */ long newVal) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DisambiguateAnaFile(
			/* [in] */ BSTR bstrInput,
			/* [in] */ BSTR bstrOutput) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_WriteAmpleParses(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_WriteAmpleParses(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE LoadAnaFile(
			/* [in] */ BSTR bstrAnaFile,
			/* [in] */ BOOL fAdd) = 0;

		virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ReloadLexicon( void) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LexiconFileCount(
			/* [retval][out] */ long __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_PromoteDefaultAtoms(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_PromoteDefaultAtoms(
			/* [in] */ BOOL newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SentenceFinalPunctuation(
			/* [retval][out] */ BSTR __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_SentenceFinalPunctuation(
			/* [in] */ BSTR newVal) = 0;

		virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_AmplePropertyIsFeature(
			/* [retval][out] */ BOOL __RPC_FAR *pVal) = 0;

		virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_AmplePropertyIsFeature(
			/* [in] */ BOOL newVal) = 0;

	};

#else 	/* C style interface */

	typedef struct IPatrParserVtbl
	{
		BEGIN_INTERFACE

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ REFIID riid,
			/* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);

		ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )(
			IPatrParser __RPC_FAR * This);

		ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )(
			IPatrParser __RPC_FAR * This);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )(
			IPatrParser __RPC_FAR * This,
			/* [out] */ UINT __RPC_FAR *pctinfo);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ UINT iTInfo,
			/* [in] */ LCID lcid,
			/* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);

		HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ REFIID riid,
			/* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
			/* [in] */ UINT cNames,
			/* [in] */ LCID lcid,
			/* [size_is][out] */ DISPID __RPC_FAR *rgDispId);

		/* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ DISPID dispIdMember,
			/* [in] */ REFIID riid,
			/* [in] */ LCID lcid,
			/* [in] */ WORD wFlags,
			/* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
			/* [out] */ VARIANT __RPC_FAR *pVarResult,
			/* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
			/* [out] */ UINT __RPC_FAR *puArgErr);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ParseString )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR bstrSentence,
			/* [retval][out] */ BSTR __RPC_FAR *pbstrParse);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ParseFile )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR bstrInput,
			/* [in] */ BSTR bstrOutput);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *LoadGrammarFile )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR bstrGrammarFile);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *LoadLexiconFile )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR bstrLexiconFile,
			/* [in] */ BOOL fAdd);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Clear )(
			IPatrParser __RPC_FAR * This);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *OpenLog )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR bstrLogFile);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *CloseLog )(
			IPatrParser __RPC_FAR * This);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_GrammarFile )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LexiconFile )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ long iFile,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LogFile )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_Unification )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_Unification )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_TreeDisplay )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ long __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_TreeDisplay )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ long newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_Gloss )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_Gloss )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_MaxAmbiguity )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ long __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_MaxAmbiguity )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ long newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_CheckCycles )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_CheckCycles )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_CommentChar )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ long __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_CommentChar )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ long newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_TimeLimit )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ long __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_TimeLimit )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ long newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_TopDownFilter )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_TopDownFilter )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_TrimEmptyFeatures )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_TrimEmptyFeatures )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_DebuggingLevel )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ long __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_DebuggingLevel )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ long newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LexRecordMarker )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_LexRecordMarker )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LexWordMarker )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_LexWordMarker )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LexCategoryMarker )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_LexCategoryMarker )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LexFeaturesMarker )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_LexFeaturesMarker )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LexGlossMarker )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_LexGlossMarker )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_TopFeatureOnly )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_TopFeatureOnly )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_DisplayFeatures )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_DisplayFeatures )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_FlatFeatureDisplay )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_FlatFeatureDisplay )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_Failures )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_Failures )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_CodePage )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ long __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_CodePage )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ long newVal);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *DisambiguateAnaFile )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR bstrInput,
			/* [in] */ BSTR bstrOutput);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_WriteAmpleParses )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_WriteAmpleParses )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *LoadAnaFile )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR bstrAnaFile,
			/* [in] */ BOOL fAdd);

		/* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ReloadLexicon )(
			IPatrParser __RPC_FAR * This);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_LexiconFileCount )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ long __RPC_FAR *pVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_PromoteDefaultAtoms )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_PromoteDefaultAtoms )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_SentenceFinalPunctuation )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BSTR __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_SentenceFinalPunctuation )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BSTR newVal);

		/* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *get_AmplePropertyIsFeature )(
			IPatrParser __RPC_FAR * This,
			/* [retval][out] */ BOOL __RPC_FAR *pVal);

		/* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *put_AmplePropertyIsFeature )(
			IPatrParser __RPC_FAR * This,
			/* [in] */ BOOL newVal);

		END_INTERFACE
	} IPatrParserVtbl;

	interface IPatrParser
	{
		CONST_VTBL struct IPatrParserVtbl __RPC_FAR *lpVtbl;
	};



#ifdef COBJMACROS


#define IPatrParser_QueryInterface(This,riid,ppvObject)	\
	(This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IPatrParser_AddRef(This)	\
	(This)->lpVtbl -> AddRef(This)

#define IPatrParser_Release(This)	\
	(This)->lpVtbl -> Release(This)


#define IPatrParser_GetTypeInfoCount(This,pctinfo)	\
	(This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IPatrParser_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
	(This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IPatrParser_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
	(This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IPatrParser_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
	(This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IPatrParser_ParseString(This,bstrSentence,pbstrParse)	\
	(This)->lpVtbl -> ParseString(This,bstrSentence,pbstrParse)

#define IPatrParser_ParseFile(This,bstrInput,bstrOutput)	\
	(This)->lpVtbl -> ParseFile(This,bstrInput,bstrOutput)

#define IPatrParser_LoadGrammarFile(This,bstrGrammarFile)	\
	(This)->lpVtbl -> LoadGrammarFile(This,bstrGrammarFile)

#define IPatrParser_LoadLexiconFile(This,bstrLexiconFile,fAdd)	\
	(This)->lpVtbl -> LoadLexiconFile(This,bstrLexiconFile,fAdd)

#define IPatrParser_Clear(This)	\
	(This)->lpVtbl -> Clear(This)

#define IPatrParser_OpenLog(This,bstrLogFile)	\
	(This)->lpVtbl -> OpenLog(This,bstrLogFile)

#define IPatrParser_CloseLog(This)	\
	(This)->lpVtbl -> CloseLog(This)

#define IPatrParser_get_GrammarFile(This,pVal)	\
	(This)->lpVtbl -> get_GrammarFile(This,pVal)

#define IPatrParser_get_LexiconFile(This,iFile,pVal)	\
	(This)->lpVtbl -> get_LexiconFile(This,iFile,pVal)

#define IPatrParser_get_LogFile(This,pVal)	\
	(This)->lpVtbl -> get_LogFile(This,pVal)

#define IPatrParser_get_Unification(This,pVal)	\
	(This)->lpVtbl -> get_Unification(This,pVal)

#define IPatrParser_put_Unification(This,newVal)	\
	(This)->lpVtbl -> put_Unification(This,newVal)

#define IPatrParser_get_TreeDisplay(This,pVal)	\
	(This)->lpVtbl -> get_TreeDisplay(This,pVal)

#define IPatrParser_put_TreeDisplay(This,newVal)	\
	(This)->lpVtbl -> put_TreeDisplay(This,newVal)

#define IPatrParser_get_Gloss(This,pVal)	\
	(This)->lpVtbl -> get_Gloss(This,pVal)

#define IPatrParser_put_Gloss(This,newVal)	\
	(This)->lpVtbl -> put_Gloss(This,newVal)

#define IPatrParser_get_MaxAmbiguity(This,pVal)	\
	(This)->lpVtbl -> get_MaxAmbiguity(This,pVal)

#define IPatrParser_put_MaxAmbiguity(This,newVal)	\
	(This)->lpVtbl -> put_MaxAmbiguity(This,newVal)

#define IPatrParser_get_CheckCycles(This,pVal)	\
	(This)->lpVtbl -> get_CheckCycles(This,pVal)

#define IPatrParser_put_CheckCycles(This,newVal)	\
	(This)->lpVtbl -> put_CheckCycles(This,newVal)

#define IPatrParser_get_CommentChar(This,pVal)	\
	(This)->lpVtbl -> get_CommentChar(This,pVal)

#define IPatrParser_put_CommentChar(This,newVal)	\
	(This)->lpVtbl -> put_CommentChar(This,newVal)

#define IPatrParser_get_TimeLimit(This,pVal)	\
	(This)->lpVtbl -> get_TimeLimit(This,pVal)

#define IPatrParser_put_TimeLimit(This,newVal)	\
	(This)->lpVtbl -> put_TimeLimit(This,newVal)

#define IPatrParser_get_TopDownFilter(This,pVal)	\
	(This)->lpVtbl -> get_TopDownFilter(This,pVal)

#define IPatrParser_put_TopDownFilter(This,newVal)	\
	(This)->lpVtbl -> put_TopDownFilter(This,newVal)

#define IPatrParser_get_TrimEmptyFeatures(This,pVal)	\
	(This)->lpVtbl -> get_TrimEmptyFeatures(This,pVal)

#define IPatrParser_put_TrimEmptyFeatures(This,newVal)	\
	(This)->lpVtbl -> put_TrimEmptyFeatures(This,newVal)

#define IPatrParser_get_DebuggingLevel(This,pVal)	\
	(This)->lpVtbl -> get_DebuggingLevel(This,pVal)

#define IPatrParser_put_DebuggingLevel(This,newVal)	\
	(This)->lpVtbl -> put_DebuggingLevel(This,newVal)

#define IPatrParser_get_LexRecordMarker(This,pVal)	\
	(This)->lpVtbl -> get_LexRecordMarker(This,pVal)

#define IPatrParser_put_LexRecordMarker(This,newVal)	\
	(This)->lpVtbl -> put_LexRecordMarker(This,newVal)

#define IPatrParser_get_LexWordMarker(This,pVal)	\
	(This)->lpVtbl -> get_LexWordMarker(This,pVal)

#define IPatrParser_put_LexWordMarker(This,newVal)	\
	(This)->lpVtbl -> put_LexWordMarker(This,newVal)

#define IPatrParser_get_LexCategoryMarker(This,pVal)	\
	(This)->lpVtbl -> get_LexCategoryMarker(This,pVal)

#define IPatrParser_put_LexCategoryMarker(This,newVal)	\
	(This)->lpVtbl -> put_LexCategoryMarker(This,newVal)

#define IPatrParser_get_LexFeaturesMarker(This,pVal)	\
	(This)->lpVtbl -> get_LexFeaturesMarker(This,pVal)

#define IPatrParser_put_LexFeaturesMarker(This,newVal)	\
	(This)->lpVtbl -> put_LexFeaturesMarker(This,newVal)

#define IPatrParser_get_LexGlossMarker(This,pVal)	\
	(This)->lpVtbl -> get_LexGlossMarker(This,pVal)

#define IPatrParser_put_LexGlossMarker(This,newVal)	\
	(This)->lpVtbl -> put_LexGlossMarker(This,newVal)

#define IPatrParser_get_TopFeatureOnly(This,pVal)	\
	(This)->lpVtbl -> get_TopFeatureOnly(This,pVal)

#define IPatrParser_put_TopFeatureOnly(This,newVal)	\
	(This)->lpVtbl -> put_TopFeatureOnly(This,newVal)

#define IPatrParser_get_DisplayFeatures(This,pVal)	\
	(This)->lpVtbl -> get_DisplayFeatures(This,pVal)

#define IPatrParser_put_DisplayFeatures(This,newVal)	\
	(This)->lpVtbl -> put_DisplayFeatures(This,newVal)

#define IPatrParser_get_FlatFeatureDisplay(This,pVal)	\
	(This)->lpVtbl -> get_FlatFeatureDisplay(This,pVal)

#define IPatrParser_put_FlatFeatureDisplay(This,newVal)	\
	(This)->lpVtbl -> put_FlatFeatureDisplay(This,newVal)

#define IPatrParser_get_Failures(This,pVal)	\
	(This)->lpVtbl -> get_Failures(This,pVal)

#define IPatrParser_put_Failures(This,newVal)	\
	(This)->lpVtbl -> put_Failures(This,newVal)

#define IPatrParser_get_CodePage(This,pVal)	\
	(This)->lpVtbl -> get_CodePage(This,pVal)

#define IPatrParser_put_CodePage(This,newVal)	\
	(This)->lpVtbl -> put_CodePage(This,newVal)

#define IPatrParser_DisambiguateAnaFile(This,bstrInput,bstrOutput)	\
	(This)->lpVtbl -> DisambiguateAnaFile(This,bstrInput,bstrOutput)

#define IPatrParser_get_WriteAmpleParses(This,pVal)	\
	(This)->lpVtbl -> get_WriteAmpleParses(This,pVal)

#define IPatrParser_put_WriteAmpleParses(This,newVal)	\
	(This)->lpVtbl -> put_WriteAmpleParses(This,newVal)

#define IPatrParser_LoadAnaFile(This,bstrAnaFile,fAdd)	\
	(This)->lpVtbl -> LoadAnaFile(This,bstrAnaFile,fAdd)

#define IPatrParser_ReloadLexicon(This)	\
	(This)->lpVtbl -> ReloadLexicon(This)

#define IPatrParser_get_LexiconFileCount(This,pVal)	\
	(This)->lpVtbl -> get_LexiconFileCount(This,pVal)

#define IPatrParser_get_PromoteDefaultAtoms(This,pVal)	\
	(This)->lpVtbl -> get_PromoteDefaultAtoms(This,pVal)

#define IPatrParser_put_PromoteDefaultAtoms(This,newVal)	\
	(This)->lpVtbl -> put_PromoteDefaultAtoms(This,newVal)

#define IPatrParser_get_SentenceFinalPunctuation(This,pVal)	\
	(This)->lpVtbl -> get_SentenceFinalPunctuation(This,pVal)

#define IPatrParser_put_SentenceFinalPunctuation(This,newVal)	\
	(This)->lpVtbl -> put_SentenceFinalPunctuation(This,newVal)

#define IPatrParser_get_AmplePropertyIsFeature(This,pVal)	\
	(This)->lpVtbl -> get_AmplePropertyIsFeature(This,pVal)

#define IPatrParser_put_AmplePropertyIsFeature(This,newVal)	\
	(This)->lpVtbl -> put_AmplePropertyIsFeature(This,newVal)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPatrParser_ParseString_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR bstrSentence,
	/* [retval][out] */ BSTR __RPC_FAR *pbstrParse);


void __RPC_STUB IPatrParser_ParseString_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPatrParser_ParseFile_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR bstrInput,
	/* [in] */ BSTR bstrOutput);


void __RPC_STUB IPatrParser_ParseFile_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPatrParser_LoadGrammarFile_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR bstrGrammarFile);


void __RPC_STUB IPatrParser_LoadGrammarFile_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPatrParser_LoadLexiconFile_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR bstrLexiconFile,
	/* [in] */ BOOL fAdd);


void __RPC_STUB IPatrParser_LoadLexiconFile_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPatrParser_Clear_Proxy(
	IPatrParser __RPC_FAR * This);


void __RPC_STUB IPatrParser_Clear_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPatrParser_OpenLog_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR bstrLogFile);


void __RPC_STUB IPatrParser_OpenLog_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPatrParser_CloseLog_Proxy(
	IPatrParser __RPC_FAR * This);


void __RPC_STUB IPatrParser_CloseLog_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_GrammarFile_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_GrammarFile_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_LexiconFile_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ long iFile,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_LexiconFile_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_LogFile_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_LogFile_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_Unification_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_Unification_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_Unification_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_Unification_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_TreeDisplay_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_TreeDisplay_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_TreeDisplay_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ long newVal);


void __RPC_STUB IPatrParser_put_TreeDisplay_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_Gloss_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_Gloss_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_Gloss_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_Gloss_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_MaxAmbiguity_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_MaxAmbiguity_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_MaxAmbiguity_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ long newVal);


void __RPC_STUB IPatrParser_put_MaxAmbiguity_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_CheckCycles_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_CheckCycles_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_CheckCycles_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_CheckCycles_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_CommentChar_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_CommentChar_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_CommentChar_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ long newVal);


void __RPC_STUB IPatrParser_put_CommentChar_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_TimeLimit_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_TimeLimit_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_TimeLimit_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ long newVal);


void __RPC_STUB IPatrParser_put_TimeLimit_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_TopDownFilter_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_TopDownFilter_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_TopDownFilter_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_TopDownFilter_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_TrimEmptyFeatures_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_TrimEmptyFeatures_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_TrimEmptyFeatures_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_TrimEmptyFeatures_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_DebuggingLevel_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_DebuggingLevel_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_DebuggingLevel_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ long newVal);


void __RPC_STUB IPatrParser_put_DebuggingLevel_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_LexRecordMarker_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_LexRecordMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_LexRecordMarker_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB IPatrParser_put_LexRecordMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_LexWordMarker_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_LexWordMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_LexWordMarker_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB IPatrParser_put_LexWordMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_LexCategoryMarker_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_LexCategoryMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_LexCategoryMarker_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB IPatrParser_put_LexCategoryMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_LexFeaturesMarker_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_LexFeaturesMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_LexFeaturesMarker_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB IPatrParser_put_LexFeaturesMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_LexGlossMarker_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_LexGlossMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_LexGlossMarker_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB IPatrParser_put_LexGlossMarker_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_TopFeatureOnly_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_TopFeatureOnly_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_TopFeatureOnly_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_TopFeatureOnly_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_DisplayFeatures_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_DisplayFeatures_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_DisplayFeatures_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_DisplayFeatures_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_FlatFeatureDisplay_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_FlatFeatureDisplay_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_FlatFeatureDisplay_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_FlatFeatureDisplay_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_Failures_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_Failures_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_Failures_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_Failures_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_CodePage_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_CodePage_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_CodePage_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ long newVal);


void __RPC_STUB IPatrParser_put_CodePage_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPatrParser_DisambiguateAnaFile_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR bstrInput,
	/* [in] */ BSTR bstrOutput);


void __RPC_STUB IPatrParser_DisambiguateAnaFile_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_WriteAmpleParses_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_WriteAmpleParses_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_WriteAmpleParses_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_WriteAmpleParses_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPatrParser_LoadAnaFile_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR bstrAnaFile,
	/* [in] */ BOOL fAdd);


void __RPC_STUB IPatrParser_LoadAnaFile_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPatrParser_ReloadLexicon_Proxy(
	IPatrParser __RPC_FAR * This);


void __RPC_STUB IPatrParser_ReloadLexicon_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_LexiconFileCount_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ long __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_LexiconFileCount_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_PromoteDefaultAtoms_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_PromoteDefaultAtoms_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_PromoteDefaultAtoms_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_PromoteDefaultAtoms_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_SentenceFinalPunctuation_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BSTR __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_SentenceFinalPunctuation_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_SentenceFinalPunctuation_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BSTR newVal);


void __RPC_STUB IPatrParser_put_SentenceFinalPunctuation_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE IPatrParser_get_AmplePropertyIsFeature_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [retval][out] */ BOOL __RPC_FAR *pVal);


void __RPC_STUB IPatrParser_get_AmplePropertyIsFeature_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);


/* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE IPatrParser_put_AmplePropertyIsFeature_Proxy(
	IPatrParser __RPC_FAR * This,
	/* [in] */ BOOL newVal);


void __RPC_STUB IPatrParser_put_AmplePropertyIsFeature_Stub(
	IRpcStubBuffer *This,
	IRpcChannelBuffer *_pRpcChannelBuffer,
	PRPC_MESSAGE _pRpcMessage,
	DWORD *_pdwStubPhase);



#endif 	/* __IPatrParser_INTERFACE_DEFINED__ */



#ifndef __PATR100Lib_LIBRARY_DEFINED__
#define __PATR100Lib_LIBRARY_DEFINED__

/* library PATR100Lib */
/* [helpstring][version][uuid] */


EXTERN_C const IID LIBID_PATR100Lib;

EXTERN_C const CLSID CLSID_PatrParser;

#ifdef __cplusplus

class DECLSPEC_UUID("32787A00-5405-11D3-8FD4-00400541F6D3")
PatrParser;
#endif
#endif /* __PATR100Lib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long __RPC_FAR *, unsigned long            , BSTR __RPC_FAR * );
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * );
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * );
void                      __RPC_USER  BSTR_UserFree(     unsigned long __RPC_FAR *, BSTR __RPC_FAR * );

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif
