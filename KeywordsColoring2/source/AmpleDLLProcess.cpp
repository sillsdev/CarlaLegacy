// AmpleDLLProcess.cpp: implementation of the CAmpleDLLProcess class.
//
//////////////////////////////////////////////////////////////////////
// jdh 6/2/99 Patch over a bug in AmpleDLL related to rootGlosses. See updateExternals()
// jdh 8/27/99 fixed ampleOptions to have tracing off by default
// jdh 11/10/99 watch the Status prefs for turning on tracing temporarily
// jdh 3/14/00	Made an exception in processRAWTextString get propogated up
// jdh june 13 2000 added outputStyle option so we can get xml output in the file
// 2.3.2 19-Sep-2000 hab Have manual parse apply input text changes to string

#include "stdafx.h"
#include "..\resource.h"
#include <strstrea.h>
#include <fstream.h>
#include "CarlaLanguage.h"
#include "AmpleDLLProcess.h"
#include "DlgEditAmpleDLLProcess.h"
#include "SFMFile.h"
#include "processOutput.h"
#include "logwindow.h"
#include "processStatus.h"
#include "ProcessingPrefs.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif



//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
IMPLEMENT_DYNCREATE(CAmpleDLLProcess, CDLLProcess);

CAmpleDLLProcess::CAmpleDLLProcess()
:	CDLLProcess(),
	//m_bTrace(FALSE),
	m_bReloadOptionsIntoDLL(TRUE),
	m_pAmpleWrapper(NULL)
{

}

CAmpleDLLProcess::~CAmpleDLLProcess()
{

}

CAmpleOptions::~CAmpleOptions()
{
}

CAmpleOptions::CAmpleOptions()
:	m_bCheckMorphnames(	0),
	m_iMaxMorphnameLength(	40),
	m_bOutputRootGlosses( 0),
	m_bPrintTestParseTrees(	0),
	m_bReportAmbiguityPercentages( 1),
	m_bWriteDecompField(1),
	m_bWritePField(		0),
	m_bWriteWordField(	1),
	m_bTrace (FALSE),	// jdh 8/27/99 was defaulting to trace on
	m_sOutputStyle ("Ana") // jdh june 13 2000 add switch to get xml output from parseFile
{
}


void CAmpleDLLProcess::readParametersFromSFMFile(SFMFile *f)
{
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here
	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker=="-Process")
			break;
		checkAndReadBool("CheckMorphnames", m_options.m_bCheckMorphnames)
		else checkAndReadInt("MaxMorphnameLength", m_options.m_iMaxMorphnameLength)
		else checkAndReadBool( "OutputRootGlosses", m_options.m_bOutputRootGlosses)
		else checkAndReadBool( "PrintTestParseTrees", m_options.m_bPrintTestParseTrees)
		else checkAndReadBool( "ReportAmbiguityPercentages", m_options.m_bReportAmbiguityPercentages)
		else checkAndReadBool( "WriteDecompField", m_options.m_bWriteDecompField)
		else checkAndReadBool( "WritePField", m_options.m_bWritePField)
		else checkAndReadBool( "WriteWordField", m_options.m_bWriteWordField)
		else checkAndReadBool( "Trace",m_options.m_bTrace)
		else if (sMarker == "MonitorProgress") {} // now defunct
		else
		{
			f->throwParseFailure("AmpleProcess", sMarker, sField);
		}
	}
}

void CAmpleDLLProcess::writeToStream(ostream& fout) const
{
//	fout << "\\+Process " << ID() << "\n";
	fout << "\\+Process " ;
	fout << ID() ;
	fout << PROC_ENABLED_STATUS <<"\n";
	outputInt(fout, "MaxMorphnameLength", m_options.m_iMaxMorphnameLength);
	outputBool(fout, "CheckMorphnames", m_options.m_bCheckMorphnames);
	outputBool(fout, "OutputRootGlosses", m_options.m_bOutputRootGlosses);
	outputBool(fout, "PrintTestParseTrees", m_options.m_bPrintTestParseTrees);
	outputBool(fout, "ReportAmbiguityPercentages", m_options.m_bReportAmbiguityPercentages);
	outputBool(fout, "WriteDecompField", m_options.m_bWriteDecompField);
	outputBool(fout, "WritePField", m_options.m_bWritePField);
	outputBool(fout, "WriteWordField", m_options.m_bWriteWordField);
	outputBool(fout, "Trace",m_options.m_bTrace);
// notice that i purposefully don't save the selective trace stuff, since it could bewilder people
	fout << "\\-Process " << ID() << "\n";
}

