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
		if(sMarker==_T("-Process"))
			break;
		else
		{
			f->throwParseFailure(_T("ANACountProcess"), sMarker, sField);
		}
	}
}

void CANACountProcess::setDefaultValues()
{
  // there aren't any
}


BOOL CANACountProcess::doEditDialog(int iFunctionCode)
{
		AfxMessageBox(_T("ANACount does not have any properties."));

	return TRUE;
}


LPCTSTR CANACountProcess::getToolPath()
{
	return _T("AnaCount32");
}

CString CANACountProcess::getBatchName(CProcessStatus& status)
{
	CString sBatchFile;
	sBatchFile.Format(_T("%s ANACount%d"),
			  (LPCTSTR)status.getInputMFS()->getAbrev(),
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

	USES_CONVERSION_U8;
	sout << " < " << T2CA(status.sANAPath.getShortPath());
	sout << " > " << T2CA(m_sLOGPath.getQuotedPath()) << ' ';

	if(status.sANAPath.getShortPath().IsEmpty())
		throw(CProcessFailure(this, _T("Huh?  There was no ANA file path given to the ANACount process.  You should look into the log of the previous processor (ample, sentrans, or PC-PATR) and look for errors, then report this as a bug.")));


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



// EXCEPTIONS: CProcessFailure
// TO DO:	clean up error reporting
//			use dialog to say we're busy and give a cancel button
void CANACountProcess::processANAFile(CProcessStatus& status)
{
	try
	{
	  //		CString sBase = status.m_sFileNameRoot +"-anacnt";
		CString sBase;
		sBase.Format(_T("%s%s%d"), (LPCTSTR)status.m_sFileNameRoot,
				 _T("-anacnt"),
				 status.m_iProcNumber);
		m_sLOGPath = status.makeTempPath(sBase,	_T(".log") );

		m_sLOGPath.deleteFile();	// don't care if it is found or not

		if(!executeTool(status))
		{
			throw(CProcessFailure(this, _T("Failed to process the file with ANACount")));
		}

		waitForCompletion(&status, &m_sLOGPath);
		registerLog(status, m_sLOGPath, status.getInputLang());
	}
	catch(CString sError)
	{
		throw(CProcessFailure(this, sError));
	}
}
