// SenTransDllProcess.cpp: implementation of the CSenTransDllProcess class.
//
// 1.1.0 19-Jun-2000 hab initial coding
// 1.1.1 26-Jun-2000 hab Add in process template
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include <strstrea.h>
#include <fstream.h>
#include "Process.h"
#include "SenTransDllProcess.h"
#include "ModelFilesSet.h"
#include "SFMFile.h"
#include "DlgEditSentransDllProcess.h"
#include "ProcessingPrefs.h"
#include "processoutput.h"
#include "logwindow.h"
#include "processStatus.h"
#include "CarlaLanguage.h"
#include "SenTransCom.h"
#include "SenTransCom_i.c"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

// override
// Bit of a hack here to ensure a reasonable function for the sentrans
// process, based on what sequence its in.  If we're in a transfer
// sequence, then that must be the goal.
CProcess* CSenTransDllProcessTemplate::createProcess(int iSeqFunctionCode, SFMFile* pInputFile)
{
  CProcess* p = CProcessTemplate::createProcess(iSeqFunctionCode, pInputFile);
  ASSERTX(p->IsKindOf(RUNTIME_CLASS(CSenTransDllProcess)));
  if(-1 != iSeqFunctionCode)
	{
	  switch(iSeqFunctionCode)
	{
	case CProcess::kAnalysis:
				// note that the user can change this to kAdjustSrcAnalysis. THis
				// is just the default.
	  ((CSenTransDllProcess*)p)->m_iFunction = CSenTransDllProcess::kDisambig;
	  break;
	case CProcess::kInterlinear:
	  ((CSenTransDllProcess*)p)->m_iFunction = CSenTransDllProcess::kAdjustSrcGlossing;
	  break;
	case CProcess::kTransfer:
	  ((CSenTransDllProcess*)p)->m_iFunction = CSenTransDllProcess::kTransfer;
	  break;
	default: ASSERTX(FALSE);
	}
	  // else leave it to the default
	}
  return p;
}

IMPLEMENT_DYNCREATE(CSenTransDllProcess, CDLLProcess);


CSenTransDllProcess::CSenTransDllProcess(int iFunction)
:CDLLProcess()
{
  setDefaultValues();
  m_iFunction = iFunction; // must be *after* setDefaultValues
}


// called by CProcess constructor
// even if the values will be read in, we need this in case some values are
// missing (as will happen when the user is upgrading to a new version)
void CSenTransDllProcess::setDefaultValues()
{
	 m_bMonitorAmbiguities = FALSE;
	 m_bMonitorRulesApplied = FALSE;
	 m_bTraceRules = FALSE;
	 m_bOutputClassContents = FALSE;
	 m_iFunction = kDisambig;
}

void CSenTransDllProcess::readParametersFromSFMFile(SFMFile *f)
{
	setDefaultValues();
	CString sMarker, sField;
	while(f->getField(sMarker, sField))
	{
		if(sMarker=="-Process")
			break;
		else checkAndReadBool( "MonitorAmbiguities", m_bMonitorAmbiguities)
		else checkAndReadBool( "MonitorRulesApplied", m_bMonitorRulesApplied)
		else checkAndReadBool( "OutputClassContents", m_bOutputClassContents)
		else checkAndReadBool( "TraceRules", m_bTraceRules)
		else checkAndReadInt( "Function", m_iFunction)
		else checkAndReadString("OtherRuleFile", m_sOtherRuleFilePath)
		else f->throwParseFailure(_T("SENTRANSDLLProcess"), sMarker, sField);
	}
}

void CSenTransDllProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process " << getProcessorID() << PROC_ENABLED_STATUS << "\n";
	outputInt(fout, "Function",m_iFunction);
	outputBool(fout, "MonitorAmbiguities",m_bMonitorAmbiguities);
	outputBool(fout, "MonitorRulesApplied",m_bMonitorRulesApplied);
	outputBool(fout, "OutputClassContents",m_bOutputClassContents);
	outputBool(fout, "TraceRules",m_bTraceRules);
	USES_CONVERSION_U8;
	if(m_iFunction == kOtherRuleFile)
		fout << "\\OtherRuleFile " << T2CU8(m_sOtherRuleFilePath) << "\n";

	fout << "\\-Process " << getProcessorID() << "\n";
}