BOOL CAmpleDLLProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditAmpleDLLProcess dlg;

	// Load in all our settings
	dlg.m_bCheckMorphnames=			m_options.m_bCheckMorphnames;
	dlg.m_iMaxMorphnameLength=		m_options.m_iMaxMorphnameLength;
	dlg.m_bOutputRootGlosses=		m_options.m_bOutputRootGlosses;
	//dlg.m_bPrintTestParseTrees=	m_options.m_bPrintTestParseTrees;
	dlg.m_bReportAmbig		=		m_options.m_bReportAmbiguityPercentages;
	dlg.m_bWriteDecomp=				m_options.m_bWriteDecompField;
	dlg.m_bWriteProperties=			m_options.m_bWritePField;
	dlg.m_bWriteWord=				m_options.m_bWriteWordField;
	dlg.m_bTrace=					m_options.m_bTrace;
	dlg.m_sTraceMorphs =			m_options.m_sTraceMorphs;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_options.m_bCheckMorphnames=		dlg.m_bCheckMorphnames;
	m_options.m_iMaxMorphnameLength=		dlg.m_iMaxMorphnameLength;
	m_options.m_bOutputRootGlosses=		dlg.m_bOutputRootGlosses;
	//m_options.m_bPrintTestParseTrees=	dlg.m_bPrintTestParseTrees;
	m_options.m_bReportAmbiguityPercentages=dlg.m_bReportAmbig;
	m_options.m_bWriteDecompField=	dlg.m_bWriteDecomp;
	m_options.m_bWritePField=			dlg.m_bWriteProperties;
	m_options.m_bWriteWordField=		dlg.m_bWriteWord;
	m_options.m_bTrace=	dlg.m_bTrace;
	m_options.m_sTraceMorphs = dlg.m_sTraceMorphs;

	m_bReloadOptionsIntoDLL = TRUE;

	return TRUE;
}

// EXCEPTIONS: CProcessFailure
void CAmpleDLLProcess::processRAWTextString(CProcessStatus& status, LPCTSTR lpszLogPath)
{
	try
	{
		if(!m_pAmpleWrapper)
			m_pAmpleWrapper = status.getInputLang()->getAmpleDLLWrapper();
		ASSERTX(m_pAmpleWrapper);

		// this log path is used when tracing, since it only goes to the log file
		if(lpszLogPath)	// to do: reset this if lpszLogPath is null
		{
			m_sLOGPath = lpszLogPath;
			m_sLOGPath.deleteFile();	// don't care if it is found or not
			m_pAmpleWrapper->setLogFile(m_sLOGPath);
		}

		// moved this below the above log setting on mar 26, 99 so that errors would go to the log
		updateExternals(status);

	//	CString sResult = (*m_pAmpleWrapper->m_pfAmpleSetParameter)("LogFile", m_sLOGPath.getFullPath());
	//	throwIfError(sResult);

		//CString sResult = (*m_pAmpleWrapper->m_pfAmpleParseText)(m_pAmpleWrapper->getSetup(), status.m_sRAWString);
		CString sResult = m_pAmpleWrapper->parseString(status.m_sRAWString, TRUE);
		status.m_sRAWString = sResult;
	}
	catch(CString sError)
	{
		status.m_sRAWString = sError;
		throw CProcessFailure(this, sError);// jdh 3/14/2000
	}
}

#ifndef hab218
#ifndef hab232
CString CAmpleDLLProcess::getAllAllomorphs(CProcessStatus& status, CString &sState, LPCTSTR lpszLogPath)
#else  // hab232
void CAmpleDLLProcess::getAllAllomorphs(CProcessStatus& status, CString &sState, LPCTSTR lpszLogPath)
#endif // hab232
{
	try
	{
		if(!m_pAmpleWrapper)
			m_pAmpleWrapper = status.getInputLang()->getAmpleDLLWrapper();
		ASSERTX(m_pAmpleWrapper);

		// this log path is used when tracing, since it only goes to the log file
		if(lpszLogPath)	// to do: reset this if lpszLogPath is null
		{
			m_sLOGPath = lpszLogPath;
			m_sLOGPath.deleteFile();	// don't care if it is found or not
			m_pAmpleWrapper->setLogFile(m_sLOGPath);
		}

		// moved this below the above log setting on mar 26, 99 so that errors would go to the log
		updateExternals(status);

#ifndef hab232
		if (sState == "BOW")
		  {		// at begin of word; apply textin changes
			status.m_sRAWString = m_pAmpleWrapper->applyInputChanges(status.m_sRAWString);
		  }
#endif // hab232
#ifndef hab232
		return m_pAmpleWrapper->getAllAllomorphs(status.m_sRAWString, sState, TRUE);
#else  // hab232
		CString sResult = m_pAmpleWrapper->getAllAllomorphs(status.m_sRAWString, sState, TRUE);
		status.m_sRAWString = sResult;
#endif // hab232
	}
	catch(CString sError)
	{
		status.m_sRAWString = sError;
		throw CProcessFailure(this, sError);// jdh 3/14/2000
	}
}
#endif // ManualParse

