// ANACount.cpp: implementation of the CANACountProcess class.
//
// 2.4.5 22-May-2001 hab Initial coding
//////////////////////////////////////////////////////////////////////
#include "stdafx.h"
#include "carlastudioapp.h"
#include <strstrea.h>
#include <fstream.h>
#include "CWProcess.h"
#include "SFMFile.h"
#include "processOutput.h"
#include "processStatus.h"
#include "parsestream.h"
#include "logwindow.h"
#include "ModelFilesSet.h"

#include "ANACount.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_DYNCREATE(CANACountProcess, CDOSProcess);

CANACountProcess::CANACountProcess()
:CDOSProcess()
{
	setDefaultValues();
}

CANACountProcess::~CANACountProcess()
{

}

void CANACountProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process "<< ID() << PROC_ENABLED_STATUS << "\n";
	fout << "\\-Process "<< ID() << "\n";
}


void CANACountProcess::readParametersFromSFMFile(SFMFile *f)
{
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here

	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker=="-Process")
			break;
		else
		{
			f->throwParseFailure("ANACountProcess", sMarker, sField);
		}
	}
}

void CANACountProcess::setDefaultValues()
{
  // there aren't any
}


BOOL CANACountProcess::doEditDialog(int iFunctionCode)
{
		AfxMessageBox("ANACount does not have any properties.");

	return TRUE;
}


const char* CANACountProcess::getToolPath()
{
	return "AnaCount32";
}

CString CANACountProcess::getBatchName(CProcessStatus& status)
{
	CString sBatchFile;
	sBatchFile.Format("%s ANACount%d",
			  status.getInputMFS()->getAbrev(),
			  status.m_iProcNumber);
	return sBatchFile;
}


CString CANACountProcess::getCommandLine(CProcessStatus& status)
{
	// note: the default directory will be set the dir containing the source file
	//       so that doesn't need to be specified

	strstream sout;
/*
Usage: < infile > logfile
*/

	sout << " < " << status.sANAPath.getShortPath();
	sout << " > " << m_sLOGPath.getQuotedPath() << ' ';

	if(status.sANAPath.getShortPath().IsEmpty())
		throw(CProcessFailure(this, "Huh?  There was no ANA file path given to the ANACount process.  You should look into the log of the previous processor (ample, sentrans, or PC-PATR) and look for errors, then report this as a bug."));


	CString s(sout.str(), sout.pcount());
	sout.rdbuf()->freeze(0); // else get a memory leak

	return s;
}



// EXCEPTIONS: CProcessFailure
// TO DO:	clean up error reporting
//			use dialog to say we're busy and give a cancel button
void CANACountProcess::processANAFile(CProcessStatus& status)
{
	try
	{
	  //		CString sBase = status.m_sFileNameRoot +"-anacnt";
		CString sBase;
		sBase.Format("%s%s%d", status.m_sFileNameRoot,
				 "-anacnt",
				 status.m_iProcNumber);
		m_sLOGPath = status.makeTempPath(sBase,	".log" );

		m_sLOGPath.deleteFile();	// don't care if it is found or not

		if(!executeTool(status))
		{
			throw(CProcessFailure(this, "Failed to process the file with ANACount"));
		}

		waitForCompletion(&status, &m_sLOGPath);
		registerLog(status, m_sLOGPath, status.getInputLang());
	}
	catch(CString sError)
	{
		throw(CProcessFailure(this, sError));
	}
}
