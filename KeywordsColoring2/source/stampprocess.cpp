// jdh 11/10/99 watch the Status prefs for turning on tracing temporarily
// 1.7a1 07-Dec-1999 hab Added use of stamp dict code table.
//       10-Dec-1999 hab Move location of transfer files from source to target
//                       control file directory

#include "stdafx.h"
#include <strstrea.h>
#include <fstream.h>
#include "Process.h"
#include "CarlaLanguage.h"	// still needed for access to dict info and dict-ortho info
//#include "ModelFilesSet.h"	// would rather only include this
#include "StampProcess.h"
#include "DlgEditStampProcess.h"
#include "SFMFile.h"
#include "processoutput.h"
#include "logwindow.h"
#include "processStatus.h"
#include "ProcessingPrefs.h"

// the following is to increase readability of the code
#define INPUTFILE status.sANAPath

IMPLEMENT_DYNCREATE(CStampProcess, CDOSProcess);


CStampProcess::CStampProcess()
:CDOSProcess()
{
	setDefaultValues();
}


// called by CProcess constructor
// even if the values will be read in, we need this in case some values are
// missing (as will happen when the user is upgrading to a new version)
void CStampProcess::setDefaultValues()
{
	m_bCheckMorphnames=	0;
	m_bMonitorProgress=	0;
	m_bPrintTestParseTrees=	0;
	m_bCheckRootCats=1;	// its the default in the DOS version
	m_bTrace=0;
	m_bAllAllomorphCombos=0;
}

void CStampProcess::readParametersFromSFMFile(SFMFile *f)
{
	setDefaultValues();
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here
	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker=="-Process")
			break;
		checkAndReadBool("CheckMorphnames",m_bCheckMorphnames)
		else checkAndReadBool("MonitorProgress",m_bMonitorProgress)
		else checkAndReadBool( "CheckMorphnames", m_bCheckMorphnames)
		else checkAndReadBool( "MonitorProgress", m_bMonitorProgress)
		else checkAndReadBool( "PrintTestParseTrees",m_bPrintTestParseTrees)
		else checkAndReadBool( "AllAllomorphCombos", m_bAllAllomorphCombos)
		else checkAndReadBool( "CheckRootCats",m_bCheckRootCats)
		else checkAndReadBool( "Trace",m_bTrace)
		else
		{
			f->throwParseFailure("StampProcess", sMarker, sField);
		}
	}
}

void CStampProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process " << getProcessorID() << PROC_ENABLED_STATUS <<"\n";
	outputBool(fout, "MonitorProgress", m_bMonitorProgress);
	outputBool(fout, "CheckMorphnames", m_bCheckMorphnames);
	outputBool(fout, "PrintTestParseTrees",m_bPrintTestParseTrees);
	outputBool(fout, "AllAllomorphCombos",m_bAllAllomorphCombos);
	outputBool(fout, "CheckRootCats",m_bCheckRootCats);
	outputBool(fout, "Trace",m_bTrace);
	fout << "\\-Process " << getProcessorID() << "\n";
}

const char* CStampProcess::getToolPath()
{
	return "STAMP32";
}

CString CStampProcess::getCommandLine(CProcessStatus& status)
{
	strstream sout;
	ASSERTX(status.getOutputMFS());

	// note: the default directory will be set the dir containing the source file
	//       so that doesn't need to be specified
	if(status.getOutputMFS()->getUsingUnifiedDicts())
		sout << "-u ";

	if('|' != status.getOutputMFS()->getCommentChar())
		sout << " -c " << status.getOutputMFS()->getCommentChar() << " ";

	ifTrueOutputItem(sout, m_bAllAllomorphCombos, "-a ");
	ifTrueOutputItem(sout, m_bMonitorProgress, "-m ");
	ifTrueOutputItem(sout, m_bCheckMorphnames, "-r ");
	ifTrueOutputItem(sout, !m_bCheckRootCats, "-n ");

	ifTrueOutputItem(sout, m_bPrintTestParseTrees, "-v " );

	if(status.m_pProcPrefs->m_dwFlags & CProcessingPrefs::kTrace)		// jdh 11/10/99
		sout << " -t ";
	else
		ifTrueOutputItem(sout, m_bTrace, "-t ");

	insertOtherFlags(sout);	// used by TRAMPLEProcess

	// those that don't exist already are full paths because
	// this short-path method doesn't yet work on non-existent
	// files and they're in teh temp dir anyhow.
	sout << "-i " << INPUTFILE.getQuotedPath();
	sout << " -f " << m_sCMDPath.getQuotedPath();
	sout << " -o " << m_sOutPath.getQuotedPath() << " ";

	sout << " > " <<  m_sLOGPath.getQuotedPath();

	CString s(sout.str(), sout.pcount());
	sout.rdbuf()->freeze(0); // else get a memory leak

	// !!!!!!!!!! TO DO: make sure the string is going to be short enough (under 128?)

	return s;
}


