// ToneGen.cpp: implementation of the CToneGen class.
//
//////////////////////////////////////////////////////////////////////
// 2.4.1 01-Nov-2000 hab Reworked to handle ToneGen 1.0.0

#include "stdafx.h"
#include "carlastudioapp.h"
#include <strstrea.h>
#include <fstream.h>
#include "CWProcess.h"
#include "SFMFile.h"
#include "DlgEditToneGenProcess.h"
#include "processOutput.h"
#include "processStatus.h"
#include "parsestream.h"
#include "logwindow.h"
#include "ModelFilesSet.h"
#include "ProcessingPrefs.h"
#include "ToneGen.h"
#include "CarlaLanguage.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_DYNCREATE(CToneGenProcess, CDOSProcess);

CToneGenProcess::CToneGenProcess()
:CDOSProcess()
{
	setDefaultValues();
}

CToneGenProcess::~CToneGenProcess()
{

}

void CToneGenProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process "<< ID() << PROC_ENABLED_STATUS << "\n";
	outputInt(fout, "TracingLevel", m_nTracingLevel);
	outputBool(fout, "MonitorProgress", m_bMonitorProgress);
	outputBool(fout, "VerifyControlFileInformation", m_bVerifyControlFileInformation);
	outputBool(fout, "TraceToneProcessing", m_bTraceToneProcessing);
	fout <<"\\ControlFilePath " << m_sControlFilePath << '\n';

	fout << "\\-Process "<< ID() << "\n";
}


void CToneGenProcess::readParametersFromSFMFile(SFMFile *f)
{
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here

	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker=="-Process")
			break;
		else checkAndReadInt("TracingLevel", m_nTracingLevel)
		else checkAndReadBool("MonitorProgress", m_bMonitorProgress)
		else checkAndReadBool("VerifyControlFileInformation", m_bVerifyControlFileInformation)
		else checkAndReadBool("TraceToneProcessing", m_bTraceToneProcessing)
		else checkAndReadString("ControlFilePath", m_sControlFilePath )
		else if (sMarker == "EXEName")
		  {
			;		// do nothing; no longer used
		  }
		else if (sMarker == "AnswerFilePath")
		  {
			;		// do nothing; no longer used
		  }
		else if (sMarker == "DisplaySegmentInventory")
		  {
			;		// do nothing; no longer used
		  }
		else
		{
			f->throwParseFailure("ToneGenProcess", sMarker, sField);
		}
	}
}

void CToneGenProcess::setDefaultValues()
{
	m_nTracingLevel = 0;
	m_bMonitorProgress = FALSE;
	m_bVerifyControlFileInformation = FALSE;
	m_bTraceToneProcessing = FALSE;
	m_bCheckMorphnames = FALSE;
	m_bOutputAllSyntheses = FALSE;
	m_bCheckRootCats = FALSE;
	m_bTraceSynthesis = FALSE;
}


BOOL CToneGenProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditToneGenProcess dlg;

	// Load in all our settings
	dlg.m_bMonitorProgress = m_bMonitorProgress;
	dlg.m_bVerifyControlFileInformation = m_bVerifyControlFileInformation;
	dlg.m_bTraceToneProcessing = m_bTraceToneProcessing;
	dlg.m_sControlFilePath = m_sControlFilePath;
	dlg.m_nTracingLevel = m_nTracingLevel;
	dlg.m_bCheckMorphnames = m_bCheckMorphnames;
	dlg.m_bOutputAllSyntheses = m_bOutputAllSyntheses;
	dlg.m_bCheckRootCats = m_bCheckRootCats;
	dlg.m_bTraceSynthesis = m_bTraceSynthesis;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_bMonitorProgress = dlg.m_bMonitorProgress;
	m_bVerifyControlFileInformation = dlg.m_bVerifyControlFileInformation;
	m_bTraceToneProcessing = dlg.m_bTraceToneProcessing;
	m_sControlFilePath = dlg.m_sControlFilePath;
	m_nTracingLevel = dlg.m_nTracingLevel;
	m_bCheckMorphnames = dlg.m_bCheckMorphnames;
	m_bOutputAllSyntheses = dlg.m_bOutputAllSyntheses;
	m_bCheckRootCats = dlg.m_bCheckRootCats;
	m_bTraceSynthesis = dlg.m_bTraceSynthesis;

	return TRUE;
}


const char* CToneGenProcess::getToolPath()
{
	return "ToneGen32";
}

CString CToneGenProcess::getBatchName(CProcessStatus& status)
{
	CString sBatchFile;
	sBatchFile.Format("%s ToneGen%d",
			  status.getInputMFS()->getAbrev(),
			  status.m_iProcNumber);
	return sBatchFile;
}


