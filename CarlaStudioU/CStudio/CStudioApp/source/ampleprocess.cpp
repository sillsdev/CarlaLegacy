//Change History
// JDH 8/27/99 merged in HAB's addition of -x param from 6/25/99
// jdh 11/10/99 watch the Status prefs for turning on tracing temporarily
// 1.7a1 07-Dec-1999 hab added check for use of either analysis or interlinear
//                       form of dict code table.
// 2.0.4 19-Jan-2000 hab Fix getBatchName so it allows for more than 9 processes

#include "stdafx.h"
#include <strstrea.h>
#include <fstream.h>
#include "CarlaLanguage.h"
#include "AnalysisProcesses.h"
#include "DlgEditAmpleProcess.h"
#include "SFMFile.h"
#include "processOutput.h"
#include "logwindow.h"
#include "processStatus.h"
#include "ProcessingPrefs.h"

// the following is to increase readability of the code
#define INPUTFILE status.sRAWPath

IMPLEMENT_DYNCREATE(CAmpleProcess, CDOSProcess);

CAmpleProcess::CAmpleProcess()
:CDOSProcess()
{
	setDefaultValues();
}


// called by CProcess constructor
// even if the values will be read in, we need this in case some values are
// missing (as will happen when the user is upgrading to a new version)
void CAmpleProcess::setDefaultValues()
{
	m_bTrace=0;
	m_bCheckMorphnames=	0;
	m_iMaxMorphnameLength=	40;
//	m_bMonitorProgress=	0;
	m_bOutputRootGlosses= 0;
	m_bPrintTestParseTrees=	0;
	m_bReportAmbiguityPercentages= 1;
	m_bWriteDecompField=1;
	m_bWritePField=		0;
	m_bWriteWordField=	1;
}

void CAmpleProcess::readParametersFromSFMFile(SFMFile *f)
{
	setDefaultValues();
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here
	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker==_T("-Process"))
			break;
		checkAndReadBool("CheckMorphnames",m_bCheckMorphnames)
		//else checkAndReadBool("MonitorProgress",m_bMonitorProgress)
		else checkAndReadInt("MaxMorphnameLength", m_iMaxMorphnameLength)
		else checkAndReadBool( "CheckMorphnames", m_bCheckMorphnames)
//		else checkAndReadBool( "MonitorProgress", m_bMonitorProgress)
		else checkAndReadBool( "OutputRootGlosses",m_bOutputRootGlosses)
		else checkAndReadBool( "PrintTestParseTrees",m_bPrintTestParseTrees)
		else checkAndReadBool( "ReportAmbiguityPercentages",m_bReportAmbiguityPercentages)
		else checkAndReadBool( "WriteDecompField",m_bWriteDecompField)
		else checkAndReadBool( "WritePField",m_bWritePField)
		else checkAndReadBool( "WriteWordField",m_bWriteWordField)
		else checkAndReadBool( "Trace",m_bTrace)
		else if (sMarker == _T("MonitorProgress")) {} // now defunct
		else
		{
			f->throwParseFailure(_T("AmpleProcess"), sMarker, sField);
		}
	}
}

void CAmpleProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process " << ID() << PROC_ENABLED_STATUS <<"\n";
	outputInt(fout, "MaxMorphnameLength", m_iMaxMorphnameLength);
	outputBool(fout, "CheckMorphnames", m_bCheckMorphnames);
	//outputBool(fout, "MonitorProgress", m_bMonitorProgress);
	outputBool(fout, "OutputRootGlosses",m_bOutputRootGlosses);
	outputBool(fout, "PrintTestParseTrees",m_bPrintTestParseTrees);
	outputBool(fout, "ReportAmbiguityPercentages",m_bReportAmbiguityPercentages);
	outputBool(fout, "WriteDecompField",m_bWriteDecompField);
	outputBool(fout, "WritePField",m_bWritePField);
	outputBool(fout, "WriteWordField",m_bWriteWordField);
	outputBool(fout, "Trace",m_bTrace);
	fout << "\\-Process " << ID() << "\n";
}

LPCTSTR CAmpleProcess::getToolPath()
{
	return _T("AMPLE32");
}