BOOL CStampProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditStampProcess dlg;

	// Load in all our settings
	dlg.m_bCheckMorphnames=		m_bCheckMorphnames;
	dlg.m_bMonitorProgress=		m_bMonitorProgress;
	dlg.m_bPrintTestParseTrees=	m_bPrintTestParseTrees;
	dlg.m_bCheckRootCats = m_bCheckRootCats;
	dlg.m_bAllAllomorphCombos = m_bAllAllomorphCombos;
	dlg.m_bTrace = m_bTrace;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bCheckMorphnames=		dlg.m_bCheckMorphnames;
	m_bMonitorProgress=		dlg.m_bMonitorProgress;
	m_bPrintTestParseTrees=	dlg.m_bPrintTestParseTrees;
	m_bCheckRootCats = dlg.m_bCheckRootCats;
	m_bAllAllomorphCombos = dlg.m_bAllAllomorphCombos;
	m_bTrace = dlg.m_bTrace;

	return TRUE;
}

void CStampProcess::outputSupportFiles(CProcessStatus& status)
{
	ofstream fout(m_sCMDPath.getFullPath());

	ASSERTX(status.getOutputMFS());
	CModelFilesSet* pTargetMFS = status.getOutputMFS();
	ASSERTX(pTargetMFS);

	/*abcad.ctl
abctartr.chg
tarsynt.chg
tarcd.tab
tarordc.tab
tarsf.dic
abctarrt.dic

tarouttx.ctl
*/
	fout  << pTargetMFS->getADCtlPath() << "\n";
	fout << getTransferPath(status) << "\n";
	fout << getSynthPath(status)<< "\n";
#ifndef hab17a1
	fout <<   pTargetMFS->getCtrlFilePath("sycd.tab") << "\n";
#else //hab 17a1
	fout <<   pTargetMFS->getCtrlFilePath("cd.tab") << "\n";
#endif // hab17a1
	if(status.getOutputLang()->getUsingDictOrtho() )
		fout  << pTargetMFS->getCtrlFilePath("ordc.tab") << "\n";
	else
		fout << "\n";

	// note that these lines must appear based on whether Stamp is expecting
	// them, and thus expecting a line giving a name or a simple carriage return.
	// Stamp decides whether to ask for each type based on the maximums for each type
	if(!status.getOutputMFS()->getUsingUnifiedDicts())
	{
		if(status.getOutputLang()->getHavePrefixes())
			fout <<	pTargetMFS->getPrefixDictPathD() << "\n";//pTargetMFS->getDictFilesDirectory()   << pTargetMFS->getPrefixDictName() << "\n";

		if(status.getOutputLang()->getHaveInfixes())
			fout <<	pTargetMFS->getInfixDictPathD() << "\n";//pTargetMFS->getDictFilesDirectory()  << pTargetMFS->getInfixDictName() << "\n";

		if(status.getOutputLang()->getHaveSuffixes())
			fout <<	pTargetMFS->getSuffixDictPathD() << "\n";//pTargetMFS->getDictFilesDirectory() << pTargetMFS->getSuffixDictName() << "\n";
	}
	// do this next whether we have unified or not, since they're all store in the same array
//	for( int i=0; i< pTargetMFS->getRootDictCount(); i++)
//		fout << pTargetMFS->getRootDictShortPath(i) << "\n";

		// these could be the orginals or something created by phonrule or the like
	for( int i=0; i< status.m_pTarDicts.GetSize(); i++)
		fout << status.m_pTarDicts[i]->getFullPath() << "\n";

	fout << "\n";	// empty line means "no more dictionaries"
	fout <<  pTargetMFS->getCtrlFilePath("outtx.ctl") <<"\n";
}


/////////////////////////////////////////////////////////////////
/////////////////// CTrampleProcess /////////////////////////////
/////////////////////////////////////////////////////////////////
IMPLEMENT_DYNCREATE(CTrampleProcess, CStampProcess);

CTrampleProcess::CTrampleProcess()
:CStampProcess()
{
}

CString CTrampleProcess::getTransferPath(CProcessStatus& status)
{
	// we want <srcabrev><targAbrev>tr.chg
#ifndef hab17a1
	return status.getOutputMFS()->getStampTransferPath(
				status.getInputMFS()->getAbrev(),
				status.getOutputMFS()->getAbrev());
#else // hab17a1
	return status.getInputMFS()->getStampTransferPath(
				status.getOutputMFS()->getAbrev());
#endif // hab17a1
}


CString CTrampleProcess::getSynthPath(CProcessStatus& status)
{
	return "";	// no synth
}

//virtual
void CTrampleProcess::insertOtherFlags(ostream& sout)
{
	sout << " -x "; // transfer only
}