// EXCEPTIONS: CProcessFailure
void CSenTransDllProcess::processANAFile(CProcessStatus& status)
{
  CModelFilesSet* pSourceMFS = status.getInputMFS();
  ASSERTX(pSourceMFS);
  CModelFilesSet* pTargetMFS = status.getOutputMFS(); // may be null
  // skip this process if there is nothing to do
  switch(m_iFunction)
	{
	case kDisambig:
	  if(status.getInputLang()->getSentransDisambigModel().m_rules.getSize() ==0)
	return;
	  m_sRuleFile = pSourceMFS->getShortCtrlFilePath(_T("disam.sen"));
	  break;
	case kAdjustSrcGlossing:
	  if(status.getInputLang()->getSentransGlossAdjustmentModel().m_rules.getSize() ==0)
	return;
	  m_sRuleFile = pSourceMFS->getShortCtrlFilePath(_T("adj.sen"));;
	  break;

	  // JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
	case kAdjustAnalysis:
	  if(status.getInputLang()->getSentransAnaAdjustmentModel().m_rules.getSize() ==0)
	return;
	  m_sRuleFile = pSourceMFS->getShortCtrlFilePath(_T("ana.sen"));;
	  break;

	case kOtherRuleFile:	// jdh 15June2000
	  if(!m_sOtherRuleFilePath.fileExists())
	{
	  CString sMsg;
	  sMsg.Format(_T("The external SENTRANS rule file could not be found.\n\"%s\""), LPCTSTR(m_sOtherRuleFilePath));
	  AfxMessageBox(sMsg);
	  return;
	}
	  m_sRuleFile = m_sOtherRuleFilePath.getShortPath();
	  break;

	case kTransfer:
	  m_sRuleFile = ::shortenPath(pTargetMFS->getSentransTransferPath(pSourceMFS->getAbrev(), pTargetMFS->getAbrev()));;
	  break;
	default: ASSERTX(FALSE); break;
	}

	// remember, we could be operating on ana from any process, including another sentrans process

  try
	{
	  ISenTrans *pSentrans;
	  CLSID clsid;
	  HRESULT hr;

	  CString sBase = getTempFileNameBase(status);
	  m_sOutPath = status.makeTempPath(sBase,	_T(".ana") );
	  m_sLOGPath = status.makeTempPath(sBase,	_T(".log") );

	  m_sInPath = status.sANAPath;
	  m_sOutPath.deleteFile();
	  m_sLOGPath.deleteFile();

	  if (FAILED(CoInitialize(NULL)))
	throw(CProcessFailure(this,
				_T("SenTransCOM DLL process failed to coinitialize")));
	  if (FAILED(CLSIDFromProgID(L"SenTransCOM.SenTrans.1", &clsid)))
	throw(CProcessFailure(this,
				  _T("SenTransCOM DLL process failed to get CLSID")));
	  if (FAILED(CoCreateInstance(clsid, NULL, CLSCTX_ALL,
				  IID_ISenTrans, (void **) &pSentrans)))
	throw(CProcessFailure(this,
			_T("SenTransCOM DLL process failed in CoCreateInstance")));
	  CString sCommentChar = status.getInputMFS()->getCommentChar();
	  hr = pSentrans->put_CommentChar(sCommentChar.AllocSysString());
	  if (FAILED(hr))
	throw(CProcessFailure(this,
		   _T("SenTransCOM DLL process failed to set comment character")));
	  hr = pSentrans->put_bEchoClassContentsInLogFile(m_bOutputClassContents);
	  if (FAILED(hr))
	throw(CProcessFailure(this,
		 _T("SenTransCOM DLL process failed to set echo class contents")));
	  hr = pSentrans->put_bIgnoreCatField(FALSE);
	  if (FAILED(hr))
	throw(CProcessFailure(this,
		  _T("SenTransCOM DLL process failed to set ignore \\cat field")));
	  hr = pSentrans->put_bTraceRuleApplication(m_bTraceRules);
	  if (FAILED(hr))
	throw(CProcessFailure(this,
				  _T("SenTransCOM DLL process failed to set trace")));
	  CString s = m_sLOGPath.getQuotedPath();
	  CString sLogFile = s.Mid(1, s.GetLength()-2);
	  s = m_sOutPath.getQuotedPath();;
	  CString sOutFile = s.Mid(1, s.GetLength()-2);
	  hr = pSentrans->ApplyRulesToFile(m_sRuleFile.AllocSysString(),
				   m_sInPath.getShortPath().AllocSysString(),
				   sOutFile.AllocSysString(),
					   sLogFile.AllocSysString());
	  if (FAILED(hr))
	throw(CProcessFailure(this,
			 _T("SenTransCOM DLL process failed to apply rules to file")));
	  pSentrans->Release();
	  pSentrans = NULL;
	  CoUninitialize();

	  waitForCompletion(&status, &m_sLOGPath, &m_sOutPath);

	  // register ana output so the user can view it
	  CString sShortDesc, sLongDesc, sTabLabel;
	  CCarlaLanguage *pOutANALang=NULL;
	  switch(m_iFunction)
	{
	case kDisambig:
	  sShortDesc = _T("Disambiguated ANA");
	  sLongDesc = _T("ANA of the source-language file, after filtering through Sentrans disambiguation rules.");
	  sTabLabel = _T("ST-Disamb ANA");
	  pOutANALang = status.getInputLang();
	  break;
	case kAdjustSrcGlossing: sShortDesc = _T("Gloss Adjusted ANA");
	  sLongDesc = _T("ANA of the source-language file, after performing 'adjustment' transfer for glossing purposes.");
	  sTabLabel = _T("ST-Gloss-Adj ANA");
	  pOutANALang = status.getInputLang();
	  break;

	  // JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
	case kAdjustAnalysis: sShortDesc = _T("Analysis Adjusted ANA");
	  sLongDesc = _T("ANA of the source-language file, after performing 'adjustment' transfer for analysis purposes.");
	  sTabLabel = _T("ST-Anal-Adj ANA");
	  pOutANALang = status.getInputLang();
	  break;

	  // jdh 15June2000
	case kOtherRuleFile: sShortDesc = _T("Other Rule File ANA");
	  sLongDesc.Format(_T("ANA of the source-language file, after running through Sentrans using the file: %s"),LPCTSTR(m_sOtherRuleFilePath));
	  sTabLabel = _T("ST-Anal-Other ANA");
	  pOutANALang = status.getInputLang();
	  break;

	case kTransfer: sShortDesc = _T("Transfered ANA");
	  sLongDesc = _T("ANA of the target-language file, after performing Sentrans transfer.");
	  sTabLabel = _T("ST-Trans ANA");
	  pOutANALang = status.getOutputLang();
	  break;
	default: ASSERTX(FALSE); break;
	}
	  CResultStreamFile* anaStream =
	new CResultStreamFile(
				  new CResultStreamDescriptor(this,
							  sShortDesc, //short description
							  sLongDesc, // long description
							  sTabLabel // tab label
							  ),
				  m_sOutPath.getFullPath(),
				  pOutANALang);
	  status.registerResultStream(anaStream);

	  // when we're doing transfer, the log could reasonably be in either language font,
	  // but what to do?
	  registerLog(status, m_sLOGPath, status.getInputLang());
	  status.sANAPath = m_sOutPath;
	}
  catch(CProcessFailure failure)
	{
	  registerLog(status, m_sLOGPath);
	  throw(failure);
	}
  catch(CString sError)
	{
	  registerLog(status, m_sLOGPath);
	  throw(CProcessFailure(this, sError));
	}
}