// EXCEPTIONS: CProcessFailure
void CAmpleDLLProcess::processRAWTextFile(CProcessStatus& status)
{
	try
	{
		if(!m_pAmpleWrapper)
			m_pAmpleWrapper = status.getInputLang()->getAmpleDLLWrapper();

		CString sBase = status.m_sFileNameRoot +"-ample";
		m_sANAPath = status.makeTempPath(sBase,".ana");
		m_sLOGPath = status.makeTempPath(sBase,	".log" );
		// name the cmd file after the lang, not the particular document
		m_sCMDPath =  status.makeTempPath(status.getInputMFS()->getAbrev(),"-ample.cmd");
		m_sANAPath.deleteFile();	// don't care if it is found or not
		m_sLOGPath.deleteFile();	// don't care if it is found or not


		// jdh june 13 20000
		//m_options.m_sOutputStyle = m_sOutputStyle;


		m_pAmpleWrapper->setLogFile(m_sLOGPath);
		processFileCore(status);

		// register ana output so the user can view it
		CResultStreamFile* anaStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												"Ample ANA Out", //short description
												"Parsed output in ANA format", // long description
												"Ample ANA" // tab label
											),
					m_sANAPath.getFullPath(),
					status.getInputLang());
		status.registerResultStream(anaStream);


		registerLog(status, m_sLOGPath, status.getInputLang());

		status.sANAPath = m_sANAPath;
	}

	catch(CString sError)	// CAmpleDLLWrapper throws these
	{
		registerLog(status, m_sLOGPath);
		throw CProcessFailure(this, sError);
	}

	catch(CProcessFailure failure)
	{
		registerLog(status, m_sLOGPath);
		throw(failure);
	}

}

// EXCEPTIONS: CProcessFailure
void CAmpleDLLProcess::processFileCore(CProcessStatus & status)
{
	updateExternals(status);

//	CString sResult = (*m_pAmpleWrapper->m_pfAmpleSetParameter)(m_pSetup, "LogFile", m_sLOGPath.getFullPath());
//	throwIfError(sResult);

	// PARSE THE FILE
	//CString sResult = (*m_pAmpleWrapper->m_pfAmpleParseFile)(m_pAmpleWrapper->getSetup(), status.sRAWPath.getFullPath(), m_sANAPath.getFullPath());

	// changed to let the wrapper do this for beta 8, 17 mar so we can know when an error was found
	CString sResult;
	if(m_options.m_sOutputStyle == "AResult")
	{
		ASSERTX(m_options.m_pathXMLOutputPath != "");
		 sResult = m_pAmpleWrapper->parseFile(status.sRAWPath, m_options.m_pathXMLOutputPath, TRUE);
	}
	else
		 sResult = m_pAmpleWrapper->parseFile(status.sRAWPath, m_sANAPath, TRUE);
	throwIfError(sResult);
}


// return TRUE if no error
BOOL CAmpleDLLProcess::checkDLLResult(CString & sResult)
{
	static CString sOK = "<error code=none>";
	return sResult.Left(sOK.GetLength()) == sOK;
}

void CAmpleDLLProcess::throwIfError(CString & sResult)
{
	if(!checkDLLResult(sResult))
		throw CProcessFailure(this, sResult);
}




void CAmpleDLLProcess::setTrace(BOOL bTrace, LPCTSTR lpszTraceMorphs)
{
	m_options.m_bTrace=bTrace;
	if(m_options.m_bTrace)
		m_options.m_sTraceMorphs=lpszTraceMorphs;
	setReloadOptions();
}


void CAmpleDLLProcess::updateExternals(CProcessStatus& status)
{
	BOOL bTraceToKeep = m_options.m_bTrace;	// jdh 11/10/99
	if(status.m_pProcPrefs->m_dwFlags & CProcessingPrefs::kTrace)		// jdh 11/10/99
		m_options.m_bTrace = TRUE;			// jdh 11/10/99

	m_pAmpleWrapper->setOptions(&m_options);

	m_bReloadOptionsIntoDLL = FALSE;

	m_pAmpleWrapper->updateExternals(status);

	m_options.m_bTrace = bTraceToKeep;		// jdh 11/10/99
}

void CAmpleDLLProcess::setDefaultValues()
{

}

BOOL CAmpleDLLProcess::getLastRunHadError()
{
	if(m_pAmpleWrapper)
		return m_pAmpleWrapper->m_bLastRunHadErrors;
	else
		return FALSE;
}

// jdh june 13 2000
void CAmpleDLLProcess::setOutputStyle(CString sOutputStyle)
{
	m_options.m_sOutputStyle = sOutputStyle;	// "AResult" or "Ana"
}

// jdh june 13 2000
void CAmpleDLLProcess::setXMLOutputPath(CString sPath)
{
	m_options.m_pathXMLOutputPath = sPath;
}

#ifndef hab241
void CAmpleDLLProcess::setMaxMorphnameLength(int iMax)
{
  if (iMax < 0 || iMax > 60)
	return;			// check for valid value
  m_options.m_iMaxMorphnameLength = iMax;
}
#endif // hab241
