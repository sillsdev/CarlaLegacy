// PCPATRDllProcess.cpp: implementation of the CPCPATRDllProcess class.
//
// 2.3.0 19-Jun-2000 hab initial coding
// 2.4.5 22-May-2001 hab Fix so any errors in log file will show
// 2.7.3 30-Nov-2002 rde Initialize the code page when initializing patr100.dll
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include <strstrea.h>
#include <fstream.h>
#include "Process.h"
#include "PCPATRDllProcess.h"
#include "ModelFilesSet.h"
#include "SFMFile.h"
#include "DlgEditPCPATRDllProcess.h"
#include "ProcessingPrefs.h"
#include "processoutput.h"
#include "logwindow.h"
#include "processStatus.h"
#include "CarlaLanguage.h"
#ifdef hab245
#include "Patr100.h"
#endif // hab245
#include "Patr100_i.c"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

IMPLEMENT_DYNCREATE(CPCPATRDllProcess, CDLLProcess);


CPCPATRDllProcess::CPCPATRDllProcess()
:CDLLProcess()
{
  setDefaultValues();
}


// called by CProcess constructor
// even if the values will be read in, we need this in case some values are
// missing (as will happen when the user is upgrading to a new version)
void CPCPATRDllProcess::setDefaultValues()
{
	m_bAmplePropertyIsFeature = FALSE;
	m_bPromoteDefaultAtomicValues = TRUE;
	m_bShowFailures = FALSE;
	m_bDisplayFeatures = TRUE;
	m_bDisplayGloss = TRUE;
	m_bTrimEmptyFeatures = FALSE;
	m_bPerformUnification = TRUE;
	m_bWriteAmpleParses = TRUE;
	m_uiMaxAmbiguities = 10;
	m_sSentenceFinalPunctuation = _T(". ? ! : ;");
	m_uiTimeLimit = 0;
	m_iTreeDisplayFormat = 2;
	m_sGrammarFileName = _T("");
	m_bFlatFeatureDisplay = FALSE;
	m_bAllFeatures = FALSE;
#ifndef hab262
	m_iTreeDisplayFormat = 0;
#endif // hab262
}

void CPCPATRDllProcess::readParametersFromSFMFile(SFMFile *f)
{
  setDefaultValues();
  CString sMarker, sField;
  while(f->getField(sMarker, sField))
	{
	  if(sMarker== _T("-Process"))
	break;
	  else checkAndReadBool( "AmplePropertyIsFeature", m_bAmplePropertyIsFeature)
	  else checkAndReadBool( "PromoteDefaultAtomicValues", m_bPromoteDefaultAtomicValues)
	  else checkAndReadBool( "ShowFailures", m_bShowFailures)
	  else checkAndReadBool( "DisplayGloss", m_bDisplayGloss)
	  else checkAndReadBool( "DisplayFeatures", m_bDisplayFeatures)
	  else checkAndReadBool( "AllFeatures", m_bAllFeatures)
	  else checkAndReadBool( "FlatFeatureDisplay", m_bFlatFeatureDisplay)
	  else checkAndReadBool( "TrimEmptyFeatures", m_bTrimEmptyFeatures)
	  else checkAndReadBool( "PerformUnification", m_bPerformUnification)
	  else checkAndReadBool( "WriteAmpleParses", m_bWriteAmpleParses)
	  else checkAndReadInt( "MaxAmbiguities", m_uiMaxAmbiguities)
	  else checkAndReadString("SentenceFinalPunctuation",
				  m_sSentenceFinalPunctuation)
	  else checkAndReadInt( "TimeLimit", m_uiTimeLimit)
	  else checkAndReadInt( "TreeDisplayFormat", m_iTreeDisplayFormat)
	  else checkAndReadString("GrammarFileName", m_sGrammarFileName)
#ifndef hab262
	  else checkAndReadInt( "RootGlossFeature", m_iRootGlossSetting)
#endif // hab262
	  else f->throwParseFailure(_T("PCPATRDLLProcess"), sMarker, sField);
	}
}

