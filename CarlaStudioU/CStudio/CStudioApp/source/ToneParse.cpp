// ToneParse.cpp: implementation of the CToneParse class.
//
// 2.0.4 19-Jan-2000 hab Fix getBatchName so it allows for more than 9 processes

// jdh 2/9/00	added -f answer file path
//				added -a intx file
//				changed -x control file to use short path
// 2.0.5 10-Feb-2000 hab Show TonePars Log as a window
//                       Log should be created each time, not appended
//                       No need for -d option if the level is 0
//                       Display Segment Inventory was using -v instead of -s
//                        but that's Andy's fault because the TonePars code
//                        usage message was in error.
//                       Added -v option to verify control file information
// 2.3.2 18-Sep-2000 hab Changed default program name to TonePars32.exe
//                       Added check for unified dictionary
//                       Added tracing for run trace
// 2.4.1 01-Nov-2000 hab Reworked to handle TonePars 1.0.0
//////////////////////////////////////////////////////////////////////
#include "stdafx.h"
#include "carlastudioapp.h"
#include <strstrea.h>
#include <fstream.h>
#include "CWProcess.h"
#include "SFMFile.h"
#include "DlgEditToneParseProcess.h"
#include "processOutput.h"
#include "processStatus.h"
#include "parsestream.h"
#include "logwindow.h"
#include "ModelFilesSet.h"
#include "ProcessingPrefs.h"
#include "ToneParse.h"
#include "CarlaLanguage.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_DYNCREATE(CToneParseProcess, CDOSProcess);

CToneParseProcess::CToneParseProcess()
:CDOSProcess()
{
	setDefaultValues();
}

CToneParseProcess::~CToneParseProcess()
{

}

void CToneParseProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process "<< ID() << PROC_ENABLED_STATUS << "\n";
	outputInt(fout, "TracingLevel", m_nTracingLevel);
	outputBool(fout, "MonitorProgress", m_bMonitorProgress);
#ifndef hab205
	outputBool(fout, "VerifyControlFileInformation", m_bVerifyControlFileInformation);
#endif // hab205
	outputBool(fout, "TraceToneProcessing", m_bTraceToneProcessing);
	USES_CONVERSION;
	fout <<"\\ControlFilePath " << T2CA(m_sControlFilePath) << '\n';

	fout << "\\-Process "<< ID() << "\n";
}


void CToneParseProcess::readParametersFromSFMFile(SFMFile *f)
{
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here

	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker==_T("-Process"))
			break;
		else checkAndReadInt("TracingLevel", m_nTracingLevel)
		else checkAndReadBool("MonitorProgress", m_bMonitorProgress)
		else checkAndReadBool("VerifyControlFileInformation", m_bVerifyControlFileInformation)
		else checkAndReadBool("TraceToneProcessing", m_bTraceToneProcessing)
		else checkAndReadString("ControlFilePath", m_sControlFilePath )
		else if (sMarker == _T("EXEName"))
		  {
			;		// do nothing; no longer used
		  }
		else if (sMarker == _T("AnswerFilePath"))
		  {
			;		// do nothing; no longer used
		  }
		else if (sMarker == _T("DisplaySegmentInventory"))
		  {
			;		// do nothing; no longer used
		  }
		else
		{
			f->throwParseFailure(_T("ToneParseProcess"), sMarker, sField);
		}
	}
}

void CToneParseProcess::setDefaultValues()
{
	m_nTracingLevel = 0;
	m_bMonitorProgress = FALSE;
	m_bVerifyControlFileInformation = FALSE;
	m_bTraceToneProcessing = FALSE;
	m_bCheckMorphnames = FALSE;
}


BOOL CToneParseProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditToneParseProcess dlg;

	// Load in all our settings
	dlg.m_bMonitorProgress = m_bMonitorProgress;
	dlg.m_bVerifyControlFileInformation = m_bVerifyControlFileInformation;
	dlg.m_bTraceToneProcessing = m_bTraceToneProcessing;
	dlg.m_sControlFilePath = m_sControlFilePath;
	dlg.m_nTracingLevel = m_nTracingLevel;
	dlg.m_bCheckMorphnames = m_bCheckMorphnames;

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

	return TRUE;
}


LPCTSTR CToneParseProcess::getToolPath()
{
	return _T("TonePars32");
}

CString CToneParseProcess::getBatchName(CProcessStatus& status)
{
	CString sBatchFile;
	sBatchFile.Format(_T("%s ToneParse%d"),
			  (LPCTSTR)status.getInputMFS()->getAbrev(),
			  status.m_iProcNumber);
	return sBatchFile;
}


