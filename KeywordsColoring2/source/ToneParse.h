// ToneParse.h: interface for the CToneParseProcess class.
//
// jdh 2/9/00 added answer file path
// 2.0.5 10-Feb-2000 hab Added -v option to verify control file information
// 2.4.1 01-Nov-2000 hab Reworked to handle TonePars 1.0.0
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_TONEPARSE_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_)
#define AFX_TONEPARSE_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "cwprocess.h"

class SFMFile;
#include <fstream.h>

#ifndef mr270
#include "..\..\CarlaStudio\COMMON CODE\PathDescriptor.h"	// Added by ClassView

#else // mr270
#include "..\..\..\COMMON CODE\PathDescriptor.h"	// Added by ClassView

#endif // mr270



class CToneParseProcess  : public CDOSProcess
{
public:
	DECLARE_DYNCREATE(CToneParseProcess);
	CToneParseProcess();
	virtual ~CToneParseProcess();

	static LPCTSTR ID() {return "TONEPARSEDOS";}
	static LPCTSTR INPUT_TYPE_DISPLAY() {return "Source ANA";}
	static LPCTSTR OUTPUT_TYPE_DISPLAY() {return "Source ANA";}
	virtual LPCTSTR  getProcessorID() const {return ID();}

	virtual void readParametersFromSFMFile(SFMFile *f) ;
	virtual void setDefaultValues();

	// Interface
	virtual LPCTSTR getDisplayName() const { return "TONEPARSE";}
	virtual BOOL doEditDialog(int iFunctionCode);

	// Processing
	virtual PROCESS_FILE_TYPE getInputType() {return ANA;}
	virtual PROCESS_FILE_TYPE getOutputType() {return ANA;}
	virtual void processANAFile(CProcessStatus& status);

	// Disk I/O
	virtual void writeToStream(ostream& fout) const;

protected:
	virtual CString getBatchName(CProcessStatus& status);
	virtual CString getCommandLine(CProcessStatus& status);
	virtual const char* getToolPath();
	void outputSupportFiles(CProcessStatus& status);
	CPathDescriptor m_sLOGPath;
	CPathDescriptor m_sOutputANAPath;
	CPathDescriptor m_sControlFilePath;
	CPathDescriptor m_sCMDPath;
	BOOL m_bVerifyControlFileInformation;
	BOOL m_bTraceToneProcessing;
	BOOL m_bMonitorProgress;
	BOOL m_bCheckMorphnames;
	int m_nTracingLevel;
};

#endif // !defined(AFX_TONEPARSE_H__AA7BDDA0_127E_11D3_8669_8C970CC10000__INCLUDED_)