void CPCPATRDllProcess::writeToStream(ostream& fout) const
{
  fout << "\\+Process " << getProcessorID() << PROC_ENABLED_STATUS << "\n";
  outputBool(fout, "AmplePropertyIsFeature", m_bAmplePropertyIsFeature);
  outputBool(fout,"PromoteDefaultAtomicValues", m_bPromoteDefaultAtomicValues);
  outputBool(fout, "ShowFailures", m_bShowFailures);
  outputBool(fout, "DisplayGloss", m_bDisplayGloss);
  outputBool(fout, "DisplayFeatures", m_bDisplayFeatures);
  outputBool(fout, "AllFeatures", m_bAllFeatures);
  outputBool(fout, "FlatFeatureDisplay", m_bFlatFeatureDisplay);
  outputBool(fout, "TrimEmptyFeatures", m_bTrimEmptyFeatures);
  outputBool(fout, "PerformUnification", m_bPerformUnification);
  outputBool(fout, "WriteAmpleParses", m_bWriteAmpleParses);
  outputInt(fout, "MaxAmbiguities", m_uiMaxAmbiguities);
  USES_CONVERSION_U8;
  fout << "\\SentenceFinalPunctuation " << T2CU8(m_sSentenceFinalPunctuation) << "\n";
  outputInt(fout, "TimeLimit", m_uiTimeLimit)	;
  outputInt(fout, "TreeDisplayFormat", m_iTreeDisplayFormat);
  fout << "\\GrammarFileName " <<  T2CA(m_sGrammarFileName) << "\n";
#ifndef hab262
  outputInt(fout, "RootGlossFeature", m_iRootGlossSetting);
#endif // hab262
  fout << "\\-Process " << getProcessorID() << "\n";
}