CString CToneParseProcess::getCommandLine(CProcessStatus& status)
{
  // note: the default directory will be set the dir containing the source file
  //       so that doesn't need to be specified

  strstream sout;
/*
Usage: TonePars [options]
-c char  select the record Comment character (default is '|')
-d num   select the maximum trie Depth (default is 2)
-D num   Trace level for tone tracing
-f file  File containing names of data files
-i file  name of a single Input analysis file
-m       Monitor progress by displaying a dot for each word processed
-o file  name of the Output synthesis file
-q       work Quietly without any screen output
-r       Report morphemes not found in dictionaries
-T       Trace tone generation rule applications
-u       dictionaries are Unified, not split into prefix, ..., root
-v       Verify tests by pretty printing the parse trees
*/

  if('|' != status.getInputMFS()->getCommentChar())
	sout << "-c " << status.getInputMFS()->getCommentChar() << " ";

  USES_CONVERSION_U8;
  sout << "-i " << T2CA(status.sANAPath.getShortPath()) << ' '; //jdh 2/9/00 changed from: getQuotedPath() ;

  sout << " -o " << T2CA(m_sOutputANAPath.getQuotedPath()) << " "; // !!ANDY ANDY this may be a problem.  Can't just use getShortPath() because that only works if the file exists.  If TonePars can't handle the long quote, then we need to insert a line above this which will make a blank file of the proper name, then we could use getShortPath() safely

  if(status.m_pProcPrefs->m_dwFlags & CProcessingPrefs::kTrace)
	sout << " -T ";
  else
	ifTrueOutputItem(sout, m_bTraceToneProcessing, "-T ");
  if (m_nTracingLevel > 0)
	sout << " -D " << m_nTracingLevel << " ";
  ifTrueOutputItem(sout, m_bMonitorProgress, "-m ");
  ifTrueOutputItem(sout, m_bVerifyControlFileInformation, "-v ");
  ifTrueOutputItem(sout, m_bCheckMorphnames, "-r ");

  if(status.getInputMFS()->getUsingUnifiedDicts())
	sout << "-u ";
  sout << "-f " << T2CA(m_sCMDPath.getShortPath()) << ' ';

  if(status.sANAPath.getShortPath().IsEmpty())
	throw(CProcessFailure(this, _T("Huh?  There was no ANA file path given to the ToneParse process.  You should look into the log of the previous processor (ample or sentrans) and look for errors, then report this as a bug.")));

				// use > instead of >>
  sout << " > " <<  T2CA(m_sLOGPath.getQuotedPath());  // should be ok as long path, since tonepars won't read this, and it needs to be long since it may be created here

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

  return s;
}

void CToneParseProcess::outputSupportFiles(CProcessStatus& status)
{
	USES_CONVERSION;
	ofstream fout(T2CA(m_sCMDPath.getFullPath()));

  ASSERTX(status.getInputMFS());
  CModelFilesSet* pSourceMFS = status.getInputMFS();
  ASSERTX(pSourceMFS);

/*
srcad.ctl
srctp.ctl
srccd.tab
srcordc.tab
srcsf.dic
srcrt.dic

srctpintx.ctl
*/
  fout  << T2CA(pSourceMFS->getADCtlPath()) << "\n";
  fout << m_sControlFilePath << "\n";
  fout <<   T2CA(pSourceMFS->getCtrlFilePath(_T("cd.tab"))) << "\n";
  if(status.getInputLang()->getUsingDictOrtho() )
	fout  << T2CA(pSourceMFS->getCtrlFilePath(_T("ordc.tab"))) << "\n";
  else
	fout << "\n";

  // note that these lines must appear based on whether Stamp is expecting
  // them, and thus expecting a line giving a name or a simple carriage return.
  // Stamp decides whether to ask for each type based on the maximums for each type
  if(!status.getInputMFS()->getUsingUnifiedDicts())
	{
	  if(status.getInputLang()->getHavePrefixes())
	fout <<	T2CA(pSourceMFS->getPrefixDictPathD()) << "\n";

	  if(status.getInputLang()->getHaveInfixes())
	fout <<	T2CA(pSourceMFS->getInfixDictPathD()) << "\n";

	  if(status.getInputLang()->getHaveSuffixes())
	fout <<	T2CA(pSourceMFS->getSuffixDictPathD()) << "\n";
	}

  // these could be the orginals or something created by phonrule or the like
  for( int i=0; i< status.m_pSrcDicts.GetSize(); i++)
	fout << T2CA(status.m_pSrcDicts[i]->getFullPath()) << "\n";

  fout << "\n";	// empty line means "no more dictionaries"
#ifndef hab242
  fout <<  T2CA(pSourceMFS->getCtrlFilePath(_T("intx.ctl"))) <<"\n";
#else  // hab242
  fout <<  pSourceMFS->getCtrlFilePath("tpintx.ctl") <<"\n";
#endif // hab242
}



// EXCEPTIONS: CProcessFailure
// TO DO:	clean up error reporting
//			use dialog to say we're busy and give a cancel button
void CToneParseProcess::processANAFile(CProcessStatus& status)
{
  try
	{
	  CString sBase = status.m_sFileNameRoot +_T("-tpars");
	  m_sOutputANAPath = status.makeTempPath(sBase,_T(".ana"));
	  m_sLOGPath = status.makeTempPath(sBase,	_T(".log") );


	  m_sCMDPath =status.makeTempPath(sBase, _T(".cmd"));

	  outputSupportFiles(status);

	  m_sOutputANAPath.deleteFile();	// don't care if it is found or not
	  m_sLOGPath.deleteFile();	// don't care if it is found or not

	  if(!executeTool(status))
	{
	  throw(CProcessFailure(this, _T("Failed to process the file with ToneParse")));
	}

	  waitForCompletion(&status, &m_sOutputANAPath);

	  // register itx output so the user can view it
	  CResultStreamFile* anaStream =
	new CResultStreamFile(
				  new CResultStreamDescriptor(this,
							  _T("TPARS ANA"), //short description
							  _T("ANA Output of ToneParse"), // long description
							  _T("TPARS ANA") // tab label
							  ),
				  m_sOutputANAPath,
				  status.getInputLang());

	  status.registerResultStream(anaStream);
	  registerLog(status, m_sLOGPath, status.getInputLang());

	  status.sANAPath = m_sOutputANAPath;
	}
  catch(CString sError)
	{
	  throw(CProcessFailure(this, sError));
	}
}