CString CToneGenProcess::getCommandLine(CProcessStatus& status)
{
	// note: the default directory will be set the dir containing the source file
	//       so that doesn't need to be specified

	strstream sout;
	ASSERTX(status.getOutputMFS());
/*
Usage: ToneGen [options]
-a       return All valid allomorph combinations, not just the first
-c char  select the record Comment character (default is '|')
-d num   select the maximum trie Depth (default is 2)
-D num   Trace level for tone tracing
-f file  File containing names of data files
-i file  name of a single Input analysis file
-m       Monitor progress by displaying a dot for each word processed
-n       No checking of root categories during synthesis
-o file  name of the Output synthesis file
-q       work Quietly without any screen output
-r       Report morphemes not found in dictionaries
-t       Trace synthesis (produces voluminous output)
-T       Trace tone generation rule applications
-u       dictionaries are Unified, not split into prefix, ..., root
-v       Verify tests by pretty printing the parse trees
*/

	if(status.getInputMFS()->getUsingUnifiedDicts())
	  sout << "-u ";

	if('|' != status.getInputMFS()->getCommentChar())
		sout << "-c " << status.getInputMFS()->getCommentChar() << " ";

	sout << "-i " << status.sANAPath.getShortPath() << ' '; //jdh 2/9/00 changed from: getQuotedPath() ;

	sout << " -o " << m_sOutputTextPath.getQuotedPath() << " "; // !!ANDY ANDY this may be a problem.  Can't just use getShortPath() because that only works if the file exists.  If TonePars can't handle the long quote, then we need to insert a line above this which will make a blank file of the proper name, then we could use getShortPath() safely

	if(status.m_pProcPrefs->m_dwFlags & CProcessingPrefs::kTrace)
		sout << " -T -t ";
	else
	  {
		ifTrueOutputItem(sout, m_bTraceToneProcessing, "-T ");
		ifTrueOutputItem(sout, m_bTraceSynthesis, "-t ");
	  }
	if (m_nTracingLevel > 0)
	  sout << " -D " << m_nTracingLevel << " ";
	ifTrueOutputItem(sout, m_bMonitorProgress, "-m ");
	ifTrueOutputItem(sout, m_bVerifyControlFileInformation, "-v ");
	ifTrueOutputItem(sout, m_bOutputAllSyntheses, "-a ");
	ifTrueOutputItem(sout, m_bCheckMorphnames, "-r ");
	ifTrueOutputItem(sout, !m_bCheckRootCats, "-n ");

	sout << "-f " << m_sCMDPath.getShortPath() << ' ';


	if(status.sANAPath.getShortPath().IsEmpty())
		throw(CProcessFailure(this, "Huh?  There was no ANA file path given to the ToneGen process.  You should look into the log of the previous processor (ample or sentrans) and look for errors, then report this as a bug."));

				// use > instead of >>
	sout << " > " <<  m_sLOGPath.getQuotedPath();  // should be ok as long path, since tonepars won't read this, and it needs to be long since it may be created here

	CString s(sout.str(), sout.pcount());
	sout.rdbuf()->freeze(0); // else get a memory leak

	return s;
}

void CToneGenProcess::outputSupportFiles(CProcessStatus& status)
{
  ofstream fout(m_sCMDPath.getFullPath());

  ASSERTX(status.getOutputMFS());
  CModelFilesSet* pTargetMFS = status.getOutputMFS();
  ASSERTX(pTargetMFS);

/*tarad.ctl
tartp.ctl
tarsynt.chg
tarsycd.tab
tarordc.tab
tarsf.dic
tarrt.dic

tarouttx.ctl
*/
  fout  << pTargetMFS->getADCtlPath() << "\n";
  fout << m_sControlFilePath << "\n";
  fout << pTargetMFS->getStampSynthPath() << "\n";
  fout <<   pTargetMFS->getCtrlFilePath("sycd.tab") << "\n";
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
	fout <<	pTargetMFS->getPrefixDictPathD() << "\n";

	  if(status.getOutputLang()->getHaveInfixes())
	fout <<	pTargetMFS->getInfixDictPathD() << "\n";

	  if(status.getOutputLang()->getHaveSuffixes())
	fout <<	pTargetMFS->getSuffixDictPathD() << "\n";
	}

  // these could be the orginals or something created by phonrule or the like
  for( int i=0; i< status.m_pTarDicts.GetSize(); i++)
	fout << status.m_pTarDicts[i]->getFullPath() << "\n";

  fout << "\n";	// empty line means "no more dictionaries"
  fout <<  pTargetMFS->getCtrlFilePath("outtx.ctl") <<"\n";
}

// EXCEPTIONS: CProcessFailure
// TO DO:	clean up error reporting
//			use dialog to say we're busy and give a cancel button
void CToneGenProcess::processANAFile(CProcessStatus& status)
{
  LPCTSTR kOutputExt = ".txz";
  LPCTSTR kLogExt = ".tgp";
  LPCTSTR kCMDExt = ".cmt";

  try
	{
	  ASSERTX(status.getOutputLang());
	  CString sBase = status.getInputMFS()->getAbrev() + status.getOutputMFS()->getAbrev() + "-tgen";
	  m_sOutputTextPath = status.makeTempPath(status.sANAPath.getFileName(), kOutputExt);
	  m_sLOGPath = status.makeTempPath(sBase,	".log" );

	  m_sCMDPath =status.makeTempPath(sBase, ".cmd");

	  outputSupportFiles(status);

	  m_sOutputTextPath.deleteFile();	// don't care if it is found or not
	  m_sLOGPath.deleteFile();	// don't care if it is found or not

	  if(!executeTool(status))
	{
	  throw(CProcessFailure(this, "Unknown execution problem"));
	}
	  waitForCompletion(&status, &m_sLOGPath, &m_sOutputTextPath);


	  // register ana output so the user can view it
	  CString sLabel(status.getOutputMFS()->getAbrev());
	  sLabel += " Text";
	  CResultStreamFile* textStream =
	new CResultStreamFile(
			   new CResultStreamDescriptor(this,
					   "Synthesized Text",
					   "Target text synthesized by ToneGen (ToneGen synthesis)",
					   sLabel // language specific
					   ),
		   m_sOutputTextPath.getFullPath(),
		   status.getOutputLang());
	  status.registerResultStream(textStream);


	  registerLog(status, m_sLOGPath, status.getOutputLang());
	  status.sRAWPath = m_sOutputTextPath;
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
