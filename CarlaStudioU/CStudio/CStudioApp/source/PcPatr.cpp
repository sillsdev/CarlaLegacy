// PcPatr.cpp: implementation of the CPcPatr class.
//
// 2.1.0 14-Feb-2000 hab Initial coding
//////////////////////////////////////////////////////////////////////
#include "stdafx.h"
#include "carlastudioapp.h"
#include <strstrea.h>
#include <fstream.h>
#include "CWProcess.h"
#include "SFMFile.h"
#include "DlgEditPcPatrProcess.h"
#include "processOutput.h"
#include "processStatus.h"
#include "parsestream.h"
#include "logwindow.h"
#include "ModelFilesSet.h"

#include "PcPatr.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_DYNCREATE(CPcPatrProcess, CDOSProcess);

CPcPatrProcess::CPcPatrProcess()
:CDOSProcess()
{
	setDefaultValues();
}

CPcPatrProcess::~CPcPatrProcess()
{

}

void CPcPatrProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process "<< ID() << PROC_ENABLED_STATUS << "\n";
	fout <<"\\GrammarFilePath " << m_sGrammarFile << '\n';
	fout <<"\\TakeFilePath " << m_sTakeFile << '\n'; //jdh 2/9/00
	fout <<"\\EXEName " << m_sEXEName << '\n';

	fout << "\\-Process "<< ID() << "\n";
}


void CPcPatrProcess::readParametersFromSFMFile(SFMFile *f)
{
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here

	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker=="-Process")
			break;
		else checkAndReadString("GrammarFilePath", m_sGrammarFile )
		else checkAndReadString("TakeFilePath", m_sTakeFile )//jdh 2/9/00
		else checkAndReadString("EXEName", m_sEXEName)

		else
		{
			f->throwParseFailure("PcPatrProcess", sMarker, sField);
		}
	}
}

void CPcPatrProcess::setDefaultValues()
{
	m_sEXEName = "PcPatr32.exe";
}


BOOL CPcPatrProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditPcPatrProcess dlg;

	// Load in all our settings
	dlg.m_sEXEName = m_sEXEName;
	dlg.m_sGrammarFile = m_sGrammarFile;
	dlg.m_sTakeFile = m_sTakeFile;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_sEXEName = dlg.m_sEXEName;
	m_sGrammarFile = dlg.m_sGrammarFile;
	m_sTakeFile = dlg.m_sTakeFile;

	return TRUE;
}


LPCTSTR CPcPatrProcess::getToolPath()
{
	return m_sEXEName;
}

CString CPcPatrProcess::getBatchName(CProcessStatus& status)
{
	CString sBatchFile;
	sBatchFile.Format("%s PcPatr%d",
			  (LPCTSTR)status.getInputMFS()->getAbrev(),
			  status.m_iProcNumber);
	return sBatchFile;
}


CString CPcPatrProcess::getCommandLine(CProcessStatus& status)
{
	// note: the default directory will be set the dir containing the source file
	//       so that doesn't need to be specified

	strstream sout;

	sout << "-a " << status.sANAPath.getShortPath() << ' '; //jdh 2/9/00 changed from: getQuotedPath() ;

	sout << " -o " << m_sOutputANAPath.getQuotedPath() << " "; // !!ANDY ANDY this may be a problem.  Can't just use getShortPath() because that only works if the file exists.  If TonePars can't handle the long quote, then we need to insert a line above this which will make a blank file of the proper name, then we could use getShortPath() safely

	sout << "-g " << m_sGrammarFile.getShortPath() << ' '; //jdh 2/9/00 changed from: getQuotedPath() << ' ';
	sout << "-t " << m_sTakeFile.getShortPath() << ' '; //jdh 2/9/00

	if(status.sANAPath.getShortPath().IsEmpty())
		throw(CProcessFailure(this, "Huh?  There was no ANA file path given to the PcPatr process.  You should look into the log of the previous processor (ample or sentrans) and look for errors, then report this as a bug."));

	sout << " > " <<  m_sLOGPath.getQuotedPath();

	CString s(sout.str(), sout.pcount());
	sout.rdbuf()->freeze(0); // else get a memory leak

	return s;
}



// EXCEPTIONS: CProcessFailure
// TO DO:	clean up error reporting
//			use dialog to say we're busy and give a cancel button
void CPcPatrProcess::processANAFile(CProcessStatus& status)
{
	try
	{
		CString sBase = status.m_sFileNameRoot +"-pcpatr";
		m_sOutputANAPath = status.makeTempPath(sBase,".ana");
		m_sLOGPath = status.makeTempPath(sBase,	".log" );

		m_sOutputANAPath.deleteFile();	// don't care if it is found or not
		m_sLOGPath.deleteFile();	// don't care if it is found or not

		if(!executeTool(status))
		{
			throw(CProcessFailure(this, "Failed to process the file with PcPatr"));
		}

		waitForCompletion(&status, &m_sOutputANAPath);

		// register itx output so the user can view it
		CResultStreamFile* anaStream =
			new CResultStreamFile(
					new CResultStreamDescriptor(this,
									"PC-PATR ANA", //short description
									"ANA Output of PcPatr", // long description
									"PCPATR ANA" // tab label
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
