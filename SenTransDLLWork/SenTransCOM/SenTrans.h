// SenTrans.h : Declaration of the CSenTrans

#ifndef __SENTRANS_H_
#define __SENTRANS_H_

#include "resource.h"       // main symbols
#include "SenTransLib.h"

/////////////////////////////////////////////////////////////////////////////
// CSenTrans
class ATL_NO_VTABLE CSenTrans :
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CSenTrans, &CLSID_SenTrans>,
	public IDispatchImpl<ISenTrans, &IID_ISenTrans, &LIBID_SENTRANSCOMLib>
{
public:
	CSenTrans();

DECLARE_REGISTRY_RESOURCEID(IDR_SENTRANS)
DECLARE_NOT_AGGREGATABLE(CSenTrans)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CSenTrans)
	COM_INTERFACE_ENTRY(ISenTrans)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()

// ISenTrans
public:
	STDMETHOD(get_OtherPunctuation)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_OtherPunctuation)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_BeginningPunctuation)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_BeginningPunctuation)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_SentenceTerminators)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_SentenceTerminators)(/*[in]*/ BSTR newVal);
	STDMETHOD(ApplyRulesToFile)(/*[in]*/ BSTR bstrRules, /*[in]*/ BSTR bstrInput, /*[in]*/ BSTR bstrOutput, /*[in]*/ BSTR bstrLog);
	STDMETHOD(get_bTraceRuleApplication)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_bTraceRuleApplication)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_bEchoClassContentsInLogFile)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_bEchoClassContentsInLogFile)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_bIgnoreCatField)(/*[out, retval]*/ BOOL *pVal);
	STDMETHOD(put_bIgnoreCatField)(/*[in]*/ BOOL newVal);
	STDMETHOD(get_CommentChar)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_CommentChar)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_LogFileName)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_LogFileName)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_OutputFileName)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_OutputFileName)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_InputFileName)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_InputFileName)(/*[in]*/ BSTR newVal);
	STDMETHOD(get_RuleFileName)(/*[out, retval]*/ BSTR *pVal);
	STDMETHOD(put_RuleFileName)(/*[in]*/ BSTR newVal);

	SenTransData m_SenTransData;
	TCHAR * m_pszInputFile;
	TCHAR * m_pszOutputFile;
	TCHAR * m_pszLogFile;
	FILE * m_pInputFP;
	FILE * m_pOutputFP;

	// internal support methods (taken unashamedly and with much gratitude
	// from the PcPatr code)
	HRESULT ConvertBstrToString(const BSTR bstr, UINT iCodePage, char ** ppsz);
	HRESULT ConvertStringToBstr(const char * psz, UINT iCodePage,
		BSTR * pbstr);
protected:
	HRESULT OpenSenTransFiles(BSTR bstrRules, BSTR bstrInput, BSTR bstrOutput, BSTR bstrLog);

#ifdef Wrong
#ifdef __cplusplus
extern "C" {
#endif

/* clever hack to handle function prototypes flexibly */
#ifdef HAVE_PROTOTYPES
#define P(args) args
#else
#define P(args) ()
#endif
				// SenTrans lib
extern int   applyrules   P((Rule *rules, Word *sent,
				 SenTransData *pSenTransData));
extern void  dumpcats     P((Mem *cat, SenTransData *pSenTransData ));
extern void  dumpclasses  P((Class *cl, SenTransData *pSenTransData));
extern void  dumppats     P((Pat *pat, SenTransData *pSenTransData));
extern void  dumprules    P((Rule *ru, SenTransData *pSenTransData));
extern void  putsent      P((Word *sent, FILE *outfile,
				 SenTransData *pSenTransData));
extern void *myalloc      P((unsigned size));
extern void *mytalloc     P((unsigned region, SenTransData *pSenTransData));
extern void  mytfree      P((void *reg_bot));
extern void  loadrules    P((FILE *pRuleFP, SenTransData *pSenTransData));
extern Word *loadsent     P((FILE *infile, SenTransData *pSenTransData));
extern void  print_header P((FILE *pOutFP_in, char *pszTime_in));

#undef P
#ifdef __cplusplus
}
#endif
#endif // Wrong
};

#endif //__SENTRANS_H_
