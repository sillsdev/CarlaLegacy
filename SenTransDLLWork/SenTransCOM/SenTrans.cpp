// SenTrans.cpp : Implementation of CSenTrans
#include "stdafx.h"
#include "SenTransCOM.h"
#include "SenTrans.h"
#include <time.h>               /* For time of run */
#include <ctype.h>
#include "SenTransLib.h"

//	26-sept-2000 jdh uppped temp mem from 64000 to 640000

/////////////////////////////////////////////////////////////////////////////
// CSenTrans

CSenTrans::CSenTrans()
  : m_pszInputFile(_T("")),
	m_pszOutputFile(_T("")),
	m_pszLogFile(_T(""))
{
  m_SenTransData.do_ambig_monitor = FALSE; // -a Monitor ambigs output
  m_SenTransData.comment_char    = '|';	  // -c Comment character
  m_SenTransData.do_monitor      = FALSE; // -m Monitor progress
  m_SenTransData.do_trace        = FALSE; // -t Output trace info
  m_SenTransData.do_dumpclass    = FALSE; // -v Dump class info to log
  m_SenTransData.ignore_cat      = FALSE; // -x Ignore \cat field in input
  m_SenTransData.do_debug        = FALSE; // -z Output debug info
  m_SenTransData.pLogFP          = NULL;  //  > Log file pointer
  m_SenTransData.rulefname       = NULL;  // -r Rule file name
  m_SenTransData.pRuleFP         = NULL;  // pointer to rule file
  m_SenTransData.pErrorLogFP     = NULL;  // Error log pointer (for monitoring)
  m_SenTransData.ruletrycount    = 0;     // Number of rules tried
  m_SenTransData.ambigcount      = 0;    // Number of disambiguations performed
  m_SenTransData.ruchgcount      = NULL;  // Number of actual changes made
  m_SenTransData.rulecount       = 0;     // Total number of rules in rule file
  m_SenTransData.rejcount        = 0;     // Number of rej rules
  m_SenTransData.amcount         = 0;     // Number of am rules
  m_SenTransData.rejuncount      = 0;     // Number of rejun rules
  m_SenTransData.amuncount       = 0;     // Number of amun rules
  m_SenTransData.rucount         = 0;     // Number of ru rules
  m_SenTransData.rulesoffcount   = 0;     // Number of rulesoff rules
  m_SenTransData.rulesoncount    = 0;     // Number of ruleson rules
  m_SenTransData.num_sents       = 0;     // Number of sentences processed
  m_SenTransData.num_words       = 0;    // Number of words output, for monitor
  m_SenTransData.tot_words_in    = 0;     // Counts of words & ambigs in & out
  m_SenTransData.tot_ambig_words_in = 0;  // Number of ambiguous words input
  m_SenTransData.tot_ambigs_in   = 0;	  // Number of ambiguities in
  m_SenTransData.tot_words_out   = 0;     // Number of words output
  m_SenTransData.tot_ambig_words_out = 0; // Number of ambiguous words output
  m_SenTransData.tot_ambigs_out  = 0;     // Number of ambiguities output
  m_SenTransData.line            = NULL;  // Input line
  m_SenTransData.firstpat        = NULL;  // First pattern
  m_SenTransData.firstcl         = NULL;  // First class
  m_SenTransData.firstcat        = NULL;  // First category
  m_SenTransData.firstprop       = NULL;  // First property
  m_SenTransData.rules           = NULL;  // General rule list
  m_SenTransData.sent_punc    = ".?!:;";  // Sentence terminators
  m_SenTransData.other_punc   = "-,'/\""; // Other punctuation
  m_SenTransData.begin_punc   = "'\"";	  // Begin punctuation
#ifndef hab221
  m_SenTransData.bMorphsHaveCats = FALSE; // all morphs have cats in \cat field
#endif // hab221
}

	// Following two routines are internal support methods
		// (taken unashamedly and with much gratitude from the PcPatr code)

