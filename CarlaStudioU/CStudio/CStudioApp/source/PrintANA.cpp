// PrintANA.cpp: implementation of the CPrintANAProcess class.
//
// 2.1.0 14-Feb-2000 hab Initial coding
//////////////////////////////////////////////////////////////////////
#include "stdafx.h"
#include "carlastudioapp.h"
#include <strstrea.h>
#include <fstream.h>
#include "CWProcess.h"
#include "SFMFile.h"
#include "DlgEditPrintANA.h"
#include "processOutput.h"
#include "processStatus.h"
#include "parsestream.h"
#include "logwindow.h"
#include "ModelFilesSet.h"

#include "PrintANA.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

IMPLEMENT_DYNCREATE(CPrintANAProcess, CDOSProcess);

CPrintANAProcess::CPrintANAProcess()
:CDOSProcess()
{
	setDefaultValues();
}

CPrintANAProcess::~CPrintANAProcess()
{

}

void CPrintANAProcess::writeToStream(ostream& fout) const
{
	fout << "\\+Process "<< ID() << PROC_ENABLED_STATUS << "\n";
	outputInt(fout, "DisplayBeginColumn", m_nDisplayBeginColumn);
	outputBool(fout, "DisplayAnalysesOnly", m_bDisplayAnalysesOnly);
	USES_CONVERSION;
	fout <<"\\EXEName " << T2CA(m_sEXEName) << '\n';

	fout << "\\-Process "<< ID() << "\n";
}


void CPrintANAProcess::readParametersFromSFMFile(SFMFile *f)
{
	CString sMarker, sField;
	BOOL bEnabled;	// not really used here

	while(f->getField(sMarker, sField, &bEnabled))
	{
		if(sMarker==_T("-Process"))
			break;
		else checkAndReadInt("DisplayBeginColumn", m_nDisplayBeginColumn)
		else checkAndReadBool("DisplayAnalysesOnly", m_bDisplayAnalysesOnly)
		else checkAndReadString("EXEName", m_sEXEName)

		else
		{
			f->throwParseFailure(_T("PrintANAProcess"), sMarker, sField);
		}
	}
}

void CPrintANAProcess::setDefaultValues()
{
	m_nDisplayBeginColumn = 25;
	m_bDisplayAnalysesOnly = FALSE;
	m_sEXEName = _T("PrintANA.exe");
}


BOOL CPrintANAProcess::doEditDialog(int iFunctionCode)
{
	CDlgEditPrintANA dlg;

	// Load in all our settings
	dlg.m_nDisplayBeginColumn = m_nDisplayBeginColumn;
	dlg.m_bDisplayAnalysesOnly = m_bDisplayAnalysesOnly;
	dlg.m_sEXEName = m_sEXEName;

	// put up the dialog
	if(IDOK != dlg.DoModal())
		return FALSE;

	// Reload all our settings if the user clicked 'ok'
	m_nDisplayBeginColumn = dlg.m_nDisplayBeginColumn;
	m_bDisplayAnalysesOnly = dlg.m_bDisplayAnalysesOnly;
	m_sEXEName = dlg.m_sEXEName;

	return TRUE;
}


LPCTSTR CPrintANAProcess::getToolPath()
{
	return m_sEXEName;
}

CString CPrintANAProcess::getBatchName(CProcessStatus& status)
{
	CString sBatchFile;
	sBatchFile.Format(_T("%s PrintANA%d"),
			  (LPCTSTR)status.getInputMFS()->getAbrev(),
			  status.m_iProcNumber);
	return sBatchFile;
}


CString CPrintANAProcess::getCommandLine(CProcessStatus& status)
{
	// note: the default directory will be set the dir containing the source file
	//       so that doesn't need to be specified

	strstream sout;
/*
Usage: %s [-a] [-c col] [-o outf] inf
	-a        output analyses only; no decompositions
	-c col    specifies at which column analyses are to be printed
	-o outf   specify the output file
	   inf    specify the input data file
*/
	USES_CONVERSION_U8;
	ifTrueOutputItem(sout, m_bDisplayAnalysesOnly, "-a ");
	sout << "-c " << m_nDisplayBeginColumn << ' ';
	sout << T2CA(status.sANAPath.getShortPath());
	sout << " > " <<  T2CA(m_sLOGPath.getQuotedPath()) << ' ';

	if(status.sANAPath.getShortPath().IsEmpty())
		throw(CProcessFailure(this, _T("Huh?  There was no ANA file path given to the PrintANA process.  You should look into the log of the previous processor (ample or sentrans) and look for errors, then report this as a bug.")));

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
void CPrintANAProcess::processANAFile(CProcessStatus& status)
{
	try
	{
		CString sBase = status.m_sFileNameRoot +_T("-prtana");
		m_sLOGPath = status.makeTempPath(sBase,	_T(".log") );

		m_sLOGPath.deleteFile();	// don't care if it is found or not

		if(!executeTool(status))
		{
			throw(CProcessFailure(this, _T("Failed to process the file with PrintANA")));
		}

		waitForCompletion(&status, &m_sLOGPath);
		registerLog(status, m_sLOGPath, status.getInputLang());
	}
	catch(CString sError)
	{
		throw(CProcessFailure(this, sError));
	}
}