// EXCEPTIONS: CProcessFailure
void CTrampleProcess::processANAFile(CProcessStatus& status)
{
	LPCTSTR kOutputExt = ".txs";
	LPCTSTR kLogExt = ".trp";

	try
	{
		ASSERTX(status.getOutputLang());
		CString sBase = status.getInputMFS()->getAbrev() + status.getOutputMFS()->getAbrev() + "-trample";
		m_sOutPath = status.makeTempPath(INPUTFILE.getFileName(), kOutputExt);
		m_sLOGPath = status.makeTempPath(sBase,	".log" );
		m_sCMDPath =status.makeTempPath(sBase, ".cmd");

		outputSupportFiles(status);
		m_sOutPath.deleteFile();	// don't care if it is found or not
		m_sLOGPath.deleteFile();	// don't care if it is found or not

		if(!executeTool(status))
		{		throw(CProcessFailure(this, "Unknown execution problem"));
		}
		waitForCompletion(&status, &m_sLOGPath, &m_sOutPath);


		// register ana output so the user can view it
		CString sLabel(status.getOutputMFS()->getAbrev());
		sLabel += " ANA";
		CResultStreamFile* textStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												"TRMP-Target ANA",
												"Target ANA produced by applying Trample (STAMP transfer) transfer rules",
												sLabel // language specific
											),
					m_sOutPath.getFullPath(),
					status.getOutputLang());
		status.registerResultStream(textStream);

		// could reasonably be in either input or output language
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



/////////////////////////////////////////////////////////////////
/////////////////// CSampleProcess /////////////////////////////
/////////////////////////////////////////////////////////////////
IMPLEMENT_DYNCREATE(CSampleProcess, CStampProcess);

CSampleProcess::CSampleProcess()
:CStampProcess()
{
}

CString CSampleProcess::getTransferPath(CProcessStatus& status)
{
	return "";	// no transfer
}

CString CSampleProcess::getSynthPath(CProcessStatus& status)
{
	return status.getOutputLang()->getMFS()->getStampSynthPath() ;
}

// EXCEPTIONS: CProcessFailure
void CSampleProcess::processANAFile(CProcessStatus& status)
{
	LPCTSTR kOutputExt = ".txz";
	LPCTSTR kLogExt = ".smp";
	LPCTSTR kCMDExt = ".cms";

	try
	{
		ASSERTX(status.getOutputLang());
		CString sBase = status.getInputMFS()->getAbrev() + status.getOutputMFS()->getAbrev() + "-sample";
		m_sOutPath = status.makeTempPath(INPUTFILE.getFileName(), kOutputExt);
		m_sLOGPath = status.makeTempPath(sBase,	".log" );
		m_sCMDPath =status.makeTempPath(sBase, ".cmd");

		outputSupportFiles(status);
		m_sOutPath.deleteFile();	// don't care if it is found or not
		m_sLOGPath.deleteFile();	// don't care if it is found or not

		if(!executeTool(status))
		{		throw(CProcessFailure(this, "Unknown execution problem"));
		}
		waitForCompletion(&status, &m_sLOGPath, &m_sOutPath);


		// register ana output so the user can view it
		CString sLabel(status.getOutputMFS()->getAbrev());
		sLabel += " Text";
		CResultStreamFile* textStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
												"Synthesized Text",
												"Target text synthesized by Sample (STAMP synthesis)",
												sLabel // language specific
											),
					m_sOutPath.getFullPath(),
				status.getOutputLang());
		status.registerResultStream(textStream);


		registerLog(status, m_sLOGPath, status.getOutputLang());
		status.sRAWPath = m_sOutPath;
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

CString CTrampleProcess::getBatchName(CProcessStatus& status)
{
	//CCarlaLanguage* pLang = m_pOwningSequence->getSrcLang();
	CString sBatchFile;
#ifndef hab204
	sBatchFile.Format("%s-%s-trample%d",
			  status.getInputMFS()->getAbrev(),
			  status.getOutputMFS()->getAbrev(),
			  status.m_iProcNumber);
#else // hab204
	sBatchFile.Format("%s-%s-trample",
			status.getInputMFS()->getAbrev(),
			status.getOutputMFS()->getAbrev());
	sBatchFile+='0' + status.m_iProcNumber;
#endif // hab204
	return sBatchFile;
}


CString CSampleProcess::getBatchName(CProcessStatus& status)
{
	//CCarlaLanguage* pLang = m_pOwningSequence->getSrcLang();
	CString sBatchFile;
#ifndef hab204
	sBatchFile.Format("%s-sample%d",
			  status.getOutputMFS()->getAbrev(),
			  status.m_iProcNumber);
#else // hab204
	sBatchFile.Format("%s-sample",
			status.getOutputMFS()->getAbrev());
	sBatchFile+='0' + status.m_iProcNumber;
#endif // hab204
	return sBatchFile;
}
