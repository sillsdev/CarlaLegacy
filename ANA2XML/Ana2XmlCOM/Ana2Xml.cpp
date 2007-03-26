// Ana2Xml.cpp : Implementation of CAna2Xml
#include "stdafx.h"
#include "Ana2XmlCOM.h"
#include "Ana2Xml.h"

/////////////////////////////////////////////////////////////////////////////
// CAna2Xml

CAna2Xml::CAna2Xml()
{
  m_AnaData.iDebugLevel = 0;
  m_AnaData.cBeginRoot  = '<';
  m_AnaData.cEndRoot    = '>';
  m_AnaData.uiWordCount = 1;
  m_AnaData.sTextCtl.pszTextControlFile    = NULL;
  m_AnaData.sTextCtl.pLowercaseLetters     = NULL;
  m_AnaData.sTextCtl.pUppercaseLetters     = NULL;
  m_AnaData.sTextCtl.pCaselessLetters      = NULL;
  m_AnaData.sTextCtl.pOrthoChanges         = NULL;
  m_AnaData.sTextCtl.pOutputChanges        = NULL;
  m_AnaData.sTextCtl.pIncludeFields        = NULL;
  m_AnaData.sTextCtl.pExcludeFields        = NULL;
  m_AnaData.sTextCtl.cFormatMark           = '\\';
  m_AnaData.sTextCtl.cAnaAmbig             = '%';
  m_AnaData.sTextCtl.cTextAmbig            = '%';
  m_AnaData.sTextCtl.cDecomp               = '-';
  m_AnaData.sTextCtl.cBarMark              = '|';
  m_AnaData.sTextCtl.pszBarCodes           = NULL;
  m_AnaData.sTextCtl.bIndividualCapitalize = TRUE;
  m_AnaData.sTextCtl.bCapitalize           = TRUE;
  m_AnaData.sTextCtl.uiMaxAmbigDecap       = 100;
  m_AnaData.pszInputFile  = NULL;
  m_AnaData.pInputFP      = NULL;
  m_AnaData.pszOutputFile = NULL;
  m_AnaData.pOutputFP     = NULL;
  m_AnaData.pszLogFile    = NULL;
  m_AnaData.pLogFP        = NULL;
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    CAna2Xml::ConvertBstrToString
// DESCRIPTION
//    convert a Unicode BSTR to a C-style string
// RETURN VALUE
//    S_OK, or an appropriate COM error code
//
HRESULT CAna2Xml::ConvertBstrToString(const BSTR bstr_in,
	UINT iCodePage,
	char ** ppsz_out)
{
	if ((bstr_in == NULL) || (ppsz_out == NULL))
	{
		return E_UNEXPECTED;
	}
	int cchw = SysStringLen(bstr_in);
	int cb = WideCharToMultiByte(iCodePage, 0, bstr_in, cchw, NULL, 0,
		NULL, NULL);
	if (cb == 0)
	{
		return E_INVALIDARG;
	}
	char * psz = (char *)malloc(cb + 1);
	if (psz == NULL)
	{
		return E_OUTOFMEMORY;
	}
	WideCharToMultiByte(iCodePage, 0, bstr_in, cchw, psz, cb, NULL, NULL);
	psz[cb] = '\0';
	*ppsz_out = psz;
	return S_OK;
}

	// Following two routines are internal support methods
		// (taken unashamedly and with much gratitude from the PcPatr code)

///////////////////////////////////////////////////////////////////////////////
// NAME
//    CAna2Xml::ConvertStringToBstr
// DESCRIPTION
//    Convert a C-style string to a Unicode BSTR.
// RETURN VALUE
//    S_OK, or an appropriate COM error code
//
HRESULT CAna2Xml::ConvertStringToBstr(const char * psz,
	UINT iCodePage,
	BSTR * pbstr)
{
	int cchw = MultiByteToWideChar(iCodePage, 0, psz, -1, NULL, 0);
	if (cchw == 0)
	{
		return E_UNEXPECTED;
	}
	BSTR bstr = SysAllocStringLen(NULL, cchw);
	if (bstr == NULL)
	{
		return E_OUTOFMEMORY;
	}
	MultiByteToWideChar(iCodePage, 0, psz, -1, bstr, cchw);
	bstr[cchw] = 0;
	*pbstr = bstr;
	return S_OK;
}

///////////////////////////////////////////////////////////////////////////////
// NAME
//    CAna2Xml::ConvertFile
// DESCRIPTION
//    Parse the sentences found in the given input file, writing the results to
//    the given output file.
// RETURN VALUE
//    S_OK, or an appropriate COM error code
//
STDMETHODIMP CAna2Xml::ConvertFile(BSTR bstrInput, BSTR bstrOutput)
{
  // check for valid input
  if ((bstrInput == NULL) || (bstrOutput == NULL))
	{
	  return E_INVALIDARG;
	}
  // open the files
  HRESULT hr = ConvertBstrToString(bstrInput, CP_ACP,
				   &m_AnaData.pszInputFile);
  if (FAILED(hr))
	{
	  return hr;
	}
  m_AnaData.pInputFP = fopen(m_AnaData.pszInputFile, "r");
  if (m_AnaData.pInputFP == NULL)
	{
	  free(m_AnaData.pszInputFile);
	  return E_FAIL;
	}
  hr = ConvertBstrToString(bstrOutput, CP_ACP, &m_AnaData.pszOutputFile);
  if (FAILED(hr))
	{
	  free(m_AnaData.pszInputFile);
	  fclose(m_AnaData.pInputFP);
	  return hr;
	}
  m_AnaData.pOutputFP = fopen(m_AnaData.pszOutputFile, "w");
  if (m_AnaData.pOutputFP == NULL)
	{
	  free(m_AnaData.pszOutputFile);
	  free(m_AnaData.pszInputFile);
	  fclose(m_AnaData.pInputFP);
	  return E_FAIL;
	}
  if (m_AnaData.pszLogFile != NULL)
	{
	  m_AnaData.pLogFP = fopen(m_AnaData.pszLogFile, "w");
	  if (m_AnaData.pLogFP == NULL)
	{
	  free(m_AnaData.pszOutputFile);
	  free(m_AnaData.pszInputFile);
	  fclose(m_AnaData.pInputFP);
	  fclose(m_AnaData.pOutputFP);
	  return E_FAIL;
	}
	}

				//  allocate space for records
  pRecordBuffer_g	     = (char *)allocMemory( BIG_RECSIZE );
  uiRecordBufferSize_g = BIG_RECSIZE;

  performMapping(&m_AnaData);

  fclose(m_AnaData.pInputFP);
  free((void *)m_AnaData.pszInputFile);

  fclose(m_AnaData.pOutputFP);
  free((void *)m_AnaData.pszOutputFile);

  if (m_AnaData.pLogFP != NULL)
	{
	  fclose(m_AnaData.pLogFP);
	}

  freeMemory(pRecordBuffer_g);
  return S_OK;
}

STDMETHODIMP CAna2Xml::get_DecompositionSepCharacter(BSTR *pVal)
{
  char pszTemp[2];
  pszTemp[0] = m_AnaData.sTextCtl.cDecomp;
  pszTemp[1] = '\0';
  HRESULT hr = ConvertStringToBstr(pszTemp, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CAna2Xml::put_DecompositionSepCharacter(BSTR newVal)
{
  if (newVal == NULL)
	{
	  return E_INVALIDARG;
	}
  char * pszTemp;
  HRESULT hr = ConvertBstrToString(newVal, CP_ACP, &pszTemp);
  if (FAILED(hr))
	{
	  return hr;
	}
  m_AnaData.sTextCtl.cDecomp = *pszTemp;
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CAna2Xml::get_InputFileName(BSTR *pVal)
{
  HRESULT hr = ConvertStringToBstr(m_AnaData.pszInputFile, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CAna2Xml::put_InputFileName(BSTR newVal)
{
  if (newVal == NULL)
	{
	  return E_INVALIDARG;
	}
  char * pszTemp;
  HRESULT hr = ConvertBstrToString(newVal, CP_ACP, &pszTemp);
  if (FAILED(hr))
	{
	  return hr;
	}
  m_AnaData.pszInputFile = duplicateString(pszTemp);
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CAna2Xml::get_OutputFileName(BSTR *pVal)
{
  HRESULT hr = ConvertStringToBstr(m_AnaData.pszOutputFile, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CAna2Xml::put_OutputFileName(BSTR newVal)
{
  if (newVal == NULL)
	{
	  return E_INVALIDARG;
	}
  char * pszTemp;
  HRESULT hr = ConvertBstrToString(newVal, CP_ACP, &pszTemp);
  if (FAILED(hr))
	{
	  return hr;
	}
  m_AnaData.pszOutputFile = duplicateString(pszTemp);
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CAna2Xml::get_LogFileName(BSTR *pVal)
{
  HRESULT hr = ConvertStringToBstr(m_AnaData.pszLogFile, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CAna2Xml::put_LogFileName(BSTR newVal)
{
  if (newVal == NULL)
	{
	  return E_INVALIDARG;
	}
  char * pszTemp;
  HRESULT hr = ConvertBstrToString(newVal, CP_ACP, &pszTemp);
  if (FAILED(hr))
	{
	  return hr;
	}
  m_AnaData.pszLogFile = duplicateString(pszTemp);
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CAna2Xml::get_AmbiguitySepCharacter(BSTR *pVal)
{
  char pszTemp[2];
  pszTemp[0] =  m_AnaData.sTextCtl.cAnaAmbig;
  pszTemp[1] = '\0';
  HRESULT hr = ConvertStringToBstr(pszTemp, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CAna2Xml::put_AmbiguitySepCharacter(BSTR newVal)
{
  if (newVal == NULL)
	{
	  return E_INVALIDARG;
	}
  char * pszTemp;
  HRESULT hr = ConvertBstrToString(newVal, CP_ACP, &pszTemp);
  if (FAILED(hr))
	{
	  return hr;
	}
  m_AnaData.sTextCtl.cAnaAmbig = *pszTemp;
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CAna2Xml::get_RootBeginDelimiter(BSTR *pVal)
{
  char pszTemp[2];
  pszTemp[0] =  m_AnaData.cBeginRoot;
  pszTemp[1] = '\0';
  HRESULT hr = ConvertStringToBstr(pszTemp, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CAna2Xml::put_RootBeginDelimiter(BSTR newVal)
{
  if (newVal == NULL)
	{
	  return E_INVALIDARG;
	}
  char * pszTemp;
  HRESULT hr = ConvertBstrToString(newVal, CP_ACP, &pszTemp);
  if (FAILED(hr))
	{
	  return hr;
	}
  m_AnaData.cBeginRoot = *pszTemp;
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CAna2Xml::get_RootEndDelimiter(BSTR *pVal)
{
  char pszTemp[2];
  pszTemp[0] =  m_AnaData.cEndRoot;
  pszTemp[1] = '\0';
  HRESULT hr = ConvertStringToBstr(pszTemp, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CAna2Xml::put_RootEndDelimiter(BSTR newVal)
{
  if (newVal == NULL)
	{
	  return E_INVALIDARG;
	}
  char * pszTemp;
  HRESULT hr = ConvertBstrToString(newVal, CP_ACP, &pszTemp);
  if (FAILED(hr))
	{
	  return hr;
	}
  m_AnaData.cEndRoot = *pszTemp;
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CAna2Xml::FinalCleanup()
{
  if (m_AnaData.pszLogFile != NULL)
	{
	  free((void *)m_AnaData.pszLogFile);
	}

  return S_OK;
}