CString CAmpleProcess::getCommandLine(CProcessStatus& status)
{
	strstream sout;
	ASSERTX(status.getInputLang());

	// note: the default directory will be set the dir containing the source file
	//       so that doesn't need to be specified
	if(status.getInputMFS()->getUsingUnifiedDicts())
		sout << "-u ";

	//int iTrieDepth;

	if('|' != status.getInputMFS()->getCommentChar())
		sout << " -c " << status.getInputMFS()->getCommentChar() << " ";

	if(m_bOutputRootGlosses)
		sout << "-g ";
	//if(m_bMonitorProgress)
	//	sout << "-m ";
	sout << "-n " << m_iMaxMorphnameLength << " ";
	if(m_bReportAmbiguityPercentages)
		sout << "-p ";
	if(m_bCheckMorphnames)
		sout << "-r ";
	if(m_bPrintTestParseTrees)
		sout << "-v ";

	if(m_bWriteDecompField || m_bWritePField || m_bWriteWordField)
	{	sout << "-w ";
		ifTrueOutputItem(sout, m_bWriteDecompField, 'd');
		ifTrueOutputItem(sout, m_bWritePField, 'p');
		ifTrueOutputItem(sout, m_bWriteWordField, 'w');

		sout << " ";
	}

	// jdh 11/10/99
	if(status.m_pProcPrefs->m_dwFlags & CProcessingPrefs::kTrace)		// jdh 11/10/99
		sout << " -t ";

	/* BEGIN ADDITION hab 1999.06.25 */
	if(!m_bWriteDecompField || !m_bWritePField || !m_bWriteWordField)
	{	sout << "-x ";
		ifTrueOutputItem(sout, !m_bWriteDecompField, 'd');
		ifTrueOutputItem(sout, !m_bWritePField, 'p');
		ifTrueOutputItem(sout, !m_bWriteWordField, 'w');

		sout << " ";
	}

	/* END hab 1999.06.25 */
	USES_CONVERSION_U8;
	sout << "-i " << T2CA(INPUTFILE.getQuotedPath()); //getFileFullName(); // leave off the dir
	sout << " -f " << T2CA(m_sCMDPath.getQuotedPath()); //getShortPath();
	sout << " -o " << T2CA(m_sANAPath.getQuotedPath()) << " ";

	if(status.getVerbosity())
		sout << " -m ";	// randy wants to see the progress in the dos box

	sout << " > " <<  T2CA(m_sLOGPath.getQuotedPath());

#ifndef rde270
	// I'm just not sure if sout.str is going to be null terminated, so do it the long way.
	int nLen = sout.pcount();
	char* pSout = (char*)alloca(nLen + 1);
	strncpy(pSout, sout.str(), nLen);
	pSout[nLen] = '\0';
	CString s(U82CT(pSout));
#else   // rde270
	CString s(sout.str(), sout.pcount());
#endif  // rde270
	sout.rdbuf()->freeze(0); // else get a memory leak


	// !!!!!!!!!! TO DO: make sure the string is going to be short enough (under 128?)
	return s;
}

// EXCEPTIONS: CProcessFailure
void CAmpleProcess::processRAWTextFile(CProcessStatus& status)
{
	try
	{
		CString sBase = status.m_sFileNameRoot +_T("-ample");
		m_sANAPath = status.makeTempPath(sBase,_T(".ana"));
		m_sLOGPath = status.makeTempPath(sBase,	_T(".log") );
		// name the cmd file after the lang, not the particular document
		m_sCMDPath =  status.makeTempPath(status.getInputMFS()->getAbrev(),_T("-ample.cmd"));
		outputSupportFiles(status);
		m_sANAPath.deleteFile();	// don't care if it is found or not
		m_sLOGPath.deleteFile();	// don't care if it is found or not

		if(!executeTool(status))
		{		throw(CProcessFailure(this, _T("Failed to parse the source file")));
		}
		waitForCompletion(&status, &m_sLOGPath, &m_sANAPath);

		// register ana output so the user can view it
		CResultStreamFile* anaStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												_T("Ample ANA Out"), //short description
												_T("Parsed output in ANA format"), // long description
												_T("Ample ANA") // tab label
											),
					m_sANAPath.getFullPath(),
					status.getInputLang());
		status.registerResultStream(anaStream);

		//char* errorStrings[] = {"Error", "Missing", "Undefined", "Cannot", "Empty"};

		//BOOL bHasError = FALSE; //searchFile(errorStrings[0]);

		registerLog(status, m_sLOGPath);

		status.sANAPath = m_sANAPath;
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


CString CAmpleProcess::getBatchName(CProcessStatus& status)
{
	CString sBatchFile;
#ifndef hab204
	sBatchFile.Format(_T("%s ample%d"),
			  (LPCTSTR)status.getInputMFS()->getAbrev(),
			  status.m_iProcNumber);
#else // hab204
	sBatchFile.Format("%s ample",
			status.getInputMFS()->getAbrev());
	sBatchFile+='0' + status.m_iProcNumber;
#endif // hab204
	return sBatchFile;
}

BOOL CAmpleProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditAmpleProcess dlg;

	// Load in all our settings
	dlg.m_bCheckMorphnames=		m_bCheckMorphnames;
	dlg.m_iMaxMorphnameLength=		m_iMaxMorphnameLength;
//	dlg.m_bMonitorProgress=		m_bMonitorProgress;
	dlg.m_bOutputRootGlosses=		m_bOutputRootGlosses;
	dlg.m_bPrintTestParseTrees=	m_bPrintTestParseTrees;
	dlg.m_bReportAmbiguityPercentages=m_bReportAmbiguityPercentages;
	dlg.m_bWriteDecompField=	m_bWriteDecompField;
	dlg.m_bWritePField=			m_bWritePField;
	dlg.m_bWriteWordField=		m_bWriteWordField;
	dlg.m_bTrace = m_bTrace;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bCheckMorphnames=		dlg.m_bCheckMorphnames;
	m_iMaxMorphnameLength=		dlg.m_iMaxMorphnameLength;
