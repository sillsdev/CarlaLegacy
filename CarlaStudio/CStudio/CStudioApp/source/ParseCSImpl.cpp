// ParseCSImpl.cpp : Implementation of CParseCSImpl
#include "stdafx.h"
#include "Carlastudioapp.h"
#include "ParseCSImpl.h"
#include "PhraseParser.h"
#include "LangModelsDoc.h"
#include "CarlaLanguage.h"
#include "projectDoc.h"
#include "AmpleResult.h"

/////////////////////////////////////////////////////////////////////////////
// CParseCSImpl

static CString sThrow; // static so it doesn't go out of scope during the throw
						// and loose its contents
#define throwIt throw (LPCTSTR)sThrow;


CParseCSImpl::CParseCSImpl()
{
	m_pPhraseParser = new CPhraseParser;

}
void CParseCSImpl::FinalRelease()
{
	if(m_pPhraseParser)
		delete m_pPhraseParser;
	m_pPhraseParser = 0;
}

STDMETHODIMP CParseCSImpl::get_Options(long *pVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	// TODO: Add your implementation code here

	return S_OK;
}

STDMETHODIMP CParseCSImpl::put_Options(long newVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	// TODO: Add your implementation code here

	return S_OK;
}




STDMETHODIMP CParseCSImpl::ParseString(BSTR sPhrase, BOOL bTrace, BSTR sTraceWords,
								   BOOL bForceRefresh, BSTR *pbstrResult)
{
	USES_CONVERSION;
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	if(m_bstrSourceLangCode.Length == 0)
		return Error ("The language code was not set before calling Execute()");

	if(!m_pPhraseParser)
		return Error ("CS bug: Somehow the PhraseParser was not created before calling Execute()");

	try
	{

		CString sResult = m_pPhraseParser->parseString(OLE2A(sPhrase), bTrace, OLE2A(sTraceWords), bForceRefresh);


		// need to process the result because AMPLEDLL doesn't currently
		// return clean XML
		// build the parse part of the answer
		CAmpleResult* pAResult = CAmpleResult::buildResult(sResult);
		if(pAResult)
		{
			sResult = pAResult->getXMLRepresentation(NULL);
			delete pAResult;
		}
		else
		{
			sThrow.Format("Could not understand: %s",sResult);
			return Error (sThrow);
		}


		CComBSTR bstrResult;
		bstrResult = sResult;
		bstrResult.CopyTo(pbstrResult);
		return S_OK;
	}
	catch (LPCTSTR s)
	{
		return Error(s);
	}

}

// jdh 13 June 2000
// This method is used to parse many words at once.
// Input is just a list of words which will be parsed.
//			the contents of that file will be fed to the ample DLL without any conversion.  This will often be
//			just a list of words from a word list.
//Output is an XML file
#include <fstream.h>
STDMETHODIMP CParseCSImpl::ParseFile(BSTR bstrInputFilePath, BSTR bstrOutputFilePath, BOOL bForceRefresh)
{
	USES_CONVERSION;
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	if(m_bstrSourceLangCode.Length == 0)
		return Error ("The language code was not set before calling Execute()");

	if(!m_pPhraseParser)
		return Error ("CS bug: Somehow the PhraseParser was not created before calling Execute()");

	try
	{
		// note that currently, we just read in the file here and then treat it like a big string
		//  in the future, we might do better by having a means to pass this file along, rather than
		//reading it in here.

/*		CString sInputFilePath = OLE2A(bstrInputFilePath);
		fstream fin(sInputFilePath, ios::in);

		fin.seekg(0,ios::end);
		long sz = fin.tellg();
		fin.seekg(0,ios::beg);
		CString sContents;
		char* pBuf = sContents.GetBufferSetLength(sz+1);
		fin.read(pBuf, sz);
		pBuf[sz] = '\0';
		sContents.ReleaseBuffer(-1);
		CString sResult;
*/
		CString sResult= m_pPhraseParser->parseFile(OLE2A(bstrInputFilePath), OLE2A(bstrOutputFilePath), bForceRefresh);


		// need to process the result because AMPLEDLL doesn't currently
		// return clean XML
		// build the parse part of the answer
/*		ofstream ftest("c:\\cstest.xml");
		ftest << sResult;
		ftest.close();
*/

		/*
		CAmpleResult* pAResult = CAmpleResult::buildResult(sResult);
		if(pAResult)
		{
			//give this method the output file path, so it can write the result to a file rather than to a string.
			// this will be at least ten times faster for multiple words, since the string buffer method is constantly reallocating to get larger memory.
			pAResult->getXMLRepresentation(OLE2A(bstrOutputFilePath));
			delete pAResult;
		}
		else
		{
			sThrow.Format("Could not understand: %s",sResult);
			return Error (sThrow);
		}
*/

		return S_OK;
	}
	catch (LPCTSTR s)
	{
		return Error(s);
	}
}