///////////////////////////////////////////////////////////////////////////////
// NAME
//    CSenTrans::ConvertBstrToString
// DESCRIPTION
//    convert a Unicode BSTR to a C-style string
// RETURN VALUE
//    S_OK, or an appropriate COM error code
//
HRESULT CSenTrans::ConvertBstrToString(const BSTR bstr_in,
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

///////////////////////////////////////////////////////////////////////////////
// NAME
//    CSenTrans::ConvertStringToBstr
// DESCRIPTION
//    Convert a C-style string to a Unicode BSTR.
// RETURN VALUE
//    S_OK, or an appropriate COM error code
//
HRESULT CSenTrans::ConvertStringToBstr(const char * psz,
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

STDMETHODIMP CSenTrans::get_bIgnoreCatField(BOOL *pVal)
{
  *pVal = m_SenTransData.ignore_cat;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_bIgnoreCatField(BOOL newVal)
{
  m_SenTransData.ignore_cat = newVal;

  return S_OK;
}

STDMETHODIMP CSenTrans::get_bEchoClassContentsInLogFile(BOOL *pVal)
{
  *pVal = m_SenTransData.do_dumpclass;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_bEchoClassContentsInLogFile(BOOL newVal)
{
  m_SenTransData.do_dumpclass = newVal;

  return S_OK;
}

STDMETHODIMP CSenTrans::get_bTraceRuleApplication(BOOL *pVal)
{
  *pVal = m_SenTransData.do_trace;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_bTraceRuleApplication(BOOL newVal)
{
  m_SenTransData.do_trace = newVal;

  return S_OK;
}

STDMETHODIMP CSenTrans::get_CommentChar(BSTR *pVal)
{
  char pszTemp[2];
  pszTemp[0] = m_SenTransData.comment_char;
  pszTemp[1] = '\0';
  HRESULT hr = ConvertStringToBstr(pszTemp, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_CommentChar(BSTR newVal)
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
  m_SenTransData.comment_char = *pszTemp;
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CSenTrans::get_RuleFileName(BSTR *pVal)
{
  HRESULT hr = ConvertStringToBstr(m_SenTransData.rulefname, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_RuleFileName(BSTR newVal)
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
  m_SenTransData.rulefname = mystrdup(pszTemp);
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CSenTrans::get_InputFileName(BSTR *pVal)
{
  HRESULT hr = ConvertStringToBstr(m_pszInputFile, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_InputFileName(BSTR newVal)
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
  m_pszInputFile = mystrdup(pszTemp);
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CSenTrans::get_OutputFileName(BSTR *pVal)
{
  HRESULT hr = ConvertStringToBstr(m_pszOutputFile, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_OutputFileName(BSTR newVal)
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
  m_pszOutputFile = mystrdup(pszTemp);
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CSenTrans::get_LogFileName(BSTR *pVal)
{
  HRESULT hr = ConvertStringToBstr(m_pszLogFile, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_LogFileName(BSTR newVal)
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
  m_pszLogFile = mystrdup(pszTemp);
  free(pszTemp);
  return S_OK;
}




STDMETHODIMP CSenTrans::ApplyRulesToFile(BSTR bstrRules, BSTR bstrInput, BSTR bstrOutput, BSTR bstrLog)
{
  Word *sent;                 // Current sentence to work on
  void *short_term_bot;       // Short term allocation bottom
  int tot_apps;               // Total number of rules applied to a sent
  int apps;                   // Number of rules applied this round
  time_t		clock;
  char *		pszTime;

  // check for valid input
  if ((bstrRules  == NULL) ||
	  (bstrInput  == NULL) ||
	  (bstrOutput == NULL) ||
	  (bstrLog    == NULL))
	{
	  return E_INVALIDARG;
	}
  // open the files
  HRESULT hr = OpenSenTransFiles(bstrRules, bstrInput, bstrOutput, bstrLog);
  if (FAILED(hr))
	{
	  return hr;
	}

  // do the processing
  // write the header to the log file
  time( &clock );
  pszTime = ctime(&clock);

  if (m_SenTransData.pLogFP != NULL)
	{
	  print_header(m_SenTransData.pLogFP, pszTime);
	  fprintf( m_SenTransData.pLogFP, "Rule   file: %s\n",
		   m_SenTransData.rulefname );    /* Show file names */
	  fprintf( m_SenTransData.pLogFP, "Input  file: %s\n", m_pszInputFile );
	  fprintf( m_SenTransData.pLogFP, "Output file: %s\n", m_pszOutputFile );
	  fprintf( m_SenTransData.pLogFP, "Log    file: %s\n", m_pszLogFile );
	}
				// initialize for this application
  m_SenTransData.line = (char *)myalloc( MAXLINE );
  m_SenTransData.num_sents           = 0;
  m_SenTransData.num_words           = 0;
  m_SenTransData.rulecount           = 0;
  m_SenTransData.rejcount            = 0;
  m_SenTransData.amcount             = 0;
  m_SenTransData.rucount             = 0;
  m_SenTransData.rejuncount          = 0;
  m_SenTransData.amuncount           = 0;
  m_SenTransData.rulesoncount        = 0;
  m_SenTransData.rulesoffcount       = 0;
  m_SenTransData.ruletrycount        = 0;
  m_SenTransData.ambigcount          = 0;
  m_SenTransData.ruchgcount          = 0;
  m_SenTransData.tot_words_in        = 0;
  m_SenTransData.tot_ambig_words_in  = 0;
  m_SenTransData.tot_ambigs_in       = 0;
  m_SenTransData.tot_words_out       = 0;
  m_SenTransData.tot_ambig_words_out = 0;
  m_SenTransData.tot_ambigs_out      = 0;
#ifndef hab221
  m_SenTransData.bMorphsHaveCats     = FALSE;
#endif // hab221

  loadrules( m_SenTransData.pRuleFP, &m_SenTransData ); // Load in rule file

  if ( m_SenTransData.do_debug || m_SenTransData.do_dumpclass )
	dumpclasses( m_SenTransData.firstcl, &m_SenTransData );

  if ( m_SenTransData.do_debug )
	{
	  dumpcats( m_SenTransData.firstcat, &m_SenTransData );
	  dumppats( m_SenTransData.firstpat, &m_SenTransData );
	  dumprules( m_SenTransData.rules, &m_SenTransData );
	}

  if (m_SenTransData.pLogFP)
	fprintf( m_SenTransData.pLogFP,"\
\nSentence Termination punctuation: %s\
\nBeginning            punctuation: %s\
\nOther                punctuation: %s\
\n",
		 m_SenTransData.sent_punc,
		 m_SenTransData.begin_punc,
		 m_SenTransData.other_punc);
	fprintf( m_SenTransData.pLogFP,"\
\nRule summary: %5d total (not counting on/off rules)\
\n              %5d ambiguity rejection  with unanimous env. (\\rejun)\
\n              %5d ambiguity acceptance with unanimous env. (\\amun)\
\n              %5d ambiguity rejection (\\rej)\
\n              %5d ambiguity acceptance (\\am)\
\n              %5d replacement (\\ru)\
\n              %5d rule turn off (\\rulesoff)\
\n              %5d rule turn on  (\\ruleson)\
\n",
		 m_SenTransData.rulecount,
		 m_SenTransData.rejuncount,
		 m_SenTransData.amuncount,
		 m_SenTransData.rejcount,
		 m_SenTransData.amcount,
		 m_SenTransData. rucount,
		 m_SenTransData.rulesoffcount,
		 m_SenTransData.rulesoncount);

  short_term_bot = mytalloc( (unsigned) 640000, // was 64000
				 &m_SenTransData );  // Set up allocator

  while ( (sent = loadsent( m_pInputFP, &m_SenTransData )) != NULL )
	{				// While another sentence
	  tot_apps = 0;
	  apps = applyrules( m_SenTransData.rules, sent,
			 &m_SenTransData );      // Apply  rules
	  tot_apps += apps;

	  putsent( sent, m_pOutputFP,
		   &m_SenTransData ); // Output fixed-up sentence

	  mytfree( short_term_bot );	// Free all temporary space

	  m_SenTransData.num_sents++; // Count sentence
	}

  if (m_SenTransData.pLogFP)
	{
	  fprintf( m_SenTransData.pLogFP, "\nTotal sentences processed:      %d\n",
		   m_SenTransData.num_sents );
	  fprintf( m_SenTransData.pLogFP, "Rule applications attempted:    %u\n",
		   m_SenTransData.ruletrycount );
	  fprintf( m_SenTransData.pLogFP, "Disambiguations & changes done: %u & %u\n\n",
		   m_SenTransData.ambigcount, m_SenTransData.ruchgcount );

	  fprintf( m_SenTransData.pLogFP, "          Words | Ambiguous words | Ambiguities\n");
	  fprintf( m_SenTransData.pLogFP, "In:  %10ld | %15ld | %11ld\n",
		   m_SenTransData.tot_words_in,
		   m_SenTransData.tot_ambig_words_in,
		   m_SenTransData.tot_ambigs_in);
	  fprintf( m_SenTransData.pLogFP, "Out: %10ld | %15ld | %11ld\n",
		   m_SenTransData.tot_words_out,
		   m_SenTransData.tot_ambig_words_out,
		   m_SenTransData.tot_ambigs_out);
	}

  fclose(m_SenTransData.pRuleFP);

  fclose(m_pInputFP);
  free((void *)m_pszInputFile);

  fclose(m_pOutputFP);
  free((void *)m_pszOutputFile);

  if (m_SenTransData.pLogFP != NULL)
	{
	  fclose(m_SenTransData.pLogFP);
	}

  return S_OK;
}

HRESULT CSenTrans::OpenSenTransFiles(BSTR bstrRules, BSTR bstrInput, BSTR bstrOutput, BSTR bstrLog)
{
  HRESULT hr = ConvertBstrToString(bstrRules, CP_ACP,
				   &m_SenTransData.rulefname);
  if (FAILED(hr))
	{
	  return hr;
	}
  m_SenTransData.pRuleFP = fopen(m_SenTransData.rulefname, "r");
  if (m_SenTransData.pRuleFP == NULL)
	{
	  free(m_SenTransData.rulefname);
	  return E_FAIL;
	}
  hr = ConvertBstrToString(bstrInput, CP_ACP, &m_pszInputFile);
  if (FAILED(hr))
	{
	  free(m_SenTransData.rulefname);
	  fclose(m_SenTransData.pRuleFP);
	  return hr;
	}
  m_pInputFP = fopen(m_pszInputFile, "r");
  if (m_pInputFP == NULL)
	{
	  free(m_SenTransData.rulefname);
	  free(m_pszInputFile);
	  fclose(m_SenTransData.pRuleFP);
	  return E_FAIL;
	}
  hr = ConvertBstrToString(bstrOutput, CP_ACP, &m_pszOutputFile);
  if (FAILED(hr))
	{
	  free(m_SenTransData.rulefname);
	  free(m_pszInputFile);
	  fclose(m_SenTransData.pRuleFP);
	  fclose(m_pInputFP);
	  return hr;
	}
  m_pOutputFP = fopen(m_pszOutputFile, "w");
  if (m_pOutputFP == NULL)
	{
	  free(m_SenTransData.rulefname);
	  free(m_pszInputFile);
	  free(m_pszOutputFile);
	  fclose(m_SenTransData.pRuleFP);
	  fclose(m_pInputFP);
	  return E_FAIL;
	}
  if (bstrLog != NULL)
	{
	  hr = ConvertBstrToString(bstrLog, CP_ACP, &m_pszLogFile);
	  if (FAILED(hr))
	{
	  free(m_SenTransData.rulefname);
	  free(m_pszInputFile);
	  free(m_pszOutputFile);
	  fclose(m_SenTransData.pRuleFP);
	  fclose(m_pInputFP);
	  fclose(m_pOutputFP);
	  return hr;
	}
	  m_SenTransData.pLogFP = fopen(m_pszLogFile, "w");
	  if (m_SenTransData.pLogFP == NULL)
	{
	  free(m_SenTransData.rulefname);
	  free(m_pszInputFile);
	  free(m_pszOutputFile);
	  free(m_pszLogFile);
	  fclose(m_SenTransData.pRuleFP);
	  fclose(m_pInputFP);
	  fclose(m_pOutputFP);
	  return E_FAIL;
	}
	}

  return S_OK;
}

STDMETHODIMP CSenTrans::get_SentenceTerminators(BSTR *pVal)
{
  HRESULT hr = ConvertStringToBstr(m_SenTransData.sent_punc, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_SentenceTerminators(BSTR newVal)
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
  m_SenTransData.sent_punc = mystrdup(pszTemp);
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CSenTrans::get_BeginningPunctuation(BSTR *pVal)
{
  HRESULT hr = ConvertStringToBstr(m_SenTransData.begin_punc, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_BeginningPunctuation(BSTR newVal)
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
  m_SenTransData.begin_punc = mystrdup(pszTemp);
  free(pszTemp);
  return S_OK;
}

STDMETHODIMP CSenTrans::get_OtherPunctuation(BSTR *pVal)
{
  HRESULT hr = ConvertStringToBstr(m_SenTransData.other_punc, CP_ACP, pVal);
  if (FAILED(hr))
	return hr;

  return S_OK;
}

STDMETHODIMP CSenTrans::put_OtherPunctuation(BSTR newVal)
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
  m_SenTransData.other_punc = mystrdup(pszTemp);
  free(pszTemp);
  return S_OK;
}