LPCSTR  CSenTransDllProcess::getDisplayName() const
{
	switch(m_iFunction)
	{
		case kDisambig: return "SENT DLL Disambig"; break;
		case kAdjustSrcGlossing: return "SENT DLL Adjust Glossing"; break;
		case kAdjustAnalysis: return "SENT DLL Adjust Analysis"; break;
		case kTransfer: return "SENT DLL Transfer"; break;
		case kOtherRuleFile: return "SENT DLL Other Rule File"; break;
		default: ASSERTX(FALSE); return "CSenTransDLLProcess getDisplayName ERROR"; break;
	}
}


BOOL CSenTransDllProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditSentransDllProcess dlg;

	// Load in all our settings
	dlg.m_bTraceRules = m_bTraceRules;
	dlg.m_bOutputClassContents =m_bOutputClassContents;
	dlg.m_iFunction = m_iFunction;
	// hack hack hack
	dlg.m_bInTransferSeq = (iFunctionCode == CProcess::kTransfer);
	dlg.m_bInInterlinearSeq = (iFunctionCode == CProcess::kInterlinear);

	if(m_iFunction == kOtherRuleFile)					// jdh 15June2000
		dlg.m_sRuleFilePath = m_sOtherRuleFilePath;	// jdh 15June2000
	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bTraceRules=		dlg.m_bTraceRules;
	m_bOutputClassContents=	dlg.m_bOutputClassContents;
	m_iFunction = dlg.m_iFunction;
	if(m_iFunction == kOtherRuleFile)					// jdh 15June2000
		m_sOtherRuleFilePath = dlg.m_sRuleFilePath;		// jdh 15June2000


	return TRUE;
}