//	m_bMonitorProgress=		dlg.m_bMonitorProgress;
	m_bOutputRootGlosses=		dlg.m_bOutputRootGlosses;
	m_bPrintTestParseTrees=	dlg.m_bPrintTestParseTrees;
	m_bReportAmbiguityPercentages=dlg.m_bReportAmbiguityPercentages;
	m_bWriteDecompField=	dlg.m_bWriteDecompField;
	m_bWritePField=			dlg.m_bWritePField;
	m_bWriteWordField=		dlg.m_bWriteWordField;
	m_bTrace = dlg.m_bTrace;

	return TRUE;
}

void CAmpleProcess::outputSupportFiles(CProcessStatus& status)
{
	USES_CONVERSION;
	ofstream fout(T2CA(m_sCMDPath.getFullPath()));

	ASSERTX(status.getInputLang());
	CModelFilesSet* pSourceMFS = status.getInputMFS();
	ASSERTX(pSourceMFS);

	fout  << T2CA(pSourceMFS->getADCtlPath()) << "\n";
#ifndef hab17a1
	if (status.m_pProcPrefs->getDoInterlinearize())
	  fout <<   T2CA(pSourceMFS->getCtrlFilePath(_T("itcd.tab"))) << "\n";
	else
	  fout <<   T2CA(pSourceMFS->getCtrlFilePath(_T("cd.tab"))) << "\n";
#else // hab17a1
	fout <<   pSourceMFS->getCtrlFilePath(_T("cd.tab")) << "\n";
#endif // hab17a1
	if(status.getInputLang()->getUsingDictOrtho() )
		fout  << T2CA(pSourceMFS->getCtrlFilePath(_T("ordc.tab"))) << "\n";
	else
		fout << "\n";

	// note that these lines must appear based on whether ample is expecting
	// them, and thus expecting a line giving a name or a simple carriage return.
	// ample decides whether to ask for each type based on the maximums for each type
	if(!status.getInputMFS()->getUsingUnifiedDicts())
	{
		if(status.getInputLang()->getHavePrefixes())
		{
			if(!pSourceMFS->getPrefixDictPathD().IsEmpty())
				//throw(CProcessFailure(this, "Is MaxPrefixes > 0 but no prefix dictionary specified?"));
				fout <<	T2CA(pSourceMFS->getPrefixDictPathD()) << "\n"; //<<	pSourceMFS->getDictFilesDirectory()   << pSourceMFS->getPrefixDictName() << "\n";
		}

		if(status.getInputLang()->getHaveInfixes())
		{
			if(!pSourceMFS->getInfixDictPathD().IsEmpty())
				//throw(CProcessFailure(this, "Is MaxInfixes > 0 but no infix dictionary specified?"));
				fout <<	T2CA(pSourceMFS->getInfixDictPathD()) << "\n"; //<<	pSourceMFS->getDictFilesDirectory()  << pSourceMFS->getInfixDictName() << "\n";
		}

		if(status.getInputLang()->getHaveSuffixes())
		{
			if(!pSourceMFS->getSuffixDictPathD().IsEmpty())
				//throw(CProcessFailure(this, "Is MaxSuffixes > 0 but no suffix dictionary specified?"));
				fout <<	T2CA(pSourceMFS->getSuffixDictPathD()) << "\n"; //pSourceMFS->getDictFilesDirectory() << pSourceMFS->getSuffixDictName() << "\n";
		}
	}
	// do this next whether we have unified or not, since they're all store in the same array
//	for( int i=0; i< pSourceMFS->getRootDictCount(); i++)
//		fout << pSourceMFS->getRootDictShortPath(i) << "\n";

	// these could be the orginals or something created by phonrule or the like
	for( int i=0; i< status.m_pSrcDicts.GetSize(); i++)
		fout << T2CA(status.m_pSrcDicts[i]->getFullPath()) << "\n";

	fout << "\n";	// empty line means "no more dictionaries"
	fout <<  T2CA(pSourceMFS->getCtrlFilesDirectory())  << T2CA(pSourceMFS->getIntxFileFullName()) <<"\n";
	fout << "y\ny\n";
}

/*// Parameters: bSurroundQuotes = add quotes if for a dos command line
CString CAmpleProcess::getCMDFilePath(CProcessStatus& status, BOOL bSurroundQuotes)
{
	ASSERTX(status.getInputLang());
	strstream sout;

	if(bSurroundQuotes)
		sout << "\"";
	sout << pSourceMFS->getCtrlFilesDirectory()  << pSourceMFS->getAbrev() << ".cmd";
	if(bSurroundQuotes)
		sout << "\"";

	CString s(sout.str(), sout.pcount());
	sout.rdbuf()->freeze(0); // else get a memory leak
	return s;
}
*/
//DEL
//DEL //DEL
//DEL