// EXCEPTIONS: CProcessFailure
void CPCPATRDllProcess::processANAFile(CProcessStatus& status)
{
  CModelFilesSet* pSourceMFS = status.getInputMFS();
  ASSERTX(pSourceMFS);
  CModelFilesSet* pTargetMFS = status.getOutputMFS(); // may be null

  try
	{
	  IPatrParser *pPatr;
	  CLSID clsid;
	  HRESULT hr;

#ifndef hab245
	  CString sBase;
	  sBase.Format(_T("%s%d"), (LPCTSTR)getTempFileNameBase(status), status.m_iProcNumber);
#else // hab245
	  CString sBase = getTempFileNameBase(status);
#endif // hab245
	  m_sOutPath = status.makeTempPath(sBase,	_T(".ana") );
	  m_sLOGPath = status.makeTempPath(sBase,	_T(".log") );

	  m_sInPath = status.sANAPath;
	  m_sOutPath.deleteFile();
	  m_sLOGPath.deleteFile();

	  hr = CoInitialize(NULL);
#ifndef hab245
	  checkResults(hr, _T("coinitialize"), (IPatrParser *)NULL);
	  hr = CLSIDFromProgID(L"SIL.CARLA.PatrParser.1", &clsid);
	  checkResults(hr, _T("get CLSID"), (IPatrParser *)NULL);
	  hr = CoCreateInstance(clsid, NULL, CLSCTX_ALL,
				IID_IPatrParser, (void **) &pPatr);
	  checkResults(hr, _T("do CoCreateInstance"), (IPatrParser *)NULL);
	  CString s = m_sLOGPath.getQuotedPath();
	  CString sLogFile = s.Mid(1, s.GetLength()-2);
	  hr = pPatr->OpenLog(sLogFile.AllocSysString());
	  checkResults(hr, _T("set log file"), (IPatrParser *)NULL);
	  hr = pPatr->Clear();
	  checkResults(hr, _T("clear"), pPatr);
	  hr = pPatr->put_CommentChar(status.getInputMFS()->getCommentChar());
	  checkResults(hr, _T("set comment character"), pPatr);
	  hr = pPatr->put_AmplePropertyIsFeature(m_bAmplePropertyIsFeature);
	  checkResults(hr, _T("set AmplePropertyIsFeature"), pPatr);
	  hr = pPatr->put_PromoteDefaultAtoms(m_bPromoteDefaultAtomicValues);
	  checkResults(hr, _T("set PromoteDefaultAtoms"), pPatr);
	  hr = pPatr->put_Failures(m_bShowFailures);
	  checkResults(hr, _T("set Failures"), pPatr);
	  hr = pPatr->put_DisplayFeatures(m_bDisplayFeatures);
	  checkResults(hr, _T("set DisplayFeatures"), pPatr);
	  hr = pPatr->put_TopFeatureOnly(!m_bAllFeatures);
	  checkResults(hr, _T("set TopFeatureOnly"), pPatr);
	  hr = pPatr->put_Gloss(m_bDisplayGloss);
	  checkResults(hr, _T("set Gloss"), pPatr);
	  hr = pPatr->put_TrimEmptyFeatures(m_bTrimEmptyFeatures);
	  checkResults(hr, _T("set TrimEmptyFeatures"), pPatr);
	  hr = pPatr->put_Unification(m_bPerformUnification);
	  checkResults(hr, _T("set Unification"), pPatr);
	  hr = pPatr->put_WriteAmpleParses(m_bWriteAmpleParses);
	  checkResults(hr, _T("set WriteAmpleParses"), pPatr);
	  hr = pPatr->put_MaxAmbiguity(m_uiMaxAmbiguities);
	  checkResults(hr, _T("set MaxAmbiguity"), pPatr);
#ifndef rde273
	  hr = pPatr->put_CodePage(GetCSAcp());
#endif  // rde273
	  hr = pPatr->put_SentenceFinalPunctuation(
				 m_sSentenceFinalPunctuation.AllocSysString());
	  checkResults(hr, _T("set SentenceFinalPunctuation"), pPatr);
	  hr = pPatr->put_TimeLimit(m_uiTimeLimit);
	  checkResults(hr, _T("set TimeLimit"), pPatr);
	  hr = pPatr->put_TreeDisplay(m_iTreeDisplayFormat);
	  checkResults(hr, _T("set TreeDisplay"), pPatr);
	  hr = pPatr->put_FlatFeatureDisplay(m_bFlatFeatureDisplay);
	  checkResults(hr, _T("set FlatFeatureDisplay"), pPatr);

#ifndef hab262
	  if (m_iRootGlossSetting > 0)
	m_iRootGlossSetting++;	// need to adjust value to get correct setting
	  hr = pPatr->put_RootGlossFeature(m_iRootGlossSetting);
	  if (m_iRootGlossSetting > 0)
	m_iRootGlossSetting--;	// adjust the value back
	  checkResults(hr, _T("set RootGlossFeature"), pPatr);
#endif // hab262
	  hr = pPatr->LoadGrammarFile(m_sGrammarFileName.AllocSysString());
	  checkResults(hr, _T("load grammar file.\nSee Log File."), pPatr);
	  s = m_sOutPath.getQuotedPath();;
	  CString sOutFile = s.Mid(1, s.GetLength()-2);
	  hr = pPatr->DisambiguateAnaFile(m_sInPath.getShortPath().AllocSysString(),
					  sOutFile.AllocSysString());
	  checkResults(hr, _T("disambiguate ANA file"), pPatr);
	  hr = pPatr->CloseLog();
	  checkResults(hr, _T("close log file"), pPatr);
#else // hab245

	  checkResults(hr, _T("coinitialize"));
	  hr = CLSIDFromProgID(L"SIL.CARLA.PatrParser.1", &clsid);
	  checkResults(hr, "get CLSID");
	  hr = CoCreateInstance(clsid, NULL, CLSCTX_ALL,
				IID_IPatrParser, (void **) &pPatr);
	  checkResults(hr, "do CoCreateInstance");
	  hr = pPatr->Clear();
	  checkResults(hr, "clear");
	  hr = pPatr->put_CommentChar(status.getInputMFS()->getCommentChar());
	  checkResults(hr, "set comment character");
	  hr = pPatr->put_AmplePropertyIsFeature(m_bAmplePropertyIsFeature);
	  checkResults(hr, "set AmplePropertyIsFeature");
	  hr = pPatr->put_PromoteDefaultAtoms(m_bPromoteDefaultAtomicValues);
	  checkResults(hr, "set PromoteDefaultAtoms");
	  hr = pPatr->put_Failures(m_bShowFailures);
	  checkResults(hr, "set Failures");
	  hr = pPatr->put_DisplayFeatures(m_bDisplayFeatures);
	  checkResults(hr, "set DisplayFeatures");
	  hr = pPatr->put_TopFeatureOnly(!m_bAllFeatures);
	  checkResults(hr, "set TopFeatureOnly");
	  hr = pPatr->put_Gloss(m_bDisplayGloss);
	  checkResults(hr, "set Gloss");
	  hr = pPatr->put_TrimEmptyFeatures(m_bTrimEmptyFeatures);
	  checkResults(hr, "set TrimEmptyFeatures");
	  hr = pPatr->put_Unification(m_bPerformUnification);
	  checkResults(hr, "set Unification");
	  hr = pPatr->put_WriteAmpleParses(m_bWriteAmpleParses);
	  checkResults(hr, "set WriteAmpleParses");
	  hr = pPatr->put_MaxAmbiguity(m_uiMaxAmbiguities);
	  checkResults(hr, "set MaxAmbiguity");
	  hr = pPatr->put_SentenceFinalPunctuation(
				 m_sSentenceFinalPunctuation.AllocSysString());
	  checkResults(hr, "set SentenceFinalPunctuation");
	  hr = pPatr->put_TimeLimit(m_uiTimeLimit);
	  checkResults(hr, "set TimeLimit");
	  hr = pPatr->put_TreeDisplay(m_iTreeDisplayFormat);
	  checkResults(hr, "set TreeDisplay");
	  hr = pPatr->put_FlatFeatureDisplay(m_bFlatFeatureDisplay);
	  checkResults(hr, "set FlatFeatureDisplay");
	  hr = pPatr->LoadGrammarFile(m_sGrammarFileName.AllocSysString());
	  checkResults(hr, "load grammar file");
	  CString s = m_sLOGPath.getQuotedPath();
	  CString sLogFile = s.Mid(1, s.GetLength()-2);
	  hr = pPatr->OpenLog(sLogFile.AllocSysString());
	  checkResults(hr, "set log file");
	  s = m_sOutPath.getQuotedPath();;
	  CString sOutFile = s.Mid(1, s.GetLength()-2);
	  hr = pPatr->DisambiguateAnaFile(m_sInPath.getShortPath().AllocSysString(),
					  sOutFile.AllocSysString());
	  checkResults(hr, "disambiguate ANA file");
	  hr = pPatr->CloseLog();
	  checkResults(hr, "close log file");
#endif // hab245
	  pPatr->Release();
	  pPatr = NULL;
	  CoUninitialize();

	  waitForCompletion(&status, &m_sLOGPath, &m_sOutPath);

	  // register ana output so the user can view it
	  CString sShortDesc, sLongDesc, sTabLabel;
	  CCarlaLanguage *pOutANALang=NULL;
	  sShortDesc = "PC-PATR Disambiguated ANA";
	  sLongDesc = "ANA of the source-language file, after filtering through PC-PATR Syntactic Grammar rules.";
	  sTabLabel = "PATR-Disamb ANA";
	  pOutANALang = status.getInputLang();
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

BOOL CPCPATRDllProcess::doEditDialog(int iFunctionCode)
{
  CDlgEditPCPATRDllProcess dlg;

  // Load in all our settings
  dlg.m_bAmplePropertyIsFeature = m_bAmplePropertyIsFeature;
  dlg.m_bPromoteDefaultAtomicValues = m_bPromoteDefaultAtomicValues;
  dlg.m_bShowFailures = m_bShowFailures;
  dlg.m_bDisplayFeatures = m_bDisplayFeatures;
  dlg.m_bAllFeatures = m_bAllFeatures;
  dlg.m_bDisplayGloss = m_bDisplayGloss;
  dlg.m_bTrimEmptyFeatures = m_bTrimEmptyFeatures;
  dlg.m_bPerformUnification = m_bPerformUnification;
  dlg.m_bWriteAmpleParses = m_bWriteAmpleParses;
  dlg.m_uiMaxAmbiguities = m_uiMaxAmbiguities;
  dlg.m_sSentenceFinalPunctuation = m_sSentenceFinalPunctuation;
  dlg.m_uiTimeLimit = m_uiTimeLimit;
  dlg.m_iTreeDisplayFormat = m_iTreeDisplayFormat;
  dlg.m_sGrammarFileName = m_sGrammarFileName;
  dlg.m_bFlatFeatureDisplay = m_bFlatFeatureDisplay;
#ifndef hab262
  dlg.m_iRootGlossSetting = m_iRootGlossSetting;
#endif // hab262

  // put up the dialog
  if(IDOK != dlg.DoModal())
	return FALSE;

  // Reload all our settings if the user clicked 'ok'
  m_bAmplePropertyIsFeature = dlg.m_bAmplePropertyIsFeature;
  m_bPromoteDefaultAtomicValues = dlg.m_bPromoteDefaultAtomicValues;
  m_bShowFailures = dlg.m_bShowFailures;
  m_bDisplayFeatures = dlg.m_bDisplayFeatures;
  m_bAllFeatures = dlg.m_bAllFeatures;
  m_bDisplayGloss = dlg.m_bDisplayGloss;
  m_bTrimEmptyFeatures = dlg.m_bTrimEmptyFeatures;
  m_bPerformUnification = dlg.m_bPerformUnification;
  m_bWriteAmpleParses = dlg.m_bWriteAmpleParses;
  m_uiMaxAmbiguities = dlg.m_uiMaxAmbiguities;
  m_sSentenceFinalPunctuation = dlg.m_sSentenceFinalPunctuation;
  m_uiTimeLimit = dlg.m_uiTimeLimit;
  m_iTreeDisplayFormat = dlg.m_iTreeDisplayFormat;
  m_sGrammarFileName = dlg.m_sGrammarFileName;
  m_bFlatFeatureDisplay = dlg.m_bFlatFeatureDisplay;
#ifndef hab262
  m_iRootGlossSetting = dlg.m_iRootGlossSetting;
#endif // hab262

  return TRUE;
}

// virtual override
CString CPCPATRDllProcess::getInputTypeDisplayName()
{
	return "ANA";// "Source ANA";
}

// virtual override
CString CPCPATRDllProcess::getOutputTypeDisplayName()
{
  return "Disambiguated Src ANA";
}

CString CPCPATRDllProcess::getTempFileNameBase(CProcessStatus& status)
{
  CString s;
  s.Format(_T("%s-%s-PC-PATR-disambig"),
	   (LPCTSTR)status.m_sFileNameRoot,
	   (LPCTSTR)status.getInputMFS()->getAbrev());
  return s;
}

#ifndef hab245
void CPCPATRDllProcess::checkResults(HRESULT &hr, LPCTSTR pszMessagePortion, IPatrParser *pPatr)
{
  if (FAILED(hr))
	{
	  CString s2 = pszMessagePortion;
	  CString s = _T("PatrProcess DLL process failed to ") + s2;
	  HRESULT hr2;
	  hr2 = pPatr->CloseLog();  // make attempt to close log file
	  throw(CProcessFailure(this, s));
	}
}
#else // hab245
void CPCPATRDllProcess::checkResults(HRESULT &hr, LPCTSTR pszMessagePortion)
{
  if (FAILED(hr))
	{
	  CString s2 = pszMessagePortion;
	  CString s = _T("PatrProcess DLL process failed to ") + s2;
	  throw(CProcessFailure(this, s));
	}
}
#endif // hab245