// virtual override
CString CSenTransDllProcess::getInputTypeDisplayName()
{
	// i'm not sure about this one; if you run lextrans before this,
	// then the input is a target ana already; well it's in proces
	// of becoming a target ana.
	return "ANA";// "Source ANA";
}

// virtual override
CString CSenTransDllProcess::getOutputTypeDisplayName()
{
	switch(m_iFunction)
	{
		case kDisambig: return "Disambiguated Src ANA"; break;
		case kAdjustSrcGlossing: return "Adjusted (gloss) Src ANA"; break;
		case kAdjustAnalysis: return "Adjusted (analysis) Src ANA"; break;
		case kTransfer: return "Target ANA"; break;
		case kOtherRuleFile: return "Disambiguated ANA (Other)"; break;
		default: return "ERROR"; break;
	}
}

CString CSenTransDllProcess::getTempFileNameBase(CProcessStatus& status)
{
	CString s;
	switch(m_iFunction)
	{
		case kDisambig: s.Format(_T("%s-%s-sent-disambig"),
									(LPCTSTR)status.m_sFileNameRoot,
									(LPCTSTR)status.getInputMFS()->getAbrev());
			 break;
		case kAdjustSrcGlossing: s.Format(_T("%s-%s-sent-adj-gloss"), //jdh 6/2/99 renamed
									(LPCTSTR)status.m_sFileNameRoot,
									(LPCTSTR)status.getInputMFS()->getAbrev());
			break;

		// jdh 15June2000 the
		case kOtherRuleFile: s.Format(_T("%s-%s-sent-other-ana"),
									(LPCTSTR)status.m_sFileNameRoot,
									(LPCTSTR)status.getInputMFS()->getAbrev());
			break;

		// JDH 6/2/99 Added Sentrans Adjust Rules Set for analysis
		case kAdjustAnalysis: s.Format(_T("%s-%s-sent-adj-ana"),
									(LPCTSTR)status.m_sFileNameRoot,
									(LPCTSTR)status.getInputMFS()->getAbrev());
			break;

		case kTransfer: s.Format(_T("%s-%s-%s-sent-xfer"),
									(LPCTSTR)status.m_sFileNameRoot,
									(LPCTSTR)status.getInputMFS()->getAbrev(),
									(LPCTSTR)status.getOutputMFS()->getAbrev()
									);
			break;
		default: ASSERTX(FALSE); return _T("sent-ERROR"); break;
	}
	return s;

//	return _T("sent");
}

// STATIC
CProcessTemplate* CSenTransDllProcess::getTemplate()
{
	return new CSenTransDllProcessTemplate();
}

CSenTransDllProcessTemplate::CSenTransDllProcessTemplate()
: CProcessTemplate(
		RUNTIME_CLASS(CSenTransDllProcess),
		_T("SentransDll"),
		CSenTransDllProcess::INPUT_TYPE_DISPLAY(),
		CSenTransDllProcess::OUTPUT_TYPE_DISPLAY(),
		CSenTransDllProcess::_tID(),
		CProcess::kAnalysis | CProcess::kTransfer | CProcess::kInterlinear,
		0)
{

}