STDMETHODIMP CParseCSImpl::get_LangCodesString(BSTR *pVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	USES_CONVERSION;

	CProjectDoc *pp = theApp.getProject();
	CComBSTR s;

	int i;
	CTypedPtrArray<CPtrArray , CLangModelsDoc*>& vecLangDocs = pp->getLangDocs();
	for(i = 0; i<vecLangDocs.GetSize(); i++)
	{
		CLangModelsDoc* pDoc = vecLangDocs.ElementAt(i);
		CCarlaLanguage *pL = pDoc->getLang();
		s += A2OLE(pL->getUniqueID());
		if(i<(vecLangDocs.GetSize()-1)) // if not the last one
			s += L",";
	}
	s.CopyTo(pVal);

	return S_OK;
}

STDMETHODIMP CParseCSImpl::get_SourceLangeCode(BSTR *pbstrCode)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	m_bstrSourceLangCode.CopyTo(pbstrCode);

	return S_OK;
}

STDMETHODIMP CParseCSImpl::put_SourceLangeCode(BSTR bstrCode)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	try
	{
		getLangFromCode(bstrCode); // just check it out
	}
	catch (LPCTSTR s)
	{
		return Error(s);
	}

	m_bstrSourceLangCode = bstrCode;	// if it's a valid code
	m_pPhraseParser->setLanguage(getLangFromCode(m_bstrSourceLangCode));

	return S_OK;
}

// Protected (not part of COM interface)
CCarlaLanguage* CParseCSImpl::getLangFromCode(BSTR bstrLangCode)
{
	USES_CONVERSION;
	CString sLangCode = OLE2A(bstrLangCode);
	if(sLangCode.IsEmpty())
	{
		sThrow = ("Somehow CarlaStudio was handed an empty language code string");
		throwIt;
	}

	CCarlaLanguage* pLang = theApp.getProject()->getLangFromID(sLangCode);
	if(!pLang)
	{
		sThrow.Format("This project does not have a language with code %s", sLangCode);
		throwIt;
	}

	return pLang;
}



STDMETHODIMP CParseCSImpl::get_LangInfoXML(BSTR *pVal)
{
	AFX_MANAGE_STATE(AfxGetStaticModuleState())

	USES_CONVERSION;

	CProjectDoc *pp = theApp.getProject();
	CString sOut = "<CSLangs>";

	CTypedPtrArray<CPtrArray , CLangModelsDoc*>& vecLangDocs = pp->getLangDocs();
	for(int i = 0; i<vecLangDocs.GetSize(); i++)
	{
		CLangModelsDoc* pDoc = vecLangDocs.ElementAt(i);
		CCarlaLanguage *pL = pDoc->getLang();
		CString sLang;
		sLang.Format("<lang id='%s' name='%s' abrev='%s' ctrlFilesDir='%s'>",
					pL->getUniqueID(),
					pL->getName(),
					pL->getAbrev(),
					pL->getMFS()->getCtrlFilesDirectory());

		const CTextDisplayInfo* pD = pL->getDisplayInfo();
		ASSERTX(pD);
		CString s;
		s.Format("<display morphnamesInLangFont='%s'>", pD->m_bShowMorphnamesInLangFont?"y":"n");
		sLang+= s;

			CFont* pF = pD->getFont();
			LOGFONT lf;
			pF->GetLogFont(&lf);
		s.Format("<font faceName='%s' />" , lf.lfFaceName);
		sLang+= s;
		sLang+= "</display>";
		sLang += "</lang>";
		sOut += sLang;
	}

	sOut += "</CSLangs>";

	CComBSTR bstr(sOut);
	bstr.CopyTo(pVal);

	return S_OK;
}
